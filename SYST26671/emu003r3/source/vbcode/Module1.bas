Attribute VB_Name = "Module1"

' 

' 

'





Option Explicit

Option Base 0 ' #400b7-two_vars=offset#  jic.

' #400b9-radix#
'''' #400b6-radix-16#
'''Global bFLAG_RADIX_16 As Boolean

' #400b9-radix#
Global iRADIX As Integer




Global Const sPREFIX_FOR_LOC_COUNTER_REPLACER = "_location_counter_"

Global lTO_AVOID_ANY_DUPLICATION As Long ' #1175 - I used only random, but that can be not good :) in about 0,1% is still a bad chance...

Global currentLINE As Long ' it's public to allow getting error line when compiling.

Global locationCounter As Long




' 1.20 (was used in evaluator, but not used any more)
Global lLAST_LONG_RESULT_OF_evalExpr As Long


' 1.31#438
Global bUNKNOW_OPERAND_on_evalExpr As Boolean
' #400b7-two_vars=offset# ' Global iVAR_SIZE_on_last_consists_of_Vars As Integer

' #400b7-two_vars=offset# '
Global iVAR_SIZE_on_last_consists_of_SINGLE_VAR_and_Immediates_only As Integer


'#1138 BETTER FIX!
'''' March 12, 2004
'''Global bUpdateStepSpeed As Boolean

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' 1.23#265 (for speed)
'
' These values can be used after calling
' is_number() or is_immediate().
' Global definition allows to skip some checks later.
'
' This value is set, and used by is_number()
' his value will be
' for decimal: 1..10    and   14  !!!  ' #544 added ", 14"
' for hex: 11
' for octal: 12
' for binary: 13
Global lNum_SuffixID As Long
Global Const SUFFIX_ID_HEX = 11
Global Const SUFFIX_ID_OCT = 12
Global Const SUFFIX_ID_BIN = 13
Global Const SUFFIX_ID_DEC = 14 '  #400b9-radix#



' This value is set by is_immediate()
' when expression contains label/proc name or segment:
Global bIS_OFFSET As Boolean
' #400b8-var-label=offset# ' Global bIS_OFFSET_TWO_OR_MORE As Boolean ' #400b7-two_vars=offset#
' #400b8-var-label=offset#  AND NO SQUARE BRACKET, OR VAR AND SMTH ELSE
Global bIS_OFFSET_TWO_OR_MORE_AND_NO_SBRACKET_OR_SMTH_ELSE  As Boolean ' #400b8-var-label=offset#


'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

' 1.18
' is true when to_unsigned_byte()
' converts integer to byte without any problem:
Global bTO_uBYTE_OK As Boolean

' these are used as lPARAM  in get_parameter_from_SYMBOL_TABLE():
'  0 - name
'  1 - offset
'  2 - size
'  3 - type
'  4 - segment
Global Const cGET_NAME = 0
Global Const cGET_OFFSET = 1
Global Const cGET_SIZE = 2
Global Const cGET_TYPE = 3
Global Const cGET_SEGMENT = 4




' returns index when s is one of the following:
' AL   CL   DL   BL   AH   CH   DH   BH
' otherwise returns -1
 Function is_rb(s As String) As Integer  ' 3.27xo minor update....

    Dim i As Integer
 
    For i = 0 To 7
        If StrComp(g_bREGS(i), s, vbTextCompare) = 0 Then
            is_rb = i
            Exit Function
        End If
    Next i
    
    is_rb = -1
End Function

'"m"  means a memory variable or an indexed memory quantity; i.e.,
'    any Effective Address EXCEPT a register.
 Function is_mw(s As String) As Boolean  ' 3.27xo  minor update

    If is_rw(s) <> -1 Or is_rb(s) <> -1 Then
        is_mw = False
        Exit Function
    End If
    
    If is_ew(s) <> -1 Then
        is_mw = True
        Exit Function
    End If
    
    
    ' #327xo-immid-segoverride#
    If Len(s) <> Len(cut_off_segPrefix(s)) Then  ' is there seg prefix?
        is_mw = True
        Exit Function
    End If
    
    
    
    is_mw = False
    
End Function







 ' #327xp-always-match#
 Function is_mb(s As String) As Boolean  ' 3.27xo  minor update
    
    If is_rw(s) <> -1 Or is_rb(s) <> -1 Then
        is_mb = False
        Exit Function
    End If
    
    If is_eb(s) <> -1 Then
        is_mb = True
        Exit Function
    End If
    
    
    ' #327xo-immid-segoverride#
    If Len(s) <> Len(cut_off_segPrefix(s)) Then  ' is there seg prefix?
        is_mb = True
        Exit Function
    End If
    
    is_mb = False
    
End Function


' #327xp-always-match#
 Function is_m(s As String) As Boolean  ' 3.27xo  minor update
    If is_mw(s) Then
        is_m = True
    ElseIf is_mb(s) Then
        is_m = True
    Else
        is_m = False
    End If
 End Function


' returns index when s is one of the following:
' AX   CX   DX   BX   SP   BP   SI   DI
' otherwise returns -1
 Function is_rw(s As String) As Integer  ' 3.27xo  minor update...

    Dim i As Integer
    
    For i = 0 To 7
        If StrComp(g_wREGS(i), s, vbTextCompare) = 0 Then
            is_rw = i
            Exit Function
        End If
    Next i
    
    is_rw = -1
End Function

' returns index when s is one of the following:
' ES   CS   SS   DS
' otherwise returns -1
 Function is_s(ByVal s As String) As Integer

    Dim i

    s = UCase(s)
    
    For i = 0 To 3
        If g_sREGS(i) = s Then
            is_s = i
            Exit Function
        End If
    Next i
    
    is_s = -1
End Function

' 1.23#264
Function is_memory_pointer_reg(ByRef s As String) As Boolean
    
    Select Case UCase(s)
    
    Case "BX", "SI", "DI", "BP"
        is_memory_pointer_reg = True
        
    Case Else
        is_memory_pointer_reg = False
    
    End Select
    
End Function

 Function is_ib(s As String) As Boolean
    Dim expr As Long  '1.32#468 Integer
    Dim sTemp As String ' 1.23
    
    sTemp = s ' 1.23
    
    ' 1.23 #229
    ' #327xq-opt1-cut-ptr# ' If starts_by_BYTE_PTR(sTemp) Then
        
    If starts_by_WORD_PTR(sTemp) Then
        is_ib = False    ' prefix rules!
        GoTo check_done
    End If

    ' #327xq-opt1-cut-ptr#
    sTemp = cut_off_PTR(sTemp)



    If InStr(1, s, sPREFIX_FOR_LOC_COUNTER_REPLACER) > 0 Then '#1189a
        is_ib = True                                          '#1189a
        Exit Function                                         '#1189a
    End If
               


    
    If is_immediate(sTemp, False, iRADIX) Then
        '1.32#468' expr = evalExpr(sTemp)   ' it can be an expression, such as "5*2", or "50000" (should be converted to signed int).
        
        '1.32#468:
        Call evalExpr(sTemp)
        expr = lLAST_LONG_RESULT_OF_evalExpr
        
        If expr >= -128 And expr <= 255 Then
                is_ib = True    ' is byte.
                GoTo check_done  ' 1.23
        End If
    End If
       
    is_ib = False   ' isn't byte (is word!).
    
check_done:
    ' 1.17 - reset any errors that were generated by evalExpr(),
    '        (if any):
    bWAS_ERROR_ON_LAST_EVAL_EXPR = False
End Function

' if number is between -128 ... 127 returns TRUE
 Function is_signed_ib(ByVal s As String) As Boolean
    Dim expr As Integer
    
    If is_immediate(s, False, iRADIX) Then
        expr = evalExpr(s)   ' it can be an expression, such as "5*2", or "50000" (should be converted to signed int).
        If expr >= -128 And expr <= 127 Then
                is_signed_ib = True    ' is byte.
        Else
                is_signed_ib = False   ' is word.
        End If
    Else
        is_signed_ib = False
    End If
    
    ' 1.17 - reset any errors that were generated by evalExpr(),
    '        (if any):
    bWAS_ERROR_ON_LAST_EVAL_EXPR = False
End Function

Function is_iw(s As String) As Boolean
    Dim sTemp As String
    
    sTemp = s
        
    ' 1.23 #229
    If starts_by_BYTE_PTR(sTemp) Then
        is_iw = False       ' prefix rules!
        Exit Function
    ElseIf InStr(1, s, sPREFIX_FOR_LOC_COUNTER_REPLACER) > 0 Then  '#1189
        is_iw = True       ' location counter replacement          '#1189
        Exit Function                                              '#1189
    ' ' #327xq-opt1-cut-ptr# ' ElseIf starts_by_WORD_PTR(sTemp) Then
    Else ' ' #327xq-opt1-cut-ptr#
        sTemp = cut_off_PTR(sTemp)
        ' process futher with the check:
    End If
    
    is_iw = is_immediate(sTemp, False, iRADIX)
    
End Function


' 1.23#264
' before update!
''''''Function is_immediate(s As String) As Boolean
''''''
''''''    ' check if it starts with a number:
''''''
''''''    Dim f As String
''''''
''''''    f = Mid(s, 1, 1)
''''''
''''''    If f Like "#" Or f = "-" Then ' no var starts with a digit, so it's immediate.
''''''        is_immediate = True  ' sure
''''''    ElseIf startsWith(s, "OFFSET ") Then
''''''        is_immediate = True
''''''    Else
''''''        is_immediate = consists_of_Immediates_only(s)
''''''    End If
''''''
''''''End Function



' The purpose of that function is
' to check that the expression consists of
'   digits
'   labels
'   proc names
'   segment names
'
' #400b13-bug-EVALUATION# fix:
' mov al, 4e
'
Function is_immediate(sInput As String, bTREAT_ALL_VALUES_AS_HEX As Boolean, iRad As Integer) As Boolean

On Error GoTo err_iim


' Debug.Print "JJJ:" & sINPUT

   ' 1.23#265
    ' reset global vars (set by is_immediate()/is_number())
    lNum_SuffixID = 0
    bIS_OFFSET = False
    bIS_OFFSET_TWO_OR_MORE_AND_NO_SBRACKET_OR_SMTH_ELSE = False
                
    ' #327xa-debug-bug1#
    If bTREAT_ALL_VALUES_AS_HEX Then
        If Not is_memory_pointer_reg(sInput) Then
            is_immediate = True
            GoTo exit_is_imm ' EXIT!
        End If
    End If
                
                
' #327r-bug-location-counter-eval-3#
' this is just redundant because #327r-bug-location-counter-eval-2# checks it now.

''''
''''    ' let offset care about any possible errors!
''''    ' TODO: check that when there is no varible name
''''    '       for expression that goes after OFFSET:
''''    If startsWith(sINPUT, "OFFSET ") Or InStr(1, sINPUT, " offset ", vbTextCompare) > 0 Then  ' If startsWith(sInput, "OFFSET ") Then
''''        is_immediate = True
''''        GoTo exit_is_imm
''''    End If
''''
''''
''''

    
    
    
    
    
    is_immediate = is_number(sInput, iRADIX)
    ' no need to check any more?
    If is_immediate Then GoTo exit_is_imm
    
    
    
    
' #bug327xd-int21.asm#
' we can:
'        org  100h
'        jmp start
'        t db 1,2,3,4,5,6,7
'        start:
'               mov dx, offset t[2]
'        ret
'''''
'''''    ' cannot have [ ] inside immediate!
'''''    If InStr(1, sINPUT, "[") > 0 Then
'''''        is_immediate = False
'''''        GoTo exit_is_imm
'''''    End If
'''''    If InStr(1, sINPUT, "]") > 0 Then
'''''        is_immediate = False
'''''        GoTo exit_is_imm
'''''    End If
'''''
    
    
    
' #bug327xd-int21.asm-bad-fix#
'  mov cx, [22]
    Dim sBF As String
    sBF = Trim(sInput)
    If Left(sBF, 1) = "[" And Right(sBF, 1) = "]" Then
        sBF = Mid(sBF, 2, Len(sBF) - 2) ' cut off ""
        If is_number(sBF, iRad) Then
            is_immediate = False
            GoTo exit_is_imm
        End If
    End If


    
    
    
    
    '''''''''''''''''''''''''''''
    ' replace all mathematical operators with " "
    ' and then make tokens:
    Dim L As Long
    Dim lLen As Long
    Dim ST As String
    Dim sCL As String
    Dim iT As Integer
    
    sCL = sInput
    L = 1
    lLen = Len(DELIMETERS_EVAL) ' "[" and "]" are already checked (so they do not exist).
    Do While L <= lLen
        ST = Mid(DELIMETERS_EVAL, L, 1)
        L = L + 1
        sCL = Replace(sCL, ST, " ")
    Loop
    
    Dim arrT() As String
    
    arrT = Split(sCL, " ")
    
    lLen = UBound(arrT)
    
    L = 0
    
    Dim iCountVars As Integer
    iCountVars = 0
    
    Do While L <= lLen
    
        If Len(arrT(L)) = 0 Then GoTo next_token ' OK, empty token.
    
        If is_number(arrT(L), iRad) Then GoTo next_token  ' OK, number.
        
        If StrComp(arrT(L), "offset", vbTextCompare) = 0 Then ' OK!!!  #327r-bug-location-counter-eval-2#
            is_immediate = True
            GoTo exit_is_imm
        End If
        
        iT = get_var_size(arrT(L))
        
        ' #400b7-two_vars=offset#  + general optimization with "elseif"
        If iT > 0 Then
            bIS_OFFSET = True
            iCountVars = iCountVars + 1
            ' not sure yet... if only one var, then it's not immidiate.
        ElseIf iT = -1 Then       ' OK, label/proc.
            bIS_OFFSET = True
        ElseIf iT = -5 Then       ' OK, segment.
            bIS_OFFSET = True
        Else
            ' got something wrong, whatever it could be.
            ' get_var_size() returned zero.
            is_immediate = False
            GoTo exit_is_imm
        End If
 
next_token:
        L = L + 1
    Loop
    
    '''''''''''''''''''''''''''''
    
    
    

    
     ' two or more vars = offset!

    If iCountVars = 0 Then
        is_immediate = True
    ElseIf iCountVars = 1 Then
        ' #400b8-var-label=offset#
        If lLen = 0 Then
            is_immediate = False
        Else ' lLen >= 1 (2 or more tokens)
            
            
            ' #2006-09-05-bug# ' If InStr(1, sInput, "[") <= 0 Then
            ' #2006-09-05-bug#   added: and not "+", then can be immidiate, otherwise not.
            If (InStr(1, sInput, "[") <= 0) And (InStr(1, sInput, "+") <= 0) Then ' #2006-09-05-bug#  mov bx, val2 + 1    should be the same as    mov bx, [val2 + 1] (suggested by Alex)
                is_immediate = True
            Else
                is_immediate = False
            End If
            
            
            bIS_OFFSET = True
            bIS_OFFSET_TWO_OR_MORE_AND_NO_SBRACKET_OR_SMTH_ELSE = True
        End If
    Else ' 2 or more vars = single immidiate offset
             ' #400b8-var-label=offset#
             If InStr(1, sInput, "[") <= 0 Then
                is_immediate = True
                bIS_OFFSET = True
                bIS_OFFSET_TWO_OR_MORE_AND_NO_SBRACKET_OR_SMTH_ELSE = True
            Else
                is_immediate = False
                bIS_OFFSET = False
                bIS_OFFSET_TWO_OR_MORE_AND_NO_SBRACKET_OR_SMTH_ELSE = False
            End If
    End If
    
    
exit_is_imm:
    Erase arrT    ' #327xp-erase#

    Exit Function
    
err_iim:
    Debug.Print "is_immediate: " & sInput & ": " & LCase(err.Description)
    is_immediate = False
End Function

' 1.23#264
' should return "True" for any valid POSITIVE! number:
'  1234
'  0451h
'  0123713o
'  101110b
' (just in case I added "ByVal" #1031)
'
' #400b13-bug-EVALUATION# fix
'
Function is_number(ByVal sInput As String, iRad As Integer) As Boolean
On Error GoTo err_in

    Dim L As Long
    Dim sCL As String
    Dim ST As String
    

    
    Dim sMask As String
    Const sHexMask = "0123456789ABCDEF"
    Const sOctalMask = "01234567"
    Const sBinMask = "01"
    
    
    '#1126
    If sInput = "$" Then
        is_number = True
        Exit Function
    End If
    
    
    
    sInput = Replace(sInput, "_", "") ' #1124 MUST GO BEFORE make_normal_hex() !!
    
    sInput = make_normal_hex(sInput) '#1031
    
    

    
    
    ' must start with a decimal digit:
    ST = Mid(sInput, 1, 1)
    If Not (ST Like "#") Then
        is_number = False
        Exit Function
    End If
    
    
    L = Len(sInput)
    
    ' #544 added "d, D"
    
    ' should have decimal digit in the end
    ' or any of these: h, H, o, O, b, B, d, D
    ST = Mid(sInput, L, 1)
    ' NOTE: lNum_SuffixID is global!
    lNum_SuffixID = InStr(1, "0123456789HOBD", ST, vbTextCompare)
    If lNum_SuffixID <= 0 Then
        If iRad = 10 Or iRad = 0 Then ' #400b13-bug-EVALUATION#
            is_number = False  ' #400b14#  should be below if :)
            Exit Function
        Else
            GoTo custom_radix
        End If
    End If
    
    ' remove any suffix:  h, H, o, O, b, B, d, D
    If lNum_SuffixID > 10 Then
        L = L - 1
        sCL = Mid(sInput, 1, L)
    Else
        sCL = sInput  ' no suffix.
    End If
    
    
    
    ' #400b13-bug-EVALUATION#
    If lNum_SuffixID <= 10 Then
        If iRad <> 10 And iRad <> 0 Then
custom_radix:
            If iRad = 2 Then
                lNum_SuffixID = 13
            ElseIf iRad = 16 Then
                lNum_SuffixID = 11
            ElseIf iRad = 8 Then
                lNum_SuffixID = 12
            End If
        End If
    End If
    
    
    Select Case lNum_SuffixID
    
    ' #544 added ", 14"
    Case 1 To 10, 14    ' decimal.
    
        If sCL Like String(L, "#") Then
            is_number = True
            Exit Function
        Else
            is_number = False
            Exit Function
        End If
        
    Case 11 ' hex
        sMask = sHexMask
        
    Case 12 ' octal
        sMask = sOctalMask
        
    Case 13  ' binary
        sMask = sBinMask
        
    End Select

    ' check according to sMask:
    Do While L >= 1
        ST = Mid(sCL, L, 1)
        If InStr(1, sMask, ST, vbTextCompare) <= 0 Then
            is_number = False   ' not valid digit!
            Exit Function
        End If
        L = L - 1
    Loop
    is_number = True   ' check is complete.

    
    Exit Function
err_in:
    Debug.Print "is_number: " & sInput & ": " & LCase(err.Description)
    is_number = False
End Function


Function is_var(ByVal s As String) As Boolean
    Dim f As String
    
    
    
    
    If s = "" Then
        is_var = False
        Exit Function
    End If
    

    
    
    If startsWith(s, "OFFSET ") Then
        is_var = False
        Exit Function
    End If
    

    
    
    f = Mid(s, 1, 1)
    
    ' no var starts with a digit or "-",
    ' and if it does (5+var1 it's legal in MASM),
    ' then there should be a variable inside:
    If (f Like "#" Or f = "-") Then
        If Not is_Var_inside(s) Then
            is_var = False
            Exit Function
        End If
    End If

    ' if it's a register then it's not a variable:
    If is_rw(s) <> -1 Or is_rb(s) <> -1 Or is_s(s) <> -1 Then
        is_var = False
        Exit Function
    End If
















    ' \\\\\\\\\\\\\\\\\\\\\\ cut off "BYTE PTR"/"WORD PTR" (if any)
    '\\\\\\\\\\\\\\\\\\\\\\\ cut of "CS:DS:SS:ES"
    s = cut_off_PTR(s)
    
    ' #327xo-immid-segoverride#
    Dim lOldSLen As Long
    lOldSLen = Len(s)
    
    s = cut_off_segPrefix(s)
    
    ' #327xo-immid-segoverride#
    If Len(s) <> lOldSLen Then ' was seg prefix?
        'If is_immediate(s) Then   ' I think check is not requred.
            s = "[" & s & "]"
        'End If
    End If
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    
    

    

    ' #400b7-two_vars=offset#
       If consists_of_SINGLE_VAR_and_Immediates_only(s) Then
            is_var = True
            Exit Function
       End If

        
    
    

    
    is_var = False
    
End Function


' #400b7-two_vars=offset#
' THIS SHOULD BE USED NOW INSTEAD OF consists_of_Vars_and_Immediates_only()

Function consists_of_SINGLE_VAR_and_Immediates_only(sPARAMETER As String) As Boolean
    Dim ts As String
    Dim L As Long
    Dim GOT_VAR As Boolean
    Dim tsize As Integer

    Dim bGOT_NUMBER As Boolean
    bGOT_NUMBER = False
    
    ' if each var has offset then there are no vars, but immidiates only and we must return false.
    ' #400b7-two_vars=offset# ' Dim iOFFSET_FLAG_COUNTER As Integer
    ' #400b7-two_vars=offset# ' iOFFSET_FLAG_COUNTER = 0
    Dim iVAR_NUM_COUNTER As Integer
    iVAR_NUM_COUNTER = 0
    
    
    ' #400b8-var-label=offset-NEW_BUG#
    Dim iIMMIDIATE_NUM_COUNTER As Integer
    iIMMIDIATE_NUM_COUNTER = 0
    
    
    
    GOT_VAR = False
    
    
    ' #400b7-two_vars=offset#
    ' general optimization of original consists_of_Vars_and_Immediates_only()
    ' here we will use VB's function to get tokes.
    Dim sTemp As String
    sTemp = sPARAMETER
    For L = 1 To Len(DELIMETERS_ALL)
        Dim sChar As String
        sChar = Mid(DELIMETERS_ALL, L, 1)
        sTemp = Replace(sTemp, sChar, " ")
    Next L
    
    
    Dim tmpARRAY() As String
    tmpARRAY = Split(sTemp, " ")
    
    L = 0       '       Split size 0 = 1 element.
    
    Do While L <= UBound(tmpARRAY)
        ts = tmpARRAY(L)
        L = L + 1
       
        If ts <> "" Then
            tsize = get_var_size(ts)
            
            ' #400b8-var-label=offset# ' If tsize > 0 Then
            ' #400b8-var-label=offset-NEW_BUG# ' If tsize <> 0 Then ' #400b8-var-label=offset#
            If tsize > 0 Then ' #400b8-var-label=offset-NEW_BUG#  RETURN AS IT WAS!
                GOT_VAR = True
                iVAR_NUM_COUNTER = iVAR_NUM_COUNTER + 1
            ElseIf tsize < 0 Then
                iIMMIDIATE_NUM_COUNTER = iIMMIDIATE_NUM_COUNTER + 1
            End If
                
            ' #400b7-two_vars=offset# '  If LCase(ts) = "offset" Then iOFFSET_FLAG_COUNTER = iOFFSET_FLAG_COUNTER + 1
            
            If (tsize = 0) Then
                If Not is_immediate(ts, False, iRADIX) Then
                    iVAR_SIZE_on_last_consists_of_SINGLE_VAR_and_Immediates_only = False ' it can be register or something unknown.
                    Exit Function
                Else                       ' #400b19terrible#
                    bGOT_NUMBER = True      ' #400b19terrible#
                End If
            End If
            
            ' #400b19terrible# ' ???? ' support for MOV [020], AL
             ' #400b19terrible# ' If is_around(sPARAMETER, "[", "]") Then
              ' #400b19terrible# '    If is_number(Mid(sPARAMETER, 2, Len(sPARAMETER) - 2), iRADIX) Then ' #400b7-two_vars=offset# probably it should be here.
             ' #400b19terrible# '         bGOT_NUMBER = True
             ' #400b19terrible# '     End If
            ' #400b19terrible# '  End If
        End If
        
    Loop
    
    
   ' Debug.Print "sparameter: " & sPARAMETER
    
    ' return true if there was at least one var, or number in brackets - address:
    If GOT_VAR Or bGOT_NUMBER Then
        ' probably that isn't used... instead similar check is put to get_var_size()... but i'll keep the code.
        ' #400b7-two_vars=offset# ' If (iVAR_NUM_COUNTER <= iOFFSET_FLAG_COUNTER) And Not bGOT_NUMBER Then '
        If iVAR_NUM_COUNTER > 1 Then ' #400b7-two_vars=offset#  all ingenious is simple.
            iVAR_SIZE_on_last_consists_of_SINGLE_VAR_and_Immediates_only = 0 ' offset is not a var! it's immidiate! it has no size.
            consists_of_SINGLE_VAR_and_Immediates_only = False
        Else
            ' #400b8-var-label=offset-NEW_BUG#
            If iIMMIDIATE_NUM_COUNTER = 0 Then
                ' keep variable size in global var:
                iVAR_SIZE_on_last_consists_of_SINGLE_VAR_and_Immediates_only = tsize
                consists_of_SINGLE_VAR_and_Immediates_only = True
            Else
                ' #400b8-var-label=offset-NEW_BUG#
                iVAR_SIZE_on_last_consists_of_SINGLE_VAR_and_Immediates_only = 0 ' offset is not a var! it's immidiate! it has no size.
                consists_of_SINGLE_VAR_and_Immediates_only = False
            End If
        End If
    Else
        iVAR_SIZE_on_last_consists_of_SINGLE_VAR_and_Immediates_only = 0 ' offset is not a var! it's immidiate! it has no size.
        consists_of_SINGLE_VAR_and_Immediates_only = False
    End If
    
    
    ' Free Memory....
    Erase tmpARRAY
    
    
End Function




' 1.23#264
'       I decided to remove consists_of_Immediates_only() function,
'       and use only is_immediate(), the purpose of that function will
'       be to check that the expression consists of digits and/or labels/proc names
'       only!





 Function is_Var_inside(s As String) As Boolean
  
    ' no need in any token separation because
    ' get_var_size() supports expressions!
    
    If (get_var_size(s) > 0) Then
        is_Var_inside = True
    Else
        is_Var_inside = False
    End If

End Function

 Function is_ew(sSource As String) As Integer
    Dim i_var_size As Integer
    Dim s As String ' 1.30
    
    ' 1.30#414
    s = cut_off_segPrefix(sSource)
    

    ' prefix rules:
    If starts_by_BYTE_PTR(s) Then
        is_ew = -1
        Exit Function
    End If
    
    
    ' #327xo-immid-segoverride#  not equal after cut_off_segPrefix()
    If Len(s) <> Len(sSource) Then
        is_ew = 6 ' index of "d16 (simple var)"
        Exit Function
    End If
        
    
    

    If is_var(s) Then
    
        
            ' check size of var:
            If Not starts_by_WORD_PTR(s) Then  ' prefix rules.
                ' 1.19#107 improving!
                i_var_size = get_var_size(s)
                If STRICT_SYNTAX Then ' #327xp-always-match#
                    If i_var_size <> 2 Then   ' Word size is 2.
                        If i_var_size <> 0 Then ' 1.19 in case it is zero, the size of the variable may be unknown (example: MOV BX, [232h]).
                            is_ew = -1
                            Exit Function
                        End If
                    End If
                Else                  ' #327xp-always-match#
                    If i_var_size = 1 Then  ' #327xq-is_eb_ew# ONLY IF IT BYTE RETURN FALSE!
                        is_ew = -1
                        Exit Function
                    End If
                End If
            End If
            
        
        
        
        is_ew = 6 ' index of "d16 (simple var)"
        Exit Function
        
    End If

    'Dim arr As Variant
    Dim i As Integer


    ' 1.31#438
    ' just to prevent using any old data:
    ' #400b7-two_vars=offset# ' iVAR_SIZE_on_last_consists_of_Vars = 0
    iVAR_SIZE_on_last_consists_of_SINGLE_VAR_and_Immediates_only = 0 ' #400b7-two_vars=offset#
    
    

    ' make sure s will be in some kind of general syntax:
    s = makeGeneralEA(s)


    ' 1.31#438
    If bUNKNOW_OPERAND_on_evalExpr Then
        bUNKNOW_OPERAND_on_evalExpr = False ' #327xp-very-weird#
        'Debug.Print "unknow operand on is_ew: " & s
        is_ew = -1
        Exit Function
    End If





    If STRICT_SYNTAX Then      ' #327xp-always-match#
        ' 1.31#438
        '#327r-bug-location-counter-eval-3-b# added: And Not (InStr(1, sSource, "offset ", vbTextCompare) > 0)
        ' #327r-bug-location-counter-eval-3-b# not ideal, because it may not check var such as "varroffset " but the chance of it is less than chance of "mov ax, [bx]+offset m"    "m db 7"
       ' #400b7-two_vars=offset# ' If iVAR_SIZE_on_last_consists_of_Vars = 1 And Not (InStr(1, sSource, "offset ", vbTextCompare) > 0) Then
        If iVAR_SIZE_on_last_consists_of_SINGLE_VAR_and_Immediates_only = 1 And Not (InStr(1, sSource, "offset ", vbTextCompare) > 0) Then
            Dim sTest As String
            sTest = cut_off_segPrefix(sSource)
            If Not starts_by_WORD_PTR(sTest) Then ' 1.31#438c
                ' byte variable, and no "word ptr", so not ew!
                is_ew = -1
                Exit Function
            End If
        End If
    End If                      ' #327xp-always-match#







    ' 1.23 for speed we may skip the check if s="":
    If Len(s) = 0 Then GoTo not_ew

    For i = 0 To 31
       If g_EA_T_ROW_w(i) = s Then
            is_ew = i
            Exit Function
       End If
    Next i

not_ew:
    is_ew = -1

End Function

' the same as "is_ew" function, except some 8 bit registers in the end
 Function is_eb(sSource As String) As Integer
    Dim i_var_size As Integer
    Dim s As String  ' 1.30
    
    ' 1.30#414
    s = cut_off_segPrefix(sSource)
    
    
    ' if there is "word    ptr"  (no matter how many spaces between operands)
    ' then, it's surely not a byte. and if it's not a byte then it's a WORD
    ' so there is no check in is_ew().
    If starts_by_WORD_PTR(s) Then
        is_eb = -1
        Exit Function
    End If
    
    

    ' #327xq-opt1#  not equal after cut_off_segPrefix()
    If Len(s) <> Len(sSource) Then
        is_eb = 6 ' index of "d16 (simple var)"
        Exit Function
    End If
    
    
    
    
    
    If is_var(s) Then
        
        
       
            ' check size of var:
            If Not starts_by_BYTE_PTR(s) Then   ' prefix rules.
                i_var_size = get_var_size(s)
                
                If STRICT_SYNTAX Then ' #327xp-always-match#
                
                    If i_var_size <> 1 Then    ' Byte size is 1.
                        If i_var_size <> 0 Then ' can be MOV BL, [108h]
                            is_eb = -1
                            Exit Function
                        End If
                    End If
                    
                Else                  ' #327xp-always-match#
                
                    If i_var_size = 2 Then  ' #327xq-is_eb_ew# ONLY IF IT WORD RETURN FALSE!
                        is_eb = -1
                        Exit Function
                    End If
                
                End If
          End If
        
        
        is_eb = 6 ' index of "d16 (simple var)"
        Exit Function
        
    End If
    
    'Dim arr As Variant
    Dim i As Integer

    ' 1.31#438
    ' just to prevent using any old data:
    ' #400b7-two_vars=offset# ' iVAR_SIZE_on_last_consists_of_Vars = 0
    iVAR_SIZE_on_last_consists_of_SINGLE_VAR_and_Immediates_only = 0 ' #400b7-two_vars=offset#
    

    ' make sure s will be in some kind of general syntax:
    's = UCase(makeGeneralEA(s))
    s = makeGeneralEA(s)
    

    ' 1.31#438
    If bUNKNOW_OPERAND_on_evalExpr Then
        bUNKNOW_OPERAND_on_evalExpr = False ' #327xp-very-weird#
        'Debug.Print "unknow operand on is_eb: " & s
        is_eb = -1
        Exit Function
    End If
    
    
    If STRICT_SYNTAX Then      ' #327xp-always-match#
        ' 1.31#438
        ' #400b7-two_vars=offset# ' If iVAR_SIZE_on_last_consists_of_Vars = 2 Then
        If iVAR_SIZE_on_last_consists_of_SINGLE_VAR_and_Immediates_only = 2 Then ' #400b7-two_vars=offset#
            Dim sTest As String
            sTest = cut_off_segPrefix(sSource)
            If Not starts_by_BYTE_PTR(sTest) Then ' 1.31#438c
                ' word variable, and no "byte ptr", so not eb!
                is_eb = -1
                Exit Function
            End If
        End If
    End If                    ' #327xp-always-match#


    For i = 0 To 31
       If g_EA_T_ROW_b(i) = s Then
            is_eb = i
            Exit Function
       End If
    Next i

    is_eb = -1

End Function

' #1050d
Function get_var_segment(ByVal s As String) As String

    s = Trim(UCase(s))
    
    '--------- check in SYMBOL TABLE:
    Dim curLine As Long

    curLine = 0
    Do While (curLine < primary_symbol_TABLE_SIZE)

        If primary_symbol_TABLE(curLine).sName = s Then
            
            get_var_segment = primary_symbol_TABLE(curLine).sSegment
            Exit Function
        End If
        curLine = curLine + 1
    Loop
    '---------
  
          
    ' should not normally get here
    
    Debug.Print "wrong parameter calling get_var_segment: " & s
    get_var_segment = 0
End Function

' on first pass it always returns a zero!!!
 Function get_var_offset(ByVal s As String, Optional bDO_EVAL_EXPR As Boolean = True) As Integer

    
    ' \\\\\\\\\\\\\\\\\\\\\\ cut off "BYTE PTR"/"WORD PTR"
    '\\\\\\\\\\\\\\\\\\\\\\\ cut of "CS:DS:SS:ES"
    s = cut_off_PTR(s)
    s = cut_off_segPrefix(s)
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    ' 1.23 no need to do it in loop:
    s = UCase(s)
    
    '--------- check in SYMBOL TABLE:
    Dim curLine As Long
    ' 1.23#217 Dim sTMP As String
    curLine = 0
    Do While (curLine < primary_symbol_TABLE_SIZE)  ' 1.23#217  frmMain.lst_Symbol_Table.ListCount)
        ' 1.23#217 sTMP = frmMain.lst_Symbol_Table.List(curLine)
        ' 1.23#217 If UCase(getNewToken(sTMP, 0, " ")) = s Then
        If primary_symbol_TABLE(curLine).sName = s Then
            get_var_offset = to_signed_int(primary_symbol_TABLE(curLine).lOFFSET)      ' 1.23#217 Val("&H" & getNewToken(sTMP, 1, " ", True))
            Exit Function
        End If
        curLine = curLine + 1
    Loop
    '---------
  
    ' bugfix1.23#242
    ' prevent recursive calling from evalExpr() !!!!
    If bDO_EVAL_EXPR Then
        '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        ' this checks if s is something like:
        ' var1[100]
        ' [100]
        ' [var1+var2+55]  - wrong syntax for MASM, but I see no reason why I cannot add one var offset to another.
        get_var_offset = evalExpr(s)
        '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        Exit Function
    End If
            
            
            
            
            
    ' #327xo-immid-segoverride-2#
    ' new errors appear in debug window, but this is better than wrong machine code.
    ' not sure why bDO_EVAL_EXPR is false, but this should fix it:
    get_var_offset = independent_eval(s)
    Exit Function

    
            
            
    ' #327xo-immid-segoverride-2#
    ' never gets here!
            
            
            
            
            
            
    ' 1.23#242
    Debug.Print "wrong parameter calling get_var_offset: " & s
    get_var_offset = 0
End Function


' #327xo-immid-segoverride-2#
' when evalExpr() is too busy we can use this function:
' this one evals single number only!
' should work both for POSITIVE  and NEGATIVE.
Function independent_eval(s As String) As Integer
On Error GoTo err1
        
        Dim operand As String
        operand = s
               
        Dim sSuffix As String
        Dim sPrefix2 As String ' 2 chars for hex, ie:  0x1234
        Dim sPrefix3 As String ' 3 chars for hex, ie:  -0x1234
        
        sSuffix = UCase(Mid(operand, Len(operand), 1))
        sPrefix2 = UCase(Mid(operand, 1, 2))
        sPrefix3 = UCase(Mid(operand, 1, 3))
        
        Dim tl As Long
        
        ' copied from evalExpr() with big simplifications

        If sPrefix2 = "0X" Or sPrefix2 = "-0X" Or sSuffix = "H" Then
            operand = Replace(operand, "_", "")
            tl = to_unsigned_long(Val("&H" & make_normal_hex(operand)))
        ElseIf sSuffix = "B" Then
            operand = Replace(operand, "_", "")
            tl = bin_to_long(operand)
        ElseIf sSuffix = "O" Then
            operand = Replace(operand, "_", "") ' #1124
            tl = to_unsigned_long(Val("&O" & operand))
        Else
            operand = Replace(operand, "_", "") ' #1124
            If operand = "$" Then ' #1126
                tl = locationCounter ' #1126
            Else
                tl = Val(operand) ' seems to be decimal.
            End If
        End If


        independent_eval = to_signed_int(tl)
        
        ' printing warning because previously get_var_offset() was doing this
        Debug.Print "[warning] independent_eval fix: " & s

Exit Function
err1:
Debug.Print "err independent_eval: " & s & "   " & err.Description
independent_eval = 0

End Function


' gets number (in HEX string format), and returns only low bits
 Function get_W_LowBits_STR(ByVal s As String) As String
    Dim sRes As String
    
    s = make_min_len(s, 4, "0")

    ' using len() because instead of FFFF form number may be in FFFFFFFF... form.
    sRes = Mid(s, Len(s) - 1, 2) ' last two digits, are the LS digits.

    get_W_LowBits_STR = sRes
End Function

' gets number (in HEX string format), and returns only high bits
 Function get_W_HighBits_STR(ByVal s As String) As String
 On Error Resume Next ' 4.00-Beta-3
    Dim sRes As String
    
    s = make_min_len(s, 4, "0")
    
    sRes = Mid(s, Len(s) - 3, 2) ' first two digits, are the MS digits.

    get_W_HighBits_STR = sRes
End Function

 Function make_min_len(s As String, minLen As Integer, sAddWhat As String) As String
 On Error Resume Next ' 4.00-Beta-3
 
    Dim i As Integer
    Dim sRes As String
    
    i = 0
    sRes = s
    
    If Len(sAddWhat) > 0 Then ' jic 3.27xm
        While Len(sRes) < minLen
            sRes = sAddWhat & sRes
        Wend
    End If
    
    make_min_len = sRes
    
End Function

' #327xm-listing#
Function make_min_len_RIGHT(s As String, minLen As Integer, sAddWhat As String) As String
    Dim i As Integer
    Dim sRes As String
    
    i = 0
    sRes = s
    
    If Len(sAddWhat) > 0 Then ' jic
        While Len(sRes) < minLen
            sRes = sRes & sAddWhat
        Wend
    End If
    
    make_min_len_RIGHT = sRes
End Function

 Function getTableEA_byte(ByVal sTAB As String, ByVal sRow As String) As Byte
    Dim iTab As Integer
    Dim iRow As Integer
    
    If sTAB = "" Or sRow = "" Then
       Debug.Print "getTableEA_byte() called with empty parameter! line:" & currentLINE + 1
       getTableEA_byte = 0
       Exit Function
    End If
       
    iTab = getTabIndex(sTAB)
    If iTab = -1 Then Exit Function ' error printed by getTabIndex().
    
    iRow = getRowIndex(sRow)
    If iRow = -1 Then Exit Function ' error printed by getRowIndex().
    
    getTableEA_byte = gEA_TABLE_BT(iTab, iRow)
    
End Function

' OPTIMIZED, arrays defined globally on start.
' returns number from 0 to 7, or -1 in case of error
 Function getTabIndex(ByVal sTAB As String) As Integer

'    s  =     ES   CS   SS   DS
'    rb =     AL   CL   DL   BL   AH   CH   DH   BH
'    rw =     AX   CX   DX   BX   SP   BP   SI   DI
'    digit=    0    1    2    3    4    5    6    7

    Dim i As Integer

    sTAB = UCase(sTAB)

    For i = 0 To 7
        If g_EA_TCAP_rb(i) = sTAB Or g_EA_TCAP_rw(i) = sTAB Or g_EA_TCAP_digit(i) = sTAB Then
            getTabIndex = i
            Exit Function
        End If
    Next i

    For i = 0 To 3
        If g_EA_TCAP_s(i) = sTAB Then
            getTabIndex = i
            Exit Function
        End If
    Next i

    ' normally shouldn't get here

    Debug.Print "Wrong sTab param in getTabIndex call: " & sTAB

    getTabIndex = -1

End Function

' NOT OPTIMIZED
'''' case sensitive!!!
'''' use makeGeneralEA() to get correct values
'''Public Function getRowIndex(ByRef sRow As String) As Integer
'''
'''    Dim ROW1, subROW2
'''    ROW1 = Array("[BX + SI]", "[BX + DI]", "[BP + SI]", "[BP + DI]", "[SI]", "[DI]", "d16 (simple var)", "[BX]", "[BX + SI] + d8", "[BX + DI] + d8", "[BP + SI] + d8", "[BP + DI] + d8", "[SI] + d8", "[DI] + d8", "[BP] + d8", "[BX] + d8", "[BX + SI] + d16", "[BX + DI] + d16", "[BP + SI] + d16", "[BP + DI] + d16", "[SI] + d16", "[DI] + d16", "[BP] + d16", "[BX] + d16", "ew=AX", "ew=CX", "ew=DX", "ew=BX", "ew=SP", "ew=BP", "ew=SI", "ew=DI")
'''    subROW2 = Array("eb=AL", "eb=CL", "eb=DL", "eb=BL", "eb=AH", "eb=CH", "eb=DH", "eb=BH")
'''
'''    Dim i As Integer
'''
'''    For i = 0 To 31
'''        If sRow = ROW1(i) Then
'''            getRowIndex = i
'''            Exit Function
'''        End If
'''    Next i
'''
'''    ' eb=xxx and ew=xxx are on the same row (correction made):
'''
'''    For i = 0 To 7
'''        If sRow = subROW2(i) Then
'''            getRowIndex = i + 24    ' correction for sub row.
'''            Exit Function
'''        End If
'''    Next i
'''
'''End Function

' OPTIMIZED
' case sensitive!!!
' use makeGeneralEA() to get correct values
 Function getRowIndex(ByRef sRow As String) As Integer
    
    Dim i As Integer
    
    For i = 0 To 31
        If sRow = g_EA_T_ROW_w(i) Then
            getRowIndex = i
            Exit Function
        End If
    Next i
    
    ' check eb=xxx (these have the same values as ew=xxx):
    
    For i = 24 To 31
        If sRow = g_EA_T_ROW_b(i) Then
            getRowIndex = i
            Exit Function
        End If
    Next i
    
    ' normally shouldn't get here

    Debug.Print "Wrong sRow param in getRowIndex call: " & sRow

    getRowIndex = -1
    
End Function


'
' #735 making updates for wrong addressing modes.
' this may result in slower processing, but we need
' to catch wrong addressing no matter what.
Function makeGeneralEA(ByRef s As String) As String ' 1.23 no need in ByVal!

'    If s = "a" Then Stop
'    If s = "b" Then Stop

    If is_rw(s) <> -1 Then
        makeGeneralEA = "ew=" & UCase(s)
        Exit Function
    End If
    
    If is_rb(s) <> -1 Then
        makeGeneralEA = "eb=" & UCase(s)
        Exit Function
    End If
    
    If is_var(s) Then
        makeGeneralEA = s
        Exit Function
    End If
    
    Dim number As Integer
    Dim result As String

    
    number = evalExpr(s)
    result = ""
    
    
    ' 1.23#244
    ' speeding up, no need to check if we have a single
    ' decimal number (it would be nice for hex and other number
    ' to skip the check, but it's hard to implement):
    If CStr(number) = s Then
        makeGeneralEA = ""
        Exit Function
    End If
    
    
    ' 1.23#244
    ' declare some flags instead of checking the same things
    ' several times:
    Dim b_BX As Boolean
    Dim b_SI As Boolean
    Dim b_DI As Boolean
    Dim b_BP As Boolean
   
    If number <> 0 Then

        If is_signed_ib(number) Then
            
            b_BX = IIf(SingleWord_NotInsideQuotes_InStr(s, "BX") > 0, True, False)
            b_SI = IIf(SingleWord_NotInsideQuotes_InStr(s, "SI") > 0, True, False)
            
            
            If b_BX And b_SI Then
                result = "[BX + SI] + d8"
                GoTo result_set
            End If
            
            
            b_DI = IIf(SingleWord_NotInsideQuotes_InStr(s, "DI") > 0, True, False)
            
            
            If b_BX And b_DI Then
                result = "[BX + DI] + d8"
                GoTo result_set
            End If
            
            
            b_BP = IIf(SingleWord_NotInsideQuotes_InStr(s, "BP") > 0, True, False)
            
            
            If b_BP And b_SI Then
                result = "[BP + SI] + d8"
                
            ElseIf b_BP And b_DI Then
                result = "[BP + DI] + d8"
                
            ElseIf b_SI Then
                result = "[SI] + d8"
                
            ElseIf b_DI Then
                result = "[DI] + d8"
    
            ElseIf b_BP Then
                result = "[BP] + d8"
                
            ElseIf b_BX Then
                result = "[BX] + d8"
    
            End If
            
        Else  ' NOT is_signed_ib(number)
        
            b_BX = IIf(SingleWord_NotInsideQuotes_InStr(s, "BX") > 0, True, False)
            b_SI = IIf(SingleWord_NotInsideQuotes_InStr(s, "SI") > 0, True, False)
            
            b_DI = IIf(SingleWord_NotInsideQuotes_InStr(s, "DI") > 0, True, False)
            
            b_BP = IIf(SingleWord_NotInsideQuotes_InStr(s, "BP") > 0, True, False)
            
            If b_BX And b_SI Then
                result = "[BX + SI] + d16"
                GoTo result_set
            End If
            
            
            If b_BX And b_DI Then
                result = "[BX + DI] + d16"
                GoTo result_set
            End If
                
                
                
            If b_BP And b_SI Then
                result = "[BP + SI] + d16"
                
            ElseIf b_BP And b_DI Then
                result = "[BP + DI] + d16"
                
            ElseIf b_SI Then
                result = "[SI] + d16"
                
            ElseIf b_DI Then
                result = "[DI] + d16"
    
            ElseIf b_BP Then
                result = "[BP] + d16"
                
            ElseIf b_BX Then
                result = "[BX] + d16"
    
            End If
        End If
        
    Else   ' number == 0
    
        b_BX = IIf(SingleWord_NotInsideQuotes_InStr(s, "BX") > 0, True, False)
        b_SI = IIf(SingleWord_NotInsideQuotes_InStr(s, "SI") > 0, True, False)
    
        b_DI = IIf(SingleWord_NotInsideQuotes_InStr(s, "DI") > 0, True, False)
             
        b_BP = IIf(SingleWord_NotInsideQuotes_InStr(s, "BP") > 0, True, False)
        
        If b_BX And b_SI Then
            result = "[BX + SI]"
            GoTo result_set
        End If
            
   
        If b_BX And b_DI Then
            result = "[BX + DI]"
            GoTo result_set
        End If

        
        If b_BP And b_SI Then
            result = "[BP + SI]"
            
        ElseIf b_BP And b_DI Then
            result = "[BP + DI]"
            
        ElseIf b_SI Then
            result = "[SI]"
            
        ElseIf b_DI Then
            result = "[DI]"

        ElseIf b_BX Then
            result = "[BX]"
            
        ' 2.03#523
        ' there is no such EA: [BP], only [BP] + ??
        ElseIf b_BP Then
            result = "[BP] + d8"

        End If
        
    End If ' of "(If number <> 0)"
    

result_set:
       
    
    ' bugfix1.23#263 - reset any errors that were generated
    ' by evalExpr(),  (if any):
    bWAS_ERROR_ON_LAST_EVAL_EXPR = False
  
  
   ' #735
   If b_BX And b_BP Then
         frmInfo.addErr currentLINE, "[BX] cannot go with [BP] - wrong addressing!", ""
         'frmMain.bCOMPILING = False ' not required ? without it, it shows all errors, so it's better.
   End If
   If b_SI And b_DI Then
        frmInfo.addErr currentLINE, "[SI] cannot go with [DI] - wrong addressing!", ""
        'frmMain.bCOMPILING = False' not required ? without it, it shows all errors, so it's better.
   End If
    
    
    makeGeneralEA = result

End Function

' returns TRUE when there is something between "" or ''
 Function is_str(s As String) As Boolean

' 1.23#266
''    If (startsWith(s, "'") Or startsWith(s, """")) And _
''       (endsWith(s, "'") Or endsWith(s, """")) Then
       
    ' 1.23#266
    If is_around(s, "'", "'") Or is_around(s, """", """") Then
       
        is_str = True
       
    Else
    
        is_str = False
    
    End If
    
End Function

' returns the SUM of ASCII codes of chars in string, this way:
' "AA" = 4141h   - this is how it's done by MASM/TASM.
' string cannot be more then 2 chars (inside quotation marks)
' (see also: process_byte_str())
 Function sum_str(s As String) As Integer
    Dim sum As Integer
    Dim ts As String
    
    If Len(s) >= 3 And Len(s) <= 4 And is_str(s) Then
        ts = Mid(s, 2, 1) ' get first char.
        sum = myAsc(ts)
        
        ts = Mid(s, 3, 1) ' get second char (if there is).
        If ts <> "'" And ts <> """" Then
            sum = sum * 256 ' shift left by 16.
            sum = sum + myAsc(ts)
        End If
        
        sum_str = sum
    Else
        sum_str = 0
        ' 1.22 #184
        frmInfo.addErr currentLINE, "cannot convert to 16 bit value: " & s, s
        Debug.Print "Wrong parameter in sum_str(): " & s
    End If
End Function

' replace any strings in operand to numbers:
' 1.30 ByVal removed (was not used)!
 Function replace_str_if_any(s As String) As String
    Dim iStart As Long
    Dim iLen As Long
    Dim sQM_TYPE As String ' contains " or ' (type of string)
    Dim ts As String
    Dim Size As Long
    Dim i As Long
    Dim bReadingStr As Boolean
    Dim sStr As String
    Dim sResult As String
    
    sResult = ""
    i = 1
    bReadingStr = False
    Size = Len(s)
    
    While i <= Size
        ts = Mid(s, i, 1)
           
        If (bReadingStr = False) And (ts = "'" Or ts = """") Then
            sQM_TYPE = ts
            bReadingStr = True
            sStr = ""
            iStart = i
            iLen = 0    ' reset it.
        End If
        
        If bReadingStr Then
            sStr = sStr & ts
            iLen = iLen + 1
        Else
            sResult = sResult & ts
        End If
        
        If (iLen > 1) And (bReadingStr = True) And (sQM_TYPE = ts) Then
            sQM_TYPE = "" ' not required, just to make some order.
            bReadingStr = False
            sResult = sResult & sum_str(sStr)
        End If
        
        i = i + 1
    Wend
    
    replace_str_if_any = sResult

End Function

' 1.30
' replace any strings in operand to bytes or words,
' used in frmVars.
' this function is a modified copy of replace_str_if_any() function.
Function replace_BIG_STRINGS_if_any(s As String, bConvertTOBytes As Boolean) As String
    Dim iStart As Long
    Dim iLen As Long
    Dim sQM_TYPE As String ' contains " or ' (type of string)
    Dim ts As String
    Dim Size As Long
    Dim i As Long
    Dim bReadingStr As Boolean
    Dim sStr As String
    Dim sResult As String
    
    sResult = ""
    i = 1
    bReadingStr = False
    Size = Len(s)
    
    While i <= Size
        ts = Mid(s, i, 1)
           
        If (bReadingStr = False) And (ts = "'" Or ts = """") Then
            sQM_TYPE = ts
            bReadingStr = True
            sStr = ""
            iStart = i
            iLen = 0    ' reset it.
        End If
        
        If bReadingStr Then
            sStr = sStr & ts
            iLen = iLen + 1
        Else
            sResult = sResult & ts
        End If
        
        If (iLen > 1) And (bReadingStr = True) And (sQM_TYPE = ts) Then
            sQM_TYPE = "" ' not required, just to make some order.
            bReadingStr = False
            sResult = sResult & convert_string_to_array(sStr, bConvertTOBytes)
        End If
        
        i = i + 1
    Wend

    replace_BIG_STRINGS_if_any = sResult

End Function

' 1.30
' converts strings (of any length) to array of numbers
' when bConvertTOBytes=False converting to array of WORDS!
Function convert_string_to_array(sInput As String, bConvertTOBytes As Boolean) As String

Dim L As Long
Dim sResult As String
Dim ts As String
Dim bAddComma As Boolean

bAddComma = False

sResult = "0"  ' starting zero, just in case first is hex letter.

' string is inside "" or '' so they're not counted:
For L = 2 To Len(sInput) - 1

    ts = Mid(sInput, L, 1)
    
    sResult = sResult & make_min_len(Hex(myAsc(ts)), 2, "0")

    If bConvertTOBytes Then  ' always add ", "
        sResult = sResult & "h, 0"
    ElseIf bAddComma Then
        sResult = sResult & "h, 0"
    End If
    
    ' used only when bConvertTOBytes=False
    bAddComma = Not bAddComma
Next L
 
' cut off the last comma:
If endsWith(sResult, ", 0") Then
    sResult = Mid(sResult, 1, Len(sResult) - 3)
End If
 
' for converting to word array when string has
' odd number of chars:
If Mid(sResult, Len(sResult), 1) <> "h" Then
    sResult = sResult & "h"
End If
 
convert_string_to_array = sResult

End Function


' 1.20 This function is completely recoded!!!!
'      from now on I'm using analysis() function.
'      This function uses analysis() function for
'      all math calculations. The mission of evalExpr()
'      is to convert the expression to a valid form:
'      (in general leave only decimal numbers and math operators)
'  I decided to replace "Dim sum As Long" with
'                       "Dim sExpr As String" and
'    instead of trying to calculate, I will just make
'    a correct expression that will be evaluated by
'    analysis() in the end.
'
'  I artificially limited the return by Integer,
'  analysis() supports Long type, or even C++ float (though
'  I should update the DLL for that).
'
' The processing is very compilcated here, because all the
' code was copied from evalExpr_old() that did all math
' by itself.
'
' #327xa-debug-must-assume-that-all-input-is-hex# - bTREAT_ALL_VALUES_AS_HEX added.
Function evalExpr(ByRef sInput As String, Optional bTREAT_ALL_VALUES_AS_HEX As Boolean = False) As Integer
 On Error GoTo err_eexp ' 1.23#260
 
    Dim i As Integer
    Dim ts As String
    Dim tl As Long
    Dim Size As Integer
    Dim operator As String
    Dim operand As String
    
    ' 1.20
    Dim sExpr As String

    ' gets "true" when at least something to
    ' evaluated correctly:
    Dim bGOT_SOMETHING As Boolean
    bGOT_SOMETHING = False
    
    bUNKNOW_OPERAND_on_evalExpr = False
    
    sExpr = ""
    Size = Len(sInput)
    i = 1
    ts = ""
    operand = ""
    operator = " " ' 1.20 "+"  ' default
    
    Do While True
        
        ts = Mid(sInput, i, 1) ' If start is greater than the number of characters in string, Mid returns a zero-length string ("").
      
        If (InStr(1, " " & DELIMETERS_EVAL, ts) > 0) Or (i > Size) Then
        
          If operand <> "" Then
                
                
                If StrComp(operand, "offset", vbTextCompare) = 0 Then
                    ' simply skip the "offset ":
                    
                    
                    ' #327r-bug-location-counter-eval#
                    ' I hope there won't be any bad consequences of this fix...
                    ' !!!!!!!!! THERE ARE!!!!! #bug327xd-int21.asm# !!!!!!!!! but not here.... I suppose...
                    ' fixing: ? evalExpr("10-offset 6")
                    ' should be the same result as for: ? evalExpr("10- offset 6")
                    If Trim(operator) <> "" Then
                        sExpr = sExpr & " " & operator & " "
                    End If


                    ' ignore:
                    operand = ""
                    operator = ""
                
                
                ElseIf is_var(operand) Then
                
                    tl = get_var_offset(operand, False)  ' bugfix1.23#242 don't allow recursive evalExpr()!!!
                    
                    bGOT_SOMETHING = True
                    
                ElseIf is_immediate(operand, bTREAT_ALL_VALUES_AS_HEX, iRADIX) Then
                    
                    ' 1.23#265
                    ' lNum_SuffixID and bIS_OFFSET are
                    ' set by is_number() it is
                    ' called by is_immediate()
                    
                    
                    If bTREAT_ALL_VALUES_AS_HEX Then           ' #327xq-call-dw-debug#  make separate and do not normalise
                        operand = Replace(operand, "_", "")
                        If InStr(1, operand, ".") > 0 Then ' #327xq-call-dw-debug#   do not evaluate "Dw." = 13 !
                            tl = 0
                        Else

                            ' #400b4-mini-8-b#    jic, let it be.
                            If Len(operand) > 4 Then
                                operand = Mid(operand, Len(operand) - 3) ' get 4 last chars only. we do not process values over "FFFF" (I hope that's better).
                            End If
                            
                            tl = to_unsigned_long(Val("&H" & operand))
                        End If
                        
                    ' 1.23#265 If endsWith(operand, "H") Then
                    ElseIf lNum_SuffixID = SUFFIX_ID_HEX Then
                        operand = Replace(operand, "_", "") ' #1124
                        ' 1.32#468b to_unsigned_long() added:
                        ' #1031 make_normal_hex() added:
                        tl = to_unsigned_long(Val("&H" & make_normal_hex(operand)))
                    ' 1.23#265 ElseIf endsWith(operand, "B") Then
                    ElseIf lNum_SuffixID = SUFFIX_ID_BIN Then
                        operand = Replace(operand, "_", "") ' #1124
                        tl = bin_to_long(operand)
                    ' 1.23#265 ElseIf endsWith(operand, "O") Then
                    ElseIf lNum_SuffixID = SUFFIX_ID_OCT Then
                        operand = Replace(operand, "_", "") ' #1124
                        ' 1.32#468c to_unsigned_long() added:
                        tl = to_unsigned_long(Val("&O" & operand))
                        
                    ElseIf lNum_SuffixID = SUFFIX_ID_DEC Then ' #400b9-radix#  need to know for sure!
                        tl = Val(operand)
                        
                        
                    ' 1.23#265  ElseIf (get_var_size(operand) = -1) Or (get_var_size(operand) = -5) Then ' -1 is for Label, -5 is for SEGMENT.
                    ElseIf bIS_OFFSET Then
                        ' #400b7-two_vars=offset# DO EVAL IF TWO OR MORE
                        tl = get_var_offset(operand, bIS_OFFSET_TWO_OR_MORE_AND_NO_SBRACKET_OR_SMTH_ELSE)   ' get offset of a Label/Segment.
                        
                    
                    Else ' NO SUFFIX or UNKNOWN SUFFIX
                        operand = Replace(operand, "_", "") ' #1124
                        If operand = "$" Then ' #1126
                            tl = locationCounter ' #1126
                        Else
                                ' #400b9-radix#
                                '''''                            If bFLAG_RADIX_16 Then '  #400b6-radix-16#
                                '''''                                tl = Val("&H" & operand)
                                '''''                            Else
                                '''''                                tl = Val(operand) ' seems to be decimal.
                                '''''                            End If
                                If iRADIX = 0 Or iRADIX = 10 Then ' decimal (default).
                                    tl = Val(operand)
                                ElseIf iRADIX = 16 Then
                                    tl = Val("&H" & operand)
                                ElseIf iRADIX = 2 Then
                                    tl = bin_to_long(operand & "b")
                                ElseIf iRADIX = 8 Then
                                    tl = Val("&O" & operand)
                                Else                              ' weird radix
                                    Debug.Print "wrong radix: " & iRADIX
                                    tl = Val(operand) '  probably decimal...
                                End If
                        End If
                        
                    End If
                                    
                    bGOT_SOMETHING = True
                    
                ' 1.23#264 ElseIf is_rw(operand) <> -1 Then
                ElseIf is_memory_pointer_reg(operand) Then
                
                    ' ignore:
                    operand = ""
                    operator = ""
                
                    bGOT_SOMETHING = True
    

                    

                
                Else
                
                    operand = UCase(operand)
                    Select Case operand
                    Case "BYTE", "WORD", "PTR", "W.", "B.", "CS", "DS", "SS", "ES", "CS:", "DS:", "SS:", "ES:", ":"
                    Case Else
                        bUNKNOW_OPERAND_on_evalExpr = True
                    End Select
                    
                    ' generate an error if it's not a valid input
                    ' for a validation, though we do not generate an
                    ' error for those word registers that could not be
                    ' used in indexing
                    ' Debug.Print "Error in evalExpr(): " & operand
                    ' (IT COULD BE ERROR, but could be just a check call
                    ' this function is called to check is_ib())
                    
                    ' ignore:
                    operand = ""
                    operator = ""
                                        
                End If
                
                
                ' create a valid math expression for analysis():
                Select Case operator
                Case "+", " ", "[", "]" ' plus is default for all.
                    If Len(sExpr) > 0 Then
                        If operator = " " Then ' 1.29#406
                            sExpr = sExpr & " " & tl
                        Else
                            sExpr = sExpr & "+" & tl
                        End If
                    Else
                        sExpr = tl
                    End If
                    
                ' not very nice for "<<" and ">>":
                Case "-", "*", "/", "(", ")", "^", "~", "%", "&", "|", "<", ">"
                    sExpr = sExpr & operator & tl
                    
'                Case "" ' 1.29#403
'                    If Len(sExpr) > 0 Then
'                        sExpr = sExpr & " " & tl
'                    Else
'                        sExpr = tl
'                    End If
                    
                End Select
                
                operator = ""   ' calculation made, so reset.
                
          End If ' end of (If operand <> "").
                        
            
          If i > Size Then Exit Do  ' evaluated!!!!!
        
          ' make sure it will make right calculation
          ' for: "10 - 5", "10 * 3" etc (when operator is in spaces).
          ' operators: +, -, *, / are always more important then " ", [, ]

          ' 1.29#403 [" " & ] added:
          If (InStr(1, " " & DELIMETERS_EVAL, ts) > 0) Then '1.29#398b (don't see reason for check)' Or Len(operator) = 0 Then ' 1.23 (speed) operator = "" Then
            'Debug.Print "curop: " & operator

            ' 1.20 keep previous operator:
            '   this is done to fix this problem:
            '   ? evalexpr("10 * -2")
            If Len(operator) > 0 Then ' 1.29 speed' operator <> "" Then
                
                 ' 1.29#398
                 If operator = "]" Then
                    operator = "+"
                 ElseIf operator = "[" Then
                    operator = "+"
                 End If
                    
                 sExpr = sExpr & " " & operator & " "
                 
                 'no need set below' operator = "" ' 1.29#398  - I think it's required because it's already added.
            End If

            operator = ts
            'Debug.Print "setop: " & operator
          End If

          operand = ""
          
        Else

            operand = operand & ts
            
        End If
                
        i = i + 1
    Loop

    If Not bGOT_SOMETHING Then
        bWAS_ERROR_ON_LAST_EVAL_EXPR = True
    End If
    
    ' 1.20
    ' because of the way we do the processing,
    ' last ")" may not be included in earlier operations:
    If operator = ")" Then
        sExpr = sExpr & ")"
    End If
    
    
    ' 2.07#555
    ' I wasn't able to find a better way to fix it:
    sExpr = Trim(sExpr)
    Do While endsWith(sExpr, "+")
        sExpr = Mid(sExpr, 1, Len(sExpr) - 1)
        sExpr = Trim(sExpr)
    Loop
    
    
    Dim result As Long
        
    ' 1.20
    result = analysis(sExpr)
    
    ' Debug.Print "analized: "; sINPUT; " as: "; sExpr
    
    lLAST_LONG_RESULT_OF_evalExpr = result
    
    ' Debug.Print "evalExpr: " & sInput & "<   " & sExpr & " = " & result & ", " & to_signed_int(result)
    
    

    ' If result > -32768 And result < 65536 Then
    ' BUG FIX: 2005-05-21 (overflow on compile!)
    If result >= -32768 And result < 65536 Then
        evalExpr = to_signed_int(result)
    Else
        bWAS_ERROR_ON_LAST_EVAL_EXPR = True
    End If


    
    
    Exit Function
err_eexp:
    Debug.Print "evalExpr: " & sInput & ": " & LCase(err.Description), err.number
    bWAS_ERROR_ON_LAST_EVAL_EXPR = True
    evalExpr = 0
    
End Function





' 1.23
' this function does not check the binary number for correct
' syntax, it maybe 01034b and you'll get some result...

' IMPORTANT: it is assumed that number ends with "b" letter!!!
'
' converts binary number to integer.
' 0101b -> 5
 Function bin_to_long(ByRef sBIN As String) As Long
On Error GoTo error_bin2lng

    Dim Size As Long
    Dim L As Long
    Dim iPower As Integer
    ' 1.04
    ' LONG replaced with CURRENCY, because this caused a problem:
    ' "MOV DX, 10010010100100101001001010010010b"
    ' well, I know why I got this problem DX has 16 bits not 32 :) anyway...
    Dim sum As Currency
    Dim r As Currency
    
    sum = 0
    iPower = 0
    
    Size = Len(sBIN) - 1 ' last char is a "b" so, it's skipped.
        
    For L = Size To 1 Step -1
        r = Mid(sBIN, L, 1)
        r = r * (2 ^ iPower)
        sum = sum + r
        iPower = iPower + 1
    Next L
    
    bin_to_long = to_signed_long_from_currency(sum)

    Exit Function
error_bin2lng:
    Debug.Print "Error on bin_to_long(" & sBIN & "), " & LCase(err.Description)
End Function

' 1.23 - I'm not sure when I stopped using this function.
''''' I WILL REPLACE THE USE OF THIS FUNCTION WITH: evalExpr().
''''' only sums all numbers in string, for example:
''''' "bx 51 -1" = 50
''''' "bx 51-1"  = 51  (because "-" isn't a stop char...)
''''' "bx 51*2" = 51   (the same...)
''''' "bx var1+1" = fine.
''''' if there is no number returns 0
'''' Function extractNumber(ByRef s As String) As Integer
''''   Dim i As Long
''''   Dim Size As Integer
''''   Dim ts As String
''''   Dim sum As Integer
''''
''''   Size = Len(s)
''''   i = 0
''''   sum = 0
''''
''''   Do While True
''''
''''        ts = getToken(s, i, " ][+" & vbTab)
''''
''''        If ts = Chr(10) Then Exit Do
''''
''''        If is_var(ts) Then
''''            sum = sum + get_var_offset(ts)
''''        ElseIf is_immediate(ts) Then
''''            If endsWith(ts, "h") Then
''''                sum = sum + Val("&H" & ts)
''''            Else
''''                sum = sum + Val(ts)
''''            End If
''''        End If
''''
''''
''''
''''        i = i + 1
''''   Loop
''''
''''   extractNumber = sum
''''
''''   'Debug.Print ">>>" & sum
''''
''''End Function

' makes an integer to be a BYTE (unsigned):
 Function to_unsigned_byte(i As Integer) As Byte

    bTO_uBYTE_OK = True ' 1.18
    
    If i >= -128 And i <= 255 Then
        If i >= 0 Then
            to_unsigned_byte = i
        Else
            to_unsigned_byte = 256 + i
        End If
    Else
        to_unsigned_byte = 0
        bTO_uBYTE_OK = False ' 1.18
        Debug.Print currentLINE & ": Wrong param calling to_unsigned_byte(): " & i
    End If
End Function

' 3.27xq
Function can_be_16bit(L As Long) As Boolean
    If L >= -32768 And L < 65536 Then
        can_be_16bit = True
    Else
        can_be_16bit = False
    End If
End Function

' makes a long to be a SIGNED integer:
 Function to_signed_int(L As Long) As Integer
 On Error GoTo err1 ' #3.27xk jic
    If L >= -32768 And L < 65536 Then
       If L <= 32767 Then
            to_signed_int = L
       Else
            to_signed_int = L - 65536 '-(65536 - l)
       End If
    Else
       ' #400b22-org-8000# ' to_signed_int = 65535 ' 4.00-Beta-4  I decided to return the maximum when it's overflow.
       ' #400b22-org-8000#  it's a signed Int don't you forget....
       
      
       If L < -32768 Then
            to_signed_int = CInt(L + 65536)
       Else
            to_signed_int = CInt(L - 65536)
       End If
       
       
       Debug.Print "#400b22-org-8000# to_signed_int() corrected " & L & "  to  " & to_signed_int
    End If
    Exit Function
err1:
    Debug.Print "critical error on to_signed_int: " & err.Description
End Function

' 1.04
 Function to_signed_long_from_currency(cu As Currency) As Long
    If cu > -2147483648# And cu < 4294967296# Then
        If cu <= 2147483647# Then
            to_signed_long_from_currency = cu
        Else
            to_signed_long_from_currency = cu - 4294967296#
        End If
    Else
        to_signed_long_from_currency = 0
        Debug.Print "Wrong param calling to_signed_long_from_currency(" & cu & ")"
    End If
End Function

' makes a byte to be a SIGNED byte (integer is used to keep the sign):
 Function to_signed_byte(b As Byte) As Integer
        If b <= 127 Then
            to_signed_byte = b
        Else
            to_signed_byte = b - 256
        End If
End Function

 Function to_unsigned_long(i As Integer) As Long
    If i >= 0 Then
        to_unsigned_long = i
    Else
        to_unsigned_long = i + 65536
    End If
End Function

' 1.04
 Function to_unsigned_single(L As Long) As Single
    If L >= 0 Then
        to_unsigned_single = L
    Else
        to_unsigned_single = CSng(L) + 4294967296#
    End If
End Function


' 1.04
' makes a long to be a SIGNED integer:
 Function to_signed_currency_by_long(cu As Currency) As Currency
    If cu <= 2147483647 Then
        to_signed_currency_by_long = cu
    Else
        to_signed_currency_by_long = cu - 4294967296#
    End If
End Function


' if there is "word    ptr"  (no matter how many spaces between operands)
' then, it's surely not a byte. and if it's not a byte then it's a WORD
' so there is no check in is_ew().
' assumed there are no tabs inside the string!!!!
' EXAMPLES: (returns true)
'    "    word     ptr [bx], 5"
'    "word ptr[bx], 5"
' 1.20 added support for "W."
'
' assumed that input is trimmed!
 Function starts_by_WORD_PTR(ByRef s As String) As Boolean
 ' 1.23#237 update!
 
'''    Dim ts1 As String
'''    Dim ts2 As String
'''
'''    ts1 = getToken(s, 0, " [")
'''    ts2 = getToken(s, 1, " [")
'''
'''    If (UCase(ts1) = "WORD") And (UCase(ts2) = "PTR") Then
'''        starts_by_WORD_PTR = True
'''    Else
'''        ' 1.20 support for "W."
'''        If startsWith(s, "W.") Then
'''            starts_by_WORD_PTR = True
'''        Else
'''            starts_by_WORD_PTR = False
'''        End If
'''    End If
'''


    If startsWith(s, "W.") Then
        starts_by_WORD_PTR = True
    ElseIf startsWith(s, "WORD ") Then ' works both for "WORD " and "WORD PTR".
        starts_by_WORD_PTR = True
    ElseIf startsWith(s, "WORD[") Then ' for "WORD[".
        starts_by_WORD_PTR = True
    Else
        starts_by_WORD_PTR = False
    End If

    
End Function

' the same as starts_by_word_ptr()
' but for:
' "BYTE PTR"
' "B."
' "BYTE "
' assumed that input is trimmed!
 Function starts_by_BYTE_PTR(ByRef s As String) As Boolean
 
' 1.23#237 update!

''''    Dim ts1 As String
''''    Dim ts2 As String
''''
''''    ts1 = getToken(s, 0, " [")
''''    ts2 = getToken(s, 1, " [")
''''
''''    If (UCase(ts1) = "BYTE") And (UCase(ts2) = "PTR") Then
''''        starts_by_BYTE_PTR = True
''''    Else
''''        ' 1.20 support for "B."
''''        If startsWith(s, "B.") Then
''''            starts_by_BYTE_PTR = True
''''        Else
''''            starts_by_BYTE_PTR = False
''''        End If
''''    End If


    If startsWith(s, "B.") Then
        starts_by_BYTE_PTR = True
    ElseIf startsWith(s, "BYTE ") Then  ' works both for "BYTE " and "BYTE PTR".
        starts_by_BYTE_PTR = True
    ElseIf startsWith(s, "BYTE[") Then  ' for "BYTE[".
        starts_by_BYTE_PTR = True
    Else
        starts_by_BYTE_PTR = False
    End If

End Function

' cut off "BYTE PTR"/"WORD PTR"
' assumed that input is trimmed!
' #327xq-opt1-cut-ptr#  RENAMED FROM:   Function cut_off_b_w_ptr(ByVal s As String) As String
Function cut_off_PTR(sOrig As String) As String

On Error GoTo err1

    Dim s As String
    s = sOrig

' #400b4-terrible#
''''
''''    If InStr(1, s, "ptr", vbTextCompare) > 0 Then
''''        s = Replace(s, "byte", "", 1, -1, vbTextCompare)
''''        s = Replace(s, "word", "", 1, -1, vbTextCompare)
''''        s = Replace(s, "dword", "", 1, -1, vbTextCompare)
''''        s = Replace(s, "ptr", "", 1, -1, vbTextCompare)
''''    End If

    ' #400b4-terrible# fix:   Also updating count to 1 for all instead of "-1" (all)
    Dim L1 As Long
    Dim L2 As Long
    L2 = InStr(1, s, " ptr", vbTextCompare)
    If L2 > 0 Then
        L1 = InStr(1, s, "byte ", vbTextCompare)
        If L1 > 0 And L1 < L2 Then
            s = Replace(s, "byte ", "", 1, 1, vbTextCompare)
            s = Replace(s, "ptr", "", 1, 1, vbTextCompare)
            GoTo done_cut_ptr
        End If
        
        L1 = InStr(1, s, "word ", vbTextCompare)
        If L1 > 0 And L1 < L2 Then
            s = Replace(s, "word ", "", 1, 1, vbTextCompare)
            s = Replace(s, "ptr", "", 1, 1, vbTextCompare)
            GoTo done_cut_ptr
        End If
        
        L1 = InStr(1, s, "dword ", vbTextCompare)
        If L1 > 0 And L1 < L2 Then
            s = Replace(s, "dword ", "", 1, 1, vbTextCompare)
            s = Replace(s, "ptr", "", 1, 1, vbTextCompare)
            GoTo done_cut_ptr
        End If
    End If
    
    
    If InStr(1, s, ".") > 0 Then
        s = Replace(s, " b.", "", 1, 1, vbTextCompare)
        s = Replace(s, " w.", "", 1, 1, vbTextCompare)
        s = Replace(s, " dw.", "", 1, 1, vbTextCompare)
        
        ' #400b20-w.-ptr-UPPER_CASE_DOES_NOT_WORK#    StrComp() instead of =
        Dim s2 As String
        s2 = Left(s, 2)
        If StrComp(s2, "b.", vbTextCompare) = 0 Then
            s = Mid(s, 3)
        ElseIf StrComp(s2, "w.", vbTextCompare) = 0 Then
            s = Mid(s, 3)
        ElseIf StrComp(s2, "dw.", vbTextCompare) = 0 Then
            s = Mid(s, 3)
        End If
    End If
    
    
done_cut_ptr:
    cut_off_PTR = Trim(s)
    

Exit Function
err1:
    Debug.Print "err 82:" & err.Description
    cut_off_PTR = sOrig


' #327xq-opt1-cut-ptr#
'''''
'''''
'''''    ' 1.30#416
'''''    ' optimized for speed!!!
'''''
'''''    Dim s2 As String
'''''    Dim s5 As String
'''''
'''''    s2 = Mid(s, 1, 2)
'''''    s5 = Mid(s, 1, 5)
'''''    s2 = UCase(s2)
'''''    s5 = UCase(s5)
'''''
'''''    If s2 = "B." Then
'''''        s = Mid(s, 3)
'''''        GoTo cut_done ' no need to check for " PTR" (no such syntax).
'''''    ElseIf s2 = "W." Then
'''''        s = Mid(s, 3)
'''''        GoTo cut_done ' no need to check for " PTR" (no such syntax).
'''''    ElseIf s5 = "BYTE " Then
'''''        s = Mid(s, 6)
'''''    ElseIf s5 = "WORD " Then
'''''        s = Mid(s, 6)
'''''    ElseIf s5 = "BYTE[" Then
'''''        s = Mid(s, 5)
'''''        GoTo no_need_to_trim
'''''    ElseIf s5 = "WORD[" Then
'''''        s = Mid(s, 5)
'''''        GoTo no_need_to_trim
'''''    End If
'''''
'''''
'''''
'''''    ' need to cut off " PTR" if any:
'''''    s = Trim(s)
'''''
'''''    Dim s4 As String
'''''    s4 = Mid(s, 1, 4)
'''''    s4 = UCase(s4)
'''''
'''''    If s4 = "PTR " Then
'''''         s = Mid(s, 5)
'''''    ElseIf s4 = "PTR[" Then
'''''         s = Mid(s, 4)
'''''         GoTo no_need_to_trim
'''''    End If
'''''
'''''
'''''
'''''
'''''cut_done:
'''''
'''''    ' required, in case "BYTE PTR    [99]":
'''''    cut_off_b_w_ptr = Trim(s)
'''''    Exit Function
'''''
'''''no_need_to_trim:
'''''    cut_off_b_w_ptr = s
    
End Function

' assumed no TABS!
 Function cut_off_segPrefix(ByRef s As String) As String
    Dim ts As String
    
    '1.30#415
    'ts = UCase(getToken(s, 0, " :"))
        
    ts = UCase(getNewToken(s, 0, ":"))
    ts = Trim(ts)
    
    
    If (ts = "CS") Or (ts = "DS") Or (ts = "SS") Or (ts = "ES") Then
        
        ts = Trim(Mid(s, 3))

        If (Mid(ts, 1, 1) = ":") Then
            cut_off_segPrefix = Trim(Mid(ts, 2))
            Exit Function
        End If
    End If
    
    cut_off_segPrefix = s
    
End Function





' returns the size of the variable:
' Byte: 1
' Word: 2
' Double Word: 4
' Label: (-1)    - OFFSET (not variable)!
' Segment: (-5)  - OFFSET (not variable)!
' is name doesn't exist in Symbol Table returns zero!
'
' (this function can be used instead of is_in_Symbol_Table())
 Function get_var_size(ByVal s As String) As Integer
    Dim curLine As Long
    ' 1.23#217 Dim sTMP As String
    Dim sVarName As String
    
    s = UCase(s)
    
    s = cut_off_segPrefix(s)
    
    If Trim(s) = "" Then
        get_var_size = 0
        Exit Function
    End If
    
    curLine = 0
    
    Do While (curLine < primary_symbol_TABLE_SIZE)  ' 1.23#217 frmMain.lst_Symbol_Table.ListCount)
        ' 1.23#217 sTMP = frmMain.lst_Symbol_Table.List(curLine)
                
        ' 3.27xp trim added....  related to #327xp-makeit#   327xp-makeit.asm I've seen there spaces for some reason....
        sVarName = Trim(primary_symbol_TABLE(curLine).sName)   ' 1.23#217 UCase(getNewToken(sTMP, 0, " "))
                
               
        If StrComp(sVarName, s) = 0 Then ' 3.27xp  they seem to be all uppercased.
            ' general case: mov ax, var1
            get_var_size = primary_symbol_TABLE(curLine).iSize   ' 1.23#217 getNewToken(sTMP, 2, " ")
            Exit Function
        Else
            ' complex case: mov ax, var1[2]
            Dim i As Long ' can be integer.
            Dim ts As String
            
            i = 0
            
            Do While True
                ts = getToken(s, i, DELIMETERS_ALL) '" []+-*/")
                
                If (ts = Chr(10)) Then Exit Do
                
                        ' #327r-bug-location-counter-eval-3-b#
                        If LCase(ts) = "offset" Then
                            get_var_size = 0
                            Exit Function
                        End If
                
                        If (sVarName = ts) Then
                            ' general case: mov ax, var1
                            get_var_size = primary_symbol_TABLE(curLine).iSize   ' 1.23#217 Val(getNewToken(sTMP, 2, " "))
                            Exit Function
                        End If
                
                i = i + 1
            Loop
            
        End If
        
        curLine = curLine + 1
    Loop
    
    get_var_size = 0
    
End Function

' returns 1 in case number is more then zero,
' and 0 in case number is <= 0:
 Function int_to_sg(num As Integer) As Integer
    If num > 0 Then
        int_to_sg = 1
    Else
        int_to_sg = 0
    End If
End Function



' 1.22
' bugfix#194
Function get_parameter_from_SYMBOL_TABLE(ByRef sInput As String, ByRef lParam As Long) As String
    Dim curLine As Long
    ' 1.23#217  Dim sTMP As String
    Dim sVarName As String
    Dim sPROC_NAME As String
    
    sPROC_NAME = sInput
    
    sPROC_NAME = UCase(sPROC_NAME)
    
    sPROC_NAME = cut_off_segPrefix(sPROC_NAME)
    
    If Trim(sPROC_NAME) = "" Then
        get_parameter_from_SYMBOL_TABLE = ""
        ' no such procedure!
        LCase(err.Description) = "empty parameter!##"
        GoTo error_on_gpt
    End If
    
    curLine = 0
    
    Do While (curLine < primary_symbol_TABLE_SIZE)  ' 1.23#217  frmMain.lst_Symbol_Table.ListCount)
        ' 1.23#217 sTMP = frmMain.lst_Symbol_Table.List(curLine)
                
        sVarName = primary_symbol_TABLE(curLine).sName  ' 1.23#217 UCase(getNewToken(sTMP, 0, " "))
                
               
        If (sVarName = sPROC_NAME) Then
            ' lPARAM can be:
            '  0 - name
            '  1 - offset
            '  2 - size
            '  3 - type
            '  4 - segment
            Select Case lParam
            
            Case 0
                get_parameter_from_SYMBOL_TABLE = primary_symbol_TABLE(curLine).sName
            Case 1
                get_parameter_from_SYMBOL_TABLE = primary_symbol_TABLE(curLine).lOFFSET
            Case 2
                get_parameter_from_SYMBOL_TABLE = primary_symbol_TABLE(curLine).iSize
            Case 3
                get_parameter_from_SYMBOL_TABLE = primary_symbol_TABLE(curLine).sType
            Case 4
                get_parameter_from_SYMBOL_TABLE = primary_symbol_TABLE(curLine).sSegment
            Case Else
                LCase(err.Description) = "no such parameter: " & lParam
                GoTo error_on_gpt
            End Select
            ' 1.23#217 get_parameter_from_SYMBOL_TABLE = getNewToken(sTMP, lParam, " ", True)
            Exit Function
        End If
        
        curLine = curLine + 1
    Loop
    
    Debug.Print "get_parameter_from_SYMBOL_TABLE: not found>" & sPROC_NAME
    
    Exit Function
    
error_on_gpt:
    get_parameter_from_SYMBOL_TABLE = ""
    Debug.Print "get_parameter_from_SYMBOL_TABLE: " & sPROC_NAME & " " & LCase(err.Description)
    
End Function

' #1031
' this function converts HEX numbers such as:
' 0x00F
' to more common type (as excepted by all versions of emu8086 before v 3.12e)
' 000Fh
' - #1177c. allow &H prefix for hexadecimals too! :) no! & is "AND" operator,
' this code will not work: mov al, 0110_1011b &  1101_1110b
'
Public Function make_normal_hex(ByVal sInput As String) As String
On Error GoTo err1
   
    If LCase(Left(sInput, 2)) = "0x" Then
       If Right(sInput, 1) = "h" Then  ' it can be also "0x01h" (intuitively)
            make_normal_hex = "0" & Mid(sInput, 3)
       Else
            make_normal_hex = "0" & Mid(sInput, 3) & "h"
       End If
       Exit Function ' return!
    End If
    
''''    '#1177c - visual basic style hex:
''''    If LCase(Left(sInput, 2)) = "&h" Then
''''       If Right(sInput, 1) = "h" Then  ' it can be also "&H01h" (intuitively)
''''            make_normal_hex = "0" & Mid(sInput, 3)
''''       Else
''''            make_normal_hex = "0" & Mid(sInput, 3) & "h"
''''       End If
''''       Exit Function ' return!
''''    End If
''''
    
    make_normal_hex = sInput ' unchanged.
    
    Exit Function
err1:
    make_normal_hex = sInput
    Debug.Print "ERROR on make_normal_hex(" & sInput & ") - " & LCase(err.Description)
End Function

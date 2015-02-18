Attribute VB_Name = "mDefinition"

' 

' 

'



Option Explicit

' #327xd-duplicate-segment#
Global lUNNAMED_SEGMENT_COUNTER As Long



Global bDO_EVENTS As Boolean ' #1069b - when processing is too heavy this one helps to show that the program is working and not hang up.

Dim bFLAG_UNTERMINATED_STRING As Boolean ' #1064


' used to check the match of PROC/ENDP:
Global lCurProc_LINE_NUM As Long ' 1.28#358b
Global sCurProcName As String
' used to replace RET with RETF if required (when PROC is FAR):
Global sCurProcType As String
' used to check the entry generation & match of SEGMENT/ENDS:
Global sCurSegName As String
Global lCurSegStart As Long
Global sCurSegClass As String

Global sTITLE As String ' just a title of a program.
Global sNamePR As String ' #1188 similar to title but shorter, probably a filename.

 Sub process_EQU(ByVal s As String, lCurLine As Long)
    
    Dim sName As String
    Dim i As Long
    
    sName = getNewToken(s, 0, " ") ' get name before "EQU".
    
    If Mid(sName, 1, 1) Like "#" Then
        frmInfo.addErr lCurLine, cMT("EQU cannot start with a number."), sName
        frmInfo.set_current_text_cool cMT("error!")
        Exit Sub
    End If
    
    ' cut off "(name) EQU ":
    i = InStr(1, s, " EQU ", vbTextCompare)
    s = Trim(Mid(s, i + Len(" EQU ")))
    
    If (UCase(sName) = UCase(s)) Then
        frmInfo.addErr lCurLine, cMT("recursive definition is not allowed for EQU:") & " " & s, s
        frmInfo.set_current_text_cool cMT("error!")
        Exit Sub
    End If
    
    
    
    
    
    
    
    ' #1040 check for reserved keywords!
    Dim sCHECK_IT As String
    Const sRESERVED_KEYWORS As String = ",AH,AL,BH,BL,DH,DL,CH,CL,SI,DI,AX,BX,CX,DX,CS,IP,SS,SP,BP,DS,ES,"
    sCHECK_IT = "," & sName & ","
    If InStr(1, sRESERVED_KEYWORS, sCHECK_IT, vbTextCompare) > 0 Then
        frmInfo.addErr lCurLine, cMT("reserved keyword cannot be redefined:") & " " & s, s
        frmInfo.set_current_text_cool cMT("error!")
        Exit Sub
    End If
    
    
    
    
    
    
    
    
    ' 1.17
    ' removing comments from EQU data:
    s = remove_Comment(s)
    
    
    
    ' #1087 making this work:
    ' a:
    '     array dw 17,15,31,16,1,123
    '     array_byte_size = $ - a
    '     MOV AX, array_byte_size / 2
    If InStr(1, s, "-") > 0 Or InStr(1, s, "+") > 0 Then
        s = "(" & s & ")"
    End If
    
    
    
    
    'frmMain.txt_EQU.Text = frmMain.txt_EQU.Text & sName & " " & s & vbNewLine
    frmMain.lst_EQU.AddItem sName & " " & s
    
End Sub

' written especially for
' #327xp-optimize_DUP#
' if both vals are zero return: 0
' if some val is greater than zero return it.
' if both vals greater than zero return the smallest!
' negative numbers treated same as zero.
Public Function get_min_but_greater_than_zero(L1 As Long, L2 As Long) As Long
    On Error GoTo err1:
    
        If L1 <= 0 And L2 <= 0 Then
            get_min_but_greater_than_zero = 0
        Else
            If L1 <= 0 Then
                get_min_but_greater_than_zero = L2
            ElseIf L2 <= 0 Then
                get_min_but_greater_than_zero = L1
            Else ' both greater:
                If L1 = L2 Then
                    get_min_but_greater_than_zero = L1 ' any.
                Else
                    If L1 < L2 Then
                        get_min_but_greater_than_zero = L1
                    Else
                        get_min_but_greater_than_zero = L2
                    End If
                End If
            End If
        End If
    
    Exit Function
err1:
    get_min_but_greater_than_zero = 0
    Debug.Print "get_min_but_not_zero: " & err.Description
End Function


' ' #327xp-optimize_DUP#
' copied from frmDebugLog (AKA: sbHEX)
' it appears we do not need this sub :)
' #327xq-show-physical# now we do :)
Public Function byteHEX(bInput As Byte) As String
On Error GoTo err1
    byteHEX = make_min_len(Hex(bInput), 2, "0")
    Exit Function
err1:
    Debug.Print "byteHEX: " & bInput
    byteHEX = "00"
End Function

' #327xq-show-physical#
Public Function byteDEC(bInput As Byte) As String
On Error GoTo err1
    byteDEC = make_min_len(CStr(bInput), 3, "0")
    Exit Function
err1:
    Debug.Print "byteDEC: " & bInput
    byteDEC = "000"
End Function


' 4.00-Beta-3
' so complex because:   ? doubleWordHex(&H1234,&hffff)
'      should return:   1234:FFFF
'            and not:   1234:FFFFFFFF
Public Function doubleWordHex(lSEG As Long, lOff As Long) As String
On Error Resume Next
    doubleWordHex = Mid(make_min_len(Hex(lSEG), 8, "0"), 5) & ":" & Mid(make_min_len(Hex(lOff), 8, "0"), 5)
End Function

' #327xq-show-physical# major update
Public Function byteChar(bCharCode As Byte) As String
    
    If bCharCode = 0 Then
        byteChar = "NULL"
    ElseIf bCharCode = 7 Then
        byteChar = "BEEP"
    ElseIf bCharCode = 8 Then
        byteChar = "BACK"
    ElseIf bCharCode = 9 Then
        byteChar = "TAB"
    ElseIf bCharCode = 10 Then
        byteChar = "NEWL"
    ElseIf bCharCode = 13 Then
        byteChar = "CRET"
    ElseIf bCharCode = 32 Then
        byteChar = "SPA"
    ElseIf bCharCode = 255 Then
        byteChar = "RES"
    Else
        byteChar = Chr(bCharCode)
    End If
    
End Function


' #327xp-optimize_DUP#
' ASSUMED THAT THE PARAMETER IS IN QUOTES! " " OR ' '
' EXAMPLE: PRINT convert_ASCII_STRING_TO_HEX_STRING("'ALFABET'")
'          41,4C,46,41,42,45,54,
' there is always last coma!, except for when the string is empty
' NOTE: it appears that it's better for us to use decimal string, so this function is not used!
'        see convert_ASCII_STRING_TO_DEC_STRING()
Public Function convert_ASCII_STRING_TO_HEX_STRING(sInput As String) As String
On Error GoTo err1
    
    Dim s As String
    Dim lSize As Long
    Dim L As Long
    Dim sRET As String
    Dim sChar As String
    
    sRET = ""
    
    s = Mid(sInput, 2, Len(sInput) - 2) ' cut off quotes.
    lSize = Len(s)
        
    For L = 1 To lSize
        sChar = Mid(s, L, 1)
        sRET = sRET & byteHEX(myAsc(sChar)) & ","
    Next L
    
    convert_ASCII_STRING_TO_HEX_STRING = sRET

    Exit Function
err1:
    Debug.Print "convert_ASCII_STRING_TO_HEX_STRING: " & err.Description
    convert_ASCII_STRING_TO_HEX_STRING = ""
End Function






' same as convert_ASCII_STRING_TO_HEX_STRING(), but returns decimals!
Public Function convert_ASCII_STRING_TO_unsigned_decimal_byte_STRING(sInput As String) As String
On Error GoTo err1
    
    Dim s As String
    Dim lSize As Long
    Dim L As Long
    Dim sRET As String
    Dim sChar As String
    
    sRET = ""
    
    s = Mid(sInput, 2, Len(sInput) - 2) ' cut off quotes.
    lSize = Len(s)
        
    For L = 1 To lSize
        sChar = Mid(s, L, 1)
        sRET = sRET & myAsc(sChar) & ","
    Next L
    
    convert_ASCII_STRING_TO_unsigned_decimal_byte_STRING = sRET

    Exit Function
err1:
    Debug.Print "convert_ASCII_STRING_TO_unsigned_decimal_byte_STRING: " & err.Description
    convert_ASCII_STRING_TO_unsigned_decimal_byte_STRING = ""
End Function





' I'm not sure if DW should support string definitions... especially in dups... but I'm too lazy to remove it...
' same as convert_ASCII_STRING_TO_HEX_STRING(), but returns decimals!
Public Function convert_ASCII_STRING_TO_single_integer_word_STRING(sInput As String) As String
On Error GoTo err1
    
    Dim s As String
    Dim lSize As Long
    Dim L As Long
    Dim sRET As String
    Dim sCHAR_L As String
    Dim sCHAR_H As String
    
    sRET = ""
    
    s = Mid(sInput, 2, Len(sInput) - 2) ' cut off quotes.
    lSize = Len(s)
        
    For L = 1 To lSize Step 2
        sCHAR_L = Mid(s, L, 1)
        sCHAR_H = Mid(s, L + 1, 1)
        sRET = sRET & to16bit_SIGNED(myAsc(sCHAR_L), myAsc(sCHAR_H)) & ","
    Next L
    
    convert_ASCII_STRING_TO_single_integer_word_STRING = sRET

    Exit Function
err1:
    Debug.Print "convert_ASCII_STRING_TO_single_integer_word_STRING: " & err.Description
    convert_ASCII_STRING_TO_single_integer_word_STRING = ""
End Function





' processes "DB" memory definition.
' assumed that string contains no TABS, and it is trimmed.
 Sub process_DB(ByVal s As String)
    

    If Len(s) > 200 Then ' #1069b
        bDO_EVENTS = True
        frmInfo.show_precompile_animation
    Else
        bDO_EVENTS = False
    End If
    
    

    
    
    bFLAG_UNTERMINATED_STRING = False
    
    ' get name (if any), and set it in Temporary Symbol Table:
    Dim sName As String
        
    If Not startsWith(s, "DB ") Then
        sName = getNewToken(s, 0, " ") ' get name before "DB"
        ' get offset relative to current segment:
        ' 1.23#217 frmMain.lst_Temp_ST.AddItem sName & " " & Hex(locationCounter - lCurSegStart) & " 1 VAR " & sCurSegName ' 1 is for Byte.
        add_to_Secondary_Symbol_Table sName, locationCounter - lCurSegStart, 1, "VAR", sCurSegName
    End If

        
        
        
        
    ' cut of "[XXX] DB " from the source string:
    Dim iStart As Long
        
    ' #1196  - bug fix:    adb db  "a"
    ' #1196 iStart = InStr(1, s, "DB ", vbTextCompare)
    If UCase(Left(s, 3)) = "DB " Then ' note: "a db:" abnormality is already repalced! by #1195c2
        s = Mid(s, 1 + 3)
    Else
        iStart = InStr(1, s, " DB ", vbTextCompare)
        s = Mid(s, iStart + 4)
    End If
    ' #1196 s = Mid(s, iStart + Len("DB "))

    
    
    
    
    
    
    
    
    ' read tokens:
    Dim ts As String
    'Dim i As Long
    
    '1.23#241 Dim tempS As String
    '1.23#241 tempS = ""
        

'    'v3.27p - ignore fist coma...
'    ' allow such defintion:
'    ' db ,23,234,234,11,4,
'    s = Trim(s)
'    If Mid(s, 1, 1) = "," Then
'        s = Mid(s, 2)
'    End If
' v3.27p, simple trim seems to be enough, to compile correctly even something like this:
'    db ,,,,,,,,,,,,,,,,,,1,2,3,4,5,6,7,,,,,
' it seems that only the first space is causing the problem.
     s = Trim(s)
   
    StringTokenizer_constructor s, ","

    Do While frmMain.bCOMPILING ' 1.21 True

continue_process_DB:

        ts = nextToken  ' ignore (,) inside strings!
            
            
            
            
            

        
        
        
        
        
        
        
        
        ts = Trim(ts)  ' 3.27xp   move above ts="" check.
        
        
        
        
        ' #400b27-cb2#
        Dim lCH_P As Long
        Dim lCH_DUP As Long         ' #400b27-cb2_fix_of_fix#
        lCH_P = InStr(1, ts, "'")
        If lCH_P > 0 Then
            lCH_DUP = InStr(1, ts, "dup", vbTextCompare)
            If lCH_DUP > 0 And lCH_DUP < lCH_P Then
                ' ok
            Else
                If Mid(ts, 1, 1) = """" Or Mid(ts, 1, 1) = "'" Then
                    ' ok
                Else
                    frmInfo.addErr currentLINE, "comma is missing or wrong syntax: " & ts, ts
                    GoTo exit_pr_DB
                End If
            End If
        End If
        lCH_P = InStr(1, ts, """")
        If lCH_P > 0 Then
            lCH_DUP = InStr(1, ts, "dup", vbTextCompare)
            If lCH_DUP > 0 And lCH_DUP < lCH_P Then
                ' ok
            Else
                If Mid(ts, 1, 1) = """" Or Mid(ts, 1, 1) = "'" Then
                    ' ok
                Else
                    frmInfo.addErr currentLINE, "comma is missing or wrong syntax: " & ts, ts
                    GoTo exit_pr_DB
                End If
            End If
        End If
        ' Debug.Print "jjjjj: " & ts
        
        
        

        If ts = "" Then Exit Do ' got to end.
        
        
        
         If bDO_EVENTS Then
            DoEvents ' #1069b
            If frmMain.bCOMPILING = False Then GoTo exit_pr_DB
        End If
        
        

        
        
        
        
        
''''''''''''''''''''' CHECK FOR DUP (DB) '''''''''''''''''''
        ' #327xp-optimize_DUP#
      ' always! 3.27xq '  If ALT_DUP = False Then ' new dup!
            Dim lScob As Long
            Dim lDUP As Long
            Dim lKavc As Long
            Dim lTIMES_TO_DUPLICATE As Long
            Dim sTemp As String
            
            lDUP = InStr(1, ts, " dup", vbTextCompare)
            If lDUP > 0 Then
                lScob = InStr(lDUP, ts, "(") ' must be ( after dup.
                If lScob > 0 Then
                   ' #327xp-no-space-no-eval# ' If lDUP < lScob Then  ' 5 dup (
                        ' ignore something like:       db "5 dup ("     and    db '5 dup ('
                        ' but allow something like     db 5 dup ('blabla')
                        lKavc = get_min_but_greater_than_zero(InStr(1, ts, "'"), InStr(1, ts, """"))
                        If lKavc <= 0 Or lKavc > lScob Then ' ok!
                        '\\\\\\\\\\\\\\\\\  PROCESS DUP \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                                 ' Debug.Print "OK1: " & ts
                                 sTemp = Trim(Mid(ts, 1, lDUP - 1))
                                 ' Debug.Print "OK2: " & sTEMP
                                 bWAS_ERROR_ON_LAST_EVAL_EXPR = False
                                 lTIMES_TO_DUPLICATE = evalExpr(sTemp)
                                 If bWAS_ERROR_ON_LAST_EVAL_EXPR Then
                                        bWAS_ERROR_ON_LAST_EVAL_EXPR = False
                                        frmInfo.addErr currentLINE, "wrong size for DUP: " & sTemp, ""
                                        GoTo exit_pr_DB
                                 Else
                                        Dim sBYTE_DATA As String ' something like "65,120,0,64" (unsigned decimal byte values).
                                        Dim sTok As String
                                        Dim sFIRST_CHAR As String
                                        Dim sLAST_CHAR As String
                                        Dim k As Long
                                        
                                        sBYTE_DATA = ""
                                         

                                        sTok = Mid(ts, lScob + 1) ' cut off firts scob
                                        
next_dup_token:                         sTok = Trim(sTok)

                                        sLAST_CHAR = Right(sTok, 1)
                                        If sLAST_CHAR = ")" Then
                                            sTok = Mid(sTok, 1, Len(sTok) - 1) ' cut off last scob
                                        End If
                                        
                                        If Len(sTok) > 0 Then
                                            sFIRST_CHAR = Left(sTok, 1)
                                            If sFIRST_CHAR = "'" Or sFIRST_CHAR = """" Then
                                                sBYTE_DATA = sBYTE_DATA & convert_ASCII_STRING_TO_unsigned_decimal_byte_STRING(sTok)  ' [,] is added already.
                                            Else
                                                If sTok = "?" Then
                                                    sBYTE_DATA = sBYTE_DATA & "0" & ","
                                                Else
                                                    bWAS_ERROR_ON_LAST_EVAL_EXPR = False
                                                    sBYTE_DATA = sBYTE_DATA & to_unsigned_byte(evalExpr(sTok)) & ","
                                                    If bWAS_ERROR_ON_LAST_EVAL_EXPR Then
                                                        bWAS_ERROR_ON_LAST_EVAL_EXPR = False
                                                        frmInfo.addErr currentLINE, cMT("cannot be evaluated:") & " " & sTok, ""
                                                        GoTo exit_pr_DB
                                                    End If
                                                    If Not bTO_uBYTE_OK Then
                                                        frmInfo.addErr currentLINE, cMT("over 8 bits:") & " " & sTok, ""
                                                        GoTo exit_pr_DB
                                                    End If
                                                End If
                                            End If
                                            If sLAST_CHAR <> ")" Then
                                                sTok = nextToken  ' delimiter is [,]  (not counted in strings).
                                                GoTo next_dup_token
                                            End If
                                        End If
                                        
completed_parsing_start_duplicating:
                                        
                                        
                                        
                                        
                                        ' cut off last coma from sBYTE_DATA (if any)
                                        If Right(sBYTE_DATA, 1) = "," Then
                                            sBYTE_DATA = Mid(sBYTE_DATA, 1, Len(sBYTE_DATA) - 1)
                                        End If
                                        
                                        ' Split() does not work for 1 element!
                                        ' it only works for "12,10" etc...
                                        ' not for "12"
                                        
                                        If Len(sBYTE_DATA) = 0 Then GoTo continue_process_DB ' empty dup?
                                        
                                        
                                        If InStr(1, sBYTE_DATA, ",") <= 0 Then ' single element!
                                                ' DUPLICATE!
                                                For k = 1 To lTIMES_TO_DUPLICATE
                                                    add_to_arrOUT Val(sBYTE_DATA)
                                                    locationCounter = locationCounter + 1
                                                Next k
                                        Else
                                                Dim L As Long
                                                Dim sARRAY() As String
                                                sARRAY = Split(sBYTE_DATA, ",")
                                                If UBound(sARRAY) <= 0 Then GoTo continue_process_DB ' empty dup?
                                                
                                                ' DUPLICATE!
                                                For k = 1 To lTIMES_TO_DUPLICATE
                                                    For L = LBound(sARRAY) To UBound(sARRAY)
                                                        add_to_arrOUT Val(sARRAY(L))
                                                        locationCounter = locationCounter + 1
                                                    Next L
                                                Next k
                                        End If

                                        GoTo continue_process_DB
                        '\\\\\\\\\\\\\\\\\  STOP PROCESS DUP \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                                 End If
                        End If
                  ' #327xp-no-space-no-eval#  End If
                End If
            End If
' 3.27xq        End If
''''''''''''''''''''' STOP CHECK FOR DUP '''''''''''''''''''
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        If ts = "?" Then
            add_to_arrOUT 0
            locationCounter = locationCounter + 1
            
        ElseIf Left(ts, 1) = "'" Then  ' 3.27xp optimization
            process_byte_str (ts)
            
        ElseIf Left(ts, 1) = """" Then  ' 3.27xp optimization
            process_byte_str (ts)
            
        Else
            add_to_arrOUT to_unsigned_byte(evalExpr(ts))

            If bWAS_ERROR_ON_LAST_EVAL_EXPR Then
                bWAS_ERROR_ON_LAST_EVAL_EXPR = False
                If endsWith(ts, "h") And (Not startsWith(ts, "0")) Then
                        frmInfo.addErr currentLINE, cMT("zero prefix must be added to a HEX value, for example: 0Ch"), ts
                Else
                        frmInfo.addErr currentLINE, cMT("cannot evaluate this expression:") & " " & ts, ts
                End If
            End If
            
            If Not bTO_uBYTE_OK Then
                frmInfo.addErr currentLINE, cMT("over 8 bits:") & " " & ts, ts
            End If
            locationCounter = locationCounter + 1
        End If

    Loop
    
    
exit_pr_DB:
        
    Erase sARRAY
    
        
    ' #1064
    If bFLAG_UNTERMINATED_STRING Then
        frmInfo.addErr currentLINE, "mismatched or misplaced quotes", ts
        bFLAG_UNTERMINATED_STRING = False ' 3.27xp
    End If

    If bDO_EVENTS Then ' #1069b reset.
        bDO_EVENTS = False
        frmInfo.stop_precompile_animation False
    End If
    
End Sub

' v3.27p
' just replace long doubles with
' double: FFFF_FFFF
Sub process_DD(ByRef s As String)

On Error GoTo err1

    Dim s1 As String
    Dim sName As String
    
    Dim vv
    ' we assume that we have numbers only...
    
    s1 = s
    
    If Not startsWith(s1, "DD ") Then
        sName = getNewToken(s1, 0, " ") ' get name before "DD"
    Else
        sName = ""
    End If
    
    
    
    
    ' replace first " dd " with ","
    ' virst element of vv() can be ignored.
    s1 = Replace(s1, "dd ", ",", 1, 1, vbTextCompare)
    
    ' first try with hex:
    
    vv = Split(s1, ",")
    
    s1 = ""
    
    Dim L As Long
    
    For L = LBound(vv) + 1 To UBound(vv)
        ' Debug.Print l & "?: " & vv(l)
        
        Dim lYYY As Long
        Dim s2 As String
        
        s2 = make_normal_hex(CStr(vv(L)))
        lYYY = analysis(frmEvaluator.make_all_decimal(s2))
        
        Dim sUUU As String
        
        sUUU = Hex(lYYY)
        
        sUUU = make_min_len(sUUU, 8, "0")
        
        Dim s_low_WORD As String
        Dim s_high_WORD As String
        
        s_low_WORD = "0" & Mid(sUUU, 5, 4) & "h"
        s_high_WORD = "0" & Mid(sUUU, 1, 4) & "h"
         
        s1 = s1 & s_low_WORD & "," & s_high_WORD & ","
        ' Debug.Print "hi: " & sUUU
        
    Next L
    
    ' cut out, last "," - :)
    s1 = Mid(s1, 1, Len(s1) - 1)
    
    
    ' pass to process as DW
    If sName = "" Then
        process_DW "DW " & s1
    Else
        process_DW sName & " DW " & s1
    End If
    
    
    s1 = ""
    
    Erase vv ' #327xp-erase#
    
    Exit Sub
err1:
    Debug.Print "error on process_DD: " & err.Description
End Sub

' processes "DW" memory definition.
' assumed that string contains no TABS, and it is trimmed.
 Sub process_DW(ByVal s As String)
   
    
    If Len(s) > 200 Then ' #1069b
        bDO_EVENTS = True
        frmInfo.show_precompile_animation
    Else
        bDO_EVENTS = False
    End If
   
    ' get name (if any), and set it in Temporary Symbol Table:
    Dim sName As String
        
    If Not startsWith(s, "DW ") Then
        sName = getNewToken(s, 0, " ") ' get name before "DW"
        ' get offset relative to current segment:
        ' 1.23#217 frmMain.lst_Temp_ST.AddItem sName & " " & Hex(locationCounter - lCurSegStart) & " 2 VAR " & sCurSegName ' 2 is for Word.
        add_to_Secondary_Symbol_Table sName, locationCounter - lCurSegStart, 2, "VAR", sCurSegName
    End If






    ' cut of "[XXX] DW " from the source string:
    Dim iStart As Long
    
    
    


    ' #1196  - bug fix:     adw dw  "ab"
    ' #1196 iStart = InStr(1, s, "DW ", vbTextCompare)
    If UCase(Left(s, 3)) = "DW " Then ' note: "a dw:" abnormality is already repalced! by #1195c2
        s = Mid(s, 1 + 3)
    Else
        iStart = InStr(1, s, " DW ", vbTextCompare)
        s = Mid(s, iStart + 4)
    End If
    ' #1196 s = Mid(s, iStart + Len("DW "))












    
    ' read tokens:
    Dim ts As String
    Dim tNumber As Integer
    
    '1.23#241 Dim tempS As String
    '1.23#241 tempS = ""
    
    
    
    

' v3.27p, simple trim seems to be enough, to compile correctly even something like this:
'    db ,,,,,,,,,,,,,,,,,,1,2,3,4,5,6,7,,,,,
' it seems that only the first space is causing the problem.
     s = Trim(s)
    
    
    
    
    
    
    StringTokenizer_constructor s, ","

    
    Do While frmMain.bCOMPILING ' 1.21 True
        
        
continue_process_DW:
        ts = nextToken ' ignore (,) inside strings!
        
        
        
        If bDO_EVENTS Then
            DoEvents ' #1069b
            If frmMain.bCOMPILING = False Then GoTo exit_pr_DW
        End If
        
        
        
        ts = Trim(ts)
        
        
        If ts = "" Then Exit Do ' got to end.       ' 3.27xp  moved below trim()
        
        
        
        
        
        
        
        
        
        
        

        ' copied form process_DB()   optimized for 16 bit (words)
''''''''''''''''''''' CHECK FOR DUP (DW) '''''''''''''''''''
        ' #327xp-optimize_DUP#
' always       If ALT_DUP = False Then ' new dup!
            Dim lScob As Long
            Dim lDUP As Long
            Dim lKavc As Long
            Dim lTIMES_TO_DUPLICATE As Long
            Dim sTemp As String
            lDUP = InStr(1, ts, " dup", vbTextCompare)
            If lDUP > 0 Then  ' dup must have ( after it
                lScob = InStr(lDUP, ts, "(")
                If lScob > 0 Then
                    ' #327xp-no-space-no-eval# ' If lDUP < lScob Then  ' 5 dup (
                        ' ignore something like:       db "5 dup ("     and    db '5 dup ('
                        ' but allow something like     db 5 dup ('blabla')
                        lKavc = get_min_but_greater_than_zero(InStr(1, ts, "'"), InStr(1, ts, """"))
                        If lKavc <= 0 Or lKavc > lScob Then ' ok!
                        '\\\\\\\\\\\\\\\\\  PROCESS DUP \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                                 ' Debug.Print "OK1: " & ts
                                 sTemp = Trim(Mid(ts, 1, lDUP - 1))
                                 ' Debug.Print "OK2: " & sTEMP
                                 bWAS_ERROR_ON_LAST_EVAL_EXPR = False
                                 lTIMES_TO_DUPLICATE = evalExpr(sTemp)
                                 If bWAS_ERROR_ON_LAST_EVAL_EXPR Then
                                        bWAS_ERROR_ON_LAST_EVAL_EXPR = False
                                        frmInfo.addErr currentLINE, "wrong size for DUP: " & sTemp, ""
                                         GoTo exit_pr_DW
                                 Else
                                        Dim sWORD_DATA As String ' something like "6135,13220,0,-1264" (singned decimal integer values).
                                        Dim sTok As String
                                        Dim sFIRST_CHAR As String
                                        Dim sLAST_CHAR As String
                                        Dim k As Long
                                        
                                        sWORD_DATA = ""
                                         

                                        sTok = Mid(ts, lScob + 1) ' cut off firts scob
                                        
next_dup_token:                         sTok = Trim(sTok)

                                        sLAST_CHAR = Right(sTok, 1)
                                        If sLAST_CHAR = ")" Then
                                            sTok = Mid(sTok, 1, Len(sTok) - 1) ' cut off last scob
                                        End If
                                        
                                        If Len(sTok) > 0 Then
                                            sFIRST_CHAR = Left(sTok, 1)
                                            If sFIRST_CHAR = "'" Or sFIRST_CHAR = """" Then
                                                sWORD_DATA = sWORD_DATA & convert_ASCII_STRING_TO_single_integer_word_STRING(sTok)    ' [,] is added already.
                                            Else
                                                If sTok = "?" Then
                                                    sWORD_DATA = sWORD_DATA & "0" & ","
                                                Else
                                                    bWAS_ERROR_ON_LAST_EVAL_EXPR = False
                                                    sWORD_DATA = sWORD_DATA & evalExpr(sTok) & ","
                                                    If bWAS_ERROR_ON_LAST_EVAL_EXPR Then
                                                        bWAS_ERROR_ON_LAST_EVAL_EXPR = False
                                                        frmInfo.addErr currentLINE, cMT("cannot be evaluated:") & " " & sTok, ""
                                                        GoTo exit_pr_DW
                                                    End If
                                                End If
                                            End If
                                            If sLAST_CHAR <> ")" Then
                                                sTok = nextToken  ' delimiter is [,]  (not counted in strings).
                                                GoTo next_dup_token
                                            End If
                                        End If
                                        
completed_parsing_start_duplicating:
                                        
                                        
                                        
                                        
                                        ' cut off last coma from sBYTE_DATA (if any)
                                        If Right(sWORD_DATA, 1) = "," Then
                                            sWORD_DATA = Mid(sWORD_DATA, 1, Len(sWORD_DATA) - 1)
                                        End If
                                        
                                        ' Split() does not work for 1 element!
                                        ' it only works for "12,10" etc...
                                        ' not for "12"
                                        
                                        If Len(sWORD_DATA) = 0 Then GoTo continue_process_DW ' empty dup?
                                        
                                        
                                        Dim byteL As Byte
                                        Dim byteH As Byte
                                        Dim i As Integer
                                        
                                        
                                        If InStr(1, sWORD_DATA, ",") <= 0 Then ' single element!
                                                ' DUPLICATE!
                                                For k = 1 To lTIMES_TO_DUPLICATE
                                                    i = Val(sWORD_DATA)
                                                    byteL = math_get_low_byte_of_word(i)
                                                    byteH = math_get_high_byte_of_word(i)
                                                    add_to_arrOUT byteL
                                                    locationCounter = locationCounter + 1
                                                    add_to_arrOUT byteH
                                                    locationCounter = locationCounter + 1
                                                Next k
                                        Else
                                                Dim L As Long
                                                Dim sARRAY() As String
                                                sARRAY = Split(sWORD_DATA, ",")
                                                If UBound(sARRAY) <= 0 Then GoTo continue_process_DW ' empty dup?
                                                
                                                ' DUPLICATE!
                                                For k = 1 To lTIMES_TO_DUPLICATE
                                                    For L = LBound(sARRAY) To UBound(sARRAY)
                                                        i = Val(sARRAY(L))
                                                        byteL = math_get_low_byte_of_word(i)
                                                        byteH = math_get_high_byte_of_word(i)
                                                        add_to_arrOUT byteL
                                                        locationCounter = locationCounter + 1
                                                        add_to_arrOUT byteH
                                                        locationCounter = locationCounter + 1
                                                    Next L
                                                Next k
                                        End If

                                        GoTo continue_process_DW
                        '\\\\\\\\\\\\\\\\\  STOP PROCESS DUP \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                                 End If
                        End If
                    ' #327xp-no-space-no-eval# ' End If
                End If
            End If
'        End If
''''''''''''''''''''' STOP CHECK FOR DUP (DW) '''''''''''''''''''
        
                
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        If ts = "?" Then
            tNumber = 0
            add_to_arrOUT 0
            add_to_arrOUT 0
            locationCounter = locationCounter + 2
            
        ElseIf (Left(ts, 1) = "'") Or (Left(ts, 1) = """") Then
        
            Dim sWORD_STRING As String
        
            sWORD_STRING = convert_ASCII_STRING_TO_single_integer_word_STRING(ts)
        
            ' #327xp-allow-dw-str#
            ' going after fasm! this way is no longer supported. and it's now possible to define strins with DW too :)
            '  tNumber = sum_str(ts)  ' unlike process_byte_str(), this one process only 2 char strings.
            'add_to_arrOUT math_get_low_byte_of_word(tNumber)
            'add_to_arrOUT math_get_high_byte_of_word(tNumber)
            'locationCounter = locationCounter + 2

            ' copied from above...

            ' cut off last coma from sBYTE_DATA (if any)
            If Right(sWORD_STRING, 1) = "," Then
                sWORD_STRING = Mid(sWORD_STRING, 1, Len(sWORD_STRING) - 1)
            End If
            
            If Len(sWORD_STRING) = 0 Then GoTo exit_pr_DW ' empty dup?
                        
            If InStr(1, sWORD_STRING, ",") <= 0 Then ' single element!
                        i = Val(sWORD_STRING)
                        byteL = math_get_low_byte_of_word(i)
                        byteH = math_get_high_byte_of_word(i)
                        add_to_arrOUT byteL
                        locationCounter = locationCounter + 1
                        add_to_arrOUT byteH
                        locationCounter = locationCounter + 1
            Else
                    sARRAY = Split(sWORD_STRING, ",")
                    If UBound(sARRAY) <= 0 Then GoTo exit_pr_DW ' empty dup?
                    
                    For L = LBound(sARRAY) To UBound(sARRAY)
                        i = Val(sARRAY(L))
                        byteL = math_get_low_byte_of_word(i)
                        byteH = math_get_high_byte_of_word(i)
                        add_to_arrOUT byteL
                        locationCounter = locationCounter + 1
                        add_to_arrOUT byteH
                        locationCounter = locationCounter + 1
                     Next L
            End If


            
        Else
            tNumber = evalExpr(ts)
            add_to_arrOUT math_get_low_byte_of_word(tNumber)
            add_to_arrOUT math_get_high_byte_of_word(tNumber)
            locationCounter = locationCounter + 2
        End If
        
        

    Loop

    
exit_pr_DW:
    Erase sARRAY




    If bDO_EVENTS Then ' #1069b reset.
        bDO_EVENTS = False
        frmInfo.stop_precompile_animation False
    End If
    
End Sub


' build the byte orders from a string.
' (see also: sum_str())
'1.23#241  Function process_byte_str(ByVal s As String) As String
Sub process_byte_str(sSTRING As String) ' 3.27xp possible optimization....
'Debug.Print "process_byte_str>" & s & "<"
    ' 1.04 optimized for faster performance (I hope),
    '      by replacing "OR" with "ElseIf":
    ' "And Len(s) > 1" added to make sure it won't cause
    ' errors with Mid() function:
    
    
    '1.23#241 Dim sResult As String
    '1.23#241 sResult = ""
    
    Dim i As Long
    Dim ts As String
    Dim Size As Long
    Dim s As String   ' 3.27xp possible optimization....
    s = sSTRING
    
    ' Debug.Print "pbs: " & s
    
    
    ' 3.27xp clear optimization
    Dim sFIRST_CHAR As String
    Dim sLAST_CHAR As String
    sFIRST_CHAR = Left(s, 1)
    sLAST_CHAR = Right(s, 1)
    
    
    
    Size = Len(s)  ' 3.27xp optimize.
    
    
    If (sFIRST_CHAR = "'") And (sLAST_CHAR = "'") And Size > 1 Then
        
        s = Mid(s, 2, Size - 2)   ' cut out '  '   (SAME LINE as below)
        
    ElseIf (sFIRST_CHAR = """") And (sLAST_CHAR = """") And Size > 1 Then

        s = Mid(s, 2, Size - 2)   ' cut out "  "   (SAME LINE as above)
        
    Else
        Debug.Print "unterminated string. in process_byte_str(): " & s
        bFLAG_UNTERMINATED_STRING = True  '#1064
        GoTo stop_processing
    End If
         

    
    Size = Len(s)   ' the size can be updated! because quotes removed!

    
    For i = 1 To Size

        ts = Mid(s, i, 1)

        '1.23#241 sResult = sResult & make_min_len(Hex(myAsc(ts)), 2, "0")
        add_to_arrOUT myAsc(ts)
                
        locationCounter = locationCounter + 1

    Next i
        
stop_processing:
    '1.23#241 process_byte_str = sResult
        
End Sub


' #327xq-opt1#
Function contains_SEGMENT_PREFIX_NEW(op As String) As Boolean
On Error GoTo err1

    Dim L As Long
    
    
    L = InStr(1, op, "s:", vbTextCompare)  ' all prefixes end with "s:"
    If L <= 0 Then
        ' nothing to search for
        contains_SEGMENT_PREFIX_NEW = False
        Exit Function
    End If
    
    
    Dim L2 As Long
    L2 = InStr(1, op, "'")
    If L2 > 0 Then
        If L2 < L Then
            ' that's a string!
            contains_SEGMENT_PREFIX_NEW = False
            Exit Function
        End If
    End If
    L2 = InStr(1, op, """")
    If L2 > 0 Then
        If L2 < L Then
            ' that's a string!
            contains_SEGMENT_PREFIX_NEW = False
            Exit Function
        End If
    End If
    
    


   ' in the begiining?   mov ax, cs:[bx]

    Dim s3 As String
    s3 = LCase(Left(op, 3))
    
    If s3 = "cs:" Then
        contains_SEGMENT_PREFIX_NEW = True
        Exit Function
    ElseIf s3 = "ds:" Then
        contains_SEGMENT_PREFIX_NEW = True
        Exit Function
    ElseIf s3 = "es:" Then
        contains_SEGMENT_PREFIX_NEW = True
        Exit Function
    ElseIf s3 = "ss:" Then
        contains_SEGMENT_PREFIX_NEW = True
        Exit Function
    End If
    
    
     ' in the middle?   mov ax, [bx+cs:1241]
    

    L = InStr(1, op, " cs:", vbTextCompare)
    If L > 0 Then
        contains_SEGMENT_PREFIX_NEW = True
        Exit Function
    End If
    
    L = InStr(1, op, " ds:", vbTextCompare)
    If L > 0 Then
        contains_SEGMENT_PREFIX_NEW = True
        Exit Function
    End If
    
    L = InStr(1, op, " es:", vbTextCompare)
    If L > 0 Then
        contains_SEGMENT_PREFIX_NEW = True
        Exit Function
    End If
    
    L = InStr(1, op, " ss:", vbTextCompare)
    If L > 0 Then
        contains_SEGMENT_PREFIX_NEW = True
        Exit Function
    End If
        
    ' short?   call Dw.es:[15h]
        
        
        
    L = InStr(1, op, ".cs:", vbTextCompare)
    If L > 0 Then
        contains_SEGMENT_PREFIX_NEW = True
        Exit Function
    End If
    
    L = InStr(1, op, ".ds:", vbTextCompare)
    If L > 0 Then
        contains_SEGMENT_PREFIX_NEW = True
        Exit Function
    End If
    
    L = InStr(1, op, ".es:", vbTextCompare)
    If L > 0 Then
        contains_SEGMENT_PREFIX_NEW = True
        Exit Function
    End If
    
    L = InStr(1, op, ".ss:", vbTextCompare)
    If L > 0 Then
        contains_SEGMENT_PREFIX_NEW = True
        Exit Function
    End If
        
        
        
        
        
    contains_SEGMENT_PREFIX_NEW = False
    
    
    Exit Function
err1:
    contains_SEGMENT_PREFIX_NEW = False
    Debug.Print "err 12: " & err.Description
End Function

' assumed that s is a trimmed string, containing to TABS.
' examples:
'     "label :"
'     "label:"
'     "label: MOV AX, 5"
'     "label   : MOV AX, 5"
' 1.08
' it also returns true for segment prefixes: "DS: ES: SS: CS:"  (only if they are in the beginning).
' #327xq-opt1#  RENAMED FROM: Function contains_LABEL_or_SEG_PREFIX(ByRef s As String) As Boolean
'              additional function is used: contains_SEGMENT_PREFIX_NEW
Function starts_with_LABEL_or_SEG_PREFIX(s As String) As Boolean
 On Error GoTo err1
 
' #327xq-opt1# '        Dim i As Long
' #327xq-opt1# '     Dim Size As Long
' #327xq-opt1# '     Dim bShouldGoColon As Boolean
' #327xq-opt1# '     Dim ts As String
    
' #327xq-opt1# '         Size = Len(s)
 ' #327xq-opt1# '        bShouldGoColon = False


    
   ' #bug400b24a.asm#  allow numeric labels... :)
'''    ' check if it starts with a number:
'''    If Left(s, 1) Like "#" Then
'''        starts_with_LABEL_or_SEG_PREFIX = False
'''        Exit Function
'''    End If
    
    Dim L As Long
    L = InStr(1, s, ":")
    
    If L > 1 Then  ' ":something" = false
    
       '  Debug.Print "ggg: " & s
    
        ' in string?
        Dim lKavc As Long
        lKavc = InStr(1, s, "'")
        If lKavc > 0 Then
            If lKavc < L Then
                starts_with_LABEL_or_SEG_PREFIX = False
                Exit Function
            End If
        End If
        lKavc = InStr(1, s, """")
        If lKavc > 0 Then
            If lKavc < L Then
                starts_with_LABEL_or_SEG_PREFIX = False
                Exit Function
            End If
        End If
        
        
        ' more than single token before ":" ?
        Dim sU As String
        sU = Trim(Mid(s, 1, L - 1)) & " "
        Dim arrayT() As String
        arrayT = Split(sU, " ")
        If UBound(arrayT) > 1 Then
            Erase arrayT
            starts_with_LABEL_or_SEG_PREFIX = False
            Exit Function
        Else
            Erase arrayT
        End If
        arrayT = Split(sU, ",")
        If UBound(arrayT) > 1 Then
            Erase arrayT
            starts_with_LABEL_or_SEG_PREFIX = False
            Exit Function
        Else
            Erase arrayT
        End If
        
        
        
        starts_with_LABEL_or_SEG_PREFIX = True
    Else
        starts_with_LABEL_or_SEG_PREFIX = False
    End If


    Exit Function
err1:
 Debug.Print "err 31:" & err.Description
 starts_with_LABEL_or_SEG_PREFIX = False
 
 
 
' #327xq-opt1# '
''''    For i = 2 To Size
''''
''''        ts = Mid(s, i, 1)
''''
''''        If ts = " " Then
''''
''''            bShouldGoColon = True
''''
''''        ElseIf bShouldGoColon And (ts = ":") Then ' such as: "label :"
''''
''''            contains_LABEL_or_SEG_PREFIX = True
''''            Exit Function
''''
''''        ElseIf (i > 1) And (ts = ":") Then ' such as: "label:", "DS:", "ES:"...
''''
''''            contains_LABEL_or_SEG_PREFIX = True
''''            Exit Function
''''
''''        ElseIf ts = ":" Then   ' ":" before name!
''''
''''            contains_LABEL_or_SEG_PREFIX = False
''''            Exit Function
''''
''''        ElseIf bShouldGoColon Then ' should be ":" or " ", but got something else.
''''
''''            contains_LABEL_or_SEG_PREFIX = False
''''            Exit Function
''''
''''        End If
''''
''''    Next i

End Function

 Sub process_LABEL(ByRef s As String)

    ' get name , and set it in Temporary Symbol Table:
    Dim sName As String
    Dim lOFFSET As Long
    
    ' get offset relative to current segment:
    lOFFSET = locationCounter - lCurSegStart
    
    sName = getNewToken(s, 0, ":") ' get name before ":"
   
    'frmMain.lst_Temp_ST.AddItem sName & " " & make_min_len(Hex(lOFFSET), 4, "0") & " -1 LABEL " & sCurSegName  ' -1 is for label/proc.
    ' no need in make_min_len()
    ' 1.23#217 frmMain.lst_Temp_ST.AddItem sName & " " & Hex(lOffset) & " -1 LABEL " & sCurSegName  ' -1 is for label/proc.
    add_to_Secondary_Symbol_Table sName, lOFFSET, -1, "LABEL", sCurSegName

End Sub

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

' assumed that s is a trimmed string, containing to TABS.
' example:
'     "my proc near"
' searches "proc" token (ignores when it's in a string).
 Function contains_PROC(ByRef s As String) As Boolean
    Dim ts As String
    Dim i As Long
    
    i = 0

    Do While True
    
        ts = getToken_str(s, i, " ") ' get token (full strings!)
        If ts = Chr(10) Then Exit Do
        
        If UCase(ts) = "PROC" Then
            contains_PROC = True
            Exit Function
        End If
        
        i = i + 1
        
    Loop

    contains_PROC = False
    
End Function


 Sub process_PROC(ByRef s As String)


    ' check the match of previous PROC / ENDP:
    If sCurProcName <> "" Then
       ' #BUG-short-def-2233-not-req# '  frmInfo.addErr lCurProc_LINE_NUM, cMT("no ENDP for:") & " " & sCurProcName, sCurProcName
       Debug.Print lCurProc_LINE_NUM, "no ENDP for: " & sCurProcName
       sCurProcName = ""
    End If





    ' get name , and set it in Temporary Symbol Table:
    Dim sName As String
    Dim sType As String
    Dim lOFFSET As Long
    
    sName = getNewToken(s, 0, " ") ' get name (it's the first token)
    
    ' #327u-proc# - fool proof solution
    If UCase(sName) = "PROC" Then
        sName = getNewToken(s, 1, " ") ' proc misplaced.
    End If
    
    
    sCurProcName = sName ' for ENDP match check.
    
    lCurProc_LINE_NUM = currentLINE
    
    ' #327u-proc# 'If InStr(1, s, " FAR", vbTextCompare) > 0 Then
    If endsWith(s, " FAR") Then ' #327u-proc# -- to avoid conflicts
        sType = "FAR"
    Else
        sType = "NEAR"  ' default.
    End If
    
    sCurProcType = sType
    
    ' get offset relative to current segment:
    lOFFSET = locationCounter - lCurSegStart
    
    'frmMain.lst_Temp_ST.AddItem sName & " " & make_min_len(Hex(lOFFSET), 4, "0") & " -1 " & sType & " " & sCurSegName  ' -1 is for label/proc.
    ' no need in make_min_len()
    ' 1.23#217 frmMain.lst_Temp_ST.AddItem sName & " " & Hex(lOffset) & " -1 " & sType & " " & sCurSegName  ' -1 is for label/proc.
    add_to_Secondary_Symbol_Table sName, lOFFSET, -1, sType, sCurSegName

End Sub


' assumed that s is a trimmed string, containing to TABS.
' example:
'     "my endp"
' searches "endp" token (ignores when it's in a string).
 Function contains_ENDP(ByRef s As String) As Boolean
    Dim ts As String
    Dim i As Long
    
    i = 0

    Do While True
    
        ts = getToken_str(s, i, " ") ' get token (full strings!)
        If ts = Chr(10) Then Exit Do
        
        If UCase(ts) = "ENDP" Then
            contains_ENDP = True
            Exit Function
        End If
        
        i = i + 1
        
    Loop

    contains_ENDP = False
    
End Function

' it checks the match of PROC / ENDP,
' though it doesn't support nesting!!
 Sub process_ENDP(ByRef s As String)
    Dim sName As String
    
    sName = getNewToken(s, 0, " ")
    
    If UCase(sName) = "ENDP" Then sName = ""

    If sName = "" Or StrComp(sName, sCurProcName, vbTextCompare) = 0 Then
        ' OK! Match!
        sCurProcName = ""
        sCurProcType = ""
    Else
        ' No match!
        frmInfo.addErr currentLINE, cMT("mismatched:") & " " & s, sName
    End If
    
End Sub


'#400b3-general-optimiz#
'
'     function contains_SEGMENT() removed!
'     why do we need it ?
'     segment must be the second or the first keyword! no strings before it!
'
''''''''++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
''''''
''''''' assumed that s is a trimmed string, containing to TABS.
''''''' example:
'''''''     "DSEG    SEGMENT 'DATA'"
'''''''     "data segment"
''''''' searches "proc" token (ignores when it's in a string).
'''''' Function contains_SEGMENT(ByRef s As String) As Boolean
''''''    Dim ts As String
''''''    Dim i As Long
''''''
''''''    i = 0
''''''
''''''    Do While True
''''''
''''''        ts = getToken_str(s, i, " ") ' get token (full strings!)
''''''        If ts = Chr(10) Then Exit Do
''''''
''''''        If UCase(ts) = "SEGMENT" Then
''''''            contains_SEGMENT = True
''''''            Exit Function
''''''        End If
''''''
''''''        i = i + 1
''''''
''''''    Loop
''''''
''''''    contains_SEGMENT = False
''''''
''''''End Function

 Sub process_SEGMENT(ByRef s As String)

    Dim tempS As String

    ' check the match of previous SEGMENT / ENDS:
    If (sCurSegName <> "") And (sCurSegName <> "(NOSEG)") Then
        ' #BUG-short-def-2233-not-req# ' frmInfo.addErr currentLINE, cMT("no ENDS for:") & " " & sCurSegName, s
        Debug.Print currentLINE, "no ENDS for: " & sCurSegName
        sCurSegName = "(NOSEG)"
    End If


    ' make sure address is dividable by 16:
    ' (segment should always start with an address
    ' that has "0" in the end - in HEX)
      
    '1.23#241 tempS = ""
    Do While (locationCounter Mod 16) <> 0
        'frmMain.txtOut.Text = frmMain.txtOut.Text & "00"    ' can be anything.
        '1.23#241 tempS = tempS & "00"    ' can be anything.
        add_to_arrOUT 0    ' can be anything.
        locationCounter = locationCounter + 1
    Loop

    '1.23#241 frmMain.lst_Out.AddItem tempS


    ' get name , and set it in Temporary Symbol Table:
    Dim sName As String
    Dim sType As String
    ' 1.23#217 Dim sVarSize As String
    
    sName = getNewToken(s, 0, " ") ' get name (it's the first token) (generally - MASM)
    
    
    ' #327xn-segment#
    ' #327xd-duplicate-segment#
    ' Debug.Print "327xd-duplicate-segment: process: " & sName
    If UCase(sName) = "SEGMENT" Then
        ' #327xn-segment#  probably label is the second
        sName = getNewToken(s, 1, " ")
        If Len(sName) = 0 Then
            ' first token is segment directive itselft, it means that we have no segment name.
            sName = "UNNAMED_SEGMENT_" & CStr(lUNNAMED_SEGMENT_COUNTER)
            lUNNAMED_SEGMENT_COUNTER = lUNNAMED_SEGMENT_COUNTER + 1
        End If
    End If
    
    
    
    
    sCurSegName = sName ' for process_ENDS() match check, and add to symbol table.
   
    sCurSegClass = extract_SEGMENT_CLASS(s) ' for process_ENDS().
   
    sType = "SEGMENT"
    
    ' 1.23#217 sVarSize = "-5"  ' -5 is for SEGMENT (it's not a var, so it's just for an indication)
   
    lCurSegStart = locationCounter

    
    tempS = Hex(lCurSegStart)
    
    
'''' ' seemed to be responsible for "2004-10-29-SEMENT-BUG"
'''' '     BUT NO!!! IT's EMULATOR'S BUG NOT COMPILATOR!


   ' remove last digit (it should be "0") - for SEGMENT ANCHOR is stored!
   Dim Size As Long
   Size = Len(tempS)
   ' no need to cut off when there is only one digit (should be 0):
   If (Size > 1) Then tempS = Mid(tempS, 1, Size - 1)

    
    
    
    

    
    
    ' 1.23#217 frmMain.lst_Temp_ST.AddItem sName & " " & tempS & " " & sVarSize & " " & sType & " (ITSELF)"
    add_to_Secondary_Symbol_Table sName, Val("&H" & tempS), -5, sType, "(ITSELF)"   ' -5 for segment.
    
End Sub

' assumed that s is a trimmed string, containing to TABS.
' example:
'     "SSEG    SEGMENT STACK   'STACK'"
' searches for "STACK"/"CODE"  etc... (STACK without marks also goes).
 Function extract_SEGMENT_CLASS(ByRef s As String) As String
    Dim ts As String
    Dim i As Long
    
    i = 0

    Do While True
    
        ts = getToken_str(s, i, " ") ' get token (full strings!)
        If ts = Chr(10) Then Exit Do
        
        ts = UCase(ts)
        
        If ts = "STACK" Then
            extract_SEGMENT_CLASS = "STACK"
            Exit Function
        ElseIf startsWith(ts, "'") Or startsWith(ts, """") Then
            ' remove quotation marks:
            extract_SEGMENT_CLASS = Trim(Mid(ts, 2, Len(ts) - 2))
            Exit Function
        End If
        
        i = i + 1
        
    Loop

    extract_SEGMENT_CLASS = "NONE"
    
End Function

' assumed that s is a trimmed string, containing to TABS.
' example:
'     "my ends"
' searches "ends" token (ignores when it's in a string).
 Function contains_ENDS(ByRef s As String) As Boolean
    Dim ts As String
    Dim i As Long
    
    i = 0

    Do While True
    
        ts = getToken_str(s, i, " ") ' get token (full strings!)
        If ts = Chr(10) Then Exit Do
        
        If UCase(ts) = "ENDS" Then
            contains_ENDS = True
            Exit Function
        End If
        
        i = i + 1
        
    Loop

    contains_ENDS = False
    
End Function

' it checks the match of SEGMENT / ENDS,
' though it doesn't support nesting!!
' it also adds an entry into txt_Segment_Sizes.Text
 Sub process_ENDS(ByRef s As String)
    Dim sName As String
    Dim lSegmentSize As Long
    
    sName = getNewToken(s, 0, " ")
    
    ' #327xa-end/s/p#
    If UCase(sName) = "ENDS" Then sName = ""
    
    
    If sName = "" Or StrComp(sName, sCurSegName, vbTextCompare) = 0 Then
            ' OK! Match!
        lSegmentSize = locationCounter - lCurSegStart
        
        'frmMain.lst_Segment_Sizes.AddItem sName & " " & make_min_len(Hex(lSegmentSize), 4, "0") & " " & sCurSegClass
        ' no need in make_min_len()
        frmMain.lst_Segment_Sizes.AddItem sCurSegName & " " & Hex(lSegmentSize) & " " & sCurSegClass
         
        sCurSegName = ""    ' reset.
        
    Else
        ' No match!
        frmInfo.addErr currentLINE, cMT("mismatched:") & " " & s, s
    End If

End Sub

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

' assumed that s has no TABS!
 Sub set_ENTRY_POINT(ByVal s As String)
 On Error GoTo err1
 
    Dim sName As String
    
    sName = getNewToken(s, 1, " ")
    
    '#no_more_10_13_entry_points
    ' #no_more_10_13_entry_points_BUG_v327b.
    If Len(sName) = 1 Then
        If Asc(sName) = 13 Or Asc(sName) = 10 Then sName = "-1"  ' restore default
        ' Debug.Print "set_ENTRY_POINT: " & Asc(sname)
    End If
    
    s_ENTRY_POINT = sName   ' cab be "" if END is used without parameter.
    
    Exit Sub
err1:
    s_ENTRY_POINT = "-1"
    Debug.Print "err1 set_ENTRY_POINT:" & err.Description
End Sub

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


' 1.22 for bugfix#186
Function get_everything_after_label_seg_prefix(ByVal sName As String) As String
    
    If starts_with_LABEL_or_SEG_PREFIX(sName) Then
    
        Dim lT1 As Long
        
        lT1 = InStr(1, sName, ":")
        
        sName = Trim(Mid(sName, lT1 + 1))

    End If
    
    get_everything_after_label_seg_prefix = sName
    
End Function

' 1.22 for bugfix#186
Function get_label_seg_prefix(ByRef sName As String) As String
    
    If starts_with_LABEL_or_SEG_PREFIX(sName) Then
    
        Dim lT1 As Long
        
        lT1 = InStr(1, sName, ":")
        
        get_label_seg_prefix = Trim(Mid(sName, 1, lT1))

        Exit Function
    End If
    
    get_label_seg_prefix = ""
    
End Function


'
'
' #327xq-equ-bug-4#   plus better fix for #1194b  , #1195c
' #400b3-terrible#   ( previously this sub was empty:)
Function FIX_db_dw(s As String) As String
On Error GoTo err1
 
 ' Debug.Print "FIX_db_dw:" & s
  
  If InStr(1, s, ":") > 0 Then
  
     ' #327xq-equ-bug-4-improve-old-fixes#  -- 327xq-1194b-1195c-1195c2.asm
    If InStr(1, s, " db:", vbTextCompare) > 0 Then
        s = Replace(s, " db:", " db ", 1, 1, vbTextCompare)
    End If
    If InStr(1, s, " dw:", vbTextCompare) > 0 Then
        s = Replace(s, " dw:", " db ", 1, 1, vbTextCompare)
    End If
    If InStr(1, s, " dd:", vbTextCompare) > 0 Then
        s = Replace(s, " dd:", " db ", 1, 1, vbTextCompare)
    End If
    If InStr(1, s, " :", vbTextCompare) > 0 Then
        s = Replace(s, " :", ":", 1, 1, vbTextCompare)
    End If
    
  End If
 
 
 FIX_db_dw = s
 
 
 
 Exit Function
err1:
     FIX_db_dw = s
    Debug.Print "vcannot be!"
End Function

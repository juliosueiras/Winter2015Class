Attribute VB_Name = "mDisassemblyList"
' #400-dissasembly#

' 2005-09-14

' mDisassemblyList.bas

' controls the disassembly viewer of the emulator

' fixed to work with frmEmulation.picDisList

' very similar to mMemoryList.bas



Option Explicit

Option Base 0  ' 4.00-Beta-3 ' #possible-optimize-BytesToStr()-Split()#  ' #400-Beta-3-Opt# jic.

' when "true" does the disassembling,
' used to prevent disassembling while loading
' some data into the memory:
Global b_Do_DISASSEMBLE As Boolean





' we fit as much as we can, but still there is a limit!
Global Const MAX_BYTES_TO_DISASSEMBLE As Long = 200
' assumed that it's possible to dissassemble each byte into separate line,
' but it's not possible to disassemble 1 byte into 2 or more lines.
' and this value cannot be > MAX_BYTES_TO_DISASSEMBLE
Global HOW_MUCH_DIS_LINES_CAN_FIT As Long
' cantains all the lines of the last disassembly!
Dim sDIS_STR_ARRAY(0 To MAX_BYTES_TO_DISASSEMBLE) As String
Global lTOTAL_DIS_LINES As Long   ' (-1) cause we count from zero, but if it is zero, then there is probably nothing to show.

''' too complicated
'''' Global lSHIFT_LINES As Long ' in case there are more disassembled lines than can actually fit, we use it to shift... should be nice...





' list index: cannot be > HOW_MUCH_DIS_LINES_CAN_FIT
'             should not be > lTOTAL_DIS_LINES
Global l_BLUE_Selected_Disassembly_LineIndex As Long
Global l_YELLOW_Selected_Disassembly_LineIndex As Long
' similar to above but hold real selected address
Global l_BLUE_Selected_Disassembly_ADDRESS As Long



Global lStartDisAddress As Long
Global lLastDisAddress As Long    ' updated accourding to how many bytes fit into memory list.



' THESE ARE MOVED HERE FROM mCodeSelector.bas:


'========================================================
' variables for disassembler:

' opcodes (actual bytes):
Global dis_p(0 To MAX_BYTES_TO_DISASSEMBLE) As Byte

' number of used bytes in dis_p:
Global dis_P_size As Long

' the resulting strings, it seems that there are
' about 9 times more chars for each actual byte, so I multiplied it by 20:
Global dis_recBuf(0 To MAX_BYTES_TO_DISASSEMBLE * 20) As Byte

' location counter for each disassembled line,
' assumed that each byte can be disassembled in a separate line:
Global dis_recLocCounter(0 To MAX_BYTES_TO_DISASSEMBLE) As Long

' number of used lines in recLocCounter
Global dis_iLineCounter As Long ' not sure why but originally dis_iLineCounter  is + 1 of lTOTAL_DIS_LINES.

'========================================================


Public Function get_DISASSEMBLED_LINE(lLineNum As Long) As String
On Error GoTo err1

    get_DISASSEMBLED_LINE = sDIS_STR_ARRAY(lLineNum)
    
    Exit Function
err1:
    Debug.Print "err: gdl:" & Err.Description
End Function



Public Sub selectDisassembled_Line_by_INDEX(lLineNum As Long, lColorSelector As Long)
On Error GoTo err1

    If lColorSelector = BLUE_SELECTOR Then
        l_BLUE_Selected_Disassembly_LineIndex = lLineNum
    Else
        l_YELLOW_Selected_Disassembly_LineIndex = lLineNum
    End If
    
    refreshDisassembly
        
    Exit Sub
err1:
    Debug.Print "err: gdl:" & Err.Description
End Sub

        
Public Sub CLEAR_DISASSEMBLY()
On Error GoTo err1

    frmEmulation.picDisList.Cls
    l_BLUE_Selected_Disassembly_LineIndex = 0
    l_YELLOW_Selected_Disassembly_LineIndex = -1
    ''' lSHIFT_LINES = 0
    l_BLUE_Selected_Disassembly_ADDRESS = 0
    
    Dim L As Long
    For L = 0 To MAX_BYTES_TO_DISASSEMBLE ' assumed byte for line (max)
        sDIS_STR_ARRAY(L) = ""
    Next L
    lTOTAL_DIS_LINES = 0

Exit Sub
err1:
    Debug.Print "err: cd:" & Err.Description
End Sub



Public Sub showDisassembly(ByRef recBuf() As Byte)

On Error GoTo err1

    frmEmulation.picDisList.Cls
    


''    ' testspeed @@@@@@@@@@@@ [start]
''    Dim sTT As Single
''    sTT = Timer
''    Dim xxTTT As Long
''    For xxTTT = 0 To 1000
''    ' GOOD! I'm going to keep that!
''    ' showDisassembly speed: 0,5039063   (OLD STYLE)
''    ' showDisassembly speed: 0,1601563   (OPTIMIZED)

    lTOTAL_DIS_LINES = 0
    

    ' #400-Beta-3-Opt#
    ' #possible-optimize-BytesToStr()-Split()#
    ' the optimization can be easily turned of!
    #If 0 Then

        
            ' #possible-optimize-BytesToStr()-Split()#
            Dim sOPTIMIZED As String
            sOPTIMIZED = BytesToStr(recBuf)
            sOPTIMIZED = RTrimZero(sOPTIMIZED)
            ' Debug.Print "sOPTIMIZED:" & sOPTIMIZED & ":"
            ' If InStr(1, sOPTIMIZED, vbNewLine, vbTextCompare) > 0 Then
            '    Debug.Print "vbNewLine: " & InStr(1, sOPTIMIZED, vbNewLine, vbTextCompare)
            ' End If
            ' it seems like we do not have Chr(13), but check anyway:
            If InStr(1, sOPTIMIZED, vbCr) > 0 Then
                sOPTIMIZED = Replace(sOPTIMIZED, vbCr, "")
            End If
            
            Dim sTEMP_ARRAY() As String
            Dim L As Long
            
            sTEMP_ARRAY = Split(sOPTIMIZED, Chr(10))
            
            lTOTAL_DIS_LINES = UBound(sTEMP_ARRAY)
            
            ' need to apply fix anyway:
            For L = 0 To lTOTAL_DIS_LINES
                sDIS_STR_ARRAY(L) = fix_327xo_dis_fix(sTEMP_ARRAY(L))
            Next L
            
            '    If Len(sDIS_STR_ARRAY(lTOTAL_DIS_LINES)) = 0 Then
            '        Debug.Print "you're right, the last line is empty"
            '    End If
            
            Erase sTEMP_ARRAY

    #Else
    
            Dim i As Long
            Dim buf As String
            Dim b As Byte
        
            buf = ""
            i = 0
    
            Do While recBuf(i) <> 0  ' zero terminated ASCII buffer
                b = recBuf(i)
                If b = 10 Then
                    buf = fix_327xo_dis_fix(buf)
                    sDIS_STR_ARRAY(lTOTAL_DIS_LINES) = buf
                    lTOTAL_DIS_LINES = lTOTAL_DIS_LINES + 1
                    buf = ""
                ElseIf b = 13 Then
                    ' just skip it (it doesn't seem to appear anyway).
                Else
                    buf = buf & Chr(b)
                End If
                i = i + 1
            Loop

    
   #End If
    
''''    ' testspeed @@@@@@@@@@@@ [stop]
''''    Next xxTTT
''''    Debug.Print "showDisassembly speed: " & Timer - sTT
''''
    
    lTOTAL_DIS_LINES = lTOTAL_DIS_LINES - 1  ' that should be because we are inclusive. (seems to be true for optimized too, the last line must be zero length).
    ' Debug.Print "TT:" &  lTOTAL_DIS_LINES
    ' #400-dissasembly-last-line#
    ' in addition never show the last disassembled line, because it is generally corrupted! (partitial disassembly).
    sDIS_STR_ARRAY(lTOTAL_DIS_LINES) = ""
    lTOTAL_DIS_LINES = lTOTAL_DIS_LINES - 1


    refreshDisassembly
    

Exit Sub
err1:
    Debug.Print "err sdis:" & Err.Description

End Sub


' 4.00 moved here from frmEmulation
' #327xo-dis-fix#
Private Function fix_327xo_dis_fix(s As String) As String
On Error GoTo err1
    Dim s1 As String
    ' JMP 0FFFFEA45h  must be  JMP 0EA45h
    s1 = Left(s, 9)
    If StrComp(s1, "JMP 0FFFF") = 0 Then
        fix_327xo_dis_fix = "JMP 0" & Mid(s, 10)
    Else
        fix_327xo_dis_fix = s
    End If
    
Exit Function
err1:
    fix_327xo_dis_fix = s
    Debug.Print "fix_327xo_dis_fix: " & Err.Description
End Function


Public Sub refreshDisassembly()
On Error GoTo err1
    
    
clear_dis_list_and_print:
    frmEmulation.picDisList.Cls
    Dim lOrigForeColor As Long
    lOrigForeColor = frmEmulation.picDisList.ForeColor
    
    
    ' calculating this several times to avoid any problems... with changed fonts
    Dim f As Single
    f = frmEmulation.picDisList.TextHeight("FF")
    HOW_MUCH_DIS_LINES_CAN_FIT = Fix(frmEmulation.picDisList.ScaleHeight / f) - 2
       
    
' this is far from simple, thus it's buggy
'''    If lTOTAL_DIS_LINES > HOW_MUCH_DIS_LINES_CAN_FIT Then
'''        If l_BLUE_Selected_Disassembly_LineIndex > HOW_MUCH_DIS_LINES_CAN_FIT - 1 Then
'''            Debug.Print "SHIFT DIS LINES:"; lTOTAL_DIS_LINES - HOW_MUCH_DIS_LINES_CAN_FIT
'''            lSHIFT_LINES = lTOTAL_DIS_LINES - HOW_MUCH_DIS_LINES_CAN_FIT
'''        Else
'''            lSHIFT_LINES = 0
'''        End If
'''    Else
'''        lSHIFT_LINES = 0
'''    End If

    
    If lTOTAL_DIS_LINES > HOW_MUCH_DIS_LINES_CAN_FIT Then
        lTOTAL_DIS_LINES = HOW_MUCH_DIS_LINES_CAN_FIT
        dis_iLineCounter = lTOTAL_DIS_LINES + 1 ' not sure why but originally dis_iLineCounter  is + 1 of lTOTAL_DIS_LINES , just keeping the proportion.
    End If
    
    Dim L As Long
    For L = 0 To lTOTAL_DIS_LINES
    
'        ' Uh... that's complex!
'        If l_BLUE_Selected_Disassembly_LineIndex <> L Then
'            If l_BLUE_Selected_Disassembly_ADDRESS = (lStartDisAddress + dis_recLocCounter(L)) Then
'                l_BLUE_Selected_Disassembly_LineIndex = L
'                GoTo clear_dis_list_and_print  ' print it again to avoid 2 blue lines
'            End If
'        End If
        
        If L = l_BLUE_Selected_Disassembly_LineIndex And l_BLUE_Selected_Disassembly_LineIndex = l_YELLOW_Selected_Disassembly_LineIndex Then
            frmEmulation.picDisList.ForeColor = vbWhite
            draw_SELECTOR GREEN_SELECTOR
        ElseIf L = l_YELLOW_Selected_Disassembly_LineIndex Then
            frmEmulation.picDisList.ForeColor = vbBlack
            draw_SELECTOR YELLOW_SELECTOR
        ElseIf L = l_BLUE_Selected_Disassembly_LineIndex Then
            frmEmulation.picDisList.ForeColor = vbWhite
            draw_SELECTOR BLUE_SELECTOR
        Else
            frmEmulation.picDisList.ForeColor = lOrigForeColor
            ' no selector.
        End If
        frmEmulation.picDisList.Print " " & sDIS_STR_ARRAY(L)
    Next L
    
    frmEmulation.picDisList.ForeColor = lOrigForeColor
    frmEmulation.picDisList.ForeColor = SystemColorConstants.vbWindowText  ' vbBlack
    frmEmulation.picDisList.Print " ..."
    
Exit Sub
err1:
    Debug.Print "err: rdd: " & Err.Description
End Sub


' 4.00 moved here from frmEmulation
Public Sub DoDisassembling(lDisFromAddress As Long, Optional bUSE_SEGMENT_OFFSET As Boolean = False, Optional lSEG As Long, Optional lOFS As Long)

On Error GoTo err_disasm
           
    If b_Do_DISASSEMBLE = False Then Exit Sub

    Dim lSEGMENT As Long
    Dim lOFFSET As Long
    
    Dim i As Long

    
    ' as a temporary solution to "2008-07-18_bug.asm" I decided to do:
    ' bUSE_SEGMENT_OFFSET = True
    ' but it creates problems with LOOP instruction, so abolished.


    ' if not sent to function, this is "false":
    If bUSE_SEGMENT_OFFSET Then
        lSEGMENT = lSEG
        lOFFSET = lOFS
    Else
        ' is used to convert physical address to segment:offset,
        ' and show the memory, in case it is possible CS is used
        ' as a default segment:
           
        Dim iCS As Integer
        iCS = frmEmulation.get_CS
        
        lOFFSET = lDisFromAddress - to_unsigned_long(iCS) * &H10
        
        If (lOFFSET > 0) And (lOFFSET <= 65535) Then
           lSEGMENT = to_unsigned_long(iCS)
        Else
           lSEGMENT = lDisFromAddress / &H10
           lOFFSET = lDisFromAddress Mod &H10
        End If
    End If

            
    frmEmulation.txtDisAddr.Text = make_min_len(Hex(lSEGMENT), 4, "0") & ":" & make_min_len(Hex(lOFFSET), 4, "0")
    

    dis_P_size = 0


    ' calculating this several times to avoid any problems... with changed fonts
    Dim f As Single
    f = frmEmulation.picDisList.TextHeight("FF")
    HOW_MUCH_DIS_LINES_CAN_FIT = Fix(frmEmulation.picDisList.ScaleHeight / f) - 1
    
    

' #400-dissasembly#
' @@@@ now here:
    lStartDisAddress = lDisFromAddress
    ' generally 3 bytes form 1 line
    lLastDisAddress = lDisFromAddress + HOW_MUCH_DIS_LINES_CAN_FIT * 3



    ' #400b6-BUG110#
    If lLastDisAddress > MAX_MEMORY Then
        frmEmulation.picDisList.Cls
        frmEmulation.picDisList.Print "out of memory!"
        dis_iLineCounter = 0
        l_BLUE_Selected_Disassembly_LineIndex = -1
        l_YELLOW_Selected_Disassembly_LineIndex = -1
        Exit Sub
    End If
    

    
    For i = lStartDisAddress To lLastDisAddress
        dis_p(dis_P_size) = RAM.mREAD_BYTE(i)
        dis_P_size = dis_P_size + 1
    Next i
    
    ' Debug.Print IP, dis_P_size
        
    dis_iLineCounter = disassemble(dis_recBuf(0), dis_recLocCounter(0), dis_p(0), dis_P_size, lOFFSET) ' 1.16 lDisFromAddress)
    
    
    
    ' #400-dissasembly-last-line#
    ' never show the last disassembled line, because it is generally corrupted! (partitial disassembly).
    dis_iLineCounter = dis_iLineCounter - 1
    
    

    ' printBuffer dis_recBuf
    showDisassembly dis_recBuf
    
' @@@@ was here.


' it is easier that selecting by memory location...
' well at some point :)
l_BLUE_Selected_Disassembly_LineIndex = -1
l_YELLOW_Selected_Disassembly_LineIndex = -1
    



Exit Sub
err_disasm:
    Debug.Print "disassembler error: " & Err.Description
End Sub


Sub FREE_DIS_MEMORY()
On Error GoTo err1:
    lTOTAL_DIS_LINES = 0
    Erase sDIS_STR_ARRAY
    Exit Sub
err1:
    Debug.Print "mDI FrEEm:" & Err.Description
End Sub



' clone from mMemoryList.bas
' Draws item selector of selected list item:
Private Sub draw_SELECTOR(lColor As Long)

On Error GoTo err1

    Dim fORIG_cX As Single
    Dim fORIG_cY As Single
    
    ' remember original current X/Y:
    fORIG_cX = frmEmulation.picDisList.CurrentX
    fORIG_cY = frmEmulation.picDisList.CurrentY
    
    Dim fCharHeight As Single
    fCharHeight = frmEmulation.picDisList.TextHeight("FF")

    frmEmulation.picDisList.Line (0, fORIG_cY)-(frmEmulation.picDisList.ScaleWidth, fORIG_cY + fCharHeight), lColor, BF

    
    ' restore original current X/Y:
    frmEmulation.picDisList.CurrentX = fORIG_cX
    frmEmulation.picDisList.CurrentY = fORIG_cY
    
    
    Exit Sub
err1:
    Debug.Print "err 12233: " & Err.Description
End Sub






' prior v4.00 it was known as:   Private Sub cmdDisassemble_Click()
'                                 and it was located on frmEmulation.
Sub DO_DISASSEBLE_FROM_HEX_ADDR_FRM_EMULATION()
On Error GoTo err_cmdc

    Dim lT As Long

    Dim lSEGMENT As Long
    Dim lOFFSET As Long

' #400-RR#
''    lSEGMENT = getSEGMENT_from_HEX_STRING(frmEmulation.txtDisAddr.Text)
''    lOffset = getOFFSET_from_HEX_STRING(frmEmulation.txtDisAddr.Text)
''    lT = getAddress_from_HEX_STRING(frmEmulation.txtDisAddr.Text)
    lSEGMENT = get_segment_address_from_hex_ea(frmEmulation.txtDisAddr.Text)
    lOFFSET = get_offset_address_from_hex_ea(frmEmulation.txtDisAddr.Text)
    lT = get_physical_address_from_hex_ea(frmEmulation.txtDisAddr.Text)
    
    
    
    DoDisassembling lT, True, lSEGMENT, lOFFSET
    
    ' select only in case code at this address is disassembled (and thus is visible):
    If (lT >= (lStartDisAddress + dis_recLocCounter(0))) Then
      If (lT <= (lStartDisAddress + dis_recLocCounter(dis_iLineCounter - 1))) Then
        selectDisassembled_Line_by_ADDRESS lT, YELLOW_SELECTOR
      End If
    End If
    
Exit Sub
err_cmdc:
    Debug.Print "cmdDisassemble_Click() " & LCase(Err.Description)
End Sub



Sub selectDisassembled_Line_by_ADDRESS(lShowAtAdr As Long, lColorSelector As Long, Optional bSHOW_MEM_LINE_TOO As Boolean = False)

On Error GoTo err_sel
    Dim i As Long
    Dim bTRIED_RECOMPILE As Boolean  '1.28#377
    
    bTRIED_RECOMPILE = False
    
    ' avoid error in case not disassembled yet:
    If lTOTAL_DIS_LINES = 0 Then Exit Sub


  '  lCurAdr = to_unsigned_long(CS) * 16 + to_unsigned_long(IP)
    
    ' check in case code at this address isn't disassembled (and
    ' thus not visible):
    If (lShowAtAdr < (lStartDisAddress + dis_recLocCounter(0))) _
      Or (lShowAtAdr > (lStartDisAddress + dis_recLocCounter(dis_iLineCounter - 1))) Then
try_redisassemble:
        DoDisassembling lShowAtAdr
    End If
    
    ' select a line that corresponds to lShowAtAdr:
    For i = 0 To dis_iLineCounter - 1
        If lShowAtAdr = (lStartDisAddress + dis_recLocCounter(i)) Then
            ' lstDECODED.ListIndex = i
            selectDisassembled_Line_by_INDEX i, lColorSelector
            l_BLUE_Selected_Disassembly_ADDRESS = lShowAtAdr
            
            ' #400b9-blue-all-bytes#
            If bSHOW_MEM_LINE_TOO Then
                Dim lT As Long
                lT = lStartDisAddress + dis_recLocCounter(i)
                Dim lT2 As Long
                lT2 = lStartDisAddress + dis_recLocCounter(i + 1) - 1
                selectMemoryLine_BLUE lT, lT2, True
            End If
            
            Exit Sub
        End If
    Next i
    
    ' 1.28#377
    'When IP is set to the middle of some instruction, the decoded list
    'does not select the instruction, and that's ok. But I think it should
    'reassemble and show the correct instruction that is going to be executed!
    If Not bTRIED_RECOMPILE Then
            ' Debug.Print "fixing by redis"
            bTRIED_RECOMPILE = True
            GoTo try_redisassemble
    End If
    
    Exit Sub
err_sel:
    Debug.Print "Error on selectDisassembledLine() " & LCase(Err.Description)
End Sub


Public Function only_hex_digits(s As String) As Boolean
On Error Resume Next
    
    Dim L As Long
    
    For L = 1 To Len(s)
        Dim c As String
        c = Mid(s, L, 1)
        If InStr(1, "0123456789abcdef", c, vbTextCompare) <= 0 Then
            only_hex_digits = False
            Exit Function
        End If
    Next L
    
    only_hex_digits = True
    
End Function

' #400-RR# moved here from frmDebugLog
'
'  seems to be similar to getAddress_from_HEX_STRING() but a bit more advanced,
'  because this one understands even: DS:001 etc...
'
' a modified clone of read_value_from_debug_style_ea() - this modification accepts registers as offset!

' MODIFIES PARAMETER== REMOVES SPACES ONLY! (TRIM).

Function get_physical_address_from_hex_ea(sAddr As String) As Long
On Error GoTo err1

    Dim lPhysicalAddr As Long
    
    ' #400B5-NEW-INPUT#
    ' MAKE IT THINK ABOUT PHYSICAL ADDRESS WHEN 5 DIGITS WITHOUT DOT ARE ENTERED.
    sAddr = Trim(sAddr)
    If Len(sAddr) >= 5 And InStr(1, Trim(sAddr), " ") <= 0 Then
        If only_hex_digits(sAddr) Then
            lPhysicalAddr = Val("&H" & sAddr)
            GoTo got_it
        End If
    End If
    
    
    
    
    ' #327xb-d-err# - passing by REF!
    ' wrongs are : AX,DX.. etc  (not allowed to be memory pointer).
    replace_any_wrong_register_name_inside_with_hex_BY_REF sAddr

    
    
    Dim sSegment As String
    Dim sOffset As String
    Dim L As Long  ' #327xa-allow-numeric-seg-for-d#
    
    L = InStr(1, sAddr, ":")
    If L > 0 Then
        sSegment = UCase(Mid(sAddr, 1, L - 1)) ' before :
        sOffset = UCase(Mid(sAddr, L + 1))     ' after :
    Else
        sSegment = "DS" ' #400b9-ds-default# ' "CS"
        sOffset = UCase(sAddr)
    End If
    

    
    Select Case sSegment
    Case "DS"
        lPhysicalAddr = to_unsigned_long(frmEmulation.get_DS)
    Case "CS"
        lPhysicalAddr = to_unsigned_long(frmEmulation.get_CS)
    Case "ES"
        lPhysicalAddr = to_unsigned_long(frmEmulation.get_ES)
    Case "SS"
        lPhysicalAddr = to_unsigned_long(frmEmulation.get_SS)
    Case Else
        lPhysicalAddr = to_unsigned_long(Val("&H" & sSegment)) ' #400-new-mem-viewer-bug#  + #400-major-bug#
    End Select


    Dim s As String
    s = get_offset_from_registers_memory_combination(sOffset)
    If s = "-" Then GoTo err2
    
    lPhysicalAddr = lPhysicalAddr * &H10
    lPhysicalAddr = lPhysicalAddr + to_unsigned_long(Val("&H" & s))        ' 4 letter hex number is a singed integer in vb.
    
got_it:
    
    get_physical_address_from_hex_ea = lPhysicalAddr
    
    

Exit Function
err1:
    get_physical_address_from_hex_ea = -1
    Debug.Print "get_physical_address_from_hex_ea: err1: " & Err.Description
    Exit Function
err2:
    get_physical_address_from_hex_ea = -1
    Debug.Print "get_physical_address_from_hex_ea: err2: " & sAddr
End Function


' #400-RR# moved here from frmDebugLog
' #327xb-d-err#
' replaces wrong memory indexes with pure HEX! PARAMETER PASSED BY REF!
' NOTE: this sub may not correctly replace some strings! for example: "ax+daxe" (both "ax" will be replaced), however it is not used where it might be vital, because debug works with registers and hex values only)
Sub replace_any_wrong_register_name_inside_with_hex_BY_REF(ByRef sInput As String)
On Error GoTo err1

    Dim sArr() As String
    Dim sTemp As String
    
    sTemp = sInput
    
    sTemp = replace_all_these_with_spaces(sTemp, DELIMETERS_ALL)
    
    sArr = Split(sTemp, " ")
    
    Dim i As Long
    Dim k As Long
    Dim s As String
    Dim sV As String
    Const sWrongRegs As String = "ax,dx,cx,ip,sp,al,ah,bl,bh,cl,ch,dl,dh"
    
    For i = LBound(sArr) To UBound(sArr)
        s = LCase(sArr(i))
        If Len(s) = 2 Then
            k = InStr(1, sWrongRegs, s)
            If k > 0 Then
                sV = Mid(sWrongRegs, k, 2)
                sInput = Replace(sInput, sV, get_register_value(sV), 1, -1, vbTextCompare)
            End If
        End If
    Next i

    Erase sArr '  #327xp-erase#

    Exit Sub
err1:
    Debug.Print "replace_any_wrong_register_name_inside_with_hex_BY_REF: " & Err.Description
End Sub


' #400-RR# moved here from frmDebugLog
' #327w-more-debug-like#
' returns hex value without suffix!
' returns always 4 chars (unless error).
' return "-" on error
Function get_offset_from_registers_memory_combination(sInput As String) As String
On Error GoTo err1
    
    Dim iOffset As Integer
    Dim iTemp As Integer
    
    ' first just eval, it should ignore any registers that are inside:
    bWAS_ERROR_ON_LAST_EVAL_EXPR = False
    iOffset = evalExpr(sInput, True)
    If bWAS_ERROR_ON_LAST_EVAL_EXPR Then
        bWAS_ERROR_ON_LAST_EVAL_EXPR = False
        ' proceesed by others ' add_to_log " ^ error"
        get_offset_from_registers_memory_combination = "-"
        Exit Function
    End If
    
    ' now add all (allowable) registers that might be inside: "BX", "SI", "DI", "BP"
    
    If SingleWord_NotInsideQuotes_InStr(sInput, "BX") > 0 Then
        iTemp = frmEmulation.get_BX
        iOffset = mathAdd_WORDS(iOffset, iTemp)
    End If
    
    If SingleWord_NotInsideQuotes_InStr(sInput, "SI") > 0 Then
        iTemp = frmEmulation.get_SI
        iOffset = mathAdd_WORDS(iOffset, iTemp)
    End If

    If SingleWord_NotInsideQuotes_InStr(sInput, "DI") > 0 Then
        iTemp = frmEmulation.get_DI
        iOffset = mathAdd_WORDS(iOffset, iTemp)
    End If

    If SingleWord_NotInsideQuotes_InStr(sInput, "BP") > 0 Then
        iTemp = frmEmulation.get_BP
        iOffset = mathAdd_WORDS(iOffset, iTemp)
    End If
    
    ' we are not checking for illigal addressing modes here...
    
    
   get_offset_from_registers_memory_combination = make_min_len(Hex(iOffset), 4, "0")
    
    
    Exit Function
err1:
    Debug.Print "err get_offset_from_registers_memory_combination: " & Err.Description
    get_offset_from_registers_memory_combination = "-"
End Function

' #400-RR# moved here from frmDebugLog
' #327xb-d-err#
' help the above function, because VB's function accepts only one delimter char
Function replace_all_these_with_spaces(sInput As String, sAll_These As String) As String

On Error Resume Next ' 4.00-Beta-3

    Dim k As Long
    Dim s As String
    Dim ST As String
    
    s = sInput
    
    For k = 1 To Len(sAll_These)
        ST = Mid(sAll_These, k, 1)
        s = Replace(s, ST, " ", 1, -1, vbTextCompare)
    Next k
    
    replace_all_these_with_spaces = s
    
End Function

' #400-RR# moved here from frmDebugLog
' #327xb-d-err#
' returns hex value of a register from name,
' helps the above sub
' parameter must be lower cased.
' supported parameters: "ax,dx,cx,ip,sp,al,ah,bl,bh,cl,ch,dl,dh"
Function get_register_value(sInput As String) As String
    
On Error Resume Next ' 4.00-Beta-3
    
    Select Case sInput
    Case "ax"
        get_register_value = siHEX(frmEmulation.get_AX)
    Case "dx"
        get_register_value = siHEX(frmEmulation.get_DX)
    Case "cx"
        get_register_value = siHEX(frmEmulation.get_CX)
    Case "ip"
        get_register_value = siHEX(frmEmulation.get_IP)
    Case "sp"
        get_register_value = siHEX(frmEmulation.get_SP)
    Case "al"
        get_register_value = siHEX(frmEmulation.get_AL)
    Case "ah"
        get_register_value = siHEX(frmEmulation.get_AH)
    Case "bl"
        get_register_value = siHEX(frmEmulation.get_BL)
    Case "bh"
        get_register_value = siHEX(frmEmulation.get_BH)
    Case "cl"
        get_register_value = siHEX(frmEmulation.get_CL)
    Case "ch"
        get_register_value = siHEX(frmEmulation.get_CH)
    Case "dl"
        get_register_value = siHEX(frmEmulation.get_DL)
    Case "dh"
        get_register_value = siHEX(frmEmulation.get_DH)
    Case Else
        Debug.Print "get_register_value: wrong parameter!: " & sInput
    End Select
    
End Function

' #400-RR# moved here from frmDebugLog
Function siHEX(iInput As Integer) As String
On Error GoTo err1
    siHEX = make_min_len(Hex(iInput), 4, "0")
    Exit Function
err1:
    Debug.Print "siHEX: " & iInput
    siHEX = "0000"
End Function

' #400-RR# moved here from frmDebugLog
' a modified clone of read_value_from_debug_style_ea()
' sAddr must have a segment prefix!
' RETURNS SEGMENT ONLY! WITHTOUT HEX ZERO IN THE END (not multiplied by 16!)
Function get_segment_address_from_hex_ea(sAddr As String) As Long
On Error GoTo err1
    
    ' 4.00
    replace_any_wrong_register_name_inside_with_hex_BY_REF sAddr
    
    
    
    
    Dim sSegment As String
    ' not used here' Dim sOffset As String
    Dim L As Long  ' #327xa-allow-numeric-seg-for-d#
    
    L = InStr(1, sAddr, ":")
    If L > 0 Then
        sSegment = UCase(Mid(sAddr, 1, L - 1)) ' before :
       ' sOffset = UCase(Mid(sAddr, l + 1))     ' after :
    Else
        ' #400-b8-BUG2# ' sSegment = "CS"
        sSegment = "DS" ' #400-b8-BUG2#
       ' sOffset = UCase(sAddr)
    End If
    
    
    Dim lPhysicalAddr As Long
    
    Select Case sSegment
    Case "DS"
        lPhysicalAddr = to_unsigned_long(frmEmulation.get_DS)
    Case "CS"
        lPhysicalAddr = to_unsigned_long(frmEmulation.get_CS)
    Case "ES"
        lPhysicalAddr = to_unsigned_long(frmEmulation.get_ES)
    Case "SS"
        lPhysicalAddr = to_unsigned_long(frmEmulation.get_SS)
    Case Else
        lPhysicalAddr = to_unsigned_long(Val("&H" & sSegment)) ' #400-new-mem-viewer-bug#  + #400-major-bug#
    End Select

    
    get_segment_address_from_hex_ea = lPhysicalAddr
    

Exit Function
err1:
    get_segment_address_from_hex_ea = -1
    Debug.Print "get_segment_address_from_hex_ea: " & Err.Description
End Function

' #400-RR# moved here from frmDebugLog
' a modified clone of read_value_from_debug_style_ea()
Function get_offset_address_from_hex_ea(sAddr As String) As Long
On Error GoTo err1
    
    ' 4.00
    replace_any_wrong_register_name_inside_with_hex_BY_REF sAddr
    
    
        
    
    Dim sOffset As String

    Dim L As Long  ' #327xa-allow-numeric-seg-for-d#
    
    L = InStr(1, sAddr, ":")
    If L > 0 Then
        sOffset = UCase(Mid(sAddr, L + 1))     ' after :
    Else
        sOffset = UCase(sAddr)
    End If
    
    get_offset_address_from_hex_ea = to_unsigned_long(Val("&H" & get_offset_from_registers_memory_combination(sOffset)))     ' 4 letter hex number is a singed integer in vb.
       

Exit Function
err1:
    get_offset_address_from_hex_ea = -1
    Debug.Print "get_offset_address_from_hex_ea: " & Err.Description
End Function

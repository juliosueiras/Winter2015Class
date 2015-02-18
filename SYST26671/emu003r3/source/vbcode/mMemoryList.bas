Attribute VB_Name = "mMemoryList"
' #327xr-400-new-mem-list#

' 2005-09-13

' mMemoryList.bas

' controls the memory viewer of the emulator

' fixed to work with frmEmulation.picMemList

Option Explicit


Global lStartMemAddress As Long
Global lLastMemAddress As Long    ' updated accourding to how many bytes fit into memory list.

' current instruction selector:
Global lBLUE_SelectedMemoryLocation_FROM As Long
Global lBLUE_SelectedMemoryLocation_UNTIL As Long

' click selector:
Global lYELLOW_SelectedMemoryLocation_FROM As Long
Global lYELLOW_SelectedMemoryLocation_UNTIL As Long


' same colors are used for dissassembly list:
Global Const YELLOW_SELECTOR = 9895935   ' Yellow RGB(255, 255, 150)
Global Const BLUE_SELECTOR = 16711680    ' Blue rgb(0,0,255)
Global Const GREEN_SELECTOR = 39680   ' GREEN rgb(0,155,0)


' #400-additional-frmMemory#  now it's shared for memory viewer and debug log
'  ADVANCES PARAMETERS (used by next "d" command for debug!)
' does not dup over  1024 bytes!
Function get_MEMORY_DUMP_BYREF(ByRef lSEGMENT As Long, ByRef lOFFSET As Long, ByRef lPhysical As Long, ByVal lBytesToDump As Long) ' #400b3-impr-debug1#
On Error GoTo err1

    ' MODIFIES PARAMETERS!

    Dim sOutput As String
    sOutput = ""


    ' avoid hangups!
    If lBytesToDump > 1024 Then
        lBytesToDump = 1024
    End If
    
    

    Dim lBytesCounter As Long ' #400b3-impr-debug1#
    lBytesCounter = 0


    Dim i_lr As Integer
    Dim i_tb As Integer
    
add_more_bytes:
    
    For i_tb = 0 To 7
    
        Dim s1 As String
        Dim s2 As String
        s1 = sHEX(lSEGMENT) & ":" & sHEX(lOFFSET) & "  "
        s2 = ""
            
        For i_lr = 0 To 15
            

            Dim b As Byte
            b = RAM.mREAD_BYTE(lPhysical)
            s1 = s1 & sbHEX(b)
            If i_lr <> 7 Then
                s1 = s1 & " "
            Else
                s1 = s1 & "-"
            End If
            s2 = s2 & sASCII(b)
            
            If lOFFSET >= 65535 Then
                lOFFSET = 0
                lSEGMENT = lSEGMENT + 1  ' DEBUG.EXE does not do this, but we will :)
            Else
                lOFFSET = lOFFSET + 1
            End If
            
            lPhysical = lPhysical + 1
            
            
            lBytesCounter = lBytesCounter + 1               ' #400b3-impr-debug1#
            If lBytesCounter >= lBytesToDump Then Exit For  ' #400b3-impr-debug1#
            
        Next i_lr
        
        sOutput = sOutput & make_min_len_RIGHT(s1, 59, " ") & "   " & s2 & vbNewLine  ' #400b3-impr-debug1#  make_min_len_RIGHT() added.
        
        If lBytesCounter >= lBytesToDump Then Exit For ' #400b3-impr-debug1#
        
    Next i_tb
    
    
    
    If lBytesCounter < lBytesToDump Then GoTo add_more_bytes ' #400b3-impr-debug1#
    
    
    
    get_MEMORY_DUMP_BYREF = sOutput
    
    
    Exit Function
    
err1:
    Debug.Print "get_memory_dump :" & Err.Description
    get_MEMORY_DUMP_BYREF = "??"
    
End Function

' 4.00
' moved from frmDebugLog
Function sHEX(lInput As Long) As String
On Error GoTo err1
    sHEX = make_min_len(Hex(to_signed_int(lInput)), 4, "0")
    Exit Function
err1:
    Debug.Print "sHEX: " & lInput
    sHEX = "0000"
End Function
Public Sub showMemory_at_Segment_Offset(iSegment As Integer, iOffset As Integer)
On Error GoTo err1

    Dim L As Long
    
    L = to_unsigned_long(iSegment)
    L = L * 16
    L = L + to_unsigned_long(iOffset)
    
    showMemory L

Exit Sub
err1:
    Debug.Print "err1171: " & Err.Description
End Sub

' shows as much memory as it can fit!
Public Sub showMemory(lFromAddr As Long)
On Error GoTo err1
    
    If frmEmulation.Visible = False Then Exit Sub ' #327xr-400-new-mem-lis-opt1#
    
    
    
    ' add as much as can fit!
    Dim FT As Long
    FT = frmEmulation.picMemList.TextHeight("FF")
    FT = Fix(frmEmulation.picMemList.ScaleHeight / FT) - 1
    
    lStartMemAddress = lFromAddr
    lLastMemAddress = lStartMemAddress + FT
    
    ' #400b6-BUG110#
    If lLastMemAddress > MAX_MEMORY Then
        frmEmulation.picMemList.Cls
        frmEmulation.picMemList.Print "out of memory!"
        Exit Sub
    End If
    
    
    frmEmulation.picMemList.Cls

    Dim L As Long
    Dim b As Byte
    Dim s As String
    
    
    ' caption messes things up and its ugly,
    ' frmEmulation.picMemList.Print " " & "addr : hex  dec  ascii"
    
    For L = lFromAddr To lLastMemAddress
        b = RAM.mREAD_BYTE(L)
' #400b9-blue-all-bytes#
''''        If L = lBLUE_SelectedMemoryLocation_FROM And L = lYELLOW_SelectedMemoryLocation_FROM Then
''''            draw_SELECTOR GREEN_SELECTOR
''''            frmEmulation.picMemList.ForeColor = vbWhite ' all white on green.
''''            frmEmulation.picMemList.Print " " & make_min_len(Hex(L), 5, "0") & ": " & byteHEX(b) & " " & byteDEC(b) & " " & byteChar(b)
''''        ElseIf L >= lBLUE_SelectedMemoryLocation_FROM And L <= lBLUE_SelectedMemoryLocation_UNTIL Then
' #400b9-blue-all-bytes#
        If L >= lBLUE_SelectedMemoryLocation_FROM And L <= lBLUE_SelectedMemoryLocation_UNTIL Then
            If L >= lYELLOW_SelectedMemoryLocation_FROM And L <= lYELLOW_SelectedMemoryLocation_UNTIL Then
                draw_SELECTOR GREEN_SELECTOR
            Else
                draw_SELECTOR BLUE_SELECTOR
            End If
            frmEmulation.picMemList.ForeColor = vbWhite ' all white on blue/green.
            frmEmulation.picMemList.Print " " & make_min_len(Hex(L), 5, "0") & ": " & byteHEX(b) & " " & byteDEC(b) & " " & byteChar(b)
        ElseIf L >= lYELLOW_SelectedMemoryLocation_FROM And L <= lYELLOW_SelectedMemoryLocation_UNTIL Then
            draw_SELECTOR YELLOW_SELECTOR
            frmEmulation.picMemList.ForeColor = vbBlack ' all black on yellow
            frmEmulation.picMemList.Print " " & make_min_len(Hex(L), 5, "0") & ": " & byteHEX(b) & " " & byteDEC(b) & " " & byteChar(b)
        Else
            frmEmulation.picMemList.ForeColor = SystemColorConstants.vbWindowText  '7697781 ' address RGB(117, 117, 117)
            frmEmulation.picMemList.Print " " & make_min_len(Hex(L), 5, "0") & ": ";
            frmEmulation.picMemList.ForeColor = SystemColorConstants.vbWindowText  '29952 ' hex RGB(0, 117, 0)
            frmEmulation.picMemList.Print byteHEX(b) & " ";
            frmEmulation.picMemList.ForeColor = SystemColorConstants.vbWindowText  '7697781  ' dec RGB(117, 117, 117)
            frmEmulation.picMemList.Print byteDEC(b) & " ";
            frmEmulation.picMemList.ForeColor = SystemColorConstants.vbWindowText  'vbBlack ' ascii
            frmEmulation.picMemList.Print byteChar(b)
        End If
    
    Next L

    
    ' #400-RR# ' If getAddress_from_HEX_STRING(frmEmulation.txtMemoryAddr.Text) <> lFromAddr Then
    If get_physical_address_from_hex_ea(frmEmulation.txtIntegratedMemoryAddr.Text) <> lFromAddr Then
        Dim lSEG As Long
        Dim lOff As Long
        GetSegmentOffset_FromPhysical lFromAddr, frmEmulation.get_CS, lSEG, lOff
        ' #400b4-mini-8-b# '  frmEmulation.txtMemoryAddr.Text = make_min_len(Hex(lSEG), 4, "0") & ":" & make_min_len(Hex(lOff), 4, "0")
        ' #400b4-mini-8-b#
         frmEmulation.txtIntegratedMemoryAddr.Text = make4digitHex(lSEG) & ":" & make4digitHex(lOff)
    End If
    

    Exit Sub
err1:
    Debug.Print "ERR: mMemoryList.show_memory: " & Err.Description
'   Resume Next
    
End Sub



Public Sub updateMemoryList(lLoc As Long, bNEW_VAL As Byte)
    ' #TODO!400# must be optimzied to update chosen location only!
    '       only byte at lLoc is changed!
    ' I decided not to optimize, because it doesn't seem to affect the speed of snake.asm
    showMemory lStartMemAddress
End Sub




' RETURNS RESULT BY REF!
' TRYIES TO RETURN ACCORDING TO lDesiredSeg as segment.
' lDesiredSeg (NOT MULTIPLIED BY 16, real addresses must be fix(/16)!!), if successful using the desired returns it unchanged!
'
Public Sub GetSegmentOffset_FromPhysical(lAddr As Long, iDesiredSeg As Integer, ByRef lSEGMENT As Long, ByRef lOFFSET As Long)
On Error GoTo err1



  
      
    If lAddr <= 0 Then
        lSEGMENT = 0
        lOFFSET = 0
        Exit Sub
    End If


    ' #400b6-simple# simple solution.
    Dim lDesiredSegment As Long
    lDesiredSegment = to_unsigned_long(iDesiredSeg)
    lOFFSET = lAddr - lDesiredSegment * 16
    If lOFFSET > 0 And lOFFSET < 65535 Then
        lSEGMENT = lDesiredSegment
        ' lOffset is already set!
    Else
        ' do as usual...
        lSEGMENT = Fix(lAddr / 16)
        lOFFSET = lAddr Mod 16
    End If
    



    
' 4.00-Beta-5 COMPLETELY RE-WRITTEN!!! THIS STUFF IS BUGGY!
';;;; probably I could make it simpler....
''''''    If lAddr <= lDesiredSeg Then
''''''        lSEGMENT = Fix(lAddr / 16)
''''''        lOFFSET = lAddr Mod 16
''''''        Exit Sub
''''''    End If
''''''
''''''    If lDesiredSeg = 0 Then
''''''        lSEGMENT = Fix(lAddr / 16)
''''''        lOFFSET = lAddr Mod 16
''''''        Exit Sub
''''''    End If
''''''
''''''
''''''
''''''    '  the desired segment is already * 10h
''''''
''''''    lSEGMENT = Fix(lDesiredSeg / 16)
''''''    lOFFSET = lAddr - lDesiredSeg
''''''
''''''    ' a bit of problems....
''''''    If lOFFSET < 0 And lAddr <= 65535 Then ' <= FFFF
''''''        lSEGMENT = 0
''''''        lOFFSET = lAddr
''''''    Else
''''''       '  If lAddr > 65535 Then  ' > FFFF
''''''        If (lAddr - to_unsigned_long(frmEmulation.get_CS) * 16) <= 65535 Then   ' try CS
''''''            lSEGMENT = to_unsigned_long(frmEmulation.get_CS)
''''''            lOFFSET = lAddr - lSEGMENT * 16
''''''        Else
''''''            ' should work for anything
''''''            lSEGMENT = Fix(lAddr / 16)
''''''            lOFFSET = lAddr Mod 16
''''''        End If
''''''
''''''    '    Debug.Print "HHHH:" & lAddr
''''''    End If
    
    
    
    
    
    
    
    
    
    
    
    
    
    ' RETURNS BY REF!
    
Exit Sub
err1:
    lSEGMENT = 0
    lOFFSET = 0
    Debug.Print "err1771:" & Err.Description
End Sub


Public Sub MemoryListClear()
On Error Resume Next
    frmEmulation.picMemList.Cls
End Sub


' gets "0000:0000"  returns real address
' accepts hex only!
'
' OBSOLETE:! USE: get_physical_address_from_hex_ea() instead!
'
Public Function getAddress_from_HEX_STRING(sMEM As String) As Long
On Error GoTo err1

    Dim L As Long
    Dim s As String
    s = Trim(sMEM)
    
    
    Debug.Print "OBSOLETE:! USE: get_physical_address_from_hex_ea() instead!"
    
    
    L = InStr(1, s, ":")
    
    If L > 0 Then
        Dim sSeg As String
        Dim sOff As String
        sSeg = Trim(Mid(s, 1, L - 1))
        sOff = Trim(Mid(s, L + 1))
        Dim LSUM As Long
        LSUM = to_unsigned_long(Val("&h" & sSeg))
        LSUM = LSUM * 16
        LSUM = LSUM + to_unsigned_long(Val("&h" & sOff))
        sSeg = ""
        sOff = ""
        getAddress_from_HEX_STRING = LSUM
    Else
        getAddress_from_HEX_STRING = Val("&H" & s)
    End If

    Exit Function
err1:
    Debug.Print "err912:" & Err.Description
    getAddress_from_HEX_STRING = 0
    MemoryListClear
End Function


' 4.00
' gets "0000:0000"  returns real offset only
' accepts hex only!
Public Function getOFFSET_from_HEX_STRING(sMEM As String) As Long
On Error GoTo err1

    Dim L As Long
    Dim s As String
    s = Trim(sMEM)
    
    
    L = InStr(1, s, ":")
    
    If L > 0 Then
        Dim sOff As String
        sOff = Trim(Mid(s, L + 1))
        Dim LSUM As Long
        LSUM = to_unsigned_long(Val("&h" & sOff))
        sOff = ""
        getOFFSET_from_HEX_STRING = LSUM
    Else
        If Len(s) <= 4 Then
            getOFFSET_from_HEX_STRING = Val("&H" & s)
        Else
            getOFFSET_from_HEX_STRING = Val("&H" & s) Mod 16
        End If
    End If

    Exit Function
err1:
    Debug.Print "err_11_offset:" & Err.Description
    getOFFSET_from_HEX_STRING = 0
End Function


' 4.00
' gets "0000:0000"  returns real segment only
' accepts hex only!
Public Function getSEGMENT_from_HEX_STRING(sMEM As String) As Long
On Error GoTo err1

    Dim L As Long
    Dim s As String
    s = Trim(sMEM)
    
    
    L = InStr(1, s, ":")
    
    If L > 0 Then
        Dim sSeg As String
        sSeg = Trim(Mid(s, 1, L - 1))
        Dim LSUM As Long
        LSUM = to_unsigned_long(Val("&h" & sSeg))
        sSeg = ""
        getSEGMENT_from_HEX_STRING = LSUM
    Else
        If Len(s) <= 4 Then
            getSEGMENT_from_HEX_STRING = 0
        Else
            getSEGMENT_from_HEX_STRING = Fix(Val("&H" & s) / 16)
        End If
    End If

    Exit Function
err1:
    Debug.Print "err_11_segment:" & Err.Description
    getSEGMENT_from_HEX_STRING = 0
End Function






' may select several lines if required!
Public Sub selectMemoryLine_BLUE(lAddrFrom As Long, lAddrUntil As Long, bMakeVisible As Boolean)
On Error GoTo err1
 
    Dim b As Boolean
    b = bMakeVisible
    
show_me:
    
    If lAddrFrom <= lLastMemAddress Then
        If lAddrFrom >= lStartMemAddress Then
             lBLUE_SelectedMemoryLocation_FROM = lAddrFrom
             lBLUE_SelectedMemoryLocation_UNTIL = lAddrUntil
             showMemory lStartMemAddress ' redraw
             b = False
        End If
    End If
    
    
    If b Then
        b = False
        showMemory lAddrFrom
        GoTo show_me
    End If
    
    
    '  #400b6-BUG110#
    If get_physical_address_from_hex_ea(frmEmulation.txtIntegratedMemoryAddr.Text) <> lAddrFrom Then
        Dim lSEG As Long
        Dim lOff As Long
        GetSegmentOffset_FromPhysical lAddrFrom, frmEmulation.get_CS, lSEG, lOff
        frmEmulation.txtIntegratedMemoryAddr.Text = make4digitHex(lSEG) & ":" & make4digitHex(lOff)
        frmEmulation.txtDisAddr.Text = frmEmulation.txtIntegratedMemoryAddr.Text ' should be the same blue line.
    End If
    
    
    
    Exit Sub
err1:
    Debug.Print "err selblue: " & Err.Description
End Sub


' may select several lines if required!
Public Sub selectMemoryLine_YELLOW(lAddrFrom As Long, lAddrUntil As Long, bMakeVisible As Boolean)
On Error GoTo err1

    Dim b As Boolean
    b = bMakeVisible
    
show_me:
    
    If lAddrFrom <= lLastMemAddress Then
        If lAddrFrom >= lStartMemAddress Then
             lYELLOW_SelectedMemoryLocation_FROM = lAddrFrom
             lYELLOW_SelectedMemoryLocation_UNTIL = lAddrUntil
             showMemory lStartMemAddress ' redraw
             b = False
        End If
    End If
    
    If b Then
        b = False
        showMemory lAddrFrom
        GoTo show_me
    End If
    
    
    
    
    '  #400b6-BUG110#
    If get_physical_address_from_hex_ea(frmEmulation.txtIntegratedMemoryAddr.Text) <> lAddrFrom Then
        Dim lSEG As Long
        Dim lOff As Long
        GetSegmentOffset_FromPhysical lAddrFrom, frmEmulation.get_CS, lSEG, lOff
        frmEmulation.txtIntegratedMemoryAddr.Text = make4digitHex(lSEG) & ":" & make4digitHex(lOff)
        frmEmulation.txtDisAddr.Text = frmEmulation.txtIntegratedMemoryAddr.Text ' should be the same yellow line.
    End If

    
    
    Exit Sub
err1:
    Debug.Print "err selyellow: " & Err.Description
End Sub


' Draws item selector of selected list item:
Private Sub draw_SELECTOR(lColor As Long)

On Error GoTo err1

    Dim fORIG_cX As Single
    Dim fORIG_cY As Single
    
    ' remember original current X/Y:
    fORIG_cX = frmEmulation.picMemList.CurrentX
    fORIG_cY = frmEmulation.picMemList.CurrentY
    
    Dim fCharHeight As Single
    fCharHeight = frmEmulation.picMemList.TextHeight("FF")

    frmEmulation.picMemList.Line (0, fORIG_cY)-(frmEmulation.picMemList.ScaleWidth, fORIG_cY + fCharHeight), lColor, BF

    
    ' restore original current X/Y:
    frmEmulation.picMemList.CurrentX = fORIG_cX
    frmEmulation.picMemList.CurrentY = fORIG_cY
    
    
    Exit Sub
err1:
    Debug.Print "err 12211: " & Err.Description
End Sub




' v4.00-moved here from frmDebugLog
'       parameter changed to Long type from Integer.
Public Function getActualByteForLine(lLine As Long) As String
On Error GoTo err1

    Dim sResult As String
    Dim lT1 As Long
    Dim lT2 As Long
    Dim L As Long
    
    lT1 = dis_recLocCounter(lLine)
    lT2 = dis_recLocCounter(lLine + 1)
    
    sResult = ""
    
    For L = lT1 To lT2 - 1
        sResult = sResult & make_min_len(Hex(dis_p(L)), 2, "0")
    Next L
       
    getActualByteForLine = sResult
    
    Exit Function
err1:
    Debug.Print "err 22222:" & Err.Description
    getActualByteForLine = "??"
End Function



' v4.00- cloned from etActualByteForLine  (may not be used yet)
Public Function getActualIntructionSizeForLine(iLine As Integer) As Long
On Error GoTo err1

    Dim sResult As String
    Dim lT1 As Long
    Dim lT2 As Long
    Dim i As Long
    
    lT1 = dis_recLocCounter(iLine)
    lT2 = dis_recLocCounter(iLine + 1)
          
    If lT2 - lT1 > 0 Then
        getActualIntructionSizeForLine = lT2 - lT1
    Else
        getActualIntructionSizeForLine = 1
    End If
    
    Exit Function
err1:
    Debug.Print "err 11111:" & Err.Description
    getActualIntructionSizeForLine = 1
End Function

' v4.00- cloned from getActualIntructionSizeForLine
Public Function getLastByteAddressForLine(iLine As Integer) As Long
On Error GoTo err1

    getLastByteAddressForLine = dis_recLocCounter(iLine + 1) - 1
          
    Exit Function
err1:
    Debug.Print "err getlb4l:" & Err.Description
    getLastByteAddressForLine = 0
End Function



Public Sub refreshMemoryList()
    showMemory lStartMemAddress
End Sub


Function sbHEX(bInput As Byte) As String
On Error GoTo err1
    sbHEX = make_min_len(Hex(bInput), 2, "0")
    Exit Function
err1:
    Debug.Print "sBHEX: " & bInput
    sbHEX = "00"
End Function


Function sASCII(bInput As Byte) As String
On Error GoTo err1
    Select Case bInput
    Case 0, 7 To 10, 13, 255
        sASCII = "."
    Case Else
        sASCII = Chr(bInput)
    End Select
    Exit Function
err1:
    sASCII = "."
    Debug.Print "frmDebugLog.sASCII: " & Err.Description
End Function


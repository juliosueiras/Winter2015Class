Attribute VB_Name = "RAM"

' 

' 

'



Option Explicit



' #1048
' enabling modes
' INT 10h / AH=12h = G  80x30   8x16  640x480   16/256K  .   A000 VGA,ATI VIP
' INT 10h / AH=13h = G  40x25   8x8   320x200  256/256K  .   A000 VGA,MCGA,ATI VIP
Global byteCURRENT_VIDEO_MODE As Byte
Global boolGRAPHICS_VIDEO_MODE As Boolean ' True when video mode is graphic
Global Const GRAPHICS_VIDEO_MEMORY_START = &HA0000
Global lGRAPHICS_PAGE_SIZE As Long
' #327u-print_in_13h_mode.asm#
Global iGRAPHICS_SCREEN_PIXELS_X As Integer
Global iGRAPHICS_SCREEN_PIXELS_Y As Integer


' 1.15
' Public Const VGA_MEM = &HB8000
' Public Const END_OF_VGA_MEM = &HBC000

' 1.15
Global Const VIDEO_MEMORY_START = &HB8000
Global Const VIDEO_PAGE_SIZE = &H1000 ' 4096 = 4KB.
Global Const VIDEO_PAGE_NUMBER = 8 ' 1.23
Global lCURRENT_VIDEO_PAGE_ADR As Long





' 1.07 decided to load BIOS at F4000h
'''' 1.07 increasing the RAM by 1023 bytes
'''' to keep the ROM BIOS there:
'''Public Const MAX_MEMORY As Long = 1049599

''' 1MB (later it maybe increased)
' 1.23 Public Const MAX_MEMORY As Long = 1048576  '1024*1024

' 1.23 increasing to avoid out of memory messages in
'      debug window, when doing INT 19h:
Global Const MAX_MEMORY As Long = 1114097   '1.27#346 '1049599  '1024*1024 + 1024


' 1.23 total: 1049600 bytes = 1025 KB

Global theMEMORY(0 To MAX_MEMORY) As Byte



Public Sub mWRITE_BYTE(ByRef lLOCATION As Long, ByRef bVAL_TO_WRITE As Byte)

On Error Resume Next ' 4.00-Beta-3

' DEBUG! If lLOCATION >= 32071 And lLOCATION <= 32100 Then Stop '' DEBUG!!!

    If lLOCATION < 0 Then
        ' it's a register address
        frmEmulation.store_BYTE_RegValue lLOCATION + 8, bVAL_TO_WRITE     ' make positive index (see info.txt in [emu_stuff])
        
        ' 1.27#350
        ' I think we can exit the sub here:
        Exit Sub
        
    ElseIf lLOCATION <= MAX_MEMORY Then
    
        If bALLOW_MEMORY_BACKSTEP_RECORDING Then
            keep_BYTE_CHANGE_FOR_CURRENT_BACKSTEP_RECORD lLOCATION ' #1095
        End If
    
        theMEMORY(lLOCATION) = bVAL_TO_WRITE
    Else
        Debug.Print "OUT OF MEMORY! mWRITE_BYTE(" & lLOCATION & ")"
        
       ' it can be an internal error only, I suppose...
       mBox frmEmulation, "OUT OF MEMORY: " & lLOCATION '& " please send bug report to: info@emu8086.com"
       frmEmulation.stopAutoStep
        bEMULATOR_STOPED_ABNORMALLY = True
        ' 1.27#350
        ' I think we can exit the sub here:
        Exit Sub
    End If
    
    
    If boolGRAPHICS_VIDEO_MODE Then
            If (lLOCATION >= GRAPHICS_VIDEO_MEMORY_START) Then
               If (lLOCATION < GRAPHICS_VIDEO_MEMORY_START + lGRAPHICS_PAGE_SIZE) Then
               
                 frmScreen.show_if_not_visible
                 frmScreen.updatePIXEL_at_loc lLOCATION, False
 
               End If
            End If
    Else
             ' WRITING TO VIDEO MEMORY?
             ' if so refresh the screen:
             ' (maybe use timer to improve the speed of execution? - don't update after every chage?)
            ' optimized #1048c ' If (lLOCATION >= lCURRENT_VIDEO_PAGE_ADR) And (lLOCATION < lCURRENT_VIDEO_PAGE_ADR + VIDEO_PAGE_SIZE) Then
            If (lLOCATION >= lCURRENT_VIDEO_PAGE_ADR) Then
               If (lLOCATION < lCURRENT_VIDEO_PAGE_ADR + VIDEO_PAGE_SIZE) Then
             
                 frmScreen.show_if_not_visible
                 ' 1.22 #183 frmScreen.VMEM_TO_SCREEN
                 frmScreen.updateScreen_at_loc lLOCATION
                 ' Debug.Print "vpadr: " & lCURRENT_VIDEO_PAGE_ADR & "loc: " & Hex(lLOCATION) & "VAL: " & bVAL_TO_WRITE & " chr: " & Chr(bVAL_TO_WRITE)
                 
                End If
             End If
    End If
    
    ' only some part of memory is shown (when writing to register also no showing):
    ' #327t-memlist2code# ' If (lLOCATION >= startADR) And (lLOCATION <= (startADR + limitADR)) Then
    If (lLOCATION >= lStartMemAddress) Then
        If (lLOCATION <= lLastMemAddress) Then
            ' update the memory list:
             frmEmulation.setMEMVALUE lLOCATION, bVAL_TO_WRITE, True
        End If
    End If
    
    
' 3.05 bug fix (very slow)
'    ' 2.10#582
'    If b_LOADED_frmMemory Then
'         frmMemory.Update_list
'    End If
    
    
    ' update disassembled list if required:
    If (lLOCATION >= lStartDisAddress) And (lLOCATION <= lLastDisAddress) Then
        DoDisassembling lStartDisAddress
    End If
    
    ' 1.10 update stack view (only if visible):
    If b_LOADED_frmStack Then
        If (lLOCATION >= frmStack.lShownFromAddress) And (lLOCATION <= frmStack.lShownUntilAddress) Then
            frmStack.setStackView
        End If
    End If
End Sub

Public Sub mWRITE_WORD_i(ByRef lLOCATION As Long, ByRef iVAL_TO_WRITE As Integer)
On Error Resume Next ' 4.00-Beta-3
    mWRITE_WORD lLOCATION, math_get_low_byte_of_word(iVAL_TO_WRITE), math_get_high_byte_of_word(iVAL_TO_WRITE)
End Sub

Public Sub mWRITE_WORD(ByRef lLOCATION As Long, ByRef bVAL_TO_WRITE_lb As Byte, ByRef bVAL_TO_WRITE_hb As Byte)

On Error Resume Next ' 4.00-Beta-3

    If lLOCATION < 0 Then
  
        ' it's a register address
        frmEmulation.store_WORD_RegValue lLOCATION + 8, to_signed_int(CLng(bVAL_TO_WRITE_lb) + CLng(bVAL_TO_WRITE_hb) * 256)

        ' 1.27#350
        ' I think we can exit the sub here:
        Exit Sub
        
    ElseIf lLOCATION < MAX_MEMORY Then
        
        If bALLOW_MEMORY_BACKSTEP_RECORDING Then
            keep_BYTE_CHANGE_FOR_CURRENT_BACKSTEP_RECORD lLOCATION ' #1095
            keep_BYTE_CHANGE_FOR_CURRENT_BACKSTEP_RECORD lLOCATION + 1 ' #1095
        End If
        
        theMEMORY(lLOCATION) = bVAL_TO_WRITE_lb
        theMEMORY(lLOCATION + 1) = bVAL_TO_WRITE_hb
    Else
        Debug.Print "OUT OF MEMORY! mWRITE_WORD(" & lLOCATION & ")"
        
        ' it can be an internal error only, I suppose...
        mBox frmEmulation, "OUT OF MEMORY: " & lLOCATION '& " please email: info@emu8086.com"
        frmEmulation.stopAutoStep
        bEMULATOR_STOPED_ABNORMALLY = True
        
        ' 1.27#350
        ' I think we can exit the sub here:
        Exit Sub
    End If
    
    
    If boolGRAPHICS_VIDEO_MODE Then
            If (lLOCATION >= GRAPHICS_VIDEO_MEMORY_START) Then
               If (lLOCATION < GRAPHICS_VIDEO_MEMORY_START + lGRAPHICS_PAGE_SIZE) Then
               
                 frmScreen.show_if_not_visible
                 frmScreen.updatePIXEL_at_loc lLOCATION, True
 
               End If
            End If
    Else
            ' WRITING TO VIDEO MEMORY?
            ' if so refresh the screen:
            ' (maybe use timer to improve the speed of execution? - don't update after every chage?)
            ' optimized #1048c ' If (lLOCATION >= lCURRENT_VIDEO_PAGE_ADR) And (lLOCATION < lCURRENT_VIDEO_PAGE_ADR + VIDEO_PAGE_SIZE) Then
            If (lLOCATION >= lCURRENT_VIDEO_PAGE_ADR) Then
                If (lLOCATION < lCURRENT_VIDEO_PAGE_ADR + VIDEO_PAGE_SIZE) Then
                    frmScreen.show_if_not_visible
                    ' 1.22 #183 frmScreen.VMEM_TO_SCREEN
                    frmScreen.updateScreen_at_loc lLOCATION
                    ' Debug.Print "vpadr: " & lCURRENT_VIDEO_PAGE_ADR & "loc: " & Hex(lLOCATION) & "VAL: " & bVAL_TO_WRITE_hb & ", " & bVAL_TO_WRITE_lb
                End If
            End If
    End If
    
    If (lLOCATION >= lStartMemAddress) And (lLOCATION <= lLastMemAddress) Then
        ' update the memory list:
        frmEmulation.setMEMVALUE lLOCATION, bVAL_TO_WRITE_lb, True
        frmEmulation.setMEMVALUE lLOCATION + 1, bVAL_TO_WRITE_hb, True
    End If

    ' 1.07
    ' update disassembled list if required:
    ' ("+1" because it's a word):
    If (lLOCATION + 1 >= lStartDisAddress) And (lLOCATION <= lLastDisAddress) Then
        DoDisassembling lStartDisAddress
    End If
    
    ' 1.10 update stack view (only if visible):
    If b_LOADED_frmStack Then
        If (lLOCATION >= frmStack.lShownFromAddress) And (lLOCATION <= frmStack.lShownUntilAddress) Then
            frmStack.setStackView
        End If
    End If
End Sub

Public Function mREAD_BYTE(ByRef lLOCATION As Long) As Byte
On Error GoTo error_read_byte

    If lLOCATION < 0 Then
        ' it's a register address
        mREAD_BYTE = frmEmulation.get_BYTE_RegValue(lLOCATION + 8)   ' make positive index (see info.txt in [emu_stuff])
    ElseIf lLOCATION <= MAX_MEMORY Then
        mREAD_BYTE = theMEMORY(lLOCATION)
    Else
        mREAD_BYTE = 0
        Debug.Print "OUT OF MEMORY! mREAD_BYTE(" & lLOCATION & ")"
    End If
    
    Exit Function
error_read_byte:
    Debug.Print "Error on mREAD_BYTE: " & LCase(err.Description)

' 1.04 we show only IP location!!
'    ' only some part of memory is shown (when reading from register also no showing):
'    If (lLOCATION >= startADR) And (lLOCATION <= (startADR + limitADR)) Then
'        ' show where from it was reading:
'        frmEmulation.selectMEMPOSITION (lLOCATION - startADR)
'    End If
End Function

Public Function mREAD_WORD(ByRef lLOCATION As Long) As Integer

On Error Resume Next ' 4.00-Beta-3

    If lLOCATION < 0 Then
        ' it's a register address
        mREAD_WORD = frmEmulation.get_WORD_RegValue(lLOCATION + 8)   ' make positive index (see info.txt in [emu_stuff])
    ElseIf lLOCATION < MAX_MEMORY Then
        ' shift left by 16 high byte:
        mREAD_WORD = to_signed_int(CLng(theMEMORY(lLOCATION)) + CLng(theMEMORY(lLOCATION + 1)) * 256)
    Else
        mREAD_WORD = 0
        Debug.Print "OUT OF MEMORY! mREAD_WORD(" & lLOCATION & ")"
    End If
    
' 1.04 we show only IP location!!
'    ' only some part of memory is shown (when reading from register also no showing):
'    If (lLOCATION >= startADR) And (lLOCATION <= (startADR + limitADR)) Then
'        ' show where from it was reading:
'        frmEmulation.selectMEMPOSITION (lLOCATION - startADR)
'    End If
End Function

' 1.23
' clear memory:
Public Sub clear_RAM()

On Error Resume Next ' 4.00-Beta-3

    Dim L As Long
    
    For L = 0 To UBound(theMEMORY)
        theMEMORY(L) = 0
    Next L
    
End Sub

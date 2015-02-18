Attribute VB_Name = "mMOUSE"
' v 3.27s

Option Explicit


Public Declare Function GetSystemMetrics Lib "user32" (ByVal nIndex As Long) As Long


Public Const SM_CMOUSEBUTTONS = 43

Global fCURRENT_MOUSE_X As Single
Global fCURRENT_MOUSE_Y As Single
Global mouse_buttons As Integer
Global mouse_buttons_state As Integer ' 0- natural, 1 - down, 2 - up

' pointer coordinates are different from mouse coordianates, because
' pointer is alligned to chars
Global bSHOW_MOUSE_POINTER As Boolean
Global mouse_pointer_shown As Boolean
Global f_mouse_pointer_X As Single
Global f_mouse_pointer_Y As Single
Global f_mouse_pointer_X_PREV As Single
Global f_mouse_pointer_Y_PREV As Single
Global Const mouse_pointer_color As Long = 13619151 ' rgb(207,207,207) ' 12632256 ' point of default text color in dos prompt :)

Private Function get_number_of_mouse_buttons() As Long
On Error GoTo err1
    get_number_of_mouse_buttons = GetSystemMetrics(SM_CMOUSEBUTTONS)
    
    If get_number_of_mouse_buttons > 255 Then
        get_number_of_mouse_buttons = 255
        Debug.Print "a weird mouse..."
    End If
    
    Exit Function
err1:
    Debug.Print "err: et_number_of_mouse_buttons: " & err.Description
    get_number_of_mouse_buttons = 2 ' return default...
End Function

Sub set_mouse_coordiates_and_button_state(X As Single, Y As Single, Button As Integer, state As Integer)

On Error Resume Next ' 4.00-Beta-3
    ' better not ' If Timer Mod 10 <> 0 Then Exit Sub ' #328xp-anti-clogging#
    
    
    
    

    fCURRENT_MOUSE_X = X
    fCURRENT_MOUSE_Y = Y
    
    If state = 0 Or state = 1 Then ' #327s-mouse-t1#
        mouse_buttons = mouse_buttons Or Button  ' down - record it.
    Else
        ' up - remove it:
        Select Case Button
        
        Case 0
            ' nothing to remove...
        Case 1
            mouse_buttons = mouse_buttons And -2 ' 1111111111111110b
        Case 2
            mouse_buttons = mouse_buttons And -3 ' 1111111111111101b
        Case 4 ' middle button
            mouse_buttons = mouse_buttons And -5 ' 1111111111111011b
        End Select
        
    End If
    
    mouse_buttons_state = state
End Sub

Sub do_int33(ByRef AH As Byte, ByRef AL As Byte, ByRef BH As Byte, ByRef BL As Byte, ByRef CH As Byte, ByRef CL As Byte, ByRef DH As Byte, ByRef DL As Byte)
On Error GoTo err1

' reference:
' D:\yur7\emu8086\8086_cpu_info\Advanced MS-DOS Programming(eBook)\s3

If AH = 0 Then
    
    
    frmScreen.show_if_not_visible ' #327s-mouse-t2#
    
    
    Select Case AL
    
    ' 00H               Reset mouse and get status.
    Case 0
        AL = 255
        AH = 255
        BH = 0
        BL = get_number_of_mouse_buttons
        
        

'  Initializes the mouse driver and returns the driver status. If the mouse
'  pointer was previously visible, it is removed from the screen, and any
'  previously installed user handlers for mouse events are disabled.
'
    
        frmScreen.hide_mouse_pointer
        
    
    
    ' 01H               Show mouse pointer.
    Case 1
        bSHOW_MOUSE_POINTER = True
        frmScreen.show_mouse_pointer
        
    ' 02H               Hide mouse pointer.
    Case 2
        bSHOW_MOUSE_POINTER = False
        frmScreen.hide_mouse_pointer
        
    ' 03H               Get button status and pointer position.
    Case 3
        Dim ix As Integer
        Dim iy As Integer
        
        ' currently will check it with 80x25 text mode
        ' in dos prompt it always returns position like all chars are 8x8 no matter what font is selected!
        If boolGRAPHICS_VIDEO_MODE Then
            ix = fCURRENT_MOUSE_X * 2 '  in graphical 320x200 mode the value of CX is doubled. see mouse2.asm in examples.
            iy = fCURRENT_MOUSE_Y
        Else
            Dim fffX As Single
            Dim fffY As Single

            
            Select Case byteCURRENT_VIDEO_MODE
            Case 0, 1 ' 40x25  - char is 8x8 pixels (probably)
                fffX = frmScreen.picSCREEN.ScaleWidth / 40
                fffY = frmScreen.picSCREEN.ScaleHeight / 25
                ix = (fCURRENT_MOUSE_X / fffX) * 8
                iy = (fCURRENT_MOUSE_Y / fffY) * 8
                
            Case 2, 3 ' 80x25  - char is 8x8 pixels
                fffX = frmScreen.picSCREEN.ScaleWidth / 80
                fffY = frmScreen.picSCREEN.ScaleHeight / 25
                ix = (fCURRENT_MOUSE_X / fffX) * 8
                iy = (fCURRENT_MOUSE_Y / fffY) * 8
                           
                
            End Select
        End If
        
        
        
        ' CX            = horizontal (X) coordinate
        CH = to_unsigned_byte((ix And &HFF00) / 256)
        CL = to_unsigned_byte((ix And &HFF))
                
        ' DX            = vertical (Y) coordinate
        DH = to_unsigned_byte((iy And &HFF00) / 256)
        DL = to_unsigned_byte((iy And &HFF))
        
        BH = 0
        BL = mouse_buttons
        
    Case Else
        mBox frmEmulation, "int 33h/AX=0" & Hex(AH) & make_min_len(Hex(AL), 2, "0") & "h - " & cMT("not supported yet...")
    End Select

Else
   mBox frmEmulation, "int 33h/AX=0" & Hex(AH) & make_min_len(Hex(AL), 2, "0") & "h - " & cMT("not supported yet...")

End If


Exit Sub
err1:
        mBox frmEmulation, "error on interrupt 33h: " & LCase(err.Description) & " : " & err.number
        frmEmulation.stopAutoStep
        bEMULATOR_STOPED_ABNORMALLY = True
        
   
End Sub

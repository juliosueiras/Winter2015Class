VERSION 5.00
Begin VB.Form frmScreen 
   BackColor       =   &H80000005&
   Caption         =   "emulator screen"
   ClientHeight    =   5025
   ClientLeft      =   2535
   ClientTop       =   4245
   ClientWidth     =   7350
   Icon            =   "frmScreen.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   335
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   490
   Begin VB.Timer timer_Flash_HID 
      Enabled         =   0   'False
      Interval        =   177
      Left            =   4740
      Top             =   4260
   End
   Begin VB.CommandButton cmdChangeFont 
      Caption         =   "change font"
      Height          =   345
      Left            =   1680
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   4605
      Width           =   1485
   End
   Begin VB.Timer timerInput 
      Enabled         =   0   'False
      Interval        =   220
      Left            =   600
      Top             =   2265
   End
   Begin VB.CommandButton cmdClearScreen 
      Caption         =   "clear screen"
      Height          =   345
      Left            =   75
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   4620
      Width           =   1485
   End
   Begin VB.PictureBox picSCREEN 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   9
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4500
      Left            =   60
      ScaleHeight     =   300
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   483
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   60
      Width           =   7245
   End
   Begin VB.TextBox txtCommandPrompt 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   135
      TabIndex        =   0
      Text            =   "CLS"
      Top             =   4635
      Visible         =   0   'False
      Width           =   3225
   End
   Begin VB.Label lblHardwareIntsDisabled 
      AutoSize        =   -1  'True
      BackColor       =   &H000000FF&
      Caption         =   " hardware interrupts are disabled "
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   3450
      TabIndex        =   6
      Top             =   4695
      Visible         =   0   'False
      Width           =   2340
   End
   Begin VB.Label lblKeyboardBufferASCII 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   90
      Left            =   3495
      TabIndex        =   5
      Top             =   4875
      Width           =   30
   End
   Begin VB.Label lblKeyboardBuffer 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   3525
      TabIndex        =   4
      Top             =   4650
      Width           =   45
   End
End
Attribute VB_Name = "frmScreen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'



Option Explicit

Dim sDEFAULT_CAPTION_frmScreen As String

Dim bDO_NOT_VMEM_TO_SCREEN As Boolean '#1139b

' 1.21 #165b
' to make sure we remove the cursor after
' input is finished:
Public bCURSOR_DRAWN As Boolean

' 1.20 #113
Public bFIRST_TIME_SHOW_SCREEN As Boolean

'    ' 2.04#536
'    ' this value will be set to True only
'    ' when screen is modified after program is
'    ' loaded into the memory:
'    Public bSCREEN_MODIFIED As Boolean
' I decided not to do it.


' 1.17
Dim uCursorStartLine As Byte
Dim uCursorBottomLine As Byte

' 1.23#213b
Dim uCursorDrawn_at_COL As Byte
Dim uCursorDrawn_at_ROW As Byte

' 1.20
Public bSHOW_BLINKING_CURSOR As Boolean

' 1.17 not used any more!
''''' ==== variables for receiving the input string:
''''' starting position (CurrentX/Y before input):
''''Dim nX As Single
''''Dim nY As Single

' depends what what input we are expecting:
'  0 - string with echo.
'  1 - single char with echo.
'  2 - single char without echo.
'  3 - add to buffer (default!). - 1.17
Dim iINPUT_TYPE As Integer
' 1.17 after setting iINPUT_TYPE to something,
'      always should return it to default!!!!!
Const DEFAULT_INPUT_TYPE = 3


' the input string (user input):
Dim sInputBuffer As String

' the input char (user input):
Dim iInputChar As Integer

' maximum number of characters allowed to be inputed:
Dim MaxAllowedInput As Byte

' 1.17 not used any more!
'''' a blinker (changes from " " to "_" all the time):
'''Dim sBlinker As String
'''' already printed on screen (both mesage and input), used
''''  to remove it from screen on update:
'''Dim lastPrintedInp As String




Dim screen_WIDTH As Integer ' width in chars.
Dim screen_HEIGHT As Integer ' height in chars.

Dim char_WIDTH As Integer ' width of char in pixels.
Dim char_HEIGHT As Integer ' height of char in pixels.

' used to resize objects on form when it's resized:
Dim resize_W As Integer
Dim resize_H As Integer
Dim resize_TOP As Integer


' 1.28#369
Dim DEFAULT_ATTRIB As Byte


' pointer to RAM where next char should be written:
'1.15 Dim lCURRENT_POSITION As Long
' not used any more, since there are different COL/ROW positions
' for 8 separate pages at MEM 0040h:0050h


'''''
'''''Public Sub add_to_SCREEN(ByRef s As String)
'''''
'''''    Dim Size As Long
'''''    Dim i As Long
'''''    Dim ts As String
'''''
'''''
'''''    Size = Len(s)
'''''
'''''    For i = 1 To Size
'''''        ts = Mid(s, i, 1)
'''''
'''''        ' got over the screen?
'''''        If (lCURRENT_POSITION > screen_WIDTH * 2 * screen_HEIGHT + lCURRENT_VIDEO_PAGE_ADR - 2) Then
'''''            scroll_screen_UP (1)
'''''            lCURRENT_POSITION = lCURRENT_POSITION - screen_WIDTH * 2
'''''        End If
'''''
'''''        If (myAsc(ts) = 10) Then ' LINE FEED
'''''            lCURRENT_POSITION = lCURRENT_POSITION + screen_WIDTH * 2
'''''        ElseIf (myAsc(ts) = 13) Then ' CARRIGE RETURN
'''''            lCURRENT_POSITION = lCURRENT_POSITION - ((lCURRENT_POSITION - lCURRENT_VIDEO_PAGE_ADR) Mod (screen_WIDTH * 2))
'''''        ElseIf (myAsc(ts) = 8) Then ' back-space (1.09)
'''''            lCURRENT_POSITION = lCURRENT_POSITION - 2
'''''        Else
'''''            theMEMORY(lCURRENT_POSITION) = myAsc(ts)
'''''            lCURRENT_POSITION = lCURRENT_POSITION + 1
'''''            ' TODO! attributes not set here!
'''''            lCURRENT_POSITION = lCURRENT_POSITION + 1
'''''        End If
'''''
'''''    Next i
'''''
'''''    ' TODO! later timer may be added to avoid very frequently repaints:
'''''    VMEM_TO_SCREEN
'''''
'''''End Sub



Public Sub add_to_SCREEN(ByRef s As String, bSCROLL As Boolean)  ' #327xj-no-scroll-int21-1#  bSCROLL

On Error Resume Next ' 4.00-Beta-3

    Dim Size As Long
    Dim i As Long
    Dim ts As String


    Dim tb As Byte
    Dim uCurrentPage As Byte

    uCurrentPage = get_current_video_page_number

    Size = Len(s)

    For i = 1 To Size
    
        ts = Mid(s, i, 1)

        tb = get_ATTRIB_at_CurrentPos(uCurrentPage)
        
        setChar_and_Attribute_at_CurrentPos myAsc(ts), tb, True, uCurrentPage, bSCROLL, True
        
        ' #327u-print_in_13h_mode.asm# - #327u-allow-to-stop_string_output#
        DoEvents
        If frmEmulation.bSTOP_EVERYTHING Then
            Debug.Print "stoped adding to screen..."
            Exit Sub
        End If
        
    Next i

    ' 1.22 #183 ' frmScreen.VMEM_TO_SCREEN
    frmScreen.show_if_not_visible
    
End Sub

' 1.18
Public Sub add_to_SCREEN_with_attrib(ByRef s As String, uPage As Byte, bAdvancePosition As Boolean, bContainsAttributes As Boolean, uDefaultAttribute As Byte, bSCROLL As Boolean, bMSDOS_STYLE As Boolean)   ' #327xj-scroll-bug# - bSCROLL,bMSDOS_STYLE

On Error Resume Next ' 4.00-Beta-3

    Dim Size As Long
    Dim i As Long
    Dim ts As String
    Dim tb As Byte
    Dim uCol As Byte
    Dim uRow As Byte
    
    ' remember currect col/row:
    If Not bAdvancePosition Then
        uCol = frmScreen.getCursorPos_COL(uPage)
        uRow = frmScreen.getCursorPos_ROW(uPage)
    End If

    Size = Len(s)

    For i = 1 To Size
    
        ts = Mid(s, i, 1)

        If bContainsAttributes Then
            i = i + 1
            tb = myAsc(Mid(s, i, 1))
            setChar_and_Attribute_at_CurrentPos myAsc(ts), tb, True, uPage, bSCROLL, bMSDOS_STYLE
        Else
            setChar_and_Attribute_at_CurrentPos myAsc(ts), uDefaultAttribute, True, uPage, bSCROLL, bMSDOS_STYLE
        End If
        
        ' #327u-print_in_13h_mode.asm# - #327u-allow-to-stop_string_output#
        DoEvents
        If frmEmulation.bSTOP_EVERYTHING Then Exit Sub
               
    Next i

    ' restroe currect col/row:
    If Not bAdvancePosition Then
        frmScreen.setCursorPos uCol, uRow, uPage
    End If

    ' 1.22 #183 ' frmScreen.VMEM_TO_SCREEN
    frmScreen.show_if_not_visible
    
End Sub

' 1.17 (made sub)
Public Sub set_current_video_page_number(uPageNumber As Byte, Optional bUPDATE_SCREEN As Boolean = True)

On Error Resume Next ' 4.00-Beta-3

    lCURRENT_VIDEO_PAGE_ADR = VIDEO_MEMORY_START + to_unsigned_long(CInt(uPageNumber)) * VIDEO_PAGE_SIZE
    
    If bUPDATE_SCREEN Then VMEM_TO_SCREEN ' #1174b
    
    
    ' 1.25#307
    ' I think it's not required here!  If bDONT_UPDATE_SYS_INFO Then Exit Sub
    
    
    ' 1.18
    ' these values are read only!
    
    'MEM 0040h:0062h - VIDEO - CURRENT PAGE NUMBER
    'Size:   BYTE
    RAM.mWRITE_BYTE &H462, uPageNumber
    
    'MEM 0040h:004Eh - VIDEO - CURRENT PAGE START ADDRESS IN REGEN BUFFER
    'Size:       WORD
    RAM.mWRITE_WORD_i &H44E, to_signed_int(lCURRENT_VIDEO_PAGE_ADR - VIDEO_MEMORY_START)
    
    
    
End Sub

' 1.15
Public Function get_current_video_page_number() As Byte
On Error Resume Next ' 4.00-Beta-3
Dim lT As Long

lT = lCURRENT_VIDEO_PAGE_ADR - VIDEO_MEMORY_START

lT = lT / VIDEO_PAGE_SIZE

If lT >= 0 And lT <= 255 Then ' to avoid overflow errors:
    get_current_video_page_number = lT
Else
    get_current_video_page_number = 0
    Debug.Print "error, get_current_video_page_number() cannot calculate current page number"
End If

End Function

Public Sub clear_SCREEN()
On Error GoTo err_csc
    ' 1.21 #165b
    ' here we do not require to check for
    ' cursor that stays drawn since CLS is done:
    timerInput.Enabled = False
    bCURSOR_DRAWN = False
    
    ' 1.23 #213
    ' I think that instead of scrolling only
    ' current page, it will be better to
    ' reset all video memory!
    ' scroll_screen_UP (screen_HEIGHT)
    
    Dim i As Long
    Dim lFrom As Long
    Dim lUntil As Long
    
    ' it seems VB cannot make muliplication of constant LONG types...
    
    lFrom = VIDEO_MEMORY_START
    lUntil = VIDEO_MEMORY_START
    lUntil = lUntil + to_unsigned_long(VIDEO_PAGE_SIZE) * VIDEO_PAGE_NUMBER
    
    For i = lFrom To lUntil Step 2
        theMEMORY(i) = 0        ' char.
        theMEMORY(i + 1) = DEFAULT_ATTRIB       ' attribute.
    Next i

    ' update memory list, if required!
    refreshMemoryList ' 4.00b15       (just found a "to do" here and decided to do it now:)
    If b_LOADED_frmMemory Then
        frmMemory.EMITATE_ShowMemory_Click
    End If
    
    
    ' 1.23 bugfix1.23#224
    ' user may change the font:
    setSCREEN_W_H
    
    VMEM_TO_SCREEN
    
    ' 1.22 no need ' picSCREEN.Cls
    
    Exit Sub
    
err_csc:
    Debug.Print "clear_SCREEN: " & LCase(Err.Description)

End Sub



Private Sub cmdClearScreen_Click()
On Error GoTo err_csc

    clearScreen
    picSCREEN.SetFocus
    
    Flush_KB_Buffer ' #400b3-cl-buf#
    
    Exit Sub
err_csc:
    Debug.Print "cmdClearScreen_Click: " & LCase(Err.Description)
End Sub

Public Sub clearScreen()
    On Error Resume Next ' 4.00-Beta-3
    ' tricky way of clearing the screen,
    '   I just don't want to make any big
    '     changes:
    txtCommandPrompt.Text = "CLS"
    txtCommandPrompt_KeyPress 13
    
End Sub

' #400b4-update3-bug-scr#
' this caused screen refresh after first char is already printed!!
' this is now updated with the emulator!
'''''
'''''' #400b4-mini-8#
'''''Private Sub Form_Activate()
'''''On Error Resume Next
'''''    If SHOULD_DO_MINI_FIX_8 Then
'''''        If StrComp(picSCREEN.Font.Name, "Terminal", vbTextCompare) = 0 Then
'''''            If picSCREEN.Font.Size < 12 Then
'''''                If Not boolGRAPHICS_VIDEO_MODE Then
'''''                    picSCREEN.Font.Size = 12
'''''                    setSCREEN_W_H
'''''                    set_VIDEO_MODE byteCURRENT_VIDEO_MODE
'''''                    VMEM_TO_SCREEN
'''''                End If
'''''            End If
'''''        End If
'''''    End If
'''''End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next ' 4.00-Beta-3
    SaveWindowState Me ' 2.05#551
End Sub












'Private Sub lblHotKeyNotice_Click()
'' #400b3-scrhot#
'On Error Resume Next
'mBox Me, "to enable hotkeys for the screen" & vbNewLine & "set SCREEN_HOTKEYS=true in emu8086.ini"
'End Sub

Private Sub picSCREEN_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next ' 4.00-Beta-3
    Form_KeyDown KeyCode, Shift
End Sub

' 1.21
' convert these chars:
'      ', ",", ".", /, -, 0, 2, 6, 7, 8, 9, =, ;, [, \, ], `
' to their values when SHIFT is pressed:
Private Function convert_to_table_value(iVirtKey As Integer) As Integer
On Error Resume Next ' 4.00-Beta-3
Select Case Chr(iVirtKey)

Case "'"
    convert_to_table_value = Asc("""") ' returns code for single " - 34.
    
Case ","
    convert_to_table_value = Asc("<")
    
Case "."
    convert_to_table_value = Asc(">")
    
Case "/"
    convert_to_table_value = Asc("?")
    
Case "-"
    convert_to_table_value = Asc("_")
    
Case "0"
    convert_to_table_value = Asc(")")
    
Case "2"
    convert_to_table_value = Asc("@")
    
Case "6"
    convert_to_table_value = Asc("^")
    
Case "7"
    convert_to_table_value = Asc("&")
    
Case "8"
    convert_to_table_value = Asc("*")
    
Case "9"
    convert_to_table_value = Asc("(")

Case "="
    convert_to_table_value = Asc("+")
    
Case ";"
    convert_to_table_value = Asc(":")
    
Case "["
    convert_to_table_value = Asc("{")
    
Case "\"
    convert_to_table_value = Asc("|")
    
Case "]"
    convert_to_table_value = Asc("}")
    
Case "`"
    convert_to_table_value = Asc("~")
    
Case Else
    convert_to_table_value = iVirtKey ' no change.
End Select

End Function

' #327xk-no-st#
Public Sub Form_KeyDown_PUBLIC(KeyCode As Integer)
On Error Resume Next ' 4.00-Beta-3
    Form_KeyDown KeyCode, 0
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo err1

 ' Debug.Print "FORM_KEYDOWN: " & KeyCode; Shift

' #400b6-int21h_33h_23h#
' check buffer for Ctrl+C
If frmEmulation.byteBREAK_FLAG <> 0 Then
    If KeyCode = 67 And Shift = 2 And iINPUT_TYPE = 0 Then ' it seems that only Input string operations are intercepted (int21.asm), but it does not intercept INT 16h/00 (bin2dec.asm)
        Debug.Print "Ctrl+C!"
        frmEmulation.do_INT_21h_23h
        Exit Sub
    End If
End If



' #400b3-scrhot#
If SCREEN_HOTKEYS Then ' a general solution :)
    ' 1.24#281
    ' #400b9-screen-hotkeys# ' If frmEmulation.chkAutoStep.Value = vbUnchecked Then  ' if not running
        If frmEmulation.process_HotKey(KeyCode, Shift) Then
            ' #400b9-screen-hotkeys# '
            '''              ' #327s-hotkey-BUG!# - put hotkey into buffer  too, anyway... '    Exit Sub ' was a hotkey, don't process here.
            '''              ' #400b3-do-no-put-hot-key-to-buffer-when-buffer-is-1/2-full#
            '''              If uCHARS_IN_KB_BUFFER >= KB_BUFFER_MAX / 2 Then ' to avoid beeps for F8 key etc...
            '''                  Exit Sub
            '''              End If

            ' just exit
            Exit Sub ' #400b9-screen-hotkeys#
        End If
    ' #400b9-screen-hotkeys# ' End If
Else
'    ' #400b3-scrhot#
'    If frmEmulation.IS_HotKey(KeyCode, Shift) Then
'        picHotKeyNotice.Top = cmdClearScreen.Top
'        picHotKeyNotice.Visible = True
'        timerHideHotKeyNotice.Enabled = True
'    End If
End If



' #327xa-cli-keyboard#
''' hardware interrupts must be enabled to read keyboard
''If frmFLAGS.cbIF.ListIndex = 0 Then
''    timer_Flash_HID.Enabled = True ' flash a bit :)
''    Exit Sub
''End If


Dim iASCII As Integer
Dim iBIOS As Integer

'Debug.Print "KC: " & KeyCode, Shift
'
'
' #400b6-special-chars#
If Shift = 2 And KeyCode >= 65 Then ' Ctrl and all keys starting from A
    ' iBIOS = 30
    iASCII = KeyCode - 64
    GoTo SpecialChar
End If




Select Case KeyCode

Case 20, 16, 17, 18, 91, 92, 93
    ' VB generates this event even for CapsLock, SHIFT, CTRL we skip those...
    ' interupts that I'm using do not generate these.
    Exit Sub
Case Else



    
    iASCII = to_signed_int(MapVirtualKey(CLng(KeyCode), 2))
SpecialChar:
    iBIOS = to_signed_int(MapVirtualKey(CLng(KeyCode), 0))
    

    Select Case iASCII
    
    ' Required to convert to lower case only
    ' if it's a letter A..Z or a..z (I think):
    Case 65 To 90, 97 To 122
    
        If (Shift And vbShiftMask) And (GetKeyState(VK_CAPITAL) And 1) Then
            iASCII = myAsc(LCase(Chr(iASCII)))
        ElseIf (Shift And vbShiftMask) And Not (GetKeyState(VK_CAPITAL) And 1) Then
            iASCII = myAsc(UCase(Chr(iASCII)))
        ElseIf Not (Shift And vbShiftMask) And (GetKeyState(VK_CAPITAL) And 1) Then
            iASCII = myAsc(UCase(Chr(iASCII)))
        ElseIf Not (Shift And vbShiftMask) And Not (GetKeyState(VK_CAPITAL) And 1) Then
            iASCII = myAsc(LCase(Chr(iASCII)))
        End If
    
    ' Keys 1, 3, 4, 5
    Case 49, 51 To 53
    
        If (Shift And vbShiftMask) Then
            iASCII = iASCII And 65519 ' clear bit 4.
        End If
    
    ' Return key
    Case &HD
        If (Shift And vbCtrlMask) Then
            iASCII = &HA
        End If
        
    ' Keys ', ",", ".", /, -, 0, 2, 6, 7, 8, 9, =, ;, [, \, ], `
    Case 39, 44 To 47, 48, 50, 54 To 57, 61, 59, 91 To 93, 96
    
        If (Shift And vbShiftMask) Then
            iASCII = convert_to_table_value(iASCII)
        End If
        
    End Select
End Select
'======================================================


    Select Case iINPUT_TYPE
        
    Case 0 ' get string (with echo):
    
            Dim tb1 As Byte
            Dim currentPage As Byte
            currentPage = get_current_video_page_number()
            
                        
            If iASCII = &HD Then      ' enter pressed?
                stopTimerInput        ' make return from inputLine().
            ElseIf iASCII = &H8 Then    ' backspace pressed?
                ' removing the last char:
                Dim L As Long
                L = Len(sInputBuffer)
                If L > 0 Then   ' is there something to remove?
                    sInputBuffer = Mid(sInputBuffer, 1, L - 1)
                End If
                
                tb1 = get_ATTRIB_at_CurrentPos(currentPage)
                ' move current cursor position back:
                setChar_and_Attribute_at_CurrentPos to_unsigned_byte(vbKeyBack), tb1, False, currentPage, False, False ' #327xj-scroll-bug# I'm not sure if it should be true or false here...
                ' print space using the same back color:
                tb1 = get_ATTRIB_at_CurrentPos(currentPage)
                setChar_and_Attribute_at_CurrentPos Asc(" "), tb1, False, currentPage, False, False  ' #327xj-scroll-bug# here unsure too.
                ' 1.22 #183 ' VMEM_TO_SCREEN
                        
            Else ' adding to buffer:
                       
                If timerInput.Enabled Then  ' waiting for input?
                
                    ' do not allow to go over the maximum!
                    If Len(sInputBuffer) < MaxAllowedInput Then
                                            
                        tb1 = get_ATTRIB_at_CurrentPos(currentPage)
                        setChar_and_Attribute_at_CurrentPos to_unsigned_byte(iASCII), tb1, True, currentPage, False, False ' #327xj-scroll-bug# here unsure too.
                        ' 1.22 #183 ' VMEM_TO_SCREEN
                    
                        sInputBuffer = sInputBuffer & Chr(iASCII)
                    End If
                    
                End If
            End If
           
' 1.17
'''            If timerInput.Enabled Then  ' waiting for input?
'''                ' print the message again from the same point
'''                '   with what we already have in a buffer:
'''                printOut
'''            End If
            
    Case 1, 2 ' get single char (no echo).
            
            iInputChar = iASCII
            stopTimerInput  ' make return from inputChar().
            Debug.Print "#400b4-mini# #10: OBOSOLETE iINPUT_TYPE: " & iINPUT_TYPE
            
    Case 3  ' get into the buffer.
    
        ' 1.24
        '#1114d If frmEmulation.bTERMINATED Then Exit Sub ' no need to keep in buffer.
    
        '   + 1114d. "If frmEmulation.bTERMINATED Then Exit Sub"
        '        is commented out!
        '
        '        because it may only harder the keyboard debuging.
        '
        '       buffer is flushed anyway on reload/reset.
                
                
            
        If uCHARS_IN_KB_BUFFER < KB_BUFFER_MAX Then
            uKB_BUFFER(uCHARS_IN_KB_BUFFER).cBIOS = to_unsigned_byte(iBIOS)
            uKB_BUFFER(uCHARS_IN_KB_BUFFER).cASCII = to_unsigned_byte(iASCII)
            uCHARS_IN_KB_BUFFER = uCHARS_IN_KB_BUFFER + 1
            show_uKB_BUFFER ' #1114
        Else
          If bDO_BEEP Then Beep 500, 50 ' #327u-bell#  '  Beep
        End If
        
    End Select
    
    
    
    Exit Sub
err1:
    Debug.Print "frmScreen.KeyDown: " & Err.Description

End Sub

Private Sub Form_Load()

On Error Resume Next ' 4.00-Beta-3

    If Load_from_Lang_File(Me) Then Exit Sub

    sDEFAULT_CAPTION_frmScreen = Me.Caption

    ' 1.28#369
    DEFAULT_ATTRIB = 7

    ' 1.21
    bCURSOR_DRAWN = False

    ' 1.17
    iINPUT_TYPE = DEFAULT_INPUT_TYPE

    '#1059 Me.Icon = frmMain.Icon

'    ' it's not required since CLS is always used,
'    ' but maybe helpful later:
'    picSCREEN.FontTransparent = False

' 1.14
    picSCREEN.FontTransparent = True

    resize_W = Me.ScaleWidth - picSCREEN.Width
    resize_H = Me.ScaleHeight - picSCREEN.Height
    resize_TOP = Me.ScaleHeight - txtCommandPrompt.Top

    bDO_NOT_VMEM_TO_SCREEN = True '#1139b
    
    ' should go after we set resize_W, resize_H, resize_TOP:
    '#1139b but definetelly before setSCREEN_W_H
    GetWindowPos Me ' 2.05#551
    GetWindowSize Me ' 2.05#551
    
    bDO_NOT_VMEM_TO_SCREEN = False '#1139b

    setSCREEN_W_H
    
    ' 1.20
    setDefaultCursorType

    b_LOADED_frmScreen = True

    show_uKB_BUFFER ' #1173b show on load

End Sub

' 1.20
Public Sub setDefaultCursorType()

On Error Resume Next ' 4.00-Beta-3

    ' #327xj-mouse-reset-bug# disable mouse:
    bSHOW_MOUSE_POINTER = False
    frmScreen.hide_mouse_pointer
    
    
' 1.22
'''    uCursorStartLine = char_HEIGHT - 1
'''    uCursorBottomLine = char_HEIGHT - 1
    
    uCursorStartLine = 6 ' #327s-cursor#  char_HEIGHT - 4
    uCursorBottomLine = 7 ' #327s-cursor#  char_HEIGHT - 3
        
    If uCursorStartLine < 0 Then uCursorStartLine = 6 ' #327s-cursor# 0
    If uCursorBottomLine < 0 Then uCursorBottomLine = 7 ' #327s-cursor# 0
    
    bSHOW_BLINKING_CURSOR = True
    

    
End Sub

' 1.10
' to prevent reseting last printing position:
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
On Error GoTo err_qunload ' 1.25 jic.

    If UnloadMode = vbFormControlMenu Then
        
            ' 1.24#280
            '280. when user closes "User Screen", stop emulator if it's running.
            '     To avoid possible angry users... or whatever. (bintest.asm).
            If frmEmulation.chkAutoStep.Value = vbChecked Then
                frmEmulation.chkAutoStep.Value = vbUnchecked ' stop!!!
            End If
            
            ' 1.25#293
            ' stop input also:
            If frmEmulation.picWaitingForInput.Visible Then
                frmEmulation.cmdStopInput.Value = True   ' generate click.
            End If
    
            Cancel = 1
            Me.Hide
            
            Exit Sub  ' 2.03#518
    End If
    
    
    ' this form is unloaded only
    ' on application termination (exit).
    
    b_LOADED_frmScreen = False
    
    Exit Sub
err_qunload:
    Debug.Print "frmScreen_QueryUnload: " & LCase(Err.Description)
End Sub

Private Sub Form_Resize()

    On Error GoTo err_on_resize
    
    Dim iTemp As Integer

    iTemp = Me.ScaleWidth - resize_W
    If iTemp > 0 Then picSCREEN.Width = iTemp
    iTemp = Me.ScaleHeight - resize_H
    If iTemp > 0 Then picSCREEN.Height = iTemp
    
    txtCommandPrompt.Width = picSCREEN.Width
    txtCommandPrompt.Top = Me.ScaleHeight - resize_TOP
    
    cmdClearScreen.Top = txtCommandPrompt.Top
    
    ' 2005-03-13 #1010
    cmdChangeFont.Top = cmdClearScreen.Top
    cmdChangeFont.Left = cmdClearScreen.Left + cmdClearScreen.Width + 5
    

    ' #1114
   '#1173b lblKbrdBuff.Top = cmdChangeFont.Top - 2
   '#1173b lblKbrdBuffASCII.Top = lblKbrdBuff.Top + lblKbrdBuff.Height + 1
   '#1173b  lblKeyboardBuffer.Left = lblKbrdBuff.Left + lblKbrdBuff.Width + 10
    
   
    '#1173b lblKeyboardBuffer.Top = lblKbrdBuff.Top
    lblKeyboardBuffer.Left = cmdChangeFont.Left + cmdChangeFont.Width + 5
    lblKeyboardBuffer.Top = cmdChangeFont.Top - 2
    lblKeyboardBufferASCII.Top = lblKeyboardBuffer.Top + lblKeyboardBuffer.Height + 1
    lblKeyboardBufferASCII.Left = lblKeyboardBuffer.Left

    
    setSCREEN_W_H
    
'#1174
''''    ' 1.18
''''    If bDO_NOT_VMEM_TO_SCREEN Then '#1139b
''''        ' Debug.Print "frmScreen_Resize - VMEM not updated because form is still loading..."
''''    Else
''''        VMEM_TO_SCREEN
''''    End If
''''


    Exit Sub
err_on_resize:
    Debug.Print "Error on frmDOS Form_Resize(): " & LCase(Err.Description)
End Sub

Public Sub setSCREEN_W_H()

On Error GoTo err_sswh

    ' #327u-print_in_13h_mode.asm#
    If boolGRAPHICS_VIDEO_MODE Then
    
    
        
        If byteCURRENT_VIDEO_MODE = &H12 Then ' mode 12h is not documented, so it;s not emulated correctly.
            char_WIDTH = 8
            char_HEIGHT = 8 ' in reality it is 16
            screen_WIDTH = 80
            screen_HEIGHT = 60 ' in reality it is 30
        Else
            ' should work for 13h/int10h mode
            char_WIDTH = 8
            char_HEIGHT = 8
            screen_WIDTH = 40
            screen_HEIGHT = 25
        End If



        If picSCREEN.ScaleWidth > iGRAPHICS_SCREEN_PIXELS_X Then
            picSCREEN.ScaleMode = vbUser
            picSCREEN.ScaleWidth = iGRAPHICS_SCREEN_PIXELS_X
            picSCREEN.DrawWidth = Abs(Int(-picSCREEN.Width)) / iGRAPHICS_SCREEN_PIXELS_X
        End If
        If picSCREEN.ScaleHeight > iGRAPHICS_SCREEN_PIXELS_Y Then
            picSCREEN.ScaleMode = vbUser
            picSCREEN.ScaleHeight = iGRAPHICS_SCREEN_PIXELS_Y
            ' unfortunetelly, there is no picSCREEN.DrawHeight....
        End If
        
        If picSCREEN.ScaleWidth < iGRAPHICS_SCREEN_PIXELS_X Or picSCREEN.ScaleHeight < iGRAPHICS_SCREEN_PIXELS_Y Then
            picSCREEN.ScaleMode = vbPixels
        End If
        

        Me.Caption = sDEFAULT_CAPTION_frmScreen & " (" & screen_WIDTH & "x" & screen_HEIGHT & " chars)" & "(" & iGRAPHICS_SCREEN_PIXELS_X & "x" & iGRAPHICS_SCREEN_PIXELS_Y & " pixels)"
    Else
        ' assuming that FIXED font is used, so all chars are equal!
        ' 1.13 using "W" instead of "A" (in case used some not fixed font):
        
        char_WIDTH = picSCREEN.TextWidth("W")
        char_HEIGHT = picSCREEN.TextHeight("W")
        
        screen_WIDTH = Int(picSCREEN.Width / char_WIDTH)
        screen_HEIGHT = Int(picSCREEN.Height / char_HEIGHT)
        
        ' 1.18
        If screen_WIDTH = 0 Then screen_WIDTH = 1
        If screen_HEIGHT = 0 Then screen_HEIGHT = 1
        
        Me.Caption = sDEFAULT_CAPTION_frmScreen & " (" & screen_WIDTH & "x" & screen_HEIGHT & " chars)"
    End If
        
    
    ' 1.25#307
    If bDONT_UPDATE_SYS_INFO Then Exit Sub
    
    
    
    ' 1.13 write screen columns and rows to memory:
    
    'MEM 0040h:004Ah - VIDEO - COLUMNS ON SCREEN
    'Size:   WORD
    RAM.mWRITE_WORD_i &H44A, screen_WIDTH
    
    'MEM 0040h:0084h - VIDEO (EGA/MCGA/VGA) - ROWS ON SCREEN MINUS ONE
    'Size:   BYTE
    RAM.mWRITE_BYTE &H484, CByte(screen_HEIGHT - 1)
    
    
    
    
    
    
    Exit Sub
    
err_sswh:
    Debug.Print "Error on setSCREEN_W_H(): " & LCase(Err.Description)
    
    
    screen_WIDTH = 80
    screen_HEIGHT = 25
End Sub




Private Sub picSCREEN_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next ' 4.00-Beta-3
    set_mouse_coordiates_and_button_state X, Y, Button, 1
End Sub

Private Sub picSCREEN_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next ' 4.00-Beta-3
    set_mouse_coordiates_and_button_state X, Y, Button, 2
End Sub


Private Sub timer_Flash_HID_Timer()
On Error GoTo err1
    
    timer_Flash_HID.Enabled = False  ' TURNED OFF BY DEFAULT.
    
    
    
    If timer_Flash_HID.Interval > 170 And timer_Flash_HID.Interval < 300 Then
        timer_Flash_HID.Interval = timer_Flash_HID.Interval - 1
        timer_Flash_HID.Enabled = True ' TURN ON!
        lblHardwareIntsDisabled.Visible = Not lblHardwareIntsDisabled.Visible
            
        lblKeyboardBuffer.Visible = False
        lblKeyboardBufferASCII.Visible = False
    ElseIf timer_Flash_HID.Interval = 170 Then
        timer_Flash_HID.Interval = 1000  ' last time hold for 1 sec...
        lblHardwareIntsDisabled.Visible = True
        timer_Flash_HID.Enabled = True ' TURN ON!
    Else  ' 1000
        timer_Flash_HID.Interval = 177
        lblHardwareIntsDisabled.Visible = False
        ' do not turn on again.
        
        lblKeyboardBuffer.Visible = True
        lblKeyboardBufferASCII.Visible = True
    End If
    
    
    Exit Sub
err1:
    Debug.Print "err timer_Flash_HID_Timer: " & Err.Description
    timer_Flash_HID.Enabled = False
    timer_Flash_HID.Interval = 177
    lblHardwareIntsDisabled.Visible = False
    
    lblKeyboardBuffer.Visible = True
    lblKeyboardBufferASCII.Visible = True
End Sub

'Private Sub timerHideHotKeyNotice_Timer()
'On Error Resume Next
'    timerHideHotKeyNotice.Enabled = False
'    picHotKeyNotice.Visible = False
'End Sub

Private Sub txtCommandPrompt_KeyPress(KeyAscii As Integer)
On Error Resume Next ' 4.00-Beta-3
    If (KeyAscii = 13) Then
    
        KeyAscii = 0   ' avoid sounds.
        
        Dim commandLINE As String
        Dim op1 As String
        
        commandLINE = Trim(txtCommandPrompt.Text)
        
        op1 = getNewToken(commandLINE, 0, " ")
        
        Select Case UCase(op1)
        
        Case "CLS"
            clear_SCREEN
            '1.15 lCURRENT_POSITION = 753664  ' 8B000    ' top left corner.
            
            ' set cursor to top left corner for
            ' all 8 pages:
            setCursorPos 0, 0, 0
            setCursorPos 0, 0, 1
            setCursorPos 0, 0, 2
            setCursorPos 0, 0, 3
            setCursorPos 0, 0, 4
            setCursorPos 0, 0, 5
            setCursorPos 0, 0, 6
            setCursorPos 0, 0, 7
            
        Case "ECHO"
            add_to_SCREEN Mid(commandLINE, 6) & vbNewLine, True
        Case Else
            add_to_SCREEN "Bad command or file name" & vbNewLine, True
        End Select
        
        txtCommandPrompt.Text = ""
        
    End If
    
End Sub

' 1.14
' adding color support:
' ==========================================================
'Bitfields for character's display attribute:
'Bit(s)  Description (Table 00014)
' 7  foreground blink or (alternate) background bright (see also AX=1003h)
' 6-4    background color (see #00015)
' 3  foreground bright or (alternate) alternate character set (see AX=1103h)
' 2-0    foreground color (see #00015)
'SeeAlso: #00026
'
'(Table 00015)
'Values for character color:
'        Normal          Bright
' 000b   black           dark gray
' 001b   blue            light blue
' 010b   green           light green
' 011b   cyan            light cyan
' 100b   red             light red
' 101b   magenta         light magenta
' 110b   brown           yellow
' 111b   light gray      white
'=====================================================
'
' assumed that picSCREEN.FontTransparent = True
Private Sub drawAttributeAtCurrentXY(attrib As Byte)

On Error Resume Next ' 4.00-Beta-3

Dim tempX As Single
Dim tempY As Single
' store CurrentX/Y:
tempX = picSCREEN.CurrentX
tempY = picSCREEN.CurrentY

        picSCREEN.Line -(tempX + char_WIDTH - 1, tempY + char_HEIGHT - 1), getCharColor(attrib, True), BF

        picSCREEN.ForeColor = getCharColor(attrib, False)
        
' re-store CurrentX/Y:
picSCREEN.CurrentX = tempX
picSCREEN.CurrentY = tempY
End Sub

' 1.14
Private Function getCharColor(attrib As Byte, bBackColor As Boolean) As Long

On Error Resume Next ' 4.00-Beta-3

Dim b As Byte
        
        If bBackColor Then
                ' check high nibble,
                ' move it to low position:
                b = Fix(attrib / 16)
        Else
                ' check first 4 bits,
                ' reset hight nibble:
                b = attrib And 15
        End If
        
        getCharColor = getDOS_COLOR(b)

End Function


' shows what's in video memory on screen
Public Sub VMEM_TO_SCREEN()

On Error Resume Next ' 4.00-Beta-3

Dim i As Long
Dim byteTHEBYTE As Byte
Dim byteTHEBYTE2 As Byte
Dim ix As Integer
Dim iy As Integer
    
picSCREEN.Cls

ix = 0
iy = 0
    
    
If boolGRAPHICS_VIDEO_MODE = True Then  '####

    Debug.Print "#327u-print_in_13h_mode.asm# - updating complete screen in graphix mode"
    
    ' #327u-print_in_13h_mode.asm# Exit Sub ' !!!!!!!!!!!!!!!!!!! I'm not sure it is ever used, but it makes the emulator hang just bit...
    
    
    '  12h = G  80x30  8x16  640x480   16/256K  .   A000 VGA,ATI VIP
    If byteCURRENT_VIDEO_MODE = &H12 Then ' seems to be 4 bits for pixel (not sure... doesn't work in dos prompt).
        
        For i = GRAPHICS_VIDEO_MEMORY_START To GRAPHICS_VIDEO_MEMORY_START + lGRAPHICS_PAGE_SIZE
            ' every byte is 2 pixels
             byteTHEBYTE = theMEMORY(i)
             
             byteTHEBYTE2 = Fix(byteTHEBYTE / 16)
             picSCREEN.PSet (ix, iy), getDOS_COLOR(byteTHEBYTE2)
             
             ix = ix + 1
             If ix >= 640 Then
                ix = 0
                iy = iy + 1
             End If
             
             byteTHEBYTE2 = byteTHEBYTE - byteTHEBYTE2 * 16
             picSCREEN.PSet (ix, iy), getDOS_COLOR(byteTHEBYTE2)
             
             DoEvents
             If frmEmulation.bSTOP_EVERYTHING Then Exit Sub
             
             ix = ix + 1
             If ix >= 640 Then
                ix = 0
                iy = iy + 1
             End If
             
        Next i
        
    '  13h = G  40x25  8x8   320x200  256/256K  .   A000 VGA,MCGA,ATI VIP
    ElseIf byteCURRENT_VIDEO_MODE = &H13 Then ' seems to be byte for pixel.
    
        For i = GRAPHICS_VIDEO_MEMORY_START To GRAPHICS_VIDEO_MEMORY_START + lGRAPHICS_PAGE_SIZE
            ' every byte is 1 pixel
             byteTHEBYTE = theMEMORY(i)

             picSCREEN.PSet (ix, iy), get256_COLOR_PALETTE(byteTHEBYTE)
             
             DoEvents
             If frmEmulation.bSTOP_EVERYTHING Then Exit Sub
             
             ix = ix + 1
             If ix >= 320 Then
                ix = 0
                iy = iy + 1
             End If
            
        Next i
    End If
    

Else '####  boolGRAPHICS_VIDEO_MODE = false




    Dim lEndOfVideoMemory As Long
    
    
    ' WHEN PAGE SIZE: 80*25 * 2 = 4000
    ' then VIDEO MEMORY is from B8000 to B8FA0
        
    lEndOfVideoMemory = screen_WIDTH * 2 * screen_HEIGHT + lCURRENT_VIDEO_PAGE_ADR - 2
    
  

    
    For i = lCURRENT_VIDEO_PAGE_ADR To lEndOfVideoMemory Step 2
      
        picSCREEN.CurrentX = ix * char_WIDTH
        picSCREEN.CurrentY = iy * char_HEIGHT
        
        ' attribute:
        drawAttributeAtCurrentXY theMEMORY(i + 1)
        ' character code:
        If (theMEMORY(i) <> 0) Then
            picSCREEN.Print Chr(theMEMORY(i))
        End If
        
        ix = ix + 1
        
        If (ix = screen_WIDTH) Then
            ix = 0
            iy = iy + 1
        End If
        
'''''        ' #1095m3
'''''        DoEvents
'''''        If frmEmulation.bSTOP_EVERYTHING Then Exit Sub
        
    Next i
    
    
End If ' ####

 ' Debug.Print "VMEM_TO_SCREEN: FULL SCREEN UPDATED"

End Sub

' 1.22 #183
Public Sub updateScreen_at_loc(lLoc As Long)

On Error GoTo err1

    Dim fX As Single
    Dim fY As Single
    Dim lCellAddress As Long
    Dim lTemp1 As Long
    
    
    If boolGRAPHICS_VIDEO_MODE Then
        updatePIXEL_at_loc lLoc, False
        Exit Sub
    End If
    
    
    ' check if lLoc is in current Video Page!
    If (lLoc >= lCURRENT_VIDEO_PAGE_ADR) Then
        ' don't count the border (since we count from 0!):
        If (lLoc >= (lCURRENT_VIDEO_PAGE_ADR + VIDEO_PAGE_SIZE)) Then
            ' Debug.Print "not curent page!"
            Exit Sub
        End If
    Else
        ' Debug.Print "not curent page!"
        Exit Sub
    End If
    
    
    lCellAddress = lLoc
    
    lTemp1 = lLoc - lCURRENT_VIDEO_PAGE_ADR
    
    ' make sure it is aligned to position of a cell!
    '   (ASCII/ATTRIBUTE):
    If (lTemp1 Mod 2) <> 0 Then
        lTemp1 = lTemp1 - 1
        lCellAddress = lCellAddress - 1
    End If

        
    lTemp1 = lTemp1 / 2 ' each cell takes 2 bytes!
    
    fX = lTemp1 Mod screen_WIDTH
    fY = Fix(lTemp1 / screen_WIDTH)
    
    picSCREEN.CurrentX = fX * char_WIDTH
    picSCREEN.CurrentY = fY * char_HEIGHT
    
    
    
    ' attribute
    drawAttributeAtCurrentXY theMEMORY(lCellAddress + 1)
    ' character code:
    If (theMEMORY(lCellAddress) <> 0) Then
        picSCREEN.Print Chr(theMEMORY(lCellAddress))
    End If


    Exit Sub
err1:
    Debug.Print "updateScreen_at_loc: " & Err.Description
End Sub

' if updateWORD is True, it means that 2 bytes are updated.
' currently it supports this mode only:
' 13h = G  40x25  8x8   320x200  256/256K  .   A000 VGA,MCGA,ATI VIP
Public Sub updatePIXEL_at_loc(lLoc As Long, bUpdate_two_bytes As Boolean)

On Error Resume Next ' 4.00-Beta-3

    Dim fX As Single
    Dim fY As Single
    Dim lTemp1 As Long
    Dim byteTHEBYTE As Byte
    
    If Not boolGRAPHICS_VIDEO_MODE Then Exit Sub
    
next_pixel:

    lTemp1 = lLoc - GRAPHICS_VIDEO_MEMORY_START
        
    byteTHEBYTE = theMEMORY(lLoc)
    
    fX = lTemp1 Mod picSCREEN.ScaleWidth
    fY = Fix(lTemp1 / picSCREEN.ScaleWidth)
       
    
    picSCREEN.PSet (fX, fY), get256_COLOR_PALETTE(byteTHEBYTE)

    
    If bUpdate_two_bytes Then
        bUpdate_two_bytes = False
        lLoc = lLoc + 1
        GoTo next_pixel
    End If
    
    
End Sub


' this sub was made before I made scroll_WINDOW_UP(),
' it maybe faster anyway:
Public Sub scroll_screen_UP(ByRef iTimes_to_Scroll As Integer, bATTRIBUTE As Byte)  ' #327xj-scr-adv#  bATTRIBUTE
    
On Error Resume Next ' 4.00-Beta-3
    
    Dim i As Long
    Dim j As Integer
    Dim iTimes As Integer
    
    For iTimes = 1 To iTimes_to_Scroll
   
        For i = lCURRENT_VIDEO_PAGE_ADR To lCURRENT_VIDEO_PAGE_ADR + screen_HEIGHT * screen_WIDTH * 2 - screen_WIDTH * 2 - 1 Step 2
            theMEMORY(i) = theMEMORY(i + screen_WIDTH * 2)
            theMEMORY(i + 1) = theMEMORY(i + 1 + screen_WIDTH * 2)
            
            ' #1095m2
            DoEvents
            If frmEmulation.bSTOP_EVERYTHING Then Exit Sub
            
        Next i
        
' 1.14
'        ' clear last row of the screen:
'        For i = VGA_MEM + screen_HEIGHT * screen_WIDTH * 2 - screen_WIDTH * 2 To VGA_MEM + screen_HEIGHT * screen_WIDTH * 2
'            theMEMORY(i) = 0
'        Next i
   
        ' 1.14
        ' clear last row of the screen:
        For i = lCURRENT_VIDEO_PAGE_ADR + screen_HEIGHT * screen_WIDTH * 2 - screen_WIDTH * 2 To lCURRENT_VIDEO_PAGE_ADR + screen_HEIGHT * screen_WIDTH * 2 Step 2
        
            ' #1095m2
            DoEvents
            If frmEmulation.bSTOP_EVERYTHING Then Exit Sub
                    
            theMEMORY(i) = 0
            theMEMORY(i + 1) = bATTRIBUTE ' #327xj-scr-adv# ' DEFAULT_ATTRIB  ' default attribute 00000111b
        Next i
                
    Next iTimes
    
    ' 1.18 bugfix#85
    ' updates the view of memory list (if it shows video memory)
    If (lStartMemAddress >= lCURRENT_VIDEO_PAGE_ADR) Then
        If (lStartMemAddress <= lCURRENT_VIDEO_PAGE_ADR + screen_HEIGHT * screen_WIDTH * 2) Then
            showMemory lStartMemAddress
        End If
    End If
    If (lStartDisAddress >= lCURRENT_VIDEO_PAGE_ADR) Then
        If (lStartDisAddress <= lCURRENT_VIDEO_PAGE_ADR + screen_HEIGHT * screen_WIDTH * 2) Then
            DoDisassembling lStartMemAddress
        End If
    End If
    

    ' 1.22 bugfix#191
    ' need to update because were writing directly to
    ' memory array:
    VMEM_TO_SCREEN
    
    If bAllowStepBack Then set_bSCREEN_SCROLL_IN_STEP_FLAG ' #1095m
    
End Sub

' 1.13
' used to emulate INT 10h / AH=06h
Public Sub scroll_WINDOW_UP(row_upper_left As Byte, col_upper_left As Byte, row_lower_right As Byte, col_lower_right As Byte, iInsertAttribChar As Integer, ByVal times_to_Scroll As Byte)

On Error GoTo err_swu

    Dim i As Byte
    Dim j As Byte
    Dim k As Byte
    Dim winHeight As Integer
    Dim iCA As Integer ' char and attribute.
    
    winHeight = Abs(CInt(row_lower_right) - CInt(row_upper_left))
    
    
    ' number of lines by which
    ' to scroll down (00h=clear entire window)
    If times_to_Scroll = 0 Then
        times_to_Scroll = winHeight + 1
    End If
        
    
    For k = 1 To times_to_Scroll
   
        For j = (row_upper_left + 1) To row_lower_right
            For i = col_upper_left To col_lower_right
                iCA = getChar_and_Attrib_value(j, i)
                setChar_and_Attrib_value j - 1, i, iCA
                'Debug.Print Chr(get_W_LowBits_STR(iCA))
            Next i
        Next j

        ' clear last row of the window:
        j = row_lower_right
            For i = col_upper_left To col_lower_right
                iCA = getChar_and_Attrib_value(j, i)
                setChar_and_Attrib_value j, i, iInsertAttribChar
            Next i
        
    Next k
    

    ' since writing direct to memory array, need to update
    ' the screen:
    VMEM_TO_SCREEN
    
    
    If bAllowStepBack Then set_bSCREEN_SCROLL_IN_STEP_FLAG ' #1095n
    
    Exit Sub
err_swu:
    Debug.Print "Error on scroll_WINDOW_UP(" & row_upper_left & ", " & col_upper_left & ", " & row_lower_right & ", " & col_lower_right & ", " & times_to_Scroll & ") " & LCase(Err.Description)
    
End Sub

' 1.13
' used to emulate INT 10h / AH=07h
Public Sub scroll_WINDOW_DOWN(row_upper_left As Byte, col_upper_left As Byte, row_lower_right As Byte, col_lower_right As Byte, iInsertAttribChar As Integer, ByVal times_to_Scroll As Byte)

On Error GoTo err_swd

    Dim i As Byte
    Dim j As Integer 'Byte (some how "for" doesn't work with Byte).
    Dim k As Byte
    Dim winHeight As Integer
    Dim iCA As Integer ' char and attribute.
    
    winHeight = Abs(CInt(row_lower_right) - CInt(row_upper_left))
    
    
    ' number of lines by which
    ' to scroll down (00h=clear entire window)
    If times_to_Scroll = 0 Then
        times_to_Scroll = winHeight + 1
    End If
        
    
    For k = 1 To times_to_Scroll
   
        For j = (row_lower_right - 1) To row_upper_left Step -1
            For i = col_upper_left To col_lower_right
                iCA = getChar_and_Attrib_value(CByte(j), i)
                setChar_and_Attrib_value j + 1, i, iCA
            Next i
        Next j

        ' clear first row of the window:
        j = row_upper_left
            For i = col_upper_left To col_lower_right
                iCA = getChar_and_Attrib_value(CByte(j), i)
                setChar_and_Attrib_value CByte(j), i, iInsertAttribChar
            Next i
        
    Next k
    
    ' since writing direct to memory array, need to update
    ' the screen:
    VMEM_TO_SCREEN
    
    
    If bAllowStepBack Then set_bSCREEN_SCROLL_IN_STEP_FLAG ' #1095n
    
    Exit Sub
err_swd:
    Debug.Print "Error on scroll_WINDOW_DOWN(" & row_upper_left & ", " & col_upper_left & ", " & row_lower_right & ", " & col_lower_right & ", " & times_to_Scroll & ") " & LCase(Err.Description)
    
End Sub

' 1.13
' returns both char and attribute at given
' cursor positions.
' Return: lower byte char, high byte attribute.
Private Function getChar_and_Attrib_value(row As Byte, col As Byte) As Integer
On Error Resume Next ' 4.00-Beta-3

    Dim L As Long
    
    L = lCURRENT_VIDEO_PAGE_ADR + CLng(row) * CLng(screen_WIDTH) * 2 + CLng(col) * 2
    
    getChar_and_Attrib_value = RAM.mREAD_WORD(L)
End Function

' 1.13
' sets the attribute and char at given cursor position
' (used with getChar_and_Attrib_value() function):
Private Sub setChar_and_Attrib_value(row As Byte, col As Byte, iChar_and_Attrib As Integer)
On Error GoTo err_scav
    Dim L As Long
    
    L = lCURRENT_VIDEO_PAGE_ADR + CLng(row) * CLng(screen_WIDTH) * 2 + CLng(col) * 2
    
    ' RAM.mWRITE_WORD_i l, iChar_and_Attrib
    ' it's faster to write direct to memory array,
    ' because this way it doesn't the screen update
    ' after each char is written:
    theMEMORY(L) = math_get_low_byte_of_word(iChar_and_Attrib)
    theMEMORY(L + 1) = math_get_high_byte_of_word(iChar_and_Attrib)
    
    Exit Sub
err_scav:
    Debug.Print "Error on setChar_and_Attrib_value(): " & LCase(Err.Description)
End Sub

' waits for user to enter a string,
' returns the entered string.
' does not return (eternal loop) until enter is pressed!
Public Function inputString(MaxCharsToInput As Byte) As String
On Error Resume Next ' 4.00-Beta-3
    ' to prevent some recursive callings    !
    If timerInput.Enabled Then Exit Function
    
    ' to prevent going over the input procedure!
    frmEmulation.cmdStep.Visible = False
    frmEmulation.chkAutoStep.Visible = False
    frmEmulation.picWaitingForInput.Visible = True ' 1.07
    
    Me.DoShowMe
    
    MaxAllowedInput = MaxCharsToInput
      
          
    sInputBuffer = ""
        
    timerInput.Enabled = True
     
    iINPUT_TYPE = 0 ' wait for string.
     
    ' run until ENTER is pressed (end of input):
    Do While timerInput.Enabled And (Not frmEmulation.bSTOP_EVERYTHING)
        DoEvents
    Loop
            
    iINPUT_TYPE = DEFAULT_INPUT_TYPE ' 1.17
      
    ' 1.21
    If frmEmulation.bSTOP_EVERYTHING Then Exit Function
   
    ' 1.21
    stopTimerInput
   
    frmEmulation.picWaitingForInput.Visible = False ' 1.07
    frmEmulation.cmdStep.Visible = True
    frmEmulation.chkAutoStep.Visible = True
    
    inputString = sInputBuffer
    
    ' a string is added to video memory
    ' directly when it is typed!!
End Function

' 1.17 new function made instead!
''''' waits for user to enter a string,
''''' returns the entered string.
''''' does not return (eternal loop) until enter is pressed!
''''Public Function inputLine(MaxCharsToInput As Byte) As String
''''
''''    ' to prevent some recursive callings    !
''''    If timerInput.Enabled Then Exit Function
''''
''''    ' to prevent going over the input procedure!
''''    frmEmulation.cmdStep.Visible = False
''''    frmEmulation.chkAutoStep.Visible = False
''''    frmEmulation.picWaitingForInput.Visible = True ' 1.07
''''
''''    Me.Show
''''
''''    MaxAllowedInput = MaxCharsToInput
''''
''''
''''    ' 1.10 ======================================
''''    ' calculate CurrentX, CurrentY:
''''    setCurXCurY
''''    ' ===========================================
''''
''''    ' keep starting position:
''''    nX = picSCREEN.CurrentX
''''    nY = picSCREEN.CurrentY
''''
''''
''''    sInputBuffer = ""
''''    sBlinker = "_"
''''    lastPrintedInp = ""
''''
''''    timerInput.Enabled = True
''''
''''    iINPUT_TYPE = 0 ' wait for string.
''''
''''    ' run until ENTER is pressed (end of input):
''''    Do While timerInput.Enabled
''''        DoEvents
''''    Loop
''''
''''    ' print out everything again, to make sure the blinker
''''    '    won't stay on the screen:
''''    sBlinker = ""
''''    printOut
''''
''''
''''
''''    frmEmulation.picWaitingForInput.Visible = False ' 1.07
''''    frmEmulation.cmdStep.Visible = True
''''    frmEmulation.chkAutoStep.Visible = True
''''
''''    inputLine = sInputBuffer
''''
''''    ' a string is added to video memory
''''    ' after returned!
''''End Function

' waits for user to enter a char,
' returns the entered char (byte).
' does not return (eternal loop) until any key is pressed!
Public Function inputChar() As Byte
    
On Error Resume Next ' 4.00-Beta-3
    
    ' to prevent some recursive callings    !
    If timerInput.Enabled Then Exit Function
    
    ' to prevent going over the input procedure!
    frmEmulation.cmdStep.Visible = False
    frmEmulation.chkAutoStep.Visible = False
    frmEmulation.picWaitingForInput.Visible = True
    
    Me.DoShowMe
                
           
    iInputChar = 0
    sInputBuffer = ""

        
    timerInput.Enabled = True
    
    iINPUT_TYPE = 3 ' check buffer first! ' #400b4-mini#  #biggy10# 1 ' wait for a single char with echo.
    
' #400b4-mini#  #biggy10#
'''''    ' run until any key is pressed:
'''''    Do While timerInput.Enabled And (Not frmEmulation.bSTOP_EVERYTHING)
'''''        DoEvents
'''''    Loop
    ' #400b4-mini#  #biggy10#  fix:  [1]
    ' run until any key is pressed:
    Do While (uCHARS_IN_KB_BUFFER = 0) And (Not frmEmulation.bSTOP_EVERYTHING)
        DoEvents
    Loop


    
    iINPUT_TYPE = DEFAULT_INPUT_TYPE
    

    If frmEmulation.bSTOP_EVERYTHING Then Exit Function

    stopTimerInput
    
    frmEmulation.picWaitingForInput.Visible = False
    frmEmulation.cmdStep.Visible = True
    frmEmulation.chkAutoStep.Visible = True
    
    
    ' #400b4-mini#  #biggy10#
    '' inputChar = to_unsigned_byte(iInputChar)
        
    ' #400b4-mini#  #biggy10#  fix:  [2]
    If uCHARS_IN_KB_BUFFER > 0 Then ' check just in case.
        ' return it:
        inputChar = uKB_BUFFER(0).cASCII '  uKB_BUFFER(0).cBIOS)
        ' remove last char from the buffer (FIFO):
        removeCharFrom_KB_BUFFER
    End If
    
    
    
    
    ' a string is added to video memory
    ' after returned!
End Function

' 1.17 new function is made instead!
'''' waits for user to enter a char,
'''' returns the entered char (byte).
'''' does not return (eternal loop) until any key is pressed!
'''Public Function inputChar() As Byte
'''
'''    ' to prevent some recursive callings    !
'''    If timerInput.Enabled Then Exit Function
'''
'''    ' to prevent going over the input procedure!
'''    frmEmulation.cmdStep.Visible = False
'''    frmEmulation.chkAutoStep.Visible = False
'''    frmEmulation.picWaitingForInput.Visible = True ' 1.07
'''
'''    Me.Show
'''
'''
'''    ' 1.10 ======================================
'''    ' calculate CurrentX, CurrentY:
'''    setCurXCurY
'''    ' ===========================================
'''
'''    ' keep starting position:
'''    nX = picSCREEN.CurrentX
'''    nY = picSCREEN.CurrentY
'''
'''
'''    iInputChar = 0
'''    sInputBuffer = ""
'''    sBlinker = "_"
'''    lastPrintedInp = ""
'''
'''    timerInput.Enabled = True
'''
'''    iINPUT_TYPE = 1 ' wait for a single char with echo.
'''
'''    ' run until any key is pressed:
'''    Do While timerInput.Enabled
'''        DoEvents
'''    Loop
'''
'''    ' print out everything again, to make sure the blinker
'''    '    won't stay on the screen:
'''    sBlinker = ""
'''    printOut
'''
'''
'''    frmEmulation.picWaitingForInput.Visible = False ' 1.07
'''    frmEmulation.cmdStep.Visible = True
'''    frmEmulation.chkAutoStep.Visible = True
'''
'''    inputChar = to_unsigned_byte(iInputChar)
'''
'''    ' a string is added to video memory
'''    ' after returned!
'''End Function


' 1.10
' waits for user to enter a char,
' returns the entered char (byte).
' does not return (eternal loop) until any key is pressed!
' 1.17
' making it to work with keyboard buffer, timer not used
' anymore!
' 1.21
' returns BIOS scan code in high byte and ASCII code
'  in low byte:
Public Function inputChar_NOECHO() As Integer  ' 1.21 Byte
    
On Error Resume Next ' 4.00-Beta-3
    
    ' to prevent some recursive callings    !
    If frmEmulation.picWaitingForInput.Visible Then Exit Function
    
    ' to prevent going over the input procedure!
    frmEmulation.cmdStep.Visible = False
    frmEmulation.chkAutoStep.Visible = False
    frmEmulation.picWaitingForInput.Visible = True
    
    Me.DoShowMe

    timerInput.Enabled = True
    

    ' wait for a single char without echo via the buffer:
    iINPUT_TYPE = 3
    
    ' run until any key is pressed:
    Do While (uCHARS_IN_KB_BUFFER = 0) And (Not frmEmulation.bSTOP_EVERYTHING)
        DoEvents
    Loop
            
    ' REQUIRED!
    If frmEmulation.bSTOP_EVERYTHING Then Exit Function

    stopTimerInput
    
    frmEmulation.picWaitingForInput.Visible = False
    frmEmulation.cmdStep.Visible = True
    frmEmulation.chkAutoStep.Visible = True
    

    If uCHARS_IN_KB_BUFFER > 0 Then ' check just in case.
        ' return it:
        inputChar_NOECHO = to16bit_SIGNED(uKB_BUFFER(0).cASCII, uKB_BUFFER(0).cBIOS)
        ' remove last char from the buffer (FIFO):
        removeCharFrom_KB_BUFFER
    End If
    
    ' a string is added to video memory
    ' after returned!
End Function

' removing char from keyboard buffer:
' First In First Out:
Private Sub removeCharFrom_KB_BUFFER()

On Error Resume Next ' 4.00-Beta-3

    Dim i As Integer
    
    For i = 0 To uCHARS_IN_KB_BUFFER - 2
        uKB_BUFFER(i) = uKB_BUFFER(i + 1)
    Next i

    uCHARS_IN_KB_BUFFER = uCHARS_IN_KB_BUFFER - 1
    
    show_uKB_BUFFER ' #1114
    
End Sub

' 1.17 - not used any more!
'''
'''' prints the message again from the same point
''''   with what we already have in a buffer:
'''Private Sub printOut()
'''    Dim s As String
'''    Dim tOrigForeColor As Long  ' temporary var to store original color.
'''
'''    ' delete old message by writing over it
'''    '   with back color:
'''    tOrigForeColor = picSCREEN.ForeColor   ' store original fore color.
'''    picSCREEN.ForeColor = picSCREEN.BackColor
'''    picSCREEN.CurrentX = nX
'''    picSCREEN.CurrentY = nY
'''    picSCREEN.Print lastPrintedInp         ' clear from previous message.
'''
'''    ' print new message:
'''    picSCREEN.ForeColor = tOrigForeColor
'''    's = sMessage & " >" & sInputBuffer & sBlinker
'''    s = sInputBuffer & sBlinker
'''    picSCREEN.CurrentX = nX
'''    picSCREEN.CurrentY = nY
'''    picSCREEN.Print s
'''
'''    ' store for removing it on update (when
'''    '    something added to buffer):
'''    lastPrintedInp = s
'''
'''End Sub

' timer, used to make a blinker:
Private Sub timerInput_Timer()
On Error GoTo err1

    Dim ST As Single
    
    ' ++++++++++++++ show blinking cursor +++++++++++++++++++++++++++++
    ' updated on 1.20 #118
    ' updated on 1.23 #213b
    
    ' =============================
    ' set currentX, CurrentY positions of picSCREEN depending
    ' on COL/ROW in memory:
        Dim uCUR_COL As Byte
        Dim uCUR_ROW As Byte
        Dim uCurPage As Byte
        
        uCurPage = get_current_video_page_number
        
        uCUR_COL = getCursorPos_COL(uCurPage)
        uCUR_ROW = getCursorPos_ROW(uCurPage)
    
        picSCREEN.CurrentX = CCur(uCUR_COL) * char_WIDTH
        picSCREEN.CurrentY = CCur(uCUR_ROW) * char_HEIGHT
    ' =============================
    
    ' 1.23#213b make sure old cursor is
    ' turned off first:
    If bCURSOR_DRAWN Then
        If (uCursorDrawn_at_COL <> uCUR_COL) _
          Or (uCursorDrawn_at_ROW = uCUR_ROW) Then
            picSCREEN.CurrentX = CCur(uCursorDrawn_at_COL) * char_WIDTH
            picSCREEN.CurrentY = CCur(uCursorDrawn_at_ROW) * char_HEIGHT
        End If
    End If
        
    If bSHOW_BLINKING_CURSOR Then
        ' 1.23#213b
        uCursorDrawn_at_COL = uCUR_COL
        uCursorDrawn_at_ROW = uCUR_ROW
    
        picSCREEN.ForeColor = vbWhite ' get_ATTRIB_at_CurrentPos(uCurPage) ' #327s-cursor-color#
    
        picSCREEN.DrawMode = vbXorPen
        ST = picSCREEN.CurrentY
        ' Debug.Print "CURSOR SIZE:" & uCursorStartLine, uCursorBottomLine


' #327s-cursor#
''''        picSCREEN.CurrentY = sT + uCursorStartLine + 1
''''        picSCREEN.Line -(picSCREEN.CurrentX + char_WIDTH - 1, sT + uCursorBottomLine + 2), , BF
' #327s-cursor#  - should be the same for all font sizes!!!
        Dim fP32 As Single
        fP32 = char_HEIGHT / 8 '32
        If fP32 <= 0 Then fP32 = 1
        If uCursorStartLine = uCursorBottomLine Then
           'weird... but it doesn't work... ->>>'  picSCREEN.Line (picSCREEN.CurrentX, sT + uCursorStartLine * fP32)-(picSCREEN.CurrentX + char_WIDTH - 1, sT + uCursorBottomLine * fP32), , BF
           Dim x_cc As Single
           Dim y_cc As Single
           x_cc = picSCREEN.CurrentX
           y_cc = ST + uCursorStartLine * fP32
           picSCREEN.Line (x_cc, y_cc)-(x_cc + char_WIDTH - 1, y_cc)
        Else
            picSCREEN.CurrentY = ST + uCursorStartLine * fP32
            picSCREEN.Line -(picSCREEN.CurrentX + char_WIDTH - 1, ST + uCursorBottomLine * fP32), , BF
        End If

        picSCREEN.DrawMode = vbCopyPen
        bCURSOR_DRAWN = Not bCURSOR_DRAWN
    End If
    ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    
    
    'frmEmulation.sliderSTEPDELAY.Enabled = False '#1138
    frmEmulation.scrollStepDelay.Enabled = False
    
    frmEmulation.lblStepTime.Enabled = False
    
    
    

    
    
    Exit Sub
err1:
    Debug.Print "timerInput ERROR: " & LCase(Err.Description)
End Sub

' 1.21 #165b
Public Sub stopTimerInput()

On Error Resume Next ' 4.00-Beta-3

    timerInput.Enabled = False
    
    If bCURSOR_DRAWN Then
        ' call Timer sub once to XOR cursor over (hide it):
        timerInput_Timer
        ' Debug.Print "atrificial cursor hide"
        'Else
        ' Debug.Print "cursor should be ok"
    End If
    
'#1138 REAL FIX!
'''    ' March 12, 2004
'''    If bUpdateStepSpeed Then
'''        frmEmulation.sliderSTEPDELAY_Change_public
'''        bUpdateStepSpeed = False '#1138 BUG FIX
'''    End If
    
    frmEmulation.scrollStepDelay.Enabled = True '#1138 BETTER FIX!
    frmEmulation.lblStepTime.Enabled = True
    
End Sub

' 1.02
' 1.29#404 Private Sub Form_Activate()
Public Sub DoShowMe()
On Error Resume Next '3.27xm
    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
End Sub

' 1.09
Public Sub setCursorPos(uCol As Byte, uRow As Byte, uPage As Byte)

On Error Resume Next ' 4.00-Beta-3

' 1.15
'    ' "*2" because each symbol takes 2 bytes (attributes and ascii code):
'    lCURRENT_POSITION = lCURRENT_VIDEO_PAGE_ADR + screen_WIDTH * iRow * 2 + iCol * 2

' 1.25#307
' I think it's not required here! If bDONT_UPDATE_SYS_INFO Then Exit Sub

' 1.15
'   MEM 0040h:0050h - VIDEO - CURSOR POSITIONS
'   Size:    8 WORDs
'   Desc:    contains row and column position for the cursors on each of eight
'      video pages
    If uPage < 8 Then
        RAM.mWRITE_WORD &H450 + (2 * CLng(uPage)), uCol, uRow
    Else
        Debug.Print "Error page number setCursorPos(" & uCol & ", " & uRow & ", " & uPage & ")"
    End If

End Sub

' 1.15
Public Function getCursorPos_COL(uPage As Byte) As Byte
On Error Resume Next ' 4.00-Beta-3

    getCursorPos_COL = RAM.mREAD_BYTE(&H450 + (2 * CLng(uPage)))
End Function

' 1.15
Public Function getCursorPos_ROW(uPage As Byte) As Byte
On Error Resume Next ' 4.00-Beta-3

    getCursorPos_ROW = RAM.mREAD_BYTE(&H450 + (2 * CLng(uPage)) + 1)
End Function

'''' 1.15
''''' 1.09
''''Public Function getCursorPos_COL() As Byte
''''On Error GoTo err_gcpc
''''
''''    Dim lTemp As Long
''''
''''    lTemp = lCURRENT_POSITION
''''
''''    lTemp = lTemp - lCURRENT_VIDEO_PAGE_ADR
''''
''''    ' "*2", "/2" because each symbol takes 2 bytes
''''    ' (attributes and ascii code):
''''    getCursorPos_COL = (lTemp Mod (screen_WIDTH * 2)) / 2
''''
''''    Exit Function
''''err_gcpc:
''''
''''    Debug.Print "Error on getCursorPos_COL(): " & LCase(err.Description)
''''End Function
''''
''''' 1.09
''''Public Function getCursorPos_ROW() As Byte
''''On Error GoTo err_gcpr
''''
''''    Dim lTemp As Long
''''
''''    lTemp = lCURRENT_POSITION
''''
''''    lTemp = lTemp - lCURRENT_VIDEO_PAGE_ADR
''''
''''    ' "*2" because each symbol takes 2 bytes
''''    ' (attributes and ascii code):
''''    getCursorPos_ROW = Fix(lTemp / (screen_WIDTH * 2))
''''
''''    Exit Function
''''err_gcpr:
''''
''''    Debug.Print "Error on getCursorPos_ROW(): " & LCase(err.Description)
''''End Function


' 1.15
Private Function getAdrOfCurrentCursorPos(uPage As Byte) As Long

On Error Resume Next ' 4.00-Beta-3

    Dim uCUR_COL As Byte
    Dim uCUR_ROW As Byte
    Dim lT As Long
    
    uCUR_COL = getCursorPos_COL(uPage)
    uCUR_ROW = getCursorPos_ROW(uPage)
    
    getAdrOfCurrentCursorPos = VIDEO_MEMORY_START + (CLng(uPage) * VIDEO_PAGE_SIZE) + screen_WIDTH * CLng(uCUR_ROW) * 2 + CLng(uCUR_COL) * 2

End Function


Public Function get_ASCII_CODE_at_CurrentPos(uPage As Byte) As Byte
On Error GoTo err_gacacp
    
    get_ASCII_CODE_at_CurrentPos = theMEMORY(getAdrOfCurrentCursorPos(uPage))
    Exit Function
    
err_gacacp:
    Debug.Print "Error on get_ASCII_CODE_at_CurrentPos(): " & LCase(Err.Description)
End Function


Public Function get_ATTRIB_at_CurrentPos(uPage As Byte) As Byte
On Error GoTo err_gaacp

    ' #327u-print_in_13h_mode.asm#
    If boolGRAPHICS_VIDEO_MODE Then
        get_ATTRIB_at_CurrentPos = DEFAULT_ATTRIB
    Else
        get_ATTRIB_at_CurrentPos = theMEMORY(getAdrOfCurrentCursorPos(uPage) + 1)
    End If
        
    Exit Function
        
err_gaacp:
    Debug.Print "Error on get_ATTRIB_at_CurrentPos(): " & LCase(Err.Description)
End Function

''''' 1.09
''''Public Sub setChar_and_Attribute_at_CurrentPos(bChar As Byte, bAttrib As Byte, bTELETYPE As Boolean)
''''
''''        If bTELETYPE Then
''''            ' got over the screen?
''''            If (lCURRENT_POSITION > screen_WIDTH * 2 * screen_HEIGHT + lCURRENT_VIDEO_PAGE_ADR - 2) Then
''''                scroll_screen_UP (1)
''''                lCURRENT_POSITION = lCURRENT_POSITION - screen_WIDTH * 2
''''            End If
''''        End If
''''
''''
''''        If (bChar = 10) Then ' LINE FEED
''''            lCURRENT_POSITION = lCURRENT_POSITION + screen_WIDTH * 2
''''        ElseIf (bChar = 13) Then ' CARRIGE RETURN
''''            lCURRENT_POSITION = lCURRENT_POSITION - ((lCURRENT_POSITION - lCURRENT_VIDEO_PAGE_ADR) Mod (screen_WIDTH * 2))
''''        ElseIf (bChar = 8) Then ' back-space (1.09)
''''            lCURRENT_POSITION = lCURRENT_POSITION - 2
''''        Else
''''            theMEMORY(lCURRENT_POSITION) = bChar
''''            ' attributes are set here:
''''            theMEMORY(lCURRENT_POSITION + 1) = bAttrib
''''
''''            If bTELETYPE Then
''''                ' advance current position:
''''                lCURRENT_POSITION = lCURRENT_POSITION + 2
''''            End If
''''        End If
''''End Sub


' 1.15
Public Sub setChar_and_Attribute_at_CurrentPos(bChar As Byte, bAttrib As Byte, bTELETYPE As Boolean, uPage As Byte, bSCROLL As Boolean, bMSDOS_STYLE As Boolean)   ' #327xj-scroll-bug# - bSCROLL,bMSDOS_STYLE
On Error GoTo err1
        Dim uCUR_COL As Byte
        Dim uCUR_ROW As Byte
        
        Dim lT As Long
        
        Dim bTIMER_INPUT_STOPPED As Boolean ' 1.23#213b
        bTIMER_INPUT_STOPPED = False
        
        uCUR_COL = getCursorPos_COL(uPage)
        uCUR_ROW = getCursorPos_ROW(uPage)
        
        ' 1.23#213b
        If timerInput.Enabled Then
            timerInput.Enabled = False ' sinhronize!
            bTIMER_INPUT_STOPPED = True
        End If
        
        
        ' major bug fix in version 1.16
        If bTELETYPE And bSCROLL Then
            ' got over the screen?
            
            If (uCUR_COL >= screen_WIDTH) Or (uCUR_ROW >= screen_HEIGHT) Then
                uCUR_COL = 0
                ' BUGFIX 1.20 #124
                If uCUR_ROW < 255 Then
                    uCUR_ROW = uCUR_ROW + 1
                Else
                    uCUR_ROW = 0 ' overflow!
                End If
                setCursorPos uCUR_COL, uCUR_ROW, uPage
            End If
            
            
            ' #327xj-scroll-bug# - fix of fix
            If bMSDOS_STYLE Then
                If (uCUR_ROW >= screen_HEIGHT - 1) Then '#327xf-scroll-bug# "-1" added.
                    scroll_screen_UP 1, bAttrib
                    uCUR_COL = 0
                    ' overflow never possible here:
                    uCUR_ROW = screen_HEIGHT - 2 ' can be unrealistic @222 ' '#327xf-scroll-bug# "-1" replaced to "-2".
                    setCursorPos uCUR_COL, uCUR_ROW, uPage
                End If
            Else ' BIOS STYLE:
                If (uCUR_ROW >= screen_HEIGHT) Then
                    scroll_screen_UP 1, bAttrib
                    uCUR_COL = 0
                    ' overflow never possible here:
                    uCUR_ROW = screen_HEIGHT - 1 ' can be unrealistic @222
                    setCursorPos uCUR_COL, uCUR_ROW, uPage
                End If
            End If
            
            
        End If


        If (bChar = 10) Then ' LINE FEED
            If uCUR_ROW < 255 Then ' 1.17 avoid errors!
                uCUR_ROW = uCUR_ROW + 1
            Else
                uCUR_ROW = 0 ' overflow.
            End If
            setCursorPos uCUR_COL, uCUR_ROW, uPage
        ElseIf (bChar = 13) Then ' CARRIGE RETURN
            uCUR_COL = 0
            setCursorPos uCUR_COL, uCUR_ROW, uPage
        ElseIf (bChar = 8) Then ' back-space (1.09)
            If uCUR_COL > 0 Then ' 1.17 avoid errors!
                uCUR_COL = uCUR_COL - 1
            End If
            setCursorPos uCUR_COL, uCUR_ROW, uPage
        ElseIf (bChar = 7) Then ' #327u-bell#
            If bDO_BEEP Then Beep 700, 200        ' #327u-bell#
            
        ElseIf (bChar = 9) Then ' #327u-tab-bug.asm#
               Dim iTabs As Integer
               Dim i1 As Integer
                
               iTabs = 8 - (uCUR_COL Mod 8)
               For i1 = 1 To iTabs
                    lT = VIDEO_MEMORY_START + (CLng(uPage) * VIDEO_PAGE_SIZE) + screen_WIDTH * CLng(uCUR_ROW) * 2 + CLng(uCUR_COL) * 2
                    RAM.mWRITE_WORD lT, 32, bAttrib ' 32=space
                    If bTELETYPE Then advance_current_position (uPage)
                    uCUR_COL = getCursorPos_COL(uPage)
                    uCUR_ROW = getCursorPos_ROW(uPage)
               Next i1
        Else
        
        
        
        
        
        ' #327u-print_in_13h_mode.asm#
        If boolGRAPHICS_VIDEO_MODE Then
            ' assumed that we have only one page in graphics mode
            ' assumed that we have 8x8 chars, and every pixel takes a byte.
            lT = GRAPHICS_VIDEO_MEMORY_START + screen_WIDTH * CLng(uCUR_ROW) * char_HEIGHT * char_WIDTH + CLng(uCUR_COL) * char_WIDTH
            frmScreen_ASCII_CHARMAP.draw_char_to_video_memory bChar, lT, bAttrib
        Else
            lT = VIDEO_MEMORY_START + (CLng(uPage) * VIDEO_PAGE_SIZE) + screen_WIDTH * CLng(uCUR_ROW) * 2 + CLng(uCUR_COL) * 2
            RAM.mWRITE_WORD lT, bChar, bAttrib '  #1095h
        End If

        
        ' #TODO!-327u#
        ' idealyy would be to jump out of functions that call the printing, interrupts etc... when frmEmulation.bSTOP_EVERYTHING = True
        ' DoEvents ' #327u-print_in_13h_mode.asm#
        





            If bTELETYPE Then
                ' advance current position:
                advance_current_position (uPage)
            End If










            ' 1.23#213b
            If bTIMER_INPUT_STOPPED Then
                If (uCUR_COL = uCursorDrawn_at_COL) Then
                    If (uCUR_ROW = uCursorDrawn_at_ROW) Then
                        bCURSOR_DRAWN = False
                    End If
                End If
            End If
            
''''' #1095h
'''            ' 1.22 #183 '
'''            ' instead of calling VMEM_TO_SCREEN after each
'''            ' call to this sub, I will add update for single cell here:
'''            updateScreen_at_loc lT


        End If
        
        ' 1.23#213b
        ' sinchronization completed!
        If bTIMER_INPUT_STOPPED Then
            timerInput.Enabled = True
        End If
        
        
        
        Exit Sub
        
err1:
        Debug.Print "err. setChar_and_Attribute_at_CurrentPos: " & Err.Description
End Sub

' 1.09
Public Sub advance_current_position(uPage As Byte)

On Error Resume Next ' 4.00-Beta-3

''' 1.15
'''    ' advancing by 2 because two bytes are used (first is
'''    '  ASCII code, second is an attribute):
'''    lCURRENT_POSITION = lCURRENT_POSITION + 2

' 1.15
        Dim uCUR_COL As Byte
        Dim uCUR_ROW As Byte
        
        uCUR_COL = getCursorPos_COL(uPage)
        uCUR_ROW = getCursorPos_ROW(uPage)
        
        ' BUGFIX 1.20 #124
        If uCUR_COL < 255 Then
            uCUR_COL = uCUR_COL + 1
        Else
            uCUR_COL = 0 ' overflow!
        End If
        
        If uCUR_COL > screen_WIDTH Then
            uCUR_COL = 0
            ' BUGFIX 1.20 #124
            If uCUR_ROW < 255 Then
                uCUR_ROW = uCUR_ROW + 1
            Else
                uCUR_ROW = 0 ' overflow!
            End If
        End If
        
        setCursorPos uCUR_COL, uCUR_ROW, uPage
End Sub

' 1.09
' we will replace most of calls "frmScreen.Show" to
' frmscreen.show_if_not_visible to prevent
' ugly ways of activating frmScreen and
' making hard to press buttons on frmEmulation:
Public Sub show_if_not_visible()

On Error GoTo err1


    ' #400b10-no-screen-popup#
    If Not ACTIVATE_SCREEN Then
        Exit Sub
    End If
    



    If bFIRST_TIME_SHOW_SCREEN Then
        frmScreen.DoShowMe
        bFIRST_TIME_SHOW_SCREEN = False
        GoTo exit_visible
    End If

    If Me.Visible = False Then
        frmScreen.DoShowMe
        GoTo exit_visible
    End If
    
    If Me.WindowState = vbMinimized Then
        frmScreen.DoShowMe
        GoTo exit_visible
    End If

    
exit_visible:
    ' 3.27w
'    If bKEEP_DEBUG_LOG Then
'        frmDebugLog.Show   ' well, if it's minimized, there is no point to show it. but if user activated frmScreen using t or p command, than it's good to bring the console back.
'    End If
    
    Exit Sub
err1:
End Sub

'''' 1.10
'''' set currentX, CurrentY positions of picSCREEN depending
'''' on lCURRENT_POSITION:
'''Private Sub setCurXCurY()
'''    Dim lT1 As Long
'''    Dim lRow As Long
'''    Dim lCol As Long
'''
'''    lT1 = lCURRENT_POSITION - lCURRENT_VIDEO_PAGE_ADR
'''
'''    lRow = Fix(lT1 / (screen_WIDTH * 2))
'''
'''    lCol = (lT1 Mod (screen_WIDTH * 2)) / 2
'''
'''    picSCREEN.CurrentX = lCol * char_WIDTH
'''    picSCREEN.CurrentY = lRow * char_HEIGHT
'''
''''    Debug.Print "AAA: " & lRow, lCol
''''    Debug.Print "BBB: " & picSCREEN.CurrentX, picSCREEN.CurrentY
'''End Sub

' inserted into timerInput_Timer
''''
''''' set currentX, CurrentY positions of picSCREEN depending
''''' on COL/ROW in memory:
''''Private Sub setCurXCurY()
''''
''''    Dim uCUR_COL As Byte
''''    Dim uCUR_ROW As Byte
''''    Dim uCurPage As Byte
''''
''''    uCurPage = get_current_video_page_number
''''
''''    uCUR_COL = getCursorPos_COL(uCurPage)
''''    uCUR_ROW = getCursorPos_ROW(uCurPage)
''''
''''    picSCREEN.CurrentX = CCur(uCUR_COL) * char_WIDTH
''''    picSCREEN.CurrentY = CCur(uCUR_ROW) * char_HEIGHT
''''
''''End Sub

' 1.17
Public Sub setCursorSize(uStartLine As Byte, uBottomLine As Byte)
On Error Resume Next ' 4.00-Beta-3
    uCursorStartLine = uStartLine
    uCursorBottomLine = uBottomLine
End Sub

' 1.17
Public Function getCursor_StartLine() As Byte
On Error Resume Next ' 4.00-Beta-3
    getCursor_StartLine = uCursorStartLine
End Function

' 1.17
Public Function getcursor_BottomLine() As Byte
On Error Resume Next ' 4.00-Beta-3
    getcursor_BottomLine = uCursorBottomLine
End Function


' 1.23 #231
' currently this sub resizes the screen only!
Public Sub set_VIDEO_MODE(ByRef uMODE As Byte)

On Error Resume Next ' 4.00-Beta-3

' #327u-print_in_13h_mode.asm# - jic
frmScreen.picSCREEN.ScaleMode = vbPixels
boolGRAPHICS_VIDEO_MODE = False
frmScreen.Width = 7470
frmScreen.Height = 5430
picSCREEN.Cls
setCursorPos 0, 0, 0
DoEvents ' allow Form_Resize() to process it.


Select Case uMODE

' text/ text pixel    pixel   colors disply scrn  system
' grph resol   box  resolution       pages  addr

' = T  40x25   9x16  360x400   16       8   B800 VGA
' = T  40x25   9x16  360x400   16       8   B800 VGA
Case 0, 1
    boolGRAPHICS_VIDEO_MODE = False
    setSCREEN_W_H ' #327u-hm...hope it won't get us into more trouble#
    resize_screen_to 40, 25
    byteCURRENT_VIDEO_MODE = uMODE
    bSHOW_BLINKING_CURSOR = True
    cmdChangeFont.Enabled = True
    
    ' #327u-print_in_13h_mode.asm#
    ' here it may not be correct, but direct pixel output is not supported in this mode anyway...
    iGRAPHICS_SCREEN_PIXELS_X = 360
    iGRAPHICS_SCREEN_PIXELS_Y = 400
    
    
    
' = T  80x25   9x16  720x400   16       8   B800 VGA
' = T  80x25   9x16  720x400   16       8   B800 VGA
Case 2, 3
    boolGRAPHICS_VIDEO_MODE = False
    setSCREEN_W_H ' #327u-hm...hope it won't get us into more trouble#
    resize_screen_to 80, 25
    byteCURRENT_VIDEO_MODE = uMODE
    bSHOW_BLINKING_CURSOR = True
    cmdChangeFont.Enabled = True
    
    ' #327u-print_in_13h_mode.asm#
    ' here it may not be correct, but direct pixel output is not supported in this mode anyway...
    iGRAPHICS_SCREEN_PIXELS_X = 720
    iGRAPHICS_SCREEN_PIXELS_Y = 400
    
' it works but only when pixels are set via interrupt! (direct memory access not supported!)
' #1048
'  12h = G  80x30  8x16  640x480   16/256K  .   A000 VGA,ATI VIP
Case &H12
    boolGRAPHICS_VIDEO_MODE = True
    setSCREEN_W_H ' #327u-hm...hope it won't get us into more trouble#
    resize_screen_to_pixels 640, 480
    byteCURRENT_VIDEO_MODE = uMODE

   '  lGRAPHICS_PAGE_SIZE = 153600  ' 4 bits for a pixel (should be, but not implemented, using byte for pixel as in 13h).
    lGRAPHICS_PAGE_SIZE = 307200  ' NOT STANDARD! EMULATOR UNIQUE!!! byte for pixel, just to make drawrect.txt work:)
    bSHOW_BLINKING_CURSOR = False
    cmdChangeFont.Enabled = False
    
    iGRAPHICS_SCREEN_PIXELS_X = 640
    iGRAPHICS_SCREEN_PIXELS_Y = 480
    
' #1048
'  13h = G  40x25  8x8   320x200  256/256K  .   A000 VGA,MCGA,ATI VIP
Case &H13
    boolGRAPHICS_VIDEO_MODE = True
    setSCREEN_W_H ' #327u-hm...hope it won't get us into more trouble#
    resize_screen_to_pixels 320, 200
    byteCURRENT_VIDEO_MODE = uMODE
    lGRAPHICS_PAGE_SIZE = 64000 ' byte for a pixel.
    bSHOW_BLINKING_CURSOR = False
    cmdChangeFont.Enabled = False
    
    iGRAPHICS_SCREEN_PIXELS_X = 320
    iGRAPHICS_SCREEN_PIXELS_Y = 200
    
Case Else
    show_if_not_visible
    mBox Me, "set_VIDEO_MODE: " & cMT("unsupported video mode:") & "  " & Hex(uMODE) & "h"

End Select

End Sub

' 1.23
' resizes the screen form:
' assumed that frmScreen.ScaleMode=Pixel!
' (the strange algorithm is used to calculate fRelation
' because form includes the caption and borders)
Public Sub resize_screen_to(iCols As Integer, iRows As Integer)

On Error GoTo err_rst

Dim fRelationWidth As Long
Dim fRelationHeight As Long

Dim fNew_picScreen_width As Long
Dim fNew_picScreen_height As Long


' to allow resize:
If (Me.WindowState = vbMaximized) Or (Me.WindowState = vbMinimized) Then
    Me.WindowState = vbNormal
End If


' get current relations between picScreen.Width and form.width
fRelationWidth = (Me.Width / Screen.TwipsPerPixelX) - picSCREEN.Width

' desired picScreen.Width:
fNew_picScreen_width = char_WIDTH * iCols

Me.Width = (fNew_picScreen_width + fRelationWidth) * Screen.TwipsPerPixelX


' get current relations between picScreen.Height and form.Height
fRelationHeight = (Me.Height / Screen.TwipsPerPixelY) - picSCREEN.Height

' desired picScreen.Height:
fNew_picScreen_height = char_HEIGHT * iRows

Me.Height = (fNew_picScreen_height + fRelationHeight) * Screen.TwipsPerPixelY




Exit Sub

err_rst:
    Debug.Print "resize_screen_to: " & iCols & ", " & iRows & ": " & LCase(Err.Description)
End Sub







' #1048
' PIXELS!!
Public Sub resize_screen_to_pixels(iCols As Integer, iRows As Integer)

On Error GoTo err_rst

Dim fRelationWidth As Long
Dim fRelationHeight As Long

Dim fNew_picScreen_width As Long
Dim fNew_picScreen_height As Long


' to allow resize:
If (Me.WindowState = vbMaximized) Or (Me.WindowState = vbMinimized) Then
    Me.WindowState = vbNormal
End If


' get current relations between picScreen.Width and form.width
fRelationWidth = (Me.Width / Screen.TwipsPerPixelX) - picSCREEN.Width

' desired picScreen.Width in PIXELS:
fNew_picScreen_width = iCols

Me.Width = (fNew_picScreen_width + fRelationWidth) * Screen.TwipsPerPixelX


' get current relations between picScreen.Height and form.Height
fRelationHeight = (Me.Height / Screen.TwipsPerPixelY) - picSCREEN.Height

' desired picScreen.Height in PIXELS:
fNew_picScreen_height = iRows

Me.Height = (fNew_picScreen_height + fRelationHeight) * Screen.TwipsPerPixelY




Exit Sub

err_rst:
    Debug.Print "resize_screen_to_pixels: " & iCols & ", " & iRows & ": " & LCase(Err.Description)
End Sub













' 1.28#369
' only 16 colors are supported, so find the closest color,
' returns the chosen color
Public Function set_DEFAULT_ATTRIB_backcolor(lBack As Long) As Long

On Error Resume Next ' 4.00-Beta-3

Dim i As Byte
Dim uNewBackAttrib As Byte
Dim lDIF1 As Long
Dim lDIF2 As Long

lDIF2 = &HFFFFFF

For i = 0 To 15
    lDIF1 = Abs(lBack - getDOS_COLOR(i))
    
    If lDIF1 < lDIF2 Then
        lDIF2 = lDIF1
        uNewBackAttrib = i
    End If
    
Next i


DEFAULT_ATTRIB = DEFAULT_ATTRIB And &HF
uNewBackAttrib = uNewBackAttrib * 16
DEFAULT_ATTRIB = DEFAULT_ATTRIB Or uNewBackAttrib

reset_DEFAULT_ATTRIBUTE_if_equal

set_DEFAULT_ATTRIB_backcolor = get_DEFAULT_ATTRIB_backcolor

End Function


' 1.28#369
' only 16 colors are supported, so find the closest color,
' returns the chosen color
Public Function set_DEFAULT_ATTRIB_forecolor(lFore As Long) As Long

On Error Resume Next ' 4.00-Beta-3

Dim i As Byte
Dim uNewForeAttrib As Byte
Dim lDIF1 As Long
Dim lDIF2 As Long

lDIF2 = &HFFFFFF

For i = 0 To 15
    lDIF1 = Abs(lFore - getDOS_COLOR(i))
    
    If lDIF1 < lDIF2 Then
        lDIF2 = lDIF1
        uNewForeAttrib = i
    End If
    
Next i

DEFAULT_ATTRIB = DEFAULT_ATTRIB And &HF0
DEFAULT_ATTRIB = DEFAULT_ATTRIB Or uNewForeAttrib

reset_DEFAULT_ATTRIBUTE_if_equal

set_DEFAULT_ATTRIB_forecolor = get_DEFAULT_ATTRIB_forecolor

End Function

' 1.28#369
Public Function get_DEFAULT_ATTRIB_backcolor() As Long

On Error Resume Next ' 4.00-Beta-3

Dim i As Byte

i = DEFAULT_ATTRIB And &HF0
i = Fix(i / 16)
get_DEFAULT_ATTRIB_backcolor = getDOS_COLOR(i)

End Function

' 1.28#369
Public Function get_DEFAULT_ATTRIB_forecolor() As Long

On Error Resume Next ' 4.00-Beta-3

Dim i As Byte

i = DEFAULT_ATTRIB And &HF
get_DEFAULT_ATTRIB_forecolor = getDOS_COLOR(i)

End Function

' 1.28#369
Public Function get_DEFAULT_ATTRIB()
    get_DEFAULT_ATTRIB = DEFAULT_ATTRIB
End Function

' 1.28#369
Public Sub set_DEFAULT_ATTRIB(uValue As Byte)
On Error Resume Next ' 4.00-Beta-3
    DEFAULT_ATTRIB = uValue
    reset_DEFAULT_ATTRIBUTE_if_equal
End Sub

' 1.28#369
' don't allow to set the same default
' color for fore and back ground:
Private Sub reset_DEFAULT_ATTRIBUTE_if_equal()

On Error Resume Next ' 4.00-Beta-3

Dim ic1 As Byte
Dim ic2 As Byte

' background:
ic1 = DEFAULT_ATTRIB And &HF0
ic1 = Fix(ic1 / 16)

' foreground:
ic2 = DEFAULT_ATTRIB And &HF

If ic1 = ic2 Then DEFAULT_ATTRIB = 7

End Sub















' copied (particially) from frmOptions to enable ' 2005-03-13 #1010
Private Sub cmdChangeFont_Click()
On Error GoTo err1

        frmScreen.picSCREEN.ForeColor = frmScreen.get_DEFAULT_ATTRIB_forecolor
    
        'If Not set_font(frmScreen.picSCREEN) Then Exit Sub
         picSCREEN.Font.Name = InputBox("font name?", " ", "Fixedsys")
         picSCREEN.Font.Size = InputBox("font size?", " ", "12")
        
        
        frmScreen.set_DEFAULT_ATTRIB_forecolor frmScreen.picSCREEN.ForeColor
        
        
        If frmScreen.picSCREEN.ForeColor <> frmScreen.get_DEFAULT_ATTRIB_forecolor Then
            MsgBox cMT("cannot set the same back and fore color.") & vbNewLine & _
                   cMT("defaults set!"), vbExclamation
                   
            ' this is unique to ' 2005-03-13 #1010 update:
            frmScreen.set_DEFAULT_ATTRIB_forecolor frmScreen.get_DEFAULT_ATTRIB_forecolor
            frmScreen.set_DEFAULT_ATTRIB_backcolor frmScreen.get_DEFAULT_ATTRIB_backcolor
        End If
        
        ' update the screen using new font:
        frmScreen.setSCREEN_W_H
        frmScreen.VMEM_TO_SCREEN
        
        If b_LOADED_frmASCII_CHARS Then frmASCII_CHARS.draw_ascii
        
'        ' 2005-03-14 #1016
'        mBox Me, "note: video memory must be re-written" & vbNewLine & _
'                 " after changing font or diplay size."
'
                 Exit Sub
err1:
                 Debug.Print "err change font: " & Err.Description
    
End Sub




'' copied from frmOptions to enable ' 2005-03-13 #1010
'Private Function set_font(obj As Object) As Boolean
'
'On Error GoTo err_sf
'
'Dim f As New StdFont
'Dim lColor As Long
'Dim stdF As StdFont
'
'lColor = obj.ForeColor
'
'Set stdF = ComDlg.ShowFont(obj.Font, lColor, True)
'
'If Not ComDlg.bFONT_CANCELED Then
'    Set obj.Font = stdF
'
'    obj.ForeColor = lColor
'
'    set_font = True
'Else
'    set_font = False
'End If
'
'Exit Function
'err_sf:
'    Debug.Print "Error on set_font(): " & LCase(Err.Description)
'
'End Function

' #1114
Public Sub show_uKB_BUFFER()
On Error GoTo err1

    Dim i As Integer
    Dim s As String
    Dim sASCII As String
    s = ""
    sASCII = ""
    
    For i = 0 To uCHARS_IN_KB_BUFFER - 1
        
        ' for keys that don't have ASCII code, we add BIOS scan code instead,
        ' it applies to arrow keys on keyboard.
        If uKB_BUFFER(i).cASCII <> 0 Then
            If uKB_BUFFER(i).cASCII <> 13 Then ' #1123b
                s = s & Chr(uKB_BUFFER(i).cASCII)
            Else
                s = s & " " ' #1123b
            End If
            sASCII = sASCII & uKB_BUFFER(i).cASCII
        Else
            s = s & " "
            sASCII = sASCII & "sc" & uKB_BUFFER(i).cBIOS  ' BIOS CODES have "sc" prefix.
        End If
        
        If i <> uCHARS_IN_KB_BUFFER - 1 Then
            sASCII = sASCII & ","
        End If
        
    Next i




    lblKeyboardBuffer.FontName = picSCREEN.FontName ' #1114b
    '#1173b lblKeyboardBuffer.Top = lblKbrdBuff.Top
    lblKeyboardBufferASCII.Top = lblKeyboardBuffer.Top + lblKeyboardBuffer.Height + 1
    
    lblKeyboardBuffer.Caption = " " & s & "  " & uCHARS_IN_KB_BUFFER & "/" & KB_BUFFER_MAX
    If uCHARS_IN_KB_BUFFER = KB_BUFFER_MAX Then
        lblKeyboardBuffer.ForeColor = vbRed
    Else
        lblKeyboardBuffer.ForeColor = vbBlack
    End If
    
    lblKeyboardBufferASCII.Caption = " " & sASCII & " "


    s = ""
    sASCII = ""
    
Exit Sub
err1:
    Debug.Print "err: show_uKB_BUFFER: " & LCase(Err.Description)
End Sub





Private Sub lblKeyboardBufferASCII_Click() ' #1114c
    lblKeyboardBuffer_Click
End Sub


Private Sub lblKeyboardBuffer_Click() ' #1114c
    On Error GoTo err1
    
       ' If MsgBox(cMT("flush keyboard buffer?"), vbYesNo, cMT("clear keyboard buffer")) = vbYes Then
            Flush_KB_Buffer
       ' End If
    
    Exit Sub
err1:
    Debug.Print " err: lblKeyboardBuffer_Click: " & LCase(Err.Description)
End Sub

' #400b3-cl-buf#
Sub Flush_KB_Buffer()
On Error Resume Next
    uCHARS_IN_KB_BUFFER = 0
    show_uKB_BUFFER
End Sub


Private Sub picSCREEN_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next ' 4.00-Beta-3
    set_mouse_coordiates_and_button_state X, Y, Button, 0
    
    If bSHOW_MOUSE_POINTER Then show_mouse_pointer
End Sub





Public Sub show_mouse_pointer()
On Error GoTo err1


   If Not bSHOW_MOUSE_POINTER Then Exit Sub ' jic.
    
    
   If boolGRAPHICS_VIDEO_MODE Then Exit Sub ' no need here, it seems dos has windows like cursors :)
    
    
   Dim prevDrawMode As Integer
   prevDrawMode = picSCREEN.DrawMode

    
   picSCREEN.DrawMode = vbXorPen
   
   If mouse_pointer_shown Then ' shown already?
        ' clear previous location
        picSCREEN.Line (f_mouse_pointer_X_PREV, f_mouse_pointer_Y_PREV)-(f_mouse_pointer_X_PREV + char_WIDTH - 1, f_mouse_pointer_Y_PREV + char_HEIGHT - 1), mouse_pointer_color, BF
   End If
   
   f_mouse_pointer_X = fCURRENT_MOUSE_X - (fCURRENT_MOUSE_X Mod char_WIDTH)
   f_mouse_pointer_Y = fCURRENT_MOUSE_Y - (fCURRENT_MOUSE_Y Mod char_HEIGHT)
   
   picSCREEN.Line (f_mouse_pointer_X, f_mouse_pointer_Y)-(f_mouse_pointer_X + char_WIDTH - 1, f_mouse_pointer_Y + char_HEIGHT - 1), mouse_pointer_color, BF

   f_mouse_pointer_X_PREV = f_mouse_pointer_X
   f_mouse_pointer_Y_PREV = f_mouse_pointer_Y


   mouse_pointer_shown = True

   picSCREEN.DrawMode = prevDrawMode
   


Exit Sub
err1:
Debug.Print "smp: " & Err.Description
' jic:
picSCREEN.DrawMode = prevDrawMode


End Sub

Public Sub hide_mouse_pointer()
On Error GoTo err1


    
   If mouse_pointer_shown Then ' is it really shown?
        
        Dim prevDrawMode As Integer
        prevDrawMode = picSCREEN.DrawMode
        
        picSCREEN.DrawMode = vbXorPen
        
        ' clear previous location
        picSCREEN.Line (f_mouse_pointer_X_PREV, f_mouse_pointer_Y_PREV)-(f_mouse_pointer_X_PREV + char_WIDTH - 1, f_mouse_pointer_Y_PREV + char_HEIGHT - 1), mouse_pointer_color, BF
        
        picSCREEN.DrawMode = prevDrawMode
        
   End If
    


   mouse_pointer_shown = False

    


Exit Sub
err1:
Debug.Print "hmp: " & Err.Description
End Sub


'INT 10 - VIDEO - GET CURRENT VIDEO MODE
'   AH = 0Fh
'Return: AH = number of character columns
'   AL = display mode (see #00010 at AH=00h)
'   BH = active page (see AH=05h)
'Notes: if mode was set with bit 7 set ("no blanking"), the returned mode will
'     also have bit 7 set
'   EGA, VGA, and UltraVision return either AL=03h (color) or AL=07h
'     (monochrome) in all extended-row text modes
'   HP 200LX returns AL=07h (monochrome) if mode was set to AL=21h
'     and always 80 resp. 40 columns in all text modes regardless of
'     current zoom setting (see AH=D0h)
'   when using a Hercules Graphics Card, additional checks are necessary:
'       mode 05h: if WORD 0040h:0063h is 03B4h, may be in graphics page 1
'         (as set by DOSSHELL and other Microsoft software)
'       mode 06h: if WORD 0040h:0063h is 03B4h, may be in graphics page 0
'         (as set by DOSSHELL and other Microsoft software)
'       mode 07h: if BYTE 0040h:0065h bit 1 is set, Hercules card is in
'         graphics mode, with bit 7 indicating the page (mode set by
'         Hercules driver for Borland Turbo C)
'   the Tandy 2000 BIOS is only documented as returning AL, not AH or BH
'SeeAlso: AH=00h,AH=05h,AX=10F2h,AX=1130h,AX=CD04h,MEM 0040h:004Ah
Public Function INT_10h_0Fh()
On Error Resume Next
    Dim byte1 As Byte



    frmEmulation.set_AL byteCURRENT_VIDEO_MODE
        
    
    'MEM 0040h:0062h - VIDEO - CURRENT PAGE NUMBER
    'Size:   BYTE
    byte1 = RAM.mREAD_BYTE(&H462) ' 1122
    frmEmulation.set_BH byte1


End Function

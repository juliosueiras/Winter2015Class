VERSION 5.00
Begin VB.Form frmMemory 
   BackColor       =   &H80000005&
   Caption         =   "Random Access Memory"
   ClientHeight    =   2400
   ClientLeft      =   75
   ClientTop       =   360
   ClientWidth     =   8115
   BeginProperty Font 
      Name            =   "Terminal"
      Size            =   9
      Charset         =   255
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMemory.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   2400
   ScaleWidth      =   8115
   Begin VB.PictureBox picMemView 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1545
      Left            =   90
      ScaleHeight     =   103
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   358
      TabIndex        =   5
      Top             =   600
      Width           =   5370
      Begin VB.TextBox txtMicroEdit 
         BorderStyle     =   0  'None
         Height          =   330
         HideSelection   =   0   'False
         Left            =   2775
         MaxLength       =   2
         TabIndex        =   7
         Text            =   "00"
         Top             =   1005
         Visible         =   0   'False
         Width           =   570
      End
   End
   Begin VB.OptionButton optList 
      BackColor       =   &H80000005&
      Caption         =   "list"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   270
      Left            =   5115
      TabIndex        =   4
      Top             =   60
      Width           =   1095
   End
   Begin VB.OptionButton optTable 
      BackColor       =   &H80000005&
      Caption         =   "table"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   270
      Left            =   3825
      TabIndex        =   3
      Top             =   60
      Value           =   -1  'True
      Width           =   1095
   End
   Begin VB.TextBox txtMemoryAddr 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   150
      TabIndex        =   2
      Text            =   "0000:0000"
      Top             =   75
      Width           =   1620
   End
   Begin VB.CommandButton cmdShowMemory 
      Caption         =   "update"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   1905
      TabIndex        =   1
      ToolTipText     =   "update memory viewer"
      Top             =   30
      Width           =   1710
   End
   Begin VB.ListBox lstMemory 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00C00000&
      Height          =   1710
      IntegralHeight  =   0   'False
      ItemData        =   "frmMemory.frx":0D4A
      Left            =   105
      List            =   "frmMemory.frx":0D4C
      TabIndex        =   0
      Top             =   600
      Visible         =   0   'False
      Width           =   3900
   End
   Begin VB.Label lblCurrentAddr 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   " 00000 "
      ForeColor       =   &H80000008&
      Height          =   210
      Left            =   7530
      TabIndex        =   6
      Top             =   60
      Width           =   570
   End
   Begin VB.Shape shapeBorder 
      Height          =   1860
      Left            =   60
      Top             =   465
      Width           =   6270
   End
End
Attribute VB_Name = "frmMemory"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' BOTH VIEWS (TABLE AND LIST) ARE LIMITED TO 128 bytes!




' 2.05#550

Option Explicit

Dim lMemoryListSegment_frmMemory As Long
Dim lMemoryListOffset_frmMemory As Long

Dim startADDRESS As Long


Dim lBlueBox_X As Long
Dim lBlueBox_Y As Long
Dim lBlueBoxAddr As Long
Dim bSECOND_DIGIT As Boolean

Dim B_NO_RESET As Boolean

Public Sub EMITATE_ShowMemory_Click()
On Error Resume Next ' 4.00-Beta-3
    cmdShowMemory_Click
End Sub
    
    


' code copied from frmEmulation !!!!
' but modified!
Private Sub cmdShowMemory_Click()

On Error GoTo err_smc

    Dim i As Long
    Dim b As Byte
    Dim s As String
    

    Dim lSEGMENT As Long
    Dim lOFFSET As Long
    
    Dim k As Integer ' 2.10
    


    ' #400B5-NEW-INPUT#
    ' MAKE IT THINK ABOUT PHYSICAL ADDRESS WHEN 5 DIGITS WITHOUT DOT ARE ENTERED.
    txtMemoryAddr.Text = Trim(txtMemoryAddr.Text)
    If Len(txtMemoryAddr.Text) >= 5 And InStr(1, txtMemoryAddr.Text, " ") <= 0 Then
        If only_hex_digits(txtMemoryAddr.Text) Then
            startADDRESS = Val("&H" & txtMemoryAddr.Text)
            GetSegmentOffset_FromPhysical startADDRESS, frmEmulation.get_CS, lSEGMENT, lOFFSET
            GoTo got_it
        End If
    End If
    



    lSEGMENT = get_segment_address_from_hex_ea(txtMemoryAddr.Text)
    lOFFSET = get_offset_address_from_hex_ea(txtMemoryAddr.Text)


    ' two text boxes are used, one for segment, another for offset:
    startADDRESS = lSEGMENT * &H10 + lOFFSET
   
   
   
got_it:
    ' #400-additional-frmMemory#
    If optTable.Value = True Then
        showMemoryTable lSEGMENT, lOFFSET, startADDRESS
        Exit Sub
    End If
   
   
    
    
   
   
    lMemoryListSegment_frmMemory = lSEGMENT
    lMemoryListOffset_frmMemory = lOFFSET
    
    
    
    ' #400b6-BUG110#
    If startADDRESS + 128 > MAX_MEMORY Then
        For i = 1 To 128
            lstMemory.List(k) = ""
        Next i
        Exit Sub
    End If




    k = 0
    
    ' #327t-memlist2code# '  ' only 1k is shown - it will take a lot of time to show whole 1MB (and list box can only show 32k)!
    ' #327t-memlist2code# - now we show only 64 bytes by default.
    ' #327t-memlist2code# ' For i = startADDRESS To startADDRESS + limitADR
    '#400-dissasembly#  For i = startADDRESS To startADDRESS + dis_Bytes_to_Disassemble
     For i = startADDRESS To startADDRESS + 128
     
        b = RAM.mREAD_BYTE(i)
        '2.10 lstMemory.AddItem make_min_len(Hex(lSegment), 4, "0") & ":" & make_min_len(Hex(lOffset), 4, "0") & ":  " & make_min_len(Hex(b), 2, "0") & "  " & make_min_len(CStr(b), 3, "0") & "  " & mCHR(b)
       
        s = make_min_len(Hex(lSEGMENT), 4, "0") & ":" & make_min_len(Hex(lOFFSET), 4, "0") & ":  " & byteHEX(b) & "  " & byteDEC(b) & "  " & byteChar(b)


        If lstMemory.List(k) <> s Then
            lstMemory.List(k) = s
        End If
        lOFFSET = lOFFSET + 1 ' 1.15
        
        k = k + 1
        
        ' Memory list should not show offset over FFFF!
        If lOFFSET > 65535 Then
            Exit For
        End If
        
    Next i

    ' hor. scroll should be added
    ' after filling the list:
    AddHorizontalScroll lstMemory
    
    
    Exit Sub
err_smc:
    Debug.Print "Error on cmdShowMemory_Click: " & LCase(Err.Description)

End Sub



Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next ' 4.00-Beta-3
    ' 4.00
    frmEmulation.process_HotKey KeyCode, Shift
End Sub



' #400b4-mini-8#
Private Sub Form_Activate()
On Error Resume Next
    If SHOULD_DO_MINI_FIX_8 Then
        If StrComp(picMemView.Font.Name, "Terminal", vbTextCompare) = 0 Then
        
            ' here's it's optional cause font size and name are copied from frmEmulation.
            If lstMemory.Font.Size < 12 Then
                Me.Font.Size = 12
                picMemView.Font.Size = 12
                lstMemory.Font.Size = 12
                set_table_size_according_to_font
                cmdShowMemory_Click
            End If
            
            ' 4.00-Beta-5
            If lblCurrentAddr.Font.Size < 12 Then
                lblCurrentAddr.Font.Size = 12
            End If
            
        End If
    End If
End Sub


Private Sub Form_Load()

On Error Resume Next ' 4.00b24

   If Load_from_Lang_File(Me) Then Exit Sub
    
  
            
            
    
    
    GetWindowPos Me
    GetWindowSize Me '#400b2--auto-font# , 10075, 3280
    
    
    

    
    
    ' Me.Icon = frmMain.Icon
    
    
    lstMemory.BackColor = SystemColorConstants.vbWindowBackground  'frmEmulation.picMemList.BackColor
    lstMemory.ForeColor = SystemColorConstants.vbWindowText   ' frmEmulation.picMemList.ForeColor
    
    
    lstMemory.FontName = frmEmulation.picMemList.FontName
    lstMemory.FontSize = frmEmulation.picMemList.FontSize
    lstMemory.FontBold = frmEmulation.picMemList.FontBold
    
    picMemView.FontName = frmEmulation.picMemList.FontName
    picMemView.FontSize = frmEmulation.picMemList.FontSize
    picMemView.FontBold = frmEmulation.picMemList.FontBold
    
    
    set_table_size_according_to_font
    
    
    cmdShowMemory_Click
    
    b_LOADED_frmMemory = True
End Sub

Public Sub Update_List_or_Table()
On Error GoTo err1
    Dim t As Integer
    
    
    If optList.Value = True Then  ' #400b5-sb-4e-4f#
        ' just for a nicer look:
        t = lstMemory.ListIndex
    End If
        
        
    cmdShowMemory_Click
    
    
    
    If optList.Value = True Then  ' #400b5-sb-4e-4f#
        lstMemory.ListIndex = t
    End If
    
    
    Exit Sub
err1:
    Debug.Print "Error on frmMemory.Update_list: " & LCase(Err.Description)
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
On Error Resume Next ' 4.00-Beta-3
    b_LOADED_frmMemory = False
End Sub

Private Sub Form_Resize()
    On Error GoTo err_r
    
    lstMemory.Width = Me.ScaleWidth - lstMemory.Left * 2
    lstMemory.Height = Me.ScaleHeight - lstMemory.Top - 100
    
    
    picMemView.Top = lstMemory.Top + 100
    picMemView.Left = lstMemory.Left + 100
    picMemView.Width = lstMemory.Width - 100 * 2
    picMemView.Height = lstMemory.Height - 100 * 2
    
    shapeBorder.Top = picMemView.Top - 100
    shapeBorder.Left = picMemView.Left - 100
    shapeBorder.Width = picMemView.Width + 100 * 2
    shapeBorder.Height = picMemView.Height + 100 * 2
    
    
    Exit Sub
err_r:
    Debug.Print "error on resize frmMemory: " & LCase(Err.Description)
    Resume Next
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next ' 4.00b24
    SaveWindowState Me ' 2.05#551
End Sub

Private Sub lstMemory_DblClick()
    On Error GoTo err_dblclk_mem
     
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.txtMemSegment.Text = make_min_len(Hex(to_signed_int(lMemoryListSegment_frmMemory)), 4, "0")
    frmExtendedViewer.txtMemOffset.Text = make_min_len(Hex(to_signed_int(to_unsigned_long(lstMemory.ListIndex) + lMemoryListOffset_frmMemory)), 4, "0")
          
    Exit Sub
     
err_dblclk_mem:
    Debug.Print "Error lstMemory_DblClick(): " & LCase(Err.Description)
     
End Sub


Private Sub txtMemSegment_KeyPress(KeyAscii As Integer)
On Error Resume Next ' 4.00-Beta-3
    If KeyAscii = 13 Then
        KeyAscii = 0
        cmdShowMemory_Click
    End If
End Sub

Public Sub DoShowMe()
On Error Resume Next '3.27xm
    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
End Sub


Private Sub optList_Click()
On Error Resume Next ' 4.00-Beta-3
    set_list_or_table
End Sub

Private Sub optTable_Click()
On Error Resume Next ' 4.00-Beta-3
    set_list_or_table
End Sub





Private Sub picMemView_DblClick()
On Error GoTo err1

    If lblCurrentAddr.Visible = True Then

        frmExtendedViewer.DoShowMe
        frmExtendedViewer.txtMemSegment.Text = make_min_len(Hex(to_signed_int(Fix(Val("&H" & lblCurrentAddr.Caption) / 16))), 4, "0")
        frmExtendedViewer.txtMemOffset.Text = make_min_len(Hex(to_signed_int(Fix(Val("&H" & lblCurrentAddr.Caption) Mod 16))), 4, "0")

    End If
    
Exit Sub

err1:
Debug.Print "err: 1223:" & Err.Description
End Sub



Private Sub picMemView_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo err1

    ' Debug.Print "KC:" & KeyCode

    Select Case KeyCode
        Case 37 ' left
            If lBlueBox_X > 11 Then
                lBlueBox_X = lBlueBox_X - 3
                lBlueBoxAddr = lBlueBoxAddr - 1
            End If
        Case 38  'up
            If lBlueBox_Y > 0 Then
                lBlueBox_Y = lBlueBox_Y - 1
                lBlueBoxAddr = lBlueBoxAddr - 16
            End If
            
        Case 39 ' right
            If lBlueBox_X < 56 Then
                lBlueBox_X = lBlueBox_X + 3
                lBlueBoxAddr = lBlueBoxAddr + 1
            End If
            
        Case 40 'down
            If lBlueBox_Y < 7 Then
                lBlueBox_Y = lBlueBox_Y + 1
                lBlueBoxAddr = lBlueBoxAddr + 16
            End If
            
        Case Else
            Exit Sub ' ingnore.
    End Select
    
    B_NO_RESET = True
    cmdShowMemory_Click  ' show clean dump (without any previous selection)
    B_NO_RESET = False
    show_blue_box lBlueBox_X, lBlueBox_Y, lBlueBoxAddr
    lblCurrentAddr.Caption = " " & make_min_len(Hex(lBlueBoxAddr), 5, "0") & " "  ' #400-new-mem-viewer-bug#
    
    Exit Sub
err1:
    Debug.Print "errkd: " & Err.Description
End Sub

Private Sub picMemView_KeyPress(KeyAscii As Integer)
On Error GoTo err1

   ' Debug.Print "KP:" & KeyAscii
     

    
    
    
    If lblCurrentAddr.Visible Then
    
        Dim b As Byte
    
        If Not bSECOND_DIGIT Then
            ' first digit...
            b = RAM.mREAD_BYTE(lBlueBoxAddr)
            b = b And &HF
            b = b Or Val("&H" & Chr(KeyAscii)) * 16
            RAM.mWRITE_BYTE lBlueBoxAddr, b
            bSECOND_DIGIT = True
            show_blue_box lBlueBox_X, lBlueBox_Y, lBlueBoxAddr
        Else
            ' second digit....
            b = RAM.mREAD_BYTE(lBlueBoxAddr)
            b = b And &HF0
            b = b Or Val("&H" & Chr(KeyAscii))
            RAM.mWRITE_BYTE lBlueBoxAddr, b
            bSECOND_DIGIT = False
            
            
            B_NO_RESET = True
            cmdShowMemory_Click  ' show clean dump (without any previous selection)
            B_NO_RESET = False
            ' advance blue box... and pointer...
            lBlueBox_X = lBlueBox_X + 3
            If lBlueBox_X >= 57 Then
                lBlueBox_X = 11
                lBlueBox_Y = lBlueBox_Y + 1
                If lBlueBox_Y >= 8 Then
                    Dim lSEGMENT As Long
                    Dim lOFFSET As Long
                    ' returns result by REF!
                    GetSegmentOffset_FromPhysical lBlueBoxAddr + 1, getSEGMENT_from_HEX_STRING(txtMemoryAddr.Text), lSEGMENT, lOFFSET
                    txtMemoryAddr.Text = eaHex(lSEGMENT, lOFFSET)
                    B_NO_RESET = True
                    showMemoryTable lSEGMENT, lOFFSET, lBlueBoxAddr + 1
                    B_NO_RESET = False
                    lBlueBox_X = 11
                    lBlueBox_Y = 0
                End If
            End If
            lBlueBoxAddr = lBlueBoxAddr + 1
            show_blue_box lBlueBox_X, lBlueBox_Y, lBlueBoxAddr
            lblCurrentAddr.Caption = " " & make_min_len(Hex(lBlueBoxAddr), 5, "0") & " "  ' #400-new-mem-viewer-bug#
        End If




    End If

    Exit Sub
err1:
    Debug.Print "err kp:" & Err.Description
End Sub

Private Sub txtMemoryAddr_GotFocus()
On Error Resume Next

    ' copied!
    

    With txtMemoryAddr
        
        Dim L As Long
        L = InStr(1, .Text, ":")
        
        If L > 0 Then
            If .SelStart > L Then
                .SelStart = L
                .SelLength = Len(.Text) - L
            Else
                .SelStart = 0
                .SelLength = L - 1
            End If
        Else
            .SelStart = 0
            DoEvents
            .SelLength = Len(.Text)
        End If
        
    End With
End Sub

Private Sub txtMemoryAddr_KeyPress(KeyAscii As Integer)
On Error Resume Next ' 4.00-Beta-3
    If KeyAscii = 13 Then
        KeyAscii = 0
        cmdShowMemory_Click
    End If
End Sub


' #400-additional-frmMemory#
Private Sub showMemoryTable(ByVal lSEGMENT As Long, ByVal lOFFSET As Long, ByVal lPhysicalAddr As Long)
On Error GoTo err1

    set_table_size_according_to_font

    Dim s As String


    ' #400b6-BUG110#
    If lPhysicalAddr + 128 > MAX_MEMORY Then
        picMemView.Cls
        picMemView.ForeColor = SystemColorConstants.vbWindowText    ' vbBlack
        picMemView.Print "out of memory"
        Exit Sub
    End If


    ' modifies parameters! (maynot be used here)
    s = get_MEMORY_DUMP_BYREF(lSEGMENT, lOFFSET, lPhysicalAddr, 128)

    picMemView.Cls
    picMemView.ForeColor = SystemColorConstants.vbWindowText  ' vbBlack
    picMemView.Print s

    If Not B_NO_RESET Then
        lblCurrentAddr.Visible = False  ' selector not visible
        lblCurrentAddr.Caption = " "
    End If
    
Exit Sub
err1:
    Debug.Print "errSMT:" & Err.Description
End Sub


Sub set_list_or_table()

On Error GoTo err1

    If optList.Value = True Then
        lstMemory.Visible = True
        picMemView.Visible = False
        shapeBorder.Visible = False
        lblCurrentAddr.Visible = False
    Else
        lstMemory.Visible = False
        picMemView.Visible = True
        shapeBorder.Visible = True
        ' becomes visible on click only ' lblCurrentAddr.Visible =True
        
        set_table_size_according_to_font

        
    End If
    
    
    Update_List_or_Table ' #400b5-sb-4e-4f#
    
    
    Exit Sub
err1:
    Debug.Print "setlist:" & Err.Description
    
End Sub

' #400b2--auto-size-mem#
Sub set_table_size_according_to_font()
On Error GoTo err1
        
        DoEvents
        
        Dim fTT As Single
        fTT = picMemView.TextWidth("0050:0000  00 00 00 00 00 00 00 00-00 00 00 00 00 00 00 00    ................  ")
        If picMemView.ScaleWidth < fTT Then
            Me.Width = fTT * Screen.TwipsPerPixelX + shapeBorder.Left * 2 + 100
        End If
        
        DoEvents
        
        fTT = (picMemView.TextHeight("0000:0000") + 5) * 8        ' we have 8 lines, and there's about 5 pixel margin above and below text
        If picMemView.ScaleHeight < fTT Then
            Me.Height = fTT * Screen.TwipsPerPixelY + picMemView.Top + 100
        End If
        
        DoEvents
        
    Exit Sub
err1:
    Debug.Print "setlist:" & Err.Description
End Sub

Private Sub picMemView_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error GoTo err1


    cmdShowMemory_Click  ' show clean dump (without any previous selection).
    


    ' integrity check: must use fixed fonts:
    If picMemView.TextWidth("F") <> picMemView.TextWidth("W") Then
        Exit Sub
    End If
    If picMemView.TextHeight("F") <> picMemView.TextHeight("W") Then
        Exit Sub
    End If
    
    
    
    
    
    Dim fW As Single
    Dim fH As Single
    

    fW = picMemView.TextWidth("0")
    fH = picMemView.TextHeight("0")
    
    Dim iLEFT As Long
    Dim iTOP As Long
    iLEFT = Fix(X / fW)
    iTOP = Fix(Y / fH)
    
    ' Debug.Print "XY: "; iLEFT; iTOP
        
    
    ' hex starts from 11:0
    ' each hex byte is 2 chars then space.
    If iLEFT >= 11 And iLEFT <= 57 Then
        If iTOP >= 0 And iTOP <= 7 Then
            ' HEX!

            Dim lRUNNER As Long
            Dim lRUNNER_LF As Long  ' from left to right
            Dim lRUNNER_TB As Long  ' from top to bottom
            lRUNNER = 0
                For lRUNNER_TB = 0 To 7 Step 1
                    For lRUNNER_LF = 11 To 57 Step 3
                        If lRUNNER_LF = iLEFT Or lRUNNER_LF + 1 = iLEFT Then ' 2 digits - any digit is ok.
                            If lRUNNER_TB = iTOP Then
                                ' Debug.Print "MATCH:"; lRUNNER_LF; lRUNNER_TB
                                lblCurrentAddr.Visible = True
                                lblCurrentAddr.Caption = " " & make_min_len(Hex(startADDRESS + lRUNNER), 5, "0") & " "   ' #400-new-mem-viewer-bug#
                                show_blue_box lRUNNER_LF, lRUNNER_TB, startADDRESS + lRUNNER
                                bSECOND_DIGIT = False
                                Exit Sub
                            End If
                        End If
                        lRUNNER = lRUNNER + 1
                     Next lRUNNER_LF
                Next lRUNNER_TB
               
            
            
            lblCurrentAddr.Visible = False
            lblCurrentAddr.Caption = " "
            bSECOND_DIGIT = False
            
        End If
    End If
    
    
    
    
    Exit Sub
err1:
    Debug.Print "err picMemView_MouseDown: " & Err.Description
End Sub


Sub show_blue_box(lLeft As Long, lTop As Long, lADDRESS As Long)
On Error GoTo err1

    Dim fW As Single
    Dim fH As Single
    
    fW = picMemView.TextWidth("0")
    fH = picMemView.TextHeight("0")
    
    Dim iW As Long
    Dim iH As Long
    iW = Fix(fW)
    iH = Fix(fH)
    
    
    
    Dim fX As Single
    Dim fY As Single
    Dim fXE As Single
    Dim fYE As Single
    
    fX = lLeft * iW
    fXE = lLeft * iW + iW * 2
    fY = lTop * iH
    fYE = lTop * iH + iH
    picMemView.Line (fX - 2, fY - 1)-(fXE, fYE - 1), BLUE_SELECTOR, BF
    
    Dim b As Byte
    b = RAM.mREAD_BYTE(lADDRESS)
    lBlueBoxAddr = lADDRESS
    lBlueBox_X = lLeft
    lBlueBox_Y = lTop
    
    picMemView.ForeColor = vbWhite
    picMemView.CurrentX = fX
    picMemView.CurrentY = fY
    picMemView.Print byteHEX(b)
    
    
' but no... I better do it myself :)
''''    ' in addition to blue box with show micro edit :)
''''    ' so the blue box is really very optional...
''''    txtMicroEdit.Text = byteHEX(b)
''''    txtMicroEdit.FontName = picMemView.FontName
''''    txtMicroEdit.FontSize = picMemView.FontSize
''''    txtMicroEdit.FontBold = picMemView.FontBold
''''    txtMicroEdit.Width = iW * 2
''''    txtMicroEdit.Height = iH
''''    txtMicroEdit.Left = fX - 2
''''    txtMicroEdit.Top = fY - 1
''''    txtMicroEdit.Visible = True
''''    txtMicroEdit.SelStart = 0
''''    txtMicroEdit.SelLength = 2
''''    DoEvents
    
    
    
Exit Sub
err1:
    Debug.Print "show_blue_box : " & Err.Description
End Sub

'Private Sub txtMicroEdit_DblClick()
''    picMemView_DblClick
'End Sub

Function eaHex(lSEGMENT As Long, lOFFSET As Long) As String
    On Error GoTo err1
    eaHex = make_min_len(Hex(lSEGMENT), 4, "0") & ":" & make_min_len(Hex(lOFFSET), 4, "0")
    Exit Function
err1:
    eaHex = "0000:0000"
    Debug.Print "eaHex:" & Err.Description
End Function


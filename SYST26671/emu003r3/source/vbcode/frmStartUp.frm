VERSION 5.00
Begin VB.Form frmStartUp 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "launching..."
   ClientHeight    =   2475
   ClientLeft      =   2340
   ClientTop       =   1890
   ClientWidth     =   9120
   ClipControls    =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmStartUp.frx":0000
   LinkTopic       =   "Form2"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   OLEDropMode     =   1  'Manual
   ScaleHeight     =   2475
   ScaleWidth      =   9120
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdSamples 
      Caption         =   "code examples"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   810
      Left            =   2368
      OLEDropMode     =   1  'Manual
      Picture         =   "frmStartUp.frx":038A
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   1230
      UseMaskColor    =   -1  'True
      Width           =   2130
   End
   Begin VB.CommandButton cmdTutorials 
      Caption         =   "quick start tutor"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   810
      Left            =   4623
      OLEDropMode     =   1  'Manual
      Picture         =   "frmStartUp.frx":08CC
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   1230
      UseMaskColor    =   -1  'True
      Width           =   2130
   End
   Begin VB.CommandButton cmdRecent 
      Caption         =   "recent files"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   810
      Left            =   6878
      OLEDropMode     =   1  'Manual
      Picture         =   "frmStartUp.frx":0E0E
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   1230
      UseMaskColor    =   -1  'True
      Width           =   2130
   End
   Begin VB.Frame fraRegisteredTo 
      Caption         =   " this product is registered to: "
      BeginProperty Font 
         Name            =   "Microsoft Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   900
      OLEDropMode     =   1  'Manual
      TabIndex        =   10
      Top             =   2190
      Visible         =   0   'False
      Width           =   7320
      Begin VB.Label lblLicNumber 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "                                                                               "
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   30
         OLEDropMode     =   1  'Manual
         TabIndex        =   12
         Top             =   660
         Visible         =   0   'False
         Width           =   7200
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "                                                                                            "
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   11.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   270
         Left            =   210
         OLEDropMode     =   1  'Manual
         TabIndex        =   11
         Top             =   270
         Visible         =   0   'False
         Width           =   6915
      End
   End
   Begin VB.CommandButton cmdNew 
      Caption         =   "new"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   810
      Left            =   113
      OLEDropMode     =   1  'Manual
      Picture         =   "frmStartUp.frx":1340
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   1230
      UseMaskColor    =   -1  'True
      Width           =   2130
   End
   Begin VB.CommandButton cmdEnterRegKey 
      BackColor       =   &H0000FFFF&
      Caption         =   "PLEASE  ENTER  THE  REGISTRATION  KEY..."
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   630
      Left            =   1500
      OLEDropMode     =   1  'Manual
      TabIndex        =   0
      Top             =   2430
      Visible         =   0   'False
      Width           =   6120
   End
   Begin VB.PictureBox picIcon 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
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
      Height          =   480
      Left            =   6765
      OLEDropMode     =   1  'Manual
      Picture         =   "frmStartUp.frx":1872
      ScaleHeight     =   337.12
      ScaleMode       =   0  'User
      ScaleWidth      =   337.12
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   45
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   1650
      OLEDropMode     =   1  'Manual
      Picture         =   "frmStartUp.frx":1B7C
      Top             =   45
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Label lbl_URL_OR_EMAIL 
      AutoSize        =   -1  'True
      BackColor       =   &H0080FFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "                                              "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   1050
      MouseIcon       =   "frmStartUp.frx":1C32
      MousePointer    =   99  'Custom
      TabIndex        =   9
      Top             =   3720
      Width           =   2760
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   1
      Visible         =   0   'False
      X1              =   120
      X2              =   8760
      Y1              =   1140
      Y2              =   1140
   End
   Begin VB.Label lblDescription 
      Alignment       =   2  'Center
      Caption         =   "microprocessor emulator with integrated assembler"
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   285
      Left            =   75
      OLEDropMode     =   1  'Manual
      TabIndex        =   6
      Top             =   600
      Width           =   8850
   End
   Begin VB.Label lblTitle 
      Alignment       =   2  'Center
      Caption         =   "Application Title"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   495
      Left            =   1350
      OLEDropMode     =   1  'Manual
      TabIndex        =   7
      Top             =   75
      Width           =   6150
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      Index           =   0
      Visible         =   0   'False
      X1              =   105
      X2              =   8775
      Y1              =   1155
      Y2              =   1140
   End
   Begin VB.Label lblVersion 
      Alignment       =   2  'Center
      Caption         =   "version"
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   9
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   728
      OLEDropMode     =   1  'Manual
      TabIndex        =   8
      Top             =   900
      Width           =   7665
   End
   Begin VB.Menu mnuX 
      Caption         =   "mnuX"
      Visible         =   0   'False
      Begin VB.Menu mnuRecent 
         Caption         =   "Recent 1"
         Index           =   1
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   "Recent 2"
         Index           =   2
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   "Recent 3"
         Index           =   3
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   "Recent 4"
         Index           =   4
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   5
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   6
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   7
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   8
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   9
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   10
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   11
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   12
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   13
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   14
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   15
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   16
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   17
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   18
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   19
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   20
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   21
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   22
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   23
         Visible         =   0   'False
      End
      Begin VB.Menu mnuOtherFiles 
         Caption         =   "other files..."
      End
      Begin VB.Menu mnu_nothing 
         Caption         =   "-"
      End
   End
End
Attribute VB_Name = "frmStartUp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'



Option Explicit

 ' #327u-startup# '
''''Private Sub chkShowMeNextTime_Click()
''''    If chkShowMeNextTime.Value = 1 Then
''''        SaveSetting sTitleA, "OTHER", "STARTUPWIN", "YES"
''''    Else
''''        SaveSetting sTitleA, "OTHER", "STARTUPWIN", "NO"
''''    End If
''''End Sub
 ' #327u-startup# '
'Private Sub chkShowMeNextTime_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
'    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
'End Sub

'Private Sub cmdEnterRegKey_Click()
'On Error Resume Next
'    ' 2007-10-29
'    If bNO_UNLOCK Then
'        open_HTML_FILE Me, gRegFILE
'    Else
'        frmRegister.Show vbModal, Me
'        Me.Hide
'    End If
'End Sub

Private Sub cmdEnterRegKey_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub cmdNew_Click()

On Error GoTo err1

    Me.Hide
    
    frmMain.cmdNew_Click_PUBLIC
    
    Exit Sub
err1:
    Debug.Print "frmStartUp.cmdNew_Click: " & LCase(Err.Description)
End Sub





Private Sub cmdRecent_Click()
On Error Resume Next
    PopupMenu mnuX
End Sub

'Private Sub cmdOK_Click()
'On Error GoTo err1
'
'  Me.Hide
'
'  frmMain.SetFocus
'
'Exit Sub
'err1:
'    Debug.Print "Error nicestartup.cmdOK_Click: " & LCase(err.Description)
'End Sub


Private Sub cmdRecent_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub cmdSamples_Click()
On Error Resume Next
    PopupMenu frmMain.mnuSamples
    
End Sub


Private Sub cmdSamples_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub cmdTutorials_Click()
On Error Resume Next
    open_HTML_FILE Me, "start.html"
End Sub


Private Sub cmdTutorials_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub Form_Load()

On Error Resume Next


    If Load_from_Lang_File(Me) Then Exit Sub
    
    Me.Caption = "welcome..." 'App.Title & " - Assembler and 8086/8088 Microprocessor Emulator"
    lblVersion.Caption = "version " & App.Major & "." & App.Minor & App.Revision & sVER_SFX
    lblTitle.Caption = App.Title
    
    lblVersion.Left = -lblVersion.Width / 2 + Me.ScaleWidth / 2
    lblTitle.Left = -lblTitle.Width / 2 + Me.ScaleWidth / 2
        
    ' Me.Icon = frmMain.Icon 'yur
           
    show_Registered_To
           
    
    Recent_Set_Menus mnuRecent, sRECENT_EDITOR
    '#1046' cmdRecent.Enabled = mnuRecent(1).Visible
    

    lbl_URL_OR_EMAIL.Caption = sSTARTUP_LINK
    lbl_URL_OR_EMAIL.Left = Me.ScaleWidth / 2 - lbl_URL_OR_EMAIL.Width / 2
    
    
    ' 2007-10-29
    If bNO_UNLOCK Then
        cmdEnterRegKey.Caption = "CLICK HERE TO BUY THIS SOFTWARE..."
    End If
    


End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
    If lbl_URL_OR_EMAIL.FontUnderline Then lbl_URL_OR_EMAIL.FontUnderline = False
End Sub





Private Sub Form_Resize()

On Error Resume Next

    lbl_URL_OR_EMAIL.Left = Me.ScaleWidth / 2 - lbl_URL_OR_EMAIL.Width / 2
    lbl_URL_OR_EMAIL.Top = Me.ScaleHeight - lbl_URL_OR_EMAIL.Height - 40
    
     ' #327u-startup# '   chkShowMeNextTime.Left = 10
     ' #327u-startup# '   chkShowMeNextTime.Top = Me.ScaleHeight - chkShowMeNextTime.Height
    
End Sub

Private Sub fraRegisteredTo_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub



Private Sub lblDescription_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub






Private Sub lblLicNumber_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub lblTitle_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub






Private Sub Form_Activate()

On Error Resume Next

    ' 1.23#252
    ' in case font is not as original, make sure
    ' the size of the labels will become regular
    ' before user moves mouse over:
    
    lbl_URL_OR_EMAIL.FontUnderline = True
    
    lbl_URL_OR_EMAIL.FontUnderline = False
    
    
End Sub

Private Sub lblUserName_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub lblVersion_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub mnuOtherFiles_Click()
    On Error GoTo err1
    Me.Hide
    frmMain.SetFocus
    frmMain.cmdLoad_Click_PUBLIC
    Exit Sub
err1:
    Debug.Print "error mnuOtherFiles: " & LCase(Err.Description)
End Sub

Private Sub mnuRecent_Click(Index As Integer)
On Error GoTo err1
    Me.Hide
    frmMain.SetFocus
    frmMain.mnuRecent_CLICK_from_NICE_STARTUP (Index)
    Exit Sub
err1:
    Debug.Print "error mnuRecent: " & LCase(Err.Description)
End Sub



Public Sub show_Registered_To()

On Error Resume Next

    If bREGISTERED Then

        lblUserName.Caption = sUSER_NAME
        
        

        If iLICENSE_COUNT = 200 Then
            lblLicNumber.Caption = cMT("Site License")
        ElseIf iLICENSE_COUNT = 60 Then
            lblLicNumber.Caption = cMT("1 Year Site License")
        Else
            lblLicNumber.Caption = ""
            lblUserName.Top = fraRegisteredTo.Height / 2 - lblUserName.Height / 2
        End If




        
        lblUserName.Visible = True
        lblLicNumber.Visible = True
        
        cmdEnterRegKey.Visible = False
                
        fraRegisteredTo.Visible = True
        
        Me.Height = 3777 ' make it bigger
       
'        '#v327p_ENIGMA
'        If check_possible_pirate(sUSER_NAME, sREGISTRATION_KEY, iLICENSE_COUNT) Then
'            lblUserName.Caption = Decrypt_PRO("au#s,!knS0X8TxL8gJDzpgR", "hgttg") ' "this software is a gift"
'            lblLicNumber.Caption = Decrypt_PRO("OWxdg""CSE\eDZx,Bg!p7U6", "hgttg") ' "hardware must be free!"
'        End If
       
    Else
    
        ' #327xl-softpass#
        If bSOFTWARE_PASSPORT Then Exit Sub
    

        If bFOR_REGNOW Or (Not bRUN_FREE_FOR_N_DAYS) Then
        
            cmdEnterRegKey.Visible = True
         ' #327u-startup# '    chkShowMeNextTime.Visible = False ' show only when cmdEnterKey is not visible!
                        
            Me.Height = 3777 ' make it bigger

        End If
        
    End If


    

End Sub











' ?? what was it? 3.27xn
''''Private Sub frameNeedRegKey_DragDrop(Source As Control, X As Single, Y As Single)
''''    cmdEnterRegKey_Click
''''End Sub

Private Sub Form_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)

    
    

On Error GoTo err_dd

    Me.Hide
    
If Data.GetFormat(vbCFFiles) Then
    
    If Data.Files.Count > 0 Then
        
        
        ' process like command line parameter:
        PROCESS_CMD_Line Data.Files.Item(1)
        
    End If
    
End If

Exit Sub
err_dd:
    Debug.Print "frmStartUp_OLEDragDrop: " & LCase(Err.Description)
    
    
End Sub

Private Sub cmdNew_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next ' 4.00-Beta-3
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub



Private Sub lbl_URL_OR_EMAIL_Click()
   
   On Error GoTo err1
   
   If InStr(1, sSTARTUP_LINK, "@") Then
        Call ShellExecute(Me.hwnd, "open", "mailto:" & sSTARTUP_LINK, "", App.Path, SW_SHOWDEFAULT)
   Else
        ' simpllle2005-04-20 ' StartNewBrowser (sSTARTUP_LINK)
        open_HTML_FILE Me, "http://" & sSTARTUP_LINK, True
   End If
   

   Exit Sub
   
err1:
   Debug.Print "lbl_URL_OR_EMAIL: " & LCase(Err.Description)
End Sub

Private Sub lbl_URL_OR_EMAIL_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
    If Not lbl_URL_OR_EMAIL.FontUnderline Then lbl_URL_OR_EMAIL.FontUnderline = True
End Sub


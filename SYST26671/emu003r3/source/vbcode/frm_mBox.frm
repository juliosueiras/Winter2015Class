VERSION 5.00
Begin VB.Form frm_mBox 
   Caption         =   "message"
   ClientHeight    =   2460
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5115
   Icon            =   "frm_mBox.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2460
   ScaleWidth      =   5115
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtMessage 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1800
      Left            =   45
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   15
      Width           =   4965
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Left            =   1995
      TabIndex        =   0
      Top             =   1890
      Width           =   1320
   End
End
Attribute VB_Name = "frm_mBox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' 

' 

'






Option Explicit

Private Sub cmdOK_Click()

On Error GoTo err_mbox_ok

    Dim sMsg As String ' 1.26#319
    
    sMsg = txtMessage.Text ' 1.26#319
    
    txtMessage.Text = ""
    Me.Hide
    

    If ACTIVATE_SCREEN_WHEN_STOPPED Then '3.27xp
        If (sMsg = cMT(sPROGRAM_TERMINATED) & vbNewLine) Or _
           (sMsg = cMT(sEMULATOR_HALTED) & vbNewLine) Then   '1.30#424
            If frmScreen.Visible = True Then
                If frmScreen.bFIRST_TIME_SHOW_SCREEN = False Then ' 1.30#425
                    frmScreen.DoShowMe ' activate!
                End If
                Exit Sub ' 1.26#319
            End If
        End If
    End If
    
    
    If startsWith(sMsg, cMT("break point encountered at:")) Then
        frmEmulation.DoShowMe
        Exit Sub ' 1.26#319
    End If


    
    ' 1.25#308
    If Not (mBox_owner Is Nothing) Then
        mBox_owner.Show
        
        ' 1.29
        If mBox_owner.WindowState = vbMinimized Then
            mBox_owner.WindowState = vbNormal
        End If
    End If
    
    
    Exit Sub
err_mbox_ok:
    Debug.Print "mBox_OK: " & LCase(err.Description)
End Sub

Private Sub Form_Activate()
On Error GoTo err1:
    txtMessage.RightToLeft = bRIGHT_TO_LEFT
err1:
    Exit Sub
Debug.Print "frm_Box_ACTIVEATE: err: " & LCase(err.Description)
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    
On Error GoTo err_kd
    
    If KeyCode = vbKeyEscape Then
        cmdOK_Click
        Exit Sub
    End If
    
    ' 1.25#289
    ' allow only reload from this message box:
    If KeyCode = vbKeyF4 Then
    
        frmEmulation.process_HotKey vbKeyF4, 0
        
        
        txtMessage.Text = ""
        Me.Hide
        
        ' I'm not sure why, frmScreen is always activated
        ' without this:
        frmEmulation.DoShowMe
    End If
    
    
    Exit Sub
err_kd:
    Debug.Print "frm_mBox_KeyDown: " & LCase(err.Description)
    
End Sub


Private Sub Form_Load()

On Error Resume Next

   If Load_from_Lang_File(Me) Then Exit Sub
    
    GetWindowSize Me, 5235, 2865 ' 2.05#551
    
    ' Me.Icon = frmMain.Icon
End Sub

Private Sub Form_Resize()
On Error GoTo err_resize

    cmdOK.Left = Me.ScaleWidth / 2 - cmdOK.Width / 2
    cmdOK.Top = Me.ScaleHeight - cmdOK.Height - 20 ' 2.01' 90
    
    txtMessage.Width = Me.ScaleWidth - txtMessage.Left * 2
    txtMessage.Height = Me.ScaleHeight - cmdOK.Height - (Me.ScaleHeight - cmdOK.Top - cmdOK.Height) - 90
    
    Exit Sub
err_resize:
    Debug.Print "Error on frm_mbox me, _resize-> " & LCase(err.Description)
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
    SaveWindowState Me ' 2.05#551
End Sub

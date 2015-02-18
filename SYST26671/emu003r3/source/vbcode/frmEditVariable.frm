VERSION 5.00
Begin VB.Form frmEditVariable 
   Caption         =   " edit variable or buffer"
   ClientHeight    =   1095
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9645
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   11.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmEditVariable.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1095
   ScaleWidth      =   9645
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdCancel 
      Caption         =   "cancel"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   4770
      TabIndex        =   2
      Top             =   615
      Width           =   1935
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   2625
      TabIndex        =   1
      Top             =   615
      Width           =   1905
   End
   Begin VB.TextBox txtValue 
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   12
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   30
      TabIndex        =   0
      Top             =   45
      Width           =   9345
   End
End
Attribute VB_Name = "frmEditVariable"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' 

' 

'





Option Explicit

Public sValue As String

Public Sub setValue(s As String)

    On Error GoTo err1
    
    sValue = s
    txtValue.Text = s
    txtValue.SelStart = 0
    
    If InStr(1, s, ",") > 0 Then ' #1158
        ' don't select all when array (especially if a very long one).
    Else
        txtValue.SelLength = Len(txtValue.Text)
    End If
    
    Exit Sub
err1:
    Debug.Print "frmEditVariable.setValue: " & LCase(err.Description)
    
End Sub

Private Sub cmdOK_Click()
On Error Resume Next ' 4.00-Beta-3
    txtValue.Text = Trim(txtValue.Text)
    sValue = txtValue.Text
    Me.Hide
End Sub

Private Sub Form_Activate()
On Error GoTo err_fa
    txtValue.SetFocus
    Exit Sub
err_fa:
    Debug.Print "frmEditVariable: txtValue.SetFocus: " & LCase(err.Description)
End Sub

' 2.05
Private Sub Form_KeyPress(KeyAscii As Integer)
On Error Resume Next ' 4.00-Beta-3
    If KeyAscii = vbKeyEscape Then
        cmdCancel_Click
    End If
End Sub

Private Sub Form_Load()

On Error Resume Next ' 4.00-Beta-3

   If Load_from_Lang_File(Me) Then Exit Sub
    
    GetWindowSize Me, 9770, 1500   ' 2.05#551

End Sub

Private Sub cmdCancel_Click()

On Error Resume Next ' 4.00-Beta-3

    txtValue.Text = ""
    Me.Hide
End Sub

Private Sub Form_Resize()
On Error GoTo err_rs

    txtValue.Width = Me.ScaleWidth - txtValue.Left * 2

    cmdOK.Top = Me.ScaleHeight - cmdOK.Height - 50
    cmdCancel.Top = cmdOK.Top
    

    cmdOK.Left = Me.ScaleWidth / 2 - (cmdOK.Width + cmdCancel.Width + 250) / 2

    cmdCancel.Left = cmdCancel.Width + cmdOK.Left + 250


Exit Sub
err_rs:
    Debug.Print "Error on frmEditVariable_Resize: " & LCase(err.Description)
End Sub

Private Sub Form_Unload(Cancel As Integer)

On Error Resume Next ' 4.00-Beta-3

    SaveWindowState Me ' 2.05#551
End Sub



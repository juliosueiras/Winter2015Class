VERSION 5.00
Begin VB.Form frmEvaluatorHelper 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "calculator help"
   ClientHeight    =   2985
   ClientLeft      =   60
   ClientTop       =   300
   ClientWidth     =   4470
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2985
   ScaleWidth      =   4470
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtHelper 
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2730
      Left            =   150
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "frmEvaluatorHelper.frx":0000
      Top             =   105
      Width           =   4125
   End
   Begin VB.CommandButton Command1 
      Caption         =   "close"
      Height          =   420
      Left            =   1860
      TabIndex        =   0
      Top             =   1575
      Width           =   915
   End
End
Attribute VB_Name = "frmEvaluatorHelper"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' there is hide button below, it's not visible,
' but it helps to remove the blinking focus form the text :)

Private Sub Command1_Click()
On Error Resume Next ' 4.00-Beta-3
    Me.Hide
End Sub


Private Sub Form_Load()
On Error Resume Next ' 4.00-Beta-3
    If Load_from_Lang_File(Me) Then Exit Sub
    
    put_me_near
End Sub

Private Sub Form_Activate()
On Error Resume Next ' 4.00-Beta-3
    put_me_near
End Sub



Private Sub put_me_near()

On Error GoTo err1

    If frmEvaluator.Visible Then
        Me.Top = frmEvaluator.Top
        Me.Left = frmEvaluator.Left + frmEvaluator.Width
    End If

    Exit Sub
err1:
    Debug.Print "evaluator helper: " & LCase(err.Description)

End Sub



Private Sub Form_Resize()

On Error GoTo err1

    txtHelper.Width = Me.ScaleWidth
    txtHelper.Height = Me.ScaleHeight
    
    Exit Sub
err1:
    Debug.Print "frmEvaluatorHelper: " & LCase(err.Description)
End Sub

VERSION 5.00
Begin VB.Form frmChooseOutput 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "choose output file type"
   ClientHeight    =   1215
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2985
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1215
   ScaleWidth      =   2985
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   495
      Left            =   900
      TabIndex        =   1
      Top             =   600
      Width           =   1185
   End
   Begin VB.ComboBox comboOType 
      Height          =   315
      ItemData        =   "frmChooseOutput.frx":0000
      Left            =   382
      List            =   "frmChooseOutput.frx":0002
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   90
      Width           =   2220
   End
End
Attribute VB_Name = "frmChooseOutput"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' 

' 

'





Option Explicit

Private Sub cmdOK_Click()
On Error Resume Next ' 4.00-Beta-3
    frmMain.Combo_output_type.ListIndex = comboOType.ListIndex
    Me.Hide
End Sub

Private Sub Form_Load()
On Error Resume Next ' 4.00-Beta-3
   If Load_from_Lang_File(Me) Then Exit Sub

    Me.Icon = frmMain.Icon
    
    Dim i As Integer
    
    comboOType.Clear
    
    For i = 0 To frmMain.Combo_output_type.ListCount - 1
        comboOType.AddItem frmMain.Combo_output_type.List(i)
    Next i
    
    comboOType.ListIndex = 0
    
End Sub

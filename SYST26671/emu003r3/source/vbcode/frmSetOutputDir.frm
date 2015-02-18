VERSION 5.00
Begin VB.Form frmSetOutputDir 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "set output directory"
   ClientHeight    =   1605
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4440
   Icon            =   "frmSetOutputDir.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1605
   ScaleWidth      =   4440
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   360
      Left            =   975
      TabIndex        =   4
      Top             =   1185
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   360
      Left            =   2310
      TabIndex        =   3
      Top             =   1185
      Width           =   1215
   End
   Begin VB.CommandButton cmdChooseDir 
      Caption         =   "..."
      Height          =   285
      Left            =   4065
      TabIndex        =   2
      Top             =   705
      Width           =   300
   End
   Begin VB.TextBox txtPath 
      Height          =   300
      Left            =   45
      TabIndex        =   1
      Top             =   705
      Width           =   3945
   End
   Begin VB.CheckBox chkUseDefault 
      Caption         =   "use default [emu8086\MyBuild] directory."
      Height          =   330
      Left            =   225
      TabIndex        =   0
      Top             =   180
      Width           =   3405
   End
End
Attribute VB_Name = "frmSetOutputDir"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'



Option Explicit

Private Sub Form_Load()
On Error Resume Next

   If Load_from_Lang_File(Me) Then Exit Sub
        
        ' Me.Icon = frmMain.Icon
        
        If GetSetting(sTitleA, "Dirs", "OutputDir", "[default]") = "[default]" Then
            chkUseDefault.Value = vbChecked
        Else
            chkUseDefault.Value = vbUnchecked
        End If
        
        txtPath.Text = s_MyBuild_Dir
End Sub


Private Sub chkUseDefault_Click()
    
On Error Resume Next

    If chkUseDefault.Value = vbChecked Then
        txtPath.Enabled = False
        cmdChooseDir.Enabled = False
        txtPath.Text = Add_BackSlash(App.Path) & "MyBuild" ' the same data used several times in code.
    Else
        txtPath.Enabled = True
        cmdChooseDir.Enabled = True
    End If
    
    
    
End Sub

Private Sub cmdChooseDir_Click()
On Error Resume Next
    Dim s As String
    s = InputBox("where to?", , "c:\temp\") ' ShowFolder
    If s <> "" Then
        txtPath.Text = s
    End If
End Sub


Private Sub cmdCancel_Click()
On Error Resume Next
    Unload Me
End Sub

Private Sub cmdOK_Click()
On Error Resume Next

    If chkUseDefault.Value = vbChecked Then
        s_MyBuild_Dir = Add_BackSlash(App.Path) & "MyBuild"  ' the same is done on Sub Main()!
        SaveSetting sTitleA, "Dirs", "OutputDir", "[default]"
    Else
        If (Trim(txtPath.Text) = "") Or _
            StrComp(Add_BackSlash(Trim(txtPath.Text)), Add_BackSlash(App.Path), vbTextCompare) = 0 Then
            MsgBox cMT("wrong output directory!")
            Exit Sub
        End If
    
        s_MyBuild_Dir = Trim(txtPath.Text)
        SaveSetting sTitleA, "Dirs", "OutputDir", txtPath.Text
    End If
    
    Unload Me
End Sub


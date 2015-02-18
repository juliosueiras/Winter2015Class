VERSION 5.00
Begin VB.Form frmFlagAnalyzer 
   Caption         =   "lexical flag analyser"
   ClientHeight    =   3840
   ClientLeft      =   10305
   ClientTop       =   6195
   ClientWidth     =   4215
   Icon            =   "frmFlagAnalyzer.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   3840
   ScaleWidth      =   4215
   Begin VB.TextBox txtResults 
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3840
      Left            =   -15
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Text            =   "frmFlagAnalyzer.frx":038A
      Top             =   0
      Width           =   4215
   End
End
Attribute VB_Name = "frmFlagAnalyzer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'




' Flag Analyzer

Option Explicit

Public Sub AnalyzeFlags()

On Error Resume Next ' 4.00-Beta-3

    txtResults.Text = ""
    
    Dim s As String
    Dim ST As String

    txtResults.Text = txtResults.Text & cMT("=== unsigned ===") & vbNewLine
    
    If frmFLAGS.cbCF.ListIndex = 1 Then
        ST = cMT("    below") & vbTab & "(CF=1)"
    Else
        ST = cMT("not below") & vbTab & "(CF=0)"
    End If
    
    txtResults.Text = txtResults.Text & ST & vbNewLine
    
    
    If (frmFLAGS.cbCF.ListIndex = 0) _
        And (frmFLAGS.cbZF.ListIndex = 0) Then
        ST = cMT("    above") & vbTab & "(CF=0 and ZF=0)"
    Else
        ST = cMT("not above") & vbTab & "(CF=1 or ZF=1)"
    End If

    txtResults.Text = txtResults.Text & ST & vbNewLine & vbNewLine
    
    txtResults.Text = txtResults.Text & cMT("=== signed ===") & vbNewLine
    
    If (frmFLAGS.cbSF.ListIndex <> frmFLAGS.cbOF.ListIndex) Then
        ST = cMT("    less") & vbTab & "(SF<>OF)"
    Else
        ST = cMT("not less") & vbTab & "(SF=OF)"
    End If
    
    txtResults.Text = txtResults.Text & ST & vbNewLine
        
    If (frmFLAGS.cbSF.ListIndex = frmFLAGS.cbOF.ListIndex) _
       And (frmFLAGS.cbZF.ListIndex = 0) Then
       ST = cMT("    greater") & vbTab & "(SF=OF and ZF=0)"
    Else
       ST = cMT("not greater") & vbTab & "(SF<>OF or ZF=1)"
    End If
       
    txtResults.Text = txtResults.Text & ST & vbNewLine & vbNewLine
            
            
    If frmFLAGS.cbZF.ListIndex = 1 Then
        ST = cMT("    equal") & vbTab & "(ZF=1)"
    Else
        ST = cMT("not equal") & vbTab & "(ZF=0)"
    End If
    
    txtResults.Text = txtResults.Text & ST & vbNewLine
    
            
            
    If (frmFLAGS.cbSF.ListIndex = 1) Then
        ST = cMT("negative") & vbTab & "(SF=1)"
    Else
        ST = cMT("positive") & vbTab & "(SF=0)"
    End If
    
    txtResults.Text = txtResults.Text & ST & vbNewLine
    
    
            
    If frmFLAGS.cbOF.ListIndex = 1 Then
        ST = cMT("   overflow") & vbTab & "(OF=1)"
    Else
        ST = cMT("no overflow") & vbTab & "(OF=0)"
    End If
    
    txtResults.Text = txtResults.Text & ST & vbNewLine
    
    If (frmFLAGS.cbPF.ListIndex = 1) Then
        ST = cMT("parity even") & vbTab & "(PF=1)"
    Else
        ST = cMT("parity odd ") & vbTab & "(PF=0)"
    End If
    
    txtResults.Text = txtResults.Text & ST & vbNewLine
        
    If frmFLAGS.cbAF.ListIndex = 1 Then
        ST = cMT("    aux carry") & vbTab & "(AF=1)"
    Else
        ST = cMT("not aux carry") & vbTab & "(AF=0)"
    End If
    
    txtResults.Text = txtResults.Text & ST & vbNewLine
      
    
    If frmFLAGS.cbIF.ListIndex = 0 Then
        ST = cMT("hw-int disabled") & vbTab & "(IF=0)"
    Else
        ST = cMT("hw-int enabled ") & vbTab & "(IF=1)"
    End If
    
    txtResults.Text = txtResults.Text & ST & vbNewLine
        
    
    If frmFLAGS.cbDF.ListIndex = 0 Then
        ST = cMT("forward dir ") & vbTab & "(DF=0)"
    Else
        ST = cMT("backward dir") & vbTab & "(DF=1)"
    End If
    
    txtResults.Text = txtResults.Text & ST ' & vbNewLine
    
    
End Sub



Private Sub Form_Resize()
On Error GoTo err_far
    
    txtResults.Left = 0
    txtResults.Width = Me.ScaleWidth
    txtResults.Height = Me.ScaleHeight - txtResults.Top
    
    Exit Sub
err_far:
    Debug.Print "frmFlagAnalyzer_Resize: " & LCase(Err.Description)
End Sub



Private Sub Form_Load()
On Error GoTo err1

   If Load_from_Lang_File(Me) Then Exit Sub
    
    GetWindowPos_CENTER_BY_DEFAULT Me   ' 2.05#551
    
    GetWindowSize Me, 4335, 4247 ' 2.05#551
    
    ' Me.Icon = frmMain.Icon
    
    
    ' #1096
'    Dim sFTEMP As String
'    sFTEMP = LCase(get_property("emu8086.ini", "LEXICAL_FLAG_ANALYZER_FONT_SIZE", "default"))
'    If sFTEMP <> "default" Then
'        txtResults.FontSize = Val(sFTEMP)
'    End If
'    sFTEMP = LCase(get_property("emu8086.ini", "LEXICAL_FLAG_ANALYZER_FONT_FACE", "default"))
'    If sFTEMP <> "default" Then
'        txtResults.FontName = sFTEMP
'    End If
'
    
    
    
    bUPDATE_LEXICAL_FLAG_ANALYSER = True
    
    
    Exit Sub
err1:
    'MsgBox "POSSIBLE emu8086.ini ERROR! frmFlagAnalyzer: " & LCase(Err.Description)
    On Error Resume Next
    
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
On Error Resume Next ' 4.00-Beta-3
    bUPDATE_LEXICAL_FLAG_ANALYSER = False
End Sub



Public Sub DoShowMe()
On Error Resume Next '3.27xm
    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
    
    AnalyzeFlags
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next ' 4.00-Beta-3
    frmEmulation.process_HotKey KeyCode, Shift
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next ' 4.00-Beta-3
    SaveWindowState Me ' 2.05#551
End Sub

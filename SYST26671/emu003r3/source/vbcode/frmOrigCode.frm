VERSION 5.00
Begin VB.Form frmOrigCode 
   Caption         =   "original source code"
   ClientHeight    =   3735
   ClientLeft      =   8535
   ClientTop       =   165
   ClientWidth     =   4095
   Icon            =   "frmOrigCode.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   3735
   ScaleWidth      =   4095
   Begin VB.ListBox lstOrigCode 
      Height          =   2400
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   2535
   End
   Begin VB.Menu mnuPopUp 
      Caption         =   "mnuPopUp"
      Visible         =   0   'False
      Begin VB.Menu mnuCopy 
         Caption         =   "copy"
         Shortcut        =   ^C
      End
      Begin VB.Menu mnuCopyAll 
         Caption         =   "copy all"
      End
      Begin VB.Menu mnuFind 
         Caption         =   "find..."
         Shortcut        =   ^F
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFindNext 
         Caption         =   "find next"
         Shortcut        =   {F3}
         Visible         =   0   'False
      End
   End
End
Attribute VB_Name = "frmOrigCode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'



Option Explicit

' 3.27w
Dim DEFAULT_CAP_Actual_Source As String

'' April 08, 2004
'Private Function cmaxActualSource_KeyPress(ByVal Control As codemaxctl.ICodeMax, ByVal KeyAscii As Long, ByVal Shift As Long) As Boolean
'
'On Error Resume Next ' 4.00-Beta-3
'
'' #327xk-no-st#
'If frmScreen.timerInput.Enabled Then
'    Exit Function
'End If
'
'
' ' DOESN'T WORK FOR DELETE AND BACKSPACE KEYS!!
'
' If KeyAscii >= Asc("a") And KeyAscii <= Asc("z") Or KeyAscii >= Asc("A") And KeyAscii <= Asc("Z") Or KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = Asc(";") Or KeyAscii = 10 Or KeyAscii = Asc(" ") Or KeyAscii = 8 Then
'    mBox Me, vbNewLine & cMT("cannot make such changes here.") & vbNewLine & cMT("close the emulator, then edit and re-assemble.") ' #1117
' End If
'
' ' Debug.Print KeyAscii
'End Function
' April 08, 2004
'Private Function cmaxActualSource_KeyUp(ByVal Control As codemaxctl.ICodeMax, ByVal KeyCode As Long, ByVal Shift As Long) As Boolean
'
'On Error GoTo err1
'
'' #400-annoynce#
'''''
'''''' #327xk-no-st#
'''''If frmScreen.timerInput.Enabled Then
'''''    frmScreen.Form_KeyDown_PUBLIC to_signed_int(KeyCode)
'''''    Exit Function
'''''End If
'
'' #400-annoynce#  I left only this:
'If frmScreen.timerInput.Enabled Then
'    Exit Function
'End If
'
'
'
'' WORKS ON DELETE AND BACKSPACE KEYS!!
'
' If KeyCode = 8 Or KeyCode = 46 Then
'    mBox Me, vbNewLine & cMT("cannot make these changes on runtime.") & vbNewLine & cMT("close the emulator, then edit and recompile.")
' End If
'
'
'
'' Debug.Print KeyCode
'
'Exit Function
'err1:
'Debug.Print "err:7733:" & err.Description
'End Function

'Private Function cmaxActualSource_MouseDown(ByVal Control As codemaxctl.ICodeMax, ByVal Button As Long, ByVal Shift As Long, ByVal X As Long, ByVal Y As Long) As Boolean
'
'On Error GoTo err_asmd
'
'    If Button = vbRightButton Then
'
'        PopupMenu mnuPopUp
'
'    End If
'
'    Exit Function
'err_asmd:
'    Debug.Print "cmaxActualSource_MouseDown: " & LCase(err.Description)
'End Function

' 1.25#311
'Private Function cmaxActualSource_MouseUp(ByVal Control As codemaxctl.ICodeMax, ByVal Button As Long, ByVal Shift As Long, ByVal X As Long, ByVal Y As Long) As Boolean
'    On Error GoTo err_acmu
'
'    If Button = vbLeftButton Then
'
'        Dim lLen As Long
'        Dim lLineNum As Long
'        Dim lByteFirst As Long
'        Dim rr As New Range
'
'        rr = Control.GetSel(False)
'        lLineNum = rr.StartLineNo
'        lByteFirst = L2LC(lLineNum).ByteFirst
'
'        ' Debug.Print lLineNum, lByteFirst
'
'        ' Debug.Print "xxx: ", rr.StartLineNo, rr.EndLineNo
'
'
'        If lByteFirst <> -1 Then
'
'            ' allow selection of "original source":
'            If Control.SelText = "" Then  ' 1.31
'
'                Control.SelectLine lLineNum, True
'
'                Control.ExecuteCmd cmCmdSelectSwapAnchor  ' it's better to have the carrent in the back.
'
'            End If
'
'        End If
'    End If
'
'    Exit Function
'err_acmu:
'    Debug.Print "cmaxActualSource_MouseUp: " & LCase(Err.Description)
'
'End Function

'Private Sub cmaxActualSource_SelChange(ByVal Control As codemaxctl.ICodeMax)
'On Error GoTo err_md
'    Dim lT As Long
'
'
'    ' lt = L2LC(lstInput.ListIndex).ByteFirst
'
'    ' 1.23 do it with CODEMAX:
'    Dim rr As New Range
'    rr = Control.GetSel(False)
'    lT = L2LC(rr.StartLineNo).ByteFirst
'
'
'    If lT <> -1 Then
'
'        lT = lT + frmEmulation.lPROG_LOADED_AT_ADR
'
'        selectMemoryLine_YELLOW lT, frmEmulation.lPROG_LOADED_AT_ADR + L2LC(rr.StartLineNo).ByteLast, True
'
'
'        ' 1.16 ==============================================
'        ' select disassembled command also:
'         DoDisassembling lT
'        ' disassembling always starts from selected line, so
'        ' no need to select disassembled line using loops, just select
'        ' the first line:
'        ' frmEmulation.select_disassembled_line_according_to_selected_byte
''#400-dissasembly# '         frmEmulation.lstDECODED.ListIndex = 0
'         selectDisassembled_Line_by_INDEX 0, YELLOW_SELECTOR
'        ' ==============================================
'    End If
'
'
'    Exit Sub
'err_md:
'    Debug.Print "cmaxActualSource_SelChange: " & LCase(Err.Description)
'
'End Sub

' 1.28#391
' 1.29#404 Private Sub Form_Activate()
Public Sub DoShowMe()
On Error Resume Next '3.27xm
    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
End Sub



' #400b4-mini-8#
Private Sub Form_Activate()
On Error Resume Next
    If SHOULD_DO_MINI_FIX_8 Then
        If StrComp(cmaxActualSource.Font.Name, "Terminal", vbTextCompare) = 0 Then
            If cmaxActualSource.Font.Size < 12 Then
                cmaxActualSource.Font.Size = 12
            End If
        End If
    End If
End Sub

Private Sub Form_Load()

On Error Resume Next ' 4.00-Beta-3

    If Load_from_Lang_File(Me) Then Exit Sub
    
    

    
    
    DEFAULT_CAP_Actual_Source = Me.Caption
    
    GetWindowPos Me ' 2.05#551
    GetWindowSize Me ' 2.05#551
    
    '#1059 Me.Icon = frmMain.Icon
    Me.Caption = DEFAULT_CAP_Actual_Source ' 1.30#413
    
    b_LOADED_frmOrigCode = True
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

On Error Resume Next ' 4.00-Beta-3

    If UnloadMode = vbFormControlMenu Then
            Cancel = 1
            Me.Hide
            
            ' #400b13-stop-on-orig-close#
            If frmEmulation.chkAutoStep.Value = vbChecked Then
                frmEmulation.chkAutoStep.Value = vbUnchecked ' stop!!!
            End If
            
            
            Exit Sub  ' 2.03#518
    End If
    
    ' this form is unloaded only
    ' on application termination (exit).
    
    b_LOADED_frmOrigCode = False
End Sub

Private Sub Form_Resize()
    On Error GoTo err_res
    
    cmaxActualSource.Left = 0
    cmaxActualSource.Top = 0
    cmaxActualSource.Width = Me.ScaleWidth
    cmaxActualSource.Height = Me.ScaleHeight
        
        
    Exit Sub
err_res:
    Debug.Print "Error on resize of frmOrigCode: " & LCase(Err.Description)
End Sub


'Public Sub PREPARE_cmaxActualSource()
'
'On Error Resume Next ' 4.00-Beta-3
'
'    cmaxActualSource.ReadOnly = True
'    cmaxActualSource.EnableHSplitter = False
'    cmaxActualSource.EnableVSplitter = False
'    cmaxActualSource.DisplayLeftMargin = False
'    cmaxActualSource.HideSel = False
'    cmaxActualSource.BorderStyle = cmBorderCorral
'
'    With frmMain.txtInput
'
'        Set cmaxActualSource.Font = .Font
'
'
'
'        cmaxActualSource.LineNumbering = .LineNumbering
'        cmaxActualSource.LineNumberStart = .LineNumberStart
'        cmaxActualSource.LineNumberStyle = .LineNumberStyle
'        cmaxActualSource.SetColor cmClrLineNumber, .GetColor(cmClrLineNumber)
'        cmaxActualSource.SetColor cmClrLineNumberBk, .GetColor(cmClrLineNumberBk)
'
'
'        ' for instructions:
'        cmaxActualSource.SetFontStyle cmStyKeyword, .GetFontStyle(cmStyKeyword)
'        ' for comment:
'        cmaxActualSource.SetFontStyle cmStyComment, .GetFontStyle(cmStyComment)
'        ' for general purpose registers:
'        cmaxActualSource.SetColor cmClrTagAttributeName, .GetColor(cmClrTagAttributeName)
'        ' for segment registers:
'        cmaxActualSource.SetFontStyle cmStyTagElementName, .GetFontStyle(cmStyTagElementName)
'        ' for compiler directives:
'        cmaxActualSource.SetColor cmClrTagEntity, .GetColor(cmClrTagEntity)
'
'
'        ' #1119
'        ' forgotten colors:
'        cmaxActualSource.SetColor cmClrNumber, .GetColor(cmClrNumber)
'        cmaxActualSource.SetColor cmClrOperator, .GetColor(cmClrOperator)
'        cmaxActualSource.SetColor cmClrScopeKeyword, .GetColor(cmClrScopeKeyword)
'        cmaxActualSource.SetColor cmClrString, .GetColor(cmClrString)
'        cmaxActualSource.SetColor cmClrTagElementName, .GetColor(cmClrTagElementName)
'        cmaxActualSource.SetColor cmClrText, .GetColor(cmClrText)
'
'
'
'
'        ' window background:
'        cmaxActualSource.SetColor cmClrWindow, .GetColor(cmClrWindow)
'
'
'        ' default, but set anyway:
'        cmaxActualSource.TabSize = .TabSize
'        ' convert tabs to spaces:
'        cmaxActualSource.ExpandTabs = .ExpandTabs
'
'
'        cmaxActualSource.ColorSyntax = .ColorSyntax
'
'        cmaxActualSource.Language = .Language
'
'    End With
'
'End Sub





Private Sub Form_Unload(Cancel As Integer)

On Error Resume Next ' 4.00-Beta-3

    SaveWindowState Me ' 2.05#551
End Sub

'Private Sub mnuPopUp_Click()
'
'On Error Resume Next ' 4.00-Beta-3
'
'    mnuCopy.Enabled = cmaxActualSource.CanCopy
'
'End Sub


' 1.23
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next ' 4.00-Beta-3

    frmEmulation.process_HotKey KeyCode, Shift
End Sub


'' 1.24#283
'Private Sub mnuCopy_Click()
'On Error GoTo err_copy
'
'    cmaxActualSource.Copy
'
'    Exit Sub
'err_copy:
'    Debug.Print "Error on copy: " & LCase(Err.Description)
'End Sub

' 1.28#366
'Private Sub mnuCopyAll_Click()
'On Error GoTo err_copy_All
'
'    cmaxActualSource.ExecuteCmd cmCmdSelectAll
'
'    cmaxActualSource.Copy
'
'Exit Sub
'err_copy_All:
'    Debug.Print "Error on copy all: " & LCase(Err.Description)
'
'End Sub

'' 1.24#283
'' not used anyway :), because this doesn't work directly from
'' popup menu hot key can be used instead.
'' on frmMain I'm using Timer to make it work.
'Private Sub mnuFind_Click()
'On Error GoTo err_mnu_ft
'
'    cmaxActualSource.ExecuteCmd cmCmdFind
'
'    Exit Sub
'err_mnu_ft:
'    Debug.Print "mnuFind_Click: " & LCase(Err.Description)
'End Sub

'' 1.24#283
'' not used anyway :), because this doesn't work directly from
'' popup menu hot key can be used instead.
'' on frmMain I'm using Timer to make it work.
'Private Sub mnuFindNext_Click()
'
'On Error Resume Next ' 4.00-Beta-3
'
'    cmaxActualSource.ExecuteCmd cmCmdFindNext
'End Sub


' 1.30#413
Public Sub setDefaultCaption()

On Error Resume Next ' 4.00-Beta-3

    Me.Caption = DEFAULT_CAP_Actual_Source
End Sub
        

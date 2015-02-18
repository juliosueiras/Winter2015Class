VERSION 5.00
Begin VB.Form frmInfo 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "assembler status"
   ClientHeight    =   5370
   ClientLeft      =   60
   ClientTop       =   285
   ClientWidth     =   5955
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmInfo.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5370
   ScaleWidth      =   5955
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdClose 
      Caption         =   "close"
      Height          =   615
      Left            =   2010
      OLEDropMode     =   1  'Manual
      TabIndex        =   2
      Top             =   4230
      Width           =   1050
   End
   Begin VB.ListBox lstERROR_CAUSE 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1395
      Left            =   960
      TabIndex        =   7
      Top             =   2835
      Visible         =   0   'False
      Width           =   1785
   End
   Begin VB.PictureBox picProgressHolder 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
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
      Height          =   270
      Left            =   105
      ScaleHeight     =   240
      ScaleWidth      =   4875
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   15
      Width           =   4905
   End
   Begin VB.ListBox lstStatus 
      Height          =   1290
      IntegralHeight  =   0   'False
      Left            =   105
      TabIndex        =   3
      Top             =   570
      Width           =   4845
   End
   Begin VB.ListBox lstErr_BUFFER 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1200
      Left            =   2805
      TabIndex        =   5
      Top             =   2835
      Visible         =   0   'False
      Width           =   1665
   End
   Begin VB.ListBox lstErr 
      Height          =   1620
      IntegralHeight  =   0   'False
      Left            =   105
      TabIndex        =   1
      Top             =   2340
      Width           =   4845
   End
   Begin VB.Timer timerAnimation 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   3615
      Top             =   2205
   End
   Begin VB.TextBox txtCURRENT 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   9
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   105
      TabIndex        =   0
      Top             =   1935
      Width           =   4845
   End
   Begin VB.Label lblPASS_NUMBER 
      AutoSize        =   -1  'True
      Caption         =   "          "
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   9
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   180
      Left            =   2010
      OLEDropMode     =   1  'Manual
      TabIndex        =   4
      Top             =   315
      Width           =   975
   End
   Begin VB.Menu mnuCopyPopup 
      Caption         =   "mnuCopyPopup"
      Visible         =   0   'False
      Begin VB.Menu mnuCopyLine 
         Caption         =   "copy selected line"
      End
      Begin VB.Menu mnuCopyAll 
         Caption         =   "copy all"
      End
   End
   Begin VB.Menu mnuExternal 
      Caption         =   "external"
      Visible         =   0   'False
      Begin VB.Menu mnuDebugEXE 
         Caption         =   "debug.exe"
         Enabled         =   0   'False
         Shortcut        =   {F12}
      End
      Begin VB.Menu mnuCommandPrompt 
         Caption         =   "command prompt"
      End
      Begin VB.Menu mnuExternalRun 
         Caption         =   "run"
         Enabled         =   0   'False
      End
   End
End
Attribute VB_Name = "frmInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'



Option Explicit

' 1.23#245 Dim sERROR_BUFFER As String

' 1.20
' variable used for animation while precompiling:
Dim iAnimID As Integer

' #735 to avoid the same error message to be
' shown twice, happens when wrong addressing:
Dim sJUSTADDED As String

' 1.23
' 1 - click over lstStatus
' 2 - click over lstErr
Dim iRCLICK As Integer


Dim fProgressBarWidth As Single
Dim fProgBarHeight As Single

Public Sub addStatus(ByRef s As String)
On Error Resume Next ' 4.00-Beta-3

    If Not bCOMPILE_ALL_SILENT Then
        lstStatus.AddItem s
        ' hor.scroll may not be shown, so show it:
        AddHorizontalScroll lstStatus
    Else
        Dim s2 As String
        s2 = "STATUS: " & s
        Print #iASSEMBLER_LOG_FILE_NUMBER, s2
    End If

End Sub


' #400b15-integrate-fasm#
' cloned from addErr(), but simpler
Public Sub addErr_FASM(lLine As Long, ByRef s As String, sCOPY_OF_LINE_THAT_CAUSED_ERROR As String)
On Error GoTo err1

 Dim sTOADD As String
 
 'sTOADD = "(" & lLine + frmMain.txtInput.LineNumberStart - 1 & ") " & s ' FASM counts from 1, so "-1"
 'sTOADD = s ' 20140414
 sTOADD = "(" & lLine & ") " & s  ' FASM counts from 1, so "-1"
 
 
 If sJUSTADDED = sTOADD Then
        Debug.Print "duplicated error message: " & sTOADD
        Exit Sub
 End If
 
 lstErr_BUFFER.AddItem sTOADD
 
 lstERROR_CAUSE.AddItem sCOPY_OF_LINE_THAT_CAUSED_ERROR
 
 sJUSTADDED = sTOADD


Exit Sub
err1:
Debug.Print "addErr_FASM : " & Err.Description

End Sub


' #404-masm#
' cloned from addErr_FASM()
Public Sub addErr_MASM(lLine As Long, ByRef s As String, sCOPY_OF_LINE_THAT_CAUSED_ERROR As String)
On Error GoTo err1

 Dim sTOADD As String
 
 'sTOADD = "(" & lLine + frmMain.txtInput.LineNumberStart - 1 & ") " & s ' MASM counts from 1, so "-1" (not sure)
 'sTOADD = s ' 20140414
 sTOADD = "(" & lLine & ") " & s ' 20140414
 
 
 
 If sJUSTADDED = sTOADD Then
        Debug.Print "duplicated error message: " & sTOADD
        Exit Sub
 End If
 
 lstErr_BUFFER.AddItem sTOADD
 
 lstERROR_CAUSE.AddItem sCOPY_OF_LINE_THAT_CAUSED_ERROR
 
 sJUSTADDED = sTOADD


Exit Sub
err1:
Debug.Print "addErr_MASM : " & Err.Description

End Sub


Public Sub addErr(ByVal lLine As Long, ByRef s As String, sCOPY_OF_LINE_THAT_CAUSED_ERROR As String) ' #1157c if not the complete copy, then at leat a part of it.

On Error GoTo err_adderr

 lLine = get_Starting_Line(lLine)





 
 Dim sTOADD As String
 
 If InStr(1, s, "_location_counter__") > 0 Then
    ' sTOADD = "(" & lLine + frmMain.txtInput.LineNumberStart & ") " & "offset calculation error"
    sTOADD = "(" & lLine & ") " & "offset calculation error"
 Else
    ' sTOADD = "(" & lLine + frmMain.txtInput.LineNumberStart & ") " & s
    sTOADD = "(" & lLine & ") " & s
 End If
 
 If sJUSTADDED = sTOADD Then
        Debug.Print "duplicated error message: " & sTOADD
        Exit Sub
 End If




 ' 2004-10-30 v3.05 feature
 ' [+] Error report is reverted, to make it
 '   easier to compile your code and find
 '   possible syntax errors.
 

''' ' as it was before feature: lstErr_BUFFER.AddItem sTOADD
'''
''' ' and now updated:
'''
''' lstErr_BUFFER.AddItem "----"
'''
''' Dim innn2 As Integer
'''
''' For innn2 = lstErr_BUFFER.ListCount - 1 To 1 Step -1
'''     lstErr_BUFFER.List(innn2) = lstErr_BUFFER.List(innn2 - 1)
''' Next innn2
'''
''' lstErr_BUFFER.List(0) = sTOADD
'''
 ' #1054
 ' ????? indeed ?
 ' it because easier but only wrong JMPs I think... reverting back!!!
 
 
 lstErr_BUFFER.AddItem sTOADD
 
 lstERROR_CAUSE.AddItem sCOPY_OF_LINE_THAT_CAUSED_ERROR '#1157c
 
 
 
 
 sJUSTADDED = sTOADD
 
 Exit Sub
 
err_adderr:
    Debug.Print "addErr: " & LCase(Err.Description)

End Sub



Private Sub cmdBrowseMyBuild_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' #400b17-dragdrop-frmInfo#
    On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub cmdClose_Click()
On Error GoTo err_close         ' 1.23 bugfix#204

    ' 1.23
    ' no need to keep errors:
    frmInfo.clearErrorBuffer_and_Text

    stop_precompile_animation
    frmMain.bCOMPILING = False ' stop compiling!
    Me.Hide
    frmMain.SetFocus
    
    Exit Sub
err_close:
    Debug.Print "cmdClose_Click: " & LCase(Err.Description)
    On Error Resume Next
End Sub


Public Sub clearErrorBuffer_and_Text()
On Error Resume Next ' 4.00-Beta-3
    sJUSTADDED = ""
    lstErr.Clear
    lstErr_BUFFER.Clear
    lstERROR_CAUSE.Clear '#1157c
End Sub

' update 1.23#245
Public Sub showErrorBuffer()

On Error Resume Next ' 4.00-Beta-3

    Dim i As Integer
    
    lstErr.Clear
    
    ' #400b8-fast-examples-check#
    If Not bCOMPILE_ALL_SILENT Then
        For i = 0 To lstErr_BUFFER.ListCount - 1
            lstErr.AddItem lstErr_BUFFER.List(i)
        Next i
        ' hor.scroll may not be shown, so show it:
        AddHorizontalScroll lstErr
    Else
        For i = 0 To lstErr_BUFFER.ListCount - 1
            Dim s As String
            s = "ERROR: " & lstErr_BUFFER.List(i) ' 4.00-Beta-9 seems not to be requred ' & "    (ignore if not the last pass!)"
            Print #iASSEMBLER_LOG_FILE_NUMBER, s
        Next i
    End If

End Sub

'''''
'''''' 1.22
'''''Private Sub txtERR_KeyUp(KeyCode As Integer, Shift As Integer)
'''''    click_on_error_message
'''''End Sub
'
'' 1.23#245 update
'Public Sub click_on_error_message(ByVal iErrorLine As Integer)
'On Error GoTo error_on_cem
'    Dim i As Long
'    Dim s As String
'    Dim sTT As String
'
'    If lstErr.ListCount = 0 Then Exit Sub
'
'    If iErrorLine < 0 Then Exit Sub
'
'
'    sTT = lstErr.List(iErrorLine)
'
'    ' error number should always be in () in the begining:
'    i = InStr(1, sTT, ")")
'    s = Mid(sTT, 2, i - 2) ' get number inside ().
'
'
'    i = Val(s) ' #327xn-new-dot-stack# '  - lLINE_NUMBER_CORRECTION_FOR_ERRORS
'
'
'    selectErrorLine i, lstERROR_CAUSE.List(iErrorLine)
'
'
'    lstErr.ListIndex = iErrorLine
'
'    Exit Sub
'error_on_cem:
'    Debug.Print "Error on click_on_error_message(): " & LCase(Err.Description)
'End Sub


' 1.20
Public Sub show_precompile_animation()
On Error Resume Next ' 4.00-Beta-3
    iAnimID = 1
    timerAnimation.Enabled = True
End Sub

Public Sub stop_precompile_animation(Optional bSHOW_ERRORS As Boolean = True)
On Error Resume Next ' 4.00-Beta-3
    timerAnimation.Enabled = False
    lblPASS_NUMBER.Caption = ""
    If bSHOW_ERRORS Then set_current_text_cool "there are errors."    ' is seen only when no code or when indeed errors.
End Sub







Private Sub cmdClose_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' #400b17-dragdrop-frmInfo#
    On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub cmdEmulate_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' #400b17-dragdrop-frmInfo#
    On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub cmdExternal_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' #400b17-dragdrop-frmInfo#
    On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub Form_Activate()
On Error GoTo err1:
    If bRIGHT_TO_LEFT Then
        Me.RightToLeft = True
        lstStatus.RightToLeft = True
        txtCURRENT.RightToLeft = True
        lstErr.RightToLeft = True
    End If
    Exit Sub
err1:
Debug.Print "frmInfo_ACTIVEATE! Err: " & LCase(Err.Description)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
On Error Resume Next ' 4.00-Beta-3
    ' 1.23
    If KeyAscii = vbKeyEscape Then
        cmdClose_Click
    End If
End Sub

Private Sub Form_Load()

On Error Resume Next ' 4.00-Beta-3

   If Load_from_Lang_File(Me) Then Exit Sub
    
    'GetWindowSize Me, 5190, 5550  ' 3.27xo
    
    AddHorizontalScroll lstStatus
    AddHorizontalScroll lstErr
End Sub


' v4.00b17
Private Sub Form_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error GoTo err_dd
    
    cmdClose_Click
    
    If Data.GetFormat(vbCFFiles) Then
        
        If Data.Files.Count > 0 Then
            
            ' process like command line parameter:
            PROCESS_CMD_Line Data.Files.Item(1)
            
        End If
        
        
    End If

Exit Sub
err_dd:
    Debug.Print "frmInfo Form_OLEDragDrop : " & Err.Description
    On Error Resume Next
    
End Sub

Private Sub Form_Resize()
On Error GoTo err_fr
    
    cmdClose.Left = Me.ScaleWidth / 2 - cmdClose.Width / 2 'center
    
    cmdClose.Top = Me.ScaleHeight - cmdClose.Height - cmdClose.Height / 10
    'cmdEmulate.Top = Me.ScaleHeight - cmdEmulate.Height - cmdEmulate.Height / 10 ' 2005-7-23
    
    lstErr.Width = Me.ScaleWidth - lstErr.Left * 2
    
    lstErr.Height = cmdClose.Top - lstErr.Top - cmdClose.Height / 3   ' 2005-7-23
    'lstErr.Height = Me.ScaleHeight - lstErr.Height - lstErr.Height / 10 ' 0.0.0.3
    
    
    lstStatus.Width = Me.ScaleWidth - lstStatus.Left * 2
    
    picProgressHolder.Width = Me.ScaleWidth - picProgressHolder.Left * 2
    
    txtCURRENT.Width = lstErr.Width ' 3.27xo ' Me.ScaleWidth - txtCURRENT.Left - txtCURRENT.Left / 10
    
    lblPASS_NUMBER.Left = Me.ScaleWidth / 2 - lblPASS_NUMBER.Width / 2
    
    
    fProgBarHeight = picProgressHolder.Height - PROGRBAR_FRAME * 2
    
    ' 1.29
    'cmdBrowseMyBuild.Top = cmdEmulate.Top
    'cmdClose.Top = cmdEmulate.Top
    ' symetrical to cmdBrowseMyBuild:
    'cmdEmulate.Left = Me.ScaleWidth - cmdEmulate.Width - cmdBrowseMyBuild.Left
    
    'cmdExternal.Top = cmdBrowseMyBuild.Top + cmdExternal.Height + 10
    
    Exit Sub
err_fr:
    Debug.Print "frmInfo_Resize: " & LCase(Err.Description)
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next ' 4.00-Beta-3
    'SaveWindowState Me ' 2.05#551
End Sub

'Private Sub lstErr_Click()
'On Error Resume Next ' 4.00-Beta-3
'    click_on_error_message lstErr.ListIndex
'End Sub


' 3.27xq
'Private Sub lstErr_DblClick()
'On Error Resume Next
'        click_on_error_message lstErr.ListIndex
'        cmdClose_Click
'End Sub

'Private Sub lstErr_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
'    ' #400b17-dragdrop-frmInfo#
'    On Error Resume Next
'    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
'End Sub

Private Sub lstStatus_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next ' 4.00-Beta-3
    If Not frmMain.bCOMPILING Then
        If Button = vbRightButton Then
            iRCLICK = 1
            PopupMenu mnuCopyPopup
        End If
    End If
End Sub

Private Sub lstErr_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next ' 4.00-Beta-3
    If Not frmMain.bCOMPILING Then
        If Button = vbRightButton Then
            iRCLICK = 2
            PopupMenu mnuCopyPopup
        End If
    End If
End Sub




Private Sub lstStatus_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' #400b17-dragdrop-frmInfo#
    On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub mnuCopyAll_Click()
On Error GoTo err_cpa
    
    Dim s As String
    Dim i As Integer
    
    s = ""
    
    If iRCLICK = 1 Then ' click over lstStatus
    
        For i = 0 To lstStatus.ListCount - 1
            s = s & lstStatus.List(i) & vbNewLine
        Next i
    
    Else                ' click over lstErr

        For i = 0 To lstErr.ListCount - 1
            s = s & lstErr.List(i) & vbNewLine
        Next i
    
    End If
    
    Clipboard.Clear ' "2005-07-20 glitch" fix.
    Clipboard.SetText s
    
    Exit Sub
err_cpa:
    Debug.Print "mnuCopyAll_Click: " & LCase(Err.Description)

End Sub

Private Sub mnuCopyLine_Click()
On Error GoTo err_cpl

    Clipboard.Clear ' "2005-07-20 glitch" fix.

    If iRCLICK = 1 Then ' click over lstStatus
    
        Clipboard.SetText lstStatus.List(lstStatus.ListIndex)
    
    Else                ' click over lstErr
    
        Clipboard.SetText lstErr.List(lstErr.ListIndex)
    
    End If
    
    Exit Sub
err_cpl:
    Debug.Print "mnuCopyLine_Click: " & LCase(Err.Description)
    
End Sub





Private Sub mnuExplore_Click()
'On Error Resume Next
'    Call ShellExecute(Me.hwnd, "explore", ExtractFilePath(sLAST_COMPILED_FILE), "", ExtractFilePath(sLAST_COMPILED_FILE), SW_SHOWNORMAL)
End Sub

' #327xm-listing-and-stable-viewer#
Private Sub mnuShowListing_Click()
'On Error Resume Next
'
'    Dim s As String
'    s = sLAST_COMPILED_FILE & ".list.txt"
'
'    If FileExists(s) Then ' 4.00b15
'        Call ShellExecute(Me.hwnd, "open", ASCII_VIEWER, s, ExtractFilePath(s), SW_SHOWDEFAULT)
'    Else
'        ' probably it's MASM
'        s = CutExtension(sLAST_COMPILED_FILE) & ".lst"
'        If FileExists(s) Then
'            Call ShellExecute(Me.hwnd, "open", ASCII_VIEWER, s, ExtractFilePath(s), SW_SHOWDEFAULT)
'        End If
'    End If
    
End Sub

' #327xm-listing-and-stable-viewer#
Private Sub mnuShowSymbolTable_Click()
'' #todo-st-view#   frmSymbolTableViewer.DoShowMe_with_SYMBOL_TABLE sLAST_COMPILED_FILE & ".symbol"
'On Error Resume Next
'
'    Dim s As String
'    s = sLAST_COMPILED_FILE & ".symbol.txt"
'
'    If FileExists(s) Then ' 4.00b15
'        Call ShellExecute(Me.hwnd, "open", ASCII_VIEWER, s, ExtractFilePath(s), SW_SHOWDEFAULT)
'    End If
    
End Sub
' 4.00b15
Private Sub mnuView_Click()
'On Error Resume Next
'    '  2006-11-29 added MASM way: Or FileExists(CutExtension(sLAST_COMPILED_FILE) & ".lst")
'    mnuShowListing.Enabled = FileExists(sLAST_COMPILED_FILE & ".list.txt") Or FileExists(CutExtension(sLAST_COMPILED_FILE) & ".lst")
'    mnuShowSymbolTable.Enabled = FileExists(sLAST_COMPILED_FILE & ".symbol.txt")
End Sub



Private Sub picProgressHolder_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' #400b17-dragdrop-frmInfo#
    On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub timerAnimation_Timer()
On Error Resume Next ' 4.00-Beta-3

    Select Case iAnimID
    Case 0 To 10
        frmInfo.lblPASS_NUMBER.Caption = String(iAnimID, ".")
    Case 11 To 20
        frmInfo.lblPASS_NUMBER.Caption = String(iAnimID - 10, " ") & String(10 - (iAnimID - 10), ".")

    Case Else
        iAnimID = 0
    End Select
    
    iAnimID = iAnimID + 1
End Sub


Public Sub show_FULL_progress_bar()
On Error Resume Next ' 4.00-Beta-3
    fProgressBarWidth = picProgressHolder.Width - PROGRBAR_FRAME * 2
    updatePROGRESS 0
End Sub

Public Sub show_EMPTY_progress_bar()
On Error Resume Next ' 4.00-Beta-3
    fProgressBarWidth = PROGRBAR_FRAME
    picProgressHolder.Cls
End Sub

Public Sub updatePROGRESS(fStep As Single)
On Error GoTo err_upb
    fProgressBarWidth = fProgressBarWidth + fStep
    picProgressHolder.Line (PROGRBAR_FRAME, PROGRBAR_FRAME)-(fProgressBarWidth, fProgBarHeight), vbBlue, BF
    Exit Sub
err_upb:
    Debug.Print "updatePROGRESS: " & LCase(Err.Description)
End Sub

' 1.29#395
Private Sub cmdBrowseMyBuild_Click()
'On Error Resume Next ' 4.00-Beta-3
'    PopupMenu mnuView
End Sub

' 1.29
Private Sub cmdEmulate_Click()

On Error Resume Next ' 4.00-Beta-3


    If iEXECUTABLE_TYPE = 0 Then ' #400b16-PE-RUN#

            '#1135 instead of just loading it into the emulator, I now just start it!
            '        because it already should be loaded there!
            ''''''        frmInfo.Hide
            ''''''        frmEmulation.DoShowMe
            ''''''        bAlwaysNAG = False
            ''''''        frmEmulation.loadFILEtoEMULATE sLAST_COMPILED_FILE
            
                    '#1135
                    frmInfo.Hide
                    frmEmulation.DoShowMe
                    bAlwaysNAG = False
                    
                    ' #3.27xd-start-dev#
                    DoEvents
                    'frmEmulation.check_if_external_device_needs_to_be_started_PUBLIC
                    'DoEvents
                    
                    'frmEmulation.sliderSTEPDELAY.Value = 0 ' make it run in turbo mode!
                    frmEmulation.scrollStepDelay.Value = 0
                    
                    frmEmulation.chkAutoStep.Value = vbChecked ' RUN!
              
     Else
     
                   ' external_RUN sLAST_COMPILED_FILE, Me, True
     
     End If
              

End Sub



' #1187
Private Sub cmdExternal_Click()
On Error Resume Next ' 4.00-Beta-3
    PopupMenu mnuExternal
End Sub
' #1187
Private Sub mnuDebugEXE_Click()
On Error Resume Next ' 4.00-Beta-3
    Dim sReturn As String
    
    sReturn = external_DEBUG(sLAST_COMPILED_FILE, Me)
    
    If sReturn <> "" Then
        mBox frmInfo, "debug.exe: " & sReturn
    End If
    
End Sub
' #1187
Private Sub mnuCommandPrompt_Click()
On Error GoTo err1

    If FileExists(getSysPath & "cmd.exe") Then
    
        ' cmd seems to be more advaced, it supports automatic retyping, probably something else....
        ' it can be closed with a click on [x]
        Call ShellExecute(Me.hwnd, "open", "cmd", "", ExtractFilePath(sLAST_COMPILED_FILE), SW_SHOWDEFAULT)
    
    Else
        ' command seems to be more 8.3
        ' here you must type exit
        Call ShellExecute(Me.hwnd, "open", "command", "", ExtractFilePath(sLAST_COMPILED_FILE), SW_SHOWDEFAULT)
    
    End If
    
    Exit Sub
err1:
    mBox frmInfo, "command prompt: " & LCase(Err.Description)
End Sub


Private Sub mnuExternalRun_Click()
On Error Resume Next ' 4.00-Beta-3
   ' external_RUN sLAST_COMPILED_FILE, Me, False
End Sub



 ' 3.27xo
Public Sub set_current_text_fast(s As String)
On Error GoTo err1
    txtCURRENT.Text = s
    Exit Sub
err1:
    Debug.Print "set_current_text_fast: " & Err.Description
End Sub
 ' 3.27xo
Public Sub set_current_text_cool(s As String)
On Error GoTo err1
    If Me.Visible Then txtCURRENT.SetFocus ' 3.27xp
    txtCURRENT.Text = " " & s & " "
    txtCURRENT.SelStart = Len(frmInfo.txtCURRENT.Text)
    Exit Sub
err1:
    Debug.Print "set_current_text_cool: " & Err.Description
    On Error Resume Next
End Sub
Public Sub set_forcus_from_current_text() ' 3.27xp
On Error Resume Next
    cmdClose.SetFocus
End Sub


Private Sub txtCURRENT_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    ' #400b17-dragdrop-frmInfo#
    On Error Resume Next
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

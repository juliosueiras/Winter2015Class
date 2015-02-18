VERSION 5.00
Begin VB.Form frmDebugLog 
   Caption         =   "debug log - debug.exe emulation"
   ClientHeight    =   3135
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10155
   BeginProperty Font 
      Name            =   "Terminal"
      Size            =   9
      Charset         =   255
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmDebugLog.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   3135
   ScaleWidth      =   10155
   Begin VB.ComboBox comboConcole 
      Height          =   300
      ItemData        =   "frmDebugLog.frx":038A
      Left            =   765
      List            =   "frmDebugLog.frx":038C
      TabIndex        =   0
      Top             =   2190
      Width           =   4455
   End
   Begin VB.CommandButton cmdHelp 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3405
      Picture         =   "frmDebugLog.frx":038E
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   30
      UseMaskColor    =   -1  'True
      Width           =   450
   End
   Begin VB.CommandButton cmdSaveToFile 
      Caption         =   "save to file..."
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1102
      TabIndex        =   3
      Top             =   30
      Width           =   2025
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "clear"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   75
      TabIndex        =   2
      Top             =   30
      Width           =   885
   End
   Begin VB.TextBox txtLog 
      Height          =   1455
      HideSelection   =   0   'False
      Left            =   15
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      Top             =   375
      Width           =   4245
   End
End
Attribute VB_Name = "frmDebugLog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'





Option Explicit

' true only when RF command is executed and we are waiting for new flag commands...
Dim bWAIT_FOR_COMMAND_RF_INPUT As Boolean

' is not empty when R [flag name] is executed and we wait for an updated value....
Dim sWAIT_FOR_COMMAND_RN_INPUT As String


Dim lLAST_D_seg As Long
Dim lLAST_D_offset As Long
Dim lLAST_D_address As Long
Dim bLAST_COMMAND_WAS_D As Boolean
            

Private Sub cmdClear_Click()
On Error Resume Next
    clearLog
    
    comboConcole.SetFocus
End Sub



Private Sub cmdSaveToFile_Click()
On Error GoTo err_save

    Dim sFilename As String
    Dim fNum As Integer
    Dim ts As String
    
'    If frmEmulation.sOpenedExecutable <> "" Then
'        ts = ExtractFilePath(frmEmulation.sOpenedExecutable)
'        If myChDir(ts) Then
'           ComDlg.FileInitialDirD = ts
'        End If
'       ComDlg.FileNameD = CutExtension(ExtractFileName(frmEmulation.sOpenedExecutable)) & ".log"
'    Else
'        ts = App.Path
'        If myChDir(ts) Then
'           ComDlg.FileInitialDirD = ts
'        End If
'       ComDlg.FileNameD = "emu8086.log"
'    End If
'
'    ComDlg.hwndOwner = Me.hwnd
'    ComDlg.Flags = OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT + OFN_PATHMUSTEXIST
'    ComDlg.Filter = "Log files (*.log)|*.log|All Files (*.*)|*.*"
'    ComDlg.DefaultExtD = "log"
'    sFilename = ComDlg.ShowSave
    
    ' 20140415
    sFilename = CutExtension(ExtractFileName(frmEmulation.sOpenedExecutable)) & ".log.txt"
    
    If sFilename <> "" Then
    
        ' delete the old file (if exists):
        If FileExists(sFilename) Then
            DELETE_FILE sFilename
        End If
    
        '--------------------------------
        fNum = FreeFile
        Open sFilename For Binary Shared As fNum

        Put #fNum, , txtLog.Text
        
        ' Close:
        Close fNum
        '--------------------------------
        
    Else
        Debug.Print "Save canceled."
    End If
    
    
        comboConcole.SetFocus
    
    Exit Sub
err_save:
    
    Debug.Print "Error saving log: " & LCase(Err.Description)
    
End Sub

' 1.29#404 Private Sub Form_Activate()
Public Sub DoShowMe()
On Error GoTo err1

    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
    
    If frmDebugLog.txtLog.Text = "" Then ' #327w-log-bug#
        frmDebugLog.do_R_Command
    End If
    
    comboConcole.SetFocus
    
    Exit Sub
err1:
    Debug.Print "frmDebugLog.DoShowMe: " & Err.Description
    Resume Next
    
End Sub










' #400b4-mini-8#
Private Sub Form_Activate()
On Error Resume Next
    If SHOULD_DO_MINI_FIX_8 Then
        If StrComp(txtLog.Font.Name, "Terminal", vbTextCompare) = 0 Then
            If txtLog.Font.Size < 12 Then
                txtLog.Font.Size = 12
                comboConcole.Font.Size = 12
            End If
        End If
    End If
End Sub


Private Sub Form_Load()

On Error GoTo err1

   If Load_from_Lang_File(Me) Then Exit Sub
    

    GetWindowPos Me ' 2.05#551
    GetWindowSize Me  ' 2.05#551
    
    '#1059 Me.Icon = frmMain.Icon
    bKEEP_DEBUG_LOG = True
    
    ' #327w-log-bug# ' frmEmulation.mnuDebugLog.Checked = True ' 1.30

    Dim s As String
    s = get_property("emu8086.ini", "DEBUG_LOG_FONT_FACE", "default")
    If LCase(s) <> "default" Then
        txtLog.FontName = s
        comboConcole.FontName = s
        Me.FontName = s
    End If
    s = get_property("emu8086.ini", "DEBUG_LOG_FONT_SIZE", "default")
    If LCase(s) <> "default" Then
        Dim i As Integer
        i = Val(s)
        If i > 3 Then
            txtLog.FontSize = i
            comboConcole.FontSize = i
            Me.FontSize = i
        End If
    End If
    
    
    
    
    DoEvents
        
    Dim singleH As Single
    ' random text.... random length, we just measure the text height.
    singleH = Me.TextHeight("HEIGHT TEST. lazy dog jumps over the red fox qwertyuiop[asdfghjkll;'\zxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM")
    If comboConcole.Height < singleH Then
        comboConcole.Height = singleH
    End If
    
    
    
    
    
    
    
    bWAIT_FOR_COMMAND_RF_INPUT = False
    sWAIT_FOR_COMMAND_RN_INPUT = ""
    
    
    clearLog  ' 3.27w    it also resets some important vars...
    
    
    
    Exit Sub
err1:
    Debug.Print "frmDebug_Load: " & Err.Description
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

On Error Resume Next ' 4.00-Beta-3

'    If UnloadMode = vbFormControlMenu Then
'            Cancel = 1
'            Me.Hide
'    End If

    ' I decided to close this window completely,
    ' because keeping debug takes a lot (!) of
    ' processing time!
    bKEEP_DEBUG_LOG = False
    
    ' #327w-log-bug# ' frmEmulation.mnuDebugLog.Checked = False ' 1.30
End Sub

Private Sub Form_Resize()
On Error GoTo err_resize
    
    txtLog.Left = 0
    txtLog.Width = Me.ScaleWidth
    txtLog.Height = Me.ScaleHeight - txtLog.Top - comboConcole.Height
    
    comboConcole.Left = 0
    comboConcole.Top = txtLog.Height + txtLog.Top
    comboConcole.Width = Me.ScaleWidth
    
    Exit Sub
    
err_resize:
    Debug.Print "Error on frmDebugLog_Resize: " & LCase(Err.Description)
    Resume Next
    
End Sub

Private Sub add_to_log(ByRef sInput As String)
On Error GoTo err1

Dim lSize As Long

lSize = Len(txtLog.Text)

' prevent too large log...
If lSize > 32000 Then
    '3.27w ' txtLog.Text = ""
    '3.27w ' lSize = 0
    
    ' 3.27w ' I think it's better to just cut a few upper lines...
    
    Dim L As Long
    L = InStr(200, txtLog.Text, "AX=")
    If L > 0 Then
        txtLog.Text = Mid(txtLog.Text, L)
    Else
        ' something wrong....
        txtLog.Text = ""
    End If
    
    
    lSize = Len(txtLog.Text)
End If

txtLog.SelStart = lSize

txtLog.Text = txtLog.Text & sInput & vbNewLine ' 3.27w & vbNewLine

txtLog.SelStart = lSize
txtLog.SelLength = Len(sInput)



Exit Sub

err1:
    Debug.Print "add_to_log: " & Err.Description

End Sub


' #1106
' used for step-back
Public Sub remove_last_entry_from_log()
On Error GoTo err1
    
    Dim lIndex As Long
    
    lIndex = InStrRev(txtLog.Text, "AX=")
    
    If lIndex > 1 Then
        txtLog.Text = Mid(txtLog.Text, 1, lIndex - 1)
    Else
        txtLog.Text = ""
    End If
    
    ' 3.27w
    txtLog.SelStart = Len(txtLog.Text)
    
    
    Exit Sub
err1:
    Debug.Print "remove_last_entry_from_log: " & LCase(Err.Description)
End Sub




' show all registers
' note: do_R_Command_with_parameters() is used to process r command with parameters!
Public Sub do_R_Command()
    
On Error GoTo err_make_make_log

    Dim sData As String
    Dim s1 As String
    Dim s2 As String
    Dim L1 As Long ' 4.00 Integer
    Dim iSpaceNum As Integer
    
    With frmEmulation

    ' 3.27w
    ' here we fix a possible bug, because user may select another item,
    ' must select current location to make it always work!
    frmEmulation.mnuSelect_lines_at_CS_IP_Click_PUBLIC
    

' #400-dissasembly#
''''    i1 = .lstDECODED.ListIndex
''''
''''    If i1 < 0 Then Exit Sub ' v3.27r avoid errors, to keep the immediate window clean :)
    If lTOTAL_DIS_LINES = 0 Then Exit Sub ' #400-dissasembly#
    
        
    L1 = l_BLUE_Selected_Disassembly_LineIndex
        

    ' make correct space for disassebled instruction:
    '
    s1 = .txtCS.Text & ":" & .txtIP.Text & " " & getActualByteForLine(L1)

    ' default position:
    '   DS=0B56  ES=0B56  SS=0B56
    '                           ^ here
    iSpaceNum = 24 - Len(s1)
          
    If iSpaceNum < 1 Then iSpaceNum = 2 ' just in case
          
    Dim sDISASM As String
    sDISASM = get_DISASSEMBLED_LINE(L1)
          
    s2 = String(iSpaceNum, " ") & sDISASM ' #400-dissasembly# ' .lstDECODED.List(i1)
    
    ' #327w-bios-di#
    ' show all bytes that make this instruction
    If sDISASM = "BIOS DI" Then
        s1 = s1 & getActualByteForLine(L1 + 1)
    End If
    
    
    ''''''''''''''''''''''''''''''''''''''''''''''''''''
    
    
    sData = vbNewLine & "AX=" & .txtAH.Text & .txtAL.Text & _
          "  BX=" & .txtBH.Text & .txtBL.Text & _
          "  CX=" & .txtCH.Text & .txtCL.Text & _
          "  DX=" & .txtDH.Text & .txtDL.Text & _
          "  SP=" & .txtSP.Text & _
          "  BP=" & .txtBP.Text & _
          "  SI=" & .txtSI.Text & _
          "  DI=" & .txtDI.Text & vbNewLine & _
            "DS=" & .txtDS.Text & _
          "  ES=" & .txtES.Text & _
          "  SS=" & .txtSS.Text & _
          "  CS=" & .txtCS.Text & _
          "  IP=" & .txtIP.Text & "   " & getFlags() & vbNewLine & _
          s1 & s2 & get_OPERATING_ADDRESS_IF_ANY(s2)


    End With
    
    add_to_log sData

    Exit Sub
err_make_make_log:
    Debug.Print "Error on make_make_log: " & LCase(Err.Description)
End Sub




' sParams is already trimed and lowercased, but we do it again . jic.
Sub do_R_Command_with_parameters(sParams As String)
    On Error GoTo err1:
    
    Dim s As String
    
    
    s = LCase(Trim(sParams))
    
    
    
    If Len(s) = 2 Then
        sWAIT_FOR_COMMAND_RN_INPUT = s
        comboConcole.Text = ":"
        comboConcole.SelStart = Len(comboConcole.Text)
    ElseIf Len(s) = 1 Then
        sWAIT_FOR_COMMAND_RN_INPUT = ""
        add_to_log "   error"
        Exit Sub ' EXIT !!!!
    Else ' > 2
        ' unique to the emulator, set value to the register with single command :)
        sWAIT_FOR_COMMAND_RN_INPUT = Mid(s, 1, 2)
        s = Mid(s, 3)
        set_register_for_RN_command ":" & s
        Exit Sub ' EXIT !!!!
    End If
    
    
    
    
    Select Case sWAIT_FOR_COMMAND_RN_INPUT
    Case "ax"
         add_to_log UCase(sParams) & " " & siHEX(to16bit_SIGNED(frmEmulation.get_AL, frmEmulation.get_AH))
    Case "bx"
        add_to_log UCase(sParams) & " " & siHEX(to16bit_SIGNED(frmEmulation.get_BL, frmEmulation.get_BH))
    Case "cx"
        add_to_log UCase(sParams) & " " & siHEX(to16bit_SIGNED(frmEmulation.get_CL, frmEmulation.get_CH))
    Case "dx"
        add_to_log UCase(sParams) & " " & siHEX(to16bit_SIGNED(frmEmulation.get_DL, frmEmulation.get_DH))
    Case "cs"
        add_to_log UCase(sParams) & " " & siHEX(frmEmulation.get_CS)
    Case "ip"
        add_to_log UCase(sParams) & " " & siHEX(frmEmulation.get_IP)
    Case "ss"
        add_to_log UCase(sParams) & " " & siHEX(frmEmulation.get_SS)
    Case "sp"
        add_to_log UCase(sParams) & " " & siHEX(frmEmulation.get_SP)
    Case "bp"
        add_to_log UCase(sParams) & " " & siHEX(frmEmulation.get_BP)
    Case "si"
        add_to_log UCase(sParams) & " " & siHEX(frmEmulation.get_SI)
    Case "di"
        add_to_log UCase(sParams) & " " & siHEX(frmEmulation.get_DI)
    Case "es"
        add_to_log UCase(sParams) & " " & siHEX(frmEmulation.get_ES)
    Case "ds"
        add_to_log UCase(sParams) & " " & siHEX(frmEmulation.get_DS)
    
    ' ---------- al, ah, bl, bh... etc are unique to the emulator :)
    Case "al"
        add_to_log UCase(sParams) & " " & sbHEX(frmEmulation.get_AL)
    Case "ah"
        add_to_log UCase(sParams) & " " & sbHEX(frmEmulation.get_AH)
    Case "bl"
        add_to_log UCase(sParams) & " " & sbHEX(frmEmulation.get_BL)
    Case "bh"
        add_to_log UCase(sParams) & " " & sbHEX(frmEmulation.get_BH)
    Case "cl"
        add_to_log UCase(sParams) & " " & sbHEX(frmEmulation.get_CL)
    Case "ch"
        add_to_log UCase(sParams) & " " & sbHEX(frmEmulation.get_CH)
    Case "dl"
        add_to_log UCase(sParams) & " " & sbHEX(frmEmulation.get_DL)
    Case "dh"
        add_to_log UCase(sParams) & " " & sbHEX(frmEmulation.get_DH)
    
    
    Case Else
        add_to_log "   error"
        sWAIT_FOR_COMMAND_RN_INPUT = ""
        comboConcole.Text = ""
    End Select
        
    Exit Sub
err1:
    Debug.Print "err: do_R_Command_with_parameters:  " & Err.Description
    sWAIT_FOR_COMMAND_RN_INPUT = ""
    comboConcole.Text = ""
End Sub



Sub set_register_for_RN_command(ByVal sParams As String)
On Error GoTo err1
    
    
    add_to_log sParams  ' 3.27xa
    
    
    sParams = LCase(Trim(sParams))
    
    If Len(sParams) <= 1 Then Exit Sub ' EXIT !
    
    If Mid(sParams, 1, 1) = ":" Then sParams = Mid(sParams, 2)
    
    Dim i As Integer
    
    bWAS_ERROR_ON_LAST_EVAL_EXPR = False
    i = evalExpr(sParams, True)
    If bWAS_ERROR_ON_LAST_EVAL_EXPR Then
        bWAS_ERROR_ON_LAST_EVAL_EXPR = False
        add_to_log "    ^ error"
        sWAIT_FOR_COMMAND_RN_INPUT = ""
        Exit Sub ' EXIT !!!!!
    End If
    
    
    Select Case sWAIT_FOR_COMMAND_RN_INPUT
    
    Case "ax"
        frmEmulation.set_AX i
    Case "bx"
        frmEmulation.set_BX i
    Case "cx"
        frmEmulation.set_CX i
    Case "dx"
        frmEmulation.set_DX i
    Case "cs"
        frmEmulation.set_CS i
    Case "ip"
        frmEmulation.set_IP i
    Case "ss"
        frmEmulation.set_SS i
    Case "sp"
        frmEmulation.set_SP i
    Case "bp"
        frmEmulation.set_BP i
    Case "si"
        frmEmulation.set_SI i
    Case "di"
        frmEmulation.set_DI i
    Case "es"
        frmEmulation.set_ES i
    Case "ds"
        frmEmulation.set_DS i
    
    ' ---------- al, ah, bl, bh... etc are unique to the emulator :)
    Case "al"
        frmEmulation.set_AL to_unsigned_byte(i)
    Case "ah"
        frmEmulation.set_AH to_unsigned_byte(i)
    Case "bl"
        frmEmulation.set_BL to_unsigned_byte(i)
    Case "bh"
        frmEmulation.set_BH to_unsigned_byte(i)
    Case "cl"
        frmEmulation.set_CL to_unsigned_byte(i)
    Case "ch"
        frmEmulation.set_CH to_unsigned_byte(i)
    Case "dl"
        frmEmulation.set_DL to_unsigned_byte(i)
    Case "dh"
        frmEmulation.set_DH to_unsigned_byte(i)
    
    
    Case Else
        add_to_log "    ^ br error"
        Debug.Print "brrr... cannot be #327xa: " & sWAIT_FOR_COMMAND_RN_INPUT
        sWAIT_FOR_COMMAND_RN_INPUT = ""
    End Select
    
    sWAIT_FOR_COMMAND_RN_INPUT = ""
    
    
    frmEmulation.show_Registers_PUBLIC
    
    Exit Sub
err1:
    add_to_log "    ^ br error"
    Debug.Print "err: set_register_for_RN_command:" & Err.Description
    sWAIT_FOR_COMMAND_RN_INPUT = ""
End Sub














Private Function getFlags() As String

On Error Resume Next ' 4.00-Beta-3

' test '    getFlags = "O=1 D=1 I=0 Z=1 A=1 P=1 C=1"

    Dim sR As String
    

    If frmFLAGS.cbOF.ListIndex = 1 Then
        sR = "OV"
    Else
        sR = "NV"
    End If
    
    If frmFLAGS.cbDF.ListIndex = 1 Then
        sR = sR & " DN"
    Else
        sR = sR & " UP"
    End If
   
    If frmFLAGS.cbIF.ListIndex = 1 Then
        sR = sR & " EI"
    Else
        sR = sR & " DI"
    End If

    If frmFLAGS.cbSF.ListIndex = 1 Then
        sR = sR & " NG"
    Else
        sR = sR & " PL"
    End If

    If frmFLAGS.cbZF.ListIndex = 1 Then
        sR = sR & " ZR"
    Else
        sR = sR & " NZ"
    End If
    
    If frmFLAGS.cbAF.ListIndex = 1 Then
        sR = sR & " AC"
    Else
        sR = sR & " NA"
    End If
    
    If frmFLAGS.cbPF.ListIndex = 1 Then
        sR = sR & " PE"
    Else
        sR = sR & " PO"
    End If
    
    If frmFLAGS.cbCF.ListIndex = 1 Then
        sR = sR & " CY"
    Else
        sR = sR & " NC"
    End If
    
    getFlags = sR
End Function

Public Sub clearLog()

On Error Resume Next ' 4.00-Beta-3

    txtLog.Text = ""
    comboConcole.Text = ""
    
    lLAST_D_seg = -1
    lLAST_D_offset = -1
    lLAST_D_address = -1
    
    bWAIT_FOR_COMMAND_RF_INPUT = False
    sWAIT_FOR_COMMAND_RN_INPUT = ""
    
End Sub


' 1.23
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

On Error Resume Next ' 4.00-Beta-3

    frmEmulation.process_HotKey KeyCode, Shift
    
    If KeyCode = vbKeyEscape Then
        bSTOP_frmDEBUGLOG = True
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)

On Error Resume Next ' 4.00-Beta-3

    SaveWindowState Me ' 2.05#551
    
    bSTOP_frmDEBUGLOG = True
End Sub


Private Sub cmdHelp_Click()
    On Error GoTo err1
    
    open_HTML_FILE Me, "debug.html"
    
    comboConcole.SetFocus
    
    Exit Sub
err1:
    Debug.Print "cmdHelp_Click"
End Sub

Private Sub comboConcole_KeyDown(KeyCode As Integer, Shift As Integer)
    On Error GoTo err1
            
    ' COMMANDS ARE PROCESSED ON comboConcole_KeyPress()
            
    If KeyCode = 32 And Shift = 2 Then
        
        Debug.Print "TODO: should show a drop down list...."
        
        ' however I don't even know how to ignore it from being typed yet...
        
        
    ' 4.00-Beta-3 simulate dos
    ElseIf KeyCode = 39 And Shift = 0 And Len(comboConcole.Text) = 0 Then ' right
       comboConcole.Text = comboConcole.List(0)
       comboConcole.SelLength = 0
       comboConcole.SelStart = Len(comboConcole.Text)
' seems to complicated
''''    ElseIf KeyCode = 37 And Shift = 0 Then ' left
''''       comboConcole.Text = Mid(comboConcole.Text, 1, Len(comboConcole.Text) - 1)
''''       DoEvents
''''       comboConcole.SelStart = Len(comboConcole.Text) + 2
''''
    End If
    
   ' Debug.Print "DD:" & Shift, KeyCode
    
    Exit Sub
err1:
    Debug.Print "comboConcole_KeyDown: " & Err.Description
End Sub


Private Sub comboConcole_KeyPress(KeyAscii As Integer)
On Error GoTo err1

    If KeyAscii = 13 Then
    
        KeyAscii = 0 ' eat key
        
        Dim s As String
        s = Trim(comboConcole.Text)

       
       If s = "" Then
             ' not required.... let it just skip the line like original debug.exe
            comboConcole.Text = ""
            add_to_log ""
       Else
            comboConcole.Text = ""
            
            do_debug_command_emulation s
            
            comboConcole.AddItem s, 0
            If comboConcole.ListCount > 10 Then
                comboConcole.RemoveItem comboConcole.ListCount - 1
            End If
        

        End If

    End If

   '  Debug.Print "KeyAscii: " & KeyAscii

    s = ""
    Exit Sub
err1:
    Debug.Print "comboConcole_KeyPress: " & Err.Description
End Sub


Public Sub show_current_command(sCommand As String)
On Error GoTo err1


    add_to_log "-" & sCommand
    
Exit Sub
err1:
    Debug.Print "show_current_command: " & Err.Description
End Sub

Private Sub do_debug_command_emulation(sCommand As String)
On Error GoTo err1
' Debug.Print "TODO command: " & sCommand


If bLAST_COMMAND_WAS_D Then
    If endsWith(txtLog.Text, vbNewLine & vbNewLine) Then
        txtLog.Text = Mid(txtLog.Text, 1, Len(txtLog.Text) - 2) ' cut out last cr-lf to make it look like real debug.exe :)
    End If
    bLAST_COMMAND_WAS_D = False
End If



bSTOP_frmDEBUGLOG = False



If bWAIT_FOR_COMMAND_RF_INPUT Then
    bWAIT_FOR_COMMAND_RF_INPUT = False
    set_flags_for_RF_command (sCommand)
    Exit Sub
End If


If sWAIT_FOR_COMMAND_RN_INPUT <> "" Then
    ' NOT BEFORE WE PROCESS IT! ' sWAIT_FOR_COMMAND_RN_INPUT = ""
    set_register_for_RN_command (sCommand)
    Exit Sub
End If






show_current_command sCommand







Dim sFirstChar As String
Dim sParams As String

sCommand = Replace(sCommand, ",", " ")  ' for debug.exe  ',' = ' '
sCommand = Trim(sCommand)

sFirstChar = LCase(Mid(sCommand, 1, 1))    ' LOWER CASE EVERYTHING !!!!!!!!!!!!!!!!!!!!
sParams = Trim(LCase(Mid(sCommand, 2)))


'==================== get parameters (if any) for t and p
Dim lEqu As Long
Dim sAdr As String
Dim lSecParam As Long
Dim sRepeat As String
sAdr = ""
sRepeat = ""
If sParams <> "" Then
    lEqu = InStr(1, sParams, "=")
    If lEqu > 0 Then
        lSecParam = InStr(lEqu, sParams, " ")
        If lSecParam > 0 Then
            sAdr = Mid(sParams, lEqu + 1, lSecParam - lEqu - 1)
            sRepeat = Trim(Mid(sParams, lSecParam + 1))
        Else
            sAdr = Mid(sParams, lEqu + 1)
        End If
    Else
        sAdr = ""
        sRepeat = sParams
    End If
End If
Dim lRepeat As Long
If sRepeat = "" Then
    lRepeat = 0
Else
    lRepeat = Val("&H" & sRepeat) - 1
End If
'========================================================

' when lRepeat=0 we will make 1 step. when its 1 we will make 2 steps...
' currently we are not generating an error on t0 or p0.


Select Case sFirstChar

Case "c"
    If sCommand = "cls" Then
        txtLog.Text = "" ' :)
    Else
        do_C_Command sParams
    End If
    

Case "d"
    do_D_Command sParams

Case "h"
    do_H_Command sParams

Case "i"
    do_I_command sParams
    
Case "o"
    do_O_command sParams

Case "t"

    If sAdr <> "" Then frmEmulation.set_IP Val("&h" & sAdr)
    
    Do While lRepeat >= 0
        frmEmulation.mnuSingleStep_Click_PUBLIC
        DoEvents
        If bSTOP_frmDEBUGLOG Then Exit Sub
        lRepeat = lRepeat - 1
    Loop
    
Case "p"
    If sAdr <> "" Then frmEmulation.set_IP Val("&h" & sAdr)
    
    Do While lRepeat >= 0
        DoEvents
        If bSTOP_frmDEBUGLOG Then Exit Sub
    
        If Not bDO_STEP_OVER_PROCEDURE Then        ' just wait...
            frmEmulation.mnuStepOver_Click_PUBLIC
            lRepeat = lRepeat - 1
        End If
        
        ' Debug.Print lRepeat, bSTOP_frmDEBUGLOG
        
    Loop
        
Case "r"
    If sParams = "f" Then
       comboConcole.Text = getFlags() & "  -"
       comboConcole.SelStart = Len(comboConcole.Text)
       bWAIT_FOR_COMMAND_RF_INPUT = True
    ElseIf sParams <> "" Then ' #327xa-r-improve#
        do_R_Command_with_parameters sParams
    Else
        do_R_Command
    End If
    
    
Case "q"
    frmEmulation.DoShowMe
    Me.Hide ' temporary, until real unload.
    frmEmulation.timer_CLOSE_frmDebugLog.Enabled = True  ' real unload, outside of this module to avoid return here.
    
Case Else

    ' 4.00-Beta-5 secret window
    If StrComp(sCommand, "v:DTA", vbTextCompare) = 0 Then
        frmDOS_FILE.Show
    Else
        add_to_log "sorry this command isn't supported yet. select help->check for an update."  ' " ^ error: unknown command."
    End If
     
End Select


Exit Sub
err1:
    add_to_log " ^ error: " & LCase(Err.Description)
End Sub



' #327w-more-debug-like#
Private Function get_OPERATING_ADDRESS_IF_ANY(sInstruction As String) As String
    On Error GoTo err1
    
    Dim s1 As String
    Dim s2 As String
    Dim sEA As String
    
    s1 = Trim(getToken(sInstruction, 0, ","))
    ' first chars before space are instruction, cut them out:
    Dim L As Long
    L = InStr(1, s1, " ")
    s1 = Trim((Mid(s1, L + 1)))
    
    s2 = Trim(getToken(sInstruction, 1, ","))
    
    
    
    If InStr(1, s1, "[") > 0 Then
        sEA = s1
    ElseIf InStr(1, s2, "[") > 0 Then
        sEA = s2
    Else
        sEA = ""
    End If
    
    
    If sEA <> "" Then
        Dim sOutput As String
        
        sOutput = frmEmulation.get_SEGMENT_DISPLACEMENT & ":" & get_offset_from_registers_memory_combination(sEA)
        
        Dim bReadWord As Boolean
        bReadWord = False
        
        ' #400b20-w.-ptr-UPPER_CASE_DOES_NOT_WORK#   -   , vbTextCompare  x2
        If InStr(1, s1, "w.", vbTextCompare) > 0 Or InStr(1, s2, "w.", vbTextCompare) > 0 Then ' #327xq-call-dw-debug#
            If InStr(1, s1, "dw.", vbTextCompare) > 0 Or InStr(1, s2, "dw.", vbTextCompare) > 0 Then ' originally it is Dw.
                bReadWord = True
            End If
        Else
            If s1 <> sEA Then ' first operand is a register....
                 If is_rw(s1) <> -1 Then
                     bReadWord = True
                 End If
            Else              ' second operand is a register...
                 If is_rw(s2) <> -1 Then
                     bReadWord = True
                 End If
            End If
        End If
        
        ' read the value at operating address
        sOutput = sOutput & "=" & read_value_from_debug_style_ea(sOutput, bReadWord) & "h"  ' 3.27w (unlike debug.exe, I decided to add hex suffix).

        
        ' add two tabs....
        get_OPERATING_ADDRESS_IF_ANY = vbTab & vbTab & sOutput
        
    Else
        get_OPERATING_ADDRESS_IF_ANY = ""
    End If
    
    
    
    
    
    
    
    
    
    Exit Function
err1:
    Debug.Print "get_OPERATING_ADDRESS_IF_ANY: " & Err.Description
    get_OPERATING_ADDRESS_IF_ANY = ""
End Function


' returns HEX byte or word STRING !!!
' input address must be:
' DS:0000
' or
' CS:/ES:/SS:XXXX
' hex value must be exaclty 4 digits
' segment prefix must be present and it must be upper cased (as returned by frmEmulation.get_SEGMENT_DISPLACEMENT)
' no other segment prefixes are allowed!
Private Function read_value_from_debug_style_ea(sAddr As String, bReadWord As Boolean) As String
On Error GoTo err1
    
    Dim sSegment As String
    Dim sOffset As String
    
    ' 3.27w  - ucase is probably is not required for this function.
    
    sSegment = UCase(Mid(sAddr, 1, 2)) ' before :
    sOffset = UCase(Mid(sAddr, 4))     ' after :
    
    Dim lPhysicalAddr As Long
    
    Select Case sSegment
    Case "DS"
        lPhysicalAddr = to_unsigned_long(frmEmulation.get_DS)
    Case "CS"
        lPhysicalAddr = to_unsigned_long(frmEmulation.get_CS)
    Case "ES"
        lPhysicalAddr = to_unsigned_long(frmEmulation.get_ES)
    Case "SS"
        lPhysicalAddr = to_unsigned_long(frmEmulation.get_SS)
    Case Else
        Debug.Print "brr.... something wrong only fixed CS:/DS:/ES:/SS: is allowed as a valid prefix for read_value_from_debug_style_ea()"
        lPhysicalAddr = 0
    End Select

    
    lPhysicalAddr = lPhysicalAddr * &H10
    lPhysicalAddr = lPhysicalAddr + to_unsigned_long(Val("&H" & sOffset))      ' 4 letter hex number is a singed integer in vb.
    
    
    If bReadWord Then
        read_value_from_debug_style_ea = make_min_len(Hex(RAM.mREAD_WORD(lPhysicalAddr)), 4, "0")
    Else
        read_value_from_debug_style_ea = make_min_len(Hex(RAM.mREAD_BYTE(lPhysicalAddr)), 2, "0")
    End If
    
    

Exit Function
err1:
    read_value_from_debug_style_ea = "0"
    Debug.Print "read_value_from_debug_style_ea: " & Err.Description
End Function

















' receives string such as:
'  NV UP EI PL NZ NA PO NC  -cy
' set's flags accordingly...
Private Sub set_flags_for_RF_command(s As String)
On Error GoTo err1
    
    
    
    add_to_log s  ' 3.27xa
    
    
    
    Dim L As Long
    
    L = InStr(1, s, "-")
    
    If L <= 0 Then
        ' smth wrong...
        L = 0
        Debug.Print "probably flags were deleted from the command..."
    End If
    
    
    Dim sNewSettings As String
    sNewSettings = UCase(Trim(Mid(s, L + 1)))
    sNewSettings = Replace(sNewSettings, " ", "")
    sNewSettings = Replace(sNewSettings, vbTab, "")
    
    
    
    
    
    
'=======================================================================
    ' each time get two chars only:
    L = 1
    Dim sR As String
        
next_2_chars:
        sR = Mid(sNewSettings, L, 2)
        L = L + 2
        If sR = "" Or L >= 79 Then GoTo stop_set_flags
        
           Select Case sR

           Case "OV"
                frmFLAGS.cbOF.ListIndex = 1
           Case "NV"
                frmFLAGS.cbOF.ListIndex = 0

           Case "DN"
                frmFLAGS.cbDF.ListIndex = 1
           Case "UP"
                frmFLAGS.cbDF.ListIndex = 0
       
           Case "EI"
                frmFLAGS.cbIF.ListIndex = 1
           Case "DI"
                frmFLAGS.cbIF.ListIndex = 0
    
           Case "NG"
                frmFLAGS.cbSF.ListIndex = 1
           Case "PL"
                frmFLAGS.cbSF.ListIndex = 0
    
           Case "ZR"
                frmFLAGS.cbZF.ListIndex = 1
           Case "NZ"
                frmFLAGS.cbZF.ListIndex = 0

           Case "AC"
                frmFLAGS.cbAF.ListIndex = 1
           Case "NA"
                frmFLAGS.cbAF.ListIndex = 0

           Case "PE"
                frmFLAGS.cbPF.ListIndex = 1
           Case "PO"
                frmFLAGS.cbPF.ListIndex = 0

           Case "CY"
                frmFLAGS.cbCF.ListIndex = 1
           Case "NC"
                frmFLAGS.cbCF.ListIndex = 0

           Case Else
                add_to_log "error: not valid flag state: " & sR
           End Select
        
        
        GoTo next_2_chars
stop_set_flags:
'=======================================================================
    
    
    
    
    
    
    
Exit Sub
err1:
    Debug.Print "set_flags_for_RF_command: " & Err.Description
End Sub



Private Sub do_D_Command(ByVal sParam As String)
 On Error GoTo err1
    
    bLAST_COMMAND_WAS_D = True
    
    Dim lAddr As Long
    Dim lSEG As Long
    Dim lOFFSET As Long
    

    ' #400b3-impr-debug1#
    ' allow "d l 100"  (without address)
    If startsWith(sParam, "L ") Then
        sParam = " " & sParam
    End If
    


    ' #400b3-impr-debug1#
    Dim lLength As Long
    Dim L As Long
    L = InStr(1, sParam, " l ", vbTextCompare)
    If L > 0 Then
        lLength = Val("&H" & Trim(Mid(sParam, L + 3)))
        sParam = Trim(Mid(sParam, 1, L - 1))
    Else
        lLength = 128 ' DEFAULT!
    End If


    
    If sParam <> "" Then
        ' #327xa-allow-numeric-seg-for-d# If InStr(1, sParam, ":") <= 0 Then sParam = "CS:" & sParam
        lAddr = get_physical_address_from_hex_ea(sParam) ' returns -1 on error.
    Else
        lAddr = -2
    End If
    
    
    If lAddr = -1 Then ' error...
        GoTo err2
    ElseIf lAddr <= -2 Then  ' no parameters
        If lLAST_D_seg = -1 Then
            ' it seems that real debug.exe, set's loading address as default.
            ' but I like my style...
            '  #debug.exe-style-improvement-1#
            lSEG = to_unsigned_long(frmEmulation.get_CS)
            lOFFSET = to_unsigned_long(frmEmulation.get_IP)
            lAddr = lSEG
            lAddr = lAddr * &H10
            lAddr = lAddr + lOFFSET
        Else
            ' continue dump from previous D command...
            lSEG = lLAST_D_seg
            lOFFSET = lLAST_D_offset
            lAddr = lLAST_D_address
        End If
    Else ' ok lAddr >= 0
        lSEG = get_segment_address_from_hex_ea(sParam)
        lOFFSET = get_offset_address_from_hex_ea(sParam)
    End If


    
    ' 4.00
    ' PARAMETERS ARE SENT BY REF!!! MODIFIES!!! FOR THE NEXT D!
    add_to_log get_MEMORY_DUMP_BYREF(lSEG, lOFFSET, lAddr, lLength)
    
    
    ' for next D without parameters
    lLAST_D_seg = lSEG
    lLAST_D_offset = lOFFSET
    lLAST_D_address = lAddr
    
    
    

Exit Sub
err1:
    add_to_log "    error: " & LCase(Err.Description)
    Exit Sub
err2:
    add_to_log "   error"
End Sub

' #400b11-debug-h#
Private Sub do_H_Command(ByVal sParam As String)
On Error GoTo err1
 
    Dim sParam1 As String
    Dim sParam2 As String

    sParam1 = getToken(sParam, 0, " ")
    sParam2 = getToken(sParam, 1, " ")
 
 
    Dim sResult As String
    Dim L1 As Long
    Dim L2 As Long
    
    L1 = Val("&H" & sParam1)
    L2 = Val("&H" & sParam2)
 
    add_to_log sHEX(L1 + L2) & " " & sHEX(L1 - L2)
  
Exit Sub
err1:
    add_to_log "    error: " & LCase(Err.Description)
    Exit Sub
End Sub

Private Sub do_C_Command(ByVal sParam As String)
 On Error GoTo err1

    
    
    Dim lAddr_1 As Long
    Dim lSEG_1 As Long
    Dim lOFFSET_1 As Long
    
    
    Dim lAddr_2 As Long
    Dim lSEG_2 As Long
    Dim lOFFSET_2 As Long
    
    
    Dim sParam_ADDR1 As String
    Dim sParam2 As String
    Dim sParam3 As String
    Dim sParam_ADDR2 As String
    sParam_ADDR1 = getToken(sParam, 0, " ")
    sParam2 = getToken(sParam, 1, " ")
    sParam3 = getToken(sParam, 2, " ")
    sParam_ADDR2 = getToken(sParam, 3, " ")
    
    
    If Len(sParam2) = 0 Or sParam2 = Chr(10) Then GoTo err2

    Debug.Print Asc(sParam2)
    
    Dim lLength As Long
    If StrComp(sParam2, "L", vbTextCompare) = 0 Then
        ' prefered syntax:  c 100 l 2 233
        lLength = Val("&H" & sParam3)
    Else
        ' short syntax:     c 100 233
        '                    (compare 16 bytes by default).
        sParam_ADDR2 = sParam2
        lLength = 8 ' DEFAULT!
    End If
    
    
    
    
    If sParam_ADDR1 <> "" Then
        lAddr_1 = get_physical_address_from_hex_ea(sParam_ADDR1) ' returns -1 on error.
    Else
        lAddr_1 = -1
    End If
    If lAddr_1 = -1 Then ' error... or no parameters
        GoTo err2
    Else
        lSEG_1 = get_segment_address_from_hex_ea(sParam_ADDR1)
        lOFFSET_1 = get_offset_address_from_hex_ea(sParam_ADDR1)
    End If



    If sParam_ADDR2 <> "" Then
        lAddr_2 = get_physical_address_from_hex_ea(sParam_ADDR2) ' returns -1 on error.
    Else
        lAddr_2 = -1
    End If
    If lAddr_2 = -1 Then ' error... or no parameters
        GoTo err2
    Else
        lSEG_2 = get_segment_address_from_hex_ea(sParam_ADDR2)
        lOFFSET_2 = get_offset_address_from_hex_ea(sParam_ADDR2)
    End If



    add_to_log get_compare_bytes(lSEG_1, lOFFSET_1, lAddr_1, lSEG_2, lOFFSET_2, lAddr_2, lLength)
   
    

Exit Sub
err1:
    add_to_log "    error: " & LCase(Err.Description)
    Exit Sub
err2:
    add_to_log "   error"
End Sub






' compare address 1 with address 2 by given length
' returns only those bytes that are different.
' if everything is equal returns nothing!
' MAXIMUM LENGHT IS 1024 bytes!
' all parameters are ByVal, does not change anything (however, it would be possible to make it do next c without params... but I doubt it would be much use).
Function get_compare_bytes(ByVal lSEG_1 As Long, ByVal lOFFSET_1 As Long, ByVal lAddr_1 As Long, ByVal lSEG_2 As Long, ByVal lOFFSET_2 As Long, ByVal lAddr_2 As Long, ByVal lLength As Long) As String
On Error GoTo err1

    

    If lLength > 1024 Then
        get_compare_bytes = "max L: 400 (1024 bytes)"
        Exit Function
    End If
    
    
    Dim sResult As String
    sResult = ""
    
    Dim L As Long
    
    For L = 0 To lLength - 1
        Dim b1 As Byte
        Dim b2 As Byte
        b1 = RAM.mREAD_BYTE(lAddr_1)
        b2 = RAM.mREAD_BYTE(lAddr_2)
        
        If b1 <> b2 Then
            Dim s As String
            s = doubleWordHex(lSEG_1, lOFFSET_1) & "  " & byteHEX(b1) & "  " & byteHEX(b2) & "  " & doubleWordHex(lSEG_2, lOFFSET_2)
            sResult = sResult & s & vbNewLine
        End If
        
        lAddr_1 = lAddr_1 + 1
        lAddr_2 = lAddr_2 + 1
        
        increase_seg_offset_by_REF lSEG_1, lOFFSET_1
        increase_seg_offset_by_REF lSEG_2, lOFFSET_2
    Next L


    If endsWith(sResult, vbNewLine) Then
        sResult = Mid(sResult, 1, Len(sResult) - 2)
    End If
    
    
    If Len(sResult) = 0 Then
        get_compare_bytes = "all bytes are equal"
    Else
        get_compare_bytes = sResult
    End If

Exit Function
err1:
    add_to_log "   error"
End Function


















Sub do_I_command(sParams As String)
On Error GoTo err1
    Dim s As String
    s = Trim(LCase(sParams))
    
    If Mid(s, 1, 1) = "w" Then
        s = Trim(Mid(s, 2)) ' remove w
        add_to_log siHEX(io.READ_IO_WORD(Val("&h" & s)))
    Else
        add_to_log sbHEX(io.READ_IO_BYTE(Val("&h" & s)))
    End If
Exit Sub
err1:
add_to_log "    error: " & LCase(Err.Description)
End Sub


Sub do_O_command(sParams As String)
On Error GoTo err1

    Dim s As String
    Dim p1 As String
    Dim p2 As String
    Dim k As Long
    Dim bWORD As Boolean
    
    s = Trim(LCase(sParams))
    
    If Mid(s, 1, 1) = "w" Then
        bWORD = True
        s = Trim(Mid(s, 2)) ' remove w.
    Else
        bWORD = False
    End If
    
    k = InStr(1, s, " ")
    
    If k <= 0 Then
        add_to_log "    error: " & cMT("not enough parameters")
        Exit Sub ' EXIT!
    Else
        p1 = Trim(Mid(s, 1, k - 1))
        p2 = Trim(Mid(s, k + 1))
    End If
    
    If bWORD Then
        io.WRITE_IO_WORD to_unsigned_long(Val("&H" & p1)), to_signed_int(Val("&H" & p2))
    Else
        io.WRITE_IO_BYTE to_unsigned_long(Val("&H" & p1)), to_unsigned_byte(Val("&H" & p2))
        If Not bTO_uBYTE_OK Then
            add_to_log "    error: " & cMT("second operand is over 8 bits!") & " " & cMT("use ow")
        End If
    End If
    

Exit Sub
err1:
add_to_log "    error: " & LCase(Err.Description)
End Sub

' fool proof
Private Sub txtLog_KeyPress(KeyAscii As Integer)
On Error GoTo err1
    If KeyAscii = 13 Then
        Dim k1 As Long
        Dim k2 As Long
        
        k1 = txtLog.SelStart
        
        If k1 > 0 Then
            If k1 = 1 Then
                k2 = 1  ' first line, one char
            Else
                k2 = InStrRev(txtLog.Text, Chr(13), k1 - 1) + 2
                If k2 = 2 Then k2 = 1 ' probably the first line
            End If
            
            
            Dim s As String
            s = Mid(txtLog.Text, k2, k1 - k2 + 1)
            
            ' jic
            If endsWith(s, Chr(10)) Then
                s = Mid(s, 1, Len(s) - 1)
            End If
            If endsWith(s, Chr(13)) Then
                s = Mid(s, 1, Len(s) - 1)
            End If
            
            s = Trim(s)
            If s <> "" Then
                comboConcole.Text = s
                comboConcole.SetFocus
                comboConcole.SelStart = Len(comboConcole.Text)
                ' it doesn't work' do_debug_command_emulation Trim(s)
            End If
            
            Debug.Print "from window to command line"
        End If
        
    End If
    Exit Sub
err1:
    Debug.Print "txtLog_KeyPress: " & Err.Description
End Sub

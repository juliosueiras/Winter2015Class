Attribute VB_Name = "mOptions"

'

'

'



' 1.23
' Module for Saving/Loading program settings.

Option Explicit

' custom colors for ComDlg:
' should be set like that before calling to ShowColor():
' CUSTOM_COLORS = String(128 ,  0)
'Global CUSTOM_COLORS As String

'Global Const sOPTIONS_FOLDER = "Options"

'Global Const sFONT_options_file = "Fonts.dat"
'Global Const sOTHER_options_file = "Other.dat"
'Global Const sKEYWORD_options_file = "Keywords.dat"

''''-------------------------------------------------
Type tFONT_AND_COLOR
    sFontName As String * 100
    iFontSize As Integer
    bFontBold As Boolean
    bFontItalic As Boolean
    bFontStrikethrough As Boolean
    bFontUnderline As Boolean
    iCharset As Integer
    lForeColor As Long
End Type

Dim G1 As tFONT_AND_COLOR
''''-------------------------------------------------

''''-------------------------------------------------
Type tOther_options
    ' disassembler options:
    i_Bytes_to_Disassemble As Integer
    bJMP_CALL_redisasm As Boolean
    
    ' confine caret to text:
    bCONFINE_CARET_TO_TEXT As Boolean
    
    ' auto indent mode:
    lAutoIndentMode As Long ' cmAutoIndentMode
    
    ' editor back color:
    lEditorBackColor As Long
        
    ' line numbering:
    bShowLineNumbers As Boolean
    lStartLineNumber As Long
    lLineNumberingStyle As Long
    
    ' tabs:
    bConvertTabsToSpaces As Boolean
    lTabSize As Long
    
    ' Keyword Case Normalization:
    bKeywordCaseNormalization As Boolean
    
    ' If TRUE, when the user grabs the
    ' vertical scrollbar thumb and scrolls,
    ' a tooltip window will appear which
    ' shows the topmost visible line number
    ' as the thumb is dragged.
    ' If FALSE, the tooltip window will
    ' never appear.  The default setting
    ' is TRUE.
    bShowToolTips As Boolean
    
    ' 1.28#369
    uDEFAULT_SCREEN_ATTRIBUTE As Byte
    lBACK_COLOR_MEMORY_LIST As Long
    lBACK_COLOR_DECODED_LIST As Long
    
    ' 1.32#469
    i_STEP_DELAY As Integer
    
End Type

Dim D1 As tOther_options
''''-------------------------------------------------

''''-------------------------------------------------
Type tKeywordColor_and_Style
    lForeColor As Long
    lBackColor As Long
    lStyle As Long
End Type

Dim KC_S As tKeywordColor_and_Style
''''-------------------------------------------------

''
''
''Sub save_Options()
''On Error GoTo err_save_options
''
''    ' all options are saved into "Options" folder:
''    myMKDIR Add_BackSlash(App.Path) & sOPTIONS_FOLDER
''
''    save_FONT_options
''
''    save_OTHER_options
''
''    save_KEYWORD_COLOR_AND_STYLE_options
''
''    ' #400b9-hotkeys# '
''    ' #400b20-macro-back#
''    save_All_MACROS
''
''    ' #400b9-hotkeys# '
''    ' #400b20-macro-back#
''    SaveHotKeys
''
''
''
''
''    '#1057
''    If sCURRENT_SOURCE_FOLDER <> "" Then
''        SaveSetting "emu8086", "dirs", "RKsCURRENT_SOURCE_FOLDER", sCURRENT_SOURCE_FOLDER
''    End If
''
''
''    ' 1.30 If Not bREGISTERED Then SaveSetting sTitleA, "Reg", "unreg", iUNREG_COUNTER
''
''    Exit Sub
''err_save_options:
''    Debug.Print "save_Options: " & LCase(err.Description)
''    Resume Next
''
''End Sub
''
''
''Sub load_Options()
''On Error GoTo err_load_options
''
''    ' 1.32
''    ' I added [= "TRUE"], because otherwise
''    ' it hard to see what it does :)
''    ' but it seems to work anyway!
''    ' - in the same version it is removed, since no longer using Windows Registry!
''
''    ' 1.32#465 If GetSetting(sTitleA, "Options", "RESET", "TRUE") = "TRUE" Then
''    If get_LOAD_OPTIONS_FLAG() = False Then
''        ' user clicked "Reset to Defaults" button.
''        ' Or this is the first time the program is
''        ' started ("TRUE" by default), so no
''        ' option files exist!
''
''        ' allow loading updated settings on next start:
''        ' 1.32#465 SaveSetting sTitleA, "Options", "RESET", "FALSE"
''        set_LOAD_OPTIONS_FLAG True
''
''        Debug.Print "Options not loaded! (RESET)"
''
''        Exit Sub            ' DO NOT LOAD!!!
''    End If
''
''    ' no need to try loading something, if "Options" folder
''    ' is missing:
''    If Not FileExists(Add_BackSlash(App.Path) & sOPTIONS_FOLDER) Then
''        Exit Sub
''    End If
''
''
''
''    load_FONT_options
''
''    load_OTHER_options
''
''    load_KEYWORD_COLOR_AND_STYLE_options
''
''    ' #400b9-hotkeys# '
''    ' #400b20-macro-back#
''    load_ALL_MACROS
''
''    ' #400b9-hotkeys# '
''    ' #400b20-macro-back#
''    LoadHotKeys
''
''
''    ' 1.28#369
''    If frmEmulation.picMemList.ForeColor = frmEmulation.picMemList.BackColor Then
''        ' set default:
''        frmEmulation.picMemList.ForeColor = vbBlack
''        frmEmulation.picMemList.BackColor = vbWhite
''    End If
''
''    ' 1.28#369
''    If frmEmulation.picDisList.ForeColor = frmEmulation.picDisList.BackColor Then
''        ' set default:
''        frmEmulation.picDisList.ForeColor = vbBlack
''        frmEmulation.picDisList.BackColor = vbWhite
''        ' NO YET! ' refreshDisassembly
''    End If
''
''
''
''    '#1057 sCURRENT_SOURCE_FOLDER = App.Path
''    '#1057
''    sCURRENT_SOURCE_FOLDER = GetSetting("emu8086", "Dirs", "RKsCURRENT_SOURCE_FOLDER", Add_BackSlash(App.Path) & "examples")
''
''
''    ' 1.30 If Not bREGISTERED Then iUNREG_COUNTER = GetSetting(sTitleA, "Reg", "unreg", "0")
''
''    Exit Sub
''err_load_options:
''    Debug.Print "load_Options: " & LCase(err.Description)
''    Resume Next
''End Sub
'
'
''Private Sub save_OTHER_options()
''On Error GoTo err_save_OTHER_options
''
''Dim iFileNum As Integer
''
''iFileNum = FreeFile
''
''Open Add_BackSlash(App.Path) & sOPTIONS_FOLDER & "\" & sOTHER_options_file For Random Shared As iFileNum Len = Len(D1)
''
''     ' #327q2c# ' D1.i_Bytes_to_Disassemble = dis_Bytes_to_Disassemble
''    D1.bJMP_CALL_redisasm = bAUTOMATIC_DISASM_AFTER_JMP_CALL
''    D1.bCONFINE_CARET_TO_TEXT = frmMain.txtInput.SelBounds
''    D1.lAutoIndentMode = frmMain.txtInput.AutoIndentMode
''    D1.lEditorBackColor = frmMain.txtInput.GetColor(cmClrWindow)
''    D1.bShowLineNumbers = frmMain.txtInput.LineNumbering
''    D1.lStartLineNumber = frmMain.txtInput.LineNumberStart
''    D1.lLineNumberingStyle = frmMain.txtInput.LineNumberStyle
''
''    D1.bConvertTabsToSpaces = frmMain.txtInput.ExpandTabs
''    D1.lTabSize = frmMain.txtInput.TabSize
''
''    D1.bKeywordCaseNormalization = frmMain.txtInput.NormalizeCase
''
''    D1.bShowToolTips = frmMain.txtInput.LineToolTips
''
''    ' 1.28#369
''    D1.uDEFAULT_SCREEN_ATTRIBUTE = frmScreen.get_DEFAULT_ATTRIB
''    D1.lBACK_COLOR_MEMORY_LIST = frmEmulation.picMemList.BackColor
''    D1.lBACK_COLOR_DECODED_LIST = frmEmulation.picDisList.BackColor
''
''    ' 1.32#469
''    D1.i_STEP_DELAY = frmEmulation.get_Step_Delay()
''
''    Put #iFileNum, 1, D1
''
''Close iFileNum    ' Close file.
''
''    Exit Sub
''err_save_OTHER_options:
''    Debug.Print "save_OTHER_options: " & LCase(err.Description)
''End Sub
'
'
'Private Sub load_OTHER_options()
'On Error GoTo err_load_OTHER_options
'
'Dim iFileNum As Integer
'Dim sFilename As String
'
'sFilename = Add_BackSlash(App.Path) & sOPTIONS_FOLDER & "\" & sOTHER_options_file
'
'If Not FileExists(sFilename) Then
'    Debug.Print "not found: " & sFilename
'    Exit Sub
'End If
'
'' 1.28#369
'If FileLen(sFilename) < 45 Then ' 1.32 43 Then
'    Debug.Print sFilename & " - has wrong size (previous version?)"
'    Exit Sub
'End If
'
'
'iFileNum = FreeFile
'
'Open sFilename For Random Shared As iFileNum Len = Len(D1)
'
'    Get #iFileNum, 1, D1
'
''     ' #327q2c# ' dis_Bytes_to_Disassemble = D1.i_Bytes_to_Disassemble
''   ' #327t-memlist2code-3# ' bAUTOMATIC_DISASM_AFTER_JMP_CALL = D1.bJMP_CALL_redisasm
''    frmMain.txtInput.SelBounds = D1.bCONFINE_CARET_TO_TEXT
''    frmMain.txtInput.AutoIndentMode = D1.lAutoIndentMode
''    frmMain.txtInput.SetColor cmClrWindow, D1.lEditorBackColor
''    frmMain.txtInput.LineNumbering = D1.bShowLineNumbers
''    frmMain.txtInput.LineNumberStart = Abs(D1.lStartLineNumber)
''    frmMain.txtInput.LineNumberStyle = D1.lLineNumberingStyle
''
''    frmMain.txtInput.ExpandTabs = D1.bConvertTabsToSpaces
''    frmMain.txtInput.TabSize = D1.lTabSize
''
''    frmMain.txtInput.NormalizeCase = D1.bKeywordCaseNormalization
''
''    frmMain.txtInput.LineToolTips = D1.bShowToolTips
'
'    ' 1.28#369
'    frmScreen.set_DEFAULT_ATTRIB D1.uDEFAULT_SCREEN_ATTRIBUTE
'
'
'    ' 2.03#520c
'    ' who needs this? it is set when executable is loaded anyway '
'    ' it just don't want it to cause any prorblems.
'    ' frmScreen.clear_SCREEN
'
'
'    frmEmulation.picMemList.BackColor = D1.lBACK_COLOR_MEMORY_LIST
'    frmEmulation.picDisList.BackColor = D1.lBACK_COLOR_DECODED_LIST
'
'
'    ' 1.32#469
'    frmEmulation.set_Step_Delay D1.i_STEP_DELAY
'
'Close iFileNum    ' Close file.
'
'    Exit Sub
'err_load_OTHER_options:
'    Debug.Print "load_OTHER_options: " & LCase(Err.Description)
'End Sub
'
'
'
'
'Private Sub save_FONT_options()
'On Error GoTo err_save_FONT_options
'
'Dim iFileNum As Integer
'
'
'iFileNum = FreeFile
'
'Open Add_BackSlash(App.Path) & sOPTIONS_FOLDER & "\" & sFONT_options_file For Random Shared As iFileNum Len = Len(G1)
'
'    load_G1_from_font frmMain.txtInput.Font
'    G1.lForeColor = frmMain.txtInput.GetColor(cmClrText)
'    Put #iFileNum, 1, G1
'
'    load_G1_from_font frmScreen.picSCREEN.Font
'    G1.lForeColor = frmScreen.picSCREEN.ForeColor ' not used!
'    Put #iFileNum, 2, G1
'
'    load_G1_from_font frmEmulation.picMemList.Font
'    G1.lForeColor = frmEmulation.picMemList.ForeColor
'    Put #iFileNum, 3, G1
'
'    load_G1_from_font frmEmulation.picDisList.Font
'    G1.lForeColor = frmEmulation.picDisList.ForeColor
'    Put #iFileNum, 4, G1
'
'Close iFileNum    ' Close file.
'
'    Exit Sub
'err_save_FONT_options:
'    Debug.Print "save_FONT_options: " & LCase(Err.Description)
'End Sub

Private Sub load_G1_from_font(fFont As StdFont)

    With fFont
        G1.sFontName = .Name
        G1.iFontSize = .Size
        G1.bFontBold = .Bold
        G1.bFontItalic = .Italic
        G1.bFontStrikethrough = .Strikethrough
        G1.bFontUnderline = .Underline
        G1.iCharset = .Charset
    End With

End Sub

'
'Private Sub load_FONT_options()
'
'On Error GoTo err_load_FONT_options
'
'
'Dim sFilename As String
'
'sFilename = Add_BackSlash(App.Path) & sOPTIONS_FOLDER & "\" & sFONT_options_file
'
'If Not FileExists(sFilename) Then
'    Debug.Print "not found: " & sFilename
'    Exit Sub
'End If
'
'Dim iFileNum As Integer
'
'
'iFileNum = FreeFile
'
'Open sFilename For Random Shared As iFileNum Len = Len(G1)
'
'
'    Get #iFileNum, 1, G1
'    load_Font_from_G1 frmMain.txtInput.Font
'    frmMain.txtInput.SetColor cmClrText, G1.lForeColor
'
'    Get #iFileNum, 2, G1
'    load_Font_from_G1 frmScreen.picSCREEN.Font
'    frmScreen.picSCREEN.ForeColor = G1.lForeColor ' not used!
'
'    Get #iFileNum, 3, G1
'    load_Font_from_G1 frmEmulation.picMemList.Font
'    frmEmulation.picMemList.ForeColor = G1.lForeColor
'
'    Get #iFileNum, 4, G1
'    load_Font_from_G1 frmEmulation.picDisList.Font
'    frmEmulation.picDisList.ForeColor = G1.lForeColor
'
'
'Close iFileNum    ' Close file.
'
'    Exit Sub
'err_load_FONT_options:
'    Debug.Print "load_FONT_options: " & LCase(Err.Description)
'End Sub

Private Sub load_Font_from_G1(fFont As StdFont)

    With fFont
        .Name = Trim(G1.sFontName)
        .Size = G1.iFontSize
        .Bold = G1.bFontBold
        .Italic = G1.bFontItalic
        .Strikethrough = G1.bFontStrikethrough
        .Underline = G1.bFontUnderline
        .Charset = G1.iCharset
    End With

End Sub



'''Private Sub get_to_KC_S(lForeColor As cmColorItem, lBackColor As cmColorItem, lFontStyle As cmFontStyleItem)
'''    KC_S.lForeColor = frmMain.txtInput.GetColor(lForeColor)
'''    KC_S.lBackColor = frmMain.txtInput.GetColor(lBackColor)
'''    KC_S.lStyle = frmMain.txtInput.GetFontStyle(lFontStyle)
'''End Sub
''
'''Private Sub set_from_KC_S(lForeColor As cmColorItem, lBackColor As cmColorItem, lFontStyle As cmFontStyleItem)
'''    frmMain.txtInput.SetColor lForeColor, KC_S.lForeColor
'''    frmMain.txtInput.SetColor lBackColor, KC_S.lBackColor
'''    frmMain.txtInput.SetFontStyle lFontStyle, KC_S.lStyle
'''
'''    ' #1087b I forgot that original source should use the same colors....
'''    frmOrigCode.cmaxActualSource.SetColor lForeColor, KC_S.lForeColor
'''    frmOrigCode.cmaxActualSource.SetColor lBackColor, KC_S.lBackColor
'''    frmOrigCode.cmaxActualSource.SetFontStyle lFontStyle, KC_S.lStyle
'''
'''End Sub
''
''
''
''Private Sub save_KEYWORD_COLOR_AND_STYLE_options()
''On Error GoTo err_save_KEYWORD_options
''
''Dim iFileNum As Integer
''
''
''iFileNum = FreeFile
''
''Open Add_BackSlash(App.Path) & sOPTIONS_FOLDER & "\" & sKEYWORD_options_file For Random Shared As iFileNum Len = Len(KC_S)
''
''    get_to_KC_S cmClrComment, cmClrCommentBk, cmStyComment
''    Put #iFileNum, 1, KC_S
''
''    get_to_KC_S cmClrKeyword, cmClrKeywordBk, cmStyKeyword
''    Put #iFileNum, 2, KC_S
''
''    get_to_KC_S cmClrLineNumber, cmClrLineNumberBk, cmStyLineNumber
''    Put #iFileNum, 3, KC_S
''
''    get_to_KC_S cmClrNumber, cmClrNumberBk, cmStyNumber
''    Put #iFileNum, 4, KC_S
''
''    get_to_KC_S cmClrOperator, cmClrOperatorBk, cmStyOperator
''    Put #iFileNum, 5, KC_S
''
''    get_to_KC_S cmClrScopeKeyword, cmClrScopeKeywordBk, cmStyScopeKeyword
''    Put #iFileNum, 6, KC_S
''
''    get_to_KC_S cmClrString, cmClrStringBk, cmStyString
''    Put #iFileNum, 7, KC_S
''
''    get_to_KC_S cmClrTagAttributeName, cmClrTagAttributeNameBk, cmStyTagAttributeName
''    Put #iFileNum, 8, KC_S
''
''    get_to_KC_S cmClrTagElementName, cmClrTagElementNameBk, cmStyTagElementName
''    Put #iFileNum, 9, KC_S
''
''    get_to_KC_S cmClrTagEntity, cmClrTagEntityBk, cmStyTagEntity
''    Put #iFileNum, 10, KC_S
''
''    get_to_KC_S cmClrText, cmClrTextBk, cmStyText
''    Put #iFileNum, 11, KC_S
''
''Close iFileNum    ' Close file.
''
''    Exit Sub
''err_save_KEYWORD_options:
''    Debug.Print "save_KEYWORD_COLOR_AND_STYLE_options: " & LCase(Err.Description)
''End Sub
''
''
''
'Private Sub load_KEYWORD_COLOR_AND_STYLE_options()
'
'On Error GoTo err_load_KEYWORD_options
'
'
'Dim sFilename As String
'
'sFilename = Add_BackSlash(App.Path) & sOPTIONS_FOLDER & "\" & sKEYWORD_options_file
'
'If Not FileExists(sFilename) Then
'    Debug.Print "not found: " & sFilename
'    Exit Sub
'End If
'
'Dim iFileNum As Integer
'
'
'iFileNum = FreeFile
'
'Open sFilename For Random Shared As iFileNum Len = Len(KC_S)
'
'
'    Get #iFileNum, 1, KC_S
'    set_from_KC_S cmClrComment, cmClrCommentBk, cmStyComment
'
'    Get #iFileNum, 2, KC_S
'    set_from_KC_S cmClrKeyword, cmClrKeywordBk, cmStyKeyword
'
'    Get #iFileNum, 3, KC_S
'    set_from_KC_S cmClrLineNumber, cmClrLineNumberBk, cmStyLineNumber
'
'    Get #iFileNum, 4, KC_S
'    set_from_KC_S cmClrNumber, cmClrNumberBk, cmStyNumber
'
'    Get #iFileNum, 5, KC_S
'    set_from_KC_S cmClrOperator, cmClrOperatorBk, cmStyOperator
'
'    Get #iFileNum, 6, KC_S
'    set_from_KC_S cmClrScopeKeyword, cmClrScopeKeywordBk, cmStyScopeKeyword
'
'    Get #iFileNum, 7, KC_S
'    set_from_KC_S cmClrString, cmClrStringBk, cmStyString
'
'    Get #iFileNum, 8, KC_S
'    set_from_KC_S cmClrTagAttributeName, cmClrTagAttributeNameBk, cmStyTagAttributeName
'
'    Get #iFileNum, 9, KC_S
'    set_from_KC_S cmClrTagElementName, cmClrTagElementNameBk, cmStyTagElementName
'
'    Get #iFileNum, 10, KC_S
'    set_from_KC_S cmClrTagEntity, cmClrTagEntityBk, cmStyTagEntity
'
'    Get #iFileNum, 11, KC_S
'    set_from_KC_S cmClrText, cmClrTextBk, cmStyText
'
'Close iFileNum    ' Close file.
'
'    Exit Sub
'err_load_KEYWORD_options:
'    Debug.Print "load_KEYWORD_COLOR_AND_STYLE_options: " & LCase(Err.Description)
'End Sub
'
'
'Private Sub save_All_MACROS()
'On Error Resume Next
'    Dim L As Long
'
'    For L = 0 To codemaxctl.cmMaxMacros
'        SaveMacro L
'    Next L
'
'End Sub

'Private Sub load_ALL_MACROS()
'On Error Resume Next
'    Dim L As Long
'
'    For L = 0 To codemaxctl.cmMaxMacros
'        LoadMacro L
'    Next L
'End Sub

'''' taken from CEdit 4.4.1 SaveMacros()
'''Private Sub SaveMacro(nMacroNum As Long)
'''
'''On Error GoTo err_save_m
'''
'''    Dim bArr() As Byte
'''    Dim hFile As Integer
'''
'''    Dim g As codemaxctl.globals
'''    Set g = New codemaxctl.globals
'''
'''
'''    Dim sFilename As String
'''
'''    sFilename = Add_BackSlash(App.Path) & sOPTIONS_FOLDER & "\macro" & nMacroNum & ".dat"
'''
'''    g.GetMacro nMacroNum, bArr
'''
'''    ' bugfix1.23#250
'''    ' always delete the file if it already exists,
'''    ' to prevent loading some macros that were
'''    ' reseted:
'''    If FileExists(sFilename) Then
'''        DELETE_FILE sFilename
'''    End If
'''
'''
'''    If UBound(bArr) >= 0 Then
'''        hFile = FreeFile
'''
'''        Open sFilename For Binary Access Write Shared As #hFile
'''          Put #hFile, , bArr
'''        Close #hFile
'''
'''    End If
'''
'''    Exit Sub
'''err_save_m:
'''    Debug.Print "SaveMacros: " & nMacroNum & ": " & LCase(Err.Description)
'''End Sub
'''
''' taken from CEdit 4.4.1 AddMacro()
''Private Sub LoadMacro(nMacroNum As Long)
''On Error GoTo err_load_m
''
''  Dim p As codemaxctl.globals
''  Set p = New codemaxctl.globals
''
''  Dim fFile As Integer, bBar() As Byte
''
''  Dim sFilename As String
''
''  sFilename = Add_BackSlash(App.Path) & sOPTIONS_FOLDER & "\macro" & nMacroNum & ".dat"
''
''  ' 1.23#272
''  If Not FileExists(sFilename) Then Exit Sub
''
''
''  fFile = FreeFile()
''
''  Open sFilename For Binary Access Read Shared As #fFile
''    ReDim bBar(0 To LOF(fFile))
''    Get fFile, , bBar
''  Close #fFile
''
''  p.SetMacro nMacroNum, bBar
''
''  Erase bBar ' #327xp-erase#
''
''  Exit Sub
''err_load_m:
''    Debug.Print "LoadMacro: " & nMacroNum & ": " & LCase(Err.Description)
''End Sub
''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
'
'' I do not allow to change hotkeys, but user can assing
'' hotkeys to macros, so we need to save them, maybe later
'' I will allow to change hot keys, so there won't be a need
'' to code saving procedure:
'Private Sub SaveHotKeys()
'
'On Error GoTo err_save_hk
'
'    Dim bArr() As Byte
'    Dim hFile As Integer
'
'    Dim g As codemaxctl.globals
'    Set g = New codemaxctl.globals
'
'
'    Dim sFilename As String
'
'    sFilename = Add_BackSlash(App.Path) & sOPTIONS_FOLDER & "\hotkeys.dat"
'
'    ' 1.32#455 / #461
'    ' delete the old file (if exists):
'    If FileExists(sFilename) Then
'        DELETE_FILE sFilename
'    End If
'
'    g.GetHotKeys bArr
'
'    If UBound(bArr) >= 0 Then
'        hFile = FreeFile
'
'        Open sFilename For Binary Access Write Shared As #hFile
'          Put #hFile, , bArr
'        Close #hFile
'
'    End If
'
'    Exit Sub
'err_save_hk:
'    Debug.Print "SaveHotKeys: " & LCase(Err.Description)
'End Sub
'
'Private Sub LoadHotKeys()
'On Error GoTo err_load_hk
'
'  Dim p As codemaxctl.globals
'  Set p = New codemaxctl.globals
'
'  Dim fFile As Integer, bBar() As Byte
'
'  Dim sFilename As String
'
'  sFilename = Add_BackSlash(App.Path) & sOPTIONS_FOLDER & "\hotkeys.dat"
'
'  ' 1.32#455 / #461
'  If Not FileExists(sFilename) Then
'    Exit Sub
'  End If
'
'  fFile = FreeFile()
'
'  Open sFilename For Binary Access Read Shared As #fFile
'    ReDim bBar(0 To LOF(fFile))
'    Get fFile, , bBar
'  Close #fFile
'
'  p.SetHotKeys bBar
'
'  Erase bBar ' #327xp-erase#
'
'  Exit Sub
'err_load_hk:
'    Debug.Print "LoadHotKeys: " & LCase(Err.Description)
'End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''
''' 1.32#465
''' when TRUE the options will be loaded on the next
''' start, when FALSE the options will not be loaded
''' on the next start - thus will be reset to defaults:
''Sub set_LOAD_OPTIONS_FLAG(bFlag As Boolean)
''
''On Error GoTo errLOPF
''
''    Dim iFnum As Integer
''    Dim sFilePath As String
''    Dim sFilename As String
''
''    sFilename = Add_BackSlash(App.Path) & sOPTIONS_FOLDER & "\LoadFlag.dat"
''
''    iFnum = FreeFile
''
''    If bFlag Then
''        myMKDIR Add_BackSlash(App.Path) & sOPTIONS_FOLDER
''
''        Open sFilename For Output Shared As iFnum
''        Print #iFnum, "Load options from hdd flag file."
''        Close #iFnum
''    Else
''        DELETE_FILE sFilename
''    End If
''
''Exit Sub
''errLOPF:
''    Debug.Print "set_LOAD_OPTIONS_FLAG: " & LCase(Err.Description)
''End Sub
''
'' used to get flag that is set by set_LOAD_OPTIONS_FLAG()
'Function get_LOAD_OPTIONS_FLAG() As Boolean
'On Error GoTo err_glof
'
'    Dim sFilename As String
'
'    sFilename = Add_BackSlash(App.Path) & sOPTIONS_FOLDER & "\LoadFlag.dat"
'
'    If GetSetting("emu8086", "Dirs", "RKsCURRENT_SOURCE_FOLDER", "NOT_FOUND") = "NOT_FOUND" Then
'        get_LOAD_OPTIONS_FLAG = False
'    Else
'
'        get_LOAD_OPTIONS_FLAG = FileExists(sFilename)
'
'    End If
'
'    Exit Function
'err_glof:
'    Debug.Print "get_LOAD_OPTIONS_FLAG: " & LCase(Err.Description)
'End Function
'

Attribute VB_Name = "mFASM"
' #400b15-integrate-fasm#

Option Explicit


' #400b16-PE-RUN#
' 0 - 16 bit, com, exe, bin, boot, etc... (MZ/COM)
' 1 - PE executable
' 2 - PE DLL
' 3 - COFF
' 4 - OBJ  (MS)
' 5 - SYS  (dos device driver)
Global iEXECUTABLE_TYPE As Integer


' #400b18-undefined-vars-no-listing#
Const UNDEFINED_STR As String = "(UNDEFINED)"




''''' #404-masm#
''''' returns 0 if integrated assembler should be used.
''''' returns 1 if FASM should be invoked.
''''' returns 2 if MASM should be used.
'''''
''''Function check_IS_FASM_MASM() As Integer
''''On Error GoTo err1
''''
''''Dim L As Long
''''Dim s As String
''''
''''For L = 0 To frmMain.txtInput.lineCount - 1
''''
''''    s = frmMain.txtInput.getLine(L)
''''    s = LTrim(Replace(s, vbTab, " "))
''''
''''    If startsWith(s, "#fasm") Then
''''        check_IS_FASM_MASM = 1
''''        Exit Function
''''    ElseIf startsWith(s, "use16") Then ' example: ' example: comdemo.asm
''''        check_IS_FASM_MASM = 1
''''        Exit Function
''''    ElseIf startsWith(s, "use32") Then ' jic
''''        check_IS_FASM_MASM = 1
''''        Exit Function
''''    ElseIf startsWith(s, "; fasm example") Then ' example: device.asm
''''        check_IS_FASM_MASM = 1
''''        Exit Function
''''    ElseIf startsWith(s, "format ") Then ' examples: exedemo.asm , multiseg.asm, usedpmi.asm
''''        check_IS_FASM_MASM = 1
''''        Exit Function
''''    ElseIf startsWith(s, "; LIFE - fasm") Then ' example: life.asm
''''        check_IS_FASM_MASM = 1
''''        Exit Function
''''    ElseIf startsWith(s, "; requires FPU") Then ' example: mandel.asm
''''        check_IS_FASM_MASM = 1
''''        Exit Function
''''    ElseIf startsWith(s, "include ") Then
''''        If startsWith(s, "include 'win32ax.inc'") Then ' (win) example: hello.asm
''''            check_IS_FASM_MASM = 1
''''            Exit Function
''''        ElseIf InStr(1, s, "win32ax.inc", vbTextCompare) > 0 Then ' jic
''''            check_IS_FASM_MASM = 1
''''            Exit Function
''''        End If
''''    ElseIf startsWith(s, "#masm") Then ' #404-masm#
''''        check_IS_FASM_MASM = 2
''''        Exit Function
''''    Else
''''        If L > 100 Then
''''            If Left(s, 1) <> ";" Then
''''                GoTo not_for_fasm_masm ' BREAK
''''            End If
''''        End If
''''    End If
''''
''''Next L
''''
''''not_for_fasm_masm:
''''s = ""
''''check_IS_FASM_MASM = 0 ' do not use fasm or masm !
''''
''''
''''Exit Function
''''err1:
''''Debug.Print "check_IS_FASM_MASM: " & Err.Description
''''End Function
'
'
'Function assemble_with_fasm(ByRef bIfSucessLoadInEmulator As Boolean, bDONOT_ASK_WHERE_TO_SAVE As Boolean) As Boolean
'
'On Error GoTo err1
'
'
'    ' #400b18-fasm-bug12#
'    Dim bFASM_MAKE_BOOT As Boolean
'    bFASM_MAKE_BOOT = False
'
'
'
''''    ' same as in set_LISTS()
''''    frmOrigCode.cmaxActualSource.Text = ""
''''    frmOrigCode.PREPARE_cmaxActualSource
''''
'
'
'
'    ' #400b16-PE-RUN#
'    iEXECUTABLE_TYPE = 0
'
'
'
'
'
'
'    frmInfo.clearErrorBuffer_and_Text     ' ERROR LIST RESET (JIC)
'
'
'
'    Dim sFASM_FILENAME As String ' output file, exe, bin, com...
'    Dim sFASM_EXTENTION As String
'    Dim sFASM_SOURCE As String
'    Dim sFASM_LIST As String
'    Dim sFASM_LOG As String
'
'    Dim L As Long
'    Dim s As String
'
'
'    '''''''''''''''''''''''''''''''''''''''''
'    ' determine output type: com, exe... probably bin (if #make_bin# detected) (set sFASM_EXTENTION)
'    sFASM_EXTENTION = ""
'    Dim sLINES() As String
'    ReDim sLINES(0 To frmMain.txtInput.lineCount)   ' bigger jic.
'    For L = 0 To frmMain.txtInput.lineCount - 1
'
'
'
'
'
'
'
'        ' same as in set_LISTS()
'        s = frmMain.txtInput.getLine(L)
'
'        '  4.00b16
'        ' we decided to left the original line unchanged!
'        ' unless there is some emu8086 unique directives that are commented out.
'
'
'
'        '  4.00b16 ' s = myTrim_RepTab(s)
'        If TRIM_ORIGINAL_SOURCE Then
'            frmOrigCode.cmaxActualSource.AddText Trim(s) & vbNewLine
'        Else
'            frmOrigCode.cmaxActualSource.AddText s & vbNewLine
'        End If
'
'
'        '  4.00b16
'        Dim sNO_COMMENT_NO_TAB_TRIMED As String
'        sNO_COMMENT_NO_TAB_TRIMED = Trim(myTrim_RepTab(remove_Comment(s)))
'
'
'
'
'
'
'        '  4.00b16 ' If Left(s, 1) <> ";" Then
'        If Len(sNO_COMMENT_NO_TAB_TRIMED) > 0 Then '  4.00b16
'
'                ' preparse.... remove NAME and #make_etc...# directives
'                If startsWith(sNO_COMMENT_NO_TAB_TRIMED, "name ") Then ' #400b17-terrible-stupid-bug#
'
'                    sNamePR = replace_illigal_for_file_name(Trim(Mid(sNO_COMMENT_NO_TAB_TRIMED, Len("NAME "))))
'                    s = "; " & s ' comment out for FASM.
'                End If
'                If Left(sNO_COMMENT_NO_TAB_TRIMED, 1) = "#" Then
'                    ' #400b17-terrible-stupid-bug#' If startsWith(s, "#fasm") Then
'                   If startsWith(sNO_COMMENT_NO_TAB_TRIMED, "#fasm") Then ' #400b17-terrible-stupid-bug#
'                        s = "; " & s ' comment out for FASM.
'                    ElseIf startsWith(sNO_COMMENT_NO_TAB_TRIMED, "#MAKE_") Then
'                        Select Case UCase(sNO_COMMENT_NO_TAB_TRIMED)
'                        Case "#MAKE_COM#"
'                            sFASM_EXTENTION = "com"
'                        Case "#MAKE_EXE#"
'                            sFASM_EXTENTION = "exe"
'                        Case "#MAKE_BIN#"
'                            sFASM_EXTENTION = "bin"
'                        Case "#MAKE_BOOT#"
'                            sFASM_EXTENTION = "bin"
'                            bDIRECTED_TO_WRITE_BINF_FILE = True ' .boot file is obsolete because it's not 8.3 compatible, now we will have only .bin files with .binf !
'                            mBINF.set_DEFAULT_FOR_BOOT
'                            bFASM_MAKE_BOOT = True
'                        Case Else
'                            Debug.Print "wrong output type: " & s
'                        End Select
'                        s = "; " & s ' comment out for FASM.
'                    Else
'                        PROCESS_BINF_DIRECTIVE sNO_COMMENT_NO_TAB_TRIMED, L
'                        If bDIRECTED_TO_WRITE_BINF_FILE Then
'                            ' skip all # lines only if there is at least 1 legal bin directive.
'                            s = "; " & s ' comment out for FASM.
'                        End If
'                    End If
'                End If
'
'
'
'                If InStr(1, sNO_COMMENT_NO_TAB_TRIMED, "org", vbTextCompare) > 0 Then
'                    If evalExpr(getToken(sNO_COMMENT_NO_TAB_TRIMED, 1, " ")) = 256 Then
'                        sFASM_EXTENTION = "com"
'                        iEXECUTABLE_TYPE = 0
'                    End If
'                End If
'                If InStr(1, sNO_COMMENT_NO_TAB_TRIMED, "format", vbTextCompare) > 0 Then
'                    '4.00b16' If StrComp(getToken(myTrim_RepTab(s), 1, " "), "MZ", vbTextCompare) = 0 Then
'                    If InStr(5, sNO_COMMENT_NO_TAB_TRIMED, "MZ", vbTextCompare) > 0 Then  '4.00b16
'                        sFASM_EXTENTION = "exe"
'                        iEXECUTABLE_TYPE = 0
'                    '4.00b16' ElseIf StrComp(getToken(myTrim_RepTab(s), 1, " "), "PE", vbTextCompare) = 0 Then
'                    ElseIf InStr(5, sNO_COMMENT_NO_TAB_TRIMED, "PE", vbTextCompare) > 0 Then '4.00b16
'                        If InStr(1, sNO_COMMENT_NO_TAB_TRIMED, "dll", vbTextCompare) > 0 Then
'                            sFASM_EXTENTION = "dll"
'                            iEXECUTABLE_TYPE = 2
'                        Else
'                            sFASM_EXTENTION = "exe"
'                            iEXECUTABLE_TYPE = 1
'                        End If
'                    '4.00b16' ElseIf StrComp(getToken(myTrim_RepTab(s), 1, " "), "COFF", vbTextCompare) = 0 Then
'                    ElseIf InStr(5, sNO_COMMENT_NO_TAB_TRIMED, "COFF", vbTextCompare) > 0 Then '4.00b16
'                        sFASM_EXTENTION = "COFF"
'                        iEXECUTABLE_TYPE = 3
'                    '4.00b16' ElseIf StrComp(getToken(myTrim_RepTab(s), 1, " "), "MS", vbTextCompare) = 0 Then
'                    ElseIf InStr(5, sNO_COMMENT_NO_TAB_TRIMED, "MS", vbTextCompare) > 0 Then '4.00b16
'                        sFASM_EXTENTION = "obj"
'                        iEXECUTABLE_TYPE = 4
'                    End If
'                End If
'                If InStr(1, sNO_COMMENT_NO_TAB_TRIMED, "include", vbTextCompare) > 0 Then
'                    If InStr(1, sNO_COMMENT_NO_TAB_TRIMED, "win32ax.inc", vbTextCompare) > 0 Then
'                            sFASM_EXTENTION = "exe"
'                            iEXECUTABLE_TYPE = 1
'                    End If
'                End If
'
'                ' 4.00b17
'                ' not sure if there are won't be any conflicts :)
'                If startsWith(sNO_COMMENT_NO_TAB_TRIMED, "db 'DEVICE  '") Then
'                        sFASM_EXTENTION = "sys"
'                        iEXECUTABLE_TYPE = 5
'                End If
'
'         End If
'
'        sLINES(L) = s
'    Next L
'    '''''''''''''''''''''''''''''''''''''''''
'
'    If sFASM_EXTENTION = "" Then
'        sFASM_EXTENTION = "bin" ' default...
'    End If
'
'
'
'    ' #400b16-SYMBOL#
'    FASM_build_primary_SymbolTable sLINES
'
'
'
'
'
'
'
'    If (bIfSucessLoadInEmulator And bDONOT_ASK_WHERE_TO_SAVE) Or bCOMPILE_ALL_SILENT Then
'            myMKDIR s_MyBuild_Dir
'            If frmMain.sOpenedFile <> "" Then
'                sFASM_FILENAME = Add_BackSlash(s_MyBuild_Dir) & check_if_sNamePR_defined(CutExtension(ExtractFileName(frmMain.sOpenedFile))) & "." & sFASM_EXTENTION & "_"  ' #327xo-av-protect#
'            Else
'                sFASM_FILENAME = Add_BackSlash(s_MyBuild_Dir) & sNamePR & "." & sFASM_EXTENTION & "_"
'            End If
'    Else
'            Dim ST As String
'
'            ' #400b20-remember-prev-build-dir#
'            If Len(sPREV_BUILD_DIR) > 0 Then
'                ' allow only if source file is from the same folder
'                If StrComp(ExtractFilePath(frmMain.sOpenedFile), sPREV_BUILD_DIR, vbTextCompare) = 0 Then
'                    ST = sPREV_BUILD_DIR
'                Else
'                    ST = s_MyBuild_Dir
'                End If
'            Else
'                ST = s_MyBuild_Dir
'            End If
'
'
'
'            myMKDIR ST
'
'            If frmMain.sOpenedFile <> "" Then
'                If myChDir(ST) Then
'                    ComDlg.FileInitialDirD = ST
'                End If
'                ComDlg.FileNameD = check_if_sNamePR_defined(CutExtension(ExtractFileName(frmMain.sOpenedFile))) & "." & sFASM_EXTENTION
'            Else
'                If myChDir(ST) Then
'                    ComDlg.FileInitialDirD = ST
'                End If
'                ComDlg.FileNameD = sNamePR & "." & sFASM_EXTENTION
'            End If
'
'            '  to make F12 work
'            If frmInfo.Visible Then
'                ComDlg.hwndOwner = frmInfo.hwnd
'            Else
'                ComDlg.hwndOwner = frmMain.hwnd
'            End If
'            ComDlg.Flags = OFN_HIDEREADONLY + OFN_PATHMUSTEXIST
'           ' 4.00b17 ComDlg.Filter = "executable files (*.exe)|*.exe|com files (*.com)|*.com|bin files (*.bin)|*.com|all Files (*.*)|*.*"
'            ComDlg.Filter = "all binary files (*.exe;*.com;*.bin;*.dll;*.sys;*.obj)|*.exe;*.com;*.bin;*.dll;*.sys;*.obj|exe files (*.exe)|*.exe|com files (*.com)|*.com|bin files (*.bin)|*.com|all Files (*.*)|*.*"
'            ComDlg.DefaultExtD = sFASM_EXTENTION
'            sFASM_FILENAME = ComDlg.ShowSave
'    End If
'    ' --------------------------------------------------------
'
'
'    If sFASM_FILENAME = "" Then
'        ' canceled.
'        bIfSucessLoadInEmulator = False
'        GoTo probably_canceled ' #400b20-cosmetic3#
'    End If
'
'
'
'
'
'    ' #400b20-remember-prev-build-dir#
'    sPREV_BUILD_DIR = ExtractFilePath(sFASM_FILENAME)
'
'
'
'
'
'    ' delete the old file (if exists):
'    If FileExists(sFASM_FILENAME) Then
'        If Not check_if_its_in_MyBuild_folder_or_ask_to_overwrite(sFASM_FILENAME) Then
'            bIfSucessLoadInEmulator = False
'            GoTo probably_canceled ' #400b20-cosmetic3#
'        End If
'        DELETE_FILE sFASM_FILENAME
'    End If
'
'
'
'    ' #400b20-FASM-more-checks#
'    If FileExists(sFASM_FILENAME) Then
'        frmInfo.addErr_FASM 0, cMT("cannot use this filename / sharing violation / access denied"), ""
'    End If
'
'
'
'
'    ' #400b15-fasm-del-old#
'    DELETE_FILE_if_exists sFASM_FILENAME & ".list"
'    DELETE_FILE_if_exists sFASM_FILENAME & ".symbol"
'    DELETE_FILE_if_exists sFASM_FILENAME & ".debug"
'    DELETE_FILE_if_exists sFASM_FILENAME & ".log"
'    DELETE_FILE_if_exists CutExtension(sFASM_FILENAME) & ".binf"
'
'
'
'    ' save sLINES() to "*.~asm" file
'    ' save source for fasm to:
'    sFASM_SOURCE = sFASM_FILENAME & ".~asm"
'    Dim iFileNum0 As Integer
'    iFileNum0 = FreeFile
'    Open sFASM_SOURCE For Output Shared As iFileNum0
'    For L = 0 To frmMain.txtInput.lineCount    ' last line is blank (added)
'        Print #iFileNum0, sLINES(L)
'    Next L
'    If frmMain.sOpenedFile <> "" Then
'       s = vbNewLine & vbNewLine & sORIG_SOURCE_TAG & frmMain.sOpenedFile & vbNewLine
'       Print #iFileNum0, s
'    End If
'    Close iFileNum0
'
'
'
'
'
'
'
'
'
'
'
'
''///////////////// batch
'
'    Dim sFASM_OK As String
'    sFASM_OK = Add_BackSlash(s_MyBuild_Dir) & "_fasm.ok"
'
'    ' delete "_fasm.ok" (if exists) JIC.
'    DELETE_FILE_if_exists sFASM_OK
'
'
'
'
'
'
'
'    ' jic
'    Dim s_FASM_BAT_PATH As String
'    s_FASM_BAT_PATH = Add_BackSlash(s_MyBuild_Dir) & "_fasm.bat"
'    DELETE_FILE_if_exists s_FASM_BAT_PATH
'
'
'    ' #400B17-JIC#  jic jic jic
'    ' if still exists....  (some fasm/windows xp lock error... etc...)
'    If FileExists(s_FASM_BAT_PATH) Then
'        Debug.Print "access denied [FB]"
'        Dim lFB11 As Long
'        For lFB11 = 0 To 11
'           s_FASM_BAT_PATH = Add_BackSlash(s_MyBuild_Dir) & "_fasm" & CStr(lFB11) & ".bat"
'           If Not FileExists(s_FASM_BAT_PATH) Then
'                Exit For ' OK, will use that one.
'           Else
'                ' try to delete that too...
'                DELETE_FILE s_FASM_BAT_PATH
'                If Not FileExists(s_FASM_BAT_PATH) Then
'                    Exit For ' OK, will use that one.
'                End If
'           End If
'        Next lFB11
'    End If
'
'
'
'
'
'
'
'
'
'
'
'
'
'    ' set and delete old .log, .list
'    sFASM_LIST = sFASM_FILENAME & ".list"
'    sFASM_LOG = sFASM_FILENAME & ".log"
'    DELETE_FILE_if_exists sFASM_LIST
'    DELETE_FILE_if_exists sFASM_LOG
'
'
'
'
'    '       create "_fasm.bat"
'    Dim iFileNum As Integer
'    iFileNum = FreeFile
'    Open s_FASM_BAT_PATH For Output Shared As iFileNum
'
'
'
'    s = "rem    EMU8086 - FASM INCORPORATION  -- " & Date & " -- " & Time
'    Print #iFileNum, s
'    If frmMain.sOpenedFile = "" Then ' #400b16-FASM-BUG#
'        s = "set include=" & Add_BackSlash(App.Path) & "fasm\include;" & Add_BackSlash(App.Path) & "inc;" & Add_BackSlash(App.Path) & "MySource;"
'        Print #iFileNum, s
'    Else
'        ' #400b17chdir-FASM#  - change dir to source's path
'        s = Left(frmMain.sOpenedFile, 1) & ":" ' "d:"
'        Print #iFileNum, s
'        s = "cd """ & ExtractFilePath(frmMain.sOpenedFile) & """"
'        Print #iFileNum, s
'
'        s = "set include=" & Add_BackSlash(App.Path) & "fasm\include;" & Add_BackSlash(App.Path) & "inc;" & Add_BackSlash(App.Path) & "MySource;" & ExtractFilePath(frmMain.sOpenedFile) & ";"
'        Print #iFileNum, s
'    End If
'
'    s = "set PATH=" & Add_BackSlash(App.Path) & "fasm"
'    Print #iFileNum, s
'
'
'
'
'    '#400b20-bug-FASM.EXE-IN-MyBuild# ' s = "fasm """ & sFASM_SOURCE & """ """ & sFASM_FILENAME & """ """ & sFASM_LIST & """  > """ & sFASM_LOG & """"
'    s = Add_BackSlash(App.Path) & "fasm\fasm.exe """ & sFASM_SOURCE & """ """ & sFASM_FILENAME & """ """ & sFASM_LIST & """  > """ & sFASM_LOG & """"
'
'
'    Print #iFileNum, s
'
'
'
'
'
'    ' debug!
'    ' s = "pause"
'    ' Print #iFileNum, s
'
'    ' #400b17chdir-FASM#  - change dir back to c:\emu8086\
'    s = Left(App.Path, 1) & ":"  ' "c:"
'    Print #iFileNum, s
'    s = "cd """ & App.Path & """"
'    Print #iFileNum, s
'
'
'    s = "echo    fasm-ok    > """ & sFASM_OK & """ "
'    Print #iFileNum, s
'    Close iFileNum
'
'    ' launch it "_fasm.bat"
'    Dim d As Double
'    d = Shell(s_FASM_BAT_PATH, vbMinimizedNoFocus)   '     LAUNCH FASM !!!!!!!!!!!!!!!!!!!
'    If d = 0 Then
'        frmInfo.addErr_FASM 0, "error: cannot start fasm!", ""
'    Else
'        '    WAIT FOR "_fasm.ok"
'        Do While frmMain.bCOMPILING
'            If FileExists(sFASM_OK) Then GoTo del_fasm_ok
'            DoEvents
'            ' just some radnom code... =)
'            Dim yyy As Single
'            For yyy = 0 To 1000
'                Dim yyy1 As Double
'                Dim yyy2 As Double
'                yyy2 = yyy / Abs(Timer + 82)
'                yyy1 = (yyy2 / 72) Mod 65 - 45
'                DoEvents
'            Next yyy
'            ' Debug.Print "jj" & Timer
'        Loop
'del_fasm_ok:
'        DoEvents
'        '  delete "_fasm.ok"
'        DELETE_FILE_if_exists sFASM_OK
'    End If
'
'    If Not frmMain.bCOMPILING Then
'       frmInfo.addErr_FASM 0, cMT("assembler aborted"), ""
'    End If
'
'any_way:
'
'    ' no need to keep this file
'    DELETE_FILE_if_exists s_FASM_BAT_PATH
'
'
'
'
'
'    stop_precompile_animation
'
'
'
'
'    CHECK_FASM_LOG sFASM_LOG, sFASM_SOURCE
'
'
'
'
'
'
'    frmInfo.showErrorBuffer
'    ' #400b20-FASM-more-checks#
'    If frmInfo.lstErr.ListCount = 0 Then  ' no errors, but no oputput from fasm?
'        If Not FileExists(sFASM_FILENAME) Then
'            frmInfo.addErr_FASM 0, cMT("no binary output!"), ""
'            frmInfo.showErrorBuffer
'        End If
'    End If
'    If frmInfo.lstErr.ListCount <> 0 Then
'            frmInfo.addStatus cMT("there are errors!")
'            frmInfo.show_EMPTY_progress_bar
'            ' select first error:
'            frmInfo.click_on_error_message 0
'    Else
'
'
'
'
'
'
'
'            sDEBUGED_file = sFASM_FILENAME
'            sLAST_COMPILED_FILE = sFASM_FILENAME
'
'
'
'
'
'            ' =================================================
'            ' create L2LC() using the listing... :)
'            If sDEBUGED_file <> "" Then
'
'
'                ' does not proceed if bDIRECTED_TO_WRITE_BINF_FILE=false
'                write_BINF_file CutExtension(sDEBUGED_file) & ".binf"
'
'
'                If FileExists(sFASM_LIST) Then  ' jic
'                        ' parse the listing...
'                        Dim sLISTING_OFFSETS() As String
'                        Dim sLISTING_CODE() As String
'                        Dim lLISTING_CODE_LINES_COUNT As Long
'                        Dim iFileNum2 As Integer
'                        lLISTING_CODE_LINES_COUNT = 0
'                        iFileNum2 = FreeFile
'                        Open sFASM_LIST For Input Shared As iFileNum2
'                        Do While Not EOF(iFileNum2)
'                            Line Input #iFileNum2, s
'                            If Left(s, 1) Like "#" Then
'                                ReDim Preserve sLISTING_OFFSETS(0 To lLISTING_CODE_LINES_COUNT)
'                                ReDim Preserve sLISTING_CODE(0 To lLISTING_CODE_LINES_COUNT)
'                                Dim sOff As String
'                                Dim sCode As String
'                                sOff = Left(s, 10) ' 8 is enogh, but we'll take 10 jic.
'                                sCode = Mid(s, 49)
'                                sLISTING_OFFSETS(lLISTING_CODE_LINES_COUNT) = Val("&H" & sOff)
'                                sLISTING_CODE(lLISTING_CODE_LINES_COUNT) = sCode
'                                lLISTING_CODE_LINES_COUNT = lLISTING_CODE_LINES_COUNT + 1
'                            End If
'                        Loop
'                        Close iFileNum2
'
'
'
'
'                        Dim lOrigLineCount As Long
'                        lOrigLineCount = UBound(sLINES)
'                        ReDim L2LC(0 To lOrigLineCount)
'
'
'                        Dim k As Long
'
'
'                        ' fasm does not add ORG to the offsets in the listing,
'                        ' fasm shows offsets in the file, not in memory...
'                        Dim lOffsetCorrection As Long
'                        lOffsetCorrection = 0
'                        If sFASM_EXTENTION = "com" Then
'                            lOffsetCorrection = 256
'                        ElseIf sFASM_EXTENTION = "exe" Then
'                            ' correct by the first offset
'                            For k = 0 To lLISTING_CODE_LINES_COUNT - 1
'                                   If sLISTING_OFFSETS(k) <> 0 Then
'                                      lOffsetCorrection = -sLISTING_OFFSETS(k)
'                                      Exit For
'                                   End If
'                            Next k
'                        ElseIf sFASM_EXTENTION = "bin" And bFASM_MAKE_BOOT Then
'                            lOffsetCorrection = 31744 ' &H7C00
'
'                        ''''' KNOWN PROBLEM: may not be ideal for other ORGs....
'                        End If
'
'
'
'                        k = 0
'                        For L = 0 To lOrigLineCount
'                            ' not used ' L2LC(L).CharStart
'                            ' not used ' L2LC(L).CharLen
'                            L2LC(L).LineStarting = L
'                            L2LC(L).LineStoping = L
'                            Dim lFirst As Long
'                            Dim lLast As Long
'                            lFirst = -1
'                            lLast = -1
'
'
'                            If k < lLISTING_CODE_LINES_COUNT Then ' NO MORE CODE PRODUCING LINES?
'                                Dim JJ As Long
'                                For JJ = 0 To lLISTING_CODE_LINES_COUNT ' SHOULD NOT BE OVER THAT.
'                                    ' 4.00b16 removed Trim()
'                                    If StrComp(sLINES(L), sLISTING_CODE(k), vbBinaryCompare) = 0 Then
'                                        lFirst = sLISTING_OFFSETS(k) + lOffsetCorrection
'
'                                        ' #400b16-SYMBOL#
'                                        ' find if this line is recorded to symbol table
'                                        ' (I temporary put line number as lOFFSET)
'                                        Dim jj77 As Long
'                                        For jj77 = 0 To primary_symbol_TABLE_SIZE - 1
'                                           ' If primary_symbol_TABLE(jj77).lOFFSET = L Then       ' 2006-12-06
'                                           If primary_symbol_TABLE(jj77).lLINE_NUMBER = L Then    ' 2006-12-06
'                                                primary_symbol_TABLE(jj77).lOFFSET = lFirst
'                                                primary_symbol_TABLE(jj77).sSegment = "(GLOBAL)" ' #400b18-undefined-vars-no-listing# (it should be UNKNOWN_STR="(UNDEFINED)" before)
'                                                Exit For
'                                            End If
'                                        Next jj77
'
'
'                                        If k < lLISTING_CODE_LINES_COUNT - 1 Then
'                                            lLast = sLISTING_OFFSETS(k + 1) + lOffsetCorrection - 1
'                                        Else
'                                            lLast = FileLen(sFASM_FILENAME) + lOffsetCorrection - 1 ' not ideal...
'                                        End If
'                                        k = k + 1 ' ONE MACHINE CODE PRODUCING LINE IS GONE!
'                                        Exit For
'                                    End If
'                                Next JJ
'                            End If
'
'                            L2LC(L).ByteFirst = lFirst
'                            L2LC(L).ByteLast = lLast
'                        Next L
'                        ' listing for FASM is never disabled, even if LISTING=false in emu8086.ini
'                        SaveDebugInfoFile_AND_LISTING sDEBUGED_file, False  ' NO LISTING, the listing is already created by FASM.
'                End If
'            End If
'            ' =================================================
'
'
'            If Not bCOMPILE_ALL_SILENT Then
'                ' enable buttons on frmInfo
'                If Len(sLAST_COMPILED_FILE) > 0 Then
'                    frmInfo.cmdBrowseMyBuild.Enabled = True
'                    frmInfo.cmdEmulate.Enabled = True
'                    frmInfo.cmdExternal.Enabled = True
'                    frmInfo.mnuExternalRun.Enabled = True
'                    frmInfo.mnuDebugEXE.Enabled = True
'                    frmInfo.mnuShowListing.Enabled = True
'                    frmInfo.mnuShowSymbolTable.Enabled = True
'                End If
'            End If
'
'            ' #400b16-PE-RUN#
'            If iEXECUTABLE_TYPE = 0 Then
'
'                    frmInfo.addStatus " "
'                    frmInfo.addStatus cMT("Listing is saved:") & " """ & ExtractFileName(sFASM_LIST) & """"
'
'' reduntant
'' #400b18-undefined-vars-no-listing#
'''''                    ' #400b17-temporary-fix#
'''''                    ' currently I'm stuck with labels, so I just replace them with that...
'''''                     Dim jTFIX As Long
'''''                     For jTFIX = 0 To primary_symbol_TABLE_SIZE - 1
'''''                         If primary_symbol_TABLE(jTFIX).iSize = -1 Then ' is it label?
'''''                             primary_symbol_TABLE(jTFIX).sName = "_" & jTFIX
'''''                             primary_symbol_TABLE(jTFIX).lOFFSET = 0
'''''                             ' primary_symbol_TABLE(jTFIX).sType = "(TFIX)"
'''''                         End If
'''''                     Next jTFIX
'
'
'                    ' #400b18-undefined-vars-no-listing#
'                    ' this should replace labels and other vars/symbols that do not have an offset record
'                     Dim jTFIX As Long
'                     For jTFIX = 0 To primary_symbol_TABLE_SIZE - 1
'                         If primary_symbol_TABLE(jTFIX).sSegment = UNDEFINED_STR Then  ' still undefined?
'                             primary_symbol_TABLE(jTFIX).sName = "_" & jTFIX
'                             primary_symbol_TABLE(jTFIX).lOFFSET = 0
'                             primary_symbol_TABLE(jTFIX).iSize = -1  ' say that it's a label to avoid adding to frmVars
'                             primary_symbol_TABLE(jTFIX).sType = UNDEFINED_STR
'                         End If
'                     Next jTFIX
'
'
'
'                    ' #400b16-SYMBOL#
'                    save_SYMBOL_TABLE_to_FILE sFASM_FILENAME, True
'
'                    If bIfSucessLoadInEmulator Then
'                        If sDEBUGED_file <> "" Then '  additional check!
'                            If bDONOT_ASK_WHERE_TO_SAVE Then
'                                frmInfo.Hide
'                                frmEmulation.DoShowMe
'                            End If
'                            bAlwaysNAG = False
'                            frmEmulation.loadFILEtoEMULATE sDEBUGED_file, True, bDONOT_ASK_WHERE_TO_SAVE
'                        End If
'                    End If
'
'            Else
'                    ' the emulator is clean because of delete_noname_files()
'            End If
'
'
'            ' 4.00b16
'            frmInfo.addStatus ExtractFileName(sFASM_FILENAME)
'
'    End If
'
'
'
'    frmMain.bCOMPILING = False
'    bASSEMBLER_STOPED = True ' jic ?
'    Erase sLINES
'    Erase sLISTING_CODE
'    Erase sLISTING_OFFSETS
'
'Exit Function
'err1:
'    Dim sERR As String
'    sERR = Err.Description
'
'    On Error Resume Next
'
'    Debug.Print "assemble_with_fasm: " & sERR
'    frmInfo.addErr_FASM 0, "error: " & LCase(sERR), ""
'    bIfSucessLoadInEmulator = False ' ns, jic
'
'    clean_up_if_error
'
'
'probably_canceled:  ' #400b20-cosmetic3#
'    stop_precompile_animation
'
'    frmMain.bCOMPILING = False
'    bASSEMBLER_STOPED = True ' jic ?
'    DELETE_FILE_if_exists s_FASM_BAT_PATH
'    Erase sLINES
'    Erase sLISTING_CODE
'    Erase sLISTING_OFFSETS
'
'End Function
'
'
Public Sub clean_up_if_error()
On Error Resume Next

    ' STOP PRECOMPILE ANIMATION
    frmInfo.stop_precompile_animation
    frmInfo.set_current_text_cool ""
    frmInfo.lstStatus.Clear               ' STATUS CLEARED
    
    frmInfo.addStatus cMT("unrecoverable error!")

End Sub



' check ".log" if there are errors add then to lstErr
' or if no errors, add to status instead
Private Sub CHECK_FASM_LOG(sFASM_LOG As String, sFASM_SOURCE As String)
On Error GoTo err1

Dim bFLAG_ERROR As Boolean
bFLAG_ERROR = False

Dim s As String
Dim sLogLines() As String
Dim iFileNum As Integer
Dim lCounter As Long
Dim L As Long

iFileNum = FreeFile

Open sFASM_LOG For Input Shared As iFileNum
' check to avoid endless loop added 2006-11-28 (seen with MASM) for some reason EOF does not return TRUE!!
Do While (Not EOF(iFileNum)) And frmMain.bCOMPILING
    ReDim Preserve sLogLines(0 To lCounter)
    Line Input #iFileNum, s
    sLogLines(lCounter) = s
    If Not bFLAG_ERROR Then
        bFLAG_ERROR = startsWith(s, "error:")
    End If
    lCounter = lCounter + 1
    If lCounter > 100 Then Exit Do  ' 2006-11-28
Loop
Close #iFileNum



If Not bFLAG_ERROR Then
    ' no errors, add all lines to status!
    For L = 0 To lCounter - 1
        frmInfo.addStatus sLogLines(L)
    Next L
Else
    ' first line is generally a status
    Dim lSkipFirstLine As Long
    If startsWith(sLogLines(0), "flat assembler") Then
        frmInfo.addStatus sLogLines(0)
        lSkipFirstLine = 1
    Else
        lSkipFirstLine = 0
    End If
    
    For L = lSkipFirstLine To lCounter - 1
        s = sLogLines(L)
        
        Dim lLineNum As Long
        
        If endsWith(s, "]:") Then
            If startsWith(s, sFASM_SOURCE) Then
                lLineNum = extractLineNum_FASM_LOG(s)
            Else
                lLineNum = 0
                frmInfo.addErr_FASM lLineNum, s, ""
            End If
            GoTo CONTINUE
        End If
        
        frmInfo.addErr_FASM lLineNum, s, s
        
        
                ' too complicated.
                '''   If startsWith(s, "error:") Then
                '''        If L >= 3 Then
                '''            Dim lLineNum As Long
                '''            Dim sSourceAndLineNum As String
                '''            sSourceAndLineNum = sLogLines(L - 2) ' (usually) source filename with line number
                '''            lLineNum = extractLineNum_FASM_LOG(sSourceAndLineNum)
                '''            If startsWith(sSourceAndLineNum, sFASM_SOURCE) Then
                '''                frmInfo.addErr_FASM lLineNum, sLogLines(L - 1), ""  ' (usually) the original line.
                '''                frmInfo.addErr_FASM lLineNum, s, ""
                '''            Else
                '''                ' the error is not from sFASM_SOURCE....
                '''                Dim sIncludeFileName As String
                '''                Dim l77 As Long
                '''                l77 = InStr(1, sSourceAndLineNum, "[") - 1
                '''                If l77 > 0 Then
                '''                    sIncludeFileName = ExtractFileName(Trim(Mid(sSourceAndLineNum, 1, l77)))
                '''                Else
                '''                    sIncludeFileName = "unknown (!)"
                '''                End If
                '''                frmInfo.addErr_FASM 0, "error in include file: " & sSourceAndLineNum, sIncludeFileName
                '''                frmInfo.addErr_FASM 0, sLogLines(L - 1), sIncludeFileName  ' (usually) the original line.
                '''                frmInfo.addErr_FASM 0, s, sIncludeFileName
                '''
                '''                ' there can be more than a single line
                '''
                '''            End If
                '''        Else
                '''            ' error without file name (never observed)
                '''            frmInfo.addErr_FASM 0, s, ""
                '''        End If
                '''   End If
CONTINUE:
    Next L
    
End If







Erase sLogLines

Exit Sub
err1:
Debug.Print "CHECK_FASM_LOG: " & Err.Description
' 2006-11-29 to avoid future hangups' Resume Next
End Sub


Function extractLineNum_FASM_LOG(s As String) As String
On Error GoTo err1

    Dim L As Long
    
    L = InStrRev(s, "[")
    
    
    extractLineNum_FASM_LOG = Val(Mid(s, L + 1))

Exit Function
err1:
    Debug.Print "extractLineNum_FASM_LOG: " & Err.Description
End Function
















' #400b16-SYMBOL#
' cloned from frmMain.build_primary_SymbolTable()
' but instead of adding 00000 for default offset we add line numbers
' fixed on 2006-12-06 no longer using lOFFSET, added special var into type.
Public Sub FASM_build_primary_SymbolTable(ByRef sLINES() As String)

    Dim sName As String
    Dim s As String
    Dim sType As String ' used in proc.
    

    CLEAR_primary_symbol_TABLE

    currentLINE = 0


    ' #400b17-bug-var# '  it must not be changed!
    '#400b18-undefined-vars-no-listing# ' sCurSegName = "(GLOBAL)" ' means global file offset (for fasm listing)
    sCurSegName = UNDEFINED_STR '#400b18-undefined-vars-no-listing#  ' undefined until set by the parser to  "(GLOBAL)"
    

    Do While (currentLINE <= UBound(sLINES))
    
        s = sLINES(currentLINE)
       
        ' DONE ALREADY '  s = myTrim_RepTab(s)
        
        
        s = myTrim_RepTab(remove_Comment(s))   ' 4.00b17
        
        
more_on_that_line:


        ' no name, no record in table.
        
        If starts_with_LABEL_or_SEG_PREFIX(s) Then
            
            Dim lK As Long
            lK = InStr(1, s, ":")
            
            sName = Mid(s, 1, lK - 1) '  get name before ":"
                       
            sName = Trim(UCase(sName))
            

            
            ' segment prefixes are not labels!!!!
             If (sName <> "DS") Then
                If (sName <> "CS") Then
                  If (sName <> "ES") Then
                    If (sName <> "SS") Then
                    
                        ' #400b18-bug-fasm147# ' If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration
                        add_to_Primary_Symbol_Table sName, 0, -1, "LABEL", sCurSegName, currentLINE
                          
                    End If
                  End If
                End If
             End If
            
            
            ' (same as CompileTheSource)
            If Right(s, 1) <> ":" Then ' ":" is not the last char?
                s = Trim(Mid(s, InStr(1, s, ":") + 1)) ' remove the label.
                GoTo more_on_that_line
            End If
            
            GoTo next_please
            
        End If
                   
                   
                   

        Dim sTOKEN1 As String  ' index 0
        Dim sTOKEN1_not_UCASE As String  ' index 0  ' #400b18-bug-fasm147#
        Dim sTOKEN2 As String  ' index 1
        Dim sTOKEN3 As String  ' index 2
        
        ' #400b20-FPU-show-dd,dq,dt#
        If InStr(1, s, "DB ", vbTextCompare) > 0 Or _
           InStr(1, s, "DW ", vbTextCompare) > 0 Or _
           InStr(1, s, "DD ", vbTextCompare) > 0 Or _
           InStr(1, s, "DQ ", vbTextCompare) > 0 Or _
           InStr(1, s, "DT ", vbTextCompare) > 0 Or _
           InStr(1, s, "PROC", vbTextCompare) > 0 Or _
           InStr(1, s, "SEGMENT", vbTextCompare) > 0 Or _
           InStr(1, s, "DUP ", vbTextCompare) > 0 Or _
           InStr(1, s, "DUP(", vbTextCompare) > 0 _
           Then
                    sTOKEN1_not_UCASE = getToken_str(s, 0, " ")
                    sTOKEN1 = UCase(sTOKEN1_not_UCASE)
                    sTOKEN2 = UCase(getToken_str(s, 1, " "))
                    sTOKEN3 = UCase(getToken_str(s, 2, " "))  ' for incorrect dup: lion 32 dup (1,2,3,4,5,6,7,8)
           Else
                    GoTo next_please
        End If
        
                   
                   
        ' no name, no record in table.
                    
        If (sTOKEN2 = "DB") Then
            sName = sTOKEN1_not_UCASE
            ' #400b18-bug-fasm147# ' If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration
            add_to_Primary_Symbol_Table sName, 0, 1, "VAR", sCurSegName, currentLINE
            

        ElseIf (sTOKEN2 = "DW") Then
            sName = sTOKEN1_not_UCASE
            ' #400b18-bug-fasm147# ' If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration
            add_to_Primary_Symbol_Table sName, 0, 2, "VAR", sCurSegName, currentLINE
            
        ' #400b20-FPU-show-dd,dq,dt#
        ElseIf (sTOKEN2 = "DD") Then
            sName = sTOKEN1_not_UCASE
            ' #400b18-bug-fasm147# ' If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration
            add_to_Primary_Symbol_Table sName, 0, 4, "VAR", sCurSegName, currentLINE
                       
                       
        ' #400b20-FPU-show-dd,dq,dt#
        ElseIf (sTOKEN2 = "DQ") Then
            sName = sTOKEN1_not_UCASE
            add_to_Primary_Symbol_Table sName, 0, 8, "VAR", sCurSegName, currentLINE
                                      
                                      
        ' #400b20-FPU-show-dd,dq,dt#
        ElseIf (sTOKEN2 = "DT") Then
            sName = sTOKEN1_not_UCASE
            add_to_Primary_Symbol_Table sName, 0, 10, "VAR", sCurSegName, currentLINE
                                      
                                                
                                      
            
        ElseIf contains_PROC(s) Then
            sName = sTOKEN1_not_UCASE ' get name (it's the first token)
            
            ' fool proof solution
            If UCase(sName) = "PROC" Then
                sName = getNewToken(s, 1, " ") ' get second token, probably user put proc name after the proc.
            End If
            
            If endsWith(s, " FAR") Then ' to avoid any problems...
                sType = "FAR"
            Else
                sType = "NEAR"  ' default.
            End If
            ' #400b18-bug-fasm147# ' If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration
            add_to_Primary_Symbol_Table sName, 0, -1, sType, sCurSegName, currentLINE
            
       ElseIf sTOKEN1 = "SEGMENT" Or sTOKEN2 = "SEGMENT" Then
            sName = sTOKEN1_not_UCASE ' get name (it's the first token)
            If UCase(sName) = "SEGMENT" Then
                '  probably label is the second
                sName = getNewToken(s, 1, " ")
                If Len(sName) = 0 Then
                    ' first token is segment directive itselft, it means that we have no segment name.
                    sName = "UNNAMED_SEGMENT_" & CStr(lUNNAMED_SEGMENT_COUNTER)
                    lUNNAMED_SEGMENT_COUNTER = lUNNAMED_SEGMENT_COUNTER + 1
                End If
            End If
            
            
           ' #400b18-bug-fasm147# ' leave it up to fasm, it's case sensitive ' If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration

            add_to_Primary_Symbol_Table sName, 0, -5, "SEGMENT", "(ITSELF)", currentLINE

' ' #400b17-bug-var# ' no!
'''            ' should it be for FASM too?
'''            sCurSegName = sName

        
        ElseIf sTOKEN3 = "DUP" Then ' #400b3-impdup2#
this_is_dup_too:
            sName = sTOKEN1_not_UCASE
            ' #400b18-bug-fasm147# ' If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration

            If Len(sName) = 2 Then
                If sName = "DB" Then
                    ' skip.
                ElseIf sName = "DW" Then
                    ' skip.
                ElseIf sName = "DD" Then
                    'skip.
                Else
                    GoTo add_me_to_st
                End If
            Else
add_me_to_st:
                 add_to_Primary_Symbol_Table sName, 0, 1, "VAR", sCurSegName, currentLINE
            End If
            
       ElseIf Left(sTOKEN3, 4) = "DUP(" Then
            GoTo this_is_dup_too
            
           

        End If
        
        
next_please:

        
        currentLINE = currentLINE + 1

    Loop


' #400b18-bug-fasm147# '
'''    Exit Sub
'''error_duplicate_declaration:
'''    Debug.Print currentLINE, "FASM_build_primary_SymbolTable : duplicate declaration? of:" & " " & sName, sName

End Sub


' #400b20-cosmetic3#
Public Sub stop_precompile_animation()
On Error Resume Next

    ' STOP PRECOMPILE ANIMATION
    frmInfo.stop_precompile_animation
    frmInfo.set_current_text_cool ""
    frmInfo.lstStatus.Clear               ' STATUS CLEARED
    
End Sub

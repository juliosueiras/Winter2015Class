Attribute VB_Name = "mMASM"
' starting implementation 2006-11-27

' #404-masm#

Option Explicit


' contains path folder where the root of MASM installation
Global sGLOBAL_MASM_FOLDER As String
' contains path folder where "ml.exe" exists
Global sMASM_LOCATION As String
' contains path folder where "link.exe" exists
Global sMASM_LINK_LOCATION As String
' contains path folder where varios include files of MASM are (if any)
Global sMASM_INCLUDE_LOCATION As String

Const UNDEFINED_STR As String = "(UNDEFINED)"


'Function assemble_with_MASM(ByRef bIfSucessLoadInEmulator As Boolean, bDONOT_ASK_WHERE_TO_SAVE As Boolean) As Boolean
'On Error GoTo err1
'
'    Dim bMASM_MAKE_BOOT As Boolean
'    bMASM_MAKE_BOOT = False
'
'
'    Dim bIGNORE_NEXT_RAW_OFFSET As Boolean
'    bIGNORE_NEXT_RAW_OFFSET = False
'
'
'
'    ' same as in set_LISTS()
'    frmOrigCode.cmaxActualSource.Text = ""
'    frmOrigCode.PREPARE_cmaxActualSource
'
'    iEXECUTABLE_TYPE = 0
'
'    frmInfo.clearErrorBuffer_and_Text     ' ERROR LIST RESET (JIC)
'
'
'    Dim L As Long
'    Dim s As String
'
'
'    Dim sMASM_OUTPUT As String    ' output file, exe, bin, com...
'    Dim sMASM_EXTENTION As String ' generally MASM automatically sets the correct extention
'    Dim sMASM_SOURCE As String
'    Dim sMASM_OBJ As String ' 2006-11-29 to make sure it will make .obj files in MyBuild folder, and not in emu8086 root or in MySource.
'    Dim sMASM_LIST As String
'    Dim sMASM_MAP As String
'    Dim sMASM_LOG As String
'
'
'    sMASM_LOCATION = get_property("emu8086.ini", "MASM_PATH", "")
'    sGLOBAL_MASM_FOLDER = Add_BackSlash(sMASM_LOCATION)
'    If endsWith(sGLOBAL_MASM_FOLDER, "\BIN\") Then
'        sGLOBAL_MASM_FOLDER = Mid(sGLOBAL_MASM_FOLDER, 1, Len(sGLOBAL_MASM_FOLDER) - 4)
'    End If
'
'    sMASM_LOCATION = Trim(sMASM_LOCATION)
'    If sMASM_LOCATION = "" Then
'        MsgBox "MASM_PATH is not set in emu8086.ini"
'        GoTo ml_not_found
'    End If
'    If StrComp(Mid(sMASM_LOCATION, Len(sMASM_LOCATION) - 3), ".exe", vbTextCompare) = 0 Then
'        sMASM_LOCATION = Mid(sMASM_LOCATION, 1, Len(sMASM_LOCATION) - 6) ' cut off "ml.exe"
'    End If
'    sMASM_LOCATION = Add_BackSlash(sMASM_LOCATION)
'    If FileExists(sMASM_LOCATION & "BIN\" & "ML.EXE") Then
'        sMASM_LOCATION = Add_BackSlash(sMASM_LOCATION) & "BIN\"
'    End If
'    If Not FileExists(sMASM_LOCATION & "ML.EXE") Then
'        MsgBox "ML.EXE not found at path specified in emu8086.ini" & vbNewLine & _
'               "MASM_PATH must be set to MASM folder."
'        GoTo ml_not_found
'    End If
'
'
'    sMASM_LINK_LOCATION = get_property("emu8086.ini", "MASM_LINK_PATH", "")
'    If sMASM_LINK_LOCATION = "" Then
'        If FileExists(sMASM_LOCATION & "LINK.EXE") Then
'            sMASM_LINK_LOCATION = sMASM_LOCATION
'        ElseIf FileExists(sGLOBAL_MASM_FOLDER & "BINR\LINK.EXE") Then
'            sMASM_LINK_LOCATION = sGLOBAL_MASM_FOLDER & "BINR\"
'        Else
'            sMASM_LINK_LOCATION = sGLOBAL_MASM_FOLDER
'        End If
'    End If
'
'
'    sMASM_INCLUDE_LOCATION = get_property("emu8086.ini", "MASM_INCLUDE_PATH", "")
'    If sMASM_INCLUDE_LOCATION = "" Then
'       sMASM_INCLUDE_LOCATION = sGLOBAL_MASM_FOLDER & "INCLUDE"
'    End If
'
'
'
'
'    '''''''''''''''''''''''''''''''''''''''''
'    ' determine output type: com, exe... probably bin (if #make_bin# detected) (set sMASM_EXTENTION)
'    sMASM_EXTENTION = ""
'    Dim sLINES() As String
'    ReDim sLINES(0 To frmMain.txtInput.lineCount)   ' bigger jic.
'    For L = 0 To frmMain.txtInput.lineCount - 1
'
'        ' same as in set_LISTS()
'
'        ' this is unique to MASM, in FASM code there is no myTrim_RepTab()
'        ' I added it because later it did not make the compare correctly at #2006-11-27comp#
'        s = myTrim_RepTab(frmMain.txtInput.getLine(L))
'
'        ' we decided to left the original line unchanged!
'        ' unless there is some emu8086 unique directives that are commented out.
'
'        If TRIM_ORIGINAL_SOURCE Then
'            frmOrigCode.cmaxActualSource.AddText Trim(s) & vbNewLine
'        Else
'            frmOrigCode.cmaxActualSource.AddText s & vbNewLine
'        End If
'
'        Dim sNO_COMMENT_NO_TAB_TRIMED As String
'        sNO_COMMENT_NO_TAB_TRIMED = Trim(myTrim_RepTab(remove_Comment(s)))
'
'        If Len(sNO_COMMENT_NO_TAB_TRIMED) > 0 Then '  4.00b16
'                ' preparse.... remove #make_etc...# directives
'                If startsWith(sNO_COMMENT_NO_TAB_TRIMED, "name ") Then
'                    sNamePR = replace_illigal_for_file_name(Trim(Mid(sNO_COMMENT_NO_TAB_TRIMED, Len("NAME "))))
'                    ' name is completely legal for MASM.
'                End If
'                If Left(sNO_COMMENT_NO_TAB_TRIMED, 1) = "#" Then
'                   If startsWith(sNO_COMMENT_NO_TAB_TRIMED, "#masm") Then
'                        s = "; " & s ' comment out for MASM.
'                    ElseIf startsWith(sNO_COMMENT_NO_TAB_TRIMED, "#MAKE_") Then
'                        Select Case UCase(sNO_COMMENT_NO_TAB_TRIMED)
'                        Case "#MAKE_COM#"
'                            sMASM_EXTENTION = "com"
'                        Case "#MAKE_EXE#"
'                            sMASM_EXTENTION = "exe"
'                        Case "#MAKE_BIN#"
'                            sMASM_EXTENTION = "bin"
'                        Case "#MAKE_BOOT#"
'                            sMASM_EXTENTION = "bin"
'                            bDIRECTED_TO_WRITE_BINF_FILE = True ' .boot file is obsolete because it's not 8.3 compatible, now we will have only .bin files with .binf !
'                            mBINF.set_DEFAULT_FOR_BOOT
'                            bMASM_MAKE_BOOT = True
'                        Case Else
'                            Debug.Print "wrong output type: " & s
'                        End Select
'                        s = "; " & s ' comment out for MASM.
'                    Else
'                        PROCESS_BINF_DIRECTIVE sNO_COMMENT_NO_TAB_TRIMED, L
'                        If bDIRECTED_TO_WRITE_BINF_FILE Then
'                            ' skip all # lines only if there is at least 1 legal bin directive.
'                            s = "; " & s ' comment out for MASM.
'                        End If
'                    End If
'                End If
'
'                If InStr(1, sNO_COMMENT_NO_TAB_TRIMED, "org", vbTextCompare) > 0 Then
'                    If evalExpr(getToken(sNO_COMMENT_NO_TAB_TRIMED, 1, " ")) = 256 Then
'                        sMASM_EXTENTION = "com"
'                        iEXECUTABLE_TYPE = 0
'                    End If
'                End If
'
'
'                ' PAGE directive may cause problems for our listing parsing, so comment it out:
'                If UCase(Left(sNO_COMMENT_NO_TAB_TRIMED, 4)) = "PAGE" Then
'                    s = "; " & s ' comment out for MASM.
'                End If
'
'
'         End If
'
'        sLINES(L) = s
'    Next L
'    '''''''''''''''''''''''''''''''''''''''''
'
'
'
'
'
'
'' 2006-12-05 '    MASM_build_primary_SymbolTable sLINES
'
'
'
'
'
'
'    Dim sDOT As String
'    Dim sSuffix As String
'    If Len(sMASM_EXTENTION) > 0 Then
'        ' no extention - no dot, and no suffix
'        sDOT = "."
'        ' sSuffix = "_"
'        sSuffix = "" ' decided not to use suffixes for MASM, for 8.3 filename comatibility.
'    End If
'
'
'
'
'
'    If (bIfSucessLoadInEmulator And bDONOT_ASK_WHERE_TO_SAVE) Or bCOMPILE_ALL_SILENT Then
'            myMKDIR s_MyBuild_Dir
'            If frmMain.sOpenedFile <> "" Then
'                sMASM_OUTPUT = Add_BackSlash(s_MyBuild_Dir) & make8(check_if_sNamePR_defined(CutExtension(ExtractFileName(frmMain.sOpenedFile)))) & sDOT & sMASM_EXTENTION & sSuffix
'            Else
'                sMASM_OUTPUT = Add_BackSlash(s_MyBuild_Dir) & make8(sNamePR) & sDOT & sMASM_EXTENTION & sSuffix
'            End If
'    Else
'            Dim ST As String
'
'            ' remember-prev-build-dir
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
'            myMKDIR ST
'
'            If frmMain.sOpenedFile <> "" Then
'                If myChDir(ST) Then
'                    ComDlg.FileInitialDirD = ST
'                End If
'                ComDlg.FileNameD = make8(check_if_sNamePR_defined(CutExtension(ExtractFileName(frmMain.sOpenedFile)))) & sDOT & sMASM_EXTENTION
'            Else
'                If myChDir(ST) Then
'                    ComDlg.FileInitialDirD = ST
'                End If
'                ComDlg.FileNameD = make8(sNamePR) & sDOT & sMASM_EXTENTION
'            End If
'
'            '  to make F12 work
'            If frmInfo.Visible Then
'                ComDlg.hwndOwner = frmInfo.hwnd
'            Else
'                ComDlg.hwndOwner = frmMain.hwnd
'            End If
'            ComDlg.Flags = OFN_HIDEREADONLY + OFN_PATHMUSTEXIST
'            ComDlg.Filter = "all binary files (*.exe;*.com;*.bin;*.dll;*.sys;*.obj)|*.exe;*.com;*.bin;*.dll;*.sys;*.obj|exe files (*.exe)|*.exe|com files (*.com)|*.com|bin files (*.bin)|*.com|all Files (*.*)|*.*"
'            ComDlg.DefaultExtD = "" ' (default is set my MASM itself)
'            sMASM_OUTPUT = ComDlg.ShowSave
'    End If
'    ' --------------------------------------------------------
'
'
'    If sMASM_OUTPUT = "" Then
'        ' canceled.
'        bIfSucessLoadInEmulator = False
'        GoTo probably_canceled
'    End If
'
'
'
'    sPREV_BUILD_DIR = ExtractFilePath(sMASM_OUTPUT)
'
'    ' 2006-11-29  BETA 5
'    ' more compatibility in case emu8086 is installed into folder with a long name
'    ' here make83() is used only because user may overwrite the default setting and uses the longer filename
'    sMASM_OUTPUT = Add_BackSlash(getDosPath(sPREV_BUILD_DIR)) & make83(ExtractFileName(sMASM_OUTPUT))
'
'
'
'
'    '===============================================================
'
'    ' delete the old file (if exists):
'    If FileExists(sMASM_OUTPUT) Then
'        If Not check_if_its_in_MyBuild_folder_or_ask_to_overwrite(sMASM_OUTPUT) Then
'            bIfSucessLoadInEmulator = False
'            GoTo probably_canceled
'        End If
'        DELETE_FILE sMASM_OUTPUT
'    End If
'    If FileExists(sMASM_OUTPUT) Then
'        frmInfo.addErr_MASM 0, cMT("cannot use this filename / sharing violation / access denied"), ""
'    End If
'
'    ' \\\\\\\  in case of auto extention  ///////
'
'    If FileExists(sMASM_OUTPUT & ".exe") Then
'        If Not check_if_its_in_MyBuild_folder_or_ask_to_overwrite(sMASM_OUTPUT & ".exe") Then
'            bIfSucessLoadInEmulator = False
'            GoTo probably_canceled
'        End If
'        DELETE_FILE sMASM_OUTPUT & ".exe"
'    End If
'
'    If FileExists(sMASM_OUTPUT & ".com") Then
'        If Not check_if_its_in_MyBuild_folder_or_ask_to_overwrite(sMASM_OUTPUT & ".com") Then
'            bIfSucessLoadInEmulator = False
'            GoTo probably_canceled
'        End If
'        DELETE_FILE sMASM_OUTPUT & ".com"
'    End If
'
'    '===============================================================
'
'
'    DELETE_FILE_if_exists sMASM_OUTPUT & ".obj"
'    DELETE_FILE_if_exists sMASM_OUTPUT & ".lst"
'    DELETE_FILE_if_exists sMASM_OUTPUT & ".symbol"
'    DELETE_FILE_if_exists sMASM_OUTPUT & ".debug"
'    DELETE_FILE_if_exists sMASM_OUTPUT & ".log"
'    DELETE_FILE_if_exists CutExtension(sMASM_OUTPUT) & ".binf"
'
'
'
'    ' 2006-11-29
'    ' had to use "asm" instead of "~asm" because MASM seems to have problems
'    ' with long filenames or something...
'    ' and we also use CutExtension()
'
'    ' save sLINES() to "*.~sm" file
'    ' save source for masm to:
'    sMASM_SOURCE = CutExtension(sMASM_OUTPUT) & ".asm" ' ".~asm"
'    Dim iFileNum0 As Integer
'    iFileNum0 = FreeFile
'    Open sMASM_SOURCE For Output Shared As iFileNum0
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
'' instead we decided to create that file with extranction of listing #b44a#
''''    ' 2006-11-30
''''    ' for compatibily, we just create a copy of ".asm" as ".~asm" with extention:
''''    myFileCopy sMASM_SOURCE, sMASM_OUTPUT & ".~asm"
'
'
'
''///////////////// batch
'
'    Dim sMASM_OK As String
'    sMASM_OK = Add_BackSlash(s_MyBuild_Dir) & "_masm.ok"
'
'    ' delete "_masm.ok" (if exists) JIC.
'    DELETE_FILE_if_exists sMASM_OK
'
'
'
'    ' jic
'    Dim s_MASM_BAT_PATH As String
'    s_MASM_BAT_PATH = Add_BackSlash(s_MyBuild_Dir) & "_masm.bat"
'    DELETE_FILE_if_exists s_MASM_BAT_PATH
'
'    ' jic
'    ' if still exists....  (some masm/windows xp lock error... etc...)
'    If FileExists(s_MASM_BAT_PATH) Then
'        Debug.Print "access denied [MB]"
'        Dim lFB11 As Long
'        For lFB11 = 0 To 11
'           s_MASM_BAT_PATH = Add_BackSlash(s_MyBuild_Dir) & "_masm" & CStr(lFB11) & ".bat"
'           If Not FileExists(s_MASM_BAT_PATH) Then
'                Exit For ' OK, will use that one.
'           Else
'                ' try to delete that too...
'                DELETE_FILE s_MASM_BAT_PATH
'                If Not FileExists(s_MASM_BAT_PATH) Then
'                    Exit For ' OK, will use that one.
'                End If
'           End If
'        Next lFB11
'    End If
'
'
'
'
'    ' set and delete old .log, .map, .lst
'    ' for 8.3 compatibility we use .lst instead of .list
'    ' and we also use CutExtension()
'    sMASM_MAP = CutExtension(sMASM_OUTPUT) & ".map"
'    sMASM_LIST = CutExtension(sMASM_OUTPUT) & ".lst"
'    sMASM_LOG = CutExtension(sMASM_OUTPUT) & ".log"
'    sMASM_OBJ = CutExtension(sMASM_OUTPUT) & ".obj"
'    DELETE_FILE_if_exists sMASM_MAP
'    DELETE_FILE_if_exists sMASM_LIST
'    DELETE_FILE_if_exists sMASM_LOG
'    DELETE_FILE_if_exists sMASM_OBJ
'
'
'    '       create "_masm.bat"
'    Dim iFileNum As Integer
'    iFileNum = FreeFile
'    Open s_MASM_BAT_PATH For Output Shared As iFileNum
'
'
'    s = "rem    EMU8086 - MASM INCORPORATION  -- " & Date & " -- " & Time
'    Print #iFileNum, s
'    ' allow MASM find dependency/include files (if any)
'    If frmMain.sOpenedFile = "" Then
'        ' not sure if it works this way for MASM, but for FASM it does:
'        s = "SET INCLUDE=" & Add_BackSlash(App.Path) & "inc;" & Add_BackSlash(App.Path) & "MySource;" & sMASM_INCLUDE_LOCATION
'        Print #iFileNum, s
'    Else
'        ' change dir to source's path
'        s = Left(frmMain.sOpenedFile, 1) & ":" ' "d:"
'        Print #iFileNum, s
'        s = "cd """ & ExtractFilePath(frmMain.sOpenedFile) & """"
'        Print #iFileNum, s
'
'        s = "SET INCLUDE=" & Add_BackSlash(App.Path) & "inc;" & Add_BackSlash(App.Path) & "MySource;" & ExtractFilePath(frmMain.sOpenedFile) & ";" & sMASM_INCLUDE_LOCATION
'        Print #iFileNum, s
'    End If
'
'    s = "SET PATH=" & sMASM_LOCATION & ";" & sMASM_LINK_LOCATION
'    Print #iFileNum, s
'
'
'    ' defaults... (not sure if these are used, I just copied it from NEW-VARS.BAT from MASM611\BINR)
'    s = "SET LIB=" & sGLOBAL_MASM_FOLDER & "LIB"
'    Print #iFileNum, s
'    s = "SET INIT=" & sGLOBAL_MASM_FOLDER & "INIT"
'    Print #iFileNum, s
'    s = "SET HELPFILES=" & sGLOBAL_MASM_FOLDER & "HELP\*.HLP"
'    Print #iFileNum, s
'    s = "SET ASMEX=" & sGLOBAL_MASM_FOLDER & "SAMPLES"
'    Print #iFileNum, s
'
'    ' instead of using WINDOWS\TEMP, I set it to MyBuild directory
'    s = "SET TMP=" & s_MyBuild_Dir
'    Print #iFileNum, s
'
'
'
'    Dim sENABLE_TINY As String
'    If sMASM_EXTENTION = "com" Or sMASM_EXTENTION = "bin" Then
'        sENABLE_TINY = "/AT"
'    Else
'        sENABLE_TINY = ""
'    End If
'
'
'    s = Add_BackSlash(sMASM_LOCATION) & "ml.exe /Fl""" & sMASM_LIST & """ /Fm""" & sMASM_MAP & """ /Fo""" & sMASM_OBJ & """ /Sa " & sENABLE_TINY & " " & getDosPath(sMASM_SOURCE) & " /Fe""" & sMASM_OUTPUT & """   > """ & sMASM_LOG & """"
'    Rem /Fe - name exectuable
'    Rem /Fl - listing
'    Rem /Fm - map
'    Rem /Sa - detailed.
'    Rem /Fo - object file.
'
'
'    Print #iFileNum, s
'
'
'    ' change dir back to c:\emu8086\
'    s = Left(App.Path, 1) & ":"  ' "c:"
'    Print #iFileNum, s
'    s = "cd """ & App.Path & """"
'    Print #iFileNum, s
'
'    s = "echo    masm-ok    > """ & sMASM_OK & """ "
'    Print #iFileNum, s
'    Close iFileNum
'
'    ' launch it "_masm.bat"
'    Dim d As Double
'    d = Shell(s_MASM_BAT_PATH, vbMinimizedNoFocus)   '     LAUNCH MASM !!!!!!!!!!!!!!!!!!!
'    If d = 0 Then
'        frmInfo.addErr_MASM 0, "error: cannot start MASM!", ""
'    Else
'        '    WAIT FOR "_masm.ok"
'        Do While frmMain.bCOMPILING
'            If FileExists(sMASM_OK) Then GoTo del_masm_ok
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
'        Loop
'del_masm_ok:
'        DoEvents
'        '  delete "_masm.ok"
'        DELETE_FILE_if_exists sMASM_OK
'    End If
'
'    If Not frmMain.bCOMPILING Then
'       frmInfo.addErr_MASM 0, cMT("assembler aborted"), ""
'    End If
'
'any_way:
'
'
'
'    ' DEBUG DEBUG!!! REMOVE COMMENT!!
'    ' Debug.Print "DEBUG DEBUG!!! REMOVE COMMENT!!"
'    ' no need to keep this file
'    DELETE_FILE_if_exists s_MASM_BAT_PATH
'
'    stop_precompile_animation
'
'    ' AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
'
'
'
'    CHECK_MASM_LOG sMASM_LOG, sMASM_SOURCE
'
'    frmInfo.showErrorBuffer
'
'
'    If frmInfo.lstErr.ListCount = 0 Then  ' no errors, but no oputput from masm?
'        If Not FileExists(sMASM_OUTPUT) Then
'            If FileExists(sMASM_OUTPUT & ".exe") Then
'                sMASM_OUTPUT = sMASM_OUTPUT & ".exe"
'                GoTo ok_auto_output
'            End If
'            If FileExists(sMASM_OUTPUT & ".com") Then
'                sMASM_OUTPUT = sMASM_OUTPUT & ".com"
'                GoTo ok_auto_output
'            End If
'            frmInfo.addErr_MASM 0, cMT("no binary output!"), ""
'            frmInfo.showErrorBuffer
'        End If
'    End If
'ok_auto_output:
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
'            sDEBUGED_file = sMASM_OUTPUT
'            sLAST_COMPILED_FILE = sMASM_OUTPUT
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
'                If FileExists(sMASM_LIST) Then  ' jic
'                        ' parse the listing...
'                        Dim sLISTING_OFFSETS() As String
'                        Dim sLISTING_CODE() As String
'                        Dim sLISTING_SEGMENT() As String   ' MASM ONLY!!
'                        Dim lSegmentAddition As Long       ' MASM ONLY!!
'                        Dim lPREV_RAW_OFFSET As Long       ' MASM ONLY!!
'                        Dim sCurrentSegmentName As String  ' MASM ONLY!!
'                        sCurrentSegmentName = ""
'                        lSegmentAddition = 0
'                        lPREV_RAW_OFFSET = 0
'                        Dim lLISTING_CODE_LINES_COUNT As Long
'                        Dim iFileNum2 As Integer
'                        lLISTING_CODE_LINES_COUNT = 0
'                        iFileNum2 = FreeFile
'                        Open sMASM_LIST For Input Shared As iFileNum2
'                        Do While Not EOF(iFileNum2)
'                            Line Input #iFileNum2, s
'                            If (Left(s, 2) Like " #") Or (Left(s, 2) Like " [A-F,a-f]") Then ' not sure, but probably a hex digit can also be.
'                                ReDim Preserve sLISTING_OFFSETS(0 To lLISTING_CODE_LINES_COUNT)
'                                ReDim Preserve sLISTING_CODE(0 To lLISTING_CODE_LINES_COUNT)
'                                ReDim Preserve sLISTING_SEGMENT(0 To lLISTING_CODE_LINES_COUNT)
'                                Dim sOff As String
'                                Dim sCode As String
'                                sOff = Trim(Left(s, 5))
'
'                                ' find first TAB, then goes the code, just trim it
'                                Dim lFirstTab As Long
'                                lFirstTab = InStr(1, s, vbTab)
'                                sCode = myTrim_RepTab(Mid(s, lFirstTab))
'                                Dim tParse
'                                Dim sT_NO_COMMENT As String
'                                sT_NO_COMMENT = remove_Comment(sCode)
'                                tParse = Split(sT_NO_COMMENT, " ")
'                                If UBound(tParse) >= 1 Then
'                                    If StrComp(tParse(1), "segment", vbTextCompare) = 0 Then
'                                        If InStr(1, sT_NO_COMMENT, """STACK""", vbTextCompare) > 0 Or InStr(1, sT_NO_COMMENT, "'STACK'", vbTextCompare) > 0 Then
'                                            ' Debug.Print "WE HAVE 'STACK'! MASM PUTS THIS SEGMENT TO THE END OF .EXE"
'                                            ' Debug.Print "SO WE IGNORE IT'S SIZE WHEN CACLULATING THE START OF THE NEXT SEGMENT."
'                                            bIGNORE_NEXT_RAW_OFFSET = True
'                                        Else
'                                            bIGNORE_NEXT_RAW_OFFSET = False
'                                            ' Debug.Print "SEGMENT START: " & tParse(0)
'                                            sCurrentSegmentName = tParse(0)
'                                            ' we always align by 16  (may not be ideal)
'                                            Dim lPara16 As Long
'                                            Dim lOstatok As Long
'                                            lOstatok = lPREV_RAW_OFFSET Mod 16
'                                            If lOstatok > 0 Then
'                                                lOstatok = 16 - lOstatok
'                                            End If
'                                            lSegmentAddition = lPREV_RAW_OFFSET + lOstatok
'                                        End If
'                                    End If
'                                End If
'
'                                If Not bIGNORE_NEXT_RAW_OFFSET Then
'                                    Dim lRAW_OFFSET As Long
'                                    lRAW_OFFSET = Val("&H" & sOff)
'                                    If lRAW_OFFSET > 0 Then
'                                        lRAW_OFFSET = lRAW_OFFSET + lSegmentAddition
'                                        lPREV_RAW_OFFSET = lRAW_OFFSET
'                                    End If
'                                    sLISTING_SEGMENT(lLISTING_CODE_LINES_COUNT) = sCurrentSegmentName
'                                    sLISTING_OFFSETS(lLISTING_CODE_LINES_COUNT) = lRAW_OFFSET
'                                    sLISTING_CODE(lLISTING_CODE_LINES_COUNT) = sCode
'                                    lLISTING_CODE_LINES_COUNT = lLISTING_CODE_LINES_COUNT + 1
'                                End If
'                            End If
'                        Loop
'                        Close iFileNum2
'
'
'
'
'                        Dim lOrigLineCount As Long
'                        lOrigLineCount = lLISTING_CODE_LINES_COUNT ' #b44a# ' UBound(sLINES)
'                        ReDim L2LC(0 To lLISTING_CODE_LINES_COUNT) ' #b44a# ' lOrigLineCount)
'
'
'
'                        MASM_build_primary_SymbolTable sLISTING_CODE ' 2006-12-05
'
'
'
'                        Dim k As Long
'
'
'
'                        ''''''''''''''''
'                        ' #b44a#
'                        frmOrigCode.cmaxActualSource.Text = ""
'                        For k = 0 To lLISTING_CODE_LINES_COUNT - 1
'                           frmOrigCode.cmaxActualSource.AddText sLISTING_CODE(k) & vbNewLine
'                        Next k
'                        Dim sSavedForActualShow As String
'                        Dim iFileNum1 As Integer
'                        sSavedForActualShow = sMASM_OUTPUT & ".~asm"
'                        iFileNum1 = FreeFile
'                        Open sSavedForActualShow For Output Shared As iFileNum1
'                        For L = 0 To lLISTING_CODE_LINES_COUNT - 1
'                            Print #iFileNum1, sLISTING_CODE(L)
'                        Next L
'                        s = " " ' blank line
'                        Print #iFileNum1, s
'                        If frmMain.sOpenedFile <> "" Then
'                           s = vbNewLine & vbNewLine & sORIG_SOURCE_TAG & frmMain.sOpenedFile & vbNewLine
'                           Print #iFileNum1, s
'                        End If
'                        Close iFileNum1
'                        ''''''''''''''''
'
'
'
'
'                        ' MASM shows offsets in the file, as in memory! (except for 'STACK', that is shown wrongly..)
'                        ' (some original code that exists in FASM algoritm is removed from here)
'                        Dim lOffsetCorrection As Long
'                        lOffsetCorrection = 0
'
'
'
'                        k = 0
'                        For L = 0 To lLISTING_CODE_LINES_COUNT
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
'
'                            If k < lLISTING_CODE_LINES_COUNT Then ' NO MORE CODE PRODUCING LINES?
'                                Dim JJ As Long
'                                For JJ = 0 To lLISTING_CODE_LINES_COUNT  ' SHOULD NOT BE OVER THAT.
'                                '    If StrComp(sLINES(L), sLISTING_CODE(k), vbBinaryCompare) = 0 Then ' #2006-11-27comp#
'                                        lFirst = sLISTING_OFFSETS(k) + lOffsetCorrection
'
'                                        ' find if this line is recorded to symbol table
'                                        ' (I temporary put line number as lOFFSET)
'                                        Dim jj77 As Long
'                                        For jj77 = 0 To primary_symbol_TABLE_SIZE - 1
'                                            ' If primary_symbol_TABLE(jj77).lOFFSET = L Then     ' 2006-12-05
'                                            If primary_symbol_TABLE(jj77).lLINE_NUMBER = L Then  ' 2006-12-05
'                                                primary_symbol_TABLE(jj77).lOFFSET = lFirst
'                                                primary_symbol_TABLE(jj77).sSegment = sLISTING_SEGMENT(k)  ' "(GLOBAL)"
'                                                Exit For
'                                            End If
'                                        Next jj77
'
'                                        If k < lLISTING_CODE_LINES_COUNT - 1 Then
'                                            lLast = sLISTING_OFFSETS(k + 1) + lOffsetCorrection - 1
'                                        Else
'                                            lLast = FileLen(sMASM_OUTPUT) + lOffsetCorrection - 1 ' not ideal...
'                                        End If
'                                        k = k + 1 ' ONE MACHINE CODE PRODUCING LINE IS GONE!
'                                        Exit For
'                               '     End If
'                                Next JJ
'                            End If
'
'                            L2LC(L).ByteFirst = lFirst
'                            L2LC(L).ByteLast = lLast
'                        Next L
'                        ' listing for MASM is never disabled, even if LISTING=false in emu8086.ini
'                        SaveDebugInfoFile_AND_LISTING sDEBUGED_file, False  ' NO LISTING, the listing is already created by MASM.
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
'            If iEXECUTABLE_TYPE = 0 Then
'
'                    frmInfo.addStatus " "
'                    frmInfo.addStatus cMT("Listing is saved:") & " """ & ExtractFileName(sMASM_LIST) & """"
'
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
'                    save_SYMBOL_TABLE_to_FILE sMASM_OUTPUT, True
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
'            frmInfo.addStatus ExtractFileName(sMASM_OUTPUT)
'    End If
'
'    ' AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
'
'    frmMain.bCOMPILING = False
'    bASSEMBLER_STOPED = True ' jic ?
'    Erase sLINES
'
'Exit Function
'err1:
'    Dim sERR As String
'    sERR = Err.Description
'
'    On Error Resume Next
'
'    Debug.Print "assemble_with_masm: " & sERR
'    frmInfo.addErr_MASM 0, "error: " & LCase(sERR), ""
'    bIfSucessLoadInEmulator = False ' ns, jic
'
'    clean_up_if_error
'
'ml_not_found:
'probably_canceled:
'    stop_precompile_animation
'
'    frmMain.bCOMPILING = False
'    bASSEMBLER_STOPED = True ' jic ?
'    DELETE_FILE_if_exists s_MASM_BAT_PATH
'    Erase sLINES
'
'End Function
'
'
' cloned
' but instead of adding 00000 for default offset we add line numbers
' fixed on 2006-12-05 no longer using lOFFSET, added special var into type.
Public Sub MASM_build_primary_SymbolTable(ByRef sLINES() As String)

    Dim sName As String
    Dim s As String
    Dim sType As String ' used in proc.
    
    CLEAR_primary_symbol_TABLE

    currentLINE = 0

    sCurSegName = UNDEFINED_STR

    Do While (currentLINE <= UBound(sLINES))
    
        s = sLINES(currentLINE)

        s = myTrim_RepTab(remove_Comment(s))
        
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
        Dim sTOKEN1_not_UCASE As String  ' index 0
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
            add_to_Primary_Symbol_Table sName, 0, 1, "VAR", sCurSegName, currentLINE
            

        ElseIf (sTOKEN2 = "DW") Then
            sName = sTOKEN1_not_UCASE
            add_to_Primary_Symbol_Table sName, 0, 2, "VAR", sCurSegName, currentLINE
            
        ElseIf (sTOKEN2 = "DD") Then
            sName = sTOKEN1_not_UCASE
            add_to_Primary_Symbol_Table sName, 0, 4, "VAR", sCurSegName, currentLINE
                       
        ElseIf (sTOKEN2 = "DQ") Then
            sName = sTOKEN1_not_UCASE
            add_to_Primary_Symbol_Table sName, 0, 8, "VAR", sCurSegName, currentLINE

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
            
            add_to_Primary_Symbol_Table sName, 0, -5, "SEGMENT", "(ITSELF)", currentLINE

        
        ElseIf sTOKEN3 = "DUP" Then
this_is_dup_too:
            sName = sTOKEN1_not_UCASE

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

End Sub

' check ".log" if there are errors add then to lstErr
' or if no errors, add to status instead
Private Sub CHECK_MASM_LOG(sMASM_LOG As String, sMASM_SOURCE As String)
On Error GoTo err1

Dim bFLAG_ERROR As Boolean
bFLAG_ERROR = False

Dim s As String
Dim sLogLines() As String
Dim iFileNum As Integer
Dim lCounter As Long
Dim L As Long

iFileNum = FreeFile

Open sMASM_LOG For Input Shared As iFileNum
' check to avoid endless loop added 2006-11-28 (seen with MASM) for some reason EOF does not return TRUE!!
Do While (Not EOF(iFileNum)) And frmMain.bCOMPILING
    ReDim Preserve sLogLines(0 To lCounter)
    Line Input #iFileNum, s
    sLogLines(lCounter) = s
    If Not bFLAG_ERROR Then
        If InStr(1, s, ": error") > 0 Then
            bFLAG_ERROR = True
        End If
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
    For L = 0 To lCounter - 1
        s = sLogLines(L)
        
        Dim lLineNum As Long
        Dim lErr As Long
        lErr = InStr(1, s, ": error")
        
        If lErr > 0 Then
            If startsWith(s, sMASM_SOURCE) Or startsWith(s, getDosPath(sMASM_SOURCE)) Then
                lLineNum = extractLineNum_MASM_LOG(s)
                frmInfo.addErr_MASM lLineNum, Mid(s, lErr + 2), ""
            Else
                lLineNum = 0 ' not known, probably error is in another (included) file
                frmInfo.addErr_MASM lLineNum, s, ""
            End If
        End If
        
        
    Next L
    
End If

Erase sLogLines

Exit Sub
err1:
Debug.Print "CHECK_MASM_LOG: " & Err.Description
' 2006-11-29 to avoid future hangups' Resume Next
End Sub

Function extractLineNum_MASM_LOG(s As String) As String
On Error GoTo err1
    Dim L As Long
    L = InStrRev(s, "(")
    extractLineNum_MASM_LOG = Val(Mid(s, L + 1))
Exit Function
err1:
    Debug.Print "extractLineNum_MASM_LOG: " & Err.Description
End Function


' 2006-11-29
' if len(s)>8 then return on the first 8 chars
' and replace spaces with "_" (if any)
Function make8(s As String) As String
    If Len(s) > 8 Then
        make8 = Replace(Mid(s, 1, 8), " ", "_")
    ElseIf Len(s) = 0 Then
        make8 = "0"
    Else
        make8 = Replace(s, " ", "_")
    End If
End Function

Function make4(s As String) As String
    If Len(s) > 4 Then
        make4 = Replace(Mid(s, 1, 4), " ", "_")
    ElseIf Len(s) = 0 Then
        make4 = "0"
    Else
        make4 = Replace(s, " ", "_")
    End If
End Function

Function make83(sFilename As String) As String
    Dim sName As String
    Dim sExt As String
    
    sName = CutExtension(sFilename)
    sExt = extract_extension_no_UCASE(sFilename) ' RETURNS EXTENTION WITH DOT!!
    
    sName = make8(sName)
    sExt = make4(sExt)
    
    If Len(sExt) > 1 Then
        make83 = sName & sExt
    Else
        make83 = sName
    End If
    
    sName = ""
    sExt = ""
End Function

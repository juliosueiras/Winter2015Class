Attribute VB_Name = "mStart"

'

'

'



Option Explicit


' #400b8-fast-examples-check#
Global bCOMPILE_ALL_SILENT As Boolean
Global iASSEMBLER_LOG_FILE_NUMBER As Integer
Global bASSEMBLER_STOPED As Boolean
Global bSOURCE_LOAD_STOPED As Boolean
Global bDO_NO_SAVE_OPTIONS As Boolean


' #400b4-mini-8#
' Global FIRST_RUN As Boolean
Global SHOULD_DO_MINI_FIX_8 As Boolean

' #400b10-no-screen-popup#
Global ACTIVATE_SCREEN As Boolean

' #400b3-viwer#
Global ASCII_VIEWER As String

' #400b3-scrhot#
Global SCREEN_HOTKEYS As Boolean


' #327xq-trim-orig#
Global TRIM_ORIGINAL_SOURCE As Boolean


' #327xr-400-new-mem-list# always now
''''
''''' #327xq-show-physical#
''''Global SHOW_PHYSICAL As Boolean


' 3.27xq no need this
'''' #327xp-optimize_DUP#
'''Global ALT_DUP As Boolean


' 3.27xp
Global ACTIVATE_SCREEN_WHEN_STOPPED As Boolean


' #327xp-always-match#
Global STRICT_SYNTAX As Boolean

Global ASCII_EXTENTIONS As String ' #1168 files with these extensions are to be loaded in source editor (loaded from emu8086.ini) (there is no way to redefine those types that are already defined: .asm, .txt etc...) however if opened directly from emulator it will not look for these ruls, it applies only to command promt ("SendTo") and editor open commands.

' 2.05#545 allow to set custom "MyBuild" directory:
Global s_MyBuild_Dir As String


Declare Function disassemble Lib "diasm.dll" (ByRef recBuf As Byte, ByRef recLocCounter As Long, ByRef p As Byte, ByVal lSize As Long, ByVal lStartOffset As Long) As Long

' Declare Function tfunc Lib "diasm.dll" (ByRef p As Byte, ByVal lSize As Long) As Long


' this module is used to load all kind of tables and data
' for use later, this saves a lot of time.

' these arrays contain
'      Table of Effective Address
' only data (tab,row):
Global gEA_TABLE_BT(0 To 7, 0 To 31) As Byte
' tab captions:
Global g_EA_TCAP_s(0 To 3) As String
Global g_EA_TCAP_rb(0 To 7) As String
Global g_EA_TCAP_rw(0 To 7) As String
Global g_EA_TCAP_digit(0 To 7) As String
' row names:
Global g_EA_T_ROW_w(0 To 31) As String ' also used in is_ew().
Global g_EA_T_ROW_b(0 To 31) As String ' also used in is_eb().

' arrays used in is_rb() , is_rw()
Global g_bREGS(0 To 7) As String
Global g_wREGS(0 To 7) As String

' arrays used in is_s()
Global g_sREGS(0 To 3) As String

' array used in get_SHIFT_ROTATE_command()
Global g_SHIFT_ROTATE(0 To 7) As String

' arrays used in get_JCC_LOOP_byte()
Global g_JCC_LOOP_TEXT(0 To 35) As String
Global g_JCC_LOOP_BYTE(0 To 35) As Byte


' 2.02#507 Global Const sTitleA = "emu8086"
'#1039c' Global sTitleA As String
Global Const sTitleA = "emu8086" '#1039c

'' 2007-10-28
'' creating registry key section that is not deleted by uninstall
'Global Const sREG2X = "reg2x"


'' 2.05#551b
'Private Sub DeleteSettingsFrom_Registry_if_required()
'On Error Resume Next  ' it make an error when registry section doesn't exist:
'
'    If Not get_LOAD_OPTIONS_FLAG Then
'        DeleteSetting sTitleA, "WinStates"
'        DeleteSetting sTitleA, "CustColors"
'        DeleteSetting sTitleA, "Dirs"
'        DeleteSetting "emu8086", "calculator" ' #400b10-remember-eval-state#
'
'       '#1171 DeleteSetting sTitleA, "RecentEditor"
'       '#1171 DeleteSetting sTitleA, "RecentEmulator"
'    End If
'
'End Sub

Sub Main()
On Error GoTo err_start_main ' 1.20


' 4.07m
'    ' 2007-10-29
'    If bUPDATE_VER = False And bNO_UNLOCK = False Then
'        bFOR_REGNOW = True
'    Else
'        bFOR_REGNOW = False
'    End If
    

    ' #400b21-fpu-anti-crash2#
    bFPU_INIT_DONE = False
    


'    ' write to registry the first time emu8086 runs:
'    ' (ignoring versions!)
'    ' #400b4-mini-8# moved from #-moved#-#400b4-mini-8#  because "FIRST_RUN = True" should be set
'    ' before any forms are loaded, however we had to add one more flag because we also need to update any previous german versions :)
'    ' (later it doesn't matter, I decided to do minifix no matter what run it is).
'    Dim tempL As Long
'    If GetSetting("emu8086", "FIRST_RUN", "Flag1", "1") = "1" Then
'        ' FIRST_RUN = True ' [1]
'        ' first run:
'        SaveSetting "emu8086", "FIRST_RUN", "Flag1", "0"
'        SaveSetting "emu8086", "FIRST_RUN", "D", Year(Date) & "_" & Month(Date) & "_" & Day(Date) & "_" & Hour(Time) & "_" & Minute(Time) & "_" & Second(Time) & "_v" & App.Major & App.Minor & App.Revision & sVER_SFX
'        ' ONCE ONLY for all versions of emu8086! (to reassociate clean registry!)
'        MakeAssosiation 1
'        ' innosetup might do it too, so it's not the problem to uninstall it.
'        tempL = CLng(Date)
'        SaveSetting "emu8086", "FIRST_RUN", "LNGDATE", tempL
'    Else
'        ' not used, minifix is done anyway.
'        '        ' just to fix any previous versions...
'        '        If GetSetting("emu8086", "FIRST_RUN", "Flag2", "empty") = "empty" Then
'        '            FIRST_RUN = True  ' [2]
'        '            SaveSetting "emu8086", "FIRST_RUN", "Flag2", "mini"
'        '        Else
'        '            FIRST_RUN = False ' [3]
'        '        End If
'    End If
'
'    ' Debug.Print "FIRST_RUN:" & FIRST_RUN
'
'






    Dim ret As Long ' used for test.
    Dim sTemp As String ' 2.05
    
    
    
    
    ' #400b10-no-screen-popup#
'    sTemp = get_property("emu8086.ini", "ACTIVATE_SCREEN", "true")
'    If StrComp(sTemp, "true", vbTextCompare) = 0 Then
'        ACTIVATE_SCREEN = True
'    Else
        ACTIVATE_SCREEN = False
'    End If
    
    
    
    ' #400b3-viwer#
'    sTemp = get_property("emu8086.ini", "ASCII_VIEWER", "default")
'    If StrComp(sTemp, "default", vbTextCompare) = 0 Then
        ASCII_VIEWER = "notepad"
'    Else
'        ASCII_VIEWER = sTemp
'    End If
    
    
    
    ' #400b3-scrhot#
    'sTemp = get_property("emu8086.ini", "SCREEN_HOTKEYS", "true")
    'If InStr(1, sTemp, "true", vbTextCompare) > 0 Then
    '    SCREEN_HOTKEYS = True
    'Else
        SCREEN_HOTKEYS = False
    'End If
    
    
    
    
' 2007-10-29
''''    '#1141
''''    ' #327xq-reg-settings-inno-setup# ' sBUILD = get_property("emu8086.ini", "sBUILD", "normal")
''''    sBUILD = GetSetting("emu8086", "isetup", "sBUILD", DEFAULT_sBUILD)
''''    If InStr(1, sBUILD, "regnow", vbTextCompare) > 0 Then
''''        bFOR_REGNOW = True
''''    Else
''''        bFOR_REGNOW = False
''''    End If
''''    '#327xl-softpass#
''''    If InStr(1, sBUILD, "softpass", vbTextCompare) > 0 Then
''''        bSOFTWARE_PASSPORT = True
''''    Else
''''        bSOFTWARE_PASSPORT = False
''''    End If
    
    
    
    
' 4.00-Beta-3
''''    ' #cancel using sVER_SFX#
''''    ''''    '#1133
''''    ''''    ' must go before any forms are loaded...
''''    ''''    ' #327xq-reg-settings-inno-setup# '  sVER_SFX = get_property("emu8086.ini", "sVER_SFX", "")
''''    ''''    sVER_SFX = GetSetting("emu8086", "isetup", "sVER_SFX", DEFAULT_sVER_SFX)
''''    sVER_SFX = DEFAULT_sVER_SFX ' #cancel using sVER_SFX#
''''
''''
    
    
    
    
'    ' #327xq-trim-orig#
'    sTemp = get_property("emu8086.ini", "TRIM_ORIGINAL_SOURCE", "true")
'    If StrComp(sTemp, "true", vbTextCompare) = 0 Then
        TRIM_ORIGINAL_SOURCE = True
'    Else
'        TRIM_ORIGINAL_SOURCE = False
'    End If
    
' #327xr-400-new-mem-list#
''''    ' #327xq-show-physical#
''''    sTemp = get_property("emu8086.ini", "SHOW_PHYSICAL", "true")
''''    If StrComp(sTemp, "true", vbTextCompare) = 0 Then
''''        SHOW_PHYSICAL = True
''''    Else
''''        SHOW_PHYSICAL = False
''''    End If
''''
    
' 3.27xq
'    ' #327xp-optimize_DUP#
'    sTemp = get_property("emu8086.ini", "ALT_DUP", "false")
'    If StrComp(sTemp, "true") = 0 Then
'        ALT_DUP = True
'    Else
'        ALT_DUP = False
'    End If
'
    
    
    
    
'    bSAVE_NO_RECENT = False
'    sTemp = get_property("emu8086.ini", "RECENT_FILES", "default")
'    If StrComp(sTemp, "default", vbTextCompare) = 0 Then
'        RECENT_FILES = DEFAULT_RECENT_FILES
'    Else
'        RECENT_FILES = Val(sTemp)
'        If RECENT_FILES > MAX_RECENT_FILES Then
'            RECENT_FILES = MAX_RECENT_FILES
'            Debug.Print "RECENT_FILES = (value too big!) max=20"
'        End If
'    End If
    
    
    
    ' 3.27xp
'    If StrComp(get_property("emu8086.ini", "ACTIVATE_SCREEN_WHEN_STOPPED", "true"), "true", vbTextCompare) = 0 Then
'        ACTIVATE_SCREEN_WHEN_STOPPED = True
'    Else
        ACTIVATE_SCREEN_WHEN_STOPPED = False
'    End If
    
    
    
    ' 3.27xp optimization
    's_IO_FILE_NAME = get_property("emu8086.ini", "EMUPORT", "")  '#1079b ' 3.27xp optimized.
    s_IO_FILE_NAME = Add_BackSlash(App.Path) & "emu8086.io"  ' 20140415
    
    
    
    ' #327u-hw-int#
    'sHarwareInterrupts_FILEPATH = get_property("emu8086.ini", "HW_INTERRUPT_FILE", "c:\emu8086.hw")
    sHarwareInterrupts_FILEPATH = Add_BackSlash(App.Path) & "emu8086.hw" ' 20140415
    
    

    
    'ASCII_EXTENTIONS = get_property("emu8086.ini", "ASCII_EXTENTIONS", " ")
    ASCII_EXTENTIONS = ".cpp,.java,.vb,.c,.ini,.cgi,.inf,.binf,.pl,.js,.bat,.txt,.doc,.htm,.html,.log,.symbol,.inc,.bas,.h,.hla,.lst,.list,.asm_,.txt_,.html_,.cpp_,.java_,.vb_,.c_,.js_,.bat_,.doc_,.htm_,.log_,.symbol_,.inc_,.bas,.h_,.pdf,.pdf_,.iss,.~asm,.cs" ' 20140415
    
    
    
    ' #327xp-always-match#
   ' If StrComp(get_property("emu8086.ini", "STRICT_SYNTAX", "false"), "true", vbTextCompare) = 0 Then
        STRICT_SYNTAX = True
   ' Else
   '     STRICT_SYNTAX = False
   ' End If
    
    
    
    
    
    
    ' #327u-bell#
    'If StrComp(get_property("emu8086.ini", "BEEP", "true"), "true", vbTextCompare) = 0 Then
    '    bDO_BEEP = True
   'Else
        bDO_BEEP = False
   ' End If
    
    
    ' #327xm-cd-hdd-help#
    ' #400b27-cb3#   default set to "true" (from "false")
'    If StrComp(get_property("emu8086.ini", "LOCAL_DOCUMENTATION", "true"), "true", vbTextCompare) = 0 Then
'        ' #327xp-auto-online#  - manually copied without dox... can happen...
'        If FileExists(Add_BackSlash(App.Path) & "documentation\index.html") Then
'            sDocumentation_URL_PATH = Add_BackSlash(App.Path) & "documentation\"
'        Else
'            sDocumentation_URL_PATH = ONLINE_HELP_BASE_URL
'            ' Debug.Print "NOT FOUND: documentation\index.html"
'        End If
 '   Else
 '       sDocumentation_URL_PATH = ONLINE_HELP_BASE_URL
 '   End If

    
    
    
    
    ' #1035 for generateRandom()
    Randomize
    
    ' LANGUAGE FIRST !!!
   
    
    
    ' Set to:
    '        1 - to create new default language file.
    '        0 - to allow forms load data from language file.
    #If 0 Then

        MAKE_DEFAULT_LANGUAGE_FILE

        Add_To_Lang_File frm_mBox
        'Add_To_Lang_File frm16Color_DIALOG
        'Add_To_Lang_File frmAbout
        'Add_To_Lang_File frmBaseConvertor
        ' Add_To_Lang_File frmChooseOutput
        'Add_To_Lang_File frmChooseTemplate
        'Add_To_Lang_File frmOrigCode
        'Add_To_Lang_File frmDebugLog
        Add_To_Lang_File frmEditVariable
        Add_To_Lang_File frmEmulation
        'Add_To_Lang_File frmEvaluator
        'Add_To_Lang_File frmEvaluatorHelper
        Add_To_Lang_File frmExtendedViewer
        Add_To_Lang_File frmFlagAnalyzer
        Add_To_Lang_File frmInfo
        Add_To_Lang_File frmMain
        Add_To_Lang_File frmMemory
        'Add_To_Lang_File frmOptions
        'Add_To_Lang_File frmRegister
        Add_To_Lang_File frmScreen
        'Add_To_Lang_File frmSetOutputDir
        'Add_To_Lang_File frmSORRY_2_INTERRUPT
        Add_To_Lang_File frmStack
        'Add_To_Lang_File frmStartUp
        'Add_To_Lang_File frmUpdate
        Add_To_Lang_File frmVars
        'Add_To_Lang_File frmWriteBinToFloppy
        
        'Add_To_Lang_File frmExportHTML
        ' #todo-st-view#  Add_To_Lang_File frmSymbolTableViewer
        
        'SAVE_RESERVED_SPACE ' #327xa-idea#


        MsgBox "Language file created!" & vbNewLine & vbNewLine & _
               "Replace this line:" & vbNewLine & _
               "    ""#If 1 Then""" & vbNewLine & _
               "with:" & vbNewLine & _
               "    ""#If 0 Then"""

        End ' to avoid conflicts, just exit.

    #Else

       ' THIS IS INTERNATIONAL VERSION
       
       ' LOAD_LANGUAGE_FILE
       

    #End If
    
'
'    ' 2.08c#564 + 2005-05-11
'    Get_UPDATE_URL_Lang_PREFIX_and_RIGHT_TO_LEFT
'
'
    
    
    ' 2.02#507
    ' 3.05 I added "." after "major version number",
    '      for example if VB project version is 3.05, sTitleA="Emu8086v3.05",
    '      previously it was sTitleA="Emu8086v304" and etc (without dot).
    '      BUT NOW IT IS WITH DOT!! :)
    '#1039c' sTitleA = "Emu8086v" & App.Major & "." & App.Minor & App.Revision
    
    ' 2.05#551b
'    DeleteSettingsFrom_Registry_if_required

    
    
    ' 1.24
    ' this should help finding "diasm.dll" in
    ' VB mode:
    myChDir (App.Path)
    
    DoEvents  ' 4.00b20
    
    ' 1.20
    If FileExists(Add_BackSlash(App.Path) & "diasm.dll") Then

        ret = yur_init_analyser()

    Else
        MsgBox cMT("file not found:") & " diasm.dll"
        bDO_NO_SAVE_OPTIONS = True ' v4.00-Beta-8 that's better
        END_PROGRAM True ' 2005-05-11 (true added)
       
    End If
    
    
 
    If FileExists(Add_BackSlash(App.Path) & "MicroAsm.dll") Then
            
        ' I use INIT_FPU now...
        ' crash...
        '        Dim m As fpu87_STATE
        '        ret = MicroAsm_FINIT(m)
        '        fpuGLOBAL_STATE = m
        
        
        Dim b1 As Long
        Dim b2 As Long
        ret = MicroAsm_T(b1, b2)
            
    Else
        MsgBox "file not found: MicroAsm.dll"
        End
    End If
    
    
    
    
    'ValidateReg False
    
    
    b_frmVars_LOADED = False ' 1.29#405
    
    
    
    
'    ' #400b8-fast-examples-check#
'    Dim sASSEMBLE_ALL_IN_DIR_SILENT As String
'    #If 0 Then  ' SET 1 ONLY TO DEBUG WITH COMMAND LINE PARAMS!
'        sASSEMBLE_ALL_IN_DIR_SILENT = "/a C:\emu8086\examples" ' DEBUG DEBUG!!!! '
'        Debug.Print "DEBUG !!!! DEBUG!!!!"
'    #Else
'        sASSEMBLE_ALL_IN_DIR_SILENT = Trim(Command)
'    #End If
'    ' if no directory is given just launch normal, showing the error message (probably FILE NOT FOUND: /A)
'    If UCase(Left(sASSEMBLE_ALL_IN_DIR_SILENT, 2)) = "/A" Then
'        sASSEMBLE_ALL_IN_DIR_SILENT = Trim(Mid(sASSEMBLE_ALL_IN_DIR_SILENT, 3))
'    Else
'        sASSEMBLE_ALL_IN_DIR_SILENT = ""
'    End If
'    If Len(sASSEMBLE_ALL_IN_DIR_SILENT) > 0 Then
'        bCOMPILE_ALL_SILENT = True
'    Else
'        bCOMPILE_ALL_SILENT = False
'    End If
    
    
    bCOMPILE_ALL_SILENT = False ' 20140415
    
    
'    If Not bCOMPILE_ALL_SILENT Then
'        frmDat.Show  ' used as a "loading..." message.
'        DoEvents
'    Else
'        Load frmDat  ' we still need it.
'        DoEvents
'    End If


    ' 20140415
    Load frmDat
    DoEvents




    prepare_OPCODES_LISTS

    ' 2.02#508
    DoEvents

    prepare_JCC_LOOP

    prepare_B_W_S_REGS

    prepare_EA_TAB_CAPTIONS
    prepare_EA_TAB_ROWS
    prepare_EA_TABLE_DATA

    ' 2.02#508
    DoEvents
    
    ' 1.15
    ' should be set before loading frmScreen!
    ' set to "page 0":
    lCURRENT_VIDEO_PAGE_ADR = VIDEO_MEMORY_START
    
    
    ' preload some forms (some variables are used in calculations)
    Load frmScreen



    ' 1.05
    ' create "MyBuild" directory (used to store emulated files when F5 pressed):
    ' 2.05#545 allow to set custom "MyBuild" directory:
    ' Load custom dir from registry:
'    sTemp = GetSetting(sTitleA, "Dirs", "OutputDir", "[default]")
'    If sTemp = "[default]" Then
'        ' use default:
        's_MyBuild_Dir = Add_BackSlash(App.Path) & "MyBuild"  ' the same is done in frmSetOutputDir !!
        s_MyBuild_Dir = Add_BackSlash(App.Path) & "output" ' 20140415
'    Else
'        ' use custom:
'        s_MyBuild_Dir = sTemp
'    End If
'    myMKDIR s_MyBuild_Dir



    ' 2.02#508 moved below' frmMain.Show
    ' instead we just load it:
    Load frmMain


    ' 2.02#508
    DoEvents

    ' 2.02#508 - MOVED BELOW EVERYTHING: frmDat.Hide
    
    ' 1.07
    ' #327t-memlist2code-3# ' bAUTOMATIC_DISASM_AFTER_JMP_CALL = True


' #400-dissasembly#
''''    Dim s325q2c As String
''''    s325q2c = get_property("emu8086.ini", "DIS_BYTES", "64")
''''    If StrComp(s325q2c, "default", vbTextCompare) = 0 Or Val(s325q2c) <= 0 Then
''''        dis_Bytes_to_Disassemble = DEFAULT_dis_Bytes
''''    Else
''''        dis_Bytes_to_Disassemble = Val(s325q2c) ' #327q2c# ' 100
''''    End If
''''
''''
''''    ' #327t-memlist2code#
''''    ReDim dis_p(0 To dis_Bytes_to_Disassemble) As Byte
''''    ReDim dis_recBuf(0 To dis_Bytes_to_Disassemble * 20) As Byte
''''    ReDim dis_recLocCounter(0 To dis_Bytes_to_Disassemble) As Long
''''

    
    
    ' 1.23
    Load frmEmulation
    
   
    ' 1.23
    intilialize_arrOUT
   
  
    ' 1.23
    ' required for ShowColor()
    'CUSTOM_COLORS = String(128, 0)
    'LoadCustomColors
    
    


    ' default
    '#1057
    ' 4.00
'    If FileExists(Add_BackSlash(App.Path) & "MySource") Then
'        sCURRENT_SOURCE_FOLDER = GetSetting("emu8086", "Dirs", "RKsCURRENT_SOURCE_FOLDER", Add_BackSlash(App.Path) & "MySource")
'    Else
'        sCURRENT_SOURCE_FOLDER = GetSetting("emu8086", "Dirs", "RKsCURRENT_SOURCE_FOLDER", Add_BackSlash(App.Path) & "examples")
'    End If
        
        
     sCURRENT_SOURCE_FOLDER = Add_BackSlash(App.Path) & "output"        ' 20140415
        
        
   
    ' 1.23
    ' load settings:
    ' should be called after frmMain
    ' frmScreen and frmEmulation are loaded!
    'load_Options
    
    
    

  
 
    
    
    ' defined global, so make sure it is reset:
    bRun_UNTIL_SELECTED = False
    bDO_STOP_AT_LINE_HIGHLIGHT_CHANGE = False
    bDO_STEP_OVER_PROCEDURE = False
    
    
    bUPDATE_ExtendedRegisterView = False
    
    
    'bug0002_k: PROCESS_CMD_Line Command   ' 2.02 updated.
    
    
    ' required to make sure UBound() will work
    ' for the first time:
    ReDim Preserve vST_for_VARS_WIN(0 To 10)
    
    
    bUPDATE_LEXICAL_FLAG_ANALYSER = False

    ' 2.02#508:
    ' just test, it seems hourglass pointer
    ' stays on my old computer when "Please Register"
    ' is shown:
    ' doesn't help: Screen.MousePointer = vbDefault
    ' it happens only in Win95PAN, in Win XP no such behaviour.


    If Not bCOMPILE_ALL_SILENT Then
        ' 2.02#508:
        frmMain.Show
        ' 2.02#508:
        frmDat.Hide
    Else
        ' just continue....
        DoEvents
    End If
    
    
' #-moved#-#400b4-mini-8# was originally here.
    
    
'
'    If Not bREGISTERED Then
'
'        tempL = Val(GetSetting("emu8086", "FIRST_RUN", "LNGDATE", "0")) ' can be "0" only if key is manually removed...
'
'        If lTRIAL_END = 0 Then
'            If tempL + lCONST_TRIAL_DAYS + 2 > CLng(Now) Then ' 2 days gratis
'                bRUN_FREE_FOR_N_DAYS = True
'            Else
'                bRUN_FREE_FOR_N_DAYS = False
'                If tempL + lCONST_TRIAL_DAYS < CLng(Now) Then
'                    lDAYS_SINCE_IT_EXPIRED = CLng(Now) - tempL - lCONST_TRIAL_DAYS
'                End If
'            End If
'        Else
'            If lTRIAL_END + 1 > CLng(Now) Then ' 1 day gratis
'                bRUN_FREE_FOR_N_DAYS = True
'            Else
'                bRUN_FREE_FOR_N_DAYS = False
'                If lTRIAL_END < CLng(Now) Then
'                    lDAYS_SINCE_IT_EXPIRED = CLng(Now) - lTRIAL_END
'                End If
'            End If
'        End If
'
'        ' 2007-06-28
'        ' if expired, write to "win.ini" to avoid "reset" after reinstall/update
'        ' if "win.ini" contains "expired" notice, set "bRUN_FREE_FOR_N_DAYS = False"
'        Dim sTempPath As String
'        sTempPath = Add_BackSlash(GetWindowsPath111) & "win.ini"
'            If bRUN_FREE_FOR_N_DAYS = True Then
'                Dim sTemp2 As String
'                Call fReadValue(sTempPath, "reg2000", "NX", "S", "OK", sTemp2)
'                If sTemp2 = "EXPIRED" Then
'                    bRUN_FREE_FOR_N_DAYS = False ' perpaps there was reinstallation!
'                    lDAYS_SINCE_IT_EXPIRED = 0 ' we don't know when it expired.
'                End If
'                sTemp2 = ""
'            Else
'                Call fWriteValue(sTempPath, "reg2000", "NX", "S", "EXPIRED")
'            End If
'        sTempPath = ""
'    Else
'        ' Debug.Print "reg ok!"
'    End If
'
'
'

    
    
    
    ' #400b22-masm_comp400b20.asm#
    
    
    
    If Not bCOMPILE_ALL_SILENT Then
        'bug0002_k:
        ' moved here:
        PROCESS_CMD_Line Command
    Else
        ' just go on....
        DoEvents
    End If
    
    
    
    
    
    
    
    
    
    
    
    
     ' -- here we DO add sVER_SFX, because even this is considere a minor revision
     ' it worth it... :)
     
    ' 3.05
    sUPDATE_URL_FILENAME = App.Major & App.Minor & App.Revision & sVER_SFX & ".html"
    
    ' #1095
    Init_Step_Back
    
    
    
' #327xo-allow-change# '
''''    '#1127b
''''    sFile_examples_BYTE_SIZES = get_property("emu8086.ini", "sFile_examples_BYTE_SIZES", "none")
''''
''''
    
    
    
    
    

    
    
    
    
    '#1204
'    VDRIVE_PATH = get_property("emu8086.ini", "VDRIVE_PATH", "default")
'    If LCase(VDRIVE_PATH) = "default" Then
'        ' ok. setting default!
        VDRIVE_PATH = Add_BackSlash(App.Path) & "vdrive\"
        'Debug.Print "default vdrive"
'    Else
'        ' just check if it ends with "\"
'        VDRIVE_PATH = Add_BackSlash(VDRIVE_PATH)
'        'Debug.Print "custom vdrive"
'    End If
    ' 4.00-Beta-5
    If Not FileExists(VDRIVE_PATH) Then
        myMKDIR (VDRIVE_PATH)
    End If
    
    
    
    
    
    
    
'    ' #400b8-fast-examples-check#
'    ' ok, let's start...
'    If bCOMPILE_ALL_SILENT Then
'        do_Compile_All_Silent sASSEMBLE_ALL_IN_DIR_SILENT
'        DoEvents
'        Reset  ' CLOSE ALL FILES... (if any)
'        DoEvents
'        bDO_NO_SAVE_OPTIONS = True
'        Unload frmMain  ' will do everything that is required...
'    End If
    
    
    
    
    
    
    
Exit Sub
err_start_main:
    Debug.Print "Error on mStart.Main(): " & LCase(Err.Description)
    Resume Next ' 4.00-Beta-5  previously it was "On Error Resume Next"
End Sub

'' #400b8-fast-examples-check#
'Private Sub do_Compile_All_Silent(sPath As String)
'
'On Error GoTo err1
'
'        Dim s As String
'        Dim sERR As String  ' used for critical errors only.
'
'
'        ' prepeare error file to write errors in...
'        iASSEMBLER_LOG_FILE_NUMBER = FreeFile
'        Open Add_BackSlash(s_MyBuild_Dir) & "_emu8086_log.txt" For Output Shared As iASSEMBLER_LOG_FILE_NUMBER
'        s = "============================================================================="
'        Print #iASSEMBLER_LOG_FILE_NUMBER, s
'        s = "EMU8086 INTEGRATED ASSEMBLER EMULATOR  -- " & Date & " -- " & Time
'        Print #iASSEMBLER_LOG_FILE_NUMBER, s
'
'        Dim SILENT_ASSEMBLER As Boolean
'        If InStr(1, get_property("emu8086.ini", "SILENT_ASSEMBLER", "false"), "false", vbTextCompare) > 0 Then
'            SILENT_ASSEMBLER = False
'        Else
'            SILENT_ASSEMBLER = True
'        End If
'
'
''        If Not SILENT_ASSEMBLER Then
''            frmBatchStatus.Show
''            frmBatchStatus.lblStatus.Tag = frmBatchStatus.lblStatus.Caption
''            frmBatchStatus.lblVersion.Tag = frmBatchStatus.lblVersion.Caption
''        End If
'
'
'
'        Load frmAssemble_ALL_IN_DIR
'        DoEvents
'        frmAssemble_ALL_IN_DIR.fileBox1.Path = sPath
'        frmAssemble_ALL_IN_DIR.fileBox1.Refresh
'        DoEvents
'
'
'        Dim i As Integer
'        Dim iTotal As Integer
'
'        iTotal = frmAssemble_ALL_IN_DIR.fileBox1.ListCount - 1
'
'        For i = 0 To iTotal
'
'            bASSEMBLER_STOPED = False
'
'            Dim sFilename As String
'            sFilename = Add_BackSlash(sPath) & frmAssemble_ALL_IN_DIR.fileBox1.List(i)
'
'
'            If Not SILENT_ASSEMBLER Then
'                Dim sStatus As String
'                sStatus = Replace(frmBatchStatus.lblStatus.Tag, "[i]", CStr(i + 1))
'                s = App.Major & "." & App.Minor & App.Revision & sVER_SFX
'                frmBatchStatus.lblVersion.Caption = Replace(frmBatchStatus.lblVersion.Tag, "[version]", s)
'                sStatus = Replace(sStatus, "[total]", CStr(iTotal + 1))
'                sStatus = Replace(sStatus, "[filename]", ExtractFileName(sFilename))
'                frmBatchStatus.lblStatus.Caption = sStatus
'            End If
'
'            DoEvents ' #400b11-doevents#
'
'
'            s = "============================================================================="
'            Print #iASSEMBLER_LOG_FILE_NUMBER, s
'            s = "SOURCE: " & sFilename
'            Print #iASSEMBLER_LOG_FILE_NUMBER, s
'
'            bSOURCE_LOAD_STOPED = False
'
'            frmMain.openSourceFile sFilename, True, False
'
'            DoEvents
'
'            frmMain.CompileTheSource_PUBLIC
'
'            sFilename = ""
'
'            DoEvents
'
'            ' wait for assembler....
'            Do While Not bASSEMBLER_STOPED
'                DoEvents
'            Loop
'
'        Next i
'
'
'
'        s = "============================================================================="
'        Print #iASSEMBLER_LOG_FILE_NUMBER, s
'        s = "EMU8086 INTEGRATED ASSEMBLER PROCESSED " & frmAssemble_ALL_IN_DIR.fileBox1.ListCount & " FILES.  " & Date & "  --  " & Time
'        Print #iASSEMBLER_LOG_FILE_NUMBER, s
'        s = "<END>"
'        Print #iASSEMBLER_LOG_FILE_NUMBER, s
'        s = "  "
'        Print #iASSEMBLER_LOG_FILE_NUMBER, s
'
'        Exit Sub
'err1:
'    sERR = Err.Description
'    On Error Resume Next
'
'    ' try to write to a file...
'    sERR = "CRITICAL ERROR: " & sERR
'    Print #iASSEMBLER_LOG_FILE_NUMBER, sERR
'    sERR = "<END>"
'    Print #iASSEMBLER_LOG_FILE_NUMBER, sERR
'    sERR = "  "
'    Print #iASSEMBLER_LOG_FILE_NUMBER, sERR
'
'
'    Reset  ' CLOSE ALL FILES...
'    End    ' SOME TERRIBLE ERROR... so just exit asap
'End Sub
'
'
'
' 2.20 parameter added and made public,
' to make possible the re-use of this sub for
' drag & drop (see 2.02#514)
Public Sub PROCESS_CMD_Line(CmdLine As String)
   On Error GoTo err_pcl
   
    If CmdLine <> "" Then
    
       CmdLine = Trim(CmdLine)
       
       
       ' #400b18-cmd-update#
       ' if several files are passed, leave one only
       Dim lPROBEL As Long
       lPROBEL = InStr(1, CmdLine, " ")
       If Left(CmdLine, 1) = """" Then
            Dim lVtorajaKavycka As Long
            lVtorajaKavycka = InStr(2, CmdLine, """")
            If lVtorajaKavycka > 0 Then ' jic
                CmdLine = Mid(CmdLine, 1, lVtorajaKavycka)
            End If
       Else
       
            ' #2006-04-11#
            ' hm... had to comment out these 3 lines...
            '   it seems like even if I pass more than 1 file, only one file is actually passed to CmdLine...
            '
            
            '            If lPROBEL > 0 Then ' jic
            '                CmdLine = Mid(CmdLine, 1, lPROBEL - 1)
            '            End If

       End If
       
       
       
       
        
       If (Chr(34) = Mid(CmdLine, 1, 1)) Then
          CmdLine = Mid(CmdLine, 2, Len(CmdLine) - 2)
       End If
        
       ' 2.05 !!!! CmdLine = checkFile(CmdLine)
       
       If checkFile(CmdLine) = "" Then
            MsgBox cMT("file not found:") & vbNewLine & CmdLine
            Exit Sub
       End If
       
       ' I hope it will work without it,
       ' it requires VB5STKIT.DLL
       '' CmdLine = GetLongPathName(CmdLine)
    
        Dim sExt As String

        sExt = extract_extension(CmdLine)
        
        Select Case sExt
        
        Case ".ASM" ' #1168 puting them to emu8086.ini ', ".TXT", ".DOC", ".HTM", ".HTML", ".LOG", ".SYMBOL", ".INC"
            frmMain.openSourceFile CmdLine, False, False
            
            ' #327xo-av-protect#
        Case ".EXE", ".BIN", ".BOOT", ".COM", ".COM_", ".BIN_", ".EXE_", "" ' no extension  to emulator too!
            bAlwaysNAG = True
            frmEmulation.DoShowMe
            frmEmulation.loadFILEtoEMULATE CmdLine
            
        Case Else
        
               If InStr(1, ASCII_EXTENTIONS, sExt, vbTextCompare) > 0 Then '#1168
            
                     frmMain.openSourceFile CmdLine, False, False
                     
               Else
                        ' #1168. load all unknown extensions to emulator!

                    frmEmulation.DoShowMe
                    bAlwaysNAG = True
                    frmEmulation.loadFILEtoEMULATE CmdLine, True
                    
               End If


        End Select
    
       
       
    End If
    
    
    
    Exit Sub
err_pcl:
    MsgBox "PROCESS_CMD_Line: " & LCase(Err.Description) & vbNewLine & _
           CmdLine
    
End Sub


Private Function checkFile(ByVal s As String) As String

    
    If FileExists(s) And Mid(s, 2, 1) = ":" Then
        checkFile = s
    Else
        s = App.Path & "\" & s
        If FileExists(s) Then
            checkFile = s
        Else
            checkFile = ""
        End If
    End If
    
End Function


'' 1.23
'Sub LoadCustomColors()
'
'    ' it seems that only first 64 bytes are used, but I assume other 64 will be used in future versions of windows... or so...
'
'    Dim byt(1 To 128) As Byte
'    Dim i As Integer
'    ' to make all custom color WHITE on fist start:
'    Dim Default As Byte
'    Dim step As Byte
'    step = 1
'
'    For i = 1 To 128
'
'        step = step + 1
'
'        If step = 5 Then
'            Default = 0
'            step = 1
'        Else
'            Default = 255
'        End If
'
'        byt(i) = GetSetting(sTitleA, "CustColors", "C" & i, Default)
'    Next
'
'    CUSTOM_COLORS = BytesToStr(byt)
'
'End Sub
'
'
'Public Sub SaveCustomColors()
'    Dim byt(1 To 128) As Byte
'    Dim i As Integer
'    Dim s As String
'
'    s = CUSTOM_COLORS
'
'    StrToBytes byt, s
'
'    For i = 1 To Len(s)
'        SaveSetting sTitleA, "CustColors", "C" & i, byt(i)
'    Next
'
'End Sub
'
Sub prepare_JCC_LOOP()
    Dim JCC_id, JCC_hex
    JCC_id = Array("JA", "JAE", "JB", "JBE", "JC", "JCXZ", "JE", "JG", "JGE", "JL", "JLE", "JNA", "JNAE", "JNB", "JNBE", "JNC", "JNE", "JNG", "JNGE", "JNL", "JNLE", "JNO", "JNP", "JNS", "JNZ", "JO", "JP", "JPE", "JPO", "JS", "JZ", "LOOP", "LOOPE", "LOOPNE", "LOOPNZ", "LOOPZ")
    JCC_hex = Array("77", "73", "72", "76", "72", "E3", "74", "7F", "7D", "7C", "7E", "76", "72", "73", "77", "73", "75", "7E", "7C", "7D", "7F", "71", "7B", "79", "75", "70", "7A", "7A", "7B", "78", "74", "E2", "E1", "E0", "E0", "E1")
    
    Dim i As Integer
       
    For i = 0 To 35
        g_JCC_LOOP_TEXT(i) = JCC_id(i)
        g_JCC_LOOP_BYTE(i) = Val("&H" & JCC_hex(i))
    Next i
    
End Sub

Private Sub prepare_B_W_S_REGS()
    Dim bREGS, wREGS, sREGS, cSHIFT_ROTATE
    bREGS = Array("AL", "CL", "DL", "BL", "AH", "CH", "DH", "BH")
    wREGS = Array("AX", "CX", "DX", "BX", "SP", "BP", "SI", "DI")
    sREGS = Array("ES", "CS", "SS", "DS")
    cSHIFT_ROTATE = Array("SHR", "SHL", "SAR", "SAL", "ROR", "ROL", "RCR", "RCL")
    

    Dim i As Integer
    
    For i = 0 To 7
        g_bREGS(i) = bREGS(i)
        g_wREGS(i) = wREGS(i)
        g_SHIFT_ROTATE(i) = cSHIFT_ROTATE(i)
    Next i
    
    For i = 0 To 3
        g_sREGS(i) = sREGS(i)
    Next i

End Sub

Private Sub prepare_EA_TAB_CAPTIONS()
    Dim s, rb, rw, digit
    
    s = Array("ES", "CS", "SS", "DS")
    rb = Array("AL", "CL", "DL", "BL", "AH", "CH", "DH", "BH")
    rw = Array("AX", "CX", "DX", "BX", "SP", "BP", "SI", "DI")
    digit = Array("0", "1", "2", "3", "4", "5", "6", "7")
    
    Dim i As Integer
    
    For i = 0 To 3
     g_EA_TCAP_s(i) = s(i)
    Next i
     
    For i = 0 To 7
        g_EA_TCAP_rb(i) = rb(i)
        g_EA_TCAP_rw(i) = rw(i)
        g_EA_TCAP_digit(i) = digit(i)
    Next i
    
End Sub

Private Sub prepare_EA_TAB_ROWS()
    Dim ROW_word, ROW_byteR
    ROW_word = Array("[BX + SI]", "[BX + DI]", "[BP + SI]", "[BP + DI]", "[SI]", "[DI]", "d16 (simple var)", "[BX]", "[BX + SI] + d8", "[BX + DI] + d8", "[BP + SI] + d8", "[BP + DI] + d8", "[SI] + d8", "[DI] + d8", "[BP] + d8", "[BX] + d8", "[BX + SI] + d16", "[BX + DI] + d16", "[BP + SI] + d16", "[BP + DI] + d16", "[SI] + d16", "[DI] + d16", "[BP] + d16", "[BX] + d16", "ew=AX", "ew=CX", "ew=DX", "ew=BX", "ew=SP", "ew=BP", "ew=SI", "ew=DI")
    ROW_byteR = Array("eb=AL", "eb=CL", "eb=DL", "eb=BL", "eb=AH", "eb=CH", "eb=DH", "eb=BH")
    
    Dim i As Integer
    
    For i = 0 To 31
        g_EA_T_ROW_w(i) = ROW_word(i)
        g_EA_T_ROW_b(i) = ROW_word(i)
    Next i
    
    ' only last 8 byte registers are different:
    For i = 24 To 31
        g_EA_T_ROW_b(i) = ROW_byteR(i - 24)
    Next i
    
End Sub

Private Sub prepare_EA_TABLE_DATA()
    Dim i As Integer
    Dim j As Long
    
    Dim ts As String
    
    
    For i = 0 To 31
    
        'ts = getLine(i, frmDat.txtEA_OPTIMIZED.Text)
        ts = frmDat.lst_EA_TCONST.List(i)
    
        For j = 0 To 7
                                    ' convert from HEX:
                gEA_TABLE_BT(j, i) = Val("&H" & getNewToken(ts, j, " "))

        Next j
        
    Next i
    
End Sub

' remove instructions that are not for 8086,
' and trim everything:
Private Sub prepare_OPCODES_LISTS()
    Dim i As Integer
    Dim ts As String
        
    reset_all_compDAT_TABLES ' 1.23
        
    i = 0
    
    '+++++ first mark the lines that should be deleted by
    '+++++ emptying them.

    For i = 0 To frmDat.lst_opNames.ListCount - 1
    
        frmDat.lst_opNames.List(i) = Trim(frmDat.lst_opNames.List(i))
        
        ts = Mid(frmDat.lst_opNames.List(i), 1, 1)
        
        If (ts = "*") Or (ts = "#") Then
           frmDat.lst_opNames.List(i) = ""
        Else
           frmDat.lst_Opcodes1.List(i) = Trim(frmDat.lst_Opcodes1.List(i))
        End If
            
    Next i

    '+++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    ' actual delete:
    
    ' for not used because size of the list
    ' is changing dynamicly.
        
    i = 0
    
    Do While True
    
        If i >= frmDat.lst_opNames.ListCount Then Exit Do

        If frmDat.lst_opNames.List(i) = "" Then
            frmDat.lst_Opcodes1.RemoveItem (i)
            frmDat.lst_opNames.RemoveItem (i)
            i = i - 1 ' the index of the next item that
                      ' should be checked moved back.
        End If
        
        i = i + 1
        
    Loop
    
    '+++++++++++++++++++++++++++++++++++++++++++++++++++++++




    ' 1.23
    ' copy lst_opNames to compDAT_OP_NAMES()
    For i = 0 To frmDat.lst_opNames.ListCount - 1
        compDAT_OP_NAMES(i) = frmDat.lst_opNames.List(i)
    Next i
    



    '''''' separate opcodes to 3 lists '''''''''''''''''''''
    ' ASSUMED that maximum opcode length is 3 tokens!!
    Dim s1 As String
    Dim sBEFORE_PLUS As String ' generally = s1
    Dim sAFTER_PLUS As String
    Dim s2 As String
    Dim s3 As String
    
    ' 1.23#230 frmDat.lst_Opcodes2.Clear
    ' 1.23#230 frmDat.lst_Opcodes3.Clear
    ' 1.23#230 frmDat.lst_OpcPLUS.Clear
    ' reset is done in top of this sub!
    
    For i = 0 To frmDat.lst_Opcodes1.ListCount - 1
        s1 = getNewToken(frmDat.lst_Opcodes1.List(i), 0, " ")
        s2 = getNewToken(frmDat.lst_Opcodes1.List(i), 1, " ", True)
        s3 = getNewToken(frmDat.lst_Opcodes1.List(i), 2, " ", True)
        
        If s2 = Chr(10) Then s2 = ""
        If s3 = Chr(10) Then s3 = ""
        
        sBEFORE_PLUS = getNewToken(s1, 0, "+")
        sAFTER_PLUS = getNewToken(s1, 1, "+", True)
        
        If sAFTER_PLUS <> Chr(10) Then
            ' 1.23#230 frmDat.lst_Opcodes1.List(i) = sBEFORE_PLUS
            compDAT_OPCODES_1(i) = sBEFORE_PLUS
            ' 1.23#230 frmDat.lst_OpcPLUS.AddItem "+"
            compDAT_OpcPLUS(i) = True
            ' 1.23#230 frmDat.lst_Opcodes2.AddItem sAFTER_PLUS
            compDAT_OPCODES_2(i) = sAFTER_PLUS
            ' 1.23#230 frmDat.lst_Opcodes3.AddItem s2
            compDAT_OPCODES_3(i) = s2
            ' assumed that s3=""
        Else
            ' 1.23#230 frmDat.lst_Opcodes1.List(i) = s1
            compDAT_OPCODES_1(i) = s1
            ' 1.23#230 frmDat.lst_OpcPLUS.AddItem "" ' no plus!!!
            compDAT_OpcPLUS(i) = False ' no plus!!!
            ' 1.23#230 frmDat.lst_Opcodes2.AddItem s2
            compDAT_OPCODES_2(i) = s2
            ' 1.23#230 frmDat.lst_Opcodes3.AddItem s3
            compDAT_OPCODES_3(i) = s3
        End If
    Next i
    
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''
End Sub


' 1.20
Sub END_PROGRAM(Optional bNO_SAVE As Boolean = False)

On Error GoTo err_ep
    Dim i As Integer
    
    
    
    
   ' #400b20-anti-crash#
'   If Not App.PrevInstance Then
'       DELETE_FILE Add_BackSlash(App.Path) & "auto_save_backup.dat.txt"
'   End If
   
    
    
    
   If bNO_SAVE Or bDO_NO_SAVE_OPTIONS Then GoTo skip_save
    
'   save_Options ' 1.23
    
   'SaveCustomColors
    
   '#1144 save_STATE_for_ALL_Devices ' 1.27
    
   CLOSE_ALL_VIRTUAL_FILES
    
skip_save:


  ' #327xp-hmmmm# ' UnHookForm frmMain ' #1172
    
   
   
   
    '  #327xp-erase#
    STEP_BACK_FREE_MEM
    FREE_MEM_CODE_SELECTOR
    FREE_MEM_OTHERS
    FREE_DIS_MEMORY  ' 4.00
    CLEAR_DOS_ALOC_MEMORY ' 4.00-Beta-9




    ' copied from VB APP Wizard:
    ' this array should have only loaded forms!
    'close all sub forms
    For i = Forms.Count - 1 To 1 Step -1
        ' Debug.Print "unloading: " & Forms(i).Name
        ' #KNOWN_BBB#  probaly frmMain_Form_Unload() calls this Sub recursively when we unload it....
        Unload Forms(i)
    Next

    End  ' TERMINATE THE PROGRAM!!!!!!!!!!

err_ep:
    Debug.Print "END_PROGRAM: " & Err.Description
    End

End Sub

'' 2.08c#564
'Private Sub Get_UPDATE_URL_Lang_PREFIX_and_RIGHT_TO_LEFT()
'On Error GoTo err1
'
'    Dim sLangFilename As String
'
'    sLangFilename = Add_BackSlash(App.Path) & "_lang.dat"
'
'    If FileExists(sLangFilename) Then
'        Dim fNum As Integer
'        Dim s As String
'
'        fNum = FreeFile
'
'        ' Load Source Message File:
'        Open sLangFilename For Input As fNum
'
'            ' Go directly to data:
'            Do While Not EOF(fNum)
'
'                Line Input #fNum, s
'                If startsWith(s, "UPDATE_URL_Lang_PREFIX=") Then
'                    sUPDATE_FILENAME_LANG_PREFIX = Trim(Mid(s, Len("UPDATE_URL_Lang_PREFIX=") + 1))
'                End If
'
'                If startsWith(s, "RIGHT_TO_LEFT=") Then
'                    If UCase(Trim(Mid(s, Len("RIGHT_TO_LEFT=") + 1))) = "YES" Then
'                        bRIGHT_TO_LEFT = True
'                    Else
'                        bRIGHT_TO_LEFT = False
'                    End If
'
'                    GoTo OK_GOT_IT
'                End If
'
'            Loop
'
'            Debug.Print "NOT_FOUND in LANG FILE: UPDATE_URL_Lang_PREFIX="
'OK_GOT_IT:
'        Close fNum
'
'    Else
'        sUPDATE_FILENAME_LANG_PREFIX = ""
'    End If
'
'    Exit Sub
'err1:
'    Debug.Print "Get_UPDATE_URL_Lang_PREFIX: " & LCase(err.Description)
'    Close fNum
'End Sub

' #1035d2
Public Function extract_extension(sInput As String) As String
On Error GoTo err1
        Dim lx As Long
        Dim lxxx2 As Long  '#1035d2
        
        
        lx = InStrRev(sInput, ".")
        
        lxxx2 = InStrRev(sInput, "\") ' should not seek dots after the file name!
        
        
        If lx > 0 And (lxxx2 < lx) Then
            extract_extension = UCase(Right(sInput, Len(sInput) - lx + 1))
        Else
            extract_extension = ""
        End If
        
        
        Exit Function
err1:
    Debug.Print " ERROR! extract_extension(" & sInput
    extract_extension = ""
End Function

Public Function extract_extension_no_UCASE(sInput As String) As String
On Error GoTo err1
        Dim lx As Long
        Dim lxxx2 As Long  '#1035d2
        
        
        lx = InStrRev(sInput, ".")
        
        lxxx2 = InStrRev(sInput, "\") ' should not seek dots after the file name!
        
        
        If lx > 0 And (lxxx2 < lx) Then
            extract_extension_no_UCASE = Right(sInput, Len(sInput) - lx + 1)
        Else
            extract_extension_no_UCASE = ""
        End If
        
        
        Exit Function
err1:
    Debug.Print " ERROR! extract_extension_no_UCASE(" & sInput
    extract_extension_no_UCASE = ""
End Function

' #1036
Sub append_to_file(sFilename As String, sText As String)
    
On Error GoTo err1
    
    Dim iFileNum As Integer
    
    iFileNum = FreeFile
    
    If InStr(1, sFilename, ":\") > 0 Then
        Open sFilename For Append Shared As iFileNum
    Else
        Open Add_BackSlash(App.Path) & sFilename For Append Shared As iFileNum
    End If
    
    Print #iFileNum, sText
        
    Close iFileNum
          
    Exit Sub
    
err1:
    
    Debug.Print "Error on append_to_file: " & LCase(Err.Description) & " -- " & sFilename & " -- " & sText
    
End Sub


' #reg_update_v327k
' similar to append_to_file() but it deletes the file first!
Sub clean_and_write_to_file(ByVal sFilename As String, sText As String)
        
On Error GoTo err1
    

    
    If InStr(1, sFilename, ":\") <= 0 Then
       sFilename = Add_BackSlash(App.Path) & sFilename
    End If
    
    If FileExists(sFilename) Then
        DELETE_FILE sFilename
    End If
    
    
    Dim iFileNum As Integer
    iFileNum = FreeFile
    Open sFilename For Output Shared As iFileNum
    Print #iFileNum, sText
    Close iFileNum
          
    Exit Sub
    
err1:
    
    Debug.Print "clean_and_write_to_file: " & LCase(Err.Description) & " -- " & sFilename & " -- " & sText
    
End Sub



' #1036
Public Function read_LONG_FROM_FIRST_line_OF_file(sFilename As String) As Long

On Error GoTo err1
   Dim iFileNum As Integer
   Dim sREAD_LINE As String
   
   iFileNum = FreeFile
   
   Open sFilename For Input Shared As iFileNum    ' Open file.
   
       If Not EOF(iFileNum) Then   ' Loop until end of file.
       
         Line Input #iFileNum, sREAD_LINE   ' Read line into variable.
       
       End If
   
   Close #iFileNum
   
   read_LONG_FROM_FIRST_line_OF_file = CLng(sREAD_LINE)
   
   Exit Function
   
err1:
    Debug.Print "ERROR! read_first_line_from_file(" & sFilename & ") - " & LCase(Err.Description)
    read_LONG_FROM_FIRST_line_OF_file = 0
    
End Function

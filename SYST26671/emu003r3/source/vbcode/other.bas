Attribute VB_Name = "other"

'

'

'



Option Explicit



' #400b20-remember-prev-build-dir#
Global sPREV_BUILD_DIR As String
    


' 3.27xp   to avoid confusion, Cancel of frmMain will cancel asm2html too.
'          this can happen if there is unsaved code before all 2 html export!
'          this var is also used to exit out of the loop when [x] is clicked!
Global bSAVE_CANCELED As Boolean
' 3.27XP
Global sASM2HTML_EXPORT_FROM_PATH As String



' when I was unaware of #327-bug-step-over# I put a lot of bSTOP_frmDEBUGLOG=True
' it seems it was in vain... :) but here it helps. I hope it won't mess a lot.
Global bSTOP_frmDEBUGLOG As Boolean ' when true exits all the loops of that form...




Global bDO_BEEP As Boolean
Public Declare Function Beep Lib "kernel32" (ByVal dwFreq As Long, ByVal dwDuration As Long) As Long

Global LAST_REPLACE_INDEX_of_Replace_NOT_IN_STR As Long

' #1164 for starting "debug "

Public Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long

'#1187
Public Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long



Global b_frmOPTIONS_SHOWN_BY_EMULATOR As Boolean ' tell frmOptions which window to activate when it closes.

'din't work ' Global b_DONOT_frmOrigCode_ACTIVATE As Boolean '#1161 do not active frmOrigCode when I just compile the code.


' make to fix #1050 a bit...
' #327xn-new-dot-stack# ' Global lLINE_NUMBER_CORRECTION_FOR_ERRORS  As Long

'''' #1157c remeber where .stack .data and .code where replaced to select correct error lines (these modify the line count because their definitions are expanded..., that's why all the problems)
'''Global l_REP_STACK_LINE As Long
'''Global l_REP_DATA_LINE As Long
'''Global l_REP_CODE_LINE As Long
'' impossible!!!


Global bFLAG_REPLACE_NOT_INSTR_SUCCESS As Boolean '#1065 ' is TRUE when replaced!
' #327xn-more-short-modifications#  ' Global lLOOP_REPLACEMENT_COUNTER As Long ' #1157 to avoid calling Replace_NOT_IN_STR() more than 100 times...
' #327xn-more-short-modifications#  ' Global Const MAX_ALLOWED_LOOPS As Long = 350 ' #1157

Public Const SW_SHOWNORMAL As Long = 1



Global bAlwaysNAG As Boolean ' 2.52#716



' 1.29#395
Global sLAST_COMPILED_FILE As String

' 1.25#307
' Emulator will not update System
' information area (memory from
' 00400h to 00500h) if your configuration file has "NO_SYS_INFO" directive
' (on a separate line).
Global bDONT_UPDATE_SYS_INFO As Boolean

' 1.25#307
' allow to load *.bin files to any memmory address when this
' value is "True":
Global bDONT_CHECK_BIN_LOAD_ADR As Boolean


' 1.25#308
Global mBox_owner As Form

' 1.24#278
' for "Step Over" (for macros):
Global bDO_STOP_AT_LINE_HIGHLIGHT_CHANGE As Boolean
Global lSTOP_AT_LINE_HIGHLIGHT_CHANGE As Long
' for "Step Over" (for procedures/interrupts):
Global bDO_STEP_OVER_PROCEDURE As Boolean
Global lCOUNTER_ENTER_PROCEDURE As Long

' 1.23, 1.24#275 made global
Global bRun_UNTIL_SELECTED As Boolean

' #327xr-400-new-mem-list#
''''''' bugfix1.27#344
''''''Global iRUN_UNTIL_SELECTED_IP As Integer
''''''Global iRUN_UNTIL_SELECTED_CS As Integer
Global lRUN_UNTIL_SELECTED As Long ' physical addr! ' #327xr-400-new-mem-list#



' 1.23#268
Global sCURRENT_SOURCE_FOLDER As String
' 1.23#268d
Global sCURRENT_EMULATOR_FOLDER As String

Global Const PROGRBAR_FRAME = 50


']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
' for translating VB keycodes to BIOS SCAN CODES:
Public Declare Function MapVirtualKey Lib "user32" Alias "MapVirtualKeyA" (ByVal wCode As Long, ByVal wMapType As Long) As Long
Public Const VK_CAPITAL = &H14
Public Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
' 1.21 update!
' keyboard buffer,
' can keeep 8 chars:
Type kbbuf_key
    cBIOS As Byte
    cASCII As Byte
End Type

Global Const KB_BUFFER_MAX = 16 ' #1114c it was 7 before.
Global uKB_BUFFER(0 To KB_BUFFER_MAX) As kbbuf_key
Global uCHARS_IN_KB_BUFFER As Integer
']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]


'Global bKEEP_DEBUG_LOG As Boolean

Global bUPDATE_LEXICAL_FLAG_ANALYSER As Boolean

''''' for disassembler '''''''''''''

' #400-dissasembly# ' replaced with:  lStartDisAddress
'''''' keeps the current address from where disassembling
'''''' was last made:
'''''Global dis_lastStartAddress As Long
'''''

' #400-dissasembly#
' now we fit as much bytes as we can
'''''' the number of bytes to disassemble after the
'''''' starting address:
'''''' 1.14 Public Const dis_Bytes_to_Disassemble = 100
'''''Global dis_Bytes_to_Disassemble As Integer
'''''Global Const DEFAULT_dis_Bytes As Integer = 64
'''''''''''''''''''''''''''''''''''''''''''''



' 1.07
' #327t-memlist2code-3# ' jic ' Global bAUTOMATIC_DISASM_AFTER_JMP_CALL As Boolean
 Global Const bAUTOMATIC_DISASM_AFTER_JMP_CALL As Boolean = True ' #327t-memlist2code-3# jic :)
 
 

' 1.05
' command line parameters that are sent to
' emulated program:
Global sCOMMAND_LINE_PARAMETERS As String

' If the function fails, the return value is an error value that is less than or equal to 32
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Global Const SW_SHOWDEFAULT = 10
Public Const SW_SHOWMINNOACTIVE = 7
Global Const ERROR_FILE_NOT_FOUND = 2&
Global Const ERROR_PATH_NOT_FOUND = 3&

' #327xr-400-new-mem-list#
    ' starting address of memory but
    '   shown in frmEmulation.lstMemory:
    ' #327xr-400-new-mem-list# Global startADR As Long
    ' #327t-memlist2code# Global Const limitADR = 1024
    ' 1.17 segment that lstMemory currently uses:
    ' #327xr-400-new-mem-list# ' Global lMemoryListSegment As Long
    ' 1.20 offset that lstMemory currently uses:
    ' #327xr-400-new-mem-list# Global lMemoryListOffset As Long

Type type_Size_and_Location
    iSize As Integer
    lLoc As Long
End Type

Type type_eaROW_eaTAB
    bROW As Byte
    bTAB As Byte
End Type



' 2.09#576
Public bDO_NOT_SET_ListIndex_for_STACK As Boolean



Function FileExists(ByVal sFilename As String) As Boolean

    Dim i As Integer
    
    On Error GoTo NotFound
    
    i = GetAttr(sFilename)
        
    FileExists = True
    
    Exit Function
    
NotFound:

    FileExists = False
    
End Function

' keeps the last "\" in path:
Function ExtractFilePath(ByVal strFullPath As String) As String
  Dim i As Integer

  For i = 1 To Len(strFullPath)
     If Mid(strFullPath, i, 1) = "\" Then
          ExtractFilePath = Left(strFullPath, i) ' not ideal but works.
     End If
  Next i
  
End Function

Function ExtractFileName(strFullPath As String) As String
On Error GoTo err1:
    ExtractFileName = Right(strFullPath, Len(strFullPath) - Len(ExtractFilePath(strFullPath))) ' nothing is ideal but this one works.
    Exit Function
err1:
    ExtractFileName = ""
    Debug.Print "ExtractFileName: " & LCase(Err.Description)
End Function

Function myInStr_GetLast(iStart As Integer, sIn As String, sLookFor As String) As Integer
Dim i As Integer
Dim k As Integer
Dim iFinal As Integer
 
    k = iStart
 
    Do
        i = InStr(k, sIn, sLookFor, vbTextCompare)
        k = i + 1
        If i > 0 Then iFinal = i
    Loop While (i > 0)
    
    myInStr_GetLast = iFinal

End Function

Function CutExtension(sFilename As String) As String
Dim i As Integer

On Error GoTo err1

    i = myInStr_GetLast(1, sFilename, ".")
    If i < 1 Then
        CutExtension = Trim(sFilename)
    Else
        CutExtension = Trim(Left(sFilename, i - 1))
    End If
    
Exit Function
err1:
    CutExtension = sFilename
    Debug.Print "err CutExtension: " & Err.Description
End Function


' replacement for Message Box function of VB:
Function mBox(owner As Form, sPrompt As String)
On Error GoTo error_showing_mbox

    ' #400b8-fast-examples-check#
    If Not bCOMPILE_ALL_SILENT Then
    
        ' it's up to frm_mbox me,  to clear the message
        '   when user closes it, until that all messages
        '    are added one after another:
        frm_mBox.txtMessage.Text = _
            frm_mBox.txtMessage.Text & _
                 sPrompt & vbNewLine
        
        If owner Is Nothing Then
            frm_mBox.Show , frmMain
            Set mBox_owner = frmMain
        Else
            frm_mBox.Show , owner
            Set mBox_owner = owner
        End If
        
    Else
    
        Dim sERR As String
        sERR = "CRITICAL ERROR 2: " & sPrompt
        Print #iASSEMBLER_LOG_FILE_NUMBER, sERR
        
    End If
    
    
    
    
    
    Exit Function
error_showing_mbox:
    Debug.Print "Error on mbox me, (" & sPrompt & ") -> " & LCase(Err.Description)
    ' in case we cannot show the message box, try setting to
    '   lblMessage of frmMain:
    'frmMain.lblMessage.Caption = Prompt
    'frmMain.lblMessage.Visible = True
End Function

'
Function Add_BackSlash(sPath As String) As String
  
On Error Resume Next ' 4.00-Beta-7

    If (sPath <> "") Then
        If (Mid(sPath, Len(sPath), 1) <> "\") Then
          Add_BackSlash = sPath & "\"
          Exit Function
        End If
    End If
 
 
    Add_BackSlash = sPath
  
End Function

' 4.00b9
Function Cut_First_BackSlash(sPath As String) As String
On Error Resume Next
    If Left(sPath, 1) = "\" Then
        Cut_First_BackSlash = Mid(sPath, 2)
    Else
        Cut_First_BackSlash = sPath
    End If
End Function

' 4.00-Beta-7
' DOES TRIM BY REF!!!
Function Cut_Last_BackSlash(ByRef sPath As String) As String

On Error Resume Next

    sPath = Trim(sPath)
    If Len(sPath) > 0 Then
        If Right(sPath, 1) = "\" Then
            Cut_Last_BackSlash = Mid(sPath, 1, Len(sPath) - 1)
        Else
            Cut_Last_BackSlash = sPath ' trimmed only.
        End If
    Else
        Cut_Last_BackSlash = sPath ' trimmed only.
    End If
    
End Function


' 1.20
' it seems there is a cool function in VB 6.0
' that doesn't seem to exist in VB 5.0
' StrReverse()!

Function MyReverse(InputS As String) As String
Dim i As Integer
Dim OutputS

    For i = Len(InputS) To 1 Step -1
       OutputS = OutputS & Mid(InputS, i, 1)
    Next i
    
    MyReverse = OutputS
    
End Function

Sub AddHorizontalScroll(List As ListBox)
        ' TODO
End Sub


' 1.05
Sub myMKDIR(sPath As String)
On Error GoTo err_make_dir
    
    If Not FileExists(sPath) Then  ' 1.23#268b
    
        MkDir sPath
        
    End If
    
    Exit Sub
err_make_dir:
     Debug.Print "error on myMKDIR : " & sPath & " -- " & Err.Description
End Sub


' 1.23#268f
Public Function myChDir(sPath As String) As Boolean
On Error GoTo err1
    
    If sPath = "" Then
        myChDir = False
        Exit Function
    End If
    
    If (Mid(sPath, 2, 1) = ":") Then
        ChDrive (Mid(sPath, 1, 1)) 'ChDir won't work if curent path is another drive.
    End If
    
    ChDir (sPath)
    
    myChDir = True
    
Exit Function
err1:
Debug.Print "error (expected?) on myChDir(" & sPath & "): " & LCase(Err.Description)
myChDir = False
' 4.00 On Error Resume Next
End Function



' converts single HEX digit to BINARY:
Function HEX_2_BIN(ByRef sHEX_DIGIT As String) As String
    Select Case UCase(sHEX_DIGIT)
    
    Case "0"
        HEX_2_BIN = "0000"

    Case "1"
        HEX_2_BIN = "0001"
 
    Case "2"
        HEX_2_BIN = "0010"

    Case "3"
        HEX_2_BIN = "0011"

    Case "4"
        HEX_2_BIN = "0100"

    Case "5"
        HEX_2_BIN = "0101"

    Case "6"
        HEX_2_BIN = "0110"

    Case "7"
        HEX_2_BIN = "0111"

    Case "8"
        HEX_2_BIN = "1000"

    Case "9"
        HEX_2_BIN = "1001"

    Case "A"
        HEX_2_BIN = "1010"

    Case "B"
        HEX_2_BIN = "1011"

    Case "C"
        HEX_2_BIN = "1100"

    Case "D"
        HEX_2_BIN = "1101"

    Case "E"
        HEX_2_BIN = "1110"

    Case "F"
        HEX_2_BIN = "1111"
        
    Case "h", "H"   ' ignore (suffix).
        HEX_2_BIN = ""
        
    Case Else
        Debug.Print "wrong argument in HEX_2_BIN(" & sHEX_DIGIT & ")"
    End Select
End Function

' converts single OCT digit to BINARY:
Function OCT_2_BIN(ByRef sOCT_DIGIT As String) As String
    Select Case UCase(sOCT_DIGIT)
    
    Case "0"
        OCT_2_BIN = "000"

    Case "1"
        OCT_2_BIN = "001"

    Case "2"
        OCT_2_BIN = "010"

    Case "3"
        OCT_2_BIN = "011"

    Case "4"
        OCT_2_BIN = "100"

    Case "5"
        OCT_2_BIN = "101"

    Case "6"
        OCT_2_BIN = "110"

    Case "7"
        OCT_2_BIN = "111"

        
    Case "o", "O"   ' ignore (suffix).
        OCT_2_BIN = ""
        
    Case Else
        Debug.Print "wrong argument in OCT_2_BIN(" & sOCT_DIGIT & ")"
    End Select
End Function

' 1.20
Function OCT_to_BIN(sInput As String) As String
    Dim L As Long
    Dim s As String
    Dim sResult As String
    
    sResult = ""
    
    For L = 1 To Len(sInput)
        s = Mid(sInput, L, 1)
        sResult = sResult & OCT_2_BIN(s)
    Next L
    
    OCT_to_BIN = sResult
End Function


' 1.20
Function HEX_to_BIN(sInput As String) As String
    Dim L As Long
    Dim s As String
    Dim sResult As String
    
    sResult = ""
    
    For L = 1 To Len(sInput)
        s = Mid(sInput, L, 1)
        sResult = sResult & HEX_2_BIN(s)
    Next L
    
    HEX_to_BIN = sResult
End Function

' 1.20
' returns BINARY presentation of a number,
' return value has 32 bits (zeros & ones)
Function toBIN_DOUBLEWORD(ByRef lNum As Long) As String

    Dim sHEX As String
    Dim sResult As String
    Dim i As Integer
    Dim Size As Integer
    
    sHEX = Hex(lNum)
    Size = Len(sHEX)
    
    sResult = ""
    
    For i = Size To 1 Step -1
        sResult = HEX_2_BIN(Mid(sHEX, i, 1)) & sResult
    Next i
    
    toBIN_DOUBLEWORD = make_min_len(sResult, 32, "0")
    
End Function

' returns BINARY presentation of a number,
' return value has 16 bits (zeros & ones)
Function toBIN_WORD(ByRef iNum As Integer) As String

    Dim sHEX As String
    Dim sResult As String
    Dim i As Integer
    Dim Size As Integer
    
    sHEX = Hex(iNum)
    Size = Len(sHEX)
    
    sResult = ""
    
    For i = Size To 1 Step -1
        sResult = HEX_2_BIN(Mid(sHEX, i, 1)) & sResult
    Next i
    
    toBIN_WORD = make_min_len(sResult, 16, "0")
    
End Function

' returns BINARY presentation of a number,
' return value has 8 bits (zeros & ones)
Function toBIN_BYTE(ByRef bNum As Byte) As String

    Dim sHEX As String
    Dim sResult As String
    Dim i As Integer
    Dim Size As Integer
    
    sHEX = Hex(bNum)
    Size = Len(sHEX)
    
    sResult = ""
    
    For i = Size To 1 Step -1
        sResult = HEX_2_BIN(Mid(sHEX, i, 1)) & sResult
    Next i
    
    toBIN_BYTE = make_min_len(sResult, 8, "0")
    
End Function


Function to16bit_SIGNED(ByRef byteL As Byte, ByRef byteH As Byte) As Integer
On Error Resume Next ' 4.00-Beta-3
    Dim temp As Long
    
    ' lower byte - on lower address!
    ' byte1 - lower byte!
    
    temp = byteH
    temp = temp * 256 ' shift left by 16.
    temp = temp + byteL
    
    
    to16bit_SIGNED = to_signed_int(temp)
End Function


' 1.13
' my own fuction to replace Asc(), to prevent
' errors when string is empty:
Function myAsc(s As String) As Byte
Dim i As Integer
    If Len(s) > 0 Then
        i = Asc(s)
        If i > 255 Or i < 0 Then
            Debug.Print "wrong param for myAsc: " & s
            myAsc = 0
        Else
            myAsc = CByte(i)
        End If
    Else
        myAsc = 0
        Debug.Print "empty param sent to myAsc!"
    End If
End Function


' 28-March-2002, for decoding:
Function toHexForm(num As Variant) As String
    ' in case number is less then 10 and >=0, then just return
    ' it as it is (it's the same in DEC and hex, so we
    ' prefer DEC):
    If num < 10 And num >= 0 Then
        toHexForm = CStr(num)
    Else

        Dim s As String
        s = Hex(num)
        
        If s Like "#*" Then ' starts with a number?
            toHexForm = s & "h"
        Else
            toHexForm = "0" & s & "h"
        End If
        
    End If
    
End Function

'' 1.23
'' 1.30 - converted to function, returns "TRUE" on success:
'Function open_HTML_FILE(frmCaller As Form, sFilename As String, Optional bNO_ASKING As Boolean = False) As Boolean
'On Error GoTo err_ohf
'
''''''''''''''''''''''''''''
'
'
'
' ' 2.57 online help update:
' ' updating... 3.10
'
' Dim sCOMPLETE_URL As String
' Dim lTemp As Long
'
' lTemp = InStr(1, sFilename, "http://", vbTextCompare)
'
' ' if at least one of them starts with "http://" open online
' If startsWith(sDocumentation_URL_PATH, "http") Or lTemp > 0 Then
'
'    If lTemp > 0 Then
'        sCOMPLETE_URL = sFilename  ' complete URL given.
'    Else
'        sCOMPLETE_URL = sDocumentation_URL_PATH & sFilename
'    End If
'
'    ' 2005-04-20 show input box with URL:
'    Dim s As String
'
'    If bNO_ASKING Or LCase(get_property("emu8086.ini", "ASK_OPEN_URL", "true")) <> "true" Then
'        s = "no questions asked"
'    Else
'        s = InputBox(cMT("would you like to go online?") & vbNewLine & vbNewLine & _
'         cMT("if your browser won't start automatically, copy & paste the URL to the browser's address bar"), cMT("online help"), sCOMPLETE_URL)
'        ' input isn't used! we use input box only to allow user to copy url if required.
'    End If
'
'    If s = "" Then
'        open_HTML_FILE = True ' to avoid error message.
'    Else
'        open_HTML_FILE = LaunchURLInNewBrowser(sCOMPLETE_URL)
'    End If
'
'    Exit Function  '  EXITS, otherwise opens from HDD (if gHelpURL is "" for example).
' End If
'
''''''''''''''''''''''''''''
'
'
'
'
'
'    Dim sHTMLFile As String
'
'    ' #327xm-cd-hdd-help# '  sHTMLFile = Add_BackSlash(App.Path) & "documentation\" & sFilename
'    sHTMLFile = sDocumentation_URL_PATH & sFilename
'
'    If Not FileExists(sHTMLFile) Then
'        MsgBox cMT("file not found:") & " " & sHTMLFile
'        open_HTML_FILE = False
'        Exit Function
'    End If
'
'    ' #327xm-cd-hdd-help# ' open_HTML_FILE = LaunchURLInNewBrowser(sHTMLFile)
'    ' the above way seemed to cause problems on firefox...
'    Call ShellExecute(frmCaller.hwnd, "open", "explorer", sHTMLFile, App.Path, SW_SHOWDEFAULT)
'    open_HTML_FILE = True
'
'
'    Exit Function
'err_ohf:
'    MsgBox "cannot start the HTML viewer or browser..." & vbNewLine & LCase(Err.Description)
'    open_HTML_FILE = False
'End Function
'
'
'
'
'
' 0000b   black
' 0001b   blue
' 0010b   green
' 0011b   cyan
' 0100b   red
' 0101b   magenta
' 0110b   brown
' 0111b   light gray
' 1000b   dark gray
' 1001b   light blue
' 1010b   light green
' 1011b   light cyan
' 1100b   light red
' 1101b   light magenta
' 1110b   yellow
' 1111b   white
Function getDOS_COLOR(colorIndex As Byte) As Long
        Select Case colorIndex
        Case 0 ' 0000b   black
             '  getDOS_COLOR = RGB(0, 0, 0)
             getDOS_COLOR = SystemColorConstants.vbWindowBackground ' 20140415
        Case 1 ' 0001b   blue
               getDOS_COLOR = RGB(0, 0, 128) '1.20- 200)
        Case 2 ' 0010b   green
               getDOS_COLOR = RGB(0, 128, 0)
        Case 3 ' 0011b   cyan
               getDOS_COLOR = RGB(0, 128, 128)
        Case 4 ' 0100b   red
               getDOS_COLOR = RGB(128, 0, 0)
        Case 5 ' 0101b   magenta
               getDOS_COLOR = RGB(128, 0, 128)
        Case 6 ' 0110b   brown
               getDOS_COLOR = RGB(128, 128, 0)
        Case 7 ' 0111b   light gray
              ' getDOS_COLOR = RGB(192, 192, 192)
              getDOS_COLOR = SystemColorConstants.vbWindowText ' 20140415
        Case 8 ' 1000b   dark gray
               getDOS_COLOR = RGB(128, 128, 128)
        Case 9 ' 1001b   light blue
               getDOS_COLOR = RGB(0, 0, 255)
        Case 10 ' 1010b   light green
               getDOS_COLOR = RGB(0, 255, 0)
        Case 11 ' 1011b   light cyan
               getDOS_COLOR = RGB(0, 255, 255)
        Case 12 ' 1100b   light red
               getDOS_COLOR = RGB(255, 0, 0)
        Case 13 ' 1101b   light magenta
               getDOS_COLOR = RGB(255, 0, 255)
        Case 14 ' 1110b   yellow
               getDOS_COLOR = RGB(255, 255, 0)
        Case 15 ' 1111b   white
               getDOS_COLOR = RGB(255, 255, 255)
               
        '1.28
        Case Else
               Debug.Print "wrong index for getDOS_COLOR: " & colorIndex
        End Select
        
        
        
End Function


' gets color (BIOS) and returns Windows color
Public Function get256_COLOR_PALETTE(byteColor As Byte) As Long

    
'''    If byteColor <= 15 Then
'''
'''        ' it seems that first 15 colors are the same everywhere
'''
'''        get256_COLOR_PALETTE = getDOS_COLOR(byteColor)
'''
'''    Else
'''

    
' all colors are now in palette
' palette created with 256color_palette_maker
    Dim ready_palette As Variant
    
    ready_palette = Array(0, 11141120, 43520, 11184640, 170, 11141290, 21930, 11184810, 5592405, 16733525, 5635925, 16777045, 5592575, 16733695, 5636095, 16777215, 0, 1315860, 2105376, 2894892, 3684408, 4539717, 5329233, 6381921, 7434609, 8553090, 9605778, 10658466, 11974326, 13355979, 14935011, 16777215, 16711680, 16711745, 16711805, 16711870, 16711935, 12452095, 8192255, 4260095, 255, 16895, 32255, 48895, 65535, 65470, 65405, 65345, 65280, 4325120, _
8257280, 12517120, 16776960, 16760320, 16743680, 16728320, 16743805, 16743838, 16743870, 16743903, 16743935, 14646783, 12484095, 10386943, 8224255, 8232703, 8240895, 8249343, 8257535, 8257503, 8257470, 8257438, 8257405, 10420093, 12517245, 14679933, 16777085, 16768893, 16760445, 16752253, 16758454, 16758471, 16758491, 16758507, 16758527, 15447807, 14399231, 13088511, 11974399, 11978751, 11983871, 11987967, 11993087, 11993067, 11993051, 11993031, 11993014, 13107126, 14417846, 15466422, _
16777142, 16772022, 16767926, 16762806, 7405568, 7405596, 7405624, 7405653, 7405681, 5570673, 3670129, 1835121, 113, 7281, 14449, 21873, 29041, 29013, 28984, 28956, 28928, 1863936, 3698944, 5599488, 7434496, 7427328, 7419904, 7412736, 7419960, 7419973, 7419989, 7420001, 7420017, 6371441, 5585009, 4536433, 3684465, 3687793, 3691889, 3694961, 3699057, 3699041, 3699029, 3699013, 3699000, 4550968, 5599544, 6385976, 7434552, 7430456, _
7427384, 7423288, 7426385, 7426393, 7426401, 7426409, 7426417, 6902129, 6377841, 5853553, 5329265, 5331313, 5333361, 5335409, 5337457, 5337449, 5337441, 5337433, 5337425, 5861713, 6386001, 6910289, 7434577, 7432529, 7430481, 7428433, 4259840, 4259856, 4259872, 4259888, 4259905, 3145793, 2097217, 1048641, 65, 4161, 8257, 12353, 16705, 16688, 16672, 16656, 16640, 1065216, 2113792, 3162368, 4276480, 4272128, 4268032, 4263936, _
4268064, 4268072, 4268080, 4268088, 4268097, 3678273, 3153985, 2629697, 2105409, 2107457, 2109505, 2111553, 2113857, 2113848, 2113840, 2113832, 2113824, 2638112, 3162400, 3686688, 4276512, 4274208, 4272160, 4270112, 4271148, 4271152, 4271156, 4271164, 4271169, 3943489, 3419201, 3157057, 2894913, 2895937, 2896961, 2899009, 2900289, 2900284, 2900276, 2900272, 2900268, 3162412, 3424556, 3948844, 4276524, 4275244, 4273196, 4272172, 0, 0, _
0, 0, 0, 0, 0, 0)
    
    get256_COLOR_PALETTE = ready_palette(byteColor)
    
    
''' End If

End Function





' 2005-03-01 ' 2005-03-01_association_for_ASM_files.txt
' this function isn't u'Public Function CheckAssosiation() As Boolean ' returns TRUE if not associated!!!
'    Dim sValue As String
'
'    Call fReadValue("HKCR", ".asm", "", "S", "", sValue)
'    If (sValue <> "emu8086") Then CheckAssosiation = True: Exit Function
'
'    Call fReadValue("HKCR", ".inc", "", "S", "", sValue)
'    If (sValue <> "emu8086") Then CheckAssosiation = True: Exit Function
'
'
'
'    Call fReadValue("HKCR", "emu8086", "", "S", "", sValue)
'    If (sValue <> "Assembly Language Source Code") Then CheckAssosiation = True: Exit Function
'
'    Call fReadValue("HKCR", "emu8086\DefaultIcon", "", "S", "", sValue)
'    If (LCase(sValue) <> LCase(Add_BackSlash(App.Path) & App.EXEName & ".exe,0")) Then CheckAssosiation = True: Exit Function
'
'    Call fReadValue("HKCR", "emu8086\shell\open\command", "", "S", "", sValue)
'    If (LCase(sValue) <> LCase(Add_BackSlash(App.Path) & App.EXEName & ".exe " & "" & """" & "%" & "1" & """")) Then CheckAssosiation = True: Exit Function
'
'
'    CheckAssosiation = False
'
'End Functionsed here, just copied from Magic Button:


' 2005-03-01 ' 2005-03-01_association_for_ASM_files.txt


'' i=1  .com_ , .exe_  , .bin_
'' i=2  .asm  , .inc
'Public Sub MakeAssosiation(i As Integer)
'
'On Error GoTo err1
'
'' 1110. MakeAssosiation doesn't work from Options.
''
''       Solution:  delete these keys before writing them again:
''
''       HKEY_CLASSES_ROOT\.asm
''       HKEY_CLASSES_ROOT\.inc
''
''       because for some reason windows has these values:
''
''
''   Windows Registry Editor Version 5.00
''
''   [HKEY_CLASSES_ROOT\.asm]
''   "PerceivedType"="text"
''   @="emu8086"
''
''   [HKEY_CLASSES_ROOT\.asm\PersistentHandler]
''   @="{5e941d80-bf96-11cd-b579-08002b30bfeb}"
''
''
''   Windows Registry Editor Version 5.00
''
''   [HKEY_CLASSES_ROOT\.inc]
''   "PerceivedType"="text"
''   @="emu8086"
''
''   [HKEY_CLASSES_ROOT\.inc\PersistentHandler]
''   @="{5e941d80-bf96-11cd-b579-08002b30bfeb}"
''
''
''   backups of these associations saved in BKP _asm.reg and _inc.reg  (I don't remember when, but that was done menually, I think...)
'
'
'
'    If i = 1 Then
'        ' #327xo-av-protect-3#
'        Call fWriteValue("HKCR", ".com_", "", "S", "emu8086")
'        Call fWriteValue("HKCR", ".exe_", "", "S", "emu8086")
'        Call fWriteValue("HKCR", ".bin_", "", "S", "emu8086")
'    End If
'
'
'
'    If i = 2 Then
'        ' #1110
'        Call fDeleteValue("HKCR", ".asm", "PerceivedType")
'        Call fDeleteKey("HKCR", ".asm", "PersistentHandler")
'
'        ' #1110
'        Call fDeleteValue("HKCR", ".inc", "PerceivedType")
'        Call fDeleteKey("HKCR", ".inc", "PersistentHandler")
'
'        Call fWriteValue("HKCR", ".inc", "", "S", "emu8086")
'        Call fWriteValue("HKCR", ".asm", "", "S", "emu8086")
'    End If
'
'
'
'    Call fWriteValue("HKCR", "emu8086", "", "S", "assembly source code")
'    Call fWriteValue("HKCR", "emu8086\DefaultIcon", "", "S", Add_BackSlash(App.Path) & App.EXEName & ".exe,0")
'    Call fWriteValue("HKCR", "emu8086\shell\open\command", "", "S", Add_BackSlash(App.Path) & App.EXEName & ".exe " & """" & "%" & "1" & """")
'
'
'
'
'    Exit Sub
'err1:
'    Debug.Print "error #327xo-av-protect-3#"
'
'End Sub



Public Function make_URL_COMPATIBLE_TEXT(sInput As String) As String
    
    
    
    Dim i As Long
    Dim sOutput As String
    Dim sChar As String
    
    sOutput = ""
    
    For i = 1 To Len(sInput)
    
        sChar = Mid(sInput, i, 1)
    
        If Asc(sChar) >= Asc("a") And Asc(sChar) <= Asc("z") Then
            ' ok
            sOutput = sOutput & sChar
        ElseIf Asc(sChar) >= Asc("A") And Asc(sChar) <= Asc("Z") Then
            ' ok
            sOutput = sOutput & sChar
        ElseIf Asc(sChar) >= Asc("0") And Asc(sChar) <= Asc("9") Then
            ' ok
            sOutput = sOutput & sChar
        Else
            ' convert to hex with "%" as prefix!
            
            sOutput = sOutput & "%" & Hex(Asc(sChar))
        End If
            
    Next i
    
    make_URL_COMPATIBLE_TEXT = sOutput
    sOutput = ""
        
End Function


' made especially for:
' AH = 2Ch - GET SYSTEM TIME
' should return from input such as "16261,77"
' something like "77"
Public Function get_reminder_only(SingleValue As Single) As Byte
On Error GoTo err1

    Dim Tmp1 As Single
    Dim Tmp2 As Single
    
    Tmp1 = Fix(SingleValue)
    Tmp2 = SingleValue - Tmp1  ' weird things happen here... for example 16261.77-16261=0.7695313
    
    Tmp2 = Tmp2 * 100 ' move 2 digits after the dot, before dot!
    
    get_reminder_only = Round(Tmp2) ' weirdness is fixed by round.
    
    Exit Function
err1:
    Debug.Print "ERROR on get_reminder_only(" & SingleValue & ") - " & LCase(Err.Description)
    get_reminder_only = 0
End Function

' #1050
' making sure small declartions won't cause any subsiquent bugs...
' it's similar to Replace() but does not replace values that are surrounded by quotes (are in strings)!!!
' ASSUMED THAT sExpr ends with a new line (CR) - Chr(10)!!
' ASSUMED THAT there cannot be " or ' on the same string with the sFind, otherwise treat as string.
' #1050g makes sure that before the start of this string there are only spaces and tabs!
'
' #1157
' this function replaces single accurence only!
' may use bFLAG_REPLACE_NOT_INSTR_SUCCESS to see if there was a replacement, and if there was,
' should run this funtction again and again until everything is replaced.
' (make sure to set some limit to avoid I don't know what).
'
' #1050x3 completely re-writing this buggy function!
Function Replace_NOT_IN_STR(sExpr As String, sFind As String, sRepl As String, bMUST_BE_NOTHING_BUT_SPACES_and_TABS_BEFORE As Boolean) As String
On Error GoTo err1
    
    LAST_REPLACE_INDEX_of_Replace_NOT_IN_STR = 0
    
    bFLAG_REPLACE_NOT_INSTR_SUCCESS = False
    
    
    Dim l_SEARCH_FROM As Long
    Dim l_FOUND_AT As Long
    
    Dim l_NEW_LINE As Long
    Dim l_SINGLE_QUOTE As Long
    Dim l_DOUBLE_QUOTES As Long
    
    l_SEARCH_FROM = 1
    
try_again:
    
    If l_SEARCH_FROM <= 0 Then ' no more lines?
        Replace_NOT_IN_STR = sExpr  ' NOT REPLACED!
        Exit Function
    End If

    

    l_FOUND_AT = InStr(l_SEARCH_FROM, sExpr, sFind, vbTextCompare)
    
    
    
    '#v327_rep_nothing#
    If l_FOUND_AT <= 0 Then
        ' nothing to replace, the search term does not exist, not even in string
        Replace_NOT_IN_STR = sExpr  ' NOT REPLACED!
        Exit Function
    End If
    
    
    
    l_NEW_LINE = InStrRev(sExpr, Chr(10), l_FOUND_AT) ' find start of the line
    l_NEW_LINE = l_NEW_LINE + 1                       ' even if it's the first line, it will return 1.
    l_SINGLE_QUOTE = InStrRev(sExpr, "'", l_FOUND_AT) ' find  ' before start of the line
    l_DOUBLE_QUOTES = InStrRev(sExpr, """", l_FOUND_AT) ' find  " before start of the line
           
           
           
           
    If (l_SINGLE_QUOTE > 0 And l_SINGLE_QUOTE > l_NEW_LINE) Or _
       (l_DOUBLE_QUOTES > 0 And l_DOUBLE_QUOTES > l_NEW_LINE) Then '/" is there ' before start of the line?
       
        l_SEARCH_FROM = InStr(l_FOUND_AT, sExpr, Chr(10)) ' next line
        GoTo try_again
    End If
    
    
    
    
    If bMUST_BE_NOTHING_BUT_SPACES_and_TABS_BEFORE Then

        Dim sMUST_BE_EMPY As String
        
        sMUST_BE_EMPY = ""
        
        If (l_FOUND_AT - l_NEW_LINE - 1) >= 0 Then ' jic
            sMUST_BE_EMPY = Mid(sExpr, l_NEW_LINE, l_FOUND_AT - l_NEW_LINE - 1)
        End If
        
        If LTrim(sMUST_BE_EMPY) <> "" Then  ' trim removes both spaces and tabs
            l_SEARCH_FROM = InStr(l_FOUND_AT, sExpr, Chr(10)) ' next line
            GoTo try_again
        End If
        
        sMUST_BE_EMPY = ""
    End If

    

    
    
    
    
ok_replace:
        
        
        If l_FOUND_AT = 1 Then
        
            
        
            ' ok! just replace!
            Replace_NOT_IN_STR = Replace(sExpr, sFind, sRepl, 1, 1, vbTextCompare)
            
            bFLAG_REPLACE_NOT_INSTR_SUCCESS = True
            
            LAST_REPLACE_INDEX_of_Replace_NOT_IN_STR = 1
            
            Exit Function
            
        Else ' if it's not 1 then there
        
            ' internal Replace() function of VB is a bit dumb.
            ' if Start is specified (is more than 1) it returns only from that position,
            ' so we need to remember the previous part to avoid loosing it.
        
            Dim sBigPart1 As String
            
            sBigPart1 = Mid(sExpr, 1, l_FOUND_AT - 1)
            
            Replace_NOT_IN_STR = sBigPart1 & Replace(sExpr, sFind, sRepl, l_FOUND_AT, 1, vbTextCompare)
            
            bFLAG_REPLACE_NOT_INSTR_SUCCESS = True
            
            LAST_REPLACE_INDEX_of_Replace_NOT_IN_STR = l_FOUND_AT
            
            Exit Function
        End If
        
        
        ' cannot get here (normally).
        
err1:
        Debug.Print "ERR Replace_NO_IN_STR: " & LCase(Err.Description) & " -- not replaced!"
        Replace_NOT_IN_STR = sExpr
        
        bFLAG_REPLACE_NOT_INSTR_SUCCESS = False
End Function

' #1050f
' don't get fooled by the name of this sub :)
' it's like InStr function but ignores values in quotes (that are on the same line!)
' ASSUMED that sExpr end with a new line char  (CR) - Chr(10) !
' #1050g ignores lines that have anything else before sFind on them except " " and vbTab.

' see also InStr_BUT_NO_IN_QUOTES() for general solution.

Function InStr_NOT_IN_STR(sExpr As String, sFind As String) As Long

On Error GoTo err1

    Dim l0 As Long
    Dim L1 As Long
    Dim L2 As Long
    Dim l3 As Long
    Dim l4 As Long
    
    l0 = 1
    
try_again:
    
    L1 = InStr(l0, sExpr, sFind, vbTextCompare)
    
    If L1 = 0 Then
        InStr_NOT_IN_STR = 0 ' not found! (maybe exists in string only)
        Exit Function
    End If
    
    '  #1050g
    ' must have only spaces and tabs before start of the line!
    Dim lllH As Long
    Dim sTEMP1 As String
    lllH = L1 - 1
    Do While lllH > 0
        sTEMP1 = Mid(sExpr, lllH, 1)
        ' Debug.Print "InNOT: " & Asc(sTEMP1)

        ' Chr(13) not required.
        If sTEMP1 = Chr(10) Or sTEMP1 = Chr(13) Then Exit Do ' ok! start of the line found!

        If sTEMP1 <> " " And sTEMP1 <> vbTab Then
                l0 = L1 + 1
                GoTo try_again
        End If
        lllH = lllH - 1
    Loop
    
    
    
    L2 = InStr(L1, sExpr, Chr(10), vbTextCompare)
    
    If L2 = 0 Then
        InStr_NOT_IN_STR = 0 ' not found! (maybe exists in string only)
        Debug.Print "err on InStr_NOT_INSTR, it seems we have no CR in the end"
        Exit Function
    End If
    
    
    l3 = InStr(L1, sExpr, """", vbTextCompare)
    l4 = InStr(L1, sExpr, "'", vbTextCompare)
    
    If l3 = 0 And l4 = 0 Then GoTo ok_found
    
    
    If ((L2 > l3) And (l3 > 0)) Or ((L2 > l4) And (l4 > 0)) Then
        ' means we have a quote before line breaks...
        
'''''        Debug.Print "NOT REPLACED! Is in string: " & sFind
'''''        Replace_NOT_IN_STR = sExpr

            l0 = L1 + 1
            GoTo try_again

        Exit Function
    End If
    
    
    
ok_found:
    InStr_NOT_IN_STR = L1
    
    Exit Function
    
err1:
    
    Debug.Print "ERR: InStr_NOT_IN_STR: " & LCase(Err.Description)
    InStr_NOT_IN_STR = 0
End Function

' #1164
Function getDosPath(LongPath As String) As String

On Error GoTo err1:

Dim s As String
Dim i As Long
Dim PathLength As Long

    i = Len(LongPath) + 1
    s = String(i, 0)
    
    PathLength = GetShortPathName(LongPath, s, i)
    
    getDosPath = Left$(s, PathLength)
    
    
    Exit Function
err1:

    getDosPath = ""

End Function


' #1187
' returns system path with backslash in the end
Function getSysPath() As String

On Error GoTo err1:

Dim s As String
Dim i As Long
Dim PathLength As Long

    i = 255
    s = String(i, 0)
    
    PathLength = GetSystemDirectory(s, i)
    
    getSysPath = Add_BackSlash(Left$(s, PathLength))
    
    Exit Function
err1:
    getSysPath = ""
    
End Function




Function external_DEBUG(sEXECUTABLE_PATH As String, frm As Form) As String  ' returns error, or nothing on success
On Error GoTo err1

  ' #327r-debug-bug#'
  ' NEED TO BE ABLE TO SET CORRECT PATH! otherwise debug thinks it runs from root of emu8086.exe and creates/reads files without complete path from there!

  ' #327r-debug-bug#'  Dim sPath As String
  ' #327r-debug-bug#'  sPath = "debug " & getDosPath(sEXECUTABLE_PATH)
    
    If sEXECUTABLE_PATH = "" Then
        If MsgBox(cMT("no file is loaded. start debug.exe without parameters?"), vbYesNo) = vbNo Then
            external_DEBUG = "" ' resolved.
            Exit Function
        End If
    End If
    
    

    
    
   '#327r-debug-bug#' Shell sPath, vbNormalFocus
   ' ' #400b7-TERRIBLE_BUG!-debug.exe#  Call ShellExecute(frm.hwnd, "open", "debug", getDosPath(sEXECUTABLE_PATH), ExtractFilePath(sEXECUTABLE_PATH), SW_SHOWDEFAULT)

    ' #400b7-TERRIBLE_BUG!-debug.exe#
    ' trying to fix.....
    
     Dim s1 As String
     s1 = sEXECUTABLE_PATH
     ' before calling COMMAND PROMPT MUST RENAME ".com_" to ".com" etc....
     If Right(s1, 1) = "_" Then
        Dim s2 As String
        s2 = Mid(s1, 1, Len(s1) - 1)
        COPY_FILE s1, s2
        s1 = s2
     End If
     s1 = getDosPath(s1)
     Call ShellExecute(frm.hwnd, "open", "debug", s1, ExtractFilePath(s1), SW_SHOWDEFAULT)

   
   
   ' Debug.Print sPath
    
   ' #327r-debug-bug#'  sPath = ""
    external_DEBUG = ""
    
    Exit Function
err1:
    external_DEBUG = LCase(Err.Description)
End Function

' #327xo-av-protect#
Private Function remove_av_protection_ext(s As String) As String
    If Right(s, 1) = "_" Then
        remove_av_protection_ext = Mid(s, 1, Len(s) - 1)
    Else
        remove_av_protection_ext = s
    End If
End Function


'' #400b16-PE-RUN# : bADD_NOTE_ABOUT_EMU_CAN_ONLY_RUN_16BIT
'Sub external_RUN(sEXECUTABLE_PATH As String, frmCaller As Form, bADD_NOTE_ABOUT_EMU_CAN_ONLY_RUN_16BIT As Boolean)
'On Error GoTo err1
'
'    Dim sUnprotectedFilepath As String ' #327xo-av-protect#
'    sUnprotectedFilepath = remove_av_protection_ext(sEXECUTABLE_PATH)
'
'
'
'    Dim sExt As String ' #327q3#
'    sExt = extract_extension(sEXECUTABLE_PATH)
'
'
'    Dim sNOTE0 As String
'    If bADD_NOTE_ABOUT_EMU_CAN_ONLY_RUN_16BIT Then
'        sNOTE0 = "The emulator can only emulate 16 bit files." & vbNewLine & vbNewLine
'    Else
'        sNOTE0 = ""
'    End If
'
'
'
'     ' #327xo-av-protect#
'    If (StrComp(sExt, ".COM", vbTextCompare) = 0) Or (StrComp(sExt, ".EXE", vbTextCompare) = 0) Or _
'       (StrComp(sExt, ".COM_", vbTextCompare) = 0) Or (StrComp(sExt, ".EXE_", vbTextCompare) = 0) Then      ' #327q3#
'
'            If LCase(get_property("emu8086.ini", "WARN_RUN", "true")) = "true" Then
'                If MsgBox(sNOTE0 & cMT("note: running buggy/unchecked executable files outside of the emulator may cause a malfunction.") & vbNewLine & _
'                           vbNewLine & cMT("to prevent the MS-DOS window from closing immediately,") & vbNewLine & _
'                           cMT("you can have MOV AX,0 / INT 16h as the last instructions") & vbNewLine & _
'                           cMT("in your assembly program before return to the operating system.") & vbNewLine & _
'                           cMT("see no-close.asm in examples.") & vbNewLine & _
'                           vbNewLine & cMT("it's possible to turn off this warning in emu8086.ini by setting WARN_RUN=false") & vbNewLine & vbNewLine & vbNewLine & _
'                           cMT("are you sure you want to run:") & "   " & ExtractFileName(sUnprotectedFilepath) & " ?", vbYesNo, cMT("warning!")) = vbNo Then
'                    Exit Sub
'                End If
'            End If
'
'
'            ' #327xo-av-protect#
'            ' need to create a copy
'            If StrComp(sUnprotectedFilepath, sEXECUTABLE_PATH, vbTextCompare) <> 0 Then
''3.27xp'''                If FileExists(sUnprotectedFilepath) Then
'''''                    DELETE_FILE sUnprotectedFilepath
'''''                    Debug.Print "deleted: " & sUnprotectedFilepath
'''''                End If
'                COPY_FILE sEXECUTABLE_PATH, sUnprotectedFilepath
'            End If
'
'
'
'            Dim dRet As Double
'            dRet = Shell(sUnprotectedFilepath, vbNormalFocus)
'
'            If dRet = 0 Then
'                 mBox frmCaller, cMT("cannot start:") & " " & vbNewLine & sEXECUTABLE_PATH
'            End If
'
'    Else ' #327q3#
'            ' #3.27xk#  ' cMT("save executable as a .com file") & vbNewLine & cMT("or compile examples\writebin.asm") & vbNewLine & cMT("and use it to create a bootable floppy drive.") & vbNewLine & vbNewLine &
'            mBox frmCaller, cMT("cannot run this file from the IDE.")
'
'    End If
'
'
'
'
'
'
'
'
'    Exit Sub
'err1:
'    mBox frmCaller, "external run error: " & LCase(Err.Description) & vbNewLine & sEXECUTABLE_PATH & vbNewLine & "access denied."
'End Sub
'
'
'
'
'
'
'
'
'#1188
' made especially for NAME directive
Function replace_illigal_for_file_name(sFilename As String) As String
    Dim s As String
    s = sFilename
    
    s = Replace(s, "?", "0") ' 2006-11-29
    s = Replace(s, ":", "") ' #400b9-oops#
    s = Replace(s, "/", "")
    s = Replace(s, "\", "")
    s = Replace(s, "*", "")
    s = Replace(s, "&", "")
    s = Replace(s, "!", "")
    s = Replace(s, "#", "")
    s = Replace(s, "$", "")
    s = Replace(s, "%", "")
    s = Replace(s, "^", "")
    s = Replace(s, "'", "")
    s = Replace(s, """", "")
    s = Replace(s, "|", "")
    s = Replace(s, ",", "")
    s = Replace(s, "<", "")
    s = Replace(s, ">", "")
    s = Replace(s, "[", "")
    s = Replace(s, "]", "")
    s = Replace(s, "{", "")
    s = Replace(s, "}", "")
    s = Replace(s, " ", "_") '#327r-name#
    s = Replace(s, ".", "") '#327r-name#
    
    
    
    
    ' #400b9-oops#
    ' remove anything suspicitios, out of
    Dim sTemp As String
    sTemp = ""
    Dim sTC As String
    Dim L As Long
    For L = 1 To Len(s)
        sTC = Mid(s, L, 1)
        Dim iCode As Integer
        iCode = Asc(UCase(sTC))
        If iCode >= Asc("A") And iCode <= Asc("Z") Then
            sTemp = sTemp & sTC
        Else
            If iCode >= Asc("0") And iCode <= Asc("9") Then
                sTemp = sTemp & sTC
            Else
                If iCode = Asc("-") Or iCode = Asc("_") Then
                    sTemp = sTemp & sTC
                Else
                    ' skip it!
                End If
            End If
        End If
    Next L
    s = sTemp
    
    
    
    
    If Len(s) > 8 Then '#327r-name# ' 20 Then
        ' #327r-name#
        ' #327r-name# replace_illigal_for_file_name = "noname"
        ' #327r-name# Exit Function
        
        '#327r-name# just cut it:
        s = Mid(s, 1, 8)
        
    End If
    
    
    replace_illigal_for_file_name = s
    s = ""
    
End Function


' #327q4# wistles
' 1000000 = 1,000,000
Function make_it_american(lVal As Long) As String
On Error GoTo err1

    Dim s As String
    
    s = CStr(lVal)
    
    If Len(s) <= 3 Then
        make_it_american = s
        Exit Function
    End If
    
    
    Dim s_american As String
    Dim i As Long
    Dim iCount3 As Integer
    
    s_american = ""
    iCount3 = 0
    
    For i = Len(s) To 1 Step -1
         s_american = Mid(s, i, 1) & s_american
         iCount3 = iCount3 + 1
         
         If iCount3 = 3 And i <> 1 Then
            s_american = "," & s_american
            iCount3 = 0
         End If
         
    Next i

    make_it_american = s_american

    Exit Function
err1:
    make_it_american = "many" ' ;)
End Function


' does not return until given number of miliseconds passes...
' maximum wait 10 seconds!
' protected from midnight timer reset!
Sub wait_ms(jMiliseconds As Single)
On Error GoTo err1

    Dim j1 As Single
    
    Debug.Print "waiting...." & Timer
    
    j1 = Timer + jMiliseconds

    Do While j1 > Timer
        DoEvents
        If (j1 - Timer) > 10 Then
            Debug.Print "timer protection  - will not wait over 10 seconds!"
            Exit Do
        End If
        
        If frmEmulation.bSTOP_EVERYTHING Then
            Exit Do ' anyway!
        End If
    Loop


    Debug.Print "ok...." & Timer

    Exit Sub
err1:
    Debug.Print "wait_ms: " & Err.Description
End Sub



' #327xj-major-bp-bug#
Function get_PHYSICAL_ADDR(iSegment As Integer, iOffset As Integer) As Long
On Error GoTo err1
    
    Dim lPhysicalAddr As Long
    
    lPhysicalAddr = to_unsigned_long(iSegment)
    
    lPhysicalAddr = lPhysicalAddr * &H10
    lPhysicalAddr = lPhysicalAddr + to_unsigned_long(iOffset)

    get_PHYSICAL_ADDR = lPhysicalAddr

Exit Function
err1:
get_PHYSICAL_ADDR = 0
Debug.Print "get_PHYSICAL_ADDR: " & Err.Description
End Function

' #327xp-erase#
Sub FREE_MEM_OTHERS()
On Error GoTo err1:

    Erase primary_symbol_TABLE
    Erase secondary_symbol_TABLE
    Erase vST_for_VARS_WIN
    Erase vST_SEGMENTS_for_VARS_WIN
    Erase arrSegment_Names
    Erase arrOUT

    ' frmMain erases: Erase sLONG_DUP_LINES  on Unload...
    
    
    
    Exit Sub
err1:
Debug.Print "free mem: " & Err.Description
End Sub


' #400b3-c-debug#
Sub increase_seg_offset_by_REF(ByRef lSEG As Long, ByRef lOff As Long)
On Error Resume Next
    lOff = lOff + 1
    If lOff > 65535 Then
        lSEG = lSEG + 1
        lOff = 0
    End If
    If lSEG > 65535 Then
        lSEG = 0
    End If
    Debug.Print Hex(lSEG), Hex(lOff)
End Sub




' #400b4-mini-8-b#
Function make4digitHex(lValue As Long) As String
On Error Resume Next
    Dim s As String
    s = Hex(lValue)
    s = make_min_len(s, 8, "0")
    s = Mid(s, 5)
    make4digitHex = s
    s = ""
End Function


' 4.00-Beta-9
Function ONLY_DOTS_SPACES_OR_NOTHING(sInput As String) As Boolean
On Error Resume Next
    Dim L As Long
    
    For L = 1 To Len(sInput)
        Dim s As String
        s = Mid(sInput, L, 1)
        If s <> "." And s <> " " Then
            ONLY_DOTS_SPACES_OR_NOTHING = False
            Exit Function
        End If
    Next L
    
    ONLY_DOTS_SPACES_OR_NOTHING = True

End Function


' #400b14-INT17H#
Function do_INT_17H()
On Error GoTo err1

Dim localAH As Byte
localAH = frmEmulation.get_AH


Select Case localAH


Case 0 ' AOA:  13.2.9.1 AH=0: Print a Character
' just do as INT 21h / AH=5

    write_to_virtual_printer frmEmulation.get_AL

    ' same OK status as for 1 and 2 subfunctions :)
    frmEmulation.set_AH long_to_byte(bin_to_long("01010000b"))


' our prints are 24/7 ready :)
' AOA: 13.2.9.2 AH=1: Initialize Printer
' AOA:  13.2.9.3 AH=2: Return Printer Status
Case 1, 2
'
'AH:     Bit Meaning
'7       1=Printer busy, 0=printer not busy
'6       1=Acknowledge from printer
'5       1=Out of paper signal
'4       1=Printer selected
'3       1=I/O error
'2       Not used
'1       Not used
'0       Time out error

    frmEmulation.set_AH long_to_byte(bin_to_long("01010000b"))


Case Else
        mBox frmEmulation, cMT("wrong parameter for INT 17h") & ", AH=" & Hex(localAH) & "h"
        frmEmulation.stopAutoStep
End Select

Exit Function
err1:
    Debug.Print "do_INT_17H: " & Err.Description
End Function

' #400b14-INT17H#
Function long_to_byte(L As Long) As Byte
On Error Resume Next
    long_to_byte = to_unsigned_byte(to_signed_int(L))
End Function

' 2006-11-30
Public Sub myFileCopy(sSource As String, sDEST As String)
On Error GoTo err1
    FileCopy sSource, sDEST
Exit Sub
err1:
Debug.Print "err on myFileCopy: " & Err.Description
End Sub


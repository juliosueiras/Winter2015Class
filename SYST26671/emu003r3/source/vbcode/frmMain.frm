VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "emu8086 - assembler and microprocessor emulator"
   ClientHeight    =   6495
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   8055
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6495
   ScaleWidth      =   8055
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lst_ORIG 
      Height          =   3375
      Left            =   6360
      TabIndex        =   20
      Top             =   240
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.TextBox txtInput 
      Height          =   4695
      Left            =   2400
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   19
      Top             =   840
      Width           =   4935
   End
   Begin VB.ComboBox Combo_output_type 
      Height          =   315
      ItemData        =   "frmMain.frx":038A
      Left            =   7695
      List            =   "frmMain.frx":039A
      Style           =   2  'Dropdown List
      TabIndex        =   18
      TabStop         =   0   'False
      ToolTipText     =   "Output file type for compiler"
      Top             =   3240
      Visible         =   0   'False
      Width           =   1350
   End
   Begin VB.Frame frameLoading 
      Height          =   1035
      Left            =   1335
      MousePointer    =   11  'Hourglass
      TabIndex        =   16
      Top             =   2295
      Visible         =   0   'False
      Width           =   2880
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         Caption         =   "Loading..."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   540
         Left            =   105
         TabIndex        =   17
         Top             =   330
         Width           =   2625
      End
   End
   Begin VB.CommandButton cmdCompile_and_Emulate 
      Caption         =   "Compile and Emulate"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   690
      Left            =   180
      TabIndex        =   4
      TabStop         =   0   'False
      ToolTipText     =   "Compile Source Code and Load it into the Emulator"
      Top             =   2205
      Visible         =   0   'False
      Width           =   1290
   End
   Begin VB.CommandButton cmdHelp 
      Caption         =   "Documentation and Tutorials"
      Height          =   645
      Left            =   165
      TabIndex        =   7
      TabStop         =   0   'False
      ToolTipText     =   "Documentation & Tutorials"
      Top             =   3375
      Visible         =   0   'False
      Width           =   1290
   End
   Begin VB.CommandButton cmdAbout 
      Caption         =   "About"
      Height          =   345
      Left            =   165
      TabIndex        =   8
      TabStop         =   0   'False
      ToolTipText     =   "About Box & Home page URL"
      Top             =   4095
      Visible         =   0   'False
      Width           =   1290
   End
   Begin VB.CommandButton cmdOptions 
      Caption         =   "Options"
      Height          =   345
      Left            =   240
      TabIndex        =   6
      TabStop         =   0   'False
      ToolTipText     =   "Font and other Settings"
      Top             =   2910
      Visible         =   0   'False
      Width           =   1290
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "Save"
      Height          =   345
      Left            =   240
      TabIndex        =   2
      TabStop         =   0   'False
      ToolTipText     =   "Save Source Code"
      Top             =   1395
      Visible         =   0   'False
      Width           =   1290
   End
   Begin VB.CommandButton cmdLoad 
      Caption         =   "Open"
      Height          =   345
      Left            =   270
      MaskColor       =   &H00FFFF00&
      TabIndex        =   1
      TabStop         =   0   'False
      ToolTipText     =   "Open Source Code"
      Top             =   1095
      Visible         =   0   'False
      Width           =   1290
   End
   Begin VB.CommandButton cmdEmulate 
      Caption         =   "Emulator"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   1380
      TabIndex        =   5
      TabStop         =   0   'False
      ToolTipText     =   "Open the Emulator"
      Top             =   3870
      Visible         =   0   'False
      Width           =   1290
   End
   Begin VB.ListBox lst_Relocation_Table 
      Height          =   1620
      Left            =   6600
      TabIndex        =   15
      Top             =   5550
      Visible         =   0   'False
      Width           =   1725
   End
   Begin VB.ListBox lst_Segment_Sizes 
      Height          =   1035
      ItemData        =   "frmMain.frx":03C7
      Left            =   105
      List            =   "frmMain.frx":03D1
      TabIndex        =   12
      Top             =   6180
      Visible         =   0   'False
      Width           =   2220
   End
   Begin VB.ListBox lst_EQU 
      Height          =   840
      ItemData        =   "frmMain.frx":03F6
      Left            =   2505
      List            =   "frmMain.frx":0406
      TabIndex        =   11
      Top             =   6225
      Visible         =   0   'False
      Width           =   2220
   End
   Begin VB.CommandButton cmdCompile 
      Caption         =   "Compile"
      Height          =   345
      Left            =   210
      TabIndex        =   3
      TabStop         =   0   'False
      ToolTipText     =   "Compile the Source Code and build an executable"
      Top             =   1770
      Visible         =   0   'False
      Width           =   1290
   End
   Begin VB.ListBox lst_Source 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3885
      Left            =   2085
      TabIndex        =   14
      Top             =   720
      Visible         =   0   'False
      Width           =   2985
   End
   Begin VB.ListBox lst_Precompiled 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3660
      Left            =   1830
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   120
      Visible         =   0   'False
      Width           =   2670
   End
   Begin VB.CommandButton cmdNew 
      Caption         =   "New"
      Height          =   375
      Left            =   450
      TabIndex        =   0
      TabStop         =   0   'False
      ToolTipText     =   "New Source Code"
      Top             =   645
      Visible         =   0   'False
      Width           =   1035
   End
   Begin VB.Label Label5 
      Caption         =   "lst_EQU"
      Height          =   285
      Left            =   2850
      TabIndex        =   10
      Top             =   5970
      Visible         =   0   'False
      Width           =   840
   End
   Begin VB.Label Label3 
      Caption         =   "Segment name - size - class"
      Height          =   255
      Left            =   165
      TabIndex        =   9
      Top             =   5955
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.Menu mnuFile 
      Caption         =   "file"
      Begin VB.Menu mnuNew 
         Caption         =   "new"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuNew_old 
         Caption         =   "new_old"
         Visible         =   0   'False
         Begin VB.Menu mnuCOMTemplate 
            Caption         =   "com template"
         End
         Begin VB.Menu mnuEXETemplate 
            Caption         =   "exe template"
            Visible         =   0   'False
         End
         Begin VB.Menu mnuBINTemplate 
            Caption         =   "bin template"
            Visible         =   0   'False
         End
         Begin VB.Menu mnuBOOTTemplate 
            Caption         =   "boot template"
            Visible         =   0   'False
         End
         Begin VB.Menu mnuCleanTemplate 
            Caption         =   "empty"
            Visible         =   0   'False
         End
      End
      Begin VB.Menu mnuDelim782 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuSamples 
         Caption         =   "examples"
         Visible         =   0   'False
         Begin VB.Menu mnuSample_ARR 
            Caption         =   "Hello, world"
            Index           =   1
         End
         Begin VB.Menu mnuSample_ARR 
            Caption         =   "add / subtract"
            Index           =   2
         End
         Begin VB.Menu mnuSample_ARR 
            Caption         =   "calculate sum"
            Index           =   3
         End
         Begin VB.Menu mnuSample_ARR 
            Caption         =   "compare numbers"
            Index           =   4
         End
         Begin VB.Menu mnuSample_ARR 
            Caption         =   "binary, hex and octal values"
            Index           =   5
         End
         Begin VB.Menu mnuSample_ARR 
            Caption         =   "traffic lights"
            Index           =   6
         End
         Begin VB.Menu mnuSample_ARR 
            Caption         =   "palindrome"
            Index           =   7
         End
         Begin VB.Menu mnuSample_ARR 
            Caption         =   "LED display test"
            Index           =   8
         End
         Begin VB.Menu mnuSample_ARR 
            Caption         =   "stepper motor"
            Index           =   9
         End
         Begin VB.Menu mnuSample_ARR 
            Caption         =   "simple i/o"
            Index           =   10
         End
         Begin VB.Menu mnuSample_ARR 
            Caption         =   "more examples..."
            Index           =   99
         End
      End
      Begin VB.Menu mnuDelimeter61234 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuLoad 
         Caption         =   "open"
         Enabled         =   0   'False
         Visible         =   0   'False
      End
      Begin VB.Menu mnuDelim5432643 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuSave 
         Caption         =   "save"
         Enabled         =   0   'False
         Visible         =   0   'False
      End
      Begin VB.Menu mnuEmulate 
         Caption         =   "emulate"
      End
      Begin VB.Menu mnuSaveAs 
         Caption         =   "save as..."
         Visible         =   0   'False
      End
      Begin VB.Menu mnuDelimeter5896 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuPrint 
         Caption         =   "print..."
         Visible         =   0   'False
      End
      Begin VB.Menu mnuExportToHTML 
         Caption         =   "export to HTML..."
         Visible         =   0   'False
      End
      Begin VB.Menu mnuDelim1345 
         Caption         =   "-"
      End
      Begin VB.Menu mnuRecent 
         Caption         =   "Recent 1"
         Index           =   1
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   "Recent 2"
         Index           =   2
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   "Recent 3"
         Index           =   3
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   "Recent 4"
         Index           =   4
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   5
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   6
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   7
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   8
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   9
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   10
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   11
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   12
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   13
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   14
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   15
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   16
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   17
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   18
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   19
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   20
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   21
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   22
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRecent 
         Caption         =   ""
         Index           =   23
         Visible         =   0   'False
      End
      Begin VB.Menu mnuDelimeter0002 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuExit 
         Caption         =   "exit"
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "edit"
      Visible         =   0   'False
      Begin VB.Menu mnuUndo 
         Caption         =   "undo"
      End
      Begin VB.Menu mnuRedo 
         Caption         =   "redo"
      End
      Begin VB.Menu mnuDelimeter512 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCut 
         Caption         =   "cut"
      End
      Begin VB.Menu mnuCopy 
         Caption         =   "copy"
      End
      Begin VB.Menu mnuPaste 
         Caption         =   "paste"
      End
      Begin VB.Menu mnuDelim5432 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSelectAll 
         Caption         =   "select all"
      End
      Begin VB.Menu mnuDelimter112 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFindText 
         Caption         =   "find...                  Ctrl+F"
      End
      Begin VB.Menu mnuFindNext 
         Caption         =   "find next              F3"
      End
      Begin VB.Menu mnuReplace 
         Caption         =   "replace...            Ctrl+H"
      End
      Begin VB.Menu mnuDelim621 
         Caption         =   "-"
      End
      Begin VB.Menu mnuGotoLine 
         Caption         =   "go to line...         Ctrl+G"
      End
      Begin VB.Menu mnuDelimeter541 
         Caption         =   "-"
      End
      Begin VB.Menu mnuIndent 
         Caption         =   "indent                   Tab"
      End
      Begin VB.Menu mnuOutdent 
         Caption         =   "outdent                 Shift+Tab"
      End
      Begin VB.Menu mnuDelimeter642 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCommentBlock 
         Caption         =   "comment block"
         Shortcut        =   ^Q
      End
      Begin VB.Menu mnuUncommentBlock 
         Caption         =   "uncomment block"
         Shortcut        =   ^W
      End
      Begin VB.Menu mnuDelimeter643 
         Caption         =   "-"
      End
      Begin VB.Menu mnuMacro 
         Caption         =   "advanced editor macros"
         Begin VB.Menu mnuPlayMacro 
            Caption         =   "Play Macro 1"
            Index           =   0
         End
         Begin VB.Menu mnuPlayMacro 
            Caption         =   "Play Macro 2"
            Index           =   1
         End
         Begin VB.Menu mnuPlayMacro 
            Caption         =   "Play Macro 3"
            Index           =   2
         End
         Begin VB.Menu mnuPlayMacro 
            Caption         =   "Play Macro 4"
            Index           =   3
         End
         Begin VB.Menu mnuPlayMacro 
            Caption         =   "Play Macro 5"
            Index           =   4
         End
         Begin VB.Menu mnuPlayMacro 
            Caption         =   "Play Macro 6"
            Index           =   5
         End
         Begin VB.Menu mnuPlayMacro 
            Caption         =   "Play Macro 7"
            Index           =   6
         End
         Begin VB.Menu mnuPlayMacro 
            Caption         =   "Play Macro 8"
            Index           =   7
         End
         Begin VB.Menu mnuPlayMacro 
            Caption         =   "Play Macro 9"
            Index           =   8
         End
         Begin VB.Menu mnuPlayMacro 
            Caption         =   "Play Macro 10"
            Index           =   9
         End
         Begin VB.Menu mnuDelim000111 
            Caption         =   "-"
         End
         Begin VB.Menu mnuRepeatNextCommand 
            Caption         =   "Repeat Next Command...    Ctrl+R"
         End
         Begin VB.Menu mnuDelim00011122 
            Caption         =   "-"
         End
         Begin VB.Menu mnuNewKeystrokeMacro 
            Caption         =   "Record new Keystroke Macro"
         End
      End
      Begin VB.Menu mnuAdvanced 
         Caption         =   "advanced"
         Begin VB.Menu mnuShowLineNumbers 
            Caption         =   "show line numbers"
         End
         Begin VB.Menu mnuDelimeter834 
            Caption         =   "-"
         End
         Begin VB.Menu mnuTabifySelection 
            Caption         =   "tabify selection"
         End
         Begin VB.Menu mnuUntabifySelection 
            Caption         =   "untabify selection"
         End
         Begin VB.Menu mnuDelimeter7123 
            Caption         =   "-"
         End
         Begin VB.Menu mnuLowercaseSelection 
            Caption         =   "lowercase selection          Ctrl+L"
         End
         Begin VB.Menu mnuUppercaseSelection 
            Caption         =   "uppercase selection          Ctrl+U"
         End
         Begin VB.Menu mnuDelimeter6178 
            Caption         =   "-"
         End
         Begin VB.Menu mnuDisplayWhitespace 
            Caption         =   "display whitespace"
         End
      End
   End
   Begin VB.Menu mnuBookmarks 
      Caption         =   "bookmarks"
      Visible         =   0   'False
      Begin VB.Menu mnuToggleBookmark 
         Caption         =   "toggle bookmark                    Ctrl+F2"
      End
      Begin VB.Menu mnuDelimeter613 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPrevBookmark 
         Caption         =   "previous bookmark                Shift+F2"
      End
      Begin VB.Menu mnuNextBookmark 
         Caption         =   "next bookmark                       F2"
      End
      Begin VB.Menu mnuDelimeter135 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFirstBookmark 
         Caption         =   "jump to first"
      End
      Begin VB.Menu mnuLastBookmark 
         Caption         =   "jump to last"
      End
      Begin VB.Menu mnuDelimeter78123 
         Caption         =   "-"
      End
      Begin VB.Menu mnuClearAllBookmarks 
         Caption         =   "clear all bookmarks"
      End
   End
   Begin VB.Menu popCompile 
      Caption         =   "assembler"
      Visible         =   0   'False
      Begin VB.Menu mnuCompile 
         Caption         =   "compile"
      End
      Begin VB.Menu mnuCompileAndEmulate 
         Caption         =   "compile and load in the emulator"
      End
      Begin VB.Menu mnuFASM 
         Caption         =   "fasm"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuDelimeter623 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSetOutPutDir 
         Caption         =   "set output directory..."
      End
   End
   Begin VB.Menu popEmulator 
      Caption         =   "emulator"
      Visible         =   0   'False
      Begin VB.Menu mnuEmulator 
         Caption         =   "show emulator"
      End
      Begin VB.Menu mnuCompileAndEmulate_2 
         Caption         =   "assemble and load in the emulator"
      End
   End
   Begin VB.Menu mnuMath 
      Caption         =   "math"
      Visible         =   0   'False
      Begin VB.Menu mnuEvaluator 
         Caption         =   "multi base calculator"
      End
      Begin VB.Menu mnuCalculator 
         Caption         =   "base converter"
      End
   End
   Begin VB.Menu mnuAsciiCodes 
      Caption         =   "ascii codes"
      Visible         =   0   'False
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "help"
      NegotiatePosition=   2  'Middle
      Visible         =   0   'False
      Begin VB.Menu mnuHelpTopics 
         Caption         =   "documentation and tutorials"
      End
      Begin VB.Menu mnuDelim1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCheckForUpdate 
         Caption         =   "check for an update..."
      End
      Begin VB.Menu mnuDelimeter2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAbout 
         Caption         =   "about..."
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'



Option Explicit





' #327xm-org-twice#
Public lCORRECT_TO_ORG As Long


Dim bFLAG_MODEL_TINY As Boolean '#1050x2  ' 3.27xn
Dim bMAKE_EXE_EVEN_IF_NO_STACK As Boolean '#1050x2


' #400b20-startuppoint#
' in case there is some ".model  " but it's not tiny...
Dim bFLAG_MODEL_NOT_TINY As Boolean




' #1063  +  #327xq-long-lines#
Const MAX_LONG_LINES As Integer = 32767
Dim i_COUNT_LONG_LINES As Integer
Dim sLONG_LINES() As String





Const delayed_CMD_FIND = 1
Const delayed_CMD_FIND_NEXT = 2
Dim iCommand_TO_EXECUTE_on_DELAY As Integer


' 1.23 #204
' 1.31#447 Const myINTERNAL_COMMAND_ID = 9991

' 1.16
Dim bUPDATE_CHECK_DONE As Boolean

'r1 - marked with this when prepearing for first release.


'r1:
' is true while compiling, set to false when canceled:
Public bCOMPILING As Boolean

Dim b_MACRO_REPLACED_IN_CODE As Boolean

' keeps the full path of opened file:
Public sOpenedFile As String
' in case opened file is modified, this flag is set to TRUE:
Dim bIsModified As Boolean

Dim sDefaultCaption As String



'' 2.02#514
'' OLEDropMode of object should be set to 1 in order
'' this sub to work!
'' the same code is in frmEmulation
'Private Sub Form_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
'
'On Error GoTo err_dd
'
'If Data.GetFormat(vbCFFiles) Then
'
'    If Data.Files.Count > 0 Then
'
'        If frmStartUp.Visible Then frmStartUp.Hide ' #1172b
'
'        ' process like command line parameter:
'        PROCESS_CMD_Line Data.Files.Item(1)
'
'    End If
'
'
'End If
'
'Exit Sub
'err_dd:
'    Debug.Print "frmMain_OLEDragDrop: " & Err.Description
'    On Error Resume Next
'End Sub


' it will also include in side "comment * *" block, but
' this should (not?) be a problem since comment is removed after any way...
' 1.02 returns "true" on success.
Private Function process_INCLUDEs() As Boolean
    Dim s As String
    Dim sFilename As String
    Dim ts1 As String   ' 1.20
    Dim ts2 As String   ' 1.20
    Dim tempS As String
    
On Error GoTo error_include ' 1.02
    
    

    ' #400b20-startup#
    Dim BwasORG_ALREADY As Boolean
    BwasORG_ALREADY = False
    
    
    ' #400b16-org100h#
    Dim bFLAG_DOT_DATA As Boolean
    bFLAG_DOT_DATA = False

    
    ' 1.20 bugfix#148d
    Dim iRECURSIVE_COUNTER As Integer
    iRECURSIVE_COUNTER = 0
    
    ' 1.20 don't use global currentLINE
    Dim lCurLine As Long
    
    lCurLine = 0
    
    Do While (lCurLine < lst_Source.ListCount)
    
        s = lst_Source.List(lCurLine)
        
        '#1191trim - DONE ALREADY IN set_LISTS() '  s = myTrim_RepTab(s)
        
        Dim iLine As Integer
        
                            
        Dim sTOK1 As String
        sTOK1 = UCase(getToken(s, 0, " "))

        
        '==========================================
        ' 4.00b20 optimization ' If startsWith(s, "INCLUDE ") Then
        If StrComp(sTOK1, "INCLUDE") = 0 Then
            sFilename = Trim(Mid(s, Len("INCLUDE "))) ' get filename (with/without path).
            sFilename = Trim(remove_Comment(sFilename)) ' 2.11#607
            sFilename = removeQuotes(sFilename)
            Dim gFileNumber As Integer
            gFileNumber = FreeFile
            If Mid(sFilename, 2, 1) <> ":" Then
                ' when no drive, assumed that it's in the
                ' source's folder, or at app.path:
                ' 1.20 update:
                
                  ts1 = Add_BackSlash(ExtractFilePath(sOpenedFile)) & sFilename
                                 
                  ' if not found it the same folder
                  ' with source, look in "INC" folder:
                  If FileExists(ts1) Then
                    sFilename = ts1
                  Else
                    ts2 = Add_BackSlash(App.Path) & "inc\" & sFilename
                    sFilename = ts2
                  End If
            End If
            
            ' 1.02
            If Not FileExists(sFilename) Then
                frmInfo.addErr lCurLine, cMT("file not found:") & " " & sFilename, sFilename
                process_INCLUDEs = False
                Exit Function
            End If
            
            Open sFilename For Input Shared As gFileNumber
            iLine = lCurLine
            lst_Source.RemoveItem lCurLine ' remove "INCLUDE ...."

            Do While Not EOF(gFileNumber)
              Line Input #gFileNumber, tempS
              
              
              ' #1191trim -- REQUIRED! because these lines were not set by set_LISTS()
              tempS = myTrim_RepTab(tempS) ' #1191trim_include
              
              
              
              lst_Source.AddItem tempS, iLine
              iLine = iLine + 1
            Loop
            Close gFileNumber
            
            ' 1.04
            expand_Lines lCurLine, iLine - 1
            

            ' 1.20 bugfix#148d
            iRECURSIVE_COUNTER = iRECURSIVE_COUNTER + 1
            If iRECURSIVE_COUNTER > 700 Then
                ' artificial set of error description:
                LCase(Err.Description) = "recursive include file? "
                GoTo error_include
            End If
            
            
            ' check again, it could be "include"
            '   inside "include":
            lCurLine = lCurLine - 1
            
           
        '///////////////////////////////////////////////////////////////////
        ElseIf Left(sTOK1, 1) = "." Then  ' #400b20-startup# here it's just optimization.
        
        
        
                ' #400b20-startup# ' #400b9-precompile-optimization#
                
                
                            If StrComp(sTOK1, ".MODEL", vbTextCompare) = 0 Then
                                If InStr(1, s, "tiny", vbTextCompare) > 0 Then ' #400b3-Instr-Bug#
                                    bFLAG_MODEL_TINY = True
                                    lst_Source.List(lCurLine) = "ORG 100H"  ' #400b18-model-tiny#
                                Else
                                    ' #400b20-startuppoint#
                                    bFLAG_MODEL_NOT_TINY = True  ' some other model
                                    lst_Source.List(lCurLine) = ""          ' #400b18-model-tiny#  ignore all other.
                                End If
   
                    
                            ElseIf StrComp(sTOK1, ".DATA", vbTextCompare) = 0 Then
                                If bFLAG_MODEL_TINY Then
                                    lst_Source.List(lCurLine) = "JMP code"
                                Else
                                    lst_Source.List(lCurLine) = "data segment"
                                    add_arrSegment_Names "data" ' see also #segment record#
                                End If
                                bFLAG_DOT_DATA = True ' #400b16-org100h#
                                
                            ElseIf StrComp(sTOK1, ".CODE", vbTextCompare) = 0 Then
                                If bFLAG_MODEL_TINY Then
                                    lst_Source.List(lCurLine) = "code:"
                                Else
                                    lst_Source.List(lCurLine) = "code segment"
                                    add_arrSegment_Names "code" ' see also #segment record#
                                End If


        
        
                            ' #327xn-new-dot-stack#
                            ElseIf StrComp(sTOK1, ".STACK", vbTextCompare) = 0 Then
                                
                                If bFLAG_MODEL_TINY Then
                                    
                                    Debug.Print "tiny model has no stack! ignoring line: " & lCurLine
                                    
                                    ' #400b20-startup#
                                    lst_Source.List(lCurLine) = ""   ' ignore ".stack"
                                    
' #400b20-startup# wtf?
''''''
''''''                                    lst_Source.RemoveItem lCurLine ' remove ".stack ...."

                                Else
                                        Dim sParam As String
                                        sParam = Trim(Mid(s, Len(".stack") + 1))
                                        sParam = Trim(remove_Comment(sParam))
                                        
                                        If sParam = "" Then sParam = "256"
                                        
                                        iLine = lCurLine
                                        lst_Source.RemoveItem lCurLine ' remove ".stack ...."
                                        
                                        lst_Source.AddItem "stack segment", iLine
                                        iLine = iLine + 1
                                        lst_Source.AddItem "db " & sParam & " dup('T')", iLine
                                        iLine = iLine + 1
                                        lst_Source.AddItem "ends", iLine
                                        iLine = iLine + 1
                                        
                                        ' iLine = iLine +1  -1   just to keep it alike with the above code...
                                        
                                        expand_Lines lCurLine, iLine - 1
                                        
                                        lCurLine = lCurLine - 1 ' parse the line once again anyway...
                                 
                                End If
                                
                                
                            ' #327xn-more-short-modifications#
                            ElseIf StrComp(sTOK1, ".exit", vbTextCompare) = 0 Then
                            
                                iLine = lCurLine
                                lst_Source.RemoveItem lCurLine ' remove ".exit"
                                
                                lst_Source.AddItem "mov ax, 4c00h", iLine
                                iLine = iLine + 1
                                lst_Source.AddItem "int 21h", iLine
                                iLine = iLine + 1
                                
                                ' iLine = iLine +1  -1   just to keep it alike with the above code...
                                
                                expand_Lines lCurLine, iLine - 1
                                
                                lCurLine = lCurLine - 1 ' parse the line once again anyway...
                            
                            
                            ' #400b20-startup#
                            ElseIf (StrComp(sTOK1, ".STARTUP", vbTextCompare) = 0) Or (StrComp(sTOK1, ".START", vbTextCompare) = 0) Then
                            
                                    ' add startup instructions.... for MASM compatibility...
                                    ' masm_comp400b20.asm
                                iLine = lCurLine
                                lst_Source.RemoveItem lCurLine ' remove ".startup"
                                
                                lst_Source.AddItem "startup:", iLine
                                iLine = iLine + 1
                                
                                ' no need if it's not tiny (ORG 100h)
                                If Not bFLAG_MODEL_TINY Then
                                    lst_Source.AddItem "MOV DX, data", iLine
                                    iLine = iLine + 1
                                    lst_Source.AddItem "MOV DS, DX", iLine
                                    iLine = iLine + 1
                                End If
                                
                                ' iLine = iLine +1  -1   just to keep it alike with the above code...
                                
                                expand_Lines lCurLine, iLine - 1
                                
                                lCurLine = lCurLine - 1 ' parse the line once again anyway...
                                    
                                    
                            ElseIf sTOK1 = ".8086" Or sTOK1 = ".8088" Or sTOK1 = ".186" Or sTOK1 = ".0186" Then
                                lst_Source.List(lCurLine) = ""  ' ignore
                                
                            End If
                            '///////////////////////////////////////////////////////////////////
            
        ' #400b20-startup#
        ' move here from preCompile along with other code...
        ElseIf StrComp(sTOK1, "ORG") = 0 Then  ' same as ".model tiny"
            Dim sORG_PARAM As String  ' #327xp-org100#
            sORG_PARAM = getToken(s, 1, " ") ' 4.00b20 Trim(Mid(s, 5))
            If evalExpr(sORG_PARAM) = 256 Then  ' org 100h
               ' #400b20-startup# ' If bFLAG_MODEL_TINY Then  ' #400b18-model-tiny#
               If BwasORG_ALREADY Then
                    ' was .model tiny already.
                    lst_Source.List(lCurLine) = "" ' just ignore.
                Else
                    bFLAG_MODEL_TINY = True
                    BwasORG_ALREADY = True
                    If bFLAG_DOT_DATA Then ' was .data before org 100h ?
                        frmInfo.addErr lCurLine, cMT("ORG 100h must be before .DATA"), s
                    End If
                    ' UNCHANGED.
                End If
            Else ' #400b18-model-tiny#
                ' some special ORG. if there are more then single org an error message will be shown.
                ' UNCHANGED.
            End If
            
            
            
        End If
        '==========================================
        
        lCurLine = lCurLine + 1

        ' 1.20
        DoEvents
        If Not bCOMPILING Then
            '' artificial set of error description:
            ' no need, since frmInfo closed' LCase(err.Description) = "Compilation Stopped by User."
            GoTo error_include
        End If
        
    Loop
    
    ' 1.20 bugfix#148d
    If lst_Source.ListCount < 0 Then
        ' artificial set of error description:
        LCase(Err.Description) = "include file is too long!!!"
        GoTo error_include
    End If

    process_INCLUDEs = True
    
Exit Function

error_include:
    
    process_INCLUDEs = False

    frmInfo.addErr lCurLine, LCase(Err.Description) & ", " & sFilename, sFilename

End Function

' process those MACROs that were not replaced on preCompile(),
' this can be when MACROSes are used inside other macroses.
'
' this sub should be called until all macro names are replaced
' (used with b_MACRO_REPLACED_IN_CODE)
Private Sub process_Inner_Macros()

On Error Resume Next ' 4.00-Beta-3

    Dim s As String
    Dim i As Long 'Integer (can be Integer)
    Dim imINDEX As Long 'Integer (can be Integer)
    Dim ts As String
    Dim sCaption As String
    
    Dim iNumber_of_InsertedLines As Integer ' 1.20

    Dim sLabel_before_macro As String ' 1.22
    
    ' 1.20 don't use global currentLINE
    Dim lCurLine As Long
    
    ' 1.20 global currentLINE is used to show errors:
    currentLINE = 0
    
    lCurLine = 0


    Do While (lCurLine < lst_Precompiled.ListCount)
    
        s = lst_Precompiled.List(lCurLine)
        
        iNumber_of_InsertedLines = 0
        
        If (frmMacro.get_MACRO_index(s) <> -1) Then
'+++++++++++++++++++++++++++++++++++++++++++++++++++

            ' 1.22 bugfix#186
            sLabel_before_macro = get_label_seg_prefix(s)
            s = get_everything_after_label_seg_prefix(s)
            
            
            ' extract values of parameters and put them into the list:
            frmMacro.lstVal.Clear
            i = 1 ' second token can be a parameter.
            Do While bCOMPILING ' 1.20 True
                ' 1.22 bugfix#175 ts = getToken(s, i, " ,")
                ts = getToken_str(s, i, " ,")
                If (ts = Chr(10)) Then Exit Do
                frmMacro.lstVal.AddItem Trim(ts)
                i = i + 1
            Loop

            ' get index of line where macro starts:
            imINDEX = frmMacro.get_MACRO_index(s)
            
            ' get names of parameters:
            frmMacro.lstParameters.Clear
            sCaption = frmMacro.lstMacros.List(imINDEX) ' get macro definition line.
            i = 2 ' third token can be a parameter.
            Do While bCOMPILING ' 1.20 True
                ts = getToken(sCaption, i, " ,")
                If (ts = Chr(10)) Then Exit Do
                frmMacro.lstParameters.AddItem Trim(ts)
                i = i + 1
            Loop
            
            imINDEX = imINDEX + 1 ' go to first line of code.
            
            ' put macro code into temporary list:
            frmMacro.lstCurrent.Clear
            
            ' 1.20 bufix#150 Do While (UCase(frmMacro.lstMacros.List(imINDEX)) <> "ENDM")
            Do While (SingleWord_NotInsideQuotes_InStr(frmMacro.lstMacros.List(imINDEX), "ENDM") = 0)
                frmMacro.lstCurrent.AddItem frmMacro.lstMacros.List(imINDEX)
                
                ' 1.20 (I'm not sure that could happen, because
                '       it should be checked on creating the macro list)
                If imINDEX >= 32767 Then
                    frmInfo.addErr lCurLine, "unterminated inner MACRO definition!", ""
                    frmInfo.showErrorBuffer
                    b_MACRO_REPLACED_IN_CODE = False ' avoid eternal loop.
                    Exit Sub
                End If
                
                imINDEX = imINDEX + 1
            Loop
            
            ' prepare MACROS
            frmMacro.prepare_MACRO_CODE
            
            ' delete macro name from code:
            lst_Precompiled.RemoveItem lCurLine

            
            ' insert code instead of macro name:
            For imINDEX = 0 To frmMacro.lstCurrent.ListCount - 1
            
            ' 1.20 here we got bug#153
            '      because here we add with index, the macro code is added
            '      backwards!!!
            '      bugfix#153: added " + imINDEX" to index:
            
                If imINDEX = 0 Then ' 1.22 bugfix#186
                    lst_Precompiled.AddItem sLabel_before_macro & frmMacro.lstCurrent.List(imINDEX), lCurLine + imINDEX
                Else
                    lst_Precompiled.AddItem frmMacro.lstCurrent.List(imINDEX), lCurLine + imINDEX
                End If
                
                ' 1.20 bugfix#148b currentLINE = currentLINE + 1
            Next imINDEX
            
            ' 1.20
            ' no "-1" because we don't want to check the inserted
            ' lines in this loop (function will be called again if required)
            iNumber_of_InsertedLines = frmMacro.lstCurrent.ListCount
            
            ' 1.20 bugfix#148
            '  bugfix#154b " - 1" is required because 1 item is removed above
            '               so neto of added lines is less:
            expand_Lines lCurLine, lCurLine + frmMacro.lstCurrent.ListCount - 1
                        
            ' 1.20 used to show errors only:
            currentLINE = lCurLine
                        
            b_MACRO_REPLACED_IN_CODE = True
'+++++++++++++++++++++++++++++++++++++++++++++++++++
        End If
        
        ' 1.20 I don't want to process recursive declartions here,
        '      so go to next line after just inserted:
        If iNumber_of_InsertedLines <> 0 Then
            lCurLine = lCurLine + iNumber_of_InsertedLines
        Else
            lCurLine = lCurLine + 1
        End If

    Loop
        
End Sub

Private Function Starts_as_Comment(s As String) As Boolean

On Error Resume Next ' 4.00-Beta-3

Dim ts As String

If startsWith(s, "COMMENT") Then
     ts = Trim(Mid(s, Len("COMMENT") + 1))
     ts = Mid(ts, 1, 1)
     
     If ts = "*" Or ts = "%" Or ts = "!" Or ts = "|" Or ts = "@" Or ts = "~" Then
        Starts_as_Comment = True
     Else
        Starts_as_Comment = False
     End If
Else
    Starts_as_Comment = False
End If
    
    
End Function

' PRECOMPILE! (lst_Source -> lst_Precompiled)
'    0. replace "T1 LABEL WHATEVER" with "T1:" :)   - TODO#1007b - 2005-03-04
'    1. removing comment.
'    2. replace all constants (EQU).
'    3. process of PAGE, TITLE, NAME (remove them from code).
'    4. process of DUP().
'  '#1191trim - NO LONGER. DONE ALREADY IN set_LISTS() '    5. myTrim_RepTab().
'    6. END
'    7. process MACROs
Private Sub preCompile()
    
    
On Error Resume Next ' 4.00-Beta-3




    ' #400b10-BUG781# ' bFLAG_MODEL_TINY = False
    
    
    Dim sTMP1195c2 As String '#1195c2 - for speed.
     
    
    ' for replacing DUPs (if any):
    '3.27xq ' Dim iStart As Long
    '3.27xq ' Dim sPrefix As String
   
    ' for processing MACRO definitions:
    Dim bMACRO_STARTED As Boolean
    Dim lMACRO_STARTED_AT_LINE As Long ' #3.27p - make sure we show correct error line!
    bMACRO_STARTED = False
   
    ' for processing MACRO replacement:
    Dim i As Long 'Integer (can be Integer)
    Dim imINDEX As Long 'Integer (can be Integer)
    Dim ts As String
    
    Dim sLabel_before_macro As String ' 1.22
    
    Dim sCaption As String
    
   
    Dim s As String
    
    ' use in comment processing:
    Dim sTT As String
    Dim sTT2 As String
    
    Dim sName As String
    
    sTITLE = ""
    
' moved to CompileTheSource() to be compatible with FASM
'''''    sNamePR = "noname" '#1188 --- default filename!
'''''
'''''    ' 1.25
'''''    reset_BINF
    
    
    ' is * or % when comment starts
    Dim commentBLOCK As String
    Dim commentSTART As Long
    commentBLOCK = ""
    ' the interesting thing in comment block:
    '    even after the closing *, the command on this
    '    line isn't compiled (both MASM and TASM):
    '
    '    comment *
    '                this is a comment
    '            *  MOV AX, CX
    '
    ' the MOV command isn't executed!
    ' (this makes processing of comment block easier).
    

    lst_Precompiled.Clear

    ' 1.23#223 lst_Segment_Names.Clear
    CLEAR_arrSegment_Names

    frmMacro.resetMacro


    ' 1.20 don't use global currentLINE
    Dim lCurLine As Long
    
    lCurLine = 0



    i_COUNT_LONG_LINES = 0 ' reset!
    Erase sLONG_LINES
    
    
    lOUTPUT_TYPE_Set_ON_LINE = -1
    sCURRENT_OUTPUT_TYPE = ""
    
    
    
    ' #327xo-preCompile-optimization#
    Dim sTKN1 As String
    Dim sTKN2 As String
    sTKN1 = ""
    sTKN2 = ""
    
    

    Do While (lCurLine < lst_Source.ListCount)
              
               
               
         ' to avoid hang ups... #327t-com-sp-bug#
        DoEvents
        If frmMain.bCOMPILING = False Then Exit Sub
                       
                       
               
        s = lst_Source.List(lCurLine)
        

' #BUGv327i  - moving before myTrim_RepTab()!  - this code does not compile:  cld ; any comment!
' DECIDED NOT TO!

        ' remove comment!!!
        ' ignores (;) when it's inside the string, for example:
        '    mov ax, ';'
        s = remove_Comment(s)
    
        s = Trim(s) ' #BUGv327i_FINAL

        
        ' 2005-05-19
        ' replace_LABEL_WHATEVER() move below remove_Comment()
        ' because of: 2005-05-19_jle_doesnt_compile.asm
        ' bug fix!!!!
        
        ' TODO#1007b - 2005-03-04  making it work with "LABEL" directive :)
        s = replace_LABEL_WHATEVER(s)
        
        
 

' decided not to do it, since it doesn't help much!
'        ' 1.04
'        ' don't include comment in selected command
'        ' (it's not so important but since selection jumps
'        ' to the most right side of the string, long comment
'        ' is shown and to see the command you should scroll text
'        ' to the left, so we cut the selected area):
'        L2LC(currentLINE).CharLen = Len(s) ' update!


       '#1191trim  s = myTrim_RepTab(s)       moved to set_LISTS()!
        
        
        '#1151b
        ' allow ".org 100h" or alike... (don't know why:)
        ' just cut the dot:
        If StrComp(Left(s, 5), ".org ", vbTextCompare) = 0 Then
            s = Mid(s, 2)
        End If
        ' ignore dots and other stuff... when it's alone on the line
        If Len(s) = 1 Then
            If commentBLOCK = "" Then  ' #400b9-comment!!!#
                If InStr(1, ".,:$/\]-'""`~!@#%^&*()_+[>< ", s) > 0 Then s = "" ' #400b3-Instr-Bug#
            End If
        End If
        
        
        
        
        
        ' process EQU contants:
        s = replace_EQU(s, 0, lCurLine)
            
            
            
        ' #327xo-preCompile-optimization#
        sTKN1 = UCase(getToken_str(s, 0, " :"))
        sTKN2 = UCase(getToken_str(s, 1, " :"))
            

        
re_process:
         
        If commentBLOCK <> "" Then
            ' do not process commands until termination of a block.
            If InStr(1, s, commentBLOCK) > 0 Then
                commentBLOCK = ""   ' stop comment block.
            End If
            lst_Precompiled.AddItem ""  ' replace with empty string.
            
        ' 2.05 modified,
        '      in order to support comment of this type:
        '                        COMMENT|
        '
        '                        |
        ElseIf Starts_as_Comment(s) Then
            sTT = s
            
            sTT = Trim(Mid(s, Len("COMMENT") + 1))
            
            ' first char is always a comment delimenter:
            sTT2 = Mid(sTT, 1, 1)
            
            commentBLOCK = sTT2
            
            ' check if comment is on one string only:
            If (InStr(2, sTT, commentBLOCK) > 0) Then
                commentBLOCK = ""
            End If

            lst_Precompiled.AddItem ""  ' replace with empty string.
        ' all commands should go after comment processing!

        ElseIf bMACRO_STARTED Then
                               
           ' 1.20
           ' #400b9-precompile-optimization# ' If (UCase(getToken_str(s, 1, " ")) = "MACRO") Then
           If sTKN1 = "MACRO" Or sTKN2 = "MACRO" Then
                ' previous MACRO without "ENDM":
                Exit Do ' bMACRO_STARTED is checked on exit.
           End If
        
           If s <> "" Then ' 1.20 bugfix#154
                frmMacro.lstMacros.AddItem s ' add without change to MACROS!
           End If
           
           lst_Precompiled.AddItem "" ' replace with empty string in source code.
            ' 1.20 bufix#150 If UCase(s) = "ENDM" Then bMACRO_STARTED = False
           If SingleWord_NotInsideQuotes_InStr(s, "ENDM") <> 0 Then bMACRO_STARTED = False



        ElseIf sTKN1 = "PAGE" Then
            ' not used (ignored)
            lst_Precompiled.AddItem "" ' replace with empty string.



        ElseIf sTKN1 = "TITLE" Then
            sTITLE = Trim(Mid(s, Len("TITLE ")))
            lst_Precompiled.AddItem "" ' replace with empty string.



        ElseIf sTKN1 = "NAME" Then '#1188
            sNamePR = replace_illigal_for_file_name(Trim(Mid(s, Len("NAME "))))
            lst_Precompiled.AddItem "" ' replace with empty string.



        ' #1194b - : stopper char added ":" to allow "a db: 1" declaration
        ElseIf (sTKN1 = "DB") _
           Or (sTKN2 = "DB") Then

            ''''''''''''''' #1081
            s = Replace(s, Chr(145), """") ' ‘
            s = Replace(s, Chr(146), """") ' ’
            
            ' #327xq-equ-bug-4#
            s = FIX_db_dw(s)
                       
            ' when line is too long, len > 1020, it is truncated on AddItem?
            If Len(s) > 1020 Then
                s = keep_very_long_line_separately(s)  ' returns something like "[LONG-LINE][1]"
            End If
            
            lst_Precompiled.AddItem s  ' add after change.


         ' #1194b - : stopper char added ":" to allow "a db: 1" declaration
        ElseIf (sTKN1 = "DW") _
           Or (sTKN2 = "DW") Then
           
            ' #327xq-equ-bug-4#
            s = FIX_db_dw(s)

            ' when line is too long, len > 1020, it is truncated on AddItem?
            If Len(s) > 1020 Then
                s = keep_very_long_line_separately(s)
            End If
            
           
            lst_Precompiled.AddItem s  ' add after change.

'' removed by build_EQU_Table()
'''        ElseIf (UCase(getToken_str(s, 1, " ")) = "EQU") Then
'''             ' just ignore on thig stage, since
'''             ' the EQU table is made earlier
'''             lst_Precompiled.AddItem "" ' replace with empty string.

       ' MACRO MYNAME
       ' #400b9-precompile-optimization#
       ElseIf sTKN1 = "MACRO" Then
           frmMacro.lstMacro_Locations.AddItem frmMacro.lstMacros.ListCount ' get index of fist line of current macro.
           frmMacro.lstMacros.AddItem s ' add without change to MAROS!
           frmMacro.Add_MACRO_Name sTKN2, lCurLine ' get macro name.
           bMACRO_STARTED = True
           lMACRO_STARTED_AT_LINE = lCurLine
           lst_Precompiled.AddItem "" ' replace with empty string in source code.
    
       ' MYNAME MACRO
       ' #400b9-precompile-optimization#'  ElseIf (UCase(getToken_str(s, 1, " ")) = "MACRO") Then
       ElseIf sTKN2 = "MACRO" Then
           frmMacro.lstMacro_Locations.AddItem frmMacro.lstMacros.ListCount ' get index of fist line of current macro.
           frmMacro.lstMacros.AddItem s ' add without change to MAROS!
           '1.28#359 frmMacro.lstMacro_Names.AddItem UCase(getToken_str(s, 0, " ")) ' get macro name.
           ' #400b9-precompile-optimization# ' frmMacro.Add_MACRO_Name UCase(getToken_str(s, 0, " ")), lCurLine ' get macro name.
           frmMacro.Add_MACRO_Name sTKN1, lCurLine ' get macro name.
           bMACRO_STARTED = True
           lMACRO_STARTED_AT_LINE = lCurLine
           
           lst_Precompiled.AddItem "" ' replace with empty string in source code.
        
        ElseIf (frmMacro.get_MACRO_index(s) <> -1) Then
'+++++++++++++++++++++++++++++++++++++++++++++++++++
            
            ' 1.22 bugfix#186
            sLabel_before_macro = get_label_seg_prefix(s)
            s = get_everything_after_label_seg_prefix(s)


            ' extract values of parameters and put them into the list:
            frmMacro.lstVal.Clear
            i = 1 ' second token can be a parameter.
            Do While bCOMPILING ' 1.20 True
                ' 1.21 bugfix#160 ts = getToken(s, i, " ,")
                ts = getToken_str(s, i, " ,")
                
                If (ts = Chr(10)) Then Exit Do
                frmMacro.lstVal.AddItem Trim(ts)
                i = i + 1
            Loop

            ' get index of line where macro starts:
            imINDEX = frmMacro.get_MACRO_index(s)

            ' get names of parameters:
            frmMacro.lstParameters.Clear
            sCaption = frmMacro.lstMacros.List(imINDEX) ' get macro definition line.
            i = 2 ' third token can be a parameter.
            Do While bCOMPILING ' 1.20 True
                ts = getToken(sCaption, i, " ,")
                If (ts = Chr(10)) Then Exit Do
                frmMacro.lstParameters.AddItem Trim(ts)
                i = i + 1
            Loop
            
            imINDEX = imINDEX + 1 ' go to first line of code.
            
            ' put macro code into temporary list:
            frmMacro.lstCurrent.Clear
            
             

            ' 1.20 bufix#150 Do While (UCase(frmMacro.lstMacros.List(imINDEX)) <> "ENDM")
            Do While (SingleWord_NotInsideQuotes_InStr(frmMacro.lstMacros.List(imINDEX), "ENDM") = 0)
                frmMacro.lstCurrent.AddItem frmMacro.lstMacros.List(imINDEX)
                
                ' 1.20 (I'm not sure that could happen)
                If imINDEX >= 32767 Then
                    frmInfo.addErr lMACRO_STARTED_AT_LINE, "unterminated MACRO definition! (i_err)", ""
                    frmInfo.showErrorBuffer
                    b_MACRO_REPLACED_IN_CODE = False ' avoid eternal loop.
                    Exit Sub
                End If
                
                imINDEX = imINDEX + 1
            Loop
            
            ' prepare MACROS
            frmMacro.prepare_MACRO_CODE
            
            ' replace macro name with code:
            For imINDEX = 0 To frmMacro.lstCurrent.ListCount - 1
                If imINDEX = 0 Then ' 1.22 bugfix#186
                    lst_Precompiled.AddItem sLabel_before_macro & frmMacro.lstCurrent.List(imINDEX)
                Else
                    lst_Precompiled.AddItem frmMacro.lstCurrent.List(imINDEX)
                End If
            Next imINDEX
            
            ' 1.20 bugfix#148
            expand_Lines (lst_Precompiled.ListCount - frmMacro.lstCurrent.ListCount), lst_Precompiled.ListCount - 1
            
           ' Debug.Print "PRECOMP: " & (lst_Precompiled.ListCount - frmMacro.lstCurrent.ListCount), lst_Precompiled.ListCount - 1
            
            b_MACRO_REPLACED_IN_CODE = True
'+++++++++++++++++++++++++++++++++++++++++++++++++++
        '#400b3-general-optimiz# ' ElseIf contains_SEGMENT(s) Then ' #segment record#
        ElseIf sTKN1 = "SEGMENT" Or sTKN2 = "SEGMENT" Then ' #400b3-general-optimiz#
            ' hm... weird code... but it works.
            sName = getNewToken(s, 0, " ") ' get name (it's the first token)
            ' 1.23#223 lst_Segment_Names.AddItem sNAME
            add_arrSegment_Names sName
            lst_Precompiled.AddItem s ' add without change.

        ElseIf sTKN1 = "END" Then
        
            
            ' #400b15-end:-not-end#
            If startsWith(s, "end:") Then
                lst_Precompiled.AddItem s ' add without change.
            Else
                set_ENTRY_POINT s & " " ' #327xq-end#
                lst_Precompiled.AddItem "" ' replace with empty string.
                ' #327xn-end-warn#
                If lCurLine < lst_Source.ListCount Then  ' show only if all subsequent lines are not blank...
                    Dim lUU As Long
                    Dim bBLANK_LINES_OR_COMMENTS As Boolean
                    Dim sUU As String
                    bBLANK_LINES_OR_COMMENTS = True ' 3.27xo
                    For lUU = lCurLine + 1 To lst_Source.ListCount - 1
                        sUU = lst_Source.List(lUU)
                        sUU = Trim(sUU)
                        If Len(sUU) > 2 And Left(sUU, 1) <> ";" Then ' consider 2 or less chars of anything to be nothing valuable.
                            bBLANK_LINES_OR_COMMENTS = False
                            Exit For
                        End If
                    Next lUU
                    If Not bBLANK_LINES_OR_COMMENTS Then
                        frmInfo.addStatus cMT("any code after 'END' directive is ignored.")
                    End If
                End If
                Exit Do ' ignore the rest of the code (even if it exist).
            End If
            
            
            
        ' 1.25
        ElseIf Left(s, 1) = "#" Then ' 1.25#288

            If startsWith(s, "#MAKE_") Then
                        If (lOUTPUT_TYPE_Set_ON_LINE <> -1) And _
                           StrComp(s, sCURRENT_OUTPUT_TYPE, vbTextCompare) <> 0 Then '1.31#436
                            If lOUTPUT_TYPE_Set_ON_LINE <> -255 Then
                                frmInfo.addErr lOUTPUT_TYPE_Set_ON_LINE, "first output type directive", ""
                            End If
                            frmInfo.addErr lCurLine, "output type is set here again!", ""
                            lOUTPUT_TYPE_Set_ON_LINE = -255 ' error is already shown once.
                        Else
                    
                            sCURRENT_OUTPUT_TYPE = s ' 1.31#436
                            
                            
                            Select Case UCase(s)
                            
                            Case "#MAKE_COM#"
                                Combo_output_type.ListIndex = 0
                                lOUTPUT_TYPE_Set_ON_LINE = lCurLine
                                                                                   
                            Case "#MAKE_EXE#"
                                Combo_output_type.ListIndex = 1
                                lOUTPUT_TYPE_Set_ON_LINE = lCurLine
                                
                            Case "#MAKE_BIN#"
                                Combo_output_type.ListIndex = 2
                                lOUTPUT_TYPE_Set_ON_LINE = lCurLine
                               '#1186 leave it! '#1086 bDIRECTED_TO_WRITE_BINF_FILE = True ' 1.30#422
                                                                                
                            Case "#MAKE_BOOT#"
                                Combo_output_type.ListIndex = 3
                                lOUTPUT_TYPE_Set_ON_LINE = lCurLine
                                bDIRECTED_TO_WRITE_BINF_FILE = True '#1170b - .boot file is obsolete because it's not 8.3 compatible, now we will have only .bin files with .binf !
                                mBINF.set_DEFAULT_FOR_BOOT
                                
                            Case Else
                                frmInfo.addErr lCurLine, "wrong output type: " & s, ""
                                
                            End Select
                            
                        End If
                        
                    lst_Precompiled.AddItem "" ' replace with empty string.
                        
            Else
                
                PROCESS_BINF_DIRECTIVE s, lCurLine
                
                lst_Precompiled.AddItem "" ' replace with empty string.

            End If ' end of: If startsWith(s, "#MAKE_") .
                    
                    
        ' #400-bug-assume#.
        ElseIf sTKN1 = "ASSUME" Then
            ' just ignore completely....
            lst_Precompiled.AddItem ""

                    
            
        ElseIf Len(s) = 0 Then
            ' it's here just to avoid errors in Asc(s)<32 check.
            lst_Precompiled.AddItem s ' add without change.
        ElseIf (myAsc(s) < 32) Then
            ' ASCII codes lower 32 (space) are ignored.
            
            lst_Precompiled.AddItem "" ' 2.05 replace with empty string.
            
        ' ===========================================
        

' 3.27xn
''''''''        ' replace:                        com               exe
''''''''        '          ".data"     -  with  "JMP code"   / "data segment"
''''''''        '          ".code"     -  with  "code:"      / "code segment"
''''''''        '          ".STARTUP"    =               "startup:"


        ''' #1050x2  - 3.27xn (probably a lot of weird stuff is canceled!)
        
        
        
        
' #400b20-startup#
' moving to process_INCLUDEs()
'''''''
'''''''        ElseIf sTKN1 = "ORG" Then ' same as ".model tiny"
'''''''
'''''''            Dim sORG_PARAM As String  ' #327xp-org100#
'''''''            sORG_PARAM = Trim(Mid(s, 5))
'''''''
'''''''            If evalExpr(sORG_PARAM) = 256 Then  ' org 100h
'''''''
'''''''               ' #400b20-startup# ' If bFLAG_MODEL_TINY Then  ' #400b18-model-tiny#
'''''''               If BwasORG_ALREADY Then
'''''''                    ' was .model tiny already.
'''''''                    lst_Precompiled.AddItem "" ' just ignore.
'''''''                Else
'''''''                    bFLAG_MODEL_TINY = True
'''''''                    BwasORG_ALREADY = True
'''''''
'''''''                    If bFLAG_DOT_DATA Then ' was .data before org 100h ?
'''''''                        frmInfo.addErr lCurLine, cMT("ORG 100h must be before .DATA"), s
'''''''                    End If
'''''''
'''''''                    lst_Precompiled.AddItem s ' UNCHANGED.
'''''''                End If
'''''''
'''''''            Else ' #400b18-model-tiny#
'''''''                ' some special ORG. if there are more then single org an error message will be shown.
'''''''                lst_Precompiled.AddItem s ' UNCHANGED.
'''''''            End If
            
' #400b20-startup#
' moved to process_INCLUDEs()
'
'''''''''        ElseIf Left(sTKN1, 1) = "." Then ' #400b9-precompile-optimization#
'''''''''
'''''''''                                    If sTKN1 = ".MODEL" Then
'''''''''                                        If InStr(1, s, "tiny", vbTextCompare) > 0 Then ' #400b3-Instr-Bug#
'''''''''                                            bFLAG_MODEL_TINY = True
'''''''''                                            lst_Precompiled.AddItem "ORG 100H" ' #400b18-model-tiny#
'''''''''                                        Else
'''''''''                                            lst_Precompiled.AddItem ""         ' #400b18-model-tiny#  ignore all other.
'''''''''                                        End If
'''''''''                                        ' #400b18-model-tiny#' lst_Precompiled.AddItem ""
'''''''''
'''''''''
'''''''''
'''''''''                                    ElseIf sTKN1 = ".DATA" Then
'''''''''                                        If bFLAG_MODEL_TINY Then
'''''''''                                            lst_Precompiled.AddItem "JMP code"
'''''''''                                        Else
'''''''''                                            lst_Precompiled.AddItem "data segment"
'''''''''                                            add_arrSegment_Names "data" ' see also #segment record#
'''''''''                                        End If
'''''''''                                        bFLAG_DOT_DATA = True ' #400b16-org100h#
'''''''''
'''''''''                                    ElseIf sTKN1 = ".CODE" Then
'''''''''                                        If bFLAG_MODEL_TINY Then
'''''''''                                            lst_Precompiled.AddItem "code:"
'''''''''                                        Else
'''''''''                                            lst_Precompiled.AddItem "code segment"
'''''''''                                            add_arrSegment_Names "code" ' see also #segment record#
'''''''''                                        End If
                            
                            
'  #400b20-startup#
' moving to process_INCLUDEs()
'''''
'''''                                    ElseIf sTKN1 = ".STARTUP" Or sTKN1 = ".START" Then ' 4.00b9
'''''                                        lst_Precompiled.AddItem "startup:" ' #327xn-why-not#
'''''
'''''
   
'  #400b20-startup#   optimization too
' moving to process_INCLUDEs()
''''''
''''''                                    ' #400b9-precompile-optimization#         allow
''''''                                    ElseIf sTKN1 = ".8086" Or sTKN1 = ".8088" Or sTKN1 = ".186" Or sTKN1 = ".0186" Then
''''''                                        lst_Precompiled.AddItem "" ' replace with nothing.
''''''
''''''
''''''                                    Else
''''''                                        lst_Precompiled.AddItem s ' add without change.
''''''
''''''
''''''                                    End If ' #400b9-precompile-optimization#
         
        ' "mov ax, @data" - "mov ax, cs"
        ElseIf endsWith(s, "@data") Then
            If bFLAG_MODEL_TINY Then
                lst_Precompiled.AddItem Replace(s, "@data", "CS", 1, 1, vbTextCompare)
            Else
                lst_Precompiled.AddItem Replace(s, "@data", "data", 1, 1, vbTextCompare)
            End If
            
        ' ===========================================
        


                
        Else
            lst_Precompiled.AddItem s ' add without change.
        End If

        lCurLine = lCurLine + 1


       
        

    Loop

    ' 1.20 MACRO without "ENDM":
    If bMACRO_STARTED Then
        frmInfo.addErr lMACRO_STARTED_AT_LINE, "no endm", ""
        frmInfo.showErrorBuffer
    End If

    ' check for comment block termination:
    If commentBLOCK <> "" Then
        frmInfo.addErr lCurLine, cMT("unterminated comment block."), ""
        frmInfo.showErrorBuffer
        
' 1.30 moved after manual (if any) selection of file type:
''''    Else
''''
''''        If Combo_output_type.Text = "make EXE" Then ' 1.23#262
''''            ' check for "END"
''''            If s_ENTRY_POINT = "-1" Then
''''                frmInfo.addStatus "(" & lCurLine & ") " & "END directive required at end of file"
''''                frmInfo.addStatus "(" & lCurLine & ") " & "Entry point not set!"
''''            End If
''''        End If
        
    End If

End Sub

Private Function set_LISTS() As Boolean
   
   On Error GoTo err1
    
    lst_Source.Clear
    lst_ORIG.Clear
    
    'frmOrigCode.cmaxActualSource.Text = ""
    'frmOrigCode.lstOrigCode.Clear
    
    'frmOrigCode.PREPARE_cmaxActualSource
    
    ' speed improved by not using getLine()
    
    Dim L As Long
    Dim Size As Long
    Dim result As String
    Dim t As String
    
    ' 1.04
    Dim prevL As Long ' previous value of "l" var.
    Dim curLine As Long
    
    
    Dim sALL_SOURCE_CODE As String ' #1050
    
    
    '3.27xn -- moved to preCompile'   bFLAG_MODEL_TINY = False '#1050x2
    ' #327xn-more-short-modifications# ' bMAKE_EXE_EVEN_IF_NO_STACK = False '#1050x2
    
    
    
    ' 3.27xn a few possible bug fixes....
    
    
    sALL_SOURCE_CODE = txtInput.Text
    
    
    
    ' 2.11#606   in case file has no "13" chars
    Dim newLineChar As Long
    If InStr(1, sALL_SOURCE_CODE, Chr(13)) = 0 Then
        newLineChar = 10
    Else
        newLineChar = 13   ' before it was alreays "13".
    End If
        
    
    ' newline added to be compatible with Replace_NOT_IN_STR()
    'If newLineChar = 13 Or txtInput.lineCount = 1 Then
'    If newLineChar = 13 Then
        sALL_SOURCE_CODE = sALL_SOURCE_CODE & vbNewLine
'    Else
'        sALL_SOURCE_CODE = sALL_SOURCE_CODE & Chr(newLineChar)  ' linux style...
'    End If
'
'
    
    
    '''' #1080
    ' all tabs are spaces:
    ' #327xn-more-short-modifications# '  it's done later ' sALL_SOURCE_CODE = Replace(sALL_SOURCE_CODE, vbTab, "    ", 1, -1, vbTextCompare) ' #1191tab
    
    
' #327xq-end#   cancel #1050g ??
'''    ' make sure there is always space after end:  '
'''    sALL_SOURCE_CODE = Replace(sALL_SOURCE_CODE, "END" & Chr(newLineChar), "END " & Chr(newLineChar), 1, -1, vbTextCompare)
'''

    
' #327xn-more-short-modifications#
'''''''    ''''''''''''''''''''''' #1050 '''''''''''''''''''''''''
'''''''
'''''''
'''''''
'''''''    ' #1050x2 ' replace with comment :)
'''''''    ' #1050x2 sALL_SOURCE_CODE = Replace_NOT_IN_STR(sALL_SOURCE_CODE, ".model", "; .model", True)
'''''''    ' #1050x2     replace with #make_com# or #make_exe#
'''''''
'''''''    sALL_SOURCE_CODE = Replace_NOT_IN_STR(sALL_SOURCE_CODE, ".model", "#make_exe# ; .model ", True) ' temporary, can replace to #make_com# if .model tiny is found!
'''''''
'''''''    If LAST_REPLACE_INDEX_of_Replace_NOT_IN_STR > 0 Then
'''''''        Dim lT1050x2_TINY_INDEX As Long
'''''''        Dim lT1050x2_AFTER_MODEL_INDEX As Long
'''''''        'now I know... #1050x3'  I don't know why I should add "+3".... yet....
'''''''        lT1050x2_AFTER_MODEL_INDEX = LAST_REPLACE_INDEX_of_Replace_NOT_IN_STR + Len("#make_exe# ; .model ") '#1050x3 + 3 ' .model is already replaced!
'''''''        lT1050x2_TINY_INDEX = InStr(lT1050x2_AFTER_MODEL_INDEX, sALL_SOURCE_CODE, "tiny", vbTextCompare)
'''''''
'''''''
'''''''
'''''''        If lT1050x2_AFTER_MODEL_INDEX < lT1050x2_TINY_INDEX Then ' jic
'''''''            Dim sT1050x2_EMPTINESS As String
'''''''            sT1050x2_EMPTINESS = Mid(sALL_SOURCE_CODE, lT1050x2_AFTER_MODEL_INDEX, lT1050x2_TINY_INDEX - lT1050x2_AFTER_MODEL_INDEX)
'''''''            sT1050x2_EMPTINESS = Trim(sT1050x2_EMPTINESS) ' remove spaces and tabs
'''''''            If sT1050x2_EMPTINESS = "" Then ' must be empty if there are only spaces and tabs beween .model    and    tiny
'''''''               sALL_SOURCE_CODE = Replace(sALL_SOURCE_CODE, "#make_exe#", "org 100h")   ' replace the above relacement
'''''''               bFLAG_MODEL_TINY = True
'''''''               sT1050x2_EMPTINESS = ""
'''''''               GoTo done_with_1050x2_mode_tiny
'''''''            End If
'''''''        End If
'''''''        sT1050x2_EMPTINESS = ""
'''''''    End If
                  
'''    ' #1205
'''    ' InStr_NOT_IN_STR() ignores lines with comments!
'''    ' this is not ideal, because it will ignore lines this line: org     100h
'''    If InStr_NOT_IN_STR(sALL_SOURCE_CODE, "org 100h") > 0 Then GoTo this_is_tiny_too_1205
'''
'''
    '' making short definitions work!
    ' to avoid any possible error of what ever, make sure both ".data" and ".code" exist:
    
    ' ".code" must go after ".data" (with declarations).
    ' ".stack" must go before both!
    
    ' #327xn-new-dot-stack# ' lLINE_NUMBER_CORRECTION_FOR_ERRORS = 0 ' in case no short declarations.

' #327xn-more-short-modifications# '
'''''
'''''    ' #327xn-new-dot-stack# ' Dim l0 As Long
'''''    Dim l1 As Long
'''''    Dim l2 As Long
'''''    ' #327xn-why-not# ' Dim l3 As Long
'''''
'''''    ' #1050f
'''''    ' #327xn-new-dot-stack# ' l0 = InStr_NOT_IN_STR(sALL_SOURCE_CODE, ".STACK")
'''''
'''''    l2 = InStr_NOT_IN_STR(sALL_SOURCE_CODE, ".CODE")
'''''    ' #327xn-why-not# ' l3 = InStr_NOT_IN_STR(sALL_SOURCE_CODE, "END ")
'''''

' #BUG-short-def-2233-not-req#
''''    If l2 = 0 And l1 > 0 Then
''''        frmInfo.addErr -1, "cannot find .CODE", ""
''''        set_LISTS = False
''''        Exit Function
''''    End If
''''
''''    If l2 > 0 And l1 = 0 Then
''''        frmInfo.addErr -1, "cannot find .DATA", ""
''''        set_LISTS = False
''''        Exit Function
''''    End If
''''
    
' #327xn-why-not#
''''    If l2 > 0 And l3 = 0 Then ' #ccccend it was l0 > 0 previosly
''''        frmInfo.addErr -1, cMT("no entry point."), ""
''''        set_LISTS = False
''''        Exit Function
''''    End If
    
' #327xn-new-dot-stack# '   #BUG-short-def-2233-not-req#
'''''    If l1 > 0 Then
'''''     If l2 > 0 Then
'''''
'''''        If l2 < l1 Then
'''''            frmInfo.addErr -1, ".DATA must go before .CODE", ".data"
'''''            frmInfo.addErr 0, "or segments must be defined manually", ".data"
'''''            set_LISTS = False
'''''            Exit Function
'''''        End If
'''''
'''''
'''''        If l0 > l1 Or l0 > l2 Then
'''''            frmInfo.addErr 0, ".STACK must be defined before .CODE and .DATA", ".stack"
'''''            frmInfo.addErr 0, "or segments must be defined manually", ".stack"
'''''            set_LISTS = False
'''''            Exit Function
'''''        End If
'''''
'''''    End If
'''''    End If
               
        
' #327xn-more-short-modifications#
''''''    If l2 > 0 Then '#1050x2 - optimization ' 3.27xn even more optimized... (.code is requred!)
''''''
''''''            l1 = InStr_NOT_IN_STR(sALL_SOURCE_CODE, ".DATA")
''''''
''''''            bMAKE_EXE_EVEN_IF_NO_STACK = True '#1050x2
''''''
        
            ' #327xn-new-dot-stack#
            ''''            If l0 > 0 Then ' optimization
            ''''
            ''''                sALL_SOURCE_CODE = Replace_NOT_IN_STR(sALL_SOURCE_CODE, ".STACK", "SSEG    SEGMENT STACK   'STACK'" & vbNewLine & "        DB      64*4    DUP('T')" & vbNewLine & "SSEG    ENDS", True)
            ''''                If bFLAG_REPLACE_NOT_INSTR_SUCCESS Then
            ''''                       lLINE_NUMBER_CORRECTION_FOR_ERRORS = lLINE_NUMBER_CORRECTION_FOR_ERRORS + 2 ' two new lines! ' #1065
            ''''
            ''''                        check_DOT_STACK_PARAMETER sALL_SOURCE_CODE ' sending parameter BYREF!!!! POINTER!
            ''''                End If
            ''''
            ''''            End If


' ' #327xn-more-short-modifications# '
''''''
''''''
''''''             Dim b_dot_DATA_REPLACED As Boolean ' #1062
''''''             b_dot_DATA_REPLACED = False
''''''
''''''             sALL_SOURCE_CODE = Replace_NOT_IN_STR(sALL_SOURCE_CODE, ".DATA", "data segment", True)
''''''             If bFLAG_REPLACE_NOT_INSTR_SUCCESS Then b_dot_DATA_REPLACED = True
''''''
''''''
''''''
''''''
''''''             ' #BUG-short-def-2233-not-req# ' Dim b_dot_CODE_REPLACED As Boolean ' #1062
''''''             ' #BUG-short-def-2233-not-req# ' b_dot_CODE_REPLACED = False
''''''             sALL_SOURCE_CODE = Replace_NOT_IN_STR(sALL_SOURCE_CODE, ".CODE", "code segment", True)
''''''             ' #BUG-short-def-2233-not-req# ' If bFLAG_REPLACE_NOT_INSTR_SUCCESS Then b_dot_CODE_REPLACED = True
''''''
''''''
''''''' #BUG-short-def-2233-not-req#
'''''''''             If b_dot_DATA_REPLACED <> b_dot_CODE_REPLACED Then ' #1062
'''''''''                frmInfo.addErr 0, "you must use both .DATA and .CODE, or manually declare all segments!", ""
'''''''''                set_LISTS = False
'''''''''                Exit Function
'''''''''             End If
''''''
''''''
''''''             sALL_SOURCE_CODE = Replace_NOT_IN_STR(sALL_SOURCE_CODE, ".EXIT", "INT 20h", True)
''''''
''''''
''''''             ' #327xn-why-not#
''''''             sALL_SOURCE_CODE = Replace_NOT_IN_STR(sALL_SOURCE_CODE, ".STARTUP", "STARTUP:", True)
''''''
''''''
''''''
''''''
''''''
''''''
''''''
                          
                          
                          
''''             '#1157 ============================ makign sure all @data are replaced!
''''
''''             lLOOP_REPLACEMENT_COUNTER = 0
''''replace_DATA_with_DSEG: ' DSEG is now called DATA
''''
''''
''''             sALL_SOURCE_CODE = Replace_NOT_IN_STR(sALL_SOURCE_CODE, "@DATA", "data", False) ' can accur more than once, so must be replaced several times.
''''
''''
''''             If bFLAG_REPLACE_NOT_INSTR_SUCCESS Then
''''                lLOOP_REPLACEMENT_COUNTER = lLOOP_REPLACEMENT_COUNTER + 1
''''                If lLOOP_REPLACEMENT_COUNTER <= MAX_ALLOWED_LOOPS Then
''''                    GoTo replace_DATA_with_DSEG ' now it is simply "data"
''''                Else
''''                    Debug.Print "possibly infinite loop on replace @DATA with DATA"
''''                End If
''''             End If
''''
''''            '#1157 ================================
''''
            
' #BUG-short-def-2233-not-req#   we no longer requre segments to be closed
'''''
'''''             If b_dot_CODE_REPLACED Then ' #1062
'''''                sALL_SOURCE_CODE = Replace_NOT_IN_STR(sALL_SOURCE_CODE, "END ", "CSEG    ENDS" & vbNewLine & "END ", True)
'''''                If bFLAG_REPLACE_NOT_INSTR_SUCCESS Then lLINE_NUMBER_CORRECTION_FOR_ERRORS = lLINE_NUMBER_CORRECTION_FOR_ERRORS + 1 ' one new line! ' #1065
'''''             End If
             
             
             
' #1065
'''             If l0 > 0 Then
'''                lLINE_NUMBER_CORRECTION_FOR_ERRORS = 3
'''             Else
'''                lLINE_NUMBER_CORRECTION_FOR_ERRORS = 1
'''             End If
             
' #1062  moved above! always replace!
''         End If
''        End If

' #327xn-more-short-modifications# '
'''''
'''''
'''''        End If '#1050x2 - optimization
'''''
'''''
'''''this_is_tiny_too_1205:
'''''done_with_1050x2_mode_tiny:
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''

    
    
    
    
    Size = Len(sALL_SOURCE_CODE)
    L = 1
    prevL = 0
    result = ""
    

    
    Do While bCOMPILING ' 1.20 True
        t = Mid(sALL_SOURCE_CODE, L, 1)
        
        ' chr(12) - page break!
        If (t = Chr(newLineChar)) Or (L > Size) Or (t = Chr(12)) Then
        
        
        
               '#BUGv327i2
               
               If Not TRIM_ORIGINAL_SOURCE Then ' #327xq-trim-orig#  [1]
                   ' frmOrigCode.cmaxActualSource.AddText result & vbNewLine
                   'frmOrigCode.lstOrigCode.Text = result & vbNewLine
               End If
        
               ' #1191trim
               result = myTrim_RepTab(result)
        
               If TRIM_ORIGINAL_SOURCE Then ' #327xq-trim-orig#   [2]
                    'frmOrigCode.cmaxActualSource.AddText result & vbNewLine
                    'frmOrigCode.lstOrigCode.Text = result & vbNewLine
                    'lst_ORIG.Text = result & vbNewLine ' 20140415
                    lst_ORIG.AddItem result   ' 20140415
               End If
        
        
               '#1191
               cut_out_line_number result ' pass by reference!
           

                
        
               lst_Source.AddItem result
               
               
               
               
               '#BUGv327i2 moving from here to up:
               'frmOrigCode.cmaxActualSource.AddText result & vbNewLine
               
               
               
               ' 1.04
               ReDim Preserve L2LC(0 To lst_Source.ListCount - 1) ' 1.20 "0 To lst_Source.ListCount - 1" instead "lst_Source.ListCount".
               curLine = lst_Source.ListCount - 1
               L2LC(curLine).CharStart = prevL
               L2LC(curLine).CharLen = L - prevL
               ' byte position not known yet:
               L2LC(curLine).ByteFirst = -1 ' #327xm-listing-minir-bug# ' 0
               L2LC(curLine).ByteLast = 0
               ' currently the same as original line:
               L2LC(curLine).LineStarting = curLine
               L2LC(curLine).LineStoping = curLine
               prevL = L
               
               If L > Size Then
                    set_LISTS = True
                    Exit Function
               End If
               
               
               
               
               
               
               result = ""
        End If
        
        ' chr(12) - page break!
        If (t <> Chr(13)) And (t <> Chr(10)) And (t <> Chr(12)) Then
            result = result & t
        End If
        
        L = L + 1
        
        DoEvents    ' 1.21
    Loop
    
    
    
    ' never gets here (normally)?
    
    set_LISTS = True
    Exit Function
    
    
err1:
    set_LISTS = False
    
End Function

Private Sub cmdAbout_Click()
On Error Resume Next ' 4.00-Beta-3
    frmAbout.Show vbModal, Me
End Sub

' 1.20
Private Sub cmdCompile_and_Emulate_Click()
On Error Resume Next ' 4.00-Beta-3
    ' no, it may not be as useful... ' Me.WindowState = vbMinimized ' #v327p_auto_min#

    CompileTheSource True, True, False
End Sub

Private Sub cmdHelp_Click()
On Error Resume Next ' 4.00-Beta-3
 '   open_HTML_FILE Me, "index.html"
End Sub

' updated by open_HTML_FILE()
''''' 1.19
''''Public Sub OPEN_HELP()
''''
''''    Dim r As Long
''''    Dim sHelpFile As String
''''
''''    sHelpFile = Add_BackSlash(App.Path) & "Help\index.html"
''''
''''    ' If the function fails, the return value
''''    ' is an error value that is less than or equal to 32
''''    r = ShellExecute(Me.hWnd, "open", sHelpFile, "", App.Path, SW_SHOWDEFAULT)
''''
''''    If r = ERROR_FILE_NOT_FOUND Then
''''       mBox Me, "File not found: " & sHelpFile
''''    ElseIf r = ERROR_PATH_NOT_FOUND Then
''''       mBox Me, "Path not found: " & sHelpFile
''''    ElseIf r <= 32 Then
''''        mBox Me, "Cannot open help file, make sure program that reads HTML files is installed on your system."
''''    End If
''''
''''End Sub

' 1.06
'Private Sub Command1_Click()
'
'On Error GoTo err1
'
'Dim c(0 To 100) As Byte
'
'c(0) = 5
'c(1) = 5
'c(2) = 5
'c(3) = 5
'c(4) = 5
'c(5) = 5
'
'Debug.Print "ret: " & tfunc(c(0), 4)
'
'Dim i As Integer
'
'For i = 0 To 10
'    Debug.Print Chr(c(i))
'Next i
'
'Exit Sub
'err1:
'    Debug.Print LCase(err.Description)
'End Sub

' 1.06
'Private Sub Command2_Click()
'Dim p(0 To 100) As Byte
'Dim temp
'Dim recBuf(0 To 1000) As Byte
'Dim recLocCounter(0 To 100) As Long
'Dim iLineCounter As Long
'Dim i As Long
'
'temp = Array(0, 2, 0, &H99, &H87, 5, 0, &H1E, &HF5, &H12, 0, &H55, &H43, 0, &HF5, &H7C, &HFF, &H70, &H55, &HE3, &H55, &HE8, &H55, &H44, &HE8, &HFF, &HFF, &HEB, &HFF)
'
'
'For i = 0 To UBound(temp)
'    p(i) = temp(i)
'Next i
'
'Debug.Print "opcodes byte size: " & i
'
'    iLineCounter = disassemble(recBuf(0), recLocCounter(0), p(0), UBound(temp) + 1, 0)
'
'    printBuffer recBuf
'
'    For i = 0 To iLineCounter - 1
'        Debug.Print Hex(recLocCounter(i))
'    Next i
'End Sub

' 1.06
Private Sub printBuffer(ByRef recBuf() As Byte)

On Error Resume Next ' 4.00-Beta-3

    Dim i As Long
    Dim s As String
    
    s = ""
    
    Do While recBuf(i) <> 0
        s = s & Chr(recBuf(i))
        i = i + 1
    Loop
    
    Debug.Print "buf>" & s & "<"
    
    Debug.Print "disassembled string size: " & Len(s)
End Sub

Public Sub cmdNew_Click_PUBLIC() '#1128
On Error Resume Next ' 4.00-Beta-3
    cmdNew_Click
End Sub

Private Sub cmdNew_Click()
On Error Resume Next ' 4.00-Beta-3
    create_NEW_source -1, False ' show dialog window!
End Sub

Private Sub Form_Activate()

On Error GoTo err_update


    ' #400b4-mini-8#   fixed in advance :)
    If SHOULD_DO_MINI_FIX_8 Then
        If StrComp(txtInput.Font.Name, "Terminal", vbTextCompare) = 0 Then
            If txtInput.Font.Size < 12 Then
                txtInput.Font.Size = 12
                Debug.Print "FONT FIXED!"
            End If
        End If
    End If



    ' was used to show update box (if required).
    
    ' currenlty it is used to show
    ' unregistered box only!

'    If Not bUPDATE_CHECK_DONE Then
'
'
'
'            bUPDATE_CHECK_DONE = True
'
'
'            Dim tl As Long
'
'            tl = Now
'
'            ' Debug.Print "Days from [30 December 1899]: " & tl
'
'            ' #327xq-reg-settings-inno-setup# ' RELEASE_DATE = Val(get_property("emu8086.ini", "RELEASE", "38603")) ' #default-age#
'            ' 4.00-Beta-5 ' RELEASE_DATE = Val(GetSetting("emu8086", "isetup", "RELEASE", DEFAULT_RELEASE))   ' #default-age#
'            RELEASE_DATE = DEFAULT_RELEASE    ' 4.00-Beta-5 ' NO INNO PLEASE, UPDATE ONCE HERE IN SOURCE ONLY ' #default-age#
            ' Debug.Print "RELEASE_DATE: " & CDate(RELEASE_DATE)
'            UPDATE_CHECK = Val(get_property("emu8086.ini", "UPDATE_CHECK", "31")) ' default is 31.
'
'            If UPDATE_CHECK > 0 Then ' if zero, then update is disabled.
'                If tl >= (RELEASE_DATE + UPDATE_CHECK) Then
'                   frmUpdate.Show vbModal, Me
'                End If
'            End If
            

        
            ' I'm not sure why, but it seemed to be required to
            ' subtract one day to get it show the correct day,
            ' but now it works without it.
'            #If 0 Then
'                Dim d As Date
'                d = 37561 '37529
'                Debug.Print "d: " & Format(d, "Long Date")
'            #End If

            
'            ' 20140414 - disabled 001
'            ' #400b20-anti-crash#
'            If Not App.PrevInstance Then
'                Dim sCrashed As String
'                sCrashed = Add_BackSlash(App.Path) & "auto_save_backup.dat"
'                If FileExists(sCrashed) Then
'                    txtInput.OpenFile sCrashed
'                    If Len(Trim(txtInput.Text)) > 2 Then ' 4.00b20x
'                        bIsModified = True ' ask to save legaly!!!
'                        GoTo no_boxes_please
'                    End If
'                End If
'            Else
'                ' another instance of the IDE is running.... so the file may legaly exist.
'            End If
   

'            If Len(Command) = 0 Then  ' show it only if there are not command line parameters (otherwise it may stuck)
'               If LCase(get_property("emu8086.ini", "STARTUPWIN", "true")) = "true" Then
'                    frmStartUp.Show vbModal, Me
'               Else
'                    If bFOR_REGNOW Or (Not bRUN_FREE_FOR_N_DAYS) Then ' for regnow always show if not registered.
'                        If Not bREGISTERED Then
'                            frmStartUp.Show vbModal, Me
'                        End If
'                    End If
'               End If
'            End If
            
'no_boxes_please:
'
'    End If
    
    Exit Sub
err_update:
    Debug.Print "Error on frmMain_Activate: " & LCase(Err.Description)
    Resume Next
End Sub

' 1.25#315
'Private Sub Form_DblClick()
'    frmDebug.Show
'End Sub

Private Sub mnuAbout_Click()
On Error Resume Next ' 4.00-Beta-3
    cmdAbout_Click
End Sub

Private Sub mnuAsciiCodes_Click()
On Error Resume Next ' 4.00-Beta-3
   '3.27xp frmASCII_CHARS.Show
   frmASCII_CHARS.DoShowMe
End Sub

Private Sub mnuBINTemplate_Click()
On Error Resume Next ' 4.00-Beta-3
 create_NEW_source 2, False
End Sub

Private Sub mnuBOOTTemplate_Click()
On Error Resume Next ' 4.00-Beta-3
 create_NEW_source 3, False
End Sub

Private Sub mnuCalculator_Click()
On Error Resume Next ' 4.00-Beta-3
    frmBaseConvertor.DoShowMe
End Sub

Private Sub mnuCheckForUpdate_Click()
On Error Resume Next ' 4.00-Beta-3
 ' open_HTML_FILE Me, sUPDATE_SITE_URL & sUPDATE_URL_FILENAME
End Sub

Private Sub mnuCleanTemplate_Click()
On Error Resume Next ' 4.00-Beta-3
     create_NEW_source 4, False
End Sub

'Private Sub mnuClearAllBookmarks_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdBookmarkClearAll
'End Sub

' idea taken from cEdit:
Private Sub mnuCommentBlock_Click()
On Error GoTo err1

 
    

  Dim i As Long

  Dim UA() As String

  Dim NewStr As String

  NewStr = ""

  UA = Split(txtInput.SelText, Chr$(10))
  For i = LBound(UA) To UBound(UA)
  
    If i < UBound(UA) Then
        NewStr = NewStr & ";" & UA(i) & Chr$(10)
    Else
        NewStr = NewStr & ";" & UA(i)
    End If
    
  Next i

  Erase UA

  txtInput.SelText = NewStr

  NewStr = ""
  
  
  
  
  
  Exit Sub
  
err1:
  
  Debug.Print "mnuCommentBlock_Click: " & Err.Description

End Sub


Private Sub mnuCOMTemplate_Click()
On Error Resume Next ' 4.00-Beta-3
    create_NEW_source 0, False
End Sub

Private Sub mnuEmulate_Click()
On Error Resume Next ' 20140414
    CompileTheSource True, True, False
End Sub

Private Sub mnuEXETemplate_Click()
On Error Resume Next ' 4.00-Beta-3
     create_NEW_source 1, False
End Sub





'
' #400b16-PE-RUN#
Private Sub mnuFASM_Click()
On Error Resume Next
    CompileTheSource True, False, True
End Sub

Private Sub mnuNew_Click()
' 20140414
On Error Resume Next
    create_NEW_source 0, False
End Sub

'Private Sub mnuLowercaseSelection_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdLowercaseSelection
'End Sub


'Private Sub mnuNewKeystrokeMacro_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdRecordMacro
'End Sub


' 4.00-Beta-3  - I'm not using this
'''
'''Private Sub mnuPlayMacro_Click(Index As Integer)
'''    Select Case Index
'''
'''    Case 0
'''        txtInput.ExecuteCmd cmCmdPlayMacro1
'''
'''    Case 1
'''        txtInput.ExecuteCmd cmCmdPlayMacro2
'''
'''    Case 2
'''        txtInput.ExecuteCmd cmCmdPlayMacro3
'''
'''    Case 3
'''        txtInput.ExecuteCmd cmCmdPlayMacro4
'''
'''    Case 4
'''        txtInput.ExecuteCmd cmCmdPlayMacro5
'''
'''    Case 5
'''        txtInput.ExecuteCmd cmCmdPlayMacro6
'''
'''    Case 6
'''        txtInput.ExecuteCmd cmCmdPlayMacro7
'''
'''    Case 7
'''        txtInput.ExecuteCmd cmCmdPlayMacro8
'''
'''    Case 8
'''        txtInput.ExecuteCmd cmCmdPlayMacro9
'''
'''    Case 9
'''        txtInput.ExecuteCmd cmCmdPlayMacro10
'''    End Select
'''
'''End Sub

'Private Sub mnuPrint_Click()
'On Error Resume Next ' 4.00-Beta-3
'
'    ' #400b28#   added warning and flag
'
'    If GetSetting("emu8086", "FIRST_PRINT", "Flag_DP", "0") = "0" Then
'
'
'        If MsgBox("Please note: " & vbNewLine & vbNewLine & " Direct print may not be correct on some printers. It is recommended to export to HTML and use browser to print." & vbNewLine & vbNewLine & " This warning appears once only. Click OK to print directly anyway.", vbOKCancel + vbDefaultButton2, "Print Warning") <> vbOK Then
'            Exit Sub
'        End If
'
'        SaveSetting "emu8086", "FIRST_PRINT", "Flag_DP", "1"
'    End If
'
'    txtInput.PrintContents 0, cmPrintFlags.cmPrnBorderThin + cmPrnPromptDlg + cmPrnRichFonts + cmPrnColor + cmPrnPageNums + cmPrnDateTime
'End Sub


'
'Private Sub mnuRepeatNextCommand_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdSetRepeatCount
'End Sub


Private Sub mnuSetOutPutDir_Click()
On Error Resume Next ' 4.00-Beta-3
    'frmSetOutputDir.Show vbModal, Me
End Sub

'Private Sub mnuUppercaseSelection_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdUppercaseSelection
'End Sub

Private Sub mnuUncommentBlock_Click()
On Error GoTo err_uncomment

  Dim i As Long
  Dim k As Long

  Dim UA() As String
  Dim s As String
  Dim s1 As String
  Dim s2 As String
  
  Dim NewStr As String

  NewStr = ""

  UA = Split(txtInput.SelText, Chr$(10))

  
  For i = LBound(UA) To UBound(UA)
    s = UA(i)
    
    If Len(s) > 0 Then
        If Mid(s, 1, 1) = ";" Then ' simple case:
            s = Mid(s, 2)
        Else ' case when there are spaces/tabs before:
            k = 1
            Do While (Mid(s, k, 1) = " ") Or (Mid(s, k, 1) = vbTab)
                k = k + 1
            Loop
            
            If Mid(s, k, 1) = ";" Then  ' remove ';' only!
                s1 = Mid(s, 1, k - 1)
                s2 = Mid(s, k + 1)
                s = s1 & s2
            End If
        End If
    End If
    
    If i < UBound(UA) Then
        NewStr = NewStr & s & Chr$(10)
    Else
        NewStr = NewStr & s
    End If
  Next i

  Erase UA

  txtInput.SelText = NewStr

  NewStr = ""
  s = ""
  
  Exit Sub
err_uncomment:
    Debug.Print "mnuUncommentBlock: " & LCase(Err.Description)
    On Error Resume Next
End Sub


Private Sub mnuCompile_Click()
On Error Resume Next ' 4.00-Beta-3
    CompileTheSource True, False, False
End Sub


Private Sub mnuCompileAndEmulate_Click()
On Error Resume Next ' 4.00-Beta-3
    CompileTheSource True, True, False
End Sub

Private Sub mnuCompileAndEmulate_2_Click()
On Error Resume Next ' 4.00-Beta-3
    CompileTheSource True, True, False
End Sub


Private Sub cmdCompile_Click()
On Error Resume Next ' 4.00-Beta-3
    CompileTheSource True, False, False
End Sub


'Private Sub delete_noname_files() '#1135 (solution3) ' #1152b separate sub created that goes **after emptiness check.
'''''''''''''''''''''''''''''''''''''''''''''''''''''''
'On Error GoTo err1
'
'frmEmulation.mnuResetEmulator_and_RAM_Click_PUBLIC
'' NO NEED TO HIDE ANYTHING! #1161
''''''frmEmulation.Hide
''''''frmEmulation.ON_EMULATOR_HIDE_PART1
''''''frmEmulation.ON_EMULATOR_HIDE_PART2
'sDEBUGED_file = ""
'
'
''       just delete these files in s_MyBuild_Dir before compile:
''
''       noname.com
''       noname.exe
''       noname.bin
''       noname.boot  --- not deleted obsolete!
'
'Dim sOLD_BUILD_FILE As String
'
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.com"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.com.symbol.txt"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.com.debug"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'
'
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.exe"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.exe.symbol"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.exe.debug"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'
'
'
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.bin"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.bin.symbol.txt"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.bin.debug"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'
'
'
'
'
'
''============================================= #327xo-av-protect#
'
'
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.com_"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.com_.symbol.txt"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.com_.debug"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'
'
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname_.exe"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.exe_.symbol.txt"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.exe_.debug"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'
'
'
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.bin_"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.bin_.symbol"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'sOLD_BUILD_FILE = Add_BackSlash(s_MyBuild_Dir) & "noname.bin_.debug"
'If FileExists(sOLD_BUILD_FILE) Then
'    DELETE_FILE sOLD_BUILD_FILE
'    'Debug.Print "DELETED: " & sOLD_BUILD_FILE
'End If
'
'
'
'
'
''=====================================================================
'
'
'Exit Sub
'err1:
'    Debug.Print "delete_noname_files: " & LCase(Err.Description)
'    On Error Resume Next
'End Sub
'
'
'
'
' #400b8-fast-examples-check#
Public Sub CompileTheSource_PUBLIC()
    On Error Resume Next
    CompileTheSource False, False, False
    bASSEMBLER_STOPED = True
End Sub





'  1.21#166
'''Private Sub cmdCompile_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'''    If Button = vbRightButton Then
'''        PopupMenu popCompile
'''    End If
'''End Sub

' when bIfSucessLoadInEmulator=TRUE, doesn't ask for a filename
' (default is used, and overwritten), and loads it into emulator:
Private Sub CompileTheSource(bIfSucessLoadInEmulator As Boolean, bACTIVATE_EMULATOR_WINDOW_AFTER_LOAD As Boolean, bUSE_FASM_BY_DEFAULT As Boolean)
                
    

                
' 1.04
' after finding 2 bugs that caused the program to terminate,
' I decided to put error catcher here :)
On Error GoTo error_on_compile
                
                
                
' #400b23-bug!#
sEXE_HEADER_EXPLANATIONS = ""
                
                
' #400b20-anti-crash#
anti_crash_save
                
               
                
' #400b16-PE-RUN#
iEXECUTABLE_TYPE = 0

                
                
                
                
' #400b10-BUG781#
bFLAG_MODEL_TINY = False


' #400b20-startuppoint#
bFLAG_MODEL_NOT_TINY = False


                
' #400b9-radix#
'''    ' #400b6-radix-16#
'''    bFLAG_RADIX_16 = False
    iRADIX = 0 ' DEFAULT (decimal)
                
                
                
                
                
    Combo_output_type.ListIndex = -1 '#1184  ' select nothing by default!
                
                
   ' b_DONOT_frmOrigCode_ACTIVATE = bACTIVE_EMULATOR_WINDOW_AFTER_LOAD
                
    bWAS_ERROR_ON_LAST_EVAL_EXPR = False
    bUNKNOW_OPERAND_on_evalExpr = False ' #327xp-very-weird#  it shouldve' been here long ago...
    
    
     lTO_AVOID_ANY_DUPLICATION = 0


' 2.11#603
Dim ORG_CORRECTOR As Long
Dim prev_locCount As Long
ORG_CORRECTOR = 0



    If txtInput.Text = "" Then
    
        If bACTIVATE_EMULATOR_WINDOW_AFTER_LOAD Then '  #1146b
            frmEmulation.bTERMINATED = False ' don't ask to reload.
            mnuEmulator_Click ' just show the emulator, as it is, empty and clean.
        Else
            mBox Me, "no code to assemble.... :( " & vbNewLine & "type something like: HLT  ; at least...  "
        End If
        

      '  b_DONOT_frmOrigCode_ACTIVATE = False ' must reset
        
        Exit Sub  ' EXIT FROM HERE! NOTHING TO COMPILE!
    End If
      
      
    'delete_noname_files
      
      
    ' 1.29#395
    sLAST_COMPILED_FILE = ""
    'frmInfo.cmdBrowseMyBuild.Enabled = False
    'frmInfo.cmdEmulate.Enabled = False
    'frmInfo.cmdExternal.Enabled = False
    frmInfo.mnuExternalRun.Enabled = False
    frmInfo.mnuDebugEXE.Enabled = False
    'frmInfo.mnuShowListing.Enabled = False
    'frmInfo.mnuShowSymbolTable.Enabled = False
    
    
    
    
    ' 1.20
    frmInfo.show_precompile_animation
    
    
    
    
    ' 1.04
    ' is "true" when compiling actual command,
    ' such as "INC BX", should be "false" when
    ' compiling something like "ORG 100h":
    Dim bSHOWN_LINE As Boolean
    
    ' 1.04 (updated 1.07, 1.10)
    ' is "false" until ORG 100h macro is proceesed (if processed):
    Dim bORG_100h_executed As Boolean
    bORG_100h_executed = False
    ' 1.10 for BIN (boot sector) files:
    Dim bORG_7C00h_executed As Boolean
    bORG_7C00h_executed = False
    
    '''''''''' show the info window:
    frmInfo.set_current_text_cool ""
    frmInfo.lstStatus.Clear
    
    
    frmInfo.clearErrorBuffer_and_Text '1.20 .txtERR.Text = ""
    
    
    
    bCOMPILING = True
    
    ' #400b8-fast-examples-check#
    If Not bCOMPILE_ALL_SILENT Then
        frmInfo.Show , Me
        frmInfo.set_current_text_cool cMT("please wait...")
    End If

    DoEvents ' let it redraw.
    ''''''''''''''''''''''''''''''



    
    
    


    ' 4.00b15
    ' move here from preCompile() for FASM compatibility
    sNamePR = "0000" '"noname" '   #1188 --- default filename!
    reset_BINF






    
    
    
    
    
    
    

    Dim iTemp As Integer
    
    
    Dim s As String
    
' #327xo-hm-undeclared_label#
''''''    ' 1.28#370
''''''    Dim s3 As String
''''''    Dim s4 As String
''''''    Dim s5 As String
''''''    Dim s6 As String
''''''    Dim sFull As String

' #327xo-hm-undeclared_label#
    Dim sTOK1 As String
    Dim sTOK2 As String ' #400b9-general-compile-optimization#
    
    sCurProcName = ""
    sCurProcType = ""
    sCurSegName = "(NOSEG)"
    lCurSegStart = 0
    sCurSegClass = ""
    lUNNAMED_SEGMENT_COUNTER = 0
    
    
    
    
    
    
    
    

'    ' #400b15-integrate-fasm#
'    ' #404-masm#
'    Dim iASM_SEL As Integer
'    iASM_SEL = check_IS_FASM_MASM
'    If (iASM_SEL = 1) Or bUSE_FASM_BY_DEFAULT Then
'        frmInfo.addStatus "fasm..."
'        assemble_with_fasm bIfSucessLoadInEmulator, bACTIVATE_EMULATOR_WINDOW_AFTER_LOAD
'        Exit Sub
'    ElseIf iASM_SEL = 2 Then
'        frmInfo.addStatus "masm..."
'        assemble_with_MASM bIfSucessLoadInEmulator, bACTIVATE_EMULATOR_WINDOW_AFTER_LOAD
'        Exit Sub
'    End If
'
'
    
    
    
    
    
    
    
    
'    sTITLE = ""
    
    
    ' will stay "-1" when there is no  "END" in code:
    s_ENTRY_POINT = "-1"
               
    ' copy all data from txtInput to lst_Source,
    ' and (1.04) to lstInput:
    If Not set_LISTS Then
        GoTo stop_compile
    End If
        
    ' 1.04
    ' hor. scroll shuold be added
    ' after filling the list:
    ' 1.23 AddHorizontalScroll frmOrigCode.lstInput
        
    ' it will also include in side "comment * *" block, but
    ' this should be a problem since comment is removed after any way...
    ' #327xn-new-dot-stack# --- Now it also replaces ".stack" with segment declaration
    If Not process_INCLUDEs Then
        GoTo stop_compile
    End If
            

    ' build EQU Table:
    build_EQU_Table
    
    
    
    ' PRECOMPILE! (lst_Source -> lst_Precompiled)
    '    0. replace "T1 LABEL WHATEVER" with "T1:" :)   - TODO#1007b - 2005-03-04
    '    1. removing comment.
    '    2. replace all constants (EQU).
    '    3. process of PAGE, TITLE (remove them from code).
    '    4. process of DUP().
    '  '#1191trim  - NO LONGER! ALREADY DONE IN set_LISTS()  5. myTrim_RepTab().
    '    6. END
    '    7. process MACROs
    b_MACRO_REPLACED_IN_CODE = False
    preCompile
       
       
    ' 1.20 bugfix#148c
    Dim iRECURSIVE_COUNTER As Integer
    iRECURSIVE_COUNTER = 0
    
    ' process those MACROs that are inside other MACROs:
    ' preCompile sets b_MACRO_REPLACED_IN_CODE to true if there was
    ' at least a single macro name that was replaced with a macros,
    ' process_Inner_Macros also sets b_MACRO_REPLACED_IN_CODE to
    ' true if it replaces macro name with code:
    Do While b_MACRO_REPLACED_IN_CODE And bCOMPILING
        b_MACRO_REPLACED_IN_CODE = False
        process_Inner_Macros
        DoEvents    ' 1.20 allow to stop.
        iRECURSIVE_COUNTER = iRECURSIVE_COUNTER + 1
        If iRECURSIVE_COUNTER > 500 Then
            frmInfo.addErr currentLINE, "recursive MACRO definition is over " & iRECURSIVE_COUNTER - 1, ""
            GoTo stop_compile
        End If
    Loop



    ' 1.20 "Close: on frmInfo pressed?
    If Not bCOMPILING Then GoTo stop_compile


    ' build primary Symbol Table:
    build_primary_SymbolTable
    
    
    
    ' 3.27xd need to reset it after build_primary_SymbolTable()
    sCurProcName = ""
    sCurProcType = ""
    sCurSegName = "(NOSEG)" ' #1064b
    lCurSegStart = 0
    sCurSegClass = ""
    lUNNAMED_SEGMENT_COUNTER = 0

    

    
    ' 1.22
    frmInfo.showErrorBuffer
    
    
    ' 1.20 no need to continue, if already have an error!
    If frmInfo.lstErr.ListCount > 0 Then
        GoTo stop_compile
    End If

        
    '------- prepare the progress bar and timer:
    frmInfo.ScaleMode = vbTwips ' required, since we need more space for progress bar.
    Dim progBar_step As Single  '1.23 - (adding is better this way, since Width is Single, so no convertion is required) ' Integer
    iTemp = lst_Precompiled.ListCount  'get_Line_Count(txtPrecompiled.Text)
    If iTemp > 0 Then   ' get the maximum lengh of the progress bar:
        ' bugfix1.23#216 Fix() added:
        progBar_step = Fix((frmInfo.picProgressHolder.Width - PROGRBAR_FRAME * 2) / iTemp)
    End If
    
    Dim startTime As Single
    startTime = Timer
    '--------------------------------
        

   ' 1.23#217 lst_Temp_ST.Clear         ' reset Temporary Symbol Table.
    CLEAR_secodary_symbol_TABLE


    lst_Segment_Sizes.Clear ' reset Segment Size Table.
    
'    ' is * or % when comment starts
'    Dim commentBLOCK As String
'    Dim commentSTART As Long
'    commentBLOCK = ""
'    ' the interesting thing in comment block:
'    '    even after the closing *, the command on this
'    '    line isn't compiled (both MASM and TASM):
'    '
'    '    comment *
'    '                this is a comment
'    '            *  MOV AX, CX
'    '
'    ' the MOV command isn't executed!
'    ' (this makes processing of comment block easier).
    
    
    ' 1.20
    frmInfo.stop_precompile_animation
    
    
    
    
    
' decided that it's better to process dup.
''''   ' 3.27xp
''''   frmInfo.addStatus " "
''''   frmInfo.addStatus cMT("   please wait...")
''''   DoEvents
''''
    
    
    
    
    
    
    Dim passNum As Integer
   


    
For passNum = 1 To 50          ' allow upto 50 passes.
    

    ' #400b13-bug-RADIX#
    iRADIX = 0 ' DEFAULT (decimal)
    


    ' Debug.Print "pass: " & CStr(passNum)

    '1.23 - not seen, so don't show' frmInfo.showInfo ("Starting pass: " & passNum)
    frmInfo.lblPASS_NUMBER.Caption = "pass # " & passNum

    '1.23#241 lst_Out.Clear
    clear_arrOUT
    
    If Not bCOMPILING Then GoTo stop_compile  ' 1.30#429
    
    frmInfo.clearErrorBuffer_and_Text '1.20 .txtERR.Text = ""
    lst_Relocation_Table.Clear

    currentLINE = 0
    locationCounter = 0
    lCORRECT_TO_ORG = -1 ' #327xm-org-twice#
    
    frmInfo.show_EMPTY_progress_bar
    
    ' should not show blinking when fast showing text...
    frmInfo.set_forcus_from_current_text ' 3.27xp
    
    
    bFLAG_SEGPREFIX_REPLACED = False
    

    Do While (currentLINE < lst_Precompiled.ListCount)
              
        If Not bCOMPILING Then GoTo stop_compile ' stop compiling (caceled!).
               
        's = getLine(currentLINE, txtPrecompiled.Text)
        s = check_long_dup_expand_if_any(lst_Precompiled.List(currentLINE))
               
               
' removed :) 4.00b9
'''        If InStr(1, s, "loc_0d63", vbTextCompare) > 0 Then
'''            Debug.Print "gotya"
'''            Debug.Print s
'''        End If
        
           
                       
        ' #327xq-opt1#  - avoid looping internall on "more_on_line:"   jic
        Dim lAVOID_HANG_UP As Long
        lAVOID_HANG_UP = 0



              
              
        ' 1.04
        ' assumed that lst_Source = lst_Precompiled
        ' for selection of currently executed line!
        updateByteFirst currentLINE, locationCounter - ORG_CORRECTOR ' 2.11#603
        ' assumed that it's a command line, if not
        ' later it's set to "false":
        bSHOWN_LINE = True
               
               
        frmInfo.set_current_text_fast "(" & currentLINE + 1 & ") " & s
        DoEvents
        
'   NOT CHECKED FOR EVERY LINE, since right now segment relocation
'   is supported as the last two bytes in commands: MOV, LEA, ADD, SUB...
'            - all commands that use make_2op_INSTRUCTION()
'   (it's not supported in declarations: "DW DSEG, 5, 7" since it may not
'    be the last word)
' the main reson for moving this line from here to only those commands
' that support it is because this code:
'-----------------------------------------------
'            SSEG    SEGMENT STACK   'STACK'
'                    DW  100h    DUP(?)
'            SSEG ENDS
'            End
'-----------------------------------------------
' took 5 seconds to compile!!!! (instead of 0.49 second)
'
'        FLAG_SEG_RELOCATION = contains_SEGMENT_NAME(s) ' check if segment is inside the string.
       
more_on_line:   'jumps here when line contains both label and some command, jumps also after REP prefix.
try_again:


' #327xo-hm-undeclared_label#
'''''        ' 1.28#370
'''''        s3 = UCase(Mid(s, 1, 3))
'''''        s4 = UCase(Mid(s, 1, 4))
'''''        s5 = UCase(Mid(s, 1, 5))
'''''        s6 = UCase(Mid(s, 1, 6))
'''''        sFull = UCase(s)
                   
                   
        ' #327xo-hm-undeclared_label#
        sTOK1 = UCase(getToken(s, 0, " "))
        ' GETTING BELOW!! '
                   
                   

        If Len(s) = 0 Then
            ' ignore empty lines (do nothing).
            bSHOWN_LINE = False
            
            
            
            
            
        ' #bug400b24a.asm#  NOW IT'S HERE....
        ElseIf starts_with_LABEL_or_SEG_PREFIX(s) Then
                        
            ' 1.08 check for prefixes- DS: ES: SS: CS:
            If Not add_seg_prefix_if_required(LTrim(s)) Then  ' for something like "cs: mov ax, [bx]"
            ' if it's not a segment prefix, then it's a label:
                 process_LABEL s
            End If

            
            
            
            If Right(s, 1) <> ":" Then ' is it only label here?
                ' no there's more
                s = Trim(Mid(s, InStr(1, s, ":") + 1)) ' remove the label.
                If lAVOID_HANG_UP <= 1000 Then
                    lAVOID_HANG_UP = lAVOID_HANG_UP + 1
                    GoTo more_on_line
                End If
            End If
                        
                        
                        
            
            
        ' #327xq-opt1#
        ' must be above ALL OTHERS!
         ' does not validate if there is ' or " before "s:"
        ElseIf contains_SEGMENT_PREFIX_NEW(s) Then
            
            
            ' unlike old functions these replace "cs: ds: es: es:" anywhere, not only on start
            Dim sBeforeRemSeg As String
            
            sBeforeRemSeg = s
            s = add_seg_prefix_if_required_NEW(Trim(s))  ' and cut it!
          
            
            If Len(s) > 0 Then
                If bFLAG_SEGPREFIX_REPLACED Then
                    bFLAG_SEGPREFIX_REPLACED = False
                    ' make it work:   mov ax, cs:1234h
                    ' it becomes:    mov ax, 1234h       after  add_seg_prefix_if_required_NEW().
                    ' should become:  mov ax, [1234h]
                    s = make_it_work(sBeforeRemSeg, s)
                End If
            
                If lAVOID_HANG_UP <= 1000 Then
                    lAVOID_HANG_UP = lAVOID_HANG_UP + 1
                    GoTo more_on_line
                End If
            End If
            
            
            
            
        ElseIf sTOK1 = "MOV" Then
            compile_MOV s
            
        ElseIf sTOK1 = "LEA" Then
            compile_LEA s
            
        ElseIf sTOK1 = "INC" Or sTOK1 = "DEC" Then
            compile_INC_DEC sTOK1, s
            
        ElseIf sTOK1 = "NOT" Or sTOK1 = "NEG" _
               Or sTOK1 = "MUL" Or sTOK1 = "DIV" _
               Or sTOK1 = "IMUL" Or sTOK1 = "IDIV" Then
            compile_NOT_NEG_MUL_DIV sTOK1, s
            
        ElseIf sTOK1 = "ADC" Then
            compile_9g s, sTOK1
        ElseIf sTOK1 = "ADD" Then
            compile_9g s, sTOK1
        ElseIf sTOK1 = "AND" Then
            compile_9g s, sTOK1
        ElseIf sTOK1 = "CMP" Then
            compile_9g s, sTOK1
        ElseIf sTOK1 = "OR" Then
            compile_9g s, sTOK1
        ElseIf sTOK1 = "SBB" Then
            compile_9g s, sTOK1
        ElseIf sTOK1 = "SUB" Then
            compile_9g s, sTOK1
        ElseIf sTOK1 = "TEST" Then
            compile_9g s, sTOK1
        ElseIf sTOK1 = "XOR" Then
            compile_9g s, sTOK1
            
            
        ' 1.07
        ' C5 /r       LDS rw,ed
        ElseIf sTOK1 = "LDS" Then
            compile_LDS_LES s, "LDS"
        ' C4 /r       LES rw,ed
        ElseIf sTOK1 = "LES" Then
            compile_LDS_LES s, "LES"
            
            
        ElseIf sTOK1 = "INT" Then
            compile_INT s
            
        ElseIf sTOK1 = "IN" Then
            compile_IN s
            
        ElseIf sTOK1 = "OUT" Then
            compile_OUT s
            
        ElseIf sTOK1 = "JMP" Then
            compile_JMP s
        ElseIf sTOK1 = "CALL" Then
            compile_CALL s
            
            
    
        ElseIf sTOK1 = "RET" Or sTOK1 = "RETN" Or sTOK1 = "RETF" Then
            compile_RET sTOK1, s
            
            
            
        ElseIf sTOK1 = "PUSH" Then
            compile_PUSH s
        ElseIf sTOK1 = "POP" Then
            compile_POP s
            
        ElseIf sTOK1 = "XCHG" Then
            compile_XCHG s
            
        ElseIf get_SHIFT_ROTATE_command(sTOK1) <> "" Then
            compile_SHIFT_ROTATE s, sTOK1   'get_SHIFT_ROTATE_command(s)
            
        ElseIf get_JCC_LOOP_byte_OPTIMIZED(sTOK1) <> 255 Then
            compile_JCC_LOOP s
                  

            


      ' #bug400b24a.asm#   WAS HERE
        

            
            
        
        ElseIf process_REP(sTOK1) Then
            iTemp = InStr(1, s, " ") ' 1.28#373
            If iTemp > 0 Then
                s = Trim(Mid(s, iTemp + 1)) ' remove the REP/REPE/REPZ/REPNE/REPNZ.
                If lAVOID_HANG_UP <= 1000 Then
                    lAVOID_HANG_UP = lAVOID_HANG_UP + 1
                    GoTo more_on_line
                End If
            End If
            
        ElseIf contains_PROC(s) Then
            process_PROC s
            ' 1.20 bugfix#155b
            ' allow click on fuction definition!!!
            ' bSHOWN_LINE = False ' 1.04
        ElseIf contains_ENDP(s) Then
            process_ENDP s
            bSHOWN_LINE = False ' 1.04
            
        ' #400b3-general-optimiz# ' ElseIf contains_SEGMENT(s) Then ' line #1064b-linemark
        ElseIf sTOK1 = "SEGMENT" Or UCase(getToken_str(s, 1, " ")) = "SEGMENT" Then ' #400b3-general-optimiz#
            process_SEGMENT s
            bSHOWN_LINE = False ' 1.04
        ElseIf contains_ENDS(s) Then
            process_ENDS s
            bSHOWN_LINE = False ' 1.04
            
        ElseIf compile_NO_OPERAND_COMMAND(s) Then
             ' ok, the above function did the job,
             ' or it will continue with other "elseif".
                       
                       
' #400b9-general-compile-optimization#
''''''        ElseIf (UCase(getToken_str(s, 0, " ")) = "DB") _
''''''           Or (UCase(getToken_str(s, 1, " ")) = "DB") Then
''''''              process_DB s
''''''
''''''        ElseIf (UCase(getToken_str(s, 0, " ")) = "DW") _
''''''           Or (UCase(getToken_str(s, 1, " ")) = "DW") Then
''''''              process_DW s
''''''
''''''        ' v3.27p
''''''        ElseIf (UCase(getToken_str(s, 0, " ")) = "DD") _
''''''           Or (UCase(getToken_str(s, 1, " ")) = "DD") Then
''''''              process_DD s
              
              
' #400b9-general-compile-optimization#

        Else
                    sTOK2 = UCase(getToken(s, 1, " "))
                    
                    If (sTOK1 = "DB") Or (sTOK2 = "DB") Then
                          process_DB s
            
                    ElseIf (sTOK1 = "DW") Or (sTOK2 = "DW") Then
                          process_DW s
            
                    ' v3.27p
                    ElseIf (sTOK1 = "DD") Or (sTOK2 = "DD") Then
                          process_DD s

                    ElseIf sTOK1 = "ORG" Then
                        ' #400b22-ORG# ' If lCORRECT_TO_ORG = -1 Then ' #327xm-org-twice#
                                prev_locCount = locationCounter ' 2.11#603
                                locationCounter = evalExpr(getNewToken(s, 1, " "))
                                bSHOWN_LINE = False ' 1.04
                                
                                lCORRECT_TO_ORG = locationCounter
                                
                                If locationCounter = &H100 Then
                                    bORG_100h_executed = True ' 1.04 , 1.07, 1.10
                                    If sCURRENT_OUTPUT_TYPE = "" Then ' output type must besuperiour over org! #1089
                                        Combo_output_type.ListIndex = 0 ' make default "#MAKE_COM#"
                                    End If
                                ElseIf locationCounter = &H7C00 Then ' 1.10
                                    bORG_7C00h_executed = True
                                Else
                                    ' 2.11#603
                                    ' unknown ORG definition, it seems that
                                    ' the code will not be located at this position,
                                    ' thus when adding to debug info should know about it...
                                    ' assumed that ORG directive has larger value than
                                    ' actuall number of code bytes:
                                    ORG_CORRECTOR = locationCounter - prev_locCount
                                End If
                        ' #400b22-ORG# '  Else
                        ' #400b22-ORG# '      frmInfo.addErr currentLINE, "the integrated assembler supports single ORG statement only", s
                        ' #400b22-ORG# '   End If
                        
                        
                    ' #400b9-radix#
                    ElseIf sTOK1 = ".RADIX" Then
                        iRADIX = Val(sTOK2)
                        
                    Else
                        '   NOTHING OF THE ABOVE.....
                
                        ' #400b3fixdup# jic
                        lAVOID_HANG_UP = lAVOID_HANG_UP + 1
                        If lAVOID_HANG_UP > 1000 Then
                            frmInfo.addErr currentLINE, "error 71: " & s, s
                            GoTo exit_with_error
                        End If

                        ' #327-macroerr#.
                        If startsWith(s, "endm ") Or endsWith(s, " endm") Or StrComp(s, "endm", vbTextCompare) = 0 Then
                                ' don't show! endm is legal, it's not what caused an error!
                        Else
                            If Left(s, 1) = "." Then  ' #400-dot-do-not-ignore# CANCELED: #327xo-supress-unknown-dots#
                                If StrComp(s, ".macros", vbTextCompare) = 0 Then
                                    ' ok ignore.  same as ".procedures"...
                                ElseIf StrComp(s, ".procedures", vbTextCompare) = 0 Then
                                    ' ok ignore. one example was using that until I removed it... can be removed from here later...
                                ElseIf Len(s) >= 2 And Not ONLY_DOTS_SPACES_OR_NOTHING(s) Then
                                    frmInfo.addErr currentLINE, s & " - " & cMT("not supported."), s
                                Else
                                    ' ok, just dot(s) let it be there... ignore.
                                End If
                            Else
                                ' @@@@@@@moved###@@@@@#400b3-terrible#
                                ' moved to FIX_db_dw()
                                
                                 ' #400b3fixdup# 4.00-Beta-3
                                Dim lFixDup As Long
                                lFixDup = InStr(1, s, " dup ", vbTextCompare)
                                If lFixDup > 0 Then
                                    If InStr(1, s, " db ", vbTextCompare) <= 0 Then
                                        If Not sTOK1 Like "#*" Then '  55   dup (45)
                                            s = Replace(s, " ", " db ", 1, 1)
                                            GoTo try_again
                                        End If
                                    End If
                                End If
                                lFixDup = InStr(1, s, " dup(", vbTextCompare)
                                If lFixDup > 0 Then
                                    If InStr(1, s, " db ", vbTextCompare) <= 0 Then
                                        If Not sTOK1 Like "#*" Then '  55   dup(45)
                                            s = Replace(s, " ", " db ", 1, 1)
                                            GoTo try_again
                                        End If
                                    End If
                                End If
                                If startsWith(s, "dup ") Or startsWith(s, "dup(") Then
                                    frmInfo.addErr currentLINE, "no size: " & s, s
                                    GoTo exit_with_error
                                End If
                                 ' show error:
                                frmInfo.addErr currentLINE, cMT("illegal instruction:") & " " & s & " " & cMT("or wrong parameters."), s
                        End If ' If Left(s, 1) = "."...
                        
                        
                  End If ' If startsWith(s, "endm ") Or .....
                        
' #400b9-precompile-optimization#
''''            ' v3.27s
''''            ' #327-macroerr#.
''''            If startsWith(s, "macro") Then
''''               frmInfo.addErr currentLINE, cMT("name must be before macro directive..."), s
''''            End If

            bSHOWN_LINE = False ' 1.04   '   #400b9-nnnewly#  should be in the right place, don't know what it does.
                        
            End If '  If (sTOK1 = "DB") Or .....
            

        End If
       
'        '+++++++++++++++++++++++++++++++++++++++++++++++
'        ' update Segment Relocation table, if required.
'        ' assumed that segment word is always in the last two bytes!
'         If FLAG_SEG_RELOCATION Then
'            lst_Relocation_Table.AddItem Hex((locationCounter - 2) - lCurSegStart) & " " & Hex(lCurSegStart)
'            FLAG_SEG_RELOCATION = False
'         End If
'        '
'        '+++++++++++++++++++++++++++++++++++++++++++++++
        
        
        ' 1.04
        ' assumed that lst_Source = lst_Precompiled
        ' for selection of currently executed line!
        If bSHOWN_LINE Then
            ' location counter is set to the next byte after the
            ' current command, we keep record of included bytes only,
            ' so "-1":
            updateByteLast currentLINE, locationCounter - 1 - ORG_CORRECTOR ' 2.11#603
        Else
            updateByteFirst currentLINE, -1
        End If
       
        ' 1.04
        If bWAS_ERROR_ON_LAST_EVAL_EXPR Then
            bWAS_ERROR_ON_LAST_EVAL_EXPR = False
            frmInfo.addErr currentLINE, cMT("overflow! - cannot be evaluated:") & " " & s, ""
        End If
       
        currentLINE = currentLINE + 1
        
        ' update progress bar:
        ' frmInfo.shpPROGRESS.Width = frmInfo.shpPROGRESS.Width + progBar_step
        frmInfo.updatePROGRESS progBar_step
        
    Loop


    ' 1.23 txtLocCounter.Text = locationCounter


    ' Debug.Print "Pass # " & passNum & " complete!"


    'If StrComp(txt_Temp_ST.Text, txt_Symbol_Table.Text, vbTextCompare) = 0 Then
    If symbol_Tables_EQUAL Then
        Exit For    ' EXIT LOOP
    Else
        ' 1.23#217 copy_LIST
        copy_Secondary_to_Primary_TABLE
        ' 1.23#217 lst_Temp_ST.Clear
        CLEAR_secodary_symbol_TABLE
        lst_Segment_Sizes.Clear
    End If
        
        
        
        
        
        
        
        
    ' 3.27xd probably it's better this way...
    sCurProcName = ""
    sCurProcType = ""
    sCurSegName = "(NOSEG)" ' #1064b
    lCurSegStart = 0
    sCurSegClass = ""
    lUNNAMED_SEGMENT_COUNTER = 0
        
        

Next passNum


exit_with_error:


        
        ' check the match of PROC / ENDP:
        If sCurProcName <> "" Then
            ' #BUG-short-def-2233-not-req# ' frmInfo.addErr lCurProc_LINE_NUM, cMT("no ENDP for:") & " " & sCurProcName, sCurProcName
            Debug.Print lCurProc_LINE_NUM, "no ENDP for: " & sCurProcName ' accepted and expected when short definitions are used.
            sCurProcName = "" ' continue....
        End If
    
        ' check the match of SEGMENT / ENDS:
        If (sCurSegName <> "") And (sCurSegName <> "(NOSEG)") Then
            ' #BUG-short-def-2233-not-req# ' frmInfo.addErr currentLINE, cMT("no ENDS for:") & " " & sCurSegName, sCurSegName
            Debug.Print currentLINE, "no ENDS for: " & sCurSegName '  accepted and expected when short definitions are used.
            sCurSegName = "(NOSEG)" ' continue....
        End If


    Dim fTimeSpent As Single
    fTimeSpent = get_spent_time(startTime)
    
    frmInfo.addStatus cMT("Assembled in") & " " & passNum & " " & cMT("passes. Time spent:") & " " & fTimeSpent & " " & cMT("seconds.")
    frmInfo.set_current_text_cool ""
    
    frmInfo.lblPASS_NUMBER.Caption = ""
    
    
    ' 2.04#530
    If lElements_in_arrOUT <= 0 Then
        frmInfo.addErr -1, cMT("not enough instructions..."), ""
        frmInfo.addErr -1, cMT("should be at least 1 instruction outside macro or before the 'END' directive"), ""
    End If
    
    
    frmInfo.showErrorBuffer
    
    ' DO NOT SET ERRORS ANY MORE!!! (or update buffer after it!)
    
    
    ' 1.23
    ' just in case it did not go to the end:
    frmInfo.show_FULL_progress_bar
    
    

    
    
    ' 1.23
    ' now it is important because this
    ' enables righ-click menus on frmInfo!
    bCOMPILING = False
    
    
    
    
    ' 1.04 building only when no errors!
    If frmInfo.lstErr.ListCount = 0 Then
 
            ' 1.25
            If lOUTPUT_TYPE_Set_ON_LINE = -1 Then
            
            
            
' #400b10-BUG781# ' simplifications...
'                ' 2005-03-04 TODO#1006
'                If Not bORG_100h_executed Then
'                    If frmChooseOutput.Visible = False Then
'                        ' this just insures that form is loaded.
'                        ' it's required for list to be loaded.
'                        DoEvents
'                    End If
'              '#1184      frmChooseOutput.comboOType.ListIndex = 1 ' exe
'              '#1184       Combo_output_type.ListIndex = 1 ' #1050b  (it's the main selector!)
'                    ' Debug.Print "default - make_EXE - TODO#1006"
'                End If
            
            
            
                '
                If bORG_100h_executed Or bFLAG_MODEL_TINY Then ' #400b9-tiny#
                        ' #400b10-BUG781# ' frmChooseOutput.comboOType.ListIndex = 0 ' com
                        Combo_output_type.ListIndex = 0 '  it's the selector!
                Else
                    ' #400b20-startuppoint# '  If (get_Stack_Segment_SIZE() = 0) And no_entry_point(s_ENTRY_POINT) Then ' #1050b
                    ' #400b20-startuppoint#
                    If (get_Stack_Segment_SIZE() = 0) And no_entry_point(s_ENTRY_POINT) And (Not bFLAG_MODEL_NOT_TINY) Then

'#1179
''''                        ' 1.30#418
''''                        frmChooseOutput.comboOType.ListIndex = 2
''''                        frmChooseOutput.Show vbModal, Me
''''                        frmInfo.addStatus "output type selected manually."

                        ' #400b10-BUG781# ' frmChooseOutput.comboOType.ListIndex = 2 ' bin
                        Combo_output_type.ListIndex = 2 '#1184 this is the true selector!
                        frmInfo.addStatus cMT("creating plain binary file.")
                        
' #327xn-more-short-modifications# wtf?
''''                        If bMAKE_EXE_EVEN_IF_NO_STACK Then
''''                            frmChooseOutput.comboOType.ListIndex = 1 ' exe
''''                            Combo_output_type.ListIndex = 1
''''                        End If

                    Else
                    
                    
                    
                        ' #400b10-BUG781# ' frmChooseOutput.comboOType.ListIndex = 1 ' exe
                        Combo_output_type.ListIndex = 1 ' #1050b  (it's the main selector!)
                        '3.27xp it seems to be wrong.... frmInfo.addStatus "stack found. creating .exe file"
                        ' Debug.Print "creating exe..."
                    End If
                
                
                ' we have only 3 output types now:
                ' 0 - .com
                ' 1 - .exe
                ' 2 - .bin
                ' --- 3 - . boot format is obsolete! repalced by .bin with .binf
                
                End If
                
                
                                
            Else
                Select Case Combo_output_type.ListIndex
                
                Case 0
                    frmInfo.addStatus "#make_com#  detected."
                Case 1
                    frmInfo.addStatus "#make_exe#  detected."
                Case 2
                    frmInfo.addStatus "#make_bin#  detected."
                Case 3
                    frmInfo.addStatus "#make_boot# detected (.bin)"
                End Select
            End If
 
 
 
 
 
 
        ' 1.30 moved here from PreCompile()
         If Combo_output_type.ListIndex = 1 Then ' #1050b2 (index is better) .Text = "make EXE" Then
            
' 3.27xn --- what ever it was here... now it's fixed
            ' check for "END"
'''''            If s_ENTRY_POINT = "-1" Then
'''''                ' frmInfo.addStatus "END directive required at end of file"
'''''                frmInfo.addStatus cMT("entry point not set!")
'''''            Else
'''''

                If no_entry_point(s_ENTRY_POINT) Then   ' #1088c
                    
                    If get_var_size("startup") <> 0 Then  ' #327xn-why-not#
                    
                        s_ENTRY_POINT = "startup"
                    
                    Else
                    
                        If (InStr(1, txtInput.Text, ".code", vbTextCompare) > 0) Or (InStr(1, txtInput.Text, "code segment", vbTextCompare) > 0) Then ' #1088c - this way it works for normal exe as well.
                                s_ENTRY_POINT = "code"
' #327xq-end-dir# ???  it did not work for example with end in the end when tabs were there
''''                        Else
''''                            frmInfo.addErr currentLINE, cMT("no entry point after") & " END " & cMT("directive!"), ""
''''                            GoTo stop_compile
                        End If
                        
                    End If
                    
                    
                ' #1050h
                ElseIf get_var_size(s_ENTRY_POINT) = 0 And (no_entry_point(s_ENTRY_POINT) = False) Then
                        frmInfo.addErr currentLINE, cMT("wrong entry point!") & " END " & s_ENTRY_POINT, s_ENTRY_POINT
                        GoTo stop_compile
                Else
                    frmInfo.addStatus cMT("entry point not set!")
                End If
                
                
'''''            End If
            
         End If
 
 
 
 
 
            ' 1.04
            sDEBUGED_file = "" ' is set below by build_EXE(), build_BIN() or build_COM().
    
            ' SELECT FILE TYPE!
            If Combo_output_type.ListIndex = 1 Then      ' .EXE
            
                If bORG_100h_executed Then
                
                    ' #400b22-no-ask#
                    If bCOMPILE_ALL_SILENT Then GoTo no_asking_please_0
                
                    If MsgBox(cMT("directive: org 100h - found!") & vbNewLine & _
                                cMT("generally only .COM programs require") & " " & _
                                cMT("location counter to be set to 100h bytes.") & vbNewLine & _
                                cMT("continue anyway?"), vbYesNo + vbDefaultButton2, "ORG 100h") = vbNo Then
                                
                            frmInfo.addStatus "EXE file not built, aborted - ORG 100h found!"

                           ' b_DONOT_frmOrigCode_ACTIVATE = False ' must reset
                            
                            Exit Sub
                    End If
                End If
                
' #400b22-no-ask#
no_asking_please_0:

                
                ' 1.10
                If bORG_7C00h_executed Then
                
                    ' #400b22-no-ask#
                    If bCOMPILE_ALL_SILENT Then GoTo no_asking_please_0b
                    
                    If MsgBox("Line ""ORG 7C00H"" - found!" & vbNewLine & _
                                cMT("Generally only .BIN programs (boot sectors) begin") & " " & _
                                cMT("with a 7C00H byte prefix.") & vbNewLine & _
                                cMT("Continue anyway?"), vbYesNo + vbDefaultButton2, "ORG 7C00H") = vbNo Then
                                
                            frmInfo.addStatus "EXE file not built, aborted - ""ORG 7C00H"" found!"
                            

                           ' b_DONOT_frmOrigCode_ACTIVATE = False ' must reset
                            
                            Exit Sub
                    End If
                End If
no_asking_please_0b:
            
            
                If build_EXE(bIfSucessLoadInEmulator, bACTIVATE_EMULATOR_WINDOW_AFTER_LOAD) Then
                    frmInfo.addStatus """" & ExtractFileName(sDEBUGED_file) & """ " & cMT("is compiled successfully into") & " " & make_it_american(FileLen(sDEBUGED_file)) & " bytes."
                Else
                    frmInfo.addStatus cMT("executable file is not created!")
                End If
                
            ElseIf Combo_output_type.ListIndex = 0 Then  ' .COM
            
                ' 1.04
                If Not bORG_100h_executed Then
                    
                    ' #400b20x-no-ask#
                    If bCOMPILE_ALL_SILENT Then GoTo no_asking_please
                    
                    If MsgBox("directive: org 100h - not found!" & vbNewLine & _
                                "usually a .COM program must set location counter" & " " & _
                                "to 100h bytes." & vbNewLine & vbNewLine & _
                                "the incorrect listing may be generated!" & vbNewLine & vbNewLine & _
                                "continue anyway?", vbYesNo + vbDefaultButton2, "ORG 100H") = vbNo Then
                                
                            frmInfo.addStatus cMT("COM file not built, aborted - ORG 100h not found!")
                            

                          '  b_DONOT_frmOrigCode_ACTIVATE = False ' must reset
    
                            Exit Sub
                    Else
                    
' #400b20x-no-ask#
no_asking_please:
                           add_val_to_all_ByteFirst_ByteLast &H100
                    End If
                End If
            
                If (get_Stack_Segment_SIZE() = 0) Then
                    If build_COM(bIfSucessLoadInEmulator, bACTIVATE_EMULATOR_WINDOW_AFTER_LOAD) Then
                        frmInfo.addStatus """" & ExtractFileName(sDEBUGED_file) & """ " & cMT("is assembled successfully into") & " " & make_it_american(FileLen(sDEBUGED_file)) & " bytes."
                    Else
                        frmInfo.addStatus cMT("executable file is not created!")
                    End If
                Else
                    mBox Me, cMT("Cannot generate a COM file. Remove the stack segment.")
                    frmInfo.addStatus cMT("executable file is not created!")
                    bIfSucessLoadInEmulator = False ' #1157b - DO NOT LOAD!
                End If
                
            ElseIf Combo_output_type.ListIndex = 2 Then  ' .BIN
                        
                If build_BIN_BOOT(bIfSucessLoadInEmulator, "bin", bACTIVATE_EMULATOR_WINDOW_AFTER_LOAD) Then
                    frmInfo.addStatus """" & ExtractFileName(sDEBUGED_file) & """ " & cMT("is assembled successfully into") & " " & make_it_american(FileLen(sDEBUGED_file)) & " bytes."
                Else
                    frmInfo.addStatus cMT("executable file is not created!")
                End If
                
            ' 1.11
            ElseIf Combo_output_type.ListIndex = 3 Then  ' .BOOT
            
                If Not bORG_7C00h_executed Then
                    If MsgBox(cMT("line ""org 7c00h"" - not found in the begining of the file!") & vbNewLine & _
                                cMT("generally a boot sector is loaded") & " " & _
                                cMT("at address 0000:7c00h.") & vbNewLine & _
                                "continue anyway?", vbYesNo + vbDefaultButton2, "org 7c00h") = vbNo Then
                                
                            frmInfo.addStatus "boot record file not built, aborted - ""org 7c00h"" not found!"
                            

                           ' b_DONOT_frmOrigCode_ACTIVATE = False ' must reset
    
                            Exit Sub
                    Else
                           ' 1.22 #188
                           add_val_to_all_ByteFirst_ByteLast &H7C00
                    End If
                End If
                
                '#1170b If build_BIN_BOOT(bIfSucessLoadInEmulator, "boot", bACTIVE_EMULATOR_WINDOW_AFTER_LOAD) Then
                ' making it .bin for boot files too!
                If build_BIN_BOOT(bIfSucessLoadInEmulator, "bin", bACTIVATE_EMULATOR_WINDOW_AFTER_LOAD) Then
                    frmInfo.addStatus """" & ExtractFileName(sDEBUGED_file) & """ " & cMT("is assembled successfully into") & " " & make_it_american(FileLen(sDEBUGED_file)) & " bytes."
                Else
                    frmInfo.addStatus cMT("executable file is not created!")
                End If
                    
            End If
            ' END OF SELECT FILE TYPE!
            
            
            
            ' 1.04
            If sDEBUGED_file <> "" Then
            
                ' #327xm-listing#
'                If LCase(get_property("emu8086.ini", "LISTING", "true")) = "true" Then
                    SaveDebugInfoFile_AND_LISTING sDEBUGED_file, True
'                Else
'                    SaveDebugInfoFile_AND_LISTING sDEBUGED_file, False
'                End If
                
                save_SYMBOL_TABLE_to_FILE sDEBUGED_file, False
            End If
            
            
            ' 1.29 it is done now only after saving debug files,
            ' it bacame important for ".symbol" file, ".debug"
            ' file is not required since it's not loaded just
            ' after compilation:
            If bIfSucessLoadInEmulator Then
                                                 
                If sDEBUGED_file <> "" Then '#1157b  additional check!
                
                    If bACTIVATE_EMULATOR_WINDOW_AFTER_LOAD Then ' #1135
                        frmInfo.Hide
                        frmEmulation.DoShowMe
                    Else
                       ' no need, it's already loaded in Sub Main()' Load frmEmulation
                    End If
                    
                    bAlwaysNAG = False
                    frmEmulation.loadFILEtoEMULATE sDEBUGED_file, True, bACTIVATE_EMULATOR_WINDOW_AFTER_LOAD
                    
                End If
                
            End If
            
            
            
            ' 1.29#395
            If Len(sLAST_COMPILED_FILE) > 0 Then
                'frmInfo.cmdBrowseMyBuild.Enabled = True
                'frmInfo.cmdEmulate.Enabled = True
                'frmInfo.cmdExternal.Enabled = True
                frmInfo.mnuExternalRun.Enabled = True
                frmInfo.mnuDebugEXE.Enabled = True
                'frmInfo.mnuShowListing.Enabled = True
                'frmInfo.mnuShowSymbolTable.Enabled = True
            End If
            
    Else
            frmInfo.addStatus "there are errors!" ' 4.00b15 ' "file not built, there are errors! / wrong output type!"
            
            frmInfo.show_EMPTY_progress_bar
            
            ' 1.22 select first error:
           ' frmInfo.click_on_error_message 0
    End If
    
    
    
    frmInfo.show_EMPTY_progress_bar  ' 3.27xm .... better... cause no auto redraw
    
    
    
    bASSEMBLER_STOPED = True ' #400b8-fast-examples-check# ' jic?
    
    iRADIX = 0  ' jic. #400b9-radix#
    
   ' b_DONOT_frmOrigCode_ACTIVATE = False ' must reset
    
    
' 1.28#361 moved above
'''    ' 1.23
'''    ' now it is important because this
'''    ' enables righ-click menus on frmInfo!
'''    bCOMPILING = False
    
    Exit Sub
    
' 1.20
stop_compile:
    frmInfo.stop_precompile_animation
    frmInfo.showErrorBuffer

    ' select first error:
   ' frmInfo.click_on_error_message 0


    ' 1.23
    ' now it is important because this
    ' enables righ-click menus on frmInfo!
    bCOMPILING = False
    
    frmInfo.show_EMPTY_progress_bar
    
    
    iRADIX = 0  ' jic. #400b9-radix#
    
    
   ' b_DONOT_frmOrigCode_ACTIVATE = False ' must reset
    
    Exit Sub
    
error_on_compile:
    
   ' b_DONOT_frmOrigCode_ACTIVATE = False ' must reset

    
    ' #327xo-access-denied-anti-vir#
    Dim sERRRR As String
    sERRRR = Err.Description
    If Err.number = 53 Or Len(sERRRR) = 0 Then  ' file not found
            frmInfo.addErr -1, cMT("access denied."), ""
    Else
            frmInfo.addErr -1, "assembler error: " & LCase(sERRRR), ""
    End If
    
   
    ' 4.00-Beta-9   here from above get err description!!!
    frmInfo.stop_precompile_animation
    
    
    

    frmInfo.showErrorBuffer
    
    ' select first error:
   ' frmInfo.click_on_error_message 0
    
    frmInfo.show_EMPTY_progress_bar
    
    ' 1.23
    ' now it is important because this
    ' enables righ-click menus on frmInfo!
    bCOMPILING = False
    
    
    
    bASSEMBLER_STOPED = True ' #400b8-fast-examples-check# ' jic?
    
    iRADIX = 0  ' jic. #400b9-radix#
End Sub

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++

' 1.23#217
' new compare function is used!
'''' compare lst_Temp_ST with lst_Symbol_Table
'''Private Function lists_EQUAL() As Boolean
'''
'''    Dim i As Integer
'''
'''    For i = 0 To lst_Symbol_Table.ListCount
'''        If StrComp(lst_Temp_ST.List(i), lst_Symbol_Table.List(i), vbTextCompare) <> 0 Then
'''            lists_EQUAL = False
'''            Exit Function
'''        End If
'''    Next i
'''
'''    lists_EQUAL = True
'''
'''End Function

' 1.23#217
' new sub is used instead!
'''' copy lst_Temp_ST to lst_Symbol_Table
'''Private Sub copy_LIST()
'''
'''    Dim i As Integer
'''
'''    lst_Symbol_Table.Clear
'''
'''    For i = 0 To lst_Temp_ST.ListCount
'''        lst_Symbol_Table.AddItem lst_Temp_ST.List(i), i
'''    Next i
'''
'''End Sub


'++++++++++++++++++++++++++++++++++++++++++++++++++++++++

' this function builds EQU Table
Public Sub build_EQU_Table()

    Dim sName As String
    Dim s As String
    Dim sType As String ' used in proc.
    
    lst_EQU.Clear

    ' 1.20 don't use global currentLINE
    Dim lCurLine As Long

    lCurLine = 0


    Dim sTOKEN1 As String ' #327q2d# ' oops, it wasn't requred... we need token 0, but anyway, I'll keep this.
    

    Do While (lCurLine < lst_Source.ListCount)
    
        s = lst_Source.List(lCurLine)
       
       '#1191trim - DONE ALREADY IN set_LISTS() '  s = myTrim_RepTab(s)

        s = replace_EQUAL_with_EQU(s) ' #1035b

        sTOKEN1 = UCase(getToken_str(s, 1, " ")) ' #327q2d#
        
        
        
        ' #327q2d# ' If (UCase(getToken_str(s, 1, " ")) = "EQU") Then
        If (sTOKEN1 = "EQU") Then
        
        
            Dim sEQU_LINE_REPLACER As String
            sEQU_LINE_REPLACER = "" ' usually this line is not used any longer.
        
            ''' making a myracle! ' #1035
            '' I think if we replace the line with "$" with some specific label, it may work!
            If InStr(1, s, "$", vbBinaryCompare) > 0 Then
                Dim lT1 As Long
                Dim lT2 As Long
                Dim lt3 As Long
                
                lT1 = InStr(1, s, "$", vbBinaryCompare) ' it's over 0 (already checked).
                ' let's see if it's in some kind of string:
                lT2 = InStr(1, s, "'", vbBinaryCompare)
                lt3 = InStr(1, s, """", vbBinaryCompare)
                
                If (lT2 > 0 And lT2 < lT1) Or (lt3 > 0 And lt3 < lT1) Then
                    ' "$" is inside the string, or so it seems, it's not a location counter!
                Else
                    
                    ' #400b3-remove-iTML_LBL#
                    ''''                    ' replace it with label!
                    ''''                    Dim iTML_LBL As Integer
                    ''''                    iTML_LBL = generateRandom(7, 30007) ' random. not ideal but should be enough for a couple of loc. counters in code.

                    ' #1175 now it is ideal, 1 to 2147483640 plus 30000 :)
                    ' must use hexes to avoid problems with negative numbers!!!
                    lTO_AVOID_ANY_DUPLICATION = lTO_AVOID_ANY_DUPLICATION + 1
                    sEQU_LINE_REPLACER = sPREFIX_FOR_LOC_COUNTER_REPLACER & "_N" & Hex(lTO_AVOID_ANY_DUPLICATION) & "_L" & Hex(lCurLine)  '  #400b3-remove-iTML_LBL# ' Hex(iTML_LBL)
                    ' #1175
                    If lTO_AVOID_ANY_DUPLICATION > 2147483640 Then lTO_AVOID_ANY_DUPLICATION = -2147483640    ' add another 2 million :)
                    
                    
                    
                    s = Replace(s, "$", sEQU_LINE_REPLACER, 1, 1, vbBinaryCompare) ' REPLACE THE FIRST AND ONLY ONE ONLY!! (currently I will have this limit only).
                    sEQU_LINE_REPLACER = sEQU_LINE_REPLACER & ": " ' make it a label.
                    
                End If
            End If
            ''''''''''''''''''''''''''''''''''''''''''''
        
        
            process_EQU s, lCurLine
            
            lst_Source.List(lCurLine) = sEQU_LINE_REPLACER ' can be "" or label (can be used for location counter calculations).
            

        ElseIf UCase(s) = "END" Or startsWith(s, "END ") Then   ' #327q2d# ' - no need to process below end directive!
        
            lCurLine = lCurLine + 1 ' jic..
            Exit Sub
            
            
        End If

        lCurLine = lCurLine + 1

    Loop

End Sub



'++++++++++++++++++++++++++++++++++++++++++++++++++++++++

' this function builds the fist Symbol Table
Public Sub build_primary_SymbolTable()

    Dim sName As String
    Dim s As String
    Dim sType As String ' used in proc.
    
    ' 1.23#217 lst_Symbol_Table.Clear
    CLEAR_primary_symbol_TABLE
    
    ' 1.21 bugfix#162 check for redifinition!!!

    currentLINE = 0

    Do While (currentLINE < lst_Precompiled.ListCount)
    
        s = lst_Precompiled.List(currentLINE)
       
        '#1191trim - DONE ALREADY IN set_LISTS() '  s = myTrim_RepTab(s)
        
' #327xq-equ-bug#
more_on_that_line:


        ' no name, no record in table.
        
        If starts_with_LABEL_or_SEG_PREFIX(s) Then
            
            Dim lK As Long
            lK = InStr(1, s, ":")
            
            sName = Mid(s, 1, lK - 1) ' 3.27xq ' getNewToken(s, 0, ":") ' get name before ":"
                       
            sName = Trim(UCase(sName))
            

            
            ' segment prefixes are not labels!!!!  ' 3.27xq opt
             If (sName <> "DS") Then
                If (sName <> "CS") Then
                  If (sName <> "ES") Then
                    If (sName <> "SS") Then
                    
                        If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration
                        add_to_Primary_Symbol_Table sName, 0, -1, "LABEL", sCurSegName
                          
                    End If
                  End If
                End If
             End If
            
            
            ' #327xq-equ-bug#  (same as CompileTheSource)
            If Right(s, 1) <> ":" Then ' ":" is not the last char?
                s = Trim(Mid(s, InStr(1, s, ":") + 1)) ' remove the label.
                GoTo more_on_that_line
            End If
            
            GoTo next_please  ' #400b3-general-optimiz#
            
        End If  '#400b3-general-optimiz# '  END OF starts_with_LABEL_or_SEG_PREFIX(s)
                   
                   
                   
                   
        '#400b3-general-optimiz#
                   
                   
        ' + 3.27xq optimization
        Dim sTOKEN1 As String  ' index 0
        Dim sTOKEN2 As String  ' index 1
        Dim sTOKEN3 As String  ' index 2  ' #400b3-impdup2#
        
        If InStr(1, s, "DB ", vbTextCompare) > 0 Or _
           InStr(1, s, "DW ", vbTextCompare) > 0 Or _
           InStr(1, s, "DD ", vbTextCompare) > 0 Or _
           InStr(1, s, "PROC", vbTextCompare) > 0 Or _
           InStr(1, s, "SEGMENT", vbTextCompare) > 0 Or _
           InStr(1, s, "DUP ", vbTextCompare) > 0 Or _
           InStr(1, s, "DUP(", vbTextCompare) > 0 _
           Then
                    sTOKEN1 = UCase(getToken_str(s, 0, " "))
                    sTOKEN2 = UCase(getToken_str(s, 1, " "))
                    sTOKEN3 = UCase(getToken_str(s, 2, " "))  ' for incorrect dup: lion 32 dup (1,2,3,4,5,6,7,8)
           Else
                    GoTo next_please
        End If
        
                   
                   
                    
                    
        If (sTOKEN2 = "DB") Then
            sName = sTOKEN1
            If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration
            add_to_Primary_Symbol_Table sName, 0, 1, "VAR", sCurSegName
            
        ' no name, no record in table.
        ElseIf (sTOKEN2 = "DW") Then
            sName = sTOKEN1
            If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration
            add_to_Primary_Symbol_Table sName, 0, 2, "VAR", sCurSegName
            
            
        ' v3.27p
        ' no name, no record in table.
        ElseIf (sTOKEN2 = "DD") Then
            sName = sTOKEN1
            If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration
            add_to_Primary_Symbol_Table sName, 0, 2, "VAR", sCurSegName
                       
            
        ElseIf contains_PROC(s) Then
            sName = sTOKEN1 ' get name (it's the first token)
            
            ' #327u-proc# - fool proof solution
            If sName = "PROC" Then  ' #400b18-bug-fasm147# REDUNDANT UCASE REMOVED 4.00B18
                sName = getNewToken(s, 1, " ") ' get second token, probably user put proc name after the proc.
                sName = UCase(sName) ' #400b18-bug-fasm147# REQUIRED CAUSE WE REMOVED UCASE FROM add_to_Primary_Symbol_Table()
            End If
            
            
            ' #327u-proc# If InStr(1, s, " FAR", vbTextCompare) > 0 Then
            If endsWith(s, " FAR") Then ' #327u-proc#  - to avoid any problems...
                sType = "FAR"
            Else
                sType = "NEAR"  ' default.
            End If
            If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration
            add_to_Primary_Symbol_Table sName, 0, -1, sType, sCurSegName
            
'''  moved to build_EQU_Table()
'''        ElseIf (sTOKEN2 = "EQU") Then
'''            process_EQU s

       ' #400b3-general-optimiz# ElseIf contains_SEGMENT(s) Then
       ElseIf sTOKEN1 = "SEGMENT" Or sTOKEN2 = "SEGMENT" Then
            sName = sTOKEN1 ' get name (it's the first token)
            
            ' #327xd-duplicate-segment#
            ' Debug.Print "327xd-duplicate-segment: pst: " & sName
            If UCase(sName) = "SEGMENT" Then
                ' #327xn-segment#  probably label is the second
                sName = getNewToken(s, 1, " ")
                If Len(sName) = 0 Then
                    ' first token is segment directive itselft, it means that we have no segment name.
                    sName = "UNNAMED_SEGMENT_" & CStr(lUNNAMED_SEGMENT_COUNTER)
                    lUNNAMED_SEGMENT_COUNTER = lUNNAMED_SEGMENT_COUNTER + 1
                End If
            End If
            
            
            ' #400b18-bug-fasm147#
            ' CAUSE WE REMOVED UCASE FROM add_to_Primary_Symbol_Table()
            sName = UCase(sName)
            
            If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration ' 1.21 bugfix#162
            ' 1.23#217 lst_Symbol_Table.AddItem sName & " 0 -5 SEGMENT (ITSELF)"
            add_to_Primary_Symbol_Table sName, 0, -5, "SEGMENT", "(ITSELF)"

            
            ' #1050e --- I forgot to update sCurSegName ... didn't i?
            sCurSegName = sName ' v3.27xd optimization ' getNewToken(s, 0, " ") ' get name (it's the first token) ' #1050e fixed

        
        ElseIf sTOKEN3 = "DUP" Then ' #400b3-impdup2#
this_is_dup_too:
            sName = sTOKEN1
            If get_var_size(sName) <> 0 Then GoTo error_duplicate_declaration
            
            ' #400b5-big-bug#
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
                 add_to_Primary_Symbol_Table sName, 0, 1, "VAR", sCurSegName
            End If
            
       ElseIf Left(sTOKEN3, 4) = "DUP(" Then ' #400b5-big-bug#
            GoTo this_is_dup_too
            
           

        End If
        
        
next_please:  ' #400b3-general-optimiz#

        
        currentLINE = currentLINE + 1

    Loop

    ' 1.21 bugfix#162
    Exit Sub
error_duplicate_declaration:
    frmInfo.addErr currentLINE, cMT("duplicate declaration of:") & " " & sName, sName
    frmInfo.showErrorBuffer
End Sub


'
'Private Sub mnuDisplayWhitespace_Click()
'    If mnuDisplayWhitespace.Checked Then
'        txtInput.ExecuteCmd cmCmdWhitespaceDisplayOff
'        mnuDisplayWhitespace.Checked = False
'    Else
'        txtInput.ExecuteCmd cmCmdWhitespaceDisplayOn
'        mnuDisplayWhitespace.Checked = True
'    End If
'End Sub

Private Sub mnuEmulator_Click()

    frmEmulation.DoShowMe

End Sub

'  1.21#166   no more popUps
'''Private Sub cmdEmulate_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'''    If Button = vbRightButton Then
'''        PopupMenu popEmulator
'''    End If
'''End Sub


Private Function AskToSaveChanges() As Integer
On Error Resume Next ' 4.00-Beta-3
    Dim iRes As Integer
    iRes = MsgBox(cMT("save changes to file ?") & vbNewLine & " " & sOpenedFile & " ", _
                        vbYesNoCancel, cMT("save changes?"))
    AskToSaveChanges = iRes
End Function

Public Sub cmdLoad_Click_PUBLIC()
On Error Resume Next ' 4.00-Beta-3
    cmdLoad_Click
End Sub

Private Sub cmdLoad_Click()
On Error Resume Next ' 4.00-Beta-3
    openSourceFile "", False, False
End Sub

' 1.22
' 4.00 -- IF NOT SURE:  bFORCE_TO_EDIT=FALSE,  bEXAMPLES=FALSE
Public Sub openSourceFile(ByRef sFilename As String, bFORCE_TO_EDIT As Boolean, bEXAMPLES As Boolean)

On Error GoTo error_loading

  If bIsModified Then
    Select Case AskToSaveChanges()
    Case vbYes
        If Not saveSourceFile(sOpenedFile) Then
            Exit Sub
            ' Cancel opening, and exit current sub,
            ' in case of saving trouble.
        End If
        ' open another file after successful saving.
    Case vbNo
        ' open without saving anything.
    Case vbCancel
        bSAVE_CANCELED = True
        Exit Sub
        ' cancel opening, exit current sub.
    End Select
  End If


        Dim sResult As String
        
        
'If bEXAMPLES Then ' 4.00
'
'        If sFilename = "" Then
'        ' 20140414 todo1
''            Dim sEXAMPLES_PATH As String
''            sEXAMPLES_PATH = Add_BackSlash(App.Path) & "examples" ' 4.00 !!! YES!
''            ComDlg.hwndOwner = Me.hwnd
''            ComDlg.FileNameD = ""
''            If myChDir(sEXAMPLES_PATH) Then
''                ComDlg.FileInitialDirD = sEXAMPLES_PATH
''            End If
''            ComDlg.Flags = OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT + OFN_PATHMUSTEXIST
''            ComDlg.Filter = sALL_KNOWN_FILE_TYPES
''            sResult = ComDlg.ShowOpen
''           ' NO! 4.00 ' sCURRENT_SOURCE_FOLDER = ExtractFilePath(sResult)
'
'
'            ' 20140414
'            sResult = InputBox("enter file path", "open", Add_BackSlash(App.Path) & "MySource\0000.asm")
'
'        Else
'            sResult = sFilename
'        End If
'Else
'
        If sFilename = "" Then      ' 1.22
        
        '201401414 todo2
'            ComDlg.hwndOwner = Me.hwnd
'            ComDlg.FileNameD = ""
'            ' 4.00
'            If Trim(sCURRENT_SOURCE_FOLDER) = "" Then
'                sCURRENT_SOURCE_FOLDER = Add_BackSlash(App.Path) & "MySource" ' 4.00 !!! YES!
'            End If
'            If myChDir(sCURRENT_SOURCE_FOLDER) Then
'                ComDlg.FileInitialDirD = sCURRENT_SOURCE_FOLDER
'            Else
'                ComDlg.FileInitialDirD = Add_BackSlash(App.Path) & "examples"  ' 4.00 !!! if not exists yet.
'            End If
'            ComDlg.Flags = OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT + OFN_PATHMUSTEXIST
'            ComDlg.Filter = sALL_KNOWN_FILE_TYPES
'            sResult = ComDlg.ShowOpen
'
'            If InStr(1, sResult, Add_BackSlash(App.Path) & "examples", vbTextCompare) > 0 Then
'                Debug.Print "(unchanged/examples) sCURRENT_SOURCE_FOLDER:" & sCURRENT_SOURCE_FOLDER
'            Else
'                sCURRENT_SOURCE_FOLDER = ExtractFilePath(sResult)
'            End If

            ' 20140415
            sResult = InputBox("enter file path", "open", Add_BackSlash(App.Path) & "output\0000.asm")
            

        Else
        
            sResult = sFilename
        
        End If
        
'End If
        
        
        
        If sResult <> "" Then
 
            
            ' 2.52#719
            ' ==========================================
            Dim sExt As String
            Dim lx As Long
            lx = InStrRev(sResult, ".")
            If lx > 0 Then
                sExt = UCase(Right(sResult, Len(sResult) - lx + 1))
            End If
            
            Select Case sExt
            
            Case ".ASM" ' #1168 puting them to emu8086.ini ', ".TXT", ".DOC", ".HTM", ".HTML", ".LOG", ".SYMBOL", ".INC"
                ' ok... continue with load.
                ' frmMain.openSourceFile CmdLine
                
            Case ".EXE", ".BIN", ".BOOT", ".COM", ".EXE_", ".BIN_", ".COM_"  ' #327xo-av-protect#
                bAlwaysNAG = True
                frmEmulation.DoShowMe
                frmEmulation.loadFILEtoEMULATE sResult
                Exit Sub
                
            Case Else
            
            
               If InStr(1, ASCII_EXTENTIONS, sExt, vbTextCompare) > 0 Then GoTo FORCE_TO_EDIT  '#1168
            
            
            
                If bFORCE_TO_EDIT Then GoTo FORCE_TO_EDIT
            
                
            
            
            
'#1168  - load all unknown extensions to emulator!
            
''''''                Dim rUserR As Integer
''''''
''''''                rUserR = MsgBox(cMT("Unknown extension:") & " " & sExt & vbNewLine & _
''''''                                cMT("Click 'Yes' to load in Source Editor, or 'No' to load in emulator"), vbYesNoCancel, "File type?")
''''''
''''''                If rUserR = vbYes Then
''''''                    ' ok... continue with load.
''''''                    ' frmMain.openSourceFile CmdLine
''''''                ElseIf rUserR = vbNo Then
                    frmEmulation.DoShowMe
                    bAlwaysNAG = True
                    frmEmulation.loadFILEtoEMULATE sResult
                    Exit Sub
'''''''                Else
'''''''                    Debug.Print "Canceled!"
'''''''                    Exit Sub
'''''''                End If
            
            
            
            
            End Select
            ' ==========================================
            
FORCE_TO_EDIT: ' 2005-03-01 ' 2005-03-01_INC_EXTENTION_OPEN_IN_EDITOR_FIXED.txt
 
 
            txtInput.Text = "" ' 1.21 # 158
                        
            frameLoading.Visible = True ' 1.20
            DoEvents
            
            loadIn_txtInput sResult
            
            frameLoading.Visible = False ' 1.20
            
            ' 1.21
            ' 1.23 reset_Undo_Redo
            
            
            'Recent_Add_New sResult, mnuRecent, sRECENT_EDITOR

            
        Else
            Debug.Print "Load Canceled, or no file name..."
        End If
        
        
        
        
' #327xo-allow-change# '
'''''''
'''''''    ' 2.52#715
'''''''
'''''''    If startsWith(sOpenedFile, Add_BackSlash(App.Path) & "examples") Then
'''''''
'''''''       Dim lFileLen As Long
'''''''       lFileLen = FileLen(sOpenedFile)
'''''''       ' The length of that file should be one of the following
'''''''       ' values. I'm using some free app (FileLength_Recorder) to get all file lengths.
'''''''       If InStr(1, sFile_examples_BYTE_SIZES, "-" & CStr(lFileLen) & "-") Then ' #1127 / #1127b updated! #1132
'''''''            ' When sOpenedFile="" and ***no changes**** there are no nags!
'''''''            ' this also prevents direct saving over original examples!
'''''''             sOpenedFile = ""
'''''''       End If
'''''''
'''''''    End If
'''''''    ' before 3.25c        739-677-118-447-971-245-719-713-431-1201-1535-1344-3580-837-860-1064-583-1911-894-1324-1135-12061-903-281-1863-2341-1139-1071-1253-923-5526-2425-1498-581-1170-1641-2112-546-767-2672-728-748-3843-845-5646-3702-980-972-629-1188-644-6320-400-5717-635-739-280-118-517-1062-996-814-823-505-1343-1886-1500-3580-919-944-1161-583-1911-963-1497-1285-12668-1089-281-1863-1554-1365-1260-1491-1022-6196-2775-1720-629-1353-1890-2435-699-767-2923-808-841-4588-1021-6445-3820-1132-1284-755-1188-739-6985-505-6051-
'''''''    ' old:                247-245-118-447-971-677-719-713-431-1201-1535-1344-837-860-1064-894-1324-1135-12061-903-1339-1139-1071-1253-923-5526-2379-1498-581-1170-1641-2112-546-767-2672-728-748-3843-845-5646-3702-980-972-629-644-6320-400-5717-6133-
'''''''    ' 2005-03-01 ENGLISH: 739-677-118-447-971-245-719-713-431-1201-1535-1344-3580-837-860-1064-583-1911-894-1324-1135-12061-903-281-1863-2341-1139-1071-1253-923-5526-2425-1498-581-1170-1641-2112-546-767-2672-728-748-3843-845-5646-3702-980-972-629-1188-644-6320-400-5717-
'''''''    ' 2005-03-01 FRENCH:  635-739-280-118-517-1062-996-814-823-505-1343-1886-1500-3580-919-944-1161-583-1911-963-1497-1285-12668-1089-281-1863-1554-1365-1260-1491-1022-6196-2775-1720-629-1353-1890-2435-699-767-2923-808-841-4588-1021-6445-3820-1132-1284-755-1188-739-6985-505-6051-
'''''''
'''''''
'''''''
    
    

    
    
        Exit Sub
error_loading:

        mBox Me, LCase(Err.Description) & vbNewLine & sFilename

End Sub

Private Sub loadIn_txtInput(sFilename As String)
On Error GoTo err_load_txtInput
    '--------------------------------
    ' 20140414 reenabled 001
    ' 2.09#571
    Dim fNum As Integer
    ' 2.09#571
    Dim s As String
    ' 1.12, to improve loading time:
    ' 1.25#288 Dim bDefaultOutputTypeSet As Boolean
    
    ' 1.25#288 bDefaultOutputTypeSet = False
    
' 20140414 reenabled 002
    ' 2.09#571
    fNum = FreeFile
    ' 2.09#571
    Open sFilename For Input As fNum
                
    ' 1.12, set default, for COM:
    Combo_output_type.ListIndex = 0
    
    txtInput.Text = ""
    
    
' 2.09#571

' 20140414 reenabled 003
    Do While Not EOF(fNum)
        Line Input #fNum, s
        txtInput.Text = txtInput.Text & _
                         s & vbNewLine
    Loop

    '20140414 disabled 000 ' txtInput.OpenFile sFilename ' 2.09#571

    sOpenedFile = sFilename
    bIsModified = False
    Me.Caption = cMT("edit:") & " " & sFilename ' & " - " & sDefaultCaption

    ' Close:
    ' 2.09#571   Close fNum
    
    ' 20140415
    Close fNum
    
    '--------------------------------
    
    Exit Sub
err_load_txtInput:
    ' 1.23 Debug.Print "Error on loadIn_txtInput(" & sFileName & ") - " & LCase(err.Description)
    
    
    ' 1.23
    mBox Me, LCase(Err.Description) & vbNewLine & sFilename
    sOpenedFile = ""
    bIsModified = False
    Me.Caption = sDefaultCaption
End Sub

Public Sub create_NEW_source(iTEMPLATE_NUM As Integer, bUSE_FASM As Boolean)

On Error GoTo err_cnc

    If bIsModified Then
      Select Case AskToSaveChanges()
      Case vbYes
        If Not saveSourceFile(sOpenedFile) Then
            Exit Sub
            ' Cancel creating new, and exit current sub,
            ' in case of saving trouble.
        End If
          ' create new file after sucessful saving.
      Case vbNo
          ' create new without saving anything.
      Case vbCancel
          bSAVE_CANCELED = True
          Exit Sub
          ' cancel creating new.
      End Select
    End If
  
    sOpenedFile = "" ' Add_BackSlash(App.Path) & "new.asm"
    
    ' Me.Caption = ExtractFileName(sOpenedFile) & " - " & sDefaultCaption
    Me.Caption = sDefaultCaption
    
    
    ' to prevent asking on second call
    ' to this procedure from frmChooseTemplate:
    bIsModified = False
    
    
    
    
    txtInput.Text = ""
   
   
   
   
   
   
   
'    ' #400b18-fasm-templates#
'    Dim sFASM As String
'    If bUSE_FASM Then
'        sFASM = "fasm_"
'    Else
'        sFASM = ""
'    End If
   
    
'    Select Case iTEMPLATE_NUM
'    Case 0 ' com
'        txtInput.OpenFile Add_BackSlash(App.Path) & "inc\" & sFASM & "0_com_template.txt"
'    Case 1 ' exe
'        txtInput.OpenFile Add_BackSlash(App.Path) & "inc\" & sFASM & "1_exe_template.txt"
'    Case 2 ' bin
'        txtInput.OpenFile Add_BackSlash(App.Path) & "inc\" & sFASM & "2_bin_template.txt"
'    Case 3 ' boot
'        txtInput.OpenFile Add_BackSlash(App.Path) & "inc\" & sFASM & "3_boot_template.txt"
'    Case 4 ' empty!
'        If bUSE_FASM Then
'            txtInput.Text = "#fasm#" & vbNewLine & vbNewLine
'        Else
            
            
            
            
'            txtInput.Text = ""




'        End If
'    Case 5 ' show emulator
'
'        '#1151
'''''         not good... it gives this error:
'''''         Can 't show non-modal form when modal form is displayed
'         mnuEmulator_Click
'         If frmEmulation.sOpenedExecutable <> "" Then
'            frmEmulation.mnuResetEmulator_and_RAM_Click_PUBLIC
'         End If
'         frmEmulation.bTERMINATED = False ' don't ask to reload.
'
'
'    Case -1  ' show dialog:
'        frmChooseTemplate.Show vbModal, Me   ' I hope it won't be recursive!
'        Exit Sub
'
'    Case Else
'        Debug.Print "wrong parameter for create_NEW_source: " & iTEMPLATE_NUM
'
'    End Select

    
    
    
    
    bIsModified = False
    sOpenedFile = ""



'    ' search for "; add your code here" and select this line!
'    ' if not found, select the last line:
'
'    If txtInput.lineCount > 0 Then
'
'        Dim i As Long
'        For i = 0 To txtInput.lineCount
'            If InStr(1, txtInput.getLine(i), "; add your code here", vbTextCompare) > 0 Then
'                txtInput.SelectLine i, True
'                GoTo code_entry_found
'            End If
'        Next i
'
'        ' gets here only if "; add your code here" not found:
'        txtInput.SelectLine txtInput.lineCount - 1, True
'
'code_entry_found:
'
'    End If



    
    Exit Sub
err_cnc:
    mBox frmMain, "Error loading template: " & LCase(Err.Description) & vbNewLine & cMT("please re-install the software.")
    
End Sub





'  1.21#166
''''Private Sub cmdNew_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
''''    If Button = vbRightButton Then
''''        PopupMenu popNew
''''    End If
''''End Sub
''''
''''
''''Private Sub cmdSave_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
''''    If Button = vbRightButton Then
''''        PopupMenu popSave
''''    End If
''''End Sub


Private Sub mnuEvaluator_Click()
On Error Resume Next ' 4.00-Beta-3
    frmEvaluator.DoShowMe
End Sub

Private Sub mnuExit_Click()
On Error Resume Next ' 4.00-Beta-3
    Unload Me
End Sub

'Private Sub mnuFindNext_Click()
'On Error Resume Next ' 4.00-Beta-3
'    ' to make sure it will work on popup menu:
'    execute_CMD_after_DELAY delayed_CMD_FIND_NEXT
'End Sub

'Private Sub mnuFirstBookmark_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdBookmarkJumpToFirst
'End Sub

'Private Sub mnuGotoLine_Click()
'On Error GoTo err_goto_line
'
'    txtInput.SetFocus
'
'    txtInput.ExecuteCmd cmCmdGotoLine, -1
'
'    Exit Sub
'err_goto_line:
'    Debug.Print "EmnuGotoLine_Click: " & LCase(Err.Description)
'End Sub

' 1.19
Private Sub mnuHelpTopics_Click()
On Error Resume Next ' 4.00-Beta-3
 ' open_HTML_FILE Me, "index.html"

 
End Sub

'Private Sub mnuIndent_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdIndentSelection
'End Sub
'
'Private Sub mnuLastBookmark_Click()
'On Error Resume Next ' 4.00-Beta-3
'     txtInput.ExecuteCmd cmCmdBookmarkJumpToLast
'End Sub

Private Sub mnuLoad_Click()
On Error Resume Next ' 4.00-Beta-3
    cmdLoad_Click
End Sub

'Private Sub mnuNextBookmark_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdBookmarkNext
'End Sub

'Private Sub mnuOutdent_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdUnindentSelection
'End Sub
'
'Private Sub mnuPrevBookmark_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdBookmarkPrev
'End Sub

' 2.12#614 fix
Public Sub mnuRecent_CLICK_from_NICE_STARTUP(Index As Integer)
On Error Resume Next ' 4.00-Beta-3
    mnuRecent_Click Index
End Sub

Private Sub mnuRecent_Click(Index As Integer)
On Error Resume Next ' 4.00-Beta-3
    openSourceFile mnuRecent(Index).Tag, False, False
End Sub

'Private Sub mnuReplace_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdFindReplace
'End Sub

Private Sub mnuSave_Click()
On Error Resume Next ' 4.00-Beta-3
    saveSourceFile sOpenedFile
End Sub

Private Sub mnuSaveAs_Click()
On Error Resume Next ' 4.00-Beta-3
    saveSourceFile ""
End Sub

Private Sub cmdSave_Click()
On Error Resume Next ' 4.00-Beta-3
    saveSourceFile sOpenedFile
End Sub

' saves to given filename, if not given
'  asks where to save:
' returns "true" when saved, otherwise "false".
Private Function saveSourceFile(sFilename As String) As Boolean

On Error GoTo error_saving

    Dim fNum As Integer
    Dim ts As String    ' 1.23#268b
    
    
    ' 4.00
    ts = ExtractFilePath(sOpenedFile)
    
' 20140414 saving to mysource\0000.asm
    
'
    If sFilename = "" Then        ' save as...
'            If sOpenedFile <> "" Then
'
'                ' 4.00
'                If InStr(1, ts, Add_BackSlash(App.Path) & "examples", vbTextCompare) > 0 Then
                    ts = Add_BackSlash(App.Path) & "output"
                    myMKDIR ts
'                End If
'
'                If myChDir(ts) Then
'                    ComDlg.FileInitialDirD = ts
'                End If
'                ComDlg.FileNameD = Add_BackSlash(ts) & ExtractFileName(sOpenedFile)     ' 4.00 sOpenedFile
'            Else
'                ts = Add_BackSlash(App.Path) & "MySource"
'                myMKDIR ts
'                If myChDir(ts) Then
'                    ComDlg.FileInitialDirD = ts  '1.23#268b App.Path
'                End If
'                ComDlg.FileNameD = "mycode.asm" ' 3.27xp
'            End If
'
'            ComDlg.hwndOwner = Me.hwnd
'            ComDlg.Flags = OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT + OFN_PATHMUSTEXIST
'            ComDlg.Filter = "Assembly (*.asm)|*.asm|All Files (*.*)|*.*"
'            ComDlg.DefaultExtD = "asm"
'            sFilename = ComDlg.ShowSave
'    ElseIf InStr(1, ts, Add_BackSlash(App.Path) & "examples") > 0 Then
'            ' 4.00
'            ts = Add_BackSlash(App.Path) & "MySource"
'            myMKDIR ts
'            If myChDir(ts) Then
'                ComDlg.FileInitialDirD = ts
'            End If
'            ComDlg.FileNameD = Add_BackSlash(ts) & ExtractFileName(sFilename)     ' 4.00 sOpenedFile
'            ComDlg.hwndOwner = Me.hwnd
'            ComDlg.Flags = OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT + OFN_PATHMUSTEXIST
'            ComDlg.Filter = "Assembly (*.asm)|*.asm|All Files (*.*)|*.*"
'            ComDlg.DefaultExtD = "asm"
'            sFilename = ComDlg.ShowSave

             sFilename = InputBox("where to?", , Add_BackSlash(ts) & "0000.asm")
    End If
'


    

    
    
    
    ' sFileName should be something,
    ' unless dialog canceled.
    
    If sFilename <> "" Then
    
        ' delete the old file (if exists):
        If FileExists(sFilename) Then
            DELETE_FILE sFilename
        End If
    
        '--------------------------------
        fNum = FreeFile
        Open sFilename For Binary Shared As fNum

        Put #fNum, , txtInput.Text
        
        ' Close:
        Close fNum
        '--------------------------------
        
        '20140415
        mBox Me, "saved to " & sFilename
        
        
        bIsModified = False
        sOpenedFile = sFilename
        Me.Caption = "edit: " & sOpenedFile ' & " - " & sDefaultCaption
        
        saveSourceFile = True
        
        
        ' 1.22 #187
        'Recent_Add_New sFilename, mnuRecent, sRECENT_EDITOR
    Else
        Debug.Print "Save canceled."
        saveSourceFile = False
    End If
    
    ' #1057
    sCURRENT_SOURCE_FOLDER = ExtractFilePath(sFilename)
    
    
    Exit Function
error_saving:

    mBox Me, "error saving:" & " " & vbNewLine & LCase(Err.Description)
    saveSourceFile = False
    
End Function

'''Private Sub cmdOptions_Click()
'''On Error Resume Next ' 4.00-Beta-3
'''    b_frmOPTIONS_SHOWN_BY_EMULATOR = False
'''   ' #400b4-mini# - 12 ' frmOptions.Show vbModal, Me
'''   ' #400b4-mini# - 12 '
'''   frmOptions.Show , Me
'''End Sub


Private Sub Form_Load()
On Error GoTo err_loading


   If Load_from_Lang_File(Me) Then Exit Sub
    


    'GetWindowPos_CENTER_BY_DEFAULT Me  ' 30july2003
    'GetWindowSize Me ' 2.05#551
    
    sDefaultCaption = Me.Caption & " " & App.Major & "." & App.Minor & App.Revision & sVER_SFX

    sOpenedFile = "" 'Add_BackSlash(App.Path) & "no_name.asm"
    bIsModified = False
    Me.Caption = sDefaultCaption
    
    Combo_output_type.ListIndex = 0 ' default - "make COM".
    
    
    ' 1.22 #187
    'Recent_Set_Menus mnuRecent, sRECENT_EDITOR

       
    ' =============reset all default hot keys:
'''    Dim l As Long
'''    Dim HotKeys() As Byte
 ' 201401414 we use only standard controls for maximum compatiblity with all versions of windows from 95 to 8 '   Dim g As New codemaxctl.globals
'''    Call g.GetHotKeys(HotKeys)
'''    For l = LBound(HotKeys) To UBound(HotKeys)
'''        HotKeys(l) = 0
'''    Next l
'''    g.SetHotKeys HotKeys
'''
'''    ' set HotKey for Indent/Outdent (not supported
'''    ' over the menu, so set here):
'''    Dim hk As New HotKey
'''    hk.VirtKey1 = vbTab
'''    g.RegisterHotKey hk, cmCmdIndentSelection
'''    hk.VirtKey1 = vbTab
'''    hk.Modifiers1 = 1 ' HOTKEYF_SHIFT
'''    g.RegisterHotKey hk, cmCmdUnindentSelection
    ' ================================================
       
    ' instead of removing all shortcuts (since it removes
    ' even arrow keyboard keys...), I decided to remove
    ' real shortcuts from the menus, and add here a few
    ' if required:
    
  '  Dim hk As New HotKey

' EVERYTHING WORKS BUT NEED TO DELETE "OPTIONS" FOLDER
' IF YOU MAKE ANY CHANGES!!!!!


'''' #1027
''''    ' CTRL+A  Select All:
'
'    hk.VirtKey1 = "A"
'    hk.Modifiers1 = 2 ' HOTKEYF_CONTROL
'    g.RegisterHotKey hk, cmCmdSelectAll
'
'
'''  #1029
''' CTRL+H replace
'    hk.VirtKey1 = "H"
'    hk.Modifiers1 = 2 ' HOTKEYF_CONTROL
'    g.RegisterHotKey hk, cmCmdFindReplace
'
'
'''  #1029
''' CTRL+U uppercase
'    hk.VirtKey1 = "U"
'    hk.Modifiers1 = 2 ' HOTKEYF_CONTROL
'    g.RegisterHotKey hk, cmCmdUppercaseSelection
'
'''  #1029
''' CTRL+L lowercase
'    hk.VirtKey1 = "L"
'    hk.Modifiers1 = 2 ' HOTKEYF_CONTROL
'    g.RegisterHotKey hk, cmCmdLowercaseSelection
'
'




' no need for cmax 2124
'''
'''     ' Ctrl+L Lower Case:
'''     hk.VirtKey1 = "L"
'''     g.RegisterHotKey hk, cmCmdLowercaseSelection
'''
'''     ' Ctrl+U Upper Case:
'''     hk.VirtKey1 = "U"
'''     g.RegisterHotKey hk, cmCmdUppercaseSelection
'''
'''     ' Ctrl+H Replace
'''     hk.VirtKey1 = "H"
'''     g.RegisterHotKey hk, cmCmdFindReplace
'''
'
'     ' disable Alt+Enter (properties)
'     hk.Modifiers1 = 4  ' HOTKEYF_ALT
'     hk.Modifiers2 = 0
'     hk.VirtKey2 = ""
'     hk.VirtKey1 = Chr(13)
'     g.UnregisterHotKey hk
       
 ' it was a test (it didn't work because I forgot to delete "OPTION" dir!!!
'''    ' #1027 disable CTRL+A (undo)
'''     hk.Modifiers1 = 2 ' HOTKEYF_CONTROL
'''     hk.Modifiers2 = 0
'''     hk.VirtKey2 = ""
'''     hk.VirtKey1 = "A"
'''     g.UnregisterHotKey hk
       
' 1.31#447
' should work in version 2.1.0.20
'''     ' Ctrl+G Goto
'''     ' #204
'''     ' this trick insure that Ctrl+G will work... (there
'''     ' were no such problem with v. 2.1.0.8
'''     hk.VirtKey1 = "G"
'''     hk.Modifiers1 = 2 ' HOTKEYF_CONTROL   ' 1.24#286
'''     hk.Modifiers2 = 0                     ' 1.24#286
'''     g.RegisterCommand myINTERNAL_COMMAND_ID, "GotoLine_emu8086", "GotoLine_works_in2_1_0_19"
'''     g.RegisterHotKey hk, myINTERNAL_COMMAND_ID


'    g.UnregisterAllLanguages
'
'
'    ' ================================================
'
'    ' 1.23
'
'    RegisterCustomLanguage
    

    ' 1.23
    ' I hope that's better then setting
    ' property, since in case there is
    ' Fixedsys font with 9 size, it will be
    ' set to it, in case there is only size 8
    ' installed, it may be left 9 and be ugly!
    ''#1180 - ok, but terminal font isn't ugly even 12, so put 9
    txtInput.Font.Name = "Terminal" ' "Fixedsys"
    txtInput.Font.Size = 9 '8
    txtInput.Font.Bold = False
    txtInput.Font.Italic = False
    txtInput.Font.Strikethrough = False
    txtInput.Font.Underline = False


    ' 1.23
    'txtInput.SetColor cmClrLeftMargin, RGB(170, 170, 170)
       
    ' 1.23
'    ' by default:
'    txtInput.LineNumbering = True
'    txtInput.LineNumberStart = 1
'    txtInput.LineNumberStyle = cmDecimal
'    txtInput.SetColor cmClrLineNumber, RGB(160, 160, 160)
'    txtInput.SetColor cmClrLineNumberBk, RGB(230, 230, 230)
       
    
'    ' for instructions:
'    txtInput.SetFontStyle cmStyKeyword, cmFontNormal
'    ' for comment:
'    txtInput.SetFontStyle cmStyComment, cmFontNormal
'    ' for general purpose registers:
'    txtInput.SetColor cmClrTagAttributeName, RGB(200, 0, 0)
'    ' for segment registers:
'    txtInput.SetFontStyle cmStyTagElementName, cmFontNormal
'    ' for compiler directives:
'    txtInput.SetColor cmClrTagEntity, RGB(0, 0, 100)
'    ' for operators:
'    txtInput.SetColor cmClrOperator, RGB(0, 100, 200)
'
'    ' CodeMax default is 4, our default is 8:
'    txtInput.TabSize = 4 '#1169b APPERENTLY, I LOVE 4 TOO :) ' 8
'    ' convert tabs to spaces:
'    txtInput.ExpandTabs = True ' False ' #1176
'

    
'    ' DO NOT confine caret to text by default:
'    txtInput.SelBounds = False ' #400-no-confine:)# ' True
'
'    ' indent on PROC / ENDP by default :)
'    txtInput.AutoIndentMode = cmIndentScope ' #400b4-mini# - #11
'
'
'    txtInput.ColorSyntax = True
'
'    txtInput.Language = "ASM_8086"
'
'    txtInput.HideSel = False
'
'    txtInput.BorderStyle = cmBorderClient
'
'    txtInput.LineToolTips = False ' 4.00b15 ' True
   
   
    ' 1.30#418
'2.51#709    create_NEW_source 0
   
   
   
   
   
      
'    ' 2.51#708
'    ' Add samples (examples) menu to toolbar:
'    Dim xii As Integer
'    For xii = 1 To 10
'        Toolbar1.Buttons(3).ButtonMenus.Add xii, "sampleN" & xii, mnuSample_ARR(xii).Caption
'    Next xii
'    Toolbar1.Buttons(3).ButtonMenus.Add 11, "sampleN99", mnuSample_ARR(99).Caption
'
'
'
   
   
   
   ' 31-july-2003 ... oh how long ago that was...
   
'' #1143 removed, no one need hello world template!
''   ' 20-april-2005 loading last edited file (if any)
''
''   If FileExists(mnuRecent(1).Tag) Then
''        '#1039e' openSourceFile mnuRecent(1).Tag
''        '#1047c' txtInput.Text = "" '#1039e
''         txtInput.Text = "" ' #1050c (make it nothing!) ' "org 100h" & vbNewLine & vbNewLine  ' #1047c
''         txtInput.SetCaretPos txtInput.lineCount, 0
''   Else ' load default "Hello World"
''        txtInput.Text = txtSTARTUP_CODE.Text
''   End If
''
''
   'txtInput.Modified = False ' works even without it :)
   
   
   
   
   
   
   
   
''    ' new un-reg system:
''    If beALLOW_UNLOCK Then
''        beREGISTERED_2 = True
''        If bREGISTERED = False Then
''            frmRegister.Show vbModal
''        End If
''    Else
''        beREGISTERED_2 = True
''    End If
   

'    ' #327xb-trans-incomplete#
'    If bMAKE_TRANSLATION Then
'        Dim kk As Integer
'        For kk = Toolbar1.Buttons.Count To 1 Step -1
'            If Toolbar1.Buttons(kk).Caption <> "" Then
'                 Toolbar1.Buttons(kk).Caption = cMT(Toolbar1.Buttons(kk).Caption)
'            End If
'        Next kk
'    End If
'




'#1172
'This is a simple example of hooking the form to enable drag-n-drop for the CodeMax control.
'Since the entire form is hooked, dropping onto the CodeMax control works also.
'Note: Do not change the OLEDropMode from 'None' or the Form will behave differently from the controls.

'To try this out, run the project and drag/drop files anywhere into the open form.
'Their names will appear in the list box.

' well because it crashes vb on exit... I decided to wait with it...
' run this only if you are in
   ' Me.OLEDropMode = 0
   ' Toolbar1.OLEDropMode = 0
   ' HookForm Me
    
   ' can make it work, but.... maybe there are better things.
   ' Debug.Print App.EXEName

   
    Exit Sub
err_loading:
    Debug.Print "frmMain_Load: " & LCase(Err.Description)
    ' #400b4-mini-8# '  On Error Resume Next
    Resume Next
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  
On Error Resume Next ' 4.00-Beta-4
  
  If Len(txtInput.Text) = 0 Then Exit Sub ' 4.00-Beta-4
  
  
'  If bIsModified Then
'    Select Case AskToSaveChanges()
'    Case vbYes
'        If Not saveSourceFile(sOpenedFile) Then
'            Cancel = 1
'            Exit Sub
'            ' Cancel unload, and exit current sub,
'            ' in case of saving trouble.
'        End If
'        ' unload after successful saving.
'    Case vbNo
'        ' unload without doing saving.
'    Case vbCancel
'        Cancel = 1
'        Exit Sub
'        ' Cancel unload, and exit current sub.
'    End Select
'  End If
  
End Sub

Private Sub Form_Resize()
    On Error GoTo resize_error
        
        txtInput.Left = 0
        
        ' txtInput.Top = Toolbar1.Height + 1
        txtInput.Top = 0
        
        Dim fTemp As Single ' 1.31#443
        fTemp = Me.ScaleWidth
        If fTemp > 2100 Then txtInput.Width = fTemp
        
        'fTemp = Me.ScaleHeight - StatusBar1.Height - Toolbar1.Height - 1
        fTemp = Me.ScaleHeight - 1
        
        If fTemp > 2100 Then txtInput.Height = fTemp
        
        ' 1.23 bugix#197
        frameLoading.Left = Me.ScaleWidth / 2 - frameLoading.Width / 2
        frameLoading.Top = Me.ScaleHeight / 2 - frameLoading.Height / 2
    
    
    ' not required becuase ToolBar is not wrappable anymore!
        ' 2.5#707
     '   Timer_ResizeBug.Enabled = True
    
    
    Exit Sub
resize_error:
    Debug.Print "Error on frmMain Form_resize(): " & LCase(Err.Description)
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error GoTo err1
    'SaveWindowState Me ' 2.05#551
    
    Erase sLONG_LINES ' #327xp-erase#
    
    END_PROGRAM
    
    Exit Sub
err1:
    Debug.Print "frmMain.Form_Unload: " & LCase(Err.Description)
    On Error Resume Next
End Sub



'Private Sub txtInput_KeyDown(KeyCode As Integer, Shift As Integer)
'Select Case KeyCode
'
'Case 16, 17, 18, 91, 92, 93
'    ' VB generates this event even for SHIFT, CTRL we skip those...
'Case Else
'
'Debug.Print "map:" & make_min_len(Hex(MapVirtualKey(CLng(KeyCode Or Shift), 0)), 2, "0") _
'                   & make_min_len(Hex(MapVirtualKey(CLng(KeyCode Or Shift), 2)), 2, "0")
'End Select
'
'End Sub


'' 1.21 #166
'Private Sub mnuCut_Click()
'On Error GoTo err_cut
'
'' 1.23
'''    If txtInput.SelLength > 0 Then
'''        keep_for_Undo
'''        Clipboard.SetText txtInput.SelText
'''        txtInput.SelText = ""
'''    End If
'
'    txtInput.Cut
'
'    Exit Sub
'err_cut:
'    Debug.Print "Error on cut: " & LCase(Err.Description)
'End Sub

'' 1.21 #166
'Private Sub mnuCopy_Click()
'On Error GoTo err_copy
'
''    If txtInput.SelLength > 0 Then
''        Clipboard.SetText txtInput.SelText
''    End If
'
'    txtInput.Copy
'
'    Exit Sub
'err_copy:
'    Debug.Print "Error on copy: " & LCase(Err.Description)
'End Sub

'' 1.21 #166
'Private Sub mnuPaste_Click()
'On Error GoTo err_paste
'
'' 1.23
''''    If Clipboard.GetFormat(vbCFText) Then
''''        ' 1.23 keep_for_Undo
''''        txtInput.SelText = Clipboard.GetText
''''        'Debug.Print "got text!"
''''    End If
'
'    txtInput.Paste
'
'    Exit Sub
'err_paste:
'    Debug.Print "Error on paste: " & LCase(Err.Description)
'End Sub

' 1.21 #166
'Private Sub mnuFindText_Click()
'On Error Resume Next ' 4.00-Beta-3
'    ' to make sure it will work on popup menu:
'    execute_CMD_after_DELAY delayed_CMD_FIND
'End Sub

'Private Sub mnuShowLineNumbers_Click()
'On Error GoTo err_msln
'
'    txtInput.LineNumbering = Not txtInput.LineNumbering
'    txtInput.LineNumberStart = 1
'    txtInput.LineNumberStyle = cmDecimal
'
'    Exit Sub
'err_msln:
'    Debug.Print "mnuShowLineNumbers_Click: " & LCase(Err.Description)
'End Sub

'Private Sub mnuTabifySelection_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdTabifySelection
'End Sub
'
'Private Sub mnuToggleBookmark_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdBookmarkToggle
'End Sub
'
'
'
'Private Sub mnuUntabifySelection_Click()
'On Error Resume Next ' 4.00-Beta-3
'    txtInput.ExecuteCmd cmCmdUntabifySelection
'End Sub
'
'



'' #327u#
'Private Sub StatusBar1_OLEDragDrop(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
'
'On Error GoTo err_dd
'
'If Data.GetFormat(vbCFFiles) Then
'
'    If Data.Files.Count > 0 Then
'
'        If frmStartUp.Visible Then frmStartUp.Hide ' #1172b
'
'        ' process like command line parameter:
'        PROCESS_CMD_Line Data.Files.Item(1)
'
'    End If
'
'
'End If
'
'Exit Sub
'err_dd:
'    Debug.Print "frmMain_StatusBar1_OLEDragDrop: " & LCase(err.Description)
'    On Error Resume Next
'End Sub



' 2.5#707
'Private Sub Timer_ResizeBug_Timer()
'Timer_ResizeBug.Enabled = False
'        txtInput.Top = Toolbar1.Height + 1
'        Dim fTemp As Single
'        fTemp = Me.ScaleHeight - StatusBar1.Height - Toolbar1.Height - 1
'        If fTemp > 2100 Then txtInput.Height = fTemp
'End Sub
'
'Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
'
'On Error Resume Next ' 4.00-Beta-3
'
'    Select Case Button.Key
'
'    Case "new"
'        cmdNew_Click
'
'    Case "open"
'        cmdLoad_Click
'
'    Case "samples" ' examples
'        mnuSample_ARR_Click 99
'
'    Case "save"
'        cmdSave_Click
'
'    Case "compile"
'        cmdCompile_Click
'
'    Case "emulate"
'        cmdCompile_and_Emulate_Click
'
'    Case "calculator"
'        mnuEvaluator_Click
'
'    Case "convertor"
'        mnuCalculator_Click
'
'    Case "options"
'        cmdOptions_Click
'
'    Case "help"
'        cmdHelp_Click
'
'    Case "about"
'        cmdAbout_Click
'
'    End Select
'
'End Sub

'Private Sub Toolbar1_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
'On Error GoTo err
'
'    If ButtonMenu.Key = "saveas" Then
'        mnuSaveAs_Click
'        Exit Sub
'    End If
'
'    If Mid(ButtonMenu.Key, 1, 7) = "sampleN" Then
'        Dim ii As Integer
'        ii = Val(Mid(ButtonMenu.Key, 8))
'        mnuSample_ARR_Click ii
'    End If
'
'Exit Sub
'
'err:
'    Debug.Print "Toolbar1_ButtonMenuClick: " & LCase(err.Description)
'
'End Sub



'Private Sub Toolbar1_OLEDragDrop(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single) '#1129
'
'On Error GoTo err_ddT
'
'If Data.GetFormat(vbCFFiles) Then
'
'    If Data.Files.Count > 0 Then
'
'        ' process like command line parameter:
'        PROCESS_CMD_Line Data.Files.Item(1)
'
'    End If
'
'End If
'
'Exit Sub
'err_ddT:
'    Debug.Print "Toolbar1_OLEDragDrop: " & LCase(err.Description)
'End Sub

' 1.23
''''' 1.21 #166
''''Private Sub mnuFindNext_Click()
''''    If frmFind.comboFindText.Text = "" Then
''''        mnuFindText_Click
''''    Else
''''        frmFind.searchText
''''    End If
''''End Sub

' 1.23
'''''' 1.21 #166
'''''Private Sub mnuGotoLine_Click()
'''''On Error GoTo err_goto
'''''    Dim lIndex As Long
'''''    Dim lLineNumber As Long
'''''    Dim s As String
'''''
'''''    s = InputBox("Enter line number", "Go To...")
'''''
'''''    If s = "" Then Exit Sub ' canceled!
'''''
'''''    lLineNumber = Val(s)
'''''
'''''    If lLineNumber < 1 Then
'''''        MsgBox "No line with this number!", vbOKOnly, "Go To..."
'''''        Exit Sub
'''''    End If
'''''
'''''    lIndex = getLineStart_index(txtInput.Text, lLineNumber)
'''''
'''''    If lIndex < 1 Then
'''''        MsgBox "No such line number!", vbOKOnly, "Go To..."
'''''        txtInput.SelLength = 0
'''''        txtInput.SelStart = Len(txtInput.Text)
'''''        Exit Sub
'''''    End If
'''''
'''''    txtInput.SelLength = 0
'''''    txtInput.SelStart = lIndex - 1
'''''
'''''    Exit Sub
'''''err_goto:
'''''    Debug.Print "Error on goto line: " & LCase(err.Description)
'''''End Sub


' 1.23
''''Private Sub mnuIndent_Click()
''''    Dim lStart As Long
''''    Dim s As String
''''    Dim bSELECTED As Boolean
''''
''''    keep_for_Undo
''''
''''    ' to keep the selection after operation:
''''    If txtInput.SelLength > 0 Then
''''        bSELECTED = True
''''        lStart = txtInput.SelStart
''''    Else
''''        bSELECTED = False
''''    End If
''''
''''
''''    s = edit_Indent(txtInput.SelText)
''''    txtInput.SelText = s
''''
''''    If bSELECTED Then
''''        txtInput.SelStart = lStart
''''        txtInput.SelLength = Len(s)
''''    End If
''''End Sub

' 1.23
'''Private Sub mnuOutdent_Click()
'''    Dim lStart As Long
'''    Dim s As String
'''    Dim bSELECTED As Boolean
'''
'''    keep_for_Undo
'''
'''    ' to keep the selection after operation:
'''    If txtInput.SelLength > 0 Then
'''        bSELECTED = True
'''        lStart = txtInput.SelStart
'''    Else
'''        bSELECTED = False
'''    End If
'''
'''
'''    s = edit_Outdent(txtInput.SelText)
'''    txtInput.SelText = s
'''
'''    If bSELECTED Then
'''        txtInput.SelStart = lStart
'''        txtInput.SelLength = Len(s)
'''    End If
'''
'''End Sub

' 1.23
Private Sub txtInput_Change()

    bIsModified = True

End Sub

' 1.23
''''' for Indent / Outdent processing,
''''' do not add tabs automatically:
''''Private Sub txtInput_KeyPress(KeyAscii As Integer)
''''
''''    If KeyAscii = 9 Then
''''        ' processing manually in txtInput_KeyDown()
''''        KeyAscii = 0
''''    Else
''''        ' I can Undo  Indent/Outdent only!
''''        reset_Undo_Redo
''''    End If
''''
''''End Sub

' 1.23
''''Private Sub txtInput_KeyDown(KeyCode As Integer, Shift As Integer)
''''    If KeyCode = Asc(vbTab) Then
''''        If Shift And vbShiftMask Then
''''            mnuOutdent_Click
''''        Else
''''            mnuIndent_Click
''''        End If
''''    End If
''''End Sub


Private Sub cmdEmulate_Click()
On Error Resume Next ' 4.00-Beta-3
    frmEmulation.DoShowMe
End Sub


'Private Sub mnuEdit_Click()
'On Error Resume Next ' 4.00-Beta-3
''''    If Len(sUNDO_BUFFER) > 0 Then
''''        mnuUndo.Enabled = True
''''    Else
''''        mnuUndo.Enabled = False
''''    End If
''''
''''    If Len(sREDO_BUFFER) > 0 Then
''''        mnuRedo.Enabled = True
''''    Else
''''        mnuRedo.Enabled = False
''''    End If
'
'    mnuUndo.Enabled = txtInput.CanUndo
'    mnuRedo.Enabled = txtInput.CanRedo
'    mnuCut.Enabled = txtInput.CanCut
'    mnuCopy.Enabled = txtInput.CanCopy
'    mnuPaste.Enabled = txtInput.CanPaste
'
'    mnuShowLineNumbers.Checked = txtInput.LineNumbering
'
'End Sub


'Private Sub mnuUndo_Click()
'On Error Resume Next ' 4.00-Beta-3
'   ' 1.23 edit_do_Undo
'   txtInput.Undo
'End Sub
'
'
'
'Private Sub mnuRedo_Click()
'On Error Resume Next ' 4.00-Beta-3
'   ' 1.23 edit_do_Redo
'   txtInput.Redo
'End Sub



' 1.23
'''' 1.22 #190
'''Private Sub mnuSelectAll_Click()
'''    txtInput.SelStart = 0
'''    txtInput.SelLength = Len(txtInput.Text)
'''End Sub



' 1.23
'Private Sub mnuSelectAll_Click()
'On Error GoTo err_sel_all
'
'    txtInput.ExecuteCmd cmCmdSelectAll
'
'    Exit Sub
'err_sel_all:
'    Debug.Print "Error on mnuSelectAll_Click: " & LCase(Err.Description)
'End Sub

'
'Private Sub txtInput_SelChange(ByVal Control As CodeMaxCtl.ICodeMax)
'Dim r As New Range
'r = Control.GetSel(False)
'
'Debug.Print "aaaaa"
'Debug.Print r.StartLineNo
'End Sub

'Private Function txtInput_CmdFailure(ByVal Control As codemaxctl.ICodeMax, ByVal lCmd As codemaxctl.cmCommand, ByVal lErrCode As codemaxctl.cmCommandErr) As Boolean
'    If lErrCode = cmErrNotFound Then
'
'        Dim sTemp7 As String '#1169
'
'        sTemp7 = txtInput.FindText '#1169
'
'
'        MsgBox "cannot not find: " & sTemp7, vbOKOnly, "not found!"
'
'
'
'        '#1169 - show find box again!
'        DoEvents
'        execute_CMD_after_DELAY delayed_CMD_FIND
'
'
'
'
'    ElseIf lErrCode = cmErrInput And lCmd = cmCmdGotoLine Then
'        mBox Me, cMT("no such line!")
'    Else
'        Debug.Print "txtInput_CmdFailure: " & lErrCode
'    End If
'
'
'End Function

'Private Function txtInput_MouseDown(ByVal Control As codemaxctl.ICodeMax, ByVal Button As Long, ByVal Shift As Long, ByVal X As Long, ByVal Y As Long) As Boolean
'    If Button = 2 Then PopupMenu mnuEdit
'End Function

'1.31#447
''''' #204
''''Private Sub txtInput_RegisteredCmd(ByVal Control As codemaxctl.ICodeMax, ByVal lCmd As codemaxctl.cmCommand)
''''    If lCmd = myINTERNAL_COMMAND_ID Then
''''        Control.ExecuteCmd cmCmdGotoLine, -1
''''    End If
''''End Sub




'
'Private Sub mnuMacro_Click()
'' 3.27w
'' #400b20-macro-back#
'On Error GoTo err_mmc
'
'    Dim g As codemaxctl.globals
'    Set g = New codemaxctl.globals
'
'    Dim ttb() As Byte
'    Dim i As Integer
'
'    Dim hh As New HotKey
'    Dim L As Long
'    Dim s As String
'
'    For i = 0 To 9
'
'        g.GetMacro i, ttb
'
'        If UBound(ttb) > 0 Then
'            mnuPlayMacro(i).Enabled = True
'
'            ' I'm not sure what l is for.
'            Set hh = g.GetHotKeyForCmd(cmCmdPlayMacro1 + i, L)
'
'            s = getString_from_HotKey(hh.Modifiers1, hh.Modifiers2, hh.VirtKey1, hh.VirtKey2)
'            mnuPlayMacro(i).Caption = "Play Macro " & (i + 1) & "  " & s
'            Debug.Print
'        Else
'            mnuPlayMacro(i).Enabled = False
'        End If
'
'        Erase ttb
'    Next i
'
'    Exit Sub
'err_mmc:
'    Debug.Print "mnuMacro_Click: " & LCase(Err.Description)
'End Sub


Private Function getString_from_HotKey(m1 As Long, m2 As Long, vk1 As String, vk2 As String)
    Dim sResult As String
    
    sResult = ""
    
    If m1 <> 0 Then
        sResult = get_modifier_str(m1) & " + "
    End If
    
    If m2 <> 0 Then
        sResult = sResult & get_modifier_str(m2) & " + "
    End If
    
    If Len(vk1) > 0 Then
        sResult = sResult & vk1
    End If
    
    If Len(vk2) > 0 Then
        sResult = sResult & ", " & vk2
    End If
    
    
    getString_from_HotKey = sResult
    
End Function

Private Function get_modifier_str(m As Long) As String
    Dim sR As String
    
    sR = ""
    
    If m And 1 Then
        sR = "Shift"
    End If
    
    If m And 2 Then
        If Len(sR) > 0 Then
            sR = sR & " + Ctrl"
        Else
            sR = "Ctrl"
        End If
    End If
    
    If m And 4 Then
        If Len(sR) > 0 Then
            sR = sR & " + Alt"
        Else
            sR = "Alt"
        End If
    End If

    get_modifier_str = sR
End Function



Function get_spent_time(fStartTime) As Single
On Error GoTo err_gst
    Dim f1 As Single
    Dim f2 As Single
    Dim f3 As Single
    Dim f4 As Single
    
    f1 = Timer - fStartTime
    
    f2 = Fix(f1)
    
    f3 = f1 - f2   ' get digits after "." only (including "0.")
    
    f3 = f3 * 1000 ' move 3 digists after "." before dot.
    
    f4 = Fix(f3)   ' we have only 3 digits that were after the "."
    f4 = f4 / 1000 ' move them after the "."
    
    get_spent_time = f2 + f4
    
    Exit Function
err_gst:
    Debug.Print "get_spent_time: " & LCase(Err.Description)
    On Error Resume Next
End Function


'Private Sub execute_CMD_after_DELAY(iCMD As Integer)
'    iCommand_TO_EXECUTE_on_DELAY = iCMD
'    Timer_DelayCommand.Enabled = True
'End Sub

'' 1.24#285
'' should fix the problem when "Find" and "Find Next"
'' do not work from right-click popup menu:
'Private Sub Timer_DelayCommand_Timer()
'
'On Error GoTo err_tdct
'
'    Timer_DelayCommand.Enabled = False
'
'
'    Select Case iCommand_TO_EXECUTE_on_DELAY
'
'    Case delayed_CMD_FIND
'        txtInput.ExecuteCmd cmCmdFind
'
'    Case delayed_CMD_FIND_NEXT
'        txtInput.ExecuteCmd cmCmdFindNext
'
'    End Select
'
'
'    Exit Sub
'err_tdct:
'    Debug.Print "Timer_DelayCommand: " & iCommand_TO_EXECUTE_on_DELAY & ": " & LCase(Err.Description)
'
'End Sub

Public Sub mnuSample_CLICK_from_Emulator(Index As Integer)
On Error Resume Next ' 4.00-Beta-3
    mnuSample_ARR_Click Index
 End Sub

' 1.30#421
Private Sub mnuSample_ARR_Click(Index As Integer)

On Error GoTo err1

    Dim sF As String
    
    If Index < 6 Then
    
        sF = Add_BackSlash(App.Path) & "examples\" & Index & "_sample.asm"
    
    Else
        Dim s As String
        
        Select Case Index
        
        Case 6
            s = "traffic_lights.asm"
        
        Case 7
            s = "palindrome.asm"
        
        Case 8
            s = "LED_display_test.asm" ' "advanced_io.asm"
            
        Case 9
            s = "stepper_motor.asm"
        
        Case 10
            s = "simple_io.asm"
        
        Case Else
            GoTo browse
        
        End Select
    
        sF = Add_BackSlash(App.Path) & "examples\" & s
    
    End If
    
    If FileExists(sF) Then
        openSourceFile sF, False, True
    Else
browse:
       ' 4.00 ' sCURRENT_SOURCE_FOLDER = Add_BackSlash(App.Path) & "examples"
        openSourceFile "", False, True
    End If
    
'    ' 2.11
'    If frmStartUp.Visible = True Then
'        frmStartUp.Hide
'    End If
'
    
    Exit Sub
    
err1:
    Debug.Print "mnuSample_ARR: " & LCase(Err.Description)
    
End Sub

'Private Sub txtInput_SelChange(ByVal Control As codemaxctl.ICodeMax)
'On Error GoTo err
'Dim a As Range
'Set a = New Range
'Set a = Control.GetSel(True)
'
'Dim i As Long
'i = txtInput.LineNumberStart
'
'StatusBar1.Panels(1).Text = "line: " & CStr(a.StartLineNo + i)
'
'StatusBar1.Panels(2).Text = "col: " & CStr(a.StartColNo + 1)
'
'Dim lSelCount As Long
'lSelCount = Abs(a.EndColNo - a.StartColNo)
'If lSelCount > 0 And a.StartLineNo = a.EndLineNo Then
'    StatusBar1.Panels(3).Text = "sel: " & lSelCount
'Else
'    StatusBar1.Panels(3).Text = " "
'End If
'
'
'
'Exit Sub
'err:
'Debug.Print "txtInput_SelChange: " & LCase(err.Description)
'End Sub


' #1063
' replace long dups with smaller replacement.
' used to avoid bug in lists that avoids keeping stings over 1020 chars there...
' IT IS NO LONGER USED, because we have long dups anymore!
Private Function keep_very_long_line_separately(s As String) As String
 On Error GoTo err1
 
    ' hopefully it will never happen... I'm not checking this out! :)
    If i_COUNT_LONG_LINES >= MAX_LONG_LINES Then
        keep_very_long_line_separately = ""
        frmInfo.addErr currentLINE, "cannot assemble, this code contains too many lines over 1020 chars.", ""
        Exit Function
    End If

    i_COUNT_LONG_LINES = i_COUNT_LONG_LINES + 1
    
    ReDim Preserve sLONG_LINES(0 To i_COUNT_LONG_LINES)
    
    sLONG_LINES(i_COUNT_LONG_LINES) = s
        
    keep_very_long_line_separately = " [LONG-LINE][" & i_COUNT_LONG_LINES & "]"
    
    Exit Function
err1:
    Debug.Print "Err!  create_dup_replacer_for: " & LCase(Err.Description)
    
End Function

' #1063
' reverses the create_dup_replacer_for()
' NOTICE: because sPrefix is added to original string, it must be preserved!
Private Function check_long_dup_expand_if_any(s As String) As String
On Error GoTo err1

    Dim L As Long
    
    L = InStr(1, s, "[LONG-LINE][", vbBinaryCompare)
    
    If L > 0 Then
    
        Dim i As Integer
        
        i = Val(Mid(s, L + 12)) ' len("[LONG-LINE][") = 12
        
        check_long_dup_expand_if_any = Replace(s, "[LONG-LINE][" & i & "]", sLONG_LINES(i), 1, 1) ' REPLACED!
        
    Else
    
        check_long_dup_expand_if_any = s  ' NO CHANGE!
        
    End If
    
    Exit Function
    
err1:
    Debug.Print "Err! check_long_dup_expand_if_any: " & LCase(Err.Description)
    
End Function

' #327xn-new-dot-stack#
'''''Private Sub check_DOT_STACK_PARAMETER(ByRef sALL_SOURCE_CODE As String)
'''''
'''''    ' need to make sure we treat the parameter correctly!
'''''    Dim lLOCATION As Long
'''''    lLOCATION = InStr(1, sALL_SOURCE_CODE, "SSEG    ENDS") ' binary compare because I know what i'm looking for.
'''''
'''''    If lLOCATION > 0 Then ' it must be >0 but jic.
'''''        lLOCATION = lLOCATION + Len("SSEG    ENDS") ' put locator to the end of this...
'''''        ' now extract everything that you see before the end of the line
'''''        Dim lLocationStop As Long
'''''        lLocationStop = InStr(lLOCATION, sALL_SOURCE_CODE, Chr(10)) ' can be 13,10  or just 10
'''''
'''''
'''''        If lLocationStop > lLOCATION Then ' it must be, but jic.
'''''            Dim s_DOT_STACK_PARAMETER As String
'''''            s_DOT_STACK_PARAMETER = Mid(sALL_SOURCE_CODE, lLOCATION, lLocationStop - lLOCATION)
'''''            Debug.Print s_DOT_STACK_PARAMETER
'''''
'''''            ' remove all new lines and carrige returns
'''''            s_DOT_STACK_PARAMETER = Replace(s_DOT_STACK_PARAMETER, Chr(13), "")
'''''            s_DOT_STACK_PARAMETER = Replace(s_DOT_STACK_PARAMETER, Chr(10), "")
'''''
'''''            ' remove all tabs and Rtrim!
'''''            s_DOT_STACK_PARAMETER = Replace(s_DOT_STACK_PARAMETER, vbTab, "")
'''''            s_DOT_STACK_PARAMETER = RTrim(s_DOT_STACK_PARAMETER) 'required to trim from one side only, if it's empty it will trim anyway.
'''''
'''''            Dim lLen_DOT_STACK_PARAM As Long
'''''            lLen_DOT_STACK_PARAM = Len(s_DOT_STACK_PARAMETER)
'''''            If lLen_DOT_STACK_PARAM Then ' if it's not an empty space such as ".stack        "
'''''
'''''
'''''                 Mid(sALL_SOURCE_CODE, lLOCATION) = String(lLen_DOT_STACK_PARAM, " ") ' put spaces in parameter's place!
'''''                 ' it leaves one char untouched ....
'''''                 ' here's a simpler way:
'''''
'''''
'''''                sALL_SOURCE_CODE = Replace(sALL_SOURCE_CODE, "        DB      64*4    DUP('T')", "        DB      " & s_DOT_STACK_PARAMETER & "    DUP('T')", 1, 1) ' replace once only!
'''''
'''''            Else
'''''                Debug.Print "empty space after .stack"
'''''            End If
'''''        End If
'''''    End If
'''''
'''''End Sub


'#1191  --  all for Chapter 3  Structure of MS-DOS Application Programs :)
' ignoring line numbers :)
' modifies parameter ByRef!!!
Private Sub cut_out_line_number(ByRef s As String)
On Error GoTo err1
    
          ' check if it's a line number, such as 12:   mov ax, 5
          Dim lIndex1191 As Long
          lIndex1191 = InStr(1, s, ":")  ' probably some speed optimization would be great ...
          If lIndex1191 > 0 Then  ' #1191  - ignore line numbers!
                Dim s1191 As String
remove_number:
                s1191 = Mid(s, 1, 1) '#327q2#  enough if first char is a digit' lIndex1191 - 1)
                '#327q2# If CStr(Val(s1191)) = s1191 Then
                If InStr(1, "0123456789", s1191) > 0 Then
                    s = Trim(Mid(s, lIndex1191 + 1))
                End If
                
                '#327q2#  -- check if it's an address, such as 0000:0000  mov ax, 5
                Dim s327q2 As String
                s327q2 = Mid(s, 1, 1)
                If InStr(1, "0123456789", s327q2) > 0 Then  ' if it's number again?
                    Dim lFirstSpace_INDEX As Long
                    lFirstSpace_INDEX = InStr(1, s, " ")
                    If lFirstSpace_INDEX > 0 Then
                        s = Trim(Mid(s, lFirstSpace_INDEX))
                    End If
                End If
           End If
        
        
           
           
        
        Exit Sub
err1:
        Debug.Print "cut_out_line_number: " & LCase(Err.Description)
End Sub


'' #327xl-export-html#
'Private Sub mnuExportToHTML_Click()
'On Error GoTo err1
'
'    frmExportHTML.DoShowMe
'
'Exit Sub
'err1:
'    Debug.Print "mnuExportToHTML_Click: " & Err.Description
'End Sub


Private Function no_entry_point(s As String) As Boolean
On Error GoTo err1
    If s_ENTRY_POINT = "-1" Then
        no_entry_point = True
    ElseIf s_ENTRY_POINT = Chr(10) Then
        no_entry_point = True
    ElseIf s_ENTRY_POINT = vbNewLine Then
        no_entry_point = True
    ElseIf s_ENTRY_POINT = Chr(13) Then
        no_entry_point = True
    ElseIf s_ENTRY_POINT = "" Then
        no_entry_point = True
    ElseIf s_ENTRY_POINT = " " Then
        no_entry_point = True
    Else
        no_entry_point = False
    End If
    Exit Function
err1:
    no_entry_point = False ' return like there is. who knows.
    Debug.Print "err ep: " & Err.Description
End Function

' 3.27xq
Public Function is_source_modified() As Boolean
On Error Resume Next ' 4.00-Beta-3
    is_source_modified = bIsModified
End Function




'' #400b20-macro-back#
'Private Sub mnuPlayMacro_Click(Index As Integer)
'    Select Case Index
'
'    Case 0
'        txtInput.ExecuteCmd cmCmdPlayMacro1
'
'    Case 1
'        txtInput.ExecuteCmd cmCmdPlayMacro2
'
'    Case 2
'        txtInput.ExecuteCmd cmCmdPlayMacro3
'
'    Case 3
'        txtInput.ExecuteCmd cmCmdPlayMacro4
'
'    Case 4
'        txtInput.ExecuteCmd cmCmdPlayMacro5
'
'    Case 5
'        txtInput.ExecuteCmd cmCmdPlayMacro6
'
'    Case 6
'        txtInput.ExecuteCmd cmCmdPlayMacro7
'
'    Case 7
'        txtInput.ExecuteCmd cmCmdPlayMacro8
'
'    Case 8
'        txtInput.ExecuteCmd cmCmdPlayMacro9
'
'    Case 9
'        txtInput.ExecuteCmd cmCmdPlayMacro10
'    End Select
'
'End Sub



' #400b20-anti-crash#
Private Sub anti_crash_save()
On Error GoTo err1

    
    Dim fNum As Integer
    Dim sFilename As String
    
    sFilename = Add_BackSlash(App.Path) & "auto_save_backup.dat.txt"

    If FileExists(sFilename) Then
        DELETE_FILE sFilename
    End If

    fNum = FreeFile
    Open sFilename For Binary Shared As fNum

    Put #fNum, , txtInput.Text
    
    Close fNum
    

    Exit Sub
err1:
Debug.Print "anti_crash_save: " & Err.Description
End Sub

Private Sub txtInput_Validate(Cancel As Boolean)
    Debug.Print "ok"
End Sub

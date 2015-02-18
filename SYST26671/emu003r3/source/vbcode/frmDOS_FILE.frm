VERSION 5.00
Begin VB.Form frmDOS_FILE 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "DTA settings"
   ClientHeight    =   6870
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5850
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6870
   ScaleWidth      =   5850
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   " info "
      Height          =   2565
      Left            =   30
      TabIndex        =   5
      Top             =   3675
      Width           =   5700
      Begin VB.TextBox txtInfo 
         Appearance      =   0  'Flat
         Height          =   1770
         Left            =   75
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   2
         Top             =   195
         Width           =   5490
      End
      Begin VB.CommandButton cmdGetInfo 
         Caption         =   "update info"
         Height          =   375
         Left            =   1725
         TabIndex        =   3
         Top             =   2070
         Width           =   2055
      End
   End
   Begin VB.DirListBox Dir1 
      Appearance      =   0  'Flat
      Height          =   1890
      Left            =   120
      TabIndex        =   0
      Top             =   285
      Width           =   5595
   End
   Begin VB.CommandButton cmdHide 
      Caption         =   "Close"
      Height          =   435
      Left            =   2190
      TabIndex        =   4
      Top             =   6345
      Width           =   1470
   End
   Begin VB.FileListBox File1 
      Appearance      =   0  'Flat
      Height          =   1395
      Left            =   120
      TabIndex        =   1
      Top             =   2220
      Width           =   5595
   End
   Begin VB.Label lblNote 
      AutoSize        =   -1  'True
      Caption         =   "NOTE: the selected item is returned on next call to INT 21h/4Fh"
      Height          =   195
      Left            =   420
      TabIndex        =   6
      Top             =   45
      Width           =   4530
   End
End
Attribute VB_Name = "frmDOS_FILE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' #400b4-int21-4E#

' 4.00-Beta-5
' this winfow is secretely shown if you type
' "v:DTA"
' from debug log.


Option Explicit
Option Base 0

' #400b5-sb-4e-4f#
Dim sPREVIOUS_PATHS() As String
Dim sPREVIOUS_PATTERNS() As String
Dim iPREVIOUS_ATTRIBUTES() As Integer  ' #400b7-scan-dirs#
Dim iMAX_PATHS_TO_TRACK As Integer
Dim iNumberOfPreviousPaths As Integer

Dim iCURRENT_ATTRIBUTES As Integer     ' #400b7-scan-dirs#

Private Sub cmdGetInfo_Click()

On Error GoTo err1

    '  allow to see what attributes are set to File1 and Dir1 of frmDOS_FILE on runtime!

    txtInfo.Text = ""

    txtInfo.Text = txtInfo.Text & "DTA ADDRESS: " & make_min_len(Hex(l_DTA_Address), 5, "0") & vbNewLine
    
    
    Dim s As String
    s = Add_BackSlash(File1.Path)
    If File1.ListIndex >= 0 Then
        s = s & File1.List(File1.ListIndex)
    End If
    txtInfo.Text = txtInfo.Text & "PATH: " & s & vbNewLine
    txtInfo.Text = txtInfo.Text & "DOS PATH: " & getDosPath(s) & vbNewLine

    txtInfo.Text = txtInfo.Text & "ATTRIBUTES: " & Hex(iCURRENT_ATTRIBUTES) & "h = " & toBIN_WORD(iCURRENT_ATTRIBUTES) & "b " & vbNewLine

    txtInfo.Text = txtInfo.Text & "PATTERN: " & File1.Pattern & vbNewLine




Exit Sub
err1:
    Debug.Print "cmdGetInfo_Click: " & Err.Description
End Sub

Private Sub cmdHide_Click()
    Me.Hide
End Sub



Private Sub cmdShowPath_Click(Index As Integer)
On Error GoTo err1


    
    Exit Sub
err1:
    Debug.Print "cmdShowPath_Click: " & Err.Description
    
End Sub

Private Sub Form_Load()
On Error GoTo err1
    
    b_LOADED_frmDOS_FILE = True
    
    ' #400b5-sb-4e-4f#
    iMAX_PATHS_TO_TRACK = mStepBack.get_MAXIMUM_FILES_TO_TRACK
    If iMAX_PATHS_TO_TRACK > 0 Then
        ReDim sPREVIOUS_PATHS(0 To iMAX_PATHS_TO_TRACK)
        ReDim sPREVIOUS_PATTERNS(0 To iMAX_PATHS_TO_TRACK)
        ReDim iPREVIOUS_ATTRIBUTES(0 To iMAX_PATHS_TO_TRACK) ' #400-b8-BUG1#
        iNumberOfPreviousPaths = 0
    End If
    
' #400b9-cautious#
'    Dim s As String
'    s = Add_BackSlash(App.Path) & s_MyBuild_Dir
'    Debug.Print "PATH: " & s
    
    File1.Path = s_MyBuild_Dir  ' #400b9-cautious#
    File1.Refresh
    Dir1.Path = File1.Path
    Dir1.Refresh
    
    
    Exit Sub
err1:
    Debug.Print "FRM_DOS_FILE_LOAD: " & Err.Description
    
End Sub

'''
'''Public Sub set_PATH_AND_GET_FIRST_FILE_TO_DTA(sPath As String, sPattern As String, iAttrib As Integer)
'''
'''    On Error GoTo err1
'''
'''    Dim sPREV_PATH As String ' #400b9-cautious#
'''    sPREV_PATH = File1.Path
'''
'''
'''    ' #400b5-sb-4e-4f#   step back preparation...
'''    If iNumberOfPreviousPaths < iMAX_PATHS_TO_TRACK Then
'''        mStepBack.set_INT21_4E_4F_for_STEPBACK File1.ListIndex, False  ' update both path and list index!
'''        sPREVIOUS_PATHS(iNumberOfPreviousPaths) = sPREV_PATH
'''        sPREVIOUS_PATTERNS(iNumberOfPreviousPaths) = File1.Pattern
'''        iPREVIOUS_ATTRIBUTES(iNumberOfPreviousPaths) = iCURRENT_ATTRIBUTES ' it doesn't really matter, here it will reset it to 0 (
'''        iNumberOfPreviousPaths = iNumberOfPreviousPaths + 1
'''    End If
'''
'''
'''    ' #CHECK_CX_ATTRIB# DONE!
'''
'''    iCURRENT_ATTRIBUTES = iAttrib
'''
'''    File1.ReadOnly = is_ATTRIB_READONLY(iCURRENT_ATTRIBUTES)
'''    File1.Hidden = is_ATTRIB_HIDDEN(iCURRENT_ATTRIBUTES)
'''    File1.System = is_ATTRIB_SYSTEM(iCURRENT_ATTRIBUTES)
'''
'''    ' ALWAYS the same paths must be set to File1 and Dir1 !
'''    File1.Path = sPath
'''    File1.Pattern = sPattern
'''    File1.Refresh
'''    DoEvents
'''    Dir1.Path = File1.Path
'''    Dir1.Refresh
'''    DoEvents
'''
'''    ' not sure if it's right, but let's try it :)
'''
'''    If is_ATTRIB_DIR(iCURRENT_ATTRIBUTES) Then     ' 0001_0000  -- 4th bit.
'''        ' #400b7-scan-dirs#
'''        Debug.Print "SCANNING DIRS!"
'''        ' scan dirs
'''        ' because vb's dirs box is so dumb, it shows previous dirs in a way of a tree, we must be careful to count dirs starting from intitial selection only.
'''        If Dir1.ListCount <= 0 Or (Dir1.ListCount - 1) <= Dir1.ListIndex Then
'''            frmEmulation.set_AX &H12 ' 12H (18)  no more files  ' #400b7-no-more-files#
'''            frmEmulation.bSET_CF_ON_IRET = True
'''        Else
'''            ' Dir1.ListIndex = 0  ' MUST BE ALREADY SELECTED TO CURRENT DIR (it's a tree view!!! we do not need upper list items).
'''            Dir1.ListIndex = Dir1.ListIndex + 1
'''            Dim sDir As String
'''            sDir = File1.List(Dir1.ListIndex)
'''            write_DTA_TABLE Cut_Last_BackSlash(sDir) ' make sure we get dir like this: "c:\emu8086\vdrive\c\mydir"  and not like this:  "c:\emu8086\vdrive\c\mydir\"  because we use ExtractFileName() later to get the name of the dir and FileLen() also works this way (returns zero).
'''            frmEmulation.bCLEAR_CF_ON_IRET = True
'''        End If
'''    Else
'''        Debug.Print "SCANNING FILES!"
'''         '  GET FIRST FILE TO DTA
'''        If File1.ListCount <= 0 Then
'''            frmEmulation.set_AX &H12 ' 12H (18)  no more files  ' #400b7-no-more-files#
'''            frmEmulation.bSET_CF_ON_IRET = True
'''        Else
'''            File1.ListIndex = 0
'''            Dim sFilename As String
'''            sFilename = File1.List(0)
'''            write_DTA_TABLE Add_BackSlash(File1.Path) & sFilename
'''            frmEmulation.bCLEAR_CF_ON_IRET = True
'''        End If
'''    End If
'''
'''    Exit Sub
'''err1:
'''    Debug.Print "set_PATH_AND_GET_FIRST_FILE_TO_DTA: " & Err.Description
'''
'''    On Error Resume Next
'''
'''    frmEmulation.set_AX 3   '     path not found
'''    frmEmulation.bSET_CF_ON_IRET = True
'''    try_to_set_default_path ' #400b6-vp#
'''
'''    File1.Path = sPREV_PATH ' #400b9-cautious#
'''
'''End Sub



Private Sub try_to_set_default_path()
On Error Resume Next
    File1.Pattern = "*.*"
    File1.Path = make_virtual_drive_path("c:\")
    File1.Refresh
End Sub

'''' #400b5-sb-4e-4f#
'''Public Sub do_INT_21_4E_4F_StepBack(iListIndex As Integer, bRevertListIndexOnly As Boolean)
'''On Error GoTo err1
'''
'''
'''    iNumberOfPreviousPaths = iNumberOfPreviousPaths - 1
'''
'''    If bRevertListIndexOnly Then
'''        File1.ListIndex = iListIndex
'''    Else
'''        If iNumberOfPreviousPaths >= 0 Then
'''
'''            ' #400b7-scan-dirs# '  #CHECK_CX_ATTRIB#
'''            iCURRENT_ATTRIBUTES = iPREVIOUS_ATTRIBUTES(iNumberOfPreviousPaths)
'''            File1.ReadOnly = is_ATTRIB_READONLY(iCURRENT_ATTRIBUTES)
'''            File1.Hidden = is_ATTRIB_HIDDEN(iCURRENT_ATTRIBUTES)
'''            File1.System = is_ATTRIB_SYSTEM(iCURRENT_ATTRIBUTES)
'''
'''            File1.Path = sPREVIOUS_PATHS(iNumberOfPreviousPaths)
'''            File1.Pattern = sPREVIOUS_PATTERNS(iNumberOfPreviousPaths)
'''            File1.Refresh
'''        End If
'''        File1.ListIndex = iListIndex
'''    End If
'''
'''    Exit Sub
'''err1:
'''    Debug.Print "do_INT_21_4E_4F_StepBack: " & Err.Description
'''End Sub

'' #400b7-scan-dirs#
'Private Function is_ATTRIB_READONLY(iAttrib As Integer) As Boolean
'On Error Resume Next
'    If getBitValue(iAttrib, 0, 0) = 1 Then
'        is_ATTRIB_READONLY = True
'    Else
'        is_ATTRIB_READONLY = False
'    End If
'End Function


'''' #400b7-scan-dirs#
'''Private Function is_ATTRIB_HIDDEN(iAttrib As Integer) As Boolean
'''On Error Resume Next
'''    If getBitValue(iAttrib, 1, 1) = 1 Then
'''        is_ATTRIB_HIDDEN = True
'''    Else
'''        is_ATTRIB_HIDDEN = False
'''    End If
'''End Function


'''' #400b7-scan-dirs#
'''Private Function is_ATTRIB_SYSTEM(iAttrib As Integer) As Boolean
'''On Error Resume Next
'''    If getBitValue(iAttrib, 2, 2) = 1 Then
'''        is_ATTRIB_SYSTEM = True
'''    Else
'''        is_ATTRIB_SYSTEM = False
'''    End If
'''End Function


'''' #400b7-scan-dirs#
'''Private Function is_ATTRIB_DIR(iAttrib As Integer) As Boolean
'''On Error Resume Next
'''    If getBitValue(iAttrib, 4, 4) = 1 Then
'''        is_ATTRIB_DIR = True
'''    Else
'''        is_ATTRIB_DIR = False
'''    End If
'''End Function



Public Sub get_NEXT_FILE_TO_DTA()

    On Error GoTo err1

    ' #400b5-sb-4e-4f#   step back preparation...
    If iNumberOfPreviousPaths < iMAX_PATHS_TO_TRACK Then
        mStepBack.set_INT21_4E_4F_for_STEPBACK File1.ListIndex, True  ' update list index only!
    End If


    If File1.ListIndex >= File1.ListCount Then
        frmEmulation.set_AX &H12  ' 12H (18)  no more files  ' #400b7-no-more-files#
        frmEmulation.bSET_CF_ON_IRET = True
    Else
        If File1.ListIndex < File1.ListCount - 1 Then
            File1.ListIndex = File1.ListIndex + 1
            Dim sFilename As String
            sFilename = File1.List(File1.ListIndex)
            write_DTA_TABLE Add_BackSlash(File1.Path) & sFilename
            frmEmulation.bCLEAR_CF_ON_IRET = True
        Else
            frmEmulation.set_AX &H12 '  no more files  v400-beta-8
            frmEmulation.bSET_CF_ON_IRET = True
        End If
    End If
    
    
    Exit Sub
err1:
    Debug.Print "get_NEXT_FILE_TO_DTA: " & Err.Description
    frmEmulation.set_AX 2 ' file not found.
    frmEmulation.bSET_CF_ON_IRET = True
    
End Sub


Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
On Error Resume Next
    b_LOADED_frmDOS_FILE = False
    
    Erase sPREVIOUS_PATHS
    Erase sPREVIOUS_PATTERNS
    Erase iPREVIOUS_ATTRIBUTES
End Sub

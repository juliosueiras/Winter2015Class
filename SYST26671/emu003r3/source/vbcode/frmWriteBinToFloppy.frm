VERSION 5.00
Begin VB.Form frmWriteBinToFloppy 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "write .bin file to virtual floppy drive"
   ClientHeight    =   3585
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5865
   Icon            =   "frmWriteBinToFloppy.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3585
   ScaleWidth      =   5865
   StartUpPosition =   1  'CenterOwner
   Begin VB.ComboBox comboHead 
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      ItemData        =   "frmWriteBinToFloppy.frx":038A
      Left            =   4245
      List            =   "frmWriteBinToFloppy.frx":0394
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1500
      Width           =   1185
   End
   Begin VB.ComboBox comboSector 
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      ItemData        =   "frmWriteBinToFloppy.frx":039E
      Left            =   1305
      List            =   "frmWriteBinToFloppy.frx":03A0
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1935
      Width           =   1185
   End
   Begin VB.ComboBox comboCylinder 
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      ItemData        =   "frmWriteBinToFloppy.frx":03A2
      Left            =   1305
      List            =   "frmWriteBinToFloppy.frx":03A4
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1500
      Width           =   1185
   End
   Begin VB.CommandButton cmdWrite 
      Caption         =   "write"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   3000
      TabIndex        =   5
      Top             =   3135
      Width           =   1260
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "close"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   4410
      TabIndex        =   6
      Top             =   3135
      Width           =   1260
   End
   Begin VB.ComboBox comboDriveNumber 
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      ItemData        =   "frmWriteBinToFloppy.frx":03A6
      Left            =   1305
      List            =   "frmWriteBinToFloppy.frx":03B6
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   1080
      Width           =   1845
   End
   Begin VB.TextBox txtPathToBinFile 
      Height          =   330
      Left            =   1755
      TabIndex        =   0
      Top             =   195
      Width           =   3945
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      Caption         =   "the kernel must be written to sector 2."
      Height          =   195
      Left            =   75
      TabIndex        =   15
      Top             =   2850
      Width           =   2655
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "boot sector: cylinder: 0, head: 0, sector: 1"
      Height          =   195
      Left            =   2715
      TabIndex        =   14
      Top             =   2145
      Width           =   2940
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "note: each sector has 512 bytes."
      Height          =   195
      Left            =   75
      TabIndex        =   13
      Top             =   2535
      Width           =   2325
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "head:"
      Height          =   195
      Left            =   3510
      TabIndex        =   12
      Top             =   1575
      Width           =   405
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "sector:"
      Height          =   195
      Left            =   210
      TabIndex        =   11
      Top             =   2010
      Width           =   480
   End
   Begin VB.Line Line2 
      X1              =   90
      X2              =   5805
      Y1              =   870
      Y2              =   870
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "cylinder:"
      Height          =   195
      Left            =   210
      TabIndex        =   10
      Top             =   1575
      Width           =   585
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "drive number:"
      Height          =   195
      Left            =   210
      TabIndex        =   9
      Top             =   1155
      Width           =   960
   End
   Begin VB.Label lblSectorsInBootFile 
      Height          =   240
      Left            =   1470
      TabIndex        =   8
      Top             =   570
      Width           =   3825
   End
   Begin VB.Line Line1 
      X1              =   90
      X2              =   5790
      Y1              =   2460
      Y2              =   2460
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "path to .bin/.boot file:"
      Height          =   195
      Left            =   90
      TabIndex        =   7
      Top             =   270
      Width           =   1515
   End
End
Attribute VB_Name = "frmWriteBinToFloppy"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'



Option Explicit


Private Sub cmdCancel_Click()
On Error Resume Next ' in case SetFocus error.
    Me.Hide
    frmEmulation.SetFocus
End Sub

Private Sub cmdGetFile_Click()

End Sub

'Private Sub cmdGetFile_Click()
'On Error GoTo err_getfile
'
'    Dim sFilename As String
'    Dim ts As String
'
'    ComDlg.hwndOwner = Me.hwnd
'    'ComDlg.FileNameD = ""
'
'    ' 1.23#268e
'    ts = s_MyBuild_Dir ' 2.05#545 Add_BackSlash(App.Path) & "MyBuild"
'    If myChDir(ts) Then
'        ComDlg.FileInitialDirD = ts
'    Else
'        ts = App.Path
'        If myChDir(ts) Then
'            ComDlg.FileInitialDirD = ts
'        End If
'    End If
'
'    ComDlg.Flags = OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT + OFN_PATHMUSTEXIST
'    ComDlg.Filter = "supported files (*.bin, *.boot)|*.bin;*.bin_;*.boot|binary files (*.bin)|*.bin;*.bin_|boot sector files (*.boot)|*.boot|all files (*.*)|*.*"
'    sFilename = ComDlg.ShowOpen
'
'    If sFilename = "" Then Exit Sub ' LOAD CANCELED.
'
'    txtPathToBinFile.Text = sFilename
'    txtPathToBinFile.SetFocus
'
'    Exit Sub
'err_getfile:
'    Debug.Print "cmdGetFile_Click: " & LCase(Err.Description)
'End Sub

Private Sub cmdWrite_Click()
On Error GoTo err_write

    Dim sSourceBinFile As String
    Dim lByteSize As Long
    Dim iSectors_to_Write As Integer
    
    sSourceBinFile = txtPathToBinFile.Text
    
    If Not FileExists(sSourceBinFile) Then
        mBox Me, cMT("bin file not found:") & " " & sSourceBinFile
        Exit Sub
    End If


    lByteSize = FileLen(sSourceBinFile)
    iSectors_to_Write = get_size_in_sectors(lByteSize)
    
    If iSectors_to_Write > 255 Then
        mBox Me, cMT("too many sectors! maximum: 255") & vbNewLine & cMT("use several bin files.")
        Exit Sub
    End If


    If Not virtual_drive_exists(comboDriveNumber.ListIndex) Then
        mBox Me, cMT("no drive number") & " " & comboDriveNumber.ListIndex & vbNewLine & cMT("create new drive first!")
        Exit Sub
    End If
    

    If MsgBox(cMT("is it ok to temporary load this file at address 0100:0000h before writing it to virtual floppy?"), vbYesNo + vbDefaultButton1, cMT("proceed?")) = vbYes Then
    
        frmEmulation.loadBinaryExecutable sSourceBinFile, &H100, 0, False, 655360, False    ' "655360" - limit to 640KB - no limit.
    
    
        frmEmulation.bSET_CF_ON_IRET = False  ' important!
        mDisk.write_sectors CByte(iSectors_to_Write), comboCylinder.ListIndex, comboSector.ListIndex + 1, comboHead.ListIndex, comboDriveNumber.ListIndex, &H1000, False

        If frmEmulation.bSET_CF_ON_IRET Then
            mBox Me, cMT("virtual floppy drive write error!")
        Else
            If iSectors_to_Write = 1 Then
                mBox Me, cMT("1 sector is written successfully!")
            Else
                mBox Me, iSectors_to_Write & " " & cMT("sectors are written successfully!")
            End If
        End If
        
        ' just in case:
        frmEmulation.bTERMINATED = True
        bSTOP_frmDEBUGLOG = True
    End If
    
    Exit Sub
err_write:
    mBox Me, cMT("error writing to virtual floppy drive!") & vbNewLine & LCase(Err.Description)
End Sub




Private Sub Form_Load()
   If Load_from_Lang_File(Me) Then Exit Sub
    
On Error GoTo err_fload
    Dim i As Integer
    
    '' set cylinders:
    comboCylinder.Clear
    
    For i = 0 To 79
        comboCylinder.AddItem i
    Next i
    
    comboCylinder.ListIndex = 0
    
    ''''''''''''''''''''''''''''''''
    
    comboDriveNumber.ListIndex = 0
    
    
    ''' set sectors:
    
    comboSector.Clear
    
    For i = 1 To 18
        comboSector.AddItem i
    Next i
    
    comboSector.ListIndex = 0
    
    ''''''''''''''''''''''''''''''
    
    comboHead.ListIndex = 0
    
    
    ' Me.Icon = frmMain.Icon

    
    Exit Sub
err_fload:
    Debug.Print "frmWriteBinToFloppy_Load: " & LCase(Err.Description)
End Sub

Private Sub txtPathToBinFile_Change()
On Error GoTo err_calc_sectors

    Dim lByteSize As Long

    If FileExists(txtPathToBinFile.Text) Then
        lByteSize = FileLen(txtPathToBinFile.Text)
        lblSectorsInBootFile.Caption = "Size: " & lByteSize & " bytes. Sectors: " & get_size_in_sectors(lByteSize)
    Else
        lblSectorsInBootFile.Caption = ""
    End If

    Exit Sub
err_calc_sectors:
    Debug.Print "txtPathToBinFile_Change: " & LCase(Err.Description)
    lblSectorsInBootFile.Caption = ""
End Sub

Private Function get_size_in_sectors(lByteSize As Long) As Integer
On Error GoTo err_gsis

Dim f1 As Single
Dim f2 As Single
Dim iResult As Integer

f2 = 512
f1 = CSng(lByteSize) / f2


f2 = Fix(f1)

' always fix up (7.3 -> 8)
If f1 > f2 Then
    iResult = CInt(f2) + 1
Else
    iResult = CInt(f2)
End If

get_size_in_sectors = iResult

Exit Function
err_gsis:
    Debug.Print "get_size_in_sectors: " & lByteSize & " : " & LCase(Err.Description)
    get_size_in_sectors = 0
    
End Function

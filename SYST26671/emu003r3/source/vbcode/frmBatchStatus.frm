VERSION 5.00
Begin VB.Form frmBatchStatus 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   1110
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3435
   Icon            =   "frmBatchStatus.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   1110
   ScaleWidth      =   3435
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "tab stub"
      Height          =   660
      Left            =   750
      TabIndex        =   0
      Top             =   2205
      Width           =   1680
   End
   Begin VB.CommandButton cmdStop 
      Caption         =   "stop"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   1297
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   780
      Width           =   840
   End
   Begin VB.Label lblHide 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "x"
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   6
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   150
      Left            =   3270
      TabIndex        =   5
      Top             =   45
      Width           =   120
   End
   Begin VB.Label lblVersion 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "emu8086 assembler emulator [version]"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   165
      Left            =   120
      TabIndex        =   4
      Top             =   90
      Width           =   2415
   End
   Begin VB.Label lblNote 
      BackStyle       =   0  'Transparent
      Caption         =   "To hide -> emu8086.ini: SILENT_ASSEMBLER=true"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   120
      TabIndex        =   3
      Top             =   555
      Width           =   3270
   End
   Begin VB.Shape shapeFrame 
      Height          =   1110
      Left            =   0
      Top             =   0
      Width           =   3435
   End
   Begin VB.Label lblStatus 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "file [i] out of [total]: [filename]"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   165
      Left            =   150
      TabIndex        =   1
      Top             =   330
      Width           =   1815
   End
End
Attribute VB_Name = "frmBatchStatus"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' #400b9-batch-window#

Option Explicit

Private Type RECT
  Left As Long
  Top As Long
  Right As Long
  Bottom As Long
End Type

Private Const SPI_GETWORKAREA& = 48

Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, lpvParam As Any, ByVal fuWinIni As Long) As Long
      




Private Sub cmdStop_Click()

On Error Resume Next

    Print #iASSEMBLER_LOG_FILE_NUMBER, "STOP: ============ TERMINATED BY STOP BUTTON ! ======= "
    Close #iASSEMBLER_LOG_FILE_NUMBER

    Reset
    
    bDO_NO_SAVE_OPTIONS = True
    END_PROGRAM True

    End      ' if still running, end unconditinally!

End Sub

Private Sub Form_Load()

On Error Resume Next



  Dim rc As RECT
  Dim msg As String
  
  Call SystemParametersInfo(SPI_GETWORKAREA, 0&, rc, 0&)
  
'  msg = "The coordinates indicating area not used by taskbars is:" & vbCrLf
'  msg = msg & "  left - " & rc.Left & vbCrLf
'  msg = msg & "  top  - " & rc.Top & vbCrLf
'  msg = msg & "  rght - " & rc.Right & vbCrLf
'  msg = msg & "  bttm - " & rc.Bottom & vbCrLf & vbCrLf
'
'  msg = msg & "To position full-screen, the syntax is:" & vbCrLf
'  msg = msg & "  Me.Move rc.Left * Screen.TwipsPerPixelX, _" & vbCrLf
'  msg = msg & "                  rc.Top * Screen.TwipsPerPixelY, _" & vbCrLf
'  msg = msg & "                  rc.Right * Screen.TwipsPerPixelX, _" & vbCrLf
'  msg = msg & "                  rc.Bottom * Screen.TwipsPerPixelY" & vbCrLf & vbCrLf
'
'  Text1.Text = msg



'''    Me.Left = Screen.Width - Me.Width
'''    Me.Top = Screen.Height - Me.Height


    Me.Left = rc.Right * Screen.TwipsPerPixelX - Me.Width
    Me.Top = rc.Bottom * Screen.TwipsPerPixelY - Me.Height
    

    
End Sub

Private Sub lblHide_Click()
On Error Resume Next
    Me.Hide
End Sub

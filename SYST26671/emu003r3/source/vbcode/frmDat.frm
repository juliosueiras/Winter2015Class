VERSION 5.00
Begin VB.Form frmDat 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "8086 emulator"
   ClientHeight    =   1680
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5715
   BeginProperty Font 
      Name            =   "Terminal"
      Size            =   9
      Charset         =   255
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmDat.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MousePointer    =   11  'Hourglass
   ScaleHeight     =   1680
   ScaleWidth      =   5715
   StartUpPosition =   2  'CenterScreen
   Begin VB.ListBox lst_opNames 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   960
      ItemData        =   "frmDat.frx":038A
      Left            =   4320
      List            =   "frmDat.frx":08AA
      TabIndex        =   5
      Top             =   480
      Visible         =   0   'False
      Width           =   1185
   End
   Begin VB.ListBox lst_Opcodes1 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   960
      ItemData        =   "frmDat.frx":207C
      Left            =   3000
      List            =   "frmDat.frx":259C
      TabIndex        =   4
      Top             =   360
      Visible         =   0   'False
      Width           =   1230
   End
   Begin VB.ListBox lst_EA_TCONST 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   510
      ItemData        =   "frmDat.frx":379A
      Left            =   240
      List            =   "frmDat.frx":37FE
      TabIndex        =   3
      Top             =   840
      Visible         =   0   'False
      Width           =   2640
   End
   Begin VB.Frame Frame1 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1650
      Left            =   30
      MousePointer    =   11  'Hourglass
      TabIndex        =   0
      Top             =   -30
      Width           =   5625
      Begin VB.PictureBox picIcon 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         ClipControls    =   0   'False
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   480
         Left            =   2520
         Picture         =   "frmDat.frx":3CE2
         ScaleHeight     =   337.12
         ScaleMode       =   0  'User
         ScaleWidth      =   337.12
         TabIndex        =   6
         Top             =   720
         Width           =   480
      End
      Begin VB.Label lblLaunching 
         Alignment       =   2  'Center
         Caption         =   "launching..."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   120
         TabIndex        =   2
         Top             =   1320
         Width           =   5460
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "microprocessor emulator and 8086 assembler"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   5460
      End
   End
End
Attribute VB_Name = "frmDat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'





Option Explicit

' lists on this form are updated,
' instructions not for 8086 are
' removed, opcodes separated to 3 arrays
' in mDat.bas!

Private Sub Form_Load()
On Error Resume Next ' 4.00-Beta-3

    lblLaunching.Caption = cMT(lblLaunching)

    DoEvents

    ' #400b4-update3-bug-scr#
'    Dim s As String
'    s = get_property("emu8086.ini", "FIX_SMALL_FONTS", "true")
'    If StrComp(s, "true", vbTextCompare) = 0 Then
        ' #400b4-mini-8#
        Dim fff As Single
        fff = Fix(Me.TextWidth("E"))
        ' Debug.Print "TERMINAL 9= " & fff & " twips."
        If fff < 120 Then ' 120 twips = 8  pixels
            SHOULD_DO_MINI_FIX_8 = True
           ' Debug.Print "SHOULD_DO_MINI_FIX_8: ALL TERMINAL FONTS SET TO 12!"
        Else
            SHOULD_DO_MINI_FIX_8 = False
        End If
'    End If
    
    
End Sub


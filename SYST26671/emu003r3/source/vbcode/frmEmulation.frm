VERSION 5.00
Begin VB.Form frmEmulation 
   Caption         =   "8086 microprocessor emulator"
   ClientHeight    =   5760
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8475
   Icon            =   "frmEmulation.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   OLEDropMode     =   1  'Manual
   ScaleHeight     =   5760
   ScaleWidth      =   8475
   StartUpPosition =   3  'Windows Default
   Begin VB.HScrollBar scrollStepDelay 
      Height          =   255
      Left            =   6570
      Max             =   1000
      Min             =   1
      TabIndex        =   60
      Top             =   120
      Value           =   1
      Width           =   1455
   End
   Begin VB.PictureBox picLOADING 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H00FFFFFF&
      Height          =   1725
      Left            =   2910
      ScaleHeight     =   1695
      ScaleWidth      =   3255
      TabIndex        =   52
      TabStop         =   0   'False
      Top             =   2025
      Visible         =   0   'False
      Width           =   3285
      Begin VB.CommandButton cmdStopLoading 
         Caption         =   "cancel..."
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   840
         TabIndex        =   54
         TabStop         =   0   'False
         Top             =   1350
         Width           =   1500
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "please wait...."
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   435
         Left            =   60
         TabIndex        =   59
         Top             =   540
         Width           =   3120
      End
   End
   Begin VB.TextBox txtDisAddr 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   5670
      TabIndex        =   58
      Text            =   "0000:0000"
      Top             =   810
      Width           =   1620
   End
   Begin VB.PictureBox picDisList 
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   9
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   3945
      Left            =   5115
      ScaleHeight     =   259
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   171
      TabIndex        =   56
      Top             =   1200
      Width           =   2625
      Begin VB.VScrollBar scrollDis 
         Height          =   3825
         Left            =   2280
         TabIndex        =   57
         TabStop         =   0   'False
         Tag             =   "17000"
         Top             =   60
         Value           =   17000
         Width           =   240
      End
   End
   Begin VB.Timer timer_CLOSE_frmDebugLog 
      Enabled         =   0   'False
      Interval        =   777
      Left            =   5955
      Top             =   4905
   End
   Begin VB.PictureBox picDragger 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3870
      Left            =   4470
      MousePointer    =   9  'Size W E
      ScaleHeight     =   3870
      ScaleWidth      =   75
      TabIndex        =   53
      Top             =   1200
      Width           =   75
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "reset"
      Height          =   375
      Left            =   3488
      TabIndex        =   26
      ToolTipText     =   "reset emulator: restore interrupt vector, close all file handles, clear screen and reload the program"
      Top             =   5265
      Width           =   705
   End
   Begin VB.CommandButton cmdVars 
      Caption         =   "vars"
      Height          =   375
      Left            =   5026
      TabIndex        =   28
      ToolTipText     =   "show defined variables, arrays and strings"
      Top             =   5265
      Width           =   720
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "step back"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   585
      Left            =   2544
      Picture         =   "frmEmulation.frx":038A
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   30
      UseMaskColor    =   -1  'True
      Width           =   1170
   End
   Begin VB.FileListBox File1 
      Height          =   675
      Left            =   3570
      TabIndex        =   51
      Top             =   2745
      Visible         =   0   'False
      Width           =   840
   End
   Begin VB.TextBox txtIntegratedMemoryAddr 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   2340
      TabIndex        =   22
      Text            =   "0000:0000"
      Top             =   810
      Width           =   1620
   End
   Begin VB.Timer timerINT15_86 
      Enabled         =   0   'False
      Left            =   3915
      Top             =   1050
   End
   Begin VB.CommandButton cmdReload 
      Caption         =   "reload"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   585
      Left            =   1297
      Picture         =   "frmEmulation.frx":08CC
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   30
      UseMaskColor    =   -1  'True
      Width           =   1170
   End
   Begin VB.Timer timerStartTurboMode 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   6960
      Top             =   510
   End
   Begin VB.CommandButton cmdStack 
      Caption         =   "stack"
      Height          =   375
      Left            =   6594
      TabIndex        =   29
      ToolTipText     =   "memory at SS:SP from bottom to top"
      Top             =   5265
      Width           =   765
   End
   Begin VB.CommandButton cmdFlags 
      Caption         =   "flags"
      Height          =   375
      Left            =   7425
      TabIndex        =   30
      ToolTipText     =   "show flags register"
      Top             =   5265
      Width           =   765
   End
   Begin VB.CommandButton cmdALU 
      Caption         =   "aux"
      Height          =   375
      Left            =   4257
      TabIndex        =   27
      ToolTipText     =   "auxiliary tools"
      Top             =   5265
      Width           =   705
   End
   Begin VB.CheckBox chkAutoStep 
      Caption         =   "run"
      DownPicture     =   "frmEmulation.frx":0E0E
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   585
      Left            =   5040
      Picture         =   "frmEmulation.frx":0EC8
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   30
      UseMaskColor    =   -1  'True
      Width           =   1170
   End
   Begin VB.CommandButton cmdDOS 
      Caption         =   "screen"
      Height          =   375
      Left            =   1845
      TabIndex        =   25
      ToolTipText     =   "emulator virtual screen"
      Top             =   5265
      Width           =   810
   End
   Begin VB.Frame fraRegisters 
      Caption         =   " registers "
      Height          =   4875
      Left            =   45
      TabIndex        =   31
      Top             =   780
      Width           =   1725
      Begin VB.TextBox txtCH 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   675
         MaxLength       =   2
         TabIndex        =   9
         Text            =   "00"
         Top             =   1080
         Width           =   420
      End
      Begin VB.TextBox txtAL 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   1110
         MaxLength       =   2
         TabIndex        =   6
         Text            =   "00"
         Top             =   375
         Width           =   420
      End
      Begin VB.TextBox txtAH 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   675
         MaxLength       =   2
         TabIndex        =   5
         Text            =   "00"
         Top             =   375
         Width           =   420
      End
      Begin VB.TextBox txtBL 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   1110
         MaxLength       =   2
         TabIndex        =   8
         Text            =   "00"
         Top             =   735
         Width           =   420
      End
      Begin VB.TextBox txtBH 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   675
         MaxLength       =   2
         TabIndex        =   7
         Text            =   "00"
         Top             =   735
         Width           =   420
      End
      Begin VB.TextBox txtCL 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   1110
         MaxLength       =   2
         TabIndex        =   10
         Text            =   "00"
         Top             =   1080
         Width           =   420
      End
      Begin VB.TextBox txtDL 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   1110
         MaxLength       =   2
         TabIndex        =   12
         Text            =   "00"
         Top             =   1425
         Width           =   420
      End
      Begin VB.TextBox txtDH 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   675
         MaxLength       =   2
         TabIndex        =   11
         Text            =   "00"
         Top             =   1425
         Width           =   420
      End
      Begin VB.TextBox txtES 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   780
         MaxLength       =   4
         TabIndex        =   21
         Text            =   "0000"
         Top             =   4470
         Width           =   670
      End
      Begin VB.TextBox txtBP 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   780
         MaxLength       =   4
         TabIndex        =   17
         Text            =   "0000"
         Top             =   3139
         Width           =   670
      End
      Begin VB.TextBox txtDS 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   780
         MaxLength       =   4
         TabIndex        =   20
         Text            =   "0000"
         Top             =   4132
         Width           =   670
      End
      Begin VB.TextBox txtDI 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   780
         MaxLength       =   4
         TabIndex        =   19
         Text            =   "0000"
         Top             =   3801
         Width           =   670
      End
      Begin VB.TextBox txtSI 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   780
         MaxLength       =   4
         TabIndex        =   18
         Text            =   "0000"
         Top             =   3470
         Width           =   670
      End
      Begin VB.TextBox txtSP 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   780
         MaxLength       =   4
         TabIndex        =   16
         Text            =   "0000"
         Top             =   2808
         Width           =   670
      End
      Begin VB.TextBox txtSS 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   780
         MaxLength       =   4
         TabIndex        =   15
         Text            =   "0000"
         Top             =   2477
         Width           =   670
      End
      Begin VB.TextBox txtIP 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   780
         MaxLength       =   4
         TabIndex        =   14
         Text            =   "0000"
         Top             =   2146
         Width           =   670
      End
      Begin VB.TextBox txtCS 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   780
         MaxLength       =   4
         TabIndex        =   13
         Text            =   "0000"
         Top             =   1815
         Width           =   670
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "CX"
         Height          =   195
         Index           =   2
         Left            =   285
         TabIndex        =   46
         ToolTipText     =   "Counter"
         Top             =   1148
         Width           =   210
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "ES"
         Height          =   195
         Index           =   12
         Left            =   285
         TabIndex        =   45
         ToolTipText     =   "Extended Segment"
         Top             =   4538
         Width           =   210
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "BP"
         Height          =   195
         Index           =   10
         Left            =   285
         TabIndex        =   44
         ToolTipText     =   "Base Pointer"
         Top             =   3186
         Width           =   210
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "DS"
         Height          =   195
         Index           =   11
         Left            =   285
         TabIndex        =   43
         ToolTipText     =   "Data Segment"
         Top             =   4197
         Width           =   225
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "DI"
         Height          =   195
         Index           =   9
         Left            =   285
         TabIndex        =   42
         ToolTipText     =   "Destination Index"
         Top             =   3860
         Width           =   165
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "SI"
         Height          =   195
         Index           =   8
         Left            =   285
         TabIndex        =   41
         ToolTipText     =   "Source Index"
         Top             =   3523
         Width           =   150
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "SP"
         Height          =   195
         Index           =   7
         Left            =   285
         TabIndex        =   40
         ToolTipText     =   "Stack Pointer"
         Top             =   2849
         Width           =   210
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "SS"
         Height          =   195
         Index           =   6
         Left            =   285
         TabIndex        =   39
         ToolTipText     =   "Stack Segment"
         Top             =   2512
         Width           =   210
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "IP"
         Height          =   195
         Index           =   5
         Left            =   285
         TabIndex        =   38
         ToolTipText     =   "Instruction Pointer"
         Top             =   2175
         Width           =   150
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "CS"
         Height          =   195
         Index           =   4
         Left            =   285
         TabIndex        =   37
         ToolTipText     =   "Code Segment"
         Top             =   1860
         Width           =   210
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "DX"
         Height          =   195
         Index           =   3
         Left            =   285
         TabIndex        =   36
         ToolTipText     =   "Data register"
         Top             =   1493
         Width           =   225
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "BX"
         Height          =   195
         Index           =   1
         Left            =   285
         TabIndex        =   35
         ToolTipText     =   "Base address"
         Top             =   803
         Width           =   210
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "L"
         Height          =   195
         Left            =   1245
         TabIndex        =   34
         ToolTipText     =   "Low Byte"
         Top             =   180
         Width           =   90
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "H"
         Height          =   195
         Left            =   810
         TabIndex        =   33
         ToolTipText     =   "High Byte"
         Top             =   180
         Width           =   120
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "AX"
         Height          =   195
         Index           =   0
         Left            =   285
         TabIndex        =   32
         ToolTipText     =   "Accumulator"
         Top             =   458
         Width           =   210
      End
   End
   Begin VB.CommandButton cmdStep 
      Caption         =   "single step"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   585
      Left            =   3791
      Picture         =   "frmEmulation.frx":140A
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   30
      UseMaskColor    =   -1  'True
      Width           =   1170
   End
   Begin VB.CommandButton cmdLoad 
      Caption         =   "Load"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   585
      Left            =   50
      Picture         =   "frmEmulation.frx":194C
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   30
      UseMaskColor    =   -1  'True
      Width           =   1170
   End
   Begin VB.Timer timerStep 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   6465
      Top             =   525
   End
   Begin VB.PictureBox picWaitingForInput 
      BackColor       =   &H0000FFFF&
      BorderStyle     =   0  'None
      Height          =   615
      Left            =   3735
      ScaleHeight     =   615
      ScaleWidth      =   2505
      TabIndex        =   47
      Top             =   15
      Visible         =   0   'False
      Width           =   2500
      Begin VB.CommandButton cmdStopInput 
         Caption         =   "stop"
         Height          =   285
         Left            =   1965
         TabIndex        =   50
         Top             =   30
         Width           =   495
      End
      Begin VB.Label lblWaitingForInput 
         Alignment       =   2  'Center
         BackColor       =   &H0000FFFF&
         BackStyle       =   0  'Transparent
         Caption         =   "waiting for input"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   105
         TabIndex        =   48
         Top             =   180
         Width           =   1830
      End
   End
   Begin VB.PictureBox picMemList 
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   9
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   3945
      Left            =   1815
      ScaleHeight     =   259
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   171
      TabIndex        =   23
      Top             =   1200
      Width           =   2625
      Begin VB.VScrollBar scrollMem 
         Height          =   3825
         Left            =   2280
         TabIndex        =   24
         TabStop         =   0   'False
         Tag             =   "17000"
         Top             =   60
         Value           =   17000
         Width           =   240
      End
   End
   Begin VB.Label lblHW_INTERRUPT 
      AutoSize        =   -1  'True
      BackColor       =   &H000000FF&
      Caption         =   " hardware interrupt: NN "
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   165
      Left            =   4110
      TabIndex        =   55
      Top             =   765
      Visible         =   0   'False
      Width           =   1425
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   45
      X2              =   8145
      Y1              =   675
      Y2              =   675
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000014&
      X1              =   45
      X2              =   8130
      Y1              =   690
      Y2              =   690
   End
   Begin VB.Label lblStepTime 
      Alignment       =   2  'Center
      Caption         =   "step delay: 1"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   6300
      TabIndex        =   49
      Top             =   420
      Width           =   1980
   End
   Begin VB.Menu popLoad 
      Caption         =   "file"
      Visible         =   0   'False
      Begin VB.Menu mnuLoad 
         Caption         =   "load executable..."
      End
      Begin VB.Menu mnuReLoad 
         Caption         =   "reload"
      End
      Begin VB.Menu mnuDelimter71345 
         Caption         =   "-"
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
            Caption         =   "LED display"
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
      Begin VB.Menu mnuDelimeter3321 
         Caption         =   "-"
      End
      Begin VB.Menu mnuResetEmulator_and_RAM 
         Caption         =   "reset emulator and ram"
      End
      Begin VB.Menu mnuDELIMITER_0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCommandLineParameters 
         Caption         =   "set command line parameters"
      End
      Begin VB.Menu mnuDelimeter 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSaveCurrentState 
         Caption         =   "save the emulator's state"
      End
      Begin VB.Menu mnuLoadPreviousState 
         Caption         =   "load from previous state"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuDelimeter8981 
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
      Begin VB.Menu mnuDelimeter6126 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "close the emulator"
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
   Begin VB.Menu mnuDebug 
      Caption         =   "debug"
      Visible         =   0   'False
      Begin VB.Menu mnuSingleStep 
         Caption         =   "single step"
      End
      Begin VB.Menu mnuStepOver 
         Caption         =   "step over"
      End
      Begin VB.Menu mnuDelimeter61234 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSingleStepBack 
         Caption         =   "step back"
      End
      Begin VB.Menu mnuDelimeter1000 
         Caption         =   "-"
      End
      Begin VB.Menu mnuStopOnCondition 
         Caption         =   "stop on condition..."
      End
      Begin VB.Menu mnuDelimeter1001 
         Caption         =   "-"
      End
      Begin VB.Menu mnuRunUntilSelected 
         Caption         =   "run until (...)"
      End
      Begin VB.Menu mnuRun 
         Caption         =   "run"
      End
      Begin VB.Menu mnuStop 
         Caption         =   "stop"
      End
      Begin VB.Menu mnuDelimeter3123 
         Caption         =   "-"
      End
      Begin VB.Menu mnu_Set_BreakPoint 
         Caption         =   "set break point (...)"
      End
      Begin VB.Menu mnu_Clear_BreakPoint 
         Caption         =   "clear break point"
      End
      Begin VB.Menu mnuShowBreakPoint 
         Caption         =   "show current break point"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuDelimeter4235432 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSelect_lines_at_CS_IP 
         Caption         =   "show current instruction (at CS:IP)"
      End
      Begin VB.Menu mnuDelimeter734 
         Caption         =   "-"
      End
      Begin VB.Menu mnu_set_CS_IP_to_selected 
         Caption         =   "set CS:IP to selected position (????:????)"
      End
   End
   Begin VB.Menu mnuView 
      Caption         =   "view"
      Visible         =   0   'False
      Begin VB.Menu mnuDebugLog 
         Caption         =   "log and debug.exe emulation"
      End
      Begin VB.Menu mnuDelimeters7750 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExtendedRegisterView 
         Caption         =   "extended value viewer"
      End
      Begin VB.Menu mnuDelim6123 
         Caption         =   "-"
      End
      Begin VB.Menu mnuStack 
         Caption         =   "stack"
      End
      Begin VB.Menu mnuDelimeter123 
         Caption         =   "-"
      End
      Begin VB.Menu mnuVariables 
         Caption         =   "variables"
      End
      Begin VB.Menu mnuExternalMemoryViewer 
         Caption         =   "memory"
      End
      Begin VB.Menu mnuDelimeter00001 
         Caption         =   "-"
      End
      Begin VB.Menu mnuShowSymbolTable 
         Caption         =   "symbol table"
      End
      Begin VB.Menu mnuShowListing 
         Caption         =   "listing"
      End
      Begin VB.Menu mnuDelimeter00002 
         Caption         =   "-"
      End
      Begin VB.Menu mnuActualSource 
         Caption         =   "original source code"
      End
      Begin VB.Menu mnuDelimete37723 
         Caption         =   "-"
      End
      Begin VB.Menu mnuOptions 
         Caption         =   "options"
      End
      Begin VB.Menu mnuDelimeter61123 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAlu 
         Caption         =   "arithmetic && logical unit"
      End
      Begin VB.Menu mnuDelimeter7134 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFlags 
         Caption         =   "flags"
      End
      Begin VB.Menu mnuDelimeter634 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFlagAnalyzer 
         Caption         =   "lexical flag analyzer"
      End
      Begin VB.Menu mnuDelimeter824 
         Caption         =   "-"
      End
      Begin VB.Menu mnuASCII 
         Caption         =   "ascii codes"
      End
      Begin VB.Menu mnudelim7752 
         Caption         =   "-"
      End
      Begin VB.Menu mnuUserScreen 
         Caption         =   "emulator screen"
      End
   End
   Begin VB.Menu mnuExternal 
      Caption         =   "external"
      Visible         =   0   'False
      Begin VB.Menu mnuMS_DEBUG 
         Caption         =   "start debug.exe (external)"
      End
      Begin VB.Menu mnuDelimeters61234 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCommandPrompt 
         Caption         =   "command prompt (external)"
      End
      Begin VB.Menu mnuDelimeters7771 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExternalRun 
         Caption         =   "run (external)"
      End
   End
   Begin VB.Menu mnuVirtualDevices 
      Caption         =   "virtual devices"
      Visible         =   0   'False
      Begin VB.Menu mnuExternalDevice 
         Caption         =   ""
         Index           =   0
         Visible         =   0   'False
      End
      Begin VB.Menu mnuDelimeter7843 
         Caption         =   "-"
      End
   End
   Begin VB.Menu mnuDrive 
      Caption         =   "virtual drive"
      Visible         =   0   'False
      Begin VB.Menu mnuBootFromFloppy 
         Caption         =   "boot from virtual floppy"
         Begin VB.Menu mnuBoot_from_FLOPPY_X 
            Caption         =   "FLOPPY_0"
            Index           =   0
         End
         Begin VB.Menu mnuBoot_from_FLOPPY_X 
            Caption         =   "FLOPPY_1"
            Index           =   1
         End
         Begin VB.Menu mnuBoot_from_FLOPPY_X 
            Caption         =   "FLOPPY_2"
            Index           =   2
         End
         Begin VB.Menu mnuBoot_from_FLOPPY_X 
            Caption         =   "FLOPPY_3"
            Index           =   3
         End
      End
      Begin VB.Menu mnuDelimeter5312 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWriteBootRecord 
         Caption         =   "write 512 bytes at 0000:7c00 to boot sector"
         Begin VB.Menu mnuWriteBootRecord_FLOPPY_X 
            Caption         =   "FLOPPY_0"
            Index           =   0
         End
         Begin VB.Menu mnuWriteBootRecord_FLOPPY_X 
            Caption         =   "FLOPPY_1"
            Index           =   1
         End
         Begin VB.Menu mnuWriteBootRecord_FLOPPY_X 
            Caption         =   "FLOPPY_2"
            Index           =   2
         End
         Begin VB.Menu mnuWriteBootRecord_FLOPPY_X 
            Caption         =   "FLOPPY_3"
            Index           =   3
         End
      End
      Begin VB.Menu mnuWriteBinFileToFloppy 
         Caption         =   "write '.bin' file to floppy..."
      End
      Begin VB.Menu mnuDelimter51 
         Caption         =   "-"
      End
      Begin VB.Menu mnuMakeEmptyFloppy 
         Caption         =   "create new floppy drive"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "help"
      Visible         =   0   'False
      Begin VB.Menu mnuHelpTopics 
         Caption         =   "documentation and tutorials"
      End
      Begin VB.Menu mnuDelimeter1 
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
   Begin VB.Menu mnuAUX 
      Caption         =   "aux"
      Visible         =   0   'False
      Begin VB.Menu mnuMemory_AUX 
         Caption         =   "memory"
      End
      Begin VB.Menu mnuAlu_AUX 
         Caption         =   "ALU"
      End
      Begin VB.Menu mnuAUX_FPU 
         Caption         =   "FPU"
      End
      Begin VB.Menu mnuAUX_stop_on_condition 
         Caption         =   "stop on condition"
      End
      Begin VB.Menu mnuDelimeter00211 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSymbol_AUX 
         Caption         =   "symbol table"
      End
      Begin VB.Menu mnuListing_AUX 
         Caption         =   "listing"
      End
   End
End
Attribute VB_Name = "frmEmulation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False




Option Explicit


' #404b-start-multi#
' version 4.04b
' 2007-06-02 allow starting several devices using #start=.." directive!!
Dim lLastLineChecked As Long


' #400b6-int21h_33h_23h#
Public byteBREAK_FLAG As Byte


' #400-emu-state#
' moved out of  loadFILEtoEMULATE()
' to enable shared use
Dim b_frmMemory_was_forced_unload As Boolean  ' 3.05 BUG FIX (see Version.txt) ??? what ever it is :-)
Dim s_frmMemory_txtMemoryAddr As String
    

' #400-emu-state#
Const EMU_STATE_FILE As String = "emulator.state"



'useless ' Dim bLOADING_FILE_TO_EMULATOR As Boolean ' should help ! #327s-load-in-input-mode-bug#


Dim b_scrollMem_correction As Boolean ' 4.00
Dim b_scrollDis_correction As Boolean ' 4.00


' v 3.27p
Dim ssDraggerLeft As Single


' taken back!
'''' used to stop after INT 20h, MOV AH, 4ch | INT 21h, and MOV AH, 0h | INT 21h,
'''' but enables to finish IRET
'''Dim bSTOP_ON_THE_NEXT_STEP As Boolean  ' #1073
'''Dim bSTOP_ON_THE_NEXT_STEP_2 As Boolean  ' #1073


Dim bDO_NOT_RESET_bRun_UNTIL As Boolean ' #1067

' 1.25#339
Dim bRUN_AFTER_RELOAD As Boolean

' 2.51#714
Dim bTURBO_MODE As Boolean

' 1.20
'' break points
Dim break_point_FLAG As Boolean

' #327xr-400-new-mem-list#
''''Dim break_point_IP As Integer
''''Dim break_point_CS As Integer
Dim lBREAK_POINT_ADDR As Long

' 1.17
' is used to stop any activities that
' could be executed after loop with DoEvents:
Public bSTOP_EVERYTHING As Boolean


' 1.17
' to set CF after exiting from interupt,
' since INT instruction pushes flag
' register, and IRET pops it, we
' should set it after IRET pops the flag
' register:
Public bSET_CF_ON_IRET As Boolean
Public bCLEAR_CF_ON_IRET As Boolean

Public bSET_ZF_ON_IRET As Boolean
Public bCLEAR_ZF_ON_IRET As Boolean


' 1.12
Dim floppyDriveNumber As Byte

' 1.11 (1.12)
' used for loading ".BIN" files:
Dim iSEGMENT_for_BIN As Integer
Dim iOFFSET_for_BIN As Integer
Dim storebuffer8bit(0 To 7) As Byte
Dim storebuffer16bit(0 To 8) As Integer


' 1.07
Public lPROG_LOADED_AT_ADR As Long ' segment only! (already x 16 !!)
Public lPROG_LOADED_AT_OFFSET As Long ' offset. #327q2e#.

' 3.27w - probably a major bug fix... sometimes the interface may become scrued...
'          however I found it in vb only...
'''' 1.02
'''Dim constr_txtDECODED_W As Single
'''Dim constr_txtDECODED_H As Single

Dim sDefaultCaption As String
' keeps the full path of opened file:
Public sOpenedExecutable As String



'r1:
Dim bSHOWING_REGISTERS As Boolean


'================================
' for:
'   F3          REP
'   F3          REPE
'   F3          REPZ
Dim bDoREP As Boolean
' for:
'   F2          REPNE
'   F2          REPNZ
Dim bDoREPNE As Boolean
'================================

'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
' -------- REGISTERS! ---------------------------
Dim AL As Byte
Dim AH As Byte
Dim BL As Byte
Dim BH As Byte
Dim CL As Byte
Dim CH As Byte
Dim DL As Byte
Dim DH As Byte

Dim DS As Integer
Dim ES As Integer

Dim SI As Integer
Dim DI As Integer

Dim BP As Integer

Dim CS As Integer
Dim IP As Integer

Dim SS As Integer
Dim SP As Integer
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

' current command pointer:
Dim curByte As Long     ' CS * 16 + IP

' string representation of the command:
'[SDEC_DEBUG_v120] Dim sDECODED As String

' set to TRUE when DS is replaced by other segment:
Dim bSEGMENT_REPLACEMENT As Boolean
Dim sSEGMENT_REPLACEMENT_NAME As String

' False when program runs, True when stops:
Public bTERMINATED As Boolean

' True when result is stored (ADD, SUB...)
' and False when it's not stored (CMP, TEST...)
Dim bSTORE_RESULT As Boolean

' 1.04

Public bCOM_LOADED As Boolean



' #327xr-400-new-mem-list# ' Dim iLast_MOUSE_DOWN_ON_MEM_LIST As Integer
' #400-dissasembly# ' Dim iLast_MOUSE_DOWN_ON_DIS_LIST As Integer


' #327u-loadhuge#
Dim bSTOP_LOADING As Boolean
















'
'
' #327u-loadhuge#
Private Sub cmdStopLoading_Click()
On Error Resume Next ' 4.00-Beta-3
    bSTOP_LOADING = True
End Sub



Private Sub Form_Activate()
On Error Resume Next
    
    ' #400b4-mini-8#
    If SHOULD_DO_MINI_FIX_8 Then
    
        If picDisList.Font.Size < 12 Then
            picMemList.Font.Size = 12
            picDisList.Font.Size = 12
            refreshMemoryList
            refreshDisassembly
        End If
        
        ' #400b4-update3-bug-scr#
        ' the screen is udpated here too to avoid conflicts!
        If frmScreen.picSCREEN.Font.Size < 12 Then
            If Not boolGRAPHICS_VIDEO_MODE Then
                frmScreen.picSCREEN.Font.Size = 12
                frmScreen.setSCREEN_W_H
                frmScreen.set_VIDEO_MODE byteCURRENT_VIDEO_MODE
                frmScreen.VMEM_TO_SCREEN
            End If
        End If
        
    End If
    
End Sub

Private Sub Form_Click()
Debug.Print timerStep.Interval
End Sub

' 2.02#514
' OLEDropMode of object should be set to 1 in order
' this sub to work!
' the same code is in frmMain
Private Sub Form_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)

On Error GoTo err_dd

'#1186
'''''If Data.GetFormat(vbCFFiles) Then
'''''
'''''    If Data.Files.Count > 0 Then
'''''
'''''        ' process like command line parameter:
'''''        PROCESS_CMD_Line Data.Files.Item(1)
'''''
'''''    End If
'''''
'''''End If

    ' process like PROCESS_CMD_Line()...  '#1186
    Dim sTemp1186 As String
    
    sTemp1186 = Data.Files.Item(1)
    
    sTemp1186 = Trim(sTemp1186)
        
    If (Chr(34) = Mid(sTemp1186, 1, 1)) Then
          sTemp1186 = Mid(sTemp1186, 2, Len(sTemp1186) - 2)
    End If
       
    loadFILEtoEMULATE sTemp1186 '#1186


Exit Sub
err_dd:
    Debug.Print "frmEmulation_OLEDragDrop: " & LCase(Err.Description)
End Sub


Private Sub cmdALU_Click()
On Error Resume Next
  PopupMenu mnuAUX
End Sub

Private Sub cmdFlags_Click()
On Error Resume Next
    frmFLAGS.Show ' cannot be minimized, so just show.
End Sub

Private Sub cmdLoad_Click()
On Error Resume Next ' 4.00-Beta-3
    bAlwaysNAG = True
    loadFILEtoEMULATE ""
End Sub

Private Sub cmdLoad_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next ' 4.00-Beta-3
    If Button = vbRightButton Then
        PopupMenu popLoad
    End If
End Sub

Private Sub cmdReload_Click()
On Error Resume Next ' 4.00-Beta-3
    mnuReLoad_Click
End Sub

Private Sub cmdReload_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next ' 4.00-Beta-3
    If Button = vbRightButton Then
        PopupMenu popLoad
    End If
End Sub

'Private Sub cmdShowActualSource_Click()
'
'On Error GoTo err1
'
'    Dim bTemp As Boolean ' to store original value of bKEEP_DEBUG_LOG.
'
'    frmOrigCode.DoShowMe
'
'    ' 1.21 no need to add to log:
'    bTemp = bKEEP_DEBUG_LOG
'    bKEEP_DEBUG_LOG = False
'
'    show_Registers ' just to make call of selectNextLineToBeExecuted().
'
'    bKEEP_DEBUG_LOG = bTemp
'
'  '  b_DONOT_frmOrigCode_ACTIVATE = False ' jic
'
'    Exit Sub
'err1:
'    Debug.Print "ERR:##1297 : " & Err.Description
'    On Error Resume Next
'
'End Sub

' 1.10
Private Sub cmdStack_Click()
On Error Resume Next
    frmStack.DoShowMe
End Sub

Private Sub cmdStep_Click()
    
On Error GoTo err1
    
' decided not to show, to avoid confusions...
'''    ' #327w-debug-emulation#
'''    If bKEEP_DEBUG_LOG Then
'''        If Not endsWith(frmDebugLog.txtLog.Text, "-p" & vbNewLine) Then
'''            frmDebugLog.show_current_command "t"
'''        End If
'''    End If
    
    
    
    If bTERMINATED Then
       If ask_TO_RELOAD Then ' 4.00 (if added)
          Exit Sub ' don't do step after question / reload.
       End If
    End If
    
    If Not cmdStep.Enabled Then Exit Sub ' 2005-07-18 anti-glitch check
    cmdStep.Enabled = False    ' 2005-07-18 anti-glitch check
    
    
    ' 1.27#338
    ' when doing single steps the "User Screen" should be activated after
    '   any modification of video memory (I think, it will be better).
    frmScreen.bFIRST_TIME_SHOW_SCREEN = True
    
    ' the same for devices:
    '#1144 reset_SHOWN_FIRST_TIME_for_DEVICES
    
     
    If (chkAutoStep.Value = vbChecked) Then ' #1025
                
        stop_everything
    
    Else
    
        ' #327u-hw-int#
        If frmFLAGS.cbIF.ListIndex = 1 Then check_for_harware_interrupt
    
        PROCESS_SINGLE_STEP
        
    End If
    
    cmdStep.Enabled = True ' 2005-07-18 anti-glitch check
    
    
    Exit Sub
err1:
    Debug.Print "ERR:##1277 : " & Err.Description
    
End Sub

Private Sub stop_everything()

On Error GoTo err1

            bSTOP_frmDEBUGLOG = True


            ' copied from "Load_File_TO_Emulate"
                        

                        
            '  1.17 ====== reset some activities ====
            ' (just in case)
        
            ' make sure nothing will be done after
            ' exiting the loop with DoEvents:
            bSTOP_EVERYTHING = True
        
            timerStep.Enabled = False
            bTURBO_MODE = False
            
            chkAutoStep.Value = vbUnchecked
            
            timerINT15_86.Enabled = False
            
            frmScreen.stopTimerInput
        
            uCHARS_IN_KB_BUFFER = 0
            frmScreen.show_uKB_BUFFER ' #1114
            
            ' should not do it here, since loops may not
            ' exit yet!!!
            ''''
            ''''    ' allow doing some code after loops
            ''''    ' DoEvents:
            ''''    bSTOP_EVERYTHING = False
            
            ' 1.20
            frmScreen.bFIRST_TIME_SHOW_SCREEN = True
            
            ' 1.25
            '#1144 reset_SHOWN_FIRST_TIME_for_DEVICES
            
            
            ' 1.20 #119b
            frmScreen.setDefaultCursorType
        
            ' 1.21 (because we exit from inputChar_NOECHO() before doing this
            '       on QueryUnload() because it causes form to be loaded again):
            picWaitingForInput.Visible = False
            cmdStep.Visible = True
            chkAutoStep.Visible = True
            
            
            ' 1.24 reset some globals:
            bDO_STOP_AT_LINE_HIGHLIGHT_CHANGE = False
            bDO_STEP_OVER_PROCEDURE = False
            
            
         ' I decided not to stop this, when upgrading to #1067
         ' bRun_UNTIL_SELECTED = False
            
            '=========================================
            
    Exit Sub
err1:
    Debug.Print "ERR:## stop all: " & Err.Description
    On Error Resume Next
End Sub

' 1.21
' allow to stop input:
Private Sub cmdStopInput_Click()
On Error Resume Next ' 4.00-Beta-3
    bSTOP_EVERYTHING = True
    
    frmScreen.stopTimerInput
   
    frmEmulation.picWaitingForInput.Visible = False ' 1.07
    frmEmulation.cmdStep.Visible = True
    frmEmulation.chkAutoStep.Visible = True
    
    stopAutoStep
    
    'bTERMINATED = True ' force to reload? (just in case).
End Sub

' 1.02
' 1.29#404 Private Sub Form_Activate()
Public Sub DoShowMe()

 On Error GoTo err1

    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
    
 ' 30july2003
 ' decided to remove, for no reason
    ' 2.10y600 - moved here. previously was before "Me.Show" line and made problems under Win98 !!!
    ' 2.09#578
 '   If frmMain.WindowState = vbNormal Or frmMain.WindowState = vbMaximized Then
 '       frmMain.WindowState = vbMinimized
 '   End If
        
    
    ' 2.09#579
    'Set_VDevices_Menu
    
    '#1152 - may be handsome...
    ' #327-newdir# ' no need here!!! '   check_if_external_device_needs_to_be_started
    
    
    Exit Sub
err1:
    Debug.Print "frmEmulation.DoShowMe: " & LCase(Err.Description)
    
End Sub




Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

On Error GoTo err_feu
    
    ON_EMULATOR_HIDE_PART1
   
    ' 1.32#470
    ' to make sure options won't be reset on next
    ' open of frmEmulation:
    If UnloadMode = vbFormControlMenu Then
            Cancel = 1
            Me.Hide
    Else
            Exit Sub   ' 2.03 - no need to proceed the code that follows.
    End If
    
    ' is not executed when frmMain is closing... / system call.
    
    ON_EMULATOR_HIDE_PART2
    
    
    ' 2.09#578
    If frmMain.WindowState = vbMinimized Then
        frmMain.WindowState = vbNormal
    End If
    frmMain.Show
    
    
    
    
    ' #400b20-cosmetcs1#
    frm_mBox.txtMessage.Text = ""
    frm_mBox.Hide
    
    
    
    
    
    Exit Sub
err_feu:
    Debug.Print "frmEmulation_QueryUnload: " & LCase(Err.Description)
    On Error Resume Next
    
End Sub

Public Sub ON_EMULATOR_HIDE_PART1()
On Error GoTo err1

    ' 2.03#525
    frmEmulation.chkAutoStep.Value = vbUnchecked ' stop!!!
    
    ' 2.03#525b
    frmScreen.stopTimerInput
    picWaitingForInput.Visible = False
    cmdStep.Visible = True
    chkAutoStep.Visible = True
    
    
    ' 1.21
    ' seems logical:
    bSTOP_EVERYTHING = True
    
    ' 2.03
    ' this should hurt, since it is possibly already
    ' set by #525:
    ' 1.21 (required for "TURBO MODE"):
    timerStep.Enabled = False
    bTURBO_MODE = False
    
    Exit Sub
err1:
    Debug.Print "ON_EMULATOR_HIDE_PART1: " & LCase(Err.Description)
    On Error Resume Next
End Sub

Public Sub ON_EMULATOR_HIDE_PART2()
On Error GoTo err1
        
    If b_LOADED_frmScreen Then

        frmScreen.stopTimerInput
          
        frmScreen.clear_SCREEN
        frmScreen.Hide
    
    End If
    
    ' 2.03#518
    ' do not hide forms that are not visible.
    ' to prevent their loading!
    
    
    If b_LOADED_frmStack Then Unload frmStack ' 2.03#518c
    
    If b_LOADED_ALU Then ALU.Hide ' 2.03#518
    
    
    If b_LOADED_frmFPU Then frmFPU.Hide  ' 4.00b20
    
    
    If b_LOADED_frmFLAGS Then frmFLAGS.Hide ' 2.03#518
        
    
'    If b_LOADED_frmOrigCode Then frmOrigCode.Hide ' 2.03#518
              
    
    'If bKEEP_DEBUG_LOG Then Unload frmDebugLog ' 2.03#518 / #518b
    
    
    If bUPDATE_LEXICAL_FLAG_ANALYSER Then Unload frmFlagAnalyzer ' 2.03#518c
    
    If b_frmVars_LOADED Then Unload frmVars ' 2.03#518c
    
    
    If bUPDATE_ExtendedRegisterView Then Unload frmExtendedViewer ' 2.03#518c
    

    If b_LOADED_frmMemory Then Unload frmMemory


    If b_LOADED_frmStopOnCondition Then Unload frmStopOnCondition


    If b_LOADED_frmDOS_FILE Then Unload frmDOS_FILE

    '#1144 hide_ALL_DEVICES   ' sub updated 2.03#518

    ' 1.23
    '1.32#470b RAM.clear_RAM
    
    Exit Sub
err1:
    Debug.Print "ON_EMULATOR_HIDE_PART2: " & LCase(Err.Description)
    On Error Resume Next
End Sub

Private Sub Form_Resize()
On Error GoTo error_on_resize

' 3.27w
'    lstDECODED.Width = Me.ScaleWidth - constr_txtDECODED_W
'    lstDECODED.Height = Me.ScaleHeight - constr_txtDECODED_H
    picDisList.Width = Me.ScaleWidth - picDisList.Left - 20
    picDisList.Height = Me.ScaleHeight - picDisList.Top - cmdDOS.Height - 135

    cmdDOS.Top = picDisList.Top + picDisList.Height + 120
    cmdALU.Top = cmdDOS.Top
    cmdFlags.Top = cmdDOS.Top
'    cmdShowActualSource.Top = cmdDOS.Top ' 1.04
    cmdStack.Top = cmdDOS.Top ' 1.10
    
    cmdVars.Top = cmdDOS.Top ' #1097
    'cmdLog.Top = cmdDOS.Top ' #1097
    cmdReset.Top = cmdDOS.Top '#1114c
    
    picMemList.Height = picDisList.Height - (picMemList.Top - picDisList.Top)
    
    ' v3.27p
    picDragger.Top = picDisList.Top
    picDragger.Left = picDisList.Left - picDragger.Width
    picDragger.Height = picDisList.Height
    
    ALIGN_TO_DRAGGER   ' 4.00
    
    refreshMemoryList  ' 4.00
    refreshDisassembly ' 4.00
    
    
    
Exit Sub
error_on_resize:
Debug.Print "error on frmEmulation_Resize: " & LCase(Err.Description)
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next ' 4.00-Beta-3
    'SaveWindowState Me ' 2.05#551
End Sub

'Private Sub fraRegisters_Click()
'' v3.27w - no need in this anymore'    show_Registers ' #327s-load-in-input-mode-bug# -- trying to see why/when IP=0 after reload...
'End Sub

Private Sub lblWaitingForInput_Click()
On Error Resume Next ' 4.00-Beta-3
    frmScreen.DoShowMe
End Sub















Private Sub mnuAlu_AUX_Click()
On Error Resume Next ' 4.00-Beta-3
   ALU.DoShowMe
End Sub

Private Sub mnuASCII_Click()
On Error Resume Next ' 4.00-Beta-3
    '3.27xp frmASCII_CHARS.Show
    frmASCII_CHARS.DoShowMe
End Sub



Private Sub mnuAUX_Click()

On Error Resume Next

    ' #400b22-view-listing-st#
    '''''    ' 4.00b15
    '''''    mnuListing_AUX.Enabled = FileExists(sLAST_COMPILED_FILE & ".list")
    '''''    mnuSymbol_AUX.Enabled = FileExists(sLAST_COMPILED_FILE & ".symbol")
        
    
    ' #400b22-view-listing-st#
    mnuListing_AUX.Enabled = FileExists(sOpenedExecutable & ".list.txt")
    mnuSymbol_AUX.Enabled = FileExists(sOpenedExecutable & ".symbol.txt")
    
    
End Sub

Private Sub mnuAUX_FPU_Click()
On Error Resume Next

    frmFPU.DoShowMe

End Sub

' 4.00-Beta-6
Private Sub mnuAUX_stop_on_condition_Click()
On Error Resume Next
    mnuStopOnCondition_Click
End Sub

Private Sub mnuListing_AUX_Click()
On Error Resume Next
    mnuShowListing_Click
End Sub

Private Sub mnuMemory_AUX_Click()
On Error Resume Next ' 4.00-Beta-3
    mnuExternalMemoryViewer_Click
End Sub

Private Sub mnuSaveCurrentState_Click()
    ' #400-emu-state#
On Error GoTo err1

    
    ''' the new way....
    Dim sFilename As String
    sFilename = Add_BackSlash(App.Path) & EMU_STATE_FILE
    DELETE_FILE sFilename
    ' delete first anyway (to disable load menu).
    


'    '''''''''''''''''''''''''''''''''''' the old way....
'    Dim s As String
'    s = get_property("emu8086.ini", "SAVE_ASCII_STATE", "false")
'    If StrComp(s, "true", vbTextCompare) = 0 Then ' #400b3-BUG_STRCOMP#
'        saveEMULATOR_SAVE_ASCII_STATE
'        s = ""
'        sFilename = ""
'        Exit Sub
'    End If
'    s = ""
'    '''''''''''''''''''''''''''''''''''''''''''''
    
    'picPleaseWait.Visible = True
    Screen.MousePointer = vbHourglass
    ' avoid disassembling while loading:
    b_Do_DISASSEMBLE = False
    
    
    
    DoEvents

    ' the new way.... continue......

    Dim fNum As Integer
    fNum = FreeFile
    
    Open sFilename For Binary Shared As fNum
    
    
    DoEvents
    
    
        Dim L As Long
        Dim b As Byte
        
        ' MAX_MEMORY = 1114097
        For L = 0 To MAX_MEMORY
            ' b = RAM.mREAD_BYTE(L)
            b = theMEMORY(L)
            Put #fNum, , b
        Next L
        
        
        
        ' 4 control bytes...
        b = 0
        Put #fNum, , b
        b = &HAB
        Put #fNum, , b
        b = &HCD
        Put #fNum, , b
        b = &HEF
        Put #fNum, , b

        
        
        
        
        
        '    ------------- 8 BIT REGISTERS -------------
        '    AL
        Put #fNum, , AL
        '    AH
        Put #fNum, , AH
        '    BL
        Put #fNum, , BL
        '    BH
        Put #fNum, , BH
        '    CL
        Put #fNum, , CL
        '    CH
        Put #fNum, , CH
        '    DL
        Put #fNum, , DL
        '    DH
        Put #fNum, , DH
        
        
        '    ------------- 16 BIT REGISTERS -------------
        Dim bLow As Byte
        Dim bHigh As Byte
        '    DS
        bLow = math_get_low_byte_of_word(DS)
        bHigh = math_get_high_byte_of_word(DS)
        Put #fNum, , bLow
        Put #fNum, , bHigh
        '    ES
        bLow = math_get_low_byte_of_word(ES)
        bHigh = math_get_high_byte_of_word(ES)
        Put #fNum, , bLow
        Put #fNum, , bHigh
        '    SI
        bLow = math_get_low_byte_of_word(SI)
        bHigh = math_get_high_byte_of_word(SI)
        Put #fNum, , bLow
        Put #fNum, , bHigh
        '    DI
        bLow = math_get_low_byte_of_word(DI)
        bHigh = math_get_high_byte_of_word(DI)
        Put #fNum, , bLow
        Put #fNum, , bHigh
        '    BP
        bLow = math_get_low_byte_of_word(BP)
        bHigh = math_get_high_byte_of_word(BP)
        Put #fNum, , bLow
        Put #fNum, , bHigh
        '    CS
        bLow = math_get_low_byte_of_word(CS)
        bHigh = math_get_high_byte_of_word(CS)
        Put #fNum, , bLow
        Put #fNum, , bHigh
        '    IP
        bLow = math_get_low_byte_of_word(IP)
        bHigh = math_get_high_byte_of_word(IP)
        Put #fNum, , bLow
        Put #fNum, , bHigh
        '    SS
        bLow = math_get_low_byte_of_word(SS)
        bHigh = math_get_high_byte_of_word(SS)
        Put #fNum, , bLow
        Put #fNum, , bHigh
        '    SP
        bLow = math_get_low_byte_of_word(SP)
        bHigh = math_get_high_byte_of_word(SP)
        Put #fNum, , bLow
        Put #fNum, , bHigh



        '    ------------- FLAGS REGISTER (16 BIT) -------------
        Dim i As Integer
        i = frmFLAGS.getFLAGS_REGISTER16
        bLow = math_get_low_byte_of_word(i)
        bHigh = math_get_high_byte_of_word(i)
        Put #fNum, , bLow
        Put #fNum, , bHigh
        
        
        '    ------------- VIDEO MODE -------------
        If boolGRAPHICS_VIDEO_MODE = True Then
           b = 255
        Else
           b = 0
        End If
        Put #fNum, , b
        Put #fNum, , byteCURRENT_VIDEO_MODE
        Put #fNum, , lCURRENT_VIDEO_PAGE_ADR
                
                
        ' #400b3-impr1#
        '    ------------- sOpenedExecutable -------------
        Dim byteArray1(0 To 256) As Byte
        Dim i1 As Integer
        StrToBytes byteArray1, sOpenedExecutable
        For i1 = 0 To 256
            Put #fNum, , byteArray1(i1)
        Next i1
        
        
        
       
        
    Close fNum
    
    
    
    'picPleaseWait.Visible = False
    Screen.MousePointer = vbDefault
    b_Do_DISASSEMBLE = True
    
    mBox Me, " " & "saved to:" & vbNewLine & sFilename
    

    Exit Sub
err1:
    'picPleaseWait.Visible = False
    Screen.MousePointer = vbDefault
    b_Do_DISASSEMBLE = True
    Debug.Print "err   #400-emu-state# save: " & Err.Description
    MsgBox LCase(Err.Description)
End Sub

Private Sub mnuLoadPreviousState_Click()
On Error GoTo err1

    Dim sFilename As String
    sFilename = Add_BackSlash(App.Path) & EMU_STATE_FILE
    

    If Not FileExists(sFilename) Then
        mnuLoadPreviousState.Enabled = False
        mBox Me, cMT("file not found:") & vbNewLine & sFilename
        sFilename = ""
        Exit Sub
    End If


    Reset_Before_Load_Anything


    'picPleaseWait.Visible = True
    Screen.MousePointer = vbHourglass
    ' avoid disassembling while loading:
    b_Do_DISASSEMBLE = False


    DoEvents
    

    Dim fNum As Integer
    fNum = FreeFile
    
    Open sFilename For Binary Shared As fNum
    
    
    DoEvents
    
    
        Dim L As Long
        Dim b As Byte
        Dim lLong As Long
        
        
        ' MAX_MEMORY = 1114097
        For L = 0 To MAX_MEMORY
            Get #fNum, , b
            '  RAM.mWRITE_BYTE L, b
            theMEMORY(L) = b
        Next L
        
        
        
        ' 4 control bytes...  just print out.
        Get #fNum, , b
        Debug.Print "CONTROL_BYTES:" & Hex(b);
        Get #fNum, , b
        Debug.Print Hex(b);
        Get #fNum, , b
        Debug.Print Hex(b);
        Get #fNum, , b
        Debug.Print Hex(b)
        
        
        
        
        
        '    ------------- 8 BIT REGISTERS -------------
        '    AL
        Get #fNum, , AL
        '    AH
        Get #fNum, , AH
        '    BL
        Get #fNum, , BL
        '    BH
        Get #fNum, , BH
        '    CL
        Get #fNum, , CL
        '    CH
        Get #fNum, , CH
        '    DL
        Get #fNum, , DL
        '    DH
        Get #fNum, , DH
        
        
        '    ------------- 16 BIT REGISTERS -------------
        Dim bLow As Byte
        Dim bHigh As Byte
        '    DS
        Get #fNum, , bLow
        Get #fNum, , bHigh
        DS = to16bit_SIGNED(bLow, bHigh)
        '    ES
        Get #fNum, , bLow
        Get #fNum, , bHigh
        ES = to16bit_SIGNED(bLow, bHigh)
        '    SI
        Get #fNum, , bLow
        Get #fNum, , bHigh
        SI = to16bit_SIGNED(bLow, bHigh)
        '    DI
        Get #fNum, , bLow
        Get #fNum, , bHigh
        DI = to16bit_SIGNED(bLow, bHigh)
        '    BP
        Get #fNum, , bLow
        Get #fNum, , bHigh
        BP = to16bit_SIGNED(bLow, bHigh)
        '    CS
        Get #fNum, , bLow
        Get #fNum, , bHigh
        CS = to16bit_SIGNED(bLow, bHigh)
        '    IP
        Get #fNum, , bLow
        Get #fNum, , bHigh
        IP = to16bit_SIGNED(bLow, bHigh)
        '    SS
        Get #fNum, , bLow
        Get #fNum, , bHigh
        SS = to16bit_SIGNED(bLow, bHigh)
        '    SP
        Get #fNum, , bLow
        Get #fNum, , bHigh
        SP = to16bit_SIGNED(bLow, bHigh)


        '    ------------- FLAGS REGISTER (16 BIT) -------------
        Dim i As Integer
        Get #fNum, , bLow
        Get #fNum, , bHigh
        i = to16bit_SIGNED(bLow, bHigh)
        frmFLAGS.setFLAGS_REGISTER i


        '    ------------- VIDEO MODE -------------
        Get #fNum, , b
        If b = 255 Then
            boolGRAPHICS_VIDEO_MODE = True
        Else
            boolGRAPHICS_VIDEO_MODE = False
        End If
        
        Get #fNum, , b
        byteCURRENT_VIDEO_MODE = b
        frmScreen.set_VIDEO_MODE b
        
        Get #fNum, , lLong
        lCURRENT_VIDEO_PAGE_ADR = lLong
        
        
        

        If EOF(fNum) Then GoTo skip_for_400_beta2 ' compatibility with versions prior 4.00-Beta-3
        
        
        ' #400b3-impr1#
        '    ------------- sOpenedExecutable -------------
        ' 257 BYTES
        Dim byteArray1(0 To 256) As Byte
        Dim i1 As Integer
        For i1 = 0 To 256
            Get #fNum, , byteArray1(i1)
        Next i1
        sOpenedExecutable = BytesToStr(byteArray1)
        sOpenedExecutable = RTrimZero(sOpenedExecutable)

        
        
        
skip_for_400_beta2:
    Close fNum




    'picPleaseWait.Visible = False
    Screen.MousePointer = vbDefault
    b_Do_DISASSEMBLE = True

    show_Registers
    
    frmScreen.setSCREEN_W_H
    frmScreen.VMEM_TO_SCREEN
    

   ' 4.00-Beta-3 ' mBox Me, " " & "loaded."
    Debug.Print "STATE LOADED"

    Set_After_Load
    

Exit Sub
err1:
    'picPleaseWait.Visible = False
    Screen.MousePointer = vbDefault
    b_Do_DISASSEMBLE = True

    
    Debug.Print "err   #400-emu-state# load:  " & Err.Description
    MsgBox LCase(Err.Description)
End Sub




Private Sub mnuShowListing_Click()
On Error Resume Next

    Dim s As String
    s = sOpenedExecutable & ".list.txt"
    
    ' #todo-st-view#   frmSymbolTableViewer.DoShowMe_with_SYMBOL_TABLE s
    If FileExists(s) Then ' 4.00b15
        Call ShellExecute(Me.hwnd, "open", ASCII_VIEWER, s, ExtractFilePath(s), SW_SHOWDEFAULT)
    Else
'        ' probably it's MASM
'        s = CutExtension(sOpenedExecutable) & ".lst"
'        If FileExists(s) Then
'            Call ShellExecute(Me.hwnd, "open", ASCII_VIEWER, s, ExtractFilePath(s), SW_SHOWDEFAULT)
'        End If
    End If
    
End Sub

Private Sub mnuShowSymbolTable_Click()

On Error Resume Next

    Dim s As String
    s = sOpenedExecutable & ".symbol.txt"
    
    ' #todo-st-view#   frmSymbolTableViewer.DoShowMe_with_SYMBOL_TABLE s
    If FileExists(s) Then ' 4.00b15
        Call ShellExecute(Me.hwnd, "open", ASCII_VIEWER, s, ExtractFilePath(s), SW_SHOWDEFAULT)
    End If
    
End Sub

Private Sub mnuStopOnCondition_Click()
On Error Resume Next
    frmStopOnCondition.DoShowMe
End Sub

Private Sub mnuSymbol_AUX_Click()
On Error Resume Next
    mnuShowSymbolTable_Click
End Sub

Private Sub mnuView_Click() ' 3.27xm
On Error GoTo err1

    
    ' #400b22-view-listing-st#
    ''''
    ''''    If Len(sOpenedExecutable) = 0 Then
    ''''        mnuShowListing.Enabled = False
    ''''        mnuShowSymbolTable.Enabled = False
    ''''    Else
    ''''        mnuShowListing.Enabled = True
    ''''        mnuShowSymbolTable.Enabled = True
    ''''    End If
    ''''
    ''''
    ''''    ' 4.00b15
    ''''    mnuShowListing.Enabled = FileExists(sLAST_COMPILED_FILE & ".list")
    ''''    mnuShowSymbolTable.Enabled = FileExists(sLAST_COMPILED_FILE & ".symbol")
    
    
    ' 2006-11-29 added MASM way: Or FileExists(CutExtension(sOpenedExecutable) & ".lst")
    ' #400b22-view-listing-st#
    mnuShowListing.Enabled = FileExists(sOpenedExecutable & ".list.txt") Or FileExists(CutExtension(sOpenedExecutable) & ".lst")
    mnuShowSymbolTable.Enabled = FileExists(sOpenedExecutable & ".symbol.txt")
    

        
    Exit Sub
err1:
    Debug.Print "mnuView_Click: " & Err.Description
End Sub


Private Sub picDisList_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo err1

' Debug.Print KeyCode

    Dim L As Long
    
    If KeyCode = 38 Then 'up
        L = lStartDisAddress - 1
        If L >= 0 And L <= MAX_MEMORY Then
            DoDisassembling L, False
        End If
    ElseIf KeyCode = 40 Then 'down
        L = lStartDisAddress + 1
        If L >= 0 And L <= MAX_MEMORY Then
            DoDisassembling L, False
        End If
    ElseIf KeyCode = 13 Then ' enter
        Debug.Print "TODO"
    End If

Exit Sub
err1:
Debug.Print "err:7822:" & Err.Description
End Sub

Private Sub picDisList_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error GoTo err_md

    
    
    
    Dim fCharHeight As Single
    fCharHeight = picMemList.TextHeight("FF")
               
    Dim f As Single
    f = Abs(Fix(Y / fCharHeight))
    Dim UZ As Long
    UZ = CLng(f)
    

    Dim lT As Long
    lT = lStartDisAddress + dis_recLocCounter(UZ)
    
    Dim lT2 As Long '4.00
    lT2 = lStartDisAddress + dis_recLocCounter(UZ + 1) - 1


    selectDisassembled_Line_by_INDEX UZ, YELLOW_SELECTOR

    ' in case memory list isn't at the right position, make it be there:
    selectMemoryLine_YELLOW lT, lT2, True

    selectSourceLineAtLocation lT - lPROG_LOADED_AT_ADR, False

Exit Sub
err_md:
    Debug.Print "Error: picDisList_MouseDown: " & Err.Description

End Sub

Private Sub picDisList_Resize()
On Error Resume Next
    scrollDis.Top = 0
    scrollDis.Left = picDisList.ScaleWidth - scrollDis.Width
    scrollDis.Height = picDisList.ScaleHeight
End Sub

Private Sub picMemList_DblClick()

On Error GoTo err1


    ' #327xr-400-new-mem-list# :
    'show memory at actual click
    Dim lSEGMENT As Long
    Dim lOFFSET As Long
    
    GetSegmentOffset_FromPhysical lYELLOW_SelectedMemoryLocation_FROM, CS, lSEGMENT, lOFFSET

    frmExtendedViewer.DoShowMe
    
    ' #400b4-mini-8-b#
'''    frmExtendedViewer.txtMemSegment.Text = make_min_len(Hex(lSEGMENT), 4, "0")
'''    frmExtendedViewer.txtMemOffset.Text = make_min_len(Hex(lOFFSET), 4, "0")

    ' #400b4-mini-8-b#
    frmExtendedViewer.txtMemSegment.Text = make4digitHex(lSEGMENT)
    frmExtendedViewer.txtMemOffset.Text = make4digitHex(lOFFSET)


Exit Sub
err1:
Debug.Print "err2124: " & Err.Description

End Sub




Private Sub picMemList_KeyDown(KeyCode As Integer, Shift As Integer)
On Error GoTo err1

' Debug.Print KeyCode

    Dim L As Long

    If KeyCode = 38 Then 'up
        L = lStartMemAddress - 1
        If L >= 0 And L <= MAX_MEMORY Then
            showMemory L
        End If
    ElseIf KeyCode = 40 Then 'down
        L = lStartMemAddress + 1
        If L >= 0 And L <= MAX_MEMORY Then
            showMemory L
        End If
    ElseIf KeyCode = 13 Then ' enter
    
    End If

Exit Sub
err1:
Debug.Print "err:7711:" & Err.Description
End Sub


Private Sub picMemList_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error GoTo err_lm_md

    If Button = vbRightButton Then
       '1.27#345 PopupMenu popSetMemoryValue
       '' hmmm.... maybe I will re-enable it one day or another...
    Else
 
        Dim fCharHeight As Single
        fCharHeight = picMemList.TextHeight("FF")
                   
        Dim f As Single
        
        f = Abs(Fix(Y / fCharHeight))
                   
        Dim L As Long
        L = lStartMemAddress + f
                   
        selectMemoryLine_YELLOW L, L, False
              
              

                  
                  
        select_disassembled_line_according_to_selected_byte
        
        selectSourceLineAtLocation L - lPROG_LOADED_AT_ADR, False
        
    End If
    
    Exit Sub
    
err_lm_md:
    Debug.Print "Error on lstMemory_MouseDown: " & LCase(Err.Description)
End Sub


Private Sub picMemList_Resize()
On Error Resume Next
    scrollMem.Top = 0
    scrollMem.Left = picMemList.ScaleWidth - scrollMem.Width
    scrollMem.Height = picMemList.ScaleHeight
End Sub

Private Sub picWaitingForInput_Click()
On Error Resume Next ' 4.00-Beta-3
    lblWaitingForInput_Click ' v3.27m+ :)
End Sub


' #327xr-400-new-mem-list#
''''Private Sub lstMemory_DblClick()
''''    On Error GoTo err_dblclk_mem
''''
''''' 1.27#345
''''''''     frmHexCalculator.Show
''''''''     frmHexCalculator.txtHEX_16bit.Text = make_min_len(Hex(RAM.mREAD_BYTE(lstMemory.ListIndex + startADR + 1)), 2, "0") & make_min_len(Hex(RAM.mREAD_BYTE(lstMemory.ListIndex + startADR)), 2, "0")
''''''''     frmHexCalculator.txtHEX_8bit.Text = make_min_len(Hex(RAM.mREAD_BYTE(lstMemory.ListIndex + startADR)), 2, "0")
''''''''     frmHexCalculator.Update_from_Hex
''''
''''
''''    ' 1.27#345
''''    frmExtendedViewer.DoShowMe
''''    frmExtendedViewer.txtMemSegment.Text = make_min_len(Hex(to_signed_int(lMemoryListSegment)), 4, "0")
''''    frmExtendedViewer.txtMemOffset.Text = make_min_len(Hex(to_signed_int(to_unsigned_long(lstMemory.ListIndex) + lMemoryListOffset)), 4, "0")
''''
''''    Exit Sub
''''
''''err_dblclk_mem:
''''    Debug.Print "Error lstMemory_DblClick(): " & LCase(err.Description)
''''
''''End Sub

' #327xr-400-new-mem-list#
'''' 1.28#365
'''Private Sub lstMemory_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'''    If Button = vbLeftButton Then
'''        If iLast_MOUSE_DOWN_ON_MEM_LIST <> lstMemory.ListIndex Then
'''            lstMemory_MouseDown Button, Shift, X, Y
'''        End If
'''    End If
'''End Sub



Public Sub select_disassembled_line_according_to_selected_byte()
On Error GoTo err1

        ' select command when click over the memory value
        Dim lT As Long
        Dim i As Long

        lT = lYELLOW_SelectedMemoryLocation_FROM
        DoDisassembling lT
        ' #400-dissasembly# ' lstDECODED.ListIndex = 0
        selectDisassembled_Line_by_INDEX 0, YELLOW_SELECTOR  ' #400-dissasembly#
        
        Exit Sub
err1:
        Debug.Print "err sdb: " & Err.Description
End Sub


' 1.27#340
Private Sub mnu_set_CS_IP_to_selected_Click()

On Error GoTo err1

' #327xr-400-new-mem-list#


' sending parameters BY REF!
Dim lSEGMENT As Long
Dim lOFFSET As Long
GetSegmentOffset_FromPhysical lYELLOW_SelectedMemoryLocation_FROM, CS, lSEGMENT, lOFFSET




    txtCS.Text = make_min_len(Hex(to_signed_int(lSEGMENT)), 4, "0")
    txtIP.Text = make_min_len(Hex(to_signed_int(lOFFSET)), 4, "0")

    mnuSelect_lines_at_CS_IP_Click
    bTERMINATED = False '#1073b don't ask to reload!
        
    Exit Sub
err1:
    Debug.Print "err 1241: " & Err.Description
    
End Sub

Private Sub mnuAbout_Click()
    frmAbout.Show vbModal, Me
End Sub





Private Sub mnuBoot_from_FLOPPY_X_Click(Index As Integer)

On Error Resume Next ' 4.00-Beta-3

  frmScreen.clearScreen
  ' Boot sector is loaded at 0000:7C00
  loadBinaryExecutable Add_BackSlash(App.Path) & "FLOPPY_" & Index, &H0, &H7C00, False, 512, False

  ' 1.23#236b
  ' BIOS passes drive number in DL
  txtDL.Text = make_min_len(to_unsigned_byte(Index), 2, "0")
End Sub

Private Sub mnuCalculator_Click()
On Error Resume Next ' 4.00-Beta-3
    frmBaseConvertor.DoShowMe
End Sub

Private Sub mnuCheckForUpdate_Click()
On Error Resume Next ' 4.00-Beta-3
  ' open_HTML_FILE Me, sUPDATE_SITE_URL & sUPDATE_URL_FILENAME
End Sub

Private Sub mnuCommandLineParameters_Click()
On Error Resume Next ' 4.00-Beta-3
    ' 2007-12-14 sCOMMAND_LINE_PARAMETERS = InputBox(cMT("enter command line parameters, or click cancel to reset.") & vbNewLine & vbNewLine & cMT("note:") & vbNewLine & cMT("there is always 1 space prefix before actual parameters.") & vbNewLine & cMT("the parameters are not reset with the emulator (to avoid entering the same parameters over and over again after every single modification)."), cMT("set command line parameters"), sCOMMAND_LINE_PARAMETERS)
    sCOMMAND_LINE_PARAMETERS = InputBox(cMT("enter command line parameters, or click cancel to reset.") & vbNewLine, cMT("set command line parameters"), sCOMMAND_LINE_PARAMETERS)
    
    
    ' 2007-12-14
    ' bug_406_01.txt
    sCOMMAND_LINE_PARAMETERS = " " & LTrim(sCOMMAND_LINE_PARAMETERS)
    
    
    
    '+ 1.20#109.BUGFIX! my command line parameters do not include prefix space!
    '       real DOS PROMPT (under XP) includes single space!
    '       no matter how may spaces are between program name and
    '       parameters. The interesting this is that when running
    '       from "debug param.com     what's up?     " all five
    '       spaces are included from both sides
    '        - XP command prompt: the input is left-trimmed, and single space added.
    '        - REAL DOS: the input is not trimmed, and single space always exits.
    
    ' in don't add space to empty string:
    If sCOMMAND_LINE_PARAMETERS <> "" Then
        ' don't add if space(s) already exist:
        If Not startsWith(sCOMMAND_LINE_PARAMETERS, " ") Then
            sCOMMAND_LINE_PARAMETERS = " " & sCOMMAND_LINE_PARAMETERS
        End If
    End If
    
    If sOpenedExecutable <> "" Then '#1181   ' #400-cutext-param#
            If MsgBox(cMT("reload:") & " " & """" & CutExtension(ExtractFileName(sOpenedExecutable)) & sCOMMAND_LINE_PARAMETERS & """   ?", vbYesNo, cMT("reload?")) = vbYes Then
                    loadFILEtoEMULATE sOpenedExecutable
            End If
    End If
    
    
End Sub



Private Sub mnuDebugLog_Click()
On Error GoTo err_mdl ' 1.30 jic

'''    If mnuDebugLog.Checked = False Then ' 1.30

'        frmDebugLog.DoShowMe
    
'''    Else
'''
'''        Unload frmDebugLog ' 1.30
'''
'''    End If
    
    Exit Sub
err_mdl:
    Debug.Print "mnuDebugLog_Click: " & LCase(Err.Description)
End Sub

Private Sub mnuEvaluator_Click()
On Error Resume Next ' 4.00-Beta-3
    frmEvaluator.DoShowMe
End Sub

Private Sub mnuExit_Click()

On Error Resume Next ' 4.00-Beta-3

' 2.12#621
' not good:    Unload Me

' Like click on [x] button:
Form_QueryUnload 0, 0  ' 2.12#621 GOOD !

End Sub






Private Sub mnuExternalMemoryViewer_Click()
On Error GoTo err1
    frmMemory.DoShowMe
''' #327xr-400-new-mem-list#
'''    frmMemory.txtMemSegment.Text = txtMemSegment.Text
'''    frmMemory.txtMemOffset.Text = txtMemOffset.Text

' #327xr-400-new-mem-list#
    frmMemory.txtMemoryAddr.Text = make_min_len(Hex(CS), 4, "0") & ":" & make_min_len(Hex(IP), 4, "0")
    
    frmMemory.EMITATE_ShowMemory_Click
    Exit Sub
err1:
    Debug.Print "err124:" & Err.Description
End Sub

Private Sub mnuFlagAnalyzer_Click()
On Error Resume Next ' 4.00-Beta-3
    frmFlagAnalyzer.DoShowMe
End Sub

Private Sub mnuHelpTopics_Click()
On Error Resume Next ' 4.00-Beta-3
  '  open_HTML_FILE Me, "index.html"
End Sub

Private Sub mnuLoad_Click()
On Error Resume Next ' 4.00-Beta-3
    bAlwaysNAG = True
    loadFILEtoEMULATE ""
End Sub

' 1.12
Private Sub mnuMakeEmptyFloppy_Click()
On Error GoTo err_mnf
    Dim DriveToAdd As Byte
    
    DriveToAdd = floppyDriveNumber
        
    If (DriveToAdd > 3) Or (DriveToAdd < 0) Then
        mBox Me, cMT("only 4 floppy drives are allowed!")
        Exit Sub
    End If

    ' write any 512 zero bytes to last sector:
    write_sectors 18, 79, 1, 1, DriveToAdd, -1, True
    
    If frmEmulation.bSET_CF_ON_IRET Then
        mBox Me, cMT("cannot create new virtual floppy drive.")
    Else
        mBox Me, cMT("floppy drive:") & " FLOPPY_" & DriveToAdd & " " & cMT("created.")
    End If
    
    floppyDriveNumber = floppyDriveNumber + 1
    
    updateMemory_at_410_and_floppy_menus
    
    Exit Sub
err_mnf:
    mBox Me, "error making new floppy drive: " & LCase(Err.Description)
End Sub





Private Sub mnuMS_DEBUG_Click()
On Error Resume Next ' 4.00-Beta-3
    Dim sReturn As String
    
    sReturn = external_DEBUG(sOpenedExecutable, Me)
    
    If sReturn <> "" Then
        mBox frmInfo, "debug.exe: " & sReturn
    End If
End Sub

' 1.23 #228
Private Sub mnuRecent_Click(Index As Integer)
On Error Resume Next ' 4.00-Beta-3
    bAlwaysNAG = True
    loadFILEtoEMULATE mnuRecent(Index).Tag
End Sub

Private Sub mnuReLoad_Click()
    
On Error GoTo err1: ' 3.27xo
    
    ''''''''''''''''''''''''''''''''''''

    loadFILEtoEMULATE sOpenedExecutable
    
    
    ''''''''''''''''''''''''''''''''''''
    
    Exit Sub
err1:
    Debug.Print "mnuReLoad_Click: " & Err.Description
    Resume Next

End Sub

' loads a file into emulator, if sFileName parameter
' is empty shows a dialog box asking for a file:
Public Sub loadFILEtoEMULATE(sFilename As String, Optional bFORCE_TO_EMULATE As Boolean = False, Optional bACTIVATE_ACTUAL_SOURCE As Boolean = True)
    
On Error GoTo err1

    Reset_Before_Load_Anything
    
    

    '=========================================
    
    Dim ts As String
           
    If sFilename = "" Then
'        'ComDlg.hwndOwner = Me.hwnd
'        'ComDlg.FileNameD = ""
'
'        ' 1.23#268d
'        ' by default try set current folder to "MyBuild",
'        ' if not then to App.Path:
'
'        If sCURRENT_EMULATOR_FOLDER = "" Then
'            ts = s_MyBuild_Dir ' 2.05#545 Add_BackSlash(App.Path) & "MyBuild"
'            If FileExists(ts) Then
'                sCURRENT_EMULATOR_FOLDER = ts
'            Else
'                 sCURRENT_EMULATOR_FOLDER = App.Path
'            End If
'        End If
'
'        If myChDir(sCURRENT_EMULATOR_FOLDER) Then
'            'ComDlg.FileInitialDirD = sCURRENT_EMULATOR_FOLDER
'        End If
'        ComDlg.Flags = OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT + OFN_PATHMUSTEXIST
'        ComDlg.Filter = sALL_KNOWN_FILE_TYPES  ' #400b3-extensions#  before it was a bit reversed, but it really doesn't matter.
'        sFilename = ComDlg.ShowOpen
'
'        sCURRENT_EMULATOR_FOLDER = ExtractFilePath(sFilename) ' 1.23#268d

      sFilename = InputBox("file path?", , Add_BackSlash(App.Path) & "output\0000.com_")

      sCURRENT_EMULATOR_FOLDER = ExtractFilePath(sFilename)
    
    End If
    
    

    
    
    If sFilename = "" Then
       ' bLOADING_FILE_TO_EMULATOR = False
        Exit Sub ' LOAD CANCELED.
    End If
    
    ' 1.23 #228
    'Recent_Add_New sFilename, mnuRecent, sRECENT_EMULATOR
    
    frmScreen.set_current_video_page_number 0, False ' 1.17 '#1174b
    frmScreen.clearScreen
    
    
    ' 1.25
    '#1144 reset_ALL_DEVICES
    
    
    
    CLOSE_ALL_VIRTUAL_FILES
    
    
    frmScreen.set_VIDEO_MODE 3 ' #1048b it wasn't here before 2005-06-04
    
    
    
    If endsWith(sFilename, ".EXE") Or endsWith(sFilename, ".EXE_") Then ' #327xo-av-protect#
        loadExecutable sFilename, &H710 '#1146e &HB67
        ' 1.07
        load_cmd_parameters sCOMMAND_LINE_PARAMETERS, &H700, &H80 '#1146e &HB57, &H80
        
    ElseIf endsWith(sFilename, ".COM") Or endsWith(sFilename, ".COM_") Then  ' #327xo-av-protect#
        ' #1146e changed from &HB56 to &H700
        loadBinaryExecutable sFilename, &H700, &H100, True, 655360, True     ' 1.11 "655360" - limit to 640KB '- no limit.
        load_cmd_parameters sCOMMAND_LINE_PARAMETERS, &H700, &H80
        
    ' 1.11 (1.12) ' #327xo-av-protect#
    ElseIf endsWith(sFilename, ".BIN") Or endsWith(sFilename, ".BIN_") Or (InStr(1, ExtractFileName(sFilename), ".") <= 0) Then ' #327xm-noext=bin# . by default load files without extension as .bin files.
    
LOAD_BIN_FILE: ' #1168

        ' 1.18 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        ' check if file exists, if not ask where it is, or use current register values:
        Dim sBINF_FILE As String
               
        sBINF_FILE = CutExtension(sFilename) & ".binf"
    
        If Not FileExists(sBINF_FILE) Then
            
            ' 1.23#239
            ' in case not found in executable folder,
            ' seach source folder:
            Dim sBINF_FILE2 As String ' #1086c
            ' #1168 sBINF_FILE2 = CutExtension(frmMain.sOpenedFile) & ".binf"
            '
            
            sBINF_FILE2 = Add_BackSlash(App.Path) & "default.binf"  ' #1168 allow default binf file!!!!
            
            
            
            If Not FileExists(sBINF_FILE2) Then
            
' #1168  show nothing!
'''''              "emulator cannot decide at what address to load this file, because binary information file is missing." & vbNewLine & "cannot find:" & " " & extractfilename(sBINF_FILE) & vbNewLine & _
'''''                          cMT(""), vbOKCancel, cMT("missing .binf file"))
'''''
'''''
'''''                    ComDlg.hwndOwner = Me.hwnd
'''''                    'ComDlg.FileNameD = ""
'''''                    ts = ExtractFilePath(frmMain.sOpenedFile)
'''''                    If myChDir(ts) Then
'''''                        ComDlg.FileInitialDirD = ts
'''''                    End If
'''''                    ComDlg.Flags = OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT + OFN_PATHMUSTEXIST
'''''                    ComDlg.Filter = "BIN INFO Files (*.binf)|*.binf|All Files (*.*)|*.*"
'''''                    sBINF_FILE = ComDlg.ShowOpen
'''''                Else
                    sBINF_FILE = "" ' not required.
'''''                End If
            
            Else
            
                sBINF_FILE = sBINF_FILE2
            
            End If
            
        End If
        ' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
        ' for files with preset registers and loading position:
        ' get loading position:
        If Not load_BININFO_segment_offset(sBINF_FILE) Then
            ' in case file with ".pinf" extention not found,
            ' use current register values:
            iSEGMENT_for_BIN = CS
            iOFFSET_for_BIN = IP
            store_all_register_values
        End If
        
        ' 1.25#307
        If Not bDONT_CHECK_BIN_LOAD_ADR Then
        
                ' 1.22 #189
                'when loading ".bin" file check that it is not loaded at interupt
                'vector, and not at BIOS area (0F4000h), not VGA!!
                'allow loading only between addresses:
                '00500 - A0000
                Dim lPhysAdr As Long
                lPhysAdr = to_unsigned_long(iSEGMENT_for_BIN) * 16 + to_unsigned_long(iOFFSET_for_BIN)
                
                If (lPhysAdr < &H500) Or (lPhysAdr >= &HA0000) Then
                    MsgBox cMT("can not load in this memory area!") & vbNewLine & _
                            cMT("free memory area is between 0050:0000h and 0a000:0000h") & _
                            vbNewLine & cMT("file will be loaded at 0100:0000h")
                    iSEGMENT_for_BIN = &H100
                    iOFFSET_for_BIN = 0
                End If
        
        End If
        
        loadBinaryExecutable sFilename, iSEGMENT_for_BIN, iOFFSET_for_BIN, False, 655360, False      ' 1.11 "655360" - limit to 640KB - no limit.
                
        ' get register values, and show them:
        If Not load_BININFO_all_registers(sBINF_FILE) Then
            reStore_all_register_values
            
            ' 1.22 just in case loading
            ' address was changed on load,
            ' (wrong loading address error)
            CS = iSEGMENT_for_BIN
            IP = iOFFSET_for_BIN
        End If
        
        
        ' #327u-ret=hlt#
        Dim sMEMSET As String
        sMEMSET = get_property(sBINF_FILE, "MEM", "")
        If sMEMSET <> "" Then set_byte_string_to_phisical_memory (sMEMSET)
        
        
        'If bKEEP_DEBUG_LOG Then frmDebugLog.clearLog
        
        show_Registers
        
    ' 2.52#719
    Else
        ' for all other files
           
           If Not (startsWith(sFilename, "FLOPPY_") Or endsWith(sFilename, ".BOOT")) Then
                    
                        ' 2.52#719
                        ' ==========================================
                        Dim sExt As String
'''                        Dim lx As Long
'''                        lx = InStrRev(sFileName, ".")
'''                        If lx > 0 And (lxxx2 < lx) Then
'''                            sExt = UCase(Right(sFileName, Len(sFileName) - lx + 1))
'''                        End If
                        
                        sExt = extract_extension(sFilename)
                        
                        Select Case sExt
                        
                        Case ".ASM" ' #1168 puting them to emu8086.ini ', ".TXT", ".DOC", ".HTM", ".HTML", ".LOG", ".SYMBOL", ".INC"
                            frmMain.SetFocus
                            DoEvents
                            frmMain.openSourceFile sFilename, False, False
                            
                            'bLOADING_FILE_TO_EMULATOR = False
                            Exit Sub
                            
                              ' #327xo-av-protect#
                        Case ".EXE", ".BIN", ".BOOT", ".COM", ".EXE_", ".BIN_", ".COM_", "" ' ??? never seems to get here. 2005-05-26, I'll leave it just in case.
                            ' ok... continue with load.
                            
                        Case Else
                        
                        
                        ' #1168 here we do not check for ASCII_EXTENTIONS !
                        '       because if user opens this file from here , it's from his desire to disasemble and ASCII file...
                        
                        ' #1168. load all unknown extensions to emulator!
                        GoTo LOAD_BIN_FILE ' #1168
                        
                        

                        
                        End Select
                        ' ==========================================
           End If

'#1168 FORCE_TO_EMULATE: ' 2005-03-01 ' 2005-03-01_INC_EXTENTION_OPEN_IN_EDITOR_FIXED.txt

        ' ( .BOOT, FLOPPY_0):
        ' 1.07
        ' Boot sector is loaded at 0000:7C00
        
        ' 1.22 avoid funny message and avoid long time
        ' loads, lets limit it by 512 bytes...
        loadBinaryExecutable sFilename, &H0, &H7C00, False, 512, False   '1.22 - 655360  ' 1.11 "655360" - limit to 640KB - no limit.
             
        
    End If

    ' 1.30#434
'    If (sDEBUGED_file <> "") And bACTIVATE_ACTUAL_SOURCE Then 'modification #1135
'        frmOrigCode.DoShowMe
'    End If

    '1.30 If Not bREGISTERED Then frmPleaseRegister.show_Please_Register Me
    
    
    ' 1.27#339
    If bRUN_AFTER_RELOAD Then
        bRUN_AFTER_RELOAD = False
        chkAutoStep.Value = vbChecked  ' RUN!!!!!
    End If
    
     Reset_registers_highlight ' 2.05#549
     
     


    Set_After_Load
     
     
     
    mDOS_FILE.set_DEFAULTS_FOR_DOS_FILE_SYSTEM ' #400b4-int21-1A#
     
     
     
     ' #1122b
     '  after compiling code check frmOrigCode.cmaxActualSource.Text  for accourences of device names
     '  from custom devices menu of the emulator, if something is found, start it!
     '  (must make sure duplicate isntances won't run before this -- done!)
'''''     check_if_external_device_needs_to_be_started
     
     
     
    ' bLOADING_FILE_TO_EMULATOR = False
     
     
     Exit Sub
err1:
     Debug.Print "loadFiletoEmULATE: " & LCase(Err.Description)
     'bLOADING_FILE_TO_EMULATOR = False
End Sub


'''' #3.27xd-start-dev#
'''Public Sub check_if_external_device_needs_to_be_started_PUBLIC()
'''On Error Resume Next ' 4.00-Beta-3
'''    check_if_external_device_needs_to_be_started
'''End Sub

'''''Private Sub check_if_external_device_needs_to_be_started()
'''''On Error GoTo err1
'''''
'''''    If Me.Visible Then '#1152 - bring up devices only when emulator is up.
'''''
'''''        Dim i As Integer
'''''        Dim sDeviceFileName As String
'''''
'''''        ' #327-newdir# -- overrall modification!
'''''
'''''        lLastLineChecked = -1 ' #404b-start-multi#
'''''check_for_more_device_directives:        ' #404b-start-multi#
'''''
'''''        sDeviceFileName = get_device_name_from_orig_source_code_if_any()
'''''
'''''        If sDeviceFileName <> "" Then
'''''
'''''            ' #327v-start-security.asm# - major redesign.
'''''
'''''            If InStr(1, sDeviceFileName, ":", vbTextCompare) > 0 Then
'''''
'''''                If LCase(get_property("emu8086.ini", "START_OUTSIDE_DEVICES_FOLDER", "false")) = "true" Then
'''''                    Shell sDeviceFileName, vbNormalFocus
'''''
'''''                    ' #404b-start-multi#
'''''                    If sDeviceFileName <> "" Then
'''''                        GoTo check_for_more_device_directives
'''''                    End If
'''''
'''''                    Exit Sub ' EXIT
'''''                Else
'''''                    Dim L As Long
'''''                    Dim s As String
'''''                    s = Add_BackSlash(App.Path) & "devices"
'''''                    L = Len(s)
'''''                    If InStr(1, sDeviceFileName, s, vbTextCompare) > 0 Then
'''''                            sDeviceFileName = Mid(sDeviceFileName, L + 1) ' cut out the standard path
'''''                    Else
'''''                            mBox Me, "#start=" & sDeviceFileName & "#" & vbNewLine & _
'''''                            cMT("cannot start this device") & vbNewLine & _
'''''                            cMT("because it is outside of the standard devices folder.") & vbNewLine & vbNewLine & _
'''''                            cMT("copy this file to") & " " & Add_BackSlash(App.Path) & "devices\ " & vbNewLine & _
'''''                            cMT("or set start_outside_devices_folder=true  in emu8086.ini")
'''''
'''''                            ' #404b-start-multi#
'''''                            If sDeviceFileName <> "" Then
'''''                                GoTo check_for_more_device_directives
'''''                            End If
'''''
'''''                            Exit Sub ' EXIT
'''''                    End If
'''''                End If
'''''
'''''            End If
'''''
'''''
'''''
'''''            For i = mnuExternalDevice.LBound To mnuExternalDevice.UBound
'''''                If mnuExternalDevice(i).Visible Then
'''''                    If StrComp(sDeviceFileName, mnuExternalDevice(i).Caption, vbTextCompare) = 0 Then
'''''                        mnuExternalDevice_Click (i) ' can start several devices if required.
'''''
'''''                        ' #404b-start-multi#
'''''                        If sDeviceFileName <> "" Then
'''''                            GoTo check_for_more_device_directives
'''''                        End If
'''''
'''''                        Exit Sub ' EXIT
'''''                    End If
'''''                End If
'''''            Next i
'''''
'''''
'''''            mBox Me, "#start=" & sDeviceFileName & "#" & vbNewLine & cMT("cannot start this device.") & vbNewLine & cMT("try to specify the complete file path and extension.")
'''''
'''''        End If
'''''
'''''
'''''    End If
'''''
'''''
'''''
'''''
'''''Exit Sub
'''''err1:
'''''    mBox Me, "#start=" & sDeviceFileName & "#" & vbNewLine & LCase(Err.Description)
'''''    Debug.Print "check_if_external_device_needs_to_be_started: " & LCase(Err.Description)
'''''End Sub


'Private Function get_device_name_from_orig_source_code_if_any() As String
'On Error GoTo err1
'
'    Dim L As Long
'    Dim L1 As Long
'    Dim L2 As Long
'    Dim s As String
'    Dim sSTART As String
'
'    ' #404b-start-multi# ' For L = 0 To frmOrigCode.cmaxActualSource.lineCount
'    If lLastLineChecked + 1 <= frmOrigCode.cmaxActualSource.lineCount Then ' #404b-start-multi#
'        For L = lLastLineChecked + 1 To frmOrigCode.cmaxActualSource.lineCount ' #404b-start-multi#
'            s = frmOrigCode.cmaxActualSource.getLine(L)
'            s = Trim(s)
'            If Mid(s, 1, 1) = "#" Then
'                s = Mid(s, 2) ' chop out first "#"
'                L1 = InStr(1, s, "=")
'                If L1 > 1 Then sSTART = Trim(UCase(Mid(s, 1, L1 - 1)))
'                If sSTART = "START" Then
'                        s = Mid(s, L1 + 1)
'                        L2 = InStr(1, s, "#")
'                        If L2 > 1 Then
'                            s = Mid(s, 1, L2 - 1)
'                        Else
'                            GoTo no_terminating_or_no_filename
'                        End If
'                        get_device_name_from_orig_source_code_if_any = Trim(s)
'                        Debug.Print "device directive found: " & s
'                        lLastLineChecked = L ' #404b-start-multi#
'                        Exit Function
'                End If
'            End If
'        Next L
'    End If
'
'no_terminating_or_no_filename:
'
'    get_device_name_from_orig_source_code_if_any = ""
'    ' Debug.Print "device directive not found"
'
'Exit Function
'err1:
'get_device_name_from_orig_source_code_if_any = ""
'Debug.Print "ERR: get_device_name_from_orig_source_code_if_any: " & Err.Description
'End Function





Private Sub load_cmd_parameters(sCMD_LINE As String, lSEGMENT As Long, lOFFSET As Long)
        
On Error GoTo err1

        Dim L As Long
        Dim j As Long
        
        L = Len(sCMD_LINE)
        
        ' set number of inputed chars to first byte
        ' in a buffer:
        RAM.mWRITE_BYTE lSEGMENT * 16 + lOFFSET, to_unsigned_byte(to_signed_int(L))
                                        
        For j = 1 To L
            ' +1 because first byte is an actual number of inputed chars:
            RAM.mWRITE_BYTE lSEGMENT * 16 + lOFFSET + j, to_unsigned_byte(myAsc(Mid(sCMD_LINE, j, 1)))
        Next j
        
        ' last char is "0Dh" (not counted as size
        ' of inputed chars, but placed in the buffer):
        RAM.mWRITE_BYTE lSEGMENT * 16 + lOFFSET + L + 1, &HD


    Exit Sub
err1:
    Debug.Print "ERR:##55 : " & Err.Description


End Sub

' 1.07 lLoadCS added:
Private Sub loadExecutable(sFilename As String, lLoadSegement As Integer)

On Error GoTo err_exe_load ' 2004-10-29-SEMENT-BUG fix.


    ' 1.07
    lPROG_LOADED_AT_ADR = to_unsigned_long(lLoadSegement) * 16

    lPROG_LOADED_AT_OFFSET = 0 ' always zero for .exe

    ' 1.07
    Dim lRelocTableSize As Long
    Dim lRelocTableAddress As Long
    

    CLEAR_DISASSEMBLY ' 4.00
    
    reset_CPU
    
    bTERMINATED = False
    
    Dim lFILE_SIZE As Long
    
    Dim tb As Byte
    Dim tb1 As Byte
    Dim tb2 As Byte
    Dim tb3 As Byte  ' 1.07

    Dim parsInHeader As Long ' UNSIGNED INT.

    Dim gFileNumber As Integer

    gFileNumber = FreeFile
    
    If Not FileExists(sFilename) Then
        mBox Me, cMT("file not found:") & vbNewLine & sFilename
        Exit Sub
    End If
    
    b_Do_DISASSEMBLE = False
    
    Open sFilename For Random Shared As gFileNumber Len = 1
    
        lFILE_SIZE = FileLen(sFilename)
        
        If lFILE_SIZE < 32 Then
            mBox Me, cMT("this file is too small," & vbNewLine & " exe file cannot possibly be less than 32 bytes...")
            Close gFileNumber
            Exit Sub
        End If
        
        ' 0000h - signature - 2 bytes
        Get gFileNumber, 1, tb ' first byte has index 1.
                   
        ' signature can be "MZ" (4d 5a) or "ZM" (5a 4d),
        ' only first byte is checked - no valid COM can start with this anyway.
        If Not ((tb = Val("&H4D")) Or (tb = Val("&H5A"))) Then
            mBox Me, cMT("exe signature not found!")
            Exit Sub
        End If
    
        ' 1.03
        Screen.MousePointer = vbHourglass

        ' 1.07
        ' 0006h - number of relocations - 2 bytes
        Get gFileNumber, 7, tb1
        Get gFileNumber, 8, tb2
        lRelocTableSize = to16bit_UNS(tb1, tb2)

        ' 0008h - paragraphs in header - 2 bytes
        Get gFileNumber, 9, tb1
        Get gFileNumber, 10, tb2
        parsInHeader = to16bit_UNS(tb1, tb2)
       
       
       
        ' 2.02#510
        Dim lSizeWithoutHeader As Long
        lSizeWithoutHeader = lFILE_SIZE - parsInHeader * 16
        CL = math_get_low_byte_of_word(to_signed_int(lSizeWithoutHeader))
        CH = math_get_high_byte_of_word(to_signed_int(lSizeWithoutHeader))



       
        ' 1.07 (this data is added to lLoadSegement param!!!)
        ' 000Eh - SS - 2 bytes
        Get gFileNumber, 15, tb1
        Get gFileNumber, 16, tb2
        SS = to16bit_SIGNED(tb1, tb2)
       
        ' 0010h - SP - 2 bytes
        Get gFileNumber, 17, tb1
        Get gFileNumber, 18, tb2
        SP = to16bit_SIGNED(tb1, tb2)
        
        ' 0014h - IP - 2 bytes
        Get gFileNumber, 21, tb1
        Get gFileNumber, 22, tb2
        IP = to16bit_SIGNED(tb1, tb2)
        
        ' 1.07 (this data is added to lLoadSegement param!!!)
        ' 0016h - CS - 2 bytes
        Get gFileNumber, 23, tb1
        Get gFileNumber, 24, tb2
        CS = to16bit_SIGNED(tb1, tb2)
        
        ' 1.07
        ' 0018h , 2 bytes: "Relocation table adress"
        Get gFileNumber, 25, tb1
        Get gFileNumber, 26, tb2
        lRelocTableAddress = to16bit_UNS(tb1, tb2)
        
        
        
        ' 1.07
        ' set CS by parameter, and set other registers, like
        ' seen in DOS debuger:
        CS = CS + lLoadSegement
        DS = lLoadSegement - &H10   ' points to PSP
        ES = lLoadSegement - &H10   ' points to PSP
        SS = SS + lLoadSegement
        
        
        ' LOAD PROGRAM INTO THE MEMORY
        ' LOADING TO ADDRESS lLoadSegment
                
        ' 1.07
        ' PSP define first two bytes of PSP:
        ' INT 20h (CD20)
        RAM.mWRITE_BYTE to_unsigned_long(DS) * 16 + 0, &HCD
        RAM.mWRITE_BYTE to_unsigned_long(DS) * 16 + 0 + 1, &H20
        
        
        Dim iPos As Long
        Dim j As Long
       
        ' "+1" because first index for Get is "1".
        iPos = parsInHeader * 16 + 1  ' skip header.
        
        ' 1.07
        j = to_unsigned_long(lLoadSegement) * 16
        
        DoEvents ' 2.57#722
        picLOADING.Visible = True
        cmdStopLoading.Visible = False
        bSTOP_LOADING = False
        DoEvents
        
        Do While iPos <= lFILE_SIZE
            Get gFileNumber, iPos, tb
            RAM.mWRITE_BYTE j, tb
            iPos = iPos + 1
            j = j + 1
            
            ' 2.57#722 Do not show this message for "Emu8086.exe" :)
            If (StrComp(ExtractFileName(sFilename), "EMU8086.exe", vbTextCompare) = 0) Or _
                (StrComp(ExtractFileName(sFilename), "UNINS000.exe", vbTextCompare) = 0) Then
                ' 5K is enough
                If iPos > 5000 Then Exit Do
            Else
                ' don't let to load files over 706,448 bytes!
                If iPos > 706447 Then GoTo file_too_big '2.08c#561b 1048576 '2.08#561 409600
            End If
            
            
            ' #327u-loadhuge#  - allow to break after every 5k if file is too big....
            If iPos > 5000 Then
               If (iPos Mod 5000 = 0) Then
                    cmdStopLoading.Visible = True
                    DoEvents
                    If bSTOP_LOADING Then GoTo stop_loading
                End If
            End If
            
        Loop
stop_loading:
        
        
        
        ' #1094 load several NOP instructions after the program's code into the emulator
        Dim lAddNops As Long
        Dim lj As Long ' jic: to avoid using same var.
        lj = j
        lAddNops = 20
        Do While lAddNops > 0
            RAM.mWRITE_BYTE lj, 144 ' 90h - NOP
            lj = lj + 1
            lAddNops = lAddNops - 1
        Loop
        ' and one hlt :)
        ' #327u-ret=hlt#
        RAM.mWRITE_BYTE lj, 244 ' F4h - HLT
        
        
        picLOADING.Visible = False ' 2.57#722
        DoEvents
         
GoTo skip_msg
file_too_big:
    mBox Me, cMT("file too big, only first 706,448 bytes are loaded.")
skip_msg:

        '===================================================
        ' 1.07 read relocation table, and update the memory:
        ' "+1" because the first byte in file has index 1 in VB!
        iPos = lRelocTableAddress + 1
        
        For j = 1 To lRelocTableSize

            ' offset inside segment:
            Get gFileNumber, iPos, tb
            iPos = iPos + 1
            Get gFileNumber, iPos, tb1
            iPos = iPos + 1
            ' segment anchor:
            Get gFileNumber, iPos, tb2
            iPos = iPos + 1
            Get gFileNumber, iPos, tb3
            iPos = iPos + 1

            ' 2004-10-29-SEMENT-BUG
            ' reported by Y.W. Lee and some other guy before,
            ' but Lee managed to make me find it :)

            ' as it was before fixing 2004-10-29-SEMENT-BUG
''''            RAM.mWRITE_BYTE to16bit_UNS(tb, tb1) + (to16bit_UNS(tb2, tb3) + lLoadSegement) * 16, Val("&H" & get_W_LowBits_STR(Hex(lLoadSegement)))
''''            RAM.mWRITE_BYTE to16bit_UNS(tb, tb1) + (to16bit_UNS(tb2, tb3) + lLoadSegement) * 16 + 1, Val("&H" & get_W_HighBits_STR(Hex(lLoadSegement)))
            
            ' 2004-10-29-SEMENT-BUG fix:
            ' it seems we have to add instead of overwrite:
            
            Dim originalVALUE As Integer ' keeps true difference between segements, stored in actual program's code and not in offset table of EXE header.
            
            originalVALUE = RAM.mREAD_WORD(to16bit_UNS(tb, tb1) + (to16bit_UNS(tb2, tb3) + lLoadSegement) * 16)
            
            Dim iCURRENT_SEGMENT_LOCATION As Integer ' the sum of address where the program was loaded, plus segment offset in code.
            
            iCURRENT_SEGMENT_LOCATION = to_signed_int(lLoadSegement + originalVALUE)
            
            RAM.mWRITE_WORD_i to16bit_UNS(tb, tb1) + (to16bit_UNS(tb2, tb3) + lLoadSegement) * 16, iCURRENT_SEGMENT_LOCATION
            
            ' for every J we write the same lLoadSegment, only the originalVALUE makes the differance.
            ' the size of Offset Table depends on how many places in code we have to alter before running the code.

            
        Next j
        '===================================================

    Close gFileNumber
       
    
    b_Do_DISASSEMBLE = True
    

    showMemory_at_Segment_Offset CS, IP
    
    
    ' 1.04
    bCOM_LOADED = False
    
    ' 1.04
    '20140415 ' loadDebugInfo sFilename
       
    ' 1.29#405
    load_SYMBOL_TABLE_from_FILE sFilename

    ' show disassembled code:
    Dim lT1 As Long
    lT1 = to_unsigned_long(CS) * 16 + to_unsigned_long(IP)
    DoDisassembling lT1
    selectDisassembled_Line_by_ADDRESS lT1, BLUE_SELECTOR

    'If bKEEP_DEBUG_LOG Then frmDebugLog.clearLog

    show_Registers  ' 1.21 moved below DoDisassembling() for #171.


    sOpenedExecutable = sFilename
    
    Me.Caption = "emulator: " & ExtractFileName(sOpenedExecutable) ' & " - " & sDefaultCaption

    ' 1.03
    Screen.MousePointer = vbDefault
    
   
    Exit Sub  ' 2004-10-29-SEMENT-BUG fix, and follows:
    
err_exe_load:

 Screen.MousePointer = vbDefault
 
 mBox Me, "executable load error:" & " " & vbNewLine & LCase(Err.Description)
 
End Sub

' 1.04 lLoadPrefix is position when file is being loaded,
'      for COM files it's 100H, for BIN files it depends on ".binf" file
' 1.11
'  bSetReturnToStack is true when required to add CD20 in the
'                    beggining of PSP (when PSP exists).
'  lMAX_BYTES_TO_LOAD - limitation of loaded bytes from a file,
'                       used to load only firt bootable track
'                       from a virtual floppy (not only).
' 2.02#510
'    bSET_CX_to_FILE_SIZE added.
Public Sub loadBinaryExecutable(sFilename As String, lLoadCS As Integer, lLoadIP As Integer, bSetReturnToStack As Boolean, lMAX_BYTES_TO_LOAD As Long, bSET_CX_to_FILE_SIZE As Boolean)

On Error GoTo err1

    CLEAR_DISASSEMBLY
    
    reset_CPU
    
    bTERMINATED = False
    
    Dim lFILE_SIZE As Long
    
    Dim tb As Byte
    Dim tb1 As Byte
    Dim tb2 As Byte

    Dim gFileNumber As Integer

    gFileNumber = FreeFile
    
    If Not FileExists(sFilename) Then
        mBox Me, cMT("file not found:") & vbNewLine & sFilename
        Exit Sub
    End If
    
    b_Do_DISASSEMBLE = False
    
    ' 1.03
    Screen.MousePointer = vbHourglass
    
    Open sFilename For Random Shared As gFileNumber Len = 1
    
        lFILE_SIZE = FileLen(sFilename)

        ' 2.02#510
        If bSET_CX_to_FILE_SIZE Then
            CL = math_get_low_byte_of_word(to_signed_int(lFILE_SIZE))
            CH = math_get_high_byte_of_word(to_signed_int(lFILE_SIZE))
        End If

        
        ' LOAD PROGRAM INTO THE MEMORY
        ' PSP (is zero)!
        
        Dim iPos As Long
        Dim j As Long
       
        ' "1" because first index for Get is "1".
        iPos = 1
        
        'ORG  100H
        ' ;A .COM program begins with 100H byte prefix
        ' Boot sector is loaded at 0000:7C00
        j = to_unsigned_long(lLoadCS) * 16 + to_unsigned_long(lLoadIP)   '&H100

        DoEvents ' 2.57#722
        picLOADING.Visible = True
        cmdStopLoading.Visible = False
        bSTOP_LOADING = False
        DoEvents
        
        Do While (iPos <= lFILE_SIZE) And (iPos <= lMAX_BYTES_TO_LOAD)
            Get gFileNumber, iPos, tb
            RAM.mWRITE_BYTE j, tb
            iPos = iPos + 1
            j = j + 1
            
            ' 1.10 do not load files over 40KB completely:
            '#1094b If iPos > 409600 Then GoTo file_too_big
            
            ' #327u-loadhuge#  - allow to break after every 5k if file is too big....
            If iPos > 5000 Then
               If (iPos Mod 5000 = 0) Then
                    cmdStopLoading.Visible = True
                    DoEvents
                    If bSTOP_LOADING Then GoTo stop_loading
                End If
            End If
            
        Loop
stop_loading:
        
        
        
        ' #1094 load several NOP instructions after the program's code into the emulator
        Dim lAddNops As Long
        Dim lj As Long ' jic: to avoid using same var.
        lj = j
        lAddNops = 20
        Do While lAddNops > 0
            RAM.mWRITE_BYTE lj, 144 ' 90h - NOP
            lj = lj + 1
            lAddNops = lAddNops - 1
        Loop
        ' and one hlt :)
        ' #327u-ret=hlt#
        RAM.mWRITE_BYTE lj, 244 ' F4h - HLT
        
        
        
        picLOADING.Visible = False ' 2.57#722
        DoEvents
        
GoTo skip_msg
'file_too_big:
'    mBox Me, cMT("file too big. first 40 kb are loaded.") & vbNewLine & _
'             cMT("if it's a floppy image, it will load itself in a subsequent boot process.")
'
skip_msg:
        
    Close gFileNumber
    
    ' 1.07
    ' set IP, CS according to parameters:
    IP = lLoadIP
    CS = lLoadCS
    ' set DS, ES, SS to CS segment (like in debugger)
    DS = CS
    ES = CS
    SS = CS
    
    ' do below only in case it's a .COM file!
    ' If (IP = &H100) Then
    If bSetReturnToStack Then
        ' as I saw it in debuger, the 2 first bytes
        ' of 100 byte prefix of COM file loaded into memory
        ' is CD20 (INT 20h) , and stack pointer points to it,
        ' so when RETN is made the program exits to OS:
        RAM.mWRITE_BYTE to_unsigned_long(CS) * 16 + 0, &HCD
        RAM.mWRITE_BYTE to_unsigned_long(CS) * 16 + 0 + 1, &H20
        ' 1.07 - SS = 0
        SP = &HFFFE
        ' 1.03
        ' the point where it returns is 0000,
        ' so stack should have this value (generally it's already zero,
        ' but could be something else from previous program):
        RAM.mWRITE_WORD_i to_unsigned_long(SS) * 16 + to_unsigned_long(SP), &H0
        
        ' 1.07
    ' 1.12 moved below   lPROG_LOADED_AT_ADR = to_unsigned_long(lLoadCS) * 16

    ' 1.12 Else
        ' 1.07
    ' 1.12  moved below   lPROG_LOADED_AT_ADR = to_unsigned_long(lLoadCS) * 16 + to_unsigned_long(lLoadIP)
    End If
    
    
    ' 1.12
    ' BUGFIX#42
    ' only SEGMENT address effects the debug info (always!):
    ' 1.19
    ' the above is wrong if we are loading ".bin" file!!! so not always,
    ' though it can be fixed by adding ORG directive to source of ".bin" file!
    lPROG_LOADED_AT_ADR = to_unsigned_long(lLoadCS) * 16
    
    lPROG_LOADED_AT_OFFSET = to_unsigned_long(lLoadIP)

    showMemory_at_Segment_Offset CS, IP
    
    
    ' 1.04
    bCOM_LOADED = True
        
    ' 1.04
    '20140415 ' loadDebugInfo sFilename
    
    ' 1.29#405
    load_SYMBOL_TABLE_from_FILE sFilename

    b_Do_DISASSEMBLE = True

    ' show disassembled code:
    Dim lT1 As Long
    lT1 = to_unsigned_long(CS) * 16 + to_unsigned_long(IP)
    DoDisassembling lT1
    selectDisassembled_Line_by_ADDRESS lT1, BLUE_SELECTOR
        
    'If bKEEP_DEBUG_LOG Then frmDebugLog.clearLog
    
    show_Registers  ' 1.21 moved below DoDisassembling() for #171.
        
        
    sOpenedExecutable = sFilename
    
    Me.Caption = "emulator: " & ExtractFileName(sOpenedExecutable) ' & " - " & sDefaultCaption
    
    ' 1.03
    Screen.MousePointer = vbDefault
    
    
    ' 4.00 Beta-3
    Exit Sub
err1:
    Debug.Print "ERR:##335 : " & Err.Description
    Screen.MousePointer = vbDefault
    b_Do_DISASSEMBLE = True
End Sub



' convets byte to WORD by making all bits of Hight Byte be as
' a MSB of Low Byte:
Private Function to16bit_SIGNED_HB_MSB_LB(ByRef byteL As Byte) As Integer
On Error GoTo err1
    
    Dim temp As Long
    Dim byteH As Byte
    
    ' lower byte - on lower address!
    ' byte1 - lower byte!
    
    If byteL > 127 Then     ' MSB is 1 when byte is over 127.
        byteH = 255
    Else
        byteH = 0
    End If
    
    temp = byteH
    temp = temp * 256 ' shift left by 16.
    temp = temp + byteL
        
    to16bit_SIGNED_HB_MSB_LB = to_signed_int(temp)
    
    Exit Function
err1:
    Debug.Print "ERR:##1498 : " & Err.Description
    
End Function


' the same as the funciton above, just returns UNSIGNED INT (LONG used to ignore the sign)
Public Function to16bit_UNS(ByRef byteL As Byte, ByRef byteH As Byte) As Long
    
On Error GoTo err1

    Dim temp As Long
    
    ' lower byte - on lower address!
    ' byteL - lower byte!
    
    temp = byteH
    temp = temp * 256 ' shift left by 16.
    temp = temp + CLng(byteL) ' #v327p--over  ' jic :)
    
    
    to16bit_UNS = temp
    
    Exit Function
err1:
    Debug.Print "ERR:##9651 : " & Err.Description
End Function

Private Sub reset_CPU()

On Error GoTo err1

    AL = 0
    AH = 0
    BL = 0
    BH = 0
    CL = 0
    CH = 0
    DL = 0
    DH = 0
    CS = &H50 ' 1.25#309
    IP = 0 ' 1.25#309 &H500 ' 1.23 0
    SS = 0
    SP = 0
    BP = 0
    SI = 0
    DI = 0
    DS = 0
    ES = 0
    
    ' reset REP/REPE/REPZ/REPNE/REPNZ
    bDoREP = False
    bDoREPNE = False
    
    bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
    
    'reset flags: c z s o p a i d
    frmFLAGS.cbCF.ListIndex = 0
    frmFLAGS.cbZF.ListIndex = 0
    frmFLAGS.cbSF.ListIndex = 0
    frmFLAGS.cbOF.ListIndex = 0
    frmFLAGS.cbPF.ListIndex = 0
    frmFLAGS.cbAF.ListIndex = 0
    frmFLAGS.cbIF.ListIndex = 1 ' 1.21 default ' 0
    frmFLAGS.cbDF.ListIndex = 0
    
    ' #1073 bSTOP_ON_THE_NEXT_STEP = False
    
    ' #327u-hw-int#
'    If LCase(get_property("emu8086.ini", "HARDWARE_INTERRUPTS", "true")) <> "true" Then
'        frmFLAGS.cbIF.ListIndex = 0 ' disable hardware interrupts (untill program does sti or flag is manually changed to 1).
'    End If
    lblHW_INTERRUPT.Visible = False
    
    
    ResetStepBackRecording '#1095
    
    bEMULATOR_STOPED_ABNORMALLY = False
    
    
    ' 4.00
    lStartMemAddress = &H500
    
    
    CLEAR_DISASSEMBLY  ' 4.00
    
' #400b9-curdir#
''''    ' #400b6-vp#
''''    ' #400b7-defdrv#  fix!!! 2=C !!!
''''    set_DEFAULT_DRIVE 2  ' "C:"
     set_DOS_FILE_SYSTEM_DEFAULTS ' #400b9-curdir#
        
        
    
    ' #400b6-int21h_33h_23h#
    byteBREAK_FLAG = 1 ' by default on!
    
    
    ' #400b6-memory-block#
    CLEAR_DOS_ALOC_MEMORY
    
    
    
    
    
    
    
' hm.... crashes... when compiled into .exe
'''''    ' 4.00b20
'''''    Dim m As fpu87_STATE
'''''    MicroAsm_FINIT m
'''''    fpuGLOBAL_STATE = m


    
    ' #400b21-fpu-anti-crash2#
    If b_LOADED_frmFPU Then
        If bFPU_INIT_DONE Then  ' if yes, then re-init, otherwise left it zeroed
            ' #imporove-fpu-reset#
            ' WARNING !!! careful with THIS SUB!
            ' BECAUSE IT CRASHED READY .exe !!!
            INIT_FPU
            frmFPU.showFPU_STATE
        End If
    End If

    ' #400b21-fpu-anti-crash2# ' bFPU_INIT_DONE = False    ' make it reset on next step.

    
    
    
    ' #400b27-cb1#
    lYELLOW_SelectedMemoryLocation_FROM = 0
    lYELLOW_SelectedMemoryLocation_UNTIL = 0


    
    Exit Sub
err1:
    Debug.Print "err1211: " & Err.Description
    Resume Next
    
End Sub
 
Public Sub show_Registers_PUBLIC()
On Error Resume Next ' 4.00-Beta-3
    show_Registers
End Sub

Private Sub show_Registers()
    
    On Error GoTo err1
    
        bSHOWING_REGISTERS = True
    
        txtAL.Text = make_min_len(Hex(AL), 2, "0")
        txtAH.Text = make_min_len(Hex(AH), 2, "0")

        txtBL.Text = make_min_len(Hex(BL), 2, "0")
        txtBH.Text = make_min_len(Hex(BH), 2, "0")

        txtCL.Text = make_min_len(Hex(CL), 2, "0")
        txtCH.Text = make_min_len(Hex(CH), 2, "0")

        txtDL.Text = make_min_len(Hex(DL), 2, "0")
        txtDH.Text = make_min_len(Hex(DH), 2, "0")

        txtCS.Text = make_min_len(Hex(CS), 4, "0")
        txtIP.Text = make_min_len(Hex(IP), 4, "0")


        ' 1.04
        Dim lTemp As Long
        lTemp = to_unsigned_long(CS) * 16 + to_unsigned_long(IP)
        
        
        
        If sDEBUGED_file <> "" Then
            ' 1.07 " - lPROG_LOADED_AT_ADR" added:
            selectSourceLineAtLocation lTemp - lPROG_LOADED_AT_ADR, True
        End If
                    
        
        ' #400b9-blue-all-bytes# ' selectMemoryLine_BLUE lTemp, lTemp, True
        selectDisassembled_Line_by_ADDRESS lTemp, BLUE_SELECTOR, True ' #400b9-blue-all-bytes#    ",True" ADDED!


        txtSS.Text = make_min_len(Hex(SS), 4, "0")
        txtSP.Text = make_min_len(Hex(SP), 4, "0")
        

        If b_LOADED_frmStack Then frmStack.setStackView
                
                
        txtBP.Text = make_min_len(Hex(BP), 4, "0")

        txtSI.Text = make_min_len(Hex(SI), 4, "0")
        txtDI.Text = make_min_len(Hex(DI), 4, "0")
        
        txtDS.Text = make_min_len(Hex(DS), 4, "0")
        txtES.Text = make_min_len(Hex(ES), 4, "0")


        ' 1.25
        ' should update because bSHOWING_REGISTER is set
        ' to "True":
        If bUPDATE_ExtendedRegisterView Then
            frmExtendedViewer.update_info
        End If

        
        ' 4.00b20
        If b_LOADED_frmFPU Then
            frmFPU.showFPU_STATE
        End If



        bSHOWING_REGISTERS = False
        
        
        Exit Sub
err1:
    Debug.Print "err1191: " & Err.Description
    Resume Next
End Sub

Private Sub doStep()

On Error GoTo error_on_step


' what ever, this is too banal, let 'em click :)
''    If bLOADING_FILE_TO_EMULATOR Then ' jic.
''        Debug.Print "cannot run now! still loading!"
''        Exit Sub
''    End If
    

   ' #1191
   bINPUT_OUTPUT_REDIRECTED = False
   bINPUT_OUTPUT_REDIRECTED_SUCCESS = False








    ' 2004.09.17
    Dim bSET_CARRY_CAUSE_17BIT As Boolean
    Dim bSET_CARRY_CAUSE_9BIT As Boolean

    ' 1.17
    bSTOP_EVERYTHING = False

    ' 1.07 (used in CALL ed, INT ib)
    Dim returnIP As Integer
    Dim returnCS As Integer

    Dim tbFIRST As Byte
    Dim tb1 As Byte
    Dim tb2 As Byte
    Dim lMEM_POINTER As Long
    Dim lTemp As Long
    Dim lTemp2 As Long
    Dim curTemp As Currency
    Dim bRegIndex As Byte
    Dim bRegValue As Byte
    Dim wRegValue As Integer
    Dim i As Byte
    Dim iTemp1 As Integer
    Dim iTemp2 As Integer
    Dim bTemp1 As Byte
    Dim bTemp2 As Byte
    
    Dim sS1 As String
    
'    Dim eaTAB As Byte
'    Dim eaROW As Byte
    
    Dim mtRT As type_eaROW_eaTAB
    
    ' keeps return values of get_EA_loc_and_size_BYTE():
    Dim mtLOC_SIZE As type_Size_and_Location
    
    Dim addTO_IP As Integer
    ' default is 0, could be changed by JMP/JCC:
    addTO_IP = 0
    
    Dim doJCC As Boolean
    ' sets to TRUE when any kind of JCC is done:
    doJCC = False


    ' 1.07
    ' when true the code is re-Disassembled in the end of
    ' doStep(), used for relative JMPs,
    ' has no meaning when JumpOut_of_doStep() is called:
    Dim bReDisassemble As Boolean
    bReDisassemble = False
    

        ' set current byte to CS:IP
'        curByte = to_unsigned_long(CS) * 16 + IP
        ' 1.11 fixed (bug found when loading FreeDos):
        curByte = to_unsigned_long(CS) * 16 + to_unsigned_long(IP)
        
    
        ' TODO check available memory! (so that we aren't at the end of MEMORY array or too close to it).
       
        '================================================
        
        tbFIRST = RAM.mREAD_BYTE(curByte)
        
        '================= MOV OPCODES =============================
        ' A0 iw       MOV AL,xb
        If (tbFIRST = 160) Then  ' A0
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    curByte = curByte + 1
                    tb2 = RAM.mREAD_BYTE(curByte)
                    lMEM_POINTER = to16bit_UNS(tb1, tb2)
                    lTemp = get_SEGMENT_LOCATION(255)
                    lMEM_POINTER = lMEM_POINTER + lTemp
                    AL = RAM.mREAD_BYTE(lMEM_POINTER)
                    '[SDEC_DEBUG_v120] sDECODED = "MOV AL, [" & toHexForm(lMEM_POINTER) & "]"
                    
        ' A1 iw       MOV AX,xw
        ElseIf (tbFIRST = 161) Then  ' A1
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    curByte = curByte + 1
                    tb2 = RAM.mREAD_BYTE(curByte)
                    lMEM_POINTER = to16bit_UNS(tb1, tb2)
                    lTemp = get_SEGMENT_LOCATION(255)
                    lMEM_POINTER = lMEM_POINTER + lTemp
                    AL = RAM.mREAD_BYTE(lMEM_POINTER)
                    AH = RAM.mREAD_BYTE(lMEM_POINTER + 1)
                    '[SDEC_DEBUG_v120] sDECODED = "MOV AX, [" & toHexForm(lMEM_POINTER) & "]"

        ' A2 iw       MOV xb,AL
        ElseIf (tbFIRST = 162) Then      ' A2
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    curByte = curByte + 1
                    tb2 = RAM.mREAD_BYTE(curByte)
                    lMEM_POINTER = to16bit_UNS(tb1, tb2)
                    lTemp = get_SEGMENT_LOCATION(255)
                    lMEM_POINTER = lMEM_POINTER + lTemp
                    RAM.mWRITE_BYTE lMEM_POINTER, AL
                    '[SDEC_DEBUG_v120] sDECODED = "MOV [" & toHexForm(lMEM_POINTER) & "] , AL"

        ' A3 iw       MOV xw,AX
        ElseIf (tbFIRST = 163) Then  ' A3
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    curByte = curByte + 1
                    tb2 = RAM.mREAD_BYTE(curByte)
                    lMEM_POINTER = to16bit_UNS(tb1, tb2)
                    lTemp = get_SEGMENT_LOCATION(255)
                    lMEM_POINTER = lMEM_POINTER + lTemp
                    RAM.mWRITE_BYTE lMEM_POINTER, AL
                    RAM.mWRITE_BYTE lMEM_POINTER + 1, AH
                    '[SDEC_DEBUG_v120] sDECODED = "MOV [" & toHexForm(lMEM_POINTER) & "] , AX"

        'C6 /0 ib    MOV eb,ib
        ElseIf (tbFIRST = 198) Then  ' C6
                    '[SDEC_DEBUG_v120] sDECODED = "MOV BYTE PTR "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    tb2 = get_ROW_INDEX_IN_EA(tb1, 0)
                    If (tb2 = 255) Then
                        mBox Me, "wrong C6 address on doStep()"
                    Else
                        store_FOLLOWING_BYTE_at_EA tb2 ' ib is the last byte of the command.
                    End If

        ' 88 /r       MOV eb,rb
        ElseIf (tbFIRST = 136) Then
                    '[SDEC_DEBUG_v120] sDECODED = "MOV "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    For i = 0 To 7
                        If (get_ROW_INDEX_IN_EA(tb1, i) <> 255) Then
                            tb2 = get_ROW_INDEX_IN_EA(tb1, i)
                            bRegIndex = i
                            Exit For
                        End If
                    Next i
                    bRegValue = get_BYTE_RegValue(bRegIndex)
                    store_BYTE_at_EA tb2, bRegValue
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rb(bRegIndex)

        ' 8A /r       MOV rb,eb
        ElseIf (tbFIRST = 138) Then
                    '[SDEC_DEBUG_v120] sDECODED = "MOV "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    For i = 0 To 7
                        If (get_ROW_INDEX_IN_EA(tb1, i) <> 255) Then
                            tb2 = get_ROW_INDEX_IN_EA(tb1, i)
                            bRegIndex = i
                            Exit For
                        End If
                    Next i
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & g_EA_TCAP_rb(bRegIndex) & ", "
                    store_BYTE_RegValue bRegIndex, get_BYTE_at_EA(tb2)

        ' 8B /r       MOV rw,ew
        ElseIf (tbFIRST = 139) Then
                    '[SDEC_DEBUG_v120] sDECODED = "MOV "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    For i = 0 To 7
                        If (get_ROW_INDEX_IN_EA(tb1, i) <> 255) Then
                            tb2 = get_ROW_INDEX_IN_EA(tb1, i)
                            bRegIndex = i
                            Exit For
                        End If
                    Next i
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & g_EA_TCAP_rw(bRegIndex) & ", "
                    store_WORD_RegValue bRegIndex, get_WORD_at_EA(tb2)

        ' C7 /0 iw    MOV ew,iw
        ElseIf (tbFIRST = 199) Then  ' C7
                    '[SDEC_DEBUG_v120] sDECODED = "MOV WORD PTR "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    tb2 = get_ROW_INDEX_IN_EA(tb1, 0)
                    If (tb2 = 255) Then
                        mBox Me, "wrong C7 address on doStep()"
                    Else
                        store_FOLLOWING_WORD_at_EA tb2 ' iw are the last bytes of the command.
                    End If

        ' 89 /r       MOV ew,rw
        ElseIf (tbFIRST = 137) Then      ' 89
                    '[SDEC_DEBUG_v120] sDECODED = "MOV "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    For i = 0 To 7
                        If (get_ROW_INDEX_IN_EA(tb1, i) <> 255) Then
                            tb2 = get_ROW_INDEX_IN_EA(tb1, i)
                            bRegIndex = i
                            Exit For
                        End If
                    Next i
                    wRegValue = get_WORD_RegValue(bRegIndex)
                    
                    store_WORD_at_EA tb2, math_get_low_byte_of_word(wRegValue), math_get_high_byte_of_word(wRegValue)
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rw(bRegIndex)


        ' 8C /1       MOV ew,CS
        ' 8C /3       MOV ew,DS
        ' 8C /0       MOV ew,ES
        ' 8C /2       MOV ew,SS
        ElseIf (tbFIRST = 140) Then
                    '[SDEC_DEBUG_v120] sDECODED = "MOV "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    
                    If (get_ROW_INDEX_IN_EA(tb1, 1) <> 255) Then
                        tb2 = get_ROW_INDEX_IN_EA(tb1, 1)
                        wRegValue = CS
                        bRegIndex = 1
                    ElseIf (get_ROW_INDEX_IN_EA(tb1, 3) <> 255) Then
                        tb2 = get_ROW_INDEX_IN_EA(tb1, 3)
                        wRegValue = DS
                        bRegIndex = 3
                    ElseIf (get_ROW_INDEX_IN_EA(tb1, 0) <> 255) Then
                        tb2 = get_ROW_INDEX_IN_EA(tb1, 0)
                        wRegValue = ES
                        bRegIndex = 0
                    ElseIf (get_ROW_INDEX_IN_EA(tb1, 2) <> 255) Then
                        tb2 = get_ROW_INDEX_IN_EA(tb1, 2)
                        wRegValue = SS
                        bRegIndex = 2
                    Else
                        mBox Me, "wrong EA for [8C]"
                        GoTo donot_store_8c
                    End If

                    store_WORD_at_EA tb2, math_get_low_byte_of_word(wRegValue), math_get_high_byte_of_word(wRegValue)
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_s(bRegIndex)
donot_store_8c:

        ' B0+rb ib    MOV rb,ib
        ElseIf (tbFIRST >= 176) And (tbFIRST <= 183) Then     ' from B0 to B7
                     '[SDEC_DEBUG_v120] sDECODED = "MOV "
                     
                     curByte = curByte + 1
                     tb1 = RAM.mREAD_BYTE(curByte)
                     
                     Select Case tbFIRST
                     ' MOV AL, ib
                     Case 176       ' B0
                        AL = tb1
                        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "AL, "
                     ' MOV CL, ib
                     Case 177       ' B1
                        CL = tb1
                        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "CL, "
                     ' MOV DL, ib
                     Case 178       ' B2
                        DL = tb1
                        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DL, "
                     ' MOV BL, ib
                     Case 179       ' B3
                        BL = tb1
                        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BL, "
                     ' MOV AH, ib
                     Case 180       ' B4
                        AH = tb1
                        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "AH, "
                     ' MOV CH, ib
                     Case 181       ' B5
                        CH = tb1
                        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "CH, "
                     ' MOV DH, ib
                     Case 182       ' B6
                        DH = tb1
                        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DH, "
                     ' MOV BH, ib
                     Case 183       ' B7
                        BH = tb1
                        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BH, "
                     End Select

                     '[SDEC_DEBUG_v120] sDECODED = sDECODED & toHexForm(tb1)

        ' B8+rw iw    MOV rw,iw
        ElseIf (tbFIRST >= 184) And (tbFIRST <= 191) Then ' from B8 to BF
                    
                     '[SDEC_DEBUG_v120] sDECODED = "MOV "
                    
                     curByte = curByte + 1
                     tb1 = RAM.mREAD_BYTE(curByte)
                     curByte = curByte + 1
                     tb2 = RAM.mREAD_BYTE(curByte)
                     
                    
                     ' MOV AX, iw
                     If (tbFIRST = 184) Then     ' B8
                         AL = tb1
                         AH = tb2
                         '[SDEC_DEBUG_v120] sDECODED = sDECODED & "AX, "
                     ' MOV CX, iw
                     ElseIf (tbFIRST = 185) Then ' B9
                         CL = tb1
                         CH = tb2
                         '[SDEC_DEBUG_v120] sDECODED = sDECODED & "CX, "
                     ' MOV DX, iw
                     ElseIf (tbFIRST = 186) Then ' BA
                         DL = tb1
                         DH = tb2
                         '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DX, "
                     ' MOV BX, iw
                     ElseIf (tbFIRST = 187) Then ' BB
                         BL = tb1
                         BH = tb2
                         '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BX, "
                     ' MOV SP, iw
                     ElseIf (tbFIRST = 188) Then ' BC
                         SP = to16bit_SIGNED(tb1, tb2)
                         '[SDEC_DEBUG_v120] sDECODED = sDECODED & "SP, "
                     ' MOV BP, iw
                     ElseIf (tbFIRST = 189) Then ' BD
                         BP = to16bit_SIGNED(tb1, tb2)
                         '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BP, "
                     ' MOV SI, iw
                     ElseIf (tbFIRST = 190) Then ' BE
                         SI = to16bit_SIGNED(tb1, tb2)
                         '[SDEC_DEBUG_v120] sDECODED = sDECODED & "SI, "
                     ' MOV DI, iw
                     ElseIf (tbFIRST = 191) Then ' BF
                         DI = to16bit_SIGNED(tb1, tb2)
                         '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DI, "
                     End If
        
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & toHexForm(to16bit_SIGNED(tb1, tb2))
                            
                    
        ' 8E /3       MOV DS,mw      Move memory word into DS
        ' 8E /3       MOV DS,rw      Move word register into DS
        ' 8E /0       MOV ES,mw      Move memory word into ES
        ' 8E /0       MOV ES,rw      Move word register into ES
        ' 8E /2       MOV SS,mw      Move memory word into SS
        ' 8E /2       MOV SS,rw      Move word register into SS
        ElseIf (tbFIRST = 142) Then ' 8E
        
                     '[SDEC_DEBUG_v120] sDECODED = "MOV "
                    
                     curByte = curByte + 1
                     tb1 = RAM.mREAD_BYTE(curByte)
                     
                     ' 8E /3       MOV DS,ew
                     If (get_ROW_INDEX_IN_EA(tb1, 3) <> 255) Then
                        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DS, "
                        DS = get_WORD_at_EA(get_ROW_INDEX_IN_EA(tb1, 3))
                     ' 8E /0       MOV ES,ew
                     ElseIf (get_ROW_INDEX_IN_EA(tb1, 0) <> 255) Then
                        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "ES, "
                        ES = get_WORD_at_EA(get_ROW_INDEX_IN_EA(tb1, 0))
                     ' 8E /2       MOV SS,ew
                     ElseIf (get_ROW_INDEX_IN_EA(tb1, 2) <> 255) Then
                        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "SS, "
                        SS = get_WORD_at_EA(get_ROW_INDEX_IN_EA(tb1, 2))
                     End If
        '================= end of MOV OPCODES =============================
        
        '================= INT OPCODES =============================
        
        ' 1.08
        ' CC          INT 3          Interrupt 3 (trap to debugger) (far call, with flags pushed first)
        ElseIf (tbFIRST = &HCC) Then
            'If Not bREGISTERED Then GoTo share_ware
            
            ' 1.24#278
            If bDO_STEP_OVER_PROCEDURE Then
                 lCOUNTER_ENTER_PROCEDURE = lCOUNTER_ENTER_PROCEDURE + 1
            End If
            
                tb1 = 3
                '[SDEC_DEBUG_v120] sDECODED = "INT 3"
                GoTo enter_interupt_code_with_preset_tb1
            
        ' 1.08
        ' CE          INTO           Interrupt 4 if overflow flag is 1
        ElseIf (tbFIRST = &HCE) Then
            'If Not bREGISTERED Then GoTo share_ware
            
            ' 1.24#278
            If bDO_STEP_OVER_PROCEDURE Then
                 lCOUNTER_ENTER_PROCEDURE = lCOUNTER_ENTER_PROCEDURE + 1
            End If
        
            If frmFLAGS.cbOF.ListIndex = 1 Then
                tb1 = 4
                '[SDEC_DEBUG_v120] sDECODED = "INTO"
                GoTo enter_interupt_code_with_preset_tb1
            End If
            
        ' CD ib       INT ib
        ElseIf (tbFIRST = &HCD) Then
            'If Not bREGISTERED Then GoTo share_ware
            
            ' 1.24#278
            If bDO_STEP_OVER_PROCEDURE Then
                 lCOUNTER_ENTER_PROCEDURE = lCOUNTER_ENTER_PROCEDURE + 1
            End If
            
' before 1.07
'                    curByte = curByte + 1
'                    tb1 = RAM.mREAD_BYTE(curByte)
'                    do_INTERUPT (tb1)
'                    '[SDEC_DEBUG_v120] sDECODED = "INT " & toHexForm(tb1)
        
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    '[SDEC_DEBUG_v120] sDECODED = "INT " & toHexForm(tb1)

' 1.08 (for INTO, INT 3 and "division by zero"):
enter_interupt_code_with_preset_tb1:

        ' +++ copied from CALL ed +++ (except PUSHF)
                    
                    
                    
                    
                    
                    ' return address (next byte after the last processed):
    ' BUG  #1014 - 2005-03-13 '    returnIP = curByte - to_unsigned_long(CS) * 16 + 1
                    returnIP = to_signed_int(curByte - to_unsigned_long(CS) * 16 + 1)
                    returnCS = CS
                    
                    
                    
                    
                    
                    
' 1.09 this can be later used for making INT 0 to return
'      to DIV/IDIV instruction instead of the next instruction:

                    ' get address from Interupt Table:
                    ' first 2 bytes are the offset, next 2 bytes segment:
                    
    '--------------
                    
' BUG FIX 2004-10-23
'''''                    IP = RAM.mREAD_WORD(to_signed_byte(tb1) * 4)
'''''                    CS = RAM.mREAD_WORD(to_signed_byte(tb1) * 4 + 2)
'''''

' #327u-hw-int#
' v327u - clearly it's usless to do signed/unsigned...
'                    IP = RAM.mREAD_WORD(to_unsigned_byte(to_signed_byte(tb1)) * 4)
'                    CS = RAM.mREAD_WORD(to_unsigned_byte(to_signed_byte(tb1)) * 4 + 2)
                    IP = RAM.mREAD_WORD(tb1 * 4)
                    CS = RAM.mREAD_WORD(CLng(tb1 * 4) + 2)



    '--------------

                    ' curByte is not updated,
                    ' because it seems to be irrelevant here,
                    ' because IP changes anyway.

                    ' -- copied from PUSHF --
                    ' get flags register & push it:
                    wRegValue = frmFLAGS.getFLAGS_REGISTER16
                    stackPUSH wRegValue
                    

                    ' store CS in STACK:
                    stackPUSH returnCS
                    
                    ' store return IP it in STACK:

                    stackPUSH returnIP


                    ' 1.21 #172
                    ' IRET will POP flags, so it will stay
                    ' this way only while executing interupt:
                    frmFLAGS.cbIF.ListIndex = 0


                    ' 1.07
                    JumpOut_of_doStep '[SDEC_DEBUG_v120]  sDECODED
                    Exit Sub
    
        
        '================= end of INT OPCODES =============================
        
        '================= JMP OPCODES =============================

        ' EB cb       JMP cb         Jump short (signed byte relative to next instruction)
        ElseIf (tbFIRST = 235) Then ' EB
                     curByte = curByte + 1
                     addTO_IP = to_signed_byte(RAM.mREAD_BYTE(curByte))
                     '[SDEC_DEBUG_v120] sDECODED = "JMP " & toHexForm((curByte - to_unsigned_long(CS) * 16) + addTO_IP + 1)
                     ' 1.07
                     bReDisassemble = True
                     
        ' 1.05
        ' E9 cw       JMP cw         Jump near (word offset relative to next instruction)
        ElseIf (tbFIRST = &HE9) Then
                     curByte = curByte + 1
                     tb1 = RAM.mREAD_BYTE(curByte)
                     curByte = curByte + 1
                     tb2 = RAM.mREAD_BYTE(curByte)
                     addTO_IP = to16bit_SIGNED(tb1, tb2)
                     '[SDEC_DEBUG_v120] sDECODED = "JMP " & toHexForm((curByte - to_unsigned_long(CS) * 16) + addTO_IP + 1)
                     ' 1.07
                     bReDisassemble = True
                     
        ' 1.05 (updated)
        ' EA cd       JMP cd
        ElseIf (tbFIRST = &HEA) Then
                    curByte = curByte + 1
                    IP = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 2
                    CS = RAM.mREAD_WORD(curByte)
                     curByte = curByte + 1 ' #DO_NOT_UNDERSTAND_1# ' now I do, it's not required to update curByte here at all because it is reset on the next call to doStep.
                    '[SDEC_DEBUG_v120] sDECODED = "JMP " & toHexForm(CS) & ":" & toHexForm(IP)
                    
                    ' 1.07
                    JumpOut_of_doStep '[SDEC_DEBUG_v120] sDECODED
                    Exit Sub
                        
        '================= end of JMP OPCODES =============================
        
        '================= [FF] OPCODES =============================
        ' FF /0       INC ew
        ' FF /1       DEC ew
        ' FF /2       CALL ew
        ' FF /3       CALL ed
        ' FF /4       JMP ew         Jump near to EA word (absolute offset)
        ' FF /5       JMP md         Jump far (4-byte address in memory doubleword)
        ' FF /6       PUSH mw
        
        ' FF /7 (not used by 8086, I'm using "FFFF" as a start up word value
        '        for my BIOS call simulation).
        
        ElseIf (tbFIRST = 255) Then ' FF
        
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    
                    mtRT = get_eaROW_eaTAB(tb1)
        
                    Select Case mtRT.bTAB
                    
                    ' FF /0       INC ew
                    Case 0
                        '[SDEC_DEBUG_v120] sDECODED = "INC "
                        mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                        curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                        iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                        ALU.inc_WORD iTemp1, True
                        RAM.mWRITE_WORD mtLOC_SIZE.lLoc, ALU.GET_C_lb(), ALU.GET_C_hb()

                    ' FF /1       DEC ew
                    Case 1
                        '[SDEC_DEBUG_v120] sDECODED = "DEC "
                        mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                        curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                        iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                        ALU.dec_WORD iTemp1, True
                        RAM.mWRITE_WORD mtLOC_SIZE.lLoc, ALU.GET_C_lb(), ALU.GET_C_hb()
                    
                    ' FF /2       CALL ew        Call near, offset absolute at EA word
                    Case 2
                        'If Not bREGISTERED Then GoTo share_ware
                        
                        
                        
                        '[SDEC_DEBUG_v120] sDECODED = "CALL "
                        ' get memory word
                        mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                        curByte = curByte + mtLOC_SIZE.iSize    ' point to NEXT byte after processed.
                                              
                        ' calculate return IP and store it in STACK:
                        iTemp1 = to_signed_int(curByte - to_unsigned_long(CS) * 16)
                        ' decrement SP by 2
                        'SP = mathSub_WORDS(SP, 2)
                        
                        ' 1.20 -- ALU.sub_WORDS SP, 2, False
                        ' 1.20 -- SP = ALU.GET_C_SIGNED
                        
                        ' calculate SP+SS*16
                        'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                        ' Set SS:[SP] to memory word (IP to return to)
                        'RAM.mWRITE_WORD_i lMEM_POINTER, iTemp1
                        
                        stackPUSH iTemp1
                        
                        IP = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                        
                        ' 1.07
                        JumpOut_of_doStep '[SDEC_DEBUG_v120] sDECODED
                        Exit Sub
                    
                    
                    ' 1.07 (updated)
                    ' FF /3       CALL ed        Call far segment, address at EA doubleword
                    Case 3
                        'If Not bREGISTERED Then GoTo share_ware
                        
                        
                        
                        returnIP = to_signed_int(curByte - to_unsigned_long(CS) * 16)
                        returnCS = CS
                        
                        '[SDEC_DEBUG_v120] sDECODED = "CALL "
                        ' get memory word
                        mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)

                        ' I'm not really sure why it works, but it works!
                        ' even for JMP [DI].
                        IP = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                        CS = RAM.mREAD_WORD(mtLOC_SIZE.lLoc + 2)
                        
                        '[SDEC_DEBUG_v120] sDECODED = sDECODED & " ; " & toHexForm(CS) & ":" & toHexForm(IP)
                        
                        ' curByte is not updated,
                        ' because it seems to be irrelevant here,
                        ' because IP changes anyway.

                        ' store CS in STACK:
                        ' decrement SP by 2
                        'SP = mathSub_WORDS(SP, 2)
                        
                        ' 1.20 ALU.sub_WORDS SP, 2, False
                        ' 1.20 SP = ALU.GET_C_SIGNED
                        
                        
                        ' calculate SP+SS*16
                        'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                        ' Set SS:[SP] to memory word (CS to return to)
                        'RAM.mWRITE_WORD_i lMEM_POINTER, returnCS
                        
                        stackPUSH returnCS

                        ' calculate return IP and store it in STACK:
                        ' "+4" point to the next byte after current instruction:
                        returnIP = to_signed_int(returnIP + mtLOC_SIZE.iSize) ' point to next instruction after CALL!
                        ' decrement SP by 2
                        'SP = mathSub_WORDS(SP, 2)
                        
                        ' 1.20 -- ALU.sub_WORDS SP, 2, False
                        ' 1.20 -- SP = ALU.GET_C_SIGNED
                        
                        
                        ' calculate SP+SS*16
                        'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                        ' Set SS:[SP] to memory word (IP to return to)
                        'RAM.mWRITE_WORD_i lMEM_POINTER, returnIP
                        
                        stackPUSH returnIP


                        ' 1.07
                        JumpOut_of_doStep '[SDEC_DEBUG_v120] sDECODED
                        Exit Sub
                        
                        
                    ' FF /4       JMP ew         Jump near to EA word (absolute offset)
                    Case 4
                        '[SDEC_DEBUG_v120] sDECODED = "JMP "
                        ' get memory word
                        mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                        ' this seems to be irrelevant here, because IP changes anyway:
                        curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                        IP = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                        
                        ' 1.07
                        JumpOut_of_doStep '[SDEC_DEBUG_v120]  sDECODED
                        Exit Sub
                    
                    ' 1.05 (updated)
                    ' FF /5       JMP md         Jump far (4-byte address in memory doubleword)
                    Case 5
                        '[SDEC_DEBUG_v120] sDECODED = "JMP "
                        ' get memory word
                        mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)

                        ' I'm not really sure why it works, but it works!
                        ' even for JMP [DI].
                        IP = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                        CS = RAM.mREAD_WORD(mtLOC_SIZE.lLoc + 2)
                        
                        '[SDEC_DEBUG_v120] sDECODED = sDECODED & " ; " & toHexForm(CS) & ":" & toHexForm(IP)
                        
                        ' curByte is not updated,
                        ' because it seems to be irrelevant here,
                        ' because IP changes anyway.

                        ' 1.07
                        JumpOut_of_doStep '[SDEC_DEBUG_v120] sDECODED
                        Exit Sub

                    
                    ' FF /6       PUSH mw
                    Case 6
                        '[SDEC_DEBUG_v120] sDECODED = "PUSH "
                        ' get memory word
                        mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                        curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                        iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                        ' decrement SP by 2
                        'SP = mathSub_WORDS(SP, 2)
                        
                        ' 1.20 ALU.sub_WORDS SP, 2, False
                        ' 1.20 SP = ALU.GET_C_SIGNED
                        
                        
                        ' calculate SP+SS*16
                        'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                        ' Set SS:[SP] to memory word
                        'RAM.mWRITE_WORD_i lMEM_POINTER, iTemp1
                        
                        stackPUSH iTemp1
                        
                    ' FF /7 (not used by 8086, I'm using "FFFF" as a start up word value
                    '        for my BIOS call simulation).
                    Case 7
                        ' 1.07
                        '  mBox Me, "FF /7    -   no such opcode in 8086 INSTRUCTION SET!"
                        '  Exit Sub
                        curByte = curByte + 1
                        tb1 = RAM.mREAD_BYTE(curByte)
                                               
                        ' emulation of interupt ("FFFFCD??"):
                        If (mtRT.bROW = 31) And (tb1 = &HCD) Then
                            curByte = curByte + 1
                            tb2 = RAM.mREAD_BYTE(curByte)
                            do_INTERUPT (tb2)
                            '#327r-stopeverything# never do exit sub ouf to doStep!' If bSTOP_EVERYTHING Then Exit Sub ' 1.17
                           ' doesn't help too....' If bTERMINATED Then Exit Sub ' this should help! #327s-load-in-input-mode-bug#
                        End If
                        
                    End Select
        
        '================= end of [FF] OPCODES =============================
                
        '================= INC rw OPCODES =============================
        ' 40+rw       INC rw
        ElseIf (tbFIRST >= 64) And (tbFIRST <= 71) Then   ' from 40h to 40h+7
                    bRegIndex = tbFIRST - 64
                    wRegValue = get_WORD_RegValue(bRegIndex)
                    ALU.inc_WORD wRegValue, True
                    store_WORD_RegValue bRegIndex, ALU.GET_C_SIGNED
                    '[SDEC_DEBUG_v120] sDECODED = "INC " & g_EA_TCAP_rw(bRegIndex)
        '================= end of INC rw OPCODES =============================
                
        '================= DEC rw OPCODES =============================
        ' 48+rw  DEC rw
        ElseIf (tbFIRST >= 72) And (tbFIRST <= 79) Then   ' from 48h to 48h+7
                    bRegIndex = tbFIRST - 72
                    wRegValue = get_WORD_RegValue(bRegIndex)
                    ALU.dec_WORD wRegValue, True
                    store_WORD_RegValue bRegIndex, ALU.GET_C_SIGNED
                    '[SDEC_DEBUG_v120] sDECODED = "DEC " & g_EA_TCAP_rw(bRegIndex)
        '================= end of DEC rw OPCODES =============================
        
        '================= SEGMENT REPLACEMENT OPCODES =============================
        ' 26            ES:
        ' 2E            CS:
        ' 36            SS:
        ' 3E            DS:

        ' 26            ES:
        ElseIf (tbFIRST = 38) Then   ' 26
                    bSEGMENT_REPLACEMENT = True
                    sSEGMENT_REPLACEMENT_NAME = "ES"
                    '[SDEC_DEBUG_v120] sDECODED = "ES:"
            
        ElseIf (tbFIRST = 46) Then   ' 2E
                    bSEGMENT_REPLACEMENT = True
                    sSEGMENT_REPLACEMENT_NAME = "CS"
                    '[SDEC_DEBUG_v120] sDECODED = "CS:"
                    
        ElseIf (tbFIRST = 54) Then   ' 36
                    bSEGMENT_REPLACEMENT = True
                    sSEGMENT_REPLACEMENT_NAME = "SS"
                    '[SDEC_DEBUG_v120] sDECODED = "SS:"

        ElseIf (tbFIRST = 62) Then   ' 3E
                    bSEGMENT_REPLACEMENT = True
                    sSEGMENT_REPLACEMENT_NAME = "DS"
                    '[SDEC_DEBUG_v120] sDECODED = "DS:"

        '================= end of SEGMENT REPLACEMENT OPCODES =============================


        '================= JCC OPCODES =============================
        ' 70 cb       JO cb          Jump short if overflow (OF=1)
        ' 71 cb       JNO cb         Jump short if not overflow (OF=0)
        ' 72 cb       JNAE cb        Jump short if not above or equal (CF=1)
        ' 72 cb       JC cb          Jump short if carry (CF=1)
        ' 72 cb       JB cb          Jump short if below (CF=1)             below=UNSIGNED
        ' 73 cb       JNC cb         Jump short if not carry (CF=0)
        ' 73 cb       JNB cb         Jump short if not below (CF=0)
        ' 73 cb       JAE cb         Jump short if above or equal (CF=0)
        ' 74 cb       JZ cb          Jump short if zero (ZF=1)
        ' 74 cb       JE cb          Jump short if equal (ZF=1)
        ' 75 cb       JNE cb         Jump short if not equal (ZF=0)
        ' 75 cb       JNZ cb         Jump short if not zero (ZF=0)
        ' 76 cb       JNA cb         Jump short if not above (CF=1 or ZF=1)
        ' 76 cb       JBE cb         Jump short if below or equal (CF=1 or ZF=1)
        ' 77 cb       JNBE cb        Jump short if not below or equal (CF=0 and ZF=0)
        ' 77 cb       JA cb          Jump short if above (CF=0 and ZF=0)    above=UNSIGNED
        ' 78 cb       JS cb          Jump short if sign (SF=1)
        ' 79 cb       JNS cb         Jump short if not sign (SF=0)
        ' 7A cb       JP cb          Jump short if parity (PF=1)
        ' 7A cb       JPE cb         Jump short if parity even (PF=1)
        ' 7B cb       JNP cb         Jump short if not parity (PF=0)
        ' 7B cb       JPO cb         Jump short if parity odd (PF=0)
        ' 7C cb       JNGE cb        Jump short if not greater or equal (SF/=OF)
        ' 7C cb       JL cb          Jump short if less (SF/=OF)                less=SIGNED
        ' 7D cb       JNL cb         Jump short if not less (SF=OF)
        ' 7D cb       JGE cb         Jump short if greater or equal (SF=OF)
        ' 7E cb       JNG cb         Jump short if not greater (ZF=1 or SF/=OF)
        ' 7E cb       JLE cb         Jump short if less or equal (ZF=1 or SF/=OF)
        ' 7F cb       JNLE cb        Jump short if not less or equal (ZF=0 and SF=OF)
        ' 7F cb       JG cb          Jump short if greater (ZF=0 and SF=OF)  greater=SIGNED
        ' E3 cb       JCXZ cb        Jump short if CX register is zero
        '
        ' Default names:
        '    70          JO
        '    71          JNO
        '    72          JB
        '    73          JNB
        '    74          JZ
        '    75          JNZ
        '    76          JBE
        '    77          JA
        '    78          JS
        '    79          JNS
        '    7A          JPE
        '    7B          JPO
        '    7C          JL
        '    7D          JGE
        '    7E          JLE
        '    7F          JG
        '    E3          JCXZ cb
        '
        ElseIf ((tbFIRST >= 112) And (tbFIRST <= 127)) Or (tbFIRST = &HE3) Then   ' 70 - 7F
                        
                    'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
                    
                        
                    Select Case tbFIRST
                    
                    ' 70          JO
                    Case 112
                        If (frmFLAGS.cbOF.ListIndex = 1) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JO "
                    
                    ' 71          JNO
                    Case 113
                        If (frmFLAGS.cbOF.ListIndex = 0) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JNO "
                        
                    ' 72          JB
                    Case 114
                        If (frmFLAGS.cbCF.ListIndex = 1) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JB "
                    
                    ' 73          JNB
                    Case 115
                        If (frmFLAGS.cbCF.ListIndex = 0) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JNB "
                        
                    ' 74          JZ
                    Case 116
                        If (frmFLAGS.cbZF.ListIndex = 1) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JZ "
                        
                    ' 75          JNZ
                    Case 117
                        If (frmFLAGS.cbZF.ListIndex = 0) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JNZ "
                    
                    ' 76          JBE
                    Case 118
                        If (frmFLAGS.cbCF.ListIndex = 1) _
                            Or (frmFLAGS.cbZF.ListIndex = 1) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JBE "
                    
                    ' 77          JA
                    Case 119
                        If (frmFLAGS.cbCF.ListIndex = 0) _
                            And (frmFLAGS.cbZF.ListIndex = 0) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JA "
                        
                    ' 78          JS
                    Case 120
                        If (frmFLAGS.cbSF.ListIndex = 1) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JS "
                    
                    ' 79          JNS
                    Case 121
                        If (frmFLAGS.cbSF.ListIndex = 0) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JNS "
                        
                    ' 7A          JPE
                    Case 122
                        If (frmFLAGS.cbPF.ListIndex = 1) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JPE "
                        
                    ' 7B          JPO
                    Case 123
                        If (frmFLAGS.cbPF.ListIndex = 0) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JPO "
                        
                    ' 7C          JL
                    Case 124
                        If (frmFLAGS.cbSF.ListIndex <> frmFLAGS.cbOF.ListIndex) _
                                                        Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JL "
                        
                    ' 7D          JGE
                    Case 125
                        If (frmFLAGS.cbSF.ListIndex = frmFLAGS.cbOF.ListIndex) _
                                                        Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JGE "
                        
                    ' 7E          JLE
                    Case 126
                        If (frmFLAGS.cbSF.ListIndex <> frmFLAGS.cbOF.ListIndex) _
                           Or (frmFLAGS.cbZF.ListIndex = 1) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JLE "
                    
                    ' 7F          JG
                    Case 127
                        If (frmFLAGS.cbSF.ListIndex = frmFLAGS.cbOF.ListIndex) _
                           And (frmFLAGS.cbZF.ListIndex = 0) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JG "
                    
                    ' 1.05
                    ' E3 cb       JCXZ cb        Jump short if CX register is zero
                    Case &HE3
                        If (CH = 0) And (CL = 0) Then doJCC = True
                        '[SDEC_DEBUG_v120] sDECODED = "JCXZ "
                    
                    End Select
                        
                    ' skip byte no matter doJCC or not:
                    curByte = curByte + 1
                        
                    If doJCC Then
                        addTO_IP = to_signed_byte(RAM.mREAD_BYTE(curByte))
                    End If
                    
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & toHexForm((curByte - to_unsigned_long(CS) * 16) + to_signed_byte(RAM.mREAD_BYTE(curByte)) + 1)
                    
                    ' not redisassembled here, because I suppose
                    ' that there is a valid code after condition
                    ' jumps.
                    
        '================= end of JCC OPCODES =============================


        ' FC          CLD            Clear direction flag so SI and DI will increment
        ElseIf (tbFIRST = 252) Then
                    frmFLAGS.cbDF.ListIndex = 0

        ' FD          STD            Set direction flag so SI and DI will decrement
        ElseIf (tbFIRST = 253) Then
                    frmFLAGS.cbDF.ListIndex = 1

        ' F3          REP (prefix)   Repeat following MOVS,LODS,STOS,INS, or OUTS CX times
        ' F3          REPZ (prefix)  Repeat following CMPS or SCAS CX times or until ZF=0
        ' F3          REPE (prefix)  Repeat following CMPS or SCAS CX times or until ZF=0
        ElseIf (tbFIRST = &HF3) Then
        
                    'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
        
                    bDoREP = True
                    '[SDEC_DEBUG_v120] sDECODED = "REPZ"
                    
        ' F2          REPNE (prfix)  Repeat following CMPS or SCAS CX times or until ZF=1
        ' F2          REPNZ (prfix)  Repeat following CMPS or SCAS CX times or until ZF=1
        ElseIf (tbFIRST = &HF2) Then
        
                    'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
                    
                    bDoREPNE = True
                    '[SDEC_DEBUG_v120] sDECODED = "REPNZ"

        ' 1.07 (updated)
        ' A4          MOVSB          Move byte DS:[SI] to ES:[DI], advance SI and DI
        ' A4          MOVS mb,mb     Move byte [SI] to ES:[DI], advance SI and DI
        ElseIf (tbFIRST = &HA4) Then
                    If bDoREP Or bDoREPNE Then   ' 1.28#372
                        If (CL = 0) And (CH = 0) Then
                            bDoREP = False
                            bDoREPNE = False ' 1.28#372
                            '[SDEC_DEBUG_v120] sDECODED = ""
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        Else
                            dec_CX
                            ' return to prefix:
                            addTO_IP = step_BACK_to_prefix
                        End If
                    End If
                    
                    ' bTemp1 = RAM.mREAD_BYTE(to_unsigned_long(DS) * 16 + to_unsigned_long(SI))
                    ' 1.07
                    bTemp1 = RAM.mREAD_BYTE(get_SEGMENT_LOCATION(0) + to_unsigned_long(SI))
                    
                    RAM.mWRITE_BYTE to_unsigned_long(ES) * 16 + to_unsigned_long(DI), bTemp1
                    update_SI_acc_DF (1)
                    update_DI_acc_DF (1)
                    '[SDEC_DEBUG_v120] sDECODED = "MOVSB"
                    
        ' 1.07 (updated)
        ' A5          MOVSW          Move word DS:[SI] to ES:[DI], advance SI and DI
        ' A5          MOVS mw,mw     Move word [SI] to ES:[DI], advance SI and DI
        ElseIf (tbFIRST = &HA5) Then
                    If bDoREP Or bDoREPNE Then   ' 1.28#372
                        If (CL = 0) And (CH = 0) Then
                            bDoREP = False
                            bDoREPNE = False ' 1.28#372
                            '[SDEC_DEBUG_v120] sDECODED = ""
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        Else
                            dec_CX
                            ' return to prefix:
                            addTO_IP = step_BACK_to_prefix
                        End If
                    End If

                    iTemp1 = RAM.mREAD_WORD(get_SEGMENT_LOCATION(0) + to_unsigned_long(SI))
                    
                    RAM.mWRITE_WORD_i to_unsigned_long(ES) * 16 + to_unsigned_long(DI), iTemp1
                    update_SI_acc_DF (2)
                    update_DI_acc_DF (2)
                    '[SDEC_DEBUG_v120] sDECODED = "MOVSW"

        ' 1.07
        ' A6          CMPS mb,mb     Compare bytes ES:[DI] from [SI], advance SI and DI
        ' A6          CMPSB          Compare bytes ES:[DI] from DS:[SI], advance SI and DI
        ElseIf (tbFIRST = &HA6) Then
                    
                    'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
                    
                    ' 1.10
                    If bDoREP Or bDoREPNE Then
                        If (CL = 0) And (CH = 0) Then
                            bDoREP = False
                            bDoREPNE = False
                            '[SDEC_DEBUG_v120] sDECODED = ""
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        End If
                    End If
                    
                    bTemp1 = RAM.mREAD_BYTE(get_SEGMENT_LOCATION(0) + to_unsigned_long(SI))
                    bTemp2 = RAM.mREAD_BYTE(to_unsigned_long(ES) * 16 + to_unsigned_long(DI))
                                        
                    ALU.sub_BYTES bTemp1, bTemp2
                   
                    update_SI_acc_DF (1)
                    update_DI_acc_DF (1)   ' 1.10 DI should also be updated (I think).
                    '[SDEC_DEBUG_v120] sDECODED = "CMPSB"
                    
                    ' 1.10 this block is moved from beggining here:
                    
                    If bDoREP Or bDoREPNE Then
                        
                        dec_CX ' 1.21 bugfix#156a
                    
                        If bDoREP And (frmFLAGS.cbZF.ListIndex = 0) Then
                            ' bug fix (1.09), these two should be "Falsed":
                            bDoREP = False
                            bDoREPNE = False
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        End If
                        
                        If bDoREPNE And (frmFLAGS.cbZF.ListIndex = 1) Then
                            ' bug fix (1.09), these two should be "Falsed":
                            bDoREP = False
                            bDoREPNE = False
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        End If
                                                
                        ' return to prefix:
                        addTO_IP = step_BACK_to_prefix

                    End If
                    
        ' 1.07
        ' A7          CMPS mw,mw     Compare words ES:[DI] from [SI], advance SI and DI
        ' A7          CMPSW          Compare words ES:[DI] from DS:[SI], advance SI and DI
        ElseIf (tbFIRST = &HA7) Then

                    'If Not bREGISTERED Then GoTo share_ware  '2.10#585b

                    ' 1.10
                    If bDoREP Or bDoREPNE Then
                        If (CL = 0) And (CH = 0) Then
                            bDoREP = False
                            bDoREPNE = False
                            '[SDEC_DEBUG_v120] sDECODED = ""
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        End If
                    End If
                        
                    iTemp1 = RAM.mREAD_WORD(get_SEGMENT_LOCATION(0) + to_unsigned_long(SI))
                    iTemp2 = RAM.mREAD_WORD(to_unsigned_long(ES) * 16 + to_unsigned_long(DI))
                                        
                    ALU.sub_WORDS iTemp1, iTemp2, True
                   
                    ' 1.10 added DI, and "2":
                    update_SI_acc_DF (2)
                    update_DI_acc_DF (2)
                    '[SDEC_DEBUG_v120] sDECODED = "CMPSW"
                    
                    ' 1.10 this block is moved from beggining here:
                    If bDoREP Or bDoREPNE Then
                    
                        dec_CX ' 1.21 bugfix#156a
                    
                        If bDoREP And (frmFLAGS.cbZF.ListIndex = 0) Then
                            ' bug fix (1.09), these two should be "Falsed":
                            bDoREP = False
                            bDoREPNE = False
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        End If
                        
                        If bDoREPNE And (frmFLAGS.cbZF.ListIndex = 1) Then
                            ' bug fix (1.09), these two should be "Falsed":
                            bDoREP = False
                            bDoREPNE = False
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        End If

                        ' return to prefix:
                        addTO_IP = step_BACK_to_prefix

                    End If
                    
        ' 1.07
        ' AA          STOSB          Store AL to byte ES:[DI], advance DI
        ' AA          STOS mb        Store AL to byte [DI], advance DI
        ElseIf (tbFIRST = &HAA) Then
                    If bDoREP Or bDoREPNE Then   ' 1.28#372
                        If (CL = 0) And (CH = 0) Then
                            bDoREP = False
                            bDoREPNE = False ' 1.28#372
                            '[SDEC_DEBUG_v120] sDECODED = ""
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        Else
                            dec_CX
                            ' return to prefix:
                            addTO_IP = step_BACK_to_prefix
                        End If
                    End If
                    RAM.mWRITE_BYTE get_SEGMENT_LOCATION(55) + to_unsigned_long(DI), AL
                    update_DI_acc_DF (1)
                    '[SDEC_DEBUG_v120] sDECODED = "STOSB"
                    
        ' AB          STOSW          Store AX to word ES:[DI], advance DI
        ' AB          STOS mw        Store AX to word [DI], advance DI
        ElseIf (tbFIRST = &HAB) Then
                    If bDoREP Or bDoREPNE Then   ' 1.28#372
                        If (CL = 0) And (CH = 0) Then
                            bDoREP = False
                            bDoREPNE = False ' 1.28#372
                            '[SDEC_DEBUG_v120] sDECODED = ""
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        Else
                            dec_CX
                            ' return to prefix:
                            addTO_IP = step_BACK_to_prefix
                        End If
                    End If
                    
                    RAM.mWRITE_BYTE get_SEGMENT_LOCATION(55) + to_unsigned_long(DI), AL
                    RAM.mWRITE_BYTE get_SEGMENT_LOCATION(55) + to_unsigned_long(DI) + 1, AH
                    
                    update_DI_acc_DF (2)
                    '[SDEC_DEBUG_v120] sDECODED = "STOSW"

        ' AC          LODSB          Load byte [SI] into AL, advance SI
        ' AC          LODS mb        Load byte [SI] into AL, advance SI
        ElseIf (tbFIRST = &HAC) Then
                    If bDoREP Or bDoREPNE Then   ' 1.28#372 Then
                        If (CL = 0) And (CH = 0) Then
                            bDoREP = False
                            bDoREPNE = False ' 1.28#372
                            '[SDEC_DEBUG_v120] sDECODED = ""
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        Else
                            dec_CX
                            ' return to prefix:
                            addTO_IP = step_BACK_to_prefix
                        End If
                    End If
                    ' AL = RAM.mREAD_BYTE(to_unsigned_long(DS) * 16 + to_unsigned_long(SI))
                    ' 1.07
                    AL = RAM.mREAD_BYTE(get_SEGMENT_LOCATION(0) + to_unsigned_long(SI))
                    update_SI_acc_DF (1)
                    '[SDEC_DEBUG_v120] sDECODED = "LODSB"

        ' AD          LODSW          Load word [SI] into AX, advance SI
        ElseIf (tbFIRST = &HAD) Then
                    If bDoREP Or bDoREPNE Then   ' 1.28#372
                        If (CL = 0) And (CH = 0) Then
                            bDoREP = False
                            bDoREPNE = False ' 1.28#372
                            '[SDEC_DEBUG_v120] sDECODED = ""
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        Else
                            dec_CX
                            ' return to prefix:
                            addTO_IP = step_BACK_to_prefix
                        End If
                    End If
                    
                    ' AL = RAM.mREAD_BYTE(to_unsigned_long(DS) * 16 + to_unsigned_long(SI))
                    ' AH = RAM.mREAD_BYTE(to_unsigned_long(DS) * 16 + to_unsigned_long(SI) + 1)
                    ' 1.07
                    AL = RAM.mREAD_BYTE(get_SEGMENT_LOCATION(0) + to_unsigned_long(SI))
                    AH = RAM.mREAD_BYTE(get_SEGMENT_LOCATION(0) + to_unsigned_long(SI) + 1)
                    
                    update_SI_acc_DF (2)
                    '[SDEC_DEBUG_v120] sDECODED = "LODSW"

        ' 1.07
        '       (it seems to a mistake in definition "AX" instead of "AL",
        '         and it should be ES:[DI] - AX)
        ' AE          SCASB          Compare bytes AX - ES:[DI], advance DI
        ' AE          SCAS mb        Compare bytes AL - ES:[DI], advance DI
        ElseIf (tbFIRST = &HAE) Then
                    
                    ' 1.10 serious bugs fixed!
                    
                    If bDoREP Or bDoREPNE Then
                        If (CL = 0) And (CH = 0) Then
                            bDoREP = False
                            bDoREPNE = False
                            '[SDEC_DEBUG_v120] sDECODED = ""
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        End If
                    End If


                    ' segment replacement is not supported by this command!
                    bTemp1 = RAM.mREAD_BYTE(to_unsigned_long(ES) * 16 + to_unsigned_long(DI))
                    
                    ' #2006-03-18# ' ALU.sub_BYTES bTemp1, AL
                    ALU.sub_BYTES AL, bTemp1 ' #2006-03-18#
                   
                    update_DI_acc_DF (1)
                    '[SDEC_DEBUG_v120] sDECODED = "SCASB"
                    
                    If bDoREP Or bDoREPNE Then
                    
                        dec_CX  ' 1.21 bugfix#156a
                    
                        If bDoREP And (frmFLAGS.cbZF.ListIndex = 0) Then
                            ' bug fix (1.09), these two should be "Falsed":
                            bDoREP = False
                            bDoREPNE = False
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        End If
                        
                        If bDoREPNE And (frmFLAGS.cbZF.ListIndex = 1) Then
                            ' bug fix (1.09), these two should be "Falsed":
                            bDoREP = False
                            bDoREPNE = False
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        End If
                        
                        ' 1.21 bugfix#156a dec_CX
                        
                        ' return to prefix:
                        addTO_IP = step_BACK_to_prefix

                    End If

        ' 1.07
        '       (it seems to a mistake in definition "AL" instead of "AX",
        '         and it should be ES:[DI] - AX)
        ' AF          SCAS mw        Compare words AL - ES:[DI], advance DI
        ' AF          SCASW          Compare words AX - ES:[DI], advance DI
        ElseIf (tbFIRST = &HAF) Then
                    
                    ' 1.10 serious bugs fixed!
                    
                    If bDoREP Or bDoREPNE Then
                        If (CL = 0) And (CH = 0) Then
                            bDoREP = False
                            bDoREPNE = False
                            '[SDEC_DEBUG_v120] sDECODED = ""
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        End If
                    End If

                    ' segment replacement is not supported by this command!
                    iTemp1 = RAM.mREAD_WORD(to_unsigned_long(ES) * 16 + to_unsigned_long(DI))
                    
                    
                    ' #2006-03-18# ' ALU.sub_WORDS iTemp1, to16bit_SIGNED(AL, AH), True
                    ALU.sub_WORDS to16bit_SIGNED(AL, AH), iTemp1, True ' #2006-03-18#
                    
                   
                    update_DI_acc_DF (2)
                    '[SDEC_DEBUG_v120] sDECODED = "SCASW"
                    
                    If bDoREP Or bDoREPNE Then
                    
                        dec_CX  ' 1.21 bugfix#156a
                    
                        If bDoREP And (frmFLAGS.cbZF.ListIndex = 0) Then
                            ' bug fix (1.09), these two should be "Falsed":
                            bDoREP = False
                            bDoREPNE = False
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        End If
                        
                        If bDoREPNE And (frmFLAGS.cbZF.ListIndex = 1) Then
                            ' bug fix (1.09), these two should be "Falsed":
                            bDoREP = False
                            bDoREPNE = False
                            
                            bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
                            
                            GoTo out_of_IF
                        End If
                        
                        ' return to prefix:
                        addTO_IP = step_BACK_to_prefix
                    End If

        '================= ADD OPCODES (and some other on the same EA TABs) ==============
        
        ' 04 ib       ADD AL,ib
        ElseIf (tbFIRST = 4) Then  ' 04
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    '[SDEC_DEBUG_v120] sDECODED = "ADD AL, " & toHexForm(tb1)
                    ALU.add_BYTES AL, tb1
                    AL = ALU.GET_C_lb
                    
        ' 05 iw       ADD AX,iw
        ElseIf (tbFIRST = 5) Then   ' 05
                    curByte = curByte + 1
                    iTemp1 = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 1   ' point to last processed byte.
                    '[SDEC_DEBUG_v120] sDECODED = "ADD AX, " & toHexForm(iTemp1)
                    iTemp2 = to16bit_SIGNED(AL, AH)
                    ALU.add_WORDS iTemp2, iTemp1, True
                    AL = ALU.GET_C_lb
                    AH = ALU.GET_C_hb
                    
        ' ---------------------- [80] OPCODES ----------------------
        ' 80 /0 ib    ADD eb,ib
        ' 80 /1 ib    OR eb,ib
        ' 80 /2 ib    ADC eb,ib
        ' 80 /3 ib    SBB eb,ib
        ' 80 /4 ib    AND eb,ib
        ' 80 /5 ib    SUB eb,ib
        ' 80 /6 ib    XOR eb,ib
        ' 80 /7 ib    CMP eb,ib
        
        ' 1.07 (added 82 opcode, it is the same)
        ElseIf (tbFIRST = &H80) Or (tbFIRST = &H82) Then

                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)

                    mtRT = get_eaROW_eaTAB(tb1)
                    
                    ' +++++++ read EA byte and IB byte:
                    '[SDEC_DEBUG_v120] sDECODED = ""
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize              ' skip EA byte(s).
                    bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)          ' get value of eb (could be a register).
                    bTemp2 = RAM.mREAD_BYTE(curByte)                  ' get value of ib.
                    ' +++++++++++++++++++++++++++++++++
                    
                    Select Case mtRT.bTAB

                    ' 80 /0 ib    ADD eb,ib
                    Case 0
                            '[SDEC_DEBUG_v120] sDECODED = "ADD " & sDECODED
                            ALU.add_BYTES bTemp1, bTemp2                      ' perform eb+ib.
                            bSTORE_RESULT = True
                            
                    ' 80 /1 ib    OR eb,ib
                    Case 1
                            '[SDEC_DEBUG_v120] sDECODED = "OR " & sDECODED
                            ALU.or_BYTES bTemp1, bTemp2
                            bSTORE_RESULT = True
                            
                    ' 80 /2 ib    ADC eb,ib
                    Case 2
                    
                            'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
                    
                            '[SDEC_DEBUG_v120] sDECODED = "ADC " & sDECODED
''''                            If frmFLAGS.cbCF.ListIndex = 1 Then
''''                                ALU.add_BYTES bTemp1, 1
''''   2004.09.04                             bTemp1 = ALU.GET_C_lb
''''                            End If
''''                            ALU.add_BYTES bTemp1, bTemp2                      ' perform eb+ib.
''''


                    ' 2004.09.17
                    bSET_CARRY_CAUSE_9BIT = False
                    If bTemp2 = 255 Then ' &hFF
                        If frmFLAGS.cbCF.ListIndex = 1 Then
                            bSET_CARRY_CAUSE_9BIT = True
                            bTemp2 = 0
                            frmFLAGS.cbCF.ListIndex = 0
                            Dim bSET_AF1 As Boolean ' 2008-12-18
                            bSET_AF1 = True
                        End If
                    End If
                        

                            '  2004.09.04
                            ALU.add_BYTES bTemp1, bTemp2 + frmFLAGS.cbCF.ListIndex                     ' perform eb+ib.
                            If bSET_AF1 Then frmFLAGS.cbAF.ListIndex = 1 ' 2008-12-18
                            
                    ' 2004.09.17
                    If bSET_CARRY_CAUSE_9BIT Then frmFLAGS.cbCF.ListIndex = 1
                    
                            
                            
                            bSTORE_RESULT = True
                            
                    ' 80 /3 ib    SBB eb,ib
                    Case 3
                            '[SDEC_DEBUG_v120] sDECODED = "SBB " & sDECODED
                            ' after investigation in DOS DEBUGER,
                            ' this way flags are set correctly:
                            If frmFLAGS.cbCF.ListIndex = 1 Then
                                If bTemp1 = 0 Then
                                    ALU.add_BYTES bTemp2, 1
                                    bTemp2 = ALU.GET_C_lb
                                Else
                                    ALU.sub_BYTES bTemp1, 1
                                    bTemp1 = ALU.GET_C_lb
                                End If
                            End If
                            
                            ' 2008-12-18
                            If bTemp1 = 0 Or bTemp2 = 0 Then
                                Dim bTempACK5 As Boolean
                                If frmFLAGS.cbAF.ListIndex = 1 Then bTempACK5 = True
                                ALU.sub_BYTES bTemp1, bTemp2
                                frmFLAGS.cbOF.ListIndex = 0
                                If bTempACK5 Then frmFLAGS.cbAF.ListIndex = 1 ' ...
                            Else
                                ALU.sub_BYTES bTemp1, bTemp2
                            End If
                            
                            bSTORE_RESULT = True
                            
                    ' 80 /4 ib    AND eb,ib
                    Case 4
                            '[SDEC_DEBUG_v120] sDECODED = "AND " & sDECODED
                            ALU.and_BYTES bTemp1, bTemp2
                            bSTORE_RESULT = True
                    
                    ' 80 /5 ib    SUB eb,ib
                    Case 5
                            '[SDEC_DEBUG_v120] sDECODED = "SUB " & sDECODED
                            ALU.sub_BYTES bTemp1, bTemp2
                            bSTORE_RESULT = True

                    ' 80 /6 ib    XOR eb,ib
                    Case 6
                            '[SDEC_DEBUG_v120] sDECODED = "XOR " & sDECODED
                            ALU.xor_BYTES bTemp1, bTemp2
                            bSTORE_RESULT = True
                    
                    ' 80 /7 ib    CMP eb,ib
                    Case 7
                            '[SDEC_DEBUG_v120] sDECODED = "CMP " & sDECODED
                            ALU.sub_BYTES bTemp1, bTemp2
                            bSTORE_RESULT = False
                    End Select
                                        
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & toHexForm(bTemp2)
                                        
                    If bSTORE_RESULT Then
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()   ' store result in eb.
                    End If
                    
        '---------------------- END OF [80] OPCODES ----------------------
                    
        ' 00 /r       ADD eb,rb
        ElseIf (tbFIRST = 0) Then   ' 00
                    '[SDEC_DEBUG_v120] sDECODED = "ADD "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ALU.add_BYTES bTemp2, bTemp1
                    RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rb(mtRT.bTAB)
                    
        ' ---------------------- [83]/[81] OPCODES ----------------------
        ' 83 /0 ib    ADD ew,ib
        ' 83 /1 ib    OR ew,ib
        ' 83 /2 ib    ADC ew,ib
        ' 83 /3 ib    SBB ew,ib
        ' 83 /4 ib    AND ew,ib
        ' 83 /5 ib    SUB ew,ib
        ' 83 /6 ib    XOR ew,ib
        ' 83 /7 ib    CMP ew,ib
        '
        ' 81 /0 iw    ADD ew,iw
        ' 81 /1 iw    OR ew,iw
        ' 81 /2 iw    ADC ew,iw
        ' 81 /3 iw    SBB ew,iw
        ' 81 /4 iw    AND ew,iw
        ' 81 /5 iw    SUB ew,iw
        ' 81 /6 iw    XOR ew,iw
        ' 81 /7 iw    CMP ew,iw
        ElseIf (tbFIRST = 131) Or (tbFIRST = 129) Then ' 83 / 81

                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)

                    mtRT = get_eaROW_eaTAB(tb1)
                    
                    ' +++++++ read EA word and IB byte (convert to word),
                    ' or  read EA word and IW word:
                    '[SDEC_DEBUG_v120] sDECODED = ""
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize
                    iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    If (tbFIRST = 131) Then ' 83
                        bTemp2 = RAM.mREAD_BYTE(curByte)
                        ' make upper byte to be converted the the MSB of low byte:
                        iTemp2 = to16bit_SIGNED_HB_MSB_LB(bTemp2)
                    Else                    ' 80
                        iTemp2 = RAM.mREAD_WORD(curByte)
                        curByte = curByte + 1 ' point to last processed byte.
                    End If
                    ' +++++++++++++++++++++++++++++++++

                    Select Case mtRT.bTAB

                    ' 83 /0 ib    ADD ew,ib
                    ' 81 /0 iw    ADD ew,iw
                    Case 0
                            '[SDEC_DEBUG_v120] sDECODED = "ADD " & sDECODED
                            ALU.add_WORDS iTemp1, iTemp2, True
                            bSTORE_RESULT = True
                            
                    ' 83 /1 ib    OR ew,ib
                    ' 81 /1 iw    OR ew,iw
                    Case 1
                            '[SDEC_DEBUG_v120] sDECODED = "OR " & sDECODED
                            ALU.or_WORDS iTemp1, iTemp2, True
                            bSTORE_RESULT = True
                            
                    ' 83 /2 ib    ADC ew,ib
                    ' 81 /2 iw    ADC ew,iw
                    Case 2
                    
                        'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
                    
                            '[SDEC_DEBUG_v120] sDECODED = "ADC " & sDECODED
'''                            If frmFLAGS.cbCF.ListIndex = 1 Then
'''                                ALU.add_WORDS iTemp1, 1, True
'''  2004.09.04                               iTemp1 = ALU.GET_C_SIGNED
'''                            End If
'''                            ALU.add_WORDS iTemp1, iTemp2, True
'''                            bSTORE_RESULT = True
                        
                        
                    ' 2004.09.17
                    bSET_CARRY_CAUSE_17BIT = False
                    If iTemp1 = -1 Then ' &hFFFF
                        If frmFLAGS.cbCF.ListIndex = 1 Then
                            bSET_CARRY_CAUSE_17BIT = True
                        End If
                    End If
                                        
                            ' 2008-12-17 bug 2
                            If iTemp1 = 32767 And frmFLAGS.cbCF.ListIndex = 1 Then
                                ALU.add_WORDS iTemp1, frmFLAGS.cbCF.ListIndex, True
                                Dim bTempACK1 As Boolean
                                If frmFLAGS.cbAF.ListIndex = 1 Then bTempACK1 = True
                                iTemp1 = ALU.GET_C_SIGNED
                                ALU.add_WORDS iTemp2, iTemp1, True
                                frmFLAGS.cbOF.ListIndex = 1
                                If bTempACK1 Then frmFLAGS.cbAF.ListIndex = 1 ' ....
                                bSTORE_RESULT = True
                            Else
                                ' 2004.09.04
                                ALU.add_WORDS iTemp2, iTemp1 + frmFLAGS.cbCF.ListIndex, True
                                bSTORE_RESULT = True
                            End If
                        
                    
                    ' 2004.09.17
                    If bSET_CARRY_CAUSE_17BIT Then frmFLAGS.cbCF.ListIndex = 1
                                                 
                                                 
                    ' 83 /3 ib    SBB ew,ib
                    ' 81 /3 iw    SBB ew,iw
                    Case 3
                            '[SDEC_DEBUG_v120] sDECODED = "SBB " & sDECODED
                            ' after investigation in DOS DEBUGER,
                            ' this way flags are set correctly:
                            If frmFLAGS.cbCF.ListIndex = 1 Then
                                If iTemp1 = 0 Then
                                    ALU.add_WORDS iTemp2, 1, True
                                    iTemp2 = ALU.GET_C_SIGNED
                                Else
                                    ALU.sub_WORDS iTemp1, 1, True
                                    iTemp1 = ALU.GET_C_SIGNED
                                End If
                            End If
                            
                            ' 2008-12-18
                            If iTemp1 = 0 Or iTemp2 = 0 Then
                                Dim bTempACK7 As Boolean
                                If frmFLAGS.cbAF.ListIndex = 1 Then bTempACK7 = True
                                ALU.sub_WORDS iTemp1, iTemp2, True
                                frmFLAGS.cbOF.ListIndex = 0
                                If bTempACK7 Then frmFLAGS.cbAF.ListIndex = 1 ' ...
                            Else
                                ALU.sub_WORDS iTemp1, iTemp2, True
                            End If
                            
                            
                            
                            
                            bSTORE_RESULT = True
                    
                    ' 83 /4 ib    AND ew,ib
                    ' 81 /4 iw    AND ew,iw
                    Case 4
                            '[SDEC_DEBUG_v120] sDECODED = "AND " & sDECODED
                            ALU.and_WORDS iTemp1, iTemp2, True
                            bSTORE_RESULT = True
                    
                    ' 83 /5 ib    SUB ew,ib
                    ' 81 /5 iw    SUB ew,iw
                    Case 5
                            '[SDEC_DEBUG_v120] sDECODED = "SUB " & sDECODED
                            ALU.sub_WORDS iTemp1, iTemp2, True
                            bSTORE_RESULT = True
                    
                    ' 83 /6 ib    XOR ew,ib
                    ' 81 /6 iw    XOR ew,iw
                    Case 6
                            '[SDEC_DEBUG_v120] sDECODED = "XOR " & sDECODED
                            ALU.xor_WORDS iTemp1, iTemp2, True
                            bSTORE_RESULT = True
                    
                    ' 83 /7 ib    CMP ew,ib
                    ' 81 /7 iw    CMP ew,iw
                    Case 7
                            '[SDEC_DEBUG_v120] sDECODED = "CMP " & sDECODED
                            ALU.sub_WORDS iTemp1, iTemp2, True
                            bSTORE_RESULT = False
                    End Select

                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & toHexForm(iTemp2)
                    
                    If bSTORE_RESULT Then
                       RAM.mWRITE_WORD mtLOC_SIZE.lLoc, ALU.GET_C_lb, ALU.GET_C_hb
                    End If
                    
        ' ---------------------- END OF [83]/[81] OPCODES ----------------------
        
        ' 01 /r       ADD ew,rw
        ElseIf (tbFIRST = 1) Then   ' 01
                    '[SDEC_DEBUG_v120] sDECODED = "ADD "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ALU.add_WORDS iTemp2, iTemp1, True
                    RAM.mWRITE_WORD mtLOC_SIZE.lLoc, ALU.GET_C_lb, ALU.GET_C_hb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rw(mtRT.bTAB)
                    
        ' 02 /r       ADD rb,eb
        ElseIf (tbFIRST = 2) Then   ' 02
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "ADD " & g_EA_TCAP_rb(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ALU.add_BYTES bTemp1, bTemp2
                    store_BYTE_RegValue mtRT.bTAB, ALU.GET_C_lb
               
        ' 03 /r       ADD rw,ew
        ElseIf (tbFIRST = 3) Then   ' 03
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "ADD " & g_EA_TCAP_rw(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ALU.add_WORDS iTemp1, iTemp2, True
                    store_WORD_RegValue mtRT.bTAB, ALU.GET_C_SIGNED
                    
        '================================================
                    
        '================= SUB OPCODES ==============
        
        ' 2C ib       SUB AL,ib
        ElseIf (tbFIRST = 44) Then  ' 2C
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    '[SDEC_DEBUG_v120] sDECODED = "SUB AL, " & toHexForm(tb1)
                    ALU.sub_BYTES AL, tb1
                    AL = ALU.GET_C_lb
                    
        ' 2D iw       SUB AX,iw
        ElseIf (tbFIRST = 45) Then   ' 2D
                    curByte = curByte + 1
                    iTemp1 = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 1   ' point to last processed byte.
                    '[SDEC_DEBUG_v120] sDECODED = "SUB AX, " & toHexForm(iTemp1)
                    iTemp2 = to16bit_SIGNED(AL, AH)
                    ALU.sub_WORDS iTemp2, iTemp1, True
                    AL = ALU.GET_C_lb
                    AH = ALU.GET_C_hb
   
        ' 28 /r       SUB eb,rb
        ElseIf (tbFIRST = 40) Then   ' 28
                    '[SDEC_DEBUG_v120] sDECODED = "SUB "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ALU.sub_BYTES bTemp2, bTemp1
                    RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rb(mtRT.bTAB)
      
        ' 29 /r       SUB ew,rw
        ElseIf (tbFIRST = 41) Then   ' 29
                    '[SDEC_DEBUG_v120] sDECODED = "SUB "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ALU.sub_WORDS iTemp2, iTemp1, True
                    RAM.mWRITE_WORD mtLOC_SIZE.lLoc, ALU.GET_C_lb, ALU.GET_C_hb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rw(mtRT.bTAB)
                       
        ' 2A /r       SUB rb,eb
        ElseIf (tbFIRST = 42) Then   ' 2A
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "SUB " & g_EA_TCAP_rb(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ALU.sub_BYTES bTemp1, bTemp2
                    store_BYTE_RegValue mtRT.bTAB, ALU.GET_C_lb
        
        ' 2B /r       SUB rw,ew
        ElseIf (tbFIRST = 43) Then   ' 2B
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "SUB " & g_EA_TCAP_rw(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ALU.sub_WORDS iTemp1, iTemp2, True
                    store_WORD_RegValue mtRT.bTAB, ALU.GET_C_SIGNED
        
        '================================================
                            
       
        '================= AND OPCODES ==============
        
        ' 24 ib       AND AL,ib
        ElseIf (tbFIRST = 36) Then  ' 24
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    '[SDEC_DEBUG_v120] sDECODED = "AND AL, " & toHexForm(tb1)
                    ALU.and_BYTES AL, tb1
                    AL = ALU.GET_C_lb
                    
        ' 25 iw       AND AX,iw
        ElseIf (tbFIRST = 37) Then   ' 25
                    curByte = curByte + 1
                    iTemp1 = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 1   ' point to last processed byte.
                    '[SDEC_DEBUG_v120] sDECODED = "AND AX, " & toHexForm(iTemp1)
                    iTemp2 = to16bit_SIGNED(AL, AH)
                    ALU.and_WORDS iTemp2, iTemp1, True
                    AL = ALU.GET_C_lb
                    AH = ALU.GET_C_hb
   
        ' 20 /r       AND eb,rb
        ElseIf (tbFIRST = 32) Then   ' 20
                    '[SDEC_DEBUG_v120] sDECODED = "AND "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ALU.and_BYTES bTemp2, bTemp1
                    RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rb(mtRT.bTAB)
      
        ' 21 /r       AND ew,rw
        ElseIf (tbFIRST = 33) Then   ' 21
                    '[SDEC_DEBUG_v120] sDECODED = "AND "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ALU.and_WORDS iTemp2, iTemp1, True
                    RAM.mWRITE_WORD mtLOC_SIZE.lLoc, ALU.GET_C_lb, ALU.GET_C_hb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rw(mtRT.bTAB)
                       
        ' 22 /r       AND rb,eb
        ElseIf (tbFIRST = 34) Then   ' 22
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "AND " & g_EA_TCAP_rb(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ALU.and_BYTES bTemp1, bTemp2
                    store_BYTE_RegValue mtRT.bTAB, ALU.GET_C_lb
        
        ' 23 /r       AND rw,ew
        ElseIf (tbFIRST = 35) Then   ' 23
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "AND " & g_EA_TCAP_rw(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ALU.and_WORDS iTemp1, iTemp2, True
                    store_WORD_RegValue mtRT.bTAB, ALU.GET_C_SIGNED
        
        '================================================

        '================= OR OPCODES ==============
        
        ' 0C ib       OR AL,ib
        ElseIf (tbFIRST = 12) Then  ' 0C
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    '[SDEC_DEBUG_v120] sDECODED = "OR AL, " & toHexForm(tb1)
                    ALU.or_BYTES AL, tb1
                    AL = ALU.GET_C_lb
                    
        ' 0D iw       OR AX,iw
        ElseIf (tbFIRST = 13) Then   ' 0D
                    curByte = curByte + 1
                    iTemp1 = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 1   ' point to last processed byte.
                    '[SDEC_DEBUG_v120] sDECODED = "OR AX, " & toHexForm(iTemp1)
                    iTemp2 = to16bit_SIGNED(AL, AH)
                    ALU.or_WORDS iTemp2, iTemp1, True
                    AL = ALU.GET_C_lb
                    AH = ALU.GET_C_hb
   
        ' 08 /r       OR eb,rb
        ElseIf (tbFIRST = 8) Then   ' 08
                    '[SDEC_DEBUG_v120] sDECODED = "OR "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ALU.or_BYTES bTemp2, bTemp1
                    RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rb(mtRT.bTAB)
      
        ' 09 /r       OR ew,rw
        ElseIf (tbFIRST = 9) Then   ' 09
                    '[SDEC_DEBUG_v120] sDECODED = "OR "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ALU.or_WORDS iTemp2, iTemp1, True
                    RAM.mWRITE_WORD mtLOC_SIZE.lLoc, ALU.GET_C_lb, ALU.GET_C_hb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rw(mtRT.bTAB)
                       
        ' 0A /r       OR rb,eb
        ElseIf (tbFIRST = 10) Then   ' 0A
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "OR " & g_EA_TCAP_rb(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ALU.or_BYTES bTemp1, bTemp2
                    store_BYTE_RegValue mtRT.bTAB, ALU.GET_C_lb
        
        ' 0B /r       OR rw,ew
        ElseIf (tbFIRST = 11) Then   ' 0B
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "OR " & g_EA_TCAP_rw(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ALU.or_WORDS iTemp1, iTemp2, True
                    store_WORD_RegValue mtRT.bTAB, ALU.GET_C_SIGNED
        
        '================================================

        '================= XOR OPCODES ==============
        
        ' 34 ib       XOR AL,ib
        ElseIf (tbFIRST = 52) Then  ' 34
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    '[SDEC_DEBUG_v120] sDECODED = "XOR AL, " & toHexForm(tb1)
                    ALU.xor_BYTES AL, tb1
                    AL = ALU.GET_C_lb
                    
        ' 35 iw       XOR AX,iw
        ElseIf (tbFIRST = 53) Then   ' 35
                    curByte = curByte + 1
                    iTemp1 = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 1   ' point to last processed byte.
                    '[SDEC_DEBUG_v120] sDECODED = "XOR AX, " & toHexForm(iTemp1)
                    iTemp2 = to16bit_SIGNED(AL, AH)
                    ALU.xor_WORDS iTemp2, iTemp1, True
                    AL = ALU.GET_C_lb
                    AH = ALU.GET_C_hb
   
        ' 30 /r       XOR eb,rb
        ElseIf (tbFIRST = 48) Then   ' 30
                    '[SDEC_DEBUG_v120] sDECODED = "XOR "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ALU.xor_BYTES bTemp2, bTemp1
                    RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rb(mtRT.bTAB)
      
        ' 31 /r       XOR ew,rw
        ElseIf (tbFIRST = 49) Then   ' 31
                    '[SDEC_DEBUG_v120] sDECODED = "XOR "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ALU.xor_WORDS iTemp2, iTemp1, True
                    RAM.mWRITE_WORD mtLOC_SIZE.lLoc, ALU.GET_C_lb, ALU.GET_C_hb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rw(mtRT.bTAB)
                       
        ' 32 /r       XOR rb,eb
        ElseIf (tbFIRST = 50) Then   ' 32
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "XOR " & g_EA_TCAP_rb(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ALU.xor_BYTES bTemp1, bTemp2
                    store_BYTE_RegValue mtRT.bTAB, ALU.GET_C_lb
        
        ' 33 /r       XOR rw,ew
        ElseIf (tbFIRST = 51) Then   ' 33
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "XOR " & g_EA_TCAP_rw(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ALU.xor_WORDS iTemp1, iTemp2, True
                    store_WORD_RegValue mtRT.bTAB, ALU.GET_C_SIGNED
        
        '================================================
        
        '================= CMP OPCODES ==============
        
        ' 3C ib       CMP AL,ib
        ElseIf (tbFIRST = 60) Then  ' 3C
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    '[SDEC_DEBUG_v120] sDECODED = "CMP AL, " & toHexForm(tb1)
                    ALU.sub_BYTES AL, tb1
                    ' NO STORE!
                    
        ' 3D iw       CMP AX,iw
        ElseIf (tbFIRST = 61) Then   ' 3D
                    curByte = curByte + 1
                    iTemp1 = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 1   ' point to last processed byte.
                    '[SDEC_DEBUG_v120] sDECODED = "CMP AX, " & toHexForm(iTemp1)
                    iTemp2 = to16bit_SIGNED(AL, AH)
                    ALU.sub_WORDS iTemp2, iTemp1, True
                    ' NO STORE!
   
        ' 38 /r       CMP eb,rb
        ElseIf (tbFIRST = 56) Then   ' 38
                    '[SDEC_DEBUG_v120] sDECODED = "CMP "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ALU.sub_BYTES bTemp2, bTemp1
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rb(mtRT.bTAB)
                    ' NO STORE!
      
        ' 39 /r       CMP ew,rw
        ElseIf (tbFIRST = 57) Then   ' 39
                    '[SDEC_DEBUG_v120] sDECODED = "CMP "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ALU.sub_WORDS iTemp2, iTemp1, True
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rw(mtRT.bTAB)
                    ' NO STORE!
                       
        ' 3A /r       CMP rb,eb
        ElseIf (tbFIRST = 58) Then   ' 3A
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "CMP " & g_EA_TCAP_rb(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ALU.sub_BYTES bTemp1, bTemp2
                    ' NO STORE!
        
        ' 3B /r       CMP rw,ew
        ElseIf (tbFIRST = 59) Then   ' 3B
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "CMP " & g_EA_TCAP_rw(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ALU.sub_WORDS iTemp1, iTemp2, True
                    ' NO STORE!
        
        '================================================

        '================= TEST OPCODES ==============
        
        ' A8 ib       TEST AL,ib
        ElseIf (tbFIRST = 168) Then  ' A8
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    '[SDEC_DEBUG_v120] sDECODED = "TEST AL, " & toHexForm(tb1)
                    ALU.and_BYTES AL, tb1
                    ' NO STORE!
                    
        ' A9 iw       TEST AX,iw
        ElseIf (tbFIRST = 169) Then   ' A9
                    curByte = curByte + 1
                    iTemp1 = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 1   ' point to last processed byte.
                    '[SDEC_DEBUG_v120] sDECODED = "TEST AX, " & toHexForm(iTemp1)
                    iTemp2 = to16bit_SIGNED(AL, AH)
                    ALU.and_WORDS iTemp2, iTemp1, True
                    ' NO STORE!
   
        ' 84 /r       TEST eb,rb
        ' 84 /r       TEST rb,eb
        ElseIf (tbFIRST = 132) Then   ' 84
                    '[SDEC_DEBUG_v120] sDECODED = "TEST "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ALU.and_BYTES bTemp2, bTemp1
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rb(mtRT.bTAB)
                    ' NO STORE!
      
        ' 85 /r       TEST ew,rw
        ' 85 /r       TEST rw,ew
        ElseIf (tbFIRST = 133) Then   ' 85
                    '[SDEC_DEBUG_v120] sDECODED = "TEST "
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ALU.and_WORDS iTemp2, iTemp1, True
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rw(mtRT.bTAB)
                    ' NO STORE!
        
        '================================================

        ' 50+rw       PUSH rw
        ElseIf (tbFIRST >= 80) And (tbFIRST <= 87) Then
                    bRegIndex = tbFIRST - 80
                    '[SDEC_DEBUG_v120] sDECODED = "PUSH " & g_EA_TCAP_rw(bRegIndex)
                    wRegValue = get_WORD_RegValue(bRegIndex)
                    ' decrement SP by 2
                    'SP = mathSub_WORDS(SP, 2)
                    
                    ' 1.20 -- ALU.sub_WORDS SP, 2, False
                    ' 1.20 -- SP = ALU.GET_C_SIGNED
                    
                    
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set SS:[SP] to word register
                    'RAM.mWRITE_WORD_i lMEM_POINTER, wRegValue
            
                    stackPUSH wRegValue
                    
        ' 58+rw       POP rw
        ElseIf (tbFIRST >= 88) And (tbFIRST <= 95) Then
                    bRegIndex = tbFIRST - 88
                    '[SDEC_DEBUG_v120] sDECODED = "POP " & g_EA_TCAP_rw(bRegIndex)
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set register to SS:[SP]
                    wRegValue = stackPOP 'RAM.mREAD_WORD(lMEM_POINTER)
                    store_WORD_RegValue bRegIndex, wRegValue
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                            
        ' 8F /0       POP mw
        ElseIf (tbFIRST = 143) Then
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    
                    mtRT = get_eaROW_eaTAB(tb1)
        
                    Select Case mtRT.bTAB
                            
                    ' 8F /0       POP mw
                    Case 0
                        '[SDEC_DEBUG_v120] sDECODED = "POP "
                        ' calculate SP+SS*16
                        'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                        ' Set memory word to SS:[SP]
                        iTemp1 = stackPOP 'RAM.mREAD_WORD(lMEM_POINTER)
                        mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                        curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                        RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, iTemp1
                        ' increment SP by 2
                        'ALU.add_WORDS SP, 2, False
                        'SP = ALU.GET_C_SIGNED
                            
                    Case Else
                        mBox Me, "8F /" & mtRT.bTAB & "    -   " & cMT("no such opcode in 8086 instruction set.")
                       '#327r-stopeverything# Exit Sub
                        
                    End Select
                    
        ' 1.07
        ' CF          IRET           Interrupt return (far return and pop flags)
        ElseIf (tbFIRST = &HCF) Then
            'If Not bREGISTERED Then GoTo share_ware
            
            ' 1.24#278
            If bDO_STEP_OVER_PROCEDURE Then
                 lCOUNTER_ENTER_PROCEDURE = lCOUNTER_ENTER_PROCEDURE - 1
                 If lCOUNTER_ENTER_PROCEDURE <= 0 Then
                     bDO_STEP_OVER_PROCEDURE = False
                     frmEmulation.chkAutoStep.Value = vbUnchecked ' stop!!!
                 End If
            End If
        
                    '[SDEC_DEBUG_v120] sDECODED = "IRET"
                                        
                    ' *********** copy from RETF **************
                    
                    ' ---- pop offset ----
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set IP to SS:[SP]
                    IP = stackPOP 'RAM.mREAD_WORD(lMEM_POINTER)
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                    
                    ' ---- pop seg ----
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set CS to SS:[SP]
                    CS = stackPOP 'RAM.mREAD_WORD(lMEM_POINTER)
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                    

                    ' ***************************************

                    ' ============== copy from POPF ===========
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set SS to SS:[SP]
                    frmFLAGS.setFLAGS_REGISTER (stackPOP()) 'RAM.mREAD_WORD( lMEM_POINTER))
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                    '===========================================
                        
                        
                    ' 1.17 do_Interupt() cannot modify flags directly,
                    '      it can only be done only after Flags are POPED by IRET!!!
                    If bSET_CF_ON_IRET Then
                        frmFLAGS.cbCF.ListIndex = 1
                    End If
                    If bCLEAR_CF_ON_IRET Then
                        frmFLAGS.cbCF.ListIndex = 0
                    End If
                    If bSET_ZF_ON_IRET Then
                        frmFLAGS.cbZF.ListIndex = 1
                    End If
                    If bCLEAR_ZF_ON_IRET Then
                        frmFLAGS.cbZF.ListIndex = 0
                    End If


                    JumpOut_of_doStep '[SDEC_DEBUG_v120] sDECODED
                    Exit Sub
               
                            
        ' 1.07 (updated)
        ' CB          RETF           Return to far caller (pop offset, then seg)
        '                       see CALL cd.
        ElseIf (tbFIRST = &HCB) Then
            'If Not bREGISTERED Then GoTo share_ware
        
            ' 1.24#278
            If bDO_STEP_OVER_PROCEDURE Then
                 lCOUNTER_ENTER_PROCEDURE = lCOUNTER_ENTER_PROCEDURE - 1
                 If lCOUNTER_ENTER_PROCEDURE <= 0 Then
                     bDO_STEP_OVER_PROCEDURE = False
                     frmEmulation.chkAutoStep.Value = vbUnchecked ' stop!!!
                 End If
            End If
        
                    '[SDEC_DEBUG_v120] sDECODED = "RETF"
                    
                    ' ---- pop offset ----
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set IP to SS:[SP]
                    IP = stackPOP ' RAM.mREAD_WORD(lMEM_POINTER)
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                    
                    ' ---- pop seg ----
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set CS to SS:[SP]
                    CS = stackPOP 'RAM.mREAD_WORD(lMEM_POINTER)
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                    

                    JumpOut_of_doStep '[SDEC_DEBUG_v120] sDECODED
                    Exit Sub
                    
        ' 1.07 (updated)
        ' CA iw       RETF iw        RET (far), pop offset, seg, iw bytes
        '                       see CALL cd.
        ElseIf (tbFIRST = &HCA) Then
            'If Not bREGISTERED Then GoTo share_ware
            
            ' 1.24#278
            If bDO_STEP_OVER_PROCEDURE Then
                 lCOUNTER_ENTER_PROCEDURE = lCOUNTER_ENTER_PROCEDURE - 1
                 If lCOUNTER_ENTER_PROCEDURE <= 0 Then
                     bDO_STEP_OVER_PROCEDURE = False
                     frmEmulation.chkAutoStep.Value = vbUnchecked ' stop!!!
                 End If
            End If
        
                    ' read iw
                    curByte = curByte + 1
                    iTemp1 = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 1   ' point to last processed byte.
                    '[SDEC_DEBUG_v120] sDECODED = "RETF " & toHexForm(iTemp1)
                                        
                    ' ---- pop offset ----
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set IP to SS:[SP]
                    IP = stackPOP 'RAM.mREAD_WORD(lMEM_POINTER)
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                                        
                    ' ---- pop seg ----
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set CS to SS:[SP]
                    CS = stackPOP ' RAM.mREAD_WORD(lMEM_POINTER)
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                    


                    ' increment SP by iw
                    ' 1.20 ALU.add_WORDS SP, iTemp1, False
                    ' 1.20 SP = ALU.GET_C_SIGNED
                    SP = mathAdd_WORDS(SP, iTemp1)

                    JumpOut_of_doStep '[SDEC_DEBUG_v120] sDECODED
                    Exit Sub
                        
        ' C3          RET
        ElseIf (tbFIRST = 195) Then
            'If Not bREGISTERED Then GoTo share_ware
            
            ' 1.24#278
            If bDO_STEP_OVER_PROCEDURE Then
                 lCOUNTER_ENTER_PROCEDURE = lCOUNTER_ENTER_PROCEDURE - 1
                 If lCOUNTER_ENTER_PROCEDURE <= 0 Then
                     bDO_STEP_OVER_PROCEDURE = False
                     frmEmulation.chkAutoStep.Value = vbUnchecked ' stop!!!
                 End If
            End If
        
                    '[SDEC_DEBUG_v120] sDECODED = "RETN"
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set IP to SS:[SP]
                    IP = stackPOP 'RAM.mREAD_WORD(lMEM_POINTER)
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                    
                    ' 1.07
                    JumpOut_of_doStep '[SDEC_DEBUG_v120] sDECODED
                    Exit Sub
                        
        ' C2 iw       RET iw
        ElseIf (tbFIRST = 194) Then
            'If Not bREGISTERED Then GoTo share_ware
            
            ' 1.24#278
            If bDO_STEP_OVER_PROCEDURE Then
                 lCOUNTER_ENTER_PROCEDURE = lCOUNTER_ENTER_PROCEDURE - 1
                 If lCOUNTER_ENTER_PROCEDURE <= 0 Then
                     bDO_STEP_OVER_PROCEDURE = False
                     frmEmulation.chkAutoStep.Value = vbUnchecked ' stop!!!
                 End If
            End If
        
                    ' read iw
                    curByte = curByte + 1
                    iTemp1 = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 1   ' point to last processed byte.
                    '[SDEC_DEBUG_v120] sDECODED = "RETN " & toHexForm(iTemp1)
                    
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set IP to SS:[SP]
                    IP = stackPOP ' RAM.mREAD_WORD(lMEM_POINTER)
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                    
                    ' increment SP by iw
                    ' 1.20 ALU.add_WORDS SP, iTemp1, False
                    ' 1.20 SP = ALU.GET_C_SIGNED
                    SP = mathAdd_WORDS(SP, iTemp1)
                    
                    ' 1.07
                    JumpOut_of_doStep '[SDEC_DEBUG_v120] sDECODED
                    Exit Sub
                        
        ' 1.07 (updated)
        ' 9A cd       CALL cd        Call far segment, immediate 4-byte address
        ElseIf (tbFIRST = &H9A) Then
            'If Not bREGISTERED Then GoTo share_ware
            
            
            
            ' 1.24#278
            If bDO_STEP_OVER_PROCEDURE Then
                 lCOUNTER_ENTER_PROCEDURE = lCOUNTER_ENTER_PROCEDURE + 1
            End If
            
                    ' store CS in STACK:
                    ' decrement SP by 2
                    'SP = mathSub_WORDS(SP, 2)
                    
                    ' 1.20 -- ALU.sub_WORDS SP, 2, False
                    ' 1.20 -- SP = ALU.GET_C_SIGNED
                    
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set SS:[SP] to memory word (CS to return to)
                    'RAM.mWRITE_WORD_i lMEM_POINTER, CS
                    
                    stackPUSH CS
        
        
        
        
        
        
        
'''''  #1150b it's not 4 but 5!
'''''                    ' calculate return IP and store it in STACK:
'''''                    ' "+4" point to the next byte after current instruction:
'''''                    iTemp1 = to_signed_int(curByte - to_unsigned_long(CS) * 16 + 4)
'''''
                
                    ' calculate return IP and store it in STACK:
                    ' "+5" point to the next byte after current instruction:
                    iTemp1 = to_signed_int(curByte - to_unsigned_long(CS) * 16 + 5)
                
                
           
           
           
           
           
                    ' decrement SP by 2
                    'SP = mathSub_WORDS(SP, 2)
                    
                    ' 1.20 -- ALU.sub_WORDS SP, 2, False
                    ' 1.20 -- SP = ALU.GET_C_SIGNED
                    
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set SS:[SP] to memory word (IP to return to)
                    'RAM.mWRITE_WORD_i lMEM_POINTER, iTemp1
                    
                    stackPUSH iTemp1
                    
                    curByte = curByte + 1
                    IP = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 2
                    CS = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 2 ' #1150b NOT 1 BUT 2 (but here it doesn't really matter) ' 1
                    '[SDEC_DEBUG_v120] sDECODED = "CALL " & toHexForm(CS) & ":" & toHexForm(IP)
                    
                    
                    ' 1.07
                    JumpOut_of_doStep '[SDEC_DEBUG_v120] sDECODED
                    Exit Sub
                    
                    
                        
        'E8 cw       CALL cw        Call near, offset relative to next instruction
        ElseIf (tbFIRST = &HE8) Then
            'If Not bREGISTERED Then GoTo share_ware
            
            
            
            ' 1.24#278
            If bDO_STEP_OVER_PROCEDURE Then
                 lCOUNTER_ENTER_PROCEDURE = lCOUNTER_ENTER_PROCEDURE + 1
            End If
        
                    ' read cw, set it to addTO_IP:
                    curByte = curByte + 1
                    addTO_IP = RAM.mREAD_WORD(curByte)  ' get signed!
                    curByte = curByte + 1   ' point to last processed byte.
                                            
                    '[SDEC_DEBUG_v120] sDECODED = "CALL " & toHexForm((curByte - to_unsigned_long(CS) * 16) + addTO_IP + 1)
                                            
                    ' 1.11 added to_signed_int() when loading FreeDos:
                    ' calculate return IP and store it in STACK:
                    iTemp1 = to_signed_int(curByte - to_unsigned_long(CS) * 16 + 1)
                    ' decrement SP by 2
                    'SP = mathSub_WORDS(SP, 2)
                    
                    ' 1.20 -- ALU.sub_WORDS SP, 2, False
                    ' 1.20 -- SP = ALU.GET_C_SIGNED
                    
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set SS:[SP] to memory word (IP to return to)
                    'RAM.mWRITE_WORD_i lMEM_POINTER, iTemp1
                    
                    stackPUSH iTemp1
                        
                        
        ' 1.07
        ' E0 cb       LOOPNE cb      noflags DEC CX; jump short if CX/=0 and not equal
        ' E0 cb       LOOPNZ cb      noflags DEC CX; jump short if CX/=0 and ZF=0
        ElseIf (tbFIRST = &HE0) Then
        
            'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
            
                    ' make CX=CX-1
' 1.20
'''                    ALU.LOAD_A_lb CL
'''                    ALU.LOAD_A_hb CH
'''                    ALU.LOAD_B 1
'''                    ALU.bSET_FLAGS = False
'''                    ALU.MAKE_sub_WORDS
'''                    CL = ALU.GET_C_lb
'''                    CH = ALU.GET_C_hb
                    dec_CX      ' 1.20
                    
                    ' do short jump if CX<>0
                    curByte = curByte + 1
                    ' CX not zero? and ZF=0 ?
                    If ((CL <> 0) Or (CH <> 0)) And (frmFLAGS.cbZF.ListIndex = 0) Then
                            addTO_IP = to_signed_byte(RAM.mREAD_BYTE(curByte))
                    End If
                    '[SDEC_DEBUG_v120] sDECODED = "LOOPNE " & toHexForm((curByte - to_unsigned_long(CS) * 16) + to_signed_byte(RAM.mREAD_BYTE(curByte)) + 1)
                                          
        ' 1.07
        ' E1 cb       LOOPE cb       noflags DEC CX; jump short if CX/=0 and equal (ZF=1)
        ' E1 cb       LOOPZ cb       noflags DEC CX; jump short if CX/=0 and zero (ZF=1)
        ElseIf (tbFIRST = &HE1) Then
        
                    'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
        
                    ' make CX=CX-1
'''                    ALU.LOAD_A_lb CL
'''                    ALU.LOAD_A_hb CH
'''                    ALU.LOAD_B 1
'''                    ALU.bSET_FLAGS = False
'''                    ALU.MAKE_sub_WORDS
'''                    CL = ALU.GET_C_lb
'''                    CH = ALU.GET_C_hb
                    dec_CX
                    
                    ' do short jump if CX<>0
                    curByte = curByte + 1
                    ' CX not zero? and ZF=1 ?
                    If ((CL <> 0) Or (CH <> 0)) And (frmFLAGS.cbZF.ListIndex = 1) Then
                            addTO_IP = to_signed_byte(RAM.mREAD_BYTE(curByte))
                    End If
                    '[SDEC_DEBUG_v120] sDECODED = "LOOPE " & toHexForm((curByte - to_unsigned_long(CS) * 16) + to_signed_byte(RAM.mREAD_BYTE(curByte)) + 1)
                            
        ' E2 cb       LOOP cb        noflags DEC CX; jump short if CX/=0
        ElseIf (tbFIRST = 226) Then ' E2
                    ' make CX=CX-1
''''                    ALU.LOAD_A_lb CL
''''                    ALU.LOAD_A_hb CH
''''                    ALU.LOAD_B 1
''''                    ALU.bSET_FLAGS = False
''''                    ALU.MAKE_sub_WORDS
''''                    CL = ALU.GET_C_lb
''''                    CH = ALU.GET_C_hb
                    dec_CX

                    ' do short jump if CX<>0
                    curByte = curByte + 1
                    ' CX not zero?
                    If (CL <> 0) Or (CH <> 0) Then
                            addTO_IP = to_signed_byte(RAM.mREAD_BYTE(curByte))
                    End If
                    '[SDEC_DEBUG_v120] sDECODED = "LOOP " & toHexForm((curByte - to_unsigned_long(CS) * 16) + to_signed_byte(RAM.mREAD_BYTE(curByte)) + 1)
                    
                        
        ' 0E          PUSH CS        Set [SP-2] to CS, then decrement SP by 2
        ElseIf (tbFIRST = &HE) Then
                    '[SDEC_DEBUG_v120] sDECODED = "PUSH CS"
                    ' decrement SP by 2
                    'SP = mathSub_WORDS(SP, 2)
                    
                    ' 1.20 -- ALU.sub_WORDS SP, 2, False
                    ' 1.20 -- SP = ALU.GET_C_SIGNED
                    
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set SS:[SP] to CS register
                    'RAM.mWRITE_WORD_i lMEM_POINTER, CS
                    
                    stackPUSH CS
                        
        ' 1E          PUSH DS        Set [SP-2] to DS, then decrement SP by 2
        ElseIf (tbFIRST = &H1E) Then
                    '[SDEC_DEBUG_v120] sDECODED = "PUSH DS"
                    ' decrement SP by 2
                    'SP = mathSub_WORDS(SP, 2)
                    
                    ' 1.20 -- ALU.sub_WORDS SP, 2, False
                    ' 1.20 -- SP = ALU.GET_C_SIGNED
                    
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set SS:[SP] to DS register
                    'RAM.mWRITE_WORD_i lMEM_POINTER, DS
                    
                    stackPUSH DS
                         
        ' 06          PUSH ES        Set [SP-2] to ES, then decrement SP by 2
        ElseIf (tbFIRST = &H6) Then
                    '[SDEC_DEBUG_v120] sDECODED = "PUSH ES"
                    ' decrement SP by 2
                    'SP = mathSub_WORDS(SP, 2)
                    
                    ' 1.20 -- ALU.sub_WORDS SP, 2, False
                    ' 1.20 -- SP = ALU.GET_C_SIGNED
                    
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set SS:[SP] to ES register
                    'RAM.mWRITE_WORD_i lMEM_POINTER, ES
                    
                    stackPUSH ES
                         
        ' 16          PUSH SS        Set [SP-2] to SS, then decrement SP by 2
        ElseIf (tbFIRST = &H16) Then
                    '[SDEC_DEBUG_v120] sDECODED = "PUSH SS"
                    ' decrement SP by 2
                    'SP = mathSub_WORDS(SP, 2)
                    
                    ' 1.20 -- ALU.sub_WORDS SP, 2, False
                    ' 1.20 -- SP = ALU.GET_C_SIGNED
                    
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set SS:[SP] to SS register
                    'RAM.mWRITE_WORD_i lMEM_POINTER, SS
                    
                    stackPUSH SS
                    
        ' 1F          POP DS         Set DS to top of stack, increment SP by 2
        ElseIf (tbFIRST = &H1F) Then
                    '[SDEC_DEBUG_v120] sDECODED = "POP DS"
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set DS to SS:[SP]
                    DS = stackPOP ' RAM.mREAD_WORD(lMEM_POINTER)
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                        
        ' 07          POP ES         Set ES to top of stack, increment SP by 2
        ElseIf (tbFIRST = &H7) Then
                    '[SDEC_DEBUG_v120] sDECODED = "POP ES"
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set ES to SS:[SP]
                    ES = stackPOP ' RAM.mREAD_WORD(lMEM_POINTER)
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                    
        ' 17          POP SS         Set SS to top of stack, increment SP by 2
        ElseIf (tbFIRST = &H17) Then
                    '[SDEC_DEBUG_v120] sDECODED = "POP SS"
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set SS to SS:[SP]
                    SS = stackPOP 'RAM.mREAD_WORD(lMEM_POINTER)
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                    
                    
        ' 9C          PUSHF          Set [SP-2] to flags register, then decrement SP by 2
        ElseIf (tbFIRST = &H9C) Then
        
                    'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
        
                    '[SDEC_DEBUG_v120] sDECODED = "PUSHF"
                    ' get flags register:
                    wRegValue = frmFLAGS.getFLAGS_REGISTER16
                    ' decrement SP by 2
                    'SP = mathSub_WORDS(SP, 2)
                    
                    ' 1.20 -- ALU.sub_WORDS SP, 2, False
                    ' 1.20 -- SP = ALU.GET_C_SIGNED
                    
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set SS:[SP] to flags register
                    'RAM.mWRITE_WORD_i lMEM_POINTER, wRegValue
                                
                    stackPUSH wRegValue
                    
        ' 9D          POPF           Set flags register to top of stack, increment SP by 2
        ElseIf (tbFIRST = &H9D) Then
        
                    'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
        
                    '[SDEC_DEBUG_v120] sDECODED = "POPF"
                    ' calculate SP+SS*16
                    'lMEM_POINTER = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
                    ' Set SS to SS:[SP]
                    frmFLAGS.setFLAGS_REGISTER (stackPOP())  'RAM.mREAD_WORD(lMEM_POINTER))
                    ' increment SP by 2
                    'ALU.add_WORDS SP, 2, False
                    'SP = ALU.GET_C_SIGNED
                    
        ' 90          NOP            No Operation
        ElseIf (tbFIRST = 144) Then
                    '[SDEC_DEBUG_v120] sDECODED = "NOP"
                        
        ' ======================= 1.04 ============================
        
        
        ' F6 /6       DIV eb         Unsigned divide AX by EA byte (AL=Quo AH=Rem)
        ' F6 /7       IDIV eb        Signed divide AX by EA byte (AL=Quo AH=Rem)
        ' F6 /5       IMUL eb        Signed multiply (AX = AL * EA byte)
        ' F6 /4       MUL eb         Unsigned multiply (AX = AL * EA byte)
        ' F6 /3       NEG eb         Two's complement negate EA byte
        ' F6 /2       NOT eb         Reverse each bit of EA byte
        ' F6 /0 ib    TEST eb,ib     AND immediate byte into EA byte for flags only
        ElseIf (tbFIRST = &HF6) Then    ' F6

        #If 0 Then ' start of "if1124"
            GoTo share_ware
        #Else

                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)

                    mtRT = get_eaROW_eaTAB(tb1)
                    
                    ' +++++++ read EA byte:
                    '[SDEC_DEBUG_v120] sDECODED = ""
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    'curByte = curByte + mtLOC_SIZE.iSize              ' skip EA byte(s).
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)          ' get value of eb (could be a register).
                    ' +++++++++++++++++++++++++++++++++
                    
                    ' part of sDECODED is set by
                    ' get_EA_loc_and_size() above.
                                        
                    
                    Select Case mtRT.bTAB
                    
                     ' F6 /6       DIV eb         Unsigned divide AX by EA byte (AL=Quo AH=Rem)
                     Case 6
                        'If Not bREGISTERED Then GoTo share_ware
                     
                        
                     
                        '[SDEC_DEBUG_v120] sDECODED = "DIV " & sDECODED
                        lTemp = to16bit_UNS(AL, AH)
                        
                        ' 1.09
                        If bTemp1 = 0 Then
                            tb1 = 0 ' DIVISION BY ZERO!
                            GoTo enter_interupt_code_with_preset_tb1
                        End If
                        If Fix(lTemp / bTemp1) > 255 Then
                            tb1 = 0 ' the quotient overflows the result register.
                            GoTo enter_interupt_code_with_preset_tb1
                        End If
                        
                        AL = Fix(lTemp / bTemp1)
                        AH = lTemp Mod bTemp1
                        ' FLAGS NOT DEFINED.
                        
                        
                     ' F6 /7       IDIV eb        Signed divide AX by EA byte (AL=Quo AH=Rem)
                     Case 7
                        'If Not bREGISTERED Then GoTo share_ware
                        
                        
                        
                        '[SDEC_DEBUG_v120] sDECODED = "IDIV " & sDECODED
                        iTemp1 = to16bit_SIGNED(AL, AH)
                        
                        ' 1.09
                        If bTemp1 = 0 Then
                            tb1 = 0 ' DIVISION BY ZERO!
                            GoTo enter_interupt_code_with_preset_tb1
                        End If
                        
                        ' 1.31#454
                        iTemp2 = to_signed_byte(bTemp1)
                        
                        If (Fix(iTemp1 / iTemp2) > 127) Or (Fix(iTemp1 / iTemp2) < -128) Then
                            tb1 = 0 ' the quotient overflows the result register.
                            GoTo enter_interupt_code_with_preset_tb1
                        End If
                        
                        AL = to_unsigned_byte(Fix(iTemp1 / iTemp2))
                        AH = to_unsigned_byte(iTemp1 Mod iTemp2)
                        ' FLAGS NOT DEFINED.
                        
                     ' F6 /5       IMUL eb        Signed multiply (AX = AL * EA byte)
                     Case 5
                        'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
                        
                        '[SDEC_DEBUG_v120] sDECODED = "IMUL " & sDECODED
                        iTemp1 = to_signed_byte(AL) * to_signed_byte(bTemp1)
                        
                        AL = math_get_low_byte_of_word(iTemp1)
                        AH = math_get_high_byte_of_word(iTemp1)
                        ' this should be much faster, but I have some problems
                        ' with sign when dividing -15/4, AH should have "FF"
                        ' value when we get negative result:
                        'AL = to_unsigned_byte(iTemp1 And &HFF)
                        'AH = to_unsigned_byte(Fix(iTemp1 / 256) And &HFF)
                        ' set flags when result cannot be kept in AL alone:
                        If (iTemp1 > 127) Or (iTemp1 < -128) Then
                            frmFLAGS.cbOF.ListIndex = 1
                            frmFLAGS.cbCF.ListIndex = 1
                        Else
                            frmFLAGS.cbOF.ListIndex = 0
                            frmFLAGS.cbCF.ListIndex = 0
                        End If
                        
                     ' F6 /4       MUL eb         Unsigned multiply (AX = AL * EA byte)
                     Case 4
                        '[SDEC_DEBUG_v120] sDECODED = "MUL " & sDECODED
                        ' converting to INT because result may be bigger
                        ' then byte:
                        
                        'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
                        
                        ' 1.31#450
                        lTemp = CLng(AL) * CLng(bTemp1)
                        iTemp1 = to_signed_int(lTemp)
                        
                        ' 1.31#450 iTemp1 = CInt(AL) * CInt(bTemp1)
                                                
                        AL = math_get_low_byte_of_word(iTemp1)  ' 1.21 to_unsigned_byte(iTemp1 And &HFF)
                        AH = math_get_high_byte_of_word(iTemp1)  ' 1.21 to_unsigned_byte(Fix(iTemp1 / 256) And &HFF)
                        
                        ' set flags when result cannot be kept in AL alone:
                        If AH <> 0 Then
                            frmFLAGS.cbOF.ListIndex = 1
                            frmFLAGS.cbCF.ListIndex = 1
                        Else
                            frmFLAGS.cbOF.ListIndex = 0
                            frmFLAGS.cbCF.ListIndex = 0
                        End If
                     
                     ' F6 /3       NEG eb         Two's complement negate EA byte
                     Case 3
                        '[SDEC_DEBUG_v120] sDECODED = "NEG " & sDECODED
                        ALU.sub_BYTES 0, bTemp1
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb
                        ' flags are set by SUB.
                     
                     ' F6 /2       NOT eb         Reverse each bit of EA byte
                     Case 2
                        '[SDEC_DEBUG_v120] sDECODED = "NOT " & sDECODED
                        ALU.LOAD_A_lb bTemp1
                        ALU.NOT_A_lb_to_C_lb
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb
                        ' FLAGS NOT EFFECTED.
                     
                     ' F6 /0 ib    TEST eb,ib     AND immediate byte into EA byte for flags only
                     Case 0
                        curByte = curByte + 1
                        bTemp2 = RAM.mREAD_BYTE(curByte)   ' get value of ib.
                        '[SDEC_DEBUG_v120] sDECODED = "TEST " & sDECODED & ", " & bTemp2
                        ALU.and_BYTES bTemp1, bTemp2
                        
                     End Select
        #End If ' end of "if1124"
        
        ' F7 /6       DIV ew         Unsigned divide DXAX by EA word (AX=Quo DX=Rem)
        ' F7 /7       IDIV ew        Signed divide DXAX by EA word (AX=Quo DX=Rem)
        ' F7 /5       IMUL ew        Signed multiply (DXAX = AX * EA word)
        ' F7 /4       MUL ew         Unsigned multiply (DXAX = AX * EA word)
        ' F7 /3       NEG ew         Two's complement negate EA word
        ' F7 /2       NOT ew         Reverse each bit of EA word
        ' F7 /0 iw    TEST ew,iw     AND immediate word into EA word for flags only
        ElseIf (tbFIRST = &HF7) Then    ' F7
        
        #If 0 Then ' start of "if1125"
            GoTo share_ware
        #Else
        
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)

                    mtRT = get_eaROW_eaTAB(tb1)
                    
                    ' +++++++ read EA WORD:
                    '[SDEC_DEBUG_v120] sDECODED = ""
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' skip EA byte(s); point to last processed byte.
                    iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)  ' get value of ew (could be a register).
                    ' +++++++++++++++++++++++++++++++++
                    
                    ' part of sDECODED is set by
                    ' get_EA_loc_and_size() above.
                                        
                    
                    Select Case mtRT.bTAB
                    
                    ' F7 /6       DIV ew         Unsigned divide DXAX by EA word (AX=Quo DX=Rem)
                    Case 6
                        'If Not bREGISTERED Then GoTo share_ware
                        
                        
                        
                        '[SDEC_DEBUG_v120] sDECODED = "DIV " & sDECODED
                        ' calculate DXAX:
                        
                        
                        
                        
                        
                        ' 2004-10-30-DIV-BUG-SHOULD-NOT-OVERFLOW
                        
                        ' BEFORE FIX:
                        
''''''
''''''
''''''                        lTemp = to16bit_UNS(DL, DH) * 65536 + to16bit_UNS(AL, AH)
''''''
''''''
''''''                        ' 1.09
''''''                        If iTemp1 = 0 Then
''''''                            tb1 = 0 ' DIVISION BY ZERO!
''''''                            GoTo enter_interupt_code_with_preset_tb1
''''''                        End If
''''''                        If Fix(lTemp / to_unsigned_long(iTemp1)) > 65535 Then
''''''                            tb1 = 0 ' the quotient overflows the result register.
''''''                            GoTo enter_interupt_code_with_preset_tb1
''''''                        End If
''''''
''''''                        ' 1.21 replacing lTemp2 with iTemp2
''''''                        '     for math_get... optimization:
''''''
''''''                        ' bugfix1.23#255
''''''                        ' to_signed_int() added twice!
''''''
''''''                        ' calculate result:
''''''                        iTemp2 = to_signed_int(Fix(lTemp / to_unsigned_long(iTemp1)))
''''''                        AL = math_get_low_byte_of_word(iTemp2)
''''''                        AH = math_get_high_byte_of_word(iTemp2)
''''''                        ' calculate reminder:
''''''                        iTemp2 = to_signed_int(lTemp Mod to_unsigned_long(iTemp1))
''''''                        DL = math_get_low_byte_of_word(iTemp2)
''''''                        DH = math_get_high_byte_of_word(iTemp2)
''''''                        ' FLAGS NOT DEFINED.
''''''
                        
                        
                         ' 2004-10-30-DIV-BUG-SHOULD-NOT-OVERFLOW-FIX:
                        
                        ' 4,294,836,224 is bigger than  2,147,483,647
                        ' thefore Long type is of no good here.
                        
                        ' CURRENCY  8 bytes A scaled integer between
                        '  – 922,337,203,685,477.5808 and 922,337,203,685,477.5807.
                        Dim currencyXXX As Currency
                        
                        currencyXXX = to16bit_UNS(DL, DH)
                        currencyXXX = currencyXXX * 65536
                        currencyXXX = currencyXXX + to16bit_UNS(AL, AH)
                        
                        ' DIVISION BY ZERO:
                        If iTemp1 = 0 Then
                            tb1 = 0
                            GoTo enter_interupt_code_with_preset_tb1
                        End If
                        
                        ' LEGAL OVERFLOW CHECK (8086 CPU)
                        If Fix(currencyXXX / to_unsigned_long(iTemp1)) > 65535 Then
                            tb1 = 0 ' the quotient overflows the result register.
                            GoTo enter_interupt_code_with_preset_tb1
                        End If

                        ' calculate result:
                        iTemp2 = to_signed_int(Fix(Fix(currencyXXX) / to_unsigned_long(iTemp1)))
                        AL = math_get_low_byte_of_word(iTemp2)
                        AH = math_get_high_byte_of_word(iTemp2)
                        
                        
                        ' my own addition to 8086 check, I'm not sure realy CPU
                        ' does it, but I have to use it, because I get overflown reminder:
                        If checkMod_INT(currencyXXX, iTemp1) = False Then
                            ' well, the biggest reminder we can record is 0FFFFh,
                            ' so let it be:
                            
                            ' hem... I though again... actually, I made a test of
                            ' biggest_32bit_unsigned_prime_number_asm8086.asm
                            ' and DOS promt DEBUG, shows quite the oppsite :)
                            
                            ' so let it be 00000h
                            
                            DL = 0 '255
                            DH = 0 '255
                        Else
                            ' calculate reminder:
                            iTemp2 = to_signed_int(Fix(currencyXXX) Mod to_unsigned_long(iTemp1))
                            DL = math_get_low_byte_of_word(iTemp2)
                            DH = math_get_high_byte_of_word(iTemp2)
                        End If
                        
                        
                        
                        ' FLAGS NOT DEFINED.
                        
                        
                        

                    ' F7 /7       IDIV ew        Signed divide DXAX by EA word (AX=Quo DX=Rem)
                    Case 7
                        'If Not bREGISTERED Then GoTo share_ware
                        
                        
                        
                        '[SDEC_DEBUG_v120] sDECODED = "IDIV " & sDECODED
                        ' calculate DXAX:
                        curTemp = CCur(to16bit_UNS(DL, DH)) * 65536 + CCur(to16bit_UNS(AL, AH))
                        
                        ' Convert to signed long!!!!!! (still using Currency type)
                        curTemp = to_signed_currency_by_long(curTemp)
                        
                        ' 1.09
                        If iTemp1 = 0 Then
                            tb1 = 0 ' DIVISION BY ZERO!
                            GoTo enter_interupt_code_with_preset_tb1
                        End If
                        If (Fix(curTemp / iTemp1) > 32767) Or (Fix(curTemp / iTemp1) < -32768) Then
                            tb1 = 0 ' the quotient overflows the result register.
                            GoTo enter_interupt_code_with_preset_tb1
                        End If
                        
                        ' 1.21 replaced lTemp2 with iTemp2!
                        
                        ' calculate result:
                        iTemp2 = Fix(curTemp / iTemp1)
                        AL = math_get_low_byte_of_word(iTemp2)
                        AH = math_get_high_byte_of_word(iTemp2)
                        ' calculate reminder:
                        iTemp2 = curTemp Mod iTemp1
                        DL = math_get_low_byte_of_word(iTemp2)
                        DH = math_get_high_byte_of_word(iTemp2)
                        ' FLAGS NOT DEFINED.
                    
                    
                    ' F7 /5       IMUL ew        Signed multiply (DXAX = AX * EA word)
                    Case 5
                        'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
                        
                        '[SDEC_DEBUG_v120] sDECODED = "IMUL " & sDECODED

                        ' calculate result:
                        lTemp2 = to16bit_SIGNED(AL, AH) * CLng(iTemp1)
                        
                        ' generate HEX value from result:
                        sS1 = Hex(lTemp2)
                        
                        ' 1.21 WARNING! here we cannot update
                        '      to math_get_low_byte_of_word(),
                        '      math_get_high_byte_of_word()
                        '      because here it is a DOUBLE_WORD!!!
                        
                        ' set low word of result to AX:
                        AL = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(sS1))) '#1182e
                        AH = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(sS1))) '#1182e
                        
                        ' make sure there are at least 8 chars
                        ' (it cannot be longer then 8 - LONG is 4 bytes):
                        sS1 = make_min_len(sS1, 8, "0")
                        ' leave only high word in string:
                        sS1 = Mid(sS1, 1, 4)
                        
                        ' set hight word of result to DX
                        DL = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(sS1))) '#1182e
                        DH = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(sS1))) '#1182e
                        
                        ' set flags when result cannot be kept in AX alone:
                        If (lTemp2 > 32767) Or (lTemp2 < -32768) Then
                            frmFLAGS.cbOF.ListIndex = 1
                            frmFLAGS.cbCF.ListIndex = 1
                        Else
                            frmFLAGS.cbOF.ListIndex = 0
                            frmFLAGS.cbCF.ListIndex = 0
                        End If
                    
                    ' F7 /4       MUL ew         Unsigned multiply (DXAX = AX * EA word)
                    Case 4
                        '[SDEC_DEBUG_v120] sDECODED = "MUL " & sDECODED
                        'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
                        
                        ' calculate result:
                        curTemp = CCur(to16bit_UNS(AL, AH)) * to_unsigned_long(iTemp1)
                        
                        lTemp2 = to_signed_long_from_currency(curTemp)
                        
                        ' generate HEX value from result:
                        sS1 = Hex(lTemp2)
                        
                        ' set low word of result to AX:
                        AL = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(sS1))) '#1182e
                        AH = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(sS1))) '#1182e
                        
                        ' make sure there are at least 8 chars
                        ' (it cannot be longer then 8 - LONG is 4 bytes):
                        sS1 = make_min_len(sS1, 8, "0")
                        ' leave only high word in string:
                        sS1 = Mid(sS1, 1, 4)
                        
                        ' set hight word of result to DX
                        DL = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(sS1))) '#1182e
                        DH = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(sS1))) '#1182e
                        
                        ' set flags when result cannot be kept in AX alone:
                        If (DL <> 0) Or (DH <> 0) Then
                            frmFLAGS.cbOF.ListIndex = 1
                            frmFLAGS.cbCF.ListIndex = 1
                        Else
                            frmFLAGS.cbOF.ListIndex = 0
                            frmFLAGS.cbCF.ListIndex = 0
                        End If
                    
                    ' F7 /3       NEG ew         Two's complement negate EA word
                    Case 3
                        '[SDEC_DEBUG_v120] sDECODED = "NEG " & sDECODED
                        ALU.sub_WORDS 0, iTemp1, True
                        RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED
                        ' flags are set by SUB.
                    
                    ' F7 /2       NOT ew         Reverse each bit of EA word
                     Case 2
                        '[SDEC_DEBUG_v120] sDECODED = "NOT " & sDECODED
                        ALU.LOAD_A iTemp1
                        ALU.NOT_A_to_C
                        RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED
                        ' FLAGS NOT EFFECTED.
                        
                    ' F7 /0 iw    TEST ew,iw     AND immediate word into EA word for flags only
                     Case 0
                        curByte = curByte + 1
                        iTemp2 = RAM.mREAD_WORD(curByte)     ' get value of iw.
                        curByte = curByte + 1 ' set to last processed byte.
                        '[SDEC_DEBUG_v120] sDECODED = "TEST " & sDECODED & ", " & iTemp2
                        ALU.and_WORDS iTemp1, iTemp2, True
                        
                    End Select
                    
        #End If ' end of "if1125"
        
        ' ======================= 1.05 ============================
        
        ' F5          CMC            Complement carry flag
        ElseIf (tbFIRST = &HF5) Then
            ' invert the carry flag!
            If frmFLAGS.cbCF.ListIndex = 0 Then
                frmFLAGS.cbCF.ListIndex = 1
            Else
                frmFLAGS.cbCF.ListIndex = 0
            End If
            '[SDEC_DEBUG_v120] sDECODED = "CMC"
            
        ' F8          CLC            Clear carry flag
        ElseIf (tbFIRST = &HF8) Then
            frmFLAGS.cbCF.ListIndex = 0
            '[SDEC_DEBUG_v120] sDECODED = "CLC"
            
        ' F9          STC            Set carry flag
        ElseIf (tbFIRST = &HF9) Then
            frmFLAGS.cbCF.ListIndex = 1
            '[SDEC_DEBUG_v120] sDECODED = "STC"
                       
        ' FC          CLD            Clear direction flag so SI and DI will increment
        ElseIf (tbFIRST = &HFC) Then
            frmFLAGS.cbDF.ListIndex = 0
            '[SDEC_DEBUG_v120] sDECODED = "CLD"
            
        ' FD          STD            Set direction flag so SI and DI will decrement
        ElseIf (tbFIRST = &HFD) Then
            frmFLAGS.cbDF.ListIndex = 1
            '[SDEC_DEBUG_v120] sDECODED = "STD"
            
        ' FA          CLI            Clear interrupt enable flag; interrupts disabled
        ElseIf (tbFIRST = &HFA) Then
            frmFLAGS.cbIF.ListIndex = 0
            '[SDEC_DEBUG_v120] sDECODED = "CLI"
            
        ' FB          STI            Set interrupt enable flag, interrupts enabled
        ElseIf (tbFIRST = &HFB) Then
            frmFLAGS.cbIF.ListIndex = 1
            '[SDEC_DEBUG_v120] sDECODED = "STI"
            
        ' 98          CBW            Convert byte into word (AH = top bit of AL)
        ElseIf (tbFIRST = &H98) Then
            If (AL And &H80) Then ' 10000000b
                AH = 255 '  0FFh
            Else
                AH = 0   '  00h
            End If
            '[SDEC_DEBUG_v120] sDECODED = "CBW"
        
        ' 99          CWD            Convert word to doubleword (DX = top bit of AX)
        ElseIf (tbFIRST = &H99) Then
            ' check only sign bit of AH:
            If (AH And &H80) Then ' 10000000b
                DL = 255 '  0FFFFh
                DH = 255
            Else
                DL = 0   '  0000h
                DH = 0
            End If
            '[SDEC_DEBUG_v120] sDECODED = "CWD"
        
        ' FE /0       INC eb         Increment EA byte by 1
        ' FE /1       DEC eb         Decrement EA byte by 1
        ElseIf (tbFIRST = &HFE) Then
        
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    
                    mtRT = get_eaROW_eaTAB(tb1)
        
                    Select Case mtRT.bTAB
                    
                    ' FE /0       INC eb         Increment EA byte by 1
                    Case 0
                        '[SDEC_DEBUG_v120] sDECODED = "INC "
                        mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                        curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                        bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                        ALU.inc_BYTE bTemp1, True
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()

                    ' FE /1       DEC eb         Decrement EA byte by 1
                    Case 1
                        '[SDEC_DEBUG_v120] sDECODED = "DEC "
                        mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                        curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                        bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                        ALU.dec_BYTE bTemp1, True
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                        
                    Case Else
                        mBox Me, "FE /" & mtRT.bTAB & " - " & cMT("no such opcode in 8086 instruction set.")
                        ' #327r-stopeverything#' Exit Sub
                        
                    End Select
                    
        ' 9r          XCHG AX,rw     Exchange word register with AX
        ' 9r          XCHG rw,AX     Exchange  with word register
        ElseIf (tbFIRST >= &H90) And (tbFIRST <= &H97) Then
        
                'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
        
                tb1 = tbFIRST - &H90 ' get register index.
                '[SDEC_DEBUG_v120] sDECODED = "XCHG AX, " & g_wREGS(tb1)
                iTemp1 = get_WORD_RegValue(0)  ' get AX value.
                ' store value of rw into AX:
                store_WORD_RegValue 0, get_WORD_RegValue(tb1)
                ' store value of AX to rw:
                store_WORD_RegValue tb1, iTemp1
                
        
        ' 86 /r       XCHG rb,eb     Exchange EA byte with byte register
        ' 86 /r       XCHG eb,rb     Exchange byte register with EA byte
        ElseIf (tbFIRST = &H86) Then
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "XCHG " & g_EA_TCAP_rb(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, bTemp1
                    store_BYTE_RegValue mtRT.bTAB, bTemp2
        
        ' 87 /r       XCHG rw,ew     Exchange EA word with word register
        ' 87 /r       XCHG ew,rw     Exchange word register with EA word
        ElseIf (tbFIRST = &H87) Then
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "XCHG " & g_EA_TCAP_rw(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, iTemp1
                    store_WORD_RegValue mtRT.bTAB, iTemp2
        
        ' ======================= 1.06 ============================
        
        ' SHL, SAL, SHR, SAR, ROL, ROR, RCL, RCR:
        ElseIf (tbFIRST >= &HD0) And (tbFIRST <= &HD3) Then
        
                    'If Not bREGISTERED Then GoTo share_ware  '2.10#585b

                    
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    
                    mtRT = get_eaROW_eaTAB(tb1)
        
                    Select Case mtRT.bTAB
                    
                    ' mtRT.bTAB=4
                    ' 1.07 (", 6" added)
                    Case 4, 6
                        Select Case tbFIRST
                        
                        ' D0 /4       SHL eb,1       Multiply EA byte by 2, once
                        Case &HD0
                            '[SDEC_DEBUG_v120] sDECODED = "SHL "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            ALU.SHL_BYTE bTemp1, 1, 0
                            RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D2 /4       SHL eb,CL      Multiply EA byte by 2, CL times
                        Case &HD2
                            '[SDEC_DEBUG_v120] sDECODED = "SHL "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHL_BYTE bTemp1, CL, 0
                                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        ' D1 /4       SHL ew,1       Multiply EA word by 2, once
                        Case &HD1
                            '[SDEC_DEBUG_v120] sDECODED = "SHL "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            ALU.SHL_WORD iTemp1, 1, 0
                            RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D3 /4       SHL ew,CL      Multiply EA word by 2, CL times
                        Case &HD3
                            '[SDEC_DEBUG_v120] sDECODED = "SHL "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHL_WORD iTemp1, CL, 0
                                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        End Select

                    ' mtRT.bTAB=0
                    Case 0
                        ' By the book flags are effected the same way
                        ' as for SHL, but in DOS's debuger
                        ' it doesn't seem to effect OF, PF
                    
                        Select Case tbFIRST
                        ' D0 /0       ROL eb,1       Rotate 8-bit EA byte left once
                        Case &HD0
                            '[SDEC_DEBUG_v120] sDECODED = "ROL "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            ' using SHL with "-1" parameter makes a rotate:
                            ALU.SHL_BYTE bTemp1, 1, -1
                            RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D2 /0       ROL eb,CL      Rotate 8-bit EA byte left CL times
                        Case &HD2
                            '[SDEC_DEBUG_v120] sDECODED = "ROL "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            ' using SHL with "-1" parameter makes a rotate:
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHL_BYTE bTemp1, CL, -1
                                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        ' D1 /0       ROL ew,1       Rotate 16-bit EA word left once
                        Case &HD1
                            '[SDEC_DEBUG_v120] sDECODED = "ROL "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            ' using SHL with "-1" parameter makes a rotate:
                            ALU.SHL_WORD iTemp1, 1, -1
                            RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D3 /0       ROL ew,CL      Rotate 16-bit EA word left CL times
                        Case &HD3
                            '[SDEC_DEBUG_v120] sDECODED = "ROL "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            ' using SHL with "-1" parameter makes a rotate:
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHL_WORD iTemp1, CL, -1
                                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        End Select
                        
                    ' mtRT.bTAB=2
                    Case 2
                    
                        ' By the book flags are effected the same way
                        ' as for SHL, but in DOS's debuger
                        ' it doesn't seem to effect OF, PF
                    
                        Select Case tbFIRST
                        ' D0 /2       RCL eb,1       Rotate 9-bit quantity (CF, EA byte) left once
                        Case &HD0
                            '[SDEC_DEBUG_v120] sDECODED = "RCL "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            ' using SHL with "-2" parameter makes a rotate through CF:
                            ALU.SHL_BYTE bTemp1, 1, -2
                            RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D2 /2       RCL eb,CL      Rotate 9-bit quantity (CF, EA byte) left CL times
                        Case &HD2
                            '[SDEC_DEBUG_v120] sDECODED = "RCL "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            ' using SHL with "-2" parameter makes a rotate through CF:
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHL_BYTE bTemp1, CL, -2
                                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        ' D1 /2       RCL ew,1       Rotate 17-bit quantity (CF, EA word) left once
                        Case &HD1
                            '[SDEC_DEBUG_v120] sDECODED = "RCL "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            ' using SHL with "-2" parameter makes a rotate through CF:
                            ALU.SHL_WORD iTemp1, 1, -2
                            RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D3 /2       RCL ew,CL      Rotate 17-bit quantity (CF, EA word) left CL times
                        Case &HD3
                            '[SDEC_DEBUG_v120] sDECODED = "RCL "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            ' using SHL with "-2" parameter makes a rotate through CF:
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHL_WORD iTemp1, CL, -2
                                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        End Select
                        
                    ' mtRT.bTAB=5
                    Case 5
                        Select Case tbFIRST
                        
                        ' D0 /5       SHR eb,1       Unsigned divide EA byte by 2, once
                        Case &HD0
                            '[SDEC_DEBUG_v120] sDECODED = "SHR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            ALU.SHR_BYTE bTemp1, 1, 0
                            RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D2 /5       SHR eb,CL      Unsigned divide EA byte by 2, CL times
                        Case &HD2
                            '[SDEC_DEBUG_v120] sDECODED = "SHR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHR_BYTE bTemp1, CL, 0
                                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        ' D1 /5       SHR ew,1       Unsigned divide EA word by 2, once
                        Case &HD1
                            '[SDEC_DEBUG_v120] sDECODED = "SHR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            ALU.SHR_WORD iTemp1, 1, 0
                            RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D3 /5       SHR ew,CL      Unsigned divide EA word by 2, CL times
                        Case &HD3
                            '[SDEC_DEBUG_v120] sDECODED = "SHR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHR_WORD iTemp1, CL, 0
                                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        End Select
                    
                    ' mtRT.bTAB=7
                    Case 7
                        Select Case tbFIRST
                        
                        ' D0 /7       SAR eb,1       Signed divide EA byte by 2, once
                        Case &HD0
                            '[SDEC_DEBUG_v120] sDECODED = "SAR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            ' "5" parameter makes a signed shift:
                            ALU.SHR_BYTE bTemp1, 1, 5
                            RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D2 /7       SAR eb,CL      Signed divide EA byte by 2, CL times
                        Case &HD2
                            '[SDEC_DEBUG_v120] sDECODED = "SAR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            ' "5" parameter makes a signed shift:
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHR_BYTE bTemp1, CL, 5
                                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        ' D1 /7       SAR ew,1       Signed divide EA word by 2, once
                        Case &HD1
                            '[SDEC_DEBUG_v120] sDECODED = "SAR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            ' "5" parameter makes a signed shift:
                            ALU.SHR_WORD iTemp1, 1, 5
                            RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D3 /7       SAR ew,CL      Signed divide EA word by 2, CL times
                        Case &HD3
                            '[SDEC_DEBUG_v120] sDECODED = "SAR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            ' "5" parameter makes a signed shift:
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHR_WORD iTemp1, CL, 5
                                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        End Select

                    ' mtRT.bTAB=1
                    Case 1
                    
                        Select Case tbFIRST
                        ' D0 /1       ROR eb,1       Rotate 8-bit EA byte right once
                        Case &HD0
                            '[SDEC_DEBUG_v120] sDECODED = "ROR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            ' using SHR with "-1" parameter makes a rotate:
                            ALU.SHR_BYTE bTemp1, 1, -1
                            RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D2 /1       ROR eb,CL      Rotate 8-bit EA byte right CL times
                        Case &HD2
                            '[SDEC_DEBUG_v120] sDECODED = "ROR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            ' using SHR with "-1" parameter makes a rotate:
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHR_BYTE bTemp1, CL, -1
                                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        ' D1 /1       ROR ew,1       Rotate 16-bit EA word right once
                        Case &HD1
                            '[SDEC_DEBUG_v120] sDECODED = "ROR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            ' using SHR with "-1" parameter makes a rotate:
                            ALU.SHR_WORD iTemp1, 1, -1
                            RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D3 /1       ROR ew,CL      Rotate 16-bit EA word right CL times
                        Case &HD3
                            '[SDEC_DEBUG_v120] sDECODED = "ROR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            ' using SHR with "-1" parameter makes a rotate:
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHR_WORD iTemp1, CL, -1
                                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        End Select

                    ' mtRT.bTAB=3
                    Case 3
                    
                        Select Case tbFIRST
                        ' D0 /3       RCR eb,1       Rotate 9-bit quantity (CF, EA byte) right once
                        Case &HD0
                            '[SDEC_DEBUG_v120] sDECODED = "RCR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            ' using SHR with "-2" parameter makes a rotate through CF:
                            ALU.SHR_BYTE bTemp1, 1, -2
                            RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D2 /3       RCR eb,CL      Rotate 9-bit quantity (CF, EA byte) right CL times
                        Case &HD2
                            '[SDEC_DEBUG_v120] sDECODED = "RCR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                            ' using SHR with "-2" parameter makes a rotate through CF:
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHR_BYTE bTemp1, CL, -2
                                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        ' D1 /3       RCR ew,1       Rotate 17-bit quantity (CF, EA word) right once
                        Case &HD1
                            '[SDEC_DEBUG_v120] sDECODED = "RCR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            ' using SHR with "-2" parameter makes a rotate through CF:
                            ALU.SHR_WORD iTemp1, 1, -2
                            RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", 1"
                            
                        ' D3 /3       RCR ew,CL      Rotate 17-bit quantity (CF, EA word) right CL times
                        Case &HD3
                            '[SDEC_DEBUG_v120] sDECODED = "RCR "
                            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                            iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                            ' using SHR with "-2" parameter makes a rotate through CF:
                            If CL <> 0 Then ' 1.31#440
                                ALU.SHR_WORD iTemp1, CL, -2
                                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                            End If
                            '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", CL"
                            
                        End Select
                        
                    End Select
        
        ' 9E          SAHF           Store AH into flags  SF ZF xx AF xx PF xx CF
        ElseIf (tbFIRST = &H9E) Then
                    frmFLAGS.setFLAGS_REGISTER CInt(AH)
        
        ' 9F          LAHF           Load: AH = flags  SF ZF xx AF xx PF xx CF
        ElseIf (tbFIRST = &H9F) Then
                    AH = frmFLAGS.getFLAGS_REGISTER8
                    
        ElseIf (tbFIRST >= &H10) And (tbFIRST <= &H15) Then

            '[SDEC_DEBUG_v120] sDECODED = "ADC "
            
            'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
            
            
            Select Case tbFIRST
            
            ' 10 /r       ADC eb,rb      Add with carry byte register into EA byte
            Case &H10
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    
''''                    If frmFLAGS.cbCF.ListIndex = 1 Then
''''  2004.09.04                      ALU.add_BYTES bTemp2, 1
''''                        bTemp2 = ALU.GET_C_lb
''''                    End If
''''                    ALU.add_BYTES bTemp2, bTemp1
                    
                    
                    ' 2004.09.17
                    bSET_CARRY_CAUSE_9BIT = False
                    If bTemp1 = 255 Then ' &hFF
                        If frmFLAGS.cbCF.ListIndex = 1 Then
                            bSET_CARRY_CAUSE_9BIT = True
                            bTemp1 = 0
                            frmFLAGS.cbCF.ListIndex = 0
                            Dim bSET_AF2 As Boolean ' 2008-12-18
                            bSET_AF2 = True
                        End If
                    End If
                                        
                    
                    ' 2004.09.04
                    ALU.add_BYTES bTemp2, bTemp1 + frmFLAGS.cbCF.ListIndex
                    If bSET_AF2 Then frmFLAGS.cbAF.ListIndex = 1 ' 2008-12-18
                    
                    
                    ' 2004.09.17
                    If bSET_CARRY_CAUSE_9BIT Then frmFLAGS.cbCF.ListIndex = 1
                    
                    
                    
                    
                    
                    RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rb(mtRT.bTAB)
                        
            ' 11 /r       ADC ew,rw      Add with carry word register into EA word
            Case &H11
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    
                    
''''                    If frmFLAGS.cbCF.ListIndex = 1 Then
''''  2004.09.04                      ALU.add_WORDS iTemp2, 1, True
''''                        iTemp2 = ALU.GET_C_SIGNED
''''                    End If
''''                    ALU.add_WORDS iTemp2, iTemp1, True
                    
                    
                    ' 2004.09.17
                    bSET_CARRY_CAUSE_17BIT = False
                    If iTemp1 = -1 Then ' &hFFFF
                        If frmFLAGS.cbCF.ListIndex = 1 Then
                            bSET_CARRY_CAUSE_17BIT = True
                            Dim bTACK2 As Boolean
                            bTACK2 = True
                        End If
                    End If
                    
                    
                    ' 2008-12-18 bug 2
                    If iTemp1 = 32767 And frmFLAGS.cbCF.ListIndex = 1 Then
                        ALU.add_WORDS iTemp1, frmFLAGS.cbCF.ListIndex, True
                        Dim bTACK1 As Boolean
                        If frmFLAGS.cbAF.ListIndex = 1 Then bTACK1 = True
                        iTemp1 = ALU.GET_C_SIGNED
                        ALU.add_WORDS iTemp2, iTemp1, True
                        frmFLAGS.cbOF.ListIndex = 1
                        If bTACK1 Then frmFLAGS.cbAF.ListIndex = 1 ' ....
                    Else
                        ' 2004.09.04
                        ALU.add_WORDS iTemp2, iTemp1 + frmFLAGS.cbCF.ListIndex, True
                        If bTACK2 Then frmFLAGS.cbAF.ListIndex = 1 ' ....
                    End If
                    
                    
                    
                    ' 2004.09.17
                    If bSET_CARRY_CAUSE_17BIT Then frmFLAGS.cbCF.ListIndex = 1
                               
                    
                    
                    RAM.mWRITE_WORD mtLOC_SIZE.lLoc, ALU.GET_C_lb, ALU.GET_C_hb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rw(mtRT.bTAB)
                    
            ' 12 /r       ADC rb,eb      Add with carry EA byte into byte register
            Case &H12
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "ADC " & g_EA_TCAP_rb(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    
''''                    If frmFLAGS.cbCF.ListIndex = 1 Then
''''   2004.09.04                     ALU.add_BYTES bTemp1, 1
''''                        bTemp1 = ALU.GET_C_lb
''''                    End If
''''                    ALU.add_BYTES bTemp1, bTemp2

                    ' 2004.09.17
                    bSET_CARRY_CAUSE_9BIT = False
                    If bTemp2 = 255 Then ' &hFF
                        If frmFLAGS.cbCF.ListIndex = 1 Then
                            bSET_CARRY_CAUSE_9BIT = True
                            bTemp2 = 0
                            frmFLAGS.cbCF.ListIndex = 0
                            Dim bAFK5 As Boolean ' 2008-12-18
                            bAFK5 = True
                        End If
                    End If

                    ' 2004.09.04
                    ALU.add_BYTES bTemp1, bTemp2 + frmFLAGS.cbCF.ListIndex
                    If bAFK5 Then frmFLAGS.cbAF.ListIndex = 1
                    
                    ' 2004.09.17
                    If bSET_CARRY_CAUSE_9BIT Then frmFLAGS.cbCF.ListIndex = 1
                          
                    
                    store_BYTE_RegValue mtRT.bTAB, ALU.GET_C_lb
                    
                    
            ' 13 /r       ADC rw,ew      Add with carry EA word into word register
            Case &H13
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "ADC " & g_EA_TCAP_rw(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    
'''                    If frmFLAGS.cbCF.ListIndex = 1 Then
'''   2004.09.04                     ALU.add_WORDS iTemp1, 1, True
'''                        iTemp1 = ALU.GET_C_SIGNED
'''                    End If
'''                    ALU.add_WORDS iTemp1, iTemp2, True
                    
                    
                    ' 2004.09.17
                    bSET_CARRY_CAUSE_17BIT = False
                    If iTemp2 = -1 Then ' &hFFFF
                        If frmFLAGS.cbCF.ListIndex = 1 Then
                            bSET_CARRY_CAUSE_17BIT = True
                            Dim bTACK3 As Boolean
                            bTACK3 = True
                        End If
                    End If
                    
                    
                    
                    
                    ' 2008-12-18 bug 2
                    If iTemp2 = 32767 And frmFLAGS.cbCF.ListIndex = 1 Then
                        ALU.add_WORDS iTemp2, frmFLAGS.cbCF.ListIndex, True
                        Dim bTACK4 As Boolean
                        If frmFLAGS.cbAF.ListIndex = 1 Then bTACK4 = True
                        iTemp2 = ALU.GET_C_SIGNED
                        ALU.add_WORDS iTemp1, iTemp2, True
                        frmFLAGS.cbOF.ListIndex = 1
                        If bTACK4 Then frmFLAGS.cbAF.ListIndex = 1 ' ....
                    Else
                        ALU.add_WORDS iTemp1, iTemp2 + frmFLAGS.cbCF.ListIndex, True
                        If bTACK3 Then frmFLAGS.cbAF.ListIndex = 1 ' ....
                    End If
                    
                    ' 2004.09.17
                    If bSET_CARRY_CAUSE_17BIT Then frmFLAGS.cbCF.ListIndex = 1
                                       
                    
                    
                    store_WORD_RegValue mtRT.bTAB, ALU.GET_C_SIGNED
                    
                    
            ' 14 ib       ADC AL,ib      Add with carry immediate byte into AL
            Case &H14
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    '[SDEC_DEBUG_v120] sDECODED = "ADC AL, " & toHexForm(tb1)
                    
'''                    If frmFLAGS.cbCF.ListIndex = 1 Then
'''   2004.09.04                     ALU.add_BYTES AL, 1
'''                        AL = ALU.GET_C_lb
'''                    End If
'''                    ALU.add_BYTES AL, tb1
                    
                    
                    ' 2004.09.17
                    bSET_CARRY_CAUSE_9BIT = False
                    If tb1 = 255 Then ' &hFF
                        If frmFLAGS.cbCF.ListIndex = 1 Then
                            bSET_CARRY_CAUSE_9BIT = True
                            tb1 = 0
                            frmFLAGS.cbCF.ListIndex = 0
                            Dim bAFK6 As Boolean  ' 2008-12-18
                            bAFK6 = True
                        End If
                    End If
                                        
                                        
                    
                    ' 2004.09.04
                    ALU.add_BYTES AL, tb1 + frmFLAGS.cbCF.ListIndex
                    If bAFK6 Then frmFLAGS.cbAF.ListIndex = 1
                    
                    ' 2004.09.17
                    If bSET_CARRY_CAUSE_9BIT Then frmFLAGS.cbCF.ListIndex = 1

                    
                    AL = ALU.GET_C_lb
                    
            ' 15 iw       ADC AX,iw      Add with carry immediate word into AX
            Case &H15
                    curByte = curByte + 1
                    iTemp1 = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 1   ' point to last processed byte.
                    
                    
                    '[SDEC_DEBUG_v120] sDECODED = "ADC AX, " & toHexForm(iTemp1)
                    iTemp2 = to16bit_SIGNED(AL, AH)
                    
                    
'''                    If frmFLAGS.cbCF.ListIndex = 1 Then
''' 2004.09.04                       ALU.add_WORDS iTemp2, 1, True
'''                        iTemp2 = ALU.GET_C_SIGNED
'''                    End If
'''                    ALU.add_WORDS iTemp2, iTemp1, True
                    
                    
                    ' 2004.09.17
                    bSET_CARRY_CAUSE_17BIT = False
                    If iTemp1 = -1 Then ' &hFFFF
                        If frmFLAGS.cbCF.ListIndex = 1 Then
                            bSET_CARRY_CAUSE_17BIT = True
                            Dim bTACK9 As Boolean
                            bTACK9 = True
                        End If
                    End If
                                        
                                        
                    ' 2008-12-18 bug 2
                    If iTemp1 = 32767 And frmFLAGS.cbCF.ListIndex = 1 Then
                        ALU.add_WORDS iTemp1, frmFLAGS.cbCF.ListIndex, True
                        Dim bTACK91 As Boolean
                        If frmFLAGS.cbAF.ListIndex = 1 Then bTACK91 = True
                        iTemp1 = ALU.GET_C_SIGNED
                        ALU.add_WORDS iTemp2, iTemp1, True
                        frmFLAGS.cbOF.ListIndex = 1
                        If bTACK91 Then frmFLAGS.cbAF.ListIndex = 1 ' ....
                    Else
                        ALU.add_WORDS iTemp2, iTemp1 + frmFLAGS.cbCF.ListIndex, True
                        If bTACK9 Then frmFLAGS.cbAF.ListIndex = 1 ' ....
                    End If


                    
                    
                    
                    ' 2004.09.17
                    If bSET_CARRY_CAUSE_17BIT Then frmFLAGS.cbCF.ListIndex = 1
                            
                    
                    
                    AL = ALU.GET_C_lb
                    AH = ALU.GET_C_hb
            
            End Select
            
        ElseIf (tbFIRST >= &H18) And (tbFIRST <= &H1D) Then

            '[SDEC_DEBUG_v120] sDECODED = "SBB "
            
            Select Case tbFIRST
            
            ' 18 /r       SBB eb,rb      Subtract with borrow byte register from EA byte
            Case &H18
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ' after investigation in DOS DEBUGER,
                    ' this way flags are set correctly:
                    If frmFLAGS.cbCF.ListIndex = 1 Then
                        If bTemp2 = 0 Then
                            ALU.add_BYTES bTemp1, 1
                            bTemp1 = ALU.GET_C_lb
                        Else
                            ALU.sub_BYTES bTemp2, 1
                            bTemp2 = ALU.GET_C_lb
                        End If
                    End If
                    
                    ' 2008-12-18
                    If bTemp2 = 0 Or bTemp1 = 0 Then
                        Dim bTempACK8 As Boolean
                        If frmFLAGS.cbAF.ListIndex = 1 Then bTempACK8 = True
                        ALU.sub_BYTES bTemp2, bTemp1
                        frmFLAGS.cbOF.ListIndex = 0
                        If bTempACK8 Then frmFLAGS.cbAF.ListIndex = 1 ' ...
                    Else
                        ALU.sub_BYTES bTemp2, bTemp1
                    End If
                    
                    RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rb(mtRT.bTAB)


            ' 19 /r       SBB ew,rw      Subtract with borrow word register from EA word
            Case &H19
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ' after investigation in DOS DEBUGER,
                    ' this way flags are set correctly:
                    If frmFLAGS.cbCF.ListIndex = 1 Then
                        If iTemp2 = 0 Then
                            ALU.add_WORDS iTemp1, 1, True
                            iTemp1 = ALU.GET_C_SIGNED
                        Else
                            ALU.sub_WORDS iTemp2, 1, True
                            iTemp2 = ALU.GET_C_SIGNED
                        End If
                    End If
                    
                    ' 2008-12-18
                    If iTemp1 = 0 Or iTemp2 = 0 Then
                        Dim bTempACK9 As Boolean
                        If frmFLAGS.cbAF.ListIndex = 1 Then bTempACK9 = True
                        ALU.sub_WORDS iTemp2, iTemp1, True
                        frmFLAGS.cbOF.ListIndex = 0
                        If bTempACK9 Then frmFLAGS.cbAF.ListIndex = 1 ' ...
                    Else
                        ALU.sub_WORDS iTemp2, iTemp1, True
                    End If
                    
                    RAM.mWRITE_WORD mtLOC_SIZE.lLoc, ALU.GET_C_lb, ALU.GET_C_hb
                    '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & g_EA_TCAP_rw(mtRT.bTAB)
                    
            ' 1A /r       SBB rb,eb      Subtract with borrow EA byte from byte register
            Case &H1A
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    bTemp1 = get_BYTE_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "SBB " & g_EA_TCAP_rb(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    bTemp2 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                    ' after investigation in DOS DEBUGER,
                    ' this way flags are set correctly:
                    If frmFLAGS.cbCF.ListIndex = 1 Then
                        If bTemp1 = 0 Then
                            ALU.add_BYTES bTemp2, 1
                            bTemp2 = ALU.GET_C_lb
                        Else
                            ALU.sub_BYTES bTemp1, 1
                            bTemp1 = ALU.GET_C_lb
                        End If
                    End If
                    
                    ' 2008-12-18
                    If bTemp1 = 0 Or bTemp2 = 0 Then
                        Dim bTempACK3 As Boolean
                        If frmFLAGS.cbAF.ListIndex = 1 Then bTempACK3 = True
                        ALU.sub_BYTES bTemp1, bTemp2
                        frmFLAGS.cbOF.ListIndex = 0
                        If bTempACK3 Then frmFLAGS.cbAF.ListIndex = 1 ' ...
                    Else
                        ALU.sub_BYTES bTemp1, bTemp2
                    End If
                    
                    store_BYTE_RegValue mtRT.bTAB, ALU.GET_C_lb
                    
                    
            ' 1B /r       SBB rw,ew      Subtract with borrow EA word from word register
            Case &H1B
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "SBB " & g_EA_TCAP_rw(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    ' after investigation in DOS DEBUGER,
                    ' this way flags are set correctly:
                    If frmFLAGS.cbCF.ListIndex = 1 Then
                        If iTemp1 = 0 Then
                            ALU.add_WORDS iTemp2, 1, True
                            iTemp2 = ALU.GET_C_SIGNED
                        Else
                            ALU.sub_WORDS iTemp1, 1, True
                            iTemp1 = ALU.GET_C_SIGNED
                        End If
                    End If
                    
                    ' 2008-12-17 bug 1
                    If iTemp1 = 0 Or iTemp2 = 0 Then
                        Dim bTempACK2 As Boolean
                        If frmFLAGS.cbAF.ListIndex = 1 Then bTempACK2 = True
                        ALU.sub_WORDS iTemp1, iTemp2, True
                        frmFLAGS.cbOF.ListIndex = 0
                        If bTempACK2 Then frmFLAGS.cbAF.ListIndex = 1 ' ...
                    Else
                        ALU.sub_WORDS iTemp1, iTemp2, True
                    End If
                    
                    store_WORD_RegValue mtRT.bTAB, ALU.GET_C_SIGNED
                    
                   
                    
            ' 1C ib       SBB AL,ib      Subtract with borrow immediate byte from AL
            Case &H1C
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    '[SDEC_DEBUG_v120] sDECODED = "SBB AL, " & toHexForm(tb1)
                    ' after investigation in DOS DEBUGER,
                    ' this way flags are set correctly:
                    If frmFLAGS.cbCF.ListIndex = 1 Then
                        If AL = 0 Then
                            ALU.add_BYTES tb1, 1
                            tb1 = ALU.GET_C_lb
                        Else
                            ALU.sub_BYTES AL, 1
                            AL = ALU.GET_C_lb
                        End If
                    End If
                    
                    ' 2008-12-18
                    If AL = 0 Or tb1 = 0 Then
                        Dim bTempACK4 As Boolean
                        If frmFLAGS.cbAF.ListIndex = 1 Then bTempACK4 = True
                        ALU.sub_BYTES AL, tb1
                        frmFLAGS.cbOF.ListIndex = 0
                        If bTempACK4 Then frmFLAGS.cbAF.ListIndex = 1 ' ...
                    Else
                        ALU.sub_BYTES AL, tb1
                    End If
                    
                    AL = ALU.GET_C_lb
                    
            ' 1D iw       SBB AX,iw      Subtract with borrow immediate word from AX
            Case &H1D
                    curByte = curByte + 1
                    iTemp1 = RAM.mREAD_WORD(curByte)
                    curByte = curByte + 1   ' point to last processed byte.
                    '[SDEC_DEBUG_v120] sDECODED = "SBB AX, " & toHexForm(iTemp1)
                    iTemp2 = to16bit_SIGNED(AL, AH)
                    ' after investigation in DOS DEBUGER,
                    ' this way flags are set correctly:
                    If frmFLAGS.cbCF.ListIndex = 1 Then
                        If iTemp2 = 0 Then
                            ALU.add_WORDS iTemp1, 1, True
                            iTemp1 = ALU.GET_C_SIGNED
                        Else
                            ALU.sub_WORDS iTemp2, 1, True
                            iTemp2 = ALU.GET_C_SIGNED
                        End If
                    End If
                    
                    ' 2008-12-18
                    If iTemp1 = 0 Or iTemp2 = 0 Then
                        Dim bTempACK6 As Boolean
                        If frmFLAGS.cbAF.ListIndex = 1 Then bTempACK6 = True
                        ALU.sub_WORDS iTemp2, iTemp1, True
                        frmFLAGS.cbOF.ListIndex = 0
                        If bTempACK6 Then frmFLAGS.cbAF.ListIndex = 1 ' ...
                    Else
                        ALU.sub_WORDS iTemp2, iTemp1, True
                    End If
                    
                    AL = ALU.GET_C_lb
                    AH = ALU.GET_C_hb
            
            End Select
 
        ' =========== 1.07 =================
 
        ' C4 /r       LES rw,ed      Load EA doubleword into ES and word register
        ElseIf (tbFIRST = &HC4) Then
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    
                    '[SDEC_DEBUG_v120] sDECODED = "LES " & g_EA_TCAP_rw(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    
                    iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    store_WORD_RegValue mtRT.bTAB, iTemp1
                    
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc + 2)
                    ES = iTemp2
        
        ' C5 /r       LDS rw,ed      Load EA doubleword into DS and word register
        ElseIf (tbFIRST = &HC5) Then
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    
                    '[SDEC_DEBUG_v120] sDECODED = "LES " & g_EA_TCAP_rw(mtRT.bTAB) & ", "
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    
                    iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                    store_WORD_RegValue mtRT.bTAB, iTemp1
                    
                    iTemp2 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc + 2)
                    DS = iTemp2
                    
        ' 8D /r       LEA rw,m       Calculate EA offset given by m, place in rw
        ElseIf (tbFIRST = &H8D) Then
                    curByte = curByte + 1
                    tb1 = RAM.mREAD_BYTE(curByte)
                    mtRT = get_eaROW_eaTAB(tb1)
                    iTemp1 = get_WORD_RegValue(mtRT.bTAB)
                    '[SDEC_DEBUG_v120] sDECODED = "LEA " & g_EA_TCAP_rw(mtRT.bTAB) & ", "
                    '[SDEC_DEBUG_v120] t_o_d_o: "BYTE PTR" or "WORD PTR" should not be added:
                    mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                    curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
                    store_WORD_RegValue mtRT.bTAB, to_signed_int(mtLOC_SIZE.lLoc - get_SEGMENT_LOCATION(0))
                                        
                    ' Debug.Print "xx:" & sDECODED, Hex(mtLOC_SIZE.lLoc), Hex(mtLOC_SIZE.lLoc - to_unsigned_long(DS) * 16)
                    
        ' D7          XLAT mb        Set AL to memory byte [BX + unsigned AL]
        ' D7          XLATB          Set AL to memory byte DS:[BX + unsigned AL]
        ElseIf (tbFIRST = &HD7) Then
                ' 1.20 BUG#134b iTemp1 = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
                ' 1.20 to_signed_byte() is used, but AL is treated as unsigned (I hope).
                iTemp1 = mathAdd_WORDS(to16bit_SIGNED(BL, BH), to_signed_byte(AL))
                AL = RAM.mREAD_BYTE(get_SEGMENT_LOCATION(0) + to_unsigned_long(iTemp1))
                    
        ' =========== 1.11 =================
        
        ' E4 ib       IN AL,ib       Input byte from immediate port into AL
        ElseIf (tbFIRST = &HE4) Then
            'If Not bREGISTERED Then
            '    If iIN_OUT_UNREG_COUNT > 10 Then in_out_limit_shareware
            '    iIN_OUT_UNREG_COUNT = iIN_OUT_UNREG_COUNT + 1
            'End If
        
                curByte = curByte + 1
                tb1 = RAM.mREAD_BYTE(curByte)
                '[SDEC_DEBUG_v120] sDECODED = "IN AL, " & toHexForm(tb1)

                do_INB (CLng(tb1))
                

        ' EC          IN AL,DX       Input byte from port DX into AL
        ElseIf (tbFIRST = &HEC) Then
            'If Not bREGISTERED Then
            '    If iIN_OUT_UNREG_COUNT > 10 Then in_out_limit_shareware
            '    iIN_OUT_UNREG_COUNT = iIN_OUT_UNREG_COUNT + 1
            'End If
        
                lTemp = to16bit_UNS(DL, DH)
        
                do_INB (lTemp)
        
        ' E5 ib       IN AX,ib       Input word from immediate port into AX
        ElseIf (tbFIRST = &HE5) Then
            'If Not bREGISTERED Then
            '    If iIN_OUT_UNREG_COUNT > 10 Then in_out_limit_shareware
            '    iIN_OUT_UNREG_COUNT = iIN_OUT_UNREG_COUNT + 1
            'End If
            
                curByte = curByte + 1
                tb1 = RAM.mREAD_BYTE(curByte)
                '[SDEC_DEBUG_v120] sDECODED = "IN AX, " & toHexForm(tb1)

                do_INW (CLng(tb1))
                
        ' ED          IN AX,DX       Input word from port DX into AX
        ElseIf (tbFIRST = &HED) Then
            'If Not bREGISTERED Then
            '    If iIN_OUT_UNREG_COUNT > 10 Then in_out_limit_shareware
            '    iIN_OUT_UNREG_COUNT = iIN_OUT_UNREG_COUNT + 1
            'End If
        
                '[SDEC_DEBUG_v120] sDECODED = "IN AX, DX"
        
                lTemp = to16bit_UNS(DL, DH)
        
                do_INW (lTemp)
                    
        ' E6 ib       OUT ib,AL      Output byte AL to immediate port number ib
        ElseIf (tbFIRST = &HE6) Then
            'If Not bREGISTERED Then
            '    If iIN_OUT_UNREG_COUNT > 10 Then in_out_limit_shareware
            '    iIN_OUT_UNREG_COUNT = iIN_OUT_UNREG_COUNT + 1
            'End If
            
                curByte = curByte + 1
                tb1 = RAM.mREAD_BYTE(curByte)
                '[SDEC_DEBUG_v120] sDECODED = "OUT " & toHexForm(tb1) & ", AL"
            
                do_OUTB (CLng(tb1))
                
        ' E7 ib       OUT ib,AX      Output word AX to immediate port number ib
        ElseIf (tbFIRST = &HE7) Then
            'If Not bREGISTERED Then
            '    If iIN_OUT_UNREG_COUNT > 10 Then in_out_limit_shareware
            '    iIN_OUT_UNREG_COUNT = iIN_OUT_UNREG_COUNT + 1
            'End If
            
                curByte = curByte + 1
                tb1 = RAM.mREAD_BYTE(curByte)
                '[SDEC_DEBUG_v120] sDECODED = "OUT " & toHexForm(tb1) & ", AX"

                do_OUTW (CLng(tb1))
                
                
        ' EE          OUT DX,AL      Output byte AL to port number DX
        ElseIf (tbFIRST = &HEE) Then
            'If Not bREGISTERED Then
            '    If iIN_OUT_UNREG_COUNT > 10 Then in_out_limit_shareware
            '    iIN_OUT_UNREG_COUNT = iIN_OUT_UNREG_COUNT + 1
            'End If
            
                '[SDEC_DEBUG_v120] sDECODED = "OUT DX, AL"
                
                lTemp = to16bit_UNS(DL, DH)
        
                do_OUTB (lTemp)
                
        ' EF          OUT DX,AX      Output word AX to port number DX
        ElseIf (tbFIRST = &HEF) Then
            'If Not bREGISTERED Then
            '    If iIN_OUT_UNREG_COUNT > 10 Then in_out_limit_shareware
            '    iIN_OUT_UNREG_COUNT = iIN_OUT_UNREG_COUNT + 1
            'End If
            
                '[SDEC_DEBUG_v120] sDECODED = "OUT DX, AX"
                
                lTemp = to16bit_UNS(DL, DH)
        
                do_OUTW (lTemp)
                         
                         
        ' ========== 1.16 =====================================
        
        ' 37          AAA            ASCII adjust AL (carry into AH) after addition
        ElseIf (tbFIRST = &H37) Then
               
            'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
               
            tb1 = AL And &HF  ' get low nibble only (clear high nibble).
            
            If tb1 > 9 Or (frmFLAGS.cbAF.ListIndex = 1) Then
                
                ' according to "Art of assembler" only
                ' 8088 and 8086 add 6 to AL,
                ' others add 6 to AX!
                
                ALU.add_BYTES AL, 6
                AL = ALU.GET_C_lb
                
                ALU.inc_BYTE AH, True ' allow flags?
                AH = ALU.GET_C_lb
                
                frmFLAGS.cbAF.ListIndex = 1
                frmFLAGS.cbCF.ListIndex = 1
            Else
                frmFLAGS.cbAF.ListIndex = 0
                frmFLAGS.cbCF.ListIndex = 0
            End If
        
            ' high nibble is always cleared:
            AL = AL And &HF ' clear high nibble.

            ALU.set_parity_flag AL  ' #327s-parity-bug2-test#

            '[SDEC_DEBUG_v120] sDECODED = "AAA"
        
        ' 3F          AAS            ASCII adjust AL (borrow from AH) after subtraction
        ElseIf (tbFIRST = &H3F) Then
               
            'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
               
            tb1 = AL And &HF  ' get low nibble only (clear high nibble).
            
            If tb1 > 9 Or (frmFLAGS.cbAF.ListIndex = 1) Then
                
                ALU.sub_BYTES AL, 6
                AL = ALU.GET_C_lb
                
                ALU.dec_BYTE AH, True ' allow flags?
                AH = ALU.GET_C_lb
                
                frmFLAGS.cbAF.ListIndex = 1
                frmFLAGS.cbCF.ListIndex = 1
            Else
                frmFLAGS.cbAF.ListIndex = 0
                frmFLAGS.cbCF.ListIndex = 0
            End If
        
            ' high nibble is always cleared:
            AL = AL And &HF ' clear high nibble.
            
            ALU.set_parity_flag AL  ' #327s-parity-bug2-test#
            
            '[SDEC_DEBUG_v120] sDECODED = "AAS"
        
        ' D5 0A       AAD            ASCII adjust before division (AX = 10*AH + AL)
        ElseIf (tbFIRST = &HD5) Then
        
                'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
                
                
                curByte = curByte + 1
                tb1 = RAM.mREAD_BYTE(curByte)
                
                ' tb1 should be 0Ah generally!
                
                '[SDEC_DEBUG_v120] sDECODED = "AAD " & toHexForm(tb1)
                
                ' iTemp1 = AH * 10
                ' make multiply by 10 using simple add function
                ' ten times :)
                iTemp1 = math_Multiply_BYTES(AH, tb1)
                                                    
                ' AL = AH * 10 + AL
                ALU.add_WORDS iTemp1, CInt(AL), True
                AL = ALU.GET_C_lb
                
                AH = 0
            
                ' flags are set by the last add,
                ' not sure if it's correct.

                
        ' D4 0A       AAM            ASCII adjust after multiply (AL/10: AH=Quo AL=Rem)
        ElseIf (tbFIRST = &HD4) Then
        
                'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
        
                curByte = curByte + 1
                tb1 = RAM.mREAD_BYTE(curByte)
                
                ' tb1 should be 0Ah generally!
                
                '[SDEC_DEBUG_v120] sDECODED = "AAM " & toHexForm(tb1)
                
                If tb1 = 0 Then
                    tb1 = 0 ' DIVISION BY ZERO!
                    GoTo enter_interupt_code_with_preset_tb1
                End If
                
                AH = Fix(AL / tb1)
                AL = AL Mod tb1
                
                ' just to set flags:
                ALU.add_BYTES AL, 0
                
                
                
        
        ' 27          DAA            Decimal adjust AL after addition
        ElseIf (tbFIRST = &H27) Then
        
        
'  completely re-written due to 2004-10-12-BUG.txt
        
        Dim bSET20041012__DAA_SET_AF As Integer

        tb1 = AL And &HF  ' get low nibble only (clear high nibble).
        
        If (tb1 > 9) Or (frmFLAGS.cbAF.ListIndex = 1) Then
            ' AL = AL + 6
            
            ALU.LOAD_A_lb AL
            ALU.LOAD_B_lb 6
            
            ' seems to be causing: 2005-04-28_DAA_bug.asm' ALU.bSET_FLAGS = True
            ALU.bSET_FLAGS = False
            
            ALU.MAKE_add_BYTES
            AL = ALU.GET_C_lb
            
            frmFLAGS.cbAF.ListIndex = 1
            bSET20041012__DAA_SET_AF = 1
        Else
            frmFLAGS.cbAF.ListIndex = 0
            bSET20041012__DAA_SET_AF = 0
        End If


        
        


        If (AL > &H9F) Or (frmFLAGS.cbCF.ListIndex = 1) Then
            'AL = AL + &H60
            
            ' ALU.add_BYTES AL, &H60 --- cannot be used because it sets flags.
                       
            ALU.LOAD_A_lb AL
            ALU.LOAD_B_lb &H60
            ALU.bSET_FLAGS = True
            ALU.MAKE_add_BYTES
            AL = ALU.GET_C_lb

            frmFLAGS.cbCF.ListIndex = 1
        Else
            frmFLAGS.cbCF.ListIndex = 0
            ALU.set_parity_flag AL ' #327s-parity-bug#
        End If

        frmFLAGS.cbAF.ListIndex = bSET20041012__DAA_SET_AF
        frmFLAGS.cbOF.ListIndex = 0 ' to make AX=125 DAA work correct...
        
'  completely re-written due to 2004-10-12-BUG.txt
'''''            ' 2.06#552 BUGFIX
'''''            tb2 = AL
'''''            iTemp1 = frmFLAGS.cbCF.ListIndex
'''''            bTemp1 = 0
'''''            bTemp2 = 0
'''''
'''''
'''''            tb1 = AL And &HF  ' get low nibble only (clear high nibble).
'''''
'''''            ' by "Art of Assembler" and "Rivka" algorithm:
'''''
'''''            If (tb1 > 9) Or (frmFLAGS.cbAF.ListIndex = 1) Then
'''''
'''''                ALU.add_BYTES AL, 6
'''''                AL = ALU.GET_C_lb
'''''
'''''                bTemp1 = 1 ' 2.06#552 BUGFIX
'''''            End If
'''''
'''''            ' 2.06#552 BUGFIX If (AL > &H9F) Or (frmFLAGS.cbCF.ListIndex = 1) Then
'''''            If (tb2 > &H9F) Or (iTemp1 = 1) Then
'''''
'''''                ALU.add_BYTES AL, &H60
'''''                AL = ALU.GET_C_lb
'''''
'''''                bTemp2 = 1 ' 2.06#552 BUGFIX
'''''            End If
'''''
'''''
'''''            ' 2.06#552 BUGFIX
'''''            If bTemp1 = 1 Then
'''''                frmFLAGS.cbAF.ListIndex = 1
'''''            End If
'''''            If bTemp2 = 1 Then
'''''                frmFLAGS.cbCF.ListIndex = 1
'''''            End If
'''''
'''''


' IF ((AL AND 0FH) > 9) OR (AF = 1)
' THEN
'   AL := AL + 6;
'   AF := 1;
' ELSE
'   AF := 0;
' FI;
' IF (AL > 9FH) OR (CF = 1)
' THEN
'   AL := AL + 60H;
'   CF := 1;
' ELSE CF := 0;
' FI;


            '[SDEC_DEBUG_v120] sDECODED = "DAA"
        
        ' 2F          DAS            Decimal adjust AL after subtraction
        ElseIf (tbFIRST = &H2F) Then
               
               
        
'  completely re-written due to 2004-10-12-BUG.txt

        Dim bSET20041012__DAS_SET_AF As Integer
        

        tb1 = AL And &HF   ' get low nibble only (clear high nibble).
        
        If (tb1 > 9) Or (frmFLAGS.cbAF.ListIndex = 1) Then
            ' AL = AL - 6
            
            
            ALU.LOAD_A_lb AL
'''''            ALU.LOAD_B_lb &HFA  ' that is "-6"
'''''            ALU.bSET_FLAGS = True
'''''            ALU.MAKE_add_BYTES
'''''           fix 2005-01-15-BUG-FIXED.txt --- instead of "add" -- "sub".
            ALU.LOAD_B_lb 6  ' that is "-6"
            
            
            ' seems to be causing: 2005-04-28_DAA_bug.asm (and DAS)' ALU.bSET_FLAGS = True
            ALU.bSET_FLAGS = False
            
            ALU.MAKE_sub_BYTES
            AL = ALU.GET_C_lb
            
            
            
            
            
            frmFLAGS.cbAF.ListIndex = 1
            bSET20041012__DAS_SET_AF = 1
        Else
            frmFLAGS.cbAF.ListIndex = 0
            bSET20041012__DAS_SET_AF = 0
        End If


        If (AL > &H9F) Or (frmFLAGS.cbCF.ListIndex = 1) Then
            'AL = AL - &H60
        
            ALU.LOAD_A_lb AL
            ALU.LOAD_B_lb &HA0  ' that is "- &H60"
            ALU.bSET_FLAGS = True         ' flags are set!
            ALU.MAKE_add_BYTES
            AL = ALU.GET_C_lb

            frmFLAGS.cbCF.ListIndex = 1
        Else
            frmFLAGS.cbCF.ListIndex = 0
            ALU.set_parity_flag AL ' #327s-parity-bug2-test# (seems to be required only for this "if" branch, cause previous sets flags).
        End If
               
        frmFLAGS.cbOF.ListIndex = 0 ' to make AX=E9h DAS work correct...
        frmFLAGS.cbAF.ListIndex = bSET20041012__DAS_SET_AF
               
' http://www7.informatik.uni-erlangen.de/~msdoerfe/embedded/386html/DAS.htm
               
' IF (AL AND 0FH) > 9 OR AF = 1
' THEN
'   AL := AL - 6;
'   AF := 1;
' ELSE
'   AF := 0;
' FI;
' IF (AL > 9FH) OR (CF = 1)
' THEN
'   AL := AL - 60H;
'   CF := 1;
' ELSE CF := 0;
' FI;
               
               
'  completely re-written due to 2004-10-12-BUG.txt
'''''            ' 2.06#552b BUGFIX
'''''            iTemp1 = frmFLAGS.cbCF.ListIndex
'''''            tb2 = AL
'''''            bTemp1 = 0
'''''            bTemp2 = 0
'''''
'''''            tb1 = AL And &HF  ' get low nibble only (clear high nibble).
'''''
'''''            ' by "Art of Assembler" algorithm:
'''''
'''''            If (tb1 > 9) Or (frmFLAGS.cbAF.ListIndex = 1) Then
'''''
'''''                ALU.sub_BYTES AL, 6
'''''                AL = ALU.GET_C_lb
'''''
'''''                bTemp1 = 1
'''''            End If
'''''
'''''            If (tb2 > &H9F) Or (iTemp1 = 1) Then
'''''
'''''                ALU.sub_BYTES AL, &H60
'''''                AL = ALU.GET_C_lb
'''''
'''''                bTemp2 = 1
'''''            End If
'''''
'''''            ' 2.06#552b BUGFIX
'''''            If bTemp1 = 1 Then
'''''                frmFLAGS.cbAF.ListIndex = 1
'''''            End If
'''''            If bTemp2 = 1 Then
'''''                frmFLAGS.cbCF.ListIndex = 1
'''''            End If

            '[SDEC_DEBUG_v120] sDECODED = "DAS"
        
        ' ========== 1.23 =====================================
        
        ' 60         *PUSHA          Push AX,CX,DX,BX,original SP,BP,SI,DI
        ElseIf (tbFIRST = &H60) Then
            
            'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
            
            iTemp1 = SP ' remember original SP
            
            stackPUSH to16bit_SIGNED(AL, AH)
            stackPUSH to16bit_SIGNED(CL, CH)
            stackPUSH to16bit_SIGNED(DL, DH)
            stackPUSH to16bit_SIGNED(BL, BH)
            stackPUSH iTemp1 ' original SP!
            stackPUSH BP
            stackPUSH SI
            stackPUSH DI
            
            
        ' 61         *POPA           Pop DI,SI,BP,SP,BX,DX,CX,AX (SP value is ignored)
        ElseIf (tbFIRST = &H61) Then
        
            'If Not bREGISTERED Then GoTo share_ware  '2.10#585b
        
            DI = stackPOP
            SI = stackPOP
            BP = stackPOP
            iTemp1 = stackPOP ' SP - ignored!
            
            
            iTemp1 = stackPOP
            BL = math_get_low_byte_of_word(iTemp1)
            BH = math_get_high_byte_of_word(iTemp1)
            
            iTemp1 = stackPOP
            DL = math_get_low_byte_of_word(iTemp1)
            DH = math_get_high_byte_of_word(iTemp1)
            
            iTemp1 = stackPOP
            CL = math_get_low_byte_of_word(iTemp1)
            CH = math_get_high_byte_of_word(iTemp1)
        
            iTemp1 = stackPOP
            AL = math_get_low_byte_of_word(iTemp1)
            AH = math_get_high_byte_of_word(iTemp1)
        
        
        ' 6A ib      *PUSH ib        Push sign-extended immediate byte
        ElseIf (tbFIRST = &H6A) Then
                curByte = curByte + 1
                tb1 = RAM.mREAD_BYTE(curByte)
                ' make sign of the pushed word to be the
                ' same sign as of the byte:
                If tb1 > 127 Then
                    tb2 = 255
                Else
                    tb2 = 0
                End If
                
                stackPUSH to16bit_SIGNED(tb1, tb2)
        
        ' 68 iw      *PUSH iw        Set [SP-2] to immediate word, then decrement SP by 2
        ElseIf (tbFIRST = &H68) Then
                curByte = curByte + 1
                iTemp1 = RAM.mREAD_WORD(curByte)
                curByte = curByte + 1   ' point to last processed byte.

                stackPUSH iTemp1

        ' F4          HLT            Halt
        ElseIf (tbFIRST = &HF4) Then
                bTERMINATED = True  ' 1.30#423
                bSTOP_frmDEBUGLOG = True
                
                mBox Me, cMT(sEMULATOR_HALTED)
                stopAutoStep
                
                CLOSE_ALL_VIRTUAL_FILES ' #1194  - operating system cleans after buggy programs...
                
                Exit Sub
                
                
                                
        ' #400b15-ok#
                                
        ' C0 /0 ib   *ROL eb,ib      Rotate 8-bit EA byte left ib times
        ' C0 /1 ib   *ROR eb,ib      Rotate 8-bit EA byte right ib times
        ' C0 /2 ib   *RCL eb,ib      Rotate 9-bit quantity (CF, EA byte) left ib times
        ' C0 /3 ib   *RCR eb,ib      Rotate 9-bit quantity (CF, EA byte) right ib times
        ' C0 /4 ib   *SAL eb,ib      Multiply EA byte by 2, ib times
        ' C0 /4 ib   *SHL eb,ib      Multiply EA byte by 2, ib times
        ' C0 /5 ib   *SHR eb,ib      Unsigned divide EA byte by 2, ib times
        ' C0 /7 ib   *SAR eb,ib      Signed divide EA byte by 2, ib times
        ElseIf (tbFIRST = &HC0) Then
            do_instruction_C0 curByte
            
            
        ' C1 /0 ib   *ROL ew,ib      Rotate 16-bit EA word left ib times
        ' C1 /1 ib   *ROR ew,ib      Rotate 16-bit EA word right ib times
        ' C1 /2 ib   *RCL ew,ib      Rotate 17-bit quantity (CF, EA word) left ib times
        ' C1 /3 ib   *RCR ew,ib      Rotate 17-bit quantity (CF, EA word) right ib times
        ' C1 /4 ib   *SAL ew,ib      Multiply EA word by 2, ib times
        ' C1 /4 ib   *SHL ew,ib      Multiply EA word by 2, ib times
        ' C1 /5 ib   *SHR ew,ib      Unsigned divide EA word by 2, ib times
        ' C1 /7 ib   *SAR ew,ib      Signed divide EA word by 2, ib times
        ElseIf (tbFIRST = &HC1) Then
            do_instruction_C1 curByte
        
        
        
        
        ' #400b15-ok2#
            
        ' C8 iw 00   *ENTER iw,0     Make stack frame, iw bytes local storage, 0 levels
        ' C8 iw 01   *ENTER iw,1     Make stack frame, iw bytes local storage, 1 level
        ' C8 iw ib   *ENTER iw,ib    Make stack frame, iw bytes local storage, ib levels
        ' (these all seems to be equal, ie: ENTER iw,ib)
        ElseIf (tbFIRST = &HC8) Then
            do_instruction_C8 curByte
            
            
        ' C9         *LEAVE          Set SP to BP, then POP BP (reverses previous ENTER)
        ElseIf (tbFIRST = &HC9) Then
            do_instruction_C9 curByte
            
            
            
            
        ' #400b15-ok3#
            
            
        ' 69 /r iw   *IMUL rw,iw     Signed multiply immediate word into word register
        ' 69 /r iw   *IMUL rw,ew,iw  Signed multiply (rw = EA word * immediate word)
        ElseIf (tbFIRST = &H69) Then
            do_instruction_69 curByte
            
            
        ' 6B /r ib   *IMUL rw,ib     Signed multiply immediate byte into word register
        ' 6B /r ib   *IMUL rw,ew,ib  Signed multiply (rw = EA word * immediate byte)
        ElseIf (tbFIRST = &H6B) Then
            do_instruction_6B curByte
        
        
        
        
        
        ' #400b15-ok4#
        
        ' 6C         *INS eb,DX      Input byte from port DX into [DI], advance DI
        ' 6C         *INSB           Input byte from port DX into ES:[DI], advance DI
        ElseIf (tbFIRST = &H6C) Then
            do_instruction_6C curByte
            
        ' 6D         *INS ew,DX      Input word from port DX into [DI], advance DI
        ' 6D         *INSW           Input word from port DX into ES:[DI], advance DI
        ElseIf (tbFIRST = &H6D) Then
            do_instruction_6D curByte
             
        ' 6E         *OUTS DX,eb     Output byte [SI] to port number DX, advance SI
        ' 6E         *OUTSB          Output byte DS:[SI] to port number DX, advance SI
        ElseIf (tbFIRST = &H6E) Then
            do_instruction_6E curByte
                
        ' 6F         *OUTS DX,ew     Output word [SI] to port number DX, advance SI
        ' 6F         *OUTSW          Output word DS:[SI] to port number DX, advance SI
        ElseIf (tbFIRST = &H6F) Then
            do_instruction_6F curByte
                             
                             
            
            
            
        ' #400b15-wait#
                
        ' 9B          WAIT           Wait until BUSY pin is inactive (HIGH)
        ElseIf (tbFIRST = &H9B) Then
                ' #400b15-wait#
                mFPU.fpu_fWAIT curByte
        
        
        ' 4.00b20
        ' F0          LOCK (prefix)  Assert BUSLOCK signal for the next instruction
        ElseIf (tbFIRST = &HF0) Then
                Debug.Print "LOCK-OPCODE:F0"
                ' just ignore
                
                
                
                
        ' #400b20-fasm-jcc#
        '0F 80 cw       JO rel16        Jump near if overflow (OF=1).
        '0F 81 cw       JNO rel16       Jump near if not overflow (OF=0).
        '0F 82 cw       JC rel16        Jump near if carry (CF=1).
        '0F 83 cw       JNC rel16       Jump near if not carry (CF=0).
        '0F 84 cw       JZ rel16        Jump near if 0 (ZF=1).
        '0F 85 cw       JNZ rel16       Jump near if not zero (ZF=0).
        '0F 86 cw       JNA rel16       Jump near if not above (CF=1 or ZF=1).
        '0F 87 cw       JA rel16        Jump near if above (CF=0 and ZF=0).
        '0F 88 cw       JS rel16        Jump near if sign (SF=1).
        '0F 89 cw       JNS rel16       Jump near if not sign (SF=0).
        '0F 8A cw       JP rel16        Jump near if parity (PF=1).
        '0F 8B cw       JNP rel16       Jump near if not parity (PF=0).
        '0F 8C cw       JL rel16        Jump near if less (SF<>OF).
        '0F 8D cw       JGE rel16       Jump near if greater or equal (SF=OF).
        '0F 8E cw       JLE rel16       Jump near if less or equal (ZF=1 or SF<>OF).
        '0F 8F cw       JG rel16        Jump near if greater (ZF=0 and SF=OF).
        ElseIf (tbFIRST = &HF) Then
                curByte = curByte + 1
                tb1 = RAM.mREAD_BYTE(curByte)
                If (tb1 And &HF0) = &H80 Then
                    addTO_IP = do_instruction_0F_8n(tb1, curByte)
                Else
                    ' TODO.... may add other extended opcodes.... 286, 386....
                    GoTo skip_over_unknown
                End If
                
                
                
        ' #400b20-FPU#
        ElseIf (tbFIRST >= &HD8) And (tbFIRST <= &HDF) Then
                do_instruction_D8_DF tbFIRST, curByte
                

        ' ?????????????????????????? NOT SUPPORTED!
        Else
                   
' #400b20-jump-over-unknown# '
'''''                    ' #400b15-jump-over-all-unknown-bytes#
'''''                    ' point to last unknown byte.
'''''                    If UBound(L2LC) >= frmOrigCode.cmaxActualSource.HighlightedLine Then
'''''                        Dim lSkipUnknown As Long
'''''                        lSkipUnknown = L2LC(frmOrigCode.cmaxActualSource.HighlightedLine).ByteLast - L2LC(frmOrigCode.cmaxActualSource.HighlightedLine).ByteFirst
'''''                        If lSkipUnknown > 0 Then
'''''                            curByte = curByte + lSkipUnknown
'''''                        End If
'''''                    End If

' ' #400b20-jump-over-unknown#
' may not work if wrong disassembly...
' simpler the better:
''                    If lBLUE_SelectedMemoryLocation_UNTIL > 0 And lBLUE_SelectedMemoryLocation_UNTIL < MAX_MEMORY Then
''                        curByte = lBLUE_SelectedMemoryLocation_UNTIL
''                    End If
                    

' ' #400b20-jump-over-unknown# final fix
skip_over_unknown:
                    Dim sUNKNOWN_BYTE As String
                    sUNKNOWN_BYTE = make_min_len(Hex(RAM.mREAD_BYTE(curByte)), 2, "0")
                    
                    
'                    If b_LOADED_frmOrigCode Then             ' #400b20-ants#
'                        If frmOrigCode.Visible Then          ' #400b20-ants#
'                            If UBound(L2LC) >= frmOrigCode.cmaxActualSource.HighlightedLine Then
'                                Dim lSkipUnknownTo As Long
'                                lSkipUnknownTo = L2LC(frmOrigCode.cmaxActualSource.HighlightedLine).ByteLast
'                                If lSkipUnknownTo > 0 Then
'                                    curByte = lPROG_LOADED_AT_ADR + lSkipUnknownTo
'                                End If
'                            End If
'                        End If
'                    End If
                    
                    
                    mBox Me, cMT("unknown opcode skipped:") & " " & sUNKNOWN_BYTE & vbNewLine & _
                             cMT("not 8086 instruction - not supported yet.")  ' & vbNewLine & cMT("make sure you JMP over any DB or DW data declarations.")
                    stopAutoStep
                                        
                    
                   '#327r-stopeverything#' let it step over...'  Exit Sub
        End If

        '================================================



out_of_IF:



''[SDEC_DEBUG_v120] T_O_D_O: do something with sDECODED?

' 1.06       txtDECODED.Text = txtDECODED.Text & sDECODED & vbNewLine
        
' 1.06      txtDECODED.SelStart = Len(txtDECODED.Text)
' 1.06        txtDECODED.SelLength = 0

' Debug.Print sDECODED

      'If bLOADING_FILE_TO_EMULATOR Then Exit Sub ' #327s-load-in-input-mode-bug#. - must help!

    
        If bSTOP_EVERYTHING Then Exit Sub ' #327s-load-in-input-mode-bug#. this really helps...


        ' set CS:IP back from curByte:
        ' previosly curByte was set this way: curByte = CS * 16 + IP
        ' then curByte grows depending on command.
        ' ASSUMED: IP cannot be changed anywhere except this line,
        '          and first line in doStep()
        '          CS can be changed anywhere inside doStep().
        ' (IP is also changed by
        '     "JMP ew", "CALL ew", "RET *"
        '           never gets here after such change)
        ' 1.11 added to_signed_int() when loading FreeDos:
        ' addTO_IP  is SIGNED !!!!
        IP = to_signed_int((curByte - to_unsigned_long(CS) * 16) + addTO_IP + 1)
        
        
        ' could be bug when addTO_IP is to big/small (out of Integer)
        ' 1.21 - I think it cannot be.


        ' 1.07
        If bReDisassemble And bAUTOMATIC_DISASM_AFTER_JMP_CALL Then
            ' show disassembled code:
            lTemp = to_unsigned_long(CS) * 16 + to_unsigned_long(IP)
            DoDisassembling lTemp
            selectDisassembled_Line_by_ADDRESS lTemp, BLUE_SELECTOR
        End If
                      

        Exit Sub

error_on_step:
        
        mBox Me, "error on single step: " & LCase(Err.Description)
        stopAutoStep
        Resume Next
End Sub




'
' #327xr-400-new-mem-list#
'''' enabled this: #1095
'''Public Sub cmdShowMemory_Click_PUBLIC()
'''    cmdShowMemory_Click
'''End Sub


' #327xr-400-new-mem-list# REPLACED WITH: showMemory
' 1.15
' is used to convert physical address to segment:offset,
' and show the memory, in case it is possible CS is used
' as a default segment:
'''''Public Sub show_memory_at_physical_adr(lADR As Long)
'''''    Dim lSegment As Long
'''''    Dim lOffset As Long
'''''
'''''    lOffset = lADR - to_unsigned_long(CS) * &H10
'''''
'''''    If (lOffset > 0) And (lOffset <= 65535) Then
'''''       lSegment = to_unsigned_long(CS)
'''''    Else
'''''       lSegment = Fix(lADR / &H10)
'''''       lOffset = lADR Mod &H10
'''''    End If
'''''
'''''    txtMemSegment.Text = make_min_len(Hex(lSegment), 4, "0")
'''''    txtMemOffset.Text = make_min_len(Hex(lOffset), 4, "0")
'''''
'''''    cmdShowMemory_Click
'''''End Sub
'
' #327xr-400-new-mem-list#
'''' 1.15
'''Public Sub show_memory_at_seg_offset(iSeg As Integer, iOffset As Integer)
'''    txtMemSegment.Text = make_min_len(Hex(iSeg), 4, "0")
'''    txtMemOffset.Text = make_min_len(Hex(iOffset), 4, "0")
'''
'''    cmdShowMemory_Click
'''End Sub

'
' #327xr-400-new-mem-list#
''''''Private Sub cmdShowMemory_Click()
''''''
''''''On Error GoTo err_smc
''''''
''''''    Dim i As Long
''''''    Dim b As Byte
''''''    Dim s As String
''''''
''''''    ' 1.15
''''''    Dim lSEGMENT As Long
''''''    Dim lOFFSET As Long
''''''
''''''' 1.15
''''''''''    ' 1.10
''''''''''    ' support segment input:
''''''''''    If InStr(1, txtMemStartAddress.Text, ":", vbTextCompare) > 0 Then
''''''''''        s = getToken(txtMemStartAddress.Text, 0, ":")
''''''''''        startADR = HexToLong(s & "0") ' * 16
''''''''''        s = getToken(txtMemStartAddress.Text, 1, ":")
''''''''''        startADR = startADR + HexToLong(s)
''''''''''    Else
''''''''''        startADR = HexToLong(txtMemStartAddress.Text)
''''''''''    End If
''''''
''''''    ' 1.15
''''''    lSEGMENT = to_unsigned_long(Val("&H" & txtMemSegment.Text))
''''''    lOFFSET = to_unsigned_long(Val("&H" & txtMemOffset.Text))
''''''
''''''    ' 1.15
''''''    ' two text boxes are used, one for segment, another for offset:
''''''    startADR = lSEGMENT * &H10 + lOFFSET
''''''
''''''    ' 1.17
''''''    lMemoryListSegment = lSEGMENT
''''''    ' 1.20
''''''    lMemoryListOffset = lOFFSET
''''''
''''''    lstMemory.Clear
''''''    ' #327t-memlist2code# ' only 1k is shown - it will take a lot of time to show whole 1MB (and list box can only show 32k)!
''''''    ' #327t-memlist2code# - we show 64 bytes by default now :)
''''''    For i = startADR To startADR + dis_Bytes_to_Disassemble ' #327t-memlist2code# '  limitADR
''''''
''''''        b = RAM.mREAD_BYTE(i)
''''''
''''''            ' #327xq-show-physical#
''''''            If SHOW_PHYSICAL Then
''''''                   ' the new way: phical address
''''''                   lstMemory.AddItem make_min_len(Hex(i), 5, "0") & ": " & byteHEX(b) & " " & byteDEC(b) & " " & byteChar(b)
''''''            Else
''''''                   ' the old way
''''''                   lstMemory.AddItem make_min_len(Hex(lOFFSET), 4, "0") & ": " & byteHEX(b) & " " & byteDEC(b) & " " & byteChar(b)
''''''            End If
''''''
''''''        lOFFSET = lOFFSET + 1 ' 1.15
''''''
''''''        ' 1.27#346b
''''''        ' Memory list should not show offset over FFFF!
''''''        If lOFFSET > 65535 Then
''''''            Exit For
''''''        End If
''''''
''''''    Next i
''''''
''''''    ' the RAM.mREAD_BYTE() function cares about any errors, so it's not
''''''    '   required to check for overflow.
''''''
''''''    ' 1.07
''''''    ' hor. scroll should be added
''''''    ' after filling the list:
''''''    AddHorizontalScroll lstMemory
''''''
''''''
''''''    Exit Sub
''''''err_smc:
''''''    Debug.Print "Error on cmdShowMemory_Click: " & LCase(err.Description)
''''''End Sub
''''''
''''''
Public Sub mnuResetEmulator_and_RAM_Click_PUBLIC()
On Error Resume Next ' 4.00-Beta-3
    mnuResetEmulator_and_RAM_Click
End Sub



' 1.23
Private Sub mnuResetEmulator_and_RAM_Click()

On Error GoTo err1: ' 3.27xo
 
    ' subbugfix #1135
    stop_everything

    reset_CPU
    
    show_Registers  ' does something else except showing the registers, but it's OK.
    
    RAM.clear_RAM   ' should be called before!! because it clears interupt vector and BIOS also!!!
    
    reLOAD_EMULATOR
    
    frmScreen.set_VIDEO_MODE 3 ' #1048b it was 0 before 2005-06-04
    
    frmScreen.picSCREEN.Cls   ' memory is cleared anyway.
    
    ' #1114c' reset keyboard buffer:
    uCHARS_IN_KB_BUFFER = 0
    frmScreen.show_uKB_BUFFER
    
''    ' #1114c clear and hide original source window
''    If b_LOADED_frmOrigCode Then
''        frmOrigCode.Hide
''    End If
    
    Exit Sub
err1:
    Debug.Print "mnuResetEmulator_and_RAM_Click: " & Err.Description
    On Error Resume Next
End Sub

'Private Sub mnuRobot_Click()
'' #1144
''    frmDEVICE_Robot.DoShowMe
''    frmDEVICE_Robot.update_DEVICE
'End Sub

' 1.24#275b
Private Sub mnuRun_Click()
On Error Resume Next ' 4.00b15
    chkAutoStep.Value = vbChecked  ' RUN!!!!!
End Sub

Private Sub mnuRunUntilSelected_Click()

On Error Resume Next ' 4.00-Beta-3

' #327xr-400-new-mem-list#
'''    iRUN_UNTIL_SELECTED_CS = to_signed_int(lMemoryListSegment)
'''    iRUN_UNTIL_SELECTED_IP = to_signed_int(to_unsigned_long(lstMemory.ListIndex) + lMemoryListOffset)

    lRUN_UNTIL_SELECTED = lYELLOW_SelectedMemoryLocation_FROM


' #327xr-400-new-mem-list#
'''    ' no run if already there:
'''    If (CS = iRUN_UNTIL_SELECTED_CS) And (IP = iRUN_UNTIL_SELECTED_IP) Then
'''
      If lYELLOW_SelectedMemoryLocation_FROM = get_PHYSICAL_ADDR(CS, IP) Then
          Exit Sub
      End If
    
    
    
    
    
    ' #1067
    If bTERMINATED Then
        bRUN_AFTER_RELOAD = True
        bDO_NOT_RESET_bRun_UNTIL = True
    End If

    bRun_UNTIL_SELECTED = True
    
    
    chkAutoStep.Value = vbChecked  ' RUN!!!!!
    
End Sub

Private Sub mnuSample_ARR_Click(Index As Integer)
On Error Resume Next ' 4.00-Beta-3
    frmMain.mnuSample_CLICK_from_Emulator Index
    
    ' Like click on [x] button:
    Form_QueryUnload 0, 0
End Sub

' 4.00
' #400-emu-state#
Private Sub saveEMULATOR_SAVE_ASCII_STATE()
On Error GoTo error_saving

    Dim fNum As Integer
    Dim sFilename As String
    Dim ts As String

    ' 1.23 frmMain.sOpenedFile replaced with sOpenedExecutable

'''    If sOpenedExecutable <> "" Then
'''        ts = ExtractFilePath(sOpenedExecutable)
'''        If myChDir(ts) Then
'''            ComDlg.FileInitialDirD = ts
'''        End If
'''        ComDlg.FileNameD = CutExtension(sOpenedExecutable) & ".txt"
'''    Else
'''        ts = App.Path
'''        If myChDir(ts) Then
'''            ComDlg.FileInitialDirD = ts
'''        End If
'''        ComDlg.FileNameD = "unknown.txt"
'''    End If
'''
'''    ComDlg.hwndOwner = Me.hwnd
'''    ComDlg.Flags = OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT + OFN_PATHMUSTEXIST
'''    ComDlg.Filter = "text files (*.txt)|*.txt|all Files (*.*)|*.*"
'''    ComDlg.DefaultExtD = "txt"
'''    sFilename = ComDlg.ShowSave
    
    '20140414
    sFilename = Add_BackSlash(App.Path) & "ascii.state.txt"
    
    
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


        ' ***** save disassembled list
        ' copied from set_lstDECODED()
        Dim i As Long
        Dim buf As String
        Dim b As Byte
        Dim lineCount As Long
        Dim s As String
        
        buf = ""
        i = 0
        lineCount = 0
        
        s = "; >>>>>>>>>>> disassembled code <<<<<<<<<<<<" & vbNewLine
        s = s & "; " & CStr(lLastDisAddress - lStartDisAddress) & " bytes." & vbNewLine & vbNewLine
        
         ' #327q2c# '
        Dim sExt As String
        sExt = extract_extension(sOpenedExecutable)
        If (StrComp(sExt, ".COM", vbTextCompare) = 0) Or (StrComp(sExt, ".COM_", vbTextCompare) = 0) Then   ' #327xo-av-protect#
           s = s & "ORG 100h" & vbNewLine & vbNewLine
        ElseIf (StrComp(sExt, ".EXE", vbTextCompare) = 0) Or (StrComp(sExt, ".EXE_", vbTextCompare) = 0) Then  ' #327xo-av-protect#
            s = s & "#MAKE_EXE#" & vbNewLine & vbNewLine
        ElseIf lPROG_LOADED_AT_OFFSET = &H7C00 Then
            s = s & "#MAKE_BOOT#" & vbNewLine & "ORG 7C00h" & vbNewLine & vbNewLine
        Else
            ' ... probably its raw binary.... make bin is default anyway...
        End If
        
        
        
        Put #fNum, , s
        
        Do While dis_recBuf(i) <> 0
        
            b = dis_recBuf(i)
            
            If b = 10 Then
                s = getLogicalAdr_String(lStartDisAddress + dis_recLocCounter(lineCount)) & "  " & buf & vbNewLine
                Put #fNum, , s
                buf = ""
                lineCount = lineCount + 1
            ElseIf b = 13 Then
                ' just skip it (it doesn't seem to appear anyway).
            Else
                buf = buf & Chr(b)
            End If
            
            i = i + 1
            
        Loop
        ' ****************
                    
                    
        ' @@@@@@@@@@@@@@@@@@@@@@ save memory list:
        s = "END" & vbNewLine & vbNewLine & vbNewLine
        s = s & "; ------------- MEMORY at "
        
        ' copied from show_memory_at_physical_adr()
        Dim lSEGMENT As Long
        Dim lOFFSET As Long
        
        lOFFSET = lStartMemAddress - to_unsigned_long(CS) * &H10
        
        If (lOFFSET > 0) And (lOFFSET <= 65535) Then
           lSEGMENT = to_unsigned_long(CS)
        Else
           lSEGMENT = Fix(lStartMemAddress / &H10)
           lOFFSET = lStartMemAddress Mod &H10
        End If
        
        s = s & make_min_len(Hex(lSEGMENT), 4, "0") & ":" & make_min_len(Hex(lOFFSET), 4, "0") & " -------------" & vbNewLine
        s = s & "; " & CStr(lLastDisAddress - lStartDisAddress) & " bytes " & vbNewLine & vbNewLine
        
        Put #fNum, , s

        ' #327xr-400-new-mem-list# ' For i = 0 To lstMemory.ListCount - 1
        For i = lStartMemAddress To lLastMemAddress
            s = make_min_len(Hex(RAM.mREAD_BYTE(i)), 2, "0") & vbNewLine
            Put #fNum, , s
        Next i
        
        ' @@@@@@@@@@@@@@@@@@@@@@
        
        
        ' >>>>>>>>> save registers:
        s = vbNewLine
        s = s & "------------- REGISTERS -------------" & vbNewLine
        
        s = s & "AL = " & Hex(AL) & "h" & vbNewLine
        s = s & "AH = " & Hex(AH) & "h" & vbNewLine
        s = s & "BL = " & Hex(BL) & "h" & vbNewLine
        s = s & "BH = " & Hex(BH) & "h" & vbNewLine
        s = s & "CL = " & Hex(CL) & "h" & vbNewLine
        s = s & "CH = " & Hex(CH) & "h" & vbNewLine
        s = s & "DL = " & Hex(DL) & "h" & vbNewLine
        s = s & "DH = " & Hex(DH) & "h" & vbNewLine
    
        s = s & "" & vbNewLine
        
        s = s & "DS = " & Hex(DS) & "h" & vbNewLine
        s = s & "ES = " & Hex(ES) & "h" & vbNewLine
        s = s & "SI = " & Hex(SI) & "h" & vbNewLine
        s = s & "DI = " & Hex(DI) & "h" & vbNewLine
        s = s & "BP = " & Hex(BP) & "h" & vbNewLine
        s = s & "CS = " & Hex(CS) & "h" & vbNewLine
        s = s & "IP = " & Hex(IP) & "h" & vbNewLine
        s = s & "SS = " & Hex(SS) & "h" & vbNewLine
        s = s & "SP = " & Hex(SP) & "h" & vbNewLine
       
        Put #fNum, , s
        ' >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                    
        
        ' Close:
        Close fNum
        '--------------------------------
      
        ' #400b3-viwer#
        Dim sMSG1 As String
        sMSG1 = cMT("would you like to open it with notepad?")
        If StrComp(ASCII_VIEWER, "notepad", vbTextCompare) <> 0 Then
            sMSG1 = Replace(sMSG1, "notepad", ExtractFileName(ASCII_VIEWER), 1, 1, vbTextCompare)
        End If
        
        
         ' #327q2c# '
         If MsgBox(cMT("the emulator's state is saved to:") & vbNewLine & sFilename & vbNewLine & vbNewLine & _
                   sMSG1, vbYesNo, "open in notepad?") = vbYes Then
            
            Call ShellExecute(Me.hwnd, "open", ASCII_VIEWER, sFilename, ExtractFilePath(sFilename), SW_SHOWDEFAULT)
                  
         End If
        
        
        
        
    Else
        Debug.Print "Save canceled."
       
    End If
    
    Exit Sub
error_saving:

    mBox Me, "error: " & vbNewLine & LCase(Err.Description)
    
End Sub

' 1.16
Private Function getLogicalAdr_String(physical_adr As Long) As String
    
On Error GoTo err1

    Dim lSEGMENT As Long
    Dim lOFFSET As Long
    
    ' convert physical address to segment:offset,
    ' in case it is possible CS is used
    ' as a default segment:
           
        lOFFSET = physical_adr - to_unsigned_long(CS) * &H10
        
        If (lOFFSET > 0) And (lOFFSET <= 65535) Then
           lSEGMENT = to_unsigned_long(CS)
        Else
           lSEGMENT = physical_adr / &H10
           lOFFSET = physical_adr Mod &H10
        End If
            
    getLogicalAdr_String = make_min_len(Hex(lSEGMENT), 4, "0") & ":" & make_min_len(Hex(lOFFSET), 4, "0")
    
    Exit Function
err1:
    Debug.Print "ERR:###12 : " & Err.Description
    
End Function


Public Sub mnuSelect_lines_at_CS_IP_Click_PUBLIC()
On Error Resume Next ' 4.00-Beta-3
    mnuSelect_lines_at_CS_IP_Click
End Sub

' 1.20
Private Sub mnuSelect_lines_at_CS_IP_Click()
' copied from show_Registers()

On Error GoTo err1

        Dim lTemp As Long
        
        lTemp = to_unsigned_long(CS) * 16 + to_unsigned_long(IP)
        If sDEBUGED_file <> "" Then
            selectSourceLineAtLocation lTemp - lPROG_LOADED_AT_ADR, True
        End If


        ' in case memory list isn't at the right position, make it be there:
        ' #400b9-blue-all-bytes# ' selectMemoryLine_BLUE lTemp, lTemp, True

        selectDisassembled_Line_by_ADDRESS lTemp, BLUE_SELECTOR, True ' #400b9-blue-all-bytes#
        
        Exit Sub
        
err1:
        Debug.Print "err112u: " & Err.Description
End Sub



Private Sub mnuSingleStepBack_Click()
On Error Resume Next ' 4.00-Beta-3
    cmdBack_Click
End Sub

' 1.27#345
''''
''''' 1.10
''''Private Sub mnuSetMemValue_from_HexCalc_Click()
''''    If lstMemory.ListIndex <> -1 Then
''''
''''        If frmHexCalculator.opt8bit.Value = True Then
''''            RAM.mWRITE_BYTE lstMemory.ListIndex + startADR, Val("&H" & frmHexCalculator.txtHEX_8bit.Text)
''''        Else
''''            RAM.mWRITE_WORD_i lstMemory.ListIndex + startADR, Val("&H" & frmHexCalculator.txtHEX_16bit.Text)
''''        End If
''''
''''    End If
''''End Sub


'Public Sub mnuStepOver_Click_PUBLIC()
'    mnuStepOver_Click
'End Sub


''' 1.24#278
''Private Sub mnuStepOver_Click()
''On Error GoTo err_StepOver
''
''' decided not to show, to avoid confusions...
''''''    ' #327w-debug-emulation#
''''''    If bKEEP_DEBUG_LOG Then
''''''        frmDebugLog.show_current_command "p"
''''''    End If
''
''
''
''    ' check if it's CALL or INT instrucition:
''
''    ' to insure that PROCEDURE inside other PROCEDURE will
''    ' be skipped over make counter of CALLS, and wait the
''    ' same number of RETS before stopping.
''    ' (interrupt is also procedure).
''
''
''    '#1167 seems like comments with "**--" are outdated.
''
''
''    ' -===== these will start the "step over" and
''    '                      increase the counter on every processing:
''    ' thouse marked with "**--" are not supported because
''    ' of the way this command is encoded (should check second byte also),
''    ' maybe will do this later.
''    '9A cd       CALL cd        Call far segment, immediate 4-byte address
''    'E8 cw       CALL cw        Call near, offset relative to next instruction
''    ' **--  FF /3       CALL ed        Call far segment, address at EA doubleword
''    ' **-- FF /2       CALL ew        Call near, offset absolute at EA word
''    'CC          INT 3          Interrupt 3 (trap to debugger) (far call, with flags
''    'CD ib       INT ib         Interrupt numbered by immediate byte     pushed first)
''    'CE          INTO           Interrupt 4 if overflow flag is 1
''    ' -======= these will decrease the counter
''    '                       and stop the "running" when counter=0:
''    'CF          IRET           Interrupt return (far return and pop flags)
''    'CB          RETF           Return to far caller (pop offset, then seg)
''    'C3          RET            Return to near caller (pop offset only)
''    'CA iw       RETF iw        RET (far), pop offset, seg, iw bytes
''    'C2 iw       RET iw         RET (near), pop offset, iw bytes pushed before Call
''
''    Dim curCSIP As Long
''    Dim u1 As Byte
''
''    curCSIP = to_unsigned_long(CS) * 16 + to_unsigned_long(IP)
''    u1 = RAM.mREAD_BYTE(curCSIP)
''
''    Select Case u1
''    Case &H9A, &HE8, &HCC, &HCD, &HCE
''
''        bDO_STEP_OVER_PROCEDURE = True
''        lCOUNTER_ENTER_PROCEDURE = 0
''
''        chkAutoStep.Value = vbChecked ' run!!!
''
''        Exit Sub
''    End Select
''
''
''
''
''
''
''    ' gets here only
''    ' if it's not CALL, or INT instruction, then do this way:
''    ' good for macros:
''
''    If sDEBUGED_file = "" Then ' no way to check for macros.
''         cmdStep_Click  ' just do a step.
''         Exit Sub
''    End If
''
''
''    Dim L As Long
''
''    L = frmOrigCode.cmaxActualSource.HighlightedLine
''
''    If L < 0 Then Exit Sub ' cannot happen.
''
''    lSTOP_AT_LINE_HIGHLIGHT_CHANGE = L
''    bDO_STOP_AT_LINE_HIGHLIGHT_CHANGE = True
''    chkAutoStep.Value = vbChecked ' run!!!
''
''' not required for macro, and not good for some procedures also.
''''''    l = l + 1
''''''
''''''    Do While l <= UBound(L2LC)
''''''        If L2LC(l).ByteFirst <> -1 Then
''''''            lSTOP_AT_LINE_HIGHLIGHT = l
''''''            bDO_STOP_AT_LINE_HIGHLIGHT = True
''''''            chkAutoStep.Value = vbChecked ' run!!!
''''''            Exit Sub
''''''        End If
''''''        l = l + 1
''''''    Loop
''''''
''''''    bDO_STOP_AT_LINE_HIGHLIGHT = False
''''''    mBox Me, "Step Over cannot find next executable line in original source"
''
''    Exit Sub
''err_StepOver:
''    Debug.Print "mnuStepOver_Click: " & LCase(Err.Description)
''End Sub

'Private Sub mnuStepperMotor_Click()
'' #1144
''    frmDEVICE_StepperMotor.DoShowMe
''    frmDEVICE_StepperMotor.update_DEVICE
'End Sub

'Private Sub mnuTrafficLights_Click()
'' #1144
''''    frmDEVICE_TrafficLights.DoShowMe
''''    frmDEVICE_TrafficLights.update_DEVICE
'End Sub



' 1.11 (1.12)
Private Sub mnuWriteBootRecord_FLOPPY_X_Click(Index As Integer)
On Error Resume Next ' 4.00-Beta-3
    If MsgBox(cMT("overwrite any previous boot sector of:") & " FLOPPY_" & CStr(Index) & "?", vbYesNo + vbDefaultButton2, cMT("overwrite?")) = vbYes Then
    
        frmEmulation.bSET_CF_ON_IRET = False  ' 1.23 important!
        mDisk.write_sectors 1, 0, 1, 0, CByte(Index), &H7C00, False
        
        If frmEmulation.bSET_CF_ON_IRET Then
            mBox Me, cMT("virtual boot sector write error!")
        End If
        
    End If
End Sub

' 1.15
'''' 1.06
'''Private Sub txtDisStartAddress_GotFocus()
'''
'''    txtDisStartAddress.Text = make_min_len(Hex(to_unsigned_long(CS) * 16 + to_unsigned_long(IP)), 4, "0")
'''
'''    With txtDisStartAddress
'''        .SelStart = 0
'''        .SelLength = Len(.Text)
'''    End With
'''End Sub

' 1.06
'''Private Sub cmdDisassemble_Click()
'''On Error GoTo err_cmdc
'''
'''    Dim lT As Long
'''    Dim s As String
'''
'''    ' 1.15
'''    Dim lSEGMENT As Long
'''    Dim lOffset As Long
'''
'''' 1.15
'''''''    ' 1.10
'''''''    ' support segment input:
'''''''    If InStr(1, txtDisStartAddress.Text, ":", vbTextCompare) > 0 Then
'''''''        s = getToken(txtDisStartAddress.Text, 0, ":")
'''''''        lT = HexToLong(s & "0") ' * 16
'''''''        s = getToken(txtDisStartAddress.Text, 1, ":")
'''''''        lT = lT + HexToLong(s)
'''''''    Else
'''''''        lT = HexToLong(txtDisStartAddress.Text)
'''''''    End If
'''
'''    ' 1.15
'''    lSEGMENT = to_unsigned_long(Val("&H" & txtDisSegment.Text))
'''    lOffset = to_unsigned_long(Val("&H" & txtDisOffset.Text))
'''
'''    ' 1.15
'''    ' two text boxes are used, one for segment, another for offset:
'''    lT = lSEGMENT * &H10 + lOffset
'''
'''
'''    DoDisassembling lT, True, lSEGMENT, lOffset
'''
'''' #
'''' 1.25 I'm not sure it's required,
'''' I even think it makes problems when viewing memory:
''''   lT = to_unsigned_long(CS) * 16 + to_unsigned_long(IP)
'''
'''    ' select only in case code at this address is disassembled (and thus is visible):
'''    If (lT >= (lStartDisAddress + dis_recLocCounter(0))) Then
'''      If (lT <= (lStartDisAddress + dis_recLocCounter(dis_iLineCounter - 1))) Then
'''        selectDisassembledLine lT
'''      End If
'''    End If
'''
'''Exit Sub
'''err_cmdc:
'''    Debug.Print "cmdDisassemble_Click() " & LCase(err.Description)
'''End Sub
'''
'''



' 1.20 - updated!!!
''''Private Sub selectDisassembledLine()
''''
''''On Error GoTo err_sel
''''    Dim i As Long
''''    Dim lCurAdr As Long
''''
''''    ' 1.07 (avoid error in case not disassembled yet):
''''    If lstDECODED.ListCount = 0 Then Exit Sub
''''
''''    lCurAdr = to_unsigned_long(CS) * 16 + to_unsigned_long(IP)
''''
''''    ' check in case code at this address isn't disassembled (and
''''    ' thus not visible):
''''    If (lCurAdr < (dis_lastStartAddress + dis_recLocCounter(0))) _
''''      Or (lCurAdr > (dis_lastStartAddress + dis_recLocCounter(dis_iLineCounter - 1))) Then
''''        DoDisassembling lCurAdr
''''    End If
''''
''''    ' select a line that corresponds to lCurAdr:
''''    For i = 0 To dis_iLineCounter - 1
''''        If lCurAdr = (dis_lastStartAddress + dis_recLocCounter(i)) Then
''''            lstDECODED.ListIndex = i
''''            Exit Sub
''''        End If
''''    Next i
''''
''''    Exit Sub
''''err_sel:
''''    Debug.Print "Error on selectDisassembledLine() " & LCase(err.Description)
''''End Sub

' #400-dissasembly#  no need these whistles.
'''''' 1.28#365
'''''Private Sub lstDECODED_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'''''    If Button = vbLeftButton Then
'''''        If iLast_MOUSE_DOWN_ON_DIS_LIST <> lstDECODED.ListIndex Then
'''''            lstDECODED_MouseDown Button, Shift, X, Y
'''''        End If
'''''    End If
'''''End Sub
'''''
'''''' 1.06
'''''' 1.07 (fixed)
'''''' select a memory location of current disassembeled command:
'''''Private Sub lstDECODED_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'''''On Error GoTo err_md
'''''
'''''    Dim lT As Long
'''''
'''''    lT = lStartDisAddress + dis_recLocCounter(lstDECODED.ListIndex)
'''''
'''''    Dim lT2 As Long '4.00
'''''    lT2 = lStartDisAddress + dis_recLocCounter(lstDECODED.ListIndex + 1) - 1
'''''
'''''    ' 1.28#365
'''''    iLast_MOUSE_DOWN_ON_DIS_LIST = lstDECODED.ListIndex
'''''
'''''    ' in case memory list isn't at the right position, make it be there:
'''''    selectMemoryLine_YELLOW lT, lT2, True
'''''
'''''
'''''    ' 1.16
'''''    selectSourceLineAtLocation lT - lPROG_LOADED_AT_ADR, False
'''''
'''''Exit Sub
'''''err_md:
'''''    Debug.Print "Error: lstDECODED_MouseDown() " & LCase(err.Description)
'''''End Sub

' 1.06
' #400-dissasembly#
'''''Private Sub set_lstDECODED(ByRef recBuf() As Byte)
'''''    Dim i As Long
'''''    Dim buf As String
'''''    Dim b As Byte
'''''
'''''    ' 1.31#441:
'''''    ' preventing flickering:
'''''    Dim iListItem As Integer
'''''
'''''
'''''    ' 1.31#441 lstDECODED.Clear
'''''    iListItem = 0
'''''
'''''
'''''    buf = ""
'''''    i = 0
'''''
'''''    Do While recBuf(i) <> 0
'''''
'''''        b = recBuf(i)
'''''
'''''        If b = 10 Then
'''''            ' 1.31#441 lstDECODED.AddItem buf
'''''            If lstDECODED.List(iListItem) <> buf Then
'''''                buf = fix_327xo_dis_fix(buf)
'''''                lstDECODED.List(iListItem) = buf
'''''            End If
'''''
'''''            iListItem = iListItem + 1
'''''
'''''            buf = ""
'''''        ElseIf b = 13 Then
'''''            ' just skip it (it doesn't seem to appear anyway).
'''''        Else
'''''            buf = buf & Chr(b)
'''''        End If
'''''
'''''        i = i + 1
'''''
'''''    Loop
'''''
'''''    ' 1.31#441
'''''    ' remove unused items:
'''''    Do While iListItem < lstDECODED.ListCount
'''''          lstDECODED.RemoveItem (lstDECODED.ListCount - 1) ' remove last item.
'''''    Loop
'''''
'''''    '    Debug.Print "REC BUF SIZE: " & i
'''''End Sub

' 1.06
Private Sub printBuffer(ByRef recBuf() As Byte)

On Error GoTo err1

    Dim i As Long
    Dim s As String
    
    s = ""
    i = 0
    
    Do While recBuf(i) <> 0
        s = s & Chr(recBuf(i))
        i = i + 1
    Loop
    
    Debug.Print s
    
    Debug.Print "disassembled string size: " & Len(s)
    
    Exit Sub
err1:
    Debug.Print "ERR:##1278 : " & Err.Description
End Sub

' 1.27
Private Function ask_TO_RELOAD() As Boolean ' #1095f convertion to function.
On Error GoTo err1

    ' 4.00
    If Trim(sOpenedExecutable) = "" Then
        GoTo no_need_to_ask
    End If



    If MsgBox(cMT("program terminated. reload:") & vbNewLine & "  " & sOpenedExecutable & " ?", vbYesNo) = vbYes Then
       
        loadFILEtoEMULATE sOpenedExecutable
            
        ask_TO_RELOAD = True ' RETURN
    
        bSTOP_frmDEBUGLOG = True
   
       ' If bKEEP_DEBUG_LOG Then frmDebugLog.DoShowMe ' v 3.27xb
   
    Else
no_need_to_ask:
        bTERMINATED = False
        
        bRUN_AFTER_RELOAD = False
        
        ask_TO_RELOAD = False ' RETURN
        
    End If
    
    Exit Function
err1:
    Debug.Print "ERR:### : " & Err.Description
    On Error Resume Next
End Function

Private Sub PROCESS_SINGLE_STEP()

On Error GoTo err1 ' 29.10.2003



''''     ' #327xl-softpass#
''''    If Not bSOFTWARE_PASSPORT Then ' seems to be a bit the same as regnow
''''        If Not bREGISTERED Then
''''            '4.07m If Not bFOR_REGNOW Then
''''                If Not bRUN_FREE_FOR_N_DAYS Then
''''                    If beStepCounter >= MAX_STEPS_AFTER_TRIAL_EXPIRED Then
''''                        ' 2.51#713
''''                        ' 2.51#715
''''                        ' no nags for samples
''''                        If bAlwaysNAG = False Then
''''                            ' 2007-07-27 the examples no longer work when unregistered,
''''                            '            but preveoulsy they did, because of #327xo-allow-change#
''''                            '            Decided not to fix it!
''''                            If frmMain.txtInput.Modified = False And frmMain.sOpenedFile = "" Then
''''                                beStepCounter = 0
''''                                GoTo NO_NAG
''''                            End If
''''                        End If
''''                       ' no no no ' no more reset ' beStepCounter = 0
''''                        stopAutoStep
''''                        frmSORRY_2_INTERRUPT.Show , Me
''''                        frmSORRY_2_INTERRUPT.Left = Me.Left ' #1102b
''''                        frmSORRY_2_INTERRUPT.Top = Me.Top ' #1102b
''''                        beStepCounter = 0 ' #1099
''''                    Else
''''                        beStepCounter = beStepCounter + 1
''''                    End If
''''                    Exit Sub ' 2007-06-28
''''                 End If
''''            '4.07m End If
''''        End If
''''    End If
''''NO_NAG: ' 2007-06-28





Reset_registers_highlight ' 2.05#549

    If Not bDO_STEP_OVER_PROCEDURE Then
        If bAllowStepBack Then ' #1095
            startStepRecord
        End If
    End If



    doStep
    
    
    
    'If bLOADING_FILE_TO_EMULATOR Then Exit Sub ' #327s-load-in-input-mode-bug#. must help!
    
    If bSTOP_EVERYTHING Then Exit Sub ' #327s-load-in-input-mode-bug#. this really helps...


    
    
    If bAllowStepBack Then ' #1095
        stopStepRecord
    End If


    
''    If bSTOP_ON_THE_NEXT_STEP Then ' #1073
''
''        ' allow 2 steps!
''
''        If bSTOP_ON_THE_NEXT_STEP_2 Then
''            bSTOP_ON_THE_NEXT_STEP = False
''            bSTOP_ON_THE_NEXT_STEP_2 = False
''            bTERMINATED = True
''            stopAutoStep
''            mBox Me,cmt(sPROGRAM_TERMINATED)
''        Else
''            bSTOP_ON_THE_NEXT_STEP_2 = True
''        End If
''
''    End If

    
    
    
 
    ' 1.21 REQUIRED!
    If bSTOP_EVERYTHING Then Exit Sub
    
    
    show_Registers
    
    


    If b_frmVars_LOADED Then update_VAR_WINDOW ' 1.29#405







    ' 1.20 ---- break point check:
    If break_point_FLAG Then
   
        ' #327xj-major-bp-bug#
        If get_PHYSICAL_ADDR(CS, IP) = lBREAK_POINT_ADDR Then
                mBox Me, cMT("break point encountered at:") & " " & make_min_len(Hex(lBREAK_POINT_ADDR), 5, "0") & "h"
                stopAutoStep
        End If
    End If
    
    
    
    
    
    ' 1.23 ----- run until selected:
    If bRun_UNTIL_SELECTED Then
        If get_PHYSICAL_ADDR(CS, IP) = lRUN_UNTIL_SELECTED Then
                stopAutoStep
                bRun_UNTIL_SELECTED = False ' 1.23 required to stop!
        End If
    End If
    
    
    
    
    
    ' #327xk-stop-on-condition#
    If b_LOADED_frmStopOnCondition Then
       frmStopOnCondition.checkCondition
    End If
    
    
    ' 2007-06-28 "nag-check" moved from here to top.
    
    
'    ' #327w-debug-emulation#
'    If Not bDO_STEP_OVER_PROCEDURE Then
'        If bKEEP_DEBUG_LOG Then
'            frmDebugLog.do_R_Command
'        End If
'    End If


    ' #400b5-sb-4e-4f#
    If b_LOADED_frmMemory Then
        ' Now when I should 128 bytes only it shouldn't be that slow even for the list
        frmMemory.Update_List_or_Table
    End If
    
    
    
    
    
    

    
    
    Exit Sub
    
err1:
    Debug.Print "error on PROCESS_SINGLE_STEP: " & LCase(Err.Description)
    
End Sub



' stores a value from to EA address (bROW):
' (most of the code is identical to get_WORD_at_EA())
Public Sub store_BYTE_at_EA(ByRef bROW As Byte, ByRef bValue As Byte)
    
On Error GoTo err1
    
    Dim iMEM_OFFSET As Integer ' 1.20
    Dim lMEM_Physical_ADR As Long
    Dim tb1 As Byte
    Dim tb2 As Byte
    Dim d16 As Integer ' 1.20 '' As Long     ' used as UNSIGNED INT.

    Select Case bROW

    ' [BX + SI]
    Case 0
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI]"
        
    ' [BX + DI]
    Case 1
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI]"
    
    ' [BP + SI]
    Case 2
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI]"
    
    ' [BP + DI]
    Case 3
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI]"
    
    ' [SI]
    Case 4
        iMEM_OFFSET = SI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI]"
    
    ' [DI]
    Case 5
        iMEM_OFFSET = DI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI]"
    
    ' d16 (simple var)
    Case 6
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = to16bit_SIGNED(tb1, tb2)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[" & toHexForm(lMEM_POINTER) & "]"
    
    ' [BX]
    Case 7
        iMEM_OFFSET = to16bit_SIGNED(BL, BH)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX]"
    
    ' [BX + SI] + d8
    Case 8
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI] + " & toHexForm(tb1)
    
    ' [BX + DI] + d8
    Case 9
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI] + " & toHexForm(tb1)
    
    ' [BP + SI] + d8
    Case 10
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI] + " & toHexForm(tb1)
    
    ' [BP + DI] + d8
    Case 11
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI] + " & toHexForm(tb1)
    
    ' [SI] + d8
    Case 12
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(SI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI] + " & toHexForm(tb1)
    
    ' [DI] + d8
    Case 13
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(DI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI] + " & toHexForm(tb1)
    
    ' [BP] + d8
    Case 14
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP] + " & toHexForm(tb1)
        
    ' [BX] + d8
    Case 15
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX] + " & toHexForm(tb1)
    
    ' [BX + SI] + d16
    Case 16
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI] + " & toHexForm(d16)
    
    ' [BX + DI] + d16
    Case 17
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI] + " & toHexForm(d16)
    
    ' [BP + SI] + d16
    Case 18
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI] + " & toHexForm(d16)
    
    ' [BP + DI] + d16
    Case 19
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI] + " & toHexForm(d16)
    
    ' [SI] + d16
    Case 20
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(SI, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI] + " & toHexForm(d16)
    
    ' [DI] + d16
    Case 21
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(DI, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI] + " & toHexForm(d16)
    
    ' [BP] + d16
    Case 22
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP] + " & toHexForm(d16)
    
    ' [BX] + d16
    Case 23
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX] + " & toHexForm(d16)
    
    ' ew=AX   eb=AL
    Case 24
        AL = bValue
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "AL"
        Exit Sub
        
    ' ew=CX   eb=CL
    Case 25
        CL = bValue
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "CL"
        Exit Sub
    
    ' ew=DX   eb=DL
    Case 26
        DL = bValue
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DL"
        Exit Sub
    
    ' ew=BX   eb=BL
    Case 27
        BL = bValue
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BL"
        Exit Sub
    
    ' ew=SP   eb=AH
    Case 28
        AH = bValue
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "AH"
        Exit Sub
    
    ' ew=BP   eb=CH
    Case 29
        CH = bValue
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "CH"
        Exit Sub
    
    ' ew=SI   eb=DH
    Case 30
        DH = bValue
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DH"
        Exit Sub
    
    ' ew=DI   eb=BH
    Case 31
        BH = bValue
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BH"
        Exit Sub
    
    Case Else
        Debug.Print "ERROR CALLING store_BYTE_at_EA(" & bROW & ")"
    End Select
    
    '=========================================================
    ' GETS HERE only when getting MEMORY BYTE not REGISTER!!!!
    '=========================================================
    
    '\\\\\\\\\\ calculate according to Segment prefix
    lMEM_Physical_ADR = to_unsigned_long(iMEM_OFFSET) + get_SEGMENT_LOCATION(bROW)
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    If (lMEM_Physical_ADR <= MAX_MEMORY) Then
        RAM.mWRITE_BYTE lMEM_Physical_ADR, bValue
    Else
        Debug.Print "ERROR CALLING store_BYTE_at_EA(" & bROW & ")" & "   address is out of available memory!"
    End If
    
    Exit Sub
err1:
    Debug.Print "ERR:##135 : " & Err.Description
        
End Sub

' stores a value from to EA address (bROW):
' (most of the code is identical to get_WORD_at_EA())
' NO PARAMETER because size of command may vary!
Public Sub store_FOLLOWING_BYTE_at_EA(ByRef bROW As Byte)
    
On Error GoTo err1
    
    Dim iMEM_OFFSET As Integer ' 1.20
    Dim lMEM_Physical_ADR As Long
    Dim tb1 As Byte
    Dim tb2 As Byte
    Dim d16 As Integer ' As Long     ' used as UNSIGNED INT.

    Select Case bROW

    ' [BX + SI]
    Case 0
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI]"
        
    ' [BX + DI]
    Case 1
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI]"
    
    ' [BP + SI]
    Case 2
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI]"
    
    ' [BP + DI]
    Case 3
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI]"
    
    ' [SI]
    Case 4
        iMEM_OFFSET = SI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI]"
    
    ' [DI]
    Case 5
        iMEM_OFFSET = DI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI]"
    
    ' d16 (simple var)
    Case 6
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = to16bit_SIGNED(tb1, tb2)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[" & toHexForm(iMEM_OFFSET) & "]"
    
    ' [BX]
    Case 7
        iMEM_OFFSET = to16bit_SIGNED(BL, BH)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX]"
    
    ' [BX + SI] + d8
    Case 8
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI] + " & toHexForm(tb1)
    
    ' [BX + DI] + d8
    Case 9
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI] + " & toHexForm(tb1)
    
    ' [BP + SI] + d8
    Case 10
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI] + " & toHexForm(tb1)
    
    ' [BP + DI] + d8
    Case 11
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI] + " & toHexForm(tb1)
    
    ' [SI] + d8
    Case 12
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(SI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI] + " & toHexForm(tb1)
    
    ' [DI] + d8
    Case 13
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(DI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI] + " & toHexForm(tb1)
    
    ' [BP] + d8
    Case 14
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP] + " & toHexForm(tb1)
        
    ' [BX] + d8
    Case 15
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX] + " & toHexForm(tb1)
    
    ' [BX + SI] + d16
    Case 16
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI] + " & toHexForm(d16)
    
    ' [BX + DI] + d16
    Case 17
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI] + " & toHexForm(d16)
    
    ' [BP + SI] + d16
    Case 18
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI] + " & toHexForm(d16)
    
    ' [BP + DI] + d16
    Case 19
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI] + " & toHexForm(d16)
    
    ' [SI] + d16
    Case 20
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(SI, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI] + " & toHexForm(d16)
    
    ' [DI] + d16
    Case 21
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        ' 1.08 bug#27 iMEM_OFFSET = mathAdd_WORDS(SI, d16)
        iMEM_OFFSET = mathAdd_WORDS(DI, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI] + " & toHexForm(d16)
    
    ' [BP] + d16
    Case 22
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP] + " & toHexForm(d16)
    
    ' [BX] + d16
    Case 23
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX] + " & toHexForm(d16)
    
    ' ew=AX   eb=AL
    Case 24
        curByte = curByte + 1
        AL = RAM.mREAD_BYTE(curByte)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "AL, " & toHexForm(AL)
        Exit Sub

    ' ew=CX   eb=CL
    Case 25
        curByte = curByte + 1
        CL = RAM.mREAD_BYTE(curByte)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "CL, " & toHexForm(CL)
        Exit Sub
    
    ' ew=DX   eb=DL
    Case 26
        curByte = curByte + 1
        DL = RAM.mREAD_BYTE(curByte)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DL, " & toHexForm(DL)
        Exit Sub
    
    ' ew=BX   eb=BL
    Case 27
        curByte = curByte + 1
        BL = RAM.mREAD_BYTE(curByte)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BL, " & toHexForm(BL)
        Exit Sub
    
    ' ew=SP   eb=AH
    Case 28
        curByte = curByte + 1
        AH = RAM.mREAD_BYTE(curByte)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "AH, " & toHexForm(AH)
        Exit Sub
    
    ' ew=BP   eb=CH
    Case 29
        curByte = curByte + 1
        CH = RAM.mREAD_BYTE(curByte)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "CH, " & toHexForm(CH)
        Exit Sub
    
    ' ew=SI   eb=DH
    Case 30
        curByte = curByte + 1
        DH = RAM.mREAD_BYTE(curByte)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DH, " & toHexForm(DH)
        Exit Sub
    
    ' ew=DI   eb=BH
    Case 31
        curByte = curByte + 1
        BH = RAM.mREAD_BYTE(curByte)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BH, " & toHexForm(BH)
        Exit Sub
    
    Case Else
        Debug.Print "ERROR CALLING store_FOLLOWING_BYTE_at_EA(" & bROW & ")"
    End Select
    
    '=========================================================
    ' GETS HERE only when getting MEMORY BYTE not REGISTER!!!!
    '=========================================================
    
    '\\\\\\\\\\ calculate according to Segment prefix
    lMEM_Physical_ADR = to_unsigned_long(iMEM_OFFSET) + get_SEGMENT_LOCATION(bROW)
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    If (lMEM_Physical_ADR <= MAX_MEMORY) Then
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        RAM.mWRITE_BYTE lMEM_Physical_ADR, tb1
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & toHexForm(tb1)
    Else
        Debug.Print "ERROR CALLING store_FOLLOWING_BYTE_at_EA(" & bROW & ")" & "   address is out of available memory!"
    End If
    
    
    
    Exit Sub
err1:
    Debug.Print "ERR:##7791 : " & Err.Description
        
End Sub

' stores a value from to EA address (bROW):
' bVALUE_lb & bVALUE_hb represent an WORD (16 bit)
' (most of the code is identical to get_WORD_at_EA())
Public Sub store_WORD_at_EA(ByRef bROW As Byte, ByRef bVALUE_lb As Byte, ByRef bVALUE_hb As Byte)

On Error GoTo err1

    Dim iMEM_OFFSET As Integer ' 1.20
    Dim lMEM_Physical_ADR As Long
    Dim tb1 As Byte
    Dim tb2 As Byte
    Dim d16 As Integer '1.20 As Long     ' used as UNSIGNED INT.

    Select Case bROW

    ' [BX + SI]
    Case 0
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI]"

    ' [BX + DI]
    Case 1
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI]"
    
    ' [BP + SI]
    Case 2
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI]"
    
    ' [BP + DI]
    Case 3
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI]"
    
    ' [SI]
    Case 4
        iMEM_OFFSET = SI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI]"
    
    ' [DI]
    Case 5
        iMEM_OFFSET = DI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI]"
    
    ' d16 (simple var)
    Case 6
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = to16bit_SIGNED(tb1, tb2)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[" & toHexForm(iMEM_OFFSET) & "]"
    
    ' [BX]
    Case 7
        iMEM_OFFSET = to16bit_SIGNED(BL, BH)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX]"
    
    ' [BX + SI] + d8
    Case 8
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI] + " & toHexForm(tb1)
    
    ' [BX + DI] + d8
    Case 9
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI] + " & toHexForm(tb1)
    
    ' [BP + SI] + d8
    Case 10
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI] + " & toHexForm(tb1)
    
    ' [BP + DI] + d8
    Case 11
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI] + " & toHexForm(tb1)
    
    ' [SI] + d8
    Case 12
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(SI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI] + " & toHexForm(tb1)
    
    ' [DI] + d8
    Case 13
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(DI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI] + " & toHexForm(tb1)
    
    ' [BP] + d8
    Case 14
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP] + " & toHexForm(tb1)
        
    ' [BX] + d8
    Case 15
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX] + " & toHexForm(tb1)
    
    ' [BX + SI] + d16
    Case 16
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI] + " & toHexForm(d16)
    
    ' [BX + DI] + d16
    Case 17
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI] + " & toHexForm(d16)
    
    ' [BP + SI] + d16
    Case 18
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI] + " & toHexForm(d16)
    
    ' [BP + DI] + d16
    Case 19
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI] + " & toHexForm(d16)
    
    ' [SI] + d16
    Case 20
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(SI, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI] + " & toHexForm(d16)
    
    ' [DI] + d16
    Case 21
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        ' 1.08 bug#27 iMEM_OFFSET = mathAdd_WORDS(SI, d16, False)
        iMEM_OFFSET = mathAdd_WORDS(DI, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI] + " & toHexForm(d16)
    
    ' [BP] + d16
    Case 22
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP] + " & toHexForm(d16)
    
    ' [BX] + d16
    Case 23
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX] + " & toHexForm(d16)
    
    ' ew=AX   eb=AL
    Case 24
        AL = bVALUE_lb
        AH = bVALUE_hb
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "AX"
        Exit Sub
        
    ' ew=CX   eb=CL
    Case 25
        CL = bVALUE_lb
        CH = bVALUE_hb
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "CX"
        Exit Sub
    
    ' ew=DX   eb=DL
    Case 26
        DL = bVALUE_lb
        DH = bVALUE_hb
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DX"
        Exit Sub
    
    ' ew=BX   eb=BL
    Case 27
        BL = bVALUE_lb
        BH = bVALUE_hb
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BX"
        Exit Sub
    
    ' ew=SP   eb=AH
    Case 28
        SP = to16bit_SIGNED(bVALUE_lb, bVALUE_hb)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "SP, " & toHexForm(to16bit_UNS(bVALUE_lb, bVALUE_hb))
        Exit Sub
    
    ' ew=BP   eb=CH
    Case 29
        BP = to16bit_SIGNED(bVALUE_lb, bVALUE_hb)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BP, " & toHexForm(to16bit_UNS(bVALUE_lb, bVALUE_hb))
        Exit Sub
    
    ' ew=SI   eb=DH
    Case 30
        SI = to16bit_SIGNED(bVALUE_lb, bVALUE_hb)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "SI, " & toHexForm(to16bit_UNS(bVALUE_lb, bVALUE_hb))
        Exit Sub
    
    ' ew=DI   eb=BH
    Case 31
        DI = to16bit_SIGNED(bVALUE_lb, bVALUE_hb)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DI, " & toHexForm(to16bit_UNS(bVALUE_lb, bVALUE_hb))
        Exit Sub
    
    Case Else
        Debug.Print "ERROR CALLING store_WORD_at_EA(" & bROW & ")"
    End Select
    
    '=========================================================
    ' GETS HERE only when getting MEMORY WORD not REGISTER!!!!
    '=========================================================
    
    '\\\\\\\\\\ calculate according to Segment prefix
    lMEM_Physical_ADR = to_unsigned_long(iMEM_OFFSET) + get_SEGMENT_LOCATION(bROW)
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    If (lMEM_Physical_ADR <= MAX_MEMORY) Then
        RAM.mWRITE_BYTE lMEM_Physical_ADR, bVALUE_lb
        RAM.mWRITE_BYTE lMEM_Physical_ADR + 1, bVALUE_hb
    Else
        Debug.Print "ERROR CALLING store_WORD_at_EA(" & bROW & ")" & "   address is out of available memory!"
    End If
    
    Exit Sub
err1:
    Debug.Print "ERR:##9912 : " & Err.Description
        
End Sub




' stores a value from to EA address (bROW):
' (most of the code is identical to get_WORD_at_EA())
' NO PARAMETERS!
' the WORD value that should be written into the memory is
' located just after the EA indificator (its size may be different
' because of added contants such as [BX+5]).
Public Sub store_FOLLOWING_WORD_at_EA(ByRef bROW As Byte)
    
On Error GoTo err1
    
    Dim iMEM_OFFSET As Integer ' 1.20
    Dim lMEM_Physical_ADR As Long
    Dim tb1 As Byte
    Dim tb2 As Byte
    Dim d16 As Integer  ' 1.20 - As Long     ' used as UNSIGNED INT.

    Select Case bROW

    ' [BX + SI]
    Case 0
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI]"
        
    ' [BX + DI]
    Case 1
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI]"
    
    ' [BP + SI]
    Case 2
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI]"
    
    ' [BP + DI]
    Case 3
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI]"
    
    ' [SI]
    Case 4
        iMEM_OFFSET = SI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI]"
    
    ' [DI]
    Case 5
        iMEM_OFFSET = DI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI]"
    
    ' d16 (simple var)
    Case 6
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = to16bit_SIGNED(tb1, tb2)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[" & toHexForm(iMEM_OFFSET) & "]"
    
    ' [BX]
    Case 7
        iMEM_OFFSET = to16bit_SIGNED(BL, BH)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX]"
    
    ' [BX + SI] + d8
    Case 8
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI] + " & toHexForm(tb1)
    
    ' [BX + DI] + d8
    Case 9
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI] + " & toHexForm(tb1)
    
    ' [BP + SI] + d8
    Case 10
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI] + " & toHexForm(tb1)
    
    ' [BP + DI] + d8
    Case 11
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI] + " & toHexForm(tb1)
    
    ' [SI] + d8
    Case 12
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(SI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI] + " & toHexForm(tb1)
    
    ' [DI] + d8
    Case 13
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(DI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI] + " & toHexForm(tb1)
    
    ' [BP] + d8
    Case 14
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP] + " & toHexForm(tb1)
        
    ' [BX] + d8
    Case 15
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX] + " & toHexForm(tb1)
    
    ' [BX + SI] + d16
    Case 16
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI] + " & toHexForm(d16)
    
    ' [BX + DI] + d16
    Case 17
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI] + " & toHexForm(d16)
    
    ' [BP + SI] + d16
    Case 18
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI] + " & toHexForm(d16)
    
    ' [BP + DI] + d16
    Case 19
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI] + " & toHexForm(d16)
    
    ' [SI] + d16
    Case 20
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(SI, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI] + " & toHexForm(d16)
    
    ' [DI] + d16
    Case 21
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        ' 1.08 bug#27 iMEM_OFFSET = mathAdd_WORDS(SI, d16)
        iMEM_OFFSET = mathAdd_WORDS(DI, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI] + " & toHexForm(d16)
    
    ' [BP] + d16
    Case 22
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP] + " & toHexForm(d16)
    
    ' [BX] + d16
    Case 23
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX] + " & toHexForm(d16)
    
    ' ew=AX   eb=AL
    Case 24
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        AL = tb1
        AH = tb2
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "AX, " & toHexForm(to16bit_UNS(tb1, tb2))
        Exit Sub
        
    ' ew=CX   eb=CL
    Case 25
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        CL = tb1
        CH = tb2
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "CX, " & toHexForm(to16bit_UNS(tb1, tb2))
        Exit Sub
    
    ' ew=DX   eb=DL
    Case 26
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        DL = tb1
        DH = tb2
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DX, " & toHexForm(to16bit_UNS(tb1, tb2))
        Exit Sub
    
    ' ew=BX   eb=BL
    Case 27
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        BL = tb1
        BH = tb2
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BX, " & toHexForm(to16bit_UNS(tb1, tb2))
        Exit Sub
    
    ' ew=SP   eb=AH
    Case 28
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        SP = to16bit_SIGNED(tb1, tb2)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "SP, " & toHexForm(to16bit_UNS(tb1, tb2))
        Exit Sub
    
    ' ew=BP   eb=CH
    Case 29
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        BP = to16bit_SIGNED(tb1, tb2)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BP, " & toHexForm(to16bit_UNS(tb1, tb2))
        Exit Sub
    
    ' ew=SI   eb=DH
    Case 30
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        SI = to16bit_SIGNED(tb1, tb2)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "SI, " & toHexForm(to16bit_UNS(tb1, tb2))
        Exit Sub
    
    ' ew=DI   eb=BH
    Case 31
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        DI = to16bit_SIGNED(tb1, tb2)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DI, " & toHexForm(to16bit_UNS(tb1, tb2))
        Exit Sub
    
    Case Else
        Debug.Print "ERROR CALLING store_FOLLOWING_WORD_at_EA(" & bROW & ")"
    End Select
    
    '=========================================================
    ' GETS HERE only when getting MEMORY WORD not REGISTER!!!!
    '=========================================================
    
    '\\\\\\\\\\ calculate according to Segment prefix
    lMEM_Physical_ADR = to_unsigned_long(iMEM_OFFSET) + get_SEGMENT_LOCATION(bROW)
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    If (lMEM_Physical_ADR <= MAX_MEMORY) Then
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        RAM.mWRITE_BYTE lMEM_Physical_ADR, tb1
        RAM.mWRITE_BYTE lMEM_Physical_ADR + 1, tb2
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & ", " & toHexForm(to16bit_UNS(tb1, tb2))
    Else
        Debug.Print "ERROR CALLING store_FOLLOWING_WORD_at_EA(" & bROW & ")" & "   address is out of available memory!"
    End If
    
    
    Exit Sub
err1:
    Debug.Print "ERR:##9011 : " & Err.Description
        
End Sub

' returns a value from memory at bROW EA:
Public Function get_BYTE_at_EA(ByRef bROW As Byte) As Byte
    
On Error GoTo err1

    Dim iMEM_OFFSET As Integer ' 1.20
    Dim lMEM_Physical_ADR As Long
    
    Dim tb1 As Byte
    Dim tb2 As Byte
    Dim d16 As Integer  ' 1.20 As Long     ' used as UNSIGNED INT.

    Select Case bROW

    ' [BX + SI]
    Case 0
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI]"
        
    ' [BX + DI]
    Case 1
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI]"
    
    ' [BP + SI]
    Case 2
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI]"
    
    ' [BP + DI]
    Case 3
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI]"
    
    ' [SI]
    Case 4
        iMEM_OFFSET = SI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI]"
    
    ' [DI]
    Case 5
        iMEM_OFFSET = DI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI]"
    
    ' d16 (simple var)
    Case 6
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = to16bit_SIGNED(tb1, tb2)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[" & toHexForm(iMEM_OFFSET) & "]"
    
    ' [BX]
    Case 7
        iMEM_OFFSET = to16bit_SIGNED(BL, BH)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX]"
    
    ' [BX + SI] + d8
    Case 8
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI] + " & toHexForm(tb1)
    
    ' [BX + DI] + d8
    Case 9
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI] + " & toHexForm(tb1)
    
    ' [BP + SI] + d8
    Case 10
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI] + " & toHexForm(tb1)
    
    ' [BP + DI] + d8
    Case 11
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI] + " & toHexForm(tb1)
    
    ' [SI] + d8
    Case 12
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(SI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI] + " & toHexForm(tb1)
    
    ' [DI] + d8
    Case 13
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(DI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI] + " & toHexForm(tb1)
    
    ' [BP] + d8
    Case 14
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP] + " & toHexForm(tb1)
        
    ' [BX] + d8
    Case 15
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX] + " & toHexForm(tb1)
    
    ' [BX + SI] + d16
    Case 16
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI] + " & toHexForm(d16)
    
    ' [BX + DI] + d16
    Case 17
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI] + " & toHexForm(d16)
    
    ' [BP + SI] + d16
    Case 18
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI] + " & toHexForm(d16)
    
    ' [BP + DI] + d16
    Case 19
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI] + " & toHexForm(d16)
    
    ' [SI] + d16
    Case 20
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(SI, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI] + " & toHexForm(d16)
    
    ' [DI] + d16
    Case 21
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(DI, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI] + " & toHexForm(d16)
    
    ' [BP] + d16
    Case 22
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP] + " & toHexForm(d16)
    
    ' [BX] + d16
    Case 23
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX] + " & toHexForm(d16)
    
    ' ew=AX   eb=AL
    Case 24
        get_BYTE_at_EA = AL
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "AL"
        Exit Function
        
    ' ew=CX   eb=CL
    Case 25
        get_BYTE_at_EA = CL
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "CL"
        Exit Function
    
    ' ew=DX   eb=DL
    Case 26
        get_BYTE_at_EA = DL
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DL"
        Exit Function
    
    ' ew=BX   eb=BL
    Case 27
        get_BYTE_at_EA = BL
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BL"
        Exit Function
    
    ' ew=SP   eb=AH
    Case 28
        get_BYTE_at_EA = AH
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "AH"
        Exit Function
    
    ' ew=BP   eb=CH
    Case 29
        get_BYTE_at_EA = CH
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "CH"
        Exit Function
    
    ' ew=SI   eb=DH
    Case 30
        get_BYTE_at_EA = DH
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DH"
        Exit Function
    
    ' ew=DI   eb=BH
    Case 31
        get_BYTE_at_EA = BH
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BH"
        Exit Function
    
    Case Else
        Debug.Print "ERROR CALLING get_BYTE_at_EA(" & bROW & ")"
    End Select
    
    '=========================================================
    ' GETS HERE only when getting MEMORY BYTE not REGISTER!!!!
    '=========================================================
    
    '\\\\\\\\\\ calculate according to Segment prefix
    lMEM_Physical_ADR = to_unsigned_long(iMEM_OFFSET) + get_SEGMENT_LOCATION(bROW)
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    If (lMEM_Physical_ADR <= MAX_MEMORY) Then
       get_BYTE_at_EA = RAM.mREAD_BYTE(lMEM_Physical_ADR)
    Else
        Debug.Print "ERROR CALLING get_BYTE_at_EA(" & bROW & ")" & "   address is out of available memory!"
    End If
        
        
    Exit Function
err1:
    Debug.Print "ERR:### : " & Err.Description
        
End Function


' returns a value from memory at bROW EA:
Public Function get_WORD_at_EA(ByRef bROW As Byte) As Integer
    
On Error GoTo err1

    Dim iMEM_OFFSET As Integer ' 1.20
    Dim lMEM_Physical_ADR As Long
    
    Dim tb1 As Byte
    Dim tb2 As Byte
    Dim d16 As Integer 'As Long     ' used as UNSIGNED INT.

    Select Case bROW

    ' [BX + SI]
    Case 0
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI]"
        
    ' [BX + DI]
    Case 1
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI]"
    
    ' [BP + SI]
    Case 2
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI]"
    
    ' [BP + DI]
    Case 3
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI]"
    
    ' [SI]
    Case 4
        '#1038' iMEM_OFFSET = to_unsigned_long(SI)
         iMEM_OFFSET = SI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI]"
    
    ' [DI]
    Case 5
        '#1038' iMEM_OFFSET = to_unsigned_long(di)
        iMEM_OFFSET = DI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI]"
    
    ' d16 (simple var)
    Case 6
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = to16bit_SIGNED(tb1, tb2)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[" & toHexForm(iMEM_OFFSET) & "]"
    
    ' [BX]
    Case 7
        iMEM_OFFSET = to16bit_SIGNED(BL, BH)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX]"
    
    ' [BX + SI] + d8
    Case 8
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI] + " & toHexForm(tb1)
    
    ' [BX + DI] + d8
    Case 9
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI] + " & toHexForm(tb1)
    
    ' [BP + SI] + d8
    Case 10
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI] + " & toHexForm(tb1)
    
    ' [BP + DI] + d8
    Case 11
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI] + " & toHexForm(tb1)
    
    ' [SI] + d8
    Case 12
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(SI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI] + " & toHexForm(tb1)
    
    ' [DI] + d8
    Case 13
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(DI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI] + " & toHexForm(tb1)
    
    ' [BP] + d8
    Case 14
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(BP, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP] + " & toHexForm(tb1)
        
    ' [BX] + d8
    Case 15
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX] + " & toHexForm(tb1)
    
    ' [BX + SI] + d16
    Case 16
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + SI] + " & toHexForm(d16)
    
    ' [BX + DI] + d16
    Case 17
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX + DI] + " & toHexForm(d16)
    
    ' [BP + SI] + d16
    Case 18
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + SI] + " & toHexForm(d16)
    
    ' [BP + DI] + d16
    Case 19
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP + DI] + " & toHexForm(d16)
    
    ' [SI] + d16
    Case 20
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(SI, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[SI] + " & toHexForm(d16)
    
    ' [DI] + d16
    Case 21
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(DI, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[DI] + " & toHexForm(d16)
    
    ' [BP] + d16
    Case 22
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BP] + " & toHexForm(d16)
    
    ' [BX] + d16
    Case 23
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        curByte = curByte + 1
        tb2 = RAM.mREAD_BYTE(curByte)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), d16)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "[BX] + " & toHexForm(d16)
    
    ' ew=AX   eb=AL
    Case 24
        get_WORD_at_EA = to16bit_SIGNED(AL, AH)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "AX"
        Exit Function
        
    ' ew=CX   eb=CL
    Case 25
        get_WORD_at_EA = to16bit_SIGNED(CL, CH)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "CX"
        Exit Function
    
    ' ew=DX   eb=DL
    Case 26
        get_WORD_at_EA = to16bit_SIGNED(DL, DH)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DX"
        Exit Function
    
    ' ew=BX   eb=BL
    Case 27
        get_WORD_at_EA = to16bit_SIGNED(BL, BH)
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BX"
        Exit Function
    
    ' ew=SP   eb=AH
    Case 28
        get_WORD_at_EA = SP
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "SP"
        Exit Function
    
    ' ew=BP   eb=CH
    Case 29
        get_WORD_at_EA = BP
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BP"
        Exit Function
    
    ' ew=SI   eb=DH
    Case 30
        get_WORD_at_EA = SI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "SI"
        Exit Function
    
    ' ew=DI   eb=BH
    Case 31
        get_WORD_at_EA = DI
        '[SDEC_DEBUG_v120] sDECODED = sDECODED & "DI"
        Exit Function
    
    Case Else
        Debug.Print "ERROR CALLING get_word_at_ea(" & bROW & ")"
    End Select
    
    '=========================================================
    ' GETS HERE only when getting MEMORY WORD not REGISTER!!!!
    '=========================================================
    
    '\\\\\\\\\\ calculate according to Segment prefix
    lMEM_Physical_ADR = to_unsigned_long(iMEM_OFFSET) + get_SEGMENT_LOCATION(bROW)
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    
    If (lMEM_Physical_ADR <= MAX_MEMORY) Then
        get_WORD_at_EA = to16bit_SIGNED(RAM.mREAD_BYTE(lMEM_Physical_ADR), RAM.mREAD_BYTE(lMEM_Physical_ADR + 1))
    Else
        Debug.Print "ERROR CALLING get_word_at_ea(" & bROW & ")" & "   address is out of available memory!"
    End If
        
        
    Exit Function
err1:
    Debug.Print "ERR:### : " & Err.Description
        
End Function

' Parameter helps to choose the default segment (SS or DS,
' in case parameter is 55 using ES as default),
' when there is no replacement of a segment register:
Private Function get_SEGMENT_LOCATION(ByRef EA_ROW_IF_ANY As Byte) As Long
    
On Error GoTo err1
    
    Dim lResult As Long
    
    If bSEGMENT_REPLACEMENT Then
        If sSEGMENT_REPLACEMENT_NAME = "ES" Then
            lResult = to_unsigned_long(ES)
        ElseIf sSEGMENT_REPLACEMENT_NAME = "CS" Then
            lResult = to_unsigned_long(CS)
        ElseIf sSEGMENT_REPLACEMENT_NAME = "SS" Then
            lResult = to_unsigned_long(SS)
        ElseIf sSEGMENT_REPLACEMENT_NAME = "DS" Then ' generally it's default, so rarely used.
            lResult = to_unsigned_long(DS)
        Else
            Debug.Print "sSEGMENT_REPLACEMENT_NAME contains invalid value: " & sSEGMENT_REPLACEMENT_NAME
        End If
        
        ' 2005-03-13 "Segment_Override_BUG_2005-03-13" #1011 , do not allow to reset replacement until we end "REP" loop!
        If Not (bDoREP Or bDoREPNE) Then
            bSEGMENT_REPLACEMENT = False ' replacement works only for one command.
        End If
        
    Else
        ' DS is the default prefix (except when where is [BP], then it's SS)!
        ' use SS when BP is present in EA...
        
        If (EA_ROW_IF_ANY = 2) Or (EA_ROW_IF_ANY = 3) _
           Or (EA_ROW_IF_ANY = 10) Or (EA_ROW_IF_ANY = 11) _
           Or (EA_ROW_IF_ANY = 14) _
           Or (EA_ROW_IF_ANY = 18) Or (EA_ROW_IF_ANY = 19) _
           Or (EA_ROW_IF_ANY = 22) Then
            lResult = to_unsigned_long(SS)
        ElseIf (EA_ROW_IF_ANY = 55) Then
            lResult = to_unsigned_long(ES)
        Else
            lResult = to_unsigned_long(DS)
        End If
        
    End If
    
    get_SEGMENT_LOCATION = lResult * 16   ' add last zero (to HEX representaion).
    
    
    Exit Function
err1:
    Debug.Print "ERR:##7# : " & Err.Description
    
End Function

' digit=    0    1    2    3    4    5    6    7
' rb =     AL   CL   DL   BL   AH   CH   DH   BH
Public Function get_BYTE_RegValue(ByRef bRegIndex As Byte) As Byte

On Error GoTo err1

    Select Case bRegIndex
    Case 0
        get_BYTE_RegValue = AL
    Case 1
        get_BYTE_RegValue = CL
    Case 2
        get_BYTE_RegValue = DL
    Case 3
        get_BYTE_RegValue = BL
    Case 4
        get_BYTE_RegValue = AH
    Case 5
        get_BYTE_RegValue = CH
    Case 6
        get_BYTE_RegValue = DH
    Case 7
        get_BYTE_RegValue = BH
    Case Else
        Debug.Print "wrong parameter in get_BYTE_RegValue(" & bRegIndex & ")"
    End Select
    
    Exit Function
err1:
    Debug.Print "ERR:### : " & Err.Description
    
End Function

' digit=    0    1    2    3    4    5    6    7
' rb =     AL   CL   DL   BL   AH   CH   DH   BH
Public Sub store_BYTE_RegValue(ByRef bRegIndex As Byte, ByRef bValue As Byte)

On Error GoTo err1

    Select Case bRegIndex
    Case 0
        AL = bValue
    Case 1
        CL = bValue
    Case 2
        DL = bValue
    Case 3
        BL = bValue
    Case 4
        AH = bValue
    Case 5
        CH = bValue
    Case 6
        DH = bValue
    Case 7
        BH = bValue
    Case Else
        Debug.Print "wrong parameter in store_BYTE_RegValue(" & bRegIndex & ")"
    End Select
    
    
    Exit Sub
err1:
    Debug.Print "ERR:## 441: " & Err.Description
End Sub

' rw =     AX   CX   DX   BX   SP   BP   SI   DI
' digit=    0    1    2    3    4    5    6    7
Public Function get_WORD_RegValue(ByRef bRegIndex As Byte) As Integer

On Error GoTo err1

    Select Case bRegIndex
    Case 0
        get_WORD_RegValue = to16bit_SIGNED(AL, AH)
    Case 1
        get_WORD_RegValue = to16bit_SIGNED(CL, CH)
    Case 2
        get_WORD_RegValue = to16bit_SIGNED(DL, DH)
    Case 3
        get_WORD_RegValue = to16bit_SIGNED(BL, BH)
    Case 4
        get_WORD_RegValue = SP
    Case 5
        get_WORD_RegValue = BP
    Case 6
        get_WORD_RegValue = SI
    Case 7
        get_WORD_RegValue = DI
    Case Else
        Debug.Print "wrong parameter in get_WORD_RegValue(" & bRegIndex & ")"
    End Select
    
    
    Exit Function
err1:
    Debug.Print "ERR:###8 : " & Err.Description
    
End Function

' rw =     AX   CX   DX   BX   SP   BP   SI   DI
' digit=    0    1    2    3    4    5    6    7
Public Sub store_WORD_RegValue(ByRef bRegIndex As Byte, ByRef wValue As Integer)

On Error GoTo err1

    ' 1.21 get_W_LowBits_STR/get_W_HighBits_STR are be improved

    Select Case bRegIndex
    Case 0
        AL = math_get_low_byte_of_word(wValue)
        AH = math_get_high_byte_of_word(wValue)
    Case 1
        CL = math_get_low_byte_of_word(wValue)
        CH = math_get_high_byte_of_word(wValue)
    Case 2
        DL = math_get_low_byte_of_word(wValue)
        DH = math_get_high_byte_of_word(wValue)
    Case 3
        BL = math_get_low_byte_of_word(wValue)
        BH = math_get_high_byte_of_word(wValue)
    Case 4
        SP = wValue
    Case 5
        BP = wValue
    Case 6
        SI = wValue
    Case 7
        DI = wValue
    Case Else
        Debug.Print "wrong parameter in get_WORD_RegValue(" & bRegIndex & ")"
    End Select
    
    Exit Sub
err1:
    Debug.Print "ERR:##23 : " & Err.Description
    On Error Resume Next
    
End Sub

' 1.17 do_Interupt() cannot modify flags directly,
'      it can only be done only after Flags are POPED by IRET!!!

Private Sub do_INTERUPT(ByRef bINT_NUMBER As Byte)
    
On Error GoTo err1 ' #1182d

    
    ' #539
    Dim iLimitScan As Integer
    
    Dim iTemp1 As Integer
    Dim lTMP As Long
    Dim i As Integer
    Dim tempByte1 As Byte
    Dim iFileNum As Integer
     
    Dim longI As Long ' #1075
     
    Dim ts As String
    Dim ts2 As String
    Dim b1 As Boolean
    Dim b2 As Boolean
    
    bSET_CF_ON_IRET = False
    bCLEAR_CF_ON_IRET = False
    
    bSET_ZF_ON_IRET = False
    bCLEAR_ZF_ON_IRET = False
    
    ' 1.17
    Dim tb1 As Byte
    Dim tb2 As Byte
    
    ' 1.09 temprorary variables:
    Dim lT As Long
    Dim lCount As Long
    ' 1.10 to keep current cursor position:
    Dim prevCOL As Byte
    Dim prevROW As Byte
    
    ' 1.14
    Dim tb As Byte
    
    ' 1.15
    Dim uCurrentVPageNum As Byte
    
    ' 1.07
    ' set IF
    ' 1.21 #172 THIS SHOULD BE CLEARED!
    ' frmFLAGS.cbIF.ListIndex = 0 '1
    ' (it is moved to CD - "INT ib" instruction)
    
    Dim lMEM_POINTER As Long
    Dim lTemp As Long
    
    
    Select Case bINT_NUMBER
    
    ' "division error"  (1.09)
    Case &H0
    
' #1194x2
'''            frmScreen.add_to_SCREEN "DIVIDE ERROR" & Chr(13) & Chr(10)
'''            frmScreen.show_if_not_visible
            
            '#1194x2
            mBox Me, " " & cMT("divide error - overflow.") & vbNewLine & " " & cMT("to manually process this error,") & vbNewLine & _
                     " " & cMT("change address of INT 0 in interrupt vector table.")
                     
            frmEmulation.stopAutoStep
            bEMULATOR_STOPED_ABNORMALLY = True
            
            
    ' INT 4, is triggered when OF=1 by INTO:  (1.09)
    Case &H4
            frmScreen.add_to_SCREEN (cMT("overlow") & Chr(13) & Chr(10) & cMT("INT 4 can be customized in interrupt vector table.") & Chr(13) & Chr(10)), True
            frmScreen.show_if_not_visible
            
    ' BIOS INTERUPT  (1.09)
    Case &H10
            Select Case AH
            
            '    INT 10 - VIDEO - SET VIDEO MODE
            '        AH = 00h
            '        AL = desired video mode (see #00010)
            Case 0
                frmScreen.set_VIDEO_MODE AL
                frmScreen.show_if_not_visible
            
            
            
            ' this function doesn't seem to work
            ' like in DOS prompt on WinXP...
                        
            ' SET TEXT-MODE CURSOR SHAPE
            'CH = cursor start and options (see #00013) - options not set!!!
            'CL = bottom scan line containing cursor (bits 0-4)
            'Bitfields for cursor start and options:
            'Bit(s)  Description (Table 00013)
            ' 7  should be zero
            ' 6,5    cursor blink
            '    (00=normal, 01=invisible, 10=erratic, 11=slow)
            '    (00=normal, other=invisible on EGA/VGA)
            ' 4-0    topmost scan line containing cursor
            Case 1
            
' #327s-cursor#  - doesn't seem to be what real comp does...
''''''                ' use only low nibble (first 5 bits):
'''                tb1 = ch And &H1F ' start line.
'''                tb2 = CL And &H1F ' bottom line.


                ' #327s-cursor# If (ch And &H60) <> 0 Then
                If (CH And 32) <> 0 Then ' #327s-cursor# - check bit 5 only!
                    frmScreen.bSHOW_BLINKING_CURSOR = False
                Else
                    frmScreen.bSHOW_BLINKING_CURSOR = True
                End If
                
                
                ' #327s-cursor# - it seems that that's what it does...
                tb1 = CH
                tb2 = CL
                If tb1 > 7 Then tb1 = 7
                If tb2 > 7 Then tb2 = 7
                
                
                frmScreen.setCursorSize tb1, tb2
            
            
            Case &H2 ' SET CURSOR POSITION.
            
                    '    BH = page number
                    '        0-3 in modes 2&3
                    '        0-7 in modes 0&1
                    '        0 in graphics modes
                    '    DH = row (00h is top)
                    '    DL = column (00h is left)
                    
                    frmScreen.setCursorPos DL, DH, BH
                    
            'INT 10 - VIDEO - GET CURSOR POSITION AND SIZE
            '    AH = 03h
            '    BH = page number
            '        0-3 in modes 2&3
            '        0-7 in modes 0&1
            '        0 in graphics modes
            'Return: AX = 0000h (Phoenix BIOS)
            '    CH = start scan line
            '    CL = end scan line
            '    DH = row (00h is top)
            '    DL = column (00h is left)
            Case &H3 ' GET CURSOR POSITION AND SIZE.
                    
                    ' DH = row (00h is top)
                    DH = frmScreen.getCursorPos_ROW(BH)
                    ' DL = column (00h is left)
                    DL = frmScreen.getCursorPos_COL(BH)

                    ' 1.17
                    CH = frmScreen.getCursor_StartLine
                    CL = frmScreen.getcursor_BottomLine
                    
                    
            'INT 10 - VIDEO -  SELECT ACTIVE DISPLAY PAGE
            '    AH = 05h
            '    AL = new page number (00h to number of pages - 1) (see #00010)
            'Return: nothing
            ' writes:
            '     MEM 0040h:0062h - VIDEO - CURRENT PAGE NUMBER
            '     MEM 0040h:004Eh - VIDEO - CURRENT PAGE START ADDRESS IN REGEN BUFFER
            Case 5
                If AL < 8 Then
'''                    lCURRENT_VIDEO_PAGE_ADR = VIDEO_MEMORY_START + to_unsigned_long(CInt(AL)) * VIDEO_PAGE_SIZE
'''                    frmScreen.VMEM_TO_SCREEN
                    frmScreen.set_current_video_page_number AL
                    frmScreen.show_if_not_visible
                End If
                    
            'INT 10 - VIDEO - SCROLL UP WINDOW
            '    AH = 06h
            '    AL = number of lines by which to scroll up (00h = clear entire window)
            '    BH = attribute used to write blank lines at bottom of window
            '    CH,CL = row,column of window's upper left corner
            '    DH,DL = row,column of window's lower right corner
            'Return: nothing
            'Note:   affects only the currently active page (see AH=05h)
            Case &H6
                    frmScreen.scroll_WINDOW_UP CH, CL, DH, DL, to16bit_SIGNED(32, BH), AL
                    
            'INT 10 - VIDEO - SCROLL DOWN WINDOW
            '    AH = 07h
            '    AL = number of lines by which to scroll down (00h=clear entire window)
            '    BH = attribute used to write blank lines at top of window
            '    CH,CL = row,column of window's upper left corner
            '    DH,DL = row,column of window's lower right corner
            'Return: nothing
            'Note:   affects only the currently active page (see AH=05h)
            Case &H7
                frmScreen.scroll_WINDOW_DOWN CH, CL, DH, DL, to16bit_SIGNED(32, BH), AL

            Case &H8 ' READ CHARACTER AND ATTRIBUTE AT CURSOR POSITION
            
                    ' BH = page number
                    
                    ' Return: AH = Character 's attribute (text mode only)
                    '         AL = Character
                    AH = frmScreen.get_ATTRIB_at_CurrentPos(BH)
                    AL = frmScreen.get_ASCII_CODE_at_CurrentPos(BH)
                    
            Case &H9 ' WRITE CHARACTER AND ATTRIBUTE AT CURSOR POSITION
            
                '    AL = character to display
                '    BH = page number (00h to number of pages - 1) (see #00010)
                '        background color in 256-color graphics modes (ET4000)
                '    BL = attribute (text mode) or color (graphics mode)
                '        if bit 7 set in <256-color graphics mode, character is XOR'ed
                '          onto Screen
                '    CX = number of times to write character

                ' 1.10
                prevCOL = frmScreen.getCursorPos_COL(BH)
                prevROW = frmScreen.getCursorPos_ROW(BH)

                lCount = to16bit_UNS(CL, CH) - 1
                For lT = 0 To lCount
                    frmScreen.setChar_and_Attribute_at_CurrentPos AL, BL, False, BH, True, False
                    frmScreen.advance_current_position BH
                Next lT
                
                
                ' 1.10
                frmScreen.setCursorPos prevCOL, prevROW, BH
                
                ' --------------------------------------------------------
                ' 1.15 show screen only if current page is modified:
                uCurrentVPageNum = frmScreen.get_current_video_page_number
                
                If BH = uCurrentVPageNum Then
                    ' update the screen:
                    ' 1.22 #183 ' frmScreen.VMEM_TO_SCREEN
                    frmScreen.show_if_not_visible
                End If
                ' --------------------------------------------------------

            Case &HA ' WRITE CHARACTER ONLY AT CURSOR POSITION
            
                '    AL = character to display
                '    BH = page number (00h to number of pages - 1) (see #00010)
                '        background color in 256-color graphics modes (ET4000)
                '    BL = attribute (PCjr, Tandy 1000 only) or color (graphics mode)
                '        if bit 7 set in <256-color graphics mode, character is XOR'ed
                '          onto Screen
                '    CX = number of times to write character
                    
                ' (BL = attribute) - ignored! (?)
                
                ' 1.10
                prevCOL = frmScreen.getCursorPos_COL(BH)
                prevROW = frmScreen.getCursorPos_ROW(BH)
                
                lCount = to16bit_UNS(CL, CH) - 1
                For lT = 0 To lCount
                    tb = frmScreen.get_ATTRIB_at_CurrentPos(BH)
                    frmScreen.setChar_and_Attribute_at_CurrentPos AL, tb, False, BH, True, False
                    frmScreen.advance_current_position BH
                Next lT
                
                
                ' 1.10
                frmScreen.setCursorPos prevCOL, prevROW, BH
                
                ' --------------------------------------------------------
                ' 1.15 show screen only if current page is modified:
                uCurrentVPageNum = frmScreen.get_current_video_page_number
                
                If BH = uCurrentVPageNum Then
                    ' update the screen:
                    ' 1.22 #183 ' frmScreen.VMEM_TO_SCREEN
                    frmScreen.show_if_not_visible
                End If
                ' --------------------------------------------------------
                
                
                
            ' INT 10 - VIDEO - WRITE GRAPHICS PIXEL
            Case &HC
                
                ' INT 10 - VIDEO - WRITE GRAPHICS PIXEL
                '   AH = 0Ch
                '   BH = page number
                '   AL = pixel color
                '       if bit 7 set, value is XOR'ed onto screen except in 256-color modes
                '   CX = column
                '   DX = row
                ' Return: nothing
                ' Desc: set a single pixel on the display in graphics modes
                ' Notes:    valid only in graphics modes
                '   BH is ignored if the current video mode supports only one page
                                
                                
                If boolGRAPHICS_VIDEO_MODE Then
                
                    ' should work for 13h
                    lTMP = GRAPHICS_VIDEO_MEMORY_START + (frmScreen.picSCREEN.ScaleWidth * to16bit_UNS(DL, DH)) + to16bit_UNS(CL, CH)
                    RAM.mWRITE_BYTE lTMP, AL
                    
                Else
                
                    mBox Me, cMT("not graphical mode!") & vbNewLine & _
                    cMT("use this code to set graphics mode:") & vbNewLine & _
                    "mov ah, 0" & vbNewLine & _
                    "mov al, 13h" & vbNewLine & _
                    "int 10h"
                    
                    stopAutoStep
                    bEMULATOR_STOPED_ABNORMALLY = True
                    
                End If
                
            ' INT 10 - VIDEO - READ GRAPHICS PIXEL
            Case &HD

                ' INT 10 - VIDEO - READ GRAPHICS PIXEL
                '   AH = 0Dh
                '   BH = page number
                '   CX = column
                '   DX = row
                ' Return: AL = pixel color
                ' Desc: determine the current color of the specified pixel in grahics modes
                ' Notes:    valid only in graphics modes
                '   BH is ignored if the current video mode supports only one page

                If boolGRAPHICS_VIDEO_MODE Then
                
                    ' should work for 13h
                    lTMP = GRAPHICS_VIDEO_MEMORY_START + (frmScreen.picSCREEN.ScaleWidth * to16bit_UNS(DL, DH)) + to16bit_UNS(CL, CH)
                    AL = RAM.mREAD_BYTE(lTMP)
                    
                Else
                
                    mBox Me, cMT("not graphical mode!") & vbNewLine & _
                    cMT("use this code to set graphics mode:") & vbNewLine & _
                    "mov ah, 0" & vbNewLine & _
                    "mov al, 13h" & vbNewLine & _
                    "int 10h"
                    
                    stopAutoStep
                    bEMULATOR_STOPED_ABNORMALLY = True
                    
                End If
                
            Case &HE ' TELETYPE OUTPUT
            
                '    AL = character to write
                '    BH = page number
                '    BL = foreground color (graphics modes only)
                    
                ' (BH = page number)  - ignored??!!
                '         it seems that real PC doesn't care about BH!
                ' (BL = foreground color) - ignored????!!
                '         it seems that real PC doesn't care about BL!
                
                uCurrentVPageNum = frmScreen.get_current_video_page_number
                
                tb = frmScreen.get_ATTRIB_at_CurrentPos(uCurrentVPageNum)
                frmScreen.setChar_and_Attribute_at_CurrentPos AL, tb, True, uCurrentVPageNum, True, False
                
                ' update the screen:
                ' 1.22 #183 ' frmScreen.VMEM_TO_SCREEN
                frmScreen.show_if_not_visible

            ' #400b9-int10_0F#
            Case &HF
                frmScreen.INT_10h_0Fh
                
                
                
                
            ' #400b17-int10_11#
            Case &H11
                Debug.Print "todo: INT 10h, AH=011h"
                
                
                
                
            'INT 10 - VIDEO - WRITE STRING (AT and later,EGA)
            '    AH = 13h
            '    AL = write mode
            '       bit 0: update cursor after writing
            '       bit 1: string contains alternating characters and attributes
            '       bits 2 - 7: reserved (0)
            '    BH = page number
            '    BL = attribute if string contains only characters
            '    CX = number of characters in string
            '    DH,DL = row,column at which to start writing
            '    ES:BP -> string to write
            'Return: nothing
            'Notes:  recognizes CR, LF, BS, and bell;
            Case &H13
                ts = ""
                lMEM_POINTER = to_unsigned_long(ES) * 16 + to_unsigned_long(BP)

                ' update cursor after writing?
                tb1 = AL And 1 ' 00000001b
                b1 = IIf(tb1 = 1, True, False)
                
                ' string contains attributes?
                tb2 = AL And 2 ' 00000010b
                b2 = IIf(tb2 = 2, True, False)

                lCount = to16bit_UNS(CL, CH)
                
                ' 2.05#539b
                If lCount > 2000 Then
                    mBox Me, cMT("CX value (string size) is above the allowed limit!") ' Georges!
                    stopAutoStep
                    bEMULATOR_STOPED_ABNORMALLY = True
                    Exit Sub
                End If
                
                '#1191_ONE_MORE_BUG!    If tb2 Then lCount = lCount * 2
                If b2 Then lCount = lCount * 2


                For lT = 1 To lCount
                    If (lMEM_POINTER > MAX_MEMORY) Then
                        mBox Me, "INT 10h, AH=13h - " & cMT("CX is out of memory")
                        
                        frmEmulation.stopAutoStep           ' #1191 - btw :)
                        bEMULATOR_STOPED_ABNORMALLY = True  '
                        
                        Exit Sub
                    End If
                    
                    ts = ts & Chr(RAM.mREAD_BYTE(lMEM_POINTER))
                    lMEM_POINTER = lMEM_POINTER + 1
                    ' to allow user to stop, when
                    ' scanning into memory for too long...
                    DoEvents
                    If bSTOP_EVERYTHING Then Exit Sub
                Next lT
                
                If bSTOP_EVERYTHING Then Exit Sub
                
                frmScreen.setCursorPos DL, DH, BH
                                
                frmScreen.add_to_SCREEN_with_attrib ts, BH, b1, b2, BL, True, False
                frmScreen.show_if_not_visible

            

            Case Else
            
                Select Case to16bit_SIGNED(AL, AH)
                
                'INT 10 - VIDEO - TOGGLE INTENSITY/BLINKING BIT (Jr, PS, TANDY 1000, EGA, VGA)
                '  AX = 1003h
                '  BL = New state
                '      00h background intensity enabled
                '      01h blink enabled
                '  BH = 00h to avoid problems on some adapters
                Case &H1003
                
                    If BL = 0 Then
                        ' ok (by default we have no blinking).
                    ElseIf BL = 1 Then
                        mBox Me, "INT 10h, AX=1003h, BL=01  - " & cMT("note: the emulator does not blink.")
                        stopAutoStep
                        bEMULATOR_STOPED_ABNORMALLY = True
                    Else
                        mBox Me, "INT 10h, AX=1003h, BL=0" & Hex(BL) & "h  - " & cMT("wrong parameter in BL!")
                        stopAutoStep
                        bEMULATOR_STOPED_ABNORMALLY = True
                    End If
                
                Case Else
                    mBox Me, "INT 10h, AH=0" & Hex(AH) & "h   - " & cMT("is not supported") & vbNewLine & _
                             cMT("refer to the list of supported interrupts")

                    stopAutoStep
                    bEMULATOR_STOPED_ABNORMALLY = True
                End Select
            End Select
            
            'INT 11 - BIOS - GET EQUIPMENT LIST
            'Return: (E)AX = BIOS equipment list word (see #00226,#03215 at INT 4B"Tandy")
            'Note:   since older BIOSes do not know of the existence of EAX, the high word
            '      of EAX should be cleared before this call if any of the high bits
            '      will be tested
            'SeeAlso: INT 4B"Tandy 2000",MEM 0040h:0010h
            '
            'Bitfields for BIOS equipment list:
            'Bit(s)  Description (Table 00226)
            ' 0  floppy disk(s) installed (number specified by bits 7-6)
            ' 1  80x87 coprocessor installed
            ' 3-2    number of 16K banks of RAM on motherboard (PC only)
            '    number of 64K banks of RAM on motherboard (XT only)
            ' 2  pointing device installed (PS)
            '3   unused (PS)
            ' 5-4    initial video mode
            '    00 EGA, VGA, or PGA
            '    01 40x25 color
            '    10 80x25 color
            '    11 80x25 monochrome
            ' 7-6    number of floppies installed less 1 (if bit 0 set)
            ' 8  DMA support installed (PCjr, Tandy 1400LT)
            '    DMA support *not* installed (Tandy 1000's)
            ' 11-9   number of serial ports installed
            ' 12 game port installed
            ' 13 serial printer attached (PCjr)
            '    internal modem installed (PC/Convertible)
            ' 15-14  number of parallel ports installed
    Case &H11
            AL = RAM.mREAD_BYTE(&H410)
            AH = RAM.mREAD_BYTE(&H411)
            
    ' 1.10
    'INT 12 - BIOS - GET MEMORY SIZE
    'Return: AX = kilobytes of contiguous memory starting at absolute address 00000h
    'Note:   this call returns the contents of the word at 0040h:0013h
    Case &H12
            AL = RAM.mREAD_BYTE(&H413)
            AH = RAM.mREAD_BYTE(&H414)
            
    ' 1.10
    Case &H13
            Select Case AH
            
            'INT 13 - DISK - RESET DISK SYSTEM
            '    AH = 00h
            '    DL = drive (if bit 7 is set both hard disks and floppy disks reset)
            'Return: AH = status (see #00234)
            '    CF clear if successful (returned AH=00h)
            '    CF set on error
            Case 0
            
                ' TODO: this call should re-intilialize table
                '       located at address pointed by INT 1Eh
                '       (Vector of Diskette Controller Parameters).
                
                ' 1.17 frmFLAGS.cbCF.ListIndex = 0
                bCLEAR_CF_ON_IRET = True
                
            'INT 13 - DISK - READ SECTOR(S) INTO MEMORY
            '    AH = 02h
            '    AL = number of sectors to read (must be nonzero)
            '    CH = low eight bits of cylinder number
            '    CL = sector number 1-63 (bits 0-5)
            '         high two bits of cylinder (bits 6-7, hard disk only)
            '    DH = head number
            '    DL = drive number (bit 7 set for hard disk)
            '    ES:BX -> data buffer
            'Return: CF set on error
            '        if AH = 11h (corrected ECC error), AL = burst length
            '    CF clear if successful
            '    AH = status (see #00234)
            '    AL = number of sectors transferred (only valid if CF set for some
            '          BIOSes)
            Case 2
                mDisk.read_sectors AL, CH, CL, DH, DL, to_unsigned_long(ES) * 16 + to16bit_UNS(BL, BH)
                
            'INT 13 - DISK - WRITE DISK SECTOR(S)
            '    AH = 03h
            '    AL = number of sectors to write (must be nonzero)
            '    CH = low eight bits of cylinder number
            '    CL = sector number 1-63 (bits 0-5)
            '         high two bits of cylinder (bits 6-7, hard disk only)
            '    DH = head number
            '    DL = drive number (bit 7 set for hard disk)
            '    ES:BX -> data buffer
            'Return: CF set on error
            '    CF clear if successful
            '    AH = status (see #00234)
            '    AL = number of sectors transferred
            Case 3
                mDisk.write_sectors AL, CH, CL, DH, DL, to_unsigned_long(ES) * 16 + to16bit_UNS(BL, BH), False
            
            Case Else
                mBox Me, "INT 13h, AH=0" & Hex(AH) & "h   " & cMT("- not supported yet.") & vbNewLine & _
                 cMT("refer to the list of supported interrupts")

                stopAutoStep
                bEMULATOR_STOPED_ABNORMALLY = True
            End Select
            
            
    Case &H15
    
            Select Case AH
            
            ' Case &H83 - not works on XT, and up...
            
            'INT 15 - BIOS - WAIT (AT,PS)
            '    AH = 86h
            '    CX:DX = interval in microseconds
            'Return: CF clear if successful (wait interval elapsed)
            '    CF set on error or AH=83h wait already in progress
            '        AH = status (see #00496)
            'Note:   the resolution of the wait period is 977 microseconds on many systems
            '      because many BIOSes use the 1/1024 second fast interrupt from the AT
            '      real-time clock chip which is available on INT 70; because newer
            '      BIOSes may have much more precise timers available, it is not
            '      possible to use this function accurately for very short delays unless
            '      the precise behavior of the BIOS is known (or found through testing)
            'SeeAlso: AH=41h,AH=83h,INT 1A/AX=FF01h,INT 70
            Case &H86
                               
                ' take in mind that interupt pushes the flags register,
                ' so changing flags here won't be see by the program!!!
                
                ' covenvert for micro to milli-seconds:   '
             ' 2.09#574  timerINT15_86.Interval = (to_unsigned_long(to16bit_UNS(CL, CH)) * &H10000 + to_unsigned_long(to16bit_UNS(DL, DH))) / 1000
             
                ' 2005-05-16 temporary bug fix of:
                ' MOV     CX, 1000
                ' MOV     DX, 1
                ' MOV     AH, 86h
                ' INT     15h
                ' reported by: Sandro
                Dim lTempSecs As Long
                ' 65536 = &H10000
                lTempSecs = (to16bit_UNS(CL, CH) * CLng(65536) + to16bit_UNS(DL, DH)) / 1000
                If lTempSecs > 65535 Then
                    lTempSecs = 65535 ' it's a lie.
                End If
                
                
                timerINT15_86.Interval = lTempSecs
                '   Debug.Print lTempSecs
  
                ' don't allow zero delay (or it will wait for ever),
                ' and don't allow to run it twice:
                If (timerINT15_86.Interval > 0) And (Not timerINT15_86.Enabled) Then
                    timerINT15_86.Enabled = True
                    
                    Do While timerINT15_86.Enabled
                        DoEvents
                    Loop
                    
                    If bSTOP_EVERYTHING Then Exit Sub ' 1.17
                    
                    bCLEAR_CF_ON_IRET = True ' ok!
                Else
                    bSET_CF_ON_IRET = True  ' set error.
                End If
                                
            Case Else
                mBox Me, "INT 15h, AH=0" & Hex(AH) & "h   " & cMT("- not supported yet.") & vbNewLine & _
                 cMT("refer to the list of supported interrupts.") & vbNewLine & vbNewLine & _
                 cMT("if you need int 21h, put h suffix to 21")

                stopAutoStep
                bEMULATOR_STOPED_ABNORMALLY = True

            End Select

    Case &H16
            Select Case AH

            'INT 16 - KEYBOARD - GET KEYSTROKE
            '    AH = 00h
            'Return: AH = BIOS scan code
            '    AL = ASCII character
            Case 0
                iTemp1 = frmScreen.inputChar_NOECHO
                
                If bSTOP_EVERYTHING Then Exit Sub ' 1.17

                AH = math_get_high_byte_of_word(iTemp1)
                AL = math_get_low_byte_of_word(iTemp1)

          
                
                
            'INT 16 - KEYBOARD - CHECK FOR KEYSTROKE
            '    AH = 01h
            'Return: ZF set if no keystroke available
            '    ZF clear if keystroke available
            '        AH = BIOS scan code
            '        AL = ASCII character
            Case 1
            
                ' #1030b
                ' even without echo we still need a screen to type in!
                frmScreen.show_if_not_visible
            
                If uCHARS_IN_KB_BUFFER > 0 Then ' check just in case.
                    ' DO NOT remove char from the buffer:
                    ' just return it:
                    AH = uKB_BUFFER(0).cBIOS
                    AL = uKB_BUFFER(0).cASCII
                                        
                    bCLEAR_ZF_ON_IRET = True

                Else
                    bSET_ZF_ON_IRET = True
                End If

            Case Else
                mBox Me, "INT 16h, AH=0" & Hex(AH) & "h   - " & cMT("- not supported yet.") & vbNewLine & _
                 cMT("refer to the list of supported interrupts.")

                stopAutoStep
                bEMULATOR_STOPED_ABNORMALLY = True
            End Select


   ' #400b14-INT17H#
   Case &H17
         do_INT_17H



    Case &H1A
            Select Case AH
            'INT 1A - TIME - GET SYSTEM TIME
            '    AH = 00h
            'Return: CX:DX = number of clock ticks since midnight
            '    AL = midnight flag, nonzero if midnight passed since time last read
            ' there are approximately 18.2 clock ticks per second, 1800B0h per 24 hrs
            Case 0
                ' bugfix1.23#221
                ts = make_min_len(Hex(Timer * 18.20648), 8, "0")
                CH = Val("&H" & Mid(ts, 1, 2)) ' always 00!
                CL = Val("&H" & Mid(ts, 3, 2))
                DH = Val("&H" & Mid(ts, 5, 2))
                DL = Val("&H" & Mid(ts, 7, 2))
                ' AL always set to zero, I don't know what
                '    to do about it:
                AL = 0
                
            Case Else
                mBox Me, "INT 1Ah, AH=0" & Hex(AH) & "h   " & cMT("- not supported yet.") & vbNewLine & _
                 cMT("refer to the list of supported interrupts.")

                stopAutoStep
                bEMULATOR_STOPED_ABNORMALLY = True
            End Select

    'INT 19 - SYSTEM - BOOTSTRAP LOADER
    'Desc:   This interrupt reboots the system without clearing memory or restoring
    '      interrupt vectors.  Because interrupt vectors are preserved, this
    '      interrupt usually causes a system hang if any TSRs have hooked
    '      vectors from 00h through 1Ch, particularly INT 08.
    'Notes:  Usually, the BIOS will try to read sector 1, head 0, track 0 from drive
    '      A: to 0000h:7C00h.
    Case &H19
                bTERMINATED = True
                bSTOP_frmDEBUGLOG = True
                mBox Me, cMT("program requested reboot. the emulator halted.") & vbNewLine & vbNewLine & cMT("note: you can overwrite INT 19h in interrupt vector table") & vbNewLine & cMT("to create custom reboot function. for more information") & vbNewLine & cMT("refer to custom_interrupt.asm in examples.")
                stopAutoStep
 
                
    ' MS-DOS INTERUPT!
    Case &H20   ' INT 20h
                ' exit to DOS: (the same as INT 21h, AH=4Ch)

            bTERMINATED = True
            bSTOP_frmDEBUGLOG = True
            stopAutoStep

            If bEMULATOR_STOPED_ABNORMALLY Then
                mBox Me, sPROGRAM_ABNORMALLY_TERMINATED
                bEMULATOR_STOPED_ABNORMALLY = False
            Else
                mBox Me, cMT(sPROGRAM_TERMINATED)
            End If
            
            CLOSE_ALL_VIRTUAL_FILES ' #1194  - operating system cleans after buggy programs...
            
            
   ' #1073         bSTOP_ON_THE_NEXT_STEP = True
            
    ' MS-DOS INTERUPT!
    Case &H21   ' INT 21h
            Select Case AH
        
        
            ' INT 21 - DOS 1+ - TERMINATE PROGRAM
            ' AH = 00h
            ' CS = PSP segment
            Case 0 ' seems to be same as 4Ch

                bTERMINATED = True
                bSTOP_frmDEBUGLOG = True
                stopAutoStep
                
                If bEMULATOR_STOPED_ABNORMALLY Then
                    mBox Me, sPROGRAM_ABNORMALLY_TERMINATED
                    bEMULATOR_STOPED_ABNORMALLY = False
                Else
                    mBox Me, cMT(sPROGRAM_TERMINATED)
                End If
                
                
                
                CLOSE_ALL_VIRTUAL_FILES ' #1194  - operating system cleans after buggy programs...
            
               ' bSTOP_ON_THE_NEXT_STEP = True' #1073
                
             ' 1.03
             ' INT 21/AH = 01h, READ CHARACTER FROM STANDARD INPUT, WITH ECHO
             Case 1
                tb1 = frmScreen.inputChar()
                If bSTOP_EVERYTHING Then Exit Sub ' 1.17
                AL = tb1 ' txtAL is updated later.
                frmScreen.add_to_SCREEN Chr(tb1), False     ' #327xj-no-scroll-int21-1#
            
            ' 1.03
            ' INT 21/AH = 02h, WRITE CHARACTER TO STANDARD OUTPUT
            Case 2
                frmScreen.add_to_SCREEN Chr(DL), True
                frmScreen.show_if_not_visible
                ' Ralf's Int.List:
                ' AL = last character output (despite the official docs which state
                ' nothing is returned) (at least DOS 2.1-7.0)
                txtAL.Text = Hex(DL) ' AL var is updated by Change event.
        
            
            
            '    Int 21H                                                                [1.0]
            '    Function 05H
            '    Printer output
            '    ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            '
            '      [1] Sends a character to the first list device (PRN or LPT1).
            '
            '      [2.0+] Sends a character to the standard list device. The default device
            '      is the printer on the first parallel port (LPT1), unless explicitly
            '      redirected by the user with the MODE command.
            '
            '    Call with:
            '
            '      AH            = 05H
            '      DL            = 8-bit data for output
            Case 5
                 write_to_virtual_printer DL
                 ' al=dl (undocumented officially, but that's what it does...)
                 txtAL.Text = Hex(DL) ' AL var is updated by Change event.
            
            
            ' #1030
            ' AH = 06h - DIRECT CONSOLE INPUT (if DL=255)/OUTPUT (if DL=0..254)
            ' Entry:
            '        Entry: AH = 06h DL = FFh    ???
            ' Return:
            ' ZF set if no character available and AL = 00h
            ' ZF clear if character available AL = character read
            ' (some of my tests conclude that it does clean the buffer).
            Case 6
            
            '#327s- BUG_int21h6#  this was stupid.... ->>>
                      ' wrong-->>      ' I do not check DL = FFh
                      ' wrong-->>      ' and don't document it.
                
                frmScreen.show_if_not_visible ' #327s-show-screen#
                
                If DL = 255 Then
                
                    If uCHARS_IN_KB_BUFFER > 0 Then ' check just in case.
                        iTemp1 = frmScreen.inputChar_NOECHO
                        
                        If bSTOP_EVERYTHING Then Exit Sub ' 1.17
                        
                        AL = math_get_low_byte_of_word(iTemp1)
                                            
                        bCLEAR_ZF_ON_IRET = True
    
                    Else
                        AL = 0
                        bSET_ZF_ON_IRET = True
                    End If
                    
                Else
                    ' do the same as INT 21h/02h
                    frmScreen.add_to_SCREEN Chr(DL), True
                    frmScreen.show_if_not_visible
                    ' Ralf's Int.List:
                    ' AL = last character output (despite the official docs which state
                    ' nothing is returned) (at least DOS 2.1-7.0)
                    txtAL.Text = Hex(DL) ' AL var is updated by Change event.
                    
                End If
        
            ' #1030
            ' AH = 08h - CHARACTER INPUT WITHOUT ECHO
            '  does not check ^C/^Break
            ' copied partialy from INT 16h / AH=0
            Case 7
                iTemp1 = frmScreen.inputChar_NOECHO
                
                If bSTOP_EVERYTHING Then Exit Sub
                
                AL = math_get_low_byte_of_word(iTemp1)
                
                
            ' #1030
            ' AH = 08h - CHARACTER INPUT WITHOUT ECHO
            ' ^C/^Break are checked (not implemented here!)
            ' CTRL+C not checked, that's why this INT is not documented!
            Case 8
                iTemp1 = frmScreen.inputChar_NOECHO
                
                If bSTOP_EVERYTHING Then Exit Sub
                
                AL = math_get_low_byte_of_word(iTemp1)
                
                
            ' print string at DS:DX, '$' at the end
            Case 9      ' AH=09h
                ts = ""
                lTemp = DS
                lMEM_POINTER = lTemp * 16
                lTemp = to16bit_UNS(DL, DH)
                lMEM_POINTER = lMEM_POINTER + lTemp
                iLimitScan = 0
                lTemp = lMEM_POINTER ' keep original starting address (for error message) 3.27xq
                Do While Not bSTOP_EVERYTHING ' 1.17 - True.
                    ' #539
                    If (lMEM_POINTER > MAX_MEMORY) Or (iLimitScan > 2005) Then   ' 3.27xq   removed old text, added example instead.
                        mBox Me, "INT 21h, AH=09h - " & vbNewLine & _
                        cMT("address: ") & make_min_len(Hex(lTemp), 5, "0") & vbNewLine & cMT("byte 24h not found after 2000 bytes.") & vbNewLine & cMT("; correct example of INT 21h/9h:") & vbNewLine & "mov dx, offset msg" & vbNewLine & "mov ah, 9" & vbNewLine & "int 21h" & vbNewLine & "ret" & vbNewLine & "msg db ""Hello$"""
                        stopAutoStep
                        bEMULATOR_STOPED_ABNORMALLY = True
                        Exit Sub
                    End If
                    If Chr(RAM.mREAD_BYTE(lMEM_POINTER)) = "$" Then Exit Do
                    ts = ts & Chr(RAM.mREAD_BYTE(lMEM_POINTER))
                    lMEM_POINTER = lMEM_POINTER + 1
                     ' 020210 - to allow user to stop, when
                     '            scanning into memory for too long...
                    DoEvents
                    
                    ' #539
                    iLimitScan = iLimitScan + 1
                Loop
                
                If bSTOP_EVERYTHING Then Exit Sub ' 1.17

                frmScreen.add_to_SCREEN (ts), True
                '1.02
                frmScreen.show_if_not_visible
                ' 1.03
                ' Ralf's Int.List:
                ' Return: AL = 24h (the '$' terminating the string, despite official docs which
                ' state that nothing is returned) (at least DOS 2.1-7.0 and
                ' NWDOS)
                ' 1.18 txtAL.Text = "24" ' HEX! AL var is updated by Change event.
                ' text box updated later:
                AL = &H24
                
            ' input string to DS:DX (1 byte: buffer size,
            '                        2 byte: actual input size)
            Case &HA      ' AH=0Ah input string
                Dim s As String

                Dim L As Integer
                Dim b As Byte
                
                ' get the size of a buffer (the first byte of a buffer
                ' keeps the size):
                b = RAM.mREAD_BYTE(to_unsigned_long(DS) * 16 + to_unsigned_long(to16bit_SIGNED(DL, DH)))
                
                If b > 0 Then
                    s = frmScreen.inputString(b - 1)
                    ' 1.17 no need anymore! frmScreen.add_to_SCREEN s
                End If
                
                ' 1.17
                If bSTOP_EVERYTHING Then Exit Sub
                
                L = Len(s)
                
                ' set number of inputed chars to second byte
                ' in a buffer:
                RAM.mWRITE_BYTE to_unsigned_long(DS) * 16 + to_unsigned_long(to16bit_SIGNED(DL, DH)) + 1, to_unsigned_byte(L)
                                                
                For i = 0 To L - 1
                    ' +2 because 2 first bytes in a buffer are for buffer size
                    ' and actual number of inputed chars:
                    RAM.mWRITE_BYTE to_unsigned_long(DS) * 16 + to_unsigned_long(to16bit_SIGNED(DL, DH)) + to_unsigned_long(i) + 2, to_unsigned_byte(myAsc(Mid(s, i + 1, 1)))
                Next i
                
                ' last char is enter (not counted as size
                ' of inputed chars, but placed in the buffer):
                RAM.mWRITE_BYTE to_unsigned_long(DS) * 16 + to_unsigned_long(to16bit_SIGNED(DL, DH)) + to_unsigned_long(L) + 2, 13
            
                ' 31-mar-2002
                ' it seems that there is AL=0D after calling
                ' this interupt (not documented, so I'm not doing that).
                
                '#1134
                ' I decided to do it, because observations are more important:
                AL = 13
                
            
            ' #1030
            ' AH=0Bh - GET STDIN STATUS
            ' AL = 00h if no character available
            ' AL = FFh if character is available
            ' this sub looks a bit like INT 16h/AH=1
            Case &HB     ' AH=0Bh
                
                If uCHARS_IN_KB_BUFFER > 0 Then ' check just in case.
                        AL = 255
                Else
                        AL = 0
                End If
                
            ' #1030
            ' AH = 0Ch - FLUSH BUFFER AND READ STANDARD INPUT
            ' AL = STDIN input function to execute after flushing buffer
            ' other registers as appropriate for the input function
            ' if AL is not one of 01h,06h,07h,08h, or 0Ah, the buffer is flushed but no input is attempted
            Case &HC
            
                uCHARS_IN_KB_BUFFER = 0  ' flush the buffer!
                frmScreen.show_uKB_BUFFER ' #1114
                
                ' do interrupt:
                ' (recursive call!)
                If AL = 1 Or AL = 6 Or AL = 7 Or AL = 8 Or AL = &HA Then
                    AH = AL
                    do_INTERUPT &H21
                Else
                    Debug.Print "wrong AL value for INT 21h/AH=0Ch: " & AL
                End If
                
            ' AH = 0Dh - DISK RESET
            Case &HD
                ' do nothing :)
                ' NOT DOCUMENTED!
                
            ' AH = 0Eh - SELECT DEFAULT DRIVE
            Case &HE
                ' Entry: DL = new default drive (0=A:, 1=B:, etc)
                ' Return: AL = number of potentially valid drive letters
                ' Notes: the return value is the highest drive present
                set_DEFAULT_DRIVE DL
                AL = byte_MAX_DRIVE
                ' NOT DOCUMENTED YET!
                
                
                
            ' #400b5-int21h-17h#
            '    Int 21H                                                                [1.0]
            '    Function 17H
            '    Rename file
            Case &H17  ' 23
                do_INT21H_17H
                
                
                
            ' AH = 19h - GET CURRENT DEFAULT DRIVE
            Case &H19
                ' Return: AL = drive (0=A:, 1=B:, etc)
                AL = get_DEFAULT_DRIVE
                ' NOT DOCUMENTED YET!
                
                
            ' #400b4-int21-1A#
            ' 1AH           Set DTA Address                         1.0+
            Case &H1A   ' 26
                mDOS_FILE.set_DTA_Address
            
            ' Int 21H                                                                [2.0]
            ' Function 2FH (47)
            ' Get DTA address
            ' #400b5-INT21_2F#
            Case &H2F   ' 47
                mDOS_FILE.get_DTA_Address
            
            
            ' AH = 25h - SET INTERRUPT VECTOR
            ' AL = interrupt number
            ' DS:DX -> new interrupt handler
            Case &H25
                
                lTMP = AL
            
                
                lTMP = lTMP * 4
                                
                ' I hope I got right this low indian:
                RAM.mWRITE_WORD_i lTMP + 2, DS
                RAM.mWRITE_BYTE lTMP, DL
                RAM.mWRITE_BYTE lTMP + 1, DH
                
                
                
            ' AH = 2Ah - GET SYSTEM DATE
            ' Return: CX = year (1980-2099) DH = month DL = day AL = day of week (00h=Sunday)
            Case &H2A
                Dim iTmp As Integer
                
                iTmp = Year(Now)
                CL = to_unsigned_byte(Val("&h" & get_W_LowBits_STR(Hex(iTmp))))
                CH = to_unsigned_byte(Val("&h" & get_W_HighBits_STR(Hex(iTmp))))
                
                
                DH = Month(Now)
                
                DL = Day(Now)
                
                AL = Weekday(Now, vbSunday) - 1
                
                
                
                
            ' AH = 2Bh - SET SYSTEM DATE
            ' Case &H2B
             ' not implemented yet!!!
                
                
                
                
            ' AH = 2Ch - GET SYSTEM TIME
            ' Return: CH = hour CL = minute DH = second DL = 1/100 seconds
            Case &H2C
                CH = Hour(Now)
                CL = Minute(Now)
                DH = Second(Now)
                DL = get_reminder_only(Timer)
                
                
                
           ' AH = 2Dh - SET SYSTEM TIME
           ' case &h2D
           ' not implemented yet!!!
                
                
                
            ' AH = 2Eh - SET VERIFY FLAG
            Case &H2E
                ' Entry: AL = new state of verify flag (00 off, 01h o)
                ' Notes:
                ' default state at system boot is OFF
                ' when ON, all disk writes are verified provided the device driver supports read-after-write verification
                
                SET_VIRTUAL_VERIFY_FLAG AL
                
                
                
                
                
                
            ' AH=30h - GET DOS VERSION
            ' return:
            ' AL = major version number (00h if DOS 1.x)
            ' AH = minor version number
            ' BL:CX = 24-bit user serial number (most versions do not use this) if DOS <5 or AL=00h
            ' BH = MS-DOS OEM number if DOS 5+ and AL=01h
            ' BH = version flag bit 3: DOS is in ROM other: reserved (0)
            Case &H30
                AL = 5 ' 4.00-beta-6 ' 0
                AH = 0
                BH = 255
                ' will not document this!
                
                
                
                
                
            ' AH=35h - GET INTERRUPT VECTOR
            ' Entry: AL = interrupt number
            ' Return: ES:BX -> current interrupt handler
            ' (similar to AH = 25h - SET INTERRUPT VECTOR)
            Case &H35
                
                lTMP = AL
            
                
                lTMP = lTMP * 4
                                
                ' I hope I got right this low indian:
                ES = RAM.mREAD_WORD(lTMP + 2)
                BL = RAM.mREAD_BYTE(lTMP)
                BH = RAM.mREAD_BYTE(lTMP + 1)
                
                
                
                
                
                
            ' AH = 36h - GET FREE DISK SPACE
            ' Entry: DL = drive number (0=default, 1=A:, etc)
            ' Return:
            '
            ' AX = FFFFh if invalid drive
            ' AX = sectors per cluster BX = number of free clusters CX = bytes per sector DX = total clusters on drive
            ' Notes:
            '
            ' free space on drive in bytes is AX * BX * CX
            ' total space on drive in bytes is AX * CX * DX
            ' "lost clusters" are considered to be in use
            ' this function does not return proper results on CD-ROMs; use AX=4402h"CD-ROM" instead

            Case &H36
                
                If DL > byte_MAX_DRIVE + 1 Then ' #400b14-BUG2#  Z=26
                    AL = 255
                    AH = 255
                    ' return FFFFh - invalid drive
                Else
                    ' here we assume that all our drives are floppies!
                    ' hm... yet I'm not sure what clusters are.
                    ' always returns CX=BX (no reproting on used space!)
                    
                    ' AX * BX * CX = 1474560
                    ' AX * CX * DX = 1474560
                    
                    ' 18 sectors per cluster (cylinder?)
                    AH = 0
                    AL = 18
                    
                    ' 512 bytes per sector - 200h
                    CL = 0
                    CH = &H2
                    
                    ' cannot get it:
                    BL = CL
                    BH = CH
                    
                    '  total clusters on drive
                    ' let it be: 2 * 80 = 160 = A0h
                    DL = 0
                    DH = &HA0
                    
                End If
                
                
                
                
                
                
                
                
            ' AH = 39h - "MKDIR" - CREATE SUBDIRECTORY
            Case &H39
                
                ' Entry: DS:DX -> ASCIZ pathname
                '
                ' Return:
                '
                ' CF clear if successful AX destroyed
                ' CF set on error AX = error code (03h,05h)
                
                
                                
                ts = read_ASCIIZ(DS, to16bit_SIGNED(DL, DH))   ' #400b5-bug2#
                
                If CREATE_VIRTUAL_SUBDIRECTORY(ts) Then
                        ' clear CF:
                        bCLEAR_CF_ON_IRET = True
                        ' destroying:
                        AL = 0
                        AH = 0
                        
                Else
                        ' set CF on error:
                        bSET_CF_ON_IRET = True
                        AH = 0
                        AL = 3 ' error code may not be correct.
                        
                        ' probably these error values are correct,
                        ' (taken from asm6_file_acess_example.htm)
                        ' 03h path not found
                        ' 04h no available handle
                        ' 05h access denied
                End If
                                
                            
                
                 
                 
            ' AH = 3Ah - "RMDIR" - REMOVE SUBDIRECTORY
            Case &H3A
            
                ' Entry: DS:DX -> ASCIZ pathname of directory to be removed
                '
                ' Return:
                '
                ' CF clear if successful, AX destroyed
                ' CF set on error AX = error code (03h,05h,06h,10h)
                ' Notes: directory must be empty (contain only '.' and '..' entries)
                                 
                ' (sometimes Windows XP blocks dirs for no reason)
                
                ts = read_ASCIIZ(DS, to16bit_SIGNED(DL, DH))  ' #400b5-bug2#
                
                If REMOVE_VIRTUAL_SUBDIRECTORY(ts) Then
                        ' clear CF:
                        bCLEAR_CF_ON_IRET = True
                        ' destroying:
                        AL = 0
                        AH = 0
                        
                Else
                        ' set CF on error:
                        bSET_CF_ON_IRET = True
                        AH = 0
                        AL = 3 ' error code may not be correct.
                        
                        ' probably these error values are correct,
                        ' (taken from asm6_file_acess_example.htm)
                        ' 03h path not found
                        ' 04h no available handle
                        ' 05h access denied
                End If
                                     
                             
                
                
                
                
                
            ' AH = 3Bh - "CHDIR" - SET CURRENT DIRECTORY
            Case &H3B
                
                ' Entry: DS:DX -> ASCIZ pathname to become current directory (max 64 bytes)
                '
                ' Return:
                '
                ' CF clear if successful, AX destroyed
                ' CF set on error AX = error code (03h)
                ' Notes: if new directory name includes a drive letter, the default drive is not changed, only the current directory on that drive
                                         
                
                
                ts = read_ASCIIZ(DS, to16bit_SIGNED(DL, DH))   ' #400b5-bug2#
                
                If CHANGE_VIRTUAL_SUBDIRECTORY(ts) Then
                        ' clear CF:
                        bCLEAR_CF_ON_IRET = True
                        ' destroying:
                        AL = 0
                        AH = 0
                Else
                        ' set CF on error:
                        bSET_CF_ON_IRET = True
                        AH = 0
                        AL = 3 ' 03h path not found

                End If
                
                
            ' AH = 47h - "CWD" - GET CURRENT DIRECTORY
            Case &H47
                                
                ' Entry:
                '
                ' DL = drive number (00h = default, 01h = A:, etc)
                ' DS:SI -> 64-byte buffer for ASCIZ pathname
                ' Return:
                '
                ' CF clear if successful
                ' CF set on error, AX = error code (0Fh)
                ' Notes:
                '
                ' the returned path does not include a drive or the initial backslash
                ' many Microsoft products for Windows rely on AX being 0100h on success
                                

                If DL > byte_MAX_DRIVE + 1 Then ' #400b14-BUG2#
                        ' set CF on error:
                        bSET_CF_ON_IRET = True
                        AH = 0
                        AL = 15 ' error
                        Debug.Print "WRONG DRIVE NUMBER"
                Else
                        ts = GET_VIRTUAL_SUBDIRECTORY(DL)
                
                        ' #400b14-BUG2# '  If ts <> "" Then
                         
                        ' make sure it's 63 bytes, reserve 1 byte (for zero)
                        If Len(ts) > 63 Then
                            ts = Mid(ts, 1, 63)
                        End If
                        
                        ' WRITE ts TO DS:SI
                        write_ASCIIZ DS, SI, ts
                
                        ' clear CF:
                        bCLEAR_CF_ON_IRET = True
                        ' destroying:
                        AL = 0
                        AH = 1 ' AX=0100h
                End If
              ' #400b14-BUG2#  '  Else
                '                        ' set CF on error:
                '                        bSET_CF_ON_IRET = True
                '                        AH = 0
                '                        AL = 15 ' error

              ' #400b14-BUG2# '  End If
                                
                                
                                
            ' AH = 3Ch - "CREAT" - CREATE OR TRUNCATE FILE
            Case &H3C
                                
                ' Entry:
                '
                ' CX = file attributes
                ' DS:DX -> ASCIZ filename
                ' Return:
                '
                ' CF clear if successful, AX = file handle
                ' CF set on error AX = error code (03h,04h,05h)
                ' Notes: if a file with the given name exists, it is truncated to zero length
                                                
                                                
                                                
                ts = read_ASCIIZ(DS, to16bit_SIGNED(DL, DH)) ' #400b5-bug2#
                
                iTemp1 = CREATE_VIRTUAL_FILE(ts, to16bit_SIGNED(CL, CH))     ' returns "-1" on error, otherwise handle to file!
                
                If iTemp1 <> -1 Then
                        ' clear CF:
                        bCLEAR_CF_ON_IRET = True
                        ' file handle:
                        AL = to_unsigned_byte(Val("&h" & get_W_LowBits_STR(Hex(iTemp1)))) ' #1182e
                        AH = to_unsigned_byte(Val("&h" & get_W_HighBits_STR(Hex(iTemp1)))) ' #1182e

                Else
                        ' set CF on error:
                        bSET_CF_ON_IRET = True
                        AH = 0
                        AL = 3 ' 03h path not found
                End If
                                
                                
                                
                                
            ' AH = 3Dh - "OPEN" - OPEN EXISTING FILE
            Case &H3D
                                
                ' Entry:
                '
                ' AL = access and sharing modes
                ' DS:DX -> ASCIZ filename
                ' Return:
                '
                ' CF clear if successful, AX = file handle
                ' CF set on error AX = error code (01h,02h,03h,04h,05h,0Ch,56h)
                ' Notes:
                '
                ' file pointer is set to start of file
                ' file handles which are inherited from a parent also inherit sharing and access restrictions
                ' files may be opened even if given the hidden or system attributes
                
                   
                                                
                ' #400b5-bug2# ' ts = read_ASCIIZ(DS, to16bit_UNS(DL, DH))
                ts = read_ASCIIZ(DS, to16bit_SIGNED(DL, DH))
                
                
                iTemp1 = OPEN_VIRTUAL_FILE(ts, AL) ' returns "-1" on error, otherwise handle to file!
                
                If iTemp1 <> -1 Then
                        ' clear CF:
                        bCLEAR_CF_ON_IRET = True
                        ' file handle:
                        AL = to_unsigned_byte(Val("&h" & get_W_LowBits_STR(Hex(iTemp1)))) '#1182e
                        AH = to_unsigned_byte(Val("&h" & get_W_HighBits_STR(Hex(iTemp1)))) '#1182e
                Else
                        ' set CF on error:
                        bSET_CF_ON_IRET = True
                        AH = 0
                        AL = 3 ' 03h path not found
                        
                        ' #400b5-bug2#  in addition.
                        mBox Me, "interrupt error: " & Hex(bINT_NUMBER) & "h/3Dh : cannot open file."
                        stopAutoStep
                        bEMULATOR_STOPED_ABNORMALLY = True
                End If
                                
                
                
                
                
            ' AH = 3Eh - "CLOSE" - CLOSE FILE

            Case &H3E
                    
                ' Entry: BX = file handle
                '
                ' Return:
                '
                ' CF clear if successful, AX destroyed
                ' CF set on error, AX = error code (06h)
                ' Note: if the file was written to, any pending disk writes are performed, the time and date stamps are set to the current time, and the directory entry is updated
                
                If CLOSE_VIRTUAL_FILE(to16bit_SIGNED(BL, BH)) Then
                        ' clear CF:
                        bCLEAR_CF_ON_IRET = True
                        ' destroying:
                        AL = 0
                        AH = 0
                Else
                        ' set CF on error:
                        bSET_CF_ON_IRET = True
                        AH = 0
                        AL = 6 ' 06h - ?
                End If
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
            ' AH = 3Fh - "READ" - READ FROM FILE OR DEVICE
            Case &H3F
                                
                ' Entry:
                '
                ' BX = file handle
                ' CX = number of bytes to read
                ' DS:DX -> buffer for data
                ' Return:
                '
                ' CF clear if successful - AX = number of bytes actually read (0 if at EOF before call)
                ' CF set on error AX = error code (05h,06h)
                ' Notes:
                '
                ' data is read beginning at current file position, and the file position is updated after a successful read
                ' the returned AX may be smaller than the request in CX if a partial read occurred
                ' if reading from CON, read stops at first CR
                                
                
                
                Dim lActualReadCounter As Long
                
                iFileNum = to16bit_SIGNED(BL, BH)
                lActualReadCounter = 0
                
                For longI = 0 To to16bit_UNS(CL, CH) - 1
                    tempByte1 = READ_VIRTUAL_FILE(iFileNum)
                    
                    If bINPUT_OUTPUT_REDIRECTED Then GoTo INPUT_REDIRECTED_1191 ' #1191
                    
                    If b_EOF_ON_LAST_FILE_ACCESS Then GoTo exit_file_read '#1182c
                    
                    If i_DOS_VFILE_LAST_ERROR_CODE <> 0 Then GoTo exit_file_read
                    
                    RAM.mWRITE_BYTE to_unsigned_long(DS) * 16 + to_unsigned_long(to16bit_SIGNED(DL, DH)) + longI, tempByte1
                    lActualReadCounter = lActualReadCounter + 1
                Next longI
        
        
exit_file_read:
                AL = to_unsigned_byte(Val("&h" & get_W_LowBits_STR(Hex(to_signed_int(lActualReadCounter)))))
                AH = to_unsigned_byte(Val("&h" & get_W_HighBits_STR(Hex(to_signed_int(lActualReadCounter)))))
        
INPUT_REDIRECTED_1191:
                If bINPUT_OUTPUT_REDIRECTED Then
                   ' "TODO_improve1191!" set to actual chars inputed!
                    AL = 0
                    AH = 0
                End If

        
                If i_DOS_VFILE_LAST_ERROR_CODE = 0 Then
                    bCLEAR_CF_ON_IRET = True ' OK.
                Else
                   ' set CF on error:
                   bSET_CF_ON_IRET = True
                   AH = 0
                   AL = 5 ' some error code (access denied)
                End If
                
                
                
                
                
            ' AH=40h - "WRITE" - WRITE TO FILE OR DEVICE
            Case &H40
                
                ' Entry:
                '
                ' BX = file handle
                ' CX = number of bytes to write
                ' DS:DX -> data to write
                ' Return:
                '
                ' CF clear if successful -AX = number of bytes actually written
                ' CF set on error - AX = error code (05h,06h)
                ' Notes:
                '
                ' if CX is zero, no data is written, and the file is truncated or extended to the current position
                ' data is written beginning at the current file position, and the file position is updated after a successful write
                ' the usual cause for AX < CX on return is a full disk
                
                 
                Dim lActualWriteCounter As Long
                
                iFileNum = to16bit_SIGNED(BL, BH)
                lActualWriteCounter = 0
                                
                For longI = 0 To to16bit_UNS(CL, CH) - 1

                    tempByte1 = RAM.mREAD_BYTE(to_unsigned_long(DS) * 16 + to_unsigned_long(to16bit_SIGNED(DL, DH)) + longI)
                    
                    If Not WRITE_VIRTUAL_FILE(iFileNum, tempByte1) Then Exit For
                    
                    If bINPUT_OUTPUT_REDIRECTED Then GoTo REDIRECTED_TO_STDIN_1191 '#1191
                    
                    If i_DOS_VFILE_LAST_ERROR_CODE <> 0 Then Exit For ' not used currently (function return is just enough).
                    
                    lActualWriteCounter = lActualWriteCounter + 1
                    
                Next longI
        
                AL = to_unsigned_byte(Val("&h" & get_W_LowBits_STR(Hex(to_signed_int(lActualWriteCounter))))) '#1182e
                AH = to_unsigned_byte(Val("&h" & get_W_HighBits_STR(Hex(to_signed_int(lActualWriteCounter))))) '#1182e
        
        
        
REDIRECTED_TO_STDIN_1191:
                If bINPUT_OUTPUT_REDIRECTED Then ' #1191
                    If bINPUT_OUTPUT_REDIRECTED_SUCCESS Then
                        ' must set AX to CX :)
                        AL = CL
                        AH = CH
                    Else
                        AL = 0
                        AH = 0
                    End If
                End If
                
                        
        
        
                If i_DOS_VFILE_LAST_ERROR_CODE = 0 Then
                    bCLEAR_CF_ON_IRET = True ' OK.
                    
                    
                Else
                   ' set CF on error:
                   bSET_CF_ON_IRET = True
                   AH = 0
                   AL = 5 ' some error code.
                End If
                
                
                
                
                
                
                
                
            ' AH = 41H - "UNLINK" - DELETE FILE
            Case &H41
                
                ' Entry:
                '
                ' DS:DX -> ASCIZ filename (no wildcards, but see notes)
                ' CL = attribute mask for deletion (server call only, see notes)
                ' Return:
                '
                ' CF clear if successful, AX destroyed (DOS 3.3) AL seems to be drive of deleted file
                ' CF set on error AX = error code (02h,03h,05h)
                ' Notes:
                '
                ' (DOS 3.1+) wildcards are allowed if invoked via AX=5D00h, in which case the filespec must be canonical (as returned by AH=60h), and only files matching the attribute mask in CL are deleted
                ' DOS does not erase the file's data; it merely becomes inaccessible because the FAT chain for the file is cleared
                ' deleting a file which is currently open may lead to filesystem corruption.

                
                
                ts = read_ASCIIZ(DS, to16bit_SIGNED(DL, DH))  ' #400b5-bug2#
                
                If DELETE_VIRTUAL_FILE(ts, CL) Then
                   bCLEAR_CF_ON_IRET = True ' success
                   AH = 0
                   AL = get_drive_index(ts) ' drive letter? ok.
                   
                   
                   
                Else
                   bSET_CF_ON_IRET = True ' error!
                   AH = 0
                   AL = 3 ' some error code.
                End If
                
                
                
                
                
                
                
                
                
            ' AH=42h - "LSEEK" - SET CURRENT FILE POSITION
            
            Case &H42
                
                ' Entry:
                '
                ' AL = origin of move 00h start of file 01h current file position 02h end of file
                ' BX = file handle
                ' CX:DX = offset from origin of new file position
                ' Return:
                '
                ' CF clear if successful, DX:AX = new file position in bytes from start of file
                ' CF set on error, AX = error code (01h,06h)
                ' Notes:
                '
                ' for origins 01h and 02h, the pointer may be positioned before the start of the file; no error is returned in that case, but subsequent attempts at I/O will produce errors
                ' if the new position is beyond the current end of file, the file will be extended by the next write (see AH=40h)
                                
                                
                                
                iFileNum = to16bit_SIGNED(BL, BH)
                                
                                
                 '''' !!!!not sure if CX:DX should be treated as signed or not for 00h  but
                 ''' it seems it maybe for 01h and 02h modes !!!!!!!!!
                
                'If AL = 0 Then ' make it positive:
                    ' can result in emulator overflow'  lT = to16bit_UNS(CL, CH) * &H10000 + to16bit_UNS(DL, DH)
               ' Else ' this makes negative values:
                   ' ALWAYS treat as signed, because long values in VB have 2,147,483,647 limit and not  4,294,967,295 so it's really doesn't matter.
                    ts = "&h" & Hex(CH) & Hex(CL) & Hex(DH) & Hex(DL)
                    lT = Val(ts)
               ' End If
                                
                lTemp = SEEK_VIRTUAL_FILE(iFileNum, lT, AL)
                
                If i_DOS_VFILE_LAST_ERROR_CODE = 0 Then
                
                   bCLEAR_CF_ON_IRET = True ' success

                   ' DX:AX = lTemp
                   set_DX_AX lTemp
                                     
                   
                Else
                
                   bSET_CF_ON_IRET = True ' error!
                   AH = 0
                   AL = 1 ' some error code.
                   
                End If
                
                
                
                
             ' INT 21h, AH=043h  -  Get Attribute of  File
             Case &H43 ' #1194x3
                
                If AL = 0 Then
                
                  If get_VFILE_attributes(DS, DL, DH, CL, CH) Then
                        bCLEAR_CF_ON_IRET = True ' success
                  Else
                        bSET_CF_ON_IRET = True ' error!
                        AH = 0
                        AL = 1 ' some error code.
                  End If
                  
                ElseIf AL = 1 Then
                
                  If set_VFILE_attributes(DS, DL, DH, CL, CH) Then
                        bCLEAR_CF_ON_IRET = True ' success
                  Else
                        bSET_CF_ON_IRET = True ' error!
                        AH = 0
                        AL = 1 ' some error code.
                  End If
                  
                Else
                        Dim sERRRR As String ' 3.27xo
                        sERRRR = LCase(Err.Description)
                        mBox Me, "interrupt error: " & Hex(bINT_NUMBER) & "h : " & sERRRR
                        stopAutoStep
                        bEMULATOR_STOPED_ABNORMALLY = True
                                
                End If
                
                
                
            ' AH = 4Dh - GET RETURN CODE (ERRORLEVEL)
            Case &H4D
                
                ' Return:
                '
                ' AH = termination type (00=normal, 01h control-C abort, 02h=critical error abort, 03h terminate and stay resident)
                ' AL = return code
                ' Notes:
                '
                ' the word in which DOS stores the return code is cleared after being read by this function, so the return code can only be retrieved once
                ' COMMAND.COM stores the return code of the last external command it executed as ERRORLEVEL
                
                                
                AH = 0
                AL = 0
                
                ' does nothing... actually.
                
            
            
            
            ' AH = 54h - GET VERIFY FLAG
            Case &H54
                ' Return: AL = verify flag (00h=off, 01h=on, i.e. all disk writes verified after writing)
                AL = GET_VIRTUAL_VERIFY_FLAG
            
            
            
            
            ' AH = 56h - "RENAME" - RENAME FILE
            Case &H56
                
                ' Entry:
                '
                ' DS:DX -> ASCIZ filename of existing file (no wildcards, but see below)
                ' ES:DI -> ASCIZ new filename (no wildcards)
                ' Return:
                '
                ' CF clear if successful
                ' CF set on error, AX= error code (02h,03h,05h,11h)
                ' Notes:
                '
                ' allows move between directories on same logical volume
                ' this function does not set the archive attribute
                ' open files should not be renamed
                ' (DOS 3.0+) allows renaming of directories
            
            
                ts = read_ASCIIZ(DS, to16bit_SIGNED(DL, DH)) ' #400b5-bug2#
                ts2 = read_ASCIIZ(ES, DI)
                
                If RENAME_VIRTUAL_FILE(ts, ts2) Then
                
                   bCLEAR_CF_ON_IRET = True ' success
                   
                   
                   
                Else
                
                   bSET_CF_ON_IRET = True ' error!
                   AH = 0
                   AL = 2 ' some error code.
                   
                End If
                
                
            
            
                
            
                
            ' exit to DOS:   (the same as INT 20h)
            Case &H4C     ' AH=4C

                bTERMINATED = True
                bSTOP_frmDEBUGLOG = True
                stopAutoStep
                
                
                
                If bEMULATOR_STOPED_ABNORMALLY Then
                    mBox Me, sPROGRAM_ABNORMALLY_TERMINATED
                    bEMULATOR_STOPED_ABNORMALLY = False
                Else
                    mBox Me, cMT(sPROGRAM_TERMINATED)
                End If
                
                
                
                CLOSE_ALL_VIRTUAL_FILES ' #1194  - operating system cleans after buggy programs...
                
               ' bSTOP_ON_THE_NEXT_STEP = True ' #1073
               
               
'''            ' #400b4-int21-4E#
'''            Case &H4E
'''                mDOS_FILE.do_Find_first_file
'''
'''            ' #400b4-int21-4F#
'''            Case &H4F
'''                mDOS_FILE.do_Find_next_file
'''
'''            ' #400b4-int21-57#
'''            Case &H57
'''                mDOS_FILE.do_get_set_file_DATE_TIME
'''
            
            ' #400b6-int21h_33h_23h#
            '    Int 23H                                                                [1.0]
            '    Ctrl-C handler address
            Case &H23
                do_INT_21h_23h
            Case &H33
                do_INT_21h_33h
                
            ' #400b6-memory-block#
            '  48H           Allocate Memory Block                   2.0+
            '  49H           Release Memory Block                    2.0+
            '  4AH           Resize Memory Block                     2.0+
            Case &H48
                do_INT_21h_48h
            Case &H49
                do_INT_21h_49h
            Case &H4A
                do_INT_21h_4Ah
                
                
            Case Else
                mBox Me, "INT 21h, AH=0" & Hex(AH) & "h  " & cMT("- not supported yet.") & vbNewLine & _
                 cMT("refer to the list of supported interrupts.")

                stopAutoStep ' 020210
                bEMULATOR_STOPED_ABNORMALLY = True
            End Select
            
    Case &H33 '   #327s-mouse#
            ' pass parameters BYREF
            do_int33 AH, AL, BH, BL, CH, CL, DH, DL
            
    Case Else
'        mBox Me, "INT " & Hex(bINT_NUMBER) & "h   - not supported by emulator yet"
'        stopAutoStep ' 020210
'
'         frmScreen.add_to_SCREEN ("This interupt not supported yet" & Chr(13) & Chr(10))
'         frmScreen.show_if_not_visible
        
        frmScreen.add_to_SCREEN cMT("this interrupt is not defined yet, it is availabe for custom functions.") & vbNewLine & _
                 cMT("you can define this interrupt by modifying interrupt vector table") & vbNewLine & _
                 cMT("refer to the list of supported interrupts and global memory table.") & vbNewLine, True
        frmScreen.show_if_not_visible

        stopAutoStep
        bEMULATOR_STOPED_ABNORMALLY = True

    End Select
    
    ' 1.07
    ' reset IF
    ' 1.21 #172 not required to set back, since flags are poped on IRET!
    ' frmFLAGS.cbIF.ListIndex = 0
    
    Exit Sub
    
err1: ' #1182d
    
        Dim sERRRR2 As String ' 3.27xo
        sERRRR2 = LCase(Err.Description)
        mBox Me, "interrupt error: " & Hex(bINT_NUMBER) & "h : " & sERRRR2
        stopAutoStep
        bEMULATOR_STOPED_ABNORMALLY = True
        
        Resume Next

End Sub

'''' March 12, 2004
'''Public Sub sliderSTEPDELAY_Change_public()
'''    'sliderSTEPDELAY_Change
'''    scrollStepDelay_Change
'''End Sub





Private Sub popLoad_Click()
On Error GoTo err1

    ' #400-emu-state#
    If FileExists(Add_BackSlash(App.Path) & EMU_STATE_FILE) Then
        mnuLoadPreviousState.Enabled = True
    Else
        mnuLoadPreviousState.Enabled = False
    End If
    
    Exit Sub
    
err1:
    Debug.Print "err 77712:" & Err.Description
    
End Sub

Private Sub scrollDis_Change()
On Error GoTo err1

    ' copied!
    
    ' tricks to avoid stopping, we have 1Mb to show :)
    ' but this tningy is limited to 32767

    Dim lStepScroll As Long
    
    If b_scrollDis_correction Then
        b_scrollDis_correction = False
        Exit Sub
    End If
    
    lStepScroll = CLng(scrollDis.Value) - CLng(Val(scrollDis.Tag))
    
    scrollDis.Tag = scrollDis.Value
    
    
    If scrollDis.Value = 0 Then
        b_scrollDis_correction = True
        scrollDis.Value = 2
        scrollDis.Tag = "2"
        Exit Sub
    End If
    
    If scrollDis.Value = 32767 Then
        b_scrollDis_correction = True
        scrollDis.Value = 32765
        scrollDis.Tag = "32765"
        Exit Sub
    End If



    ' Debug.Print "c:" & lStepScroll
    
    ' ok! now that's better!

    Dim L As Long
    L = lStartDisAddress + lStepScroll
    If L >= 0 And L <= MAX_MEMORY Then
        DoDisassembling L, False
    End If
    
    
    Exit Sub
err1:
    Debug.Print "err244:" & Err.Description
End Sub

Private Sub scrollDis_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next ' 4.00-Beta-3
    picDisList_KeyDown KeyCode, Shift
End Sub


Private Sub scrollDis_Scroll()
On Error Resume Next ' 4.00-Beta-3
    scrollDis_Change
End Sub


Private Sub scrollMem_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next ' 4.00-Beta-3
    picMemList_KeyDown KeyCode, Shift
End Sub


Private Sub scrollMem_Scroll()
On Error Resume Next ' 4.00-Beta-3
    scrollMem_Change
End Sub

Private Sub scrollMem_Change()
On Error GoTo err1

    ' tricks to avoid stopping, we have 1Mb to show :)
    ' but this tningy is limited to 32767

    Dim lStepScroll As Long
    
    If b_scrollMem_correction Then
        b_scrollMem_correction = False
        Exit Sub
    End If
    
    lStepScroll = CLng(scrollMem.Value) - CLng(Val(scrollMem.Tag))
    
    scrollMem.Tag = scrollMem.Value
    
    
    If scrollMem.Value = 0 Then
        b_scrollMem_correction = True
        scrollMem.Value = 2
        scrollMem.Tag = "2"
        Exit Sub
    End If
    
    If scrollMem.Value = 32767 Then
        b_scrollMem_correction = True
        scrollMem.Value = 32765
        scrollMem.Tag = "32765"
        Exit Sub
    End If



    ' Debug.Print "c:" & lStepScroll
    
    ' ok! now that's better!

    Dim L As Long
    L = lStartMemAddress + lStepScroll
    If L >= 0 And L <= MAX_MEMORY Then
        showMemory L
    End If
    
    
    Exit Sub
err1:
    Debug.Print "err233:" & Err.Description
End Sub


' Private Sub sliderSTEPDELAY_Change()
Private Sub scrollStepDelay_Change()

On Error Resume Next ' 4.00-Beta-3

    ' 1.21 update #159
    ' This complex way of setting the Interval, is done
    ' because I want to get the following values:
    ' 0, 1, 100, 200, 300, ..., 9000 (ms).
    ' (scroll.min=0 scroll.max=91).
    ' default value=2 (100ms).
    
    ' 31-July-2003!
    ' I made it scroll.max=11
    ' what needs 9 seconds delays???
    
    
'#1138 BETTER FIX!
''''    ' March 12, 2004
''''    ' strange behaviour noticed when execution speed
''''    ' is changed while waiting for input....
''''    If b_LOADED_frmScreen Then
''''        If frmScreen.timerInput.Enabled Then
''''            bUpdateStepSpeed = True
''''            Exit Sub
''''        End If
''''    End If
    
    
    ' 2.51#714
    Dim bSTART_AGAIN As Boolean
    bSTART_AGAIN = False
    If timerStep.Enabled Or bTURBO_MODE Then
        stopAutoStep  ' to make sure not one is hurt.
        bSTART_AGAIN = True
        DoEvents
    End If
    
    
    'If sliderSTEPDELAY.Value = 0 Then
    If scrollStepDelay.Value = 0 Then
        timerStep.Interval = 0 ' "TURBO".
    Else
        'timerStep.Interval = (sliderSTEPDELAY.Value - 1) * 100
        timerStep.Interval = (scrollStepDelay.Value) '* 100
        If timerStep.Interval = 0 Then
            timerStep.Interval = 1  ' 1 ms (the fastest except "TURBO MODE").
        End If
    End If
    
    lblStepTime.Caption = cMT("step delay:") & " " & timerStep.Interval ' 2.09#569
    
    
    ' 2.51#714
    If bSTART_AGAIN Then
       DoEvents
       chkAutoStep.Value = vbChecked
    End If
    
End Sub





Private Sub scrollSTEPDELAY_Scroll()
On Error Resume Next ' 4.00-Beta-3
    scrollStepDelay_Change
End Sub







' 1.17
Private Sub timerINT15_86_Timer()
On Error Resume Next ' 4.00-Beta-3
    timerINT15_86.Enabled = False
End Sub


Private Sub cmdDOS_Click()
On Error Resume Next
    frmScreen.DoShowMe
End Sub



Private Sub chkAutoStep_Click()

On Error Resume Next ' 4.00-Beta-3

    If (chkAutoStep.Value = vbChecked) Then
        
        
        ' 1.27#339
        If bTERMINATED Then
            bRUN_AFTER_RELOAD = True
        End If
        
        
        timerStep.Enabled = True
        ' 2.55#721
        chkAutoStep.Caption = "" 'cMT("Stop") ' 2.09#569
           

        ' 1.21
        '2.51#714  scrollStepTime.Enabled = False
        
        ' 1.20
        frmScreen.bFIRST_TIME_SHOW_SCREEN = True
    
        ' 1.25
        '#1144 reset_SHOWN_FIRST_TIME_for_DEVICES
    
        ' turbo mode!
        If timerStep.Interval = 0 Then
        ' to avoid keeping unreturned sub here,
        ' I'm using another timer to start a loop:
            timerStartTurboMode.Enabled = True
        End If
        
    Else
        timerStep.Enabled = False
        bTURBO_MODE = False
        chkAutoStep.Caption = cMT("run") ' 2.09#569
        
        ' 1.21
        '2.51#714  - it is always enabled!
        ' scrollStepTime.Enabled = True
        
        ' 1.25#294 reset some globals:
        bDO_STOP_AT_LINE_HIGHLIGHT_CHANGE = False
        bDO_STEP_OVER_PROCEDURE = False
        'bugfix1.27#344  - will be better without it' bRun_UNTIL_SELECTED = False
        
        ' Debug.Print "stopped!!"
        
         ' #327r-stopeverything# let's try without it...
         ' execution should not be stoped on int 21h/39h error when dir already exists!
         ' only occurs when "run" is pressed.
         ' #327r-stopeverything# '
       ' #327s-load-in-input-mode-bug+correction# '  bSTOP_EVERYTHING = True ' #327r-stopeverything# decided to leave it here! instead removed "exit sub" out of doStep() !
        ' #327s-load-in-input-mode-bug+correction# decided to remove it again, because now it doesn't allow to run over it with it.
        
    End If
End Sub

Private Sub Form_Load()

On Error GoTo err1

   If Load_from_Lang_File(Me) Then Exit Sub
    
    sDefaultCaption = Me.Caption
            
    reset_CPU
    
    show_Registers
    
    reLOAD_EMULATOR
    
    'Recent_Set_Menus mnuRecent, sRECENT_EMULATOR

    bRUN_AFTER_RELOAD = False
    
    ' should be after setting the constr_txtDECODED_W and constr_txtDECODED_H:
    'GetWindowPos Me ' 2.05#551
    'GetWindowSize Me, 8595, 6450 ' 2.05#551 ' #1105  ' 3.27xr
        
    
    Exit Sub
err1:
    Debug.Print "err10001: " & Err.Description
    
    
End Sub

' resets everything except RAM and REGISTERS!
Private Sub reLOAD_EMULATOR()

On Error GoTo err1

    ' 1.10
    bTERMINATED = True ' not running!
    bSTOP_frmDEBUGLOG = True
    
    ' 1.20
    break_point_FLAG = False
        
    bRun_UNTIL_SELECTED = False
        
    ' 1.27 just in case:
    bDO_STEP_OVER_PROCEDURE = False
    lCOUNTER_ENTER_PROCEDURE = 0
        
    ' allow disassembling by default:
    b_Do_DISASSEMBLE = True
    
    ' 1.07
    prepareEMULATOR
 
    Dim i As Integer
    
    
    
    MemoryListClear
    ' #327xr-undesired1#  '  memory list is shown blank for some reason....
    '                       it seems hat it is requred for window to be visible to update picture box
    showMemory_at_Segment_Offset &H50, 0
    
    
    ' 1.23
    DoDisassembling &H500, True, &H50, 0  ' 1.25#309 0, &H500
    
    
    Me.Caption = sDefaultCaption
        
    ' 1.12
    setFloppyDriveNumber
    
    
    Reset_registers_highlight ' 2.05#549
    
    ResetStepBackRecording
    
    Exit Sub
err1:
    Debug.Print "ERR:##1277 : " & Err.Description
    On Error Resume Next
    
End Sub

' 1.21
Private Sub timerStartTurboMode_Timer()
On Error Resume Next ' 4.00-Beta-3
    timerStartTurboMode.Enabled = False
    bTURBO_MODE = True
    timerStep_Timer
End Sub

Private Sub timerStep_Timer()

On Error Resume Next ' 4.00-Beta-3

    If bTERMINATED Then
        If ask_TO_RELOAD() Then ' user says "YES - reload"
        
            Exit Sub ' will start "Runing" after reload, so exit.
            
        Else
            ' user says "NO, don't reload"
        End If
    End If
    

    ' turbo mode?
    ' If timerStep.Interval = 0 Then
    If bTURBO_MODE Then              ' 2.51#714
    
        ' Do While timerStep.Enabled
        Do While bTURBO_MODE    ' 2.51#714
            
            ' #327u-hw-int#
            If frmFLAGS.cbIF.ListIndex = 1 Then check_for_harware_interrupt
            
            PROCESS_SINGLE_STEP
            
            DoEvents
            If bSTOP_EVERYTHING Then Exit Sub

        Loop
    
    Else
    
        ' #327u-hw-int#
        If frmFLAGS.cbIF.ListIndex = 1 Then check_for_harware_interrupt
        
        
        PROCESS_SINGLE_STEP
                
    End If
    
End Sub

Public Sub stopAutoStep()

On Error GoTo err1

    chkAutoStep.Value = vbUnchecked
    timerStep.Enabled = False
    bTURBO_MODE = False
    
    Exit Sub
err1:
    Debug.Print "ERR:## sas : " & Err.Description
    Resume Next
End Sub


' updates SI according to DF
' DF=0  ->   SI + iSize
' DF=1  ->   SI - iSize
Private Sub update_SI_acc_DF(iSize As Integer)
    
On Error GoTo err1
    
' 1.20
'''        If iSize = 1 Then
'''
'''            If frmFLAGS.cbDF.ListIndex = 0 Then
'''                ' 1.20 ALU.inc_WORD SI, False
'''                SI = mathAdd_WORDS(SI, 1)
'''            Else
'''                ' 1.20 ALU.dec_WORD SI, False
'''                SI = mathSub_WORDS(SI, 1)
'''            End If
'''            ' 1.20 SI = ALU.GET_C_SIGNED
'''
'''        Else
'''
'''            If frmFLAGS.cbDF.ListIndex = 0 Then
'''                ALU.add_WORDS SI, iSize, False
'''            Else
'''                ALU.sub_WORDS SI, iSize, False
'''            End If
'''            SI = ALU.GET_C_SIGNED
'''
'''        End If
        
            If frmFLAGS.cbDF.ListIndex = 0 Then
                SI = mathAdd_WORDS(SI, iSize)
            Else
                SI = mathSub_WORDS(SI, iSize)
            End If
            
    Exit Sub
err1:
    Debug.Print "ERR:##si : " & Err.Description
        
End Sub

' updates DI according to DF
' DF=0  ->   DI + iSize
' DF=1  ->   DI - iSize
Private Sub update_DI_acc_DF(iSize As Integer)
    
On Error GoTo err1
    
' 1.20
'''        If iSize = 1 Then
'''
'''            If frmFLAGS.cbDF.ListIndex = 0 Then
'''                ALU.inc_WORD DI, False
'''            Else
'''                ALU.dec_WORD DI, False
'''            End If
'''            DI = ALU.GET_C_SIGNED
'''
'''        Else
'''
'''            If frmFLAGS.cbDF.ListIndex = 0 Then
'''                ALU.add_WORDS DI, iSize, False
'''            Else
'''                ALU.sub_WORDS DI, iSize, False
'''            End If
'''            DI = ALU.GET_C_SIGNED
'''
'''        End If
        
            If frmFLAGS.cbDF.ListIndex = 0 Then
                DI = mathAdd_WORDS(DI, iSize)
            Else
                DI = mathSub_WORDS(DI, iSize)
            End If
            
    Exit Sub
err1:
    Debug.Print "ERR:##di : " & Err.Description
End Sub

Private Sub dec_CX()

On Error GoTo err1

    Dim it1 As Integer
    
    it1 = mathSub_WORDS(to16bit_SIGNED(CL, CH), 1)
    
    CL = math_get_low_byte_of_word(it1)
    
    CH = math_get_high_byte_of_word(it1)
    
    
    Exit Sub
err1:
    Debug.Print "ERR:### : " & Err.Description
    
End Sub

Private Sub txtAH_Change()

On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtAH.ForeColor = vbBlue
    txtAH.BackColor = vbWhite
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    AH = Val("&H" & txtAH.Text)
    
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "AX"
    End If
End Sub

Private Sub txtAH_DblClick()

On Error Resume Next ' 4.00-Beta-3

'''     frmHexCalculator.Show
'''     frmHexCalculator.txtHEX_16bit.Text = txtAH.Text & make_min_len(txtAL.Text, 2, "0")
'''     frmHexCalculator.txtHEX_8bit.Text = txtAH.Text
'''     frmHexCalculator.Update_from_Hex
'''
    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "AX"
End Sub

Private Sub txtAH_GotFocus()
On Error Resume Next ' #3.27xl
    With txtAH
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtAL_Change()

On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtAL.ForeColor = vbBlue
    txtAL.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    AL = Val("&H" & txtAL.Text)
    
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "AX"
    End If
End Sub

Private Sub txtAL_DblClick()
'''     frmHexCalculator.Show
'''     frmHexCalculator.txtHEX_16bit.Text = txtAH.Text & make_min_len(txtAL.Text, 2, "0")
'''     frmHexCalculator.txtHEX_8bit.Text = txtAL.Text
'''     frmHexCalculator.Update_from_Hex

    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "AX"
    
End Sub

Private Sub txtAL_GotFocus()
On Error Resume Next ' #3.27xl
    With txtAL
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtBH_Change()

On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtBH.ForeColor = vbBlue
    txtBH.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    BH = Val("&H" & txtBH.Text)
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "BX"
    End If
End Sub

Private Sub txtBH_DblClick()
''''     frmHexCalculator.Show
''''     frmHexCalculator.txtHEX_16bit.Text = txtBH.Text & make_min_len(txtBL.Text, 2, "0")
''''     frmHexCalculator.txtHEX_8bit.Text = txtBH.Text
''''     frmHexCalculator.Update_from_Hex

On Error Resume Next ' 4.00-Beta-3

    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "BX"
End Sub

Private Sub txtBH_GotFocus()
On Error Resume Next ' #3.27xl
    With txtBH
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtBL_Change()

On Error Resume Next ' 4.00-Beta-3
    ' 2.05#549
    txtBL.ForeColor = vbBlue
    txtBL.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    BL = Val("&H" & txtBL.Text)
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "BX"
    End If
End Sub

Private Sub txtBL_DblClick()

On Error Resume Next ' 4.00-Beta-3

''''     frmHexCalculator.Show
''''     frmHexCalculator.txtHEX_16bit.Text = txtBH.Text & make_min_len(txtBL.Text, 2, "0")
''''     frmHexCalculator.txtHEX_8bit.Text = txtBL.Text
''''     frmHexCalculator.Update_from_Hex
''''
    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "BX"
End Sub

Private Sub txtBL_GotFocus()
On Error Resume Next ' #3.27xl
    With txtBL
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtBP_Change()

On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtBP.ForeColor = vbBlue
    txtBP.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    BP = Val("&H" & txtBP.Text)
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "BP"
    End If
End Sub

Private Sub txtBP_DblClick()

On Error Resume Next ' 4.00-Beta-3

'''''     frmHexCalculator.Show
'''''     frmHexCalculator.txtHEX_16bit.Text = txtBP.Text
'''''     If frmHexCalculator.opt8bit.Value Then frmHexCalculator.opt16bit.Value = True
'''''     frmHexCalculator.Update_from_Hex

    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "BP"
End Sub

Private Sub txtBP_GotFocus()
On Error Resume Next ' #3.27xl
    With txtBP
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtCH_Change()


On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtCH.ForeColor = vbBlue
    txtCH.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    CH = Val("&H" & txtCH.Text)
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "CX"
    End If
End Sub

Private Sub txtCH_DblClick()

On Error Resume Next ' 4.00-Beta-3

''''     frmHexCalculator.Show
''''     frmHexCalculator.txtHEX_16bit.Text = txtCH.Text & make_min_len(txtCL.Text, 2, "0")
''''     frmHexCalculator.txtHEX_8bit.Text = txtCH.Text
''''     frmHexCalculator.Update_from_Hex

    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "CX"
End Sub

Private Sub txtCH_GotFocus()
On Error Resume Next ' #3.27xl
    With txtCH
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtCL_Change()


On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtCL.ForeColor = vbBlue
    txtCL.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    CL = Val("&H" & txtCL.Text)
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "CX"
    End If
End Sub

Private Sub txtCL_DblClick()

On Error Resume Next ' 4.00-Beta-3

''''     frmHexCalculator.Show
''''     frmHexCalculator.txtHEX_16bit.Text = txtCH.Text & make_min_len(txtCL.Text, 2, "0")
''''     frmHexCalculator.txtHEX_8bit.Text = txtCL.Text
''''     frmHexCalculator.Update_from_Hex

    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "CX"
End Sub

Private Sub txtCL_GotFocus()
On Error Resume Next ' #3.27xl
    With txtCL
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtCS_Change()


On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtCS.ForeColor = vbBlue
    txtCS.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    CS = Val("&H" & txtCS.Text)
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "CS"
    End If
    
    ' 1.27#342
    mnuSelect_lines_at_CS_IP_Click
End Sub

Private Sub txtCS_DblClick()

On Error Resume Next ' 4.00-Beta-3

''''     frmHexCalculator.Show
''''     frmHexCalculator.txtHEX_16bit.Text = txtCS.Text
''''     If frmHexCalculator.opt8bit.Value Then frmHexCalculator.opt16bit.Value = True
''''     frmHexCalculator.Update_from_Hex

    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "CS"
End Sub

Private Sub txtCS_GotFocus()
On Error Resume Next ' #3.27xl
    With txtCS
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtDH_Change()


On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtDH.ForeColor = vbBlue
    txtDH.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    DH = Val("&H" & txtDH.Text)
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "DX"
    End If
End Sub

Private Sub txtDH_DblClick()

On Error Resume Next ' 4.00-Beta-3

'''''     frmHexCalculator.Show
'''''     frmHexCalculator.txtHEX_16bit.Text = txtDH.Text & make_min_len(txtDL.Text, 2, "0")
'''''     frmHexCalculator.txtHEX_8bit.Text = txtDH.Text
'''''     frmHexCalculator.Update_from_Hex

    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "DX"
End Sub

Private Sub txtDH_GotFocus()
On Error Resume Next ' #3.27xl
    With txtDH
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtDI_Change()

On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtDI.ForeColor = vbBlue
    txtDI.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    DI = Val("&H" & txtDI.Text)
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "DI"
    End If
End Sub

Private Sub txtDI_DblClick()

On Error Resume Next ' 4.00-Beta-3

''''     frmHexCalculator.Show
''''     frmHexCalculator.txtHEX_16bit.Text = txtDI.Text
''''     If frmHexCalculator.opt8bit.Value Then frmHexCalculator.opt16bit.Value = True
''''     frmHexCalculator.Update_from_Hex

    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "DI"
End Sub

Private Sub txtDI_GotFocus()
On Error Resume Next ' #3.27xl
    With txtDI
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub









Private Sub txtDisAddr_GotFocus()
On Error Resume Next

    With txtDisAddr
        
        Dim L As Long
        L = InStr(1, .Text, ":")
        
        If L > 0 Then
            If .SelStart > L Then
                .SelStart = L
                .SelLength = Len(.Text) - L
            Else
                .SelStart = 0
                .SelLength = L - 1
            End If
        Else
            .SelStart = 0
            DoEvents
            .SelLength = Len(.Text)
        End If
        
    End With
End Sub


Private Sub txtDisAddr_KeyPress(KeyAscii As Integer)
On Error Resume Next
    If KeyAscii = 13 Then
        KeyAscii = 0
        DO_DISASSEBLE_FROM_HEX_ADDR_FRM_EMULATION
        
        ' reset it on the middle
        b_scrollDis_correction = True
        scrollDis.Value = 17000
        scrollDis.Tag = "17000"
    End If
End Sub


Private Sub txtDL_Change()

On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtDL.ForeColor = vbBlue
    txtDL.BackColor = vbWhite
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    DL = Val("&H" & txtDL.Text)
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "DX"
    End If
    
End Sub

Private Sub txtDL_DblClick()
''''     frmHexCalculator.Show
''''     frmHexCalculator.txtHEX_16bit.Text = txtDH.Text & make_min_len(txtDL.Text, 2, "0")
''''     frmHexCalculator.txtHEX_8bit.Text = txtDL.Text
''''     frmHexCalculator.Update_from_Hex

On Error Resume Next ' 4.00-Beta-3

    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "DX"
End Sub

Private Sub txtDL_GotFocus()
On Error Resume Next ' #3.27xl
    With txtDL
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtDS_Change()

On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtDS.ForeColor = vbBlue
    txtDS.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    DS = Val("&H" & txtDS.Text)
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "DS"
    End If
End Sub

Private Sub txtDS_DblClick()
''''     frmHexCalculator.Show
''''     frmHexCalculator.txtHEX_16bit.Text = txtDS.Text
''''     If frmHexCalculator.opt8bit.Value Then frmHexCalculator.opt16bit.Value = True
''''     frmHexCalculator.Update_from_Hex


On Error Resume Next ' 4.00-Beta-3

    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "DS"
End Sub

Private Sub txtDS_GotFocus()
On Error Resume Next ' #3.27xl
    With txtDS
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtES_Change()


On Error Resume Next ' 4.00-Beta-3


    ' 2.05#549
    txtES.ForeColor = vbBlue
    txtES.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    ES = Val("&H" & txtES.Text)
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "ES"
    End If
End Sub

Private Sub txtES_DblClick()
''''     frmHexCalculator.Show
''''     frmHexCalculator.txtHEX_16bit.Text = txtES.Text
''''     If frmHexCalculator.opt8bit.Value Then frmHexCalculator.opt16bit.Value = True
''''     frmHexCalculator.Update_from_Hex


On Error Resume Next ' 4.00-Beta-3


    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "ES"
End Sub

Private Sub txtES_GotFocus()
On Error Resume Next ' #3.27xl
    With txtES
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtIP_Change()


On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtIP.ForeColor = vbBlue
    txtIP.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    IP = Val("&H" & txtIP.Text)
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "IP"
    End If
    
    ' 1.27#342
    mnuSelect_lines_at_CS_IP_Click
End Sub

Private Sub txtIP_DblClick()
''''     frmHexCalculator.Show
''''     frmHexCalculator.txtHEX_16bit.Text = txtIP.Text
''''     If frmHexCalculator.opt8bit.Value Then frmHexCalculator.opt16bit.Value = True
''''     frmHexCalculator.Update_from_Hex


On Error Resume Next ' 4.00-Beta-3


    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "IP"
End Sub

Private Sub txtIP_GotFocus()
On Error Resume Next ' #3.27xl
    With txtIP
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub




Private Sub txtIntegratedMemoryAddr_GotFocus()
On Error Resume Next

' #327xr-400-new-mem-list#
' a bit more advanced

    With txtIntegratedMemoryAddr
        
        Dim L As Long
        L = InStr(1, .Text, ":")
        
        If L > 0 Then
            If .SelStart > L Then
                .SelStart = L
                .SelLength = Len(.Text) - L
            Else
                .SelStart = 0
                .SelLength = L - 1
            End If
        Else
            .SelStart = 0
            DoEvents
            .SelLength = Len(.Text)
        End If
        
    End With
    
    
End Sub

Private Sub txtIntegratedMemoryAddr_KeyPress(KeyAscii As Integer)
On Error Resume Next
    If KeyAscii = 13 Then
        KeyAscii = 0
        '#400-RR#' showMemory getAddress_from_HEX_STRING(txtMemoryAddr.Text)
        showMemory get_physical_address_from_hex_ea(txtIntegratedMemoryAddr.Text)
        
        ' reset it on the middle
        b_scrollMem_correction = True
        scrollMem.Value = 17000
        scrollMem.Tag = "17000"
    End If
End Sub

Private Sub txtSI_Change()


On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtSI.ForeColor = vbBlue
    txtSI.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    SI = Val("&H" & txtSI.Text)
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "SI"
    End If
End Sub

Private Sub txtSI_DblClick()
'''''     frmHexCalculator.Show
'''''     frmHexCalculator.txtHEX_16bit.Text = txtSI.Text
'''''     If frmHexCalculator.opt8bit.Value Then frmHexCalculator.opt16bit.Value = True
'''''     frmHexCalculator.Update_from_Hex


On Error Resume Next ' 4.00-Beta-3

    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "SI"
End Sub

Private Sub txtSI_GotFocus()
On Error Resume Next ' #3.27xl
    With txtSI
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtSP_Change()

On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtSP.ForeColor = vbBlue
    txtSP.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    SP = Val("&H" & txtSP.Text)
    
    If b_LOADED_frmStack Then frmStack.setStackView
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "SP"
    End If
End Sub

Private Sub txtSP_DblClick()
''''     frmHexCalculator.Show
''''     frmHexCalculator.txtHEX_16bit.Text = txtSP.Text
''''     If frmHexCalculator.opt8bit.Value Then frmHexCalculator.opt16bit.Value = True
''''     frmHexCalculator.Update_from_Hex

On Error Resume Next ' 4.00-Beta-3

    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "SP"
End Sub

Private Sub txtSP_GotFocus()
On Error Resume Next ' #3.27xl
    With txtSP
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub


Private Sub txtSS_Change()

On Error Resume Next ' 4.00-Beta-3

    ' 2.05#549
    txtSS.ForeColor = vbBlue
    txtSS.BackColor = vbWhite
    
    
    If bSHOWING_REGISTERS Then Exit Sub
    
    SS = Val("&H" & txtSS.Text)
    
    If b_LOADED_frmStack Then frmStack.setStackView
    
    If bUPDATE_ExtendedRegisterView Then
        frmExtendedViewer.showRegister_if_selected "SS"
    End If
End Sub

' updates the list, also prevents errors:
Public Sub setMEMVALUE(lLoc As Long, bNEW_VAL As Byte, bNO_CHECK As Boolean)
On Error GoTo err1

    If bNO_CHECK Then
        updateMemoryList lLoc, bNEW_VAL
        Exit Sub
    End If

    If (lLoc <= lLastMemAddress) Then
         If (lLoc >= lStartMemAddress) Then
            updateMemoryList lLoc, bNEW_VAL
         End If
    End If
        
    Exit Sub
err1:
    Debug.Print "err 1244:" & Err.Description
End Sub

Private Sub txtSS_DblClick()
''''     frmHexCalculator.Show
''''     frmHexCalculator.txtHEX_16bit.Text = txtSS.Text
''''     If frmHexCalculator.opt8bit.Value Then frmHexCalculator.opt16bit.Value = True
''''     frmHexCalculator.Update_from_Hex

On Error Resume Next ' 4.00-Beta-3

    ' 1.25#304c
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.showRegister "SS"
End Sub

Private Sub txtSS_GotFocus()
On Error Resume Next ' #3.27xl
    With txtSS
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
End Sub


Private Sub JumpOut_of_doStep()

On Error GoTo err1

    If bAUTOMATIC_DISASM_AFTER_JMP_CALL Then
        ' show disassembled code:
        Dim lT1 As Long
        lT1 = to_unsigned_long(CS) * 16 + to_unsigned_long(IP)
        DoDisassembling lT1
        selectDisassembled_Line_by_ADDRESS lT1, BLUE_SELECTOR
    End If
    
    Exit Sub
err1:
    Debug.Print "ERR:### : " & Err.Description
    
End Sub

' 1.07
Private Sub prepareEMULATOR()
On Error GoTo err_on_prepare

    ' 1.25#307
    If LOAD_CUSTOM_MEMORY_MAP() Then Exit Sub
    


    Dim gFileNumber As Integer
    Dim sFilename As String
    Dim iPos As Long
    Dim j As Long
    Dim lFILE_SIZE As Long
    Dim tb As Byte

    ' ---------- load interupt vector -------
    '
    ' 1.10 loading also some parameters
    ' 0040h:0013h - WORD
    ' kilobytes of contiguous memory starting at
    ' absolute address 00000h
    
    gFileNumber = FreeFile
    
    sFilename = Add_BackSlash(App.Path) & "INT_VECT"
    
    If Not FileExists(sFilename) Then
        mBox Me, cMT("file not found:") & " " & sFilename
        Exit Sub
    End If
            
    Screen.MousePointer = vbHourglass
    ' avoid disassembling while loading:
    b_Do_DISASSEMBLE = False
            
    Open sFilename For Random Shared As gFileNumber Len = 1
    
        lFILE_SIZE = FileLen(sFilename)
    
        ' "1" because first index for Get is "1".
        iPos = 1
        
        ' table is loaded at 0000:0000
        j = 0
               
        Do While iPos <= lFILE_SIZE
            Get gFileNumber, iPos, tb
            RAM.mWRITE_BYTE j, tb
            iPos = iPos + 1
            j = j + 1
        Loop
    
    Close gFileNumber
    
    ' ---------- end of: load interupt vector -------
    
    
    ' ---------- load BIOS ROM -------
    
    gFileNumber = FreeFile
    
    ' 20140415
    sFilename = Add_BackSlash(App.Path) & "bios.futurama" '"BIOS_ROM"
    
    If Not FileExists(sFilename) Then
        mBox Me, cMT("file not found:") & " " & sFilename
        Exit Sub
    End If
    
    Screen.MousePointer = vbHourglass
    ' avoid disassembling while loading:
    b_Do_DISASSEMBLE = False
        
    Open sFilename For Random Shared As gFileNumber Len = 1
    
        lFILE_SIZE = FileLen(sFilename)
    
        ' "1" because first index for Get is "1".
        iPos = 1
        
'        ' BIOS ROM is loaded at FFFF:0000
'        j = &HFFFF0
               
        ' BIOS ROM is loaded at F400:0000
        j = &HF4000
               
        Do While iPos <= lFILE_SIZE
            Get gFileNumber, iPos, tb
            RAM.mWRITE_BYTE j, tb
            iPos = iPos + 1
            j = j + 1
        Loop
    
    Close gFileNumber
    
    ' ---------- end of: load BIOS ROM -------
    
    
    Screen.MousePointer = vbDefault
    b_Do_DISASSEMBLE = True
    
    
    CLOSE_ALL_VIRTUAL_FILES
    
    
    Exit Sub
err_on_prepare:
    Screen.MousePointer = vbDefault
    b_Do_DISASSEMBLE = True
    
    mBox Me, "emulator setup error: " & LCase(Err.Description)
End Sub

' 1.25#307
Private Function LOAD_CUSTOM_MEMORY_MAP() As Boolean

On Error GoTo err_lcmm

Dim sINFO_FILE As String

bDONT_UPDATE_SYS_INFO = False ' by default.

bDONT_CHECK_BIN_LOAD_ADR = False ' by default.


sINFO_FILE = Add_BackSlash(App.Path) & "custom_memory_map.inf"

If FileExists(sINFO_FILE) Then

    Screen.MousePointer = vbHourglass
    ' avoid disassembling while loading:
    b_Do_DISASSEMBLE = False
    
    Dim fNum As Integer
    Dim s As String
    Dim L As Long
    Dim L2 As Long
    Dim sT1 As String
    Dim st2 As String
    Dim sSegment As String
    Dim sOffset As String
    Dim lADR As Long
    
    fNum = FreeFile
    Open sINFO_FILE For Input Shared As fNum
    
    Do While Not EOF(fNum)
        
        Line Input #fNum, s
        
        If Left(Trim(s), 1) = ";" Then GoTo skip_line
        
        L = InStr(1, s, "-")
        
        If L > 0 Then
            sT1 = Trim(Mid(s, 1, L - 1)) ' address.
            
            st2 = Trim(Mid(s, L + 1)) ' filename.
            
            L2 = InStr(1, sT1, ":") ' check for something like FFFF:0001
            
            If L2 > 0 Then
                sSegment = Trim(Mid(sT1, 1, L2 - 1))
                sOffset = Trim(Mid(sT1, L2 + 1))
                lADR = to_unsigned_long(Val("&H" & sSegment)) * &H10 + to_unsigned_long(Val("&H" & sOffset))
            Else
                lADR = to_unsigned_long(Val("&H" & sT1))
            End If
            
            If Mid(st2, 2, 1) <> ":" Then
                st2 = Add_BackSlash(App.Path) & st2
            End If
            
            load_CUSTOM_file_to_RAM lADR, st2
            
        ElseIf InStr(1, s, "NO_SYS_INFO", vbTextCompare) > 0 Then
        
            bDONT_UPDATE_SYS_INFO = True
        
        End If
        
skip_line:
        
    Loop

    ' Close:
    Close fNum
    
    
    bDONT_CHECK_BIN_LOAD_ADR = True ' allow to load "*.bin" files to any address.
    

    LOAD_CUSTOM_MEMORY_MAP = True  ' loaded successfully.
    
    Screen.MousePointer = vbDefault
    b_Do_DISASSEMBLE = True
    
    mBox Nothing, cMT("custom memory map is loaded successfully.")

    
Else
    LOAD_CUSTOM_MEMORY_MAP = False
End If
    
    Exit Function
err_lcmm:
    mBox Me, "Error LOAD_CUSTOM_MEMORY_MAP:  & LCase(err.Description)"
    LOAD_CUSTOM_MEMORY_MAP = False
    Screen.MousePointer = vbDefault
    b_Do_DISASSEMBLE = True
End Function


Private Sub load_CUSTOM_file_to_RAM(lPHYSICAL_ADDRESS As Long, sFilename As String)

On Error GoTo err1

    Dim gFileNumber As Integer
    Dim lFILE_SIZE As Long
    Dim iPos As Long
    Dim j As Long
    Dim tb As Byte
    
    gFileNumber = FreeFile

    If Not FileExists(sFilename) Then
        mBox Nothing, cMT("file not found:") & " " & sFilename
        Exit Sub
    End If

    Open sFilename For Random Shared As gFileNumber Len = 1
    
        lFILE_SIZE = FileLen(sFilename)
    
        ' "1" because first index for Get is "1".
        iPos = 1
               
        j = lPHYSICAL_ADDRESS
               
        Do While iPos <= lFILE_SIZE
            Get gFileNumber, iPos, tb
            RAM.mWRITE_BYTE j, tb
            iPos = iPos + 1
            j = j + 1
        Loop
    
    Close gFileNumber
    
    Exit Sub
err1:
    Debug.Print "ERR:###123 : " & Err.Description
    
End Sub


' 1.11
Private Function load_BININFO_segment_offset(sFilename As String) As Boolean

On Error GoTo err_lpso

    Dim fNum As Integer
    Dim s As String
    Dim i As Integer
    
    ' 1.26
    If Not FileExists(sFilename) Then
        ' Debug.Print "binf file not found!"
        load_BININFO_segment_offset = False
        Exit Function
    End If
    
    fNum = FreeFile
    Open sFilename For Input Shared As fNum

    For i = 1 To 2
        Line Input #fNum, s
        Select Case i
        Case 1
            iSEGMENT_for_BIN = Val("&H" & s)
        Case 2
            iOFFSET_for_BIN = Val("&H" & s)
        End Select
    Next i


    ' Close:
    Close fNum
    '--------------------------------

    load_BININFO_segment_offset = True

    Exit Function
err_lpso:
    
    Debug.Print "Error on load_BININFO_segment_offset(" & sFilename & ") - " & LCase(Err.Description)
    On Error Resume Next ' 1.26
    
End Function

Function load_BININFO_all_registers(sFilename As String) As Boolean

On Error GoTo err_lpar

    Dim fNum As Integer
    Dim s As String
    Dim i As Integer
    
    fNum = FreeFile
    
    ' 1.26
    If Not FileExists(sFilename) Then
        ' Debug.Print "binf file not found!"
        load_BININFO_all_registers = False
        Exit Function
    End If
    
    
    Open sFilename For Input Shared As fNum

    For i = 1 To 19
        Line Input #fNum, s
        Select Case i
        Case 1
            ' skip. (load segment).
        Case 2
            ' skip. (load offset).
        Case 3
            AL = Val("&H" & s)
        Case 4
            AH = Val("&H" & s)
        Case 5
            BL = Val("&H" & s)
        Case 6
            BH = Val("&H" & s)
        Case 7
            CL = Val("&H" & s)
        Case 8
            CH = Val("&H" & s)
        Case 9
            DL = Val("&H" & s)
        Case 10
            DH = Val("&H" & s)
        Case 11
            DS = Val("&H" & s)
        Case 12
            ES = Val("&H" & s)
        Case 13
            SI = Val("&H" & s)
        Case 14
            DI = Val("&H" & s)
        Case 15
            BP = Val("&H" & s)
        Case 16
            CS = Val("&H" & s)
        Case 17
            IP = Val("&H" & s)
        Case 18
            SS = Val("&H" & s)
        Case 19
            SP = Val("&H" & s)
            
        End Select
    Next i


    ' Close:
    Close fNum
    '--------------------------------

    load_BININFO_all_registers = True

    Exit Function
err_lpar:
    
    Debug.Print "Error on load_BININFO_all_registers(" & sFilename & ") - " & LCase(Err.Description)
    On Error Resume Next ' 1.26
End Function


' #327u-ret=hlt#
' convert hex string to long
' can be physical or logical address
Private Function get_address_from_str(s As String) As Long
On Error GoTo err1

    Dim L As Long
    
    L = InStr(1, s, ":")
    
    If L <= 1 Then
        get_address_from_str = to_unsigned_long(Val("&H" & s))
    Else
        Dim sSegment As String
        Dim sOffset As String
        sSegment = Mid(s, 1, L - 1)
        sOffset = Mid(s, L + 1)
        get_address_from_str = to_unsigned_long(Val("&H" & sSegment)) * 16 + to_unsigned_long(Val("&H" & sOffset))
    End If

Exit Function
err1:
    Debug.Print "get_address_from_str: " & Err.Description
End Function

' #327u-ret=hlt# - load byte string into the memory
' using this format:
' xxxx,byte string.....-xxxx, another byte string.....
'
' all values in hex, xxxx - is physical address. or (xxxx:xxxx) logical address.
' "-" - separates the entries.
' spaces allowed inside.
Private Sub set_byte_string_to_phisical_memory(sMEMSET As String)

On Error GoTo err1

Dim sArr() As String

sArr = Split(sMEMSET, "-")


Dim i As Integer
For i = LBound(sArr) To UBound(sArr)

    Dim s As String
    Dim lPHISICAL_ADDESS As Long
    Dim sBYTE_STRING As String
    Dim L As Long
    
    
    s = sArr(i)
    
    L = InStr(1, s, ",")
    If L <= 1 Then
        Debug.Print "wrong sMEMSET in .binf - address missing "
        Exit Sub
    End If
    
    lPHISICAL_ADDESS = get_address_from_str(Trim(Mid(s, 1, L - 1)))
   
    
    sBYTE_STRING = Replace(Trim(Mid(s, L + 1)), " ", "")  ' remove spaces
    sBYTE_STRING = Replace(sBYTE_STRING, vbTab, "")   '                   and tabs if any...

    ' Debug.Print "writing bytes to RAM at phisical address: 0" & Hex(lPHISICAL_ADDESS) & "h"

    ' each byte has 2 hex chars
    ' assumed str len is even... ie 20 or 2, not 15 etc... - however it will not result in any serious error if it's odd.
    For L = 1 To Len(sBYTE_STRING) Step 2
        RAM.mWRITE_BYTE lPHISICAL_ADDESS, Val("&H" & Mid(sBYTE_STRING, L, 2))
        lPHISICAL_ADDESS = lPHISICAL_ADDESS + 1
    Next L


    ' Debug.Print "wrote until: 0" & Hex(lPHISICAL_ADDESS) & "h"

Next i


Erase sArr ' #327xp-erase#



Exit Sub
err1:
    mBox Me, "wrong record for MEM=... in .binf file" & vbNewLine & LCase(Err.Description)
End Sub


' 1.11
Private Sub store_all_register_values()
On Error GoTo err1
    storebuffer8bit(0) = AL
    storebuffer8bit(1) = AH
    storebuffer8bit(2) = BL
    storebuffer8bit(3) = BH
    storebuffer8bit(4) = CL
    storebuffer8bit(5) = CH
    storebuffer8bit(6) = DL
    storebuffer8bit(7) = DH

    storebuffer16bit(0) = DS
    storebuffer16bit(1) = ES
    storebuffer16bit(2) = SI
    storebuffer16bit(3) = DI
    storebuffer16bit(4) = BP
    storebuffer16bit(5) = CS
    storebuffer16bit(6) = IP
    storebuffer16bit(7) = SS
    storebuffer16bit(8) = SP
    
    
    Exit Sub
err1:
    Debug.Print "ERR:##112 : " & Err.Description
    
End Sub

' 1.11
Private Sub reStore_all_register_values()

On Error GoTo err1

    AL = storebuffer8bit(0)
    AH = storebuffer8bit(1)
    BL = storebuffer8bit(2)
    BH = storebuffer8bit(3)
    CL = storebuffer8bit(4)
    CH = storebuffer8bit(5)
    DL = storebuffer8bit(6)
    DH = storebuffer8bit(7)

    DS = storebuffer16bit(0)
    ES = storebuffer16bit(1)
    SI = storebuffer16bit(2)
    DI = storebuffer16bit(3)
    BP = storebuffer16bit(4)
    CS = storebuffer16bit(5)
    IP = storebuffer16bit(6)
    SS = storebuffer16bit(7)
    SP = storebuffer16bit(8)
    
    Exit Sub
err1:
    Debug.Print "ERR:##132 : " & Err.Description
    On Error Resume Next
End Sub

Private Sub updateMemory_at_410_and_floppy_menus()


' 1.25#307
If bDONT_UPDATE_SYS_INFO Then Exit Sub

'MEM 0040h:0010h - INSTALLED HARDWARE
'Size:   WORD
'SeeAlso: INT 11
'
'Bitfields for BIOS-detected installed hardware:
'Bit(s)  Description (Table M0006)
' 15-14  number of parallel devices
'    00 or 11 sometimes used to indicate four LPT ports
' 13 (Convertible, PS/2-55LS) internal modem
' 12 game port installed
' 11-9   number of serial devices
'    000 or 111 sometimes used to indicate eight COM ports
'8   reserved
' 7-6    number of floppy disk drives (minus 1)
' 5-4    initial video mode
'    00 EGA,VGA,PGA, or other with on-board video BIOS
'    01 40x25 CGA color
'    10 80x25 CGA color
'    11 80x25 mono text
' 3-2    (PC only) RAM on motherboard
'    00 = 16K, 01 = 32K, 10 = 48K, 11 = 64K
'    (some XTs) RAM on motherboard
'    00 = 64K, 01 = 128K, 10 = 192K, 11 = 256K
' 2  (pre-PS/2 except PC) reserved
'    (PS/2, some XT clones, newer BIOSes) pointing device installed
' 1  math coprocessor installed
' 0  floppy disk drives are installed
'    booted from floppy
'
'YUR: this value is set to:
' 0000000000100001b
'21  h

'==========================================
On Error GoTo err_uma

If floppyDriveNumber = 0 Then
    mBox Me, "cannot find FLOPPY_0 file!"
    ' 1.23#240
    mnuBootFromFloppy.Enabled = False
    mnuWriteBootRecord.Enabled = False
    Exit Sub
Else ' 1.23#240
    mnuBootFromFloppy.Enabled = True
    mnuWriteBootRecord.Enabled = True
End If


' we are modifying only 2 bits on first byte at 410h

Dim b As Byte
Dim b_mask As Byte
Dim b2 As Byte

b = RAM.mREAD_BYTE(&H410)

b2 = floppyDriveNumber - 1

' move 2 low bits to most upper position:
b2 = b2 * 64

' clear 2 high two bits:
b_mask = 63 ' 00111111 b
b = b And b_mask

' set number of floppy drives:
b = b Or b2

RAM.mWRITE_BYTE &H410, b


'----- set menus:

Dim i As Integer

For i = 0 To floppyDriveNumber - 1
    mnuBoot_from_FLOPPY_X(i).Visible = True
    mnuWriteBootRecord_FLOPPY_X(i).Visible = True
Next i

For i = floppyDriveNumber To 3
    mnuBoot_from_FLOPPY_X(i).Visible = False
    mnuWriteBootRecord_FLOPPY_X(i).Visible = False
Next i

'-------------------------------------------

Exit Sub

err_uma:
    Debug.Print "error on updateMemory_at_410_and_floppy_menus(): " & Err.Description
End Sub


' 1.12
Private Sub setFloppyDriveNumber()

On Error GoTo err1


    Dim i As Integer
    
    floppyDriveNumber = 0
    
    For i = 0 To 3
        If FileExists(Add_BackSlash(App.Path) & "FLOPPY_" & i) Then
            floppyDriveNumber = floppyDriveNumber + 1
        Else
            GoTo no_more_drive_files
        End If
    Next i
    
no_more_drive_files:
    updateMemory_at_410_and_floppy_menus
    
    
    Exit Sub
err1:
    Debug.Print "ERR:##323 : " & Err.Description
End Sub

' 1.20
Private Sub mnuDebug_Click()
On Error GoTo err_debug_click

' #327xr-400-new-mem-list#
'''''    Dim sT_CS_IP As String
'''''
'''''    Dim tCS As Integer
'''''    Dim tIP As Integer
'''''
'''''    ' used both for break point and run until selected:
'''''    tCS = to_signed_int(lMemoryListSegment)
'''''    tIP = to_signed_int(to_unsigned_long(lstMemory.ListIndex) + lMemoryListOffset)
'''''
'''''    ' 1.27#341
'''''    sT_CS_IP = make_min_len(Hex(tCS), 4, "0") & ":" & make_min_len(Hex(tIP), 4, "0")

    Dim sHEX_PADDR As String
    sHEX_PADDR = make_min_len(Hex(lYELLOW_SelectedMemoryLocation_FROM), 5, "0")


    If break_point_FLAG Then
       mnu_Set_BreakPoint.Enabled = False

       mnu_Clear_BreakPoint.Caption = cMT("clear break point") & " (" & make_min_len(Hex(lBREAK_POINT_ADDR), 5, "0") & "h)"
       
       mnu_Clear_BreakPoint.Enabled = True
        
       mnuShowBreakPoint.Enabled = True
    Else

       mnu_Set_BreakPoint.Enabled = True
       mnu_Set_BreakPoint.Caption = cMT("set break point") & " (" & sHEX_PADDR & "h)"
       mnu_Clear_BreakPoint.Enabled = False
       
       mnuShowBreakPoint.Enabled = False
    End If


    mnuRunUntilSelected.Caption = cMT("run until") & " (" & sHEX_PADDR & "h)"

    mnu_set_CS_IP_to_selected.Caption = cMT("set CS:IP to selected position") & " (" & sHEX_PADDR & "h)"

    mnuSingleStepBack.Enabled = cmdBack.Enabled





    Exit Sub
    
err_debug_click:
    
    Debug.Print "error on mnuDebug_Click: " & LCase(Err.Description)
End Sub

' 1.20
Private Sub mnu_Set_BreakPoint_Click()
On Error GoTo err1
    
    ' #327xr-400-new-mem-list#
    lBREAK_POINT_ADDR = lYELLOW_SelectedMemoryLocation_FROM

    break_point_FLAG = True
    
    Exit Sub
err1:
    Debug.Print "err1121: " & Err.Description
End Sub

' 1.20
Private Sub mnu_Clear_BreakPoint_Click()

On Error Resume Next ' 4.00-Beta-3

    break_point_FLAG = False
End Sub


' 1.20
Private Sub mnuShowBreakPoint_Click()

On Error GoTo err1

''''' copied from mnuSelect_lines_at_CS_IP_Click()
''''        Dim lTemp As Long
''''
''''        lTemp = to_unsigned_long(break_point_CS) * 16 + to_unsigned_long(break_point_IP)
        If sDEBUGED_file <> "" Then
            selectSourceLineAtLocation lBREAK_POINT_ADDR - lPROG_LOADED_AT_ADR, False
        End If

        ' in case memory list isn't at the right position, make it be there:
        selectMemoryLine_YELLOW lBREAK_POINT_ADDR, lBREAK_POINT_ADDR, True

        selectDisassembled_Line_by_ADDRESS lBREAK_POINT_ADDR, YELLOW_SELECTOR
        
        
        Exit Sub
err1:
        Debug.Print "err 1211: " & Err.Description
End Sub

' 1.20
Private Function stackPOP() As Integer

On Error GoTo err1

    Dim lPHYS_ADR As Long

    ' calculate SP+SS*16
    lPHYS_ADR = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
    
    ' get WORD AT register to SS:[SP]
    stackPOP = RAM.mREAD_WORD(lPHYS_ADR)

    ' increment SP by 2
    SP = mathAdd_WORDS(SP, 2)
    
    
    Exit Function
err1:
    Debug.Print "ERR:##1278 : " & Err.Description
    
End Function

' 1.20
Private Sub stackPUSH(iValue As Integer)

On Error GoTo err1

    Dim lPHYS_ADR As Long
        
    ' decrement SP by 2
    SP = mathSub_WORDS(SP, 2)
        
    ' calculate SP+SS*16
    lPHYS_ADR = to_unsigned_long(SP) + to_unsigned_long(SS) * 16
    
    ' Set SS:[SP] to iValue
    RAM.mWRITE_WORD_i lPHYS_ADR, iValue
    
    
    Exit Sub
err1:
    Debug.Print "ERR:##781 : " & Err.Description
End Sub

' #327u-hw-int#
Public Sub stackPUSH_PUBLIC(iValue As Integer)
On Error Resume Next ' 4.00-Beta-3
    stackPUSH iValue
End Sub

' 1.23
Private Sub mnuWriteBinFileToFloppy_Click()
On Error Resume Next ' 4.00-Beta-3
    frmWriteBinToFloppy.Show , Me
    
    ' v400-beta-7
    frmWriteBinToFloppy.txtPathToBinFile.Text = sOpenedExecutable
End Sub



Public Sub mnuSingleStep_Click_PUBLIC()
On Error Resume Next ' 4.00-Beta-3
    mnuSingleStep_Click
End Sub

' 1.23
Private Sub mnuSingleStep_Click()
On Error Resume Next ' 4.00-Beta-3
    cmdStep_Click
End Sub


' #400B11-NO-ESC!#
''''
''''' 1.24#275b
''''Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
''''On Error Resume Next ' 4.00-Beta-3
''''    If KeyCode = vbKeyEscape Then
''''            If chkAutoStep.Visible Then  ' #400b4-mini#5# it's ok!
''''                chkAutoStep.Value = vbUnchecked  ' STOP!!!!!
''''            Else
''''                cmdStopInput_Click               ' STOP input!!!!!
''''            End If
''''    End If
''''End Sub




' #400b6-int21h_33h_23h#
' same as Esc key sent to form, stop the input if any...
' AMSDOSPROG: This interrupt should never be issued directly.
Public Sub do_INT_21h_23h()
On Error Resume Next
   ' #400B11-NO-ESC!# ' Form_KeyDown vbKeyEscape, 0
   
    If chkAutoStep.Visible Then ' if visible then, it's run, if not then it's waiting for input...
        chkAutoStep.Value = vbUnchecked  ' STOP!!!!!
    Else
        cmdStopInput_Click               ' STOP input!!!!!
    End If
    
End Sub



'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'Int 21H                                                                [2.0]
'Function 33H (51)
'Get or set break flag, get boot drive
'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'
'  Obtains or changes the status of the operating system's break flag, which
'  influences Ctrl-C checking during function calls. Also returns the system
'  boot drive in version 4.0.
'
'Call with:
'
'  If getting break flag
'
'  AH            = 33H
'  AL            = 00H
'
'  If setting break flag
'
'  AH            = 33H
'  AL            = 01H
'  DL            = 00H       if turning break flag OFF
'                  01H       if turning break flag ON
'
'  [4] If getting boot drive
'
'  AH            = 33H
'  AL            = 05H
'
'Returns:
'
'  If called with AL = 00H or 01H
'
'  DL            = 00H       break flag is OFF
'                  01H       break flag is ON
'
'  [4] If called with AL = 05H
'
'  DL            = boot drive (1 = A, 2 = B, etc.)
'
'Notes:
'
'  þ When the system break flag is on, the keyboard is examined for a Ctrl-C
'    entry whenever any operating-system input or output is requested' if
'    Ctrl-C is detected, control is transferred to the Ctrl-C handler (Int
'    23H). When the break flag is off, MS-DOS only checks for a Ctrl-C entry
'    when executing the traditional character I/O functions (Int 21H
'    Functions 01H through 0CH).
'
'  þ The break flag is not part of the local environment of the currently
'    executing program' it affects all programs. An application that alters
'    the flag should first save the flag's original status, then restore the
'    flag before terminating.
'
'Example:
'
'  Save the current state of the system break flag in the variable brkflag,
'  then turn the break flag off to disable Ctrl-C checking during most MS-DOS
'  function calls.
'
'  brkflag db      0               ' save break flag
'          .
'          .
'          .
'                                  ' get current break flag
'          mov     ah,33h          ' function number
'          mov     al,0            ' AL = 0 to get flag
'          int     21h             ' transfer to MS-DOS
'          mov     brkflag,dl      ' save current flag
'
'                                  ' now set break flag
'          mov     ah,33h          ' function number
'          mov     al,1            ' AL = 1 to set flag
'          mov     dl,0            ' set break flag OFF
'          int     21h             ' transfer to MS-DOS
'          .
'          .
'          .
'


' #400b6-int21h_33h_23h#
Private Sub do_INT_21h_33h()
On Error Resume Next
    Select Case AL
    Case 0  ' getting break flag
        DL = byteBREAK_FLAG
    Case 1  ' setting break flag
        byteBREAK_FLAG = DL
    Case 5  ' getting boot drive
        DL = 1  ' boot drive (1 = A, 2 = B, etc.)
    Case Else
        Debug.Print "not supported INT 21h/33h AL=" & Hex(AL) & "h"
    End Select
End Sub


' 1.23
' all windows that are related to emulator (except frmScreen to avoid conflicts)
' should send HotKeys to emulator window
' for processing:
' for example F8 - single step.
'
' 1.24#281
' to enable hot keys for "User Screen", I made this sub to be a function.
' when any hotkey is pressed while not "Running" it is processed by this
' function and not processed by KeyDown event of frmScreen.
'
Public Function process_HotKey(KeyCode As Integer, Shift As Integer) As Boolean
On Error GoTo err_prhk

   process_HotKey = True
   
   Select Case KeyCode
   
   ' NOTE: IF YOU ADD MORE HOTKEYS ADD THEM TO IS_HOTKEY() as well!!!
   
   
   Case vbKeyF6 ' #1107b
   
        cmdBack_Click
   
   Case vbKeyF8
   
        If Shift = 0 Then                ' F8
        
            mnuSingleStep_Click
            
        ElseIf Shift And vbCtrlMask Then ' Ctrl + F8
        
            mnuRunUntilSelected_Click
        
        ElseIf Shift And vbShiftMask Then ' Shift + F8
        
          '  mnuStepOver_Click
        
        End If
        
   Case vbKeyF4
        
        mnuReLoad_Click
        
   Case vbKeyF9
   
        mnuRun_Click
        

' #400B11-NO-ESC!#
''''   Case vbKeyEscape
''''
''''        Form_KeyDown KeyCode, Shift



   Case vbKeyF1   ' 1.27#337
        mnuHelpTopics_Click
        
        
   Case vbKeyF7   ' 1.27
   
        If Shift = 0 Then                ' F7
        
            mnuSelect_lines_at_CS_IP_Click
            
        ElseIf Shift And vbCtrlMask Then ' Ctrl + Shift + F7
            If Shift And vbShiftMask Then
                mnu_set_CS_IP_to_selected_Click
            End If
        End If
        
   Case vbKeyF11
        mnuDebugLog_Click
   Case vbKeyF12
        mnuMS_DEBUG_Click
        
   Case Else
        process_HotKey = False
   End Select
   
   
   Exit Function
err_prhk:
   Debug.Print "process_HotKey: " & Err.Description
   process_HotKey = False
   
End Function












'Public Function IS_HotKey(KeyCode As Integer, Shift As Integer) As Boolean
'On Error GoTo err_prhk
'
'   IS_HotKey = False
'
'   Select Case KeyCode
'
'
'   Case vbKeyF6
'
'        IS_HotKey = True
'
'   Case vbKeyF8
'
'        If Shift = 0 Then                ' F8
'
'            IS_HotKey = True
'
'        ElseIf Shift And vbCtrlMask Then ' Ctrl + F8
'
'            IS_HotKey = True
'
'        ElseIf Shift And vbShiftMask Then ' Shift + F8
'
'            IS_HotKey = True
'
'        End If
'
'   Case vbKeyF4
'
'        IS_HotKey = True
'
'   Case vbKeyF9
'
'       IS_HotKey = True
'
'
'' #400B11-NO-ESC!#
''''''
''''''   Case vbKeyEscape
''''''
''''''        IS_HotKey = True
'
'   Case vbKeyF1   ' 1.27#337
'        IS_HotKey = True
'
'
'   Case vbKeyF7   ' 1.27
'
'        If Shift = 0 Then                ' F7
'
'            IS_HotKey = True
'
'        ElseIf Shift And vbCtrlMask Then ' Ctrl + Shift + F7
'            If Shift And vbShiftMask Then
'                IS_HotKey = True
'            End If
'        End If
'
'   Case vbKeyF11
'       IS_HotKey = True
'   Case vbKeyF12
'       IS_HotKey = True
'
'   End Select
'
'
'   Exit Function
'err_prhk:
'   Debug.Print "IS_HotKey " & Err.Description
'   IS_HotKey = False
'
'End Function
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
'
' 1.25
Private Sub mnuExtendedRegisterView_Click()
On Error Resume Next ' 4.00-Beta-3
    frmExtendedViewer.DoShowMe
End Sub

' 1.25
Private Function do_INB(lPORT_NUM As Long) As Boolean
            
On Error GoTo err1

        do_INB = True

        Select Case lPORT_NUM

            ' #1144
            Case 0 To 65535
                AL = READ_IO_BYTE(lPORT_NUM)
            
            
            Case Else ' I doubt it can happen....
                stopAutoStep
                mBox Me, "IN AL, " & toHexForm(lPORT_NUM) & " - " & "port not available in 8086!" & vbNewLine & _
                        cMT("refer to i/o ports in emu8086 documentation")
                         
                do_INB = False
        End Select
        
    Exit Function
err1:
    Debug.Print "ERR:### : " & Err.Description
        
End Function

' 1.25
Private Function do_INW(lPORT_NUM As Long) As Boolean

On Error GoTo err1

        do_INW = True
        
        Select Case lPORT_NUM
        
'        Case 4
'
'            AL = frmDEVICE_TrafficLights.getSTATUS_LOW_BYTE()
'            AH = frmDEVICE_TrafficLights.getSTATUS_HIGH_BYTE()
            
       ' #1144
       Case 0 To 65535
            AL = READ_IO_BYTE(lPORT_NUM)
            AH = READ_IO_BYTE(lPORT_NUM + 1)
                
        Case Else ' I'm not sure if it can happen

            stopAutoStep
            mBox Me, "IN AX, " & toHexForm(lPORT_NUM) & " - " & "port not available in 8086!" & vbNewLine & _
                         "refer to i/o ports in emu8086 documentation"
                         
            do_INW = False
            
        End Select
        
    Exit Function
err1:
    Debug.Print "ERR:### : " & Err.Description
        
End Function

' 1.25
Private Function do_OUTB(lPORT_NUM As Long) As Boolean
    
On Error GoTo err1

    do_OUTB = True
    
    

    
    
    Select Case lPORT_NUM
    
    ' #1144
    Case 0 To 65535
    
            If bAllowStepBack Then
                set_bOUT_for_STEPBACK lPORT_NUM, READ_IO_BYTE(lPORT_NUM)   ' read and keep previous port value!
            End If
    
            WRITE_IO_BYTE lPORT_NUM, AL

    
    Case Else

        stopAutoStep
        mBox Me, "OUT " & toHexForm(lPORT_NUM) & ", AL" & " - " & "port not available in 8086!" & vbNewLine & _
                         "refer to i/o ports in emu8086 documentation"
                         
        do_OUTB = False
    End Select
    
    
    Exit Function
err1:
    Debug.Print "ERR:###1 : " & Err.Description
    
End Function

' 1.25
Private Function do_OUTW(lPORT_NUM As Long) As Boolean

On Error GoTo err1

        do_OUTW = True
         
        Select Case lPORT_NUM

        ' #1144
        Case 0 To 65535
        
                If bAllowStepBack Then
                    set_wOUT_for_STEPBACK lPORT_NUM, READ_IO_WORD(lPORT_NUM)     ' read and keep previous port value!
                End If
                
        
                WRITE_IO_BYTE lPORT_NUM, AL
                WRITE_IO_BYTE lPORT_NUM + 1, AH
                
        Case Else
        
            stopAutoStep
            mBox Me, "OUT " & toHexForm(lPORT_NUM) & ", AX" & " - " & "not supported!" & vbNewLine & _
                         "refer to ""I/O ports"" in documentation."
                         
            do_OUTW = False
        End Select

    Exit Function
err1:
    Debug.Print "ERR:###2 : " & Err.Description
End Function

' 1.28#390
' returns -2 (to add to IP) only if previous command is
' REP/E/Z/NZ/NE/
Private Function step_BACK_to_prefix() As Integer
On Error GoTo err_sbtp

    Dim lTemp As Long
    
    
    
    ' check before current instruction (all string instructions
    ' take single byte):
    ' ' 2005-03-13 #1014.' lTemp = to_unsigned_long(CS) * 16 + to_unsigned_long(IP - 1)
     lTemp = to_unsigned_long(CS) * 16 + to_unsigned_long(IP) - 1
    
    
    
    
    
    
    ' step back only if prefix!
    If theMEMORY(lTemp) = &HF2 Or theMEMORY(lTemp) = &HF3 Then
    
        ' subtract 2 because later new IP value is calculated by:
        ' "+ addTO_IP + 1":
        step_BACK_to_prefix = -2
    
    Else
        ' some kind of error:
        bDoREP = False
        bDoREPNE = False
        
        bSEGMENT_REPLACEMENT = False ' 2005-03-13 ' #1013.
        
        step_BACK_to_prefix = 0
    End If
    
    
    Exit Function
err_sbtp:
    mBox Me, "step_BACK_to_prefix: " & LCase(Err.Description)
End Function



' 1.29#405
Private Sub mnuVariables_Click()
On Error Resume Next ' 4.00-Beta-3
    frmVars.DoShowMe
End Sub



' 1.30#411
Private Sub mnuStack_Click()
On Error Resume Next ' 4.00-Beta-3
    cmdStack_Click
End Sub

' 1.30#411
'Private Sub mnuActualSource_Click()
'On Error Resume Next ' 4.00-Beta-3
'    cmdShowActualSource_Click
'End Sub

' 1.30#411
Private Sub mnuUserScreen_Click()
On Error Resume Next ' 4.00-Beta-3
    cmdDOS_Click
End Sub

' 1.30#411
Private Sub mnuALU_Click()
On Error Resume Next ' 4.00-Beta-3
    cmdALU_Click
End Sub

' 1.30#411
Private Sub mnuFlags_Click()
On Error Resume Next ' 4.00-Beta-3
    cmdFlags_Click
End Sub

' 1.32#469
Public Function get_Step_Delay() As Integer
On Error GoTo err_gsd
        
        ' get_Step_Delay = sliderSTEPDELAY.Value
        get_Step_Delay = scrollStepDelay.Value
        
        Exit Function
err_gsd:
        Debug.Print "get_Step_Delay: " & LCase(Err.Description)
End Function

' 1.32#469
Public Sub set_Step_Delay(i As Integer)
On Error GoTo err_ssd

        ' should call to scrollStepTime_Change() automatically:
        'sliderSTEPDELAY.Value = i
        scrollStepDelay.Value = i
        
        Exit Sub
err_ssd:
        Debug.Print "set_Step_Delay: " & i & " : " & LCase(Err.Description)
End Sub


Public Sub Reset_registers_highlight_PUBLIC() ' #1095d
On Error Resume Next ' 4.00-Beta-3
    Reset_registers_highlight
End Sub

' 2.05#549
Private Sub Reset_registers_highlight()
    On Error GoTo err_rrh
        
        txtAH.ForeColor = vbWindowText
        txtAH.BackColor = vbWindowBackground
        
        txtAL.ForeColor = vbWindowText
        txtAL.BackColor = vbWindowBackground
        
        txtBH.ForeColor = vbWindowText
        txtBH.BackColor = vbWindowBackground
        
        txtBL.ForeColor = vbWindowText
        txtBL.BackColor = vbWindowBackground
        
        txtCH.ForeColor = vbWindowText
        txtCH.BackColor = vbWindowBackground
        
        txtCL.ForeColor = vbWindowText
        txtCL.BackColor = vbWindowBackground
        
        txtDH.ForeColor = vbWindowText
        txtDH.BackColor = vbWindowBackground
        
        txtDL.ForeColor = vbWindowText
        txtDL.BackColor = vbWindowBackground
        
        txtSP.ForeColor = vbWindowText
        txtSP.BackColor = vbWindowBackground
        
        txtBP.ForeColor = vbWindowText
        txtBP.BackColor = vbWindowBackground
        
        txtSI.ForeColor = vbWindowText
        txtSI.BackColor = vbWindowBackground
        
        txtDI.ForeColor = vbWindowText
        txtDI.BackColor = vbWindowBackground
        
        txtDS.ForeColor = vbWindowText
        txtDS.BackColor = vbWindowBackground
        
        txtES.ForeColor = vbWindowText
        txtES.BackColor = vbWindowBackground
        
        txtSS.ForeColor = vbWindowText
        txtSS.BackColor = vbWindowBackground
        
        txtCS.ForeColor = vbWindowText
        txtCS.BackColor = vbWindowBackground
        
        txtIP.ForeColor = vbWindowText
        txtIP.BackColor = vbWindowBackground
        
    Exit Sub
err_rrh:
    Debug.Print "Reset_registers_highlight: " & LCase(Err.Description)
    
End Sub

' 2.09#579
'Private Sub Set_VDevices_Menu()
'On Error GoTo err_svdm
'
'    Dim i As Integer
'
'    ' ' #327v-allow-java#
'    File1.Pattern = "*.exe;*.com;*.class;*.jar;*.bat"
'    File1.Path = Add_BackSlash(App.Path) & "DEVICES"
'    File1.Refresh
'
'For i = mnuExternalDevice.LBound To mnuExternalDevice.UBound
'        mnuExternalDevice(i).Visible = False
'    Next i
'
'    For i = 0 To File1.ListCount - 1
'        If i > mnuExternalDevice.UBound Then Load mnuExternalDevice(i)
'        mnuExternalDevice(i).Caption = File1.List(i)
'        mnuExternalDevice(i).Visible = True
'    Next i
'
'Exit Sub
'err_svdm:
'    Debug.Print "Set_VDevices_Menu: " & LCase(Err.Description)
'End Sub

' 2.09#579
'Private Sub mnuExternalDevice_Click(Index As Integer)
'On Error GoTo err_edc
'
'    Dim s As String
'    s = Add_BackSlash(App.Path) & "DEVICES\" & mnuExternalDevice(Index).Caption
'
'    If endsWith(s, ".class") Then  ' #327v-allow-java#
'        s = CutExtension(ExtractFileName(s))    ' must cut file path and extensions for java.exe
'        Call ShellExecute(Me.hwnd, "open", "java", s, Add_BackSlash(App.Path) & "\devices", SW_SHOWDEFAULT)
'    ElseIf endsWith(s, ".jar") Then  ' #327v-allow-java#
'        Call ShellExecute(Me.hwnd, "open", s, "", Add_BackSlash(App.Path) & "\devices", SW_SHOWDEFAULT)
'    Else
'        Shell s, vbNormalFocus
'    End If
'
'
'   Exit Sub
'err_edc:
'    MsgBox LCase(Err.Description)
'End Sub

' sets DX:AX to value of lValue
Public Sub set_DX_AX(lValue As Long)
On Error GoTo err1
    
    Dim sTemp As String
    Dim L1 As Long
    
    sTemp = Hex(lValue)
    
    
    sTemp = make_min_len(sTemp, 8, "0") ' make sure the value is 8 chars.
    L1 = Len(sTemp) ' should be 8 (I hope).
    
    AL = Val("&h" & Mid(sTemp, L1 - 1, 2))
    AH = Val("&h" & Mid(sTemp, L1 - 3, 2))
    DL = Val("&h" & Mid(sTemp, L1 - 5, 2))
    DH = Val("&h" & Mid(sTemp, L1 - 7, 2))
    
    Exit Sub
err1:
    Debug.Print "ERR? set_DX_AX: " & LCase(Err.Description)
End Sub



Private Sub cmdLog_Click() ' #1097
On Error GoTo err_mdl

   ' #327w-log-bug# ' mnuDebugLog.Checked = True

'   frmDebugLog.DoShowMe

    Exit Sub
err_mdl:
    Debug.Print "cmdLog_Click: " & LCase(Err.Description)
End Sub


Private Sub cmdVars_Click() ' #1097
On Error Resume Next
        frmVars.DoShowMe
End Sub




Private Sub cmdBack_Click() ' #1095

On Error Resume Next ' 4.00-Beta-3

    If Not cmdBack.Enabled Then Exit Sub ' in case it is called by F6 hotkey.

    If frmEmulation.picWaitingForInput.Visible Then
        cmdStopInput_Click
    End If

    bSTOP_EVERYTHING = True
  
    stopAutoStep
        
    DO_STEP_BACK
    
End Sub


Private Sub cmdReset_Click() ' #1114c

On Error GoTo err1: ' 3.27xo


    mnuResetEmulator_and_RAM_Click
    
    If sOpenedExecutable <> "" Then ' #327r-reset#
        mnuReLoad_Click
    End If
    
    

    
    
    
    Exit Sub
err1:
    Debug.Print "cmdReset_Click: " & Err.Description
    On Error Resume Next
    
End Sub

'''
'''Private Sub mnuOptions_Click()
'''On Error Resume Next ' 4.00-Beta-3
'''   b_frmOPTIONS_SHOWN_BY_EMULATOR = True
'''   ' #400b4-mini# - 12 ' frmOptions.Show vbModal, Me
'''   ' #400b4-mini# - 12 '
'''   frmOptions.Show , Me
'''End Sub

' #1187
Private Sub mnuCommandPrompt_Click()
On Error GoTo err1
    
    

    ' 4.00-Beta-7 move above :)
    ' 4.00-Beta-5
    ' before calling COMMAND PROMPT MUST RENAME ".com_" to ".com" etc....
    If Right(sOpenedExecutable, 1) = "_" Then
        COPY_FILE sOpenedExecutable, Mid(sOpenedExecutable, 1, Len(sOpenedExecutable) - 1)
    End If
        
    
    
    If FileExists(getSysPath & "cmd.exe") Then
    
        ' cmd seems to be more advaced, it supports automatic retyping, probably something else....
        ' it can be closed with a click on [x]
        Call ShellExecute(Me.hwnd, "open", "cmd", "", ExtractFilePath(sOpenedExecutable), SW_SHOWDEFAULT)
    
    Else
        ' command seems to be more 8.3
        ' here you must type exit
        Call ShellExecute(Me.hwnd, "open", "command", "", ExtractFilePath(sOpenedExecutable), SW_SHOWDEFAULT)
    
    End If
    
    

    
    
    Exit Sub
err1:
    mBox frmInfo, "command prompt: " & LCase(Err.Description)
End Sub

Private Sub mnuExternalRun_Click()
On Error Resume Next ' 4.00-Beta-3
   ' external_RUN sOpenedExecutable, Me, False
End Sub


Public Function get_AX() As Integer
On Error Resume Next ' 4.00-Beta-3
    get_AX = to16bit_SIGNED(AL, AH)
End Function




Public Function get_CX() As Integer
On Error Resume Next ' 4.00-Beta-3
    get_CX = to16bit_SIGNED(CL, CH)
End Function


Public Function get_AL() As Byte
    get_AL = AL
End Function



Public Function get_AH() As Byte
    get_AH = AH
End Function

Public Function get_BL() As Byte
    get_BL = BL
End Function

Public Function get_BH() As Byte
    get_BH = BH
End Function


Public Function get_CL() As Byte
    get_CL = CL
End Function

Public Function get_CH() As Byte
    get_CH = CH
End Function

Public Function get_DL() As Byte
    get_DL = DL
End Function

Public Function get_DH() As Byte
    get_DH = DH
End Function


'#1191  need these!
Public Function get_DX() As Integer
    get_DX = to16bit_SIGNED(DL, DH)
End Function

Public Function get_DS() As Integer
    get_DS = DS
End Function

Public Function get_IP() As Integer
    get_IP = IP
End Function

Public Sub set_IP(iVal As Integer)
    IP = iVal
End Sub

Public Function get_CS() As Integer
    get_CS = CS
End Function

Public Function get_ES() As Integer
    get_ES = ES
End Function

Public Function get_SS() As Integer
    get_SS = SS
End Function

Public Function get_SP() As Integer
    get_SP = SP
End Function


Public Sub set_CS(iVal As Integer)
    CS = iVal
End Sub

Public Function get_BX() As Integer
    get_BX = to16bit_SIGNED(BL, BH)
End Function

Public Function get_BP() As Integer
    get_BP = BP
End Function

Public Function get_SI() As Integer
    get_SI = SI
End Function

Public Function get_DI() As Integer
    get_DI = DI
End Function




Private Sub picDragger_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error GoTo err1:
    ssDraggerLeft = X
    
    Exit Sub
err1:
    Debug.Print "err: " & Err.Description
End Sub

Private Sub picDragger_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error GoTo err1:

    If Button = 1 Then
        
        Dim ssNewLeft As Single
        
        ssNewLeft = picDragger.Left + (X - ssDraggerLeft)
        
        ' don't alow it to go too far...
        If ssNewLeft < cmdStep.Left Then ssNewLeft = cmdStep.Left
        If ssNewLeft > Me.ScaleWidth - fraRegisters.Width Then ssNewLeft = Me.ScaleWidth - fraRegisters.Width
        
        
        picDragger.Left = ssNewLeft
        
        ALIGN_TO_DRAGGER
        
    End If
    
    
    Exit Sub
err1:
    Debug.Print "err: " & Err.Description
End Sub


Private Sub picDragger_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next ' 4.00-Beta-3
    ALIGN_TO_DRAGGER
    
     
End Sub

' v 3.27p
Private Sub ALIGN_TO_DRAGGER()
On Error GoTo err1
        picDisList.Left = picDragger.Left + picDragger.Width
        picDisList.Width = Me.ScaleWidth - picDisList.Left - 10
        
        picMemList.Width = Me.ScaleWidth - picMemList.Left - picDisList.Width - 10 - picDragger.Width
        
        
        If picDisList.Left > chkAutoStep.Left Then
            ' 4.00 cmdDisassemble.Left = picDisList.Left
            ' 4.00 txtDisSegment.Left = cmdDisassemble.Left
            txtDisAddr.Left = picDisList.Left + 525
            ' 4.00 lblDis_semicolumn.Left = txtDisSegment.Left + 810
            ' 4.00 txtDisOffset.Left = lblDis_semicolumn.Left + 195
        End If
        
        refreshMemoryList  ' 4.00
         
        refreshDisassembly ' #400b3-refresh-disassembly-on-ALIGN_TO_DRAGGER#
       
        Exit Sub
err1:
        Debug.Print "picDragger_MouseUp: " & Err.Description
End Sub


' #327w-more-debug-like#
' if nothing, then it's DS
Public Function get_SEGMENT_DISPLACEMENT() As String

On Error GoTo err1

If bSEGMENT_REPLACEMENT Then
    get_SEGMENT_DISPLACEMENT = sSEGMENT_REPLACEMENT_NAME
Else
    get_SEGMENT_DISPLACEMENT = "DS"
End If


    Exit Function
err1:
    Debug.Print "ERR:##5# : " & Err.Description
    
End Function


' 3.27xa
Private Sub timer_CLOSE_frmDebugLog_Timer()
On Error GoTo err1
        timer_CLOSE_frmDebugLog.Enabled = False
        'Unload frmDebugLog
        Exit Sub
err1:
        timer_CLOSE_frmDebugLog.Enabled = False
        Debug.Print "timer_CLOSE_frmDebugLog_Timer: " & Err.Description
End Sub


Public Sub set_AX(iVal As Integer)
On Error Resume Next ' 4.00-Beta-3
    AL = math_get_low_byte_of_word(iVal)
    AH = math_get_high_byte_of_word(iVal)
End Sub

Public Sub set_BX(iVal As Integer)
On Error Resume Next ' 4.00-Beta-3
    BL = math_get_low_byte_of_word(iVal)
    BH = math_get_high_byte_of_word(iVal)
End Sub

Public Sub set_CX(iVal As Integer)
On Error Resume Next ' 4.00-Beta-3
    CL = math_get_low_byte_of_word(iVal)
    CH = math_get_high_byte_of_word(iVal)
End Sub

Public Sub set_DX(iVal As Integer)
On Error Resume Next ' 4.00-Beta-3
    DL = math_get_low_byte_of_word(iVal)
    DH = math_get_high_byte_of_word(iVal)
End Sub

Public Sub set_SS(iVal As Integer)
    SS = iVal
End Sub

Public Sub set_SP(iVal As Integer)
    SP = iVal
End Sub

Public Sub set_BP(iVal As Integer)
    BP = iVal
End Sub

Public Sub set_SI(iVal As Integer)
    SI = iVal
End Sub

Public Sub set_DI(iVal As Integer)
    DI = iVal
End Sub

Public Sub set_ES(iVal As Integer)
    ES = iVal
End Sub

Public Sub set_DS(iVal As Integer)
    DS = iVal
End Sub

' #400b9-stupid#   start
Public Sub set_AL(bVal As Byte)
    AL = bVal
End Sub

Public Sub set_AH(bVal As Byte)
    AH = bVal
End Sub

Public Sub set_BL(bVal As Byte)
    BL = bVal
End Sub

Public Sub set_BH(bVal As Byte)
    BH = bVal
End Sub

Public Sub set_CL(bVal As Byte)
    CL = bVal
End Sub

Public Sub set_CH(bVal As Byte)
    CH = bVal
End Sub

Public Sub set_DL(bVal As Byte)
    DL = bVal
End Sub

Public Sub set_DH(bVal As Byte)
    DH = bVal
End Sub

''' #400b9-stupid#  end


'
' #400-emu-state#
' moved out of  loadFILEtoEMULATE()
' to enable shared use
Public Sub Reset_Before_Load_Anything()
    
    
On Error GoTo err1
    
    
    
   'bLOADING_FILE_TO_EMULATOR = True
    
    
    ' &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    If b_LOADED_frmMemory = True Then
        s_frmMemory_txtMemoryAddr = frmMemory.txtMemoryAddr.Text
        b_frmMemory_was_forced_unload = True
        Unload frmMemory
    Else
        b_frmMemory_was_forced_unload = False
    End If
    ' &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    
    
    
    
    
'#327r-reload#
''
''    ' 2.01#488
''    ' #1194x2 - addition and fix (probably)
''    If InStr(1, frm_mBox.txtMessage.Text, sPROGRAM_TERMINATED) > 0 Or _
''       InStr(1, frm_mBox.txtMessage.Text, sEMULATOR_HALTED) > 0 Or _
''       InStr(1, frm_mBox.txtMessage.Text, sPROGRAM_ABNORMALLY_TERMINATED) > 0 Then
''
' #327r-reload# - always hide msg box before load/reload!
    If frm_mBox.txtMessage.Text <> "" Then
            frm_mBox.txtMessage.Text = ""
            frm_mBox.Hide
    End If


    
    
    
    
    
    '  1.17 ====== reset some activities ====
    ' (just in case)


    ' #327-bug-step-over#
    bDO_STEP_OVER_PROCEDURE = False
    lCOUNTER_ENTER_PROCEDURE = 0
    bRUN_AFTER_RELOAD = False
    


    bSTOP_frmDEBUGLOG = True  ' it doesn't seem to be required.


    ' make sure nothing will be done after
    ' exiting the loop with DoEvents:
    bSTOP_EVERYTHING = True

    timerStep.Enabled = False
    bTURBO_MODE = False
    
    chkAutoStep.Value = vbUnchecked
    
    timerINT15_86.Enabled = False
    
    frmScreen.stopTimerInput





    ' it doesn't ' DoEvents ' hope this helps... #327s-load-in-input-mode-bug# .... it doesn't...




    uCHARS_IN_KB_BUFFER = 0
    frmScreen.show_uKB_BUFFER ' #1114
    
    ' should not do it here, since loops may not
    ' exit yet!!!
    ''''
    ''''    ' allow doing some code after loops
    ''''    ' DoEvents:
    ''''    bSTOP_EVERYTHING = False
    
    ' 1.20
    frmScreen.bFIRST_TIME_SHOW_SCREEN = True
    
    ' 1.25
    '#1144 reset_SHOWN_FIRST_TIME_for_DEVICES
    
    
    ' 1.20 #119b
    frmScreen.setDefaultCursorType

    ' 1.21 (because we exit from inputChar_NOECHO() before doing this
    '       on QueryUnload() because it causes form to be loaded again):
    picWaitingForInput.Visible = False
    cmdStep.Visible = True
    chkAutoStep.Visible = True
    
    
    ' 1.24 reset some globals:
    bDO_STOP_AT_LINE_HIGHLIGHT_CHANGE = False
    bDO_STEP_OVER_PROCEDURE = False
    
    If bDO_NOT_RESET_bRun_UNTIL Then ' #1067
        bDO_NOT_RESET_bRun_UNTIL = False
    Else
        bRun_UNTIL_SELECTED = False
    End If
    
    
    ' #1095
    If bAllowStepBack Then
        ResetStepBackRecording
    End If
    


    ' #400b6-memory-block#
    CLEAR_DOS_ALOC_MEMORY


    
    Exit Sub
err1:
    Debug.Print "reset before load: " & Err.Description
    Resume Next
End Sub

' #400-emu-state#
' moved out of  loadFILEtoEMULATE()
' to enable shared use
Sub Set_After_Load()
     On Error GoTo err1
     
     ' &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
     
        If b_frmMemory_was_forced_unload Then
            frmMemory.DoShowMe
            frmMemory.txtMemoryAddr.Text = s_frmMemory_txtMemoryAddr
            frmMemory.EMITATE_ShowMemory_Click
        End If
        
     ' &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
     
     Exit Sub
     
err1:
     Debug.Print "err: Set_After_Load: " & Err.Description
     
End Sub








'[SDEC_DEBUG_v120] Private Function get_EA_loc_and_size(ByRef bROW As Byte, ByVal currentByte As Long, ByRef bTEXT_DECODE_AS_BYTE As Boolean) As type_Size_and_Location
Private Function get_EA_loc_and_size(ByRef bROW As Byte, ByVal currentByte As Long) As type_Size_and_Location
    
On Error GoTo err1

    
    Dim iMEM_OFFSET As Integer ' 1.20
    Dim lMEM_Physical_ADR As Long
    
    Dim tb1 As Byte
    Dim tb2 As Byte
    Dim d16 As Integer  ' 1.20 --- Long     ' used as UNSIGNED INT.

    Dim lBytePointer As Long   ' starts with currentByte, then grows if required (to avoid modification of currentByte).
    
    '[SDEC_DEBUG_v120] Dim sTEXT_DECODED As String
    
    ' 1.20
    ' is set to "True" when
    ' iMEM_OFFSET  is set to register ID:
    Dim bIS_REGISTER As Boolean
    
    bIS_REGISTER = False
    
    lBytePointer = currentByte
        
    Select Case bROW

    ' [BX + SI]
    Case 0
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BX + SI]"
        
    ' [BX + DI]
    Case 1
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BX + DI]"
    
    ' [BP + SI]
    Case 2
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BP + SI]"
    
    ' [BP + DI]
    Case 3
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BP + DI]"
    
    ' [SI]
    Case 4
        iMEM_OFFSET = SI
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[SI]"
    
    ' [DI]
    Case 5
        iMEM_OFFSET = DI
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[DI]"
    
    ' d16 (simple var)
    Case 6
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        lBytePointer = lBytePointer + 1
        tb2 = RAM.mREAD_BYTE(lBytePointer)
        iMEM_OFFSET = to16bit_SIGNED(tb1, tb2)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[" & toHexForm(iMEM_OFFSET) & "]"
    
    ' [BX]
    Case 7
        iMEM_OFFSET = to16bit_SIGNED(BL, BH)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BX]"
    
    ' [BX + SI] + d8
    Case 8
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BX + SI] + " & toHexForm(tb1)
    
    ' [BX + DI] + d8
    Case 9
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BX + DI] + " & toHexForm(tb1)
    
    ' [BP + SI] + d8
    Case 10
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BP + SI] + " & toHexForm(tb1)
    
    ' [BP + DI] + d8
    Case 11
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BP + DI] + " & toHexForm(tb1)
    
    ' [SI] + d8
    Case 12
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        iMEM_OFFSET = mathAdd_WORDS(SI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[SI] + " & toHexForm(tb1)
    
    ' [DI] + d8
    Case 13
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        iMEM_OFFSET = mathAdd_WORDS(DI, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[DI] + " & toHexForm(tb1)
    
    ' [BP] + d8
    Case 14
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        iMEM_OFFSET = mathAdd_WORDS(BP, to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BP] + " & toHexForm(tb1)
        
    ' [BX] + d8
    Case 15
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), to_signed_byte(tb1))
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BX] + " & toHexForm(tb1)
    
    ' [BX + SI] + d16
    Case 16
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        lBytePointer = lBytePointer + 1
        tb2 = RAM.mREAD_BYTE(lBytePointer)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BX + SI] + " & toHexForm(d16)
    
    ' [BX + DI] + d16
    Case 17
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        lBytePointer = lBytePointer + 1
        tb2 = RAM.mREAD_BYTE(lBytePointer)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BX + DI] + " & toHexForm(d16)
    
    ' [BP + SI] + d16
    Case 18
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        lBytePointer = lBytePointer + 1
        tb2 = RAM.mREAD_BYTE(lBytePointer)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, SI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BP + SI] + " & toHexForm(d16)
    
    ' [BP + DI] + d16
    Case 19
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        lBytePointer = lBytePointer + 1
        tb2 = RAM.mREAD_BYTE(lBytePointer)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, DI)
        iMEM_OFFSET = mathAdd_WORDS(iMEM_OFFSET, d16)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BP + DI] + " & toHexForm(d16)
    
    ' [SI] + d16
    Case 20
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        lBytePointer = lBytePointer + 1
        tb2 = RAM.mREAD_BYTE(lBytePointer)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(SI, d16)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[SI] + " & toHexForm(d16)
    
    ' [DI] + d16
    Case 21
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        lBytePointer = lBytePointer + 1
        tb2 = RAM.mREAD_BYTE(lBytePointer)
        d16 = to16bit_SIGNED(tb1, tb2)
        ' 1.08 bug#27 iMEM_OFFSET = mathAdd_WORDS(SI, d16)
        iMEM_OFFSET = mathAdd_WORDS(DI, d16)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[DI] + " & toHexForm(d16)
    
    ' [BP] + d16
    Case 22
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        lBytePointer = lBytePointer + 1
        tb2 = RAM.mREAD_BYTE(lBytePointer)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(BP, d16)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BP] + " & toHexForm(d16)
    
    ' [BX] + d16
    Case 23
        lBytePointer = lBytePointer + 1
        tb1 = RAM.mREAD_BYTE(lBytePointer)
        lBytePointer = lBytePointer + 1
        tb2 = RAM.mREAD_BYTE(lBytePointer)
        d16 = to16bit_SIGNED(tb1, tb2)
        iMEM_OFFSET = mathAdd_WORDS(to16bit_SIGNED(BL, BH), d16)
        '[SDEC_DEBUG_v120] sTEXT_DECODED = "[BX] + " & toHexForm(d16)
    
    ' ew=AX   eb=AL
    Case 24
        iMEM_OFFSET = -8     ' not offset! (just register ID).
        bIS_REGISTER = True
        
    ' ew=CX   eb=CL
    Case 25
        iMEM_OFFSET = -7     ' not offset! (just register ID).
        bIS_REGISTER = True
        
    ' ew=DX   eb=DL
    Case 26
        iMEM_OFFSET = -6     ' not offset! (just register ID).
        bIS_REGISTER = True
        
    ' ew=BX   eb=BL
    Case 27
        iMEM_OFFSET = -5     ' not offset! (just register ID).
        bIS_REGISTER = True
        
    ' ew=SP   eb=AH
    Case 28
        iMEM_OFFSET = -4     ' not offset! (just register ID).
        bIS_REGISTER = True
        
    ' ew=BP   eb=CH
    Case 29
        iMEM_OFFSET = -3     ' not offset! (just register ID).
        bIS_REGISTER = True
        
    ' ew=SI   eb=DH
    Case 30
        iMEM_OFFSET = -2     ' not offset! (just register ID).
        bIS_REGISTER = True
        
    ' ew=DI   eb=BH
    Case 31
        iMEM_OFFSET = -1     ' not offset! (just register ID).
        bIS_REGISTER = True
        
    Case Else
        Debug.Print "ERROR CALLING get_EA_loc_and_size_BYTE(" & bROW & ")"
    End Select
    
    ' 1.20 If iMEM_OFFSET >= 0 Then
    If Not bIS_REGISTER Then
    
        '\\\\\\\\\\ calculate according to Segment prefix
        ' only when getting MEMORY BYTE not REGISTER!!!!
        lMEM_Physical_ADR = to_unsigned_long(iMEM_OFFSET) + get_SEGMENT_LOCATION(bROW)
        '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        
        '  BYTE/WORD prefix required if not register:
        '[SDEC_DEBUG_v120] If bTEXT_DECODE_AS_BYTE Then
            '[SDEC_DEBUG_v120] sDECODED = sDECODED & "BYTE PTR " & sTEXT_DECODED
        '[SDEC_DEBUG_v120] Else
            '[SDEC_DEBUG_v120] sDECODED = sDECODED & "WORD PTR " & sTEXT_DECODED
        '[SDEC_DEBUG_v120] End If
        
    Else
        ' a register!
        '[SDEC_DEBUG_v120] If bTEXT_DECODE_AS_BYTE Then
            '[SDEC_DEBUG_v120] sDECODED = sDECODED & g_bREGS(lMEM_POINTER + 8)
        '[SDEC_DEBUG_v120] Else
            '[SDEC_DEBUG_v120] sDECODED = sDECODED & g_wREGS(lMEM_POINTER + 8)
        '[SDEC_DEBUG_v120] End If
        
        ' 1.20
        ' automatic convertion to to_signed_long:
        lMEM_Physical_ADR = iMEM_OFFSET
    End If
    
    get_EA_loc_and_size.iSize = lBytePointer - currentByte + 1
    get_EA_loc_and_size.lLoc = lMEM_Physical_ADR



    Exit Function
err1:
    Debug.Print "ERR:###3 : " & Err.Description

End Function

















' returns TAB and ROW for EA BYTE:
Private Function get_eaROW_eaTAB(ByRef b_eaBYTE As Byte) As type_eaROW_eaTAB
    
On Error GoTo err1

    Dim i As Byte

    For i = 0 To 7
        If (get_ROW_INDEX_IN_EA(b_eaBYTE, i) <> 255) Then
            get_eaROW_eaTAB.bROW = get_ROW_INDEX_IN_EA(b_eaBYTE, i)
            get_eaROW_eaTAB.bTAB = i
            Exit For
        End If
    Next i
    
    ' never gets here! there is a value for any byte (0..255)
    
    
    Exit Function
err1:
    Debug.Print "ERR:###4 : " & Err.Description
End Function


' returns 255 when not found!
Private Function get_ROW_INDEX_IN_EA(ByRef bValue As Byte, ByRef bTAB As Byte) As Byte

On Error GoTo err1

    Dim i As Byte
    
    For i = 0 To 31
    
        If (gEA_TABLE_BT(bTAB, i) = bValue) Then
            get_ROW_INDEX_IN_EA = i
            Exit Function
        End If
        
    Next i
    
    get_ROW_INDEX_IN_EA = 255
    
    
    Exit Function
err1:
    Debug.Print "ERR:###44 : " & Err.Description
    
End Function































' 4.00b15
''//////////////////////////////// mInstructions186 /////////////////////////////


' C0 /0 ib   *ROL eb,ib      Rotate 8-bit EA byte left ib times
' C0 /1 ib   *ROR eb,ib      Rotate 8-bit EA byte right ib times
' C0 /2 ib   *RCL eb,ib      Rotate 9-bit quantity (CF, EA byte) left ib times
' C0 /3 ib   *RCR eb,ib      Rotate 9-bit quantity (CF, EA byte) right ib times
' C0 /4 ib   *SAL eb,ib      Multiply EA byte by 2, ib times
' C0 /4 ib   *SHL eb,ib      Multiply EA byte by 2, ib times
' C0 /5 ib   *SHR eb,ib      Unsigned divide EA byte by 2, ib times
' C0 /7 ib   *SAR eb,ib      Signed divide EA byte by 2, ib times
Private Sub do_instruction_C0(ByRef curByte As Long)
On Error GoTo err1

        ' cloned from doStep()

        Dim tb1 As Byte
        Dim tb2 As Byte
        Dim bTemp1 As Byte
    
        Dim mtRT As type_eaROW_eaTAB
        ' keeps return values of get_EA_loc_and_size_BYTE():
        Dim mtLOC_SIZE As type_Size_and_Location

        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        
        mtRT = get_eaROW_eaTAB(tb1)

        Select Case mtRT.bTAB
        
        Case 0
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize ' point to last processed byte.
                bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                ' using SHL with "-1" parameter makes a rotate:
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHL_BYTE bTemp1, tb2, -1
                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                

        Case 1
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize  ' point to last processed byte.
                bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                ' using SHR with "-1" parameter makes a rotate:
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHR_BYTE bTemp1, tb2, -1
                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                
        Case 2
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize  ' point to last processed byte.
                bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                ' using SHL with "-2" parameter makes a rotate through CF:
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHL_BYTE bTemp1, tb2, -2
                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()

        Case 3
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize ' point to last processed byte.
                bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                ' using SHR with "-2" parameter makes a rotate through CF:
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHR_BYTE bTemp1, tb2, -2
                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                
        Case 4
as_4:
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize  ' point to last processed byte.
                bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHL_BYTE bTemp1, tb2, 0
                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                
        Case 5
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize ' point to last processed byte.
                bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHR_BYTE bTemp1, tb2, 0
                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
                
        Case 6
                ' I'm not sure why it's both 4 and 6, the original comments from doStep() are not clear :)
                ' column 6 seems to be reserved.
                Debug.Print "weird.... C0 tab6"
                GoTo as_4
                
        Case 7
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize ' point to last processed byte.
                bTemp1 = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc)
                ' "5" parameter makes a signed shift:
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHR_BYTE bTemp1, tb2, 5
                RAM.mWRITE_BYTE mtLOC_SIZE.lLoc, ALU.GET_C_lb()
           
        End Select

Exit Sub
err1:
Debug.Print "do_instruction_C0: " & Err.Description
End Sub


Private Sub do_instruction_C1(ByRef curByte As Long)
On Error GoTo err1




        ' cloned from do_instruction_C0()

        Dim tb1 As Byte
        Dim tb2 As Byte
        Dim iTemp1 As Integer
    
        Dim mtRT As type_eaROW_eaTAB
        ' keeps return values of get_EA_loc_and_size_BYTE():
        Dim mtLOC_SIZE As type_Size_and_Location

        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)
        
        mtRT = get_eaROW_eaTAB(tb1)

        Select Case mtRT.bTAB
        
        Case 0
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize ' point to last processed byte.
                iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                ' using SHL with "-1" parameter makes a rotate:
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHL_WORD iTemp1, tb2, -1
                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                

        Case 1
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize  ' point to last processed byte.
                iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                ' using SHR with "-1" parameter makes a rotate:
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHR_WORD iTemp1, tb2, -1
                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                
        Case 2
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize  ' point to last processed byte.
                iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                ' using SHL with "-2" parameter makes a rotate through CF:
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHL_WORD iTemp1, tb2, -2
                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()

        Case 3
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize ' point to last processed byte.
                iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                ' using SHR with "-2" parameter makes a rotate through CF:
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHR_WORD iTemp1, tb2, -2
                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                
        Case 4
as_4:
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize  ' point to last processed byte.
                iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHL_WORD iTemp1, tb2, 0
                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                
        Case 5
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize ' point to last processed byte.
                iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHR_WORD iTemp1, tb2, 0
                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
                
        Case 6
                ' I'm not sure why it's both 4 and 6, the original comments from doStep() are not clear :)
                ' column 6 seems to be reserved.
                Debug.Print "weird.... C1 tab6"
                GoTo as_4
                
        Case 7
                mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
                curByte = curByte + mtLOC_SIZE.iSize ' point to last processed byte.
                iTemp1 = RAM.mREAD_WORD(mtLOC_SIZE.lLoc)
                ' "5" parameter makes a signed shift:
                tb2 = RAM.mREAD_BYTE(curByte)
                ALU.SHR_WORD iTemp1, tb2, 5
                RAM.mWRITE_WORD_i mtLOC_SIZE.lLoc, ALU.GET_C_SIGNED()
           
        End Select




Exit Sub
err1:
Debug.Print "do_instruction_C1: " & Err.Description
End Sub







' C8 iw 00   *ENTER iw,0     Make stack frame, iw bytes local storage, 0 levels
' C8 iw 01   *ENTER iw,1     Make stack frame, iw bytes local storage, 1 level
' C8 iw ib   *ENTER iw,ib    Make stack frame, iw bytes local storage, ib levels
Private Sub do_instruction_C8(ByRef curByte As Long)
On Error GoTo err1



    curByte = curByte + 1
    Dim Size As Integer
    Size = RAM.mREAD_WORD(curByte)
    curByte = curByte + 1 ' point to last processed byte.
        
        
        
    curByte = curByte + 1  ' point to last processed byte.
    Dim NestingLevel As Byte
    NestingLevel = RAM.mREAD_BYTE(curByte)

    NestingLevel = NestingLevel Mod 32




    ' INTEL 25366617.pdf

    stackPUSH BP
    
    Dim FrameTemp As Integer
    FrameTemp = SP





    If NestingLevel = 0 Then GoTo CONTINUE


    Dim i As Long
    If (NestingLevel > 0) Then
        For i = 1 To (NestingLevel - 1)
                ALU.sub_WORDS BP, 2, False    ' BP = to_signed_int(to_unsigned_long(BP) - 2)
                BP = ALU.GET_C_SIGNED
                
                ' #ENTER-allow-segment-displacement?#
                ' dim lloc as long
                ' lLoc = get_SEGMENT_LOCATION(2) * 16 + to_unsigned_long(BP)
                ' stackPUSH RAM.mREAD_WORD(lloc)
                
                stackPUSH RAM.mREAD_WORD(get_PHYSICAL_ADDR(SS, BP))
                
        Next i
        stackPUSH FrameTemp
        GoTo CONTINUE
    End If
    
CONTINUE:

    BP = FrameTemp
    
    ALU.sub_WORDS SP, Size, False   '  to_signed_int(to_unsigned_long(SP) - Size)
    SP = ALU.GET_C_SIGNED


Exit Sub
err1:
Debug.Print "do_instruction_C8 : " & Err.Description
End Sub


' C9         *LEAVE          Set SP to BP, then POP BP (reverses previous ENTER)
Private Sub do_instruction_C9(ByRef curByte As Long)
On Error GoTo err1

    ' curByte points to last processed byte

    SP = BP
    BP = stackPOP
    
Exit Sub
err1:
Debug.Print "do_instruction_C9 : " & Err.Description
End Sub



' 69 /r iw   *IMUL rw,iw     Signed multiply immediate word into word register
' 69 /r iw   *IMUL rw,ew,iw  Signed multiply (rw = EA word * immediate word)
Private Sub do_instruction_69(ByRef curByte As Long)
On Error GoTo err1

    Dim i As Byte
    Dim bRegIndex As Byte
    Dim tb1 As Byte
    Dim tb2 As Byte
    
    curByte = curByte + 1
    tb1 = RAM.mREAD_BYTE(curByte)
    For i = 0 To 7
        If (get_ROW_INDEX_IN_EA(tb1, i) <> 255) Then
            tb2 = get_ROW_INDEX_IN_EA(tb1, i)
            bRegIndex = i
            Exit For
        End If
    Next i
     


    Dim lWord As Long
    lWord = get_WORD_at_EA(tb2) ' automatically advances curByte if required.


    Dim iWORD As Integer
    curByte = curByte + 1
    iWORD = RAM.mREAD_WORD(curByte)
    curByte = curByte + 1  ' point to last processed byte.
    
    
    
    ' cloned from IMUL ew
     

    ' calculate result:
    Dim lTemp2 As Long
    lTemp2 = to_signed_int(lWord) * CLng(iWORD)
    
    ' generate HEX value from result:
    Dim sS1 As String
    sS1 = Hex(lTemp2)
    Dim iResult As Integer
    iResult = Val("&H" & Right(sS1, 4))
    
    
    ' set flags when result cannot be kept in AX alone:
    If (lTemp2 > 32767) Or (lTemp2 < -32768) Then
        frmFLAGS.cbOF.ListIndex = 1
        frmFLAGS.cbCF.ListIndex = 1
    Else
        frmFLAGS.cbOF.ListIndex = 0
        frmFLAGS.cbCF.ListIndex = 0
    End If
        
    
    store_WORD_RegValue bRegIndex, iResult

Exit Sub
err1:
Debug.Print "do_instruction_69 : " & Err.Description
End Sub

' 6B /r ib   *IMUL rw,ib     Signed multiply immediate byte into word register
' 6B /r ib   *IMUL rw,ew,ib  Signed multiply (rw = EA word * immediate byte)
Private Sub do_instruction_6B(ByRef curByte As Long)
On Error GoTo err1



    
    ' cloned from do_instruction_69



    Dim i As Byte
    Dim bRegIndex As Byte
    Dim tb1 As Byte
    Dim tb2 As Byte
    
    curByte = curByte + 1
    tb1 = RAM.mREAD_BYTE(curByte)
    For i = 0 To 7
        If (get_ROW_INDEX_IN_EA(tb1, i) <> 255) Then
            tb2 = get_ROW_INDEX_IN_EA(tb1, i)
            bRegIndex = i
            Exit For
        End If
    Next i
     


    Dim lWord As Long
    lWord = get_WORD_at_EA(tb2) ' automatically advances curByte if required.


    Dim iByte As Integer
    curByte = curByte + 1 ' point to last processed byte.
    iByte = to_signed_byte(RAM.mREAD_BYTE(curByte))
    
    

     

    ' calculate result:
    Dim lTemp2 As Long
    lTemp2 = to_signed_int(lWord) * CLng(iByte)
    
    ' generate HEX value from result:
    Dim sS1 As String
    sS1 = Hex(lTemp2)
    Dim iResult As Integer
    iResult = Val("&H" & Right(sS1, 4))
    
    
    ' set flags when result cannot be kept in AX alone:
    If (lTemp2 > 32767) Or (lTemp2 < -32768) Then
        frmFLAGS.cbOF.ListIndex = 1
        frmFLAGS.cbCF.ListIndex = 1
    Else
        frmFLAGS.cbOF.ListIndex = 0
        frmFLAGS.cbCF.ListIndex = 0
    End If
        
    
    store_WORD_RegValue bRegIndex, iResult



Exit Sub
err1:
Debug.Print "do_instruction_6B : " & Err.Description
End Sub



'    6C         *INS eb,DX      Input byte from port DX into [DI], advance DI
'    6C         *INSB           Input byte from port DX into ES:[DI], advance DI
Private Sub do_instruction_6C(ByRef curByte As Long)
On Error GoTo err1

' curByte points to last processed byte


' NOT IN AL' do_INB (get_DX)

Dim tb1 As Byte
tb1 = READ_IO_BYTE(get_DX)


' ES is default
Dim lLoc As Long
lLoc = get_SEGMENT_LOCATION(55) * 16 + to_unsigned_long(DI)

RAM.mWRITE_BYTE lLoc, tb1

ALU.add_WORDS DI, 1, False
DI = ALU.GET_C_SIGNED


Exit Sub
err1:
Debug.Print "do_instruction_6C : " & Err.Description
End Sub



'    6D         *INS ew,DX      Input word from port DX into [DI], advance DI
'    6D         *INSW           Input word from port DX into ES:[DI], advance DI
Private Sub do_instruction_6D(ByRef curByte As Long)
On Error GoTo err1

' curByte points to last processed byte


Dim i1 As Integer
i1 = READ_IO_WORD(get_DX)


' ES is default
Dim lLoc As Long
lLoc = get_SEGMENT_LOCATION(55) * 16 + to_unsigned_long(DI)

RAM.mWRITE_WORD_i lLoc, i1

ALU.add_WORDS DI, 2, False
DI = ALU.GET_C_SIGNED



Exit Sub
err1:
Debug.Print "do_instruction_6D : " & Err.Description
End Sub



'    6E         *OUTS DX,eb     Output byte [SI] to port number DX, advance SI
'    6E         *OUTSB          Output byte DS:[SI] to port number DX, advance SI
Private Sub do_instruction_6E(ByRef curByte As Long)
On Error GoTo err1

' curByte points to last processed byte



' DS is default
Dim lLoc As Long
lLoc = get_SEGMENT_LOCATION(0) * 16 + to_unsigned_long(SI)

Dim tb1 As Byte
tb1 = RAM.mREAD_BYTE(lLoc)
WRITE_IO_BYTE get_DX, tb1


ALU.add_WORDS SI, 1, False
SI = ALU.GET_C_SIGNED



Exit Sub
err1:
Debug.Print "do_instruction_6E : " & Err.Description
End Sub



'    6F         *OUTS DX,ew     Output word [SI] to port number DX, advance SI
'    6F         *OUTSW          Output word DS:[SI] to port number DX, advance SI
Private Sub do_instruction_6F(ByRef curByte As Long)
On Error GoTo err1

' curByte points to last processed byte



' DS is default
Dim lLoc As Long
lLoc = get_SEGMENT_LOCATION(0) * 16 + to_unsigned_long(SI)

Dim i1 As Integer
i1 = RAM.mREAD_WORD(lLoc)
WRITE_IO_WORD get_DX, i1


ALU.add_WORDS SI, 2, False
SI = ALU.GET_C_SIGNED




Exit Sub
err1:
Debug.Print "do_instruction_6F : " & Err.Description
End Sub





'
'
' #400b20-fasm-jcc#
'0F 80 cw       JO rel16        Jump near if overflow (OF=1).
'0F 81 cw       JNO rel16       Jump near if not overflow (OF=0).
'0F 82 cw       JC rel16        Jump near if carry (CF=1).
'0F 83 cw       JNC rel16       Jump near if not carry (CF=0).
'0F 84 cw       JZ rel16        Jump near if 0 (ZF=1).
'0F 85 cw       JNZ rel16       Jump near if not zero (ZF=0).
'0F 86 cw       JNA rel16       Jump near if not above (CF=1 or ZF=1).
'0F 87 cw       JA rel16        Jump near if above (CF=0 and ZF=0).
'0F 88 cw       JS rel16        Jump near if sign (SF=1).
'0F 89 cw       JNS rel16       Jump near if not sign (SF=0).
'0F 8A cw       JP rel16        Jump near if parity (PF=1).
'0F 8B cw       JNP rel16       Jump near if not parity (PF=0).
'0F 8C cw       JL rel16        Jump near if less (SF<>OF).
'0F 8D cw       JGE rel16       Jump near if greater or equal (SF=OF).
'0F 8E cw       JLE rel16       Jump near if less or equal (ZF=1 or SF<>OF).
'0F 8F cw       JG rel16        Jump near if greater (ZF=0 and SF=OF).
' RETURNS RELATIVE OFFSET TO JUMP
Private Function do_instruction_0F_8n(byteJCC_INDEX As Byte, ByRef curByte As Long) As Integer
On Error GoTo err1

' curByte points to last processed byte


    Dim iWORD As Integer
    curByte = curByte + 1
    iWORD = RAM.mREAD_WORD(curByte)
    curByte = curByte + 1  ' point to last processed byte.

    
    Dim bDO_JCC As Boolean
    bDO_JCC = False


    Select Case byteJCC_INDEX
    '0F 80 cw       JO rel16        Jump near if overflow (OF=1).
    Case &H80
        If frmFLAGS.cbOF.ListIndex = 1 Then
            bDO_JCC = True
        End If
    '0F 81 cw       JNO rel16       Jump near if not overflow (OF=0).
    Case &H81
        If frmFLAGS.cbOF.ListIndex = 0 Then
            bDO_JCC = True
        End If
    '0F 82 cw       JC rel16        Jump near if carry (CF=1).
    Case &H82
        If frmFLAGS.cbCF.ListIndex = 1 Then
            bDO_JCC = True
        End If
    '0F 83 cw       JNC rel16       Jump near if not carry (CF=0).
    Case &H83
        If frmFLAGS.cbCF.ListIndex = 0 Then
            bDO_JCC = True
        End If
    '0F 84 cw       JZ rel16        Jump near if 0 (ZF=1).
    Case &H84
        If frmFLAGS.cbZF.ListIndex = 1 Then
            bDO_JCC = True
        End If
    '0F 85 cw       JNZ rel16       Jump near if not zero (ZF=0).
    Case &H85
        If frmFLAGS.cbZF.ListIndex = 0 Then
            bDO_JCC = True
        End If
    '0F 86 cw       JNA rel16       Jump near if not above (CF=1 or ZF=1).
    Case &H86
        If frmFLAGS.cbCF.ListIndex = 1 Or frmFLAGS.cbZF.ListIndex = 1 Then
            bDO_JCC = True
        End If
    '0F 87 cw       JA rel16        Jump near if above (CF=0 and ZF=0).
    Case &H87
        If frmFLAGS.cbCF.ListIndex = 0 And frmFLAGS.cbZF.ListIndex = 0 Then
            bDO_JCC = True
        End If
    '0F 88 cw       JS rel16        Jump near if sign (SF=1).
    Case &H88
        If frmFLAGS.cbSF.ListIndex = 1 Then
            bDO_JCC = True
        End If
    '0F 89 cw       JNS rel16       Jump near if not sign (SF=0).
    Case &H89
        If frmFLAGS.cbSF.ListIndex = 0 Then
            bDO_JCC = True
        End If
    '0F 8A cw       JP rel16        Jump near if parity (PF=1).
    Case &H8A
        If frmFLAGS.cbPF.ListIndex = 1 Then
            bDO_JCC = True
        End If
    '0F 8B cw       JNP rel16       Jump near if not parity (PF=0).
    Case &H8B
        If frmFLAGS.cbPF.ListIndex = 0 Then
            bDO_JCC = True
        End If
    '0F 8C cw       JL rel16        Jump near if less (SF<>OF).
    Case &H8C
        If frmFLAGS.cbSF.ListIndex <> frmFLAGS.cbOF.ListIndex Then
            bDO_JCC = True
        End If
    '0F 8D cw       JGE rel16       Jump near if greater or equal (SF=OF).
    Case &H8D
        If frmFLAGS.cbSF.ListIndex = frmFLAGS.cbOF.ListIndex Then
            bDO_JCC = True
        End If
    '0F 8E cw       JLE rel16       Jump near if less or equal (ZF=1 or SF<>OF).
    Case &H8E
        If frmFLAGS.cbZF.ListIndex = 1 Or (frmFLAGS.cbSF.ListIndex <> frmFLAGS.cbOF.ListIndex) Then
            bDO_JCC = True
        End If
    '0F 8F cw       JG rel16        Jump near if greater (ZF=0 and SF=OF).
    Case &H8F
        If frmFLAGS.cbZF.ListIndex = 0 And (frmFLAGS.cbSF.ListIndex = frmFLAGS.cbOF.ListIndex) Then
            bDO_JCC = True
        End If
    End Select
    
    
    
    If bDO_JCC Then
        ' we do not generate any GPs
        do_instruction_0F_8n = iWORD
    Else
        do_instruction_0F_8n = 0
    End If
    

Exit Function
err1:
Debug.Print "do_instruction_6F : " & Err.Description
End Function





' FPU
Function do_instruction_D8_DF(ByRef tbFIRST As Byte, ByRef curByte As Long)
On Error GoTo err1
         
         
         
         
        ' 4.00b20  had to put it here because it crashed ready .exe for some reason....
        ' this way it won't be initialized unntil FPU is really used (at least it won't crash for non-FPU code)
        ' the same code is put to fpu_fWAIT()
        If Not bFPU_INIT_DONE Then
            INIT_FPU
            bFPU_INIT_DONE = True
        End If
         
         
         
         
         
        Dim r As Long  ' the return value is generally not used.
        
         
        Dim m As fpu87_STATE ' must have a local copy, because passed ByRef! (otherwise DLL crash!)
         
        m = fpuGLOBAL_STATE
         
        set_StepBack_for_FPU m
            
            
            
        Dim tb1 As Byte
        Dim mtRT As type_eaROW_eaTAB
        Dim mtLOC_SIZE As type_Size_and_Location
        
        ' cloning from "F6 /7       IDIV eb"  from doStep()
                    
        curByte = curByte + 1
        tb1 = RAM.mREAD_BYTE(curByte)


        ' lEA_TAB   is 0 to 7  or an actuall byte the follows the opcode.
        Dim lEA_TAB As Long
        
        
        If tb1 < 192 Then ' < C0
            ' if tb1>=c0   no need to calculate EA
            mtRT = get_eaROW_eaTAB(tb1)
            ' +++++++ get EA location:
            mtLOC_SIZE = get_EA_loc_and_size(mtRT.bROW, curByte)
            curByte = curByte + mtLOC_SIZE.iSize - 1 ' point to last processed byte.
            ' THE address is here:
            '                        mtLOC_SIZE.lLoc
            ' +++++++++++++++++++++++++++++++++
            lEA_TAB = mtRT.bTAB
        Else
            lEA_TAB = tb1
        End If
            
        
        Dim i As Long
        Dim k As Long
        
        
        Dim mem2i    As fpuREGISTER_2byte
        Dim mem4i    As fpuREGISTER_4byte
        Dim mem4r    As fpuREGISTER_4byte
        Dim mem8r    As fpuREGISTER_8byte
        Dim mem8i    As fpuREGISTER_8byte
        Dim mem10r   As fpuREGISTER_10byte
        Dim mem10d   As fpuREGISTER_10byte
        Dim mem14    As fpuREGISTER_14byte
        Dim mem94    As fpu87_STATE
          
      
        
        If tbFIRST = &HD8 Then

                If lEA_TAB <= 7 Then ' if it's not tab, then it's not memory location.
                    For i = 0 To 3
                        mem4r.fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                End If
                
                r = MicroAsm_D8_TAB(lEA_TAB, mem4r, m)


        ElseIf tbFIRST = &HD9 Then

                Select Case lEA_TAB
                
                ' D9 /0     FLD mem4r       push, 0 := mem4r
                Case 0
                    For i = 0 To 3
                        mem4r.fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                    r = MicroAsm_D9_TAB(lEA_TAB, mem4r, mem14, mem2i, m)
                    
                ' RESERVED
                Case 1
                    ' not used yet...
                    
                ' D9 /2     FST mem4r       mem4r := 0
                ' D9 /3     FSTP mem4r      mem4r := 0, pop
                Case 2, 3
                    r = MicroAsm_D9_TAB(lEA_TAB, mem4r, mem14, mem2i, m)
                    For i = 0 To 3
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc + i, mem4r.fpuBYTE(i)
                    Next i
                
                '  D9 /4     FLDENV mem14    environment := mem14
                Case 4
                    For i = 0 To 13
                        mem14.fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                    r = MicroAsm_D9_TAB(lEA_TAB, mem4r, mem14, mem2i, m)
                    
                ' D9 /5     FLDCW mem2i     control word := mem2i
                Case 5
                    For i = 0 To 1
                        mem2i.fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                    r = MicroAsm_D9_TAB(lEA_TAB, mem4r, mem14, mem2i, m)

                    
                ' D9 /6     FSTENV mem14    mem14 := environment
                Case 6
                    r = MicroAsm_D9_TAB(lEA_TAB, mem4r, mem14, mem2i, m)
                    For i = 0 To 13
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc + i, mem14.fpuBYTE(i)
                    Next i
                    
                ' D9 /7     FSTCW mem2i     mem2i := control word
                Case 7
                    r = MicroAsm_D9_TAB(lEA_TAB, mem4r, mem14, mem2i, m)
                    For i = 0 To 1
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc + i, mem2i.fpuBYTE(i)
                    Next i

                Case Else
                    r = MicroAsm_D9_TAB(lEA_TAB, mem4r, mem14, mem2i, m)
                    
                End Select
        
        
        ElseIf tbFIRST = &HDA Then
                
                If lEA_TAB <= 7 Then ' if it's not tab, then it's not memory location.
                    For i = 0 To 3
                        mem4i.fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                End If
                
                r = MicroAsm_DA_TAB(lEA_TAB, mem4i, m)
        
        
        
        ElseIf tbFIRST = &HDB Then
        
                
                If lEA_TAB <= 3 Then ' if it's not tab, then it's not memory location.
                    For i = 0 To 3
                        mem4i.fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                ElseIf lEA_TAB <= 7 Then
                    For i = 0 To 9
                        mem10r.fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                End If
                
                r = MicroAsm_DB_TAB(lEA_TAB, mem4i, mem10r, m)
        
        
        ElseIf tbFIRST = &HDC Then
        
                If lEA_TAB <= 7 Then ' if it's not tab, then it's not memory location.
                    For i = 0 To 7
                        mem8r.fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                End If
                
                r = MicroAsm_DC_TAB(lEA_TAB, mem8r, m)
        
        
        ElseIf tbFIRST = &HDD Then
        
        
                If lEA_TAB = 0 Then ' if it's not tab, then it's not memory location.
                    For i = 0 To 7
                        mem8r.fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                ElseIf lEA_TAB = 4 Then
                    For i = 0 To 13
                        mem94.fpuControl(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                    For k = 0 To 7
                        For i = 0 To 9
                            mem94.fpuReg(k).fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i + 14)
                        Next i
                    Next k
                End If

                r = MicroAsm_DD_TAB(lEA_TAB, mem8r, mem94, mem2i, m)


                If lEA_TAB = 2 Or lEA_TAB = 3 Then
                    For i = 0 To 7
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc + i, mem8r.fpuBYTE(i)
                    Next i
                ElseIf lEA_TAB = 6 Then
                    For i = 0 To 13
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc + i, mem94.fpuControl(i)
                    Next i
                    For k = 0 To 7
                        For i = 0 To 9
                            RAM.mWRITE_BYTE mtLOC_SIZE.lLoc + i + 14, mem94.fpuReg(k).fpuBYTE(i)
                        Next i
                    Next k
                ElseIf lEA_TAB = 7 Then
                    For i = 0 To 1
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc + i, mem2i.fpuBYTE(i)
                    Next i
                End If
                
                
                
                
        ElseIf tbFIRST = &HDE Then
        
        
                If lEA_TAB <= 7 Then ' if it's not tab, then it's not memory location.
                    For i = 0 To 1
                        mem2i.fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                End If
                
                r = MicroAsm_DE_TAB(lEA_TAB, mem2i, m)
        
        
        ElseIf tbFIRST = &HDF Then
        
        
                If lEA_TAB = 0 Then
                    For i = 0 To 1
                        mem2i.fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                ElseIf lEA_TAB = 4 Then
                    For i = 0 To 9
                        mem10d.fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                ElseIf lEA_TAB = 5 Then
                    For i = 0 To 7
                        mem8i.fpuBYTE(i) = RAM.mREAD_BYTE(mtLOC_SIZE.lLoc + i)
                    Next i
                End If
                
                
                r = MicroAsm_DF_TAB(lEA_TAB, mem2i, mem8i, mem10d, m)
                
                
                If lEA_TAB = 2 Or lEA_TAB = 3 Then
                    For i = 0 To 1
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc + i, mem2i.fpuBYTE(i)
                    Next i
                ElseIf lEA_TAB = 6 Then
                    For i = 0 To 9
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc + i, mem10d.fpuBYTE(i)
                    Next i
                ElseIf lEA_TAB = 7 Then
                    For i = 0 To 7
                        RAM.mWRITE_BYTE mtLOC_SIZE.lLoc + i, mem8i.fpuBYTE(i)
                    Next i
                ' DF E0     FSTSW AX        AX := status word
                ElseIf lEA_TAB = &HE0 Then
                    set_AX to16bit_SIGNED(mem2i.fpuBYTE(0), mem2i.fpuBYTE(1))
                End If

        Else
            ' should never get here :)
            mBox Me, "the FPU function is not supported yet"
            stopAutoStep
        End If
        
        
        ' the state may have changed!
        fpuGLOBAL_STATE = m
        

Exit Function
err1:
Dim sERR As String
sERR = LCase(Err.Description)
On Error Resume Next
mBox Me, "FPU ERROR: " & sERR
Debug.Print "do_instruction_D8_DF : " & sERR
stopAutoStep   '  #400b21-stop-on-fpu-error#

End Function



' 4.00b20
' had to it the tricky way because it was crashing ready .exe....
Private Sub INIT_FPU()
On Error GoTo err1
    
    Dim m As fpu87_STATE
    
    Dim mem8r As fpuREGISTER_8byte
    Dim mem94 As fpu87_STATE
    Dim mem4i As fpuREGISTER_4byte
    Dim mem2i As fpuREGISTER_2byte
    Dim mem10r As fpuREGISTER_10byte
    
    
    
    DoEvents  ' #400b20x-crash#
    
    
    ' #400b20x-crash#
    ' hm.... let's try this:
    ' DB E2     FCLEX           clear exceptions
    MicroAsm_DB_TAB &HE2, mem4i, mem10r, m
    
    
    DoEvents
    
    ' this is optional.....
    ' hm... it didn't help much FPU registers still look weird,,, but anyway...
    ' calling FFREE for all 8 registers for a better look
    ' DD C0+i   FFREE i         empty i
    MicroAsm_FINIT m  ' another INIT jic...
    DoEvents
    Dim i As Long
    For i = 0 To 7
        MicroAsm_DD_TAB &HC0 + i, mem8r, mem94, mem2i, m
        DoEvents
    Next i
    
    
    
    
    ' THIS IS REQUIRED:
    MicroAsm_FINIT m
    fpuGLOBAL_STATE = m
    
    
    DoEvents  ' #400b20x-crash#
    
    
    ' Debug.Print "FPU INIT"
    
    Exit Sub
err1:
End Sub

' jic :)
Public Sub INIT_FPU_PUB()
On Error Resume Next
    INIT_FPU
End Sub

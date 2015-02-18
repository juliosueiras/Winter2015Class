VERSION 5.00
Begin VB.Form frmFLAGS 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "flags"
   ClientHeight    =   3855
   ClientLeft      =   8700
   ClientTop       =   4365
   ClientWidth     =   1365
   Icon            =   "frmFLAGS.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3855
   ScaleWidth      =   1365
   Begin VB.CommandButton cmdAnalize 
      Caption         =   "analyse"
      Height          =   345
      Left            =   15
      TabIndex        =   17
      Top             =   3465
      Width           =   1335
   End
   Begin VB.Frame fraFlags 
      Height          =   3450
      Left            =   15
      TabIndex        =   1
      Top             =   -30
      Width           =   1320
      Begin VB.ComboBox cbCF 
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
         ItemData        =   "frmFLAGS.frx":038A
         Left            =   660
         List            =   "frmFLAGS.frx":0394
         Style           =   2  'Dropdown List
         TabIndex        =   0
         TabStop         =   0   'False
         ToolTipText     =   "Carry Flag"
         Top             =   240
         Width           =   525
      End
      Begin VB.ComboBox cbZF 
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
         ItemData        =   "frmFLAGS.frx":039E
         Left            =   660
         List            =   "frmFLAGS.frx":03A8
         Style           =   2  'Dropdown List
         TabIndex        =   8
         TabStop         =   0   'False
         ToolTipText     =   "Zero Flag (0-not zero, 1-zero)"
         Top             =   627
         Width           =   525
      End
      Begin VB.ComboBox cbSF 
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
         ItemData        =   "frmFLAGS.frx":03B2
         Left            =   660
         List            =   "frmFLAGS.frx":03BC
         Style           =   2  'Dropdown List
         TabIndex        =   7
         TabStop         =   0   'False
         ToolTipText     =   "Sign Flag (0-positive, 1-negative)"
         Top             =   1014
         Width           =   525
      End
      Begin VB.ComboBox cbOF 
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
         ItemData        =   "frmFLAGS.frx":03C6
         Left            =   660
         List            =   "frmFLAGS.frx":03D0
         Style           =   2  'Dropdown List
         TabIndex        =   6
         TabStop         =   0   'False
         ToolTipText     =   "Overflow Flag"
         Top             =   1401
         Width           =   525
      End
      Begin VB.ComboBox cbPF 
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
         ItemData        =   "frmFLAGS.frx":03DA
         Left            =   660
         List            =   "frmFLAGS.frx":03E4
         Style           =   2  'Dropdown List
         TabIndex        =   5
         TabStop         =   0   'False
         ToolTipText     =   "Parity Flag (0-odd, 1-even)"
         Top             =   1788
         Width           =   525
      End
      Begin VB.ComboBox cbAF 
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
         ItemData        =   "frmFLAGS.frx":03EE
         Left            =   660
         List            =   "frmFLAGS.frx":03F8
         Style           =   2  'Dropdown List
         TabIndex        =   4
         TabStop         =   0   'False
         ToolTipText     =   "Auxiliary Flag"
         Top             =   2175
         Width           =   525
      End
      Begin VB.ComboBox cbIF 
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
         ItemData        =   "frmFLAGS.frx":0402
         Left            =   660
         List            =   "frmFLAGS.frx":040C
         Style           =   2  'Dropdown List
         TabIndex        =   3
         TabStop         =   0   'False
         ToolTipText     =   "Interupt enable Flag"
         Top             =   2562
         Width           =   525
      End
      Begin VB.ComboBox cbDF 
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
         ItemData        =   "frmFLAGS.frx":0416
         Left            =   660
         List            =   "frmFLAGS.frx":0420
         Style           =   2  'Dropdown List
         TabIndex        =   2
         TabStop         =   0   'False
         ToolTipText     =   "Direction Flag (0-forward, 1-backward)"
         Top             =   2955
         Width           =   525
      End
      Begin VB.Label lblFLAGS 
         AutoSize        =   -1  'True
         Caption         =   "CF"
         Height          =   195
         Index           =   0
         Left            =   217
         TabIndex        =   16
         ToolTipText     =   "Carry Flag"
         Top             =   315
         Width           =   195
      End
      Begin VB.Label lblFLAGS 
         AutoSize        =   -1  'True
         Caption         =   "ZF"
         Height          =   195
         Index           =   1
         Left            =   217
         TabIndex        =   15
         ToolTipText     =   "Zero Flag (0-not zero, 1-zero)"
         Top             =   705
         Width           =   195
      End
      Begin VB.Label lblFLAGS 
         AutoSize        =   -1  'True
         Caption         =   "SF"
         Height          =   195
         Index           =   2
         Left            =   217
         TabIndex        =   14
         ToolTipText     =   "Sign Flag (0-positive, 1-negative)"
         Top             =   1095
         Width           =   195
      End
      Begin VB.Label lblFLAGS 
         AutoSize        =   -1  'True
         Caption         =   "OF"
         Height          =   195
         Index           =   3
         Left            =   217
         TabIndex        =   13
         ToolTipText     =   "Overflow Flag"
         Top             =   1485
         Width           =   210
      End
      Begin VB.Label lblFLAGS 
         AutoSize        =   -1  'True
         Caption         =   "PF"
         Height          =   195
         Index           =   4
         Left            =   217
         TabIndex        =   12
         ToolTipText     =   "Parity Flag (0-odd, 1-even)"
         Top             =   1875
         Width           =   195
      End
      Begin VB.Label lblFLAGS 
         AutoSize        =   -1  'True
         Caption         =   "AF"
         Height          =   195
         Index           =   5
         Left            =   217
         TabIndex        =   11
         ToolTipText     =   "Auxiliary Flag"
         Top             =   2265
         Width           =   195
      End
      Begin VB.Label lblFLAGS 
         AutoSize        =   -1  'True
         Caption         =   "IF"
         Height          =   195
         Index           =   6
         Left            =   217
         TabIndex        =   10
         ToolTipText     =   "Interupt enable Flag"
         Top             =   2655
         Width           =   135
      End
      Begin VB.Label lblFLAGS 
         AutoSize        =   -1  'True
         Caption         =   "DF"
         Height          =   195
         Index           =   7
         Left            =   217
         TabIndex        =   9
         ToolTipText     =   "Direction Flag (0-forward, 1-backward)"
         Top             =   3045
         Width           =   210
      End
   End
End
Attribute VB_Name = "frmFLAGS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' 

' 

'



Option Explicit

Private Sub colorRedBlue(ByRef cb As ComboBox)

On Error Resume Next ' 4.00-Beta-3

    If (cb.ListIndex = 1) Then
        cb.ForeColor = vbRed
    Else
        cb.ForeColor = vbBlue
    End If

    If bUPDATE_LEXICAL_FLAG_ANALYSER Then frmFlagAnalyzer.AnalyzeFlags

End Sub


Private Sub cbAF_Click()
    colorRedBlue cbAF
End Sub

Private Sub cbCF_Click()
    colorRedBlue cbCF
End Sub

Private Sub cbDF_Click()
    colorRedBlue cbDF
End Sub

Private Sub cbIF_Click()
    colorRedBlue cbIF
End Sub

Private Sub cbOF_Click()
    colorRedBlue cbOF
End Sub

Private Sub cbPF_Click()
    colorRedBlue cbPF
End Sub

Private Sub cbSF_Click()
    colorRedBlue cbSF
End Sub

Private Sub cbZF_Click()
    colorRedBlue cbZF
End Sub

Private Sub cmdAnalize_Click()
On Error Resume Next ' 4.00-Beta-3
    ' 2.57#723
    frmFlagAnalyzer.DoShowMe
End Sub

' 1.02
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
On Error Resume Next ' 4.00-Beta-3
    If UnloadMode = vbFormControlMenu Then
            Cancel = 1
            Me.Hide
            
            Exit Sub  ' 2.03#518
    End If
    
    ' this form is unloaded only
    ' on application termination (exit).
    
    b_LOADED_frmFLAGS = False
End Sub

' 1.02
Private Sub Form_Load()

On Error Resume Next ' 4.00-Beta-3

    Me.Caption = cMT(Me.Caption)
    cmdAnalize.Caption = cMT(cmdAnalize.Caption)
    
    
    GetWindowPos Me ' 2.05#551
    
    '#1059 Me.Icon = frmMain.Icon
    
    b_LOADED_frmFLAGS = True
End Sub

Public Function getFLAGS_REGISTER16() As Integer

On Error Resume Next ' 4.00-Beta-3

    Dim i As Integer
    Dim n As Long
    Dim sum As Long
    
    sum = 0
    
    n = cbCF.ListIndex
    sum = sum + n * (2 ^ 0)
    
    sum = sum + 1 * (2 ^ 1) ' reserved ('1').
    
    n = cbPF.ListIndex
    sum = sum + n * (2 ^ 2)
    
    sum = sum + 0 * (2 ^ 3) ' reserved ('0').

    n = cbAF.ListIndex
    sum = sum + n * (2 ^ 4)

    sum = sum + 0 * (2 ^ 5) ' reserved ('0').
    
    n = cbZF.ListIndex
    sum = sum + n * (2 ^ 6)
    
    n = cbSF.ListIndex
    sum = sum + n * (2 ^ 7)
    
    sum = sum + 0 * (2 ^ 8) ' TRAP FLAG.
    
    n = cbIF.ListIndex      ' this flag should effect how hw.interupts are executed/or not.
    sum = sum + n * (2 ^ 9)
    
    n = cbDF.ListIndex
    sum = sum + n * (2 ^ 10)
    
    n = cbOF.ListIndex
    sum = sum + n * (2 ^ 11)
    
    ' others are zeros, or not supported by 8086.
    
    getFLAGS_REGISTER16 = to_signed_int(sum)
End Function

' 1.06
' this returns only lower half of the flags register:
Public Function getFLAGS_REGISTER8() As Byte

On Error Resume Next ' 4.00-Beta-3

    Dim i As Integer
    Dim n As Byte
    Dim sum As Byte
    
    sum = 0
    
    n = cbCF.ListIndex
    sum = sum + n * (2 ^ 0)
    
    sum = sum + 1 * (2 ^ 1) ' reserved ('1').
    
    n = cbPF.ListIndex
    sum = sum + n * (2 ^ 2)
    
    sum = sum + 0 * (2 ^ 3) ' reserved ('0').

    n = cbAF.ListIndex
    sum = sum + n * (2 ^ 4)

    sum = sum + 0 * (2 ^ 5) ' reserved ('0').
    
    n = cbZF.ListIndex
    sum = sum + n * (2 ^ 6)
    
    n = cbSF.ListIndex
    sum = sum + n * (2 ^ 7)
    
    getFLAGS_REGISTER8 = sum
End Function

Public Sub setFLAGS_REGISTER(wr As Integer)

On Error Resume Next ' 4.00-Beta-3

    Dim i As Integer
    
    i = wr And (2 ^ 0)
    cbCF.ListIndex = int_to_sg(i)
    
    ' (2 ^ 1) ' reserved ('1').
    
    i = wr And (2 ^ 2)
    cbPF.ListIndex = int_to_sg(i)
    
    ' (2 ^ 3) ' reserved ('0').

    i = wr And (2 ^ 4)
    cbAF.ListIndex = int_to_sg(i)

    ' (2 ^ 5) ' reserved ('0').

    i = wr And (2 ^ 6)
    cbZF.ListIndex = int_to_sg(i)

    i = wr And (2 ^ 7)
    cbSF.ListIndex = int_to_sg(i)
    
    ' (2 ^ 8) ' TRAP FLAG.
    
    ' this flag should effect how interupts are executed/or not.
    i = wr And (2 ^ 9)
    cbIF.ListIndex = int_to_sg(i)
    
    i = wr And (2 ^ 10)
    cbDF.ListIndex = int_to_sg(i)
    
    i = wr And (2 ^ 11)
    cbOF.ListIndex = int_to_sg(i)
    
End Sub

' 1.23
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next ' 4.00-Beta-3
    frmEmulation.process_HotKey KeyCode, Shift
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next ' 4.00-Beta-3
    SaveWindowState Me ' 2.05#551
End Sub

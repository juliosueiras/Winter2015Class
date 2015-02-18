VERSION 5.00
Begin VB.Form frmExtendedViewer 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "extended value viewer"
   ClientHeight    =   4980
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   3855
   Icon            =   "frmExtendedRegisterView.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4980
   ScaleWidth      =   3855
   Begin VB.OptionButton optWord 
      Caption         =   "word"
      Height          =   225
      Left            =   810
      TabIndex        =   33
      Top             =   510
      Width           =   1275
   End
   Begin VB.OptionButton optByte 
      Caption         =   "byte"
      Height          =   300
      Left            =   2325
      TabIndex        =   32
      Top             =   510
      Value           =   -1  'True
      Width           =   1215
   End
   Begin VB.TextBox txtMemSegment 
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
      Left            =   1950
      MaxLength       =   4
      TabIndex        =   1
      ToolTipText     =   "Segment"
      Top             =   45
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.TextBox txtMemOffset 
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
      Left            =   2955
      MaxLength       =   4
      TabIndex        =   2
      ToolTipText     =   "Offset"
      Top             =   45
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.ComboBox comboRegisterName 
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
      ItemData        =   "frmExtendedRegisterView.frx":038A
      Left            =   765
      List            =   "frmExtendedRegisterView.frx":03B8
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   60
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Height          =   4125
      Left            =   60
      TabIndex        =   3
      Top             =   765
      Width           =   3735
      Begin VB.Frame fra16bit 
         Caption         =   " decimal 16 bit"
         Height          =   1020
         Left            =   105
         TabIndex        =   17
         Top             =   3000
         Width           =   3525
         Begin VB.TextBox txtDEC_16bit_UNS 
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
            Left            =   1125
            MaxLength       =   5
            TabIndex        =   18
            Text            =   "00000"
            Top             =   225
            Width           =   2025
         End
         Begin VB.TextBox txtDEC_16bit_SGN 
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
            Left            =   1125
            MaxLength       =   6
            TabIndex        =   19
            Text            =   "-00000"
            Top             =   600
            Width           =   2025
         End
         Begin VB.Label Label10 
            AutoSize        =   -1  'True
            Caption         =   "unsigned:"
            Height          =   195
            Left            =   120
            TabIndex        =   29
            Top             =   300
            Width           =   690
         End
         Begin VB.Label Label9 
            AutoSize        =   -1  'True
            Caption         =   "signed:"
            Height          =   195
            Left            =   120
            TabIndex        =   28
            Top             =   675
            Width           =   510
         End
      End
      Begin VB.Frame fra8bit 
         Caption         =   " decimal 8 bit "
         Height          =   1380
         Left            =   105
         TabIndex        =   10
         Top             =   1500
         Width           =   3525
         Begin VB.TextBox txtASCII_H 
            Alignment       =   2  'Center
            BeginProperty Font 
               Name            =   "Terminal"
               Size            =   9
               Charset         =   255
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   330
            Left            =   1005
            MaxLength       =   1
            TabIndex        =   15
            Text            =   "A"
            Top             =   975
            Width           =   1020
         End
         Begin VB.TextBox txtASCII_L 
            Alignment       =   2  'Center
            BeginProperty Font 
               Name            =   "Terminal"
               Size            =   9
               Charset         =   255
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   330
            Left            =   2325
            MaxLength       =   1
            TabIndex        =   16
            Text            =   "A"
            Top             =   975
            Width           =   1020
         End
         Begin VB.TextBox txtDEC_L_SGN 
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
            Left            =   2325
            MaxLength       =   4
            TabIndex        =   14
            Text            =   "-000"
            Top             =   600
            Width           =   1020
         End
         Begin VB.TextBox txtDEC_H_SGN 
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
            Left            =   1005
            MaxLength       =   4
            TabIndex        =   13
            Text            =   "-000"
            Top             =   600
            Width           =   1020
         End
         Begin VB.TextBox txtDEC_L_UNS 
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
            Left            =   2325
            MaxLength       =   3
            TabIndex        =   12
            Text            =   "000"
            Top             =   225
            Width           =   1020
         End
         Begin VB.TextBox txtDEC_H_UNS 
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
            Left            =   1005
            MaxLength       =   3
            TabIndex        =   11
            Text            =   "000"
            Top             =   225
            Width           =   1020
         End
         Begin VB.Label Label11 
            Caption         =   "ascii:"
            Height          =   180
            Left            =   105
            TabIndex        =   30
            Top             =   1050
            Width           =   540
         End
         Begin VB.Label Label6 
            AutoSize        =   -1  'True
            Caption         =   "signed:"
            Height          =   195
            Left            =   105
            TabIndex        =   27
            Top             =   675
            Width           =   510
         End
         Begin VB.Label Label5 
            AutoSize        =   -1  'True
            Caption         =   "unsigned:"
            Height          =   195
            Left            =   105
            TabIndex        =   26
            Top             =   300
            Width           =   690
         End
      End
      Begin VB.TextBox txtOCT_L 
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
         Left            =   2220
         MaxLength       =   3
         TabIndex        =   9
         Text            =   "000"
         Top             =   1125
         Width           =   1335
      End
      Begin VB.TextBox txtOCT_H 
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
         Left            =   795
         MaxLength       =   3
         TabIndex        =   8
         Text            =   "000"
         Top             =   1125
         Width           =   1335
      End
      Begin VB.TextBox txtBIN_L 
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
         Left            =   2220
         MaxLength       =   8
         TabIndex        =   7
         Text            =   "00000000"
         Top             =   750
         Width           =   1335
      End
      Begin VB.TextBox txtBIN_H 
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
         Left            =   795
         MaxLength       =   8
         TabIndex        =   6
         Text            =   "00000000"
         Top             =   750
         Width           =   1335
      End
      Begin VB.TextBox txtHEX_H 
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
         Left            =   795
         MaxLength       =   2
         TabIndex        =   4
         Text            =   "00"
         Top             =   390
         Width           =   1335
      End
      Begin VB.TextBox txtHEX_L 
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
         Left            =   2220
         MaxLength       =   2
         TabIndex        =   5
         Text            =   "00"
         Top             =   390
         Width           =   1335
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "oct:"
         Height          =   195
         Left            =   180
         TabIndex        =   24
         Top             =   1200
         Width           =   270
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "bin:"
         Height          =   195
         Left            =   180
         TabIndex        =   23
         Top             =   825
         Width           =   255
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "hex:"
         Height          =   195
         Left            =   180
         TabIndex        =   22
         Top             =   465
         Width           =   300
      End
      Begin VB.Label lblH 
         AutoSize        =   -1  'True
         Caption         =   "H"
         Height          =   195
         Left            =   1380
         TabIndex        =   21
         ToolTipText     =   "High Byte"
         Top             =   165
         Width           =   120
      End
      Begin VB.Label lblL 
         AutoSize        =   -1  'True
         Caption         =   "L"
         Height          =   195
         Left            =   2895
         TabIndex        =   20
         ToolTipText     =   "Low Byte"
         Top             =   150
         Width           =   90
      End
   End
   Begin VB.Label lblMem_semicolumn 
      AutoSize        =   -1  'True
      Caption         =   ":"
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   2760
      TabIndex        =   31
      Top             =   105
      Visible         =   0   'False
      Width           =   120
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      Caption         =   "watch:"
      Height          =   195
      Left            =   150
      TabIndex        =   25
      Top             =   120
      Width           =   480
   End
End
Attribute VB_Name = "frmExtendedViewer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' 

' 

'





Option Explicit

Dim bUPDATING As Boolean

Dim bDONT_SET_REG_VALUE As Boolean

Dim bDONT_REACT_ON_SEG_OFFSET_CHANGE As Boolean

' 1.29#404 Private Sub Form_Activate()
Public Sub DoShowMe()
On Error Resume Next '3.27xm
    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
End Sub

Private Sub Form_Load()
  If Load_from_Lang_File(Me) Then Exit Sub
    
On Error GoTo err_ervl

    GetWindowPos Me ' 2.05#551
    

    'Me.Icon = frmMain.Icon
    
    bUPDATING = False
    
    comboRegisterName.ListIndex = 0
    
    bUPDATE_ExtendedRegisterView = True
    
    bDONT_SET_REG_VALUE = False
    
    bDONT_REACT_ON_SEG_OFFSET_CHANGE = False
    
    
    select_deselect_according_to_byte_word_selection ' #327xo-byte-def#
    
    Exit Sub
    
err_ervl:
    Debug.Print "frmExtendedViewer_Load: " & LCase(err.Description)
End Sub


Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
On Error Resume Next ' 4.00-Beta-3
    bUPDATE_ExtendedRegisterView = False
End Sub


Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next ' 4.00-Beta-3
    SaveWindowState Me ' 2.05#551
End Sub





Private Sub txtASCII_H_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtASCII_H.Name
End Sub

Private Sub txtASCII_H_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtASCII_H
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtASCII_L_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtASCII_L.Name
End Sub

Private Sub txtASCII_L_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtASCII_L
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtBIN_H_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtBIN_H.Name
End Sub

Private Sub txtBIN_H_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtBIN_H
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtBIN_H_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp
    Dim s As String
    Dim i As Integer
    
    s = UCase(Chr(KeyAscii))
    
    i = Asc(s)
    
    If ((i >= vbKeyA) And (i <= vbKeyZ)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    If ((i >= vbKey2) And (i <= vbKey9)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    Exit Sub
err_kp:
    Debug.Print "Error on kp: " & LCase(err.Description)
End Sub

Private Sub txtBIN_L_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtBIN_L.Name
End Sub

Private Sub txtBIN_L_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtBIN_L
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtBIN_L_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp
    Dim s As String
    Dim i As Integer
    
    s = UCase(Chr(KeyAscii))
    
    i = Asc(s)
    
    If ((i >= vbKeyA) And (i <= vbKeyZ)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    If ((i >= vbKey2) And (i <= vbKey9)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    Exit Sub
err_kp:
    Debug.Print "Error on kp: " & LCase(err.Description)
End Sub

Private Sub txtDEC_16bit_SGN_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtDEC_16bit_SGN.Name
End Sub

Private Sub txtDEC_16bit_SGN_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtDEC_16bit_SGN
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtDEC_16bit_SGN_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp
    Dim s As String
    Dim i As Integer
    
    s = UCase(Chr(KeyAscii))
    
    i = Asc(s)
    
    If ((i >= vbKeyA) And (i <= vbKeyZ)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    Exit Sub
err_kp:
    Debug.Print "Error on kp: " & LCase(err.Description)

End Sub

Private Sub txtDEC_16bit_UNS_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtDEC_16bit_UNS.Name
End Sub

Private Sub txtDEC_16bit_UNS_GotFocus()
    With txtDEC_16bit_UNS
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtDEC_16bit_UNS_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp
    Dim s As String
    Dim i As Integer
    
    s = UCase(Chr(KeyAscii))
    
    i = Asc(s)
    
    If ((i >= vbKeyA) And (i <= vbKeyZ)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    If s = "-" Then
        KeyAscii = 0 ' ignored!
    End If
    
    Exit Sub
err_kp:
    Debug.Print "Error on kp: " & LCase(err.Description)

End Sub

Private Sub txtDEC_H_SGN_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtDEC_H_SGN.Name
End Sub

Private Sub txtDEC_H_SGN_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtDEC_H_SGN
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtDEC_H_SGN_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp
    Dim s As String
    Dim i As Integer
    
    s = UCase(Chr(KeyAscii))
    
    i = Asc(s)
    
    If ((i >= vbKeyA) And (i <= vbKeyZ)) Then
        KeyAscii = 0 ' ignored!
    End If
    
   
    Exit Sub
err_kp:
    Debug.Print "Error on kp: " & LCase(err.Description)
End Sub

Private Sub txtDEC_H_UNS_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtDEC_H_UNS.Name
End Sub

Private Sub txtDEC_H_UNS_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtDEC_H_UNS
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtDEC_H_UNS_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp
    Dim s As String
    Dim i As Integer
    
    s = UCase(Chr(KeyAscii))
    
    i = Asc(s)
    
    If ((i >= vbKeyA) And (i <= vbKeyZ)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    If s = "-" Then
        KeyAscii = 0 ' ignored!
    End If
    
    Exit Sub
err_kp:
    Debug.Print "Error on kp: " & LCase(err.Description)
End Sub

Private Sub txtDEC_L_SGN_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtDEC_L_SGN.Name
End Sub

Private Sub txtDEC_L_SGN_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtDEC_L_SGN
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtDEC_L_SGN_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp
    Dim s As String
    Dim i As Integer
    
    s = UCase(Chr(KeyAscii))
    
    i = Asc(s)
    
    If ((i >= vbKeyA) And (i <= vbKeyZ)) Then
        KeyAscii = 0 ' ignored!
    End If
    
   
    Exit Sub
err_kp:
    Debug.Print "Error on kp: " & LCase(err.Description)

End Sub

Private Sub txtDEC_L_UNS_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtDEC_L_UNS.Name
End Sub

Private Sub txtDEC_L_UNS_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtDEC_L_UNS
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtDEC_L_UNS_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp
    Dim s As String
    Dim i As Integer
    
    s = UCase(Chr(KeyAscii))
    
    i = Asc(s)
    
    If ((i >= vbKeyA) And (i <= vbKeyZ)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    If s = "-" Then
        KeyAscii = 0 ' ignored!
    End If
    
    Exit Sub
err_kp:
    Debug.Print "Error on kp: " & LCase(err.Description)
End Sub

Private Sub txtHEX_H_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtHEX_H.Name
End Sub

Private Sub txtHEX_H_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtHEX_H
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtHEX_H_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp
    Dim s As String
    Dim i As Integer
    
    s = UCase(Chr(KeyAscii))
    
    i = Asc(s)
    
    If ((i > vbKeyF) And (i <= vbKeyZ)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    Exit Sub
err_kp:
    Debug.Print "Error on kp: " & LCase(err.Description)
End Sub

Private Sub txtHEX_L_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtHEX_L.Name
End Sub



Private Sub txtHEX_L_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtHEX_L
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtHEX_L_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp
    Dim s As String
    Dim i As Integer
    
    s = UCase(Chr(KeyAscii))
    
    i = Asc(s)
    
    If ((i > vbKeyF) And (i <= vbKeyZ)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    Exit Sub
err_kp:
    Debug.Print "Error on kp: " & LCase(err.Description)
End Sub

Private Sub txtMemOffset_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtMemOffset
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtMemSegment_Change()
On Error Resume Next ' 4.00-Beta-3
    If bDONT_REACT_ON_SEG_OFFSET_CHANGE Then Exit Sub
    
    If comboRegisterName.ListIndex = 13 Then
        update_VALUES comboRegisterName.Name  ' 1.28#353 comboRegisterName   ' like click over it.
    Else
        showRegister "MEM"
    End If
    
End Sub

Private Sub txtMemOffset_Change()
On Error Resume Next ' 4.00-Beta-3
    If bDONT_REACT_ON_SEG_OFFSET_CHANGE Then Exit Sub
    
    If comboRegisterName.ListIndex = 13 Then
        update_VALUES comboRegisterName.Name   ' like click over it.
    Else
        showRegister "MEM"
    End If
    
End Sub


Private Sub txtMemSegment_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtMemSegment
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtOCT_H_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtOCT_H.Name
End Sub

Private Sub txtOCT_H_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtOCT_H
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtOCT_H_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp
    Dim s As String
    Dim i As Integer
    
    s = UCase(Chr(KeyAscii))
    
    i = Asc(s)
    
    If ((i >= vbKeyA) And (i <= vbKeyZ)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    If ((i >= vbKey8) And (i <= vbKey9)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    Exit Sub
err_kp:
    Debug.Print "Error on kp: " & LCase(err.Description)
End Sub

Private Sub txtOCT_L_Change()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES txtOCT_L.Name
End Sub




Private Sub comboRegisterName_Click()
On Error Resume Next ' 4.00-Beta-3
If bUPDATING Then Exit Sub
update_VALUES comboRegisterName.Name  ' 1.28#353 comboRegisterName

If comboRegisterName.ListIndex = 13 Then
    txtMemSegment.Visible = True
    txtMemOffset.Visible = True
    lblMem_semicolumn.Visible = True
Else
    txtMemSegment.Visible = False
    txtMemOffset.Visible = False
    lblMem_semicolumn.Visible = False
    
    bDONT_REACT_ON_SEG_OFFSET_CHANGE = True
    txtMemSegment.Text = ""
    txtMemOffset.Text = ""
    bDONT_REACT_ON_SEG_OFFSET_CHANGE = False
End If

End Sub

Private Function ml2(ByRef s As String) As String
On Error Resume Next ' 4.00-Beta-3
        ml2 = make_min_len(s, 2, "0")
End Function

Private Function ml3(ByRef s As String) As String
On Error Resume Next ' 4.00-Beta-3
        ml3 = make_min_len(s, 3, "0")
End Function

Private Function ml8(ByRef s As String) As String
On Error Resume Next ' 4.00-Beta-3
        ml8 = make_min_len(s, 8, "0")
End Function

Private Function get_RegValue(iRegIndex As Integer) As String

On Error Resume Next ' 4.00-Beta-3

Dim s As String

With frmEmulation

Select Case iRegIndex

Case 0 '    AX
    s = ml2(.txtAH) & ml2(.txtAL)
    
Case 1 '    BX
    s = ml2(.txtBH) & ml2(.txtBL)

Case 2 '    CX
    s = ml2(.txtCH) & ml2(.txtCL)
    
Case 3 '    DX
    s = ml2(.txtDH) & ml2(.txtDL)
    
Case 4 '    CS
    s = .txtCS
    
Case 5 '    IP
    s = .txtIP
    
Case 6 '    SS
    s = .txtSS
    
Case 7 '    SP
    s = .txtSP
    
Case 8 '    BP
    s = .txtBP
    
Case 9 '    SI
    s = .txtSI
    
Case 10 '    DI
    s = .txtDI
    
Case 11 '    DS
    s = .txtDS
    
Case 12 '    ES
    s = .txtES
    
Case 13 ' MEMORY!
    Dim lSEGMENT As Long
    Dim lOFFSET As Long
    
    bDONT_REACT_ON_SEG_OFFSET_CHANGE = True
    If txtMemSegment.Text = "" Then txtMemSegment.Text = "FFFF"
    If txtMemOffset.Text = "" Then txtMemOffset.Text = "FFFF"
    bDONT_REACT_ON_SEG_OFFSET_CHANGE = False
    
    lSEGMENT = to_unsigned_long(Val("&H" & txtMemSegment.Text))
    lOFFSET = to_unsigned_long(Val("&H" & txtMemOffset.Text))
    
    ' 1.15
    ' two text boxes are used, one for segment, another for offset:
    s = make_min_len(Hex(RAM.mREAD_WORD(lSEGMENT * &H10 + lOFFSET)), 4, "0")

Case Else
     Debug.Print "get_RegValue: wrong iRegIndex: " & iRegIndex
     
End Select

End With

get_RegValue = "&H" & s

End Function


Private Sub set_RegValue(iRegIndex As Integer, sValueH As String, sValueL As String)

On Error Resume Next ' 4.00-Beta-3

If bDONT_SET_REG_VALUE Then Exit Sub

bUPDATE_ExtendedRegisterView = False ' to prevent recursion from frmEmulation.


With frmEmulation

Select Case iRegIndex

Case 0 '    AX
    .txtAH.Text = sValueH
    .txtAL.Text = sValueL
    
Case 1 '    BX
    .txtBH.Text = sValueH
    .txtBL.Text = sValueL
    
Case 2 '    CX
    .txtCH.Text = sValueH
    .txtCL.Text = sValueL
    
Case 3 '    DX
    .txtDH.Text = sValueH
    .txtDL.Text = sValueL
    
Case 4 '    CS
    .txtCS.Text = sValueH & sValueL

Case 5 '    IP
    .txtIP.Text = sValueH & sValueL
    
Case 6 '    SS
    .txtSS.Text = sValueH & sValueL
    
Case 7 '    SP
    .txtSP.Text = sValueH & sValueL
    
Case 8 '    BP
    .txtBP.Text = sValueH & sValueL
    
Case 9 '    SI
    .txtSI.Text = sValueH & sValueL
    
Case 10 '    DI
    .txtDI.Text = sValueH & sValueL
    
Case 11 '    DS
    .txtDS.Text = sValueH & sValueL
    
Case 12 '    ES
    .txtES.Text = sValueH & sValueL
    
Case 13
    Dim lSEGMENT As Long
    Dim lOFFSET As Long
    
    lSEGMENT = to_unsigned_long(Val("&H" & txtMemSegment.Text))
    lOFFSET = to_unsigned_long(Val("&H" & txtMemOffset.Text))
    
    ' 2.09#576
    bDO_NOT_SET_ListIndex_for_STACK = True
    
    ' 1.15
    ' two text boxes are used, one for segment, another for offset:
    RAM.mWRITE_WORD lSEGMENT * &H10 + lOFFSET, Val("&H" & sValueL), Val("&H" & sValueH)

    ' don't remove this debug output,
    ' this could save your time later catching bugs!
    ' Debug.Print "updating memory from Ext.View! at: " & Hex(lSegment) & ":" & Hex(lOffset)
    
' 3.05 bug fix (very slow)
'    If b_LOADED_frmMemory Then
'        frmMemory.Update_list
'    End If
    
    update_VAR_WINDOW ' update variables (just in case).
    
    
    ' 4.00-Beta-5 it's better :)
    If b_LOADED_frmMemory Then
        frmMemory.Update_List_or_Table
    End If
    
    
Case Else
     Debug.Print "set_RegValue: wrong iRegIndex: " & iRegIndex
     
End Select

End With


bUPDATE_ExtendedRegisterView = True ' allow update from frmEmulation.

End Sub

Private Sub update_VALUES(sNAME_ID As String)  ' 1.28#353 As Object)

On Error GoTo err_uv

If bUPDATING Then Exit Sub ' jic


Dim iRegister_ID As Integer
Dim sCurrentValue As String  ' used only to set all values (by combo box).
Dim bSetValue As Boolean ' 1.27


iRegister_ID = comboRegisterName.ListIndex


bUPDATING = True

bSetValue = True

Select Case sNAME_ID

Case comboRegisterName.Name  ' 1.28#353 comboRegisterName

    sCurrentValue = get_RegValue(iRegister_ID)
    show_Values comboRegisterName.Name, sCurrentValue  ' 1.28#353 comboRegisterName, sCurrentValue ' show all registers!
    bSetValue = False
    
Case txtHEX_H.Name
    show_Values txtHEX_H.Name, "&H" & ml2(txtHEX_H.Text) & ml2(txtHEX_L.Text)

Case txtHEX_L.Name
    show_Values txtHEX_L.Name, "&H" & ml2(txtHEX_H.Text) & ml2(txtHEX_L.Text)
    
Case txtBIN_H.Name
    show_Values txtBIN_H.Name, "&H" & ml2(Hex(bin_to_long(txtBIN_H.Text & "b"))) & ml2(Hex(bin_to_long(txtBIN_L.Text & "b")))
    
Case txtBIN_L.Name
    show_Values txtBIN_L.Name, "&H" & ml2(Hex(bin_to_long(txtBIN_H.Text & "b"))) & ml2(Hex(bin_to_long(txtBIN_L.Text & "b")))


Case txtOCT_H.Name
    show_Values txtOCT_H.Name, "&H" & ml2(Hex(Val("&o" & txtOCT_H.Text))) & ml2(Hex(Val("&o" & txtOCT_L.Text)))
    
Case txtOCT_L.Name
    show_Values txtOCT_L.Name, "&H" & ml2(Hex(Val("&o" & txtOCT_H.Text))) & ml2(Hex(Val("&o" & txtOCT_L.Text)))


Case txtDEC_H_UNS.Name
    ' get_W_LowBits_STR() is used to get only lower part of HEX number
    ' because "-5" is converted to "FFFFFFFB", we need "FB" only (for both cases)
    show_Values txtDEC_H_UNS.Name, "&H" & get_W_LowBits_STR(Hex(txtDEC_H_UNS.Text)) & get_W_LowBits_STR(Hex(txtDEC_L_UNS.Text))
    
Case txtDEC_L_UNS.Name
    ' get_W_LowBits_STR() is used to get only lower part of HEX number
    ' because "-5" is converted to "FFFFFFFB", we need "FB" only (for both cases)
    show_Values txtDEC_L_UNS.Name, "&H" & get_W_LowBits_STR(Hex(txtDEC_H_UNS.Text)) & get_W_LowBits_STR(Hex(txtDEC_L_UNS.Text))
    

Case txtDEC_H_SGN.Name
    ' get_W_LowBits_STR() is used to get only lower part of HEX number
    ' because "-5" is converted to "FFFFFFFB", we need "FB" only (for both cases)
    show_Values txtDEC_H_SGN.Name, "&H" & get_W_LowBits_STR(Hex(txtDEC_H_SGN.Text)) & get_W_LowBits_STR(Hex(txtDEC_L_SGN.Text))
    
Case txtDEC_L_SGN.Name
    ' get_W_LowBits_STR() is used to get only lower part of HEX number
    ' because "-5" is converted to "FFFFFFFB", we need "FB" only (for both cases)
    show_Values txtDEC_L_SGN.Name, "&H" & get_W_LowBits_STR(Hex(txtDEC_H_SGN.Text)) & get_W_LowBits_STR(Hex(txtDEC_L_SGN.Text))
    

Case txtASCII_H.Name

    show_Values txtASCII_H.Name, "&H" & ml2(Hex(myAsc(txtASCII_H.Text))) & ml2(Hex(myAsc(txtASCII_L.Text)))

Case txtASCII_L.Name

    show_Values txtASCII_L.Name, "&H" & ml2(Hex(myAsc(txtASCII_H.Text))) & ml2(Hex(myAsc(txtASCII_L.Text)))


Case txtDEC_16bit_UNS.Name
    ' get_W_HighBits_STR() get_W_LowBits_STR() are used to get only lower
    ' part of HEX number because "-5" is converted
    ' to "FFFFFFFB", we need "FFFB" only
    show_Values txtDEC_16bit_UNS.Name, "&H" & get_W_HighBits_STR(Hex(txtDEC_16bit_UNS.Text)) & get_W_LowBits_STR(Hex(txtDEC_16bit_UNS.Text))

Case txtDEC_16bit_SGN.Name
    ' get_W_HighBits_STR() get_W_LowBits_STR() are used to get only lower
    ' part of HEX number because "-5" is converted
    ' to "FFFFFFFB", we need "FFFB" only
    show_Values txtDEC_16bit_SGN.Name, "&H" & get_W_HighBits_STR(Hex(txtDEC_16bit_SGN.Text)) & get_W_LowBits_STR(Hex(txtDEC_16bit_SGN.Text))




Case Else
    Debug.Print "update_VALUES: unknown source."
    bSetValue = False
    
End Select

If bSetValue Then
    ' when gets here, all textboxes should have the same value,
    ' in different systems, so we can use any textbox:
    set_RegValue iRegister_ID, ml2(txtHEX_H.Text), ml2(txtHEX_L.Text)
End If

bUPDATING = False


Exit Sub
err_uv:
    Debug.Print "update_VALUES: " & LCase(err.Description)
    bUPDATING = False
    
End Sub


' shows all values except: "sNAME_ID":
Private Sub show_Values(sNAME_ID As String, sHEX_Value As String) ' 1.28#353 (objExcept As Object, sHEX_Value As String)

On Error GoTo err_sv

Dim iWORD As Integer

Dim byteH As Byte
Dim byteL As Byte

iWORD = to_signed_int(Val(sHEX_Value))
byteH = math_get_high_byte_of_word(iWORD)
byteL = math_get_low_byte_of_word(iWORD)

If (sNAME_ID <> txtHEX_H.Name) And (sNAME_ID <> txtHEX_L.Name) Then
    txtHEX_H.Text = ml2(Hex(byteH))
    txtHEX_L.Text = ml2(Hex(byteL))
End If

If (sNAME_ID <> txtBIN_H.Name) And (sNAME_ID <> txtBIN_L.Name) Then
    txtBIN_H.Text = toBIN_BYTE(byteH)
    txtBIN_L.Text = toBIN_BYTE(byteL)
End If

If (sNAME_ID <> txtOCT_H.Name) And (sNAME_ID <> txtOCT_L.Name) Then
    txtOCT_H.Text = ml3(Oct(byteH))
    txtOCT_L.Text = ml3(Oct(byteL))
End If

If (sNAME_ID <> txtDEC_H_UNS.Name) And (sNAME_ID <> txtDEC_L_UNS.Name) Then
    txtDEC_H_UNS.Text = byteH
    txtDEC_L_UNS.Text = byteL
End If

If (sNAME_ID <> txtDEC_H_SGN.Name) And (sNAME_ID <> txtDEC_L_SGN.Name) Then
    txtDEC_H_SGN.Text = to_signed_byte(byteH)
    txtDEC_L_SGN.Text = to_signed_byte(byteL)
End If


If sNAME_ID <> txtDEC_16bit_UNS.Name Then
    txtDEC_16bit_UNS.Text = to_unsigned_long(iWORD)
End If


If sNAME_ID <> txtDEC_16bit_SGN.Name Then
    txtDEC_16bit_SGN.Text = iWORD
End If


If (sNAME_ID <> txtASCII_H.Name) And (sNAME_ID <> txtASCII_L.Name) Then
    txtASCII_H.Text = Chr(byteH)
    txtASCII_L.Text = Chr(byteL)
End If


Exit Sub
err_sv:

Debug.Print "show_Values: " & LCase(err.Description)

End Sub


Public Sub showRegister(s_16bit_REGISTER_NAME As String)

On Error GoTo err1

    bDONT_SET_REG_VALUE = True ' to avoid setting the register that we show from frmEmulation.
    

Select Case s_16bit_REGISTER_NAME

    Case "AX"
    comboRegisterName.ListIndex = 0
    Case "BX"
    comboRegisterName.ListIndex = 1
    Case "CX"
    comboRegisterName.ListIndex = 2
    Case "DX"
    comboRegisterName.ListIndex = 3
    Case "CS"
    comboRegisterName.ListIndex = 4
    Case "IP"
    comboRegisterName.ListIndex = 5
    Case "SS"
    comboRegisterName.ListIndex = 6
    Case "SP"
    comboRegisterName.ListIndex = 7
    Case "BP"
    comboRegisterName.ListIndex = 8
    Case "SI"
    comboRegisterName.ListIndex = 9
    Case "DI"
    comboRegisterName.ListIndex = 10
    Case "DS"
    comboRegisterName.ListIndex = 11
    Case "ES"
    comboRegisterName.ListIndex = 12
    Case "MEM"  ' 1.27#345
    comboRegisterName.ListIndex = 13
    Case Else
    Debug.Print "showRegister: wrong regname: " & s_16bit_REGISTER_NAME
End Select

    '  #327xq-viewer-BUG!#
    If s_16bit_REGISTER_NAME = "MEM" Then
        optByte.Value = True
    Else
        optWord.Value = True
    End If
    

    bDONT_SET_REG_VALUE = False
    
    Exit Sub
err1:
    
        bDONT_SET_REG_VALUE = False
    Debug.Print "err12: " & err.Description
    
End Sub

' updates this window only if parameter is equal to currently
' selected register in the comboRegisterName:
Public Sub showRegister_if_selected(s16bit_REGISTER_NAME As String)
    
    
On Error Resume Next ' 4.00-Beta-3
    
    bDONT_SET_REG_VALUE = True ' to avoid setting the register that we show from frmEmulation.
    
    If comboRegisterName.Text = s16bit_REGISTER_NAME Then
        update_VALUES comboRegisterName.Name    ' like click over it.
    End If
    
    bDONT_SET_REG_VALUE = False
    
End Sub

Public Sub update_info()

On Error Resume Next ' 4.00-Beta-3

    bDONT_SET_REG_VALUE = True ' to avoid setting the register that we show from frmEmulation.

    update_VALUES comboRegisterName.Name    ' like click over it.
    
    bDONT_SET_REG_VALUE = False
End Sub

Private Sub txtOCT_L_GotFocus()

On Error Resume Next ' 4.00-Beta-3

    With txtOCT_L
        .SelStart = 0
        DoEvents    ' see #306
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtOCT_L_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp
    Dim s As String
    Dim i As Integer
    
    s = UCase(Chr(KeyAscii))
    
    i = Asc(s)
    
    If ((i >= vbKeyA) And (i <= vbKeyZ)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    If ((i >= vbKey8) And (i <= vbKey9)) Then
        KeyAscii = 0 ' ignored!
    End If
    
    Exit Sub
err_kp:
    Debug.Print "Error on kp: " & LCase(err.Description)
End Sub

Private Sub optByte_Click()
On Error Resume Next ' 4.00-Beta-3
    select_deselect_according_to_byte_word_selection
End Sub

Private Sub optWord_Click()
On Error Resume Next ' 4.00-Beta-3
    select_deselect_according_to_byte_word_selection
End Sub

' 3.27w
Private Sub select_deselect_according_to_byte_word_selection()
    On Error GoTo err1
    
    Dim bVisible As Boolean
    
    bVisible = Not optByte.Value ' #327xa-ex-view-bug#  - not added.

    txtHEX_H.Visible = bVisible
    txtBIN_H.Visible = bVisible
    txtOCT_H.Visible = bVisible
    lblH.Visible = bVisible
    txtDEC_H_UNS.Visible = bVisible
    txtDEC_H_SGN.Visible = bVisible
    txtASCII_H.Visible = bVisible
    fra16bit.Visible = bVisible
        
    Exit Sub
err1:
    Debug.Print "should not produce any errors"
End Sub



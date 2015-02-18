VERSION 5.00
Begin VB.Form frm16Color_DIALOG 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "select color"
   ClientHeight    =   1830
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5580
   Icon            =   "frm16Color_DIALOG.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1830
   ScaleWidth      =   5580
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   435
      Left            =   4290
      TabIndex        =   1
      Top             =   1320
      Width           =   1185
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   435
      Left            =   2970
      TabIndex        =   0
      Top             =   1320
      Width           =   1185
   End
   Begin VB.Label lblSelected 
      AutoSize        =   -1  'True
      Caption         =   "selected:"
      Height          =   195
      Left            =   600
      TabIndex        =   19
      Top             =   1470
      Width           =   645
   End
   Begin VB.Label lblSelectedColor 
      BorderStyle     =   1  'Fixed Single
      Height          =   390
      Left            =   1365
      TabIndex        =   18
      Top             =   1395
      Width           =   390
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   15
      Left            =   4890
      TabIndex        =   17
      Top             =   690
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   14
      Left            =   4200
      TabIndex        =   16
      Top             =   690
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   13
      Left            =   3525
      TabIndex        =   15
      Top             =   690
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   12
      Left            =   2850
      TabIndex        =   14
      Top             =   690
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   11
      Left            =   2160
      TabIndex        =   13
      Top             =   690
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   10
      Left            =   1485
      TabIndex        =   12
      Top             =   690
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   9
      Left            =   795
      TabIndex        =   11
      Top             =   690
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   8
      Left            =   120
      TabIndex        =   10
      Top             =   690
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   7
      Left            =   4890
      TabIndex        =   9
      Top             =   90
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   6
      Left            =   4206
      TabIndex        =   8
      Top             =   90
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   5
      Left            =   3525
      TabIndex        =   7
      Top             =   90
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   4
      Left            =   2844
      TabIndex        =   6
      Top             =   90
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   3
      Left            =   2163
      TabIndex        =   5
      Top             =   90
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   2
      Left            =   1482
      TabIndex        =   4
      Top             =   90
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   1
      Left            =   801
      TabIndex        =   3
      Top             =   90
      Width           =   570
   End
   Begin VB.Label lblCOLOR 
      BorderStyle     =   1  'Fixed Single
      Height          =   525
      Index           =   0
      Left            =   120
      TabIndex        =   2
      Top             =   90
      Width           =   570
   End
End
Attribute VB_Name = "frm16Color_DIALOG"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' 

' 

'







' 2.03#520b

Option Explicit

Public lColor As Long

Private Sub Form_Load()
   If Load_from_Lang_File(Me) Then Exit Sub
    
    ' Me.Icon = frmMain.Icon
    
    Dim i As Byte
    
    For i = 0 To 15
        lblCOLOR(i).BackColor = getDOS_COLOR(i)
    Next i
End Sub


Private Sub Form_Activate()
    ' show currenlty selected color:
    lblSelectedColor.BackColor = lColor
End Sub

Private Sub lblCOLOR_Click(Index As Integer)
    lblSelectedColor.BackColor = lblCOLOR(Index).BackColor
End Sub

Private Sub cmdOK_Click()
On Error Resume Next
    lColor = lblSelectedColor.BackColor
    Me.Hide ' cannot unload here!!!
End Sub

Private Sub cmdCancel_Click()
On Error Resume Next
    lColor = -1 ' CANCEL CODE.
    Unload Me
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
On Error Resume Next
' interesting, but even without this code below
' this form doesn't seems to be unloaded, maybe
' because it's modal?

    If UnloadMode = vbFormControlMenu Then
            Cancel = 1
            Me.Hide
            lColor = -1 ' CANCEL CODE.
    End If
    
End Sub

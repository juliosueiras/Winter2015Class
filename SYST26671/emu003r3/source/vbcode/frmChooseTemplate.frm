VERSION 5.00
Begin VB.Form frmChooseTemplate 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "choose code template"
   ClientHeight    =   3930
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6255
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   OLEDropMode     =   1  'Manual
   ScaleHeight     =   3930
   ScaleWidth      =   6255
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   420
      Left            =   3367
      OLEDropMode     =   1  'Manual
      TabIndex        =   6
      Top             =   3420
      Width           =   1290
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   1597
      TabIndex        =   5
      Top             =   3420
      Width           =   1290
   End
   Begin VB.Frame Frame1 
      Height          =   3285
      Left            =   60
      OLEDropMode     =   1  'Manual
      TabIndex        =   7
      Top             =   0
      Width           =   6090
      Begin VB.CheckBox chkUseFASM 
         Caption         =   "use Flat Assembler / Intel syntax   [see: fasm_compatibility.asm in examples]"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   150
         TabIndex        =   9
         Top             =   2820
         Width           =   5865
      End
      Begin VB.OptionButton option_template 
         Caption         =   "the emulator"
         Height          =   315
         Index           =   5
         Left            =   3495
         OLEDropMode     =   1  'Manual
         TabIndex        =   8
         Top             =   2280
         Width           =   1500
      End
      Begin VB.OptionButton option_template 
         Caption         =   "empty workspace "
         Height          =   315
         Index           =   4
         Left            =   1170
         OLEDropMode     =   1  'Manual
         TabIndex        =   4
         Top             =   2280
         Width           =   1800
      End
      Begin VB.OptionButton option_template 
         Caption         =   "BOOT template - for creating floppy disk boot records (very advanced)"
         Height          =   315
         Index           =   3
         Left            =   135
         OLEDropMode     =   1  'Manual
         TabIndex        =   3
         Top             =   1794
         Width           =   5505
      End
      Begin VB.OptionButton option_template 
         Caption         =   "BIN template - pure binary file, allows all sorts of customizations (advanced)"
         Height          =   315
         Index           =   2
         Left            =   135
         OLEDropMode     =   1  'Manual
         TabIndex        =   2
         Top             =   1296
         Width           =   5685
      End
      Begin VB.OptionButton option_template 
         Caption         =   "EXE template - advanced executable file. header: relocation, checksum."
         Height          =   420
         Index           =   1
         Left            =   135
         OLEDropMode     =   1  'Manual
         TabIndex        =   1
         Top             =   693
         Width           =   5565
      End
      Begin VB.OptionButton option_template 
         Caption         =   "COM template - simple and tiny executable file format, pure machine code."
         Height          =   315
         Index           =   0
         Left            =   135
         OLEDropMode     =   1  'Manual
         TabIndex        =   0
         Top             =   195
         Value           =   -1  'True
         Width           =   5685
      End
   End
End
Attribute VB_Name = "frmChooseTemplate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'





' 1.25#314

Option Explicit

' 2.01#487
Private Sub cmdCancel_Click()
On Error Resume Next ' 4.00-Beta-3
    Me.Hide
End Sub

Private Sub cmdCancel_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next ' 4.00-Beta-3
Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

'Private Sub cmdOK_Click()
'
'On Error GoTo err1
'
'
'
'    ' #400b18-fasm-templates#
'    Dim bUSE_FASM As Boolean
'    If chkUseFASM.Value = vbChecked Then
'        SaveSetting "emu8086", "user", "use_fasm", "1"
'        bUSE_FASM = True
'    Else
'        SaveSetting "emu8086", "user", "use_fasm", "0"
'        bUSE_FASM = False
'    End If
'
'
'
'
'    Dim i As Integer
'
'    For i = option_template.LBound To option_template.UBound
'
'        If option_template(i).Value Then
'
'            Me.Hide   '@ #1151
'
'            DoEvents  '@ to prevent "Can't show non-modal form when modal form is displayed"
'
'            ' #327xp-make-it_remember_the_last_choice_from_choose_template#
'            SaveSetting "emu8086", "user", "template", CStr(i)
'
'            frmMain.create_NEW_source i, bUSE_FASM
'
'            Exit Sub
'
'        End If
'
'    Next i
'
'
'
'
'
'
'    Exit Sub
'err1:
'    Debug.Print "cmdOK_Click: " & Err.Description
'
'End Sub
'
' 1.29 cannot be minimized!
'''Private Sub Form_Activate()
'''    If Me.WindowState = vbMinimized Then
'''        Me.WindowState = vbNormal
'''    End If
'''End Sub

Private Sub Form_Load()

On Error GoTo err1

   If Load_from_Lang_File(Me) Then Exit Sub

   Me.Icon = frmMain.Icon
    
   ' #327xp-make-it_remember_the_last_choice_from_choose_template#
   Dim s As String
   s = GetSetting("emu8086", "user", "template", "0")
   Dim i As Integer
   i = Val(s)
   If i >= option_template.LBound And i <= option_template.UBound Then
        option_template(i).Value = True
   End If
    
    
    ' #400b18-fasm-templates#
    If GetSetting("emu8086", "user", "use_fasm", "0") = "1" Then
        chkUseFASM.Value = vbChecked
    Else
        chkUseFASM.Value = vbUnchecked
    End If
    
    
    
   Exit Sub
err1:
    Debug.Print "choosetemplate: " & Err.Description
    
End Sub

Private Sub Form_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)

    
    

On Error GoTo err_dd

    Me.Hide

If Data.GetFormat(vbCFFiles) Then
    
    If Data.Files.Count > 0 Then
        
        
        ' process like command line parameter:
        PROCESS_CMD_Line Data.Files.Item(1)
        
    End If
    
End If

Exit Sub
err_dd:
    Debug.Print "frmStartUp_OLEDragDrop: " & LCase(Err.Description)
    
End Sub

Private Sub Frame1_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next ' 4.00-Beta-3
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub option_template_OLEDragDrop(Index As Integer, Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next ' 4.00-Beta-3
    Form_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

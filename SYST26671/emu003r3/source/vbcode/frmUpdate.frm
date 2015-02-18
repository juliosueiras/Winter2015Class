VERSION 5.00
Begin VB.Form frmUpdate 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "check for an update"
   ClientHeight    =   2625
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8925
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmUpdate.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2625
   ScaleWidth      =   8925
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdLater 
      Caption         =   "later..."
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   570
      Left            =   4612
      TabIndex        =   2
      Top             =   1425
      Width           =   2880
   End
   Begin VB.CommandButton cmdCheckForUpdate 
      Caption         =   "check for an update..."
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   570
      Left            =   1432
      TabIndex        =   1
      Top             =   1425
      Width           =   2880
   End
   Begin VB.TextBox txtURL_MANUAL 
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   427
      TabIndex        =   0
      Top             =   825
      Width           =   8070
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "to disable update notification set UPDATE_CHECK=0 in emu8086.ini"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   1102
      TabIndex        =   4
      Top             =   2235
      Width           =   6720
   End
   Begin VB.Label lblInfo 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "this software is ## days old, please click the button below to check for an updated version."
      Height          =   195
      Left            =   525
      TabIndex        =   3
      Top             =   270
      Width           =   7860
   End
End
Attribute VB_Name = "frmUpdate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCheckForUpdate_Click()
On Error Resume Next
   ' kiss 2005-04-20 ' StartNewBrowser (sUPDATE_SITE_URL & sUPDATE_FILENAME_LANG_PREFIX & sUPDATE_URL_FILENAME)
   open_HTML_FILE Me, sUPDATE_SITE_URL & sUPDATE_URL_FILENAME, True
End Sub

Private Sub cmdLater_Click()
On Error Resume Next
  Me.Hide
End Sub

Private Sub Form_Load()
    
    On Error GoTo err1
    
    If Load_from_Lang_File(Me) Then Exit Sub
    
    txtURL_MANUAL.Text = sUPDATE_SITE_URL & sUPDATE_URL_FILENAME
    
    lblInfo.Caption = Replace(lblInfo.Caption, "##", CStr((CLng(Now) - RELEASE_DATE)))
    
    Exit Sub
    
err1:
    Debug.Print "frmUpdate: " & err.Description
End Sub

Private Sub txtURL_MANUAL_GotFocus()

On Error GoTo err1

    With txtURL_MANUAL
        .SelStart = 0
        DoEvents    ' 1.25#306
        .SelLength = Len(.Text)
    End With
    
    Exit Sub
    
err1:
    Debug.Print "txtURL_MANUAL_GotFocus: " & err.Description
End Sub

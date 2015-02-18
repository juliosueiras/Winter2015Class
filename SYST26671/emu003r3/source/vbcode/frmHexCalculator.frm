VERSION 5.00
Begin VB.Form frmBaseConvertor 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "base convertor"
   ClientHeight    =   3360
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3690
   Icon            =   "frmHexCalculator.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   3360
   ScaleWidth      =   3690
   Begin VB.TextBox txtASCII_L 
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
      Left            =   2100
      MaxLength       =   1
      TabIndex        =   7
      Top             =   2040
      Width           =   360
   End
   Begin VB.TextBox txtASCII_H 
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
      Left            =   1605
      MaxLength       =   1
      TabIndex        =   6
      Top             =   2040
      Visible         =   0   'False
      Width           =   360
   End
   Begin VB.Frame Frame2 
      Height          =   930
      Left            =   68
      TabIndex        =   10
      Top             =   45
      Width           =   3555
      Begin VB.OptionButton opt16bit 
         Caption         =   "16 bit"
         Height          =   255
         Left            =   1935
         TabIndex        =   1
         Top             =   180
         Width           =   1350
      End
      Begin VB.OptionButton opt8bit 
         Caption         =   "8 bit"
         Height          =   255
         Left            =   300
         TabIndex        =   0
         Top             =   180
         Value           =   -1  'True
         Width           =   1350
      End
      Begin VB.TextBox txtHEX_8bit 
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
         Left            =   1335
         MaxLength       =   2
         TabIndex        =   2
         Text            =   "0"
         Top             =   495
         Width           =   645
      End
      Begin VB.TextBox txtHEX_16bit 
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
         Left            =   1335
         MaxLength       =   4
         TabIndex        =   3
         Text            =   "0"
         Top             =   495
         Visible         =   0   'False
         Width           =   1050
      End
      Begin VB.Label lblHEX 
         AutoSize        =   -1  'True
         Caption         =   "hex:"
         Height          =   195
         Left            =   120
         TabIndex        =   17
         Top             =   570
         Width           =   300
      End
   End
   Begin VB.Frame Frame1 
      Height          =   885
      Left            =   68
      TabIndex        =   11
      Top             =   1050
      Width           =   3555
      Begin VB.TextBox txtDecSigned 
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
         Left            =   765
         MaxLength       =   6
         TabIndex        =   4
         Text            =   "0"
         Top             =   435
         Width           =   1230
      End
      Begin VB.TextBox txtDecUnsigned 
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
         Left            =   2190
         MaxLength       =   5
         TabIndex        =   5
         Text            =   "0"
         Top             =   435
         Width           =   1230
      End
      Begin VB.Label lblDec 
         AutoSize        =   -1  'True
         Caption         =   "dec:"
         Height          =   195
         Left            =   90
         TabIndex        =   16
         Top             =   510
         Width           =   315
      End
      Begin VB.Label lblSignedInt 
         AutoSize        =   -1  'True
         Caption         =   "signed"
         Height          =   195
         Left            =   1095
         TabIndex        =   15
         Top             =   180
         Width           =   465
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "unsigned"
         Height          =   195
         Left            =   2520
         TabIndex        =   14
         Top             =   180
         Width           =   645
      End
   End
   Begin VB.TextBox txtOCT 
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
      Left            =   810
      MaxLength       =   6
      TabIndex        =   8
      Text            =   "0"
      Top             =   2475
      Width           =   2745
   End
   Begin VB.TextBox txtBIN 
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
      MaxLength       =   16
      TabIndex        =   9
      Text            =   "00000000"
      Top             =   2925
      Width           =   2745
   End
   Begin VB.Label lblASCII 
      AutoSize        =   -1  'True
      Caption         =   "ascii char:"
      Height          =   195
      Left            =   450
      TabIndex        =   18
      Top             =   2115
      Width           =   720
   End
   Begin VB.Label lbOCT 
      AutoSize        =   -1  'True
      Caption         =   "oct:"
      Height          =   195
      Left            =   120
      TabIndex        =   13
      Top             =   2565
      Width           =   270
   End
   Begin VB.Label lblBIN 
      AutoSize        =   -1  'True
      Caption         =   "bin:"
      Height          =   195
      Left            =   135
      TabIndex        =   12
      Top             =   3000
      Width           =   255
   End
End
Attribute VB_Name = "frmBaseConvertor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' 

' 

'




Option Explicit

' true when updating text boxes:
Dim bSHOWING As Boolean

'===================================================
' 1.25#305
' updating without requiring "Enter" press.
' these boolean will prevent from updating the source
' text box. Update_from_Hex() will not update the text
' box if its flag set to "True"
Dim bSKIP_txtDecSigned As Boolean
Dim bSKIP_txtDecUnsigned As Boolean
Dim bSKIP_txtASCII_H As Boolean
Dim bSKIP_txtASCII_L As Boolean
Dim bSKIP_txtOCT As Boolean
Dim bSKIP_txtBIN As Boolean
' txtHEX_8bit and txtHEX_16bit don't need flags
' because Update_from_Hex() does not updates them,
' instead their values are modified directly by other
' textboxes Change events.
'===================================================


' #400b4-mini-8#
Private Sub Form_Activate()
On Error Resume Next
    If SHOULD_DO_MINI_FIX_8 Then
        If StrComp(txtASCII_L.Font.Name, "Terminal", vbTextCompare) = 0 Then
            If txtASCII_L.Font.Size < 12 Then
                txtASCII_L.Font.Size = 12
                txtASCII_H.Font.Size = 12
            End If
        End If
    End If
End Sub

Private Sub Form_Load()
On Error Resume Next

   If Load_from_Lang_File(Me) Then Exit Sub
    
    
       
    
    
    GetWindowPos Me ' 2.05#551
    
    ' Me.Icon = frmMain.Icon
        
    bSHOWING = False
        
    bSKIP_txtDecSigned = False
    bSKIP_txtDecUnsigned = False
    bSKIP_txtASCII_H = False
    bSKIP_txtASCII_L = False
    bSKIP_txtOCT = False
    bSKIP_txtBIN = False
    

    
End Sub



' 1.29#404 Private Sub Form_Activate()
Public Sub DoShowMe()
On Error Resume Next '3.27xm
    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
End Sub



Public Sub Update_from_Hex()
On Error GoTo err_update_from_hex

    bSHOWING = True
    
    Dim s As String
    
    ' 1.25#305
    ' make update only from HEX fields!!!
    Dim iSigned As Integer
    Dim lUnsigned As Long
    
    
    
    If txtHEX_16bit.Visible Then
        s = txtHEX_16bit.Text
    Else
        s = txtHEX_8bit.Text
    End If
    
    If txtHEX_8bit.Visible Then
        iSigned = to_signed_byte(Val("&H" & s))
    Else
        iSigned = to_signed_int(Val("&H" & s))
    End If
    
    If Not bSKIP_txtDecSigned Then
        txtDecSigned.Text = iSigned
    End If
    
    lUnsigned = to_unsigned_long(Val("&H" & s))
    
    If Not bSKIP_txtDecUnsigned Then
        txtDecUnsigned.Text = lUnsigned
    End If
    
    If Not bSKIP_txtOCT Then
        txtOCT.Text = Oct(lUnsigned) 'Val( txtDecUnsigned.Text))
    End If
    
    If Not bSKIP_txtBIN Then
        If txtHEX_8bit.Visible Then
            txtBIN.Text = toBIN_BYTE(to_unsigned_byte(iSigned))       'Val(txtDecUnsigned.Text))
        Else
            txtBIN.Text = toBIN_WORD(iSigned)   ' Val(txtDecSigned.Text))
        End If
    End If
    
    If txtHEX_8bit.Visible Then
        If Not bSKIP_txtASCII_L Then
            txtASCII_L.Text = Chr(lUnsigned) 'Val(txtDecUnsigned.Text))
        End If
    Else
        If (Not bSKIP_txtASCII_H) And (Not bSKIP_txtASCII_L) Then
            txtASCII_H.Text = Chr(Val("&H" & get_W_HighBits_STR(txtHEX_16bit.Text)))
            txtASCII_L.Text = Chr(Val("&H" & get_W_LowBits_STR(txtHEX_16bit.Text)))
        End If
    End If
    
    bSHOWING = False
    
    ' 1.25#305
    ' reset, will be set on next change event if required:
    bSKIP_txtDecSigned = False
    bSKIP_txtDecUnsigned = False
    bSKIP_txtASCII_H = False
    bSKIP_txtASCII_L = False
    bSKIP_txtOCT = False
    bSKIP_txtBIN = False
    
    Exit Sub
err_update_from_hex:
    Debug.Print "Error Update_from_Hex: " & LCase(err.Description)
    bSHOWING = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
    SaveWindowState Me ' 2.05#551
End Sub

Private Sub opt16bit_Click()

On Error Resume Next

    If opt8bit.Value Then
        txtHEX_8bit.Visible = True
        txtHEX_16bit.Visible = False
        txtASCII_H.Visible = False
    Else
        txtHEX_8bit.Visible = False
        txtHEX_16bit.Visible = True
        txtASCII_H.Visible = True
    End If
    
    DoEvents ' #327xo-bs#

    Update_from_Hex
End Sub

Private Sub opt8bit_Click()

On Error Resume Next

    If opt8bit.Value Then
        txtHEX_8bit.Visible = True
        txtHEX_16bit.Visible = False
        txtASCII_H.Visible = False
    Else
        txtHEX_8bit.Visible = False
        txtHEX_16bit.Visible = True
        txtASCII_H.Visible = True
    End If

    DoEvents ' #327xo-bs#

    Update_from_Hex
End Sub

Private Sub txtASCII_H_Change()

On Error GoTo err_thkp

        If bSHOWING Then Exit Sub

        bSHOWING = True
    
        bSKIP_txtASCII_H = True

        Dim i As Integer
        
        If txtASCII_H.Visible Then
            i = to_signed_int(to16bit_SIGNED(myAsc(txtASCII_L.Text), myAsc(txtASCII_H.Text)))
        Else
            i = to_signed_int(myAsc(txtASCII_L.Text))
        End If

        If i < 256 And i >= -128 Then
            If opt16bit.Value Then
                txtHEX_16bit.Text = Hex(i)
            Else
                txtHEX_8bit.Text = get_W_LowBits_STR(Hex(i))
            End If
        Else
            If opt8bit.Value Then opt16bit.Value = True
            txtHEX_16bit.Text = Hex(i)
        End If
        
        Update_from_Hex
        
        bSHOWING = False
         
    Exit Sub
err_thkp:
    Debug.Print "Error on txtASCII_H_Change: " & LCase(err.Description)
    bSHOWING = False
End Sub

Private Sub txtASCII_H_KeyPress(KeyAscii As Integer)
On Error Resume Next


    If KeyAscii = vbKeyReturn Then
        
        KeyAscii = 0
        
        Update_from_Hex  ' force update all!
        
    End If
    
End Sub

Private Sub txtASCII_H_GotFocus()

On Error Resume Next
    txtASCII_H.SelStart = 0
    DoEvents    ' 1.25#306
    txtASCII_H.SelLength = Len(txtASCII_H.Text)
End Sub

Private Sub txtASCII_L_Change()
        

On Error GoTo err_tlkp

        If bSHOWING Then Exit Sub
        
        bSHOWING = True

        bSKIP_txtASCII_L = True

        Dim i As Integer
        
        If txtASCII_H.Visible Then
            i = to_signed_int(to16bit_SIGNED(myAsc(txtASCII_L.Text), myAsc(txtASCII_H.Text)))
        Else
            i = to_signed_int(myAsc(txtASCII_L.Text))
        End If

        If i < 256 And i >= -128 Then
            If opt16bit.Value Then
                txtHEX_16bit.Text = Hex(i)
            Else
                txtHEX_8bit.Text = get_W_LowBits_STR(Hex(i))
            End If
        Else
            If opt8bit.Value Then opt16bit.Value = True
            txtHEX_16bit.Text = Hex(i)
        End If
        
        Update_from_Hex
        
        bSHOWING = False
         
    Exit Sub
err_tlkp:
    Debug.Print "Error on txtASCII_L_Change: " & LCase(err.Description)
    bSHOWING = False
End Sub

Private Sub txtASCII_L_KeyPress(KeyAscii As Integer)

On Error Resume Next ' 4.00-Beta-3

    If KeyAscii = vbKeyReturn Then
        
        KeyAscii = 0
        
        Update_from_Hex  ' force update all!
        
    End If
    
End Sub

Private Sub txtASCII_L_GotFocus()

On Error Resume Next ' 4.00-Beta-3

    txtASCII_L.SelStart = 0
    DoEvents    ' 1.25#306
    txtASCII_L.SelLength = Len(txtASCII_L.Text)
End Sub

Private Sub txtBIN_Change()

On Error Resume Next

        If bSHOWING Then Exit Sub
        
        bSHOWING = True

        bSKIP_txtBIN = True

        Dim i As Integer
        i = to_signed_int(bin_to_long(txtBIN.Text & "b"))

        If i < 256 And i >= -128 Then
            If opt16bit.Value Then
                txtHEX_16bit.Text = Hex(i)
            Else
                txtHEX_8bit.Text = get_W_LowBits_STR(Hex(i))
            End If
            Update_from_Hex
        Else
            If opt8bit.Value Then opt16bit.Value = True
            txtHEX_16bit.Text = Hex(i)
            Update_from_Hex
        End If
        
        bSHOWING = False
End Sub

Private Sub txtBIN_KeyPress(KeyAscii As Integer)

On Error GoTo err_kp

    If KeyAscii = vbKeyReturn Then
    
        KeyAscii = 0
       
        Update_from_Hex  ' force update all!
        
        Exit Sub
    End If
    

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

Private Sub txtBIN_GotFocus()

On Error Resume Next ' 4.00-Beta-3

    txtBIN.SelStart = 0
    DoEvents    ' 1.25#306
    txtBIN.SelLength = Len(txtBIN.Text)
End Sub

Private Sub txtDecSigned_Change()
        
On Error Resume Next ' 4.00-Beta-3
        
        If bSHOWING Then Exit Sub
        bSHOWING = True

        bSKIP_txtDecSigned = True

        Dim i As Integer
        i = to_signed_int(Val(txtDecSigned.Text))

        If i < 256 And i >= -128 Then
            If opt16bit.Value Then
                txtHEX_16bit.Text = Hex(i)
            Else
                txtHEX_8bit.Text = get_W_LowBits_STR(Hex(i))
            End If
            Update_from_Hex
        Else
            If opt8bit.Value Then opt16bit.Value = True
            txtHEX_16bit.Text = Hex(i)
            Update_from_Hex
        End If
        
        bSHOWING = False
End Sub

Private Sub txtDecSigned_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp

    If KeyAscii = vbKeyReturn Then
        
        KeyAscii = 0
        
        Update_from_Hex  ' force update all!
        
        Exit Sub
    End If
    

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

Private Sub txtDecSigned_GotFocus()

On Error Resume Next ' 4.00-Beta-3

    txtDecSigned.SelStart = 0
    DoEvents    ' 1.25#306
    txtDecSigned.SelLength = Len(txtDecSigned.Text)
End Sub

Private Sub txtDecUnsigned_Change()
        
On Error Resume Next ' 4.00-Beta-3
        
        If bSHOWING Then Exit Sub
        
        bSHOWING = True
        
        bSKIP_txtDecUnsigned = True
        
        Dim i As Integer
        i = to_signed_int(Val(txtDecUnsigned.Text))
        If i < 256 And i >= -128 Then
            If opt16bit.Value Then
                txtHEX_16bit.Text = Hex(i)
            Else
                txtHEX_8bit.Text = get_W_LowBits_STR(Hex(i))
            End If
            Update_from_Hex
        Else
            If opt8bit.Value Then opt16bit.Value = True
            txtHEX_16bit.Text = Hex(i)
            Update_from_Hex
        End If
        
        bSHOWING = False
End Sub

Private Sub txtDecUnsigned_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp

    If KeyAscii = vbKeyReturn Then
    
        KeyAscii = 0
             
        Update_from_Hex  ' force update all!
        
        Exit Sub
    End If
    
    

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

Private Sub txtDecUnsigned_GotFocus()

On Error Resume Next ' 4.00-Beta-3

    txtDecUnsigned.SelStart = 0
    DoEvents    ' 1.25#306
    txtDecUnsigned.SelLength = Len(txtDecUnsigned.Text)
End Sub

Private Sub txtHEX_16bit_Change()

On Error Resume Next ' 4.00-Beta-3

    If bSHOWING Then Exit Sub
    
    Update_from_Hex
End Sub

Private Sub txtHEX_16bit_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp

    If KeyAscii = vbKeyReturn Then
    
        KeyAscii = 0
        
        Update_from_Hex  ' force update all!
        
        Exit Sub
    End If
    

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

Private Sub txtHEX_16bit_GotFocus()

On Error Resume Next ' 4.00-Beta-3

    txtHEX_16bit.SelStart = 0
    DoEvents    ' 1.25#306
    txtHEX_16bit.SelLength = Len(txtHEX_16bit.Text)
End Sub

Private Sub txtHEX_8bit_Change()

On Error Resume Next ' 4.00-Beta-3

    If bSHOWING Then Exit Sub
    
    Update_from_Hex
End Sub

Private Sub txtHEX_8bit_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp

    If KeyAscii = vbKeyReturn Then
    
        KeyAscii = 0
        
        Update_from_Hex  ' force update all!
        
        Exit Sub
    End If
    

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

Private Sub txtHEX_8bit_GotFocus()

On Error Resume Next ' 4.00-Beta-3

    txtHEX_8bit.SelStart = 0
    DoEvents    ' 1.25#306
    txtHEX_8bit.SelLength = Len(txtHEX_8bit.Text)
End Sub

Private Sub txtOCT_Change()

On Error Resume Next ' 4.00-Beta-3

        If bSHOWING Then Exit Sub
        
        bSHOWING = True
        
        bSKIP_txtOCT = True
        
        Dim i As Integer
        i = to_signed_int(Val("&o" & txtOCT.Text))
        If i < 256 And i >= -128 Then
            If opt16bit.Value Then
                txtHEX_16bit.Text = Hex(i)
            Else
                txtHEX_8bit.Text = get_W_LowBits_STR(Hex(i))
            End If
            Update_from_Hex
        Else
            If opt8bit.Value Then opt16bit.Value = True
            txtHEX_16bit.Text = Hex(i)
            Update_from_Hex
        End If

        bSHOWING = False
        
End Sub

Private Sub txtOCT_KeyPress(KeyAscii As Integer)
On Error GoTo err_kp

    If KeyAscii = vbKeyReturn Then
    
        KeyAscii = 0
       
        Update_from_Hex  ' force update all!
        
        Exit Sub
    End If
    

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

Private Sub txtOCT_GotFocus()

On Error Resume Next ' 4.00-Beta-3

    txtOCT.SelStart = 0
    DoEvents    ' 1.25#306
    txtOCT.SelLength = Len(txtOCT.Text)
End Sub


' 1.25#290
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next ' 4.00-Beta-3
    frmEmulation.process_HotKey KeyCode, Shift
End Sub

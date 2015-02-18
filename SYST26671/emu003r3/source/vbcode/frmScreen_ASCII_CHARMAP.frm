VERSION 5.00
Begin VB.Form frmScreen_ASCII_CHARMAP 
   Caption         =   "256 ascii chars. 8x8 each."
   ClientHeight    =   2265
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   2130
   LinkTopic       =   "Form1"
   ScaleHeight     =   151
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   142
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox pic8x8 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   120
      Left            =   1950
      ScaleHeight     =   8
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   8
      TabIndex        =   1
      Top             =   1005
      Width           =   120
   End
   Begin VB.PictureBox pic_chars_8x8 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   2160
      Left            =   15
      Picture         =   "frmScreen_ASCII_CHARMAP.frx":0000
      ScaleHeight     =   144
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   120
      TabIndex        =   0
      Top             =   15
      Width           =   1800
   End
End
Attribute VB_Name = "frmScreen_ASCII_CHARMAP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' making 327u-print_in_13h_mode.asm work

'    15 cols x 17 rows = 255 chars + 1 char = 256 chars or FF
'
'    bell, backspace, tab, new line, carrige return --- do not have a char!
'
'    to calculate the position of an ascii char use this formula:
'
'    x = (ascii % 15) * 8
'    Y = (ascii / 15) * 8

Option Explicit

Dim char_bit_array(0 To 63) As Boolean

' copy character from the map to pic8x8 with specified color
' (this sub isn't used, but it was used as prepare_char_bit_array() prototype )
Private Sub prepare_char_in_pix8x8(byteChar As Byte, lForeColor As Long, lBackColor As Long)

On Error GoTo err1

    pic8x8.BackColor = lBackColor

    Dim X As Single
    Dim Y As Single

    X = Fix((byteChar Mod 15)) * 8
    Y = Fix((byteChar / 15)) * 8
    
    Dim ix As Single
    Dim iy As Single
    Dim lColor As Long ' jic, in case vb returns diffent colors something...
    
    lColor = pic_chars_8x8.Point(110, 140) ' must be white.
    
    For ix = 0 To 7
        For iy = 0 To 7
            If lColor = pic_chars_8x8.Point(X + ix, Y + iy) Then
                pic8x8.PSet (ix, iy), lForeColor
            End If
        Next iy
    Next ix
    
    Exit Sub
err1:
    Debug.Print "prepare_char_in_pix8x8: " & err.Description
End Sub



Private Sub prepare_char_bit_array(byteChar As Byte)

On Error GoTo err1

    Dim X As Single
    Dim Y As Single

    X = Fix((byteChar Mod 15)) * 8
    Y = Fix((byteChar / 15)) * 8
    
    Dim ix As Single
    Dim iy As Single
    Dim lColor As Long ' jic, in case vb returns diffent colors something...
    
    lColor = pic_chars_8x8.Point(110, 140) ' must be white.
    
    Dim curI As Integer
    
    curI = 0
    
    For iy = 0 To 7
        For ix = 0 To 7
            If lColor = pic_chars_8x8.Point(X + ix, Y + iy) Then
                char_bit_array(curI) = True
            Else
                char_bit_array(curI) = False
            End If
            curI = curI + 1
        Next ix
    Next iy
    
    Exit Sub
err1:
    Debug.Print "prepare_char_bit_array: " & err.Description
End Sub



' should work for mode 13h/int10h
Public Sub draw_char_to_video_memory(byteChar As Byte, lADDRESS As Long, byteCharAttrib As Byte)
    
    On Error GoTo err1
    
    
    prepare_char_bit_array byteChar
    
    
    
    Dim i As Long
    
    Dim byteBackColor As Byte
    Dim byteForeColor As Byte
    
    
    ' character attribute is 8 bit value, low 4 bits set foreground color, high 4 bits set background color. background blinking not supported.
    Dim bBackColor As Byte
    Dim bForeColor As Byte
    ' get high nibble,
    ' move it to low position:
    bBackColor = Fix(byteCharAttrib / 16)
    ' leave first 4 bits only,
    ' reset high nibble:
    bForeColor = byteCharAttrib And 15

    Dim i2 As Long
    Dim i3 As Long
    
    i3 = 0
    Dim i8count As Integer
    i8count = 0
    
    For i = 0 To 63  ' 8*8-1
        
        If i8count = 8 Then
            i3 = i3 + frmScreen.picSCREEN.ScaleWidth - 8
            i8count = 0
        End If
        
        i2 = i + lADDRESS + i3
        
        If char_bit_array(i) Then
            RAM.mWRITE_BYTE i2, bForeColor
        Else
            RAM.mWRITE_BYTE i2, bBackColor
        End If
        
        frmScreen.updatePIXEL_at_loc i2, False
        
       
        i8count = i8count + 1
        
    Next i
    
    Exit Sub
err1:
    Debug.Print "draw_char_to_video_memory: " & err.Description
    
End Sub

' 4.00-Beta-3  seems like we left a few tools in here? :)
''
''Private Sub Form_Click()
''
''   ' prepare_char Asc("a"), vbRed, vbYellow
''   draw_char_to_video_memory Asc("R"), &HA0000, 207
''End Sub


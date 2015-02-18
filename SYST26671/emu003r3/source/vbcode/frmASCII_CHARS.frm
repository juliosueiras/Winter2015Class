VERSION 5.00
Begin VB.Form frmASCII_CHARS 
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   Caption         =   "ascii codes"
   ClientHeight    =   2265
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3540
   FillColor       =   &H80000008&
   ForeColor       =   &H80000008&
   Icon            =   "frmASCII_CHARS.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2265
   ScaleWidth      =   3540
End
Attribute VB_Name = "frmASCII_CHARS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' #327r-ascii#

Option Explicit

Dim bSHOW_DECIMAL As Boolean '3.27w

Public Sub DoShowMe()
On Error Resume Next
    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
End Sub



Private Sub Form_Click()
On Error Resume Next
    bSHOW_DECIMAL = Not bSHOW_DECIMAL ' 3.27w
    draw_ascii                        ' 3.27w
End Sub


' #400b4-mini-8#
Private Sub Form_Activate()
On Error Resume Next
    If SHOULD_DO_MINI_FIX_8 Then
        If StrComp(Me.Font.Name, "Terminal", vbTextCompare) = 0 Then
            If Me.Font.Size < 12 Then
                Me.Font.Size = 12
                draw_ascii
            End If
        End If
    End If
End Sub



Private Sub Form_Load()
On Error GoTo err1
    
    b_LOADED_frmASCII_CHARS = True

    bSHOW_DECIMAL = True

    draw_ascii
    
    Exit Sub
err1:
    Debug.Print "frmASCII..." & Err.Description
End Sub

Public Sub draw_ascii()
   On Error GoTo err1

    Me.Font.Name = frmScreen.picSCREEN.Font.Name
    Me.Font.Italic = frmScreen.picSCREEN.Font.Italic
    Me.Font.Size = frmScreen.picSCREEN.Font.Size
    Me.Font.Underline = frmScreen.picSCREEN.Font.Underline
    Me.Font.Charset = frmScreen.picSCREEN.Font.Charset
    Me.Font.Weight = frmScreen.Font.Weight
    Me.Font.Bold = frmScreen.picSCREEN.Font.Bold
    
    
    Me.Cls

    Dim fColumn As Single
    Dim iRowCount As Integer
    
    Dim stdSize As Single
       
    

    stdSize = Me.TextWidth(" 000: " & "    ")

    
    fColumn = 100
    iRowCount = 0
    Me.CurrentY = 100
    
    Dim i As Integer
    
    For i = 0 To 255
    
        If iRowCount >= 32 Then
            iRowCount = 0
            fColumn = fColumn + stdSize
            Me.CurrentY = 100
        End If
          
        Me.CurrentX = fColumn
        
        If bSHOW_DECIMAL Then
            Me.ForeColor = RGB(117, 117, 117)
            Me.Print make_min_len(CStr(i), 3, "0") & ": ";
        Else
            Me.ForeColor = RGB(0, 117, 0)
            Me.Print " " & make_min_len(Hex(i), 2, "0") & ": ";
        End If
        
         
        If i = 0 Then
            Me.ForeColor = vbRed
            Me.Print "null"
        ElseIf i = 7 Then
            Me.ForeColor = vbRed
            Me.Print "beep"
        ElseIf i = 8 Then
            Me.ForeColor = vbRed
            Me.Print "back"
        ElseIf i = 10 Then
            Me.ForeColor = vbRed
            Me.Print "newl"
        ElseIf i = 13 Then
            Me.ForeColor = vbRed
            Me.Print "cret"
        ElseIf i = Asc(vbTab) Then
            Me.ForeColor = vbRed
            Me.Print "tab"
        ElseIf i = 32 Then
            Me.ForeColor = vbRed
            Me.Print "spa"
        ElseIf i = 255 Then
            Me.ForeColor = vbRed
            Me.Print "res"
        Else
            Me.ForeColor = vbBlack
            Me.Print Chr(i)
        End If
          
        iRowCount = iRowCount + 1
        
    Next i
    
    
    ' make sure all chars are visible:
    Dim diff As Single
    diff = Me.Width - Me.ScaleWidth
    If Me.ScaleWidth <= fColumn + stdSize Then
        Me.Width = fColumn + diff + stdSize
    End If
    diff = Me.Height - Me.ScaleHeight
    If Me.ScaleHeight <= Me.CurrentY Then
        Me.Height = Me.CurrentY + diff + 100
    End If
    
    
    
    
    
    Exit Sub
err1:
    Debug.Print "frmASCII_CHARS.draw_ascii: " & Err.Description
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
    b_LOADED_frmASCII_CHARS = False
End Sub

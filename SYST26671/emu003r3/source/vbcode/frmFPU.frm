VERSION 5.00
Begin VB.Form frmFPU 
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   Caption         =   "FPU"
   ClientHeight    =   1680
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   2805
   ForeColor       =   &H80000008&
   Icon            =   "frmFPU.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   1680
   ScaleWidth      =   2805
End
Attribute VB_Name = "frmFPU"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' 4.00b20

Option Explicit


Public Sub DoShowMe()
On Error Resume Next
    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
End Sub


Private Sub Form_Load()
On Error Resume Next

    b_LOADED_frmFPU = True
    
    GetWindowPos Me
    
    Me.Font.Name = frmEmulation.picMemList.Font.Name
    Me.Font.Size = frmEmulation.picMemList.Font.Size
    Me.Font.Weight = frmEmulation.picMemList.Font.Weight
    Me.FontTransparent = False
    
    Me.AutoRedraw = True
    
    
    
    If SHOULD_DO_MINI_FIX_8 Then
        If StrComp(Me.Font.Name, "Terminal", vbTextCompare) = 0 Then
            If Me.Font.Size < 12 Then
                Me.Font.Size = 12
            End If
        End If
    End If
    
    
    
    showFPU_STATE

End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    b_LOADED_frmFPU = False
End Sub


Public Sub showFPU_STATE()
On Error GoTo err1

    Dim i As Integer
    Dim k As Integer
    
    
    Me.Cls
    
    Me.BackColor = SystemColorConstants.vbWindowBackground  '  vbWhite
    
    
    Me.ForeColor = SystemColorConstants.vbWindowText   'RGB(177, 177, 177)
    Me.Print " control register:"
    
    
    Me.ForeColor = SystemColorConstants.vbWindowText  ' vbBlack
    
    For i = 13 To 0 Step -1
        Me.Print " " & byteHEX(fpuGLOBAL_STATE.fpuControl(i));
    Next i
    
    Me.Print " ";  ' one more space (:for buity:)
    
    Dim snBigX As Single
    snBigX = Me.CurrentX
    
    Me.Print " "  '  new line
    Me.ForeColor = SystemColorConstants.vbWindowText   'RGB(177, 177, 177)
    Me.Print " FPU registers:"
    
    Me.ForeColor = SystemColorConstants.vbWindowText   'vbBlack
    
    
    For k = 0 To 7
        For i = 9 To 0 Step -1
            Me.Print " " & byteHEX(fpuGLOBAL_STATE.fpuReg(k).fpuBYTE(i));
        Next i
        Me.Print " "  '  new line
    Next k



    ' make sure all chars are visible:
    Dim diff As Single
    diff = Me.Width - Me.ScaleWidth
    If Me.ScaleWidth <= snBigX Then
        Me.Width = snBigX + diff + 100
    End If
    diff = Me.Height - Me.ScaleHeight
    If Me.ScaleHeight <= Me.CurrentY Then
        Me.Height = Me.CurrentY + diff + 100
    End If
    
    

Exit Sub
err1:
Debug.Print "showFPU_STATE : " & Err.Description
Resume Next
End Sub

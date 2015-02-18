VERSION 5.00
Begin VB.Form frmStack 
   Caption         =   "stack"
   ClientHeight    =   4020
   ClientLeft      =   60
   ClientTop       =   165
   ClientWidth     =   2415
   Icon            =   "frmStack.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   4020
   ScaleWidth      =   2415
   Begin VB.ListBox lstStack 
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   9
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3660
      IntegralHeight  =   0   'False
      Left            =   30
      TabIndex        =   0
      Top             =   30
      Width           =   2145
   End
End
Attribute VB_Name = "frmStack"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'



' 1.10
' this form shows stack
' memory at SS:SP and below until SS:0000

Option Explicit


Public lShownFromAddress As Long
Public lShownUntilAddress As Long


' 1.29#404 Private Sub Form_Activate()
Public Sub DoShowMe()
On Error GoTo err1
    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
    
    setStackView
    
    Exit Sub
err1:
    Debug.Print "frmStack.DoShowMe: " & Err.Description
End Sub

Public Sub setStackView()
 On Error GoTo err_ssv
    
    Dim L As Long
    Dim lOrigSP As Long
    Dim iSS As Integer
    Dim iSP As Integer
    Dim stackSegAdr As Long
    Dim lShowFrom As Long
    Dim lShowUntil As Long
    
    ' 1.30#409:
    ' preventing flickering:
    Dim iListItem As Integer
    Dim s As String
    
    
    iSS = Val("&H" & frmEmulation.txtSS)
    iSP = Val("&H" & frmEmulation.txtSP)
    
    lOrigSP = to_unsigned_long(iSP)
    
    stackSegAdr = to_unsigned_long(iSS) * 16
    
    ' 1.30#409 lstStack.Clear
    
    ' we will show only 50 (total 100 bytes) top
    '  stack values (maximum - can show less):
    
    lShowFrom = to_unsigned_long(iSP) + 50
    lShowUntil = to_unsigned_long(iSP) - 50
    
    If lShowUntil < 0 Then lShowUntil = 0
    If lShowFrom > 65535 Then lShowFrom = 65534 ' FFFE (max even value)
    
    iListItem = 0
    
    For L = lShowFrom To lShowUntil Step -2
        ' 1.30#409 lstStack.AddItem make_min_len(Hex(iSS), 4, "0") & ":" & make_min_len(Hex(l), 4, "0") & "  " & make_min_len(Hex(RAM.mREAD_WORD(stackSegAdr + l)), 4, "0")
        
        s = make_min_len(Hex(iSS), 4, "0") & ":" & make_min_len(Hex(L), 4, "0") & "  " & make_min_len(Hex(RAM.mREAD_WORD(stackSegAdr + L)), 4, "0")
        
        If lstStack.List(iListItem) <> s Then
            lstStack.List(iListItem) = s
        End If
               
        iSP = iSP - 2
        
        iListItem = iListItem + 1
    Next L


    ' 1.30#409
    ' remove unused items:
    Do While iListItem < lstStack.ListCount
          lstStack.RemoveItem (lstStack.ListCount - 1) ' remove last item.
    Loop
    
    
    
    ' show position of SS:SP
    ' 2.09#576
    Dim iXX As Integer
    iXX = (lShowFrom - lOrigSP) / 2
    lstStack.List(iXX) = lstStack.List(iXX) & " <"
    If bDO_NOT_SET_ListIndex_for_STACK Then
        bDO_NOT_SET_ListIndex_for_STACK = False
        Debug.Print "xx: " & (lShowFrom - to_unsigned_long(Val("&H" & frmExtendedViewer.txtMemOffset.Text))) / 2
        lstStack.ListIndex = (lShowFrom - to_unsigned_long(Val("&H" & frmExtendedViewer.txtMemOffset.Text))) / 2
        ' (to_unsigned_long(Val("&H" & frmExtendedViewer.txtMemSegment)) * 16 +
    Else
        lstStack.ListIndex = iXX
    End If
    ' 2.09#576 lstStack.ListIndex = (lShowFrom - lOrigSP) / 2
    ' 2.09#576 lstStack.List(lstStack.ListIndex) = lstStack.List(lstStack.ListIndex) & " <"

   
    
    ' used to check when need to update the list,
    ' note that since we shown the stack from the top here we
    ' swap the values:
    lShownFromAddress = to_unsigned_long(iSS) * 16 + lShowUntil
    lShownUntilAddress = to_unsigned_long(iSS) * 16 + lShowFrom
    
    ' Debug.Print "stack:" & Hex(lShownFromAddress), Hex(lShownUntilAddress)
    
    ' Debug.Print "Stack view updated! " & Timer
    
    Exit Sub
err_ssv:
    Debug.Print "Error on setStackView(): " & LCase(Err.Description)
End Sub

Private Sub Form_Activate()

On Error Resume Next

    '  4.00-Beta-5
    lstStack.Font.Name = frmEmulation.picMemList.Font.Name
    lstStack.Font.Size = frmEmulation.picMemList.Font.Size
    lstStack.Font.Weight = frmEmulation.picMemList.Font.Weight
        

    ' #400b4-mini-8#  added in version 4.00-Beta-5 only with a check "terminal" in a few other places.
    If SHOULD_DO_MINI_FIX_8 Then
      If StrComp(lstStack.Font.Name, "Terminal", vbTextCompare) = 0 Then
        If lstStack.Font.Size < 12 Then
            lstStack.Font.Size = 12
        End If
      End If
    End If
    
End Sub

Private Sub Form_Load()
On Error Resume Next
    If Load_from_Lang_File(Me) Then Exit Sub
    
    'GetWindowPos Me ' 2.05#551
    'GetWindowSize Me ' 2.05#551
    
    ' Me.Icon = frmMain.Icon
    
    b_LOADED_frmStack = True  ' 2.03#518
End Sub


Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
On Error Resume Next
    b_LOADED_frmStack = False ' 2.03#518
End Sub

Private Sub Form_Resize()
    On Error GoTo err_res
    
    lstStack.Left = 0
    lstStack.Top = 0
    
    lstStack.Width = Me.ScaleWidth
    lstStack.Height = Me.ScaleHeight
    
    Exit Sub
err_res:
    Debug.Print "Error on frmStack.Resize: " & LCase(Err.Description)
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
    'SaveWindowState Me ' 2.05#551
End Sub

' 1.19
Private Sub lstStack_DblClick()
    On Error GoTo err_dblclk_stack
    
    
  ' 2.09#576
  '   frmHexCalculator.DoShowMe
  '   frmHexCalculator.txtHEX_16bit.Text = make_min_len(Hex(RAM.mREAD_BYTE(lShownUntilAddress - lstStack.ListIndex * 2 + 1)), 2, "0") & make_min_len(Hex(RAM.mREAD_BYTE(lShownUntilAddress - lstStack.ListIndex * 2)), 2, "0")
  '   frmHexCalculator.txtHEX_8bit.Text = make_min_len(Hex(RAM.mREAD_BYTE(lShownUntilAddress - lstStack.ListIndex * 2)), 2, "0")
  '   frmHexCalculator.Update_from_Hex
     
    ' 2.09#576
    Dim iSS As Integer
    iSS = Val("&H" & frmEmulation.txtSS)
    
    frmExtendedViewer.DoShowMe
    frmExtendedViewer.txtMemSegment.Text = make_min_len(Hex(iSS), 4, "0")
    frmExtendedViewer.txtMemOffset.Text = make_min_len(Hex(lShownUntilAddress - to_signed_int(to_unsigned_long(lstStack.ListIndex * 2)) - to_unsigned_long(iSS) * 16), 4, "0")
     
     
     
     'Debug.Print "s2:" & Hex(lShownFromAddress), Hex(lShownUntilAddress)
     Exit Sub
     
err_dblclk_stack:
    Debug.Print "Error lstStack_DblClick(): " & LCase(Err.Description)
     
End Sub

' 1.23
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next
    frmEmulation.process_HotKey KeyCode, Shift
End Sub

VERSION 5.00
Begin VB.Form frmVars 
   Caption         =   "variables"
   ClientHeight    =   3015
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3585
   Icon            =   "frmVars.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   3015
   ScaleWidth      =   3585
   Begin VB.ListBox listVars 
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   9
         Charset         =   255
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1770
      IntegralHeight  =   0   'False
      ItemData        =   "frmVars.frx":038A
      Left            =   30
      List            =   "frmVars.frx":038C
      TabIndex        =   0
      Top             =   1155
      Width           =   3495
   End
   Begin VB.Frame Frame1 
      Height          =   1050
      Left            =   15
      TabIndex        =   1
      Top             =   -15
      Width           =   3540
      Begin VB.TextBox txtElements 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2790
         MaxLength       =   2
         TabIndex        =   8
         Text            =   "1"
         Top             =   195
         Width           =   540
      End
      Begin VB.ComboBox comboSize 
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
         ItemData        =   "frmVars.frx":038E
         Left            =   570
         List            =   "frmVars.frx":03A1
         Style           =   2  'Dropdown List
         TabIndex        =   4
         Top             =   180
         Width           =   1185
      End
      Begin VB.ComboBox comboNumSystem 
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
         ItemData        =   "frmVars.frx":03C6
         Left            =   1980
         List            =   "frmVars.frx":03DC
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   600
         Width           =   1425
      End
      Begin VB.CommandButton cmdEdit 
         Caption         =   "edit"
         Height          =   345
         Left            =   150
         TabIndex        =   2
         Top             =   615
         Width           =   870
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "elements:"
         Height          =   195
         Left            =   1935
         TabIndex        =   7
         Top             =   255
         Width           =   675
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "show as:"
         Height          =   195
         Left            =   1215
         TabIndex        =   6
         Top             =   690
         Width           =   630
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "size:"
         Height          =   195
         Left            =   135
         TabIndex        =   5
         Top             =   240
         Width           =   315
      End
   End
End
Attribute VB_Name = "frmVars"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'



' 1.29

Option Explicit

Dim bSHOWING_VALUES As Boolean


' 1.29#404 Private Sub Form_Activate()
Public Sub DoShowMe()
On Error Resume Next '3.27xm
    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
    
    update_VAR_WINDOW
End Sub




' #400b4-mini-8#
Private Sub Form_Activate()
On Error Resume Next
    If SHOULD_DO_MINI_FIX_8 Then
        If StrComp(listVars.Font.Name, "Terminal", vbTextCompare) = 0 Then
            If listVars.Font.Size < 12 Then
                listVars.Font.Size = 12
            End If
        End If
    End If
End Sub

Private Sub Form_Load()

On Error GoTo err1

   If Load_from_Lang_File(Me) Then Exit Sub

   


    'GetWindowPos Me ' 2.05#551
    'GetWindowSize Me ' 2.05#551

    ' Me.Icon = frmMain.Icon
    
    b_frmVars_LOADED = True
    
    AddHorizontalScroll listVars
    
    bSHOWING_VALUES = False
    
'    ' v3.27p
'    Dim sT11 As String
'    sT11 = get_property("emu8086.ini", "VAR_FONT_SIZE", "default")
'    If LCase(sT11) = "default" Then
'        ' ok... keep it...
'    Else
'        listVars.FontSize = Val(sT11)
'    End If
'    sT11 = get_property("emu8086.ini", "VAR_FONT_FACE", "default")
'    If LCase(sT11) = "default" Then
'        ' ok... keep it...
'    Else
'        listVars.FontName = sT11
'    End If
    
    
    Exit Sub
err1:
    Debug.Print "frmVars.LOAD: " & LCase(Err.Description)
    
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
On Error Resume Next
    b_frmVars_LOADED = False
End Sub

Private Sub Form_Resize()
On Error GoTo err_fvr
    Frame1.Left = 0
    Frame1.Width = Me.ScaleWidth

    listVars.Left = 0
    listVars.Top = Frame1.Top + Frame1.Height + 70
    listVars.Width = Me.ScaleWidth
    listVars.Height = Me.ScaleHeight - listVars.Top
    
    Exit Sub
err_fvr:
    Debug.Print "Error on frmVars_Resize: " & LCase(Err.Description)
End Sub

Private Sub cmdEdit_Click()
On Error Resume Next
    listVars_DblClick
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
   ' SaveWindowState Me ' 2.05#551
End Sub





' #400b20-BUG#
' click "vars"  and see it won't step throught the memory list.
'
''''Private Sub listVars_Click()
''''On Error Resume Next
''''
''''  show_value_properties listVars.ListIndex
''''End Sub






Private Sub listVars_DblClick()
    On Error GoTo err_dblclk_mem

    If listVars.ListIndex = -1 Then Exit Sub
    

     Dim lADR As Long
     
     ' #400b22-masm_comp400b20.asm-b# ' lADR = frmEmulation.lPROG_LOADED_AT_ADR + vST_for_VARS_WIN(listVars.ListIndex).lOFFSET
     lADR = frmEmulation.lPROG_LOADED_AT_ADR + vST_for_VARS_WIN(listVars.ListIndex).lOFFSET + to_unsigned_long(get_var_offset(vST_for_VARS_WIN(listVars.ListIndex).sSegment)) * 16
     
    
     ' iSize may have these new values: 10 for strings, 11 for arrays.
     
     Dim ti As Integer
     Dim sValue As String
     Dim k As Integer
     
     Dim arrTK() As String
     
     bWAS_ERROR_ON_LAST_EVAL_EXPR = False
     
     ' allow editing different var types:
     Select Case vST_for_VARS_WIN(listVars.ListIndex).iSize
     Case 1
        ' get token works for arrays as well!
        frmEditVariable.setValue getNewToken(listVars.Text, 1, vbTab) 'format_to_NumSystem_byte(RAM.mREAD_BYTE(lADR), vST_for_VARS_WIN(listVars.ListIndex).sShowAs)
        frmEditVariable.Show vbModal, Me
        
        sValue = frmEditVariable.sValue
        
        sValue = replace_BIG_STRINGS_if_any(sValue, True)
        
        arrTK = Split(sValue, ",")
        
        For k = 0 To UBound(arrTK)
        
            sValue = Trim(arrTK(k))
        
            If UCase(sValue) = "NULL" Then sValue = "0"
        
            ' idiots check, in case Hex Number
            ' doesn't start with a zero and add it:
            If endsWith(sValue, "h") Then
                sValue = "0" & sValue
            End If
        
            ti = evalExpr(sValue)
        
            If bWAS_ERROR_ON_LAST_EVAL_EXPR Then
                mBox Me, cMT("cannot compute the expression!")
                GoTo stop_dblk
            End If
            
            If Not is_ib(CStr(ti)) Then
                mBox Me, cMT("the value is out of the byte range:") & " " & CStr(ti)
                GoTo stop_dblk
            End If
    
            RAM.mWRITE_BYTE lADR, to_unsigned_byte(ti)
        
            lADR = lADR + 1 ' next byte, used for arrays.
        
        Next k
        
     Case 2
        ' get token works for arrays as well!
        frmEditVariable.setValue getNewToken(listVars.Text, 1, vbTab) 'format_to_NumSystem_word(RAM.mREAD_WORD(lADR), vST_for_VARS_WIN(listVars.ListIndex).sShowAs)
        frmEditVariable.Show vbModal, Me
        
        sValue = frmEditVariable.sValue
        
        sValue = replace_BIG_STRINGS_if_any(sValue, False)
        
        arrTK = Split(sValue, ",")
        
        For k = 0 To UBound(arrTK)
        
            sValue = Trim(arrTK(k))
        
            ' check, in case Hex Number
            ' doesn't start with a zero and add it:
            If endsWith(sValue, "h") Then
                sValue = "0" & sValue
            End If
            
            If UCase(sValue) = "NULL" Then sValue = "0"
            
            ti = evalExpr(sValue)
            
            If bWAS_ERROR_ON_LAST_EVAL_EXPR Then
                mBox Me, cMT("cannot compute the expression!")
                GoTo stop_dblk
            End If
            
            RAM.mWRITE_WORD_i lADR, ti
            
            lADR = lADR + 2 ' next word, used for arrays.
            
        Next k
        
     Case Else
        Debug.Print "listVars_DblClick: cannot edit var with size: " & vST_for_VARS_WIN(listVars.ListIndex).iSize
        
     End Select
         
     ' maybe improved by updating only modified value:
     update_VAR_WINDOW
     
        
        
stop_dblk:  ' #327xp-erase#
     Erase arrTK
     
          
     
    Exit Sub
     
err_dblclk_mem:
    Debug.Print "listVars_DblClick: " & LCase(Err.Description)
     
End Sub



' #400b20-BUG#  - FIX
Private Sub listVars_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error GoTo err1

    show_value_properties listVars.ListIndex, True

err1:
End Sub

Private Sub txtElements_Change()

On Error GoTo err1

If bSHOWING_VALUES Then Exit Sub

If listVars.ListIndex < 0 Then Exit Sub

    Dim ti As Integer
    
    ti = evalExpr(txtElements.Text)
    
    If ti < 1 Then ti = 1

    vST_for_VARS_WIN(listVars.ListIndex).iElements = ti

    ' maybe improved by updating only modified value:
    update_VAR_WINDOW
    
    
    
    Exit Sub
err1:
        Debug.Print "ERR:##77177 : " & Err.Description
        Resume Next
    
End Sub


Private Sub comboNumSystem_Click()

On Error GoTo err1

If bSHOWING_VALUES Then Exit Sub

If listVars.ListIndex < 0 Then Exit Sub

    vST_for_VARS_WIN(listVars.ListIndex).iShowAs = comboNumSystem.ListIndex

    ' maybe improved by updating only modified value:
    update_VAR_WINDOW
     
     
     
    Exit Sub
err1:
        Debug.Print "ERR:##77177 : " & Err.Description
        Resume Next
        
End Sub

Private Sub comboSize_Click()

On Error GoTo err1



If bSHOWING_VALUES Then Exit Sub

If listVars.ListIndex < 0 Then Exit Sub

    Select Case comboSize.ListIndex
    Case 0
        vST_for_VARS_WIN(listVars.ListIndex).iSize = 1
        
    Case 1
        vST_for_VARS_WIN(listVars.ListIndex).iSize = 2
        
    ' #400b20-FPU-show-dd,dq,dt#
    Case 2
        vST_for_VARS_WIN(listVars.ListIndex).iSize = 4
    Case 3
        vST_for_VARS_WIN(listVars.ListIndex).iSize = 8
    Case 4
        vST_for_VARS_WIN(listVars.ListIndex).iSize = 10
        
        
    Case Else
        Debug.Print "comboSize_Click: Unknown size index"
    
    End Select

    ' maybe improved by updating only modified value:
    update_VAR_WINDOW
    
    
    
    Exit Sub
err1:
        Debug.Print "ERR:##77177 : " & Err.Description
        Resume Next

End Sub


' #400b20-BUG#
Public Sub show_value_properties(Index As Integer, bHighLightBytes_in_MemList As Boolean)
On Error GoTo err_svp

    If Index < 0 Then Exit Sub

    bSHOWING_VALUES = True
    
    
    Select Case vST_for_VARS_WIN(Index).iSize
    Case 1
        comboSize.ListIndex = 0
    Case 2
        comboSize.ListIndex = 1
    ' #400b20-FPU-show-dd,dq,dt#
    Case 4
        comboSize.ListIndex = 2
    Case 8
        comboSize.ListIndex = 3
    Case 10
        comboSize.ListIndex = 4
        
    Case Else
        Debug.Print "show_value_properties: unknown var size"
    End Select
    
    
    comboNumSystem.ListIndex = vST_for_VARS_WIN(Index).iShowAs  ' #1158
    
    txtElements.Text = vST_for_VARS_WIN(Index).iElements
    
    
    
    ' #400b20-BUG#
    If bHighLightBytes_in_MemList Then
            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            ' select memory position in memory list
            '   (starting address in case of array)
            Dim lT As Long
            
            
            ' #400b22-masm_comp400b20.asm-b# ' lT = frmEmulation.lPROG_LOADED_AT_ADR + vST_for_VARS_WIN(Index).lOFFSET
            lT = frmEmulation.lPROG_LOADED_AT_ADR + vST_for_VARS_WIN(Index).lOFFSET + to_unsigned_long(get_var_offset(vST_for_VARS_WIN(listVars.ListIndex).sSegment)) * 16
                     
        
            ' #400b16-SYMBOL-BUG-FOUND# ' selectMemoryLine_YELLOW lT,  lT + Abs(vST_for_VARS_WIN(Index).iSize), True
            selectMemoryLine_YELLOW lT, lT + Abs(vST_for_VARS_WIN(Index).iSize) - 1, True  ' #400b16-SYMBOL-BUG-FOUND#
            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    End If
    
    
    bSHOWING_VALUES = False
    
    Exit Sub
err_svp:
    Debug.Print "show_value_properties: " & Index & " : " & LCase(Err.Description)
    bSHOWING_VALUES = False
End Sub


Private Sub txtElements_GotFocus()
On Error Resume Next
    With txtElements
        .SelStart = 0
        DoEvents    ' #306
        .SelLength = Len(.Text)
    End With
End Sub


' 1.30
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next
    frmEmulation.process_HotKey KeyCode, Shift
End Sub



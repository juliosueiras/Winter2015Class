VERSION 5.00
Begin VB.Form frmStopOnCondition 
   Caption         =   "stop on condition"
   ClientHeight    =   1245
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6300
   BeginProperty Font 
      Name            =   "Fixedsys"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmStopOnCondition.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   1245
   ScaleWidth      =   6300
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtMemoryAddr 
      Alignment       =   2  'Center
      Height          =   330
      Left            =   255
      TabIndex        =   7
      Text            =   "0000:0000"
      Top             =   840
      Width           =   1620
   End
   Begin VB.Timer timerRemoveRed 
      Enabled         =   0   'False
      Interval        =   1500
      Left            =   2085
      Top             =   780
   End
   Begin VB.ComboBox comboCondition 
      Height          =   345
      ItemData        =   "frmStopOnCondition.frx":0D4A
      Left            =   2145
      List            =   "frmStopOnCondition.frx":0D60
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   345
      Width           =   1860
   End
   Begin VB.ComboBox comboRegisterName 
      Height          =   345
      ItemData        =   "frmStopOnCondition.frx":0D97
      Left            =   165
      List            =   "frmStopOnCondition.frx":0DE0
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   345
      Width           =   1860
   End
   Begin VB.TextBox txtExpression 
      Height          =   345
      Left            =   4275
      TabIndex        =   2
      Top             =   345
      Width           =   1860
   End
   Begin VB.Label lblNote 
      AutoSize        =   -1  'True
      Caption         =   "hex values must start with 0 and have h suffix."
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   165
      Left            =   2220
      TabIndex        =   8
      Top             =   705
      Width           =   2760
   End
   Begin VB.Label lblConditionIsTrue 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      Caption         =   " the condition is true "
      ForeColor       =   &H00000000&
      Height          =   225
      Left            =   2835
      TabIndex        =   6
      Top             =   870
      Visible         =   0   'False
      Width           =   2760
   End
   Begin VB.Label lblOperand 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "operand"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   690
      TabIndex        =   5
      Top             =   30
      Width           =   795
   End
   Begin VB.Label lblCondition 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "condition"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   2685
      TabIndex        =   4
      Top             =   30
      Width           =   855
   End
   Begin VB.Label lblValue 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "expression"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   4710
      TabIndex        =   3
      Top             =   45
      Width           =   1035
   End
End
Attribute VB_Name = "frmStopOnCondition"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' 3.27xk
' #327xk-stop-on-condition#

' hm... now I think it would be nice if it would be possible to stop when cx or any other register reaches
'   some value... this is good for the loops....

' note: stop on condition works only when this window is open.

Option Explicit


Dim lOriginalColor As Long





'Private Sub cmdHelp_Click()
'On Error GoTo err1
'    open_HTML_FILE Me, "stop_on_condition.html"
'    Exit Sub
'err1:
'    Debug.Print "cmdHelp_Click"
'End Sub

Private Sub comboRegisterName_Click()

On Error Resume Next ' 4.00-Beta-3

    Select Case comboRegisterName.ListIndex
    Case 13, 14
        txtMemoryAddr.Visible = True
    Case Else
        txtMemoryAddr.Visible = False
    End Select
    
    set_CONDITION_FALSE
    
End Sub

Private Sub Form_Load()
    If Load_from_Lang_File(Me) Then Exit Sub
    
On Error GoTo err1

    lOriginalColor = Me.BackColor


    GetWindowPos Me
    ' GetWindowSize Me
    

    comboCondition.ListIndex = 0
    comboRegisterName.ListIndex = 0
    
    txtExpression.Height = comboCondition.Height
        
    
    ''''''''''''''''
    txtMemoryAddr.Text = frmEmulation.txtIntegratedMemoryAddr.Text
    '''''''''''''''
    
        
    b_LOADED_frmStopOnCondition = True
    
Exit Sub
err1:
    Debug.Print "frmStopOnCondition_LOAD: " & Err.Description
End Sub


Public Sub DoShowMe()
On Error GoTo err1
    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
    
    Exit Sub
err1:
    Debug.Print "frmStopOnCondition.DoShowMe: " & Err.Description
End Sub



Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
On Error Resume Next ' 4.00-Beta-3
    SaveWindowState Me
    b_LOADED_frmStopOnCondition = False
End Sub


Public Sub checkCondition()
On Error GoTo err1
    
    ' DOES NOT CHECKING IF TEXT BOX IS EMPTY!
    txtExpression.Text = Trim(txtExpression.Text)
    If txtExpression.Text = "" Then Exit Sub
    
    Dim lPAdd As Long
    
    Dim iExpr As Integer
    iExpr = evalExpr(txtExpression.Text)
    
    Select Case comboRegisterName.ListIndex
        
        '    AX
        Case 0
           If compare_to_condition(frmEmulation.get_AX, iExpr) Then set_CONDITION_TRUE
            
        '    BX
        Case 1
            If compare_to_condition(frmEmulation.get_BX, iExpr) Then set_CONDITION_TRUE
            
        '    CX
        Case 2
            If compare_to_condition(frmEmulation.get_CX, iExpr) Then set_CONDITION_TRUE
            
        '    DX
        Case 3
            If compare_to_condition(frmEmulation.get_DX, iExpr) Then set_CONDITION_TRUE
        
        '    CS
        Case 4
            If compare_to_condition(frmEmulation.get_CS, iExpr) Then set_CONDITION_TRUE
        
        '    IP
        Case 5
            If compare_to_condition(frmEmulation.get_IP, iExpr) Then set_CONDITION_TRUE
        
        '    SS
        Case 6
            If compare_to_condition(frmEmulation.get_SS, iExpr) Then set_CONDITION_TRUE
        
        '    SP
        Case 7
            If compare_to_condition(frmEmulation.get_SP, iExpr) Then set_CONDITION_TRUE
        
        '    BP
        Case 8
            If compare_to_condition(frmEmulation.get_BP, iExpr) Then set_CONDITION_TRUE
        
        '    SI
        Case 9
            If compare_to_condition(frmEmulation.get_SI, iExpr) Then set_CONDITION_TRUE
        
        '    DI
        Case 10
            If compare_to_condition(frmEmulation.get_DI, iExpr) Then set_CONDITION_TRUE
        
        '    DS
        Case 11
            If compare_to_condition(frmEmulation.get_DS, iExpr) Then set_CONDITION_TRUE
        
        '    ES
        Case 12
            If compare_to_condition(frmEmulation.get_ES, iExpr) Then set_CONDITION_TRUE
        
        '    byte at:
        Case 13
            '#400b9-better-stop#  lPAdd = get_PHYSICAL_ADDR(Val("&H" & Trim(txtMemSegment.Text)), Val("&H" & Trim(txtMemOffset.Text)))
            
            ' #400b9-better-stop#
            ' copied from: ' #400B5-NEW-INPUT#
            ' MAKE IT THINK ABOUT PHYSICAL ADDRESS WHEN 5 DIGITS WITHOUT DOT ARE ENTERED.
            txtMemoryAddr.Text = Trim(txtMemoryAddr.Text)
            If Len(txtMemoryAddr.Text) >= 5 And InStr(1, txtMemoryAddr.Text, " ") <= 0 Then
                If only_hex_digits(txtMemoryAddr.Text) Then
                    lPAdd = Val("&H" & txtMemoryAddr.Text)
                    GoTo got_it
                End If
            End If
            lPAdd = get_physical_address_from_hex_ea(txtMemoryAddr.Text)
got_it:
            
            Dim byteT As Byte
            byteT = RAM.mREAD_BYTE(lPAdd)
            ' #400b9-stop-on-byte-change# ' Dim signedByte As Integer
            ' #400b9-stop-on-byte-change# ' signedByte = to_signed_byte(byteT)
            Dim integerByte As Integer ' #400b9-stop-on-byte-change#
            integerByte = byteT        ' #400b9-stop-on-byte-change#
            Dim iByteExpr As Integer   ' #400b9-stop-on-byte-change# '
            iByteExpr = to_unsigned_byte(iExpr)  ' #400b9-stop-on-byte-change# '
             ' #400b9-stop-on-byte-change# ' If compare_to_condition(signedByte, iExpr) Then
            If compare_to_condition(integerByte, iByteExpr) Then
                set_CONDITION_TRUE
            End If
            
        '    word at:
        Case 14
            ' #400b9-better-stop# ' lPAdd = get_PHYSICAL_ADDR(Val("&H" & Trim(txtMemSegment.Text)), Val("&H" & Trim(txtMemOffset.Text)))
            
            ' #400b9-better-stop#
            ' copied from: ' #400B5-NEW-INPUT#
            ' MAKE IT THINK ABOUT PHYSICAL ADDRESS WHEN 5 DIGITS WITHOUT DOT ARE ENTERED.
            txtMemoryAddr.Text = Trim(txtMemoryAddr.Text)
            If Len(txtMemoryAddr.Text) >= 5 And InStr(1, txtMemoryAddr.Text, " ") <= 0 Then
                If only_hex_digits(txtMemoryAddr.Text) Then
                    lPAdd = Val("&H" & txtMemoryAddr.Text)
                    GoTo got_it_w
                End If
            End If
            lPAdd = get_physical_address_from_hex_ea(txtMemoryAddr.Text)
got_it_w:
            
            
            Dim wordT As Integer
            wordT = RAM.mREAD_WORD(lPAdd)
            If compare_to_condition(wordT, iExpr) Then
                set_CONDITION_TRUE
            End If
            
        
        ' #400b6-stop-on-flag-change#
        '    Carry Flag (CF)
        Case 15
            If compare_to_condition(frmFLAGS.cbCF.ListIndex, iExpr) Then set_CONDITION_TRUE
            
        '    Zero flag
        Case 16
            If compare_to_condition(frmFLAGS.cbZF.ListIndex, iExpr) Then set_CONDITION_TRUE
            
        '    Sign flag
        Case 17
            If compare_to_condition(frmFLAGS.cbSF.ListIndex, iExpr) Then set_CONDITION_TRUE
        
        '    Overflow
        Case 18
            If compare_to_condition(frmFLAGS.cbOF.ListIndex, iExpr) Then set_CONDITION_TRUE

        '    Parity
        Case 19
            If compare_to_condition(frmFLAGS.cbPF.ListIndex, iExpr) Then set_CONDITION_TRUE
        
        '    Auxiliary
        Case 20
            If compare_to_condition(frmFLAGS.cbAF.ListIndex, iExpr) Then set_CONDITION_TRUE
        
        '    Interrupt
        Case 21
            If compare_to_condition(frmFLAGS.cbIF.ListIndex, iExpr) Then set_CONDITION_TRUE
        
        '    Direction
        Case 22
            If compare_to_condition(frmFLAGS.cbDF.ListIndex, iExpr) Then set_CONDITION_TRUE
        
        
        
        Case Else
            Debug.Print "checkCondition: brrrr: wrong selection?"
    End Select



    Exit Sub
err1:
    Debug.Print "checkCondition: " & Err.Description
End Sub




Private Function compare_to_condition(iVal1 As Integer, iVal2 As Integer) As Boolean
On Error GoTo err1
    
    Select Case comboCondition.ListIndex
 
        '     =
        Case 0
            If iVal1 = iVal2 Then compare_to_condition = True
            
        '     <
        Case 1
            If iVal1 < iVal2 Then compare_to_condition = True
            
        '     <=
        Case 2
            If iVal1 <= iVal2 Then compare_to_condition = True
            
        '     >
        Case 3
            If iVal1 > iVal2 Then compare_to_condition = True
            
        '     >=
        Case 4
            If iVal1 >= iVal2 Then compare_to_condition = True
            
        '     <>
        Case 5
            If iVal1 <> iVal2 Then compare_to_condition = True
                       
                       
        Case Else
           compare_to_condition = False
           
    End Select
    
    Exit Function
err1:
    Debug.Print "error on compare_to_condition: " & Err.Description
End Function




Private Sub comboCondition_Click()
On Error Resume Next ' 4.00-Beta-3
    set_CONDITION_FALSE
End Sub



Private Sub txtExpression_Change()
On Error Resume Next ' 4.00-Beta-3
    set_CONDITION_FALSE
End Sub

Private Sub txtExpression_GotFocus()
On Error Resume Next ' 4.00-Beta-3
    With txtExpression
        .SelStart = 0
        DoEvents
        .SelLength = Len(.Text)
    End With
End Sub



Private Sub set_CONDITION_FALSE()
On Error Resume Next ' 4.00-Beta-3
    lblConditionIsTrue.Visible = False
    lblNote.Visible = Not lblConditionIsTrue.Visible
End Sub

Private Sub set_CONDITION_TRUE()
On Error Resume Next ' 4.00-Beta-3
    lblConditionIsTrue.Visible = True
    lblNote.Visible = Not lblConditionIsTrue.Visible
    DoShowMe
    frmEmulation.stopAutoStep
    
    txtExpression.SelStart = 0
    txtExpression.SelLength = Len(txtExpression.Text)
    
   
    Me.BackColor = vbRed
    timerRemoveRed.Enabled = True
    
    ' #flags_temp_fix#
    temp_fix_4_flags
    
    
    Exit Sub
err1:
    Debug.Print "set_CONDITION_TRUE: " & Err.Description
End Sub

' #flags_temp_fix#
Sub temp_fix_4_flags()
On Error Resume Next
    
    Select Case comboRegisterName.ListIndex
        '    Carry Flag (CF)
        Case 15
            frmFLAGS.cbCF.ListIndex = Val(txtExpression.Text)
            
        '    Zero flag
        Case 16
             frmFLAGS.cbZF.ListIndex = Val(txtExpression.Text)
            
        '    Sign flag
        Case 17
             frmFLAGS.cbSF.ListIndex = Val(txtExpression.Text)
        
        '    Overflow
        Case 18
             frmFLAGS.cbOF.ListIndex = Val(txtExpression.Text)

        '    Parity
        Case 19
             frmFLAGS.cbPF.ListIndex = Val(txtExpression.Text)
        
        '    Auxiliary
        Case 20
             frmFLAGS.cbAF.ListIndex = Val(txtExpression.Text)
        
        '    Interrupt
        Case 21
             frmFLAGS.cbIF.ListIndex = Val(txtExpression.Text)
        
        '    Direction
        Case 22
             frmFLAGS.cbDF.ListIndex = Val(txtExpression.Text)
    End Select
    
End Sub

Private Sub timerRemoveRed_Timer()
On Error Resume Next
    timerRemoveRed.Enabled = False
    lblConditionIsTrue.Visible = False ' 3.27xq
    lblNote.Visible = Not lblConditionIsTrue.Visible
    Me.BackColor = lOriginalColor
End Sub


Private Sub txtMemOffset_Change()
On Error Resume Next ' 4.00-Beta-3
    set_CONDITION_FALSE
End Sub



Private Sub txtMemSegment_Change()
On Error Resume Next ' 4.00-Beta-3
    set_CONDITION_FALSE
End Sub




Private Sub txtMemoryAddr_GotFocus()
On Error Resume Next

    ' copied!
    

    With txtMemoryAddr
        
        Dim L As Long
        L = InStr(1, .Text, ":")
        
        If L > 0 Then
            If .SelStart > L Then
                .SelStart = L
                .SelLength = Len(.Text) - L
            Else
                .SelStart = 0
                .SelLength = L - 1
            End If
        Else
            .SelStart = 0
            DoEvents
            .SelLength = Len(.Text)
        End If
        
    End With
End Sub

Private Sub txtMemoryAddr_KeyPress(KeyAscii As Integer)
On Error Resume Next
    If KeyAscii = 13 Then
        KeyAscii = 0
    End If
End Sub

VERSION 5.00
Begin VB.Form frmEvaluator 
   Caption         =   "calculator - expression evaluator"
   ClientHeight    =   3120
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4545
   Icon            =   "frmEvaluator.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   3120
   ScaleWidth      =   4545
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdHelp 
      Caption         =   "help"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   3465
      TabIndex        =   11
      Top             =   1095
      Width           =   1035
   End
   Begin VB.Frame frameSignType 
      Caption         =   "treat hex,oct,bin as: "
      Height          =   555
      Left            =   0
      TabIndex        =   7
      Top             =   795
      Width           =   3405
      Begin VB.CheckBox checkSigned 
         Caption         =   "signed"
         Height          =   195
         Left            =   135
         TabIndex        =   10
         ToolTipText     =   "When checked values with most significant bit=1 are treated as negative"
         Top             =   240
         Width           =   1245
      End
      Begin VB.OptionButton optByte 
         Caption         =   "byte"
         Enabled         =   0   'False
         Height          =   255
         Left            =   2505
         TabIndex        =   9
         ToolTipText     =   "8 bits"
         Top             =   210
         Width           =   735
      End
      Begin VB.OptionButton optWord 
         Caption         =   "word"
         Enabled         =   0   'False
         Height          =   255
         Left            =   1605
         TabIndex        =   8
         ToolTipText     =   "16 bits"
         Top             =   210
         Value           =   -1  'True
         Width           =   735
      End
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "clear"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   3465
      TabIndex        =   6
      ToolTipText     =   "Clear the evaluation text box"
      Top             =   810
      Width           =   1035
   End
   Begin VB.Frame frameResultType 
      Caption         =   " show result as "
      Height          =   690
      Left            =   0
      TabIndex        =   1
      Top             =   45
      Width           =   4410
      Begin VB.OptionButton optOct 
         Caption         =   "oct"
         Height          =   255
         Left            =   2310
         TabIndex        =   5
         ToolTipText     =   "Octal (base 8)"
         Top             =   285
         Width           =   645
      End
      Begin VB.OptionButton optBin 
         Caption         =   "bin"
         Height          =   255
         Left            =   3255
         TabIndex        =   4
         ToolTipText     =   "Binary (base 2)"
         Top             =   285
         Width           =   630
      End
      Begin VB.OptionButton optHex 
         Caption         =   "hex"
         Height          =   255
         Left            =   1380
         TabIndex        =   3
         ToolTipText     =   "Hexadecimal (base 16)"
         Top             =   285
         Value           =   -1  'True
         Width           =   780
      End
      Begin VB.OptionButton optDecimal 
         Caption         =   "decimal"
         Height          =   255
         Left            =   195
         TabIndex        =   2
         ToolTipText     =   "Decimal (regular base 10)"
         Top             =   285
         Width           =   960
      End
   End
   Begin VB.Timer timerEvaluator 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   3345
      Top             =   1290
   End
   Begin VB.TextBox txtEvaluator 
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1635
      Left            =   -15
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   1425
      Width           =   3285
   End
End
Attribute VB_Name = "frmEvaluator"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'




Option Explicit

Dim sLAST_EXPRESSION As String

Dim lEndOfInput As Long

Private Sub checkSigned_Click()
On Error Resume Next ' 4.00-Beta-3
    If checkSigned.Value = vbChecked Then
        optWord.Enabled = True
        optByte.Enabled = True
    Else
        optWord.Enabled = False
        optByte.Enabled = False
    End If
End Sub

Private Sub cmdClear_Click()

On Error Resume Next ' protect from errors on set focus.

    txtEvaluator.Text = ""
    ' just in case:
    sLAST_EXPRESSION = ""
    timerEvaluator.Enabled = False
    
    txtEvaluator.SetFocus
    
End Sub

' 1.29#404 Private Sub Form_Activate()
Public Sub DoShowMe()
On Error Resume Next ' #327xl
    Me.Show

        
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
End Sub



Private Sub Form_Load()

On Error GoTo err1

    If Load_from_Lang_File(Me) Then Exit Sub
    
    GetWindowPos Me ' 2.05#551
    GetWindowSize Me ' 2.05#551
    
    
    
' #400b10-remember-eval-state#

'    optDecimal.Value = GetSetting("emu8086", "calculator", "decimal", optDecimal.Value)
'    optHex.Value = GetSetting("emu8086", "calculator", "hex", optHex.Value)
'    optOct.Value = GetSetting("emu8086", "calculator", "oct", optOct.Value)
'    optBin.Value = GetSetting("emu8086", "calculator", "bin", optBin.Value)
'
'    checkSigned.Value = GetSetting("emu8086", "calculator", "checkSigned", checkSigned.Value)
'    optWord.Value = GetSetting("emu8086", "calculator", "optWord", optWord.Value)
'    optByte.Value = GetSetting("emu8086", "calculator", "optByte", optByte.Value)
'
    
    Exit Sub
err1:
    Debug.Print "calculator: " & Err.Description
    Resume Next
End Sub


' #400b10-remember-eval-state#
'Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
'On Error GoTo err1
'
'    SaveSetting "emu8086", "calculator", "decimal", optDecimal.Value
'    SaveSetting "emu8086", "calculator", "hex", optHex.Value
'    SaveSetting "emu8086", "calculator", "oct", optOct.Value
'    SaveSetting "emu8086", "calculator", "bin", optBin.Value
'
'    SaveSetting "emu8086", "calculator", "checkSigned", checkSigned.Value
'    SaveSetting "emu8086", "calculator", "optWord", optWord.Value
'    SaveSetting "emu8086", "calculator", "optByte", optByte.Value
'
'Exit Sub
'err1:
'
'Debug.Print "frmEvaluator.Form_QueryUnload: " & Err.Description
'
'
'End Sub

Private Sub Form_Resize()
On Error GoTo err_resize
    
    txtEvaluator.Width = Me.ScaleWidth
    txtEvaluator.Height = Me.ScaleHeight - txtEvaluator.Top
    
    'frameResultType.Width = Me.ScaleWidth
    
    'frameSignType.Width = Me.ScaleWidth
    
    Exit Sub
    
err_resize:
    Debug.Print "Error on frmEvaluator_Resize(): " & LCase(Err.Description)
End Sub

Private Sub Form_Unload(Cancel As Integer)

On Error Resume Next ' 4.00-Beta-3

    SaveWindowState Me ' 2.05#551
    
    ' v3.27p
    If frmEvaluatorHelper.Visible Then
        frmEvaluatorHelper.Hide
    End If
    
End Sub

Private Sub txtEvaluator_KeyPress(KeyAscii As Integer)

On Error Resume Next ' 4.00-Beta-3

    If KeyAscii = vbKeyReturn Then
        
        KeyAscii = 0
        
        ' debug! txtEvaluator.Text = txtEvaluator.Text & "+"
        
        lEndOfInput = txtEvaluator.SelStart
        
        sLAST_EXPRESSION = getLastLine(txtEvaluator.Text, lEndOfInput)
        
        timerEvaluator.Enabled = True
    End If
End Sub

' timer is used in order not to mess the
Private Sub timerEvaluator_Timer()
On Error GoTo err_eval

    Dim lResult As Long
    Dim sResult As String
    Dim sT1 As String
    
    txtEvaluator.SelStart = lEndOfInput
    txtEvaluator.SelLength = 0
    
    If sLAST_EXPRESSION <> "" Then
        
'''        ' instead of using return value (Integer),
'''        ' we are using the global varialbe (Long),
'''        ' it is set by evalExpr():
'''        evalExpr (sLAST_EXPRESSION)
'''        lResult = lLAST_LONG_RESULT_OF_evalExpr
        
        sT1 = make_all_decimal(sLAST_EXPRESSION)
        
        ' Debug.Print "st1: " & st1
        
        lResult = analysis(sT1)
        
        If optDecimal.Value Then
            sResult = CStr(lResult)
            
        ElseIf optHex.Value Then
            
            
            ' #327xq-calc-bug#
            If checkSigned.Value = vbChecked Then
                ' cloned from toHexForm(lResult)
                sResult = Hex(lResult)
                sResult = make_min_len(sResult, 8, "0") ' FFFFFFFF
                If optWord.Value = True Then
                    sResult = Mid(sResult, 5) ' 4 low digits
                Else
                    sResult = Mid(sResult, 7) ' 2 low digits
                End If
                If sResult Like "#*" Then ' starts with a number?
                    sResult = sResult & "h"
                Else
                    sResult = "0" & sResult & "h"
                End If
            Else
                sResult = toHexForm(lResult)
            End If
            
            
        ElseIf optOct.Value Then
        
            sResult = Oct(lResult)
        
'''            ' #327xq-calc-bug#
'''            If checkSigned.Value = vbChecked Then
'''                sResult = make_min_len(sResult, 11, "0") ' 37777777777
'''                If optWord.Value = True Then
'''                    sResult = Mid(sResult, 5)  ' 6 low digits
'''                Else
'''                    sResult = Mid(sResult, 9) ' 3 low digits
'''                End If
'''            End If
        
           sResult = sResult & "o"
            
            
        ElseIf optBin.Value Then
            If (lResult <= 255) And (lResult >= -128) Then
                sResult = toBIN_BYTE(to_unsigned_byte(to_signed_int(lResult))) & "b"
            ElseIf (lResult <= 65535) And (lResult >= -32768) Then
                sResult = toBIN_WORD(to_signed_int(lResult)) & "b"
            Else
                sResult = toBIN_DOUBLEWORD(lResult) & "b"
            End If
        End If
        
        txtEvaluator.SelText = vbNewLine & sResult & vbNewLine
    
    End If
    
    timerEvaluator.Enabled = False
    
    Exit Sub
err_eval:
    mBox Me, "Error: " & LCase(Err.Description)
    timerEvaluator.Enabled = False
End Sub

'returns the last line in a text box after enter
'is pressed:
'------------
'hello world <- cursor is still here!
'
'-----------
' should return "hello world"
Private Function getLastLine(sInput As String, lEndPosition As Long) As String

On Error Resume Next ' 4.00-Beta-3

    Dim L As Long
    Dim s As String
    Dim c As Byte
    Dim sResult As String
    
    sResult = ""
    
    For L = lEndPosition To 1 Step -1
    
        s = Mid(sInput, L, 1)
        c = myAsc(s)
        
        If (c = 13) Or (c = 10) Then
            ' never gets here when
            ' it's the first line!
            Exit For
        Else
            sResult = sResult & s
        End If
        
    Next L

    ' StrReverse() seems to be a new function
    ' cannot find it in VB 5.0 help file!
    
    getLastLine = StrReverse(sResult)

End Function

Public Function make_all_decimal(ByRef sInput) As String

On Error Resume Next ' 4.00-Beta-3

Dim lSize As Long
Dim L As Long
Dim s As String

Dim sNum As String
Dim sResult As String


lSize = Len(sInput)

sNum = ""
sResult = ""

For L = 1 To lSize

    s = Mid(sInput, L, 1)
    
    Select Case s
        
    Case "0" To "9", "A" To "F", "a" To "f"
        sNum = sNum & s
        
    Case "h", "H", "o", "O", "b", "B"
        sNum = sNum & s
    
    Case "+", "-", "*", "/", "(", ")", "^", " ", "~", "<", ">", "&", "|", "%"
        If sNum <> "" Then
            sResult = sResult & toDecimal(sNum) & s
        Else
            sResult = sResult & s
        End If
        sNum = ""
    End Select

Next L
        ' last num is added here:
        If sNum <> "" Then
            sResult = sResult & toDecimal(sNum)
        End If

    make_all_decimal = sResult
End Function

'''
'''Private Function toDecimal(ByRef sInput As String) As Long
'''
'''    Dim lResult As Long
'''
'''    If endsWith(sInput, "h") Then
'''        lResult = Val("&H" & sInput)
'''    ElseIf endsWith(sInput, "o") Then
'''        lResult = Val("&O" & sInput)
'''    ElseIf endsWith(sInput, "b") Then
'''        lResult = bin_to_long(sInput)
'''    Else
'''        lResult = Val(sInput)
'''    End If
'''
'''    toDecimal = lResult
'''
'''End Function


Private Function toDecimal(ByRef sInput As String) As Long

On Error Resume Next ' 4.00-Beta-3

    Dim lResult As Long

    If endsWith(sInput, "h") Then
        lResult = getDecimal_from_hex(sInput)
    ElseIf endsWith(sInput, "o") Then
        lResult = getDecimal_from_oct(sInput)
    ElseIf endsWith(sInput, "b") Then
        lResult = getDecimal_from_bin(sInput)
    Else
        lResult = Val(sInput)
    End If

    toDecimal = lResult
End Function

Private Function getDecimal_from_hex(sInput As String) As Long

On Error Resume Next ' 4.00-Beta-3

    Dim lResult As Long
    Dim s As String

    s = HEX_to_BIN(sInput) & "b"

    lResult = bin_to_long(s)

    lResult = make_negative_if_required(lResult)

    getDecimal_from_hex = lResult
End Function

Private Function getDecimal_from_oct(sInput As String) As Long

On Error Resume Next ' 4.00-Beta-3

    Dim lResult As Long
    Dim s As String

    s = OCT_to_BIN(sInput) & "b"

    lResult = bin_to_long(s)

    lResult = make_negative_if_required(lResult)

    getDecimal_from_oct = lResult
End Function

Private Function getDecimal_from_bin(sInput As String) As Long

On Error Resume Next ' 4.00-Beta-3

    Dim lResult As Long

    lResult = bin_to_long(sInput)

    lResult = make_negative_if_required(lResult)

    getDecimal_from_bin = lResult
End Function

Private Function make_negative_if_required(lInput As Long) As Long

On Error Resume Next ' 4.00-Beta-3

    Dim lResult As Long

    ' in case sign is checked need to convert to sign
    ' value:
    If checkSigned.Value = vbChecked Then
        If optWord.Value Then
            lResult = eeMakeSinged_WORD(lInput)
        Else
            lResult = eeMakeSinged_BYTE(lInput)
        End If
    Else
        lResult = lInput
    End If

    make_negative_if_required = lResult
End Function

Private Function eeMakeSinged_WORD(lInput As Long) As Long

On Error Resume Next ' 4.00-Beta-3

    If lInput > 32767 Then
        If lInput < 65536 Then
            eeMakeSinged_WORD = -(65536 - lInput)
        Else
            eeMakeSinged_WORD = lInput
        End If
    Else
        eeMakeSinged_WORD = lInput
    End If
End Function

Private Function eeMakeSinged_BYTE(lInput As Long) As Long
On Error Resume Next ' 4.00-Beta-3
    If lInput > 127 Then
        If lInput < 256 Then
            eeMakeSinged_BYTE = -(256 - lInput)
        Else
            eeMakeSinged_BYTE = lInput
        End If
    Else
        eeMakeSinged_BYTE = lInput
    End If
End Function


' 1.25#290
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next ' 4.00-Beta-3
    frmEmulation.process_HotKey KeyCode, Shift
End Sub

Private Sub cmdHelp_Click()
On Error GoTo err1 ' jic
    frmEvaluatorHelper.Show
err1:
End Sub



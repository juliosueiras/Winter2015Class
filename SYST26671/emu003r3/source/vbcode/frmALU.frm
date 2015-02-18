VERSION 5.00
Begin VB.Form ALU 
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ALU - arithmetic & logic unit"
   ClientHeight    =   1545
   ClientLeft      =   210
   ClientTop       =   495
   ClientWidth     =   6435
   BeginProperty Font 
      Name            =   "Fixedsys"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Icon            =   "frmALU.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   1545
   ScaleWidth      =   6435
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "ALU"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'




Option Explicit

' 1.20

Dim cbA(0 To 15) As Integer
Dim cbB(0 To 15) As Integer
Dim cbC(0 To 15) As Integer



Public bSET_FLAGS As Boolean

' this function returns UNSIGNED INT (LONG is used to remove the sign)
' this function is used internally to calculate EA
Public Function fAdd_WORDS(ByVal i1 As Integer, ByVal i2 As Integer, ByRef bALLOW_FLAGS As Boolean) As Long
On Error Resume Next

    
    bSET_FLAGS = bALLOW_FLAGS
    
    ' this function is used internally, so
    ' no need to show:
    ' Me.Show
    
    LOAD_A i1
    LOAD_B i2
        
    MAKE_add_WORDS
    
    fAdd_WORDS = GET_C()
    
End Function

' the result of ADD is stored in C
Public Sub add_WORDS(ByVal i1 As Integer, ByVal i2 As Integer, ByRef bALLOW_FLAGS As Boolean)

On Error Resume Next

    bSET_FLAGS = bALLOW_FLAGS

    'r1 Me.Show

    LOAD_A i1
    LOAD_B i2

    MAKE_add_WORDS

End Sub

' the result of OR is stored in C
Public Sub or_WORDS(ByVal i1 As Integer, ByVal i2 As Integer, ByRef bALLOW_FLAGS As Boolean)

On Error Resume Next

    bSET_FLAGS = bALLOW_FLAGS

    'r1 Me.Show

    LOAD_A i1
    LOAD_B i2

    MAKE_or_WORDS

End Sub

' the result of AND is stored in C
Public Sub and_WORDS(ByVal i1 As Integer, ByVal i2 As Integer, ByRef bALLOW_FLAGS As Boolean)

On Error Resume Next

    bSET_FLAGS = bALLOW_FLAGS

    'r1 Me.Show

    LOAD_A i1
    LOAD_B i2

    MAKE_and_WORDS

End Sub

' the result of ADD is stored in C_lb
Public Sub add_BYTES(ByVal b1 As Byte, ByVal b2 As Byte)

On Error Resume Next

    bSET_FLAGS = True

    'r1 Me.Show

    LOAD_A_lb b1
    LOAD_B_lb b2

    MAKE_add_BYTES

End Sub

' the result of XOR is stored in C_lb
Public Sub xor_BYTES(ByVal b1 As Byte, ByVal b2 As Byte)

On Error Resume Next

    bSET_FLAGS = True

    'r1 Me.Show

    LOAD_A_lb b1
    LOAD_B_lb b2

    MAKE_xor_BYTES

End Sub

' the result of OR is stored in C_lb
Public Sub or_BYTES(ByVal b1 As Byte, ByVal b2 As Byte)

On Error Resume Next

    bSET_FLAGS = True

    'r1 Me.Show

    LOAD_A_lb b1
    LOAD_B_lb b2

    MAKE_or_BYTES

End Sub

' the result of AND is stored in C_lb
Public Sub and_BYTES(ByVal b1 As Byte, ByVal b2 As Byte)

On Error Resume Next

    bSET_FLAGS = True

    'r1 Me.Show

    LOAD_A_lb b1
    LOAD_B_lb b2

    MAKE_and_BYTES

End Sub

' the result of SUB is stored in C
Public Sub sub_WORDS(ByVal i1 As Integer, ByVal i2 As Integer, ByRef bALLOW_FLAGS As Boolean)

On Error Resume Next

    bSET_FLAGS = bALLOW_FLAGS

    'r1 Me.Show

    LOAD_A i1
    LOAD_B i2

    MAKE_sub_WORDS

End Sub

' the result of XOR is stored in C
Public Sub xor_WORDS(ByVal i1 As Integer, ByVal i2 As Integer, ByRef bALLOW_FLAGS As Boolean)

On Error Resume Next

    bSET_FLAGS = bALLOW_FLAGS

    'r1 Me.Show

    LOAD_A i1
    LOAD_B i2

    MAKE_xor_WORDS

End Sub

' the result of SUB is stored in C
Public Sub sub_BYTES(ByVal b1 As Byte, ByVal b2 As Byte)

On Error Resume Next

    bSET_FLAGS = True

    'r1 Me.Show

    LOAD_A_lb b1
    LOAD_B_lb b2

    MAKE_sub_BYTES

End Sub

' the result of INC is stored in C
Public Sub inc_WORD(ByVal iWRD As Integer, ByRef bALLOW_FLAGS As Boolean)
    
On Error Resume Next
    
    Dim ST_CF As Integer
    
    bSET_FLAGS = bALLOW_FLAGS
    
    'r1 Me.Show
    
    LOAD_A iWRD
    LOAD_B 1
        
    ' store carry flag!
    ' INC does not effect the CF!
    ST_CF = frmFLAGS.cbCF.ListIndex
        
    MAKE_add_WORDS
    
    ' re-store carry flag!
    frmFLAGS.cbCF.ListIndex = ST_CF
    
End Sub


' the result of INC is stored in C
Public Sub inc_BYTE(ByVal iB As Byte, ByRef bALLOW_FLAGS As Boolean)
    
On Error Resume Next
    
    Dim ST_CF As Integer
    
    bSET_FLAGS = bALLOW_FLAGS
    
    'r1 Me.Show
    
    LOAD_A_lb iB
    LOAD_B_lb 1
        
    ' store carry flag!
    ' INC does not effect the CF!
    ST_CF = frmFLAGS.cbCF.ListIndex
        
    MAKE_add_BYTES
    
    ' re-store carry flag!
    frmFLAGS.cbCF.ListIndex = ST_CF
    
End Sub


' the result of DEC is stored in C
Public Sub dec_WORD(ByVal iWRD As Integer, ByRef bALLOW_FLAGS As Boolean)
    
On Error Resume Next
    
    Dim ST_CF As Integer
    
    bSET_FLAGS = bALLOW_FLAGS
    
    'r1 Me.Show
    
    LOAD_A iWRD
    LOAD_B 1
        
    ' store carry flag!
    ' DEC does not effect the CF!
    ST_CF = frmFLAGS.cbCF.ListIndex
        
    MAKE_sub_WORDS
    
    ' re-store carry flag!
    frmFLAGS.cbCF.ListIndex = ST_CF
    
End Sub


' the result of DEC is stored in C_lb
Public Sub dec_BYTE(ByVal iB As Byte, ByRef bALLOW_FLAGS As Boolean)
    
On Error Resume Next
    
    Dim ST_CF As Integer
    
    bSET_FLAGS = bALLOW_FLAGS
    
    'r1 Me.Show
    
    LOAD_A_lb iB
    LOAD_B_lb 1
        
    ' store carry flag!
    ' DEC does not effect the CF!
    ST_CF = frmFLAGS.cbCF.ListIndex
        
    MAKE_sub_BYTES
    
    ' re-store carry flag!
    frmFLAGS.cbCF.ListIndex = ST_CF
    
End Sub


' this function returns UNSIGNED INT (LONG is used to remove the sign)
Private Function GET_C() As Long
    
On Error Resume Next
    
    Dim i As Integer
    Dim n As Long
    Dim sum As Long
    
    sum = 0
    
    For i = 0 To 15
        n = cbC(i)
        sum = sum + n * (2 ^ i)
    Next i

    GET_C = sum
        
End Function

Public Function GET_C_SIGNED() As Integer
On Error Resume Next
    GET_C_SIGNED = to_signed_int(GET_C())
End Function

' returns the low byte of C (unsigned byte)
Public Function GET_C_lb() As Byte

On Error Resume Next

    Dim i As Byte
    Dim n As Byte
    Dim sum As Byte
    
    sum = 0
    
    For i = 0 To 7
        n = cbC(i)
        sum = sum + n * (2 ^ i)
    Next i

    GET_C_lb = sum
End Function

' returns the high byte of C (unsigned byte)
Public Function GET_C_hb() As Byte

On Error Resume Next

    Dim i As Byte
    Dim n As Byte
    Dim sum As Byte
    
    sum = 0
    
    For i = 0 To 7
        n = cbC(i + 8)
        sum = sum + n * (2 ^ i)
    Next i

    GET_C_hb = sum
End Function

' result of ADD is stored in C
Public Sub MAKE_add_WORDS()

On Error Resume Next

    Dim i As Integer
    Dim iCarry As Integer
    Dim allZERO As Boolean
    Dim isAF As Boolean
    Dim bPARITY_COUNTER As Byte
    Dim carryTo_MSB As Byte
    
    allZERO = True  ' left True only when all bits are ZERO.
    isAF = False    ' sets to True when there is carry to bit #4
    bPARITY_COUNTER = 0 ' every 1 in 8 lower bits is added.
    carryTo_MSB = 0 ' sets to 1 when there is a carry to bit #15
    
    iCarry = 0
    
    For i = 0 To 15
    
        ' check for AF:
        If (i = 4) And (iCarry = 1) Then isAF = True
        
        ' check for carry to MSB (for OF):
        If (i = 15) And (iCarry = 1) Then carryTo_MSB = 1
        
    
        If (cbA(i) = 0) And (cbB(i) = 0) And (iCarry = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 0) And (cbB(i) = 0) And (iCarry = 1) Then
            cbC(i) = 1
            iCarry = 0 ' reset carry.
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) And (iCarry = 0) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) And (iCarry = 1) Then
            cbC(i) = 0
            ' carry goes further.
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) And (iCarry = 0) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) And (iCarry = 1) Then
            cbC(i) = 0
            ' carry goes further.
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) And (iCarry = 0) Then
            cbC(i) = 0
            iCarry = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) And (iCarry = 1) Then
            cbC(i) = 1
            ' carry goes further.
        End If
        
        ' checking for ZF:
        If (cbC(i) = 1) Then allZERO = False
        
        ' ONLY first 8 bits are counted for PF:
        If (cbC(i) = 1) And i < 8 Then
            bPARITY_COUNTER = bPARITY_COUNTER + 1
        End If
        
    Next i
    
    If bSET_FLAGS Then
        
            ' set carry flag:   CF
            If (iCarry = 1) Then
                frmFLAGS.cbCF.ListIndex = 1
            Else
                frmFLAGS.cbCF.ListIndex = 0
            End If
            
            ' set zero flag:    ZF
            If allZERO Then
                frmFLAGS.cbZF.ListIndex = 1
            Else
                frmFLAGS.cbZF.ListIndex = 0
            End If
            
            ' set sign flag:    SF
            frmFLAGS.cbSF.ListIndex = cbC(15)
            
            ' set parity flag:  PF
            If ((bPARITY_COUNTER Mod 2) = 0) Then
                frmFLAGS.cbPF.ListIndex = 1
            Else
                frmFLAGS.cbPF.ListIndex = 0
            End If
            
            ' set Auxiliary Flag: AF
            If isAF Then
                frmFLAGS.cbAF.ListIndex = 1
            Else
                frmFLAGS.cbAF.ListIndex = 0
            End If
            
            ' set Overflow Flag:  OF
            If (carryTo_MSB = iCarry) Then
                frmFLAGS.cbOF.ListIndex = 0
            Else
                frmFLAGS.cbOF.ListIndex = 1
            End If
        
    End If
    
    print_alu_bits
    
End Sub

Private Sub MAKE_or_WORDS()

On Error Resume Next

    Dim i As Integer
    Dim allZERO As Boolean
    Dim bPARITY_COUNTER As Byte

    
    allZERO = True  ' left True only when all bits are ZERO.
    bPARITY_COUNTER = 0 ' every 1 in 8 lower bits is added.
    

    For i = 0 To 15
    
        If (cbA(i) = 0) And (cbB(i) = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) Then
            cbC(i) = 1
        End If
        
        ' checking for ZF:
        If (cbC(i) = 1) Then allZERO = False
        
        ' ONLY first 8 bits are counted for PF:
        If (cbC(i) = 1) And i < 8 Then
            bPARITY_COUNTER = bPARITY_COUNTER + 1
        End If
        
    Next i
    
    If bSET_FLAGS Then
        
            ' set carry flag:   CF
             frmFLAGS.cbCF.ListIndex = 0
            
            ' set zero flag:    ZF
            If allZERO Then
                frmFLAGS.cbZF.ListIndex = 1
            Else
                frmFLAGS.cbZF.ListIndex = 0
            End If
            
            ' set sign flag:    SF
            frmFLAGS.cbSF.ListIndex = cbC(15)
            
            ' set parity flag:  PF
            If ((bPARITY_COUNTER Mod 2) = 0) Then
                frmFLAGS.cbPF.ListIndex = 1
            Else
                frmFLAGS.cbPF.ListIndex = 0
            End If
            
            ' set Overflow Flag:  OF
            frmFLAGS.cbOF.ListIndex = 0
        
    End If
    
    print_alu_bits
    
End Sub

Private Sub MAKE_and_WORDS()

On Error Resume Next

    Dim i As Integer
    Dim allZERO As Boolean
    Dim bPARITY_COUNTER As Byte

    
    allZERO = True  ' left True only when all bits are ZERO.
    bPARITY_COUNTER = 0 ' every 1 in 8 lower bits is added.
    

    For i = 0 To 15
    
        If (cbA(i) = 0) And (cbB(i) = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) Then
            cbC(i) = 1
        End If
        
        ' checking for ZF:
        If (cbC(i) = 1) Then allZERO = False
        
        ' ONLY first 8 bits are counted for PF:
        If (cbC(i) = 1) And i < 8 Then
            bPARITY_COUNTER = bPARITY_COUNTER + 1
        End If
        
    Next i
    
    If bSET_FLAGS Then
        
            ' set carry flag:   CF
             frmFLAGS.cbCF.ListIndex = 0
            
            ' set zero flag:    ZF
            If allZERO Then
                frmFLAGS.cbZF.ListIndex = 1
            Else
                frmFLAGS.cbZF.ListIndex = 0
            End If
            
            ' set sign flag:    SF
            frmFLAGS.cbSF.ListIndex = cbC(15)
            
            ' set parity flag:  PF
            If ((bPARITY_COUNTER Mod 2) = 0) Then
                frmFLAGS.cbPF.ListIndex = 1
            Else
                frmFLAGS.cbPF.ListIndex = 0
            End If
            
            ' set Overflow Flag:  OF
            frmFLAGS.cbOF.ListIndex = 0
        
    End If
    
    print_alu_bits
    
End Sub


Private Sub MAKE_xor_WORDS()

On Error Resume Next

    Dim i As Integer
    Dim allZERO As Boolean
    Dim bPARITY_COUNTER As Byte

    
    allZERO = True  ' left True only when all bits are ZERO.
    bPARITY_COUNTER = 0 ' every 1 in 8 lower bits is added.
    

    For i = 0 To 15
    
        If (cbA(i) = 0) And (cbB(i) = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) Then
            cbC(i) = 0
        End If
        
        ' checking for ZF:
        If (cbC(i) = 1) Then allZERO = False
        
        ' ONLY first 8 bits are counted for PF:
        If (cbC(i) = 1) And i < 8 Then
            bPARITY_COUNTER = bPARITY_COUNTER + 1
        End If
        
    Next i
    
    If bSET_FLAGS Then
        
            ' set carry flag:   CF
             frmFLAGS.cbCF.ListIndex = 0
            
            ' set zero flag:    ZF
            If allZERO Then
                frmFLAGS.cbZF.ListIndex = 1
            Else
                frmFLAGS.cbZF.ListIndex = 0
            End If
            
            ' set sign flag:    SF
            frmFLAGS.cbSF.ListIndex = cbC(15)
            
            ' set parity flag:  PF
            If ((bPARITY_COUNTER Mod 2) = 0) Then
                frmFLAGS.cbPF.ListIndex = 1
            Else
                frmFLAGS.cbPF.ListIndex = 0
            End If
            
            ' set Overflow Flag:  OF
            frmFLAGS.cbOF.ListIndex = 0
        
    End If
    
    print_alu_bits
    
End Sub






Public Sub MAKE_add_BYTES()

On Error Resume Next

    Dim i As Integer
    Dim iCarry As Integer
    Dim allZERO As Boolean
    Dim isAF As Boolean
    Dim bPARITY_COUNTER As Byte
    Dim carryTo_MSB As Byte
    
    allZERO = True  ' left True only when all bits are ZERO.
    isAF = False    ' sets to True when there is carry to bit #4
    bPARITY_COUNTER = 0 ' every 1 in 8 lower bits is added.
    carryTo_MSB = 0 ' sets to 1 when there is a carry to bit #7
    
    iCarry = 0
    
    For i = 0 To 7
    
        ' check for AF:
        If (i = 4) And (iCarry = 1) Then isAF = True
        
        ' check for carry to MSB (for OF):
        If (i = 7) And (iCarry = 1) Then carryTo_MSB = 1
        
    
        If (cbA(i) = 0) And (cbB(i) = 0) And (iCarry = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 0) And (cbB(i) = 0) And (iCarry = 1) Then
            cbC(i) = 1
            iCarry = 0 ' reset carry.
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) And (iCarry = 0) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) And (iCarry = 1) Then
            cbC(i) = 0
            ' carry goes further.
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) And (iCarry = 0) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) And (iCarry = 1) Then
            cbC(i) = 0
            ' carry goes further.
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) And (iCarry = 0) Then
            cbC(i) = 0
            iCarry = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) And (iCarry = 1) Then
            cbC(i) = 1
            ' carry goes further.
        End If
        
        ' checking for ZF:
        If (cbC(i) = 1) Then allZERO = False
        
        ' bits are counted for PF:
        If (cbC(i) = 1) Then
            bPARITY_COUNTER = bPARITY_COUNTER + 1
        End If
        
    Next i
    
    If bSET_FLAGS Then
        
            ' set carry flag:   CF
            If (iCarry = 1) Then
                frmFLAGS.cbCF.ListIndex = 1
            Else
                frmFLAGS.cbCF.ListIndex = 0
            End If
            
            ' set zero flag:    ZF
            If allZERO Then
                frmFLAGS.cbZF.ListIndex = 1
            Else
                frmFLAGS.cbZF.ListIndex = 0
            End If
            
            ' set sign flag:    SF
            frmFLAGS.cbSF.ListIndex = cbC(7)
            
            ' set parity flag:  PF
            If ((bPARITY_COUNTER Mod 2) = 0) Then
                frmFLAGS.cbPF.ListIndex = 1
            Else
                frmFLAGS.cbPF.ListIndex = 0
            End If
            
            ' set Auxiliary Flag: AF
            If isAF Then
                frmFLAGS.cbAF.ListIndex = 1
            Else
                frmFLAGS.cbAF.ListIndex = 0
            End If
            
            ' set Overflow Flag:  OF
            If (carryTo_MSB = iCarry) Then
                frmFLAGS.cbOF.ListIndex = 0
            Else
                frmFLAGS.cbOF.ListIndex = 1
            End If
        
    End If
    
    print_alu_bits
    
End Sub

Private Sub MAKE_or_BYTES()

On Error Resume Next

    Dim i As Integer
    Dim allZERO As Boolean
    Dim bPARITY_COUNTER As Byte
    
    allZERO = True  ' left True only when all bits are ZERO.
    bPARITY_COUNTER = 0 ' every 1 in 8 lower bits is added.
    
    For i = 0 To 7
        
        If (cbA(i) = 0) And (cbB(i) = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) Then
            cbC(i) = 1
        End If
        
        ' checking for ZF:
        If (cbC(i) = 1) Then allZERO = False
        
        ' bits are counted for PF:
        If (cbC(i) = 1) Then
            bPARITY_COUNTER = bPARITY_COUNTER + 1
        End If
        
    Next i
    
    If bSET_FLAGS Then
        
            ' set carry flag:   CF
            frmFLAGS.cbCF.ListIndex = 0
            
            ' set zero flag:    ZF
            If allZERO Then
                frmFLAGS.cbZF.ListIndex = 1
            Else
                frmFLAGS.cbZF.ListIndex = 0
            End If
            
            ' set sign flag:    SF
            frmFLAGS.cbSF.ListIndex = cbC(7)
            
            ' set parity flag:  PF
            If ((bPARITY_COUNTER Mod 2) = 0) Then
                frmFLAGS.cbPF.ListIndex = 1
            Else
                frmFLAGS.cbPF.ListIndex = 0
            End If
                       
            ' set Overflow Flag:  OF
            frmFLAGS.cbOF.ListIndex = 0
        
    End If
    
    print_alu_bits
    
End Sub

Private Sub MAKE_xor_BYTES()

On Error Resume Next

    Dim i As Integer
    Dim allZERO As Boolean
    Dim bPARITY_COUNTER As Byte
    
    allZERO = True  ' left True only when all bits are ZERO.
    bPARITY_COUNTER = 0 ' every 1 in 8 lower bits is added.
    
    For i = 0 To 7
        
        If (cbA(i) = 0) And (cbB(i) = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) Then
            cbC(i) = 0
        End If
        
        ' checking for ZF:
        If (cbC(i) = 1) Then allZERO = False
        
        ' bits are counted for PF:
        If (cbC(i) = 1) Then
            bPARITY_COUNTER = bPARITY_COUNTER + 1
        End If
        
    Next i
    
    If bSET_FLAGS Then
        
            ' set carry flag:   CF
            frmFLAGS.cbCF.ListIndex = 0
            
            ' set zero flag:    ZF
            If allZERO Then
                frmFLAGS.cbZF.ListIndex = 1
            Else
                frmFLAGS.cbZF.ListIndex = 0
            End If
            
            ' set sign flag:    SF
            frmFLAGS.cbSF.ListIndex = cbC(7)
            
            ' set parity flag:  PF
            If ((bPARITY_COUNTER Mod 2) = 0) Then
                frmFLAGS.cbPF.ListIndex = 1
            Else
                frmFLAGS.cbPF.ListIndex = 0
            End If
                       
            ' set Overflow Flag:  OF
            frmFLAGS.cbOF.ListIndex = 0
        
    End If
    
    print_alu_bits
    
End Sub



Private Sub MAKE_and_BYTES()

On Error Resume Next

    Dim i As Integer
    Dim allZERO As Boolean
    Dim bPARITY_COUNTER As Byte
    
    allZERO = True  ' left True only when all bits are ZERO.
    bPARITY_COUNTER = 0 ' every 1 in 8 lower bits is added.
    
    For i = 0 To 7
        
        If (cbA(i) = 0) And (cbB(i) = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) Then
            cbC(i) = 1
        End If
        
        ' checking for ZF:
        If (cbC(i) = 1) Then allZERO = False
        
        ' bits are counted for PF:
        If (cbC(i) = 1) Then
            bPARITY_COUNTER = bPARITY_COUNTER + 1
        End If
        
    Next i
    
    If bSET_FLAGS Then
        
            ' set carry flag:   CF
            frmFLAGS.cbCF.ListIndex = 0
            
            ' set zero flag:    ZF
            If allZERO Then
                frmFLAGS.cbZF.ListIndex = 1
            Else
                frmFLAGS.cbZF.ListIndex = 0
            End If
            
            ' set sign flag:    SF
            frmFLAGS.cbSF.ListIndex = cbC(7)
            
            ' set parity flag:  PF
            If ((bPARITY_COUNTER Mod 2) = 0) Then
                frmFLAGS.cbPF.ListIndex = 1
            Else
                frmFLAGS.cbPF.ListIndex = 0
            End If
                       
            ' set Overflow Flag:  OF
            frmFLAGS.cbOF.ListIndex = 0
        
    End If
    
    print_alu_bits
    
End Sub





Public Sub MAKE_sub_WORDS()

On Error Resume Next

    Dim i As Integer
    Dim iCarry As Integer
    Dim allZERO As Boolean
    Dim isAF As Boolean
    Dim bPARITY_COUNTER As Byte
    Dim carryTo_MSB As Byte
    
    allZERO = True  ' left True only when all bits are ZERO.
    isAF = False    ' sets to True when there is carry to bit #4
    bPARITY_COUNTER = 0 ' every 1 in 8 lower bits is added.
    carryTo_MSB = 0 ' sets to 1 when there is a carry to bit #15
    
    iCarry = 0
    
    For i = 0 To 15
    
        ' check for AF:
        If (i = 4) And (iCarry = 1) Then isAF = True
        
        ' check for carry to MSB (for OF):
        If (i = 15) And (iCarry = 1) Then carryTo_MSB = 1
    
    
        If (cbA(i) = 0) And (cbB(i) = 0) And (iCarry = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 0) And (cbB(i) = 0) And (iCarry = 1) Then
            cbC(i) = 1
            ' carry goes further.
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) And (iCarry = 0) Then
            cbC(i) = 1
            iCarry = 1
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) And (iCarry = 1) Then
            cbC(i) = 0
            ' carry goes further.
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) And (iCarry = 0) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) And (iCarry = 1) Then
            cbC(i) = 0
            iCarry = 0
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) And (iCarry = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) And (iCarry = 1) Then
            cbC(i) = 1
            ' carry goes further.
        End If
        
        ' checking for ZF:
        If (cbC(i) = 1) Then allZERO = False
        
        ' ONLY first 8 bits are counted for PF:
        If (cbC(i) = 1) And i < 8 Then
            bPARITY_COUNTER = bPARITY_COUNTER + 1
        End If
        
    Next i
    
    
    If bSET_FLAGS Then
        
            ' set carry flag:   CF
            If (iCarry = 1) Then
                frmFLAGS.cbCF.ListIndex = 1
            Else
                frmFLAGS.cbCF.ListIndex = 0
            End If
            
            ' set zero flag:    ZF
            If allZERO Then
                frmFLAGS.cbZF.ListIndex = 1
            Else
                frmFLAGS.cbZF.ListIndex = 0
            End If
            
            ' set sign flag:    SF
            frmFLAGS.cbSF.ListIndex = cbC(15)
            
            ' set parity flag:  PF
            If ((bPARITY_COUNTER Mod 2) = 0) Then
                frmFLAGS.cbPF.ListIndex = 1
            Else
                frmFLAGS.cbPF.ListIndex = 0
            End If
            
            ' set Auxiliary Flag: AF
            If isAF Then
                frmFLAGS.cbAF.ListIndex = 1
            Else
                frmFLAGS.cbAF.ListIndex = 0
            End If
            
            ' set Overflow Flag:  OF
            If (carryTo_MSB = iCarry) Then
                frmFLAGS.cbOF.ListIndex = 0
            Else
                frmFLAGS.cbOF.ListIndex = 1
            End If
        
    End If
    
    print_alu_bits
    
End Sub

Public Sub MAKE_sub_BYTES()

On Error Resume Next

    Dim i As Integer
    Dim iCarry As Integer
    Dim allZERO As Boolean
    Dim isAF As Boolean
    Dim bPARITY_COUNTER As Byte
    Dim carryTo_MSB As Byte
    
    allZERO = True  ' left True only when all bits are ZERO.
    isAF = False    ' sets to True when there is carry to bit #4
    bPARITY_COUNTER = 0 ' every 1 in 8 lower bits is added.
    carryTo_MSB = 0 ' sets to 1 when there is a carry to bit #7
    
    iCarry = 0
    
    For i = 0 To 7
    
        ' check for AF:
        If (i = 4) And (iCarry = 1) Then isAF = True
        
        ' check for carry to MSB (for OF):
        If (i = 7) And (iCarry = 1) Then carryTo_MSB = 1
    
    
        If (cbA(i) = 0) And (cbB(i) = 0) And (iCarry = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 0) And (cbB(i) = 0) And (iCarry = 1) Then
            cbC(i) = 1
            ' carry goes further.
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) And (iCarry = 0) Then
            cbC(i) = 1
            iCarry = 1
        ElseIf (cbA(i) = 0) And (cbB(i) = 1) And (iCarry = 1) Then
            cbC(i) = 0
            ' carry goes further.
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) And (iCarry = 0) Then
            cbC(i) = 1
        ElseIf (cbA(i) = 1) And (cbB(i) = 0) And (iCarry = 1) Then
            cbC(i) = 0
            iCarry = 0
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) And (iCarry = 0) Then
            cbC(i) = 0
        ElseIf (cbA(i) = 1) And (cbB(i) = 1) And (iCarry = 1) Then
            cbC(i) = 1
            ' carry goes further.
        End If
        
        ' checking for ZF:
        If (cbC(i) = 1) Then allZERO = False
        
        ' bits are counted for PF:
        If (cbC(i) = 1) Then
            bPARITY_COUNTER = bPARITY_COUNTER + 1
        End If
        
    Next i
    
    
    If bSET_FLAGS Then
        
            ' set carry flag:   CF
            If (iCarry = 1) Then
                frmFLAGS.cbCF.ListIndex = 1
            Else
                frmFLAGS.cbCF.ListIndex = 0
            End If
            
            ' set zero flag:    ZF
            If allZERO Then
                frmFLAGS.cbZF.ListIndex = 1
            Else
                frmFLAGS.cbZF.ListIndex = 0
            End If
            
            ' set sign flag:    SF
            frmFLAGS.cbSF.ListIndex = cbC(7)
            
            ' set parity flag:  PF
            If ((bPARITY_COUNTER Mod 2) = 0) Then
                frmFLAGS.cbPF.ListIndex = 1
            Else
                frmFLAGS.cbPF.ListIndex = 0
            End If
            
            ' set Auxiliary Flag: AF
            If isAF Then
                frmFLAGS.cbAF.ListIndex = 1
            Else
                frmFLAGS.cbAF.ListIndex = 0
            End If
            
            ' set Overflow Flag:  OF
            If (carryTo_MSB = iCarry) Then
                frmFLAGS.cbOF.ListIndex = 0
            Else
                frmFLAGS.cbOF.ListIndex = 1
            End If
        
    End If
    
    print_alu_bits
    
End Sub

Public Sub LOAD_A(ByRef iNum As Integer)
    Dim sBIN As String
    Dim i As Integer
    Dim j As Integer
    
    sBIN = toBIN_WORD(iNum)
    
    j = 1
    
    For i = 15 To 0 Step -1
        
        If (Mid(sBIN, j, 1) = "1") Then
            cbA(i) = 1
        Else
            cbA(i) = 0
        End If
        
        j = j + 1
    Next i
    
End Sub

' loads bNum to 8 low bits of A ALU register:
Public Sub LOAD_A_lb(ByRef bNum As Byte)

On Error Resume Next

    Dim sBIN As String
    Dim i As Integer
    Dim j As Integer
    
    sBIN = toBIN_BYTE(bNum)
    
    j = 1
    
    For i = 7 To 0 Step -1
        
        If (Mid(sBIN, j, 1) = "1") Then
            cbA(i) = 1
        Else
            cbA(i) = 0
        End If
        
        j = j + 1
    Next i
    
    
    
End Sub

' loads bNum to 8 high bits of A ALU register:
Public Sub LOAD_A_hb(ByRef bNum As Byte)

On Error Resume Next


    Dim sBIN As String
    Dim i As Integer
    Dim j As Integer
    
    sBIN = toBIN_BYTE(bNum)
    
    j = 1
    
    For i = 15 To 8 Step -1
        
        If (Mid(sBIN, j, 1) = "1") Then
            cbA(i) = 1
        Else
            cbA(i) = 0
        End If
        
        j = j + 1
    Next i
    
End Sub


' loads bNum to 8 low bits of B ALU register:
Public Sub LOAD_B_lb(ByRef bNum As Byte)

On Error Resume Next

    Dim sBIN As String
    Dim i As Integer
    Dim j As Integer
    
    sBIN = toBIN_BYTE(bNum)
    
    j = 1
    
    For i = 7 To 0 Step -1
        
        If (Mid(sBIN, j, 1) = "1") Then
            cbB(i) = 1
        Else
            cbB(i) = 0
        End If
        
        j = j + 1
    Next i
    
End Sub

Public Sub LOAD_B(ByRef iNum As Integer)

On Error Resume Next

    Dim sBIN As String
    Dim i As Integer
    Dim j As Integer
    
    sBIN = toBIN_WORD(iNum)
    
    j = 1
    
    For i = 15 To 0 Step -1
        
        If (Mid(sBIN, j, 1) = "1") Then
            cbB(i) = 1
        Else
            cbB(i) = 0
        End If
        
        j = j + 1
    Next i
    
End Sub


' result of LEFT SHIFT of WORD is stored in C
Public Sub shiftL_WORD(ByRef wrd As Integer, ByRef bitsToShift As Integer)

On Error Resume Next

        Dim i As Integer
        
        bSET_FLAGS = False  ' jic.
        
        ALU.LOAD_A wrd
        
        ' set LEFT bits of C to zero
        For i = 0 To bitsToShift - 1
            cbC(i) = 0
        Next i
        
        For i = 0 To 15
            If ((i + bitsToShift) > 15) Then Exit Sub   ' right bits are lost.
            cbC(i + bitsToShift) = cbA(i)
        Next i
        
        print_alu_bits
        
End Sub

' moves contents of ALU.C to ALU.A
Public Sub move_C_to_A()

On Error Resume Next

        Dim i As Integer
        
        For i = 0 To 15
            cbA(i) = cbC(i)
        Next i
        
        print_alu_bits
End Sub

' moves contents of ALU.C_lb to ALU.A_lb
Public Sub move_C_lb_to_A_lb()
        Dim i As Integer
        
        For i = 0 To 7
            cbA(i) = cbC(i)
        Next i
        
        print_alu_bits
End Sub

Private Sub Form_Load()

On Error Resume Next

'#1159    If Load_from_Lang_File(Me) Then Exit Sub

    GetWindowPos Me ' 2.05#551

    
    '#1059 Me.Icon = frmMain.Icon
    
    ' 1.20
    Me.FontTransparent = False
    
    b_LOADED_ALU = True
End Sub

Private Sub Form_Paint()
On Error Resume Next
    print_alu_bits
End Sub

' 1.02
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

On Error Resume Next

    If UnloadMode = vbFormControlMenu Then
            Cancel = 1
            Me.Hide
            
            Exit Sub  ' 2.03#518
    End If
    
    ' this form is unloaded only
    ' on application termination (exit).
    
    b_LOADED_ALU = False
End Sub

' 1.02
' 1.29#404 Private Sub Form_Activate()
Public Sub DoShowMe()
On Error Resume Next '3.27xm
    Me.Show
    
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
End Sub

' 1.04
' moves contents of ALU.A_lb to ALU.C_lb
' by inverting it (no flags are effected):
Public Sub NOT_A_lb_to_C_lb()
On Error Resume Next
        Dim i As Integer
        
        For i = 0 To 7
            If cbA(i) = 0 Then
                cbC(i) = 1
            Else
                cbC(i) = 0
            End If
        Next i
        
        print_alu_bits
End Sub

' 1.04
' moves contents of ALU.A to ALU.C
' by inverting it (no flags are effected):
Public Sub NOT_A_to_C()

On Error Resume Next

        Dim i As Integer
        
        For i = 0 To 15
            If cbA(i) = 0 Then
                cbC(i) = 1
            Else
                cbC(i) = 0
            End If
        Next i
        
        print_alu_bits
End Sub



' 1.06
Public Sub SHL_BYTE(bBYTE As Byte, ByVal bCounter As Byte, iBitToAdd As Integer)

On Error Resume Next

    LOAD_A_lb bBYTE
    
    bCounter = bCounter And 31 ' mask 5 low bits only (286 and up compatibility). 2005-05-17
    
    Dim b As Byte
    
    For b = 1 To bCounter
        doSHIFT_A_lb_LEFT iBitToAdd
        move_C_lb_to_A_lb
    Next b
    
    ' #400b15-flags-bug# ??? ' ROL, RCL don't seem to effect OF, PF, ZF (not by the book!)
    ' #400b15-flags-bug# ' If iBitToAdd >= 0 Then
        ' when CF <> most left bit:
        If frmFLAGS.cbCF.ListIndex <> cbC(7) Then
            frmFLAGS.cbOF.ListIndex = 1
        Else
            frmFLAGS.cbOF.ListIndex = 0
        End If
     If iBitToAdd >= 0 Then  ' #400b15-flags-bug# ' ROL does not affect PF, SF,
        ' set parity flag (only low 8 bits of C_lb are effected):
        setPF_ZF_SF 8
     End If
End Sub


Public Sub SHR_BYTE(bBYTE As Byte, ByVal bCounter As Byte, iBitToAdd As Integer)

On Error Resume Next

    LOAD_A_lb bBYTE
    
    bCounter = bCounter And 31 ' mask 5 low bits only (286 and up compatibility). 2005-05-17
    
    Dim b As Byte
    
    For b = 1 To bCounter
        doSHIFT_A_lb_RIGHT iBitToAdd
        move_C_lb_to_A_lb
    Next b
    
    ' I hope, I got it right (sign changed):
    If bCounter = 1 Then ' it seems not to effect OF otherwise.
        If cbC(6) <> cbC(7) Then
            frmFLAGS.cbOF.ListIndex = 1
        Else
            frmFLAGS.cbOF.ListIndex = 0
        End If
    End If
    
    ' ROR, RCR don't seem to effect PF, ZF, SF
    If iBitToAdd >= 0 Then
        ' set parity flag (only low 8 bits of C_lb are effected):
        setPF_ZF_SF 8
    End If
End Sub


Public Sub SHL_WORD(iWORD As Integer, ByVal bCounter As Byte, iBitToAdd As Integer)

On Error Resume Next

    LOAD_A iWORD
    
    bCounter = bCounter And 31 ' mask 5 low bits only (286 and up compatibility). 2005-05-17
    
    Dim b As Byte
    
    For b = 1 To bCounter
        doSHIFT_A_LEFT iBitToAdd
        move_C_to_A
    Next b
    
    ' #400b15-flags-bug# ?? ' ROL, RCL don't seem to effect OF, PF (not by the book!)
    ' #400b15-flags-bug# ' If iBitToAdd >= 0 Then
    ' #400b15-flags-bug# - seems to affect OF!
        ' when CF <> most left bit:
        If frmFLAGS.cbCF.ListIndex <> cbC(15) Then
            frmFLAGS.cbOF.ListIndex = 1
        Else
            frmFLAGS.cbOF.ListIndex = 0
        End If
        
    If iBitToAdd >= 0 Then  ' #400b15-flags-bug#
        ' set parity flag (only low 8 bits of C_lb are effected):
        setPF_ZF_SF 16
    End If
End Sub


Public Sub SHR_WORD(iWORD As Integer, ByVal bCounter As Byte, iBitToAdd As Integer)

On Error Resume Next

    LOAD_A iWORD
    
    bCounter = bCounter And 31 ' mask 5 low bits only (286 and up compatibility). 2005-05-17
    
    Dim b As Byte
    
    For b = 1 To bCounter
        doSHIFT_A_RIGHT iBitToAdd
        move_C_to_A
    Next b
    

    ' I hope, I got it right (sign changed):
    If bCounter = 1 Then ' it seems not to effect OF otherwise.
        If cbC(14) <> cbC(15) Then
            frmFLAGS.cbOF.ListIndex = 1
        Else
            frmFLAGS.cbOF.ListIndex = 0
        End If
    End If
        
    ' ROR, RCR don't seem to effect PF, ZF, SF
    If iBitToAdd >= 0 Then
        ' set parity flag (only low 8 bits of C_lb are effected):
        setPF_ZF_SF 16
    End If
End Sub



' <----
' shifts all bits of A_lb to the left
' result is store in C_lb, flags are set
Private Sub doSHIFT_A_lb_LEFT(iBitToAdd As Integer)

On Error Resume Next

    Dim i As Integer
    Dim iOldCF As Integer
    
    If iBitToAdd = -2 Then
        ' used in RCL
        iOldCF = frmFLAGS.cbCF.ListIndex
    End If
    
    ' the bit that goes out is set to CF:
    frmFLAGS.cbCF.ListIndex = cbA(7)
    
    For i = 6 To 0 Step -1
         cbC(i + 1) = cbA(i)
    Next i
    
    If iBitToAdd >= 0 Then
        cbC(0) = iBitToAdd
    ElseIf iBitToAdd = -1 Then
        ' used in ROL
        ' CF = A(7) -> C(0)
        cbC(0) = frmFLAGS.cbCF.ListIndex
    ElseIf iBitToAdd = -2 Then
        ' used in RCL
        cbC(0) = iOldCF
    End If
    
    print_alu_bits
End Sub

' ---->
' shifts all bits of A_lb to the right
' result is store in C_lb, flags are set
Private Sub doSHIFT_A_lb_RIGHT(iBitToAdd As Integer)

On Error Resume Next

    Dim i As Integer
    Dim iOldCF As Integer
    
    If iBitToAdd = -2 Then
        ' used in RCR
        iOldCF = frmFLAGS.cbCF.ListIndex
    ElseIf iBitToAdd = 5 Then
        ' adding the same bit as was there (keep the sign):
        iBitToAdd = cbA(7)
    End If
    
    ' the bit that goes out is set to CF:
    frmFLAGS.cbCF.ListIndex = cbA(0)
    
    For i = 0 To 6
         cbC(i) = cbA(i + 1)
    Next i
    
    If iBitToAdd >= 0 Then
        cbC(7) = iBitToAdd
    ElseIf iBitToAdd = -1 Then
        ' used in ROR
        ' CF = A(0) -> C(7)
        cbC(7) = frmFLAGS.cbCF.ListIndex
    ElseIf iBitToAdd = -2 Then
        ' used in RCR
        cbC(7) = iOldCF
    End If
    
    print_alu_bits
End Sub


' <----
' shifts all bits of A to the left
' result is store in C, flags are set
Private Sub doSHIFT_A_LEFT(iBitToAdd As Integer)

On Error Resume Next

    Dim i As Integer
    Dim iOldCF As Integer
    
    If iBitToAdd = -2 Then
        ' used in RCL
        iOldCF = frmFLAGS.cbCF.ListIndex
    End If
    
    ' the bit that goes out is set to CF:
    frmFLAGS.cbCF.ListIndex = cbA(15)
    
    For i = 14 To 0 Step -1
         cbC(i + 1) = cbA(i)
    Next i
    
    If iBitToAdd >= 0 Then
        cbC(0) = iBitToAdd
    ElseIf iBitToAdd = -1 Then
        ' used in ROL
        ' CF = A(15) -> C(0)
        cbC(0) = frmFLAGS.cbCF.ListIndex
    ElseIf iBitToAdd = -2 Then
        ' used in RCL
        cbC(0) = iOldCF
    End If
    
    print_alu_bits
End Sub



' ---->
' shifts all bits of A to the right
' result is store in C, flags are set
Private Sub doSHIFT_A_RIGHT(iBitToAdd As Integer)

On Error Resume Next

    Dim i As Integer
    Dim iOldCF As Integer
    
    If iBitToAdd = -2 Then
        ' used in RCR
        iOldCF = frmFLAGS.cbCF.ListIndex
    ElseIf iBitToAdd = 5 Then
        ' adding the same bit as was there (keep the sign):
        iBitToAdd = cbA(15)
    End If
    
    ' the bit that goes out is set to CF:
    frmFLAGS.cbCF.ListIndex = cbA(0)
    
    For i = 0 To 14
         cbC(i) = cbA(i + 1)
    Next i
    
    If iBitToAdd >= 0 Then
        cbC(15) = iBitToAdd
    ElseIf iBitToAdd = -1 Then
        ' used in ROR
        ' CF = A(0) -> C(15)
        cbC(15) = frmFLAGS.cbCF.ListIndex
    ElseIf iBitToAdd = -2 Then
        ' used in RCR
        cbC(15) = iOldCF
    End If
    
    print_alu_bits
End Sub




' sets the Parity flag, Zero flag and Sign flag,
' for parity counting only 8 bits of C_lb
Private Sub setPF_ZF_SF(iBIT_COUNT As Integer)

On Error Resume Next

    Dim bPARITY_COUNTER As Byte
    Dim i As Integer
    Dim bALL_ZEROS As Boolean
    
    bPARITY_COUNTER = 0
    bALL_ZEROS = True
    
    For i = 0 To iBIT_COUNT - 1
        If cbC(i) = 1 Then
            If i < 8 Then ' for parity counting only 8 bits of C_lb
                bPARITY_COUNTER = bPARITY_COUNTER + 1
            End If
            bALL_ZEROS = False
        End If
    Next i

    ' set parity flag:  PF
    If ((bPARITY_COUNTER Mod 2) = 0) Then
        frmFLAGS.cbPF.ListIndex = 1
    Else
        frmFLAGS.cbPF.ListIndex = 0
    End If
    
    ' set zero flag: ZF
    If bALL_ZEROS Then
        frmFLAGS.cbZF.ListIndex = 1
    Else
        frmFLAGS.cbZF.ListIndex = 0
    End If
    
    ' set sign flag: SF
    frmFLAGS.cbSF.ListIndex = cbC(iBIT_COUNT - 1)

End Sub



' 1.20
Private Sub print_alu_bits()

On Error Resume Next

    If Me.Visible = False Then Exit Sub

    Dim i As Integer
    
    ' Me.Cls
    
    '''''''' captions ''''''''''''''''
    Me.CurrentX = Me.TextWidth("0")
    Me.CurrentY = Me.TextHeight("01")
    Me.ForeColor = SystemColorConstants.vbWindowText  ' RGB(128, 0, 0)
    
    For i = 15 To 8 Step -1
        Me.Print " " & Hex(i) & " ";
    Next i
    
    Me.ForeColor = SystemColorConstants.vbWindowText   'vbBlack
    
    For i = 7 To 0 Step -1
        Me.Print " " & Hex(i) & " ";
    Next i
    
    '''''''''''' A ''''''''''''''''''''''''''
    Me.CurrentX = Me.TextWidth("0")
    Me.CurrentY = Me.TextHeight("01") * 2
    
    For i = 15 To 0 Step -1
        print_c_bit cbA(i)
    Next i

    '''''''''''' B ''''''''''''''''''''''''''
    Me.CurrentX = Me.TextWidth("0")
    Me.CurrentY = Me.TextHeight("01") * 3
    
    For i = 15 To 0 Step -1
        print_c_bit cbB(i)
    Next i

    '''''''''''' C ''''''''''''''''''''''''''
    Me.CurrentX = Me.TextWidth("0")
    Me.CurrentY = Me.TextHeight("01") * 5
    
    For i = 15 To 0 Step -1
        print_c_bit cbC(i)
    Next i

End Sub

' 1.20
Private Sub print_c_bit(ByRef bc As Integer) 'Byte)

On Error Resume Next

    If bc = 0 Then
        Me.ForeColor = SystemColorConstants.vbWindowText  ' vbBlue
    Else
        Me.ForeColor = SystemColorConstants.vbWindowText  ' vbRed
    End If
    
    Me.Print bc;
End Sub


' 1.27#343
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
On Error Resume Next
    frmEmulation.process_HotKey KeyCode, Shift
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
    SaveWindowState Me ' 2.05#551
End Sub







' #1095k
' return all 3 registers as integers
' input should be: 1 for A, 2 for B, and 3 for C.
' works only when ALU is visible!
Public Function returnALU_STATE(iABC As Integer) As Long
    
On Error GoTo err1

    returnALU_STATE = 0
    
    If Not Me.Visible Then Exit Function
 
    Dim i As Integer
    
    Select Case iABC
    
    Case 1
    
        For i = 0 To 15
            returnALU_STATE = returnALU_STATE + CLng(cbA(i)) * 2 ^ i
        Next i
        
    Case 2
    
        For i = 0 To 15
            returnALU_STATE = returnALU_STATE + CLng(cbB(i)) * 2 ^ i
        Next i
        
    Case 3
    
        For i = 0 To 15
            returnALU_STATE = returnALU_STATE + CLng(cbC(i)) * 2 ^ i
        Next i
        
    Case Else
    
        Debug.Print "Error returnALU_STATE: " & iABC
    
    End Select
    
    Exit Function
    
err1:
    Debug.Print "err returnALU_STATE: " & LCase(Err.Description)
    
End Function

Public Sub setALU_STATE(iABC As Integer, lValue As Long)
       
On Error GoTo err1
    
    If Not Me.Visible Then Exit Sub
 
    Dim i As Integer
    
    Select Case iABC
    
    Case 1
    
        For i = 0 To 15
            cbA(i) = lValue Mod 2
            lValue = Fix(lValue / 2)
        Next i
        
    Case 2
    
        For i = 0 To 15
            cbB(i) = lValue Mod 2
            lValue = Fix(lValue / 2)
        Next i
        
        
    Case 3
    
        For i = 0 To 15
            cbC(i) = lValue Mod 2
            lValue = Fix(lValue / 2)
        Next i
        
        
    Case Else
    
        Debug.Print "Error setALU_STATE: " & iABC
    
    End Select
    
    Exit Sub
    
err1:
    Debug.Print "err setALU_STATE: " & LCase(Err.Description)
    
End Sub


' #327s-parity-bug#
' I decided to set this flag independently...
Public Sub set_parity_flag(byteValue As Byte)

On Error GoTo err1
        
        Dim s As String
        Dim i As Integer
        Dim iPARITY_COUNTER As Integer
        
        s = toBIN_BYTE(byteValue)
        iPARITY_COUNTER = 0
        
        For i = 1 To 8
            If Mid(s, i, 1) = "1" Then iPARITY_COUNTER = iPARITY_COUNTER + 1
        Next i
        
        
        If ((iPARITY_COUNTER Mod 2) = 0) Then
            frmFLAGS.cbPF.ListIndex = 1
        Else
            frmFLAGS.cbPF.ListIndex = 0
        End If
        
        Exit Sub
err1:
        Debug.Print "set_parity_flag: " & Err.Description
End Sub

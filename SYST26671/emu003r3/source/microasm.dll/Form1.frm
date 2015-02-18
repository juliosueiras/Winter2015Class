VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3075
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   2850
   LinkTopic       =   "Form1"
   ScaleHeight     =   3075
   ScaleWidth      =   2850
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmd2 
      Caption         =   "cmd2"
      Height          =   540
      Left            =   60
      TabIndex        =   2
      Top             =   1365
      Width           =   2730
   End
   Begin VB.CommandButton cmd1 
      Caption         =   "cmd1"
      Height          =   540
      Left            =   60
      TabIndex        =   1
      Top             =   720
      Width           =   2730
   End
   Begin VB.CommandButton cmd0 
      Caption         =   "cmd0"
      Height          =   540
      Left            =   60
      TabIndex        =   0
      Top             =   75
      Width           =   2730
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


' global declaration -> CRASH
''''' Dim FPU_STATE_94bytes As fpu87_STATE

Private Sub cmd0_Click()

On Error GoTo err1

    Dim a1 As Long
    Dim a2 As Long
    
    a1 = 5
    a2 = 10
    
    Debug.Print MicroAsm_T(a1, a2), a1, a2
    
    
    Exit Sub
err1:
    Debug.Print "MicroAsm_T : err: " & Err.Description
End Sub






Private Sub cmd1_Click()

On Error GoTo err1
    
  ' global declaration -> CRASH
  ' so declared here.... may copy to global manually if required...
    Dim FPU_STATE_94bytes As fpu87_STATE

    Dim mem2i    As fpuREGISTER_2byte
    
    Dim mem4r    As fpuREGISTER_4byte
    
    Dim mem8r    As fpuREGISTER_8byte

    Dim mem14    As fpuREGISTER_14byte
    

    ' dd 5.0
    mem4r.fpuBYTE(0) = &H0
    mem4r.fpuBYTE(1) = &H0
    mem4r.fpuBYTE(2) = &HA0
    mem4r.fpuBYTE(3) = &H40
    
    ' should not be changed
    Debug.Print "mem4r: " & byteHex(mem4r.fpuBYTE(0)) & byteHex(mem4r.fpuBYTE(1)) & byteHex(mem4r.fpuBYTE(2)) & byteHex(mem4r.fpuBYTE(3))



    



    Dim lTab As Long
    Dim lret As Long
    
    
    lret = MicroAsm_FINIT(FPU_STATE_94bytes)
    
    Debug.Print "lret0:" & lret
    
    ' D9 /0     FLD mem4r       push, 0 := mem4r
    ' D9 /1     FNOP (RESERVED)
    lTab = 0
    lret = MicroAsm_D9_TAB(lTab, mem4r, mem14, mem2i, FPU_STATE_94bytes)
    
    Debug.Print "lret1:" & lret
    
    
    '  D8 /0     FADD mem4r      0 := 0 + mem4r
    lTab = 0
    lret = MicroAsm_D8_TAB(lTab, mem4r, FPU_STATE_94bytes)


    lret = MicroAsm_D8_TAB(lTab, mem4r, FPU_STATE_94bytes)


    Debug.Print "lret2:" & lret
    

    
    Dim iByte As Integer
    Dim jReg As Integer
    
    For jReg = 0 To 7
        For iByte = 0 To 9
            ' should be 5 specifically encoded :)
            Debug.Print "bytes94.fpuReg(" & jReg & ").fpuBYTE(" & iByte & ")   -->  " & Hex(FPU_STATE_94bytes.fpuReg(jReg).fpuBYTE(iByte))
        Next iByte
        Debug.Print " --- "
    Next jReg
    
'''    aaa
    
    ' should not be changed
    Debug.Print "mem4r: " & byteHex(mem4r.fpuBYTE(0)) & byteHex(mem4r.fpuBYTE(1)) & byteHex(mem4r.fpuBYTE(2)) & byteHex(mem4r.fpuBYTE(3))
    
    
    ' last init   just to
    lret = MicroAsm_FINIT(FPU_STATE_94bytes)
    Debug.Print "lret_last:" & lret
    
    
    Exit Sub
err1:

    Debug.Print "err cmd1: " & LCase(Err.Description)

End Sub

''
''Sub aaa()
''    Dim a
''    a = 5 / 3  ' once I got "expression to complex" error when I was not saving FPU state :)
''    ' seems like VB is using FPU often....
''End Sub



Private Sub cmd2_Click()
On Error GoTo err1

    Dim lEA_TAB As Long
    Dim fpuSTATE As fpu87_STATE
    
    
    Dim mem2i    As fpuREGISTER_2byte
    Dim mem4i    As fpuREGISTER_4byte
    Dim mem4r    As fpuREGISTER_4byte
    Dim mem8r    As fpuREGISTER_8byte
    Dim mem8d    As fpuREGISTER_8byte
    Dim mem10r   As fpuREGISTER_10byte
    Dim mem10i   As fpuREGISTER_10byte
    Dim mem14    As fpuREGISTER_14byte
    Dim mem94    As fpu87_STATE
    
    
    
lEA_TAB = 6

'Debug.Print "MicroAsm_D8_TAB: " & MicroAsm_D8_TAB(lEA_TAB, mem4r, fpuSTATE)
Debug.Print "MicroAsm_D9_TAB: " & MicroAsm_D9_TAB(lEA_TAB, mem4r, mem14, mem2i, fpuSTATE)
Debug.Print "MicroAsm_DA_TAB: " & MicroAsm_DA_TAB(lEA_TAB, mem4i, fpuSTATE)
Debug.Print "MicroAsm_DB_TAB: " & MicroAsm_DB_TAB(lEA_TAB, mem4i, mem10r, fpuSTATE)
Debug.Print "MicroAsm_DC_TAB: " & MicroAsm_DC_TAB(lEA_TAB, mem8r, fpuSTATE)
Debug.Print "MicroAsm_DD_TAB: " & MicroAsm_DD_TAB(lEA_TAB, mem8r, mem94, mem2i, fpuSTATE)
Debug.Print "MicroAsm_DE_TAB: " & MicroAsm_DE_TAB(lEA_TAB, mem2i, fpuSTATE)
Debug.Print "MicroAsm_DF_TAB: " & MicroAsm_DF_TAB(lEA_TAB, mem2i, mem8d, mem10i, fpuSTATE)
    
    
    
    Exit Sub
err1:

    Debug.Print "err cmd2: " & LCase(Err.Description)
    Resume Next
End Sub

Private Sub Form_Load()

End Sub

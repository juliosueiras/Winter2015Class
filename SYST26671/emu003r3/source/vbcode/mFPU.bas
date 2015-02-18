Attribute VB_Name = "mFPU"
' emulator FPU

Option Explicit


' a crash protection
Global bFPU_INIT_DONE As Boolean



' TEST FUNCTION
Public Declare Function MicroAsm_T Lib "MICROASM.DLL" (ByRef par1 As Long, ByRef par2 As Long) As Long

Public Declare Function MicroAsm_FINIT Lib "MICROASM.DLL" (ByRef fpuSTATE As fpu87_STATE) As Long


' ALL FPU TABLED FUNCTIONS
Public Declare Function MicroAsm_D8_TAB Lib "MICROASM.DLL" (ByRef lEA_TAB As Long, ByRef mem4r As fpuREGISTER_4byte, ByRef fpuSTATE As fpu87_STATE) As Long
Public Declare Function MicroAsm_D9_TAB Lib "MICROASM.DLL" (ByRef lEA_TAB As Long, ByRef mem4r As fpuREGISTER_4byte, ByRef mem14 As fpuREGISTER_14byte, mem2i As fpuREGISTER_2byte, ByRef fpuSTATE As fpu87_STATE) As Long
Public Declare Function MicroAsm_DA_TAB Lib "MICROASM.DLL" (ByRef lEA_TAB As Long, ByRef mem4i As fpuREGISTER_4byte, ByRef fpuSTATE As fpu87_STATE) As Long
Public Declare Function MicroAsm_DB_TAB Lib "MICROASM.DLL" (ByRef lEA_TAB As Long, ByRef mem4i As fpuREGISTER_4byte, ByRef mem10r As fpuREGISTER_10byte, ByRef fpuSTATE As fpu87_STATE) As Long
Public Declare Function MicroAsm_DC_TAB Lib "MICROASM.DLL" (ByRef lEA_TAB As Long, ByRef mem8r As fpuREGISTER_8byte, ByRef fpuSTATE As fpu87_STATE) As Long
Public Declare Function MicroAsm_DD_TAB Lib "MICROASM.DLL" (ByRef lEA_TAB As Long, ByRef mem8r As fpuREGISTER_8byte, ByRef mem94 As fpu87_STATE, ByRef mem2i As fpuREGISTER_2byte, ByRef fpuSTATE As fpu87_STATE) As Long
Public Declare Function MicroAsm_DE_TAB Lib "MICROASM.DLL" (ByRef lEA_TAB As Long, ByRef mem2i As fpuREGISTER_2byte, ByRef fpuSTATE As fpu87_STATE) As Long
Public Declare Function MicroAsm_DF_TAB Lib "MICROASM.DLL" (ByRef lEA_TAB As Long, ByRef mem2i As fpuREGISTER_2byte, ByRef mem8i As fpuREGISTER_8byte, ByRef mem10d As fpuREGISTER_10byte, ByRef fpuSTATE As fpu87_STATE) As Long



Public Type fpuREGISTER_2byte
    fpuBYTE(0 To 1) As Byte
End Type

Public Type fpuREGISTER_4byte
    fpuBYTE(0 To 3) As Byte
End Type

Public Type fpuREGISTER_8byte
    fpuBYTE(0 To 7) As Byte
End Type

Public Type fpuREGISTER_10byte
    fpuBYTE(0 To 9) As Byte
End Type

Public Type fpuREGISTER_14byte
    fpuBYTE(0 To 13) As Byte
End Type



' 94 bytes
' 14 bytes -> control register
' 10 bytes *  8 registers
Public Type fpu87_STATE
     fpuControl(0 To 13) As Byte
     fpuReg(0 To 7) As fpuREGISTER_10byte
End Type




Global fpuGLOBAL_STATE As fpu87_STATE





' #400b15-wait#
' 9B          WAIT           Wait until BUSY pin is inactive (HIGH)
Sub fpu_fWAIT(ByRef curByte As Long)
On Error GoTo err1

' no need, already points to last processed
'' curByte = curByte + 1   ' point to last processed byte.


' todo?
' currently ignored...


        
        
        ' 4.00b20  had to put it here because it crashed ready .exe for some reason....
        ' this way it won't be initialized unntil FPU is really used.
        ' the same code is put to do_instruction_D8_DF()
        If Not bFPU_INIT_DONE Then
            frmEmulation.INIT_FPU_PUB
            bFPU_INIT_DONE = True
        End If







Exit Sub
err1:
    Debug.Print "fpu_fWAIT: " & err.Description
End Sub

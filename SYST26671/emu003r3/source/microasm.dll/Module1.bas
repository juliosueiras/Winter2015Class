Attribute VB_Name = "Module1"
' mem4r    is a 4-byte quantity
'  etc...

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




' TEST FUNCTION
Public Declare Function MicroAsm_T Lib "MICROASM.DLL" (ByRef par1 As Long, ByRef par2 As Long) As Long


Public Declare Function MicroAsm_FINIT Lib "MICROASM.DLL" (ByRef fpuSTATE As fpu87_STATE) As Long




Sub Main()

    ' this should help finding the DLL
    myChDir (App.Path)
   
 
    If Not FileExists(Add_BackSlash(App.Path) & "MicroAsm.dll") Then
        MsgBox "file not found: MicroAsm.dll"
        End
    End If
    
    Form1.Show
    
    
End Sub



Function FileExists(ByVal sFilename As String) As Boolean

    Dim i As Integer
    
    On Error GoTo NotFound
    
    i = GetAttr(sFilename)
        
    FileExists = True
    
    Exit Function
    
NotFound:

    FileExists = False
    
End Function


Public Function myChDir(sPath As String) As Boolean
On Error GoTo err1
    
    If sPath = "" Then
        myChDir = False
        Exit Function
    End If
    
    If (Mid(sPath, 2, 1) = ":") Then
        ChDrive (Mid(sPath, 1, 1)) 'ChDir won't work if curent path is another drive.
    End If
    
    ChDir (sPath)
    
    myChDir = True
    
Exit Function
err1:
Debug.Print "error (expected?) on myChDir(" & sPath & "): " & LCase(Err.Description)
myChDir = False
Resume Next
End Function


Function Add_BackSlash(sPath As String) As String
    If (sPath <> "") Then
        If (Mid(sPath, Len(sPath), 1) <> "\") Then
          Add_BackSlash = sPath & "\"
          Exit Function
        End If
    End If
    Add_BackSlash = sPath
End Function


Function byteHex(b As Byte) As String
    byteHex = Hex(b)
    If Len(byteHex) = 1 Then
        byteHex = "0" & byteHex
    End If
End Function

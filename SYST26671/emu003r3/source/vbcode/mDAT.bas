Attribute VB_Name = "mDAT"

' 

' 

'



' 1.23
' this module will keep the data
' from the lists on frmDat form
' in array form:

Option Explicit

Global Const compDAT_OPCODE_MAX = 284

' previously known as "lst_Opcodes1":
Global compDAT_OPCODES_1(0 To compDAT_OPCODE_MAX)  As String


' previously known as "lst_Opcodes2":
Global compDAT_OPCODES_2(0 To compDAT_OPCODE_MAX)  As String

' previously known as "lst_Opcodes3":
Global compDAT_OPCODES_3(0 To compDAT_OPCODE_MAX)  As String


' previously known as "lst_OpcPLUS":
Global compDAT_OpcPLUS(0 To compDAT_OPCODE_MAX)  As Boolean


' previously known as "lst_opNames":
Global compDAT_OP_NAMES(0 To compDAT_OPCODE_MAX) As String





Sub reset_all_compDAT_TABLES()
    Dim i As Integer
    
    For i = 0 To compDAT_OPCODE_MAX
        compDAT_OPCODES_1(i) = ""
        compDAT_OPCODES_2(i) = ""
        compDAT_OPCODES_3(i) = ""
        compDAT_OpcPLUS(i) = False
        
        compDAT_OP_NAMES(i) = ""
    Next i
    
End Sub

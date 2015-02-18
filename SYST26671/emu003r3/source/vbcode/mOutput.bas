Attribute VB_Name = "mOutput"

' 

' 

'



' 1.23#241
' this module replaced old frmMain.lst_Out

Option Base 0

' array to keep bytes before
' the're written to file:
Global arrOUT() As Byte

' actual size of arrOUT:
Dim lArraySize As Long

' number of elements added to arrOut:
Global lElements_in_arrOUT As Long

' just in case:
Sub intilialize_arrOUT()
    lArraySize = 1023 ' preset to 1KB on creation, to speed up later.
    ReDim arrOUT(0 To lArraySize)
End Sub

Sub clear_arrOUT()
    lElements_in_arrOUT = 0
    ' no actual clearing of memory!
End Sub

Sub add_to_arrOUT(u As Byte)

' to save timer, each time the array size is not
' enough, we will re-create with 512 new cells added:
If lArraySize <= lElements_in_arrOUT Then
    lArraySize = lArraySize + 512
    ReDim Preserve arrOUT(0 To lArraySize)
    ' actually this creates "lArraySize+1" elements,
    ' but it works first time when there are 0 elements,
    ' for speed I will leave it as it is.
End If

arrOUT(lElements_in_arrOUT) = u

lElements_in_arrOUT = lElements_in_arrOUT + 1

End Sub

Attribute VB_Name = "mSegment_Names_Table"

' 

' 

'



' 1.23
' Segment Names Table
' it replaces lst_Segment_Names
' 1.23#223

Option Explicit

Option Base 0 ' arrays start at index 0! (seems to be default, but anyway).


Global arrSegment_Names() As String
Global arrSegment_Names_SIZE As Long


Sub CLEAR_arrSegment_Names()
    Erase arrSegment_Names
    arrSegment_Names_SIZE = 0
End Sub


Sub add_arrSegment_Names(sName As String)
  
    ReDim Preserve arrSegment_Names(arrSegment_Names_SIZE + 1)
        
    arrSegment_Names(arrSegment_Names_SIZE) = sName 'UCase(sNAME)
    
    arrSegment_Names_SIZE = arrSegment_Names_SIZE + 1
    
End Sub

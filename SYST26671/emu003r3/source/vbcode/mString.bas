Attribute VB_Name = "mString"

' 

' 

'



Option Explicit

' removes quotes " and ' from both sides
' assumed that input is trimmed:
Function removeQuotes(sInput As String) As String

Dim sResult As String

If startsWith(sInput, """") Or startsWith(sInput, "'") Then
    sResult = Mid(sInput, 2)
Else
    sResult = sInput
End If

If endsWith(sResult, """") Or endsWith(sResult, "'") Then
    sResult = Mid(sResult, 1, Len(sResult) - 1)
End If

removeQuotes = sResult

End Function

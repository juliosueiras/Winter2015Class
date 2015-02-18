Attribute VB_Name = "Module3"
Option Explicit

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, ByVal lpvSource As String, ByVal cbCopy As Long)


Public Function BytesToStr(ab() As Byte) As String
On Error Resume Next ' #400b3-impr1#
    BytesToStr = StrConv(ab, vbUnicode)
End Function

Public Sub StrToBytes(ab() As Byte, s As String)

On Error Resume Next ' #400b3-impr1#

If GetCount(ab) < 0 Then
    ab = StrConv(s, vbFromUnicode)
Else
    Dim cab As Long
    cab = UBound(ab) - LBound(ab) + 1
    If Len(s) < cab Then s = s & String$(cab - Len(s), 0)
    CopyMem ab(LBound(ab)), s, cab
End If

End Sub

Private Function GetCount(arr) As Integer
On Error Resume Next
Dim nCount As Integer
nCount = UBound(arr)
If Err Then
    Err.Clear
    GetCount = -1
Else
    GetCount = nCount
End If

End Function

'290100. I noticed that API returns strings with Chr(0) as the end of string, VB doesn't recognize it.
' all functions that return FileNames should do RTrim
Public Function RTrimZero(ByVal s As String) As String
    
On Error Resume Next ' 4.00-bETA-3

    Dim i As Long
    
    i = InStr(1, s, Chr(0), vbBinaryCompare)
    
    If i >= 1 Then
        s = Mid(s, 1, i - 1)
    End If
    
    RTrimZero = s
    
End Function






Attribute VB_Name = "getWindowsPath"
' 2007-07-28

Public Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Public Function GetWindowsPath111() As String
    Dim lngCharacters As Long
    Dim strBuffer As String
    strBuffer = String$(255, 0)
    lngCharacters = GetWindowsDirectory(strBuffer, Len(strBuffer))
    GetWindowsPath111 = strBuffer
    ' 2007-06-28
    GetWindowsPath111 = Left$(GetWindowsPath111, lngCharacters)
End Function


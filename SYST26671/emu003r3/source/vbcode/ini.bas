Attribute VB_Name = "inimodule"

' this module gets properties from a file
' currently is used by fix #1079b only to get the emu8086.io file location

Option Explicit

Function get_property(ByVal sFileName As String, sKey As String, sDefault As String) As String

On Error GoTo err1

    Dim iNum As Integer
    Dim s As String
    
    
    ' 3.27p
    If InStr(1, sFileName, ":") > 0 Then
        ' ok, this is a full path
    Else
        ' add app path to it:
        sFileName = Add_BackSlash(App.Path) & sFileName
    End If
    
    
    
    
    
    If FileExists(sFileName) Then
    
        iNum = FreeFile
        Open sFileName For Input As iNum
        
        Do While Not EOF(iNum)
        
            Line Input #iNum, s
                        
            s = Replace(s, vbTab, " ")
            s = Trim(s)
            
            ' #400b10-no-screen-popup#
            Dim sBefore_EQU As String
            Dim LL As Long
            LL = InStr(1, s, "=")
            If LL > 0 Then
                sBefore_EQU = Trim(Mid(s, 1, LL - 1))
            Else
                sBefore_EQU = ""
            End If
            
            
            ' #400b10-no-screen-popup# ' If StrComp(Left(s, Len(sKey)), sKey) = 0 Then
            If StrComp(sBefore_EQU, sKey) = 0 Then
                s = Trim(Mid(s, LL + 1))
                
                ' #327xq-ini#
                Dim L As Long
                L = InStr(1, s, ";")
                If L > 0 Then s = myTrim_RepTab(Mid(s, 1, L - 1))
                
                get_property = s
                Close iNum ' need to close before exit!
                Exit Function
            End If
            
        Loop
        
        Close iNum
    
    End If
     
    ' should not normally get here, unless there is no such key
    get_property = sDefault
    


Exit Function

err1:
    get_property = sDefault
    Debug.Print "Err: get_property: " & LCase(err.Description)
End Function

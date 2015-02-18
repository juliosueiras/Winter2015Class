Attribute VB_Name = "StringTokenizer"

' 

' 

'



Option Explicit

' here I will try to partially simulate Java
' StringTokenizer class, without classes of cource :)

' WARNING! using functions in this module simultaneously
'          may (and will) cause problems!!!!
' (later this could be conveted to VB class - just
' don't know how right now...)

' everything is optimized to make nextToken() work faster.
'
'
' Differences between getToken_str() and this nextToken()
'===================================
' getToken_str(",,,hello world", 0, " ,")
'    returns ""
' nextToken() - when called first time
' (initialized: StringTokenizer ",,,hello world", " ,")
'    returns "hello"
'===================================
' When last token passed:
' getToken_str() returns Chr(10)
' nextToken() returns "" (empty string)
'===================================

Dim SourceString As String
Dim stopper_chars As String ' delimeters.

Dim iLen As Long ' source string len.
Dim j As Long    ' char counter.

'Public Sub test1()
'
'    StringTokenizer_constructor """hello 'my world' how are you?""", " ,"
'
'    Dim s As String
'
'    Do While True
'        s = nextToken
'        If s = "" Then Exit Do
'        Debug.Print s
'    Loop
'
'End Sub

' CONSTRUCTOR:
' public StringTokenizer(String str,
'                        String delim)
Public Sub StringTokenizer_constructor(ByRef s As String, ByRef delim As String)

    SourceString = s
    iLen = Len(SourceString)

    stopper_chars = delim


    j = 1   ' strings start with 1 in VB.
    
    ' skip starting delimeters (if any):
    s = Mid(SourceString, j, 1)
    Do While ((s = Chr(13)) _
      Or (s = Chr(10)) _
      Or (InStr(1, stopper_chars, s, vbTextCompare) > 0))
      j = j + 1
      s = Mid(SourceString, j, 1)
      If s = "" Then Exit Do
    Loop

End Sub

' returns token in stopper_chars:
' returns full strings!!!! even if inside string is
' a topper_char !!!!!!!!   string can be in '' or "".

' this function is cloned from:
' Public Function getToken_str(ByRef SourceString As String, ByRef TokenIndex As Long, ByRef stopper_chars As String)

' when there are no more tokens returns empty string (NOT chr(10)!!!)

' public String nextToken()
' Returns the next token from this string tokenizer.
Public Function nextToken() As String

    Dim s As String     ' temporary var
    Dim sRes As String    ' result
    ' 1.22 bugfix#182 ' Dim sStringChar As String ' if token is a string it takes (') or (") value.
    Dim bSTOPPED As Boolean
    
    Dim lTemp As Long
    
    ' bugfix#182 sStringChar = ""
    sRes = ""
    
    bSTOPPED = False
    
    ' search token:
    Do While True
    
        If j > Len(SourceString) Then Exit Do  ' this should fix: bug#b1.
    
        s = Mid(SourceString, j, 1)
         
        
        ' bugfix#182 If (sStringChar = "") Then ' do not allow to return token if string isn't terminated yet.
        
            ' skip all delimiters (for next call):
            ' also enters the loop when s="" (last token):
            Do While ((s = Chr(13)) _
              Or (s = Chr(10)) _
              Or (InStr(1, stopper_chars, s, vbTextCompare) > 0))
              
                bSTOPPED = True
                j = j + 1
                s = Mid(SourceString, j, 1)
                If s = "" Then Exit Do
            Loop
            
            If bSTOPPED Then Exit Do

        'bugfix#182 End If
        
        sRes = sRes & s
                       
        '+++++++++++++++++++++++++++++++++++++++++++
'''        ' check string start/termination
'''        If (sStringChar = s) Then
'''            sStringChar = ""  ' string terminated.
'''        ElseIf s = "'" Or s = """" Then
'''            sStringChar = s   ' string started.
'''        End If
'''        '+++++++++++++++++++++++++++++++++++++++++++

        j = j + 1

        ' bugfix#182 get whole string in "" or '':
        If s = "'" Or s = """" Then
           lTemp = InStr(j, SourceString, s)
           If lTemp > 0 Then
                sRes = sRes & Mid(SourceString, j, lTemp - j + 1)
                j = lTemp
                j = j + 1
           Else
                Debug.Print "Unterminated string in nextToken: " & SourceString
                frmInfo.addErr currentLINE, cMT("unterminated string:") & " " & SourceString, SourceString
                Exit Do
           End If
        End If

    Loop
       
    nextToken = sRes
    
End Function




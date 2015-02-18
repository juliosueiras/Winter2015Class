Attribute VB_Name = "Module2"

' 

' 

'



Option Explicit

Global arrTOKENS() As String
'Dim sLAST_STR_used_for_getNewToken As String
'Dim sLAST_STOPPER_used_for_getNewToken As String

'r1:
' unlike standard VAL() function,
' HexToLong() never returns negative values!
' input: from "0" to "7FFFFFFF"
 Function HexToLong(s As String) As Long
    Dim i As Long
    Dim sum As Long
    Dim powerM As Long
    Dim curC As Long
    
    sum = 0
    powerM = 0
    
    For i = Len(s) To 1 Step -1
      ' translating every hex digit independently:
      curC = Val("&H" & Mid(s, i, 1))
      sum = sum + curC * (16 ^ powerM)
      powerM = powerM + 1
    Next i
    
    HexToLong = sum
End Function

' returns the number of lines in sTXT (number of Chr(13)),
' generally this function shouldn't be used (use the
' return value of getLine() function to stop, it's faster
' when reading line after line)
 Function get_Line_Count(ByRef sTXT As String) As Long
    Dim L As Long
    Dim Size As Long
    Dim lineCounter As Integer
    
    Size = Len(sTXT)
    L = 1
    
    Do While (L <= Size)

        If (Mid(sTXT, L, 1) = Chr(13)) Then
                lineCounter = lineCounter + 1
        End If
        
        L = L + 1
    Loop
        
    get_Line_Count = lineCounter
End Function

' (this function is too slow to use, so it's not used)
' returns line with lineNum (0..xxx) index, from sTXT.
' when lineNum is bigger then actual number of lines in sTXT, returns Chr(10):
 Function getLine(ByRef lineNum As Long, ByRef sTXT As String) As String
    Dim L As Long
    Dim Size As Long
    Dim result As String
    Dim lineCounter As Integer
    Dim t As String
    
    Size = Len(sTXT)
    L = 1
    lineCounter = 0
    result = ""
    
    Do While True
        t = Mid(sTXT, L, 1)
        
        ' chr(12) - page break!
        If (t = Chr(13)) Or (L > Size) Or (t = Chr(12)) Then
            If lineNum = lineCounter Then
                getLine = result
                Exit Function
            ElseIf L > Size Then
                ' gets here when lineNum is bigger then actual number of lines in sTXT:
                getLine = Chr(10)
                Exit Function
            Else
                lineCounter = lineCounter + 1
                result = ""
            End If
        End If
        
        ' chr(12) - page break!
        If (t <> Chr(13)) And (t <> Chr(10)) And (t <> Chr(12)) Then
            result = result & t
        End If
        
        L = L + 1
    Loop
    
' never gets here.

End Function


' v 1.23
' it is recommended to use getNewToken() instead
' when Len(stopper_chars)=1 !!!

' returns token in stopper_chars:

' 4.00-Beta-3  I discovered that this function returns Chr(10) for empty token!!!! (where is no token !!!)

Function getToken(ByRef SourceString As String, ByRef TokenIndex As Long, ByRef stopper_chars As String)
    Dim iLen As Long ' source string len
    Dim i As Long    ' token counter
    Dim j As Long    ' char counter
    Dim s As String     ' temporary var
    Dim sRes As String    ' result
    Dim bGotSomething As Boolean

    iLen = Len(SourceString)

    i = 0
    j = 1   ' strings start with 1 in VB.
    sRes = ""
    bGotSomething = False

    ' skip starting spaces:
    Do While Mid(SourceString, j, 1) = " "
        j = j + 1
    Loop

    ' search tokens:
    Do While True

        s = Mid(SourceString, j, 1)
        If s = Chr(13) Or s = Chr(10) Or InStr(1, stopper_chars, s, vbTextCompare) > 0 Then
            If i = TokenIndex Then
                Exit Do
            End If

            bGotSomething = True

            sRes = ""   ' reset for next token
        Else
            sRes = sRes & s

            ' next token
            If bGotSomething Then
                i = i + 1
                bGotSomething = False
            End If

            If j = iLen And i = TokenIndex Then
                Exit Do
            End If
        End If

        j = j + 1

        If j > iLen Then    ' last token passed.
            sRes = Chr(10) '""
            Exit Do
        End If

    Loop

    getToken = sRes

End Function

' 1.23 #215 UPDATE!
' Chr(13) and Chr(10) are no longer default delimeters!
' replace all delimeters with a single delimeter (Chr(10)) and
'               use getNewToken() instead of previous version of
'               this function!

' this version is alow slower then original!
''''Function getToken(ByRef SourceString As String, ByRef TokenIndex As Long, ByRef stopper_chars As String)
''''
''''    Dim i As Long
''''    Dim lSize As Long
''''    Dim sNewS As String
''''    Dim sC As String
''''
''''    lSize = Len(SourceString)
''''
''''    sNewS = ""
''''
''''    For i = 1 To lSize
''''        sC = Mid(SourceString, i, 1)
''''        If InStr(1, stopper_chars, sC) > 0 Then
''''            sNewS = sNewS & Chr(10) ' replace delimeter with Chr(10).
''''        Else
''''            sNewS = sNewS & sC
''''        End If
''''    Next i
''''
''''    getToken = getNewToken(sNewS, TokenIndex, Chr(10))
''''
''''End Function

' this version is much slower of the original!!!
'''''Function getToken(ByRef SourceString As String, ByRef TokenIndex As Long, ByRef stopper_chars As String)
'''''
'''''    Dim i As Long
'''''    Dim lSize As Long
'''''    Dim sNewS As String
'''''    Dim sC As String
'''''
'''''    lSize = Len(stopper_chars)
'''''
'''''    sNewS = SourceString
'''''
'''''    For i = 1 To lSize
'''''        sC = Mid(stopper_chars, i, 1)
'''''        sNewS = Replace(sNewS, sC, Chr(10))
'''''    Next i
'''''
'''''    getToken = getNewToken(sNewS, TokenIndex, Chr(10))
'''''
'''''End Function

' 1.23 #215
' returns token in stopper_chars:
' returns Chr(10) when no such token!
' skips starting spaces!
' Unlike original getToken() this one works with stopper
' expression, or only with 1 stopper char!!!
' for getnewtoken("first,,,,second",1, ",") retuns "second".
Function getNewToken(ByRef SourceString As String, ByRef TokenIndex As Long, ByRef stopper_expression As String, Optional bUSE_PREVIOUS_DATA As Boolean = False)

'If Len(stopper_expression) > 1 Then
'    Debug.Print "getNewToken>" & stopper_expression & "<"
'ElseIf Len(stopper_expression) < 1 Then
'    Debug.Print "getNewToken: empty stopper expr."
'End If

'''    ' try to save time if the same string is sent
'''    ' twice to that function:
'''    If StrComp(sLAST_STOPPER_used_for_getNewToken, stopper_expression, vbBinaryCompare) = 0 Then
'''        If StrComp(sLAST_STR_used_for_getNewToken, SourceString, vbBinaryCompare) = 0 Then
'''            GoTo tokens_ready
'''        End If
'''    End If
'''
'''    ' keep latest data used to get arrTOKENS:
'''    sLAST_STR_used_for_getNewToken = SourceString
'''    sLAST_STOPPER_used_for_getNewToken = stopper_expression
    
    If bUSE_PREVIOUS_DATA Then GoTo tokens_ready
    
    
    ' just in case to free the array from old data:
    Erase arrTOKENS
    
    
    Dim sTEMP As String
    Dim sTwiced As String
    
    sTEMP = LTrim(SourceString)
    
    ' because for this token:
    ' "JGE          compared" , stopper_expr=" "
    ' the second token is though to be "", I need to remove
    ' stopper expressions that go one after another (to make
    ' it work for me):
    sTwiced = stopper_expression & stopper_expression
    Do While InStr(1, sTEMP, sTwiced, vbTextCompare) > 0
        sTEMP = Replace(sTEMP, sTwiced, stopper_expression, 1, -1, vbTextCompare)
    Loop
 
    arrTOKENS = Split(sTEMP, stopper_expression, -1, vbTextCompare)
        
tokens_ready:
    

    
    If (TokenIndex > UBound(arrTOKENS)) _
       Or (TokenIndex < LBound(arrTOKENS)) Then  ' no such token.
        getNewToken = Chr(10)
    Else
        getNewToken = arrTOKENS(TokenIndex)
    End If
    

End Function

' returns token in stopper_chars:
' returns full strings!!!! even if inside string is
' a topper_char !!!!!!!!   string can be in '' or "".
 Function getToken_str(ByRef SourceString As String, ByRef TokenIndex As Long, ByRef stopper_chars As String)
    Dim iLen As Long ' source string len
    Dim i As Long    ' token counter
    Dim j As Long    ' char counter
    Dim s As String     ' temporary var
    Dim sRes As String    ' result
    Dim bGotSomething As Boolean
    
    Dim sStringChar As String ' if token is a string it takes (') or (") value.
    
    
    
    iLen = Len(SourceString)
    
    
    If iLen > 200 Then ' #1069b
        bDO_EVENTS = True
        ' #327xo-must-not hang on precompile# '  frmInfo.show_precompile_animation
    Else
        bDO_EVENTS = False
    End If
    
    
    
    i = 0
    j = 1   ' strings start with 1 in VB.
    sRes = ""
    bGotSomething = False
    
    ' skip starting spaces:
    Do While Mid(SourceString, j, 1) = " "
        j = j + 1
    Loop
    
    ' search tokens:
    Do While True
    
        s = Mid(SourceString, j, 1)
        
        If ((s = Chr(13) Or s = Chr(10) Or _
            InStr(1, stopper_chars, s, vbTextCompare) > 0) And _
            (sStringChar = "")) Then ' do not allow to return token if string isn't terminated yet.
            
            If i = TokenIndex Then
                Exit Do
            End If
            
            bGotSomething = True

            sRes = ""   ' reset for next token
        Else
            sRes = sRes & s
            
            ' next token
            If bGotSomething Then
                i = i + 1
                bGotSomething = False
            End If
            
            If j = iLen And i = TokenIndex Then
                Exit Do
            End If
        End If
                       
        '+++++++++++++++++++++++++++++++++++++++++++
        ' check string start/termination
        If (sStringChar = s) Then
            sStringChar = ""  ' string terminated.
        ElseIf s = "'" Or s = """" Then
            sStringChar = s   ' string started.
        End If
        '+++++++++++++++++++++++++++++++++++++++++++
                       
        j = j + 1
        
        If j > iLen Then    ' last token passed.
            sRes = Chr(10) '""
            Exit Do
        End If
        
        If bDO_EVENTS Then
            DoEvents ' #1069b
        End If
        
    Loop
       
    If bDO_EVENTS Then ' #1069b reset.
        bDO_EVENTS = False
       ' #327xo-must-not hang on precompile# '   frmInfo.stop_precompile_animation False
    End If
    
    getToken_str = sRes
       
    
End Function

' 1.23 Function startsWith(ByVal InputS As String, ByVal CompS As String) As Boolean
Function startsWith(ByRef InputS As String, ByRef CompS As String) As Boolean
Dim tmpS As String

' 1.23 update!
'''    ' ignore case:
'''    InputS = LCase(InputS)
'''    CompS = LCase(CompS)
        
    tmpS = Mid(InputS, 1, Len(CompS))
    
    ' 1.23 If tmpS = CompS Then
    If StrComp(tmpS, CompS, vbTextCompare) = 0 Then
        startsWith = True
    Else
        startsWith = False
    End If
    
End Function

Function endsWith(ByRef InputS As String, ByRef CompS As String) As Boolean
Dim tmpS As String
On Error GoTo err1:

    tmpS = Mid(InputS, Len(InputS) - Len(CompS) + 1)
    
    If StrComp(tmpS, CompS, vbTextCompare) = 0 Then
        endsWith = True
    Else
        endsWith = False
    End If
    
Exit Function
err1:
            endsWith = False
            
End Function


' 1.23#266
' this function will be faster to check if some single chars are
' around the expression:
' IS CASE SENSITIVE!
' example:
'   is_around("[42132]","[", "]")  ' returns TRUE!
Function is_around(ByRef InputS As String, ByRef CompStartChar As String, ByRef CompEndChar As String) As Boolean
On Error GoTo err_ia

' #400b7-two_vars=offset#   it can be simpler....
''''    Dim L As Long
''''
''''    L = Len(InputS)
''''
''''    If Mid(InputS, 1, 1) <> CompStartChar Then
''''        is_around = False
''''        Exit Function
''''    End If
''''
''''    If Mid(InputS, L, 1) <> CompEndChar Then
''''        is_around = False
''''        Exit Function
''''    End If

' #400b7-two_vars=offset#
    If Left(InputS, 1) <> CompStartChar Then
        is_around = False
        Exit Function
    End If
    If Right(InputS, 1) <> CompEndChar Then
        is_around = False
        Exit Function
    End If


    is_around = True
    
    Exit Function
err_ia:
    Debug.Print "is_around: " & LCase(err.Description)
End Function


' replaces TABs with spaces, and makes Trim():
 Function myTrim_RepTab(s As String) As String
 
 ' #1151c  optimizations... this is Visual Basic 6.0 :)
 ' this sub was written in VB 5 :)))
 
''''    Dim Size As Long
''''    Dim i As Long
''''    Dim ts As String
''''    Dim result As String
''''
''''    result = ""
''''    Size = Len(s)
''''
''''    ' replace "tab" with "space":
''''    For i = 1 To Size
''''        ts = Mid(s, i, 1)
''''        If ts = vbTab Then
''''            result = result & " "
''''        Else
''''            result = result & ts
''''        End If
''''    Next i
    
    myTrim_RepTab = Trim(Replace(s, vbTab, "    ")) ' 3.27xn   " " replaced with "    "

End Function

' does the same thing as VB function InStr(),
' just doesn't return a positive value when
' sFind is inside quotes or isn't a separate word.

' (first char of a string has index 1)
'
' word is a separate when it is surrounded by one
' of these chars:
'      [,.*/+-=( )%#!'":]
' 1.20 bugfix list is updated:
'      [,.*/+-=( )%#!'":[]]
'
' this function is case insensitive!
 Function SingleWord_NotInsideQuotes_InStr(ByRef sSource As String, ByVal sFind As String) As Long
    Dim i As Long
    Dim tChar As String
    Dim ts As String
    Dim iStart As Long
    Dim sQuoteStarted As String
    
    i = 1
    iStart = 1
    ts = ""
    
    sQuoteStarted = "" ' keeps (') or (").
    
    sFind = UCase(sFind)
    
    Do While True
        tChar = Mid(sSource, i, 1)
       
        If (sQuoteStarted = "") Then
            ' ",.*/+-=( )%#!'"":[]"
            If (InStr(1, DELIMETERS_ALL, tChar) > 0) Then
                If (UCase(ts) = sFind) Then
                    SingleWord_NotInsideQuotes_InStr = iStart
                    Exit Function
                End If
                ts = ""
                iStart = 0 ' reset
            Else
                If (ts = "") Then iStart = i
                ts = ts & tChar
            End If
        End If
        
        ' check quoted string:
        If (tChar = "'") Or (tChar = """") Then
            If (sQuoteStarted = "") Then
                sQuoteStarted = tChar
            ElseIf (sQuoteStarted = tChar) Then
                sQuoteStarted = ""  ' quoted string ended.
            End If
        End If
        
        ' got to end of string?
        If (tChar = "") Then
            If UCase(ts) = sFind Then
                SingleWord_NotInsideQuotes_InStr = iStart
            Else
                SingleWord_NotInsideQuotes_InStr = 0 ' not found!
            End If
            Exit Function   ' EXIT DO!
        End If
    
        i = i + 1
    Loop
    
    ' never gets here.
    
End Function

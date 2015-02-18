Attribute VB_Name = "mCompMacro"

' 

' 

'





Option Explicit

Const MAX_LINE_LEN_FOR_EQU = 1000 ' 500

' assumed source is a single line, without any TABs:
 Function replace_EQU(ByVal Source As String, iRecursionCount As Integer, lCurLine As Long) As String
    Dim iLine As Long
    Dim k As Long
    Dim m As Long
    Dim sName As String
    Dim sContents As String
    Dim sResult As String
    Dim ts As String
    
    iLine = 0
    
    Do While (iLine < frmMain.lst_EQU.ListCount)
    
        'ts = getLine(iLine, frmMain.txt_EQU.Text)
        ts = frmMain.lst_EQU.List(iLine)
        

        
' when loop ends it does it anyway.
'        If ts = Chr(10) Then
'            ' got to last line, nothing replaced.
'            replace_EQU = source
'            Exit Function
'        End If
        
' cant be with a list.
'        If ts = "" Then
'            ' generally there maybe an empty last line,
'            ' so return without processing.
'            replace_EQU = source
'            Exit Function
'        End If
        
        ' get constant name:
        k = InStr(1, ts, " ")
        If (k > 0) Then
            sName = Mid(ts, 1, k - 1)
        Else
            Debug.Print "wrong data in txt_EQU.Text!"
            replace_EQU = Source
            Exit Function
        End If
        
        ' is there a constant name in source?
        ' if not continue with next constant.
        'm = InStr(1, source, sName, vbTextCompare)
        m = SingleWord_NotInsideQuotes_InStr(Source, sName)
        
        ' loop until current constant is fully replaced
        Do While (m > 0)
        
            sContents = Mid(ts, k + 1)
            
            ' it should only replace
            ' anything outside strings!
            ' and separate words only!
            
            
            
            
            sResult = Mid(Source, 1, m - 1)
            
            
           ' #1085 sResult = sResult & sContents
           If iRecursionCount <= 100 Then
              sResult = sResult & replace_EQU(sContents, iRecursionCount + 1, lCurLine) ' #1085
           Else
                frmInfo.addErr lCurLine, cMT("recursion is over 100 for EQU definition."), ""
                replace_EQU = ""
                Exit Function
           End If
           
            sResult = sResult & Mid(Source, m + Len(sName))
        
        
        
        
        
            ' need to replace all other contants in source,
            ' so here's the trick:
            Source = sResult
                                    
            ' check recursive EQU replacing:
            If (Len(Source) > MAX_LINE_LEN_FOR_EQU) Then
                frmInfo.addErr lCurLine, cMT("the macro expansion exceeds the maximum line length for EQU"), ""
                replace_EQU = ""
                Exit Function
            End If
                        
            'm = InStr(1, source, sName, vbTextCompare)
            m = SingleWord_NotInsideQuotes_InStr(Source, sName)
        Loop
        

        iLine = iLine + 1
        
         ' to avoid hang ups... #327t-com-sp-bug#
        DoEvents
        If frmMain.bCOMPILING = False Then Exit Function
        
    Loop
    
    replace_EQU = Source
    
End Function

' replaces first DUP in string (call it several times to replace all DUPs).
' string should not contain any DW/DB, just data!
' examples:
'
'    "777, 4 dup(1,2,3),888"
'      replaced with:
'    "777,1,2,3,1,2,3,1,2,3,1,2,3,888"
'
'    "777, 2 dup(1,10 dup(0,5),3),888"
'      replaced with:
'    "777,1,10 dup(0,5),3,1,10 dup(0,5),3,888"
'
'    "777, 2 dup(1,')',3),888"
'      replaced with:
'    "777,1,')',3,1,')',3,888"
'
'    "2 dup(5), 3 dup(7)"
'      replaced with:
'    "5,5, 3 dup(7)"
'
' #1076 must check for " duplicated" or " dupindated" and not replace it!!!
' so it won't work a bit the same for strings!

 Function replace_DUP(ByRef Source As String, lCurLine As Long) As String
    
    ' THIS FUNCTION IS NO LONGER USED!  #327xp-optimize_DUP#
    ' HOWEVER IT IS USED IF EXTENDED_DUP=true  in emu8086.ini !!!
    
    Dim i As Long
    Dim dupI As Long
    Dim tChar As String
    Dim ts As String
    Dim dupSize As Integer
    Dim j As Long
    Dim tCh As String

    Dim iStartDUP As Long       ' index (starting from 1) from where DUP starts including the number.
    Dim iEndDUP As Long         ' index of last ")" of a DUP.
    Dim dupINFO As String
    
    Dim sResult As String
    
     Debug.Print "JJJ: " & Source
    
    i = 0
    dupSize = 0

    ' get " DUP" index:
    '#1076 dupI = InStr(1, Source, " DUP", vbTextCompare)
    dupI = InStr_BUT_NO_IN_QUOTES(Source, " DUP")
    
    ' get everything before DUP:
    tChar = ""
    ts = ""
    
    i = dupI
    Do While (i > 0)
        
        tChar = Mid(Source, i, 1)
        
        If tChar <> "," Then
            ts = tChar & ts
        Else
            Exit Do
        End If
        
        i = i - 1
    Loop
    
    iStartDUP = i + 1
    'Debug.Print "iStartDUP:", iStartDUP
    
    ' evaluate DUP size:
    dupSize = evalExpr(ts)
    

    If bWAS_ERROR_ON_LAST_EVAL_EXPR Or dupSize < 0 Then '#1069
       frmInfo.addErr lCurLine, "wrong dup size: " & " " & ts & " " & cMT("- must be 1..32767"), ts
    End If
    
    
    If dupSize > 200 Then ' #1069b
        bDO_EVENTS = True
    Else
        bDO_EVENTS = False
    End If
    

    
    
    'Debug.Print "dupSize:", dupSize
    
    ' get everyting inside "( )":
    i = dupI + Len("DUP")
    
    j = InStr(i, Source, "(", vbTextCompare)
    
    If Not (j > 0) Then
        frmInfo.addErr lCurLine, cMT("DUP syntax error!"), Source
        replace_DUP = ""
        Exit Function
    End If
    
    i = j + 1
    
    ts = ""
    
    Do While True
    
        tChar = Mid(Source, i, 1)
        
        If (tChar = "'") Or (tChar = "(") Or (tChar = """") Then
            
            If tChar = "(" Then
                tCh = ")"       ' search for closing bracket.
            Else
                tCh = tChar
            End If
            
            j = InStr(i + 1, Source, tCh)  ' skip string in '' "" ().
            
            If Not (j > 0) Then
                frmInfo.addErr lCurLine, cMT("unterminated string/dup:") & " " & Source, Source
                replace_DUP = ""
                Exit Function
            End If
            
            ts = ts & Mid(Source, i, j - i + 1)
            
            i = j
        Else
            
            If tChar = ")" Then Exit Do
        
            ts = ts & tChar
        
        End If
        
        If tChar = "" Then
            ' end of string!
            frmInfo.addErr lCurLine, cMT("unterminated DUP!"), Source
            replace_DUP = ""
            Exit Function
        End If
        
        i = i + 1
    Loop
    
    iEndDUP = i
    dupINFO = ts
    
    'Debug.Print "iStartDUP:", iStartDUP
    'Debug.Print "iEndDUP:", iEndDUP
    'Debug.Print "dupINFO:", dupINFO
    
    ' make DUPped string (to replace DUP):
    Dim sDUPPED As String
        
    sDUPPED = ""
    
    For i = 1 To dupSize
        
        sDUPPED = sDUPPED & dupINFO
        If i <> dupSize Then sDUPPED = sDUPPED & ","
        
        If bDO_EVENTS Then '#1069b
            DoEvents
            If frmMain.bCOMPILING = False Then Exit Function
        End If
        
    Next i
    
    'Debug.Print "sDUPPED:", sDUPPED
    
    ' replace DUP operand with real data:
    sResult = Mid(Source, 1, iStartDUP - 1)
    sResult = sResult & sDUPPED
    sResult = sResult & Mid(Source, iEndDUP + 1)
    
    
    

    
    
    
    
    replace_DUP = sResult
    
End Function



' removes comment (;) from the command string,
' ignores (;) when it's inside the string, for example:
'    mov ax, ';'
 Function remove_Comment(ByVal s As String) As String
    Dim sResult As String
    Dim i As Long
    Dim Size As Long
    Dim stringStarted_CHAR As String
    Dim ts As String
    
    sResult = ""
    
    Size = Len(s)
    
    stringStarted_CHAR = ""
    
    For i = 1 To Size
    
        ts = Mid(s, i, 1)
    
        If (ts = "'") Or (ts = """") Then
            If stringStarted_CHAR = "" Then
                stringStarted_CHAR = ts ' string started.
            Else
                If ts = stringStarted_CHAR Then
                    stringStarted_CHAR = "" ' string terminated.
                End If
            End If
        End If

        ' if there is a ";" and it's not inside the string,
        ' then return:
        If (stringStarted_CHAR = "") And (ts = ";") Then
            remove_Comment = sResult
            Exit Function
        End If

        sResult = sResult & ts
    
    Next i
    
    remove_Comment = sResult
    
End Function





' 2005-05-19
' it appeared that I just created a bug, just because using the
' word "label" in comments became problematic: 2005-05-19_jle_doesnt_compile.asm

' argh!!! need to fix 1028b too
' label word can be found in string!

' TODO#1007b - 2005-03-04  making it work with "LABEL" directive :)
' replaces:
'  L11 LABEL WHATEVER (usually BYTE or WORD).
' with
'  L11:
 Function replace_LABEL_WHATEVER(ByVal s As String) As String
    
    On Error GoTo err_replace_LABEL_WHATEVER
    
    If InStr(1, s, " LABEL ", vbTextCompare) > 0 Then
    
        Dim sResult As String
        Dim lKK1 As Long
        
        
        
        sResult = Trim(s)
        lKK1 = InStr(1, sResult, " ", vbTextCompare) ' find first space.
        
        ' reset lKK1 if it's string:
        If InStr(1, sResult, """", vbTextCompare) > 0 Then lKK1 = 0
        If InStr(1, sResult, "'", vbTextCompare) > 0 Then lKK1 = 0
        
        If lKK1 > 1 Then ' must be something before " LABEL"
        
            lKK1 = lKK1 - 1
            sResult = Mid(sResult, 1, lKK1) ' take only label name.
            replace_LABEL_WHATEVER = sResult & ":"  ' make it look like a normal label.
            
        Else
        
            replace_LABEL_WHATEVER = s ' no change.
            Debug.Print "doesn't look like LABEL directive"
            
        End If
        
    Else
        replace_LABEL_WHATEVER = s ' no change.
    End If
    
    Exit Function
    
err_replace_LABEL_WHATEVER:
    
    Debug.Print "err_replace_LABEL_WHATEVER: " & s & " " & LCase(err.Description)
    replace_LABEL_WHATEVER = s ' no change.
    
End Function

' 1035b
' replaces "=" that are not in strings with " equ "
Public Function replace_EQUAL_with_EQU(s As String) As String

On Error GoTo err1
    Dim lT1 As Long
    Dim lT2 As Long
    Dim lt3 As Long
    
    
    ' fix:
    If startsWith(s, "#") Then
        replace_EQUAL_with_EQU = s ' no change!
        Exit Function
    End If
    
    
    
    lT1 = InStr(1, s, "=", vbBinaryCompare)
    
    If lT1 > 0 Then
    
        lT2 = InStr(1, s, "'", vbBinaryCompare)
        lt3 = InStr(1, s, """", vbBinaryCompare)
        
        If lT2 > 0 Or lt3 > 0 Then
            ' "=" can be inside a string!
        
            If (lT2 > 0 And lT2 < lT1) Or (lt3 > 0 And lt3 < lT1) Then
                
                ' "=" is inside the string, or so it seems, do not replace!
                replace_EQUAL_with_EQU = s ' no change!
                Exit Function
                
            Else ' "=" is outside the string!
                replace_EQUAL_with_EQU = Replace(s, "=", " equ ")
                Exit Function
            End If
        
        Else  ' no strings there, replace!
            replace_EQUAL_with_EQU = Replace(s, "=", " equ ")
            Exit Function
        End If
        
           
        
    Else
       replace_EQUAL_with_EQU = s ' no change!
       Exit Function
    End If
    
    
    ' cannot get here, if only by error!
err1:
    Debug.Print "ERROR on replace_EQUAL_with_EQU(" & s & ") - " & LCase(err.Description)
    replace_EQUAL_with_EQU = s ' no change!
    
End Function

' #1076
' same as vb function InStr but ignores values that are in quotes!
' as a temporary solution I will just not return the index if string starts with [']
' or " before " dup" (if sFind=" dup") !
Public Function InStr_BUT_NO_IN_QUOTES(sSource As String, sFind As String) As Long
    
    Dim l1 As Long
    Dim l2 As Long
    
    Dim l3 As Long
       
    
    ' ['] char can be inside " " , such as "cat's nose"
    

    l1 = InStr(1, sSource, """", vbTextCompare)
    l2 = InStr(1, sSource, "'", vbTextCompare)

    l3 = InStr(1, sSource, sFind, vbTextCompare)
    
        
    
    If l1 > 0 And l1 < l3 Then ' allow " only after sFind
        InStr_BUT_NO_IN_QUOTES = 0
        Exit Function
    End If
    
    
    If l2 > 0 And l2 < l3 Then ' allow ['] only after sFind
        InStr_BUT_NO_IN_QUOTES = 0
        Exit Function
    End If
    
    
    InStr_BUT_NO_IN_QUOTES = l3
    
End Function

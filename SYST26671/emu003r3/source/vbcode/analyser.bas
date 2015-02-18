Attribute VB_Name = "mAnalyser"

' 

' 

'





'''''''' for analyser '''''''''''
' 1.20

Option Explicit

Global Const DELIMETERS_EVAL = "{}[]+-*/()^~%<>&|"
Global Const DELIMETERS_ALL = DELIMETERS_EVAL & " ,.=#!'"":" & vbTab

Declare Function analyse Lib "diasm.dll" (ByRef exprBuf As Byte) As Long

' DOES NOT WORK!!! Declare Function s_Last_analyse_ERROR Lib "diasm.dll" () As String

Declare Function yur_init_analyser Lib "diasm.dll" () As Long

Dim exprBuf(0 To 99) As Byte

 Function analysis(sExpr As String) As Long
 
 On Error GoTo err1
 
    Dim s As String
    
    s = add_brackets_around_negative_numbers(sExpr)

    ' no need to call DLL if it's an empty string:
    If convertStringTo_byte_array(s) > 0 Then
        'Debug.Print "ok"
        analysis = analyse(exprBuf(0))
    Else
        'Debug.Print "zero"
        analysis = 0
    End If


    Exit Function
err1:
    Debug.Print "ANALYSIS ERROR: " & err.Description
'    If s_Last_analyse_ERROR <> "" Then
'        Debug.Print "Last analysis error: " & s_Last_analyse_ERROR
'    End If
    'print_exprBuf
End Function

' returns the number of bytes:
Private Function convertStringTo_byte_array(ByRef sExpr As String) As Long
    Dim i As Long
    Dim lExprSize As Long
    Dim c As Byte
    Dim s As String
    
    i = 0
    
    lExprSize = Len(sExpr)
    
    Do While i < lExprSize
    
        s = Mid(sExpr, i + 1, 1) ' VB string index starts with 1.
    
        c = myAsc(s)
    
        exprBuf(i) = c
        
        i = i + 1
    Loop
    
    exprBuf(i) = 0 ' always terminate with a zero.
    
    convertStringTo_byte_array = i
    
End Function

Private Sub print_exprBuf()
    Dim i As Integer
    
    For i = 0 To UBound(exprBuf)
        Debug.Print Hex(exprBuf(i)) & ",";
        If exprBuf(i) = 0 Then Exit For
    Next i
End Sub

''''' #145b
''''' to fix bug with "Calc.c" unary "-":
'''''             -1*16+(-1)   =  -17
'''''             -1*16+1      =  -15
''''Function add_brackets_around_all_numbers_NOT_GOOD(sExpr As String) As String
''''    Dim sResult As String
''''    Dim s As String
''''    Dim lSize As Long
''''    Dim i As Long
''''
''''    Debug.Print "BRACKET: " & sExpr;
''''
''''    ' gets "true" when bracket is opened "(",
''''    ' "false" when closed ")":
''''    Dim bOPENED_BRACKET As Boolean
''''
''''    Dim bGOT_OPERATION As Boolean
''''    Dim bGOT_DIGIT As Boolean
''''
''''    lSize = Len(sExpr)
''''
''''    bOPENED_BRACKET = False
''''    bGOT_DIGIT = False
''''
''''    ' assumed that the first operation is "+",
''''    ' this helps us with the first unary "-":
''''    bGOT_OPERATION = True
''''
''''    sResult = ""
''''
''''    For i = 1 To lSize
''''
''''        s = Mid(sExpr, i, 1)
''''
''''        If InStr(1, "~*/%+-<>&^|", s) > 0 Then
''''            If bOPENED_BRACKET Then
''''                sResult = sResult & ")"
''''                bOPENED_BRACKET = False
''''            End If
''''
''''            If bGOT_OPERATION Then
''''                sResult = sResult & "(" & s
''''                bGOT_OPERATION = True
''''                bOPENED_BRACKET = True
''''            Else
''''                sResult = sResult & s
''''                bGOT_OPERATION = True
''''            End If
''''        End If
''''
''''        If InStr(1, "1234567890", s) > 0 Then
''''            sResult = sResult & s
''''            bGOT_OPERATION = False
''''        End If
''''
''''        ' spaces and tabs are not included in
''''        ' result!
''''        If (InStr(1, " " & vbTab, s) > 0) And (Not bGOT_OPERATION) Then
''''            If bOPENED_BRACKET Then
''''                sResult = sResult & ")"
''''                bOPENED_BRACKET = False
''''            End If
''''        End If
''''
''''        ' user defined brackets:
''''        If (InStr(1, "()", s) > 0) Then
''''             sResult = sResult & s
''''             bGOT_OPERATION = False
''''        End If
''''
''''    Next i
''''
''''
''''    ' in case we have last opened bracket:
''''    If bOPENED_BRACKET Then
''''        sResult = sResult & ")"
''''        bOPENED_BRACKET = False ' just in case...
''''    End If
''''
''''    Debug.Print " = ", sResult
''''
''''    add_brackets_around_all_numbers = sResult
''''End Function

' #145b
' to fix bug with "Calc.c" unary "-":
'             -1*16+(-1)   =  -17
'             -1*16+1      =  -15
'           -(1+2+5)*(-9)  =  72
Function add_brackets_around_negative_numbers(ByVal sExpr As String) As String
    Dim sResult As String
    Dim s As String
    Dim lSize As Long
    Dim i As Long
    Dim sPrev As String

    Dim sNum As String
       
    sExpr = remove_all_spaces(sExpr)

    sExpr = replace_brackets_with_normal_brackets(sExpr)

    'Debug.Print "BRACKET: " & sExpr;

    lSize = Len(sExpr)

   
    sResult = ""
    sNum = ""

    
    For i = lSize To 1 Step -1
    
        s = Mid(sExpr, i, 1)
        
        If InStr(1, DELIMETERS_EVAL, s) > 0 Then
            ' check for unary "-"
            If (s = "-") And (sNum <> "") Then
            
                If i > 1 Then
                    sPrev = Mid(sExpr, i - 1, 1)
                Else
                    sPrev = "" ' InStr() will return 1.
                End If
                          
                          
                If sPrev <> ")" Then ' #1091
                    If InStr(1, DELIMETERS_EVAL, sPrev) > 0 Then
                        s = " " ' place " " before this num to
                                ' avoid wrong result for InStr() later.
                        sNum = "(-" & sNum & ")"
                    End If
                End If
                
            End If
            
            sResult = s & sNum & sResult
            sNum = ""
        End If
        
        If InStr(1, "1234567890", s) > 0 Then
            sNum = s & sNum ' keep number.
        End If
                
    Next i
    
    
    ' make sure the first number is included
    If sNum <> "" Then
        sResult = sNum & sResult
    End If

    'Debug.Print " = ", sResult
    
    add_brackets_around_negative_numbers = sResult
End Function

' spaces and tabs are not included in
' result!
Function remove_all_spaces(sExpr As String) As String
    Dim lSize As Long
    Dim i As Long
    Dim s As String
    Dim sResult As String

    lSize = Len(sExpr)
   
    sResult = ""
    
    For i = 1 To lSize
        s = Mid(sExpr, i, 1)
        If Not (InStr(1, " " & vbTab, s) > 0) Then
            sResult = sResult & s
        End If
    Next i
    
    remove_all_spaces = sResult
End Function


Function replace_brackets_with_normal_brackets(sExpr As String) As String
    Dim lSize As Long
    Dim i As Long
    Dim s As String
    Dim sResult As String

    lSize = Len(sExpr)
   
    sResult = ""
    
    For i = 1 To lSize
        s = Mid(sExpr, i, 1)
        If (s = "[") Or (s = "{") Then
            s = "("
        ElseIf (s = "]") Or (s = "}") Then
            s = ")"
        End If
        sResult = sResult & s
    Next i
    
    replace_brackets_with_normal_brackets = sResult
End Function


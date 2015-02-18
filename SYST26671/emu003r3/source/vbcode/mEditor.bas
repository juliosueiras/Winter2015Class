Attribute VB_Name = "mEditor"

'

'

'



' 1.21

Option Explicit

' 1.23
'''''Global sUNDO_BUFFER As String
'''''Global sREDO_BUFFER As String
'''''
'''''Dim lTemp As Long
'''''
'''''Sub reset_Undo_Redo()
'''''    sUNDO_BUFFER = ""
'''''    sREDO_BUFFER = ""
'''''End Sub
'''''
'''''Sub keep_for_Undo()
'''''    sUNDO_BUFFER = frmMain.txtInput.Text
'''''    sREDO_BUFFER = ""
'''''End Sub
'''''
'''''Sub edit_do_Undo()
'''''    lTemp = frmMain.txtInput.SelStart
'''''
'''''    sREDO_BUFFER = frmMain.txtInput.Text
'''''
'''''    frmMain.txtInput.Text = sUNDO_BUFFER
'''''
'''''    sUNDO_BUFFER = ""
'''''
'''''    frmMain.txtInput.SelStart = lTemp
'''''End Sub
'''''
'''''Sub edit_do_Redo()
'''''    lTemp = frmMain.txtInput.SelStart
'''''
'''''    sUNDO_BUFFER = frmMain.txtInput.Text
'''''
'''''    frmMain.txtInput.Text = sREDO_BUFFER
'''''
'''''    sREDO_BUFFER = ""
'''''
'''''    frmMain.txtInput.SelStart = lTemp
'''''End Sub


' 4.00-Beta-3   does not seem to be used anywhere.
''''
''''' returns the location of sSearchWhat in sInput:
''''' lSearchFrom should be 1... to Len(sInput) not ZERO!
''''Function find_GetIndex(ByRef sINPUT As String, ByRef sSearchWhat, ByRef lSearchFrom As Long, compareType As VbCompareMethod) As Long
''''  find_GetIndex = InStr(lSearchFrom, sINPUT, sSearchWhat, compareType)
''''End Function


' returns the index of a line
' line number should be 1...to max lines
' return will be 1 to len(sInput)
' in case line with required index not found
' returns -1:
Function getLineStart_index(ByRef sInput As String, ByRef lRequiredLineNumber) As Long

    Dim lLineCounter As Long
    Dim i As Long
    Dim lSize As Long
    
    If lRequiredLineNumber = 1 Then    ' no need to search!
        getLineStart_index = 1
        Exit Function
    End If

    lLineCounter = 1
    
    lSize = Len(sInput)
    
    For i = 1 To lSize
    
        If myAsc(Mid(sInput, i, 1)) = 10 Then
            lLineCounter = lLineCounter + 1
            If lLineCounter = lRequiredLineNumber Then
                getLineStart_index = i + 1 ' point to start of the next line?
                Exit Function
            End If
        End If
    
    Next i
    
    ' no such line!!!
    getLineStart_index = -1
    
End Function

'''Function editIndent(ByRef sInput As String) As String
'''    Dim s1 As String
'''    Dim s2 As String
'''    Dim sResult As String
'''    Dim lP1 As Long
'''    Dim lP2 As Long
'''    Dim lSize As Long
'''
'''
'''    lP1 = 1
'''    lP2 = 1
'''
'''    lSize = Len(sInput)
'''
'''    lP1 = InStr(1, sInput, Chr(10), vbTextCompare)
'''    sResult = vbTab & Mid(sInput, 1, lP1)
'''    lP2 = lP1
'''
'''    Do While lP2 <= lSize
'''
'''        lP1 = InStr(lP2 + 1, sInput, Chr(10), vbTextCompare)
'''
'''        If lP1 > 0 Then
'''            s1 = Mid(sInput, lP2 + 1, lP1 - lP2)
'''            If Len(s1) > 1 Then
'''                sResult = sResult & vbTab & s1
'''            Else
'''                sResult = sResult & s1
'''            End If
'''        Else
'''            Exit Do
'''        End If
'''
'''        lP2 = lP1
'''    Loop
'''
'''    editIndent = sResult
'''
'''End Function

Function edit_Indent(ByRef sInput As String) As String
    Dim sResult As String
    ' Replace() seems to be a new function of VB6!
    sResult = vbTab & Replace(sInput, Chr(10), Chr(10) & vbTab, 1, -1, vbTextCompare)
    edit_Indent = sResult
End Function

Function edit_Outdent(ByRef sInput As String) As String
    Dim sResult As String
    
    sResult = ""
    
    ' cut off first tab:
    If Mid(sInput, 1, 1) = vbTab Then
       sResult = Mid(sInput, 2)
    Else
       sResult = sInput
    End If
    
    sResult = Replace(sResult, Chr(10) & vbTab, Chr(10), 1, -1, vbTextCompare)
    
    edit_Outdent = sResult
End Function


'Sub RegisterCustomLanguage()
'
'On Error GoTo err1
'
'    Dim lang As codemaxctl.Language
'    Set lang = New codemaxctl.Language
'    lang.CaseSensitive = False
'
'    Dim sArr() As String
'    Dim str As String
'    Dim i As Long
'
'
'    ' #400b20-color-FPU#
'    sArr = Split("AAA AAD AAM AAS ADC ADD AND CALL CBW CLC CLD CLI " & _
'                 "CMC CMP CMPSB CMPSW CWD DAA DAS DEC DIV HLT IDIV " & _
'                 "IMUL IN INC INT INTO IRET JA JAE JB JBE JC JCXZ " & _
'                 "JE JG JGE JL JLE JMP JNA JNAE JNB JNBE JNC JNE JNG " & _
'                 "JNGE JNL JNLE JNO JNP JNS JNZ JO JP JPE JPO JS JZ " & _
'                 "LAHF LDS LEA LES LODSB LODSW LOOP LOOPE LOOPNE " & _
'                 "LOOPNZ LOOPZ MOV MOVSB MOVSW MUL NEG NOP NOT OR OUT POP POPA POPF PUSH PUSHA " & _
'                 "PUSHF RCL RCR REP REPE REPNE REPNZ REPZ RETF RET " & _
'                 "ROL ROR SAHF SAL SAR SBB SCASB SCASW SHL SHR STC STD STI " & _
'                 "STOSB STOSW SUB TEST XCHG XLAT XLATB XOR LOCK " & _
'                 "F2XM1 F4X4 FABS FADD FADDP FBANK FBLD FBSTP FCHS FCLEX FCOM FCOMP FCOMPP FCOS FDECSTP FDISI FDIV FDIVP FDIVR FDIVRP FENI FFREE FIADD FICOM FICOMP FIDIV FIDIVR FILD FIMUL FINCSTP FINIT FIST FISTP FISUB FISUBR FLD FLD1 FLDCW FLDENV FLDL2E FLDL2T FLDLG2 FLDLN2 FLDPI FLDZ FMUL FMULP FNCLEX FNDISI FNENI FNINIT FNOP FNSAVE FNSTCW FNSTENV FNSTSW FPATAN FPREM FPREM1 FPTAN FRNDINT FRSTOR FSAVE FSCALE FSETPM FSIN FSINCOS FSQRT FST FSTCW FSTENV FSTP FSTSW FSUB FSUBP FSUBR FSUBRP FTST FUCOM FUCOMP FUCOMPP FXAM FXCH FXTRACT FYL2X FYL2XP1" & _
'                 " WAIT FWAIT")
'
'    ' Debug.Print sARR(0), sARR(1), sARR(2)
'
'    str = ""
'    For i = LBound(sArr) To UBound(sArr)
'        If i < UBound(sArr) Then
'            str = str & sArr(i) & Chr$(10)
'        Else
'        ' don't add Chr$(10) to end of string:
'            str = str & sArr(i)
'        End If
'    Next i
'
'    lang.Keywords = str
'
'    ' #327xl-color-syntax-update#   ''''   str = "+" & Chr$(10) & "-" & Chr$(10) & "*" & Chr$(10) & "/" & Chr$(10) & "[" & Chr$(10) & "]"
'    str = "+" & Chr$(10) & "-" & Chr$(10) & "*" & Chr$(10) & "/" & Chr$(10) & "[" & Chr$(10) & "]" & Chr$(10) & "~" & Chr$(10) & "%" & Chr$(10) & "^" & Chr$(10) & "&" & Chr$(10) & "|" & Chr$(10) & "<" & Chr$(10) & ">"
'    lang.Operators = str
'
'    lang.Style = cmLangStyleProcedural
'
'
'    lang.SingleLineComments = ";"
'    lang.MultiLineComments1 = ""
'    lang.MultiLineComments2 = ""
'    lang.ScopeKeywords1 = "PROC" & Chr$(10) & "MACRO" & Chr$(10) & "SEGMENT"
'    lang.ScopeKeywords2 = "ENDP" & Chr$(10) & "ENDM" & Chr$(10) & "ENDS"
'    lang.StringDelims = Chr$(34) & Chr$(10) & "'"
'    lang.EscapeChar = ""
'    lang.TerminatorChar = ""
'
'
'
'
'    sArr = Split("AX BX CX DX AH AL BL BH CH CL DH DL DI SI BP SP " & _
'                 "EAX ECX EDX EBX ESP EBP ESI EDI " & _
'                 "CR0 CR2 CR3 CR4 " & _
'                 "DR0 DR1 DR2 DR3 DR6 DR7 " & _
'                 "ST0 ST1 ST2 ST3 ST4 ST5 ST6 ST7 " & _
'                 "MM0 MM1 MM2 MM3 MM4 MM5 MM6 MM7 " & _
'                 "XMM0 XMM1 XMM2 XMM3 XMM4 XMM5 XMM6 XMM7")
'
'
'
'    str = ""
'    For i = LBound(sArr) To UBound(sArr)
'        If i < UBound(sArr) Then
'            str = str & sArr(i) & Chr$(10)
'        Else
'        ' don't add Chr$(10) to end of string:
'            str = str & sArr(i)
'        End If
'    Next i
'
'    lang.TagAttributeNames = str
'
'    ' #400b20-32colored#
'    lang.TagElementNames = "DS" & Chr$(10) & "ES" & Chr$(10) & "SS" & Chr$(10) & "CS" & Chr$(10) & "FS" & Chr$(10) & "GS"
'
'    lang.TagEntities = "ORG" & Chr$(10) & "DB" & Chr$(10) & _
'                       "DW" & Chr$(10) & "DD" & Chr$(10) & "DT" & Chr$(10) & "DQ" & Chr$(10) & "EQU" & Chr$(10) & _
'                       "END" & Chr$(10) & "BYTE PTR" & Chr$(10) & _
'                       "WORD PTR" & Chr$(10) & "B." & Chr$(10) & "W." _
'                       & Chr$(10) & "OFFSET" & Chr$(10) & "INCLUDE"
'
'    'lang.TagAttributeNames
'    Dim globals As codemaxctl.globals
'    Set globals = New codemaxctl.globals
'    Call globals.RegisterLanguage("ASM_8086", lang)
'
'
'    Erase sArr ' #327xp-erase#
'
'    Exit Sub
'err1:
'    Debug.Print "registercutom: " & Err.Description
'
'End Sub
'

Attribute VB_Name = "mInstructions"

' 

' 

'



Option Explicit

' 1.04
' used to see when last EvalExpr() gave an
' overflow error:
' 1.17
' is is also set to "True" when there is something
' that EvalExpr() cannot evaluate at all:
Global bWAS_ERROR_ON_LAST_EVAL_EXPR As Boolean

' 1.25#288
' to avoid setting output type several times!
Global lOUTPUT_TYPE_Set_ON_LINE As Long
' 1.31#436
' to allow setting output several times if it's the same
' directive!
Global sCURRENT_OUTPUT_TYPE As String


Global bFLAG_SEGPREFIX_REPLACED As Boolean



' returns TRUE when command is generated.
Function process_REP(sTOK1 As String) As Boolean

' updated: 1.28#373

    If sTOK1 = "REP" Then
        add_to_arrOUT &HF3
    ElseIf sTOK1 = "REPE" Then
        add_to_arrOUT &HF3
    ElseIf sTOK1 = "REPZ" Then
        add_to_arrOUT &HF3
    ElseIf sTOK1 = "REPNE" Then
        add_to_arrOUT &HF2
    ElseIf sTOK1 = "REPNZ" Then
        add_to_arrOUT &HF2
    Else
        process_REP = False
        Exit Function
    End If
    
    locationCounter = locationCounter + 1
    process_REP = True
    
End Function

' 1.23#266 update for speed (well, I'm not sure, but it could be:)
' assumed no TABS!
Function get_segPrefix(ByRef s As String) As String
    Dim seg As String
    Dim ts As String

    ts = Replace(s, " ", "") ' allow both "DS:"  and "DS  : "

    If (Mid(ts, 3, 1) <> ":") Then
        get_segPrefix = ""
        Exit Function
    End If

    seg = UCase(Mid(ts, 1, 2))

    If seg = "CS" Then
        get_segPrefix = seg
    ElseIf seg = "DS" Then
        get_segPrefix = seg
    ElseIf seg = "SS" Then
        get_segPrefix = seg
    ElseIf seg = "ES" Then
        get_segPrefix = seg
    Else
        get_segPrefix = ""
    End If

End Function


''''' assumed no TABS!
''''' assumed that input s is trimmed!
''''Function get_segPrefix(ByRef s As String) As String
''''    Dim seg As String
''''    Dim ts As String
''''
''''    seg = UCase(Mid(s, 1, 2))
''''
''''    If (seg = "CS") Or (seg = "DS") Or (seg = "SS") Or (seg = "ES") Then
''''
''''        ts = Trim(Mid(s, 3))
''''
''''        If (Mid(ts, 1, 1) = ":") Then
''''            get_segPrefix = seg
''''            Exit Function
''''        End If
''''
''''    End If
''''
''''    get_segPrefix = ""
''''
''''End Function

' add prefix if OP contains CS: DS: SS: ES:
' (doesn't add for DS - it's default!)
' 26            ES:
' 2E            CS:
' 36            SS:
' 3E            DS:
'
' 1.08 returns "True" if added
'
' 1.18
' make sure it will work with "BYTE PTR" / "WORD PTR":
 Function add_seg_prefix_if_required(ByRef op As String) As Boolean ' 1.23 (speed) ByVal op As String) As Boolean
 On Error GoTo err1
 
    Dim sPREF As String
    
    sPREF = cut_off_PTR(op)
    
    sPREF = get_segPrefix(sPREF)
    
    add_seg_prefix_if_required = False
    
    If Len(sPREF) <> 0 Then ' 1.23 (speed) (sPREF <> "") Then
    
        If (sPREF = "CS") Then
            add_to_arrOUT &H2E
        ElseIf (sPREF = "DS") Then ' #400-bug-ds# ' Exit Function ' it's default, so nothing added.
            add_to_arrOUT &H3E     ' #400-bug-ds#  MUST WORK:  MOV AX, DS:[BP+SI]    ; allow getting from data segment when using BP!
        ElseIf (sPREF = "ES") Then
            add_to_arrOUT &H26
        ElseIf (sPREF = "SS") Then
            add_to_arrOUT &H36
        End If
        
        locationCounter = locationCounter + 1
        
        add_seg_prefix_if_required = True
        
    End If
    
    Exit Function
err1:
    Debug.Print "err CB: " & err.Description
    add_seg_prefix_if_required = False
    
End Function


' #327xq-opt1#
' make it work:   mov ax, cs:1234h
' it becomes:    mov ax, 1234h       after  add_seg_prefix_if_required_NEW().
' should become:  mov ax, [1234h]
Function make_it_work(sOLD As String, sNEW As String) As String
On Error GoTo err1

    If Len(sNEW) >= Len(sOLD) Then
        make_it_work = sNEW ' no change
        Exit Function
    End If

    If InStr(1, sNEW, "[") > 0 Then
        make_it_work = sNEW ' no change
        Exit Function
    End If
    If InStr(1, sNEW, "]") > 0 Then
        make_it_work = sNEW ' no change
        Exit Function
    End If
    



    Dim L1 As Long
    Dim L2 As Long
    
    
    
    L1 = InStr(1, sOLD, " ")
    L2 = InStr(1, sOLD, ",")
    

    
    If L1 <= 0 Then
        make_it_work = sNEW ' no change
        Exit Function
    End If
    If L2 <= 0 Then
        '#327xq-pop-mem# ' make_it_work = sNew ' no change
        make_it_work = make_it_work_1_param(sOLD, sNEW, L1) ' #327xq-pop-mem#          pop word ptr ds:4ch
        Exit Function
    End If
    If L2 < L1 Then
        make_it_work = sNEW ' no change
        Exit Function
    End If
    
    
    Dim p1old As String
    Dim p2old As String
    p1old = Trim(Mid(sOLD, L1, L2 - L1))
    p2old = Trim(Mid(sOLD, L2 + 1))

    L1 = InStr(1, sNEW, " ")
    L2 = InStr(1, sNEW, ",")

    Dim cmd_new As String
    Dim p1new As String
    Dim p2new As String
    
    
    
    ' #400b9-assembler-bug512#
    Dim l3 As Long
    l3 = InStr(1, sNEW, ":")
    If l3 < L1 Then
        If L1 > 0 Then ' jic
            ' move to star of the next token
            Dim k1 As Long
            For k1 = l3 + 1 To Len(sNEW)
                If Mid(sNEW, k1, 1) <> " " Then Exit For
            Next k1
            ' search for next space
            L1 = InStr(k1, sNEW, " ")
        End If
    End If
    
    
    
    
    cmd_new = Trim(Mid(sNEW, 1, L1 - 1))
    p1new = Trim(Mid(sNEW, L1, L2 - L1))
    p2new = Trim(Mid(sNEW, L2 + 1))
    
    
    
    

    
    
    
    
    
    If Len(p1old) <> Len(p1new) Then
        make_it_work = cmd_new & " [" & p1new & "]," & p2new
    ElseIf Len(p2old) <> Len(p2new) Then
        make_it_work = cmd_new & " " & p1new & ", [" & p2new & "]"
    Else
        make_it_work = sNEW ' no change
    End If
    
    

Exit Function
err1:
    Debug.Print "err77:" & err.Description
    make_it_work = sNEW ' no change
End Function










' #327xq-pop-mem#.
' make it work:   pop word ptr ds:4ch
' it becomes:     pop word ptr 4ch       after  add_seg_prefix_if_required_NEW().
' should become:  pop word ptr [4ch]
' DISIGNED TO WORK WITH make_it_work() MANY CHECKS SKIPPED!
Function make_it_work_1_param(sOLD As String, sNEW As String, L1_alr_calculated As Long) As String
On Error GoTo err1
    Dim L As Long
   
    L = L1_alr_calculated
    Dim pOld As String
    pOld = Trim(Mid(sOLD, L))

    L = InStr(1, sNEW, " ")
    
    Dim cmd_new As String
    Dim pNew As String
    cmd_new = Trim(Mid(sNEW, 1, L - 1))
    pNew = Trim(Mid(sNEW, L))
    
    If Len(pOld) <> Len(pNew) Then
        make_it_work_1_param = cmd_new & " [" & pNew & "]"
    Else
        make_it_work_1_param = sNEW  ' no change
    End If
    
    

Exit Function
err1:
    Debug.Print "err78:" & err.Description
    make_it_work_1_param = sNEW  ' no change
End Function












' return unmodified string if there's no prefix
' if there is prefix adds it to arrOUT and cuts it out of the source!
Function add_seg_prefix_if_required_NEW(op As String) As String
On Error GoTo err1



    ' 4.00 general optimization
    If InStr(1, op, ":") <= 0 Then GoTo nothing_to_check_for
    
    


    ' currenly don't care if it's the first operand or the second...
    bFLAG_SEGPREFIX_REPLACED = True   ' unless it doesn't replace anything.





    Dim s3 As String
    s3 = LCase(Left(op, 3))
    If s3 = "cs:" Then
        add_to_arrOUT &H2E
        locationCounter = locationCounter + 1
        add_seg_prefix_if_required_NEW = Trim(Mid(op, 4))
        Exit Function
    ElseIf s3 = "ds:" Then
        ' #400-bug-ds# ' it's default no machine code, just cut it out
        add_to_arrOUT &H3E ' #400-bug-ds#
        locationCounter = locationCounter + 1 ' #400-bug-ds#
        add_seg_prefix_if_required_NEW = Trim(Mid(op, 4))
        Exit Function
    ElseIf s3 = "es:" Then
        add_to_arrOUT &H26
        locationCounter = locationCounter + 1
        add_seg_prefix_if_required_NEW = Trim(Mid(op, 4))
        Exit Function
    ElseIf s3 = "ss:" Then
        add_to_arrOUT &H36
        locationCounter = locationCounter + 1
        add_seg_prefix_if_required_NEW = Trim(Mid(op, 4))
        Exit Function
    End If


    Dim L As Long
    
    L = InStr(1, op, " cs:", vbTextCompare)
    If L > 0 Then
        add_to_arrOUT &H2E
        locationCounter = locationCounter + 1
        add_seg_prefix_if_required_NEW = Trim(Mid(op, 1, L - 1) & "  " & Mid(op, L + 4))
        Exit Function
    End If
    
    L = InStr(1, op, " ds:", vbTextCompare)
    If L > 0 Then
        ' #400-bug-ds# ' it's default no machine code, just cut it out
        add_to_arrOUT &H3E ' #400-bug-ds#
        locationCounter = locationCounter + 1 ' #400-bug-ds#
        add_seg_prefix_if_required_NEW = Trim(Mid(op, 1, L - 1) & "  " & Mid(op, L + 4))
        Exit Function
    End If
    
    L = InStr(1, op, " es:", vbTextCompare)
    If L > 0 Then
        add_to_arrOUT &H26
        locationCounter = locationCounter + 1
        add_seg_prefix_if_required_NEW = Trim(Mid(op, 1, L - 1) & "  " & Mid(op, L + 4))
        Exit Function
    End If
    
    L = InStr(1, op, " ss:", vbTextCompare)
    If L > 0 Then
        add_to_arrOUT &H36
        locationCounter = locationCounter + 1
        add_seg_prefix_if_required_NEW = Trim(Mid(op, 1, L - 1) & "  " & Mid(op, L + 4))
        Exit Function
    End If
    

    
    
    
    
    
    
    
    L = InStr(1, op, ".cs:", vbTextCompare)
    If L > 0 Then
        add_to_arrOUT &H2E
        locationCounter = locationCounter + 1
        add_seg_prefix_if_required_NEW = Trim(Mid(op, 1, L) & "  " & Mid(op, L + 4))
        Exit Function
    End If
    
    L = InStr(1, op, ".ds:", vbTextCompare)
    If L > 0 Then
        ' #400-bug-ds# ' it's default no machine code, just cut it out
        add_to_arrOUT &H3E ' #400-bug-ds#
        locationCounter = locationCounter + 1 ' #400-bug-ds#
        add_seg_prefix_if_required_NEW = Trim(Mid(op, 1, L) & "  " & Mid(op, L + 4))
        Exit Function
    End If
    
    L = InStr(1, op, ".es:", vbTextCompare)
    If L > 0 Then
        add_to_arrOUT &H26
        locationCounter = locationCounter + 1
        add_seg_prefix_if_required_NEW = Trim(Mid(op, 1, L) & "  " & Mid(op, L + 4))
        Exit Function
    End If
    
    L = InStr(1, op, ".ss:", vbTextCompare)
    If L > 0 Then
        add_to_arrOUT &H36
        locationCounter = locationCounter + 1
        add_seg_prefix_if_required_NEW = Trim(Mid(op, 1, L) & "  " & Mid(op, L + 4))
        Exit Function
    End If
        
    
    
nothing_to_check_for:
    
    
    
    bFLAG_SEGPREFIX_REPLACED = False
    
    
    add_seg_prefix_if_required_NEW = op  ' NO CHANGE!
    
    
    

Exit Function
err1:
    Debug.Print "err 57:" & err.Description
    add_seg_prefix_if_required_NEW = op
End Function


' compiles many commands such as:
'   NOP, AAA...
' Text table isn't used!

' When code is generated returns TRUE!!!
' otherwise returns FALSE!!! (when there is no such command)

 Function compile_NO_OPERAND_COMMAND(ByVal s As String) As Boolean
    Dim cINDEX As Integer     ' size of command in bytes (1 to 2)
    Dim cmd(0 To 1) As Byte     ' output command
    Dim i As Integer
        
        
    cINDEX = 0
    
    s = UCase(s)
    
    ' 1.08 replacing all Val("&H90") with real hex numbers,
    '      I think I did it with Val() just because I wasn't
    '      aware that it is possible to write hex numbers directly...
    
    If s = "NOP" Then
            ' 90          NOP            No Operation
            cmd(cINDEX) = &H90
            cINDEX = cINDEX + 1
    ElseIf s = "AAA" Then
            ' 37          AAA            ASCII adjust AL (carry into AH) after addition
            cmd(cINDEX) = &H37
            cINDEX = cINDEX + 1
    ElseIf s = "AAD" Then
            ' D5 0A       AAD            ASCII adjust before division (AX = 10*AH + AL)
            cmd(cINDEX) = &HD5
            cINDEX = cINDEX + 1
            cmd(cINDEX) = &HA
            cINDEX = cINDEX + 1
    ElseIf s = "AAM" Then
            ' D4 0A       AAM            ASCII adjust after multiply (AL/10: AH=Quo AL=Rem)
            cmd(cINDEX) = &HD4
            cINDEX = cINDEX + 1
            cmd(cINDEX) = &HA
            cINDEX = cINDEX + 1
    ElseIf s = "AAS" Then
            ' 3F          AAS            ASCII adjust AL (borrow from AH) after subtraction
            cmd(cINDEX) = &H3F
            cINDEX = cINDEX + 1
    ElseIf s = "CBW" Then
            ' 98          CBW            Convert byte into word (AH = top bit of AL)
            cmd(cINDEX) = &H98
            cINDEX = cINDEX + 1
    ElseIf s = "CLC" Then
            ' F8          CLC            Clear carry flag
            cmd(cINDEX) = &HF8
            cINDEX = cINDEX + 1
    ElseIf s = "CLD" Then
            ' FC          CLD            Clear direction flag so SI and DI will increment
            cmd(cINDEX) = &HFC
            cINDEX = cINDEX + 1
    ElseIf s = "CLI" Then
            ' FA          CLI            Clear interrupt enable flag; interrupts disabled
            cmd(cINDEX) = &HFA
            cINDEX = cINDEX + 1
    ElseIf s = "CMC" Then
            ' F5          CMC            Complement carry flag
            cmd(cINDEX) = &HF5
            cINDEX = cINDEX + 1
    ElseIf s = "CMPSB" Then
            ' A6          CMPSB          Compare bytes ES:[DI] from DS:[SI], advance SI and DI
            cmd(cINDEX) = &HA6
            cINDEX = cINDEX + 1
    ElseIf s = "CMPSW" Then
            ' A7          CMPSW          Compare words ES:[DI] from DS:[SI], advance SI and DI
            cmd(cINDEX) = &HA7
            cINDEX = cINDEX + 1
    ElseIf s = "CWD" Then
            ' 99          CWD            Convert word to doubleword (DX = top bit of AX)
            cmd(cINDEX) = &H99
            cINDEX = cINDEX + 1
    ElseIf s = "DAA" Then
            ' 27          DAA            Decimal adjust AL after addition
            cmd(cINDEX) = &H27
            cINDEX = cINDEX + 1
    ElseIf s = "DAS" Then
            ' 2F          DAS            Decimal adjust AL after subtraction
            cmd(cINDEX) = &H2F
            cINDEX = cINDEX + 1
    ElseIf s = "HLT" Then
            ' F4          HLT            Halt
            cmd(cINDEX) = &HF4
            cINDEX = cINDEX + 1
    ElseIf s = "INTO" Then
            ' CE          INTO           Interrupt 4 if overflow flag is 1
            cmd(cINDEX) = &HCE
            cINDEX = cINDEX + 1
    ElseIf s = "IRET" Then
            ' CF          IRET           Interrupt return (far return and pop flags)
            cmd(cINDEX) = &HCF
            cINDEX = cINDEX + 1
    ElseIf s = "LAHF" Then
            ' 9F          LAHF           Load: AH = flags  SF ZF xx AF xx PF xx CF
            cmd(cINDEX) = &H9F
            cINDEX = cINDEX + 1
    ElseIf s = "LODSB" Then
            ' AC          LODSB          Load byte [SI] into AL, advance SI
            cmd(cINDEX) = &HAC
            cINDEX = cINDEX + 1
    ElseIf s = "LODSW" Then
            ' AD          LODSW          Load word [SI] into AX, advance SI
            cmd(cINDEX) = &HAD
            cINDEX = cINDEX + 1
    ElseIf s = "MOVSB" Then
            ' A4          MOVSB          Move byte DS:[SI] to ES:[DI], advance SI and DI
            cmd(cINDEX) = &HA4
            cINDEX = cINDEX + 1
    ElseIf s = "MOVSW" Then
            ' A5          MOVSW          Move word DS:[SI] to ES:[DI], advance SI and DI
            cmd(cINDEX) = &HA5
            cINDEX = cINDEX + 1
    ElseIf s = "POPF" Then
            ' 9D          POPF           Set flags register to top of stack, increment SP by 2
            cmd(cINDEX) = &H9D
            cINDEX = cINDEX + 1
    ElseIf s = "PUSHF" Then
            ' 9C          PUSHF          Set [SP-2] to flags register, then decrement SP by 2
            cmd(cINDEX) = &H9C
            cINDEX = cINDEX + 1
    ElseIf s = "SAHF" Then
            ' 9E          SAHF           Store AH into flags  SF ZF xx AF xx PF xx CF
            cmd(cINDEX) = &H9E
            cINDEX = cINDEX + 1
    ElseIf s = "SCASB" Then
            ' AE          SCASB          Compare bytes AX - ES:[DI], advance DI
            cmd(cINDEX) = &HAE
            cINDEX = cINDEX + 1
    ElseIf s = "SCASW" Then
            ' AF          SCASW          Compare words AX - ES:[DI], advance DI
            cmd(cINDEX) = &HAF
            cINDEX = cINDEX + 1
    ElseIf s = "STC" Then
            ' F9          STC            Set carry flag
            cmd(cINDEX) = &HF9
            cINDEX = cINDEX + 1
    ElseIf s = "STD" Then
            ' FD          STD            Set direction flag so SI and DI will decrement
            cmd(cINDEX) = &HFD
            cINDEX = cINDEX + 1
    ElseIf s = "STI" Then
            ' FB          STI            Set interrupt enable flag, interrupts enabled
            cmd(cINDEX) = &HFB
            cINDEX = cINDEX + 1
    ElseIf s = "STOSB" Then
            ' AA          STOSB          Store AL to byte ES:[DI], advance DI
            cmd(cINDEX) = &HAA
            cINDEX = cINDEX + 1
    ElseIf s = "STOSW" Then
            ' AB          STOSW          Store AX to word ES:[DI], advance DI
            cmd(cINDEX) = &HAB
            cINDEX = cINDEX + 1
    ' 1.08
    ElseIf (s = "XLATB") Or (s = "XLAT") Then
            ' D7          XLATB          Set AL to memory byte DS:[BX + unsigned AL]
            cmd(cINDEX) = &HD7
            cINDEX = cINDEX + 1
            
    ' 1.23#233  (80186)
    ElseIf s = "PUSHA" Then
            ' 60         *PUSHA          Push AX,CX,DX,BX,original SP,BP,SI,DI
            cmd(cINDEX) = &H60
            cINDEX = cINDEX + 1
            
    ' 1.23#233  (80186)
    ElseIf s = "POPA" Then
            ' 61         *POPA           Pop DI,SI,BP,SP,BX,DX,CX,AX (SP value is ignored)
            cmd(cINDEX) = &H61
            cINDEX = cINDEX + 1
            
    Else
            ' no such command!!!
            compile_NO_OPERAND_COMMAND = False
            Exit Function
    End If
    
    ' update location counter:
    locationCounter = locationCounter + cINDEX
    
'1.23#241
'''    Dim tempS As String
'''    tempS = ""
'''
'''    For i = 0 To cINDEX - 1
'''        tempS = tempS & make_min_len(Hex(cmd(i)), 2, "0")
'''    Next i
'''    frmMain.lst_Out.AddItem tempS
    
    For i = 0 To cINDEX - 1
        add_to_arrOUT cmd(i)
    Next i
    
    compile_NO_OPERAND_COMMAND = True
    
End Function


' compiles NOT/NEG/MUL/DIV/IMUL/IDIV
 Sub compile_NOT_NEG_MUL_DIV(sName As String, ByVal params As String)
    Dim op As String
    Dim tRow As String
    Dim SPr As String ' Search Prototype
       

    
    params = Mid(params, Len(sName) + 1) ' skip "NOT", "NEG".

    ' assumed that TABs already replaced by spaces.

    op = Trim(params)

    If op = Chr(10) Then
        frmInfo.addErr currentLINE, cMT("not enough operands for") & " " & sName, sName
    End If

    tRow = ""
    
    SPr = sName & " "
    
    
    If is_eb(op) <> -1 Then
        SPr = SPr & "eb"
        tRow = op
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op)
                
    ElseIf is_ew(op) <> -1 Then
        SPr = SPr & "ew"
        tRow = op
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op)

    Else
        frmInfo.addErr currentLINE, cMT("wrong parameters:") & " " & sName & " " & params, params
        frmInfo.addErr currentLINE, cMT("should be a register or a memory location."), params ' 1.31#453
        frmMain.bCOMPILING = False ' 1.23#202
        Exit Sub
    End If
        
    
    make_2op_INSTRUCTION SPr, op, "", 0, tRow, ""
    
End Sub



 Sub compile_INC_DEC(sName As String, ByVal params As String)
    Dim op As String
    Dim tRow As String
    Dim SPr As String ' Search Prototype
    
    params = Mid(params, Len(sName) + 1) ' skip "INC", "DEC".

    ' assumed that TABs already replaced by spaces.

    op = Trim(params)

    If op = Chr(10) Then
        frmInfo.addErr currentLINE, cMT("not enough operands for") & " " & sName, sName
    End If

    tRow = ""
    
    SPr = sName & " "
    
    
    If is_eb(op) <> -1 Then
        SPr = SPr & "eb"
        tRow = op
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op)
        
    ElseIf is_rw(op) <> -1 Then
        SPr = SPr & "rw"
        tRow = ""
        
    ElseIf is_ew(op) <> -1 Then
        SPr = SPr & "ew"
        tRow = op
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op)

    Else
        frmInfo.addErr currentLINE, cMT("wrong parameters:") & " " & sName & " " & params, params
        frmMain.bCOMPILING = False ' 1.23#202
        Exit Sub
    End If
        
    
    make_2op_INSTRUCTION SPr, op, "", 0, tRow, ""
    
End Sub



' returns the name (SHR/SAR...) when s starts with one of the following:
' SHR, SHL, SAR, SAL, ROR, ROL, RCR, RCL
'   (it is what is returned)
' returns empty string when s doesn't have any of the commands.
' 3.27xo
' assumed that s is uppercased
Function get_SHIFT_ROTATE_command(sTOK1 As String) As String

    Dim i As Integer
    
    For i = 0 To 7
        If sTOK1 = g_SHIFT_ROTATE(i) Then
            get_SHIFT_ROTATE_command = sTOK1
            Exit Function
        End If
    Next i
    
not_shift_rot:

    get_SHIFT_ROTATE_command = ""

End Function

' 1.23 update: #232
'
' compiles:
'  SHR, SHL, SAR, SAL, ROR, ROL, RCR, RCL
Sub compile_SHIFT_ROTATE(ByVal params As String, ByVal iNAME As String)
    Dim op1 As String
    Dim op2 As String
    'not used' Dim op1u As String ' the same as op1 but in upper case.
    Dim op2u As String ' the same as op2 but in upper case.
    Dim tRow As String
    Dim SPr As String ' Search Prototype
       
    ' 1.23#232
    Dim i As Integer
    Dim iTimes_To_ShRt As Integer


    ' 1.31#439
    ' by default (required when second operand is CL)
    iTimes_To_ShRt = 1
    

    params = Mid(params, Len(iNAME) + 1) ' skip "SHR", "ROL" ....

    ' assumed that TABs already replaced by spaces.

    op1 = Trim(getNewToken(params, 0, ","))  ' until ","

    op2 = Trim(getNewToken(params, 1, ",", True)) ' until end of line.

    If op1 = Chr(10) Or op2 = Chr(10) Then
        frmInfo.addErr currentLINE, cMT("not enough operands for") & " " & iNAME, iNAME
    End If

    tRow = ""
    'tTab = ""
    
    SPr = iNAME & " "
    
    ' to save time later in many checks:
    'not used' op1u = UCase(op1)
    op2u = UCase(op2)
           
    If is_eb(op1) <> -1 And op2u = "CL" Then
        SPr = SPr & "eb,CL"
        tRow = op1
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)
        
    ElseIf is_ew(op1) <> -1 And op2u = "CL" Then
        SPr = SPr & "ew,CL"
        tRow = op1
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)
        
    ElseIf is_ib(op2) Then  ' 1.23 #232
    
        ' 1.30#432
        '  is_eb() and is_ew() swapped!
                
        If is_eb(op1) <> -1 Then
            SPr = SPr & "eb,1"
            tRow = op1
            ' add prefix if required before current command:
            add_seg_prefix_if_required (op1)
        ElseIf is_ew(op1) <> -1 Then
            SPr = SPr & "ew,1"
            tRow = op1
            ' add prefix if required before current command:
            add_seg_prefix_if_required (op1)
            
        Else ' 1.31#438
            GoTo error_not_eb_not_ew
        End If
       
       
        iTimes_To_ShRt = evalExpr(op2)
       
    Else
error_not_eb_not_ew: ' 1.31#438
        frmInfo.addErr currentLINE, cMT("wrong parameters:") & " " & iNAME & " " & params, params
        
        If (Not is_ib(op2)) And (UCase(op2) <> "CL") Then ' 1.31#438
            frmInfo.addErr currentLINE, cMT("only immediate byte or CL can be used as second parameter!"), params
        End If
        
        frmMain.bCOMPILING = False ' 1.23#202
        Exit Sub
    End If
    
    

    
    For i = 1 To iTimes_To_ShRt ' 1.23#232
    
        make_2op_INSTRUCTION SPr, op1, op2, 0, tRow, ""

    Next i
    
End Sub

' this one doesn't use the tables on frmDat

'1F          POP DS         Set DS to top of stack, increment SP by 2
'07          POP ES         Set ES to top of stack, increment SP by 2
'8F /0       POP mw         Set memory word to top of stack, increment SP by 2
'58+rw       POP rw         Set word register to top of stack, increment SP by 2
'17          POP SS         Set SS to top of stack, increment SP by 2

Sub compile_POP(ByVal params As String)
    Dim op As String
    Dim cINDEX As Integer     ' size of command in bytes (1 to 5)
    Dim cmd(0 To 5) As Byte     ' output command
    Dim i As Integer
    
    Dim tRow As String
    Dim sDigit As String
    ' 1.21 Dim sTemp As String
    Dim tNumber As Integer
    
    Dim iTemp1 As Integer ' 1.21
    
    params = Mid(params, 4)    ' skip "POP "
    
    op = Trim(params)
        
    cINDEX = 0
       
    op = UCase(op)
                 
    If op = "DS" Then       ' 1F          POP DS
            cmd(cINDEX) = &H1F ' impr1.23#218 Val("&H1F")
            cINDEX = cINDEX + 1
            
    ElseIf op = "ES" Then   ' 07          POP ES
            cmd(cINDEX) = &H7  'Val("&H07")
            cINDEX = cINDEX + 1
            
    ElseIf op = "SS" Then   ' 17          POP SS
            cmd(cINDEX) = &H17 ' Val("&H17")
            cINDEX = cINDEX + 1
      
    ElseIf is_rw(op) <> -1 Then ' 58+rw       POP rw
            cmd(cINDEX) = &H58 + is_rw(op) ' Val("&H58") + is_rw(op)
            cINDEX = cINDEX + 1
            
    ElseIf is_mw(op) Then   ' 8F /0       POP mw
        
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op)
        
            cmd(cINDEX) = &H8F ' Val("&H8F")
            cINDEX = cINDEX + 1
        
            sDigit = "0"
            tRow = op
                        
            ' --------- the same code as in make_2op_INSTRUCTION()
                        
            If is_var(tRow) Then
                ' EA byte:
                cmd(cINDEX) = getTableEA_byte(sDigit, "d16 (simple var)")
                cINDEX = cINDEX + 1
                ' 16d:
                iTemp1 = get_var_offset(tRow)
                cmd(cINDEX) = math_get_low_byte_of_word(iTemp1)
                cINDEX = cINDEX + 1
                cmd(cINDEX) = math_get_high_byte_of_word(iTemp1)
                cINDEX = cINDEX + 1
            ElseIf is_rw(tRow) <> -1 Then
                cmd(cINDEX) = getTableEA_byte(sDigit, "ew=" & UCase(tRow))
                cINDEX = cINDEX + 1
            ElseIf is_rb(tRow) <> -1 Then   ' I think it's never used in MOV.
                ' EA byte:
                cmd(cINDEX) = getTableEA_byte(sDigit, "eb=" & UCase(tRow))
                cINDEX = cINDEX + 1
            Else
                'Debug.Print "ooo   " & sDigit & "   " & tRow
                cmd(cINDEX) = getTableEA_byte(sDigit, makeGeneralEA(tRow))
                cINDEX = cINDEX + 1
                
                ' ++++ get last d8/d16 +++++++
                tNumber = evalExpr(tRow)
                If tNumber <> 0 Then
                    If is_signed_ib(tNumber) Then
                        cmd(cINDEX) = to_unsigned_byte(tNumber)
                        cINDEX = cINDEX + 1
                    Else
                        cmd(cINDEX) = math_get_low_byte_of_word(tNumber)
                        cINDEX = cINDEX + 1
                        cmd(cINDEX) = math_get_high_byte_of_word(tNumber)
                        cINDEX = cINDEX + 1
                    End If
                End If
            End If
            
            ' --------- -----------------------------------------------
    Else
        frmInfo.addErr currentLINE, cMT("wrong parameters:") & " POP " & params, params
        frmMain.bCOMPILING = False ' 1.23#202
        Exit Sub
    End If
    
    
    ' update location counter:
    locationCounter = locationCounter + cINDEX
    
    ' --------------
       
'1.23#241
''''    Dim tempS As String
''''    tempS = ""
''''
''''    For i = 0 To cINDEX - 1
''''        tempS = tempS & make_min_len(Hex(cmd(i)), 2, "0")
''''    Next i
''''    frmMain.lst_Out.AddItem tempS
    
    '1.23#241
    For i = 0 To cINDEX - 1
        add_to_arrOUT cmd(i)
    Next i
    
End Sub


' this one doesn't use the tables on frmDat

'0E          PUSH CS        Set [SP-2] to CS, then decrement SP by 2
'1E          PUSH DS        Set [SP-2] to DS, then decrement SP by 2
'06          PUSH ES        Set [SP-2] to ES, then decrement SP by 2
'FF /6       PUSH mw        Set [SP-2] to memory word, then decrement SP by 2
'50+rw       PUSH rw        Set [SP-2] to word register, then decrement SP by 2
'16          PUSH SS        Set [SP-2] to SS, then decrement SP by 2

Sub compile_PUSH(ByVal params As String)
    Dim op As String
    Dim cINDEX As Integer     ' size of command in bytes (1 or 2)
    Dim cmd(0 To 5) As Byte     ' output command
    Dim i As Integer
    
    Dim tRow As String
    Dim sDigit As String
    ' 1.21 Dim sTemp As String
    Dim tNumber As Integer
    
    Dim iTemp1 As Integer ' 1.21
    
    params = Mid(params, 5)    ' skip "PUSH "
    
    op = Trim(params)
        
    cINDEX = 0
       
    op = UCase(op)
       
    If op = "CS" Then     ' 0E          PUSH CS
            cmd(cINDEX) = &HE ' impr1.23#218 Val("&H0E")
            cINDEX = cINDEX + 1
            
    ElseIf op = "DS" Then ' 1E          PUSH DS
            cmd(cINDEX) = &H1E 'Val("&H1E")
            cINDEX = cINDEX + 1
            
    ElseIf op = "ES" Then ' 06          PUSH ES
            cmd(cINDEX) = &H6  'Val("&H06")
            cINDEX = cINDEX + 1
            
    ElseIf op = "SS" Then ' 16          PUSH SS
            cmd(cINDEX) = &H16 'Val("&H16")
            cINDEX = cINDEX + 1
      
    ElseIf is_rw(op) <> -1 Then '50+rw       PUSH rw
            cmd(cINDEX) = &H50 + is_rw(op) '  Val("&H50") + is_rw(op)
            cINDEX = cINDEX + 1
            
    ElseIf is_mw(op) Then  ' FF /6       PUSH mw
        
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op)
        
            cmd(cINDEX) = &HFF ' Val("&HFF")
            cINDEX = cINDEX + 1
        
            sDigit = "6"
            tRow = op
                        
            ' --------- the same code as in make_2op_INSTRUCTION()
                        
            If is_var(tRow) Then
                ' EA byte:
                cmd(cINDEX) = getTableEA_byte(sDigit, "d16 (simple var)")
                cINDEX = cINDEX + 1
                ' 16d:
                iTemp1 = get_var_offset(tRow)
                cmd(cINDEX) = math_get_low_byte_of_word(iTemp1)
                cINDEX = cINDEX + 1
                cmd(cINDEX) = math_get_high_byte_of_word(iTemp1)
                cINDEX = cINDEX + 1
            ElseIf is_rw(tRow) <> -1 Then
                cmd(cINDEX) = getTableEA_byte(sDigit, "ew=" & UCase(tRow))
                cINDEX = cINDEX + 1
            ElseIf is_rb(tRow) <> -1 Then   ' I think it's never used in MOV.
                ' EA byte:
                cmd(cINDEX) = getTableEA_byte(sDigit, "eb=" & UCase(tRow))
                cINDEX = cINDEX + 1
            Else
                'Debug.Print "ooo   " & sDigit & "   " & tRow
                cmd(cINDEX) = getTableEA_byte(sDigit, makeGeneralEA(tRow))
                cINDEX = cINDEX + 1
                
                ' ++++ get last d8/d16 +++++++
                tNumber = evalExpr(tRow)
                If tNumber <> 0 Then
                    If is_signed_ib(tNumber) Then
                        cmd(cINDEX) = to_unsigned_byte(tNumber)
                        cINDEX = cINDEX + 1
                    Else
                        cmd(cINDEX) = math_get_low_byte_of_word(tNumber)
                        cINDEX = cINDEX + 1
                        cmd(cINDEX) = math_get_high_byte_of_word(tNumber)
                        cINDEX = cINDEX + 1
                    End If
                End If
            End If
            
            ' --------- -----------------------------------------------
            
    ' 1.23
    ' (80186)
    ' 6A ib      *PUSH ib        Push sign-extended immediate byte
    ' the sign will be set by CPU!
    ElseIf is_ib(op) Then
            cmd(cINDEX) = &H6A
            cINDEX = cINDEX + 1
            cmd(cINDEX) = to_unsigned_byte(evalExpr(op))
            cINDEX = cINDEX + 1
            
    ' 68 iw      *PUSH iw        Set [SP-2] to immediate word, then decrement SP by 2
    ElseIf is_iw(op) Then
            cmd(cINDEX) = &H68
            cINDEX = cINDEX + 1
            iTemp1 = evalExpr(op)
            cmd(cINDEX) = math_get_low_byte_of_word(iTemp1)
            cINDEX = cINDEX + 1
            cmd(cINDEX) = math_get_high_byte_of_word(iTemp1)
            cINDEX = cINDEX + 1
    
    Else
        frmInfo.addErr currentLINE, cMT("wrong parameters:") & " PUSH " & params, params
        frmMain.bCOMPILING = False ' 1.23#202
        Exit Sub
    End If
    
    
    ' update location counter:
    locationCounter = locationCounter + cINDEX
    
    ' --------------
       
    
''''    Dim tempS As String
''''    tempS = ""
''''
''''    For i = 0 To cINDEX - 1
''''        tempS = tempS & make_min_len(Hex(cmd(i)), 2, "0")
''''    Next i
''''    frmMain.lst_Out.AddItem tempS

    '1.23#241
    For i = 0 To cINDEX - 1
        add_to_arrOUT cmd(i)
    Next i
    
    
End Sub



Sub compile_XCHG(ByVal params As String)
    Dim op1 As String
    Dim op2 As String
    Dim op1u As String ' the same as op1 but in upper case.
    Dim op2u As String ' the same as op2 but in upper case.
    Dim ti As Integer
    Dim tTab As String
    Dim tRow As String
    Dim SP As String ' Search Prototype
    
    
    
    params = Mid(params, 5) ' skip "XCHG "

    ' assumed that TABs already replaced by spaces.

    op1 = Trim(getNewToken(params, 0, ",")) ' until ","
        
    op2 = Trim(getNewToken(params, 1, ",", True)) ' until end of line.

    ' replace any strings in operand to numbers:
    op2 = replace_str_if_any(op2)

    If op1 = Chr(10) Or op2 = Chr(10) Then
        frmInfo.addErr currentLINE, cMT("not enough operands for") & " XCHG", "XCHG"
    End If

    tRow = ""
    tTab = ""
    
    SP = "XCHG "
    
    ' to save time later in many checks:
    op1u = UCase(op1)
    op2u = UCase(op2)
    
      
    If op1u = "AX" And is_rw(op2) <> -1 Then
        SP = SP & "AX,rw"
        ti = is_rw(op2) ' ti is used here not to store contant (like in MOV), just register index.
       
    ElseIf is_rw(op1) <> -1 And op2u = "AX" Then
        SP = SP & "rw,AX"
        ti = is_rw(op1)
       
    ElseIf is_rb(op1) <> -1 And is_eb(op2) <> -1 Then
        SP = SP & "rb,eb"
        tTab = op1
        tRow = op2
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op2)
                     
    ElseIf is_eb(op1) <> -1 And is_rb(op2) <> -1 Then
        SP = SP & "eb,rb"
        tTab = op2
        tRow = op1
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)
                     
    ElseIf is_rw(op1) <> -1 And is_ew(op2) <> -1 Then
        SP = SP & "rw,ew"
        tTab = op1
        tRow = op2
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op2)
        
    ElseIf is_ew(op1) <> -1 And is_rw(op2) <> -1 Then
        SP = SP & "ew,rw"
        tTab = op2
        tRow = op1
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)
       
    Else
        frmInfo.addErr currentLINE, "wrong parameters:" & " XCHG " & params, params
        frmMain.bCOMPILING = False ' 1.23#202
        check_operands_match op1, op2
        Exit Sub
    End If
        

    make_2op_INSTRUCTION SP, op1, op2, ti, tRow, tTab

End Sub








' conditional Jumps and Loops are incoded the same way!
 Sub compile_JCC_LOOP(params As String) ' optimization #400b9-jcc-short# ' (ByVal params As String)
 On Error GoTo err_jcc_loop ' 1.23
 
    Dim op As String
    Dim cINDEX As Integer     ' size of command in bytes (1 or 2)
    '#1177 that's not enough now! ' Dim cmd(0 To 1) As Byte     ' output command
    Dim cmd(0 To 10) As Byte     ' output command ' #1177 this should be enough ;)
    Dim i As Integer
    
    ' 1.20 just in case:
    Dim ti As Integer
    Dim ts As String
    
    Dim tNumber As Long ' bugfix1.23#219 Integer
    
    
    
    ' #400b9-jcc-short# ' op = Trim(getNewToken(params, 1, " ")) ' until end of line.
    ' we may have "jz short lbl"
    Dim lSP As Long
    op = Trim(params)
    lSP = InStr(1, op, " ")
    If lSP > 0 Then
        op = Mid(op, lSP + 1)
        If Len(op) = 0 Then GoTo no_param
    Else
no_param:
        frmInfo.addErr currentLINE, cMT("label is requred:") & " " & params, params
        frmMain.bCOMPILING = False ' no way to fix it, so stop!
        Exit Sub
    End If
        
        
        
    ' 1.27#352 (1.23#243)
    ' allow ":" in the end, since this is a common error,
    ' just remove it before search in Symbol Table:
    If Mid(op, Len(op), 1) = ":" Then
        If Len(op) > 1 Then
            op = Mid(op, 1, Len(op) - 1)
        Else
            frmInfo.addErr currentLINE, cMT("not valid label:") & " " & params, params
            frmMain.bCOMPILING = False ' no way to fix it, so stop!
            Exit Sub
        End If
    End If
    
    
    
    
     ' #400b9-jcc-short#
     If InStr(1, op, " ") > 0 Then
        If UCase(Left(op, 6)) = "SHORT " Then
           op = Trim(Mid(op, 6))
        ElseIf UCase(Left(op, 4)) = "FAR " Then
           frmInfo.addErr currentLINE, cMT("conditional jump cannot be FAR:") & " " & params, params
           frmMain.bCOMPILING = False ' no way to fix it, so stop!
           Exit Sub
        End If
     End If
     
     
    
    
        
    cINDEX = 0
       
       

    Dim sFIRST_CHAR As String   ' #1177b
    sFIRST_CHAR = Mid(op, 1, 1)
       
       
       
    If get_var_size(op) = -1 Then  ' -1 is for Label.
    
        tNumber = to_unsigned_long(get_var_offset(op))

'#1177b - illigal for conditional jump!!!! ' jmp_to_immediate_offset:

        tNumber = tNumber - locationCounter + lCurSegStart
       
        ' 1.20  just in case:
        ' VB had some strange behaviour here,
        '    sometimes it returned "true" for
        '    is_signed_ib(-266)
        '  - really it's not true, I was just using a
        '    buggy evaluator before.
        ti = to_signed_int(tNumber - 2)
jmp_relative_immediate:
        ts = CStr(ti)
        
        If is_signed_ib(ts) Then
            ' "2" is the size of "JCC cb"
            cmd(cINDEX) = get_JCC_LOOP_byte(params)
            cINDEX = cINDEX + 1
            cmd(cINDEX) = to_unsigned_byte(ti)  ' 1.23 tNumber - 2)
            cINDEX = cINDEX + 1
        Else
            ' 2.01#490
            If get_var_offset(op) <> 0 Then
            
            
                ' #1049
              ' #1177   frmInfo.addErr currentLINE, "for a workaround refer to tutorial 7 -- ""program flow control"".", params
              ' #1177   frmInfo.addErr currentLINE, "condition jump out of range!" & ": " & params, params
               
              ' #1177 just a test:
'
'                1. Get an opposite conditional jump instruction from the table above, make it jump to label_x.

                        
                       '#3.27JCC_BUG_SOLUTION#
                        Dim bbbJCC_BYTE As Byte
                        Dim iiiJMP_CORRECTION As Integer
                        bbbJCC_BYTE = get_JCC_LOOP_byte(params)
                        If bbbJCC_BYTE = &HE3 Then ' &HE3   JCXZ
                            ' add OR CX, CX  -- byte code: 11, 201
                            cmd(cINDEX) = 11
                            cINDEX = cINDEX + 1
                            cmd(cINDEX) = 201
                            cINDEX = cINDEX + 1
                            iiiJMP_CORRECTION = 2
                        ElseIf bbbJCC_BYTE = &HE2 Then   ' &HE2  ' LOOP
                            ' add DEC CX  -- byte code: 73
                            cmd(cINDEX) = 73
                            cINDEX = cINDEX + 1
                            iiiJMP_CORRECTION = 1
                        End If
                        

                        ' must return reverse insruction now!
                        cmd(cINDEX) = get_REVERSED_JCC_BYTE(bbbJCC_BYTE)
                        cINDEX = cINDEX + 1
                        cmd(cINDEX) = 3 ' skip over the next 3 bytes! (the long jump command!).
                        cINDEX = cINDEX + 1
                        

'                2. Use JMP instruction to jump to desired location.

'                       this will be: 'E9 cw       JMP cw         Jump near (word offset relative to next instruction)
                        
                        Dim iNumber As Integer
                        
                        ' code is copied from compile_JMP, just -2 added (compensating previous instruction).
                        ' E9 cw       JMP cw
                        ' "3" is the size of "JMP cw"
                        cmd(cINDEX) = &HE9
                        cINDEX = cINDEX + 1

                        tNumber = tNumber - 3 - 2 - iiiJMP_CORRECTION
                        iNumber = to_signed_int(tNumber)
                        cmd(cINDEX) = math_get_low_byte_of_word(iNumber)
                        cINDEX = cINDEX + 1
                        cmd(cINDEX) = math_get_high_byte_of_word(iNumber)
                        cINDEX = cINDEX + 1
                
                        ' Debug.Print cINDEX ' 5 bytes confirmed!
                        
'                3. Define label_x: just after the JMP instruction.

                        ' not required, I already know exactly how many bytes to skip :)

               
            Else
            
               
'                If frmInfo.lstErr_BUFFER.ListCount = 0 Then ' #1058b
'                    ' updated for version 3.05
'                    frmInfo.addErr currentLINE, cMT("CHECK FOLLOWING ERRORS!") & " " & cMT("Cannot compile!") & ": " & params & " ?"
'                End If
                
                ' Debug.Print "Obsolete, probably error is caused by following errors... because symbol table isn't built yet: " & params
                
                ' make NOP anyway, just to place something on place of
                ' jump command, it saves the passes required to compile
                ' the program:
                cmd(cINDEX) = &H90 ' impr1.23#218 Val("&H90")
                cINDEX = cINDEX + 1
                cmd(cINDEX) = &H90 ' Val("&H90")
                cINDEX = cINDEX + 1
                
            End If
            
            

        End If
      
       
        
    ' 1.29#397
    
 ' #1177b  ElseIf Mid(op, 1, 1) = "$" Then
 ' ALL CONDITIONAL JUMPS ARE RELATIVE !!! SO EVEN IF YOU FORGET DOLLAR, IT WILL STILL COMPILE INTO A RELATIVE JUMP!
  ElseIf InStr(1, "0123456789$", sFIRST_CHAR) > 0 Then ' #1177b
        
        If sFIRST_CHAR = "$" Then op = Mid(op, 2) ' remove "$" from start.
        
        
        If is_immediate(op, False, iRADIX) Then  ' 1.28#375
            ti = evalExpr(op & "-2") ' signed! (because relative).  ' #327xo-relatve-jmp-masm-incompat#
            
        ' #1177b do not make any fixes for immidiate values!
        If ti < -128 Or ti > 127 Then
            frmInfo.addErr currentLINE, cMT("conditional jump is out of range:") & " " & params, params
            frmInfo.addErr currentLINE, cMT("allowed values are from -128 to 127. (0-FF)"), params
        Else
            GoTo jmp_relative_immediate
        End If

            
            
            
            
        End If
        
'#1177b - illigal for conditional jump!!!! ' the check above should check for immidiates as well.
''''    ElseIf is_immediate(op) Then
''''        tNumber = to_unsigned_long(evalExpr(op))
''''
''''        ' #1177b
''''        ' just need to check if the value is in -128...127 range!
''''        ' how ever there will be no way to check for this, because of fix #1177 that will make automatic workaround for this :)
''''        If tNumber < -128 Or tNumber > 127 Then
''''            frmInfo.addErr currentLINE, "conditional jump out of range: " & params, params
''''            frmInfo.addErr currentLINE, "allowed values are from -128 to 127: " & params, params
''''        Else
''''            GoTo jmp_to_immediate_offset
''''        End If
        
    Else
        frmInfo.addErr currentLINE, cMT("undeclared label:") & " " & params, params
        
        ' #327xo-hm-undeclared_label-hm2...#
        ' CANNOT BE FIXED ON NEXT PASS (not found in Symbol Table),
        ' SO STOP THE COMPILATION:
        frmMain.bCOMPILING = False


        Exit Sub
    End If
    
    
    ' update location counter:
    locationCounter = locationCounter + cINDEX
    
    ' --------------
       
    
'''''    Dim tempS As String
'''''    tempS = ""
'''''
'''''    For i = 0 To cINDEX - 1
'''''        tempS = tempS & make_min_len(Hex(cmd(i)), 2, "0")
'''''    Next i
'''''    frmMain.lst_Out.AddItem tempS

    '1.23#241
    For i = 0 To cINDEX - 1
        add_to_arrOUT cmd(i)
    Next i
    
    
    
    Exit Sub
err_jcc_loop:
    Debug.Print "compile_JCC_LOOP(" & params & "): " & LCase(err.Description)
    
End Sub


' #1177
Function get_REVERSED_JCC_BYTE(ByRef bBYTE As Byte) As Byte

' this is how we got our table and case block :)
'''
''''Dim jname As Variant
''''Dim jopcode As Variant
''''Dim i As Integer
''''
''''    jname = Array("JA", "JAE", "JB", "JBE", "JC", "JCXZ", "JE", "JG", "JGE", "JL", "JLE", "JNA", "JNAE", "JNB", "JNBE", "JNC", "JNE", "JNG", "JNGE", "JNL", "JNLE", "JNO", "JNP", "JNS", "JNZ", "JO", "JP", "JPE", "JPO", "JS", "JZ", "LOOP", "LOOPE", "LOOPNE", "LOOPNZ", "LOOPZ")
''''    jopcode = Array("77", "73", "72", "76", "72", "E3", "74", "7F", "7D", "7C", "7E", "76", "72", "73", "77", "73", "75", "7E", "7C", "7D", "7F", "71", "7B", "79", "75", "70", "7A", "7A", "7B", "78", "74", "E2", "E1", "E0", "E0", "E1")
''''
''''  For i = 0 To UBound(jopcode)
''''    ' Debug.Print "Case &H" & jopcode(i) & "  ' " & jname(i) & vbNewLine & vbTab & "get_REVERSED_JCC_BYTE = &H0"
''''     Debug.Print "db 0" & jopcode(i) & "h ; " & jname(i) & vbTab & vbTab & jopcode(i) & " ' " & jname(i)
''''  Next i


' total 20 different jumps!


   Select Case bBYTE

        Case &H77  ' JA
            get_REVERSED_JCC_BYTE = &H76  ' JNA
        Case &H73  ' JAE
            get_REVERSED_JCC_BYTE = &H72 ' JNAE
        Case &H72  ' JB
            get_REVERSED_JCC_BYTE = &H73  ' JNB
        Case &H76  ' JBE
            get_REVERSED_JCC_BYTE = &H77  ' JNBE
        Case &H72  ' JC
            get_REVERSED_JCC_BYTE = &H73  ' JNC
        Case &HE3  ' JCXZ
            get_REVERSED_JCC_BYTE = &H75  ' JNE  ' #3.27p#BOOOM!!! must be: OR CX, CX and JNZ      ' #3.27JCC_BUG_SOLUTION#
        Case &H74  ' JE
            get_REVERSED_JCC_BYTE = &H75 ' JNE
        Case &H7F  ' JG
            get_REVERSED_JCC_BYTE = &H7E ' JNG
        Case &H7D  ' JGE
            get_REVERSED_JCC_BYTE = &H7C  ' JNGE
        Case &H7C  ' JL
            get_REVERSED_JCC_BYTE = &H7D  ' JNL
        Case &H7E  ' JLE
            get_REVERSED_JCC_BYTE = &H7F  ' JNLE         ' #3.27p#BOOOM4#
        Case &H76  ' JNA
            get_REVERSED_JCC_BYTE = &H77  ' JA
        Case &H72  ' JNAE
            get_REVERSED_JCC_BYTE = &H73  ' JAE
        Case &H73  ' JNB
            get_REVERSED_JCC_BYTE = &H72  ' JB
        Case &H77  ' JNBE
            get_REVERSED_JCC_BYTE = &H76 ' JBE         ' #3.27p#BOOOM5#
        Case &H73  ' JNC
            get_REVERSED_JCC_BYTE = &H72  ' JC
        Case &H75  ' JNE
            get_REVERSED_JCC_BYTE = &H74 ' JE
        Case &H7E  ' JNG
            get_REVERSED_JCC_BYTE = &H7F ' JG
        Case &H7C  ' JNGE
            get_REVERSED_JCC_BYTE = &H7D  ' JGE
        Case &H7D  ' JNL
            get_REVERSED_JCC_BYTE = &H7C  ' JL
        Case &H7F  ' JNLE
            get_REVERSED_JCC_BYTE = &H7E  ' JLE
        Case &H71  ' JNO
            get_REVERSED_JCC_BYTE = &H70  ' JO
        Case &H7B  ' JNP
            get_REVERSED_JCC_BYTE = &H7A  ' JP
        Case &H79  ' JNS
            get_REVERSED_JCC_BYTE = &H78  ' JS
        Case &H75  ' JNZ
            get_REVERSED_JCC_BYTE = &H74 ' JZ
        Case &H70  ' JO
            get_REVERSED_JCC_BYTE = &H71 ' JNO
        Case &H7A  ' JP
            get_REVERSED_JCC_BYTE = &H7B ' JNP
        Case &H7A  ' JPE
            get_REVERSED_JCC_BYTE = &H7B ' JPO
        Case &H7B  ' JPO
            get_REVERSED_JCC_BYTE = &H7A  ' JPE
        Case &H78  ' JS
            get_REVERSED_JCC_BYTE = &H79  ' JNS
        Case &H74  ' JZ
            get_REVERSED_JCC_BYTE = &H75  ' JNZ   '#3.27p#BOOOM3# - easy fix... ' &H74  ' JZ
        Case &HE2  ' LOOP
            get_REVERSED_JCC_BYTE = &HE3   '  #1206BOOM2. must be: DEC CX and JCXZ    ' #3.27JCC_BUG_SOLUTION#
        Case &HE1  ' LOOPE
            get_REVERSED_JCC_BYTE = &HE0  ' LOOPNE
        Case &HE0  ' LOOPNE
            get_REVERSED_JCC_BYTE = &HE1  ' LOOPE
        Case &HE0  ' LOOPNZ
            get_REVERSED_JCC_BYTE = &HE1  ' LOOPZ
        Case &HE1  ' LOOPZ
            get_REVERSED_JCC_BYTE = &HE0  ' LOOPNZ


   End Select


End Function

' this one doesn't use the tables on frmDat

' returns HEX byte of conditional jump instruction,
' or an empty string if it's not an instruction.
' 3.27xo
Function get_JCC_LOOP_byte_OPTIMIZED(sTOK1 As String) As Byte

    Dim i As Integer
        
    For i = 0 To 35
        If g_JCC_LOOP_TEXT(i) = sTOK1 Then
            get_JCC_LOOP_byte_OPTIMIZED = g_JCC_LOOP_BYTE(i)
            Exit Function
        End If
    Next i

    get_JCC_LOOP_byte_OPTIMIZED = 255 ' not jump!!!
    
End Function


' this one doesn't use the tables on frmDat

' returns HEX byte of conditional jump instruction,
' or an empty string if it's not an instruction.
Function get_JCC_LOOP_byte(ByVal s As String) As Byte

    Dim i As Integer
    
    s = getNewToken(s, 0, " ") ' command is the first token.
    
    s = UCase(s)
    
    For i = 0 To 35
        If g_JCC_LOOP_TEXT(i) = s Then
            get_JCC_LOOP_byte = g_JCC_LOOP_BYTE(i)
            Exit Function
        End If
    Next i

    get_JCC_LOOP_byte = 255 ' not jump!!!
    
End Function




' this one doesn't use the tables on frmDat

'EB cb       JMP cb         Jump short (signed byte relative to next instruction)
'EA cd       JMP cd         Jump far (4-byte immediate address)
'E9 cw       JMP cw         Jump near (word offset relative to next instruction)
'FF /4       JMP ew         Jump near to EA word (absolute offset)
'FF /5       JMP md         Jump far (4-byte address in memory doubleword)

' Only these are implemented:
'           JMP cb
'           JMP cd   - for constant only: "1234:1234"
'           JMP cw
'           JMP ew
'

'
'

 Sub compile_JMP(ByRef params As String)  ' 1.23 - ByVal replaced with ByRef.
 On Error GoTo err_comp_jmp ' 1.23
 
    Dim op As String
    Dim cINDEX As Integer     ' size of command in bytes (1 to 5)
    Dim cmd(0 To 5) As Byte     ' output command
    Dim i As Integer
    
    Dim tRow As String
    Dim sDigit As String
    ' 1.21 Dim sTemp As String
    Dim tNumber As Long ' bugfix1.23#219 Integer
    Dim iNumber As Integer
    
    Dim iTemp1 As Integer ' 1.21
    
    ' 1.20
    Dim ti As Integer
    Dim ts As String
    
    op = Mid(params, 4)    ' skip "JMP "
    
    
    

    
    
    op = Trim(op)
    
    
    ' #327xr-far-call2-BUG#  moved back here.
    ' ????? ' #3.27xq-short-jump-instead-of dword ptr cs:#-      ' moved here from above
    ' allow ":" in the end, since this is a common error,
    ' just remove it before search in Symbol Table:
    If Right(op, 1) = ":" Then
        If Len(op) > 1 Then
            op = Mid(op, 1, Len(op) - 1)
            op = Trim(op)
            GoTo try_again
        End If
    End If



        
    cINDEX = 0
    
    
    
     ' #327xq-opt1#  - [1]    jmp cs: far [1234h]
     op = cut_off_segPrefix(op)
     
    
     '#327q1# remove the "far " prefix from label's, and set flag
     Dim bFAR_PARAM As Boolean
     If UCase(Left(op, 4)) = "FAR " Then
         op = Trim(Mid(op, 4))
         bFAR_PARAM = True
     ElseIf UCase(Left(op, 6)) = "SHORT " Then ' #327xo-jmp-short#
        op = Trim(Mid(op, 6))
        bFAR_PARAM = False
     Else
         bFAR_PARAM = False
     End If
     
     
     
     ' #327xq-opt1#  -  [2]    jmp far cs:[1234h]
     op = cut_off_segPrefix(op)
     
     
     
try_again:
     

       
    If get_var_size(op) = -1 Then  ' -1 is for Label.
    
        iNumber = get_var_offset(op)

jmp_to_immediate_offset:

        tNumber = to_unsigned_long(iNumber)
        ' get offset relative to current segment:
        tNumber = tNumber - locationCounter + lCurSegStart
        
        ' 1.20  just in case:
        ' VB had some strange behaviour here,
        '    sometimes it returned "true" for
        '    is_signed_ib(-266)
        ti = to_signed_int(tNumber - 2)
jmp_relative_immediate:
        ts = CStr(ti)
        
        If is_signed_ib(ts) Then  ' EB cb       JMP cb
            ' "2" is the size of "JMP cb"
            cmd(cINDEX) = &HEB
            cINDEX = cINDEX + 1
            cmd(cINDEX) = to_unsigned_byte(ti) ' 1.23 tNumber - 2)
            cINDEX = cINDEX + 1
        Else                              ' E9 cw       JMP cw
            ' "3" is the size of "JMP cw"
            cmd(cINDEX) = &HE9
            cINDEX = cINDEX + 1
            
            tNumber = tNumber - 3
            iNumber = to_signed_int(tNumber)
            cmd(cINDEX) = math_get_low_byte_of_word(iNumber)
            cINDEX = cINDEX + 1
            cmd(cINDEX) = math_get_high_byte_of_word(iNumber)
            cINDEX = cINDEX + 1
        End If
      
      
      
    ' #400b20x-BUG#
    ' now it's here:
    ElseIf Mid(op, 1, 1) = "$" Then
        op = Mid(op, 2) ' remove "$" from start.
        
        '#1173 can be unreplaced equ! (because of h prefix)
        Dim tSJ As String
        tSJ = replace_EQU(op, 0, currentLINE)
        
        ' #327xo-relatve-jmp-masm-incompat#
        tSJ = tSJ & "-2"   ' the size of the instruction itself... to make it masm compatible!

        ti = evalExpr(tSJ) ' signed! (because relative).
        GoTo jmp_relative_immediate
        
      
    ElseIf is_ew(op) <> -1 Then ' FF /4       JMP ew
                                ' FF /5       JMP md     '#327q1#
                                
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op)
        
            cmd(cINDEX) = &HFF
            cINDEX = cINDEX + 1
        
            If bFAR_PARAM = True Then '#327q1#
                sDigit = "5" '#327q1#  ' FF /5       JMP md
            Else
                sDigit = "4"           ' FF /4       JMP ew
            End If
            
            tRow = op
                        
            ' --------- the same code as in make_2op_INSTRUCTION()
                        
            If is_var(tRow) Then
                ' EA byte:
                cmd(cINDEX) = getTableEA_byte(sDigit, "d16 (simple var)")
                cINDEX = cINDEX + 1
                ' 16d:
                iTemp1 = get_var_offset(tRow)
                cmd(cINDEX) = math_get_low_byte_of_word(iTemp1)
                cINDEX = cINDEX + 1
                cmd(cINDEX) = math_get_high_byte_of_word(iTemp1)
                cINDEX = cINDEX + 1
            ElseIf is_rw(tRow) <> -1 Then
                cmd(cINDEX) = getTableEA_byte(sDigit, "ew=" & UCase(tRow))
                cINDEX = cINDEX + 1
            ElseIf is_rb(tRow) <> -1 Then   ' I think it's never used in MOV.
                ' EA byte:
                cmd(cINDEX) = getTableEA_byte(sDigit, "eb=" & UCase(tRow))
                cINDEX = cINDEX + 1
            Else
                'Debug.Print "ooo   " & sDigit & "   " & tRow
                cmd(cINDEX) = getTableEA_byte(sDigit, makeGeneralEA(tRow))
                cINDEX = cINDEX + 1
                
                ' ++++ get last d8/d16 +++++++
                iNumber = evalExpr(tRow)
                If iNumber <> 0 Then
                    If is_signed_ib(iNumber) Then
                        cmd(cINDEX) = to_unsigned_byte(iNumber)
                        cINDEX = cINDEX + 1
                    Else
                        cmd(cINDEX) = math_get_low_byte_of_word(iNumber)
                        cINDEX = cINDEX + 1
                        cmd(cINDEX) = math_get_high_byte_of_word(iNumber)
                        cINDEX = cINDEX + 1
                    End If
                End If
            End If
            
            ' --------- -----------------------------------------------
            
    ' 1.23#236c
    ' EA cd       JMP cd         Jump far (4-byte immediate address)
    ElseIf InStr(1, op, ":") > 0 Then ' #400b3-Instr-Bug#
    
        Dim s1 As String
        Dim s2 As String
        
        s1 = getNewToken(op, 0, ":")
        s2 = getNewToken(op, 1, ":", True)
        
        
        
         ' #327xe-far-bug-b#
         
        If LCase(Right(s2, 1)) = "h" Then
            If LCase(Right(s1, 1)) <> "h" Then
                s1 = s1 & "h"
            End If
        End If
        
        
        
        
        ' #327xf-far-call-B-possible-fix-of-fix#
        If Not (is_number(s1, iRADIX) And is_number(s2, iRADIX)) Then ' only positive numbers are allowed!
            GoTo stop_compile_JMP_try_smth_else
        End If
        
        
        
        
        
        cmd(cINDEX) = &HEA
        cINDEX = cINDEX + 1
        
        iTemp1 = evalExpr(s2)
        cmd(cINDEX) = math_get_low_byte_of_word(iTemp1)
        cINDEX = cINDEX + 1
        cmd(cINDEX) = math_get_high_byte_of_word(iTemp1)
        cINDEX = cINDEX + 1
        
        iTemp1 = evalExpr(s1)
        cmd(cINDEX) = math_get_low_byte_of_word(iTemp1)
        cINDEX = cINDEX + 1
        cmd(cINDEX) = math_get_high_byte_of_word(iTemp1)
        cINDEX = cINDEX + 1


' #400b20x-BUG#
''' was here....



    
    ElseIf is_immediate(op, False, iRADIX) Then
        iNumber = evalExpr(op)
        GoTo jmp_to_immediate_offset
    Else
        GoTo stop_compile_JMP_try_smth_else
    End If
    
    
    ' update location counter:
    locationCounter = locationCounter + cINDEX
    
    ' --------------
       
   
''''    Dim tempS As String
''''    tempS = ""
''''
''''    For i = 0 To cINDEX - 1
''''        tempS = tempS & make_min_len(Hex(cmd(i)), 2, "0")
''''    Next i
''''    frmMain.lst_Out.AddItem tempS

    '1.23#241
    For i = 0 To cINDEX - 1
        add_to_arrOUT cmd(i)
    Next i
    
    
    
    Exit Sub  ' OK EXIT !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    
stop_compile_JMP_try_smth_else:  ' try something else....
    
    
        ' #327xq-opt1#
        If InStr(1, op, "dword", vbTextCompare) > 0 Then
            ' nothing to loose...
            op = Replace(op, "dword", "", 1, 1, vbTextCompare)
            op = Replace(op, "ptr", "", 1, 1, vbTextCompare)
            op = Trim(op)
            op = Trim(cut_off_segPrefix(op))
            bFAR_PARAM = True
            GoTo try_again
        End If
        ' #327xq-opt1#
        If InStr(1, op, "dw.", vbTextCompare) > 0 Then
            ' nothing to loose...
            op = Replace(op, "dw.", "", 1, 1, vbTextCompare)
            op = Trim(op)
            op = Trim(cut_off_segPrefix(op))
            bFAR_PARAM = True
            GoTo try_again
        End If
    
    

        
       ' #327xr-far-call2-BUG#  was here
        
        
        
    
        frmInfo.addErr currentLINE, cMT("wrong parameters:") & " " & params, params
        ' CANNOT BE FIXED ON NEXT PASS (not found in Symbol Table),
        ' SO STOP THE COMPILATION:
        frmMain.bCOMPILING = False ' no way to fix it, so stop!
    
    
    Exit Sub
err_comp_jmp:
     Debug.Print "compile_JMP(" & params & "): " & LCase(err.Description)
End Sub



' this one doesn't use the tables on frmDat

' works the same as compile_JMP (except "cb" - there is no short call)

'+'   9A cd       CALL cd        Call far segment, immediate 4-byte address
'+'   E8 cw       CALL cw        Call near, offset relative to next instruction
'+'   FF /3       CALL ed        Call far segment, address at EA doubleword
'+'   FF /2       CALL ew        Call near, offset absolute at EA word

' Only these are implemented:
'           CALL cw
'           CALL ew
'           CALL cd    ' 1.22 / 1.23

Sub compile_CALL(ByRef params As String)  ' 1.23 replaced to ByRef.
    Dim op As String
    Dim cINDEX As Integer     ' size of command in bytes (1 to 5)
    Dim cmd(0 To 5) As Byte     ' output command
    Dim i As Integer
    
    Dim tRow As String
    Dim sDigit As String
    ' 1.21 Dim sTemp As String
    Dim tNumber As Long ' bugfix1.23#219 Integer
    Dim iNumber As Integer
    
    Dim iTemp1 As Integer ' 1.21
    
    Dim sPROC_TYPE As String ' 1.23
    
    
    Dim s1 As String
    Dim s2 As String
    
    
    
    op = Mid(params, 5)    ' skip "CALL "
    
    op = Trim(op)
        
    op = cut_off_segPrefix(op)  ' 3.27xq [1]       call cs:far[7653]
            
    '#1167 remove the "far " prefix from procedure name, and set flag
    Dim bFAR_PARAM As Boolean
    If UCase(Left(op, 4)) = "FAR " Then
        op = Trim(Mid(op, 4))
        bFAR_PARAM = True
    Else
        bFAR_PARAM = False
    End If
    
            
    op = cut_off_segPrefix(op)  ' 3.27xq [2]       call far cs:[7653]
            
        
try_again: ' #327xo-dword ptr#   '  327xq-dw.asm
    
    
    cINDEX = 0
       
       




       
    ' 1.23
    sPROC_TYPE = get_parameter_from_SYMBOL_TABLE(op, cGET_TYPE)
    
    ' E8 cw       CALL cw        Call near, offset relative to next instruction
    If ((sPROC_TYPE = "NEAR") Or (sPROC_TYPE = "LABEL")) And (Not bFAR_PARAM) Then '#1167
    '1.22  If get_var_size(op) = -1 ' -1 size is for Label/Proc.
    
    
       ' Debug.Print "E8 cw: CALL " & params
    
        iNumber = get_var_offset(op)
        
do_jmp_immediate:

        If sPROC_TYPE = "FAR" Then
            frmInfo.addErr currentLINE, cMT("cannot assemble far call."), params
            frmInfo.addErr currentLINE, cMT("refer to  far_call-2.asm  in examples."), params
            frmMain.bCOMPILING = False ' 1.23#202
            Exit Sub
        End If
        
        tNumber = to_unsigned_long(iNumber)
        ' get offset relative to current segment:
        tNumber = tNumber - locationCounter + lCurSegStart
              
        
        ' E8 cw       CALL cw
        ' "3" is the size of "CALL cw"
        cmd(cINDEX) = &HE8 ' impr1.23#218 Val("&HE8")
        cINDEX = cINDEX + 1
        
        tNumber = tNumber - 3
        If can_be_16bit(tNumber) Then ' #327xq-opt1-auto-far-call#
            iNumber = to_signed_int(tNumber)
            cmd(cINDEX) = math_get_low_byte_of_word(iNumber)
            cINDEX = cINDEX + 1
            cmd(cINDEX) = math_get_high_byte_of_word(iNumber)
            cINDEX = cINDEX + 1
        Else
            Dim sDword As String
            sDword = make_min_len(Hex(tNumber), 8, "0") ' double word
            s1 = "0" & Mid(sDword, 2, 4)  ' / 16 (10h)  only 3 chars.
            s2 = Mid(sDword, 5, 8)
            Debug.Print "probably an error, assembling immidiate jmp!"
            GoTo it_is_also_far_immidiate
        End If

    ' #1167  - making the impossible...
    ' FF /3       CALL ed
    ' there is another check for CALL cd below (in case of contant).
    ' #327xa-call-far-bug# ' ElseIf sPROC_TYPE = "FAR" Or bFAR_PARAM Then
     ElseIf bFAR_PARAM Then
      
        ' #327xe-far-bug#
         If InStr(1, op, ":") > 0 Then ' #400b3-Instr-Bug#
                ' #327xf-far-call-fix-of-fix#
                s1 = getNewToken(op, 0, ":")
                s2 = getNewToken(op, 1, ":", True)
                If is_number(s1, iRADIX) And is_number(s2, iRADIX) Then ' only positive numbers are allowed!
                    GoTo it_is_also_far_immidiate
                End If
         End If
      
      
       ' #1167 ' 1.22 bugfix#194
       ' #1167 :) frmInfo.addErr currentLINE, "FAR " & params & " not supported yet.", params
       ' probably it should be the same code as for pointing to 16 bit addresses,
       ' it's emulator's problem to read 32 bits instead of 16 from locations
        
                          
       ' Debug.Print "FF /3: CALL " & params
       
            ' --------- the same code as for "FF /2 CALL ew"
            ' but with ceratain marked modifications.
                        
                        
            ' add prefix if required before current command:
            add_seg_prefix_if_required (op)
            
            op = cut_off_segPrefix(op)
            
        
            cmd(cINDEX) = &HFF
            Debug.Print cmd(cINDEX)
            cINDEX = cINDEX + 1
        
            sDigit = "3"  ' modification! (was "2").
            tRow = op
            
            ' not only var:
            If is_var(tRow) Or sPROC_TYPE = "FAR" Or sPROC_TYPE = "NEAR" Then ' ALLOW FAR CALL EVEN TO PROCS WITHOUT "far declaration"
                ' EA byte:
                cmd(cINDEX) = getTableEA_byte(sDigit, "d16 (simple var)")
                cINDEX = cINDEX + 1
                ' 16d:
                iTemp1 = get_var_offset(tRow)
                cmd(cINDEX) = math_get_low_byte_of_word(iTemp1)
                cINDEX = cINDEX + 1
                cmd(cINDEX) = math_get_high_byte_of_word(iTemp1)
                cINDEX = cINDEX + 1
                               
                
            ElseIf is_rw(tRow) <> -1 Then
                cmd(cINDEX) = getTableEA_byte(sDigit, "ew=" & UCase(tRow))
                cINDEX = cINDEX + 1
                
                
    
                
            ElseIf is_rb(tRow) <> -1 Then   ' I think it's never used in MOV.
                ' EA byte:
                cmd(cINDEX) = getTableEA_byte(sDigit, "eb=" & UCase(tRow))
                cINDEX = cINDEX + 1
                
 
            Else
                'Debug.Print "ooo   " & sDigit & "   " & tRow
                cmd(cINDEX) = getTableEA_byte(sDigit, makeGeneralEA(tRow))
                cINDEX = cINDEX + 1

                ' ++++ get last d8/d16 +++++++
                iNumber = evalExpr(tRow)
                If iNumber <> 0 Then
                    If is_signed_ib(iNumber) Then
                        cmd(cINDEX) = to_unsigned_byte(iNumber)
                        cINDEX = cINDEX + 1
                    Else
                        cmd(cINDEX) = math_get_low_byte_of_word(iNumber)
                        cINDEX = cINDEX + 1
                        cmd(cINDEX) = math_get_high_byte_of_word(iNumber)
                        cINDEX = cINDEX + 1
                    End If
                End If

                    

            End If
            
            ' --------- -----------------------------------------------
       
       
       
       
       
       
       
       
       
       
       
       
      
      
    ' FF /2       CALL ew        Call near, offset absolute at EA word
    ElseIf is_ew(op) <> -1 Then
        
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op)
        
        op = cut_off_segPrefix(op) ' #541
        
        
            cmd(cINDEX) = &HFF
            cINDEX = cINDEX + 1
        
            sDigit = "2"
            tRow = op
                        
            ' --------- the same code as in make_2op_INSTRUCTION()
                        
            If is_var(tRow) Then
                ' EA byte:
                cmd(cINDEX) = getTableEA_byte(sDigit, "d16 (simple var)")
                cINDEX = cINDEX + 1
                ' 16d:
                iTemp1 = get_var_offset(tRow)
                cmd(cINDEX) = math_get_low_byte_of_word(iTemp1)
                cINDEX = cINDEX + 1
                cmd(cINDEX) = math_get_high_byte_of_word(iTemp1)
                cINDEX = cINDEX + 1
            ElseIf is_rw(tRow) <> -1 Then
                cmd(cINDEX) = getTableEA_byte(sDigit, "ew=" & UCase(tRow))
                cINDEX = cINDEX + 1
            ElseIf is_rb(tRow) <> -1 Then   ' I think it's never used in MOV.
                ' EA byte:
                cmd(cINDEX) = getTableEA_byte(sDigit, "eb=" & UCase(tRow))
                cINDEX = cINDEX + 1
            Else
                'Debug.Print "ooo   " & sDigit & "   " & tRow
                cmd(cINDEX) = getTableEA_byte(sDigit, makeGeneralEA(tRow))
                cINDEX = cINDEX + 1
                
                ' ++++ get last d8/d16 +++++++
                iNumber = evalExpr(tRow)
                If iNumber <> 0 Then
                    If is_signed_ib(iNumber) Then
                        cmd(cINDEX) = to_unsigned_byte(iNumber)
                        cINDEX = cINDEX + 1
                    Else
                        cmd(cINDEX) = math_get_low_byte_of_word(iNumber)
                        cINDEX = cINDEX + 1
                        cmd(cINDEX) = math_get_high_byte_of_word(iNumber)
                        cINDEX = cINDEX + 1
                    End If
                End If
            End If
            
            ' --------- -----------------------------------------------
            
    ' 1.23#236c
    ' 9A cd       CALL cd        Call far segment, immediate 4-byte address
    ' there is another check for CALL cd above (in case of symbol table entry).
    ElseIf InStr(1, op, ":") > 0 Then ' #400b3-Instr-Bug#

        
        s1 = getNewToken(op, 0, ":")
        s2 = getNewToken(op, 1, ":", True)
        
it_is_also_far_immidiate:
        

        
        
        ' #327xe-far-bug-b#
        If LCase(Right(s2, 1)) = "h" Then
            If LCase(Right(s1, 1)) <> "h" Then
                s1 = s1 & "h"
            End If
        End If
        
        
        ' #400b3-immid-call#
        ' call 0FFFF:FFFFh
        ' make it:
        ' call 0FFFF:0FFFFh
        Dim sFChar As String
        sFChar = UCase(Left(s2, 1))
        If InStr(1, "ABCDEF", sFChar) > 0 Then
            s2 = "0" & s2
        End If
        
        
        
        ' #327xf-far-call-B-possible-fix-of-fix#
        If Not (is_number(s1, iRADIX) And is_number(s2, iRADIX)) Then ' only positive numbers are allowed!
            GoTo stop_compile_JMP_try_smth_else
        End If
        
        
        
        
        
        
        cmd(cINDEX) = &H9A
        cINDEX = cINDEX + 1
        
        iTemp1 = evalExpr(s2)
        cmd(cINDEX) = math_get_low_byte_of_word(iTemp1)
        cINDEX = cINDEX + 1
        cmd(cINDEX) = math_get_high_byte_of_word(iTemp1)
        cINDEX = cINDEX + 1
        
        iTemp1 = evalExpr(s1)
        cmd(cINDEX) = math_get_low_byte_of_word(iTemp1)
        cINDEX = cINDEX + 1
        cmd(cINDEX) = math_get_high_byte_of_word(iTemp1)
        cINDEX = cINDEX + 1
           
           
    ' 1.29#401
    ElseIf is_immediate(op, False, iRADIX) Then
        iNumber = evalExpr(op)
        GoTo do_jmp_immediate
    Else
        GoTo stop_compile_JMP_try_smth_else
    End If
    
    
    ' update location counter:
    locationCounter = locationCounter + cINDEX
    
    ' --------------
       
    
''''    Dim tempS As String
''''    tempS = ""
''''
''''    For i = 0 To cINDEX - 1
''''        tempS = tempS & make_min_len(Hex(cmd(i)), 2, "0")
''''    Next i
''''    frmMain.lst_Out.AddItem tempS

    '1.23#241
    For i = 0 To cINDEX - 1
        add_to_arrOUT cmd(i)
    Next i
    
    
    Exit Sub ' OK EXIT !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    
    
    
stop_compile_JMP_try_smth_else:  ' try something else....
    
    

    
        ' #327xq-opt1#
        If InStr(1, op, "dword", vbTextCompare) > 0 Then
            ' nothing to loose...
            op = Replace(op, "dword", "", 1, 1, vbTextCompare)
            op = Replace(op, "ptr", "", 1, 1, vbTextCompare)
            op = Trim(op)
            op = Trim(cut_off_segPrefix(op))
            bFAR_PARAM = True
            GoTo try_again
        End If
        ' #327xq-opt1#
        If InStr(1, op, "dw.", vbTextCompare) > 0 Then
            ' nothing to loose...
            op = Replace(op, "dw.", "", 1, 1, vbTextCompare)
            op = Trim(op)
            op = Trim(cut_off_segPrefix(op))
            bFAR_PARAM = True
            GoTo try_again
        End If
    
    
   
        ' #3.27xq-short-jump-instead-of dword ptr cs:#-      ' moved here from above
        ' allow ":" in the end, since this is a common error,
        ' just remove it before search in Symbol Table:
        If Right(op, 1) = ":" Then
            If Len(op) > 1 Then
                op = Mid(op, 1, Len(op) - 1)
                op = Trim(op)
                GoTo try_again
            End If
        End If
            
    
    
        frmInfo.addErr currentLINE, cMT("wrong parameters:") & " " & params, params
        If StrComp(op, "name", vbTextCompare) = 0 Then ' #327xe-eye&candy#
             frmInfo.addErr currentLINE, cMT("'name' is a reserved keyword."), params
        End If
        frmMain.bCOMPILING = False


End Sub



' this one doesn't use the tables on frmDat

' RET = RETN

'CB          RETF           Return to far caller (pop offset, then seg)
'C3          RET            Return to near caller (pop offset only)
'CA iw       RETF iw        RET (far), pop offset, seg, iw bytes
'C2 iw       RET iw         RET (near), pop offset, iw bytes pushed before Call

Sub compile_RET(sName As String, ByVal params As String)
    Dim op As String
    Dim cINDEX As Integer     ' size of command in bytes (1 to 3)
    Dim cmd(0 To 2) As Byte     ' output command
    Dim i As Integer
    
    Dim tRow As String
    Dim sDigit As String
    Dim sTemp As String
    Dim tNumber As Integer
    
    
    sName = UCase(getNewToken(params, 0, " ")) ' get command name.
    
    params = Mid(params, Len(sName) + 1)    ' skip "sName"
    
    op = Trim(params)
        
    cINDEX = 0
       
    ' RET = RETN !!!!!!
    If (sName = "RETN") Then
        sName = "RET"
    ElseIf (sCurProcType = "FAR") And (sName = "RET") Then
        sName = "RETF"  ' PROC FAR requires RETF.
    End If
           
           
    If (sName = "RET") And (op = "") Then
    
        ' C3          RET
        cmd(cINDEX) = &HC3 ' impr1.23#218 Val("&HC3")
        cINDEX = cINDEX + 1

    ElseIf (sName = "RETF") And (op = "") Then
    
        ' CB          RETF
        cmd(cINDEX) = &HCB ' Val("&HCB")
        cINDEX = cINDEX + 1
    
    ElseIf is_iw(op) Then
        
        If (sName = "RET") Then
            ' C2 iw       RET iw
            cmd(cINDEX) = &HC2 ' Val("&HC2")
            cINDEX = cINDEX + 1
        ElseIf (sName = "RETF") Then
            ' CA iw       RETF iw
            cmd(cINDEX) = &HCA ' Val("&HCA")
            cINDEX = cINDEX + 1
        End If
        
        tNumber = evalExpr(op)
                
        cmd(cINDEX) = math_get_low_byte_of_word(tNumber)
        cINDEX = cINDEX + 1
        cmd(cINDEX) = math_get_high_byte_of_word(tNumber)
        cINDEX = cINDEX + 1

    Else
        frmInfo.addErr currentLINE, cMT("wrong parameters:") & " " & sName & " " & params, params
        frmMain.bCOMPILING = False ' 1.23#202
    End If
    
    
    ' update location counter:
    locationCounter = locationCounter + cINDEX
    
    ' --------------
       

''''    Dim tempS As String
''''    tempS = ""
''''
''''    For i = 0 To cINDEX - 1
''''        tempS = tempS & make_min_len(Hex(cmd(i)), 2, "0")
''''    Next i
''''    frmMain.lst_Out.AddItem tempS

    '1.23#241
    For i = 0 To cINDEX - 1
        add_to_arrOUT cmd(i)
    Next i
    
    
End Sub




' this one doesn't use the tables on frmDat
Sub compile_INT(ByVal params As String)
    Dim op As String
    Dim cINDEX As Integer     ' size of command in bytes (1 or 2)
    Dim cmd(0 To 1) As Byte     ' output command
    Dim tb As Byte
    Dim i As Integer
    
    params = Mid(params, 4) ' skip "INT "
    
    op = Trim(params)
        
    ' to avoid 00x21
    If Left(op, 1) <> "0" Then
        ' TODO#1008 - 2005-03-04
        ' make it work even if HEX number is give without
        ' starting digit:
        op = "0" & op
    End If
    
    
    If is_ib(op) Then
        
            tb = to_unsigned_byte(evalExpr(op))
            cINDEX = 0
            
            If tb <> 3 Then
                cmd(cINDEX) = &HCD      ' INT ib
                cINDEX = cINDEX + 1
                cmd(cINDEX) = tb        ' ib
                cINDEX = cINDEX + 1
            Else
                cmd(cINDEX) = &HCC      ' INT 3
                cINDEX = cINDEX + 1
            End If
    Else
        frmInfo.addErr currentLINE, cMT("wrong parameters:") & " INT " & params, params
        frmMain.bCOMPILING = False ' 1.23#202
        Exit Sub
    End If
    
    
    ' update location counter:
    locationCounter = locationCounter + cINDEX
    
    ' --------------
       
    
''''    Dim tempS As String
''''    tempS = ""
''''
''''    For i = 0 To cINDEX - 1
''''        tempS = tempS & make_min_len(Hex(cmd(i)), 2, "0")
''''    Next i
''''    frmMain.lst_Out.AddItem tempS
''''

    '1.23#241
    For i = 0 To cINDEX - 1
        add_to_arrOUT cmd(i)
    Next i
    
End Sub



' 1.25
'E4 ib       IN AL,ib       Input byte from immediate port into AL
'EC          IN AL,DX       Input byte from port DX into AL
'E5 ib       IN AX,ib       Input word from immediate port into AX
'ED          IN AX,DX       Input word from port DX into AX
Sub compile_IN(ByRef params As String)
    Dim op As String
    Dim op1 As String
    Dim op2 As String
    Dim cINDEX As Integer     ' size of command in bytes (1 or 2)
    Dim cmd(0 To 1) As Byte     ' output command
    Dim tb As Byte
    Dim i As Integer
    
    op = Mid(params, 3) ' skip "IN ".
    
    op1 = Trim(getNewToken(op, 0, ",")) ' until ","
    
    op2 = Trim(getNewToken(op, 1, ",", True)) ' until end of line.

    cINDEX = 0
        
    If (UCase(op1) = "AL") And (UCase(op2) = "DX") Then
        
            cmd(cINDEX) = &HEC      ' EC          IN AL,DX
            cINDEX = cINDEX + 1
            
    ElseIf (UCase(op1) = "AX") And (UCase(op2) = "DX") Then
        
            cmd(cINDEX) = &HED      ' ED          IN AX,DX
            cINDEX = cINDEX + 1
            
    ElseIf is_ib(op2) Then
        
            tb = to_unsigned_byte(evalExpr(op2))
                
            If (UCase(op1) = "AL") Then
                
                cmd(cINDEX) = &HE4      ' E4 ib       IN AL,ib
                cINDEX = cINDEX + 1
                cmd(cINDEX) = tb        ' ib
                cINDEX = cINDEX + 1
                
            ElseIf (UCase(op1) = "AX") Then
                
                cmd(cINDEX) = &HE5      ' E5 ib       IN AX,ib
                cINDEX = cINDEX + 1
                cmd(cINDEX) = tb        ' ib
                cINDEX = cINDEX + 1
                
            Else
                frmInfo.addErr currentLINE, params & " - " & cMT("first parameter can be AL or AX only."), params
                frmMain.bCOMPILING = False
                Exit Sub
            End If
            
    ElseIf (UCase(op2) = "AL") Or (UCase(op2) = "AX") Then
        frmInfo.addErr currentLINE, params & " - " & cMT("second operand cannot be AL or AX!"), params
        frmMain.bCOMPILING = False
        Exit Sub
    ElseIf (UCase(op1) <> "AL") And (UCase(op1) <> "AX") Then
        frmInfo.addErr currentLINE, params & " - " & cMT("first operand can be AL or AX only!"), params
        frmMain.bCOMPILING = False
        Exit Sub
    Else
        frmInfo.addErr currentLINE, params & " - " & cMT("first operand (port) should be 0..255 or DX."), params
        frmMain.bCOMPILING = False
        Exit Sub
    End If
    
    
    ' update location counter:
    locationCounter = locationCounter + cINDEX
    
    ' --------------

    For i = 0 To cINDEX - 1
        add_to_arrOUT cmd(i)
    Next i
    
End Sub

' 1.25
'E6 ib       OUT ib,AL      Output byte AL to immediate port number ib
'E7 ib       OUT ib,AX      Output word AX to immediate port number ib
'EE          OUT DX,AL      Output byte AL to port number DX
'EF          OUT DX,AX      Output word AX to port number DX
Sub compile_OUT(ByRef params As String)
    Dim op As String
    Dim op1 As String
    Dim op2 As String
    Dim cINDEX As Integer     ' size of command in bytes (1 or 2)
    Dim cmd(0 To 1) As Byte     ' output command
    Dim tb As Byte
    Dim i As Integer
    
    op = Mid(params, 4) ' skip "OUT ".
    
    op1 = Trim(getNewToken(op, 0, ",")) ' until ","
    
    op2 = Trim(getNewToken(op, 1, ",", True)) ' until end of line.

    cINDEX = 0
        
    If (UCase(op1) = "DX") And (UCase(op2) = "AL") Then
        
            cmd(cINDEX) = &HEE      ' EE          OUT DX,AL
            cINDEX = cINDEX + 1
            
    ElseIf (UCase(op1) = "DX") And (UCase(op2) = "AX") Then
        
            cmd(cINDEX) = &HEF      ' EF          OUT DX,AX
            cINDEX = cINDEX + 1
            
    ElseIf is_ib(op1) Then
        
            tb = to_unsigned_byte(evalExpr(op1))
        
            If (UCase(op2) = "AL") Then
                
                cmd(cINDEX) = &HE6      ' E6 ib       OUT ib,AL
                cINDEX = cINDEX + 1
                cmd(cINDEX) = tb        ' ib
                cINDEX = cINDEX + 1
                
            ElseIf (UCase(op2) = "AX") Then
                
                cmd(cINDEX) = &HE7      ' E7 ib       OUT ib,AX
                cINDEX = cINDEX + 1
                cmd(cINDEX) = tb        ' ib
                cINDEX = cINDEX + 1
                
            Else
                frmInfo.addErr currentLINE, params & " - " & cMT("second parameter can be AL or AX only."), params
                frmMain.bCOMPILING = False
                Exit Sub
            End If
            
    ElseIf (UCase(op1) = "AL") Or (UCase(op1) = "AX") Then
        frmInfo.addErr currentLINE, params & " - " & cMT("first operand cannot be AL or AX!"), params
        frmMain.bCOMPILING = False
        Exit Sub
    ElseIf (UCase(op2) <> "AL") And (UCase(op2) <> "AX") Then
        frmInfo.addErr currentLINE, params & " - " & cMT("second operand can be AL or AX only!"), params
        frmMain.bCOMPILING = False
        Exit Sub
    Else
        frmInfo.addErr currentLINE, params & " - " & cMT("First operand (port) should be 0..255 or DX."), params
        frmMain.bCOMPILING = False
        Exit Sub
    End If
    
    
    ' update location counter:
    locationCounter = locationCounter + cINDEX
    
    ' --------------

    For i = 0 To cINDEX - 1
        add_to_arrOUT cmd(i)
    Next i
    
End Sub



' compiles ADC, ADD, AND, CMP, OR, SBB, SUB, TEST, XOR
' (iNAME - can take these values)
 Sub compile_9g(ByVal params As String, ByVal iNAME As String)
    Dim op1 As String
    Dim op2 As String
    Dim op1u As String ' the same as op1 but in upper case.
    'not used' Dim op2u As String ' the same as op2 but in upper case.
    Dim ti As Integer
    Dim tTab As String
    Dim tRow As String
    Dim sY As String ' Search Prototype
    
    'Dim b_is_ew_check_success As Boolean ' 1.23
    'b_is_ew_check_success = False
    

    params = Mid(params, Len(iNAME) + 1) ' skip "ADD", "AND" ....

    ' assumed that TABs already replaced by spaces.

    ' BUGFIX#1009 - 2005-03-04   - cmp  al, ','   -  fix.
    params = replace_str_if_any(params)

    op1 = Trim(getNewToken(params, 0, ",")) ' until ","

    op2 = Trim(getNewToken(params, 1, ",", True)) ' until end of line.

    ' BUGFIX#1009 - 2005-03-04   - cmp  al, ','   -  fix.
    '' replace any strings in operand to numbers:
    ''op2 = replace_str_if_any(op2)

    If op1 = Chr(10) Or op2 = Chr(10) Then
        frmInfo.addErr currentLINE, cMT("not enough operands for") & " " & iNAME, iNAME
        frmMain.bCOMPILING = False ' 1.23#202
        Exit Sub                   ' 1.23#202
    End If

    tRow = ""
    tTab = ""
    
    sY = iNAME & " "
    
    ' to save time later in many checks:
    op1u = UCase(op1)

    '''''''''''''''''''''''''''''''''''''''''''''''
    ' updating 1.23#203
    If op1u = "AL" Then
        
        If is_ib(op2) Then
            sY = sY & "AL,ib"
            ti = evalExpr(op2)
            GoTo make_instruction
        End If
        
    End If
    
' I decided not to do it here,
' because:
' CMP  [SI], 5
' is compiled by default to:
' CMP  w.[SI], 5
' instead of:
' CMP  b.[SI], 5
'
'
'''''    ' this check is special, below there is the same
'''''    ' check, it is done this way to make the same machine code
'''''    ' as MASM does:
'''''    If is_ew(op1) <> -1 Then
'''''
'''''        ' there is no TEST ew,ib ... it's strange cause there is AND ew,ib
'''''        If iNAME <> "TEST" Then
'''''            If is_signed_ib(op2) Then
'''''                sY = sY & "ew,ib"
'''''                tRow = op1
'''''                ti = evalExpr(op2)
'''''                ' add prefix if required before current command:
'''''                add_seg_prefix_if_required (op1)
'''''                GoTo make_instruction
'''''            End If
'''''        End If
'''''
'''''        b_is_ew_check_success = True
'''''    End If
    
    If op1u = "AX" Then
    
        If is_iw(op2) Then
            sY = sY & "AX,iw"
            ti = evalExpr(op2)
            GoTo make_instruction
        End If
        
    End If
    
    If is_rb(op1) <> -1 Then
    
        If is_eb(op2) <> -1 Then
            sY = sY & "rb,eb"
            tTab = op1
            tRow = op2
            ' add prefix if required before current command:
            add_seg_prefix_if_required (op2)
            GoTo make_instruction
        End If
        
    End If
    
    If is_rw(op1) <> -1 Then
    
        If is_ew(op2) <> -1 Then
            sY = sY & "rw,ew"
            tTab = op1
            tRow = op2
            ' add prefix if required before current command:
            add_seg_prefix_if_required (op2)
            ' Debug.Print "op2: " & op2
            GoTo make_instruction
        End If
        
    End If
    
    If is_eb(op1) <> -1 Then
    
        If is_ib(op2) Then
            sY = sY & "eb,ib"
            ti = evalExpr(op2)
            tRow = op1
            ' add prefix if required before current command:
            add_seg_prefix_if_required (op1)
            GoTo make_instruction
        End If
        
        If is_rb(op2) <> -1 Then
            sY = sY & "eb,rb"
            tTab = op2
            tRow = op1
            ' add prefix if required before current command:
            add_seg_prefix_if_required (op1)
            GoTo make_instruction
        End If
                
    End If
    
    
    If is_ew(op1) <> -1 Then
    
        If is_rw(op2) <> -1 Then
            sY = sY & "ew,rw"
            tTab = op2
            tRow = op1
            ' add prefix if required before current command:
            add_seg_prefix_if_required (op1)
            GoTo make_instruction
        End If
               
        ' there is no TEST ew,ib ... it's strange because there is AND ew,ib
        If iNAME <> "TEST" Then
            If is_signed_ib(op2) Then
                sY = sY & "ew,ib"
                tRow = op1
                ti = evalExpr(op2)
                ' add prefix if required before current command:
                add_seg_prefix_if_required (op1)
                GoTo make_instruction
            End If
        End If
        
        If is_iw(op2) Then
            sY = sY & "ew,iw"
            tRow = op1
            ti = evalExpr(op2)
            ' add prefix if required before current command:
            add_seg_prefix_if_required (op1)
            GoTo make_instruction
        End If
        
    End If
    
    ' if gets here , then some kind of wrong instruction!
    
    '''''''''''''''''''''''''''''''''''''''''''''''
        
    frmInfo.addErr currentLINE, cMT("wrong parameters:") & " " & iNAME & " " & params, params
    frmMain.bCOMPILING = False ' 1.23#202
    check_operands_match op1, op2
    Exit Sub
    
make_instruction: ' 1.23#203
    
    make_2op_INSTRUCTION sY, op1, op2, ti, tRow, tTab


End Sub

' 1.07 I copied it from compile_9g(), and removed all unused code:
' compiles LDS, LES
' (iNAME - can take these values)
Sub compile_LDS_LES(ByVal params As String, ByVal iNAME As String)
    Dim op1 As String
    Dim op2 As String
    Dim op1u As String ' the same as op1 but in upper case.
    'not used' Dim op2u As String ' the same as op2 but in upper case.
    Dim ti As Integer
    Dim tTab As String
    Dim tRow As String
    Dim SP As String ' Search Prototype
       
    

    params = Mid(params, Len(iNAME) + 1) ' skip "ADD", "AND" ....


    ' assumed that TABs already replaced by spaces.



    op1 = Trim(getNewToken(params, 0, ",")) ' until ","

    op2 = Trim(getNewToken(params, 1, ",", True)) ' until end of line.

    ' replace any strings in operand to numbers:
    op2 = replace_str_if_any(op2)


try_again:  ' #327xo-dword ptr#

    If op1 = Chr(10) Or op2 = Chr(10) Then
        frmInfo.addErr currentLINE, cMT("not enough operands for") & " " & iNAME, iNAME
    End If

    tRow = ""
    tTab = ""
    
    SP = iNAME & " "
    
    ' to save time later in many checks:
    op1u = UCase(op1)
    'not used' op2u = UCase(op2)
    
    ' 1.18 added "OR":
    
    If is_rw(op1) <> -1 And ((is_ew(op2) <> -1) Or (is_eb(op2) <> -1)) Then '+
        SP = SP & "rw,ed"
        tTab = op1
        tRow = op2
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op2)
                
    Else
    
        ' #327xo-dword ptr#
        If InStr(1, op1, "dword", vbTextCompare) > 0 Then
            ' nothing to loose...
            op1 = Replace(op1, "dword", "word", 1, 1, vbTextCompare)
            GoTo try_again
        End If
        If InStr(1, op2, "dword", vbTextCompare) > 0 Then
            ' nothing to loose...
            op2 = Replace(op2, "dword", "word", 1, 1, vbTextCompare)
            GoTo try_again
        End If
        
    
        frmInfo.addErr currentLINE, cMT("wrong parameters:") & " " & iNAME & " " & params, params
        frmMain.bCOMPILING = False ' 1.23#202
        Exit Sub
    End If
        
    
    make_2op_INSTRUCTION SP, op1, op2, ti, tRow, tTab

End Sub



Sub compile_MOV(ByVal params As String)
    Dim op1 As String
    Dim op2 As String
    Dim op1u As String ' the same as op1 but in upper case.
    Dim op2u As String ' the same as op2 but in upper case.
    Dim ti As Integer
    Dim tTab As String
    Dim tRow As String
    Dim sep As String ' Search Prototype (1.17 "SP" replaced with "sep" to make sure it won't mess with SP register).
    
    
    Dim lAVOID_ETERNAL_LOOP As Long ' #400b3-bug-syntax#
    
    
    params = Mid(params, 4) ' skip "MOV"

    ' assumed that TABs already replaced by spaces.

    ' BUGFIX#1009 - 2005-03-04   - cmp  al, ','   -  fix.
    params = replace_str_if_any(params)

    op1 = Trim(getNewToken(params, 0, ",")) ' until ","
    
    op2 = Trim(getNewToken(params, 1, ",", True))  ' until end of line.

    ' BUGFIX#1009 - 2005-03-04   - cmp  al, ','   -  fix.
    '' replace any strings in operand to numbers:
    ''op2 = replace_str_if_any(op2)

    If op1 = Chr(10) Or op2 = Chr(10) Then
        frmInfo.addErr currentLINE, cMT("insufficient operands for MOV"), params
    End If

    tRow = ""
    tTab = ""
    
    sep = "MOV "
    
    ' #1050d
    If startsWith(op2, "seg ") Then
        op2 = get_var_segment(Mid(op2, 4))
        
        ' #1194x4b  If op2 = "(NOSEG)" Then op2 = "0"  '#1194x4  - when no segment it's zero!
        If op2 = "(NOSEG)" Then op2 = "CS"  ' #1194x4b - code segment is better!  :)
        
        
    End If
    
    
    ' to save time later in many checks:
    op1u = UCase(op1)
    op2u = UCase(op2)
    
    ' 1.23#258 '''''''''''''''''' improving speed:
    Dim b_IS_VAR_OP1 As Boolean
    Dim b_IS_VAR_OP2 As Boolean
    
    Dim i_VAR_SIZE_OP1 As Integer
    Dim i_VAR_SIZE_OP2 As Integer

    Dim b_IS_mw_OP2 As Boolean

    Dim b_IS_rw_OP2 As Boolean
    
    Dim b_IS_rb_OP1 As Boolean
    Dim b_IS_rw_OP1 As Boolean

    Dim b_IS_ib_OP2 As Boolean
    Dim b_IS_iw_OP2 As Boolean
    
    Dim b_IS_eb_OP1 As Boolean
    Dim b_IS_ew_OP1 As Boolean

    '''''''''''''''''''''''''''''''''''
    
    ' hm.....
    b_IS_VAR_OP2 = is_var(op2)
    If STRICT_SYNTAX Then  ' #327xp-always-match#
        If b_IS_VAR_OP2 Then ' #400b3-bug-syntax# !!!! required!!
            i_VAR_SIZE_OP2 = get_var_size(op2)
        Else
            i_VAR_SIZE_OP2 = 0
        End If
    Else
        i_VAR_SIZE_OP2 = 0
    End If                ' #327xp-always-match#


' try_everything_again:






    
    ' 1.23#257 - "And (i_VAR_SIZE_OP2 <> 2)"
    If (op1u = "AL") And b_IS_VAR_OP2 And (i_VAR_SIZE_OP2 <> 2) Then
        
        ' #400B26_bug1-not-here-to-fix#
    
        sep = sep & "AL,xb"
        ti = get_var_offset(op2)
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op2)
        
        GoTo continue_with_make_instruction
    End If

        
        
        
        
        
        
        
        
    ' 1.23#257 - "And (i_VAR_SIZE_OP2 <> 1)"
    If op1u = "AX" And b_IS_VAR_OP2 And (i_VAR_SIZE_OP2 <> 1) Then
        sep = sep & "AX,xw"
        ti = get_var_offset(op2)
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op2)
        
        GoTo continue_with_make_instruction
    End If
    
    
    
    
    
    
        
    b_IS_mw_OP2 = is_mw(op2)
    
    If op1u = "DS" And b_IS_mw_OP2 Then
        sep = sep & "DS,mw"
        tRow = op2
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op2)
        
        GoTo continue_with_make_instruction
    End If
        
    b_IS_rw_OP2 = IIf(is_rw(op2) <> -1, True, False)
        
    If op1u = "DS" And b_IS_rw_OP2 Then  '+
        sep = sep & "DS,rw"
        tRow = op2
        
        GoTo continue_with_make_instruction
    End If
        
        
    If op1u = "ES" And b_IS_mw_OP2 Then '+
        sep = sep & "ES,mw"
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op2)
        tRow = op2
            
        GoTo continue_with_make_instruction
    End If
    
    
    If op1u = "ES" And b_IS_rw_OP2 Then
        sep = sep & "ES,rw"
        tRow = op2
                
        GoTo continue_with_make_instruction
    End If
        
    If op1u = "SS" And b_IS_mw_OP2 Then
        sep = sep & "SS,mw"
        tRow = op2
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op2)
                
        GoTo continue_with_make_instruction
    End If
        
        
    If op1u = "SS" And b_IS_rw_OP2 Then
        sep = sep & "SS,rw"
        tRow = op2
        
        GoTo continue_with_make_instruction
    End If
        
        
    

    
    b_IS_VAR_OP1 = is_var(op1)
    ' #400b3-bug-syntax#
    If STRICT_SYNTAX Then
        If b_IS_VAR_OP1 Then
           ' 1.30 I think there is no need to calculate var size,
           '      if we know that it's not a var:
           i_VAR_SIZE_OP1 = get_var_size(op1)
        Else
            i_VAR_SIZE_OP1 = 0
        End If
    Else
        i_VAR_SIZE_OP1 = 0
    End If
    
    
    
    
    
    
    ' 1.23#257b "And (i_VAR_SIZE_OP1 <> 2)"
    If b_IS_VAR_OP1 And op2u = "AL" And (i_VAR_SIZE_OP1 <> 2) Then
        sep = sep & "xb,AL"
        ti = get_var_offset(op1)
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)
        
        GoTo continue_with_make_instruction
    End If
        
    ' 1.23#257b "And (i_VAR_SIZE_OP1 <> 1)"
    If b_IS_VAR_OP1 And op2u = "AX" And (i_VAR_SIZE_OP1 <> 1) Then
        sep = sep & "xw,AX"
        ti = get_var_offset(op1)
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)
        
        
        GoTo continue_with_make_instruction
    End If
    
    b_IS_rb_OP1 = IIf(is_rb(op1) <> -1, True, False)
    b_IS_ib_OP2 = is_ib(op2)
        
    ' #400B26_bug1.asm# ' If b_IS_rb_OP1 And b_IS_ib_OP2 Then
     If b_IS_rb_OP1 And b_IS_ib_OP2 And (b_IS_VAR_OP2 = False) Then ' #400B26_bug1.asm#
        sep = sep & "rb,ib"
        ti = evalExpr(op2)
        GoTo continue_with_make_instruction
    End If
        
        
    If b_IS_rb_OP1 And is_eb(op2) <> -1 Then
        sep = sep & "rb,eb"
        tTab = op1
        tRow = op2
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op2)
        
        
        GoTo continue_with_make_instruction
    End If
    
    b_IS_iw_OP2 = is_iw(op2)  ' just marking #1189 - no changes here!
    b_IS_rw_OP1 = IIf(is_rw(op1) <> -1, True, False)
    
    If b_IS_rw_OP1 And b_IS_iw_OP2 Then
        sep = sep & "rw,iw"
        ti = evalExpr(op2)
        ' 1.17
        If bWAS_ERROR_ON_LAST_EVAL_EXPR Then
            bWAS_ERROR_ON_LAST_EVAL_EXPR = False
            frmInfo.addErr currentLINE, cMT("cannot be evaluated:") & " " & Trim(op2), op2    '#1116
            frmInfo.addErr currentLINE, cMT("undefined variable or over 16 bits"), op2
        End If
        
        GoTo continue_with_make_instruction
    End If
    
    If b_IS_rw_OP1 And (is_ew(op2) <> -1) Then
do_it_with_eb:
        sep = sep & "rw,ew"
        tTab = op1
        tRow = op2
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op2)
        
        GoTo continue_with_make_instruction
    End If
    
    
try_again_1194:     ' all above skipped, because op1 is not one of them when it is [...]
    
       
       
    
    b_IS_eb_OP1 = IIf(is_eb(op1) <> -1, True, False)
    
    If b_IS_eb_OP1 And b_IS_ib_OP2 Then
        sep = sep & "eb,ib"
        ti = evalExpr(op2)
        tRow = op1
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)
        
        GoTo continue_with_make_instruction
    End If
    
    
 
    b_IS_ew_OP1 = IIf(is_ew(op1) <> -1, True, False)
' #400b14-BUG1# ' do_as_if_ew:
        
        
    If b_IS_ew_OP1 And b_IS_iw_OP2 Then
        sep = sep & "ew,iw"
        tRow = op1
        ti = evalExpr(op2)
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)
        
    ElseIf b_IS_eb_OP1 And is_rb(op2) <> -1 Then
        sep = sep & "eb,rb"
        tTab = op2
        tRow = op1
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)
        
    ElseIf b_IS_ew_OP1 And op2u = "CS" Then
        sep = sep & "ew,CS"
        tRow = op1
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)

    ElseIf b_IS_ew_OP1 And op2u = "DS" Then
        sep = sep & "ew,DS"
        tRow = op1
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)
        
    ElseIf b_IS_ew_OP1 And op2u = "ES" Then
        sep = sep & "ew,ES"
        tRow = op1
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)
        
    ElseIf b_IS_ew_OP1 And op2u = "SS" Then
        sep = sep & "ew,SS"
        tRow = op1
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)
        
    ElseIf b_IS_ew_OP1 And b_IS_rw_OP2 Then
        sep = sep & "ew,rw"
        tTab = op2
        tRow = op1
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op1)
    
    ElseIf is_iw(op1) Then '#1194. automatically convert:  mov 4, al  to mov [4], al    and   mov 4, ax as well...
        op1 = "[" & evalExpr(op1) & "]"
        If bWAS_ERROR_ON_LAST_EVAL_EXPR Then
            bWAS_ERROR_ON_LAST_EVAL_EXPR = False
            frmInfo.addErr currentLINE, cMT("first operand must be a register or a memory location"), op1
        End If
        GoTo try_again_1194
        
        
        
        
    ' #400b14-BUG1#
    ' adding a few more accourinces....
    ElseIf STRICT_SYNTAX = False Then
        If b_IS_ew_OP1 And is_rb(op2) <> -1 Then
            sep = sep & "eb,rb"
            tTab = op2
            tRow = op1
            ' add prefix if required before current command:
            add_seg_prefix_if_required (op1)
        ElseIf b_IS_eb_OP1 And b_IS_rw_OP2 Then
            sep = sep & "ew,rw"
            tTab = op2
            tRow = op1
            ' add prefix if required before current command:
            add_seg_prefix_if_required (op1)
        ElseIf b_IS_rb_OP1 And is_ew(op2) <> -1 Then
            sep = sep & "rb,eb"
            tTab = op1
            tRow = op2
            ' add prefix if required before current command:
            add_seg_prefix_if_required (op2)
        Else
            GoTo else_else_else
        End If
        
        
        
        
    Else
else_else_else:
        
        ' IF GETS HERE, THAN NOTHING MATCHED...
        
        
        ' TRY TO FIX IF SYNTAX IS NOT STRICT:
        ' #400b3-bug-syntax#
        If Not STRICT_SYNTAX Then
            If lAVOID_ETERNAL_LOOP < 10 Then
                lAVOID_ETERNAL_LOOP = lAVOID_ETERNAL_LOOP + 1
                 
                If b_IS_rw_OP1 And (is_eb(op2) <> -1) Then
                     GoTo do_it_with_eb
                End If
' #400b14-BUG1#
' mov a, 1246
' a db 4
''''                If Not b_IS_ew_OP1 Then
''''                    If (is_eb(op1) <> -1) Then
''''                        b_IS_ew_OP1 = True
''''                        GoTo do_as_if_ew
''''                    End If
''''                End If
            End If
        End If
        
        
        
        
        frmInfo.addErr currentLINE, cMT("wrong parameters:") & " MOV " & params, params
        Debug.Print "op1:" & op1, "op2:" & op2
        frmMain.bCOMPILING = False ' 1.23#202
        check_operands_match op1, op2
        Exit Sub
    End If
    
' 1.23#258
continue_with_make_instruction:

    make_2op_INSTRUCTION sep, op1, op2, ti, tRow, tTab

End Sub









' this sub mostly used to compile 2 operand instructions,
' but also used for DEC/INC etc...
Sub make_2op_INSTRUCTION(ByRef sProt As String, ByRef op1 As String, ByRef op2 As String, ByRef ti As Integer, ByRef tRow As String, ByRef tTab As String)
    Dim s2 As String
    Dim i As Integer
    Dim cINDEX As Integer     ' size of command in bytes (1, 2, 3, 4, or 5)
    ' 1.21 Dim sTemp As String
    Dim tNumber As Integer
    Dim sDigit As String
    Dim cmd(0 To 5) As Byte     ' output command
    
    Dim iTemp1 As Integer ' 1.21
    
    Dim opLINE As Integer
    Dim bOPCODE3_USED As Boolean    ' used for '+'.
    
    bOPCODE3_USED = False
    
    
    cINDEX = 0  ' grows when command size grows, final size
                ' is size of the command.
        
    
    opLINE = -1
    For i = 0 To compDAT_OPCODE_MAX ' 1.23#230  frmDat.lst_opNames.ListCount
       ' 1.23#230  If (StrComp(frmDat.lst_opNames.List(i), SP, vbTextCompare) = 0) Then
         If (StrComp(compDAT_OP_NAMES(i), sProt, vbTextCompare) = 0) Then
            opLINE = i
            Exit For
        End If
    Next i
    

    ' I'm not sure if this error is possible at all....
    If (opLINE = -1) Then
        frmInfo.addErr currentLINE, "not found in symbol table:" & " " & sProt, sProt
        Exit Sub
    End If
                
                
        ' get first command byte:
        ' 1.23#230 s2 = frmDat.lst_Opcodes1.List(opLINE)
        s2 = compDAT_OPCODES_1(opLINE)
         
        If Mid(s2, 2, 1) = "r" Then
            'there is only one command that has such syntax (for the moment):
            '   9r          XCHG AX,rw
            '   9r          XCHG rw,AX
            Mid(s2, 2, 1) = ti   ' insert number instead of "r".
        End If
                
        cmd(cINDEX) = Val("&H" & s2)
        cINDEX = cINDEX + 1
                
        ' check if last char was "+":
        'If c = "+" Then
        ' 1.23#230 If frmDat.lst_OpcPLUS.List(opLINE) = "+" Then
        If compDAT_OpcPLUS(opLINE) = True Then
            ' in table, if there is an operand added,
            ' it's always the first one:
            
            ' 1.23#230 If (frmDat.lst_Opcodes2.List(opLINE) = "rw") Then
            If (compDAT_OPCODES_2(opLINE) = "rw") Then
                cmd(0) = cmd(0) + is_rw(op1)
            Else ' it could be 'rw' or 'rb' (nothing else)
                cmd(0) = cmd(0) + is_rb(op1)
            End If
            
            ' second opcode already used, so use third:
            ' 1.23#230 s2 = frmDat.lst_Opcodes3.List(opLINE)
            s2 = compDAT_OPCODES_3(opLINE)
            bOPCODE3_USED = True
        Else
            ' 1.23#230 s2 = frmDat.lst_Opcodes2.List(opLINE)
             s2 = compDAT_OPCODES_2(opLINE)
        End If
            


        If s2 = "iw" Then
            cmd(cINDEX) = math_get_low_byte_of_word(ti)
            cINDEX = cINDEX + 1
            cmd(cINDEX) = math_get_high_byte_of_word(ti)
            cINDEX = cINDEX + 1
        ElseIf s2 = "ib" Then
            cmd(cINDEX) = to_unsigned_byte(ti) ' 1.04 - bug fix: "MOV AL, -15"
            cINDEX = cINDEX + 1
        ElseIf s2 = "/r" Then
                
                If is_var(tRow) Then
                    ' EA byte:
                    cmd(cINDEX) = getTableEA_byte(tTab, "d16 (simple var)")
                    cINDEX = cINDEX + 1
                    ' 16d:
                    iTemp1 = get_var_offset(tRow)
                    cmd(cINDEX) = math_get_low_byte_of_word(iTemp1)
                    cINDEX = cINDEX + 1
                    cmd(cINDEX) = math_get_high_byte_of_word(iTemp1)
                    cINDEX = cINDEX + 1
                ElseIf is_rw(tRow) <> -1 Then
                    ' EA byte:
                    cmd(cINDEX) = getTableEA_byte(tTab, "ew=" & UCase(tRow))
                    cINDEX = cINDEX + 1
                ElseIf is_rb(tRow) <> -1 Then
                    ' EA byte:
                    cmd(cINDEX) = getTableEA_byte(tTab, "eb=" & UCase(tRow))
                    cINDEX = cINDEX + 1
                Else
                    Dim sTempgEA As String           ' 2.03#523b
                    sTempgEA = makeGeneralEA(tRow)
                    ' EA byte:
                    cmd(cINDEX) = getTableEA_byte(tTab, sTempgEA)
                    cINDEX = cINDEX + 1
                    
                    ' ++++ get last d8/d16 +++++++
                    tNumber = evalExpr(tRow)
                    ' 2.03#523b - "OR" added:
                    If (tNumber <> 0) Or (sTempgEA = "[BP] + d8") Then
                        If is_signed_ib(tNumber) Then
                            cmd(cINDEX) = to_unsigned_byte(tNumber)
                            cINDEX = cINDEX + 1
                        Else
                            cmd(cINDEX) = math_get_low_byte_of_word(tNumber)
                            cINDEX = cINDEX + 1
                            cmd(cINDEX) = math_get_high_byte_of_word(tNumber)
                            cINDEX = cINDEX + 1
                        End If
                    End If
                    'Debug.Print "-/r--> " & tRow
                    '++++++++++++++++++++++++++++
                End If
                                
        ElseIf s2 Like "/?" Then
            
            ' *** this code used in several other subs: ***
            
            sDigit = Mid(s2, 2, 1) ' get digit.

            If is_var(tRow) Then
                ' EA byte:
                cmd(cINDEX) = getTableEA_byte(sDigit, "d16 (simple var)")
                cINDEX = cINDEX + 1
                ' 16d:
                iTemp1 = get_var_offset(tRow)
                cmd(cINDEX) = math_get_low_byte_of_word(iTemp1)
                cINDEX = cINDEX + 1
                cmd(cINDEX) = math_get_high_byte_of_word(iTemp1)
                cINDEX = cINDEX + 1
            ElseIf is_rw(tRow) <> -1 Then
                cmd(cINDEX) = getTableEA_byte(sDigit, "ew=" & UCase(tRow))
                cINDEX = cINDEX + 1
            ElseIf is_rb(tRow) <> -1 Then   ' I think it's never used in MOV.
                ' EA byte:
                cmd(cINDEX) = getTableEA_byte(sDigit, "eb=" & UCase(tRow))
                cINDEX = cINDEX + 1
            Else
                'Debug.Print "ooo   " & sDigit & "   " & tRow
                
               ' #1093 fix of MOV [BP],100
               ' because generalEA is "[BP] + d8"
                Dim sGeneralEA As String
                sGeneralEA = makeGeneralEA(tRow)
                
                cmd(cINDEX) = getTableEA_byte(sDigit, sGeneralEA)
                cINDEX = cINDEX + 1
                
                
 
                
                ' ++++ get last d8/d16 +++++++
                tNumber = evalExpr(tRow)
                ' #1093 If tNumber <> 0 Then
                If tNumber <> 0 Or sGeneralEA = "[BP] + d8" Then
                    If is_signed_ib(tNumber) Then
                        cmd(cINDEX) = to_unsigned_byte(tNumber)
                        cINDEX = cINDEX + 1
                    Else
                        cmd(cINDEX) = math_get_low_byte_of_word(tNumber)
                        cINDEX = cINDEX + 1
                        cmd(cINDEX) = math_get_high_byte_of_word(tNumber)
                        cINDEX = cINDEX + 1
                    End If
                End If
                'Debug.Print "-/?--> " & tRow
                '++++++++++++++++++++++++++++
                
                
            End If
            
        End If
        
           
   

'++++++++++  get last command byte (if exist)
    If (Not bOPCODE3_USED) _
       And (compDAT_OPCODES_3(opLINE) <> "") Then     ' 1.23#230  And (frmDat.lst_Opcodes3.List(opLINE) <> "") Then
       ' 1.23#230 s2 = frmDat.lst_Opcodes3.List(opLINE)
        s2 = compDAT_OPCODES_3(opLINE)
    
        If s2 = "ib" Then
                cmd(cINDEX) = to_unsigned_byte(ti)
                cINDEX = cINDEX + 1
        ElseIf s2 = "iw" Then
                cmd(cINDEX) = math_get_low_byte_of_word(ti)
                cINDEX = cINDEX + 1
                cmd(cINDEX) = math_get_high_byte_of_word(ti)
                cINDEX = cINDEX + 1
        End If

    End If


'++++++++++


    ' update location counter:
    locationCounter = locationCounter + cINDEX
    
    
''''    Dim tempS As String
''''    tempS = ""
''''
''''    For i = 0 To cINDEX - 1
''''        tempS = tempS & make_min_len(Hex(cmd(i)), 2, "0")
''''    Next i
''''    frmMain.lst_Out.AddItem tempS
    
    '1.23#241
    For i = 0 To cINDEX - 1
        add_to_arrOUT cmd(i)
    Next i
        
    
    ' check if there is a segment in second parameter:
    If contains_SEGMENT_NAME(op2) Then  ' check if segment is inside the string.
        set_RELOCATION
    End If
    
End Sub



 Sub compile_LEA(ByVal params As String)
    Dim op1 As String
    Dim op2 As String
    Dim tTab As String
    Dim tRow As String
    Dim SP As String ' Search Prototype
    
    
    
    params = Mid(params, 4) ' skip "LEA"

    ' assumed that TABs already replaced by spaces.

    op1 = Trim(getNewToken(params, 0, ",")) ' until ","
        
    op2 = Trim(getNewToken(params, 1, ",", True)) ' until end of line.

    ' replace any strings in operand to numbers:
    op2 = replace_str_if_any(op2)

    If op1 = Chr(10) Or op2 = Chr(10) Then
        frmInfo.addErr currentLINE, cMT("not enough operands for") & " LEA", "lea"
    End If
    
    
    tRow = ""
    tTab = ""
    
    SP = "LEA "
    
    
    If contains_SEGMENT_NAME(op2) Then ' check if segment is inside the string.
    
        ' replace it with MOV !!!
        compile_MOV ("MOV " & op1 & "," & op2)
        Exit Sub
    
    ElseIf (is_rw(op1) <> -1) And is_var(op2) Then

        ' replace it with MOV !!!
        compile_MOV ("MOV " & op1 & "," & get_var_offset(op2))
        Exit Sub
        
    ' #327xp-always-match#  here it is required!
    ElseIf (is_rw(op1) <> -1) And is_m(op2) Then  ' #327xp-always-match# ' is_mw(op2) Then
        SP = SP & "rw,m"
        tTab = op1
        tRow = op2
        ' add prefix if required before current command:
        add_seg_prefix_if_required (op2)
   
   
   
   
    ' TODO#1007b - 2005-03-04  making it work with "LABEL" directive :)
    ElseIf (is_rw(op1) <> -1) And get_var_size(op2) = "-1" Then
   
        '; this code is now legal:
        ' a:
        '
        ' lea ax, a
        
        ' replace it with MOV !!!
        compile_MOV ("MOV " & op1 & "," & get_var_offset(op2))
        Exit Sub
   
   
   
    ' #327xp-m#
    ElseIf (is_rw(op1) <> -1) And (is_rw(op2) <> -1) Then
        ' replace it with MOV !!!
        compile_MOV ("MOV " & op1 & "," & op2)
        Exit Sub
        
    ' #327xp-m#
    ElseIf (is_rb(op1) <> -1) And (is_rb(op2) <> -1) Then
        ' replace it with MOV !!!
        compile_MOV ("MOV " & op1 & "," & op2)
        Exit Sub
        
   
    Else
        frmInfo.addErr currentLINE, cMT("wrong parameters:") & " LEA " & params, params
        frmMain.bCOMPILING = False ' 1.23#202
        check_operands_match op1, op2 ' #327xp-always-match#  jic.
        Exit Sub
    End If
    
    make_2op_INSTRUCTION SP, op1, op2, 0, tRow, tTab
    
End Sub



' 1.23#256
' this sub doesn't have to be speedy, it's used on error only:
Private Sub check_operands_match(op1 As String, op2 As String)

    Dim sR As String
    Dim sR2 As String ' 3.27xp

    Dim sADVICE As String ' #1068
    sADVICE = ""

    If (is_rb(op1) <> -1) And (is_rw(op2) <> -1) Then

        sR = cMT("8 bit and 16 bit register")

    ElseIf (is_rw(op1) <> -1) And (is_rb(op2) <> -1) Then

        sR = cMT("16 bit and 8 bit register")
        
    ElseIf (is_rw(op1) <> -1) And (is_eb(op2) <> -1) Then

        sR = cMT("16 bit register and 8 bit address")
       '#1189 sADVICE = "possible fix: " & op1 & ", w." & op2
        
    ElseIf (is_eb(op1) <> -1) And (is_rw(op2) <> -1) Then

        sR = cMT("8 bit address and 16 bit register")
      '#1189  sADVICE = "possible fix: w." & op1 & ", " & op2
       
        
    ElseIf (is_rb(op1) <> -1) And (is_ew(op2) <> -1) Then

        sR = cMT("8 bit register and 16 bit address (add 'b.' before parameter)")
      '#1189  sADVICE = "possible fix: " & op1 & ", b." & op2
               
    ElseIf (is_ew(op1) <> -1) And (is_rb(op2) <> -1) Then

        sR = cMT("16 bit address and 8 bit register (add 'b.' before parameter)")
      '#1189  sADVICE = "possible fix: b." & op1 & ", " & op2
        
    ElseIf (is_rb(op1) <> -1) And (is_iw(op2)) Then ' 1.28#388 (Not is_ib(op2)) Then
        sR = cMT("second operand is over 8 bits!")
      
    ElseIf (is_eb(op1) <> -1) And (is_iw(op2)) Then ' 1.28#388 (Not is_ib(op2)) Then
        sR = cMT("second operand is over 8 bits!")
        
    ElseIf (is_s(op1) <> -1) And (is_iw(op2)) Then ' works as ib() also!
        sR = cMT("cannot use segment register with an immediate value")
        GoTo irregular_op
        
    ElseIf (is_s(op1) <> -1) And (is_s(op2) <> -1) Then
        sR = cMT("segment registers cannot go together!")
        GoTo irregular_op
        
    ElseIf UCase(op1) = "CS" Then
        sR = cMT("CS cannot be modified directly (use far JMP or CALL)")
        GoTo irregular_op
        
    ElseIf UCase(op1) = "IP" Then
        sR = cMT("IP cannot be modified directly (use JMP or CALL)")
        GoTo irregular_op
        
    ElseIf UCase(op2) = "IP" Then
        sR = cMT("cannot get value of IP register (use POP after CALL)")
        GoTo irregular_op
        
    ElseIf (is_s(op1) <> -1) Or (is_s(op2) <> -1) Then
        sR = cMT("wrong use of segment register")
        GoTo irregular_op
    
    ElseIf is_iw(op1) Then ' works as ib() also!
        sR = cMT("first operand cannot be an immediate value")
        GoTo irregular_op
    
    
    ' 1.30#428
    ElseIf (is_ew(op1) <> -1) And (is_ew(op2) <> -1) Then
        sR2 = "mem to mem"
        GoTo irregular_op
    ElseIf (is_eb(op1) <> -1) And (is_eb(op2) <> -1) Then
        sR2 = "mem to mem"
        GoTo irregular_op
    ElseIf (is_eb(op1) <> -1) And (is_ew(op2) <> -1) Then
        sR2 = "mem to mem"
        GoTo irregular_op
    ElseIf (is_ew(op1) <> -1) And (is_eb(op2) <> -1) Then
        sR2 = "mem to mem"
        GoTo irregular_op
        
        
    
    ' 1.28#388
    ElseIf (Not is_immediate(op1, False, iRADIX)) And (is_rw(op1) = -1) And (is_rb(op1) = -1) And (Not is_var(op1)) Then
        sR = cMT("probably it's an undefined var:") & " " & op1
        GoTo irregular_op
        
    ' 1.28#388
    ElseIf (Not is_immediate(op2, False, iRADIX)) And (is_rw(op2) = -1) And (is_rb(op2) = -1) And (Not is_var(op2)) Then
    
        If Len(op2) > 0 And Trim(op2) <> vbCr And Trim(op2) <> vbLf And Trim(op2) <> vbTab Then  ' 4.00-Beta-9    redundat error for:   "mov ax"
            sR = cMT("probably no zero prefix for hex; or no 'h' suffix; or wrong addressing; or undefined var:") & " " & op2
            GoTo irregular_op
        End If

            
        
    
    
    Else
        
        sR = ""
        sR2 = ""
        
    End If

    
    If Len(sR) > 0 Then
        frmInfo.addErr currentLINE, cMT("operands do not match:") & " " & sR & " ", op1
        
        If Len(sADVICE) > 0 Then ' #1068
             frmInfo.addErr currentLINE, sADVICE, op1
        End If
        
    End If
    
    
    If sR2 = "mem to mem" Then
        frmInfo.addErr currentLINE, cMT("memory to memory is not allowed for 8086:") & " " & sR & " ", op1
        frmInfo.addErr currentLINE, cMT("use general register to hold intermediate result."), op1
    End If
    
    
    
    Exit Sub
    
irregular_op:
    frmInfo.addErr currentLINE, sR & " ", op1

    
End Sub

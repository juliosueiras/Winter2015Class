Attribute VB_Name = "mCodeSelector"

'

'

'





Option Explicit


' #400b20-explain-exe-header#
Global sEXE_HEADER_EXPLANATIONS As String


' 1.04

' keeps the name of the executable file loaded in
' L2LC array (can have .COM or .EXE extention):
Global sDEBUGED_file As String



'**************************************
'Windows API/Global Declarations for :Ad
'     d Horizontal Scrollbar to Listbox
'**************************************
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Global Const LB_SETHORIZONTALEXTENT = &H194


Type LineToLocCounter
    ' position in source (txtInput) of current line:
    CharStart As Long
    CharLen As Long
    
    ' original line number
    '   (immediately lst_Source after copy from txtInput)
    ' b_lineNumber As Long
    ' (not required since array index is a line number)
    
    ' first and last lines of original expanded line
    '  as in lst_Source and lst_Precompiled:
    LineStarting As Long
    LineStoping As Long
    
    ' location counter for the line:
    ByteFirst As Long
    ByteLast As Long
End Type

' 1.20
' L2LC is used both for selecting original source
' while executing, and to select error lines
' on compile!

Global L2LC() As LineToLocCounter


' can use this for debug, sometime:
'  = "CharStart: " & L2LC(i).CharStart & vbNewLine & _
'                 "CharLen: " & L2LC(i).CharLen & vbNewLine & _
'                 "LineStarting:" & L2LC(i).LineStarting & vbNewLine & _
'                 "LineStoping: " & L2LC(i).LineStoping & vbNewLine & _
'                 "ByteFirst: " & Hex(L2LC(i).ByteFirst) & "h" & vbNewLine & _
'                 "ByteLast: " & Hex(L2LC(i).ByteLast) & "h"
'



' 1.20 major update#155
Sub expand_Lines(curLine As Long, UntilLine As Long)
    Dim i As Long
    Dim j As Long
    Dim ST As Long
    
    j = -1
        
    For i = 0 To UBound(L2LC)
           If L2LC(i).LineStarting <= curLine And L2LC(i).LineStoping >= curLine Then
                
                ST = UntilLine - curLine
                L2LC(i).LineStoping = L2LC(i).LineStoping + ST
                j = i + 1
                             
                Exit For    ' no need to continue.
                
           End If
    Next i
    

    If j <> -1 Then
        ' all other lines located below current line should
        ' also move the same step ahead:
        For i = j To UBound(L2LC)
           L2LC(i).LineStarting = L2LC(i).LineStarting + ST
           L2LC(i).LineStoping = L2LC(i).LineStoping + ST
        Next i
    Else
        Debug.Print "cannot expand_Lines: " & curLine, UntilLine
    End If
End Sub

' 1.04
 Sub updateByteFirst(curLine As Long, locCounter As Long)
    Dim i As Long
    
    For i = 0 To UBound(L2LC)
        If L2LC(i).LineStarting = curLine Then
            L2LC(i).ByteFirst = locCounter
            Exit Sub ' NO NEED TO CONTINUE.
        End If
    Next i

End Sub

' 1.04
 Sub updateByteLast(curLine As Long, locCounter As Long)
    Dim i As Long
    
    For i = 0 To UBound(L2LC)
        If curLine >= L2LC(i).LineStarting And curLine <= L2LC(i).LineStoping Then
            L2LC(i).ByteLast = locCounter
            Exit Sub ' NO NEED TO CONTINUE.
        End If
    Next i

End Sub

' when bHighlight=True -
'    the line is highlighted (made yellow)
' when bHighlight=False -
'    the line is selected (inverted).
Sub selectSourceLineAtLocation(ByRef locCounter As Long, bHighlight As Boolean)
On Error GoTo error_selecting
    
' If decided to uncomment change parameter to "BYVAL"!!!
' NOT REQUIRED!!!! since it's already updated when
' added to L2LC array!!!
'    ' in case with COM file, 100h prefix should be
'    ' removed:
'    If frmEmulation.bCOM_LOADED Then
'       locCounter = locCounter - &H100
'    End If

    If sDEBUGED_file = "" Then Exit Sub ' nothing to select!


    If bCOMPILE_ALL_SILENT Then Exit Sub ' #400b8-fast-examples-check#


'''    If frmEmulation.Visible And (Not frmOrigCode.Visible) Then '#1135 modification.
'''        If frmInfo.Visible = False Then ' do not show right after the compilation!
'''            frmOrigCode.DoShowMe
'''        End If
'''    End If
    
    

''''    Dim lLine As Long
''''
''''    ' 1.20 updated to function:
''''    lLine = getLine_Number_from_LocCounter(locCounter)
''''    If lLine >= 0 Then
''''        ' frmOrigCode.lstInput.ListIndex = lLine
''''        ' not required' frmOrigCode.cmaxActualSource.HighlightedLine = -1 ' If -1, the current highlighting line is unhighlighted.
''''        If bHighlight Then
''''            If (Not bRun_UNTIL_SELECTED) And (Not bDO_STEP_OVER_PROCEDURE) Then  ' 1.23#275  ' 1.24#278
''''                frmOrigCode.cmaxActualSource.SetCaretPos lLine, 0
''''            End If
''''            frmOrigCode.cmaxActualSource.HighlightedLine = lLine
''''
''''            ' 1.24#278
''''            If bDO_STOP_AT_LINE_HIGHLIGHT_CHANGE Then
''''                If lLine <> lSTOP_AT_LINE_HIGHLIGHT_CHANGE Then
''''                    frmEmulation.chkAutoStep.Value = vbUnchecked
''''                    bDO_STOP_AT_LINE_HIGHLIGHT_CHANGE = False
''''                End If
''''            End If
''''
''''        Else
''''            frmOrigCode.cmaxActualSource.SelectLine lLine, True
''''        End If
''''    Else '#1095j
''''        If bSTEPPING_BACK Then
''''            frmOrigCode.cmaxActualSource.HighlightedLine = -1 '#1095j
''''        End If
''''    End If


    Exit Sub
error_selecting:
    Debug.Print "Error on selectNextLineToBeExecuted(" & locCounter & ") - " & LCase(Err.Description)
End Sub

' 1.20
Function getLine_Number_from_LocCounter(ByRef locCounter As Long) As Long
    Dim i As Long
    
    For i = 0 To UBound(L2LC)
        If L2LC(i).ByteFirst <> -1 Then
            If locCounter >= L2LC(i).ByteFirst Then
                If locCounter <= L2LC(i).ByteLast Then
                    getLine_Number_from_LocCounter = i
                    Exit Function ' NO NEED TO CONTINUE.
                End If
            End If
        End If
    Next i
    
    ' not found!
    getLine_Number_from_LocCounter = -1
    
End Function


' 1.20
Function get_Starting_Line(ByRef lLine As Long) As Long
On Error GoTo err_gsl

    Dim i As Long

    ' index of L2LC() is an original line number is
    ' source.

    For i = 0 To UBound(L2LC)
        If L2LC(i).LineStarting <> -1 Then
            If L2LC(i).LineStarting <= lLine Then
                If L2LC(i).LineStoping >= lLine Then
                    get_Starting_Line = i
                    Exit Function ' NO NEED TO CONTINUE.
                End If
            End If
        End If
    Next i
    
    ' not found!
    get_Starting_Line = -1
    
    
    Exit Function
err_gsl:
    Debug.Print "get_Starting_Line: " & lLine & ": " & LCase(Err.Description)
    
    ' not found!
    get_Starting_Line = -1
    
End Function


'Sub selectErrorLine(ByRef lLineNum As Long, sCAUSE As String)  '#1157c
'On Error GoTo error_selecting_err_line
'
'    Dim lCurrentlySelecting As Long ' #1157c need to know what we set.
'
'    'If (lLineNum - frmMain.txtInput.LineNumberStart) < 0 Then Exit Sub ' 2005-05-08  ' + 3.27xo
'    If (lLineNum) < 0 Then Exit Sub ' 20140414
'
'
'    ' #327xn-new-dot-stack-cancel-1050h# '' had to do this for  #1050h when short definitions are used
'    ' If lLineNum - frmMain.txtInput.LineNumberStart >= frmMain.txtInput.lineCount Then
'     If lLineNum - frmMain.txtInput.LineNumberStart >= frmMain.txtInput.lineCount Then
'        lCurrentlySelecting = frmMain.txtInput.lineCount - 1 ' #327xn-new-dot-stack-cancel-1050h# ' - 2
'        frmMain.txtInput.SelectLine lCurrentlySelecting, True
'    Else
'        ' 1.23 frmMain.txtInput.SelStart = L2LC(lLineNum).CharStart
'        ' 1.23 frmMain.txtInput.SelLength = L2LC(lLineNum).CharLen
'        lCurrentlySelecting = lLineNum - frmMain.txtInput.LineNumberStart
'        frmMain.txtInput.SelectLine lCurrentlySelecting, True
'    End If
'
'
'
'    '#1157c -========================
'    '        ok now major correction if sCAUSE<>"" and it's not in the selected line!
'
'    ' #327xn-new-dot-stack# ' If (lLINE_NUMBER_CORRECTION_FOR_ERRORS <> 0) Or (lCurrentlySelecting = 0) Then ' currently I want to test it with short definitions only!
'    If lCurrentlySelecting = 0 Then
'        Dim sCheckLine As String
'        If Len(sCAUSE) > 0 Then
'            sCheckLine = frmMain.txtInput.getLine(lCurrentlySelecting)
'            If InStr(1, sCheckLine, sCAUSE, vbTextCompare) > 0 Then
'                ' ok! good selection!
'            Else ' ....
'
'                ' probably selected wrong line....
'                Debug.Print "NOT FOUND ON SELECTED LINE: " & sCAUSE
'                Debug.Print " SEARCHING...."
'
'                ' start the search!
'                Dim lTLineCounter As Long
'
'                For lTLineCounter = 0 To frmMain.txtInput.lineCount - 1
'
'                    sCheckLine = frmMain.txtInput.getLine(lTLineCounter)
'                    If InStr(1, sCheckLine, sCAUSE, vbTextCompare) > 0 Then
'                        ' found something!
'                        frmMain.txtInput.SelectLine lTLineCounter, True
'
'                        Debug.Print "FOUND! wrong line:" & lCurrentlySelecting & ", right (better) line:" & lTLineCounter
'
'                        Exit For  ' !!!
'
'                    End If
'
'                Next lTLineCounter
'                '' if not found, leave as it is...
'                Debug.Print "not found!"
'            End If
'        End If
'    End If
'
'    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
'
'    Exit Sub
'error_selecting_err_line:
'    Debug.Print "selectErrorLine(" & lLineNum & ") - " & LCase(Err.Description)
'End Sub
'
' #327xm-listing#
Function get_formated_machine_code(lFirstByte As Long, lLastByte As Long) As String

On Error GoTo err1

    Dim i As Long
    Dim s As String
    Dim sLine As String
    Dim sRET As String
    Dim iByteOnLineCount As Integer
    Dim lLineCount As Long
    
    s = ""
    sLine = ""
    sRET = ""
    iByteOnLineCount = 0
    lLineCount = 0

    Dim lOrgCor As Long
    If frmMain.lCORRECT_TO_ORG >= 0 Then
        lOrgCor = frmMain.lCORRECT_TO_ORG
    Else
        lOrgCor = 0
    End If


    If lLastByte >= lFirstByte Then ' I'm not sure yet why it happens for the ".code" statement... but from another point of view having location there isn't that bad ;)
        ' sRet = "0C 0C 0C 0C 0C 0C 0C 0C 0C 0C 0C 0C"
        ' sRet = make_min_len_RIGHT("from " & lFirstByte & "   to " & lLastByte, 36, " ")
        
        
        
        'If lFirstByte > 0 Then  ' NO NO NO!

            For i = lFirstByte To lLastByte ' inclusive
                s = make_min_len(Hex(arrOUT(i - lOrgCor)), 2, "0")
                sLine = sLine & s & " "
                iByteOnLineCount = iByteOnLineCount + 1
                If iByteOnLineCount = 12 Then
                    If lLineCount = 0 Then
                        sRET = sLine
                    Else
                        sRET = sRET & vbNewLine & String(16, " ") & sLine
                    End If
                    sLine = ""
                    lLineCount = lLineCount + 1
                    iByteOnLineCount = 0
                End If
            Next i
            
        'Else
        '   sRet = "?" & String(35, " ")
        'End If
        
    Else
        sRET = String(35, " ")
    End If
    
    If iByteOnLineCount < 12 Then ' unfinished line...
        If lLineCount = 0 Then
            sRET = make_min_len_RIGHT(sLine, 36, " ")
        Else
            sRET = sRET & vbNewLine & String(16, " ") & make_min_len_RIGHT(sLine, 36, " ")
        End If
    End If
    
    get_formated_machine_code = sRET
    
    Exit Function
    
err1:
    get_formated_machine_code = "??" & String(34, " ")
    Debug.Print "get_formated_machine_code: " & Err.Description
    
End Function

' 20140415 ".debug" file not created.
Sub SaveDebugInfoFile_AND_LISTING(sFilename As String, bSAVE_LISTING As Boolean)  ' #327xm-listing#

On Error Resume Next

'On Error GoTo error_save_deb
'    Dim fNum As Integer
'    Dim i   As Long
'    Dim s As String ' 3.27xm
'
'    s = sFilename & ".debug" ' adding ".debug" extention:
'
'    fNum = FreeFile
'
'    Open s For Random Shared As fNum Len = Len(L2LC(0))
'        For i = 0 To UBound(L2LC)
'            Put #fNum, , L2LC(i)
'        Next i
'    Close fNum
    
    

    
    ' #327xm-listing#
    If bSAVE_LISTING Then
        save_LISTING sFilename
    End If
        
'
'
'
'
'    Exit Sub
'error_save_deb:
'    Debug.Print "Error on SaveDebugInfoFile(" & s & ") - " & LCase(Err.Description)
End Sub


' #327xm-listing#
Sub save_LISTING(sFilename As String)

On Error GoTo err1

        Dim fNum As Integer
        Dim s As String
        Dim i   As Long
        
        Dim sLOC_COUNTER As String
        Dim sMACHINE_CODE As String
        
        Dim sFile As String
        sFile = sFilename & ".list.txt"
        
        If FileExists(sFile) Then
            DELETE_FILE sFile
        End If
        
        fNum = FreeFile
        
        Open sFile For Output Shared As fNum
        
        

        
        
        
        s = "EMU8086 GENERATED LISTING. MACHINE CODE <- SOURCE."
        Print #fNum, s
        
        s = " "
        Print #fNum, s
        
        ' #400b3-symbol-table# filename added
        s = ExtractFileName(CutExtension(sFile)) & " -- emu8086 assembler version: " & App.Major & "." & App.Minor & App.Revision & sVER_SFX & "  "
        Print #fNum, s
        
        s = " "
        Print #fNum, s
        
        s = "[ " & Date & "  --  " & Time & " ] "
        Print #fNum, s
        
        s = " "
        Print #fNum, s
        
        
''''        ' #BUG-short-def-2233-tempfix#
''''        If lLINE_NUMBER_CORRECTION_FOR_ERRORS <> 0 Then
''''
''''            s = " "
''''            Print #fNum, s
''''
''''            s = " "
''''            Print #fNum, s
''''
''''            s = " "
''''            Print #fNum, s
''''
''''            s = " "
''''            Print #fNum, s
''''
''''
''''            s = " WARNING! THIS IS BETA VERSION OF THE LISTING! "
''''            Print #fNum, s
''''
''''            s = " SHORT DEFINITIONS MAY CAUSE THE MACHINE CODE TO FLOW " & lLINE_NUMBER_CORRECTION_FOR_ERRORS & " LINES DOWN."
''''            Print #fNum, s
''''
''''            s = " "
''''            Print #fNum, s
''''
''''            s = " "
''''            Print #fNum, s
''''
''''            s = " "
''''            Print #fNum, s
''''
''''            s = " "
''''            Print #fNum, s
''''        End If
''''
''''
        
        
        s = "==================================================================================================="
        Print #fNum, s
        
        s = "[LINE]     LOC: MACHINE CODE                          SOURCE"
        Print #fNum, s
        
        s = "==================================================================================================="
        Print #fNum, s
        
        s = " "
        Print #fNum, s
        
            For i = 0 To UBound(L2LC)
                
                'If i > frmMain.txtInput.lineCount Then GoTo DONE_LIST ' smth wrong...
                If i > frmMain.lst_ORIG.ListCount Then GoTo DONE_LIST  ' smth wrong...
                
            
                Dim lT As Long
                lT = L2LC(i).ByteFirst
                If lT <> -1 Then
                    sLOC_COUNTER = make_min_len(Hex(lT), 4, "0")
                    sMACHINE_CODE = get_formated_machine_code(L2LC(i).ByteFirst, L2LC(i).ByteLast)
                Else
                    sLOC_COUNTER = String(4, " ")
                    sMACHINE_CODE = String(36, " ")
                End If
                
                '  #327xn-list-start-with-1#:  "+ frmMain.txtInput.LineNumberStart"
                's = "[" & make_min_len(CStr(i + frmMain.txtInput.LineNumberStart), 4, " ") & "]" & "    " & sLOC_COUNTER & ": "
                s = "[" & make_min_len(CStr(i), 4, " ") & "]" & "    " & sLOC_COUNTER & ": "
                
                If InStr(1, sMACHINE_CODE, vbNewLine) > 0 Then
                    Dim ST As String
                    ST = sMACHINE_CODE
                    'ST = Replace(ST, vbNewLine, "  " & Trim(frmMain.txtInput.getLine(i)) & vbNewLine, 1, 1) ' replace the first one!
                    ST = Replace(ST, vbNewLine, "  " & Trim(frmMain.lst_ORIG.List(i)) & vbNewLine, 1, 1)  ' replace the first one!
                    s = s & ST
                Else
                    's = s & sMACHINE_CODE & "  " & Trim(frmMain.txtInput.getLine(i))
                    s = s & sMACHINE_CODE & "  " & Trim(frmMain.lst_ORIG.List(i))
                End If
                
                
                Print #fNum, s
            Next i
DONE_LIST:
        
        s = " "
        Print #fNum, s
        
        s = "==================================================================================================="
        Print #fNum, s
        
        s = " "
        Print #fNum, s
        
        
        ' #400b20-explain-exe-header#
        Print #fNum, sEXE_HEADER_EXPLANATIONS
        Print #fNum, vbNewLine & vbNewLine
        s = "==================================================================================================="
        Print #fNum, s
        
        
        
        Close #fNum
        
        frmInfo.addStatus " "
        frmInfo.addStatus cMT("Listing is saved:") & " """ & ExtractFileName(sFile) & """"
        
        Exit Sub
err1:
        
        
End Sub

'Sub loadDebugInfo(ByVal sFilename As String)
'On Error GoTo error_load_deb
'    Dim fNum As Integer
'    Dim i   As Long
'
'' #2005-07-19 must do something about bug #1135
'' sDEBUGED_file = "hhhhh" ' test!!!!
''
'
'    If sDEBUGED_file <> sFilename Then
'        ' not already loaded, and not just built!
'
'        ' #327xo-av-protect-4#
'        If FileExists(sFilename & ".debug") Then
'            sFilename = sFilename & ".debug" ' adding ".debug" extention. OK!
'        ElseIf FileExists(sFilename & "_.debug") Then
'            ' #400b15-integrate-fasm# ' sFilename = sFilename & "_.debug" ' try this one.... (the executable file could be renamed).
'            sFilename = sFilename & "_.debug" ' #400b15-integrate-fasm#
'        Else
'            ' avoid making an empty file if it's not exist.
'            ' not found...
'            sFilename = sFilename & ".debug" ' (for compatibility, the extension is cut off)
'            GoTo skip_L2LC_load ' #400b15-integrate-fasm# ' no_debug_info
'        End If
'
'
'
'        fNum = FreeFile
'
'        Open sFilename For Random Shared As fNum Len = Len(L2LC(0))
'            i = 0
'            Do While Not EOF(fNum)
'                ReDim Preserve L2LC(0 To i + 1) ' 1.20 "0 To " added.
'                Get #fNum, , L2LC(i)
'                i = i + 1
'            Loop
'        Close fNum
'
'
'skip_L2LC_load: ' #400b15-integrate-fasm#
'
'        ' cut ".com.debug" or ".exe.debug" extension and add ".~asm" (later)
'        ' 1.32#471 from now on cut only ".debug" !!!!!!!
'
'        If load_lstInput(CutExtension(sFilename)) Then  ' #327xo-av-protect-4#  (doesn't seem to be requred here.... jic....)
'            ' cut ".debug" extention:
'            sDEBUGED_file = CutExtension(sFilename)
'        Else
'no_debug_info:
'            sDEBUGED_file = ""
'            '20140515 ok' Debug.Print "No debug file: " & sFilename & ", or no source."
'            'Unload frmOrigCode  ' 1.05
'        End If
'
'    Else
'
'        ' 1.30#413
'        'frmOrigCode.setDefaultCaption
'
'    End If
'
'    Exit Sub
'error_load_deb:
'        Debug.Print "Error on loadDebugInfo(" & sFilename & ") - " & LCase(Err.Description)
'        'Unload frmOrigCode  ' 1.05
'
'End Sub
'
' 1.05 returns "True" on success:
Function load_lstInput(ByVal sFilename As String) As Boolean
On Error GoTo err_load_lstInput
    '--------------------------------
    ' 2.09#571     Dim fNum As Integer
    ' 2.09#571     Dim s As String
    
    load_lstInput = False
    
    
    ' #327xo-av-protect-4#
    '  ' #327xo-av-protect-4#  (doesn't seem to be requred here.... jic....)
    If FileExists(sFilename & ".~asm") Then
       sFilename = sFilename & ".~asm"  ' ok!
    Else
        sFilename = sFilename & "_.~asm"  ' try this one then....
    End If
    
    
    
    
    If Not FileExists(sFilename) Then Exit Function
    
    
        
    ' 2.09#571     fNum = FreeFile
        
    ' 2.09#571     Open sFileName For Input As fNum
                
'    frmOrigCode.cmaxActualSource.Text = ""
'    frmOrigCode.PREPARE_cmaxActualSource
'
   ' 2.09#571      Do While Not EOF(fNum)
    ' 2.09#571         Line Input #fNum, s
    ' 2.09#571         frmOrigCode.cmaxActualSource.AddText s & vbNewLine
    ' 2.09#571     Loop

    ' 2.09#571     Close fNum
    
'    frmOrigCode.cmaxActualSource.OpenFile sFilename ' 2.09#571
'
    '--------------------------------
    
    ' #400b10-impr-orig-source#
    open_ORIG_SOURCE_FOR_EDIT_TOO_IF_ANY sFilename
    
    
    
    ' 1.04
    ' hor. scroll shuold be added
    ' after filling the list:
    ' 1.23 AddHorizontalScroll frmOrigCode.lstInput
    
'    frmOrigCode.Caption = sFilename
'
    load_lstInput = True
    
    Exit Function
err_load_lstInput:
    Debug.Print "Error on load_lstInput(" & sFilename & ") - " & LCase(Err.Description)
End Function

' #400b10-impr-orig-source#
' assumed that sFileName exists.
' loads only if editor is empty.
Sub open_ORIG_SOURCE_FOR_EDIT_TOO_IF_ANY(sFilename As String)
    On Error GoTo err1


    If frmMain.txtInput.Text <> "" Then Exit Sub


    Dim s As String
    
    Dim iFileNum As Integer
    iFileNum = FreeFile
    
    Open sFilename For Input Shared As iFileNum
    ' #400b11-BUG!!!#
    
        Do While Not EOF(iFileNum)
            Line Input #iFileNum, s
            If InStr(1, s, sORIG_SOURCE_TAG) > 0 Then
                Dim sRealOrigSource As String
                sRealOrigSource = Trim(Mid(s, Len(sORIG_SOURCE_TAG)))
                If FileExists(sRealOrigSource) Then
                    frmMain.openSourceFile sRealOrigSource, True, False
                    GoTo okey_dokey
                End If
            End If
        Loop
        
okey_dokey:
    Close iFileNum

Exit Sub
err1:
On Error Resume Next
Debug.Print "unexpected error 5112"
 Close iFileNum

End Sub




' 1.22 #188
' in case user chooses to create a file
' without correct ORG directive, this should
' fix the ".debug" file:
Sub add_val_to_all_ByteFirst_ByteLast(lValue As Long)
Dim i As Long

    For i = 0 To UBound(L2LC)
        If L2LC(i).ByteFirst <> -1 Then
            L2LC(i).ByteFirst = L2LC(i).ByteFirst + lValue
            L2LC(i).ByteLast = L2LC(i).ByteLast + lValue
        End If
    Next i
    
End Sub

' #327xp-erase#
Sub FREE_MEM_CODE_SELECTOR()
On Error GoTo err1
    
    Erase dis_p
    Erase dis_recBuf
    Erase dis_recLocCounter
    Erase L2LC
    
    Exit Sub
err1:
    Debug.Print "codesel free mem:" & Err.Description
End Sub

Attribute VB_Name = "mSYMBOL_TABLE"

'

'

'



' 1.23
' SYMBOL TABLE!

Option Explicit
Option Base 0 ' arrays start at index 0! (seems to be default, but anyway).

' symbol name - offset - size - type - seg
'  0 - name
'  1 - offset
'  2 - size
'  3 - type
'  4 - segment

Type symbolTableRecord
    sName As String
    lOFFSET As Long ' unsigned INT
    iSize As Integer
    sType As String
    sSegment As String
    lLINE_NUMBER As Long ' 2006-12-05 / 2006-12-06   for MASM and for FASM, instead of setting lOFFSET to linenumber when building MASM_build_primary_SymbolTable() or FASM_build_primary_SymbolTable()
End Type

Global primary_symbol_TABLE() As symbolTableRecord
Global secondary_symbol_TABLE() As symbolTableRecord

Global primary_symbol_TABLE_SIZE As Long
Global secondary_symbol_TABLE_SIZE As Long

' 1.29#405
' Symbol table that is loaded from a file,
' used to show variables while emulating.
' it contains variables only!
' some fields will be used for keeping other
' data from those in symbol table:
Type symbolTableRecord_for_Emulation
    sName As String
    lOFFSET As Long ' unsigned INT
    iSize As Integer
    ' NOT USED (since always "VAR")' sType As String
    sSegment As String
    
    ' properties unique to "_for_Emulation" type:
    '#1158 sShowAs As String ' current numbering system for showing the variable (default is "HEX").
    
    iShowAs As Integer ' #1158 - replacing strings
    ' 0 hex
    ' 1 bin
    ' 2 octal
    ' 3 signed
    ' 4 unsigned
    ' 5 ascii
    
    iElements As Integer ' used to show arrays when > 1. (CANNOT BE <1).
End Type
Global vST_for_VARS_WIN() As symbolTableRecord_for_Emulation
Global vST_for_VARS_WIN_SIZE As Integer
' the same but for segments only:
Global vST_SEGMENTS_for_VARS_WIN() As symbolTableRecord
Global vST_SEGMENTS_for_VARS_WIN_SIZE As Integer
' is set to TRUE when frmVars is loaded, FALSE when
' unloaded:
Global b_frmVars_LOADED As Boolean


Sub CLEAR_primary_symbol_TABLE()
    Erase primary_symbol_TABLE
    primary_symbol_TABLE_SIZE = 0
End Sub

Sub CLEAR_secodary_symbol_TABLE()
    Erase secondary_symbol_TABLE
    secondary_symbol_TABLE_SIZE = 0
End Sub

' 2006-12-05 "lLINE_NUMBER As Long" is added to avoid bug and confusion.
Sub add_to_Primary_Symbol_Table(sName As String, lOFFSET As Long, iSize As Integer, sType As String, sSegment As String, Optional lLINE_NUMBER As Long)
  
    ReDim Preserve primary_symbol_TABLE(primary_symbol_TABLE_SIZE + 1)
        
    With primary_symbol_TABLE(primary_symbol_TABLE_SIZE)
        .sName = sName ' #400b18-bug-fasm147# ' UCase(sName)
        .lOFFSET = lOFFSET
        .iSize = iSize
        .sType = sType
        .sSegment = sSegment
        .lLINE_NUMBER = lLINE_NUMBER ' optional 2006-12-05 / 2006-12-06
    End With
    
    primary_symbol_TABLE_SIZE = primary_symbol_TABLE_SIZE + 1
    
    ' Debug.Print "sName: " & sName & " lOFFSET: " & lOFFSET & " iSize:" & iSize & " sType: " & sType & " sSegment: " & sSegment
    
End Sub

Sub add_to_Secondary_Symbol_Table(sName As String, lOFFSET As Long, iSize As Integer, sType As String, sSegment As String)
  
    ReDim Preserve secondary_symbol_TABLE(secondary_symbol_TABLE_SIZE + 1)
        
    With secondary_symbol_TABLE(secondary_symbol_TABLE_SIZE)
        .sName = UCase(sName)
        .lOFFSET = lOFFSET
        .iSize = iSize
        .sType = sType
        .sSegment = sSegment
    End With
    
    secondary_symbol_TABLE_SIZE = secondary_symbol_TABLE_SIZE + 1
    
End Sub


Function symbol_Tables_EQUAL() As Boolean
On Error GoTo err_steq

Dim i As Long

For i = 0 To primary_symbol_TABLE_SIZE - 1

    With primary_symbol_TABLE(i)
        If .sName <> secondary_symbol_TABLE(i).sName Then GoTo not_equal
        If .lOFFSET <> secondary_symbol_TABLE(i).lOFFSET Then GoTo not_equal
        If .iSize <> secondary_symbol_TABLE(i).iSize Then GoTo not_equal
        If .sType <> secondary_symbol_TABLE(i).sType Then GoTo not_equal
        If .sSegment <> secondary_symbol_TABLE(i).sSegment Then GoTo not_equal
    End With
    
Next i

    symbol_Tables_EQUAL = True
    Exit Function
    
not_equal:
    symbol_Tables_EQUAL = False
    
Exit Function
err_steq:
    symbol_Tables_EQUAL = True
    Debug.Print "symbol_Tables_EQUAL: " & LCase(Err.Description)
End Function


Sub copy_Secondary_to_Primary_TABLE()
    
    CLEAR_primary_symbol_TABLE
    
    Dim L As Long
    
    For L = 0 To secondary_symbol_TABLE_SIZE - 1
        With secondary_symbol_TABLE(L)
            add_to_Primary_Symbol_Table .sName, .lOFFSET, .iSize, .sType, .sSegment
        End With
    Next L
    
End Sub




' #400b22-masm_comp400b20.asm#
Sub copy_vST_for_VARS_WIN_and_vST_SEGMENTS_for_VARS_WIN_to_Primary_TABLE()
    
    
    
    CLEAR_primary_symbol_TABLE
    
    
    
    Dim L As Long
    
    
    
    
    For L = 0 To vST_for_VARS_WIN_SIZE - 1
        With vST_for_VARS_WIN(L)
            add_to_Primary_Symbol_Table .sName, .lOFFSET, .iSize, "VAR", .sSegment
        End With
    Next L
    
    
    
    For L = 0 To vST_SEGMENTS_for_VARS_WIN_SIZE - 1
        With vST_SEGMENTS_for_VARS_WIN(L)
            add_to_Primary_Symbol_Table .sName, .lOFFSET, .iSize, "SEGMENT", .sSegment
        End With
    Next L
        
    
    
    
End Sub






' 1.29#405
Sub save_SYMBOL_TABLE_to_FILE(ByVal sFilename As String, bFOR_FASM As Boolean)

On Error GoTo error_save_stf
    Dim fNum As Integer
    Dim i    As Integer
    Dim s    As String
    
    sFilename = sFilename & ".symbol.txt" ' adding ".symbol.txt" extention:
    
    If FileExists(sFilename) Then
        DELETE_FILE sFilename
    End If
    
    fNum = FreeFile
    
    Open sFilename For Output Shared As fNum
    
    
        ' #400b3-symbol-table#  major update!
    
    
    
        ' 4 status lines
        If bFOR_FASM Then
            s = "< THE SYMBOL TABLE >  " & ExtractFileName(CutExtension(sFilename)) & "  --  emu8086 IDE version: " & App.Major & "." & App.Minor & App.Revision & sVER_SFX & " "
        Else
            s = "< THE SYMBOL TABLE >  " & ExtractFileName(CutExtension(sFilename)) & "  --  emu8086 assembler version: " & App.Major & "." & App.Minor & App.Revision & sVER_SFX & " "
        End If
        Print #fNum, s  ' [1]
        
        s = "==================================================================================================="
        Print #fNum, s  ' [2]
        
        s = make_min_len_RIGHT("Name", 25, " ") & vbTab & _
            make_min_len_RIGHT("Offset", 10, " ") & vbTab & _
            make_min_len_RIGHT("Size", 10, " ") & vbTab & _
            make_min_len_RIGHT("Type", 10, " ") & vbTab & _
            make_min_len_RIGHT("Segment", 10, " ")
        Print #fNum, s  ' [3]
        
        
        s = "==================================================================================================="
        Print #fNum, s  ' [4]
        
        ' stop status lines.
        
        
        ' #400b3-symbol-table#  major update!
        
        
        For i = 0 To primary_symbol_TABLE_SIZE - 1 'UBound(primary_symbol_TABLE)
            
            s = make_min_len_RIGHT(primary_symbol_TABLE(i).sName, 25, " ") & vbTab & _
                make_min_len_RIGHT(make_min_len(Hex(primary_symbol_TABLE(i).lOFFSET), 5, "0"), 10, " ") & vbTab & _
                make_min_len_RIGHT(CStr(primary_symbol_TABLE(i).iSize), 10, " ") & vbTab & _
                make_min_len_RIGHT(primary_symbol_TABLE(i).sType, 10, " ") & vbTab & _
                make_min_len_RIGHT(primary_symbol_TABLE(i).sSegment, 10, " ")
                
            Print #fNum, s
            
        Next i
        
        s = "==================================================================================================="
        Print #fNum, s
        
        s = "[ " & Date & "  --  " & Time & " ] "
        Print #fNum, s
        
        s = "< END >"
        Print #fNum, s
        
        s = " "
        Print #fNum, s
    Close fNum
    
    
    
    frmInfo.addStatus cMT("Symbol table is saved:") & " """ & ExtractFileName(sFilename) & """"
    
    
    Exit Sub
error_save_stf:
    Debug.Print "Error on save_SYMBOL_TABLE_to_FILE(" & sFilename & ") - " & LCase(Err.Description)

End Sub

' 1.29#405
Sub load_SYMBOL_TABLE_from_FILE(ByVal sFilename As String)

On Error GoTo error_load_stf
    Dim fNum As Integer
    Dim s As String
    
    
    ' #327xo-av-protect-4#
    If FileExists(sFilename & ".symbol.txt") Then
        sFilename = sFilename & ".symbol.txt" ' adding ".symbol.txt" extention. OK!
    Else
        sFilename = sFilename & "_.symbol.txt" ' try this one.... (the executable file could be renamed).
    End If


    

    
    
    
    vST_for_VARS_WIN_SIZE = 0
    vST_SEGMENTS_for_VARS_WIN_SIZE = 0
    
    
    If FileExists(sFilename) Then ' 4.00b15
                fNum = FreeFile
                Open sFilename For Input Shared As fNum
                    ' skip 4 caption lines:
                    Line Input #fNum, s
                    Line Input #fNum, s
                    Line Input #fNum, s
                    Line Input #fNum, s
                    Do While Not EOF(fNum)
                        Line Input #fNum, s
                        add_to_vST_if_VAR_or_SEG s
                    Loop
                Close fNum
                                
                                
                                
                ' #400b22-masm_comp400b20.asm#
                ' it seems like sometimes we use primary table instead of vST_for_VARS_WIN
                ' example: masm_comp400b20.asm
                 copy_vST_for_VARS_WIN_and_vST_SEGMENTS_for_VARS_WIN_to_Primary_TABLE
                                
                                
                                
                ' Symbol Table loaded, so we need to update,
                ' update is done only if frmVars is loaded:
                update_VAR_WINDOW
    End If
    
    Exit Sub
error_load_stf:
    Debug.Print "load_SYMBOL_TABLE_from_FILE(" & sFilename & ") - " & LCase(Err.Description)
    
End Sub

' 1.29#405
Private Sub add_to_vST_if_VAR_or_SEG(ByRef s As String)
On Error GoTo err_atst

    Dim arrT() As String
    Dim L As Integer
    
    arrT = Split(s, vbTab)   ' #400b3-symbol-table# OK!  - NO CHANGE HERE!
    
    If UBound(arrT) < 4 Then GoTo stop_add_tvST ' not data line.
    
    
    ' #400b3-symbol-table#
    ' Option Base 0 is set - OK!
    ' Trim all!
    arrT(0) = Trim(arrT(0))
    arrT(1) = Trim(arrT(1))
    arrT(2) = Trim(arrT(2))
    arrT(3) = Trim(arrT(3))
    arrT(4) = Trim(arrT(4))
    
    
    
    If arrT(3) = "VAR" Then
    
         ' TODO: later you may allow
         '       user to view local variables as well:
         ' skip local variables, don't add:
         If Right(arrT(0), 3) = "TMP" Then
            If InStr(1, arrT(0), "_LOC") Then
                GoTo stop_add_tvST
            End If
         End If
         
    
         L = vST_for_VARS_WIN_SIZE
         
         If UBound(vST_for_VARS_WIN) < L Then
            ReDim Preserve vST_for_VARS_WIN(0 To L)
         End If
         
         
         vST_for_VARS_WIN(L).sName = arrT(0)
         vST_for_VARS_WIN(L).lOFFSET = Val("&H" & arrT(1))
         vST_for_VARS_WIN(L).iSize = arrT(2) ' all variables are treated as words/bytes by default.
         '  arrT(3) - always "VAR"!
         vST_for_VARS_WIN(L).sSegment = arrT(4)
        
        
         ' prevent reseting to default on reload:
        
        '#1158
         If vST_for_VARS_WIN(L).iShowAs < 0 Then
            vST_for_VARS_WIN(L).iShowAs = 0 '"HEX" ' default numbering system.
         End If
         
         If vST_for_VARS_WIN(L).iElements < 1 Then
            vST_for_VARS_WIN(L).iElements = 1 ' by default it is single element variable (not an array).
         End If
        
        
         vST_for_VARS_WIN_SIZE = vST_for_VARS_WIN_SIZE + 1
         
    ElseIf arrT(3) = "SEGMENT" Then
    
        L = vST_SEGMENTS_for_VARS_WIN_SIZE
        ReDim Preserve vST_SEGMENTS_for_VARS_WIN(0 To L)
        
        vST_SEGMENTS_for_VARS_WIN(L).sName = arrT(0)
        vST_SEGMENTS_for_VARS_WIN(L).lOFFSET = Val("&H" & arrT(1))
        vST_SEGMENTS_for_VARS_WIN(L).iSize = arrT(2)
        vST_SEGMENTS_for_VARS_WIN(L).sType = arrT(3)  ' always "SEGMENT"!
        vST_SEGMENTS_for_VARS_WIN(L).sSegment = arrT(4)
        
        vST_SEGMENTS_for_VARS_WIN_SIZE = vST_SEGMENTS_for_VARS_WIN_SIZE + 1
        
    End If
    
    
stop_add_tvST:
    Erase arrT ' #327xp-erase#
    
    Exit Sub
err_atst:
    Debug.Print "add_to_vST_if_VAR_or_SEG: " & LCase(Err.Description)
End Sub

' 1.29#405
' b_frmVars_LOADED can be checked before
' calling this sub to save time:
Sub update_VAR_WINDOW()
On Error GoTo err_uvw

    If b_frmVars_LOADED = False Then Exit Sub ' no need to update!

    ' frmVars.listVars.Clear

    Dim i As Integer
    Dim k As Integer
    
    Dim s As String
    Dim sF As String
    
    ' Speed maybe improved by keeping the values
    ' in some array and comparing from there before
    ' updating the list.
    
    
    ' It seems that it works for segments also,
    ' even without special processing!
    
    ' #1074 it seems that it doesn't work when variable is in second segment
    
    Dim lADR As Long
    
    

    For i = 0 To vST_for_VARS_WIN_SIZE - 1
        
        
        
        
        ' #1074 ' lADR = frmEmulation.lPROG_LOADED_AT_ADR + vST_for_VARS_WIN(i).lOffset
        lADR = frmEmulation.lPROG_LOADED_AT_ADR + vST_for_VARS_WIN(i).lOFFSET + to_unsigned_long(get_var_offset(vST_for_VARS_WIN(i).sSegment)) * 16    ' #1074
        

        
        
        
        
        
        
        
        s = ""
        
        For k = 1 To vST_for_VARS_WIN(i).iElements
        
            Select Case vST_for_VARS_WIN(i).iSize
            
            Case 1  ' BYTE
               sF = format_to_NumSystem_byte(RAM.mREAD_BYTE(lADR), vST_for_VARS_WIN(i).iShowAs)
               lADR = lADR + 1 ' next byte, used when array.
               
            Case 2  ' WORD
               sF = format_to_NumSystem_word(RAM.mREAD_WORD(lADR), vST_for_VARS_WIN(i).iShowAs)
               lADR = lADR + 2 ' next word, used when array.
               
               
               
            ' #400b20-FPU-show-dd,dq,dt#
            Case 4
               sF = READ_format_to_NumSystem(lADR, vST_for_VARS_WIN(i).iShowAs, 4)
               lADR = lADR + 4 ' next dword, used when array.
            Case 8
               sF = READ_format_to_NumSystem(lADR, vST_for_VARS_WIN(i).iShowAs, 8)
               lADR = lADR + 8 ' next qword, used when array.
            Case 10
               sF = READ_format_to_NumSystem(lADR, vST_for_VARS_WIN(i).iShowAs, 10)
               lADR = lADR + 10 ' next tword, used when array.
                
                
                
               
            Case Else
                Debug.Print "unsupported var type!"
            End Select
        
            ' for arrays:
            If Len(s) > 0 Then
                 s = s & ", " & sF
            Else
                 s = sF
            End If
            
        Next k
        
        s = vST_for_VARS_WIN(i).sName & vbTab & s
        
        If frmVars.listVars.List(i) <> s Then
            frmVars.listVars.List(i) = s
            frmVars.listVars.ListIndex = i ' 2.05#549c    (4.00b20 I wonder... why...??)
        End If
        
        'Debug.Print "gggg: " & Hex(frmEmulation.lPROG_LOADED_AT_ADR), Hex(vST_for_VARS_WIN(i).lOffset)

        ' Debug.Print "gggg: " & Hex(frmEmulation.lPROG_LOADED_AT_ADR + vST_for_VARS_WIN(i).lOffset)
        
    Next i

    ' remove unused items from the list:
    For i = frmVars.listVars.ListCount - 1 To vST_for_VARS_WIN_SIZE Step -1
        frmVars.listVars.RemoveItem i
        ' Debug.Print "removed item: " & i
    Next i

    ' Debug.Print "vars window updated!"

    AddHorizontalScroll frmVars.listVars

    ' 2.02#513
    ' to make sure the update for properties
    ' is done, this makes "Click" event to be
    ' generated:
    Dim iCurrentIndex As Integer
    iCurrentIndex = frmVars.listVars.ListIndex
    frmVars.listVars.ListIndex = -1
    frmVars.listVars.ListIndex = iCurrentIndex



    ' #400b20-BUG#
    frmVars.show_value_properties frmVars.listVars.ListIndex, False
    
    


    ' 1.30
    If frmVars.listVars.ListIndex < 0 Then
        If frmVars.listVars.ListCount > 0 Then
            frmVars.listVars.ListIndex = 0
        End If
    End If

    Exit Sub
err_uvw:
    Debug.Print "update_VAR_WINDOW: " & LCase(Err.Description)

End Sub



' UPDATED 2007-12-05
' see \TODO\BUGS_VERSION_4.05\bug_405_01.asm
Function READ_format_to_NumSystem(lAddr As Long, iBASE As Integer, lByteCount As Long) As String

On Error GoTo err1

    Dim uValue As Byte
    Dim s As String
    Dim i As Long
    
    s = ""
    
    Select Case iBASE
    Case 0 '"HEX"

        For i = lByteCount - 1 To 0 Step -1
            uValue = RAM.mREAD_BYTE(lAddr + i)
            s = s & byteHEX(uValue)
        Next i
        
        s = s & "h"
        
        ' hex numbers are not required to start with zero when first digit isn't a number, here.
        
    Case 1 '"BIN"

        For i = lByteCount - 1 To 0 Step -1
            uValue = RAM.mREAD_BYTE(lAddr + i)
            s = s & toBIN_BYTE(uValue)
        Next i
        
        s = s & "b"


' TODO: #imp-fpu-base#

' later!
''''    Case 2 '"OCT"
''''        format_to_NumSystem_byte = make_min_len(Oct(uValue), 3, "0") & "o"
''''
''''    Case 3 '"SIGNED"
''''        format_to_NumSystem_byte = CStr(to_signed_byte(uValue))
''''
''''    Case 4 '"UNSIGNED"
''''        format_to_NumSystem_byte = CStr(uValue)
''''
''''    Case 5 '"CHAR"
''''        If uValue <> 0 Then
''''            format_to_NumSystem_byte = "'" & Chr(uValue) & "'"
''''        Else
''''            format_to_NumSystem_byte = "NULL"
''''        End If
''''
    Case Else
        s = "NOT SUPPORTED YET" ' TODO :)
        Debug.Print "READ_format_to_NumSystem: unknown base: " & iBASE
    
    End Select
    
    
    READ_format_to_NumSystem = s
    
    Exit Function
err1:
    Debug.Print "READ_format_to_NumSystem : " & Err.Description
End Function


Function format_to_NumSystem_byte(uValue As Byte, iBASE As Integer) As String

On Error GoTo err1

    Select Case iBASE
    
    Case 0 '"HEX"
        format_to_NumSystem_byte = make_min_len(Hex(uValue), 2, "0") & "h"
        
        ' hex numbers should start with zero when first digit isn't a number:
        If Not (Mid(format_to_NumSystem_byte, 1, 1) Like "#") Then
            format_to_NumSystem_byte = "0" & format_to_NumSystem_byte
        End If
        
    Case 1 '"BIN"
        format_to_NumSystem_byte = toBIN_BYTE(uValue) & "b"

    Case 2 '"OCT"
        format_to_NumSystem_byte = make_min_len(Oct(uValue), 3, "0") & "o"
        
    Case 3 '"SIGNED"
        format_to_NumSystem_byte = CStr(to_signed_byte(uValue))
        
    Case 4 '"UNSIGNED"
        format_to_NumSystem_byte = CStr(uValue)
    
    Case 5 '"CHAR"
        If uValue <> 0 Then
            format_to_NumSystem_byte = "'" & Chr(uValue) & "'"
        Else
            format_to_NumSystem_byte = "NULL"
        End If
        
    Case Else
        Debug.Print "format_to_NumSystem_byte: unknown base: " & iBASE
    
    End Select
    
    Exit Function
err1:
    Debug.Print "format_to_NumSystem_byte : " & Err.Description
    
End Function


Function format_to_NumSystem_word(iValue As Integer, iBASE As Integer) As String ' #1158

On Error GoTo err1

    Select Case iBASE
    
    Case 0 ' "HEX"
        format_to_NumSystem_word = make_min_len(Hex(iValue), 4, "0") & "h"
        
        ' hex numbers should start with zero when first digit isn't a number:
        If Not (Mid(format_to_NumSystem_word, 1, 1) Like "#") Then
            format_to_NumSystem_word = "0" & format_to_NumSystem_word
        End If
        
    Case 1 '"BIN"
        format_to_NumSystem_word = toBIN_WORD(iValue) & "b"

    Case 2 '"OCT"
        format_to_NumSystem_word = make_min_len(Oct(iValue), 6, "0") & "o"
        
    Case 3 '"SIGNED"
        format_to_NumSystem_word = CStr(iValue)
        
    Case 4 ' "UNSIGNED"
        format_to_NumSystem_word = CStr(to_unsigned_long(iValue))
    
    Case 5 ' "CHAR"
        Dim u1 As Byte
        Dim u2 As Byte
        
        
        
' #400B18-BUG-FRMVAR#
''''        u1 = math_get_high_byte_of_word(iValue)
''''        u2 = math_get_low_byte_of_word(iValue)
        u1 = math_get_low_byte_of_word(iValue)
        u2 = math_get_high_byte_of_word(iValue)
        
        
        
        ' NULL not used here to prevent evaluation problems:
        
        If u1 <> 0 Then
            format_to_NumSystem_word = "'" & Chr(u1)
        Else
            format_to_NumSystem_word = "'"
        End If
        
        If u2 <> 0 Then
            format_to_NumSystem_word = format_to_NumSystem_word & Chr(u2) & "'"
        Else
            format_to_NumSystem_word = format_to_NumSystem_word & "'"
        End If
        
    Case Else
        Debug.Print "format_to_NumSystem_word: unknown base: " & iBASE
    
    End Select
    
    
    
    
    Exit Function
err1:
    Debug.Print "format_to_NumSystem_word : " & Err.Description
    
    
End Function



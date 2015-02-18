Attribute VB_Name = "mBuild_Executable"

'

'

'





Option Explicit

Global Const sORIG_SOURCE_TAG As String = "; [SOURCE]: "


'*************** for Check Sum ***************
    Dim bHIGH_BYTE As Boolean
    Dim lCHECK_SUM As Long
'*************** *************** *************

'-------------- for EXE header --------------
    Const Paragraphs_in_Header = 32 ' 20h
    Global s_ENTRY_POINT As String ' later converted to CS:IP
'--------------  -------------- -------------

Private Sub chkSum(ByRef tb As Byte)
    
    Dim lT As Long
    Dim lS As Long
    
    lT = tb
    
    If bHIGH_BYTE Then
        lT = lT * 256 ' move byte to high byte.
    End If
    
    
    lS = lCHECK_SUM
    lS = lS - lT
    
    ' cut off overflow (over word):
    Dim bLow As Byte
    Dim bHigh As Byte
    
    bLow = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(Hex(lS))))
    bHigh = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(Hex(lS))))
    
    lCHECK_SUM = bHigh
    lCHECK_SUM = lCHECK_SUM * 256
    lCHECK_SUM = lCHECK_SUM + bLow
    
    bHIGH_BYTE = Not bHIGH_BYTE
    
End Sub

'Public Sub TESTC()
'    Dim i As Integer
'    Dim s As String
'    Dim ts As String
'    Dim tb As Byte
'
'    '''''''''' preset:
'    bHIGH_BYTE = False
'    iCHECK_SUM = Val("&HFFFF")
'    ''''''''''''''''''''
'
'    ' check sum for this byte string: A570
'    s = "4D5A02000200000020000000FFFF00000000000000001E0000000100"
'
'    i = 1
'    Do While True
'        ts = Mid(s, i, 2)
'        tb = Val("&H" & ts)
'        chkSum tb
'        If (ts = "") Then Exit Do
'        i = i + 2
'    Loop
'
'    Debug.Print "Check Sum: '" & Hex(iCHECK_SUM) & "'"
'
'End Sub


' when bIfSucessLoadInEmulator=TRUE, doesn't ask for a filename
' default is used, and overwritten:
' in case of error bIfSucessLoadInEmulator is set to FALSE
' using pointer!
Function build_EXE(ByRef bIfSucessLoadInEmulator As Boolean, bDONOT_ASK_WHERE_TO_SAVE As Boolean) As Boolean

On Error GoTo error_building_exe
    Dim sEXE_FILENAME As String
    
    Dim lFILE_SIZE As Long

    Dim i As Long
    'Dim tChar As String
    Dim ts As String
    Dim tb As Byte

    Dim gFileNumber As Integer

    gFileNumber = FreeFile


    
    ' --------------------------------------------------------
        
    If (bIfSucessLoadInEmulator And bDONOT_ASK_WHERE_TO_SAVE) Or bCOMPILE_ALL_SILENT Then  ' #400b8-fast-examples-check#
            ' 1.32#472
            myMKDIR s_MyBuild_Dir ' 2.05#545 Add_BackSlash(App.Path) & "MyBuild"
    
            ' 1.23#271 "EMU_TEMP" replaced with "MyBuild"
            If frmMain.sOpenedFile <> "" Then
                ' 2.05#545  sEXE_FILENAME = Add_BackSlash(App.Path) & "MyBuild\" & CutExtension(ExtractFileName(frmMain.sOpenedFile)) & ".exe"
                sEXE_FILENAME = Add_BackSlash(s_MyBuild_Dir) & check_if_sNamePR_defined(CutExtension(ExtractFileName(frmMain.sOpenedFile))) & ".exe_"  ' #327xo-av-protect#
            Else
                ' 2.05#545  sEXE_FILENAME = Add_BackSlash(App.Path) & "MyBuild\" & "noname.exe"
                sEXE_FILENAME = Add_BackSlash(s_MyBuild_Dir) & sNamePR & ".exe_" ' #327xo-av-protect#
            End If
    Else
            '1.23#268c
            Dim ST As String
            
            
            ' #400b20-remember-prev-build-dir#
            If Len(sPREV_BUILD_DIR) > 0 Then
                ' allow only if source file is from the same folder
                If StrComp(ExtractFilePath(frmMain.sOpenedFile), sPREV_BUILD_DIR, vbTextCompare) = 0 Then
                    ST = sPREV_BUILD_DIR
                Else
                    ST = s_MyBuild_Dir
                End If
            Else
                ST = s_MyBuild_Dir
            End If
            
            
            ' #400b20-remember-prev-build-dir# ' ST = s_MyBuild_Dir ' 2.05#545   Add_BackSlash(App.Path) & "MyBuild"
            
            
            
            
            myMKDIR ST
            
                
'''            If frmMain.sOpenedFile <> "" Then
'''                If myChDir(ST) Then
'''                    ComDlg.FileInitialDirD = ST '1.23#268c  ExtractFilePath(frmMain.sOpenedFile)
'''                End If
'''                ComDlg.FileNameD = check_if_sNamePR_defined(CutExtension(ExtractFileName(frmMain.sOpenedFile))) & ".exe"
'''            Else
'''                If myChDir(ST) Then
'''                    ComDlg.FileInitialDirD = ST '1.23#268c App.Path
'''                End If
'''                ComDlg.FileNameD = sNamePR & ".exe"
'''            End If
'''
'''            ' 4.00-Beta-6  - to make F12 work
'''            If frmInfo.Visible Then
'''                ComDlg.hwndOwner = frmInfo.hwnd
'''            Else
'''                ComDlg.hwndOwner = frmMain.hwnd
'''            End If
'''            ComDlg.Flags = OFN_HIDEREADONLY + OFN_PATHMUSTEXIST   '#1137c' OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT + OFN_PATHMUSTEXIST
'''            ComDlg.Filter = "executable files (*.exe)|*.exe|all Files (*.*)|*.*"
'''            ComDlg.DefaultExtD = "exe"
'''            sEXE_FILENAME = ComDlg.ShowSave

      ' 20140414
      sEXE_FILENAME = Add_BackSlash(ST) & "0000.exe"
    
            
    End If
    ' --------------------------------------------------------
    

    
    
    If sEXE_FILENAME = "" Then
        bIfSucessLoadInEmulator = False ' #1135c
        Exit Function ' canceled.
    End If
    
    
    
                
    ' #400b20-remember-prev-build-dir#
    sPREV_BUILD_DIR = ExtractFilePath(sEXE_FILENAME)
    
    
    
    
    
'''
'''    ' 1.05
'''    ' 1.32#471
'''    ' 2.05
'''    If Not Save_Temporary_Source(sEXE_FILENAME & ".~asm") Then
'''        mBox frmMain, cMT("save error:") & " """ & ExtractFilePath(sEXE_FILENAME) & """" & vbNewLine & _
'''                      cMT("set correct output directory from the ""assembler"" menu.")
'''        bIfSucessLoadInEmulator = False
'''        Exit Function
'''    End If
    

    ' delete the old file (if exists):
    If FileExists(sEXE_FILENAME) Then
        
        If Not check_if_its_in_MyBuild_folder_or_ask_to_overwrite(sEXE_FILENAME) Then '#1137c
            bIfSucessLoadInEmulator = False
            Exit Function
        End If
        
        DELETE_FILE sEXE_FILENAME
    End If

    Open sEXE_FILENAME For Random Shared As gFileNumber Len = 1
    
        lFILE_SIZE = 0
    
        '''''''''' preset check sum engine:
        bHIGH_BYTE = False
        lCHECK_SUM = Val("&HFFFF") ' this is -1 (note v1.21)
        ''''''''''''''''''''
    
    ' |||||||||  reserve space for EXE header:
    
            ' The first record or byte in a file is at position 1!!!
    
        ' #400b20-explain-exe-header#   reset the explanations.
        explain_exe_hearder -1, 0, ""
        
    
        For i = 1 To (Paragraphs_in_Header * 16)
            tb = 0
            Put gFileNumber, i, tb
            ' zeros, so no need in: chkSum tb
            lFILE_SIZE = lFILE_SIZE + 1
        Next i
        
        ' #400b20-explain-exe-header#
        explain_exe_hearder -2, 0, "EXE HEADER - bytes from 0000 to " & make4digitHex(lFILE_SIZE - 1) & " inclusive." & vbNewLine
        
    ' ||||||||| ||||||||| ||||||||| ||||||||| |||||||||
    
    ' ------- write data:
    
    '1.23#241 Dim iLine As Integer
    Dim lByte As Long
    
    '1.23#241 Dim sT_OUT As String
    
    '1.23#241 lByte = 0
    
    '1.23#241 Do While lByte < lElements_in_arrOUT  '1.23#241  frmMain.lst_Out.ListCount
    For lByte = 0 To lElements_in_arrOUT - 1
        '1.23#241 sT_OUT = frmMain.lst_Out.List(iLine)
    
            '1.23#241 ' /////////// write line of bytes:
            '1.23#241 i = 1
            
           '1.23#241  Do While True
            
           '1.23#241      ts = Mid(sT_OUT, i, 2)
        
           '1.23#241      If ts = "" Then Exit Do  ' until end of line.
            
           '1.23#241      tb = Val("&H" & ts)
            tb = arrOUT(lByte)
            
            
            Put gFileNumber, , tb
            chkSum tb   ' update check sum!
            lFILE_SIZE = lFILE_SIZE + 1
        
           '1.23#241      i = i + 2
           '1.23#241  Loop
           '1.23#241 ' ////////////////////////////////////
            
        '1.23#241 iLine = iLine + 1
    '1.23#241 Loop
    Next lByte
    '---------------------
    
    ' file may be not be ended by a word, it may end by byte!
    ' this should fix the checksum problem:
    If bHIGH_BYTE Then
        chkSum 0
    End If
    
    
    ' |||||||||  write EXE header:
            
        Dim iBytes_on_last_page As Integer
        Dim lPages_in_file As Long
        Dim l_SS As Long
        Dim l_SP As Long
        Dim l_IP As Long
        Dim l_CS As Long
        
        '''''''''''''''''''''''''''''''''''''''''''''
        ' calculate:
        '           iBytes_on_last_page
        '           lPages_in_file
        '           l_SS
        '           l_SP
        '           l_IP
        '           l_CS
    
        iBytes_on_last_page = lFILE_SIZE Mod 512
        
        lPages_in_file = Fix(lFILE_SIZE / 512)
        
        If iBytes_on_last_page <> 0 Then
            lPages_in_file = lPages_in_file + 1
        End If
        

        
        l_SS = get_Stack_Segment_ANCHOR
        l_SP = get_Stack_Segment_SIZE
        
        
        If s_ENTRY_POINT = "code" Then ' 3.27xn '  #1088c
            ' it seems that the offset of CSEG is just what we need :)
            l_CS = get_var_offset(s_ENTRY_POINT)
            l_IP = 0
        Else
            l_CS = get_Entry_Point_Segment_ANCHOR
            If (s_ENTRY_POINT <> "-1") Then
                l_IP = get_var_offset(s_ENTRY_POINT)
            Else
                l_IP = 0
            End If
        End If
        '''''''''''''''''''''''''''''''''''''''''''''
    
    

    
            ' The first record or byte in a file is at position 1!!!
    
            ' 0000h , 2 bytes: "Signature 4D5A - 'MZ' (1)"
            tb = Val("&H4D")
            Put gFileNumber, 1, tb
            chkSum tb   ' update check sum!
            tb = Val("&H5A")
            Put gFileNumber, 2, tb
            chkSum tb   ' update check sum!
            
            
            
            ' VB counts from 1, we count from 0
            ' #400b20-explain-exe-header#
            explain_exe_hearder 0, &H4D, "exe signature (M)"
            explain_exe_hearder 1, &H5A, "exe signature (Z)"
            
            
            
            
            ' 0002h , 2 bytes: "Bytes on last page"
            tb = math_get_low_byte_of_word(iBytes_on_last_page)
            Put gFileNumber, 3, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 2, tb, "bytes on last page (l.byte)"  ' #400b20-explain-exe-header#
            tb = math_get_high_byte_of_word(iBytes_on_last_page)
            Put gFileNumber, 4, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 3, tb, "bytes on last page (h.byte)"  ' #400b20-explain-exe-header#

            

            
            
                                   
            ' 0004h , 2 bytes: "512 byte Pages in file"
            tb = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(Hex(lPages_in_file))))
            Put gFileNumber, 5, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 4, tb, "512 byte pages in file (l.byte)"  ' #400b20-explain-exe-header#
            tb = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(Hex(lPages_in_file))))
            Put gFileNumber, 6, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 5, tb, "512 byte pages in file (h.byte)"  ' #400b20-explain-exe-header#
            
            
            ' 0006h , 2 bytes: "Relocations"
            ' TODO! check that number of relocations isn't too big!
            tb = math_get_low_byte_of_word(frmMain.lst_Relocation_Table.ListCount)
            Put gFileNumber, 7, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 6, tb, "relocations (l.byte)"  ' #400b20-explain-exe-header#
            tb = math_get_high_byte_of_word(frmMain.lst_Relocation_Table.ListCount)
            Put gFileNumber, 8, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 7, tb, "relocations (h.byte)"  ' #400b20-explain-exe-header#


            ' 0008h , 2 bytes: "Paragraphs in Header"
            tb = Paragraphs_in_Header   ' assumed that it's lower than 256.
            Put gFileNumber, 9, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 8, tb, "paragraphs in header (l.byte)"  ' #400b20-explain-exe-header#
            tb = 0
            Put gFileNumber, 10, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 9, tb, "paragraphs in header (h.byte)"  ' #400b20-explain-exe-header#
            
            ' 000Ah , 2 bytes: "Minimum Memory"
            tb = 0
            Put gFileNumber, 11, tb
            'no need (zero) chkSum tb   ' update check sum!
            explain_exe_hearder 10, tb, "minimum memory (l.byte)"  ' #400b20-explain-exe-header#
            tb = 0
            Put gFileNumber, 12, tb
            'no need (zero) chkSum tb   ' update check sum!
            explain_exe_hearder 11, tb, "minimum memory (h.byte)"  ' #400b20-explain-exe-header#
            
            
            
            ' 000Ch , 2 bytes: "Maximum Memory"
            tb = Val("&HFF")
            Put gFileNumber, 13, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 12, tb, "maximum memory (l.byte)"  ' #400b20-explain-exe-header#
            tb = Val("&HFF")
            Put gFileNumber, 14, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 13, tb, "maximum memory (h.byte)"  ' #400b20-explain-exe-header#
            
            
            ' 000Eh , 2 bytes: "SS"
            tb = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(Hex(l_SS))))
            Put gFileNumber, 15, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 14, tb, "SS - stack segment (l.byte)"  ' #400b20-explain-exe-header#
            tb = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(Hex(l_SS))))
            Put gFileNumber, 16, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 15, tb, "SS - stack segment (h.byte)"  ' #400b20-explain-exe-header#
            
            ' 0010h , 2 bytes: "SP"
            tb = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(Hex(l_SP))))
            Put gFileNumber, 17, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 16, tb, "SP - stack pointer (l.byte)"  ' #400b20-explain-exe-header#
            tb = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(Hex(l_SP))))
            Put gFileNumber, 18, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 17, tb, "SP - stack pointer (h.byte)"  ' #400b20-explain-exe-header#
            
            
            
            ' 0012h , 2 bytes: "Check sum"
            ' written after all other data!
            explain_exe_hearder -2, 0, "check sum (l.byte)"    ' #400b20-explain-exe-header#
            explain_exe_hearder -2, 0, "check sum (h.byte)"   ' #400b20-explain-exe-header#
            
            
            ' 0014h , 2 bytes: "IP"
            tb = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(Hex(l_IP))))
            Put gFileNumber, 21, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 20, tb, "IP - instruction pointer (l.byte)"  ' #400b20-explain-exe-header#
            tb = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(Hex(l_IP))))
            Put gFileNumber, 22, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 21, tb, "IP - instruction pointer (h.byte)"  ' #400b20-explain-exe-header#
            
            
            ' 0016h , 2 bytes: "CS"
            tb = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(Hex(l_CS))))
            Put gFileNumber, 23, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 22, tb, "CS - code segment (l.byte)"  ' #400b20-explain-exe-header#
            tb = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(Hex(l_CS))))
            Put gFileNumber, 24, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 23, tb, "CS - code segment (h.byte)"  ' #400b20-explain-exe-header#
            
            
            
            ' 0018h , 2 bytes: "Relocation table adress"
            tb = Val("&H1E")
            Put gFileNumber, 25, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 24, tb, "relocation table adress (l.byte)"  ' #400b20-explain-exe-header#
            tb = 0
            Put gFileNumber, 26, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 25, tb, "relocation table adress (h.byte)"  ' #400b20-explain-exe-header#
            
            
            
            ' 001Ah , 2 bytes: "Overlay number"
            tb = 0
            Put gFileNumber, 27, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 26, tb, "overlay number (l.byte)"  ' #400b20-explain-exe-header#
            tb = 0
            Put gFileNumber, 28, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 27, tb, "overlay number (h.byte)"  ' #400b20-explain-exe-header#
            
            
            ' 001Ch , 2 bytes: "Signature 01 00 (2)"
            tb = 1
            Put gFileNumber, 29, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 28, tb, "signature (l.byte)"  ' #400b20-explain-exe-header#
            tb = 0
            Put gFileNumber, 30, tb
            chkSum tb   ' update check sum!
            explain_exe_hearder 29, tb, "signature (h.byte)"  ' #400b20-explain-exe-header#
            
            
            ' #400b20-explain-exe-header#
            Dim iEX As Long
            iEX = 30 ' = 1Eh
            
            
                        
            ' 001Eh ++++++++++ Relocations Table
            Dim k As Integer
            Dim tk1 As String
            Dim tk2 As String
            k = 0
            Do While (k < frmMain.lst_Relocation_Table.ListCount)
                ' values in Table are in HEX!
                tk1 = getNewToken(frmMain.lst_Relocation_Table.List(k), 0, " ")
                tk2 = getNewToken(frmMain.lst_Relocation_Table.List(k), 1, " ", True)
                
                ' offset inside segment:
                tb = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(tk1)))
                Put gFileNumber, , tb
                chkSum tb   ' update check sum!
                explain_exe_hearder iEX, tb, "relocation table - offset inside segment (l.byte)"  ' #400b20-explain-exe-header#
                iEX = iEX + 1  ' #400b20-explain-exe-header#
                tb = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(tk1)))
                Put gFileNumber, , tb
                chkSum tb   ' update check sum!
                explain_exe_hearder iEX, tb, "relocation table - offset inside segment (h.byte)"  ' #400b20-explain-exe-header#
                iEX = iEX + 1  ' #400b20-explain-exe-header#
                
                ' segment anchor:
                tk2 = Mid(tk2, 1, Len(tk2) - 1) ' remove last "0".
                tb = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(tk2)))
                Put gFileNumber, , tb
                chkSum tb   ' update check sum!
                explain_exe_hearder iEX, tb, "relocation table - segment anchor (l.byte)"  ' #400b20-explain-exe-header#
                iEX = iEX + 1  ' #400b20-explain-exe-header#
                tb = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(tk2)))
                Put gFileNumber, , tb
                chkSum tb   ' update check sum!
                explain_exe_hearder iEX, tb, "relocation table - segment anchor (h.byte)"  ' #400b20-explain-exe-header#
                iEX = iEX + 1  ' #400b20-explain-exe-header#
                
                
                k = k + 1
            Loop
            '++++++++++
            
            
            ' #400b20-explain-exe-header#
            If iEX < &H1FF Then
                explain_exe_hearder -2, 0, make4digitHex(iEX) & " to 01FF  -   reserved relocation area  (00) "
            End If
            
            
            
            ' 0012h , 2 bytes: "Check sum"
            ' check sum isn't counted itself!
            tb = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(Hex(lCHECK_SUM))))
            Put gFileNumber, 19, tb
            explain_exe_hearder -3, tb, "check sum (l.byte)"   ' #400b20-explain-exe-header#
            tb = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(Hex(lCHECK_SUM))))
            Put gFileNumber, 20, tb
            explain_exe_hearder -4, tb, "check sum (h.byte)"   ' #400b20-explain-exe-header#
            
    ' ||||||||| ||||||||| ||||||||| ||||||||| |||||||||
    
    Close gFileNumber


    build_EXE = True
    
    ' 1.04
    sDEBUGED_file = sEXE_FILENAME

' 1.29 done after saving debug info!
''''    If bIfSucessLoadInEmulator Then
''''        frmInfo.Hide
''''        frmEmulation.DoShowMe
''''        frmEmulation.loadFILEtoEMULATE sEXE_FILENAME
''''    End If

    sLAST_COMPILED_FILE = sEXE_FILENAME

    Exit Function

error_building_exe:

    ' 1.32#473
    bIfSucessLoadInEmulator = False

    mBox frmMain, cMT("exe build error:") & " " & _
            LCase(Err.Description)

End Function

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Function get_Stack_Segment_ANCHOR() As Long

On Error GoTo err1

    Dim ts As String
    Dim i As Long
    Dim sName As String
    Dim sAnchor As String
    
    i = 0
    
    Do While (i < frmMain.lst_Segment_Sizes.ListCount)
    
        'ts = getLine(i, frmMain.txt_Segment_Sizes.Text)
        ts = frmMain.lst_Segment_Sizes.List(i)
        
        'If ts = Chr(10) Then Exit Do
        
        If (getNewToken(ts, 2, " ") = "STACK") Then
            sName = getNewToken(ts, 0, " ", True)
            sAnchor = Hex(get_var_offset(sName))
' for SEGMENT ANCHOR is stored directly!
''''            ' remove last digit (it should be "0"):
''''            ' sAnchor = Mid(sAnchor, 1, Len(sAnchor) - 1)
            get_Stack_Segment_ANCHOR = Val("&H" & sAnchor)
            Exit Function
        End If
        
        i = i + 1
    Loop
        
        
    frmInfo.addStatus "NO STACK!"
    get_Stack_Segment_ANCHOR = 0
            
            
            
    Exit Function
err1:
    Debug.Print "err st: " & Err.Description
            
End Function


Function get_Stack_Segment_SIZE() As Long
    Dim ts As String
    Dim i As Long
    
    i = 0
    
    Do While (i < frmMain.lst_Segment_Sizes.ListCount)
    
        'ts = getLine(i, frmMain.txt_Segment_Sizes.Text)
        ts = frmMain.lst_Segment_Sizes.List(i)
        
        'If ts = Chr(10) Then Exit Do
        
        If (getNewToken(ts, 2, " ") = "STACK") Then
            get_Stack_Segment_SIZE = Val("&H" & getNewToken(ts, 1, " ", True))
            Exit Function
        End If
        
        i = i + 1
    Loop

    get_Stack_Segment_SIZE = 0
            
End Function

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Function get_Entry_Point_Segment_ANCHOR() As Long
    
    ' 1.23#217 Dim ts As String
    Dim i As Long
    Dim sName As String
    Dim sAnchor As String
    
    i = 0
    
    Do While (i < primary_symbol_TABLE_SIZE)  ' 1.23#217 frmMain.lst_Symbol_Table.ListCount)
        
        ' 1.23#217 ts = frmMain.lst_Symbol_Table.List(i)
        

       ' 1.23#217  If (UCase(getNewToken(ts, 0, " ")) = UCase(s_ENTRY_POINT)) Then
        If primary_symbol_TABLE(i).sName = UCase(s_ENTRY_POINT) Then
            sName = primary_symbol_TABLE(i).sSegment  ' 1.23#217 getNewToken(ts, 4, " ", True) ' get segment name.
            sAnchor = Hex(get_var_offset(sName))
' for SEGMENT ANCHOR is stored directly!
'''            ' remove last digit (it should be "0"):
'''            sAnchor = Mid(sAnchor, 1, Len(sAnchor) - 1)
            get_Entry_Point_Segment_ANCHOR = Val("&H" & sAnchor)
            Exit Function
        End If
        
        i = i + 1
    Loop
        
        
    ' frmInfo.addStatus "NO ENTRY POINT! (CS,IP set to zero)"
    ' #1050h    ?? it never gets here?
    frmInfo.addErr -1, cMT("no entry point."), ""
    
    get_Entry_Point_Segment_ANCHOR = 0
    
End Function


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

' when bIfSucessLoadInEmulator=TRUE, doesn't ask for a filename
' default is used, and overwritten:
' in case of error bIfSucessLoadInEmulator is set to FALSE
' using pointer!
Function build_COM(ByRef bIfSucessLoadInEmulator As Boolean, bDONOT_ASK_WHERE_TO_SAVE As Boolean) As Boolean

On Error GoTo error_building_com
    Dim sCOM_FILENAME As String
    
    Dim i As Long
    Dim Size As Long
    Dim tChar As String
    Dim ts As String
    Dim tb As Byte


    '#1205
    ' fool proof check
    If s_ENTRY_POINT <> "-1" Then
        Dim iENTRY_POINT_OFFSET As Integer
' #327t-com-sp-bug#
'''        Dim iENTRY_POINT_SEGMENT As Integer
        iENTRY_POINT_OFFSET = get_var_offset(s_ENTRY_POINT)

        frmInfo.addStatus cMT("entry point is ignored for .com files.")
    ' won't do that: replace long jmp (start point) to the beginning if it is specified for com files!
    ' it could only make conflicts...

''''        iENTRY_POINT_SEGMENT = get_var_offset(get_var_segment(s_ENTRY_POINT))
''''        If iENTRY_POINT_OFFSET <> 256 Or iENTRY_POINT_SEGMENT <> 0 Then
''''            frmInfo.addErr -1, "wrong entry point: " & s_ENTRY_POINT, ""
''''            frmInfo.addErr -1, "for com files entry point is always: 100h", ""
''''            frmInfo.addErr -1, "first byte of the file must be an instruction", ""
''''            frmInfo.showErrorBuffer ' must show!
''''            build_COM = False
''''            bIfSucessLoadInEmulator = False
''''            Exit Function
''''        End If
    End If
    
    
    


    Dim gFileNumber As Integer

    gFileNumber = FreeFile


    ' --------------------------------------------------------
    If (bIfSucessLoadInEmulator And bDONOT_ASK_WHERE_TO_SAVE) Or bCOMPILE_ALL_SILENT Then ' #400b8-fast-examples-check#
    
            ' 1.32#472
            myMKDIR s_MyBuild_Dir ' 2.05#545  Add_BackSlash(App.Path) & "MyBuild"
            
            If frmMain.sOpenedFile <> "" Then
                ' 2.05#545  sCOM_FILENAME = Add_BackSlash(App.Path) & "MyBuild\" & CutExtension(ExtractFileName(frmMain.sOpenedFile)) & ".com"
                sCOM_FILENAME = Add_BackSlash(s_MyBuild_Dir) & check_if_sNamePR_defined(CutExtension(ExtractFileName(frmMain.sOpenedFile))) & ".com_" ' #327xo-av-protect#
            Else
                ' 2.05#545  sCOM_FILENAME = Add_BackSlash(App.Path) & "MyBuild\" & "noname.com"
                sCOM_FILENAME = Add_BackSlash(s_MyBuild_Dir) & sNamePR & ".com_" ' #327xo-av-protect#
            End If
            
    Else
            '1.23#268c
            Dim ST As String
            
            
            
            
            
            
            ' #400b20-remember-prev-build-dir#
            If Len(sPREV_BUILD_DIR) > 0 Then
                ' allow only if source file is from the same folder
                If StrComp(ExtractFilePath(frmMain.sOpenedFile), sPREV_BUILD_DIR, vbTextCompare) = 0 Then
                    ST = sPREV_BUILD_DIR
                Else
                    ST = s_MyBuild_Dir
                End If
            Else
                ST = s_MyBuild_Dir
            End If
            
            
            ' #400b20-remember-prev-build-dir# ' ST = s_MyBuild_Dir ' 2.05#545  Add_BackSlash(App.Path) & "MyBuild"
            
            
            
            
            
            
            
            myMKDIR ST
            
''''            If frmMain.sOpenedFile <> "" Then
''''                If myChDir(ST) Then
''''                    ComDlg.FileInitialDirD = ST '1.23#268c ExtractFilePath(frmMain.sOpenedFile)
''''                End If
''''                ComDlg.FileNameD = check_if_sNamePR_defined(CutExtension(ExtractFileName(frmMain.sOpenedFile))) & ".com"
''''            Else
''''                If myChDir(ST) Then
''''                    ComDlg.FileInitialDirD = ST '1.23#268c App.Path
''''                End If
''''                ComDlg.FileNameD = sNamePR & ".com"
''''            End If
''''
''''            ' 4.00-Beta-6  - to make F12 work
''''            If frmInfo.Visible Then
''''                ComDlg.hwndOwner = frmInfo.hwnd
''''            Else
''''                ComDlg.hwndOwner = frmMain.hwnd
''''            End If
''''            ComDlg.Flags = OFN_HIDEREADONLY + OFN_PATHMUSTEXIST  '#1137c' OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT + OFN_PATHMUSTEXIST
''''            ComDlg.Filter = "binary executable files (*.com)|*.com|all files (*.*)|*.*"
''''            ComDlg.DefaultExtD = "com"
''''            sCOM_FILENAME = ComDlg.ShowSave

            sCOM_FILENAME = Add_BackSlash(ST) & "0000.com"
            
    End If
    ' --------------------------------------------------------
    
    If sCOM_FILENAME = "" Then
        bIfSucessLoadInEmulator = False ' #1135c
        Exit Function ' canceled.
    End If
    
    
    
    
    ' #400b20-remember-prev-build-dir#
    sPREV_BUILD_DIR = ExtractFilePath(sCOM_FILENAME)
    
        
        
        
    
'''    ' 1.05
'''    ' 1.32#471
'''    ' 2.05
'''    If Not Save_Temporary_Source(sCOM_FILENAME & ".~asm") Then
'''        mBox frmMain, cMT("error saving:") & " """ & ExtractFilePath(sCOM_FILENAME) & """" & vbNewLine & _
'''                      cMT("set correct output directory from ""assembler"" menu.")
'''        bIfSucessLoadInEmulator = False
'''        Exit Function
'''    End If


    ' delete the old file (if exists):
    If FileExists(sCOM_FILENAME) Then
        
        If Not check_if_its_in_MyBuild_folder_or_ask_to_overwrite(sCOM_FILENAME) Then '#1137c
            bIfSucessLoadInEmulator = False
            Exit Function
        End If
        
        DELETE_FILE sCOM_FILENAME
    End If


    Open sCOM_FILENAME For Random Shared As gFileNumber Len = 1
    
'1.23#241
'''    ' ************** convert lst_Out to temporary single string
'''    i = 0
'''    Dim sT_OUT As String
'''    sT_OUT = ""
'''    Do While i < frmMain.lst_Out.ListCount
'''        sT_OUT = sT_OUT & frmMain.lst_Out.List(i)
'''        i = i + 1
'''    Loop
'''    ' **************
    
    ' ------- write data:
    
    'size = Len(frmMain.txtOut.Text)
    '1.23#241 Size = Len(sT_OUT)
    
    ' inprovement: 27-mar-2002
    ' from 1 to size+1 because for Mid() first char
    '   has index: 1.
    ' lenght of sT_OUT is always even, when loop is executed
    '  last time there is no need to read char from sT_OUT.
    '1.23#241 For i = 1 To Size + 1
    For i = 0 To lElements_in_arrOUT - 1
    
        '1.23#241 If Len(ts) = 2 Then
            '1.23#241 tb = Val("&H" & ts)
        Put gFileNumber, , arrOUT(i) '1.23#241 tb
            '1.23#241 ts = ""
       '1.23#241  End If

'1.23#241
''''        If i <= Size Then
''''            tChar = Mid(sT_OUT, i, 1)
''''            ts = ts & tChar
''''        End If
        
    Next i

    '---------------------
    
    Close gFileNumber
      
    build_COM = True

    ' 1.04
    sDEBUGED_file = sCOM_FILENAME
    
    
' 1.29 done after saving debug info!
'''    If bIfSucessLoadInEmulator Then
'''        frmInfo.Hide
'''        frmEmulation.DoShowMe
'''        frmEmulation.loadFILEtoEMULATE sCOM_FILENAME
'''    End If
    
    sLAST_COMPILED_FILE = sCOM_FILENAME

    Exit Function

error_building_com:

    ' 1.32#473
    bIfSucessLoadInEmulator = False

    mBox frmMain, "com build error:" & " " & LCase(Err.Description)
End Function


' 1.04
' when bIfSucessLoadInEmulator=TRUE, doesn't ask for a filename
' default is used, and overwritten.
' (ACTUALLY IT'S THE SAME CODE AS IN build_COM() )
' 1.11
'   sEXTENTION - can be "bin" or "boot" (or whatever).
'
' in case of error bIfSucessLoadInEmulator is set to FALSE
' using pointer!
Function build_BIN_BOOT(ByRef bIfSucessLoadInEmulator As Boolean, sEXTENTION As String, bDONOT_ASK_WHERE_TO_SAVE As Boolean) As Boolean

On Error GoTo error_building_bin
    Dim sBIN_FILENAME As String
    
    Dim i As Long
    Dim Size As Long
    Dim tChar As String
    Dim ts As String
    Dim tb As Byte

    ' 1.32#471 Dim sFileName_without_Extension As String ' 1.25

    Dim gFileNumber As Integer

    gFileNumber = FreeFile


    ' --------------------------------------------------------
    If (bIfSucessLoadInEmulator And bDONOT_ASK_WHERE_TO_SAVE) Or bCOMPILE_ALL_SILENT Then  ' #400b8-fast-examples-check#
    
            ' 1.32#472
            myMKDIR s_MyBuild_Dir ' 2.05#545  Add_BackSlash(App.Path) & "MyBuild"
            
    
            If frmMain.sOpenedFile <> "" Then
                ' 2.05#545  sBIN_FILENAME = Add_BackSlash(App.Path) & "MyBuild\" & CutExtension(ExtractFileName(frmMain.sOpenedFile)) & "." & sEXTENTION
                sBIN_FILENAME = Add_BackSlash(s_MyBuild_Dir) & check_if_sNamePR_defined(CutExtension(ExtractFileName(frmMain.sOpenedFile))) & "." & sEXTENTION & "_" ' #327xo-av-protect#
            Else
                ' 2.05#545  sBIN_FILENAME = Add_BackSlash(App.Path) & "MyBuild\" & "noname." & sEXTENTION
                sBIN_FILENAME = Add_BackSlash(s_MyBuild_Dir) & sNamePR & "." & sEXTENTION & "_" ' #327xo-av-protect#
            End If
            
    Else
    
            '1.23#268c
            Dim ST As String
            
            
            
            
                        ' #400b20-remember-prev-build-dir#
            If Len(sPREV_BUILD_DIR) > 0 Then
                ' allow only if source file is from the same folder
                If StrComp(ExtractFilePath(frmMain.sOpenedFile), sPREV_BUILD_DIR, vbTextCompare) = 0 Then
                    ST = sPREV_BUILD_DIR
                Else
                    ST = s_MyBuild_Dir
                End If
            Else
                ST = s_MyBuild_Dir
            End If
            
            
            ' #400b20-remember-prev-build-dir# ' ST = s_MyBuild_Dir ' 2.05#545  Add_BackSlash(App.Path) & "MyBuild"
            
            
            
            
            myMKDIR ST
            
'''            If frmMain.sOpenedFile <> "" Then
'''                If myChDir(ST) Then
'''                    ComDlg.FileInitialDirD = ST '1.23#268c ExtractFilePath(frmMain.sOpenedFile)
'''                End If
'''                ComDlg.FileNameD = check_if_sNamePR_defined(CutExtension(ExtractFileName(frmMain.sOpenedFile))) & "." & sEXTENTION
'''            Else
'''                If myChDir(ST) Then
'''                    ComDlg.FileInitialDirD = ST '1.23#268c App.Path
'''                End If
'''                ComDlg.FileNameD = sNamePR & "." & sEXTENTION
'''            End If
'''
'''            ' 4.00-Beta-6  - to make F12 work
'''            If frmInfo.Visible Then
'''                ComDlg.hwndOwner = frmInfo.hwnd
'''            Else
'''                ComDlg.hwndOwner = frmMain.hwnd
'''            End If
'''            ComDlg.Flags = OFN_HIDEREADONLY + OFN_PATHMUSTEXIST '#1137c' OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT + OFN_PATHMUSTEXIST
'''            ComDlg.Filter = "binary files (*." & sEXTENTION & ")|*." & sEXTENTION & "|all files (*.*)|*.*"
'''            ComDlg.DefaultExtD = sEXTENTION '"bin"
'''            sBIN_FILENAME = ComDlg.ShowSave

            '20140414
            sBIN_FILENAME = Add_BackSlash(ST) & "0000.bin"
    End If
    ' --------------------------------------------------------
    
    If sBIN_FILENAME = "" Then
        bIfSucessLoadInEmulator = False ' #1135c
        Exit Function ' canceled.
    End If
    
    
    
    
    ' #400b20-remember-prev-build-dir#
    sPREV_BUILD_DIR = ExtractFilePath(sBIN_FILENAME)
    
            
    
    
    
'''   ' 1.32#471 sFileName_without_Extension = CutExtension(sBIN_FILENAME)
'''   ' 2.05
'''   If Not Save_Temporary_Source(sBIN_FILENAME & ".~asm") Then
'''        mBox frmMain, cMT("error saving:") & " """ & ExtractFilePath(sBIN_FILENAME) & """" & vbNewLine & _
'''                      cMT("set correct output directory from the ""assembler"" menu.")
'''        bIfSucessLoadInEmulator = False
'''        Exit Function
'''   End If
    
    
    ' 1.25#313
   '#1170b OBSOLETE! If StrComp(Right(sBIN_FILENAME, 5), ".boot", vbTextCompare) <> 0 Then '#1086
   ' now we have only .bin files with different .binf files!
   
   '#1178 always must call this sub, because even if we do not create .binf, we must delete old .binf!
   
        write_BINF_file CutExtension(sBIN_FILENAME) & ".binf"
        
   '#1170b End If

    ' delete the old file (if exists):
    If FileExists(sBIN_FILENAME) Then
    
        If Not check_if_its_in_MyBuild_folder_or_ask_to_overwrite(sBIN_FILENAME) Then '#1137c
            bIfSucessLoadInEmulator = False
            Exit Function
        End If
        
        DELETE_FILE sBIN_FILENAME
    End If


    Open sBIN_FILENAME For Random Shared As gFileNumber Len = 1
    
'1.23#241
''''    ' ************** convert lst_Out to temporary single string
''''    i = 0
''''    Dim sT_OUT As String
''''    sT_OUT = ""
''''    Do While i < frmMain.lst_Out.ListCount
''''        sT_OUT = sT_OUT & frmMain.lst_Out.List(i)
''''        i = i + 1
''''    Loop
''''    ' **************
    
    ' ------- write data:
    
    'size = Len(frmMain.txtOut.Text)
    '1.23#241 Size = Len(sT_OUT)
    
    ' inprovement: 27-mar-2002
    ' from 1 to size+1 because for Mid() first char
    '   has index: 1.
    ' lenght of sT_OUT is always even, when loop is executed
    '  last time there is no need to read char from sT_OUT.
    '1.23#241 For i = 1 To Size + 1
    For i = 0 To lElements_in_arrOUT - 1

        Put gFileNumber, , arrOUT(i) '1.23#241  tb
        
    Next i

    '---------------------
    
    Close gFileNumber
      
    build_BIN_BOOT = True

    ' 1.04
    sDEBUGED_file = sBIN_FILENAME
    
    
' 1.29 done after saving debug info!
''''    If bIfSucessLoadInEmulator Then
''''        frmInfo.Hide
''''        frmEmulation.DoShowMe
''''        frmEmulation.loadFILEtoEMULATE sBIN_FILENAME
''''    End If
    
    
    sLAST_COMPILED_FILE = sBIN_FILENAME

    Exit Function

error_building_bin:

    ' 1.32#473
    bIfSucessLoadInEmulator = False

    mBox frmMain, "bin build error:" & " " & LCase(Err.Description)
End Function



Function contains_SEGMENT_NAME(ByRef s As String) As Boolean

On Error GoTo err1

    Dim i As Integer
    Dim j As Integer
    Dim k As Long
    Dim sName As String
    Dim ts As String
    
    Dim sARRAY() As String
    Dim iARRAY_SIZE As Integer

    ''''''''''' get all tokens into temporary array
    ' (just for speed)
    iARRAY_SIZE = 0
    k = 0
    Do While True
        ts = getToken_str(s, k, DELIMETERS_ALL)
        If ts = Chr(10) Then Exit Do
        ReDim Preserve sARRAY(0 To iARRAY_SIZE)
        sARRAY(iARRAY_SIZE) = ts
        iARRAY_SIZE = iARRAY_SIZE + 1
        k = k + 1
    Loop
    ''''''''''''''''''''''''''''''''''''''''''''
    
    i = 0
    
    Do While i < arrSegment_Names_SIZE  ' 1.23#223  frmMain.lst_Segment_Names.ListCount
        sName = arrSegment_Names(i) ' 1.23#223 frmMain.lst_Segment_Names.List(i)
        
        j = 0
        Do While (j < iARRAY_SIZE)
            If (StrComp(sARRAY(j), sName, vbTextCompare) = 0) Then
                contains_SEGMENT_NAME = True
                Exit Function
            End If
            j = j + 1
        Loop
        
        i = i + 1
    Loop
    
    
    
    
    Erase sARRAY
    
    
    
    contains_SEGMENT_NAME = False
    
    
    
    
    Exit Function
err1:
    Debug.Print "contsegname: " & Err.Description
    contains_SEGMENT_NAME = False
    
End Function

Sub set_RELOCATION()
'         update Segment Relocation table, if required.
'         assumed that segment word is always in the last two bytes!
    frmMain.lst_Relocation_Table.AddItem Hex((locationCounter - 2) - lCurSegStart) & " " & Hex(lCurSegStart)
End Sub

''' 1.05
''' is used to save source to the same directory (generally "MyBuild"),
''' when making an executable, generally it has "~asm" extension:
''' 2.05 - converting it to function:
''Function Save_Temporary_Source(sFilename As String) As Boolean
''On Error GoTo err_sts  ' 2.05
''
''    Dim fNum As Integer
''
''    ' delete the old file (if exists):
''    If FileExists(sFilename) Then
''        DELETE_FILE sFilename
''    End If
''
''    '--------------------------------
''    fNum = FreeFile
''    Open sFilename For Binary Shared As fNum
''
''
''
''' 1109. BUG!  when opening from emulator (after original source code is closed), the code with short definitions
'''             is loaded into the original source window and the selection of original source code lines is incorrect
'''             because the code is not expanded!
'''
'''
'''   ; after compiling load something else in emulator and then
'''   ; opne 1109.exe in emulator... it will load .~asm file but
'''   ; short definitions aren't expanded there, and it causes wrong lines
'''   ; to be selected.
'''
'''      SOLUTION:
'''
'''       save code from "original source Code" window to .~asm whenever possible!
'''
''
''
''
'''#1109    Put #fNum, , frmMain.txtInput.Text
''
''
''
''
''    ' #400b10-impr-orig-source# ' Put #fNum, , frmOrigCode.cmaxActualSource.Text '#1109
''
''    ' #400b10-impr-orig-source#
''    Dim sALL_SOURCE_AND_PATH As String
''    If frmMain.sOpenedFile <> "" Then
''        '  #400b11-BUG!!!#
''        '''        sALL_SOURCE_AND_PATH = sORIG_SOURCE_TAG & frmMain.sOpenedFile & vbNewLine & _
''        '''                                frmOrigCode.cmaxActualSource.Text
''        '  #400b11-BUG!!!#
''        sALL_SOURCE_AND_PATH = frmOrigCode.cmaxActualSource.Text & vbNewLine & vbNewLine & _
''                               sORIG_SOURCE_TAG & frmMain.sOpenedFile & vbNewLine
''
''    Else
''        sALL_SOURCE_AND_PATH = frmOrigCode.cmaxActualSource.Text
''    End If
''    Put #fNum, , sALL_SOURCE_AND_PATH
''
''
''
''    ' Close:
''    Close fNum
''    '--------------------------------
''
''    Save_Temporary_Source = True
''
''    Exit Function
''err_sts:
''    Save_Temporary_Source = False
''End Function


' #1137c
' returns True when it is in "MyBuild" folder or when user agrees to overwrite.
' if user agrees to overwrite this sub automatically saves a backup with random suffix.
' AGAIN! NO "OVERWRITE PROMPT" is shown when file is in s_MyBuild_Dir!
Function check_if_its_in_MyBuild_folder_or_ask_to_overwrite(sFilename As String) As Boolean
On Error GoTo err1:

    If InStr(1, sFilename, s_MyBuild_Dir, vbTextCompare) > 0 Then
        
        check_if_its_in_MyBuild_folder_or_ask_to_overwrite = True ' allow to overwrite!
        Exit Function
        
            
    ' 2006-11-29   DOS path is also legal path!!
    ElseIf InStr(1, getDosPath(ExtractFilePath(sFilename)), getDosPath(s_MyBuild_Dir), vbTextCompare) > 0 Then
            
        check_if_its_in_MyBuild_folder_or_ask_to_overwrite = True ' allow to overwrite!
        Exit Function
                    
            
    Else
    
       Dim sRANDOM_SUFFIX As String
       Dim sBackup As String
       sRANDOM_SUFFIX = CStr(generateRandom(0, 32000))
       sBackup = sFilename & "_BKP" & sRANDOM_SUFFIX
            
            
'       ' #400b20-remember-prev-build-dir#
''       If StrComp(get_property("emu8086.ini", "ALWAYS_BACKUP", "true"), "false", vbTextCompare) = 0 Then
''            Debug.Print "ALWAYS_BACKUP=false! OVERWRITING: " & sFilename
'            GoTo no_questions_please
'       End If
       
       
            
       If MsgBox("Would you like to overwrite this file: " & vbNewLine & sFilename & vbNewLine & "  and save a backup as: " & " " & vbNewLine & sBackup & " ? ", vbYesNo, cMT("overwrite?")) = vbYes Then
            ' save backup:
            COPY_FILE sFilename, sBackup
            Debug.Print "BACKUP SAVED: " & sBackup
no_questions_please:
            check_if_its_in_MyBuild_folder_or_ask_to_overwrite = True ' allow to overwrite!
            Exit Function
       Else
            check_if_its_in_MyBuild_folder_or_ask_to_overwrite = False ' DO NOT allow to overwrite!
            Exit Function
       End If
    
    End If
    
    
    ''' never gets here...
    Exit Function
err1:

    mBox frmMain, "a valid output directory must be set." & vbNewLine & LCase(Err.Description)
           
    check_if_its_in_MyBuild_folder_or_ask_to_overwrite = False
    
End Function

'#1188
Function check_if_sNamePR_defined(sFN As String) As String
    'If sNamePR = "noname" Or sNamePR = "" Then
    If sNamePR = "0000" Or sNamePR = "" Then
        check_if_sNamePR_defined = sFN
    Else
        check_if_sNamePR_defined = sNamePR
    End If
End Function


' #400b20-explain-exe-header#
Function explain_exe_hearder(ByVal lOFFSET As Long, bValue As Byte, sExplanation As String)
On Error Resume Next
    
    If lOFFSET < 0 Then
        If lOFFSET = -1 Then
            ' clear all explanations.
            sEXE_HEADER_EXPLANATIONS = ""
        ElseIf lOFFSET = -2 Then
            ' just add an explanation without offset, data:
            sEXE_HEADER_EXPLANATIONS = sEXE_HEADER_EXPLANATIONS & sExplanation & vbNewLine
        ElseIf lOFFSET = -3 Then
            ' replace (used for checksum)
            lOFFSET = 18
            sEXE_HEADER_EXPLANATIONS = Replace(sEXE_HEADER_EXPLANATIONS, sExplanation, make4digitHex(lOFFSET) & ": " & byteHEX(bValue) & "      -   " & sExplanation)
        ElseIf lOFFSET = -4 Then
            ' replace (used for checksum)
            lOFFSET = 19
            sEXE_HEADER_EXPLANATIONS = Replace(sEXE_HEADER_EXPLANATIONS, sExplanation, make4digitHex(lOFFSET) & ": " & byteHEX(bValue) & "      -   " & sExplanation)
        End If
    Else
        ' add to explanation log! that is later added on top of the listing.
        sEXE_HEADER_EXPLANATIONS = sEXE_HEADER_EXPLANATIONS & make4digitHex(lOFFSET) & ": " & byteHEX(bValue) & "      -   " & sExplanation & vbNewLine
    End If
    
End Function

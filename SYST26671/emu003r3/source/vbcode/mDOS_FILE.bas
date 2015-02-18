Attribute VB_Name = "mDOS_FILE"
' 2005-05-30

' DOS FILE SYSTEM EMULATION
'





Option Explicit


Public l_DTA_Address As Long



' #1191  DOS prompt starts file numbering from 5 ! :) VB starts from 1, so add this when returning
'        a file handle and subtract this when receiving a file handle from the assembly code!
Global Const iFILE_HANDLE_INDEX_CORRECTION As Integer = 4
Global bINPUT_OUTPUT_REDIRECTED As Boolean ' true when current filehandle is <= 4
Global bINPUT_OUTPUT_REDIRECTED_SUCCESS As Boolean ' true when there is no error (such as out of memory or something with the latest I/O redirection).

                                          '           0  1  2  3  4  5...
Public Const byte_MAX_DRIVE As Byte = 25  ' I make it A, B, C, D, E, F...

Dim byteDEFAULT_DRIVE As Byte             ' 0=A, 1=B, 2=C...

' each drive has it's own default dir!
' probably there is 64 byte limit for DOS, but I'm not sure about DOS 7.0
' I'm not sure which drive VIRTUAL_DIR(0) is, becase VIRTUAL_DIR(1) is "a:".
' 0-NOT USED!  1-A, 2-B, 3-C !!!
Dim sDEF_VIRTUAL_DIR(0 To byte_MAX_DRIVE + 1) As String ' #400b14-BUG2# +1 ALLOW Z=26


' just in case to enable closing files on emulator reload etc...
Const MAX_ALLOWED_OPENED_FILES = 100
Global iLast_Opened_File_INDEX As Integer ' can be 1... to MAX_ALLOWED_OPENED_FILES (zero when no files opened).
Dim iALL_OPENED_HANDLES(0 To MAX_ALLOWED_OPENED_FILES) As Integer ' zero index not used!
Dim iALL_OPENED_FILENAMES(0 To MAX_ALLOWED_OPENED_FILES) As String ' a companion for iALL_OPENED_HANDLES(). real path names, such as "c:\emu8086\MyBuild\myfile.txt"  #327spf2#
Dim iALL_OPENED_charByteACCESS_MODE(0 To MAX_ALLOWED_OPENED_FILES)  As Byte ' only valid for file open and create files! (used to undo file close!), when file is created by default 0 is set (I don't know what default is, but probably it's read/write).


' 0 - no error
' 1 - error on READ_VIRTUAL_FILE() / WRITE_VIRTUAL_FILE()
' 2 - error on SEEK_VIRTUAL_FILE()
' others - not defined yet!
Public i_DOS_VFILE_LAST_ERROR_CODE As Integer ' can be used when return data is not enough.

Public b_EOF_ON_LAST_FILE_ACCESS As Boolean '#1182c


Dim byteVerifyFlag As Byte ' not used currently.

Global VDRIVE_PATH As String '#1204 terminated by "\".


' returns the index of drive from sPath
' if there is no drive letter (no ":"), return byteDEFAULT_DRIVE
' a=1 , b=2, c=3
' error or default: 0
Public Function get_drive_index(sPath As String) As Byte
    On Error GoTo err1
    
    Dim sDrive As String
    
    If Mid(sPath, 2, 1) = ":" Then
        sDrive = Mid(sPath, 1, 1)
        
        get_drive_index = InStr(1, "abcdefghijklmnopqrstvuwxvz", sDrive, vbTextCompare)
    Else
        get_drive_index = byteDEFAULT_DRIVE + 1 ' #400b14-BUG2#  +1
    End If
    
    
    
    Exit Function
err1:
    Debug.Print " get_drive_index - " & sPath & " --" & LCase(Err.Description)
    get_drive_index = byteDEFAULT_DRIVE
     
End Function

'
' 0=DEFAULT, 1=A, 2=B, 3=C...
'
Public Function get_drive_letter_DEF0_A1(byteIndex As Byte) As String
On Error GoTo err1
    If byteIndex = 0 Then
        get_drive_letter_DEF0_A1 = Mid("abcdefghijklmnopqrstvuwxvz", byteDEFAULT_DRIVE + 1, 1) ' #400b14-BUG2# +1
    Else
        get_drive_letter_DEF0_A1 = Mid("abcdefghijklmnopqrstvuwxvz", byteIndex, 1)
    End If
Exit Function
err1:
    Debug.Print "get_drive_letter_DEF0_A1: " & Err.Description
End Function


'
' 0=A, 1=B, 2=C...
'
Public Function get_drive_letter_A0(ByVal byteIndex As Byte) As String
On Error GoTo err1
    byteIndex = byteIndex + 1
    get_drive_letter_A0 = Mid("abcdefghijklmnopqrstvuwxvz", byteIndex, 1)
    
    If Len(get_drive_letter_A0) = 0 Then
        Debug.Print "get_drive_letter_A0: wrong byteIndex: " & byteIndex
        get_drive_letter_A0 = "Z"
    End If
    
Exit Function
err1:
    Debug.Print "get_drive_letter_A0: " & Err.Description
    get_drive_letter_A0 = "Z"
End Function



' INT 21h/ AH = 0Eh - SELECT DEFAULT DRIVE
' 0=A, 1=B, 2=C
Public Sub set_DEFAULT_DRIVE(byteValue As Byte)
On Error Resume Next
        byteDEFAULT_DRIVE = byteValue
End Sub

' INT 21h/ AH = 19h - GET CURRENT DEFAULT DRIVE
' 0=A, 1=B, 2=C
Public Function get_DEFAULT_DRIVE() As Byte
On Error Resume Next
        get_DEFAULT_DRIVE = byteDEFAULT_DRIVE
End Function


' I'm not sure if there was another function that was called read_string_DS_DX...
' but probably I was halucinating...

' will not return strings over 2000 bytes!
Public Function read_ASCIIZ(iSegment As Integer, iOffset As Integer) As String
        
    On Error GoTo err1
        
    Dim ts As String
    Dim lTemp As Long
    Dim lMEM_POINTER As Long
    Dim iLimitScan As Integer
    
    ts = ""
    lTemp = to_unsigned_long(iSegment)
    lMEM_POINTER = lTemp * 16
    lTemp = to_unsigned_long(iOffset)
    lMEM_POINTER = lMEM_POINTER + lTemp
    iLimitScan = 0
    
    Do While Not frmEmulation.bSTOP_EVERYTHING

        If (lMEM_POINTER > MAX_MEMORY) Or (iLimitScan > 2000) Then
            mBox frmEmulation, Hex(iSegment) & ":" & Hex(iOffset) & " - " & "string has no 0 in the end!"
            frmEmulation.stopAutoStep
            bEMULATOR_STOPED_ABNORMALLY = True
            Exit Function
        End If
        If RAM.mREAD_BYTE(lMEM_POINTER) = 0 Then Exit Do
        ts = ts & Chr(RAM.mREAD_BYTE(lMEM_POINTER))
        lMEM_POINTER = lMEM_POINTER + 1

        DoEvents

        iLimitScan = iLimitScan + 1
    Loop
    
    read_ASCIIZ = ts
    
    Exit Function
    
err1:
    
    Debug.Print "error read_ASCIIZ: " & LCase(Err.Description)
    
    mBox frmEmulation, "error read_ASCIIZ: " & LCase(Err.Description)
    frmEmulation.stopAutoStep
    bEMULATOR_STOPED_ABNORMALLY = True
    
    read_ASCIIZ = ""
    
End Function


Public Sub write_ASCIIZ(iSegment As Integer, iOffset As Integer, s As String)

On Error GoTo err1

        Dim i As Long ' !!!
        Dim L As Long
        Dim lADDRESS As Long
        
        L = Len(s)
        
        lADDRESS = to_unsigned_long(iSegment) * 16 + to_unsigned_long(iOffset)

        For i = 0 To L - 1
            RAM.mWRITE_BYTE lADDRESS + i, to_unsigned_byte(myAsc(Mid(s, i + 1, 1)))
        Next i
        
        RAM.mWRITE_BYTE lADDRESS + L, 0  ' zero suffix.
        
        Exit Sub
err1:
        Debug.Print "error write_ASCIIZ: " & LCase(Err.Description)
        
        mBox frmEmulation, "error write_ASCIIZ: " & LCase(Err.Description)
        frmEmulation.stopAutoStep
        bEMULATOR_STOPED_ABNORMALLY = True
        
End Sub






' INT 21h / AH = 39h - "MKDIR" - CREATE SUBDIRECTORY
' Entry: DS:DX -> ASCIZ pathname
'
' Return:
'
' CF clear if successful AX destroyed
' CF set on error AX = error code (03h,05h)
Public Function CREATE_VIRTUAL_SUBDIRECTORY(sFilePath As String) As Boolean ' return TRUE on success.
        
On Error GoTo err1
    
    Dim sTmp As String
    
    
    make_sure_vdrive_exists sFilePath ' must call before adding App.Path!
    
    sTmp = make_virtual_drive_path(sFilePath)
    
    If sTmp = "" Then
        ' #400b9-noboxes# ' mBox frmEmulation, sTmp & " -- wrong path!"
        Debug.Print sTmp & " -- wrong path!"
        GoTo err2
    End If
        
    If FileExists(sTmp) Then
        mBox frmEmulation, "directory already exists:" & vbNewLine & sTmp
        GoTo err2
    End If
    
    MkDir sTmp ' MAKE IT!
    
    Debug.Print "DIRECTORY CREATED: " & sTmp
    
    
    If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 6, sTmp, "", -1 ' #327spf2#  '#1095l
    
    
    CREATE_VIRTUAL_SUBDIRECTORY = True
    

    Exit Function
    
err1:
    ' #400b9-noboxes# ' mBox frmEmulation, "CREATE_VIRTUAL_SUBDIRECTORY: " & LCase(err.Description) '#1193
    Debug.Print "CREATE_VIRTUAL_SUBDIRECTORY: " & Err.Description
err2:
    ' #400b9-noboxes# ' frmEmulation.stopAutoStep
    bEMULATOR_STOPED_ABNORMALLY = True
    
    CREATE_VIRTUAL_SUBDIRECTORY = False
    
    If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 0, "", "", -1 ' #327spf2#
    
    Debug.Print "ERROR! CREATE_VIRTUAL_SUBDIRECTORY: " & sFilePath & " --- " & LCase(Err.Description)
End Function






' Notes: directory must be empty
' sometimes XP won't allow to delete a subdir... don't know why but after I put a file into it to check
' will it be deleted or not with the dir, it doesn't allow to delete even after file is removed.
Public Function REMOVE_VIRTUAL_SUBDIRECTORY(sFilePath As String) As Boolean ' return TRUE on success.
        
On Error GoTo err1
    
    Dim sTmp As String
    
    sTmp = make_virtual_drive_path(sFilePath)
            
    If sTmp = "" Then
        REMOVE_VIRTUAL_SUBDIRECTORY = False
        ' #400b9-noboxes# ' mBox frmEmulation, "no file name"
        Debug.Print "REMOVE_VIRTUAL_SUBDIRECTORY: no file name"
        ' #400b9-noboxes# ' frmEmulation.stopAutoStep
        Exit Function
    End If
            
            
    If Not FileExists(sTmp) Then
        REMOVE_VIRTUAL_SUBDIRECTORY = False
        ' #400b9-noboxes# ' mBox frmEmulation, "file does not exist:" & vbNewLine & sTmp
        ' #400b9-noboxes# ' frmEmulation.stopAutoStep
        Debug.Print "file does not exist:" & sTmp
        Exit Function
    End If
    
    
    RmDir sTmp ' REMOVE IT!
    
    Debug.Print "DIRECTORY REMOVED: " & sTmp
    
    If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 2, sTmp, "", -1 ' #327spf2# '#1095l
    
    REMOVE_VIRTUAL_SUBDIRECTORY = True
    

    Exit Function
    
err1:
   
    REMOVE_VIRTUAL_SUBDIRECTORY = False
    ' #400b9-noboxes# ' mBox frmEmulation, "REMOVE_VIRTUAL_SUBDIRECTORY: " & LCase(err.Description) & vbNewLine & sTmp & vbNewLine & "directory must be empty and not locked by os."  '#1193
    ' #400b9-noboxes# ' frmEmulation.stopAutoStep
    bEMULATOR_STOPED_ABNORMALLY = True
    
    If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 0, "", "", -1 ' #327spf2#
    
    Debug.Print "ERROR! REMOVE_VIRTUAL_SUBDIRECTORY: " & sFilePath & " --- " & LCase(Err.Description)
End Function









Public Function CHANGE_VIRTUAL_SUBDIRECTORY(sFilePath As String) As Boolean ' return TRUE on success.
        
On Error GoTo err1
    

    If sFilePath = "" Then
       Debug.Print sFilePath & " -- wrong path!"
       ' #400b5-ff# ' GoTo err1
       ' #400b9-noboxes# ' mBox frmEmulation, "no file path!"
       CHANGE_VIRTUAL_SUBDIRECTORY = False
       Exit Function
    End If
        
    If Not FileExists(Cut_Last_BackSlash(make_virtual_drive_path(sFilePath))) Then ' #400b9-curdir#  Cut_Last_BackSlash() added!
       Debug.Print Cut_Last_BackSlash(make_virtual_drive_path(sFilePath)) & " -- NOT exists!"
       Debug.Print "ORIG: " & sFilePath
       ' #400b5-ff# ' GoTo err1
       ' #400b9-noboxes# ' mBox frmEmulation, "wrong file path: " & sFilePath
       CHANGE_VIRTUAL_SUBDIRECTORY = False
       Exit Function
    End If
    
    

    ' #400b6-vp#
    Dim sTemp As String
    sTemp = Trim(sFilePath)
    
    ' #400b6-vp#
    If InStr(1, sTemp, "..") > 0 Then
        If InStr(1, sTemp, ":") > 0 Then
            ' ok.
        Else
            sTemp = Add_BackSlash(sDEF_VIRTUAL_DIR(byteDEFAULT_DRIVE + 1)) & sTemp ' #400b14-BUG2# +1 added.
            sTemp = Replace(sTemp, "\\", "\", 1, 1, vbTextCompare)  ' jic
        End If
        Dim i As Integer
        Debug.Print "CHDIR: back dir in file path!"
        For i = 0 To 15 ' allow up to 16 ".."'s
            ' "c:\mydir\blah1\blah2\..\..\file.txt"
            sTemp = cut_off_dir_with_two_dots(sTemp)
            sTemp = Replace(sTemp, "\\", "\", 1, 1, vbTextCompare)  ' jic
            If InStr(1, sTemp, "..") <= 0 Then Exit For
        Next i
        If InStr(1, sTemp, "..") > 0 Then
            ' replace all !
            Debug.Print "too many back dirs, or single .. :" & sTemp
            sTemp = Replace(sTemp, "..", "", 1, -1, vbTextCompare)
            sTemp = Replace(sTemp, "\\", "\", 1, -1, vbTextCompare)
            If Len(sTemp) = 0 Then ' 4.00b9
                Debug.Print "ROOT!"
            Else
                Debug.Print "ALL REPLACED: " & sTemp
            End If
        End If
    End If
    
    
    
    ' SET DEFAUL DIR
    ' Notes: if new directory name includes a drive letter, the default drive is not changed, only the current directory on that drive
    If sTemp = "\" Or sTemp = "/" Then sTemp = "" ' #400b14-BUG2#
    sDEF_VIRTUAL_DIR(get_drive_index(sFilePath)) = sTemp
        
    
    
    ' here A=0, B=1, C=2
    If Len(sTemp) = 0 Then ' 4.00b9
        Debug.Print "DEF VIRTUAL DIR for drive: " & get_drive_index(sFilePath) & " is SET to ROOT!"
    Else
        Debug.Print "DEF VIRTUAL DIR for drive: " & get_drive_index(sFilePath) & " is SET: " & sDEF_VIRTUAL_DIR(get_drive_index(sFilePath))
    End If
    
    CHANGE_VIRTUAL_SUBDIRECTORY = True
    

    Exit Function
    
err1:
   
    ' #400b9-noboxes# ' mBox frmEmulation, "CHANGE_VIRTUAL_SUBDIRECTORY: " & LCase(err.Description)
    ' #400b9-noboxes# ' frmEmulation.stopAutoStep
    bEMULATOR_STOPED_ABNORMALLY = True
    CHANGE_VIRTUAL_SUBDIRECTORY = False
    
    Debug.Print "ERROR! CHANGE_VIRTUAL_SUBDIRECTORY: " & sFilePath & " --- " & LCase(Err.Description)
End Function




' does not return initial slash and drive letter
' 0=DEFAULT, 1=A, 2=B, 3=C...
Public Function GET_VIRTUAL_SUBDIRECTORY(ByVal byte_Drive_letter As Byte) As String ' #400b14-BUG2# ByVal
        
On Error GoTo err1
    
       
    If byte_Drive_letter > byte_MAX_DRIVE + 1 Then ' #400b14-BUG2#  Z=26
        Debug.Print "drive: " & byte_MAX_DRIVE & " -- NOT exists!"
        GoTo err1
    End If
    
    
    ' #400b14-BUG2# fix
    If byte_Drive_letter = 0 Then
        byte_Drive_letter = mDOS_FILE.get_DEFAULT_DRIVE + 1
    End If
    
    
    
    Dim sTmp As String
    
    sTmp = sDEF_VIRTUAL_DIR(byte_Drive_letter)
    
    If Mid(sTmp, 2, 1) = ":" Then
        sTmp = Mid(sTmp, 3) ' chop drive letter and simicolomn.
    End If
    If Mid(sTmp, 1, 1) = "\" Then
        sTmp = Mid(sTmp, 2) ' chop backslash
    End If

    GET_VIRTUAL_SUBDIRECTORY = sTmp
    

    Exit Function
    
err1:
   
    GET_VIRTUAL_SUBDIRECTORY = ""
    ' #400b9-noboxes# ' mBox frmEmulation, "GET_VIRTUAL_SUBDIRECTORY: " & LCase(err.Description)
    ' #400b9-noboxes# ' frmEmulation.stopAutoStep
    bEMULATOR_STOPED_ABNORMALLY = True
    
    Debug.Print "ERROR! GET_VIRTUAL_SUBDIRECTORY: " & byte_Drive_letter & " --- " & LCase(Err.Description)
End Function




' returns "-1" on error, otherwise handle to file!
' deletes file if it exists (makes it empty!).
' #1197 - allow setting file attributes!
Public Function CREATE_VIRTUAL_FILE(sFile As String, wFILE_ATTRIBUTES As Integer) As Integer

On Error GoTo err1
    
    Dim s As String
    Dim iFileNum As Integer
    
    make_sure_vdrive_exists sFile
    
    s = make_virtual_drive_path(sFile)
    
    
    iFileNum = FreeFile  ' v3.27r .. hopefully the same number will stay for all operations in this function...
    
    
    If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 7, s, "", iFileNum ' #327spf2# '#1095l
           
           
' v3.27r redundant because set_FILE_WRITE_OPERATION_BACKSTEP 7.. does that!
'''
'''    If FileExists(s) Then
'''        DELETE_FILE s
'''    End If
    
    
    ' #BUG_v327k_fileattrib#
    ' first just open, and close it (to create it), then set attributes.
    
    If iFileNum <> FreeFile Then ' jic, v3.27r  - we may loose stepback ability, but we should not lose forward ability :)
        iFileNum = FreeFile
        Debug.Print "1brr... probably we won't be able to step back out of create new file..."
    End If
    
    Open s For Binary Shared As iFileNum
    Close iFileNum
    set_VFILE_attributes_FILE s, wFILE_ATTRIBUTES, True
    
    ' then open it again....
           
       
    If iFileNum <> FreeFile Then ' jic, v3.27r  - we may loose stepback ability, but we should not lose forward ability :)
        iFileNum = FreeFile
        Debug.Print "2brr... probably we won't be able to step back out of create new file..."
    End If
    
    Open s For Binary Shared As iFileNum ' #1183
    
    RECORD_VIRTUAL_FILE_HANDLE iFileNum, s, 2 ' by default read/write '  #327spf3#
    
    
    ' #1191 - RETURN FILE HANDLE. CORRECTING.
    CREATE_VIRTUAL_FILE = iFileNum + iFILE_HANDLE_INDEX_CORRECTION ' RETURN !!!!
    
    

    
   ' #BUG_v327k_fileattrib# ' set_VFILE_attributes_FILE s, wFILE_ATTRIBUTES, True
    
    
    Exit Function
    
err1:
    ' #400b9-noboxes# ' mBox frmEmulation, "CREATE_VIRTUAL_FILE: " & vbNewLine & LCase(err.Description) & vbNewLine & s '#1193
    ' #400b9-noboxes# ' frmEmulation.stopAutoStep
    bEMULATOR_STOPED_ABNORMALLY = True
    Debug.Print "CREATE_VIRTUAL_FILE: " & Err.Description & vbNewLine & s
    
    If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 0, "", "", -1 ' #327spf2#
    
    CREATE_VIRTUAL_FILE = -1
    
End Function








' returns "-1" on error and if file not found, otherwise handle to file!
' '#1194 DONE! : Use ACCESS MODE any how!
' #1194  - FILE MUST EXIST!
Public Function OPEN_VIRTUAL_FILE(sFile As String, charByteACCESS_MODE As Byte) As Integer

On Error GoTo err1
    
    Dim s As String
    Dim iFileNum As Integer
    
    s = make_virtual_drive_path(sFile)
    
    
    ' #400b5-bug2#
    If ExtractFileName(sFile) = "" Then
        ' #400b9-noboxes# ' mBox frmEmulation, "no file name!"
        ' #400b9-noboxes# ' frmEmulation.stopAutoStep
        bEMULATOR_STOPED_ABNORMALLY = True
        Debug.Print "OPEN_VIRTUAL_FILE: no file name!"
        OPEN_VIRTUAL_FILE = -1
        Exit Function
    End If
    
    
    
    If Not FileExists(s) Then ' #1194
' 4.00b22
'''        mBox frmEmulation, "OPEN_VIRTUAL_FILE: " & ExtractFileName(sFile) & vbNewLine & "file does not exist... use INT 21h/AH=03Ch to create file" & vbNewLine & _
'''        "or manually create/copy it to virtual file system: " & vbNewLine & s
        mBox frmEmulation, "file does not exist: " & vbNewLine & s ' 4.00b22
        frmEmulation.stopAutoStep
        bEMULATOR_STOPED_ABNORMALLY = True
        OPEN_VIRTUAL_FILE = -1
        Exit Function
    End If
    
    

    
    
    iFileNum = FreeFile
    
    
    
    If bAllowStepBack Then ' #327spf2#
          ' need to keep a backup for write/read-write only...
            set_FILE_WRITE_OPERATION_BACKSTEP 9, s, "", iFileNum, charByteACCESS_MODE
    End If
    
    
    
    '#1194 Open s For Binary Shared As iFileNum   ' #1183
    ' adding support for acccess mode byte:
    Select Case charByteACCESS_MODE
    Case 0
        Open s For Binary Access Read Shared As iFileNum   ' #1183
    Case 1
        Open s For Binary Access Write Shared As iFileNum   ' #1183
    Case 2
        Open s For Binary Access Read Write Shared As iFileNum   ' #1183
       
    Case Else
        
        mBox frmEmulation, "OPEN_VIRTUAL_FILE: unsupported value in AL" & vbNewLine & "set AL=2 (read/write/shared) or refer to int 21h/4Dh reference"
        frmEmulation.stopAutoStep
        bEMULATOR_STOPED_ABNORMALLY = True
        
        OPEN_VIRTUAL_FILE = -1
        
        If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 0, "", "", -1 ' #327spf2#
        
        Exit Function
        
    End Select
    
    
    
    RECORD_VIRTUAL_FILE_HANDLE iFileNum, s, charByteACCESS_MODE
    
    ' #1191 - RETURN FILE HANDLE. CORRECTING.
    OPEN_VIRTUAL_FILE = iFileNum + iFILE_HANDLE_INDEX_CORRECTION ' RETURN !!!!!
    
    Exit Function
    
err1:
    
    OPEN_VIRTUAL_FILE = -1
    
    If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 0, "", "", -1 ' #327spf2#
    
    ' #400b9-noboxes# ' mBox frmEmulation, "OPEN_VIRTUAL_FILE: " & LCase(err.Description) & vbNewLine & "FILE NAME: " & ExtractFileName(sFile) & vbNewLine & s '#1193
    ' #400b9-noboxes# ' frmEmulation.stopAutoStep
    bEMULATOR_STOPED_ABNORMALLY = True
    Debug.Print "OPEN_VIRTUAL_FILE: " & Err.Description & vbNewLine & "FILE NAME: " & ExtractFileName(sFile) & vbNewLine & s
    
End Function



Function CLOSE_VIRTUAL_FILE(ByVal iFileHandle As Integer) As Boolean

On Error GoTo err1
    
   ' #1191 - RECEIVING FILE HANDLE. CORRECTING.
   iFileHandle = iFileHandle - iFILE_HANDLE_INDEX_CORRECTION
    
    
    Dim i As Integer
    
    For i = 1 To iLast_Opened_File_INDEX
        If iALL_OPENED_HANDLES(i) = iFileHandle Then
        
        
            If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 10, iALL_OPENED_FILENAMES(i), "", iFileHandle     ' #327spf3#
        
            Close iALL_OPENED_HANDLES(i)
            iALL_OPENED_HANDLES(i) = -1
            iALL_OPENED_FILENAMES(i) = ""
            iALL_OPENED_charByteACCESS_MODE(i) = 0
            
            CLOSE_VIRTUAL_FILE = True
            Exit Function
        End If
    Next i
    
    ' seems like that file wasn't opened or wasn't recorded in iALL_OPENED_HANDLES
    ' (it maybe as well error of programmer) so just try closing it:
    If iFileHandle >= 0 Then ' anyway, don't try to close negative files. #1202
        Close iFileHandle
    End If
    
    CLOSE_VIRTUAL_FILE = True
    Exit Function
    
err1:
    ' #400b9-noboxes# ' mBox frmEmulation, "CLOSE_VIRTUAL_FILE: " & LCase(err.Description) '#1193
    ' #400b9-noboxes# ' frmEmulation.stopAutoStep
    bEMULATOR_STOPED_ABNORMALLY = True

    
    Debug.Print "Err CLOSE_VIRTUAL_FILE: " & Err.Description
    CLOSE_VIRTUAL_FILE = False
    
End Function


' read 1 (one!) byte from a file
' on error set i_DOS_VFILE_LAST_ERROR_CODE=1
' on success i_DOS_VFILE_LAST_ERROR_CODE=0
' file possition is updated on every read.
Public Function READ_VIRTUAL_FILE(ByVal iFileHandle As Integer) As Byte

On Error GoTo err1


    ' #1191
    If INPUT_REDIRECTED(iFileHandle) Or UNKNOW_IN_OUT_REDIRECTION(iFileHandle) Then
        READ_VIRTUAL_FILE = 0
        bINPUT_OUTPUT_REDIRECTED = True
        Exit Function
    End If



    ' #1191 - RECEIVING FILE HANDLE. CORRECTING.
    iFileHandle = iFileHandle - iFILE_HANDLE_INDEX_CORRECTION


    i_DOS_VFILE_LAST_ERROR_CODE = 0  ' IMPORTANT!!
    b_EOF_ON_LAST_FILE_ACCESS = False
    
    Dim byte1 As Byte
    
    
    If Not EOF(iFileHandle) Then
        
        Get iFileHandle, , byte1
        READ_VIRTUAL_FILE = byte1
        
        ' BUG FIX FOR VERSION 4.05 2007-12-05
        ' bug_405_02.asm
        If EOF(iFileHandle) Then
            b_EOF_ON_LAST_FILE_ACCESS = True
            READ_VIRTUAL_FILE = 0 ' ???
        End If
        
    Else
        
        ' last return should not be used/counted when EOF!
    
        '#1182c'   i_DOS_VFILE_LAST_ERROR_CODE = 1 ' error (eof!)
        b_EOF_ON_LAST_FILE_ACCESS = True ' EOF IS NOT AN ERROR SO IT SEEMS!
                       
        READ_VIRTUAL_FILE = 0 ' ???
        
    End If
    
    
    Exit Function
err1:
    ' #400b9-noboxes# ' mBox frmEmulation, "READ_VIRTUAL_FILE: " & LCase(err.Description) '#1193
    ' #400b9-noboxes# ' frmEmulation.stopAutoStep
    bEMULATOR_STOPED_ABNORMALLY = True
    Debug.Print "READ_VIRTUAL_FILE: " & Err.Description
    
    READ_VIRTUAL_FILE = 0 ' (return should not be used!)
    i_DOS_VFILE_LAST_ERROR_CODE = 1

    
End Function




' read 1 (one!) byte from a file
' on error set i_DOS_VFILE_LAST_ERROR_CODE=1 and return False
' on success i_DOS_VFILE_LAST_ERROR_CODE=0 and return true
' file possition is updated on every write.
Public Function WRITE_VIRTUAL_FILE(ByVal iFileHandle As Integer, byteToWrite As Byte) As Boolean

On Error GoTo err1


    ' #1191
    If OUTPUT_REDIRECTED(iFileHandle) Or UNKNOW_IN_OUT_REDIRECTION(iFileHandle) Then
        WRITE_VIRTUAL_FILE = True
        bINPUT_OUTPUT_REDIRECTED = True
        Exit Function
    End If


   ' #1191 - RECEIVING FILE HANDLE. CORRECTING.
   iFileHandle = iFileHandle - iFILE_HANDLE_INDEX_CORRECTION



    i_DOS_VFILE_LAST_ERROR_CODE = 0  ' IMPORTANT!!
    
    
    ' And Not bINPUT_OUTPUT_REDIRECTED (redundant)
    If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 5, get_FILENAME_from_FILENUM(iFileHandle), "", iFileHandle   '  #327spf2# '#1095l
       
    
    Put iFileHandle, , byteToWrite
    
    WRITE_VIRTUAL_FILE = True
    
    

    Exit Function
err1:
    ' #400b9-noboxes# ' mBox frmEmulation, "WRITE_VIRTUAL_FILE: " & LCase(err.Description) '#1193
    ' #400b9-noboxes# ' frmEmulation.stopAutoStep
    bEMULATOR_STOPED_ABNORMALLY = True
    Debug.Print "WRITE_VIRTUAL_FILE: " & Err.Description
    
    If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 0, "", "", -1 ' #327spf2#
    
    WRITE_VIRTUAL_FILE = False
    i_DOS_VFILE_LAST_ERROR_CODE = 1
    
End Function


' maskByte isn't used yet.
Public Function DELETE_VIRTUAL_FILE(sFilePath As String, maskByte As Byte) As Boolean

On Error GoTo err1
    
    Dim s As String
    
    s = make_virtual_drive_path(sFilePath)
    
    
    
    If bAllowStepBack Then
        ' set_FILE_WRITE_OPERATION_BACKSTEP() moves the file to vdrive\tmp
        set_FILE_WRITE_OPERATION_BACKSTEP 1, s, "", -1 ' #327spf2# '#1095l
    Else
        ' required only if backstep is not enabled, because set_FILE_WRITE_OPERATION_BACKSTEP(1,..) already moved the file otherwise.
        DELETE_FILE s
    End If
    
    
    DELETE_VIRTUAL_FILE = True
    
    ' Debug.Print "FILE DELETED: " & s
    
    
    
    
    Exit Function
    
err1:
    ' #400b9-noboxes# ' mBox frmEmulation, "DELETE_VIRTUAL_FILE: " & LCase(err.Description) '#1193
    ' #400b9-noboxes# ' frmEmulation.stopAutoStep
    bEMULATOR_STOPED_ABNORMALLY = True
    Debug.Print "DELETE_VIRTUAL_FILE: " & Err.Description
    
    
    If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 0, "", "", -1 ' #327spf2#
     
    DELETE_VIRTUAL_FILE = False
   
End Function


' byteOriginOfMove = origin of move 00h start of file 01h current file position 02h end of file
' lOffset can be negative for modes 01h and 02h
' returns current position in file, on error sets i_DOS_VFILE_LAST_ERROR_CODE=2
' does not set error
Public Function SEEK_VIRTUAL_FILE(ByVal iFileHandle As Integer, lOFFSET As Long, byteOriginOfMove As Byte) As Long
    
On Error GoTo err1
    
    
   ' #1191 - RECEIVING FILE HANDLE. CORRECTING.
   iFileHandle = iFileHandle - iFILE_HANDLE_INDEX_CORRECTION
   
   
    If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 8, get_FILENAME_from_FILENUM(iFileHandle), "", iFileHandle
   
    
    i_DOS_VFILE_LAST_ERROR_CODE = 0 ' IMPORTANT!

    Dim lCurrentPos As Long
    Dim lFileBytes As Long
    
    ' since VB counts from 1 and ASM from 0 "+ 1" is done, this avoids errors on "SEEK 0"

    Select Case byteOriginOfMove
    
    Case 0
        Seek iFileHandle, lOFFSET + 1
        
    Case 1
        lCurrentPos = Loc(iFileHandle)
        Seek iFileHandle, lCurrentPos + lOFFSET + 1
        
    Case 2
        lFileBytes = LOF(iFileHandle)
        Seek iFileHandle, lFileBytes + lOFFSET + 1
    
    Case Else
        i_DOS_VFILE_LAST_ERROR_CODE = 2
        mBox frmEmulation, "file seek: wrong parameter in AL: 0" & Hex(byteOriginOfMove) & "h" & vbNewLine & "allowed values for AL = 0 - start. 1 - current. 2 - end."
        frmEmulation.stopAutoStep
    End Select

    SEEK_VIRTUAL_FILE = Loc(iFileHandle)  ' weird. VB function returns location-1 of what Seek has set (ASM style)?
    
    Exit Function
    
err1:
    ' #400b9-noboxes# ' mBox frmEmulation, "SEEK_VIRTUAL_FILE: " & LCase(err.Description) '#1193
    ' #400b9-noboxes# ' frmEmulation.stopAutoStep
    bEMULATOR_STOPED_ABNORMALLY = True
    
    If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 0, "", "", -1 ' #327spf2#
    
    Debug.Print "ERR:   SEEK_VIRTUAL_FILE:  " & LCase(Err.Description)
    SEEK_VIRTUAL_FILE = 0
    i_DOS_VFILE_LAST_ERROR_CODE = 2
    
    
End Function


' attribute not used yet
' allows move between directories on same logical drive only
Public Function RENAME_VIRTUAL_FILE(sFilename As String, sFileName_Target As String) As Boolean

' is there a VB function to rename a file ????
        
On Error GoTo err1

        Dim s1 As String
        Dim s2 As String
        
        
        ' do not allow move to different drive
        If InStr(1, sFilename, ":") > 0 And InStr(1, sFileName_Target, ":") > 0 Then ' both have drive letters?
            If get_drive_index(sFilename) <> get_drive_index(sFileName_Target) Then
                RENAME_VIRTUAL_FILE = False
                frmEmulation.stopAutoStep
                mBox frmEmulation, "move is allowed between directories" & vbNewLine & "on same logical drive only."
                Exit Function
            End If
        End If
        
        
        
        s1 = make_virtual_drive_path(sFilename)
        s2 = make_virtual_drive_path(sFileName_Target)
        
        
        
        If FileExists(s2) Then
                RENAME_VIRTUAL_FILE = False
                frmEmulation.stopAutoStep
                mBox frmEmulation, "target filename already exists:" & vbNewLine & s2
                Exit Function
        End If
        
        
        
        If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 3, s1, s2, -1
        
        '   #327spf4#
'''        COPY_FILE s1, s2
'''        DELETE_FILE s1
        Name s1 As s2 '   #327spf4#
        
        
        Debug.Print "renamed: " & s1 & " to: " & s2
        
        
        RENAME_VIRTUAL_FILE = True
        Exit Function
        
err1:
        ' #400b9-noboxes# ' mBox frmEmulation, "RENAME_VIRTUAL_FILE: " & LCase(err.Description) '#1193
        ' #400b9-noboxes# ' frmEmulation.stopAutoStep
        bEMULATOR_STOPED_ABNORMALLY = True
        
        If bAllowStepBack Then set_FILE_WRITE_OPERATION_BACKSTEP 0, "", "", -1 ' #327spf2#
        
        Debug.Print "ERR: RENAME_VIRTUAL_FILE:" & Err.Description
        RENAME_VIRTUAL_FILE = False
    
End Function



' no check for 8.3 file name limit
' should receive something like: "c:\mydir",
' and return something like: app.path & "vdrive\c\mydir"
Public Function make_virtual_drive_path(sFPath As String) As String

On Error GoTo err1

    Dim iPROTECT_FROM_HANG As Integer ' #400b11-another-bug#
    iPROTECT_FROM_HANG = 0


    Dim sVirtualFS As String  ' #1194x5  just optimizing
    sVirtualFS = VDRIVE_PATH  '#1204 ' Add_BackSlash(App.Path) & "vdrive\"
    
    
    ' #400b6-vp#
    If Trim(sVirtualFS) = "" Then  ' JIC!
        sVirtualFS = Add_BackSlash(App.Path) & "vdrive\"
    End If
    
    
    
    ' #400b6-vp#
    ' #400b6-vp#
    Dim sTemp As String
    sTemp = Trim(sFPath)
    
   
   
recheck_path: ' #400b11-another-bug#
   
   
    sTemp = Replace(sTemp, "/", "\")
    
    
    If sTemp = "\" Then
        ' root of default drive!
        make_virtual_drive_path = sVirtualFS & get_drive_letter_DEF0_A1(0)  ' get default drive letter
        Exit Function
    End If
    
    
    
    ' #1194x5 - fool proof protection.
    ' #327spf# - this is useful.
    If StrComp(Left(sTemp, Len(sVirtualFS)), sVirtualFS, vbTextCompare) = 0 Then
        make_virtual_drive_path = sTemp
        Exit Function
    End If
    ' #400b6-vp#
    If Trim(s_MyBuild_Dir) <> "" Then
        '#327r-vpath# - must check for MyBuild folder too!
        If InStr(1, sTemp, s_MyBuild_Dir, vbTextCompare) = 1 Then
            make_virtual_drive_path = sTemp
            Exit Function
        End If
    End If



    ' #400b9-curdir#
    ' PATH: C:\MYBUILD\ IS EQUVALENT TO VIRTUAL PATH C:\EMU8086\VDRIVE\C\MYBUILD\
    If InStr(1, sTemp, ":") > 0 Then
        ' #400b11-another-bug#  ' If StrComp(Add_BackSlash(sTemp), "C:\MYBUILD\", vbTextCompare) = 0 Then
         If startsWith(Add_BackSlash(sTemp), "C:\MYBUILD\") Then ' NOT SURE IT'S REQURED....
            Dim sPATH_APPENDIX As String
            sPATH_APPENDIX = Mid(sTemp, Len("C:\MYBUILD\"))
            sPATH_APPENDIX = Cut_First_BackSlash(sPATH_APPENDIX)
            make_virtual_drive_path = Add_BackSlash(s_MyBuild_Dir) & sPATH_APPENDIX ' #400b11-another-bug# WT? ' & sTemp
            Exit Function
        End If
    Else
        If byteDEFAULT_DRIVE = 2 Then ' 2 = C:
            sTemp = Cut_First_BackSlash(sTemp)  ' jic, make "\MYBUILD\" -> "MYBUILD\"
            ' #400b11-another-bug#  hm... what's that for ??? ' If StrComp(Add_BackSlash(sTemp), "MYBUILD\", vbTextCompare) = 0 Then
                If StrComp(Add_BackSlash(sDEF_VIRTUAL_DIR(3)), "MYBUILD\") = 0 Then  ' #400b11-another-bug#  sDEF_VIRTUAL_DIR(3)=C   , sDEF_VIRTUAL_DIR(0)=not used!
                    make_virtual_drive_path = Add_BackSlash(s_MyBuild_Dir) & sTemp ' #400b11-another-bug# WT? ' & get_drive_letter_A0(2) & "\" & sTemp
                    Exit Function
                End If
            ' #400b11-another-bug#  ' End If
        End If
    End If



    ' do not allow paths such as "c:\dir1\..\dir2"
    ' because it can get out of the emulator and used maliciously!
    If InStr(1, sTemp, "..") > 0 Then
        ' #400b6-vp# ' make_virtual_drive_path = ""
        ' #400b6-vp# '  Exit Function
        
        If InStr(1, sTemp, ":") > 0 Then
            ' ok.
        Else
            sTemp = Add_BackSlash(sDEF_VIRTUAL_DIR(byteDEFAULT_DRIVE + 1)) & sTemp ' #400b14-BUG2#  "+1" added.
            sTemp = Replace(sTemp, "\\", "\", 1, 1, vbTextCompare)  ' jic
        End If
        Debug.Print "back dir in file path!"
        Dim i As Integer
        For i = 0 To 15 ' allow up to 16 ".."'s
            ' "c:\mydir\blah1\blah2\..\..\file.txt"
            sTemp = cut_off_dir_with_two_dots(sTemp)
            sTemp = Replace(sTemp, "\\", "\", 1, 1, vbTextCompare)  ' jic
            If InStr(1, sTemp, "..") <= 0 Then Exit For
        Next i
        If InStr(1, sTemp, "..") > 0 Then
            ' replace all the rest!
            Debug.Print "too many back dirs, or single back dir: " & sTemp
            sTemp = Replace(sTemp, "..", "", 1, -1, vbTextCompare)
            sTemp = Replace(sTemp, "\\", "\", 1, -1, vbTextCompare)
            If Len(sTemp) = 0 Then
                Debug.Print "ROOT!"
            Else
                Debug.Print "ALL REPLACED: " & sTemp
            End If
        End If
        
    End If
    
    
    
    If InStr(1, sTemp, ":") > 0 Then
' #400b11-another-bug# ' as_usual:
        sTemp = Replace(sTemp, ":", "\", 1, -1, vbTextCompare)
        sTemp = Replace(sTemp, "\\", "\")  ' to be sure, both "a:mydir"  and "a:\mydir"  are legal paths!
        make_virtual_drive_path = sVirtualFS & sTemp
    Else
            ' #400b9-curdir#-#old# ' seems to be current dir:
            ' #400b9-curdir#-#old# ' If sDEF_VIRTUAL_DIR(byteDEFAULT_DRIVE) <> "" Then
                  ' #400b6-vp# ' ' OOOOPSSSS!!!! ' make_virtual_drive_path = Add_BackSlash(sDEF_VIRTUAL_DIR(byteDEFAULT_DRIVE)) & sTEMP
            ' #400b9-curdir#-#old# '     sTemp = Add_BackSlash(sDEF_VIRTUAL_DIR(byteDEFAULT_DRIVE)) & sTemp ' #400b6-vp#
                  
            ' #400b9-curdir#
            ' #400b11-another-bug# added ":"
            sTemp = get_drive_letter_A0(byteDEFAULT_DRIVE) & ":\" & Cut_First_BackSlash(Add_BackSlash(sDEF_VIRTUAL_DIR(byteDEFAULT_DRIVE + 1)) & sTemp) ' #400b11-another-bug# for byteDEFAULT_DRIVE=0 it's A, for sDEF_VIRTUAL_DIR() A is 1!
            ' #400b11-another-bug# ' GoTo as_usual                                                      ' #400b6-vp#
            
            
            iPROTECT_FROM_HANG = iPROTECT_FROM_HANG + 1 ' JIC
            If iPROTECT_FROM_HANG < 10 Then
                GoTo recheck_path
            Else
                 make_virtual_drive_path = sVirtualFS & "C\"
                Debug.Print "UNEXPECTED ERROR MVP!"
            End If
            
            
            
            ' #400b9-curdir#-#old# ' Else
                  ' set to "MyBuild"
            ' #400b9-curdir#-#old# '       make_virtual_drive_path = Add_BackSlash(s_MyBuild_Dir) & sTemp
            ' #400b9-curdir#-#old# '   End If
    End If
    
    
    
    Exit Function
err1:
    Debug.Print "make_virtual_drive_path: " & Err.Description
    Debug.Print sFPath
    make_virtual_drive_path = ""
    
    
End Function


' orig:   "c:\mydir\blah1\blah2\..\..\file.txt"
' call 1: "c:\mydir\blah1\..\file.txt"
' call 2: "c:\mydir\file.txt"
' suseq:    (no change!)
Function cut_off_dir_with_two_dots(s As String) As String
On Error GoTo err1

    Dim L1 As Long
    Dim L2 As Long
    
    L1 = InStr(1, s, "..")
    ' can be ".." to step one dir up.
    If L1 <= 2 Then
        ' Debug.Print "cut_off_dir_with_two_dots: path too small or '..' not found: " & s ' not supported yet!
        cut_off_dir_with_two_dots = s ' unchanged!
        Exit Function
    End If


    L2 = InStrRev(s, "\", L1 - 2)
        
    If L2 > 1 Then
as_usual_cut:
        cut_off_dir_with_two_dots = Mid(s, 1, L2 - 1) & Mid(s, L1 + 2)
    Else
        L2 = InStrRev(s, ":", L1 - 2) ' allow:   "c:dir1\..\file.txt"
        If L2 > 1 Then
            L2 = L2 + 1
            GoTo as_usual_cut
        Else
            ' #400b14-BUG3#  allow: "MYBUILD\.."
            '            Debug.Print "cut_off_dir_with_two_dots: no dir to go back!..."
            '            cut_off_dir_with_two_dots = s
            s = ""  ' #400b14-BUG3#   (seems like there is only 1 \, so take to root).
        End If
    End If


    Exit Function
err1:
    cut_off_dir_with_two_dots = s
    Debug.Print "cut_off_dir_with_two_dots: " & Err.Description
    Debug.Print s
End Function



' makes sure App.Path "\vdrive\a" or b or c or etc exists.
Private Sub make_sure_vdrive_exists(sPath As String)

On Error Resume Next ' 4.00-Beta-3

    If InStr(1, sPath, ":\") > 0 Then
        
        ' assumed that all paths MUST exist accept maybe for the last folder:
        myMKDIR VDRIVE_PATH '#1204 ' Add_BackSlash(App.Path) & "vdrive"
        
       '#1204 ' myMKDIR Add_BackSlash(App.Path) & "vdrive\" & Mid(sPath, 1, 1) ' first letter only.
       myMKDIR VDRIVE_PATH & Mid(sPath, 1, 1) ' first letter only.  '#1204
       
    End If

End Sub



' #1191 - INTERNAL FUNCTION DOES NOT REQUIRE CORRECTION
Private Sub RECORD_VIRTUAL_FILE_HANDLE(iInternalHandle As Integer, sFilename As String, byteMODE As Byte)   ' #327spf2#
    
On Error GoTo err1


    ' #327spf2#  redundant ' If bAllowStepBack Then set_iRECORDED_VIRTUAL_FILE_HANDLE_for_StepBack iInternalHandle '#1202


    ' #1202 - bugfix/optimization
    '         we can easily reuse empty slots of iALL_OPENED_HANDLES()
    '         that were closed by CLOSE_VIRTUAL_FILE()
    Dim i As Integer
    For i = 1 To iLast_Opened_File_INDEX
        If iALL_OPENED_HANDLES(i) = -1 Then
        
            iALL_OPENED_HANDLES(i) = iInternalHandle ' iLast_Opened_File_INDEX doesn't grow this way!
            iALL_OPENED_FILENAMES(i) = sFilename ' #327spf2#
            iALL_OPENED_charByteACCESS_MODE(i) = byteMODE
            
            ' Debug.Print "#1202 slot reused!"
            Exit Sub
        End If
    Next i
    
    
    


    If iLast_Opened_File_INDEX < MAX_ALLOWED_OPENED_FILES Then
        
        iLast_Opened_File_INDEX = iLast_Opened_File_INDEX + 1
        
        iALL_OPENED_HANDLES(iLast_Opened_File_INDEX) = iInternalHandle
        iALL_OPENED_FILENAMES(iLast_Opened_File_INDEX) = sFilename ' #327spf2#
        iALL_OPENED_charByteACCESS_MODE(i) = byteMODE
        
        ' Debug.Print "#1202 new file slot created!"
        
    Else
        
        mBox frmEmulation, "too many opened files. reset the emulator!"
        frmEmulation.stopAutoStep
        bEMULATOR_STOPED_ABNORMALLY = True
        
        
         Debug.Print "too many opened files! file handle not recorded..."
        
    End If
    
    Exit Sub
    
err1:
    ' #400b9-noboxes# 'mBox frmEmulation, "RECORD_VIRTUAL_FILE_HANDLE: " & LCase(err.Description) '#1193
    ' #400b9-noboxes# 'frmEmulation.stopAutoStep
    bEMULATOR_STOPED_ABNORMALLY = True
    
    
    Debug.Print "RECORD_VIRTUAL_FILE_HANDLE: " & LCase(Err.Description)
    ' #400b9-noboxes# ' mBox frmEmulation, "RECORD_VIRTUAL_FILE_HANDLE: " & LCase(err.Description) '#1193
    
End Sub

Public Sub CLOSE_ALL_VIRTUAL_FILES()

On Error GoTo err1

    Dim i As Integer
    
    For i = 1 To iLast_Opened_File_INDEX
        If iALL_OPENED_HANDLES(i) <> -1 Then
            Close iALL_OPENED_HANDLES(i)
            iALL_OPENED_HANDLES(i) = -1
            iALL_OPENED_FILENAMES(i) = ""
            iALL_OPENED_charByteACCESS_MODE(i) = 0
        End If
    Next i
    
    iLast_Opened_File_INDEX = 0
    
    Exit Sub
    
err1:
    iLast_Opened_File_INDEX = 0
    Debug.Print "CLOSE_ALL_VIRTUAL_FILES: " & LCase(Err.Description)
    
End Sub

Public Sub SET_VIRTUAL_VERIFY_FLAG(byteValue As Byte)
        byteVerifyFlag = byteValue
End Sub

Public Function GET_VIRTUAL_VERIFY_FLAG() As Byte
        GET_VIRTUAL_VERIFY_FLAG = byteVerifyFlag
End Function


'#1191 output redirection!
' RETURNS TRUE IF iExternalFileHandle=0
'   even if there errors it must return true!!!
Private Function INPUT_REDIRECTED(iExternalFileHandle As Integer) As Boolean

' according to: Chapter 3  Structure of MS-DOS Application Programs

'    stdin   equ     0               ; standard input handle
'    stdout  equ     1               ; standard output handle
'    stderr  equ     2               ; standard error handle

    If iExternalFileHandle = 0 Then
        
        INPUT_REDIRECTED = True ' RETURN !!!!
        
        ' TODO!!!
        
        mBox frmEmulation, "input redirection is not supported yet!" & vbNewLine & _
        " INT 21h/9h should be used instead. refer to interrupt reference."
        
        frmEmulation.stopAutoStep
        bEMULATOR_STOPED_ABNORMALLY = True
        
    Else
    
        INPUT_REDIRECTED = False
    End If
End Function


'#1191 output redirection!
' RETURNS TRUE IF iExternalFileHandle=1 or iExternalFileHandle=2 or 4
'   even if there errors it must return true!!!
Private Function OUTPUT_REDIRECTED(iExternalFileHandle As Integer) As Boolean


On Error GoTo err1


' according to: Chapter 3  Structure of MS-DOS Application Programs

'    stdin   equ     0               ; standard input handle
'    stdout  equ     1               ; standard output handle
'    stderr  equ     2               ; standard error handle


' same book, some other chapter:
'  Handle             Device name                          Opened to
'  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'  0                  Standard input (stdin)               CON
'  1                  Standard output (stdout)             CON
'  2                  Standard error (stderr)              CON
'  3                  Standard auxiliary (stdaux)          AUX
'  4                  Standard printer (stdprn)            PRN
'  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'


' redirection of output from:
'  INT 21h / AH= 40h - write to file.
'Entry:
'BX = file handle.
'CX = number of bytes to write.
'DS:DX -> data to write.

If iExternalFileHandle = 1 Or iExternalFileHandle = 2 Then
    
    ' DOING SOMETHING SIMILAR TO INT 10h / AH = 13h - write string.
    ' this code is a modified close of it from  do_INTERUPT()
    
    OUTPUT_REDIRECTED = True ' RETURN !!!!!
    
    ''''''''''''''''''''' start code '''''''''''''''''''''''''''''''''''''''
    Dim b1 As Boolean
    Dim b2 As Boolean
    Dim ts As String
    Dim lMEM_POINTER As Long
    Dim lCount As Long
    Dim lT As Long
    
    ' get these from frmEmulation before start!
    Dim local_DS As Integer
    Dim local_DX As Integer
    Dim local_CX As Integer
    Dim local_BX As Integer
    
    
    local_DS = frmEmulation.get_DS
    local_DX = frmEmulation.get_DX
    local_CX = frmEmulation.get_CX
    local_BX = frmEmulation.get_BX
    
    
                ts = ""
                lMEM_POINTER = to_unsigned_long(local_DS) * 16 + to_unsigned_long(local_DX)

                ' update cursor after writing?
                b1 = True ' ALWAYS!
                
                ' string contains attributes?
                b2 = False ' NO!

                lCount = to_unsigned_long(local_CX)
                
                ' 2.05#539b
                If lCount > 2000 Then
                    mBox frmEmulation, "CX value (string size) is over 2000!"
                    
                    frmEmulation.stopAutoStep
                    bEMULATOR_STOPED_ABNORMALLY = True
                        
                    Exit Function
                End If
                
                If b2 Then lCount = lCount * 2

                For lT = 1 To lCount
                    If (lMEM_POINTER > MAX_MEMORY) Then
                        mBox frmEmulation, "DOS OUTPUT REDIRECTION - CX is out of memory"
                        
                        frmEmulation.stopAutoStep
                        bEMULATOR_STOPED_ABNORMALLY = True
                                                
                        Exit Function
                    End If
                    
                    ts = ts & Chr(RAM.mREAD_BYTE(lMEM_POINTER))
                    lMEM_POINTER = lMEM_POINTER + 1
                    ' to allow user to stop, when
                    ' scanning into memory for too long...
                    DoEvents
                    If frmEmulation.bSTOP_EVERYTHING Then Exit Function
                Next lT
                
                If frmEmulation.bSTOP_EVERYTHING Then Exit Function
                
               ' COLUMN AND ROW AT WHICH TO START WRITING... ' frmScreen.setCursorPos DL, DH, BH
                                
                ' NOT REQUIRED HERE...' frmScreen.add_to_SCREEN_with_attrib ts, BH, b1, b2, BL
                
                frmScreen.add_to_SCREEN ts, True


                frmScreen.show_if_not_visible
                
                bINPUT_OUTPUT_REDIRECTED_SUCCESS = True ' success!
                
                
''''''''''''''''''''''''''''end code''''''''''''''''''''''''''''''''''''''
    
    
    
    
    
    
    
    
    OUTPUT_REDIRECTED = True  '' ALREADY SET ABOVE (because may exit out of errors), but here too JIC!
    
    
ElseIf iExternalFileHandle = 4 Then


            
    OUTPUT_REDIRECTED = True ' RETURN !!!!!
    
    
       


    local_DS = frmEmulation.get_DS
    local_DX = frmEmulation.get_DX
    local_CX = frmEmulation.get_CX


                lMEM_POINTER = to_unsigned_long(local_DS) * 16 + to_unsigned_long(local_DX)

                 lCount = to_unsigned_long(local_CX)

                If lCount > 2000 Then
                    mBox frmEmulation, "CX value (string size) is over 2000!"
                    
                    frmEmulation.stopAutoStep
                    bEMULATOR_STOPED_ABNORMALLY = True
                        
                    Exit Function
                End If
                
                For lT = 1 To lCount
                    If (lMEM_POINTER > MAX_MEMORY) Then
                        mBox frmEmulation, "DOS OUTPUT REDIRECTION - CX is out of memory"
                        
                        frmEmulation.stopAutoStep
                        bEMULATOR_STOPED_ABNORMALLY = True
                                                
                        Exit Function
                    End If



                If write_to_virtual_printer(RAM.mREAD_BYTE(lMEM_POINTER)) Then
                    ' ok...
                Else
                    frmEmulation.stopAutoStep
                    bEMULATOR_STOPED_ABNORMALLY = True
                    Exit Function
                End If
                    
                    
                    
                    
                    lMEM_POINTER = lMEM_POINTER + 1
                    ' to allow user to stop, when
                    ' scanning into memory for too long...
                    DoEvents
                    If frmEmulation.bSTOP_EVERYTHING Then Exit Function
                Next lT

                
                bINPUT_OUTPUT_REDIRECTED_SUCCESS = True ' success!

                OUTPUT_REDIRECTED = True  '' ALREADY SET ABOVE (because may exit out of errors), but here too JIC!
    

    
Else
    OUTPUT_REDIRECTED = False
End If


Exit Function
err1:
    OUTPUT_REDIRECTED = False
    Debug.Print "err output redirection: " & Err.Description
    
End Function

' because we use iFILE_HANDLE_INDEX_CORRECTION file number should not be less then 5!
Public Function UNKNOW_IN_OUT_REDIRECTION(iFileHandle As Integer) As Boolean

On Error Resume Next ' 4.00-Beta-3

    If iFileHandle = 3 Then ' don't know what it is... but need to show a proper error box.
    
        UNKNOW_IN_OUT_REDIRECTION = True 'RETURN !!!
    
        mBox frmEmulation, "wrong file handle... auxiliary device is not supported yet."
    
        frmEmulation.stopAutoStep
        bEMULATOR_STOPED_ABNORMALLY = True
    
    End If

End Function





'
'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'Int 21H                                                                [2.0]
'Function 43H (67)
'Get or set file attributes
'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'
'  Obtains or alters the attributes of a file (read-only, hidden, system, or
'  archive) or directory.
'
'Call with:
'
'  AH            = 43H
'  AL            = 00H       to get attributes
'                  01H       to set attributes
'
'  CX            = file attribute, if AL = 01H (bits can be combined)
'
'                  Bit(s)    Significance (if set)
'                  0         read-only
'                  1         hidden
'                  2         system
'                  3-4       reserved (0)
'                  5         archive
'                  6-15      reserved (0)
'
'  DS:DX         = segment:offset of ASCIIZ pathname
'
'Returns:
'
'  If function successful
'
'  Carry flag    = clear
'  CX            = file attribute
'
'                  Bit(s)    Significance (if set)
'                  0         read-only
'                  1         hidden
'                  2         system
'                  3         volume label
'                  4         directory
'                  5         archive
'                  6-15      reserved (0)
'
'  If function unsuccessful
'
'  Carry flag    = set
'  AX            = error code
'
'Notes:
'
'  ş Bits 3 and 4 of register CX must always be clear (0) when this function
'    is called' in other words, you cannot change an existing file into a
'    directory or volume label. However, you can assign the "hidden"
'    attribute to an existing directory with this function.
'
'  ş [3.0+] If the program is running on a network, the user must have Create
'    access rights to the directory containing the file whose attribute is to
'    be modified.
'
'Example:
'
'  Change the attribute of the file D:\MYDIR\MYFILE.DAT to read-only, so that
'  it cannot be accidentally modified or deleted by other application
'  programs.
'
'  rdonly  equ     01h             ' file attributes
'  hidden  equ     02h
'  system  equ     04h
'  volume  equ     08h
'  subdir  equ     10h
'  archive equ     20h
'
'  fname   db      'D:\MYDIR\MYFILE.DAT',0
'          .
'          .
'          .
'          mov     ah,43h          ' function number
'          mov     al,01h          ' subfunction = modify
'          mov     cx,rdonly       ' read-only attribute
'          mov     dx,seg fname    ' filename address
'          mov     ds,dx
'          mov     dx,offset fname
'          int     21h             ' transfer to MS-DOS
'          jc      error           ' jump if modify failed
'          .
'          .


' MODIFIES CX BYREF!
Public Function get_VFILE_attributes(local_DS As Integer, local_DL As Byte, local_DH As Byte, ByRef local_CL As Byte, ByRef local_CH As Byte) As Boolean
        
On Error GoTo err1
        
        Dim sFilename As String
        Dim vvv1 As VbFileAttribute
        
        sFilename = read_ASCIIZ(local_DS, to16bit_SIGNED(local_DL, local_DH))
        
        
        sFilename = make_virtual_drive_path(sFilename)
           

        vvv1 = GetAttr(sFilename)
        
        ' (SETTING BYREF!)
        local_CL = to_unsigned_byte(Val("&H" & get_W_LowBits_STR(Hex(vvv1))))
        local_CH = to_unsigned_byte(Val("&H" & get_W_HighBits_STR(Hex(vvv1))))
        
        
'vbNormal 0 Normal.
'vbReadOnly 1 Read-only.
'vbHidden 2 Hidden.
'vbSystem 4 System file.
'vbDirectory 16 Directory or folder.
'vbArchive 32 File has changed since last backup.

    get_VFILE_attributes = True
    Exit Function
    
err1:
        
    get_VFILE_attributes = False
    Debug.Print "GET_VFILE_attributes: " & Err.Description & " --" & sFilename
    
    ' NO NEED TO SHOW MESSAGE BOX HERE BECAUSE IT IS A VALID WAY TO CHECK FOR FILE's EXISTANCE from CODE!
    
    
    
End Function


Public Function set_VFILE_attributes(local_DS As Integer, local_DL As Byte, local_DH As Byte, local_CL As Byte, local_CH As Byte) As Boolean
    On Error GoTo err1:
    
    Dim ts As String
    
    
    ts = read_ASCIIZ(local_DS, to16bit_SIGNED(local_DL, local_DH))

    ts = make_virtual_drive_path(ts)

    set_VFILE_attributes = set_VFILE_attributes_FILE(ts, to16bit_SIGNED(local_CL, local_CH), True)
    
    
    Exit Function
err1:
    set_VFILE_attributes = False
    
End Function


Public Function set_VFILE_attributes_FILE(sFilename As String, wFILE_ATTRIBUTES As Integer, bPATH_ALREADY_VIRTUAL As Boolean) As Boolean

On Error GoTo err1

    If Not bPATH_ALREADY_VIRTUAL Then
        sFilename = make_virtual_drive_path(sFilename)
    End If
    
' #1197
' VB ATTRIBUTES:
'vbNormal 0 Normal (default).
'vbReadOnly 1 Read-only.
'vbHidden 2 Hidden.
'vbSystem 4 System file.
'vbArchive 32 File has changed since last backup.
'
' DOS ATTRIBUTES:
'                  Bit(s)    Significance (if set)
'0  (first)                         read -only
'1  (second)                          Hidden
'2  third                         System
'3  fourth                         volume Label
'4  fifth                         Reserved (0)
'5  sixth                         Archive
'                  6-15      reserved (0)

' EMU8086 supports only:
' mov cx, 0       ;  normal - no attributes.
' mov cx, 1       ;  read-only.
' mov cx, 2       ;  hidden.
' mov cx, 4       ;  system
' mov cx, 7       ;  hidden, system and read-only!
' mov cx, 16      ;  archive

 
' however, even when wFILE_ATTRIBUTES = 0 ,
' it seems that both VB and DOS promt set archive attribute by default.
            
            
            
' decided not to show any stupid error messages.
' v4.00-Beta-5
'''''
' v4.00-Beta-6, decided to check anyway! but do not cry too loud, 32 seems to be the last acceptible attribute.
' v4.00-beta-7 replaced ">=32" with just ">32"
    If wFILE_ATTRIBUTES > 32 Or wFILE_ATTRIBUTES < 0 Then ' 11111b - only first five bits are used.
        ' mBox frmEmulation, "CREATE_VIRTUAL_FILE:" & vbNewLine & " unsupported attributes in CX register." & vbNewLine & "set CX=0 or refer to interrupt documentation"
        ' frmEmulation.stopAutoStep
        ' bEMULATOR_STOPED_ABNORMALLY = True
        set_VFILE_attributes_FILE = False
        Exit Function
    End If








''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''Dim iREAD_ONLY As Integer
''''Dim iHIDDEN As Integer
''''Dim iSYSTEM As Integer
''''Dim iARCHIVE As Integer
'''' ' bitwise:
'''' iREAD_ONLY = wFILE_ATTRIBUTES And 1
'''' iHIDDEN = wFILE_ATTRIBUTES And 2
'''' iSYSTEM = wFILE_ATTRIBUTES And 4
'''' iARCHIVE = wFILE_ATTRIBUTES And 16
''''
'''' If iREAD_ONLY = 1 Then
''''    SetAttr sFileName, vbReadOnly
'''' End If
''''
'''' If iHIDDEN = 1 Then
''''    SetAttr sFileName, vbHidden
'''' End If
''''
'''' If iSYSTEM = 1 Then
''''    SetAttr sFileName, vbSystem
'''' End If
''''
'''' If iARCHIVE = 1 Then
''''    SetAttr sFileName, vbArchive
'''' End If
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    ' it appears it's easier :)
    ' windows, dos and VB are compatible :)
    
    SetAttr sFilename, wFILE_ATTRIBUTES

    set_VFILE_attributes_FILE = True

    Exit Function
err1:
    set_VFILE_attributes_FILE = False
    Debug.Print "set_VFILE_attributes_FILE: " & sFilename & " -- " & Err.Description & vbNewLine & sFilename
    
    
    ' #400b9-noboxes# ' mBox frmEmulation, "set_VFILE_attributes_FILE: " & LCase(err.Description) & vbNewLine & sFilename
    ' #400b9-noboxes# ' frmEmulation.stopAutoStep
    
    bEMULATOR_STOPED_ABNORMALLY = True
    
    
End Function



' #327spf2#
Function get_FILENAME_from_FILENUM(ByVal iINTERNAL_FileHandle As Integer) As String
On Error GoTo err1

    ' #1191 - RECEIVING FILE HANDLE. CORRECTING.
 'no need here! already converted! ---'   iFileHandle = iFileHandle - iFILE_HANDLE_INDEX_CORRECTION

    Dim i As Integer
    
    For i = 1 To iLast_Opened_File_INDEX
        If iALL_OPENED_HANDLES(i) = iINTERNAL_FileHandle Then
            get_FILENAME_from_FILENUM = iALL_OPENED_FILENAMES(i)
            Exit Function
        End If
    Next i

    Exit Function
err1:
    get_FILENAME_from_FILENUM = ""
    Debug.Print "err get_FILENAME_from_FILENUM: " & Err.Description
End Function

' #327spf3#
Function get_FILE_MODE_from_FILENUM(ByVal iINTERNAL_FileHandle As Integer) As Byte
On Error GoTo err1

    ' #1191 - RECEIVING FILE HANDLE. CORRECTING.
 'no need here! already converted! ---'   iFileHandle = iFileHandle - iFILE_HANDLE_INDEX_CORRECTION

    Dim i As Integer
    
    For i = 1 To iLast_Opened_File_INDEX
        If iALL_OPENED_HANDLES(i) = iINTERNAL_FileHandle Then
            get_FILE_MODE_from_FILENUM = iALL_OPENED_charByteACCESS_MODE(i)
            Exit Function
        End If
    Next i

    Exit Function
err1:
    get_FILE_MODE_from_FILENUM = 2 ' return 2 by default (read/write).
    Debug.Print "err get_FILE_MODE_from_FILENUM: " & Err.Description
End Function


' v3.27s (moved from OUTPUT_REDIRECTED because we use it for INT21/ah=5 too).
' returns true if success!
Function write_to_virtual_printer(byteDATA As Byte) As Boolean

On Error GoTo err1


Shell Add_BackSlash(App.Path) & "DEVICES\Printer.exe", vbNormalFocus

DoEvents

Dim iMaxWait As Integer
iMaxWait = 0
chk_printer:
                    ' check if printer is ready...
                    Dim tbbb As Byte
                    tbbb = READ_IO_BYTE(130)
                    If tbbb <> 0 Then
                        wait_ms 0.1
                        iMaxWait = iMaxWait + 1
                        If iMaxWait > 5 Then
                            mBox frmEmulation, "virtual printer does not respond." & vbNewLine & "start c:\emu8086\devices\Printer.exe"
                            write_to_virtual_printer = False
                        End If
                        GoTo chk_printer
                    End If



                    ' write to virtual printer :)
                    WRITE_IO_BYTE 130, byteDATA
                    
                    write_to_virtual_printer = True
                    
                    Exit Function
err1:
    Debug.Print "err: write_to_virtual_printer: " & Err.Description
End Function




' #400b4-int21-1A#
'Int 21H                                                                [1.0]
'Function 1AH (26)
'Set DTA address
' DTA TABLE:
' 00h bits 0-6 drive letter, bit 7 is set if remote
' 01h 11 bytes search template
' 0ch search attributes
' 0dh entery counte withint dir
' 0fh cluster number of start of parent directory
' 11h 4 bytes reserved
' 15h attributes of file which was found
' 16h file time
' 18h file date
' 1Ah file size
' 1Eh file name and extension in ASCIIZ  (max 98 chars).


'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'Int 21H                                                                [1.0]
'Function 1AH (26)
'Set DTA address
'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'
'  Specifies the address of the disk transfer area (DTA) to be used for
'  subsequent FCB-related function calls.
'
'Call with:
'
'  AH            = 1AH
'  DS:DX         = segment:offset of disk transfer area
'
'Returns:
'
'  Nothing
'
'Notes:
'
'  ş If this function is never called by the program, the DTA defaults to a
'    128-byte buffer at offset 0080H in the program segment prefix.
'
'  ş In general, it is the programmer's responsibility to ensure that the
'    buffer area specified is large enough for any disk operation that will
'    use it. The only exception to this is that MS-DOS will detect and abort
'    disk transfers that would cause a segment wrap.
'
'  ş Int 21H Function 2FH can be used to determine the current disk transfer
'    address.
'
'  ş The only handle-type operations that rely on the DTA address are the
'    directory search functions, Int 21H Functions 4EH and 4FH.
'
'Example:
'
'  Set the current disk transfer area address to the buffer labeled buff.
'
'  buff    db      128 dup (?)
'          .
'          .
'          .
'          mov     ah,1ah          ' function number
'          mov     dx,seg buff     ' address of disk
'          mov     ds,dx           ' transfer area
'          mov     dx,offset buff
'          int     21h             ' transfer to MS-DOS
'          .

Public Sub set_DTA_Address()
On Error GoTo err1

    l_DTA_Address = get_PHYSICAL_ADDR(frmEmulation.get_DS, frmEmulation.get_DX)

' Debug.Print "dtA:" & Hex(l_DTA_Address)

    Exit Sub
err1:
Debug.Print "set_DTA_Address: " & Err.Description
End Sub



'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'Int 21H                                                                [2.0]
'Function 2FH (47)
'Get DTA address
'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'
'  Obtains the current address of the disk transfer area (DTA) for FCB file
'  read/write operations.
'
'Call with:
'
'  AH            = 2FH
'
'Returns:
'
'  ES:BX         = segment:offset of disk transfer area
'
'Note:
'
'  ş The disk transfer area address is set with Int 21H Function 1AH. The
'    default DTA is a 128-byte buffer at offset 80H in the program segment
'    prefix.
'
'Example:
'
'  Obtain the current disk transfer area address and save it in the variable
'  olddta.
'
'  olddta  dd      ?               ' save disk transfer address
'          .
'          .
'          .
'          mov     ah,2fh          ' function number
'          int     21h             ' transfer to MS-DOS
'
'                                  ' save it as DWORD pointer
'          mov     word ptr olddta,bx
'          mov     word ptr olddta+2,es
'          .
'          .
'          .
'

' #400b5-INT21_2F#

Public Sub get_DTA_Address()
On Error GoTo err1

    Dim lSEGMENT As Long
    Dim lOFFSET As Long
    
    Call GetSegmentOffset_FromPhysical(l_DTA_Address, frmEmulation.get_CS, lSEGMENT, lOFFSET)

    frmEmulation.set_ES to_signed_int(lSEGMENT)
    frmEmulation.set_BX to_signed_int(lOFFSET)

    Exit Sub
err1:
Debug.Print "set_DTA_Address: " & Err.Description
End Sub








' #400b4-int21-1A#
'AMSDOSPROG: the DTA defaults to a 128-byte buffer at offset 0080H in the program segment prefix.
'             (weird but ok...)
Public Sub set_DEFAULTS_FOR_DOS_FILE_SYSTEM()
On Error GoTo err1
    l_DTA_Address = &H7080
    ' Debug.Print "DEFAULT l_DTA_Address: " & Hex(l_DTA_Address)
Exit Sub
err1:
Debug.Print "set_DEFAULTS_FOR_DOS_FILE_SYSTEM:" & Err.Description
End Sub




'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'Int 21H                                                                [2.0]
'Function 4EH (78)
'Find first file
'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'
'  Given a file specification in the form of an ASCIIZ string, searches the
'  default or specified directory on the default or specified drive for the
'  first matching file.
'
'Call with:
'
'  AH            = 4EH
'  CX            = search attribute (bits may be combined)
'
'                  Bit(s)    Significance (if set)
'                  0         read-only
'                  1         hidden
'                  2         system
'                  3         volume label
'                  4         directory
'                  5         archive
'                  6Ä15      reserved (0)
'
'  DS:DX         = segment:offset of ASCIIZ pathname
'
'Returns:
'
'  If function successful (matching file found)
'
'  Carry flag    = clear
'
'  and search results returned in current disk transfer area as follows:
'
'  Byte(s)            Description
'  00HÄ14H            reserved (0)
'  15H                attribute of matched file or directory
'  16HÄ17H            file time
'                     bits 00HÄ04H = 2-second increments (0Ä29)
'                     bits 05HÄ0AH = minutes (0Ä59)
'                     bits 0BHÄ0FH = hours (0Ä23)
'  18HÄ19H            file date
'                     bits 00HÄ04H = day (1Ä31)
'                     bits 05HÄ08H = month (1Ä12)
'                     bits 09HÄ0FH = year (relative to 1980)
'  1AHÄ1DH            file size
'  1EHÄ2AH            ASCIIZ filename and extension
'
'  If function unsuccessful (no matching files)
'
'  Carry flag    = set
'  AX            = error code
'
'Notes:
'
'  ş This function assumes that the DTA has been previously set by the
'    program with Int 21H Function 1AH to point to a buffer of adequate
'    size.
'
'  ş The * and ? wildcard characters are allowed in the filename. If wildcard
'    characters are present, this function returns only the first matching
'    filename.
'
'  ş If the attribute is 0, only ordinary files are found. If the volume
'    label attribute bit is set, only volume labels will be returned (if any
'    are present). Any other attribute or combination of attributes (hidden,
'    system, and directory) results in those files and all normal files being
'    matched.
'
'Example:
'
'  Find the first .COM file in the directory \MYDIR on drive C.
'
'  fname   db      'C:\MYDIR\*.COM',0
'
'  dbuff   db      43 dup (0)      ' receives search results
'          .
'          .
'          .
'                                  ' set DTA address
'          mov     ah,1ah          ' function number
'          mov     dx,seg dbuff    ' result buffer address
'          mov     ds,dx
'          mov     dx,offset dbuff
'          int     21h             ' transfer to MS-DOS
'
'                                  ' search for first match
'          mov     ah,4eh          ' function number
'          mov     cx,0            ' normal attribute
'          mov     dx,seg fname    ' address of filename
'          mov     ds,dx
'          mov     dx,offset fname
'          int     21h             ' transfer to MS-DOS
'          jc      error           ' jump if no match
'          .
'          .
'          .
'

'  Byte(s)            Description
'  00H-14H            reserved (0)
'  15H                attribute of matched file or directory
'  16H-17H            file time
'                     bits 00H-04H = 2-second increments (0-29)
'                     bits 05H-0AH = minutes (0-59)
'                     bits 0BH-0FH = hours (0-23)
'  18H-19H            file date
'                     bits 00H-04H = day (1-31)
'                     bits 05H-08H = month (1-12)
'                     bits 09H-0FH = year (relative to 1980)
'  1AH-1DH            file size
'  1EH-2AH            ASCIIZ filename and extension


' on sucess clears Carry Flag

' #400b4-int21-4E#
'''''Public Sub do_Find_first_file()
'''''On Error GoTo err1
'''''
'''''    Dim s As String
'''''    s = read_ASCIIZ(frmEmulation.get_DS, frmEmulation.get_DX)
'''''
'''''    s = make_virtual_drive_path(s)
'''''
'''''
'''''    ' silent load...
'''''    If Not b_LOADED_frmDOS_FILE Then
'''''        Load frmDOS_FILE
'''''        DoEvents
'''''    End If
'''''
'''''
'''''    ' C:\MYDIR\*.COM
'''''    frmDOS_FILE.set_PATH_AND_GET_FIRST_FILE_TO_DTA ExtractFilePath(s), ExtractFileName(s), frmEmulation.get_CX
'''''
'''''
'''''
'''''
'''''    Exit Sub
'''''err1:
'''''    Debug.Print "do_Find_first_file: " & Err.Description
'''''    frmEmulation.bSET_CF_ON_IRET = True
'''''    frmEmulation.set_AX 3  ' path not found.
'''''End Sub


Public Sub write_DTA_TABLE(sFilePath As String)

On Error GoTo err1

        ' DONE v400-beta7: should write other parameters to DTA table...
        
        ' #400b7-scan-dirs#
        '  00H-14H            reserved (0)
        
        ' 15H                attribute of matched file or directory
        Dim iAttrib As Integer
        iAttrib = GetAttr(sFilePath)
        RAM.mWRITE_BYTE l_DTA_Address + 21, math_get_low_byte_of_word(iAttrib)
        
        '  16H-17H            file time
        '                     bits 00H-04H = 2-second increments (0-29)
        '                     bits 05H-0AH = minutes (0-59)
        '                     bits 0BH-0FH = hours (0-23)
        '  18H-19H            file date
        '                     bits 00H-04H = day (1-31)
        '                     bits 05H-08H = month (1-12)
        '                     bits 09H-0FH = year (relative to 1980)
'''        Dim dosDT As DOS_FILE_TIME_DATE
'''        dosDT = GET_DOS_FILE_DATE_TIME(sFilePath)
'''        RAM.mWRITE_WORD_i l_DTA_Address + 22, dosDT.iTime
'''        RAM.mWRITE_WORD_i l_DTA_Address + 24, dosDT.iDate
        
        
        
        
        '  1AH-1DH            file size
        ' file size:
        ' 1A  = 26
        ' 1B
        ' 1C  = 28
        ' 1D
        Dim lFileSize As Long
        lFileSize = FileLen(sFilePath)
        RAM.mWRITE_WORD_i l_DTA_Address + 26, math_get_low_word_of_doubleword(lFileSize)
        RAM.mWRITE_WORD_i l_DTA_Address + 28, math_get_high_word_of_doubleword(lFileSize)
      
        
        ' #400b5-bug1#
        '  1EH-2AH            ASCIIZ filename and extension
        Dim iSegment As Integer
        Dim iOffset As Integer
        ' 1E = 30
        iSegment = get_segment_address_from_PHYSICAL_ADDR(l_DTA_Address + 30)
        iOffset = get_offset_address_from_PHYSICAL_ADDR(l_DTA_Address + 30)
        write_ASCIIZ iSegment, iOffset, ExtractFileName(getDosPath(sFilePath))

Exit Sub
err1:
Debug.Print "write_DTA_TABLE: " & Err.Description

End Sub






'
'
'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'Int 21H                                                                [2.0]
'Function 4FH (79)
'Find next file
'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'
'  Assuming a previous successful call to Int 21H Function 4EH, finds the
'  next file in the default or specified directory on the default or
'  specified drive that matches the original file specification.
'
'Call with:
'
'  AH            = 4FH
'
'  Assumes DTA points to working buffer used by previous successful Int 21H
'  Function 4EH or 4FH.
'
'Returns:
'
'  If function successful (matching file found)
'
'  Carry flag    = clear
'
'  and search results returned in current disk transfer area as described for
'  Int 21H Function 4EH
'
'  If function unsuccessful (no more matching files)
'
'  Carry flag    = set
'  AX            = error code
'
'Notes:
'
'  ş Use of this call assumes that the original file specification passed to
'    Int 21H Function 4EH contained one or more * or ? wildcard characters.
'
'  ş When this function is called, the current disk transfer area (DTA) must
'    contain information from a previous successful call to Int 21H Function
'    4EH or 4FH.
'
'Example:
'
'  Continuing the search operation in the example for Int 21H Function 4EH,
'  find the next .COM file (if any) in the directory \MYDIR on drive C.
'
'  fname   db      'C:\MYDIR\*.COM',0
'
'  dbuff   db      43 dup (0)      ' receives search results
'          .
'          .
'          .
'                                  ' search for next match
'          mov     ah,4fh          ' function number
'          int     21h             ' transfer to MS-DOS
'          jc      error           ' jump if no more files
'          .
'          .
'          .

' #400b4-int21-4F#
Public Sub do_Find_next_file()
On Error GoTo err1

    
    ' (jic) silent load...
    If Not b_LOADED_frmDOS_FILE Then
        Load frmDOS_FILE
        DoEvents
    End If
    
    frmDOS_FILE.get_NEXT_FILE_TO_DTA

    Exit Sub
err1:
    Debug.Print "do_Find_next_file: " & Err.Description
    frmEmulation.bSET_CF_ON_IRET = True
    frmEmulation.set_AX 2  ' file not found.
End Sub


'
'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'Int 21H                                                                [2.0]
'Function 57H (87)
'Get or set file date and time
'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'
'  Obtains or modifies the date and time stamp in a file's directory entry.
'
'Call with:
'
'  If getting date and time
'
'  AH            = 57H
'  AL            = 00H
'  BX            = handle
'
'  If setting date and time
'
'  AH            = 57H
'  AL            = 01H
'  BX            = handle
'  CX            = time
'                  bits 00HÄ04H = 2-second increments (0Ä29)
'                  bits 05HÄ0AH = minutes (0Ä59)
'                  bits 0BHÄ0FH = hours (0Ä23)
'  DX            = date
'                  bits 00HÄ04H = day (1Ä31)
'                  bits 05HÄ08H = month (1Ä12)
'                  bits 09HÄ0FH = year (relative to 1980)
'
'Returns:
'
'  If function successful
'
'  Carry flag    = clear
'
'  and, if called with AL = 00H
'
'  CX            = time
'  DX            = date
'
'  If function unsuccessful
'
'  Carry flag    = set
'  AX            = error code
'
'Notes:
'
'  ş The file must have been previously opened or created via a successful
'    call to Int 21H Function 3CH, 3DH, 5AH, 5BH, or 6CH.
'
'  ş If the 16-bit date for a file is set to zero, that file's date and time
'    are not displayed on directory listings.
'
'  ş A date and time set with this function will prevail, even if the file is
'    modified afterwards before the handle is closed.
'
'Example:
'
'  Get the date that the file MYFILE.DAT was created or last modified, and
'  then decompose the packed date into its constituent parts in the variables
'  month, day, and year.
'
'  fname   db      'MYFILE.DAT',0
'
'  month   dw      0
'  day     dw      0
'  year    dw      0
'          .
'          .
'          .
'                                  ' first open the file
'          mov     ah,3dh          ' function number
'          mov     al,0            ' read-only mode
'          mov     dx,seg fname    ' filename address
'          mov     ds,dx
'          mov     dx,offset fname
'          int     21h             ' transfer to MS-DOS
'          jc      error           ' jump if open failed
'
'                                  ' get file date/time
'          mov     bx,ax           ' copy handle to BX
'          mov     ah,57h          ' function number
'          mov     al,0            ' 0 = get subfunction
'          int     21h             ' transfer to MS-DOS
'          jc      error           ' jump if function failed
'
'          mov     day,dx          ' decompose date
'          and     day,01fh        ' isolate day
'          mov     cl,5
'          shr     dx,cl
'          mov     month,dx        ' isolate month
'          and     month,0fh
'          mov     cl,4
'          shr     dx,cl           ' isolate year
'          and     dx,03fh         ' relative to 1980
'          add     dx,1980         ' correct to real year
'          mov     year,dx         ' save year
'
'                                  ' now close file,
'                                  ' handle still in BX
'          mov     ah,3eh          ' function number
'          int     21h             ' transfer to MS-DOS
'          jc      error           ' jump if close failed
'          .
'          .
'          .


' #400b4-int21-57#    #400b5-int21-57#
Sub do_get_set_file_DATE_TIME()

On Error GoTo err1

    Dim s As String
    s = get_FILENAME_from_FILENUM(frmEmulation.get_BX - iFILE_HANDLE_INDEX_CORRECTION)


    If Len(s) <= 0 Then
        frmEmulation.bSET_CF_ON_IRET = True
        frmEmulation.set_AX 2  ' file not found.
        Exit Sub
    End If
        
        
'''    Dim DOS_DT As DOS_FILE_TIME_DATE
        
        
    If frmEmulation.get_AL = 0 Then
        ' Get date / time.

        '  CX = Time
        '                  bits 00H-04H = 2-second increments (0-29)
        '                  bits 05H-0AH = minutes (0-59)
        '                  bits 0BH-0FH = hours (0-23)
        '  DX = Date
        '                  bits 00H-04H = day (1-31)
        '                  bits 05H-08H = month (1-12)
        '                  bits 09H-0FH = year (relative to 1980)
    
'''        DOS_DT = GET_DOS_FILE_DATE_TIME(s)
'''
'''        frmEmulation.set_DX DOS_DT.iDate     ' date
'''        frmEmulation.set_CX DOS_DT.iTime     ' time
    
    Else
        ' Set date / time.
        
'''        DOS_DT.iTime = frmEmulation.get_CX
'''        DOS_DT.iDate = frmEmulation.get_DX
'''        SET_DOS_FILE_DATE_TIME s, DOS_DT
        
    End If


    s = ""
    

    Exit Sub
err1:
    Debug.Print "do_get_set_file_DATE_TIME: " & Err.Description
    frmEmulation.bSET_CF_ON_IRET = True
    frmEmulation.set_AX 2  ' file not found.
End Sub









Function get_segment_address_from_PHYSICAL_ADDR(lPhysicalAddr As Long) As Integer
On Error Resume Next
    get_segment_address_from_PHYSICAL_ADDR = to_signed_int(Fix(lPhysicalAddr / 16))
End Function

Function get_offset_address_from_PHYSICAL_ADDR(lPhysicalAddr As Long) As Integer
On Error Resume Next
    get_offset_address_from_PHYSICAL_ADDR = to_signed_int(lPhysicalAddr Mod 16)
End Function



'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'Int 21H                                                                [1.0]
'Function 17H (23)
'Rename file
'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'
'  Alters the name of all matching files in the current directory on the disk
'  in the specified drive.
'
'Call with:
'
'  AH            = 17H
'  DS:DX         = segment:offset of "special" file control block
'
'Returns:
'
'  If function successful (one or more files renamed)
'
'  AL            = 00H
'
'  If function unsuccessful (no matching files, or new filename matched an
'  existing file)
'
'  AL            = FFH
'
'Notes:
'
'  ş The special file control block has a drive code, filename, and extension
'    in the usual position (bytes 0 through 0BH) and a second filename
'    starting 6 bytes after the first (offset 11H).
'
'  ş The ? wildcard character can be used in the first filename. Every file
'    matching the first file specification will be renamed to match the
'    second file specification.
'
'  ş If the second file specification contains any ? wildcard characters, the
'    corresponding letters in the first filename are left unchanged.
'
'  ş The function terminates if the new name to be assigned to a file matches
'    that of an existing file.
'
'  ş [2.0+] An extended FCB can be used with this function to rename a
'    directory.
'
'  ş [2.0+] Int 21H Function 56H, which allows full access to the
'    hierarchical directory structure, should be used in preference to this
'    function.
'
'Example:
'
'  Rename the file OLDNAME.DAT to NEWNAME.DAT.
'
'  myfcb   db      0               ' drive = default
'          db      'OLDNAME '      ' old file name, 8 chars
'          db      'DAT'           ' old extension, 3 chars
'          db      6 dup (0)       ' reserved area
'          db      'NEWNAME '      ' new file name, 8 chars
'          db      'DAT'           ' new extension, 3 chars
'          db      14 dup (0)      ' reserved area
'          .
'          .
'          .
'          mov     ah,17h          ' function number
'          mov     dx,seg myfcb    ' address of FCB
'          mov     ds,dx
'          mov     dx,offset myfcb
'          int     21h             ' transfer to MS-DOS
'          or      al,al           ' check status
'          jnz     error           ' jump if rename failed
'          .
'          .
'          .
'
'

' #400b5-int21h-17h#
Sub do_INT21H_17H()
On Error GoTo err1
    
    Dim L As Long
    Dim sF1_NAME As String
    Dim sF1_EXT As String
    Dim sF2_NAME As String
    Dim sF2_EXT As String
    Dim s As String
    
    L = get_PHYSICAL_ADDR(frmEmulation.get_DS, frmEmulation.get_DX)
    
    sF1_NAME = read_ByteString_AT(L + 1, 8)
    sF1_EXT = read_ByteString_AT(L + 9, 3)
    
    sF2_NAME = read_ByteString_AT(L + 18, 8)
    sF2_EXT = read_ByteString_AT(L + 26, 3)
    
    
    Dim bDriveLetter As Byte
    bDriveLetter = RAM.mREAD_BYTE(L)  ' 0=default, 1=A, 2=B, 3=C
    
    Dim sVPATH1 As String
    Dim sVPATH2 As String
    
    sVPATH1 = GET_VIRTUAL_SUBDIRECTORY(bDriveLetter)  ' #400b14-BUG2# ' Add_BackSlash(sDEF_VIRTUAL_DIR(bDriveLetter))
    sVPATH2 = sVPATH1                                 ' #400b14-BUG2# ' Add_BackSlash(sDEF_VIRTUAL_DIR(bDriveLetter))
    sVPATH1 = Trim(sF1_NAME) & "." & Trim(sF1_EXT)
    sVPATH2 = Trim(sF2_NAME) & "." & Trim(sF2_EXT)
    
    sVPATH1 = make_virtual_drive_path(sVPATH1)
    sVPATH2 = make_virtual_drive_path(sVPATH2)
        
    
    If InStr(1, sVPATH1, "*") > 0 Or InStr(1, sVPATH1, "?") > 0 Then
        frmEmulation.set_AL 255
        Debug.Print "int 21h/17h: wildcards are not supported yet"
        Exit Sub
    End If
    
    If InStr(1, sVPATH2, "*") > 0 Or InStr(1, sVPATH2, "?") > 0 Then
        frmEmulation.set_AL 255
        Debug.Print "int 21h/17h: wildcards are not supported yet"
        Exit Sub
    End If
    
    If RENAME_FILE(sVPATH1, sVPATH2) Then
        frmEmulation.set_AL 0
    Else
        frmEmulation.set_AL 255
        Debug.Print "rename error: INT21H_17H."
    End If
    
    
Exit Sub
err1:
    Debug.Print "do_INT21H_17H : " & Err.Description
    frmEmulation.set_AL 255
End Sub

Function read_ByteString_AT(lAddr As Long, lBytesTo_Read As Long) As String
On Error Resume Next
    Dim L As Long
    Dim s As String
    For L = 0 To lBytesTo_Read - 1
        s = s & RAM.mREAD_BYTE(lAddr + L)
    Next L
    read_ByteString_AT = s
    s = ""
End Function


' #400b9-curdir#
Function set_DOS_FILE_SYSTEM_DEFAULTS()
On Error GoTo err1

    ' VIRTUAL_DIR(0) should not be used.
    ' A = VIRTUAL_DIR(1)
    
    
    Dim byteI As Byte
    For byteI = 0 To byte_MAX_DRIVE + 1 ' #400b14-BUG2#  Z=26
        sDEF_VIRTUAL_DIR(byteI) = ""
    Next byteI
    
        
    set_DEFAULT_DRIVE 2  ' "C:"
    ' VIRTUAL_DIR(0) is NOT USED!
    ' A = 1, B = 2, C = 3
    sDEF_VIRTUAL_DIR(3) = "MYBUILD\"  ' !!!!!



Exit Function
err1:
Debug.Print "set_DOS_FILE_SYSTEM_DEFAULTS: " & Err.Description
    
End Function


' TODO
Private Function GET_CORRESPONDING_DOS_ERROR_NUMBER(err_code As Variant) As Integer

On Error GoTo opps_thats_funny

    Select Case err_code
    
    
    End Select
    
    Exit Function
opps_thats_funny:
    Debug.Print "error on error :) " & LCase(Err.Description)

End Function
' #1201-dos-errcodes
'                  01H       function number invalid
'                  02H       file not found
'                  03H       path not found
'                  04H       too many open files
'                  05H       access denied
'                  06H       handle invalid
'                  07H       memory control blocks destroyed
'                  08H       insufficient memory
'                  09H       memory block address invalid
'                  0AH (10)  environment invalid
'                  0BH (11)  format invalid
'                  0CH (12)  access code invalid
'                  0DH (13)  data invalid
'                  0EH (14)  unknown unit
'                  0FH (15)  disk drive invalid
'                  10H (16)  attempted to remove current directory
'                  11H (17)  not same device
'                  12H (18)  no more files
'                  13H (19)  disk write-protected
'                  14H (20)  unknown unit
'                  15H (21)  drive not ready
'                  16H (22)  unknown command
'                  17H (23)  data error (CRC)
'                  18H (24)  bad request structure length
'                  19H (25)  seek error
'                  1AH (26)  unknown media type
'                  1BH (27)  sector not found
'                  1CH (28)  printer out of paper
'                  1DH (29)  write fault
'                  1EH (30)  read fault
'                  1FH (31)  general failure
'                  20H (32)  sharing violation
'                  21H (33)  lock violation
'                  22H (34)  disk change invalid
'                  23H (35)  FCB unavailable
'                  24H (36)  sharing buffer exceeded
'                  25HÄ31H   reserved
'                  32H (50)  unsupported network request
'                  33H (51)  remote machine not listening
'                  34H (52)  duplicate name on network
'                  35H (53)  network name not found
'                  36H (54)  network busy
'                  37H (55)  device no longer exists on network
'                  38H (56)  netBIOS command limit exceeded
'                  39H (57)  error in network adapter hardware
'                  3AH (58)  incorrect response from network
'                  3BH (59)  unexpected network error
'                  3CH (60)  remote adapter incompatible
'                  3DH (61)  print queue full
'                  3EH (62)  not enough space for print file
'                  3FH (63)  print file canceled
'                  40H (64)  network name deleted
'                  41H (65)  network access denied
'                  42H (66)  incorrect network device type
'                  43H (67)  network name not found
'                  44H (68)  network name limit exceeded
'                  45H (69)  netBIOS session limit exceeded
'                  46H (70)  file sharing temporarily paused
'                  47H (71)  network request not accepted
'                  48H (72)  print or disk redirection paused
'                  49H-4FH   reserved
'                  50H (80)  file already exists
'                  51H (81)  reserved
'                  52H (82)  cannot make directory
'                  53H (83)  fail on Int 24H (critical error)
'                  54H (84)  too many redirections
'                  55H (85)  duplicate redirection
'                  56H (86)  invalid password
'                  57H (87)  invalid parameter
'                  58H (88)  network device fault
'                  59H (89)  function not supported by network
'                  5AH (90)  required system component not installed











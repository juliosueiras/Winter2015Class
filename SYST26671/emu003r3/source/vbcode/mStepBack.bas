Attribute VB_Name = "mStepBack"
' #1095. make "Step Back" !
' and it is possible to turn off step back from emu8086.ini
        

Option Explicit


Public Declare Function CopyFile Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long) As Long



Global bAllowStepBack As Boolean

Global bSTEPPING_BACK As Boolean




Const default_steps_back_to_keep As Integer = 200 ' DEFAULT limit to 200 steps back
Dim iMaximum_Steps_Back As Integer


Dim iNumberOfRecordedStepBacks As Integer

' #400b20-FPU#
Dim iNumberOfRecordedFPU_STATES As Integer



Global bALLOW_MEMORY_BACKSTEP_RECORDING As Boolean ' is true when all memory write operations are recorded.

' I hardly believe any instruction in 8086 instruction set
' modifies more than 4 bytes (actually, 2 bytes is the maximum...)
' we do not keep separate records of bytes and words, there should not be any incompatibility with negative addresses.
' first I though to keep 8 bytes only, but then (#1095g) I realised that INT 21h/9  changes more than 2 bytes so
' I set it to this maximum now :)
' FPU may also modify up to a 100 bytes per step
Const maxBytesToRecordInEveryStep As Integer = 4000 ' (1 to 4000) index=0 NOT USED in all arrays!

' 200 * 4000 = 800000  ... not much, just about 1MB :)
' 4000 = 25*80*2 (bytes in 80x25 text mode).

Type stepBackMemoryRecord
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ' -------- REGISTERS! ---------------------------
    regAL As Byte
    regAH As Byte
    regBL As Byte
    regBH As Byte
    regCL As Byte
    regCH As Byte
    regDL As Byte
    regDH As Byte
    
    regDS As Integer
    regES As Integer
    
    regSI As Integer
    regDI As Integer
    
    regBP As Integer
    
    regCS As Integer
    regIP As Integer
    
    regSS As Integer
    regSP As Integer
    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


    ' flags register:
    iFLAGS As Integer
    
    
''' obsolete! (I don't keep negative access to RAM/Write functions, because registers are kept anyway).
'''    ''' TO MAKE IT COMPATIBLE WITH NEGATIVE ADDRESS SENT TO RAM/WRITE/READ functions,
'''    ''' I keep two separate records for bytes and words:

    ' memory changes recording:
    ' FIRST (INDEX=0) is not USED!!!!
    byteMemoryRecordArray_VALUE(0 To maxBytesToRecordInEveryStep) As Byte
    byteMemoryRecordArray_ADDRESS(0 To maxBytesToRecordInEveryStep) As Long
    iMemoryBytesRecorded As Integer
    
    ' this ALU is really is useless, but I need to make it look nice :)
    ALU_aREG As Long ' 16-bit unsigned integer would be enough, but there is no such type in VB.
    ALU_bREG As Long
    ALU_cREG As Long
    
    
    
    
    ' set this flag when screen is scrolled:
    bSCREEN_SCROLL_IN_STEP As Boolean
    
    ' set this flag when the changes to the memory exceeds maxBytesToRecordInEveryStep
    bTOO_MANY_MEMORY_CHANGES As Boolean
    

    
    ' only for text mode!
    lVIDEO_PAGE_ADR As Long '#1139
    
    

    
' #v327_outbackstep#
''''    ' set this flag when some "OUT" instruction occurs:
''''    bOUT_IO_DONE As Boolean ' #1120

    ' #v327_outbackstep#
    ' allow step back of out instruction (byte)
    l_BYTE_IO_Port_NUMBER As Long
    byte_BYTE_IO_Port_VALUE As Byte
    ' allow step back of out instruction (word)
    l_WORD_IO_Port_NUMBER As Long
    i_WORD_IO_Port_VALUE As Integer
    
    
    
    
        
    ' #327spf2#
    '    ' set this flag for operations that cannot be undone:
    '    bFILE_WRITE_OPERATION_IN_STEP As Boolean
    iFILE_IO_OPERATION As Integer ' 0- no operation. 1- delete file, 2- delete dir, 3- rename file, 4-rename dir, 5-write to file, 6-create directory, 7-create file, 8-file seek, 9-open existing file for read-write.
    iFILE_IO_FileName_Path_Track_Index As Integer ' to avoid keeping strings in type, strings are kept in sFILENAMES_FOR_STEPBACK() and companion arrays.
    iFILE_IO_FileNum_INTERNAL As Integer
    iFILE_IO_LOC As Long
    iFILE_IO_mode As Byte ' used to undo close only.
    
    ' #327spf2# redundant!
    '''    ' #1202 to undo RECORD_VIRTUAL_FILE_HANDLE() by close!
    '''    iRECORDED_VIRTUAL_FILE_HANDLE As Integer
    '''
    '''

    ' #400b5-sb-4e-4f#  frmDOS_FILE remembers its previous filepaths by itself.
    bINT_21_4E_4F_Flag As Boolean
    iINT_21_4E_4F_ListIndex As Integer
    bINT_21_4E_4F_UPDATE_LISTINDEX_ONLY As Boolean
    
    
    
    ' #400b20-FPU#
    ' if not -1 then FPU instruction on current step
    iFPU_state_saved_index As Integer  ' FPU state is to be saved in a separate array (max ~32,000)
    
    
End Type


Dim stepsBack() As stepBackMemoryRecord  ' the last recorded step back has index=0, prevous index=1 etc... shift is done before recording new step.

' #400b20-FPU#
Dim fpuSAVED_FPU_STATES() As fpu87_STATE


' #327spf2#
Const default_Maximum_Files_to_Track As Integer = 200 ' DEFAULT limit to 200 filenames
Dim MAXIMUM_FILES_TO_TRACK As Integer
Dim iNumber_of_tracked_files_or_paths As Integer '#327spf2#
Dim sFILENAMES_FOR_STEPBACK() As String
Dim sFILENAMES_NEW_FOR_STEPBACK() As String ' for rename dir/file it is requred to keep  both new and old paths to enable undo.



' 20140415 step back is always on
Public Sub Init_Step_Back()

On Error GoTo err1

    bALLOW_MEMORY_BACKSTEP_RECORDING = False ' when true it starts memory changes recording.
    
    bSTEPPING_BACK = False

    Dim sFTEMP As String
    
    ' Enable_Step_Back
'    sFTEMP = LCase(get_property("emu8086.ini", "ENABLE_STEP_BACK", "true"))
'    If sFTEMP = "true" Or sFTEMP = "yes" Or sFTEMP = "1" Then   ' 3.27xp  - "yes" for compatiblity with previous versions. "1" jic.
        bAllowStepBack = True
'    Else
'        bAllowStepBack = False
'        Debug.Print "step back disabled!  ENABLE_STEP_BACK != true"
'        Exit Sub  ' NO NEED TO CONTINUE!!!
'    End If
       
'    ' Maximum_Steps_Back
'    sFTEMP = LCase(get_property("emu8086.ini", "MAXIMUM_STEPS_BACK", "default"))
'    If sFTEMP = "default" Then
        iMaximum_Steps_Back = default_steps_back_to_keep
'    Else
'        iMaximum_Steps_Back = to_signed_int(Val(sFTEMP))
'    End If
    
    
    If iMaximum_Steps_Back <= 0 Then
        bAllowStepBack = False
        Debug.Print "MAXIMUM_STEPS_BACK = 0; Disabled!"
        Exit Sub
    End If
    ReDim stepsBack(0 To iMaximum_Steps_Back)
        
        
    ' #400b20-FPU#
    ReDim fpuSAVED_FPU_STATES(0 To iMaximum_Steps_Back)
        
        
        
    ' v3.27r file undo
    ' #327spf#
'    sFTEMP = LCase(get_property("emu8086.ini", "MAXIMUM_FILES_TO_TRACK", "default"))
'    If sFTEMP = "default" Then
        MAXIMUM_FILES_TO_TRACK = default_Maximum_Files_to_Track
'    Else
'        MAXIMUM_FILES_TO_TRACK = Val(sFTEMP)
'    End If
'    If MAXIMUM_FILES_TO_TRACK > 0 Then  ' #327xp-sb-files#
'        ReDim sFILENAMES_FOR_STEPBACK(0 To MAXIMUM_FILES_TO_TRACK)
'        ReDim sFILENAMES_NEW_FOR_STEPBACK(0 To MAXIMUM_FILES_TO_TRACK)
'    Else
'        Debug.Print "step back for files is disabled!"
'    End If

    iNumberOfRecordedStepBacks = 0 ' nothing recorded yet. '#1103
    iNumberOfRecordedFPU_STATES = 0

    Exit Sub
    
err1:
    Debug.Print "Init_Step_Back: " & LCase(Err.Description)
End Sub




Public Sub ResetStepBackRecording()

On Error GoTo err1 ' #327xo-a-terrible-bug!#

    iNumberOfRecordedStepBacks = 0
    iNumberOfRecordedFPU_STATES = 0
    iNumber_of_tracked_files_or_paths = 0 ' #327spf2#
    bALLOW_MEMORY_BACKSTEP_RECORDING = False
    frmEmulation.cmdBack.Enabled = False
    

     If MAXIMUM_FILES_TO_TRACK > 0 Then ' #327xp-sb-files#
            ' remove all files from vdrive\tmp !
            ' "tmp\deleted_bkp_"*
            ' "tmp\opened_bkp_"*
            Dim i As Integer
            Dim ST As String
            For i = 0 To MAXIMUM_FILES_TO_TRACK
                ST = VDRIVE_PATH & "tmp\deleted_bkp_" & CStr(i) & ".dat"
                If FileExists(ST) Then
                    ' Debug.Print "rrrD: " & sT
                    DELETE_FILE ST
                End If
                ST = VDRIVE_PATH & "tmp\opened_bkp_" & CStr(i) & ".dat"
                If FileExists(ST) Then
                    ' Debug.Print "rrrO: " & sT
                    DELETE_FILE ST
                End If
            Next i
    End If
    
    
    Exit Sub
err1:
    Debug.Print "ResetStepBackRecording: " & Err.Description
    On Error Resume Next
    
End Sub




Public Sub startStepRecord()
    
    shift_back_steps_right ' remove back step with maximum index, put previous back step there... etc... make clean zero record.
    
    With stepsBack(0)
    
        .regAL = Val("&h" & frmEmulation.txtAL.Text)
        .regAH = Val("&h" & frmEmulation.txtAH.Text)
        .regBL = Val("&h" & frmEmulation.txtBL.Text)
        .regBH = Val("&h" & frmEmulation.txtBH.Text)
        .regCL = Val("&h" & frmEmulation.txtCL.Text)
        .regCH = Val("&h" & frmEmulation.txtCH.Text)
        .regDL = Val("&h" & frmEmulation.txtDL.Text)
        .regDH = Val("&h" & frmEmulation.txtDH.Text)
        
        .regDS = Val("&h" & frmEmulation.txtDS.Text)
        .regES = Val("&h" & frmEmulation.txtES.Text)
        
        .regSI = Val("&h" & frmEmulation.txtSI.Text)
        .regDI = Val("&h" & frmEmulation.txtDI.Text)
        
        .regBP = Val("&h" & frmEmulation.txtBP.Text)
        
        .regCS = Val("&h" & frmEmulation.txtCS.Text)
        .regIP = Val("&h" & frmEmulation.txtIP.Text)
        
        .regSS = Val("&h" & frmEmulation.txtSS.Text)
        .regSP = Val("&h" & frmEmulation.txtSP.Text)
    
        .iFLAGS = frmFLAGS.getFLAGS_REGISTER16
    
        .iMemoryBytesRecorded = 0
        
        If ALU.Visible Then
            .ALU_aREG = ALU.returnALU_STATE(1)
            .ALU_bREG = ALU.returnALU_STATE(2)
            .ALU_cREG = ALU.returnALU_STATE(3)
        End If
        
        .iFILE_IO_OPERATION = 0 ' no operation ' #327spf2# ' .bFILE_WRITE_OPERATION_IN_STEP = False
        .iFILE_IO_FileName_Path_Track_Index = -1
        .iFILE_IO_FileNum_INTERNAL = 0
        .iFILE_IO_LOC = 0
        .iFILE_IO_mode = 0
        ' #327spf2#  redundant ' .iRECORDED_VIRTUAL_FILE_HANDLE = -1 ' #1202
        
        .bSCREEN_SCROLL_IN_STEP = False
        
        .bTOO_MANY_MEMORY_CHANGES = False
        

        
        .lVIDEO_PAGE_ADR = lCURRENT_VIDEO_PAGE_ADR
        
        ' #v327_outbackstep#            .bOUT_IO_DONE = False
        .l_BYTE_IO_Port_NUMBER = -1 ' no i/o b.out operation
        .l_WORD_IO_Port_NUMBER = -1 ' no i/o w.out operation
    
        ' #400b5-sb-4e-4f#
        .bINT_21_4E_4F_Flag = False
        .iINT_21_4E_4F_ListIndex = -1
        .bINT_21_4E_4F_UPDATE_LISTINDEX_ONLY = True
        
        
        ' #400b20-FPU#
        .iFPU_state_saved_index = -1
    
    End With
    
    
    bALLOW_MEMORY_BACKSTEP_RECORDING = True
    
End Sub

Public Sub stopStepRecord()

    bALLOW_MEMORY_BACKSTEP_RECORDING = False
    
    iNumberOfRecordedStepBacks = iNumberOfRecordedStepBacks + 1
   
   
    ' we don't keep more, we just shift them, the first recorded step disapears from the record
    ' when we reach the maximum!
    If iNumberOfRecordedStepBacks > iMaximum_Steps_Back Then ' #1103
        iNumberOfRecordedStepBacks = iMaximum_Steps_Back
    End If


   
    '''' enable back step button:
    frmEmulation.cmdBack.Enabled = True
    
End Sub


' prepare fo future backstep....
' filenames must be real!
' for example not: "mytext.txt" but "c:\emu8086\MyBuild\mytext.txt"
Public Sub set_FILE_WRITE_OPERATION_BACKSTEP(iIO_OPERATION_INDEX As Integer, sFILE_NAME_OR_PATH As String, sFILE_NAME_OR_PATH_NEW_if_any As String, iINTERNAL_FileNum_if_any As Integer, Optional charByteACCESS_MODE As Byte = 0)
On Error GoTo err1
    
    
    If MAXIMUM_FILES_TO_TRACK <= 0 Then Exit Sub ' #327xp-sb-files#
    
    
    If bSTEPPING_BACK Then Exit Sub ' avoid anything recursive...
    
    
    stepsBack(0).iFILE_IO_OPERATION = iIO_OPERATION_INDEX ' no operation ' #327spf2# ' stepsBack(0).bFILE_WRITE_OPERATION_IN_STEP = True
    
    ' #327spf2#
    stepsBack(0).iFILE_IO_FileName_Path_Track_Index = add_to_tracked_files_or_paths(sFILE_NAME_OR_PATH, sFILE_NAME_OR_PATH_NEW_if_any)
    stepsBack(0).iFILE_IO_FileNum_INTERNAL = iINTERNAL_FileNum_if_any    '-1 if not set/not!   ' should be actual filenumber in VB (not converted to +4)           ' if file with this name is still open, no need to reopen it for undo operation.
     
    ' 0- no operation. 1- delete file, 2- delete dir, 3- rename file, 4-rename dir, 5-write to file, 6-create directory, 7-create file, 8-seek file, 9-open existing file for read-write, 10-close file.

    Select Case iIO_OPERATION_INDEX
    
    Case 0
        ' do nothing...
        '   probably some (legal) error....
    
    Case 1
        ' #327spf2#
        ' must create a backup copy of deleted file in vdrive/tmp !
        ' backup file should be named: vdrive\tmp\deleted_bkp_[stepsBack(0).iFILE_IO_FileName_Path_Track_Index]
        ' backup should not be made if stepsBack(0).iFILE_IO_FileName_Path_Track_Index=-1 !
        
        ' probably the best would be just to use "rename" instead of "delete"
        
        If stepsBack(0).iFILE_IO_FileName_Path_Track_Index >= 0 Then
        
            ' make sure temp drive exists:
             myMKDIR VDRIVE_PATH & "tmp"
            
             Dim sTFOR_UNDELETE As String
             sTFOR_UNDELETE = VDRIVE_PATH & "tmp\deleted_bkp_" & stepsBack(0).iFILE_IO_FileName_Path_Track_Index & ".dat"
            
             If FileExists(sTFOR_UNDELETE) Then  ' jic, Name() does not allow second parameter to exits!
                DELETE_FILE sTFOR_UNDELETE
             End If
             
             Name sFILE_NAME_OR_PATH As sTFOR_UNDELETE
            
        End If
        
    Case 2
        ' it's not possible to delete dirs that contain other files/dirs,
        ' so we don't need to do any preparations here, for undo we can just create an empty dir with the same name.
    
    Case 3
        ' no need to do anything now.
    
    Case 4  ' hm... doesn't seem to be used....
        ' no need to do anything now.
        
    Case 5
        ' #327spf2#...... decided not to...
        ' must('ve been) keep a backup of replaced bytes....
        ' loc must be set 1 byte back before sucessful read...
        ' this can be called several times in a single step... cause this is how write_virtual_file() works...
        ' (probably I will not redo this, just keeping backup before opening file for write should be enough... I think...).
                
    Case 6
         ' no need to do anything now.
         
    Case 7
         
         
         If FileExists(sFILE_NAME_OR_PATH) Then         ' #OK 327r#
             ' file create pre-step back must also create a backup! because if file exists it is overwritten!
            If stepsBack(0).iFILE_IO_FileName_Path_Track_Index >= 0 Then
                ' make sure temp drive exists:
                 myMKDIR VDRIVE_PATH & "tmp"
                
                 Dim sTFOR_UNCREATE As String
                 sTFOR_UNCREATE = VDRIVE_PATH & "tmp\deleted_bkp_" & stepsBack(0).iFILE_IO_FileName_Path_Track_Index & ".dat"
                
                 If FileExists(sTFOR_UNCREATE) Then  ' jic, Name() does not allow second parameter to exits!
                    DELETE_FILE sTFOR_UNCREATE ' clear tmp folder...
                 End If
                 Name sFILE_NAME_OR_PATH As sTFOR_UNCREATE
            End If
        End If
         
    Case 8
        ' #327spf2#
        ' keep current LOCATION!
        ' note: ' weird. VB function returns location-1 of what Seek has set (DOS INT style?).
        ' I'll try to use SEEK() function/statement instead.
        If iINTERNAL_FileNum_if_any >= 1 Then
            stepsBack(0).iFILE_IO_LOC = Seek(iINTERNAL_FileNum_if_any)
        End If
        
    Case 9
        ' #327spf2#
        ' keep backup!
        ' must create a backup copy of a file to be opened in vdrive/tmp !
        ' backup file should be named: vdrive\tmp\opened_bkp_[stepsBack(0).iFILE_IO_FileName_Path_Track_Index]
        ' backup should not be made if stepsBack(0).iFILE_IO_FileName_Path_Track_Index=-1 !
        
        ' backup should not be created if file size is over 1 mb.
        
        ' need to keep a backup for write/read-write only...
        If charByteACCESS_MODE = 1 Or charByteACCESS_MODE = 2 Then
            If stepsBack(0).iFILE_IO_FileName_Path_Track_Index >= 0 Then
                If FileLen(sFILE_NAME_OR_PATH) <= 1048576 Then ' 2^20
                     ' make sure temp drive exists:
                     myMKDIR VDRIVE_PATH & "tmp"
                     Dim sDEST As String
                     sDEST = VDRIVE_PATH & "tmp\opened_bkp_" & stepsBack(0).iFILE_IO_FileName_Path_Track_Index & ".dat"
                     Debug.Print "file copy:"
                     Debug.Print sFILE_NAME_OR_PATH
                     Debug.Print sDEST
                     COPY_FILE sFILE_NAME_OR_PATH, sDEST
                End If
            End If
       End If
       
    Case 10
        
        stepsBack(0).iFILE_IO_LOC = Seek(iINTERNAL_FileNum_if_any) ' #327r-sb-impr#
        stepsBack(0).iFILE_IO_mode = get_FILE_MODE_from_FILENUM(iINTERNAL_FileNum_if_any)
        ' + track orginal file name and original file number (must revert to the same number if possible!, other wise unsuccessfull step back!)
        
    Case Else
        Debug.Print "wrong iIO_OPERATION_INDEX in set_FILE_WRITE_OPERATION_BACKSTEP(): " & iIO_OPERATION_INDEX
        
    End Select
    
    '
    

   '  Debug.Print "OK. set_FILE_WRITE_OPERATION_BACKSTEP: op:" & iIO_OPERATION_INDEX & " fn: """ & sFILE_NAME_OR_PATH & """ fnnew: """ & sFILE_NAME_OR_PATH_NEW_if_any & """" & """ fnum: """ & iINTERNAL_FileNum_if_any & """"
    
    Exit Sub
err1:
    Debug.Print "err: set_FILE_WRITE_OPERATION_BACKSTEP: " & LCase(Err.Description)
End Sub

Public Sub set_bSCREEN_SCROLL_IN_STEP_FLAG()
On Error GoTo err1
    stepsBack(0).bSCREEN_SCROLL_IN_STEP = True
    Exit Sub
err1:
    Debug.Print "Err: set_bSCREEN_SCROLL_IN_STEP_FLAG: " & LCase(Err.Description)
End Sub

' #v327_outbackstep# - for out port, al (or similar) - byte!
Public Sub set_bOUT_for_STEPBACK(lPortNumber As Long, byteValue As Byte)
On Error GoTo err1
    
    If bSTEPPING_BACK Then Exit Sub ' do not allow anything recursive!

    stepsBack(0).l_BYTE_IO_Port_NUMBER = lPortNumber
    stepsBack(0).byte_BYTE_IO_Port_VALUE = byteValue
    Exit Sub
err1:
    Debug.Print "set_bOUT_for_STEPBACK: " & LCase(Err.Description)
End Sub



' #v327_outbackstep# - for out port, ax (or similar) - word!
Public Sub set_wOUT_for_STEPBACK(lPortNumber As Long, wordValue As Integer)
On Error GoTo err1

    If bSTEPPING_BACK Then Exit Sub ' do not allow anything recursive!

    stepsBack(0).l_WORD_IO_Port_NUMBER = lPortNumber
    stepsBack(0).i_WORD_IO_Port_VALUE = wordValue
    Exit Sub
err1:
    Debug.Print "set_wOUT_for_STEPBACK: " & LCase(Err.Description)
End Sub


' #327spf2#  redundant '
''''
'''''#1202
''''Public Sub set_iRECORDED_VIRTUAL_FILE_HANDLE_for_StepBack(iInternalHandle As Integer)
''''On Error GoTo err1
''''
''''    If bSTEPPING_BACK Then Exit Sub ' avoid anything recursive...
''''
''''    stepsBack(0).iRECORDED_VIRTUAL_FILE_HANDLE = iInternalHandle
''''    Exit Sub
''''err1:
''''    Debug.Print "Err: set_iRECORDED_VIRTUAL_FILE_HANDLE: " & LCase(err.Description)
''''End Sub


Public Sub DO_STEP_BACK()
    
On Error GoTo err1

    
    Dim i As Integer
    
    If iNumberOfRecordedStepBacks <= 0 Then
        mBox frmEmulation, "There are no recorded back steps ...."
        Exit Sub
    End If



    If bSTEPPING_BACK Then ' to avoid over-and-over/recursive/uncontrolable stepping back...
        Debug.Print "already doing step back...."
        Exit Sub
    End If
    
    ' !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    bSTEPPING_BACK = True  ' MUST RESET ON EXIT !!!!!!!!!!!!!!!!!!!!!!
   ' !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    ' just like before step forward, before step back all highlights must be reset:
    frmEmulation.Reset_registers_highlight_PUBLIC '#1095d
    

    ' it could be enough just to set variable of registers and then call showRegisters(), but
    ' I don't have access to them from here...
    ' so I change texts and it changes the regs accordingly and updates memory position to CS:IP

    With stepsBack(0)
    
        frmEmulation.txtAL.Text = make_min_len(Hex(.regAL), 2, "0")
        frmEmulation.txtAH.Text = make_min_len(Hex(.regAH), 2, "0")
        frmEmulation.txtBL.Text = make_min_len(Hex(.regBL), 2, "0")
        frmEmulation.txtBH.Text = make_min_len(Hex(.regBH), 2, "0")
        frmEmulation.txtCL.Text = make_min_len(Hex(.regCL), 2, "0")
        frmEmulation.txtCH.Text = make_min_len(Hex(.regCH), 2, "0")
        frmEmulation.txtDL.Text = make_min_len(Hex(.regDL), 2, "0")
        frmEmulation.txtDH.Text = make_min_len(Hex(.regDH), 2, "0")
        
        frmEmulation.txtDS.Text = make_min_len(Hex(.regDS), 4, "0")
        frmEmulation.txtES.Text = make_min_len(Hex(.regES), 4, "0")
        
        frmEmulation.txtSI.Text = make_min_len(Hex(.regSI), 4, "0")
        frmEmulation.txtDI.Text = make_min_len(Hex(.regDI), 4, "0")
        
        frmEmulation.txtBP.Text = make_min_len(Hex(.regBP), 4, "0")
        
        frmEmulation.txtCS.Text = make_min_len(Hex(.regCS), 4, "0")
        frmEmulation.txtIP.Text = make_min_len(Hex(.regIP), 4, "0")
        
        frmEmulation.txtSS.Text = make_min_len(Hex(.regSS), 4, "0")
        frmEmulation.txtSP.Text = make_min_len(Hex(.regSP), 4, "0")
    
        frmFLAGS.setFLAGS_REGISTER (.iFLAGS)
    
        ' return memory:
        ' index(0) is not used! enters the loop only when .iMemoryBytesRecorded>=1
        '#1095i For i = 1 To .iMemoryBytesRecorded
        If .iMemoryBytesRecorded > 0 Then 'jic ;)
            For i = .iMemoryBytesRecorded To 1 Step -1
               RAM.mWRITE_BYTE .byteMemoryRecordArray_ADDRESS(i), .byteMemoryRecordArray_VALUE(i)
            Next i
        End If
        
        
        If ALU.Visible Then
            ALU.setALU_STATE 1, .ALU_aREG
            ALU.setALU_STATE 2, .ALU_bREG
            ALU.setALU_STATE 3, .ALU_cREG
            ALU.Refresh
        End If
        
        
        
        
        
        
        
        
        
' #327spf2#  redundant '
'''        If .iRECORDED_VIRTUAL_FILE_HANDLE <> -1 Then ' #1202
'''            CLOSE_VIRTUAL_FILE .iRECORDED_VIRTUAL_FILE_HANDLE + iFILE_HANDLE_INDEX_CORRECTION
'''        End If
'''
'''
        
        
        If .iFILE_IO_OPERATION <> 0 Then
        
        
            ' 0- no operation. 1- delete file, 2- delete dir, 3- rename file, 4-rename dir, 5-write to file, 6-create directory, 7-create file, 8-seek file, 9-open existing file for read-write, 10-close file.


            ' revert changes....
            Select Case .iFILE_IO_OPERATION
        
            ' #327spf2#
            
            Case 0
                ' do nothing...
                
            Case 1
                If stepsBack(0).iFILE_IO_FileName_Path_Track_Index >= 0 Then
                     Name VDRIVE_PATH & "tmp\deleted_bkp_" & stepsBack(0).iFILE_IO_FileName_Path_Track_Index & ".dat" As sFILENAMES_FOR_STEPBACK(stepsBack(0).iFILE_IO_FileName_Path_Track_Index)
                End If
            
            Case 2
                If stepsBack(0).iFILE_IO_FileName_Path_Track_Index >= 0 Then
                    myMKDIR sFILENAMES_FOR_STEPBACK(stepsBack(0).iFILE_IO_FileName_Path_Track_Index)
                End If
                
            Case 3, 4 '  ' hm... 4 doesn't seem to be used....
                If stepsBack(0).iFILE_IO_FileName_Path_Track_Index >= 0 Then
                    Name sFILENAMES_NEW_FOR_STEPBACK(stepsBack(0).iFILE_IO_FileName_Path_Track_Index) As sFILENAMES_FOR_STEPBACK(stepsBack(0).iFILE_IO_FileName_Path_Track_Index)
                End If
                        
            Case 5
                'If LCase(get_property("emu8086.ini", "FILE_UNDO_NOTE", "true")) = "true" Then
                    mBox frmEmulation, "note: " & vbNewLine & "byte-by-byte file write operations cannot be undone, however" & vbNewLine & _
                                       "all subsequent write operations are reverted when file open is undone." '& vbNewLine & vbNewLine & _
                                       '" to turn off this notification set" & vbNewLine & " FILE_UNDO_NOTE=false in emu8086.ini"
                'End If
                
            Case 6
                If stepsBack(0).iFILE_IO_FileName_Path_Track_Index >= 0 Then
                    Dim sTRMDIR As String
                    sTRMDIR = sFILENAMES_FOR_STEPBACK(stepsBack(0).iFILE_IO_FileName_Path_Track_Index)
                    If InStr(1, sTRMDIR, VDRIVE_PATH, vbTextCompare) = 1 Or InStr(1, sTRMDIR, s_MyBuild_Dir, vbTextCompare) = 1 Then  ' just in case...
                        RmDir sTRMDIR
                    End If
                End If
            
            Case 7
            
                CLOSE_VIRTUAL_FILE stepsBack(0).iFILE_IO_FileNum_INTERNAL + iFILE_HANDLE_INDEX_CORRECTION
            
                If stepsBack(0).iFILE_IO_FileName_Path_Track_Index >= 0 Then
                    Dim sTDEL As String
                    sTDEL = sFILENAMES_FOR_STEPBACK(stepsBack(0).iFILE_IO_FileName_Path_Track_Index)
                    If InStr(1, sTDEL, VDRIVE_PATH, vbTextCompare) = 1 Or InStr(1, sTDEL, s_MyBuild_Dir, vbTextCompare) = 1 Then  ' just in case...
                        If FileExists(sTDEL) Then DELETE_FILE sTDEL
                    End If
                    
                    ' TODO: restore from backup if file with this name existed before creating new one!
                    ' #OK 327r#
                    Dim sTmp As String
                    sTmp = VDRIVE_PATH & "tmp\deleted_bkp_" & stepsBack(0).iFILE_IO_FileName_Path_Track_Index & ".dat"
                    If FileExists(sTmp) Then
                        Name sTmp As sFILENAMES_FOR_STEPBACK(stepsBack(0).iFILE_IO_FileName_Path_Track_Index)
                    End If
                    
                End If
 
            
            Case 8
                ' revert current LOCATION!
                ' note: ' weird. VB function returns location-1 of what Seek has set (DOS INT style?).
                ' I'll try to use SEEK() function/statement instead.
                If stepsBack(0).iFILE_IO_FileNum_INTERNAL >= 1 And stepsBack(0).iFILE_IO_FileName_Path_Track_Index >= 0 Then
                    If get_FILENAME_from_FILENUM(stepsBack(0).iFILE_IO_FileNum_INTERNAL) = sFILENAMES_FOR_STEPBACK(stepsBack(0).iFILE_IO_FileName_Path_Track_Index) Then  ' jic
                        Seek #stepsBack(0).iFILE_IO_FileNum_INTERNAL, .iFILE_IO_LOC
                    End If
                End If

            
            Case 9
            
            
                CLOSE_VIRTUAL_FILE stepsBack(0).iFILE_IO_FileNum_INTERNAL + iFILE_HANDLE_INDEX_CORRECTION
                        
                If stepsBack(0).iFILE_IO_FileName_Path_Track_Index >= 0 Then
                    Dim sTFILE_PREOPEN As String
                    sTFILE_PREOPEN = VDRIVE_PATH & "tmp\opened_bkp_" & stepsBack(0).iFILE_IO_FileName_Path_Track_Index & ".dat"
                    
                    If FileExists(sTFILE_PREOPEN) Then
                         ' move it:
                         Dim sTFILE_MODIFIED As String
                         sTFILE_MODIFIED = sFILENAMES_FOR_STEPBACK(stepsBack(0).iFILE_IO_FileName_Path_Track_Index)
                         If InStr(1, sTFILE_MODIFIED, VDRIVE_PATH, vbTextCompare) = 1 Or InStr(1, sTFILE_MODIFIED, s_MyBuild_Dir, vbTextCompare) = 1 Then   ' just in case...
                            If FileExists(sTFILE_MODIFIED) Then DELETE_FILE sTFILE_MODIFIED  ' it must exits, but anyway... jic.
                            Name sTFILE_PREOPEN As sTFILE_MODIFIED
                         End If
                    End If
                End If
                
            Case 10 '  #327spf3#
        
                If stepsBack(0).iFILE_IO_FileName_Path_Track_Index >= 0 Then
                
                    Dim sT_ORIG_FILENAME As String
                    sT_ORIG_FILENAME = sFILENAMES_FOR_STEPBACK(stepsBack(0).iFILE_IO_FileName_Path_Track_Index)
                    Dim iT_ORIG_FILENUM As Integer
                    iT_ORIG_FILENUM = stepsBack(0).iFILE_IO_FileNum_INTERNAL
                    Dim cT_ORIG_MODE As Byte
                    cT_ORIG_MODE = stepsBack(0).iFILE_IO_mode
                    
                    Dim iNewFileNum As Integer
                    
                    iNewFileNum = OPEN_VIRTUAL_FILE(sT_ORIG_FILENAME, cT_ORIG_MODE)
                    iNewFileNum = iNewFileNum - iFILE_HANDLE_INDEX_CORRECTION ' make it real (internal) number.
                    
                    ' #327r-sb-impr#
                    Seek #iNewFileNum, stepsBack(0).iFILE_IO_LOC
                    
                    ' must check if the same number is assigned as it was for:
                    ' stepsBack(0).iFILE_IO_FileNum !!!
                    
                    ' wrong, we need the same number, not the same filename!! If StrComp(sT_ORIG_FILENAME, get_FILENAME_from_FILENUM(iT_ORIG_FILENUM), vbTextCompare) = 0 Then
                    If iNewFileNum = iT_ORIG_FILENUM Then
                        ' ok!
                    Else
                        mBox frmEmulation, "cannot re-open the file with the same file number..." & vbNewLine & "undo is not possible."
                    End If
                    
                End If
        
            Case Else
                Debug.Print "DO_STEP_BACK: unknown .iFILE_IO_OPERATION=" & .iFILE_IO_OPERATION

                
            End Select
            
        End If
        
        
        
        
        
        
        
        
        
        If .bSCREEN_SCROLL_IN_STEP Then
            frmScreen.clearScreen ' #1106c
            mBox frmEmulation, "note: " & vbNewLine & "screen scroll operations cannot be undone." & vbNewLine & "it applies both to automatic and manual scroll." & vbNewLine & "screen cleared."
        End If
        
        If .bTOO_MANY_MEMORY_CHANGES Then
            frmScreen.clearScreen ' #1106c
            mBox frmEmulation, "note: " & vbNewLine & "memory write operation exceeded " & maxBytesToRecordInEveryStep & " bytes." & vbNewLine & "when interrupt modifies more than " & maxBytesToRecordInEveryStep & " bytes" & vbNewLine & "it cannot be undone, it applies to RAM / video memory." & vbNewLine & "screen cleared."
        End If
        

        
        If .lVIDEO_PAGE_ADR <> lCURRENT_VIDEO_PAGE_ADR Then
            lCURRENT_VIDEO_PAGE_ADR = .lVIDEO_PAGE_ADR
            frmScreen.VMEM_TO_SCREEN
        End If
        
        
'#v327_outbackstep#
'''        If .bOUT_IO_DONE Then
'''            mBox frmEmulation, "please note: " & vbNewLine & "OUT instruction cannot be undone."
'''        End If
        If .l_BYTE_IO_Port_NUMBER <> -1 Then
            WRITE_IO_BYTE .l_BYTE_IO_Port_NUMBER, .byte_BYTE_IO_Port_VALUE
        End If
        If .l_WORD_IO_Port_NUMBER <> -1 Then
            WRITE_IO_WORD .l_WORD_IO_Port_NUMBER, .i_WORD_IO_Port_VALUE
        End If
        
        
        ' #400b5-sb-4e-4f#
''        If .bINT_21_4E_4F_Flag Then
''            frmDOS_FILE.do_INT_21_4E_4F_StepBack .iINT_21_4E_4F_ListIndex, .bINT_21_4E_4F_UPDATE_LISTINDEX_ONLY
''        End If
        
        
        ' #400b20-FPU#
        If .iFPU_state_saved_index <> -1 Then
            do_FPU_StepBack .iFPU_state_saved_index
        End If
        
        
    End With
    
    
' I think, it's not required! because these are updated on RAM.WRITE automatically.
'''    ' update memory list:
'''    frmEmulation.cmdShowMemory_Click_PUBLIC
'''    frmMemory.EMITATE_ShowMemory_Click
 
 
   ' update variables list:
    If b_frmVars_LOADED Then update_VAR_WINDOW
   
   

    
    shift_back_steps_left ' remove zero, replace it by 1... etc...
    
    
    iNumberOfRecordedStepBacks = iNumberOfRecordedStepBacks - 1
    
    If iNumberOfRecordedStepBacks <= 0 Then
        frmEmulation.cmdBack.Enabled = False
    End If
    
    
    
    
    
    ' #1095e. "Program terminated. Reload?" should not be shown after step back!
    frmEmulation.bTERMINATED = False
    bSTOP_frmDEBUGLOG = True
    
    
    
    
'    ' #1106
'    ' remove last log entry from debug log if any:
'    If bKEEP_DEBUG_LOG Then
'        frmDebugLog.remove_last_entry_from_log
'    End If
'
    
    
    ' #400b5-sb-4e-4f#
    If b_LOADED_frmMemory Then
        ' Now when I should 128 bytes only it shouldn't be that slow even for the list
        frmMemory.Update_List_or_Table
    End If
    
    
    
    '#1113 temp/test solution  - cant think of anything better, so just flush it:
    uCHARS_IN_KB_BUFFER = 0
    frmScreen.show_uKB_BUFFER
    
    ' !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    bSTEPPING_BACK = False
    ' !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    Exit Sub
    
err1:
    ' bSTEPPING_BACK = False
    
    mBox frmEmulation, "cannot step-back: " & LCase(Err.Description) '& vbNewLine & "Please send bug report to: info@emu8086.com"
    Resume Next ' v3.27r  allow to step back over errors...
End Sub


Public Sub keep_BYTE_CHANGE_FOR_CURRENT_BACKSTEP_RECORD(lADDRESS As Long)
    
    If Not bALLOW_MEMORY_BACKSTEP_RECORDING Then
        Debug.Print "keep_BYTE_CHANGE_FOR_CURRENT_BACKSTEP_RECORD: bALLOW_MEMORY_BACKSTEP_RECORDING=FALSE!!!! should not happend!!! "
        Exit Sub
    End If
    
    ' if the value of lAddress is negative it is the change of some register...
    ' I don't remember exactly why it is so, but it is probably related to encoding tables of instruction set in some way.
    ' we do not record such changes here because registers are stored independently for stepback anyway.
    If lADDRESS < 0 Then
        Debug.Print "keep_BYTE_CHANGE_FOR_CURRENT_BACKSTEP_RECORD: " & lADDRESS & " --- should not happen!!!!"
        Exit Sub
    End If
    
    
    If stepsBack(0).iMemoryBytesRecorded >= maxBytesToRecordInEveryStep Then
        ' Debug.Print "keep_BYTE_CHANGE_FOR_CURRENT_BACKSTEP_RECORD! Too many memory changes for a single instruction. >= " & maxBytesToRecordInEveryStep
        stepsBack(0).bTOO_MANY_MEMORY_CHANGES = True ' #1106b
        Exit Sub
    End If
       
    Dim i As Integer
    stepsBack(0).iMemoryBytesRecorded = stepsBack(0).iMemoryBytesRecorded + 1
    i = stepsBack(0).iMemoryBytesRecorded
        
    stepsBack(0).byteMemoryRecordArray_ADDRESS(i) = lADDRESS
    stepsBack(0).byteMemoryRecordArray_VALUE(i) = RAM.mREAD_BYTE(lADDRESS)
    
End Sub





' X->0,1,2,3... --->>>>
' remove back step with maximum index, put previous back step there... etc... make clean zero record.
Private Sub shift_back_steps_right()

    Dim i As Integer
    
    For i = iMaximum_Steps_Back To 1 Step -1
        stepsBack(i) = stepsBack(i - 1)
    Next i
    
End Sub

' <<<<--- ...6,7,8,9<-X
' remove zero, replace it by 1... etc...
Private Sub shift_back_steps_left()

    Dim i As Integer
    
    For i = 0 To iMaximum_Steps_Back - 1
        stepsBack(i) = stepsBack(i + 1)
    Next i
    
End Sub



'  #327spf2#
' returns index in arrays sFILENAMES_FOR_STEPBACK() and sFILENAMES_NEW_FOR_STEPBACK()  where
' current strings were stored...
' function returns -1 when there is no space left...
Private Function add_to_tracked_files_or_paths(sFilePath As String, sFilePath_new_if_any As String) As Integer

On Error GoTo err1


If MAXIMUM_FILES_TO_TRACK <= 0 Then ' #327xp-sb-files#
        add_to_tracked_files_or_paths = -1
        Exit Function
End If
 

If iNumber_of_tracked_files_or_paths > MAXIMUM_FILES_TO_TRACK Then
    add_to_tracked_files_or_paths = -1
    Exit Function
End If

iNumber_of_tracked_files_or_paths = iNumber_of_tracked_files_or_paths + 1

sFILENAMES_FOR_STEPBACK(iNumber_of_tracked_files_or_paths) = sFilePath

sFILENAMES_NEW_FOR_STEPBACK(iNumber_of_tracked_files_or_paths) = sFilePath_new_if_any

add_to_tracked_files_or_paths = iNumber_of_tracked_files_or_paths

Exit Function
err1:
        add_to_tracked_files_or_paths = -1
        Debug.Print "add_to_tracked_files_or_paths: " & Err.Description
End Function

' 4.00b15
Public Sub DELETE_FILE_if_exists(s As String)
On Error Resume Next
    If FileExists(s) Then
        DELETE_FILE s
    End If
End Sub


' #327xp-sb-files#
Public Sub DELETE_FILE(s As String)
    On Error GoTo err1
    
    SetAttr s, vbNormal
    Kill s
    
   ' Debug.Print "deleted: " & s
    
    Exit Sub
err1:
    Debug.Print "DELETE_FILE : " & Err.Description
    Debug.Print s
End Sub


' #327xp-sb-files#
Public Function RENAME_FILE(sOLD As String, sNEW As String) As Boolean
    On Error GoTo err1
    
    If FileExists(sNEW) Then
        DELETE_FILE sNEW
    End If
    
    ' it can rename hidden and readonly files too.
    ' recommended: complete path for both names!
        
    Name sOLD As sNEW
    
    RENAME_FILE = True
    
    Exit Function
err1:
    Debug.Print "RENAME_FILE : " & Err.Description
    Debug.Print sOLD
    Debug.Print sNEW
    RENAME_FILE = False
End Function

' #327xp-sb-files#
Public Sub COPY_FILE(ByVal sOLD As String, ByVal sNEW As String)
    On Error GoTo err1
    
    If FileExists(sNEW) Then
        DELETE_FILE sNEW
    End If
    
    ' it can copy hidden and readonly files too.
    ' recommended: complete path for both names!
        
    ' vb function cannot copy opened files!!!!!
    ' FileCopy sOLD, sNEW
    
    
    ' we use API now:
    Dim L As Long
    sOLD = sOLD & Chr(0) ' jic...
    sNEW = sNEW & Chr(0) ' jic...
    L = CopyFile(sOLD, sNEW, 1)
    
    If L = 0 Then
        Debug.Print "CopyFile FAILED."
        Debug.Print sOLD
        Debug.Print sNEW
    End If
    
    Exit Sub
err1:
    Debug.Print "COPY_FILE : " & Err.Description
    Debug.Print sOLD
    Debug.Print sNEW
End Sub


' #327xp-erase#
Sub STEP_BACK_FREE_MEM()
On Error GoTo err1
    Erase stepsBack
    Erase sFILENAMES_FOR_STEPBACK
    Erase sFILENAMES_NEW_FOR_STEPBACK
    Exit Sub
err1:
    Debug.Print "free mem: " & Err.Description
End Sub


' #400b5-sb-4e-4f#
Function get_MAXIMUM_FILES_TO_TRACK() As Integer
On Error Resume Next
   get_MAXIMUM_FILES_TO_TRACK = MAXIMUM_FILES_TO_TRACK
End Function


' #400b5-sb-4e-4f#
Public Sub set_INT21_4E_4F_for_STEPBACK(iListIndex As Integer, UPDATE_LISTINDEX_ONLY As Boolean)
On Error GoTo err1
    
    If bSTEPPING_BACK Then Exit Sub ' do not allow anything recursive!

    stepsBack(0).iINT_21_4E_4F_ListIndex = iListIndex
    stepsBack(0).bINT_21_4E_4F_Flag = True
    stepsBack(0).bINT_21_4E_4F_UPDATE_LISTINDEX_ONLY = UPDATE_LISTINDEX_ONLY
    
    Exit Sub
err1:
    Debug.Print "set_INT21_4E_for_STEPBACK: " & LCase(Err.Description)
End Sub



Public Sub set_StepBack_for_FPU(m As fpu87_STATE)
On Error GoTo err1

    If bSTEPPING_BACK Then Exit Sub ' do not allow anything recursive!
    
    fpuSAVED_FPU_STATES(iNumberOfRecordedFPU_STATES) = m
    stepsBack(0).iFPU_state_saved_index = iNumberOfRecordedFPU_STATES

    iNumberOfRecordedFPU_STATES = iNumberOfRecordedFPU_STATES + 1
    If iNumberOfRecordedFPU_STATES > iMaximum_Steps_Back Then
        iNumberOfRecordedFPU_STATES = 0  ' reset FPU steps (start over)
    End If

    Exit Sub
err1:
    Debug.Print "set_StepBack_for_FPU: " & Err.Description
End Sub





Private Sub do_FPU_StepBack(i As Integer)
On Error GoTo err1

    fpuGLOBAL_STATE = fpuSAVED_FPU_STATES(i)
    
    ' should work...
    iNumberOfRecordedFPU_STATES = iNumberOfRecordedFPU_STATES - 1
    If iNumberOfRecordedFPU_STATES < 0 Then
        iNumberOfRecordedFPU_STATES = 0
    End If


    If b_LOADED_frmFPU Then
        frmFPU.showFPU_STATE
    End If


    Exit Sub
err1:
    Debug.Print "do_FPU_StepBack: " & Err.Description
End Sub

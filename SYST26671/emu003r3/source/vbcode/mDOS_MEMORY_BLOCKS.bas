Attribute VB_Name = "mDOS_MEMORY_BLOCKS"
' mDOS_MEMORY_BLOCKS.bas

' #400b6-memory-block#

' INT 21h
'  AH
'  48H          Allocate Memory Block                   2.0+
'  49H          Release Memory Block                    2.0+
'  4AH          Resize Memory Block                     2.0+
'
'


' GENERAL TODO.....



Option Explicit


' COMMENTS ARE WRONG!!!!  (not implemented yet... we do simpler.)

' By default I give 1024 bytes to every block (0...3FF = 64 paragraphs)
'  this is actual for resize only (may not be implemented yet),
'  if request is for more than 64 paragraphs more is allocated.
'  but the next block will start after 64 bytes anyway.


' Starting from memory: 1000:0000  TO    9000:0000
'       physical:     (10000)      TO  (90000)
'                (8000h=32768 paragraphs=524,288 bytes)
' and we'll start the allocation from the top, ie from 8FFF:0000

' Const MAX_BLOCKS_TO_ALLOCATE As Long = 2048 ' no used yet.... thinking...
'
'Type DOS_memory_blocks
'    Dim iSTART_SEGMENT As Integer
'    Dim iSIZE_IN_PARAGRAPHS As Integer
'End Type

' Dim arrMEMORY_BLOCKS(0 To MAX_BLOCKS_TO_ALLOCATE) ' no used yet.... thinking...





' simpler... no freeing yet... but may come...


' 524,288 / 20,480 = 25,6 blocks... (fair:)   and we have about 36,864 K for a program... hm... no
' let's start the allocation from 3000:0000h  this will leave proggy fair 167,936 KB
' so now we have 24,576 paragrafs and  393,216 bytes = 19,2 blocks :)

Const START_SEGMENT_FOR_ALLOC As Long = 12288 '   3000h
Const PARAGRAPS_ON_TOP As Long = 1280 ' 20,480 K (for resize)
Const MAX_SEGMENT_FOR_ALLOC As Long = 36864   '  9000h

' this should fix it for a while :)
Dim lLAST_SEGMENT As Long  ' should not be over 16 bits.
Dim lLAST_SIZE_IN_PARAGRAPS As Long ' should not be over 16 bits.


' #400b9-release-mem#
Dim lReleased_Blocks As Long
Dim lRELEASED() As Long ' values should not be over 16 bits.


'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'Int 21H                                                                [2.0]
'Function 48H (72)
'Allocate memory block
'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
'
'  Allocates a block of memory and returns a pointer to the beginning of the
'  allocated area.
'
'Call with:
'
'  AH            = 48H
'  BX            = number of paragraphs of memory needed
'
'Returns:
'
'  If function successful
'
'  Carry flag    = clear
'  AX            = base segment address of allocated block
'
'  If function unsuccessful
'
'  Carry flag    = set
'  AX            = error code
'  BX            = size of largest available block (paragraphs)
'
'Notes:
'
'  ş If the function succeeds, the base address of the newly allocated block
'    is AX:0000.
'
'  ş The default allocation strategy used by MS-DOS is "first fit"' that is,
'    the memory block at the lowest address that is large enough to satisfy
'    the request is allocated. The allocation strategy can be altered with
'    Int 21H Function 58H.
'
'  ş When a .COM program is loaded, it ordinarily already "owns" all of the
'    memory in the transient program area, leaving none for dynamic
'    allocation. The amount of memory initially allocated to a .EXE program
'    at load time depends on the MINALLOC and MAXALLOC fields in the .EXE
'    file header. See Int 21H Function 4AH.
'
'Example:
'
'  Request a 64 KB block of memory for use as a buffer.
'
'  bufseg  dw      ?               ' segment base of new block
'          .
'          .
'          .
'          mov     ah,48h          ' function number
'          mov     bx,1000h        ' block size (paragraphs)
'          int     21h             ' transfer to MS-DOS
'          jc      error           ' jump if allocation failed
'          mov     bufseg,ax       ' save segment of new block
'          .
'          .
'          .
'

Sub do_INT_21h_48h()
    
On Error GoTo err1

    If lLAST_SEGMENT <= 0 Then
        lLAST_SEGMENT = START_SEGMENT_FOR_ALLOC
        lLAST_SIZE_IN_PARAGRAPS = 0
    Else
        lLAST_SEGMENT = lLAST_SEGMENT + lLAST_SIZE_IN_PARAGRAPS + PARAGRAPS_ON_TOP
        lLAST_SIZE_IN_PARAGRAPS = lLAST_SIZE_IN_PARAGRAPS + to_unsigned_long(frmEmulation.get_BX)
    End If
    
    If lLAST_SEGMENT >= MAX_SEGMENT_FOR_ALLOC Then
        ' #400b9-release-mem#
        If lReleased_Blocks > 0 And to_unsigned_long(frmEmulation.get_BX) < PARAGRAPS_ON_TOP Then ' are there some released blocks?
            Dim lDDADR As Long
            lDDADR = lRELEASED(lReleased_Blocks)
            Do While lReleased_Blocks > 0 ' in case there is some error in released data... release valid blocks only!
                lReleased_Blocks = lReleased_Blocks - 1
                If lDDADR >= START_SEGMENT_FOR_ALLOC And lDDADR < MAX_SEGMENT_FOR_ALLOC Then
                    frmEmulation.set_AX to_signed_int(lDDADR)
                    ' BX unchanged if success...
                    frmEmulation.bCLEAR_CF_ON_IRET = True
                    Debug.Print "Allocate Memory Block OK (reusing)"
                    Exit Sub
                End If
            Loop
            GoTo all_blocks_not_valid
        Else
all_blocks_not_valid:
            frmEmulation.set_AX 8   '      insufficient memory
            frmEmulation.set_BX 0
            frmEmulation.bSET_CF_ON_IRET = True
            Debug.Print "Allocate Memory Block FAILED"
        End If
    Else
        frmEmulation.set_AX to_signed_int(lLAST_SEGMENT)
        ' BX unchanged if success...
        frmEmulation.bCLEAR_CF_ON_IRET = True
        Debug.Print "Allocate Memory Block OK"
    End If
    
    
    Exit Sub
err1:
    Debug.Print "do_INT_21h_48h: " & err.Description
    frmEmulation.bSET_CF_ON_IRET = True
    frmEmulation.set_AX 9   '     memory block address invalid
End Sub

Sub do_INT_21h_49h()

On Error GoTo err1


    ' #400b9-release-mem#
    lReleased_Blocks = lReleased_Blocks + 1
    ReDim Preserve lRELEASED(0 To lReleased_Blocks) ' index zero not used.
    lRELEASED(lReleased_Blocks) = to_unsigned_long(frmEmulation.get_ES)






    frmEmulation.bCLEAR_CF_ON_IRET = True
    
    Debug.Print "Release Memory Block 'success'"
    
    Exit Sub
err1:
    Debug.Print "do_INT_21h_49h: " & err.Description
    frmEmulation.bSET_CF_ON_IRET = True
    frmEmulation.set_AX 9   '     memory block address invalid
End Sub


'Int 21H                                                                [2.0]
'Function 4AH (74)
'Resize memory block
Sub do_INT_21h_4Ah()

On Error GoTo err1

    Dim L As Long
    L = to_unsigned_long(frmEmulation.get_BX)
    
    If L <= PARAGRAPS_ON_TOP Then
        frmEmulation.bCLEAR_CF_ON_IRET = True
        ' ES unchanged
        ' BX unchanged
        Debug.Print "Resize Memory Block OK!"
    Else
        frmEmulation.set_AX 8   '      insufficient memory
        frmEmulation.set_BX 0
        frmEmulation.bSET_CF_ON_IRET = True
        Debug.Print "Resize Memory Block FAILED!"
    End If

    Exit Sub
err1:
    Debug.Print "do_INT_21h_4Ah: " & err.Description
    frmEmulation.bSET_CF_ON_IRET = True
    frmEmulation.set_AX 9   '     memory block address invalid
End Sub


Sub CLEAR_DOS_ALOC_MEMORY()
On Error Resume Next
    lLAST_SEGMENT = 0
    lLAST_SIZE_IN_PARAGRAPS = 0
    
    lReleased_Blocks = 0
    Erase lRELEASED
End Sub


' error codes:
'                  07H       memory control blocks destroyed
'                  08H       insufficient memory
'                  09H       memory block address invalid


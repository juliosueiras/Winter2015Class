Attribute VB_Name = "mDisk"

' 

' 

'



' 1.10
' module for emulator disk operations.

' require declarations:
Option Explicit

' temporary buffer (inner floppy drive buffer):
Dim sectorBuffer(0 To 511) As Byte

' 1.23
Function virtual_drive_exists(cDriveNumber As Byte) As Boolean

On Error Resume Next ' 4.00-Beta-3

    Dim sFilename As String
    
    sFilename = Add_BackSlash(App.Path) & "FLOPPY_" & cDriveNumber
    
    virtual_drive_exists = FileExists(sFilename)

End Function

'INT 13 - DISK - READ SECTOR(S) INTO MEMORY
'    AH = 02h
'    AL = number of sectors to read (must be nonzero)
'    CH = low eight bits of cylinder number
'    CL = sector number 1-63 (bits 0-5)
'         high two bits of cylinder (bits 6-7, hard disk only)
'    DH = head number
'    DL = drive number (bit 7 set for hard disk)
'    ES:BX -> data buffer
'Return: CF set on error
'        if AH = 11h (corrected ECC error), AL = burst length
'    CF clear if successful
'    AH = status (see #00234)
'    AL = number of sectors transferred (only valid if CF set for some
'          BIOSes)
 Sub read_sectors(cSectors_to_read As Byte, cCyl As Byte, cSector As Byte, cHead As Byte, cDriveNumber As Byte, lBufferAddress As Long)

On Error GoTo err_rs

    Dim gFileNumber As Integer
    Dim sFilename As String
    Dim i As Integer
    Dim startGlobalSector As Integer
    
     
    sFilename = Add_BackSlash(App.Path) & "FLOPPY_" & cDriveNumber
    
    If Not FileExists(sFilename) Then GoTo no_such_drive_number

    
    gFileNumber = FreeFile
          
    Open sFilename For Random Shared As gFileNumber Len = 512
     
    startGlobalSector = getDiskSector(cCyl, cHead, cSector)
     
    For i = 1 To cSectors_to_read
        ' first byte in file has index 1:
        Get gFileNumber, startGlobalSector + i, sectorBuffer
        copyBufferToMemory lBufferAddress
        ' move pointer to next 512 bytes:
        lBufferAddress = lBufferAddress + 512
    Next i
     
    Close gFileNumber

    ' clear CF - successful operation:
    ' 1.17 frmFLAGS.cbCF.ListIndex = 0
    frmEmulation.bCLEAR_CF_ON_IRET = True

    ' set AH to OK:
    frmEmulation.store_BYTE_RegValue 4, 0
    
    ' AL = number of sectors transferred
    frmEmulation.store_BYTE_RegValue 0, CByte(i)

    Exit Sub
    
err_rs:
    Close gFileNumber
    
    ' set error state:
    ' 1.17 frmFLAGS.cbCF.ListIndex = 1
    frmEmulation.bSET_CF_ON_IRET = True
    
    ' AL = number of sectors transferred
    frmEmulation.store_BYTE_RegValue 0, 0  ' maybe not correct!
    
    Debug.Print "Error on read_sectors(): " & LCase(err.Description)
    Exit Sub
    
no_such_drive_number:

    ' set error state:
    ' 1.17 frmFLAGS.cbCF.ListIndex = 1
    frmEmulation.bSET_CF_ON_IRET = True
    
    ' AL = number of sectors transferred
    frmEmulation.store_BYTE_RegValue 0, 0
    
    Debug.Print "Error on read_sectors(): No such drive number!"
End Sub


'INT 13 - DISK - WRITE DISK SECTOR(S)
'    AH = 03h
'    AL = number of sectors to write (must be nonzero)
'    CH = low eight bits of cylinder number
'    CL = sector number 1-63 (bits 0-5)
'         high two bits of cylinder (bits 6-7, hard disk only)
'    DH = head number
'    DL = drive number (bit 7 set for hard disk)
'    ES:BX -> data buffer
'
' this command can be used to create empty floppy files:
'    write_sectors 18, 79, 1, 1, 7, -1, True
'    (make sure FLOPPY_7 has no important info!).
'
 Sub write_sectors(cSectors_to_write As Byte, cCyl As Byte, cSector As Byte, cHead As Byte, cDriveNumber As Byte, lBufferAddress As Long, bCREATE_DRIVE As Boolean)

On Error GoTo err_ws

    Dim gFileNumber As Integer
    Dim sFilename As String
    Dim i As Integer
    Dim startGlobalSector As Integer
    
     
    sFilename = Add_BackSlash(App.Path) & "FLOPPY_" & cDriveNumber
    
    ' 1.12
    If Not bCREATE_DRIVE Then
        If Not FileExists(sFilename) Then GoTo no_such_drive_number
    End If
    
    gFileNumber = FreeFile
          
    Open sFilename For Random Shared As gFileNumber Len = 512
     
    startGlobalSector = getDiskSector(cCyl, cHead, cSector)
     
    For i = 1 To cSectors_to_write
        copyMemoryToBuffer lBufferAddress
        ' move pointer to next 512 bytes:
        lBufferAddress = lBufferAddress + 512
        
        ' first byte in file has index 1:
        Put gFileNumber, startGlobalSector + i, sectorBuffer
    Next i
     
    Close gFileNumber

    ' clear CF - successful operation:
    ' 1.17 frmFLAGS.cbCF.ListIndex = 0
    frmEmulation.bCLEAR_CF_ON_IRET = True

    ' set AH to OK:
    frmEmulation.store_BYTE_RegValue 4, 0
    
    ' AL = number of sectors transferred
    frmEmulation.store_BYTE_RegValue 0, to_unsigned_byte(i - 1)

    Exit Sub
    
err_ws:
    Close gFileNumber
    
    ' set error state:
    ' 1.17 frmFLAGS.cbCF.ListIndex = 1
    frmEmulation.bSET_CF_ON_IRET = True
    
    ' AL = number of sectors transferred
    frmEmulation.store_BYTE_RegValue 0, 0  ' maybe not correct!
    
    Debug.Print "Error on write_sectors(): " & LCase(err.Description)
    Exit Sub
    
no_such_drive_number:

    ' set error state:
    ' 1.17 frmFLAGS.cbCF.ListIndex = 1
    frmEmulation.bSET_CF_ON_IRET = True
    
    ' AL = number of sectors transferred
    frmEmulation.store_BYTE_RegValue 0, 0
    
    Debug.Print "Error on write_sectors(): No such drive number!"
End Sub


Private Sub copyBufferToMemory(lBufferAddress As Long)

On Error Resume Next ' 4.00-Beta-3

    Dim L As Long
    
    For L = 0 To 511
        RAM.mWRITE_BYTE lBufferAddress + L, sectorBuffer(L)
    Next L
End Sub

Private Sub copyMemoryToBuffer(lBufferAddress As Long)

On Error Resume Next ' 4.00-Beta-3

    Dim L As Long
    
    If lBufferAddress >= 0 Then
        For L = 0 To 511
            sectorBuffer(L) = RAM.mREAD_BYTE(lBufferAddress + L)
        Next L
    Else ' 1.12, just zero, used for creating new drives:
        For L = 0 To 511
            sectorBuffer(L) = 0
        Next L
    End If
End Sub

' receives the CYLINDER (0..79), HEAD (0..1), SECTOR (1..18)
' returns global sector number on the floppy (0..2879)
Private Function getDiskSector(cCyl As Byte, cHead As Byte, cSector As Byte) As Integer
On Error Resume Next ' 4.00-Beta-3

    getDiskSector = cCyl * 36 + cHead * 18 + cSector - 1
End Function

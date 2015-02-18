Attribute VB_Name = "io"


' This module can be used to implement
' your own external devices for Emu8086 -
' 8086 Microprocessor Emulator.
' Device can be written in Visual Basic
' (for C/C++/MS Visual C++ use "IO.H" instead).

' Supported input / output addresses:
'                  0 to 65535 (0 - 0FFFFh)

' Version 2.12 of Emu8086 or above is required,
' check this URL for the latest version:
' http://www.emu8086.com

' You don't need to understand the code of this
' module, just add this file ("io.bas") into your
' project, and use these functions:
'
'    READ_IO_BYTE(lPORT_NUM As Long) As Byte
'    READ_IO_WORD(lPORT_NUM As Long) As Integer
'
' and subs:
'
'    WRITE_IO_BYTE(lPORT_NUM As Long, uValue As Byte)
'    WRITE_IO_WORD(lPORT_NUM As Long, iValue As Integer)
'
' Where:
'  lPORT_NUM - is a number in range: from 15 to 65535.
'  uValue    - unsigned byte value to be written to a port.
'  iValue    - signed word value to be written to a port.





Option Explicit

'Public Declare Function GetTempPath Lib "kernel32" Alias "GetTempPathA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
'Dim sTemp As String * 500
Dim lTSize As Long

' 2.12#611  - ***NOT*** USED WITH  #1079b fix
'Const sIO_FILE = "EmuPort.io"

Global s_IO_FILE_NAME As String ' 3.27xp


Function READ_IO_BYTE(lPORT_NUM As Long) As Byte
On Error GoTo err_rib


Dim tb As Byte
Dim fNum As Integer
Dim sFilename As String

sFilename = s_IO_FILE_NAME

'If s_IO_FILE_NAME = "" Then  ' backward compatibility
'    lTSize = GetTempPath(499, sTemp)
'    sFilename = Mid(sTemp, 1, lTSize)
'    sFilename = AddTrailingSlash(sFilename) & sIO_FILE
'End If
'



fNum = FreeFile

Open sFilename For Random Shared As fNum Len = 1

' File's first byte has Index 1 in VB
' compatibility for Port 0:
Get fNum, lPORT_NUM + 1, tb

Close fNum


READ_IO_BYTE = tb


Exit Function
err_rib:
Debug.Print "READ_IO_BYTE: " & LCase(Err.Description)
Close fNum

End Function

Sub WRITE_IO_BYTE(lPORT_NUM As Long, uValue As Byte)
On Error GoTo err_wib

Dim sFilename As String
Dim fNum As Integer

sFilename = s_IO_FILE_NAME

'If sFilename = "" Then  ' backward compatibility
'    lTSize = GetTempPath(499, sTemp)
'    sFilename = Mid(sTemp, 1, lTSize)
'    sFilename = AddTrailingSlash(sFilename) & sIO_FILE
'End If

fNum = FreeFile


Open sFilename For Random Shared As fNum Len = 1

' File's first byte has Index 1 in VB
' compatibility for Port 0:
Put fNum, lPORT_NUM + 1, uValue

Close fNum


Exit Sub
err_wib:
Debug.Print "WRITE_IO_BYTE: " & LCase(Err.Description)
Close fNum
End Sub


Function READ_IO_WORD(lPORT_NUM As Long) As Integer

On Error Resume Next ' 4.00-Beta-3

Dim tb1 As Byte
Dim tb2 As Byte

    ' Read lower byte:
    tb1 = READ_IO_BYTE(lPORT_NUM)
    ' Write higher byte:
    tb2 = READ_IO_BYTE(lPORT_NUM + 1)

    READ_IO_WORD = make16bit_SIGNED_WORD(tb1, tb2)
End Function


Sub WRITE_IO_WORD(lPORT_NUM As Long, iValue As Integer)

On Error Resume Next ' 4.00-Beta-3

Dim tb1 As Byte
Dim tb2 As Byte

   ' Write lower byte:
   WRITE_IO_BYTE lPORT_NUM, iValue And 255 ' 00FF
   ' Write higher byte:
   WRITE_IO_BYTE lPORT_NUM + 1, (iValue And 65280) / 256 ' FF00 >> 8
End Sub

' This function corrects the file path by adding "\"
' in the end if required:
Function AddTrailingSlash(sPath As String) As String
  
 On Error Resume Next ' 4.00-Beta-3
  
    If (sPath <> "") Then
        If (Mid(sPath, Len(sPath), 1) <> "\") Then
          AddTrailingSlash = sPath & "\"
          Exit Function
        End If
    End If
  
    AddTrailingSlash = sPath
  
End Function

Function make16bit_SIGNED_WORD(ByRef byteL As Byte, ByRef byteH As Byte) As Integer

On Error Resume Next ' 4.00-Beta-3

    Dim temp As Long
    
    ' lower byte - on lower address!
    ' byte1 - lower byte!
    
    temp = byteH
    temp = temp * 256 ' shift left by 8 bit.
    temp = temp + byteL
    
    
    make16bit_SIGNED_WORD = make_signed_int(temp)
End Function

' Makes a Long to be a SIGNED Integer:
 Function make_signed_int(L As Long) As Integer
 
 On Error Resume Next ' 4.00-Beta-3
 
    If L >= -32768 And L < 65536 Then
        If L <= 32767 Then
            make_signed_int = L
        Else
            make_signed_int = L - 65536
        End If
    Else
        make_signed_int = 0
        Debug.Print "wrong param calling make_signed_int(): " & L
    End If
End Function

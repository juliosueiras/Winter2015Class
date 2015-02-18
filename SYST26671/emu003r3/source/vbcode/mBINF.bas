Attribute VB_Name = "mBINF"

' 

' 

'





' 1.25
' some the code that works with "*.binf"
' files isn't easy to move in this module,
' so it is left where it is.

Option Explicit

Global bDIRECTED_TO_WRITE_BINF_FILE As Boolean '#1168 ' #1086

''''''''''''''''''''''''''''''''''''''''''''''''''
Dim sLOAD_SEGMENT As String
Dim sLOAD_OFFSET As String
Dim sAL As String
Dim sAH As String
Dim sBL As String
Dim sBH As String
Dim sCL As String
Dim sCH As String
Dim sDL As String
Dim sDH As String
Dim sDS As String
Dim sES As String
Dim sSI As String
Dim sDI As String
Dim sBP As String
Dim sCS As String
Dim sIP As String
Dim sSS As String
Dim sSP As String
Dim sMEMSET As String ' #327u-ret=hlt#  -- unique this one will be loaded using get_property("*.binf") = NOTE: in .binf file it's just MEM not MEMSET :)

''''''''''''''''''''''''''''''''''''''''''''''''''

' #1170b instead of making .boot files (that are not 8.3 compatible) we just
'         create a .bin file with correct .binf file.
Public Sub set_DEFAULT_FOR_BOOT()
 sLOAD_SEGMENT = "00000"
 sLOAD_OFFSET = "7C00"
 ' all other registers unknown yet...
 sAL = "00"
 sAH = "00"
 sBL = "00"
 sBH = "00"
 sCL = "00"
 sCH = "00"
 sDL = "00"
 sDH = "00"
 sDS = "0000"
 sES = "0000"
 sSI = "0000"
 sDI = "0000"
 sBP = "0000"
 sCS = "0000"
 sIP = "7C00" '#1185
 sSS = "0000"
 sSP = "0000"
 sMEMSET = ""
End Sub



Sub reset_BINF()

On Error Resume Next ' 4.00b15

    bDIRECTED_TO_WRITE_BINF_FILE = False '#1168 ' #1086
    
    sLOAD_SEGMENT = "" ' 1.30#433 (set later to CS if required)' "0100"  ' 1.30
    sLOAD_OFFSET = "" ' 1.30#433 (set later to IP if required)' "0000"   ' 1.30
    sAL = ""
    sAH = ""
    sBL = ""
    sBH = ""
    sCL = ""
    sCH = ""
    sDL = ""
    sDH = ""
    sDS = ""
    sES = ""
    sSI = ""
    sDI = ""
    sBP = ""
    sCS = "" '1.31#446 "0100"   ' 1.30
    sIP = "" '1.31#446 "0000"   ' 1.30
    sSS = ""
    sSP = ""
    sMEMSET = ""
    
End Sub

Sub write_BINF_file(sFilename As String)

    On Error GoTo err_wbf

    '#1178 - always delete .binf files before creating .bin files!
    '         and delete them even if we currently do not create .binf file,
    '        because previous .binf file can make really undesired problems!
    ' delete the old file (if exists):
    If FileExists(sFilename) Then
        DELETE_FILE sFilename
    End If






    If Not bDIRECTED_TO_WRITE_BINF_FILE Then Exit Sub '#1086 '#1168 "c:\emu8086\default.binf" will be used!
    
    
    
    
    
    
    ' 1.31#446
    ' in case both are not defined:
    If (sLOAD_SEGMENT = "") And (sCS = "") Then sCS = "0100"
    If (sLOAD_OFFSET = "") And (sIP = "") Then sIP = "0000"
    
    
    '=============================================================
    ' in case LOADING SEGMENT / OFFSET not set use values of IP/CS
    ' registers (and other way):
    If sLOAD_SEGMENT = "" Then sLOAD_SEGMENT = sCS
    If sLOAD_OFFSET = "" Then sLOAD_OFFSET = sIP

    If sCS = "" Then sCS = sLOAD_SEGMENT
    If sIP = "" Then sIP = sLOAD_OFFSET
    '=============================================================
    
    
    
    '=============================================================
    ' 1.30#422b
    ' by default set DS/SS/ES to CS
    If sDS = "" Then sDS = sCS
    If sSS = "" Then sSS = sCS
    If sES = "" Then sES = sCS
    '=============================================================



    Dim sTemp As String
    
    Dim fNum As Integer



    '--------------------------------
    fNum = FreeFile
    Open sFilename For Binary Shared As fNum

        sTemp = sLOAD_SEGMENT & " ; load to segment." & vbNewLine & _
                 sLOAD_OFFSET & " ; load to offset." & vbNewLine & _
                 sAL & " ;   AL" & vbNewLine & _
                 sAH & " ;   AH" & vbNewLine & _
                 sBL & " ;   BL" & vbNewLine & _
                 sBH & " ;   BH" & vbNewLine & _
                 sCL & " ;   CL" & vbNewLine & _
                 sCH & " ;   CH" & vbNewLine & _
                 sDL & " ;   DL" & vbNewLine & _
                 sDH & " ;   DH" & vbNewLine & _
                 sDS & " ;   DS" & vbNewLine & _
                 sES & " ;   ES" & vbNewLine & _
                 sSI & " ;   SI" & vbNewLine & _
                 sDI & " ;   DI" & vbNewLine & _
                 sBP & " ;   BP" & vbNewLine & _
                 sCS & " ;   CS" & vbNewLine & _
                 sIP & " ;   IP" & vbNewLine & _
                 sSS & " ;   SS" & vbNewLine & _
                 sSP & " ;   SP" & vbNewLine & vbNewLine & _
                 "MEM=" & sMEMSET & vbNewLine

    Put #fNum, , sTemp
    
    ' Close:
    Close fNum
    '--------------------------------

    ' Debug.Print "binf created: " & sFileName

    Exit Sub
err_wbf:

    Debug.Print "write_BINF_file_if_directed: " & LCase(err.Description)
End Sub


Sub PROCESS_BINF_DIRECTIVE(sInput As String, lCurLine As Long)

On Error GoTo err_pbd

    Dim s As String
    Dim lT As Long
    Dim sName As String
    Dim sVal As String
    
    

    
    
    s = Mid(sInput, 2)   ' cut off "#"


    lT = InStr(1, s, "=")
    
    If lT <= 0 Then
        ' 4.00b15-fasm ' frmInfo.addErr lCurLine, " '=' not found in directive: " & s, s
        Debug.Print " '=' not found in directive: " & s
        Exit Sub
    End If

   
    sName = UCase(Trim(Mid(s, 1, lT - 1)))
    sVal = UCase(Trim(Mid(s, lT + 1)))
    
    If endsWith(sVal, "#") Then
        sVal = Mid(sVal, 1, Len(sVal) - 1)
    End If
    
    '#1077c
    If endsWith(sVal, "h") Then
        sVal = Mid(sVal, 1, Len(sVal) - 1)
    End If
    If startsWith(sVal, "0x") Then
        sVal = Mid(sVal, 3)
    End If
    
    
    
    Select Case sName
    
    Case "LOAD_SEGMENT"
        sLOAD_SEGMENT = sVal
        
    Case "LOAD_OFFSET"
        sLOAD_OFFSET = sVal
        
    Case "AL"
        sAL = sVal
        
    Case "AH"
        sAH = sVal
        
    Case "AX"
        sVal = make_min_len(sVal, 4, "0")
        sAL = get_W_LowBits_STR(sVal)
        sAH = get_W_HighBits_STR(sVal)
        
    Case "BL"
        sBL = sVal
        
    Case "BH"
        sBH = sVal
        
    Case "BX"
        sVal = make_min_len(sVal, 4, "0")
        sBL = get_W_LowBits_STR(sVal)
        sBH = get_W_HighBits_STR(sVal)
        
    Case "CL"
        sCL = sVal
        
    Case "CH"
        sCH = sVal
        
    Case "CX"
        sVal = make_min_len(sVal, 4, "0")
        sCL = get_W_LowBits_STR(sVal)
        sCH = get_W_HighBits_STR(sVal)
        
    Case "DL"
        sDL = sVal
        
    Case "DH"
        sDH = sVal
        
    Case "DX"
        sVal = make_min_len(sVal, 4, "0")
        sDL = get_W_LowBits_STR(sVal)
        sDH = get_W_HighBits_STR(sVal)
        
    Case "DS"
        sDS = sVal
        
    Case "ES"
        sES = sVal
        
    Case "SI"
        sSI = sVal
        
    Case "DI"
        sDI = sVal
        
    Case "BP"
        sBP = sVal
        
    Case "CS"
        sCS = sVal
        
    Case "IP"
        sIP = sVal
        
    Case "SS"
        sSS = sVal
        
    Case "SP"
        sSP = sVal
    
    Case "START" ' #327-newdir#
        ' just ignore, it is used by emulator when it searches real source code.
        
    
    Case "MEM"
        sMEMSET = sVal
            
    Case Else
    
        ' 4.00b15-fasm ' frmInfo.addErr lCurLine, cMT("wrong assembler directive:") & " " & sName, sName
        Debug.Print "wrong assembler directive:" & " " & sName, sName
        Exit Sub
    
    End Select


' #1086b
'    If frmMain.Combo_output_type.ListIndex <> 2 Then
'        frmInfo.addErr lCurLine, "#MAKE_BIN# directive must be on top or do not use #..# directives!"
'        Exit Sub
'    End If


        bDIRECTED_TO_WRITE_BINF_FILE = True '#1168 '#1086
    
    
    Exit Sub
err_pbd:
    ' 4.00b15-fasm ' frmInfo.addErr lCurLine, "PROCESS_BINF_DIRECTIVE: " & sInput & ": " & LCase(err.Description), sInput
    Debug.Print "PROCESS_BINF_DIRECTIVE: " & sInput & ": " & err.Description
End Sub

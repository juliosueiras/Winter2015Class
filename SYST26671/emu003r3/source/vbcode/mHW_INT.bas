Attribute VB_Name = "mHW_INT"

' #327u-hw-int#
' mHW_INT.bas

Option Explicit

Global sHarwareInterrupts_FILEPATH As String

' return of this function isn't used yet, but can be in the future...
' returns true only if hardware interrupt is set (CS:IP).
Function check_for_harware_interrupt() As Boolean
On Error GoTo err1

    Dim byteArray(0 To 255) As Byte
    Dim iFileNum As Integer
    Dim i As Integer
    
    If FileExists(sHarwareInterrupts_FILEPATH) Then
    
        iFileNum = FreeFile
        
        ' read 256 bytes from emu8086.hw
        Open sHarwareInterrupts_FILEPATH For Binary Access Read Write Shared As iFileNum
        Get #iFileNum, 1, byteArray
        Close iFileNum
        
        For i = 0 To 255
            ' If i < 5 Then Debug.Print "byteArray(" & i & ") " & byteArray(i)
            If byteArray(i) <> 0 Then
                
                ' reset that byte in emu8086.hw
                byteArray(i) = 0
                Open sHarwareInterrupts_FILEPATH For Binary Access Read Write Shared As iFileNum
                Put #iFileNum, 1, byteArray
                Close iFileNum
                
                If do_hardware_interrupt(to_unsigned_byte(i)) Then
                    frmEmulation.lblHW_INTERRUPT.Caption = " hardware interrupt: " & make_min_len(Hex(i), 2, 0) & " "
                    frmEmulation.lblHW_INTERRUPT.Visible = True
                    check_for_harware_interrupt = True
                    Exit Function ' EXIT
                End If
            End If
        Next i

    End If

    ' gets here if emu8086.hw not found
    ' or if nothing triggered...

    frmEmulation.lblHW_INTERRUPT.Visible = False
    check_for_harware_interrupt = False



Exit Function
err1:
    Debug.Print "error check_for_harware_interrupt: " & Err.Description
    check_for_harware_interrupt = False
    frmEmulation.lblHW_INTERRUPT.Visible = False
End Function

' just push flags, cs, ip.
' and set cs:ip to interrupt function that is written in interrupt vector table.
' the subsequent PROCESS_SINGLE_STEP will do everything else...
Private Function do_hardware_interrupt(byteIntNuber As Byte) As Boolean
On Error GoTo err1


    Debug.Print "hw " & Hex(byteIntNuber) & "  trigirred!"

    
    Dim returnIP As Integer
    Dim returnCS As Integer
    Dim wRegValue As Integer

   '========== copied with changes from "ElseIf (tbFIRST = &HCD) Then" of doStep() =============
   ' (plus optimization of software int -- signed/unsigned byte convertion).
    
        returnIP = frmEmulation.get_IP ' unlike for software INT, here we return exactly to from where we interrupted the program.
        returnCS = frmEmulation.get_CS
        
        ' get flags register & push it:
        wRegValue = frmFLAGS.getFLAGS_REGISTER16
        frmEmulation.stackPUSH_PUBLIC wRegValue
        
        ' store CS in STACK:
        frmEmulation.stackPUSH_PUBLIC returnCS
        
        ' store return IP it in STACK:
        frmEmulation.stackPUSH_PUBLIC returnIP

        ' IRET will POP flags, so it will stay
        ' this way only while executing interupt:
        frmFLAGS.cbIF.ListIndex = 0


        ' read ivt and transfer control to interrupt handler
        frmEmulation.set_IP RAM.mREAD_WORD(byteIntNuber * 4)
        frmEmulation.set_CS RAM.mREAD_WORD(CLng(byteIntNuber * 4) + 2)

    
   ' =======================================================================
    


    do_hardware_interrupt = True
Exit Function
err1:
    Debug.Print "do_hardware_interrupt: " & Err.Description
    do_hardware_interrupt = False
End Function

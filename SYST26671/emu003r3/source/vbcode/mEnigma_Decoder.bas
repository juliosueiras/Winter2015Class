Attribute VB_Name = "mEnigma_Decoder"
Option Explicit

' this is decoder only!
' use password hgttg and project D:\yur7\emu8086\emu8086v327src\enigma_pro
' to encode more!
Public Const sDefaultWHEEL1 As String = "ABCDEFGHIJKLMNOPQRSTVUWXYZ_1234567890qwertyuiopasd!@#$%^&*(),. ~`-=\?/'""fghjklzxcvbnm"
Public Const sDefaultWHEEL2 As String = "IWE$%^&*(),.vbnmc ~`-=\?/'tyuVOPFG_123RYUA7iopH456BNMQJKTLZ890qwerSDXCfghjklzx""!@#asd"


' Decrypts the string.
' you may note that the only difference is
' the sWHEEL1 and sWHEEL2 exchange, instead of
' looking for character in sWHEEL1 we look it
' in sWHEEL2:
Function Decrypt_PRO(sINPUT As String, sPASSWORD As String) As String


    Dim sWHEEL1 As String
    Dim sWHEEL2 As String

    sWHEEL1 = sDefaultWHEEL1
    sWHEEL2 = sDefaultWHEEL2

    ' We use password to "de"-scramble the wheels:
    ScrambleWheels sWHEEL1, sWHEEL2, sPASSWORD

    Dim k As Long ' keeps index of the character on the wheel.
    
    Dim i As Long ' for current character index of source string.
    Dim c As String ' to keep single character.
    
    Dim sResult As String ' the result.
    sResult = ""
    
    For i = 1 To Len(sINPUT)
    
            ' Get character(i)
            c = Mid(sINPUT, i, 1)
    
            ' Find character(i) on the second wheel:
            k = InStr(1, sWHEEL2, c, vbBinaryCompare)
            
            If k > 0 Then
                ' Get the character with that index from the first
                ' wheel, and add it to result:
                sResult = sResult & Mid(sWHEEL1, k, 1)
            Else
                ' not found on the wheel, leave as it is:
                sResult = sResult & c
            End If
    
            ' Rotate first wheel to the left:
            sWHEEL1 = LeftShift(sWHEEL1)
            
            ' Rotate second wheel to the right:
            sWHEEL2 = RightShift(sWHEEL2)
    
    Next i
    
    Decrypt_PRO = sResult
    
End Function

' Rotates the wheel (string).
' the first character goes to the end, all
' other characters go one step to the left side.
' For example:
'     "ABCD"
' will be
'     "BCDA"
' after rotation.
Private Function LeftShift(s As String) As String
    ' tricky way :)
    If Len(s) > 0 Then LeftShift = Mid(s, 2, Len(s) - 1) & Mid(s, 1, 1)
End Function


' Rotates the wheel (string).
' the last character goes to the beginning, all
' other characters go one step to the right side.
' For example:
'     "ABCD"
' will be
'     "DABC"
' after rotation.
Private Function RightShift(s As String) As String
    ' tricky way :)
    If Len(s) > 0 Then RightShift = Mid(s, Len(s), 1) & Mid(s, 1, Len(s) - 1)
End Function


' This sub scrambles the wheels.
' Wheels should be set to the same position
' for both encryption and decryption !
' (and this can be achieved by using the same password :)
' Bigger password = better scramble!
Private Sub ScrambleWheels(ByRef sW1 As String, ByRef sW2 As String, sPASSWORD As String)

Dim i As Long
Dim k As Long

For i = 1 To Len(sPASSWORD)
    
    For k = 1 To Asc(Mid(sPASSWORD, i, 1)) * i
        sW1 = LeftShift(sW1)
        sW2 = RightShift(sW2)
    Next k

Next i

' Who said there are no pointers in VB?

End Sub


'
'
'Function check_possible_pirate(sName As String, sRegKey As String, iLic As Integer) As Boolean
'
'On Error GoTo err1
'
'
'    If bFOR_REGNOW Then
'        check_possible_pirate = False
'        Exit Function
'    End If
'
'
'    ' most importantly :)
'    ' enigma pro   <--- it's the user name
'    ' for the key : GHA3-5123-51JH-4123-4112
'    If InStr(1, sName, Decrypt_PRO("@3#?F""&jrX", "hgttg"), vbTextCompare) > 0 Or InStr(1, sName, Decrypt_PRO("#Eux,tkt", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'
'    ' rsky  com
'    ' rsky com
'    If InStr(1, sName, Decrypt_PRO("#Eux,(/h/", "hgttg"), vbTextCompare) > 0 Or InStr(1, sName, Decrypt_PRO("#Eux,tkt", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'    ' ggressio
'    If InStr(2, sName, Decrypt_PRO("Vyxk#!jh", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'    ' eam devoti
'    If InStr(2, sName, Decrypt_PRO("@W2vaf'hSD", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'    ' rials.w
'    If InStr(2, sName, Decrypt_PRO("#sdy#*D", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'    ' este.ne
'    If InStr(2, sName, Decrypt_PRO("@E""k)VX", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'    ' .bg-wa
'    If InStr(2, sName, Decrypt_PRO(" 2'mg""", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'    ' shwarez.c
'    If InStr(3, sName, Decrypt_PRO("%ulajf\$-", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'    ' P SBRRRR
'    If InStr(1, sRegKey, Decrypt_PRO("TcK2B5Ho", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'
'    ' gen / TS
'    If InStr(4, sName, Decrypt_PRO("V""1v (5p", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'    ' AM CAT 20
'    If InStr(2, sName, Decrypt_PRO("ANn3GB&K0", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'
'    ' 27SWRFX
'    If startsWith(sRegKey, Decrypt_PRO("ChKLB2M", "hgttg")) Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'    ' N,gl
'    If InStr(4, sName, Decrypt_PRO("Jn'y", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'
'
'
'    ' just some funny messages :)
'
'
'    ' "for more information please refer to the hitchhiker's guide to the galaxy"
'
'    If InStr(3, sName, Decrypt_PRO("ytal,OkDeIr %9Q,T565d0ihFR3t4?-Ncm1vnV&3I=Pd!P?=k`re*X@%LT84Xp4qYfGJw1wP0\6", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'    ' "enigma encryption module taken from emu8086.com/vb/"
'    If InStr(4, sName, Decrypt_PRO("y""1!=Oz%e=c880JKJ^DEH5UhFQO_0\eA6m~KP&6&@@zhnP!Pn/?((", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'
'    ' we hope you like the software :)
'    If InStr(5, sName, Decrypt_PRO("!""n/""xX%DXe#)8%Bg5!7w47D_V2y/p:R", "hgttg"), vbTextCompare) > 0 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'
'
'    If iLic > 577 Then
'            check_possible_pirate = True
'            Exit Function
'    End If
'
'
'
'    Exit Function
'err1:
'    check_possible_pirate = False
'    Debug.Print "check_possible_pirate: " & err.Description
'End Function

Attribute VB_Name = "mMath"

' 

' 

'



' 1.20

Option Explicit

' This function should completely replace the use of
' ALU.fAdd_WORDS() in calculation of EA.
' Adds two words drops overflow (anything that goes over the word).
' Works just like "ADD AX, BX" or ALU.fAdd_WORDS().
' NO LONGER ----- Returns the unsigned value (Long type is used).
' returns the signed WORD!!!!!!!
Function mathAdd_WORDS(ByRef i1 As Integer, ByRef i2 As Integer) As Integer

On Error Resume Next ' 4.00-Beta-3

    Dim lT1 As Long
    Dim lT2 As Long
    Dim xt As Long
    
    lT1 = to_unsigned_long(i1)
    lT2 = to_unsigned_long(i2)
    
    lT1 = lT1 + lT2
    
    ' leave word part:
    lT1 = lT1 And 65535 ' not works with hex, convets to -"1": &HFFFF
    
    mathAdd_WORDS = to_signed_int(lT1)
End Function


Function mathSub_WORDS(ByRef i1 As Integer, ByRef i2 As Integer) As Integer

On Error Resume Next ' 4.00-Beta-3

    Dim lT1 As Long
    Dim lT2 As Long
    Dim xt As Long
    
    lT1 = to_unsigned_long(i1)
    lT2 = to_unsigned_long(i2)
    
    lT1 = lT1 - lT2
    
    ' leave word part:
    lT1 = lT1 And 65535 ' not works with hex, convets to -"1": &HFFFF
    
    mathSub_WORDS = to_signed_int(lT1)
End Function


''''' I wrote this sub to make sure I made
''''' the right emulation of ():
''''' though, I think it will take a few hours to check...
''''Public Sub check_fAdd_WORDS_and_zAdd_WORDS_1()
''''Dim i1 As Integer
''''Dim i2 As Integer
''''
''''For i1 = -32768 To 32767 - 1
''''    For i2 = -32768 To 32767 - 1
''''        If ALU.fAdd_WORDS(i1, i2, False) <> zAdd_WORDS(i1, i2) Then Stop
''''    Next i2
''''Next i1
''''
''''End Sub
''''

#If 0 Then

' I wrote this sub to make sure I made
' the right emulation of ():
' it's much faster then previous check function:
Sub check_fAdd_WORDS_and_mathAdd_WORDS()
Dim i As Integer
Dim i1 As Integer
Dim i2 As Integer
Dim r1 As Integer
Dim r2 As Integer

Const upperbound = 32767
Const lowerbound = -32768

Randomize

ALU.DoShowMe
DoEvents

For i = 0 To 2000

    i1 = Int((upperbound - lowerbound + 1) * Rnd + lowerbound)
    i2 = Int((upperbound - lowerbound + 1) * Rnd + lowerbound)

    r1 = to_signed_int(ALU.fAdd_WORDS(i1, i2, False))
    r2 = mathAdd_WORDS(i1, i2)
    
    If r1 <> r2 Then Stop

    'Debug.Print i1, i2
Next i

End Sub

Sub check_SUB_WORDS_and_mathSub_WORDS()

On Error Resume Next ' 4.00-Beta-3

Dim i As Integer
Dim i1 As Integer
Dim i2 As Integer
Dim r1 As Integer
Dim r2 As Integer

Const upperbound = 32767
Const lowerbound = -32768

Randomize

ALU.DoShowMe
DoEvents

For i = 0 To 2000

    i1 = Int((upperbound - lowerbound + 1) * Rnd + lowerbound)
    i2 = Int((upperbound - lowerbound + 1) * Rnd + lowerbound)

    ALU.sub_WORDS i1, i2, False
    r1 = ALU.GET_C_SIGNED
    
    r2 = mathSub_WORDS(i1, i2)
    
    If r1 <> r2 Then Stop

    'Debug.Print i1, i2
Next i

End Sub

#End If

' makes positive multiplication!
' if result gets over WORD only low part is returned (that fits into WORD):
Function math_Multiply_BYTES(uNum As Byte, uMultiplyBy As Byte) As Integer

On Error Resume Next ' 4.00-Beta-3

    Dim it1 As Integer
    Dim iT2 As Integer
    Dim i As Byte
    
    it1 = 0

    iT2 = CInt(uNum)
    
    For i = 1 To uMultiplyBy
        it1 = mathAdd_WORDS(it1, iT2)
    Next i
    
    math_Multiply_BYTES = it1

End Function


Function math_get_low_byte_of_word(ByRef iWORD As Integer) As Byte

On Error GoTo err1

' result cannot be over 255:

math_get_low_byte_of_word = iWORD And 255 ' FF

Exit Function
err1:
    Debug.Print "math_get_low_byte_of_word: " & err.Description
    math_get_low_byte_of_word = 0
End Function




Function math_get_high_byte_of_word(ByRef iWORD As Integer) As Byte

On Error GoTo err1

Dim iResult As Integer

iResult = iWORD And -256  ' FF00

' shift right by 8 bits:
iResult = iResult / 256

' result should be 0..255:
math_get_high_byte_of_word = to_unsigned_byte(iResult)

    Exit Function
err1:
    Debug.Print "math_get_high_byte_of_word: " & err.Description
    math_get_high_byte_of_word = 0
End Function







Function math_get_low_word_of_doubleword(ByRef lDoubleWORD As Long) As Integer

On Error GoTo err1

' result cannot be over 65535:

math_get_low_word_of_doubleword = to_signed_int(lDoubleWORD And 65535)   ' FFFF

Exit Function
err1:
    Debug.Print "math_get_low_word_of_doubleword: " & err.Description
    math_get_low_word_of_doubleword = 0
End Function




Function math_get_high_word_of_doubleword(ByRef lDoubleWORD As Long) As Integer

On Error GoTo err1

Dim lResult As Long

lResult = lDoubleWORD And &HFFFF0000

' shift right by 16 bits:
lResult = lResult / 65536

' result should be 0..65535:
math_get_high_word_of_doubleword = to_signed_int(lResult)

    Exit Function
err1:
    Debug.Print "math_get_high_word_of_doubleword: " & err.Description
    math_get_high_word_of_doubleword = 0
End Function







' made for #1035
Public Function generateRandom(lowerbound As Integer, upperbound As Integer) As Integer
On Error GoTo err1
    generateRandom = Int((upperbound - lowerbound + 1) * Rnd + lowerbound)
    Exit Function
err1:
    Debug.Print "generateRandom(" & lowerbound & ", " & upperbound & "): " & LCase(err.Description)
    generateRandom = 0
End Function

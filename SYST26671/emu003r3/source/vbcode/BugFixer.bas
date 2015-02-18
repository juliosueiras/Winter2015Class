Attribute VB_Name = "BugFixerMod"

' 

' 

'



' BUG FIX MODULE :)

' CREATED ON 2004-10-30

Option Explicit


' should return TRUE if Mod operation successful,
' and FALSE if it's not... plus, it returns FALSE
' if remainder is greater than 65535:
Function checkMod_INT(c As Currency, i As Integer) As Boolean

On Error GoTo err_chk

''''' it works, but I think it shold be more like in actual MOD calculation:
''''' If c Mod CCur(l) > 65535 Then
If to_signed_int(Fix(c) Mod CCur(to_unsigned_long(i))) > 65535 Then  ' this should do.
    checkMod_INT = False
Else
    checkMod_INT = True
End If

Exit Function

err_chk:

Debug.Print "checkMod_INT: "; c & " mod " & i & " -- legal overflow."

checkMod_INT = False

End Function


Attribute VB_Name = "mRecentFiles"

'

'

'



' recent files for editor:
'   sRegSection = "RecentEditor"
' and emulator:
'   sRegSection = "RecentEmulator"

Option Explicit

'Global Const sRECENT_EDITOR = "RecentEditor"
'Global Const sRECENT_EMULATOR = "RecentEmulator"
'
'' #327xp-recent#
'Global bSAVE_NO_RECENT As Boolean
'Global Const DEFAULT_RECENT_FILES As Integer = 14
'Global Const MAX_RECENT_FILES As Integer = 20  ' menuArray () must be set accordingly!
''Global RECENT_FILES As Integer  ' should be less or equal to: MAX_RECENT_FILES


'' original source taken from Magic Button 3.1 and modified !
'
'Sub Recent_Add_New(ByRef sFilename As String, menuArray As Object, sRegSection As String)
'Dim strFiles(1 To MAX_RECENT_FILES) As String
'Dim i As Integer
'Dim k As Integer
'
'On Error GoTo err1
'
'            If bSAVE_NO_RECENT Then Exit Sub ' 3.27xp
'
'            ' #327xp-recent#
'            If RECENT_FILES <= 0 Or RECENT_FILES > MAX_RECENT_FILES Then
'                RECENT_FILES = DEFAULT_RECENT_FILES
'            End If
'
'
'' Reading:
'            For i = 1 To RECENT_FILES
'                strFiles(i) = GetSetting(sTitleA, sRegSection, "File" & i, "-1")
'            Next i
'
'' Checking:
'            For i = 1 To RECENT_FILES
'                If StrComp(sFilename, strFiles(i), vbTextCompare) = 0 Then
'                    'Exit Sub  ' It's already on the list.
'                     'Saving it on the first place:
'                     SaveSetting sTitleA, sRegSection, "File1", sFilename
'                     For k = 1 To i - 1  ' this want do anything if it's already on the first place.
'                        SaveSetting sTitleA, sRegSection, "File" & (k + 1), strFiles(k)
'                     Next k
'                     GoTo l_skip1
'                End If
'            Next i
'
'' Moving down:
'           For i = 1 To RECENT_FILES - 1
'               SaveSetting sTitleA, sRegSection, "File" & (i + 1), strFiles(i)
'           Next i
'' Writing the New One:
'            SaveSetting sTitleA, sRegSection, "File1", sFilename
'
'l_skip1:
'' Updating:
'            Recent_Set_Menus menuArray, sRegSection
'Exit Sub
'err1:
'Debug.Print "Recent_Add_New(" & sFilename & "): " & Err.Description
'End Sub
'
'Sub Recent_Set_Menus(menuArray As Object, sRegSection As String)
'Dim strFiles(1 To MAX_RECENT_FILES) As String
'Dim i As Integer
'
'On Error GoTo err1
'
'
'            ' #327xp-recent#
'            If RECENT_FILES <= 0 Or RECENT_FILES > MAX_RECENT_FILES Then
'                RECENT_FILES = DEFAULT_RECENT_FILES
'            End If
'
'' Reading:
'            For i = 1 To RECENT_FILES
'                strFiles(i) = GetSetting(sTitleA, sRegSection, "File" & i, "-1")
'                If strFiles(i) <> "-1" Then
'                        menuArray(i).Caption = makeSmallerPath(strFiles(i), 40)
'                        menuArray(i).Visible = True
'                        menuArray(i).Tag = strFiles(i) ' keep full path! 020616
'                End If
'            Next i
'
'Exit Sub
'err1:
'Debug.Print "Recent_Set_Menus: " & Err.Description
'End Sub


Public Function makeSmallerPath(ByRef s As String, iMax_to_make_17_25 As Integer) As String
Dim sPart1 As String
Dim sPart2 As String

On Error GoTo err1

    If Len(s) < iMax_to_make_17_25 Then
        makeSmallerPath = s
        Exit Function
    End If
        
    sPart1 = Mid(s, 1, 17)
    sPart2 = Mid(s, Len(s) - 25)
    
    makeSmallerPath = sPart1 & "...." & sPart2
        
    Exit Function
err1:
    makeSmallerPath = s
    Debug.Print "makeSmallerPath: " & Err.Description
End Function

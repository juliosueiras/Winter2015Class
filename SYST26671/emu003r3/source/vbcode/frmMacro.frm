VERSION 5.00
Begin VB.Form frmMacro 
   Caption         =   "frmMacro"
   ClientHeight    =   4950
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7485
   LinkTopic       =   "Form1"
   ScaleHeight     =   4950
   ScaleWidth      =   7485
   StartUpPosition =   2  'CenterScreen
   Begin VB.ListBox lstVal 
      Height          =   1425
      Left            =   4365
      TabIndex        =   11
      Top             =   3420
      Width           =   690
   End
   Begin VB.ListBox lstCurrent 
      Height          =   1425
      Left            =   5220
      TabIndex        =   8
      Top             =   3435
      Width           =   2190
   End
   Begin VB.ListBox lstParameters 
      Height          =   1425
      Left            =   3180
      TabIndex        =   6
      Top             =   3405
      Width           =   1080
   End
   Begin VB.ListBox lstMacro_Locations 
      Height          =   2400
      Left            =   5490
      TabIndex        =   2
      Top             =   390
      Width           =   1500
   End
   Begin VB.ListBox lstMacro_Names 
      Height          =   2400
      Left            =   3465
      TabIndex        =   1
      Top             =   375
      Width           =   1920
   End
   Begin VB.ListBox lstMacros 
      Height          =   4740
      Left            =   75
      TabIndex        =   0
      Top             =   120
      Width           =   3015
   End
   Begin VB.Label Label6 
      Caption         =   "p.values:"
      Height          =   180
      Left            =   4305
      TabIndex        =   10
      Top             =   3195
      Width           =   930
   End
   Begin VB.Label Label5 
      Caption         =   "current macro:"
      Height          =   285
      Left            =   5370
      TabIndex        =   9
      Top             =   3180
      Width           =   1935
   End
   Begin VB.Label Label4 
      Caption         =   "parameters:"
      Height          =   180
      Left            =   3165
      TabIndex        =   7
      Top             =   3180
      Width           =   930
   End
   Begin VB.Label Label3 
      Caption         =   "Temp:"
      Height          =   225
      Left            =   4065
      TabIndex        =   5
      Top             =   2865
      Width           =   2160
   End
   Begin VB.Label Label2 
      Caption         =   "locations:"
      Height          =   240
      Left            =   5520
      TabIndex        =   4
      Top             =   135
      Width           =   1470
   End
   Begin VB.Label Label1 
      Caption         =   "names:"
      Height          =   240
      Left            =   3600
      TabIndex        =   3
      Top             =   135
      Width           =   1560
   End
End
Attribute VB_Name = "frmMacro"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' 

' 

'



Option Explicit
Dim lLOCAL_REP As Long ' used in replacing local definitions.

Public Sub resetMacro()
On Error Resume Next ' 4.00-Beta-3
    lLOCAL_REP = 0
    frmMacro.lstMacros.Clear
    frmMacro.lstMacro_Names.Clear
    frmMacro.lstMacro_Locations.Clear
End Sub

' returns line number in lstMaros if the sNAME is
' a MACRO name, otherwize returns '-1'
Public Function get_MACRO_index(ByVal sName As String) As Integer

On Error Resume Next ' 4.00-Beta-3

    ' 1.22 bugfix#186
    sName = get_everything_after_label_seg_prefix(sName)
    If Len(sName) = 0 Then GoTo no_such_macro

    

    Dim i As Integer

    ' 1.23 optimization, no need to do it in the loop!
    Dim sTEMP1 As String
    sTEMP1 = UCase(getNewToken(sName, 0, " "))

    For i = 0 To lstMacro_Names.ListCount - 1

        If sTEMP1 = lstMacro_Names.List(i) Then
             get_MACRO_index = lstMacro_Locations.List(i)
             Exit Function
        End If

    Next i

no_such_macro:
    get_MACRO_index = -1

End Function
    
Public Sub prepare_MACRO_CODE()
     
On Error Resume Next ' 4.00-Beta-3

     
    ' replace parameters with values from the code:
    replace_PARAMS_WITH_VALUES
    
    ' process LOCAL (if any):
    replace_LOCALS
    
End Sub

' 1.20 bugfix#152
' process LOCAL (if any):
Private Sub replace_LOCALS()

On Error Resume Next ' 4.00-Beta-3

    Dim sNAMES As String
    Dim sLocName As String
    Dim i As Integer
    Dim g As Long
    Dim mLine As String
    Dim m As Long
    Dim s1 As String
    Dim s2 As String
    Dim ki As Integer  ' 1.20
    
    For ki = 0 To lstCurrent.ListCount - 1
        
        If startsWith(lstCurrent.List(ki), "LOCAL ") Then
        
            lLOCAL_REP = lLOCAL_REP + 1
                    
            ' get first line (LOCAL definitions):
            sNAMES = Mid(lstCurrent.List(ki), Len("LOCAL ") + 1)
            
            ' remove line with "LOCAL" definitions from list:
            lstCurrent.RemoveItem ki
            ki = ki - 1 ' 1.20 make sure that will check the next item on next for loop.
            
            sNAMES = Trim(sNAMES)
            
            g = 0 ' 1.20 !! reset token number.
            
            Do While frmMain.bCOMPILING    ' 1.20 True
                
                sLocName = getToken(sNAMES, g, " ,")
                
                If (sLocName = Chr(10)) Then Exit Do
                
                For i = 0 To lstCurrent.ListCount - 1
                    mLine = lstCurrent.List(i)
                    
                    m = SingleWord_NotInsideQuotes_InStr(mLine, sLocName)
                    
                    If m > 0 Then
                        s1 = Mid(mLine, 1, m - 1)
                        s2 = Mid(mLine, m + Len(sLocName))
                        lstCurrent.List(i) = s1 & sLocName & "_loc" & lLOCAL_REP & "tmp" & s2 ' "xxx" & s2
                    End If
                Next i
                
                g = g + 1

            Loop

        End If ' [If startsWith(lstCurrent.List(i), "LOCAL ")]
        
    Next ki
    
End Sub
    
' replaces MACRO parameters with values (from source code)
Private Sub replace_PARAMS_WITH_VALUES()

On Error Resume Next ' 4.00-Beta-3

    Dim m As Long
    Dim i As Integer
    Dim j As Integer
    Dim mLine As String
    Dim mParName As String
    Dim s1 As String
    Dim s2 As String
    
    For i = 0 To lstCurrent.ListCount - 1
    
        mLine = lstCurrent.List(i)
    
        For j = 0 To lstParameters.ListCount - 1
        
            mParName = lstParameters.List(j)
            m = SingleWord_NotInsideQuotes_InStr(mLine, mParName)
            
            If m > 0 Then
                s1 = Mid(mLine, 1, m - 1)
                s2 = Mid(mLine, m + Len(mParName))
                lstCurrent.List(i) = s1 & lstVal.List(j) & s2
            End If
            
        Next j
        
    Next i
    
End Sub

' 1.28#359
' in case name is duplicated (used already),
' this sub sets an error:
Public Sub Add_MACRO_Name(sName As String, lCurLine As Long)

On Error Resume Next ' 4.00-Beta-3

    Dim i As Integer
    
    For i = 0 To lstMacro_Names.ListCount - 1
        If StrComp(sName, lstMacro_Names.List(i), vbTextCompare) = 0 Then
            frmInfo.addErr lCurLine, cMT("MACRO name already in use!"), sName
            'frmInfo.showErrorBuffer
            Exit For
        End If
    Next i
    
    lstMacro_Names.AddItem sName
End Sub

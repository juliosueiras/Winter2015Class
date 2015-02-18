VERSION 5.00
Begin VB.Form frmSymbolTableViewer 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "symbol table"
   ClientHeight    =   5385
   ClientLeft      =   60
   ClientTop       =   300
   ClientWidth     =   6330
   Icon            =   "frmSymbolTableViewer.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5385
   ScaleWidth      =   6330
   ShowInTaskbar   =   0   'False
   Begin VB.ListBox lstTable 
      Columns         =   5
      Height          =   4155
      Left            =   60
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   120
      Width           =   3990
   End
End
Attribute VB_Name = "frmSymbolTableViewer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' 3.27xm
' #327xm-listing-and-stable-viewer#.

' TODO  #todo-st-view#

Option Explicit

Public Sub DoShowMe_with_SYMBOL_TABLE(sFilename As String)

On Error Resume Next

    If FileExists(sFilename) Then

        Me.Show
        
        If Me.WindowState = vbMinimized Then
            Me.WindowState = vbNormal
        End If
        
        load_SymbolTable sFilename
    Else
    
        Debug.Print "not found: " & sFilename
        
    End If
    
End Sub

Private Sub load_SymbolTable(sFilename As String)

On Error GoTo err1

    Dim s As String
    Dim iFN As Integer
    
    iFN = FreeFile
    
    lstTable.Clear
    
    s = ""
    
    Open sFilename For Input Shared As iFN
    
    Do While Not EOF(iFN)
        Line Input #iFN, s
        lstTable.AddItem s
    Loop
    
    Close #iFN

    s = ""

    Exit Sub
err1:
    Debug.Print "frmSymbolTableViewer.load_listing: " & err.Description
End Sub


' #400b4-mini-8#   fixed in advance :)
Private Sub Form_Activate()
On Error Resume Next
    If SHOULD_DO_MINI_FIX_8 Then
        If StrComp(lstTable.Font.Name, "Terminal", vbTextCompare) = 0 Then
            If lstTable.Font.Size < 12 Then
                lstTable.Font.Size = 12
            End If
        End If
    End If
End Sub


Private Sub Form_Load()
    On Error GoTo err1
    
    '#todo-st-view# If Load_from_Lang_File(Me) Then Exit Sub ' currently there's not much to translate, caption maybe...
    
   

    GetWindowPos Me
    GetWindowSize Me

    lstTable.Font.Charset = frmEmulation.picMemList.Font.Charset
    lstTable.Font.Name = frmEmulation.picMemList.Font.Name
    lstTable.Font.Size = frmEmulation.picMemList.Font.Size
    lstTable.Font.Weight = frmEmulation.picMemList.Font.Weight

    Exit Sub
    
err1:
    Debug.Print "frmSymbolTableViwer: " & err.Description
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
On Error Resume Next ' 4.00-Beta-3
    SaveWindowState Me
End Sub

Private Sub Form_Resize()

    On Error Resume Next
    
    lstTable.Top = 0
    lstTable.Left = 0
    lstTable.Width = Me.ScaleWidth
    lstTable.Height = Me.ScaleHeight
        
End Sub

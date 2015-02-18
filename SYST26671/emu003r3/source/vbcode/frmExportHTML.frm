VERSION 5.00
Begin VB.Form frmExportHTML 
   Caption         =   "export to HTML"
   ClientHeight    =   3435
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7515
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmExportHTML.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   3435
   ScaleWidth      =   7515
   Begin VB.ListBox lstIndex 
      Height          =   1425
      Left            =   5415
      TabIndex        =   20
      Top             =   1635
      Visible         =   0   'False
      Width           =   1890
   End
   Begin VB.FileListBox FileList 
      Height          =   1260
      Left            =   5310
      TabIndex        =   18
      Top             =   285
      Visible         =   0   'False
      Width           =   1875
   End
   Begin VB.CheckBox chkFilenameOnTop 
      Caption         =   "file name on top."
      Height          =   300
      Left            =   5235
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   120
      Value           =   1  'Checked
      Width           =   2085
   End
   Begin VB.CheckBox chkDefaultFontSize 
      Caption         =   "browser default"
      Height          =   255
      Left            =   2205
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   2025
      Width           =   1845
   End
   Begin VB.CheckBox chkAddExportedByNote 
      Caption         =   "asm2html hyperlink."
      Height          =   300
      Left            =   2580
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   120
      Value           =   1  'Checked
      Width           =   2175
   End
   Begin VB.TextBox txtDescription 
      Height          =   330
      Left            =   1290
      TabIndex        =   2
      Top             =   1005
      Width           =   6075
   End
   Begin VB.TextBox txtTitle 
      Height          =   330
      Left            =   1290
      TabIndex        =   1
      Top             =   510
      Width           =   6075
   End
   Begin VB.TextBox txtFontSize 
      Height          =   330
      Left            =   1275
      TabIndex        =   4
      Top             =   1965
      Width           =   735
   End
   Begin VB.TextBox txtFontName 
      Height          =   330
      Left            =   1275
      TabIndex        =   3
      Top             =   1515
      Width           =   3570
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "close"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   5010
      TabIndex        =   7
      Top             =   2910
      Width           =   1935
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "open..."
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   2775
      TabIndex        =   6
      Top             =   2910
      Width           =   1935
   End
   Begin VB.TextBox txtMargin 
      Height          =   330
      Left            =   1290
      TabIndex        =   0
      Top             =   105
      Width           =   690
   End
   Begin VB.CommandButton cmdExport 
      Caption         =   "export..."
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   450
      Left            =   570
      TabIndex        =   5
      Top             =   2910
      Width           =   1935
   End
   Begin VB.Label lblBatchProgress 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "000 from 000"
      BeginProperty Font 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   285
      Left            =   5190
      TabIndex        =   19
      Top             =   1950
      Visible         =   0   'False
      Width           =   2205
   End
   Begin VB.Label lblFileSaved 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00FF0000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " html file is saved "
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   345
      TabIndex        =   16
      Top             =   2535
      Visible         =   0   'False
      Width           =   1830
   End
   Begin VB.Label lblNote 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   " note: you may need to click refresh to see the changes "
      ForeColor       =   &H80000008&
      Height          =   270
      Left            =   2280
      TabIndex        =   15
      Top             =   2535
      Visible         =   0   'False
      Width           =   4905
   End
   Begin VB.Label lblDescription 
      AutoSize        =   -1  'True
      Caption         =   "description:"
      Height          =   195
      Left            =   135
      TabIndex        =   12
      Top             =   1095
      Width           =   1005
   End
   Begin VB.Label lblTitle 
      AutoSize        =   -1  'True
      Caption         =   "title:"
      Height          =   195
      Left            =   135
      TabIndex        =   11
      Top             =   600
      Width           =   390
   End
   Begin VB.Label lblFontsize 
      AutoSize        =   -1  'True
      Caption         =   "font size:"
      Height          =   195
      Left            =   120
      TabIndex        =   10
      Top             =   2055
      Width           =   795
   End
   Begin VB.Label lblFontname 
      AutoSize        =   -1  'True
      Caption         =   "font name:"
      Height          =   195
      Left            =   120
      TabIndex        =   9
      Top             =   1605
      Width           =   945
   End
   Begin VB.Label lblMargin 
      AutoSize        =   -1  'True
      Caption         =   "margin:"
      Height          =   195
      Left            =   135
      TabIndex        =   8
      Top             =   195
      Width           =   675
   End
   Begin VB.Menu mnuPopUp 
      Caption         =   "mnuPopUp"
      Visible         =   0   'False
      Begin VB.Menu mnuExplore 
         Caption         =   "explore..."
      End
      Begin VB.Menu mnuOpen 
         Caption         =   "in browser"
      End
      Begin VB.Menu mnuOpenInNotepad 
         Caption         =   "in notepad"
      End
   End
   Begin VB.Menu mnuAdvanced 
      Caption         =   "advanced"
      Visible         =   0   'False
      Begin VB.Menu mnuDelimeter00001 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExportSingleFile 
         Caption         =   "export source code..."
      End
      Begin VB.Menu mnuDelimeter00004 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExportAll 
         Caption         =   "export all files with index.html..."
      End
      Begin VB.Menu mnuDelimeter00000 
         Caption         =   "-"
      End
   End
End
Attribute VB_Name = "frmExportHTML"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' #327xl-export-html#


Option Explicit

Dim sExportedTo As String
' Dim sBGCOLOR As String ' 20140414 ' we'll use default browser colours.
' Dim sTXTCOLOR As String ' same

Public Sub DoShowMe()
On Error GoTo err1

    Me.Show
    If Me.WindowState = vbMinimized Then
        Me.WindowState = vbNormal
    End If
    
    
    txtMargin.Text = "110"
    txtTitle.Text = cMT("source code") & ": " & ExtractFileName(frmMain.sOpenedFile)
    txtDescription.Text = cMT("source code")
    txtFontName.Text = frmMain.txtInput.Font.Name
    txtFontSize.Text = to_HTML_FONT_SIZE(frmMain.txtInput.Font.Size)
    

'    sBGCOLOR = GetRevRGB(frmMain.txtInput.GetColor(cmClrWindow), vbWhite)
'    sTXTCOLOR = GetRevRGB(frmMain.txtInput.GetColor(cmClrText))
'
    
    sExportedTo = ""
    
    
    Exit Sub
err1:
    Debug.Print "frmExportHTML_DOSHOWME: " & Err.Description
        
        
End Sub


Private Sub chkDefaultFontSize_Click()

On Error Resume Next ' 4.00-Beta-3

    txtFontSize.Enabled = IIf(chkDefaultFontSize.Value = vbChecked, False, True)
    If txtFontSize.Enabled Then
        txtFontSize.BackColor = txtDescription.BackColor
    Else
        txtFontSize.BackColor = chkDefaultFontSize.BackColor
    End If
    
End Sub

Private Sub Form_Activate()
On Error Resume Next
    If frmMain.is_source_modified Then
        lblFileSaved.Visible = False
        lblNote.Visible = False
        cmdBrowse.Enabled = False
    End If
End Sub

Private Sub Form_Load()
  If Load_from_Lang_File(Me) Then Exit Sub
    
On Error GoTo err1

    GetWindowPos Me
    
    
    
    ' #400b3-viwer#
    If StrComp(ASCII_VIEWER, "notepad", vbTextCompare) <> 0 Then
        mnuOpenInNotepad.Caption = Replace(mnuOpenInNotepad.Caption, "notepad", ExtractFileName(ASCII_VIEWER), 1, 1, vbTextCompare)
    End If
    
    
    
    Exit Sub
err1:
    Debug.Print "frmExportHTML_LOAD: " & Err.Description
End Sub





Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

On Error Resume Next ' 4.00-Beta-3

    bSAVE_CANCELED = True

    SaveWindowState Me
    
    
End Sub




Private Sub cmdBrowse_Click()
On Error Resume Next ' 4.00-Beta-3
    PopupMenu mnuPopUp
End Sub

Private Sub cmdClose_Click()
On Error Resume Next
    Me.Hide
End Sub

Private Sub cmdExport_Click()
On Error Resume Next
    PopupMenu mnuAdvanced
End Sub





' #327xl-export-html#
' saves frmMain.txtInput to given file
Private Function save_assembly_source_code_to_HTML(sFilename As String) As Boolean
On Error GoTo err1



    
    
    
    Dim iFileNum As Integer
    Dim s As String
    
    
    iFileNum = FreeFile
    Open sFilename For Output Shared As iFileNum


    s = "<html>"
    Print #iFileNum, s
    s = "<head>"
    Print #iFileNum, s
    s = "       <title>" & legHTML(txtTitle.Text) & "</title>"
    Print #iFileNum, s
    s = "       <meta name=""description"" content=""" & legHTML(txtDescription.Text) & """>"
    Print #iFileNum, s
'    s = "       <style>"
'    Print #iFileNum, s
'    s = "           a:link {text-decoration: none}"
'    Print #iFileNum, s
'    s = "           a:visited {text-decoration: none}"
'    Print #iFileNum, s
'    s = "           a:hover {text-decoration: none; color:#ff0000}"
'    Print #iFileNum, s
'    s = "       </style>"
'    Print #iFileNum, s
    s = "<meta name=""generator"" content=""emu8086"">"
    Print #iFileNum, s
    s = "</head>"
    Print #iFileNum, s
    
    's = "<body leftmargin=" & legHTML(Trim(txtMargin.Text)) & "  rightmargin=" & legHTML(Trim(txtMargin.Text)) & " topmargin=20 bgcolor=" & sBGCOLOR & " text=" & sTXTCOLOR & " link=blue vlink=blue alink=blue>"
    s = "<body leftmargin=" & legHTML(Trim(txtMargin.Text)) & "  rightmargin=" & legHTML(Trim(txtMargin.Text)) & " topmargin=20>"
    Print #iFileNum, s
    
    s = " "
    Print #iFileNum, s
    
    s = " "
    Print #iFileNum, s
    
    s = "<!-- * -->"
    Print #iFileNum, s
    
    s = " "
    Print #iFileNum, s
    
    s = " "
    Print #iFileNum, s
    
    
    If chkFilenameOnTop.Value = vbChecked Then
        If frmMain.sOpenedFile <> "" Then
            's = vbNewLine & vbNewLine & vbNewLine & vbNewLine & "&nbsp; &nbsp;<center> <font color=" & sBGCOLOR & "> ;</font> <font size=" & txtFontSize.Text & " face=""" & txtFontName.Text & """> " & ExtractFileName(frmMain.sOpenedFile) & " </font></center>" & vbNewLine & vbNewLine
            s = vbNewLine & vbNewLine & vbNewLine & vbNewLine & "&nbsp; &nbsp;<center>  ; <font size=" & txtFontSize.Text & " face=""" & txtFontName.Text & """> " & ExtractFileName(frmMain.sOpenedFile) & " </font></center>" & vbNewLine & vbNewLine
            Print #iFileNum, s
        End If
    End If
    
    s = vbNewLine & vbNewLine & vbNewLine & vbNewLine & "<!-- START AUTOMATIC ASM TO HTML EXPORT -->"
    Print #iFileNum, s
    
    
    If txtFontSize.Enabled Then
        s = "<pre><font size=" & txtFontSize.Text & " face=""" & txtFontName.Text & """>"
    Else
        s = "<pre><font face=""" & txtFontName.Text & """>"
    End If
    Print #iFileNum, s
    
    
    
    
    
    
    cmdExport.Visible = False
    cmdBrowse.Visible = False
    cmdClose.Visible = False
    
    
    
    
'
'    Dim i As Long
'    For i = 0 To frmMain.txtInput.lineCount - 1
'        s = frmMain.txtInput.getLine(i)
'
'        s = Replace(s, ">", vbLf)
'        s = Replace(s, "<", vbCr)
'        s = Replace(s, "&", vbVerticalTab)
'
'        s = make_HTML_COLORED(s)
'
'        s = Replace(s, vbLf, "&gt;")
'        s = Replace(s, vbCr, "&lt;")
'        s = Replace(s, vbVerticalTab, "&amp;")
'        Print #iFileNum, s
'    Next i
'
   ' 20140414
     s = frmMain.txtInput.Text
     s = Replace(s, vbLf, "&gt;")
     s = Replace(s, vbCr, "&lt;")
     s = Replace(s, vbVerticalTab, "&amp;")
     s = make_HTML_COLORED(s)
     Print #iFileNum, s
    
    
    
    
    
    cmdExport.Visible = True
    cmdBrowse.Visible = True
    cmdClose.Visible = True
    
    
    
    


    s = "</font></pre>"
    Print #iFileNum, s


    ' only if we are making index.html
    If lblBatchProgress.Visible Then
        's = "<br>  <br> <center> <font color=" & sBGCOLOR & ">;</font>  <font face=""verdana"" size=3><a href=""index.html""><u>- index -</u></a></font> </center> <br>  <br><br>  "
        s = "<br>  <br> <center> ; <font face=""verdana"" size=3><a href=""index.html""><u>- index -</u></a></font> </center> <br>  <br><br>  "
        Print #iFileNum, s
    End If
    
    
    


    If chkAddExportedByNote.Value = vbChecked Then
        's = "<center> <font color=" & sBGCOLOR & ">;</font> <a href=""http://www.emu8086.com"" target=""_blank""><font face=verdana size=1 color=" & sTXTCOLOR & "> - asm2html - </font></a> </center>"
        s = "<center> ; <a href=""http://www.emu8086.com"" target=""_blank""><font face=verdana size=1> - html export by emu8086 - </font></a> </center>"
        Print #iFileNum, s
    End If

    s = "<!-- emu8086 version " & App.Major & "." & App.Minor & App.Revision & sVER_SFX & "    -->"
    Print #iFileNum, s
    
    s = "<!-- STOP AUTOMATIC ASM TO HTML EXPORT -->" & vbNewLine & vbNewLine & vbNewLine & vbNewLine
    Print #iFileNum, s

    s = " "
    Print #iFileNum, s
    
    s = " "
    Print #iFileNum, s
    




    s = "<!-- *** -->"
    Print #iFileNum, s


    s = " "
    Print #iFileNum, s
    
    s = " "
    Print #iFileNum, s
    
    

    s = "</body>"
    Print #iFileNum, s

    s = "</html>"
    Print #iFileNum, s

    Close iFileNum


save_assembly_source_code_to_HTML = True



Exit Function
err1:
    Debug.Print "save_assembly_source_code_to_HTML: " & Err.Description
    save_assembly_source_code_to_HTML = False
End Function



Function to_HTML_FONT_SIZE(iSize As Integer) As String
    If iSize <= 8 Then
        to_HTML_FONT_SIZE = "1"
    ElseIf iSize < 13 Then
        to_HTML_FONT_SIZE = "2"
    ElseIf iSize < 18 Then
        to_HTML_FONT_SIZE = "3"
    Else
        to_HTML_FONT_SIZE = "4"
    End If
End Function


Private Sub mnuExplore_Click()
On Error Resume Next
    If sExportedTo <> "" Then
        Call ShellExecute(Me.hwnd, "explore", ExtractFilePath(sExportedTo), "", ExtractFilePath(sExportedTo), SW_SHOWDEFAULT)
    End If
End Sub



Private Sub mnuExportSingleFile_Click()

On Error GoTo err1

            Dim ts As String
            Dim sFilename As String

'            If frmMain.sOpenedFile <> "" Then
'                ts = ExtractFilePath(frmMain.sOpenedFile)
'                If myChDir(ts) Then
'                    ComDlg.FileInitialDirD = ts
'                End If
'                ComDlg.FileNameD = ts & ExtractFileName(frmMain.sOpenedFile) & ".html"
'            Else
'                ts = Add_BackSlash(App.Path) & "MySource"
'                myMKDIR ts
'                If myChDir(ts) Then
'                    ComDlg.FileInitialDirD = ts
'                End If
'                ComDlg.FileNameD = "mycode.html"
'            End If
'
'            ComDlg.hwndOwner = Me.hwnd
'            ComDlg.Flags = OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT + OFN_PATHMUSTEXIST
'            ComDlg.Filter = "HTML files (*.html;*.htm)|*.html;*.htm|All Files (*.*)|*.*"
'            ComDlg.DefaultExtD = "html"
'            sFilename = ComDlg.ShowSave
'            If sFilename = "" Then
'                Exit Sub ' canceled.
'            End If
            
            
            ' 201404014
            sFilename = Add_BackSlash(App.Path) & ExtractFileName(frmMain.sOpenedFile) & ".export.html"
    
    
            save_assembly_source_code_to_HTML sFilename
            
            sExportedTo = sFilename
            cmdBrowse.Enabled = True
            lblFileSaved.Visible = True
            lblNote.Visible = True
            
        Exit Sub
        
        
err1:
        Debug.Print "frmExportHTML.mnuExportSingleFile_Click: " & Err.Description
End Sub

Private Sub mnuOpen_Click()
On Error Resume Next
    If sExportedTo <> "" Then
        Call ShellExecute(Me.hwnd, "open", "explorer", sExportedTo, ExtractFilePath(sExportedTo), SW_SHOWDEFAULT)
    End If
End Sub

Private Sub mnuOpenInNotepad_Click()
On Error Resume Next
    If sExportedTo <> "" Then
        Call ShellExecute(Me.hwnd, "open", ASCII_VIEWER, sExportedTo, ExtractFilePath(sExportedTo), SW_SHOWDEFAULT)
    End If
End Sub



Private Sub txtDescription_GotFocus()
On Error Resume Next
    With txtDescription
        .SelStart = 0
        DoEvents
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtFontName_GotFocus()
On Error Resume Next
    With txtFontName
        .SelStart = 0
        DoEvents
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtFontSize_GotFocus()
On Error Resume Next
    With txtFontSize
        .SelStart = 0
        DoEvents
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtMargin_GotFocus()
On Error Resume Next
    With txtMargin
        .SelStart = 0
        DoEvents
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtTitle_GotFocus()
On Error Resume Next
    With txtTitle
        .SelStart = 0
        DoEvents
        .SelLength = Len(.Text)
    End With
End Sub


Function make_HTML_COLORED(sInput As String) As String
On Error GoTo err1

Dim s As String
Dim L As Long

Dim t1 As String
Dim tTOKEN As String

s = sInput

s = s & " " ' imp2!    --- pushf !   strings must terminate by a delimiter.

t1 = ""
tTOKEN = ""

Dim G1 As Long

Dim sRET As String
sRET = ""

Dim sCURCOLOR As String
sCURCOLOR = sTXTCOLOR


Dim sSTRING_START As String
sSTRING_START = "" ' can be ' or "


Dim lLen As Long
lLen = Len(s)

For L = 1 To lLen
    t1 = Mid(s, L, 1)
    
    If sSTRING_START <> "" Then
        If sSTRING_START = t1 Then ' STRING termination!
            sCURCOLOR = GetRevRGB(frmMain.txtInput.GetColor(cmClrString))
            sRET = sRET & "<font color=" & sCURCOLOR & ">" & tTOKEN & t1 & "</font>"
            sSTRING_START = ""
            t1 = ""
            tTOKEN = ""
            GoTo next_please
        Else
            GoTo read_non_stop
        End If
    End If
    
    Dim sDELIMS_PLUS As String
    'sDELIMS_PLUS = DELIMETERS_ALL & vbLf & vbCr & vbVerticalTab ' 10/13/11 added because < and > and & are illigal for HTML.
    sDELIMS_PLUS = DELIMETERS_ALL ' 20140414
    
    
    G1 = InStr(1, sDELIMS_PLUS, t1)
    If G1 > 0 Or L = lLen Or t1 = ";" Then  ' COMMENT IS NOT ONE OF THE DELIMETERS!
process_token:
        sCURCOLOR = getcolor_for_token(tTOKEN)
        If sCURCOLOR = sTXTCOLOR Then
            sRET = sRET & tTOKEN
        Else
            sRET = sRET & "<font color=" & sCURCOLOR & ">" & tTOKEN & "</font>"
        End If
        If t1 <> "" Then  ' delimeters are also kind of tokens...
            If t1 = ";" Then ' comment!
                Dim sAllTheRest As String
                sAllTheRest = Mid(s, L)
                sRET = sRET & "<font color=" & GetRevRGB(frmMain.txtInput.GetColor(cmClrComment)) & ">" & sAllTheRest & "</font>"
                GoTo ready
            End If
            tTOKEN = t1
            If t1 = "'" Or t1 = """" Then ' STRING start!
               sSTRING_START = t1
               t1 = ""
               GoTo read_non_stop
            Else
               t1 = ""
               GoTo process_token
            End If
        End If
        tTOKEN = ""
    Else
read_non_stop:
        tTOKEN = tTOKEN & t1
    End If

next_please:

Next L


t1 = "" ' imp!
If tTOKEN <> "" Then GoTo process_token


ready:
make_HTML_COLORED = sRET


Exit Function
err1:
    Debug.Print "make_HTML_COLORED: " & Err.Description
    make_HTML_COLORED = sInput ' no change.
End Function




Function getcolor_for_token(sTok As String) As String
On Error GoTo err1

    Dim s As String
    
    If Trim(sTok) = "" Then
        getcolor_for_token = sTXTCOLOR
        Exit Function
    End If
    
    
    
    If Len(sTok) = 1 Then ' delimeter / operator
        Const sOperators As String = "+-*/[]~%^&|<>" & vbLf & vbCr & vbVerticalTab ' 10/13/11 added because < and > and & are illigal for HTML.
        If InStr(1, sOperators, sTok, vbTextCompare) > 0 Then
            getcolor_for_token = GetRevRGB(frmMain.txtInput.GetColor(cmClrOperator))
        Else
            getcolor_for_token = sTXTCOLOR ' default
        End If
        Exit Function
    End If
    
    
    
    s = "%" & sTok & "%"
    
    ' #400b20-color-FPU#
    Const sKeywords As String = _
    "%AAA%AAD%AAM%AAS%ADC%ADD%AND%CALL%CBW%CLC%CLD%CLI" & _
    "%CMC%CMP%CMPSB%CMPSW%CWD%DAA%DAS%DEC%DIV%HLT%IDIV" & _
    "%IMUL%IN%INC%INT%INTO%IRET%JA%JAE%JB%JBE%JC%JCXZ" & _
    "%JE%JG%JGE%JL%JLE%JMP%JNA%JNAE%JNB%JNBE%JNC%JNE%JNG" & _
    "%JNGE%JNL%JNLE%JNO%JNP%JNS%JNZ%JO%JP%JPE%JPO%JS%JZ" & _
    "%LAHF%LDS%LEA%LES%LODSB%LODSW%LOOP%LOOPE%LOOPNE" & _
    "%LOOPNZ%LOOPZ%MOV%MOVSB%MOVSW%MUL%NEG%NOP%NOT%OR%OUT%POP%POPA%POPF%PUSH%PUSHA" & _
    "%PUSHF%RCL%RCR%REP%REPE%REPNE%REPNZ%REPZ%RETF%RET" & _
    "%ROL%ROR%SAHF%SAL%SAR%SBB%SCASB%SCASW%SHL%SHR%STC%STD%STI" & _
    "%STOSB%STOSW%SUB%TEST%XCHG%XLAT%XLATB%XOR" & _
    "%F2XM1%F4X4%FABS%FADD%FADDP%FBANK%FBLD%FBSTP%FCHS%FCLEX%FCOM%FCOMP%FCOMPP%FCOS%FDECSTP%FDISI%FDIV%FDIVP%FDIVR%FDIVRP%FENI%FFREE%FIADD%FICOM%FICOMP%FIDIV%FIDIVR%FILD%FIMUL%FINCSTP%FINIT%FIST%FISTP%FISUB%FISUBR%FLD%FLD1%FLDCW%FLDENV%FLDL2E%FLDL2T%FLDLG2%FLDLN2%FLDPI%FLDZ%FMUL%FMULP%FNCLEX%FNDISI%FNENI%FNINIT%FNOP%FNSAVE%FNSTCW%FNSTENV%FNSTSW%FPATAN%FPREM%FPREM1%FPTAN%FRNDINT%FRSTOR%FSAVE%FSCALE%FSETPM%FSIN%FSINCOS%FSQRT%FST%FSTCW%FSTENV%FSTP%FSTSW%FSUB%FSUBP%FSUBR%FSUBRP%FTST%FUCOM%FUCOMP%FUCOMPP%FXAM%FXCH%FXTRACT%FYL2X%FYL2XP1" & _
    "%WAIT%FWAIT" & _
    "%"
        
        
        
        
    Const sScopeKeywords As String = "%PROC%MACRO%SEGMENT%"
        
        
    ' #400b20-32colored#
    Const sTagAttributeNames As String = "%AX%BX%CX%DX%AH%AL%BL%BH%CH%CL%DH%DL%DI%SI%BP%SP%" & _
                                         "%EAX%ECX%EDX%EBX%ESP%EBP%ESI%EDI" & _
                                         "%CR0%CR2%CR3%CR4" & _
                                         "%DR0%DR1%DR2%DR3%DR6%DR7" & _
                                         "%ST0%ST1%ST2%ST3%ST4%ST5%ST6%ST7" & _
                                         "%MM0%MM1%MM2%MM3%MM4%MM5%MM6%MM7" & _
                                         "%XMM0%XMM1%XMM2%XMM3%XMM4%XMM5%XMM6%XMM7%"


    ' #400b20-32colored#
    Const sTagElementNames As String = "%DS%ES%SS%CS%" & "%FS%GS"
    
    Const sTagEntities As String = "%ORG%DB%DW%DD%DT%DQ%EQU%END%BYTE%PTR%WORD%PTR%B.%W.%OFFSET%INCLUDE%"
    
    
    
    If InStr(1, sKeywords, s, vbTextCompare) > 0 Then
        getcolor_for_token = GetRevRGB(frmMain.txtInput.GetColor(cmClrKeyword))
    ElseIf InStr(1, sScopeKeywords, s, vbTextCompare) > 0 Then
        getcolor_for_token = GetRevRGB(frmMain.txtInput.GetColor(cmClrScopeKeyword))
    ElseIf InStr(1, sTagAttributeNames, s, vbTextCompare) > 0 Then
        getcolor_for_token = GetRevRGB(frmMain.txtInput.GetColor(cmClrTagAttributeName))
    ElseIf InStr(1, sTagElementNames, s, vbTextCompare) > 0 Then
        getcolor_for_token = GetRevRGB(frmMain.txtInput.GetColor(cmClrTagElementName))
    ElseIf InStr(1, sTagEntities, s, vbTextCompare) > 0 Then
        getcolor_for_token = GetRevRGB(frmMain.txtInput.GetColor(cmClrTagEntity))
    Else
        getcolor_for_token = sTXTCOLOR ' default
    End If
    

    Exit Function
err1:
    getcolor_for_token = sTXTCOLOR ' default
    Debug.Print "getcolor_for_token: " & Err.Description
End Function




' initially copied from MB, and mutated a bit:
Function GetRevRGB(lColor As Long, Optional lDefaultColor As Long = vbBlack) As String
On Error GoTo err1

 Dim cR As String
 Dim cG As String
 Dim cb As String
 Dim iLen As Integer
 
 Dim sHexColor As String


 If lColor < 0 Then
    sHexColor = Hex(lDefaultColor)
 Else
    sHexColor = Hex(lColor)
 End If



 iLen = Len(sHexColor)

   If iLen <= 1 Then  ' in case of black and errors.
      cR = "00"
      cG = "00"
      cb = "00"
    End If
 
    If iLen = 2 Then
        cR = sHexColor
        cb = "00"
        cG = "00"
    End If
 
    If iLen = 4 Then
        cR = Mid(sHexColor, 3, 2)
        cG = Mid(sHexColor, 1, 2)
        cb = "00"
    End If
    
    If iLen = 6 Then
        cR = Mid(sHexColor, 5, 2)
        cG = Mid(sHexColor, 3, 2)
        cb = Mid(sHexColor, 1, 2)
    End If

    If iLen = 3 Then
        cR = Mid(sHexColor, 2, 2)
        cG = "0" & Mid(sHexColor, 1, 1)
        cb = "00"
    End If
    
    If iLen = 5 Then
        cR = Mid(sHexColor, 4, 2)
        cG = Mid(sHexColor, 2, 2)
        cb = "0" & Mid(sHexColor, 1, 1)
    End If
        
    GetRevRGB = "#" & cR & cG & cb

    Exit Function
err1:
    GetRevRGB = "#000000"
    Debug.Print "GetRevRGB: " & Err.Description
End Function


' #327xp-all-html#
Private Sub mnuExportAll_Click()
On Error GoTo err1

    Dim sPath As String
    Dim sPrevFile As String ' return to where we were...
    Dim sPattern As String
    
    sPrevFile = frmMain.sOpenedFile


    If Trim(sASM2HTML_EXPORT_FROM_PATH) = "" Then
        sASM2HTML_EXPORT_FROM_PATH = Add_BackSlash(App.Path) & "MySource"
    End If

    sPath = InputBox("note:" & vbNewLine & vbNewLine & "     it is recommended to save any unsaved code. " & vbNewLine & vbNewLine & "path to ASM files:", "asm2html", sASM2HTML_EXPORT_FROM_PATH)
    If Trim(sPath) = "" Then GoTo stop_asm_to_html
    sASM2HTML_EXPORT_FROM_PATH = sPath
    
    
    FileList.Path = sPath
    FileList.Refresh
    
    Dim sOutputPath As String
    sOutputPath = Add_BackSlash(App.Path) & "asm2html\" ' I DECIDED TO OUPUT TO EMU808/ASM2HTML !!! ' Add_BackSlash(FileList.Path) & "asm2html\"
    
    
    
    sPattern = InputBox("WARNING: if you click OK any files in: " & makeSmallerPath(sOutputPath, 25) & "  are to be overwritten !" & vbNewLine & vbNewLine & " source files pattern: ", " -- WARNING ! -- ", "*.asm")
    If Trim(sPattern) = "" Then GoTo stop_asm_to_html
    
    
    FileList.Pattern = sPattern
    FileList.Refresh


    If FileList.ListCount <= 0 Then
        MsgBox "no files with this pattern: " & FileList.Pattern & vbNewLine & "in: " & FileList.Path
        GoTo stop_asm_to_html
    End If


    Dim L As Long
    Dim s As String
    Dim sOutputFileName As String

    
    myMKDIR sOutputPath
    
    
    lblBatchProgress.Visible = True
    
    
    ' get ready....
    bSAVE_CANCELED = False
    frmMain.create_NEW_source 4, False
    If bSAVE_CANCELED Then GoTo stop_asm_to_html
    cmdExport.Enabled = False
    cmdClose.Enabled = False
    
    Dim lCounter As Long
    lCounter = 0
    
    lstIndex.Clear
    
    For L = 0 To FileList.ListCount - 1
        s = Add_BackSlash(FileList.Path) & FileList.List(L)
        
        bSAVE_NO_RECENT = True
        frmMain.openSourceFile s, True, False
                       
        sOutputFileName = Replace(ExtractFileName(s), " ", "_") & ".html"
        
  
        If save_assembly_source_code_to_HTML(sOutputPath & sOutputFileName) Then
            add_to_index_list sOutputFileName
            lCounter = lCounter + 1
        End If
        
        lblBatchProgress.Caption = make_min_len(CStr(L + 1), 3, " ") & " from " & make_min_len(CStr(FileList.ListCount), 3, " ")
        DoEvents
        
        If bSAVE_CANCELED Then GoTo stop_asm_to_html
        
    Next L





 
    If Trim(sPrevFile) = "" Then
            frmMain.create_NEW_source 4, False
    Else
            frmMain.openSourceFile sPrevFile, True, False
    End If




    
    If save_index(sOutputPath & "index.html") Then

        If MsgBox("     " & CStr(lCounter) & " files and index.html are saved to:      " & vbNewLine & "      " & sOutputPath & vbNewLine & vbNewLine & "     click OK to explore.", vbOKCancel, "asm2html") = vbOK Then
              Call ShellExecute(Me.hwnd, "explore", sOutputPath, "", sOutputPath, SW_SHOWDEFAULT)
        End If
        
    Else
    
        MsgBox "cannot save index.html"
    
    End If




stop_asm_to_html:


    bSAVE_NO_RECENT = False
    lblBatchProgress.Visible = False
    cmdExport.Enabled = True
    cmdClose.Enabled = True
    
    
    

    Exit Sub
err1:
    bSAVE_NO_RECENT = False
    cmdExport.Enabled = True
    cmdClose.Enabled = True
    Debug.Print "mnuExportAll_Click: " & Err.Description
    MsgBox LCase(Err.Description)
End Sub


' #327xp-all-html#
Sub add_to_index_list(s As String)
On Error Resume Next
    lstIndex.AddItem s
End Sub

' #327xp-all-html#
Function save_index(sFilename As String) As Boolean
On Error GoTo err1




    
    
    
    Dim iFileNum As Integer
    Dim s As String
    
    
    iFileNum = FreeFile
    Open sFilename For Output As iFileNum


    s = "<html>"
    Print #iFileNum, s
    s = "<head>"
    Print #iFileNum, s
    s = "       <title>" & legHTML(txtTitle.Text) & "</title>"
    Print #iFileNum, s
    s = "       <meta name=""description"" content=""" & legHTML(txtDescription.Text) & """>"
    Print #iFileNum, s
    s = "       <style>"
    Print #iFileNum, s
    s = "           a:link {text-decoration: none}"
    Print #iFileNum, s
    s = "           a:visited {text-decoration: none}"
    Print #iFileNum, s
    s = "           a:hover {text-decoration: none; color:#ff0000}"
    Print #iFileNum, s
    s = "       </style>"
    Print #iFileNum, s
    s = "</head>"
    Print #iFileNum, s
    
    s = "<body leftmargin=" & legHTML(Trim(txtMargin.Text)) & "  rightmargin=" & legHTML(Trim(txtMargin.Text)) & " topmargin=20 bgcolor=" & sBGCOLOR & " text=" & sTXTCOLOR & " link=blue vlink=blue alink=blue>"
    Print #iFileNum, s
    
    s = " "
    Print #iFileNum, s
    
    s = " "
    Print #iFileNum, s
    
    s = "<!-- * -->"
    Print #iFileNum, s
    
    s = "<center> "
    Print #iFileNum, s
    
    s = " "
    Print #iFileNum, s
    
    

    s = vbNewLine & vbNewLine & vbNewLine & _
    vbNewLine & "&nbsp; &nbsp; <font color=" & sBGCOLOR & "> ;</font> <h3><font face=""verdana""> " & legHTML(txtDescription.Text) & " </font></h2>" & vbNewLine & vbNewLine
    Print #iFileNum, s

    
    s = vbNewLine & vbNewLine & vbNewLine & vbNewLine & "<!-- START AUTOMATIC INDEX GENERATION -->"
    Print #iFileNum, s
    
    
    If txtFontSize.Enabled Then
        s = "<ul><font size=" & txtFontSize.Text & " face=""" & txtFontName.Text & """>"
    Else
        s = "<ul><font face=""" & txtFontName.Text & """>"
    End If
    Print #iFileNum, s
    
    
    
    
    
    Dim L As Long
    
    For L = 0 To lstIndex.ListCount - 1
    
        s = "<li> "
        Print #iFileNum, s
        
        s = lstIndex.List(L)
        s = "<a href=""" & s & """ target=""_top"">" & CutExtension(s) & "</a>"
        Print #iFileNum, s
        
        s = "       <br><br>"
        Print #iFileNum, s
        
        
        s = "       "
        Print #iFileNum, s
        
        
        s = "       <br><br>"
        Print #iFileNum, s
        
        s = "</li>"
        Print #iFileNum, s
        
        s = "       "
        Print #iFileNum, s
        
        s = "       "
        Print #iFileNum, s
     
    Next L

    
    


    s = "</ul></font>"
    Print #iFileNum, s


    If chkAddExportedByNote.Value = vbChecked Then
        s = "<center> <font color=" & sBGCOLOR & ">;</font> <a href=""http://www.emu8086.com"" target=""_blank""><font face=verdana size=1 color=" & sTXTCOLOR & "> - asm2html - </font></a> </center>"
        Print #iFileNum, s
    End If

    s = "<!-- emu8086 version " & App.Major & "." & App.Minor & App.Revision & sVER_SFX & "    -->"
    Print #iFileNum, s
    
    s = "<!-- STOP AUTOMATIC INDEX GENERATION -->" & vbNewLine & vbNewLine & vbNewLine & vbNewLine
    Print #iFileNum, s

    s = " "
    Print #iFileNum, s
    
    s = "</center>"
    Print #iFileNum, s
    

    s = "<!-- *** -->"
    Print #iFileNum, s


    s = " "
    Print #iFileNum, s
    
    s = " "
    Print #iFileNum, s
    
    

    s = "</body>"
    Print #iFileNum, s

    s = "</html>"
    Print #iFileNum, s

    Close iFileNum


save_index = True




    Exit Function
err1:
    Debug.Print "save_index: " & Err.Description
    save_index = False
End Function



Function legHTML(s As String) As String
On Error Resume Next ' 4.00-Beta-3
    s = Replace(s, "&", "&amp;")
    s = Replace(s, ">", "&gt;")
    s = Replace(s, "<", "&lt;")
    s = Replace(s, "   ", " &nbsp; ")
    s = Replace(s, vbTab, "    ")
    legHTML = s
End Function

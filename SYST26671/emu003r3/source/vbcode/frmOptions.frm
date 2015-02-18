VERSION 5.00
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "options"
   ClientHeight    =   4560
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7530
   Icon            =   "frmOptions.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4560
   ScaleWidth      =   7530
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame frameOther 
      Height          =   1890
      Left            =   75
      TabIndex        =   28
      Top             =   75
      Width           =   3705
      Begin VB.CheckBox chkConfineCaretToText 
         Caption         =   "confine caret to text"
         Height          =   330
         Left            =   150
         TabIndex        =   32
         Top             =   720
         Width           =   1830
      End
      Begin VB.ComboBox comboAutoIndentMode 
         Height          =   315
         ItemData        =   "frmOptions.frx":038A
         Left            =   1575
         List            =   "frmOptions.frx":0397
         Style           =   2  'Dropdown List
         TabIndex        =   31
         Top             =   210
         Width           =   1920
      End
      Begin VB.CheckBox chkKeywordCaseNormalization 
         Caption         =   "keyword case normalization"
         Height          =   315
         Left            =   150
         TabIndex        =   30
         Top             =   1080
         Width           =   2595
      End
      Begin VB.CheckBox chkShowLineToolTips 
         Caption         =   "show line numbers on thumb scroll"
         Height          =   330
         Left            =   150
         TabIndex        =   29
         Top             =   1425
         Width           =   3000
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "auto-indent mode:"
         Height          =   195
         Left            =   150
         TabIndex        =   33
         Top             =   270
         Width           =   1275
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   " fonts and colors "
      Height          =   1170
      Left            =   3900
      TabIndex        =   22
      Top             =   135
      Width           =   3540
      Begin VB.CommandButton cmdSetFont 
         Caption         =   "set font ..."
         Height          =   330
         Left            =   1995
         TabIndex        =   25
         Top             =   720
         Width           =   1035
      End
      Begin VB.ComboBox comboObjects 
         Height          =   315
         ItemData        =   "frmOptions.frx":03CD
         Left            =   1065
         List            =   "frmOptions.frx":03DD
         Style           =   2  'Dropdown List
         TabIndex        =   24
         Top             =   300
         Width           =   2070
      End
      Begin VB.PictureBox picGeneralBackColor 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   330
         Left            =   1500
         ScaleHeight     =   300
         ScaleWidth      =   300
         TabIndex        =   23
         TabStop         =   0   'False
         Top             =   720
         Width           =   330
      End
      Begin VB.Label lblObjects 
         AutoSize        =   -1  'True
         Caption         =   "control:"
         Height          =   195
         Left            =   225
         TabIndex        =   27
         Top             =   345
         Width           =   525
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "background color:"
         Height          =   195
         Left            =   75
         TabIndex        =   26
         Top             =   795
         Width           =   1290
      End
   End
   Begin VB.Frame frameKeywords 
      Caption         =   " keywords "
      Height          =   2445
      Left            =   75
      TabIndex        =   13
      Top             =   2025
      Width           =   2880
      Begin VB.PictureBox picKeywordForeColor 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Enabled         =   0   'False
         ForeColor       =   &H80000008&
         Height          =   330
         Left            =   1815
         ScaleHeight     =   300
         ScaleWidth      =   300
         TabIndex        =   17
         TabStop         =   0   'False
         Top             =   1035
         Width           =   330
      End
      Begin VB.PictureBox picKeywordBackgroundColor 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Enabled         =   0   'False
         ForeColor       =   &H80000008&
         Height          =   330
         Left            =   1815
         ScaleHeight     =   300
         ScaleWidth      =   300
         TabIndex        =   16
         TabStop         =   0   'False
         Top             =   1440
         Width           =   330
      End
      Begin VB.ComboBox comboKeywordFontStyle 
         Enabled         =   0   'False
         Height          =   315
         ItemData        =   "frmOptions.frx":0426
         Left            =   1170
         List            =   "frmOptions.frx":0439
         Style           =   2  'Dropdown List
         TabIndex        =   15
         Top             =   1890
         Width           =   1560
      End
      Begin VB.ComboBox comboKeywordItem 
         Height          =   315
         ItemData        =   "frmOptions.frx":046D
         Left            =   810
         List            =   "frmOptions.frx":0492
         Style           =   2  'Dropdown List
         TabIndex        =   14
         Top             =   300
         Width           =   1920
      End
      Begin VB.Label lblKeyForeColor 
         AutoSize        =   -1  'True
         Caption         =   "foreground color:"
         Enabled         =   0   'False
         Height          =   195
         Left            =   225
         TabIndex        =   21
         Top             =   1095
         Width           =   1200
      End
      Begin VB.Label lblKeyBackColor 
         AutoSize        =   -1  'True
         Caption         =   "background color:"
         Enabled         =   0   'False
         Height          =   195
         Left            =   225
         TabIndex        =   20
         Top             =   1500
         Width           =   1290
      End
      Begin VB.Label lblKeyFontStyle 
         AutoSize        =   -1  'True
         Caption         =   "font style:"
         Enabled         =   0   'False
         Height          =   195
         Left            =   225
         TabIndex        =   19
         Top             =   1965
         Width           =   675
      End
      Begin VB.Line Line1 
         X1              =   150
         X2              =   2685
         Y1              =   840
         Y2              =   840
      End
      Begin VB.Label lblKeywordItem 
         AutoSize        =   -1  'True
         Caption         =   "item:"
         Height          =   195
         Left            =   225
         TabIndex        =   18
         Top             =   360
         Width           =   330
      End
   End
   Begin VB.Frame frameTabs 
      Caption         =   " tabs "
      Height          =   1020
      Left            =   3900
      TabIndex        =   9
      Top             =   1455
      Width           =   3540
      Begin VB.CheckBox chkConvertTabs 
         Caption         =   "convert tabs to spaces while typing"
         Height          =   255
         Left            =   195
         TabIndex        =   11
         Top             =   690
         Width           =   3015
      End
      Begin VB.TextBox txtTabSize 
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   1245
         MaxLength       =   2
         TabIndex        =   10
         Text            =   "?"
         Top             =   262
         Width           =   585
      End
      Begin VB.Label lblTabSize 
         AutoSize        =   -1  'True
         Caption         =   "tab size:"
         Height          =   195
         Left            =   360
         TabIndex        =   12
         Top             =   330
         Width           =   585
      End
   End
   Begin VB.CommandButton cmdAssociate 
      Height          =   420
      Left            =   3165
      TabIndex        =   8
      Top             =   4050
      Width           =   4245
   End
   Begin VB.Frame frameLineNumbers 
      Caption         =   " line numbers "
      Height          =   1320
      Left            =   3090
      TabIndex        =   2
      Top             =   2595
      Width           =   2250
      Begin VB.ComboBox comboLineNumberingStyle 
         Height          =   315
         ItemData        =   "frmOptions.frx":051D
         Left            =   660
         List            =   "frmOptions.frx":0530
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   345
         Width           =   1275
      End
      Begin VB.TextBox txtStartLineNumberingAt 
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Fixedsys"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   810
         MaxLength       =   7
         TabIndex        =   4
         Text            =   "1"
         Top             =   810
         Width           =   1095
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "start at:"
         Height          =   195
         Left            =   135
         TabIndex        =   7
         Top             =   885
         Width           =   525
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "style:"
         Height          =   195
         Left            =   120
         TabIndex        =   6
         Top             =   420
         Width           =   360
      End
   End
   Begin VB.PictureBox picDefault 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   3300
      Picture         =   "frmOptions.frx":0559
      ScaleHeight     =   165
      ScaleWidth      =   240
      TabIndex        =   5
      Top             =   2220
      Visible         =   0   'False
      Width           =   270
   End
   Begin VB.CommandButton cmdResetToDefaults 
      Caption         =   "reset all"
      Height          =   480
      Left            =   5505
      TabIndex        =   1
      Top             =   3330
      Width           =   1905
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "close"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   5505
      TabIndex        =   0
      Top             =   2760
      Width           =   1905
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'

'

'



Option Explicit

Dim bShowing_Prop As Boolean


'''' 1.13
'''' 2.03 converted to function, returns "True" if OK,
''''      "False" when user pressed "Cancel"!
'''Private Function set_font(obj As Object) As Boolean
'''
'''On Error GoTo err_sf
'''
'''Dim f As New StdFont
'''Dim lColor As Long
'''Dim stdF As StdFont
'''
'''lColor = obj.ForeColor
'''
'''Set stdF = ComDlg.ShowFont(obj.Font, lColor, True)
'''
'''If Not ComDlg.bFONT_CANCELED Then
'''    Set obj.Font = stdF
'''
'''    obj.ForeColor = lColor
'''
'''    set_font = True
'''Else
'''    set_font = False
'''End If
'''
'''Exit Function
'''err_sf:
'''    Debug.Print "Error on set_font(): " & LCase(Err.Description)
'''
'''End Function

' 1039
Private Sub cmdAssociate_Click()

On Error Resume Next ' 4.00-Beta-3

    ' #400b12-unassociate#
    If GetSetting("emu8086", "associations", "ok", "0") = "0" Then
        cmdAssociate.Caption = cMT("un-associate  .asm  and  .inc files")
        MakeAssosiation 2
        SaveSetting "emu8086", "associations", "ok", "1"
    Else
        ' #400b20-bug-options-unassociate-doesnotwork# ???????????
        '''''        Call fWriteValue("HKCR", ".inc", "", "S", "emu8086")
        '''''        Call fWriteValue("HKCR", ".asm", "", "S", "emu8086")
        Call fDeleteKey("HKCR", "", ".inc")
        Call fDeleteKey("HKCR", "", ".asm")


        cmdAssociate.Caption = cMT("associate  .asm  and  .inc files")
        SaveSetting "emu8086", "associations", "ok", "0"
    End If
       
    
End Sub


Private Sub cmdOK_Click()
On Error GoTo error_on_ok
    
    Dim iTemp1 As Integer
    
    ' just in case previously "Reset to Defaults" was
    ' clicked:
    '1.32#465 SaveSetting sTitleA, "Options", "RESET", "FALSE"
    set_LOAD_OPTIONS_FLAG True
    
    ' 1.23
    If chkConfineCaretToText.Value = vbChecked Then
        frmMain.txtInput.SelBounds = True
    Else
        frmMain.txtInput.SelBounds = False
    End If
    
    ' 1.23
    Select Case comboAutoIndentMode.ListIndex
    Case 0
         frmMain.txtInput.AutoIndentMode = cmIndentOff
    Case 1
         frmMain.txtInput.AutoIndentMode = cmIndentScope
    Case 2
         frmMain.txtInput.AutoIndentMode = cmIndentPrevLine
    End Select
    
    
' #327t-memlist2code-3#  no need.
'''    ' 1.07
'''    If chkDisassemble_after_JMP_CALL.Value = vbChecked Then
'''        bAUTOMATIC_DISASM_AFTER_JMP_CALL = True
'''    Else
'''        ' 1.23#225
'''        If vbYes = MsgBox("are you sure you want to disable re-disassemble feature?" & vbNewLine _
'''                          & "disabling it may result in wrong disassembling!", vbYesNo + vbDefaultButton2, "Warning!") Then
'''            bAUTOMATIC_DISASM_AFTER_JMP_CALL = False
'''        Else
'''            bAUTOMATIC_DISASM_AFTER_JMP_CALL = True
'''        End If
'''    End If


 ' #327q2c# '
''''    ' 1.14 ===================================================
''''    dis_Bytes_to_Disassemble = Val(txtBytesToDisassemble.Text)
''''
''''    If dis_Bytes_to_Disassemble > 1024 Then
''''        dis_Bytes_to_Disassemble = 1024
''''        MsgBox "disassembly is limited to 1024 bytes!"
''''    End If
''''    If dis_Bytes_to_Disassemble < 0 Then
''''        dis_Bytes_to_Disassemble = 64
''''        MsgBox "should be a positive integer value."
''''    End If
''''    ' ========================================================
''''
    
    ' 1.23  Tabs:
    If chkConvertTabs.Value = vbChecked Then
        frmMain.txtInput.ExpandTabs = True
    Else
        frmMain.txtInput.ExpandTabs = False
    End If
    
    iTemp1 = Val(txtTabSize.Text)
    If (iTemp1 < 1) Or (iTemp1 > 30) Then iTemp1 = 4 ' default!
    frmMain.txtInput.TabSize = iTemp1
    
    
    ' 1.23 Keyword Normalization:
    If chkKeywordCaseNormalization.Value = vbChecked Then
        frmMain.txtInput.NormalizeCase = True
    Else
        frmMain.txtInput.NormalizeCase = False
    End If
    
    
    ' 1.27
    If chkShowLineToolTips.Value = vbChecked Then
        frmMain.txtInput.LineToolTips = True
    Else
        frmMain.txtInput.LineToolTips = False
    End If
    
    
    ' 1.23
    ' in case second instance of emu8086.exe
    ' is started, it's better if it will use
    ' already defined options (and not ruin them
    ' on exit):
    save_Options
    SaveCustomColors
   
    
    ' 1.24#279
    ' make original source window have the same
    ' font properties as Source Editor:
    frmOrigCode.PREPARE_cmaxActualSource
    
    
    
    
    ' 1.28#369
    If frmEmulation.picMemList.ForeColor = frmEmulation.picMemList.BackColor Then
        ' set default:
        frmEmulation.picMemList.ForeColor = vbBlack
        frmEmulation.picMemList.BackColor = vbWhite
        
        If b_LOADED_frmMemory Then
            frmMemory.lstMemory.ForeColor = frmEmulation.picMemList.ForeColor
            frmMemory.lstMemory.BackColor = frmEmulation.picMemList.BackColor
        End If
    End If
    
    ' 1.28#369
    If frmEmulation.picDisList.ForeColor = frmEmulation.picDisList.BackColor Then
        ' set default:
        frmEmulation.picDisList.ForeColor = vbBlack
        frmEmulation.picDisList.BackColor = vbWhite
    End If
    
    
    
    
    Me.Hide
    
    If b_frmOPTIONS_SHOWN_BY_EMULATOR Then ' #1160
        frmEmulation.SetFocus
    Else
        frmMain.SetFocus  ' sometimes it goes into background...
    End If
    
    
    Exit Sub
error_on_ok:

    mBox Me, "settings saving error: " & vbNewLine & LCase(Err.Description)
    Resume Next
End Sub

Private Sub cmdResetToDefaults_Click()
On Error GoTo err_rtd

    '#1171 If vbYes = MsgBox(cMT(" This will reset colors and recent files menu!") & vbNewLine & vbNewLine & "        " & cMT("Are you sure?"), vbYesNo + vbDefaultButton2, "Reset to Defaults?") Then
   
   ' MACRO MENU REMOVED! (I never used it, hope no one else did).
   ' & _
   '       vbNewLine & vbNewLine & cMT(" This will also reset the 'Macro' menu!")
   
   
        ' 1.32#465 SaveSetting sTitleA, "Options", "RESET", "TRUE"
        set_LOAD_OPTIONS_FLAG False
   
        ' #327u-startup# ' SaveSetting sTitleA, "OTHER", "STARTUPWIN", "YES"
   
        MsgBox "it's required to restart emu8086...", vbOKOnly, ""
        
        Me.Hide
        
        frmMain.SetFocus
        

    '#1171 End If
    
    Exit Sub

err_rtd:
    Debug.Print "cmdResetToDefaults_Click: " & LCase(Err.Description)
End Sub

Private Sub cmdSetFont_Click()

On Error Resume Next ' 4.00-Beta-3

Dim s As String

    Select Case comboObjects.ListIndex
    
    Case 0
    
        ' in order to display the correct font
        ' when asked for change in options:
        Set frmMain.Font = frmMain.txtInput.Font
        'frmMain.Font.Charset = frmMain.txtInput.Font.Charset
        frmMain.ForeColor = frmMain.txtInput.GetColor(cmClrText)
        
        ' 1.23 this way it don't want to work:
        '      set_font frmMain.txtInput
        ' so we use a trick:
        If Not set_font(frmMain) Then Exit Sub
        
        Set frmMain.txtInput.Font = frmMain.Font
        frmMain.txtInput.SetColor cmClrText, frmMain.ForeColor
                
        Dim lFontStyle As Long
        lFontStyle = cmFontNormal
        If frmMain.Font.Underline Then
            lFontStyle = cmFontUnderline
        ElseIf frmMain.Font.Bold And frmMain.Font.Italic Then
             lFontStyle = cmFontBoldItalic
        ElseIf frmMain.Font.Bold Then
            lFontStyle = cmFontBold
        ElseIf frmMain.Font.Italic Then
            lFontStyle = cmFontItalic
        End If
        frmMain.txtInput.SetFontStyle cmStyText, lFontStyle
        
        Set frmOrigCode.cmaxActualSource.Font = frmMain.Font
        frmOrigCode.cmaxActualSource.SetColor cmClrText, frmMain.ForeColor
        frmOrigCode.cmaxActualSource.SetFontStyle cmStyText, lFontStyle
        
    Case 1
        frmScreen.picSCREEN.ForeColor = frmScreen.get_DEFAULT_ATTRIB_forecolor
    
        If Not set_font(frmScreen.picSCREEN) Then Exit Sub
        
        ' 1.28#369
        frmScreen.set_DEFAULT_ATTRIB_forecolor frmScreen.picSCREEN.ForeColor
        
        
        ' 2.03
        If frmScreen.picSCREEN.ForeColor <> frmScreen.get_DEFAULT_ATTRIB_forecolor Then
            MsgBox cMT("cannot set the same back and fore color.") & vbNewLine & _
                   cMT("defaults set!"), vbExclamation
            picGeneralBackColor.BackColor = frmScreen.get_DEFAULT_ATTRIB_backcolor
        End If
        
        ' update the screen using new font:
        frmScreen.setSCREEN_W_H
        frmScreen.VMEM_TO_SCREEN


        If b_LOADED_frmASCII_CHARS Then frmASCII_CHARS.draw_ascii

' 2005-01-13
'        ' 2.03#520
'        MsgBox cMT("Please note:") & vbNewLine & _
'               cMT("this changes default color only!") & vbNewLine & _
'               cMT("it will be affected only if other color is not set via code directly."), vbInformation

        ' 2.03, better:
'        frmScreen.clear_SCREEN
        
    Case 2
        If Not set_font(frmEmulation.picMemList) Then Exit Sub
        
        refreshMemoryList ' 4.00
        
        If b_LOADED_frmMemory Then frmMemory.lstMemory.ForeColor = frmEmulation.picMemList.ForeColor
        
' #327xr-400-new-mem-list#
'''''        ' in case new font won't fit:
'''''        AddHorizontalScroll frmEmulation.lstMemory
'''''
    Case 3
        If Not set_font(frmEmulation.picDisList) Then Exit Sub
        
        
        refreshDisassembly ' 4.00 update with new font
        
' 4.00
''''''        ' in case new font won't fit:
''''''        AddHorizontalScroll frmEmulation.lstDECODED
''''''
    Case Else
    
        MsgBox cMT("select control name from the list"), vbOKOnly, cMT("nothing selected")
    
    End Select
    
    s = ""
    
End Sub



Private Sub comboKeywordFontStyle_Click()

On Error Resume Next ' 4.00-Beta-3

    Dim lFontStyle As Long
    
    '0    Comments
    '1    Instructions
    '2    Line Numbers
    '3    Numbers
    '4    Operators
    '5    PROC/MACRO
    '6    Strings
    '7    Registers
    '8    Segment Reg
    '9    Directives
    '10   Text
    
    ' cmFontNormal = 0
    ' cmFontBold = 1
    ' cmFontItalic = 2
    ' cmFontBoldItalic = 3
    ' cmFontUnderline = 4
    lFontStyle = comboKeywordFontStyle.ListIndex
    
    
    Select Case comboKeywordItem.ListIndex

    Case 0
        frmMain.txtInput.SetFontStyle cmStyComment, lFontStyle
        
    Case 1
        frmMain.txtInput.SetFontStyle cmStyKeyword, lFontStyle
        
    Case 2
        frmMain.txtInput.SetFontStyle cmStyLineNumber, lFontStyle
        
    Case 3
        frmMain.txtInput.SetFontStyle cmStyNumber, lFontStyle
                
    Case 4
         frmMain.txtInput.SetFontStyle cmStyOperator, lFontStyle
            
    Case 5
         frmMain.txtInput.SetFontStyle cmStyScopeKeyword, lFontStyle
    
    Case 6
         frmMain.txtInput.SetFontStyle cmStyString, lFontStyle
              
    Case 7
         frmMain.txtInput.SetFontStyle cmStyTagAttributeName, lFontStyle
                            
    Case 8
         frmMain.txtInput.SetFontStyle cmStyTagElementName, lFontStyle
           
    Case 9
         frmMain.txtInput.SetFontStyle cmStyTagEntity, lFontStyle
           
    Case 10
         frmMain.txtInput.SetFontStyle cmStyText, lFontStyle
                      
    End Select

End Sub


Private Sub comboKeywordItem_Click()

On Error Resume Next ' 4.00-Beta-3

    Dim lFontStyle As Long
    Dim lForeColor As Long
    Dim lBackColor As Long
    
    
    lblKeyForeColor.Enabled = True
    picKeywordForeColor.Enabled = True
    lblKeyBackColor.Enabled = True
    picKeywordBackgroundColor.Enabled = True
    lblKeyFontStyle.Enabled = True
    comboKeywordFontStyle.Enabled = True
    
    '0    Comments
    '1    Instructions
    '2    Line Numbers
    '3    Numbers
    '4    Operators
    '5    PROC/MACRO
    '6    Strings
    '7    Registers
    '8    Segment Reg
    '9    Directives
    '10   Text
    
    Select Case comboKeywordItem.ListIndex

    Case 0
        lFontStyle = frmMain.txtInput.GetFontStyle(cmStyComment)
        lForeColor = frmMain.txtInput.GetColor(cmClrComment)
        lBackColor = frmMain.txtInput.GetColor(cmClrCommentBk)
        
    Case 1
        lFontStyle = frmMain.txtInput.GetFontStyle(cmStyKeyword)
        lForeColor = frmMain.txtInput.GetColor(cmClrKeyword)
        lBackColor = frmMain.txtInput.GetColor(cmClrKeywordBk)
        
    Case 2
        lFontStyle = frmMain.txtInput.GetFontStyle(cmStyLineNumber)
        lForeColor = frmMain.txtInput.GetColor(cmClrLineNumber)
        lBackColor = frmMain.txtInput.GetColor(cmClrLineNumberBk)
        
    Case 3
        lFontStyle = frmMain.txtInput.GetFontStyle(cmStyNumber)
        lForeColor = frmMain.txtInput.GetColor(cmClrNumber)
        lBackColor = frmMain.txtInput.GetColor(cmClrNumberBk)
                
    Case 4
        lFontStyle = frmMain.txtInput.GetFontStyle(cmStyOperator)
        lForeColor = frmMain.txtInput.GetColor(cmClrOperator)
        lBackColor = frmMain.txtInput.GetColor(cmClrOperatorBk)
            
    Case 5
        lFontStyle = frmMain.txtInput.GetFontStyle(cmStyScopeKeyword)
        lForeColor = frmMain.txtInput.GetColor(cmClrScopeKeyword)
        lBackColor = frmMain.txtInput.GetColor(cmClrScopeKeywordBk)
                      
    Case 6
        lFontStyle = frmMain.txtInput.GetFontStyle(cmStyString)
        lForeColor = frmMain.txtInput.GetColor(cmClrString)
        lBackColor = frmMain.txtInput.GetColor(cmClrStringBk)
              
    Case 7
        lFontStyle = frmMain.txtInput.GetFontStyle(cmStyTagAttributeName)
        lForeColor = frmMain.txtInput.GetColor(cmClrTagAttributeName)
        lBackColor = frmMain.txtInput.GetColor(cmClrTagAttributeNameBk)
                            
    Case 8
        lFontStyle = frmMain.txtInput.GetFontStyle(cmStyTagElementName)
        lForeColor = frmMain.txtInput.GetColor(cmClrTagElementName)
        lBackColor = frmMain.txtInput.GetColor(cmClrTagElementNameBk)
           
    Case 9
        lFontStyle = frmMain.txtInput.GetFontStyle(cmStyTagEntity)
        lForeColor = frmMain.txtInput.GetColor(cmClrTagEntity)
        lBackColor = frmMain.txtInput.GetColor(cmClrTagEntityBk)
           
    Case 10
        lFontStyle = frmMain.txtInput.GetFontStyle(cmStyText)
        lForeColor = frmMain.txtInput.GetColor(cmClrText)
        lBackColor = frmMain.txtInput.GetColor(cmClrTextBk)
                      
    End Select
    
    '''''''''''''''''''''''''''''''''''''''''''''''''''''
    
    If lForeColor >= 0 Then
        picKeywordForeColor.BackColor = lForeColor
        picKeywordForeColor.Picture = Nothing
    Else
        picKeywordForeColor.BackColor = vbWhite
        picKeywordForeColor.Picture = picDefault.Picture
    End If
    
    If lBackColor >= 0 Then
        picKeywordBackgroundColor.BackColor = lBackColor
        picKeywordBackgroundColor.Picture = Nothing
    Else
        picKeywordBackgroundColor.BackColor = vbWhite
        picKeywordBackgroundColor.Picture = picDefault.Picture
    End If
    
    ' cmFontNormal = 0
    ' cmFontBold = 1
    ' cmFontItalic = 2
    ' cmFontBoldItalic = 3
    ' cmFontUnderline = 4
    comboKeywordFontStyle.ListIndex = lFontStyle
    
End Sub

Private Sub comboLineNumberingStyle_Click()

On Error Resume Next ' 4.00-Beta-3

    If bShowing_Prop Then Exit Sub
    
    bShowing_Prop = True
    
    '0    <none>
    '1    cmBinary
    '2    cmOctal
    '3    cmDecimal
    '4    cmHexadecimal
    
    Select Case comboLineNumberingStyle.ListIndex
    
    Case 0
        frmMain.txtInput.LineNumbering = False
        txtStartLineNumberingAt.Enabled = False
        txtStartLineNumberingAt.Text = "1" ' default.
        
    Case 1
        txtStartLineNumberingAt.Enabled = True
        frmMain.txtInput.LineNumbering = True
        frmMain.txtInput.LineNumberStyle = cmBinary
        frmMain.txtInput.LineNumberStart = 1
        txtStartLineNumberingAt.Text = "1"
        
    Case 2
        txtStartLineNumberingAt.Enabled = True
        frmMain.txtInput.LineNumbering = True
        frmMain.txtInput.LineNumberStyle = cmOctal
        frmMain.txtInput.LineNumberStart = 1
        txtStartLineNumberingAt.Text = "1"
        
    Case 3
        txtStartLineNumberingAt.Enabled = True
        frmMain.txtInput.LineNumbering = True
        frmMain.txtInput.LineNumberStyle = cmDecimal
        frmMain.txtInput.LineNumberStart = 1
        txtStartLineNumberingAt.Text = "1"
        
    Case 4
        txtStartLineNumberingAt.Enabled = True
        frmMain.txtInput.LineNumbering = True
        frmMain.txtInput.LineNumberStyle = cmHexadecimal
        frmMain.txtInput.LineNumberStart = 1
        txtStartLineNumberingAt.Text = "1"
        
    End Select
    
    
        

    bShowing_Prop = False
End Sub



Private Sub comboObjects_Click()

On Error Resume Next ' 4.00-Beta-3

    Dim L As Long
    
    Select Case comboObjects.ListIndex  '2.05.Text
    
    Case 0 ' "Source Editor"
        ' in case it's default, -1 is returned!
        L = frmMain.txtInput.GetColor(cmClrWindow)
        If L >= 0 Then
            picGeneralBackColor.BackColor = L
            picGeneralBackColor.Picture = Nothing
        Else
            picGeneralBackColor.BackColor = vbWhite
            picGeneralBackColor.Picture = picDefault.Picture
        End If
        
    Case 1 ' "User Screen"
        picGeneralBackColor.Picture = Nothing
        picGeneralBackColor.BackColor = frmScreen.get_DEFAULT_ATTRIB_backcolor
        
    Case 2 ' "Memory List"
        picGeneralBackColor.Picture = Nothing
        picGeneralBackColor.BackColor = frmEmulation.picMemList.BackColor
        
        
    Case 3 ' "Decoded List"
        picGeneralBackColor.Picture = Nothing
        picGeneralBackColor.BackColor = frmEmulation.picDisList.BackColor
        

    Case Else
    
        Debug.Print "wrong text in comboObjects!!!"
    
    End Select
    
End Sub

Private Sub Form_Activate()

On Error Resume Next ' 4.00-Beta-3

    bShowing_Prop = True

' #400-dissasembly#   always on
'''    ' 1.07
'''    If bAUTOMATIC_DISASM_AFTER_JMP_CALL Then
'''        chkDisassemble_after_JMP_CALL.Value = vbChecked
'''    Else
'''        chkDisassemble_after_JMP_CALL.Value = vbUnchecked
'''    End If
    
    ' 1.23
    If frmMain.txtInput.SelBounds Then
        chkConfineCaretToText.Value = vbChecked
    Else
        chkConfineCaretToText.Value = vbUnchecked
    End If
    
    ' 1.23
    Select Case frmMain.txtInput.AutoIndentMode
    Case cmAutoIndentMode.cmIndentOff
        comboAutoIndentMode.ListIndex = 0
    Case cmAutoIndentMode.cmIndentScope
         comboAutoIndentMode.ListIndex = 1
    Case cmAutoIndentMode.cmIndentPrevLine
         comboAutoIndentMode.ListIndex = 2
    End Select
    

    ' 1.23
    If frmMain.txtInput.LineNumbering Then
        txtStartLineNumberingAt.Enabled = True
        Select Case frmMain.txtInput.LineNumberStyle
        Case cmBinary
            comboLineNumberingStyle.ListIndex = 1
            txtStartLineNumberingAt.Text = HEX_to_BIN(Hex(frmMain.txtInput.LineNumberStart))
        Case cmOctal
            comboLineNumberingStyle.ListIndex = 2
            txtStartLineNumberingAt.Text = Oct(frmMain.txtInput.LineNumberStart)
        Case cmDecimal
            comboLineNumberingStyle.ListIndex = 3
            txtStartLineNumberingAt.Text = frmMain.txtInput.LineNumberStart
        Case cmHexadecimal
            comboLineNumberingStyle.ListIndex = 4
            txtStartLineNumberingAt.Text = Hex(frmMain.txtInput.LineNumberStart)
        End Select
    Else
        txtStartLineNumberingAt.Enabled = False
        comboLineNumberingStyle.ListIndex = 0
    End If

    ' 1.23
    txtTabSize.Text = frmMain.txtInput.TabSize
    If frmMain.txtInput.ExpandTabs Then
        chkConvertTabs.Value = vbChecked
    Else
        chkConvertTabs.Value = vbUnchecked
    End If
    
    ' 1.23
    If frmMain.txtInput.NormalizeCase Then
        chkKeywordCaseNormalization.Value = vbChecked
    Else
        chkKeywordCaseNormalization.Value = vbUnchecked
    End If
    
    ' 1.27
    If frmMain.txtInput.LineToolTips Then
        chkShowLineToolTips.Value = vbChecked
    Else
        chkShowLineToolTips.Value = vbUnchecked
    End If
    
    
    
    
    
    ' #400b12-unassociate#
    If GetSetting("emu8086", "associations", "ok", "0") = "1" Then
        cmdAssociate.Caption = cMT("un-associate  .asm  and  .inc files")
    Else
        cmdAssociate.Caption = cMT("associate  .asm  and  .inc files")
    End If
    
    
    
' #400-dissasembly#
'''
'''    ' 1.14
'''    txtBytesToDisassemble.Text = dis_Bytes_to_Disassemble
'''
    
    bShowing_Prop = False
End Sub

Private Sub Form_Load()

On Error Resume Next ' 4.00-Beta-3

   If Load_from_Lang_File(Me) Then Exit Sub
    
    ' Me.Icon = frmMain.Icon

    ' 1.23
    comboObjects.ListIndex = 0

' 1.13
'''    Dim i  As Integer   ' Declare variable.
'''
'''    For i = 0 To Screen.FontCount - 1  ' Determine number of fonts.
'''        comboEditorFont.AddItem Screen.Fonts(i)  ' Put each font into list box.
'''        comboUserFont.AddItem Screen.Fonts(i)
'''    Next i
    
End Sub

' 1.23
' secret option!
Private Sub lblObjects_DblClick()

On Error Resume Next ' 4.00-Beta-3

If comboObjects.ListIndex = 0 Then

    frmMain.txtInput.ExecuteCmd cmCmdProperties
    
End If

End Sub

Private Sub picKeywordBackgroundColor_Click()

On Error Resume Next ' 4.00-Beta-3

    Dim lBackColor As Long
    
    
    ComDlg.hwndOwner = Me.hwnd
    ComDlg.Flags = CC_RGBINIT
    ComDlg.ColorD = picKeywordBackgroundColor.BackColor
    ComDlg.CustColorsD = CUSTOM_COLORS
    lBackColor = ComDlg.ShowColor
    
    If lBackColor = -1 Then Exit Sub ' Canceled!
    ' to prevent changing default:
    If picKeywordBackgroundColor.BackColor = lBackColor Then Exit Sub
    
    picKeywordBackgroundColor.BackColor = lBackColor
    picKeywordBackgroundColor.Picture = Nothing
    CUSTOM_COLORS = ComDlg.CustColorsD
    

    '0    Comments
    '1    Instructions
    '2    Line Numbers
    '3    Numbers
    '4    Operators
    '5    PROC/MACRO
    '6    Strings
    '7    Registers
    '8    Segment Reg
    '9    Directives
    '10   Text
    
    Select Case comboKeywordItem.ListIndex

    Case 0
         frmMain.txtInput.SetColor cmClrCommentBk, lBackColor
         frmOrigCode.cmaxActualSource.SetColor cmClrCommentBk, lBackColor ' #1087b
    Case 1
         frmMain.txtInput.SetColor cmClrKeywordBk, lBackColor
         frmOrigCode.cmaxActualSource.SetColor cmClrKeywordBk, lBackColor ' #1087b
    Case 2
         frmMain.txtInput.SetColor cmClrLineNumberBk, lBackColor
         frmOrigCode.cmaxActualSource.SetColor cmClrLineNumberBk, lBackColor ' #1087b
    Case 3
         frmMain.txtInput.SetColor cmClrNumberBk, lBackColor
         frmOrigCode.cmaxActualSource.SetColor cmClrNumberBk, lBackColor ' #1087b
    Case 4
         frmMain.txtInput.SetColor cmClrOperatorBk, lBackColor
         frmOrigCode.cmaxActualSource.SetColor cmClrOperatorBk, lBackColor ' #1087b
    Case 5
         frmMain.txtInput.SetColor cmClrScopeKeywordBk, lBackColor
         frmOrigCode.cmaxActualSource.SetColor cmClrScopeKeywordBk, lBackColor ' #1087b
    Case 6
         frmMain.txtInput.SetColor cmClrStringBk, lBackColor
         frmOrigCode.cmaxActualSource.SetColor cmClrStringBk, lBackColor ' #1087b
    Case 7
         frmMain.txtInput.SetColor cmClrTagAttributeNameBk, lBackColor
         frmOrigCode.cmaxActualSource.SetColor cmClrTagAttributeNameBk, lBackColor ' #1087b
    Case 8
         frmMain.txtInput.SetColor cmClrTagElementNameBk, lBackColor
         frmOrigCode.cmaxActualSource.SetColor cmClrTagElementNameBk, lBackColor ' #1087b
    Case 9
         frmMain.txtInput.SetColor cmClrTagEntityBk, lBackColor
         frmOrigCode.cmaxActualSource.SetColor cmClrTagEntityBk, lBackColor ' #1087b
    Case 10
         frmMain.txtInput.SetColor cmClrTextBk, lBackColor
         frmOrigCode.cmaxActualSource.SetColor cmClrTextBk, lBackColor ' #1087b
    End Select

End Sub

Private Sub picKeywordForeColor_Click()

On Error Resume Next ' 4.00-Beta-3

    Dim lForeColor As Long

    ComDlg.hwndOwner = Me.hwnd
    ComDlg.Flags = CC_RGBINIT
    ComDlg.ColorD = picKeywordForeColor.BackColor
    ComDlg.CustColorsD = CUSTOM_COLORS
    lForeColor = ComDlg.ShowColor
    
    If lForeColor = -1 Then Exit Sub ' Canceled!
    ' to prevent changing default:
    If picKeywordForeColor.BackColor = lForeColor Then Exit Sub
    
    picKeywordForeColor.BackColor = lForeColor
    picKeywordForeColor.Picture = Nothing
    CUSTOM_COLORS = ComDlg.CustColorsD
    
    
    '0    Comments
    '1    Instructions
    '2    Line Numbers
    '3    Numbers
    '4    Operators
    '5    PROC/MACRO
    '6    Strings
    '7    Registers
    '8    Segment Reg
    '9    Directives
    '10   Text
    
    Select Case comboKeywordItem.ListIndex

    Case 0
         frmMain.txtInput.SetColor cmClrComment, lForeColor
         frmOrigCode.cmaxActualSource.SetColor cmClrComment, lForeColor ' #1087b
    Case 1
         frmMain.txtInput.SetColor cmClrKeyword, lForeColor
         frmOrigCode.cmaxActualSource.SetColor cmClrKeyword, lForeColor ' #1087b
    Case 2
         frmMain.txtInput.SetColor cmClrLineNumber, lForeColor
         frmOrigCode.cmaxActualSource.SetColor cmClrLineNumber, lForeColor ' #1087b
    Case 3
         frmMain.txtInput.SetColor cmClrNumber, lForeColor
         frmOrigCode.cmaxActualSource.SetColor cmClrNumber, lForeColor ' #1087b
    Case 4
         frmMain.txtInput.SetColor cmClrOperator, lForeColor
         frmOrigCode.cmaxActualSource.SetColor cmClrOperator, lForeColor ' #1087b
    Case 5
         frmMain.txtInput.SetColor cmClrScopeKeyword, lForeColor
         frmOrigCode.cmaxActualSource.SetColor cmClrScopeKeyword, lForeColor ' #1087b
    Case 6
         frmMain.txtInput.SetColor cmClrString, lForeColor
         frmOrigCode.cmaxActualSource.SetColor cmClrString, lForeColor ' #1087b
    Case 7
         frmMain.txtInput.SetColor cmClrTagAttributeName, lForeColor
         frmOrigCode.cmaxActualSource.SetColor cmClrTagAttributeName, lForeColor ' #1087b
    Case 8
         frmMain.txtInput.SetColor cmClrTagElementName, lForeColor
         frmOrigCode.cmaxActualSource.SetColor cmClrTagElementName, lForeColor ' #1087b
    Case 9
         frmMain.txtInput.SetColor cmClrTagEntity, lForeColor
         frmOrigCode.cmaxActualSource.SetColor cmClrTagEntity, lForeColor ' #1087b
    Case 10
         frmMain.txtInput.SetColor cmClrText, lForeColor
         frmOrigCode.cmaxActualSource.SetColor cmClrText, lForeColor ' #1087b
    End Select

End Sub

Private Sub picGeneralBackColor_Click()
On Error GoTo err_pgb

    Dim L As Long

   ' If comboObjects.Text <> "User Screen" Then  ' 2.02#520b
     If comboObjects.ListIndex <> 1 Then   ' #1162
     
        ComDlg.hwndOwner = Me.hwnd
        ComDlg.Flags = CC_RGBINIT
        ComDlg.ColorD = picGeneralBackColor.BackColor
        ComDlg.CustColorsD = CUSTOM_COLORS
        L = ComDlg.ShowColor
    
    Else
        L = picGeneralBackColor.BackColor
        frm16Color_DIALOG.lColor = L
        frm16Color_DIALOG.Show vbModal, Me
        L = frm16Color_DIALOG.lColor
        Unload frm16Color_DIALOG ' optional.
    End If
    
    
    If L <> -1 Then
        ' to prevent changing default:
        If picGeneralBackColor.BackColor <> L Then
            picGeneralBackColor.BackColor = L
            picGeneralBackColor.Picture = Nothing
            
            
            Select Case comboObjects.ListIndex
            
            Case 0 ' "Source Editor"
                frmMain.txtInput.SetColor cmClrWindow, picGeneralBackColor.BackColor
                frmOrigCode.cmaxActualSource.SetColor cmClrWindow, picGeneralBackColor.BackColor '#1087b
                
                
            Case 1 ' "User Screen"
                Dim lAcceptedColor As Long  ' 2.03
                           
                lAcceptedColor = frmScreen.set_DEFAULT_ATTRIB_backcolor(picGeneralBackColor.BackColor)
                
                ' 2.03
                If picGeneralBackColor.BackColor <> lAcceptedColor Then
                    picGeneralBackColor.BackColor = lAcceptedColor
                    ' 2.03
                    MsgBox cMT("cannot set the same fore and back color!") & vbNewLine & _
                           cMT("defaults set!"), vbExclamation
                 End If
                 
                ' 2.03, better:
                frmScreen.clear_SCREEN
                 
' 2005-03-13 removed!
'                ' 2.03#520
'                MsgBox cMT("Please note:") & vbNewLine & _
'                        cMT("This changes default color only!") & vbNewLine & _
'                        cMT("it will be affected only if other color is not set via code directly."), vbInformation
'

            Case 2 '"Memory List"
                frmEmulation.picMemList.BackColor = picGeneralBackColor.BackColor
                If b_LOADED_frmMemory Then frmMemory.lstMemory.BackColor = frmEmulation.picMemList.BackColor
                
                refreshMemoryList ' 4.00
                
            Case 3 ' "Decoded List"
                frmEmulation.picDisList.BackColor = picGeneralBackColor.BackColor
                refreshDisassembly
        
            Case Else
            
                Debug.Print "wrong text in comboObjects!!!"
            
            End Select
    

            CUSTOM_COLORS = ComDlg.CustColorsD
        End If
    End If
    
    Exit Sub
    
err_pgb:
    MsgBox "background color set error: " & LCase(Err.Description)
    
End Sub

' 1.13
''''' 1.09
''''Private Sub txtEditorFontSize_GotFocus()
''''    With txtEditorFontSize
''''        .SelStart = 0
''''        .SelLength = Len(.Text)
''''    End With
''''End Sub
''''
''''' 1.09
''''Private Sub txtUserFontSize_GotFocus()
''''    With txtUserFontSize
''''        .SelStart = 0
''''        .SelLength = Len(.Text)
''''    End With
''''End Sub

' #400-dissasembly#
''''Private Sub txtBytesToDisassemble_GotFocus()
''''    With txtBytesToDisassemble
''''        .SelStart = 0
''''        DoEvents    ' 1.25#306
''''        .SelLength = Len(.Text)
''''    End With
''''End Sub

Private Sub txtStartLineNumberingAt_Change()
    
On Error Resume Next ' 4.00-Beta-3
    
    If bShowing_Prop Then Exit Sub
 
    '0    <none>
    '1    cmBinary
    '2    cmOctal
    '3    cmDecimal
    '4    cmHexadecimal
    
    Select Case comboLineNumberingStyle.ListIndex

    Case 1
        frmMain.txtInput.LineNumberStart = Abs(evalExpr(Trim(txtStartLineNumberingAt.Text) & "b"))
    Case 2
        frmMain.txtInput.LineNumberStart = Abs(Val("&o" & Trim(txtStartLineNumberingAt.Text)))
    Case 3
        frmMain.txtInput.LineNumberStart = Abs(Val(Trim(txtStartLineNumberingAt.Text)))
    Case 4
        frmMain.txtInput.LineNumberStart = Abs(Val("&H" & Trim(txtStartLineNumberingAt.Text)))
       
    End Select
    
End Sub

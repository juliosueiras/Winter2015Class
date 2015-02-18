Attribute VB_Name = "CLang2"

' 

' 

'

' must ignore all CMAXES ... they cause errors when _defaul.dat is generated...- unknown reasons!



'-----------------------------------------------------------
' MagicGlob - Internationalization / Globalization System for Visual Basic.
'            (freeware open-source library for non-commercial use)
'
' Author:      Alexander Popov
'
'    http://www.geocities.com/emu8086/
'
' Module:       Clang.bas
'
' Version: 2.0 - updated for emu8086!!!
'
' Purpose: This module holds main procedures
'          and functions of MagicGlob library.
'-----------------------------------------------------------

' Last change: August 18, 2005

' How to use:
' ------ MAKING DEFAULT LANGUAGE FILE ------
' If required make "_ignored.txt" file,
' and write controls that should not be added to the
' language file, use this format:
'     Form1.Text1
'     Form1.lbl*
' (you can use built-in pattern matching).
'
'     Declare the language file:
'
' MAKE_DEFAULT_LANGUAGE_FILE
'
'     then add all forms to language file:
'
' Add_To_Lang_File Form1
' Add_To_Lang_File Form2
' Add_To_Lang_File ...
'
'
'
'--------------------------------------------------------
'     Rename default language file "_default.dat" to
'     "_lang.dat", and only then Edit it (to prevent
'     your changes being overwritten or something) !!!
'--------------------------------------------------------
'
' ------ TRANSLATION ------
'
'     Execute this before loading any forms:
'
' LOAD_LANGUAGE_FILE
'
'     For every form add this code in Form_Load event:
'
' If Load_from_Lang_File (Me) Then Exit Sub
'
'     The above function returns "True" only when
'     we are creating the default language file,
'     exiting from Form_Load event helps to avoid
'     conflicts.
'--------------------------------------------


Option Explicit


' ================== Default File Names ==================

' Source messages, not to be edited by human transaltor:
Const sSOURCE_MESSAGE_FILE = "_msg.dat"
' Default language file created by Set_Lang_File (True) sub:
Const sDEFAULT_LANGUAGE_FILE = "_default.dat"
' Translated Language File:
Const sLANGUAGE_FILE = "_lang.dat"
' Contrains the list of Components that are not added to
' default language file, and thus never translated:
Const sIGNORE_LIST_FILE = "_ignored.dat"

' ========================================================

' When set to "False" Load_from_Lang_File()
' function does not do anything, thus translation
' isn't done, this boolean is set to "False"
' when language file ("_lang.dat") does not exist:
Global bMAKE_TRANSLATION As Boolean


Dim sLangFilename As String

' To prevent loading from Lang file
' while making new language file:
Dim bMAKING_DEFAULT_LANGUAGE_FILE As Boolean

' The list of ignored controls,
' has this format: "frmMain.Text1"
' used only when creating new language (of course).
' Support wild chars! for example "frmMain.txt*"
Dim sIGNORED_LIST() As String
Dim iIGNORED_LIST_SIZE As Integer


' These variables are used to translate the messages
' that are used inside the source code:
Dim sSOURCE_MSG() As String
Dim sTRANSLATED_MSG() As String
Dim iSOURCE_MSG_COUNT As Integer
Dim iTRANSLATED_MSG_COUNT As Integer

' #734
Public iDefaultCharset As Integer

Public bRIGHT_TO_LEFT As Boolean ' 3.27w


Sub MAKE_DEFAULT_LANGUAGE_FILE()
On Error GoTo err_slf

    sLangFilename = Add_BackSlash(App.Path) & sDEFAULT_LANGUAGE_FILE
      
    ' Set some flags:
    bMAKING_DEFAULT_LANGUAGE_FILE = True
    bMAKE_TRANSLATION = False
        
    Load_ignore_list
    
    If FileExists(sLangFilename) Then
        DELETE_FILE sLangFilename
    End If
    
    ' Save default messages:
    SAVE_DEFAULT_MESSAGES
    
    Exit Sub
err_slf:
    MsgBox "MAKE_DEFAULT_LANGUAGE_FILE: " & err.Description
End Sub


Sub LOAD_LANGUAGE_FILE()
On Error GoTo err_llf

    sLangFilename = Add_BackSlash(App.Path) & sLANGUAGE_FILE
    
    ' Set some flags:
    bMAKING_DEFAULT_LANGUAGE_FILE = False
    bMAKE_TRANSLATION = FileExists(sLangFilename)
        
        

            
        
        
    If bMAKE_TRANSLATION Then
    
        ' we may load the messages already....
        Load_MESSAGE_TRANSLATION
        ' and properties...
        Load_LANG_PROPERTIES
        ' but we will continue to update forms' intefraces only if version check passes!

'#327xa-idea#
'''        ' 3.27w  - first line must contain a version number!
'''        Dim fNum As Integer
'''        Dim s As String
'''        Dim sVersion As String
'''        fNum = FreeFile
'''        Open sLangFilename For Input As fNum
'''        sVersion = App.Major & "." & App.Minor & App.Revision & sVER_SFX
'''        Line Input #fNum, s

         ' #327xa-idea#
         Dim s_msg_dat_version As String
         Dim s_lang_dat_version As String
         s_msg_dat_version = get_property(sSOURCE_MESSAGE_FILE, "LANG_FILE_VERSION", "")
         s_lang_dat_version = get_property(sLANGUAGE_FILE, "LANG_FILE_VERSION", "")
         ' #327xa-idea# ' If InStr(1, s, sVersion, vbTextCompare) <= 0 Then
         If InStr(1, s_msg_dat_version, s_lang_dat_version, vbTextCompare) <= 0 Then
'''           MsgBox cMT("note: you are using the incompatible language files") & vbNewLine & _
'''                          cMT("please contact the author of the translation for the updated language files for version:") & " " & s_msg_dat_version & vbNewLine & _
'''                          cMT("or visit www.emu8086.com/dr/loc/"), vbOKOnly, "wrong version of the language file: _lang.dat"
            bMAKE_TRANSLATION = False
            Debug.Print "incompatible language files"
        End If
' #327xa-idea# '''        Close #fNum
        
    End If

    Exit Sub
err_llf:
    MsgBox "Error on LOAD_LANGUAGE_FILE: " & err.Description
End Sub

Sub Add_To_Lang_File(frm As Form)
On Error GoTo err_alf

    If Not bMAKING_DEFAULT_LANGUAGE_FILE Then
        MsgBox "wrong use of Set_Lang_File() procedure!" & vbNewLine & _
               "New file should be created using MAKE_DEFAULT_LANGUAGE_FILE()."
        Exit Sub
    End If

    If Len(sLangFilename) = 0 Then
        MsgBox "Lang file not set!" & vbNewLine & _
               "Use Set_Lang_File() to set language file first!"
        Exit Sub
    End If

    Dim i As Integer
    Dim d As Integer
    Dim fNum As Integer
    Dim s As String
    Dim t As Integer
    
    fNum = FreeFile
    

    Open sLangFilename For Append As fNum
    
  
        Print #fNum, "_______________________________________________________________________" & vbNewLine & vbNewLine
        Print #fNum, "                                   [---START FORM---]"
        s = "                                   " & frm.Name
        Print #fNum, s
                
        ' Get form's caption:
        If Not is_in_ignore_list_BY_STR(frm.Name & ".Caption") Then
            Dim lT2 As String
            
            Print #fNum, "                                   [CAPTION]"  ' 3.27w
            Print #fNum, frm.Caption
            Print #fNum, "                                   [W]"
                   lT2 = "                                   " & CStr(frm.Width)
            Print #fNum, lT2
            Print #fNum, "                                   [H]"
                   lT2 = "                                   " & CStr(frm.Height)
            Print #fNum, lT2
            lT2 = vbNewLine & vbNewLine & _
                         "                                   [--- START CONTROLS ---]" & vbNewLine & vbNewLine & vbNewLine
            Print #fNum, lT2
        End If
                
        For i = 0 To frm.Count - 1
        
            '====================================
            ' Get name of the control:
            
            If is_in_ignore_list(frm.Controls(i)) Then GoTo skip_this_control
            
            s = "                                   " & frm.Controls(i).Name
            
            d = is_an_array(frm.Controls(i))
            
            If d <> -1 Then
                s = s & "(" & d & ")"
            End If
            
            
            '====================================
            
            '====================================
            ' write properties:
            
            Dim ST As String
            Dim s_START_PROPERTIES As String
            s_START_PROPERTIES = vbNewLine & vbNewLine & vbNewLine & "                                   [CONTROL NAME]"
            
            
            If TypeOf frm.Controls(i) Is TextBox Then
                ST = Trim(frm.Controls(i).Text)
                If InStr(1, s, "txtHelper") > 0 Then 'finally I decided to translate txtHelper only :) ' If (sT <> "" And Not InStr(1, sT, "0") > 0) Then ' I decided not to let translate anything that might be a register to avoid conflicts with "On Change event" ' Or (get_Tooltiptext_property(frm.Controls(i)) <> "") Then
                    Print #fNum, s_START_PROPERTIES
                    Print #fNum, s   ' print out control name.
                    Print #fNum, "                                   [TEXT]" ' 3.27w
                    Print #fNum, remove_illigal_for_translated(frm.Controls(i).Text)
                    Print #fNum, "                                   [END TEXT]" ' required for mulitline controls, such as lists on frmOptions.
                Else
                    GoTo skip_this_control
                End If
            ElseIf (TypeOf frm.Controls(i) Is ListBox) Or (TypeOf frm.Controls(i) Is ComboBox) Then
                ST = Trim(frm.Controls(i).List(t))
                If ST <> "" Then
                    Print #fNum, s_START_PROPERTIES
                    Print #fNum, s   ' print out control name.
                    Print #fNum, "                                   [TEXT]" ' 3.27w
                    For t = 0 To frm.Controls(i).ListCount - 1
                        Print #fNum, remove_illigal_for_translated(frm.Controls(i).List(t))
                    Next t
                    Print #fNum, "                                   [END TEXT]" ' required for mulitline controls, such as lists on frmOptions.
                Else
                    GoTo skip_this_control
                End If
            ElseIf has_Caption_property(frm.Controls(i)) Then
                ST = Trim(frm.Controls(i).Caption)
                If ST <> "" Then
                    Print #fNum, s_START_PROPERTIES
                    Print #fNum, s   ' print out control name.
                    Print #fNum, "                                   [TEXT]" ' 3.27w
                    Print #fNum, remove_illigal_for_translated(frm.Controls(i).Caption)
                    Print #fNum, "                                   [END TEXT]" ' required for mulitline controls, such as lists on frmOptions.
                Else
                    GoTo skip_this_control
                End If
            Else
                GoTo skip_this_control
            End If

            
            
            
            If has_Tooltiptext_property(frm.Controls(i)) Then ' v 3.27w print only if tooltip present.
                ST = Trim(frm.Controls(i).ToolTipText)
                If ST <> "" Then
                    ' Get tooltip:
                        Print #fNum, "                                   [TOOLTIP]"
                        Print #fNum, remove_illigal_for_translated(frm.Controls(i).ToolTipText)
                End If
            End If
            ' v 3.27w OBSOLETE! should work without it ' Print #fNum, "                                   [END TOOLTIP]"
            
            ' v 3.27w  adding new properties...
            Dim sVVV As String
            If has_LEFT_property(frm.Controls(i)) Then
                Print #fNum, "                                   [X]"
                sVVV = "                                   " & CStr(frm.Controls(i).Left)
                Print #fNum, sVVV
            End If
            If has_TOP_property(frm.Controls(i)) Then
                Print #fNum, "                                   [Y]"
                sVVV = "                                   " & CStr(frm.Controls(i).Top)
                Print #fNum, sVVV
            End If
            If has_WIDTH_property(frm.Controls(i)) Then
                Print #fNum, "                                   [W]"
                sVVV = "                                   " & CStr(frm.Controls(i).Width)
                Print #fNum, sVVV
            End If
            If has_HEIGHT_property(frm.Controls(i)) Then
                Print #fNum, "                                   [H]"
                sVVV = "                                   " & CStr(frm.Controls(i).Height)
                Print #fNum, sVVV
            End If
            
            '====================================
            
skip_this_control:

        Next i
        
        Print #fNum, "                                   [---END FORM---]"
        Print #fNum, " " & vbNewLine & vbNewLine ' 3.27w  - two new lines are added.
        
    Close fNum
    
    Exit Sub
err_alf:
    Debug.Print "Add_To_Lang_File: " & LCase(err.Description)
    Close fNum
End Sub

' returns index of the object in array,
' or -1 in case this object isn't in array!
Function is_an_array(c As Control) As Integer
    On Error GoTo not_array
    
    is_an_array = c.Index
    
    Exit Function
not_array:
    is_an_array = -1
End Function

' returns True if the object has "Caption" property:
Function has_Caption_property(c As Control) As Boolean
    On Error GoTo no_caption
    
    Dim s As String
    
    s = c.Caption
    
    s = ""
    
    has_Caption_property = True
    
    Exit Function
no_caption:
    has_Caption_property = False
End Function

' #734
' returns True if the object has "Font" property:
Function has_Font_property(c As Control) As Boolean
    On Error GoTo no_font
    
    Dim i As Integer
    
    i = c.Font.Charset
    
    has_Font_property = True
    
    Exit Function
no_font:
    has_Font_property = False
End Function

Private Sub if_Possible_set_Right_Align(c As Control)
    On Error GoTo no_rightalign
    
    If c.Alignment = 0 Then
        c.Alignment = 1
    End If

no_rightalign:
End Sub

Private Sub if_Possible_set_RightToLeft(c As Control)
    On Error GoTo no_rightoleft
    c.RightToLeft = True
no_rightoleft:
End Sub

' returns True if the object has "ToolTipText" property:
Function has_Tooltiptext_property(c As Control) As Boolean
    On Error GoTo no_caption
    
    Dim s As String
    
    s = c.ToolTipText
    
    s = ""
    
    has_Tooltiptext_property = True
    
    Exit Function
no_caption:
    has_Tooltiptext_property = False
End Function



Function get_Tooltiptext_property(c As Control) As String
    On Error GoTo no_tooltip
    
    Dim s As String
    
    s = c.ToolTipText
    
    get_Tooltiptext_property = s
    
    Exit Function
no_tooltip:
    get_Tooltiptext_property = ""
End Function



Function has_LEFT_property(c As Control) As Boolean
    On Error GoTo err_no_such_property
    Dim s1 As Single
    s1 = c.Left
    s1 = 0
    has_LEFT_property = True
    Exit Function
err_no_such_property:
    has_LEFT_property = False
End Function

Function has_TOP_property(c As Control) As Boolean
    On Error GoTo err_no_such_property
    Dim s1 As Single
    s1 = c.Top
    s1 = 0
    has_TOP_property = True
    Exit Function
err_no_such_property:
    has_TOP_property = False
End Function

Function has_WIDTH_property(c As Control) As Boolean
    On Error GoTo err_no_such_property
    Dim s1 As Single
    s1 = c.Width
    s1 = 0
    has_WIDTH_property = True
    Exit Function
err_no_such_property:
    has_WIDTH_property = False
End Function



Function has_HEIGHT_property(c As Control) As Boolean
    On Error GoTo err_no_such_property
    Dim s1 As Single
    s1 = c.Height
    s1 = 0
    has_HEIGHT_property = True
    Exit Function
err_no_such_property:
    has_HEIGHT_property = False
End Function



' Returns "True" when making default language file,
' this enables us to exit from Form_Load event without
' doing much mess...
Function Load_from_Lang_File(frm As Form) As Boolean
On Error GoTo err_llf


    If bMAKING_DEFAULT_LANGUAGE_FILE Then
        Load_from_Lang_File = True  ' set to "True" only when creating default language file.
        Exit Function
    End If


    If Not bMAKE_TRANSLATION Then
        Load_from_Lang_File = False  ' set to "True" only when creating default language file.
        Exit Function
    End If

    If Len(sLangFilename) = 0 Then
        MsgBox "Lang file not set!" & vbNewLine & _
               "Use Set_Lang_File() to set language file first!"
        Exit Function
    End If

    Dim i As Integer
    Dim d As Integer
    Dim fNum As Integer
    Dim s As String
    Dim sProp As String
    ' 3.27w Dim sName As String
    Dim ctrl As Control
    Dim t As Integer
    
    Dim sFORM_NAME As String ' used in reporting the error.
    sFORM_NAME = frm.Name
    
    fNum = FreeFile
    
    Open sLangFilename For Input As fNum
    
        Do Until EOF(fNum) ' LOOP#1
    
            Line Input #fNum, s
            s = Trim(s)
            
            If s = "[---START FORM---]" Then
                Line Input #fNum, s
                s = Trim(s)
                
                If StrComp(s, frm.Name, vbTextCompare) = 0 Then
                
                ' load form's caption:
                Line Input #fNum, s ' check if exists "[CAPTION]".
                If Trim(s) = "[CAPTION]" Then
                    Line Input #fNum, s
                    frm.Caption = s
                    
                    ' 3.27w
                    Line Input #fNum, s
                    s = Trim(s)
                    If s = "[W]" Then         ' in this version of _lang.dat [W] must always be before [H] for forms.
                        Line Input #fNum, s
                        frm.Width = Val(Trim(s))
                        ' ok read the following line...
                        Line Input #fNum, s
                        s = Trim(s)
                    End If
                    If s = "[H]" Then
                        Line Input #fNum, s
                        frm.Height = Val(Trim(s))
                    End If
                Else
                    GoTo no_form_caption
                End If
                
                
                    Do Until EOF(fNum)  ' LOOP#2
read_next:



                        Line Input #fNum, s
no_form_caption:
                        s = Trim(s)


                        If s = "[---END FORM---]" Then GoTo ok_loaded_and_set
                        If s = "[END TEXT]" Then GoTo skip_line
                        If s = "[END TOOLTIP]" Then GoTo skip_line
                        If s = "" Then GoTo skip_line
                        If s = "[--- START CONTROLS ---]" Then GoTo skip_line
                        

                        If s = "[CONTROL NAME]" Then ' if_11a
                            ' read control's name:
                            Line Input #fNum, s
                            s = Trim(s)

                            ' is control array??
                            If endsWith(s, ")") Then
                                Dim sIndex As String
                                Dim lFirstBrackerPos As Long
                                
                                lFirstBrackerPos = InStr(1, s, "(")
                                
                                ' cut off last ")" :
                                s = Mid(s, 1, Len(s) - 1)
                                ' get number after "(":
                                sIndex = Mid(s, lFirstBrackerPos + 1)
                                ' get the name:
                                s = Mid(s, 1, lFirstBrackerPos - 1)
            
                                Set ctrl = frm.Controls(s)(Val(sIndex))
                            Else
                                Set ctrl = frm.Controls(s)
                            End If
                            
                        End If ' if_11a
                        
                        
'''''''''''''''  3.27w major modification

'                Line Input #fNum, s
'                s = Trim(s)

                 ' read control's properties....

                If s = "[TEXT]" Then

                        Line Input #fNum, sProp ' read a property!
                        
                        If Trim(sProp) = "[END TEXT]" Then GoTo skip_line
                        
                    
                        ' #734
                        If has_Font_property(ctrl) Then
                            If iDefaultCharset <> 0 Then ' #327xl-lang#
                                ctrl.Font.Charset = iDefaultCharset
                            End If
                        End If
                        If bRIGHT_TO_LEFT Then
                            if_Possible_set_Right_Align (ctrl)
                            if_Possible_set_RightToLeft (ctrl)
                        End If
                        
                        If TypeOf ctrl Is TextBox Then
                        
                            If ctrl.MultiLine = True Then
                                ' in case property is multilined!
                                Do Until EOF(fNum)
                                    Line Input #fNum, s
                                    If Trim(s) = "[END TEXT]" Then
                                        Exit Do
                                    Else
                                       sProp = sProp & vbNewLine & s
                                    End If
                                Loop
                                
                                ctrl.Text = sProp
                            Else  ' emu8086 BUGFIX 2.07#560  (MagicGlob 1.01)
                            
                                ctrl.Text = sProp
                                Line Input #fNum, s ' skip  "[END TEXT]".
                            End If
                            
                        ElseIf (TypeOf ctrl Is ListBox) Or (TypeOf ctrl Is ComboBox) Then
                            
                            t = 0
                            ctrl.List(t) = sProp
                            
                            Do Until EOF(fNum)
                                Line Input #fNum, s
                                t = t + 1
                                If Trim(s) = "[END TEXT]" Then
                                    Exit Do
                                Else
                                   ctrl.List(t) = s
                                End If
                            Loop
                        
                        ElseIf has_Caption_property(ctrl) Then
                            ctrl.Caption = sProp
                            Line Input #fNum, s ' skip  "[END TEXT]".
                                
                        End If
                        

                    ElseIf s = "[TOOLTIP]" Then ' 3.27w --- allow more then just tool tip...
                        Line Input #fNum, s ' read tooltip text.
                        ctrl.ToolTipText = s
'''                        If Trim(s) <> "[END TOOLTIP]" Then ' some controls may not have this property (for compatibility with older versions of language files).   -- 3.27w   no more problems.
'''                            ctrl.ToolTipText = s
'''                        End If
                    ElseIf s = "[X]" Then ' 3.27w
                        Line Input #fNum, s
                        ctrl.Left = Val(s)
                    ElseIf s = "[Y]" Then
                        Line Input #fNum, s
                        ctrl.Top = Val(s)
                    ElseIf s = "[W]" Then
                        Line Input #fNum, s
                        ctrl.Width = Val(s)
                    ElseIf s = "[H]" Then
                        Line Input #fNum, s
                        ctrl.Height = Val(s)
                    Else
                        ' probably some [END TEXT] or [CONTROLS] or else...
                    
                    End If
                        
                        
skip_line:
                        
                    Loop ' LOOP#2
                    
                    GoTo ok_loaded_and_set
                End If
                
            End If ' probably for "If s = "[---START FORM---]" Then"
    
        Loop ' LOOP#1
        
        ' not found error!
        Debug.Print frm.Name & " - not found in language file!"
        
ok_loaded_and_set:
        
    Close fNum
    
    Load_from_Lang_File = False ' set to "True" only when creating default language file.
    
    Exit Function
err_llf:
    Debug.Print "Load_from_Lang_File:" & sFORM_NAME & " - " & err.Description
    Resume Next  ' 31-july-2003
    
    'Close fnum
    'Load_from_Lang_File = False ' set to "True" only when creating default language file.
End Function

' loads ignore list from the file:
Sub Load_ignore_list()
On Error GoTo err_lil
    
    Dim fNum As Integer
    Dim sFilename As String
    
    iIGNORED_LIST_SIZE = 0
    
    sFilename = Add_BackSlash(App.Path) & sIGNORE_LIST_FILE
    
    If Not FileExists(sFilename) Then Exit Sub
    
    fNum = FreeFile
          
    Open sFilename For Input As fNum
    
    Do While Not EOF(fNum)
        ReDim Preserve sIGNORED_LIST(iIGNORED_LIST_SIZE)
        Line Input #fNum, sIGNORED_LIST(iIGNORED_LIST_SIZE)
        iIGNORED_LIST_SIZE = iIGNORED_LIST_SIZE + 1
    Loop
    
    Close #fNum
    
    
    Exit Sub
err_lil:
    Close #fNum
    MsgBox "Error on load_ignore_list() " & err.Description
End Sub

' This function is used to check if a control should not
' be added to default language file:
Function is_in_ignore_list(c As Control) As Boolean
On Error GoTo err_iiil

    Dim i As Integer
    Dim s As String
    
    s = c.Parent.Name & "." & c.Name
    
   
    For i = 0 To iIGNORED_LIST_SIZE - 1
        
        If LCase(s) Like LCase(sIGNORED_LIST(i)) Then  ' 3.27w - ignore case
            is_in_ignore_list = True
            Exit Function
        End If
        
    Next i

    is_in_ignore_list = False
    
    Exit Function
err_iiil:
    MsgBox "Error on is_in_ignore_list() " & err.Description
End Function

' This function is used to check if a control should not
' be added to default language file.
' I had to create this function in addition to is_in_ignore_list()
' because I wanted to be able to ignore form's caption:
Function is_in_ignore_list_BY_STR(s As String) As Boolean
On Error GoTo err_iiilbs

    Dim i As Integer
  
   
    For i = 0 To iIGNORED_LIST_SIZE - 1
        
        If s Like sIGNORED_LIST(i) Then
            is_in_ignore_list_BY_STR = True
            Exit Function
        End If
        
    Next i

    is_in_ignore_list_BY_STR = False
    
    Exit Function
err_iiilbs:
    MsgBox "Error on is_in_ignore_list_BY_STR() " & err.Description
End Function


Sub SAVE_DEFAULT_MESSAGES()
On Error GoTo err_sdf

    Dim fNum1 As Integer
    Dim fNum2 As Integer
    
    Dim s As String
    
    Dim sSRC_File As String
    sSRC_File = Add_BackSlash(App.Path) & sSOURCE_MESSAGE_FILE
    
    Dim s_MSG_File_VERSION As String
    If FileExists(sSRC_File) Then
        ' the LANG_FILE_VERSION property of _msg.dat and _lang.dat must match!
        s_MSG_File_VERSION = get_property(sSRC_File, "LANG_FILE_VERSION", "")
    Else
        Debug.Print "internal messages file not found: " & sSOURCE_MESSAGE_FILE
        Exit Sub ' EXIT
    End If
    
    ' Open Source Message File:
    fNum1 = FreeFile
    Open sSRC_File For Input As fNum1
    
    ' Open language file:
    fNum2 = FreeFile
    Open sLangFilename For Append As fNum2
        
    s = "LANG_FILE_VERSION=" & s_MSG_File_VERSION & vbNewLine
    Print #fNum2, s
    
    Print #fNum2, "; === for updated default localization file check out this url: http://www.emu8086.com/dr/loc/ " & vbNewLine & vbNewLine
    
    Print #fNum2, "; === it is required to translate text at leftmost position only. names and labels should not be modified." & vbNewLine & vbNewLine
                
    Print #fNum2, "; === numbers may be modified only if it required to increase the size of the control and rearrange " & vbNewLine & _
                 "      the position of the controls (it may not work as expected for some controls if software" & vbNewLine & _
                 "      rearranges them on form resize)." & vbNewLine & vbNewLine

    ' NO MORE! Print #fNum2, ";  note:   ""[""   -  is illegal for the first character for the controls' translated text." & vbNewLine & vbNewLine
                  
    Print #fNum2, ";  note: line numbers must be preserved for the messages." & vbNewLine & vbNewLine
                      
    Print #fNum2, ";  automatic word-wrap must not be used. use plain text editors only or the automated translation tool." & vbNewLine & vbNewLine
  
' NO MORE! only _lang.dat must be distributed!
''    Print #fNum2, ";  _msg.dat file must not be modified in any way, and it is valid for this _lang.dat file only." & vbNewLine & _
''                  ";  these 3 files must be distributed together: _msg.dat (unmodified), _lang.dat, _lang_config.ini " & vbNewLine & vbNewLine
''
    Print #fNum2, ";  if you wish you may include your name and/or email address on top of this file." & vbNewLine
                      
    Print #fNum2, ";  if you decide to translate this file, you may need to update it regularly for new versions of emu8086." & vbNewLine & vbNewLine
 
    Print #fNum2, ";  for more information and updated template visit: http://www.emu8086.com/dr/loc/    " & vbNewLine & vbNewLine & vbNewLine
    
    
    Print #fNum2, "; enable/disable bidirectional support:"
    Print #fNum2, "RIGHT_TO_LEFT=false" & vbNewLine
        
    Print #fNum2, "; character set:"
    Print #fNum2, "CHARSET=0" & vbNewLine & vbNewLine & vbNewLine
    
    
    Print #fNum2, "                                   [---START MESSAGES---]"
    
    ' Go directly to data:
    Do While Not EOF(fNum1)
        Line Input #fNum1, s
        s = Trim(s)
        If s = "[START MESSAGES]" Then Exit Do
    Loop
    
    If EOF(fNum1) Then
        ' [START MESSAGES] not found, so just read
        ' everything from the begining of the file:
        Seek fNum1, 1
    End If
    
    Do While Not EOF(fNum1)
        Line Input #fNum1, s
        Print #fNum2, s
    Loop
        
    Print #fNum2, "                                   [---END MESSAGES---]"
               
    Close fNum1
    Close fNum2
    
    
Exit Sub
err_sdf:
    MsgBox "SAVE_DEFAULT_MESSAGES: " & err.Description

End Sub


' 3.27xa
' this is a modified clone of SAVE_DEFAULT_MESSAGES
Sub SAVE_RESERVED_SPACE()
On Error GoTo err_sdf

    Dim fNum1 As Integer
    Dim fNum2 As Integer
    
    
    Dim s As String
    
    
    Dim sSRC_File As String
    sSRC_File = Add_BackSlash(App.Path) & "_reserved_space_for_lang.dat.txt"

    If FileExists(sSRC_File) Then
        ' ok
    Else
        Debug.Print "file not found: " & sSRC_File
        Exit Sub ' EXIT
    End If

    fNum1 = FreeFile
    Open sSRC_File For Input As fNum1
    
    ' Open language file:
    fNum2 = FreeFile
    Open sLangFilename For Append As fNum2
        
    ' put write pointer to the end of file!
    Dim lF2 As Long
    lF2 = LOF(fNum2)
    Seek fNum2, lF2

    s = vbNewLine & vbNewLine & vbNewLine & vbNewLine & vbNewLine
    Print #fNum2, s
    
    Do While Not EOF(fNum1)
        Line Input #fNum1, s
        Print #fNum2, s
    Loop

    Close fNum1
    Close fNum2
    
    Exit Sub
err_sdf:
    MsgBox "SAVE_RESERVED_SPACE: " & err.Description


End Sub












' This sub loads strings that are used inside the source
' code, generally in error messages. Later
Sub Load_MESSAGE_TRANSLATION()
On Error GoTo err_lmf
    
    Dim fNum As Integer
    Dim s As String
    Dim sFilename As String
    
    iSOURCE_MSG_COUNT = 0
    iTRANSLATED_MSG_COUNT = 0
    
    
    fNum = FreeFile
    
    sFilename = Add_BackSlash(App.Path) & sSOURCE_MESSAGE_FILE
    
    If Not FileExists(sFilename) Then Exit Sub ' no messages.
    
    ' Load Source Message File:
    Open sFilename For Input As fNum
    

        ' Go directly to data:
        Do While Not EOF(fNum)
            Line Input #fNum, s
            If s = "[START MESSAGES]" Then Exit Do
        Loop
    
        If EOF(fNum) Then
            ' [START MESSAGES] not found, so just read
            ' everything from the begining of the file:
            Seek fNum, 1
        End If
    
        Do While Not EOF(fNum)
            Line Input #fNum, s
            ReDim Preserve sSOURCE_MSG(iSOURCE_MSG_COUNT)
            sSOURCE_MSG(iSOURCE_MSG_COUNT) = s
            iSOURCE_MSG_COUNT = iSOURCE_MSG_COUNT + 1
        Loop
        
    Close fNum
    
    fNum = FreeFile
    
    ' Load Translation:
    Open Add_BackSlash(App.Path) & sLANGUAGE_FILE For Input As fNum
        Do While Not EOF(fNum)
            Line Input #fNum, s
            s = Trim(s)
            
            If s = "[---START MESSAGES---]" Then
                Do While Not EOF(fNum)
                    Line Input #fNum, s
                    
                    If Trim(s) = "[---END MESSAGES---]" Then Exit Do ' done!
                    
                    ReDim Preserve sTRANSLATED_MSG(iTRANSLATED_MSG_COUNT)
                    sTRANSLATED_MSG(iTRANSLATED_MSG_COUNT) = s
                    iTRANSLATED_MSG_COUNT = iTRANSLATED_MSG_COUNT + 1
                Loop
            End If
        Loop
    Close fNum
    
    If iSOURCE_MSG_COUNT <> iTRANSLATED_MSG_COUNT Then
        ' MsgBox sSOURCE_MESSAGE_FILE & " and " & sLANGUAGE_FILE & " " & "- these files have unequal number of messages!" & vbNewLine & "please contact the author of the translation." & vbNewLine & vbNewLine & "if you are the author of the translation make sure you do not brake the original line order in _lang.dat file." & vbNewLine & vbNewLine & "for more information and for default transaltion template visit http://www.emu8086.com/dr/loc/", vbOKOnly, "translation error"
        bMAKE_TRANSLATION = False ' 3.27w  DO NOT TRY TO TRASLATE!
        Debug.Print sSOURCE_MESSAGE_FILE & ", " & sLANGUAGE_FILE & " - unequal number of messages!"
    End If
    
    Exit Sub
err_lmf:
    MsgBox "Error on load_MESSAGE_FILES: " & err.Description
    
    Close fNum
End Sub


' This function is used to translate messages,
' "Message Translate", load_MESSAGE_FILES() should
' be called before using this function
Function cMT(sOriginal As String) As String
On Error GoTo err_cmt
    If bMAKE_TRANSLATION Then
        Dim i As Integer
        Dim s As String
        
        
        For i = 0 To iSOURCE_MSG_COUNT - 1
            s = Replace(Trim(sSOURCE_MSG(i)), "\n", vbNewLine)      ' 3.27w
            If StrComp(s, Trim(sOriginal), vbTextCompare) = 0 Then  ' 3.27w
                cMT = Replace(sTRANSLATED_MSG(i), "\n", vbNewLine)  ' 3.27w
                Exit Function
            End If
        Next i
        
        cMT = sOriginal
        Debug.Print "cMT: " & sOriginal & " - not translated!"
    Else
        cMT = sOriginal ' not translating!
    End If
    
    Exit Function
err_cmt:
    Debug.Print "Error on cMT: " & sOriginal & " " & err.Description
    cMT = sOriginal
End Function


' #734
'  Charset         =   204       - russian
'  Charset         =   177       - hebrew
'  Charset         =   0         - western
'  Charset         =   238       - central european

Sub Load_LANG_PROPERTIES()
On Error GoTo err_lcn
    
   ' obsolete ' sFileName = Add_BackSlash(App.Path) & "_charset.dat"
    
    iDefaultCharset = Val(get_property("_lang.dat", "CHARSET", "0"))
        
    Dim s As String
    s = LCase(get_property("_lang.dat", "RIGHT_TO_LEFT", "false"))
    If s = "true" Or s = "1" Or s = "yes" Then
        bRIGHT_TO_LEFT = True
    Else
        bRIGHT_TO_LEFT = False
    End If
        
        
    Exit Sub
err_lcn:
    
    Debug.Print "Load_LANG_PROPERTIES: " & err.Description
    
End Sub


' currently nothing is illegal
Private Function remove_illigal_for_translated(sINPUT As String) As String
        remove_illigal_for_translated = sINPUT
End Function


Sub FREE_MEM_CLANG()
On Error GoTo err1

    Erase sSOURCE_MSG
    Erase sTRANSLATED_MSG
    Erase sIGNORED_LIST
    
    Exit Sub
err1:
    Debug.Print "clang free mem: " & err.Description
End Sub

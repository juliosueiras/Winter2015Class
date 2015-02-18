Attribute VB_Name = "mColorMemList"

'    =======================================
'      Colored ListBox Control
'             with Horizontal Scroll
'
'      List box supports up to 16 colors!
'
'          Pure Visual Basic Code!
'
'       Version 1.00
'    =======================================
'
'    Visit my Homepage:
'    http://www.geocities.com/emu8086/vb/
'
'
'    Last Update: Friday, July 12, 2002
'
'
'    Copyright 2002 Alexander Popov Emulation Soft.
'               All rights reserved.
'        http://www.geocities.com/emu8086/


'=======================================
' SUPPORTED COLOR CODES:
'
'   0   Black
'   1   Blue
'   2   Green
'   3   Cyan
'   4   Red
'   5   Magenta
'   6   Yellow
'   7   White
'   8   Gray
'   9   Light Blue
'   A   Light Green
'   B   Light Cyan
'   C   Light Red
'   D   Light Magenta
'   E   Light Yellow
'   F   Bright White
'
'  To use color code add it just after
'  the "\" sign, for example:
'     \CHi
'  This will give the
'   word "Hi" a Light Red color.
'=======================================

Option Explicit

Option Base 0

Dim parentForm As Form

' ===== list properties ============:
Dim strLIST() As String
Public iListCount As Integer

Dim iTopIndex As Integer
Public iListIndex As Integer

Dim iHorScrollVal As Integer

' visible area:
Dim iWorkingWidth As Integer
Dim iWorkingHeight As Integer

Dim iCharWidth As Integer
Dim iCharHeight As Integer

Const COLOR_DEFAULT = vbBlack
Const COLOR_SELECTOR = 9895935 ' RGB(255, 255, 150)
'=====================================


Public Sub set_parentForm(f As Form)
    Set parentForm = f
End Sub

' returns the item without any
' color info
Public Function getItem(Index As Long) As String
On Error GoTo err_gi
       getItem remove_ALL_COLOR_DATA(strLIST(Index))
       Exit Function
err_gi:
    Debug.Print "getItem: " & Err.Description
End Function


Public Sub setItem(Index As Long, sValue As String)
On Error GoTo err_si
    strLIST(Index) = sValue
    updateList
    Exit Sub
err_si:
    Debug.Print "setItem: " & Err.Description
End Sub


Public Sub clearList()

    Erase strLIST
    
    iListCount = 0
    
    iTopIndex = 0
    
    iListIndex = -1
    
'    lblSelectInfo.Caption = "                   "
    
    parentForm.scrollV.Max = 0
    
    parentForm.scrollH.Max = 0
    
    ResizeMe
    
    updateList
    
    
    ' Assumed that we are using fixed font:
    iCharWidth = parentForm.picList.TextWidth("W")
    iCharHeight = parentForm.picList.TextHeight("W")
    
End Sub

Public Sub AddItem(sItem As String)
Dim iTW As Integer
Dim iSC As Integer
Dim sTEMP As String
Dim i As Integer

    ReDim Preserve strLIST(0 To iListCount)
    
    strLIST(iListCount) = sItem
    
    iListCount = iListCount + 1

    parentForm.scrollV.Max = iListCount

    sTEMP = remove_ALL_COLOR_DATA(sItem)

    iTW = parentForm.picList.TextWidth(sTEMP)
    
    If iWorkingWidth < iTW Then
    
        iSC = iTW - iWorkingWidth
                
        i = iSC / iCharWidth
        
        If (iSC Mod iCharWidth) > 0 Then iSC = 1  ' remainder converted to full char.

        iSC = iSC + i

        If iSC > parentForm.scrollH.Max Then
            parentForm.scrollH.Max = iSC
        End If
        
    End If

    updateList
    
End Sub

Private Sub updateList()
Dim i As Integer
Dim s As String

    parentForm.picList.Cls
    
    For i = iTopIndex To iListCount - 1
    
        s = strLIST(i)
        
        parentForm.picList.CurrentX = -iHorScrollVal * iCharWidth
        
        ' for some reason, the horizontal scroll doesn't do
        ' its work nice without it:
        If iHorScrollVal > 0 Then
            parentForm.picList.CurrentX = parentForm.picList.CurrentX - iCharWidth
        End If
        
        If i = iListIndex Then
            draw_SELECTOR
        End If
        
        print_in_COLOR s
    
        ' no need to print items that aren't visible:
        If parentForm.picList.CurrentY > iWorkingHeight Then
            ' Debug.Print "stopped at: " & strLIST(i)
            Exit For
        End If
    
    Next i

    draw_BOX
    
End Sub

Private Sub print_in_COLOR(sExpr As String)

Dim l As Long
Dim lExprLen As Long
Dim s As String
Dim c As String

lExprLen = Len(sExpr)

s = ""
l = 1  ' string starts at index 1.

parentForm.picList.ForeColor = COLOR_DEFAULT

Do While l <= lExprLen

    c = Mid(sExpr, l, 1)
    
    If c = "\" Then
        
        If Len(s) > 0 Then
            parentForm.picList.Print s;
            s = ""
        End If
        
        
        l = l + 1
        c = Mid(sExpr, l, 1) ' get color code.
        
        If c = "\" Then
            parentForm.picList.Print "\";
        Else
            parentForm.picList.ForeColor = QBColor(Val("&H" & c))
        End If
        
    Else
    
        s = s & c
        
    End If

    l = l + 1
    
Loop

If Len(s) > 0 Then
    parentForm.picList.Print s
Else
    parentForm.picList.Print   ' just new line.
End If

End Sub


' this function parses the string the same way as
' print_in_COLOR() does, and returns string without any
' controlling characters:
Private Function remove_ALL_COLOR_DATA(sExpr As String) As String

Dim l As Long
Dim lExprLen As Long
Dim s As String
Dim c As String
Dim sRESULT As String

lExprLen = Len(sExpr)

sRESULT = ""
s = ""
l = 1  ' string starts at index 1.

Do While l <= lExprLen

    c = Mid(sExpr, l, 1)
    
    If c = "\" Then
        
        If Len(s) > 0 Then
            sRESULT = sRESULT & s
            s = ""
        End If
        
        l = l + 1
        
        c = Mid(sExpr, l, 1) ' get color code.
        
        If c = "\" Then
            sRESULT = sRESULT & "\"
        End If
        
    Else
    
        s = s & c
        
    End If

    l = l + 1
    
Loop

If Len(s) > 0 Then sRESULT = sRESULT & s


remove_ALL_COLOR_DATA = sRESULT

End Function



Private Sub scrollH_Change()
    scrollH_Scroll
End Sub

Private Sub scrollH_Scroll()
    iHorScrollVal = parentForm.scrollH.Value
    updateList
End Sub

Private Sub scrollV_Change()
    scrollV_Scroll
End Sub

Private Sub scrollV_Scroll()
    iTopIndex = parentForm.scrollV.Value
    updateList
End Sub




Private Sub picList_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim iTEMP As Integer

iTEMP = Fix(Y / iCharHeight)

iTEMP = iTEMP + iTopIndex

If iTEMP < iListCount Then

    iListIndex = iTEMP

    ' lblSelectInfo.Caption = " Selected Item: " & iListIndex & " "
    
    updateList
    
End If

End Sub

' selection also works when mouse is moving while
' left button is pressed:
Private Sub picList_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = vbLeftButton Then
        picList_MouseDown Button, Shift, X, Y
    End If
End Sub

' Draws little box in the right
' lower corner between scroll bars:
Private Sub draw_BOX()
    parentForm.picList.Line (parentForm.scrollH.Width, parentForm.scrollV.Height)-(parentForm.picList.ScaleWidth, parentForm.picList.ScaleHeight), vb3DFace, BF
End Sub

' Draws item selector of selected
' list item:
Private Sub draw_SELECTOR()
    Dim fORIG_cX As Single
    Dim fORIG_cY As Single
    
    ' remember original current X/Y:
    fORIG_cX = parentForm.picList.CurrentX
    fORIG_cY = parentForm.picList.CurrentY
    
    parentForm.picList.Line (0, fORIG_cY)-(iWorkingWidth, fORIG_cY + iCharHeight), COLOR_SELECTOR, BF
    
    ' restore original current X/Y:
    parentForm.picList.CurrentX = fORIG_cX
    parentForm.picList.CurrentY = fORIG_cY
End Sub

Public Sub ResizeMe()
    parentForm.scrollH.Top = parentForm.picList.ScaleHeight - parentForm.scrollH.Height
    parentForm.scrollH.Left = 0
    parentForm.scrollH.Width = parentForm.picList.ScaleWidth - parentForm.scrollH.Height
    
    parentForm.scrollV.Top = 0
    parentForm.scrollV.Left = parentForm.picList.ScaleWidth - parentForm.scrollV.Width
    parentForm.scrollV.Height = parentForm.picList.ScaleHeight - parentForm.scrollV.Width
    
    iWorkingWidth = parentForm.picList.ScaleWidth - parentForm.scrollH.Height
    iWorkingHeight = parentForm.picList.ScaleHeight - parentForm.scrollV.Width
    
    draw_BOX
End Sub

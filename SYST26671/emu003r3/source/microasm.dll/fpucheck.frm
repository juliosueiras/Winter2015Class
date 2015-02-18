VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   1140
      Left            =   660
      TabIndex        =   0
      Top             =   990
      Width           =   2430
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' http://planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=3818&lngWId=1

'**************************************
' Name: Check a processor for the Pentiu
'     m FPU flaw(#2)
' Description:This is a different versio
'     n of the FPU bug checker. The FPU bug ma
'     y be present in systems running a 586(Pe
'     ntium 1) processor. This checks and tell
'     s you if the bug is present.
' By: Brandon Burr
'
' Returns:False if system is fine, True
'     if the bug is found
'
'This code is copyrighted and has' limited warranties.Please see http://w
'     ww.Planet-Source-Code.com/vb/scripts/Sho
'     wCode.asp?txtCodeId=3818&lngWId=1'for details.'**************************************





Private Sub Command1_Click()
MsgBox Check4FPUBug
End Sub

Function Check4FPUBug() As Boolean

    Dim Buggie As Integer
    Buggie = 5505001 / 295911


    If Buggie = 18.66665197 Then
        Check4FPUBug = False
    ElseIf Buggie = 18.66600093 Then
        Check4FPUBug = True
    End If

End Function

VERSION 5.00
Begin VB.Form frmAssemble_ALL_IN_DIR 
   Caption         =   "Assemble All Files in Dir"
   ClientHeight    =   5175
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3420
   LinkTopic       =   "Form1"
   ScaleHeight     =   5175
   ScaleWidth      =   3420
   StartUpPosition =   3  'Windows Default
   Begin VB.FileListBox fileBox1 
      Height          =   4965
      Left            =   15
      Pattern         =   "*.asm"
      TabIndex        =   0
      Top             =   30
      Width           =   3210
   End
End
Attribute VB_Name = "frmAssemble_ALL_IN_DIR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' #400b8-fast-examples-check#

Option Explicit





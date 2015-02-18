VERSION 5.00
Begin VB.Form frmTest_FILE_DATE_TIME_CHANGE 
   Caption         =   "Form1"
   ClientHeight    =   6060
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7185
   LinkTopic       =   "Form1"
   ScaleHeight     =   6060
   ScaleWidth      =   7185
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "shell execute?"
      Height          =   990
      Left            =   4710
      TabIndex        =   6
      Top             =   2415
      Width           =   2340
   End
   Begin VB.TextBox Text4 
      Height          =   1425
      Left            =   225
      MultiLine       =   -1  'True
      TabIndex        =   5
      Text            =   "frmTest_FILE_DATE_TIME_CHANGE.frx":0000
      Top             =   4380
      Width           =   4170
   End
   Begin VB.TextBox Text3 
      Height          =   1425
      Left            =   195
      MultiLine       =   -1  'True
      TabIndex        =   4
      Text            =   "frmTest_FILE_DATE_TIME_CHANGE.frx":0008
      Top             =   2790
      Width           =   4170
   End
   Begin VB.TextBox Text2 
      Height          =   1425
      Left            =   180
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "frmTest_FILE_DATE_TIME_CHANGE.frx":0010
      Top             =   1035
      Width           =   4170
   End
   Begin VB.TextBox Text1 
      Height          =   480
      Left            =   135
      TabIndex        =   2
      Text            =   "filedate.gif"
      Top             =   135
      Width           =   5250
   End
   Begin VB.CommandButton Command2 
      Caption         =   "get set"
      Height          =   930
      Left            =   4710
      TabIndex        =   1
      Top             =   1335
      Width           =   2280
   End
   Begin VB.CommandButton Command1 
      Caption         =   "close"
      Height          =   915
      Left            =   4710
      TabIndex        =   0
      Top             =   3585
      Width           =   2265
   End
End
Attribute VB_Name = "frmTest_FILE_DATE_TIME_CHANGE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub Command1_Click()

   Unload Me
   
End Sub


Private Sub Command2_Click()

  'variables required
   Dim hFile As Long
   Dim fName As String
   Dim tmp As String
   
  'structures required
   Dim OFS As OFSTRUCT
   Dim SYS_TIME As SYSTEMTIME
   Dim FT_CREATE As FILETIME
   Dim FT_ACCESS As FILETIME
   Dim FT_WRITE As FILETIME
   Dim NEW_TIME As FILETIME
    
  'assign the textbox entry to the filename
   fName = (Text1)
   
  'open the file
   hFile = OpenFile(fName, OFS, OF_READWRITE)
   
  'get the FILETIME info for the created,
  'accessed and last write info
   Call GetFileTime(hFile, FT_CREATE, FT_ACCESS, FT_WRITE)
      
  '----- debug only ---------------------------
  'show the system time info
   tmp = "Date Created:" & vbTab & GetFileDateString(FT_CREATE) & vbCrLf
   tmp = tmp & "Last Access:" & vbTab & GetFileDateString(FT_ACCESS) & vbCrLf
   tmp = tmp & "Last Modified:" & vbTab & GetFileDateString(FT_WRITE)
   Text2.Text = tmp
  '--------------------------------------------
  
  'obtain the local system time
  '(adjusts for the GMT deviation
  'of the local time zone)
   GetLocalTime SYS_TIME
   
  '----- debug only ---------------------------
  'show the system time info
   tmp = ""
   tmp = "Day:" & vbTab & SYS_TIME.wDay & vbCrLf
   tmp = tmp & "Month:" & vbTab & SYS_TIME.wMonth & vbCrLf
   tmp = tmp & "Year:" & vbTab & SYS_TIME.wYear & vbCrLf
   tmp = tmp & "String:" & vbTab & GetSystemDateString(SYS_TIME)
   Text3.Text = tmp
  '--------------------------------------------
     
  'convert the system time to a valid file time
   Call SystemTimeToFileTime(SYS_TIME, NEW_TIME)
   
     
  'set the created, accessed and modified dates all
  'to the new dates.  A null (0&) could be passed as
  'any of the NEW_TIME parameters to leave that date unchanged.
   Call SetFileTime(hFile, NEW_TIME, NEW_TIME, NEW_TIME)
   
  're-read the updated FILETIME info for the created,
  'accessed and last write info
   Call GetFileTime(hFile, FT_CREATE, FT_ACCESS, FT_WRITE)
      
  '----- debug only ---------------------------
  'show the system time info
   tmp = "New Date Created:" & vbTab & GetFileDateString(FT_CREATE) & vbCrLf
   tmp = tmp & "New Last Access:" & vbTab & GetFileDateString(FT_ACCESS) & vbCrLf
   tmp = tmp & "New Last Modified:" & vbTab & GetFileDateString(FT_WRITE)
   Text4.Text = tmp
  '--------------------------------------------
   
  'clean up by closing the file
   Call CloseHandle(hFile)

End Sub


Private Sub Command3_Click()

    Dim SEI As SHELLEXECUTEINFO
    
   'Fill in the SHELLEXECUTEINFO structure
   'and call the ShellExecuteEx API
    With SEI
        .cbSize = Len(SEI)
        .fMask = SEE_MASK_NOCLOSEPROCESS Or _
                 SEE_MASK_INVOKEIDLIST Or _
                 SEE_MASK_FLAG_NO_UI
        .hwnd = Me.hwnd
        .lpVerb = "properties"
        .lpFile = (Text1)
        .lpParameters = vbNullChar
        .lpDirectory = vbNullChar
        .nShow = 0
        .hInstApp = 0
        .lpIDList = 0
    End With
    
   'call the API
    Call ShellExecuteEx(SEI)

End Sub


Private Function GetFileDateString(CT As FILETIME) As String

  Dim ST As SYSTEMTIME
  Dim ds As Single
  
 'convert the passed FILETIME to a
 'valid SYSTEMTIME format for display
  If FileTimeToSystemTime(CT, ST) Then
     ds = DateSerial(ST.wYear, ST.wMonth, ST.wDay)
     GetFileDateString = Format$(ds, "DDDD MMMM D, YYYY")
  Else
     GetFileDateString = ""
  End If

End Function


Private Function GetSystemDateString(ST As SYSTEMTIME) As String

  Dim ds As Single
  
  ds = DateSerial(ST.wYear, ST.wMonth, ST.wDay)
  
  If ds Then
     GetSystemDateString = Format$(ds, "DDDD MMMM D, YYYY")
  Else
     GetSystemDateString = "error!"
  End If

End Function





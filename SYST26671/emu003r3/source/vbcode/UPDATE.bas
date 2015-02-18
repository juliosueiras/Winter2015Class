Attribute VB_Name = "UPDATE"
Option Explicit


'======================================================================================

' 4.07m
' starting from 4.07m - we return to automatical 2 week trial period calculation.
' long cdate value for fixed date, zero for automatic calculation.
Global Const lTRIAL_END As Long = 0       ' ? cdate(LONG VALUE) = 2008-11-01

'  trial days before starting to nag.
Global Const lCONST_TRIAL_DAYS As Long = 14
                                                     
' from console can use     ? clng(cdate("[month]/[day]/[year]"))
' to get exect number that should be used as trial end.
                                                      
'======================================================================================

' FOR REGNOW   SET   FALSE, TRUE
' FOR UPDATE   SET   FALSE, FALSE
' FOR DEMO     SET   FALSE, FALSE

' do not allow unlock
Global Const bNO_UNLOCK As Boolean = False ' v4.07m - False for all builds

' if true "Enter Registration Code" button is clearly visible on startup and frmStartUp is always show even if demo period not expired.
Global Const bFOR_REGNOW As Boolean = False


'======================================================================================
'======================================================================================


' 4.07m
'' 2007-10-29
'Global Const bUPDATE_VER As Boolean = True



'TODO!! BRR!!! seem to make some real mess in "about window", check it later!!
' #327xl-softpass# - if true no registration boxes of my own appear, the executable is wrapped by ardemalino.
Global Const bSOFTWARE_PASSPORT As Boolean = False


Global Const sVER_SFX As String = "" ' "-BETA-IX"
' 2007-10-29  Global Const DEFAULT_sBUILD As String = "normal"  ' 2007-10-29 NO LONGER is changed by INNO SETUP!
Global Const DEFAULT_RELEASE As String = "39384"  ' 2007.10.29


' #400b3-extensions#
Global Const sALL_KNOWN_FILE_TYPES As String = "all known files (*.asm, *.exe, *.com, *.bin, *.boot)|*.asm;*.exe;*.exe_;*.com;*.com_;*.bin;*.bin_;*.boot|assembly source files (*.asm)|*.asm|binary executable files (*.com)|*.com;*.com_|executable files (*.exe)|*.exe;*.exe_|binary files (*.bin)|*.bin;*.bin_|old boot sector files (*.boot)|*.boot|all files (*.*)|*.*"





' 4.00-Beta-3
''''
''''' the version suffix is kept in "emu8086.ini", this way I can update the package version without recompiling the file.
''''Global sVER_SFX As String ' #1133  - version suffix, for example 3.25d  , the sVER_SFX="d"
''''

' #327xo-allow-change# '
''''''' keeps the sizes of all files in c:\emu8086\examples\, to allow their execution without nags (even if unregistered)
''''''' and keep these examples from curruption (by accident resaving over wrong code)
''''''Global sFile_examples_BYTE_SIZES As String '#1127b




' 2005-07-18
' making it better, because this string is offen checked in msg box after it is shown
' 2007-10-28 changes to text.
Global Const sPROGRAM_TERMINATED As String = "PROGRAM HAS RETURNED CONTROL" & vbNewLine & "TO THE OPERATING SYSTEM" ' "the program has terminated." ' "PROGRAM TERMINATED!"
Global Const sEMULATOR_HALTED As String = "the emulator is halted." ' 3.27s "emulator has been halted successfully." ' "Emulator Halted!"

'#1194x2
Global Const sPROGRAM_ABNORMALLY_TERMINATED As String = "program terminated." ' 3.27s "program abnormally terminated."
Global bEMULATOR_STOPED_ABNORMALLY As Boolean


' should be set "TRUE" for rigth to left languages.
' moved to CLang2 ' Global bRIGHT_TO_LEFT As Boolean


Global Const sUPDATE_SITE_URL = "http://www.emu8086.com/update/"
Global sUPDATE_URL_FILENAME As String ' is set on Main() in mStart.bas

''=====================================
'' REGULAR BUILD - ENGLISH:

' April 10, 2004 - v2.58  Public Const gRegURL = "register.html" ' "http://www.emu8086.com/register.html"
Public Const gRegFILE = "register.html"  ' 3.27xm   '  gRegURL = "http://www.emu8086.com/register.html" ' 2.57 (online help update) 29-01-2005
' Public Const gRegURL = "https://www.regnow.com/softsell/nph-softsell.cgi?item=2189-7"  ' April 05, 2004

' set gHelpURL to "" to open HDD help file
' 2005-04-20 making it shorter' Public Const gHelpURL = "http://www.emu8086.com/assembly_language_tutorial_assembler_reference/" '2005-03-01 TODO#1002 ' "http://www.ziplib.com/emu8086help/"  ' NEW TO 2.57 (online help update) 29-01-2005 (set to "" to open HDD help file).
' #1033 back to HDD! ' Public Const gHelpURL = "http://www.emu8086.com/dr/"
' #1100 back online :) Public Const gHelpURL = ""
' 3.27xm ' Public Const gHelpURL = "http://www.emu8086.com/dr/" '#1100 ' MUST END WITH '/'
'Global Const ONLINE_HELP_BASE_URL = "http://www.emu8086.com/dr/" ' 3.27xm
'Global sDocumentation_URL_PATH As String ' 3.27xm ' MUST END WITH '/'(internet) or '\' (local)


' In original English version it's "" always,
' but in Custom Builds this value is added as suffix to
' the end of sUPDATE_URL_FILENAME:
'#1133b Global Const sUPDATE_FILENAME_CUSTOMBUILD_SUFFIX As String = "" ' TODO, for custom builds....
' it was never used, previosly there were fixed urls, as far as I remeber.


Global Const sABOUT_URL As String = "www.emu8086.com" ' http:// is added automatically when required!
Global Const sABOUT_EMAIL As String = "info@emu8086.com"
Global Const sSTARTUP_LINK As String = "www.emu8086.com" ' http:// is added automatically when required!


Global RELEASE_DATE As Long ' ; days from december 30, 1899
Global UPDATE_CHECK As Long
' Public Const CRY_TO_UPDATE = 38594 ' 999999 ' year 4637, November 25 :)   (it could be 1 day less)
' use Year(), Month() and Day() functions to see what day is it.
''================================================



' 2007-10-29   seting back to constants
''''' if true "Enter Registration Code" button
''''' is clearly visible on startup and frmStartUp is always show
''''' if unregistered!
''''' this is no longer a constant
''''Global bFOR_REGNOW As Boolean
''''' 2007-10-29   Global sBUILD As String
''''
''''' #327xl-softpass# - if true no registration boxes of my own appear, the executable is wrapped by ardemalino.
''''Global bSOFTWARE_PASSPORT As Boolean


' sBUILD=normal
'this build does not show "Enter registration key...." button initially.
'but it starts to show this button after 15 days...
'
'
'
'
' sBUILD=regnow
'this build shows "Enter registration key" button on startup.
'it is uploaded to regnow files, both for CD-ROM and download of emu8086 product.
'
'

' 3.27w taking CLang2 it back!
'''' obsolete! used for compatibility (lazy to remove it everywhere).
'''' to replace magic glob and not do a lot of work
'''' #1159
'''Function cMT(s As String) As String
'''    cMT = s
'''End Function



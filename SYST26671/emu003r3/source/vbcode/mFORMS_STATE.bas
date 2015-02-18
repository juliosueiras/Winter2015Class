Attribute VB_Name = "mFORMS_STATE"

'

'

'



' 2.03
' this module contains flag variables
' that say if some form is loaded
' or not.

' there are several such flags in
' different modules also, I just decided
' to make some order after I found bug#518

Option Explicit

Global b_LOADED_frmDOS_FILE As Boolean

Global b_LOADED_frmStack As Boolean

Global b_LOADED_ALU As Boolean

Global b_LOADED_frmFPU As Boolean

Global b_LOADED_frmFLAGS As Boolean

'Global b_LOADED_frmOrigCode As Boolean

Global b_LOADED_frmScreen As Boolean

Global b_LOADED_frmMemory As Boolean

Global b_LOADED_frmASCII_CHARS As Boolean

Global b_LOADED_frmStopOnCondition As Boolean

Attribute VB_Name = "mINT_VECT_ROMWRITER"

' this is internal module,
' it is used on development stage only from VB interface
' to update :
' D:\yur7\emu8086\Files\INT_VECT
' and
' D:\yur7\emu8086\Files\BIOS_ROM

' v 3.27s
' we are adding int 33h.
' subprogram location: F400:0300
' call write_byte_at_offset("D:\yur7\emu8086\Files\INT_VECT",&h33*4,     0)
' call write_byte_at_offset("D:\yur7\emu8086\Files\INT_VECT",&h33*4+1,   3)
' call write_byte_at_offset("D:\yur7\emu8086\Files\INT_VECT",&h33*4+2,   0)
' call write_byte_at_offset("D:\yur7\emu8086\Files\INT_VECT",&h33*4+3,&hf4)

' the sub-program: FFFF CD33 CF
' call write_byte_at_offset("D:\yur7\emu8086\Files\BIOS_ROM",&h300,  &hff)
' call write_byte_at_offset("D:\yur7\emu8086\Files\BIOS_ROM",&h300+1,&hff)
' call write_byte_at_offset("D:\yur7\emu8086\Files\BIOS_ROM",&h300+2,&hcd)
' call write_byte_at_offset("D:\yur7\emu8086\Files\BIOS_ROM",&h300+3,&h33)
' call write_byte_at_offset("D:\yur7\emu8086\Files\BIOS_ROM",&h300+4,&hcf)


Option Explicit

Sub write_byte_at_offset(sFilename As String, lOffset As Long, byteDATA As Byte)
    
    Open sFilename For Random As #1 Len = 1
        
        ' vb counts bytes from 1!
        Put #1, lOffset + 1, byteDATA
        
    Close #1
    
End Sub

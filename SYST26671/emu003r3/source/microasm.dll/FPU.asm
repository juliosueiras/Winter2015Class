#fasm#

org 100h

pushf
cli 

mov bx, mem94
fsave [bx]

finit

fld dword [mem4r]
     
fadd dword [mem4r]     


mov bx, mem94
frstor [bx]  
  
popf  
     
ret


mem4r dd 5.0

mem94 db 94 dup(' ')



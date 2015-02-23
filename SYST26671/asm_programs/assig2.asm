; Print Name and Courses Name on screen
ORG 100h

JMP START ; Jump to Start function in line 8

msg db "Julio Tain Sueiras, Computer Archtitacture $" ; store the string as a variable call msg P.S. dollar sign for termination symbol

START:
    MOV DX,OFFSET msg ; mov msg(the string) to DX offset register
    MOV AH,09h        ; mov 9(hex) to AH register (to use with interrupt)
    INT 21h           ; send interrupt 21h/09h which print a string that is store in DS:DX 

RET

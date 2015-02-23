; 2010 * ( 1004 * 2)
ORG 100h

    MOV AX,1004; place 1004 in AX
    ADD AX,AX; multiply by 2(sort of)
    MOV DX,2010    ; place 2010 in DX
    MUL DX   ; multiply DX and AX and store at AX in the format of DX:AX(003D 95F0)   

HLT

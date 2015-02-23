; (4+100)+(4-5)+35
ORG 100h

    MOV BX,4    ; place 4 in BX
    MOV AX,100  ; place 100 in AX
    MOV CX,-5    ; place -5 in CX
    ADD AX,BX   ; add AX and BX and place it in AX
    ADD CX,BX   ; add BX to CX and place it in BX
    ADD AX,CX   ; add BX to AX and place it in AX
    ADD AX,35   ; add 35 in to AX content and place it in AX

HLT

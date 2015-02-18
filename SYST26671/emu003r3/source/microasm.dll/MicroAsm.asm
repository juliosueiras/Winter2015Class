; cloned from: DLL creation example
     
     
; lEA_TAB   is 0 to 7  or an actuall byte the follows the opcode.     
            
            
            
format PE GUI 4.0 DLL
entry DllEntryPoint


include 'win32a.inc'

; CRASHES VB ; section '.code' code readable executable   
section '.code' code writeable executable


; to keep FPU state
ORIG_87_STATE_94bytes  db 94 dup(' ')
db "            emu8086               microprocessor emulator    "   ; jic buffer :)
db "                                         "
  
  



proc DllEntryPoint hinstDLL,fdwReason,lpvReserved
	mov	eax,TRUE
	ret
endp


; it appears that we get "dll not found" message in VB if this sub does not exist:
; so we'll keep it, maybe it'll be useful one day too :)
proc ShowErrorMessage hWnd,dwError
  local lpBuffer:DWORD
	lea	eax,[lpBuffer]
	invoke	FormatMessage,FORMAT_MESSAGE_ALLOCATE_BUFFER+FORMAT_MESSAGE_FROM_SYSTEM,0,[dwError],LANG_NEUTRAL,eax,0,0
	invoke	MessageBox,[hWnd],[lpBuffer],NULL,MB_ICONERROR+MB_OK
	invoke	LocalFree,[lpBuffer]
	ret
endp


; VOID ShowLastError(HWND hWnd);

proc ShowLastError hWnd
	invoke	GetLastError
	stdcall ShowErrorMessage,[hWnd],eax
	ret
endp


; just a test function and copyright message :)
proc Copyright_emu8086 par1
	mov eax, 0FFFFFFFFh
	xor [par1], eax
	ret                          
	db "                                                             "
	db "             Copyright emu8086.com        All rights reserved       "
	db "                                                             "
endp





; 32 bits (Long/DWORD) max value: 4,294,967,295 = ~ 4 GB of adressable memory....
; just a test fucntion
proc MicroAsm_T par1,par2              ; does PUSH BP   // MOV BP, SP  ->>  55 89 E5   (probably it's EBP).	 	
    ;local tEDX:DWORD,   tEBX:DWORD
	mov [tEDX], edx   ; jic...
	mov [tEBX], ebx
     

; I love VB :)
;XOR ECX,ECX             ;set ecx to zero
;DIV ECX                 ;divide by zero, causing exception	
	
     
     
    xor	eax, eax
	
	mov ebx, [par1]      ; pointer to pointer... seems like [EBP + 8]
	mov eax, [ebx]
	
	mov	ebx, [par2]  ; [EBP + 12]
	mov	edx, [ebx]
	
	add	eax, edx    ; return is in EAX  (Long)
	
	mov dword [ebx], 0FFh  ; modifying ByRef paremeter...
	
	mov edx, [tEDX]
	mov ebx, [tEBX]	  
	
	
     	
	ret 
	tEDX dd 0
	tEBX dd 0
endp
          
  
  

;  
;  
;; NOT USED!
;; DD /6     FSAVE mem94     mem94 := 87 state
;proc MicroAsm_GETSTATE_94 param 
;	push ebx  ; jic
;	mov ebx, [param]   ; pointer to pointer
;    FSAVE [ebx]                      
;    pop ebx
;    xor eax, eax   ; return 
;	ret	
;endp
;
;
;; NOT USED!
;; DD /4     FRSTOR mem94    87 state := mem94
;proc MicroAsm_SETSTATE_94 param
;	push ebx  ; jic
;	mov ebx, [param]   ; pointer to pointer
;    FRSTOR [ebx]                      
;    pop ebx                    
;    xor eax, eax   ; return 
;	ret	
;endp
;  
;   
;   
   




; DB E3     FINIT           initialize 87  
proc MicroAsm_FINIT virtual87state_94bytes   
    local tEBX:DWORD
	pushf
	; cli      
    
	mov [tEBX], ebx ; jic
	

	mov ebx,ORIG_87_STATE_94bytes
	FSAVE [ebx] 
    fwait
    

; I love VB :)
;XOR ECX,ECX             ;set ecx to zero
;DIV ECX                 ;divide by zero, causing exception	
; ///  it crashed here? ///
;  cli	
    

; See also Chapter 5, Interrupt and Exception Handling, in the IA-32
; Intel Architecture Software Developer's Manual, Volume 3, 
     
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
    
    FINIT  ; jic...
    
    ; don't know why it crashed around here a few times
    ; (vb handling did not help), but now it works... 
    ; probably it was because we declared Global/Public/Form variables instead of locals.
    ; ' global declaration -> CRASH
    ; ''''' Dim FPU_STATE_94bytes As fpu87_STATE
                    
                
              	      
	;mov ebx, [virtual87state_94bytes]  ; pointer to pointer       
	FRSTOR [ebx]
	fwait
	         
    ;;;;;;;;;;;;;;;;;;;;;
	      
	FINIT            ; initialise virutual FPU
	fwait
	
	;;;;;;;;;;;;;;;;;;;;;
	 
    ; get newly initialisied FPU state
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer      
	FSAVE [ebx]  
	fwait
	
	
	FCLEX
	  
          
    ; restore....      
	mov ebx,ORIG_87_STATE_94bytes 
	FRSTOR [ebx] 
    fwait      
    
    
	mov ebx, [tEBX]    
        
    
    mov eax, 7  
    
    popf
    
	ret  
endp
	



	    
	







         
proc MicroAsm_D8_TAB lEA_TAB, mem4r, virtual87state_94bytes
    local tEBX:DWORD, tESI:DWORD
	pushf
	;cli 
	    
    
	mov [tEBX], ebx ; jic 
	mov [tESI], esi ; jic
	   
	
	mov ebx,ORIG_87_STATE_94bytes
	FSAVE [ebx] 
    fwait
           	      
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer       
	FRSTOR [ebx]
	fwait
	
	mov ebx, [lEA_TAB]      ; pointer to pointer
	mov esi, [mem4r]        ; pointer to pointer   
    
      
	mov eax, [ebx] 	
    cmp eax, 0
    je  D8_0  
    cmp eax, 1
    je  D8_1
    cmp eax, 2
    je  D8_2
    cmp eax, 3
    je  D8_3
    cmp eax, 4
    je  D8_4
    cmp eax, 5
    je  D8_5
    cmp eax, 6
    je  D8_6  
    cmp eax, 7
    je  D8_7     
    jmp special_processing_D8
D8_0:   
;	    D8 /0     FADD mem4r      0 := 0 + mem4r
     FADD dword [esi]
jmp end_D8_TAB         
D8_1:        
;	    D8 /1     FMUL mem4r      0 := 0 * mem4r
     FMUL dword [esi]
jmp end_D8_TAB 
D8_2:  
;	    D8 /2     FCOM mem4r      compare 0 - mem4r
     FCOM dword [esi]
jmp end_D8_TAB 
D8_3:   
;	    D8 /3     FCOMP mem4r     compare 0 - mem4r, pop
     FCOMP dword [esi]
jmp end_D8_TAB 
D8_4:    
;	    D8 /4     FSUB mem4r      0 := 0 - mem4r
     FSUB dword [esi]
jmp end_D8_TAB 
D8_5:   
;	    D8 /5     FSUBR mem4r     0 := mem4r - 0
     FSUBR dword [esi] 
jmp end_D8_TAB 
D8_6:  
;	    D8 /6     FDIV mem4r      0 := 0 / mem4r
     FDIV dword [esi] 
jmp end_D8_TAB 
D8_7: 
;	    D8 /7     FDIVR mem4r     0 := mem4r / 0 
     FDIVR dword [esi]  
jmp end_D8_TAB 
 
 
; generally EA byte: C0 and up  
; it this case instead of TAB index, actual byte value from the RAM is passed
special_processing_D8:        
    cmp eax, 0C8h
    jb  D8_C0_i  
    cmp eax, 0D0h
    jb  D8_C8_i  
    cmp eax, 0D8h
    jb  D8_D0_i  
    cmp eax, 0E0h
    jb  D8_D8_i  
    cmp eax, 0E8h
    jb  D8_E0_i  
    cmp eax, 0F0h
    jb  D8_E8_i  
    cmp eax, 0F8h
    jb  D8_F0_i 
    jmp D8_F8_i     ; >= F8 
                
        
D8_C0_i:
;	    D8 C0+i   FADD 0,i        0 := i + 0  
        SUB eax, 0C0h   ; get index
        jZ  FADD_0_0
        cmp eax, 1
        je  FADD_0_1
        cmp eax, 2
        je  FADD_0_2
        cmp eax, 3
        je  FADD_0_3
        cmp eax, 4
        je  FADD_0_4
        cmp eax, 5
        je  FADD_0_5
        cmp eax, 6
        je  FADD_0_6
        cmp eax, 7
        je  FADD_0_7        
        fnop            ; wrong index
        jmp end_D8_SP  
FADD_0_0:          
        FADD st0, st0 
        jmp end_D8_SP
FADD_0_1:                     
        FADD st0, st1
        jmp end_D8_SP
FADD_0_2:          
        FADD st0, st2  
        jmp end_D8_SP
FADD_0_3:        
        FADD st0, st3                  
        jmp end_D8_SP
FADD_0_4:        
        FADD st0, st4
        jmp end_D8_SP
FADD_0_5:        
        FADD st0, st5
        jmp end_D8_SP
FADD_0_6:        
        FADD st0, st6
        jmp end_D8_SP
FADD_0_7:        
        FADD st0, st7
        jmp end_D8_SP 
        
        
D8_C8_i:
;	    D8 C8+i   FMUL 0,i        0 := 0 * i
        SUB eax, 0C8h   ; get index
        jZ  FMUL_0_0
        cmp eax, 1
        je  FMUL_0_1
        cmp eax, 2
        je  FMUL_0_2
        cmp eax, 3
        je  FMUL_0_3
        cmp eax, 4
        je  FMUL_0_4
        cmp eax, 5
        je  FMUL_0_5
        cmp eax, 6
        je  FMUL_0_6
        cmp eax, 7
        je  FMUL_0_7        
        fnop            ; wrong index
        jmp end_D8_SP  
FMUL_0_0:          
        FMUL st0, st0 
        jmp end_D8_SP
FMUL_0_1:                     
        FMUL st0, st1
        jmp end_D8_SP
FMUL_0_2:          
        FMUL st0, st2  
        jmp end_D8_SP
FMUL_0_3:        
        FMUL st0, st3                  
        jmp end_D8_SP
FMUL_0_4:        
        FMUL st0, st4
        jmp end_D8_SP
FMUL_0_5:        
        FMUL st0, st5
        jmp end_D8_SP
FMUL_0_6:        
        FMUL st0, st6
        jmp end_D8_SP
FMUL_0_7:        
        FMUL st0, st7
        jmp end_D8_SP 


               
D8_D0_i:               
;	    D8 D0+i   FCOM 0,i        compare 0 - i 
        SUB eax, 0D0h   ; get index
        jZ  FCOM_0_0
        cmp eax, 1
        je  FCOM_0_1
        cmp eax, 2
        je  FCOM_0_2
        cmp eax, 3
        je  FCOM_0_3
        cmp eax, 4
        je  FCOM_0_4
        cmp eax, 5
        je  FCOM_0_5
        cmp eax, 6
        je  FCOM_0_6
        cmp eax, 7
        je  FCOM_0_7        
        fnop            ; wrong index
        jmp end_D8_SP  
FCOM_0_0:          
        FCOM st0 
        jmp end_D8_SP
FCOM_0_1:                     
        FCOM st1
        jmp end_D8_SP
FCOM_0_2:          
        FCOM st2  
        jmp end_D8_SP
FCOM_0_3:        
        FCOM st3                  
        jmp end_D8_SP
FCOM_0_4:        
        FCOM st4
        jmp end_D8_SP
FCOM_0_5:        
        FCOM st5
        jmp end_D8_SP
FCOM_0_6:        
        FCOM st6
        jmp end_D8_SP
FCOM_0_7:        
        FCOM st7
        jmp end_D8_SP


        
D8_D8_i:        
;	    D8 D8+i   FCOMP 0,i       compare 0 - i, pop
        SUB eax, 0D8h   ; get index
        jZ  FCOMP_0_0
        cmp eax, 1
        je  FCOMP_0_1
        cmp eax, 2
        je  FCOMP_0_2
        cmp eax, 3
        je  FCOMP_0_3
        cmp eax, 4
        je  FCOMP_0_4
        cmp eax, 5
        je  FCOMP_0_5
        cmp eax, 6
        je  FCOMP_0_6
        cmp eax, 7
        je  FCOMP_0_7        
        fnop            ; wrong index
        jmp end_D8_SP  
FCOMP_0_0:          
        FCOMP st0 
        jmp end_D8_SP
FCOMP_0_1:                     
        FCOMP st1
        jmp end_D8_SP
FCOMP_0_2:          
        FCOMP st2  
        jmp end_D8_SP
FCOMP_0_3:        
        FCOMP st3                  
        jmp end_D8_SP
FCOMP_0_4:        
        FCOMP st4
        jmp end_D8_SP
FCOMP_0_5:        
        FCOMP st5
        jmp end_D8_SP
FCOMP_0_6:        
        FCOMP st6
        jmp end_D8_SP
FCOMP_0_7:        
        FCOMP st7
        jmp end_D8_SP



D8_E0_i:
;	    D8 E0+i   FSUB 0,i        0 := 0 - i 
        SUB eax, 0E0h   ; get index
        jZ  FSUB_0_0
        cmp eax, 1
        je  FSUB_0_1
        cmp eax, 2
        je  FSUB_0_2
        cmp eax, 3
        je  FSUB_0_3
        cmp eax, 4
        je  FSUB_0_4
        cmp eax, 5
        je  FSUB_0_5
        cmp eax, 6
        je  FSUB_0_6
        cmp eax, 7
        je  FSUB_0_7        
        fnop            ; wrong index
        jmp end_D8_SP  
FSUB_0_0:          
        FSUB st0, st0 
        jmp end_D8_SP
FSUB_0_1:                     
        FSUB st0, st1
        jmp end_D8_SP
FSUB_0_2:          
        FSUB st0, st2  
        jmp end_D8_SP
FSUB_0_3:        
        FSUB st0, st3                  
        jmp end_D8_SP
FSUB_0_4:        
        FSUB st0, st4
        jmp end_D8_SP
FSUB_0_5:        
        FSUB st0, st5
        jmp end_D8_SP
FSUB_0_6:        
        FSUB st0, st6
        jmp end_D8_SP
FSUB_0_7:        
        FSUB st0, st7
        jmp end_D8_SP
        
        
        
D8_E8_i:
;	    D8 E8+i   FSUBR 0,i       0 := i - 0 
        SUB eax, 0E8h   ; get index
        jZ  FSUBR_0_0
        cmp eax, 1
        je  FSUBR_0_1
        cmp eax, 2
        je  FSUBR_0_2
        cmp eax, 3
        je  FSUBR_0_3
        cmp eax, 4
        je  FSUBR_0_4
        cmp eax, 5
        je  FSUBR_0_5
        cmp eax, 6
        je  FSUBR_0_6
        cmp eax, 7
        je  FSUBR_0_7        
        fnop            ; wrong index
        jmp end_D8_SP  
FSUBR_0_0:          
        FSUBR st0, st0 
        jmp end_D8_SP
FSUBR_0_1:                     
        FSUBR st0, st1
        jmp end_D8_SP
FSUBR_0_2:          
        FSUBR st0, st2  
        jmp end_D8_SP
FSUBR_0_3:        
        FSUBR st0, st3                  
        jmp end_D8_SP
FSUBR_0_4:        
        FSUBR st0, st4
        jmp end_D8_SP
FSUBR_0_5:        
        FSUBR st0, st5
        jmp end_D8_SP
FSUBR_0_6:        
        FSUBR st0, st6
        jmp end_D8_SP
FSUBR_0_7:        
        FSUBR st0, st7
        jmp end_D8_SP
        
D8_F0_i:
;	    D8 F0+i   FDIV 0,i        0 := 0 / i
        SUB eax, 0F0h   ; get index
        jZ  FDIV_0_0
        cmp eax, 1
        je  FDIV_0_1
        cmp eax, 2
        je  FDIV_0_2
        cmp eax, 3
        je  FDIV_0_3
        cmp eax, 4
        je  FDIV_0_4
        cmp eax, 5
        je  FDIV_0_5
        cmp eax, 6
        je  FDIV_0_6
        cmp eax, 7
        je  FDIV_0_7        
        fnop            ; wrong index
        jmp end_D8_SP  
FDIV_0_0:          
        FDIV st0, st0 
        jmp end_D8_SP
FDIV_0_1:                     
        FDIV st0, st1
        jmp end_D8_SP
FDIV_0_2:          
        FDIV st0, st2  
        jmp end_D8_SP
FDIV_0_3:        
        FDIV st0, st3                  
        jmp end_D8_SP
FDIV_0_4:        
        FDIV st0, st4
        jmp end_D8_SP
FDIV_0_5:        
        FDIV st0, st5
        jmp end_D8_SP
FDIV_0_6:        
        FDIV st0, st6
        jmp end_D8_SP
FDIV_0_7:        
        FDIV st0, st7
        jmp end_D8_SP  
        
        
D8_F8_i:
;	    D8 F8+i   FDIVR 0,i       0 := i / 0
        SUB eax, 0F8h   ; get index
        jZ  FDIVR_0_0
        cmp eax, 1
        je  FDIVR_0_1
        cmp eax, 2
        je  FDIVR_0_2
        cmp eax, 3
        je  FDIVR_0_3
        cmp eax, 4
        je  FDIVR_0_4
        cmp eax, 5
        je  FDIVR_0_5
        cmp eax, 6
        je  FDIVR_0_6
        cmp eax, 7
        je  FDIVR_0_7        
        fnop            ; wrong index
        jmp end_D8_SP  
FDIVR_0_0:          
        FDIVR st0, st0 
        jmp end_D8_SP
FDIVR_0_1:                     
        FDIVR st0, st1
        jmp end_D8_SP
FDIVR_0_2:          
        FDIVR st0, st2  
        jmp end_D8_SP
FDIVR_0_3:        
        FDIVR st0, st3                  
        jmp end_D8_SP
FDIVR_0_4:        
        FDIVR st0, st4
        jmp end_D8_SP
FDIVR_0_5:        
        FDIVR st0, st5
        jmp end_D8_SP
FDIVR_0_6:        
        FDIVR st0, st6
        jmp end_D8_SP
FDIVR_0_7:        
        FDIVR st0, st7
        ; NR ; jmp end_D8_SP


    
end_D8_SP:     
end_D8_TAB:	 
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer      
	FSAVE [ebx]    
    fwait
    
    
    FCLEX 
    
          
    ; restore....      
	mov ebx,ORIG_87_STATE_94bytes 
	FRSTOR [ebx] 
    fwait  
     
    mov ebx, [tEBX]
	mov esi, [tESI]
	
	popf
	
	; return lEA_TAB (as it was passed to the function)
	;xor eax, eax     ; return
	ret  
endp

          





proc MicroAsm_D9_TAB lEA_TAB, mem4r, mem14, mem2i, virtual87state_94bytes
    local tEBX:DWORD,  tESI:DWORD,   tEDX:DWORD,  tECX:DWORD 
	pushf
	;cli 
	    
    
    ; store                                                                  
    mov [tEBX], ebx
    mov [tESI], esi
    mov [tEDX], edx
    mov [tECX], ecx
	
	; FPU ->
	mov ebx,ORIG_87_STATE_94bytes
	FSAVE [ebx] 
    fwait
     
    ; FPU <-       	      
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer       
	FRSTOR [ebx]
	fwait
	
	;;;;;;;;;;;;;; 
	 
	mov ebx, [lEA_TAB]      ; pointer to pointer
	mov esi, [mem4r]        ; pointer to pointer   
	mov edx, [mem14]        ; pointer to pointer
	mov ecx, [mem2i]        ; pointer to pointer
      
	mov eax, [ebx] 	
    cmp eax, 0
    je  D9_0  
    cmp eax, 1
    je  D9_1
    cmp eax, 2
    je  D9_2
    cmp eax, 3
    je  D9_3
    cmp eax, 4
    je  D9_4
    cmp eax, 5
    je  D9_5
    cmp eax, 6
    je  D9_6  
    cmp eax, 7
    je  D9_7     
    jmp special_processing_D9
D9_0:   
;	    D9 /0     FLD mem4r       push, 0 := mem4r
     FLD dword [esi]
jmp end_D9_TAB         
D9_1:
;       RESERVED  
     FNOP
jmp end_D9_TAB 
D9_2:     
;	    D9 /2     FST mem4r       mem4r := 0
     FST dword [esi]
jmp end_D9_TAB 
D9_3:       
;	    D9 /3     FSTP mem4r      mem4r := 0, pop
     FSTP dword [esi]
jmp end_D9_TAB 
D9_4:   
;	    D9 /4     FLDENV mem14    environment := mem14
     FLDENV [edx]   ; 14 bit pointer
jmp end_D9_TAB 
D9_5:     
;	    D9 /5     FLDCW mem2i     control word := mem2i
     FLDCW word [ecx] 
jmp end_D9_TAB 
D9_6:         
;	    D9 /6     FSTENV mem14    mem14 := environment
     FSTENV [edx]   ; 14 bit pointer
jmp end_D9_TAB 
D9_7:  
;	    D9 /7     FSTCW mem2i     mem2i := control word
     FSTCW word [ecx]  
jmp end_D9_TAB

    ;;;;;;;;;;;;;;;;;;;; special processing ;;;;;;;;;;;;;;
    
; generally EA byte: C0 and up  
; it this case instead of TAB index, actual byte value from the RAM is passed
special_processing_D9:        
    cmp eax, 0C8h
    jb  D9_C0_i  
    cmp eax, 0D0h
    jb  D9_C8_i 
     
    cmp eax, 0D0h
    je  D9_D0 
    cmp eax, 0D1h
    je  D9_D1 
    cmp eax, 0D2h
    je  D9_D2 
    cmp eax, 0D3h
    je  D9_D3 
    cmp eax, 0D4h
    je  D9_D4 
    cmp eax, 0D5h
    je  D9_D5 
    cmp eax, 0D6h
    je  D9_D6 
    cmp eax, 0D7h
    je  D9_D7 
    cmp eax, 0D8h
    je  D9_D8 
    cmp eax, 0D9h
    je  D9_D9 
    cmp eax, 0DAh
    je  D9_DA 
    cmp eax, 0DBh
    je  D9_DB 
    cmp eax, 0DCh
    je  D9_DC 
    cmp eax, 0DDh
    je  D9_DD 
    cmp eax, 0DEh
    je  D9_DE 
    cmp eax, 0DFh
    je  D9_DF 
    cmp eax, 0E0h
    je  D9_E0 
    cmp eax, 0E1h
    je  D9_E1 
    cmp eax, 0E2h
    je  D9_E2 
    cmp eax, 0E3h
    je  D9_E3 
    cmp eax, 0E4h
    je  D9_E4 
    cmp eax, 0E5h
    je  D9_E5 
    cmp eax, 0E6h
    je  D9_E6 
    cmp eax, 0E7h
    je  D9_E7 
    cmp eax, 0E8h
    je  D9_E8 
    cmp eax, 0E9h
    je  D9_E9 
    cmp eax, 0EAh
    je  D9_EA 
    cmp eax, 0EBh
    je  D9_EB 
    cmp eax, 0ECh
    je  D9_EC 
    cmp eax, 0EDh
    je  D9_ED 
    cmp eax, 0EEh
    je  D9_EE 
    cmp eax, 0F0h
    je  D9_F0 
    cmp eax, 0F1h
    je  D9_F1 
    cmp eax, 0F2h
    je  D9_F2 
    cmp eax, 0F3h
    je  D9_F3 
    cmp eax, 0F4h
    je  D9_F4 
    cmp eax, 0F5h
    je  D9_F5 
    cmp eax, 0F6h
    je  D9_F6 
    cmp eax, 0F7h
    je  D9_F7 
    cmp eax, 0F8h
    je  D9_F8 
    cmp eax, 0F9h
    je  D9_F9 
    cmp eax, 0FAh
    je  D9_FA 
    cmp eax, 0FBh
    je  D9_FB 
    cmp eax, 0FCh
    je  D9_FC 
    cmp eax, 0FDh
    je  D9_FD 
    cmp eax, 0FEh
    je  D9_FE      
    jmp D9_FF     ; == FF
                
        
D9_C0_i:
;	    D9 C0+i   FLD i           push, 0 := old i 
        SUB eax, 0C0h   ; get index
        jZ  FLD_0
        cmp eax, 1
        je  FLD_1
        cmp eax, 2
        je  FLD_2
        cmp eax, 3
        je  FLD_3
        cmp eax, 4
        je  FLD_4
        cmp eax, 5
        je  FLD_5
        cmp eax, 6
        je  FLD_6
        cmp eax, 7
        je  FLD_7        
        fnop            ; wrong index
        jmp end_D9_SP  
FLD_0:          
        FLD st0 
        jmp end_D9_SP
FLD_1:                     
        FLD st1
        jmp end_D9_SP
FLD_2:          
        FLD st2  
        jmp end_D9_SP
FLD_3:        
        FLD st3                  
        jmp end_D9_SP
FLD_4:        
        FLD st4
        jmp end_D9_SP
FLD_5:        
        FLD st5
        jmp end_D9_SP
FLD_6:        
        FLD st6
        jmp end_D9_SP
FLD_7:        
        FLD st7
        jmp end_D9_SP 
        
        
D9_C8_i:
;	    D9 C8+i   FXCH 0,i        exchange 0 and i
        SUB eax, 0C8h   ; get index
        jZ  FXCH_0_0
        cmp eax, 1
        je  FXCH_0_1
        cmp eax, 2
        je  FXCH_0_2
        cmp eax, 3
        je  FXCH_0_3
        cmp eax, 4
        je  FXCH_0_4
        cmp eax, 5
        je  FXCH_0_5
        cmp eax, 6
        je  FXCH_0_6
        cmp eax, 7
        je  FXCH_0_7        
        fnop            ; wrong index
        jmp end_D9_SP  
FXCH_0_0:          
        FXCH st0 
        jmp end_D9_SP
FXCH_0_1:                     
        FXCH st1
        jmp end_D9_SP
FXCH_0_2:          
        FXCH st2  
        jmp end_D9_SP
FXCH_0_3:        
        FXCH st3                  
        jmp end_D9_SP
FXCH_0_4:        
        FXCH st4
        jmp end_D9_SP
FXCH_0_5:        
        FXCH st5
        jmp end_D9_SP
FXCH_0_6:        
        FXCH st6
        jmp end_D9_SP
FXCH_0_7:        
        FXCH st7
        jmp end_D9_SP 


               
D9_D0:               
;	    D9 D0     FNOP            no operation 
        FNOP
        jmp end_D9_SP  
D9_D1:          
        ; there are no known 8087 instructions from D1 to DF
        ; probably Pentium has something.....

        jmp end_D9_SP
D9_D2:          
         FNOP
        jmp end_D9_SP
D9_D3:          
         FNOP
        jmp end_D9_SP
D9_D4:          
         FNOP
        jmp end_D9_SP
D9_D5:          
         FNOP
        jmp end_D9_SP
D9_D6:          
         FNOP
        jmp end_D9_SP
D9_D7:          

         FNOP
        jmp end_D9_SP
D9_D8:          

         FNOP
        jmp end_D9_SP
D9_D9:          
         FNOP  
        jmp end_D9_SP
D9_DA:          

         FNOP
        jmp end_D9_SP
D9_DB:          

         FNOP
        jmp end_D9_SP
D9_DC:          

         FNOP
        jmp end_D9_SP
D9_DD:          

         FNOP
        jmp end_D9_SP
D9_DE:          

         FNOP
        jmp end_D9_SP
D9_DF:          

         FNOP
        jmp end_D9_SP
D9_E0:          
;       D9 E0     FCHS            0 := -0
        FCHS
        jmp end_D9_SP
D9_E1:          
;	    D9 E1     FABS            0 := |0|
        FABS
        jmp end_D9_SP
D9_E2:          
;       NO OP
        FNOP
        jmp end_D9_SP
D9_E3:          
;       NO OP
        FNOP
        jmp end_D9_SP
D9_E4:          
;       D9 E4     FTST            compare 0 - 0.0
        FTST
        jmp end_D9_SP
D9_E5:          
;       D9 E5     FXAM            C3 -- C0 := type of 0
        FXAM
        jmp end_D9_SP
D9_E6:          
;       NO OP
        FNOP 
        jmp end_D9_SP
D9_E7:          
;       NO OP
        FNOP
        jmp end_D9_SP
D9_E8:          
;	    D9 E8     FLD1            push, 0 := 1.0
        FLD1
        jmp end_D9_SP
D9_E9:          
;	    D9 E9     FLDL2T          push, 0 := log base 2.0 of 10.0
        FLDL2T
        jmp end_D9_SP
D9_EA:          
;	    D9 EA     FLDL2E          push, 0 := log base 2.0 of e
        FLDL2E
        jmp end_D9_SP
D9_EB:          
;	    D9 EB     FLDPI           push, 0 := Pi
        FLDPI
        jmp end_D9_SP
D9_EC:          
;	    D9 EC     FLDLG2          push, 0 := log base 10.0 of 2.0
        FLDLG2
        jmp end_D9_SP
D9_ED:          
;	    D9 ED     FLDLN2          push, 0 := log base e of 2.0
        FLDLN2
        jmp end_D9_SP
D9_EE:          
;	    D9 EE     FLDZ            push, 0 := +0.0
        FLDZ
        jmp end_D9_SP
D9_EF:          
        FNOP      ; NO SUCH OP
 
        jmp end_D9_SP
D9_F0:          
;	    D9 F0     F2XM1           0 := (2.0 ** 0) - 1.0
        F2XM1
        jmp end_D9_SP
D9_F1:          
;	    D9 F1     FYL2X           0 := 1 * log base 2.0 of 0, pop
        FYL2X
        jmp end_D9_SP
D9_F2:          
;	    D9 F2     FPTAN           push, 1/0 := tan(old 0)
        FPTAN
        jmp end_D9_SP
D9_F3:          
;	    D9 F3     FPATAN          0 := arctan(1/0), pop
        FPATAN
        jmp end_D9_SP
D9_F4:          
;	    D9 F4     FXTRACT         push, 1 := expo, 0 := sig
        FXTRACT
        jmp end_D9_SP
D9_F5:          
;	    D9 F5     FPREM1          387 only: 0 := REPEAT(0 - 1) IEEE compat.
        FPREM1
        jmp end_D9_SP
D9_F6:          
;	    D9 F6     FDECSTP         decrement stack pointer
        FDECSTP
        jmp end_D9_SP
D9_F7:          
;	    D9 F7     FINCSTP         increment stack pointer
        FINCSTP
        jmp end_D9_SP
D9_F8:          
;	    D9 F8     FPREM           0 := REPEAT(0 - 1)
        FPREM
        jmp end_D9_SP
D9_F9:          
;	    D9 F9     FYL2XP1         0 := 1 * log base 2.0 of (0+1.0), pop
        FYL2XP1
        jmp end_D9_SP
D9_FA:          
;	    D9 FA     FSQRT           0 := square root of 0
        FSQRT
        jmp end_D9_SP
D9_FB:          
;	    D9 FB     FSINCOS         387 only: push, 1 := sine, 0 := cos(old 0)
        FSINCOS
        jmp end_D9_SP
D9_FC:          
;	    D9 FC     FRNDINT         0 := round(0)
        FRNDINT
        jmp end_D9_SP
D9_FD:          
;	    D9 FD     FSCALE          0 := 0 * 2.0 ** 1
        FSCALE
        jmp end_D9_SP
D9_FE:          
;	    D9 FE     FSIN            387 only: 0 := sine(0)
        FSIN
        jmp end_D9_SP
D9_FF:          
;	    D9 FF     FCOS            387 only: 0 := cosine(0)
        FCOS
        ; NR ; jmp end_D9_SP
    ;;;;;;;;;;;;;;;;;;;;;
     
end_D9_SP:
end_D9_TAB:     
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer      
	FSAVE [ebx]    
    fwait 
    
    FCLEX
    
    ; restore....      
	mov ebx,ORIG_87_STATE_94bytes 
	FRSTOR [ebx] 
    fwait
    
    ; restore
    mov ebx, [tEBX]
    mov esi, [tESI]
    mov edx, [tEDX]
    mov ecx, [tECX]
 
    popf
    
	;eax=WHAT EVER
	ret  
endp




       
       
       
       
       
       

         
proc MicroAsm_DA_TAB lEA_TAB, mem4i, virtual87state_94bytes
    local tEBX:DWORD, tESI:DWORD
	pushf
	;cli 

	mov [tEBX], ebx ; jic 
	mov [tESI], esi ; jic
	   
	
	mov ebx,ORIG_87_STATE_94bytes
	FSAVE [ebx] 
    fwait
           	      
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer       
	FRSTOR [ebx]
	fwait
	
	mov ebx, [lEA_TAB]      ; pointer to pointer
	mov esi, [mem4i]        ; pointer to pointer   
    
      
	mov eax, [ebx] 	
    cmp eax, 0
    je  DA_0  
    cmp eax, 1
    je  DA_1
    cmp eax, 2
    je  DA_2
    cmp eax, 3
    je  DA_3
    cmp eax, 4
    je  DA_4
    cmp eax, 5
    je  DA_5
    cmp eax, 6
    je  DA_6  
    cmp eax, 7
    je  DA_7     
    jmp special_processing_DA
DA_0:   
;	    DA /0     FIADD mem4i     0 := 0 + mem2i
     FIADD dword [esi]
jmp end_DA_TAB         
DA_1:        
;       DA /1     FIMUL mem4i     0 := 0 * mem4i
     FIMUL dword [esi]
jmp end_DA_TAB 
DA_2:  
;       DA /2     FICOM mem4i     compare 0 - mem4i
     FICOM dword [esi]
jmp end_DA_TAB 
DA_3:   
;       DA /3     FICOMP mem4i    compare 0 - mem4i, pop
     FICOMP dword [esi]
jmp end_DA_TAB 
DA_4:    
;       DA /4     FISUB mem4i     0 := 0 - mem4i
     FISUB dword [esi]
jmp end_DA_TAB 
DA_5:   
;       DA /5     FISUBR mem4i    0 := mem4i - 0
     FISUBR dword [esi] 
jmp end_DA_TAB 
DA_6:  
;       DA /6     FIDIV mem4i     0 := 0 / mem4i
     FIDIV dword [esi] 
jmp end_DA_TAB 
DA_7: 
;       DA /7     FIDIVR mem4i    0 := mem4i / 0
     FIDIVR dword [esi]  
jmp end_DA_TAB 
 
 
; generally EA byte: C0 and up  
; it this case instead of TAB index, actual byte value from the RAM is passed
special_processing_DA:        
    cmp eax, 0E9h
    je  DA_E9  
    ; no other instructions...
    jmp end_DA_SP     
                
        
DA_E9:
;    DA E9     FUCOMPP         387 only: unordered compare 0 - 1, pop both
    FUCOMPP
    ; NP ; jmp end_DA_SP
    
end_DA_SP:     
end_DA_TAB:	 
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer      
	FSAVE [ebx]    
    fwait
    
    
    FCLEX 
    
          
    ; restore....      
	mov ebx,ORIG_87_STATE_94bytes 
	FRSTOR [ebx] 
    fwait  
     
    mov ebx, [tEBX]
	mov esi, [tESI]
	
	popf
	
	; return lEA_TAB (as it was passed to the function)
	;xor eax, eax     ; return
	ret  
endp
; MicroAsm_DA_TAB



















proc MicroAsm_DB_TAB lEA_TAB, mem4i, mem10r, virtual87state_94bytes
    local tEBX:DWORD,  tESI:DWORD,   tEDX:DWORD,  tECX:DWORD 
	pushf
	    
    
    ; store                                                                  
    mov [tEBX], ebx
    mov [tESI], esi
    mov [tEDX], edx
    mov [tECX], ecx
	
	; FPU ->
	mov ebx,ORIG_87_STATE_94bytes
	FSAVE [ebx] 
    fwait
     
    ; FPU <-       	      
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer       
	FRSTOR [ebx]
	fwait
	
	;;;;;;;;;;;;;; 
	 
	mov ebx, [lEA_TAB]      ; pointer to pointer
	mov esi, [mem4i]        ; pointer to pointer   
	mov edx, [mem10r]       ; pointer to pointer

      
	mov eax, [ebx] 	
    cmp eax, 0
    je  DB_0  
    cmp eax, 1
    je  DB_1
    cmp eax, 2
    je  DB_2
    cmp eax, 3
    je  DB_3
    cmp eax, 4
    je  DB_4
    cmp eax, 5
    je  DB_5
    cmp eax, 6
    je  DB_6  
    cmp eax, 7
    je  DB_7     
    jmp special_processing_DB
DB_0:   
;	    DB /0     FILD mem4i      push, 0 := mem4i
     FILD dword [esi]
jmp end_DB_TAB         
DB_1:
;       RESERVED  
     FNOP
jmp end_DB_TAB 
DB_2:     
;	    DB /2     FIST mem4i      mem4i := 0
     FIST dword [esi]
jmp end_DB_TAB 
DB_3:       
;	    DB /3     FISTP mem4i     mem4i := 0, pop
     FISTP dword [esi]
jmp end_DB_TAB 
DB_4:   
;	    RESERVED
     FNOP     
jmp end_DB_TAB 
DB_5:     
;	    DB /5     FLD mem10r      push, 0 := mem10r
     FLD tword [edx] 
jmp end_DB_TAB 
DB_6:         
;	    RESERVED
     FNOP
jmp end_DB_TAB 
DB_7:  
;	    DB /7     FSTP mem10r     mem10r := 0, pop
     FSTP tword [edx]  
jmp end_DB_TAB

    ;;;;;;;;;;;;;;;;;;;; special processing ;;;;;;;;;;;;;;
    
; generally EA byte: C0 and up  
; it this case instead of TAB index, actual byte value from the RAM is passed
special_processing_DB:        
    cmp eax, 0C8h
    jb  DB_C0  
    cmp eax, 0D0h
    jb  DB_C8
     
    cmp eax, 0D0h
    je  DB_D0 
    cmp eax, 0D1h
    je  DB_D1 
    cmp eax, 0D2h
    je  DB_D2 
    cmp eax, 0D3h
    je  DB_D3 
    cmp eax, 0D4h
    je  DB_D4 
    cmp eax, 0D5h
    je  DB_D5 
    cmp eax, 0D6h
    je  DB_D6 
    cmp eax, 0D7h
    je  DB_D7 
    cmp eax, 0D8h
    je  DB_D8 
    cmp eax, 0D9h
    je  DB_D9 
    cmp eax, 0DAh
    je  DB_DA 
    cmp eax, 0DBh
    je  DB_DB 
    cmp eax, 0DCh
    je  DB_DC 
    cmp eax, 0DDh
    je  DB_DD 
    cmp eax, 0DEh
    je  DB_DE 
    cmp eax, 0DFh
    je  DB_DF 
    cmp eax, 0E0h
    je  DB_E0 
    cmp eax, 0E1h
    je  DB_E1 
    cmp eax, 0E2h
    je  DB_E2 
    cmp eax, 0E3h
    je  DB_E3 
    cmp eax, 0E4h
    je  DB_E4 
    cmp eax, 0E5h
    je  DB_E5 
    cmp eax, 0E6h
    je  DB_E6 
    cmp eax, 0E7h
    je  DB_E7 
    cmp eax, 0E8h
    je  DB_E8 
    cmp eax, 0E9h
    je  DB_E9 
    cmp eax, 0EAh
    je  DB_EA 
    cmp eax, 0EBh
    je  DB_EB 
    cmp eax, 0ECh
    je  DB_EC 
    cmp eax, 0EDh
    je  DB_ED 
    cmp eax, 0EEh
    je  DB_EE 
    cmp eax, 0F0h
    je  DB_F0 
    cmp eax, 0F1h
    je  DB_F1 
    cmp eax, 0F2h
    je  DB_F2 
    cmp eax, 0F3h
    je  DB_F3 
    cmp eax, 0F4h
    je  DB_F4 
    cmp eax, 0F5h
    je  DB_F5 
    cmp eax, 0F6h
    je  DB_F6 
    cmp eax, 0F7h
    je  DB_F7 
    cmp eax, 0F8h
    je  DB_F8 
    cmp eax, 0F9h
    je  DB_F9 
    cmp eax, 0FAh
    je  DB_FA 
    cmp eax, 0FBh
    je  DB_FB 
    cmp eax, 0FCh
    je  DB_FC 
    cmp eax, 0FDh
    je  DB_FD 
    cmp eax, 0FEh
    je  DB_FE      
    jmp DB_FF     ; == FF
                
        
DB_C0:
; RESERVED     
        fnop
        jmp end_DB_SP  

        
        
DB_C8:
; RESERVED
        fnop
        jmp end_DB_SP  

       
DB_D0:               
; RESERVED .....
        FNOP
        jmp end_DB_SP  
DB_D1:          
        ; there are no known 8087 instructions from C0 to DF
        ; probably Pentium has something.....

        jmp end_DB_SP
DB_D2:          
         FNOP
        jmp end_DB_SP
DB_D3:          
         FNOP
        jmp end_DB_SP
DB_D4:          
         FNOP
        jmp end_DB_SP
DB_D5:          
         FNOP
        jmp end_DB_SP
DB_D6:          
         FNOP
        jmp end_DB_SP
DB_D7:          

         FNOP
        jmp end_DB_SP
DB_D8:          

         FNOP
        jmp end_DB_SP
DB_D9:          
         FNOP  
        jmp end_DB_SP
DB_DA:          

         FNOP
        jmp end_DB_SP
DB_DB:          

         FNOP
        jmp end_DB_SP
DB_DC:          

         FNOP
        jmp end_DB_SP
DB_DD:          

         FNOP
        jmp end_DB_SP
DB_DE:          

         FNOP
        jmp end_DB_SP
DB_DF:          

         FNOP
        jmp end_DB_SP
DB_E0:          
;       DB E0     FENI            enable interrupts (.287 ignore)
        FENI
        jmp end_DB_SP
DB_E1:          
;	    DB E1     FDISI           disable interrupts (.287 ignore)
        FDISI
        jmp end_DB_SP
DB_E2:          
;       DB E2     FCLEX           clear exceptions
        FCLEX
        jmp end_DB_SP
DB_E3:          
;       DB E3     FINIT           initialize 87
        FINIT
        jmp end_DB_SP
DB_E4:          
;       DB E4     FSETPM          set protection mode
;        FSETPM
        FNOP  ; seems like only .286 supports it,
              ; and all others: .386 and above replace it with FNOP.
        jmp end_DB_SP
DB_E5:          
;       DB E8     FBANK 0         IIT only: set bank pointer to default
        FNOP  ; we have no banks.
        jmp end_DB_SP
DB_E6:          
;       DB EA     FBANK 2         IIT only: set bank pointer to bank 2
        FNOP  ; we have no banks. 
        jmp end_DB_SP
DB_E7:          
;       DB EB     FBANK 1         IIT only: set bank pointer to bank 1
        FNOP  ; we have no banks.
        jmp end_DB_SP
DB_E8:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_E9:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_EA:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_EB:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_EC:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_ED:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_EE:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_EF:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_F0:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_F1:          
;	    DB F1     F4X4            IIT only: 4 by 4 matrix multiply
        FNOP  ; don't know :)
        jmp end_DB_SP
DB_F2:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_F3:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_F4:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_F5:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_F6:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_F7:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_F8:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_F9:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_FA:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_FB:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_FC:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_FD:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_FE:          
;	    RESERVED
        FNOP
        jmp end_DB_SP
DB_FF:          
;	    RESERVED
        FNOP
        ; NR ; jmp end_DB_SP
    ;;;;;;;;;;;;;;;;;;;;;
     
end_DB_SP:
end_DB_TAB:     
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer      
	FSAVE [ebx]    
    fwait 
    
    FCLEX
    
    ; restore....      
	mov ebx,ORIG_87_STATE_94bytes 
	FRSTOR [ebx] 
    fwait
    
    ; restore
    mov ebx, [tEBX]
    mov esi, [tESI]
    mov edx, [tEDX]
    mov ecx, [tECX]
 
    popf
    
	;eax=WHAT EVER
	ret  
endp
;  MicroAsm_DB_TAB
















proc MicroAsm_DC_TAB lEA_TAB, mem8r, virtual87state_94bytes
    local tEBX:DWORD,  tESI:DWORD,   tEDX:DWORD,  tECX:DWORD 
	pushf
	;cli 

    ; store                                                                  
    mov [tEBX], ebx
    mov [tESI], esi
    mov [tEDX], edx
    mov [tECX], ecx
	
	; FPU ->
	mov ebx,ORIG_87_STATE_94bytes
	FSAVE [ebx] 
    fwait
     
    ; FPU <-       	      
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer       
	FRSTOR [ebx]
	fwait
	
	;;;;;;;;;;;;;; 
	 
	mov ebx, [lEA_TAB]      ; pointer to pointer
	mov esi, [mem8r]        ; pointer to pointer   

      
	mov eax, [ebx] 	
    cmp eax, 0
    je  DC_0  
    cmp eax, 1
    je  DC_1
    cmp eax, 2
    je  DC_2
    cmp eax, 3
    je  DC_3
    cmp eax, 4
    je  DC_4
    cmp eax, 5
    je  DC_5
    cmp eax, 6
    je  DC_6  
    cmp eax, 7
    je  DC_7     
    jmp special_processing_DC
DC_0:   
;	    DC /0     FADD mem8r      0 := 0 + mem8r
     FADD qword [esi]
jmp end_DC_TAB         
DC_1:
;       DC /1     FMUL mem8r      0 := 0 * mem8r  
     FADD qword [esi]
jmp end_DC_TAB 
DC_2:     
;	    DC /2     FCOM mem8r      compare 0 - mem8r
     FCOM qword [esi]
jmp end_DC_TAB 
DC_3:       
;	    DC /3     FCOMP mem8r     compare 0 - mem8r, pop
     FCOMP qword [esi]
jmp end_DC_TAB 
DC_4:   
;	    DC /4     FSUB mem8r      0 := 0 - mem8r
     FSUB qword [esi]
jmp end_DC_TAB 
DC_5:     
;	    DC /5     FSUBR mem8r     0 := mem8r - 0
     FSUBR qword [esi] 
jmp end_DC_TAB 
DC_6:         
;	    DC /6     FDIV mem8r      0 := 0 / mem8r
     FDIV qword [esi]
jmp end_DC_TAB 
DC_7:  
;	    DC /7     FDIVR mem8r     0 := mem8r / 0
     FDIVR qword [esi]  
jmp end_DC_TAB

    ;;;;;;;;;;;;;;;;;;;; special processing ;;;;;;;;;;;;;;
    
; generally EA byte: C0 and up  
; it this case instead of TAB index, actual byte value from the RAM is passed
special_processing_DC:        
    cmp eax, 0C8h
    jb  DC_C0_i  
    cmp eax, 0D0h
    jb  DC_C8_i      
    cmp eax, 0D8h
    jb  DC_D0_i       ; reserved
    cmp eax, 0E0h
    jb  DC_D8_i       ; reserved
    cmp eax, 0E8h
    jb  DC_E0_i  
    cmp eax, 0F0h
    jb  DC_E8_i 
    cmp eax, 0F8h
    jb  DC_F0_i           
     
    jmp DC_F8_i       ; F8+
        
DC_C0_i:
;	    DC C0+i   FADD i,0        i := i + 0
        SUB eax, 0C0h   ; get index
        jZ  FADD_0
        cmp eax, 1
        je  FADD_1
        cmp eax, 2
        je  FADD_2
        cmp eax, 3
        je  FADD_3
        cmp eax, 4
        je  FADD_4
        cmp eax, 5
        je  FADD_5
        cmp eax, 6
        je  FADD_6
        cmp eax, 7
        je  FADD_7        
        fnop            ; wrong index
        jmp end_DC_SP  
FADD_0:          
        FADD st0, st0 
        jmp end_DC_SP
FADD_1:                     
        FADD st1, st0
        jmp end_DC_SP
FADD_2:          
        FADD st2, st0  
        jmp end_DC_SP
FADD_3:        
        FADD st3, st0                  
        jmp end_DC_SP
FADD_4:        
        FADD st4, st0
        jmp end_DC_SP
FADD_5:        
        FADD st5, st0
        jmp end_DC_SP
FADD_6:        
        FADD st6, st0
        jmp end_DC_SP
FADD_7:        
        FADD st7, st0
        jmp end_DC_SP 

DC_C8_i:
;	    DC C8+i   FMUL i,0        i := i * 0
        SUB eax, 0C8h   ; get index
        jZ  FMUL_i_0
        cmp eax, 1
        je  FMUL_i_1
        cmp eax, 2
        je  FMUL_i_2
        cmp eax, 3
        je  FMUL_i_3
        cmp eax, 4
        je  FMUL_i_4
        cmp eax, 5
        je  FMUL_i_5
        cmp eax, 6
        je  FMUL_i_6
        cmp eax, 7
        je  FMUL_i_7        
        fnop            ; wrong index
        jmp end_DC_SP  
FMUL_i_0:          
        FMUL st0, st0 
        jmp end_DC_SP
FMUL_i_1:                     
        FMUL st1, st0 
        jmp end_DC_SP
FMUL_i_2:          
        FMUL st2, st0   
        jmp end_DC_SP
FMUL_i_3:        
        FMUL st3, st0                   
        jmp end_DC_SP
FMUL_i_4:        
        FMUL st4, st0 
        jmp end_DC_SP
FMUL_i_5:        
        FMUL st5, st0 
        jmp end_DC_SP
FMUL_i_6:        
        FMUL st6, st0 
        jmp end_DC_SP
FMUL_i_7:        
        FMUL st7, st0 
        jmp end_DC_SP 

DC_D0_i:
       ; reserved  
       FNOP
       jmp end_DC_SP
DC_D8_i:
       ; reserved 
       FNOP
       jmp end_DC_SP

DC_E0_i:
;	    DC E0+i   FSUBR i,0       i := 0 - i
        SUB eax, 0E0h   ; get index
        jZ  FSUBR_i_0
        cmp eax, 1
        je  FSUBR_i_1
        cmp eax, 2
        je  FSUBR_i_2
        cmp eax, 3
        je  FSUBR_i_3
        cmp eax, 4
        je  FSUBR_i_4
        cmp eax, 5
        je  FSUBR_i_5
        cmp eax, 6
        je  FSUBR_i_6
        cmp eax, 7
        je  FSUBR_i_7        
        fnop            ; wrong index
        jmp end_DC_SP  
FSUBR_i_0:          
        FSUBR st0, st0 
        jmp end_DC_SP
FSUBR_i_1:                     
        FSUBR st1, st0 
        jmp end_DC_SP
FSUBR_i_2:          
        FSUBR st2, st0   
        jmp end_DC_SP
FSUBR_i_3:        
        FSUBR st3, st0                   
        jmp end_DC_SP
FSUBR_i_4:        
        FSUBR st4, st0 
        jmp end_DC_SP
FSUBR_i_5:        
        FSUBR st5, st0 
        jmp end_DC_SP
FSUBR_i_6:        
        FSUBR st6, st0 
        jmp end_DC_SP
FSUBR_i_7:        
        FSUBR st7, st0 
        jmp end_DC_SP 
 
DC_E8_i:
;	    DC E8+i   FSUB i,0        i := i - 0
        SUB eax, 0E8h   ; get index
        jZ  FSUB_i_0
        cmp eax, 1
        je  FSUB_i_1
        cmp eax, 2
        je  FSUB_i_2
        cmp eax, 3
        je  FSUB_i_3
        cmp eax, 4
        je  FSUB_i_4
        cmp eax, 5
        je  FSUB_i_5
        cmp eax, 6
        je  FSUB_i_6
        cmp eax, 7
        je  FSUB_i_7        
        fnop            ; wrong index
        jmp end_DC_SP  
FSUB_i_0:          
        FSUB st0, st0 
        jmp end_DC_SP
FSUB_i_1:                     
        FSUB st1, st0 
        jmp end_DC_SP
FSUB_i_2:          
        FSUB st2, st0   
        jmp end_DC_SP
FSUB_i_3:        
        FSUB st3, st0                   
        jmp end_DC_SP
FSUB_i_4:        
        FSUB st4, st0 
        jmp end_DC_SP
FSUB_i_5:        
        FSUB st5, st0 
        jmp end_DC_SP
FSUB_i_6:        
        FSUB st6, st0 
        jmp end_DC_SP
FSUB_i_7:        
        FSUB st7, st0 
        jmp end_DC_SP  

DC_F0_i:
;	    DC F0+i   FDIVR i,0       i := 0 / i
        SUB eax, 0F0h   ; get index
        jZ  FDIVR_i_0
        cmp eax, 1
        je  FDIVR_i_1
        cmp eax, 2
        je  FDIVR_i_2
        cmp eax, 3
        je  FDIVR_i_3
        cmp eax, 4
        je  FDIVR_i_4
        cmp eax, 5
        je  FDIVR_i_5
        cmp eax, 6
        je  FDIVR_i_6
        cmp eax, 7
        je  FDIVR_i_7        
        fnop            ; wrong index
        jmp end_DC_SP  
FDIVR_i_0:          
        FDIVR st0, st0 
        jmp end_DC_SP
FDIVR_i_1:                     
        FDIVR st1, st0 
        jmp end_DC_SP
FDIVR_i_2:          
        FDIVR st2, st0   
        jmp end_DC_SP
FDIVR_i_3:        
        FDIVR st3, st0                   
        jmp end_DC_SP
FDIVR_i_4:        
        FDIVR st4, st0 
        jmp end_DC_SP
FDIVR_i_5:        
        FDIVR st5, st0 
        jmp end_DC_SP
FDIVR_i_6:        
        FDIVR st6, st0 
        jmp end_DC_SP
FDIVR_i_7:        
        FDIVR st7, st0 
        jmp end_DC_SP  

DC_F8_i:
;	    DC F8+i   FDIV i,0        i := i / 0
        SUB eax, 0F8h   ; get index
        jZ  FDIV_i_0
        cmp eax, 1
        je  FDIV_i_1
        cmp eax, 2
        je  FDIV_i_2
        cmp eax, 3
        je  FDIV_i_3
        cmp eax, 4
        je  FDIV_i_4
        cmp eax, 5
        je  FDIV_i_5
        cmp eax, 6
        je  FDIV_i_6
        cmp eax, 7
        je  FDIV_i_7        
        fnop            ; wrong index
        jmp end_DC_SP  
FDIV_i_0:          
        FDIV st0, st0 
        jmp end_DC_SP
FDIV_i_1:                     
        FDIV st1, st0 
        jmp end_DC_SP
FDIV_i_2:          
        FDIV st2, st0   
        jmp end_DC_SP
FDIV_i_3:        
        FDIV st3, st0                   
        jmp end_DC_SP
FDIV_i_4:        
        FDIV st4, st0 
        jmp end_DC_SP
FDIV_i_5:        
        FDIV st5, st0 
        jmp end_DC_SP
FDIV_i_6:        
        FDIV st6, st0 
        jmp end_DC_SP
FDIV_i_7:        
        FDIV st7, st0 
        ; NR ; jmp end_DC_SP
    ;;;;;;;;;;;;;;;;;;;;;
     
end_DC_SP:
end_DC_TAB:     
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer      
	FSAVE [ebx]    
    fwait 
    
    FCLEX
    
    ; restore....      
	mov ebx,ORIG_87_STATE_94bytes 
	FRSTOR [ebx] 
    fwait
    
    ; restore
    mov ebx, [tEBX]
    mov esi, [tESI]
    mov edx, [tEDX]
    mov ecx, [tECX]
 
    popf
    
	;eax=WHAT EVER
	ret  
endp




 
 
 






proc MicroAsm_DD_TAB lEA_TAB, mem8r, mem94, mem2i, virtual87state_94bytes
    local tEBX:DWORD,  tESI:DWORD,   tEDX:DWORD,  tECX:DWORD 
	pushf
	;cli 

    ; store                                                                  
    mov [tEBX], ebx
    mov [tESI], esi
    mov [tEDX], edx
    mov [tECX], ecx
	
	; FPU ->
	mov ebx,ORIG_87_STATE_94bytes
	FSAVE [ebx] 
    fwait
     
    ; FPU <-       	      
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer       
	FRSTOR [ebx]
	fwait
	
	;;;;;;;;;;;;;; 
	 
	mov ebx, [lEA_TAB]      ; pointer to pointer
	mov esi, [mem8r]        ; pointer to pointer   
    mov edx, [mem94]        ; pointer to pointer
    mov ecx, [mem2i]        ; pointer to pointer
    
      
	mov eax, [ebx] 	
    cmp eax, 0
    je  DD_0  
    cmp eax, 1
    je  DD_1
    cmp eax, 2
    je  DD_2
    cmp eax, 3
    je  DD_3
    cmp eax, 4
    je  DD_4
    cmp eax, 5
    je  DD_5
    cmp eax, 6
    je  DD_6  
    cmp eax, 7
    je  DD_7     
    jmp special_processing_DD
DD_0:   
;	    DD /0     FLD mem8r       push, 0 := mem8r
     FLD qword [esi]
jmp end_DD_TAB         
DD_1:
;       RESERVED  
     FNOP
jmp end_DD_TAB 
DD_2:     
;	    DD /2     FST mem8r       mem8r := 0
     FST qword [esi]
jmp end_DD_TAB 
DD_3:       
;	    DD /3     FSTP mem8r      mem8r := 0, pop
     FSTP qword [esi]
jmp end_DD_TAB 
DD_4:   
;	    DD /4     FRSTOR mem94    87 state := mem94
     FRSTOR [edx]   ; 94 bit pointer
jmp end_DD_TAB 
DD_5:     
;	    RESERVED
     FNOP 
jmp end_DD_TAB 
DD_6:         
;	    DD /6     FSAVE mem94     mem94 := 87 state
     FSAVE [edx]   ; 94 bit pointer
jmp end_DD_TAB 
DD_7:  
;	    DD /7     FSTSW mem2i     mem2i := status word
     FSTSW word [ecx]  
jmp end_DD_TAB

    ;;;;;;;;;;;;;;;;;;;; special processing ;;;;;;;;;;;;;;
    
; generally EA byte: C0 and up  
; it this case instead of TAB index, actual byte value from the RAM is passed
special_processing_DD:        
    cmp eax, 0C8h
    jb  DD_C0_i  
    cmp eax, 0D0h
    jb  DD_C8_i      ; RESERVED
    cmp eax, 0D8h
    jb  DD_D0_i
    cmp eax, 0E0h
    jb  DD_D8_i 
    cmp eax, 0E8h
    jb  DD_E0_i  
    cmp eax, 0F0h
    jb  DD_E8_i 
    cmp eax, 0F8h
    jb  DD_F0_i           
     
    jmp DD_F8_i       ; F8+
        
DD_C0_i:
;	    DD C0+i   FFREE i         empty i
        SUB eax, 0C0h   ; get index
        jZ  FFREE_0
        cmp eax, 1
        je  FFREE_1
        cmp eax, 2
        je  FFREE_2
        cmp eax, 3
        je  FFREE_3
        cmp eax, 4
        je  FFREE_4
        cmp eax, 5
        je  FFREE_5
        cmp eax, 6
        je  FFREE_6
        cmp eax, 7
        je  FFREE_7        
        fnop            ; wrong index
        jmp end_DD_SP  
FFREE_0:          
        FFREE st0 
        jmp end_DD_SP
FFREE_1:                     
        FFREE st1
        jmp end_DD_SP
FFREE_2:          
        FFREE st2  
        jmp end_DD_SP
FFREE_3:        
        FFREE st3                  
        jmp end_DD_SP
FFREE_4:        
        FFREE st4
        jmp end_DD_SP
FFREE_5:        
        FFREE st5
        jmp end_DD_SP
FFREE_6:        
        FFREE st6
        jmp end_DD_SP
FFREE_7:        
        FFREE st7
        jmp end_DD_SP 

DD_C8_i:
;	    RESERVED   
        fnop            ; wrong index
        jmp end_DD_SP  
DD_D0_i: 
;       DD D0+i   FST i           i := 0
        SUB eax, 0D0h   ; get index
        jZ  FST_i_0
        cmp eax, 1
        je  FST_i_1
        cmp eax, 2
        je  FST_i_2
        cmp eax, 3
        je  FST_i_3
        cmp eax, 4
        je  FST_i_4
        cmp eax, 5
        je  FST_i_5
        cmp eax, 6
        je  FST_i_6
        cmp eax, 7
        je  FST_i_7        
        fnop            ; wrong index
        jmp end_DD_SP  
FST_i_0:          
        FST st0
        jmp end_DD_SP
FST_i_1:                     
        FST st1 
        jmp end_DD_SP
FST_i_2:          
        FST st2   
        jmp end_DD_SP
FST_i_3:        
        FST st3                   
        jmp end_DD_SP
FST_i_4:        
        FST st4 
        jmp end_DD_SP
FST_i_5:        
        FST st5 
        jmp end_DD_SP
FST_i_6:        
        FST st6 
        jmp end_DD_SP
FST_i_7:        
        FST st7 
        jmp end_DD_SP 



  
DD_D8_i:
;       DD D8+i   FSTP i          i := 0, pop
        SUB eax, 0D8h   ; get index
        jZ  FSTP_i_0
        cmp eax, 1
        je  FSTP_i_1
        cmp eax, 2
        je  FSTP_i_2
        cmp eax, 3
        je  FSTP_i_3
        cmp eax, 4
        je  FSTP_i_4
        cmp eax, 5
        je  FSTP_i_5
        cmp eax, 6
        je  FSTP_i_6
        cmp eax, 7
        je  FSTP_i_7        
        fnop            ; wrong index
        jmp end_DD_SP  
FSTP_i_0:          
        FSTP st0
        jmp end_DD_SP
FSTP_i_1:                     
        FSTP st1 
        jmp end_DD_SP
FSTP_i_2:          
        FSTP st2   
        jmp end_DD_SP
FSTP_i_3:        
        FSTP st3                   
        jmp end_DD_SP
FSTP_i_4:        
        FSTP st4 
        jmp end_DD_SP
FSTP_i_5:        
        FSTP st5 
        jmp end_DD_SP
FSTP_i_6:        
        FSTP st6 
        jmp end_DD_SP
FSTP_i_7:        
        FSTP st7 
        jmp end_DD_SP 






DD_E0_i:
;	    DD E0+i   FUCOM i         387 only: unordered compare 0 - i
        SUB eax, 0E0h   ; get index
        jZ  FUCOM_i_0
        cmp eax, 1
        je  FUCOM_i_1
        cmp eax, 2
        je  FUCOM_i_2
        cmp eax, 3
        je  FUCOM_i_3
        cmp eax, 4
        je  FUCOM_i_4
        cmp eax, 5
        je  FUCOM_i_5
        cmp eax, 6
        je  FUCOM_i_6
        cmp eax, 7
        je  FUCOM_i_7        
        fnop            ; wrong index
        jmp end_DD_SP  
FUCOM_i_0:          
        FUCOM st0 
        jmp end_DD_SP
FUCOM_i_1:                     
        FUCOM st1
        jmp end_DD_SP
FUCOM_i_2:          
        FUCOM st2   
        jmp end_DD_SP
FUCOM_i_3:        
        FUCOM st3                   
        jmp end_DD_SP
FUCOM_i_4:        
        FUCOM st4 
        jmp end_DD_SP
FUCOM_i_5:        
        FUCOM st5 
        jmp end_DD_SP
FUCOM_i_6:        
        FUCOM st6 
        jmp end_DD_SP
FUCOM_i_7:        
        FUCOM st7 
        jmp end_DD_SP 
                 
                 
DD_E8_i:
;	    DD E8+i   FUCOMP i        387 only: unordered compare 0 - i, pop
        SUB eax, 0E8h   ; get index
        jZ  FUCOMP_i_0
        cmp eax, 1
        je  FUCOMP_i_1
        cmp eax, 2
        je  FUCOMP_i_2
        cmp eax, 3
        je  FUCOMP_i_3
        cmp eax, 4
        je  FUCOMP_i_4
        cmp eax, 5
        je  FUCOMP_i_5
        cmp eax, 6
        je  FUCOMP_i_6
        cmp eax, 7
        je  FUCOMP_i_7        
        fnop            ; wrong index
        jmp end_DD_SP  
FUCOMP_i_0:          
        FUCOMP st0
        jmp end_DD_SP
FUCOMP_i_1:                     
        FUCOMP st1 
        jmp end_DD_SP
FUCOMP_i_2:          
        FUCOMP st2   
        jmp end_DD_SP
FUCOMP_i_3:        
        FUCOMP st3                  
        jmp end_DD_SP
FUCOMP_i_4:        
        FUCOMP st4
        jmp end_DD_SP
FUCOMP_i_5:        
        FUCOMP st5
        jmp end_DD_SP
FUCOMP_i_6:        
        FUCOMP st6
        jmp end_DD_SP
FUCOMP_i_7:        
        FUCOMP st7
        jmp end_DD_SP  

DD_F0_i:
;	    RESERVED
        FNOP
        jmp end_DD_SP  

DD_F8_i:
;	    RESERVED
        FNOP
        ; NR ; jmp end_DD_SP
    ;;;;;;;;;;;;;;;;;;;;;
     
end_DD_SP:
end_DD_TAB:     
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer      
	FSAVE [ebx]    
    fwait 
    
    FCLEX
    
    ; restore....      
	mov ebx,ORIG_87_STATE_94bytes 
	FRSTOR [ebx] 
    fwait
    
    ; restore
    mov ebx, [tEBX]
    mov esi, [tESI]
    mov edx, [tEDX]
    mov ecx, [tECX]
 
    popf
    
	;eax=WHAT EVER
	ret  
endp
 
 


  
  
  
  
  
  


proc MicroAsm_DE_TAB lEA_TAB, mem2i, virtual87state_94bytes
    local tEBX:DWORD,  tESI:DWORD,   tEDX:DWORD,  tECX:DWORD 
	pushf
	;cli 

    ; store                                                                  
    mov [tEBX], ebx
    mov [tESI], esi
    mov [tEDX], edx
    mov [tECX], ecx
	
	; FPU ->
	mov ebx,ORIG_87_STATE_94bytes
	FSAVE [ebx] 
    fwait
     
    ; FPU <-       	      
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer       
	FRSTOR [ebx]
	fwait
	
	;;;;;;;;;;;;;; 
	 
	mov ebx, [lEA_TAB]      ; pointer to pointer
	mov esi, [mem2i]        ; pointer to pointer   

      
	mov eax, [ebx] 	
    cmp eax, 0
    je  DE_0  
    cmp eax, 1
    je  DE_1
    cmp eax, 2
    je  DE_2
    cmp eax, 3
    je  DE_3
    cmp eax, 4
    je  DE_4
    cmp eax, 5
    je  DE_5
    cmp eax, 6
    je  DE_6  
    cmp eax, 7
    je  DE_7     
    jmp special_processing_DE
DE_0:   
;A86:	DE /0     FIADD mem2i     0 := 0 + mem4i    (??????)   should be + mem2i
;INTEL: DE /0     FIADD m16int    Add   m16int to ST(0)      and store result in ST(0).  ; mem16i = word
     FIADD word [esi]
jmp end_DE_TAB         
DE_1:
;       DE /1     FIMUL mem2i     0 := 0 * mem2i  
     FIMUL word [esi]
jmp end_DE_TAB 
DE_2:     
;	    DE /2     FICOM mem2i     compare 0 - mem2i
     FICOM word [esi]
jmp end_DE_TAB 
DE_3:       
;	    DE /3     FICOMP mem2i    compare 0 - mem2i, pop
     FICOMP word [esi]
jmp end_DE_TAB 
DE_4:   
;	    DE /4     FISUB mem2i     0 := 0 - mem2i
     FISUB word [esi]
jmp end_DE_TAB 
DE_5:     
;	    DE /5     FISUBR mem2i    0 := mem2i - 0
     FISUBR word [esi] 
jmp end_DE_TAB 
DE_6:         
;	    DE /6     FIDIV mem2i     0 := 0 / mem2i
     FIDIV word [esi]
jmp end_DE_TAB 
DE_7:  
;	    DE /7     FIDIVR mem2i    0 := mem2i / 0
     FIDIVR word [esi]  
jmp end_DE_TAB

    ;;;;;;;;;;;;;;;;;;;; special processing ;;;;;;;;;;;;;;
    
; generally EA byte: C0 and up  
; it this case instead of TAB index, actual byte value from the RAM is passed
special_processing_DE:        
    cmp eax, 0C8h
    jb  DE_C0_i  
    cmp eax, 0D0h
    jb  DE_C8_i      
    cmp eax, 0D8h
    jb  DE_D0_i
    cmp eax, 0E0h
    jb  DE_D8_i       
    cmp eax, 0E8h
    jb  DE_E0_i  
    cmp eax, 0F0h
    jb  DE_E8_i 
    cmp eax, 0F8h
    jb  DE_F0_i           
     
    jmp DE_F8_i       ; F8+
        
DE_C0_i:
;	    DE C0+i   FADDP i,0       i := i + 0, pop
        SUB eax, 0C0h   ; get index
        jZ  FADDP_0
        cmp eax, 1
        je  FADDP_1
        cmp eax, 2
        je  FADDP_2
        cmp eax, 3
        je  FADDP_3
        cmp eax, 4
        je  FADDP_4
        cmp eax, 5
        je  FADDP_5
        cmp eax, 6
        je  FADDP_6
        cmp eax, 7
        je  FADDP_7        
        fnop            ; wrong index
        jmp end_DE_SP  
FADDP_0:          
        FADDP st0, st0 
        jmp end_DE_SP
FADDP_1:                     
        FADDP st1, st0
        jmp end_DE_SP
FADDP_2:          
        FADDP st2, st0  
        jmp end_DE_SP
FADDP_3:        
        FADDP st3, st0                  
        jmp end_DE_SP
FADDP_4:        
        FADDP st4, st0
        jmp end_DE_SP
FADDP_5:        
        FADDP st5, st0
        jmp end_DE_SP
FADDP_6:        
        FADDP st6, st0
        jmp end_DE_SP
FADDP_7:        
        FADDP st7, st0
        jmp end_DE_SP 

DE_C8_i:
;	    DE C8+i   FMULP i,0       i := i * 0, pop
        SUB eax, 0C8h   ; get index
        jZ  FMULP_i_0
        cmp eax, 1
        je  FMULP_i_1
        cmp eax, 2
        je  FMULP_i_2
        cmp eax, 3
        je  FMULP_i_3
        cmp eax, 4
        je  FMULP_i_4
        cmp eax, 5
        je  FMULP_i_5
        cmp eax, 6
        je  FMULP_i_6
        cmp eax, 7
        je  FMULP_i_7        
        fnop            ; wrong index
        jmp end_DE_SP  
FMULP_i_0:          
        FMULP st0, st0 
        jmp end_DE_SP
FMULP_i_1:                     
        FMULP st1, st0 
        jmp end_DE_SP
FMULP_i_2:          
        FMULP st2, st0   
        jmp end_DE_SP
FMULP_i_3:        
        FMULP st3, st0                   
        jmp end_DE_SP
FMULP_i_4:        
        FMULP st4, st0 
        jmp end_DE_SP
FMULP_i_5:        
        FMULP st5, st0 
        jmp end_DE_SP
FMULP_i_6:        
        FMULP st6, st0 
        jmp end_DE_SP
FMULP_i_7:        
        FMULP st7, st0 
        jmp end_DE_SP 

DE_D0_i:
;       reserved  
        FNOP
        jmp end_DE_SP 
          
          
          
          
DE_D8_i:  
       cmp eax, 0D9h
       JE  DE_D9
       jmp end_DE_SP     ; ALL OTHERS RESERVED.
DE_D9:
;      DE D9     FCOMPP          compare 0 - 1, pop both
       FCOMPP                                         
       jmp end_DE_SP
            
            
            
            
            
DE_E0_i:
;	    DE E0+i   FSUBRP i,0      i := 0 - i, pop
        SUB eax, 0E0h   ; get index
        jZ  FSUBRP_i_0
        cmp eax, 1
        je  FSUBRP_i_1
        cmp eax, 2
        je  FSUBRP_i_2
        cmp eax, 3
        je  FSUBRP_i_3
        cmp eax, 4
        je  FSUBRP_i_4
        cmp eax, 5
        je  FSUBRP_i_5
        cmp eax, 6
        je  FSUBRP_i_6
        cmp eax, 7
        je  FSUBRP_i_7        
        fnop            ; wrong index
        jmp end_DE_SP  
FSUBRP_i_0:          
        FSUBRP st0, st0 
        jmp end_DE_SP
FSUBRP_i_1:                     
        FSUBRP st1, st0 
        jmp end_DE_SP
FSUBRP_i_2:          
        FSUBRP st2, st0   
        jmp end_DE_SP
FSUBRP_i_3:        
        FSUBRP st3, st0                   
        jmp end_DE_SP
FSUBRP_i_4:        
        FSUBRP st4, st0 
        jmp end_DE_SP
FSUBRP_i_5:        
        FSUBRP st5, st0 
        jmp end_DE_SP
FSUBRP_i_6:        
        FSUBRP st6, st0 
        jmp end_DE_SP
FSUBRP_i_7:        
        FSUBRP st7, st0 
        jmp end_DE_SP 
 
DE_E8_i:
;	    DE E8+i   FSUBP i,0       i := i - 0, pop
        SUB eax, 0E8h   ; get index
        jZ  FSUBP_i_0
        cmp eax, 1
        je  FSUBP_i_1
        cmp eax, 2
        je  FSUBP_i_2
        cmp eax, 3
        je  FSUBP_i_3
        cmp eax, 4
        je  FSUBP_i_4
        cmp eax, 5
        je  FSUBP_i_5
        cmp eax, 6
        je  FSUBP_i_6
        cmp eax, 7
        je  FSUBP_i_7        
        fnop            ; wrong index
        jmp end_DE_SP  
FSUBP_i_0:          
        FSUBP st0, st0 
        jmp end_DE_SP
FSUBP_i_1:                     
        FSUBP st1, st0 
        jmp end_DE_SP
FSUBP_i_2:          
        FSUBP st2, st0   
        jmp end_DE_SP
FSUBP_i_3:        
        FSUBP st3, st0                   
        jmp end_DE_SP
FSUBP_i_4:        
        FSUBP st4, st0 
        jmp end_DE_SP
FSUBP_i_5:        
        FSUBP st5, st0 
        jmp end_DE_SP
FSUBP_i_6:        
        FSUBP st6, st0 
        jmp end_DE_SP
FSUBP_i_7:        
        FSUBP st7, st0 
        jmp end_DE_SP  

DE_F0_i:
;	    DE F0+i   FDIVRP i,0      i := 0 / i, pop
        SUB eax, 0F0h   ; get index
        jZ  FDIVRP_i_0
        cmp eax, 1
        je  FDIVRP_i_1
        cmp eax, 2
        je  FDIVRP_i_2
        cmp eax, 3
        je  FDIVRP_i_3
        cmp eax, 4
        je  FDIVRP_i_4
        cmp eax, 5
        je  FDIVRP_i_5
        cmp eax, 6
        je  FDIVRP_i_6
        cmp eax, 7
        je  FDIVRP_i_7        
        fnop            ; wrong index
        jmp end_DE_SP  
FDIVRP_i_0:          
        FDIVRP st0, st0 
        jmp end_DE_SP
FDIVRP_i_1:                     
        FDIVRP st1, st0 
        jmp end_DE_SP
FDIVRP_i_2:          
        FDIVRP st2, st0   
        jmp end_DE_SP
FDIVRP_i_3:        
        FDIVRP st3, st0                   
        jmp end_DE_SP
FDIVRP_i_4:        
        FDIVRP st4, st0 
        jmp end_DE_SP
FDIVRP_i_5:        
        FDIVRP st5, st0 
        jmp end_DE_SP
FDIVRP_i_6:        
        FDIVRP st6, st0 
        jmp end_DE_SP
FDIVRP_i_7:        
        FDIVRP st7, st0 
        jmp end_DE_SP  

DE_F8_i:
;	    DE F8+i   FDIVP i,0       i := i / 0, pop
        SUB eax, 0F8h   ; get index
        jZ  FDIVP_i_0
        cmp eax, 1
        je  FDIVP_i_1
        cmp eax, 2
        je  FDIVP_i_2
        cmp eax, 3
        je  FDIVP_i_3
        cmp eax, 4
        je  FDIVP_i_4
        cmp eax, 5
        je  FDIVP_i_5
        cmp eax, 6
        je  FDIVP_i_6
        cmp eax, 7
        je  FDIVP_i_7        
        fnop            ; wrong index
        jmp end_DE_SP  
FDIVP_i_0:          
        FDIVP st0, st0 
        jmp end_DE_SP
FDIVP_i_1:                     
        FDIVP st1, st0 
        jmp end_DE_SP
FDIVP_i_2:          
        FDIVP st2, st0   
        jmp end_DE_SP
FDIVP_i_3:        
        FDIVP st3, st0                   
        jmp end_DE_SP
FDIVP_i_4:        
        FDIVP st4, st0 
        jmp end_DE_SP
FDIVP_i_5:        
        FDIVP st5, st0 
        jmp end_DE_SP
FDIVP_i_6:        
        FDIVP st6, st0 
        jmp end_DE_SP
FDIVP_i_7:        
        FDIVP st7, st0 
        ; NR ; jmp end_DE_SP
    ;;;;;;;;;;;;;;;;;;;;;
     
end_DE_SP:
end_DE_TAB:     
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer      
	FSAVE [ebx]    
    fwait 
    
    FCLEX
    
    ; restore....      
	mov ebx,ORIG_87_STATE_94bytes 
	FRSTOR [ebx] 
    fwait
    
    ; restore
    mov ebx, [tEBX]
    mov esi, [tESI]
    mov edx, [tEDX]
    mov ecx, [tECX]
 
    popf
    
	;eax=WHAT EVER
	ret  
endp

  


  













; AX = mem2i for FSTSW AX
; (all passed by ref) 

proc MicroAsm_DF_TAB lEA_TAB, mem2i, mem8i, mem10d,  virtual87state_94bytes
    local tEBX:DWORD,  tESI:DWORD,   tEDX:DWORD,  tECX:DWORD 
	pushf
	;cli 

    ; store                                                                  
    mov [tEBX], ebx
    mov [tESI], esi
    mov [tEDX], edx
    mov [tECX], ecx
	
	; FPU ->
	mov ebx,ORIG_87_STATE_94bytes
	FSAVE [ebx] 
    fwait
     
    ; FPU <-       	      
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer       
	FRSTOR [ebx]
	fwait
	
	;;;;;;;;;;;;;; 
	 
	mov ebx, [lEA_TAB]      ; pointer to pointer
	mov esi, [mem2i]        ; pointer to pointer   
    mov edx, [mem8i]        ; pointer to pointer
    mov ecx, [mem10d]       ; pointer to pointer
    
    
      
	mov eax, [ebx] 	
    cmp eax, 0
    je  DF_0  
    cmp eax, 1
    je  DF_1
    cmp eax, 2
    je  DF_2
    cmp eax, 3
    je  DF_3
    cmp eax, 4
    je  DF_4
    cmp eax, 5
    je  DF_5
    cmp eax, 6
    je  DF_6  
    cmp eax, 7
    je  DF_7     
    jmp special_processing_DF
DF_0:   
;       DF /0     FILD mem2i      push, 0 := mem2i
     FILD word [esi]
jmp end_DF_TAB         
DF_1:
;       DE /1     RESERVED  
     FNOP
jmp end_DF_TAB 
DF_2:     
;	    DF /2     FIST mem2i      mem2i := 0
     FIST word [esi]
jmp end_DF_TAB 
DF_3:       
;	    DF /3     FISTP mem2i     mem2i := 0, pop
     FISTP word [esi]
jmp end_DF_TAB 
DF_4:   
;	    DF /4     FBLD mem10d     push, 0 := mem10d
     FBLD tword [ecx]
jmp end_DF_TAB 
DF_5:     
;	    DF /5     FILD mem8i      push, 0 := mem8i
     FILD qword [edx] 
jmp end_DF_TAB 
DF_6:         
;	    DF /6     FBSTP mem10d    mem10d := 0, pop
     FBSTP tword [ecx]
jmp end_DF_TAB 
DF_7:  
;	    DF /7     FISTP mem8i     mem8i := 0, pop
     FISTP qword [edx]  
jmp end_DF_TAB

    ;;;;;;;;;;;;;;;;;;;; special processing ;;;;;;;;;;;;;;
    
; generally EA byte: C0 and up  
; it this case instead of TAB index, actual byte value from the RAM is passed
special_processing_DF:        
    cmp eax, 0C8h
    jb  DF_C0_i  
    cmp eax, 0D0h
    jb  DF_C8_i      
    cmp eax, 0D8h
    jb  DF_D0_i
    cmp eax, 0E0h
    jb  DF_D8_i       
    cmp eax, 0E8h
    jb  DF_E0_i  
    cmp eax, 0F0h
    jb  DF_E8_i 
    cmp eax, 0F8h
    jb  DF_F0_i           
     
    jmp DF_F8_i       ; F8+

        
DF_C0_i:
        jmp end_DF_SP  
DF_C8_i:
        jmp end_DF_SP 
DF_D0_i:
        jmp end_DF_SP 
DF_D8_i:  
        jmp end_DF_SP     
DF_D9:
        jmp end_DF_SP
DF_E0_i:         
        cmp eax, 0E0h
        je  DF_E0         ; ALL OTHERS RESERVED. 
        jmp end_DF_SP
DF_E0:
;        DF E0     FSTSW AX        AX := status word
        FSTSW AX
        mov [esi], AX
        
        jmp end_DF_SP 
DF_E8_i:
        jmp end_DF_SP  
DF_F0_i:
        jmp end_DF_SP  
DF_F8_i:
        ; NR ; jmp end_DF_SP
    ;;;;;;;;;;;;;;;;;;;;;
     
end_DF_SP:
end_DF_TAB:     
	mov ebx, [virtual87state_94bytes]  ; pointer to pointer      
	FSAVE [ebx]    
    fwait 
    
    FCLEX
    
    ; restore....      
	mov ebx,ORIG_87_STATE_94bytes 
	FRSTOR [ebx] 
    fwait
    
    ; restore
    mov ebx, [tEBX]
    mov esi, [tESI]
    mov edx, [tEDX]
    mov ecx, [tECX]
 
    popf
    
	;eax=WHAT EVER
	ret  
endp

  





       







section '.idata' import data readable writeable

  library kernel,'KERNEL32.DLL',\
	  user,'USER32.DLL'

  import kernel,\
	 GetLastError,'GetLastError',\
	 SetLastError,'SetLastError',\
	 FormatMessage,'FormatMessageA',\
	 LocalFree,'LocalFree'

  import user,\
	 MessageBox,'MessageBoxA'

section '.edata' export data readable

  export 'MICROASM.DLL',\
	 ShowErrorMessage,'ShowErrorMessage',\ 
	 ShowLastError,'ShowLastError',\  
	 Copyright_emu8086, 'Copyright_emu8086',\
	 MicroAsm_T,'MicroAsm_T',\
	 MicroAsm_FINIT, 'MicroAsm_FINIT',    \
	 MicroAsm_D8_TAB, 'MicroAsm_D8_TAB',  \
	 MicroAsm_D9_TAB, 'MicroAsm_D9_TAB',  \
	 MicroAsm_DA_TAB, 'MicroAsm_DA_TAB',  \
	 MicroAsm_DB_TAB, 'MicroAsm_DB_TAB',  \
	 MicroAsm_DC_TAB, 'MicroAsm_DC_TAB',  \
	 MicroAsm_DD_TAB, 'MicroAsm_DD_TAB',  \
	 MicroAsm_DE_TAB, 'MicroAsm_DE_TAB',  \
	 MicroAsm_DF_TAB, 'MicroAsm_DF_TAB'
	 

section '.reloc' fixups data discardable



;    MicroAsm_FINIT, 'MicroAsm_FINIT',\ 
;	 MicroAsm_GETSTATE_94, 'MicroAsm_GETSTATE_94',\
;	 MicroAsm_SETSTATE_94, 'MicroAsm_SETSTATE_94',\

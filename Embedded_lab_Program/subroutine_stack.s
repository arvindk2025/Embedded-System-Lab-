;The semicolon is used to lead an inline documentation
;Please fill the following before exam
;;;;Your Name:  
;;;;Student Number:
;;;;Program question:
;;;;
;;; Directives
          PRESERVE8
          THUMB

INITIAL_MSP EQU 0x20001000
 
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD INITIAL_MSP     ; stack pointer value when stack is empty
          DCD  Reset_Handler  ; reset vector
  
          ALIGN

;Your Data section
; The program
; Linker requires Reset_Handler
 
		AREA    MYCODE, CODE, READONLY
 
		ENTRY
		EXPORT Reset_Handler

function1 PROC
	PUSH {R5,LR}
	MOV R5,#8
delay
	SUBS R5,R5,#1
	BNE delay
	POP {R5,PC}
	ENDP


Reset_Handler

;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;
Loop
	ADD R0,R0,#1
	CMP R0, #0x80
	BNE Loop
	MOV R5, #9
	BL function1
	MOV R3,#12
stop
	B stop
	END
	
	
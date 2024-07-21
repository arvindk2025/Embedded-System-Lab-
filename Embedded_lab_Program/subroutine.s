;The semicolon is used to lead an inline documentation
;Please fill the following before exam
;;;;Your Name:  
;;;;Student Number:
;;;;Program question:
;;;;
;;; Directives
          PRESERVE8
          THUMB       
 
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD  0x20001000     ; stack pointer value when stack is empty
          DCD  Reset_Handler  ; reset vector
  
          ALIGN

;Your Data section
;AREA DATA

SUMP DCD SUM
SUMP2 DCD SUM2
N DCD 5
	
	AREA MYRAM, DATA, READWRITE
SUM DCD 0
SUM2 DCD 0

; The program
; Linker requires Reset_Handler
 
		AREA    MYCODE, CODE, READONLY
 
		ENTRY
		EXPORT Reset_Handler
			
;;;; Procedure

SUMUP PROC
	ADD R0, R0, R1
	SUBS R1, R1, #1
	BGT SUMUP
	;MOV R9,PC
	;MOV PC,LR
	BX LR
	ENDP

Reset_Handler

;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;

	LDR R1, N
	MOV R0, #0
	BL SUMUP
	LDR R3, SUMUP
	STR R0, [R3]
	LDR R4, [R3]
	MOV R7, #8
	LDR R5, SUMP2
	STR R7, [R5]
	LDR R6, [R5]

STOP
	B STOP
	END
	
	
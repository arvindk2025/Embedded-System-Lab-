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

SUMP DCD 0
N DCD 12
NUM1 DCD 3,-7,2,-2,10,20,30,15,32,8,64,66
POINTER DCD NUM1
	AREA MYRAM, DATA, READWRITE
MAX DCD 0
MIN DCD 0
; The program
; Linker requires Reset_Handler
 
		AREA    MYCODE, CODE, READONLY
 
		ENTRY
		EXPORT Reset_Handler

Reset_Handler

;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;
	LDR R1,N
	LDR R2, POINTER
	LDR R6, [R2]
	MOV R7, R6
LOOP
	ADD R2, R2, #4
	LDR R3, [R2]
	CMP R3, R6
	MOVGT R6, R3
	CMP R3, R7
	MOVLT R7, R3
	SUB R1, R1, #1
	CMP R1, #0
	BGT LOOP
STOP
	B STOP
	END
	
	
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
N DCD 7
NUM1 DCD 3,-7,2,-2,10,20,30
POINTER DCD NUM1
	AREA MYRAM, DATA, READWRITE
; The program
; Linker requires Reset_Handler
 
		AREA    MYCODE, CODE, READONLY
 
		ENTRY
		EXPORT Reset_Handler

Reset_Handler

;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;
	LDR R1,N
	LDR R2, POINTER
	MOV R0, #0
LOOP
	LDR R3, [R2], #4
	CMP R3, #5
	ADDGT R0, R0, R3
	SUBS R1,R1,#1
	BGT LOOP
	LDR R4, SUMP
	STR R0, [R4]
	LDR R6, [R4]
STOP
	B STOP
	END
	
	
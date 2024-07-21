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
N DCD 5
	AREA MYRAM, DATA, READWRITE
SUM DCD 0
; The program
; Linker requires Reset_Handler
 
		AREA    MYCODE, CODE, READONLY
 
		ENTRY
		EXPORT Reset_Handler

Reset_Handler

;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;
	LDR R1,N
	MOV R0,#0
LOOP
	ADD R0,R0,R1
	SUBS R1,R1,#1
	BGT LOOP
	LDR R3,SUMP
	STR R0,[R3]
	LDR R4,[R3]
STOP
	B STOP
	END
	
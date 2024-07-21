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

string1 
	DCB "ARM is easy to learn",0
	
vowels
	DCB "AEIOUaeiou",0

;Your Data section
;AREA DATA

; The program
; Linker requires Reset_Handler
 
		AREA    MYCODE, CODE, READONLY
 
		ENTRY
		EXPORT Reset_Handler

Reset_Handler

;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;
	
	LDR R0,=string1
	LDR R3,=vowels
	MOV R1,#0
LOOPCOUNT
	LDRB R2,[R0]
	CMP R2,#0
	BEQ countDONE
	ADD R4,R3,#0
LOOPVOWELS
	LDRB R5,[R4]
	CMP R5,#0
	BEQ DONEVOWELS
	CMP R2,R5
	ADD R4,#1
	BNE LOOPVOWELS
	ADD R1,#1
DONEVOWELS
	ADD R0,#1
	B LOOPCOUNT
countDONE
STOP
	B STOP
	END
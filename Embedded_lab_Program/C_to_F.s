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

; The program
; Linker requires Reset_Handler
 
		AREA    MYCODE, CODE, READONLY
 
		ENTRY
		EXPORT Reset_Handler

Reset_Handler

;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;
		;; Celsius to Farenheit
		MOV R0, #10
		MOV R1, #9
		MUL R0, R0, R1
		MOV R1, #5
		UDIV R0, R0, R1
		ADD R0, R0, #32
		;; Farenheit to Celsius
		SUB R2, R0, #32
		MOV R1, #5
		MUL R2, R2, R1
		MOV R1, #9
		UDIV R2, R2, R1
		
		END
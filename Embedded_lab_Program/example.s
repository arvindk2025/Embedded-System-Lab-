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
	MOV R2, #0x01 			; R2 = 0x00000001
	MOV R3, #0x02			; R3 = 0x00000002
	MOV R5, #0x3210			; R5 = 0x00003210
	MOVT R5, #0x7654			; R5 = 0x76543210
	MOV32 R6, #0x87654321			; R6 = 0x87654321
	LDR R7, = 0x87654321			; R7 = 0x87654321
	ADD R1, R2, R3			; R1 = 0x00000003
	MOV32 R3, #0xFFFFFFFF			; R3 = 0xFFFFFFFF
	ADDS R1, R2, R3			; R1 = 0x00000000
	SUBS R1, R2, R3			; R1 = 0x00000002
	MOV32 R4, #0xFFFFFFFF			; R4 = 0xFFFFFFFF
	ADD R1, R2, R4			; R1 = 0x00000000
	ADDS R1, R2, R4			; R1 = 0x00000000
	MOV R2, #0x00000002			; R2 = 0x00000002
	ADDS R1, R2, R4			; R1 = 0x00000001
	MOV R2, #0x00000001			; R2 = 0x00000001
	MOV R3, #0x00000002			; R3 = 0x00000002
	ADDS R1, R2, R3			; R1 = 0x00000003
	MOV R2, #0x7FFFFFFF			; R2 = 0x7FFFFFFF
	MOV R3, #0x7FFFFFFF			; R3 = 0x7FFFFFFF
	ADDS R1, R2, R3			; R1 = 0xFFFFFFFE
	END ;End of the program
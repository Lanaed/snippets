TITLE Homework 1			(Homework1.asm)

; Author: Ethan Spiro
; Course / Project ID: CS271			Due Date: 1/19/14
; Description: Display your name and program title, display instructions for the user,
; prompt the user for 2 numbers, calculate (sum, difference, product, integer quotient
; and remainder of the numbers), display a terminating messsage.
;For EC considerations I validated number 2 was less than number 1 and gave the user
;the option of playing until they wanted to quit. 

INCLUDE Irvine32.inc

.data
myName			BYTE	"My name is Ethan ", 0
programTitle	BYTE	"and this program is called Homework1", 0
instructions_1	BYTE	"Welcome user, please enter 2 numbers: ", 0
goodBye			BYTE	"Program terminating, goodbye!", 0
number_1_prompt	BYTE	"First Number: ",0
number_2_prompt	BYTE	"Second Number: ",0
number_1		DWORD	?	;first number entered
number_2		DWORD	?	;second number entered
sum				DWORD	?
difference		DWORD	?
product			DWORD	?
quotient		DWORD	?
remainder		DWORD	?
sum_prompt		BYTE	"The sum of the two numbers is: ",0
diff_prompt		BYTE	"The difference of the two numbers is: ",0
prod_prompt		BYTE	"The product of the two numbers is: ",0
quot_prompt		BYTE	"The quotient of the two numbers is: ",0
remain_prompt	BYTE	" with remainder: ",0
equals			BYTE	" = ",0
minus			BYTE	" - ",0
plus			BYTE	" + ",0
multiply		BYTE	" x ",0
divide			BYTE	" % ",0
play_again		BYTE	"Would you like to play again, 1 for yes, any other key for no: ", 0
play			DWORD	1		;choice if user wants to play again

.code
main PROC

startAgainLoop:		;EC: jmp destination if user wants to play again
; Introduction, section 1
; Display name and program title
	mov		edx, OFFSET myName
	call	WriteString
	mov		edx, OFFSET programTitle
	call	Writestring
	call	CrLf
; Display instructions for user
	mov		edx, OFFSET instructions_1
	call	Writestring
	call	CrLf

; Get the Data, section 2
; Get number 1
	mov		edx, OFFSET number_1_prompt
	call	WriteString
	call	ReadInt
	mov		number_1, eax
; Get number 2
greaterloop:			;EC: Validate the second number to be less than the first
	mov		edx, OFFSET number_2_prompt
	call	WriteString
	call	ReadInt
	cmp		eax, number_1
	jg		greaterloop	;if EAX > first number entered, it jumps back to greaterloop
	mov		number_2, eax

; Calculate the required values, section 3
; Calculate sum
	mov		eax, number_1
	add		eax, number_2
	mov		sum, eax
; Calculate difference
	mov		eax, number_1
	sub		eax, number_2
	mov		difference, eax
; Calculate product
	mov		eax, number_1
	mov		ebx, number_2
	mul		ebx
	mov		product, eax		
; Calculate the integer quotient and remainder and display
	mov		eax, number_1
	cdq
	mov		ebx, number_2
	div		ebx
	mov		quotient, eax
	mov		remainder, edx

; Display results, section 4
; Display sum
	mov		edx, OFFSET sum_prompt
	call	WriteString
	mov		eax, number_1
	call	WriteDec
	mov		edx, OFFSET plus
	call	WriteString
	mov		eax, number_2
	call	WriteDec
	mov		edx, OFFSET equals
	call	WriteString
	mov		eax, sum
	call	WriteDec
	call	CrLf
; Display difference
	mov		edx, OFFSET diff_prompt
	call	WriteString
	mov		eax, number_1
	call	WriteDec
	mov		edx, OFFSET minus
	call	WriteString
	mov		eax, number_2
	call	WriteDec
	mov		edx, OFFSET equals
	call	WriteString
	mov		eax, difference
	call	WriteDec
	call	CrLf
; Display product
	mov		edx, OFFSET prod_prompt
	call	Writestring
	mov		eax, number_1
	call	WriteDec
	mov		edx, OFFSET multiply
	call	WriteString
	mov		eax, number_2
	call	WriteDec
	mov		edx, OFFSET equals
	call	WriteString
	mov		eax, product
	call	WriteDec
	call	CrLf
; Display quotient and remainder
	mov		edx, OFFSET quot_prompt
	call	WriteString
	mov		eax, number_1
	call	WriteDec
	mov		edx, OFFSET divide
	call	WriteString
	mov		eax, number_2
	call	WriteDec
	mov		edx, OFFSET equals
	call	WriteString
	mov		eax, quotient
	call	WriteInt
	mov		edx, OFFSET remain_prompt
	call	WriteString
	mov		eax, remainder
	call	WriteInt
	call	CrLf

;EC: prompt user to play again
	mov		edx, OFFSET play_again
	call	WriteString
	call	ReadInt
	cmp		eax, play
	je		startAgainLoop

; Say goodbye, section 5
	mov		edx, OFFSET goodBye
	call	Writestring
	call	CrLf

	exit		; exit to operating system
main ENDP

END main
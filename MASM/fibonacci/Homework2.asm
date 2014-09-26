TITLE Homework2			(Homework2.asm)

; Author: Ethan Spiro
; Course: CS271			Due Date: 1/26/14
; Description: Write a program to display fibonnacci numbers, allow the user to choose
; between 1 and 46 numbers to display. Protect against input. EC option display in
; columns.

INCLUDE Irvine32.inc

UPPERLIMIT = 46		;constant for the upper limit of numbers

.data
myTitle				BYTE	"Program Title: Fibonnacci Sequence - Author: Ethan Spiro",0
greeting_prompt1	BYTE	"Please enter your name: ",0
greeting_prompt2	BYTE	"Hello, ",0
greeting_prompt3	BYTE	" and welcome to my program!",0
instructions		BYTE	"How many fibonacci terms would you like to calculate [1-46]: ",0
fail1				BYTE	"Sorry that number is too high, try again: ",0
fail2				BYTE	"Sorry that number is too low, try again: ",0
goodbye				BYTE	"Program ending, goodbye ",0
user_name			BYTE	33 DUP(0)
user_num			DWORD	?		;n fibonnacci numbers
num1				DWORD	1		;starter value for loop
num2				DWORD	0		;starter value for loop
count				DWORD	6		;counter for printing 5 numbers a line
spacingCounter		DWORD	0		;counter for overflowing tabs

.code
main PROC

; introduction which displays title, programmer name, gets the user name and greets them
	mov		edx, OFFSET myTitle
	call	WriteString
	call	Crlf
	mov		edx, OFFSET greeting_prompt1
	call	WriteString
	mov     edx, OFFSET user_name
    mov     ecx, 32
    call    ReadString		;read user name (string)
	mov		edx, OFFSET greeting_prompt2
	call	WriteString
	mov		edx, OFFSET user_name
	call	WriteString
	mov		edx, OFFSET greeting_prompt3
	call	WriteString
	call	Crlf

; instructions for user
	mov		edx, OFFSET instructions
	call	WriteString
	
; get the user data and validate
userInput:
	call	ReadInt
	mov		user_num, eax
	call	Crlf
	cmp		eax, UPPERLIMIT		;compare to 46
	jg		tooHigh
	cmp		eax, 1
	jl		tooLow
	jmp		valid				;if num is between [1 and 46], go to valid
tooHigh:
	mov		edx, OFFSET fail1	;display fail message
	call	WriteString
	jmp		userInput			;jump back to entering user input
tooLow:
	mov		edx, OFFSET fail2	;display fail message
	call	WriteString
	jmp		userInput			;jump back to entering user input

; display fibonacci sequence
valid:
	mov		ecx, user_num	;user input decrements -1 each time loop iterates
start:
	cmp		count, 0
	dec		count
	jg		continue	;jump to continue if 5 numbers havent been printed
	call	CrlF		;if > 5 have been printed, go to a new line
	add		count, 5	;reset the counter
continue:
	inc		spacingCounter	;keeps track of total numbers printed
	mov		eax, num1
	add		eax, num2
	mov		ebx, num2
	mov		num1, ebx
	mov		num2, eax
	call	WriteDec
	cmp		spacingCounter, 35	;after this point you only need 1 tab between output because of overflow
	jge		skipSpace			;when more than 34 numbers have been printed skip the first tab (space)
	mov		al, TAB				;tab between numbers
	call	WriteChar
skipSpace:
	mov		al, TAB
	call	WriteChar
	loop	start

; farewell
	call	Crlf
	mov		edx, OFFSET goodbye
	call	WriteString
	mov		edx, OFFSET user_name
	call	WriteString
	call	Crlf


	exit		; exit to operating system
main ENDP

END main
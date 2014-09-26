TITLE Homework4 		(Homework4.asm)

; Author: Ethan Spiro
; Course / Project ID: CS271		Due Date: 2/16/14
; Description: Write a program to calculate prime numbers. The user will
; enter the number of primes to be displayed in the [1-200] range with error
; checking. They will be reprompted if the number entered is out of range. The
; program will calculate and display all the prime numbers up to and including
; the nth prime. The result should display 10 primes per line with atleast 3
; spaces between the numbers. Other requirements: programmers name must appear,
; loop must be MASM loop instruction, the main procedure must be mainly procedure
; call (atleast introduction, getUserData + validate, showPrimes + isPrime, farewell),
; the upper limit is a constant.


INCLUDE Irvine32.inc

UPPERLIMIT = 200

.data
myTitle				BYTE	"Program Title: Homework 4 - Author: Ethan Spiro",0
greeting_prompt		BYTE	"Hello user, welcome to my program!",0
instructions		BYTE	"Enter number of primes to be calculated: [1-200]: ",0
enter_fail			BYTE	"Sorry that number is not in the [1-200] range!", 0
goodbye				BYTE	"Goodbye, hope you enjoyed my program!", 0
numberOfPrimes		DWORD	?
currentPrime		DWORD	?
check				DWORD	?
checkCounter		DWORD	?
newLineCounter		DWORD	?

.code
main PROC

	call	introduction
	call	getUserData
	call	showPrimes
	call	farewell

	exit		; exit to operating system
main ENDP

;--------------------------------------------------------------
; Procedure: introduction
; Description: Displays the title of the program and my name
;--------------------------------------------------------------
introduction PROC
	mov		edx, OFFSET myTitle
	call	WriteString
	call	Crlf
	mov		edx, OFFSET greeting_prompt
	call	WriteString
	call	Crlf
	ret
introduction ENDP

;--------------------------------------------------------------
; Procedure: getUserData
; Description: Displays instructions for the user to enter a
; number from 1-200. Calls validate to check if the number
; entered is in the acceptable range.
;--------------------------------------------------------------
getUserData PROC
	mov		edx, OFFSET instructions
	call	WriteString
	call	ReadInt
	call	validate	;call the validate procedure
	ret
getUserData ENDP

;--------------------------------------------------------------
; Procedure: validate
; Description: takes the number entered by user and compares it
; to the upper limit (200) and the lower limit (1). Displays
; an error message and returns to beggining of getUserData proc
; if the number is invalid. If the number is valid, it stores
; the number in numberOfPrimes and returns.
;--------------------------------------------------------------
validate PROC
	jmp		skip		;skip the error message intitially
invalidInput:
	mov		edx, OFFSET	enter_fail
	call	WriteString
	call	Crlf
	jmp		getUserData		;jumps back to have the user enter another number
skip:
	cmp		eax, UPPERLIMIT
	jg		invalidInput	;if num > 200 go to invalidInput
	cmp		eax, 1
	jl		invalidInput	;if num < 1 go to invalidInput
	mov		numberOfPrimes, eax ;if valid store the number in numberOfPrimes
	ret
validate ENDP

;--------------------------------------------------------------
; Procedure: showPrimes
; Description: Displays the x (numberOfPrimes) prime numbers
; with 10 per lines and evenly spaced in columns. Calls isPrime
; in a (required) loop to fetch the next prime number.
;--------------------------------------------------------------
showPrimes PROC
	mov		eax, numberOfPrimes
	mov		ecx, eax	;set up the loop
	mov		currentPrime, 2 ;first prime number
start:
	mov		eax, currentPrime
	call	WriteDec ;write the prime
	mov		al, TAB
	call	WriteChar	;tab to next column
	inc		newLineCounter
	cmp		newLineCounter, 10	;check if 10 numbers have been printed
	je		breakLine
	jl		findPrime
breakLine:
	mov		newLineCounter, 0 ;reset the counter
	call	Crlf	;print on a new line
findPrime:
	pushad	;push registers onto stack to preserve this loop
	call	isPrime
	popad	;pop registers off stack to continue with this loop
	loop	start
	ret
showPrimes ENDP

;--------------------------------------------------------------
; Procedure: isPrime
; Description: Takes the current prime number and increments it.
; Divides this incremented number by a 'checking loop' and starts
; over with another incrementation of the original number if the
; remainder = 0. Else, it returns the next prime number.
;--------------------------------------------------------------
isPrime PROC
	
	mov		checkCounter, 0	;set this counter to 0
	mov		check, 1	;move 1 into the check
	mov		edx, 0	;move 0 into edx
	inc		currentPrime	;increment the current prime number
start:
	mov		eax, currentPrime
	mov		ebx, check
	cdq
	div		ebx	;divide the incremented current prime by the checker (factor)
	cmp		edx, 0 ;see if the remainder is 0
	je		greaterTwo ;if its equal jump to greaterTwo
	jg		soFarValid	;if edx contains a remainder, jump to soFarValid
greaterTwo: ;checks to make sure not dividing by 2
	inc		checkCounter
	cmp		checkCounter, 2
	jl		soFarValid
	je		invalid
soFarValid:
	mov		edx, 0
	inc		check ;try the next factor
	jmp		start	;try again
invalid:
	mov		eax, check
	cmp		eax, currentPrime
	je		timeToReturn
	jl		isPrime
timeToReturn:
	ret
isPrime ENDP

;--------------------------------------------------------------
; Procedure: farewell
; Description: Displays a goodbye to the user.
;--------------------------------------------------------------
farewell PROC
	call	Crlf
	call	Crlf
	mov		edx, OFFSET goodbye
	call	WriteString
	call	Crlf
	ret
farewell ENDP

END main
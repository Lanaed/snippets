TITLE Homework 3		(Homework3.asm)

; Author: Ethan Spiro
; Course / Project ID: CS271		Due Date: 2/9/14
; Description: Write a program that displays the title and programmers name, gets
; the users name and greets the user. Displays the instructions for the user.
; Repeatedly prompts the user to enter a number. Validate the user input to be less
; than or equal to 100. Count and accumulate the valid user numbers until a negative
; number is entered (negative discarded). Calculate the (rounded integer) average of
; non-negative numbers. Display - the count of non-negative numbers entered (if none,
; then display another message saying none), the sum of non-negative numbers entered,
; the average rounded to the nearest integer, a parting message (with the user's name)


INCLUDE Irvine32.inc

UPPERLIMIT = 100

.data
myTitle				BYTE	"Program Title: Homework 3 - Author: Ethan Spiro",0
greeting_prompt1	BYTE	"Please enter your name: ",0
greeting_prompt2	BYTE	"Hello, ",0
greeting_prompt3	BYTE	" and welcome to my program!",0
user_name			BYTE	33 DUP(0)
instructions_1		BYTE	"Enter numbers 0-100 and I will find the average, sum them and count how many ",0
instructions_2		BYTE	"you entered, enter a negative number to see the results.", 0
prompt				BYTE	"Enter a number [0-100] or negative to exit: ", 0
display_none		BYTE	"You didn't enter any numbers so nothing to calculate!", 0
display_count		BYTE	"Total numbers entered = ", 0
display_sum			BYTE	"The sum of the numbers entered = ", 0
display_average		BYTE	"The rounded integer average = ", 0
goodbye_1			BYTE	"Goodbye ", 0
goodbye_2			BYTE	", hope yoy enjoyed my program!", 0
sum					DWORD	0
count				DWORD	0
average				DWORD	?
remainder			DWORD	?
error_1				BYTE	"Sorry that number is over 100, try again", 0		

.code
main PROC

; Display program title and programmers name
	mov		edx, OFFSET myTitle
	call	WriteString
	call	Crlf

; Get users name
	mov		edx, OFFSET greeting_prompt1
	call	WriteString
	mov     edx, OFFSET user_name
    mov     ecx, 32
    call    ReadString		;read user name (string)

; Greet the user with their name
	mov		edx, OFFSET greeting_prompt2
	call	WriteString
	mov		edx, OFFSET user_name
	call	WriteString
	mov		edx, OFFSET greeting_prompt3
	call	WriteString
	call	Crlf
	call	Crlf

; Display instructions for user
	mov		edx, OFFSET instructions_1
	call	WriteString
	call	Crlf
	mov		edx, OFFSET instructions_2
	call	WriteString
	call	Crlf
	call	Crlf
	jmp		start ;jump to start of the program

invalidInput:
	mov		edx, OFFSET error_1
	call	WriteString ;tell the user they entered over 100
	call	Crlf

start:
; Repeatedly prompt for user to enter numbers
	mov		edx, OFFSET prompt
	call	WriteString
		
; Validate the input
	call	ReadInt
	cmp		eax, UPPERLIMIT
	jg		invalidInput ;if input over 100 jump to invalid input
	cmp		eax, 0
	jl		userexit ;if input is less than zero, exit this loop
	add		sum, eax ;add the input to sum if it passes
	inc		count ;increment the count if input passes
	jmp		start ;jump to start of loop

userexit:
;checking to see if the display can be skipped if the user didnt enter any numbers
	cmp		count, 0
	je		skipDisplay ;jump to skipDisplay if user didnt enter any valid numbers

; Calcuate the rounded average of numbers
	mov		eax, sum
	cdq
	mov		ebx, count
	div		ebx
	mov		average, eax
	mov		remainder, edx
	cmp		remainder, 0
	je		dontRoundUp ;account for remainder = 0
	; compare previous divisor and remainder to determine rounding
	mov		eax, count
	cdq
	mov		ebx, remainder
	div		ebx
	cmp		eax, 1
	jg		dontRoundUp
	add		average, 1
	
dontRoundUp:

; Display the count, sum and average
	call	Crlf
	call	Crlf
; the count of non negative numbers
	mov		edx, OFFSET display_count
	call	WriteString
	mov		eax, count
	call	WriteDec
	call	Crlf
; the sum
	mov		edx, OFFSET display_sum
	call	WriteString
	mov		eax, sum
	call	WriteDec
	call	Crlf	
; the average
	mov		edx, OFFSET display_average
	call	WriteString
	mov		eax, average
	call	WriteDec
	call	Crlf
	jmp		goodbye

skipDisplay:
	mov		edx, OFFSET display_none
	call	WriteString
	call	Crlf

goodbye:
; Display parting message w/ users name
	call	Crlf
	mov		edx, OFFSET goodbye_1
	call	WriteString
	mov		edx, OFFSET user_name
	call	WriteString
	mov		edx, OFFSET goodbye_2
	call	WriteString
	call	Crlf

	exit		; exit to operating system
main ENDP

END main
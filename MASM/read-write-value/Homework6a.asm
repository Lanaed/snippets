TITLE Homework 6a		(Homework6a.asm)

; Author: Ethan Spiro
; Course / Project ID: CS271		Due Date: 2/16/14 GRACE DAYS INVOKED 2/18/14
;
; Description: (1) Implement and test your own ReadVal and WriteVal procedures for
; unsigned integers. (2) Implement macros getString and displayString. The macros
; may use Irvine's ReadString to get input from the user, and WriteString to display
; output (a) getString should display a prompt, then get the user's keyboard input into
; a memory location (b) displayString should dispaly the string stored in a specified 
; memory location (c) readVal should invoke the getString macro to get the user's string
; of digits. It should then convert the digit string to numeric, while validating the
; user's input (d) writeVal should convert a numeric value to a string of digits, and
; invoke the displayString macro to produce the output. (3) Write a small test program
; that gets 10 valid integers from the user and stores the numeric values in an array. 
; The program then displays the integers, their sum, and their average. Additonal
; requirements in instructions.
;
;
; *Note to Grader to make viewing easier: Program Structure is this:
;	main {
;		macro greeting
;		call ReadVal in loop to fill array + macro
;		call WriteVal in a loop to display + macro
;		calculate sum, display with WriteVal + macro
;		calculate average, display with WriteVal + macro
;		macro goodbye
;	}

INCLUDE Irvine32.inc

;----------------------------------------------------------------------------------------
; Macro: mGetString
; Description: Gets the user's keyboard input into a memory location. 
; Parameters: adress, length
; Registers used: ecx, edx
;----------------------------------------------------------------------------------------
mGetString	 MACRO address, length	
	push	edx
	push	ecx
	mov  	edx, address
	mov  	ecx, length
	call 	ReadString
	pop		ecx
	pop		edx
ENDM

;----------------------------------------------------------------------------------------
; Macro: mDisplayString
; Description: Displays the string stored in a specified memory location.
; Parameters: theString
; Registers used: edx
;----------------------------------------------------------------------------------------
mDisplayString	MACRO	theString
	push	edx
	mov		edx, OFFSET theString
	call	WriteString
	pop		edx
ENDM

;constant for number of integers
NUMS = 10

.data

;string messages
programDes1		BYTE	"Program asks for 10 integers, validates them, sums them and averages them.",0
programDes2		BYTE	"Uses: Macros, parameter passing, byte by byte validation, integer/string conversion",0
author			BYTE	"Author: Ethan Spiro",0
prompt1			BYTE	"Enter an integer (32-bit): ", 0
errorMessage	BYTE	"Sorry, that is an invalid integer! Try again: ",0
valuesMessage	BYTE	"You entered: ",0
sumMessage		BYTE	"The sum is: ",0
averageMessage	BYTE	"The average of the numbers you entered is: ",0
partingMessage	BYTE	"Goodbye! Hope you enjoyed this program!", 0

;variables for holding the sum and average
sum				DWORD	?
average			DWORD	?

;for input
buffer			BYTE	255 DUP(0)

;for temporary strings in WriteVal proc
tempString	BYTE	32 DUP(?);

;array for storing numbers
arrayOfNums		DWORD	10 DUP(0)

.code
main PROC

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;display the program description
	mDisplayString	programDes1
	call	Crlf
	mDisplayString	programDes2
	call	Crlf
	mDisplayString	author
	call	Crlf
	call	Crlf

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;call ReadVal in a loop to fill the array
;set up loop controls
	mov		ecx, NUMS
	mov		edi, OFFSET arrayOfNums

userEntersValues:
;display prompt for enterng an integer
	mDisplayString	prompt1

;push parameters onto stack and call ReadVal
	push	OFFSET buffer
	push	SIZEOF buffer
	call	ReadVal

;go to next spot in array	
	mov		eax, DWORD PTR buffer
	mov		[edi], eax
	add		edi, 4		;add 4 for next DWORD element

;loop to top of loop if not 10 values yet
	loop	userEntersValues

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;Show the user what they entered into the array

;set up loop variables
	mov		ecx, NUMS
	mov		esi, OFFSET arrayOfNums
	mov		ebx, 0	;for use in calculating sum

;display message
	mDisplayString	valuesMessage	;call macro to display message
	call	crlf

;calculate the sum of the array and print numbers to console
continueSumming:
	mov		eax, [esi]
	add		ebx, eax	;add eax to the sum
;push parameters eax and tempString and call WriteVal to display the numbers the user entered
	push	eax
	push	OFFSET tempString
	call	WriteVal
	call	crlf
	add		esi, 4		;increment the array looper
	loop	continueSumming

;display the sum
	mov		eax, ebx	;move the sum into eax, sum is in ebx
	mov		sum, eax
	mDisplayString	sumMessage
;push sum and tempString paramaters and call WriteVal to diplay the sum as a string
	push	sum
	push	OFFSET tempString
	call	WriteVal
	call	crlf

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;calculate the average of the numbers in the array (sum is in eax)

;clear edx and move 10 into ebx
	mov		ebx, NUMS
	mov		edx, 0

;divide the sum by 10
	div		ebx

;determine if average needs to be rounded up
	mov		ecx, eax
	mov		eax, edx
	mov		edx, 2
	mul		edx
	cmp		eax, ebx
	mov		eax, ecx
	mov		average, eax
	jb		notRoundedUp
	inc		eax				;else increase it by 1 to round up
	mov		average, eax

notRoundedUp:
	mDisplayString	averageMessage	;use macro to display message
;push parameters average and tempString onto the stack and call WriteVal
	push	average
	push	OFFSET tempString
	call	WriteVal
	call	Crlf
	call	Crlf

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
;display a parting message
	mDisplayString	partingMessage
	call	Crlf

	exit		; exit to operating system
main ENDP

;----------------------------------------------------------------------------------------
; Procedure: ReadVal
; Description: Invokes the mGetString macro to get the user's string of digits. Converts
; the digits string to numeric, while validating the user's input.
; Parameters: OFFSET buffer, SIZEOF buffer
;----------------------------------------------------------------------------------------

readVal PROC
	push	ebp
	mov		ebp, esp
	pushad	;push all registers to save

startAgain:
	mov		edx, [ebp+12]	;@address of buffer byte array
	mov		ecx, [ebp+8]	;size of buffer byte array into ecx

;read the input
	mGetString	edx, ecx	;invoke the getString macro to read in the users string

;set up registers for conversion
	mov		esi, edx		;move the address of buffer into esi
	mov		eax, 0
	mov		ecx, 0
	mov		ebx, 10

;load the string in byte by byte
ByteByByte:
	lodsb					;loads from memory at esi
	cmp		ax, 0			;check if we have reached the end of the string
	je		finished		;if so jump to finish

;check the range to make sure char is a int in ascii
	cmp		ax, 48	;0 is at 48
	jb		error
	cmp		ax, 57	;9 is at 57
	ja		error

;adjust for value of digit
	sub		ax, 48			;-48 for value of digit
	xchg	eax, ecx		;place character value in ecx
	mul		ebx				;multiply by 10 for correct digit place
	jc		error			;jmp if carry flag is set meaning overflow pg. 191 textbook
	jnc		errorFree		;jmp to errorFree if no carry flag is set pg. 191 textbook

error:
	mDisplayString	errorMessage
	jmp startAgain			;start over bc invalid input

errorFree:
	add		eax, ecx		;add the digit (in correct spot) to the total of int
	xchg	eax, ecx		;exchange for the next loop through
	jmp		ByteByByte		;examine next byte
	
finished:
	xchg	ecx, eax
	mov		DWORD PTR buffer, eax	;move eax to the pointer to save the int in passed variable

	popad		;restore all registers
	pop ebp
	ret 8
readVal ENDP

;----------------------------------------------------------------------------------------
; Procedure: WriteVal
; Description: Converts a numeric value to a string of digits, and invokes the mDisplayString
; macro to produce the output.
; Parameters: integer (to convert) and a temporary string (memory) to write the output
;----------------------------------------------------------------------------------------
writeVal PROC
	push	ebp
	mov		ebp, esp
	pushad		;save all registers

;set up for looping through the integer
	mov		eax, [ebp+12]	;move the integer to convert to a string to eax
	mov		edi, [ebp+8]	;move the @adress to edi to store the string
	mov		ebx, 10			;for finding the "digit spot"
	push	0				;indicates the top of the stack

convert:
	mov		edx, 0
	div		ebx
	add		edx, 48
	push	edx			;push next digit onto the stack

;check if the end
	cmp		eax, 0
	jne		convert

;pop the digits off the stack
popLoop:
	pop		[edi]
	mov		eax, [edi]
	inc		edi					;increment counter
	cmp		eax, 0				;check if the end
	jne		popLoop				;keep popping if not the end of string

;write it as a string using the macro
	mov		edx, [ebp+8]
	mDisplayString	OFFSET tempString
	call	Crlf

	popad		;restore all registers
	pop ebp
	ret 8
writeVal ENDP

END main
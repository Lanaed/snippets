TITLE Homework 5		(Homework5.asm)

; Author: Ethan Spiro
; Course / Project ID: CS271		Due Date: 3/2/14
; Description: Write a program that does the following tasks: (1) introduces the program
; (2) gets a user request in the range [min = 10...max = 200], (3) generate request 
; random inegers in the range [lo = 100...hi = 999], storing them in consecutive elements
; of an array, (4) display the list of integers before sorting, 10 numbers per line,
; (5) sort the list in descending order (ie largest first), (6) calculate and display the
; median value, rounded to the nearest integer, (7) Display the sorted list, 10 number
; per line. Additional requirements in assignment description. 
; Extra Credit considerations: aligned columns

INCLUDE Irvine32.inc

MIN = 10
MAX = 200
LO = 100
HI = 999

.data

myTitle				BYTE	"Program Title: Homework 5 - Author: Ethan Spiro",0
greeting_prompt		BYTE	"Hello user, welcome to my program!",0
description_1		BYTE	"This program generates random numbers in the range of [100...999], ",0
description_2		BYTE	"displays the original list, sorts the list, and caluclates the ",0
description_3		BYTE	"median value. It displays the list in sorted descending order.",0
instructions		BYTE	"How many numbers should be generated [10...200]: ",0
fail				BYTE	"Sorry that number was not in [10...200] range, try again...",0
medianTitle			BYTE	"The median is:",0

request				DWORD	?	;how many (random) integers to fill the array
counter				DWORD	?	;to keep track of numbers printed on a line
middleFlag			DWORD	?	;to keep track of spot in the list for calculating median

unsortedTitle		BYTE	"Unsorted list of random numbers:",0
sortedTitle			BYTE	"Sorted list of random numbers:",0

myArray		DWORD	MAX		DUP(?)	;array of (random) integers

.code
main PROC

;initialize sequence based on system clock
	call	Randomize

;call the introuction procedure
	call	introduction

;call the getData procedure
;pass parameters: request(reference)
	push	OFFSET request
	call	getData

;call the fillArray procedure
;pass parameters: array(reference), request(value)
	push	OFFSET myArray
	push	request
	call	fillArray

;call the displayList procedure to display the unsorted array
;pass parameters: array(reference), request(value), unortedTitle(reference)
	push	OFFSET myArray
	push	request
	push	OFFSET unsortedTitle
	call	displayList

;call the sortList procedure to sort the array
;pass parameters: array(reference), request(value)
	push	OFFSET myArray
	push	request
	call	sortList
	call	Crlf

;call the displayMedian procedure to display the median
;pass paramters: array(reference), request(value), middleFlaf(reference)
	push	OFFSET	myArray
	push	request
	push	OFFSET middleFlag
	call	displayMedian

;call the displayList procedure (again) to display the sorted array
;pass paramters: array(reference), request (value), sortedTitle(reference)
	push	OFFSET myArray
	push	request
	push	OFFSET sortedTitle
	call	displayList

	exit		; exit to operating system
main ENDP

;----------------------------------------------------------------------------------------
; Procedure: introduction
; Description: Displays the title of the program, author's name, and description of the
; program.
; Parameters: none
;----------------------------------------------------------------------------------------
introduction PROC
	mov		edx, OFFSET myTitle
	call	WriteString
	call	Crlf
	mov		edx, OFFSET greeting_prompt
	call	WriteString
	call	Crlf
	call	Crlf
	mov		edx, OFFSET description_1
	call	WriteString
	call	Crlf
	mov		edx, OFFSET description_2
	call	WriteString
	call	Crlf
	mov		edx, OFFSET description_3
	call	WriteString
	call	Crlf
	ret
introduction ENDP

;----------------------------------------------------------------------------------------
; Procedure: getData
; Description: Gets and validates user data in [10...200] range
; Parameters: request(reference)
;----------------------------------------------------------------------------------------
getData PROC
	push	ebp
	mov		ebp, esp
start:
	call	Crlf
	mov		edx, OFFSET instructions
	call	WriteString
	call	ReadInt		;read the user input
	cmp		eax, MAX	;compare to global variable MAX
	jg		invalid		;if its too high jump to invalid block
	cmp		eax, MIN	;compare to global variable MIN
	jl		invalid		;if its too low jump to invalid block
	jmp		valid		;else ski invalid, jump to valid
invalid:
	mov		edx, OFFSET fail	
	call	WriteString		;tell the user their input was invalid
	call	Crlf
	jmp		start			;start over
valid:
	mov		ebx, [ebp+8]	;@request in ebx
	mov		[ebx], eax		;store value read (in eax) in request 
	pop		ebp
	ret		4
getData ENDP

;----------------------------------------------------------------------------------------
; Procedure: fillArray
; Description: Generates request# of random integers in the range of [LO = 100..HI = 999]
; and stores them in consecutive elements in an array.
; Parameters: request(value), array(reference)
;----------------------------------------------------------------------------------------
fillArray PROC
	mov		counter, 0		;initilaize the counter to 0
	push	ebp
	mov		ebp, esp
	mov		edi, [ebp+12]	;@myArray in edi
	mov		ecx, [ebp+8]	;value of request in ecx
fill:
;Generates a random number in hi...lo range
	mov		eax, HI
	sub		eax, LO
	inc		eax
	call	RandomRange
	add		eax, LO
;store in the array
	mov		[edi], eax
;point to next element in array and loop
	add		edi, 4	
	loop	fill
;return to main procedure
	pop		ebp
	ret		8
fillArray ENDP

;----------------------------------------------------------------------------------------
; Procedure: sortList
; Description: Sorts the array in descending order using Bubble Sort
; Parameters: array(reference), request(value)
;----------------------------------------------------------------------------------------
sortList PROC
	push	ebp				
	mov		ebp, esp
	mov		ecx, [ebp+8]	;@request in ecx as loop counter
	dec		ecx				;dont want to compare last element and one out of bounds
outerLoop:
	push	ecx				;store outer loop
	mov		esi, 0	        ;set esi to 0 (first element)
innerLoop:
	mov		eax, [ebp+12]		;store the offset of the array into eax
	mov		eax, [eax + esi]	;retrieve the number at @array+esi
	mov		ebx, [ebp+12]		;store the offset of array into ebx
	mov		ebx, [ebx + esi + 4]	;retrieve the [element+1] @array+esi+4
	cmp		ebx, eax			;compares elements in array A[element] and A[element+1]
	jl		increment			;if next element is less than current, jump to increment (dont swap)
	xchg	eax, ebx			;if its greater than or equal to, swap the values
	mov		edx, [ebp+12]		;store the offset of the array into edx
	mov		[edx + esi], eax	;store the number in eax at @array+esi
	mov		edx, [ebp+12]		;store the offset of the array into edx
	mov		[edx + esi + 4], ebx	;store the number in ebx at @array+esi+4
increment:
	add		esi, 4	;increment to look at next pair of values
;execute loops
	loop	innerLoop
	pop		ecx		;restore outer loop
	loop	outerLoop
	pop		ebp
	ret		8	;2 parameters
sortList ENDP

;----------------------------------------------------------------------------------------
; Procedure: displayMedian
; Description: Displays the median of the program. Differes depending on if there are an
; even or odd number of numbers in the list
; Parameters: array(reference), request(value), middleFlag(reference)
;----------------------------------------------------------------------------------------
displayMedian PROC
;write the title
	call	Crlf
	mov		edx, OFFSET medianTitle
	call	writestring
	call	Crlf
;set up for accessing array and request
	push	ebp				
	mov		ebp, esp
	mov		esi, 0
	mov		edx, 0

; Determines if we are finding the median of an odd or even set of numbers
	mov		eax, [ebp+12]	;move the # of numbers displayed into eax
	mov		ebx, 2	
	cdq
	div		ebx				;divide by 2 to see if there is a remainder
	mov		[ebp+8], eax	; move the middle spot into middleFlag (one above actual middle for even numbers)	
	cmp		edx, 0			;if evenly divisible, then its even, if there is a remainder, its odd
	jg		oddMedian		;its odd
	je		evenMedian		;its even

oddMedian:
; use #elements in array, divide by 2 and multiply that by 4 for the esi index
	mov		eax, [ebp+8]		;index in the array we need
	mov		ebx, 4				;multiply it by 4 to get esi index (DWORD)
	mul		ebx
	mov		esi, eax
	mov		eax, [ebp+16]		;store the offset of the array into eax
	mov		eax, [eax + esi]	;retrieve the number at @array+esi
	call	writeDec
	call	Crlf
	jmp		returning

evenMedian:
; if even its a little more complicated. Do the same as for odd, except
; also find the number before the middleFlag which is the lower end of the
; middle. Average the two middle numbers and round (automatically integer
; rounded
	mov		eax, [ebp+8]		;index in the array we need
	mov		ebx, [ebp+8]
	mov		edx, 4				;multiply it by 4 to get esi index (DWORD)
	mul		edx
	mov		esi, eax
	mov		eax, [ebp+16]		;store the offset of the array into eax
	mov		eax, [eax + esi]	;retrieve the number at @array+esi
	mov		ebx, [ebp+16]		;store the offset of the array into ebx
	mov		ebx, [ebx + esi - 4]	;find the number before middleFlag
	add		eax, ebx			;add them to find the average
	mov		ebx, 2
	cdq
	div		ebx
	call	writeDec			;display the median
	call	Crlf
	jmp		returning

returning:
	pop		ebp
	ret		12			;3 parameters
displayMedian ENDP

;----------------------------------------------------------------------------------------
; Procedure: displayList
; Description: displays the array to the console, 10 numbers per line in columns. The user
; can pass different titles to be displayed before the numbers are displayed
; Parameters: array(reference), request (value), title(reference)
;----------------------------------------------------------------------------------------
displayList PROC
	call	Crlf
	mov		counter, 0
	push	ebp
	mov		ebp, esp
	mov		edx, [ebp+8]	;put the title (can be different) into edx
	call	WriteString		;write it to the screen
	call	Crlf
	mov		esi, [ebp+16]	;@myArray
	mov		ecx, [ebp+12]	;request is loop control
output:
;print the array to the console
	mov		eax, [esi]	;get the current element
	call	WriteDec
	mov		al, TAB		;for even columns
	call	WriteChar
	add		esi, 4		;next element
	inc		counter		;for keeping track of lines
	cmp		counter, 10
	jg		newLine
	jmp		skip
newLine:
	call	Crlf
	mov		counter, 0	;reset the counter
skip:
	loop	output
	call	Crlf
;return to main
	pop		ebp
	ret		12
displayList ENDP

END main
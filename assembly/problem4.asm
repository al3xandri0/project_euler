; A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 x 99.
; Find the largest palindrome made from the product of two 3-digit numbers

section .text
	global _start

_start:
	; init values
	mov edi, 10 	; divisor and multiplier
	mov ebx, 999    ; first number
	mov ecx, 999	; 2nd number

multiplyValues:
	push ebx 		; save initial state of ebx
	push ecx		; save initial state of ecx
	imul ebx, ecx 	; multiply ebx by ecx and store in ebx
	mov ecx, 0
	mov eax, ebx 	; move ebx into eax for division

checkIfPalindrome:
	; Find the modulus of multiplied value
	xor edx, edx 	; make sure edx is 0
	div edi 		; divide eax by 10, remainder goes in edx

	; Find reverse through iterations
	imul ecx, edi 	; multiply ECX with EDI
	add ecx, edx 	; add remainder to ecx

	; Loop back around if eax is not 0
	cmp eax, 0 		
	jne checkIfPalindrome

	; Compare two values to see if Palindrome
	cmp ecx, ebx
	jne compare

exit:
	mov eax, 1
	xor ebx, ebx
	int 0x80

compare:
	; we need to check that ecx hasnt reached 900
	pop ecx
	cmp ecx, 900
	jg decrementECX

decrementEBX:
	; if ecx is 900 we need to dec ebx to 998 for example
	; then move ecx back to 999
	pop ebx
	dec ebx
	mov ecx, 999
	jmp multiplyValues

decrementECX:
	; if it wasnt Palindrome we need to return the old value from stack
	; and decrement to try the next value
	pop ebx
	dec ecx
	jmp multiplyValues

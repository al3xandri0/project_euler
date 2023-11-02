; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23. 

; Find the sum of all the multiples of 3 or 5 below 1000.

section .text				; Code
	global _start			; Linker Entry Point

_start:						
	xor edx, edx			; Set EDX to 0

; Count multiples of 3
	mov eax, 3				; Move 3 into EAX
add3:
	add edx, eax			; Add EAX to EDX
	add eax, 3				; Add 3 to EAX
	cmp eax, 1000			; Compare EAX to 1000
	jl add3					; Jump back to add3 if EAX less than 1000
	

; Count multiples of 5
	mov eax, 5				; Move 5 into EAX
add5:
	add edx, eax			; Add EAX to EDX
	add eax, 5 				; Add 5 to EAX
	cmp eax, 1000 			; Compare EAX to 1000
	jl add5 				; Jump back to add5 if EAX less than 1000

; Remove double countings for values 
; that are multiples of both 3 and 5
	mov eax, 15 			; Move 15 into EAX
sub15:
	sub edx, eax 			; Subtract EAX from EDX
	add eax, 15 			; Add 15 to EAX's Value
	cmp eax, 1000 			; Is EAX == 1000?
	jl sub15 				; Jump back to sub15 label if less than 1000

exit:
	mov eax, 1 				; System Exit Call
	xor ebx, ebx
	int 0x80				; Call Kernel

section .text
	global _start

_start:
	mov eax, 1 			; Move first number in fibonacci sequence into eax
	mov ebx, 2 			; Move second number in fibonacci sequence into ebx
	mov ecx, 2 			; Move first even number into ECX (sum)
	mov esi, 2 			; Move 2 into ESI to be used as a divisor

checknum1:
	add eax, ebx 			
	push eax 			; Push EAX to stack to store for later
	xor edx, edx 			; XOR EDX to be used in division
	div esi 			; Divide EAX (standard) by ESI (2)
	test edx, edx 			; TEST to see if the remainder == 0
	pop eax 			; POP the saved value for EAX back in
	jne checknum2			; jump to checknum2 if remainder != 0

	cmp eax, 4000000 		; check if EAX == 4,000,000
	jg exit 			; jump to exit if greater
	add ecx, eax 			; add to counter (sum) if not

checknum2:
	add ebx, eax 			
	push eax			; Save EAX to stack again
	mov eax, ebx 			; Move EBX's value into EAX to be used as dividend
	xor edx, edx 			; XOR EDX to be used in division
	div esi 			; Divide EAX (always EAX) by ESI (2)
	test edx, edx 			; Test to see if remained == 0
	pop eax 			; POP (return) EAX's value from stack
	jne checknum1 			; Jump to checknum1 if remainder > 0

	add ecx, ebx 			
	cmp ebx, 4000000 		; is EBX == 4,000,000?
	jl checknum1 			; jump to checknum1 if less

exit:
	mov eax, 1 			; sys_exit call
	mov ebx, ecx 
	int 0x80 			; call kernel interrupt

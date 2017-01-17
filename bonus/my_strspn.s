	global strspn:function

	section .text

strspn:
	;; set return value to NULL
	xor rax, rax
	xor rbx, rbx

	;; save param2
	mov r10, rsi

	jmp strspn_loop

strspn_inc:
	;; inc param1 and reset param2 and return val
	inc rax
	inc rdi
	mov r10, rsi

	;; ret if str == \0
	cmp BYTE[rdi], 0
	je strspn_exit

	jmp strspn_loop

strspn_loop:
	;; set bl to char of param2
	;; jmp if char is in param2
	mov bl, BYTE[r10]
	cmp BYTE[rdi], bl
	je strspn_inc

	;; jmp if char == '\0'
	cmp bl, 0
	je strspn_exit

	;; increment str
	inc r10
	jmp strspn_loop

strspn_exit:
	ret

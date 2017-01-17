	global strpbrk:function

	section .text

strpbrk:
	;; save rbx
	push rbx

	;; set return value to NULL
	xor rax, rax
	xor rbx, rbx

	;; exit if first param is NULL
	cmp rdi, 0
	je strpbrk_exit

	;; save param2
	mov r10, rsi

	jmp strpbrk_loop

strpbrk_inc:
	;; inc param1 and reset param2
	inc rdi
	mov r10, rsi

	;; ret if str == \0
	cmp BYTE[rdi], 0
	je strpbrk_exit

	jmp strpbrk_loop

strpbrk_found:
	;; set return value as ptr to char found
	mov rax, rdi
	jmp strpbrk_exit

strpbrk_loop:
	;; set bl to char of param2
	;; jmp if char == '\0'
	mov bl, BYTE[r10]
	cmp bl, 0
	je strpbrk_inc

	;; compare char with second param
	cmp BYTE[rdi], bl
	je strpbrk_found

	;; increment str
	inc r10
	jmp strpbrk_loop

strpbrk_exit:
	;; restore rbx
	pop rbx

	ret

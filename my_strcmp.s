	global strcmp:function

	section .text

strcmp_diff:
	;; ret val = str1 - str2
	mov al, BYTE[rdi]
	sub rax, rbx

	jmp strcmp_exit

strcmp:
	;; save rbx
	push rbx

	;; set return val to 0
	;; and clean rbx for use
	xor rax, rax
	xor rbx, rbx

	;; exit if both params are NULL
	cmp rdi, 0
	jne strcmp_loop
	cmp rsi, 0
	je strcmp_exit

strcmp_loop:
	;; jmp if str1 != str2
	mov bl, BYTE[rsi]
	cmp BYTE[rdi], bl
	jne strcmp_diff

	;; jmp if str1 == \0
	cmp BYTE[rdi], 0
	je strcmp_exit

	;; inc str1 and str2
	inc rdi
	inc rsi

	jmp strcmp_loop

strcmp_exit:
	;; restore rbx
	pop rbx

	ret

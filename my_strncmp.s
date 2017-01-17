	global strncmp:function

	section .text

strncmp_diff:
	;; ret val = str1 - str2
	mov al, BYTE[rdi]
	sub rax, rbx

	jmp strncmp_exit

strncmp:
	;; save rbx
	push rbx

	;; set return val to 0
	;; and clean rbx for use
	;; and set counter to 0
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx

	;; exit if both params are NULL
	cmp rdi, 0
	jne strncmp_loop
	cmp rsi, 0
	je strncmp_exit

strncmp_loop:
	;; if counter == param3
	cmp rcx, rdx
	je strncmp_exit

	;; jmp if str1 != str2
	mov bl, BYTE[rsi]
	cmp BYTE[rdi], bl
	jne strncmp_diff

	;; jmp if str1 == \0
	cmp BYTE[rdi], 0
	je strncmp_exit

	;; inc str1 and str2
	;; and counter
	inc rdi
	inc rsi
	inc rcx

	jmp strncmp_loop

strncmp_exit:
	;; restore rbx
	pop rbx

	ret

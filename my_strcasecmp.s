	global strcasecmp:function

	section .text

my_tolower:
	;; set return val to param1
	mov rax, rdi

	;; if param1 <= 'A' || param1 >= 'Z'
	;; then exit
	cmp rax, 65
	jl my_tolower_exit
	cmp rax, 90
	jg my_tolower_exit

	;; else add 32 to set it lowercase
	add rax, 32

my_tolower_exit:
	ret

strcasecmp_diff:
	;; ret val = str1 - str2
	sub rax, rbx

	jmp strcasecmp_exit

strcasecmp:
	;; save rbx
	push rbx

	;; set return val to 0
	;; and clean rbx for use
	xor rax, rax
	xor rbx, rbx

strcasecmp_loop:
	;; save rdi and get *rsi lowercase
	mov r8, rdi
	mov bl, BYTE[rsi]
	mov rdi, rbx
	call my_tolower
	mov rdi, r8
	mov bl, al

	;; save rdi and get *rdi lowercase
	mov r8, rdi
	mov al, BYTE[rdi]
	mov rdi, rax
	call my_tolower
	mov rdi, r8

	;; jmp if str1 != str2
	cmp rax, rbx
	jne strcasecmp_diff

	;; reset return val to 0
	xor rax, rax

	;; jmp if str1 == \0
	cmp BYTE[rdi], 0
	je strcasecmp_exit

	;; inc str1 and str2
	inc rdi
	inc rsi

	jmp strcasecmp_loop

strcasecmp_exit:
	;; restore rbx
	pop rbx

	ret

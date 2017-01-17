	global strcasestr:function

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

strcasestr:
	;; if param2 is "\0" return param1
	mov rax, rdi
	cmp BYTE[rsi], 0
	je strcasestr_exit

	;; set r10 to param2
	mov r10, rsi

	;; set return value to NULL
	xor rax, rax
	xor rbx, rbx

	jmp strcasestr_loop

strcasestr_found:
	;; inc param2
	inc r10

	;; set return value as ptr to char found
	cmp rax, 0
	jne strcasestr_inc

	;; set return val to param1
	mov rax, rdi

	jmp strcasestr_inc

strcasestr_loop:
	;; save rdi and get *rsi lowercase
	mov r8, rdi
	mov r9, rax
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
	mov r11, rax
	mov rax, r9

	;; compare char with second param
	cmp r11, rbx
	je strcasestr_found

	;; else set return val to NULL
	;; and reset param2
	xor rax, rax
	mov r10, rsi

strcasestr_inc:
	;; ret if str == \0
	cmp BYTE[rdi], 0
	je strcasestr_exit
	cmp BYTE[r10], 0
	je strcasestr_exit

	;; increment str
	inc rdi
	jmp strcasestr_loop

strcasestr_exit:
	ret

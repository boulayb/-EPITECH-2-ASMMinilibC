	global strstr:function

	section .text

strstr:
	;; save rbx
	push rbx

	;; if param2 is "\0" return param1
	mov rax, rdi
	cmp BYTE[rsi], 0
	je strstr_exit

	;; set r10 to param2
	mov r10, rsi

	;; set return value to NULL
	xor rax, rax
	xor rbx, rbx

	jmp strstr_loop

strstr_found:
	;; inc param2
	inc r10

	;; set return value as ptr to char found
	cmp rax, 0
	jne strstr_inc

	;; set return val to param1
	mov rax, rdi

	jmp strstr_inc

strstr_loop:
	;; compare char with second param
	mov bl, BYTE[rdi]
	cmp BYTE[r10], bl
	je strstr_found

	;; else set return val to NULL
	;; and reset param2
	xor rax, rax
	mov r10, rsi

strstr_inc:
	;; ret if str == \0
	cmp BYTE[rdi], 0
	je strstr_exit
	cmp BYTE[r10], 0
	je strstr_exit

	;; increment str
	inc rdi
	jmp strstr_loop

strstr_exit:
	;; restore rbx
	pop rbx

	ret

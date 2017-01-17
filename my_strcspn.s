	global strcspn:function

	section .text

strcspn:
	;; save rbx
	push rbx

	;; set return value to NULL
	xor rax, rax
	xor rbx, rbx

	;; save param2
	mov r10, rsi

	jmp strcspn_loop

strcspn_inc:
	;; inc param1 and reset param2 and return val
	inc rax
	inc rdi
	mov r10, rsi

	;; ret if str == \0
	cmp BYTE[rdi], 0
	je strcspn_exit

	jmp strcspn_loop

strcspn_loop:
	;; set bl to char of param2
	;; jmp if char == '\0'
	mov bl, BYTE[r10]
	cmp bl, 0
	je strcspn_inc

	;; compare char with second param
	cmp BYTE[rdi], bl
	je strcspn_exit

	;; increment str
	inc r10
	jmp strcspn_loop

strcspn_exit:
	;; restore rbx
	pop rbx

	ret

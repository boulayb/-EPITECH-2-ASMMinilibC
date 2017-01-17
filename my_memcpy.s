	global memcpy:function

	section .text

memcpy:
	;; save rbx
	push rbx
	
	;; set return val to param 1
	;; and counter to 0
	mov rax, rdi
	xor rcx, rcx

	;; exit if both params are NULL
	cmp rdi, 0
	jne memcpy_loop
	cmp rsi, 0
	je memcpy_exit

memcpy_loop:
	;; while counter != param 3
	cmp rcx, rdx
	je memcpy_exit

	;; copy byte from src to dest
	mov bl, BYTE[rsi]
	mov BYTE[rdi], bl

	;; inc counter, src and dest
	inc rcx
	inc rsi
	inc rdi

	jmp memcpy_loop

memcpy_exit:
	;; restore rbx
	pop rbx
	
	ret

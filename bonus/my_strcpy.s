	global strcpy:function

	section .text

strcpy:
	;; save rbx
	push rbx

	;; set return val as param1
	;; and clean rbx
	mov rax, rdi
	xor rbx, rbx

	jmp strcpy_loop

strcpy_loop:
	;; cpy one byte from src to dest
	mov bl, BYTE[rsi]
	mov BYTE[rdi], bl

	;; if src == \0 then exit
	cmp bl, 0
	je strcpy_exit

	;; ++dest; ++src;
	inc rsi
	inc rdi

	jmp strcpy_loop

strcpy_exit:
	;; restore rbx
	pop rbx

	ret

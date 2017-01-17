	global strcat:function

	section .text

strcat:
	;; save rbx
	push rbx

	;; set return val as param1
	;; and clean rbx
	mov rax, rdi
	xor rbx, rbx

strcat_inc:
	;; while dest != \0
	cmp BYTE[rdi], 0
	je strcat_loop

	;; inc dest
	inc rdi

	jmp strcat_inc

strcat_loop:
	;; cpy one byte from src to dest
	mov bl, BYTE[rsi]
	mov BYTE[rdi], bl

	;; if src == \0 then exit
	cmp bl, 0
	je strcat_exit

	;; ++dest; ++src;
	inc rsi
	inc rdi

	jmp strcat_loop

strcat_exit:
	;; restore rbx
	pop rbx

	ret

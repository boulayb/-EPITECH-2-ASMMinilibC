	global strlen:function

	section .text

strlen:
	;; set return val to 0
	xor rax, rax

	jmp strlen_loop

strlen_inc:
	;; increment rslt and start of string (str = str + 1)
	inc rdi
	inc rax

strlen_loop:
	;; compare one byte of string with 0 (null byte) and jmp if not equal
	cmp BYTE[rdi], 0
	jnz strlen_inc

strlen_exit:
	ret

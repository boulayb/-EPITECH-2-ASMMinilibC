	global rindex:function

	section .text

rindex:
	;; set return value to NULL
	xor rax, rax

	;; mov second param (char) to rdx to access 8bits register
	mov rdx, rsi

	jmp rindex_loop

rindex_found:
	;; set return value as ptr to char found
	mov rax, rdi
	jmp rindex_inc

rindex_loop:
	;; compare char with second param
	cmp BYTE[rdi], dl
	je rindex_found

rindex_inc:
	;; ret if str == \0
	cmp BYTE[rdi], 0
	je rindex_exit

	;; increment str
	inc rdi
	jmp rindex_loop

rindex_exit:
	ret

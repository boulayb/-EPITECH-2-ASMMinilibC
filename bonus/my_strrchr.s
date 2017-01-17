	global strrchr:function

	section .text

strrchr:
	;; set return value to NULL
	xor rax, rax

	;; mov second param (char) to rdx to access 8bits register
	mov rdx, rsi

	jmp strrchr_loop

strrchr_found:
	;; set return value as ptr to char found
	mov rax, rdi
	jmp strrchr_inc

strrchr_loop:
	;; compare char with second param
	cmp BYTE[rdi], dl
	je strrchr_found

strrchr_inc:
	;; ret if str == \0
	cmp BYTE[rdi], 0
	je strrchr_exit

	;; increment str
	inc rdi
	jmp strrchr_loop

strrchr_exit:
	ret

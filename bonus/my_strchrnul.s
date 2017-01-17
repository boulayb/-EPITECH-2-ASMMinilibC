	global strchrnul:function

	section .text

strchrnul:
	;; set return value to NULL
	xor rax, rax

	;; mov second param (char) to rdx to access 8bits register
	mov rdx, rsi

	jmp strchrnul_loop

strchrnul_found:
	;; set return value as ptr to char found
	mov rax, rdi
	jmp strchrnul_exit

strchrnul_loop:
	;; compare char with second param
	cmp BYTE[rdi], dl
	je strchrnul_found

	;; set return value as rdi (will be \0 if nothing found)
	mov rax, rdi

	;; ret if str == \0
	cmp BYTE[rdi], 0
	je strchrnul_exit

	;; increment str
	inc rdi
	jmp strchrnul_loop

strchrnul_exit:
	ret

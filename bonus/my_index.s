	global index:function

	section .text

index:
	;; set return value to NULL
	xor rax, rax

	;; mov second param (char) to rdx to access 8bits register
	mov rdx, rsi

	jmp index_loop

index_found:
	;; set return value as ptr to char found
	mov rax, rdi
	jmp index_exit

index_loop:
	;; compare char with second param
	cmp BYTE[rdi], dl
	je index_found

	;; ret if str == \0
	cmp BYTE[rdi], 0
	je index_exit

	;; increment str
	inc rdi
	jmp index_loop

index_exit:
	ret

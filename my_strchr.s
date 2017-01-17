	global strchr:function

	section .text

strchr:
	;; set return value to NULL
	xor rax, rax

	;; mov second param (char) to rdx to access 8bits register
	mov rdx, rsi

	jmp strchr_loop

strchr_found:
	;; set return value as ptr to char found
	mov rax, rdi
	jmp strchr_exit

strchr_loop:
	;; compare char with second param
	cmp BYTE[rdi], dl
	je strchr_found

	;; ret if str == \0
	cmp BYTE[rdi], 0
	je strchr_exit
	
	;; increment str
	inc rdi
	jmp strchr_loop
	
strchr_exit:
	ret

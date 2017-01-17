	global strnlen:function

	section .text

strnlen:
	;; set return val to 0
	;; and counter to 0
	xor rax, rax
	xor rcx, rcx

	jmp strnlen_loop

strnlen_inc:
	;; increment rslt and start of string (str = str + 1)
	;; and counter
	inc rdi
	inc rax
	inc rcx

strnlen_loop:
	;; cmp counter and param2
	cmp rcx, rdx
	je strnlen_exit

	;; compare one byte of string with 0 (null byte) and jmp if not equal
	cmp BYTE[rdi], 0
	jne strnlen_inc

strnlen_exit:
	ret

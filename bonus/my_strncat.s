	global strncat:function

	section .text

strncat:
	;; save rbx
	push rbx

	;; set return val as param1
	;; and clean rbx
	;; and set counter to 0
	mov rax, rdi
	xor rbx, rbx
	xor rcx, rcx
	xor r9, r9

strncat_inc:
	;; while dest != \0
	cmp BYTE[rdi], 0
	je strncat_loop

	;; inc dest
	inc rdi

	jmp strncat_inc

strncat_flag:
	;; set flag to say we reached end of src
	mov r9, 1

	jmp strncat_cpy

strncat_noend:
	;; put byte from src in tmp
	mov bl, BYTE[rsi]

	;; ++src;
	inc rsi

	;; if byte in tmp is \0 we reached end of src
	cmp bl, 0
	je strncat_flag

	jmp strncat_cpy

strncat_loop:
	;; if counter == param3 then exit
	cmp rcx, rdx
	je strncat_exit

	;; if we havent reached end of src
	cmp r9, 0
	je strncat_noend

	;; else put \0 in tmp
	mov bl, 0

strncat_cpy:
	;; cpy byte from tmp to dest
	mov BYTE[rdi], bl

	;; ++dest; ++counter;
	inc rdi
	inc rcx

	jmp strncat_loop

strncat_exit:
	;; put \0 in dest
	mov BYTE[rdi], 0

	;; restore rbx
	pop rbx

	ret

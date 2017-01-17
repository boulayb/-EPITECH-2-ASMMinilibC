	global strncpy:function

	section .text

strncpy:
	;; save rbx
	push rbx

	;; set return val as param1
	;; and clean rbx
	;; and set counter to 0
	mov rax, rdi
	xor rbx, rbx
	xor rcx, rcx
	xor r9, r9

	jmp strncpy_loop

strncpy_flag:
	;; set flag to say we reached end of src
	mov r9, 1

	jmp strncpy_cpy

strncpy_noend:
	;; put byte from src in tmp
	mov bl, BYTE[rsi]

	;; ++src;
	inc rsi

	;; if byte in tmp is \0 we reached end of src
	cmp bl, 0
	je strncpy_flag

	jmp strncpy_cpy

strncpy_loop:
	;; if counter == param3 then exit
	cmp rcx, rdx
	je strncpy_exit

	;; if we havent reached end of src
	cmp r9, 0
	je strncpy_noend

	;; else put \0 in tmp
	mov bl, 0

strncpy_cpy:
	;; cpy byte from tmp to dest
	mov BYTE[rdi], bl

	;; ++dest; ++counter;
	inc rdi
	inc rcx

	jmp strncpy_loop

strncpy_exit:
	;; restore rbx
	pop rbx

	ret

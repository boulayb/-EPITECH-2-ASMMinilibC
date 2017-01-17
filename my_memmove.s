	global memmove:function

	section .text

memmove_inc:
	;; cpy 1 byte from r8 to r9
	mov bl, BYTE[r8]
	mov BYTE[r9], bl

	;; ++r8, ++r9, ++counter
	inc r8
	inc r9
	inc rcx

	jmp memmove_loop

memmove:
	;; save rbx
	push rbx

	;; set counter to 0
	;; and param2 to r8
	;; and return val to param1
	xor rcx, rcx
	mov rax, rdi
	mov r8, rsi

	;; declare array on the stack
	;; size of param3
	;; and set start of array in r9
	sub rsp, rdx
	mov r9, rsp

	;; exit if both params are NULL
	cmp rdi, 0
	jne memmove_loop
	cmp rsi, 0
	je memmove_free

memmove_loop:
	;; while counter != param3
	cmp rcx, rdx
	jne memmove_inc

	;; if return r9 - counter == stack array
	;; else set return val to param1
	sub r9, rcx
	cmp r9, rsp
	jne memmove_free

	;; reset counter and change r8 and r9 for new loop
	;; r8 = start of stack array
	;; r9 = param1
	xor rcx, rcx
	mov r8, rsp
	mov r9, rdi
	jmp memmove_loop

memmove_free:
	;; restore the stack
	add rsp, rdx

memmove_exit:
	;; restore rbx
	pop rbx

	ret

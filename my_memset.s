	global memset:function

	section .text

memset:
	;; save rbx
	push rbx
	
	;; set return value as param1
	;; counter to 0
	;; param 2 into rbx to access 8bits register
	mov rax, rdi
	xor rcx, rcx
	mov rbx, rsi

memset_loop:
	;; while counter != param 3
	cmp rcx, rdx
	je memset_exit

	;; write param 2 byte to ptr
	mov BYTE[rdi], bl

	;; inc param 1 and counter
	inc rcx
	inc rdi
	
	jmp memset_loop
	
memset_exit:
	;; restore rbx
	pop rbx
	
	ret

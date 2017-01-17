	global strdup:function
	extern malloc

	section .text

my_strlen:
	;; set return val to 0
	xor rax, rax

	jmp my_strlen_loop

my_strlen_inc:
	;; increment rslt and start of string (str = str + 1)
	inc rdi
	inc rax

my_strlen_loop:
	;; compare one byte of string with 0 (null byte) and jmp if not equal
	cmp BYTE[rdi], 0
	jnz my_strlen_inc

my_strlen_exit:
	ret

strdup_inc:
	;; cpy one byte from str into malloced string
	mov bl, BYTE[r12]
	mov BYTE[rax + rcx], bl

	;; inc counter and str
	inc rcx
	inc r12

	jmp strdup_loop

strdup:
	;; save rbx and r12
	push rbx
	push r12

	;; save str
	mov r12, rdi

	;; if str == NULL
	cmp rdi, 0
	je strdup_exit

	;; call my_strlen with str
	call my_strlen

	;; inc return of my_strlen for \0 and call malloc
	inc rax
	mov rdi, rax
	call malloc wrt ..plt

	;; check malloc return value
	cmp rax, 0
	je strdup_exit

	;; set counter to 0
	xor rcx, rcx
	xor rbx, rbx

strdup_loop:
	;; if str == \0
	cmp BYTE[r12], 0
	jne strdup_inc

	;; put \0
	mov BYTE[rax + rcx], 0

strdup_exit:
	;; restore r12 and rbx
	pop r12
	pop rbx

	ret

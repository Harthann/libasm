section .text
	global _ft_strlen

_ft_strlen:
	mov r12, rdi
	mov r13, rdi
.loop:
	cmp byte [r13],0
	jz .ret
	inc r13
	jmp .loop

.ret:
	sub r13,r12
	mov rax, r13
	ret
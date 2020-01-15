section .text
	global _ft_strcpy
_ft_strcpy:
	xor rcx,rcx
.loop:
	cmp byte [rsi + rcx], 0
	jz .ret
	mov dl, [rsi + rcx]
	mov [rdi + rcx], dl
	inc rcx
	jmp .loop

.ret:
	inc rcx
	mov byte [rdi + rcx], 0
	mov rax, rdi
	ret
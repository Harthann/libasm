extern _malloc
extern _ft_strlen
extern _ft_strcpy

section .data
	msg db "Bo"
section .text
	global _ft_strdup
_ft_strdup:
	xor rcx,rcx
	xor r13,r13
	jmp .strlen

.strlen:
	cmp byte [rdi + r13],0
	jz .allocate
	inc r13
	jmp .strlen

.allocate:
	mov r12,rdi
	lea rdi,[r13 + 1]
	mov rax,rdi
	ret
	call _malloc
	jmp .loop

.loop:
	cmp byte [r12 + rcx], 0
	jz .ret
	mov dl, [r12 + rcx]
	mov [rax + rcx], dl
	inc rcx
	jmp .loop

.ret:
	mov byte [rax + rcx], 0
	ret
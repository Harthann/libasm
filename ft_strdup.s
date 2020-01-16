extern _malloc
extern _ft_strlen
extern _ft_strcpy

section .data
	msg db "Bo"
section .text
	global _ft_strdup
_ft_strdup:
	call _ft_strlen
	push rdi; push sur la stack rdi (la chaine de caractere)
	lea rdi, [rax + 1] ; place dans rdi le resultat de strlen + 1
	call _malloc
	xor rcx, rcx
	pop rdi
	jmp .loop

.loop:
	cmp byte [rdi + rcx], 0
	jz .ret
	mov dl, [rdi + rcx]
	mov [rax + rcx], dl
	inc rcx
	jmp .loop

.ret:
	mov byte [rax + rcx], 0
	ret
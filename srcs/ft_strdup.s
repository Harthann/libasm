extern _malloc
extern _ft_strlen
extern _ft_strcpy

section .text
	global _ft_strdup
_ft_strdup:
	call _ft_strlen
	push rdi			; push sur la stack rdi (la chaine de caractere)
	lea rdi, [rax + 1]	; place dans rdi le resultat de strlen + 1
	call _malloc		; appel malloc en lui passant rdi en parametre
	xor rcx, rcx		; initialise rcx a 0 qui sers de compteur a la loop
	pop rdi				; recupere la chaine de caractere de la stack dans rdi
	jmp .loop

.loop:							; boucle qui copie srcs dans dest
	cmp byte [rdi + rcx], 0		; check le \0
	jz .ret						; si cmp a renvoyer 0 alors on es arrive au bout
	mov dl, [rdi + rcx]			; place dans dl le caractere dans la source
	mov [rax + rcx], dl			; lace dans dest le cracte dans dl
	inc rcx						; incremente rcx
	jmp .loop					; recommence la boucle

.ret:
	mov byte [rax + rcx], 0
	ret
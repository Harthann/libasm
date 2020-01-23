section .text
	global _ft_strcmp
_ft_strcmp:
	xor rcx,rcx

.loop:
	cmp byte [rsi + rcx], 0		; compare le caractere a l'adresse rsi + rcx avec 0
	jz .ret						; si le resultat de cmp es 0 alors jump a l'instruction  .ret
	cmp byte [rdi + rcx], 0
	jz .ret
	mov dl, byte [rdi + rcx]	; copie le cractere  l'adresse rdi + rcx dans dl
	sub dl, byte [rsi + rcx]	; soustrait le caractere a l'adresse rsi + rcx a dl
	cmp dl, 0					; compare dl avec 0
	jnz .retdiff				; si le resultat de cmp es different de zero, jump a l'instruction .retdiff
	inc rcx
	jmp .loop

.retdiff:
	movsx rax, dl				; copie dl dans rax en conservant le bit signe
	ret 						; retourne la valeur de rax

.ret:
	mov dl, byte [rdi + rcx]
	sub dl, byte [rsi + rcx]
	jmp .retdiff
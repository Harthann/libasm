section .text
    global _ft_read
_ft_read:
	test edi,edi
	js _error
	mov rax, 0x2000003	; Place dans le registre rax l'index de l'appel systeme
	syscall			; appel la fonction systeme correspondant a rax
	ret
_error:
	mov rax, -1
	ret

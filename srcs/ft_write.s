section .text
    global _ft_write
_ft_write:
	test edi,edi
	js _error
	mov rax, 0x2000004	; Place dans le registre rax l'index de l'appel systeme
	syscall			; appel la fonction systeme correspondant a rax
	ret
_error:
	mov rax, -1
	ret

section .text
    global _ft_write
_ft_write:
    mov		rax, 0x2000004	; Place dans le registre rax l'index de l'appel systeme
    syscall					; appel la fonction systeme correspondant a rax
	ret
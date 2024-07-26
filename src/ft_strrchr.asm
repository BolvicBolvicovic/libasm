				global	ft_strrchr
				extern	ft_strlen
				section	.text
ft_strrchr:
				push	rdi
				mov		rbx, rsi
				call	ft_strlen
				pop		rdi
				mov		rcx, rdi
				add		rdi, rax
	.loop:
				cmp		bl, byte [rdi]
				je		.found
				cmp		rcx, rdi
				je		.not_found
				dec		rdi
				jmp		.loop
	.not_found:
				xor		rax, rax
				ret
	.found:
				mov		rax, rdi
				ret

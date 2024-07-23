				extern	ft_strlen
				global	ft_strlcpy
				section	.text
ft_strlcpy:
				push	rsi
				test	rdx, rdx
				jz		.ret
	.loop:
				cmp		byte [rdi], 0
				je		.ret
				cmp		rdx, 1
				je		.nulterm
				movsb
				dec 	rdx
				jmp		.loop
	.nulterm:
				mov		byte [rdi], 0
	.ret:
				pop		rdi
				call	ft_strlen
				ret

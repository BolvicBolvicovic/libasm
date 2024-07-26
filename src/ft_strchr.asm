				global	ft_strchr
				section	.text
ft_strchr:
				mov		rbx, rsi
	.loop:
				mov		al, [rdi]
				cmp		al, 0
				je		.not_found
				cmp		al, bl
				je		.update_rax
				inc		rdi
				jmp		.loop
	.update_rax:
				mov		rax, rdi
				ret
	.not_found:
				xor		rax, rax
				ret

			extern	ft_memcpy
			global	ft_memmove
			section	.text
ft_memmove:
			mov		rax, rdi
			cmp		rdi, rsi
			je		.ret
			jb		.else
	.if:
			test	rdx, rdx
			jz		.ret
			dec		rdx
			mov		bl, [rsi + rdx]
			mov		[rdi + rdx], bl

			jmp		.if
	.else:
			call 	ft_memcpy
	.ret:
			ret


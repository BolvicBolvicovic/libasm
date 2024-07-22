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
			mov		rbx, [rsi + rdx]
			mov		[rdi + rdx], rbx
			jmp		.if
	.else:
			call 	ft_memcpy
	.ret:
			ret

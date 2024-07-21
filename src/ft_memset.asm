			global	ft_memset
			section	.text
ft_memset:
			push	rdi
	.loop:
			cmp		rdx, 0
			je		.ret
			dec		rdx
			mov		[rdi], rsi
			inc		rdi
			jmp		.loop
	.ret:
			pop		rax
			ret

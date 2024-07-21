			global		ft_strcpy
			section		.text
ft_strcpy:
			mov			rax, rdi
	.loop:
			movsb
			cmp			byte [rsi - 1], 0
			jnz			.loop
			ret

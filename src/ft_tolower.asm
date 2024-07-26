			global	ft_tolower
			section	.text
ft_tolower:
			cmp		rdi, 'A'
			jl		.ret
			cmp		rdi, 'Z'
			ja		.ret
			or		rdi, 0x20
	.ret:
			mov		rax, rdi
			ret

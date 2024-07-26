			global	ft_toupper
			section	.text
ft_toupper:
			cmp		rdi, 'a'
			jl		.ret
			cmp		rdi, 'z'
			ja		.ret
			and		rdi, ~0x20
	.ret:
			mov		rax, rdi
			ret

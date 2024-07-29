			global	ft_substr
			extern	malloc
			extern	ft_strlcpy
			section	.text
ft_substr:
			add		rdi, rsi
			inc		rdx
			push	rdi
			push	rdx
			mov		rdi, rdx
			call	malloc	wrt ..plt
			pop		rdx
			pop		rsi
			push	rax
			mov		rdi, rax
			call	ft_strlcpy
			pop		rax
			ret

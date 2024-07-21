			extern	ft_memcpy
			global	ft_memmove
			section	.text
ft_memmove:
			mov		rax, rdi
	.olap:
			mov		rbx, rsi
			add		rbx, rdx
			cmp		rdi, rsi
			jl		.else
			cmp		rdi, rbx
			jge		.else
	.loop:
			test	rdx, rdx
			jz		.ret
			dec		rdx
			mov		rbx, byte [rsi + rdx]
			mov		byte [rdi + rdx], rbx
			jmp		.loop
	.ret:
			ret
	.else:
			call 	ft_memcpy
			ret

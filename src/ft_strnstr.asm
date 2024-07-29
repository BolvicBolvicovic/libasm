				global	ft_strnstr
				extern	ft_strlen
				extern	ft_strncmp
				section	.text
ft_strnstr:
				push	rdi
				push	rsi
				mov		r15, rdx
				mov		rdi, rsi
				call	ft_strlen
				test	rax, rax
				jz		.ret
				mov		r12, rax
				pop		rsi
				pop		rdi
				push	rdi
				push	rsi
	.loop:
				cmp		r15, r12
				jle		.xor_rax
				test	r15, rdx
				jz		.xor_rax
				mov		rdx, r15
				call	ft_strncmp
				pop		rsi
				pop		rdi
				test	rax, rax
				je		.found
				inc		rdi
				dec		r15
				push	rdi
				push	rsi
				jmp		.loop
	.found:
				mov		rax, rdi
				ret
	.xor_rax:
				pop		rdi
				pop		rsi
				xor		rax, rax
	.ret:
				ret

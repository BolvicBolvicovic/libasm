					global	ft_strtrim
					extern	ft_strlcpy
					extern	ft_strlen
					extern	malloc
					extern	ft_strchr
					section	.text

ft_strtrim:
					test	rdi, rdi
					je		.xor_rax
					test	rsi, rsi
					je		.xor_rax
					mov		r15, rdi
					mov		r12, rsi
		.skip_top:
					mov		rdi, r12
					mov		bl, byte [r15]
					test	bl, bl
					je		.xor_rax
					xor		rsi, rsi
					mov		sil, bl
					call	ft_strchr
					test	rax, rax
					je		.skip_bot
					inc		r15
					jmp		.skip_top
		.skip_bot:
					mov		r13, r15
					mov		rdi, r13
					call	ft_strlen
					add		r13, rax
					dec		r13
			.loop:
					mov		rdi, r12
					mov		bl, byte [r13]
					xor		rsi, rsi
					mov		sil, bl
					call	ft_strchr
					test	rax, rax
					je		.cpy
					dec		r13
					jmp		.loop
		.cpy:
					mov		rdi, r13
					sub		rdi, r15
					cmp		rdi, 0
					jl		.mallocul
					add		rdi, 3
					mov		rbx, rdi
					call	malloc	wrt ..plt
					test	rax, rax
					je		.xor_rax
					mov		rdi, rax
					mov		rsi, r15
					mov		rdx, rbx
					dec		rdx
					push	rax
					call	ft_strlcpy
					pop		rax
					ret
		.mallocul:
					mov		rdi, 1
					call	malloc	wrt ..plt
					test	rax, rax
					je		.xor_rax
					mov		byte [rax], 0
					ret
		.xor_rax:
					xor		rax, rax
					ret

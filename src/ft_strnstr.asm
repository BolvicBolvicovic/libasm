				global	ft_strnstr
				extern	ft_strlen
				section	.text
ft_strnstr:
				push	rdi
				push	rsi
				mov		rbx, rdx
				mov		rdi, rsi
				call	ft_strlen
				pop		rcx
				pop		rdx
				test	rax, rax
				jz		.ret
				xor		rdi, rdi
	.loop:
				test	rbx, rbx
				jz		.xor_rax
				cmp		byte [rdx + rdi], 0
				je		.xor_rax
				xor		rsi, rsi
		.cmp:
					cmp		byte [rcx + rsi], 0
					je		.end_cmp
					cmp		byte [rdx + rsi], 0
					je		.end_cmp
					add		rsi, rdi
					cmp		rbx, rsi
					jae		.restore_rsi
					sub		rsi, rdi
					mov		al, [rcx + rsi]
					add		rsi, rdi
					mov		ah, [rdx + rsi]
					sub		rsi, rdi
					cmp		al, ah
					jne		.end_cmp
					jmp		.cmp
		.restore_rsi:
					sub		rsi, rdi
		.end_cmp:
					cmp		rsi, rbx
					je		.found
					inc		rdi
					dec		rbx
					jmp		.loop
	.found:
				add		rdx, rsi
				mov		rax, rdx
				ret
	.xor_rax:
				xor		rax, rax
	.ret:
				ret

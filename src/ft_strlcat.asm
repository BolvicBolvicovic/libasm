				extern	ft_strlen
				global	ft_strlcat
				section	.text
ft_strlcat:
				push	rdx
				push	rdi
	.upd_rdi:
				test	rdx, rdx
				jz		.ret
				cmp		byte [rdi], 0
				je		.cat
				inc		rdi
				dec		rdx
				jmp		.upd_rdi
	.cat:
				cmp		rdx, 1
				je		.append_n
				cmp		byte [rsi], 0
				je		.ret
				mov		bl, [rsi]
				mov		[rdi], bl
				inc		rdi
				inc		rsi
				dec		rdx
				jmp		.cat
	.append_n:
				mov		byte [rdi], 0
	.ret:
				pop		rdi
				call	ft_strlen
				pop		rbx
				cmp		rbx, rax
				jae		.keep_rax
				mov		rax, rbx
	.keep_rax:
				ret


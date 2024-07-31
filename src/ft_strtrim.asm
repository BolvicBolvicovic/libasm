					global	ft_strtrim
					extern	ft_strlcpy
					extern	malloc
					extern	ft_strchr
					section	.text

ft_strtrim:
					test	rdi, rdi
					je		.xor_rax
					test	rsi, rsi
					je		.xor_rax
					mov		r11, rdi
					mov		r12, rsi
		.skip_top:
					mov		rdi, r12
					mov		bl, byte [r11]
					test	bl, bl
					je		.xor_rax
					mov		byte [rsi], bl
					call	ft_strchr
					test	rax, rax
					je		.skip_bot
					inc		r11
					jmp		skip_bot
		.skip_bot:

		.xor_rax:
					xor		rax, rax
		.ret:
					ret

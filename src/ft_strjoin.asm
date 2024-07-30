			global	ft_strjoin
			extern	ft_strlen
			extern	malloc
			section	.text
ft_strjoin:
			push	rdi
			push	rsi
			call	ft_strlen
			mov		rbx, rax
			pop		rdi
			push	rdi
			call	ft_strlen
			add		rbx, rax
			inc		rbx
			mov		rdi, rbx
			call	malloc wrt ..plt
			pop		rsi
			pop		rdi
			test	rsi, rsi
			je		.error
			test	rdi, rdi
			je		.error
			test	rax, rax
			je		.error
			mov		rcx, rax
	.s_one:
			cmp		byte [rdi], 0
			je		.s_two
			mov		bl, byte [rdi]
			mov		byte [rax], bl
			inc		rax
			inc		rdi
			jmp		.s_one
	.s_two:
			cmp		byte [rsi], 0
			je		.end
			mov		bl, byte [rsi]
			mov		byte [rax], bl
			inc		rax
			inc		rsi
			jmp		.s_two
	.end:
			mov		byte [rax], 0
			mov		rax, rcx
			ret
	.error:
			xor		rax, rax
			ret

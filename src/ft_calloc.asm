			global	ft_calloc
			extern	malloc
			section	.text
ft_calloc:
			mov		rbx, rdi
			mov		rdi, rsi
			call	malloc wrt ..plt
			push	rax
	.loop:
			test	rbx, rbx
			je		.ret
			mov		[rax], 0
			inc		rax
			dec		rbx
			jmp		.loop
	.ret:
			pop		rax
			ret			

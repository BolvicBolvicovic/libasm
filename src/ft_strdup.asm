			extern	malloc
			extern	ft_strlen
			extern	ft_strcpy
			extern	__errno_location

			global	ft_strdup
			section	.text
ft_strdup:
			push	rdi
			call	ft_strlen
			inc		rax
			mov		rdi, rax
			call	malloc wrt ..plt
			test	rax, rax
			jz		.error
			mov		rdi, rax
			pop		rsi
			call	ft_strcpy
			ret
	.error:
			call	__errno_location wrt ..plt
			mov		qword [rax], 12
			xor		rax, rax
			ret

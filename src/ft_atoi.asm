				global	ft_atoi
				section	.text
ft_atoi:
				xor		rax, rax
				mov		rcx, 1
	.skip_nl:
				cmp		byte [rdi], 32
				je		.next
				cmp		byte [rdi], 9
				jl		.is_neg
				cmp		byte [rdi], 13
				ja		.is_neg
		.next:
				inc		rdi
				jmp		.skip_nl
	.is_neg:
				cmp		byte [rdi], '-'
				je		.neg
				cmp		byte [rdi], '+'
				je		.add
				jne		.loop
		.neg:
				neg		rcx
		.add:
				inc		rdi
	.loop:
				cmp		byte [rdi], '0'
				jl		.ret
				cmp		byte [rdi], '9'
				ja		.ret
				imul	rax, 10
				add		al, byte [rdi]
				sub		rax, '0'
				inc		rdi
				jmp		.loop
	.ret:
				imul	rax, rcx
				ret

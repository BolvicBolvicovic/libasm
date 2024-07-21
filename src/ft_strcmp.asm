			global	ft_strcmp
			section	.text
ft_strcmp:
	.loop:
			mov		al, byte [rdi]
			mov		bl, byte [rsi]
			cmp		al, bl
			jnz		.done
			test	al, al
			je		.done
			inc		rdi
			inc		rsi
			jmp		.loop
	.done:
			sub		al, bl
			movsx	rax, al
			ret

			global	ft_strncmp
			section	.text
ft_strncmp:
	.loop:
			test	rdx, rdx
			jz		.done
			mov		al, byte [rdi]
			mov		bl, byte [rsi]
			cmp		al, bl
			jnz		.done
			test	al, al
			je		.done
			inc		rdi
			inc		rsi
			dec		rdx
			jmp		.loop
	.done:
			sub		al, bl
			movsx	rax, al
			ret

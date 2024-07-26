			global	ft_memcmp
			section	.text
ft_memcmp:
	.loop:
			test	rdx, rdx
			jz		.done
			mov		al, byte [rdi]
			mov		bl, byte [rsi]
			cmp		al, bl
			jnz		.done
			inc		rdi
			inc		rsi
			dec		rdx
			jmp		.loop
	.done:
			sub		al, bl
			movsx	rax, al
			ret

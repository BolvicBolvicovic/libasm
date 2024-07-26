			global	ft_memchr
			section	.text
ft_memchr:
				mov		rbx, rsi
	.loop:
				mov		al, [rdi]
				cmp		al, 0
				je		.not_found
				cmp		al, bl
				je		.update_rax
				test	rdx, rdx
				jz		.not_found
				dec		rdx
				inc		rdi
				jmp		.loop
	.update_rax:
				mov		rax, rdi
				ret
	.not_found:
				xor		rax, rax
				ret

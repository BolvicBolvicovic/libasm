			global	ft_memcpy
			section	.text
ft_memcpy:
			mov		rax, rdi
	.loop:
			movsb
			dec		rdx
			test	rdx, rdx
			jnz		.loop
			ret

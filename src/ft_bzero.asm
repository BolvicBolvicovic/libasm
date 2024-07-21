			extern	ft_memset

			global	ft_bzero
			section	.text
ft_bzero:
			mov		rdx, rsi
			xor		rsi, rsi
			call	ft_memset

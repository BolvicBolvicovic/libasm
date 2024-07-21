			global	ft_isalpha
			global	ft_isdigit
			global	ft_isalnum
			global	ft_isascii
			global	ft_isprint
			section	.text
false:
			xor		rax, rax
			ret
true:
			xor		rax, rax
			inc		rax
			ret
return:
			pop		rdi
			ret
ft_isalpha:
	.min:
			cmp		rdi, 65
			jl		false
			cmp		rdi, 90
			jg		.maj
			jmp		true
	.maj:
			cmp		rdi, 97
			jl		false
			cmp		rdi, 122
			jg		false
			jmp		true
ft_isdigit:
			cmp		rdi, 48
			jl		false
			cmp		rdi, 57
			jg		false
			jmp		true
ft_isalnum:
			push	rdi
			call	ft_isalpha
			cmp		rax, 1
			je		return
			pop		rdi
			call	ft_isdigit
			ret
ft_isascii:
			cmp		rdi, 0
			jl		false
			cmp		rdi, 127
			jg		false
			jmp		true
ft_isprint:
			cmp		rdi, 32
			jl		false
			cmp		rdi, 126
			jg		false
			jmp		true

			extern	__errno_location
			global	ft_read
			section	.text
ft_read:
			xor		rax, rax	
			syscall
			test	rax, rax
			jl		error
			ret
error:
			neg		rax
			mov		rdi, rax
			call	__errno_location wrt ..plt
			mov		[rax], rdi
			mov		rax, -1
			ret

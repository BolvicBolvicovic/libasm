			extern	__errno_location
			global	ft_write
			section	.text
ft_write:
			mov		rax, 1
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

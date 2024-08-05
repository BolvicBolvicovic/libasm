			global	ft_split
			extern	malloc
			extern	free
			extern	ft_substr
			section	.text

count_words:
			xor		rcx, rcx
	.loop:
			cmp		byte [rdi], 0
			je		.ret
			.front:
				cmp		byte [rdi], sil
				jne		.inc_word
				inc		rdi
				jmp		.front
			.inc_word:
				cmp		byte [rdi], 0
				je		.ret
				inc		rcx
			.word:
				cmp		byte [rdi], 0
				je		.ret
				cmp		byte [rdi], sil
				je		.loop
				inc		rdi
				jmp		.word
				
	.ret:
			mov		rax, rcx
			ret
allocate:
			mov		rcx, rsi
	.loop:
			test	rcx, rcx
			je		.end
			.front:
				cmp		byte [rsi], dl
				jne		.set_tmp
				inc		rsi
				jmp		.front
			.set_tmp:
				mov		rcx, rsi
			.word:
				cmp		byte [rsi], 0
				je		.end
				cmp		byte [rsi], dl
				je		.alloc
				inc		rsi
				jmp		.word
			.alloc:
				cmp		rsi, rcx
				jle		.loop
				push	rdi
				push	rsi
				push	rcx
				push	rdx
				mov		rdi, rcx
				sub		rsi, rcx
				mov		rdx, rsi
				xor		rsi, rsi
				call	ft_substr
				pop		rdx
				pop		rcx
				pop		rsi
				pop		rdi
				mov		[rdi], rax
				mov		rsi, rcx
				add		rdi, 8
				jmp		.loop
	.end:
			mov		qword [rdi], 0

tester:
		
ft_split:
			test	rdi, rdi
			je		.error
			mov		r12, rdi
			mov		r13, rsi
			call	count_words
			mov		r14, rax
			imul	rax, 8
			inc		rax
			mov		rdi, rax
			call	malloc	wrt ..plt
			test	rax, rax
			je		.error
			mov		r15, rax
			mov		rdi, rax
			mov		rsi, r12
			mov		rdx, r13
			call	allocate
			mov		rdi, r15
			mov		rsi, r14
			call	tester
			test	rax, rax
			jnz		.error
			mov		rax, r15
			ret
	.error:
			xor		rax, rax
			ret

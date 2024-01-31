	.file	"polla.c"
	.text
	.section	.rodata
.LC0:
	.string	"poll"
.LC1:
	.string	"%d seconds elapsed.\n"
.LC2:
	.string	"read"
.LC3:
	.string	"Read: %s\n"
.LC4:
	.string	"Unexpected condition.\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1056, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -1048(%rbp)
	movw	$1, -1044(%rbp)
	leaq	-1048(%rbp), %rax
	movl	$5000, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	poll@PLT
	movl	%eax, -1056(%rbp)
	cmpl	$-1, -1056(%rbp)
	jne	.L2
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L9
.L2:
	cmpl	$0, -1056(%rbp)
	jne	.L4
	movl	$5, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L9
.L4:
	movzwl	-1042(%rbp), %eax
	cwtl
	andl	$1, %eax
	testl	%eax, %eax
	je	.L5
	leaq	-1040(%rbp), %rax
	movl	$1024, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	read@PLT
	movl	%eax, -1052(%rbp)
	cmpl	$-1, -1052(%rbp)
	jne	.L6
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L9
.L6:
	cmpl	$0, -1052(%rbp)
	je	.L8
	movl	-1052(%rbp), %eax
	cltq
	movb	$0, -1040(%rbp,%rax)
	leaq	-1040(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L8:
	movl	$0, %eax
	jmp	.L9
.L5:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$22, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movl	$1, %eax
.L9:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

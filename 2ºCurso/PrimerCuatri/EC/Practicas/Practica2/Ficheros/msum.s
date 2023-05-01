	.file	"msum.c"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	subq	$24, %rsp
	leaq	8(%rsp), %rdx
	movl	$3, %esi
	movl	$2, %edi
	call	sumstore@PLT
	movl	8(%rsp), %eax
	addq	$24, %rsp
	ret
	.size	main, .-main
	.globl	plus
	.type	plus, @function
plus:
	endbr64
	leaq	(%rdi,%rsi), %rax
	ret
	.size	plus, .-plus
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:

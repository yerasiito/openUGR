.data
	resultado: .quad 0x8877665544332211
	formato:   .string "i:%lli / u:%llu / 0x%llx\n"

.text
_start: .globl _start

	mov $formato, %rdi
	mov resultado, %rsi
	mov %rsi, %rdx
	mov %rsi, %rcx
	xor %eax, %eax
	call printf

	xor %edi, %edi
	call exit


.section .data
#lista:		.int -1, -1
lista:		.int 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
#lista:		.int -2147483648, -2147483648
longlista:	.int (. - lista) / 4
resultado:	.quad 0
formato: 	.string	"suma = %lli = 0x%016llx\n"
formato2:	.string "media = %i = 0x%08x\n"
formato3:	.string "resto = %i = 0x%08x\n"

.section .text
_start: .global _start

	call trabajar	# subrutina de usuario
	call imprim_C	# printf()  de libC

	mov $lista, %rdi
	mov longlista, %esi
	call media # resultado en eax

	mov $formato2, %rdi
	mov %eax, %esi
	mov %eax, %edx
	xor %eax, %eax
	call printf

        mov $lista, %rdi
        mov longlista, %esi
        call resto # resultado en eax

        mov $formato3, %rdi
        mov %eax, %esi
        mov %eax, %edx
        xor %eax, %eax
        call printf

	call acabar_C	# exit()    de libC
	ret

trabajar:
	mov     $lista, %rdi
	mov  longlista, %esi
	call suma		# == suma(&lista, longlista);
	mov  %rax, resultado
	ret

###################################
# long long suma(int *lista, int n)
#       rax             rdi    esi
###################################
suma:
	xor %ecx, %ecx # 0 --> rcx
	xor %eax, %eax
.Lbucle:
	cmp %rcx, %rsi
	je .Lfin
	movslq (%rdi, %rcx, 4), %r8
	inc %rcx
	add %r8, %rax # sumatoria en rax
	jmp  .Lbucle
.Lfin:
	ret           # devolución en rax

###################################
# int media(int *lista, int n)
# eax              rdi    esi
###################################
media:
	push %rsi
	call suma # resultado en rax
	cqto # rax --> rdx:rax
	pop %rsi
	idiv %rsi # cociente --> eax
	ret

###################################
# int resto(int *lista, int n)
# eax              rdi    esi
###################################
resto:
        push %rsi
        call suma # resultado en rax
	cqto
        pop %rsi
        idiv %rsi # resto --> rdx
	mov %rdx, %rax
        ret

###################################################

imprim_C:			# requiere libC
	mov   $formato, %rdi
	mov   resultado,%rsi    # 64 bits!!!
	mov   resultado,%rdx    # 64 bits!!!
	xor %eax, %eax
	call  printf		# == printf(formato, res, res);
	ret

acabar_C:			# requiere libC
	mov  resultado, %edi
	call _exit		# ==  exit(resultado)
	ret

.section .data
lista:		.int -1, -1
longlista:	.int (. - lista) / 4
resultado:	.quad 0
  formato: 	.string	"suma = %lli = 0x%016llx\n"

.section .text
_start: .global _start

	call trabajar	# subrutina de usuario
	call imprim_C	# printf()  de libC
	call acabar_C	# exit()    de libC
	ret

trabajar:
	mov     $lista, %rdi
	mov  longlista, %esi
	call suma		# == suma(&lista, longlista);
	mov  %eax, resultado
	mov %edx, resultado + 4
	ret

###################################
# long long suma(int *lista, int n)
#   edx:eax             rdi    esi
###################################
suma:
	xor %ecx, %ecx # 0 --> rcx
	xor %eax, %eax
	xor %edx, %edx
.Lbucle:
	cmp %rcx, %rsi
	je .Lfin
	mov (%rdi, %rcx, 4), %r8d
	mov %r8d, %r9d # cltd
	sar $31, %r9d  # cltd
	add %r8d, %eax # suma de las partes bajas
	adc %r9d, %edx # suma de las partes altas
	inc   %rcx
	jmp  .Lbucle
.Lfin:
	ret            # edx:eax

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

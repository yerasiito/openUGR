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
	xor %r8d, %r8d
	xor %r9d, %r9d
.Lbucle:
	cmp %rcx,%rsi
	je .Lfin
	mov (%rdi, %rcx, 4), %eax
	cltd # eax --> edx:eax
	add %eax, %r8d # suma de las partes bajas
	adc %edx, %r9d # suma de las partes altas
	inc   %rcx
	cmp   %rcx,%rsi
	jmp  .Lbucle
.Lfin:
	mov %r8d, %eax
	mov %r9d, %edx
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

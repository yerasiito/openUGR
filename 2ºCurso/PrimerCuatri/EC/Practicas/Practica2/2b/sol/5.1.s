.section .data
	lista:		.int 0xffffffff, 0xffffffff
	n:		.int   (.-lista)/4
	resultado:	.quad   0
	formato: 	.string "suma = %llu = 0x%016llx\n"

.section .text
_start: .global _start

	call trabajar	# subrutina de usuario
	call imprim_C	# printf()  de libC
	call acabar_C	# exit()    de libC
	ret

trabajar:
	mov $lista, %rdi
	mov n, %esi
	call suma	
	mov %eax, resultado
	mov %edx, resultado + 4
	ret

##################################################
# long long suma(int *lista, int n)
#   edx:eax             rdi    esi
##################################################

suma:
	xor %eax, %eax
	xor %ecx, %ecx
	xor %edx, %edx
.Lbucle:
	cmp %rcx, %rsi
	je .Lfin
	add (%rdi,%rcx,4), %eax
	jnc .Lsin_acarreo
	inc %edx
.Lsin_acarreo:
	inc %rcx
	jmp .Lbucle
.Lfin:
	ret

#############################################################

imprim_C:			# requiere libC
	mov   $formato, %rdi
	mov   resultado,%rsi
	mov   resultado,%rdx
	xor %eax, %eax
	call  printf		# == printf(formato, res, res);
	ret

acabar_C:			# requiere libC
	mov  resultado, %edi
	call _exit		# ==  exit(resultado)
	ret

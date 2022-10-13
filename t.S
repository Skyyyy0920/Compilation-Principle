	.arch armv7-a
	.text
	.global	main
	.type	main, %function
main:
	push    {fp, lr}
	push    {r7}
	mov fp, sp
	sub	sp, sp, #16
	add	r7, sp, #0
	bl	getint(PLT)
	str	r0, [r7, #12]   @ n=getint(PLT)
	movs	r3, #2  
	str	r3, [r7, #4]    @ i=2
	movs	r3, #1
	str	r3, [r7, #8]    @ f=1
	b	.L2
.L3:
	ldr	r3, [r7, #8]
	ldr	r2, [r7, #4]
	mul	r3, r2, r3
	str	r3, [r7, #8]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	cmp	r2, r3
	ble	.L3
	ldr	r0, [r7, #8]
	bl	putint(PLT)
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	pop {r7}
	pop	{fp, pc}
	.size	main, .-main
	.section	.note.GNU-stack,"",%progbits
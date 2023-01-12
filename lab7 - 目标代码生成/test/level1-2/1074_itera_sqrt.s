	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global fsqrt
	.type fsqrt , %function
fsqrt:
	push {r4, r5, r6, r7, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L32:
	str r0, [fp, #-12]
	ldr r10, =0
	str r10, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, =2
	sdiv r6, r4, r5
	str r6, [fp, #-4]
	b .L36
.L36:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sub r6, r4, r5
	cmp r6, #0
	bne .L37
	b .L41
.L37:
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-8]
	sdiv r7, r5, r6
	add r5, r4, r7
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =2
	sdiv r6, r4, r5
	str r6, [fp, #-4]
	b .L36
.L38:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, r7, r10, fp, lr}
	bx lr
.L41:
	b .L38

	.global main
	.type main , %function
main:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L43:
	ldr r10, =400
	str r10, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl fsqrt
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #8
	pop {r4, r10, fp, lr}
	bx lr


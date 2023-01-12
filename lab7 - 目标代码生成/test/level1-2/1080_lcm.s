	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.text
	.global gcd
	.type gcd , %function
gcd:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L50:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	ldr r10, [fp, #-24]
	str r10, [fp, #-16]
	ldr r4, [fp, #-20]
	str r4, [fp, #-12]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L57
	b .L61
.L57:
	ldr r4, [fp, #-24]
	str r4, [fp, #-8]
	ldr r4, [fp, #-20]
	str r4, [fp, #-24]
	ldr r4, [fp, #-8]
	str r4, [fp, #-20]
	b .L58
.L58:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L62
.L61:
	b .L58
.L62:
	ldr r4, [fp, #-4]
	cmp r4, #0
	bne .L63
	b .L67
.L63:
	ldr r4, [fp, #-20]
	str r4, [fp, #-24]
	ldr r4, [fp, #-4]
	str r4, [fp, #-20]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L62
.L64:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	mul r6, r4, r5
	ldr r4, [fp, #-20]
	sdiv r5, r6, r4
	mov r0, r5
	add sp, sp, #24
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L67:
	b .L64

	.global main
	.type main , %function
main:
	push {r4, r5, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L69:
	bl getint
	mov r10, r0
	str r10, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl gcd
	mov r4, r0
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r10, fp, lr}
	bx lr

addr_n0:
	.word n

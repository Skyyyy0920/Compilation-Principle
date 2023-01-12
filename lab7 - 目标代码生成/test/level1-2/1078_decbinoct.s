	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global dec2bin
	.type dec2bin , %function
dec2bin:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L37:
	str r0, [fp, #-20]
	ldr r10, =0
	str r10, [fp, #-16]
	ldr r4, =1
	str r4, [fp, #-12]
	ldr r4, [fp, #-20]
	str r4, [fp, #-4]
	b .L43
.L43:
	ldr r4, [fp, #-4]
	cmp r4, #0
	bne .L44
	b .L48
.L44:
	ldr r4, [fp, #-4]
	ldr r5, =2
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	str r6, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	mul r6, r4, r5
	ldr r4, [fp, #-16]
	add r5, r6, r4
	str r5, [fp, #-16]
	ldr r4, [fp, #-12]
	ldr r5, =10
	mul r6, r4, r5
	str r6, [fp, #-12]
	ldr r4, [fp, #-4]
	ldr r5, =2
	sdiv r6, r4, r5
	str r6, [fp, #-4]
	b .L43
.L45:
	ldr r4, [fp, #-16]
	mov r0, r4
	add sp, sp, #20
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L48:
	b .L45

	.global main
	.type main , %function
main:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L50:
	ldr r10, =400
	str r10, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl dec2bin
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


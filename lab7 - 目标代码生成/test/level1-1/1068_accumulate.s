	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L14:
	ldr r10, =0
	str r10, [fp, #-4]
	str r10, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-8]
	str r4, [fp, #-8]
	b .L17
.L17:
	ldr r4, [fp, #-8]
	cmp r4, #21
	movlt r4, #1
	movge r4, #0
	blt .L18
	b .L22
.L18:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-4]
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	str r6, [fp, #-8]
	b .L17
.L19:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L22:
	b .L19


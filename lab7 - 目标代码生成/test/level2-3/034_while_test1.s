	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global doubleWhile
	.type doubleWhile , %function
doubleWhile:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L19:
	ldr r10, =5
	str r10, [fp, #-8]
	ldr r4, =7
	str r4, [fp, #-4]
	b .L22
.L22:
	ldr r4, [fp, #-8]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L23
	b .L27
.L23:
	ldr r4, [fp, #-8]
	ldr r5, =30
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L28
.L24:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L27:
	b .L24
.L28:
	ldr r4, [fp, #-4]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L29
	b .L33
.L29:
	ldr r4, [fp, #-4]
	ldr r5, =6
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L28
.L30:
	ldr r4, [fp, #-4]
	ldr r5, =100
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L22
.L33:
	b .L30

	.global main
	.type main , %function
main:
	push {r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L35:
	bl doubleWhile
	mov r10, r0
	mov r0, r10
	add sp, sp, #0
	pop {r10, fp, lr}
	bx lr


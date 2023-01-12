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
.L16:
	ldr r10, =0
	str r10, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L19
.L19:
	ldr r4, [fp, #-8]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L20
	b .L24
.L20:
	ldr r4, [fp, #-8]
	cmp r4, #50
	beq .L25
	b .L29
.L21:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L24:
	b .L21
.L25:
	b .L21
.L26:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L19
.L29:
	b .L26
.L30:
	b .L26


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
.L19:
	ldr r10, =0
	str r10, [fp, #-8]
	ldr r4, =0
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
	cmp r4, #50
	beq .L28
	b .L32
.L24:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L27:
	b .L24
.L28:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L22
.L29:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L22
.L32:
	b .L29
.L33:
	b .L29


	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.global b
	.align 4
	.size b, 4
b:
	.word 0
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L16:
	bl getint
	mov r10, r0
	ldr r9, addr_a0
	str r10, [r9]
	str r10, [r9]
	bl getint
	mov r4, r0
	ldr r5, addr_b0
	str r4, [r5]
	str r4, [r5]
	ldr r4, addr_a0
	ldr r5, [r4]
	ldr r4, addr_b0
	ldr r6, [r4]
	cmp r5, r6
	beq .L21
	b .L24
.L18:
	ldr r4, =1
	str r4, [fp, #-4]
	str r4, [fp, #-4]
	b .L20
.L19:
	ldr r4, =0
	str r4, [fp, #-4]
	str r4, [fp, #-4]
	b .L20
.L20:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r9, r10, fp, lr}
	bx lr
.L21:
	ldr r4, addr_a0
	ldr r5, [r4]
	cmp r5, #3
	bne .L18
	b .L27
.L24:
	b .L19
.L27:
	b .L19

addr_a0:
	.word a
addr_b0:
	.word b

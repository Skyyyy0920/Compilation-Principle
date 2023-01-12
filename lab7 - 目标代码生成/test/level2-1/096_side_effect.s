	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word -1
	.global b
	.align 4
	.size b, 4
b:
	.word 1
	.text
	.global inc_a
	.type inc_a , %function
inc_a:
	push {r4, r5, r6, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L46:
	ldr r10, addr_a0
	ldr r9, [r10]
	str r9, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, r9, r10, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L49:
	ldr r10, =5
	str r10, [fp, #-4]
	b .L51
.L51:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movge r4, #1
	movlt r4, #0
	bge .L52
	b .L56
.L52:
	bl inc_a
	mov r4, r0
	cmp r4, #0
	bne .L60
	b .L62
.L53:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L56:
	b .L53
.L57:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	b .L58
.L58:
	bl inc_a
	mov r4, r0
	cmp r4, #14
	movlt r4, #1
	movge r4, #0
	blt .L70
	b .L76
.L59:
	bl inc_a
	mov r4, r0
	cmp r4, #0
	bne .L57
	b .L68
.L60:
	bl inc_a
	mov r4, r0
	cmp r4, #0
	bne .L59
	b .L65
.L62:
	b .L58
.L65:
	b .L58
.L68:
	b .L58
.L70:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	ldr r4, =2
	mul r6, r5, r4
	ldr r4, addr_b0
	str r6, [r4]
	b .L72
.L71:
	bl inc_a
	mov r4, r0
	b .L72
.L72:
	ldr r4, [fp, #-4]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L51
.L73:
	bl inc_a
	mov r4, r0
	cmp r4, #0
	bne .L77
	b .L79
.L76:
	b .L73
.L77:
	bl inc_a
	mov r4, r0
	bl inc_a
	mov r5, r0
	sub r6, r4, r5
	ldr r4, =1
	add r5, r6, r4
	cmp r5, #0
	bne .L70
	b .L82
.L79:
	b .L71
.L82:
	b .L71

addr_a0:
	.word a
addr_b0:
	.word b

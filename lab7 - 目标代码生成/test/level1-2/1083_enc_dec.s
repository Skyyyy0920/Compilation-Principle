	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global enc
	.type enc , %function
enc:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L34:
	str r0, [fp, #-4]
	ldr r10, [fp, #-4]
	cmp r10, #25
	movgt r4, #1
	movle r4, #0
	bgt .L36
	b .L41
.L36:
	ldr r4, [fp, #-4]
	ldr r5, =60
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L38
.L37:
	ldr r4, [fp, #-4]
	ldr r5, =15
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L38
.L38:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L41:
	b .L37

	.global dec
	.type dec , %function
dec:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L43:
	str r0, [fp, #-4]
	ldr r10, [fp, #-4]
	cmp r10, #85
	movgt r4, #1
	movle r4, #0
	bgt .L45
	b .L50
.L45:
	ldr r4, [fp, #-4]
	ldr r5, =59
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L47
.L46:
	ldr r4, [fp, #-4]
	ldr r5, =14
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L47
.L47:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L50:
	b .L46

	.global main
	.type main , %function
main:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L52:
	ldr r10, =400
	str r10, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl enc
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl dec
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


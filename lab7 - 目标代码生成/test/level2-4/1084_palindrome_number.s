	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global palindrome
	.type palindrome , %function
palindrome:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #28
.L41:
	str r0, [fp, #-28]
	ldr r10, =0
	str r10, [fp, #-8]
	b .L46
.L46:
	ldr r4, [fp, #-8]
	cmp r4, #4
	movlt r4, #1
	movge r4, #0
	blt .L47
	b .L51
.L47:
	ldr r4, [fp, #-28]
	ldr r5, =10
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	ldr r4, [fp, #-8]
	mov r5, #-24
	mov r8, #4
	mul r7, r4, r8
	add r4, r5, r7
	add r5, fp, r4
	str r6, [r5]
	ldr r4, [fp, #-28]
	ldr r5, =10
	sdiv r6, r4, r5
	str r6, [fp, #-28]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L46
.L48:
	mov r4, #0
	mov r5, #-24
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	mov r5, #3
	mov r6, #-24
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	cmp r4, r5
	beq .L55
	b .L60
.L51:
	b .L48
.L52:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L54
.L53:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L54
.L54:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L55:
	mov r4, #1
	mov r5, #-24
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	mov r5, #2
	mov r6, #-24
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	cmp r4, r5
	beq .L52
	b .L65
.L60:
	b .L53
.L65:
	b .L53

	.global main
	.type main , %function
main:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L67:
	ldr r10, =1221
	str r10, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl palindrome
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #1
	beq .L70
	b .L75
.L70:
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	b .L72
.L71:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L72
.L72:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #8
	pop {r4, r10, fp, lr}
	bx lr
.L75:
	b .L71


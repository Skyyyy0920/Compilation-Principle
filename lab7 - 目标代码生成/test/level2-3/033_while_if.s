	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global get_one
	.type get_one , %function
get_one:
	push {fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L40:
	str r0, [fp, #-4]
	mov r0, #1
	add sp, sp, #4
	pop {fp, lr}
	bx lr

	.global deepWhileBr
	.type deepWhileBr , %function
deepWhileBr:
	push {r4, r5, r6, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L43:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r10, [fp, #-20]
	ldr r9, [fp, #-16]
	add r8, r10, r9
	str r8, [fp, #-12]
	b .L47
.L47:
	ldr r4, [fp, #-12]
	cmp r4, #75
	movlt r4, #1
	movge r4, #0
	blt .L48
	b .L52
.L48:
	ldr r4, =42
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L54
	b .L58
.L49:
	ldr r4, [fp, #-12]
	mov r0, r4
	add sp, sp, #20
	pop {r4, r5, r6, r8, r9, r10, fp, lr}
	bx lr
.L52:
	b .L49
.L54:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-12]
	ldr r4, [fp, #-12]
	cmp r4, #99
	movgt r4, #1
	movle r4, #0
	bgt .L59
	b .L63
.L55:
	b .L47
.L58:
	b .L55
.L59:
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-4]
	mov r0, #0
	bl get_one
	mov r4, r0
	cmp r4, #1
	beq .L65
	b .L69
.L60:
	b .L55
.L63:
	b .L60
.L65:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-12]
	b .L66
.L66:
	b .L60
.L69:
	b .L66

	.global main
	.type main , %function
main:
	push {r4, r5, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L71:
	ldr r10, =2
	str r10, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl deepWhileBr
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r10, fp, lr}
	bx lr


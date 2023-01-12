	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 7
	.text
	.global func
	.type func , %function
func:
	push {r4, r5, r6, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L24:
	ldr r10, addr_a0
	ldr r9, [r10]
	str r9, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	cmp r4, r5
	beq .L27
	b .L32
.L27:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	mov r0, #1
	add sp, sp, #8
	pop {r4, r5, r6, r9, r10, fp, lr}
	bx lr
	b .L29
.L28:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r9, r10, fp, lr}
	bx lr
	b .L29
.L29:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r9, r10, fp, lr}
	bx lr
.L32:
	b .L28

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L34:
	ldr r10, =0
	str r10, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L37
.L37:
	ldr r4, [fp, #-4]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L38
	b .L42
.L38:
	bl func
	mov r4, r0
	cmp r4, #1
	beq .L43
	b .L47
.L39:
	ldr r4, [fp, #-8]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L48
	b .L53
.L42:
	b .L39
.L43:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L44
.L44:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L37
.L47:
	b .L44
.L48:
	mov r0, #1
	bl putint
	b .L50
.L49:
	mov r0, #0
	bl putint
	b .L50
.L50:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L53:
	b .L49

addr_a0:
	.word a

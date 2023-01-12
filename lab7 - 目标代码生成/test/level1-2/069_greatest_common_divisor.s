	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global fun
	.type fun , %function
fun:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L28:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	b .L32
.L32:
	ldr r10, [fp, #-8]
	cmp r10, #0
	movgt r4, #1
	movle r4, #0
	bgt .L33
	b .L37
.L33:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	str r4, [fp, #-12]
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	b .L32
.L34:
	ldr r4, [fp, #-12]
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L37:
	b .L34

	.global main
	.type main , %function
main:
	push {r4, r5, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L39:
	bl getint
	mov r10, r0
	str r10, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	mov r0, r4
	mov r1, r5
	bl fun
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r10, fp, lr}
	bx lr


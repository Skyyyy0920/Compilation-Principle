	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global move
	.type move , %function
move:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L38:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r10, [fp, #-8]
	mov r0, r10
	bl putint
	mov r0, #32
	bl putch
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #44
	bl putch
	mov r0, #32
	bl putch
	add sp, sp, #8
	pop {r4, r10, fp, lr}
	bx lr

	.global hanoi
	.type hanoi , %function
hanoi:
	push {r4, r5, r6, r7, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L42:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	str r3, [fp, #-4]
	ldr r10, [fp, #-16]
	cmp r10, #1
	beq .L47
	b .L52
.L47:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl move
	b .L49
.L48:
	ldr r4, [fp, #-16]
	ldr r5, =1
	sub r6, r4, r5
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	ldr r7, [fp, #-8]
	mov r0, r6
	mov r1, r4
	mov r2, r5
	mov r3, r7
	bl hanoi
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl move
	ldr r4, [fp, #-16]
	ldr r5, =1
	sub r6, r4, r5
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	ldr r7, [fp, #-4]
	mov r0, r6
	mov r1, r4
	mov r2, r5
	mov r3, r7
	bl hanoi
	b .L49
.L49:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r10, fp, lr}
	bx lr
.L50:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r10, fp, lr}
	bx lr
.L51:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r10, fp, lr}
	bx lr
.L52:
	b .L48

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L54:
	bl getint
	mov r10, r0
	str r10, [fp, #-4]
	b .L56
.L56:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L57
	b .L61
.L57:
	bl getint
	mov r4, r0
	mov r0, r4
	mov r1, #1
	mov r2, #2
	mov r3, #3
	bl hanoi
	mov r0, #10
	bl putch
	ldr r4, [fp, #-4]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L56
.L58:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L61:
	b .L58


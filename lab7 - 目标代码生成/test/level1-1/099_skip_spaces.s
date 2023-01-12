






	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	ldr r4, =408
	sub sp, sp, r4
.L23:
	ldr r10, =0
	str r10, [fp, #-8]
	str r10, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	str r4, [fp, #-4]
	b .L27
.L27:
	bl getint
	mov r4, r0
	cmp r4, #0
	bne .L28
	b .L31
.L28:
	bl getint
	mov r4, r0
	ldr r5, [fp, #-8]
	ldr r6, =-408
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	add r6, fp, r5
	str r4, [r6]
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	str r6, [fp, #-8]
	b .L27
.L29:
	b .L33
.L31:
	b .L29
.L33:
	ldr r4, [fp, #-8]
	cmp r4, #0
	bne .L34
	b .L37
.L34:
	ldr r4, [fp, #-8]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-8]
	str r6, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, =-408
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	add r6, r4, r5
	str r6, [fp, #-4]
	str r6, [fp, #-4]
	b .L33
.L35:
	ldr r4, [fp, #-4]
	ldr r5, =79
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	mov r0, r6
	ldr r1, =408
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L37:
	b .L35


	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global ifElse
	.type ifElse , %function
ifElse:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L10:
	ldr r10, =5
	str r10, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #5
	beq .L12
	b .L17
.L12:
	ldr r4, =25
	str r4, [fp, #-4]
	b .L14
.L13:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-4]
	b .L14
.L14:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L17:
	b .L13

	.global main
	.type main , %function
main:
	push {r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L19:
	bl ifElse
	mov r10, r0
	mov r0, r10
	add sp, sp, #0
	pop {r10, fp, lr}
	bx lr


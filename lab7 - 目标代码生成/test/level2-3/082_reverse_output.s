	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global reverse
	.type reverse , %function
reverse:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L15:
	str r0, [fp, #-8]
	ldr r10, [fp, #-8]
	cmp r10, #1
	movle r4, #1
	movgt r4, #0
	ble .L18
	b .L23
.L18:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L20
.L19:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	sub r6, r4, r5
	mov r0, r6
	bl reverse
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L20
.L20:
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L21:
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L22:
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L23:
	b .L19

	.global main
	.type main , %function
main:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L25:
	ldr r10, =200
	str r10, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl reverse
	mov r0, #0
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr


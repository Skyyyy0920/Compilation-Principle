	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global if_if_Else
	.type if_if_Else , %function
if_if_Else:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L14:
	ldr r10, =5
	str r10, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	cmp r4, #5
	beq .L17
	b .L22
.L17:
	ldr r4, [fp, #-4]
	cmp r4, #10
	beq .L23
	b .L27
.L18:
	ldr r4, [fp, #-8]
	ldr r5, =15
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L19
.L19:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L22:
	b .L18
.L23:
	ldr r4, =25
	str r4, [fp, #-8]
	b .L24
.L24:
	b .L19
.L27:
	b .L24

	.global main
	.type main , %function
main:
	push {r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L29:
	bl if_if_Else
	mov r10, r0
	mov r0, r10
	add sp, sp, #0
	pop {r10, fp, lr}
	bx lr


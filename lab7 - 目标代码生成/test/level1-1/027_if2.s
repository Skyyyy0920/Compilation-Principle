	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L4:
	ldr r10, =10
	ldr r9, addr_a0
	str r10, [r9]
	str r10, [r9]
	ldr r4, addr_a0
	ldr r5, [r4]
	cmp r5, #0
	movgt r4, #1
	movle r4, #0
	bgt .L5
	b .L10
.L5:
	mov r0, #1
	add sp, sp, #0
	pop {r4, r5, r9, r10, fp, lr}
	bx lr
	b .L7
.L6:
	mov r0, #0
	add sp, sp, #0
	pop {r4, r5, r9, r10, fp, lr}
	bx lr
	b .L7
.L7:
	mov r0, #0
	add sp, sp, #0
	pop {r4, r5, r9, r10, fp, lr}
	bx lr
.L10:
	b .L6

addr_a0:
	.word a

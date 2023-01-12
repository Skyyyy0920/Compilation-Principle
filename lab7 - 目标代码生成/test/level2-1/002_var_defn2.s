	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 3
	.global b
	.align 4
	.size b, 4
b:
	.word 5
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L6:
	ldr r10, =5
	str r10, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_b0
	ldr r6, [r5]
	add r5, r4, r6
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, r10, fp, lr}
	bx lr

addr_a0:
	.word a
addr_b0:
	.word b

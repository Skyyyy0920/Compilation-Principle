	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.section .rodata
	.global a
	.align 4
	.size a, 4
a:
	.word 10
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L6:
	ldr r10, =2
	str r10, [fp, #-4]
	str r10, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_a0
	ldr r6, [r5]
	sub r5, r4, r6
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, r10, fp, lr}
	bx lr

addr_a0:
	.word a

	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.section .rodata
	.global a
	.align 4
	.size a, 4
a:
	.word 5
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L3:
	ldr r10, addr_a0
	ldr r9, [r10]
	ldr r4, =5
	mul r5, r9, r4
	mov r0, r5
	add sp, sp, #0
	pop {r4, r5, r9, r10, fp, lr}
	bx lr

addr_a0:
	.word a

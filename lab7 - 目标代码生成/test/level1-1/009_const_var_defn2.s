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
	.global b
	.align 4
	.size b, 4
b:
	.word 5
	.text
	.global main
	.type main , %function
main:
	push {r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L3:
	ldr r10, addr_b0
	ldr r9, [r10]
	mov r0, r9
	add sp, sp, #0
	pop {r9, r10, fp, lr}
	bx lr

addr_a0:
	.word a
addr_b0:
	.word b

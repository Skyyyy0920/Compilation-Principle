	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L3:
	ldr r10, =5
	str r10, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr


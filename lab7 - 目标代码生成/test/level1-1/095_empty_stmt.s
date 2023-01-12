	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L4:
	ldr r10, =10
	str r10, [fp, #-4]
	str r10, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul r6, r4, r5
	ldr r4, =1
	add r5, r6, r4
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, r10, fp, lr}
	bx lr


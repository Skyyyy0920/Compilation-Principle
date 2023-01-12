	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L9:
	ldr r10, =1
	str r10, [fp, #-12]
	str r10, [fp, #-12]
	ldr r4, =2
	str r4, [fp, #-8]
	str r4, [fp, #-8]
	ldr r4, =3
	str r4, [fp, #-4]
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, r10, fp, lr}
	bx lr


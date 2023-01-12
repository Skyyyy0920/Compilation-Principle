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
	.global func
	.type func , %function
func:
	push {r4, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L13:
	str r0, [fp, #-4]
	ldr r10, [fp, #-4]
	ldr r9, =1
	sub r8, r10, r9
	str r8, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r8, r9, r10, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L16:
	ldr r10, =10
	ldr r9, addr_a0
	str r10, [r9]
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl func
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r9, r10, fp, lr}
	bx lr

addr_a0:
	.word a

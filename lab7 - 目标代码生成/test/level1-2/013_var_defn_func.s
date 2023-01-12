	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global defn
	.type defn , %function
defn:
	push {fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L3:
	mov r0, #4
	add sp, sp, #0
	pop {fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L5:
	bl defn
	mov r10, r0
	str r10, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr


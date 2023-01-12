	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.global b
	.align 4
	.size b, 4
b:
	.word 0
	.global c
	.align 4
	.size c, 4
c:
	.word 0
	.global d
	.align 4
	.size d, 4
d:
	.word 0
	.global e
	.align 4
	.size e, 4
e:
	.word 0
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L49:
	bl getint
	mov r10, r0
	ldr r9, addr_a0
	str r10, [r9]
	str r10, [r9]
	bl getint
	mov r4, r0
	ldr r5, addr_b0
	str r4, [r5]
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_c0
	str r4, [r5]
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_d0
	str r4, [r5]
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_e0
	str r4, [r5]
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-4]
	str r4, [fp, #-4]
	ldr r4, addr_a0
	ldr r5, [r4]
	ldr r4, addr_b0
	ldr r6, [r4]
	ldr r4, addr_c0
	ldr r7, [r4]
	mul r4, r6, r7
	sub r6, r5, r4
	ldr r4, addr_d0
	ldr r5, [r4]
	ldr r4, addr_a0
	ldr r7, [r4]
	ldr r4, addr_c0
	ldr r8, [r4]
	sdiv r4, r7, r8
	sub r7, r5, r4
	cmp r6, r7
	bne .L51
	b .L57
.L51:
	ldr r4, =1
	str r4, [fp, #-4]
	str r4, [fp, #-4]
	b .L52
.L52:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L53:
	ldr r4, addr_a0
	ldr r5, [r4]
	ldr r4, addr_b0
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_c0
	ldr r6, [r5]
	add r5, r4, r6
	ldr r4, addr_d0
	ldr r6, [r4]
	ldr r4, addr_e0
	ldr r7, [r4]
	add r4, r6, r7
	cmp r5, r4
	beq .L51
	b .L63
.L54:
	ldr r4, addr_a0
	ldr r5, [r4]
	ldr r4, addr_b0
	ldr r6, [r4]
	mul r4, r5, r6
	ldr r5, addr_c0
	ldr r6, [r5]
	sdiv r5, r4, r6
	ldr r4, addr_e0
	ldr r6, [r4]
	ldr r4, addr_d0
	ldr r7, [r4]
	add r4, r6, r7
	cmp r5, r4
	beq .L51
	b .L60
.L57:
	b .L54
.L60:
	b .L53
.L63:
	b .L52

addr_a0:
	.word a
addr_b0:
	.word b
addr_c0:
	.word c
addr_d0:
	.word d
addr_e0:
	.word e

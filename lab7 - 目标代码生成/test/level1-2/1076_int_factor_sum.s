	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global N
	.align 4
	.size N, 4
N:
	.word 0
	.global newline
	.align 4
	.size newline, 4
newline:
	.word 0
	.text
	.global factor
	.type factor , %function
factor:
	push {r4, r5, r6, r7, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L32:
	str r0, [fp, #-12]
	ldr r10, =0
	str r10, [fp, #-4]
	ldr r4, =1
	str r4, [fp, #-8]
	b .L36
.L36:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	ldr r6, =1
	add r7, r5, r6
	cmp r4, r7
	movlt r4, #1
	movge r4, #0
	blt .L37
	b .L41
.L37:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	cmp r6, #0
	beq .L42
	b .L46
.L38:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, r7, r10, fp, lr}
	bx lr
.L41:
	b .L38
.L42:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L43
.L43:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L36
.L46:
	b .L43

	.global main
	.type main , %function
main:
	push {r4, r5, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L48:
	ldr r10, =4
	ldr r9, addr_N0
	str r10, [r9]
	ldr r4, =10
	ldr r5, addr_newline0
	str r4, [r5]
	ldr r4, =1478
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl factor
	mov r4, r0
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r9, r10, fp, lr}
	bx lr

addr_N0:
	.word N
addr_newline0:
	.word newline

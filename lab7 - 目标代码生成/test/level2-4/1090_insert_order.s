	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global N
	.align 4
	.size N, 4
N:
	.word 0
	.text
	.global insert
	.type insert , %function
insert:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L68:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r10, =0
	str r10, [fp, #-8]
	b .L73
.L73:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L76
	b .L81
.L74:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L73
.L75:
	ldr r4, addr_N0
	ldr r5, [r4]
	str r5, [fp, #-4]
	b .L85
.L76:
	ldr r4, [fp, #-8]
	ldr r5, addr_N0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L74
	b .L84
.L81:
	b .L75
.L84:
	b .L75
.L85:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L86
	b .L90
.L86:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	ldr r6, =1
	sub r7, r5, r6
	mov r5, #4
	mul r6, r7, r5
	add r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L85
.L87:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L90:
	b .L87

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #52
.L96:
	ldr r10, =10
	ldr r9, addr_N0
	str r10, [r9]
	mov r4, #0
	mov r5, #-52
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #1
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #2
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =4
	str r4, [r5]
	mov r4, #3
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #4
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =8
	str r4, [r5]
	mov r4, #5
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =11
	str r4, [r5]
	mov r4, #6
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =13
	str r4, [r5]
	mov r4, #7
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =18
	str r4, [r5]
	mov r4, #8
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =56
	str r4, [r5]
	mov r4, #9
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =78
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-4]
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [fp, #-8]
	mov r0, r5
	mov r1, r4
	bl insert
	mov r4, r0
	str r4, [fp, #-8]
	b .L100
.L100:
	ldr r4, [fp, #-4]
	ldr r5, addr_N0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L101
	b .L105
.L101:
	ldr r4, [fp, #-4]
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putch
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L100
.L102:
	mov r0, #0
	add sp, sp, #52
	pop {r4, r5, r6, r7, r9, r10, fp, lr}
	bx lr
.L105:
	b .L102

addr_N0:
	.word N

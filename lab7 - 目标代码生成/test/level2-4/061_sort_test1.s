	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.text
	.global bubblesort
	.type bubblesort , %function
bubblesort:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L71:
	str r0, [fp, #-16]
	ldr r10, =0
	str r10, [fp, #-12]
	b .L75
.L75:
	ldr r4, [fp, #-12]
	ldr r5, addr_n0
	ldr r6, [r5]
	ldr r5, =1
	sub r7, r6, r5
	cmp r4, r7
	movlt r4, #1
	movge r4, #0
	blt .L76
	b .L80
.L76:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L81
.L77:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L80:
	b .L77
.L81:
	ldr r4, [fp, #-8]
	ldr r5, addr_n0
	ldr r6, [r5]
	ldr r5, [fp, #-12]
	sub r7, r6, r5
	ldr r5, =1
	sub r6, r7, r5
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L82
	b .L86
.L82:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	ldr r7, =1
	add r8, r6, r7
	mov r6, #4
	mul r7, r8, r6
	add r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L87
	b .L95
.L83:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L75
.L86:
	b .L83
.L87:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	ldr r6, =1
	add r7, r5, r6
	mov r5, #4
	mul r6, r7, r5
	add r5, r4, r6
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	ldr r7, =1
	add r8, r6, r7
	mov r6, #4
	mul r7, r8, r6
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	b .L88
.L88:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L81
.L95:
	b .L88

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #48
.L104:
	ldr r10, =10
	ldr r9, addr_n0
	str r10, [r9]
	mov r4, #0
	mov r5, #-48
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =4
	str r4, [r5]
	mov r4, #1
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #2
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =9
	str r4, [r5]
	mov r4, #3
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =2
	str r4, [r5]
	mov r4, #4
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #5
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #6
	mov r5, #-48
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =6
	str r4, [r5]
	mov r4, #7
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #9
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =8
	str r4, [r5]
	mov r4, #0
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl bubblesort
	mov r4, r0
	str r4, [fp, #-8]
	b .L107
.L107:
	ldr r4, [fp, #-8]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L108
	b .L112
.L108:
	ldr r4, [fp, #-8]
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L107
.L109:
	mov r0, #0
	add sp, sp, #48
	pop {r4, r5, r6, r7, r9, r10, fp, lr}
	bx lr
.L112:
	b .L109

addr_n0:
	.word n

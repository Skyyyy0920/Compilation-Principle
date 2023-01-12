	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global maxArea
	.type maxArea , %function
maxArea:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L71:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	ldr r10, =0
	str r10, [fp, #-16]
	ldr r4, [fp, #-20]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-12]
	ldr r4, =0
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-8]
	b .L77
.L77:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L78
	b .L82
.L78:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-12]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L84
	b .L93
.L79:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L82:
	b .L79
.L84:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	sub r6, r4, r5
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-16]
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [r5]
	mul r5, r6, r4
	str r5, [fp, #-4]
	b .L86
.L85:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	sub r6, r4, r5
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-12]
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [r5]
	mul r5, r6, r4
	str r5, [fp, #-4]
	b .L86
.L86:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L98
	b .L102
.L93:
	b .L85
.L98:
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	b .L99
.L99:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-12]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L103
	b .L112
.L102:
	b .L99
.L103:
	ldr r4, [fp, #-12]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-12]
	b .L105
.L104:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	b .L105
.L105:
	b .L77
.L112:
	b .L104

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #44
.L114:
	mov r10, #0
	mov r9, #-40
	mov r7, #4
	mul r8, r10, r7
	add r4, r9, r8
	add r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #1
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #2
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =9
	str r4, [r5]
	mov r4, #3
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #4
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #5
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #6
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #7
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	mov r5, #-40
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #9
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =8
	str r4, [r5]
	ldr r4, =10
	str r4, [fp, #-44]
	mov r4, #0
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [fp, #-44]
	mov r0, r5
	mov r1, r4
	bl maxArea
	mov r4, r0
	str r4, [fp, #-44]
	ldr r4, [fp, #-44]
	mov r0, r4
	add sp, sp, #44
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr


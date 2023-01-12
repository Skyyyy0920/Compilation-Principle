	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global maxSubArray
	.type maxSubArray , %function
maxSubArray:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L58:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r10, [fp, #-16]
	cmp r10, #0
	beq .L61
	b .L65
.L61:
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
	b .L62
.L62:
	ldr r4, [fp, #-16]
	cmp r4, #1
	beq .L66
	b .L70
.L65:
	b .L62
.L66:
	ldr r4, [fp, #-20]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
	b .L67
.L67:
	ldr r4, [fp, #-20]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	str r4, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L78
.L70:
	b .L67
.L78:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L79
	b .L83
.L79:
	ldr r4, [fp, #-12]
	cmp r4, #0
	movlt r4, #1
	movge r4, #0
	blt .L84
	b .L88
.L80:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L83:
	b .L80
.L84:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L85
.L85:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r6, r4, r5
	str r6, [fp, #-12]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L91
	b .L95
.L88:
	b .L85
.L91:
	ldr r4, [fp, #-12]
	str r4, [fp, #-8]
	b .L92
.L92:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L78
.L95:
	b .L92

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #44
.L97:
	ldr r10, =0
	ldr r9, =4
	sub r8, r10, r9
	mov r4, #0
	mov r5, #-40
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	str r8, [r5]
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
	ldr r4, =0
	ldr r5, =2
	sub r6, r4, r5
	mov r4, #3
	mov r5, #-40
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	add r5, fp, r4
	str r6, [r5]
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
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, =0
	ldr r5, =6
	sub r6, r4, r5
	mov r4, #6
	mov r5, #-40
	mov r8, #4
	mul r7, r4, r8
	add r4, r5, r7
	add r5, fp, r4
	str r6, [r5]
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
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
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
	bl maxSubArray
	mov r4, r0
	str r4, [fp, #-44]
	ldr r4, [fp, #-44]
	mov r0, r4
	add sp, sp, #44
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr


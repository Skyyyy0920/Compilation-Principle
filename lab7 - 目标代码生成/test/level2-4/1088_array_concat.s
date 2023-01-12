	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global concat
	.type concat , %function
concat:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L82:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	str r2, [fp, #-12]
	ldr r10, =0
	str r10, [fp, #-8]
	b .L87
.L87:
	ldr r4, [fp, #-8]
	cmp r4, #3
	movlt r4, #1
	movge r4, #0
	blt .L88
	b .L92
.L88:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L87
.L89:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L97
.L92:
	b .L89
.L97:
	ldr r4, [fp, #-4]
	cmp r4, #3
	movlt r4, #1
	movge r4, #0
	blt .L98
	b .L102
.L98:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L97
.L99:
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L102:
	b .L99

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #128
.L107:
	ldr r10, =0
	str r10, [fp, #-8]
	b .L118
.L118:
	ldr r4, [fp, #-8]
	cmp r4, #3
	movlt r4, #1
	movge r4, #0
	blt .L119
	b .L123
.L119:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-128
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-116
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-104
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-92
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-80
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-68
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L118
.L120:
	mov r4, #0
	mov r5, #-128
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r4, #0
	mov r6, #-92
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	mov r4, #0
	mov r7, #-56
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	add r7, fp, r4
	mov r0, r5
	mov r1, r6
	mov r2, r7
	bl concat
	mov r4, r0
	str r4, [fp, #-8]
	b .L125
.L123:
	b .L120
.L125:
	ldr r4, [fp, #-8]
	cmp r4, #6
	movlt r4, #1
	movge r4, #0
	blt .L126
	b .L130
.L126:
	ldr r4, [fp, #-8]
	mov r5, #-56
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L125
.L127:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #128
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L130:
	b .L127


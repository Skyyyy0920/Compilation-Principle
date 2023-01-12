	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #68
.L63:
	ldr r10, =0
	str r10, [fp, #-64]
	ldr r4, =0
	str r4, [fp, #-68]
	b .L67
.L67:
	ldr r4, [fp, #-68]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L68
	b .L72
.L68:
	ldr r4, [fp, #-68]
	ldr r5, =1
	add r6, r4, r5
	ldr r4, [fp, #-68]
	mov r5, #-60
	mov r8, #4
	mul r7, r4, r8
	add r4, r5, r7
	add r5, fp, r4
	str r6, [r5]
	ldr r4, [fp, #-68]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-68]
	b .L67
.L69:
	ldr r4, =10
	str r4, [fp, #-4]
	bl getint
	mov r4, r0
	str r4, [fp, #-20]
	ldr r4, [fp, #-4]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	add r6, r4, r5
	ldr r4, =2
	sdiv r5, r6, r4
	str r5, [fp, #-8]
	b .L78
.L72:
	b .L69
.L78:
	ldr r4, [fp, #-8]
	mov r5, #-60
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-20]
	cmp r4, r5
	bne .L81
	b .L85
.L79:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	add r6, r4, r5
	ldr r4, =2
	sdiv r5, r6, r4
	str r5, [fp, #-8]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r6, #-60
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L89
	b .L95
.L80:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r6, #-60
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	add r6, fp, r5
	ldr r5, [r6]
	cmp r4, r5
	beq .L96
	b .L102
.L81:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L79
	b .L88
.L85:
	b .L80
.L88:
	b .L80
.L89:
	ldr r4, [fp, #-8]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-16]
	b .L91
.L90:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L91
.L91:
	b .L78
.L95:
	b .L90
.L96:
	ldr r4, [fp, #-20]
	mov r0, r4
	bl putint
	b .L98
.L97:
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, [fp, #-20]
	mov r0, r4
	bl putint
	b .L98
.L98:
	ldr r4, =10
	str r4, [fp, #-20]
	ldr r4, [fp, #-20]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #68
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L102:
	b .L97


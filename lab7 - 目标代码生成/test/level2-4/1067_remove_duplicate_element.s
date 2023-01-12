	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global removeElement
	.type removeElement , %function
removeElement:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L48:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r10, =0
	str r10, [fp, #-4]
	b .L53
.L53:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L54
	b .L58
.L54:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	cmp r4, r5
	beq .L59
	b .L66
.L55:
	ldr r4, [fp, #-12]
	mov r0, r4
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L58:
	b .L55
.L59:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
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
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-12]
	b .L61
.L60:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L61
.L61:
	b .L53
.L66:
	b .L60

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #48
.L71:
	mov r10, #0
	mov r9, #-44
	mov r7, #4
	mul r8, r10, r7
	add r4, r9, r8
	add r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #1
	mov r5, #-44
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #2
	mov r5, #-44
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =9
	str r4, [r5]
	mov r4, #3
	mov r5, #-44
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #4
	mov r5, #-44
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #5
	mov r5, #-44
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #6
	mov r5, #-44
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #7
	mov r5, #-44
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	mov r5, #-44
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #9
	mov r5, #-44
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =8
	str r4, [r5]
	ldr r4, =10
	str r4, [fp, #-48]
	ldr r4, =3
	str r4, [fp, #-4]
	mov r4, #0
	mov r5, #-44
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [fp, #-48]
	ldr r6, [fp, #-4]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl removeElement
	mov r4, r0
	str r4, [fp, #-48]
	ldr r4, [fp, #-48]
	mov r0, r4
	add sp, sp, #48
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr


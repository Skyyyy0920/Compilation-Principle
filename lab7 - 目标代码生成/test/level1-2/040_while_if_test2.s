	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global ifWhile
	.type ifWhile , %function
ifWhile:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L24:
	ldr r10, =0
	str r10, [fp, #-8]
	ldr r4, =3
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	cmp r4, #5
	beq .L27
	b .L32
.L27:
	b .L33
.L28:
	b .L39
.L29:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L32:
	b .L28
.L33:
	ldr r4, [fp, #-4]
	cmp r4, #2
	beq .L34
	b .L38
.L34:
	ldr r4, [fp, #-4]
	ldr r5, =2
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L33
.L35:
	ldr r4, [fp, #-4]
	ldr r5, =25
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L29
.L38:
	b .L35
.L39:
	ldr r4, [fp, #-8]
	cmp r4, #5
	movlt r4, #1
	movge r4, #0
	blt .L40
	b .L44
.L40:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L39
.L41:
	b .L29
.L44:
	b .L41

	.global main
	.type main , %function
main:
	push {r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L46:
	bl ifWhile
	mov r10, r0
	mov r0, r10
	add sp, sp, #0
	pop {r10, fp, lr}
	bx lr


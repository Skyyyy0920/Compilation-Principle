	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global whileIf
	.type whileIf , %function
whileIf:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L20:
	ldr r10, =0
	str r10, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L23
.L23:
	ldr r4, [fp, #-8]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L24
	b .L28
.L24:
	ldr r4, [fp, #-8]
	cmp r4, #5
	beq .L29
	b .L34
.L25:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L28:
	b .L25
.L29:
	ldr r4, =25
	str r4, [fp, #-4]
	b .L31
.L30:
	ldr r4, [fp, #-8]
	cmp r4, #10
	beq .L35
	b .L40
.L31:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L23
.L34:
	b .L30
.L35:
	ldr r4, =42
	str r4, [fp, #-4]
	b .L37
.L36:
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-4]
	b .L37
.L37:
	b .L31
.L40:
	b .L36

	.global main
	.type main , %function
main:
	push {r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L42:
	bl whileIf
	mov r10, r0
	mov r0, r10
	add sp, sp, #0
	pop {r10, fp, lr}
	bx lr


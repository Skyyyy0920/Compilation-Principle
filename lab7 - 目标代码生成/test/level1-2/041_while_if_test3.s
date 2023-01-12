	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global deepWhileBr
	.type deepWhileBr , %function
deepWhileBr:
	push {r4, r5, r6, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L35:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r10, [fp, #-20]
	ldr r9, [fp, #-16]
	add r8, r10, r9
	str r8, [fp, #-12]
	b .L39
.L39:
	ldr r4, [fp, #-12]
	cmp r4, #75
	movlt r4, #1
	movge r4, #0
	blt .L40
	b .L44
.L40:
	ldr r4, =42
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L46
	b .L50
.L41:
	ldr r4, [fp, #-12]
	mov r0, r4
	add sp, sp, #20
	pop {r4, r5, r6, r8, r9, r10, fp, lr}
	bx lr
.L44:
	b .L41
.L46:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-12]
	ldr r4, [fp, #-12]
	cmp r4, #99
	movgt r4, #1
	movle r4, #0
	bgt .L51
	b .L55
.L47:
	b .L39
.L50:
	b .L47
.L51:
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, =1
	cmp r4, #1
	beq .L57
	b .L61
.L52:
	b .L47
.L55:
	b .L52
.L57:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-12]
	b .L58
.L58:
	b .L52
.L61:
	b .L58

	.global main
	.type main , %function
main:
	push {r4, r5, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L63:
	ldr r10, =2
	str r10, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl deepWhileBr
	mov r4, r0
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r10, fp, lr}
	bx lr


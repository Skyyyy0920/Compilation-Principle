	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global ifElseIf
	.type ifElseIf , %function
ifElseIf:
	push {r4, r5, r6, r7, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L30:
	ldr r10, =5
	str r10, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	cmp r4, #6
	beq .L33
	b .L39
.L33:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r7, r10, fp, lr}
	bx lr
	b .L35
.L34:
	ldr r4, [fp, #-4]
	cmp r4, #10
	beq .L46
	b .L49
.L35:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r7, r10, fp, lr}
	bx lr
.L36:
	ldr r4, [fp, #-4]
	cmp r4, #11
	beq .L33
	b .L42
.L39:
	b .L36
.L42:
	b .L34
.L43:
	ldr r4, =25
	str r4, [fp, #-8]
	b .L45
.L44:
	ldr r4, [fp, #-4]
	cmp r4, #10
	beq .L56
	b .L59
.L45:
	b .L35
.L46:
	ldr r4, [fp, #-8]
	cmp r4, #1
	beq .L43
	b .L52
.L49:
	b .L44
.L52:
	b .L44
.L53:
	ldr r4, [fp, #-8]
	ldr r5, =15
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L55
.L54:
	ldr r4, [fp, #-8]
	ldr r5, =0
	sub r6, r5, r4
	str r6, [fp, #-8]
	b .L55
.L55:
	b .L45
.L56:
	ldr r4, [fp, #-8]
	ldr r5, =0
	ldr r6, =5
	sub r7, r5, r6
	cmp r4, r7
	beq .L53
	b .L62
.L59:
	b .L54
.L62:
	b .L54

	.global main
	.type main , %function
main:
	push {r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L64:
	bl ifElseIf
	mov r10, r0
	mov r0, r10
	bl putint
	mov r0, #0
	add sp, sp, #0
	pop {r10, fp, lr}
	bx lr


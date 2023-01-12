	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global func
	.type func , %function
func:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L27:
	str r0, [fp, #-4]
	ldr r10, [fp, #-4]
	cmp r10, #50
	movle r4, #1
	movgt r4, #0
	ble .L29
	b .L34
.L29:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #1
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr
	b .L31
.L30:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr
	b .L31
.L31:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr
.L34:
	b .L30

	.global main
	.type main , %function
main:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L36:
	mov r0, #0
	bl func
	mov r10, r0
	cmp r10, #1
	beq .L38
	b .L44
.L38:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L40
.L39:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L40
.L40:
	mov r0, #50
	bl func
	mov r4, r0
	cmp r4, #1
	beq .L56
	b .L59
.L41:
	mov r0, #50
	bl func
	mov r4, r0
	cmp r4, #1
	beq .L45
	b .L48
.L44:
	b .L41
.L45:
	mov r0, #100
	bl func
	mov r4, r0
	cmp r4, #0
	beq .L38
	b .L51
.L48:
	b .L39
.L51:
	b .L39
.L52:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L54
.L53:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L54
.L54:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr
.L55:
	mov r0, #1
	bl func
	mov r4, r0
	cmp r4, #1
	beq .L52
	b .L65
.L56:
	mov r0, #40
	bl func
	mov r4, r0
	cmp r4, #1
	beq .L52
	b .L62
.L59:
	b .L55
.L62:
	b .L55
.L65:
	b .L53


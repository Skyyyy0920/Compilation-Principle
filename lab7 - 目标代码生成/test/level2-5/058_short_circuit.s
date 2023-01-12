	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global g
	.align 4
	.size g, 4
g:
	.word 0
	.text
	.global func
	.type func , %function
func:
	push {r4, r5, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L58:
	str r0, [fp, #-4]
	ldr r10, addr_g0
	ldr r9, [r10]
	ldr r4, [fp, #-4]
	add r5, r9, r4
	ldr r4, addr_g0
	str r5, [r4]
	ldr r4, addr_g0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r4, addr_g0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r9, r10, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L61:
	bl getint
	mov r10, r0
	str r10, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #10
	movgt r4, #1
	movle r4, #0
	bgt .L66
	b .L69
.L63:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L65
.L64:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L65
.L65:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #11
	movgt r4, #1
	movle r4, #0
	bgt .L76
	b .L79
.L66:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	cmp r4, #0
	bne .L63
	b .L71
.L69:
	b .L64
.L71:
	b .L64
.L73:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L75
.L74:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L75
.L75:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #99
	movle r4, #1
	movgt r4, #0
	ble .L83
	b .L89
.L76:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	cmp r4, #0
	bne .L73
	b .L81
.L79:
	b .L74
.L81:
	b .L74
.L83:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L85
.L84:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L85
.L85:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #100
	movle r4, #1
	movgt r4, #0
	ble .L93
	b .L99
.L86:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	cmp r4, #0
	bne .L83
	b .L91
.L89:
	b .L86
.L91:
	b .L84
.L93:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L95
.L94:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L95
.L95:
	mov r0, #99
	bl func
	mov r4, r0
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L106
	b .L109
.L96:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	cmp r4, #0
	bne .L93
	b .L101
.L99:
	b .L96
.L101:
	b .L94
.L103:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L105
.L104:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L105
.L105:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr
.L106:
	mov r0, #100
	bl func
	mov r4, r0
	cmp r4, #0
	bne .L103
	b .L112
.L109:
	b .L104
.L112:
	b .L104

addr_g0:
	.word g

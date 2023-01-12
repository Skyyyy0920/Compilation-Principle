	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global M
	.align 4
	.size M, 4
M:
	.word 0
	.global L
	.align 4
	.size L, 4
L:
	.word 0
	.global N
	.align 4
	.size N, 4
N:
	.word 0
	.text
	.global tran
	.type tran , %function
tran:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #40
.L129:
	str r0, [fp, #-40]
	str r1, [fp, #-36]
	str r2, [fp, #-32]
	str r3, [fp, #-28]
	ldr r3, [fp, #32]
	str r3, [fp, #-24]
	ldr r3, [fp, #36]
	str r3, [fp, #-20]
	ldr r3, [fp, #40]
	str r3, [fp, #-16]
	ldr r3, [fp, #44]
	str r3, [fp, #-12]
	ldr r3, [fp, #48]
	str r3, [fp, #-8]
	ldr r10, =0
	str r10, [fp, #-4]
	ldr r4, [fp, #-32]
	mov r5, #1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	mov r6, #2
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-36]
	mov r5, #2
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	mov r6, #1
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-36]
	mov r5, #0
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	mov r6, #1
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-32]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	mov r6, #2
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-40]
	mov r5, #1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-40]
	mov r5, #2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-36]
	mov r5, #1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	mov r6, #1
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-32]
	mov r5, #2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	mov r6, #2
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-40]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	mov r0, #0
	add sp, sp, #40
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #148
.L168:
	ldr r10, =3
	ldr r9, addr_N0
	str r10, [r9]
	ldr r4, =3
	ldr r5, addr_M0
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_L0
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L179
.L179:
	ldr r4, [fp, #-8]
	ldr r5, addr_M0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L180
	b .L184
.L180:
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
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-104
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
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
	b .L179
.L181:
	mov r4, #0
	mov r5, #-128
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r4, #0
	mov r6, #-116
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	mov r4, #0
	mov r7, #-104
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	add r7, fp, r4
	mov r4, #0
	mov r8, #-92
	mov r9, #4
	mul r10, r4, r9
	add r4, r8, r10
	add r8, fp, r4
	str r8, [fp, #-132]
	mov r4, #0
	mov r8, #-80
	mov r10, #4
	mul r9, r4, r10
	add r4, r8, r9
	add r8, fp, r4
	str r8, [fp, #-136]
	mov r4, #0
	mov r8, #-68
	mov r9, #4
	mul r10, r4, r9
	add r4, r8, r10
	add r8, fp, r4
	str r8, [fp, #-140]
	mov r4, #0
	mov r8, #-56
	mov r9, #4
	mul r10, r4, r9
	add r4, r8, r10
	add r8, fp, r4
	str r8, [fp, #-144]
	mov r4, #0
	mov r8, #-32
	mov r9, #4
	mul r10, r4, r9
	add r4, r8, r10
	add r8, fp, r4
	str r8, [fp, #-148]
	mov r4, #0
	mov r8, #-20
	mov r9, #4
	mul r10, r4, r9
	add r4, r8, r10
	add r8, fp, r4
	mov r0, r5
	mov r1, r6
	mov r2, r7
	ldr r4, [fp, #-132]
	mov r3, r4
	push {r8}
	ldr r4, [fp, #-148]
	push {r4}
	ldr r4, [fp, #-144]
	push {r4}
	ldr r4, [fp, #-140]
	push {r4}
	ldr r4, [fp, #-136]
	push {r4}
	bl tran
	add sp, sp, #20
	mov r4, r0
	str r4, [fp, #-8]
	b .L186
.L184:
	b .L181
.L186:
	ldr r4, [fp, #-8]
	ldr r5, addr_N0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L187
	b .L191
.L187:
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
	b .L186
	b .F0
.LTORG
addr_M0:
	.word M
addr_L0:
	.word L
addr_N0:
	.word N
.F0:
.L188:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	ldr r4, =0
	str r4, [fp, #-8]
	b .L193
.L191:
	b .L188
.L193:
	ldr r4, [fp, #-8]
	ldr r5, addr_N1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L194
	b .L198
.L194:
	ldr r4, [fp, #-8]
	mov r5, #-32
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
	b .L193
.L195:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	b .L200
.L198:
	b .L195
.L200:
	ldr r4, [fp, #-8]
	ldr r5, addr_N1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L201
	b .L205
.L201:
	ldr r4, [fp, #-8]
	mov r5, #-20
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
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
	b .L200
.L202:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #148
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L205:
	b .L202

addr_M1:
	.word M
addr_L1:
	.word L
addr_N1:
	.word N

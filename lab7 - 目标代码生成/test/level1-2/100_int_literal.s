	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global s
	.align 4
	.size s, 4
s:
	.word 0
	.text
	.global get_ans_se
	.type get_ans_se , %function
get_ans_se:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L190:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r10, =0
	str r10, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	cmp r4, r5
	beq .L195
	b .L199
.L195:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L196
.L196:
	ldr r4, [fp, #-16]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, addr_s0
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	add r6, r5, r4
	ldr r4, addr_s0
	str r6, [r4]
	ldr r4, [fp, #-16]
	mov r0, r4
	add sp, sp, #16
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L199:
	b .L196

	.global get_ans
	.type get_ans , %function
get_ans:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L201:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r10, =0
	str r10, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	cmp r4, r5
	beq .L206
	b .L210
.L206:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L207
.L207:
	ldr r4, [fp, #-16]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, [fp, #-16]
	mov r0, r4
	add sp, sp, #16
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L210:
	b .L207

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #36
.L212:
	ldr r10, =0
	ldr r9, =-2147483648
	sub r8, r10, r9
	str r8, [fp, #-36]
	ldr r4, =-2147483648
	str r4, [fp, #-32]
	ldr r4, =-2147483648
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-28]
	ldr r4, =2147483647
	str r4, [fp, #-24]
	ldr r4, =2147483647
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-20]
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-32]
	mov r0, #0
	mov r1, r4
	mov r2, r5
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-36]
	ldr r6, =1
	add r7, r5, r6
	ldr r5, [fp, #-28]
	mov r0, r4
	mov r1, r7
	mov r2, r5
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-24]
	ldr r7, =0
	sub r8, r7, r6
	ldr r6, =1
	sub r7, r8, r6
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-20]
	ldr r7, =1
	add r8, r6, r7
	mov r0, r4
	mov r1, r5
	mov r2, r8
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv r7, r5, r6
	ldr r5, [fp, #-28]
	ldr r6, =2
	sdiv r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-24]
	ldr r7, =0
	sub r8, r7, r6
	ldr r6, =1
	sub r7, r8, r6
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-20]
	ldr r7, =1
	add r8, r6, r7
	mov r0, r4
	mov r1, r5
	mov r2, r8
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	mov r0, #0
	mov r1, r4
	mov r2, r5
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-36]
	ldr r6, =2
	sdiv r7, r5, r6
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-32]
	mov r0, #0
	mov r1, r4
	mov r2, r5
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-36]
	ldr r6, =1
	add r7, r5, r6
	ldr r5, [fp, #-28]
	mov r0, r4
	mov r1, r7
	mov r2, r5
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-24]
	ldr r7, =0
	sub r8, r7, r6
	ldr r6, =1
	sub r7, r8, r6
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-20]
	ldr r7, =1
	add r8, r6, r7
	mov r0, r4
	mov r1, r5
	mov r2, r8
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv r7, r5, r6
	ldr r5, [fp, #-28]
	ldr r6, =2
	sdiv r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-24]
	ldr r7, =0
	sub r8, r7, r6
	ldr r6, =1
	sub r7, r8, r6
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-20]
	ldr r7, =1
	add r8, r6, r7
	mov r0, r4
	mov r1, r5
	mov r2, r8
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	mov r0, #0
	mov r1, r4
	mov r2, r5
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-36]
	ldr r6, =2
	sdiv r7, r5, r6
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	add r6, r4, r5
	ldr r4, [fp, #-8]
	add r5, r6, r4
	ldr r4, [fp, #-4]
	add r6, r5, r4
	mov r0, r6
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .F0
.LTORG
addr_s0:
	.word s
.F0:

addr_s1:
	.word s

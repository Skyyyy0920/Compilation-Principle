	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.text
	.global QuickSort
	.type QuickSort , %function
QuickSort:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #28
.L120:
	str r0, [fp, #-28]
	str r1, [fp, #-24]
	str r2, [fp, #-20]
	ldr r10, [fp, #-24]
	ldr r9, [fp, #-20]
	cmp r10, r9
	movlt r4, #1
	movge r4, #0
	blt .L124
	b .L128
.L124:
	ldr r4, [fp, #-24]
	str r4, [fp, #-16]
	ldr r4, [fp, #-20]
	str r4, [fp, #-12]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-8]
	b .L134
.L125:
	mov r0, #0
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L128:
	b .L125
.L134:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L135
	b .L139
.L135:
	b .L140
.L136:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-16]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-4]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl QuickSort
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl QuickSort
	mov r4, r0
	str r4, [fp, #-4]
	b .L125
.L139:
	b .L136
.L140:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L143
	b .L146
.L141:
	ldr r4, [fp, #-12]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-12]
	b .L140
.L142:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L152
	b .L156
.L143:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	ldr r6, =1
	sub r7, r5, r6
	cmp r4, r7
	movgt r4, #1
	movle r4, #0
	bgt .L141
	b .L151
.L146:
	b .L142
.L151:
	b .L142
.L152:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-16]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	b .L153
.L153:
	b .L160
.L156:
	b .L153
.L160:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L163
	b .L166
.L161:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	b .L160
.L162:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L172
	b .L176
.L163:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L161
	b .L171
.L166:
	b .L162
.L171:
	b .L162
.L172:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-12]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-12]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-12]
	b .L173
	b .F0
.LTORG
addr_n0:
	.word n
.F0:
.L173:
	b .L134
.L176:
	b .L173

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #52
.L185:
	ldr r10, =10
	ldr r9, addr_n1
	str r10, [r9]
	mov r4, #0
	mov r5, #-52
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =4
	str r4, [r5]
	mov r4, #1
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #2
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =9
	str r4, [r5]
	mov r4, #3
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =2
	str r4, [r5]
	mov r4, #4
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #5
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #6
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =6
	str r4, [r5]
	mov r4, #7
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #9
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =8
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =9
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [fp, #-12]
	ldr r6, [fp, #-8]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl QuickSort
	mov r4, r0
	str r4, [fp, #-12]
	b .L189
.L189:
	ldr r4, [fp, #-12]
	ldr r5, addr_n1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L190
	b .L194
.L190:
	ldr r4, [fp, #-12]
	mov r5, #-52
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	ldr r4, [fp, #-12]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L189
.L191:
	mov r0, #0
	add sp, sp, #52
	pop {r4, r5, r6, r7, r9, r10, fp, lr}
	bx lr
.L194:
	b .L191

addr_n1:
	.word n

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
	.global swap
	.type swap , %function
swap:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L143:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r10, [fp, #-16]
	ldr r9, [fp, #-12]
	mov r8, #4
	mul r7, r9, r8
	add r4, r10, r7
	ldr r5, [r4]
	str r5, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-12]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	.global heap_ajust
	.type heap_ajust , %function
heap_ajust:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L155:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	str r2, [fp, #-12]
	ldr r10, [fp, #-16]
	str r10, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul r6, r4, r5
	ldr r4, =1
	add r5, r6, r4
	str r5, [fp, #-4]
	b .L161
.L161:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	ldr r6, =1
	add r7, r5, r6
	cmp r4, r7
	movlt r4, #1
	movge r4, #0
	blt .L162
	b .L166
.L162:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L169
	b .L172
.L163:
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L166:
	b .L163
.L167:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L168
.L168:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-4]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L180
	b .L189
.L169:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-4]
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-4]
	ldr r7, =1
	add r8, r6, r7
	mov r6, #4
	mul r7, r8, r6
	add r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L167
	b .L179
.L172:
	b .L168
.L179:
	b .L168
.L180:
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
	b .L182
.L181:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl swap
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul r6, r4, r5
	ldr r4, =1
	add r5, r6, r4
	str r5, [fp, #-4]
	b .L182
.L182:
	b .L161
.L189:
	b .L181

	.global heap_sort
	.type heap_sort , %function
heap_sort:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L192:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r10, [fp, #-16]
	ldr r9, =2
	sdiv r8, r10, r9
	ldr r4, =1
	sub r5, r8, r4
	str r5, [fp, #-12]
	b .L197
.L197:
	ldr r4, [fp, #-12]
	ldr r5, =0
	ldr r6, =1
	sub r7, r5, r6
	cmp r4, r7
	movgt r4, #1
	movle r4, #0
	bgt .L198
	b .L202
.L198:
	ldr r4, [fp, #-16]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-8]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl heap_ajust
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-12]
	b .L197
.L199:
	ldr r4, [fp, #-16]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-12]
	b .L204
.L202:
	b .L199
.L204:
	ldr r4, [fp, #-12]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L205
	b .L209
.L205:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-12]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl swap
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-8]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl heap_ajust
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-12]
	b .L204
.L206:
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L209:
	b .L206

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #48
.L214:
	ldr r10, =10
	ldr r9, addr_n0
	str r10, [r9]
	mov r4, #0
	mov r5, #-48
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =4
	str r4, [r5]
	mov r4, #1
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #2
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =9
	str r4, [r5]
	mov r4, #3
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =2
	str r4, [r5]
	mov r4, #4
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #5
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #6
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =6
	str r4, [r5]
	mov r4, #7
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	mov r5, #-48
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #9
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =8
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, addr_n0
	ldr r6, [r4]
	mov r0, r5
	mov r1, r6
	bl heap_sort
	mov r4, r0
	str r4, [fp, #-8]
	b .L217
.L217:
	ldr r4, [fp, #-8]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L218
	b .L222
.L218:
	ldr r4, [fp, #-8]
	mov r5, #-48
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
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L217
.L219:
	mov r0, #0
	add sp, sp, #48
	pop {r4, r5, r6, r7, r9, r10, fp, lr}
	bx lr
.L222:
	b .L219

addr_n0:
	.word n

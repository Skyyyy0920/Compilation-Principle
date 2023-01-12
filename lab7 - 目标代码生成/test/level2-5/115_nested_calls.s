	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global func1
	.type func1 , %function
func1:
	push {r4, r5, r6, r7, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L150:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r10, [fp, #-4]
	cmp r10, #0
	beq .L154
	b .L159
.L154:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	mul r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, r7, r10, fp, lr}
	bx lr
	b .L156
.L155:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	sub r7, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, #0
	bl func1
	mov r4, r0
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, r7, r10, fp, lr}
	bx lr
	b .L156
.L156:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r10, fp, lr}
	bx lr
.L159:
	b .L155

	.global func2
	.type func2 , %function
func2:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L161:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r10, [fp, #-4]
	cmp r10, #0
	bne .L164
	b .L168
.L164:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	mov r0, r6
	mov r1, #0
	bl func2
	mov r4, r0
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
	b .L166
.L165:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
	b .L166
.L166:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L168:
	b .L165

	.global func3
	.type func3 , %function
func3:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L171:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r10, [fp, #-4]
	cmp r10, #0
	beq .L174
	b .L179
.L174:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	mov r0, r6
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
	b .L176
.L175:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	mov r0, r6
	mov r1, #0
	bl func3
	mov r4, r0
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
	b .L176
.L176:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L179:
	b .L175

	.global func4
	.type func4 , %function
func4:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L181:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r10, [fp, #-12]
	cmp r10, #0
	bne .L185
	b .L189
.L185:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #12
	pop {r4, r10, fp, lr}
	bx lr
	b .L187
.L186:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #12
	pop {r4, r10, fp, lr}
	bx lr
	b .L187
.L187:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r10, fp, lr}
	bx lr
.L189:
	b .L186

	.global func5
	.type func5 , %function
func5:
	push {r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L192:
	str r0, [fp, #-4]
	ldr r10, [fp, #-4]
	ldr r9, =0
	sub r8, r9, r10
	mov r0, r8
	add sp, sp, #4
	pop {r8, r9, r10, fp, lr}
	bx lr

	.global func6
	.type func6 , %function
func6:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L195:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r10, [fp, #-8]
	cmp r10, #0
	bne .L201
	b .L203
.L198:
	mov r0, #1
	add sp, sp, #8
	pop {r4, r10, fp, lr}
	bx lr
	b .L200
.L199:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r10, fp, lr}
	bx lr
	b .L200
.L200:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r10, fp, lr}
	bx lr
.L201:
	ldr r4, [fp, #-4]
	cmp r4, #0
	bne .L198
	b .L206
.L203:
	b .L199
.L206:
	b .L199

	.global func7
	.type func7 , %function
func7:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L209:
	str r0, [fp, #-4]
	ldr r10, [fp, #-4]
	cmp r10, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L211
	b .L216
.L211:
	mov r0, #1
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr
	b .L213
.L212:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr
	b .L213
.L213:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr
.L216:
	b .L212

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #76
.L219:
	bl getint
	mov r10, r0
	str r10, [fp, #-64]
	bl getint
	mov r4, r0
	str r4, [fp, #-60]
	bl getint
	mov r4, r0
	str r4, [fp, #-56]
	bl getint
	mov r4, r0
	str r4, [fp, #-52]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L226
.L226:
	ldr r4, [fp, #-8]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L227
	b .L231
.L227:
	bl getint
	mov r4, r0
	ldr r5, [fp, #-8]
	mov r6, #-48
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L226
.L228:
	ldr r4, [fp, #-64]
	mov r0, r4
	bl func7
	mov r4, r0
	ldr r5, [fp, #-60]
	mov r0, r5
	bl func5
	mov r5, r0
	mov r0, r4
	mov r1, r5
	bl func6
	mov r4, r0
	ldr r5, [fp, #-56]
	mov r0, r4
	mov r1, r5
	bl func2
	mov r4, r0
	ldr r5, [fp, #-52]
	mov r0, r4
	mov r1, r5
	bl func3
	mov r4, r0
	mov r0, r4
	bl func5
	mov r4, r0
	str r4, [fp, #-72]
	mov r4, #0
	mov r5, #-48
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-68]
	mov r4, #1
	mov r5, #-48
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	bl func5
	mov r4, r0
	mov r5, #2
	mov r6, #-48
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	mov r6, #3
	mov r7, #-48
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	add r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func7
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func6
	mov r5, r0
	mov r6, #4
	mov r7, #-48
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	add r7, fp, r6
	ldr r6, [r7]
	mov r7, #5
	mov r8, #-48
	mov r9, #4
	mul r10, r7, r9
	add r7, r8, r10
	add r8, fp, r7
	ldr r7, [r8]
	mov r0, r7
	bl func7
	mov r7, r0
	mov r0, r6
	mov r1, r7
	bl func2
	mov r6, r0
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl func4
	mov r4, r0
	mov r5, #6
	mov r6, #-48
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	mov r0, r4
	mov r1, r5
	bl func3
	mov r4, r0
	mov r5, #7
	mov r6, #-48
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	mov r0, r4
	mov r1, r5
	bl func2
	mov r4, r0
	mov r5, #8
	mov r6, #-48
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	mov r6, #9
	mov r7, #-48
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	add r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func7
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func3
	mov r5, r0
	ldr r6, [fp, #-64]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl func1
	mov r4, r0
	ldr r5, [fp, #-72]
	mov r0, r5
	ldr r5, [fp, #-68]
	mov r1, r5
	mov r2, r4
	bl func4
	mov r4, r0
	ldr r5, [fp, #-60]
	ldr r6, [fp, #-56]
	mov r0, r6
	bl func7
	mov r6, r0
	ldr r7, [fp, #-52]
	mov r0, r6
	mov r1, r7
	bl func3
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func2
	mov r5, r0
	mov r0, r4
	mov r1, r5
	bl func3
	mov r4, r0
	mov r5, #0
	mov r6, #-48
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	mov r6, #1
	mov r7, #-48
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	add r7, fp, r6
	ldr r6, [r7]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl func1
	mov r4, r0
	mov r5, #2
	mov r6, #-48
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	add r6, fp, r5
	ldr r5, [r6]
	mov r0, r4
	mov r1, r5
	bl func2
	mov r4, r0
	mov r5, #3
	mov r6, #-48
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	str r5, [fp, #-76]
	mov r5, #4
	mov r6, #-48
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	add r6, fp, r5
	ldr r5, [r6]
	mov r6, #5
	mov r7, #-48
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	add r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func5
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func3
	mov r5, r0
	mov r6, #6
	mov r7, #-48
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	add r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func5
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func2
	mov r5, r0
	mov r6, #7
	mov r7, #-48
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	add r7, fp, r6
	ldr r6, [r7]
	mov r7, #8
	mov r8, #-48
	mov r9, #4
	mul r10, r7, r9
	add r7, r8, r10
	add r8, fp, r7
	ldr r7, [r8]
	mov r0, r7
	bl func7
	mov r7, r0
	mov r0, r5
	mov r1, r6
	mov r2, r7
	bl func1
	mov r5, r0
	mov r6, #9
	mov r7, #-48
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	add r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func5
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func2
	mov r5, r0
	ldr r6, [fp, #-64]
	mov r0, r5
	mov r1, r6
	bl func3
	mov r5, r0
	mov r0, r4
	ldr r4, [fp, #-76]
	mov r1, r4
	mov r2, r5
	bl func1
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .F0
.LTORG
.F0:
.L231:
	b .L228


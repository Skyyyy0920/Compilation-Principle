	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.section .rodata
	.global N
	.align 4
	.size N, 4
N:
	.word 10000
	.text
	.global long_array
	.type long_array , %function
long_array:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	ldr r4, =120020
	sub sp, sp, r4
.L136:
	ldr r10, =-120020
	str r0, [fp, r10]
	ldr r4, =0
	str r4, [fp, #-16]
	b .L142
.L142:
	ldr r4, [fp, #-16]
	ldr r5, addr_N0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L143
	b .L147
.L143:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-16]
	mul r6, r4, r5
	ldr r4, =10
	sdiv r5, r6, r4
	mul r4, r5, r4
	sub r5, r6, r4
	ldr r4, [fp, #-16]
	ldr r6, =-120016
	mov r8, #4
	mul r7, r4, r8
	add r4, r6, r7
	add r6, fp, r4
	str r5, [r6]
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	b .L142
.L144:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L148
.L147:
	b .L144
.L148:
	ldr r4, [fp, #-16]
	ldr r5, addr_N0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L149
	b .L153
.L149:
	ldr r4, [fp, #-16]
	ldr r5, =-120016
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, =-120016
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	mul r6, r4, r5
	ldr r4, =10
	sdiv r5, r6, r4
	mul r4, r5, r4
	sub r5, r6, r4
	ldr r4, [fp, #-16]
	ldr r6, =-80016
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	str r5, [r6]
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	b .L148
.L150:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L156
.L153:
	b .L150
.L156:
	ldr r4, [fp, #-16]
	ldr r5, addr_N0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L157
	b .L161
.L157:
	ldr r4, [fp, #-16]
	ldr r5, =-80016
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, =-80016
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	mul r6, r4, r5
	ldr r4, =100
	sdiv r5, r6, r4
	mul r4, r5, r4
	sub r5, r6, r4
	ldr r4, [fp, #-16]
	ldr r6, =-120016
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	ldr r4, [r6]
	add r6, r5, r4
	ldr r4, [fp, #-16]
	ldr r5, =-40016
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	add r5, fp, r4
	str r6, [r5]
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	b .L156
.L158:
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-16]
	b .L166
.L161:
	b .L158
.L166:
	ldr r4, [fp, #-16]
	ldr r5, addr_N0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L167
	b .L171
.L167:
	ldr r4, [fp, #-16]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L172
	b .L177
.L168:
	ldr r4, [fp, #-12]
	mov r0, r4
	ldr r1, =120020
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L171:
	b .L168
.L172:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, =-40016
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	add r6, r4, r5
	ldr r4, =1333
	sdiv r5, r6, r4
	mul r5, r5, r4
	sub r4, r6, r5
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	mov r0, r4
	bl putint
	b .L174
	b .F0
.LTORG
addr_N0:
	.word N
.F0:
.L173:
	ldr r4, [fp, #-16]
	cmp r4, #20
	movlt r4, #1
	movge r4, #0
	blt .L179
	b .L184
.L174:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	b .L166
.L177:
	b .L173
.L179:
	ldr r4, addr_N1
	ldr r5, [r4]
	ldr r4, =2
	sdiv r6, r5, r4
	str r6, [fp, #-8]
	b .L186
.L180:
	ldr r4, [fp, #-16]
	cmp r4, #30
	movlt r4, #1
	movge r4, #0
	blt .L194
	b .L199
.L181:
	b .L174
.L184:
	b .L180
.L186:
	ldr r4, [fp, #-8]
	ldr r5, addr_N1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L187
	b .L191
.L187:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, =-40016
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	add r6, r4, r5
	ldr r4, [fp, #-8]
	ldr r5, =-120016
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	add r5, fp, r4
	ldr r4, [r5]
	sub r5, r6, r4
	str r5, [fp, #-12]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L186
.L188:
	ldr r4, [fp, #-12]
	mov r0, r4
	bl putint
	b .L181
.L191:
	b .L188
.L194:
	ldr r4, addr_N1
	ldr r5, [r4]
	ldr r4, =2
	sdiv r6, r5, r4
	str r6, [fp, #-4]
	b .L201
.L195:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, =-40016
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	ldr r7, =-120020
	ldr r6, [fp, r7]
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, =99988
	sdiv r6, r5, r4
	mul r6, r6, r4
	sub r4, r5, r6
	str r4, [fp, #-12]
	b .L196
.L196:
	b .L181
.L199:
	b .L195
.L201:
	ldr r4, [fp, #-4]
	ldr r5, addr_N1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L202
	b .L206
.L202:
	ldr r4, [fp, #-4]
	ldr r5, =2233
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L207
	b .L212
.L203:
	ldr r4, [fp, #-12]
	mov r0, r4
	bl putint
	b .L196
.L206:
	b .L203
.L207:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, =-80016
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	add r6, r4, r5
	ldr r4, [fp, #-4]
	ldr r5, =-120016
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	add r5, fp, r4
	ldr r4, [r5]
	sub r5, r6, r4
	str r5, [fp, #-12]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L209
.L208:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, =-120016
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [r6]
	add r6, r4, r5
	ldr r4, [fp, #-4]
	ldr r5, =-40016
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	add r5, fp, r4
	ldr r4, [r5]
	add r5, r6, r4
	ldr r4, =13333
	sdiv r6, r5, r4
	mul r4, r6, r4
	sub r6, r5, r4
	str r6, [fp, #-12]
	ldr r4, [fp, #-4]
	ldr r5, =2
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L209
.L209:
	b .L201
.L212:
	b .L208

	.global main
	.type main , %function
main:
	push {r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L219:
	mov r0, #9
	bl long_array
	mov r10, r0
	mov r0, r10
	add sp, sp, #0
	pop {r10, fp, lr}
	bx lr

addr_N1:
	.word N

	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.global b
	.align 4
	.size b, 4
b:
	.word 0
	.global d
	.align 4
	.size d, 4
d:
	.word 0
	.text
	.global set_a
	.type set_a , %function
set_a:
	push {r4, r5, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L121:
	str r0, [fp, #-4]
	ldr r10, [fp, #-4]
	ldr r9, addr_a0
	str r10, [r9]
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r9, r10, fp, lr}
	bx lr

	.global set_b
	.type set_b , %function
set_b:
	push {r4, r5, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L124:
	str r0, [fp, #-4]
	ldr r10, [fp, #-4]
	ldr r9, addr_b0
	str r10, [r9]
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r9, r10, fp, lr}
	bx lr

	.global set_d
	.type set_d , %function
set_d:
	push {r4, r5, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L127:
	str r0, [fp, #-4]
	ldr r10, [fp, #-4]
	ldr r9, addr_d0
	str r10, [r9]
	ldr r4, addr_d0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r9, r10, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L130:
	ldr r10, =2
	ldr r9, addr_a0
	str r10, [r9]
	ldr r4, =3
	ldr r5, addr_b0
	str r4, [r5]
	mov r0, #0
	bl set_a
	mov r4, r0
	cmp r4, #0
	bne .L133
	b .L135
.L131:
	b .L132
.L132:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, =2
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_b0
	str r4, [r5]
	mov r0, #0
	bl set_a
	mov r4, r0
	cmp r4, #0
	bne .L142
	b .L144
.L133:
	mov r0, #1
	bl set_b
	mov r4, r0
	cmp r4, #0
	bne .L131
	b .L138
.L135:
	b .L132
.L138:
	b .L132
.L140:
	b .L141
.L141:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, =1
	str r4, [fp, #-24]
	ldr r4, =2
	ldr r5, addr_d0
	str r4, [r5]
	ldr r4, [fp, #-24]
	cmp r4, #1
	movge r4, #1
	movlt r4, #0
	bge .L152
	b .L155
.L142:
	mov r0, #1
	bl set_b
	mov r4, r0
	cmp r4, #0
	bne .L140
	b .L147
.L144:
	b .L141
.L147:
	b .L141
.L150:
	b .L151
.L151:
	ldr r4, addr_d0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, [fp, #-24]
	cmp r4, #1
	movle r4, #1
	movgt r4, #0
	ble .L159
	b .L164
.L152:
	mov r0, #3
	bl set_d
	mov r4, r0
	cmp r4, #0
	bne .L150
	b .L157
.L155:
	b .L151
.L157:
	b .L151
.L159:
	b .L160
.L160:
	ldr r4, addr_d0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, =2
	ldr r5, =1
	add r6, r4, r5
	ldr r4, =3
	sub r5, r4, r6
	ldr r4, =16
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L168
	b .L172
.L161:
	mov r0, #4
	bl set_d
	mov r4, r0
	cmp r4, #0
	bne .L159
	b .L166
.L164:
	b .L161
.L166:
	b .L160
.L168:
	mov r0, #65
	bl putch
	b .L169
.L169:
	ldr r4, =25
	ldr r5, =7
	sub r6, r4, r5
	ldr r4, =6
	ldr r5, =3
	mul r7, r4, r5
	ldr r4, =36
	sub r5, r4, r7
	cmp r6, r5
	bne .L173
	b .L177
.L172:
	b .L169
.L173:
	mov r0, #66
	bl putch
	b .L174
.L174:
	ldr r4, =1
	cmp r4, #8
	movlt r4, #1
	movge r4, #0
	ldr r5, =7
	ldr r6, =2
	sdiv r7, r5, r6
	mul r6, r7, r6
	sub r7, r5, r6
	mov r5, r4
	cmp r5, r7
	bne .L178
	b .L186
.L177:
	b .L174
.L178:
	mov r0, #67
	bl putch
	b .L179
.L179:
	ldr r4, =3
	cmp r4, #4
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	cmp r5, #0
	beq .L187
	b .L195
	b .F0
.LTORG
addr_a0:
	.word a
addr_b0:
	.word b
addr_d0:
	.word d
.F0:
.L181:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, r9, r10, fp, lr}
	bx lr
.L182:
	b .L181
.L186:
	b .L179
.L187:
	mov r0, #68
	bl putch
	b .L188
.L188:
	ldr r4, =102
	cmp r4, #63
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =1
	cmp r4, r5
	beq .L196
	b .L204
.L190:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, r9, r10, fp, lr}
	bx lr
.L191:
	b .L190
.L195:
	b .L188
.L196:
	mov r0, #69
	bl putch
	b .L197
.L197:
	ldr r4, =5
	ldr r5, =6
	sub r6, r4, r5
	ldr r4, =0
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	sub r7, r4, r5
	cmp r6, r7
	beq .L205
	b .L211
.L199:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, r9, r10, fp, lr}
	bx lr
.L200:
	b .L199
.L204:
	b .L197
.L205:
	mov r0, #70
	bl putch
	b .L206
.L206:
	mov r0, #10
	bl putch
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, =1
	str r4, [fp, #-16]
	ldr r4, =2
	str r4, [fp, #-12]
	ldr r4, =3
	str r4, [fp, #-8]
	ldr r4, =4
	str r4, [fp, #-4]
	b .L217
.L211:
	b .L206
.L217:
	ldr r4, [fp, #-20]
	cmp r4, #0
	bne .L220
	b .L222
.L218:
	mov r0, #32
	bl putch
	b .L217
.L219:
	ldr r4, [fp, #-20]
	cmp r4, #0
	bne .L227
	b .L231
.L220:
	ldr r4, [fp, #-16]
	cmp r4, #0
	bne .L218
	b .L225
.L222:
	b .L219
.L225:
	b .L219
.L227:
	mov r0, #67
	bl putch
	b .L228
.L228:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L236
	b .L241
.L229:
	ldr r4, [fp, #-16]
	cmp r4, #0
	bne .L227
	b .L234
.L231:
	b .L229
.L234:
	b .L228
.L236:
	mov r0, #72
	bl putch
	b .L237
.L237:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L247
	b .L250
.L238:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L236
	b .L244
.L241:
	b .L238
.L244:
	b .L237
.L245:
	mov r0, #73
	bl putch
	b .L246
.L246:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	cmp r5, #0
	moveq r5, #1
	movne r5, #0
	mov r6, r5
	cmp r4, r6
	beq .L257
	b .L262
.L247:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	cmp r4, r5
	bne .L245
	b .L253
.L250:
	b .L246
.L253:
	b .L246
.L254:
	mov r0, #74
	bl putch
	b .L255
.L255:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	cmp r5, #0
	moveq r5, #1
	movne r5, #0
	mov r6, r5
	cmp r4, r6
	beq .L269
	b .L276
.L256:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L254
	b .L268
.L257:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L254
	b .L265
.L262:
	b .L256
.L265:
	b .L256
.L268:
	b .L255
.L269:
	mov r0, #75
	bl putch
	b .L270
	b .F1
.LTORG
addr_a1:
	.word a
addr_b1:
	.word b
addr_d1:
	.word d
.F1:
.L270:
	mov r0, #10
	bl putch
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, r9, r10, fp, lr}
	bx lr
.L271:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L277
	b .L280
.L276:
	b .L271
.L277:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L269
	b .L283
.L280:
	b .L270
.L283:
	b .L270

addr_a2:
	.word a
addr_b2:
	.word b
addr_d2:
	.word d

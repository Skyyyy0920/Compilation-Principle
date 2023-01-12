	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.comm array, 440, 4
	.text
	.global init
	.type init , %function
init:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L174:
	str r0, [fp, #-8]
	ldr r10, =1
	str r10, [fp, #-4]
	b .L177
.L177:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-8]
	mul r7, r5, r6
	ldr r5, =1
	add r6, r7, r5
	cmp r4, r6
	movle r4, #1
	movgt r4, #0
	ble .L178
	b .L182
.L178:
	ldr r4, =0
	ldr r5, =1
	sub r6, r4, r5
	ldr r4, [fp, #-4]
	ldr r5, addr_array0
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	str r6, [r5]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L177
.L179:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L180:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L181:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L182:
	b .L179

	.global findfa
	.type findfa , %function
findfa:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L184:
	str r0, [fp, #-4]
	ldr r10, [fp, #-4]
	ldr r9, addr_array0
	mov r8, #4
	mul r7, r10, r8
	add r4, r9, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-4]
	cmp r4, r5
	beq .L186
	b .L192
.L186:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .L188
.L187:
	ldr r4, [fp, #-4]
	ldr r5, addr_array0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl findfa
	mov r4, r0
	ldr r5, [fp, #-4]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, addr_array0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .L188
.L188:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L192:
	b .L187

	.global mmerge
	.type mmerge , %function
mmerge:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L196:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r10, [fp, #-16]
	mov r0, r10
	bl findfa
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	mov r0, r4
	bl findfa
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	bne .L201
	b .L205
.L201:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	b .L202
.L202:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L203:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L204:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L205:
	b .L202

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #36
.L207:
	ldr r10, =1
	str r10, [fp, #-36]
	b .L212
.L212:
	ldr r4, [fp, #-36]
	cmp r4, #0
	bne .L213
	b .L216
.L213:
	ldr r4, [fp, #-36]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-36]
	ldr r4, =4
	ldr r5, addr_n0
	str r4, [r5]
	ldr r4, =10
	str r4, [fp, #-32]
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, addr_n0
	ldr r5, [r4]
	mov r0, r5
	bl init
	ldr r4, addr_n0
	ldr r5, [r4]
	ldr r4, addr_n0
	ldr r6, [r4]
	mul r4, r5, r6
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L221
.L214:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L216:
	b .L214
.L221:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-32]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L222
	b .L226
.L222:
	bl getint
	mov r4, r0
	str r4, [fp, #-28]
	bl getint
	mov r4, r0
	str r4, [fp, #-24]
	ldr r4, [fp, #-16]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L227
	b .L231
.L223:
	ldr r4, [fp, #-16]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L300
	b .L304
.L226:
	b .L223
.L227:
	ldr r4, addr_n0
	ldr r5, [r4]
	ldr r4, [fp, #-28]
	ldr r6, =1
	sub r7, r4, r6
	mul r4, r5, r7
	ldr r5, [fp, #-24]
	add r6, r4, r5
	str r6, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-28]
	cmp r4, #1
	beq .L234
	b .L238
.L228:
	ldr r4, [fp, #-20]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-20]
	b .L221
.L231:
	b .L228
.L234:
	mov r4, #0
	ldr r5, addr_array0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-8]
	mov r0, r4
	mov r1, #0
	bl mmerge
	b .L235
.L235:
	ldr r4, [fp, #-28]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	beq .L239
	b .L243
.L238:
	b .L235
.L239:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-12]
	ldr r6, addr_array0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	mov r0, r4
	mov r1, r5
	bl mmerge
	b .L240
.L240:
	ldr r4, [fp, #-24]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L246
	b .L249
.L243:
	b .L240
.L244:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, =1
	add r7, r5, r6
	mov r0, r4
	mov r1, r7
	bl mmerge
	b .L245
.L245:
	ldr r4, [fp, #-24]
	cmp r4, #1
	movgt r4, #1
	movle r4, #0
	bgt .L256
	b .L259
.L246:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	ldr r4, addr_array0
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	ldr r6, =1
	sub r7, r4, r6
	cmp r5, r7
	bne .L244
	b .L253
	b .F0
.LTORG
addr_array0:
	.word array
addr_n0:
	.word n
.F0:
.L249:
	b .L245
.L253:
	b .L245
.L254:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, =1
	sub r7, r5, r6
	mov r0, r4
	mov r1, r7
	bl mmerge
	b .L255
.L255:
	ldr r4, [fp, #-28]
	ldr r5, addr_n1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L266
	b .L269
.L256:
	ldr r4, [fp, #-8]
	ldr r5, =1
	sub r6, r4, r5
	ldr r4, addr_array1
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	ldr r6, =1
	sub r7, r4, r6
	cmp r5, r7
	bne .L254
	b .L263
.L259:
	b .L255
.L263:
	b .L255
.L264:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, addr_n1
	ldr r7, [r6]
	add r6, r5, r7
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L265
.L265:
	ldr r4, [fp, #-28]
	cmp r4, #1
	movgt r4, #1
	movle r4, #0
	bgt .L276
	b .L279
.L266:
	ldr r4, [fp, #-8]
	ldr r5, addr_n1
	ldr r6, [r5]
	add r5, r4, r6
	ldr r4, addr_array1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	ldr r6, =1
	sub r7, r4, r6
	cmp r5, r7
	bne .L264
	b .L273
.L269:
	b .L265
.L273:
	b .L265
.L274:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, addr_n1
	ldr r7, [r6]
	sub r6, r5, r7
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L275
.L275:
	mov r4, #0
	ldr r5, addr_array1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =0
	ldr r6, =1
	sub r7, r5, r6
	cmp r4, r7
	bne .L287
	b .L291
.L276:
	ldr r4, [fp, #-8]
	ldr r5, addr_n1
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_array1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	ldr r6, =1
	sub r7, r4, r6
	cmp r5, r7
	bne .L274
	b .L283
.L279:
	b .L275
.L283:
	b .L275
.L284:
	ldr r4, =1
	str r4, [fp, #-16]
	ldr r4, [fp, #-20]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	b .L285
.L285:
	b .L228
.L286:
	mov r0, #0
	bl findfa
	mov r4, r0
	ldr r5, [fp, #-12]
	mov r0, r5
	bl findfa
	mov r5, r0
	cmp r4, r5
	beq .L284
	b .L298
.L287:
	ldr r4, [fp, #-12]
	ldr r5, addr_array1
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =0
	ldr r6, =1
	sub r7, r5, r6
	cmp r4, r7
	bne .L286
	b .L295
.L291:
	b .L285
.L295:
	b .L285
.L298:
	b .L285
.L300:
	ldr r4, =0
	ldr r5, =1
	sub r6, r4, r5
	mov r0, r6
	bl putint
	mov r0, #10
	bl putch
	b .L301
.L301:
	b .L212
.L304:
	b .L301

addr_array1:
	.word array
addr_n1:
	.word n

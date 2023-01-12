	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.section .rodata
	.global maxn
	.align 4
	.size maxn, 4
maxn:
	.word 18
	.global mod
	.align 4
	.size mod, 4
mod:
	.word 1000000007
	.comm dp, 52907904, 4
	.comm list, 800, 4
	.comm cns, 80, 4
	.text
	.global equal
	.type equal , %function
equal:
	push {r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L246:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r10, [fp, #-8]
	ldr r9, [fp, #-4]
	cmp r10, r9
	beq .L249
	b .L253
.L249:
	mov r0, #1
	add sp, sp, #8
	pop {r9, r10, fp, lr}
	bx lr
	b .L250
.L250:
	mov r0, #0
	add sp, sp, #8
	pop {r9, r10, fp, lr}
	bx lr
.L253:
	b .L250

	.global dfs
	.type dfs , %function
dfs:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #40
.L255:
	str r0, [fp, #-28]
	str r1, [fp, #-24]
	str r2, [fp, #-20]
	str r3, [fp, #-16]
	ldr r3, [fp, #36]
	str r3, [fp, #-12]
	ldr r3, [fp, #40]
	str r3, [fp, #-8]
	ldr r10, [fp, #-28]
	ldr r9, addr_dp0
	ldr r8, =2939328
	mul r7, r10, r8
	add r4, r9, r7
	mov r5, r4
	ldr r4, [fp, #-24]
	ldr r6, =163296
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [fp, #-20]
	ldr r6, =9072
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-16]
	ldr r6, =504
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [fp, #-12]
	mov r6, #28
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-8]
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	ldr r5, [r4]
	ldr r4, =0
	ldr r6, =1
	sub r7, r4, r6
	cmp r5, r7
	bne .L262
	b .L272
.L262:
	ldr r4, [fp, #-28]
	ldr r5, addr_dp0
	ldr r6, =2939328
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-24]
	ldr r6, =163296
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [fp, #-20]
	ldr r6, =9072
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-16]
	ldr r6, =504
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [fp, #-12]
	mov r6, #28
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #40
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .L263
.L263:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	add r6, r4, r5
	ldr r4, [fp, #-20]
	add r5, r6, r4
	ldr r4, [fp, #-16]
	add r6, r5, r4
	ldr r4, [fp, #-12]
	add r5, r6, r4
	cmp r5, #0
	beq .L279
	b .L283
.L272:
	b .L263
.L279:
	mov r0, #1
	add sp, sp, #40
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .L280
.L280:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-28]
	cmp r4, #0
	bne .L285
	b .L288
.L283:
	b .L280
.L285:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-8]
	mov r0, r6
	mov r1, #2
	bl equal
	mov r6, r0
	sub r7, r5, r6
	ldr r5, [fp, #-28]
	ldr r6, =1
	sub r8, r5, r6
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	ldr r9, [fp, #-16]
	ldr r10, [fp, #-12]
	mov r0, r8
	mov r1, r5
	mov r2, r6
	mov r3, r9
	mov r5, #1
	push {r5}
	push {r10}
	bl dfs
	add sp, sp, #8
	mov r5, r0
	mul r6, r7, r5
	add r5, r4, r6
	ldr r4, addr_mod0
	ldr r6, [r4]
	sdiv r4, r5, r6
	mul r4, r4, r6
	sub r6, r5, r4
	str r6, [fp, #-4]
	b .L286
.L286:
	ldr r4, [fp, #-24]
	cmp r4, #0
	bne .L290
	b .L293
.L288:
	b .L286
.L290:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-8]
	mov r0, r6
	mov r1, #3
	bl equal
	mov r6, r0
	sub r7, r5, r6
	ldr r5, [fp, #-28]
	ldr r6, =1
	add r8, r5, r6
	ldr r5, [fp, #-24]
	ldr r6, =1
	sub r9, r5, r6
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-16]
	ldr r10, [fp, #-12]
	mov r0, r8
	mov r1, r9
	mov r2, r5
	mov r3, r6
	mov r5, #2
	push {r5}
	push {r10}
	bl dfs
	add sp, sp, #8
	mov r5, r0
	mul r6, r7, r5
	add r5, r4, r6
	ldr r4, addr_mod0
	ldr r6, [r4]
	sdiv r4, r5, r6
	mul r4, r4, r6
	sub r6, r5, r4
	str r6, [fp, #-4]
	b .L291
	b .F0
.LTORG
addr_maxn0:
	.word maxn
addr_mod0:
	.word mod
addr_dp0:
	.word dp
addr_list0:
	.word list
addr_cns0:
	.word cns
.F0:
.L291:
	ldr r4, [fp, #-20]
	cmp r4, #0
	bne .L295
	b .L298
.L293:
	b .L291
.L295:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-8]
	mov r0, r6
	mov r1, #4
	bl equal
	mov r6, r0
	sub r7, r5, r6
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-24]
	ldr r8, =1
	add r9, r6, r8
	ldr r6, [fp, #-20]
	ldr r8, =1
	sub r10, r6, r8
	ldr r6, [fp, #-16]
	ldr r8, [fp, #-12]
	mov r0, r5
	mov r1, r9
	mov r2, r10
	mov r3, r6
	mov r5, #3
	push {r5}
	push {r8}
	bl dfs
	add sp, sp, #8
	mov r5, r0
	mul r6, r7, r5
	add r5, r4, r6
	ldr r4, addr_mod1
	ldr r6, [r4]
	sdiv r4, r5, r6
	mul r6, r4, r6
	sub r4, r5, r6
	str r4, [fp, #-4]
	b .L296
.L296:
	ldr r4, [fp, #-16]
	cmp r4, #0
	bne .L300
	b .L303
.L298:
	b .L296
.L300:
	ldr r4, [fp, #-4]
	str r4, [fp, #-32]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r0, r5
	mov r1, #5
	bl equal
	mov r5, r0
	sub r6, r4, r5
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	ldr r7, [fp, #-20]
	ldr r8, =1
	add r9, r7, r8
	ldr r7, [fp, #-16]
	ldr r8, =1
	sub r10, r7, r8
	ldr r7, [fp, #-12]
	mov r0, r4
	mov r1, r5
	mov r2, r9
	mov r3, r10
	mov r4, #4
	push {r4}
	push {r7}
	bl dfs
	add sp, sp, #8
	mov r4, r0
	mul r5, r6, r4
	ldr r4, [fp, #-32]
	add r6, r4, r5
	ldr r4, addr_mod1
	ldr r5, [r4]
	sdiv r4, r6, r5
	mul r4, r4, r5
	sub r5, r6, r4
	str r5, [fp, #-4]
	b .L301
.L301:
	ldr r4, [fp, #-12]
	cmp r4, #0
	bne .L305
	b .L308
.L303:
	b .L301
.L305:
	ldr r4, [fp, #-4]
	str r4, [fp, #-36]
	ldr r4, [fp, #-12]
	str r4, [fp, #-40]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	ldr r7, [fp, #-16]
	ldr r8, =1
	add r9, r7, r8
	ldr r7, [fp, #-12]
	ldr r8, =1
	sub r10, r7, r8
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r9
	mov r4, #5
	push {r4}
	push {r10}
	bl dfs
	add sp, sp, #8
	mov r4, r0
	ldr r5, [fp, #-40]
	mul r6, r5, r4
	ldr r4, [fp, #-36]
	add r5, r4, r6
	ldr r4, addr_mod1
	ldr r6, [r4]
	sdiv r4, r5, r6
	mul r6, r4, r6
	sub r4, r5, r6
	str r4, [fp, #-4]
	b .L306
.L306:
	ldr r4, [fp, #-4]
	ldr r5, addr_mod1
	ldr r6, [r5]
	sdiv r5, r4, r6
	mul r6, r5, r6
	sub r5, r4, r6
	ldr r4, [fp, #-28]
	ldr r6, addr_dp1
	ldr r7, =2939328
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-24]
	ldr r7, =163296
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [fp, #-20]
	ldr r8, =9072
	mul r7, r6, r8
	add r6, r4, r7
	ldr r4, [fp, #-16]
	ldr r7, =504
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [fp, #-12]
	mov r7, #28
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [fp, #-8]
	mov r8, #4
	mul r7, r4, r8
	add r4, r6, r7
	str r5, [r4]
	ldr r4, [fp, #-28]
	ldr r5, addr_dp1
	ldr r7, =2939328
	mul r6, r4, r7
	add r4, r5, r6
	mov r5, r4
	ldr r4, [fp, #-24]
	ldr r7, =163296
	mul r6, r4, r7
	add r4, r5, r6
	ldr r5, [fp, #-20]
	ldr r7, =9072
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, [fp, #-16]
	ldr r6, =504
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [fp, #-12]
	mov r6, #28
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #40
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .F1
.LTORG
addr_maxn1:
	.word maxn
addr_mod1:
	.word mod
addr_dp1:
	.word dp
addr_list1:
	.word list
addr_cns1:
	.word cns
.F1:
.L308:
	b .L306

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #36
.L322:
	bl getint
	mov r10, r0
	str r10, [fp, #-32]
	ldr r4, =0
	str r4, [fp, #-28]
	b .L325
.L325:
	ldr r4, [fp, #-28]
	ldr r5, addr_maxn2
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L326
	b .L330
.L326:
	ldr r4, =0
	str r4, [fp, #-24]
	b .L332
.L327:
	ldr r4, =0
	str r4, [fp, #-28]
	b .L371
.L330:
	b .L327
.L332:
	ldr r4, [fp, #-24]
	ldr r5, addr_maxn2
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L333
	b .L337
.L333:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L339
.L334:
	ldr r4, [fp, #-28]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-28]
	b .L325
.L337:
	b .L334
.L339:
	ldr r4, [fp, #-20]
	ldr r5, addr_maxn2
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L340
	b .L344
.L340:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L346
.L341:
	ldr r4, [fp, #-24]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-24]
	b .L332
.L344:
	b .L341
.L346:
	ldr r4, [fp, #-16]
	ldr r5, addr_maxn2
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L347
	b .L351
.L347:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L353
.L348:
	ldr r4, [fp, #-20]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-20]
	b .L339
.L351:
	b .L348
.L353:
	ldr r4, [fp, #-12]
	ldr r5, addr_maxn2
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L354
	b .L358
.L354:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L360
.L355:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	b .L346
.L358:
	b .L355
.L360:
	ldr r4, [fp, #-8]
	cmp r4, #7
	movlt r4, #1
	movge r4, #0
	blt .L361
	b .L365
.L361:
	ldr r4, =0
	ldr r5, =1
	sub r6, r4, r5
	ldr r4, [fp, #-28]
	ldr r5, addr_dp2
	ldr r7, =2939328
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	ldr r4, [fp, #-24]
	ldr r7, =163296
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [fp, #-20]
	ldr r7, =9072
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-16]
	ldr r7, =504
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [fp, #-12]
	mov r7, #28
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-8]
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	str r6, [r4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L360
.L362:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L353
.L365:
	b .L362
.L371:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-32]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L372
	b .L376
.L372:
	bl getint
	mov r4, r0
	ldr r5, [fp, #-28]
	ldr r6, addr_list2
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-28]
	ldr r5, addr_list2
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, addr_cns2
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =1
	add r6, r4, r5
	ldr r4, [fp, #-28]
	ldr r5, addr_list2
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	ldr r4, [r5]
	ldr r5, addr_cns2
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	str r6, [r5]
	ldr r4, [fp, #-28]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-28]
	b .L371
	b .F2
.LTORG
addr_maxn2:
	.word maxn
addr_mod2:
	.word mod
addr_dp2:
	.word dp
addr_list2:
	.word list
addr_cns2:
	.word cns
.F2:
.L373:
	mov r4, #1
	ldr r5, addr_cns3
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r5, #2
	ldr r6, addr_cns3
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	ldr r5, [r6]
	mov r6, #3
	ldr r7, addr_cns3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	mov r7, r6
	ldr r6, [r7]
	mov r7, #4
	ldr r8, addr_cns3
	mov r9, #4
	mul r10, r7, r9
	add r7, r8, r10
	mov r8, r7
	ldr r7, [r8]
	str r7, [fp, #-36]
	mov r7, #5
	ldr r8, addr_cns3
	mov r9, #4
	mul r10, r7, r9
	add r7, r8, r10
	mov r8, r7
	ldr r7, [r8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	ldr r4, [fp, #-36]
	mov r3, r4
	mov r4, #0
	push {r4}
	push {r7}
	bl dfs
	add sp, sp, #8
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L376:
	b .L373

addr_maxn3:
	.word maxn
addr_mod3:
	.word mod
addr_dp3:
	.word dp
addr_list3:
	.word list
addr_cns3:
	.word cns

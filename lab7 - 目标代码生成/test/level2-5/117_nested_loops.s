	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.comm arr1, 57600, 4
	.comm arr2, 107520, 4
	.text
	.global loop1
	.type loop1 , %function
loop1:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #36
.L284:
	str r0, [fp, #-36]
	str r1, [fp, #-32]
	ldr r10, =0
	str r10, [fp, #-28]
	b .L294
.L294:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-36]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L297
	b .L300
.L295:
	ldr r4, =0
	str r4, [fp, #-24]
	b .L304
.L296:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L297:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-32]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L295
	b .L303
.L298:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L299:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L300:
	b .L296
.L301:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L302:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L303:
	b .L296
.L304:
	ldr r4, [fp, #-24]
	cmp r4, #2
	movlt r4, #1
	movge r4, #0
	blt .L305
	b .L309
.L305:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L310
.L306:
	ldr r4, [fp, #-28]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-28]
	b .L294
.L307:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L308:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L309:
	b .L306
.L310:
	ldr r4, [fp, #-20]
	cmp r4, #3
	movlt r4, #1
	movge r4, #0
	blt .L311
	b .L315
.L311:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L316
.L312:
	ldr r4, [fp, #-24]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-24]
	b .L304
.L313:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L314:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L315:
	b .L312
.L316:
	ldr r4, [fp, #-16]
	cmp r4, #4
	movlt r4, #1
	movge r4, #0
	blt .L317
	b .L321
.L317:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L322
.L318:
	ldr r4, [fp, #-20]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-20]
	b .L310
.L319:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L320:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L321:
	b .L318
.L322:
	ldr r4, [fp, #-12]
	cmp r4, #5
	movlt r4, #1
	movge r4, #0
	blt .L323
	b .L327
.L323:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L328
.L324:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	b .L316
.L325:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L326:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L327:
	b .L324
.L328:
	ldr r4, [fp, #-8]
	cmp r4, #6
	movlt r4, #1
	movge r4, #0
	blt .L329
	b .L333
.L329:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L334
.L330:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L322
.L331:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L332:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L333:
	b .L330
.L334:
	ldr r4, [fp, #-4]
	cmp r4, #2
	movlt r4, #1
	movge r4, #0
	blt .L335
	b .L339
.L335:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	add r6, r4, r5
	ldr r4, [fp, #-20]
	add r5, r6, r4
	ldr r4, [fp, #-16]
	add r6, r5, r4
	ldr r4, [fp, #-12]
	add r5, r6, r4
	ldr r4, [fp, #-8]
	add r6, r5, r4
	ldr r4, [fp, #-4]
	add r5, r6, r4
	ldr r4, [fp, #-36]
	add r6, r5, r4
	ldr r4, [fp, #-32]
	add r5, r6, r4
	ldr r4, [fp, #-28]
	ldr r6, addr_arr10
	ldr r7, =5760
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-24]
	ldr r7, =2880
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [fp, #-20]
	ldr r8, =960
	mul r7, r6, r8
	add r6, r4, r7
	ldr r4, [fp, #-16]
	mov r7, #240
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [fp, #-12]
	mov r7, #48
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [fp, #-8]
	mov r7, #8
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L334
	b .F0
.LTORG
addr_arr10:
	.word arr1
addr_arr20:
	.word arr2
.F0:
.L336:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L328
.L337:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L338:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L339:
	b .L336

	.global loop2
	.type loop2 , %function
loop2:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #28
.L347:
	ldr r10, =0
	str r10, [fp, #-28]
	b .L355
.L355:
	ldr r4, [fp, #-28]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L356
	b .L360
.L356:
	ldr r4, =0
	str r4, [fp, #-24]
	b .L361
.L357:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L358:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L359:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L360:
	b .L357
.L361:
	ldr r4, [fp, #-24]
	cmp r4, #2
	movlt r4, #1
	movge r4, #0
	blt .L362
	b .L366
.L362:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L367
.L363:
	ldr r4, [fp, #-28]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-28]
	b .L355
.L364:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L365:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L366:
	b .L363
.L367:
	ldr r4, [fp, #-20]
	cmp r4, #3
	movlt r4, #1
	movge r4, #0
	blt .L368
	b .L372
.L368:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L373
.L369:
	ldr r4, [fp, #-24]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-24]
	b .L361
.L370:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L371:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L372:
	b .L369
.L373:
	ldr r4, [fp, #-16]
	cmp r4, #2
	movlt r4, #1
	movge r4, #0
	blt .L374
	b .L378
.L374:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L379
.L375:
	ldr r4, [fp, #-20]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-20]
	b .L367
.L376:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L377:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L378:
	b .L375
.L379:
	ldr r4, [fp, #-12]
	cmp r4, #4
	movlt r4, #1
	movge r4, #0
	blt .L380
	b .L384
.L380:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L385
.L381:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	b .L373
.L382:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L383:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L384:
	b .L381
.L385:
	ldr r4, [fp, #-8]
	cmp r4, #8
	movlt r4, #1
	movge r4, #0
	blt .L386
	b .L390
.L386:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L391
.L387:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L379
.L388:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L389:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L390:
	b .L387
.L391:
	ldr r4, [fp, #-4]
	cmp r4, #7
	movlt r4, #1
	movge r4, #0
	blt .L392
	b .L396
.L392:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	add r6, r4, r5
	ldr r4, [fp, #-16]
	add r5, r6, r4
	ldr r4, [fp, #-4]
	add r6, r5, r4
	ldr r4, [fp, #-28]
	ldr r5, addr_arr21
	ldr r7, =10752
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	ldr r4, [fp, #-24]
	ldr r7, =5376
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [fp, #-20]
	ldr r7, =1792
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-16]
	ldr r8, =896
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [fp, #-12]
	mov r7, #224
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-8]
	mov r7, #28
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	str r6, [r5]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L391
	b .F1
.LTORG
addr_arr11:
	.word arr1
addr_arr21:
	.word arr2
.F1:
.L393:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L385
.L394:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L395:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L396:
	b .L393

	.global loop3
	.type loop3 , %function
loop3:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #60
.L404:
	str r0, [fp, #-60]
	str r1, [fp, #-56]
	str r2, [fp, #-52]
	str r3, [fp, #-48]
	ldr r3, [fp, #32]
	str r3, [fp, #-44]
	ldr r3, [fp, #36]
	str r3, [fp, #-40]
	ldr r3, [fp, #40]
	str r3, [fp, #-36]
	ldr r10, =0
	str r10, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-32]
	b .L420
.L420:
	ldr r4, [fp, #-32]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L421
	b .L425
.L421:
	ldr r4, =0
	str r4, [fp, #-28]
	b .L426
.L422:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L425:
	b .L422
.L426:
	ldr r4, [fp, #-28]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L427
	b .L431
.L427:
	ldr r4, =0
	str r4, [fp, #-24]
	b .L432
.L428:
	ldr r4, [fp, #-32]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-32]
	ldr r4, [fp, #-32]
	ldr r5, [fp, #-60]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L512
	b .L516
.L431:
	b .L428
.L432:
	ldr r4, [fp, #-24]
	ldr r5, =1000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L433
	b .L437
.L433:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L438
.L434:
	ldr r4, [fp, #-28]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-28]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-56]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L506
	b .L510
.L437:
	b .L434
.L438:
	ldr r4, [fp, #-20]
	ldr r5, =10000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L439
	b .L443
.L439:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L444
.L440:
	ldr r4, [fp, #-24]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-24]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-52]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L500
	b .L504
.L443:
	b .L440
.L444:
	ldr r4, [fp, #-16]
	ldr r5, =100000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L445
	b .L449
.L445:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L450
.L446:
	ldr r4, [fp, #-20]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-20]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-48]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L494
	b .L498
.L449:
	b .L446
.L450:
	ldr r4, [fp, #-12]
	ldr r5, =1000000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L451
	b .L455
.L451:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L456
.L452:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-44]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L488
	b .L492
.L455:
	b .L452
.L456:
	ldr r4, [fp, #-8]
	ldr r5, =10000000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L457
	b .L461
.L457:
	ldr r4, [fp, #-4]
	ldr r5, =817
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	ldr r4, [fp, #-32]
	ldr r5, addr_arr12
	ldr r7, =5760
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	ldr r4, [fp, #-28]
	ldr r7, =2880
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [fp, #-24]
	ldr r7, =960
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-20]
	mov r7, #240
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [fp, #-16]
	mov r7, #48
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-12]
	mov r8, #8
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [fp, #-8]
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [r5]
	add r5, r6, r4
	ldr r4, [fp, #-32]
	ldr r6, addr_arr22
	ldr r7, =10752
	mul r8, r4, r7
	add r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-28]
	ldr r8, =5376
	mul r7, r4, r8
	add r4, r6, r7
	ldr r6, [fp, #-24]
	ldr r7, =1792
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [fp, #-20]
	ldr r7, =896
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [fp, #-16]
	mov r7, #224
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [fp, #-12]
	mov r7, #28
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	add r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-36]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L476
	b .L480
	b .F2
.LTORG
addr_arr12:
	.word arr1
addr_arr22:
	.word arr2
.F2:
.L458:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-40]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L482
	b .L486
.L461:
	b .L458
.L476:
	b .L458
.L477:
	b .L456
.L480:
	b .L477
.L481:
	b .L477
.L482:
	b .L452
.L483:
	b .L450
.L486:
	b .L483
.L487:
	b .L483
.L488:
	b .L446
.L489:
	b .L444
.L492:
	b .L489
.L493:
	b .L489
.L494:
	b .L440
.L495:
	b .L438
.L498:
	b .L495
.L499:
	b .L495
.L500:
	b .L434
.L501:
	b .L432
.L504:
	b .L501
.L505:
	b .L501
.L506:
	b .L428
.L507:
	b .L426
.L510:
	b .L507
.L511:
	b .L507
.L512:
	b .L422
.L513:
	b .L420
.L516:
	b .L513
.L517:
	b .L513

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #36
.L519:
	bl getint
	mov r10, r0
	str r10, [fp, #-36]
	bl getint
	mov r4, r0
	str r4, [fp, #-32]
	bl getint
	mov r4, r0
	str r4, [fp, #-28]
	bl getint
	mov r4, r0
	str r4, [fp, #-24]
	bl getint
	mov r4, r0
	str r4, [fp, #-20]
	bl getint
	mov r4, r0
	str r4, [fp, #-16]
	bl getint
	mov r4, r0
	str r4, [fp, #-12]
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-32]
	mov r0, r4
	mov r1, r5
	bl loop1
	bl loop2
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	ldr r7, [fp, #-16]
	ldr r8, [fp, #-12]
	ldr r9, [fp, #-8]
	ldr r10, [fp, #-4]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	push {r10}
	push {r9}
	push {r8}
	bl loop3
	add sp, sp, #12
	mov r4, r0
	mov r0, r4
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

addr_arr13:
	.word arr1
addr_arr23:
	.word arr2

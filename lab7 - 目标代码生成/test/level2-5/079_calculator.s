	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global intt
	.align 4
	.size intt, 4
intt:
	.word 0
	.global chat
	.align 4
	.size chat, 4
chat:
	.word 0
	.global i
	.align 4
	.size i, 4
i:
	.word 0
	.global ii
	.align 4
	.size ii, 4
ii:
	.word 1
	.global c
	.align 4
	.size c, 4
c:
	.word 0
	.comm ints, 40000, 4
	.comm chas, 40000, 4
	.comm get, 40000, 4
	.comm get2, 40000, 4
	.text
	.global isdigit
	.type isdigit , %function
isdigit:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L390:
	str r0, [fp, #-4]
	ldr r10, [fp, #-4]
	cmp r10, #48
	movge r4, #1
	movlt r4, #0
	bge .L394
	b .L397
.L392:
	mov r0, #1
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr
	b .L393
.L393:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr
.L394:
	ldr r4, [fp, #-4]
	cmp r4, #57
	movle r4, #1
	movgt r4, #0
	ble .L392
	b .L400
.L397:
	b .L393
.L400:
	b .L393

	.global power
	.type power , %function
power:
	push {r4, r5, r6, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L402:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	ldr r10, =1
	str r10, [fp, #-4]
	b .L406
.L406:
	ldr r4, [fp, #-8]
	cmp r4, #0
	bne .L407
	b .L411
.L407:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	mul r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-8]
	b .L406
.L408:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, r10, fp, lr}
	bx lr
.L411:
	b .L408

	.global getstr
	.type getstr , %function
getstr:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L413:
	str r0, [fp, #-12]
	bl getch
	mov r10, r0
	str r10, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L417
.L417:
	ldr r4, [fp, #-8]
	cmp r4, #13
	bne .L420
	b .L423
.L418:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	bl getch
	mov r4, r0
	str r4, [fp, #-8]
	b .L417
.L419:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L420:
	ldr r4, [fp, #-8]
	cmp r4, #10
	bne .L418
	b .L426
.L423:
	b .L419
.L426:
	b .L419

	.global intpush
	.type intpush , %function
intpush:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L429:
	str r0, [fp, #-4]
	ldr r10, addr_intt0
	ldr r9, [r10]
	ldr r4, =1
	add r5, r9, r4
	ldr r4, addr_intt0
	str r5, [r4]
	ldr r4, [fp, #-4]
	ldr r5, addr_intt0
	ldr r6, [r5]
	ldr r5, addr_ints0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, r6
	str r4, [r5]
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	.global chapush
	.type chapush , %function
chapush:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L432:
	str r0, [fp, #-4]
	ldr r10, addr_chat0
	ldr r9, [r10]
	ldr r4, =1
	add r5, r9, r4
	ldr r4, addr_chat0
	str r5, [r4]
	ldr r4, [fp, #-4]
	ldr r5, addr_chat0
	ldr r6, [r5]
	ldr r5, addr_chas0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, r6
	str r4, [r5]
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	.global intpop
	.type intpop , %function
intpop:
	push {r4, r5, r6, r7, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L435:
	ldr r10, addr_intt0
	ldr r9, [r10]
	ldr r4, =1
	sub r5, r9, r4
	ldr r4, addr_intt0
	str r5, [r4]
	ldr r4, addr_intt0
	ldr r5, [r4]
	ldr r4, =1
	add r6, r5, r4
	ldr r4, addr_ints0
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #0
	pop {r4, r5, r6, r7, r9, r10, fp, lr}
	bx lr

	.global chapop
	.type chapop , %function
chapop:
	push {r4, r5, r6, r7, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L438:
	ldr r10, addr_chat0
	ldr r9, [r10]
	ldr r4, =1
	sub r5, r9, r4
	ldr r4, addr_chat0
	str r5, [r4]
	ldr r4, addr_chat0
	ldr r5, [r4]
	ldr r4, =1
	add r6, r5, r4
	ldr r4, addr_chas0
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #0
	pop {r4, r5, r6, r7, r9, r10, fp, lr}
	bx lr

	.global intadd
	.type intadd , %function
intadd:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L441:
	str r0, [fp, #-4]
	ldr r10, addr_intt0
	ldr r9, [r10]
	ldr r4, addr_ints0
	mov r5, #4
	mul r6, r9, r5
	add r5, r4, r6
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =10
	mul r6, r5, r4
	ldr r4, addr_intt0
	ldr r5, [r4]
	ldr r4, addr_ints0
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, r5
	str r6, [r4]
	ldr r4, addr_intt0
	ldr r5, [r4]
	ldr r4, addr_ints0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	add r6, r5, r4
	ldr r4, addr_intt0
	ldr r5, [r4]
	ldr r4, addr_ints0
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, r5
	str r6, [r4]
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	.global find
	.type find , %function
find:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L446:
	bl chapop
	mov r10, r0
	ldr r9, addr_c0
	str r10, [r9]
	ldr r4, addr_ii0
	ldr r5, [r4]
	ldr r4, addr_get20
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, =32
	str r5, [r4]
	ldr r4, addr_c0
	ldr r5, [r4]
	ldr r4, addr_ii0
	ldr r6, [r4]
	ldr r4, =1
	add r7, r6, r4
	ldr r4, addr_get20
	mov r6, #4
	mul r8, r7, r6
	add r6, r4, r8
	mov r4, r6
	str r5, [r4]
	ldr r4, addr_ii0
	ldr r5, [r4]
	ldr r4, =2
	add r6, r5, r4
	ldr r4, addr_ii0
	str r6, [r4]
	ldr r4, addr_chat0
	ldr r5, [r4]
	cmp r5, #0
	beq .L447
	b .L451
.L447:
	mov r0, #0
	add sp, sp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .L448
.L448:
	mov r0, #1
	add sp, sp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L451:
	b .L448

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L453:
	ldr r10, =0
	ldr r9, addr_intt0
	str r10, [r9]
	ldr r4, =0
	ldr r5, addr_chat0
	str r4, [r5]
	mov r4, #0
	ldr r5, addr_get0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	mov r0, r5
	bl getstr
	mov r4, r0
	str r4, [fp, #-20]
	b .L455
.L455:
	ldr r4, addr_i0
	ldr r5, [r4]
	ldr r4, [fp, #-20]
	cmp r5, r4
	movlt r4, #1
	movge r4, #0
	blt .L456
	b .L460
.L456:
	ldr r4, addr_i0
	ldr r5, [r4]
	ldr r4, addr_get0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	mov r0, r5
	bl isdigit
	mov r4, r0
	cmp r4, #1
	beq .L461
	b .L467
.L457:
	b .L683
.L460:
	b .L457
.L461:
	ldr r4, addr_i0
	ldr r5, [r4]
	ldr r4, addr_get0
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	mov r4, r5
	ldr r5, [r4]
	ldr r4, addr_ii0
	ldr r6, [r4]
	ldr r4, addr_get20
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, r6
	str r5, [r4]
	ldr r4, addr_ii0
	ldr r5, [r4]
	ldr r4, =1
	add r6, r5, r4
	ldr r4, addr_ii0
	str r6, [r4]
	b .L463
.L462:
	ldr r4, addr_i0
	ldr r5, [r4]
	ldr r4, addr_get0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #40
	beq .L469
	b .L474
.L463:
	ldr r4, addr_i0
	ldr r5, [r4]
	ldr r4, =1
	add r6, r5, r4
	ldr r4, addr_i0
	str r6, [r4]
	b .L455
.L467:
	b .L462
.L469:
	mov r0, #40
	bl chapush
	b .L470
.L470:
	ldr r4, addr_i0
	ldr r5, [r4]
	ldr r4, addr_get0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #94
	beq .L475
	b .L480
.L474:
	b .L470
.L475:
	mov r0, #94
	bl chapush
	b .L476
.L476:
	ldr r4, addr_i0
	ldr r5, [r4]
	ldr r4, addr_get0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #41
	beq .L481
	b .L486
.L480:
	b .L476
.L481:
	bl chapop
	mov r4, r0
	ldr r5, addr_c0
	str r4, [r5]
	b .L487
.L482:
	ldr r4, addr_i0
	ldr r5, [r4]
	ldr r4, addr_get0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #43
	beq .L493
	b .L498
.L486:
	b .L482
.L487:
	ldr r4, addr_c0
	ldr r5, [r4]
	cmp r5, #40
	bne .L488
	b .L492
.L488:
	ldr r4, addr_ii0
	ldr r5, [r4]
	ldr r4, addr_get20
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, =32
	str r5, [r4]
	ldr r4, addr_c0
	ldr r5, [r4]
	ldr r4, addr_ii0
	ldr r6, [r4]
	ldr r4, =1
	add r7, r6, r4
	ldr r4, addr_get20
	mov r6, #4
	mul r8, r7, r6
	add r6, r4, r8
	mov r4, r6
	str r5, [r4]
	ldr r4, addr_ii0
	ldr r5, [r4]
	ldr r4, =2
	add r6, r5, r4
	ldr r4, addr_ii0
	str r6, [r4]
	bl chapop
	mov r4, r0
	ldr r5, addr_c0
	str r4, [r5]
	b .L487
	b .F0
.LTORG
addr_ints0:
	.word ints
addr_intt0:
	.word intt
addr_chas0:
	.word chas
addr_chat0:
	.word chat
addr_i0:
	.word i
addr_ii0:
	.word ii
addr_c0:
	.word c
addr_get0:
	.word get
addr_get20:
	.word get2
.F0:
.L489:
	b .L482
.L492:
	b .L489
.L493:
	b .L499
.L494:
	ldr r4, addr_i1
	ldr r5, [r4]
	ldr r4, addr_get1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #45
	beq .L537
	b .L542
.L498:
	b .L494
.L499:
	ldr r4, addr_chat1
	ldr r5, [r4]
	ldr r4, addr_chas1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #43
	beq .L500
	b .L510
.L500:
	bl find
	mov r4, r0
	cmp r4, #0
	beq .L531
	b .L535
.L501:
	mov r0, #43
	bl chapush
	b .L494
.L502:
	ldr r4, addr_chat1
	ldr r5, [r4]
	ldr r4, addr_chas1
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #94
	beq .L500
	b .L530
.L503:
	ldr r4, addr_chat1
	ldr r5, [r4]
	ldr r4, addr_chas1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #37
	beq .L500
	b .L526
.L504:
	ldr r4, addr_chat1
	ldr r5, [r4]
	ldr r4, addr_chas1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #47
	beq .L500
	b .L522
.L505:
	ldr r4, addr_chat1
	ldr r5, [r4]
	ldr r4, addr_chas1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #42
	beq .L500
	b .L518
.L506:
	ldr r4, addr_chat1
	ldr r5, [r4]
	ldr r4, addr_chas1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #45
	beq .L500
	b .L514
.L510:
	b .L506
.L514:
	b .L505
.L518:
	b .L504
.L522:
	b .L503
.L526:
	b .L502
.L530:
	b .L501
.L531:
	b .L501
.L532:
	b .L499
.L535:
	b .L532
.L536:
	b .L532
.L537:
	b .L543
.L538:
	ldr r4, addr_i1
	ldr r5, [r4]
	ldr r4, addr_get1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #42
	beq .L581
	b .L586
.L542:
	b .L538
.L543:
	ldr r4, addr_chat1
	ldr r5, [r4]
	ldr r4, addr_chas1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #43
	beq .L544
	b .L554
.L544:
	bl find
	mov r4, r0
	cmp r4, #0
	beq .L575
	b .L579
.L545:
	mov r0, #45
	bl chapush
	b .L538
.L546:
	ldr r4, addr_chat1
	ldr r5, [r4]
	ldr r4, addr_chas1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #94
	beq .L544
	b .L574
.L547:
	ldr r4, addr_chat1
	ldr r5, [r4]
	ldr r4, addr_chas1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #37
	beq .L544
	b .L570
.L548:
	ldr r4, addr_chat1
	ldr r5, [r4]
	ldr r4, addr_chas1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #47
	beq .L544
	b .L566
	b .F1
.LTORG
addr_ints1:
	.word ints
addr_intt1:
	.word intt
addr_chas1:
	.word chas
addr_chat1:
	.word chat
addr_i1:
	.word i
addr_ii1:
	.word ii
addr_c1:
	.word c
addr_get1:
	.word get
addr_get21:
	.word get2
.F1:
.L549:
	ldr r4, addr_chat2
	ldr r5, [r4]
	ldr r4, addr_chas2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #42
	beq .L544
	b .L562
.L550:
	ldr r4, addr_chat2
	ldr r5, [r4]
	ldr r4, addr_chas2
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #45
	beq .L544
	b .L558
.L554:
	b .L550
.L558:
	b .L549
.L562:
	b .L548
.L566:
	b .L547
.L570:
	b .L546
.L574:
	b .L545
.L575:
	b .L545
.L576:
	b .L543
.L579:
	b .L576
.L580:
	b .L576
.L581:
	b .L587
.L582:
	ldr r4, addr_i2
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #47
	beq .L615
	b .L620
.L586:
	b .L582
.L587:
	ldr r4, addr_chat2
	ldr r5, [r4]
	ldr r4, addr_chas2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #42
	beq .L588
	b .L596
.L588:
	bl find
	mov r4, r0
	cmp r4, #0
	beq .L609
	b .L613
.L589:
	mov r0, #42
	bl chapush
	b .L582
.L590:
	ldr r4, addr_chat2
	ldr r5, [r4]
	ldr r4, addr_chas2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #94
	beq .L588
	b .L608
.L591:
	ldr r4, addr_chat2
	ldr r5, [r4]
	ldr r4, addr_chas2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #37
	beq .L588
	b .L604
.L592:
	ldr r4, addr_chat2
	ldr r5, [r4]
	ldr r4, addr_chas2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #47
	beq .L588
	b .L600
.L596:
	b .L592
.L600:
	b .L591
.L604:
	b .L590
.L608:
	b .L589
.L609:
	b .L589
.L610:
	b .L587
.L613:
	b .L610
.L614:
	b .L610
.L615:
	b .L621
.L616:
	ldr r4, addr_i2
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #37
	beq .L649
	b .L654
.L620:
	b .L616
.L621:
	ldr r4, addr_chat2
	ldr r5, [r4]
	ldr r4, addr_chas2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #42
	beq .L622
	b .L630
.L622:
	bl find
	mov r4, r0
	cmp r4, #0
	beq .L643
	b .L647
.L623:
	mov r0, #47
	bl chapush
	b .L616
.L624:
	ldr r4, addr_chat2
	ldr r5, [r4]
	ldr r4, addr_chas2
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #94
	beq .L622
	b .L642
.L625:
	ldr r4, addr_chat2
	ldr r5, [r4]
	ldr r4, addr_chas2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #37
	beq .L622
	b .L638
.L626:
	ldr r4, addr_chat2
	ldr r5, [r4]
	ldr r4, addr_chas2
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #47
	beq .L622
	b .L634
	b .F2
.LTORG
addr_ints2:
	.word ints
addr_intt2:
	.word intt
addr_chas2:
	.word chas
addr_chat2:
	.word chat
addr_i2:
	.word i
addr_ii2:
	.word ii
addr_c2:
	.word c
addr_get2:
	.word get
addr_get22:
	.word get2
.F2:
.L630:
	b .L626
.L634:
	b .L625
.L638:
	b .L624
.L642:
	b .L623
.L643:
	b .L623
.L644:
	b .L621
.L647:
	b .L644
.L648:
	b .L644
.L649:
	b .L655
.L650:
	ldr r4, addr_ii3
	ldr r5, [r4]
	ldr r4, addr_get23
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	mov r4, r5
	ldr r5, =32
	str r5, [r4]
	ldr r4, addr_ii3
	ldr r5, [r4]
	ldr r4, =1
	add r6, r5, r4
	ldr r4, addr_ii3
	str r6, [r4]
	b .L463
.L654:
	b .L650
.L655:
	ldr r4, addr_chat3
	ldr r5, [r4]
	ldr r4, addr_chas3
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #42
	beq .L656
	b .L664
.L656:
	bl find
	mov r4, r0
	cmp r4, #0
	beq .L677
	b .L681
.L657:
	mov r0, #37
	bl chapush
	b .L650
.L658:
	ldr r4, addr_chat3
	ldr r5, [r4]
	ldr r4, addr_chas3
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #94
	beq .L656
	b .L676
.L659:
	ldr r4, addr_chat3
	ldr r5, [r4]
	ldr r4, addr_chas3
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #37
	beq .L656
	b .L672
.L660:
	ldr r4, addr_chat3
	ldr r5, [r4]
	ldr r4, addr_chas3
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #47
	beq .L656
	b .L668
.L664:
	b .L660
.L668:
	b .L659
.L672:
	b .L658
.L676:
	b .L657
.L677:
	b .L657
.L678:
	b .L655
.L681:
	b .L678
.L682:
	b .L678
.L683:
	ldr r4, addr_chat3
	ldr r5, [r4]
	cmp r5, #0
	movgt r4, #1
	movle r4, #0
	bgt .L684
	b .L688
.L684:
	bl chapop
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, addr_ii3
	ldr r5, [r4]
	ldr r4, addr_get23
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, =32
	str r5, [r4]
	ldr r4, [fp, #-16]
	ldr r5, addr_ii3
	ldr r6, [r5]
	ldr r5, =1
	add r7, r6, r5
	ldr r5, addr_get23
	mov r6, #4
	mul r8, r7, r6
	add r6, r5, r8
	mov r5, r6
	str r4, [r5]
	ldr r4, addr_ii3
	ldr r5, [r4]
	ldr r4, =2
	add r6, r5, r4
	ldr r4, addr_ii3
	str r6, [r4]
	b .L683
.L685:
	ldr r4, addr_ii3
	ldr r5, [r4]
	ldr r4, addr_get23
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, =64
	str r5, [r4]
	ldr r4, =1
	ldr r5, addr_i3
	str r4, [r5]
	b .L690
.L688:
	b .L685
.L690:
	ldr r4, addr_i3
	ldr r5, [r4]
	ldr r4, addr_get23
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #64
	bne .L691
	b .L696
.L691:
	ldr r4, addr_i3
	ldr r5, [r4]
	ldr r4, addr_get23
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #43
	beq .L697
	b .L708
.L692:
	mov r4, #1
	ldr r5, addr_ints3
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .F3
.LTORG
addr_ints3:
	.word ints
addr_intt3:
	.word intt
addr_chas3:
	.word chas
addr_chat3:
	.word chat
addr_i3:
	.word i
addr_ii3:
	.word ii
addr_c3:
	.word c
addr_get3:
	.word get
addr_get23:
	.word get2
.F3:
.L696:
	b .L692
.L697:
	bl intpop
	mov r4, r0
	str r4, [fp, #-12]
	bl intpop
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, addr_get24
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #43
	beq .L732
	b .L737
.L698:
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, addr_get24
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #32
	bne .L768
	b .L773
.L699:
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, =1
	add r6, r5, r4
	ldr r4, addr_i4
	str r6, [r4]
	b .L690
.L700:
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, addr_get24
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #94
	beq .L697
	b .L728
.L701:
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, addr_get24
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #37
	beq .L697
	b .L724
.L702:
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, addr_get24
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #47
	beq .L697
	b .L720
.L703:
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, addr_get24
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #42
	beq .L697
	b .L716
.L704:
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, addr_get24
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #45
	beq .L697
	b .L712
.L708:
	b .L704
.L712:
	b .L703
.L716:
	b .L702
.L720:
	b .L701
.L724:
	b .L700
.L728:
	b .L698
.L732:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L733
.L733:
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, addr_get24
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #45
	beq .L738
	b .L743
.L737:
	b .L733
.L738:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L739
.L739:
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, addr_get24
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #42
	beq .L744
	b .L749
.L743:
	b .L739
.L744:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	mul r6, r4, r5
	str r6, [fp, #-4]
	b .L745
.L745:
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, addr_get24
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #47
	beq .L750
	b .L755
.L749:
	b .L745
.L750:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sdiv r6, r4, r5
	str r6, [fp, #-4]
	b .L751
.L751:
	ldr r4, addr_i4
	ldr r5, [r4]
	ldr r4, addr_get24
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #37
	beq .L756
	b .L761
	b .F4
.LTORG
addr_ints4:
	.word ints
addr_intt4:
	.word intt
addr_chas4:
	.word chas
addr_chat4:
	.word chat
addr_i4:
	.word i
addr_ii4:
	.word ii
addr_c4:
	.word c
addr_get4:
	.word get
addr_get24:
	.word get2
.F4:
.L755:
	b .L751
.L756:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L757
.L757:
	ldr r4, addr_i5
	ldr r5, [r4]
	ldr r4, addr_get25
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #94
	beq .L762
	b .L767
.L761:
	b .L757
.L762:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	mov r0, r4
	mov r1, r5
	bl power
	mov r4, r0
	str r4, [fp, #-4]
	b .L763
.L763:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl intpush
	b .L699
.L767:
	b .L763
.L768:
	ldr r4, addr_i5
	ldr r5, [r4]
	ldr r4, addr_get25
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =48
	sub r6, r5, r4
	mov r0, r6
	bl intpush
	ldr r4, =1
	ldr r5, addr_ii5
	str r4, [r5]
	b .L775
.L769:
	b .L699
.L773:
	b .L769
.L775:
	ldr r4, addr_i5
	ldr r5, [r4]
	ldr r4, addr_ii5
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_get25
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #32
	bne .L776
	b .L781
.L776:
	ldr r4, addr_i5
	ldr r5, [r4]
	ldr r4, addr_ii5
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_get25
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =48
	sub r6, r4, r5
	mov r0, r6
	bl intadd
	ldr r4, addr_ii5
	ldr r5, [r4]
	ldr r4, =1
	add r6, r5, r4
	ldr r4, addr_ii5
	str r6, [r4]
	b .L775
.L777:
	ldr r4, addr_i5
	ldr r5, [r4]
	ldr r4, addr_ii5
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, =1
	sub r6, r4, r5
	ldr r4, addr_i5
	str r6, [r4]
	b .L769
.L781:
	b .L777

addr_ints5:
	.word ints
addr_intt5:
	.word intt
addr_chas5:
	.word chas
addr_chat5:
	.word chat
addr_i5:
	.word i
addr_ii5:
	.word ii
addr_c5:
	.word c
addr_get5:
	.word get
addr_get25:
	.word get2

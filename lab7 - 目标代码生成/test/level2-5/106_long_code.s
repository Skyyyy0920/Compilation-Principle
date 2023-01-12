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
	.global bubblesort
	.type bubblesort , %function
bubblesort:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L531:
	str r0, [fp, #-16]
	ldr r10, =0
	str r10, [fp, #-12]
	b .L535
.L535:
	ldr r4, [fp, #-12]
	ldr r5, addr_n0
	ldr r6, [r5]
	ldr r5, =1
	sub r7, r6, r5
	cmp r4, r7
	movlt r4, #1
	movge r4, #0
	blt .L536
	b .L540
.L536:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L541
.L537:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L540:
	b .L537
.L541:
	ldr r4, [fp, #-8]
	ldr r5, addr_n0
	ldr r6, [r5]
	ldr r5, [fp, #-12]
	sub r7, r6, r5
	ldr r5, =1
	sub r6, r7, r5
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L542
	b .L546
.L542:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	ldr r7, =1
	add r8, r6, r7
	mov r6, #4
	mul r7, r8, r6
	add r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L547
	b .L555
.L543:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L535
.L546:
	b .L543
.L547:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	ldr r6, =1
	add r7, r5, r6
	mov r5, #4
	mul r6, r7, r5
	add r5, r4, r6
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	ldr r7, =1
	add r8, r6, r7
	mov r6, #4
	mul r7, r8, r6
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	b .L548
.L548:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L541
.L555:
	b .L548

	.global insertsort
	.type insertsort , %function
insertsort:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L564:
	str r0, [fp, #-16]
	ldr r10, =1
	str r10, [fp, #-12]
	b .L567
.L567:
	ldr r4, [fp, #-12]
	ldr r5, addr_n0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L568
	b .L572
.L568:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L577
.L569:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L572:
	b .L569
.L577:
	ldr r4, [fp, #-4]
	ldr r5, =0
	ldr r6, =1
	sub r7, r5, r6
	cmp r4, r7
	movgt r4, #1
	movle r4, #0
	bgt .L580
	b .L583
.L578:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	ldr r7, =1
	add r8, r6, r7
	mov r6, #4
	mul r7, r8, r6
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L577
.L579:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	ldr r7, =1
	add r8, r6, r7
	mov r6, #4
	mul r7, r8, r6
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-12]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L567
.L580:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L578
	b .L588
.L583:
	b .L579
.L588:
	b .L579

	.global QuickSort
	.type QuickSort , %function
QuickSort:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #28
.L594:
	str r0, [fp, #-28]
	str r1, [fp, #-24]
	str r2, [fp, #-20]
	ldr r10, [fp, #-24]
	ldr r9, [fp, #-20]
	cmp r10, r9
	movlt r4, #1
	movge r4, #0
	blt .L598
	b .L602
.L598:
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
	b .L608
.L599:
	mov r0, #0
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L602:
	b .L599
.L608:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L609
	b .L613
.L609:
	b .L614
.L610:
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
	b .L599
.L613:
	b .L610
.L614:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L617
	b .L620
.L615:
	ldr r4, [fp, #-12]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-12]
	b .L614
.L616:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L626
	b .L630
.L617:
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
	bgt .L615
	b .L625
.L620:
	b .L616
.L625:
	b .L616
.L626:
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
	b .L627
.L627:
	b .L634
.L630:
	b .L627
.L634:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L637
	b .L640
.L635:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	b .L634
.L636:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L646
	b .L650
.L637:
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
	blt .L635
	b .L645
.L640:
	b .L636
.L645:
	b .L636
.L646:
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
	b .L647
	b .F0
.LTORG
addr_n0:
	.word n
.F0:
.L647:
	b .L608
.L650:
	b .L647

	.global getMid
	.type getMid , %function
getMid:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L659:
	str r0, [fp, #-8]
	ldr r10, addr_n1
	ldr r9, [r10]
	ldr r4, =2
	sdiv r5, r9, r4
	mul r4, r5, r4
	sub r5, r9, r4
	cmp r5, #0
	beq .L662
	b .L667
.L662:
	ldr r4, addr_n1
	ldr r5, [r4]
	ldr r4, =2
	sdiv r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	ldr r7, =1
	sub r8, r6, r7
	mov r6, #4
	mul r7, r8, r6
	add r6, r5, r7
	ldr r5, [r6]
	add r6, r4, r5
	ldr r4, =2
	sdiv r5, r6, r4
	mov r0, r5
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .L664
.L663:
	ldr r4, addr_n1
	ldr r5, [r4]
	ldr r4, =2
	sdiv r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .L664
.L664:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L667:
	b .L663

	.global getMost
	.type getMost , %function
getMost:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	ldr r4, =4020
	sub sp, sp, r4
.L675:
	ldr r10, =-4020
	str r0, [fp, r10]
	ldr r4, =0
	str r4, [fp, #-16]
	b .L679
.L679:
	ldr r4, [fp, #-16]
	ldr r5, =1000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L680
	b .L684
.L680:
	ldr r4, [fp, #-16]
	ldr r5, =-4016
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	b .L679
.L681:
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	b .L687
.L684:
	b .L681
.L687:
	ldr r4, [fp, #-16]
	ldr r5, addr_n1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L688
	b .L692
.L688:
	ldr r5, =-4020
	ldr r4, [fp, r5]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =-4016
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, [r5]
	ldr r5, =1
	add r6, r4, r5
	ldr r4, [fp, #-4]
	ldr r5, =-4016
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	add r5, fp, r4
	str r6, [r5]
	ldr r4, [fp, #-4]
	ldr r5, =-4016
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L697
	b .L702
.L689:
	ldr r4, [fp, #-8]
	mov r0, r4
	ldr r1, =4020
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L692:
	b .L689
.L697:
	ldr r4, [fp, #-4]
	ldr r5, =-4016
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	b .L698
.L698:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-16]
	b .L687
.L702:
	b .L698

	.global revert
	.type revert , %function
revert:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L705:
	str r0, [fp, #-16]
	ldr r10, =0
	str r10, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L710
.L710:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L711
	b .L715
.L711:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L710
.L712:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L715:
	b .L712

	.global arrCopy
	.type arrCopy , %function
arrCopy:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L723:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	ldr r10, =0
	str r10, [fp, #-4]
	b .L727
.L727:
	ldr r4, [fp, #-4]
	ldr r5, addr_n1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L728
	b .L732
.L728:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L727
.L729:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L732:
	b .L729

	.global calSum
	.type calSum , %function
calSum:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L737:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r10, =0
	str r10, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L742
.L742:
	ldr r4, [fp, #-4]
	ldr r5, addr_n1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L743
	b .L747
.L743:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	ldr r5, [r6]
	add r6, r4, r5
	str r6, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	ldr r4, [fp, #-12]
	ldr r5, =1
	sub r7, r4, r5
	cmp r6, r7
	bne .L750
	b .L755
.L744:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L747:
	b .L744
.L750:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, =0
	str r4, [r5]
	b .L752
.L751:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L752
.L752:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L742
.L755:
	b .L751

	.global avgPooling
	.type avgPooling , %function
avgPooling:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L759:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r10, =0
	str r10, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-12]
	b .L765
.L765:
	ldr r4, [fp, #-8]
	ldr r5, addr_n1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L766
	b .L770
.L766:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	ldr r6, =1
	sub r7, r5, r6
	cmp r4, r7
	movlt r4, #1
	movge r4, #0
	blt .L771
	b .L776
.L767:
	ldr r4, addr_n1
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	sub r6, r5, r4
	ldr r4, =1
	add r5, r6, r4
	str r5, [fp, #-8]
	b .L793
.L770:
	b .L767
.L771:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-8]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	ldr r5, [r6]
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L773
.L772:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	ldr r6, =1
	sub r7, r5, r6
	cmp r4, r7
	beq .L779
	b .L784
.L773:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L765
.L776:
	b .L772
.L779:
	ldr r4, [fp, #-20]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	sdiv r6, r4, r5
	ldr r4, [fp, #-20]
	mov r5, #0
	mov r8, #4
	mul r7, r5, r8
	add r5, r4, r7
	str r6, [r5]
	b .L781
.L780:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r6, r4, r5
	ldr r4, [fp, #-4]
	sub r5, r6, r4
	str r5, [fp, #-12]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-16]
	sub r7, r5, r6
	ldr r5, =1
	add r6, r7, r5
	mov r5, #4
	mul r7, r6, r5
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	sdiv r6, r4, r5
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	ldr r7, [fp, #-16]
	sub r8, r5, r7
	ldr r5, =1
	add r7, r8, r5
	mov r5, #4
	mul r8, r7, r5
	add r5, r4, r8
	str r6, [r5]
	b .L781
.L781:
	b .L773
.L784:
	b .L780
.L793:
	ldr r4, [fp, #-8]
	ldr r5, addr_n1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L794
	b .L798
.L794:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L793
.L795:
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L798:
	b .L795

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	ldr r4, =264
	sub sp, sp, r4
.L801:
	ldr r10, =32
	ldr r9, addr_n1
	str r10, [r9]
	mov r4, #0
	ldr r5, =-264
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #1
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =23
	str r4, [r5]
	mov r4, #2
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =89
	str r4, [r5]
	mov r4, #3
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =26
	str r4, [r5]
	mov r4, #4
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =282
	str r4, [r5]
	mov r4, #5
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =254
	str r4, [r5]
	mov r4, #6
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =27
	str r4, [r5]
	mov r4, #7
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =83
	str r4, [r5]
	mov r4, #9
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =273
	str r4, [r5]
	mov r4, #10
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =574
	str r4, [r5]
	mov r4, #11
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =905
	str r4, [r5]
	mov r4, #12
	ldr r5, =-264
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =354
	str r4, [r5]
	mov r4, #13
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =657
	str r4, [r5]
	mov r4, #14
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =935
	str r4, [r5]
	mov r4, #15
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =264
	str r4, [r5]
	mov r4, #16
	ldr r5, =-264
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =639
	str r4, [r5]
	mov r4, #17
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =459
	str r4, [r5]
	mov r4, #18
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =29
	str r4, [r5]
	mov r4, #19
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =68
	str r4, [r5]
	mov r4, #20
	ldr r5, =-264
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	ldr r4, =929
	str r4, [r5]
	mov r4, #21
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =756
	str r4, [r5]
	mov r4, #22
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =452
	str r4, [r5]
	mov r4, #23
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =279
	str r4, [r5]
	mov r4, #24
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =58
	str r4, [r5]
	mov r4, #25
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =87
	str r4, [r5]
	mov r4, #26
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =96
	str r4, [r5]
	mov r4, #27
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =36
	str r4, [r5]
	mov r4, #28
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =39
	str r4, [r5]
	mov r4, #29
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =28
	str r4, [r5]
	mov r4, #30
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #31
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, =290
	str r4, [r5]
	mov r4, #0
	ldr r5, =-264
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	mov r4, #0
	mov r6, #-136
	mov r8, #4
	mul r7, r4, r8
	add r4, r6, r7
	add r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl revert
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L806
	b .F1
.LTORG
addr_n1:
	.word n
.F1:
.L806:
	ldr r4, [fp, #-4]
	cmp r4, #32
	movlt r4, #1
	movge r4, #0
	blt .L807
	b .L811
.L807:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L806
.L808:
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl bubblesort
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L813
.L811:
	b .L808
.L813:
	ldr r4, [fp, #-4]
	cmp r4, #32
	movlt r4, #1
	movge r4, #0
	blt .L814
	b .L818
.L814:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L813
.L815:
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl getMid
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl getMost
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	mov r4, #0
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r4, #0
	mov r6, #-136
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl bubblesort
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L820
.L818:
	b .L815
.L820:
	ldr r4, [fp, #-4]
	cmp r4, #32
	movlt r4, #1
	movge r4, #0
	blt .L821
	b .L825
.L821:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L820
.L822:
	mov r4, #0
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r4, #0
	mov r6, #-136
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl insertsort
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L827
	b .F2
.LTORG
addr_n2:
	.word n
.F2:
.L825:
	b .L822
.L827:
	ldr r4, [fp, #-4]
	cmp r4, #32
	movlt r4, #1
	movge r4, #0
	blt .L828
	b .L832
.L828:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L827
.L829:
	mov r4, #0
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r4, #0
	mov r6, #-136
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =31
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [fp, #-4]
	ldr r6, [fp, #-8]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl QuickSort
	mov r4, r0
	str r4, [fp, #-8]
	b .L834
.L832:
	b .L829
.L834:
	ldr r4, [fp, #-4]
	cmp r4, #32
	movlt r4, #1
	movge r4, #0
	blt .L835
	b .L839
.L835:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L834
.L836:
	mov r4, #0
	ldr r5, =-264
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r4, #0
	mov r6, #-136
	mov r8, #4
	mul r7, r4, r8
	add r4, r6, r7
	add r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	mov r1, #4
	bl calSum
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L841
.L839:
	b .L836
.L841:
	ldr r4, [fp, #-4]
	cmp r4, #32
	movlt r4, #1
	movge r4, #0
	blt .L842
	b .L846
.L842:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L841
.L843:
	mov r4, #0
	ldr r5, =-264
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	mov r4, #0
	mov r6, #-136
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	mov r1, #3
	bl avgPooling
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L848
	b .F3
.LTORG
addr_n3:
	.word n
.F3:
.L846:
	b .L843
.L848:
	ldr r4, [fp, #-4]
	cmp r4, #32
	movlt r4, #1
	movge r4, #0
	blt .L849
	b .L853
.L849:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L848
.L850:
	mov r0, #0
	ldr r1, =264
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L853:
	b .L850

addr_n4:
	.word n

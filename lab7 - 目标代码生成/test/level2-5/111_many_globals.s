	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a0
	.align 4
	.size a0, 4
a0:
	.word 0
	.global a1
	.align 4
	.size a1, 4
a1:
	.word 0
	.global a2
	.align 4
	.size a2, 4
a2:
	.word 0
	.global a3
	.align 4
	.size a3, 4
a3:
	.word 0
	.global a4
	.align 4
	.size a4, 4
a4:
	.word 0
	.global a5
	.align 4
	.size a5, 4
a5:
	.word 0
	.global a6
	.align 4
	.size a6, 4
a6:
	.word 0
	.global a7
	.align 4
	.size a7, 4
a7:
	.word 0
	.global a8
	.align 4
	.size a8, 4
a8:
	.word 0
	.global a9
	.align 4
	.size a9, 4
a9:
	.word 0
	.global a10
	.align 4
	.size a10, 4
a10:
	.word 0
	.global a11
	.align 4
	.size a11, 4
a11:
	.word 0
	.global a12
	.align 4
	.size a12, 4
a12:
	.word 0
	.global a13
	.align 4
	.size a13, 4
a13:
	.word 0
	.global a14
	.align 4
	.size a14, 4
a14:
	.word 0
	.global a15
	.align 4
	.size a15, 4
a15:
	.word 0
	.global a16
	.align 4
	.size a16, 4
a16:
	.word 0
	.global a17
	.align 4
	.size a17, 4
a17:
	.word 0
	.global a18
	.align 4
	.size a18, 4
a18:
	.word 0
	.global a19
	.align 4
	.size a19, 4
a19:
	.word 0
	.global a20
	.align 4
	.size a20, 4
a20:
	.word 0
	.global a21
	.align 4
	.size a21, 4
a21:
	.word 0
	.global a22
	.align 4
	.size a22, 4
a22:
	.word 0
	.global a23
	.align 4
	.size a23, 4
a23:
	.word 0
	.global a24
	.align 4
	.size a24, 4
a24:
	.word 0
	.global a25
	.align 4
	.size a25, 4
a25:
	.word 0
	.global a26
	.align 4
	.size a26, 4
a26:
	.word 0
	.global a27
	.align 4
	.size a27, 4
a27:
	.word 0
	.global a28
	.align 4
	.size a28, 4
a28:
	.word 0
	.global a29
	.align 4
	.size a29, 4
a29:
	.word 0
	.global a30
	.align 4
	.size a30, 4
a30:
	.word 0
	.global a31
	.align 4
	.size a31, 4
a31:
	.word 0
	.global a32
	.align 4
	.size a32, 4
a32:
	.word 0
	.global a33
	.align 4
	.size a33, 4
a33:
	.word 0
	.global a34
	.align 4
	.size a34, 4
a34:
	.word 0
	.global a35
	.align 4
	.size a35, 4
a35:
	.word 0
	.global a36
	.align 4
	.size a36, 4
a36:
	.word 0
	.global a37
	.align 4
	.size a37, 4
a37:
	.word 0
	.global a38
	.align 4
	.size a38, 4
a38:
	.word 0
	.global a39
	.align 4
	.size a39, 4
a39:
	.word 0
	.text
	.global testParam8
	.type testParam8 , %function
testParam8:
	push {r4, r5, r6, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #32
.L366:
	str r0, [fp, #-32]
	str r1, [fp, #-28]
	str r2, [fp, #-24]
	str r3, [fp, #-20]
	ldr r3, [fp, #32]
	str r3, [fp, #-16]
	ldr r3, [fp, #36]
	str r3, [fp, #-12]
	ldr r3, [fp, #40]
	str r3, [fp, #-8]
	ldr r3, [fp, #44]
	str r3, [fp, #-4]
	ldr r10, [fp, #-32]
	ldr r9, [fp, #-28]
	add r8, r10, r9
	ldr r4, [fp, #-24]
	add r5, r8, r4
	ldr r4, [fp, #-20]
	add r6, r5, r4
	ldr r4, [fp, #-16]
	add r5, r6, r4
	ldr r4, [fp, #-12]
	add r6, r5, r4
	ldr r4, [fp, #-8]
	add r5, r6, r4
	ldr r4, [fp, #-4]
	add r6, r5, r4
	mov r0, r6
	add sp, sp, #32
	pop {r4, r5, r6, r8, r9, r10, fp, lr}
	bx lr

	.global testParam16
	.type testParam16 , %function
testParam16:
	push {r4, r5, r6, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #64
.L376:
	str r0, [fp, #-64]
	str r1, [fp, #-60]
	str r2, [fp, #-56]
	str r3, [fp, #-52]
	ldr r3, [fp, #32]
	str r3, [fp, #-48]
	ldr r3, [fp, #36]
	str r3, [fp, #-44]
	ldr r3, [fp, #40]
	str r3, [fp, #-40]
	ldr r3, [fp, #44]
	str r3, [fp, #-36]
	ldr r3, [fp, #48]
	str r3, [fp, #-32]
	ldr r3, [fp, #52]
	str r3, [fp, #-28]
	ldr r3, [fp, #56]
	str r3, [fp, #-24]
	ldr r3, [fp, #60]
	str r3, [fp, #-20]
	ldr r3, [fp, #64]
	str r3, [fp, #-16]
	ldr r3, [fp, #68]
	str r3, [fp, #-12]
	ldr r3, [fp, #72]
	str r3, [fp, #-8]
	ldr r3, [fp, #76]
	str r3, [fp, #-4]
	ldr r10, [fp, #-64]
	ldr r9, [fp, #-60]
	add r8, r10, r9
	ldr r4, [fp, #-56]
	add r5, r8, r4
	ldr r4, [fp, #-52]
	sub r6, r5, r4
	ldr r4, [fp, #-48]
	sub r5, r6, r4
	ldr r4, [fp, #-44]
	sub r6, r5, r4
	ldr r4, [fp, #-40]
	sub r5, r6, r4
	ldr r4, [fp, #-36]
	sub r6, r5, r4
	ldr r4, [fp, #-32]
	add r5, r6, r4
	ldr r4, [fp, #-28]
	add r6, r5, r4
	ldr r4, [fp, #-24]
	add r5, r6, r4
	ldr r4, [fp, #-20]
	add r6, r5, r4
	ldr r4, [fp, #-16]
	add r5, r6, r4
	ldr r4, [fp, #-12]
	add r6, r5, r4
	ldr r4, [fp, #-8]
	add r5, r6, r4
	ldr r4, [fp, #-4]
	add r6, r5, r4
	mov r0, r6
	add sp, sp, #64
	pop {r4, r5, r6, r8, r9, r10, fp, lr}
	bx lr

	.global testParam32
	.type testParam32 , %function
testParam32:
	push {r4, r5, r6, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #128
.L394:
	str r0, [fp, #-128]
	str r1, [fp, #-124]
	str r2, [fp, #-120]
	str r3, [fp, #-116]
	ldr r3, [fp, #32]
	str r3, [fp, #-112]
	ldr r3, [fp, #36]
	str r3, [fp, #-108]
	ldr r3, [fp, #40]
	str r3, [fp, #-104]
	ldr r3, [fp, #44]
	str r3, [fp, #-100]
	ldr r3, [fp, #48]
	str r3, [fp, #-96]
	ldr r3, [fp, #52]
	str r3, [fp, #-92]
	ldr r3, [fp, #56]
	str r3, [fp, #-88]
	ldr r3, [fp, #60]
	str r3, [fp, #-84]
	ldr r3, [fp, #64]
	str r3, [fp, #-80]
	ldr r3, [fp, #68]
	str r3, [fp, #-76]
	ldr r3, [fp, #72]
	str r3, [fp, #-72]
	ldr r3, [fp, #76]
	str r3, [fp, #-68]
	ldr r3, [fp, #80]
	str r3, [fp, #-64]
	ldr r3, [fp, #84]
	str r3, [fp, #-60]
	ldr r3, [fp, #88]
	str r3, [fp, #-56]
	ldr r3, [fp, #92]
	str r3, [fp, #-52]
	ldr r3, [fp, #96]
	str r3, [fp, #-48]
	ldr r3, [fp, #100]
	str r3, [fp, #-44]
	ldr r3, [fp, #104]
	str r3, [fp, #-40]
	ldr r3, [fp, #108]
	str r3, [fp, #-36]
	ldr r3, [fp, #112]
	str r3, [fp, #-32]
	ldr r3, [fp, #116]
	str r3, [fp, #-28]
	ldr r3, [fp, #120]
	str r3, [fp, #-24]
	ldr r3, [fp, #124]
	str r3, [fp, #-20]
	ldr r3, [fp, #128]
	str r3, [fp, #-16]
	ldr r3, [fp, #132]
	str r3, [fp, #-12]
	ldr r3, [fp, #136]
	str r3, [fp, #-8]
	ldr r3, [fp, #140]
	str r3, [fp, #-4]
	ldr r10, [fp, #-128]
	ldr r9, [fp, #-124]
	add r8, r10, r9
	ldr r4, [fp, #-120]
	add r5, r8, r4
	ldr r4, [fp, #-116]
	add r6, r5, r4
	ldr r4, [fp, #-112]
	add r5, r6, r4
	ldr r4, [fp, #-108]
	add r6, r5, r4
	ldr r4, [fp, #-104]
	add r5, r6, r4
	ldr r4, [fp, #-100]
	add r6, r5, r4
	ldr r4, [fp, #-96]
	add r5, r6, r4
	ldr r4, [fp, #-92]
	add r6, r5, r4
	ldr r4, [fp, #-88]
	add r5, r6, r4
	ldr r4, [fp, #-84]
	add r6, r5, r4
	ldr r4, [fp, #-80]
	add r5, r6, r4
	ldr r4, [fp, #-76]
	add r6, r5, r4
	ldr r4, [fp, #-72]
	add r5, r6, r4
	ldr r4, [fp, #-68]
	add r6, r5, r4
	ldr r4, [fp, #-64]
	add r5, r6, r4
	ldr r4, [fp, #-60]
	add r6, r5, r4
	ldr r4, [fp, #-56]
	sub r5, r6, r4
	ldr r4, [fp, #-52]
	sub r6, r5, r4
	ldr r4, [fp, #-48]
	sub r5, r6, r4
	ldr r4, [fp, #-44]
	sub r6, r5, r4
	ldr r4, [fp, #-40]
	sub r5, r6, r4
	ldr r4, [fp, #-36]
	add r6, r5, r4
	ldr r4, [fp, #-32]
	add r5, r6, r4
	ldr r4, [fp, #-28]
	add r6, r5, r4
	ldr r4, [fp, #-24]
	add r5, r6, r4
	ldr r4, [fp, #-20]
	add r6, r5, r4
	ldr r4, [fp, #-16]
	add r5, r6, r4
	ldr r4, [fp, #-12]
	add r6, r5, r4
	ldr r4, [fp, #-8]
	add r5, r6, r4
	ldr r4, [fp, #-4]
	add r6, r5, r4
	mov r0, r6
	add sp, sp, #128
	pop {r4, r5, r6, r8, r9, r10, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #152
.L428:
	ldr r10, =0
	ldr r9, addr_a00
	str r10, [r9]
	ldr r4, =1
	ldr r5, addr_a10
	str r4, [r5]
	ldr r4, =2
	ldr r5, addr_a20
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_a30
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_a40
	str r4, [r5]
	ldr r4, =5
	ldr r5, addr_a50
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_a60
	str r4, [r5]
	ldr r4, =7
	ldr r5, addr_a70
	str r4, [r5]
	ldr r4, =8
	ldr r5, addr_a80
	str r4, [r5]
	ldr r4, =9
	ldr r5, addr_a90
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_a100
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a110
	str r4, [r5]
	ldr r4, =2
	ldr r5, addr_a120
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_a130
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_a140
	str r4, [r5]
	ldr r4, =5
	ldr r5, addr_a150
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_a160
	str r4, [r5]
	ldr r4, =7
	ldr r5, addr_a170
	str r4, [r5]
	ldr r4, =8
	ldr r5, addr_a180
	str r4, [r5]
	ldr r4, =9
	ldr r5, addr_a190
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_a200
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a210
	str r4, [r5]
	ldr r4, =2
	ldr r5, addr_a220
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_a230
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_a240
	str r4, [r5]
	ldr r4, =5
	ldr r5, addr_a250
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_a260
	str r4, [r5]
	ldr r4, =7
	ldr r5, addr_a270
	str r4, [r5]
	ldr r4, =8
	ldr r5, addr_a280
	str r4, [r5]
	ldr r4, =9
	ldr r5, addr_a290
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_a300
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a310
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_a320
	str r4, [r5]
	ldr r4, =5
	ldr r5, addr_a330
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_a340
	str r4, [r5]
	ldr r4, =7
	ldr r5, addr_a350
	str r4, [r5]
	ldr r4, =8
	ldr r5, addr_a360
	str r4, [r5]
	ldr r4, =9
	ldr r5, addr_a370
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_a380
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a390
	str r4, [r5]
	ldr r4, addr_a00
	ldr r5, [r4]
	ldr r4, addr_a10
	ldr r6, [r4]
	ldr r4, addr_a20
	ldr r7, [r4]
	ldr r4, addr_a30
	ldr r8, [r4]
	ldr r4, addr_a40
	ldr r9, [r4]
	str r9, [fp, #-4]
	ldr r4, addr_a50
	ldr r9, [r4]
	str r9, [fp, #-16]
	ldr r4, addr_a60
	ldr r9, [r4]
	ldr r4, addr_a70
	ldr r10, [r4]
	mov r0, r5
	mov r1, r6
	mov r2, r7
	mov r3, r8
	push {r10}
	push {r9}
	ldr r4, [fp, #-16]
	push {r4}
	ldr r4, [fp, #-4]
	push {r4}
	bl testParam8
	add sp, sp, #16
	mov r4, r0
	ldr r5, addr_a00
	str r4, [r5]
	ldr r4, addr_a00
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r4, addr_a320
	ldr r5, [r4]
	ldr r4, addr_a330
	ldr r6, [r4]
	ldr r4, addr_a340
	ldr r7, [r4]
	ldr r4, addr_a350
	ldr r8, [r4]
	ldr r4, addr_a360
	ldr r9, [r4]
	str r9, [fp, #-8]
	ldr r4, addr_a370
	ldr r9, [r4]
	str r9, [fp, #-20]
	ldr r4, addr_a380
	ldr r9, [r4]
	str r9, [fp, #-28]
	ldr r4, addr_a390
	ldr r9, [r4]
	str r9, [fp, #-36]
	ldr r4, addr_a80
	ldr r9, [r4]
	str r9, [fp, #-44]
	ldr r4, addr_a90
	ldr r9, [r4]
	str r9, [fp, #-52]
	ldr r4, addr_a100
	ldr r9, [r4]
	str r9, [fp, #-60]
	ldr r4, addr_a110
	ldr r9, [r4]
	str r9, [fp, #-68]
	ldr r4, addr_a120
	ldr r9, [r4]
	str r9, [fp, #-76]
	ldr r4, addr_a130
	ldr r9, [r4]
	str r9, [fp, #-84]
	ldr r4, addr_a140
	ldr r9, [r4]
	ldr r4, addr_a150
	ldr r10, [r4]
	mov r0, r5
	mov r1, r6
	mov r2, r7
	mov r3, r8
	push {r10}
	push {r9}
	ldr r4, [fp, #-84]
	push {r4}
	ldr r4, [fp, #-76]
	push {r4}
	ldr r4, [fp, #-68]
	push {r4}
	ldr r4, [fp, #-60]
	push {r4}
	ldr r4, [fp, #-52]
	push {r4}
	ldr r4, [fp, #-44]
	push {r4}
	ldr r4, [fp, #-36]
	push {r4}
	ldr r4, [fp, #-28]
	push {r4}
	ldr r4, [fp, #-20]
	push {r4}
	ldr r4, [fp, #-8]
	push {r4}
	bl testParam16
	add sp, sp, #48
	mov r4, r0
	ldr r5, addr_a00
	str r4, [r5]
	ldr r4, addr_a00
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r4, addr_a00
	ldr r5, [r4]
	ldr r4, addr_a10
	ldr r6, [r4]
	ldr r4, addr_a20
	ldr r7, [r4]
	ldr r4, addr_a30
	ldr r8, [r4]
	ldr r4, addr_a40
	ldr r9, [r4]
	str r9, [fp, #-12]
	ldr r4, addr_a50
	ldr r9, [r4]
	str r9, [fp, #-24]
	ldr r4, addr_a60
	ldr r9, [r4]
	str r9, [fp, #-32]
	ldr r4, addr_a70
	ldr r9, [r4]
	str r9, [fp, #-40]
	ldr r4, addr_a80
	ldr r9, [r4]
	str r9, [fp, #-48]
	ldr r4, addr_a90
	ldr r9, [r4]
	str r9, [fp, #-56]
	ldr r4, addr_a100
	ldr r9, [r4]
	str r9, [fp, #-64]
	ldr r4, addr_a110
	ldr r9, [r4]
	str r9, [fp, #-72]
	ldr r4, addr_a120
	ldr r9, [r4]
	str r9, [fp, #-80]
	ldr r4, addr_a130
	ldr r9, [r4]
	str r9, [fp, #-88]
	ldr r4, addr_a140
	ldr r9, [r4]
	str r9, [fp, #-92]
	ldr r4, addr_a150
	ldr r9, [r4]
	str r9, [fp, #-96]
	ldr r4, addr_a160
	ldr r9, [r4]
	str r9, [fp, #-100]
	ldr r4, addr_a170
	ldr r9, [r4]
	str r9, [fp, #-104]
	ldr r4, addr_a180
	ldr r9, [r4]
	str r9, [fp, #-108]
	ldr r4, addr_a190
	ldr r9, [r4]
	str r9, [fp, #-112]
	ldr r4, addr_a200
	ldr r9, [r4]
	str r9, [fp, #-116]
	ldr r4, addr_a210
	ldr r9, [r4]
	str r9, [fp, #-120]
	ldr r4, addr_a220
	ldr r9, [r4]
	str r9, [fp, #-124]
	ldr r4, addr_a230
	ldr r9, [r4]
	str r9, [fp, #-128]
	ldr r4, addr_a240
	ldr r9, [r4]
	str r9, [fp, #-132]
	ldr r4, addr_a250
	ldr r9, [r4]
	str r9, [fp, #-136]
	ldr r4, addr_a260
	ldr r9, [r4]
	str r9, [fp, #-140]
	ldr r4, addr_a270
	ldr r9, [r4]
	str r9, [fp, #-144]
	ldr r4, addr_a280
	ldr r9, [r4]
	str r9, [fp, #-148]
	ldr r4, addr_a290
	ldr r9, [r4]
	str r9, [fp, #-152]
	ldr r4, addr_a300
	ldr r9, [r4]
	ldr r4, addr_a310
	ldr r10, [r4]
	mov r0, r5
	mov r1, r6
	mov r2, r7
	mov r3, r8
	push {r10}
	push {r9}
	ldr r4, [fp, #-152]
	push {r4}
	ldr r4, [fp, #-148]
	push {r4}
	ldr r4, [fp, #-144]
	push {r4}
	ldr r4, [fp, #-140]
	push {r4}
	ldr r4, [fp, #-136]
	push {r4}
	ldr r4, [fp, #-132]
	push {r4}
	ldr r4, [fp, #-128]
	push {r4}
	ldr r4, [fp, #-124]
	push {r4}
	ldr r4, [fp, #-120]
	push {r4}
	ldr r4, [fp, #-116]
	push {r4}
	ldr r4, [fp, #-112]
	push {r4}
	ldr r4, [fp, #-108]
	push {r4}
	ldr r4, [fp, #-104]
	push {r4}
	ldr r4, [fp, #-100]
	push {r4}
	ldr r4, [fp, #-96]
	push {r4}
	ldr r4, [fp, #-92]
	push {r4}
	ldr r4, [fp, #-88]
	push {r4}
	ldr r4, [fp, #-80]
	push {r4}
	ldr r4, [fp, #-72]
	push {r4}
	ldr r4, [fp, #-64]
	push {r4}
	ldr r4, [fp, #-56]
	push {r4}
	ldr r4, [fp, #-48]
	push {r4}
	ldr r4, [fp, #-40]
	push {r4}
	ldr r4, [fp, #-32]
	push {r4}
	ldr r4, [fp, #-24]
	push {r4}
	ldr r4, [fp, #-12]
	push {r4}
	bl testParam32
	add sp, sp, #112
	mov r4, r0
	ldr r5, addr_a00
	str r4, [r5]
	ldr r4, addr_a00
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #0
	add sp, sp, #152
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .F0
.LTORG
addr_a00:
	.word a0
addr_a10:
	.word a1
addr_a20:
	.word a2
addr_a30:
	.word a3
addr_a40:
	.word a4
addr_a50:
	.word a5
addr_a60:
	.word a6
addr_a70:
	.word a7
addr_a80:
	.word a8
addr_a90:
	.word a9
addr_a100:
	.word a10
addr_a110:
	.word a11
addr_a120:
	.word a12
addr_a130:
	.word a13
addr_a140:
	.word a14
addr_a150:
	.word a15
addr_a160:
	.word a16
addr_a170:
	.word a17
addr_a180:
	.word a18
addr_a190:
	.word a19
addr_a200:
	.word a20
addr_a210:
	.word a21
addr_a220:
	.word a22
addr_a230:
	.word a23
addr_a240:
	.word a24
addr_a250:
	.word a25
addr_a260:
	.word a26
addr_a270:
	.word a27
addr_a280:
	.word a28
addr_a290:
	.word a29
addr_a300:
	.word a30
addr_a310:
	.word a31
addr_a320:
	.word a32
addr_a330:
	.word a33
addr_a340:
	.word a34
addr_a350:
	.word a35
addr_a360:
	.word a36
addr_a370:
	.word a37
addr_a380:
	.word a38
addr_a390:
	.word a39
.F0:

addr_a01:
	.word a0
addr_a11:
	.word a1
addr_a21:
	.word a2
addr_a31:
	.word a3
addr_a41:
	.word a4
addr_a51:
	.word a5
addr_a61:
	.word a6
addr_a71:
	.word a7
addr_a81:
	.word a8
addr_a91:
	.word a9
addr_a101:
	.word a10
addr_a111:
	.word a11
addr_a121:
	.word a12
addr_a131:
	.word a13
addr_a141:
	.word a14
addr_a151:
	.word a15
addr_a161:
	.word a16
addr_a171:
	.word a17
addr_a181:
	.word a18
addr_a191:
	.word a19
addr_a201:
	.word a20
addr_a211:
	.word a21
addr_a221:
	.word a22
addr_a231:
	.word a23
addr_a241:
	.word a24
addr_a251:
	.word a25
addr_a261:
	.word a26
addr_a271:
	.word a27
addr_a281:
	.word a28
addr_a291:
	.word a29
addr_a301:
	.word a30
addr_a311:
	.word a31
addr_a321:
	.word a32
addr_a331:
	.word a33
addr_a341:
	.word a34
addr_a351:
	.word a35
addr_a361:
	.word a36
addr_a371:
	.word a37
addr_a381:
	.word a38
addr_a391:
	.word a39

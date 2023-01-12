	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a1
	.align 4
	.size a1, 4
a1:
	.word 1
	.global a2
	.align 4
	.size a2, 4
a2:
	.word 2
	.global a3
	.align 4
	.size a3, 4
a3:
	.word 3
	.global a4
	.align 4
	.size a4, 4
a4:
	.word 4
	.global a5
	.align 4
	.size a5, 4
a5:
	.word 5
	.global a6
	.align 4
	.size a6, 4
a6:
	.word 6
	.global a7
	.align 4
	.size a7, 4
a7:
	.word 7
	.global a8
	.align 4
	.size a8, 4
a8:
	.word 8
	.global a9
	.align 4
	.size a9, 4
a9:
	.word 9
	.global a10
	.align 4
	.size a10, 4
a10:
	.word 10
	.global a11
	.align 4
	.size a11, 4
a11:
	.word 11
	.global a12
	.align 4
	.size a12, 4
a12:
	.word 12
	.global a13
	.align 4
	.size a13, 4
a13:
	.word 13
	.global a14
	.align 4
	.size a14, 4
a14:
	.word 14
	.global a15
	.align 4
	.size a15, 4
a15:
	.word 15
	.global a16
	.align 4
	.size a16, 4
a16:
	.word 16
	.global a17
	.align 4
	.size a17, 4
a17:
	.word 1
	.global a18
	.align 4
	.size a18, 4
a18:
	.word 2
	.global a19
	.align 4
	.size a19, 4
a19:
	.word 3
	.global a20
	.align 4
	.size a20, 4
a20:
	.word 4
	.global a21
	.align 4
	.size a21, 4
a21:
	.word 5
	.global a22
	.align 4
	.size a22, 4
a22:
	.word 6
	.global a23
	.align 4
	.size a23, 4
a23:
	.word 7
	.global a24
	.align 4
	.size a24, 4
a24:
	.word 8
	.global a25
	.align 4
	.size a25, 4
a25:
	.word 9
	.global a26
	.align 4
	.size a26, 4
a26:
	.word 10
	.global a27
	.align 4
	.size a27, 4
a27:
	.word 11
	.global a28
	.align 4
	.size a28, 4
a28:
	.word 12
	.global a29
	.align 4
	.size a29, 4
a29:
	.word 13
	.global a30
	.align 4
	.size a30, 4
a30:
	.word 14
	.global a31
	.align 4
	.size a31, 4
a31:
	.word 15
	.global a32
	.align 4
	.size a32, 4
a32:
	.word 16
	.text
	.global func
	.type func , %function
func:
	push {r4, r5, r6, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #156
.L581:
	str r0, [fp, #-156]
	str r1, [fp, #-152]
	ldr r10, [fp, #-156]
	ldr r9, [fp, #-152]
	add r8, r10, r9
	str r8, [fp, #-148]
	bl getint
	mov r4, r0
	str r4, [fp, #-144]
	bl getint
	mov r4, r0
	str r4, [fp, #-140]
	bl getint
	mov r4, r0
	str r4, [fp, #-136]
	bl getint
	mov r4, r0
	str r4, [fp, #-132]
	ldr r4, [fp, #-144]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a10
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-128]
	ldr r4, [fp, #-140]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a20
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-124]
	ldr r4, [fp, #-136]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a30
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-120]
	ldr r4, [fp, #-132]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a40
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-116]
	ldr r4, [fp, #-128]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a50
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-112]
	ldr r4, [fp, #-124]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a60
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-108]
	ldr r4, [fp, #-120]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a70
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-104]
	ldr r4, [fp, #-116]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a80
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-100]
	ldr r4, [fp, #-112]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a90
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-96]
	ldr r4, [fp, #-108]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a100
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-92]
	ldr r4, [fp, #-104]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a110
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-88]
	ldr r4, [fp, #-100]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a120
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-84]
	ldr r4, [fp, #-96]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a130
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-80]
	ldr r4, [fp, #-92]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a140
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-76]
	ldr r4, [fp, #-88]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a150
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-72]
	ldr r4, [fp, #-84]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a160
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-68]
	ldr r4, [fp, #-80]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a170
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-64]
	ldr r4, [fp, #-76]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a180
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-60]
	ldr r4, [fp, #-72]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a190
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-56]
	ldr r4, [fp, #-68]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a200
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-52]
	ldr r4, [fp, #-64]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a210
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-48]
	ldr r4, [fp, #-60]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a220
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-44]
	ldr r4, [fp, #-56]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a230
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-40]
	ldr r4, [fp, #-52]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a240
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-36]
	ldr r4, [fp, #-48]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a250
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-32]
	ldr r4, [fp, #-44]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a260
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-28]
	ldr r4, [fp, #-40]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a270
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-24]
	ldr r4, [fp, #-36]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a280
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-20]
	ldr r4, [fp, #-32]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a290
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-16]
	ldr r4, [fp, #-28]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a300
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-12]
	ldr r4, [fp, #-24]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a310
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-8]
	ldr r4, [fp, #-20]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a320
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-4]
	ldr r4, [fp, #-156]
	ldr r5, [fp, #-152]
	sub r6, r4, r5
	ldr r4, =10
	add r5, r6, r4
	str r5, [fp, #-148]
	ldr r4, [fp, #-32]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a290
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-16]
	ldr r4, [fp, #-28]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a300
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-12]
	ldr r4, [fp, #-24]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a310
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-8]
	ldr r4, [fp, #-20]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a320
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-4]
	ldr r4, [fp, #-48]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a250
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-32]
	ldr r4, [fp, #-44]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a260
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-28]
	ldr r4, [fp, #-40]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a270
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-24]
	ldr r4, [fp, #-36]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a280
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-20]
	ldr r4, [fp, #-64]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a210
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-48]
	ldr r4, [fp, #-60]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a220
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-44]
	ldr r4, [fp, #-56]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a230
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-40]
	ldr r4, [fp, #-52]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a240
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-36]
	ldr r4, [fp, #-80]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a170
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-64]
	ldr r4, [fp, #-76]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a180
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-60]
	ldr r4, [fp, #-72]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a190
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-56]
	ldr r4, [fp, #-68]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a200
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-52]
	ldr r4, [fp, #-96]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a130
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-80]
	ldr r4, [fp, #-92]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a140
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-76]
	ldr r4, [fp, #-88]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a150
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-72]
	ldr r4, [fp, #-84]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a160
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-68]
	ldr r4, [fp, #-112]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a90
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-96]
	ldr r4, [fp, #-108]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a100
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-92]
	ldr r4, [fp, #-104]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a110
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-88]
	ldr r4, [fp, #-100]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a120
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-84]
	ldr r4, [fp, #-128]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a50
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-112]
	ldr r4, [fp, #-124]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a60
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-108]
	ldr r4, [fp, #-120]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a70
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-104]
	ldr r4, [fp, #-116]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a80
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-100]
	ldr r4, [fp, #-144]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a10
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-128]
	ldr r4, [fp, #-140]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a20
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-124]
	ldr r4, [fp, #-136]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a30
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-120]
	ldr r4, [fp, #-132]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a40
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-116]
	ldr r4, [fp, #-144]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a10
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-128]
	ldr r4, [fp, #-140]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a20
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-124]
	ldr r4, [fp, #-136]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a30
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-120]
	ldr r4, [fp, #-132]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a40
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-116]
	b .B0
.LTORG
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
.B0:
	ldr r4, [fp, #-148]
	ldr r5, [fp, #-144]
	add r6, r4, r5
	ldr r4, [fp, #-140]
	add r5, r6, r4
	ldr r4, [fp, #-136]
	add r6, r5, r4
	ldr r4, [fp, #-132]
	add r5, r6, r4
	ldr r4, [fp, #-128]
	sub r6, r5, r4
	ldr r4, [fp, #-124]
	sub r5, r6, r4
	ldr r4, [fp, #-120]
	sub r6, r5, r4
	ldr r4, [fp, #-116]
	sub r5, r6, r4
	ldr r4, [fp, #-112]
	add r6, r5, r4
	ldr r4, [fp, #-108]
	add r5, r6, r4
	ldr r4, [fp, #-104]
	add r6, r5, r4
	ldr r4, [fp, #-100]
	add r5, r6, r4
	ldr r4, [fp, #-96]
	sub r6, r5, r4
	ldr r4, [fp, #-92]
	sub r5, r6, r4
	ldr r4, [fp, #-88]
	sub r6, r5, r4
	ldr r4, [fp, #-84]
	sub r5, r6, r4
	ldr r4, [fp, #-80]
	add r6, r5, r4
	ldr r4, [fp, #-76]
	add r5, r6, r4
	ldr r4, [fp, #-72]
	add r6, r5, r4
	ldr r4, [fp, #-68]
	add r5, r6, r4
	ldr r4, [fp, #-64]
	sub r6, r5, r4
	ldr r4, [fp, #-60]
	sub r5, r6, r4
	ldr r4, [fp, #-56]
	sub r6, r5, r4
	ldr r4, [fp, #-52]
	sub r5, r6, r4
	ldr r4, [fp, #-48]
	add r6, r5, r4
	ldr r4, [fp, #-44]
	add r5, r6, r4
	ldr r4, [fp, #-40]
	add r6, r5, r4
	ldr r4, [fp, #-36]
	add r5, r6, r4
	ldr r4, [fp, #-32]
	sub r6, r5, r4
	ldr r4, [fp, #-28]
	sub r5, r6, r4
	ldr r4, [fp, #-24]
	sub r6, r5, r4
	ldr r4, [fp, #-20]
	sub r5, r6, r4
	ldr r4, [fp, #-16]
	add r6, r5, r4
	ldr r4, [fp, #-12]
	add r5, r6, r4
	ldr r4, [fp, #-8]
	add r6, r5, r4
	ldr r4, [fp, #-4]
	add r5, r6, r4
	ldr r4, addr_a11
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a21
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a31
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a41
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a51
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a61
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a71
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a81
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a91
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a101
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a111
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a121
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a131
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a141
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a151
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a161
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a171
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a181
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a191
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a201
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a211
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a221
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a231
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a241
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a251
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a261
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a271
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a281
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a291
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a301
	ldr r6, [r5]
	sub r5, r4, r6
	ldr r4, addr_a311
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_a321
	ldr r6, [r5]
	sub r5, r4, r6
	mov r0, r5
	add sp, sp, #156
	pop {r4, r5, r6, r8, r9, r10, fp, lr}
	bx lr
	b .F1
.LTORG
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
.F1:

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L622:
	bl getint
	mov r10, r0
	str r10, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =2
	ldr r6, =9
	mul r7, r5, r6
	add r5, r4, r7
	str r5, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl func
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r7, r10, fp, lr}
	bx lr

addr_a12:
	.word a1
addr_a22:
	.word a2
addr_a32:
	.word a3
addr_a42:
	.word a4
addr_a52:
	.word a5
addr_a62:
	.word a6
addr_a72:
	.word a7
addr_a82:
	.word a8
addr_a92:
	.word a9
addr_a102:
	.word a10
addr_a112:
	.word a11
addr_a122:
	.word a12
addr_a132:
	.word a13
addr_a142:
	.word a14
addr_a152:
	.word a15
addr_a162:
	.word a16
addr_a172:
	.word a17
addr_a182:
	.word a18
addr_a192:
	.word a19
addr_a202:
	.word a20
addr_a212:
	.word a21
addr_a222:
	.word a22
addr_a232:
	.word a23
addr_a242:
	.word a24
addr_a252:
	.word a25
addr_a262:
	.word a26
addr_a272:
	.word a27
addr_a282:
	.word a28
addr_a292:
	.word a29
addr_a302:
	.word a30
addr_a312:
	.word a31
addr_a322:
	.word a32

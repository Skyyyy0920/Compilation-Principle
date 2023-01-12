	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global testParam8
	.type testParam8 , %function
testParam8:
	push {r4, r5, r6, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #32
.L344:
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
	sub r8, r10, r9
	ldr r4, [fp, #-24]
	add r5, r8, r4
	ldr r4, [fp, #-20]
	sub r6, r5, r4
	ldr r4, [fp, #-16]
	sub r5, r6, r4
	ldr r4, [fp, #-12]
	sub r6, r5, r4
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
.L354:
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
	add r6, r5, r4
	ldr r4, [fp, #-48]
	sub r5, r6, r4
	ldr r4, [fp, #-44]
	add r6, r5, r4
	ldr r4, [fp, #-40]
	add r5, r6, r4
	ldr r4, [fp, #-36]
	add r6, r5, r4
	ldr r4, [fp, #-32]
	sub r5, r6, r4
	ldr r4, [fp, #-28]
	add r6, r5, r4
	ldr r4, [fp, #-24]
	sub r5, r6, r4
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
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #128
.L372:
	str r0, [fp, #-128]
	str r1, [fp, #-124]
	str r2, [fp, #-120]
	str r3, [fp, #-116]
	ldr r3, [fp, #36]
	str r3, [fp, #-112]
	ldr r3, [fp, #40]
	str r3, [fp, #-108]
	ldr r3, [fp, #44]
	str r3, [fp, #-104]
	ldr r3, [fp, #48]
	str r3, [fp, #-100]
	ldr r3, [fp, #52]
	str r3, [fp, #-96]
	ldr r3, [fp, #56]
	str r3, [fp, #-92]
	ldr r3, [fp, #60]
	str r3, [fp, #-88]
	ldr r3, [fp, #64]
	str r3, [fp, #-84]
	ldr r3, [fp, #68]
	str r3, [fp, #-80]
	ldr r3, [fp, #72]
	str r3, [fp, #-76]
	ldr r3, [fp, #76]
	str r3, [fp, #-72]
	ldr r3, [fp, #80]
	str r3, [fp, #-68]
	ldr r3, [fp, #84]
	str r3, [fp, #-64]
	ldr r3, [fp, #88]
	str r3, [fp, #-60]
	ldr r3, [fp, #92]
	str r3, [fp, #-56]
	ldr r3, [fp, #96]
	str r3, [fp, #-52]
	ldr r3, [fp, #100]
	str r3, [fp, #-48]
	ldr r3, [fp, #104]
	str r3, [fp, #-44]
	ldr r3, [fp, #108]
	str r3, [fp, #-40]
	ldr r3, [fp, #112]
	str r3, [fp, #-36]
	ldr r3, [fp, #116]
	str r3, [fp, #-32]
	ldr r3, [fp, #120]
	str r3, [fp, #-28]
	ldr r3, [fp, #124]
	str r3, [fp, #-24]
	ldr r3, [fp, #128]
	str r3, [fp, #-20]
	ldr r3, [fp, #132]
	str r3, [fp, #-16]
	ldr r3, [fp, #136]
	str r3, [fp, #-12]
	ldr r3, [fp, #140]
	str r3, [fp, #-8]
	ldr r3, [fp, #144]
	str r3, [fp, #-4]
	ldr r10, [fp, #-128]
	ldr r9, [fp, #-124]
	ldr r8, [fp, #-120]
	mul r7, r9, r8
	add r4, r10, r7
	ldr r5, [fp, #-116]
	add r6, r4, r5
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
	sub r5, r6, r4
	ldr r4, [fp, #-76]
	sub r6, r5, r4
	ldr r4, [fp, #-72]
	sub r5, r6, r4
	ldr r4, [fp, #-68]
	sub r6, r5, r4
	ldr r4, [fp, #-64]
	sub r5, r6, r4
	ldr r4, [fp, #-60]
	sub r6, r5, r4
	ldr r4, [fp, #-56]
	sub r5, r6, r4
	ldr r4, [fp, #-52]
	sub r6, r5, r4
	ldr r4, [fp, #-48]
	sub r5, r6, r4
	ldr r4, [fp, #-44]
	sub r6, r5, r4
	ldr r4, [fp, #-40]
	add r5, r6, r4
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
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	ldr r4, =268
	sub sp, sp, r4
.L406:
	ldr r10, =0
	str r10, [fp, #-128]
	ldr r4, =1
	str r4, [fp, #-124]
	ldr r4, =2
	str r4, [fp, #-120]
	ldr r4, =3
	str r4, [fp, #-116]
	ldr r4, =4
	str r4, [fp, #-112]
	ldr r4, =5
	str r4, [fp, #-108]
	ldr r4, =6
	str r4, [fp, #-104]
	ldr r4, =7
	str r4, [fp, #-100]
	ldr r4, =8
	str r4, [fp, #-96]
	ldr r4, =9
	str r4, [fp, #-92]
	ldr r4, =0
	str r4, [fp, #-88]
	ldr r4, =1
	str r4, [fp, #-84]
	ldr r4, =2
	str r4, [fp, #-80]
	ldr r4, =3
	str r4, [fp, #-76]
	ldr r4, =4
	str r4, [fp, #-72]
	ldr r4, =5
	str r4, [fp, #-68]
	ldr r4, =6
	str r4, [fp, #-64]
	ldr r4, =7
	str r4, [fp, #-60]
	ldr r4, =8
	str r4, [fp, #-56]
	ldr r4, =9
	str r4, [fp, #-52]
	ldr r4, =0
	str r4, [fp, #-48]
	ldr r4, =1
	str r4, [fp, #-44]
	ldr r4, =2
	str r4, [fp, #-40]
	ldr r4, =3
	str r4, [fp, #-36]
	ldr r4, =4
	str r4, [fp, #-32]
	ldr r4, =5
	str r4, [fp, #-28]
	ldr r4, =6
	str r4, [fp, #-24]
	ldr r4, =7
	str r4, [fp, #-20]
	ldr r4, =8
	str r4, [fp, #-16]
	ldr r4, =9
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	ldr r4, [fp, #-128]
	ldr r5, [fp, #-124]
	ldr r6, [fp, #-120]
	ldr r7, [fp, #-116]
	ldr r8, [fp, #-112]
	str r8, [fp, #-132]
	ldr r8, [fp, #-108]
	ldr r9, [fp, #-104]
	ldr r10, [fp, #-100]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	push {r10}
	push {r9}
	push {r8}
	ldr r4, [fp, #-132]
	push {r4}
	bl testParam8
	add sp, sp, #16
	mov r4, r0
	ldr r5, [fp, #-124]
	ldr r6, [fp, #-120]
	ldr r7, [fp, #-116]
	ldr r8, [fp, #-112]
	str r8, [fp, #-136]
	ldr r8, [fp, #-108]
	str r8, [fp, #-144]
	ldr r8, [fp, #-104]
	str r8, [fp, #-152]
	ldr r8, [fp, #-100]
	str r8, [fp, #-160]
	ldr r8, [fp, #-96]
	str r8, [fp, #-168]
	ldr r8, [fp, #-92]
	str r8, [fp, #-176]
	ldr r8, [fp, #-88]
	str r8, [fp, #-184]
	ldr r8, [fp, #-84]
	str r8, [fp, #-192]
	ldr r8, [fp, #-80]
	str r8, [fp, #-200]
	ldr r8, [fp, #-76]
	ldr r9, [fp, #-72]
	ldr r10, [fp, #-68]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	push {r10}
	push {r9}
	push {r8}
	ldr r4, [fp, #-200]
	push {r4}
	ldr r4, [fp, #-192]
	push {r4}
	ldr r4, [fp, #-184]
	push {r4}
	ldr r4, [fp, #-176]
	push {r4}
	ldr r4, [fp, #-168]
	push {r4}
	ldr r4, [fp, #-160]
	push {r4}
	ldr r4, [fp, #-152]
	push {r4}
	ldr r4, [fp, #-144]
	push {r4}
	ldr r4, [fp, #-136]
	push {r4}
	bl testParam16
	add sp, sp, #48
	mov r4, r0
	ldr r5, [fp, #-124]
	ldr r6, [fp, #-120]
	ldr r7, [fp, #-116]
	ldr r8, [fp, #-112]
	str r8, [fp, #-140]
	ldr r8, [fp, #-108]
	str r8, [fp, #-148]
	ldr r8, [fp, #-104]
	str r8, [fp, #-156]
	ldr r8, [fp, #-100]
	str r8, [fp, #-164]
	ldr r8, [fp, #-96]
	str r8, [fp, #-172]
	ldr r8, [fp, #-92]
	str r8, [fp, #-180]
	ldr r8, [fp, #-88]
	str r8, [fp, #-188]
	ldr r8, [fp, #-84]
	str r8, [fp, #-196]
	ldr r8, [fp, #-80]
	str r8, [fp, #-204]
	ldr r8, [fp, #-76]
	str r8, [fp, #-208]
	ldr r8, [fp, #-72]
	str r8, [fp, #-212]
	ldr r8, [fp, #-68]
	str r8, [fp, #-216]
	ldr r8, [fp, #-64]
	str r8, [fp, #-220]
	ldr r8, [fp, #-60]
	str r8, [fp, #-224]
	ldr r8, [fp, #-56]
	str r8, [fp, #-228]
	ldr r8, [fp, #-52]
	str r8, [fp, #-232]
	ldr r8, [fp, #-48]
	str r8, [fp, #-236]
	ldr r8, [fp, #-44]
	str r8, [fp, #-240]
	ldr r8, [fp, #-40]
	str r8, [fp, #-244]
	ldr r8, [fp, #-36]
	str r8, [fp, #-248]
	ldr r8, [fp, #-32]
	str r8, [fp, #-252]
	ldr r8, [fp, #-28]
	ldr r9, =-256
	str r8, [fp, r9]
	ldr r8, [fp, #-24]
	ldr r9, =-260
	str r8, [fp, r9]
	ldr r8, [fp, #-20]
	ldr r9, =-264
	str r8, [fp, r9]
	ldr r8, [fp, #-16]
	ldr r9, =-268
	str r8, [fp, r9]
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
	ldr r4, =-268
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-264
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-260
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-256
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, [fp, #-252]
	push {r4}
	ldr r4, [fp, #-248]
	push {r4}
	ldr r4, [fp, #-244]
	push {r4}
	ldr r4, [fp, #-240]
	push {r4}
	ldr r4, [fp, #-236]
	push {r4}
	ldr r4, [fp, #-232]
	push {r4}
	ldr r4, [fp, #-228]
	push {r4}
	ldr r4, [fp, #-224]
	push {r4}
	ldr r4, [fp, #-220]
	push {r4}
	ldr r4, [fp, #-216]
	push {r4}
	ldr r4, [fp, #-212]
	push {r4}
	ldr r4, [fp, #-208]
	push {r4}
	ldr r4, [fp, #-204]
	push {r4}
	ldr r4, [fp, #-196]
	push {r4}
	ldr r4, [fp, #-188]
	push {r4}
	ldr r4, [fp, #-180]
	push {r4}
	ldr r4, [fp, #-172]
	push {r4}
	ldr r4, [fp, #-164]
	push {r4}
	ldr r4, [fp, #-156]
	push {r4}
	ldr r4, [fp, #-148]
	push {r4}
	ldr r4, [fp, #-140]
	push {r4}
	bl testParam32
	add sp, sp, #112
	mov r4, r0
	str r4, [fp, #-128]
	ldr r4, [fp, #-128]
	mov r0, r4
	bl putint
	mov r0, #0
	ldr r1, =268
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .F0
.LTORG
.F0:


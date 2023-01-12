	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global relu_reg
	.type relu_reg , %function
relu_reg:
	push {r4, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L933:
	str r0, [fp, #-4]
	ldr r10, [fp, #-4]
	cmp r10, #127
	movgt r4, #1
	movle r4, #0
	bgt .L935
	b .L939
.L935:
	mov r0, #127
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr
	b .L936
.L936:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movlt r4, #1
	movge r4, #0
	blt .L940
	b .L944
.L939:
	b .L936
.L940:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr
	b .L941
.L941:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r10, fp, lr}
	bx lr
.L944:
	b .L941

	.global model
	.type model , %function
model:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L946:
	str r0, [fp, #-4]
	ldr r10, [fp, #-4]
	mov r9, #0
	mov r8, #20
	mul r7, r9, r8
	add r4, r10, r7
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, =85
	mul r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #1
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r4, =23
	mul r7, r5, r4
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #2
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =0
	ldr r7, =82
	sub r8, r5, r7
	mul r5, r6, r8
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #3
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r4, =0
	ldr r7, =103
	sub r8, r4, r7
	mul r4, r5, r8
	add r5, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #4
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r4, =0
	ldr r7, =123
	sub r8, r4, r7
	mul r4, r6, r8
	add r6, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r8, #20
	mul r7, r5, r8
	add r5, r4, r7
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r4, =64
	mul r7, r5, r4
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #1
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =0
	ldr r7, =120
	sub r8, r5, r7
	mul r5, r6, r8
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #2
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r4, =50
	mul r7, r5, r4
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #3
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =0
	ldr r7, =59
	sub r8, r5, r7
	mul r5, r6, r8
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r8, #20
	mul r7, r5, r8
	add r5, r4, r7
	mov r4, #4
	mov r8, #4
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [r4]
	ldr r4, =47
	mul r7, r5, r4
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r7, r6, r8
	add r6, r5, r7
	mov r5, #0
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	ldr r6, [r5]
	ldr r5, =0
	ldr r7, =111
	sub r8, r5, r7
	mul r5, r6, r8
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #1
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r4, =0
	ldr r7, =67
	sub r8, r4, r7
	mul r4, r5, r8
	add r5, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #2
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r4, =0
	ldr r7, =106
	sub r8, r4, r7
	mul r4, r6, r8
	add r6, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r8, #20
	mul r7, r5, r8
	add r5, r4, r7
	mov r4, #3
	mov r8, #4
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [r4]
	ldr r4, =0
	ldr r7, =75
	sub r8, r4, r7
	mul r4, r5, r8
	add r5, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r7, r6, r8
	add r6, r4, r7
	mov r4, #4
	mov r8, #4
	mul r7, r4, r8
	add r4, r6, r7
	ldr r6, [r4]
	ldr r4, =0
	ldr r7, =102
	sub r8, r4, r7
	mul r4, r6, r8
	add r6, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r4, =34
	mul r7, r5, r4
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #1
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =0
	ldr r7, =39
	sub r8, r5, r7
	mul r5, r6, r8
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #2
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r4, =65
	mul r7, r5, r4
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #3
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =47
	mul r7, r6, r5
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r7, r6, r8
	add r6, r4, r7
	mov r4, #4
	mov r8, #4
	mul r7, r4, r8
	add r4, r6, r7
	ldr r6, [r4]
	ldr r4, =113
	mul r7, r6, r4
	add r4, r5, r7
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #0
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	ldr r6, [r5]
	ldr r5, =110
	mul r7, r6, r5
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #1
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r4, =47
	mul r7, r6, r4
	add r4, r5, r7
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #2
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =0
	ldr r7, =4
	sub r8, r5, r7
	mul r5, r6, r8
	add r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #3
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r4, =80
	mul r7, r5, r4
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #4
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =46
	mul r7, r6, r5
	add r5, r4, r7
	mov r0, r5
	bl relu_reg
	mov r4, r0
	ldr r5, =39
	mul r6, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r4, =0
	ldr r7, =106
	sub r8, r4, r7
	mul r4, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =126
	mul r8, r7, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =18
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r9, #20
	mul r8, r5, r9
	add r5, r4, r8
	mov r4, #3
	mov r9, #4
	mul r8, r4, r9
	add r4, r5, r8
	ldr r5, [r4]
	ldr r4, =0
	ldr r8, =31
	sub r9, r4, r8
	mul r4, r5, r9
	add r5, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r9, #20
	mul r8, r7, r9
	add r7, r4, r8
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =8
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r8, #20
	mul r9, r5, r8
	add r5, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r4, =47
	mul r8, r5, r4
	add r4, r7, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =4
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r8, #20
	mul r9, r5, r8
	add r5, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r4, =67
	mul r8, r5, r4
	add r4, r7, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =94
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r8, #20
	mul r9, r5, r8
	add r5, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r4, =0
	ldr r8, =121
	sub r9, r4, r8
	mul r4, r5, r9
	add r5, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	b .B0
.LTORG
.B0:
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =7
	mul r8, r7, r4
	add r4, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =21
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r8, #20
	mul r9, r5, r8
	add r5, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r4, =0
	ldr r8, =60
	sub r9, r4, r8
	mul r4, r5, r9
	add r5, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r9, #4
	mul r8, r4, r9
	add r4, r7, r8
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =43
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r8, #20
	mul r9, r5, r8
	add r5, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r4, =105
	mul r8, r5, r4
	add r4, r7, r8
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =42
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r8, #20
	mul r9, r5, r8
	add r5, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r4, =87
	mul r8, r5, r4
	add r4, r7, r8
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =29
	mul r8, r7, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =106
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r8, #20
	mul r9, r5, r8
	add r5, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r4, =0
	ldr r8, =31
	sub r9, r4, r8
	mul r4, r5, r9
	add r5, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r4, r8
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =110
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r8, #20
	mul r9, r5, r8
	add r5, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r4, =0
	ldr r8, =100
	sub r9, r4, r8
	mul r4, r5, r9
	add r5, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =22
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r8, #20
	mul r9, r5, r8
	add r5, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r4, =0
	ldr r8, =75
	sub r9, r4, r8
	mul r4, r5, r9
	add r5, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =125
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r5, r4
	mov r0, r7
	bl relu_reg
	mov r4, r0
	ldr r5, =77
	mul r7, r4, r5
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =26
	mul r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =76
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =70
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =29
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =95
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =96
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =52
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =68
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =5
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =34
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =34
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #1
	mov r9, #4
	mul r8, r5, r9
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =102
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =6
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =38
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =27
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r6, =110
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =116
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =39
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =63
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =99
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	b .B1
.LTORG
.B1:
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =65
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =120
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =39
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =6
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #4
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	ldr r7, [r5]
	ldr r5, =94
	mul r8, r7, r5
	add r5, r6, r8
	mov r0, r5
	bl relu_reg
	mov r5, r0
	ldr r6, =127
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r4, =0
	ldr r7, =23
	sub r8, r4, r7
	mul r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =63
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =49
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =50
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r9, #4
	mul r8, r4, r9
	add r4, r7, r8
	ldr r7, [r4]
	ldr r4, =72
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r6, =85
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #1
	mov r9, #4
	mul r8, r4, r9
	add r4, r7, r8
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =30
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =12
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =125
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =117
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	ldr r8, =65
	sub r9, r4, r8
	mul r4, r6, r9
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #1
	mov r9, #4
	mul r8, r4, r9
	add r4, r7, r8
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =67
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #2
	mov r9, #4
	mul r8, r4, r9
	add r4, r6, r8
	ldr r6, [r4]
	ldr r4, =125
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =110
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r9, #20
	mul r8, r7, r9
	add r7, r4, r8
	mov r4, #4
	mov r9, #4
	mul r8, r4, r9
	add r4, r7, r8
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =31
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	ldr r8, =123
	sub r9, r4, r8
	mul r4, r6, r9
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r9, #20
	mul r8, r7, r9
	add r7, r4, r8
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =83
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =122
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =11
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =23
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	ldr r8, =47
	sub r9, r4, r8
	mul r4, r6, r9
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =32
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	ldr r8, =117
	sub r9, r4, r8
	mul r4, r6, r9
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =95
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =118
	mul r8, r7, r6
	add r6, r4, r8
	mov r0, r6
	bl relu_reg
	mov r4, r0
	ldr r6, =0
	ldr r7, =106
	sub r8, r6, r7
	mul r6, r4, r8
	add r4, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =8
	mul r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =82
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =104
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =101
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =116
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #0
	b .B2
.LTORG
.B2:
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =63
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =16
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =70
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =125
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =75
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =66
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =96
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =101
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =114
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =59
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =12
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =5
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =95
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =116
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =93
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =15
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #1
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r6, =79
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #2
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	ldr r7, [r5]
	ldr r5, =3
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =49
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =124
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	mov r0, r7
	bl relu_reg
	mov r5, r0
	ldr r6, =0
	ldr r7, =3
	sub r8, r6, r7
	mul r6, r5, r8
	add r5, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r4, =81
	mul r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =68
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =102
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	ldr r8, =74
	sub r9, r4, r8
	mul r4, r6, r9
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =121
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =15
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =55
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =101
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r9, #4
	mul r8, r4, r9
	add r4, r7, r8
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =13
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	ldr r8, =62
	sub r9, r4, r8
	mul r4, r6, r9
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =64
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =114
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =38
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =21
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =112
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =114
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	b .B3
.LTORG
.B3:
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =112
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =10
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	ldr r8, =16
	sub r9, r4, r8
	mul r4, r6, r9
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =50
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	ldr r8, =112
	sub r9, r4, r8
	mul r4, r6, r9
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r4, r8
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =116
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	ldr r8, =54
	sub r9, r4, r8
	mul r4, r6, r9
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =82
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =72
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	mov r0, r7
	bl relu_reg
	mov r4, r0
	ldr r6, =32
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #0
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	ldr r6, [r5]
	ldr r5, =15
	mul r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =77
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =66
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =90
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =6
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =30
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =8
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =81
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =2
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =110
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =95
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =59
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =52
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =15
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r6, =55
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =33
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r9, #20
	mul r8, r6, r9
	add r6, r5, r8
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =14
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =58
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =67
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =86
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =79
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =48
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =13
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #3
	mov r9, #4
	mul r8, r5, r9
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =15
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #4
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	ldr r7, [r5]
	ldr r5, =66
	mul r8, r7, r5
	add r5, r6, r8
	mov r0, r5
	bl relu_reg
	mov r5, r0
	ldr r6, =0
	ldr r7, =95
	sub r8, r6, r7
	mul r6, r5, r8
	add r5, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	b .B4
.LTORG
.B4:
	ldr r4, =33
	mul r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =82
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =67
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =30
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =2
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =65
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =120
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =13
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =18
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r6, =5
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =104
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =119
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	ldr r8, =7
	sub r9, r4, r8
	mul r4, r6, r9
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =71
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =107
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =24
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =82
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =96
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	ldr r8, =104
	sub r9, r4, r8
	mul r4, r6, r9
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =121
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =65
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =97
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =83
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =46
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =84
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	mov r0, r7
	bl relu_reg
	mov r4, r0
	ldr r6, =0
	ldr r7, =50
	sub r8, r6, r7
	mul r6, r4, r8
	add r4, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #0
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	ldr r6, [r5]
	ldr r5, =0
	ldr r7, =29
	sub r8, r5, r7
	mul r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =7
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #2
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =70
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =38
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =90
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =15
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =32
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #2
	mov r9, #4
	mul r8, r5, r9
	add r5, r6, r8
	ldr r6, [r5]
	ldr r5, =37
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r6, =36
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #4
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =62
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =125
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #1
	b .B5
.LTORG
.B5:
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =46
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =70
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =37
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =73
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r9, #20
	mul r8, r6, r9
	add r6, r5, r8
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =34
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #1
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =87
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #2
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =75
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =71
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =77
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =53
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =37
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #2
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =103
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r5, =0
	ldr r8, =13
	sub r9, r5, r8
	mul r5, r6, r9
	add r6, r7, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #4
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r5, =0
	ldr r8, =114
	sub r9, r5, r8
	mul r5, r7, r9
	add r7, r6, r5
	mov r0, r7
	bl relu_reg
	mov r5, r0
	ldr r6, =0
	ldr r7, =23
	sub r8, r6, r7
	mul r6, r5, r8
	add r5, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r4, =67
	mul r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =42
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =41
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =123
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	ldr r8, =92
	sub r9, r4, r8
	mul r4, r6, r9
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =10
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =77
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =75
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =96
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =51
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =109
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =74
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =0
	ldr r8, =7
	sub r9, r4, r8
	mul r4, r6, r9
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =0
	ldr r8, =122
	sub r9, r4, r8
	mul r4, r7, r9
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r9, #20
	mul r8, r6, r9
	add r6, r4, r8
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =67
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =47
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #1
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =22
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =68
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =38
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #4
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =29
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r4, r8
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r4, =115
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #1
	mov r8, #4
	mul r9, r6, r8
	b .B6
.LTORG
.B6:
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =121
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #2
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =36
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r6, =0
	ldr r8, =49
	sub r9, r6, r8
	mul r6, r7, r9
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #4
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r4, =85
	mul r8, r6, r4
	add r4, r7, r8
	mov r0, r4
	bl relu_reg
	mov r4, r0
	ldr r6, =46
	mul r7, r4, r6
	add r4, r5, r7
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L948
	b .L1702
	b .F7
.LTORG
.F7:
.L948:
	mov r0, #1
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .L949
.L949:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L1702:
	b .L949

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #112
.L1704:
	bl getint
	mov r10, r0
	str r10, [fp, #-112]
	b .L1707
.L1707:
	ldr r4, [fp, #-112]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L1708
	b .L1712
.L1708:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L1714
.L1709:
	mov r0, #0
	add sp, sp, #112
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L1712:
	b .L1709
.L1714:
	ldr r4, [fp, #-8]
	cmp r4, #5
	movlt r4, #1
	movge r4, #0
	blt .L1715
	b .L1719
.L1715:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L1721
.L1716:
	mov r4, #0
	mov r5, #-108
	mov r7, #20
	mul r6, r4, r7
	add r4, r5, r6
	add r5, fp, r4
	mov r0, r5
	bl model
	mov r4, r0
	cmp r4, #0
	bne .L1728
	b .L1732
.L1719:
	b .L1716
.L1721:
	ldr r4, [fp, #-4]
	cmp r4, #5
	movlt r4, #1
	movge r4, #0
	blt .L1722
	b .L1726
.L1722:
	bl getint
	mov r4, r0
	ldr r5, [fp, #-8]
	mov r6, #-108
	mov r7, #20
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L1721
.L1723:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L1714
.L1726:
	b .L1723
.L1728:
	mov r0, #99
	bl putch
	mov r0, #97
	bl putch
	mov r0, #116
	bl putch
	mov r0, #10
	bl putch
	b .L1730
.L1729:
	mov r0, #100
	bl putch
	mov r0, #111
	bl putch
	mov r0, #103
	bl putch
	mov r0, #10
	bl putch
	b .L1730
.L1730:
	ldr r4, [fp, #-112]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-112]
	b .L1707
.L1732:
	b .L1729


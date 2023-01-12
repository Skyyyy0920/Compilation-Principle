	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.comm map, 400, 4
	.comm indegree, 40, 4
	.comm queue, 40, 4
	.text
	.global topo
	.type topo , %function
topo:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L88:
	str r0, [fp, #-20]
	ldr r10, =0
	str r10, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =1
	str r4, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L94
.L94:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L95
	b .L99
.L95:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L100
.L96:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L127
.L97:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L98:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L99:
	b .L96
.L100:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L101
	b .L105
.L101:
	ldr r4, [fp, #-4]
	ldr r5, addr_indegree0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	cmp r4, #0
	beq .L106
	b .L111
.L102:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	ldr r6, addr_queue0
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-12]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-12]
	ldr r4, =0
	ldr r5, =1
	sub r6, r4, r5
	ldr r4, [fp, #-16]
	ldr r5, addr_indegree0
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	str r6, [r5]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L113
.L103:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L104:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L105:
	b .L102
.L106:
	ldr r4, [fp, #-4]
	str r4, [fp, #-16]
	b .L102
.L107:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L100
.L109:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L110:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L111:
	b .L107
.L112:
	b .L107
.L113:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L114
	b .L118
.L114:
	ldr r4, [fp, #-16]
	ldr r5, addr_map0
	mov r6, #40
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-4]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	cmp r5, #0
	bne .L119
	b .L124
.L115:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L94
.L116:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L117:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L118:
	b .L115
.L119:
	ldr r4, [fp, #-4]
	ldr r5, addr_indegree0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =1
	sub r6, r4, r5
	ldr r4, [fp, #-4]
	ldr r5, addr_indegree0
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	str r6, [r5]
	b .L120
.L120:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L113
.L123:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L124:
	b .L120
.L125:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L127:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L128
	b .L132
.L128:
	ldr r4, [fp, #-8]
	ldr r5, addr_queue0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L127
	b .F0
.LTORG
addr_map0:
	.word map
addr_indegree0:
	.word indegree
addr_queue0:
	.word queue
.F0:
.L129:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L130:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L131:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L132:
	b .L129

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L135:
	ldr r10, =1
	str r10, [fp, #-4]
	ldr r4, =5
	str r4, [fp, #-12]
	b .L139
.L139:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L140
	b .L144
.L140:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	b .L145
.L141:
	ldr r4, [fp, #-12]
	mov r0, r4
	bl topo
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L144:
	b .L141
.L145:
	ldr r4, [fp, #-8]
	cmp r4, #0
	bne .L146
	b .L150
.L146:
	ldr r4, [fp, #-4]
	ldr r5, addr_map1
	mov r6, #40
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, =1
	str r5, [r4]
	ldr r4, [fp, #-8]
	ldr r5, addr_indegree1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =1
	add r6, r4, r5
	ldr r4, [fp, #-8]
	ldr r5, addr_indegree1
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, r4
	str r6, [r5]
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	b .L145
.L147:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L139
.L150:
	b .L147

addr_map1:
	.word map
addr_indegree1:
	.word indegree
addr_queue1:
	.word queue

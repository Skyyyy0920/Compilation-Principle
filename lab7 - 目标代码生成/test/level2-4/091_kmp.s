	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global get_next
	.type get_next , %function
get_next:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L99:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r10, =0
	ldr r9, =1
	sub r8, r10, r9
	ldr r4, [fp, #-12]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	str r8, [r5]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L105
.L105:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	cmp r4, #0
	bne .L106
	b .L111
.L106:
	ldr r4, [fp, #-4]
	ldr r5, =0
	ldr r6, =1
	sub r7, r5, r6
	cmp r4, r7
	beq .L113
	b .L119
.L107:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L110:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L111:
	b .L107
.L112:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L113:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	b .L115
.L114:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	b .L115
.L115:
	b .L105
.L116:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	cmp r4, r5
	beq .L113
	b .L126
.L117:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L118:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L119:
	b .L116
.L124:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L125:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
.L126:
	b .L114

	.global KMP
	.type KMP , %function
KMP:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	ldr r4, =16400
	sub sp, sp, r4
.L131:
	ldr r10, =-16400
	str r0, [fp, r10]
	ldr r4, =-16396
	str r1, [fp, r4]
	ldr r5, =-16400
	ldr r4, [fp, r5]
	mov r5, #0
	ldr r6, =-16392
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	add r6, fp, r5
	mov r0, r4
	mov r1, r6
	bl get_next
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L138
.L138:
	ldr r5, =-16396
	ldr r4, [fp, r5]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	cmp r4, #0
	bne .L139
	b .L144
.L139:
	ldr r5, =-16400
	ldr r4, [fp, r5]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, =-16396
	ldr r5, [fp, r6]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	cmp r4, r5
	beq .L146
	b .L155
.L140:
	ldr r4, =0
	ldr r5, =1
	sub r6, r4, r5
	mov r0, r6
	ldr r1, =16400
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L144:
	b .L140
.L146:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	ldr r5, =-16400
	ldr r4, [fp, r5]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	bne .L156
	b .L162
.L147:
	ldr r4, [fp, #-8]
	ldr r5, =-16392
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =0
	ldr r6, =1
	sub r7, r5, r6
	cmp r4, r7
	beq .L165
	b .L169
.L148:
	b .L138
.L155:
	b .L147
.L156:
	ldr r4, [fp, #-4]
	mov r0, r4
	ldr r1, =16400
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
	b .L157
.L157:
	b .L148
.L162:
	b .L157
.L165:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L166
.L166:
	b .L148
.L169:
	b .L166

	.global read_str
	.type read_str , %function
read_str:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L171:
	str r0, [fp, #-8]
	ldr r10, =0
	str r10, [fp, #-4]
	b .L174
.L174:
	ldr r4, =1
	cmp r4, #0
	bne .L175
	b .L178
.L175:
	bl getch
	mov r4, r0
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, [r5]
	cmp r4, #10
	beq .L181
	b .L187
.L176:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L178:
	b .L176
.L181:
	b .L176
.L182:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L174
.L187:
	b .L182
.L188:
	b .L182

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	ldr r4, =32768
	sub sp, sp, r4
.L191:
	mov r10, #0
	ldr r9, =-32768
	mov r7, #4
	mul r8, r10, r7
	add r4, r9, r8
	add r5, fp, r4
	mov r0, r5
	bl read_str
	mov r4, r0
	mov r4, #0
	ldr r5, =-16384
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r0, r5
	bl read_str
	mov r4, r0
	mov r4, #0
	ldr r5, =-32768
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	add r5, fp, r4
	mov r4, #0
	ldr r6, =-16384
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	add r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl KMP
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	ldr r1, =32768
	add sp, sp, r1
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr


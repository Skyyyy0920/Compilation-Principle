


	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global ptr
	.align 4
	.size ptr, 4
ptr:
	.word 0
	.section .rodata
	.global TAPE_LEN
	.align 4
	.size TAPE_LEN, 4
TAPE_LEN:
	.word 65536
	.global BUFFER_LEN
	.align 4
	.size BUFFER_LEN, 4
BUFFER_LEN:
	.word 32768
	.comm tape, 262144, 4
	.comm program, 131072, 4
	.text
	.global read_program
	.type read_program , %function
read_program:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L94:
	ldr r10, =0
	str r10, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	b .L97
.L97:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L98
	b .L102
.L98:
	bl getch
	mov r4, r0
	ldr r5, [fp, #-8]
	ldr r6, addr_program0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L97
.L99:
	ldr r4, [fp, #-8]
	ldr r5, addr_program0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r5, r4
	ldr r4, =0
	str r4, [r5]
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L100:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L101:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L102:
	b .L99

	.global interpret
	.type interpret , %function
interpret:
	push {r4, r5, r6, r7, r8, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L104:
	str r0, [fp, #-16]
	ldr r10, =0
	str r10, [fp, #-4]
	b .L109
.L109:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	cmp r4, #0
	bne .L110
	b .L115
.L110:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	cmp r4, #62
	beq .L119
	b .L124
.L111:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L114:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L115:
	b .L111
.L116:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L119:
	ldr r4, addr_ptr0
	ldr r5, [r4]
	ldr r4, =1
	add r6, r5, r4
	ldr r4, addr_ptr0
	str r6, [r4]
	b .L121
.L120:
	ldr r4, [fp, #-12]
	cmp r4, #60
	beq .L125
	b .L130
.L121:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L109
.L122:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L123:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L124:
	b .L120
.L125:
	ldr r4, addr_ptr0
	ldr r5, [r4]
	ldr r4, =1
	sub r6, r5, r4
	ldr r4, addr_ptr0
	str r6, [r4]
	b .L127
.L126:
	ldr r4, [fp, #-12]
	cmp r4, #43
	beq .L131
	b .L136
.L127:
	b .L121
.L128:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L129:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L130:
	b .L126
.L131:
	ldr r4, addr_ptr0
	ldr r5, [r4]
	ldr r4, addr_tape0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =1
	add r6, r5, r4
	ldr r4, addr_ptr0
	ldr r5, [r4]
	ldr r4, addr_tape0
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, r5
	str r6, [r4]
	b .L133
.L132:
	ldr r4, [fp, #-12]
	cmp r4, #45
	beq .L138
	b .L143
.L133:
	b .L127
.L134:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L135:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L136:
	b .L132
.L138:
	ldr r4, addr_ptr0
	ldr r5, [r4]
	ldr r4, addr_tape0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =1
	sub r6, r5, r4
	ldr r4, addr_ptr0
	ldr r5, [r4]
	ldr r4, addr_tape0
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, r5
	str r6, [r4]
	b .L140
.L139:
	ldr r4, [fp, #-12]
	cmp r4, #46
	beq .L145
	b .L150
.L140:
	b .L133
.L141:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L142:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L143:
	b .L139
.L145:
	ldr r4, addr_ptr0
	ldr r5, [r4]
	ldr r4, addr_tape0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	mov r0, r5
	bl putch
	b .L147
.L146:
	ldr r4, [fp, #-12]
	cmp r4, #44
	beq .L152
	b .L157
.L147:
	b .L140
.L148:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L149:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L150:
	b .L146
.L152:
	bl getch
	mov r4, r0
	ldr r5, addr_ptr0
	ldr r6, [r5]
	ldr r5, addr_tape0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, r6
	str r4, [r5]
	b .L154
.L153:
	ldr r4, [fp, #-12]
	cmp r4, #93
	beq .L160
	b .L163
	b .F0
.LTORG
addr_TAPE_LEN0:
	.word TAPE_LEN
addr_BUFFER_LEN0:
	.word BUFFER_LEN
addr_tape0:
	.word tape
addr_program0:
	.word program
addr_ptr0:
	.word ptr
.F0:
.L154:
	b .L147
.L155:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L156:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L157:
	b .L153
.L158:
	ldr r4, =1
	str r4, [fp, #-8]
	b .L168
.L159:
	b .L154
.L160:
	ldr r4, addr_ptr1
	ldr r5, [r4]
	ldr r4, addr_tape1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	cmp r5, #0
	bne .L158
	b .L166
.L161:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L162:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L163:
	b .L159
.L165:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L166:
	b .L159
.L167:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L168:
	ldr r4, [fp, #-8]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L169
	b .L173
.L169:
	ldr r4, [fp, #-4]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	cmp r4, #91
	beq .L176
	b .L181
.L170:
	b .L159
.L171:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L172:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L173:
	b .L170
.L176:
	ldr r4, [fp, #-8]
	ldr r5, =1
	sub r6, r4, r5
	str r6, [fp, #-8]
	b .L178
.L177:
	ldr r4, [fp, #-12]
	cmp r4, #93
	beq .L182
	b .L186
.L178:
	b .L168
.L179:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L180:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L181:
	b .L177
.L182:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add r6, r4, r5
	str r6, [fp, #-8]
	b .L183
.L183:
	b .L178
.L184:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L185:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r10, fp, lr}
	bx lr
.L186:
	b .L183

	.global main
	.type main , %function
main:
	push {r4, r5, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L188:
	bl read_program
	mov r10, #0
	ldr r9, addr_program1
	mov r8, #4
	mul r7, r10, r8
	add r4, r9, r7
	mov r5, r4
	mov r0, r5
	bl interpret
	mov r0, #0
	add sp, sp, #0
	pop {r4, r5, r7, r8, r9, r10, fp, lr}
	bx lr

addr_TAPE_LEN1:
	.word TAPE_LEN
addr_BUFFER_LEN1:
	.word BUFFER_LEN
addr_tape1:
	.word tape
addr_program1:
	.word program
addr_ptr1:
	.word ptr

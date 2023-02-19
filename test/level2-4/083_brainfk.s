	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global BUFFER_LEN
	.align 4
	.size BUFFER_LEN, 4
BUFFER_LEN:
	.word 32768
	.global TAPE_LEN
	.align 4
	.size TAPE_LEN, 4
TAPE_LEN:
	.word 65536
	.comm program, 131072, 4
	.global ptr
	.align 4
	.size ptr, 4
ptr:
	.word 0
	.comm tape, 262144, 4
	.text
	.global read_program
	.type read_program , %function
read_program:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L27:
	ldr r4, =0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	b .L30
.L30:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L31
	b .L36
.L31:
	bl getch
	mov r5, r0
	ldr r4, [fp, #-8]
	mov r7, #4
	mul r6, r4, r7
	ldr r7, addr_program_0
	add r4, r7, r6
	str r5, [r4]
	ldr r5, [fp, #-8]
	add r6, r5, #1
	str r6, [fp, #-8]
	b .L30
.L32:
	ldr r4, [fp, #-8]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_program_0
	add r4, r5, r6
	ldr r6, =0
	str r6, [r4]
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L35:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L36:
	b .L32
.L37:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global interpret
	.type interpret , %function
interpret:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L45:
	str r0, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L52
.L52:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	cmp r5, #0
	movne r5, #1
	moveq r5, #0
	bne .L53
	b .L62
.L53:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	str r5, [fp, #-12]
	ldr r5, [fp, #-12]
	cmp r5, #62
	moveq r4, #1
	movne r4, #0
	beq .L69
	b .L74
.L54:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L61:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L62:
	b .L54
.L63:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L69:
	ldr r5, addr_ptr_0
	ldr r4, [r5]
	add r5, r4, #1
	ldr r4, addr_ptr_0
	str r5, [r4]
	b .L71
.L70:
	ldr r5, [fp, #-12]
	cmp r5, #60
	moveq r4, #1
	movne r4, #0
	beq .L77
	b .L82
.L71:
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L52
.L73:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L74:
	b .L70
.L75:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L77:
	ldr r5, addr_ptr_0
	ldr r4, [r5]
	sub r5, r4, #1
	ldr r4, addr_ptr_0
	str r5, [r4]
	b .L79
.L78:
	ldr r5, [fp, #-12]
	cmp r5, #43
	moveq r4, #1
	movne r4, #0
	beq .L85
	b .L90
.L79:
	b .L71
.L81:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L82:
	b .L78
.L83:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L85:
	ldr r5, addr_ptr_0
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_tape_0
	add r4, r5, r6
	ldr r6, [r4]
	add r5, r6, #1
	ldr r4, addr_ptr_0
	ldr r6, [r4]
	mov r4, #4
	mul r7, r6, r4
	ldr r4, addr_tape_0
	add r6, r4, r7
	str r5, [r6]
	b .L87
.L86:
	ldr r6, [fp, #-12]
	cmp r6, #45
	moveq r4, #1
	movne r4, #0
	beq .L99
	b .L104
.L87:
	b .L79
.L89:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L90:
	b .L86
.L91:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L99:
	ldr r5, addr_ptr_0
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_tape_0
	add r4, r5, r6
	ldr r6, [r4]
	sub r5, r6, #1
	ldr r4, addr_ptr_0
	ldr r6, [r4]
	mov r4, #4
	mul r7, r6, r4
	ldr r4, addr_tape_0
	add r6, r4, r7
	str r5, [r6]
	b .L101
.L100:
	ldr r6, [fp, #-12]
	cmp r6, #46
	moveq r4, #1
	movne r4, #0
	beq .L113
	b .L118
.L101:
	b .L87
.L103:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L104:
	b .L100
.L105:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L113:
	ldr r5, addr_ptr_0
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_tape_0
	add r4, r5, r6
	ldr r6, [r4]
	mov r0, r6
	bl putch
	b .L115
.L114:
	ldr r5, [fp, #-12]
	cmp r5, #44
	moveq r4, #1
	movne r4, #0
	beq .L124
	b .L129
.L115:
	b .L101
.L117:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L118:
	b .L114
.L119:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	b .F0
.LTORG
addr_BUFFER_LEN_0:
	.word BUFFER_LEN
addr_TAPE_LEN_0:
	.word TAPE_LEN
addr_program_0:
	.word program
addr_ptr_0:
	.word ptr
addr_tape_0:
	.word tape
.F0:
.L124:
	bl getch
	mov r5, r0
	ldr r4, addr_ptr_1
	ldr r6, [r4]
	mov r4, #4
	mul r7, r6, r4
	ldr r4, addr_tape_1
	add r6, r4, r7
	str r5, [r6]
	b .L126
.L125:
	ldr r4, [fp, #-12]
	cmp r4, #93
	moveq r4, #1
	movne r4, #0
	beq .L136
	b .L139
.L126:
	b .L115
.L128:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L129:
	b .L125
.L130:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L134:
	ldr r5, =1
	str r5, [fp, #-8]
	b .L149
.L135:
	b .L126
.L136:
	ldr r4, addr_ptr_1
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_tape_1
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #0
	movne r4, #1
	moveq r4, #0
	bne .L134
	b .L147
.L138:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L139:
	b .L135
.L140:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L146:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L147:
	b .L135
.L148:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L149:
	ldr r5, [fp, #-8]
	cmp r5, #0
	movgt r4, #1
	movle r4, #0
	bgt .L150
	b .L154
.L150:
	ldr r5, [fp, #-4]
	sub r4, r5, #1
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	cmp r4, #91
	moveq r5, #1
	movne r5, #0
	beq .L162
	b .L167
.L151:
	b .L135
.L153:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L154:
	b .L151
.L155:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L162:
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L164
.L163:
	ldr r4, [fp, #-12]
	cmp r4, #93
	moveq r5, #1
	movne r5, #0
	beq .L170
	b .L174
.L164:
	b .L149
.L166:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L167:
	b .L163
.L168:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L170:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L171
.L171:
	b .L164
.L173:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L174:
	b .L171
.L175:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L178:
	bl read_program
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_program_1
	add r4, r5, r6
	mov r0, r4
	bl interpret
	mov r0, #0
	add sp, sp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

addr_BUFFER_LEN_1:
	.word BUFFER_LEN
addr_TAPE_LEN_1:
	.word TAPE_LEN
addr_program_1:
	.word program
addr_ptr_1:
	.word ptr
addr_tape_1:
	.word tape

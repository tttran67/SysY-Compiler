	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global get_next
	.type get_next , %function
get_next:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L26:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, =0
	sub r5, r4, #1
	ldr r4, [fp, #-12]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	str r5, [r6]
	ldr r5, =0
	str r5, [fp, #-8]
	ldr r4, =0
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L38
.L38:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	cmp r5, #0
	movne r5, #1
	moveq r5, #0
	bne .L39
	b .L48
.L39:
	ldr r4, [fp, #-4]
	ldr r5, =0
	sub r6, r5, #1
	cmp r4, r6
	moveq r4, #1
	movne r4, #0
	beq .L50
	b .L56
.L40:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L47:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L48:
	b .L40
.L49:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L50:
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r6, [fp, #-12]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	str r5, [r4]
	b .L52
.L51:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	str r5, [fp, #-4]
	b .L52
.L52:
	b .L38
.L53:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	ldr r5, [fp, #-16]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	moveq r5, #1
	movne r5, #0
	beq .L50
	b .L69
.L55:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L56:
	b .L53
.L57:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L68:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L69:
	b .L51
.L70:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global KMP
	.type KMP , %function
KMP:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	ldr r4, =16400
	sub sp, sp, r4
.L83:
	ldr r4, =-16400
	str r0, [fp, r4]
	ldr r4, =-16396
	str r1, [fp, r4]
	ldr r5, =-16400
	ldr r4, [fp, r5]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	ldr r5, =-16392
	add r6, fp, r5
	add r5, r6, r7
	mov r0, r4
	mov r1, r5
	bl get_next
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L97
.L97:
	ldr r5, [fp, #-4]
	ldr r6, =-16396
	ldr r4, [fp, r6]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L98
	b .L107
.L98:
	ldr r5, [fp, #-8]
	ldr r6, =-16400
	ldr r4, [fp, r6]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	ldr r7, =-16396
	ldr r5, [fp, r7]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	moveq r5, #1
	movne r5, #0
	beq .L109
	b .L123
.L99:
	ldr r5, =0
	sub r4, r5, #1
	mov r0, r4
	ldr r2, =16400
	add sp, sp, r2
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L106:
.L107:
	b .L99
.L108:
.L109:
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, =-16400
	ldr r4, [fp, r6]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	beq .L127
	b .L135
.L110:
	ldr r5, [fp, #-8]
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-16392
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	str r6, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r4, =0
	sub r6, r4, #1
	cmp r5, r6
	moveq r5, #1
	movne r5, #0
	beq .L142
	b .L146
.L111:
	b .L97
.L122:
.L123:
	b .L110
.L124:
.L127:
	ldr r4, [fp, #-4]
	mov r0, r4
	ldr r2, =16400
	add sp, sp, r2
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L128:
	b .L111
.L134:
.L135:
	b .L128
.L136:
.L142:
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L143
.L143:
	b .L111
.L145:
.L146:
	b .L143
.L147:
	.global read_str
	.type read_str , %function
read_str:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L150:
	str r0, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L155
.L155:
	ldr r4, =1
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L156
	b .L160
.L156:
	bl getch
	mov r4, r0
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	cmp r5, #10
	moveq r5, #1
	movne r5, #0
	beq .L166
	b .L174
.L157:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, =0
	str r5, [r4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L159:
.L160:
	b .L157
.L161:
.L166:
	b .L157
.L167:
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L155
.L173:
.L174:
	b .L167
.L175:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	ldr r4, =32768
	sub sp, sp, r4
.L182:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-32768
	add r5, fp, r4
	add r4, r5, r6
	mov r0, r4
	bl read_str
	mov r4, r0
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-16384
	add r5, fp, r5
	add r4, r5, r6
	mov r0, r4
	bl read_str
	mov r4, r0
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-32768
	add r5, fp, r5
	add r4, r5, r6
	mov r6, #0
	mov r5, #4
	mul r7, r6, r5
	ldr r6, =-16384
	add r6, fp, r6
	add r5, r6, r7
	mov r0, r4
	mov r1, r5
	bl KMP
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	ldr r2, =32768
	add sp, sp, r2
	pop {r4, r5, r6, r7, fp, lr}
	bx lr


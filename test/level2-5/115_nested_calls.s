	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global func1
	.type func1 , %function
func1:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L54:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	beq .L61
	b .L66
.L61:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	mul r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L62:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	sub r7, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, #0
	bl func1
	mov r4, r0
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L63:
.L65:
.L66:
	b .L62
.L67:
	.global func2
	.type func2 , %function
func2:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L73:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L78
	b .L84
.L78:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	mov r0, r6
	mov r1, #0
	bl func2
	mov r4, r0
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr

.L79:
	ldr r5, [fp, #-8]
	mov r0, r5
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr

.L80:
.L83:
.L84:
	b .L79
.L85:
	.global func3
	.type func3 , %function
func3:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L89:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	beq .L94
	b .L99
.L94:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	mov r0, r5
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr

.L95:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	mov r0, r6
	mov r1, #0
	bl func3
	mov r4, r0
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr

.L96:
.L98:
.L99:
	b .L95
.L100:
	.global func4
	.type func4 , %function
func4:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L104:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r4, [fp, #-12]
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L111
	b .L117
.L111:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #12
	pop {r4, fp, lr}
	bx lr

.L112:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #12
	pop {r4, fp, lr}
	bx lr

.L113:
.L116:
.L117:
	b .L112
.L118:
	.global func5
	.type func5 , %function
func5:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L121:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =0
	sub r6, r5, r4
	mov r0, r6
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global func6
	.type func6 , %function
func6:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L125:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L133
	b .L137
.L130:
	mov r0, #1
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr

.L131:
	mov r0, #0
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr

.L132:
.L133:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L130
	b .L142
.L136:
.L137:
	b .L131
.L138:
.L141:
.L142:
	b .L131
.L143:
	.global func7
	.type func7 , %function
func7:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L144:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	beq .L147
	b .L152
.L147:
	mov r0, #1
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L148:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L149:
.L151:
.L152:
	b .L148
.L153:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #68
.L154:
	bl getint
	mov r4, r0
	str r4, [fp, #-64]
	bl getint
	mov r4, r0
	str r4, [fp, #-60]
	bl getint
	mov r4, r0
	str r4, [fp, #-56]
	bl getint
	mov r4, r0
	str r4, [fp, #-52]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L161
.L161:
	ldr r4, [fp, #-8]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L162
	b .L166
.L162:
	bl getint
	mov r4, r0
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-48
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L161
.L163:
	ldr r5, [fp, #-64]
	mov r0, r5
	bl func7
	mov r4, r0
	ldr r5, [fp, #-60]
	mov r0, r5
	bl func5
	mov r5, r0
	mov r0, r4
	mov r1, r5
	bl func6
	mov r4, r0
	ldr r5, [fp, #-56]
	mov r0, r4
	mov r1, r5
	bl func2
	mov r4, r0
	ldr r5, [fp, #-52]
	mov r0, r4
	mov r1, r5
	bl func3
	mov r4, r0
	mov r0, r4
	bl func5
	mov r5, r0
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	mov r4, #-48
	add r4, fp, r4
	add r6, r4, r7
	ldr r7, [r6]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	mov r4, #-48
	add r8, fp, r4
	add r4, r8, r6
	ldr r6, [r4]
	mov r0, r6
	bl func5
	mov r6, r0
	mov r4, #2
	mov r4, #4
	mov r8, r4, LSL#1
	mov r4, #-48
	add r9, fp, r4
	add r4, r9, r8
	ldr r8, [r4]
	mov r9, #3
	mov r10, #4
	mul r4, r9, r10
	mov r9, #-48
	add r9, fp, r9
	add r10, r9, r4
	ldr r4, [r10]
	mov r0, r4
	bl func7
	mov r4, r0
	mov r0, r8
	mov r1, r4
	bl func6
	mov r4, r0
	mov r8, #4
	mov r8, #4
	mov r9, r8, LSL#2
	mov r8, #-48
	add r10, fp, r8
	add r8, r10, r9
	ldr r8, [r8]
	str r8, [fp, #-68]
	mov r9, #5
	mov r8, #4
	mul r10, r9, r8
	mov r9, #-48
	add r8, fp, r9
	add r9, r8, r10
	ldr r8, [r9]
	mov r0, r8
	bl func7
	mov r8, r0
	ldr r9, [fp, #-68]
	mov r0, r9
	mov r1, r8
	bl func2
	mov r8, r0
	mov r0, r6
	mov r1, r4
	mov r2, r8
	bl func4
	mov r6, r0
	mov r4, #6
	mov r8, #4
	mul r9, r4, r8
	mov r4, #-48
	add r4, fp, r4
	add r8, r4, r9
	ldr r9, [r8]
	mov r0, r6
	mov r1, r9
	bl func3
	mov r4, r0
	mov r6, #7
	mov r8, #4
	mul r9, r6, r8
	mov r6, #-48
	add r6, fp, r6
	add r8, r6, r9
	ldr r9, [r8]
	mov r0, r4
	mov r1, r9
	bl func2
	mov r4, r0
	mov r6, #8
	mov r6, #4
	mov r8, r6, LSL#3
	mov r6, #-48
	add r9, fp, r6
	add r6, r9, r8
	ldr r8, [r6]
	mov r9, #9
	mov r10, #4
	mul r6, r9, r10
	mov r9, #-48
	add r10, fp, r9
	add r9, r10, r6
	ldr r10, [r9]
	mov r0, r10
	bl func7
	mov r6, r0
	mov r0, r8
	mov r1, r6
	bl func3
	mov r6, r0
	ldr r8, [fp, #-64]
	mov r0, r4
	mov r1, r6
	mov r2, r8
	bl func1
	mov r4, r0
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl func4
	mov r5, r0
	ldr r6, [fp, #-60]
	ldr r4, [fp, #-56]
	mov r0, r4
	bl func7
	mov r4, r0
	ldr r7, [fp, #-52]
	mov r0, r4
	mov r1, r7
	bl func3
	mov r4, r0
	mov r0, r6
	mov r1, r4
	bl func2
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func3
	mov r4, r0
	mov r5, #0
	mov r7, #4
	mul r6, r5, r7
	mov r5, #-48
	add r7, fp, r5
	add r5, r7, r6
	ldr r7, [r5]
	mov r6, #1
	mov r5, #4
	mov r6, r5, LSL#0
	mov r5, #-48
	add r8, fp, r5
	add r5, r8, r6
	ldr r6, [r5]
	mov r0, r4
	mov r1, r7
	mov r2, r6
	bl func1
	mov r4, r0
	mov r6, #2
	mov r6, #4
	mov r5, r6, LSL#1
	mov r6, #-48
	add r6, fp, r6
	add r7, r6, r5
	ldr r5, [r7]
	mov r0, r4
	mov r1, r5
	bl func2
	mov r4, r0
	mov r6, #3
	mov r5, #4
	mul r7, r6, r5
	mov r6, #-48
	add r6, fp, r6
	add r5, r6, r7
	ldr r7, [r5]
	mov r6, #4
	mov r6, #4
	mov r5, r6, LSL#2
	mov r6, #-48
	add r8, fp, r6
	add r6, r8, r5
	ldr r5, [r6]
	mov r8, #5
	mov r6, #4
	mul r9, r8, r6
	mov r8, #-48
	add r8, fp, r8
	add r6, r8, r9
	ldr r9, [r6]
	mov r0, r9
	bl func5
	mov r8, r0
	mov r0, r5
	mov r1, r8
	bl func3
	mov r6, r0
	mov r5, #6
	mov r9, #4
	mul r8, r5, r9
	mov r5, #-48
	add r5, fp, r5
	add r9, r5, r8
	ldr r8, [r9]
	mov r0, r8
	bl func5
	mov r5, r0
	mov r0, r6
	mov r1, r5
	bl func2
	mov r5, r0
	mov r6, #7
	mov r8, #4
	mul r9, r6, r8
	mov r6, #-48
	add r6, fp, r6
	add r8, r6, r9
	ldr r9, [r8]
	mov r6, #8
	mov r6, #4
	mov r8, r6, LSL#3
	mov r6, #-48
	add r6, fp, r6
	add r10, r6, r8
	ldr r8, [r10]
	mov r0, r8
	bl func7
	mov r6, r0
	mov r0, r5
	mov r1, r9
	mov r2, r6
	bl func1
	mov r5, r0
	mov r8, #9
	mov r9, #4
	mul r6, r8, r9
	mov r8, #-48
	add r9, fp, r8
	add r8, r9, r6
	ldr r9, [r8]
	mov r0, r9
	bl func5
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func2
	mov r6, r0
	ldr r5, [fp, #-64]
	mov r0, r6
	mov r1, r5
	bl func3
	mov r6, r0
	mov r0, r4
	mov r1, r7
	mov r2, r6
	bl func1
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #68
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	b .F0
.LTORG
.F0:
.L165:
.L166:
	b .L163
.L167:

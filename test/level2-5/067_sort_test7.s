	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.comm buf, 800, 4
	.text
	.global merge_sort
	.type merge_sort , %function
merge_sort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L24:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	ldr r4, [fp, #-24]
	add r5, r4, #1
	ldr r4, [fp, #-20]
	cmp r5, r4
	movge r5, #1
	movlt r5, #0
	bge .L29
	b .L34
.L29:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L30:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	add r6, r4, r5
	ldr r4, =2
	sdiv r5, r6, r4
	str r5, [fp, #-16]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-16]
	mov r0, r4
	mov r1, r5
	bl merge_sort
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-20]
	mov r0, r4
	mov r1, r5
	bl merge_sort
	ldr r4, [fp, #-24]
	str r4, [fp, #-12]
	ldr r5, [fp, #-16]
	str r5, [fp, #-8]
	ldr r4, [fp, #-24]
	str r4, [fp, #-4]
	b .L49
.L33:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L34:
	b .L30
.L35:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L49:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-16]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L52
	b .L56
.L50:
	mov r4, #0
	ldr r6, =400
	mul r5, r4, r6
	ldr r6, addr_buf_0
	add r4, r6, r5
	ldr r5, [fp, #-12]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r6, #0
	ldr r5, =400
	mul r7, r6, r5
	ldr r5, addr_buf_0
	add r6, r5, r7
	ldr r7, [fp, #-8]
	mov r5, #4
	mul r8, r7, r5
	add r7, r6, r8
	ldr r5, [r7]
	cmp r4, r5
	movlt r5, #1
	movge r5, #0
	blt .L63
	b .L77
.L51:
	b .L100
.L52:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-20]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L50
	b .L61
.L55:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L56:
	b .L51
.L57:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L60:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L61:
	b .L51
.L62:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L63:
	mov r4, #0
	ldr r5, =400
	mul r6, r4, r5
	ldr r5, addr_buf_0
	add r4, r5, r6
	ldr r6, [fp, #-12]
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, [r6]
	mov r5, #1
	ldr r5, =400
	mov r6, r5, LSL#0
	ldr r7, addr_buf_0
	add r5, r7, r6
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-12]
	add r6, r4, #1
	str r6, [fp, #-12]
	b .L65
.L64:
	mov r5, #0
	ldr r4, =400
	mul r6, r5, r4
	ldr r4, addr_buf_0
	add r5, r4, r6
	ldr r6, [fp, #-8]
	mov r4, #4
	mul r7, r6, r4
	add r6, r5, r7
	ldr r4, [r6]
	mov r5, #1
	ldr r5, =400
	mov r6, r5, LSL#0
	ldr r7, addr_buf_0
	add r5, r7, r6
	ldr r6, [fp, #-4]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-8]
	add r6, r4, #1
	str r6, [fp, #-8]
	b .L65
.L65:
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L49
.L76:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L77:
	b .L64
.L78:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L100:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-16]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L101
	b .L106
	b .F0
.LTORG
addr_buf_0:
	.word buf
.F0:
.L101:
	mov r4, #0
	ldr r6, =400
	mul r5, r4, r6
	ldr r4, addr_buf_1
	add r6, r4, r5
	ldr r4, [fp, #-12]
	mov r5, #4
	mul r7, r4, r5
	add r4, r6, r7
	ldr r5, [r4]
	mov r6, #1
	ldr r6, =400
	mov r4, r6, LSL#0
	ldr r7, addr_buf_1
	add r6, r7, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	str r5, [r4]
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L100
.L102:
	b .L119
.L105:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L106:
	b .L102
.L107:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L119:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-20]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L120
	b .L125
.L120:
	mov r4, #0
	ldr r5, =400
	mul r6, r4, r5
	ldr r5, addr_buf_1
	add r4, r5, r6
	ldr r6, [fp, #-8]
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, [r6]
	mov r5, #1
	ldr r5, =400
	mov r6, r5, LSL#0
	ldr r7, addr_buf_1
	add r5, r7, r6
	ldr r6, [fp, #-4]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-8]
	add r6, r4, #1
	str r6, [fp, #-8]
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L119
.L121:
	b .L138
.L124:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L125:
	b .L121
.L126:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L138:
	ldr r5, [fp, #-24]
	ldr r4, [fp, #-20]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L139
	b .L144
.L139:
	mov r4, #1
	ldr r5, =400
	mov r4, r5, LSL#0
	ldr r6, addr_buf_1
	add r5, r6, r4
	ldr r4, [fp, #-24]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	mov r6, #0
	ldr r4, =400
	mul r7, r6, r4
	ldr r4, addr_buf_1
	add r6, r4, r7
	ldr r7, [fp, #-24]
	mov r4, #4
	mul r8, r7, r4
	add r7, r6, r8
	str r5, [r7]
	ldr r4, [fp, #-24]
	add r5, r4, #1
	str r5, [fp, #-24]
	b .L138
.L140:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L143:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L144:
	b .L140
.L145:
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L156:
	mov r4, #0
	ldr r5, =400
	mul r6, r4, r5
	ldr r4, addr_buf_1
	add r5, r4, r6
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	mov r0, r4
	bl getarray
	mov r5, r0
	str r5, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, #0
	mov r1, r5
	bl merge_sort
	ldr r4, [fp, #-4]
	mov r5, #0
	ldr r6, =400
	mul r7, r5, r6
	ldr r6, addr_buf_1
	add r5, r6, r7
	mov r7, #0
	mov r6, #4
	mul r8, r7, r6
	add r7, r5, r8
	mov r0, r4
	mov r1, r7
	bl putarray
	mov r4, r0
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

addr_buf_1:
	.word buf

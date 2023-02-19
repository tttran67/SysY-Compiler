	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global b
	.align 4
	.size b, 4
b:
	.word 5
	.global c
	.align 4
	.size c, 16
c:
	.word 6
	.word 7
	.word 8
	.word 9
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #220
.L19:
	ldr r4, =1
	str r4, [fp, #-220]
	ldr r4, =2
	str r4, [fp, #-216]
	ldr r4, =3
	str r4, [fp, #-216]
	ldr r4, [fp, #-216]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-216]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-220]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	b .L25
.L25:
	ldr r4, [fp, #-220]
	cmp r4, #5
	movlt r4, #1
	movge r4, #0
	blt .L26
	b .L30
.L26:
	ldr r4, =0
	str r4, [fp, #-212]
	ldr r4, [fp, #-212]
	add r5, r4, #1
	str r5, [fp, #-212]
	ldr r4, [fp, #-212]
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L34
	b .L39
.L27:
	ldr r4, [fp, #-220]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r5, #2
	mov r4, #4
	mov r5, r4, LSL#1
	ldr r6, addr_c_0
	add r4, r6, r5
	ldr r5, =1
	str r5, [r4]
	mov r4, #0
	mov r5, #32
	mul r6, r4, r5
	mov r4, #-208
	add r5, fp, r4
	add r4, r5, r6
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, =0
	str r4, [r5]
	mov r6, #0
	mov r4, #32
	mul r7, r6, r4
	mov r6, #-208
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =9
	str r4, [r6]
	mov r5, #0
	mov r4, #32
	mul r7, r5, r4
	mov r5, #-208
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #0
	mov r4, #32
	mul r7, r6, r4
	mov r6, #-208
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #0
	mov r4, #32
	mul r7, r5, r4
	mov r5, #-208
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #0
	mov r4, #32
	mul r7, r6, r4
	mov r6, #-208
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #0
	mov r6, #32
	mul r7, r5, r6
	mov r5, #-208
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #0
	mov r5, #32
	mul r7, r4, r5
	mov r4, #-208
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #1
	mov r4, #32
	mov r6, r4, LSL#0
	mov r4, #-208
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =8
	str r5, [r6]
	mov r4, #1
	mov r4, #32
	mov r5, r4, LSL#0
	mov r4, #-208
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =3
	str r6, [r5]
	mov r4, #1
	mov r4, #32
	mov r6, r4, LSL#0
	mov r4, #-208
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #1
	mov r4, #32
	mov r5, r4, LSL#0
	mov r4, #-208
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #1
	mov r6, #32
	mov r4, r6, LSL#0
	mov r6, #-208
	add r6, fp, r6
	add r6, r6, r4
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #1
	mov r5, #32
	mov r6, r5, LSL#0
	mov r5, #-208
	add r5, fp, r5
	add r5, r5, r6
	add r6, r4, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #1
	mov r4, #32
	mov r5, r4, LSL#0
	mov r4, #-208
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #1
	mov r4, #32
	mov r6, r4, LSL#0
	mov r4, #-208
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	ldr r4, =2
	str r4, [fp, #-144]
	mov r5, #2
	mov r4, #4
	mov r5, r4, LSL#1
	ldr r6, addr_c_0
	add r4, r6, r5
	ldr r5, [r4]
	cmp r5, #0
	movne r5, #1
	moveq r5, #0
	bne .L78
	b .L85
	b .F0
.LTORG
addr_b_0:
	.word b
addr_c_0:
	.word c
.F0:
.L29:
.L30:
	b .L27
.L31:
.L34:
	b .L27
.L35:
	b .L25
.L38:
.L39:
	b .L35
.L40:
.L78:
	mov r4, #0
	mov r6, #20
	mul r5, r4, r6
	mov r4, #-140
	add r6, fp, r4
	add r4, r6, r5
	mov r6, #0
	mov r5, #20
	mul r7, r6, r5
	add r6, r4, r7
	mov r4, #0
	mov r7, #4
	mul r5, r4, r7
	add r4, r6, r5
	ldr r6, =0
	str r6, [r4]
	mov r5, #0
	mov r6, #20
	mul r7, r5, r6
	mov r5, #-140
	add r5, fp, r5
	add r6, r5, r7
	mov r7, #0
	mov r5, #20
	mul r8, r7, r5
	add r7, r6, r8
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #0
	mov r6, #20
	mul r7, r4, r6
	mov r4, #-140
	add r4, fp, r4
	add r6, r4, r7
	mov r7, #0
	mov r4, #20
	mul r8, r7, r4
	add r7, r6, r8
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #0
	mov r6, #20
	mul r7, r5, r6
	mov r5, #-140
	add r6, fp, r5
	add r5, r6, r7
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #0
	mov r6, #20
	mul r7, r4, r6
	mov r4, #-140
	add r6, fp, r4
	add r4, r6, r7
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #1
	mov r5, #20
	mov r6, r5, LSL#0
	mov r5, #-140
	add r7, fp, r5
	add r5, r7, r6
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #1
	mov r4, #20
	mov r6, r4, LSL#0
	mov r4, #-140
	add r7, fp, r4
	add r4, r7, r6
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #1
	mov r5, #20
	mov r6, r5, LSL#0
	mov r5, #-140
	add r7, fp, r5
	add r5, r7, r6
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #1
	mov r6, #20
	mov r4, r6, LSL#0
	mov r6, #-140
	add r7, fp, r6
	add r6, r7, r4
	mov r4, #0
	mov r7, #20
	mul r8, r4, r7
	add r4, r6, r8
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #1
	mov r4, #20
	mov r5, r4, LSL#0
	mov r4, #-140
	add r7, fp, r4
	add r4, r7, r5
	mov r5, #0
	mov r8, #20
	mul r7, r5, r8
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #2
	mov r6, #20
	mov r5, r6, LSL#1
	mov r6, #-140
	add r6, fp, r6
	add r7, r6, r5
	mov r5, #0
	mov r6, #20
	mul r8, r5, r6
	add r5, r7, r8
	add r6, r4, #4
	ldr r4, =2
	str r4, [r6]
	mov r5, #2
	mov r4, #20
	mov r5, r4, LSL#1
	mov r4, #-140
	add r4, fp, r4
	add r7, r4, r5
	mov r5, #0
	mov r8, #20
	mul r4, r5, r8
	add r5, r7, r4
	add r7, r6, #4
	ldr r5, =1
	str r5, [r7]
	mov r4, #2
	mov r4, #20
	mov r5, r4, LSL#1
	mov r4, #-140
	add r6, fp, r4
	add r4, r6, r5
	mov r5, #0
	mov r6, #20
	mul r8, r5, r6
	add r5, r4, r8
	add r4, r7, #4
	ldr r5, =8
	str r5, [r4]
	mov r6, #2
	mov r5, #20
	mov r6, r5, LSL#1
	mov r5, #-140
	add r7, fp, r5
	add r5, r7, r6
	mov r6, #0
	mov r8, #20
	mul r7, r6, r8
	add r6, r5, r7
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #2
	mov r4, #20
	mov r6, r4, LSL#1
	mov r4, #-140
	add r7, fp, r4
	add r4, r7, r6
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #3
	mov r5, #20
	mul r7, r6, r5
	mov r6, #-140
	add r6, fp, r6
	add r5, r6, r7
	mov r7, #0
	mov r8, #20
	mul r6, r7, r8
	add r7, r5, r6
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #3
	mov r7, #20
	mul r6, r4, r7
	mov r4, #-140
	add r4, fp, r4
	add r7, r4, r6
	mov r6, #0
	mov r4, #20
	mul r8, r6, r4
	add r6, r7, r8
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #3
	mov r7, #20
	mul r6, r5, r7
	mov r5, #-140
	add r7, fp, r5
	add r5, r7, r6
	mov r7, #0
	mov r6, #20
	mul r8, r7, r6
	add r7, r5, r8
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #3
	mov r6, #20
	mul r7, r4, r6
	mov r4, #-140
	add r4, fp, r4
	add r6, r4, r7
	mov r7, #0
	mov r8, #20
	mul r4, r7, r8
	add r7, r6, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #3
	mov r7, #20
	mul r4, r5, r7
	mov r5, #-140
	add r5, fp, r5
	add r7, r5, r4
	mov r4, #0
	mov r8, #20
	mul r5, r4, r8
	add r4, r7, r5
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #4
	mov r5, #20
	mov r6, r5, LSL#2
	mov r5, #-140
	add r7, fp, r5
	add r5, r7, r6
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #4
	mov r4, #20
	mov r6, r4, LSL#2
	mov r4, #-140
	add r7, fp, r4
	add r4, r7, r6
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #4
	mov r5, #20
	mov r6, r5, LSL#2
	mov r5, #-140
	add r5, fp, r5
	add r7, r5, r6
	mov r6, #0
	mov r5, #20
	mul r8, r6, r5
	add r6, r7, r8
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #4
	mov r4, #20
	mov r6, r4, LSL#2
	mov r4, #-140
	add r7, fp, r4
	add r4, r7, r6
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #4
	mov r5, #20
	mov r6, r5, LSL#2
	mov r5, #-140
	add r7, fp, r5
	add r5, r7, r6
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #5
	mov r4, #20
	mul r7, r6, r4
	mov r6, #-140
	add r4, fp, r6
	add r6, r4, r7
	mov r4, #0
	mov r7, #20
	mul r8, r4, r7
	add r4, r6, r8
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #5
	mov r7, #20
	mul r6, r5, r7
	mov r5, #-140
	add r5, fp, r5
	add r7, r5, r6
	mov r6, #0
	mov r5, #20
	mul r8, r6, r5
	add r6, r7, r8
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #5
	mov r6, #20
	mul r7, r4, r6
	mov r4, #-140
	add r4, fp, r4
	add r6, r4, r7
	mov r7, #0
	mov r4, #20
	mul r8, r7, r4
	add r7, r6, r8
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #5
	mov r6, #20
	mul r7, r5, r6
	mov r5, #-140
	add r5, fp, r5
	add r6, r5, r7
	mov r7, #0
	mov r5, #20
	mul r8, r7, r5
	add r7, r6, r8
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #5
	mov r6, #20
	mul r7, r4, r6
	mov r4, #-140
	add r4, fp, r4
	add r6, r4, r7
	mov r7, #0
	mov r8, #20
	mul r4, r7, r8
	add r7, r6, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #6
	mov r4, #20
	mul r7, r5, r4
	mov r5, #-140
	add r5, fp, r5
	add r4, r5, r7
	mov r7, #0
	mov r8, #20
	mul r5, r7, r8
	add r7, r4, r5
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #6
	mov r5, #20
	mul r7, r6, r5
	mov r6, #-140
	add r6, fp, r6
	add r5, r6, r7
	mov r7, #0
	mov r8, #20
	mul r6, r7, r8
	add r7, r5, r6
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #6
	mov r6, #20
	mul r7, r4, r6
	mov r4, #-140
	add r4, fp, r4
	add r6, r4, r7
	mov r7, #0
	mov r4, #20
	mul r8, r7, r4
	add r7, r6, r8
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #6
	mov r6, #20
	mul r7, r5, r6
	mov r5, #-140
	add r5, fp, r5
	add r6, r5, r7
	mov r7, #0
	mov r5, #20
	mul r8, r7, r5
	add r7, r6, r8
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #6
	mov r6, #20
	mul r7, r4, r6
	mov r4, #-140
	add r4, fp, r4
	add r6, r4, r7
	mov r7, #0
	mov r4, #20
	mul r8, r7, r4
	add r7, r6, r8
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	ldr r4, [fp, #-144]
	mov r5, #20
	mul r6, r4, r5
	mov r4, #-140
	add r4, fp, r4
	add r5, r4, r6
	mov r6, #0
	mov r4, #20
	mul r7, r6, r4
	add r6, r5, r7
	mov r4, #0
	mov r5, #4
	mul r7, r4, r5
	add r4, r6, r7
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r5, [fp, #-144]
	mov r4, #20
	mul r6, r5, r4
	mov r5, #-140
	add r4, fp, r5
	add r5, r4, r6
	mov r4, #0
	mov r7, #20
	mul r6, r4, r7
	add r4, r5, r6
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-144]
	mov r6, #20
	mul r5, r4, r6
	mov r4, #-140
	add r4, fp, r4
	add r6, r4, r5
	mov r5, #0
	mov r4, #20
	b .B0
.LTORG
addr_b_1:
	.word b
addr_c_1:
	.word c
.B0:
	mul r7, r5, r4
	add r5, r6, r7
	mov r4, #2
	mov r4, #4
	mov r6, r4, LSL#1
	add r4, r5, r6
	ldr r5, [r4]
	mov r0, r5
	bl putint
	b .L79
	b .F2
.LTORG
addr_b_2:
	.word b
addr_c_2:
	.word c
.F2:
.L79:
	mov r0, #10
	bl putch
	ldr r5, addr_b_3
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_c_3
	add r5, r4, r6
	ldr r6, [r5]
	mov r0, r6
	bl putint
	mov r4, #1
	mov r5, #4
	mov r4, r5, LSL#0
	ldr r5, addr_c_3
	add r6, r5, r4
	ldr r4, [r6]
	mov r0, r4
	bl putint
	mov r4, #2
	mov r4, #4
	mov r5, r4, LSL#1
	ldr r6, addr_c_3
	add r4, r6, r5
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r5, #3
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_c_3
	add r5, r4, r6
	ldr r6, [r5]
	mov r0, r6
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	add sp, sp, #220
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L84:
.L85:
	b .L79
.L86:
addr_b_3:
	.word b
addr_c_3:
	.word c

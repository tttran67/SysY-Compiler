	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global relu_reg
	.type relu_reg , %function
relu_reg:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L666:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #127
	movgt r4, #1
	movle r4, #0
	bgt .L669
	b .L673
.L669:
	mov r0, #127
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L670:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movlt r4, #1
	movge r4, #0
	blt .L675
	b .L679
.L672:
.L673:
	b .L670
.L674:
.L675:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L676:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L678:
.L679:
	b .L676
.L680:
	.global model
	.type model , %function
model:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L682:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r6, #20
	mul r7, r5, r6
	add r5, r4, r7
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, =85
	mul r4, r5, r6
	ldr r6, [fp, #-4]
	mov r5, #0
	mov r7, #20
	mul r8, r5, r7
	add r5, r6, r8
	mov r6, #1
	mov r6, #4
	mov r7, r6, LSL#0
	add r6, r5, r7
	ldr r5, [r6]
	ldr r7, =23
	mul r6, r5, r7
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r8, #20
	mul r6, r5, r8
	add r5, r4, r6
	mov r4, #2
	mov r4, #4
	mov r6, r4, LSL#1
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #82
	mul r6, r5, r4
	add r4, r7, r6
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #3
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =0
	sub r5, r7, #103
	mul r7, r6, r5
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #4
	mov r4, #4
	mov r7, r4, LSL#2
	add r4, r6, r7
	ldr r6, [r4]
	ldr r7, =0
	sub r4, r7, #123
	mul r7, r6, r4
	add r4, r5, r7
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r6, #20
	mov r7, r6, LSL#0
	add r6, r5, r7
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =64
	mov r5, r6, LSL#6
	add r6, r4, r5
	ldr r5, [fp, #-4]
	mov r4, #1
	mov r7, #20
	mov r4, r7, LSL#0
	add r7, r5, r4
	mov r5, #1
	mov r4, #4
	mov r5, r4, LSL#0
	add r4, r7, r5
	ldr r7, [r4]
	ldr r5, =0
	sub r4, r5, #120
	mul r5, r7, r4
	add r4, r6, r5
	ldr r6, [fp, #-4]
	mov r5, #1
	mov r5, #20
	mov r7, r5, LSL#0
	add r5, r6, r7
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r5, r7
	ldr r5, [r6]
	ldr r7, =50
	mul r6, r5, r7
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r5, #20
	mov r6, r5, LSL#0
	add r5, r4, r6
	mov r4, #3
	mov r6, #4
	mul r8, r4, r6
	add r4, r5, r8
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #59
	mul r6, r5, r4
	add r4, r7, r6
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r6, #20
	mov r7, r6, LSL#0
	add r6, r5, r7
	mov r5, #4
	mov r5, #4
	mov r7, r5, LSL#2
	add r5, r6, r7
	ldr r6, [r5]
	ldr r7, =47
	mul r5, r6, r7
	add r7, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r6, #20
	mov r5, r6, LSL#1
	add r6, r4, r5
	mov r4, #0
	mov r5, #4
	mul r8, r4, r5
	add r4, r6, r8
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #111
	mul r6, r5, r4
	add r4, r7, r6
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r6, #20
	mov r7, r6, LSL#1
	add r6, r5, r7
	mov r5, #1
	mov r5, #4
	mov r7, r5, LSL#0
	add r5, r6, r7
	ldr r6, [r5]
	ldr r7, =0
	sub r5, r7, #67
	mul r7, r6, r5
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r6, #20
	mov r7, r6, LSL#1
	add r6, r4, r7
	mov r4, #2
	mov r4, #4
	mov r7, r4, LSL#1
	add r4, r6, r7
	ldr r6, [r4]
	ldr r7, =0
	sub r4, r7, #106
	mul r7, r6, r4
	add r4, r5, r7
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r6, #20
	mov r7, r6, LSL#1
	add r6, r5, r7
	mov r5, #3
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	ldr r7, =0
	sub r5, r7, #75
	mul r7, r6, r5
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r6, #20
	mov r7, r6, LSL#1
	add r6, r4, r7
	mov r4, #4
	mov r7, #4
	mov r4, r7, LSL#2
	add r7, r6, r4
	ldr r6, [r7]
	ldr r4, =0
	sub r7, r4, #102
	mul r4, r6, r7
	add r7, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #3
	mov r6, #20
	mul r8, r4, r6
	add r4, r5, r8
	mov r5, #0
	mov r6, #4
	mul r8, r5, r6
	add r5, r4, r8
	ldr r4, [r5]
	ldr r6, =34
	mul r5, r4, r6
	add r6, r7, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r7, #20
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #1
	mov r4, #4
	mov r7, r4, LSL#0
	add r4, r5, r7
	ldr r5, [r4]
	ldr r7, =0
	sub r4, r7, #39
	mul r7, r5, r4
	add r4, r6, r7
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r7, #20
	mul r8, r6, r7
	add r6, r5, r8
	mov r5, #2
	mov r5, #4
	mov r7, r5, LSL#1
	add r5, r6, r7
	ldr r6, [r5]
	ldr r7, =65
	mul r5, r6, r7
	add r7, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r6, #20
	mul r8, r5, r6
	add r5, r4, r8
	mov r4, #3
	mov r6, #4
	mul r8, r4, r6
	add r4, r5, r8
	ldr r5, [r4]
	ldr r6, =47
	mul r4, r5, r6
	add r6, r7, r4
	ldr r5, [fp, #-4]
	mov r4, #3
	mov r7, #20
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, #4
	mov r7, #4
	mov r5, r7, LSL#2
	add r7, r4, r5
	ldr r4, [r7]
	ldr r5, =113
	mul r7, r4, r5
	add r5, r6, r7
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r6, #20
	mov r7, r6, LSL#2
	add r6, r4, r7
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	ldr r7, =110
	mul r4, r6, r7
	add r7, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #4
	mov r6, #20
	mov r4, r6, LSL#2
	add r6, r5, r4
	mov r5, #1
	mov r4, #4
	mov r5, r4, LSL#0
	add r4, r6, r5
	ldr r6, [r4]
	ldr r5, =47
	mul r4, r6, r5
	add r5, r7, r4
	ldr r6, [fp, #-4]
	mov r4, #4
	mov r4, #20
	mov r7, r4, LSL#2
	add r4, r6, r7
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r4, r7
	ldr r4, [r6]
	ldr r7, =0
	sub r6, r7, #4
	mul r7, r4, r6
	add r6, r5, r7
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r5, #20
	mov r7, r5, LSL#2
	add r5, r4, r7
	mov r4, #3
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r7, =80
	mul r4, r5, r7
	add r7, r6, r4
	ldr r5, [fp, #-4]
	mov r4, #4
	mov r4, #20
	mov r6, r4, LSL#2
	add r4, r5, r6
	mov r5, #4
	mov r5, #4
	mov r6, r5, LSL#2
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, =46
	mul r5, r4, r6
	add r6, r7, r5
	mov r0, r6
	bl relu_reg
	mov r4, r0
	ldr r5, =39
	mul r6, r4, r5
	ldr r5, [fp, #-4]
	mov r4, #0
	mov r7, #20
	mul r8, r4, r7
	add r4, r5, r8
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [r5]
	ldr r7, =0
	sub r5, r7, #106
	mul r7, r4, r5
	ldr r5, [fp, #-4]
	mov r4, #0
	mov r8, #20
	mul r9, r4, r8
	add r4, r5, r9
	mov r5, #1
	mov r5, #4
	mov r8, r5, LSL#0
	add r5, r4, r8
	ldr r4, [r5]
	ldr r8, =126
	mul r5, r4, r8
	add r8, r7, r5
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r7, #20
	mul r9, r5, r7
	add r5, r4, r9
	mov r4, #2
	mov r4, #4
	mov r7, r4, LSL#1
	add r4, r5, r7
	ldr r5, [r4]
	ldr r7, =0
	sub r4, r7, #18
	mul r7, r5, r4
	add r4, r8, r7
	ldr r5, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #31
	mul r8, r7, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mov r4, r8, LSL#2
	add r8, r7, r4
	ldr r7, [r8]
	ldr r4, =0
	sub r8, r4, #8
	mul r4, r7, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #1
	mov r4, #20
	mov r7, r4, LSL#0
	add r4, r5, r7
	mov r5, #0
	mov r7, #4
	mul r9, r5, r7
	add r5, r4, r9
	ldr r4, [r5]
	ldr r7, =47
	mul r5, r4, r7
	add r7, r8, r5
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r5, #20
	mov r8, r5, LSL#0
	add r5, r4, r8
	mov r4, #1
	mov r4, #4
	mov r8, r4, LSL#0
	add r4, r5, r8
	ldr r5, [r4]
	ldr r8, =0
	sub r4, r8, #4
	mul r8, r5, r4
	add r4, r7, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r7, #20
	mov r8, r7, LSL#0
	add r7, r5, r8
	mov r5, #2
	mov r5, #4
	mov r8, r5, LSL#1
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =67
	mul r5, r7, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r5, #20
	mov r7, r5, LSL#0
	add r5, r4, r7
	mov r4, #3
	mov r7, #4
	mul r9, r4, r7
	add r4, r5, r9
	ldr r5, [r4]
	ldr r7, =0
	sub r4, r7, #94
	mul r7, r5, r4
	add r4, r8, r7
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r7, #20
	mov r8, r7, LSL#0
	add r7, r5, r8
	mov r5, #4
	mov r5, #4
	mov r8, r5, LSL#2
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #121
	mul r8, r7, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r7, #20
	mov r8, r7, LSL#1
	add r7, r4, r8
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =7
	mul r4, r7, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #2
	mov r4, #20
	mov r7, r4, LSL#1
	add r4, r5, r7
	mov r5, #1
	mov r5, #4
	mov r7, r5, LSL#0
	add r5, r4, r7
	b .B0
.LTORG
.B0:
	ldr r4, [r5]
	ldr r7, =0
	sub r5, r7, #21
	mul r7, r4, r5
	add r5, r8, r7
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r7, #20
	mov r8, r7, LSL#1
	add r7, r4, r8
	mov r4, #2
	mov r4, #4
	mov r8, r4, LSL#1
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #60
	mul r8, r7, r4
	add r4, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mov r7, r8, LSL#1
	add r8, r5, r7
	mov r5, #3
	mov r9, #4
	mul r7, r5, r9
	add r5, r8, r7
	ldr r8, [r5]
	ldr r7, =0
	sub r5, r7, #43
	mul r7, r8, r5
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mov r7, r8, LSL#1
	add r8, r4, r7
	mov r4, #4
	mov r7, #4
	mov r4, r7, LSL#2
	add r7, r8, r4
	ldr r8, [r7]
	ldr r4, =105
	mul r7, r8, r4
	add r4, r5, r7
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
	ldr r8, =0
	sub r5, r8, #42
	mul r8, r7, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r9, #20
	mul r8, r7, r9
	add r7, r4, r8
	mov r4, #1
	mov r4, #4
	mov r8, r4, LSL#0
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =87
	mul r4, r7, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #3
	mov r9, #20
	mul r7, r4, r9
	add r4, r5, r7
	mov r5, #2
	mov r5, #4
	mov r7, r5, LSL#1
	add r5, r4, r7
	ldr r4, [r5]
	ldr r7, =29
	mul r5, r4, r7
	add r7, r8, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r9, #20
	mul r8, r5, r9
	add r5, r4, r8
	mov r4, #3
	mov r9, #4
	mul r8, r4, r9
	add r4, r5, r8
	ldr r5, [r4]
	ldr r8, =0
	sub r4, r8, #106
	mul r8, r5, r4
	add r4, r7, r8
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r9, #20
	mul r8, r7, r9
	add r7, r5, r8
	mov r5, #4
	mov r5, #4
	mov r8, r5, LSL#2
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #31
	mul r8, r7, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mov r7, r8, LSL#2
	add r8, r4, r7
	mov r4, #0
	mov r7, #4
	mul r9, r4, r7
	add r4, r8, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #110
	mul r8, r7, r4
	add r4, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mov r7, r8, LSL#2
	add r8, r5, r7
	mov r5, #1
	mov r5, #4
	mov r7, r5, LSL#0
	add r5, r8, r7
	ldr r8, [r5]
	ldr r7, =0
	sub r5, r7, #100
	mul r7, r8, r5
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r4, r8
	mov r4, #2
	mov r4, #4
	mov r8, r4, LSL#1
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #22
	mul r8, r7, r4
	add r4, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r5, r8
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #75
	mul r8, r7, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r4, r8
	mov r4, #4
	mov r4, #4
	mov r8, r4, LSL#2
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #125
	mul r8, r7, r4
	add r4, r5, r8
	mov r0, r4
	bl relu_reg
	mov r5, r0
	ldr r7, =77
	mul r4, r5, r7
	add r7, r6, r4
	ldr r5, [fp, #-4]
	mov r4, #0
	mov r6, #20
	mul r8, r4, r6
	add r4, r5, r8
	mov r5, #0
	mov r6, #4
	mul r8, r5, r6
	add r5, r4, r8
	ldr r4, [r5]
	ldr r6, =26
	mul r5, r4, r6
	ldr r6, [fp, #-4]
	mov r4, #0
	mov r8, #20
	mul r9, r4, r8
	add r4, r6, r9
	mov r6, #1
	mov r6, #4
	mov r8, r6, LSL#0
	add r6, r4, r8
	ldr r4, [r6]
	ldr r8, =76
	mul r6, r4, r8
	add r8, r5, r6
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r6, #20
	mul r9, r5, r6
	add r5, r4, r9
	mov r4, #2
	mov r4, #4
	mov r6, r4, LSL#1
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #70
	mul r6, r5, r4
	add r4, r8, r6
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
	ldr r8, =29
	mul r5, r6, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r6, #20
	mul r9, r5, r6
	add r5, r4, r9
	mov r4, #4
	mov r4, #4
	mov r6, r4, LSL#2
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #95
	mul r6, r5, r4
	add r4, r8, r6
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r6, #20
	mov r8, r6, LSL#0
	add r6, r5, r8
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =96
	mul r5, r6, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r5, #20
	mov r6, r5, LSL#0
	add r5, r4, r6
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =52
	mul r4, r5, r6
	add r6, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #1
	mov r4, #20
	mov r8, r4, LSL#0
	add r4, r5, r8
	mov r5, #2
	mov r5, #4
	mov r8, r5, LSL#1
	add r5, r4, r8
	ldr r4, [r5]
	ldr r8, =0
	sub r5, r8, #68
	mul r8, r4, r5
	add r5, r6, r8
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r6, #20
	mov r8, r6, LSL#0
	add r6, r4, r8
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #5
	mul r8, r6, r4
	add r4, r5, r8
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r6, #20
	mov r8, r6, LSL#0
	add r6, r5, r8
	mov r5, #4
	mov r5, #4
	mov r8, r5, LSL#2
	add r5, r6, r8
	ldr r6, [r5]
	ldr r8, =34
	mul r5, r6, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r5, #20
	mov r6, r5, LSL#1
	add r5, r4, r6
	mov r4, #0
	mov r9, #4
	mul r6, r4, r9
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #34
	mul r6, r5, r4
	add r4, r8, r6
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r6, #20
	mov r8, r6, LSL#1
	add r6, r5, r8
	mov r5, #1
	mov r5, #4
	mov r8, r5, LSL#0
	add r5, r6, r8
	ldr r6, [r5]
	ldr r8, =102
	mul r5, r6, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r5, #20
	mov r6, r5, LSL#1
	add r5, r4, r6
	mov r4, #2
	mov r4, #4
	mov r6, r4, LSL#1
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =6
	mul r4, r5, r6
	add r6, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #2
	mov r4, #20
	mov r8, r4, LSL#1
	add r4, r5, r8
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r4, r9
	ldr r4, [r5]
	ldr r8, =0
	sub r5, r8, #38
	mul r8, r4, r5
	add r5, r6, r8
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r6, #20
	mov r8, r6, LSL#1
	add r6, r4, r8
	mov r4, #4
	mov r4, #4
	mov r8, r4, LSL#2
	add r4, r6, r8
	ldr r6, [r4]
	ldr r8, =27
	mul r4, r6, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #3
	mov r6, #20
	mul r9, r4, r6
	add r4, r5, r9
	mov r5, #0
	mov r6, #4
	mul r9, r5, r6
	add r5, r4, r9
	ldr r4, [r5]
	ldr r6, =110
	mul r5, r4, r6
	add r6, r8, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r8, #20
	mul r9, r5, r8
	add r5, r4, r9
	mov r4, #1
	mov r4, #4
	mov r8, r4, LSL#0
	add r4, r5, r8
	ldr r5, [r4]
	ldr r8, =116
	mul r4, r5, r8
	add r8, r6, r4
	ldr r5, [fp, #-4]
	mov r4, #3
	mov r6, #20
	mul r9, r4, r6
	add r4, r5, r9
	mov r5, #2
	mov r5, #4
	mov r6, r5, LSL#1
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, =39
	mul r5, r4, r6
	add r6, r8, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r9, #20
	mul r8, r5, r9
	add r5, r4, r8
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r8, =0
	sub r4, r8, #63
	mul r8, r5, r4
	add r4, r6, r8
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #4
	mov r5, #4
	mov r8, r5, LSL#2
	add r5, r6, r8
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #99
	mul r8, r6, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r6, #20
	mov r8, r6, LSL#2
	add r6, r4, r8
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =65
	mul r4, r6, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #4
	mov r4, #20
	mov r6, r4, LSL#2
	add r4, r5, r6
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, =120
	mul r5, r4, r6
	add r6, r8, r5
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r5, #20
	mov r8, r5, LSL#2
	add r5, r4, r8
	mov r4, #2
	mov r4, #4
	mov r8, r4, LSL#1
	add r4, r5, r8
	ldr r5, [r4]
	ldr r8, =0
	sub r4, r8, #39
	mul r8, r5, r4
	add r4, r6, r8
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r6, #20
	b .B1
.LTORG
.B1:
	mov r8, r6, LSL#2
	add r6, r5, r8
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #6
	mul r8, r6, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r6, #20
	mov r8, r6, LSL#2
	add r6, r4, r8
	mov r4, #4
	mov r4, #4
	mov r8, r4, LSL#2
	add r4, r6, r8
	ldr r6, [r4]
	ldr r8, =94
	mul r4, r6, r8
	add r8, r5, r4
	mov r0, r8
	bl relu_reg
	mov r5, r0
	ldr r4, =127
	mul r6, r5, r4
	add r4, r7, r6
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
	ldr r7, =0
	sub r5, r7, #23
	mul r7, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #1
	mov r5, #4
	mov r8, r5, LSL#0
	add r5, r6, r8
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #63
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mov r6, r8, LSL#1
	add r8, r7, r6
	ldr r7, [r8]
	ldr r6, =49
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =50
	mul r5, r7, r8
	add r8, r6, r5
	ldr r6, [fp, #-4]
	mov r5, #0
	mov r7, #20
	mul r9, r5, r7
	add r5, r6, r9
	mov r6, #4
	mov r6, #4
	mov r7, r6, LSL#2
	add r6, r5, r7
	ldr r5, [r6]
	ldr r7, =72
	mul r6, r5, r7
	add r7, r8, r6
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mov r6, r8, LSL#0
	add r8, r5, r6
	mov r5, #0
	mov r6, #4
	mul r9, r5, r6
	add r5, r8, r9
	ldr r6, [r5]
	ldr r8, =85
	mul r5, r6, r8
	add r8, r7, r5
	ldr r6, [fp, #-4]
	mov r5, #1
	mov r5, #20
	mov r7, r5, LSL#0
	add r5, r6, r7
	mov r6, #1
	mov r6, #4
	mov r7, r6, LSL#0
	add r6, r5, r7
	ldr r5, [r6]
	ldr r7, =0
	sub r6, r7, #30
	mul r7, r5, r6
	add r6, r8, r7
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r7, #20
	mov r8, r7, LSL#0
	add r7, r5, r8
	mov r5, #2
	mov r5, #4
	mov r8, r5, LSL#1
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =12
	mul r5, r7, r8
	add r8, r6, r5
	ldr r6, [fp, #-4]
	mov r5, #1
	mov r7, #20
	mov r5, r7, LSL#0
	add r7, r6, r5
	mov r6, #3
	mov r5, #4
	mul r9, r6, r5
	add r6, r7, r9
	ldr r5, [r6]
	ldr r7, =125
	mul r6, r5, r7
	add r7, r8, r6
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r6, #20
	mov r8, r6, LSL#0
	add r6, r5, r8
	mov r5, #4
	mov r5, #4
	mov r8, r5, LSL#2
	add r5, r6, r8
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #117
	mul r8, r6, r5
	add r5, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mov r7, r8, LSL#1
	add r8, r6, r7
	mov r6, #0
	mov r9, #4
	mul r7, r6, r9
	add r6, r8, r7
	ldr r8, [r6]
	ldr r7, =0
	sub r6, r7, #65
	mul r7, r8, r6
	add r6, r5, r7
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mov r7, r8, LSL#1
	add r8, r5, r7
	mov r5, #1
	mov r5, #4
	mov r7, r5, LSL#0
	add r5, r8, r7
	ldr r8, [r5]
	ldr r7, =0
	sub r5, r7, #67
	mul r7, r8, r5
	add r5, r6, r7
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r7, #20
	mov r8, r7, LSL#1
	add r7, r6, r8
	mov r6, #2
	mov r6, #4
	mov r8, r6, LSL#1
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =125
	mul r6, r7, r8
	add r8, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r6, #20
	mov r7, r6, LSL#1
	add r6, r5, r7
	mov r5, #3
	mov r7, #4
	mul r9, r5, r7
	add r5, r6, r9
	ldr r6, [r5]
	ldr r7, =110
	mul r5, r6, r7
	add r7, r8, r5
	ldr r6, [fp, #-4]
	mov r5, #2
	mov r5, #20
	mov r8, r5, LSL#1
	add r5, r6, r8
	mov r6, #4
	mov r6, #4
	mov r8, r6, LSL#2
	add r6, r5, r8
	ldr r5, [r6]
	ldr r8, =0
	sub r6, r8, #31
	mul r8, r5, r6
	add r6, r7, r8
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
	ldr r8, =0
	sub r5, r8, #123
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r6, #4
	mov r8, r6, LSL#0
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =83
	mul r6, r7, r8
	add r8, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r7, #20
	mul r9, r6, r7
	add r6, r5, r9
	mov r5, #2
	mov r7, #4
	mov r5, r7, LSL#1
	add r7, r6, r5
	ldr r6, [r7]
	ldr r5, =122
	mul r7, r6, r5
	add r5, r8, r7
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =11
	mul r6, r7, r8
	add r8, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r7, #20
	mul r9, r6, r7
	add r6, r5, r9
	mov r5, #4
	mov r7, #4
	mov r5, r7, LSL#2
	add r7, r6, r5
	ldr r6, [r7]
	ldr r5, =0
	sub r7, r5, #23
	mul r5, r6, r7
	add r7, r8, r5
	ldr r6, [fp, #-4]
	mov r5, #4
	mov r8, #20
	mov r5, r8, LSL#2
	add r8, r6, r5
	mov r6, #0
	mov r5, #4
	mul r9, r6, r5
	add r6, r8, r9
	ldr r5, [r6]
	ldr r8, =0
	sub r6, r8, #47
	mul r8, r5, r6
	add r6, r7, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r5, r8
	mov r5, #1
	mov r5, #4
	mov r8, r5, LSL#0
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #32
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r6, r8
	mov r6, #2
	mov r6, #4
	mov r8, r6, LSL#1
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #117
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r5, r8
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =95
	mul r5, r7, r8
	add r8, r6, r5
	ldr r6, [fp, #-4]
	mov r5, #4
	mov r5, #20
	mov r7, r5, LSL#2
	add r5, r6, r7
	mov r6, #4
	mov r6, #4
	mov r7, r6, LSL#2
	add r6, r5, r7
	ldr r5, [r6]
	ldr r7, =118
	mul r6, r5, r7
	add r7, r8, r6
	mov r0, r7
	bl relu_reg
	mov r5, r0
	ldr r6, =0
	sub r7, r6, #106
	mul r6, r5, r7
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r6, #20
	mul r8, r5, r6
	add r5, r4, r8
	mov r4, #0
	mov r6, #4
	mul r8, r4, r6
	add r4, r5, r8
	ldr r5, [r4]
	ldr r6, =8
	mov r4, r5, LSL#3
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #1
	mov r5, #4
	mov r8, r5, LSL#0
	add r5, r6, r8
	ldr r6, [r5]
	ldr r8, =82
	mul r5, r6, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r6, #20
	mul r9, r5, r6
	add r5, r4, r9
	mov r4, #2
	mov r4, #4
	mov r6, r4, LSL#1
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #104
	mul r6, r5, r4
	add r4, r8, r6
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
	ldr r8, =101
	mul r5, r6, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r6, #20
	mul r9, r5, r6
	add r5, r4, r9
	mov r4, #4
	mov r6, #4
	mov r4, r6, LSL#2
	add r6, r5, r4
	ldr r5, [r6]
	ldr r4, =0
	sub r6, r4, #116
	mul r4, r5, r6
	add r6, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #1
	mov r4, #20
	mov r8, r4, LSL#0
	add r4, r5, r8
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r4, r9
	ldr r4, [r5]
	ldr r8, =0
	sub r5, r8, #63
	mul r8, r4, r5
	add r5, r6, r8
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r6, #20
	mov r8, r6, LSL#0
	add r6, r4, r8
	mov r4, #1
	mov r4, #4
	mov r8, r4, LSL#0
	add r4, r6, r8
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #16
	mul r8, r6, r4
	add r4, r5, r8
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r6, #20
	mov r8, r6, LSL#0
	add r6, r5, r8
	mov r5, #2
	mov r5, #4
	mov r8, r5, LSL#1
	add r5, r6, r8
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #70
	mul r8, r6, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r6, #20
	mov r8, r6, LSL#0
	add r6, r4, r8
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =125
	mul r4, r6, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #1
	mov r4, #20
	mov r6, r4, LSL#0
	add r4, r5, r6
	mov r5, #4
	b .B2
.LTORG
.B2:
	mov r5, #4
	mov r6, r5, LSL#2
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, =75
	mul r5, r4, r6
	add r6, r8, r5
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r5, #20
	mov r8, r5, LSL#1
	add r5, r4, r8
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r8, =66
	mul r4, r5, r8
	add r8, r6, r4
	ldr r5, [fp, #-4]
	mov r4, #2
	mov r6, #20
	mov r4, r6, LSL#1
	add r6, r5, r4
	mov r5, #1
	mov r4, #4
	mov r5, r4, LSL#0
	add r4, r6, r5
	ldr r6, [r4]
	ldr r5, =0
	sub r4, r5, #96
	mul r5, r6, r4
	add r4, r8, r5
	ldr r6, [fp, #-4]
	mov r5, #2
	mov r5, #20
	mov r8, r5, LSL#1
	add r5, r6, r8
	mov r6, #2
	mov r6, #4
	mov r8, r6, LSL#1
	add r6, r5, r8
	ldr r5, [r6]
	ldr r8, =0
	sub r6, r8, #101
	mul r8, r5, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r5, #20
	mov r8, r5, LSL#1
	add r5, r4, r8
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r8, =0
	sub r4, r8, #114
	mul r8, r5, r4
	add r4, r6, r8
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r6, #20
	mov r8, r6, LSL#1
	add r6, r5, r8
	mov r5, #4
	mov r5, #4
	mov r8, r5, LSL#2
	add r5, r6, r8
	ldr r6, [r5]
	ldr r8, =59
	mul r5, r6, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r9, #20
	mul r6, r5, r9
	add r5, r4, r6
	mov r4, #0
	mov r6, #4
	mul r9, r4, r6
	add r4, r5, r9
	ldr r5, [r4]
	ldr r6, =12
	mul r4, r5, r6
	add r6, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #3
	mov r8, #20
	mul r9, r4, r8
	add r4, r5, r9
	mov r5, #1
	mov r5, #4
	mov r8, r5, LSL#0
	add r5, r4, r8
	ldr r4, [r5]
	ldr r8, =5
	mul r5, r4, r8
	add r8, r6, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r6, #20
	mul r9, r5, r6
	add r5, r4, r9
	mov r4, #2
	mov r6, #4
	mov r4, r6, LSL#1
	add r6, r5, r4
	ldr r5, [r6]
	ldr r4, =0
	sub r6, r4, #95
	mul r4, r5, r6
	add r6, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #3
	mov r9, #20
	mul r8, r4, r9
	add r4, r5, r8
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r4, r9
	ldr r4, [r5]
	ldr r8, =116
	mul r5, r4, r8
	add r8, r6, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r6, #20
	mul r9, r5, r6
	add r5, r4, r9
	mov r4, #4
	mov r4, #4
	mov r6, r4, LSL#2
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #93
	mul r6, r5, r4
	add r4, r8, r6
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r6, #20
	mov r8, r6, LSL#2
	add r6, r5, r8
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =15
	mul r5, r6, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r5, #20
	mov r6, r5, LSL#2
	add r5, r4, r6
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =79
	mul r4, r5, r6
	add r6, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #4
	mov r4, #20
	mov r8, r4, LSL#2
	add r4, r5, r8
	mov r5, #2
	mov r5, #4
	mov r8, r5, LSL#1
	add r5, r4, r8
	ldr r4, [r5]
	ldr r8, =3
	mul r5, r4, r8
	add r8, r6, r5
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r6, #20
	mov r5, r6, LSL#2
	add r6, r4, r5
	mov r4, #3
	mov r9, #4
	mul r5, r4, r9
	add r4, r6, r5
	ldr r6, [r4]
	ldr r5, =49
	mul r4, r6, r5
	add r5, r8, r4
	ldr r6, [fp, #-4]
	mov r4, #4
	mov r4, #20
	mov r8, r4, LSL#2
	add r4, r6, r8
	mov r6, #4
	mov r6, #4
	mov r8, r6, LSL#2
	add r6, r4, r8
	ldr r4, [r6]
	ldr r8, =0
	sub r6, r8, #124
	mul r8, r4, r6
	add r6, r5, r8
	mov r0, r6
	bl relu_reg
	mov r4, r0
	ldr r5, =0
	sub r6, r5, #3
	mul r5, r4, r6
	add r6, r7, r5
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r8, #20
	mul r7, r5, r8
	add r5, r4, r7
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	ldr r7, =81
	mul r4, r5, r7
	ldr r7, [fp, #-4]
	mov r5, #0
	mov r8, #20
	mul r9, r5, r8
	add r5, r7, r9
	mov r7, #1
	mov r7, #4
	mov r8, r7, LSL#0
	add r7, r5, r8
	ldr r5, [r7]
	ldr r8, =68
	mul r7, r5, r8
	add r8, r4, r7
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r9, #20
	mul r7, r5, r9
	add r5, r4, r7
	mov r4, #2
	mov r4, #4
	mov r7, r4, LSL#1
	add r4, r5, r7
	ldr r5, [r4]
	ldr r7, =0
	sub r4, r7, #102
	mul r7, r5, r4
	add r4, r8, r7
	ldr r5, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #74
	mul r8, r7, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r4, #4
	mov r8, r4, LSL#2
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =121
	mul r4, r7, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #1
	mov r4, #20
	mov r7, r4, LSL#0
	add r4, r5, r7
	mov r5, #0
	mov r9, #4
	mul r7, r5, r9
	add r5, r4, r7
	ldr r4, [r5]
	ldr r7, =0
	sub r5, r7, #15
	mul r7, r4, r5
	add r5, r8, r7
	ldr r4, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mov r7, r8, LSL#0
	add r8, r4, r7
	mov r4, #1
	mov r4, #4
	mov r7, r4, LSL#0
	add r4, r8, r7
	ldr r8, [r4]
	ldr r7, =55
	mul r4, r8, r7
	add r7, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #1
	mov r4, #20
	mov r8, r4, LSL#0
	add r4, r5, r8
	mov r5, #2
	mov r5, #4
	mov r8, r5, LSL#1
	add r5, r4, r8
	ldr r4, [r5]
	ldr r8, =101
	mul r5, r4, r8
	add r8, r7, r5
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r5, #20
	mov r7, r5, LSL#0
	add r5, r4, r7
	mov r4, #3
	mov r7, #4
	mul r9, r4, r7
	add r4, r5, r9
	ldr r5, [r4]
	ldr r7, =0
	sub r4, r7, #13
	mul r7, r5, r4
	add r4, r8, r7
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r7, #20
	mov r8, r7, LSL#0
	add r7, r5, r8
	mov r5, #4
	mov r8, #4
	mov r5, r8, LSL#2
	add r8, r7, r5
	ldr r7, [r8]
	ldr r5, =0
	sub r8, r5, #62
	mul r5, r7, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r5, #20
	mov r7, r5, LSL#1
	add r5, r4, r7
	mov r4, #0
	mov r7, #4
	mul r9, r4, r7
	add r4, r5, r9
	ldr r5, [r4]
	ldr r7, =64
	mov r4, r5, LSL#6
	add r5, r8, r4
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r7, #20
	mov r8, r7, LSL#1
	add r7, r4, r8
	mov r4, #1
	mov r4, #4
	mov r8, r4, LSL#0
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =114
	mul r4, r7, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #2
	mov r4, #20
	mov r7, r4, LSL#1
	add r4, r5, r7
	mov r5, #2
	mov r5, #4
	mov r7, r5, LSL#1
	add r5, r4, r7
	ldr r4, [r5]
	ldr r7, =38
	mul r5, r4, r7
	add r7, r8, r5
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r5, #20
	mov r8, r5, LSL#1
	add r5, r4, r8
	mov r4, #3
	mov r9, #4
	mul r8, r4, r9
	add r4, r5, r8
	ldr r5, [r4]
	ldr r8, =0
	sub r4, r8, #21
	mul r8, r5, r4
	add r4, r7, r8
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r7, #20
	mov r8, r7, LSL#1
	add r7, r5, r8
	mov r5, #4
	mov r5, #4
	mov r8, r5, LSL#2
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =112
	mul r5, r7, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r9, #20
	mul r7, r5, r9
	add r5, r4, r7
	mov r4, #0
	mov r7, #4
	mul r9, r4, r7
	add r4, r5, r9
	ldr r5, [r4]
	ldr r7, =114
	mul r4, r5, r7
	add r7, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #3
	mov r8, #20
	mul r9, r4, r8
	add r4, r5, r9
	mov r5, #1
	mov r5, #4
	mov r8, r5, LSL#0
	add r5, r4, r8
	ldr r4, [r5]
	ldr r8, =112
	mul r5, r4, r8
	add r8, r7, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r7, #20
	mul r9, r5, r7
	add r5, r4, r9
	mov r4, #2
	mov r4, #4
	mov r7, r4, LSL#1
	add r4, r5, r7
	ldr r5, [r4]
	ldr r7, =0
	sub r4, r7, #10
	mul r7, r5, r4
	add r4, r8, r7
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #3
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #16
	mul r8, r7, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #4
	mov r8, #4
	mov r4, r8, LSL#2
	add r8, r7, r4
	ldr r7, [r8]
	ldr r4, =0
	sub r8, r4, #50
	mul r4, r7, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #4
	mov r4, #20
	mov r7, r4, LSL#2
	add r4, r5, r7
	mov r5, #0
	mov r7, #4
	mul r9, r5, r7
	add r5, r4, r9
	ldr r4, [r5]
	ldr r7, =0
	sub r5, r7, #112
	mul r7, r4, r5
	add r5, r8, r7
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r7, #20
	b .B3
.LTORG
.B3:
	mov r8, r7, LSL#2
	add r7, r4, r8
	mov r4, #1
	mov r4, #4
	mov r8, r4, LSL#0
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #116
	mul r8, r7, r4
	add r4, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r5, r8
	mov r5, #2
	mov r8, #4
	mov r5, r8, LSL#1
	add r8, r7, r5
	ldr r7, [r8]
	ldr r5, =0
	sub r8, r5, #54
	mul r5, r7, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r5, #20
	mov r7, r5, LSL#2
	add r5, r4, r7
	mov r4, #3
	mov r7, #4
	mul r9, r4, r7
	add r4, r5, r9
	ldr r5, [r4]
	ldr r7, =82
	mul r4, r5, r7
	add r7, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #4
	mov r4, #20
	mov r8, r4, LSL#2
	add r4, r5, r8
	mov r5, #4
	mov r5, #4
	mov r8, r5, LSL#2
	add r5, r4, r8
	ldr r4, [r5]
	ldr r8, =0
	sub r5, r8, #72
	mul r8, r4, r5
	add r5, r7, r8
	mov r0, r5
	bl relu_reg
	mov r4, r0
	ldr r7, =32
	mov r5, r4, LSL#5
	add r4, r6, r5
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
	ldr r7, =15
	mul r5, r6, r7
	ldr r7, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r7, r9
	mov r7, #1
	mov r7, #4
	mov r8, r7, LSL#0
	add r7, r6, r8
	ldr r6, [r7]
	ldr r8, =0
	sub r7, r8, #77
	mul r8, r6, r7
	add r7, r5, r8
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r5, r9
	mov r5, #2
	mov r5, #4
	mov r8, r5, LSL#1
	add r5, r6, r8
	ldr r6, [r5]
	ldr r8, =66
	mul r5, r6, r8
	add r8, r7, r5
	ldr r6, [fp, #-4]
	mov r5, #0
	mov r7, #20
	mul r9, r5, r7
	add r5, r6, r9
	mov r6, #3
	mov r7, #4
	mul r9, r6, r7
	add r6, r5, r9
	ldr r5, [r6]
	ldr r7, =0
	sub r6, r7, #90
	mul r7, r5, r6
	add r6, r8, r7
	ldr r5, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #4
	mov r5, #4
	mov r8, r5, LSL#2
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #6
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r7, #20
	mov r8, r7, LSL#0
	add r7, r6, r8
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #30
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r7, #20
	mov r8, r7, LSL#0
	add r7, r5, r8
	mov r5, #1
	mov r5, #4
	mov r8, r5, LSL#0
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #8
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r7, #20
	mov r8, r7, LSL#0
	add r7, r6, r8
	mov r6, #2
	mov r6, #4
	mov r8, r6, LSL#1
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =81
	mul r6, r7, r8
	add r8, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r7, #20
	mov r6, r7, LSL#0
	add r7, r5, r6
	mov r5, #3
	mov r6, #4
	mul r9, r5, r6
	add r5, r7, r9
	ldr r6, [r5]
	ldr r7, =2
	mov r5, r6, LSL#1
	add r6, r8, r5
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r8, #20
	mov r7, r8, LSL#0
	add r8, r5, r7
	mov r5, #4
	mov r5, #4
	mov r7, r5, LSL#2
	add r5, r8, r7
	ldr r8, [r5]
	ldr r7, =0
	sub r5, r7, #110
	mul r7, r8, r5
	add r5, r6, r7
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mov r7, r8, LSL#1
	add r8, r6, r7
	mov r6, #0
	mov r7, #4
	mul r9, r6, r7
	add r6, r8, r9
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #95
	mul r8, r7, r6
	add r6, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r7, #20
	mov r8, r7, LSL#1
	add r7, r5, r8
	mov r5, #1
	mov r5, #4
	mov r8, r5, LSL#0
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =59
	mul r5, r7, r8
	add r8, r6, r5
	ldr r6, [fp, #-4]
	mov r5, #2
	mov r5, #20
	mov r7, r5, LSL#1
	add r5, r6, r7
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r5, r7
	ldr r5, [r6]
	ldr r7, =52
	mul r6, r5, r7
	add r7, r8, r6
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r6, #20
	mov r8, r6, LSL#1
	add r6, r5, r8
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =15
	mul r5, r6, r8
	add r8, r7, r5
	ldr r6, [fp, #-4]
	mov r5, #2
	mov r5, #20
	mov r7, r5, LSL#1
	add r5, r6, r7
	mov r6, #4
	mov r7, #4
	mov r6, r7, LSL#2
	add r7, r5, r6
	ldr r5, [r7]
	ldr r6, =55
	mul r7, r5, r6
	add r6, r8, r7
	ldr r5, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r5, r9
	mov r5, #0
	mov r9, #4
	mul r8, r5, r9
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #33
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r6, #4
	mov r8, r6, LSL#0
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =14
	mul r6, r7, r8
	add r8, r5, r6
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r7, #20
	mul r9, r6, r7
	add r6, r5, r9
	mov r5, #2
	mov r5, #4
	mov r7, r5, LSL#1
	add r5, r6, r7
	ldr r6, [r5]
	ldr r7, =58
	mul r5, r6, r7
	add r7, r8, r5
	ldr r6, [fp, #-4]
	mov r5, #3
	mov r8, #20
	mul r9, r5, r8
	add r5, r6, r9
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r5, r9
	ldr r5, [r6]
	ldr r8, =67
	mul r6, r5, r8
	add r8, r7, r6
	ldr r5, [fp, #-4]
	mov r6, #3
	mov r7, #20
	mul r9, r6, r7
	add r6, r5, r9
	mov r5, #4
	mov r5, #4
	mov r7, r5, LSL#2
	add r5, r6, r7
	ldr r6, [r5]
	ldr r7, =86
	mul r5, r6, r7
	add r7, r8, r5
	ldr r6, [fp, #-4]
	mov r5, #4
	mov r5, #20
	mov r8, r5, LSL#2
	add r5, r6, r8
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r5, r9
	ldr r5, [r6]
	ldr r8, =0
	sub r6, r8, #79
	mul r8, r5, r6
	add r6, r7, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r5, r8
	mov r5, #1
	mov r5, #4
	mov r8, r5, LSL#0
	add r5, r7, r8
	ldr r7, [r5]
	ldr r8, =48
	mul r5, r7, r8
	add r8, r6, r5
	ldr r6, [fp, #-4]
	mov r5, #4
	mov r5, #20
	mov r7, r5, LSL#2
	add r5, r6, r7
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r5, r7
	ldr r5, [r6]
	ldr r7, =0
	sub r6, r7, #13
	mul r7, r5, r6
	add r6, r8, r7
	ldr r5, [fp, #-4]
	mov r7, #4
	mov r8, #20
	mov r7, r8, LSL#2
	add r8, r5, r7
	mov r5, #3
	mov r7, #4
	mul r9, r5, r7
	add r5, r8, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #15
	mul r8, r7, r5
	add r5, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r6, r8
	mov r6, #4
	mov r6, #4
	mov r8, r6, LSL#2
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =66
	mul r6, r7, r8
	add r8, r5, r6
	mov r0, r8
	bl relu_reg
	mov r5, r0
	ldr r6, =0
	sub r7, r6, #95
	mul r6, r5, r7
	add r7, r4, r6
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r6, #20
	mul r8, r5, r6
	add r5, r4, r8
	mov r4, #0
	mov r6, #4
	mul r8, r4, r6
	add r4, r5, r8
	ldr r5, [r4]
	ldr r6, =33
	mul r4, r5, r6
	ldr r6, [fp, #-4]
	mov r5, #0
	mov r8, #20
	mul r9, r5, r8
	add r5, r6, r9
	mov r6, #1
	mov r6, #4
	mov r8, r6, LSL#0
	add r6, r5, r8
	ldr r5, [r6]
	ldr r8, =82
	mul r6, r5, r8
	add r8, r4, r6
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r6, #20
	mul r9, r5, r6
	add r5, r4, r9
	mov r4, #2
	mov r4, #4
	mov r6, r4, LSL#1
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =67
	mul r4, r5, r6
	add r6, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #0
	mov r8, #20
	mul r9, r4, r8
	add r4, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r4, r9
	ldr r4, [r5]
	ldr r8, =30
	mul r5, r4, r8
	add r8, r6, r5
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r9, #20
	mul r6, r5, r9
	add r5, r4, r6
	mov r4, #4
	mov r4, #4
	mov r6, r4, LSL#2
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #2
	mul r6, r5, r4
	add r4, r8, r6
	ldr r5, [fp, #-4]
	mov r6, #1
	mov r8, #20
	mov r6, r8, LSL#0
	add r8, r5, r6
	mov r5, #0
	mov r6, #4
	mul r9, r5, r6
	add r5, r8, r9
	ldr r6, [r5]
	ldr r8, =65
	mul r5, r6, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r5, #20
	mov r6, r5, LSL#0
	add r5, r4, r6
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =120
	mul r4, r5, r6
	add r6, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #1
	mov r8, #20
	mov r4, r8, LSL#0
	add r8, r5, r4
	mov r5, #2
	mov r4, #4
	mov r5, r4, LSL#1
	add r4, r8, r5
	b .B4
.LTORG
.B4:
	ldr r8, [r4]
	ldr r5, =0
	sub r4, r5, #13
	mul r5, r8, r4
	add r4, r6, r5
	ldr r6, [fp, #-4]
	mov r5, #1
	mov r5, #20
	mov r8, r5, LSL#0
	add r5, r6, r8
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r5, r9
	ldr r5, [r6]
	ldr r8, =18
	mul r6, r5, r8
	add r8, r4, r6
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r6, #20
	mov r5, r6, LSL#0
	add r6, r4, r5
	mov r4, #4
	mov r4, #4
	mov r5, r4, LSL#2
	add r4, r6, r5
	ldr r6, [r4]
	ldr r5, =5
	mul r4, r6, r5
	add r5, r8, r4
	ldr r6, [fp, #-4]
	mov r4, #2
	mov r8, #20
	mov r4, r8, LSL#1
	add r8, r6, r4
	mov r6, #0
	mov r4, #4
	mul r9, r6, r4
	add r6, r8, r9
	ldr r4, [r6]
	ldr r8, =104
	mul r6, r4, r8
	add r8, r5, r6
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r5, #20
	mov r6, r5, LSL#1
	add r5, r4, r6
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #119
	mul r6, r5, r4
	add r4, r8, r6
	ldr r5, [fp, #-4]
	mov r6, #2
	mov r6, #20
	mov r8, r6, LSL#1
	add r6, r5, r8
	mov r5, #2
	mov r5, #4
	mov r8, r5, LSL#1
	add r5, r6, r8
	ldr r6, [r5]
	ldr r8, =0
	sub r5, r8, #7
	mul r8, r6, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r6, #20
	mov r8, r6, LSL#1
	add r6, r4, r8
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	ldr r8, =71
	mul r4, r6, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #2
	mov r4, #20
	mov r6, r4, LSL#1
	add r4, r5, r6
	mov r5, #4
	mov r5, #4
	mov r6, r5, LSL#2
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, =107
	mul r5, r4, r6
	add r6, r8, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r8, #20
	mul r9, r5, r8
	add r5, r4, r9
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r8, =24
	mul r4, r5, r8
	add r8, r6, r4
	ldr r5, [fp, #-4]
	mov r4, #3
	mov r6, #20
	mul r9, r4, r6
	add r4, r5, r9
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, =82
	mul r5, r4, r6
	add r6, r8, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r8, #20
	mul r9, r5, r8
	add r5, r4, r9
	mov r4, #2
	mov r4, #4
	mov r8, r4, LSL#1
	add r4, r5, r8
	ldr r5, [r4]
	ldr r8, =0
	sub r4, r8, #96
	mul r8, r5, r4
	add r4, r6, r8
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
	ldr r8, =0
	sub r5, r8, #104
	mul r8, r6, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r6, #3
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #4
	mov r4, #4
	mov r8, r4, LSL#2
	add r4, r6, r8
	ldr r6, [r4]
	ldr r8, =0
	sub r4, r8, #121
	mul r8, r6, r4
	add r4, r5, r8
	ldr r5, [fp, #-4]
	mov r6, #4
	mov r6, #20
	mov r8, r6, LSL#2
	add r6, r5, r8
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	ldr r8, =65
	mul r5, r6, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r5, #20
	mov r6, r5, LSL#2
	add r5, r4, r6
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =97
	mul r4, r5, r6
	add r6, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #4
	mov r4, #20
	mov r8, r4, LSL#2
	add r4, r5, r8
	mov r5, #2
	mov r5, #4
	mov r8, r5, LSL#1
	add r5, r4, r8
	ldr r4, [r5]
	ldr r8, =83
	mul r5, r4, r8
	add r8, r6, r5
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r5, #20
	mov r6, r5, LSL#2
	add r5, r4, r6
	mov r4, #3
	mov r6, #4
	mul r9, r4, r6
	add r4, r5, r9
	ldr r5, [r4]
	ldr r6, =46
	mul r4, r5, r6
	add r6, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #4
	mov r4, #20
	mov r8, r4, LSL#2
	add r4, r5, r8
	mov r5, #4
	mov r5, #4
	mov r8, r5, LSL#2
	add r5, r4, r8
	ldr r4, [r5]
	ldr r8, =0
	sub r5, r8, #84
	mul r8, r4, r5
	add r5, r6, r8
	mov r0, r5
	bl relu_reg
	mov r4, r0
	ldr r6, =0
	sub r5, r6, #50
	mul r6, r4, r5
	add r5, r7, r6
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r8, r6, r7
	add r6, r4, r8
	mov r4, #0
	mov r8, #4
	mul r7, r4, r8
	add r4, r6, r7
	ldr r6, [r4]
	ldr r7, =0
	sub r4, r7, #29
	mul r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r8, #20
	mul r9, r6, r8
	add r6, r4, r9
	mov r4, #1
	mov r8, #4
	mov r4, r8, LSL#0
	add r8, r6, r4
	ldr r6, [r8]
	ldr r4, =7
	mul r8, r6, r4
	add r4, r7, r8
	ldr r6, [fp, #-4]
	mov r7, #0
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #2
	mov r8, #4
	mov r6, r8, LSL#1
	add r8, r7, r6
	ldr r7, [r8]
	ldr r6, =0
	sub r8, r6, #70
	mul r6, r7, r8
	add r8, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #0
	mov r7, #20
	mul r9, r6, r7
	add r6, r4, r9
	mov r4, #3
	mov r7, #4
	mul r9, r4, r7
	add r4, r6, r9
	ldr r6, [r4]
	ldr r7, =38
	mul r4, r6, r7
	add r7, r8, r4
	ldr r6, [fp, #-4]
	mov r4, #0
	mov r8, #20
	mul r9, r4, r8
	add r4, r6, r9
	mov r6, #4
	mov r6, #4
	mov r8, r6, LSL#2
	add r6, r4, r8
	ldr r4, [r6]
	ldr r8, =0
	sub r6, r8, #90
	mul r8, r4, r6
	add r6, r7, r8
	ldr r4, [fp, #-4]
	mov r7, #1
	mov r7, #20
	mov r8, r7, LSL#0
	add r7, r4, r8
	mov r4, #0
	mov r9, #4
	mul r8, r4, r9
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #15
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r7, #20
	mov r8, r7, LSL#0
	add r7, r6, r8
	mov r6, #1
	mov r8, #4
	mov r6, r8, LSL#0
	add r8, r7, r6
	ldr r7, [r8]
	ldr r6, =0
	sub r8, r6, #32
	mul r6, r7, r8
	add r8, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r6, #20
	mov r7, r6, LSL#0
	add r6, r4, r7
	mov r4, #2
	mov r7, #4
	mov r4, r7, LSL#1
	add r7, r6, r4
	ldr r6, [r7]
	ldr r4, =37
	mul r7, r6, r4
	add r4, r8, r7
	ldr r6, [fp, #-4]
	mov r7, #1
	mov r7, #20
	mov r8, r7, LSL#0
	add r7, r6, r8
	mov r6, #3
	mov r9, #4
	mul r8, r6, r9
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =36
	mul r6, r7, r8
	add r8, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #1
	mov r6, #20
	mov r7, r6, LSL#0
	add r6, r4, r7
	mov r4, #4
	mov r7, #4
	mov r4, r7, LSL#2
	add r7, r6, r4
	ldr r6, [r7]
	ldr r4, =0
	sub r7, r4, #62
	mul r4, r6, r7
	add r7, r8, r4
	ldr r6, [fp, #-4]
	mov r4, #2
	mov r4, #20
	mov r8, r4, LSL#1
	add r4, r6, r8
	mov r6, #0
	mov r9, #4
	mul r8, r6, r9
	add r6, r4, r8
	ldr r4, [r6]
	ldr r8, =0
	sub r6, r8, #125
	mul r8, r4, r6
	add r6, r7, r8
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r7, #20
	mov r8, r7, LSL#1
	add r7, r4, r8
	mov r4, #1
	mov r4, #4
	mov r8, r4, LSL#0
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #46
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #2
	mov r7, #20
	mov r8, r7, LSL#1
	add r7, r6, r8
	mov r6, #2
	mov r8, #4
	mov r6, r8, LSL#1
	add r8, r7, r6
	ldr r7, [r8]
	ldr r6, =0
	sub r8, r6, #70
	mul r6, r7, r8
	add r8, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #2
	mov r6, #20
	mov r7, r6, LSL#1
	add r6, r4, r7
	mov r4, #3
	mov r7, #4
	mul r9, r4, r7
	add r4, r6, r9
	ldr r6, [r4]
	ldr r7, =37
	mul r4, r6, r7
	add r7, r8, r4
	ldr r6, [fp, #-4]
	mov r4, #2
	mov r4, #20
	mov r8, r4, LSL#1
	add r4, r6, r8
	mov r6, #4
	mov r6, #4
	mov r8, r6, LSL#2
	add r6, r4, r8
	ldr r4, [r6]
	ldr r8, =0
	sub r6, r8, #73
	mul r8, r4, r6
	add r6, r7, r8
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
	ldr r8, =0
	sub r4, r8, #34
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r6, r9
	mov r6, #1
	mov r6, #4
	mov r8, r6, LSL#0
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #87
	mul r8, r7, r6
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #3
	mov r8, #20
	mul r9, r7, r8
	add r7, r4, r9
	mov r4, #2
	mov r4, #4
	mov r8, r4, LSL#1
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #75
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #3
	mov r9, #20
	mul r8, r7, r9
	add r7, r6, r8
	mov r6, #3
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =71
	mul r6, r7, r8
	add r8, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #3
	b .B5
.LTORG
.B5:
	mov r7, #20
	mul r9, r6, r7
	add r6, r4, r9
	mov r4, #4
	mov r4, #4
	mov r7, r4, LSL#2
	add r4, r6, r7
	ldr r6, [r4]
	ldr r7, =0
	sub r4, r7, #77
	mul r7, r6, r4
	add r4, r8, r7
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r6, r8
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	ldr r8, =53
	mul r6, r7, r8
	add r8, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #4
	mov r6, #20
	mov r7, r6, LSL#2
	add r6, r4, r7
	mov r4, #1
	mov r4, #4
	mov r7, r4, LSL#0
	add r4, r6, r7
	ldr r6, [r4]
	ldr r7, =37
	mul r4, r6, r7
	add r7, r8, r4
	ldr r6, [fp, #-4]
	mov r4, #4
	mov r4, #20
	mov r8, r4, LSL#2
	add r4, r6, r8
	mov r6, #2
	mov r6, #4
	mov r8, r6, LSL#1
	add r6, r4, r8
	ldr r4, [r6]
	ldr r8, =0
	sub r6, r8, #103
	mul r8, r4, r6
	add r6, r7, r8
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r4, r8
	mov r4, #3
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #13
	mul r8, r7, r4
	add r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r6, r8
	mov r6, #4
	mov r6, #4
	mov r8, r6, LSL#2
	add r6, r7, r8
	ldr r7, [r6]
	ldr r8, =0
	sub r6, r8, #114
	mul r8, r7, r6
	add r6, r4, r8
	mov r0, r6
	bl relu_reg
	mov r4, r0
	ldr r7, =0
	sub r6, r7, #23
	mul r7, r4, r6
	add r6, r5, r7
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
	ldr r7, =67
	mul r4, r5, r7
	ldr r7, [fp, #-4]
	mov r5, #0
	mov r9, #20
	mul r8, r5, r9
	add r5, r7, r8
	mov r7, #1
	mov r7, #4
	mov r8, r7, LSL#0
	add r7, r5, r8
	ldr r5, [r7]
	ldr r8, =42
	mul r7, r5, r8
	add r8, r4, r7
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r7, #20
	mul r9, r5, r7
	add r5, r4, r9
	mov r4, #2
	mov r4, #4
	mov r7, r4, LSL#1
	add r4, r5, r7
	ldr r5, [r4]
	ldr r7, =41
	mul r4, r5, r7
	add r7, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #0
	mov r8, #20
	mul r9, r4, r8
	add r4, r5, r9
	mov r5, #3
	mov r8, #4
	mul r9, r5, r8
	add r5, r4, r9
	ldr r4, [r5]
	ldr r8, =0
	sub r5, r8, #123
	mul r8, r4, r5
	add r5, r7, r8
	ldr r4, [fp, #-4]
	mov r7, #0
	mov r9, #20
	mul r8, r7, r9
	add r7, r4, r8
	mov r4, #4
	mov r4, #4
	mov r8, r4, LSL#2
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =0
	sub r4, r8, #92
	mul r8, r7, r4
	add r4, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #1
	mov r7, #20
	mov r8, r7, LSL#0
	add r7, r5, r8
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r7, r9
	ldr r7, [r5]
	ldr r8, =10
	mul r5, r7, r8
	add r8, r4, r5
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r7, #20
	mov r5, r7, LSL#0
	add r7, r4, r5
	mov r4, #1
	mov r4, #4
	mov r5, r4, LSL#0
	add r4, r7, r5
	ldr r7, [r4]
	ldr r5, =0
	sub r4, r5, #77
	mul r5, r7, r4
	add r4, r8, r5
	ldr r7, [fp, #-4]
	mov r5, #1
	mov r5, #20
	mov r8, r5, LSL#0
	add r5, r7, r8
	mov r7, #2
	mov r7, #4
	mov r8, r7, LSL#1
	add r7, r5, r8
	ldr r5, [r7]
	ldr r8, =75
	mul r7, r5, r8
	add r8, r4, r7
	ldr r4, [fp, #-4]
	mov r5, #1
	mov r5, #20
	mov r7, r5, LSL#0
	add r5, r4, r7
	mov r4, #3
	mov r7, #4
	mul r9, r4, r7
	add r4, r5, r9
	ldr r5, [r4]
	ldr r7, =96
	mul r4, r5, r7
	add r7, r8, r4
	ldr r5, [fp, #-4]
	mov r4, #1
	mov r4, #20
	mov r8, r4, LSL#0
	add r4, r5, r8
	mov r5, #4
	mov r5, #4
	mov r8, r5, LSL#2
	add r5, r4, r8
	ldr r4, [r5]
	ldr r8, =0
	sub r5, r8, #51
	mul r8, r4, r5
	add r5, r7, r8
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r7, #20
	mov r8, r7, LSL#1
	add r7, r4, r8
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r7, r9
	ldr r7, [r4]
	ldr r8, =109
	mul r4, r7, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #2
	mov r4, #20
	mov r7, r4, LSL#1
	add r4, r5, r7
	mov r5, #1
	mov r7, #4
	mov r5, r7, LSL#0
	add r7, r4, r5
	ldr r4, [r7]
	ldr r5, =0
	sub r7, r5, #74
	mul r5, r4, r7
	add r7, r8, r5
	ldr r4, [fp, #-4]
	mov r5, #2
	mov r5, #20
	mov r8, r5, LSL#1
	add r5, r4, r8
	mov r4, #2
	mov r4, #4
	mov r8, r4, LSL#1
	add r4, r5, r8
	ldr r5, [r4]
	ldr r8, =0
	sub r4, r8, #7
	mul r8, r5, r4
	add r4, r7, r8
	ldr r5, [fp, #-4]
	mov r7, #2
	mov r8, #20
	mov r7, r8, LSL#1
	add r8, r5, r7
	mov r5, #3
	mov r7, #4
	mul r9, r5, r7
	add r5, r8, r9
	ldr r7, [r5]
	ldr r8, =0
	sub r5, r8, #122
	mul r8, r7, r5
	add r5, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #2
	mov r7, #20
	mov r8, r7, LSL#1
	add r7, r4, r8
	mov r4, #4
	mov r4, #4
	mov r8, r4, LSL#2
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =67
	mul r4, r7, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #3
	mov r9, #20
	mul r7, r4, r9
	add r4, r5, r7
	mov r5, #0
	mov r7, #4
	mul r9, r5, r7
	add r5, r4, r9
	ldr r4, [r5]
	ldr r7, =47
	mul r5, r4, r7
	add r7, r8, r5
	ldr r4, [fp, #-4]
	mov r5, #3
	mov r9, #20
	mul r8, r5, r9
	add r5, r4, r8
	mov r4, #1
	mov r4, #4
	mov r8, r4, LSL#0
	add r4, r5, r8
	ldr r5, [r4]
	ldr r8, =22
	mul r4, r5, r8
	add r8, r7, r4
	ldr r5, [fp, #-4]
	mov r4, #3
	mov r9, #20
	mul r7, r4, r9
	add r4, r5, r7
	mov r5, #2
	mov r5, #4
	mov r7, r5, LSL#1
	add r5, r4, r7
	ldr r4, [r5]
	ldr r7, =0
	sub r5, r7, #68
	mul r7, r4, r5
	add r5, r8, r7
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
	ldr r8, =38
	mul r4, r7, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #3
	mov r7, #20
	mul r9, r4, r7
	add r4, r5, r9
	mov r5, #4
	mov r5, #4
	mov r7, r5, LSL#2
	add r5, r4, r7
	ldr r4, [r5]
	ldr r7, =29
	mul r5, r4, r7
	add r7, r8, r5
	ldr r4, [fp, #-4]
	mov r5, #4
	mov r5, #20
	mov r8, r5, LSL#2
	add r5, r4, r8
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r5, r9
	ldr r5, [r4]
	ldr r8, =115
	mul r4, r5, r8
	add r8, r7, r4
	ldr r5, [fp, #-4]
	mov r4, #4
	mov r4, #20
	mov r7, r4, LSL#2
	add r4, r5, r7
	mov r5, #1
	mov r5, #4
	mov r7, r5, LSL#0
	add r5, r4, r7
	ldr r4, [r5]
	ldr r7, =0
	sub r5, r7, #121
	mul r7, r4, r5
	add r5, r8, r7
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r4, r8
	mov r4, #2
	mov r4, #4
	mov r8, r4, LSL#1
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =36
	mul r4, r7, r8
	add r8, r5, r4
	ldr r5, [fp, #-4]
	mov r4, #4
	mov r4, #20
	mov r7, r4, LSL#2
	add r4, r5, r7
	mov r5, #3
	mov r9, #4
	mul r7, r5, r9
	add r5, r4, r7
	ldr r4, [r5]
	ldr r7, =0
	sub r5, r7, #49
	mul r7, r4, r5
	add r5, r8, r7
	ldr r4, [fp, #-4]
	mov r7, #4
	mov r7, #20
	mov r8, r7, LSL#2
	add r7, r4, r8
	mov r4, #4
	mov r4, #4
	mov r8, r4, LSL#2
	add r4, r7, r8
	ldr r7, [r4]
	ldr r8, =85
	mul r4, r7, r8
	add r8, r5, r4
	mov r0, r8
	bl relu_reg
	mov r5, r0
	ldr r4, =46
	mul r7, r5, r4
	add r4, r6, r7
	cmp r4, #0
	movgt r5, #1
	movle r5, #0
	bgt .L686
	b .L1939
	b .F6
.LTORG
.F6:
.L686:
	mov r0, #1
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L687:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L1938:
.L1939:
	b .L687
.L1940:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #112
.L1941:
	bl getint
	mov r4, r0
	str r4, [fp, #-112]
	b .L1944
.L1944:
	ldr r4, [fp, #-112]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L1945
	b .L1949
.L1945:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L1952
.L1946:
	mov r0, #0
	add sp, sp, #112
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L1948:
.L1949:
	b .L1946
.L1950:
.L1952:
	ldr r4, [fp, #-8]
	cmp r4, #5
	movlt r4, #1
	movge r4, #0
	blt .L1953
	b .L1957
.L1953:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L1960
.L1954:
	mov r4, #0
	mov r5, #20
	mul r6, r4, r5
	mov r4, #-108
	add r4, fp, r4
	add r5, r4, r6
	mov r0, r5
	bl model
	mov r5, r0
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L1974
	b .L1981
.L1956:
.L1957:
	b .L1954
.L1958:
.L1960:
	ldr r5, [fp, #-4]
	cmp r5, #5
	movlt r4, #1
	movge r4, #0
	blt .L1961
	b .L1965
.L1961:
	bl getint
	mov r5, r0
	ldr r4, [fp, #-8]
	mov r6, #20
	mul r7, r4, r6
	mov r4, #-108
	add r4, fp, r4
	add r6, r4, r7
	ldr r7, [fp, #-4]
	mov r4, #4
	mul r8, r7, r4
	add r7, r6, r8
	str r5, [r7]
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L1960
.L1962:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L1952
.L1964:
.L1965:
	b .L1962
.L1966:
.L1974:
	mov r0, #99
	bl putch
	mov r0, #97
	bl putch
	mov r0, #116
	bl putch
	mov r0, #10
	bl putch
	b .L1976
.L1975:
	mov r0, #100
	bl putch
	mov r0, #111
	bl putch
	mov r0, #103
	bl putch
	mov r0, #10
	bl putch
	b .L1976
.L1976:
	ldr r4, [fp, #-112]
	sub r5, r4, #1
	str r5, [fp, #-112]
	b .L1944
.L1980:
.L1981:
	b .L1975
.L1982:

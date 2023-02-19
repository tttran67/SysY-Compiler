	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global MAX
	.type MAX , %function
MAX:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L29:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	beq .L34
	b .L40
.L34:
	ldr r5, [fp, #-8]
	mov r0, r5
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L35:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L43
	b .L49
.L36:
.L39:
.L40:
	b .L35
.L41:
.L43:
	ldr r5, [fp, #-8]
	mov r0, r5
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L44:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L45:
	b .L36
.L48:
.L49:
	b .L44
.L50:
	.global max_sum_nonadjacent
	.type max_sum_nonadjacent , %function
max_sum_nonadjacent:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #76
.L53:
	str r0, [fp, #-76]
	str r1, [fp, #-72]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-68
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	ldr r4, [fp, #-76]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r6, #0
	mov r5, #4
	mul r7, r6, r5
	mov r6, #-68
	add r6, fp, r6
	add r5, r6, r7
	str r4, [r5]
	ldr r5, [fp, #-76]
	mov r6, #0
	mov r4, #4
	mul r7, r6, r4
	add r6, r5, r7
	ldr r4, [r6]
	ldr r5, [fp, #-76]
	mov r6, #1
	mov r6, #4
	mov r7, r6, LSL#0
	add r6, r5, r7
	ldr r5, [r6]
	mov r0, r4
	mov r1, r5
	bl MAX
	mov r4, r0
	mov r6, #1
	mov r5, #4
	mov r6, r5, LSL#0
	mov r5, #-68
	add r5, fp, r5
	add r7, r5, r6
	str r4, [r7]
	ldr r4, =2
	str r4, [fp, #-4]
	b .L93
.L93:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-72]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L94
	b .L99
.L94:
	ldr r5, [fp, #-4]
	sub r4, r5, #2
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-68
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-76]
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	add r7, r6, r5
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-68
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	mov r0, r7
	mov r1, r6
	bl MAX
	mov r5, r0
	ldr r4, [fp, #-4]
	mov r7, #4
	mul r6, r4, r7
	mov r4, #-68
	add r4, fp, r4
	add r7, r4, r6
	str r5, [r7]
	ldr r6, [fp, #-4]
	add r4, r6, #1
	str r4, [fp, #-4]
	b .L93
.L95:
	ldr r4, [fp, #-72]
	sub r5, r4, #1
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-68
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	mov r0, r6
	add sp, sp, #76
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L98:
.L99:
	b .L95
	b .F0
.LTORG
.F0:
.L100:
	.global longest_common_subseq
	.type longest_common_subseq , %function
longest_common_subseq:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	ldr r4, =1048
	sub sp, sp, r4
.L122:
	ldr r4, =-1048
	str r0, [fp, r4]
	ldr r4, =-1044
	str r1, [fp, r4]
	ldr r4, =-1040
	str r2, [fp, r4]
	ldr r4, =-1036
	str r3, [fp, r4]
	mov r4, #0
	mov r5, #64
	mul r6, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r6
	mov r6, #0
	mov r4, #4
	mul r7, r6, r4
	add r6, r5, r7
	ldr r4, =0
	str r4, [r6]
	mov r5, #0
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #0
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #0
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #0
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #0
	mov r6, #64
	mul r7, r5, r6
	ldr r5, =-1032
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #0
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #0
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #0
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #0
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #0
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #0
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r6, r5, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #0
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #0
	mov r7, #64
	mul r4, r5, r7
	ldr r5, =-1032
	add r7, fp, r5
	add r5, r7, r4
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #0
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #0
	mov r7, #64
	mul r6, r5, r7
	ldr r5, =-1032
	add r7, fp, r5
	add r5, r7, r6
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #1
	mov r4, #64
	mov r6, r4, LSL#0
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #1
	mov r4, #64
	mov r5, r4, LSL#0
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #1
	mov r4, #64
	mov r6, r4, LSL#0
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #1
	mov r4, #64
	mov r5, r4, LSL#0
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #1
	mov r4, #64
	mov r6, r4, LSL#0
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #1
	mov r4, #64
	mov r5, r4, LSL#0
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #1
	mov r4, #64
	mov r6, r4, LSL#0
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #1
	mov r4, #64
	mov r5, r4, LSL#0
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #1
	mov r4, #64
	mov r6, r4, LSL#0
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #1
	mov r4, #64
	mov r5, r4, LSL#0
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #1
	mov r4, #64
	mov r6, r4, LSL#0
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #1
	mov r4, #64
	mov r5, r4, LSL#0
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #1
	mov r6, #64
	mov r4, r6, LSL#0
	ldr r6, =-1032
	add r6, fp, r6
	add r6, r6, r4
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #1
	mov r6, #64
	mov r5, r6, LSL#0
	ldr r6, =-1032
	add r6, fp, r6
	add r7, r6, r5
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #1
	mov r4, #64
	mov r6, r4, LSL#0
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #1
	mov r5, #64
	mov r4, r5, LSL#0
	ldr r5, =-1032
	add r5, fp, r5
	add r7, r5, r4
	add r4, r6, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #2
	mov r6, #64
	mov r5, r6, LSL#1
	ldr r6, =-1032
	add r6, fp, r6
	add r6, r6, r5
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #2
	mov r4, #64
	mov r6, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #2
	mov r4, #64
	mov r5, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #2
	mov r4, #64
	mov r6, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #2
	mov r4, #64
	mov r5, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #2
	mov r4, #64
	mov r6, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #2
	mov r4, #64
	mov r5, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #2
	mov r4, #64
	mov r6, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #2
	mov r4, #64
	mov r5, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #2
	mov r4, #64
	mov r6, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #2
	mov r4, #64
	mov r5, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #2
	mov r4, #64
	mov r6, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #2
	mov r4, #64
	mov r5, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #2
	mov r4, #64
	mov r6, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #2
	mov r4, #64
	mov r5, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #2
	mov r4, #64
	mov r6, r4, LSL#1
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #3
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #3
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #3
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #3
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #3
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #3
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #3
	mov r6, #64
	mul r7, r5, r6
	b .B0
.LTORG
.B0:
	ldr r5, =-1032
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #3
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r5, fp, r4
	add r4, r5, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #3
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #3
	mov r7, #64
	mul r5, r4, r7
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #3
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r6, fp, r6
	add r7, r6, r4
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #3
	mov r7, #64
	mul r6, r5, r7
	ldr r5, =-1032
	add r7, fp, r5
	add r5, r7, r6
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #3
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r6, fp, r4
	add r4, r6, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #3
	mov r7, #64
	mul r6, r5, r7
	ldr r5, =-1032
	add r7, fp, r5
	add r5, r7, r6
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #3
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #3
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #4
	mov r4, #64
	mov r6, r4, LSL#2
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #4
	mov r4, #64
	mov r5, r4, LSL#2
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #4
	mov r4, #64
	mov r6, r4, LSL#2
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #4
	mov r5, #64
	mov r4, r5, LSL#2
	ldr r5, =-1032
	add r5, fp, r5
	add r7, r5, r4
	add r4, r6, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #4
	mov r5, #64
	mov r6, r5, LSL#2
	ldr r5, =-1032
	add r5, fp, r5
	add r7, r5, r6
	add r6, r4, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #4
	mov r4, #64
	mov r5, r4, LSL#2
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #4
	mov r4, #64
	mov r6, r4, LSL#2
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #4
	mov r5, #64
	mov r4, r5, LSL#2
	ldr r5, =-1032
	add r5, fp, r5
	add r5, r5, r4
	add r4, r6, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #4
	mov r5, #64
	mov r6, r5, LSL#2
	ldr r5, =-1032
	add r5, fp, r5
	add r5, r5, r6
	add r6, r4, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #4
	mov r4, #64
	mov r5, r4, LSL#2
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #4
	mov r4, #64
	mov r6, r4, LSL#2
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #4
	mov r4, #64
	mov r5, r4, LSL#2
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #4
	mov r4, #64
	mov r6, r4, LSL#2
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #4
	mov r4, #64
	mov r5, r4, LSL#2
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #4
	mov r4, #64
	mov r6, r4, LSL#2
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #4
	mov r4, #64
	mov r5, r4, LSL#2
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #5
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r6, fp, r4
	add r4, r6, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #5
	mov r6, #64
	mul r7, r5, r6
	ldr r5, =-1032
	add r6, fp, r5
	add r5, r6, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #5
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #5
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #5
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r7, fp, r6
	add r6, r7, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #5
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #5
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #5
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r5, fp, r4
	add r4, r5, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #5
	mov r7, #64
	mul r5, r6, r7
	ldr r6, =-1032
	add r6, fp, r6
	add r7, r6, r5
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #5
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #5
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #5
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #5
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #5
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #5
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #5
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #6
	mov r6, #64
	mul r7, r5, r6
	ldr r5, =-1032
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #6
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r5, fp, r4
	add r4, r5, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #6
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r6, r5, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #6
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #6
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #6
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r7, fp, r6
	add r6, r7, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #6
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #6
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #6
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r5, fp, r4
	add r4, r5, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #6
	mov r7, #64
	mul r5, r6, r7
	ldr r6, =-1032
	add r6, fp, r6
	add r7, r6, r5
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #6
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #6
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #6
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #6
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	b .B1
.LTORG
.B1:
	str r4, [r5]
	mov r6, #6
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #6
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #7
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #7
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #7
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r7, fp, r6
	add r6, r7, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #7
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #7
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r7, fp, r6
	add r6, r7, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #7
	mov r7, #64
	mul r4, r5, r7
	ldr r5, =-1032
	add r7, fp, r5
	add r5, r7, r4
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #7
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r6, fp, r6
	add r7, r6, r4
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #7
	mov r6, #64
	mul r7, r5, r6
	ldr r5, =-1032
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #7
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #7
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #7
	mov r6, #64
	mul r7, r5, r6
	ldr r5, =-1032
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #7
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #7
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r7, fp, r6
	add r6, r7, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #7
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #7
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #7
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r5, fp, r4
	add r4, r5, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #8
	mov r5, #64
	mov r6, r5, LSL#3
	ldr r5, =-1032
	add r5, fp, r5
	add r5, r5, r6
	add r6, r4, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #8
	mov r4, #64
	mov r5, r4, LSL#3
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #8
	mov r4, #64
	mov r6, r4, LSL#3
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #8
	mov r5, #64
	mov r4, r5, LSL#3
	ldr r5, =-1032
	add r5, fp, r5
	add r7, r5, r4
	add r4, r6, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #8
	mov r6, #64
	mov r5, r6, LSL#3
	ldr r6, =-1032
	add r6, fp, r6
	add r6, r6, r5
	add r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #8
	mov r4, #64
	mov r6, r4, LSL#3
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #8
	mov r4, #64
	mov r5, r4, LSL#3
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #8
	mov r6, #64
	mov r4, r6, LSL#3
	ldr r6, =-1032
	add r6, fp, r6
	add r6, r6, r4
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #8
	mov r5, #64
	mov r6, r5, LSL#3
	ldr r5, =-1032
	add r5, fp, r5
	add r7, r5, r6
	add r6, r4, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #8
	mov r4, #64
	mov r5, r4, LSL#3
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #8
	mov r4, #64
	mov r6, r4, LSL#3
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #8
	mov r4, #64
	mov r5, r4, LSL#3
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #8
	mov r6, #64
	mov r4, r6, LSL#3
	ldr r6, =-1032
	add r6, fp, r6
	add r6, r6, r4
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #8
	mov r5, #64
	mov r6, r5, LSL#3
	ldr r5, =-1032
	add r5, fp, r5
	add r7, r5, r6
	add r6, r4, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #8
	mov r4, #64
	mov r5, r4, LSL#3
	ldr r4, =-1032
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #8
	mov r4, #64
	mov r6, r4, LSL#3
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #9
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r5, fp, r4
	add r4, r5, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #9
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r6, r5, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #9
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #9
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #9
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #9
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #9
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #9
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #9
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #9
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #9
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #9
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #9
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #9
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #9
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #9
	mov r6, #64
	mul r7, r5, r6
	ldr r5, =-1032
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #10
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #10
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r7, fp, r6
	add r6, r7, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #10
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #10
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #10
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #10
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	b .B2
.LTORG
.B2:
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #10
	mov r7, #64
	mul r4, r5, r7
	ldr r5, =-1032
	add r5, fp, r5
	add r7, r5, r4
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #10
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r6, r5, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #10
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #10
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #10
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r6, r5, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #10
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r6, fp, r4
	add r4, r6, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #10
	mov r6, #64
	mul r7, r5, r6
	ldr r5, =-1032
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #10
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #10
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #10
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #11
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r7, fp, r6
	add r6, r7, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #11
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #11
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #11
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #11
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #11
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #11
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #11
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #11
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #11
	mov r6, #64
	mul r7, r5, r6
	ldr r5, =-1032
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #11
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #11
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r7, fp, r6
	add r6, r7, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #11
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #11
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #11
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #11
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #12
	mov r7, #64
	mul r4, r5, r7
	ldr r5, =-1032
	add r5, fp, r5
	add r7, r5, r4
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #12
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r6, r5, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #12
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #12
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #12
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r6, r5, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #12
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r6, fp, r4
	add r4, r6, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #12
	mov r6, #64
	mul r7, r5, r6
	ldr r5, =-1032
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #12
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #12
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #12
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #12
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r7, fp, r6
	add r6, r7, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #12
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #12
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #12
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #12
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #12
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #13
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #13
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #13
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #13
	mov r6, #64
	mul r7, r5, r6
	ldr r5, =-1032
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #13
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #13
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r7, fp, r6
	add r6, r7, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #13
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #13
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #13
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #13
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #13
	mov r7, #64
	mul r4, r5, r7
	ldr r5, =-1032
	add r5, fp, r5
	add r7, r5, r4
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #13
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r6, r5, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #13
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	b .B3
.LTORG
.B3:
	mov r5, #13
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #13
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r6, r5, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #13
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r6, fp, r4
	add r4, r6, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #14
	mov r6, #64
	mul r7, r5, r6
	ldr r5, =-1032
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #14
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #14
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #14
	mov r7, #64
	mul r4, r5, r7
	ldr r5, =-1032
	add r7, fp, r5
	add r5, r7, r4
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #14
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r7, fp, r6
	add r6, r7, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #14
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #14
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #14
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r5, fp, r4
	add r4, r5, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #14
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #14
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #14
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #14
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #14
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #14
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #14
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r6, r5, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #14
	mov r6, #64
	mul r7, r4, r6
	ldr r4, =-1032
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #15
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #15
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #15
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #15
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #15
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #15
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #15
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #15
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #15
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #15
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #15
	mov r7, #64
	mul r5, r4, r7
	ldr r4, =-1032
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #15
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #15
	mov r4, #64
	mul r7, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #15
	mov r5, #64
	mul r7, r6, r5
	ldr r6, =-1032
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #15
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #15
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	ldr r4, =1
	str r4, [fp, #-8]
	b .L648
	b .F5
.LTORG
.F5:
.L648:
	ldr r5, [fp, #-8]
	ldr r6, =-1044
	ldr r4, [fp, r6]
	cmp r5, r4
	movle r5, #1
	movgt r5, #0
	ble .L649
	b .L654
.L649:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L656
.L650:
	ldr r4, =-1044
	ldr r5, [fp, r4]
	mov r4, #64
	mul r6, r5, r4
	ldr r5, =-1032
	add r4, fp, r5
	add r5, r4, r6
	ldr r6, =-1036
	ldr r4, [fp, r6]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	mov r0, r5
	ldr r2, =1048
	add sp, sp, r2
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L653:
.L654:
	b .L650
.L655:
.L656:
	ldr r5, [fp, #-4]
	ldr r6, =-1036
	ldr r4, [fp, r6]
	cmp r5, r4
	movle r5, #1
	movgt r5, #0
	ble .L657
	b .L662
.L657:
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	ldr r6, =-1048
	ldr r4, [fp, r6]
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	sub r5, r6, #1
	ldr r7, =-1040
	ldr r6, [fp, r7]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	cmp r4, r6
	moveq r6, #1
	movne r6, #0
	beq .L664
	b .L678
.L658:
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L648
.L661:
.L662:
	b .L658
.L663:
.L664:
	ldr r5, [fp, #-8]
	sub r4, r5, #1
	mov r5, #64
	mul r6, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [fp, #-4]
	sub r4, r6, #1
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	add r6, r5, #1
	ldr r4, [fp, #-8]
	mov r5, #64
	mul r7, r4, r5
	ldr r4, =-1032
	add r4, fp, r4
	add r5, r4, r7
	ldr r7, [fp, #-4]
	mov r4, #4
	mul r8, r7, r4
	add r7, r5, r8
	str r6, [r7]
	b .L666
.L665:
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	mov r6, #64
	mul r4, r5, r6
	ldr r6, =-1032
	add r6, fp, r6
	add r5, r6, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mul r6, r4, r7
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, [fp, #-8]
	mov r4, #64
	mul r7, r6, r4
	ldr r6, =-1032
	add r6, fp, r6
	add r4, r6, r7
	ldr r7, [fp, #-4]
	sub r6, r7, #1
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	mov r0, r5
	mov r1, r4
	bl MAX
	mov r5, r0
	ldr r6, [fp, #-8]
	mov r7, #64
	mul r4, r6, r7
	ldr r6, =-1032
	add r6, fp, r6
	add r7, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #4
	mul r8, r4, r6
	add r4, r7, r8
	str r5, [r4]
	b .L666
.L666:
	ldr r5, [fp, #-4]
	add r6, r5, #1
	str r6, [fp, #-4]
	b .L656
.L677:
.L678:
	b .L665
.L679:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #112
.L716:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-112
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =8
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =7
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =4
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =1
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =2
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =7
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =1
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =9
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =3
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =4
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =8
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =3
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =7
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-52
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =3
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =9
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =7
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =1
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =4
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =2
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =4
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =3
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =6
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =8
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =1
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =5
	str r6, [r5]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-112
	add r5, fp, r4
	add r4, r5, r6
	mov r0, r4
	mov r1, #15
	bl max_sum_nonadjacent
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r5, #0
	mov r6, #4
	mul r4, r5, r6
	mov r5, #-112
	add r5, fp, r5
	add r6, r5, r4
	mov r4, #0
	mov r5, #4
	mul r7, r4, r5
	mov r4, #-52
	add r4, fp, r4
	add r5, r4, r7
	mov r0, r6
	mov r1, #15
	mov r2, r5
	mov r3, #13
	bl longest_common_subseq
	mov r6, r0
	mov r0, r6
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	add sp, sp, #112
	pop {r4, r5, r6, r7, fp, lr}
	bx lr


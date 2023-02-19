	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.comm indegree, 40, 4
	.comm map, 400, 4
	.comm queue, 40, 4
	.text
	.global topo
	.type topo , %function
topo:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L21:
	str r0, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =1
	str r4, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L28
.L28:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L29
	b .L34
.L29:
	ldr r5, =1
	str r5, [fp, #-4]
	b .L36
.L30:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L92
.L33:
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L34:
	b .L30
.L35:
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L36:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-20]
	cmp r5, r4
	movle r5, #1
	movgt r5, #0
	ble .L37
	b .L42
.L37:
	ldr r4, [fp, #-4]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_indegree_0
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #0
	moveq r5, #1
	movne r5, #0
	beq .L44
	b .L51
.L38:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul r7, r5, r6
	ldr r6, addr_queue_0
	add r5, r6, r7
	str r4, [r5]
	ldr r4, [fp, #-12]
	add r6, r4, #1
	str r6, [fp, #-12]
	ldr r5, =0
	sub r4, r5, #1
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	ldr r6, addr_indegree_0
	add r5, r6, r7
	str r4, [r5]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L63
.L41:
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L42:
	b .L38
.L43:
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L44:
	ldr r4, [fp, #-4]
	str r4, [fp, #-16]
	b .L38
.L45:
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L36
.L50:
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L51:
	b .L45
.L52:
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L63:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-20]
	cmp r5, r4
	movle r5, #1
	movgt r5, #0
	ble .L64
	b .L69
.L64:
	ldr r4, [fp, #-16]
	mov r5, #40
	mul r6, r4, r5
	ldr r5, addr_map_0
	add r4, r5, r6
	ldr r6, [fp, #-4]
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, [r6]
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L71
	b .L81
.L65:
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L28
.L68:
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L69:
	b .L65
.L70:
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L71:
	ldr r5, [fp, #-4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_indegree_0
	add r5, r4, r6
	ldr r6, [r5]
	sub r4, r6, #1
	ldr r5, [fp, #-4]
	mov r7, #4
	mul r6, r5, r7
	ldr r7, addr_indegree_0
	add r5, r7, r6
	str r4, [r5]
	b .L72
.L72:
	ldr r5, [fp, #-4]
	add r6, r5, #1
	str r6, [fp, #-4]
	b .L63
.L80:
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L81:
	b .L72
.L82:
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L92:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L93
	b .L98
.L93:
	ldr r5, [fp, #-8]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_queue_0
	add r5, r4, r6
	ldr r6, [r5]
	mov r0, r6
	bl putint
	mov r0, #10
	bl putch
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L92
	b .F0
.LTORG
addr_indegree_0:
	.word indegree
addr_map_0:
	.word map
addr_queue_0:
	.word queue
.F0:
.L94:
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L97:
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L98:
	b .L94
.L99:
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L105:
	ldr r4, =1
	str r4, [fp, #-4]
	ldr r4, =5
	str r4, [fp, #-12]
	b .L109
.L109:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L110
	b .L115
.L110:
	bl getint
	mov r5, r0
	str r5, [fp, #-8]
	b .L117
.L111:
	ldr r4, [fp, #-12]
	mov r0, r4
	bl topo
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L114:
.L115:
	b .L111
.L116:
.L117:
	ldr r5, [fp, #-8]
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L118
	b .L122
.L118:
	ldr r5, [fp, #-4]
	mov r4, #40
	mul r6, r5, r4
	ldr r4, addr_map_1
	add r5, r4, r6
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r4, r6, r7
	add r6, r5, r4
	ldr r5, =1
	str r5, [r6]
	ldr r4, [fp, #-8]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_indegree_1
	add r4, r5, r6
	ldr r6, [r4]
	add r5, r6, #1
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	ldr r6, addr_indegree_1
	add r4, r6, r7
	str r5, [r4]
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	b .L117
.L119:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L109
.L121:
.L122:
	b .L119
.L123:
addr_indegree_1:
	.word indegree
addr_map_1:
	.word map
addr_queue_1:
	.word queue

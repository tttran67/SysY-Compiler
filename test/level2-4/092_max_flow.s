	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global INF
	.align 4
	.size INF, 4
INF:
	.word 1879048192
	.comm cap, 400, 4
	.comm rev, 400, 4
	.comm size, 40, 4
	.comm to, 400, 4
	.comm used, 40, 4
	.text
	.global my_memset
	.type my_memset , %function
my_memset:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L31:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L40
.L40:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L41
	b .L46
.L41:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-4]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	str r5, [r4]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L40
.L42:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L45:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L46:
	b .L42
.L47:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global add_node
	.type add_node , %function
add_node:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L54:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	mov r6, #40
	mul r7, r5, r6
	ldr r6, addr_to_0
	add r5, r6, r7
	ldr r7, [fp, #-12]
	mov r6, #4
	mul r8, r7, r6
	ldr r6, addr_size_0
	add r7, r6, r8
	ldr r8, [r7]
	mov r6, #4
	mul r7, r8, r6
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r6, [fp, #-12]
	mov r5, #40
	mul r7, r6, r5
	ldr r5, addr_cap_0
	add r6, r5, r7
	ldr r7, [fp, #-12]
	mov r5, #4
	mul r8, r7, r5
	ldr r5, addr_size_0
	add r7, r5, r8
	ldr r8, [r7]
	mov r5, #4
	mul r7, r8, r5
	add r5, r6, r7
	str r4, [r5]
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r5, r4, r6
	ldr r6, addr_size_0
	add r4, r6, r5
	ldr r6, [r4]
	ldr r5, [fp, #-12]
	mov r4, #40
	mul r7, r5, r4
	ldr r4, addr_rev_0
	add r5, r4, r7
	ldr r7, [fp, #-12]
	mov r4, #4
	mul r8, r7, r4
	ldr r4, addr_size_0
	add r7, r4, r8
	ldr r8, [r7]
	mov r7, #4
	mul r4, r8, r7
	add r8, r5, r4
	str r6, [r8]
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-8]
	mov r6, #40
	mul r7, r4, r6
	ldr r6, addr_to_0
	add r4, r6, r7
	ldr r7, [fp, #-8]
	mov r6, #4
	mul r8, r7, r6
	ldr r6, addr_size_0
	add r7, r6, r8
	ldr r8, [r7]
	mov r7, #4
	mul r6, r8, r7
	add r8, r4, r6
	str r5, [r8]
	ldr r4, [fp, #-8]
	mov r5, #40
	mul r6, r4, r5
	ldr r4, addr_cap_0
	add r5, r4, r6
	ldr r6, [fp, #-8]
	mov r4, #4
	mul r7, r6, r4
	ldr r4, addr_size_0
	add r6, r4, r7
	ldr r7, [r6]
	mov r4, #4
	mul r6, r7, r4
	add r4, r5, r6
	ldr r5, =0
	str r5, [r4]
	ldr r4, [fp, #-12]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_size_0
	add r4, r5, r6
	ldr r6, [r4]
	ldr r5, [fp, #-8]
	mov r4, #40
	mul r7, r5, r4
	ldr r4, addr_rev_0
	add r5, r4, r7
	ldr r7, [fp, #-8]
	mov r8, #4
	mul r4, r7, r8
	ldr r8, addr_size_0
	add r7, r8, r4
	ldr r4, [r7]
	mov r8, #4
	mul r7, r4, r8
	add r8, r5, r7
	str r6, [r8]
	ldr r4, [fp, #-12]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_size_0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r5, #1
	ldr r4, [fp, #-12]
	mov r5, #4
	mul r7, r4, r5
	ldr r5, addr_size_0
	add r4, r5, r7
	str r6, [r4]
	ldr r4, [fp, #-8]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_size_0
	add r5, r4, r6
	ldr r6, [r5]
	add r4, r6, #1
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	ldr r6, addr_size_0
	add r5, r6, r7
	str r4, [r5]
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global dfs
	.type dfs , %function
dfs:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L134:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	str r2, [fp, #-16]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	beq .L141
	b .L146
.L141:
	ldr r5, [fp, #-16]
	mov r0, r5
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L142:
	ldr r4, [fp, #-24]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_used_0
	add r4, r5, r6
	ldr r6, =1
	str r6, [r4]
	ldr r4, =0
	str r4, [fp, #-12]
	b .L153
.L145:
.L146:
	b .L142
.L147:
.L153:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-24]
	mov r6, #4
	mul r7, r4, r6
	ldr r6, addr_size_0
	add r4, r6, r7
	ldr r7, [r4]
	cmp r5, r7
	movlt r4, #1
	movge r4, #0
	blt .L154
	b .L162
.L154:
	ldr r4, [fp, #-24]
	mov r5, #40
	mul r6, r4, r5
	ldr r4, addr_to_0
	add r5, r4, r6
	ldr r4, [fp, #-12]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	mov r6, #4
	mul r4, r5, r6
	ldr r5, addr_used_0
	add r6, r5, r4
	ldr r4, [r6]
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L164
	b .L177
.L155:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L161:
.L162:
	b .L155
.L163:
.L164:
	ldr r5, [fp, #-12]
	add r4, r5, #1
	str r4, [fp, #-12]
	b .L153
.L165:
	ldr r5, [fp, #-24]
	mov r4, #40
	mul r6, r5, r4
	ldr r4, addr_cap_0
	add r5, r4, r6
	ldr r6, [fp, #-12]
	mov r4, #4
	mul r7, r6, r4
	add r6, r5, r7
	ldr r4, [r6]
	cmp r4, #0
	movle r4, #1
	movgt r4, #0
	ble .L181
	b .L190
.L176:
.L177:
	b .L165
.L178:
.L180:
	b .L165
.L181:
	ldr r5, [fp, #-12]
	add r4, r5, #1
	str r4, [fp, #-12]
	b .L153
.L182:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-24]
	mov r6, #40
	mul r7, r4, r6
	ldr r4, addr_cap_0
	add r6, r4, r7
	ldr r4, [fp, #-12]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	cmp r5, r6
	movlt r4, #1
	movge r4, #0
	blt .L195
	b .L206
.L189:
.L190:
	b .L182
.L191:
.L193:
	b .L182
.L195:
	ldr r4, [fp, #-16]
	str r4, [fp, #-8]
	b .L197
.L196:
	ldr r5, [fp, #-24]
	mov r4, #40
	mul r6, r5, r4
	ldr r4, addr_cap_0
	add r5, r4, r6
	ldr r6, [fp, #-12]
	mov r4, #4
	mul r7, r6, r4
	add r6, r5, r7
	ldr r4, [r6]
	str r4, [fp, #-8]
	b .L197
.L197:
	ldr r4, [fp, #-24]
	mov r6, #40
	mul r5, r4, r6
	ldr r6, addr_to_0
	add r4, r6, r5
	ldr r5, [fp, #-12]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl dfs
	mov r4, r0
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	cmp r5, #0
	movgt r4, #1
	movle r4, #0
	bgt .L224
	b .L228
.L205:
.L206:
	b .L196
.L207:
.L224:
	ldr r5, [fp, #-24]
	mov r4, #40
	mul r6, r5, r4
	ldr r4, addr_cap_0
	add r5, r4, r6
	ldr r6, [fp, #-12]
	mov r7, #4
	mul r4, r6, r7
	add r6, r5, r4
	ldr r5, [r6]
	ldr r4, [fp, #-4]
	sub r6, r5, r4
	ldr r4, [fp, #-24]
	mov r5, #40
	mul r7, r4, r5
	ldr r5, addr_cap_0
	add r4, r5, r7
	ldr r7, [fp, #-12]
	mov r5, #4
	mul r8, r7, r5
	add r7, r4, r8
	str r6, [r7]
	ldr r4, [fp, #-24]
	mov r5, #40
	mul r6, r4, r5
	ldr r4, addr_to_0
	add r5, r4, r6
	ldr r6, [fp, #-12]
	mov r4, #4
	mul r7, r6, r4
	add r6, r5, r7
	ldr r4, [r6]
	mov r5, #40
	mul r6, r4, r5
	ldr r4, addr_cap_0
	add r5, r4, r6
	ldr r6, [fp, #-24]
	mov r4, #40
	mul r7, r6, r4
	ldr r6, addr_rev_0
	add r4, r6, r7
	ldr r6, [fp, #-12]
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	mov r7, #4
	mul r6, r4, r7
	add r7, r5, r6
	ldr r4, [r7]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	ldr r5, [fp, #-24]
	mov r4, #40
	mul r7, r5, r4
	ldr r4, addr_to_0
	add r5, r4, r7
	ldr r7, [fp, #-12]
	mov r4, #4
	mul r8, r7, r4
	add r7, r5, r8
	ldr r4, [r7]
	mov r5, #40
	mul r7, r4, r5
	ldr r5, addr_cap_0
	add r4, r5, r7
	ldr r5, [fp, #-24]
	mov r7, #40
	mul r8, r5, r7
	ldr r7, addr_rev_0
	add r5, r7, r8
	ldr r8, [fp, #-12]
	mov r7, #4
	mul r9, r8, r7
	add r8, r5, r9
	ldr r5, [r8]
	mov r7, #4
	mul r8, r5, r7
	add r7, r4, r8
	str r6, [r7]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

	b .F0
.LTORG
addr_INF_0:
	.word INF
addr_cap_0:
	.word cap
addr_rev_0:
	.word rev
addr_size_0:
	.word size
addr_to_0:
	.word to
addr_used_0:
	.word used
.F0:
.L225:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L153
.L227:
.L228:
	b .L225
.L229:
	.global max_flow
	.type max_flow , %function
max_flow:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L276:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L282
.L282:
	ldr r4, =1
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L283
	b .L287
.L283:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_used_1
	add r4, r5, r6
	mov r0, r4
	mov r1, #0
	mov r2, #10
	bl my_memset
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	ldr r6, addr_INF_1
	ldr r7, [r6]
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl dfs
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	moveq r5, #1
	movne r5, #0
	beq .L295
	b .L299
.L284:
.L286:
.L287:
	b .L284
.L288:
.L295:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L296:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-4]
	add r6, r5, r4
	str r6, [fp, #-8]
	b .L282
.L298:
.L299:
	b .L296
.L300:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L304:
	bl getint
	mov r4, r0
	str r4, [fp, #-20]
	bl getint
	mov r4, r0
	str r4, [fp, #-16]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_size_1
	add r5, r4, r6
	mov r0, r5
	mov r1, #0
	mov r2, #10
	bl my_memset
	b .L309
.L309:
	ldr r4, [fp, #-16]
	cmp r4, #0
	movgt r5, #1
	movle r5, #0
	bgt .L310
	b .L314
.L310:
	bl getint
	mov r4, r0
	str r4, [fp, #-12]
	bl getint
	mov r5, r0
	str r5, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-8]
	ldr r6, [fp, #-4]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl add_node
	ldr r5, [fp, #-16]
	sub r4, r5, #1
	str r4, [fp, #-16]
	b .L309
.L311:
	ldr r5, [fp, #-20]
	mov r0, #1
	mov r1, r5
	bl max_flow
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, fp, lr}
	bx lr

.L313:
.L314:
	b .L311
.L315:
addr_INF_1:
	.word INF
addr_cap_1:
	.word cap
addr_rev_1:
	.word rev
addr_size_1:
	.word size
addr_to_1:
	.word to
addr_used_1:
	.word used

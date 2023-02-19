	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.comm array, 440, 4
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.text
	.global init
	.type init , %function
init:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L70:
	str r0, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L74
.L74:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-8]
	mul r7, r5, r6
	add r5, r7, #1
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L75
	b .L81
.L75:
	ldr r4, =0
	sub r5, r4, #1
	ldr r4, [fp, #-4]
	mov r6, #4
	mul r7, r4, r6
	ldr r6, addr_array_0
	add r4, r6, r7
	str r5, [r4]
	ldr r5, [fp, #-4]
	add r6, r5, #1
	str r6, [fp, #-4]
	b .L74
.L76:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L80:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L81:
	b .L76
.L82:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global findfa
	.type findfa , %function
findfa:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L87:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_array_0
	add r4, r5, r6
	ldr r6, [r4]
	ldr r5, [fp, #-4]
	cmp r6, r5
	moveq r4, #1
	movne r4, #0
	beq .L90
	b .L99
.L90:
	ldr r5, [fp, #-4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L91:
	ldr r4, [fp, #-4]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_array_0
	add r5, r4, r6
	ldr r4, [r5]
	mov r0, r4
	bl findfa
	mov r4, r0
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	ldr r6, addr_array_0
	add r5, r6, r7
	str r4, [r5]
	ldr r4, [fp, #-4]
	mov r6, #4
	mul r5, r4, r6
	ldr r4, addr_array_0
	add r6, r4, r5
	ldr r5, [r6]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L92:
.L98:
.L99:
	b .L91
.L100:
	.global mmerge
	.type mmerge , %function
mmerge:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L113:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, [fp, #-16]
	mov r0, r4
	bl findfa
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	mov r0, r4
	bl findfa
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movne r4, #1
	moveq r4, #0
	bne .L122
	b .L127
.L122:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	ldr r6, addr_array_0
	add r4, r6, r7
	str r5, [r4]
	b .L123
.L123:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L126:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L127:
	b .L123
.L128:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #36
.L133:
	ldr r4, =1
	str r4, [fp, #-36]
	b .L138
.L138:
	ldr r4, [fp, #-36]
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L139
	b .L144
.L139:
	ldr r4, [fp, #-36]
	sub r5, r4, #1
	str r5, [fp, #-36]
	ldr r4, =4
	ldr r5, addr_n_0
	str r4, [r5]
	ldr r4, =10
	str r4, [fp, #-32]
	ldr r5, =0
	str r5, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r5, addr_n_0
	ldr r4, [r5]
	mov r0, r4
	bl init
	ldr r5, addr_n_0
	ldr r4, [r5]
	ldr r5, addr_n_0
	ldr r6, [r5]
	mul r5, r4, r6
	add r4, r5, #1
	str r4, [fp, #-12]
	b .L153
.L140:
	mov r0, #0
	add sp, sp, #36
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L143:
.L144:
	b .L140
.L145:
.L153:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-32]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L154
	b .L159
.L154:
	bl getint
	mov r5, r0
	str r5, [fp, #-28]
	bl getint
	mov r4, r0
	str r4, [fp, #-24]
	ldr r5, [fp, #-16]
	cmp r5, #0
	moveq r4, #1
	movne r4, #0
	beq .L161
	b .L165
.L155:
	ldr r5, [fp, #-16]
	cmp r5, #0
	moveq r4, #1
	movne r4, #0
	beq .L292
	b .L296
.L158:
.L159:
	b .L155
.L160:
.L161:
	ldr r5, addr_n_0
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	sub r6, r5, #1
	mul r5, r4, r6
	ldr r4, [fp, #-24]
	add r6, r5, r4
	str r6, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	ldr r6, addr_array_0
	add r5, r6, r7
	str r4, [r5]
	ldr r4, [fp, #-28]
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L175
	b .L179
.L162:
	ldr r5, [fp, #-20]
	add r4, r5, #1
	str r4, [fp, #-20]
	b .L153
.L164:
.L165:
	b .L162
.L166:
.L175:
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_array_0
	add r5, r4, r6
	ldr r6, =0
	str r6, [r5]
	ldr r4, [fp, #-8]
	mov r0, r4
	mov r1, #0
	bl mmerge
	b .L176
.L176:
	ldr r5, [fp, #-28]
	ldr r4, addr_n_0
	ldr r6, [r4]
	cmp r5, r6
	moveq r5, #1
	movne r5, #0
	beq .L184
	b .L189
.L178:
.L179:
	b .L176
.L180:
.L184:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul r7, r5, r6
	ldr r5, addr_array_0
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	mov r0, r4
	mov r1, r5
	bl mmerge
	b .L185
.L185:
	ldr r5, [fp, #-24]
	ldr r4, addr_n_0
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L199
	b .L203
.L188:
.L189:
	b .L185
.L190:
.L197:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	add r6, r5, #1
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L198
.L198:
	ldr r4, [fp, #-24]
	cmp r4, #1
	movgt r5, #1
	movle r5, #0
	bgt .L216
	b .L219
.L199:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_array_0
	add r5, r4, r6
	ldr r6, [r5]
	ldr r4, =0
	sub r5, r4, #1
	cmp r6, r5
	movne r4, #1
	moveq r4, #0
	bne .L197
	b .L210
	b .F0
.LTORG
addr_array_0:
	.word array
addr_n_0:
	.word n
.F0:
.L202:
.L203:
	b .L198
.L204:
.L209:
.L210:
	b .L198
.L211:
.L214:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-8]
	sub r6, r4, #1
	mov r0, r5
	mov r1, r6
	bl mmerge
	b .L215
.L215:
	ldr r5, [fp, #-28]
	ldr r4, addr_n_1
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L232
	b .L236
.L216:
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	mov r4, #4
	mul r6, r5, r4
	ldr r5, addr_array_1
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #1
	cmp r5, r4
	movne r5, #1
	moveq r5, #0
	bne .L214
	b .L226
.L218:
.L219:
	b .L215
.L220:
.L225:
.L226:
	b .L215
.L227:
.L230:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, addr_n_1
	ldr r7, [r6]
	add r6, r5, r7
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L231
.L231:
	ldr r4, [fp, #-28]
	cmp r4, #1
	movgt r4, #1
	movle r4, #0
	bgt .L251
	b .L254
.L232:
	ldr r5, [fp, #-8]
	ldr r4, addr_n_1
	ldr r6, [r4]
	add r4, r5, r6
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_array_1
	add r5, r4, r6
	ldr r6, [r5]
	ldr r4, =0
	sub r5, r4, #1
	cmp r6, r5
	movne r4, #1
	moveq r4, #0
	bne .L230
	b .L244
.L235:
.L236:
	b .L231
.L237:
.L243:
.L244:
	b .L231
.L245:
.L249:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r6, addr_n_1
	ldr r7, [r6]
	sub r6, r4, r7
	mov r0, r5
	mov r1, r6
	bl mmerge
	b .L250
.L250:
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	ldr r5, addr_array_1
	add r4, r5, r6
	ldr r6, [r4]
	ldr r5, =0
	sub r4, r5, #1
	cmp r6, r4
	movne r5, #1
	moveq r5, #0
	bne .L270
	b .L275
.L251:
	ldr r4, [fp, #-8]
	ldr r5, addr_n_1
	ldr r6, [r5]
	sub r5, r4, r6
	mov r4, #4
	mul r6, r5, r4
	ldr r5, addr_array_1
	add r4, r5, r6
	ldr r6, [r4]
	ldr r5, =0
	sub r4, r5, #1
	cmp r6, r4
	movne r5, #1
	moveq r5, #0
	bne .L249
	b .L262
.L253:
.L254:
	b .L250
.L255:
.L261:
.L262:
	b .L250
.L263:
.L267:
	ldr r4, =1
	str r4, [fp, #-16]
	ldr r5, [fp, #-20]
	add r4, r5, #1
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	b .L268
.L268:
	b .L162
.L269:
	mov r0, #0
	bl findfa
	mov r4, r0
	ldr r5, [fp, #-12]
	mov r0, r5
	bl findfa
	mov r5, r0
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	beq .L267
	b .L286
.L270:
	ldr r5, [fp, #-12]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_array_1
	add r5, r4, r6
	ldr r6, [r5]
	ldr r4, =0
	sub r5, r4, #1
	cmp r6, r5
	movne r4, #1
	moveq r4, #0
	bne .L269
	b .L282
.L274:
.L275:
	b .L268
.L276:
.L281:
.L282:
	b .L268
.L283:
.L285:
.L286:
	b .L268
.L287:
.L292:
	ldr r5, =0
	sub r4, r5, #1
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	b .L293
	b .F1
.LTORG
addr_array_1:
	.word array
addr_n_1:
	.word n
.F1:
.L293:
	b .L138
.L295:
.L296:
	b .L293
.L297:
addr_array_2:
	.word array
addr_n_2:
	.word n

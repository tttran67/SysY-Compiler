	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.global b
	.align 4
	.size b, 4
b:
	.word 0
	.global d
	.align 4
	.size d, 4
d:
	.word 0
	.text
	.global set_a
	.type set_a , %function
set_a:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L76:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_a_0
	str r4, [r5]
	ldr r4, addr_a_0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

	.global set_b
	.type set_b , %function
set_b:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L81:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_b_0
	str r4, [r5]
	ldr r4, addr_b_0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

	.global set_d
	.type set_d , %function
set_d:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L86:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_d_0
	str r4, [r5]
	ldr r4, addr_d_0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L91:
	ldr r4, =2
	ldr r5, addr_a_0
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_b_0
	str r4, [r5]
	mov r0, #0
	bl set_a
	mov r4, r0
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L94
	b .L97
.L92:
	b .L93
.L93:
	ldr r4, addr_a_0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b_0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, =2
	ldr r5, addr_a_0
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_b_0
	str r4, [r5]
	mov r0, #0
	bl set_a
	mov r4, r0
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L107
	b .L110
.L94:
	mov r0, #1
	bl set_b
	mov r4, r0
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L92
	b .L101
.L96:
.L97:
	b .L93
.L98:
.L100:
.L101:
	b .L93
.L102:
.L105:
	b .L106
.L106:
	ldr r4, addr_a_0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b_0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, =1
	str r4, [fp, #-24]
	ldr r5, =2
	ldr r4, addr_d_0
	str r5, [r4]
	ldr r5, [fp, #-24]
	cmp r5, #1
	movge r4, #1
	movlt r4, #0
	bge .L121
	b .L124
.L107:
	mov r0, #1
	bl set_b
	mov r5, r0
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L105
	b .L114
.L109:
.L110:
	b .L106
.L111:
.L113:
.L114:
	b .L106
.L115:
.L119:
	b .L120
.L120:
	ldr r5, addr_d_0
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #32
	bl putch
	ldr r5, [fp, #-24]
	cmp r5, #1
	movle r4, #1
	movgt r4, #0
	ble .L131
	b .L136
.L121:
	mov r0, #3
	bl set_d
	mov r5, r0
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L119
	b .L128
.L123:
.L124:
	b .L120
.L125:
.L127:
.L128:
	b .L120
.L129:
.L131:
	b .L132
.L132:
	ldr r5, addr_d_0
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r5, #3
	ldr r4, =3
	sub r6, r4, r5
	ldr r5, =16
	cmp r5, r6
	movge r4, #1
	movlt r4, #0
	bge .L143
	b .L146
.L133:
	mov r0, #4
	bl set_d
	mov r5, r0
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L131
	b .L140
.L135:
.L136:
	b .L133
.L137:
.L139:
.L140:
	b .L132
.L141:
.L143:
	mov r0, #65
	bl putch
	b .L144
.L144:
	mov r5, #18
	mov r4, #18
	ldr r6, =36
	sub r7, r6, r4
	cmp r5, r7
	movne r5, #1
	moveq r5, #0
	bne .L148
	b .L151
.L145:
.L146:
	b .L144
.L147:
.L148:
	mov r0, #66
	bl putch
	b .L149
.L149:
	ldr r4, =1
	cmp r4, #8
	movlt r5, #1
	movge r5, #0
	mov r4, #1
	mov r6, r5
	cmp r6, r4
	movne r4, #1
	moveq r4, #0
	bne .L153
	b .L160
	b .F0
.LTORG
addr_a_0:
	.word a
addr_b_0:
	.word b
addr_d_0:
	.word d
.F0:
.L150:
.L151:
	b .L149
.L152:
.L153:
	mov r0, #67
	bl putch
	b .L154
.L154:
	ldr r5, =3
	cmp r5, #4
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	cmp r5, #0
	moveq r4, #1
	movne r4, #0
	beq .L162
	b .L169
.L155:
.L156:
	b .L157
.L157:
.L159:
.L160:
	b .L154
.L161:
.L162:
	mov r0, #68
	bl putch
	b .L163
.L163:
	ldr r5, =102
	cmp r5, #63
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =1
	cmp r4, r5
	moveq r5, #1
	movne r5, #0
	beq .L171
	b .L178
.L164:
.L165:
	b .L166
.L166:
.L168:
.L169:
	b .L163
.L170:
.L171:
	mov r0, #69
	bl putch
	b .L172
.L172:
	mov r4, #-1
	ldr r5, =0
	cmp r5, #0
	moveq r5, #1
	movne r5, #0
	mov r6, r5
	ldr r5, =0
	sub r7, r5, r6
	cmp r4, r7
	moveq r4, #1
	movne r4, #0
	beq .L180
	b .L187
.L173:
.L174:
	b .L175
.L175:
.L177:
.L178:
	b .L172
.L179:
.L180:
	mov r0, #70
	bl putch
	b .L181
.L181:
	mov r0, #10
	bl putch
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r5, =1
	str r5, [fp, #-16]
	ldr r4, =2
	str r4, [fp, #-12]
	ldr r5, =3
	str r5, [fp, #-8]
	ldr r4, =4
	str r4, [fp, #-4]
	b .L194
.L182:
.L183:
	b .L184
.L184:
.L186:
.L187:
	b .L181
.L188:
.L194:
	ldr r5, [fp, #-20]
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L197
	b .L201
.L195:
	mov r0, #32
	bl putch
	b .L194
.L196:
	ldr r5, [fp, #-20]
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L208
	b .L214
.L197:
	ldr r5, [fp, #-16]
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L195
	b .L206
.L200:
.L201:
	b .L196
.L202:
.L205:
.L206:
	b .L196
.L207:
.L208:
	mov r0, #67
	bl putch
	b .L209
.L209:
	ldr r5, [fp, #-20]
	ldr r4, [fp, #-16]
	cmp r5, r4
	movge r5, #1
	movlt r5, #0
	bge .L221
	b .L227
.L210:
	ldr r4, [fp, #-16]
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L208
	b .L219
.L213:
.L214:
	b .L210
.L215:
.L218:
.L219:
	b .L209
.L220:
.L221:
	mov r0, #72
	bl putch
	b .L222
.L222:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L236
	b .L240
.L223:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-20]
	cmp r5, r4
	movle r5, #1
	movgt r5, #0
	ble .L221
	b .L232
.L226:
.L227:
	b .L223
.L228:
.L231:
.L232:
	b .L222
.L233:
.L234:
	mov r0, #73
	bl putch
	b .L235
.L235:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	cmp r5, #0
	moveq r5, #1
	movne r5, #0
	mov r6, r5
	cmp r4, r6
	moveq r4, #1
	movne r4, #0
	beq .L250
	b .L258
.L236:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-8]
	cmp r5, r4
	movne r5, #1
	moveq r5, #0
	bne .L234
	b .L245
.L239:
.L240:
	b .L235
.L241:
.L244:
.L245:
	b .L235
	b .F1
.LTORG
addr_a_1:
	.word a
addr_b_1:
	.word b
addr_d_1:
	.word d
.F1:
.L246:
.L247:
	mov r0, #74
	bl putch
	b .L248
.L248:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	cmp r5, #0
	moveq r5, #1
	movne r5, #0
	mov r6, r5
	cmp r4, r6
	moveq r4, #1
	movne r4, #0
	beq .L270
	b .L280
.L249:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r5, r4
	movge r5, #1
	movlt r5, #0
	bge .L247
	b .L268
.L250:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L247
	b .L263
.L253:
.L254:
	b .L255
.L255:
.L257:
.L258:
	b .L249
.L259:
.L262:
.L263:
	b .L249
.L264:
.L267:
.L268:
	b .L248
.L269:
.L270:
	mov r0, #75
	bl putch
	b .L271
.L271:
	mov r0, #10
	bl putch
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L272:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-8]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L282
	b .L286
.L275:
.L276:
	b .L277
.L277:
.L279:
.L280:
	b .L272
.L281:
.L282:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L270
	b .L291
.L285:
.L286:
	b .L271
.L287:
.L290:
.L291:
	b .L271
.L292:
addr_a_2:
	.word a
addr_b_2:
	.word b
addr_d_2:
	.word d

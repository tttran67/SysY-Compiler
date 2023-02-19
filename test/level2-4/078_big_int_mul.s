	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global len
	.align 4
	.size len, 4
len:
	.word 20
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	ldr r4, =548
	sub sp, sp, r4
.L36:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-528
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =1
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =2
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =3
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =4
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =5
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =6
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =7
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =8
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =9
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =1
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =2
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =3
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =4
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =5
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =6
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =7
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =8
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =9
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-448
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =2
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =3
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =4
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =2
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =5
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =7
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =9
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =9
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
	ldr r6, =8
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =7
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =6
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =4
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =3
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =2
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =1
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =2
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =2
	str r6, [r4]
	ldr r4, addr_len_0
	ldr r5, [r4]
	ldr r4, =-368
	str r5, [fp, r4]
	ldr r5, addr_len_0
	ldr r4, [r5]
	ldr r5, =-364
	str r4, [fp, r5]
	mov r4, #0
	mov r6, #4
	mul r5, r4, r6
	mov r4, #-160
	add r4, fp, r4
	add r6, r4, r5
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	ldr r4, =0
	ldr r5, =-548
	str r4, [fp, r5]
	b .L131
	b .F0
.LTORG
addr_len_0:
	.word len
.F0:
.L131:
	ldr r5, =-548
	ldr r4, [fp, r5]
	ldr r6, =-368
	ldr r5, [fp, r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L132
	b .L137
.L132:
	ldr r4, =-548
	ldr r5, [fp, r4]
	mov r6, #4
	mul r4, r5, r6
	ldr r5, =-528
	add r5, fp, r5
	add r6, r5, r4
	ldr r4, [r6]
	ldr r6, =-548
	ldr r5, [fp, r6]
	mov r6, #4
	mul r7, r5, r6
	ldr r5, =-360
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	ldr r6, =-548
	ldr r5, [fp, r6]
	add r4, r5, #1
	ldr r6, =-548
	str r4, [fp, r6]
	b .L131
.L133:
	ldr r4, =0
	ldr r5, =-548
	str r4, [fp, r5]
	b .L147
.L136:
.L137:
	b .L133
.L138:
.L147:
	ldr r5, =-548
	ldr r4, [fp, r5]
	ldr r6, =-364
	ldr r5, [fp, r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L148
	b .L153
.L148:
	ldr r4, =-548
	ldr r5, [fp, r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-448
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	ldr r4, =-548
	ldr r5, [fp, r4]
	mov r7, #4
	mul r4, r5, r7
	ldr r5, =-260
	add r5, fp, r5
	add r7, r5, r4
	str r6, [r7]
	ldr r5, =-548
	ldr r4, [fp, r5]
	add r6, r4, #1
	ldr r5, =-548
	str r6, [fp, r5]
	b .L147
.L149:
	ldr r4, =-368
	ldr r5, [fp, r4]
	ldr r6, =-364
	ldr r4, [fp, r6]
	add r6, r5, r4
	sub r5, r6, #1
	ldr r4, =-536
	str r5, [fp, r4]
	ldr r5, =0
	ldr r4, =-548
	str r5, [fp, r4]
	b .L165
.L152:
.L153:
	b .L149
.L154:
.L165:
	ldr r4, =-548
	ldr r5, [fp, r4]
	ldr r6, =-536
	ldr r4, [fp, r6]
	cmp r5, r4
	movle r5, #1
	movgt r5, #0
	ble .L166
	b .L171
.L166:
	ldr r5, =-548
	ldr r4, [fp, r5]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-160
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =0
	str r5, [r4]
	ldr r5, =-548
	ldr r4, [fp, r5]
	add r5, r4, #1
	ldr r4, =-548
	str r5, [fp, r4]
	b .L165
.L167:
	ldr r5, =0
	ldr r4, =-532
	str r5, [fp, r4]
	ldr r4, =-364
	ldr r5, [fp, r4]
	sub r4, r5, #1
	ldr r5, =-548
	str r4, [fp, r5]
	b .L178
.L170:
.L171:
	b .L167
.L172:
.L178:
	ldr r5, =-548
	ldr r4, [fp, r5]
	ldr r5, =0
	sub r6, r5, #1
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	bgt .L179
	b .L183
.L179:
	ldr r4, =-548
	ldr r5, [fp, r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-260
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	ldr r5, =-540
	str r6, [fp, r5]
	ldr r4, =-368
	ldr r5, [fp, r4]
	sub r4, r5, #1
	ldr r5, =-544
	str r4, [fp, r5]
	b .L190
.L180:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-160
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #0
	movne r4, #1
	moveq r4, #0
	bne .L234
	b .L240
	b .F1
.LTORG
addr_len_1:
	.word len
.F1:
.L182:
.L183:
	b .L180
.L184:
.L190:
	ldr r4, =-544
	ldr r5, [fp, r4]
	ldr r4, =0
	sub r6, r4, #1
	cmp r5, r6
	movgt r5, #1
	movle r5, #0
	bgt .L191
	b .L195
.L191:
	ldr r5, =-536
	ldr r4, [fp, r5]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-160
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	ldr r4, =-540
	ldr r5, [fp, r4]
	ldr r7, =-544
	ldr r4, [fp, r7]
	mov r7, #4
	mul r8, r4, r7
	ldr r4, =-360
	add r4, fp, r4
	add r7, r4, r8
	ldr r8, [r7]
	mul r4, r5, r8
	add r5, r6, r4
	ldr r6, =-532
	str r5, [fp, r6]
	ldr r5, =-532
	ldr r4, [fp, r5]
	cmp r4, #10
	movge r4, #1
	movlt r4, #0
	bge .L206
	b .L211
.L192:
	ldr r4, =-536
	ldr r5, [fp, r4]
	ldr r6, =-368
	ldr r4, [fp, r6]
	add r6, r5, r4
	sub r5, r6, #1
	ldr r4, =-536
	str r5, [fp, r4]
	ldr r4, =-548
	ldr r5, [fp, r4]
	sub r4, r5, #1
	ldr r5, =-548
	str r4, [fp, r5]
	b .L178
.L194:
.L195:
	b .L192
.L196:
.L206:
	ldr r5, =-532
	ldr r4, [fp, r5]
	ldr r6, =-536
	ldr r5, [fp, r6]
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-160
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	ldr r5, =-536
	ldr r4, [fp, r5]
	sub r6, r4, #1
	mov r5, #4
	mul r4, r6, r5
	mov r5, #-160
	add r6, fp, r5
	add r5, r6, r4
	ldr r6, [r5]
	ldr r5, =-532
	ldr r4, [fp, r5]
	ldr r5, =10
	sdiv r7, r4, r5
	add r4, r6, r7
	ldr r6, =-536
	ldr r5, [fp, r6]
	sub r6, r5, #1
	mov r5, #4
	mul r7, r6, r5
	mov r6, #-160
	add r6, fp, r6
	add r5, r6, r7
	str r4, [r5]
	b .L208
.L207:
	ldr r6, =-532
	ldr r5, [fp, r6]
	ldr r6, =-536
	ldr r4, [fp, r6]
	mov r6, #4
	mul r7, r4, r6
	mov r4, #-160
	add r4, fp, r4
	add r6, r4, r7
	str r5, [r6]
	b .L208
.L208:
	ldr r4, =-544
	ldr r6, [fp, r4]
	sub r5, r6, #1
	ldr r4, =-544
	str r5, [fp, r4]
	ldr r4, =-536
	ldr r5, [fp, r4]
	sub r4, r5, #1
	ldr r5, =-536
	str r4, [fp, r5]
	b .L190
.L210:
.L211:
	b .L207
.L212:
.L234:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-160
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	mov r0, r6
	bl putint
	b .L235
.L235:
	ldr r4, =1
	ldr r5, =-548
	str r4, [fp, r5]
	b .L245
.L239:
.L240:
	b .L235
.L241:
.L245:
	ldr r5, =-548
	ldr r4, [fp, r5]
	ldr r6, =-368
	ldr r5, [fp, r6]
	ldr r7, =-364
	ldr r6, [fp, r7]
	add r7, r5, r6
	sub r5, r7, #1
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L246
	b .L252
.L246:
	ldr r5, =-548
	ldr r4, [fp, r5]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-160
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	mov r0, r6
	bl putint
	ldr r5, =-548
	ldr r4, [fp, r5]
	add r5, r4, #1
	ldr r4, =-548
	str r5, [fp, r4]
	b .L245
	b .F2
.LTORG
addr_len_2:
	.word len
.F2:
.L247:
	mov r0, #0
	ldr r2, =548
	add sp, sp, r2
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L251:
.L252:
	b .L247
.L253:
addr_len_3:
	.word len

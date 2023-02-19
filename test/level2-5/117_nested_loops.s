	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.comm arr1, 57600, 4
	.comm arr2, 107520, 4
	.text
	.global loop1
	.type loop1 , %function
loop1:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #36
.L77:
	str r0, [fp, #-36]
	str r1, [fp, #-32]
	ldr r4, =0
	str r4, [fp, #-28]
	b .L89
.L89:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-36]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L92
	b .L96
.L90:
	ldr r5, =0
	str r5, [fp, #-24]
	b .L103
.L91:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L92:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-32]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L90
	b .L101
.L95:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L96:
	b .L91
.L97:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L100:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L101:
	b .L91
.L102:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L103:
	ldr r5, [fp, #-24]
	cmp r5, #2
	movlt r4, #1
	movge r4, #0
	blt .L104
	b .L108
.L104:
	ldr r5, =0
	str r5, [fp, #-20]
	b .L110
.L105:
	ldr r4, [fp, #-28]
	add r5, r4, #1
	str r5, [fp, #-28]
	b .L89
.L107:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L108:
	b .L105
.L109:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L110:
	ldr r4, [fp, #-20]
	cmp r4, #3
	movlt r5, #1
	movge r5, #0
	blt .L111
	b .L115
.L111:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L117
.L112:
	ldr r5, [fp, #-24]
	add r4, r5, #1
	str r4, [fp, #-24]
	b .L103
.L114:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L115:
	b .L112
.L116:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L117:
	ldr r5, [fp, #-16]
	cmp r5, #4
	movlt r4, #1
	movge r4, #0
	blt .L118
	b .L122
.L118:
	ldr r5, =0
	str r5, [fp, #-12]
	b .L124
.L119:
	ldr r4, [fp, #-20]
	add r5, r4, #1
	str r5, [fp, #-20]
	b .L110
.L121:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L122:
	b .L119
.L123:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L124:
	ldr r4, [fp, #-12]
	cmp r4, #5
	movlt r5, #1
	movge r5, #0
	blt .L125
	b .L129
.L125:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L131
.L126:
	ldr r5, [fp, #-16]
	add r4, r5, #1
	str r4, [fp, #-16]
	b .L117
.L128:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L129:
	b .L126
.L130:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L131:
	ldr r5, [fp, #-8]
	cmp r5, #6
	movlt r4, #1
	movge r4, #0
	blt .L132
	b .L136
.L132:
	ldr r5, =0
	str r5, [fp, #-4]
	b .L138
.L133:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L124
.L135:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L136:
	b .L133
.L137:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L138:
	ldr r4, [fp, #-4]
	cmp r4, #2
	movlt r5, #1
	movge r5, #0
	blt .L139
	b .L143
.L139:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	add r6, r4, r5
	ldr r4, [fp, #-20]
	add r5, r6, r4
	ldr r4, [fp, #-16]
	add r6, r5, r4
	ldr r4, [fp, #-12]
	add r5, r6, r4
	ldr r4, [fp, #-8]
	add r6, r5, r4
	ldr r4, [fp, #-4]
	add r5, r6, r4
	ldr r4, [fp, #-36]
	add r6, r5, r4
	ldr r4, [fp, #-32]
	add r5, r6, r4
	ldr r4, [fp, #-28]
	ldr r6, =5760
	mul r7, r4, r6
	ldr r6, addr_arr1_0
	add r4, r6, r7
	ldr r7, [fp, #-24]
	ldr r6, =2880
	mul r8, r7, r6
	add r7, r4, r8
	ldr r4, [fp, #-20]
	ldr r8, =960
	mul r6, r4, r8
	add r4, r7, r6
	ldr r7, [fp, #-16]
	mov r6, #240
	mul r8, r7, r6
	add r7, r4, r8
	ldr r4, [fp, #-12]
	mov r6, #48
	mul r8, r4, r6
	add r4, r7, r8
	ldr r6, [fp, #-8]
	mov r7, #8
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [fp, #-4]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	str r5, [r4]
	ldr r5, [fp, #-4]
	add r6, r5, #1
	str r6, [fp, #-4]
	b .L138
	b .F0
.LTORG
addr_arr1_0:
	.word arr1
addr_arr2_0:
	.word arr2
.F0:
.L140:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L131
.L142:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L143:
	b .L140
.L144:
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global loop2
	.type loop2 , %function
loop2:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #28
.L176:
	ldr r4, =0
	str r4, [fp, #-28]
	b .L184
.L184:
	ldr r4, [fp, #-28]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L185
	b .L189
.L185:
	ldr r4, =0
	str r4, [fp, #-24]
	b .L191
.L186:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L188:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L189:
	b .L186
.L190:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L191:
	ldr r4, [fp, #-24]
	cmp r4, #2
	movlt r4, #1
	movge r4, #0
	blt .L192
	b .L196
.L192:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L198
.L193:
	ldr r4, [fp, #-28]
	add r5, r4, #1
	str r5, [fp, #-28]
	b .L184
.L195:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L196:
	b .L193
.L197:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L198:
	ldr r4, [fp, #-20]
	cmp r4, #3
	movlt r5, #1
	movge r5, #0
	blt .L199
	b .L203
.L199:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L205
.L200:
	ldr r5, [fp, #-24]
	add r4, r5, #1
	str r4, [fp, #-24]
	b .L191
.L202:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L203:
	b .L200
.L204:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L205:
	ldr r5, [fp, #-16]
	cmp r5, #2
	movlt r4, #1
	movge r4, #0
	blt .L206
	b .L210
.L206:
	ldr r5, =0
	str r5, [fp, #-12]
	b .L212
.L207:
	ldr r4, [fp, #-20]
	add r5, r4, #1
	str r5, [fp, #-20]
	b .L198
.L209:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L210:
	b .L207
.L211:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L212:
	ldr r4, [fp, #-12]
	cmp r4, #4
	movlt r5, #1
	movge r5, #0
	blt .L213
	b .L217
.L213:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L219
.L214:
	ldr r5, [fp, #-16]
	add r4, r5, #1
	str r4, [fp, #-16]
	b .L205
.L216:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L217:
	b .L214
.L218:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L219:
	ldr r5, [fp, #-8]
	cmp r5, #8
	movlt r4, #1
	movge r4, #0
	blt .L220
	b .L224
.L220:
	ldr r5, =0
	str r5, [fp, #-4]
	b .L226
.L221:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L212
.L223:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L224:
	b .L221
.L225:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L226:
	ldr r4, [fp, #-4]
	cmp r4, #7
	movlt r5, #1
	movge r5, #0
	blt .L227
	b .L231
.L227:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	add r6, r4, r5
	ldr r4, [fp, #-16]
	add r5, r6, r4
	ldr r4, [fp, #-4]
	add r6, r5, r4
	ldr r4, [fp, #-28]
	ldr r7, =10752
	mul r5, r4, r7
	ldr r7, addr_arr2_1
	add r4, r7, r5
	ldr r5, [fp, #-24]
	ldr r7, =5376
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-20]
	ldr r7, =1792
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [fp, #-16]
	ldr r8, =896
	mul r7, r5, r8
	add r5, r4, r7
	ldr r4, [fp, #-12]
	mov r7, #224
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [fp, #-8]
	mov r8, #28
	mul r7, r5, r8
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	str r6, [r4]
	ldr r5, [fp, #-4]
	add r6, r5, #1
	str r6, [fp, #-4]
	b .L226
	b .F1
.LTORG
addr_arr1_1:
	.word arr1
addr_arr2_1:
	.word arr2
.F1:
.L228:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L219
.L230:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L231:
	b .L228
.L232:
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global loop3
	.type loop3 , %function
loop3:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #60
.L259:
	str r0, [fp, #-60]
	str r1, [fp, #-56]
	str r2, [fp, #-52]
	str r3, [fp, #-48]
	ldr r0, [fp, #28]
	str r0, [fp, #-44]
	ldr r0, [fp, #32]
	str r0, [fp, #-40]
	ldr r0, [fp, #36]
	str r0, [fp, #-36]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-32]
	b .L282
.L282:
	ldr r4, [fp, #-32]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L283
	b .L287
.L283:
	ldr r4, =0
	str r4, [fp, #-28]
	b .L289
.L284:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #60
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L286:
.L287:
	b .L284
.L288:
.L289:
	ldr r4, [fp, #-28]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L290
	b .L294
.L290:
	ldr r4, =0
	str r4, [fp, #-24]
	b .L296
.L291:
	ldr r4, [fp, #-32]
	add r5, r4, #1
	str r5, [fp, #-32]
	ldr r4, [fp, #-32]
	ldr r5, [fp, #-60]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L413
	b .L418
.L293:
.L294:
	b .L291
.L295:
.L296:
	ldr r5, [fp, #-24]
	ldr r4, =1000
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L297
	b .L301
.L297:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L303
.L298:
	ldr r5, [fp, #-28]
	add r4, r5, #1
	str r4, [fp, #-28]
	ldr r5, [fp, #-28]
	ldr r4, [fp, #-56]
	cmp r5, r4
	movge r5, #1
	movlt r5, #0
	bge .L405
	b .L410
.L300:
.L301:
	b .L298
.L302:
.L303:
	ldr r4, [fp, #-20]
	ldr r5, =10000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L304
	b .L308
.L304:
	ldr r5, =0
	str r5, [fp, #-16]
	b .L310
.L305:
	ldr r4, [fp, #-24]
	add r5, r4, #1
	str r5, [fp, #-24]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-52]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L397
	b .L402
.L307:
.L308:
	b .L305
.L309:
.L310:
	ldr r5, [fp, #-16]
	ldr r4, =100000
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L311
	b .L315
.L311:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L317
.L312:
	ldr r5, [fp, #-20]
	add r4, r5, #1
	str r4, [fp, #-20]
	ldr r5, [fp, #-20]
	ldr r4, [fp, #-48]
	cmp r5, r4
	movge r5, #1
	movlt r5, #0
	bge .L389
	b .L394
.L314:
.L315:
	b .L312
.L316:
.L317:
	ldr r4, [fp, #-12]
	ldr r5, =1000000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L318
	b .L322
.L318:
	ldr r5, =0
	str r5, [fp, #-8]
	b .L324
.L319:
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-44]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L381
	b .L386
.L321:
.L322:
	b .L319
.L323:
.L324:
	ldr r5, [fp, #-8]
	ldr r4, =10000000
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L325
	b .L329
.L325:
	ldr r4, [fp, #-4]
	ldr r5, =817
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	ldr r4, [fp, #-32]
	ldr r5, =5760
	mul r7, r4, r5
	ldr r5, addr_arr1_2
	add r4, r5, r7
	ldr r7, [fp, #-28]
	ldr r8, =2880
	mul r5, r7, r8
	add r7, r4, r5
	ldr r4, [fp, #-24]
	ldr r5, =960
	mul r8, r4, r5
	add r4, r7, r8
	ldr r5, [fp, #-20]
	mov r7, #240
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-16]
	mov r7, #48
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [fp, #-12]
	mov r7, #8
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-8]
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	add r7, r6, r5
	ldr r4, [fp, #-32]
	ldr r5, =10752
	mul r6, r4, r5
	ldr r5, addr_arr2_2
	add r4, r5, r6
	ldr r6, [fp, #-28]
	ldr r5, =5376
	mul r8, r6, r5
	add r6, r4, r8
	ldr r4, [fp, #-24]
	ldr r5, =1792
	mul r8, r4, r5
	add r4, r6, r8
	ldr r5, [fp, #-20]
	ldr r6, =896
	mul r8, r5, r6
	add r5, r4, r8
	ldr r4, [fp, #-16]
	mov r6, #224
	mul r8, r4, r6
	add r4, r5, r8
	ldr r5, [fp, #-12]
	mov r6, #28
	mul r8, r5, r6
	add r5, r4, r8
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r8, r4, r6
	add r4, r5, r8
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-36]
	cmp r5, r4
	movge r5, #1
	movlt r5, #0
	bge .L365
	b .L370
	b .F2
.LTORG
addr_arr1_2:
	.word arr1
addr_arr2_2:
	.word arr2
.F2:
.L326:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-40]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	bge .L373
	b .L378
.L328:
.L329:
	b .L326
.L330:
.L365:
	b .L326
.L366:
	b .L324
.L369:
.L370:
	b .L366
.L371:
.L373:
	b .L319
.L374:
	b .L317
.L377:
.L378:
	b .L374
.L379:
.L381:
	b .L312
.L382:
	b .L310
.L385:
.L386:
	b .L382
.L387:
.L389:
	b .L305
.L390:
	b .L303
.L393:
.L394:
	b .L390
.L395:
.L397:
	b .L298
.L398:
	b .L296
.L401:
.L402:
	b .L398
.L403:
.L405:
	b .L291
.L406:
	b .L289
.L409:
.L410:
	b .L406
.L411:
.L413:
	b .L284
.L414:
	b .L282
.L417:
.L418:
	b .L414
.L419:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #36
.L421:
	bl getint
	mov r4, r0
	str r4, [fp, #-36]
	bl getint
	mov r4, r0
	str r4, [fp, #-32]
	bl getint
	mov r4, r0
	str r4, [fp, #-28]
	bl getint
	mov r4, r0
	str r4, [fp, #-24]
	bl getint
	mov r4, r0
	str r4, [fp, #-20]
	bl getint
	mov r4, r0
	str r4, [fp, #-16]
	bl getint
	mov r4, r0
	str r4, [fp, #-12]
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-32]
	mov r0, r4
	mov r1, r5
	bl loop1
	bl loop2
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	ldr r7, [fp, #-16]
	ldr r8, [fp, #-12]
	ldr r9, [fp, #-8]
	ldr r10, [fp, #-4]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	push {r10}
	push {r9}
	push {r8}
	bl loop3
	add sp, sp, #12
	mov r4, r0
	mov r0, r4
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

addr_arr1_3:
	.word arr1
addr_arr2_3:
	.word arr2

	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.text
	.global bubblesort
	.type bubblesort , %function
bubblesort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L121:
	str r0, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	b .L127
.L127:
	ldr r4, [fp, #-12]
	ldr r5, addr_n_0
	ldr r6, [r5]
	sub r5, r6, #1
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L128
	b .L133
.L128:
	ldr r5, =0
	str r5, [fp, #-8]
	b .L135
.L129:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L132:
.L133:
	b .L129
.L134:
.L135:
	ldr r4, [fp, #-8]
	ldr r5, addr_n_0
	ldr r6, [r5]
	ldr r5, [fp, #-12]
	sub r7, r6, r5
	sub r6, r7, #1
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L136
	b .L142
.L136:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, [fp, #-8]
	add r4, r6, #1
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	cmp r5, r6
	movgt r6, #1
	movle r6, #0
	bgt .L144
	b .L157
.L137:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L127
.L141:
.L142:
	b .L137
.L143:
.L144:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, [fp, #-8]
	add r4, r6, #1
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	str r5, [r4]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-8]
	ldr r4, [fp, #-16]
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	str r5, [r6]
	b .L145
.L145:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L135
.L156:
.L157:
	b .L145
.L158:
	.global insertsort
	.type insertsort , %function
insertsort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L181:
	str r0, [fp, #-16]
	ldr r4, =1
	str r4, [fp, #-12]
	b .L186
.L186:
	ldr r4, [fp, #-12]
	ldr r5, addr_n_0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L187
	b .L192
.L187:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L202
.L188:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L191:
.L192:
	b .L188
.L193:
.L202:
	ldr r4, [fp, #-4]
	ldr r5, =0
	sub r6, r5, #1
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	bgt .L205
	b .L208
.L203:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	add r5, r6, #1
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-4]
	sub r6, r4, #1
	str r6, [fp, #-4]
	b .L202
.L204:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-4]
	add r6, r4, #1
	ldr r4, [fp, #-16]
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	str r5, [r6]
	ldr r5, [fp, #-12]
	add r6, r5, #1
	str r6, [fp, #-12]
	b .L186
.L205:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L203
	b .L217
.L207:
.L208:
	b .L204
.L209:
.L216:
.L217:
	b .L204
.L218:
	.global QuickSort
	.type QuickSort , %function
QuickSort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #28
.L235:
	str r0, [fp, #-28]
	str r1, [fp, #-24]
	str r2, [fp, #-20]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L243
	b .L248
.L243:
	ldr r5, [fp, #-24]
	str r5, [fp, #-16]
	ldr r4, [fp, #-20]
	str r4, [fp, #-12]
	ldr r5, [fp, #-24]
	ldr r4, [fp, #-28]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-8]
	b .L260
.L244:
	mov r0, #0
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L247:
.L248:
	b .L244
.L249:
.L260:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L261
	b .L266
.L261:
	b .L268
.L262:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-16]
	ldr r6, [fp, #-28]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	str r5, [r4]
	ldr r4, [fp, #-16]
	sub r5, r4, #1
	str r5, [fp, #-4]
	ldr r5, [fp, #-28]
	ldr r4, [fp, #-24]
	ldr r6, [fp, #-4]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl QuickSort
	mov r5, r0
	str r5, [fp, #-4]
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl QuickSort
	mov r4, r0
	str r4, [fp, #-4]
	b .L244
.L265:
.L266:
	b .L262
.L267:
.L268:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-12]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L271
	b .L275
.L269:
	ldr r4, [fp, #-12]
	sub r5, r4, #1
	str r5, [fp, #-12]
	b .L268
.L270:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L287
	b .L292
.L271:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-28]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-8]
	sub r5, r6, #1
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L269
	b .L284
.L274:
.L275:
	b .L270
.L276:
.L283:
.L284:
	b .L270
.L285:
.L287:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-28]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-16]
	ldr r5, [fp, #-28]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L288
.L288:
	b .L304
.L291:
.L292:
	b .L288
.L293:
.L304:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-12]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L307
	b .L311
.L305:
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L304
.L306:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L323
	b .L328
.L307:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-28]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-8]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L305
	b .L320
.L310:
.L311:
	b .L306
.L312:
.L319:
.L320:
	b .L306
.L321:
.L323:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-28]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-12]
	ldr r5, [fp, #-28]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-12]
	sub r5, r4, #1
	str r5, [fp, #-12]
	b .L324
	b .F0
.LTORG
addr_n_0:
	.word n
.F0:
.L324:
	b .L260
.L327:
.L328:
	b .L324
.L329:
	.global getMid
	.type getMid , %function
getMid:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L356:
	str r0, [fp, #-8]
	ldr r4, addr_n_1
	ldr r5, [r4]
	ldr r4, =2
	sdiv r6, r5, r4
	mov r4, r6, LSL#1
	sub r4, r5, r4
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	beq .L361
	b .L366
.L361:
	ldr r5, addr_n_1
	ldr r4, [r5]
	ldr r5, =2
	sdiv r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, [fp, #-4]
	sub r4, r6, #1
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	add r7, r5, r6
	ldr r4, =2
	sdiv r5, r7, r4
	mov r0, r5
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L362:
	ldr r4, addr_n_1
	ldr r5, [r4]
	ldr r4, =2
	sdiv r6, r5, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L363:
.L365:
.L366:
	b .L362
.L367:
	.global getMost
	.type getMost , %function
getMost:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	ldr r4, =4020
	sub sp, sp, r4
.L385:
	ldr r4, =-4020
	str r0, [fp, r4]
	ldr r4, =0
	str r4, [fp, #-16]
	b .L391
.L391:
	ldr r4, [fp, #-16]
	ldr r5, =1000
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L392
	b .L396
.L392:
	ldr r5, [fp, #-16]
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-4016
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =0
	str r6, [r4]
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L391
.L393:
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r5, =0
	str r5, [fp, #-12]
	b .L404
.L395:
.L396:
	b .L393
.L397:
.L404:
	ldr r4, [fp, #-16]
	ldr r5, addr_n_1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L405
	b .L410
.L405:
	ldr r5, [fp, #-16]
	ldr r6, =-4020
	ldr r4, [fp, r6]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r6, #4
	mul r5, r4, r6
	ldr r4, =-4016
	add r4, fp, r4
	add r6, r4, r5
	ldr r5, [r6]
	add r4, r5, #1
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r5, r6, r7
	ldr r6, =-4016
	add r6, fp, r6
	add r7, r6, r5
	str r4, [r7]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r4, r5, r6
	ldr r6, =-4016
	add r6, fp, r6
	add r5, r6, r4
	ldr r4, [r5]
	ldr r6, [fp, #-12]
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	bgt .L425
	b .L433
.L406:
	ldr r5, [fp, #-8]
	mov r0, r5
	ldr r2, =4020
	add sp, sp, r2
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L409:
.L410:
	b .L406
.L411:
.L425:
	ldr r4, [fp, #-4]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-4016
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	str r6, [fp, #-12]
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	b .L426
.L426:
	ldr r5, [fp, #-16]
	add r4, r5, #1
	str r4, [fp, #-16]
	b .L404
.L432:
.L433:
	b .L426
.L434:
	.global revert
	.type revert , %function
revert:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L442:
	str r0, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L449
.L449:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L450
	b .L455
.L450:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, [fp, #-8]
	ldr r4, [fp, #-16]
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-8]
	add r6, r4, #1
	str r6, [fp, #-8]
	ldr r5, [fp, #-4]
	sub r4, r5, #1
	str r4, [fp, #-4]
	b .L449
.L451:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L454:
.L455:
	b .L451
.L456:
	.global arrCopy
	.type arrCopy , %function
arrCopy:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L478:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L486
.L486:
	ldr r4, [fp, #-4]
	ldr r5, addr_n_1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L487
	b .L492
.L487:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-12]
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	ldr r5, [fp, #-8]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L486
.L488:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L491:
.L492:
	b .L488
.L493:
	.global calSum
	.type calSum , %function
calSum:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L504:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L512
.L512:
	ldr r4, [fp, #-4]
	ldr r5, addr_n_1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L513
	b .L518
.L513:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	add r7, r5, r6
	str r7, [fp, #-8]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-12]
	sdiv r6, r5, r4
	mul r6, r6, r4
	sub r4, r5, r6
	ldr r5, [fp, #-12]
	sub r6, r5, #1
	cmp r4, r6
	movne r4, #1
	moveq r4, #0
	bne .L526
	b .L533
.L514:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L517:
.L518:
	b .L514
.L519:
.L526:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-16]
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, =0
	str r4, [r5]
	b .L528
.L527:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	str r5, [r4]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L528
.L528:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L512
.L532:
.L533:
	b .L527
.L534:
	.global avgPooling
	.type avgPooling , %function
avgPooling:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L545:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-12]
	b .L554
.L554:
	ldr r4, [fp, #-8]
	ldr r5, addr_n_1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L555
	b .L560
.L555:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-16]
	sub r6, r4, #1
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L562
	b .L568
.L556:
	ldr r4, addr_n_1
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	sub r6, r5, r4
	add r5, r6, #1
	str r5, [fp, #-8]
	b .L616
.L559:
.L560:
	b .L556
.L561:
.L562:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-20]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	add r7, r4, r6
	str r7, [fp, #-12]
	b .L564
.L563:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	sub r6, r5, #1
	cmp r4, r6
	moveq r4, #1
	movne r4, #0
	beq .L576
	b .L582
.L564:
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L554
.L567:
.L568:
	b .L563
.L569:
.L576:
	ldr r5, [fp, #-20]
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	str r5, [fp, #-4]
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-16]
	sdiv r6, r5, r4
	ldr r5, [fp, #-20]
	mov r4, #0
	mov r8, #4
	mul r7, r4, r8
	add r4, r5, r7
	str r6, [r4]
	b .L578
.L577:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-20]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	add r7, r4, r6
	ldr r4, [fp, #-4]
	sub r5, r7, r4
	str r5, [fp, #-12]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	sub r6, r4, r5
	add r4, r6, #1
	ldr r5, [fp, #-20]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	str r5, [fp, #-4]
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-16]
	sdiv r6, r5, r4
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-16]
	sub r7, r5, r4
	add r5, r7, #1
	ldr r4, [fp, #-20]
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	str r6, [r5]
	b .L578
.L578:
	b .L564
.L581:
.L582:
	b .L577
.L583:
.L616:
	ldr r4, [fp, #-8]
	ldr r6, addr_n_1
	ldr r5, [r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L617
	b .L622
.L617:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-20]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, =0
	str r4, [r5]
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L616
.L618:
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L621:
.L622:
	b .L618
.L623:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #264
.L629:
	ldr r4, =32
	ldr r5, addr_n_1
	str r4, [r5]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =7
	str r6, [r5]
	mov r4, #1
	mov r5, #4
	mov r4, r5, LSL#0
	ldr r5, =-264
	add r5, fp, r5
	add r6, r5, r4
	ldr r4, =23
	str r4, [r6]
	mov r5, #2
	mov r4, #4
	mov r5, r4, LSL#1
	ldr r4, =-264
	add r6, fp, r4
	add r4, r6, r5
	ldr r5, =89
	str r5, [r4]
	mov r4, #3
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =26
	str r5, [r4]
	mov r4, #4
	mov r5, #4
	mov r4, r5, LSL#2
	ldr r5, =-264
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =282
	str r4, [r5]
	mov r5, #5
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-264
	add r4, fp, r5
	add r5, r4, r6
	ldr r4, =254
	str r4, [r5]
	mov r5, #6
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-264
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =27
	str r6, [r4]
	mov r4, #7
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =5
	str r5, [r4]
	mov r4, #8
	mov r5, #4
	mov r4, r5, LSL#3
	ldr r5, =-264
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =83
	str r4, [r5]
	mov r5, #9
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-264
	add r4, fp, r5
	add r5, r4, r6
	ldr r4, =273
	str r4, [r5]
	mov r5, #10
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-264
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =574
	str r6, [r4]
	mov r4, #11
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =905
	str r5, [r4]
	mov r4, #12
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =354
	str r6, [r5]
	mov r4, #13
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =657
	str r5, [r4]
	mov r4, #14
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =935
	str r6, [r5]
	mov r4, #15
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =264
	str r5, [r4]
	mov r4, #16
	mov r4, #4
	mov r5, r4, LSL#4
	ldr r4, =-264
	add r4, fp, r4
	add r6, r4, r5
	ldr r5, =639
	str r5, [r6]
	mov r4, #17
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =459
	str r6, [r5]
	mov r4, #18
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =29
	str r6, [r5]
	mov r4, #19
	mov r6, #4
	mul r5, r4, r6
	ldr r4, =-264
	add r6, fp, r4
	add r4, r6, r5
	ldr r6, =68
	str r6, [r4]
	mov r4, #20
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =929
	str r6, [r5]
	mov r4, #21
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =756
	str r6, [r5]
	mov r4, #22
	mov r6, #4
	mul r5, r4, r6
	ldr r4, =-264
	add r6, fp, r4
	add r4, r6, r5
	ldr r6, =452
	str r6, [r4]
	mov r4, #23
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =279
	str r6, [r5]
	mov r4, #24
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =58
	str r6, [r5]
	mov r4, #25
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =87
	str r6, [r5]
	mov r4, #26
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =96
	str r6, [r5]
	mov r4, #27
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =36
	str r6, [r5]
	mov r4, #28
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =39
	str r6, [r5]
	mov r4, #29
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =28
	str r6, [r5]
	mov r4, #30
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =1
	str r6, [r5]
	mov r4, #31
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =290
	str r6, [r5]
	mov r4, #0
	mov r6, #4
	mul r5, r4, r6
	ldr r4, =-264
	add r6, fp, r4
	add r4, r6, r5
	mov r6, #0
	mov r5, #4
	mul r7, r6, r5
	mov r6, #-136
	add r6, fp, r6
	add r5, r6, r7
	mov r0, r4
	mov r1, r5
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-136
	add r4, fp, r4
	add r5, r4, r6
	mov r0, r5
	bl revert
	mov r5, r0
	str r5, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L704
	b .F1
.LTORG
addr_n_1:
	.word n
.F1:
.L704:
	ldr r5, [fp, #-4]
	cmp r5, #32
	movlt r4, #1
	movge r4, #0
	blt .L705
	b .L709
.L705:
	ldr r5, [fp, #-4]
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-136
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	str r6, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r0, r5
	bl putint
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L704
.L706:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-136
	add r5, fp, r4
	add r4, r5, r6
	mov r0, r4
	bl bubblesort
	mov r4, r0
	str r4, [fp, #-8]
	ldr r5, =0
	str r5, [fp, #-4]
	b .L719
.L708:
.L709:
	b .L706
.L710:
.L719:
	ldr r4, [fp, #-4]
	cmp r4, #32
	movlt r5, #1
	movge r5, #0
	blt .L720
	b .L724
.L720:
	ldr r4, [fp, #-4]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-136
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	str r6, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L719
.L721:
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-136
	add r4, fp, r5
	add r5, r4, r6
	mov r0, r5
	bl getMid
	mov r4, r0
	str r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r0, r5
	bl putint
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-136
	add r5, fp, r4
	add r4, r5, r6
	mov r0, r4
	bl getMost
	mov r4, r0
	str r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r0, r5
	bl putint
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r4, fp, r4
	add r5, r4, r6
	mov r6, #0
	mov r4, #4
	mul r7, r6, r4
	mov r6, #-136
	add r6, fp, r6
	add r4, r6, r7
	mov r0, r5
	mov r1, r4
	bl arrCopy
	mov r5, r0
	str r5, [fp, #-8]
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-136
	add r5, fp, r5
	add r4, r5, r6
	mov r0, r4
	bl bubblesort
	mov r4, r0
	str r4, [fp, #-8]
	ldr r5, =0
	str r5, [fp, #-4]
	b .L744
.L723:
.L724:
	b .L721
.L725:
.L744:
	ldr r4, [fp, #-4]
	cmp r4, #32
	movlt r5, #1
	movge r5, #0
	blt .L745
	b .L749
.L745:
	ldr r4, [fp, #-4]
	mov r6, #4
	mul r5, r4, r6
	mov r4, #-136
	add r6, fp, r4
	add r4, r6, r5
	ldr r6, [r4]
	str r6, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r0, r5
	bl putint
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L744
.L746:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-264
	add r5, fp, r4
	add r4, r5, r6
	mov r5, #0
	mov r7, #4
	mul r6, r5, r7
	mov r5, #-136
	add r5, fp, r5
	add r7, r5, r6
	mov r0, r4
	mov r1, r7
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-136
	add r4, fp, r4
	add r5, r4, r6
	mov r0, r5
	bl insertsort
	mov r5, r0
	str r5, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L763
	b .F2
.LTORG
addr_n_2:
	.word n
.F2:
.L748:
.L749:
	b .L746
.L750:
.L763:
	ldr r5, [fp, #-4]
	cmp r5, #32
	movlt r4, #1
	movge r4, #0
	blt .L764
	b .L768
.L764:
	ldr r5, [fp, #-4]
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-136
	add r4, fp, r5
	add r5, r4, r6
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L763
.L765:
	mov r5, #0
	mov r6, #4
	mul r4, r5, r6
	ldr r5, =-264
	add r5, fp, r5
	add r6, r5, r4
	mov r4, #0
	mov r5, #4
	mul r7, r4, r5
	mov r4, #-136
	add r4, fp, r4
	add r5, r4, r7
	mov r0, r6
	mov r1, r5
	bl arrCopy
	mov r6, r0
	str r6, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r5, =31
	str r5, [fp, #-8]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-136
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl QuickSort
	mov r4, r0
	str r4, [fp, #-8]
	b .L784
.L767:
.L768:
	b .L765
.L769:
.L784:
	ldr r5, [fp, #-4]
	cmp r5, #32
	movlt r4, #1
	movge r4, #0
	blt .L785
	b .L789
.L785:
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r4, r5, r6
	mov r5, #-136
	add r5, fp, r5
	add r6, r5, r4
	ldr r4, [r6]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L784
.L786:
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-264
	add r5, fp, r5
	add r4, r5, r6
	mov r6, #0
	mov r5, #4
	mul r7, r6, r5
	mov r6, #-136
	add r5, fp, r6
	add r6, r5, r7
	mov r0, r4
	mov r1, r6
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-136
	add r4, fp, r4
	add r5, r4, r6
	mov r0, r5
	mov r1, #4
	bl calSum
	mov r5, r0
	str r5, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L803
.L788:
.L789:
	b .L786
.L790:
.L803:
	ldr r5, [fp, #-4]
	cmp r5, #32
	movlt r4, #1
	movge r4, #0
	blt .L804
	b .L808
.L804:
	ldr r5, [fp, #-4]
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-136
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	str r6, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r0, r5
	bl putint
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L803
.L805:
	mov r4, #0
	mov r6, #4
	mul r5, r4, r6
	ldr r4, =-264
	add r4, fp, r4
	add r6, r4, r5
	mov r5, #0
	mov r4, #4
	mul r7, r5, r4
	mov r5, #-136
	add r5, fp, r5
	add r4, r5, r7
	mov r0, r6
	mov r1, r4
	bl arrCopy
	mov r6, r0
	str r6, [fp, #-8]
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-136
	add r5, fp, r5
	add r4, r5, r6
	mov r0, r4
	mov r1, #3
	bl avgPooling
	mov r4, r0
	str r4, [fp, #-8]
	ldr r5, =0
	str r5, [fp, #-4]
	b .L822
	b .F3
.LTORG
addr_n_3:
	.word n
.F3:
.L807:
.L808:
	b .L805
.L809:
.L822:
	ldr r4, [fp, #-4]
	cmp r4, #32
	movlt r5, #1
	movge r5, #0
	blt .L823
	b .L827
.L823:
	ldr r4, [fp, #-4]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-136
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	str r6, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L822
.L824:
	mov r0, #0
	add sp, sp, #264
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L826:
.L827:
	b .L824
.L828:
addr_n_4:
	.word n

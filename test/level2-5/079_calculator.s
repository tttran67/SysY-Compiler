	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global c
	.align 4
	.size c, 4
c:
	.word 0
	.comm chas, 40000, 4
	.global chat
	.align 4
	.size chat, 4
chat:
	.word 0
	.comm get, 40000, 4
	.comm get2, 40000, 4
	.global i
	.align 4
	.size i, 4
i:
	.word 0
	.global ii
	.align 4
	.size ii, 4
ii:
	.word 1
	.comm ints, 40000, 4
	.global intt
	.align 4
	.size intt, 4
intt:
	.word 0
	.text
	.global isdigit
	.type isdigit , %function
isdigit:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L148:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #48
	movge r4, #1
	movlt r4, #0
	bge .L153
	b .L156
.L151:
	mov r0, #1
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L152:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L153:
	ldr r4, [fp, #-4]
	cmp r4, #57
	movle r4, #1
	movgt r4, #0
	ble .L151
	b .L160
.L155:
.L156:
	b .L152
.L157:
.L159:
.L160:
	b .L152
.L161:
	.global power
	.type power , %function
power:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L162:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L168
.L168:
	ldr r4, [fp, #-8]
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L169
	b .L173
.L169:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	mul r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L168
.L170:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr

.L172:
.L173:
	b .L170
.L174:
	.global getstr
	.type getstr , %function
getstr:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L179:
	str r0, [fp, #-12]
	bl getch
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L185
.L185:
	ldr r4, [fp, #-8]
	cmp r4, #13
	movne r4, #1
	moveq r4, #0
	bne .L188
	b .L191
.L186:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-12]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	bl getch
	mov r5, r0
	str r5, [fp, #-8]
	b .L185
.L187:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L188:
	ldr r5, [fp, #-8]
	cmp r5, #10
	movne r4, #1
	moveq r4, #0
	bne .L186
	b .L195
.L190:
.L191:
	b .L187
.L192:
.L194:
.L195:
	b .L187
.L196:
	.global intpush
	.type intpush , %function
intpush:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L204:
	str r0, [fp, #-4]
	ldr r4, addr_intt_0
	ldr r5, [r4]
	add r4, r5, #1
	ldr r5, addr_intt_0
	str r4, [r5]
	ldr r4, [fp, #-4]
	ldr r5, addr_intt_0
	ldr r6, [r5]
	mov r5, #4
	mul r7, r6, r5
	ldr r5, addr_ints_0
	add r6, r5, r7
	str r4, [r6]
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global chapush
	.type chapush , %function
chapush:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L212:
	str r0, [fp, #-4]
	ldr r4, addr_chat_0
	ldr r5, [r4]
	add r4, r5, #1
	ldr r5, addr_chat_0
	str r4, [r5]
	ldr r4, [fp, #-4]
	ldr r5, addr_chat_0
	ldr r6, [r5]
	mov r5, #4
	mul r7, r6, r5
	ldr r5, addr_chas_0
	add r6, r5, r7
	str r4, [r6]
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global intpop
	.type intpop , %function
intpop:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L220:
	ldr r4, addr_intt_0
	ldr r5, [r4]
	sub r4, r5, #1
	ldr r5, addr_intt_0
	str r4, [r5]
	ldr r4, addr_intt_0
	ldr r5, [r4]
	add r4, r5, #1
	mov r6, #4
	mul r5, r4, r6
	ldr r6, addr_ints_0
	add r4, r6, r5
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global chapop
	.type chapop , %function
chapop:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L226:
	ldr r4, addr_chat_0
	ldr r5, [r4]
	sub r4, r5, #1
	ldr r5, addr_chat_0
	str r4, [r5]
	ldr r4, addr_chat_0
	ldr r5, [r4]
	add r4, r5, #1
	mov r6, #4
	mul r5, r4, r6
	ldr r6, addr_chas_0
	add r4, r6, r5
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global intadd
	.type intadd , %function
intadd:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L232:
	str r0, [fp, #-4]
	ldr r4, addr_intt_0
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_ints_0
	add r5, r4, r6
	ldr r6, [r5]
	ldr r4, =10
	mul r5, r6, r4
	ldr r4, addr_intt_0
	ldr r6, [r4]
	mov r4, #4
	mul r7, r6, r4
	ldr r4, addr_ints_0
	add r6, r4, r7
	str r5, [r6]
	ldr r6, addr_intt_0
	ldr r4, [r6]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_ints_0
	add r5, r4, r6
	ldr r6, [r5]
	ldr r4, [fp, #-4]
	add r5, r6, r4
	ldr r4, addr_intt_0
	ldr r6, [r4]
	mov r4, #4
	mul r7, r6, r4
	ldr r4, addr_ints_0
	add r6, r4, r7
	str r5, [r6]
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global find
	.type find , %function
find:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L250:
	bl chapop
	mov r4, r0
	ldr r5, addr_c_0
	str r4, [r5]
	ldr r4, addr_ii_0
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_get2_0
	add r5, r4, r6
	ldr r6, =32
	str r6, [r5]
	ldr r4, addr_c_0
	ldr r5, [r4]
	ldr r4, addr_ii_0
	ldr r6, [r4]
	add r4, r6, #1
	mov r6, #4
	mul r7, r4, r6
	ldr r6, addr_get2_0
	add r4, r6, r7
	str r5, [r4]
	ldr r5, addr_ii_0
	ldr r6, [r5]
	add r4, r6, #2
	ldr r5, addr_ii_0
	str r4, [r5]
	ldr r4, addr_chat_0
	ldr r5, [r4]
	cmp r5, #0
	moveq r4, #1
	movne r4, #0
	beq .L259
	b .L263
.L259:
	mov r0, #0
	add sp, sp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L260:
	mov r0, #1
	add sp, sp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L262:
.L263:
	b .L260
.L264:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L265:
	ldr r4, =0
	ldr r5, addr_intt_0
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_chat_0
	str r4, [r5]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_get_0
	add r5, r4, r6
	mov r0, r5
	bl getstr
	mov r4, r0
	str r4, [fp, #-20]
	b .L269
.L269:
	ldr r5, addr_i_0
	ldr r4, [r5]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L270
	b .L275
.L270:
	ldr r5, addr_i_0
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_get_0
	add r5, r4, r6
	ldr r4, [r5]
	mov r0, r4
	bl isdigit
	mov r4, r0
	cmp r4, #1
	moveq r5, #1
	movne r5, #0
	beq .L277
	b .L285
.L271:
	b .L614
.L274:
.L275:
	b .L271
.L276:
.L277:
	ldr r4, addr_i_0
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_get_0
	add r5, r4, r6
	ldr r6, [r5]
	ldr r4, addr_ii_0
	ldr r5, [r4]
	mov r7, #4
	mul r4, r5, r7
	ldr r5, addr_get2_0
	add r7, r5, r4
	str r6, [r7]
	ldr r5, addr_ii_0
	ldr r4, [r5]
	add r6, r4, #1
	ldr r5, addr_ii_0
	str r6, [r5]
	b .L279
.L278:
	ldr r4, addr_i_0
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_get_0
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #40
	moveq r4, #1
	movne r4, #0
	beq .L295
	b .L302
.L279:
	ldr r5, addr_i_0
	ldr r4, [r5]
	add r5, r4, #1
	ldr r4, addr_i_0
	str r5, [r4]
	b .L269
.L284:
.L285:
	b .L278
.L286:
.L295:
	mov r0, #40
	bl chapush
	b .L296
.L296:
	ldr r5, addr_i_0
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_get_0
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #94
	moveq r5, #1
	movne r5, #0
	beq .L304
	b .L311
.L301:
.L302:
	b .L296
.L303:
.L304:
	mov r0, #94
	bl chapush
	b .L305
.L305:
	ldr r4, addr_i_0
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_get_0
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #41
	moveq r4, #1
	movne r4, #0
	beq .L313
	b .L320
.L310:
.L311:
	b .L305
.L312:
.L313:
	bl chapop
	mov r5, r0
	ldr r4, addr_c_0
	str r5, [r4]
	b .L322
.L314:
	ldr r5, addr_i_0
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_get_0
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #43
	moveq r5, #1
	movne r5, #0
	beq .L337
	b .L344
.L319:
.L320:
	b .L314
.L321:
.L322:
	ldr r4, addr_c_0
	ldr r5, [r4]
	cmp r5, #40
	movne r4, #1
	moveq r4, #0
	bne .L323
	b .L327
.L323:
	ldr r5, addr_ii_0
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_get2_0
	add r4, r5, r6
	ldr r6, =32
	str r6, [r4]
	ldr r4, addr_c_0
	ldr r5, [r4]
	ldr r4, addr_ii_0
	ldr r6, [r4]
	add r4, r6, #1
	mov r6, #4
	mul r7, r4, r6
	ldr r6, addr_get2_0
	add r4, r6, r7
	str r5, [r4]
	ldr r5, addr_ii_0
	ldr r6, [r5]
	add r4, r6, #2
	ldr r5, addr_ii_0
	str r4, [r5]
	bl chapop
	mov r4, r0
	ldr r5, addr_c_0
	str r4, [r5]
	b .L322
	b .F0
.LTORG
addr_c_0:
	.word c
addr_chas_0:
	.word chas
addr_chat_0:
	.word chat
addr_get_0:
	.word get
addr_get2_0:
	.word get2
addr_i_0:
	.word i
addr_ii_0:
	.word ii
addr_ints_0:
	.word ints
addr_intt_0:
	.word intt
.F0:
.L324:
	b .L314
.L326:
.L327:
	b .L324
.L328:
.L337:
	b .L346
.L338:
	ldr r4, addr_i_1
	ldr r5, [r4]
	mov r6, #4
	mul r4, r5, r6
	ldr r5, addr_get_1
	add r6, r5, r4
	ldr r5, [r6]
	cmp r5, #45
	moveq r4, #1
	movne r4, #0
	beq .L401
	b .L408
.L343:
.L344:
	b .L338
.L345:
.L346:
	ldr r5, addr_chat_1
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_chas_1
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #43
	moveq r5, #1
	movne r5, #0
	beq .L347
	b .L359
.L347:
	bl find
	mov r4, r0
	cmp r4, #0
	moveq r5, #1
	movne r5, #0
	beq .L396
	b .L399
.L348:
	mov r0, #43
	bl chapush
	b .L338
.L349:
	ldr r4, addr_chat_1
	ldr r5, [r4]
	mov r6, #4
	mul r4, r5, r6
	ldr r6, addr_chas_1
	add r5, r6, r4
	ldr r4, [r5]
	cmp r4, #94
	moveq r4, #1
	movne r4, #0
	beq .L347
	b .L394
.L350:
	ldr r5, addr_chat_1
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_chas_1
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #37
	moveq r5, #1
	movne r5, #0
	beq .L347
	b .L387
.L351:
	ldr r4, addr_chat_1
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r5, addr_chas_1
	add r4, r5, r6
	ldr r5, [r4]
	cmp r5, #47
	moveq r5, #1
	movne r5, #0
	beq .L347
	b .L380
.L352:
	ldr r4, addr_chat_1
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_chas_1
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #42
	moveq r4, #1
	movne r4, #0
	beq .L347
	b .L373
.L353:
	ldr r5, addr_chat_1
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_chas_1
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #45
	moveq r5, #1
	movne r5, #0
	beq .L347
	b .L366
.L358:
.L359:
	b .L353
.L360:
.L365:
.L366:
	b .L352
.L367:
.L372:
.L373:
	b .L351
.L374:
.L379:
.L380:
	b .L350
.L381:
.L386:
.L387:
	b .L349
.L388:
.L393:
.L394:
	b .L348
.L395:
.L396:
	b .L348
.L397:
	b .L346
.L398:
.L399:
	b .L397
.L400:
.L401:
	b .L410
.L402:
	ldr r4, addr_i_1
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_get_1
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #42
	moveq r4, #1
	movne r4, #0
	beq .L465
	b .L472
.L407:
.L408:
	b .L402
.L409:
.L410:
	ldr r5, addr_chat_1
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_chas_1
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #43
	moveq r5, #1
	movne r5, #0
	beq .L411
	b .L423
.L411:
	bl find
	mov r4, r0
	cmp r4, #0
	moveq r5, #1
	movne r5, #0
	beq .L460
	b .L463
.L412:
	mov r0, #45
	bl chapush
	b .L402
.L413:
	ldr r4, addr_chat_1
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_chas_1
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #94
	moveq r4, #1
	movne r4, #0
	beq .L411
	b .L458
	b .F1
.LTORG
addr_c_1:
	.word c
addr_chas_1:
	.word chas
addr_chat_1:
	.word chat
addr_get_1:
	.word get
addr_get2_1:
	.word get2
addr_i_1:
	.word i
addr_ii_1:
	.word ii
addr_ints_1:
	.word ints
addr_intt_1:
	.word intt
.F1:
.L414:
	ldr r5, addr_chat_2
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_chas_2
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #37
	moveq r5, #1
	movne r5, #0
	beq .L411
	b .L451
.L415:
	ldr r4, addr_chat_2
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_chas_2
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #47
	moveq r4, #1
	movne r4, #0
	beq .L411
	b .L444
.L416:
	ldr r5, addr_chat_2
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_chas_2
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #42
	moveq r5, #1
	movne r5, #0
	beq .L411
	b .L437
.L417:
	ldr r4, addr_chat_2
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_chas_2
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #45
	moveq r4, #1
	movne r4, #0
	beq .L411
	b .L430
.L422:
.L423:
	b .L417
.L424:
.L429:
.L430:
	b .L416
.L431:
.L436:
.L437:
	b .L415
.L438:
.L443:
.L444:
	b .L414
.L445:
.L450:
.L451:
	b .L413
.L452:
.L457:
.L458:
	b .L412
.L459:
.L460:
	b .L412
.L461:
	b .L410
.L462:
.L463:
	b .L461
.L464:
.L465:
	b .L474
.L466:
	ldr r5, addr_i_2
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_get_2
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #47
	moveq r5, #1
	movne r5, #0
	beq .L513
	b .L520
.L471:
.L472:
	b .L466
.L473:
.L474:
	ldr r4, addr_chat_2
	ldr r5, [r4]
	mov r6, #4
	mul r4, r5, r6
	ldr r6, addr_chas_2
	add r5, r6, r4
	ldr r4, [r5]
	cmp r4, #42
	moveq r4, #1
	movne r4, #0
	beq .L475
	b .L485
.L475:
	bl find
	mov r5, r0
	cmp r5, #0
	moveq r4, #1
	movne r4, #0
	beq .L508
	b .L511
.L476:
	mov r0, #42
	bl chapush
	b .L466
.L477:
	ldr r5, addr_chat_2
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_chas_2
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #94
	moveq r5, #1
	movne r5, #0
	beq .L475
	b .L506
.L478:
	ldr r4, addr_chat_2
	ldr r5, [r4]
	mov r6, #4
	mul r4, r5, r6
	ldr r6, addr_chas_2
	add r5, r6, r4
	ldr r4, [r5]
	cmp r4, #37
	moveq r4, #1
	movne r4, #0
	beq .L475
	b .L499
.L479:
	ldr r5, addr_chat_2
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_chas_2
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #47
	moveq r5, #1
	movne r5, #0
	beq .L475
	b .L492
.L484:
.L485:
	b .L479
.L486:
.L491:
.L492:
	b .L478
.L493:
.L498:
.L499:
	b .L477
.L500:
.L505:
.L506:
	b .L476
.L507:
.L508:
	b .L476
.L509:
	b .L474
.L510:
.L511:
	b .L509
.L512:
.L513:
	b .L522
.L514:
	ldr r4, addr_i_2
	ldr r5, [r4]
	mov r6, #4
	mul r4, r5, r6
	ldr r5, addr_get_2
	add r6, r5, r4
	ldr r5, [r6]
	cmp r5, #37
	moveq r4, #1
	movne r4, #0
	beq .L561
	b .L568
.L519:
.L520:
	b .L514
.L521:
.L522:
	ldr r5, addr_chat_2
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_chas_2
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #42
	moveq r5, #1
	movne r5, #0
	beq .L523
	b .L533
	b .F2
.LTORG
addr_c_2:
	.word c
addr_chas_2:
	.word chas
addr_chat_2:
	.word chat
addr_get_2:
	.word get
addr_get2_2:
	.word get2
addr_i_2:
	.word i
addr_ii_2:
	.word ii
addr_ints_2:
	.word ints
addr_intt_2:
	.word intt
.F2:
.L523:
	bl find
	mov r4, r0
	cmp r4, #0
	moveq r5, #1
	movne r5, #0
	beq .L556
	b .L559
.L524:
	mov r0, #47
	bl chapush
	b .L514
.L525:
	ldr r4, addr_chat_3
	ldr r5, [r4]
	mov r6, #4
	mul r4, r5, r6
	ldr r5, addr_chas_3
	add r6, r5, r4
	ldr r5, [r6]
	cmp r5, #94
	moveq r4, #1
	movne r4, #0
	beq .L523
	b .L554
.L526:
	ldr r5, addr_chat_3
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_chas_3
	add r5, r4, r6
	ldr r4, [r5]
	cmp r4, #37
	moveq r4, #1
	movne r4, #0
	beq .L523
	b .L547
.L527:
	ldr r5, addr_chat_3
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_chas_3
	add r5, r4, r6
	ldr r4, [r5]
	cmp r4, #47
	moveq r4, #1
	movne r4, #0
	beq .L523
	b .L540
.L532:
.L533:
	b .L527
.L534:
.L539:
.L540:
	b .L526
.L541:
.L546:
.L547:
	b .L525
.L548:
.L553:
.L554:
	b .L524
.L555:
.L556:
	b .L524
.L557:
	b .L522
.L558:
.L559:
	b .L557
.L560:
.L561:
	b .L570
.L562:
	ldr r5, addr_ii_3
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_get2_3
	add r5, r4, r6
	ldr r4, =32
	str r4, [r5]
	ldr r5, addr_ii_3
	ldr r4, [r5]
	add r5, r4, #1
	ldr r4, addr_ii_3
	str r5, [r4]
	b .L279
.L567:
.L568:
	b .L562
.L569:
.L570:
	ldr r5, addr_chat_3
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_chas_3
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #42
	moveq r5, #1
	movne r5, #0
	beq .L571
	b .L581
.L571:
	bl find
	mov r4, r0
	cmp r4, #0
	moveq r5, #1
	movne r5, #0
	beq .L604
	b .L607
.L572:
	mov r0, #37
	bl chapush
	b .L562
.L573:
	ldr r4, addr_chat_3
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_chas_3
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #94
	moveq r4, #1
	movne r4, #0
	beq .L571
	b .L602
.L574:
	ldr r5, addr_chat_3
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_chas_3
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #37
	moveq r5, #1
	movne r5, #0
	beq .L571
	b .L595
.L575:
	ldr r4, addr_chat_3
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_chas_3
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #47
	moveq r4, #1
	movne r4, #0
	beq .L571
	b .L588
.L580:
.L581:
	b .L575
.L582:
.L587:
.L588:
	b .L574
.L589:
.L594:
.L595:
	b .L573
.L596:
.L601:
.L602:
	b .L572
.L603:
.L604:
	b .L572
.L605:
	b .L570
.L606:
.L607:
	b .L605
.L608:
.L614:
	ldr r5, addr_chat_3
	ldr r4, [r5]
	cmp r4, #0
	movgt r5, #1
	movle r5, #0
	bgt .L615
	b .L619
.L615:
	bl chapop
	mov r4, r0
	str r4, [fp, #-16]
	ldr r5, addr_ii_3
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_get2_3
	add r4, r5, r6
	ldr r6, =32
	str r6, [r4]
	ldr r4, [fp, #-16]
	ldr r5, addr_ii_3
	ldr r6, [r5]
	add r5, r6, #1
	mov r6, #4
	mul r7, r5, r6
	ldr r6, addr_get2_3
	add r5, r6, r7
	str r4, [r5]
	ldr r4, addr_ii_3
	ldr r6, [r4]
	add r5, r6, #2
	ldr r4, addr_ii_3
	str r5, [r4]
	b .L614
	b .F3
.LTORG
addr_c_3:
	.word c
addr_chas_3:
	.word chas
addr_chat_3:
	.word chat
addr_get_3:
	.word get
addr_get2_3:
	.word get2
addr_i_3:
	.word i
addr_ii_3:
	.word ii
addr_ints_3:
	.word ints
addr_intt_3:
	.word intt
.F3:
.L616:
	ldr r5, addr_ii_4
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_get2_4
	add r4, r5, r6
	ldr r6, =64
	str r6, [r4]
	ldr r4, =1
	ldr r5, addr_i_4
	str r4, [r5]
	b .L633
.L618:
.L619:
	b .L616
.L620:
.L633:
	ldr r4, addr_i_4
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_get2_4
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #64
	movne r4, #1
	moveq r4, #0
	bne .L634
	b .L641
.L634:
	ldr r5, addr_i_4
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_get2_4
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #43
	moveq r5, #1
	movne r5, #0
	beq .L643
	b .L656
.L635:
	mov r4, #1
	mov r5, #4
	mov r4, r5, LSL#0
	ldr r6, addr_ints_4
	add r5, r6, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L640:
.L641:
	b .L635
.L642:
.L643:
	bl intpop
	mov r4, r0
	str r4, [fp, #-12]
	bl intpop
	mov r5, r0
	str r5, [fp, #-8]
	ldr r4, addr_i_4
	ldr r5, [r4]
	mov r6, #4
	mul r4, r5, r6
	ldr r6, addr_get2_4
	add r5, r6, r4
	ldr r4, [r5]
	cmp r4, #43
	moveq r4, #1
	movne r4, #0
	beq .L696
	b .L703
.L644:
	ldr r5, addr_i_4
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_get2_4
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #32
	movne r5, #1
	moveq r5, #0
	bne .L763
	b .L770
.L645:
	ldr r4, addr_i_4
	ldr r5, [r4]
	add r4, r5, #1
	ldr r5, addr_i_4
	str r4, [r5]
	b .L633
.L646:
	ldr r4, addr_i_4
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_get2_4
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #94
	moveq r4, #1
	movne r4, #0
	beq .L643
	b .L691
.L647:
	ldr r5, addr_i_4
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_get2_4
	add r5, r4, r6
	ldr r4, [r5]
	cmp r4, #37
	moveq r4, #1
	movne r4, #0
	beq .L643
	b .L684
.L648:
	ldr r5, addr_i_4
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_get2_4
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #47
	moveq r5, #1
	movne r5, #0
	beq .L643
	b .L677
.L649:
	ldr r4, addr_i_4
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r5, addr_get2_4
	add r4, r5, r6
	ldr r5, [r4]
	cmp r5, #42
	moveq r5, #1
	movne r5, #0
	beq .L643
	b .L670
.L650:
	ldr r4, addr_i_4
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_get2_4
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #45
	moveq r4, #1
	movne r4, #0
	beq .L643
	b .L663
.L655:
.L656:
	b .L650
.L657:
.L662:
.L663:
	b .L649
.L664:
.L669:
.L670:
	b .L648
.L671:
.L676:
.L677:
	b .L647
.L678:
.L683:
.L684:
	b .L646
.L685:
.L690:
.L691:
	b .L644
	b .F4
.LTORG
addr_c_4:
	.word c
addr_chas_4:
	.word chas
addr_chat_4:
	.word chat
addr_get_4:
	.word get
addr_get2_4:
	.word get2
addr_i_4:
	.word i
addr_ii_4:
	.word ii
addr_ints_4:
	.word ints
addr_intt_4:
	.word intt
.F4:
.L692:
.L696:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-8]
	add r6, r5, r4
	str r6, [fp, #-4]
	b .L697
.L697:
	ldr r5, addr_i_5
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_get2_5
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #45
	moveq r5, #1
	movne r5, #0
	beq .L707
	b .L714
.L702:
.L703:
	b .L697
.L704:
.L707:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L708
.L708:
	ldr r4, addr_i_5
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_get2_5
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #42
	moveq r4, #1
	movne r4, #0
	beq .L718
	b .L725
.L713:
.L714:
	b .L708
.L715:
.L718:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-8]
	mul r6, r5, r4
	str r6, [fp, #-4]
	b .L719
.L719:
	ldr r5, addr_i_5
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_get2_5
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #47
	moveq r5, #1
	movne r5, #0
	beq .L729
	b .L736
.L724:
.L725:
	b .L719
.L726:
.L729:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sdiv r6, r4, r5
	str r6, [fp, #-4]
	b .L730
.L730:
	ldr r4, addr_i_5
	ldr r5, [r4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_get2_5
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #37
	moveq r4, #1
	movne r4, #0
	beq .L740
	b .L747
.L735:
.L736:
	b .L730
.L737:
.L740:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-12]
	sdiv r6, r5, r4
	mul r4, r6, r4
	sub r6, r5, r4
	str r6, [fp, #-4]
	b .L741
.L741:
	ldr r5, addr_i_5
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_get2_5
	add r5, r4, r6
	ldr r4, [r5]
	cmp r4, #94
	moveq r4, #1
	movne r4, #0
	beq .L751
	b .L758
.L746:
.L747:
	b .L741
.L748:
.L751:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-12]
	mov r0, r5
	mov r1, r4
	bl power
	mov r5, r0
	str r5, [fp, #-4]
	b .L752
.L752:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl intpush
	b .L645
.L757:
.L758:
	b .L752
.L759:
.L763:
	ldr r5, addr_i_5
	ldr r4, [r5]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_get2_5
	add r5, r4, r6
	ldr r4, [r5]
	sub r6, r4, #48
	mov r0, r6
	bl intpush
	ldr r5, =1
	ldr r4, addr_ii_5
	str r5, [r4]
	b .L776
.L764:
	b .L645
.L769:
.L770:
	b .L764
.L771:
.L776:
	ldr r5, addr_i_5
	ldr r4, [r5]
	ldr r5, addr_ii_5
	ldr r6, [r5]
	add r5, r4, r6
	mov r4, #4
	mul r6, r5, r4
	ldr r5, addr_get2_5
	add r4, r5, r6
	ldr r6, [r4]
	cmp r6, #32
	movne r5, #1
	moveq r5, #0
	bne .L777
	b .L785
.L777:
	ldr r4, addr_i_5
	ldr r5, [r4]
	ldr r4, addr_ii_5
	ldr r6, [r4]
	add r4, r5, r6
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_get2_5
	add r5, r4, r6
	ldr r6, [r5]
	sub r4, r6, #48
	mov r0, r4
	bl intadd
	ldr r4, addr_ii_5
	ldr r5, [r4]
	add r4, r5, #1
	ldr r5, addr_ii_5
	str r4, [r5]
	b .L776
	b .F5
.LTORG
addr_c_5:
	.word c
addr_chas_5:
	.word chas
addr_chat_5:
	.word chat
addr_get_5:
	.word get
addr_get2_5:
	.word get2
addr_i_5:
	.word i
addr_ii_5:
	.word ii
addr_ints_5:
	.word ints
addr_intt_5:
	.word intt
.F5:
.L778:
	ldr r4, addr_i_6
	ldr r5, [r4]
	ldr r4, addr_ii_6
	ldr r6, [r4]
	add r4, r5, r6
	sub r5, r4, #1
	ldr r6, addr_i_6
	str r5, [r6]
	b .L764
.L784:
.L785:
	b .L778
.L786:
addr_c_6:
	.word c
addr_chas_6:
	.word chas
addr_chat_6:
	.word chat
addr_get_6:
	.word get
addr_get2_6:
	.word get2
addr_i_6:
	.word i
addr_ii_6:
	.word ii
addr_ints_6:
	.word ints
addr_intt_6:
	.word intt

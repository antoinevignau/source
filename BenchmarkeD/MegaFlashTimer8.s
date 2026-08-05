*
* MegaFlash Timer
* 8-bits code
*
* (c) 2026, Brutal Deluxe Software
*

	mx	%11

*----------------------------
* EXECUTE MEGAFLASH COMMAND
*----------------------------

mfExecute	sta	CMDREG
mfWait		bit	STATUSREG
		bmi	mfWait
		bvs	mfErr
		clc
		rts
mfErr		sec
		rts

*----------------------------
* DETECT MEGAFLASH
*----------------------------

detectMegaFlash	lda	#CMD_GETDEVINFO
		sta	CMDREG
		ldx	#100
mfDetWait	bit	STATUSREG
		bpl	mfDetReady
		dex
		bne	mfDetWait
		sec
		rts
mfDetReady	bvs	mfDetFail
		lda	PARAMREG
		cmp	#SIGNATURE1
		bne	mfDetFail
		lda	PARAMREG
		cmp	#SIGNATURE2
		bne	mfDetFail
		clc
		rts
mfDetFail	sec
		rts

*----------------------------
* UPDATE TIMER MODE
*----------------------------

updateTimerMode	lda	theSLOT
		bne	utmBrutal
		jsr	detectMegaFlash
		bcc	utmMega
		lda	#TIMER_NONE
		sta	theTIMERMODE
		rts
utmMega		lda	#TIMER_MEGAFLASH
		sta	theTIMERMODE
		rts
utmBrutal	lda	#TIMER_BRUTAL
		sta	theTIMERMODE
		rts

*----------------------------
* INIT AT COLD START
*----------------------------

initMegaFlash	jsr	updateTimerMode
		rts

*----------------------------
* RESET / READ MICROSECOND TIMER
*----------------------------

resetMFTimer	lda	#CMD_RESETTIMER_US
		jmp	mfExecute

readMFTimer	lda	#CMD_GETTIMER_US
		jsr	mfExecute
		bcs	rmExit
		lda	PARAMREG
		sta	valTIMER
		lda	PARAMREG
		sta	valTIMER+1
		lda	PARAMREG
		sta	valTIMER+2
		lda	PARAMREG
		sta	valTIMER+3
rmExit		rts

*----------------------------
* DATA
*----------------------------

theTIMERMODE	ds	2

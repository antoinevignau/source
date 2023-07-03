*
* NTP routines
*
* (c) 2020, Brutal Deluxe Software
* Antoine Vignau & Olivier Zardini
*

toolNTP	=	222

*--------------------------------------

	mx	%00
	
stopNTP
	lda	fgNTP
	bne	stopNTP99

	_NTPShutDown
	
	PushWord	#toolNTP	; unload NTPTool
	_UnloadOneTool

stopNTP99
	rts

*--------------------------------------

initNTP
	pha		; Check for AppleTalk
	_GetIRQEnable
	pla
	and	#$20
	beq	initNTP1

	inc	fgNTP
	rts

initNTP1
	PushWord	#toolNTP	; Load NTPTool
	PushWord	#0
	_LoadOneTool
	bcc	initNTP2
	
	inc	fgNTP
	rts
	
initNTP2
	PushWord	myID
	_NTPStartUp	; Start NTPSynth
	bcc	initNTP3

	inc	fgNTP

initNTP3
	rts

*--------------------------------------

doMUSIK
	lda	fgNTP		; can we play?
	bne	nozik99

	lda	fgNTPPLAY
	eor	#1
	sta	fgNTPPLAY
	beq	doSOUNDON
	bne	doSOUNDOFF

nozik99
	rts
	
*--------------------------------------

doSOUNDON
	lda	fgNTP		; can we play?
	bne	playMUSIC99

	PushWord	#1
	_NTPPlayMusic
	
playMUSIC99
	rts

*--------------------------------------

doSOUNDOFF
	lda	fgNTP
	bne	stopMUSIC99

	_NTPStopMusic

stopMUSIC99
	rts

*-------------------------------------- Suspend music

suspendMUSIC
	lda	fgNTP
	ora	fgNTPPLAY
	bne	suspendMUSIC9
	
	_NTPPauseMusic

suspendMUSIC9
	rts
	
*-------------------------------------- Resume music

resumeMUSIC
	lda	fgNTP
	ora	fgNTPPLAY
	bne	resumeMUSIC9
	
	_NTPContinueMusic

resumeMUSIC9
	rts
	
*-------------------------------------- Select random sequence

randomNTP
	jsr	Random	; get random 0-3
	and	#3
	bcc	randomNTP
	beq	randomNTP	; keep 1-3
	clc
	adc	#'0'
	sep	#$20
	sta	pSEQ+22
	rep	#$20
	
	PushLong	#pSEQ
	_NTPLoadOneMusic
	bcc	randomNTP9

	inc	fgNTPPLAY	; load error, do not play music

randomNTP9
	rts

*--- P16 String (+22 pour le random de la musique)

pSEQ	str	'1/data/musiques/zikmu1.ntp'

*--- Flags

fgNTP	ds	2	; tool error
fgNTPPLAY	ds	2	; music error


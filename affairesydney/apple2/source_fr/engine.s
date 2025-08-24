*
* L'affaire Sydney
*
* (c) 1986, Gilles Blancon
* (c) 1986, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* MACROS
*-------------------------------

@let	mac
	lda	#]1
	ldx	#]2
	jsr	LET
	<<<

@getln1	mac
	lda	#]1
	ldx	#]2
	jsr	GETLN1
	<<<

@instr	mac
	lda	#]1
	ldy	#]2
	jsr	INSTR
	<<<

@cls	mac
	lda	#]1
	jsr	CLS
	<<<

@locate	mac
	lda	#]1
	ldx	#]2
	ldy	#]3
	jsr	LOCATE
	<<<

@window	mac
	lda	#]1
	jsr	WINDOW
	<<<
	
@upper	mac
	lda	#]1
	jsr	translateSTRING
	<<<

*-------------------------------
* VARIABLES
*-------------------------------

MAX_WINDOW	=	8

*-------------------------------
* SET BORDER
*-------------------------------

setBORDER	sta	theBORDER

	sep	#$30
	ldal	CLOCKCTL
	and	#$F0
	ora	theBORDER
	stal	CLOCKCTL
	rep	#$30
	
	PushWord	theBORDER
	PushWord	#$1c
	_WriteBParam
	rts

theBORDER	ds	2

*-------------------------------
* INPUT/OUTPUT
*-------------------------------

GETLN1	sta	GETLN1_1+1
	sta	GETLN1_2+1
	stx	lenMAX

	ldx	#0
GETLN2	stx	lenSTRING
]lp	jsr	RDKEYCURSOR
	ldx	lenSTRING
	cmp	#chrRET
	beq	doEXIT
	cmp	#chrDEL
	beq	doBACK
	cmp	#chrLA
	beq	doBACK
	cmp	#chrSPC	; must not be another control character
	bcc	]lp
	beq	doSPC

doIT	sep	#$20
GETLN1_1	sta	$bdbd,x
	rep	#$20
	jsr	COUT
doNEXT	ldx	lenSTRING
	inx
	cpx	lenMAX
	bcc	GETLN2

doEXIT	sep	#$20
	lda	#0
GETLN1_2	sta	$bdbd,x
	rep	#$20
	stx	lenSTRING
	jsr	CURSORERASE
*	lda	#chrSPC
*	jsr	COUT
	ldx	lenSTRING
	rts

doSPC	jsr	WHITESPACE
	ldx	lenSTRING
	lda	#chrSPC
	bra	doIT

doBACK	cpx	#0
	beq	]lp
	jsr	CURSORERASE
	ldx	lenSTRING
	dex
	jmp	GETLN2

*-------------------------------

rewriteSTRING	sta	rewriteSTR1+1	; save pointer
	sta	rewriteSTR2+1
	
	sep	#$30	; from lower to upper
	ldx	#0
rewriteSTR1	ldy	$bdbd,x
	lda	tblKEY,y
rewriteSTR2	sta	$bdbd,x	; auto-mod code :-(
	inx
	cpx	lenSTRING
	bcc	rewriteSTR1
	rep	#$30
	rts

*-----------------------------------

translateKEY	jsr	RDKEYONLY
	pha
	jsr	COUT
	plx
	lda	tblKEY,x
	and	#$ff
	rts

*-------------------------------

translateKEYONLY
	jsr	RDKEYONLY
	tax
	lda	tblKEY,x
	and	#$ff
	rts

*-------------------------------

RDKEY	inc	vblCOUNTER
	jsr	checkREPLAY

	pha
	PushWord #%11111111_11111111
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	RDKEY

	lda	taskREC
	cmp	#mouseDownEvt
	beq	RDKEYOK
	cmp	#keyDownEvt
	bne	RDKEY

RDKEYOK	ldx	taskMESSAGE
	rts

*-------------------------------

RDKEYCURSOR	jsr	CURSOR

RDKEYONLY	inc	vblCOUNTER
	jsr	checkREPLAY

	pha
	PushWord #%11111111_11111111
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	RDKEYONLY

	lda	taskREC
	cmp	#keyDownEvt
	bne	RDKEYONLY

	lda	taskMESSAGE
	rts

*-------------------------------

RND	ldal	VERTCNT
	xba
	clc
	adc	vblCOUNTER
	sta	vblCOUNTER
	rts

vblCOUNTER	ds	2

*-------------------------------

switch320	lda	#mode320	; Switch to 320 mode
	ldy	#screen320
	bra	switchres

switch640	lda	#mode640	; Switch to 640 mode
	ldy	#screen640
	
*-----------

switchres	sty	mainWIDTH
	sta	mainSCB

	lda	mainSCB
	pha
	pha
	_SetMasterSCB
	_SetAllSCBs
	PushLong mainPORT
	_InitPort

	PushWord	#0
	PushWord	mainWIDTH
	PushWord	#0
	PushWord	#200
	_ClampMouse
	_HomeMouse
	_WindNewRes
	_MenuNewRes
	_CtlNewRes
	rts

*-----------

mainSCB	ds	2
mainWIDTH	dw	screen320
mainHEIGHT	dw	screenheight

*-------------------------------
* TEXT
*-------------------------------

eraseLINES	sta	pointerRECT
	
	PushLong	#curPATTERN
	_GetPenPat

	PushLong	#blackPATTERN
	_SetPenPat
	
	PushLong	pointerRECT
	_PaintRect

	PushLong	#curPATTERN
	_SetPenPat
	rts

*-----------

pointerRECT	adrl	bottomRECT
screenRECT	dw	0,0,200,320
drawRECT	dw	0,0,159,239	; 319
bottomRECT	dw	160,0,199,319
lastlineRECT	dw	190,0,199,319
cursorRECT	dw	0,0,0,0	; y2 and x2 are y1+charWIDTH and x1+charWIDTH

*-----------------------------------

CURSORERASE	lda	textY
	sta	cursorRECT+4
	sec
	sbc	charWIDTH
	sta	cursorRECT
	
	lda	textX
	sta	cursorRECT+2
	clc
	adc	charWIDTH
	sta	cursorRECT+6
	
	lda	#cursorRECT
	jsr	eraseLINES

	lda	textX
	sec
	sbc	charWIDTH
	sta	textX
	rts

*-----------------------------------

WHITESPACE	lda	textY
	sta	cursorRECT+4
	sec
	sbc	charWIDTH
	sta	cursorRECT
	
	lda	textX
	sta	cursorRECT+2
	clc
	adc	charWIDTH
	sta	cursorRECT+6
	
	lda	#cursorRECT
	jmp	eraseLINES

*-----------------------------------

CURSOR	pei	textX
	pei	textY
	
	lda	#$a5	; black bullet
	jsr	COUT
	pla
	sta	textY
	pla
	sta	textX
	rts

*-----------------------------------

LOCATE	txa
	dec
	asl
	asl
	asl
	tax
	
	tya
	asl
	asl
	asl
	tay
	
*-----------------------------------

GOTOXY	stx	textX
	stx	marginX
	sty	textY
	sty	marginY

	PushWord	textX
	PushWord	textY
	_MoveTo
	rts

*-----------------------------------
* WINDOW
* A: pointer to window definition
*   +0: window index
*   +2: left, right, top, bottom
*  +10: cursor x&y positions
*  +14: paper, pen

WINDOW	tax
	lda	|$0000,x
	cmp	#MAX_WINDOW
	bcc	WINDOW1
	beq	WINDOW1
	rts

WINDOW1	asl		; *8
	asl
	asl
	tay
	
	lda	|$0002,x	; left
	sta	tblWINDOW,y
	lda	|$0004,x	; right
	sta	tblWINDOW+2,y
	lda	|$0006,x	; top
	sta	tblWINDOW+4,y
	lda	|$0008,x	; bottom
	sta	tblWINDOW+6,y
	rts

*--- Data

tblWINDOW	dw	1,1	; left, right
	dw	1,25	; top, bottom
	dw	1,1	; cursor position
	dw	0,0	; paper, pen
	ds	16*MAX_WINDOW	; 4 words x 8 windows (1..8)

*-----------------------------------

SETWHITECHARS	PushWord	#15	; white chars
	_SetForeColor
	PushWord	#0	; on a black background
	_SetBackColor
	rts

*-----------------------------------

SETBLACKCHARS	PushWord	#0	; black chars
	_SetForeColor
	PushWord	#15	; on a white background
	_SetBackColor
	rts

*-----------------------------------

SETCHARSINFO	stx	charWIDTH
	sty	charHEIGHT
	rts

*-----------------------------------

PRINT	rts

*-----------------------------------

PRINTSTRING	sta	Debut

	jsr	GOTOXY

	lda	(Debut)
	and	#$ff
	beq	PRINTSTRING1	; empty string
	cmp	#chrCOMMA
	beq	PRINTSTRING1
	tax		; length
]lp	inc	Debut
	phx
	lda	(Debut)
	and	#$ff
	jsr	COUT
	plx
	dex
	bne	]lp
PRINTSTRING1	rts

*-----------------------------------

PRINTCSTRING	sta	Debut

	jsr	GOTOXY

]lp	lda	(Debut)
	and	#$ff
	beq	PRINTCSTRING1
	
	jsr	COUT
	inc	Debut
	bne	]lp
PRINTCSTRING1	rts

*-----------------------------------

COUT	and	#$ff
	cmp	#chrRET	; next line, please
	beq	COUT1
	pha

	PushWord	textX
	PushWord	textY
	_MoveTo
	_DrawChar

*----------- next X position

COUT0	lda	textX
	clc
	adc	charWIDTH
	sta	textX
	cmp	mainWIDTH
	bcs	COUT1
	
COUT99	rts

*----------- next Y position
	
COUT1	lda	marginX	; a new line
	sta	textX

	lda	textY
	clc
	adc	charHEIGHT
	sta	textY
	cmp	mainHEIGHT
	bcs	COUT2
	bcc	COUT99	; on sort

*----------- Etape 0 : on attend une touche

COUT2	lda	#199	; on se remet sur la dernire ligne
	sta	textY

	lda	#lastlineRECT
	jsr	eraseLINES
	brl	COUT99

*-----------------------------------

firstTILE	=	143

COUT160	ldx	#0
]lp	lda	tblCHR,x	; get char list
	bne	COUT161
	rts		; end of list, exit
COUT161	cmp	$bdbd	; requested char
	beq	COUT162	; the same
	inx
	inx
	bra	]lp

COUT162	lda	tblCHRADR,x	; get its address
	sta	iconToSourceLocInfo+2
	
	lda	textY	; draw it
	sec
	sbc	#7
	sta	iconToDestPoint
	lda	textX
	sta	iconToDestPoint+2

	PushLong #iconParamPtr
	_PaintPixels
	
	bra	COUT0

*-------------------------------
* ROUTINES
*-------------------------------

*-------------------------------
* CLS clears a window
*
* Eg: CLS 1

CLS	cmp	#MAX_WINDOW
	bcc	CLS_OK
	rts

CLS_OK	rts		; TO DO

*-------------------------------
* LET assigns data to a variable
* A: destination variable pointer
* X: source variable pointer
*
* Eg: LET @dest,@src

LET	stx	LET_1+1	; source variable
	sta	LET_2+1	; destination variable

	sep	#$30	; full 8-bit
	ldx	#0	; copy string
LET_1	lda	$bdbd,x
LET_2	sta	$bdbd,x
	beq	LET_END	; and its final zero
	inx
	bne	LET_1	; loop mod 256
LET_END	rep	#$30	; return in 16-bits
	rts
	
*-------------------------------
* RESTORE saves the pointer to the DATA table
* and returns to the caller
*
* Eg: RESTORE 2150

RESTORE	sta	dpDATA	; save pointer to data
	rts		; each entry is comma separated

*-------------------------------
* READ returns the current pointer to DATA (see RESTORE)
* and advances the pointer to the next entry
*
* Eg: READ A$

* 0123456
* TEMOIN,

READ	sta	dpREAD	; where to store data

	ldy	#0
	sep	#$30
]lp	lda	(dpDATA),y	; read value
	beq	READ_END	; the current entry
	cmp	#chrCOMMA
	beq	READ_END
READ_2	sta	(dpREAD),y	; store value
	iny
	bne	]lp	; 256 means 255 :-)

READ_END	lda	#0	; add a NULL
	sta	(dpREAD),y
	
	rep	#$30	
	iny		; skip separator
	tya		; ptr += len
	clc
	adc	dpDATA
	sta	dpDATA
	rts		; and return 

*------------------------------- 16F0
* INSTR(B$,A$): search A$ in B$
* TRUE if A$ is in B$
* FALSE if A$ is not in B$
*
* Eg: INSTR B$,A$

INSTR	sta	INSTR_2+1	; B$ where to search
	sta	INSTR_3+1	;  "
	sty	INSTR_1+1	; A$ what to search
	phx
	
	ldx	#0
	txy
	sep	#$30
INSTR_1	lda	$bdbd,x	; A$="TEMOIN" what to search
	beq	INSTR_OK
	cmp	#chrSPC
	beq	INSTR_OK
	cmp	#chrCOMMA
	beq	INSTR_OK	
INSTR_2	cmp	$bdbd,y	; B$="PATRICK LANGUILLE" where to search
	bne	INSTR_NEXT
	inx
	iny
	bne	INSTR_1
	beq	INSTR_OK

INSTR_NEXT	iny		; where++
INSTR_3	lda	$bdbd,y
	beq	INSTR_KO
	ldx	#0	; what=0
	beq	INSTR_1

INSTR_KO	rep	#$30	; TRUE means equal
	lda	#FALSE
	plx
	rts
INSTR_OK	rep	#$30	; FALSE means different
	lda	#TRUE
	plx
	rts

*-------------------------------
* LES SONS
*-------------------------------

playCRESCENDO	lda	#15
	sta	patchSIRENE+2
	
	ldx	#1	; boucle 12 fois
playCRESCENDO1	phx

	lda	#idxSNDSIRENE
	jsr	playSOUND
	
]lp	PushWord	#0	; has sound ended?
	PushWord	#7
	_FFSoundDoneStatus
	pla
	cmp	#-1
	bne	]lp

	pha
	PushWord #%11111111_11111111
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	playCRESCENDO2

	lda	taskREC
	cmp	#keyDownEvt
	beq	playCRESCENDO9

playCRESCENDO2 	lda	patchSIRENE+2	; volume plus important
	clc
	adc	#20
	sta	patchSIRENE+2

	plx
	inx
	cpx	#12
	bcc	playCRESCENDO1
	beq	playCRESCENDO1
	rts
playCRESCENDO9	plx
	rts
	
*-------------------------------

playDECRESCENDO	lda	#255
	sta	patchSIRENE+2
	
	ldx	#1	; boucle 12 fois
playDECRESCENDO1 phx

	lda	#idxSNDSIRENE
	jsr	playSOUND

]lp	PushWord	#0	; has sound ended?
	PushWord	#7
	_FFSoundDoneStatus
	pla
	cmp	#-1
	bne	]lp

	pha
	PushWord #%11111111_11111111
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	playDECRESCENDO2

	lda	taskREC
	cmp	#keyDownEvt
	beq	playDECRESCENDO9

playDECRESCENDO2 lda	patchSIRENE+2	; volume moins important
	sec
	sbc	#20
	sta	patchSIRENE+2

	plx
	inx
	cpx	#12
	bcc	playDECRESCENDO1
	beq	playDECRESCENDO1
	rts

playDECRESCENDO9 plx
	rts

*-------------------------------

playSOUND	nop		; or 6060 to avoid playing snd fx
	nop
	asl
	asl
	asl
	tax
	lda	tblSOUNDS,x
	sta	waveSTART
	lda	tblSOUNDS+2,x
	sta	waveSTART+2
	lda	tblSOUNDS+4,x
	sta	waveSIZE
	lda	tblSOUNDS+6,x
	sta	waveVOLUME

	lda	seqPlay	; midi playing
	beq	playSOUND1	; nope
	_MSSuspend
	
playSOUND1	PushWord #%0000_0000_1000_0000
	_FFStopSound

	PushWord #$0701
	PushLong #waveSTART
	_FFStartSound

	lda	seqPlay	; midi playing
	beq	playSOUND2	; nope
	_MSResume
	
playSOUND2	rts

*-------------------------------
* DATA
*-------------------------------

waveSTART	ds	4	; waveStart
waveSIZE	ds	2	; waveSize
	dw	214	; freqOffset
	dw	$0000	; docBuffer
	dw	$0000	; bufferSize
	ds	4	; nextWavePtr
waveVOLUME	dw	255	; volSetting

tblSOUNDS	adrl	sndBIP
	dw	2,255
	adrl	sndLIGNE
	dw	40,255
	adrl	sndRETOUR
	dw	7,255
	adrl	sndSIRENE
patchSIRENE	dw	47,15
	adrl	sndTIR
	dw	54,255
	adrl	sndMODEM
	dw	14,255
	
*---

lenSTRING	ds	2	; current string length
lenMAX	dw	MAX_LEN	; variable maximum number of chars

tblKEY	hex	00,01,02,03,04,05,06,07,08,09,0A,0B,0C,0D,0E,0F
	hex	10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F
	hex	20,21,22,23,24,25,26,27,28,29,2A,2B,2C,2D,2E,2F
	hex	30,31,32,33,34,35,36,37,38,39,3A,3B,3C,3D,3E,3F
	hex	40,41,42,43,44,45,46,47,48,49,4A,4B,4C,4D,4E,4F
	hex	50,51,52,53,54,55,56,57,58,59,5A,5B,5C,5D,5E,5F
	hex	60,41,42,43,44,45,46,47,48,49,4A,4B,4C,4D,4E,4F
	hex	50,51,52,53,54,55,56,57,58,59,5A,7B,7C,7D,7E,7F
	hex	80,81,82,83,84,85,86,87,41,41,41,8B,8C,43,45,45
	hex	45,45,92,93,49,49,96,97,98,4F,9A,9B,9C,55,55,9F
	hex	A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,AA,AB,AC,AD,AE,AF
	hex	B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,BD,BE,BF
	hex	C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,CA,CB,CC,CD,CE,CF
	hex	D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,DA,DB,DC,DD,DE,DF
	hex	E0,C1,C2,C3,C4,C5,C6,C7,C8,C9,CA,CB,CC,CD,CE,CF
	hex	D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,DA,FB,FC,FD,FE,FF

*-------------------------------
* GFX CHARACTERS
*-------------------------------

*-------------------------------
* CHR$(amstrad)
* https://en.wikipedia.org/wiki/Amstrad_CPC_character_set
*   1 01	return character
*   7 07	beep
*   8 08	left cursor (really move cursor)
*  16 10	return character
*  24 18	inverse ink <-> background
* 128 80	return character
* 143 8F	black block
* 154 9A	large -
* 209 D1	I (pipe fermant)
* 211 D3	I (pipe ouvrant)
* 243 F3	->
* 255 FF	<->

tblCHR	dw	143,154,209,211,243,253,254
	dw	0	; end of table
tblCHRADR	da	CHR143,CHR154,CHR209,CHR211,CHR243,CHR253,CHR254

CHR143	hex	FFFFFFFF	; $8F
	hex	FFFFFFFF
	hex	FFFFFFFF
	hex	FFFFFFFF
	hex	FFFFFFFF
	hex	FFFFFFFF
	hex	FFFFFFFF
	hex	FFFFFFFF

CHR154	hex	00000000	; $9A
	hex	00000000
	hex	00000000
	hex	FFFFFFFF
	hex	FFFFFFFF
	hex	00000000
	hex	00000000
	hex	00000000

CHR209	hex	000000FF	; $D1
	hex	000000FF
	hex	000000FF
	hex	000000FF
	hex	000000FF
	hex	000000FF
	hex	000000FF
	hex	000000FF

CHR211	hex	FF000000	; $D3
	hex	FF000000
	hex	FF000000
	hex	FF000000
	hex	FF000000
	hex	FF000000
	hex	FF000000
	hex	FF000000

CHR243	hex	0000F000	; $F3
	hex	0000FF00
	hex	0000FFF0
	hex	FFFFFFFF
	hex	FFFFFFFF
	hex	0000FFF0
	hex	0000FF00
	hex	0000F000

CHR253	hex	00FFFF00	; $FD
	hex	FFFFFFFF
	hex	FFFFFFFF
	hex	000FF000
	hex	0000FF00
	hex	000FF000
	hex	00FF0000
	hex	000FF000

CHR254	hex	000FF000	; $FE
	hex	00FFFF00
	hex	0FFFFFF0
	hex	000FF000
	hex	000FF000
	hex	0FFFFFF0
	hex	00FFFF00
	hex	000FF000


*--- End of the code

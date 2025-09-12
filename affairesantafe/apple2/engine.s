*
* L'affaire Santa Fe
*
* (c) Gilles Blancon
* (c) 1988, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* EQUATES
*-------------------------------

DFT_X	=	0
DFT_Y	=	0
DFT_PAPER	=	indexWHITE
DFT_PEN	=	indexBLACK
MAX_WINDOW	=	8
MAX_LINES	=	30	; we know it is 25
MAX_COLUMNS	=	100	; we know it is 80

DFT_CHAR_WIDTH	=	8	; default character width
DFT_CHAR_HEIGHT	=	8	; default character height

*-------------------------------
* MACROS
*-------------------------------

@border	mac
	lda	]1
	jsr	BORDER
	<<<

@cls	mac
	lda	]1
	jsr	CLS
	<<<

@len	mac
	lda	]1
	jsr	LEN
	<<<

@let	mac
	lda	]1
	ldx	]2
	jsr	LET
	<<<

@inkey	mac
	jsr	RDKEYONLY
	<<<

@inkey_true	mac
	jsr	INKEY
	sta	]1
	<<<

@input	mac
	lda	]1
	ldx	]2
	jsr	GETLN1
	<<<

@instr	mac
	lda	]1
	ldy	]2
	jsr	INSTR
	<<<

@locate	mac
	lda	]1
	ldx	]2
	ldy	]3
	jsr	LOCATE
	<<<

@mode	mac
	lda	]1
	jsr	MODE
	<<<
	
@paper	mac
	lda	]1
	ldx	]2
	jsr	PAPER
	<<<
	
@pen	mac
	lda	]1
	ldx	]2
	jsr	PEN
	<<<

@print	mac
	lda	]1
	ldx	]2
	jsr	PRINT
	<<<

@read	mac
	lda	]1
	jsr	READ
	<<<
	
@restore	mac
	lda	]1
	jsr	RESTORE
	<<<
	
@upper	mac
	lda	]1
	jsr	UPPER
	<<<

@window	mac
	lda	]1
	ldx	]2
	jsr	WINDOW
	<<<
	
*-------------------------------
* BORDER
*-------------------------------

BORDER	sta	theBORDER

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

*---

theBORDER	ds	2

*-------------------------------
* INPUT/OUTPUT
*-------------------------------

GETLN1	sta	lenMAX
	stx	GETLN1_1+1
	stx	GETLN1_2+1

	jsr	setSTREAMPAPER	; set the background color
	jsr	setSTREAMPEN	; set the foreground color
	jsr	setSTREAMXY	; set the XY SHR coordinates

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
*	beq	doSPC

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
*	jsr	CURSORERASE
*	lda	#chrSPC
*	jsr	COUT
	ldx	lenSTRING
	rts

*doSPC	jsr	WHITESPACE
*	ldx	lenSTRING
*	lda	#chrSPC
*	bra	doIT

doBACK	cpx	#0
	beq	]lp
	jsr	CURSORERASE
	ldx	lenSTRING
	dex
	jmp	GETLN2

*-------------------------------

UPPER	sta	rewriteSTR1+1	; save pointer
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

checkMUSIC	lda	taskMODIFIERS
	and	#appleKey
	cmp	#appleKey
	bne	checkMUSIC99

	lda	taskMESSAGE
	cmp	#'m'
	beq	checkMUSIC88
	cmp	#'M'
	bne	checkMUSIC99

checkMUSIC88	jsr	doMUSIK	; this is oa-m	
	clc
	rts
checkMUSIC99	sec		; this is not oa-m
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

	jsr	checkMUSIC
	bcc	RDKEY

	lda	taskREC
	cmp	#mouseDownEvt
	beq	RDKEYGOOD
	cmp	#keyDownEvt
	bne	RDKEY

RDKEYGOOD	ldx	taskMESSAGE
	rts

*-------------------------------

RDKEYCURSOR	jsr	CURSOR

RDKEYONLY	inc	vblCOUNTER
	jsr	checkREPLAY

	lda	theTEMPO
	beq	RDKEYOK

	lda	taskWHEN+2
	cmp	theTICK+2
	bcc	RDKEYOK
	lda	taskWHEN
	cmp	theTICK
	bcs	RDKEYEXIT

RDKEYOK	pha
	PushWord #%11111111_11111111
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	RDKEYONLY

	jsr	checkMUSIC
	bcc	RDKEYONLY

	lda	taskREC
	cmp	#keyDownEvt
	bne	RDKEYONLY

	stz	theTEMPO	; we did not exit
	lda	taskMESSAGE	; b/c of end time
	rts

RDKEYEXIT	lda	#chrRET	; we exit b/c of
	sta	taskMESSAGE	; end time
	rts

*-------------------------------
* The real INKEY...

INKEY	inc	vblCOUNTER
	jsr	checkREPLAY

	pha
	PushWord #%11111111_11111111
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	INKEY_NO

	jsr	checkMUSIC
	bcc	INKEY

	lda	taskREC
	cmp	#keyDownEvt
	bne	INKEY_NO

	lda	taskMESSAGE
	rts
INKEY_NO	lda	#FALSE
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

mainSCB	dw	mode320
mainWIDTH	dw	screen320
mainHEIGHT	dw	screenheight

*-------------------------------
* TEXT
*-------------------------------

clsRECT	dw	0,0,200,320

*-----------------------------------

CURSORERASE
	dec	textX
	lda	#255
	jsr	COUT160
*	dec	textX
	rts

*-----------------------------------

CURSOR	rts
	
	lda	#143	; black bullet
	jmp	COUT160

*-----------------------------------
* #s,x,y

LOCATE	dey
	phy
	
	asl		; *16
	asl
	asl
	asl
	tay

	dex
	txa		; X
	sta	tblWINDOW+8,y
	lda	1,s	; Y
	sta	tblWINDOW+10,y

	ply
	rts

*-----------------------------------
* WINDOW
* A: pointer to window definition
*   +0: window index
*   +2: left, right, top, bottom
*  +10: cursor x&y positions
*  +14: paper, pen

WINDOW	cmp	#MAX_WINDOW
	bcc	WINDOW1
	beq	WINDOW1
	rts

WINDOW1	asl		; *16
	asl
	asl
	asl
	tay
	
	lda	|$0000,x	; left
	sta	tblWINDOW,y
	lda	|$0002,x	; right
	sta	tblWINDOW+2,y
	lda	|$0004,x	; top
	sta	tblWINDOW+4,y
	lda	|$0006,x	; bottom
	sta	tblWINDOW+6,y
	
	lda	#DFT_X	; set default X
	sta	tblWINDOW+8,y
	lda	#DFT_Y	; set default Y
	sta	tblWINDOW+10,y
	lda	#DFT_PAPER	; set default PAPER
	sta	tblWINDOW+12,y
	lda	#DFT_PEN	; set default PEN
	sta	tblWINDOW+14,y
	rts

*--- Data

tblWINDOW	dw	0,40	;  +0: left,   +2: right
	dw	0,25	;  +4: top,    +6: bottom
	dw	DFT_X,DFT_Y	;  +8: cursor position
	dw	DFT_PAPER,DFT_PEN	; +12: paper, +14: pen
	ds	16*MAX_WINDOW	; 4 words x 8 windows (1..8)

*-----------------------------------
* getSTREAMxx
* Get the PAPER of the selected stream
* Get the PEN of the selected stream
* Get the X/Y of the selected stream

getSTREAMPAPER	lda	theSTREAM
	asl
	asl
	asl
	asl
	tay
	lda	tblWINDOW+12,y
	rts

getSTREAMPEN	lda	theSTREAM
	asl
	asl
	asl
	asl
	tay
	lda	tblWINDOW+14,y
	rts

*-----------------------------------
* setSTREAMxx
* Set the PAPER of the selected stream
* Set the PEN of the selected stream
* Set the X/Y of the selected stream

setSTREAMPAPER	lda	theSTREAM
	asl
	asl
	asl
	asl	; *16
	tay
	lda	tblWINDOW+12,y
	pha
	_SetBackColor
	rts

	PushWord	#^blackPATTERN
	lda	theSTREAM
	asl
	asl
	asl
	asl
	asl
	clc
	adc	#blackPATTERN
	pha
	_SetBackPat
	rts
	
	PushWord	#^blackPATTERN
	lda	theSTREAM
	asl
	asl
	asl
	asl
	asl	; *32
	clc
	adc	#blackPATTERN
	pha
	_SetBackPat
	rts

setSTREAMPEN	lda	theSTREAM
	asl
	asl
	asl
	asl
	tay
	lda	tblWINDOW+14,y
	pha
	_SetForeColor
	rts

* window x1,y1 + locate x1,y1 -> textX, textY

setSTREAMXY	lda	theSTREAM
	asl
	asl
	asl
	asl
	tay
	phy
	lda	tblWINDOW,y	; X1
	sta	marginX	; set left X
	clc
	adc	tblWINDOW+8,y	; + locate X
	sta	textX

	ply
	lda	tblWINDOW+4,y	; Y1
	sta	marginY	; set top Y
	clc
	adc	tblWINDOW+10,y	; + locate Y
	sta	textY

	lda	tblWINDOW+2,y	; set max X/Y
	sta	maxX
	lda	tblWINDOW+6,y
	sta	maxY
	rts

*-----------------------------------
* GOTOXY
* Set the SHR X/Y from text X/Y

GOTOXY	lda	textX
	asl
	tax
	lda	tblX,x
                pha
	
	lda	textY
	asl
	tay
	lda	tblY+2,y	; QDII draws bottom up
	dec
                pha

	_MoveTo
	rts

*-----------------------------------
* MODE n
* Set the mode

MODE	lda	#DFT_CHAR_WIDTH	; assume mode 1
	sta	charWIDTH
	lda	#DFT_CHAR_HEIGHT
	sta	charHEIGHT

	ldy	#MAX_COLUMNS
	ldx	#0
	lda	#0
]lp	sta	tblX,x
	clc
	adc	charWIDTH
	inx
	inx
	dey
	bne	]lp

	ldy	#MAX_LINES
	ldx	#0
	lda	#0
]lp	sta	tblY,x
	clc
	adc	charHEIGHT
	inx
	inx
	dey
	bne	]lp
	rts

*-----------------------------------
* PAPER #s,color
* Set the background color of the stream

PAPER	asl	; *16
	asl
	asl
	asl
	tay
	txa
	sta	tblWINDOW+12,y
	rts

*-----------------------------------
* PEN #s,color
* Set the fore color of the stream

PEN	asl	; *16
	asl
	asl
	asl
	tay
	txa
	sta	tblWINDOW+14,y
	rts

*-----------------------------------

SETCHARSINFO	stx	charWIDTH
	sty	charHEIGHT
	rts

*-----------------------------------

LEN	sta	Debut

	ldy	#0
	sep	#$30
]lp	lda	(Debut),y
	and	#$ff
	beq	lenEND
	iny
	bne	]lp
lenEND	rep	#$30
	tya
	rts

*-----------------------------------

PRINT	sta	theSTREAM
	stx	Debut

	jsr	setSTREAMPAPER	; set the background color
	jsr	setSTREAMPEN	; set the foreground color
	jsr	setSTREAMXY	; set the XY SHR coordinates

]lp	lda	(Debut)
	and	#$ff
	beq	PRINTCSTRING1
	
	jsr	COUT
	inc	Debut
	bne	]lp
PRINTCSTRING1	rts

*-----------------------------------

COUT	and	#$ff
	cmp	#chrSPC	; skip space
	beq	COUT0
	cmp	#chrRET	; next line, please
	beq	COUT1
	pha

	jsr	GOTOXY

	_DrawChar

*----------- next X position

COUT0	inc	textX
	lda	textX
	cmp	maxX
	bcc	COUT3
	beq	COUT3

*----------- next Y position
	
COUT1	lda	marginX	; a new line
	sta	textX

	inc	textY
	lda	textY
	cmp	maxY
	bcc	COUT3
	beq	COUT3

*----------- upper left position

COUT2	lda	marginY
	sta	textY
COUT3	rts

*-----------------------------------

firstTILE	=	143

COUT160	sta	COUT161+1
	ldx	#0
]lp	lda	tblCHR,x	; get char list
	bne	COUT161
	rts		; end of list, exit
COUT161	cmp	#$bdbd	; requested char
	beq	COUT162	; the same
	inx
	inx
	bra	]lp

COUT162	lda	tblCHRADR,x	; get its address
	sta	iconToSourceLocInfo+2
	
	lda	textX
	asl
	tax
	lda	tblX,x
	sta	iconToDestPoint+2
	
	lda	textY
	asl
	tay
	lda	tblY,y	; QDII draws bottom up
	sta	iconToDestPoint

	PushLong #iconParamPtr
	_PaintPixels
	
	rts
*	brl	COUT0

*-------------------------------
* ROUTINES
*-------------------------------

*-------------------------------
* CLS clears a window
*
* Eg: CLS 1

CLS
*	cmp	#MAX_WINDOW
*	bcc	CLS_OK
*	rts

CLS_OK	sta	theSTREAM
	
	asl
	asl
	asl
	asl
	tay
	lda	tblWINDOW,y	; X1
	asl
	tax
	lda	tblX,x
	sta	clsRECT+2
	
	lda	tblWINDOW+2,y	; X2
*	cmp	tblWINDOW,y
*	bne	CLS_DIFFX
*	inc
CLS_DIFFX	asl
	tax
	lda	tblX,x
	clc
	adc	charWIDTH
	sta	clsRECT+6

	lda	tblWINDOW+4,y	; Y1
	asl
	tax
	lda	tblY,x
	sta	clsRECT

	lda	tblWINDOW+6,y	; Y2
*	cmp	tblWINDOW+4,y
*	bne	CLS_DIFFY
*	inc		; Y2+=1
CLS_DIFFY	asl
	tax
	lda	tblY,x
	clc
	adc	charHEIGHT
	sta	clsRECT+4

	lda	#DFT_X	; reset X/Y
	sta	tblWINDOW+8,y
	lda	#DFT_Y
	sta	tblWINDOW+10,y

	lda	tblWINDOW+12,y	; PAPER
	asl
	tax
	lda	tblFULLCOLOR,x
	
	PushLong	#clsRECT	; and finally, clear the window
	pha
	pha
	_SpecialRect

*--- Met-on le cadre ?

	lda	srcRectPtr+4
	cmp	#200
	beq	CLS_NOFRAME

                jsr             makeFRAME

CLS_NOFRAME     rts

*-------------------------------

DEBUG	sep	#$20
	ldal	$c034
	inc
	stal	$c034
	rep	#$20
	rts
	
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

playSOUND	nop		; or 6060 to avoid playing snd fx
	nop
	dec
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
	bne	playSOUND2	; nope
	
	PushWord #%0000_0000_1000_0000
	_FFStopSound

	PushWord #$0701
	PushLong #waveSTART
	_FFStartSound

playSOUND2	rts

*-------------------------------
* DATA
*-------------------------------

theSTREAM	ds	2	; requested stream

tblFULLCOLOR	dw	$0000,$1111,$2222,$3333
	dw	$4444,$5555,$6666,$7777
	dw	$8888,$9999,$AAAA,$BBBB
	dw	$CCCC,$DDDD,$EEEE,$FFFF

tblX	ds	2*128	; up to 128 columns
tblY	ds	2*32	; and 32 rows

*-------------------------------

waveSTART	adrl	sndTIR	; waveStart
waveSIZE	dw	54	; waveSize
	dw	214	; freqOffset
	dw	$0000	; docBuffer
	dw	$0000	; bufferSize
	ds	4	; nextWavePtr
waveVOLUME	dw	255	; volSetting

tblSOUNDS	adrl	sndTIR
	dw	64,255	; $4000 bytes
	
*-------------------------------

lenSTRING	ds	2	; current string length
lenMAX	ds	MAX_LEN

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

tblCHR	dw	143,154,209,211,243,253,254,255
	dw	0	; end of table
tblCHRADR	da	CHR143,CHR154,CHR209,CHR211,CHR243,CHR253,CHR254,CHR255

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

CHR255	hex	00000000	; $FF
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000


*--- End of the code

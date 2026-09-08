*
* Le cimetière des ocelots
*
* (c) 2026, Turk182
* (c) 2026, Brutal Deluxe Software
*

	mx	%00

*--- Il faudra changer la couleur 2 de la palette en #$800

*-------------------------------
* EQUATES
*-------------------------------

MAXCOLORS	=	27	; 0..26
MAXINK	=	16	; 0..15
MAXMODE	=	3	; 0..2

FIRST_ROW	=	1
FIRST_COLUMN	=	1

eEOD	=	0
eINK	=	1
ePAPER	=	2
ePEN	=	3
eLOCATE	=	4
eBORDER	=	5
eCLS	=	6
eMODE	=	7
eWAIT	=	8
eSOUND	=	9

*-------------------------------

GFX_WIDTH	=	640	; **always**
GFX_HEIGHT	=	400	; **always**

DFT_WIDTH	=	40
DFT_HEIGHT	=	25

DFT_X	=	1
DFT_Y	=	1
DFT_PAPER	=	indexBLACK
DFT_PEN	=	indexYELLOW
MAX_WINDOW	=	8
MAX_LINES	=	30	; we know it is 25
MAX_COLUMNS	=	100	; we know it is 80

DFT_CHAR_WIDTH	=	8	; default character width
DFT_CHAR_HEIGHT	=	8	; default character height

*--- Les accents

* Les accents (encore et toujours)
*
* à	88
* â	89
* ä	8a
* ç	8d
* é	8e
* è	8f
* ê	90
* ë	91
* î	94
* ï	95
* ô	99
* ù	9d
* û	9e
* (c) 	a9 (only c)
* oe	cf
* "	22

*-------------------------------
* MACROS
*-------------------------------

@BORDER	mac
	lda	]1
	jsr	BORDER
	<<<

@CLS	mac
	lda	]1
	jsr	CLS
	<<<

@COUT	mac
	lda	]1
	jsr	COUT
	<<<

@DRAW	mac
	ldx	]1
                ldy             ]2
	jsr	DRAW
	<<<

@GFXPAPER	mac
	lda	]1
	jsr	GFXPAPER
	<<<

@GFXPEN	mac
	lda	]1
	jsr	GFXPEN
	<<<

@INK	mac
	ldx	]1
	ldy	]2
	jsr	INK
	<<<

@INKEY	mac
	jsr	INKEY
	<<<

@INKEY_TRUE	mac
	jsr	INKEY_TRUE
	<<<

@INPUT	mac
                lda             ]1
                ldx             ]2
	jsr	INPUT
	<<<

@INSTR	mac
	lda	]1
	ldy	]2
	jsr	
	<<<

@LET	mac
	lda	]1
	ldx	]2
	jsr	LET
	<<<

@LOAD	mac
	lda	]1
	jsr	LOAD
	<<<

@LOCATE	mac
	lda	]1
	ldx	]2
	ldy	]3
	jsr	LOCATE
	<<<
	
@MODE	mac
	lda	]1
	jsr	MODE
	<<<

@MOVE	mac
	ldx	]1
                ldy             ]2
	jsr	MOVE
	<<<

@PAPER	mac
	lda	]1
                ldx             ]2
	jsr	PAPER
	<<<

@PEN	mac
	lda	]1
                ldx             ]2
	jsr	PEN
	<<<

@PRINT	mac
	lda	#]1
                ldx             #^]2
	ldy	#]2
	jsr	PRINT
	<<<

@READ	mac
	lda	]1
	jsr	READ
	<<<

@RESTORE	mac
	lda	]1
	jsr	RESTORE
	<<<

@SOUND	mac
	ldx	]1
	ldy	]2
	lda	]3	; optional
	jsr	SOUND
	<<<

@STRCMP	mac
	lda	]1
	ldx	]2
	jsr	STRCMP
	<<<

@UPPER	mac
	lda	]1
	jsr	UPPER
	<<<

@WAIT	mac
	lda	]1
	jsr	nowWAIT_ALT
	<<<

@WINDOW	mac
	lda	]1
	ldx	]2
	jsr	WINDOW
	<<<

*---

@COUT144	mac
	ldx	]1
	ldy	]2
	lda	]3
	jsr	COUT144
	<<<

@COUT160	mac
	lda	]1
	jsr	COUT160
	<<<
	
@DEBUG	mac
	DO	FGDEBUG
	cmp	#'0'
	bne	*+5
	jmp	DEBUG
	ELSE
	FIN
	<<<
	
@SHOWPIC	mac
	jsr	SHOWPIC
	<<<

*-------------------------------
* ENGINE
*-------------------------------

LOAD	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	LOAD1
	
	@PRINT	#0;strLOADERR
	rts

LOAD1	lda	proEOF
	ldx	#0
	txy
	jmp	unpackLZ4

*---

strLOADERR	dfb	eINK,0,0
	dfb	eINK,2,6
	dfb	eCLS
	dfb	ePEN,2
	asc	'Erreur de chargement'
	dfb	eEOD

*-------------------------------
* SOUND G,H,I
*  G: channel (mandatory)
*     1: left
*     2: center
*     3: right
*  H: tone period (mandatory)
*     Frequency = 125000 / period
*  I: duration (optional, default is 20)
*     <0: number of repeats
*     >0: duration in 1/100ths second
      
SOUND	lda	fgSOUND
	bne	SOUND9

	sty	waveFREQ	; ahem...

	PushWord #%0000_0000_1000_0000	; stop sound
	_FFStopSound

	PushWord #$0701		; start sound
	PushLong #waveSTART
	_FFStartSound

]lp	PushWord	#0	; has sound ended?
	PushWord	#7
	_FFSoundDoneStatus
	pla
	cmp	#-1
	bne	]lp

SOUND9	rts

*--

waveSTART	ds	4	; waveStart
waveSIZE	dw	9	; waveSize in pages
waveFREQ	dw	107	; freqOffset
	dw	$0000	; docBuffer
	dw	$0000	; bufferSize
	ds	4	; nextWavePtr
waveVOLUME	dw	255	; volSetting

*-------------------------------
* SHOWPIC
* Displays a SHR picture

SHOWPIC	PushLong	ptrIMAGE
	PushLong	ptrSCREEN
	PushLong	#32768
	_BlockMove
	rts

*-------------------------------
* INPUT A$,N
* Input a string A$ of length N

INPUT	sta	INPUT_P1+1
	sta	INPUT_P2+1
	stx	lenMAX

	ldx	#0
INPUT2	stx	lenSTRING

]lp	lda	#$a5	; black bullet
	jsr	COUT

	dec	textX
	jsr	GOTOXY

	jsr	INKEY

	ldx	lenSTRING
	cmp	#chrRET
	beq	doEXIT
	cmp	#chrDEL
	beq	doBACK
	cmp	#chrLA
	beq	doBACK
	cmp	#chrSPACE	; must not be another control character
	bcc	]lp
*	beq	doSPC

doIT	sep	#$20
INPUT_P1	sta	$bdbd,x
	rep	#$20
	jsr	COUT
doNEXT	ldx	lenSTRING
	inx
	cpx	lenMAX
	bcc	INPUT2

doEXIT	sep	#$20
	lda	#chrRETURN	; put a final return
INPUT_P2	sta	$bdbd,x
	rep	#$20
	stx	lenSTRING
	lda	#143
	jsr	COUT160
	lda	#chrRET
	jsr	COUT
	ldx	lenSTRING
	rts

*doSPC	lda	#143
*	jsr	COUT160
*	dec	textX
*	jsr	GOTOXY
*	ldx	lenSTRING
*	lda	#chrSPACE
*	bra	doIT

doBACK	cpx	#0	; ANTx
	beq	]lp
	
	lda	#143
	jsr	COUT160
	
	dec	textX
	dec	textX
	jsr	GOTOXY
	
	ldx	lenSTRING
	dex
	jmp	INPUT2

*-------------------------------
* INKEY
* INKEY_VAR A$
* Waits for a keypress
* Returns the keypress in A$
* Handles oa-m and oa-q

INKEY	lda	#inkeyDUMMY
INKEY_A$	sta	saveDUMMY_ADR+1

	lda	#FALSE	; init dummy
	jsr	saveDUMMY
	
INKEY0	jsr	checkREPLAY

	pha
	PushWord #$ffff
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	INKEY0

	lda	taskMODIFIERS	; test open-apple
	and	#appleKey
	cmp	#appleKey
	beq	INKEY2

	lda	taskREC
	cmp	#keyDownEvt
	bne	INKEY0

	lda	taskMESSAGE
	and	#$ff
	cmp	#'a'
	bcc	INKEY1
	cmp	#'z'+1
	bcs	INKEY1
	and	#$df	; make it A-Z
INKEY1	jmp	saveDUMMY

INKEY2	lda	taskMESSAGE
	cmp	#'m'
	beq	INKEY3
	cmp	#'M'
	bne	INKEY4

INKEY3	jsr	doMUSIK
	bra	INKEY0

INKEY4	cmp	#'q'	; -q to quit
	beq	INKEY5
	cmp	#'Q'
	bne	INKEY0
INKEY5	jmp	QUIT

*-------------------------------
* INKEY_TRUE
* INKEY_TRUE A$
* Returns true if a key was pressed
* False otherwise

INKEY_TRUE	lda	#inkeyDUMMY
INKEY_TRUE_A$	sta	saveDUMMY_ADR+1

	jsr	checkREPLAY

	pha
	PushWord #$ffff
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	INKEY_FALSE

	lda	taskREC
	cmp	#keyDownEvt
	beq	INKEY_FALSE

	lda	taskMESSAGE
	jsr	saveDUMMY

	lda	#TRUE
	clc
	rts

INKEY_FALSE	lda	#FALSE
	jsr	saveDUMMY
	sec
	rts

*---------------

saveDUMMY	and	#$ff
	sep	#$20
saveDUMMY_ADR	sta	inkeyDUMMY
	rep	#$20
	rts

*---

inkeyDUMMY	ds	2

*-------------------------------
* DRAW X,Y
* Draws a line to X,Y
* Amstrad is left/right,bottom/up

DRAW	txa
	lsr
	pha
	
	phy
	lda	#GFX_HEIGHT
	sec
	sbc	1,s
	lsr
	sta	1,s
	
	_LineTo
	rts

*-------------------------------
* MOVE X,Y
* Moves the gfx cursor to X,Y
* Amstrad is left/right,bottom/up

MOVE	txa
	lsr
	pha
	
	phy
	lda	#GFX_HEIGHT
	sec
	sbc	1,s
	lsr
	sta	1,s
	
	_MoveTo
	rts

*-------------------------------
* BORDER N
* Sets the IIgs border to color index N

engBORDER	lda	theSTREAM

BORDER	asl
	tax
	lda	iigsINK,x
	and	#$ff
                sta             theBORDER
	pha
	PushWord	#$1c
	_WriteBParam

	sep	#$30
	ldal	CLOCKCTL
	and	#$F0
	ora	theBORDER
	stal	CLOCKCTL
	rep	#$30

	rts

*-------------------------------
* CLS #s
* Clears stream #s

engCLS	lda	theSTREAM

CLS	sta	theSTREAM
	
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
	rts

*-------------------------------
* LET @dest,@src
* Assigns data to a variable
* A: destination variable pointer
* X: source variable pointer

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
* RESTORE @n
* Saves the pointer @n to the DATA table

RESTORE	sta	dpDATA	; save pointer to data
	rts		; each entry is comma separated

*-------------------------------
* READ A$
* Returns the current pointer to DATA (see RESTORE)
* and advances the pointer to the next entry

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
* INSTR B$,A$
* Search A$ in B$
* TRUE if A$ is in B$
* FALSE if A$ is not in B$
*

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
* INK I,C
* Sets color C to index I

INK	stx	theINKINDEX
	sty	theINKVALUE

	PushWord	#0	; for SetColorEntry
	phx
	
	txa		; save color index at index*2
	asl
	tax
	tya
	sta	tblINK,x
	
	tya
	asl
	tay
	lda	tblBORDER,y	; save border index at index*2
	sta	iigsINK,x

	lda	amsPAL320,y
	pha
	_SetColorEntry
	rts
	
*-----------------------------------
* LOCATE #s,x,y
* Sets x,y coordinates for stream s

engLOCATE	lda	theSTREAM

LOCATE	cmp	#MAX_WINDOW
	bcc	LOCATE1
	beq	LOCATE1
	rts

LOCATE1	sta	theSTREAM

*	dey
	phy
	
	asl		; *16
	asl
	asl
	asl
	tay

*	dex
	txa		; X
	sta	tblWINDOW+8,y
	lda	1,s	; Y
	sta	tblWINDOW+10,y

	ply
	
	jsr	setSTREAMXY
	jmp	GOTOXY
*	rts

*-----------------------------------
* STRCMP A$,B$
* Compares two strings
* Returns TRUE if similar
* FALSE if different

STRCMP	sta	dpINSTR1
	stx	dpINSTR2

	sep	#$20
	ldy	#0
]lp	lda	(dpINSTR1),y
	beq	STRCMP2
	cmp	(dpINSTR2),y
	bne	STRCMP1
	iny
	bne	]lp
	beq	STRCMP2
STRCMP1	rep	#$20	; strings are different
	lda	#FALSE
	sec
	rts

	mx	%10
STRCMP2	cmp	(dpINSTR2),y	; compare final 0
	beq	STRCMP3
	lda	(dpINSTR2),y	; ou un return
	cmp	#chrRETURN
	bne	STRCMP1
	
STRCMP3	rep	#$20	; strings are equal
	lda	#TRUE
	clc
	rts
	
*-----------------------------------
* WINDOW #s
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

tblWINDOW	dw	FIRST_COLUMN,DFT_WIDTH	;  +0: left,   +2: right
	dw	FIRST_ROW,DFT_HEIGHT	;  +4: top,    +6: bottom
	dw	DFT_X,DFT_Y	;  +8: cursor position
	dw	DFT_PAPER,DFT_PEN	; +12: paper, +14: pen
	ds	16*MAX_WINDOW	; 8 words x 8 windows (1..8)

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
* GFXPAPER
* GFXPEN

GFXPAPER	PushWord	#^blackPATTERN
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

GFXPEN	PushWord	#^blackPATTERN
	asl
	asl
	asl
	asl
	asl
	clc
	adc	#blackPATTERN
	pha
	_SetPenPat
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
	dec
	sta	marginX	; set left X
*	clc
*	adc	tblWINDOW+8,y	; + locate X
*	dec		; -1
	lda	tblWINDOW+8,y	; new
	sta	textX

	ply
	lda	tblWINDOW+4,y	; Y1
	dec
	sta	marginY	; set top Y
*	clc
*	adc	tblWINDOW+10,y	; + locate Y
*	dec		; -1
	lda	tblWINDOW+10,y	; new
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
	clc		; new
	adc	marginX	; new
	asl
	tax
	lda	tblX,x
	sta	shrX
	pha
	
	lda	textY
	clc		; new
	adc	marginY	; new
	asl
	tay
	lda	tblY+2,y	; QDII draws bottom up
	sta	shrY
	dec
	pha

	_MoveTo
	rts

*-----------------------------------
* MODE n
* Set the mode n (0..2)

MODE            sta	theMODE

	asl
	tay

	ldx	tblMODE,y
	ldy	#0
]lp	lda	|$0000,x
	sta	maxX,y
	inx
	inx
	iny
	iny
	cpy	#tblMODE1-tblMODE0
	bcc	]lp

*--- Switch resolution

	lda	theIIGSMODE
	pha
	pha
	_SetMasterSCB
	_SetAllSCBs
	PushLong	mainPORT
	_InitPort

	PushWord	#0
	PushWord	theIIGSWIDTH
	PushWord	#0
	PushWord	#200
	_ClampMouse
	_HomeMouse

*--- Set new palette

	lda	theMODE
	cmp	#2
	beq	MODE_640

MODE_320	PushWord	#0	; MODES 0/1
	PushLong	#palette320
	_SetColorTable
	bra	MODE_960

MODE_640	PushWord	#0	; MODE 2
	PushLong	#palette640
	_SetColorTable

*--- Create X&Y tables

MODE_960	ldy	#MAX_COLUMNS
	ldx	#FIRST_COLUMN*2
	lda	#0
]lp	sta	tblX,x
	clc
	adc	charWIDTH
	inx
	inx
	dey
	bne	]lp

	ldy	#MAX_LINES
	ldx	#FIRST_ROW*2
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

engPAPER	tax
	lda	theSTREAM

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

engPEN	tax
	lda	theSTREAM

PEN	asl	; *16
	asl
	asl
	asl
	tay
	txa
	sta	tblWINDOW+14,y
	rts

*-----------------------------------
* UPPER str1,str2
* Makes a string UPPERCASE

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
* LEN string
* Returns a c-string length

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

SETCHARSINFO	stx	charWIDTH
	sty	charHEIGHT
	rts

*------------------------------- Print a CSTRING

PRINT	sta             theSTREAM
                sty	GET_CHAR+1
	sep	#$10
	stx	GET_CHAR+3
	rep	#$10

*	PushWord #$0800
*	PushWord #32768		; Amstrad.8
*	PushWord #0
*	_InstallFont
*
*	PushWord	#modeOr
*	_SetTextMode

PRINT_OUTER	jsr	setSTREAMXY	; set the XY SHR coordinates
PRINT_INNER	jsr	setSTREAMPAPER	; set the background color
	jsr	setSTREAMPEN	; set the foreground color

PRINT_LOOP	jsr	GET_CHAR	; get a character
	cmp	#eEOD
	bne	PRINT1	; end of string
	rts

PRINT1	cmp	#chrRET	; >$0d, print char
	bcc	PRINT_FN
	jsr	COUT	; print character
	bra	PRINT_LOOP	; and loop

PRINT_FN	cmp	#eINK	; handle INK change
	bne	PRINT3
	jsr	GET_CHAR
	tax
	jsr	GET_CHAR
	tay
	jsr	INK
	bra	PRINT_LOOP

PRINT3	cmp	#ePEN	; handle PEN change
	bne	PRINT4
	jsr	GET_CHAR
	jsr	engPEN
	bra	PRINT_INNER
	
PRINT4	cmp	#ePAPER	; handle PAPER change
	bne	PRINT5
	jsr	GET_CHAR
	jsr	engPAPER
	bra	PRINT_INNER

PRINT5	cmp	#eLOCATE	; handle LOCATE change
	bne	PRINT6
	jsr	GET_CHAR
	tax
	jsr	GET_CHAR
	tay
	jsr	engLOCATE
	bra	PRINT_OUTER

PRINT6	cmp	#eBORDER	; handle PAPER change
	bne	PRINT7
	jsr	GET_CHAR
	jsr	BORDER
	bra	PRINT_LOOP

PRINT7	cmp	#eCLS	; handle CLS change
	bne	PRINT8
	jsr	engCLS
	brl	PRINT_OUTER
	
PRINT8	cmp	#eMODE	; handle MODE change
	bne	PRINT9
	jsr	GET_CHAR
	jsr	MODE
	brl	PRINT_OUTER

PRINT9	cmp	#eWAIT
	bne	PRINT_LOOP0
	jsr	GET_CHAR
	jsr	nowWAIT_ALT
	brl	PRINT_LOOP

PRINT_LOOP0	cmp	#eSOUND
	bne	PRINT_NOTFN
	jsr	GET_CHAR
	tax
	jsr	GET_CHAR
	tay
	jsr	GET_CHAR
	jsr	SOUND
PRINT_NOTFN	brl	PRINT_LOOP
	
*--- Get a character

GET_CHAR	ldal	$bdbdbd
	and	#$ff
	inc	GET_CHAR+1
	rts

*-------------------------------

COUT	and             #$ff
                cmp             #chrSPC
                beq             COUT0
                cmp	#chrRET
	beq	COUT1
	
	pha		; draw the character
                
                jsr             GOTOXY

	_DrawChar
	
*----------- next X position

COUT0	inc	textX
	lda	textX
	clc		; new
	adc	marginX	; new
	cmp	maxX
	bcc	COUT3
	beq	COUT3

*----------- next Y position
	
COUT1
*	lda	marginX	; a new line
	lda	#DFT_X	; new
	sta	textX

	inc	textY
	lda	textY
	clc		; new
	adc	marginY	; new
	cmp	maxY
	bcc	COUT3
	beq	COUT3

*----------- upper left position

COUT2
*	lda	marginY
	lda	#DFT_Y	; new
	sta	textY

*----------- update cursor location

COUT3	lda	theSTREAM
	asl
	asl
	asl
	asl
	tay
	lda	textX
	sta	tblWINDOW+8,y
	lda	textY
	sta	tblWINDOW+10,y
	rts

*-------------------------------

firstTILE	=	143
secondTILE	=	firstTILE+1

COUT144	pha

*	lda	#0
*	jsr	LOCATE
*	
*	PushWord #$0800
*	PushWord #32768		; Western.8
*	PushWord #0
*	_InstallFont
*
*	jsr	setSTREAMXY	; set the XY SHR coordinates
*	jsr	setSTREAMPAPER	; set the background color
*	jsr	setSTREAMPEN	; set the foreground color
*
*	pla
*	clc
*	adc	#144
*	brl	COUT
	
	txa
	asl
	tax
	lda	tblX,x
	sta	iconToDestPoint+2
	
	tya
	asl
	tay
	lda	tblY,y
	sta	iconToDestPoint

	pla
	clc
	adc	#secondTILE

COUT160	sec
	sbc	#firstTILE
	asl
	asl
	asl
	sta	iconToSourceRect
	clc
	adc	#8
	sta	iconToSourceRect+4

	PushLong #iconParamPtr
	_PaintPixels
	
	rts

*-------------------------------
* VARIABLES
*-------------------------------

*--- Default strings

strCR	asc	0d00

*--- Amstrad

theSTREAM       ds              2
theBORDER	ds	2
theINKINDEX	ds	2
theINKVALUE	ds	2
theMODE	ds	2
thePAPER	ds	2
thePEN	ds	2

tblINK	ds	MAXINK*2	; 0..15
iigsINK	ds	MAXINK*2	; corresponding index color

*--- nb chars, nb lines, nb colors, screen width, screen height
*--- IIgs screen width, IIgs mode, char x-increment, char y-increment

tblMODE	da	tblMODE0,tblMODE1,tblMODE2

tblMODE0	dw	20,25,16,screen160,200	; 160
	dw	screen320,mode320,16,8
tblMODE1	dw	40,25,16,screen320,200	; 320
	dw	screen320,mode320,8,8
tblMODE2	dw	80,25,16,screen640,200	; 640
	dw	screen640,mode640,8,8

*--- 

tblX	ds	2*128	; up to 128 columns
tblY	ds	2*32	; and 32 rows

tblFULLCOLOR	dw	$0000,$1111,$2222,$3333
	dw	$4444,$5555,$6666,$7777
	dw	$8888,$9999,$AAAA,$BBBB
	dw	$CCCC,$DDDD,$EEEE,$FFFF

*--- Apple IIgs

textX	ds	2
textY	ds	2
marginX         ds              2
marginY         ds              2
shrX	ds	2	; x-pixel cursor location
shrY	ds	2	; y-pixel cursor location
theFULLCOLOR	ds	2	; 16-bit color index for screen cleaning

maxX	ds	2	; 20/40/80
maxY	ds	2	; 25
theCOLORS	ds	2	; 2/4/16
theWIDTH	ds	2	; 160/320/640
theHEIGHT	ds	2	; 200 lines
theIIGSWIDTH	ds	2	; 320/320/640
theIIGSMODE	ds	2	; 320/640
charWIDTH	dw	DFT_CHAR_WIDTH	; column increment in pixels
charHEIGHT	dw	DFT_CHAR_HEIGHT	; line increment in pixels

*---

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

*--- Amstrad fake font 160

iconParamPtr
	adrl	iconToSourceLocInfo
	adrl	iconToDestLocInfo
	adrl	iconToSourceRect
	adrl	iconToDestPoint
	dw	$0000	; mode copy
	ds	4

iconToSourceLocInfo
	dw	$0000	; mode 320
	adrl	char8F	; ptrICON - $8000 on entry, high set after _NewHandle
	dw	4	; was 8
	dw	0,0,136,8	; was 16
	
iconToDestLocInfo
	dw	$0000	; mode 320
	adrl	ptr012000
	dw	160
	dw	0,0,199,319
	
iconToSourceRect
	dw	0,0,8,8	; was 16
iconToDestPoint
	dw	0,0

clsRECT	dw	0,0,200,320

char8F	hex	99999999
	hex	99999999
	hex	99999999
	hex	99999999
	hex	99999999
	hex	99999999
	hex	99999999
	hex	99999999

char90	hex	66666666
	hex	66666666
	hex	66666666
	hex	66699666
	hex	66699666
	hex	66666666
	hex	66666666
	hex	66666666

char91	hex	66699666
	hex	66699666
	hex	66699666
	hex	66699666
	hex	66699666
	hex	66666666
	hex	66666666
	hex	66666666

char92	hex	66666666
	hex	66666666
	hex	66666666
	hex	66699999
	hex	66699999
	hex	66666666
	hex	66666666
	hex	66666666

char93	hex	66699666
	hex	66699666
	hex	66699666
	hex	66699999
	hex	66669999
	hex	66666666
	hex	66666666
	hex	66666666

char94	hex	66666666
	hex	66666666
	hex	66666666
	hex	66699666
	hex	66699666
	hex	66699666
	hex	66699666
	hex	66699666

char95	hex	66699666
	hex	66699666
	hex	66699666
	hex	66699666
	hex	66699666
	hex	66699666
	hex	66699666
	hex	66699666

char96	hex	66666666
	hex	66666666
	hex	66666666
	hex	66669999
	hex	66699999
	hex	66699666
	hex	66699666
	hex	66699666

char97	hex	66699666
	hex	66699666
	hex	66699666
	hex	66699999
	hex	66699999
	hex	66699666
	hex	66699666
	hex	66699666

char98	hex	66666666
	hex	66666666
	hex	66666666
	hex	99999666
	hex	99999666
	hex	66666666
	hex	66666666
	hex	66666666

char99	hex	66699666
	hex	66699666
	hex	66699666
	hex	99999666
	hex	99996666
	hex	66666666
	hex	66666666
	hex	66666666

char9A	hex	66666666
	hex	66666666
	hex	66666666
	hex	99999999
	hex	99999999
	hex	66666666
	hex	66666666
	hex	66666666

char9B	hex	66699666
	hex	66699666
	hex	66699666
	hex	99999999
	hex	99999999
	hex	66666666
	hex	66666666
	hex	66666666

char9C	hex	66666666
	hex	66666666
	hex	66666666
	hex	99996666
	hex	99999666
	hex	66699666
	hex	66699666
	hex	66699666

char9D	hex	66699666
	hex	66699666
	hex	66699666
	hex	99999666
	hex	99999666
	hex	66699666
	hex	66699666
	hex	66699666

char9E	hex	66666666
	hex	66666666
	hex	66666666
	hex	99999999
	hex	99999999
	hex	66699666
	hex	66699666
	hex	66699666

char9F	hex	66699666
	hex	66699666
	hex	66699666
	hex	99999999
	hex	99999999
	hex	66699666
	hex	66699666
	hex	66699666

*--- Amstrad palette

amsPAL320	dw	$0000	;  0 black
	dw	$0008	;  1 blue
	dw	$000F	;  2 bright blue
	dw	$0800	;  3 red
	dw	$0808	;  4 magenta
	dw	$080F	;  5 mauve
	dw	$0F00	;  6 bright red
	dw	$0F08	;  7 purple
	dw	$0F0F	;  8 bright magenta
	dw	$0080	;  9 green
	dw	$0088	; 10 cyan
	dw	$008F	; 11 sky blue
	dw	$0880	; 12 yellow
	dw	$0888	; 13 white
	dw	$088F	; 14 pastel blue
	dw	$0F80	; 15 orange
	dw	$0F88	; 16 pink
	dw	$0F8F	; 17 pastel magenta
	dw	$00F0	; 18 bright green
	dw	$00F8	; 19 sea green
	dw	$00FF	; 20 bright cyan
	dw	$08F0	; 21 lime
	dw	$08F8	; 22 pastel green
	dw	$08FF	; 23 pastel cyan
	dw	$0FF0	; 24 bright yellow
	dw	$0FF8	; 25 pastel yellow
	dw	$0FFF	; 26 bright white

*--- 320 Palette

palette640	dw	$0000,$000F,$00F0,$0FFF,$0000,$000F,$0FF0,$0FFF
	dw	$0000,$0F00,$00F0,$0FFF,$0000,$000F,$0FF0,$0FFF

palette320	dw	$0000	;  0 black
	dw	$0777	;  1 dark gray
	dw	$0841	;  2 brown
	dw	$072C	;  3 purple
	dw	$000F	;  4 blue
	dw	$0080	;  5 dark green
	dw	$0F70	;  6 orange
	dw	$0D00	;  7 red
	dw	$0FA9	;  8 beige
	dw	$0FF0	;  9 yellow
	dw	$00E0	; 10 green
	dw	$04DF	; 11 light blue
	dw	$0DAF	; 12 lilac
	dw	$078F	; 13 periwinkle blue
	dw	$0CCC	; 14 light gray
	dw	$0FFF	; 15 white

*--- Pattern

thePATTERN	ds	32

blackPATTERN	ds	32,$00
	ds	32,$11
brownPATTERN	ds	32,$22
	ds	32,$33
bluePATTERN	ds	32,$44
	ds	32,$55
orangePATTERN	ds	32,$66
redPATTERN	ds	32,$77
	ds	32,$88
yellowPATTERN	ds	32,$99
	ds	32,$aa
cyanPATTERN	ds	32,$bb
	ds	32,$cc
periPATTERN	ds	32,$dd
	ds	32,$ee
whitePATTERN	ds	32,$ff

*--- Border table

tblBORDER	dw	0	;'Black' color message number
	dw	2	;'Deep Red' color message number
	dw	7	;'Dark Blue' color message number
	dw	1	;'Purple' color message number
	dw	3	;'Dark Green' color message number
	dw	3	;'Dark Gray' color message number
	dw	1	;'Medium Blue' color message number
	dw	3	;'Light Blue' color message number
	dw	8	;'Brown' color message number
	dw	4	;'Orange' color message number
	dw	8	;'Light Gray' color message number
	dw	6	;'Pink' color message number
	dw	1	;'Light Green' color message number3
	dw	5	;'Yellow' color message number
	dw	6	;'Aquamarine' color message number
	dw	9	;'White' color message number
	dw	11
	dw	11
	dw	12
	dw	12
	dw	14
	dw	12
	dw	12
	dw	14
	dw	13
	dw	13
	dw	15

*--- Keyboard

lenMAX	ds	2
lenSTRING	ds	2

*--- End of engine

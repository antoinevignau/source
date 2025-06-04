*
* Lode Runner
* (c) 1983, Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

	mx	%00

*----------------------------------- Macros

	use	4/Event.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Qd.Macs
	use	4/Util.Macs

	use	LR.EQUATES

*-----------------------------------
* EQUATES
*-----------------------------------

freqRUNNER	=	2
freqWALL	=	4
freqKEYS	=	1

indexLEVEL	=	1	; 1..2..3..4
indexDEVICE	=	indexLEVEL+4	; 5..6..7
indexSPRITE	=	indexDEVICE+3	; 8..9
indexACTION	=	indexSPRITE+2	; 10..11

indexCUSTOM	=	3

*-----------------------------------
* CODE
*-----------------------------------

initINTRO	sep	#$30
	
*---------- Step 1 - init device table

	lda	#3	; 1: joypad, 2: joystick, 3: keyboard
	sta	tblDEV	; we force keyboard everywhere!
	sta	tblDEV+1
	sta	tblDEV+2

	lda	slot4PLAY
	beq	checkJOY
	lda	#1	
	sta	tblDEV	; we have a 4PLAY

checkJOY	lda	fgJOYSTICK
	beq	okTBL
	lda	#2
	sta	tblDEV+1	; we have a joystick

okTBL	ldx	#0
	lda	tblDEV	; determine if we have more
	clc		; than a keyboard
	adc	tblDEV+1
	adc	tblDEV+2
	cmp	#9	; if <> 9 then yes
	bne	ii_end
	inx		; 1 = only a keyboard
ii_end	stx	arrowDEVICE	; 0 = more than one
	rts		; exit 8-bit
	
	mx	%00
		
*-----------------------------------
* CODE
*-----------------------------------

doINTRO	rep	#$30

	ldx	#768-2
	lda	#0
]lp	stal	$e19d00,x
	dex
	dex
	bpl	]lp
	
	PushLong	ptrMENU
	PushLong	ptrSCREEN
	PushLong	#32768
	_BlockMove

	lda	#0	; show PLAY by default
	sta	theLINE	; force line 0
	jsr	newMODE2
	jsr	arrowDRAW	; draw arrows (if needed)

	lda	#freqRUNNER
	stal	intRUNNER+4
	lda	#freqWALL
	stal	intWALL+4

	jsr	introSETHB
	
*---------- Step 5 - Attend une touche

introLOOP	jsr	getKEY
	cmp	#chrUA
	beq	introLINE
	cmp	#chrDA
	beq	introLINE
	cmp	#chrLA
	beq	introENTRY
	cmp	#chrRA
	beq	introENTRY
	cmp	#chrCTRLZ
	beq	introMUZIK
	cmp	#chrCTRLQ
	beq	introQUIT
	cmp	#chrRET
	bne	introLOOP

	lda	theLINE	; sur PLAY?
	beq	introPLAY	; yes, jump
	cmp	#4	; high scores?
	beq	introSCORE
	cmp	#5	; change keys?
	bne	introLOOP
	beq	introKEYS

introQUIT	jsr	introREMOVEHB	; remove the heart beats, exit in 16-bit
	sec
	rts

introMUZIK	jsr	doMUSIK
	bra	introLOOP
	
introLINE	jsr	changeLINE	; set new line
	jsr	arrowERASE	; erase arrows (if any)
	jsr	arrowDRAW	; draw arrows (if needed)
	jsr	makeLINE	; erase/draw accordingly
	bra	introLOOP
introENTRY	jsr	changeENTRY	; set new row
	bcs	introLOOP
	jsr	makeENTRY	; draw accordingly
	bra	introLOOP

*---------- It's the end!

introPLAY	jsr	introREMOVEHB

*--- On doit recopier la partie de droite

	sep	#$30

	ldx	theDEV	; apply the selected device now
	lda	tblDEV,x
	ldx	#chrP
	cmp	#0
	beq	devFOUND
	ldx	#chrJ
	cmp	#1
	beq	devFOUND
	ldx	#chrK	; default is keyboard
devFOUND	txa
	sta	fgINPUT

	sep	#$30
	lda	theTHEME	; retourne le theme choisi
	clc
	rts		; exit in 8-bit

	mx	%00	; Everything below is 16-bit

*----------------------

introSCORE	jsr	introREMOVEHB
	jsr	setLRPALETTE

	sep	#$30
	lda	#1
	jsr	readSCORE
	jsr	showALLSCORES
	rep	#$30
]lp	jsr	getKEY
	beq	]lp
	jmp	doINTRO

*----------------------

	mx	%00
	
introKEYS	jsr	introREMOVEHB
	jsr	setNATIVE	; return in 8-bit
	rep	#$30

	php
	sei
	PushLong	#intKEYS
	_SetHeartBeat
	plp

	PushLong	ptrKEYS
	PushLong	ptrSCREEN
	PushLong	#32768
	_BlockMove

	jsr	keysSHOW
	jsr	keysENTER
	
	php
	sei
	PushLong	#intKEYS
	_DelHeartBeat
	plp

	PushLong	ptrSCREEN
	PushLong	ptrKEYS
	PushLong	#32768
	_BlockMove

	PushWord	#0
	_ClearScreen
	
	jmp	doINTRO

*--------------
* 3B..44 : 0..9
* 45..5E : A..Z

keysSHOW	sep	#$30
	ldx	#0
]lp	phx
	lda	x1KEYS,x	; set X/Y
	sta	myXKEY2
	lda	y1KEYS,x
	sta	myYKEY2
	lda	theMOVEUP,x
	sta	saveKEYS,x	; save previous keys
	sec
	sbc	#"0"
	tax
	lda	possibleKEYS,x
	jsr	cout2KEY	; exit 8-bit
	plx
	inx
	cpx	#6
	bcc	]lp
	rep	#$30
	
	jmp	draw2YELLOW	; exit by drawing button

*--------------

keysENTER	stz	indexKEYS	; start with first key

keysOUTER	sep	#$30	; set its coordinates
	ldx	indexKEYS	; for the blinking routine
	lda	x1KEYS,x
	sta	myXKEY2
	lda	y1KEYS,x
	sta	myYKEY2
	lda	theMOVEUP,x
	sec
	sbc	#"0"
	tax
	lda	possibleKEYS,x
	sta	bsDATA	; the key to blink
	rep	#$30

keysLOOP	jsr	blinkKEYS	; blink it :-)
	cmp	#$ff	; got a key, prepare next one
	beq	keysOUTER
	cmp	#chrRET	; return?
	beq	keysEXIT
	cmp	#chrLA	; change button
	beq	keysLR
	cmp	#chrRA	; change button
	bne	]lp

*---------

keysLR	lda	keysCOL	; change button
	eor	#1
	sta	keysCOL
	jsr	keysFRAME
	bra	keysLOOP

*--------------

keysEXIT	lda	keysCOL	; are we on cancel?
	beq	keysEXIT5	

*	lda	indexKEYS	; are we done entering
*	cmp	#6	; new keys?
*	bcc	keysOUTER	; yes

	rts

keysEXIT5	sep	#$30	; yes, on cancel
	ldx	#6-1	; so restore old values
]lp	lda	saveKEYS,x
	sta	theMOVEUP,x
	dex
	bpl	]lp
	rep	#$30
keysEXIT9	rts

*--------------

keysFRAME	lda	keysCOL	; erase one frame
	eor	#1
	tax
	lda	x2FRAME,x
	and	#$ff
	sta	xy2FRAME+2
	clc
	adc	#118
	sta	xy2FRAME+6
	
	PushLong	#bluePATTERN
	_SetPenPat
	PushLong	#xy2FRAME
	_FrameRect

* 2. draw the new frame

draw2YELLOW	ldx	keysCOL	; draw the other frame
	lda	x2FRAME,x
	and	#$ff
	sta	xy2FRAME+2
	clc
	adc	#118
	sta	xy2FRAME+6
	
	PushLong	#yellowPATTERN
	_SetPenPat
	PushLong	#xy2FRAME
	_FrameRect
	rts

*--------------

blinkKEYS	lda	#$68
	sta	keysCOUNTER
	sep	#$30
	lda	#sprEMPTY
	jsr	cout2KEY	; output empty
	rep	#$30
]lp	jsr	getKEY
	bne	bk_gotone	; yes
	dec	keysCOUNTER
	bne	]lp

	sep	#$30
	lda	bsDATA	; output key
	jsr	cout2KEY
	rep	#$30
	lda	#$68	; redo the wait
	sta	keysCOUNTER
]lp	jsr	getKEY
	bne	bk_gotone	; yes
	dec	keysCOUNTER
	bne	]lp
	bra	blinkKEYS

bk_gotone	cmp	#chrRET
	beq	bk_exit
	cmp	#chrLA
	beq	bk_exit
	cmp	#chrRA
	beq	bk_exit

	cmp	#"0"	; limit key range
	bcc	blinkKEYS
	cmp	#$e0
	bcs	blinkKEYS

	sep	#$30
	pha
	sec
	sbc	#"0"
	tax
	lda	possibleKEYS,x
	beq	bk_sexit
	jsr	cout2KEY

	ldx	indexKEYS
	pla
	sta	theMOVEUP,x

	rep	#$30
	inc	indexKEYS
	lda	indexKEYS
	cmp	#6
	bcs	bk_finalkey

	lda	#$ff	; got a key, not final
	rts
bk_finalkey	lda	#chrRET	; final key
bk_exit	rts
bk_sexit	pla
	rts

*--- Data

keysCOUNTER	ds	2
indexKEYS	ds	2	; current key to blink (0..5)
saveKEYS	ds	6	; if we press cancel

possibleKEYS	hex	3B3C3D3E3F4041424344000000000000 ; B0
	hex	0045464748494A4B4C4D4E4F50515253 ; C0
	hex	5455565758595A5B5C5D5E0000000000 ; D0


keysCOL	dw	1	; 0 (cancel) or 1 (apply)
xy2FRAME	dw	171,0
	dw	190,0

* CANCEL 31,171 to 148,189
* APPLY 171,171 to 288,189

x2FRAME	dfb	31,171	; length is 118

*--------------

	mx	%11

intKEYS	ds	4
	dw	freqKEYS
	dw	$a55a

	phd
	phb
	phk
	plb

	rep	#$30
	
	lda	myDP
	tcd
	
	lda	#freqKEYS
	sta	intKEYS+4

	sep	#$30

	ldx	currentKEY	; get index
	lda	xKEYS,x	; set X/Y
	sta	myXKEY
	lda	yKEYS,x
	sta	myYKEY

	lda	ptrKEYSL,x	; pointer to anim steps
	sta	Debut
	lda	ptrKEYSH,x
	sta	Debut+1

	ldy	currentKEYS,x	; is value non zero?
	lda	(Debut),y
	bne	intKEY1	; yes, output
	
	stz	currentKEYS,x	; no, reset to zero
	bra	intKEY2	; and loop
	
intKEY1	inc	currentKEYS,x	; next anim step
	jsr	coutKEY	; and draw sprite
	
intKEY2	inc	currentKEY	; next sprite to animate
	lda	currentKEY
	cmp	#6
	bcc	intKEY9
	stz	currentKEY

intKEY9	plb
	pld
	clc
	rtl

*--- draw sprite (a copy of coutHGR1)

	mx	%11
	
coutKEY	sep	#$30
	asl
	sta	ck_patch+1	; myAKEY

	ldy	myYKEY	; take Y
	ldx	myXKEY
	jsr	getXY
	txa
	clc
	adc	xhgr,y
	sta	Arrivee
	lda	yhgr,y
	adc	#0
	sta	Arrivee+1
	lda	ptrSCREEN+2	; HGR1 = ptrSCREEN+2
	sta	Arrivee+2

	rep	#$30

ck_patch	ldx	#0
	lda	tblSPRITES2,x
	sta	Debut

	ldx	#sprHEIGHT

outerKEYOUT	ldy	#0
	sep	#$30

]lp	lda	(Debut),y
	sta	[Arrivee],y
	iny
	cpy	#sprBYTES
	bcc	]lp
	
	rep	#$30

	lda	Arrivee
	clc
	adc	#160
	sta	Arrivee
	
	lda	Debut
	clc
	adc	#sprBYTES
	sta	Debut
	
	dex
	bne	outerKEYOUT
	sep	#$30
	rts

*--- draw sprite (a copy of a copy of coutHGR1)

	mx	%11
	
cout2KEY	sep	#$30
	asl
	sta	c2k_patch+1

	ldy	myYKEY2	; take Y
	ldx	myXKEY2
	jsr	getXY
	txa
	clc
	adc	xhgr,y
	sta	ptrHGR2	; Arrivee2
	lda	yhgr,y
	adc	#0
	sta	ptrHGR2+1
	lda	ptrSCREEN+2	; HGR1 = ptrSCREEN+2
	sta	ptrHGR2+2

	rep	#$30

c2k_patch	ldx	#0	; X for sprite
	lda	tblSPRITES2,x
	sta	ptrHGR1

	ldx	#sprHEIGHT

outer2KEYOUT	ldy	#0
	sep	#$30

]lp	lda	(ptrHGR1),y
	sta	[ptrHGR2],y
	iny
	cpy	#sprBYTES
	bcc	]lp
	
	rep	#$30

	lda	ptrHGR2
	clc
	adc	#160
	sta	ptrHGR2
	
	lda	ptrHGR1
	clc
	adc	#sprBYTES
	sta	ptrHGR1
	
	dex
	bne	outer2KEYOUT
	sep	#$30
	rts

*--- Data for the keys

x1KEYS	dfb	13,13,10,16,08,18
y1KEYS	dfb	07,13,10,10,07,07

*--- Data for the animation

currentKEY	ds	1

xKEYS	dfb	13,13,11,15,09,17
yKEYS	dfb	08,12,10,10,07,07
currentKEYS	hex	00,00,00,00,00,00
ptrKEYSL	dfb	<kUP,<kDOWN,<kLEFT,<kRIGHT,<kDIGLEFT,<kDIGRIGHT
ptrKEYSH	dfb	>kUP,>kDOWN,>kLEFT,>kRIGHT,>kDIGLEFT,>kDIGRIGHT

kUP	hex	0E,12,00
kDOWN	hex	12,0E,00
kLEFT	hex	0B,0C,0D,00
kRIGHT	hex	09,10,11,00
kDIGLEFT	hex	0F,00
kDIGRIGHT	hex	25,00

*--- Data to draw the sprite

myAKEY	ds	2
myXKEY	ds	2
myYKEY	ds	2

myAKEY2	ds	2
myXKEY2	ds	2
myYKEY2	ds	2
theXSCREEN2	ds	2

	mx	%00
	
*----------------------

introSETHB	php
	sei
	
	PushLong	#intRUNNER
	_SetHeartBeat
	PushLong	#intWALL
	_SetHeartBeat

	plp
	rts

*----------------------

introREMOVEHB	php
	sei

	PushLong	#intRUNNER
	_DelHeartBeat
	PushLong	#intWALL
	_DelHeartBeat

	plp

	lda	theLINE	; erase the frame
	sta	oldLINE
	jsr	drawBLUE
	
	PushLong	ptrSCREEN	; the best place
	PushLong	ptrMENU	; to save picture
	PushLong	#32768
	_BlockMove

	PushWord	#0
	_ClearScreen
	rts

*----------------------

getKEY	jsr	checkREPLAY	; restart muzak?

	pha
	PushWord	#%00000000_00001000
	PushLong	#taskREC
	_GetNextEvent
	pla
	beq	getNOKEY

	lda	taskREC	; une touche ?
	cmp	#keyDownEvt
	bne	getNOKEY

	lda	taskMESSAGE
	ora	#%1000_0000	; set bit 7
	and	#maskUPPER	; lowercase support
	rts
getNOKEY	lda	#0
	rts
	
*---------------------- Move up/down

changeLINE	cmp	#chrUA	; haut ou bas ?
	beq	lineMOINS
	cmp	#chrDA
	bne	lineEND	; no

	lda	theLINE	; line++
	sta	oldLINE

	inc	theLINE
	lda	theLINE
	cmp	#6
	bcc	lineEND
	stz	theLINE
	rts

*----------
	
lineMOINS	lda	theLINE	; line--
	sta	oldLINE

	dec	theLINE
	bpl	lineEND
	lda	#5
	sta	theLINE
lineEND	rts

*----------

newMODE	lda	theMODE	; PLAY or EDITOR
	eor	#1
	sta	theMODE
newMODE2	clc
	adc	#indexACTION
	jmp	makeENTRY
	
*----------

newLEVELS	cmp	#chrRA	; gauche ou droite ?
	beq	nlPLUS
	cmp	#chrLA
	beq	nlMOINS
	sec
	rts

nlPLUS	inc	theLVL	; level++
	lda	theLVL
	cmp	#4
	bcc	nlDRAW
	stz	theLVL	; loop from the left

nlDRAW	lda	theLVL	; do not load anything
	cmp	#indexCUSTOM	; if custom is chosen
	beq	nld_skip

	asl
	tax
	lda	tblLVL,x
	jsr	initLEVELS
	jsr	loadLEVELS	; exit in 8-bit
	rep	#$30
	
nld_skip	lda	theLVL
	clc
	adc	#indexLEVEL
	jmp	makeENTRY
	
nlMOINS	dec	theLVL	; level--
	bpl	nlDRAW
	lda	#indexCUSTOM	; loop from the right
	sta	theLVL
	bra	nlDRAW

	mx	%00
	
*---------------------- Change within entry

changeENTRY	ldx	theLINE
	beq	newMODE	; 0 play/edit
	cpx	#1
	beq	newLEVELS	; 1 level selection
	cpx	#2
	beq	newDEVICE
	cpx	#3
	beq	newTHEME
	sec
	rts		; on ne change rien ailleurs

*----------
	
newTHEME	cmp	#chrLA	; gauche ou droite ?
	beq	okTHEME
	cmp	#chrRA
	bne	noTHEME

okTHEME	lda	theTHEME
	eor	#1
	sta	theTHEME
	clc
	adc	#indexSPRITE
	jmp	makeENTRY	; draw the entry
noTHEME	sec
	rts

*----------

newDEVICE	cmp	#chrRA	; gauche ou droite ?
	beq	ndPLUS
	cmp	#chrLA
	beq	ndMOINS	; no
	sec
	rts
	
ndPLUS	inc	theDEV	; device++
	lda	theDEV
	cmp	#3
	bcc	ndp_1
	stz	theDEV	; loop from the left

ndp_1	ldy	theDEV	; keyboard always present
	cpy	#2
	beq	ndDRAW
	lda	tblDEV,y	; does device exist?
	and	#$ff
	cmp	#3
	beq	ndPLUS	; no
	bne	ndDRAW	; yes

ndMOINS	dec	theDEV	; device--
	bpl	ndm_1
	lda	#2	; loop from the right
	sta	theDEV
	bra	ndDRAW	; keyboard always present

ndm_1	ldy	theDEV
	cpy	#2
	beq	ndDRAW
	lda	tblDEV,y	; does device exist?
	and	#$ff
	cmp	#3
	beq	ndMOINS	; no
	
ndDRAW	lda	theDEV
	clc
	adc	#indexDEVICE
	jmp	makeENTRY
	
*-----------------------------------
* LES BLOCS
*-----------------------------------

* bleu ciel  : 11 (B)
* bleu foncé : 12 (C) 
* jaune      : 13 (D)

makeLINE
	
* 1. erase the old frame

	jsr	drawBLUE

* 2. draw the new frame

drawYELLOW	ldx	theLINE
	lda	tblICONDEST,x
	and	#$ff
	inc
	sta	xyFRAME
	clc
	adc	#19
	sta	xyFRAME+4
	
	PushLong	#yellowPATTERN
	_SetPenPat
	PushLong	#xyFRAME
	_FrameRect

	clc
	rts

*----

drawBLUE	ldx	oldLINE
	lda	tblICONDEST,x
	and	#$ff
	inc
	sta	xyFRAME
	clc
	adc	#19
	sta	xyFRAME+4
	
	PushLong	#bluePATTERN
	_SetPenPat
	PushLong	#xyFRAME
	_FrameRect
	rts

*----------

makeENTRY	tax
	lda	tblICONSOURCEY,x	; Y source address
	and	#$ff
	sta	iconToSourceRect
	clc
	adc	#21
	sta	iconToSourceRect+4

	lda	tblICONSOURCEX,x	; X source address
	and	#$ff
	sta	iconToSourceRect+2
	clc
	adc	#120
	sta	iconToSourceRect+6

	ldx	theLINE	; set destination point
	lda	tblICONDEST,x
	and	#$ff
	sta	iconToDestPoint
	
	PushLong #iconParamPtr	; draw the rectangle
	_PaintPixels
	brl	drawYELLOW

*--------------

arrowDRAW	lda	theLINE
	asl
	tax
	cpx	#4	; 2*2 - the device entry?
	bne	ad_1	; no, skip the test

	lda	arrowDEVICE	; only one device?
	bne	ad_exit	; yes, no draw
	
ad_1	lda	arrowXLEFT,x	; something to show?
	beq	ad_exit	; no
	phx
	ldy	#2
	jsr	ae_draw	; draw arrow on the left
	plx
	ldy	#4
	lda	arrowXRIGHT,x	; draw arrow on the right
	jsr	ae_draw
ad_exit	rts

*--------------

arrowERASE	lda	oldLINE
	asl
	tax
	lda	arrowXLEFT,x
	beq	ae_exit
	phx
	ldy	#0
	jsr	ae_draw	; draw empty left arrow
	plx
	ldy	#0
	lda	arrowXRIGHT,x	; draw empty right arrow
	
ae_draw	sta	arrowToDestPoint+2
	lda	arrowYLEFTRIGHT,x
	sta	arrowToDestPoint
	
	lda	arrowYUP,y
	sta	arrowToSourceRect
	clc
	adc	#5
	sta	arrowToSourceRect+4

	PushLong	#arrowParamPtr
	_PaintPixels
ae_exit	rts

*-----------------------------------
* LES ROUTINES D'INTERRUPTION
*-----------------------------------

*--- Déplace les murs sur la gauche

intWALL	ds	4
	dw	freqWALL
	dw	$a55a

	rep	#$30

	lda	#freqWALL
	stal	intWALL+4

	ldal	$e19e02
	pha
	ldal	$e19e02+4
	stal	$e19e00+2
	ldal	$e19e02+6
	stal	$e19e00+4
	ldal	$e19e02+8
	stal	$e19e00+6
	ldal	$e19e02+10
	stal	$e19e00+8
	ldal	$e19e02+12
	stal	$e19e00+10
	ldal	$e19e02+14
	stal	$e19e00+12
	ldal	$e19e02+16
	stal	$e19e00+14
	pla
	stal	$e19e02+16

	sep	#$30
	clc
	rtl
	
*--- Déplace Lode Runner

	mx	%00
	
intRUNNER	ds	4
	dw	freqRUNNER
	dw	$a55a

	phb
	phk
	plb
	rep	#$30

	lda	#freqRUNNER
	sta	intRUNNER+4
	
]lp	ldx	iANIM
	lda	tblANIM,x
	and	#$ff
	cmp	#$ff
	bne	showSPRITE
	
	lda	#32
	sta	iANIM
	bra	]lp

showSPRITE	asl
	tax
	ldy	tblRUNNER,x
	ldx	xPOS
]lp	lda	|$0000,y
	stal	$e12000,x
	lda	|$0002,y
	stal	$e12002,x
	lda	|$0004,y
	stal	$e12004,x
	lda	|$0006,y
	stal	$e12006,x
	lda	|$0008,y
	stal	$e12008,x
	lda	|$000A,y
	stal	$e1200A,x
	lda	|$000C,y
	stal	$e1200C,x
	lda	|$000E,y
	stal	$e1200E,x
	lda	|$0010,y
	stal	$e12010,x
	lda	|$0012,y
	stal	$e12012,x
	lda	|$0014,y
	stal	$e12014,x
	lda	|$0016,y
	stal	$e12016,x
	lda	|$0018,y
	stal	$e12018,x
	lda	|$001A,y
	stal	$e1201A,x
	lda	|$001C,y
	stal	$e1201C,x
	lda	|$001E,y
	stal	$e1201E,x

	tya
	clc
	adc	#32
	tay

	txa
	clc
	adc	#160
	tax
	cpx	#114*160	; max 54 lignes below = 60 + 54
	bcs	endSPRITE
	brl	]lp

*---

endSPRITE	inc	iANIM

	lda	iANIM	; move x-pos every 2 steps
	cmp	#32	; to make it run
	bcs	exitSPRITE
	inc	xPOS
	
exitSPRITE	sep	#$30
	plb
	clc
	rtl

	mx	%00
	
*-----------------------------------
* DATA
*-----------------------------------

xPOS	dw	$2580	; position sur l'écran SHR
iANIM	dw	0	; index dans tblANIM

*		                    1                   2                   3                   4
*		0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9
tblANIM
*	dfb	1,2,2,3,3,4,5,6,6,2,7,7,4,4,5,8,8,2,2,7,3,3,5,5,8,6,6,7,7,4,4,8
	dfb	1,2,7,3,3,4,5,5,8,6,6,2,7,7,3,4,4,5,8,8,6,2,2,7,3,3,4,5,5,8,6,6
	dfb	2,7,7,3,4,4,5,8,8,6,2,2,7,3,3,4,5,5,8,6,6
	dfb	-1

tblRUNNER	da	$0000
	da	sprRUNNER1
	da	sprRUNNER2
	da	sprRUNNER3
	da	sprRUNNER4
	da	sprRUNNER5
	da	sprRUNNER6
	da	sprRUNNER7
	da	sprRUNNER8
	
*--- Data

bluePATTERN	ds	32,$cc
yellowPATTERN	ds	32,$dd

xyFRAME	dw	0,191
	dw	0,309

*---

iconParamPtr	adrl	iconToSourceLocInfo
	adrl	iconToDestLocInfo
	adrl	iconToSourceRect
	adrl	iconToDestPoint
	dw	$0000	; mode copy
	ds	4

iconToSourceLocInfo
	dw	$0000	; 0 mode 320
	adrl	$8000	; 2 ptrOPTIONS - $8000 on entry
	dw	160	; 6
	dw	0,0,200,320	; 8
	
iconToDestLocInfo
	dw	$0000	; 0 mode 320
	adrl	$012000	; 2
	dw	160	; 6
	dw	0,0,200,320	; 8
	
iconToSourceRect
	dw	50,0,71,120
iconToDestPoint
	dw	50,190

* source: 1 classic / 2 championship / 3 msx / 4 custom
*         5 joystick / 6 keyboard / 7 joypad
*         8 modern / 9 vintage
*         10 play / 11 edit
*   dest: 0:play, 1:classic, 2:joystick, 3:modern, 4:high-scores, 5:keyboard

tblICONSOURCEX
	dfb	-1,0,0,0,190,0,0,0,0,0,190,190
tblICONSOURCEY
	dfb	-1,0,25,50,125,75,100,125,150,175,0,25

tblICONDEST
	dfb	50,75,100,125,150,175

*---

arrowParamPtr	adrl	iconToSourceLocInfo
	adrl	iconToDestLocInfo
	adrl	arrowToSourceRect
	adrl	arrowToDestPoint
	dw	$0000	; mode copy
	ds	4

arrowToSourceRect
	dw	1,140,6,144
arrowToDestPoint
	dw	83,186

arrowYUP	dw	1,7,13	; source Y, X does not vary, Y2 = Y + 6
arrowXLEFT	dw	186,186,186,186,0,0
arrowXRIGHT	dw	310,310,310,310,0,0
arrowYLEFTRIGHT	dw	58,83,108,133,0,0

arrowDEVICE	ds	2	; 0 = more than a keyboard so display the arrows, 1 instead

*--- Petites flèches
*
* left arrow, X = 186
* rigt arrow, X = 310
*
* Pour les Y
*  Classic, Y =  83
* Keyboard, Y = 108
*   Modern, Y = 133


*-----------------------------------
* DATA
*-----------------------------------

tblDEV	ds	3	; 0 if no device connected
			; +0: 1 if joypad
			; +1: 2 if joystick
			; +2: 3 if keyboard

tblLVL	da	pCLASSIC	; 0
	da	pCHAMPIONSHIP	; 1
	da	pMSX	; 2

oldLINE	dw	-1	; la précédente ligne
theLINE	dw	0	; entrée sur laquelle on est
theLVL	dw	0	; les niveaux choisis (0..2)
theDEV	dw	2	; le device choisi (0..2 pour joypad..joystick..keyboard)
theTHEME	dw	0	; le thème choisi (0: modern, 1: vintage)
theMODE	dw	0	; 0: play, 1: editor

*--- End of file

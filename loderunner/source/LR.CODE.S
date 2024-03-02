*
* Lode Runner
* (c) 1983, Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

	mx	%11
	lst	off

*-----------------------------------
* MACRO
*-----------------------------------

@playsound	mac
	lda	#]1
	jsr	playSOUND
	eom

*-----------------------------------
* ENTRY POINT 
*-----------------------------------

theGAME	JSR	checkJOYSTICK

	LDA	#$01	; read score table
	JSR	readSCORE

*--- Show title page
* Data from $0F00 to $1A84

showTITLEPAGE
	JSR	clearHGR1	; display the compressed title page

*	LDA	#<logo-1
*	STA	L6030+1
*	LDA	#>logo-1
*	STA	L6030+2

	LDY	#$00
	STY	theY
	STY	fgDEMO
	STY	intLEVEL
	lda	ptrSCREEN+2
	sta	ptrHGR1+2
	LDA	#>oldHGR1
	STA	hgrPAGE
	STA	activePAGE

*L6023	JSR	setHGRPOINTER
*	LDY	#$00
*L6028	INC	L6030+1
*	BNE	L6030
*	INC	L6030+2
*L6030	LDA	L6028
*	BEQ	L603F	; 00: end of line
*	BPL	L603C	; <128: skip A bytes
*	STA	(ptrHGR1),Y	; >127: output char
*	INY
*	BPL	L6028	; from BPL
*L603C	TAY
*	BPL	L6028	; from BPL
*L603F	INC	theY
*	LDY	theY
*	CPY	#maxHEIGHT	; until line 192
*	BCC	L6023
*	STA	TXTPAGE1
*	STA	HIRES
*	STA	MIXCLR
*	STA	TXTCLR

	jsr	unpackLOGO	; unpack the "SHGR" title screen
	jsr	playINTRO	; play intro sound, return 8-bit
	jsr	moveSOUND	; move all sound effects to the DOCRAM
	JMP	L618E

*---

L6056	LDA	#$00
	STA	theSCORE
	STA	theSCORE+1
	STA	theSCORE+2
	STA	theSCORE+3
	STA	foeINTIDX	; l'intelligence des ennemis peut-être ?
	STA	fgCIRCLE
	STA	tempX6
	STA	demoREPEAT
	lda	#<demoDATA
	sta	ptrDEMO	; demo actions
	LDA	#>demoDATA
	STA	ptrDEMO+1
	LDA	#nbLIVES	; 5 men to start with
	STA	theMEN
	LDA	fgDEMO
	LSR
	BEQ	L6099
	LDA	#$01
	JSR	readSCORE	; load score
	CMP	#$00
	BNE	L6086
	JSR	tellNODATADISK
	JMP	showTITLEPAGE	; start again

L6086
*	LDA	scorebuf+$FF
*	BNE	L6091
*	LDA	CSWL	; this code is useless
*	LDX	CSWH	; if no copy protection remains
*	BNE	L6095
*L6091	LDA	KSWL
*	LDX	KSWH
*L6095	STA	CH
*	STX	CV

L6099	JSR	clearHGRPAGES	; clear HGR pages and draw board
*	STA	TXTPAGE1
	lda	ptrSCREEN+2
	sta	ptrHGR1+2
	lda	#>oldHGR1
	sta	hgrPAGE
L609F	LDX	#modeGAME
	JSR	prepareLEVEL
	LDA	#$00
	STA	theKEY1
	STA	theKEY2
	LDA	fgDEMO	; are we in demo mode?
	LSR
	BEQ	L60BF	; yes
*	JSR	waitKEYUP
	LDA	boardX
	STA	theX
	LDA	boardY
	STA	theY
	LDA	#sprHERO
	JSR	blinkSPRITE
L60BF	LDX	#$00
	STX	fgHOLE
	STX	idxNOTE
	LDA	foeINTIDX
	CLC
	ADC	nbFOE
	TAY
	LDX	L6214,Y
	LDA	L6CA7,X
	STA	hfoePATH1
	LDA	L6CA7+1,X
	STA	hfoePATH2
	LDA	L6CA7+2,X
	STA	hfoePATH3
	LDY	foeINTIDX
	LDA	L621D,Y
	STA	hfoeACTION

L60E4	JSR	handleHERO
	LDA	fgPLAY	; are we dead?
	BEQ	L613F	; yes
	JSR	playMELODY
	LDA	nbCHEST	; remaining chests?
	BNE	L60F5	; yes
	
	@playsound	#isndNOMORECHEST

	JSR	showINVISIBLELADDERS

L60F5	LDA	boardY	; are we on top row
	BNE	L6107
	LDA	heroSTEPY	; are we going up?
	CMP	#$02
	BNE	L6107
	LDA	nbCHEST	; are there chests left?
	BEQ	L611A	; no
	CMP	#$FF
	BEQ	L611A	; no, we won
	
L6107	JSR	checkHOLE	; are there holes active?
	LDA	fgPLAY	; are we dead?
	BEQ	L613F	; yes
	JSR	playMELODY
	JSR	handleFOE	; handle the foes
	LDA	fgPLAY	; am I dead?
	BEQ	L613F	; yes...
	BNE	L60E4	; no, loop
	
L611A	@playsound	#isndYOUWIN

	INC	theLEVEL	; next level, no chests left
	INC	intLEVEL
	INC	theMEN	; man++
	BNE	L6124
	DEC	theMEN	; man--

L6124	LDX	#$0F
	STX	temp1
L6128	LDY	#$01	; ajoute 15 x 100 points
	LDA	#$00
	JSR	printSCORE
	JSR	scoreSOUND
	JSR	scoreSOUND
	JSR	scoreSOUND
	DEC	temp1
	BNE	L6128
L613C	JMP	L609F

L613F	DEC	theMEN	; man--
	JSR	printMEN
	JSR	prepareMELODY
	HEX	02400240035003500460046005700570
	HEX	068006800790079008A008A009B009B0
	HEX	0AC00AC00BD00BD00CE00CE00DF00DF0
	HEX	00

L6178	JSR	playMELODY
	BCS	L6178
	LDA	fgDEMO
	LSR
	BEQ	L61D0
	LDA	theMEN	; man
	BNE	L613C
	JSR	checkHIGHSCORE
	JSR	animGAMEOVER	; we are dead, anim GAME OVER
	BCS	L61F6

*-----------------------------------
* ATTENTE SUR UNE PAGE
*-----------------------------------

*	JSR	waitKEYUP
L618E
	LDX	#32	; valeurs d'attente / 255 avant
	LDY	#32
*	LDA	#$03	; 3
*	STA	theY

L6199	LDA	fgINPUT
	CMP	#chrK
	BEQ	L61A9	; check keyboard
	cmp	#chrP
	beq	L619A
	LDAL	BUTN1	; check joystick
	BMI	L6201
	LDAL	BUTN0
	BMI	L6201
	bpl	L61A9

L619A	jsr	read4PLAY	; check joypad
	bmi	L6201	; button 1 pressed?
	bvs	L6201	; button 2 pressed?

*	LDA	KBD
L61A9	jsr	checkKEY
	BMI	L61F6
	DEX
	BNE	L6199
	DEY
	BNE	L6199
*	DEC	theY
*	BNE	L6199

	LDA	fgDEMO
	BNE	L61DE
	LDX	#$01
	STX	fgDEMO
	STX	theLEVEL
	STX	fgKEYBTN0
	STX	fgGOODSTART
	LDX	fgSOUND
	STX	L61D0+1
	STA	fgSOUND
	JMP	L6056	; et boucle

L61D0	LDA	#$00
	STA	fgSOUND
*	LDA	KBD
	LDX	fgKEYBTN0
	BEQ	L61F6
	JMP	L618E

L61DE	CMP	#$01
	BNE	L61F3
	BEQ	L61E9
L61E4	LDA	#$01
	JSR	readSCORE
L61E9	JSR	showALLSCORES
	LDA	#$02
	STA	fgDEMO
	JMP	L618E
L61F3	JMP	showTITLEPAGE

*-----------------------------------
* GESTION TOUCHE MENU ATTENTE
*-----------------------------------

L61F6
*	STA	KBDSTROBE
	CMP	#chrCTRLE	; Ctrl-E - Editor
	BEQ	L6211
	CMP	#chrRET	; Return
	BEQ	L61E4
	cmp	#chrCTRLQ	; ctrl-Q - quit
	beq	L6212
	cmp	#chrCTRLO	; ctrl-O - open data file
	beq	L6213
	cmp	#chrCTRLV	; ctrl-V - vintage mode
	beq	L2VINTAGE
	cmp	#chrCTRLN	; ctrl-N - native mode
	beq	L2NATIVE

L6201	LDX	#$00
	STX	intLEVEL
	INX
	STX	theLEVEL
	STX	fgGOODSTART
	LDA	#$02	; mode jeu
	STA	fgDEMO
	JMP	L6056	; loop

L6211	JMP	enterEDITOR	; Jump to the Editor
L6212	jmp	meQUIT	; bye for now
L6213	jsr	doLOAD	; load a game file
	bra	L6201
L2VINTAGE	jsr	setVINTAGE
	bra	L6201
L2NATIVE	jsr	setNATIVE
	bra	L6201

*----------

L6214	HEX	000306090C0F121518	; 0..3..6..9..12..15..18..21..24 (index in 6CA7)
L621D	HEX	26262E4447494A4B4C4D4E4F50

*----------

scoreSOUND	LDA	temp1	; son pour le score
	ASL
	ASL
	ASL
	ASL
	LDX	#$06
	JSR	getNOTE
	JMP	playMELODY

*-----------------------------------
* PREPARE LEVEL
*-----------------------------------

prepareLEVEL
	STX	fgLVLMODE	; 0: edit, <>0: game
	LDX	#$FF
	STX	boardX
	INX
	STX	idxLADDERI	; index in table of for hidden ladder
	STX	nbCHEST
	STX	nbFOE
	STX	idxFOE
	STX	idxDIG
	STX	idxLVLDISK
	STX	fgODDEVEN
	STX	theY
	TXA

	LDX	#sizeHOLE-2
L6252	STA	tblHOLET,X
	DEX
	BPL	L6252
	LDX	#sizeFOE-3
L625A	STA	tblFOETEMPO,X
	DEX
	BPL	L625A

	LDA	#$01
	STA	fgPLAY
	JSR	diskLEVEL

	LDY	theY
L6269	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1

	LDA	#$00	; vérifie le contenu
	STA	theX	; du niveau
L627E	LDA	fgODDEVEN	; que des valeurs 0-9
	LSR
	LDY	idxLVLDISK
	LDA	levelDISK,Y
	BCS	L628C
	AND	#$0F
	BPL	L6292
L628C	LSR
	LSR
	LSR
	LSR
	INC	idxLVLDISK
L6292	INC	fgODDEVEN
	LDY	theX
	CMP	#sprHERO+1
	BCC	L629C
	LDA	#sprEMPTY
L629C	STA	(ptrBOARD),Y
	STA	(ptrBBACK),Y
	INC	theX
	LDA	theX
	CMP	#lvlWIDTH
	BCC	L627E
	INC	theY
	LDY	theY
	CPY	#lvlHEIGHT
	BCC	L6269

	JSR	decodeLEVEL
	BCC	L62C3
	LDA	intLEVEL
	BEQ	L62C4
	LDX	#$00
	STX	intLEVEL
	INC	foeINTIDX
	DEX		; mode game
	JMP	prepareLEVEL
L62C3	RTS

L62C4	JMP	showTITLEPAGE

*-----------------------------------
* ENCODE A LEVEL BEFORE SAVING IT
*-----------------------------------

encodeLEVEL
	LDA	#$00
	STA	idxLVLDISK
	STA	fgODDEVEN
	STA	theY
L62CF	LDY	theY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	#$00
	STY	theX
L62DF	LDA	fgODDEVEN
	LSR
	LDA	(ptrBOARD),Y
	BCS	L62EA
	STA	theA
	BPL	L62F7
L62EA	ASL
	ASL
	ASL
	ASL
	ORA	theA
	LDY	idxLVLDISK
	STA	levelDISK,Y
	INC	idxLVLDISK
L62F7	INC	fgODDEVEN
	INC	theX
	LDY	theX
	CPY	#lvlWIDTH
	BCC	L62DF
	INC	theY
	LDA	theY
	CMP	#lvlHEIGHT
	BCC	L62CF
	
	LDA	#$02	; write level
	JMP	diskLEVEL

*-----------------------------------
* LOAD/SAVE LEVEL FROM/TO DISK
*-----------------------------------

diskLEVEL	tax
	
	LDA	fgDEMO	; are we in demo mode?
	LSR
	BEQ	diskDEMO	; yes
	
	cpx	#1
	beq	dlLOAD
	cpx	#2
	bne	dlERR

	rep	#$30	; load a level
	PushLong	#levelDISK
	pea	^ptrLEVELS
	lda	intLEVEL
	and	#$ff
	xba
	clc
	adc	#ptrLEVELS
	pha
	PushLong	#256
	_BlockMove
	sep	#$30

	jsr	saveLEVELS	; save all levels
	clc
	rts

dlLOAD	rep	#$30	; load a level
	pea	^ptrLEVELS
	lda	intLEVEL
	and	#$ff
	xba
	clc
	adc	#ptrLEVELS
	pha
	PushLong	#levelDISK
	PushLong	#256
	_BlockMove
	sep	#$30
	clc
	rts

dlERR	jmp	showTITLEPAGE

*	STA	LB7F4
*	LDA	intLEVEL	; no, use internal level
*	LSR
*	LSR
*	LSR
*	LSR
*	CLC
*	ADC	#$03
*	STA	LB7EC	; track
*	LDA	intLEVEL
*	AND	#$0F
*	STA	LB7ED	; sector
*
*	LDA	#<levelDISK	; buffer
*	STA	LB7F0
*	LDA	#>levelDISK
*	STA	LB7F0+1
*	LDA	#$00
*	STA	LB7EB
*
*diskRWTS	LDY	#<LB7E8
*	LDA	#>LB7E8
*	jsr	callRWTS	; LoGo - JSR $0023 - Souvenir from protection
*	BCC	L6344
*	JMP	showTITLEPAGE
*L6344	RTS

diskDEMO	LDA	theLEVEL	; demo mode uses levels in RAM
	CLC
	ADC	#>L9E00
	STA	ptrHGR1+1
	LDY	#<L9E00
	STY	ptrHGR1
	ldy	#0
L6350	LDA	(ptrHGR1),Y
	STA	levelDISK,Y
	INY
	BNE	L6350
	RTS

*-------------------------------
* READ/WRITE SCORE FILE
*-------------------------------

readSCORE	cmp	#1	; load scores file from disk
	beq	rsLOAD
	cmp	#2	; save scores file to disk
	bne	rsERR
	
	ldx	#0	; copy score file
]lp	lda	scorebuf,x
	stal	ptrSCORES,x
	inx
	bne	]lp

	jsr	saveLEVELS	; and save
	bra	L6381

rsLOAD	ldx	#0	; copy score file
]lp	ldal	ptrSCORES,x	; from levels in RAM
	sta	scorebuf,x
	inx
	bne	]lp
	bra	L6381

*	STA	LB7F4	; command
*	LDA	#$0C
*	STA	LB7EC	; track
*	LDA	#$0F
*	STA	LB7ED	; sector
*	
*	LDA	#<scorebuf	; where to load
*	STA	LB7F0
*	LDA	#>scorebuf
*	STA	LB7F0+1
*	LDA	#$00
*	STA	LB7EB
*	LDY	#<LB7E8	; IOB table
*	LDA	#>LB7E8
*	JSR	callRWTS
*	BCC	L6381

rsERR	JMP	showTITLEPAGE

*--- Check disk (not a LR disk, data disk, master disk)

L6381	LDY	#$0A	; check magic number
	LDA	#$00
	STA	theMASK1
L6387	LDA	scorebuf+$F4,Y	; magic key
	EOR	L63A8,Y
	ORA	theMASK1
	STA	theMASK1
	DEY
	BPL	L6387
	LDA	theMASK1
	BEQ	L639B
	LDA	#$00	; 00 means not a LR disk
	RTS

L639B	LDA	#$01	; 01 master disk
	LDX	scorebuf+$FF
	BNE	L63A4
	LDA	#$FF	; FF means data disk
L63A4	RTS

*-----------------------------------

*callRWTS	JMP	$bd00	; LoGo - ($0036) to be replaced with JMP $BD00

LB7F4	ds	1	; The RWTS command

L63A8	ASC	"LODE RUNNER"

*-----------------------------------
* DECODE A LEVEL
*-----------------------------------

decodeLEVEL	LDY	#lvlHEIGHT-1	
	STY	theY
L63B7	LDA	tblBOARDALLL,Y	; $0800
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y	; $0a00
	STA	ptrBBACK+1
	LDY	#lvlWIDTH-1
	STY	theX
L63CC	LDA	(ptrBOARD),Y
	LDX	fgLVLMODE	; mode edit?
	BEQ	L63EE	; yes
	CMP	#sprLADDERI
	BNE	L63F0
	LDX	idxLADDERI
	CPX	#sizeLI-3
	BCS	L63E8
	INC	idxLADDERI
	INX
	LDA	theY
	STA	tblLADDERIY,X
	TYA
	STA	tblLADDERIX,X
L63E8	LDA	#sprEMPTY	; hide it
	STA	(ptrBOARD),Y
	STA	(ptrBBACK),Y

L63EE	BEQ	L6450	; mode edit

L63F0	CMP	#sprCHEST
	BNE	L63F8
	INC	nbCHEST
	BNE	L6450
L63F8	CMP	#sprFOE
	BNE	L642A

	LDX	nbFOE	; nbFOE
	CPX	#sizeFOE-3	; max
	BCS	L63E8
	INC	nbFOE
	INX
	TYA
	STA	tblFOEX,X
	LDA	theY
	STA	tblFOEY,X
	LDA	#$00
	STA	tblFOEACTION,X
	STA	tblFOEINDEX,X
	LDA	#$02
	STA	tblFOESTEPX,X	; x-step movement
	STA	tblFOESTEPY,X	; y-step movement
	LDA	#sprEMPTY
	STA	(ptrBBACK),Y
	LDA	#sprFOE	; output a foe
	BNE	L6450

L6426	BPL	L63B7
L6428	BPL	L63CC

L642A	CMP	#sprHERO	; if the hero
	BNE	L644A

	LDX	boardX	; -1 on entry
	BPL	L63E8	; we'll never return
	STY	boardX	; save a positive value
	LDX	theY
	STX	boardY
	LDX	#$02
	STX	heroSTEPX	; x-step movement
	STX	heroSTEPY	; y-step movement
	LDX	#$08	; run right
	STX	heroINDEX	; index in sprite table
	LDA	#sprEMPTY	; blank in background
	STA	(ptrBBACK),Y
	LDA	#sprHERO
	BNE	L6450

L644A	CMP	#sprTRAP	; if a trap
	BNE	L6450
	LDA	#sprWALL	; output a wall

L6450	JSR	coutHGR2	; put the char in background

	DEC	theX	; x--
	LDY	theX
	BPL	L6428
	DEC	theY	; y--
	LDY	theY
	BPL	L6426
	LDA	fgLVLMODE	; mode edit?
	BEQ	L6469	; yes
	LDA	boardX	; we met the hero
	BPL	L648B	; continue to the animation
	SEC		; not ok
	RTS

*--- Level is decoded for the edit mode

L6469
*	LDA	#>oldHGR1	; copy HGR1 > HGR2
*	STA	ptrHGR2+1
*	LDA	#>oldHGR2
*	STA	ptrHGR1+1
*	LDA	#$00
*	STA	ptrHGR2
*	STA	ptrHGR1
*	TAY
*L6478	LDA	(ptrHGR1),Y
*	STA	(ptrHGR2),Y
*	INY
*	BNE	L6478
*	INC	ptrHGR2+1
*	INC	ptrHGR1+1
*	LDX	ptrHGR1+1
*	CPX	#>oldHGR3	; >HGR2+$20 BUG
*	BCC	L6478

	rep	#$30
	PushLong	#HGR2
	PushLong	ptrSCREEN
	PushLong	#hgrTOMOVE
	_BlockMove
	sep	#$30

	CLC		; oookkkkk
	RTS

*--- Level is decoded for the game mode

L648B	JSR	circleANIMATION

	LDY	#lvlHEIGHT-1	; clear HGR2 background
	STY	theY		; for hero and foes
L6492	LDA	tblBOARDALLL,Y	; the background contains all other sprites
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	#lvlWIDTH-1
	STY	theX
L64A0	LDA	(ptrBOARD),Y
	CMP	#sprHERO
	BEQ	L64AA
	CMP	#sprFOE
	BNE	L64AF
L64AA	LDA	#sprEMPTY
	JSR	coutHGR2
L64AF	DEC	theX
	LDY	theX
	BPL	L64A0
	DEC	theY
	LDY	theY
	BPL	L6492
	CLC			; and say OOOKKKKKK
	RTS

*-----------------------------------
* 
*-----------------------------------

handleHERO	LDA	#$01
	STA	fgCHEST
	LDA	fgHOLE	; creuse-t-il un trou ?
	BEQ	L64CD	; non
	BPL	L64CA
	JMP	L67E7	; à gauche
L64CA	JMP	L68AD	; à droite

L64CD	LDY	boardY
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	boardX
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BEQ	L6522
	CMP	#sprBAR
	BNE	L64EB
	LDA	heroSTEPY
	CMP	#$02
	BEQ	L6522
L64EB	LDA	heroSTEPY
	CMP	#$02
	BCC	L6525
	LDY	boardY
	CPY	#lvlHEIGHT-1
	BEQ	L6522
	LDA	tblBOARDALLL+1,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDALLH+1,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	boardX
	LDA	(ptrBOARD),Y
	CMP	#sprEMPTY
	BEQ	L6525
	CMP	#sprFOE
	BEQ	L6522
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L6522
	CMP	#sprWALLI
	BEQ	L6522
	CMP	#sprLADDER
	BNE	L6525
L6522	JMP	L6584

L6525	LDA	#$00	; hero fell in a hole, tell the program
	STA	fgHEROFELL	; to change speed
	JSR	calcSPRITEXY
	JSR	drawSPRITEXY
	
*	@playsound	#isndTOMBE

	LDA	#$07	; index in sprite table: fall in a left hole
	LDX	fgLEFTRIGHT
	BMI	L6537
	LDA	#$0F	; fall in a right hole
L6537	STA	heroINDEX
	JSR	heroNEXTSTEPX
	INC	heroSTEPY
	LDA	heroSTEPY
	CMP	#$05
	BCS	L654A
	JSR	checkCHEST
	JMP	checkCOLLISION

L654A	LDA	#$00
	STA	heroSTEPY
	LDY	boardY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	boardX
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L656B
	LDA	#sprEMPTY
L656B	STA	(ptrBOARD),Y
	INC	boardY
	LDY	boardY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	boardX
	LDA	#sprHERO
	STA	(ptrBOARD),Y
	JMP	checkCOLLISION

L6584	LDA	fgHEROFELL
	BNE	L658F
	LDA	#$64
	LDX	#$08
	JSR	playNOTE
L658F	LDA	#$20
	STA	fgSPEED
	STA	fgHEROFELL
	JSR	getPLAYERINPUT

	LDA	theKEY1
	CMP	#chrI	; move up
	BNE	L65A4
	JSR	checkMOVEUP
	BCS	L65C2
	RTS

L65A4	CMP	#chrK	; move down
	BNE	L65AE
	JSR	checkMOVEDOWN
	BCS	L65C2
	RTS

L65AE	CMP	theDIGLEFT	; dig left
	BNE	L65B8
	JSR	checkDIGLEFT
	BCS	L65C2
	RTS

L65B8	CMP	theDIGRIGHT	; dig right
	BNE	L65C2
	JSR	checkDIGRIGHT
	BCS	L65C2
	RTS

L65C2	LDA	theKEY2
	CMP	#chrJ	; move left
	BNE	L65CB
	JMP	checkMOVELEFT

L65CB	CMP	#chrL	; move right
	BNE	L65D2
	JMP	checkMOVERIGHT
L65D2	RTS

*-----------------------------------
* CHECK IF WE CAN MOVE LEFT 
*-----------------------------------

checkMOVELEFT
	LDY	boardY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1

	LDX	heroSTEPX
	CPX	#$03
	BCS	L6600
	LDY	boardX	; already at column 0
	BEQ	L65FF
	DEY		; what do we have to the left?
	LDA	(ptrBOARD),Y
	CMP	#sprWALLI
	BEQ	L65FF
	CMP	#sprWALL
	BEQ	L65FF
	CMP	#sprTRAP
	BNE	L6600
L65FF	RTS		; we cannot move

L6600	JSR	calcSPRITEXY
	JSR	drawSPRITEXY
	LDA	#$FF
	STA	fgLEFTRIGHT
	JSR	heroNEXTSTEPY
	DEC	heroSTEPX
	BPL	L662A
	LDY	boardX
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L661B
	LDA	#sprEMPTY
L661B	STA	(ptrBOARD),Y
	DEC	boardX
	DEY
	LDA	#sprHERO
	STA	(ptrBOARD),Y
	LDA	#$04
	STA	heroSTEPX
	BNE	L662D
L662A	JSR	checkCHEST
L662D	LDY	boardX	; define sprites
	LDA	(ptrBBACK),Y	; if we are on a bar
	CMP	#sprBAR
	BEQ	L663B
	LDA	#$00	; run left first step
	LDX	#$02	; last step
	BNE	L663F
L663B	LDA	#$03	; bar left first step
	LDX	#$05	; last step
L663F	JSR	setHEROSTEP
	JMP	checkCOLLISION

*-----------------------------------
* CHECK IF WE CAN MOVE RIGHT 
*-----------------------------------

checkMOVERIGHT
	LDY	boardY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDX	heroSTEPX
	CPX	#$02
	BCC	L6674
	LDY	boardX
	CPY	#lvlWIDTH-1
	BEQ	L6673
	INY
	LDA	(ptrBOARD),Y
	CMP	#sprWALLI
	BEQ	L6673
	CMP	#sprWALL
	BEQ	L6673
	CMP	#sprTRAP
	BNE	L6674
L6673	RTS

L6674	JSR	calcSPRITEXY
	JSR	drawSPRITEXY
	LDA	#$01
	STA	fgLEFTRIGHT
	JSR	heroNEXTSTEPY
	INC	heroSTEPX
	LDA	heroSTEPX
	CMP	#$05
	BCC	L66A2
	LDY	boardX
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L6693
	LDA	#sprEMPTY
L6693	STA	(ptrBOARD),Y
	INC	boardX
	INY
	LDA	#sprHERO
	STA	(ptrBOARD),Y
	LDA	#$00
	STA	heroSTEPX
	BEQ	L66A5
L66A2	JSR	checkCHEST
L66A5	LDY	boardX
	LDA	(ptrBBACK),Y
	CMP	#sprBAR
	BEQ	L66B3
	LDA	#$08	; run right step 1
	LDX	#$0A	; run right step 3
	BNE	L66B7
L66B3	LDA	#$0B	; bar right step 1
	LDX	#$0D	; bar right step 3
L66B7	JSR	setHEROSTEP
	JMP	checkCOLLISION

*-----------------------------------
* CAN WE MOVE UP 
*-----------------------------------

checkMOVEUP
	LDY	boardY
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	boardX
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BEQ	L66ED
	LDY	heroSTEPY
	CPY	#$03
	BCC	L66EB
	LDY	boardY
*	LDA	tblBOARDALLL+1,Y
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	boardX
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BEQ	L6711
L66EB	SEC
	RTS

L66ED	LDY	heroSTEPY
	CPY	#$03
	BCS	L6711
	LDY	boardY
	BEQ	L66EB
	LDA	tblBOARDALLL-1,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH-1,Y
	STA	ptrBOARD+1
	LDY	boardX
	LDA	(ptrBOARD),Y
	CMP	#sprWALL
	BEQ	L66EB
	CMP	#sprWALLI
	BEQ	L66EB
	CMP	#sprTRAP
	BEQ	L66EB
L6711	JSR	calcSPRITEXY
	JSR	drawSPRITEXY
	LDY	boardY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	JSR	heroNEXTSTEPX
	DEC	heroSTEPY
	BPL	L6757
	LDY	boardX
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L673B
	LDA	#$00
L673B	STA	(ptrBOARD),Y
	DEC	boardY
	LDY	boardY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	boardX
	LDA	#sprHERO
	STA	(ptrBOARD),Y
	LDA	#$04
	STA	heroSTEPY
	BNE	L675A
L6757	JSR	checkCHEST
L675A	LDA	#$10	; climb ladder step 1
	LDX	#$11	; climb ladder step 2
	JSR	setHEROSTEP
	JSR	checkCOLLISION
	CLC
	RTS

*-----------------------------------
* CHECK IF CAN MOVE DOWN 
*-----------------------------------

checkMOVEDOWN
	LDY	heroSTEPY
	CPY	#$02
	BCC	L678A
	LDY	boardY
	CPY	#lvlHEIGHT-1
	BCS	L6788
	LDA	tblBOARDALLL+1,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH+1,Y
	STA	ptrBOARD+1
	LDY	boardX
	LDA	(ptrBOARD),Y
	CMP	#sprWALLI
	BEQ	L6788
	CMP	#sprWALL
	BNE	L678A
L6788	SEC
	RTS

L678A	JSR	calcSPRITEXY
	JSR	drawSPRITEXY
	LDY	boardY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	JSR	heroNEXTSTEPX
	INC	heroSTEPY
	LDA	heroSTEPY
	CMP	#$05
	BCC	L67D5
	LDY	boardX
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L67B8
	LDA	#$00
L67B8	STA	(ptrBOARD),Y
	INC	boardY
	LDY	boardY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	boardX
	LDA	#sprHERO
	STA	(ptrBOARD),Y
	LDA	#$00
	STA	heroSTEPY
	JMP	L675A
L67D5	JMP	L6757

L67D8	JMP	L6892

*-----------------------------------
* CHECK IF WE CAN DIG LEFT
*-----------------------------------

checkDIGLEFT
	LDA	#$FF
	STA	fgHOLE
	STA	theKEY1
	STA	theKEY2
	LDA	#$00
	STA	idxDIG

L67E7	LDY	boardY	; are we on last line?
	CPY	#lvlHEIGHT-1
	BCS	L67D8
	INY
	JSR	setBOARDLINEPOINTERS
	LDY	boardX	; are we on first column?
	BEQ	L67D8
	DEY
	LDA	(ptrBOARD),Y	; what do we have on our left?
	CMP	#sprWALL	; a wall?
	BNE	L67D8
	LDY	boardY	; yes
	JSR	setBOARDLINEPOINTERS
	LDY	boardX
	DEY
	LDA	(ptrBOARD),Y
	CMP	#sprEMPTY
	BNE	L686E
	JSR	calcSPRITEXY
	JSR	drawSPRITEXY
	JSR	heroNEXTSTEPX
	JSR	heroNEXTSTEPY
	LDY	idxDIG
	bne	nosnddig1
	@playsound	#isndCREUSE
nosnddig1	LDA	digNOTE,Y
	LDX	digDURATION,Y
	JSR	getNOTE
	LDX	idxDIG
	LDA	#$00	; run left
	CPX	#$06
	BCS	L682B
	LDA	#$06	; dig left
L682B	STA	heroINDEX
	JSR	checkCOLLISION
	LDX	idxDIG
	CPX	#$0C
	BEQ	L6898
	CPX	#$00
	BEQ	L684C
	LDA	seqDIGLEFT-1,X	; dig left - 1
	PHA
	LDX	boardX
	DEX
	LDY	boardY
	JSR	getXY
	PLA
	JSR	drawSPRITEXY
	LDX	idxDIG
L684C	LDA	seqDIGLEFT,X	; dig left
	PHA
	LDX	boardX
	DEX
	STX	theX
	LDY	boardY
	STY	theY
	JSR	getXY
	PLA
	JSR	drawSPRXYCOLLISION
	LDX	idxDIG
	LDA	seqDIGSTONE,X	; dig stone
	INC	theY
	JSR	coutHGR1
	INC	idxDIG
	CLC
	RTS

L686E	LDY	boardY
	INY
	STY	theY
	LDY	boardX
	DEY
	STY	theX
	LDA	#sprWALL
	JSR	coutHGR1
	LDX	idxDIG
	BEQ	L6892
	DEX
	LDA	seqDIGLEFT,X
	PHA
	LDY	boardY
	LDX	boardX
	DEX
	JSR	getXY
	PLA
	JSR	drawSPRITEXY
L6892	LDA	#$00
	STA	fgHOLE
	SEC
	RTS

L6898	LDX	boardX
	DEX
	JMP	addNEWHOLE
L689E	JMP	L695C

*-----------------------------------
* CHECK IF WE CAN DIG RIGHT 
*-----------------------------------

checkDIGRIGHT
	LDA	#$01
	STA	fgHOLE
	STA	theKEY1
	STA	theKEY2
	LDA	#$0C
	STA	idxDIG

L68AD	LDY	boardY	; are we on last line?
	CPY	#lvlHEIGHT-1
	BCS	L689E
	INY
	JSR	setBOARDLINEPOINTERS
	LDY	boardX	; are we on lat column?
	CPY	#lvlWIDTH-1
	BCS	L689E
	INY
	LDA	(ptrBOARD),Y
	CMP	#sprWALL	; do we have a wall?
	BNE	L689E
	LDY	boardY
	JSR	setBOARDLINEPOINTERS
	LDY	boardX
	INY
	LDA	(ptrBOARD),Y
	CMP	#sprEMPTY
	BNE	L6936
	JSR	calcSPRITEXY
	JSR	drawSPRITEXY
	JSR	heroNEXTSTEPX
	JSR	heroNEXTSTEPY
	LDY	idxDIG
	cpy	#$0C
	bne	nosnddig2
	@playsound	#isndCREUSE
nosnddig2	LDA	seqDIGSTONE,Y	; dig stone
	LDX	digNOTE2,Y
	JSR	getNOTE
	LDX	idxDIG
	LDA	#$08	; run right
	CPX	#$12
	BCS	L68F3
	LDA	#$0E	; dig right
L68F3	STA	heroINDEX
	JSR	checkCOLLISION
	LDX	idxDIG
	CPX	#$18
	BEQ	L6962
	CPX	#$0C
	BEQ	L6914
	LDA	seqDIGLEFT-1,X
	PHA
	LDX	boardX
	INX
	LDY	boardY
	JSR	getXY
	PLA
	JSR	drawSPRITEXY
	LDX	idxDIG
L6914	LDA	seqDIGLEFT,X
	PHA
	LDX	boardX
	INX
	STX	theX
	LDY	boardY
	STY	theY
	JSR	getXY
	PLA
	JSR	drawSPRXYCOLLISION
	INC	theY
	LDX	idxDIG
	LDA	seqDIGRIGHT,X
	JSR	coutHGR1
	INC	idxDIG
	CLC
	RTS

L6936	LDY	boardY
	INY
	STY	theY
	LDY	boardX
	INY
	STY	theX
	LDA	#$01
	JSR	coutHGR1
	LDX	idxDIG
	CPX	#$0C
	BEQ	L695C
	DEX
	LDA	seqDIGLEFT,X
	PHA
	LDX	boardX
	INX
	LDY	boardY
	JSR	getXY
	PLA
	JSR	drawSPRITEXY

L695C	LDA	#$00
	STA	fgHOLE
	SEC
	RTS

L6962	LDX	boardX	; we're digging
	INX
	JMP	addNEWHOLE

* Enchaînement des sprites

sndLODERUNNER
	db	5	;  0 5 5
	db	0	;  1
	db	0	;  2
	db	2	;  3 5 2
	db	0	;  4
	db	0	;  5
	db	3	;  6 3 3
	db	7	;  7 0 7
	db	5	;  8 5 5
	db	0	;  9
	db	0	;  A
	db	2	;  B 5 2
	db	0	;  C
	db	0	;  D
	db	3	;  E 3 3
	db	7	;  F 0 7
	db	4	; 10 5 4
	db	0	; 11
	
seqLODERUNNER
	DB	$0B	;  0 court à gauche
	DB	$0C	;  1 
	DB	$0D	;  2 
	DB	$18	;  3 barre à gauche
	DB	$19	;  4 
	DB	$1A	;  5 
	DB	$0F	;  6 creuse à gauche
	DB	$13	;  7 tombe dans un trou à gauche
	DB	$09	;  8 court à droite
	DB	$10	;  9 LR court vers la droite step 1
	DB	$11	;  A LR court vers la droite step 2
	DB	$15	;  B LR est sur la barre vers la droite step 1
	DB	$16	;  C LR est sur la barre vers la droite step 2
	DB	$17	;  D LR est sur la barre vers la droite step 3
	DB	$25	;  E creuse à droite
	DB	$14	;  F tombe dans un trou à droite
	DB	$0E	; 10 monte échelle step 1
	DB	$12	; 11 monte échelle step 2
seqDIGLEFT	DB	$1B	; 12 creuse 1
	DB	$1B	; 13 creuse 1
	DB	$1C	; 14 creuse 2
	DB	$1C	; 15 creuse 2
	DB	$1D	; 16 creuse 3
	DB	$1D	; 17 creuse 3
	DB	$1E	; 18 creuse 4
	DB	$1E	; 19 creuse 4
	DB	$00	; 1A 
	DB	$00	; 1B 
	DB	$00	; 1C 
	DB	$00	; 1D 
seqDIGRIGHT	DB	$26	; 1E creuse droite step 1
	DB	$26	; 1F creuse droite step 1
	DB	$27	; 20 creuse droite step 2
	DB	$27	; 21 creuse droite step 2
	DB	$1D	; 22 creuse droite step 3
	DB	$1D	; 23 creuse droite step 3
	DB	$1E	; 24 creuse droite step 4
	DB	$1E	; 25 creuse droite step 4
	DB	$00	; 26 
	DB	$00	; 27 
	DB	$00	; 28 
	DB	$00	; 29 
seqDIGSTONE	DB	$1F	; 2A dig stone sequence
	DB	$1F	; 2B 
	DB	$20	; 2C 
	DB	$20	; 2D 
	DB	$21	; 2E 
	DB	$21	; 2F 
	DB	$22	; 30
	DB	$22	; 31
	DB	$23	; 32
	DB	$23	; 33
	DB	$24	; 34
	DB	$24	; 35

*--- Sound data

digNOTE	DB	$20	; musical notes when we dig
digNOTE2	DB	$20	; 
	DB	$20	; 
	DB	$20	; 
	DB	$20	; 
	DB	$20	; 
	DB	$20	; 
	DB	$20	; 
	DB	$24	; 
	DB	$24	; 
	DB	$24	; 
	DB	$24	; 
	DB	$24	; 
digDURATION	DB	$04	; duration
	DB	$04	; 
	DB	$04	; 
	DB	$04	; 
	DB	$04	; 
	DB	$04	; 
	DB	$04	; 
	DB	$04	; 
	DB	$03	; 
	DB	$03	; 
	DB	$02	; 
	DB	$02	; 
	DB	$01	; 

*-----------------------------------
* DEMO MODE ENGINE ENTRY POINT
*-----------------------------------

L69B7	jsr	read4PLAY
	bmi	L69CD	; button 1 pressed?
	bvs	L69CD	; button 2 pressed?

L69B8	jsr	checkKEY
*	LDA	KBD
	BMI	L69CD
	LDA	fgINPUT
	CMP	#chrK	; keyboard?
	BEQ	L69D6
	cmp	#chrP	; joypad?
	beq	L69B7
	LDAL	BUTN1	; then joystick
	BMI	L69CD
	LDAL	BUTN0
	BPL	L69D6

*	STA	KBDSTROBE

L69CD	LSR	fgKEYBTN0	; key/button pressed
	LSR	fgPLAY
	LDA	#$01
	STA	theMEN	; one man
	RTS

L69D6	LDA	demoREPEAT	; are we currently handling a movement?
	BNE	L69F2	; yes
	LDY	#$00	; no, get values
	LDA	(ptrDEMO),Y	; the keys
	STA	demoKEY
	INY
	LDA	(ptrDEMO),Y
	STA	demoREPEAT	; the repeat
	LDA	ptrDEMO	; next entry
	CLC
	ADC	#$02
	STA	ptrDEMO
	LDA	ptrDEMO+1
	ADC	#$00
	STA	ptrDEMO+1
L69F2	LDA	demoKEY	; first entry is the fisrt key
	AND	#$0F
	TAX
	LDA	tblDEMO2KEY,X
	STA	theKEY1
	LDA	demoKEY
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA	tblDEMO2KEY,X
	STA	theKEY2	; second key
	DEC	demoREPEAT
	RTS

*                        0123456
tblDEMO2KEY	ASC	"IJKLOU "

*-----------------------------------
* GAME ENGINE ENTRY POINT
*-----------------------------------

getPLAYERINPUT
	LDA	fgDEMO
	CMP	#$01
	BEQ	L69B8
	jsr	checkKEY
*	LDAL	KBD
*	stal	KBDSTROBE
	STA	theA
	BMI	L6A2B
	LDA	fgINPUT
	CMP	#chrK
	BEQ	L6A55
	cmp	#chrP
	beq	L6A29
L6A28	JMP	getJOYSTICKKEY
L6A29	jmp	getJOYPADKEY

L6A2B	CMP	#chrSPC	; check control keys
	BCS	L6A49	; that is a game key
*	STA	theA
	LDY	#$FF	; that's a control key
L6A33	INY
	LDA	tblKEY,Y
	BEQ	L6A49
	CMP	theA
	BNE	L6A33
	TYA
	ASL
	TAY
	LDA	tblKEYADR+1,Y
	PHA
	LDA	tblKEYADR,Y
	PHA
	RTS

* C1..DA 1100_0001 1101_1010
* E1..FA 1110_0001 1111_1010

L6A49	LDA	fgINPUT	; joystick?
	CMP	#chrJ
	BEQ	L6A28
	cmp	#chrP	; joypad?
	beq	L6A29
	
*	LDX	theA	; no
*	STX	theKEY1
*	STX	theKEY2
	lda	theA	; support des minuscules
	and	#maskUPPER
	sta	theA
	sta	theKEY1
	sta	theKEY2
L6A55	RTS

	
*-------------------------------
* 9E - CTRL-^ - NEXT LEVEL
*-------------------------------

doNEXTLEVEL
	INC	theMEN	; man++
	INC	theLEVEL
	INC	intLEVEL
	LSR	fgPLAY
	LSR	fgGOODSTART
	RTS

*-------------------------------
* 80 - CTRL-@ - EXTRA MAN
*-------------------------------

doEXTRAMAN
	INC	theMEN	; man++
	BNE	L6A67
	DEC	theMEN	; man--
L6A67	JSR	printMEN
	LSR	fgGOODSTART
	JMP	getPLAYERINPUT

*-------------------------------
* 9B - ESC - PAUSE GAME
*-------------------------------

doPAUSE	JSR	checkKEY	; waitKEYDOWN
	CMP	#$9B
	BNE	doPAUSE
	JMP	getPLAYERINPUT

*-------------------------------
* 92 - CTRL-R - TERMINATES CURRENT GAME
*-------------------------------

doTERMINATE	LDA	#$01
	STA	theMEN	; man

*-------------------------------
* 81 - CTRL-A - ABORTS MAN
*-------------------------------

doABORTMAN	LSR	fgPLAY
	RTS

*-------------------------------
* 93 - CTRL-S - TOGGLES SOUND
*-------------------------------

doTOGGLESOUND
	LDA	fgSOUND
	EOR	#$FF
	STA	fgSOUND
	JMP	getPLAYERINPUT

*-------------------------------
* 8A - CTRL-J - SET JOYSTICK MODE
*-------------------------------

doSETJOYSTICK
	LDA	#chrJ
	STA	fgINPUT
	JMP	getPLAYERINPUT

*-------------------------------
* 8B - CTRL-K - SET KEYBOARD MODE
*-------------------------------

doSETKEYBOARD
	LDA	#chrK
	STA	fgINPUT
	JMP	getPLAYERINPUT

*-------------------------------
* 90 - CTRL-P - SET JOYPAD MODE
*-------------------------------

doSETJOYPAD
	lda	slot4PLAY
	beq	nojoypad
	LDA	#chrP
	STA	fgINPUT
nojoypad	JMP	getPLAYERINPUT

*-------------------------------
* 82 - CTRL-B - FLIPS BUTTONS
*-------------------------------

doFLIPB	LDA	theDIGLEFT
	LDX	theDIGRIGHT
	STA	theDIGRIGHT
	STX	theDIGLEFT
	JMP	getPLAYERINPUT

*-------------------------------
* 98 - CTRL-X - FLIPS X-AXIS
*-------------------------------

doFLIPX	LDA	joyXMIN
	LDX	joyXMAX
	STA	joyXMAX
	STX	joyXMIN
	JMP	getPLAYERINPUT

*-------------------------------
* 99 - CTRL-Y - FLIPS Y-AXIS
*-------------------------------

doFLIPY	LDA	joyYMIN
	LDX	joyYMAX
	STA	joyYMAX
	STX	joyYMIN
	JMP	getPLAYERINPUT

*-------------------------------
* 88 - LEFT ARROW - SLOWS DOWN
*-------------------------------

doSLOWDOWN	LDA	theSPEED
	BEQ	L6ACD
	DEC	theSPEED
	JMP	getPLAYERINPUT

*-------------------------------
* 95 - RIGHT ARROW - SPEEDS UP
*-------------------------------

doSPEEDUP	LDA	theSPEED
	CMP	#$1f	; on ajoute 16 valeurs de tempo
	BEQ	L6ACD
	INC	theSPEED
L6ACD	JMP	getPLAYERINPUT

*-------------------------------
* GET JOYPAD KEY
*-------------------------------

getJOYPADKEY
	jsr	read4PLAY	; button 0: dig left
	bpl	getJOYK1	; button 1: dig right
	ldx	theDIGLEFT
	bne	getJOYK2
getJOYK1	bvc	getJOYK3
	ldx	theDIGRIGHT
getJOYK2	stx	theKEY1
	stx	theKEY2
	rts
getJOYK3	jsr	readJOYPAD	; set X/Y
	bra	L6AE8	; and move on

*-------------------------------
* GET JOYSTICK KEY
*-------------------------------

getJOYSTICKKEY
	LDAL	BUTN1
	BPL	L6AD9
	LDA	theDIGLEFT	; dig left
	BNE	L6AE0
L6AD9	LDAL	BUTN0
	BPL	L6AE5
	LDA	theDIGRIGHT	; dig right
L6AE0	STA	theKEY1
	STA	theKEY2
	RTS

L6AE5	JSR	readJOYSTICK ; no keys pressed

L6AE8	LDY	theJOYX	; read joystick
	LDA	joyXMAX	; clamp
	CMP	#ctrJOY	; return key
	BEQ	L6AFA
	CPY	joyXMAX
	BCS	L6B03
	LDA	#chrL
	BNE	L6B1E
L6AFA	CPY	joyXMAX
	BCC	L6B03
	LDA	#chrL
	BNE	L6B1E
L6B03	LDA	joyXMIN
	CMP	#ctrJOY
	BEQ	L6B13
	CPY	joyXMIN
	BCS	L6B1C
	LDA	#chrJ
	BNE	L6B1E
L6B13	CPY	joyXMIN
	BCC	L6B1C
	LDA	#chrJ
	BNE	L6B1E
L6B1C	LDA	#chrA-1
L6B1E	STA	theKEY2
	LDY	theJOYY
	LDA	joyYMIN
	CMP	#ctrJOY
	BEQ	L6B32
	CPY	joyYMIN
	BCS	L6B3B
	LDA	#chrI
	BNE	L6B56
L6B32	CPY	joyYMIN
	BCC	L6B3B
	LDA	#chrI
	BNE	L6B56
L6B3B	LDA	joyYMAX
	CMP	#ctrJOY
	BEQ	L6B4B
	CPY	joyYMAX
	BCS	L6B54
	LDA	#chrK
	BNE	L6B56
L6B4B	CPY	joyYMAX
	BCC	L6B54
	LDA	#chrK
	BNE	L6B56
L6B54	LDA	#chrA-1
L6B56	STA	theKEY1
	RTS

*----------------------------------
* KEYS AND ASSOCIATED JUMPS
*----------------------------------

tblKEY	HEX	9E,80,9B,92,81,93,8A,8B,90,88,95,98,99,82,8D,00

tblKEYADR	DA	doNEXTLEVEL-1	; 9E - CTRL-^
	DA	doEXTRAMAN-1	; 80 - CTRL-@
	DA	doPAUSE-1		; 9B - ESCAPE
	DA	doTERMINATE-1	; 92 - CTRL-R
	DA	doABORTMAN-1	; 81 - CTRL-A
	DA	doTOGGLESOUND-1	; 93 - CTRL-S
	DA	doSETJOYSTICK-1	; 8A - CTRL-J
	DA	doSETKEYBOARD-1	; 8B - CTRL-K
	DA	doSETJOYPAD-1	; 90 - CTRL-P
	DA	doSPEEDUP-1		; 88 - SPEED UP
	DA	doSLOWDOWN-1	; 95 - SLOW DOWN
	DA	doFLIPX-1		; 98 - CTRL-X
	DA	doFLIPY-1		; 99 - CTRL-Y
	da	doFLIPB-1		; 82 - CTRL-B
	DA	displayHIGHSCORES-1	; 8D - RETURN

joyXMIN	DB	minJOY	; x-low
joyXMAX	DB	ctrJOY	; x-high
joyYMIN	DB	minJOY	; y-low
joyYMAX	DB	ctrJOY	; y-high

theDIGLEFT	dfb	chrU
theDIGRIGHT	dfb	chrO

*-----------------------------------
* CALC SPRITE X/Y
*-----------------------------------

calcSPRITEXY
	LDX	boardX	; calc next HGR X position
	LDY	heroSTEPX
	JSR	calcHGRX
	STX	theA	; save it

	LDY	boardY	; calc next HGR Y position
	LDX	heroSTEPY
	JSR	calcHGRY	; we keep it in Y

	LDX	heroINDEX	; get sprite index

	cpx	#$12	; joue un son dans quelques cas
	bcs	calcSPRITE1
	lda	sndLODERUNNER,x
	beq	calcSPRITE1
	jsr	playSOUND

calcSPRITE1	LDA	seqLODERUNNER,X
	LDX	theA
	RTS

*-----------------------------------
* CHECK CHEST
*-----------------------------------
* Check if we are on a chest
* If so, add 250 to the score

checkCHEST	LDA	heroSTEPX	; is sprite still in X
	CMP	#$02
	BNE	L6BF3
	LDA	heroSTEPY	; is sprite still in Y
	CMP	#$02
	BNE	L6BF3

	LDY	boardY	; yes
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1

	LDY	boardX	; are we on a chest?
	LDA	(ptrBBACK),Y
	CMP	#sprCHEST
	BNE	L6BF3

	LSR	fgCHEST	; collision avec un coffre
	DEC	nbCHEST	; chest--

	@playsound	#isndTRESOR

	LDY	boardY	; remove it from background
	STY	theY
	LDY	boardX
	STY	theX
	LDA	#sprEMPTY
	STA	(ptrBBACK),Y
	JSR	coutHGR2

	LDY	theY	; draw it on screen
	LDX	theX
	JSR	getXY
	LDA	#sprCHEST
	JSR	drawSPRITEXY
	LDY	#$02	; add 250 to score
	LDA	#$50
	JSR	printSCORE
	JSR	prepareMELODY	; and beep it
	HEX	07450655054404540343025300
L6BF3	RTS

*-----------------------------------
* STEP HERO STEP
*-----------------------------------

setHEROSTEP	INC	heroINDEX	; A is the first step
	CMP	heroINDEX	; X the last
	BCC	L6BFD	; sets the step accordingly
L6BFA	STA	heroINDEX
	RTS
L6BFD	CPX	heroINDEX
	BCC	L6BFA
	RTS

*-----------------------------------
* CHECK COLLISION
*-----------------------------------

checkCOLLISION
	JSR	calcSPRITEXY
	JSR	drawSPRXYCOLLISION
	LDA	fgCOLLISION	; les sprites sont-ils entrés en collision ?
	BEQ	L6C12	; non
	LDA	fgCHEST	; en collision avec un coffre ?
	BEQ	L6C12	; oui, on ne perd pas
	LSR	fgPLAY	; non, perdu
L6C12	RTS

*-----------------------------------
* SET HERO NEXT STEP X
*-----------------------------------

heroNEXTSTEPX
	LDA	heroSTEPX
	CMP	#$02
	BCC	L6C20
	BEQ	L6C25
	DEC	heroSTEPX
	JMP	checkCHEST
L6C20	INC	heroSTEPX
	JMP	checkCHEST
L6C25	RTS

*-----------------------------------
* SET HERO NEXT STEP Y
*-----------------------------------

heroNEXTSTEPY
	LDA	heroSTEPY
	CMP	#$02
	BCC	L6C33
	BEQ	L6C38
	DEC	heroSTEPY
	JMP	checkCHEST
L6C33	INC	heroSTEPY
	JMP	checkCHEST
L6C38	RTS

*-----------------------------------
* ADD A NEW HOLE
*-----------------------------------

addNEWHOLE	LDA	#$00	; tell we're digging
	STA	fgHOLE
	LDY	boardY
	INY
	STX	theX
	STY	theY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	#sprEMPTY	; make the hole visible
	LDY	theX
	STA	(ptrBOARD),Y
	JSR	coutHGR1
	LDA	#sprEMPTY
	JSR	coutHGR2
	DEC	theY
	LDA	#sprEMPTY
	JSR	coutHGR1
	INC	theY
	LDX	#$FF	; add the hole to the list
L6C67	INX
	CPX	#sizeHOLE-2
	BEQ	L6C81
	LDA	tblHOLET,X	; <>0 tempo means there is a hole
	BNE	L6C67
	LDA	theY
	STA	tblHOLEY,X
	LDA	theX
	STA	tblHOLEX,X
	LDA	#$B4	; its tempo
	STA	tblHOLET,X
	SEC
L6C81	RTS

*-----------------------------------
* HANDLE EACH FOE ACTION
*-----------------------------------

handleFOE	LDX	nbFOE	; no foe, skip
	BEQ	L6CA6
	INC	hfoeIDX
	ldx	hfoeIDX	; was Y, is now X
	cpx	#$03
	BCC	L6C92
	ldx	#$00
	stx	hfoeIDX
L6C92	lda	hfoePATH1,x
	STA	hfoePATH
L6C97	LSR	hfoePATH
	BCC	L6CA2
	JSR	doFOEACTION
	LDA	fgPLAY
	BEQ	L6CA6
L6CA2	LDA	hfoePATH
	BNE	L6C97
L6CA6	RTS

*-----------------------------------
* THE PATHS TO TAKE
*-----------------------------------

L6CA7	HEX	000000
	HEX	000101
	HEX	010101
	HEX	010301
	HEX	010303
	HEX	030303
	HEX	030307
	HEX	030707
	HEX	070707
	HEX	07070F
	HEX	070F0F
	HEX	0F0F0F

seqFOE	DB	$08	; 0 - foe runs left 1
	DB	$2B	; 1 - ...left 2
	DB	$2C	; 2 - ...left 3
	DB	$30	; 3 - foe bar left 1
	DB	$31	; 4 - ... left 2
	DB	$32	; 5 - ... left 3
	DB	$36	; 6 - foe falls left
	DB	$28	; 7 - foe runs right 1
	DB	$29	; 8 - ... right 2
	DB	$2A	; 9 - ... right 3
	DB	$2D	; A - foe bar right 1
	DB	$2E	; B - ... right 2
	DB	$2F	; C - ... right 3
	DB	$35	; D - foe falls right
	DB	$33	; E - foe ladder 1
	DB	$34	; F - ... ladder 2

*-----------------------------------
* 
*-----------------------------------

doFOEACTION	INC	idxFOE
	LDX	nbFOE
	CPX	idxFOE
	BCS	L6CE7
	LDX	#$01
	STX	idxFOE
L6CE7	JSR	loadFOEDATA
	LDA	foeACTION
	BMI	L6D08
	BEQ	L6D08
	DEC	foeACTION
	LDY	foeACTION
	CPY	#$0D
	BCS	L6CFB
	JMP	L6E65

L6CFB	LDX	idxFOE
	LDA	tblFOETEMPO,X
	BEQ	L6D05
	JMP	saveFOEDATA
L6D05	JMP	L6DB7

L6D08	LDY	foeY
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BEQ	L6D61
	CMP	#sprBAR
	BNE	L6D26
	LDA	foeSTEPY
	CMP	#$02
	BEQ	L6D61
L6D26	LDA	foeSTEPY
	CMP	#$02
	BCC	L6D64
	LDY	foeY
	CPY	#lvlHEIGHT-1
	BEQ	L6D61
	LDA	tblBOARDALLL+1,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDA	tblBOARDALLH+1,Y
	STA	ptrBOARD+1
	LDY	foeX
	LDA	(ptrBOARD),Y
	CMP	#sprEMPTY
	BEQ	L6D64
	CMP	#sprHERO
	BEQ	L6D64
	CMP	#sprFOE
	BEQ	L6D61
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L6D61
	CMP	#sprWALLI
	BEQ	L6D61
	CMP	#sprLADDER
	BNE	L6D64
L6D61	JMP	L6E85

L6D64	JSR	calcFOESPRITEXY
	JSR	drawSPRITEXY
	JSR	foeNEXTSTEPX
	
*	@playsound	#isndTOMBE

	LDA	#$06	; foe falls left
	LDY	foeLEFTRIGHT
	BMI	L6D75
	LDA	#$0D	; foe falls right
L6D75	STA	foeINDEX
	INC	foeSTEPY
	LDA	foeSTEPY
	CMP	#$05
	BCS	L6DC0
	LDA	foeSTEPY
	CMP	#$02
	BNE	L6DB7
	JSR	foeTAKECHEST
	LDY	foeY
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L6DB7
	LDA	foeACTION
	BPL	L6DA2
	DEC	nbCHEST
L6DA2	LDA	hfoeACTION
	STA	foeACTION
	LDY	#$00	; we trapped a foe
	LDA	#$75
	JSR	printSCORE
	JSR	prepareMELODY
	HEX	06200430024000

L6DB7	JSR	calcFOESPRITEXY
	JSR	drawSPRXYCOLLISION
	JMP	saveFOEDATA

L6DC0	LDA	#$00
	STA	foeSTEPY
	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L6DE1
	LDA	#sprEMPTY
L6DE1	STA	(ptrBOARD),Y
	INC	foeY
	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	foeX
	LDA	(ptrBOARD),Y
	CMP	#sprHERO
	BNE	L6E02
	LSR	fgPLAY	; found the hero, he's now dead
L6E02	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L6E58
	LDA	foeACTION
	BPL	L6E58
	LDY	foeY
	DEY
	STY	theY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	foeX
	STY	theX
	LDA	(ptrBBACK),Y
	CMP	#sprEMPTY
	BEQ	L6E31
	DEC	nbCHEST
	JMP	L6E46

L6E31	LDA	#sprCHEST
	STA	(ptrBOARD),Y
	STA	(ptrBBACK),Y
	JSR	coutHGR2
	LDY	theY
	LDX	theX
	JSR	getXY
	LDA	#sprCHEST
	JSR	drawSPRXYCOLLISION
L6E46	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	#$00
	STA	foeACTION
	LDY	foeX
L6E58	LDA	#sprFOE
	STA	(ptrBOARD),Y
	JSR	calcFOESPRITEXY
	JSR	drawSPRXYCOLLISION
	JMP	saveFOEDATA

L6E65	CPY	#$07
	BCC	L6E85
	JSR	calcFOESPRITEXY
	JSR	drawSPRITEXY
	LDY	foeACTION
	LDA	L6E7F-7,Y
	STA	foeSTEPX
L6E76	JSR	calcFOESPRITEXY
	JSR	drawSPRXYCOLLISION
	JMP	saveFOEDATA

L6E7F	HEX	020102030201

L6E85	LDX	foeX
	LDY	foeY
	JSR	L70D8
	ASL
	TAY
	LDA	L6E97+1,Y
	PHA
	LDA	L6E97,Y
	PHA
	RTS

L6E97	DA	saveFOEDATA-1	; 0
	DA	L6FBC-1	; 1
	DA	L7047-1	; 2
	DA	L6EAC-1	; 3
	DA	L6F39-1	; 4

L6EA1	LDA	foeACTION
	BEQ	L6EA9
	BMI	L6EA9
	INC	foeACTION
L6EA9	JMP	saveFOEDATA

*--- 3

L6EAC	LDY	foeSTEPY
	CPY	#$03
	BCS	L6ED5
	LDY	foeY
	BEQ	L6EA1
	DEY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	foeX
	LDA	(ptrBOARD),Y
	CMP	#sprWALL
	BEQ	L6EA1
	CMP	#sprWALLI
	BEQ	L6EA1
	CMP	#sprTRAP
	BEQ	L6EA1
	CMP	#sprFOE
	BEQ	L6EA1
L6ED5	JSR	calcFOESPRITEXY
	JSR	drawSPRITEXY
	JSR	foeNEXTSTEPX
	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	DEC	foeSTEPY
	BPL	L6F26
	JSR	checkDROPCHEST
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L6F02
	LDA	#sprEMPTY
L6F02	STA	(ptrBOARD),Y
	DEC	foeY
	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	foeX
	LDA	(ptrBOARD),Y
	CMP	#sprHERO
	BNE	L6F1C
	LSR	fgPLAY
L6F1C	LDA	#sprFOE
	STA	(ptrBOARD),Y
	LDA	#$04
	STA	foeSTEPY
	BNE	L6F29
L6F26	JSR	foeTAKECHEST
L6F29	LDA	#$0E
	LDX	#$0F
	JSR	setFOESTEP
	JSR	calcFOESPRITEXY
	JSR	drawSPRXYCOLLISION
	JMP	saveFOEDATA

L6F39	LDY	foeSTEPY
	CPY	#$02
	BCC	L6F63
	LDY	foeY
	CPY	#$0F
	BCS	L6F60
	INY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	foeX
	LDA	(ptrBOARD),Y
	CMP	#sprWALLI
	BEQ	L6F60
	CMP	#sprFOE
	BEQ	L6F60
	CMP	#sprWALL
	BNE	L6F63
L6F60	JMP	saveFOEDATA

L6F63	JSR	calcFOESPRITEXY
	JSR	drawSPRITEXY
	JSR	foeNEXTSTEPX
	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	INC	foeSTEPY
	LDA	foeSTEPY
	CMP	#$05
	BCC	L6FB9
	JSR	checkDROPCHEST
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L6F94
	LDA	#sprEMPTY
L6F94	STA	(ptrBOARD),Y
	INC	foeY
	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	foeX
	LDA	(ptrBOARD),Y
	CMP	#sprHERO
	BNE	L6FAE
	LSR	fgPLAY	; we're dead
L6FAE	LDA	#sprFOE
	STA	(ptrBOARD),Y
	LDA	#$00
	STA	foeSTEPY
	JMP	L6F29
L6FB9	JMP	L6F26

L6FBC	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDX	foeSTEPX
	CPX	#$03
	BCS	L6FF1
	LDY	foeX
	BEQ	L6FEE
	DEY
	LDA	(ptrBOARD),Y
	CMP	#sprFOE
	BEQ	L6FEE
	CMP	#sprWALLI
	BEQ	L6FEE
	CMP	#sprWALL
	BEQ	L6FEE
	LDA	(ptrBBACK),Y
	CMP	#sprTRAP
	BNE	L6FF1
L6FEE	JMP	saveFOEDATA

L6FF1	JSR	calcFOESPRITEXY
	JSR	drawSPRITEXY
	JSR	foeNEXTSTEPY
	LDA	#$FF
	STA	foeLEFTRIGHT
	DEC	foeSTEPX
	BPL	L7026
	JSR	checkDROPCHEST
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L700F
	LDA	#sprEMPTY
L700F	STA	(ptrBOARD),Y
	DEC	foeX
	DEY
	LDA	(ptrBOARD),Y
	CMP	#sprHERO
	BNE	L701C
	LSR	fgPLAY	; foe catched hero
L701C	LDA	#sprFOE
	STA	(ptrBOARD),Y
	LDA	#$04
	STA	foeSTEPX
	BNE	L7029
L7026	JSR	foeTAKECHEST
L7029	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#sprBAR
	BEQ	L7037
	LDA	#$00	; foe runs left
	LDX	#$02
	BNE	L703B
L7037	LDA	#$03	; foe bars left
	LDX	#$05
L703B	JSR	setFOESTEP
	JSR	calcFOESPRITEXY
	JSR	drawSPRXYCOLLISION
	JMP	saveFOEDATA

L7047	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDX	foeSTEPX
	CPX	#$02
	BCC	L707E
	LDY	foeX
	CPY	#lvlWIDTH-1
	BEQ	L707B
	INY
	LDA	(ptrBOARD),Y
	CMP	#sprFOE
	BEQ	L707B
	CMP	#sprWALLI
	BEQ	L707B
	CMP	#sprWALL
	BEQ	L707B
	LDA	(ptrBBACK),Y
	CMP	#sprTRAP
	BNE	L707E
L707B	JMP	saveFOEDATA

L707E	JSR	calcFOESPRITEXY
	JSR	drawSPRITEXY
	JSR	foeNEXTSTEPY
	LDA	#$01
	STA	foeLEFTRIGHT
	INC	foeSTEPX
	LDA	foeSTEPX
	CMP	#$05
	BCC	L70B7
	JSR	checkDROPCHEST
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L70A0
	LDA	#$00
L70A0	STA	(ptrBOARD),Y
	INC	foeX
	INY
	LDA	(ptrBOARD),Y
	CMP	#sprHERO
	BNE	L70AD
	LSR	fgPLAY
L70AD	LDA	#sprFOE
	STA	(ptrBOARD),Y
	LDA	#$00
	STA	foeSTEPX
	BEQ	L70BA
L70B7	JSR	foeTAKECHEST
L70BA	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#sprBAR
	BEQ	L70C8
	LDA	#$07	; foe runs right
	LDX	#$09
	BNE	L70CC
L70C8	LDA	#$0A	; foe bars right
	LDX	#$0C
L70CC	JSR	setFOESTEP
	JSR	calcFOESPRITEXY
	JSR	drawSPRXYCOLLISION
	JMP	saveFOEDATA

L70D8	STX	tempX4
	STY	tempY1
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	tempX4
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L70F7
	LDA	foeACTION
	BEQ	L70F7
	BMI	L70F7
	LDA	#$03	; action 3
	RTS

L70F7	LDY	tempY1
	CPY	boardY
	BEQ	L7100
	JMP	L7186

L7100	LDY	tempX4
	STY	tempX5
	CPY	boardX
	BCS	L7147
L7108	INC	tempX5
	LDY	tempY1
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	tempX5
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BEQ	L713E
	CMP	#sprBAR
	BEQ	L713E
	LDY	tempY1
	CPY	#lvlHEIGHT-1
	BEQ	L713E
*	LDA	tblBOARDALLL+1,Y
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	tempX5
	LDA	(ptrBBACK),Y
	CMP	#sprEMPTY
	BEQ	L7186
	CMP	#sprTRAP
	BEQ	L7186
L713E	LDY	tempX5
	CPY	boardX
	BNE	L7108
	LDA	#$02	; action 2
	RTS

L7147	DEC	tempX5
	LDY	tempY1
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	tempX5
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BEQ	L717D
	CMP	#sprBAR
	BEQ	L717D
	LDY	tempY1
	CPY	#lvlHEIGHT-1
	BEQ	L717D
*	LDA	tblBOARDALLL+1,Y
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	tempX5
	LDA	(ptrBBACK),Y
	CMP	#sprEMPTY
	BEQ	L7186
	CMP	#sprTRAP
	BEQ	L7186
L717D	LDY	tempX5
	CPY	boardX
	BNE	L7147
	LDA	#$01	; action 1
	RTS

L7186	LDA	#$00
	STA	$58
	LDA	#$FF
	STA	$59
	LDX	tempX4
	LDY	tempY1
	JSR	L743E
	JSR	L7275
	JSR	L71A2
	JSR	L720C
	LDA	$58
	RTS
L71A1	RTS

L71A2	LDY	tempX3
	CPY	tempX4
	BEQ	L71A1
	LDY	tempY1
	CPY	#lvlHEIGHT-1
	BEQ	L71DA
*	LDA	tblBOARDALLL+1,Y
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	tempX3
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L71DA
	CMP	#sprWALLI
	BEQ	L71DA
	LDX	tempX3
	LDY	tempY1
	JSR	L739D
	LDX	tempX3
	JSR	L72D4
	CMP	$59
	BCS	L71DA
	STA	$59
	LDA	#$01
	STA	$58
L71DA	LDY	tempY1
	BEQ	L7206
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	tempX3
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BNE	L7206
	LDY	tempY1
	LDX	tempX3
	JSR	L7300
	LDX	tempX3
	JSR	L72D4
	CMP	$59
	BCS	L7206
	STA	$59
	LDA	#$01
	STA	$58
L7206	INC	tempX3
	JMP	L71A2
L720B	RTS

L720C	LDY	tempX2
	CPY	tempX4
	BEQ	L720B
	LDY	tempY1
	CPY	#$0F
	BEQ	L7244
*	LDA	tblBOARDALLL+1,Y
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	tempX2
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L7244
	CMP	#sprWALLI
	BEQ	L7244
	LDX	tempX2
	LDY	tempY1
	JSR	L739D
	LDX	tempX2
	JSR	L72D4
	CMP	$59
	BCS	L7244
	STA	$59
	LDA	#$02
	STA	$58
L7244	LDY	tempY1
	BEQ	L7270
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	tempX2
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BNE	L7270
	LDY	tempY1
	LDX	tempX2
	JSR	L7300
	LDX	tempX2
	JSR	L72D4
	CMP	$59
	BCS	L7270
	STA	$59
	LDA	#$02
	STA	$58
L7270	DEC	tempX2
	JMP	L720C

L7275	LDY	tempY1
	CPY	#lvlHEIGHT-1
	BEQ	L72A7
*	LDA	tblBOARDALLL+1,Y
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	tempX4
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L72A7
	CMP	#sprWALLI
	BEQ	L72A7
	LDX	tempX4
	LDY	tempY1
	JSR	L739D
	LDX	tempX4
	JSR	L72D4
	CMP	$59
	BCS	L72A7
	STA	$59
	LDA	#$04
	STA	$58
L72A7	LDY	tempY1
	BEQ	L72D3
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	tempX4
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BNE	L72D3
	LDX	tempX4
	LDY	tempY1
	JSR	L7300
	LDX	tempX4
	JSR	L72D4
	CMP	$59
	BCS	L72D3
	STA	$59
	LDA	#$03
	STA	$58
L72D3	RTS

L72D4	STA	fgODDEVEN
	CMP	boardY
	BNE	L72EB
	CPX	foeX
	BCC	L72E3
	TXA
	SEC
	SBC	foeX
	RTS

L72E3	STX	fgODDEVEN
	LDA	foeX
	SEC
	SBC	fgODDEVEN
	RTS

L72EB	BCC	L72F4
	SEC
	SBC	boardY
	CLC
	ADC	#$C8
	RTS
L72F4	LDA	boardY
	SEC
	SBC	fgODDEVEN
	CLC
	ADC	#$64
	RTS

L72FD	LDA	tempY
	RTS

L7300	STY	tempY
	STX	tempX
L7304
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	tempX
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BNE	L72FD
	DEC	tempY
	LDY	tempX
	BEQ	L734A
	DEY
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L7340
	CMP	#sprWALLI
	BEQ	L7340
	CMP	#sprLADDER
	BEQ	L7340
	LDY	tempY
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	tempX
	DEY
	LDA	(ptrBBACK),Y
	CMP	#sprBAR
	BNE	L734A
L7340	LDY	tempY
	STY	temp1
	CPY	boardY
	BCC	L7397
	BEQ	L7397
L734A	LDY	tempX
	CPY	#lvlWIDTH-1
	BEQ	L738C
	LDY	tempY
*	LDA	tblBOARDALLL+1,Y
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	tempX
	INY
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L7382
	CMP	#sprWALLI
	BEQ	L7382
	CMP	#sprLADDER
	BEQ	L7382
	LDY	tempY
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	tempX
	INY
	LDA	(ptrBBACK),Y
	CMP	#sprBAR
	BNE	L738C
L7382	LDY	tempY
	STY	temp1
	CPY	boardY
	BCC	L7397
	BEQ	L7397
L738C	LDY	tempY
	CPY	#$01
	BCC	L7395
	JMP	L7304

L7395	TYA
	RTS

L7397	LDA	temp1
	RTS

L739A	LDA	tempY
	RTS

L739D	STY	tempY
	STX	tempX
L73A1
*	LDA	tblBOARDALLL+1,Y
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	tempX
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L739A
	CMP	#sprWALLI
	BEQ	L739A
	LDY	tempY
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	tempX
	LDA	(ptrBBACK),Y
	CMP	#sprEMPTY
	BEQ	L742D
	CPY	#$00	; first column?
	BEQ	L73FB	; yes
	DEY
	LDA	(ptrBBACK),Y
	CMP	#sprBAR
	BEQ	L73F3
	LDY	tempY
*	LDA	tblBOARDALLL+1,Y
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	tempX
	DEY
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L73F3
	CMP	#sprWALLI
	BEQ	L73F3
	CMP	#sprLADDER
	BNE	L73FB
L73F3	LDY	tempY
	STY	temp1
	CPY	boardY
	BCS	L743B
L73FB	LDY	tempX
	CPY	#lvlWIDTH-1
	BCS	L742D
	INY
	LDA	(ptrBBACK),Y
	CMP	#sprBAR
	BEQ	L7425
	LDY	tempY
*	LDA	tblBOARDALLL+1,Y
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	tempX
	INY
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L7425
	CMP	#sprLADDER
	BEQ	L7425
	CMP	#sprWALLI
	BNE	L742D
L7425	LDY	tempY
	STY	temp1
	CPY	boardY
	BCS	L743B
L742D	INC	tempY	; next column
	LDY	tempY
	CPY	#lvlHEIGHT
	BCS	L7438
	JMP	L73A1

L7438	LDA	#$0F
	RTS

L743B	LDA	temp1
	RTS

L743E	STX	tempX3
	STX	tempX2
	STY	theYSCREEN
L7444	LDA	tempX3
	BEQ	L7490
	LDY	theYSCREEN
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	tempX3
	DEY
	LDA	(ptrBOARD),Y
	CMP	#$01
	BEQ	L7490
	CMP	#$02
	BEQ	L7490
	CMP	#$03
	BEQ	L748A
	CMP	#$04
	BEQ	L748A
	LDY	theYSCREEN
	CPY	#$0F
	BEQ	L748A
*	LDA	tblBOARDALLL+1,Y
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	tempX3
	DEY
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L748A
	CMP	#sprWALLI
	BEQ	L748A
	CMP	#sprLADDER
	BNE	L748E
L748A	DEC	tempX3
	BPL	L7444
L748E	DEC	tempX3
L7490	LDA	tempX2
	CMP	#lvlWIDTH-1
	BEQ	L74DE
	LDY	theYSCREEN
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	tempX2
	INY
	LDA	(ptrBOARD),Y
	CMP	#sprWALL
	BEQ	L74DE
	CMP	#sprWALLI
	BEQ	L74DE
	CMP	#sprLADDER
	BEQ	L74D8
	CMP	#sprBAR
	BEQ	L74D8
	LDY	theYSCREEN
	CPY	#lvlHEIGHT-1
	BEQ	L74D8
*	LDA	tblBOARDALLL+1,Y
	lda	tblBOARDBACKL+1,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	tempX2
	INY
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L74D8
	CMP	#sprWALLI
	BEQ	L74D8
	CMP	#sprLADDER
	BNE	L74DC
L74D8	INC	tempX2
	BPL	L7490
L74DC	INC	tempX2
L74DE	RTS

*-----------------------------------
* CALC FOE SPRITE X/Y
*-----------------------------------

calcFOESPRITEXY
	LDX	foeX
	LDY	foeSTEPX
	JSR	calcHGRX
	STX	theA
	LDY	foeY
	LDX	foeSTEPY
	JSR	calcHGRY
	LDX	foeINDEX
	LDA	seqFOE,X
	LDX	theA
	RTS

*-----------------------------------
* FOE TAKES A CHEST
*-----------------------------------

foeTAKECHEST
	LDA	foeSTEPX
	CMP	#$02
	BNE	L753D
	LDA	foeSTEPY
	CMP	#$02
	BNE	L753D
	LDY	foeY
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#sprCHEST
	BNE	L753D
	LDA	foeACTION	; deja un tresor ?
	BMI	L753D	; oui
	LDA	#$FF	; prends-le
	SEC
	SBC	tempX6
	STA	foeACTION
	LDA	#sprEMPTY
	STA	(ptrBBACK),Y
	LDY	foeY
	STY	theY
	LDY	foeX
	STY	theX
	JSR	coutHGR2
	LDY	theY
	LDX	theX
	JSR	getXY
	LDA	#sprCHEST
	JMP	drawSPRITEXY
L753D	RTS

*-----------------------------------
* FOE DROPS CHEST
*-----------------------------------

checkDROPCHEST
	LDA	foeACTION
	BPL	L7573	; skip if positive
	INC	foeACTION	; here is negative
	BNE	L7573

	LDY	foeY	; here if 0
	STY	theY
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	foeX
	STY	theX
	LDA	(ptrBBACK),Y
	CMP	#sprEMPTY
	BNE	L7571
	LDA	#sprCHEST
	STA	(ptrBBACK),Y
	JSR	coutHGR2
	LDY	theY
	LDX	theX
	JSR	getXY
	LDA	#sprCHEST
	JMP	drawSPRXYCOLLISION

L7571	DEC	foeACTION
L7573	RTS

*-----------------------------------
* SET FOE ANIMATION STEP
*-----------------------------------

setFOESTEP	INC	foeINDEX	; tutu
	CMP	foeINDEX
	BCC	L757D
L757A	STA	foeINDEX
	RTS
L757D	CPX	foeINDEX
	BCC	L757A
	RTS

*-----------------------------------
* SET FOE NEXT STEP X
*-----------------------------------

foeNEXTSTEPX
	LDA	foeSTEPX
	CMP	#$02
	BCC	L758F
	BEQ	L7594
	DEC	foeSTEPX
	JMP	foeTAKECHEST
L758F	INC	foeSTEPX
	JMP	foeTAKECHEST
L7594	RTS

*-----------------------------------
* SET FOE NEXT STEP Y
*-----------------------------------

foeNEXTSTEPY
	LDA	foeSTEPY
	CMP	#$02
	BCC	L75A2
	BEQ	L75A7
	DEC	foeSTEPY
	JMP	foeTAKECHEST
L75A2	INC	foeSTEPY
	JMP	foeTAKECHEST
L75A7	RTS

*-----------------------------------
* SAVE FOE DATA AFTER WE USED IT
*-----------------------------------

saveFOEDATA	LDX	idxFOE
	LDA	foeX
	STA	tblFOEX,X
	LDA	foeY
	STA	tblFOEY,X
	LDA	foeSTEPX
	STA	tblFOESTEPX,X
	LDA	foeSTEPY
	STA	tblFOESTEPY,X
	LDA	foeACTION
	STA	tblFOEACTION,X
	LDA	foeLEFTRIGHT
	STA	tblFOELEFTRIGHT,X
	LDA	foeINDEX
	STA	tblFOEINDEX,X
	RTS

*-----------------------------------
* LOAD FOE DATA TO USE IT
*-----------------------------------

loadFOEDATA	LDX	idxFOE
	LDA	tblFOEX,X
	STA	foeX
	LDA	tblFOEY,X
	STA	foeY
	LDA	tblFOESTEPX,X
	STA	foeSTEPX
	LDA	tblFOESTEPY,X
	STA	foeSTEPY
	LDA	tblFOEINDEX,X
	STA	foeINDEX
	LDA	tblFOELEFTRIGHT,X
	STA	foeLEFTRIGHT
	LDA	tblFOEACTION,X
	STA	foeACTION
	RTS

*-----------------------------------
* CHECK HOLE - Who/What is in the hole?
*-----------------------------------

checkHOLE	JSR	checkRESURRECT
	INC	tempX6	; next one
	LDA	tempX6
	CMP	#lvlWIDTH	; ok, we browsed the line
	BCC	L7603
	LDA	#$00	; start again at column 0
	STA	tempX6

L7603	LDX	#sizeHOLE-2
L7605	LDA	tblHOLET,X
	STX	tempINDEX
	BNE	L760F
	JMP	L770D

L760F	DEC	tblHOLET,X
	BEQ	L7641
	LDA	tblHOLEX,X
	STA	theX
	LDA	tblHOLEY,X
	STA	theY
	LDA	tblHOLET,X
	CMP	#$14	; 20
	BNE	L7639
	LDA	#$37	; 1er sprite
L7627	JSR	coutHGR2
	LDX	theX
	LDY	theY
	JSR	getXY
	LDA	#sprEMPTY
	JSR	drawSPRITEXY
L7636	JMP	L770D

L7639	CMP	#$0A	; 10
	BNE	L7636
	LDA	#$38	; 2nd sprite
	BNE	L7627

L7641	LDX	tempINDEX
	LDY	tblHOLEY,X
	STY	theY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	tblHOLEX,X
	STY	theX
	LDA	(ptrBOARD),Y
	CMP	#sprEMPTY
	BNE	L7667
	JMP	L7701

L7667	CMP	#sprHERO
	BNE	L766D
	LSR	fgPLAY	; the hero was in the hole... he's dead
L766D	CMP	#sprFOE	
	BEQ	L767A	; it was a foe
	CMP	#sprCHEST
	BNE	L7677
	DEC	nbCHEST	; a chest, remove one
L7677	JMP	L7701

*--- kill the foe

L767A	LDA	#sprWALL	; put a wall
	STA	(ptrBOARD),Y
	STA	(ptrBBACK),Y
	JSR	coutHGR1
	LDA	#sprWALL
	JSR	coutHGR2

	LDX	nbFOE	; find the foe
L768A	LDA	tblFOEX,X
	CMP	theX
	BNE	L76FE
	LDA	tblFOEY,X
	CMP	theY
	BNE	L76FE
	LDA	tblFOEACTION,X	; was he holding a chest?
	BPL	L769F
	DEC	nbCHEST	; yes, remove it
L769F	LDA	#$7F	; no chest
	STA	tblFOEACTION,X
	STX	idxFOE
	JSR	loadFOEDATA
	JSR	calcFOESPRITEXY
	JSR	drawSPRITEXY
	LDX	idxFOE
	LDY	#$01	; we resurrect him on line 1
	STY	theY
L76B5	LDY	theY
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	tempX6
L76C3	LDA	(ptrBBACK),Y
	CMP	#sprEMPTY	; only if there is a space
	BEQ	L76D9
	INC	tempX6
	LDY	tempX6
	CPY	#lvlWIDTH
	BCC	L76C3
	INC	theY
	LDA	#$00
	STA	tempX6
	BEQ	L76B5
L76D9	TYA
	STA	tblFOEX,X
	LDA	theY
	STA	tblFOEY,X
	LDA	#$14
	STA	tblFOETEMPO,X
	LDA	#$02
	STA	tblFOESTEPY,X
	STA	tblFOESTEPX,X
	LDA	#$00
	STA	tblFOEINDEX,X
	LDY	#$00	; we killed an ennemy
	LDA	#$75
	JSR	printSCORE
	JMP	L770D

L76FE	DEX
	BNE	L768A
L7701	LDA	#sprWALL
	STA	(ptrBOARD),Y
	JSR	coutHGR1
	LDA	#sprWALL
	JSR	coutHGR2
L770D	LDX	tempINDEX
	DEX
	BMI	L7715
	JMP	L7605
L7715	RTS

*-----------------------------------
* CHECK RESURRECT - Can/Do we resurrect a foe?
*-----------------------------------

checkRESURRECT
	LDX	nbFOE	; ennemi 0 n'existe pas
	BEQ	L7715
	LDA	idxFOE
	PHA
L771D	LDA	tblFOETEMPO,X
	BEQ	nextFOE
	STX	idxFOE
	JSR	loadFOEDATA
	LDA	#$7F
	STA	tblFOEACTION,X
	LDA	tblFOEX,X
	STA	theX
	LDA	tblFOEY,X
	STA	theY
	DEC	tblFOETEMPO,X	; foe must live
	BEQ	resurrectFOE
	LDA	tblFOETEMPO,X
	CMP	#$13
	BNE	L7752
	LDA	#$39	; foe appears again
	JSR	coutHGR2
	JSR	calcFOESPRITEXY
	LDA	#$39
	JSR	drawSPRXYCOLLISION
	JMP	nextFOEalt

L7752	CMP	#$0A
	BNE	nextFOE
	LDA	#$3A	; foe appears again sprite 2
	JSR	coutHGR2
	JSR	calcFOESPRITEXY
	LDA	#$3A
	JSR	drawSPRXYCOLLISION

nextFOEalt	LDX	idxFOE	; next ennemy
nextFOE	DEX
	BNE	L771D
	PLA		; restore
	STA	idxFOE
	RTS		; exit

*-----------------------------------
* RESURRECT FOE
*-----------------------------------

resurrectFOE
	LDY	theY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDX	idxFOE
	INC	tblFOETEMPO,X
	LDY	theX
	LDA	(ptrBOARD),Y
	BNE	nextFOE
	LDA	#sprFOE
	STA	(ptrBOARD),Y
	LDA	#sprEMPTY
	JSR	coutHGR2
	LDA	#$00
	LDX	idxFOE
	STA	tblFOEACTION,X
	STA	tblFOETEMPO,X
	LDA	#sprFOE
	JSR	coutHGR1
	JSR	prepareMELODY
	HEX	027C03780474057000
	LDX	idxFOE
	JMP	nextFOE

*-------------------------------
* 8D - RETURN - DISPLAYS HIGH SCORE
*-------------------------------

displayHIGHSCORES
	JSR	showALLSCORES
	LDX	#$FF
	LDY	#$FF
	LDA	#$04
	STA	counter

L77B7	LDA	fgINPUT
	CMP	#chrK
	BEQ	L77C7
	cmp	#chrJ
	beq	L77B9
	cmp	#chrP
	bne	L77C7
	jsr	read4PLAY
	bmi	L77D6
	bvs	L77D6
	bvc	L77C7

L77B9	LDAL	BUTN1
	BMI	L77D6
	LDAL	BUTN0
	BMI	L77D6

*	LDA	KBD
L77C7	jsr	checkKEY
	BMI	L77D6
	DEX
	BNE	L77B7
	DEY
	BNE	L77B7
	DEC	counter
	BNE	L77B7

*	STA	KBDSTROBE
*	STA	TXTPAGE1
L77D6	lda	ptrSCREEN+2
	sta	ptrHGR1+2
	lda	#>oldHGR1
	sta	hgrPAGE
	JSR	clearHGR2
	
	LDY	#lvlHEIGHT-1
	STY	theY
L77E3
*	LDA	tblBOARDALLL,Y
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	#lvlWIDTH-1
	STY	theX
L77F1	LDA	(ptrBBACK),Y
	CMP	#sprTRAP
	BNE	L77F9
	LDA	#sprWALL
L77F9	JSR	coutHGR2
	DEC	theX
	LDY	theX
	BPL	L77F1
	DEC	theY
	LDY	theY
	BPL	L77E3
	LDX	#sizeHOLE-2
L780A	STX	tempINDEX
	LDA	tblHOLET,X
	BEQ	L7838
	LDY	tblHOLEY,X
	STY	theY
	LDY	tblHOLEX,X
	STY	theX
	CMP	#$15
	BCC	L7827
	LDA	#sprEMPTY
	JSR	coutHGR2
	JMP	L7838

L7827	CMP	#$0B
	BCC	L7833
	LDA	#$37	; rebuild wall step 1
	JSR	coutHGR2
	JMP	L7838

L7833	LDA	#$38	; rebuild wall step 2
	JSR	coutHGR2

L7838	LDX	tempINDEX
	DEX
	BPL	L780A
	LDX	nbFOE
	BEQ	L7868	; skip foe n°0
L7841	LDA	tblFOETEMPO,X
	STX	tempINDEX
	BEQ	L7863
	LDY	tblFOEX,X
	STY	theX
	LDY	tblFOEY,X
	STY	theY
	CMP	#$14
	BCS	L7863
	CMP	#$0B
	BCC	L785E
	LDA	#$39	; foe revives step 1
	BNE	L7860
L785E	LDA	#$3A	; foe revives step 2
L7860	JSR	coutHGR2
L7863	LDX	tempINDEX
	DEX
	BNE	L7841
L7868	JMP	getPLAYERINPUT

*-------------------------------
* SHOW ALL SCORES
*-------------------------------

showALLSCORES
	JSR	clearHGR1	; was 2
	LDA	#>oldHGR1	; was 2
	STA	activePAGE
	LDA	#$00
	STA	theX
	STA	theY
	JSR	printSTRING
	ASC	"    LODE RUNNER HIGH SCORES"8D8D8D
	ASC	"    INITIALS LEVEL  SCORE"8D
	ASC	"    -------- ----- --------"8D00

	LDA	#$01	; for x=1 to...10
	STA	tempX4
L78D4	CMP	#$0A
	BNE	L78E5
	LDA	#$01
	JSR	outputCHAR
	LDA	#$00
	JSR	outputCHAR
	JMP	L78EF

L78E5	LDA	#chrSPC
	JSR	printCHAR
	LDA	tempX4
	JSR	outputCHAR
L78EF	JSR	printSTRING
	ASC	".    "00
	LDX	tempX4
	LDY	scoreoffset,X
	STY	tempY1
	LDA	scorebuf+$03,Y
	BNE	L7907
	JMP	L798C

* +0..+2 INITIALS
* +3     LEVEL
* +4..+7 SCORE

L7907	LDY	tempY1
	LDA	scorebuf,Y
	JSR	printCHAR
	LDY	tempY1
	LDA	scorebuf+$01,Y
	JSR	printCHAR
	LDY	tempY1
	LDA	scorebuf+$02,Y
	JSR	printCHAR
	JSR	printSTRING
	ASC	"    "00
	LDY	tempY1
	LDA	scorebuf+$03,Y
	JSR	hex2dec
	LDA	theCENTAINE
	JSR	outputCHAR
	LDA	theDIZAINE
	JSR	outputCHAR
	LDA	theUNITE
	JSR	outputCHAR
	JSR	printSTRING
	ASC	"  "00
	LDY	tempY1
	LDA	scorebuf+$04,Y
	JSR	bcd2dec
	LDA	theDIZAINE
	JSR	outputCHAR
	LDA	theUNITE
	JSR	outputCHAR
	LDY	tempY1
	LDA	scorebuf+$05,Y
	JSR	bcd2dec
	LDA	theDIZAINE
	JSR	outputCHAR
	LDA	theUNITE
	JSR	outputCHAR
	LDY	tempY1
	LDA	scorebuf+$06,Y
	JSR	bcd2dec
	LDA	theDIZAINE
	JSR	outputCHAR
	LDA	theUNITE
	JSR	outputCHAR
	LDY	tempY1
	LDA	scorebuf+$07,Y
	JSR	bcd2dec
	LDA	theDIZAINE
	JSR	outputCHAR
	LDA	theUNITE
	JSR	outputCHAR
L798C	JSR	L7B7D
	INC	tempX4
	LDA	tempX4
	CMP	#$0B
	BCS	L799A
	JMP	L78D4

L799A
*	STA	TXTPAGE2
	LDA	#>oldHGR1
	STA	activePAGE
	RTS

scoreoffset	HEX	0000081018202830384048	; offset of each score

*-------------------------------
* CLEAR PAGES
*-------------------------------

clearHGRPAGES
	JSR	clearHGR1
	JSR	clearHGR2

*-------------------------------
* DRAW GAME FRAME
*-------------------------------

drawINFOBAR
*	LDY	#$27	; met la barre bleue
	LDA	activePAGE
	CMP	#>oldHGR2
	BEQ	L79DD

	lda	ptrSCREEN+2
	ldx	ptrSCREEN+1
	ldy	ptrSCREEN
	bra	dib2

L79DD	lda	#^HGR2
	ldx	#>HGR2
	ldy	#<HGR2

dib2	sta	ptrDATA+2
	stx	ptrDATA+1
	sty	ptrDATA
	
	rep	#$30
	ldx	#160*4	; 4 lines
	ldy	#$6e00	; ligne 179
	lda	fondFRAME	; bleu
]lp	sta	[ptrDATA],y
	iny
	iny
	dex
	dex
	bne	]lp
	sep	#$30

*L79BB	LDA	#$AA	; ligne 176
*	STA	$2350,Y
*	STA	$2750,Y
*	STA	$2B50,Y
*	STA	$2F50,Y
*	DEY
*	LDA	#$D5
*	STA	$2350,Y
*	STA	$2750,Y
*	STA	$2B50,Y
*	STA	$2F50,Y
*	DEY
*	BPL	L79BB
*	BMI	L79FD
*
*L79DD	LDA	#$AA	; pareil mais sur HGR2
*	STA	$4350,Y
*	STA	$4750,Y
*	STA	$4B50,Y
*	STA	$4F50,Y
*	DEY
*	LDA	#$D5
*	STA	$4350,Y
*	STA	$4750,Y
*	STA	$4B50,Y
*	STA	$4F50,Y
*	DEY
*	BPL	L79DD

L79FD	LDA	#$10
	STA	theY
	LDA	#$00
	STA	theX
	JSR	printSTRING
	ASC	"SCORE        MEN    LEVEL   "00
	JSR	printMEN
	JSR	printLEVEL
	LDA	#$00	; score de 0
	TAY
	JMP	printSCORE

*-------------------------------
* SET HGR POINTER
*-------------------------------

setHGRPOINTER
	LDA	xhgr,Y
	STA	ptrHGR1
	LDA	yhgr,Y
*	ORA	hgrPAGE
	STA	ptrHGR1+1
	
	lda	hgrPAGE	; logo
	cmp	#>oldHGR2	; set bank
	beq	shp2
	lda	ptrSCREEN+2	; HGR1 = ptrSCREEN+2
	sta	ptrHGR1+2
	rts
shp2	lda	#^HGR2	; HGR2 = ^HGR2
	sta	ptrHGR1+2
	RTS

*-------------------------------
* SET HGR POINTERS
*-------------------------------

setHGRPOINTERS
	LDA	xhgr,Y	; low
	STA	ptrHGR1
	STA	ptrHGR2
	LDA	yhgr,Y	; high
*	ORA	#>oldHGR1
	STA	ptrHGR1+1
*	EOR	#$60
	STA	ptrHGR2+1

	lda	ptrSCREEN+2	; bank
	sta	ptrHGR1+2
	lda	#^HGR2
	sta	ptrHGR2+2
	RTS

*-------------------------------
* CLEAR HGR1 
*-------------------------------

clearHGR1
	lda	ptrSCREEN+2
	ldx	ptrSCREEN+1
	ldy	ptrSCREEN
	bra	L7A5B

*-------------------------------
* CLEAR HGR2
*-------------------------------

clearHGR2
	lda	#^HGR2
	ldx	#>HGR2
	ldy	#<HGR2

*--- clear now

L7A5B	sta	ptrDATA+2	; save address
	stx	ptrDATA+1
	sty	ptrDATA

	rep	#$30
	ldy	#$7cfe	; everything but SCB and Palette
	lda	#0
]lp	sta	[ptrDATA],y
	dey
	dey
	bpl	]lp
	sep	#$30
	RTS

*-------------------------------
* PRINT MEN
*-------------------------------

printMEN	LDA	theMEN	; print number of men
	LDX	#$10
	
L7A74	STX	theX	; show byte2dec
	JSR	hex2dec
	LDA	#$10	; print three values (0-255)
	STA	theY
	LDA	theCENTAINE
	JSR	outputCHAR
	LDA	theDIZAINE
	JSR	outputCHAR
	LDA	theUNITE
	JMP	outputCHAR

*-------------------------------
* PRINT LEVEL
*-------------------------------

printLEVEL	LDA	theLEVEL	; print level
	LDX	#$19	; column offset
	BNE	L7A74

*-------------------------------
* ADD & PRINT SCORE
*-------------------------------

printSCORE	CLC
	SED
	ADC	theSCORE
	STA	theSCORE
	TYA
	ADC	theSCORE+1
	STA	theSCORE+1
	LDA	#$00
	ADC	theSCORE+2
	STA	theSCORE+2
	LDA	#$00
	ADC	theSCORE+3
	STA	theSCORE+3
	CLD

	LDA	#$05
	STA	theX
	LDA	#$10
	STA	theY

	LDA	theSCORE+3
	JSR	bcd2dec
	LDA	theUNITE
	JSR	outputCHAR
	LDA	theSCORE+2
	JSR	bcd2dec
	LDA	theDIZAINE
	JSR	outputCHAR
	LDA	theUNITE
	JSR	outputCHAR
	LDA	theSCORE+1
	JSR	bcd2dec
	LDA	theDIZAINE
	JSR	outputCHAR
	LDA	theUNITE
	JSR	outputCHAR
	LDA	theSCORE
	JSR	bcd2dec
	LDA	theDIZAINE
	JSR	outputCHAR
	LDA	theUNITE
	JMP	outputCHAR

*-------------------------------
* BCD TO DECIMAL CONVERSION
*-------------------------------

bcd2dec	STA	theDIZAINE
	AND	#$0F
	STA	theUNITE	; unité
	LDA	theDIZAINE
	LSR
	LSR
	LSR
	LSR
	STA	theDIZAINE	; dizaine
	RTS

*-------------------------------
* HEX TO DECIMAL CONVERSION
*-------------------------------

hex2dec	LDX	#$00
	STX	theDIZAINE
	STX	theCENTAINE	; centaine
L7AFE	CMP	#100
	BCC	L7B08
	INC	theCENTAINE
	SBC	#100
	BNE	L7AFE
L7B08	CMP	#10
	BCC	L7B12
	INC	theDIZAINE
	SBC	#10
	BNE	L7B08
L7B12	STA	theUNITE
	RTS

*-------------------------------
* PRINT A CHARACTER
*-------------------------------

outputCHAR	CLC		; print a char
	ADC	#spr0
	LDX	activePAGE
	CPX	#>oldHGR2
	BEQ	L7B24
	JSR	coutHGR1	; print HGR1
	INC	theX
	RTS
L7B24	JSR	coutHGR2	; print HGR2
	INC	theX
	RTS

*-------------------------------
* FILTER CHARACTER
*-------------------------------

filterCHAR	CMP	#"A"
	BCC	L7B32
	CMP	#"Z"+1
	BCC	L7B60
L7B32	LDX	#$7C
	CMP	#" "	; 7C = 00
	BEQ	L7B5F
	LDX	#$DB
	CMP	#">"	; DB = 5F
	BEQ	L7B5F
	INX
	CMP	#"."	; DC = 60
	BEQ	L7B5F
	INX
	CMP	#"("	; DD = 61
	BEQ	L7B5F
	INX
	CMP	#")"	; DE = 62
	BEQ	L7B5F
	INX
	CMP	#"/"	; DF = 63
	BEQ	L7B5F
	INX
	CMP	#"-"	; E0 = 64
	BEQ	L7B5F
	INX
	CMP	#"<"	; E1 = 65
	BEQ	L7B5F
	LDA	#$10	; The still Lode Runner
	RTS

L7B5F	TXA		; calculate offset
L7B60	SEC
	SBC	#$7C
	RTS

*-----------------------------------
* OUTPUT A CHARACTER
*-----------------------------------

printCHAR	CMP	#chrRET
	BEQ	L7B7D
	JSR	filterCHAR
	LDX	activePAGE
	CPX	#>oldHGR2
	BEQ	L7B77
	JSR	coutHGR1	; output in HGR1
	INC	theX
	RTS
L7B77	JSR	coutHGR2	; output in HGR2
	INC	theX
	RTS

L7B7D	INC	theY	; next line
	LDA	#$00
	STA	theX
	RTS

*-----------------------------------
* CTRL-E - LEVEL EDITOR
*-----------------------------------

enterEDITOR	LDA	#$00
	STA	theSCORE
	STA	theSCORE+1
	STA	theSCORE+2
	STA	theSCORE+3
	LDA	#$05
	STA	theMEN
	STA	fgDEMO
	LDA	fgINPUT	; save interface mode
	STA	L7C76+1
	LDA	#chrK	; force keyboard in editor
	STA	fgINPUT
*	STA	TXTPAGE1
	lda	ptrSCREEN+2
	sta	ptrHGR1+2
	lda	#>oldHGR1
	sta	hgrPAGE
	LDA	intLEVEL	; check level
	CMP	#maxLEVEL
	BCC	editMAIN
	LDA	#$00	; start at 0 if > 149
	STA	intLEVEL

editMAIN	JSR	clearHGR1	; clear HGR1
	LDA	#>oldHGR1
	STA	activePAGE
	LDA	#$00
	STA	theX
	STA	theY
	JSR	printSTRING
	ASC	"  LODE RUNNER BOARD EDITOR"8D
	ASC	"----------------------------"8D
	ASC	"  <ESC> ABORTS ANY COMMAND"8D00

editLOOP	LDA	theY	; are we at the
	CMP	#$09	; end of the screen?
	BCS	editMAIN	; yes, bottom line

	JSR	printSTRING	; no, show command
	ASC	8D
	ASC	"COMMAND>"00

	JSR	editWAITKEY	; wait for key
	LDX	#$00
L7C2E	LDY	tblEDITKEY,X	; authorized key?
	BEQ	editNEXT
	CMP	tblEDITKEY,X
	BEQ	L7C41
	INX
	BNE	L7C2E
	
editNEXT	JSR	doBEEP	; beep
	JMP	editLOOP	; loop

L7C41	TXA		; yes, we know the key
	ASL		; jump to the feature
	TAX		; and handle it
	LDA	tblEDITADD+1,X
	PHA
	LDA	tblEDITADD,X
	PHA
	RTS

tblEDITKEY	ASC	"PCEMISORQ"00

tblEDITADD	DA	editPLAY-1	; Play level
	DA	editCLEAR-1	; Clear level
	DA	editEDIT-1	; Edit level
	DA	editMOVE-1	; Move level
	DA	editINIT-1	; Initialize
	DA	editCLEARSCORE-1 ; Clear Score file
	da	editOPEN-1	; Open levels
	da	editRESTART-1 ; Restart gale
	da	editBYE-1	; Quit game

*-------------------------------
* P - PLAY LEVEL 
*-------------------------------

editPLAY	JSR	printSTRING
	ASC	8D
	ASC	">>PLAY LEVEL"00
	JSR	inputLEVEL
	BCS	L7C8B
L7C76	LDA	#$00
	STA	fgINPUT
	LDA	#$03
	STA	fgDEMO
	LDA	#$01
	STA	fgGOODSTART
	LDA	intLEVEL	; do we start at level 1?
	BEQ	L7C88
	LSR	fgGOODSTART	; no, we cannot change scores
L7C88	JMP	L6056
L7C8B	JMP	editNEXT

*-------------------------------
* C - CLEAR LEVEL 
*-------------------------------

editCLEAR	JSR	printSTRING
	ASC	8D
	ASC	">>CLEAR LEVEL"00
	JSR	inputLEVEL
	BCS	L7CB9
	JSR	checkDISK
	LDY	#$00
	TYA
L7CAB	STA	levelDISK,Y
	INY
	BNE	L7CAB
	LDA	#$02	; write
	JSR	diskLEVEL
	JMP	editLOOP
L7CB9	JMP	editNEXT

*-------------------------------
* E - EDIT LEVEL 
*-------------------------------

editEDIT	JSR	printSTRING
	ASC	8D
	ASC	">>EDIT LEVEL"00
	JSR	inputLEVEL	; is level valid?
	BCS	L7CD5	; no
	JMP	editEDITLEVEL	; yes, handle edit
L7CD5	JMP	editNEXT

*-------------------------------
* M - MOVE LEVEL 
*-------------------------------

editMOVE	JSR	printSTRING
	ASC	8D
	ASC	">>MOVE LEVEL"00
	JSR	inputLEVEL
	BCS	L7D5A
	STY	L824F
	JSR	printSTRING
	ASC	" TO LEVEL"00
	JSR	inputLEVEL
	BCS	L7D5A
	STY	L8250

*	JSR	printSTRING
*	ASC	8D
*	ASC	"  SOURCE DISKETTE"00
*	JSR	editWAITKEY
*	JSR	checkDISK
*	LDA	L824F
*	STA	intLEVEL
*	LDA	#$01	; read
*	JSR	diskLEVEL
*	JSR	printSTRING
*	ASC	8D
*	ASC	"  DESTINATION DISKETTE"00
*	JSR	editWAITKEY
*	JSR	checkDISK
*	LDA	L8250
*	STA	intLEVEL
*	LDA	#$02	; write
*	JSR	diskLEVEL

	rep	#$30

	pea	^ptrLEVELS	; set source level
	lda	L824F
	and	#$ff
	xba
	clc
	adc	#ptrLEVELS
	pha

	pea	^ptrLEVELS	; set destination level
	lda	L8250
	and	#$ff
	xba
	clc
	adc	#ptrLEVELS
	pha
	
	PushLong	#256	; set length
	_BlockMove

	jsr	saveLEVELS	; save levels and return 8-bit

	mx	%11

	JMP	editLOOP
L7D5A	JMP	editNEXT

*-------------------------------
* I - INITIALIZE DISKETTE => CLEAR LEVELS
*-------------------------------

editINIT	JSR	printSTRING
	ASC	8D
	ASC	">>INITIALIZE"8D
*	ASC	"  THIS FORMATS THE DISKETTE"8D
	asc         "  THIS CREATES A NEW FILE"8d
	ASC	"  FOR USER CREATED LEVELS."8D8d
*	ASC	"  (CAUTION. IT ERASES THE"8D
*	ASC	"   ENTIRE DISKETTE FIRST)"8D8D
	ASC	"  ARE YOU SURE (Y/N) "00
	JSR	editWAITKEY
	CMP	#chrY
	BNE	L7E72

	jsr	loadLEVELS9	; clear all
	jsr	doSAVE	; save the file
	bcs	L7E72
	
*	NOP		; NOP
*	NOP
*	NOP
*	NOP
*	NOP
*	NOP
*	NOP
*	NOP
*	NOP
*	NOP
*	NOP
*	NOP
*	NOP
*	NOP
*	NOP
*	LDA	intLEVEL
*	PHA
*	LDA	#$04	; Init command
*	JSR	diskLEVEL
*
*	LDA	#<boot	; Save T0/S0
*	STA	LB7F0
*	LDA	#>boot
*	STA	LB7F0+1
*	LDA	#$00
*	STA	LB7ED
*	STA	LB7EC
*	LDA	#$02
*	STA	LB7F4
*	JSR	diskRWTS
*	LDA	#$E0
*	STA	intLEVEL
*	LDA	#$01
*	JSR	diskLEVEL
*	LDY	#$37
*L7E33	LDA	L8251,Y
*	STA	levelDISK,Y
*	DEY
*	BPL	L7E33
*	LDA	#$02
*	JSR	diskLEVEL
*	LDA	#$EF
*	STA	intLEVEL
*	LDA	#$01
*	JSR	diskLEVEL
*	LDY	#$20
*L7E4C	LDA	L8289,Y
*	STA	levelDISK+$B,Y
*	DEY
*	BPL	L7E4C
*	LDA	#$02
*	JSR	diskLEVEL
*	LDA	#$01
*	JSR	readSCORE
*	LDY	#$0A
*L7E61	LDA	L63A8,Y
*	STA	scorebuf+$F4,Y
*	DEY
*	BPL	L7E61
*	LDA	#$02
*	JSR	readSCORE
*	PLA
*	STA	intLEVEL

L7E72	JMP	editMAIN	; was editLOOP

*-------------------------------
* C - CLEAR SCORE FILE 
*-------------------------------

editCLEARSCORE
	JSR	printSTRING
	ASC	8D
	ASC	">>CLEAR SCORE FILE"8D
	ASC	"  THIS CLEARS THE HIGH"8D
	ASC	"  SCORE FILE OF ALL"8D
	ASC	"  ENTRIES."8D8D
	ASC	"  ARE YOU SURE (Y/N) "00
	JSR	editWAITKEY
	CMP	#chrY
	BNE	L7EFE
	LDA	#$01
	JSR	readSCORE
	CMP	#$00
	BNE	L7EEF
	JSR	tellNODATADISK
	JMP	editMAIN

L7EEF	LDY	#$4F	; clear score file
	LDA	#$00
L7EF3	STA	scorebuf,Y
	DEY
	BPL	L7EF3
	LDA	#$02
	JSR	readSCORE	; write score file
L7EFE	JMP	editLOOP

*-------------------------------
* O - OPEN A LEVELS FILE
*-------------------------------

editOPEN	jsr	editSAVECHANGES
	jsr	printSTRING
	asc	8D
	asc	">>LOAD LEVEL FILE"00
	jsr	doLOAD	; load a levels file?
	bcs	editOPEN99
	jmp	editMAIN	; yes
editOPEN99	jmp	editLOOP	; no

*-------------------------------
* R - RESTART THE GAME
*-------------------------------

editRESTART	jsr	editSAVECHANGES
	jsr	printSTRING
	asc	8D
	asc	">>RESTART GAME"8D
	ASC	"  THIS RESTARTS THE GAME"8D8D
	ASC	"  ARE YOU SURE (Y/N) "00
	JSR	editWAITKEY
	CMP	#chrY
	BNE	editRES99
	jmp	showTITLEPAGE
editRES99	jmp	editLOOP

*-------------------------------
* Q - QUIT THE GAME
*-------------------------------

editBYE	jsr	editSAVECHANGES
	jsr	printSTRING
	asc	8D
	asc	">>QUIT GAME"8D
	ASC	"  THIS QUITS THE GAME"8D8D
	ASC	"  ARE YOU SURE (Y/N) "00
	JSR	editWAITKEY
	CMP	#chrY
	BNE	editBYE99
	jmp	meQUIT
editBYE99	jmp	editLOOP

*-------------------------------
* EDIT THE LEVEL 
*-------------------------------

editEDITLEVEL
	JSR	clearHGR1	; was 2
	LDA	#>oldHGR1	; was 2
	STA	activePAGE
	JSR	drawINFOBAR	; show frame
*	LDA	#>oldHGR1
*	STA	activePAGE
	JSR	checkDISK	; check diskette (master or data disk)
	LDX	#$01
	STX	fgCHANGE
	DEX		; mode edit
	JSR	prepareLEVEL
	BCC	L7F1F
	JMP	editNEXT

L7F1F	LDA	#$00	; cursor is at 0,0
	STA	theX
	STA	theY
L7F25	JSR	blinkATXY	; wait for key
	CMP	#"9"+1
	BCS	L7F54	; no sprite
	CMP	#"0"	; means check commands
	BCC	L7F54
	AND	#$0F
	STA	theA	; save key
	LDY	theY	; get Y
	LDA	tblBOARDALLL,Y	; get line address
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	theX	; get X
	LDA	theA	; get sprite
	EOR	(ptrBOARD),Y	; same as before?
	BEQ	L7F4A	; yes
	LSR	fgCHANGE	; no, tell there's a change
L7F4A	LDA	theA	; get sprite
	STA	(ptrBOARD),Y	; save it
	JSR	coutHGR1	; print sprite
	JMP	L7F25	; loop

L7F54	and	#maskUPPER	; for lowercase support
	STA	theA	; same key
	LDY	#$FF
L7F58	INY
	LDA	tblEDITKEYS,Y	; is that a command?
	BEQ	L7F6E
	CMP	theA	; same as our key?
	BNE	L7F58
	TYA		; yes, jump
	ASL
	TAY
	LDA	tblEDITCODE+1,Y
	PHA
	LDA	tblEDITCODE,Y
	PHA
	RTS

L7F6E	JSR	doBEEP	; beep
	JMP	L7F25	; loop

*-------------------------------
* I - MOVE CURSOR UP 
*-------------------------------

editUP	LDA	theY
	BEQ	L7F6E
	DEC	theY
	BPL	L7F25

*-------------------------------
* J - MOVE CURSOR LEFT
*-------------------------------

editLEFT	LDA	theX
	BEQ	L7F6E
	DEC	theX
	BPL	L7F25

*-------------------------------
* K - MOVE CURSOR RIGHT
*-------------------------------

editRIGHT	LDA	theX
	CMP	#lvlWIDTH-1
	BCS	L7F6E
	INC	theX
	BNE	L7F25

*-------------------------------
* M - MOVE CURSOR DOWN 
*-------------------------------

editDOWN	LDA	theY
	CMP	#lvlHEIGHT-1
	BCS	L7F6E
	INC	theY
	BNE	L7F25

*-------------------------------
* SAVE THE LEVEL
*-------------------------------

saveLEVEL
	LDA	theY	; save parms
	PHA
	LDA	theX
	PHA

	LDA	#$01	; check disk
	JSR	readSCORE
	CMP	#$00
	BNE	L7FAD
	JSR	tellNODATADISK
	JMP	L7FC5

L7FAD	CMP	#$01
	BNE	L7FB7
	JSR	tellMASTERDISK
	JMP	L7FC5

L7FB7	JSR	encodeLEVEL	; prepare the level & save it
	PLA
	STA	theX
	PLA
	STA	theY
	LDA	#$01
	STA	fgCHANGE
	RTS		; and return

L7FC5	LDA	#$00
	STA	theX
	STA	theY
	JMP	L7F25

*-------------------------------
* CTRL-S - SAVE YOUR GAME 
*-------------------------------

editSAVE	JSR	saveLEVEL
	JMP	L7F25

*-------------------------------
* RIGHT ARROW - NEXT LEVEL 
*-------------------------------

editLOAD	LDA	intLEVEL
	CMP	#maxLEVEL-1	; 150-1
L7FD8	BEQ	L7F6E
	JSR	editSAVECHANGES
	INC	intLEVEL
	INC	theLEVEL
	JMP	editEDITLEVEL

*-------------------------------
* LEFT ARROW - PREVIOUS LEVEL
*-------------------------------

editPREVIOUS
	LDA	intLEVEL
	BEQ	L7FD8
	JSR	editSAVECHANGES
	DEC	theLEVEL
	DEC	intLEVEL
	JMP	editEDITLEVEL

*-------------------------------
* CTRL-Q - QUIT GAME GENERATOR 
*-------------------------------

editQUIT	JSR	editSAVECHANGES
	JMP	editMAIN

*-------------------------------
* WANT TO SAVE CHANGES
*-------------------------------

editSAVECHANGES
	LDA	fgCHANGE
	BNE	L8075
	JSR	clearHGR1	; was 2
	LDA	#>oldHGR1	; was 2
	STA	activePAGE
	LDA	#$00
	STA	theX
	STA	theY
	JSR	printSTRING
	ASC	"LEVEL HAS BEEN CHANGED BUT"8D
	ASC	"NOT SAVED. DO YOU WISH TO"8D
	ASC	"SAVE MODIFIED LEVEL (Y/N) "00
	JSR	doBEEP
*	STA	TXTPAGE2
L8062	LDA	#$00
	JSR	L85F3
*	STA	KBDSTROBE
	CMP	#chrN
	BEQ	L8075
	CMP	#chrY
	BNE	L8062
	JSR	saveLEVEL
L8075
*	STA	TXTPAGE1
	lda	ptrSCREEN+2
	sta	ptrHGR1+2
	lda	#>oldHGR1
	sta	hgrPAGE
*	LDA	#$00
*	STA	theX
*	STA	theY
	RTS

*-----------------------------------
* CHECK DISK
*-----------------------------------

checkDISK	LDA	#$01	; load score
	JSR	readSCORE
	CMP	#$00	; 00 means disk not identified
	BNE	L808E
	JSR	tellNODATADISK
	JMP	editMAIN
L808E	CMP	#$01	; 01 means master disk
	BNE	L8105
	JSR	tellMASTERDISK
	JMP	editMAIN

*-----------------------------------
* MASTER DISK FOUND
*-----------------------------------

tellMASTERDISK
	JSR	clearHGR1	; was 2
	LDA	#>oldHGR1	; was 2
	STA	activePAGE
	LDA	#$00
	STA	theX
	STA	theY
	JSR	printSTRING
	ASC	"USER NOT ALLOWED TO"8D
	ASC	"MANIPULATE MASTER DISKETTE."00

*-----------------------------------
* WAIT FOR A KEYPRESS
*-----------------------------------

L80D8	JSR	printSTRING
	ASC	8D8D
	ASC	"HIT A KEY TO CONTINUE "00
	JSR	doBEEP
*	STA	TXTPAGE2
	LDA	#$00
	JSR	L85F3
*	STA	KBDSTROBE
*	STA	TXTPAGE1
	lda	ptrSCREEN+2
	sta	ptrHGR1+2
	lda	#>oldHGR1
	sta	hgrPAGE
L8105	RTS

*-----------------------------------
* LR DATA DISK NOT IDENTIFIED
*-----------------------------------

tellNODATADISK
	JSR	clearHGR1	; was 2
	LDA	#>oldHGR1	; was 2
	STA	activePAGE
	LDA	#$00
	STA	theX
	STA	theY
	JSR	printSTRING
	ASC	"DISKETTE IN DRIVE IS NOT A"8D
	ASC	"LODE RUNNER DATA DISK."00
	JMP	L80D8

*-----------------------------------
* BLINK AT XY
*-----------------------------------

blinkATXY
	LDY	theY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	theX
	LDA	(ptrBOARD),Y
	JSR	blinkSPRITE
*	STA	KBDSTROBE
	RTS

tblEDITKEYS
*	ASC	"JIKM"
	asc	"JILK"	; like the game!!
	HEX	9395889100

tblEDITCODE	DA	editLEFT-1	; J move left
	DA	editUP-1	; I move up
	DA	editRIGHT-1	; K move right
	DA	editDOWN-1	; M move down
	DA	editSAVE-1	; CTRL-S to save your game
	DA	editLOAD-1	; CTRL-U to load next level
	DA	editPREVIOUS-1	; CTRL-H to load previous level
	DA	editQUIT-1	; CTRL-Q to quit game generator

*-------------------------------
* INPUT LEVEL NUMBER
*-------------------------------

inputLEVEL
	LDY	intLEVEL
	INY
	TYA
	JSR	hex2dec
	LDA	theX
	STA	L824E
	ldx	#0	; was Y
L8189	lda	theCENTAINE,x
	stx	L824D
	JSR	outputCHAR
	ldx	L824D
	inx
	cpx	#$03
	BCC	L8189

	LDA	L824E
	STA	theX
	LDY	#$00
	STY	L824D
L81A4	LDX	L824D
	LDA	theCENTAINE,X
	CLC
	ADC	#spr0	; spr0
	JSR	blinkSPRITE
*	STA	KBDSTROBE
	CMP	#chrRET	; return
	BEQ	L820D
	CMP	#chrLA	; left arrow
	BNE	L81C7
	LDX	L824D
	BEQ	L8207
	DEC	L824D
	DEC	theX
	JMP	L81A4

L81C7	CMP	#chrRA	; right arrow
	BNE	L81DA
	LDX	L824D
	CPX	#$02
	BEQ	L8207
	INC	theX
	INC	L824D
	JMP	L81A4

L81DA	CMP	#chrESC	; esc
	BNE	L81E1
	JMP	editLOOP

L81E1	CMP	#chrZERO	; 0
	BCC	L8207
	CMP	#chrNINE+1	; 9+1
	BCS	L8207
	SEC
	SBC	#chrZERO
*	LDY	L824D
*	STA	|$0089,Y
	ldx	L824D
	sta	theCENTAINE,x
	JSR	outputCHAR

	INC	L824D
	LDA	L824D
	CMP	#$03
	BCC	L81A4
	DEC	L824D
	DEC	theX
	JMP	L81A4

L8207	JSR	doBEEP
	JMP	L81A4

*-------------------------------
* TRANSFORM A ASC NUMBER IN HEX
*-------------------------------

L820D	LDA	L824E
	CLC
	ADC	#$03
	STA	theX
	LDA	#$00
	LDX	theCENTAINE
	BEQ	L8223
	CLC
L821C	ADC	#100
	BCS	L823C
	DEX
	BNE	L821C
L8223	LDX	theDIZAINE
	BEQ	L822F
	CLC
L8228	ADC	#10
	BCS	L823C
	DEX
	BNE	L8228
L822F	CLC
	ADC	theUNITE
	BCS	L823C
	STA	theLEVEL
	TAY
	DEY
	STY	intLEVEL	; and make it our level
	CPY	#maxLEVEL
L823C	RTS

editWAITKEY	LDA	#sprEMPTY
	JSR	blinkSPRITE
*	STA	KBDSTROBE
	and	#maskUPPER	; lowercase support
	CMP	#$9B	; escape
	BNE	L824C
	JMP	editLOOP

L824C	RTS

L824D	DB	$60
L824E	DB	$85
L824F	DB	$0F	; level from
L8250	DB	$60	; level to

L8251	HEX	02110F040000FE000000000000000000
	HEX	00000000000000000000000000000000
	HEX	000000000000007A0000000000000000
	HEX	FFFF0000230F0001
L8289	HEX	220F8888888888888888CCCFC4C5A0D2
	HEX	D5CECEC5D2A0C4C1D4C1A0C4C9D3CBA0
	HEX	A0

*---------------------------------------
* PRINT CHAR - TATA
*---------------------------------------

coutHGR1	STA	theA	; char in $1E
	LDA	#>oldHGR1	; print HGR1
	BNE	L82B4

coutHGR2	STA	theA	; char in $1E
	LDA	#>oldHGR2	; print HGR2

L82B4	STA	hgrPAGE	; page in $1F

	LDY	theY	; take Y
	ldx	theX
	JSR	getXY
	STY	theYSCREEN	; make it Y screen
	stx	theXSCREEN
	jsr	setHGRPOINTER

	rep	#$30

	lda	theXSCREEN	; Y for column
	and	#$ff
	clc
	adc	ptrHGR1
	sta	ptrHGR1
	
	lda	theA	; X for sprite
	and	#$ff
	asl
	tax
patchSPR1	lda	tblSPRITES,x
	sta	ptrSPR

	lda	#sprHEIGHT
	sta	nbLINES2

outerCOUT	lda	#0
	tax
	tay

	sep	#$30

]lp	lda	(ptrSPR),y
	sta	[ptrHGR1],y
	iny
	cpy	#sprBYTES
	bcc	]lp
	
	rep	#$30

	lda	ptrHGR1
	clc
	adc	#160
	sta	ptrHGR1
	
	lda	ptrSPR
	clc
	adc	#sprBYTES
	sta	ptrSPR
	
	dec	nbLINES2
	bne	outerCOUT
	sep	#$30
	rts

	mx	%11

*---------------------------------------
* DRAW SPRITE AT X,Y - TOTO
*---------------------------------------
* draw a sprite at real HGR X,Y (eg. 175,111)

drawSPRITEXY
	stx	theXSCREEN
	STY	theYSCREEN
	STA	theA
	jsr	setHGRPOINTERS
	
	rep	#$30

	lda	theXSCREEN	; Y for column
	and	#$ff
	clc
	adc	ptrHGR1
	sta	ptrHGR1
	sta	ptrHGR2
	
	lda	theA	; X for sprite
	and	#$ff
	asl
	tax
patchSPR2	lda	tblSPRITES,x
	sta	ptrSPR

	lda	#sprHEIGHT
	sta	nbLINES2

outerDSXY	lda	#0
	tax
	tay

	sep	#$30

]lp	lda	(ptrSPR),y
	tax
	and	tblMASK,x
	ora	[ptrHGR2],y
	sta	[ptrHGR1],y

	iny
	cpy	#sprBYTES
	bcc	]lp
	
	rep	#$30

	lda	ptrHGR2
	clc
	adc	#160
	sta	ptrHGR2
	sta	ptrHGR1
	
	lda	ptrSPR
	clc
	adc	#sprBYTES
	sta	ptrSPR
	
	dec	nbLINES2
	bne	outerDSXY
	sep	#$30
	rts

	mx	%11

*---------------------------------------
* DRAW SPRITE AT X,Y WITH COLLISION - TUTU
*---------------------------------------
* $52: 00 if no collision (empty background)
*    <>00 if collision

drawSPRXYCOLLISION
	stx	theXSCREEN
	STY	theYSCREEN
	STA	theA
	jsr	setHGRPOINTERS
	LDX	#$00
	STX	fgCOLLISION

	rep	#$30

	lda	theXSCREEN	; Y for column
	and	#$ff
	clc
	adc	ptrHGR1
	sta	ptrHGR1
	sta	ptrHGR2
	
	lda	theA	; X for sprite
	and	#$ff
	asl
	tax
patchSPR3	lda	tblSPRITES,x
	sta	ptrSPR

	lda	#sprHEIGHT
	sta	nbLINES2

outerXYCOL	lda	#0
	tax
	tay
	
	sep	#$30

]lp	lda	[ptrHGR1],Y	; 0..1
	eor	[ptrHGR2],Y	; si HGR1=HGR2 => 0
	tax
	and	tblMASK,x
	ora	fgCOLLISION
	sta	fgCOLLISION

	lda	[ptrHGR2],y	; 0..1
	tax
	and	tblMASK,x
	ora	(ptrSPR),y
	sta	[ptrHGR1],y

	iny
	cpy	#sprBYTES
	bcc	]lp
	
	rep	#$30

	lda	ptrHGR2
	clc
	adc	#160
	sta	ptrHGR2
	sta	ptrHGR1
	
	lda	ptrSPR
	clc
	adc	#sprBYTES
	sta	ptrSPR
	
	dec	nbLINES2
	bne	outerXYCOL
	sep	#$30
	rts

	mx	%11

*---------------------------------------
* CHECK HIGH SCORE
*---------------------------------------

checkHIGHSCORE
	LDA	fgGOODSTART
	BEQ	L8514
	LDA	theSCORE
	ORA	theSCORE+1
	ORA	theSCORE+2
	ORA	theSCORE+3
	BEQ	L8514
	LDA	#$01
	JSR	readSCORE
	BEQ	L8514
	LDY	#$01	; 1ère entrée
L84DF	LDX	scoreoffset,Y
	LDA	theLEVEL
	CMP	scorebuf+$03,X
	BCC	L850F
	BNE	L8515
	LDA	theSCORE+3
	CMP	scorebuf+$04,X
	BCC	L850F
	BNE	L8515
	LDA	theSCORE+2
	CMP	scorebuf+$05,X
	BCC	L850F
	BNE	L8515
	LDA	theSCORE+1
	CMP	scorebuf+$06,X
	BCC	L850F
	BNE	L8515
	LDA	theSCORE
	CMP	scorebuf+$07,X
	BCC	L850F
	BNE	L8515
L850F	INY
	CPY	#$0B	; dernière entrée
	BCC	L84DF
L8514	RTS

L8515	CPY	#$0A	; décale les scores vers le bas
	BEQ	L8536
	STY	tempY1
	LDY	#$09
L851D	LDX	scoreoffset,Y
	LDA	#$08
	STA	nbLINES
L8524	LDA	scorebuf,X
	STA	scorebuf+$08,X
	INX
	DEC	nbLINES
	BNE	L8524
	CPY	tempY1
	BEQ	L8536
	DEY
	BNE	L851D

L8536	LDX	scoreoffset,Y	; permet la saisie des initiales
	LDA	#chrSPC
	STA	scorebuf,X
	STA	scorebuf+$01,X
	STA	scorebuf+$02,X
	LDA	theLEVEL
	STA	scorebuf+$03,X
	LDA	theSCORE+3
	STA	scorebuf+$04,X
	LDA	theSCORE+2
	STA	scorebuf+$05,X
	LDA	theSCORE+1
	STA	scorebuf+$06,X
	LDA	theSCORE
	STA	scorebuf+$07,X
	STY	$69
	LDA	scoreoffset,Y
	clc
	adc	#<scorebuf
	STA	L8582+1
	STA	L85C9+1
	JSR	showALLSCORES
*	LDA	#>oldHGR2
	lda	#>oldHGR1
	STA	activePAGE
	LDA	$69
	CLC
	ADC	#$04
	STA	theY
	LDA	#$07
	STA	theX
	LDX	#$00
	STX	L824D
L857F	LDX	L824D
L8582	LDA	scorebuf,X
	JSR	filterCHAR
	JSR	L85F3
*	STA	KBDSTROBE
	CMP	#chrRET
	BEQ	L85E7
	CMP	#chrLA
	BNE	L85A3
	LDX	L824D
	BEQ	L85E1
	DEC	L824D
	DEC	theX
	JMP	L857F

L85A3	CMP	#chrRA
	BNE	L85B6
	LDX	L824D
	CPX	#$02
	BEQ	L85E1
	INC	theX
	INC	L824D
	JMP	L857F

L85B6	CMP	#chrDOT
	BEQ	L85C6
	CMP	#chrSPC
	BEQ	L85C6
	and	#maskUPPER	; for lowercase
	CMP	#chrA
	BCC	L85E1
	CMP	#chrZ+1
	BCS	L85E1
L85C6	LDY	L824D
L85C9	STA	scorebuf,Y
	JSR	printCHAR
	INC	L824D
	LDA	L824D
	CMP	#$03	; max nb chars
	BCC	L857F
	DEC	L824D
	DEC	theX
	JMP	L857F

L85E1	JSR	doBEEP
	JMP	L857F

L85E7	LDA	#>oldHGR1
	STA	activePAGE
	LDA	#$02
	JSR	readSCORE
	JMP	L618E

L85F3	STA	bsDATA
L85F6	LDA	#$68
	STA	counter
	LDA	bsDATA
	BNE	L8601
	LDA	#sprCURSOR
L8601	JSR	coutHGR1	; not 2
L8604	jsr	checkKEY
*	LDA	KBD
	BMI	L8628
	JSR	checkMOVEMENT
	DEC	counter
	BNE	L8604
	LDA	#sprEMPTY
	JSR	coutHGR1	; not 2
	LDA	#$68
	STA	counter
L8619	jsr	checkKEY
*	LDA	KBD
	BMI	L8628
	JSR	checkMOVEMENT
	DEC	counter
	BNE	L8619
	JMP	L85F6

L8628	PHA
	LDA	bsDATA
	JSR	coutHGR1	; not 2
	PLA
	RTS

*-----------------------------------
* SHOW INVISIBLE LADDERS
*-----------------------------------

showINVISIBLELADDERS
	LDA	#$00
	STA	tblLADDERIX
	LDX	idxLADDERI
	STX	L869E
L863B	LDX	L869E
	BEQ	L8696
	LDA	tblLADDERIX,X
	BMI	L8690
	STA	theX
	LDA	tblLADDERIY,X
	STA	theY
	TAY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	theX
	LDA	(ptrBBACK),Y
	BNE	L868B
	LDA	#sprLADDER
	STA	(ptrBBACK),Y
	LDA	(ptrBOARD),Y
	BNE	L8670
	LDA	#sprLADDER
	STA	(ptrBOARD),Y
L8670	LDA	#sprLADDER
	JSR	coutHGR2
	LDX	theX
	LDY	theY
	JSR	getXY
	LDA	#sprLADDER
	JSR	drawSPRXYCOLLISION
	LDX	L869E
	LDA	#$FF
	STA	tblLADDERIX,X
	BMI	L8690
L868B	LDA	#$01
	STA	tblLADDERIX
L8690	DEC	L869E
	JMP	L863B

L8696	LDA	tblLADDERIX
	BNE	L869D
	DEC	nbCHEST
L869D	RTS

L869E	DB	$00

*-----------------------------------
* WAIT KEY UP
*-----------------------------------
*
*waitKEYUP	STA	KBDSTROBE
*	LDA	KBD
*	BMI	waitKEYUP
*	RTS
*
*-----------------------------------
* WAIT KEY DOWN
*-----------------------------------
*
*waitKEYDOWN	LDA	KBD
*	BPL	waitKEYDOWN
*	STA	KBDSTROBE
*	RTS
*
*-----------------------------------
* WAIT
*-----------------------------------

doWAIT	LDA	L86BE,X
	TAX
doWAIT1	LDY	#$B4
]lp	DEY
	BNE	]lp
	DEX
	BNE	doWAIT1
	RTS

* index                 000102030405060708090A0B0C0D0E0F
*                       --------------------------------
L86BE	HEX	020406080A0C0E10121416181A1C1E20
	hex	222426282a2c2e30323436383a3c3e40

*-----------------------------------
* The CTRL-G of Lode Runner
*-----------------------------------

doBEEP	LDY	#$C0
L86D0	LDX	#$80
L86D2	DEX
	BNE	L86D2
	LDA	fgSOUND
	BEQ	L86DC
	LDAL	SPKR
L86DC	DEY
	BNE	L86D0
	RTS

*-----------------------------------
* PRINT STRING
*-----------------------------------

printSTRING
	PLA
	STA	ptrSTRSND
	PLA
	STA	ptrSTRSND+1
	BNE	L86F1
L86E8	LDY	#$00
	LDA	(ptrSTRSND),Y
	BEQ	L86F9
	JSR	printCHAR
L86F1	INC	ptrSTRSND
	BNE	L86E8
	INC	ptrSTRSND+1
	BNE	L86E8
L86F9	LDA	ptrSTRSND+1
	PHA
	LDA	ptrSTRSND
	PHA
	RTS

*-----------------------------------
* BLINK SPRITE
*-----------------------------------
* sprite is in A

blinkSPRITE
	STA	bsDATA
L8703	LDA	#$68
	STA	counter
	LDA	#sprEMPTY
	LDX	bsDATA
	BNE	L8710
	LDA	#sprCURSOR	; cursor sprite
L8710	JSR	coutHGR1	; output empty
L8713	jsr	checkKEY
*	LDA	KBD	; key pressed?
	BMI	L873C	; yes
	JSR	checkMOVEMENT	; buttons pressed?
	BCS	L873C	; yes
	DEC	counter
	BNE	L8713
	LDA	bsDATA	; output sprite
	JSR	coutHGR1
	LDA	#$68	; redo the wait
	STA	counter
L872B	jsr	checkKEY
*	LDA	KBD
	BMI	L873C
	JSR	checkMOVEMENT
	BCS	L873C
	DEC	counter
	BNE	L872B
	JMP	L8703

L873C	PHA		; exit with
	LDA	bsDATA	; sprite
	JSR	coutHGR1
	PLA
	RTS

bsDATA	DB	$06

*-----------------------------------
* READ JOYPAD
*-----------------------------------

readJOYPAD	jsr	read4PLAY

	ldx	#ctrJOY	; default values
	ldy	#ctrJOY

	ror		; test up
	bcc	readJOYP1	;  no
	ldy	#0	;  yes
readJOYP1	ror		; test down
	bcc	readJOYP2	;  no
	ldy	#255	;  yes
readJOYP2	ror		; test left
	bcc	readJOYP3	;  no
	ldx	#0	;  yes
readJOYP3	ror		; test right
	bcc	readJOYP4	;  no
	ldx	#255	;  yes
	
readJOYP4	stx	theX	; store values
	sty	theY
	rts

*-----------------------------------
* READ JOYSTICK
*-----------------------------------

readJOYSTICK
	LDA	#$00
	STA	theJOYX
	STA	theJOYY
	LDAL	PTRIG
L874F	LDX	#$01
L8751	LDAL	PADDL0,X
	BPL	L8769
	INC	theJOYX,X
L8758	DEX
	BPL	L8751
	LDAL	PADDL0
	ORAL	PADDL1
	BPL	L876C
	LDA	theJOYX
	ORA	theJOYY
	BPL	L874F
L8769	NOP
	BPL	L8758
L876C	RTS

*-----------------------------------
* CHECK MOVEMENT
*-----------------------------------

checkMOVEMENT
	LDA	fgINPUT
	CMP	#chrK
	BEQ	L8798
	cmp	#chrJ
	beq	checkMOV1
	cmp	#chrP
	bne	L8798

	jsr	readJOYPAD
	lda	the4PLAY	; check buttons state now
	bmi	L8796
	bvs	L8796
	bra	checkMOV2	; now check movement

checkMOV1	JSR	readJOYSTICK
	LDAL	BUTN1
	BMI	L8796
	LDAL	BUTN0
	BMI	L8796

checkMOV2	LDA	theJOYX
	CMP	#minJOY
	BCC	L8796
	CMP	#maxJOY
	BCS	L8796
	LDA	theJOYY
	CMP	#minJOY
	BCC	L8796
	CMP	#maxJOY
	BCS	L8796
	CLC
	RTS
L8796	SEC
	RTS

L8798	LDX	#$02	; wait routine
L879A	DEY		; to compensate
	BNE	L879A	; the skipped code above
	DEX
	BNE	L879A
	CLC
	RTS

*-----------------------------------
* CHECK JOYSTICK
*-----------------------------------

checkJOYSTICK
	LDAL	PTRIG
	LDX	#$10
L87A7	LDAL	PADDL0
	ORAl	PADDL1
	BPL	L87B9
	DEY
	BNE	L87A7
	DEX
	BNE	L87A7
	LDA	#chrK
	STA	fgINPUT
L87B9	RTS

*-----------------------------------
* PLAY A SOUND
*-----------------------------------

playNOTE	STA	ptrDATA
	STX	ptrDATA+1
L87BE	LDA	fgSOUND
	BEQ	L87C5
	LDAL	SPKR
L87C5	DEY
	BNE	L87CC
	DEC	ptrDATA+1
	BEQ	L87D4
L87CC	DEX
	BNE	L87C5
	LDX	ptrDATA
	JMP	L87BE
L87D4	RTS

*-----------------------------------
* GET NOTE
*-----------------------------------

getNOTE	INC	idxNOTE
	LDY	idxNOTE
	STA	sndNOTE,Y
	TXA
	STA	sndDURATION,Y
	RTS

*-----------------------------------
* PREPARE SOUND
*-----------------------------------

prepareMELODY
	PLA
	STA	ptrSTRSND
	PLA
	STA	ptrSTRSND+1
	BNE	L8802
L87E9	LDY	#$00	; move sound
	LDA	(ptrSTRSND),Y	; to the two
	BEQ	L880A	; buffers
	INC	idxNOTE
	LDX	idxNOTE
	STA	sndDURATION,X
	INY
	LDA	(ptrSTRSND),Y
	STA	sndNOTE,X
	INC	ptrSTRSND
	BNE	L8802
	INC	ptrSTRSND+1
L8802	INC	ptrSTRSND
	BNE	L87E9
	INC	ptrSTRSND+1
	BNE	L87E9
L880A	LDA	ptrSTRSND+1
	PHA
	LDA	ptrSTRSND
	PHA
	RTS

*-----------------------------------
* PLAY MELODY
*-----------------------------------

playMELODY	LDY	idxNOTE
	BEQ	L8832
	LDA	sndNOTE,Y
	LDX	sndDURATION,Y
	JSR	playNOTE	; play note
	LDY	idxNOTE
	DEC	idxNOTE
	LDA	theSPEED
	SEC
	SBC	sndDURATION,Y
	BEQ	L8830
	BCC	L8830
	TAX
	JSR	doWAIT1	; wait
L8830	SEC
	RTS

L8832	LDA	fgHEROFELL	; is the hero in a hole?
	BNE	L8844	; yes
	LDA	fgSPEED
	LSR
	INC	fgSPEED
	LDX	theSPEED
	INX
	INX
	JSR	playNOTE
	CLC
	RTS

L8844	LDX	theSPEED	; wait....
	JSR	doWAIT
	CLC
	RTS

*-------------------------------
* SET BOARD LINE POINTERS
*-------------------------------

setBOARDLINEPOINTERS
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	lda	tblBOARDBACKL,y
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	RTS

*-------------------------------
* FROM A Y IN TEXT TO A Y IN HGR
*-------------------------------

getXY	LDA	ytable,Y	;  in: board X/Y
	PHA		; out: hgr X/Y
	LDA	xtable,X
	TAX
	PLA
	TAY
	RTS

*getBYBI	LDA	bytable,X	;  in: board X
*	PHA		; out: A: HGR column (0..39)
*	LDA	bitable,X	;      X: sprite table (0..6)
*	TAX
*	PLA
*	RTS

*getXBYBI	LDA	xbytable,X	;  in: X: HGR x-coord
*	PHA		; out: A: HGR column (0..39)
*	LDA	xbitable,X	;      X: sprite table (0..6)
*	TAX
*	PLA
*	RTS

*-------------------------------
* CALCULATE HGR Y-COORD
*-------------------------------
* on entry:
*  X is a sprite step
*  Y is a board index
* on exit:
*  X is garbage
*  Y is the HGR coordinate

calcHGRY	TXA		;  in: board X/Y
	PHA		; out: hgr X / diff Y
	JSR	getXY
	PLA
	TAX
	TYA
	CLC
	ADC	tblDELTAY,X
	TAY
	RTS

tblDELTAY	HEX	FBFD000204	; -5, -3, 0, 2, 4

*-------------------------------
* CALCULATE HGR X-COORD
*-------------------------------
* on entry:
*  X is a board index
*  Y is a sprite step
* on exit:
*  X is the HGR coordinate
*  Y is garbage

calcHGRX	TYA
	PHA
	JSR	getXY
	PLA
	TAY
	TXA		; X in HGR + Y step
	CLC
	ADC	tblDELTAX,Y
	TAX
	RTS

tblDELTAX	HEX	FEFF000102	; -2, -1, 0, 1, 2

*-------------------------------
* CIRCLE ANIMATION - LOGO
*-------------------------------

caMAXSTEP	=	170	; 170
caDFTCENY	=	88
caDFTCENX	=	160	; 140

circleANIMATION
	LDA	#caDFTCENY	; 88
	STA	caCENTERY
	LDA	#caDFTCENX	; 140
	STA	caCENTERX
	LDA	fgCIRCLE	; inner or outer animation?
	BEQ	L88BD	; show the level

*--- hide the level

	LDX	#caMAXSTEP	; 170
	STX	caCURRENTY
	LDX	#0	; 0
	STX	caFGMODE
L88B6	JSR	caDOIT
	DEC	caCURRENTY
	BNE	L88B6

*--- show the level

L88BD	LDA	#1	; 1
	STA	caCURRENTY
	STA	fgCIRCLE
	STA	caFGMODE	; 1
	
	lda	#>oldHGR1	; was 2 **logo**
	sta	activePAGE

	JSR	printMEN
	JSR	printLEVEL
	
L88CB	JSR	caDOIT
	INC	caCURRENTY
	LDA	caCURRENTY
	CMP	#caMAXSTEP
	BNE	L88CB
	RTS

*---

caMAXMASK	=	1	; HGR: 6, SHR: 1

caDOIT	LDA	caCURRENTY
	STA	caY16
	LDA	#$00
	STA	caY16+1

	STA	caFROM	; from 0
	STA	caFROM+1

	LDA	caY16	; to Y*2
	ASL
	STA	caTO
	LDA	caY16+1
	ROL
	STA	caTO+1
	
	LDA	#$03	; corrige de 3
	SEC
	SBC	caTO
	STA	caTO
	LDA	#$00
	SBC	caTO+1
	STA	caTO+1

*--- On calcule les Y

	LDA	caCENTERY	; Point 1
	SEC		; vers le haut
	SBC	caCURRENTY
	STA	caY1
	LDA	#$00
	SBC	#$00
	STA	caY1high

	LDA	caCENTERY	; Point 2
	STA	caY4	; Point 3
	STA	caY3

	LDA	#$00
	STA	caY4high
	STA	caY3high

	LDA	caCENTERY	; Point 4
	CLC		; vers le bas
	ADC	caCURRENTY
	STA	caY2
	LDA	#$00
	ADC	#$00
	STA	caY2high

*--- On calcule les X

	LDA	caCENTERX	; points à gauche
	SEC
	SBC	caCURRENTY
	TAX
	LDA	#$00
	SBC	#$00
	JSR	caCALCX
	STY	caX1	; x1 index
	STA	caX1mask	; x1 mask index

	LDX	caCENTERX	; points centraux
	LDA	#$00
	JSR	caCALCX
	STY	caX2
	STY	caX3
	STA	caX2mask
	STA	caX3mask

	LDA	caCENTERX	; points à droite
	CLC
	ADC	caCURRENTY
	TAX
	LDA	#$00
	ADC	#$00
	JSR	caCALCX
	STY	caX4	; x4 index
	STA	caX4mask	; x4 mask index

*-- On boucle

L8951	LDA	caFROM+1	; a-t-on tout affiché ?
	CMP	caY16+1
	BCC	L896F	; non
	BEQ	L8969
L8959	LDA	caFROM
	CMP	caY16
	BNE	L8968
	LDA	caFROM+1
	CMP	caY16+1
	BNE	L8968
	JMP	caDRAWPOINTS ; dernier point et sort
L8968	RTS		; oui

L8969	LDA	caFROM
	CMP	caY16
	BCS	L8959	; oui
L896F	JSR	caDRAWPOINTS ; non

*---

	LDA	caTO+1	; en + ou en -
	BPL	L89A7

	LDA	caFROM	; *2
	ASL
	STA	caTEMP16
	LDA	caFROM+1
	ROL
	STA	caTEMP16+1

	LDA	caTEMP16	; *4
	ASL
	STA	caTEMP16
	LDA	caTEMP16+1
	ROL
	STA	caTEMP16+1

	LDA	caTO	; temp16 += to
	CLC
	ADC	caTEMP16
	STA	caTEMP16
	LDA	caTO+1
	ADC	caTEMP16+1
	STA	caTEMP16+1

	LDA	#$06	; +=6
	CLC
	ADC	caTEMP16
	STA	caTO
	LDA	#$00
	ADC	caTEMP16+1
	STA	caTO+1
	JMP	L8A14

L89A7	LDA	caFROM
	SEC
	SBC	caY16
	STA	caTEMP16
	LDA	caFROM+1
	SBC	caY16+1
	STA	caTEMP16+1

	LDA	caTEMP16
	ASL
	STA	caTEMP16
	LDA	caTEMP16+1
	ROL
	STA	caTEMP16+1

	LDA	caTEMP16
	ASL
	STA	caTEMP16
	LDA	caTEMP16+1
	ROL
	STA	caTEMP16+1

	LDA	caTEMP16
	CLC
	ADC	#$10
	STA	caTEMP16
	LDA	caTEMP16+1
	ADC	#$00
	STA	caTEMP16+1

	LDA	caTEMP16
	CLC
	ADC	caTO
	STA	caTO
	LDA	caTEMP16+1
	ADC	caTO+1
	STA	caTO+1

	LDA	caY16
	PHP
	DEC	caY16
	PLP
	BNE	L89EC
	DEC	caY16+1
L89EC	INC	caY1
	BNE	L89F2
	INC	caY1high
L89F2	DEC	caX4mask
	BPL	L89FC
	LDA	#caMAXMASK
	STA	caX4mask
	DEC	caX4

L89FC	INC	caX1mask
	LDA	caX1mask
	CMP	#caMAXMASK+1
	BNE	L8A0A
	LDA	#$00
	STA	caX1mask
	INC	caX1
L8A0A	DEC	caY2
	LDA	caY2
	CMP	#$FF
	BNE	L8A14
	DEC	caY2high

L8A14	INC	caFROM
	BNE	L8A1A
	INC	caFROM+1

L8A1A	INC	caX3mask
	LDA	caX3mask
	CMP	#caMAXMASK+1
	BNE	L8A28
	LDA	#$00
	STA	caX3mask
	INC	caX3
L8A28	DEC	caY4
	LDA	caY4
	CMP	#$FF
	BNE	L8A32
	DEC	caY4high

L8A32	INC	caY3	; y++
	BNE	L8A38
	INC	caY3high
L8A38	DEC	caX2mask	; mask--
	BPL	L8A42
	LDA	#caMAXMASK	; reset mask
	STA	caX2mask
	DEC	caX2	; x--
L8A42	JMP	L8951

*-----------------------------------
* CALCULE LA COLONNE (X/A)
*-----------------------------------
*  in: X/A
* out: A: bit index
*      Y: column

caBI2BY	=	2	; HGR: 7, SHR: 2

caCALCX	STX	$6F
	LDY	#$08
	SEC
	SBC	#caBI2BY
L8A4C	PHP
	ROL	$70
	ASL	$6F
	ROL
	PLP
	BCC	L8A5A
	SBC	#caBI2BY
	JMP	L8A5C

L8A5A	ADC	#caBI2BY
L8A5C	DEY
	BNE	L8A4C
	BCS	L8A64
	ADC	#caBI2BY
	CLC
L8A64	ROL	$70
	LDY	$70
	RTS

*-----------------------------------
* DRAW ALL POSSIBLE POINTS
*-----------------------------------

caDRAWPOINTS
	LDY	caY2high
	BNE	L8A8C
	LDY	caY2
	CPY	#176
	BCS	L8A8C
	JSR	setHGRPOINTERS
	LDY	caX3
	CPY	#hgrWIDTH
	BCS	L8A81
	LDX	caX3mask
	JSR	caDRAW
L8A81	LDY	caX2
	CPY	#hgrWIDTH
	BCS	L8A8C
	LDX	caX2mask
	JSR	caDRAW

L8A8C	LDY	caY1high
	BNE	L8AAF
	LDY	caY1
	CPY	#176
	BCS	L8AAF
	JSR	setHGRPOINTERS
	LDY	caX3
	CPY	#hgrWIDTH
	BCS	L8AA4
	LDX	caX3mask
	JSR	caDRAW
L8AA4	LDY	caX2
	CPY	#hgrWIDTH
	BCS	L8AAF
	LDX	caX2mask
	JSR	caDRAW

L8AAF	LDY	caY3high
	BNE	L8AD2
	LDY	caY3
	CPY	#176
	BCS	L8AD2
	JSR	setHGRPOINTERS
	LDY	caX4
	CPY	#hgrWIDTH
	BCS	L8AC7
	LDX	caX4mask
	JSR	caDRAW
L8AC7	LDY	caX1
	CPY	#hgrWIDTH
	BCS	L8AD2
	LDX	caX1mask
	JSR	caDRAW

L8AD2	LDY	caY4high
	BNE	L8AF5
	LDY	caY4
	CPY	#176
	BCS	L8AF5
	JSR	setHGRPOINTERS
	LDY	caX4
	CPY	#hgrWIDTH
	BCS	L8AEA
	LDX	caX4mask
	JSR	caDRAW
L8AEA	LDY	caX1
	CPY	#hgrWIDTH
	BCS	L8AF5
	LDX	caX1mask
	JMP	caDRAW
L8AF5	RTS

*-----------------------------------
* DRAW OR HIDE BYTE
*-----------------------------------

caDRAW	LDA	caFGMODE
	BNE	L8B02
	LDA	[ptrHGR1],Y	; hide
	AND	L8B0C,X
	STA	[ptrHGR1],Y
	RTS

L8B02	LDA	[ptrHGR2],Y	; show
	AND	L8B13,X
	ORA	[ptrHGR1],Y
	STA	[ptrHGR1],Y
	RTS

*                       00 01         00 01 02 03 04 05 06
L8B0C	HEX	00,00	; F0,F0,F0,F0,8F,8F,8F
L8B13	HEX	FF,FF	; 8F,8F,8F,8F,F0,F0,F0

*-------------------------------
* SHOW GAME OVER
*-------------------------------

animGAMEOVER
	LDA	#$01
	STA	L8D4B
	LDA	#>oldHGR1
	STA	hgrPAGE

L8B23	JSR	L8BCF
	JSR	L8BBE
	JSR	L8BAD
	JSR	L8B9C
	JSR	L8B8B
	JSR	L8B7A
	JSR	L8B8B
	JSR	L8B9C
	JSR	L8BAD
	JSR	L8BBE
	JSR	L8BCF
	JSR	L8C24
	JSR	L8C13
	JSR	L8C02
	JSR	L8BF1
	JSR	L8BE0
	JSR	L8BF1
	JSR	L8C02
	JSR	L8C13
	JSR	L8C24
	LDA	L8D4B
	CMP	#$64
	BCC	L8B23
	JSR	L8BCF
	JSR	L8BBE
	JSR	L8BAD
	JSR	L8B9C
	JSR	L8B8B
	JSR	L8B7A
	CLC
	RTS

*--- Data here is a list of lines to draw

L8B7A	JSR	drawGOLINE
	HEX	000102030405060708090A020100
L8B8B	JSR	drawGOLINE
	HEX	0000010203040507090A02010000
L8B9C	JSR	drawGOLINE
	HEX	00000001020304090A0201000000
L8BAD	JSR	drawGOLINE
	HEX	000000000102030A020100000000
L8BBE	JSR	drawGOLINE
	HEX	000000000001030A010000000000
L8BCF	JSR	drawGOLINE
	HEX	0000000000000101000000000000
L8BE0	JSR	drawGOLINE
	HEX	0001020A09080706050403020100
L8BF1	JSR	drawGOLINE
	HEX	000001020A090705040302010000
L8C02	JSR	drawGOLINE
	HEX	00000001020A0904030201000000
L8C13	JSR	drawGOLINE
	HEX	0000000001020A03020100000000
L8C24	JSR	drawGOLINE
	HEX	0000000000010A03010000000000

*--- Data here is the HGR data

*L8C35	HEX	8080808080808080808080808080
*L8C43	HEX	C0AAD5AAD5AAD5AAD5AAD5AAD580
*L8C51	HEX	9080808080808080808080808082
*L8C5F	HEX	90AAD1A2D5A885A8C5A2D4A29582
*L8C6D	HEX	908291A2C5A88088C5A294A09082
*L8C7B	HEX	908290A2C4A88088C5A294A09082
*L8C89	HEX	908290A2C4A88188C4A2D4A09582
*L8C97	HEX	90A2D1A2C4888088C4A284A08582
*L8CA5	HEX	908291A2C4888088C4AA84A08582
*L8CB3	HEX	908291A2C4888088C48A84A09182
*L8CC1	HEX	90AA91A2C4A885A88582D4A29182

*L8CCF	DA	L8C35-$D
*	DA	L8C43-$D
*	DA	L8C51-$D
*	DA	L8C5F-$D
*	DA	L8C6D-$D
*	DA	L8C7B-$D
*	DA	L8C89-$D
*	DA	L8C97-$D
*	DA	L8CA5-$D
*	DA	L8CB3-$D
*	DA	L8CC1-$D

* The new GAME OVER     000102 03040506 07 08090A 0B 0C0D0E0F10 11 12131415 161718 191A1B1C 1D 1E1F2021 22 23242526 27 28292A2B 2C 2D2E

L8C35	hex	000000,00000000,00,000000,00,0000000000,00,00000000,000000,00000000,00,00000000,00,00000000,00,00000000,00,0000
L8C43	hex	000066,66666666,66,666666,66,6666666666,66,66666666,666666,66666666,66,66666666,66,66666666,66,66666666,60,0000
L8C51	hex	006000,00000000,00,000000,00,0000000000,00,00000000,000000,00000000,00,00000000,00,00000000,00,00000000,00,6000
L8C5F	hex	006000,66666660,00,666660,00,6666666660,00,66666660,000000,06666666,00,66600060,00,66666660,00,66666660,00,6000
L8C6D	hex	006000,60000060,00,600060,00,6666600060,00,66600000,000000,06000666,00,66600060,00,66600000,00,60000060,00,6000
L8C7B	hex	006000,60000000,00,600060,00,6000600060,00,66600000,000000,06000666,00,66600060,00,66600000,00,60000060,00,6000
L8C89	hex	006000,60000000,00,600060,00,6000600060,00,66666000,000000,06000006,00,66600060,00,66666000,00,66666660,00,6000
L8C97	hex	006000,60006660,00,666660,00,6000600060,00,60000000,000000,06000006,00,66600060,00,60000000,00,66666000,00,6000
L8CA5	hex	006000,60000060,00,600060,00,6000600060,00,60000000,000000,06000006,00,66666660,00,60000000,00,66666000,00,6000
L8CB3	hex	006000,60000060,00,600060,00,6000600060,00,60000000,000000,06000006,00,66666000,00,60000000,00,66600060,00,6000
L8CC1	hex	006000,66666660,00,600060,00,6000600060,00,66666660,000000,06666666,00,00600000,00,66666660,00,66600060,00,6000
	
L8CCF	DA	L8C35
	DA	L8C43
	DA	L8C51
	DA	L8C5F
	DA	L8C6D
	DA	L8C7B
	DA	L8C89
	DA	L8C97
	DA	L8CA5
	DA	L8CB3
	DA	L8CC1

drawGOLINE	PLA		; pour afficher game over
	STA	ptrDATA
	PLA
	STA	ptrDATA+1
	LDY	#$50	; 1ère ligne
	STY	theY
	BNE	L8D12
L8CF1	JSR	setHGRPOINTER
	LDY	#$00
	LDA	(ptrDATA),Y
	ASL
	TAX
	LDA	L8CCF,X
	STA	L8D08+1
	LDA	L8CCF+1,X
	STA	L8D08+2

*	LDY	#$0D	; 1ère colonne
	ldy	#$39
	ldx	#0
L8D08	LDA	L8D08,x
	STA	[ptrHGR1],Y
	INY
*	CPY	#$1B	; dernière colonne
	inx
	cpx	#$2f
	BCC	L8D08
L8D12	JSR	L8D4C
	INC	theY
	LDY	theY
	CPY	#$5F	; dernière ligne
	BCC	L8CF1

	LDX	L8D4B
	LDY	#$FF
L8D22	DEY
	BNE	L8D22
	DEX
	BNE	L8D22
	INC	L8D4B

	LDA	fgINPUT
	CMP	#chrK
	BEQ	L8D3B
	cmp	#chrJ
	beq	L8D23
	cmp	#chrP
	bne	L8D3B

	jsr	read4PLAY
	bmi	L8D41	; button 1 pressed?
	bvs	L8D41	; button 2 pressed?
	bvc	L8D3B

L8D23	LDAL	BUTN1
	BMI	L8D41
	LDAL	BUTN0
	BMI	L8D41

*	LDA	KBD
L8D3B	jsr	checkKEY
	BMI	L8D41
	RTS

L8D41	PLA
	PLA
	SEC
*	LDA	KBD
*	STA	KBDSTROBE
	RTS

L8D4B	DB	$9D

L8D4C	INC	ptrDATA
	BNE	L8D52
	INC	ptrDATA+1
L8D52	RTS

	ds	\

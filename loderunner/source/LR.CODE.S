*
* Lode Runner
* (c) 1983, Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

	mx	%11
	org	$0
	lst	off

	ds	$800

* 0 vide
* 1 mur
* 2 mur dur
* 3 échelle visible
* 4 liane
* 5 trappe
* 6 échelle invisible
* 7 trésor
* 8 ennemi
* 9 héros

* Sprite quand      heros ennemi tombe dans un trou :
* - venant de gauche : 20 53 (35h)
* - venant de droite : 19 54 (36h)
* 
*-----------------------------------
* EQUATES
*-----------------------------------

lvlWIDTH	=	28	; $1c
lvlHEIGHT	=	16	; $10

sprWIDTH	=	10
sprHEIGHT	=	11

nbLIVES	=	5
maxLEVEL	=	150
maxHEIGHT	=	192	; lines

modeEDIT	=	0	; to decode level
modeGAME	=	1

sprEMPTY	=	0
sprWALL	=	1
sprWALLI	=	2	; mur indestructible
sprLADDER	=	3
sprBAR	=	4
sprTRAP	=	5
sprLADDERI	=	6
sprCHEST	=	7
sprFOE	=	8
sprHERO	=	9
sprCURSOR	=	10
spr0	=	$3b	; until $44
sprA	=	$45	; until $5e >.()/-< (latest sprite is $65)

minJOY	=	$12	; joystick min/center/max values
ctrJOY	=	$25
maxJOY	=	$3b

*--- The big zero page usage

boardX	=	$00
boardY	=	$01
heroSTEPX	=	$02
heroSTEPY	=	$03
heroSPRITE	=	$04
fgLEFTRIGHT	=	$05
ptrBOARD	=	$06	; $06..$07: pointer to board
ptrBBACK	=	$08	; $08..$09: pointer to back board
ptrDATA	=	$0a	; $0a..$0b: pointer to data (HGR or other)
ptrHGR1	=	$0c	; $0c..$0d
ptrHGR2	=	$0e	; $0e..$0f
ptrSTRSND	=	$10	; $10..$11: pointer to some table (string, sound)
foeX	=	$12
foeY	=	$13
foeC88	=	$14
foeC90	=	$15
foeC70	=	$16
foeC78	=	$17	; coordinate
foeC80	=	$18	; coordinate
idxFOE	=	$19	; current foe index
fgODDEVEN	=	$1a
theYSCREEN	=	$1b
theXSCREEN	=	$1c
nbLINES	=	$1d
theA	=	$1e
hgrPAGE	=	$1f
CH	=	$24	; **
CV	=	$25	; **
CSWL	=	$36	; **
CSWH	=	$37	; **
KSWL	=	$38	; **
KSWH	=	$39	; **
theMASK1	=	$50
theMASK2	=	$51
fgCOLLISION	=	$52
theJOYX	=	$65
theJOYY	=	$66
sprTABLE	=	$71
theX	=	$85
theY	=	$86
activePAGE	=	$87
tempINDEX	=	$88
theCENTAINE	=	$89
theDIZAINE	=	theCENTAINE+1 ; 8a
theUNITE	=	theDIZAINE+1 ; 8b
theSPEED	=	$8c	; 8c
nbFOE	=	$8d	; 8d
theSCORE	=	$8e	; 8e..8f.90..91
idxLVLDISK	=	$92	; index in level buffer from disk
nbCHEST	=	$93	; 93
fgCHEST	=	$94	; 94 1: not a chest, 0: a chest
intLEVEL	=	$96	; 96 theLEVEL-1
fgSOUND	=	$99	; 99
fgPLAY	=	$9a	; 1: alive, 0: dead
fgHOLE	=	$9c	; -1: left hole, 0: none, 1: right hole
theKEY1	=	$9e
theKEY2	=	$9f
idxDIG	=	$a0	; dig index in sprite list
counter	=	$a1	; a simple counter
fgLVLMODE	=	$a2	; 0: edit, <>0: game
idxLADDERI	=	$a3
theLEVEL	=	$a6
fgDEMO	=	$a7
ptrDEMO	=	$a8	; $a8..$a9 - pointer to demo data
demoKEY	=	$aa	; the demo key actions
demoREPEAT	=	$ab	; the demo repeat factor
fgKEYBTN0	=	$ac	; 1: no key/btn0 pressed, 0: key/btn0 pressed
fgCHANGE	=	$ad	; 1: no change, 0: change
sprDATA	=	$df	; $df..$ff

fgINPUT	=	$95	; "J"oystick, "K"eyboard
theMEN	=	$98

chrLA	=	$88
chrRET	=	$8d
chrRA	=	$95
chrESC	=	$9b
chrSPC	=	" "
chrZERO	=	"0"
chrNINE	=	"9"
chrDOT	=	"."
chrA	=	"A"
chrI	=	"I"
chrJ	=	"J"
chrK	=	"K"
chrL	=	"L"
chrN	=	"N"
chrO	=	"O"
chrU	=	"U"
chrY	=	"Y"
chrZ	=	"Z"

*-----------------------------------
* SOFTSWITCHES
*-----------------------------------

KBD	EQU	$C000
KBDSTROBE	EQU	$C010
SPKR	EQU	$C030
TXTCLR	EQU	$C050
MIXCLR	EQU	$C052
TXTPAGE1	EQU	$C054
TXTPAGE2	EQU	$C055
HIRES	EQU	$C057
BUTN0	EQU	$C061
BUTN1	EQU	$C062
PADDL0	EQU	$C064
PADDL1	EQU	$C065
PTRIG	EQU	$C070
SETKBD	EQU	$FE89

*-----------------------------------
* DONNEES
*-----------------------------------

	put	LR.Data
	
*-----------------------------------
* PAGES GRAPHIQUES
*-----------------------------------

HGR1	ds	8192,$20
HGR2	ds	8192,$40

*-----------------------------------
* ENTRY POINT 
*-----------------------------------

L6000	JSR	checkJOYSTICK

	LDA	#$01	; read score table
	JSR	readSCORE

*--- Show title page
* Data from $0F00 to $1A84

showTITLEPAGE
	JSR	clearHGR1	; display the compressed title page
	LDA	#<logo-1
	STA	L6030+1
	LDA	#>logo-1
	STA	L6030+2
	LDY	#$00
	STY	theY
	STY	fgDEMO
	STY	intLEVEL
	LDA	#>HGR1
	STA	hgrPAGE
	STA	activePAGE
L6023	JSR	setHGRPOINTER
	LDY	#$00
L6028	INC	L6030+1
	BNE	L6030
	INC	L6030+2
L6030	LDA	L6028
	BEQ	L603F
	BPL	L603C
	STA	(ptrHGR1),Y
	INY
	BPL	L6028
L603C	TAY
	BPL	L6028
L603F	INC	theY
	LDY	theY
	CPY	#maxHEIGHT	; until line 192
	BCC	L6023
	STA	TXTPAGE1
	STA	HIRES
	STA	MIXCLR
	STA	TXTCLR
	JMP	L618E

*---

L6056	LDA	#$00
	STA	theSCORE
	STA	theSCORE+1
	STA	theSCORE+2
	STA	theSCORE+3
	STA	$97
	STA	$A5
	STA	$53
	STA	demoREPEAT
	STA	ptrDEMO	; demo actions
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

L6086	LDA	scorebuf+$FF
	BNE	L6091
	LDA	CSWL	; this code is useless
	LDX	CSWH	; if no copy protection remains
	BNE	L6095
L6091	LDA	KSWL
	LDX	KSWH
L6095	STA	CH
	STX	CV
L6099	JSR	clearHGRPAGES	; clear HGR pages and draw board
	STA	TXTPAGE1
L609F	LDX	#modeGAME
	JSR	prepareLEVEL
	LDA	#$00
	STA	theKEY1
	STA	theKEY2
	LDA	fgDEMO	; are we in demo mode?
	LSR
	BEQ	L60BF	; yes
	JSR	waitKEYUP
	LDA	boardX
	STA	theX
	LDA	boardY
	STA	theY
	LDA	#sprHERO
	JSR	blinkSPRITE
L60BF	LDX	#$00
	STX	fgHOLE
	STX	$54
	LDA	$97
	CLC
	ADC	nbFOE
	TAY
	LDX	L6214,Y
	LDA	L6CA7,X
	STA	$60
	LDA	L6CA7+1,X
	STA	$61
	LDA	L6CA7+2,X
	STA	$62
	LDY	$97
	LDA	L621D,Y
	STA	$5F

L60E4	JSR	L64BD
	LDA	fgPLAY	; are we dead?
	BEQ	L613F	; yes
	JSR	playMELODY
	LDA	nbCHEST	; remaining chests?
	BNE	L60F5	; yes
	JSR	showINVISIBLELADDERS

L60F5	LDA	boardY	; are we on top row
	BNE	L6107
	LDA	heroSTEPY	; are we going up?
	CMP	#$02
	BNE	L6107
	LDA	nbCHEST	; are there chests left?
	BEQ	L611A
	CMP	#$FF
	BEQ	L611A	; we won
	
L6107	JSR	L75F4
	LDA	fgPLAY	; are we dead?
	BEQ	L613F	; yes
	JSR	playMELODY
	JSR	L6C82
	LDA	fgPLAY
	BEQ	L613F
	BNE	L60E4	; loop
	
L611A	INC	theLEVEL
	INC	intLEVEL
	INC	theMEN	; man++
	BNE	L6124
	DEC	theMEN	; man--
L6124	LDX	#$0F
	STX	$5C
L6128	LDY	#$01
	LDA	#$00
	JSR	printSCORE
	JSR	L622A
	JSR	L622A
	JSR	L622A
	DEC	$5C
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

L618E	JSR	waitKEYUP
	LDX	#$FF
	LDY	#$FF
	LDA	#$03
	STA	theY
L6199	LDA	fgINPUT
	CMP	#chrK
	BEQ	L61A9
	LDA	BUTN1
	BMI	L6201
	LDA	BUTN0
	BMI	L6201
L61A9	LDA	KBD
	BMI	L61F6
	DEX
	BNE	L6199
	DEY
	BNE	L6199
	DEC	theY
	BNE	L6199
	LDA	fgDEMO
	BNE	L61DE
	LDX	#$01
	STX	fgDEMO
	STX	theLEVEL
	STX	fgKEYBTN0
	STX	$9D
	LDX	fgSOUND
	STX	L61D0+1
	STA	fgSOUND
	JMP	L6056

L61D0	LDA	#$00
	STA	fgSOUND
	LDA	KBD
	LDX	fgKEYBTN0
	BEQ	L61F6
	JMP	L618E

L61DE	CMP	#$01
	BNE	L61F3
	BEQ	L61E9
L61E4	LDA	#$01
	JSR	readSCORE
L61E9	JSR	L786B
	LDA	#$02
	STA	fgDEMO
	JMP	L618E
L61F3	JMP	showTITLEPAGE

L61F6	STA	KBDSTROBE
	CMP	#$85	; Ctrl-E - Editor
	BEQ	L6211
	CMP	#chrRET	; Return
	BEQ	L61E4

L6201	LDX	#$00
	STX	intLEVEL
	INX
	STX	theLEVEL
	STX	$9D
	LDA	#$02
	STA	fgDEMO
	JMP	L6056

L6211	JMP	enterEDITOR	; Jump to the Editor

L6214	HEX	000306090C0F121518	; 0..3..6..9..12..15..18..21..24
L621D	HEX	26262E4447494A4B4C4D4E4F50

L622A	LDA	$5C
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
L625A	STA	L0C98,X
	DEX
	BPL	L625A

	LDA	#$01
	STA	fgPLAY
	JSR	diskLEVEL

	LDY	theY
L6269	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
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
	INC	$97
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

diskLEVEL	STA	LB7F4
	LDA	fgDEMO
	LSR
	BEQ	L6345
	LDA	intLEVEL	; level
	LSR
	LSR
	LSR
	LSR
	CLC
	ADC	#$03
	STA	LB7EC	; track
	LDA	intLEVEL
	AND	#$0F
	STA	LB7ED	; sector

	LDA	#<levelDISK
	STA	LB7F0
	LDA	#>levelDISK
	STA	LB7F0+1
	LDA	#$00
	STA	LB7EB
L6338	LDY	#<LB7E8
	LDA	#>LB7E8
	jsr	callRWTS	; LoGo - JSR $0023 - Souvenir from protection
	BCC	L6344
	JMP	showTITLEPAGE
L6344	RTS

L6345	LDA	theLEVEL
	CLC
	ADC	#>L9E00
	STA	ptrHGR1+1
	LDY	#<L9E00
	STY	ptrHGR1
L6350	LDA	(ptrHGR1),Y
	STA	levelDISK,Y
	INY
	BNE	L6350
	RTS

*-------------------------------
* CALL RWTS
*-------------------------------

readSCORE	STA	LB7F4	; command
	LDA	#$0C
	STA	LB7EC	; track
	LDA	#$0F
	STA	LB7ED	; sector

	LDA	#<scorebuf	; where to load
	STA	LB7F0
	LDA	#>scorebuf
	STA	LB7F0+1
	LDA	#$00
	STA	LB7EB
	LDY	#<LB7E8	; IOB table
	LDA	#>LB7E8
	JSR	callRWTS
	BCC	L6381
	JMP	showTITLEPAGE

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
	LDA	#$00	; 0 means not a LR disk
	RTS

L639B	LDA	#$01	; master disk
	LDX	scorebuf+$FF
	BNE	L63A4
	LDA	#$FF	; FF means master disk
L63A4	RTS

callRWTS	JMP	$bd00	; LoGo - ($0036) to be replaced with JMP $BD00

L63A8	ASC	"LODE RUNNER"

*-----------------------------------
* DECODE A LEVEL
*-----------------------------------

decodeLEVEL	LDY	#lvlHEIGHT-1	
	STY	theY
L63B7	LDA	tblBOARDALLL,Y	; $0800
	STA	ptrBOARD
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
	STA	L0C70,X
	STA	L0C88,X
	LDA	#$02
	STA	L0C78,X
	STA	L0C80,X
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
	LDX	#$08
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

*--- Level is decode for the edit mode

L6469	LDA	#>HGR1	; copy HGR1 > HGR2
	STA	ptrHGR2+1
	LDA	#>HGR2
	STA	ptrHGR1+1
	LDA	#$00
	STA	ptrHGR2
	STA	ptrHGR1
	TAY
L6478	LDA	(ptrHGR1),Y
	STA	(ptrHGR2),Y
	INY
	BNE	L6478
	INC	ptrHGR2+1
	INC	ptrHGR1+1
	LDX	ptrHGR1+1
	CPX	#>HGR2+$20
	BCC	L6478
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

L64BD	LDA	#$01
	STA	fgCHEST
	LDA	fgHOLE
	BEQ	L64CD
	BPL	L64CA
	JMP	L67E7
L64CA	JMP	L68AD

L64CD	LDY	boardY
	LDA	tblBOARDALLL,Y
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

L6525	LDA	#$00
	STA	$9B
	JSR	calcSPRITEXY
	JSR	drawSPRITEXY
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

L6584	LDA	$9B
	BNE	L658F
	LDA	#$64
	LDX	#$08
	JSR	playSOUND
L658F	LDA	#$20
	STA	$A4
	STA	$9B
	JSR	L6A12

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

L65AE	CMP	#chrU	; dig left
	BNE	L65B8
	JSR	checkDIGLEFT
	BCS	L65C2
	RTS

L65B8	CMP	#chrO	; dig right
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
	LDA	tblBOARDALLL,Y
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
	LDA	tblBOARDALLL+1,Y
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
	JSR	L884B
	LDY	boardX	; are we on first column?
	BEQ	L67D8
	DEY
	LDA	(ptrBOARD),Y	; what do we have on our left?
	CMP	#sprWALL	; a wall?
	BNE	L67D8
	LDY	boardY	; yes
	JSR	L884B
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
	LDA	L699E,Y
	LDX	L69AB,Y
	JSR	getNOTE
	LDX	idxDIG
	LDA	#$00
	CPX	#$06
	BCS	L682B
	LDA	#$06
L682B	STA	heroINDEX
	JSR	checkCOLLISION
	LDX	idxDIG
	CPX	#$0C
	BEQ	L6898
	CPX	#$00
	BEQ	L684C
	LDA	L6979,X	; dig left - 1
	PHA
	LDX	boardX
	DEX
	LDY	boardY
	JSR	getXY
	PLA
	JSR	drawSPRITEXY
	LDX	idxDIG
L684C	LDA	L697A,X	; dig left
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
	LDA	L6992,X	; dig left
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
	LDA	L697A,X
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
	JSR	L884B
	LDY	boardX	; are we on lat column?
	CPY	#lvlWIDTH-1
	BCS	L689E
	INY
	LDA	(ptrBOARD),Y
	CMP	#sprWALL	; do we have a wall?
	BNE	L689E
	LDY	boardY
	JSR	L884B
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
	LDA	L6992,Y
	LDX	L699F,Y
	JSR	getNOTE
	LDX	idxDIG
	LDA	#$08
	CPX	#$12
	BCS	L68F3
	LDA	#$0E
L68F3	STA	heroINDEX
	JSR	checkCOLLISION
	LDX	idxDIG
	CPX	#$18
	BEQ	L6962
	CPX	#$0C
	BEQ	L6914
	LDA	L6979,X
	PHA
	LDX	boardX
	INX
	LDY	boardY
	JSR	getXY
	PLA
	JSR	drawSPRITEXY
	LDX	idxDIG
L6914	LDA	L697A,X
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
	LDA	L6986,X
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
	LDA	L697A,X
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

L6968
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
L6979	DB	$12	; 11 monte échelle step 2
L697A	DB	$1B	; 12 creuse 1
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
L6986	DB	$26	; 1E creuse droite step 1
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
L6992	DB	$1F	; 2A dig left sprites
	DB	$1F	; 2B 
	DB	$20	; 2C 
	DB	$20	; 2D 
	DB	$21	; 2E 
	DB	$21	; 2F 
	DB	$22	; 
	DB	$22	; 
	DB	$23	; 
	DB	$23	; 
	DB	$24	; 
	DB	$24	; 
L699E	DB	$20	; 
L699F	DB	$20	; 
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
L69AB	DB	$04	; 
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

L69B8	LDA	KBD
	BMI	L69CD
	LDA	fgINPUT
	CMP	#chrK
	BEQ	L69D6
	LDA	BUTN1
	BMI	L69CD
	LDA	BUTN0
	BPL	L69D6
L69CD	LSR	fgKEYBTN0
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
* DEMO MODE ENGINE ENTRY POINT
*-----------------------------------

L6A12	LDA	fgDEMO
	CMP	#$01
	BEQ	L69B8
	LDX	KBD
	STX	KBDSTROBE
	STX	theA
	BMI	L6A2B
	LDA	fgINPUT
	CMP	#chrK
	BEQ	L6A55
L6A28	JMP	getJOYSTICKKEY

L6A2B	CPX	#chrSPC
	BCS	L6A49
	STX	theA
	LDY	#$FF
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

L6A49	LDA	fgINPUT
	CMP	#chrJ
	BEQ	L6A28
	LDX	theA
	STX	theKEY1
	STX	theKEY2
L6A55	RTS

*-------------------------------
* 9E - CTRL-^ - NEXT LEVEL
*-------------------------------

doNEXTLEVEL
	INC	theMEN	; man++
	INC	theLEVEL
	INC	intLEVEL
	LSR	fgPLAY
	LSR	$9D
	RTS

*-------------------------------
* 80 - CTRL-@ - EXTRA MAN
*-------------------------------

doEXTRAMAN
	INC	theMEN	; man++
	BNE	L6A67
	DEC	theMEN	; man--
L6A67	JSR	printMEN
	LSR	$9D
	JMP	L6A12

*--- dead code

	INC	$97
	INC	theMEN	; man++
	LSR	fgPLAY
	RTS

*-------------------------------
* 9B - ESC - PAUSE GAME
*-------------------------------

doPAUSE	JSR	waitKEYDOWN
	CMP	#$9B
	BNE	doPAUSE
	JMP	L6A12

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
	JMP	L6A12

*-------------------------------
* 8A - DOWN ARROW - MOVE LEFT
*-------------------------------

doDOWNARROW	LDA	#chrJ
	STA	fgINPUT
	JMP	L6A12

*-------------------------------
* 8B - UP ARROW - MOVE DOWN
*-------------------------------

doUPARROW	LDA	#chrK
	STA	fgINPUT
	JMP	L6A12

*-------------------------------
* 98 - CTRL-X - FLIPS X-AXIS
*-------------------------------

doFLIPX	LDA	joyXMIN
	LDX	joyXMAX
	STA	joyXMAX
	STX	joyXMIN
	JMP	L6A12

*-------------------------------
* 99 - CTRL-Y - FLIPS Y-AXIS
*-------------------------------

doFLIPY	LDA	joyYMIN
	LDX	joyYMAX
	STA	joyYMAX
	STX	joyYMIN
	JMP	L6A12

*-------------------------------
* 88 - LEFT ARROW - SLOWS DOWN
*-------------------------------

doSLOWDOWN	LDA	theSPEED
	BEQ	L6ACD
	DEC	theSPEED
	JMP	L6A12

*-------------------------------
* 95 - RIGHT ARROW - SPEEDS UP
*-------------------------------

doSPEEDUP	LDA	theSPEED
	CMP	#$0F
	BEQ	L6ACD
	INC	theSPEED
L6ACD	JMP	L6A12

*-------------------------------
* GET JOYSTICK KEY
*-------------------------------

getJOYSTICKKEY
	LDA	BUTN1
	BPL	L6AD9
	LDA	#chrU	; dig
	BNE	L6AE0
L6AD9	LDA	BUTN0
	BPL	L6AE5
	LDA	#chrO	; dig
L6AE0	STA	theKEY1
	STA	theKEY2
	RTS

L6AE5	JSR	readJOYSTICK ; no keys pressed
	LDY	theJOYX	; read joystick
	LDA	joyXMAX	; clamp
	CMP	#$2E	; return key
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
	CMP	#$2E
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
	CMP	#$2E
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
	CMP	#$2E
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

tblKEY	HEX	9E809B9281938A8B889598998D00

tblKEYADR	DA	doNEXTLEVEL-1	; 9E - CTRL-^
	DA	doEXTRAMAN-1	; 80 - CTRL-@
	DA	doPAUSE-1	; 9B - ESCAPE
	DA	doTERMINATE-1	; 92 - CTRL-R
	DA	doABORTMAN-1	; 81 - CTRL-A
	DA	doTOGGLESOUND-1	; 93 - CTRL-S
	DA	doDOWNARROW-1	; 8A - DOWN ARROW
	DA	doUPARROW-1	; 8B - UP ARROW
	DA	doSPEEDUP-1	; 88 - LEFT ARROW
	DA	doSLOWDOWN-1	; 95 - RIGHT ARROW
	DA	doFLIPX-1	; 98 - CTRL-X
	DA	doFLIPY-1	; 99 - CTRL-Y
	DA	displayHIGHSCORES-1	; 8D - RETURN

joyXMIN	DB	minJOY	; x-low
joyXMAX	DB	ctrJOY	; x-high
joyYMIN	DB	minJOY	; y-low
joyYMAX	DB	ctrJOY	; y-high

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
	LDA	L6968,X
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
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1

	LDY	boardX	; are we on a chest?
	LDA	(ptrBBACK),Y
	CMP	#sprCHEST
	BNE	L6BF3

	LSR	fgCHEST	; collision avec un coffre
	DEC	nbCHEST	; chest--

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
* 
*-----------------------------------

L6C82	LDX	nbFOE
	BEQ	L6CA6
	INC	$64
	LDY	$64
	CPY	#$03
	BCC	L6C92
	LDY	#$00
	STY	$64
L6C92	LDA	|$0060,Y
	STA	$63
L6C97	LSR	$63
	BCC	L6CA2
	JSR	L6CDB
	LDA	fgPLAY
	BEQ	L6CA6
L6CA2	LDA	$63
	BNE	L6C97
L6CA6	RTS

*-----------------------------------
* 
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

L6CCB	HEX	082B2C3031323628292A2D2E2F353334

L6CDB	INC	idxFOE
	LDX	nbFOE
	CPX	idxFOE
	BCS	L6CE7
	LDX	#$01
	STX	idxFOE
L6CE7	JSR	L75CE
	LDA	foeC70
	BMI	L6D08
	BEQ	L6D08
	DEC	foeC70
	LDY	foeC70
	CPY	#$0D
	BCS	L6CFB
	JMP	L6E65

L6CFB	LDX	idxFOE
	LDA	L0C98,X
	BEQ	L6D05
	JMP	L75A8
L6D05	JMP	L6DB7

L6D08	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BEQ	L6D61
	CMP	#sprBAR
	BNE	L6D26
	LDA	foeC80
	CMP	#$02
	BEQ	L6D61
L6D26	LDA	foeC80
	CMP	#$02
	BCC	L6D64
	LDY	foeY
	CPY	#$0F
	BEQ	L6D61
	LDA	tblBOARDALLL+1,Y
	STA	ptrBOARD
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

L6D64	JSR	L74DF
	JSR	drawSPRITEXY
	JSR	L7582
	LDA	#$06
	LDY	foeC90
	BMI	L6D75
	LDA	#$0D
L6D75	STA	foeC88
	INC	foeC80
	LDA	foeC80
	CMP	#$05
	BCS	L6DC0
	LDA	foeC80
	CMP	#$02
	BNE	L6DB7
	JSR	L74F7
	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L6DB7
	LDA	foeC70
	BPL	L6DA2
	DEC	nbCHEST
L6DA2	LDA	$5F
	STA	foeC70
	LDY	#$00
	LDA	#$75
	JSR	printSCORE
	JSR	prepareMELODY
	HEX	06200430024000
L6DB7	JSR	L74DF
	JSR	drawSPRXYCOLLISION
	JMP	L75A8

L6DC0	LDA	#$00
	STA	foeC80
	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
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
	LDA	foeC70
	BPL	L6E58
	LDY	foeY
	DEY
	STY	theY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	foeX
	STY	theX
	LDA	(ptrBBACK),Y
	CMP	#$00
	BEQ	L6E31
	DEC	nbCHEST
	JMP	L6E46

L6E31	LDA	#$07
	STA	(ptrBOARD),Y
	STA	(ptrBBACK),Y
	JSR	coutHGR2
	LDY	theY
	LDX	theX
	JSR	getXY
	LDA	#$07
	JSR	drawSPRXYCOLLISION
L6E46	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	#$00
	STA	foeC70
	LDY	foeX
L6E58	LDA	#sprFOE
	STA	(ptrBOARD),Y
	JSR	L74DF
	JSR	drawSPRXYCOLLISION
	JMP	L75A8

L6E65	CPY	#$07
	BCC	L6E85
	JSR	L74DF
	JSR	drawSPRITEXY
	LDY	foeC70
	LDA	L6E7F-7,Y
	STA	foeC78
L6E76	JSR	L74DF
	JSR	drawSPRXYCOLLISION
	JMP	L75A8

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

L6E97	DA	L75A8-1
	DA	L6FBC-1
	DA	L7047-1
	DA	L6EAC-1
	DA	L6F39-1

L6EA1	LDA	foeC70
	BEQ	L6EA9
	BMI	L6EA9
	INC	foeC70
L6EA9	JMP	L75A8

L6EAC	LDY	foeC80
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
	CMP	#$01
	BEQ	L6EA1
	CMP	#$02
	BEQ	L6EA1
	CMP	#$05
	BEQ	L6EA1
	CMP	#$08
	BEQ	L6EA1
L6ED5	JSR	L74DF
	JSR	drawSPRITEXY
	JSR	L7582
	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	DEC	foeC80
	BPL	L6F26
	JSR	L753E
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#$01
	BNE	L6F02
	LDA	#$00
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
L6F1C	LDA	#$08
	STA	(ptrBOARD),Y
	LDA	#$04
	STA	foeC80
	BNE	L6F29
L6F26	JSR	L74F7
L6F29	LDA	#$0E
	LDX	#$0F
	JSR	L7574
	JSR	L74DF
	JSR	drawSPRXYCOLLISION
	JMP	L75A8

L6F39	LDY	foeC80
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
	CMP	#$02
	BEQ	L6F60
	CMP	#$08
	BEQ	L6F60
	CMP	#$01
	BNE	L6F63
L6F60	JMP	L75A8

L6F63	JSR	L74DF
	JSR	drawSPRITEXY
	JSR	L7582
	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	INC	foeC80
	LDA	foeC80
	CMP	#$05
	BCC	L6FB9
	JSR	L753E
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#$01
	BNE	L6F94
	LDA	#$00
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
	LSR	fgPLAY
L6FAE	LDA	#$08
	STA	(ptrBOARD),Y
	LDA	#$00
	STA	foeC80
	JMP	L6F29
L6FB9	JMP	L6F26

L6FBC	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDX	foeC78
	CPX	#$03
	BCS	L6FF1
	LDY	foeX
	BEQ	L6FEE
	DEY
	LDA	(ptrBOARD),Y
	CMP	#$08
	BEQ	L6FEE
	CMP	#$02
	BEQ	L6FEE
	CMP	#$01
	BEQ	L6FEE
	LDA	(ptrBBACK),Y
	CMP	#$05
	BNE	L6FF1
L6FEE	JMP	L75A8

L6FF1	JSR	L74DF
	JSR	drawSPRITEXY
	JSR	L7595
	LDA	#$FF
	STA	foeC90
	DEC	foeC78
	BPL	L7026
	JSR	L753E
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#$01
	BNE	L700F
	LDA	#$00
L700F	STA	(ptrBOARD),Y
	DEC	foeX
	DEY
	LDA	(ptrBOARD),Y
	CMP	#sprHERO
	BNE	L701C
	LSR	fgPLAY
L701C	LDA	#$08
	STA	(ptrBOARD),Y
	LDA	#$04
	STA	foeC78
	BNE	L7029
L7026	JSR	L74F7
L7029	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#$04
	BEQ	L7037
	LDA	#$00
	LDX	#$02
	BNE	L703B
L7037	LDA	#$03
	LDX	#$05
L703B	JSR	L7574
	JSR	L74DF
	JSR	drawSPRXYCOLLISION
	JMP	L75A8

L7047	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	STA	ptrBBACK
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDX	foeC78
	CPX	#$02
	BCC	L707E
	LDY	foeX
	CPY	#$1B
	BEQ	L707B
	INY
	LDA	(ptrBOARD),Y
	CMP	#$08
	BEQ	L707B
	CMP	#$02
	BEQ	L707B
	CMP	#$01
	BEQ	L707B
	LDA	(ptrBBACK),Y
	CMP	#$05
	BNE	L707E
L707B	JMP	L75A8

L707E	JSR	L74DF
	JSR	drawSPRITEXY
	JSR	L7595
	LDA	#$01
	STA	foeC90
	INC	foeC78
	LDA	foeC78
	CMP	#$05
	BCC	L70B7
	JSR	L753E
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#$01
	BNE	L70A0
	LDA	#$00
L70A0	STA	(ptrBOARD),Y
	INC	foeX
	INY
	LDA	(ptrBOARD),Y
	CMP	#sprHERO
	BNE	L70AD
	LSR	fgPLAY
L70AD	LDA	#$08
	STA	(ptrBOARD),Y
	LDA	#$00
	STA	foeC78
	BEQ	L70BA
L70B7	JSR	L74F7
L70BA	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#$04
	BEQ	L70C8
	LDA	#$07
	LDX	#$09
	BNE	L70CC
L70C8	LDA	#$0A
	LDX	#$0C
L70CC	JSR	L7574
	JSR	L74DF
	JSR	drawSPRXYCOLLISION
	JMP	L75A8

L70D8	STX	$55
	STY	$56
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	$55
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BNE	L70F7
	LDA	foeC70
	BEQ	L70F7
	BMI	L70F7
	LDA	#$03
	RTS

L70F7	LDY	$56
	CPY	boardY
	BEQ	L7100
	JMP	L7186

L7100	LDY	$55
	STY	$57
	CPY	boardX
	BCS	L7147
L7108	INC	$57
	LDY	$56
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	$57
	LDA	(ptrBBACK),Y
	CMP	#$03
	BEQ	L713E
	CMP	#$04
	BEQ	L713E
	LDY	$56
	CPY	#$0F
	BEQ	L713E
	LDA	tblBOARDALLL+1,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	$57
	LDA	(ptrBBACK),Y
	CMP	#sprEMPTY
	BEQ	L7186
	CMP	#sprTRAP
	BEQ	L7186
L713E	LDY	$57
	CPY	boardX
	BNE	L7108
	LDA	#$02
	RTS

L7147	DEC	$57
	LDY	$56
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	$57
	LDA	(ptrBBACK),Y
	CMP	#$03
	BEQ	L717D
	CMP	#$04
	BEQ	L717D
	LDY	$56
	CPY	#$0F
	BEQ	L717D
	LDA	tblBOARDALLL+1,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	$57
	LDA	(ptrBBACK),Y
	CMP	#$00
	BEQ	L7186
	CMP	#$05
	BEQ	L7186
L717D	LDY	$57
	CPY	boardX
	BNE	L7147
	LDA	#$01
	RTS

L7186	LDA	#$00
	STA	$58
	LDA	#$FF
	STA	$59
	LDX	$55
	LDY	$56
	JSR	L743E
	JSR	L7275
	JSR	L71A2
	JSR	L720C
	LDA	$58
	RTS
L71A1	RTS

L71A2	LDY	$5A
	CPY	$55
	BEQ	L71A1
	LDY	$56
	CPY	#$0F
	BEQ	L71DA
	LDA	tblBOARDALLL+1,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	$5A
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L71DA
	CMP	#sprWALLI
	BEQ	L71DA
	LDX	$5A
	LDY	$56
	JSR	L739D
	LDX	$5A
	JSR	L72D4
	CMP	$59
	BCS	L71DA
	STA	$59
	LDA	#$01
	STA	$58
L71DA	LDY	$56
	BEQ	L7206
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	$5A
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BNE	L7206
	LDY	$56
	LDX	$5A
	JSR	L7300
	LDX	$5A
	JSR	L72D4
	CMP	$59
	BCS	L7206
	STA	$59
	LDA	#$01
	STA	$58
L7206	INC	$5A
	JMP	L71A2
L720B	RTS

L720C	LDY	$5B
	CPY	$55
	BEQ	L720B
	LDY	$56
	CPY	#$0F
	BEQ	L7244
	LDA	tblBOARDALLL+1,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	$5B
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L7244
	CMP	#sprWALLI
	BEQ	L7244
	LDX	$5B
	LDY	$56
	JSR	L739D
	LDX	$5B
	JSR	L72D4
	CMP	$59
	BCS	L7244
	STA	$59
	LDA	#$02
	STA	$58
L7244	LDY	$56
	BEQ	L7270
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	$5B
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BNE	L7270
	LDY	$56
	LDX	$5B
	JSR	L7300
	LDX	$5B
	JSR	L72D4
	CMP	$59
	BCS	L7270
	STA	$59
	LDA	#$02
	STA	$58
L7270	DEC	$5B
	JMP	L720C

L7275	LDY	$56
	CPY	#$0F
	BEQ	L72A7
	LDA	tblBOARDALLL+1,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	$55
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L72A7
	CMP	#sprWALLI
	BEQ	L72A7
	LDX	$55
	LDY	$56
	JSR	L739D
	LDX	$55
	JSR	L72D4
	CMP	$59
	BCS	L72A7
	STA	$59
	LDA	#$04
	STA	$58
L72A7	LDY	$56
	BEQ	L72D3
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	$55
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BNE	L72D3
	LDX	$55
	LDY	$56
	JSR	L7300
	LDX	$55
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

L72FD	LDA	$5E
	RTS

L7300	STY	$5E
	STX	$5D
L7304	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	$5D
	LDA	(ptrBBACK),Y
	CMP	#sprLADDER
	BNE	L72FD
	DEC	$5E
	LDY	$5D
	BEQ	L734A
	DEY
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L7340
	CMP	#sprWALLI
	BEQ	L7340
	CMP	#sptLADDER
	BEQ	L7340
	LDY	$5E
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	$5D
	DEY
	LDA	(ptrBBACK),Y
	CMP	#sprBAR
	BNE	L734A
L7340	LDY	$5E
	STY	$5C
	CPY	boardY
	BCC	L7397
	BEQ	L7397
L734A	LDY	$5D
	CPY	#$1B
	BEQ	L738C
	LDY	$5E
	LDA	tblBOARDALLL+1,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	$5D
	INY
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L7382
	CMP	#sprWALLI
	BEQ	L7382
	CMP	#sprLADDER
	BEQ	L7382
	LDY	$5E
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	$5D
	INY
	LDA	(ptrBBACK),Y
	CMP	#sprBAR
	BNE	L738C
L7382	LDY	$5E
	STY	$5C
	CPY	boardY
	BCC	L7397
	BEQ	L7397
L738C	LDY	$5E
	CPY	#$01
	BCC	L7395
	JMP	L7304

L7395	TYA
	RTS

L7397	LDA	$5C
	RTS

L739A	LDA	$5E
	RTS

L739D	STY	$5E
	STX	$5D
L73A1	LDA	tblBOARDALLL+1,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	$5D
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L739A
	CMP	#sptrWALLI
	BEQ	L739A
	LDY	$5E
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	$5D
	LDA	(ptrBBACK),Y
	CMP	#sprEMPTY
	BEQ	L742D
	CPY	#$00
	BEQ	L73FB
	DEY
	LDA	(ptrBBACK),Y
	CMP	#sprBAR
	BEQ	L73F3
	LDY	$5E
	LDA	tblBOARDALLL+1,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	$5D
	DEY
	LDA	(ptrBBACK),Y
	CMP	#sprWALL
	BEQ	L73F3
	CMP	#sprWALLI
	BEQ	L73F3
	CMP	#sprLADDER
	BNE	L73FB
L73F3	LDY	$5E
	STY	$5C
	CPY	boardY
	BCS	L743B
L73FB	LDY	$5D
	CPY	#$1B
	BCS	L742D
	INY
	LDA	(ptrBBACK),Y
	CMP	#$04
	BEQ	L7425
	LDY	$5E
	LDA	tblBOARDALLL+1,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	$5D
	INY
	LDA	(ptrBBACK),Y
	CMP	#$01
	BEQ	L7425
	CMP	#$03
	BEQ	L7425
	CMP	#$02
	BNE	L742D
L7425	LDY	$5E
	STY	$5C
	CPY	boardY
	BCS	L743B
L742D	INC	$5E
	LDY	$5E
	CPY	#$10
	BCS	L7438
	JMP	L73A1

L7438	LDA	#$0F
	RTS

L743B	LDA	$5C
	RTS

L743E	STX	$5A
	STX	$5B
	STY	theYSCREEN
L7444	LDA	$5A
	BEQ	L7490
	LDY	theYSCREEN
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	$5A
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
	LDA	tblBOARDALLL+1,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	$5A
	DEY
	LDA	(ptrBBACK),Y
	CMP	#$01
	BEQ	L748A
	CMP	#$02
	BEQ	L748A
	CMP	#$03
	BNE	L748E
L748A	DEC	$5A
	BPL	L7444
L748E	DEC	$5A
L7490	LDA	$5B
	CMP	#$1B
	BEQ	L74DE
	LDY	theYSCREEN
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDY	$5B
	INY
	LDA	(ptrBOARD),Y
	CMP	#$01
	BEQ	L74DE
	CMP	#$02
	BEQ	L74DE
	CMP	#$03
	BEQ	L74D8
	CMP	#$04
	BEQ	L74D8
	LDY	theYSCREEN
	CPY	#$0F
	BEQ	L74D8
	LDA	tblBOARDALLL+1,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH+1,Y
	STA	ptrBBACK+1
	LDY	$5B
	INY
	LDA	(ptrBBACK),Y
	CMP	#$01
	BEQ	L74D8
	CMP	#$02
	BEQ	L74D8
	CMP	#$03
	BNE	L74DC
L74D8	INC	$5B
	BPL	L7490
L74DC	INC	$5B
L74DE	RTS

L74DF	LDX	foeX
	LDY	foeC78
	JSR	calcHGRX
	STX	theA
	LDY	foeY
	LDX	foeC80
	JSR	calcHGRY
	LDX	foeC88
	LDA	L6CCB,X
	LDX	theA
	RTS

L74F7	LDA	foeC78
	CMP	#$02
	BNE	L753D
	LDA	foeC80
	CMP	#$02
	BNE	L753D
	LDY	foeY
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	foeX
	LDA	(ptrBBACK),Y
	CMP	#$07
	BNE	L753D
	LDA	foeC70
	BMI	L753D
	LDA	#$FF
	SEC
	SBC	$53
	STA	foeC70
	LDA	#$00
	STA	(ptrBBACK),Y
	LDY	foeY
	STY	theY
	LDY	foeX
	STY	theX
	JSR	coutHGR2
	LDY	theY
	LDX	theX
	JSR	getXY
	LDA	#$07
	JMP	drawSPRITEXY
L753D	RTS

L753E	LDA	foeC70
	BPL	L7573
	INC	foeC70
	BNE	L7573
	LDY	foeY
	STY	theY
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	foeX
	STY	theX
	LDA	(ptrBBACK),Y
	CMP	#$00
	BNE	L7571
	LDA	#$07
	STA	(ptrBBACK),Y
	JSR	coutHGR2
	LDY	theY
	LDX	theX
	JSR	getXY
	LDA	#$07
	JMP	drawSPRXYCOLLISION

L7571	DEC	foeC70
L7573	RTS

L7574	INC	foeC88
	CMP	foeC88
	BCC	L757D
L757A	STA	foeC88
	RTS

L757D	CPX	foeC88
	BCC	L757A
	RTS

L7582	LDA	foeC78
	CMP	#$02
	BCC	L758F
	BEQ	L7594
	DEC	foeC78
	JMP	L74F7

L758F	INC	foeC78
	JMP	L74F7
L7594	RTS

L7595	LDA	foeC80
	CMP	#$02
	BCC	L75A2
	BEQ	L75A7
	DEC	foeC80
	JMP	L74F7

L75A2	INC	foeC80
	JMP	L74F7
L75A7	RTS

L75A8	LDX	idxFOE
	LDA	foeX
	STA	tblFOEX,X
	LDA	foeY
	STA	tblFOEY,X
	LDA	foeC78
	STA	L0C78,X
	LDA	foeC80
	STA	L0C80,X
	LDA	foeC70
	STA	L0C70,X
	LDA	foeC90
	STA	L0C90,X
	LDA	foeC88
	STA	L0C88,X
	RTS

L75CE	LDX	idxFOE
	LDA	tblFOEX,X
	STA	foeX
	LDA	tblFOEY,X
	STA	foeY
	LDA	L0C78,X
	STA	foeC78
	LDA	L0C80,X
	STA	foeC80
	LDA	L0C88,X
	STA	foeC88
	LDA	L0C90,X
	STA	foeC90
	LDA	L0C70,X
	STA	foeC70
	RTS

L75F4	JSR	L7716
	INC	$53
	LDA	$53
	CMP	#$1C
	BCC	L7603
	LDA	#$00
	STA	$53
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
	CMP	#$14
	BNE	L7639
	LDA	#$37
L7627	JSR	coutHGR2
	LDX	theX
	LDY	theY
	JSR	getXY
	LDA	#$00
	JSR	drawSPRITEXY
L7636	JMP	L770D

L7639	CMP	#$0A
	BNE	L7636
	LDA	#$38
	BNE	L7627
L7641	LDX	tempINDEX
	LDY	tblHOLEY,X
	STY	theY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
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
	LSR	fgPLAY
L766D	CMP	#sprFOE
	BEQ	L767A
	CMP	#sprCHEST
	BNE	L7677
	DEC	nbCHEST
L7677	JMP	L7701

L767A	LDA	#sprWALL
	STA	(ptrBOARD),Y
	STA	(ptrBBACK),Y
	JSR	coutHGR1
	LDA	#sprWALL
	JSR	coutHGR2
	LDX	nbFOE
L768A	LDA	tblFOEX,X
	CMP	theX
	BNE	L76FE
	LDA	tblFOEY,X
	CMP	theY
	BNE	L76FE
	LDA	L0C70,X
	BPL	L769F
	DEC	nbCHEST
L769F	LDA	#$7F
	STA	L0C70,X
	STX	idxFOE
	JSR	L75CE
	JSR	L74DF
	JSR	drawSPRITEXY
	LDX	idxFOE
	LDY	#$01
	STY	theY
L76B5	LDY	theY
	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	$53
L76C3	LDA	(ptrBBACK),Y
	CMP	#$00
	BEQ	L76D9
	INC	$53
	LDY	$53
	CPY	#$1C
	BCC	L76C3
	INC	theY
	LDA	#$00
	STA	$53
	BEQ	L76B5
L76D9	TYA
	STA	tblFOEX,X
	LDA	theY
	STA	tblFOEY,X
	LDA	#$14
	STA	L0C98,X
	LDA	#$02
	STA	L0C80,X
	STA	L0C78,X
	LDA	#$00
	STA	L0C88,X
	LDY	#$00
	LDA	#$75
	JSR	printSCORE
	JMP	L770D

L76FE	DEX
	BNE	L768A
L7701	LDA	#sprWALL
	STA	(ptrBOARD),Y
	JSR	coutHGR1
	LDA	#$01
	JSR	coutHGR2
L770D	LDX	tempINDEX
	DEX
	BMI	L7715
	JMP	L7605
L7715	RTS

L7716	LDX	nbFOE
	BEQ	L7715
	LDA	idxFOE
	PHA
L771D	LDA	L0C98,X
	BEQ	L7765
	STX	idxFOE
	JSR	L75CE
	LDA	#$7F
	STA	L0C70,X
	LDA	tblFOEX,X
	STA	theX
	LDA	tblFOEY,X
	STA	theY
	DEC	L0C98,X
	BEQ	L776C
	LDA	L0C98,X
	CMP	#$13
	BNE	L7752
	LDA	#$39
	JSR	coutHGR2
	JSR	L74DF
	LDA	#$39
	JSR	drawSPRXYCOLLISION
	JMP	L7763

L7752	CMP	#$0A	; tutu
	BNE	L7765
	LDA	#$3A
	JSR	coutHGR2
	JSR	L74DF
	LDA	#$3A
	JSR	drawSPRXYCOLLISION
L7763	LDX	idxFOE
L7765	DEX
	BNE	L771D
	PLA
	STA	idxFOE
	RTS

L776C	LDY	theY
	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
	LDA	tblBOARDALLH,Y
	STA	ptrBOARD+1
	LDX	idxFOE
	INC	L0C98,X
	LDY	theX
	LDA	(ptrBOARD),Y
	BNE	L7765
	LDA	#sprFOE
	STA	(ptrBOARD),Y
	LDA	#sprEMPTY
	JSR	coutHGR2
	LDA	#$00
	LDX	idxFOE
	STA	L0C70,X
	STA	L0C98,X
	LDA	#sprFOE
	JSR	coutHGR1
	JSR	prepareMELODY
	HEX	027C03780474057000
	LDX	idxFOE
	JMP	L7765

*-------------------------------
* 8D - RETURN - DISPLAYS HIGH SCORE
*-------------------------------

displayHIGHSCORES
	JSR	L786B
	LDX	#$FF
	LDY	#$FF
	LDA	#$04
	STA	counter
L77B7	LDA	fgINPUT
	CMP	#chrK
	BEQ	L77C7
	LDA	BUTN1
	BMI	L77D6
	LDA	BUTN0
	BMI	L77D6
L77C7	LDA	KBD
	BMI	L77D6
	DEX
	BNE	L77B7
	DEY
	BNE	L77B7
	DEC	counter
	BNE	L77B7
L77D6	STA	KBDSTROBE
	STA	TXTPAGE1
	JSR	clearHGR2
	LDY	#$0F
	STY	theY
L77E3	LDA	tblBOARDALLL,Y
	STA	ptrBBACK
	LDA	tblBOARDBACKH,Y
	STA	ptrBBACK+1
	LDY	#$1B
	STY	theX
L77F1	LDA	(ptrBBACK),Y
	CMP	#$05
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
	LDA	#$37
	JSR	coutHGR2
	JMP	L7838

L7833	LDA	#$38
	JSR	coutHGR2
L7838	LDX	tempINDEX
	DEX
	BPL	L780A
	LDX	nbFOE
	BEQ	L7868
L7841	LDA	L0C98,X
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
	LDA	#$39
	BNE	L7860
L785E	LDA	#$3A
L7860	JSR	coutHGR2
L7863	LDX	tempINDEX
	DEX
	BNE	L7841
L7868	JMP	L6A12

L786B	JSR	clearHGR2
	LDA	#>HGR2
	STA	activePAGE
	LDA	#$00
	STA	theX
	STA	theY
	JSR	printSTRING
	ASC	"    LODE RUNNER HIGH SCORES"8D8D8D
	ASC	"    INITIALS LEVEL  SCORE"8D
	ASC	"    -------- ----- --------"8D00

	LDA	#$01	; for x=1 to...10
	STA	$55
L78D4	CMP	#$0A
	BNE	L78E5
	LDA	#$01
	JSR	outputCHAR
	LDA	#$00
	JSR	outputCHAR
	JMP	L78EF

L78E5	LDA	#chrSPC
	JSR	printCHAR
	LDA	$55
	JSR	outputCHAR
L78EF	JSR	printSTRING
	ASC	".    "00
	LDX	$55
	LDY	scoreoffset,X
	STY	$56
	LDA	scorebuf+$03,Y
	BNE	L7907
	JMP	L798C

* +0..+2 INITIALS
* +3     LEVEL
* +4..+7 SCORE

L7907	LDY	$56
	LDA	scorebuf,Y
	JSR	printCHAR
	LDY	$56
	LDA	scorebuf+$01,Y
	JSR	printCHAR
	LDY	$56
	LDA	scorebuf+$02,Y
	JSR	printCHAR
	JSR	printSTRING
	ASC	"    "00
	LDY	$56
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
	LDY	$56
	LDA	scorebuf+$04,Y
	JSR	bcd2dec
	LDA	theDIZAINE
	JSR	outputCHAR
	LDA	theUNITE
	JSR	outputCHAR
	LDY	$56
	LDA	scorebuf+$05,Y
	JSR	bcd2dec
	LDA	theDIZAINE
	JSR	outputCHAR
	LDA	theUNITE
	JSR	outputCHAR
	LDY	$56
	LDA	scorebuf+$06,Y
	JSR	bcd2dec
	LDA	theDIZAINE
	JSR	outputCHAR
	LDA	theUNITE
	JSR	outputCHAR
	LDY	$56
	LDA	scorebuf+$07,Y
	JSR	bcd2dec
	LDA	theDIZAINE
	JSR	outputCHAR
	LDA	theUNITE
	JSR	outputCHAR
L798C	JSR	L7B7D
	INC	$55
	LDA	$55
	CMP	#$0B
	BCS	L799A
	JMP	L78D4

L799A	STA	TXTPAGE2
	LDA	#>HGR1
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
	LDY	#$27	; met la barre bleue
	LDA	activePAGE
	CMP	#>HGR2
	BEQ	L79DD
L79BB	LDA	#$AA
	STA	$2350,Y
	STA	$2750,Y
	STA	$2B50,Y
	STA	$2F50,Y
	DEY
	LDA	#$D5
	STA	$2350,Y
	STA	$2750,Y
	STA	$2B50,Y
	STA	$2F50,Y
	DEY
	BPL	L79BB
	BMI	L79FD

L79DD	LDA	#$AA	; pareil mais sur HGR2
	STA	$4350,Y
	STA	$4750,Y
	STA	$4B50,Y
	STA	$4F50,Y
	DEY
	LDA	#$D5
	STA	$4350,Y
	STA	$4750,Y
	STA	$4B50,Y
	STA	$4F50,Y
	DEY
	BPL	L79DD

L79FD	LDA	#$10
	STA	theY
	LDA	#$00
	STA	theX
	JSR	printSTRING
	ASC	"SCORE        MEN    LEVEL   "00
	JSR	printMEN
	JSR	printLEVEL
	LDA	#$00
	TAY
	JMP	printSCORE

*-------------------------------
* SET HGR POINTER
*-------------------------------

setHGRPOINTER
	LDA	xhgr,Y
	STA	ptrHGR1
	LDA	yhgr,Y
	ORA	hgrPAGE
	STA	ptrHGR1+1
	RTS

*-------------------------------
* SET HGR POINTERS
*-------------------------------

setHGRPOINTERS
	LDA	xhgr,Y
	STA	ptrHGR1
	STA	ptrHGR2
	LDA	yhgr,Y
	ORA	#>HGR1
	STA	ptrHGR1+1
	EOR	#$60
	STA	ptrHGR2+1
	RTS

*-------------------------------
* CLEAR HGR1 
*-------------------------------

clearHGR1	LDA	#>HGR1
	LDX	#>HGR1+$20
	BNE	L7A5B

*-------------------------------
* CLEAR HGR2
*-------------------------------

clearHGR2	LDA	#>HGR2
	LDX	#>HGR2+$20

*--- clear now

L7A5B	STA	ptrDATA+1
	LDA	#$00
	STA	ptrDATA
	TAY
	LDA	#$80
L7A64	STA	(ptrDATA),Y
	INY
	BNE	L7A64
	INC	ptrDATA+1
	CPX	ptrDATA+1
	BNE	L7A64
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
	CPX	#>HGR2
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
	CPX	#>HGR2
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
	LDA	CSWL
	STA	CH
	LDA	CSWH
	STA	CV
	LDA	#$05
	STA	theMEN
	STA	fgDEMO
	LDA	fgINPUT	; save interface mode
	STA	L7C76+1
	LDA	#chrK	; force keyboard in editor
	STA	fgINPUT
	STA	TXTPAGE1
	LDA	intLEVEL	; check level
	CMP	#maxLEVEL
	BCC	editMAIN
	LDA	#$00	; start at 0 if > 149
	STA	intLEVEL

editMAIN	JSR	clearHGR1	; clear HGR1
	LDA	#>HGR1
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

tblEDITKEY	ASC	"PCEMIS"00

tblEDITADD	DA	editPLAY-1	; Play level
	DA	editCLEAR-1	; Clear level
	DA	editEDIT-1	; Edit level
	DA	editMOVE-1	; Move level
	DA	editINIT-1	; Initialize
	DA	editCLEARSCORE-1	; Clear Score file

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
	STA	$9D
	LDA	intLEVEL
	BEQ	L7C88
	LSR	$9D
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
	JSR	L807F
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
	JSR	printSTRING
	ASC	8D
	ASC	"  SOURCE DISKETTE"00
	JSR	editWAITKEY
	JSR	L807F
	LDA	L824F
	STA	intLEVEL
	LDA	#$01	; read
	JSR	diskLEVEL
	JSR	printSTRING
	ASC	8D
	ASC	"  DESTINATION DISKETTE"00
	JSR	editWAITKEY
	JSR	L807F
	LDA	L8250
	STA	intLEVEL
	LDA	#$02	; write
	JSR	diskLEVEL
	JMP	editLOOP
L7D5A	JMP	editNEXT

*-------------------------------
* I - INITIALIZE DISKETTE
*-------------------------------

editINIT	JSR	printSTRING
	ASC	8D
	ASC	">>INITIALIZE"8D
	ASC	"  THIS FORMATS THE DISKETTE"8D
	ASC	"  FOR USER CREATED LEVELS."8D
	ASC	"  (CAUTION. IT ERASES THE"8D
	ASC	"   ENTIRE DISKETTE FIRST)"8D8D
	ASC	"  ARE YOU SURE (Y/N) "00
	JSR	editWAITKEY
	CMP	#chrY
	BNE	L7E72
	NOP		; NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	LDA	intLEVEL
	PHA
	LDA	#$04	; Init command
	JSR	diskLEVEL

	LDA	#<boot	; Save T0/S0
	STA	LB7F0
	LDA	#>boot
	STA	LB7F0+1
	LDA	#$00
	STA	LB7ED
	STA	LB7EC
	LDA	#$02
	STA	LB7F4
	JSR	L6338
	LDA	#$E0
	STA	intLEVEL
	LDA	#$01
	JSR	diskLEVEL
	LDY	#$37
L7E33	LDA	L8251,Y
	STA	levelDISK,Y
	DEY
	BPL	L7E33
	LDA	#$02
	JSR	diskLEVEL
	LDA	#$EF
	STA	intLEVEL
	LDA	#$01
	JSR	diskLEVEL
	LDY	#$20
L7E4C	LDA	L8289,Y
	STA	levelDISK+$B,Y
	DEY
	BPL	L7E4C
	LDA	#$02
	JSR	diskLEVEL
	LDA	#$01
	JSR	readSCORE
	LDY	#$0A
L7E61	LDA	L63A8,Y
	STA	scorebuf+$F4,Y
	DEY
	BPL	L7E61
	LDA	#$02
	JSR	readSCORE
	PLA
	STA	intLEVEL
L7E72	JMP	editLOOP

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
* EDIT THE LEVEL 
*-------------------------------

editEDITLEVEL
	JSR	clearHGR2	; clear HGR2
	LDA	#>HGR2
	STA	activePAGE
	JSR	drawINFOBAR	; show frame
	LDA	#>HGR1
	STA	activePAGE
	JSR	L807F	; check diskette (master or data disk)
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

L7F54	STA	theA	; same key
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
* CTRL-U - NEXT LEVEL 
*-------------------------------

editLOAD	LDA	intLEVEL
	CMP	#maxLEVEL-1	; 150-1
L7FD8	BEQ	L7F6E
	JSR	editSAVECHANGES
	INC	intLEVEL
	INC	theLEVEL
	JMP	editEDITLEVEL

*-------------------------------
* CTRL-H - PREVIOUS LEVEL
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
	JSR	clearHGR2
	LDA	#>HGR2
	STA	activePAGE
	LDA	#$00
	STA	theX
	STA	theY
	JSR	printSTRING
	ASC	"LEVEL HAS BEEN CHANGED BUT"8D
	ASC	"NOT SAVED. DO YOU WISH TO"8D
	ASC	"SAVE MODIFIED LEVEL (Y/N) "00
	JSR	doBEEP
	STA	TXTPAGE2
L8062	LDA	#$00
	JSR	L85F3
	STA	KBDSTROBE
	CMP	#chrN
	BEQ	L8075
	CMP	#chrY
	BNE	L8062
	JSR	saveLEVEL
L8075	STA	TXTPAGE1
	LDA	#$00
	STA	theX
	STA	theY
	RTS

L807F	LDA	#$01	; load score
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
	JSR	clearHGR2
	LDA	#>HGR2
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
	STA	TXTPAGE2
	LDA	#$00
	JSR	L85F3
	STA	KBDSTROBE
	STA	TXTPAGE1

L8105	RTS

*-----------------------------------
* LR DATA DISK NOT IDENTIFIED
*-----------------------------------

tellNODATADISK
	JSR	clearHGR2
	LDA	#>HGR2
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
	STA	KBDSTROBE
	RTS

tblEDITKEYS	ASC	"JIKM"
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
	LDY	#$00
L8189	LDA	|$0089,Y
	STY	L824D
	JSR	outputCHAR
	LDY	L824D
	INY
	CPY	#$03
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
	STA	KBDSTROBE
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
	LDY	L824D
	STA	|$0089,Y
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
	STA	KBDSTROBE
	CMP	#$9B	; escape
	BNE	L824C
	JMP	editLOOP
L824C	RTS
L824D	RTS

L824E	DB	$85
L824F	DB	$0F
L8250	DB	$60

L8251	HEX	02110F040000FE000000000000000000
	HEX	00000000000000000000000000000000
	HEX	000000000000007A0000000000000000
	HEX	FFFF0000230F0001
L8289	HEX	220F8888888888888888CCCFC4C5A0D2
	HEX	D5CECEC5D2A0C4C1D4C1A0C4C9D3CBA0
	HEX	A0

*---------------------------------------
* PRINT CHAR
*---------------------------------------

coutHGR1	STA	theA	; char in $1E
	LDA	#>HGR1	; print HGR1
	BNE	L82B4

coutHGR2	STA	theA	; char in $1E
	LDA	#>HGR2	; print HGR2

L82B4	STA	hgrPAGE	; page in $1F
	LDY	theY	; take Y
	JSR	getXY
	STY	theYSCREEN	; make it Y screen
	LDX	theX	; take X
	JSR	getBYBI
	STA	theXSCREEN	; make it X screen
	STX	sprTABLE
	LDA	tblMASK1,X
	STA	theMASK1
	LDA	tblMASK2,X
	STA	theMASK2
	JSR	getSPRITEDATA
	LDA	#sprHEIGHT
	STA	nbLINES

	LDX	#$00
	LDA	sprTABLE	; derniere table de sprite?
	CMP	#$05
	BCS	L8301

*--- sprite de 2 de large

L82DF	LDY	theYSCREEN
	JSR	setHGRPOINTER
	LDY	theXSCREEN
	LDA	(ptrHGR1),Y	; 1
	AND	theMASK1
	ORA	sprDATA,X
	STA	(ptrHGR1),Y
	INX
	INY
	LDA	(ptrHGR1),Y	; 2
	AND	theMASK2
	ORA	sprDATA,X
	STA	(ptrHGR1),Y
	INX
	INX
	INC	theYSCREEN
	DEC	nbLINES
	BNE	L82DF
	RTS

*--- sprite de 3 de large

L8301	LDY	theYSCREEN
	JSR	setHGRPOINTER
	LDY	theXSCREEN
	LDA	(ptrHGR1),Y	; 1
	AND	theMASK1
	ORA	sprDATA,X
	STA	(ptrHGR1),Y
	INX
	INY
	LDA	sprDATA,X	; 2
	STA	(ptrHGR1),Y
	INX
	INY
	LDA	(ptrHGR1),Y	; 3
	AND	theMASK2
	ORA	sprDATA,X
	STA	(ptrHGR1),Y
	INX
	INC	theYSCREEN
	DEC	nbLINES
	BNE	L8301
	RTS

tblMASK1	HEX	000103070F1F3F	; mask1
tblMASK2	HEX	F8F0E0C080FEFC	; mask2

*---------------------------------------
* DRAW SPRITE AT X,Y
*---------------------------------------
* draw a sprite at real HGR X,Y (eg. 175,111)

drawSPRITEXY
	STY	theYSCREEN
	STA	theA
	JSR	getXBYBI
	STA	theXSCREEN
	STX	sprTABLE
	JSR	getSPRITEDATA
	LDX	#sprHEIGHT	; nb lignes
	STX	nbLINES
	LDX	#$00
	LDA	sprTABLE
	CMP	#$05
	BCS	L8376

*--- sprite de 2 de large

L8350	LDY	theYSCREEN
	JSR	setHGRPOINTERS
	LDY	theXSCREEN
	LDA	sprDATA,X
	EOR	#$7F
	AND	(ptrHGR1),Y
	ORA	(ptrHGR2),Y
	STA	(ptrHGR1),Y
	INX
	INY
	LDA	sprDATA,X
	EOR	#$7F
	AND	(ptrHGR1),Y
	ORA	(ptrHGR2),Y
	STA	(ptrHGR1),Y
	INX
	INX
	INC	theYSCREEN
	DEC	nbLINES
	BNE	L8350
	RTS

*--- sprite de 3 de large

L8376	LDY	theYSCREEN
	JSR	setHGRPOINTERS
	LDY	theXSCREEN
	LDA	sprDATA,X
	EOR	#$7F
	AND	(ptrHGR1),Y
	ORA	(ptrHGR2),Y
	STA	(ptrHGR1),Y
	INX
	INY
	LDA	sprDATA,X
	EOR	#$7F
	AND	(ptrHGR1),Y
	ORA	(ptrHGR2),Y
	STA	(ptrHGR1),Y
	INX
	INY
	LDA	sprDATA,X
	EOR	#$7F
	AND	(ptrHGR1),Y
	ORA	(ptrHGR2),Y
	STA	(ptrHGR1),Y
	INX
	INC	theYSCREEN
	DEC	nbLINES
	BNE	L8376
	RTS

*---------------------------------------
* DRAW SPRITE AT X,Y WITH COLLISION
*---------------------------------------
* $52: 00 if no collision (empty background)
*    <>00 if collision

drawSPRXYCOLLISION
	STY	theYSCREEN
	STA	theA
	JSR	getXBYBI
	STA	theXSCREEN
	STX	sprTABLE
	JSR	getSPRITEDATA
	LDA	#sprHEIGHT
	STA	nbLINES
	LDX	#$00
	STX	fgCOLLISION
	LDA	sprTABLE
	CMP	#$05
	BCS	L83F5

*--- sprite de 2 de large

L83C3	LDY	theYSCREEN
	JSR	setHGRPOINTERS
	LDY	theXSCREEN
	LDA	(ptrHGR1),Y
	EOR	(ptrHGR2),Y
	AND	sprDATA,X
	ORA	fgCOLLISION
	STA	fgCOLLISION
	LDA	sprDATA,X
	ORA	(ptrHGR1),Y
	STA	(ptrHGR1),Y
	INX
	INY
	LDA	(ptrHGR1),Y
	EOR	(ptrHGR2),Y
	AND	sprDATA,X
	ORA	fgCOLLISION
	STA	fgCOLLISION
	LDA	sprDATA,X
	ORA	(ptrHGR1),Y
	STA	(ptrHGR1),Y
	INX
	INX
	INC	theYSCREEN
	DEC	nbLINES
	BNE	L83C3
	RTS

*--- sprite de 3 de large

L83F5	LDY	theYSCREEN
	JSR	setHGRPOINTERS
	LDY	theXSCREEN
	LDA	(ptrHGR1),Y
	EOR	(ptrHGR2),Y
	AND	sprDATA,X
	ORA	fgCOLLISION
	STA	fgCOLLISION
	LDA	sprDATA,X
	ORA	(ptrHGR1),Y
	STA	(ptrHGR1),Y
	INX
	INY
	LDA	(ptrHGR1),Y
	EOR	(ptrHGR2),Y
	AND	sprDATA,X
	ORA	fgCOLLISION
	STA	fgCOLLISION
	LDA	sprDATA,X
	ORA	(ptrHGR1),Y
	STA	(ptrHGR1),Y
	INX
	INY
	LDA	(ptrHGR1),Y
	EOR	(ptrHGR2),Y
	AND	sprDATA,X
	ORA	fgCOLLISION
	STA	fgCOLLISION
	LDA	sprDATA,X
	ORA	(ptrHGR1),Y
	STA	(ptrHGR1),Y
	INX
	INC	theYSCREEN
	DEC	nbLINES
	BNE	L83F5
	RTS

*---------------------------------------
* GET SPRITE DATA
*---------------------------------------
* Move sprite data at $df..$ff

getSPRITEDATA
	LDA	#sprHEIGHT	; char height
	STA	nbLINES

	LDA	#<tblOFFSPR	; pointer to index of sprite in each table
	STA	ptrDATA
	LDA	#>tblOFFSPR
	STA	ptrDATA+1

	LDA	tblPTRSPR,X	; one of the six tables
	STA	L845A+2
	STA	L8466+2
	STA	L848B+2
	STA	L8497+2

	LDX	#$00
L8455	LDY	theA
	LDA	(ptrDATA),Y
	TAY
L845A	LDA	LA200,Y	; a
	STA	L846F+1
	CLC
	ADC	#$01
	STA	L8474+1
L8466	LDA	LA280,Y	; a+1
	STA	L846F+2
	STA	L8474+2
L846F	LDA	LA200	; b
	STA	sprDATA,X
L8474	LDA	LA200	; b+1
	STA	$E0,X

	LDA	ptrDATA	; next line
	CLC
	ADC	#$68
	STA	ptrDATA
	LDA	ptrDATA+1
	ADC	#$00
	STA	ptrDATA+1

	LDY	theA
	LDA	(ptrDATA),Y
	TAY
L848B	LDA	LA200,Y	; c
	STA	L84A0+1
	CLC
	ADC	#$01
	STA	L84A7+1
L8497	LDA	LA280,Y	; c+1
	STA	L84A0+2
	STA	L84A7+2
L84A0	LDA	LA200	; d
	ORA	$E0,X
	STA	$E0,X
L84A7	LDA	LA200	; d+1
	STA	$E1,X

	LDA	ptrDATA
	CLC
	ADC	#$68
	STA	ptrDATA
	LDA	ptrDATA+1
	ADC	#$00
	STA	ptrDATA+1
	INX
	INX
	INX
	DEC	nbLINES
	BNE	L8455
	RTS

tblPTRSPR	DB	>LA200	; The six tables of sprites
	DB	>LA300
	DB	>LA400
	DB	>LA500
	DB	>LA600
	DB	>LA700
	DB	>LA800

*---------------------------------------
* CHECK HIGH SCORE
*---------------------------------------

checkHIGHSCORE
	LDA	$9D
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
	STY	$56
	LDY	#$09
L851D	LDX	scoreoffset,Y
	LDA	#$08
	STA	nbLINES
L8524	LDA	scorebuf,X
	STA	scorebuf+$08,X
	INX
	DEC	nbLINES
	BNE	L8524
	CPY	$56
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
	STA	L8582+1
	STA	L85C9+1
	JSR	L786B
	LDA	#>HGR2
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
	STA	KBDSTROBE
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

L85E7	LDA	#>HGR1
	STA	activePAGE
	LDA	#$02
	JSR	readSCORE
	JMP	L618E

L85F3	STA	bsDATA
L85F6	LDA	#$68
	STA	counter
	LDA	bsDATA
	BNE	L8601
	LDA	#$0A
L8601	JSR	coutHGR2
L8604	LDA	KBD
	BMI	L8628
	JSR	checkMOVEMENT
	DEC	counter
	BNE	L8604
	LDA	#$00
	JSR	coutHGR2
	LDA	#$68
	STA	counter
L8619	LDA	KBD
	BMI	L8628
	JSR	checkMOVEMENT
	DEC	counter
	BNE	L8619
	JMP	L85F6

L8628	PHA
	LDA	bsDATA
	JSR	coutHGR2
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

waitKEYUP
	STA	KBDSTROBE
	LDA	KBD
	BMI	waitKEYUP
	RTS

*-----------------------------------
* WAIT KEY DOWN
*-----------------------------------

waitKEYDOWN
	LDA	KBD
	BPL	waitKEYDOWN
	STA	KBDSTROBE
	RTS

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

L86BE	HEX	020406080A0C0E10121416181A1C1E20

*-----------------------------------
* The CTRL-G of Lode Runner
*-----------------------------------

doBEEP	LDY	#$C0
L86D0	LDX	#$80
L86D2	DEX
	BNE	L86D2
	LDA	fgSOUND
	BEQ	L86DC
	LDA	SPKR
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
L8713	LDA	KBD	; key pressed?
	BMI	L873C	; yes
	JSR	checkMOVEMENT	; buttons pressed?
	BCS	L873C	; yes
	DEC	counter
	BNE	L8713
	LDA	bsDATA	; output sprite
	JSR	coutHGR1
	LDA	#$68	; redo the wait
	STA	counter
L872B	LDA	KBD
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

bsDATA	DB	ptrBOARD

*-----------------------------------
* READ JOYSTICK
*-----------------------------------

readJOYSTICK
	LDA	#$00
	STA	theJOYX
	STA	theJOYY
	LDA	PTRIG
L874F	LDX	#$01
L8751	LDA	PADDL0,X
	BPL	L8769
	INC	theJOYX,X
L8758	DEX
	BPL	L8751
	LDA	PADDL0
	ORA	PADDL1
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
	JSR	readJOYSTICK
	LDA	theJOYX
	CMP	#minJOY
	BCC	L8796
	CMP	#maxJOY
	BCS	L8796
	LDA	theJOYY
	CMP	#minJOY
	BCC	L8796
	CMP	#maxJOY
	BCS	L8796
	LDA	BUTN1
	BMI	L8796
	LDA	BUTN0
	BMI	L8796
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
	LDA	PTRIG
	LDX	#$10
L87A7	LDA	PADDL0
	ORA	PADDL1
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

playSOUND	STA	ptrDATA
	STX	$0B
L87BE	LDA	fgSOUND
	BEQ	L87C5
	LDA	SPKR
L87C5	DEY
	BNE	L87CC
	DEC	$0B
	BEQ	L87D4
L87CC	DEX
	BNE	L87C5
	LDX	ptrDATA
	JMP	L87BE
L87D4	RTS

*-----------------------------------
* GET NOTE
*-----------------------------------

getNOTE	INC	$54
	LDY	$54
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
	INC	$54
	LDX	$54
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

playMELODY
	LDY	$54
	BEQ	L8832
	LDA	sndNOTE,Y
	LDX	sndDURATION,Y
	JSR	playSOUND	; play note
	LDY	$54
	DEC	$54
	LDA	theSPEED
	SEC
	SBC	sndDURATION,Y
	BEQ	L8830
	BCC	L8830
	TAX
	JSR	doWAIT1	; wait
L8830	SEC
	RTS

L8832	LDA	$9B
	BNE	L8844
	LDA	$A4
	LSR
	INC	$A4
	LDX	theSPEED
	INX
	INX
	JSR	playSOUND
	CLC
	RTS

L8844	LDX	theSPEED
	JSR	doWAIT
	CLC
	RTS

L884B	LDA	tblBOARDALLL,Y
	STA	ptrBOARD
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

getBYBI	LDA	bytable,X
	PHA
	LDA	bitable,X
	TAX
	PLA
	RTS

getXBYBI	LDA	xbytable,X
	PHA
	LDA	xbitable,X
	TAX
	PLA
	RTS

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
* CIRCLE ANIMATION
*-------------------------------

circleANIMATION
	LDA	#$58	; 88
	STA	$73
	LDA	#$8C	; 140
	STA	$74
	LDA	$A5
	BEQ	L88BD

	LDX	#$AA	; 170
	STX	$6D
	LDX	#$00	; 0
	STX	$72
L88B6	JSR	L88D7
	DEC	$6D
	BNE	L88B6

L88BD	LDA	#$01
	STA	$6D
	STA	$A5
	STA	$72
	JSR	printMEN
	JSR	printLEVEL
L88CB	JSR	L88D7
	INC	$6D
	LDA	$6D
	CMP	#$AA	; 170
	BNE	L88CB
	RTS

L88D7	LDA	$6D
	STA	$69
	LDA	#$00
	STA	$6A
	STA	$67
	STA	$68
	LDA	$69
	ASL
	STA	$6B
	LDA	$6A
	ROL
	STA	$6C
	LDA	#$03
	SEC
	SBC	$6B
	STA	$6B
	LDA	#$00
	SBC	$6C
	STA	$6C
	LDA	$73
	SEC
	SBC	$6D
	STA	$75
	LDA	#$00
	SBC	#$00
	STA	$79
	LDA	$73
	STA	$76
	STA	$77
	LDA	#$00
	STA	$7A
	STA	$7B
	LDA	$73
	CLC
	ADC	$6D
	STA	$78
	LDA	#$00
	ADC	#$00
	STA	$7C
	LDA	$74
	SEC
	SBC	$6D
	TAX
	LDA	#$00
	SBC	#$00
	JSR	L8A45
	STY	$7D
	STA	$81
	LDX	$74
	LDA	#$00
	JSR	L8A45
	STY	$7E
	STY	$7F
	STA	$82
	STA	$83
	LDA	$74
	CLC
	ADC	$6D
	TAX
	LDA	#$00
	ADC	#$00
	JSR	L8A45
	STY	$80
	STA	$84
L8951	LDA	$68
	CMP	$6A
	BCC	L896F
	BEQ	L8969
L8959	LDA	$67
	CMP	$69
	BNE	L8968
	LDA	$68
	CMP	$6A
	BNE	L8968
	JMP	L8A69
L8968	RTS

L8969	LDA	$67
	CMP	$69
	BCS	L8959
L896F	JSR	L8A69
	LDA	$6C
	BPL	L89A7
	LDA	$67
	ASL
	STA	$6F
	LDA	$68
	ROL
	STA	$70
	LDA	$6F
	ASL
	STA	$6F
	LDA	$70
	ROL
	STA	$70
	LDA	$6B
	CLC
	ADC	$6F
	STA	$6F
	LDA	$6C
	ADC	$70
	STA	$70
	LDA	#$06
	CLC
	ADC	$6F
	STA	$6B
	LDA	#$00
	ADC	$70
	STA	$6C
	JMP	L8A14

L89A7	LDA	$67
	SEC
	SBC	$69
	STA	$6F
	LDA	$68
	SBC	$6A
	STA	$70
	LDA	$6F
	ASL
	STA	$6F
	LDA	$70
	ROL
	STA	$70
	LDA	$6F
	ASL
	STA	$6F
	LDA	$70
	ROL
	STA	$70
	LDA	$6F
	CLC
	ADC	#$10
	STA	$6F
	LDA	$70
	ADC	#$00
	STA	$70
	LDA	$6F
	CLC
	ADC	$6B
	STA	$6B
	LDA	$70
	ADC	$6C
	STA	$6C
	LDA	$69
	PHP
	DEC	$69
	PLP
	BNE	L89EC
	DEC	$6A
L89EC	INC	$75
	BNE	L89F2
	INC	$79
L89F2	DEC	$84
	BPL	L89FC
	LDA	#$06
	STA	$84
	DEC	$80
L89FC	INC	$81
	LDA	$81
	CMP	#$07
	BNE	L8A0A
	LDA	#$00
	STA	$81
	INC	$7D
L8A0A	DEC	$78
	LDA	$78
	CMP	#$FF
	BNE	L8A14
	DEC	$7C
L8A14	INC	$67
	BNE	L8A1A
	INC	$68
L8A1A	INC	$83
	LDA	$83
	CMP	#$07
	BNE	L8A28
	LDA	#$00
	STA	$83
	INC	$7F
L8A28	DEC	$76
	LDA	$76
	CMP	#$FF
	BNE	L8A32
	DEC	$7A
L8A32	INC	$77
	BNE	L8A38
	INC	$7B
L8A38	DEC	$82
	BPL	L8A42
	LDA	#$06
	STA	$82
	DEC	$7E
L8A42	JMP	L8951

L8A45	STX	$6F
	LDY	#$08
	SEC
	SBC	#$07
L8A4C	PHP
	ROL	$70
	ASL	$6F
	ROL
	PLP
	BCC	L8A5A
	SBC	#$07
	JMP	L8A5C

L8A5A	ADC	#$07
L8A5C	DEY
	BNE	L8A4C
	BCS	L8A64
	ADC	#$07
	CLC
L8A64	ROL	$70
	LDY	$70
	RTS

L8A69	LDY	$7C
	BNE	L8A8C
	LDY	$78
	CPY	#$B0
	BCS	L8A8C
	JSR	setHGRPOINTERS
	LDY	$7F
	CPY	#$28
	BCS	L8A81
	LDX	$83
	JSR	L8AF6
L8A81	LDY	$7E
	CPY	#$28
	BCS	L8A8C
	LDX	$82
	JSR	L8AF6
L8A8C	LDY	$79
	BNE	L8AAF
	LDY	$75
	CPY	#$B0
	BCS	L8AAF
	JSR	setHGRPOINTERS
	LDY	$7F
	CPY	#$28
	BCS	L8AA4
	LDX	$83
	JSR	L8AF6
L8AA4	LDY	$7E
	CPY	#$28
	BCS	L8AAF
	LDX	$82
	JSR	L8AF6
L8AAF	LDY	$7B
	BNE	L8AD2
	LDY	$77
	CPY	#$B0
	BCS	L8AD2
	JSR	setHGRPOINTERS
	LDY	$80
	CPY	#$28
	BCS	L8AC7
	LDX	$84
	JSR	L8AF6
L8AC7	LDY	$7D
	CPY	#$28
	BCS	L8AD2
	LDX	$81
	JSR	L8AF6
L8AD2	LDY	$7A
	BNE	L8AF5
	LDY	$76
	CPY	#$B0
	BCS	L8AF5
	JSR	setHGRPOINTERS
	LDY	$80
	CPY	#$28
	BCS	L8AEA
	LDX	$84
	JSR	L8AF6
L8AEA	LDY	$7D
	CPY	#$28
	BCS	L8AF5
	LDX	$81
	JMP	L8AF6
L8AF5	RTS

L8AF6	LDA	$72
	BNE	L8B02
	LDA	(ptrHGR1),Y
	AND	L8B0C,X
	STA	(ptrHGR1),Y
	RTS

L8B02	LDA	(ptrHGR2),Y
	AND	L8B13,X
	ORA	(ptrHGR1),Y
	STA	(ptrHGR1),Y
	RTS

L8B0C	HEX	F0F0F0F08F8F8F
L8B13	HEX	8F8F8F8FF0F0F0

*-------------------------------
* SHOW GAME OVER
*-------------------------------

animGAMEOVER
	LDA	#$01
	STA	L8D4B
	LDA	#>HGR1
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

L8B7A	JSR	L8CE5
	HEX	000102030405060708090A020100
L8B8B	JSR	L8CE5
	HEX	0000010203040507090A02010000
L8B9C	JSR	L8CE5
	HEX	00000001020304090A0201000000
L8BAD	JSR	L8CE5
	HEX	000000000102030A020100000000
L8BBE	JSR	L8CE5
	HEX	000000000001030A010000000000
L8BCF	JSR	L8CE5
	HEX	0000000000000101000000000000
L8BE0	JSR	L8CE5
	HEX	0001020A09080706050403020100
L8BF1	JSR	L8CE5
	HEX	000001020A090705040302010000
L8C02	JSR	L8CE5
	HEX	00000001020A0904030201000000
L8C13	JSR	L8CE5
	HEX	0000000001020A03020100000000
L8C24	JSR	L8CE5
	HEX	0000000000010A03010000000000

L8C35	HEX	8080808080808080808080808080
L8C43	HEX	C0AAD5AAD5AAD5AAD5AAD5AAD580
L8C51	HEX	9080808080808080808080808082
L8C5F	HEX	90AAD1A2D5A885A8C5A2D4A29582
L8C6D	HEX	908291A2C5A88088C5A294A09082
L8C7B	HEX	908290A2C4A88088C5A294A09082
L8C89	HEX	908290A2C4A88188C4A2D4A09582
L8C97	HEX	90A2D1A2C4888088C4A284A08582
L8CA5	HEX	908291A2C4888088C4AA84A08582
L8CB3	HEX	908291A2C4888088C48A84A09182
L8CC1	HEX	90AA91A2C4A885A88582D4A29182

L8CCF	DA	L8C35-$D
	DA	L8C43-$D
	DA	L8C51-$D
	DA	L8C5F-$D
	DA	L8C6D-$D
	DA	L8C7B-$D
	DA	L8C89-$D
	DA	L8C97-$D
	DA	L8CA5-$D
	DA	L8CB3-$D
	DA	L8CC1-$D

L8CE5	PLA
	STA	ptrDATA
	PLA
	STA	ptrDATA+1
	LDY	#$50
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
	LDY	#$0D
L8D08	LDA	L8D08,Y
	STA	(ptrHGR1),Y
	INY
	CPY	#$1B
	BCC	L8D08
L8D12	JSR	L8D4C
	INC	theY
	LDY	theY
	CPY	#$5F
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
	LDA	BUTN1
	BMI	L8D41
	LDA	BUTN0
	BMI	L8D41
L8D3B	LDA	KBD
	BMI	L8D41
	RTS

L8D41	PLA
	PLA
	SEC
	LDA	KBD
	STA	KBDSTROBE
	RTS

L8D4B	DB	$9D

L8D4C	INC	ptrDATA
	BNE	L8D52
	INC	ptrDATA+1
L8D52	RTS

	ds	\

*-------------------------------
* NOT USED?
*-------------------------------

L8E00	LDA	#$44	;	MASTER	DISKETTE
	STA	$0478
	LDA	#$00
	JSR	LB9A0
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	LDA	#$20
	STA	$4F
L8E14	DEY
	BNE	L8E20
	DEC	$4F
	BNE	L8E20
	JMP	LBEAF

	NOP
	NOP
L8E20	LDA	$C08C,X
	BPL	L8E20
L8E25	CMP	#$D4
	BNE	L8E14
	NOP
L8E2A	LDA	$C08C,X
	BPL	L8E2A
L8E2F	CMP	#$D5
	BNE	L8E25
	NOP
L8E34	LDA	$C08C,X
	BPL	L8E34
	CMP	#$D6
	BNE	L8E2F
	LDA	$C088,X
	JSR	tellMASTERDISK
	JMP	editMAIN

	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	JMP	LB7B5

	ds	\

*---------------------------------------

	put	LR.Tables
	put	LR.RWTS

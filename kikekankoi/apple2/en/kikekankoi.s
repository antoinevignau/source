*
* Kikekankoi
*
* (c) 1985, Loriciels (Oric/CPC)
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	mx	%11
	org	$800
	typ	BIN
	dsk	KIKEKANKOI
	lst	off

*-----------------------------------
* SOFTSWITCHES AND FRIENDS
*-----------------------------------

WNDTOP	=	$22	; top of text window 
WNDBTM	=	$23	; bottom+1 of text window 
CH	=	$24	; cursor horizontal position 
CV	=	$25	; cursor vertical position 
LINNUM	=	$50	; result from GETADR
X0L	=	$e0	; X-coord
X0H	=	$e1
Y0	=	$e2	; Y-coord
dpTEXT	=	$fe

maxY	=	191	; 0 to 191 = 192
nbLINES	=	200	; 200 lignes sur un CPC
deltaY	=	32

nbOaP	=	10	; on peut porter dix objets

chrLA	=	$88
chrRA	=	$95
chrDEL	=	$ff
chrRET	=	$8d
chrSPC	=	$a0
TEXTBUFFER = 	$200
maxLEN	=	20

chrOUI	=	"Y"
chrNON	=	"N"

scrWIDTH	=	40

idxTEMPO	=	200
idxQUITTER =	201
idxCASSE	=	202
idxENERGIE	=	203

PRODOS	=	$bf00

KBD	=	$c000
CLR80VID	=	$c00c
KBDSTROBE	=	$c010
VBL	=	$c019
MONOCOLOR	=	$c021
VERTCNT	=	$c02e
SPKR	=	$c030
CYAREG	=	$C036
TXTCLR	=	$c050
TXTSET	=	$c051
MIXCLR	=	$c052
MIXSET	=	$c053
TXTPAGE1	=	$c054
TXTPAGE2	=	$c055
LORES	=	$c056
HIRES	=	$c057

*--- The firmware routines

HGR	=	$F3E2	; HGR
HPLOT	=	$F457	; HPLOT
HILIN	=	$F53A	; HPLOT TO
HCOLOR	=	$F6E9	; HCOLOR= (call+3)
INIT	=	$FB2F
TABV	=	$FB5B
HOME	=	$FC58
WAIT	=	$FCA8
RDKEY	=	$FD0C
*GETLN1	=	$FD6F	; using mine now
COUT	=	$FDED
IDROUTINE	=	$FE1F
SETNORM	=	$FE84
SETKBD	=	$FE89

*-----------------------------------
* MACROS
*-----------------------------------

@draw	mac
	lda	#]1
	jsr	showPIC
	eom

@explode	mac
	jsr	EXPLODE
	eom

@play	mac
	ldx	#>]1
	ldy	#<]1
	jsr	playMUSIC
	eom

@print	mac
	ldx	#>]1
	ldy	#<]1
	jsr	printCSTRING
	eom

@wait	mac
	ldx	#>]1
	ldy	#<]1
	jsr	waitMS
	eom

*-----------------------------------
* CODE BASIC EN ASM :-)
*-----------------------------------

	sec
	jsr	IDROUTINE
	bcs	notiigs

	lda	CYAREG	; 1 MHz vaincra!
	sta	sauveCYA
	and	#%0111_1111
	sta	CYAREG
	
	lda	MONOCOLOR
	sta	sauveMONO
	ora	#%1000_0000
*	and	#%0111_1111
	sta	MONOCOLOR
	
notiigs

*-------- CAN WE DO lowercase?

	lda	$FBB3
	cmp	#$06
	beq	lowerOK
	
	lda	#$80	; ONLY UPPERCASE
	sta	fgCASE	
lowerOK

*--------

*	lda	#0
*	sta	deltaY
*	
*	jsr	introPIC	; la picture GR
*	
*	lda	#32
*	sta	deltaY

	@play	#zikINTRODUCTION
	
REPLAY	jsr	initALL
	jsr	HGR

	jsr	HOME	; clear text screen
	lda	#0	; move cursor to 0,20
	sta	CH
	lda	#20
	jsr	TABV

*-----------------------------------
* DU BASIC A L'ASSEMBLEUR (BEURK)
*-----------------------------------

:100	ldx	#2
	lda	#0
	sta	P,x
	
	lda	SALLE
	cmp	#10
	beq	:100_OK
	cmp	#22
	beq	:100_OK
	cmp	#54
	beq	:100_OK
	cmp	#15
	bne	:105

:100_OK	lda	#1
	sta	P,x

:105	ldx	#10
	lda	O,x
	cmp	SALLE
	beq	:200
	cmp	#-1
	beq	:200

	ldx	#2	; :106
	lda	P,x
	beq	:200

	ldx	#9	; :115
	lda	C,x
	cmp	#2
	bcc	:130
	dec	C,x

:130	jsr	HGR
	jsr	setMIXEDON
	@print	#strILFAITNOIR
	jmp	:500

*-----------------------------------
* 200 - description salle
*-----------------------------------

:200	jsr	setHGR

*	@print	#strRETURN
	
	lda	SALLE
	asl
	tax
	lda	tbl7000,x
	sta	:222+1
	lda	tbl7000+1,x
	sta	:222+2
	
:222	jsr	$bdbd
	jsr	setMIXEDON
	
	lda	#0
	sta	H
	sta	HH	; for comma
	lda	#1
	sta	N
	
:310	ldx	N
	lda	O,x
	cmp	SALLE
	bne	:400
	
	lda	H
	bne	:350

	@print	#strILYA
	
	inc	H

:350	lda	HH
	beq	:360

	@print	#strCOMMA

:360	@print	#strSPACE

	lda	N
	asl
	tax
	ldy	tblO$,x
	lda	tblO$+1,x
	tax
	jsr	printCSTRING

	inc	HH
	
:400	inc	N
	lda	N
	cmp	#nbO
	bcc	:310
	beq	:310

	@print	#strRETURN

*-----------------------------------
* 500 - ACCEPTATION COMMANDE
*-----------------------------------

:500	ldx	#1
	lda	C,x
	cmp	#2
	bcc	:501
	dec	C,x

:501	ldx	#2
	lda	C,x
	cmp	#2
	bcc	:502
	dec	C,x

:502	ldx	#4
	lda	C,x
	cmp	#2
	bcc	:503
	dec	C,x

:503	ldx	#6
	lda	C,x
	cmp	#2
	bcc	:504
	dec	C,x

:504	ldx	#10
	lda	O,x
	cmp	SALLE
	beq	:505
	cmp	#-1
	bne	:510

:505	ldx	#3
	lda	C,x
	cmp	#2
	bcc	:510
	dec	C,x
	
:510	lda	#1
	sta	T
	lda	#0
	sta	N
	jmp	:1000

:530	lda	switchENERGIE+1
	beq	:531
	@print	#strCMD		; commande sans energie
	jmp	:535	
:531	@print	#strCOMMANDE	; commande avec energie

:535	jsr	GETLN1
	jsr	rewriteSTRING	; from lower to upper
	jsr	:6000	; cherche les mots

	lda	MO$1
	bne	:900

	lda	VBL	; LOGO - Use a better RND?
	eor	VERTCNT
	and	#7
	clc
	adc	#1
	asl
	tax
	ldy	tbl580,x
	lda	tbl580+1,x
	tax
	jsr	printCSTRING
	jmp	:100

*-----------------------------------
* 900 - CONTROLES APPLE II
*-----------------------------------

:900	cmp	#idxQUITTER	; quitter
	bne	:905
	jmp	:20050

:905	cmp	#idxCASSE
	bne	:910
	
	jsr	switchCASE
	jmp	:100

:910	cmp	#idxENERGIE
	bne	:915
	
	jsr	switchENERGIE
	jmp	:100

*-----------------------------------
* 910 - CONTROLE MVT
*-----------------------------------

:915	ldy	#0

:920	lda	SALLE	; T$=MID(M$(SALLE),Z,2)
	asl
	tax
	lda	tblM$,x
	sta	LINNUM
	lda	tblM$+1,x
	sta	LINNUM+1
	
	lda	(LINNUM),y
	beq	:980
	cmp	MO$1
	bne	:970

:950	iny
	lda	(LINNUM),y
	sta	SALLE
	jmp	:100
	
:970	iny
	iny
	bne	:920

:980	lda	#0
	sta	T
	sta	A1
	
*-----------------------------------
* 1000 - CONTROLE
*-----------------------------------

:1000	lda	#0
	sta	NL

:1100	inc	NL
	
	lda	T
	beq	:1150

	lda	NL	; E$=C$(NL)
	asl
	tax
	lda	tblC$,x
	sta	LINNUM
	lda	tblC$+1,x
	sta	LINNUM+1

	ldy	#0
	lda	(LINNUM),y
	tax
]lp	lda	(LINNUM),y
	sta	E$,y
	iny
	dex
	bpl	]lp
	jmp	:1400

:1150	lda	NL
	cmp	#AA
	bcc	:1200
	beq	:1200

	lda	A1
	cmp	#1
	bne	:1170
	jmp	:500

:1170	@print	#strIMPOSSIBLE

	lda	MO$1	; les directions
	cmp	#10+1
	bcs	:1190
	
	@print	#strCECHEMIN
	
:1190	@print	#strEXCLAM
	jmp	:100

:1200	ldx	NL
	lda	tblA1,x
	cmp	MO$1
	beq	:1210
	jmp	:1100

:1210	lda	tblA2,x
	beq	:1230
	cmp	MO$2
	beq	:1230
	jmp	:1100
	
:1230	lda	tblAL$,x
	sta	LINNUM
	lda	tblAH$,x
	sta	LINNUM+1

	ldy	#0
	lda	(LINNUM),y
	tax
]lp	lda	(LINNUM),y
	sta	E$,y
	iny
	dex
	bpl	]lp
	
*-----------------------------------
* 1400 - CONDITIONS
*-----------------------------------

:1400	lda	#1
	sta	E
	
:1420	ldx	E
	lda	E$,x
	cmp	#"."
	bne	:1430
	jmp	:1700	; do actions

:1430	sec
	sbc	#"A"
	asl
	pha
	
	lda	#0
	sta	OK
	
	lda	E$+1,x
	sec
	sbc	#"0"
	tay
	lda	tblD2H,y
	sta	N

	lda	E$+2,x
	sec
	sbc	#"0"
	clc
	adc	N
	sta	N

	pla
	tax
	lda	tbl1500,x
	sta	:1450+1
	lda	tbl1500+1,x
	sta	:1450+2
	
:1450	jsr	$bdbd
	
	lda	OK
	bne	:1470
	jmp	:1100

:1470	lda	E
	clc
	adc	#3
	sta	E
	jmp	:1420

*--------

tbl1500	da	:1500,:1510,:1520,:1530,:1540
	da	:1550,:1560,:1570,:1580
	
*-------- A

:1500	lda	N
	cmp	SALLE
	bne	:1505
	lda	#1
	sta	OK
:1505	rts
	
*-------- B

:1510	ldx	N
	lda	O,x
	cmp	#-1
	beq	:1515
	cmp	SALLE
	bne	:1516
:1515	lda	#1
	sta	OK
:1516	rts
	
*-------- C

:1520	ldx	N
	lda	O,x
	cmp	SALLE
	bne	:1525
	rts
:1525	cmp	#-1
	bne	:1527
	rts
:1527	lda	#1
	sta	OK
	rts

*-------- D

:1530	ldx	N
	lda	O,x
	cmp	#-1
	bne	:1535
	lda	#1
	sta	OK
:1535	rts

*-------- E

:1540	ldx	N
	lda	P,x
	cmp	#1
	bne	:1545
	lda	#1
	sta	OK
:1545	rts

*-------- F

:1550	ldx	N
	lda	P,x
	bne	:1555
	lda	#1
	sta	OK
:1555	rts

*-------- G

:1560	ldx	N
	lda	C,x
	cmp	#1
	bne	:1565
	lda	#1
	sta	OK
:1565	rts

*-------- H

:1570	rts
*	lda	VBL	; LOGO - Use a better RND?
*	eor	VERTCNT
*	cmp	N
*	bcs	:1575
*	lda	#1
*	sta	OK
*:1575	rts

*-------- I

:1580	lda	N
	cmp	SALLE
	beq	:1585
	lda	#1
	sta	OK
:1585	rts

*-----------------------------------
* 1700 - ACTIONS
*-----------------------------------

:1700	inc	E
	
	lda	#1
	sta	A1

:1710	ldx	E
	lda	E$,x
	cmp	#"."
	bne	:1720
	jmp	:1100

:1720	sec
	sbc	#"A"
	asl
	pha		; LI

	lda	E$+1,x
	cmp	#"."
	beq	:1740

	sec
	sbc	#"0"
	tay
	lda	tblD2H,y
	sta	N

	lda	E$+2,x
	sec
	sbc	#"0"
	clc
	adc	N
	sta	N

:1740	lda	#0
	sta	BREAK

	pla
	tax
	lda	tbl1800,x
	sta	:1750+1
	lda	tbl1800+1,x
	sta	:1750+2

:1750	jsr	$bdbd

	lda	BREAK
	beq	:1780
	asl
	tax
	lda	tblBRKA,x
	sta	:1762+1
	lda	tblBRKA+1,x
	sta	:1762+2
:1762	jmp	$bdbd

:1780	lda	E
	clc
	adc	#3
	sta	E
	jmp	:1710

*-------- The modified BREAK table

tblBRKA	da	$bdbd
	da	:100,:500,:530
	
*-----------------------------------
* 1800
*-----------------------------------

tbl1800	da	:1800,:1900
	da	:2000,:2100,:2200,:2300,:2400,:2500,:2600,:2700,:2800,:2900
	da	:3000,:3100,:3200
	
*-------- A

:1800	lda	#0
	sta	G
	sta	HH
	sta	H	; for comma
	
*	lda	#2	; 500
*	sta	BREAK

:1810	inc	G
	lda	G
	tax
	lda	O,x
	cmp	#-1
	beq	:1840

	lda	G
	cmp	#nbO
	bcc	:1810
	bcs	:1870
	
:1840	lda	HH
	bne	:1850

	@print	#strVOUSDETENEZ
	
:1850	inc	HH

	lda	H
	beq	:1860
	
	@print	#strCOMMA

:1860	@print	#strSPACE

	lda	G
	asl
	tax
	ldy	tblO$,x
	lda	tblO$+1,x
	tax
	jsr	printCSTRING

	inc	H
	
	lda	G
	cmp	#nbO
	bcc	:1810
	
:1870	lda	HH
	beq	:1880

	@print	#strPOINT
	rts

:1880	@print	#strVOUSRIEN
	rts

*-------- B

:1900	lda	S
	cmp	#nbOaP	; nombre d'objets à porter
	bcc	:1930
	
	@print	#strEVIDENT

:1920	lda	#1
	sta	BREAK
	rts

:1930	ldx	N
	lda	O,x
	cmp	#-1
	bne	:1960

	@print	#strVOUSLAVEZ
	jmp	:1920

:1960	lda	#-1
	sta	O,x
	
	inc	S
	rts

*-------- C

:2000	ldx	N
	lda	O,x
	cmp	#-1
	beq	:2030

	@print	#strNOTOWNED

	lda	#2
	sta	BREAK
	rts

:2030	lda	SALLE
	sta	O,x

	dec	S
	rts

*-------- D

:2100	lda	N
	asl
	tax
	lda	tbl4000,x
	sta	:2112+1
	lda	tbl4000+1,x
	sta	:2112+2

:2112	jmp	$bdbd

*-------- E

:2200	ldx	N
	lda	#1
	sta	P,x
	rts

*-------- F

:2300	ldx	N
	lda	#0
	sta	P,x
	rts

*-------- G

:2400	ldx	N
	lda	tblAL$,x
	sta	LINNUM
	lda	tblAH$,x
	sta	LINNUM+1
	
	ldy	E	; +3
	iny
	iny
	sty	E
	iny
	lda	(LINNUM),y
	sec
	sbc	#"0"
	tax
	lda	tblD2H,x
	
	ldx	N
	sta	C,x
	
	iny
	lda	(LINNUM),y
	sec
	sbc	#"0"
	clc
	adc	C,x
	sta	C,x
	rts

*-------- H

:2500	ldx	N
	lda	#0
	sta	O,x
	rts

*:2500	ldx	N
*	lda	O,x
*	cmp	#-1
*	bne	:2510
*	
*	dec	S
*
*:2510	lda	#0
*	sta	O,x
*	rts
*
*:2500	lda	N	; exchange object
*	asl		; do it here on pointers
*	tax		; not on strings
*	lda	tblO$,x
*	pha
*	lda	tblO$+1,x
*	pha
*	
*	lda	tblO$+2,x
*	sta	tblO$,x
*	lda	tblO$+3,x
*	sta	tblO$+1,x
*	
*	pla
*	sta	tblO$+3,x
*	pla
*	sta	tblO$+2,x
*	rts

*-------- I

:2600	lda	N
	sta	SALLE
	rts

*-------- J

:2700	@print	#strDACCORD

*-------- K

:2800
	lda	#2
	sta	BREAK
	rts

*-------- L

:2900	lda	#3
	sta	BREAK
	rts

*-------- M

:3000	lda	#1
	sta	BREAK
	rts
	
*-------- N

:3100	jmp	:perdu

*-------- O

:3200	ldx	N
	lda	SALLE
	sta	O,x
	rts

*-----------------------------------
* 4000 - LES REPONSES
*-----------------------------------

tbl4000	da	$bdbd
	da	:4010,:4020,:4030,:4040,:4050,:4060,:4070,:4080,:4090
	da	:4100,:4110,:4120,:4130,:4140,:4150,:4160,:4170,:4180,:4190
	da	:4200,:4210,:4220,:4230,:4240,:4250,:4260,:4270,:4280,:4290
	da	:4300,:4310,:4320,:4330,:4340,:4350,:4360,:4370,:4380,:4390
	da	:4400,:4410,:4420,:4430,:4440,:4450,:4460,:4470,:4480,:4490
	da	:4500,:4510,:4520,:4530,:4540,:4550,:4560,:4570,:4580,:4590
	da	:4600,:4610,:4620,:4630,:4640,:4650,:4660,:4670,:4680,:4690
	da	:4700,:4710,:4720,:4730,:4740,:4750
	
*--------

:4010	@print	#str4010
	jmp	:perdu

:4020	@print	#str4020
	jmp	:perdu

:4030	@print	#str4030
	jmp	:perdu

:4040	@print	#str4040
	jmp	:perdu

:4050	@print	#str4050
	rts

:4060	@print	#str4060
	rts

:4070	@print	#str4070
	jmp	:perdu

:4080	@print	#str4080
	jmp	:perdu

:4090	@print	#str4090
	jmp	:perdu

:4100	@print	#str4100
	jmp	:perdu

:4110	@print	#str4110
	jmp	:perdu

:4120	@print	#str4120
	jmp	:perdu

:4130	@print	#str4130
	jmp	:perdu

:4140	@print	#str4140
	jmp	:perdu

:4150	@print	#str4150
	jmp	:perdu

:4160	@print	#str4160
	jmp	:perdu

:4170	@print	#str4170
	jmp	:perdu

:4180	@print	#str4180
	jmp	:perdu

:4190	@print	#str4190
	jmp	:perdu

:4200	@print	#str4200
	jmp	:perdu

:4210	@print	#str4210
	jmp	:perdu

:4220	@print	#str4220
	jmp	:perdu

:4230	@print	#str4230
	rts

:4240	@print	#str4240
	jmp	:perdu

:4250	@print	#str4250
	rts

:4260	@print	#str4260
	rts

:4270	@print	#str4270
	rts

:4280	@print	#str4280
	rts

:4290	@print	#str4290
	rts

:4300	@print	#str4300
	rts

:4310	@print	#str4310
	jmp	:perdu

:4320	@print	#str4320
	rts

:4330	@print	#str4330
	rts

:4340	@print	#str4340
	rts

:4350	@print	#str4350
	rts

:4360	@print	#str4360
	jmp	:perdu

:4370	@print	#str4370
	jmp	:perdu

:4380	@print	#str4380
	rts
	
:4390	@print	#str4390
	rts
	
:4400	@print	#str4400
	rts

:4410	@print	#str4410
	jmp	:perdu

:4420	@print	#str4420
	jmp	:perdu

:4430	@print	#str4430
	jmp	:perdu

:4440	@print	#str4440
	jmp	:perdu

:4450	@print	#str4450
	jmp	:perdu

:4460	@print	#str4460
	rts

:4470	@print	#str4470
	jmp	:perdu

:4480	@print	#str4480
	jmp	:perdu
	
:4490	@print	#str4490
	jmp	:perdu
	
:4500	@print	#str4500
	jmp	:perdu

:4510	@print	#str4510
	jmp	:gagne

:4520	@print	#str4520
	jmp	:perdu
	
:4530	@print	#str4530
	jmp	:perdu

:4540	@print	#str4540
	jmp	:perdu

:4550	@print	#str4550
	rts

:4560	@print	#str4560
	jmp	:perdu

:4570	@print	#str4570
	jmp	:perdu

:4580	@print	#str4580
	jmp	:perdu

:4590	@print	#str4590
	rts
	
:4600	@print	#str4600
	rts
	
:4610	@print	#str4610
	jmp	:perdu

:4620	@print	#str4620
	rts
	
:4630	@print	#str4630
	rts
	
:4640	@print	#str4640
	rts

*--- On a libéré la fille !
	
:4650	@print	#str4650
	lda	#<salleBA
	sta	ptrSALLEBA
	lda	#>salleBA
	sta	ptrSALLEBA+1
	rts

*---

:4660	lda	VBL	; LOGO - Use a better RND?
	eor	VERTCNT
	and	#7
	clc
	adc	#1
:4665	asl
	tax
	ldy	tbl4660,x
	lda	tbl4660+1,x
	tax
	jsr	printCSTRING
	rts

:4670	lda	#1
	bne	:4665
	
:4680	lda	#2
	bne	:4665
	
:4690	lda	#3
	bne	:4665
	
:4700	lda	#4
	bne	:4665
	
:4710	lda	#5
	bne	:4665

:4720	lda	#6
	bne	:4665
	
:4730	lda	#7
	bne	:4665
	
:4740	lda	#8
	bne	:4665
	
:4750	lda	#9
	bne	:4665

*-----------------------------------
* 6000 - ANALYSE DU MOT
*-----------------------------------

:6000	lda	#0
	sta	N
	sta	X$1
	sta	X$2

	sta	MO$1
	sta	MO$2

* 1. cherche le premier caractère

	ldx	#0	; cherche le premier caractere
]lp	lda	TEXTBUFFER,x
*	cmp	#chrRET
*	beq	:6021
	cmp	#chrSPC
	bne	:6022	; on a trouvé un caractère
	inx
	cpx	lenSTRING
*	bcs	:6021
*	cpx	#nbCAR
	bcc	]lp
:6021	rts		; retourne sans avoir trouve

* 2. recopie le mot

* 0123456789A
* 123456789
* PREN COMBI\

:6022	ldy	#1
]lp	lda	TEXTBUFFER,x
	cmp	#chrRET
	beq	:6023
	cmp	#chrSPC
	beq	:6023
	sta	X$1,y	; 0P1R2E3N4
	inx
	cpx	lenSTRING
	bcs	:6023
	iny
	cpy	#4
	bcc	]lp
	beq	]lp
	dey
:6023	sty	X$1	; sauve la longueur

* 3. cherche un espace

*	inx
]lp	lda	TEXTBUFFER,x
*	cmp	#chrRET
*	beq	:6032
	cmp	#chrSPC
	beq	:6032
	inx		; 5
	cpx	lenSTRING
*	bcs	:6100
*	cpx	#nbCAR
	bcc	]lp
	bcs	:6100
		
* 4. recopie le mot

:6032	inx
	ldy	#1
]lp	lda	TEXTBUFFER,x
	cmp	#chrRET
	beq	:6033
	cmp	#chrSPC
	beq	:6033
	sta	X$2,y
	inx
	cpx	lenSTRING
	bcs	:6033
	iny
	cpy	#4
	bcc	]lp
	beq	]lp
	dey
:6033	sty	X$2	; sauve la longueur

* 5. cherche le mot dans les options
* X$1 4 PREN
* X$2 4 LAMP
* V$x 6 04PREN 
*     0 123456

:6100	lda	X$1
	bne	:6110
	rts
	
:6110	ldy	#1
]lp	lda	tblVL$,y
	sta	:6225+1
	lda	tblVH$,y
	sta	:6225+2

	ldx	#0
:6225	lda	$bdbd,x
	cmp	X$1,x
	bne	:6250
	inx
	cpx	X$1
	bcc	:6225
	beq	:6225
	
	lda	tblV,y
	sta	MO$1
	bne	:6300
	
:6250	iny
	cpy	#V
	bcc	]lp
	beq	]lp
	
* 6. on change de mot

:6300	lda	X$2
	bne	:6310
	rts
	
:6310	ldy	#1
]lp	lda	tblVL$,y
	sta	:6325+1
	lda	tblVH$,y
	sta	:6325+2

	ldx	#0
:6325	lda	$bdbd,x
	cmp	X$2,x
	bne	:6350
	inx
	cpx	X$2
	bcc	:6325
	beq	:6325
	
	lda	tblV,y
	sta	MO$2
	bne	:6400
	
:6350	iny
	cpy	#V
	bcc	]lp
	beq	]lp

:6400	rts

*-----------------------------------
* 7000 - DESCRIPTION DES PIECES
*-----------------------------------

tbl7000	da	$bdbd
	da	:7010,:7020,:7030,:7040,:7050,:7060,:7070,:7080,:7090
	da	:7100,:7110,:7120,:7130,:7140,:7150,:7160,:7170,:7180,:7190
	da	:7200,:7210,:7220,:7230,:7240,:7250,:7260,:7270,:7280,:7290
	da	:7300,:7310,:7320,:7330,:7340,:7350,:7360,:7370,:7380,:7390
	da	:7400,:7410,:7420,:7430,:7440,:7450,:7460,:7470,:7480,:7490
	da	:7500,:7510,:7520,:7530,:7540,:7550,:7560,:7570,:7580,:7590
	da	:7600

:7010	@print	#str8010
	@draw	#1
	rts

:7020	@print	#str8020
	@draw	#2
	rts

:7030	@print	#str8030
	@draw	#3
	rts

:7040	@print	#str8040
	@draw	#4
	rts

:7050	@print	#str8050
	@draw	#5
	rts

:7060	@print	#str8060
	@draw	#6
	rts

:7070	@print	#str8070
	@draw	#7
	rts

:7080	@print	#str8080
	@draw	#8
	rts

:7090	@print	#str8090
	@draw	#9
	rts

:7100	@print	#str8100
	@draw	#10
	rts

:7110	@print	#str8110
	@draw	#11
	rts

:7120	@print	#str8120
	@draw	#12
	rts

:7130	@print	#str8130
	@draw	#13
	rts

:7140	@print	#str8140
	@draw	#14
	rts

:7150	@print	#str8150
	@draw	#15
	rts

:7160	@print	#str8160
	@draw	#16
	rts

:7170	@print	#str8170
	@draw	#17
	rts

:7180	@print	#str8180
	@draw	#18
	rts

:7190	@print	#str8190
	@draw	#19
	rts

:7200	@print	#str8200
	@draw	#20
	rts

:7210	@print	#str8210
	@draw	#21
	rts

:7220	@print	#str8220
	@draw	#22
	rts

:7230	@print	#str8230
	@draw	#23
	rts

:7240	@print	#str8240
	@draw	#24
	rts

:7250	@print	#str8250
	@draw	#25
	rts

:7260	@print	#str8260
	@draw	#26
	rts

:7270	@print	#str8270
	@draw	#27
	rts

:7280	@print	#str8280
	@draw	#28
	rts

:7290	@print	#str8290
	@draw	#29
	rts

:7300	@print	#str8300
	@draw	#30
	rts

:7310	@print	#str8310
	@draw	#31
	rts

:7320	@print	#str8320
	@draw	#32
	rts

:7330	@print	#str8330
	@draw	#33
	rts

:7340	@print	#str8340
	@draw	#34
	rts

:7350	@print	#str8350
	@draw	#35
	rts

:7360	@print	#str8360
	@draw	#36
	rts

:7370	@print	#str8370
	@draw	#37
	rts

:7380	@print	#str8380
	@draw	#38
	rts

:7390	@print	#str8390
	@draw	#39
	rts

:7400	@print	#str8400
	@draw	#40
	rts

:7410	@print	#str8410
	@draw	#41
	rts

:7420	@print	#str8420
	@draw	#42
	rts

:7430	@print	#str8430
	@draw	#43
	rts

:7440	@print	#str8440
	@draw	#44
	rts

:7450	@print	#str8450
	@draw	#45
	rts

:7460	@print	#str8460
	@draw	#46
	rts

:7470	@print	#str8470
	@draw	#47
	rts

:7480	@print	#str8480
	@draw	#48
	rts

:7490	@print	#str8490
	@draw	#49
	rts

:7500	@print	#str8500
	@draw	#50
	rts

:7510	@print	#str8510
	@draw	#51
	rts

:7520	@print	#str8520
	@draw	#52
	rts

:7530	@print	#str8530
	@draw	#53
	rts

:7540	@print	#str8540
	@draw	#54
	rts

:7550	@print	#str8550
	@draw	#55
	rts

:7560	@print	#str8560
	@draw	#56
	rts

:7570	@print	#str8570
	@draw	#57
	rts

:7580	@print	#str8580
	@draw	#58
	rts

:7590	@print	#str8590
	@draw	#59
	rts

:7600	@print	#str8600
	@draw	#60
	rts

*-----------------------------------
* 8000 - CHARGEMENT VARIABLES
*-----------------------------------

initALL
	ldx	#FIN_DATA-DEBUT_DATA
	lda	#0
]lp	sta	A1-1,x
	dex
	bne	]lp

*---

	lda	#<filleNUE	; remet l'image sur la fille nue
	sta	ptrSALLEBA
	lda	#>filleNUE
	sta	ptrSALLEBA+1
	
	lda	#1
	sta	SALLE

	lda	#5	; 5000
	sta	TEMPS
	lda	#0
	sta	TEMPS+1
	sta	TEMPS+2
	sta	TEMPS+3

	lda	#"5"
	sta	strTEMPS
	lda	#"0"
	sta	strTEMPS+1
	sta	strTEMPS+2
	sta	strTEMPS+3

*---

	ldx	#nbO	; reset object table
]lp	lda	refO,x
	sta	O,x
	dex
	bpl	]lp
	
	ldx	#nbO*2	; reset object table
]lp	lda	refO$,x
	sta	tblO$,x
	dex
	bpl	]lp
	rts

*-----------------------------------
* 20000 - PERDU
*-----------------------------------

:perdu
	@explode
	@draw	#3
	@wait	#400
	
	jsr	setTEXTFULL
	@print	#strPERDU
	@play	#zikPERDU
	@print	#strPERDU2

:20050			; commun avec gagne
]lp	@print	#strREPLAY
	jsr	translateKEY
	cmp	#chrNON
	beq	:20001
	cmp	#chrOUI
	bne	]lp
	jmp	REPLAY

:20001
	lda	sauveMONO
	sta	MONOCOLOR
	lda	sauveCYA
	sta	CYAREG

	jsr	PRODOS	; exit
	dfb	$65
	da	proQUIT
	brk	$bd	; on ne se refait pas ;-)

*--- Data

proQUIT	dfb	4
	ds	1
	ds	2
	ds	1
	ds	2

sauveCYA	ds	1
sauveMONO ds	1
	
*-----------------------------------
* 32000 - GAGNE
*-----------------------------------

:gagne
	@draw	#6
	@wait	#400
	jsr	setTEXTFULL
	@print	#strGAGNE
	@play	#zikINTRODUCTION
	jmp	:20050

*-----------------------------------
* ORIC
*-----------------------------------

EXPLODE	ldx	#$25
]lp	lda	TXTSET
	lda	#$25
	jsr	WAIT
	lda	TXTCLR
	lda	#$25
	jsr	WAIT
	dex
	bpl	]lp
	rts

*-----------------------------------
* CODE 6502
*-----------------------------------

*----------------------
* setTEXTFULL
*----------------------

setTEXTFULL		; 40x24 text
	sta	CLR80VID
	jsr	INIT	; text screen
	jsr	SETNORM	; set normal text mode
	jsr	SETKBD	; reset input to keyboard
	jmp	HOME	; home cursor and clear to end of page

*----------------------
* setHGR
*----------------------

setHGR			; HGR
	sta	TXTCLR
	sta	MIXCLR
	sta	TXTPAGE1
	sta	HIRES	
	rts

*----------------------
* switchCASE
*----------------------

switchCASE
	lda	fgCASE
	eor	#$80
	sta	fgCASE
	rts

*----------------------
* GETLEN1 par LoGo
*----------------------

GETLN1	ldx	#0
]lp	jsr	RDKEY
	cmp	#chrRET
	beq	doRET
	cmp	#chrDEL
	beq	doBACK
	cmp	#chrLA
	beq	doBACK
	cmp	#chrRA
	beq	]lp

	jsr	testENERGIE

	sta	TEXTBUFFER,x
	jsr	COUT
doNEXT	inx
	cpx	#maxLEN
	bcc	]lp

doEXIT	lda	#chrRET
	sta	TEXTBUFFER,x
	stx	lenSTRING
	jmp	COUT

doBACK	cpx	#0
	beq	]lp
	dec	CH
	dex
	jmp	]lp

doRET	cpx	#0
	bne	doEXIT

	jsr	switchVIDEO
	jmp	]lp

*----------------------
* ENERGIE
*----------------------

switchENERGIE
	lda	#0
	eor	#1
	sta	switchENERGIE+1
	rts

testENERGIE	tay
	lda	switchENERGIE+1
	beq	wedoENERGIE
	tya
	rts

wedoENERGIE	dec	TEMPS+3
	lda	TEMPS+3
	bpl	printENERGIE
	lda	#9
	sta	TEMPS+3
	dec	TEMPS+2
	bpl	printENERGIE
	lda	#9
	sta	TEMPS+2
	dec	TEMPS+1
	bpl	printENERGIE
	lda	#9
	sta	TEMPS+1
	dec	TEMPS
	bpl	printENERGIE
	jmp	:4370	; la fin !!!

printENERGIE
	lda	TEMPS
	ora	#"0"
	sta	strTEMPS
	lda	TEMPS+1
	ora	#"0"
	sta	strTEMPS+1
	lda	TEMPS+2
	ora	#"0"
	sta	strTEMPS+2
	lda	TEMPS+3
	ora	#"0"
	sta	strTEMPS+3

	tya	; restore Y
	rts

*----------------------
* switchVIDEO
*----------------------

switchVIDEO
	lda	#0
	eor	#1
	sta	switchVIDEO+1
	bne	setMIXEDOFF
	
*----------------------
* setMIXEDON
*----------------------

setMIXEDON		; HGR + 4 LINES OF TEXT
	sta	TXTCLR
	sta	MIXSET
	rts

*----------------------
* setMIXEDOFF
*----------------------

setMIXEDOFF		; FULL HGR
	sta	TXTSET
	sta	MIXSET
	rts

*----------------------
* printCSTRING
*----------------------

*-------------- PRINT C STRING
* on prend la longueur d'un mot
* on ajoute à CH
* si >39 alors
*  RC
* print word

printCSTRING	sty	pcs1+1
	stx	pcs1+2
	sty	dpTEXT
	stx	dpTEXT+1

*--- All cases: check string length

	ldy	#0
]lp	lda	(dpTEXT),y
	beq	pcsEOS
	iny
	bne	]lp
	ldy	#scrWIDTH
pcsEOS	cpy	#scrWIDTH
	bcc	pcs1
	jmp	pcsLONG

*--- Case 1: string length is <40

pcs1	lda	$ffff
	beq	pcs4
	
	bit	fgCASE
	bpl	pcs2
	tax		; from lower to upper
	lda	tblKEY,x

pcs2	jsr	COUT
	
	inc	pcs1+1
	bne	pcs1
	inc	pcs1+2
	bne	pcs1
	
pcs4	rts

*--- Case 2: string length is >39

* 012345678
* ANTOINE_TOINET
* ANTOINE/

pcsLONG	ldy	#0
	sty	wordLEN

]lp	lda	(dpTEXT),y	; get word length
	beq	pcslEOS	; end of string
	cmp	#chrRET
	beq	pcslEOW	; end of word (with a return)
	cmp	#chrSPC
	beq	pcslEOW	; end of word (with a space)
	iny
	bne	]lp

pcslEOW	iny		; output the space character
pcslEOS	sty	wordLEN	; save nb of chars to output
	tya		; end X pos =+ word length
	clc
	adc	CH
	cmp	#scrWIDTH
	bcc	pcslGOOD	; we can output the word normally
	beq	pcslGOOD
	
	lda	#chrRET	; must perform a CR before outputting
	jsr	COUT

pcslGOOD	ldy	#0
]lp	lda	(dpTEXT),y
	beq	pcslEND

	bit	fgCASE
	bpl	pcslg2
	tax		; from lower to upper
	lda	tblKEY,x

pcslg2	cmp	#chrSPC	; shall we skip the space character?
	bne	pcslg4

	lda	CH	; beginning of screen
	beq	pcslg5
	cmp	#scrWIDTH-1	; end of screen
	beq	pcslg5
	lda	#chrSPC

pcslg4	jsr	COUT	; output the char

	iny		; until end of string
	cpy	wordLEN
	bcc	]lp
	
pcslg5	lda	dpTEXT
	clc
	adc	wordLEN
	sta	dpTEXT
	lda	dpTEXT+1
	adc	#0
	sta	dpTEXT+1
	jmp	pcsLONG

pcslEND	rts

*--- Data

wordLEN	ds	1
fgCASE	ds	1	; $00 lower OK, $80 otherwise

*----------------------
* waitMS
*----------------------

switchWAIT
	lda	waitMS+1
	eor	#1
	sta	waitMS+1
	rts

waitMS	lda	#0	; skip if not zero
	bne	waitMS9
	
	sty	LINNUM
doW1	ldy	LINNUM
]lp	lda	#60	; 1/100ème de seconde
	jsr	WAIT
	dey
	bne	]lp
	dex
	bpl	doW1
waitMS9	rts

*-----------------------------
* MOTEUR
*-----------------------------

showPIC	pha

	jsr	HGR
	sta	MIXCLR

	ldx	#>picFRAME
	ldy	#<picFRAME
	jsr	drawPICTURE

	pla
	asl
	tax
	lda	tblIMAGES,x
	sta	LINNUM
	lda	tblIMAGES+1,x
	sta	LINNUM+1
	ora	LINNUM
	bne	showPIC1
	sec
	rts

showPIC1	ldx	LINNUM+1
	ldy	LINNUM

*----------------------
* drawPICTURE
*----------------------

drawPICTURE
	sty	drawREAD+1
	stx	drawREAD+2

drawLOOP	jsr	drawREAD
	cmp	#0
	bne	drawPIC1
	rts		; the end

drawPIC1	pha
	and	#%11_000000
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	sta	theINK	; c'est PEN mais bon

	pla
	lsr
	bcs	doLINE
	lsr
	bcs	doPLOT

* fill

	jsr	drawREAD
	jsr	drawREAD
	jmp	drawLOOP

*----------------------------------- PLOT

doPLOT	jsr	drawREAD
	sta	theX
	jsr	drawREAD
	sta	theY
	
	lda	#nbLINES
	sec
	sbc	theY
	sta	theY
	jmp	drawLOOP

*----------------------------------- LINE ABS

doLINE	jsr	drawREAD
	sta	theX2

	jsr	drawREAD
	sta	theY2

	lda	#nbLINES
	sec
	sbc	theY2
	sta	theY2

*---------- Check height

	lda	theY
	cmp	#maxY
	bcc	doD1
	lda	#maxY
	sta	theY

doD1	lda	theY2
	cmp	#maxY
	bcc	doD2
	lda	#maxY
	sta	theY2
doD2
	
*---------- It is now time to draw as we have all variables

*	ldy	theINK	; the ink color
*	ldy	#0	; LOGO
*	ldx	oric2hgr,y	; from the Oric to the Apple II
	ldx	#7
	jsr	HCOLOR+3	; to skip CHRGET 

	ldx	theX	; HPLOT x,y
	ldy	#0	; theX+1
	lda	theY
	sec
	sbc	#deltaY	; -32 pour les images du jeu
	jsr	HPLOT

*	ldy	theY2
	lda	theY2
	sec
	sbc	#deltaY
	tay
	lda	theX2	; TO x2,Y2
	ldx	#0	; theX2+1
	jsr	HILIN	; draw the line

	lda	X0L	; save the updated coords
	sta	theX
*	lda	X0H
*	sta	theX+1
	lda	Y0
	clc
	adc	#deltaY
	sta	theY
	jmp	drawLOOP

*-------- Read data
	
drawREAD	lda	$bdbd
	inc	drawREAD+1
	bne	drawREAD1
	inc	drawREAD+2
drawREAD1	rts
	
*----------------------
* Données du moteur
*----------------------

picFRAME	hex	42
	dfb	0,0
	hex	41
	dfb	0,149
	hex	41
	dfb	199,149
	hex	41
	dfb	199,0
	hex	41
	dfb	0,0
	hex	00

*---

theX	dfb	140	; milieu de l'écran par défaut
theY	dfb	96
theX2	ds	1
theY2	ds	1
theRADIUS	ds	1
theFB	ds	1
theINK	ds	1
thePAPER	ds	1
*deltaY	ds	1	; 0 or 32 - constante

*	APPLE	ORIC
* 0	black1	black
* 1	green	red
* 2	blue	green
* 3	white1	yellow
* 4	black2	blue
* 5	-	magenta
* 6	-	cyan
* 7	white2	white

*oric2hgr	hex	0705010602030400

*-----------------------------------
* rewriteSTRING (lower -> upper)
*-----------------------------------

rewriteSTRING
	ldx	#0
]lp	ldy	TEXTBUFFER,x
	lda	tblKEY,y
	sta	TEXTBUFFER,x
	inx
	cpx	lenSTRING
	bcc	]lp
	rts

*-----------------------------------
* translateKEY (lower -> upper)
*-----------------------------------

translateKEY
	jsr	RDKEY
	tax
	lda	tblKEY,x
	rts

tblKEY
	hex	00,01,02,03,04,05,06,07,08,09,0A,0B,0C,0D,0E,0F
	hex	10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F
	hex	20,21,22,23,24,25,26,27,28,29,2A,2B,2C,2D,2E,2F
	hex	30,31,32,33,34,35,36,37,38,39,3A,3B,3C,3D,3E,3F
	hex	40,41,42,43,44,45,46,47,48,49,4A,4B,4C,4D,4E,4F
	hex	50,51,52,53,54,55,56,57,58,59,5A,5B,5C,5D,5E,5F
	hex	60,61,62,63,64,65,66,67,68,69,6A,6B,6C,6D,6E,6F
	hex	70,71,72,73,74,75,76,77,78,79,7A,7B,7C,7D,7E,7F
	hex	80,81,82,83,84,85,86,87,88,89,8A,8B,8C,8D,8E,8F
	hex	90,91,92,93,94,95,96,97,98,99,9A,9B,9C,9D,9E,9F
	hex	A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,AA,AB,AC,AD,AE,AF
	hex	B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,BD,BE,BF
	hex	C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,CA,CB,CC,CD,CE,CF
	hex	D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,DA,DB,DC,DD,DE,DF
	hex	E0,C1,C2,C3,C4,C5,C6,C7,C8,C9,CA,CB,CC,CD,CE,CF
	hex	D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,DA,FB,FC,FD,FE,FF
	
*-----------------------------------
* Electric Duet Player
*-----------------------------------

*-----------------------------------
* PLAYMUSIC
*-----------------------------------

playMUSIC
	sty	$1e
	stx	$1f

	LDA	#$01
	STA	$09
	STA	$1D
	PHA
	PHA
	PHA
	BNE	LA04D
LA038	INY
	LDA	($1E),Y
	STA	$09
	INY
	LDA	($1E),Y
	STA	$1D
LA042	LDA	$1E
	CLC	
	ADC	#$03
	STA	$1E
	BCC	LA04D
	INC	$1F
LA04D	LDY	#$00
	LDA	($1E),Y
	CMP	#$01
	BEQ	LA038
	BCS	LA067
	PLA
	PLA
	PLA
LA05A	LDX	#$49
	INY
	LDA	($1E),Y
	BNE	LA063
	LDX	#$C9
LA063	BIT	KBDSTROBE
	RTS	

LA067	STA	$08
	JSR	LA05A
	STX	LA0B6
	STA	$06
	LDX	$09
LA073	LSR	
	DEX	
	BNE	LA073
	STA	LA0AE+1
	JSR	LA05A
	STX	LA0EE
	STA	$07
	LDX	$1D
LA084	LSR	
	DEX	
	BNE	LA084
	STA	LA0E6+1
*
	PLA
	TAY
	PLA
	TAX
	PLA
	BNE	LA098
LA095	BIT	SPKR
LA098	CMP	#$00
	BMI	LA09F
	NOP	
	BPL	LA0A2
LA09F	BIT	SPKR
LA0A2	STA	$4E
	BIT	KBD
	BMI	LA063
	DEY	
	BNE	LA0AE
	BEQ	LA0B4
LA0AE	CPY	#$36
	BEQ	LA0B6
	BNE	LA0B8
LA0B4	LDY	$06
LA0B6	EOR	#$40
LA0B8	BIT	$4E
	BVC	LA0C3
	BVS	LA0BE
LA0BE	BPL	LA0C9
	NOP	
	BMI	LA0CC
LA0C3	NOP	
	BMI	LA0C9
	NOP	
	BPL	LA0CC
LA0C9	CMP	SPKR
LA0CC	DEC	$4F
	BNE	LA0E1
	DEC	$08
	BNE	LA0E1
	BVC	LA0D9
	BIT	SPKR
LA0D9	PHA
	TXA
	PHA
	TYA
	PHA
	JMP	LA042

LA0E1	DEX
	BNE	LA0E6
	BEQ	LA0EC
LA0E6	CPX	#$0C
	BEQ	LA0EE
	BNE	LA0F0
LA0EC	LDX	$07
LA0EE	EOR	#$80
LA0F0	BVS	LA095
	NOP	
	BVC	LA098

*-----------------------------------
* VARIABLES
*-----------------------------------

DEBUT_DATA

A1	ds	1
BREAK	ds	1
E	ds	1
F1	ds	1
G	ds	1
H	ds	1
HH	ds	1
L	ds	1
LX	ds	1
MO$1	ds	1	; mot 1
MO$2	ds	1	; mot 2
N	ds	1
NL	ds	1
OK	ds	1
S	ds	1
SALLE	ds	1
T	ds	1
W	ds	1
Z	ds	1
lenSTRING	ds	1
TEMPS	ds	4	; le temps = 5000

C	ds	61+1
E$	ds	32	; the longest string
P	ds	61+1
X$1	ds	4+1	; premier mot saisi
X$2	ds	4+1	; second mot saisi

FIN_DATA

*--- The lazy decimal to hexadecimal conversion

tblD2H	dfb	0,10,20,30,40,50,60,70,80,90

*-----------------------------------
* UN PEU DE PLACE POUR LA MUSIQUE
*-----------------------------------

zikINTRODUCTION
	hex	0C80000C2B800C19800C1C800C19400C 
	hex	2B400C19560C2B560C80000C2B800C19 
	hex	800C1C800C19400C2B400C19560C2B56 
	hex	0102020C80000C26800C18800C19800C 
	hex	18390C26390C18400C26400C80000C26 
	hex	800C18800C19800C18440C26440C1840 
	hex	0C26400103030C80000C22800C18800C 
	hex	19800C18390C22390C18560C22560C80 
	hex	000C22800C18800C19800C18560C2256 
	hex	0C18390C22390102020C80000C20800C 
	hex	19800C1C800C19560C20560C19560C20 
	hex	560C4C000C204C0C194C0C1C4C0C1944 
	hex	0C20440C19440C20440101010C80000C 
	hex	26800C19800C1C800C19400C20400C22 
	hex	400C20400C26390C20390C22390C2039 
	hex	0C33000C2B330C2D330C33000102020C 
	hex	2D000C202D0C1C330C20330C1C390C20 
	hex	390C1C400C20400C44000C20440C1C4C 
	hex	0C204C0C1C560C20560C1C600C206001 
	hex	01010C22560C1C560C15560C16560C15 
	hex	560C1C560C20000C1C000C22560C1C56 
	hex	0C20560C1C560C2B560C22560C26000C 
	hex	2B000102020C4C000C334C0C204C0C22 
	hex	4C0C204C0C334C0C204C0C334C0C5600 
	hex	0C33560C20560C22560C204C0C334C0C 
	hex	20560C33560103030C4C000C264C0C2B 
	hex	4C0C264C0C2B000C2D000C33000C3900 
	hex	0C20720C22720C26720C15000C16000C 
	hex	19000C1C000C20000102020C22560C26 
	hex	560C2B560C15560C1C560C15560C2200 
	hex	0C1C000C2B560C26560C22560C1C560C 
	hex	20560C22560C26000C2B000101010C1E 
	hex	560C2B560C24560C26560C243C0C2B3C 
	hex	0C1E330C2B330C19560C2B560C24560C 
	hex	26560C243C0C2B3C0C1E330C2B330102 
	hex	020C60000C26600C1C600C19600C1860 
	hex	0C1C600C26600C2B600C30000C26300C 
	hex	1C330C19330C18390C1C390C22720C26 
	hex	720103030C28660C22660C28660C2266 
	hex	0C1C300C22300C1C330C22330C28390C 
	hex	22390C28390C22390C1C400C22400C1C 
	hex	440C22440102020C204C0C224C0C2633 
	hex	0C20330C22300C20300C1C300C22300C 
	hex	204C0C224C0C264C0C2B4C0C30000C33 
	hex	000C39000C40000101010C44000C3044 
	hex	0C2B440C30440C2B440C30440C2B000C 
	hex	30000102020C72000C30720C2B720C30 
	hex	720C2B720C30720C2B000C3000010101 
	hex	0C40000C33400C24400C26400C24800C 
	hex	33800C24800C33800102020C40000C33 
	hex	400C24400C26400C24800C33800C2480 
	hex	0C33800103030C40000C30400C26400C 
	hex	2B400C26800C30800C26800C30800102 
	hex	020C40000C30400C26400C2B400C2680 
	hex	0C30800C26800C30800103030C40000C 
	hex	22400C18400C19400C18800C22800C18 
	hex	800C22800102020C40000C22400C1840 
	hex	0C19400C18800C22800C18800C228001 
	hex	01010C40000C2B400C19400C1C400C19 
	hex	800C20800C22800C26800C2B800C3080 
	hex	0C33800C39800C40000C44000C4C000C 
	hex	56000102020C5A000C395A0C265A0C22 
	hex	5A0C205A0C265A0C22000C2000010401 
	hex	0101010C5A000C395A0C265A0C225A0C 
	hex	205A0C265A0C22000C20000102020C60 
	hex	000C39600C2B600C26600C22600C2B60 
	hex	0C26000C22000103030C60000C39600C 
	hex	2B600C26600C22600C2B600C26000C22 
	hex	000101010C60000C39600C2B300C2230 
	hex	0C1C300C16300C15560102020C15000C 
	hex	39000C33000C2D000C2B000C26000C22 
	hex	000C20000103030C1C560C22560C2B56 
	hex	0C26560C22560C20560C1C000C190001 
	hex	02020C18560C1C560C22560C20560C1C 
	hex	560C19560C18000C15000103030C1422 
	hex	0C15220C16220C15220C15280C18280C 
	hex	19280C18280C182B0C1C2B0C222B0C26 
	hex	2B0C2B560C30560C33560C3056010202 
	hex	0C56000C39560C2B560C22560C1C560C 
	hex	19560C18000C1C000C19560C20560C2B 
	hex	560C30560C33560C40560C39000C3300 
	hex	0101010C56000C40560C33560C2B560C 
	hex	20560C1C560C19000C20000102020C16 
	hex	260C1B260C1C260C1B260C1B2D0C1C2D 
	hex	0C1E2D0C1C2D0C1C000C20000C22000C 
	hex	20000C20000C26000C2D000C33000C39 
	ds	\
*	hex	000C2D390C26390C20390C1C400C1640 
*	hex	0C15400C16400103030C15440C1C440C 
*	hex	22440C26440C22660C1C660C2B660C22 
*	hex	660102020C39000C2B390C2D390C3339 
*	hex	0C395A0C405A0C445A0C4C5A0101010C 
*	hex	00560C00560C184C0C194C0C1C440C20 
*	hex	440C22400C26400C2B390C18390C1933 
*	hex	0C1C330C20300C22300C26400C2B4001 
*	hex	02020C304C0C194C0C1C4C0C204C0C22 
*	hex	000C26000C2B000C30000C33500C1C50 
*	hex	0C204C0C224C0C26440C28440C30800C 
*	hex	33800103030C39600C20600C22600C26 
*	hex	600C22560C1C560C2B440C1C440C2640 
*	hex	0C1C400C22390C1C390C20330C1C330C 
*	hex	262D0C1C2D0102020C22560C1C560C2B 
*	hex	440C1C440C20330C1C330C262D0C1C2D 
*	hex	0C22560C1C560C2B440C1C440C20330C 
*	hex	1C330C262D0C1C2D0101010C22560C1C 
*	hex	560C2B2B0C1C2B0C26260C1C260C2222 
*	hex	0C1C220C20200C1C200C1C1C0C1C000C 
*	hex	19190C1C190C2B2B0C1C2B0102020C1C 
*	hex	1C0C1C000C19190C1C190C18180C1C18 
*	hex	0C2B2B0C1C2B0C19190C1C190C18180C 
*	hex	1C180C15150C1C150C19190C1C190103 
*	hex	030C18180C1C180C19190C1C190C1818 
*	hex	0C1C180C1C1C0C1C000C19190C1C190C 
*	hex	1C1C0C1C000C19190C1C190C20200C1C 
*	hex	200102020C1C1C0C1C000C20200C1C20 
*	hex	0C1C1C0C1C000C22220C1C220C20200C 
*	hex	1C200C22220C1C220C20200C1C200C26 
*	hex	260C1C260101010C22220C1C220C2B2B 
*	hex	0C262B0102020C243C0C24560C22390C 
*	hex	22560C20360C20560C1E330C1E560C1C 
*	hex	300C1C560C1B2D0103030C1B560C192B 
*	hex	0C19560C18280C18560C16260C16560C 
*	hex	15240C15560C14220C14560C13200C13 
*	hex	560C121E0C12560C111C0C1156010101 
*	hex	0C10560C19560C2B560C19560C102B0C 
*	hex	192B0C102B0C192B0103030C10560C19 
*	hex	560C2B560C19560C102B0C192B0C102B 
*	hex	0C192B0101010C10560C1C560C2B560C 
*	hex	1C560C102B0C1C2B0C102B0C1C2B0103 
*	hex	030C10560C1C560C2B560C1C560C102B 
*	hex	0C1C2B0C102B0C1C2B0101010C11560C 
*	hex	1C560C2B560C1C560C11300C1C300C11 
*	hex	300C1C300102020C11560C1C560C2B56 
*	hex	0C1C560C11300C1C300C11560C1C5630 
*	hex	1040FFFFFE00FFFE1000000000000000 
	
*-----------------------------------
* LES AUTRES FICHIERS
*-----------------------------------

	ds	\
	ds	$4000-*

	put	en.s
	put	../common/images.s
	put	../common/musiques.s
	
*--- It's the end
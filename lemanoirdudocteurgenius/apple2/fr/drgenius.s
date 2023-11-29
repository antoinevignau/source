*
* Le manoir du Dr Genius
*
* (c) 1983, Loriciels (Oric)
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	mx	%11
	org	$4000
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

maxY	=	191	; 0 to 191 = 192

chrRET2	=	$8d
chrSPC2	=	$a0
TEXTBUFFER = 	$200

chrOUI	=	"O"
chrNON	=	"N"

PRODOS	=	$bf00

KBD	=	$c000
CLR80VID	=	$c00c
KBDSTROBE	=	$c010
VBL	=	$c019
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
GETLN1	=	$FD6F
COUT	=	$FDED
IDROUTINE	=	$FE1F
SETNORM	=	$FE84
SETKBD	=	$FE89

*-----------------------------------
* MACROS
*-----------------------------------

@draw	mac
	ldx	#>]1
	ldy	#<]1
	jsr	drawPICTURE
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
notiigs

*-------- CAN WE DO lowercase?

	lda	$FBB3
	cmp	#$06
	beq	lowerOK
	
	lda	#$80	; ONLY UPPERCASE
	sta	fgCASE	
lowerOK

*--------

	jsr	introPIC	; la picture GR
	jsr	:51000	; le disclaimer
	jsr	:40000	; les instructions
	
REPLAY
	jsr	initALL
	jsr	HGR

	lda	#20	; et c'est fentrŽ en plus !
	sta	WNDTOP
	lda	#24
	sta	WNDBTM
	jsr	HOME

*-----------------------------------
* DU BASIC A L'ASSEMBLEUR (BEURK)
*-----------------------------------

:100	lda	SALLE
	cmp	#14
	beq	:105
	cmp	#16
	beq	:105
	cmp	#17
	beq	:105
	cmp	#19
	beq	:105

	lda	#0
	ldx	#2
	sta	P,x

:105	ldx	#2
	lda	P,x
	beq	:200

	ldx	#22
	lda	O,x
	cmp	SALLE
	bne	:107
	ldx	#7
	lda	P,x
	cmp	#1
	beq	:200

:107	ldx	#5
	lda	O,x
	cmp	SALLE
	bne	:110
	ldx	#3
	lda	P,x
	cmp	#1
	beq	:200

:110	ldx	#9
	lda	C,x
	cmp	#2
	bcc	:130
	sec		; enter if >1
	sbc	#1
	sta	C,x

:130	jsr	HGR
	jsr	setMIXEDON
	@print	#strILFAITNOIR
	@wait	#400
	jmp	:500

*-----------------------------------
* 200 - description salle
*-----------------------------------

:200	jsr	setHGR

	@print	#strVOUS	; always output "VOUS ETES "

	lda	SALLE
	asl
	tax
	lda	tbl7000,x
	sta	:222+1
	lda	tbl7000+1,x
	sta	:222+2
	
:222	jsr	$bdbd
	jsr	setMIXEDON
	
:300	lda	#0
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
	@wait	#150

	inc	HH
	
:400	inc	N
	lda	N
	cmp	#nbO	; la constante 25
	bcc	:310
	beq	:310

	@print	#strRETURN

*-----------------------------------
* 500 - ACCEPTATION COMMANDE
*-----------------------------------

:500	lda	#1
	sta	T
	lda	#0
	sta	N
	jmp	:1000

:530	ldx	#7
	lda	C,x
	cmp	#1+1
	bcc	:540
	lda	P,x
	cmp	#1
	bne	:540
	lda	C,x
	sec
	sbc	#1
	sta	C,x
	
:540	ldx	#3
	lda	C,x
	cmp	#1+1
	bcc	:545
	lda	P,x
	cmp	#1
	bne	:545
	lda	C,x
	sec
	sbc	#1
	sta	C,x
	
:545	ldx	#4
	lda	C,x
	cmp	#1+1
	bcc	:547
	lda	P,x
	cmp	#1
	bne	:547
	lda	C,x
	sec
	sbc	#1
	sta	C,x
	
:547	ldx	#5
	lda	C,x
	cmp	#1+1
	bcc	:550
	lda	C,x
	sec
	sbc	#1
	sta	C,x
	
:550	@print	#strCOMMANDE
	jsr	GETLN1

	lda	TEXTBUFFER
	cmp	#chrRET2
	bne	:570
	jsr	switchVIDEO
	jmp	:550

:570	stx	lenSTRING	; longueur de la chaine saisie
	jsr	rewriteSTRING	; from lower to upper
	jsr	:6000	; cherche les mots

	lda	MO$1
	bne	:900
	
	@print	#strJENECOMPRENDS
	@wait	#200
	jmp	:100

*-----------------------------------
* 900 - CONTROLES APPLE II
*-----------------------------------

:900	cmp	#59	; switch wait to de/accelerate the game
	bne	:905

	jsr	switchWAIT
	jmp	:100

:905	cmp	#60	; quitter
	bne	:910
	jmp	:20050

:910	cmp	#61
	bne	:915
	
	jsr	switchCASE
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

:1200	lda	NL
	sec
	sbc	#1
	asl
	tax
	lda	tblA,x
	cmp	MO$1
	beq	:1210
	jmp	:1100

:1210	lda	tblA+1,x
	beq	:1230
	cmp	MO$2
	beq	:1230
	jmp	:1100
	
:1230	lda	tblA$,x
	sta	LINNUM
	lda	tblA$+1,x
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
	
:1420	ldx	E	; 7893
	lda	E$,x	; 7894
	cmp	#"."
	bne	:1430
	jmp	:1700	; do actions

:1430	sec		; 428F
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
	
*--------

:1500
	lda	N
	cmp	SALLE
	bne	:1505
	lda	#1
	sta	OK
:1505	rts
	
*--------

:1510
	ldx	N
	lda	O,x
	cmp	#-1
	beq	:1515
	cmp	SALLE
	bne	:1516
:1515	lda	#1
	sta	OK
:1516	rts
	
*--------

:1520
	ldx	N
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

*--------

:1530
	ldx	N
	lda	O,x
	cmp	#-1
	bne	:1535
	lda	#1
	sta	OK
:1535	rts

*--------

:1540
	ldx	N
	lda	P,x
	cmp	#1
	bne	:1545
	lda	#1
	sta	OK
:1545	rts

*--------

:1550
	ldx	N
	lda	P,x
	bne	:1555
	lda	#1
	sta	OK
:1555	rts

*--------

:1560
	ldx	N
	lda	C,x
	cmp	#1
	bne	:1565
	lda	#1
	sta	OK
:1565	rts

*--------

:1570
	lda	VBL	; LOGO - Use a better RND?
	eor	VERTCNT
	cmp	N
	bcs	:1575
	lda	#1
	sta	OK
:1575	rts

*--------

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
	da	:100,:300,:500,:530,:20000
	
*-----------------------------------
* 1800
*-----------------------------------

tbl1800	da	:1800,:1900
	da	:2000,:2100,:2200,:2300,:2400,:2500,:2600,:2700,:2800,:2900
	da	:3000,:3100,:3200,:3300
	
*--------

:1800	lda	#0
	sta	G
	sta	HH
	sta	H	; for comma

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
	@wait	#100
	
:1850	inc	HH

	lda	H
	beq	:1860
	
	@print	#strCOMMA

:1860	lda	G
	asl
	tax
	ldy	tblO$,x
	lda	tblO$+1,x
	tax
	jsr	printCSTRING
	@print	#strSPACE
	@wait	#150

	inc	H
	
	lda	G
	cmp	#V
	bcc	:1810
	
:1870	lda	HH
	beq	:1880

	@print	#strPOINT
	rts

:1880	@print	#strVOUSRIEN
	@wait	#200
	rts

*--------

:1900	lda	S
	cmp	#5
	bcc	:1930
	
	@print	#strEVIDENT

:1920	@wait	#250
	lda	#1
	sta	BREAK
	rts

:1930	ldx	N
	lda	O,x
	cmp	#-1
	bne	:1960

	@print	#strVOUSLAVEZ
	@wait	#400
	@print	#strCONSEILLE
	jmp	:1920

:1960	ldx	N
	lda	#-1
	sta	O,x
	
	inc	S
	rts

*--------

:2000	ldx	N
	lda	O,x
	cmp	#-1
	beq	:2030

	@print	#strNOTOWNED
	jmp	:1920

:2030	lda	SALLE
	sta	O,x

	dec	S
	rts

*-----------------------------------
* 2100
*-----------------------------------

:2100
*	jsr	HOME

	lda	N
	asl
	tax
	lda	tbl4000,x
	sta	:2112+1
	lda	tbl4000+1,x
	sta	:2112+2

:2112	jmp	$bdbd

*--------

:2200	ldx	N
	lda	#1
	sta	P,x
	rts

*--------

:2300	ldx	N
	lda	#0
	sta	P,x
	rts

*--------

:2400	lda	N
	sec
	sbc	#1
	asl
	tax
	lda	tblA$,x
	sta	LINNUM
	lda	tblA$+1,x
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

*--------

:2500	ldx	N
	lda	O,x
	cmp	#-1
	bne	:2510
	
	dec	S

:2510	ldx	N
	lda	#0
	sta	O,x
	rts

*--------

:2600	lda	N
	sta	SALLE
	rts

*--------

:2700	@print	#strDACCORD
	@wait	#150
	lda	#2
	sta	BREAK
	rts

*--------

:2800	lda	#3
	sta	BREAK
	rts

*--------

:2900	lda	#4
	sta	BREAK
	rts

*--------

:3000	lda	#1
	sta	BREAK
	rts

*--------

:3100
*	pla
*	pla
	jmp	:20000

*--------

:3200	ldx	N
	lda	SALLE
	sta	O,x
	rts

*--------

:3300	lda	N	; exchange object
	asl		; do it here on pointers
	tax		; not on strings
	lda	tblO$,x
	pha
	lda	tblO$+1,x
	pha
	
	lda	tblO$+2,x
	sta	tblO$,x
	lda	tblO$+3,x
	sta	tblO$+1,x
	
	pla
	sta	tblO$+3,x
	pla
	sta	tblO$+2,x
	rts

*-----------------------------------
* 4000 - LES REPONSES
*-----------------------------------

tbl4000	da	:4000,:4010,:4020,:4030,:4040,:4050,:4060,:4070,:4080,:4090
	da	:4100,:4110,:4120,:4130,:4140,:4150,:4160,:4170,:4180,:4190
	da	:4200,:4210,:4220,:4230,:4240,:4250,:4260,:4270,:4280,:4290
	da	:4300,:4310,:4320,:4330,:4340,:4350,:4360,:4370,:4380,:4390
	da	:4400,:4410,:4420,:4430,:4440,:4450,:4460,:4470,:4480,:4490
	da	:4500,:4510,:4520,:4530,:4540,:4550,:4560,:4570,:4580,:4590
	da	:4600,:4610,:4620,:4630,:4640

*--------

:4000	@explode
	@print	#str4000
	@wait	#400
	rts

*--------

:4010	@print	#str4010
	@wait	#500
	rts

*--------

:4020	@print	#str4020
	@wait	#500
	rts

*--------

:4030	@print	#str4030
	@wait	#500
	rts

*--------

:4040	@print	#str4040
	@wait	#300
	@print	#str4042
	@wait	#300
	rts

*--------

:4050	@print	#str4050
	@wait	#500
	rts

*--------

:4060	@print	#str4060
	@wait	#300
	rts

*--------

:4070	@explode
	@print	#str4070
	@wait	#500
	@print	#str4072
	@wait	#300
	rts

*--------

:4080	@print	#str4080
	@wait	#400
	rts

*--------

:4090	@print	#str4090
	@wait	#300
	rts

*--------

:4100	@print	#str4100
	@wait	#400
	rts

*--------

:4110	@print	#str4110
	@wait	#500
	rts

*--------

:4120	@print	#str4120
	@wait	#400
	@print	#str4124
	@wait	#250
	rts

*--------

:4130	@print	#str4130
	@wait	#400
	
*	pla
*	pla
	
	@print	#str4133
	@wait	#200
	jmp	:20050

*--------

:4140	@print	#str4140
	@wait	#450
	rts

*--------

:4150	@print	#str4150
	@wait	#400
	@print	#str4152
	@wait	#500
	@print	#str4156
	@wait	#200
	rts

*--------

:4160	@print	#str4160
	@wait	#400
	rts

*--------

:4170	@print	#str4170
	@wait	#400
	rts

*--------

:4180	@print	#str4180
	@explode
	@wait	#300
	@print	#str4185
	@wait	#200
	rts

*--------

:4190	@print	#str4190
	@wait	#300
	@print	#str4195
	@wait	#300
	rts

*--------

:4200	@print	#str4200
	rts

*--------

:4210	@print	#str4210
	@wait	#400
	@print	#str4215
	@wait	#300
	rts

*--------

:4220	@print	#str4220
	@wait	#200
	@print	#str4225
	@wait	#300
	rts

*--------

:4230	@explode
	@print	#str4230
	@wait	#400
	rts

*--------

:4240	@print	#str4240
	@wait	#300
	rts

*--------

:4250	@print	#str4250
	@wait	#400
	rts

*--------

:4260	@print	#str4260
	@wait	#400
	rts

*--------

:4270	@print	#str4270
	@wait	#200
	rts

*--------

:4280	@print	#str4280
	@wait	#300
	rts

*--------

:4290	@print	#str4290
	@wait	#300
	rts

*--------

:4300	@print	#str4300
	@wait	#300
	rts

*--------

:4310	@print	#str4310
	@wait	#300
	rts

*--------

:4320	@print	#str4320
	@wait	#300
	rts

*--------

:4330	@print	#str4330
	@wait	#200
	rts

*--------

:4340	@print	#str4340
	@wait	#300
	rts

*--------

:4350	@explode
	@print	#str4350
	@wait	#400
	rts

*--------

:4360	@print	#str4360
	@wait	#300
	rts

*--------

:4370	@print	#str4370
	@wait	#300
	rts

*--------

:4380	@print	#str4380
	@wait	#400
	rts
	
*--------

:4390	@print	#str4390
	@wait	#400
	rts
	
*--------

:4400	@print	#str4400
	@wait	#150
	rts

*--------

:4410	@print	#str4410
	@wait	#200
	@print	#str4412
	@wait	#200
	rts

*--------

:4420	@print	#str4420
	@wait	#200
	@print	#str4425
	@wait	#200
	rts

*--------

:4430	@print	#str4430
	@wait	#300
	rts

*--------

:4440	@print	#str4440
	@wait	#400
	rts

*--------

:4450	@print	#str4450
	@wait	#100
	rts

*--------

:4460	@print	#str4460
	@wait	#250
	rts

*--------

:4470	@print	#str4470
	@wait	#400
	rts

*--------

:4480	@explode
	@print	#str4480
	@wait	#400
	rts
	
*--------

:4490	@explode
	@print	#str4490
	@wait	#400
	rts
	
*--------

:4500	@print	#str4500
	@wait	#300
	rts

*--------

:4510	@print	#str4510
	@wait	#150
	rts

*--------

:4520	@print	#str4520
	@wait	#400
	rts

*--------

:4530	@print	#str4530
	@wait	#200
	rts

*--------

:4540	@print	#str4540
	@wait	#400
	rts

*--------

:4550	@print	#str4550
	@print	#PL
	@print	#str4552
	@wait	#300
	@print	#str4555
	@wait	#150
	rts

*--------

:4560	@explode
	@print	#str4560
	@wait	#200
	rts

*--------

:4570	@explode
	@print	#str4570
	@wait	#250
	rts

*--------

:4580	@print	#str4580
	@wait	#300
	@print	#str4582
	@wait	#100
	@print	#str4585
	@wait	#400
	rts

*--------

:4590	@print	#str4590
	jsr	GETLN1
*	cpx	#4
*	bne	:4595

	ldx	#4-1
]lp	lda	TEXTBUFFER,x
	cmp	PL,x
	bne	:4595
	dex
	bpl	]lp
	bmi	:4600	; t'as gagnŽ
:4595	jmp	:4570	; t'as perdu

*-----------------------------------
* 4600
*-----------------------------------

:4600
	@wait	#200	; et le texte
	@print	#strCODEEXACT
	@wait	#400
	jsr	:10000
	@print	#strENDEHORS
	jmp	:32000

*--------

:4610
	@print	#str4610
	@wait	#400
	@print	#str4615
	@wait	#150
	rts

*--------

:4620
	@print	#str4620
	@wait	#350
	rts
	
*--------

:4630
	@print	#str4630
	@wait	#400
	rts
	
*--------

:4640
	@print	#str4640
	@wait	#350
	rts

*-----------------------------------
* 6000 - ANALYSE DU MOT
*-----------------------------------

:6000	lda	#0
	sta	N
	sta	X$1
	sta	X$2

	sta	MO$1
	sta	MO$2

* 1. cherche le premier caractre

	ldx	#0	; cherche le premier caractere
]lp	lda	TEXTBUFFER,x
*	cmp	#chrRET2
*	beq	:6021
	cmp	#chrSPC2
	bne	:6022	; on a trouvŽ un caractre
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
	cmp	#chrRET2
	beq	:6023
	cmp	#chrSPC2
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
*	cmp	#chrRET2
*	beq	:6032
	cmp	#chrSPC2
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
	cmp	#chrRET2
	beq	:6033
	cmp	#chrSPC2
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
]lp	tya
	asl
	tax
	lda	tblV$,x
	sta	:6225+1
	lda	tblV$+1,x
	sta	:6225+2

	ldx	#1
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
]lp	tya
	asl
	tax
	lda	tblV$,x
	sta	:6325+1
	lda	tblV$+1,x
	sta	:6325+2

	ldx	#1
:6325	lda	$bdbd,x
	cmp	X$2,x
	bne	:6350
	inx
	cpx	X$1
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

tbl7000
	da	$bdbd
	da	:7000
	da	:7010
	da	:7020
	da	:7030
	da	:7040
	da	:7050
	da	:7060
	da	:7070
	da	:7080
	da	:7090
	da	:7100
	da	:7110
	da	:7120
	da	:7130
	da	:7140
	da	:7150
	da	:7160
	da	:7170
	da	:7180
	da	:7190
	da	:7200
	da	:7210
	da	:7220
	da	:7230
	da	:7240

:7000
	@print	#str7000
	@wait	#250
	@print	#str7001
	jsr	:10000
	rts
	
:7010
	@print	#str7010
	jmp	:10100

:7020
	@print	#str7020
	jmp	:10200

:7030
	@print	#str7030
	lda	#0
	sta	F1
	jmp	:10300

:7040
	@print	#str7040
	lda	#1
	sta	F1
	jmp	:10300

:7050
	@print	#str7050
	jmp	:10500

:7060
	@print	#str7060
	jmp	:10600

:7070
	@print	#str7070
	lda	#0
	sta	LX
	jmp	:10700

:7080
	@print	#str7080
	jmp	:10800

:7090
	@print	#str7090
	lda	#0
	sta	LX
	jmp	:10900

:7100
	@print	#str7100
	lda	#0
	sta	LX
	jmp	:11000

:7110
	@print	#str7110
	lda	#2
	sta	LX
	jmp	:10700

:7120
	@print	#str7120
	lda	#1
	sta	LX
	jmp	:10700

:7130		; nada
	rts

:7140
	@print	#str7140
	lda	#2
	sta	LX
	jmp	:12200

:7150
	@print	#str7150
	@print	#str7001
	jmp	:11500

:7160
	@print	#str7160
	lda	#1
	sta	LX
	jmp	:10900

:7170
	@wait	#300
	@print	#str7170
	jmp	:11700

:7180
	@print	#str7180
	jmp	:11800

:7190
	@print	#str7190
	lda	#2
	sta	LX
	jmp	:10900

:7200
	@print	#str7200
	lda	#1
	sta	LX
	jmp	:12200

:7210
	@print	#str7210
	lda	#1
	sta	LX
	jmp	:11000

:7220
	@print	#str7220
	lda	#0
	sta	LX
	jmp	:12200

:7230
	@print	#str7230
	jmp	:12300

:7240
	@print	#str7240
	jmp	:12400

*--------

*-----------------------------------
* 8000 - CHARGEMENT VARIABLES
*-----------------------------------

	hex	bdbdbdbd
	
initALL
	ldx	#FIN_DATA-DEBUT_DATA-1
	lda	#0
]lp	sta	A1,x
	dex
	bpl	]lp

*---

	lda	#1
	sta	SALLE
	
*	ldx	#10
*	lda	#0
*]lp	sta	P,x
*	sta	C,x
*	dex
*	bne	]lp
	
*	lda	#0
*	sta	P+11
*	sta	P+12

	lda	#14
	sta	C+3
	lda	#12
	sta	C+7
	sta	C+9
	lda	#80
	sta	C+1
	
* PL=INT(RND(1)*9000+1000)

	ldx	#0
]lp	lda	VBL
	eor	VERTCNT
	and	#%0000_0111
	clc
	adc	#1
	cmp	#9+1
	bcs	]lp
	ora	#"0"
	sta	PL,x
	inx
	cpx	#4
	bcc	]lp

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
* 10000 - LES IMAGES
*-----------------------------------

:10000
	@draw	#data10000
	rts
	
:10100
	@draw	#data10100
	rts
	
:10200
	@draw	#data10200
	rts
	
:10300
	@draw	#data10300
	lda	F1
	bne	:10301
	@draw	#data10301
:10301	rts
	
:10400
	@draw	#data10400
	rts
	
:10500
	@draw	#data10500
	rts
	
:10600
	@draw	#data10600
	rts
	
:10700
	@draw	#data10700
	lda	LX
	cmp	#2
	beq	:10745
	@draw	#data10701
:10745	lda	LX
	bne	:10750
	@draw	#data10702
	rts
:10750	cmp	#1
	beq	:10780
	@draw	#data10703
	rts
:10780	@draw	#data10704
	rts

:10800
	@draw	#data10800
	rts
	
:10900
	@draw	#data10900
	lda	LX
	bne	:10915
	@draw	#data10901
	jmp	:10920
:10915	@draw	#data10902
:10920	@draw	#data10903
	lda	LX
	bne	:10935
	@draw	#data10904
	rts
:10935	cmp	#1
	bne	:10940
	@draw	#data10905
	rts
:10940	@draw	#data10906
	rts
	
:11000
	@draw	#data11000
	lda	LX
	bne	:11030
	@draw	#data11001
	rts
:11030	@draw	#data11002
	rts

:11500
	@draw	#data11500
	rts
	
:11700
	@draw	#data11700
	rts
	
:11800
	@draw	#data11800
	rts
	
:12200
	@draw	#data12200
	lda	LX
	cmp	#2
	bne	:12220
	@draw	#data12201
:12220	@draw	#data12202
	lda	LX
	cmp	#2
	beq	:12230
	@draw	#data12203
:12230	@draw	#data12204
	lda	LX
	cmp	#2
	beq	:12235
	@draw	#data12205
:12235	lda	LX
	beq	:12240
	@draw	#data12206
	rts
:12240	@draw	#data12207
	rts
	
:12300
	@draw	#data12300
	rts
	
:12400
	@draw	#data12400
	rts

*-----------------------------------
* 20000 - PERDU
*-----------------------------------

:20000
	@draw	#data13000
	@play	#zikPERDU

:20050			; commun avec gagne
	jsr	setTEXTFULL
]lp	@print	#strREPLAY
	jsr	translateKEY
	cmp	#chrNON
	beq	:20001
	cmp	#chrOUI
	bne	]lp
	jmp	REPLAY

:20001
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
	
*-----------------------------------
* 32000 - GAGNE
*-----------------------------------

:32000
	@play	#zikGAGNE

:32010
	jsr	setTEXTFULL
	@print	#strGAGNE

*--- L'animation du nain qui rode

	ldx	#1
	ldy	#190
]lp	lda	#" "
	sta	$551,x
	sta	$5d1,x
	sta	$650,x

	lda	#"o"
	sta	$552,x
	lda	#"O"
	sta	$5d2,x
	lda	#"/"
	sta	$651,x
	lda	#"\"
	sta	$653,x

	bit	SPKR

	tya
	jsr	WAIT
	
	lda	#"\"
	sta	$651,x
	lda	#"/"
	sta	$653,x
	
	tya
	jsr	WAIT

	bit	SPKR

	tya
	clc
	adc	#2
	tay
	
	inx
	cpx	#30
	bcc	]lp

	jmp	:20050

*-----------------------------------
* 40000 - LISTE DES INSTRUCTIONS
*-----------------------------------

:40000
	jsr	setTEXTFULL
]lp	@print	#strINSTR
	jsr	translateKEY
	cmp	#chrNON
	beq	:40001
	cmp	#chrOUI
	bne	]lp

	@print	#strINSTR2
	jsr	translateKEY
	
:40001	rts

*-----------------------------------
* 51000 - DISCLAIMER
*-----------------------------------

:51000
	jsr	setTEXTFULL
	@print	#strDISCLAIMER
	jmp	translateKEY

*-----------------------------------
* introPIC - la picture GR
*-----------------------------------

introPIC
	jsr	setTEXTFULL

	lda	#3
	sta	CH
	lda	#11
	jsr	TABV
	@print	#strLORICIELS
	@wait	#300

	jsr	HOME
	@print	#strLEMANOIR

	lda	#5
	sta	CH
	lda	#22
	jsr	TABV
	@print	#strINTRO1
	@wait	#300

	lda	#5
	sta	CH
	@print	#strINTRO2
	@wait	#300

	lda	#5
	sta	CH
	@print	#strINTRO3
	@wait	#300

	lda	#5
	sta	CH
	@print	#strINTRO4
	
	@play	#zikINTRODUCTION
	rts
	
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
	sta	MIXSET
	rts

*----------------------
* setMIXEDOFF
*----------------------

setMIXEDOFF		; FULL HGR
	sta	MIXCLR
	rts

*----------------------
* printCSTR
*----------------------

printCSTRING
	sty	pcs1+1
	stx	pcs1+2
	
pcs1	lda	$ffff
	beq	pcs3
	
	bit	fgCASE
	bpl	pcs2
	
	tax		; from lower to upper
	lda	tblKEY,x
	
pcs2	jsr	COUT
	
	inc	pcs1+1
	bne	pcs1
	inc	pcs1+2
	bne	pcs1
	
pcs3	rts

*--------

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
]lp	lda	#60	; 1/100me de seconde
	jsr	WAIT
	dey
	bne	]lp
	dex
	bpl	doW1
waitMS9	rts

*----------------------
* drawPICTURE
*----------------------

drawPICTURE
	sty	drawREAD+1
	stx	drawREAD+2

drawLOOP	jsr	drawREAD
	cmp	#$ff
	bne	drawPIC1
	rts		; the end

drawPIC1	ldx	#myADRS-myCMDS-1
]lp	cmp	myCMDS,x
	beq	drawPIC2
	dex
	bpl	]lp
	rts

drawPIC2	txa
	asl
	tax
	lda	myADRS,x
	sta	drawPIC3+1
	lda	myADRS+1,x
	sta	drawPIC3+2
drawPIC3	jsr	$bdbd
	jmp	drawLOOP

*-------- Read data
	
drawREAD	lda	$bdbd
	inc	drawREAD+1
	bne	drawREAD1
	inc	drawREAD+2
drawREAD1	rts

*----------------------------------- CURSET x,y,fb

doS	
	jsr	drawREAD
	sta	theX
	jsr	drawREAD
	sta	theX+1
	
	jsr	drawREAD
	sta	theY
	jsr	drawREAD
	sta	theY+1
	rts

*----------------------------------- CURMOV x,y,fb

doM
	jsr	drawREAD
	clc
	adc	theX
	sta	theX
	jsr	drawREAD
	adc	theX+1
	sta	theX+1	; new X-coord

	jsr	drawREAD
	clc
	adc	theY
	sta	theY
	jsr	drawREAD
	adc	theY+1
	sta	theY+1	; new X-coord
	rts

*----------------------------------- DRAW x,y,fb

doD	
	jsr	drawREAD
	clc
	adc	theX
	sta	theX2
	jsr	drawREAD
	adc	theX+1
	sta	theX2+1	; new X-coord

	jsr	drawREAD
	clc
	adc	theY
	sta	theY2
	jsr	drawREAD
	adc	theY+1
	sta	theY2+1	; new Y-coord

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

	ldy	theINK	; the ink color
	ldx	oric2hgr,y	; from the Oric to the Apple II
	jsr	HCOLOR+3	; to skip CHRGET 

	ldx	theX	; HPLOT x,y
	ldy	theX+1
	lda	theY
	jsr	HPLOT

	lda	theX2	; TO x2,Y2
	ldx	theX2+1
	ldy	theY2
	jsr	HILIN	; draw the line

	lda	X0L	; save the updated coords
	sta	theX
	lda	X0H
	sta	theX+1
	lda	Y0
	sta	theY
	rts
	
*----------------------------------- CIRCLE n,fb

doC	
	jsr	drawREAD
	sta	theRADIUS	; the radius
	rts

*----------------------------------- INK fb

doI
	jsr	drawREAD
	sta	theINK
	rts

*----------------------------------- PAPER fb

doP	
	jsr	drawREAD
	sta	thePAPER
	rts

*----------------------------------- HIRES

doH
	jsr	HGR
	sta	MIXCLR
	rts

*----------------------
* DonnŽes du moteur
*----------------------

myCMDS	asc	"SMDCIPH"

myADRS	da	doS	; curset
	da	doM	; curmov
	da	doD	; draw
	da	doC	; circle
	da	doI	; ink
	da	doP	; paper
	da	doH	; hires
	
*----------------------

theX	dw	140	; milieu de l'Žcran par dŽfaut
theY	ds	96
theX2	ds	2
theY2	ds	2
theRADIUS	ds	1
theFB	ds	1
theINK	ds	1
thePAPER	ds	1

*	APPLE	ORIC
* 0	black1	black
* 1	green	red
* 2	blue	green
* 3	white1	yellow
* 4	black2	blue
* 5	-	magenta
* 6	-	cyan
* 7	white2	white

oric2hgr	hex	0705010602030400

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
* VARIABLES
*-----------------------------------

V	=	73

tblV$	da	$bdbd
	da	V$1,V$2,V$3,V$4,V$5,V$6,V$7,V$8,V$9
	da	V$10,V$11,V$12,V$13,V$14,V$15,V$16,V$17,V$18,V$19
	da	V$20,V$21,V$22,V$23,V$24,V$25,V$26,V$27,V$28,V$29
	da	V$30,V$31,V$32,V$33,V$34,V$35,V$36,V$37,V$38,V$39
	da	V$40,V$41,V$42,V$43,V$44,V$45,V$46,V$47,V$48,V$49
	da	V$50,V$51,V$52,V$53,V$54,V$55,V$56,V$57,V$58,V$59
	da	V$60,V$61,V$62,V$63,V$64,V$65,V$66,V$67,V$68,V$69
	da	V$70,V$71,V$72,V$73

tblV	dfb	$bd
	dfb	01,01,02,02,03,03,04,04,05,05
	dfb	06,10,10,11,12,13,14,14,15,16
	dfb	17,17,18,19,20,21,21,22,23,24
	dfb	24,25,25,26,27,28,29,30,31,32
	dfb	33,34,35,36,37,38,18,39,40,41
	dfb	42,43,44,45,46,47,48,49,50,51
	dfb	52,53,53,54,55,55,56,56,57,58
	dfb	59,60,61

*---

nbO	=	25

refO	dfb	$bd
	dfb	06,05,05,08,08,00,00,11,11
	dfb	13,20,18,16,16,16,16,00,21
	dfb	00,22,25,12,00,25,00

O	dfb	$bd
	dfb	06,05,05,08,08,00,00,11,11
	dfb	13,20,18,16,16,16,16,00,21
	dfb	00,22,25,12,00,25,00

*---

refO$	da	$bdbd	; see :3300
	da	O$1,O$2,O$3,O$4,O$5,O$6,O$7,O$8,O$9
	da	O$10,O$11,O$12,O$13,O$14,O$15,O$16,O$17,O$18,O$19
	da	O$20,O$21,O$22,O$23,O$24,O$25

tblO$	da	$bdbd
	da	O$1,O$2,O$3,O$4,O$5,O$6,O$7,O$8,O$9
	da	O$10,O$11,O$12,O$13,O$14,O$15,O$16,O$17,O$18,O$19
	da	O$20,O$21,O$22,O$23,O$24,O$25

*---

M	=	25

tblM$	da	$bdbd
	da	M$1,M$2,M$3,M$4,M$5,M$6,M$7,M$8,M$9
	da	M$10,M$11,M$12,M$13,M$14,M$15,M$16,M$17,M$18,M$19
	da	M$20,M$21,M$22,M$23,M$24,M$25

M$1	dfb	00
M$2	dfb	04,03,03,04,00
M$3	dfb	03,02,00
M$4	dfb	04,02,03,05,01,06,00
M$5	dfb	04,04,01,07,03,20,00
M$6	dfb	02,04,00
M$7	dfb	04,08,01,09,02,05,00
M$8	dfb	03,07,00
M$9	dfb	04,13,02,07,03,10,00
M$10	dfb	04,09,02,11,00
M$11	dfb	01,10,03,12,00
M$12	dfb	04,11,00
M$13	dfb	03,09,00
M$14	dfb	02,09,03,15,00
M$15	dfb	00
M$16	dfb	00
M$17	dfb	00
M$18	dfb	00
M$19	dfb	01,22,03,21,00
M$20	dfb	04,05,00
M$21	dfb	01,25,02,22,00
M$22	dfb	01,21,00
M$23	dfb	01,24,04,22,00
M$24	dfb	02,23,00
M$25	dfb	02,21,00

*--- On commence ˆ index 0

AA	=	128

tblA$	da	A$1,A$2,A$3,A$4,A$5,A$6,A$7,A$8,A$9
	da	A$10,A$11,A$12,A$13,A$14,A$15,A$16,A$17,A$18,A$19
	da	A$20,A$21,A$22,A$23,A$24,A$25,A$26,A$27,A$28,A$29
	da	A$30,A$31,A$32,A$33,A$34,A$35,A$36,A$37,A$38,A$39
	da	A$40,A$41,A$42,A$43,A$44,A$45,A$46,A$47,A$48,A$49
	da	A$50,A$51,A$52,A$53,A$54,A$55,A$56,A$57,A$58,A$59
	da	A$60,A$61,A$62,A$63,A$64,A$65,A$66,A$67,A$68,A$69
	da	A$70,A$71,A$72,A$73,A$74,A$75,A$76,A$77,A$78,A$79
	da	A$80,A$81,A$82,A$83,A$84,A$85,A$86,A$87,A$88,A$89
	da	A$90,A$91,A$92,A$93,A$94,A$95,A$96,A$97,A$98,A$99
	da	A$100,A$101,A$102,A$103,A$104,A$105,A$106,A$107,A$108,A$109
	da	A$110,A$111,A$112,A$113,A$114,A$115,A$116,A$117,A$118,A$119
	da	A$120,A$121,A$122,A$123,A$124,A$125,A$126,A$127,A$128

A$1	str	"A01.I02D02M."
A$2	str	"A03D08.D03N."
A$3	str	"A03E08E09D24.D04D05I19E02M."
A$4	str	"A03E08D24.D04D06N."
A$5	str	"A03E07.I19M."
A$6	str	"A03E03.I19M."
A$7	str	"A03.I19E02M."
A$8	str	"A19D08.D03N."
A$9	str	"A19E08E09D24.D04D05I03M."
A$10	str	"A19E08D24.D04D06N."
A$11	str	"A19.I03M."
A$12	str	"A09E07B22.D07N."
A$13	str	"A09E03B05.D07N."
A$14	str	"A09.I14E02M."
A$15	str	"A14.I16E02M."
A$16	str	"A16E07B22.D07N."
A$17	str	"A16E03B05.D07N."
A$18	str	"A16.I14E02M."
A$19	str	"A15E03B05.D07N."
A$20	str	"A15E07B22.D07N."
A$21	str	"A15.I14E02M."
A$22	str	"A15E03.I17M."
A$23	str	"A15E07.I17M."
A$24	str	"A15.I17E02M."
A$25	str	"A17.F01I15M."
A$26	str	"A17.D08N."
A$27	str	"A17.D09K."
A$28	str	"A18.D10F03E01E02I17M."
A$29	str	"A21E03.I19M."
A$30	str	"A21E07.I19M."
A$31	str	"A21.I19E02M."
A$32	str	"A22E03.I19M."
A$33	str	"A22E07.I19M."
A$34	str	"A22.I19E02M."
A$35	str	"A19.D11N."
A$36	str	"A19.D11N."
A$37	str	"A22.D12I23M."
A$38	str	"A01.D13."
A$39	str	"I01.D14K."
A$40	str	"A03.D15M."
A$41	str	"B01.B01J."
A$42	str	"B08.B08J."
A$43	str	"B04.B04J."
A$44	str	"B05.B05J."
A$45	str	"B21.B21J."
A$46	str	"B24.B24J."
A$47	str	"B12.B12J."
A$48	str	"B09.B09J."
A$49	str	"B10.B10J."
A$50	str	"B18.B18J."
A$51	str	"B03.B03J."
A$52	str	"B22.B22J."
A$53	str	"A20B05.H11P05E05D16K."
A$54	str	"A20.D17K."
A$55	str	".C01J."
A$56	str	".C08J."
A$57	str	".C04J."
A$58	str	".C05J."
A$59	str	".C21J."
A$60	str	".C24J."
A$61	str	"E09.D62K."
A$62	str	".C12J."
A$63	str	".C09J."
A$64	str	".C10J."
A$65	str	".C18J."
A$66	str	".C03J."
A$67	str	".C22J."
A$68	str	".A00L."
A$69	str	"A05.E04D20G0405J."
A$70	str	"A05.F04J."
A$71	str	"A05E04.P24E08J."
A$72	str	"A05E08.F08P24J."
A$73	str	"E08.D21N."
A$74	str	"B10.D22L."
A$75	str	"B10.D23N."
A$76	str	"B09.D24K."
A$77	str	"B09.D25K."
A$78	str	"A02.D26M."
A$79	str	".D27K."
A$80	str	"A14.D28K."
A$81	str	".D29K."
A$82	str	"C22.D33K."
A$83	str	"E07.D30K."
A$84	str	"A14.D07N."
A$85	str	"A17E01.D10K."
A$86	str	"E02.F02E07E06P22M."
A$87	str	".E07P22J."
A$88	str	"C05.D33K."
A$89	str	"E03.D30K."
A$90	str	"F07.D31L."
A$91	str	"F05.D32L."
A$92	str	"E02.F02E03E06P06P05M."
A$93	str	".E03P06P05J."
A$94	str	"C22.D33K."
A$95	str	"F07.D30K."
A$96	str	"E06E03.D36F07P22M."
A$97	str	"E06.E02F07F06P22M."
A$98	str	".F07P22M."
A$99	str	"C05.D33K."
A$100	str	"F03.D30K."
A$101	str	"E07E06.D34F03P05M."
A$102	str	"E06.E02F06F03P05M."
A$103	str	".F03P05M."
A$104	str	"B01.D35N."
A$105	str	"I16.D45K."
A$106	str	"E02.D43K."
A$107	str	"F03.D44K."
A$108	str	"C04.D46K."
A$109	str	".P16E10J."
A$110	str	"A16F10.D47K."
A$111	str	"A16.D48N."
A$112	str	"A16.D48N."
A$113	str	"A16F09.D50D06N."
A$114	str	"A16.D49I18M."
A$115	str	"D18E09.D30K."
A$116	str	"D18.P18E09J."
A$117	str	"D18F09.D30K."
A$118	str	"D18.P18F09J."
A$119	str	"A24C12.D51K."
A$120	str	"A24C03.D52N."
A$121	str	"A24.G0503E11D63K."
A$122	str	"E11.D54F11D55K."
A$123	str	"E11.D54F11D55K."
A$124	str	"B21.D56N."
A$125	str	"F08.D57."
A$126	str	".D58D59."
A$127	str	"A06.D61M."
A$128	str	"A25.D64N."

tblA	dfb	14,00
	dfb	05,00
	dfb	05,00
	dfb	05,00
	dfb	05,00
	dfb	05,00
	dfb	05,00
	dfb	06,00
	dfb	06,00
	dfb	06,00
	dfb	06,00
	dfb	01,00
	dfb	01,00
	dfb	01,00
	dfb	01,00
	dfb	02,00
	dfb	02,00
	dfb	02,00
	dfb	04,00
	dfb	04,00
	dfb	04,00
	dfb	01,00
	dfb	01,00
	dfb	01,00
	dfb	02,00
	dfb	03,00
	dfb	04,00
	dfb	03,00
	dfb	04,00
	dfb	04,00
	dfb	04,00
	dfb	02,00
	dfb	02,00
	dfb	02,00
	dfb	02,00
	dfb	04,00
	dfb	03,00
	dfb	25,00
	dfb	25,00
	dfb	12,44
	dfb	10,34
	dfb	10,27
	dfb	10,28
	dfb	10,29
	dfb	10,32
	dfb	10,38
	dfb	10,39
	dfb	10,40
	dfb	10,41
	dfb	10,43
	dfb	10,50
	dfb	10,42
	dfb	10,37
	dfb	10,37
	dfb	11,34
	dfb	11,27
	dfb	11,28
	dfb	11,29
	dfb	11,32
	dfb	11,38
	dfb	11,43
	dfb	11,39
	dfb	11,40
	dfb	11,41
	dfb	11,43
	dfb	11,50
	dfb	11,42
	dfb	24,00
	dfb	12,49
	dfb	13,49
	dfb	22,38
	dfb	23,38
	dfb	23,38
	dfb	18,48
	dfb	18,41
	dfb	18,40
	dfb	20,40
	dfb	19,51
	dfb	19,51
	dfb	21,00
	dfb	21,00
	dfb	15,42
	dfb	15,42
	dfb	15,42
	dfb	15,42
	dfb	15,42
	dfb	15,42
	dfb	15,29
	dfb	15,29
	dfb	15,29
	dfb	15,29
	dfb	15,29
	dfb	15,29
	dfb	16,42
	dfb	16,42
	dfb	16,42
	dfb	16,42
	dfb	16,42
	dfb	16,29
	dfb	16,29
	dfb	16,29
	dfb	16,29
	dfb	16,29
	dfb	15,34
	dfb	17,35
	dfb	17,35
	dfb	17,35
	dfb	17,35
	dfb	17,35
	dfb	56,00
	dfb	56,46
	dfb	56,47
	dfb	56,45
	dfb	56,45
	dfb	55,43
	dfb	55,43
	dfb	57,43
	dfb	57,43
	dfb	12,33
	dfb	12,33
	dfb	12,33
	dfb	26,36
	dfb	53,50
	dfb	52,32
	dfb	58,30
	dfb	58,30
	dfb	12,33
	dfb	12,33

*--- On commence ˆ index 0

* C	=	14

tblC$	da	$bdbd
	da	C$1,C$2,C$3,C$4,C$5,C$6,C$7,C$8,C$9
	da	C$10,C$11,C$12,C$13,C$14
	
C$1	str	"G03E03.D00N."
C$2	str	"G04E04.D01N."
C$3	str	"I14I16I17I19.F02."
C$4	str	"G07E07.D18N."
C$5	str	"GO1.D19N."
C$6	str	"H06C03C08.D37N."
C$7	str	"H08D08.D39L."
C$8	str	"H06D03.D38L."
C$9	str	"G08E08B24.D40D21N."
C$10	str	"H02.D41N."
C$11	str	"G09E02.D42N."
C$12	str	"G05E11.D52N."
C$13	str	"I24E11.D53D52N."
C$14	str	".L."

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

C	ds	10+1
E$	ds	32	; the longest string
P	ds	13+1
PL	ds	5	; 1111/0
X$1	ds	4+1	; premier mot saisi
X$2	ds	4+1	; second mot saisi

FIN_DATA

*--- The lazy decimal to hexadecimal conversion

tblD2H	dfb	0,10,20,30,40,50,60,70,80,90

*-----------------------------------
* LES AUTRES FICHIERS
*-----------------------------------

	put	fr.s
	put	../common/images.s
	put	../common/musiques.s

*--- It's the end
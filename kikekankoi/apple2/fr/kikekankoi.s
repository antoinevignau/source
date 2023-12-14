*
* Kikekankoi
*
* (c) 1985, Loriciels (Oric/CPC)
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

*@play	mac
*	ldx	#>]1
*	ldy	#<]1
*	jsr	playMUSIC
*	eom

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
	
REPLAY	jsr	initALL
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
	cmp	#10
	beq	:100_OK
	cmp	#22
	beq	:100_OK
	cmp	#54
	beq	:100_OK
	cmp	#15
	bne	:101

:100_OK	ldx	#2
	lda	#1
	sta	P,x

:101	lda	SALLE
	cmp	#10
	beq	:105
	cmp	#15
	beq	:105
	cmp	#22
	beq	:105
	cmp	#54
	beq	:105
	
	ldx	#2
	lda	#0
	sta	P,x

:105	ldx	#10
	lda	O,x
	cmp	SALLE
	beq	:200
	cmp	#-1
	beq	:200

	ldx	#2
	lda	P,x
	beq	:200

:115	ldx	#9
	lda	C,x
	cmp	#2
	bcc	:120
	dec	C,x

:120	jsr	HGR
	jsr	setMIXEDON
	@print	#strILFAITNOIR
	jmp	:500

*-----------------------------------
* 200 - description salle
*-----------------------------------

:200	jsr	setHGR

	@print	#strRETURN
	
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

*---

:510	lda	#1
	sta	T
	lda	#0
	sta	N
	jmp	:1000

:530
:550	@print	#strCOMMANDE
	jsr	GETLN1

	dec	TEMPS
	lda	TEMPS
	cmp	#-1
	bne	:551
	dec	TEMPS+1
	lda	TEMPS+1
	cmp	#-1
	bne	:551

	jsr	:4370

:551	lda	TEXTBUFFER
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
	jmp	:100

*-----------------------------------
* 900 - CONTROLES APPLE II
*-----------------------------------

:900	cmp	#100	; switch wait to de/accelerate the game
	bne	:905

	jsr	switchWAIT
	jmp	:100

:905	cmp	#101	; quitter
	bne	:910
	jmp	:20050

:910	cmp	#102
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

:1500	lda	N
	cmp	SALLE
	bne	:1505
	lda	#1
	sta	OK
:1505	rts
	
*--------

:1510	ldx	N
	lda	O,x
	cmp	#-1
	beq	:1515
	cmp	SALLE
	bne	:1516
:1515	lda	#1
	sta	OK
:1516	rts
	
*--------

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

*--------

:1530	ldx	N
	lda	O,x
	cmp	#-1
	bne	:1535
	lda	#1
	sta	OK
:1535	rts

*--------

:1540	ldx	N
	lda	P,x
	cmp	#1
	bne	:1545
	lda	#1
	sta	OK
:1545	rts

*--------

:1550	ldx	N
	lda	P,x
	bne	:1555
	lda	#1
	sta	OK
:1555	rts

*--------

:1560	ldx	N
	lda	C,x
	cmp	#1
	bne	:1565
	lda	#1
	sta	OK
:1565	rts

*--------

:1570	lda	VBL	; LOGO - Use a better RND?
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
	da	:100,:500,:530
	
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
	
	lda	#2
	sta	BREAK

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

:1860	lda	G
	asl
	tax
	ldy	tblO$,x
	lda	tblO$+1,x
	tax
	jsr	printCSTRING
	@print	#strSPACE

	inc	H
	
	lda	G
	cmp	#V
	bcc	:1810
	
:1870	lda	HH
	beq	:1880

	@print	#strPOINT
	rts

:1880	@print	#strVOUSRIEN
	rts

*--------

:1900	lda	S
	cmp	#6
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
	
	lda	#2
	rts

:2030	lda	SALLE
	sta	O,x

	dec	S
	rts

*--------

:2100	lda	N
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
	lda	#2
	sta	BREAK
	rts

*--------

:2800	lda	#2
	sta	BREAK
	rts

*--------

:2900	lda	#3
	sta	BREAK
	rts

*--------

:3000	lda	#1
	sta	BREAK
	rts

*--------

:3100	jmp	:18000

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

tbl4000	da	:4010,:4020,:4030,:4040,:4050,:4060,:4070,:4080,:4090
	da	:4100,:4110,:4120,:4130,:4140,:4150,:4160,:4170,:4180,:4190
	da	:4200,:4210,:4220,:4230,:4240,:4250,:4260,:4270,:4280,:4290
	da	:4300,:4310,:4320,:4330,:4340,:4350,:4360,:4370,:4380,:4390
	da	:4400,:4410,:4420,:4430,:4440,:4450,:4460,:4470,:4480,:4490
	da	:4500,:4510,:4520,:4530,:4540,:4550,:4560,:4570,:4580,:4590
	da	:4600,:4610,:4620,:4630,:4640,:4650,:4660

*--------

:4010	@print	#str4010
	rts

:4020	@print	#str4020
	rts

:4030	@print	#str4030
	rts

:4040	@print	#str4040
	rts

:4050	@print	#str4050
	rts

:4060	@print	#str4060
	rts

:4070	@print	#str4070
	rts

:4080	@print	#str4080
	rts

:4090	@print	#str4090
	rts

:4100	@print	#str4100
	rts

:4110	@print	#str4110
	rts

:4120	@print	#str4120
	rts

:4130	@print	#str4130
	rts

:4140	@print	#str4140
	rts

:4150	@print	#str4150
	rts

:4160	@print	#str4160
	rts

:4170	@print	#str4170
	rts

:4180	@print	#str4180
	rts

:4190	@print	#str4190
	rts

:4200	@print	#str4200
	rts

:4210	@print	#str4210
	rts

:4220	@print	#str4220
	rts

:4230	@print	#str4230
	rts

:4240	@print	#str4240
	rts

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
	rts

:4320	@print	#str4320
	rts

:4330	@print	#str4330
	rts

:4340	@print	#str4340
	rts

:4350	@print	#str4350
	rts

:4360	@print	#str4360
	rts

:4370	@explode
	@print	#str4370
	@wait	#200
	jmp	:18000

:4380	@print	#str4380
	rts
	
:4390	@print	#str4390
	rts
	
:4400	@print	#str4400
	rts

:4410	@print	#str4410
	rts

:4420	@print	#str4420
	rts

:4430	@print	#str4430
	rts

:4440	@print	#str4440
	rts

:4450	@print	#str4450
	rts

:4460	@print	#str4460
	rts

:4470	@print	#str4470
	rts

:4480	@print	#str4480
	rts
	
:4490	@print	#str4490
	rts
	
:4500	@print	#str4500
	rts

:4510	@print	#str4510
	rts

:4520	@print	#str4520
	rts

:4530	@print	#str4530
	rts

:4540	@print	#str4540
	rts

:4550	@print	#str4550
	rts

:4560	@print	#str4560
	rts

:4570	@print	#str4570
	rts

:4580	@print	#str4580
	rts

:4590	@print	#str4590
	rts
	
:4600	@print	#str4600
	rts
	
:4610	@print	#str4610
	rts

:4620	@print	#str4620
	rts
	
:4630	@print	#str4630
	rts
	
:4640	@print	#str4640
	rts
	
:4650	@print	#str4650
	rts

:4660	lda	VBL	; LOGO - Use a better RND?
	eor	VERTCNT
	beq	:4660
	cmp	#9
	bcc	:4660
	asl
	tax
	ldy	tbl4660,x
	lda	tbl4660+1,x
	tax
	jsr	printCSTRING
	rts

*---

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
	rts

:7020	@print	#str8020
	rts

:7030	@print	#str8030
	rts

:7040	@print	#str8040
	rts

:7050	@print	#str8050
	rts

:7060	@print	#str8060
	rts

:7070	@print	#str8070
	rts

:7080	@print	#str8080
	rts

:7090	@print	#str8090
	rts

:7100	@print	#str8100
	rts

:7110	@print	#str8110
	rts

:7120	@print	#str8120
	rts

:7130	@print	#str8130
	rts

:7140	@print	#str8140
	rts

:7150	@print	#str8150
	rts

:7160	@print	#str8160
	rts

:7170	@print	#str8170
	rts

:7180	@print	#str8180
	rts

:7190	@print	#str8190
	rts

:7200	@print	#str8200
	rts

:7210	@print	#str8210
	rts

:7220	@print	#str8220
	rts

:7230	@print	#str8230
	rts

:7240	@print	#str8240
	rts

:7250	@print	#str8250
	rts

:7260	@print	#str8260
	rts

:7270	@print	#str8270
	rts

:7280	@print	#str8280
	rts

:7290	@print	#str8290
	rts

:7300	@print	#str8300
	rts

:7310	@print	#str8310
	rts

:7320	@print	#str8320
	rts

:7330	@print	#str8330
	rts

:7340	@print	#str8340
	rts

:7350	@print	#str8350
	rts

:7360	@print	#str8360
	rts

:7370	@print	#str8370
	rts

:7380	@print	#str8380
	rts

:7390	@print	#str8390
	rts

:7400	@print	#str8400
	rts

:7410	@print	#str8410
	rts

:7420	@print	#str8420
	rts

:7430	@print	#str8430
	rts

:7440	@print	#str8440
	rts

:7450	@print	#str8450
	rts

:7460	@print	#str8460
	rts

:7470	@print	#str8470
	rts

:7480	@print	#str8480
	rts

:7490	@print	#str8490
	rts

:7500	@print	#str8500
	rts

:7510	@print	#str8510
	rts

:7520	@print	#str8520
	rts

:7530	@print	#str8530
	rts

:7540	@print	#str8540
	rts

:7550	@print	#str8550
	rts

:7560	@print	#str8560
	rts

:7570	@print	#str8570
	rts

:7580	@print	#str8580
	rts

:7590	@print	#str8590
	rts

:7600	@print	#str8600
	rts

*-----------------------------------
* 8000 - CHARGEMENT VARIABLES
*-----------------------------------

initALL
	ldx	#FIN_DATA-DEBUT_DATA-1
	lda	#0
]lp	sta	A1,x
	dex
	bpl	]lp

*---

	lda	#1
	sta	SALLE

	lda	#<5000
	sta	TEMPS
	lda	#>5000
	sta	TEMPS+1
	
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

:18000
	jsr	setTEXTFULL
	@print	#strPERDU
*	@play	#zikPERDU
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

:21000
	jsr	setTEXTFULL
	@print	#strGAGNE
*	@play	#zikGAGNE
	jmp	:20050

*-----------------------------------
* introPIC - la picture GR
*-----------------------------------

introPIC
	jsr	setTEXTFULL

	lda	#11
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
	
*	@play	#zikINTRODUCTION
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
TEMPS	ds	2	; le temps = 5000

C	ds	21+1
E$	ds	32	; the longest string
P	ds	21+1
X$1	ds	4+1	; premier mot saisi
X$2	ds	4+1	; second mot saisi

FIN_DATA

*--- The lazy decimal to hexadecimal conversion

tblD2H	dfb	0,10,20,30,40,50,60,70,80,90

*-----------------------------------
* LES AUTRES FICHIERS
*-----------------------------------

	put	fr.s
*	put	../common/images.s

*--- It's the end
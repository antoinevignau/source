*
* Le retour du Dr Genius
*
* (c) 1983, Loriciels
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	mx	%11
	lst	off

*-----------------------------------
* SOFTSWITCHES AND FRIENDS
*-----------------------------------

CH	=	$24	; cursor horizontal position 
CV	=	$25	; cursor vertical position 
LINNUM	=	$50	; result from GETADR

textX	=	$30	; les X/Y pour afficher les 
textY	=	textX+2	; caracteres QuickDraw II

nbOaP	=	10	; on peut porter dix objets

chrLA	=	$08
chrRA	=	$15
chrDEL	=	$7f
chrRET	=	$0d
chrSPC	=	$20
*TEXTBUFFER = 	$200
maxLEN	=	40

chrOUI	=	'O'
chrNON	=	'N'

idxTIMER	=	200

*-----------------------------------
* MACROS
*-----------------------------------

@draw	mac
	lda	]1
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
	lda	#>]1
	ldy	#<]1
	jsr	waitMS
	eom

*-----------------------------------
* CODE BASIC EN ASM :-)
*-----------------------------------

PLAY	sep	#$30

	jsr	initALL
	jsr	HGR

	jsr	HOME	; clear text screen
	lda	#0	; move cursor to 0,16 au lieu de 0,20
	sta	CH
	lda	#16	; au lieu de 20 LoGo
	sta	CV
	jsr	TABV	; on a 20 lignes de 10 caractères de haut

	@print	#strCOMMANDE	; commande avec energie
	jsr	GETLN1

	ldal	$c034
	inc
	stal	$c034
	
]lp	ldal	$c000
	bpl	]lp
	stal	$c010
	jmp	QUIT
	
*-----------------------------------
* DU BASIC A L'ASSEMBLEUR (BEURK)
*-----------------------------------

:100	ldx	#$11
	lda	P,x
	cmp	#1
	beq	:140

:101	lda	SALLE
	cmp	#23
	bne	:102
	ldx	#3
	lda	P,x
	cmp	#1
	beq	:130

:102	lda	SALLE
	cmp	#14
	bne	:104
	ldx	#4
	lda	P,x
	cmp	#1
	beq	:130
	
:104	lda	SALLE
	cmp	#20
	bne	:106
	ldx	#5
	lda	P,x
	cmp	#1
	beq	:130

:106	lda	SALLE
	cmp	#29
	bne	:108
	ldx	#6
	lda	P,x
	cmp	#1
	beq	:130
	
:108	lda	SALLE
	cmp	#38
	bne	:110
	ldx	#7
	lda	P,x
	cmp	#1
	beq	:130

:110	jmp	:200

:130	jsr	HGR
	jsr	setMIXEDON
	@print	#strILFAITNOIR
	jmp	:500

:140	jsr	HGR
	jsr	setMIXEDON
	@print	#strVOSYEUX
	jmp	:500

*-----------------------------------
* 200 - description salle
*-----------------------------------

:200	jsr	setHGR
	@draw	SALLE

	lda	A2	; trace des dessins
	beq	:206
	cmp	#1
	bne	:204
	jsr	:12010
	bra	:206
:204	cmp	#2
	bne	:206
	jsr	:12020

:206	lda	PP
	
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

:530	@print	#strCOMMANDE	; commande avec energie

:535	jsr	GETLN1
	jsr	rewriteSTRING	; from lower to upper
	jsr	:6000	; cherche les mots

	lda	MO$1
	bne	:900

	@print	#strJENECOMPRENDS
	jmp	:100

*-----------------------------------
* 900 - CONTROLES APPLE II
*-----------------------------------

:900	cmp	#idxTIMER
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

:1900	ldx	N
	lda	O,x
	cmp	#-1
	bne	:1960

	@print	#strVOUSLAVEZ
	rts

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

:3100	rts

*-------- O

:3200	ldx	N
	lda	SALLE
	sta	O,x
	rts

*-----------------------------------
* 4000 - LES REPONSES
*-----------------------------------

tbl4000	da	$bdbd,:4010,:4020,:4030,:4040,:4050,:4060,:4070,:4080,:4090
	da	:4100,:4110,:4120,:4130,:4140,:4150,:4160,:4170,:4180,:4190
	da	:4200,:4210,:4220,:4230,:4240,:4250,:4260,:4270,:4280,:4290
	da	:4300,:4310,:4320,:4330,:4340,:4350,:4360,:4370,:4380,:4390
	da	:4400,:4410,:4420,:4430,:4440,:4450,:4460,:4470,:4480,:4490
	da	:4500,:4510,:4520,:4530,:4540,:4550,:4560,:4570,:4580,:4590
	da	:4600,:4610,:4620,:4630,:4640,:4650,:4660,:4670,:4680,:4690
	da	:4700,:4710,:4720,:4730,:4740,:4750,:4760,:4770,:4780,:4790
	da	:4800,:4810,:4820,:4830,:4840,:4850,:4860,:4870,:4880,:4890
	da	:4900,:4910,:4920
	
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
	@print	#str4321
	rts

:4330	@print	#str4330
	rts

:4340	@print	#str4340
	rts

:4350	@print	#str4350
	rts

:4360	@print	#str4360
	rts

:4370	@print	#str4370
	rts

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
	@print	#str4491
	rts
	
:4500	@print	#str4500
	rts

:4510	@print	#str4510
	jmp	:gagne

:4520	@print	#str4520
	rts
	
:4530	@print	#str4530
	rts

:4540	@print	#str4540
	rts

:4550	@print	#str4550
	@print	#str4552
	@print	#str4558
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
	@print	#str4615
	rts

:4620	@print	#str4620
	rts
	
:4630	@print	#str4630
	rts
	
:4640	@print	#str4640
	rts

:4650	@print	#str4650
	@print	#str4655
	@print	#str4656
	rts

:4660	@print	#str4660
	rts

:4670	@print	#str4670
	rts

:4680	@print	#str4680
	rts

:4690	@print	#str4690
	@print	#str4692
	rts

:4700	@print	#str4700
	rts

:4710	lda	SALLE
	pha
	@draw	#54
	pla
	sta	SALLE
	rts

:4720	lda	SALLE
	pha
	@draw	#55
	pla
	sta	SALLE
	rts

:4730	@print	#str4730
	rts

:4740	@print	#str4740
	rts

:4750	@print	#str4750
	rts

:4760	@print	#str4760
	rts

:4770	@print	#str4770
	rts

:4780	@print	#str4780
	rts

:4790	@print	#str4790
	rts

:4800	@print	#str4800
	rts

:4810	@print	#str4810
	rts

:4820	@print	#str4820
	rts

:4830	@print	#str4830
	rts

:4840	@print	#str4840
	rts

:4850	@print	#str4850
	rts

:4860	@print	#str4860
	rts

:4870	@print	#str4870
	@print	#str4874
	rts

:4880	@print	#str4880
	rts

:4890	@print	#str4890
	@print	#str4891
	rts

:4900	@print	#str4900
	rts

:4910	@print	#str4910
	rts

:4920	@print	#str4920
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
* 8000 - CHARGEMENT VARIABLES
*-----------------------------------

initALL
	ldx	#FIN_DATA-DEBUT_DATA
	lda	#0
]lp	sta	A1-1,x
	dex
	bne	]lp

*---

	lda	#11
	sta	SALLE

	lda	#<4000
	sta	FORCE
	lda	#>4000
	sta	FORCE+1

	lda	#20
	sta	MINUTES
	lda	#0
	sta	SECONDES

*--- ligne 51

	ldx	#8
	lda	#10
	sta	C,x
	
	ldx	#5
	lda	#18
	sta	C,x
	
	ldx	#3
	lda	#10
	sta	C,x
	
	ldx	#6
	lda	#22
	sta	C,x
	
	ldx	#7
	lda	#9
	sta	C,x

*--- ligne 70

	ldx	#3
	lda	#1
]lp	sta	P,x
	inx
	cpx	#8
	bcc	]lp
	beq	]lp

	ldx	#$c
	sta	P,x

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
* LES TRACES DE CADRE
*-----------------------------------

:12000	rts

:12010	rts

:12020	rts

*-----------------------------------
* 20000 - PERDU
*-----------------------------------

:perdu	@explode
	@draw	#3
	@wait	#400
	
	jsr	setTEXTFULL
	@print	#strPERDU
*	@play	#zikPERDU

:20050			; commun avec gagne
]lp	@print	#strREPLAY
	jsr	translateKEY
	cmp	#chrNON
	beq	:20001
	cmp	#chrOUI
	bne	]lp
	jmp	PLAY

:20001	jmp	QUIT	; return to the IIgs

*-----------------------------------
* 32000 - GAGNE
*-----------------------------------

:gagne
	@draw	#6
	@wait	#400
	jsr	setTEXTFULL
	@print	#strGAGNE
*	@play	#zikINTRODUCTION
	jmp	:20050

*-----------------------------------
* ORIC
*-----------------------------------

EXPLODE	rts

*-----------------------------------
* CODE 6502
*-----------------------------------

*----------------------
* setTEXTFULL
*----------------------

setTEXTFULL	rts	; 40x24 text

*----------------------
* setHGR
*----------------------

setHGR	rts		; HGR

*----------------------
* GETLEN1 par LoGo
*----------------------

	mx	%11
	
GETLN1	ldx	#0
]lp	jsr	RDKEY
	cmp	#chrRET
	beq	doRET
	cmp	#chrDEL
	beq	doBACK
	cmp	#chrLA
	beq	doBACK
	cmp	#chrSPC	; must not be another control character
	bcc	]lp

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
	jsr	CURSOR_ERASE	; contains dec CH & TABV
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

testENERGIE	rts

*----------------------
* switchVIDEO
*----------------------

switchVIDEO	lda	#0
	eor	#1
	sta	switchVIDEO+1
	bne	setMIXEDOFF
	
*----------------------
* setMIXEDON
*----------------------

setMIXEDON		; HGR + 4 LINES OF TEXT
*	rts

*----------------------
* setMIXEDOFF
*----------------------

setMIXEDOFF		; FULL HGR
*	rts

	rep	#$30
	lda	ptrSCREEN
	sta	dpTO
	lda	ptrSCREEN+2
	sta	dpTO+2

	lda	ptrTEXT
	sta	dpTHREE
	lda	ptrTEXT+2
	sta	dpTHREE+2
	
	ldy	#170*160-2
]lp	lda	[dpTHREE],y
	pha
	lda	[dpTO],y
	sta	[dpTHREE],y
	pla
	sta	[dpTO],y
	dey
	dey
	bpl	]lp
	sep	#$30
	rts

*----------------------
* printCSTR
*----------------------

printCSTRING
	sty	pcs1+1
	stx	pcs1+2
	
pcs1	lda	$ffff
	beq	pcs3
	
pcs2	jsr	COUT
	
	inc	pcs1+1
	bne	pcs1
	inc	pcs1+2
	bne	pcs1
	
pcs3	rts

*----------------------
* waitMS
*----------------------

switchWAIT	lda	waitMS+1
	eor	#1
	sta	waitMS+1
	rts

waitMS	lda	#0	; skip if not zero
	bne	waitMS9
	
	sty	LINNUM
doW1	ldy	LINNUM
doW2	lda	#60	; 1/100ème de seconde
	jsr	WAIT
	dey
	bne	doW2
	dex
	bpl	doW1
waitMS9	rts

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

tblKEY	hex	00,01,02,03,04,05,06,07,08,09,0A,0B,0C,0D,0E,0F
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

TEXTBUFFER	ds	maxLEN+16	; le simulacre de la page 2

*-----------------------------------
* VARIABLES
*-----------------------------------

DEBUT_DATA

A1	ds	1
A2	ds	1	; $400
BREAK	ds	1
E	ds	1
*F1	ds	1
FORCE	ds	2
G	ds	1
H	ds	1
HH	ds	1
*L	ds	1
*LX	ds	1
MO$1	ds	1	; mot 1
MO$2	ds	1	; mot 2
MO$3	ds	1	; mot 3
N	ds	1
NIVEAU	ds	1
NL	ds	1
OK	ds	1
PP	ds	1
S	ds	1
SALLE	ds	1
T	ds	1
*W	ds	1
*Z	ds	1
lenSTRING	ds	1

MINUTES	ds	2	; 0..20 en décimal
SECONDES	ds	2	; 0..59

C	ds	48+1
E$	ds	32	; the longest string
P	ds	48+1
X$1	ds	1+4	; premier mot saisi
X$2	ds	1+4	; deuxième mot saisi
X$3	ds	1+4	; troisième mot saisi

FIN_DATA

*--- The lazy decimal to hexadecimal conversion

tblD2H	dfb	0,10,20,30,40,50,60,70,80,90


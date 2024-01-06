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
CV	=	CH+2	; cursor vertical position 
LINNUM	=	$50	; result from GETADR

textX	=	$30	; les X/Y pour afficher les 
textY	=	textX+2	; caracteres QuickDraw II

nbOaP	=	10	; on peut porter dix objets

chrLA	=	$08
chrRA	=	$15
chrDEL	=	$7f
chrRET	=	$0d
chrSPC	=	$20
maxLEN	=	40

chrOUI	=	'O'
chrNON	=	'N'

idxTIMER	=	200

*-----------------------------------


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

@print	mac
	ldx	#>]1
	ldy	#<]1
	jsr	printCSTRING
	eom

@gotoxy	mac
	ldx	#]1
	ldy	#]2
	jsr	GOTOXY
	eom

@printxy	mac
	ldx	#>]1
	ldy	#<]1
	jsr	COUTXY
	eom

@wait	mac
	lda	#>]1
	ldy	#<]1
	jsr	waitMS
	eom

@zap	mac
	jsr	ZAP
	eom

*-----------------------------------
* CODE BASIC EN ASM :-)
*-----------------------------------

PLAY	sep	#$30
	jsr	initALL
REPLAY	sep	#$30
	jsr	HGR

*	jsr	HOME	; clear text screen
*	lda	#0	; move cursor to 0,16 au lieu de 0,20
*	sta	CH
*	lda	#16	; au lieu de 20 LoGo
*	sta	CV
*	jsr	TABV	; on a 20 lignes de 10 caractères de haut

	lda	#0
	sta	textX
	lda	#row16
	sta	textY

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
	jsr	:12010	; 1er "cadre"
	bra	:206
:204	cmp	#2
	bne	:206
	jsr	:12020	; 2nd "cadre"

:206	lda	PP
	bne	:210
	
	lda	SALLE
	cmp	#11
	bne	:300

	lda	#1
	sta	PP
	jsr	:4920

:210	ldx	#-1
	lda	SALLE
	cmp	#21
	bcs	:220
	ldx	#1
	jmp	:270

:220	cmp	#26
	bcs	:230
	ldx	#3
	jmp	:270

:230	cmp	#31
	bcs	:240
	ldx	#0
	jmp	:270

:240	cmp	#52
	bcs	:270
	ldx	#2
	cmp	#26

:270	cpx	#-1
	beq	:300
	
	txa
	jsr	printNIVEAU
	
*-----------------------------------
		
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

:500	lda	SALLE
	cmp	#51
	beq	:510
	cmp	#48
	beq	:510
	cmp	#22
	beq	:510
	cmp	#4
	beq	:510
	cmp	#17
	beq	:510
	jmp	:3500

:510	ldx	#3
	lda	C,x
	dec	C,x
	cmp	#1
	bne	:520
	jmp	:4820	; mort par contamination radioactive

:520	jmp	:3500

*-----------

:530	@print	#strCOMMANDE	; commande avec energie

:535	jsr	GETLN1
	jsr	rewriteSTRING	; from lower to upper
	jsr	:6000		; cherche les mots

	lda	MO$1
	bne	:900

	@print	#strJENECOMPRENDS
	jmp	:3500

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

:1000	lda	#10	; met n'importe quoi
	sta	BFF0
	jsr	checkACTION
	lda	BFF0
	bne	:1700	; 0 si rien trouvé
	
	@print	#strIMPOSSIBLE

	lda	MO$1	; les directions
	cmp	#9
	bcs	:1040
	
	@print	#strCECHEMIN
	
:1040	@print	#strEXCLAM
	jmp	:500

*-----------------------------------
* 1700 - ACTIONS
*-----------------------------------

:1700	lda	#0
	sta	E

	ldx	#0
]lp	lda	BFE0,x
	sta	E$,x
	inx
	cmp	#-1
	bne	]lp

:1710	ldx	E
	lda	E$,x
	sec
	sbc	#'A'
	pha		; LI

	lda	E$+1,x
	cmp	#'.'
	beq	:1740
	sec
	sbc	#'0'
	tay
	lda	tblD2H,y
	sta	N

	lda	E$+2,x
	sec
	sbc	#'0'
	clc
	adc	N
	sta	N

:1740	lda	#0
	sta	BREAK

	pla
	cmp	#190	; 255-65 = 190 = la fin
	beq	:1760

:1745	asl
	tax
	lda	tbl1800,x
	sta	:1750+1
	lda	tbl1800+1,x
	sta	:1750+2

:1750	jsr	$bdbd

:1760	lda	BREAK
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
	
	lda	#2	; 500
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
	
	lda	#2	; 500
	sta	BREAK
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

:2400	ldy	E	; +3
	iny
	iny
	sty	E
	iny
	lda	E$,y
	sec
	sbc	#'0'
	tax
	lda	tblD2H,x
	
	ldx	N
	sta	C,x
	
	iny
	lda	E$,y
	sec
	sbc	#'0'
	clc
	adc	C,x
	sta	C,x
	rts

*-------- H

:2500	ldx	N
	lda	#0
	sta	O,x
	rts

*-------- I

:2600	lda	N
	sta	SALLE
	rts

*-------- J

:2700	@print	#strDACCORD	; jump into K

*-------- K

:2800
	lda	#2	; 500
	sta	BREAK
	rts

*-------- L

:2900	lda	#3	; 530
	sta	BREAK
	rts

*-------- M

:3000	lda	#1	; 100
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
* 3500 - LES VERIFICATIONS
*-----------------------------------

:3500	lda	SALLE
	cmp	#11
	bne	:3502
	ldx	#1
	lda	#1
	sta	P,x

:3502	lda	SALLE
	cmp	#19
	bne	:3504
	
	ldx	#1
	lda	#0
	sta	P,x

:3504	lda	SALLE
	cmp	#36
	bne	:3510
	ldx	#2
	lda	P,x
	cmp	#1
	beq	:3510

:3506	ldx	#$d
	lda	O,x
	cmp	#-1
	bne	:3508

	@wait	#100
	jsr	:4010
	
	ldx	#2
	lda	#1
	sta	P,x
	jmp	:3510

:3508	@wait	#100
	jmp	:4020

:3510	ldx	#4
	lda	O,x
	cmp	#-1
	bne	:3516

:3512	ldx	#8
	dec	C,x
	
:3514	ldx	#8
	lda	C,x
	bne	:3516
	jmp	:4740

:3516	ldx	#1
	lda	C,x
	beq	:3534
	
:3518	dec	C,x

:3520	lda	C,x
	cmp	#1
	bcs	:3534

:3522	ldx	#3
	lda	O,x
	cmp	#-1
	bne	:3524
	jmp	:4750

:3524	cmp	#51
	beq	:3526
	jmp	:4760

:3526	lda	SALLE
	cmp	#51
	bne	:3528
	jmp	:4750

:3528	ldx	#4
	lda	O,x
	cmp	#51
	beq	:3530
	ldx	#$13
	lda	O,x
	cmp	#51
	beq	:3530
	jmp	:4780

:3530	lda	SALLE
	cmp	#46
	beq	:3531
	cmp	#49
	bne	:3532
:3531	jmp	:4770

:3532	ldx	#$c
	lda	#0
	sta	P,x
	jsr	:4790
	ldx	#$10
	lda	#1
	sta	P,x
	bne	:3540

:3534	ldx	#$e
	lda	P,x
	beq	:3537

:3535	ldx	#2
	dec	C,x
	lda	C,x
	cmp	#1
	bcs	:3540
	
:3536	ldx	#$e
	lda	#0
	sta	P,x

:3537	ldx	#$c	; LOGO - It was a PEEK not a DEEK
	lda	P,x
	cmp	#0
	bcs	:3540
	
:3538	lda	SALLE
	cmp	#50
	beq	:3540
	jmp	:4800

:3540	ldx	#$10
	lda	P,x
	beq	:3544

:3542	ldx	#5
	dec	C,x
	lda	C,x
	cmp	#1
	bne	:3544
	jmp	:4810

:3544	ldx	#6
	lda	C,x
	beq	:3548

:3546	
	dec	C,x
	lda	C,x
	bne	:3548
	jsr	:4830
	ldx	#8
	lda	#0
	sta	P,x

:3548	ldx	#8
	lda	P,x
	cmp	#1
	beq	:3552

:3550	ldx	#7
	dec	C,x
	lda	C,x
	bne	:3552
	jsr	:4580
	jmp	:perdu

:3552	ldx	#4
	lda	C,x
	beq	:3556

:3554
	dec	C,x
	lda	C,x
	cmp	#1
	bne	:3556
	jmp	:4840
	
:3556	jmp	:530

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
	jmp	:perdu

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

:4230	@explode
	@wait	#100
	@explode
	@print	#str4230
	rts

:4240	@print	#str4240
	rts

:4250	@print	#str4250
	rts

:4260	jsr	setHGR
	@draw	#57
	lda	#44
	sta	SALLE
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

:4340	@explode
	@print	#str4340
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

:4480	jsr	:5500	; QUITTER
	cmp	#chrNON
	bne	:4481
	jmp	:500
:4481	@print	#str4480
	jmp	:perdu
	
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

:4550	jsr	setHGR
	@draw	#56	; LOGO
	jsr	:12020
	lda	#21
	sta	SALLE

	@gotoxy	#43;#21	; Vous avez deux essais pour
	@printxy	#str4550
	@gotoxy	#43;#29	; entrer le mot de passe
	@printxy	#str4552
	
	@gotoxy	#43;#37	; entrer le mot de passe
	jsr	:4556_input	; saisie 1
	bcc	:4554	; ok
	@gotoxy	#43;#45	; entrer le mot de passe
	@print	#str4553	; FAUX!

	@gotoxy	#43;#37	; entrer le mot de passe
	jsr	:4556_input	; saisie 2
	bcc	:4554	; ok
	@gotoxy	#43;#45	; entrer le mot de passe
	@print	#str4554	; encore faux
	jmp	:perdu	; ciao

:4554	@gotoxy	#43;#56	; 42
	@printxy	#str4558
	@gotoxy	#43;#64	; 56
	@printxy	#str4559_1
	@gotoxy	#43;#72	; 67
	@printxy	#str4559_2
	@gotoxy	#43;#80
	@printxy	#str4559_3
	@gotoxy	#43;#88
	@printxy	#str4559_4
	
	ldx	#>MP$
	ldy	#<MP$
	jsr	COUTXY
	rts

*--- saisie du mot de passe

:4556_input	@print	#str4556
	jsr	GETLN1	; chaîne de 6 caractères, SVP
	cpx	#6
	bcc	:4556_ko
	cpx	#7
	bcs	:4556_ko
	jsr	rewriteSTRING
	
	ldx	#6-1
]lp	lda	TEXTBUFFER,x
	cmp	MDP$,x
	bne	:4556_ko
	dex
	bpl	]lp
	clc		; c'est le bon mot de passe
	rts
:4556_ko	sec		; c'est le mauvais mot de passe
	rts

MDP$	asc	'MANOIR'

*-----------

:4560	@print	#str4560
	rts

:4570	@print	#str4570
	rts

:4580	@print	#str4580
	rts

*----------- SAVE - LOGO

:4590	jmp	doSAVE

*----------- LOAD - LOGO

:4600	jsr	doLOAD
	jmp	REPLAY

*----------- LE MOT DE PASSE FINAL

:4610	@print	#str4610
	jsr	GETLN1
	cpx	#5
	bcc	:4615
	cpx	#6
	bcs	:4615
	jsr	rewriteSTRING

	ldx	#5-1
]lp	lda	TEXTBUFFER,x
	cmp	MP$,x
	bne	:4615
	dex
	bpl	]lp
	jmp	:gagne

:4615	@print	#str4615
	@zap
	@wait	#100
	@print	#str4616
	@zap
	@wait	#300
	@print	#str4618_1
	@wait	#200
	@print	#str4618_2
	@wait	#200
	@print	#str4618_3
	jmp	:perdu

:4620	@explode
	@print	#str4620
	rts
	
:4630	@print	#str4630
	rts
	
:4640	@print	#str4640
	rts

:4650	@print	#str4650
	jmp	:perdu

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
	jsr	setHGR
	@draw	#54
	pla
	sta	SALLE
	rts

:4720	lda	SALLE
	pha
	jsr	setHGR
	@draw	#55
	pla
	sta	SALLE
	rts

:4730	@print	#str4730
	rts

:4740	@explode
	@wait	#100
	@explode
	@print	#str4740
	jmp	:perdu

:4750	@explode
	@wait	#100
	@print	#str4750
	jmp	:perdu
	
:4760	@explode
	@wait	#100
	@print	#str4760
	jmp	:perdu

:4770	@explode
	@print	#str4770
	jmp	:perdu

:4780	@explode
	@print	#str4780
	jmp	:perdu

:4790	@explode
	@print	#str4790
	rts

:4800	@explode
	@print	#str4800
	jmp	:perdu

:4810	@explode
	@print	#str4810
	jmp	:perdu

:4820	@explode
	@print	#str4820
	jmp	:perdu

:4830	@print	#str4830
	rts

:4840	@explode
	@print	#str4840
	jmp	:perdu

:4850	@print	#str4850
	rts

:4860	@print	#str4860
	rts

:4870	lda	S
	bne	:4872
	@print	#str4870
	rts

:4872	ldx	#$d
	lda	O,x
	cmp	#-1
	bne	:4873

	lda	#0
	sta	O,x
	ldx	#$c
	lda	#-1
	sta	O,x

:4873	ldx	#1
]lp	lda	O,x
	cmp	#-1
	bne	:4874
	lda	SALLE
	sta	O,x
:4874	inx
	cpx	#$13
	bcc	]lp
	beq	]lp

	lda	#0
	sta	S
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
	@wait	#200
	rts

*-----------

:5500	@print	#str5500
	jsr	GETLN1
	cpx	#1
	bne	:5500
	jsr	rewriteSTRING
	lda	TEXTBUFFER
	cmp	#chrOUI
	beq	:5510
	cmp	#chrNON
	bne	:5500
:5510	rts

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

*--- Le mot de passe

]lp	jsr	RND
	and	#%0000_0111	; 7
	cmp	#%0000_0101	; 5
	bcs	]lp
	asl
	tax
	lda	tblMP$,x
	sta	LINNUM
	lda	tblMP$+1,x
	sta	LINNUM+1
	
	ldy	#5-1
]lp	lda	(LINNUM),y
	sta	MP$,y
	dey
	bpl	]lp

*---

	ldx	#nbO	; reset object table
]lp	lda	refO,x
	sta	O,x
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
* 30000 - LES MOTS DE PASSE
*-----------------------------------

:30000	rts

*-----------------------------------
* 20000 - PERDU
*-----------------------------------

:perdu	@wait	#200
	@explode
	jsr	setTEXTFULL
	@print	#strPERDU

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
	jsr	setTEXTFULL
	@print	#strGAGNE
	jmp	:20050

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

setHGR	jmp	HGR

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
	
	ldy	#160*160-2
]lp	lda	[dpTHREE],y
	tax
	lda	[dpTO],y
	sta	[dpTHREE],y
	txa
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
doW2	ldal	RDVBLBAR
	bpl	doW2
*doW3	ldal	RDVBLBAR
*	bmi	doW3
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
	hex	60,41,42,43,44,45,46,47,48,49,4A,4B,4C,4D,4E,4F
	hex	50,51,52,53,54,55,56,57,58,59,5A,7B,7C,7D,7E,7F
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
FORCE	ds	2	; 400 unités en entrée
G	ds	1
H	ds	1
HH	ds	1
MO$1	ds	1	; mot 1
MO$2	ds	1	; mot 2
N	ds	1
NL	ds	1
OK	ds	1
PP	ds	1
S	ds	1
SALLE	ds	1
T	ds	1
lenSTRING	ds	1

MINUTES	ds	2	; 0..20 en décimal
SECONDES	ds	2	; 0..59

MP$	ds	6	; le mot de passe à trouver (5 + 00)

C	ds	32+1
E$	ds	32	; the longest string
P	ds	32+1
X$1	ds	1+4	; premier mot saisi
X$2	ds	1+4	; deuxième mot saisi

FIN_DATA

*--- The lazy decimal to hexadecimal conversion

tblD2H	dfb	0,10,20,30,40,50,60,70,80,90


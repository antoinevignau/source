*
* Athanor
*
* (c) 2014, Safar Games
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-----------------------------------
* EXTERNALS
*-----------------------------------

idx_w_bin	=	0
idx_w_none	=	4	; not used
idx_w_vc	=	5
idx_w_is	=	6
idx_w_nord	=	7
idx_w_sud	=	8
idx_w_est	=	9
idx_w_ouest	=	10

delaiMORT	=	1800	; ...en secondes (30m)

	ext	tblW$
	ext	tblGS$
	ext	tblO$
	ext	tblT$
	ext	tblV$
	ext	tblVP$

	ext	strLOAD
	ext	strSAVE
	ext	strQUIT
	ext	strRESTART
	
	ext	INTROFR1
	ext	INTROFR2
	ext	INTROFR3
	ext	INTROFR4
	ext	INTROFR5
	ext	INTROFR6

	ext	strPATIENTEZ
	ext	strAPPUYEZ
	ext	strWARPMANQUANT
	ext	strVC
	ext	strPASDEWARP
	ext	strNOID
	ext	strCOMMA
	
	ext	SP$
	ext	CR$
	ext	NO$
	ext	SU$
	ext	OU$
	ext	ES$
	ext	Q$
*	ext	CC$
	ext	CI$
	ext	EC$
	ext	CO$
	ext	CB$
	ext	Z$
	ext	W$
*	ext	IV$
*	ext	IS$
	ext	IT$
	ext	AD$
	ext	strOK
	ext	BG$
	ext	strRIEN
	ext	ME$
	ext	NE$
	ext	WE$
	ext	PR$

*	ext	FILIP
*	ext	PACO
*	ext	RAMP
*	ext	RIEN
*	ext	REMI35

	ext	BARREB
	ext	BARREH
	ext	BIBL0086
	ext	BIBL8081
	ext	BIBL8283
	ext	BIBL8485
	ext	CELL0027
	ext	CELL2129
	ext	CELL2223
	ext	CELL3031
	ext	CHAP6061
	ext	CHAP6263
	ext	CHAP6566
	ext	CHAP6768
	ext	CHAP6970
	ext	CHEM0007
	ext	CHEM0102
	ext	CHEM0306
	ext	CHEM0405
	ext	CIME8889
	ext	CLOCHE
	ext	COD0
	ext	COD5
	ext	COD6
	ext	COFFREF
	ext	COFFREO
	ext	COUR0041
	ext	COUR3233
	ext	COUR3435
	ext	COUR3637
	ext	COUR3842
	ext	COUR3940
	ext	D85F
	ext	D85O
	ext	ELIPH
	ext	GRILLE
	ext	HERB0053
	ext	HERB5052
	ext	LAD
	ext	LANT
	ext	LIVRCOD2
	ext	LIVRO
	ext	PAYS
	ext	SALVA
	ext	SEAUP
	ext	SEAUV
	ext	STONE
	ext	ZEPH

	ext	CREDFR
	ext	CREDIT3
	ext	DIALFR
	ext	DIALFR02
	ext	FINALE
	ext	MEDIV6
	ext	WON4

*-----------------------------------
* SOFTSWITCHES AND FRIENDS
*-----------------------------------

chrOUI	=	'Y'
chrNON	=	'N'

*-----------------------------------
* MACROS
*-----------------------------------

@SHOWPIC	mac
	ldx	#^]1
	ldy	#]1
	jsr	showPIC
	<<<

LDAF%	mac
	ldx	]1
	lda	F%,x
	and	#$ff
	cmp	]2
	<<<

LDAGS%	mac
	ldx	]1
	lda	GS%,x
	and	#$ff
	cmp	]2
	<<<

LDAO%	mac
	ldx	]1
	lda	O%,x
	and	#$ff
	cmp	]2
	<<<

LDAPP%	mac
	ldx	]1
	lda	PP%,x
	and	#$ff
	cmp	]2
	<<<

STAF%	mac
	sep	#$20
	ldx	]1
	lda	]2
	sta	F%,x
	rep	#$20
	<<<

STAGS%	mac
	sep	#$20
	ldx	]1
	lda	]2
	sta	GS%,x
	rep	#$20
	<<<

STAPP%	mac
	sep	#$20
	ldx	]1
	lda	]2
	sta	PP%,x
	rep	#$20
	<<<

CHKOBJ	mac
	lda	]1
	jsr	DO9910
	bne	]2
	jmp	DO24600
	<<<

*-----------------------------------
* CODE BASIC EN ASM :-)
*-----------------------------------

PLAY
:100	jsr	:17000	; clear memory, make dims and windows
:402	jsr	:16000	; init variables
:405	jsr	:31000	; load assembly routines
:408	jsr	:33000	; prepare messages
:410	jsr	:10500	; make O$ table (object description)
:510	jsr	:12000	; make W$ table (warp description)
:560	jsr	:13020	; make V$ table (vocabulary description)
:570	jsr	:15000	; make T$ table (cypher)

*---
	
:700	stz	NST%
	lda	#1
	sta	LS%

*:710	@CLS	#0
*:715	jsr	:990

:730	@CLS	#0
	jsr	:50134
	jsr	:8000

:800	stz	SY%

:805	LDAF%	#0;#1	; est-on mort ?
	bne	:810	; non

	jsr	:990	; oui, attend une touche
	jmp	:100	; ...reset everything

:810	jsr	:8530

:820	lda	SY%
	cmp	#TRUE
	beq	:800

:900	lda	VC%
	cmp	#8
	bcs	:910
	jmp	:1000

:910	lda	VC%
	cmp	#20
	bcc	:915
	beq	:915
	cmp	#32
	bcs	:915
	jmp	:1500

:915	lda	VC%
	cmp	#31
	bcc	:920
	beq	:920
	cmp	#43
	bcs	:920
	jmp	:2000

:920	lda	VC%
	cmp	#49
	bcc	:930
	beq	:930
	cmp	#55
	bcs	:930
	jmp	:3000

:930	lda	VC%
	cmp	#59
	bcc	:940
	beq	:940
	cmp	#71
	bcs	:940
	jmp	:3500

:940	lda	VC%
	cmp	#79
	bcc	:950
	beq	:950
	cmp	#88
	bcs	:950
	jmp	:4500

:950	lda	VC%
	cmp	#88
	beq	:951
	cmp	#89
	bne	:955
:951	jmp	:5500

:955	@PRINT	#0;strVC
	@INKEY
	jmp	QUIT

*-----------------------------------
* 960 - DIRECTION
*-----------------------------------

:960	lda	P%	; nord
	cmp	#66
	beq	:961
	cmp	#64
	bne	:965
:961	lda	IS%
	and	#1
	beq	:965
	ldy	#idx_w_nord
	bne	:985

:965	lda	P%	; sud
	cmp	#130
	beq	:966
	cmp	#128
	bne	:970
:966	lda	IS%
	and	#2
	beq	:970
	ldy	#idx_w_sud
	bne	:985

:970	lda	P%	; est
	cmp	#258
	beq	:971
	cmp	#256
	bne	:975
:971	lda	IS%
	and	#8
	beq	:975
	ldy	#idx_w_est
	bne	:985

:975	lda	P%	; ouest
	cmp	#514
	beq	:976
	cmp	#512
	bne	:980
:976	lda	IS%
	and	#4
	beq	:980
	ldy	#idx_w_ouest
	bne	:985
	
:980	rts

*--- 

:985	jsr	getW$

	lda	#-1
	sta	NST%
	lda	#1
	sta	LS%
	rts

*--- A common way to get VAL(MID$(W$(VC%),3,2))

getW$	lda	VC%	; Y has the index in W$x
	asl
	asl
	tax
	ldal	tblW$,x	; point to W$x or null
	sta	Debut
	ldal	tblW$+2,x
	sta	Debut+2
	ora	Debut	; is it null?
	bne	:986	; no
	lda	#0	; yes, no VC%
	beq	:987
:986	lda	[Debut],y	; get new VC%
	and	#$ff
:987	sta	VC%
	rts

*-----------------------------------
* 990 - ATTEND UNE TOUCHE
*-----------------------------------

:990	@LOCATE	#0;#12;#20
	@PRINT	#0;strAPPUYEZ	
	@INKEY
	rts

*-----------------------------------
* 1000 - SET VALUES
*-----------------------------------

:1000
:1010	lda	VC%
	sta	NT%
	stz	NST%

:1020	jsr	:960	; vérifie les directions

:1030	stz	CS%

:1035	lda	VC%
	cmp	#3
	beq	:1040
	
	STAPP%	#4;#0
	STAF%	#26;#0

:1040	lda	P%
	cmp	#$1004	; examiner broussaille
	bne	:1050
	lda	VC%
	cmp	#2
	bne	:1050
	lda	#1
	sta	NST%

:1050	lda	P%
	cmp	#$99D	; ramasser fruit
	beq	:1051
	cmp	#$100C	; ramasser mur ?
	bne	:1055
:1051	LDAF%	#13;#2
	bcs	:1055
	lda	VC%
	cmp	#2
	bne	:1055

	lda	#4	; mures > sac
	jsr	:9900
	jmp	:1150

:1055	lda	P%
	cmp	#$1016	; sonner cloche
	bne	:1057
	lda	VC%
	cmp	#3
	bne	:1057
	
	lda	#1
	sta	NST%
	STAPP%	#4;#3
	lda	#1
	sta	CS%

:1057	lda	P%
	cmp	#$1016	; sonner cloche
	bne	:1070
	lda	VC%
	cmp	#3
	bne	:1070
	LDAF%	#24;#1
	bne	:1070
	
	lda	#4
	sta	NST%
	STAF%	#0;#1
	
:1070	lda	P%
	cmp	#$1018	; parler moine
	bne	:1072
	lda	VC%
	cmp	#3
	bne	:1072
	LDAPP%	#4;#3
	bne	:1072
	LDAF%	#26;#1
	bcc	:1072

	lda	#3
	sta	NST%
	STAF%	#26;#2

:1072	lda	P%
	cmp	#$1018	; parler moine
	bne	:1073
	lda	VC%
	cmp	#3
	bne	:1073
	LDAPP%	#4;#3
	bne	:1073
	LDAF%	#26;#0
	bne	:1073

	lda	#2
	sta	NST%
	STAF%	#26;#1
		
:1073	lda	P%
	cmp	#$1020	; suivre moine
	bne	:1075
	lda	VC%
	cmp	#3
	bne	:1075

	LDAPP%	#4;#3
	bne	:1075
	LDAF%	#26;#2
	bne	:1075

	ldy	#idx_w_nord	; on simule NORD
	jsr	getW$
	jmp	:1150

:1075	lda	P%
	cmp	#$1008	; ramasser os
	bne	:1077
	lda	VC%
	cmp	#5
	bne	:1077

	lda	#2
	sta	NST%

:1077	lda	P%
	cmp	#$1007
	beq	:1078
	cmp	#$1009
	bne	:1080
:1078	lda	VC%
	cmp	#5
	bne	:1080
	
	lda	#1
	sta	NST%

:1080	lda	P%
	cmp	#$100A
	bne	:1085
	lda	VC%
	cmp	#5
	bne	:1085
	
	lda	#$11
	jsr	:9900
	jmp	:1150

:1085	lda	P%
	cmp	#$1005
	bne	:1087
	lda	VC%
	cmp	#7
	bne	:1087
	
	lda	#2
	sta	NST%

:1087	lda	P%
	cmp	#$1031
	bne	:1090
	lda	VC%
	cmp	#7
	bne	:1090
	LDAF%	#24;#0
	bne	:1090
	
	lda	#1
	sta	NST%

:1090	lda	P%
	cmp	#$1031
	bne	:1100
	lda	VC%
	cmp	#7
	bne	:1100
	LDAF%	#24;#1
	bne	:1100
	
	lda	#3
	sta	NST%

:1100	lda	NST%
	cmp	#0
	bne	:1150

	@PRINT	#0;WE$
	lda	#TRUE
	sta	SY%
	jsr	:32000

:1150	jsr	:8000

:1200	jmp	:800

*-----------------------------------
* 1500
*-----------------------------------

* L'Amstrad CPC est en 300èmes de secondes
* L'Apple IIgs  est en  60èmes de secondes
* soit 5 fois moins précis
* On veut 600 soit 3000 soit 3 minutes
* Je reprends le timer de Tinies...

:1500
:1520	stz	NST%
	jsr	:960

:1530	lda	FT
	bne	:1540
	lda	#1	; make it true
	sta	FT

	php		; initialise le temps
	sei
	stz	SECONDES
	plp

:1540	lda	FT
	beq	:1570
	
	php		; récupère le temps
	sei
	lda	SECONDES
	sta	TT%
	plp
	
:1570	lda	TT%
	cmp	#delaiMORT	; from 600
	bcc	:1575

	lda	VC%
	cmp	#21
	bne	:1575
	lda	#1
	sta	NST%
	lda	#-1
	sta	FT
	STAF%	#27;#1
	stz	TT%
	jmp	:1980

:1575	lda	TT%
	cmp	#delaiMORT	; from 600
	bcc	:1577

	lda	VC%
	cmp	#21
	beq	:1577
	lda	#21	; on meurt !
	sta	VC%
	lda	#2
	sta	NST%
	STAF%	#0;#1
	jmp	:1980
	
:1577	lda	P%
	cmp	#$32
	bne	:1580
	lda	VC%
	cmp	#21
	bne	:1580
	LDAF%	#27;#0
	bne	:1580
	lda	#1
	sta	NST%
	lda	#-1
	sta	FT
	STAF%	#27;#1
	stz	TT%
	jmp	:1980

:1580	lda	P%
	cmp	#$100B
	bne	:1585
	lda	VC%
	cmp	#22
	bne	:1585
	lda	#2
	sta	NST%

:1585	lda	P%
	cmp	#$100d
	bne	:1590
	lda	VC%
	cmp	#22
	bne	:1590
	LDAF%	#3;#-1
	beq	:1590
	lda	#3
	sta	NST%
	STAF%	#3;#1

:1590	lda	P%
	cmp	#$1010
	bne	:1592
	LDAF%	#3;#1
	bne	:1592
	lda	VC%
	cmp	#22
	bne	:1592
	lda	#$a
	jsr	:9900
	STAF%	#3;#-1
	lda	#2
	sta	NST%
	jmp	:1980

:1592	lda	P%
	cmp	#$1018
	bne	:1593
	LDAF%	#4;#2
	bne	:1593
	lda	VC%
	cmp	#22
	bne	:1593
	lda	#5
	sta	NST%

:1593	lda	P%
	cmp	#$1018
	bne	:1595
	LDAF%	#4;#1
	bne	:1595
	lda	VC%
	cmp	#22
	bne	:1595
	lda	#4
	sta	NST%
	STAF%	#4;#2

:1595	lda	P%
	cmp	#$1018
	bne	:1600
	LDAF%	#4;#0
	bne	:1600
	LDAPP%	#7;#22
	bne	:1600
	lda	VC%
	cmp	#22
	bne	:1600
	lda	#1
	sta	NST%
	STAF%	#4;#1

:1600	lda	P%
	cmp	#$100d
	beq	:1601
	cmp	#$100f
	bne	:1605
:1601	lda	VC%
	cmp	#23
	bne	:1605
	LDAO%	#5;#0
	bne	:1605
	LDAO%	#6;#0
	bne	:1605
	lda	#1
	sta	NST%

:1605	lda	P%
	cmp	#$1018
	bne	:1610
	LDAO%	#6;#0
	bne	:1610
	lda	VC%
	cmp	#23
	bne	:1610
	lda	#5
	jsr	:9900
	stz	NST%
	jmp	:1150

:1610	lda	P%
	cmp	#$102a
	beq	:1611
	cmp	#$1057
	bne	:1620
:1611	lda	VC%
	cmp	#23
	bne	:1620
	lda	#2
	sta	NST%

:1620	lda	P%
	cmp	#$102a
	bne	:1625
	lda	VC%
	cmp	#27
	bne	:1625
	LDAO%	#$10;#0
	bne	:1625
	lda	#4
	sta	NST%
	
:1625	lda	P%
	cmp	#$1038
	bne	:1630
	lda	VC%
	cmp	#27
	bne	:1630
	lda	#$10
	jsr	:9900
	jmp	:1150

:1630	lda	P%
	cmp	#$1008
	bne	:1635
	lda	VC%
	cmp	#27
	bne	:1635
	lda	#3
	sta	NST%
	STAF%	#6;#1
	STAGS%	#27;#4
	lda	#1
	sta	LS%
	sta	RE%

:1635	lda	P%
	cmp	#$1036
	bne	:1640
	lda	VC%
	cmp	#27
	bne	:1640
	lda	#1
	sta	NST%

:1640	lda	P%
	cmp	#$0200	; gauche
	beq	:1641
	cmp	#$0202
	bne	:1660
:1641	lda	VC%
	cmp	#28
	bne	:1660
	lda	#2
	sta	NST%

:1660	lda	P%
	cmp	#$0200	; gauche
	beq	:1661
	cmp	#$104a	; ouvrir
	beq	:1661
	cmp	#$121e	; examiner porte gauche
	bne	:1670
:1661	lda	VC%
	cmp	#31
	bne	:1670
	LDAF%	#25;#0
	bne	:1670
	lda	#1
	sta	NST%

:1670	lda	P%
	cmp	#$100e	; examiner serrure
	bne	:1680
	LDAO%	#$19;#0
	bne	:1680
	LDAO%	#6;#0
	bne	:1680
	lda	VC%
	cmp	#31
	bne	:1680
	lda	#2	; La serrure a une forme
	sta	NST%

:1680	lda	P%
	cmp	#$1013
	beq	:1681
	cmp	#$201e
	beq	:1681
	cmp	#$102d
	beq	:1681
	cmp	#$2038
	bne	:1690
:1681	LDAO%	#6;#0
	bne	:1690
	lda	VC%
	cmp	#31
	bne	:1690
	lda	#4	; Il s'agit en fait
	sta	NST%
	lda	#$19
	jsr	:9900

:1690	lda	P%
	cmp	#$2056	; AV ouvrir porte avec clef-rosace
	beq	:1691
	cmp	#$4068
	beq	:1691
	cmp	#$301e
	bne	:1700
:1691	lda	VC%
	cmp	#31
	bne	:1700
	LDAF%	#25;#0
	bne	:1700
	LDAO%	#6;#1
	bne	:1700
	lda	#3	; Bien joué, accès possible
	sta	NST%
	STAF%	#25;#1
	
:1700	lda	P%
	cmp	#$103a	; donner poudre
	beq	:1701
	cmp	#$203c	; donner poudre os
	bne	:1702
:1701	lda	VC%
	cmp	#31
	bne	:1702
	LDAO%	#$13;#1
	bne	:1702
	LDAF%	#11;#1
	bne	:1702
	lda	#7	; Merci mais ce n'est pas suffisant
	sta	NST%
	STAF%	#11;#2
	lda	#19
	jsr	:9810
	
:1702	lda	P%
	cmp	#$103c	; donner mue
	beq	:1703
	cmp	#$2068	; donner mue serpent
	bne	:1705
:1703	lda	VC%
	cmp	#31
	bne	:1705
	LDAO%	#$12;#1
	bne	:1705
	LDAF%	#11;#1
	bne	:1705
	jmp	:1992	; pas suffisant
	
:1705	lda	P%
	cmp	#$103c	; donner mue
	beq	:1706
	cmp	#$2068	; donner mue serpent
	bne	:1707
	lda	VC%
:1706	cmp	#31
	bne	:1707
	LDAO%	#$12;#1
	bne	:1707
	LDAF%	#11;#2
	bne	:1707
	jmp	:1996
	
:1707	lda	P%
	cmp	#$103a	; donner poudre
	bne	:1710
	lda	VC%
	cmp	#31
	bne	:1710
	LDAO%	#$13;#1
	bne	:1710
	LDAF%	#12;#2
	bne	:1710
	jmp	:1995	; ajoute lanière
	
:1710	lda	P%
	cmp	#$1018
	bne	:1980
	lda	VC%
	cmp	#31
	bne	:1980
	LDAF%	#11;#3
	bcs	:1980
	lda	#6
	sta	NST%

:1980	jmp	:1100

:1992	lda	#7	; merci mais ce n'est pas suffisant
	sta	NST%
	STAF%	#11;#2
	lda	#$12	; retire
	jsr	:9810
	jmp	:1980

:1995	lda	#5	; bien joué
	sta	NST%
	lda	#7	; ajoute laniere
	jsr	:9900
	lda	#$13	; retire poudre d'os
	jsr	:9810
	STAF%	#11;#3
	jmp	:1980

:1996	lda	#5
	sta	NST%
	lda	#7	; ajoute laniere
	jsr	:9900
	lda	#$12	; retire mue
	jsr	:9810
	STAF%	#11;#3
	jmp	:1980

*-----------------------------------
* 2000
*-----------------------------------

:2000
:2005	stz	NST%
	jsr	:960

:2010	lda	P%
	cmp	#$1018
	bne	:2015
	lda	VC%
	cmp	#39
	bne	:2015
	LDAGS%	#39;#5
	bne	:2015
	lda	#2
	sta	NST%

:2015	lda	P%
	cmp	#$102c
	bne	:2017
	lda	VC%
	cmp	#39
	bne	:2017
	LDAGS%	#39;#5
	bne	:2017
	lda	#1
	sta	NST%
	lda	#8
	jsr	:9900
	STAGS%	#39;#0
	STAF%	#2;#1

:2017	lda	P%
	cmp	#$32
	bne	:2020
	lda	VC%
	cmp	#39
	bne	:2020
	LDAF%	#2;#0
	bne	:2020
	
	@PRINT	#0;PR$	; vous vous recueillez en prières...
	STAGS%	VC%;#5
	lda	#1
	sta	RE%
	sta	LS%
	jmp	:1150
	

:2020	lda	P%
	cmp	#$101a
	bne	:2025
	lda	VC%
	cmp	#40
	bne	:2025
	lda	#1
	sta	NST%

:2025	lda	P%
	cmp	#$2076
	beq	:2026
	cmp	#$2077
	beq	:2026
	cmp	#$2080	; utiliser (20) corde-seau (2060)
	beq	:2026
	cmp	#$3078
	bne	:2030
:2026	lda	VC%
	cmp	#40
	bne	:2030
	LDAF%	#7;#0
	bne	:2030
	LDAO%	#$1f;#1	; corde-seau ?
	bne	:2030
	jmp	:2400

:2030	lda	P%
	cmp	#$2080	; utiliser corde-seau
	beq	:2031
	cmp	#$1028	; utiliser corde
	beq	:2031
	cmp	#$1078	; utiliser seau
	bne	:2035
:2031	lda	VC%
	cmp	#40
	bne	:2035
	LDAF%	#7;#1
	bne	:2035
	jmp	:2410

:2035	lda	P%
	cmp	#$2033
	bne	:2040
	lda	VC%
	cmp	#40
	bne	:2040
	LDAF%	#7;#2
	bcs	:2040
	lda	#4
	sta	NST%

:2040	lda	P%
	cmp	#$1024
	bne	:2045
	lda	VC%
	cmp	#41
	bne	:2045
	LDAF%	#8;#0
	bne	:2045
	lda	#1
	sta	NST%
	STAF%	#8;#1
	STAGS%	VC%;#6
	lda	#1
	sta	LS%
	sta	RE%

:2045	lda	P%
	cmp	#$1025
	beq	:2046
	cmp	#$1005
	bne	:2050
:2046	lda	VC%
	cmp	#42
	bne	:2050
	lda	#1
	sta	NST%

:2050	lda	P%
	cmp	#$1007
	bne	:2055
	lda	VC%
	cmp	#42
	bne	:2055
	lda	#3
	sta	NST%

:2055	lda	P%
	cmp	#$102a
	bne	:2065
	lda	VC%
	cmp	#42
	bne	:2065
	LDAO%	#$1b;#0
	bne	:2065
	lda	#4
	sta	NST%
	lda	#$1b
	jsr	:9900

:2065	lda	P%
	cmp	#$107a
	bne	:2070
	lda	VC%
	cmp	#33
	bne	:2070
	LDAF%	#9;#3
	bne	:2070
	lda	#4
	sta	NST%

:2070	lda	P%
	cmp	#$107a
	bne	:2075
	lda	VC%
	cmp	#33
	bne	:2075
	LDAPP%	#6;#33
	bne	:2075
	LDAF%	#9;#3
	bcs	:2075
	lda	#1
	sta	NST%

:2075	lda	P%
	cmp	#$1034
	bne	:2080
	lda	VC%
	cmp	#33
	bne	:2080
	LDAPP%	#6;#33
	bne	:2080
	LDAO%	#8;#1
	bne	:2080
	lda	#2
	sta	NST%

:2080	lda	P%
	cmp	#$1035
	bne	:2100
	lda	VC%
	cmp	#33
	bne	:2100
	LDAPP%	#6;#33
	bne	:2100
	LDAO%	#9;#1
	bne	:2100
	jmp	:2800

:2100	lda	P%
	cmp	#$106D
	bne	:2120
	lda	VC%
	cmp	#35
	bne	:2120
	lda	#1
	sta	NST%

:2120	lda	P%
	cmp	#$1071
	bne	:2140
	lda	VC%
	cmp	#35
	bne	:2140
	lda	#2
	sta	NST%

:2140	lda	P%
	cmp	#$102c
	beq	:2141
	cmp	#$102e
	bne	:2160
:2141	lda	VC%
	cmp	#35
	bne	:2160
	LDAO%	#$0e;#0
	bne	:2160
	lda	#3
	sta	NST%

:2160	lda	P%
	cmp	#$1078
	bne	:2380
	lda	VC%
	cmp	#35
	bne	:2380
	LDAO%	#$0e;#0
	bne	:2380
	lda	#$0e
	jsr	:9900
	stz	NST%
	jmp	:1150

:2380	jmp	:1100

*-----------------------------------
* 2400
*-----------------------------------

:2400	STAF%	#7;#1
	lda	#2	; la corde lestée
	sta	NST%
	lda	#$1F
	jsr	:9810
	jmp	:2380
	
:2410	STAF%	#7;#2
	lda	#3
	sta	NST%
	lda	#$0D
	jsr	:9900
	jmp	:2380

:2800	lda	#3
	sta	NST%
	lda	#$20
	jsr	:9900
	lda	#9
	jsr	:9810
	STAF%	#9;#3
	jmp	:2380
	
*-----------------------------------
* 3000
*-----------------------------------

:3000
:3010	stz	NST%
	jsr	:960

:3030	lda	P%
	cmp	#$100b
	bne	:3035
	lda	VC%
	cmp	#50
	bne	:3035
	lda	#1
	sta	NST%

:3035	lda	P%
	cmp	#$102a
	beq	:3036
	cmp	#$1035
	bne	:3040
:3036	lda	VC%
	cmp	#50
	bne	:3040
	lda	#2
	sta	NST%
	STAF%	#10;#1

:3040	lda	P%
	cmp	#$102B
	beq	:3041
	cmp	#$1036
	bne	:3050
:3041	lda	VC%
	cmp	#50
	bne	:3050
	lda	#3
	sta	NST%

:3050	lda	P%
	cmp	#$1031
	bne	:3055
	lda	VC%
	cmp	#50
	bne	:3055
	LDAF%	#10;#1
	bne	:3055
	lda	#$f
	jsr	:9900
	jmp	:1150

:3055	lda	P%
	cmp	#$1979
	beq	:3056
	cmp	#$197a
	beq	:3056
	cmp	#$208b	; AV - was #$298b
	bne	:3060
:3056	lda	VC%
	cmp	#52
	bne	:3060
	lda	#2
	sta	NST%
	STAGS%	#52;#0
	lda	#1
	sta	RE%

:3060	lda	P%
	cmp	#$1008
	bne	:3105
	lda	VC%
	cmp	#52
	bne	:3105
	lda	#1
	sta	NST%

:3105	lda	P%
	cmp	#$1035
	beq	:3106
	cmp	#$102a
	bne	:3110
:3106	lda	VC%
	cmp	#53
	bne	:3110
	lda	#1
	sta	NST%

:3110	lda	P%
	cmp	#$1036
	beq	:3111
	cmp	#$1038
	bne	:3115
:3111	lda	VC%
	cmp	#53
	bne	:3115
	lda	#2
	sta	NST%

:3115	lda	P%
	cmp	#$1037
	bne	:3120
	lda	VC%
	cmp	#53
	bne	:3120
	lda	#5
	sta	NST%
	STAF%	#12;#1

:3120	lda	P%
	cmp	#$103c
	bne	:3125
	lda	VC%
	cmp	#53
	bne	:3125
	LDAF%	#12;#1
	bne	:3125
	LDAF%	#11;#0
	bne	:3125
	lda	#7
	jsr	:9900
	jmp	:1150

:3125	lda	P%
	cmp	#$1039
	beq	:3126
	cmp	#$1063
	beq	:3126
	cmp	#$104c
	bne	:3480
:3126	lda	VC%
	cmp	#53
	bne	:3480
	LDAF%	#12;#1
	bne	:3480
	lda	#4
	sta	NST%

:3480	jmp	:1100

*-----------------------------------
* 3500
*-----------------------------------

:3500
:3510	stz	NST%
	jsr	:960

:3512	lda	P%
	cmp	#$1016
	beq	:3512_bis
	cmp	#$102a
	bne	:3513
:3512_bis	lda	VC%
	cmp	#60
	bne	:3513
	lda	#1
	sta	NST%

:3513	lda	P%
	cmp	#$103b
	beq	:3513_bis
	cmp	#$102f
	bne	:3530
:3513_bis	lda	VC%
	cmp	#62
	bne	:3530
	lda	#1
	sta	NST%

:3530	lda	P%
	cmp	#4104	; EXAMINER BROUSSAILLE
	bne	:3535	; ou CEINTURE
	lda	VC%
	cmp	#63
	bne	:3535
	LDAF%	#14;#0
	bne	:3535
	lda	#1
	sta	NST%
	STAF%	#14;#1
	STAGS%	VC%;#11
	lda	#1
	sta	LS%
	sta	RE%

:3535	lda	P%
	cmp	#$1039
	bne	:3540
	lda	VC%
	cmp	#66
	beq	:3536
	cmp	#67
	bne	:3540
:3536	lda	#2
	sta	NST%

:3540	lda	P%
	cmp	#$1066
	bne	:3558
	lda	VC%
	cmp	#66
	beq	:3541
	cmp	#67
	bne	:3558
:3541	lda	#1
	sta	NST%

:3558	lda	P%
	cmp	#$100b
	beq	:3559
	cmp	#$100d
	bne	:3560
:3559	lda	VC%
	cmp	#68
	bne	:3560
	lda	#1
	sta	NST%

:3560	lda	P%
	cmp	#$102f
	bne	:3562
	lda	VC%
	cmp	#68
	bne	:3562
	lda	#3
	sta	NST%

:3562	lda	P%
	cmp	#$102c
	bne	:3564
	lda	VC%
	cmp	#68
	bne	:3564
	lda	#4
	sta	NST%

:3564	lda	P%
	cmp	#$1024
	bne	:3566
	lda	VC%
	cmp	#68
	bne	:3566
	lda	#2
	sta	NST%

:3566	lda	P%
	cmp	#$105c
	bne	:3570
	lda	VC%
	cmp	#68
	bne	:3570
	STAGS%	VC%;#0
	lda	#1
	jsr	:9900
	lda	#1
	sta	RE%
	STAF%	#28;#1
	jmp	:1150

:3570	lda	P%
	cmp	#$11c1
	beq	:3571
	cmp	#$12c1
	bne	:3575
:3571	LDAF%	#28;#1
	bne	:3575
	LDAO%	#$0e;#0
	bne	:3575
	lda	#5
	sta	NST%
	STAF%	#28;#0

:3575	lda	P%
	cmp	#$11c1
	beq	:3576
	cmp	#$12c1
	bne	:3590
:3576	LDAF%	#28;#1
	bne	:3590
	LDAO%	#$0e;#1
	bne	:3590
	lda	#6
	sta	NST%
	STAF%	#0;#1
	STAF%	#28;#0

:3590	lda	P%
	cmp	#$103a
	beq	:3591
	cmp	#$2070
	bne	:3595
:3591	lda	VC%
	cmp	#69
	bne	:3595
	lda	#1
	sta	NST%

:3595	lda	P%
	cmp	#$10
	bne	:3600
	lda	VC%
	cmp	#69
	bne	:3600
	lda	#2
	sta	NST%

:3600	lda	P%
	cmp	#$1008
	bne	:3605
	lda	VC%
	cmp	#69
	bne	:3605
	lda	#3
	sta	NST%

:3605	lda	P%
	cmp	#$103c
	bne	:3610
	lda	VC%
	cmp	#69
	bne	:3610
	lda	#4
	sta	NST%

:3610	lda	P%
	cmp	#$103d
	bne	:3615
	lda	VC%
	cmp	#69
	bne	:3615
	lda	#5
	sta	NST%

:3615	lda	P%
	cmp	#$1069
	bne	:3617
	lda	VC%
	cmp	#69
	bne	:3617
	LDAGS%	VC%;#18
	bne	:3617
	lda	#6
	sta	NST%
	STAGS%	VC%;#19
	lda	#1
	sta	RE%
	sta	LS%

:3617	lda	P%
	cmp	#$105d
	bne	:3620
	lda	VC%
	cmp	#69
	bne	:3620
	LDAO%	#$1A;#0
	bne	:3620
	LDAGS%	VC%;#19
	bne	:3620
	lda	#$1a
	jsr	:9900
	jmp	:1150

:3620	lda	P%
	cmp	#$1058
	beq	:3621
	cmp	#$104e
	beq	:3621
	cmp	#$2069
	beq	:3621
	cmp	#$3061
	bne	:3630
:3621	lda	VC%
	cmp	#69
	bne	:3630
	LDAO%	#32;#1
	bne	:3630
	lda	#7
	sta	NST%
	STAF%	#15;#1
	lda	#$20
	jsr	:9810

:3630	lda	P%
	cmp	#$1047	; 
	bne	:3635
	lda	VC%
	cmp	#70
	bne	:3635
	lda	#1	; ca ressemble à un perchoir
	sta	NST%

:3635	lda	P%
	cmp	#$1048	; 
	bne	:3640
	lda	VC%
	cmp	#70
	bne	:3640
	lda	#2	; un banal anneau
	sta	NST%

:3640	lda	P%
	cmp	#$101b	; 
	bne	:3642
	lda	VC%
	cmp	#70
	bne	:3642
	LDAO%	#$0d;#1
	bne	:3642
	lda	#3	; riche idée mais ça semble
	sta	NST%

:3642	lda	P%
	cmp	#$105b	; 
	bne	:3645
	lda	VC%
	cmp	#70
	bne	:3645
	LDAO%	#2;#1
	bne	:3645
	lda	#3	; riche idée mais ça semble
	sta	NST%

:3645	lda	P%
	cmp	#$1016	; sonner cloche
	beq	:3646
	cmp	#$1025	; utiliser cloche
	bne	:3647
:3646	lda	VC%
	cmp	#70
	bne	:3647
	LDAF%	#16;#1
	bne	:3647
	jsr	:4020

:3647	lda	P%
	cmp	#$1083	; parler corbeau
	bne	:3648
	LDAF%	#17;#1
	bne	:3648
	lda	VC%
	cmp	#70
	bne	:3648
	lda	#9
	sta	NST%

:3648	lda	P%
	cmp	#$1066	; donner manuscrit
	bne	:3650
	LDAF%	#17;#1
	bne	:3650
	lda	VC%
	cmp	#70
	bne	:3650
	LDAO%	#$15;#1
	bne	:3650
	jmp	:3950	; FINAL

:3650	lda	P%
	cmp	#$1060	; accrocher cloche-chainee
	beq	:3651
	cmp	#$2065	; accrocher cloche-chainee cloche ?
	bne	:3900
:3651	lda	VC%
	cmp	#70
	bne	:3900
	LDAO%	#$1d;#1	; a-t-on la cloche chaînée ?
	bne	:3900
	jsr	:4010	; Bravo...

:3900	jmp	:1100

*-----------------------------------
* 3960 - FINAL
*-----------------------------------

doWON

:3950
:3960	jsr	loadWON	; load and play the WON music

	@CLS	#1
	@CLS	#2
	jsr	:50134	; draw frame

	@SHOWPIC	#ELIPH	; show last picture
	
	lda	#FINALE	; pointer to text
	sta	PTXT%
	lda	#^FINALE
	sta	PTXT%+2
	
	lda	#creWAIT_WON	; delay time
	sta	WAIT%
	lda	#TRUE	; set tempo to true
	sta	TE%
	jsr	:9630	; draw text
	
	@INKEY		; wait for a key
	jmp	doCREDITS

*-----------------------------------
* 4000
*-----------------------------------

:4000	lda	#2
	sta	NST%
	STAF%	#13;#2
	lda	#$0b
	jsr	:9900
	lda	#4
	jsr	:9810	; jmp
	rts
	
:4010	lda	#4
	sta	NST%
	STAF%	#16;#1
	lda	#$1d
	jsr	:9810
	STAGS%	VC%;#13
	lda	#1
	sta	RE%
	sta	LS%
	rts

:4020	lda	#5
	sta	NST%
	STAF%	#17;#1
	STAGS%	VC%;#14
	lda	#1
	sta	RE%
	sta	LS%
	rts

*-----------------------------------
* 4500
*-----------------------------------

:4500
:4510	stz	NST%
	jsr	:960

:4520	lda	P%
	cmp	#$1039	; 1022 + 17 pour JETER qui manque
	bne	:4525
	lda	VC%
	cmp	#80
	bne	:4525
	LDAO%	#27;#1	; a-t-on les cailloux ?
	bne	:4525	; non
	jsr	:5495	; oui, on va retirer l'objet
	jmp	:5400
	
:4525	lda	P%
	cmp	#$104d	; ramasser chainette
	bne	:4530
	lda	VC%
	cmp	#80
	bne	:4530
	LDAF%	#18;#2
	bne	:4530
	STAF%	#18;#3
	lda	#2
	jsr	:9900
	jmp	:1150

:4530	lda	P%
	cmp	#$1055
	beq	:4531
	cmp	#$1057
	bne	:4535
:4531	lda	VC%
	cmp	#80
	bne	:4535
	lda	#3
	sta	NST%
	STAF%	#18;#2

:4535	lda	P%
	cmp	#$1054
	bne	:4537
	lda	VC%
	cmp	#80
	LDAF%	#18;#2
	bcs	:4537
	lda	#1
	sta	NST%

:4537	lda	P%
	cmp	#$1036
	bne	:4538
	lda	VC%
	cmp	#82
	bne	:4538
	lda	#1
	sta	NST%

:4538	lda	P%
	cmp	#$1057
	bne	:4540
	lda	VC%
	cmp	#82
	bne	:4540
	lda	#2
	sta	NST%

:4540	lda	P%
	cmp	#$1056
	beq	:4541
	cmp	#$102a
	bne	:4545
:4541	lda	VC%
	cmp	#84
	bne	:4545
	lda	#1
	sta	NST%

:4545	lda	P%
	cmp	#$1057
	bne	:4550
	lda	VC%
	cmp	#84
	bne	:4550
	lda	#2
	sta	NST%

:4550	lda	P%
	cmp	#$105a
	bne	:4555
	lda	VC%
	cmp	#84
	bne	:4555
	LDAGS%	#84;#16
	bne	:4555
	lda	#3
	sta	NST%
	STAGS%	#84;#17
	lda	#1
	sta	RE%
	sta	LS%

:4555	lda	P%
	cmp	#$1018
	bne	:4560
	lda	VC%
	cmp	#81
	bne	:4560
	lda	#3
	sta	NST%

:4560	lda	P%
	cmp	#$09a5
	beq	:4561
	cmp	#$1014
	bne	:4565
:4561	lda	VC%
	cmp	#81
	bne	:4565
	LDAF%	#13;#0
	bne	:4565
	LDAO%	#4;#1
	bne	:4565
	lda	#1
	sta	NST%

:4565	lda	P%
	cmp	#$09a5
	beq	:4566
	cmp	#$1014
	bne	:4570
:4566	lda	VC%
	cmp	#81
	bne	:4570
	LDAF%	#13;#1
	bne	:4570
	LDAO%	#4;#1
	bne	:4570
	jsr	:4000
	jmp	:5400

:4570	lda	P%
	cmp	#$09a5
	beq	:4571
	cmp	#$1014
	bne	:4580
:4571	lda	VC%
	cmp	#81
	bne	:4580
	LDAF%	#13;#2
	bne	:4580
	lda	#3
	sta	NST%

:4580	lda	P%
	cmp	#$1036
	beq	:4581
	cmp	#$1057
	bne	:4585
:4581	lda	VC%
	cmp	#83
	bne	:4585
	lda	#1
	sta	NST%

:4585	lda	P%
	cmp	#$103b
	bne	:4590
	lda	VC%
	cmp	#83
	bne	:4590
	LDAF%	#21;#0
	bne	:4590
	lda	#2
	sta	NST%

:4590	lda	P%
	cmp	#$106a	; 
	beq	:4591
	cmp	#$1074	; utiliser echelle
	beq	:4591
	cmp	#$206c
	bne	:4595
:4591	lda	VC%
	cmp	#83
	bne	:4595
	LDAO%	#1;#1
	bne	:4595
	lda	#3
	sta	NST%
	STAF%	#20;#1

:4595	lda	P%
	cmp	#$1085
	bne	:4600
	lda	VC%
	cmp	#83
	bne	:4600
	LDAF%	#20;#1
	bne	:4600
	LDAO%	#21;#0
	bne	:4600
	LDAO%	#24;#0
	bne	:4600
	lda	#4
	sta	NST%
	STAF%	#21;#1

:4600	lda	P%
	cmp	#$105d
	bne	:4610
	LDAF%	#21;#1
	bne	:4610
	lda	VC%
	cmp	#83
	bne	:4610
	lda	#$18
	jsr	:9900
	jmp	:1150
	
:4610	lda	P%
	cmp	#$105e
	bne	:4620
	LDAF%	#21;#1
	bne	:4620
	lda	VC%
	cmp	#83
	bne	:4620
	lda	#$15
	jsr	:9900
	jmp	:1150

:4620	lda	P%
	cmp	#$106b
	bne	:4625
	lda	VC%
	cmp	#86
	bne	:4625
	lda	#1
	sta	NST%

:4625	lda	P%
	cmp	#$1057
	bne	:4700
	lda	VC%
	cmp	#86
	bne	:4700
	lda	#2
	sta	NST%
	STAF%	#13;#1
	
:4700	lda	P%
	cmp	#$1015
	beq	:4701
	cmp	#$1007
	bne	:4710
:4701	lda	VC%
	cmp	#85
	bne	:4710
	lda	#1
	sta	NST%

:4710	lda	P%
	cmp	#$1008
	bne	:4720
	lda	VC%
	cmp	#85
	bne	:4720
	lda	#2
	sta	NST%

:4720	lda	P%
	cmp	#$1019
	bne	:4730
	lda	VC%
	cmp	#85
	bne	:4730
	lda	#3
	sta	NST%

:4730	lda	P%
	cmp	#$1031
	bne	:4740
	lda	VC%
	cmp	#85
	bne	:4740
	lda	#4
	sta	NST%

:4740	lda	P%
	cmp	#$10c1
	bne	:4750
	lda	VC%
	cmp	#85
	bne	:4750
	LDAGS%	#85;#20
	bne	:4750
	lda	#5
	sta	NST%
	STAGS%	#85;#21
	lda	#1
	sta	LS%
	sta	RE%

:4750	lda	P%
	cmp	#$101e
	bne	:5400
	lda	VC%
	cmp	#85
	bne	:5400
	LDAGS%	#85;#20
	bne	:5400
	lda	#6
	sta	NST%

:5400	jmp	:1100

:5495	lda	#2
	sta	NST%
	STAF%	#18;#1
	lda	#27
	jsr	:9810
	STAGS%	#80;#0
	lda	#1
	sta	RE%
	rts

*-----------------------------------
* 5500
*-----------------------------------

:5500
:5510	stz	NST%
	jsr	:960
	
:5515	lda	P%
	cmp	#$103A
	bne	:5520
	lda	VC%
	cmp	#88
	bne	:5520
	lda	#1
	sta	NST%

:5520	lda	P%
	cmp	#$1060
	bne	:5525
	lda	VC%
	cmp	#88
	bne	:5525
	LDAGS%	#88;#22
	bne	:5525
	lda	#2
	sta	NST%

:5525	lda	P%
	cmp	#$108B
	bne	:5530
	lda	VC%
	cmp	#88
	bne	:5530
	LDAGS%	#88;#22
	bne	:5530
	lda	#3
	sta	NST%
	STAGS%	#88;#23
	lda	#1
	sta	RE%
	sta	LS%

:5530	lda	P%
	cmp	#$1060
	bne	:5535
	lda	VC%
	cmp	#88
	bne	:5535
	LDAGS%	#88;#23
	bne	:5535
	jmp	:6000

:5535	lda	P%
	cmp	#$103A
	bne	:5537
	lda	VC%
	cmp	#89
	bne	:5537
	lda	#1
	sta	NST%

:5537	lda	P%
	cmp	#$1015
	beq	:5538
	cmp	#$1017
	bne	:5540
:5538	lda	#4
	sta	NST%
	STAF%	#23;#1

:5540	lda	P%
	cmp	#$1005
	beq	:5541
	cmp	#$1031
	bne	:5542
:5541	lda	VC%
	cmp	#89
	bne	:5542
	LDAF%	#24;#0
	bne	:5542
	lda	#2
	sta	NST%

:5542	lda	P%
	cmp	#$1034
	beq	:5543
	cmp	#$2060
	bne	:5545
:5543	LDAF%	#23;#1
	bne	:5545
	LDAF%	#29;#0
	bne	:5545
	jsr	:23500	; enter code
	jmp	:1150

:5545	lda	P%
	cmp	#$1005
	bne	:5550
	lda	VC%
	cmp	#89
	bne	:5550
	LDAF%	#24;#1
	bne	:5550
	lda	#3
	sta	NST%

:5550	lda	P%
	cmp	#$1033
	beq	:5551
	cmp	#$103D
	bne	:5985
:5551	lda	VC%
	cmp	#89
	bne	:5985
	LDAF%	#24;#0
	bne	:5985
	jmp	:6010

:5985	jmp	:1100

*-----------------------------------
* 6000 - 
*-----------------------------------

:6000	STAGS%	#88;#24
	lda	#1
	sta	RE%
	sta	LS%
	lda	#$14
	jsr	:9900
	jmp	:1150

:6010	lda	#3
	sta	NST%
	STAF%	#24;#1
	STAGS%	#89;#26
	lda	#1
	sta	RE%
	sta	LS%
	jmp	:5985

*-----------------------------------
* 8000 - BOUCLE PRINCIPALE
*-----------------------------------

:8000
:8010	jsr	:8720
:8020	jsr	:9950
	
	lda	NST%
	cmp	#-1
	bne	:8080
	stz	NST%

*:8080
*	sep	#$20	; create the index string
*
*	lda	#'0'	; was at :8100
*	sta	VC$
*	
*	ldx	VC%	; VC% to V$
*	lda	tblDECIMAL,x
*	and	#%1111_0000
*	lsr
*	lsr
*	lsr
*	lsr
*	ora	#'0'
*	sta	VC$+1
*	lda	tblDECIMAL,x
*	and	#%0000_1111
*	ora	#'0'
*	sta	VC$+2
*
*	ldx	NST%	; NST% to V$
*	lda	tblDECIMAL,x
*	and	#%1111_0000
*	lsr
*	lsr
*	lsr
*	lsr
*	ora	#'0'
*	sta	VC$+3
*	lda	tblDECIMAL,x
*	and	#%0000_1111
*	ora	#'0'
*	sta	VC$+4
*	rep	#$20
*
*:8165	lda	CS%
*	cmp	#1
*	beq	:8180
*
*:8170	@STRCMP	#VC$;#V2$	; same string?
*	bcc	:8320	; full skip
*
*:8175	@LEFT	#VC$;#V2$;#3	; same room?
*	bcc	:8240	; partial skip
*
*:8180	@STRCPY	#VC$;#V2$	; V2$ = VC$

*
* Let's make it in assembly instead...
* We'll search for the string of index: VC% NST%
* instead of the text string of: # STR$(VC%) STR$(NST%)
*

:8080
:8165	lda	CS%
	cmp	#1
	beq	:8180

:8170	lda	VC%
	cmp	VC2%
	bne	:8175
	lda	NST%
	cmp	NST2%
	beq	:8320

:8175	lda	VC%
	cmp	VC2%
	beq	:8240

:8180	lda	VC%
	sta	VC2%
	lda	NST%
	sta	NST2%

:8200	jsr	:30000	; load text and image
:8240	jsr	:9080	; find text
:8300	jsr	:9630	; print text
:8320	jsr	:9700	; print directions
:8430	rts

*-----------------------------------
* 8530 - ATTENTE UNE SAISIE AU CLAVIER
*-----------------------------------

:8529
:8530	stz	P%

:8560	@PRINT	#0;Q$
	@INPUT	#QFV$;#MAXLEN
	@UPPER	#QFV$;#QFV$	; make it uppercase

*	@STRCMP	#QFV$;#IV$	; INVENT
*	bcs	:8571
*
*	jsr	:9920
*	lda	#TRUE
*	sta	SY%
*	rts
*
*:8571	@STRCMP	#QFV$;#IS$	; ISSUE
*	bcs	:8580
*	
*	jsr	:9700
*	lda	#TRUE
*	sta	SY%
*	rts

:8580	jsr	:22050	; check all words

*--- AV

	lda	P%	; INVENTAIRE...
	cmp	#$3333
	bne	:8581

	jsr	:9920
	lda	#TRUE
	sta	SY%
	rts

:8581	lda	P%	; ISSUE/DIRECTION
	cmp	#$4444
	bne	:8582

	jsr	:9700
	lda	#TRUE
	sta	SY%
	rts

:8582	lda	P%	; LOAD
	cmp	#$5555
	bne	:8583
	
	jsr	makeLOAD
	bcs	:8583
	
	lda	#-1	; force refresh
	sta	VC2%
	sta	NST2%

	pla
	jmp	:700

:8583	lda	P%	; SAVE
	cmp	#$6666
	bne	:8584

	jsr	makeSAVE	
	lda	#TRUE
	sta	SY%
	rts

:8584	lda	P%	; QUIT
	cmp	#$7777
	bne	:8585

	jsr	makeQUIT
	lda	#TRUE
	sta	SY%
	rts

:8585	lda	P%	; RESTART
	cmp	#$8888
	bne	:8586

	jsr	makeRESTART
	bcs	:8590

	pla
	jmp	:100

:8586	lda	P%	; REMPLISSAGE
	cmp	#$9999
	bne	:8590
	
	lda	fgFILL
	eor	#1
	sta	fgFILL
	lda	#TRUE
	sta	SY%
	rts

*--- fin AV

:8590	sep	#$30
	ldx	#0
]lp	lda	CC$,x	; COMBINER
	beq	:8600
	cmp	QFV$,x
	bne	:8650
	inx
	bne	]lp
:8600	rep	#$30
	jsr	:24000
	lda	#TRUE
	sta	SY%
	rts

:8650	rep	#$30
	lda	P%
	cmp	#0
	bne	:8680

	@PRINT	#0;Z$
	jsr	:32000
:8680	rts

*---

CC$	asc	'COMBINE'00
IV$	asc	'INVENT'00	; useless
IS$	asc	'EXIT'00	; useless

*-----------------------------------
* Antoine's system calls
*-----------------------------------

*--- Load or not load

makeLOAD	@PRINT	#0;strLOAD
	@INPUT	#QFV$;#1

	lda	lenSTRING
	beq	makeLOAD99

	lda	QFV$
	cmp	#'1'
	bcc	makeLOAD99
	cmp	#'9'+1
	bcs	makeLOAD99
	
	jsr	doLOAD
	bcs	makeLOAD99
	
	clc
	rts

makeLOAD99	sec
	rts

*--- Save or not save

makeSAVE	@PRINT	#0;strSAVE
	@INPUT	#QFV$;#1

	lda	lenSTRING
	beq	makeSAVE99

	lda	QFV$
	cmp	#'1'
	bcc	makeSAVE99
	cmp	#'9'+1
	bcs	makeSAVE99
	
	jsr	doSAVE	; return condition not checked

makeSAVE99	rts

*--- Quit or not quit

makeQUIT	@PRINT	#0;strQUIT
	@INPUT	#QFV$;#1
	@UPPER	#QFV$;#QFV$	; make it uppercase

	lda	lenSTRING
	beq	makeQUIT99

	lda	QFV$
	cmp	#chrOUI
	bne	makeQUIT99

	pla
	jmp	QUIT

makeQUIT99	rts

*--- Restart or not restart

makeRESTART	@PRINT	#0;strRESTART
	@INPUT	#QFV$;#1
	@UPPER	#QFV$;#QFV$	; make it uppercase

	lda	lenSTRING
	beq	makeRESTART99

	lda	QFV$
	cmp	#chrOUI
	bne	makeRESTART99

	clc
	rts
makeRESTART99	sec
	rts

*-----------------------------------
* 8720 - ANALYSE W$
*-----------------------------------

:8720	lda	VC%
	asl
	asl
	tax
	ldal	tblW$,x
	sta	Debut
	ldal	tblW$+2,x
	sta	Debut+2
	ora	Debut
	bne	:8880

	@PRINT	#0;strPASDEWARP
	rts

:8880	ldy	#idx_w_bin	; pointer to image data
	lda	[Debut],y
	sta	PIS$
	iny
	iny
	lda	[Debut],y
	sta	PIS$+2
	
:8885	lda	#1
	sta	IMG%
	
:8890	ldy	#idx_w_vc
	lda	[Debut],y
	and	#$ff
	cmp	VC%
	bne	:8920
	
	lda	#2
	sta	IMG%

:8920	ldy	#idx_w_is
	lda	[Debut],y
	and	#$ff
	sta	IS%
	rts

*-----------------------------------
* 9080 - RECHERCHE DU TEXTE
*-----------------------------------

:9070
:9080	lda	#DIALFR
	sta	dpFROM
	lda	#^DIALFR
	sta	dpFROM+2

]lp	lda	[dpFROM]	; check word
	beq	:9105	; -> end of data
	and	#$ff	; check first byte
	cmp	VC%
	bne	:9090	; not the string to display

	inc	dpFROM	; *ptr++
	lda	[dpFROM]	; check second byte
	and	#$ff
	cmp	NST%
	bne	:9090	; not the string to display

	inc	dpFROM	; return pointer
	lda	dpFROM	; of string
	sta	PTXT%	; to display
	lda	dpFROM+2
	sta	PTXT%+2
	rts
	
:9090	inc	dpFROM	; not the right string
	lda	[dpFROM]	; go to the end of a string (hint: 00)
	and	#$ff
	bne	:9090
	inc	dpFROM	; and *ptr++
	bra	]lp	; loop

:9105	@PRINT	#0;strNOID	; no ID found!!
	jsr	:32000	; jmp
	
	stz	PTXT%	; no text found
	stz	PTXT%+2

:9600	rts		; ...weird

*-----------------------------------
* 9630 - AFFICHAGE TEXTE FENETRE 2
*-----------------------------------
* WINDOW #2,1,40,18,22

:9610
:9630	@CLS	#0
	@CLS	#2	; stream is set to 2
	
	lda	#3
	sta	X%
	lda	#1
	sta	Y%
	lda	#-1
	sta	C%

	lda	PTXT%	; check valid pointer
	ora	PTXT%+2
	bne	:9635	; exit if empty
	rts
	
:9635	lda	PTXT%	; copy pointer
	sta	dpFROM
	lda	PTXT%+2
	sta	dpFROM+2
	
:9640	lda	C%
	cmp	#eEOD
	bne	:9641
	rts

:9641	lda	[dpFROM]	; get a character
	and	#$ff
	sta	C%

	jsr	checkREPLAY	; for muzak

	inc	dpFROM
	lda	[dpFROM]
	and	#$ff
	sta	D%

:9662	lda	C%
	cmp	#eEOD
	beq	:9663
	cmp	#' '	; 32
	bcs	:9664
:9663	lda	#3
	sta	X%
	inc	Y%
	jmp	:9668

:9664	@LOCATE	#2;X%;Y%
	lda	C%
	jsr	COUT_ALT	; no, output char
	inc	X%

:9668	lda	TE%	; shall we wait?
	cmp	#TRUE
	bne	:9670
	@WAIT	WAIT%

:9670	lda	X%	; X%>38
	cmp	#38+1
	bcs	:9674
	lda	C%	; C%=
	cmp	#'?'	; 63
	beq	:9674
	cmp	#eEOD	; 0 (was 35)
	beq	:9674
	cmp	#'.'	; (C%=46
	bne	:9671
	lda	D%
	cmp	#'.'	; AND D%<>46)
	bne	:9674

:9671	lda	C%	; (C%=32 AND X%>32)
	cmp	#' '	; 32
	bne	:9672
	lda	X%
	cmp	#32+1
	bcs	:9674

:9672	lda	C%	; (C%=44 AND X%>32)
	cmp	#chrCOMMA	; 44
	bne	:9675
	lda	X%
	cmp	#32
	bcc	:9675
	beq	:9675

:9674	lda	#3
	sta	X%
	inc	Y%

:9675	lda	Y%
	cmp	#6
	bne	:9680
	
	@PRINT	#2;CR$
	lda	#5
	sta	Y%
	
:9680	jmp	:9640

*-----------------------------------
* 9700 - AFFICHAGE DIRECTIONS
*-----------------------------------

:9699
:9700	@CLS	#0
	@PRINT	#0;W$
	@PEN	#0;#indexORANGE
	
	lda	IS%
	and	#1
	beq	:9720
	@PRINT	#0;NO$

:9720	lda	IS%
	and	#2
	beq	:9730
	@PRINT	#0;SU$

:9730	lda	IS%
	and	#4
	beq	:9740
	@PRINT	#0;OU$

:9740	lda	IS%
	and	#8
	beq	:9750
	@PRINT	#0;ES$

:9750	@PRINT	#0;CR$
	@PEN	#0;#indexBLACK
	rts

*-----------------------------------
* 9810 - RETIRE UN OBJET
* SI ON L'A
*-----------------------------------

:9809
:9810	sta	OB%

	lda	K%	; do we have objects?
	bne	:9811	; yes
	rts

:9811	ldx	#0	; do we have that object?
]lp	lda	SAC%,x
	and	#$ff
	cmp	OB%
	beq	:9812
	inx
	cpx	K%
	bcc	]lp
	rts		; we don't have it

* K% = 4 & OB% = 6
* Index: 0 1 2 3 -> X = 2
* SAC% : 2 4 6 8

:9812	sep	#$20
]lp	lda	SAC%+1,x	; 3 => 8
	sta	SAC%,x	; 2 => 8
	inx
	cpx	K%
	bcc	]lp
	dec	K%
	
	ldx	OB%	; on n'a plus l'objet
	lda	#FALSE
	sta	O%,x

	rep	#$20
	rts

*-----------------------------------
* 9900 - AJOUTE OBJET
* SI ON NE L'A PAS DEJA
*-----------------------------------

:9899
:9900	sta	OB%

* K% = 4 & OB% = 6
* Index: 0 1 2 3 -> X = 2
* SAC% : 2 4 6 8

	lda	K%	; do we have objects?
	beq	:9902	; no
	
:9901	ldx	#0	; do we have that object?
]lp	lda	SAC%,x
	and	#$ff
	cmp	OB%
	beq	:9906	; we have it
	inx
	cpx	K%
	bcc	]lp

:9902	ldx	K%
	sep	#$20	; we do not have it
	lda	OB%
	sta	SAC%,x

	ldx	OB%	; on a l'objet
	lda	#TRUE
	sta	O%,x

	rep	#$20
	inc	K%
	@PRINT	#0;strOK
	jsr	:32000
	rts

:9906	@PRINT	#0;AD$
	jsr	:32000
	rts

*-----------------------------------
* 9910 - VERIFIE POSSESSION OBJET
*-----------------------------------

DO9910
:9910	sta	OB%

	ldy	#FALSE	; not owned
	lda	K%	; no object
	beq	:9912	; owned, exit

	ldx	#0
]lp	lda	SAC%,x
	and	#$ff
	cmp	OB%
	beq	:9911
	inx
	cpx	K%
	bcs	:9912
	bcc	]lp

:9911	ldy	#TRUE
:9912	cpy	#FALSE
	rts

*-----------------------------------
* 9920 - AFFICHE L'INVENTAIRE
*-----------------------------------

:9920	@CLS	#0
	@PRINT	#0;BG$

	lda	K%	; do we have items?
	bne	:9930	; yes
	
	@PRINT	#0;strRIEN
	rts		; no, return

* SAC% est le tableau qui contient les indexes des objets
* Objets dont le texte est en tblO$

:9930	stz	N%	; for n=0 to k
]lp	ldx	N%
	cpx	#0
	beq	:9940	; no comma for first entry

	@PRINT	#0;strCOMMA	; separate entries

:9940	ldx	N%
	lda	SAC%,x	; get object index
	and	#$ff
	asl
	asl
	tax
	ldal	tblO$,x	; get pointer to object string
	tay
	ldal	tblO$+2,x
	tax
	lda	#0	; window #0
	jsr	PRINT	; print it
	jsr	INKEY
	
	inc	N%
	lda	N%
	cmp	K%
	bcc	]lp

	@PRINT	#0;CR$
	rts

*-----------------------------------
* 9950 - GERE DES CONDITIONS
*-----------------------------------

:9949
:9950	lda	VC%
	cmp	#3
	bne	:9954
	LDAPP%	#4;#3
	bne	:9954
	lda	#2
	sta	IMG%
	
:9954	lda	VC%
	cmp	#3
	bne	:9958
	LDAPP%	#4;#3
	bne	:9958
	LDAF%	#26;#2
	bne	:9958
	inc	IS%

:9958	lda	VC%
	cmp	#31
	bne	:9959
	LDAF%	#11;#1
	bne	:9959
	lda	P%
	cmp	#0
	bne	:9959
	lda	#8
	sta	NST%

:9959	lda	VC%
	cmp	#31
	bne	:9960
	LDAF%	#11;#0
	bne	:9960
	LDAO%	#9;#1
	bne	:9960

	lda	#9
	sta	NST%
	STAF%	#11;#1
	lda	#9
	jsr	:9810
	lda	#8
	jsr	:9900

:9960	lda	VC%
	cmp	#31
	bne	:9962
	LDAF%	#11;#0
	bne	:9962
	LDAO%	#7;#1
	bne	:9962
	
	lda	#9
	sta	NST%
	STAF%	#11;#1
	lda	#7
	jsr	:9810

:9962	lda	VC%
	cmp	#29
	bne	:9965
	LDAF%	#27;#1
	bne	:9965
	inc	IS%

:9965	lda	VC%
	cmp	#28
	bne	:9970
	lda	#27	; I know...
	sta	VC%	; DEC exists
	lda	#2
	sta	NST%
	STAF%	#0;#1

:9970	lda	VC%
	cmp	#31
	bne	:9972
	LDAF%	#25;#1
	bne	:9972
	lda	IS%
	clc
	adc	#4
	sta	IS%

:9972	lda	VC%
	cmp	#27
	bne	:9975
	lda	NST%
	cmp	#2
	bne	:9975
	STAF%	#0;#1

:9975	lda	VC%
	cmp	#52
	bne	:9980
	LDAGS%	#52;#0
	bne	:9980
	inc	IS%

:9980	lda	VC%
	cmp	#69
	bne	:9982
	LDAF%	#15;#1
	bne	:9982
	lda	IS%
	clc
	adc	#4
	sta	IS%

:9982	lda	VC%
	cmp	#67
	beq	:9983
	cmp	#68
	bne	:9985
:9983	LDAF%	#28;#1
	bne	:9985
	lda	#7
	sta	NST%
	lda	#68
	sta	VC%
	lda	#4
	sta	IS%

:9985	lda	VC%
	cmp	#85
	bne	:9990
	LDAGS%	#85;#21
	bne	:9990
	inc	IS%

:9990	lda	VC%
	cmp	#7
	beq	:9991
	cmp	#89
	bne	:10010
:9991	LDAF%	#24;#1
	bne	:10010
	inc	IS%

:10010	lda	RE%
	cmp	#1
	bne	:10490
	jsr	:30045
	stz	RE%

:10490	rts

*-----------------------------------
* 10500 - CREATION TABLEAU OBJET O$
*-----------------------------------

:10500	rts

*-----------------------------------
* 12000 - CREATION TABLEAU WARP W$
*-----------------------------------

:12000	rts

*-----------------------------------
* 13020 - CREATION TABLEAU DICO V$
*-----------------------------------

:13020	rts

*-----------------------------------
* 14000 - VALIDATE CODE
*-----------------------------------
*
* M$ = "12345" or M$+0..4 for 5 chars
* C$ = "678"   or M$+6..8 for 3 chars
*
* Code is: 86461-750

:14000	stz	R$	; clear 6 chars
	stz	R$+2
	stz	R$+4

	stz	N%	; index within M$
	stz	C%	; index within C$
	stz	R%	; index within R$

:14010	ldx	C%
	lda	M$+6,x	; "12345-XYZ"
	and	#$ff
	cmp	#'0'	; check NaN
	bcs	:14011
	rts
:14011	cmp	#'9'+1
	bcc	:14012
	rts
:14012	sec
	sbc	#'0'
	tay

	stz	A%
:14020	lda	A%	; pointer to T$(A%)
	asl
	asl
	tax
	ldal	tblT$,x
	sta	Debut
	ldal	tblT$+2,x
	sta	Debut+2

	lda	[Debut],y	; MID$(T$(a%),y%+1,1)
	and	#$ff
	sta	Arrivee
	
	ldx	N%	; CHR$(ASC(MID$(M$,n%,1)))
	lda	M$,x
	and	#$ff
	cmp	Arrivee
	bne	:14040	; different chars

	ldx	R%	; stay in 16-bit to
	lda	A%	; put a trailing 0
	ora	#'0'
	sta	R$,x
	inc	R%

:14040	inc	A%	; NEXT A%
	lda	A%
	cmp	#9
	bcc	:14020
	beq	:14020
	
	inc	C%	; C%=C%+1
	lda	C%	; IF C%>LEN(C$) THEN C%=1
	cmp	#3
	bcc	:14050
	stz	C%

:14050	inc	N%
	lda	N%
	cmp	#5
	bcc	:14010
	rts

*-----------------------------------
* 15000 - CREATE T$
*-----------------------------------

:15000	rts

*-----------------------------------
* 16000 - INITIALISATION TABLEAUX
*-----------------------------------

:16000

*	@CLS	#0
*	@LOCATE	#0;#14;#20
*	@PRINT	#0;strPATIENTEZ

	ldx	#STRING_IN
]lp	stz	|$0000,x
	inx
	cpx	#STRING_OUT
	bcc	]lp

	ldx	#DATA_IN
]lp	stz	|$0000,x
	inx
	cpx	#DATA_OUT
	bcc	]lp

:16010	lda	#1
	sta	VC%
	sta	NT%
	STAPP%	#7;#22
	STAPP%	#6;#33
	
*	lda	#'X'
*	sta	V2$

	lda	#-1
	sta	VC2%
	sta	NST2%

:16040	STAGS%	#84;#16
	STAGS%	#80;#15
	STAGS%	#52;#9
	STAGS%	#33;#7
	STAGS%	#68;#12
	STAGS%	#81;#5
	STAGS%	#69;#18

:16050	STAGS%	#85;#20
	STAGS%	#88;#22
	STAGS%	#89;#25
	stz	FT

	lda	#creWAIT_TXT	; delay for texts
	sta	WAIT%
	lda	#TRUE
	sta	TE%
	rts

*-----------------------------------
* 17000 - INIT VARIABLES & WINDOWS
*-----------------------------------

:17000	@MODE	#1

*	@INK	#0;#0	; black
*	@INK	#1;#26	; white
*	@INK	#3;#15	; orange

	@BORDER	#indexWHITE
	
	@WINDOW	#0;#tblWINDOW0
	@PAPER	#0;#indexWHITE
	@PEN	#0;#indexBLACK
	@WINDOW	#1;#tblWINDOW1
	@PAPER	#1;#indexWHITE
	@PEN	#1;#indexBLACK
	@WINDOW	#2;#tblWINDOW2
	@PAPER	#2;#indexWHITE
	@PEN	#2;#indexBLACK

	@CLS	#0
	@CLS	#1
	@CLS	#2

	rts

*---

tblWINDOW0	dw	1,40,23,25
tblWINDOW1	dw	1,40,1,17
tblWINDOW2	dw	1,40,18,22

*-----------------------------------
* 22050 - RECHERCHE MOT DANS DICO
*-----------------------------------

* 1. on met un mot de QFV$ dans MOT$
* 2. on le cherche dans le dictionnaire
* 3. si on le trouve, on l'ajoute
* 4. on retourne en 1

:22050	stz	N%	; P% is zeroed at :8530

* 1. on met un mot de QFV$ dans MOT$

*    0         1
*    012345678901
* 12 DIRE BONJOUR00

:22055	sep	#$30	; cherche où commence le mot
	ldx	N%
]lp	lda	QFV$,x
	beq	plusdemot
	cmp	#chrSPC
	bne	debutmot
	inx
	cpx	lenSTRING
	bcc	]lp
plusdemot	rep	#$30	; exit
	rts

	mx	%11

debutmot	ldy	#0	; X Y c X Y
]lp	lda	QFV$,x	; 0 0 D 1 1
	beq	finmot
	cmp	#chrSPC	; 1 1 I 2 2
	beq	finmot	; 2 2 R 3 3
	iny		; 3 3 E 4 4
	sta	MOT$,y	; 4 4 / end
	inx
	cpx	lenSTRING	; B O N J O U R
	bcc	]lp	; 5 6 7 8 9 0 1
			; 0 1 2 3 4 5 6
			
finmot	sty	MOT$	; word length
	stx	N%	; new X index
	
* 2. on cherche dans tous les mots

	rep	#$30
	lda	#tblV$
	sta	Debut
	lda	#^tblV$
	sta	Debut+2
	stz	Y%

:22060	sep	#$30
	lda	[Debut]
	and	#$ff
	bne	:22070
	jmp	:22055

	mx	%11
	
:22070	sep	#$30
	ldy	#0	; check word
]lp	lda	[Debut],y
	cmp	MOT$,y
	bne	:22080	
	iny
	cpy	MOT$
	bcc	]lp
	beq	]lp
	
	jsr	:23000	; word found (return in 16-bit)
	jmp	:22055

	mx	%00

:22080	rep	#$30
	lda	[Debut]	; points to next word
	and	#$ff
	inc		; 3 EST => 4
	clc
	adc	Debut
	sta	Debut

	inc	Y%	; next word
	jmp	:22060

*-----------------------------------
* 23000 - AJOUTE VALEUR MOT
*-----------------------------------

:23000	rep	#$30
	lda	Y%	; word index
	asl		; make it a word in 65816
	tax
	ldal	tblVP$,x	; get its value
	clc
	adc	P%	; add it
	sta	P%	; save new value
	rts

*-----------------------------------
* 23500 - DEMANDE SAISIE CODE
*-----------------------------------

* M$ = "12345-678"

:23500	@PRINT	#0;EC$
	@PRINT	#0;CO$
	@INPUT	#M$;#9

:23505	lda	lenSTRING
	cmp	#9
	bne	:23600
	lda	M$+5
	and	#$ff
	cmp	#'-'
	bne	:23600

:23520	jsr	:14000

	@STRCMP	#R$;#R$1
	bcc	:23530
	@STRCMP	#R$;#R$2
	bcs	:23600

:23530	@PRINT	#0;CB$

	lda	#$12
	jsr	:9900
	STAF%	#29;#1
	rts

:23600	@PRINT	#0;CI$
	rts

*---

R$1	asc	'09593'00
R$2	asc	'11496'00

*-----------------------------------
* 24000 - GESTION DES COMBINAISONS
*-----------------------------------

:24000	
:24010	lda	P%
	cmp	#$4128
	bne	:24020
	jmp	:24110
:24020	lda	P%
	cmp	#$2063
	bne	:24030
	jmp	:24210
:24030	lda	P%
	cmp	#$2071
	bne	:24040
	jmp	:24310
:24040	lda	P%
	cmp	#$3081
	bne	:24050
	jmp	:24410
:24050	lda	P%
	cmp	#$3074
	bne	:24060
	jmp	:24510
:24060	jmp	:24600

:24110	CHKOBJ	#$05;:24115
:24115	CHKOBJ	#$18;:24120
:24120	CHKOBJ	#$19;:24125
:24125	CHKOBJ	#$1A;:24130
:24130	lda	#$05
	jsr	:9810
	lda	#$18
	jsr	:9810
	lda	#$19
	jsr	:9810
	lda	#$1A
	jsr	:9810
:24135	lda	#$06
	jsr	:9900
	jmp	:24700
	
:24210	CHKOBJ	#$02;:24215
:24215	CHKOBJ	#$0D;:24220
:24220	lda	#$02
	jsr	:9810
	lda	#$0D
	jsr	:9810
	lda	#$1D
	jsr	:9900
	jmp	:24700
	
:24310	CHKOBJ	#$07;:24315
:24315	CHKOBJ	#$08;:24320
:24320	lda	#$07
	jsr	:9810
	lda	#$08
	jsr	:9810
	lda	#$09
	jsr	:9900
	jmp	:24700
	
:24410	CHKOBJ	#$14;:24415
:24415	CHKOBJ	#$0A;:24420
:24420	CHKOBJ	#$0B;:24430
:24430	lda	#$0A
	jsr	:9810
	lda	#$0B
	jsr	:9810
	lda	#$14
	jsr	:9810
:24435	lda	#$1F
	jsr	:9900
	jmp	:24700
	
:24510	CHKOBJ	#$0F;:24515
:24515	CHKOBJ	#$10;:24520
:24520	CHKOBJ	#$11;:24525
:24525	lda	#$11
	jsr	:9810
	lda	#$13
	jsr	:9900
	jmp	:24700

DO24600	
:24600	@PRINT	#0;ME$
	rts
	
:24700	@PRINT	#0;NE$
	rts

*-----------------------------------
* 30000 - CHARGE TEXTE ET IMAGE
*-----------------------------------

:30000

* Image loading not needed
* Nothing to do for the DIALFR files

:30040	LDAGS%	VC%;#0
	beq	:30045

	lda	LS%
	cmp	#1
	bne	:30045

	ldx	VC%
	lda	GS%,x
	and	#$ff
	asl
	asl
	tax
	ldal	tblGS$,x
	sta	PA000%
	ldal	tblGS$+2,x
	sta	PA000%+2

	stz	LS%

:30045	@CLS	#1
	@CLS	#2
	jsr	:50134

	ldy	PIS$
	ldx	PIS$+2

	lda	IMG%
	cmp	#2
	beq	:30051

	tya		; get image 1
	clc
	adc	#2
	tay
	txa
	adc	#0
	tax
	bra	:30052
	
:30051	sty	dpFROM	; get image 2
	stx	dpFROM+2
	lda	[dpFROM]
	xba
	clc
	adc	dpFROM
	tay
	lda	dpFROM+2
	adc	#0
	tax
	
:30052	jsr	showPIC

:30055	LDAGS%	VC%;#0	; affiche les icones
	beq	:30060

	lda	LS%
	cmp	#1
	bne	:30060
	jsr	:30500	; jmp
	rts

:30060	LDAGS%	VC%;#0
	beq	:30150
	jsr	:30510

:30150	rts

*-----------------------------------
* 30200 - FICHIER WARP MANQUANT
*-----------------------------------

:30200	@PRINT	#0;strWARPMANQUANT
	rts

*-----------------------------------
* 30500 - AFFICHE IMAGE SUR IMAGE
*-----------------------------------

:30500	ldx	VC%
	lda	GS%,x
	and	#$ff
	asl
	asl
	tax
	ldal	tblGS$,x
	sta	PA000%
	ldal	tblGS$+2,x
	sta	PA000%+2

	stz	LS%
	
:30510	ldx	PA000%+2
	ldy	PA000%
	jsr	showPIC

:30520	rts

*-----------------------------------
* 31000 - CHARGE LES BINAIRES
*-----------------------------------

:31000	rts

*-----------------------------------
* 32000 - BOUCLE D'ATTENTE
*-----------------------------------

:32000	@WAIT	#60	; 1 seconde
	rts

*-----------------------------------
* 33000 - DEFINE STRING VARIABLES
*-----------------------------------

:33000	rts

*-----------------------------------
* 50134 - DRAW PICTURE RECTANGLE
*-----------------------------------

:50134	PushLong	#drawRECT
	_FrameRect
	rts

*-----------------------------------
* INTRODUCTION
*-----------------------------------

MAX_INDEX	=	6	; max message index
MAX_LOOP	=	3	; number of loops
INTRO_WW	=	36	; window width (40 - 2)
INTRO_WT	=	25	; window top line

*---

doINTRO	@MODE	#1
	@WINDOW	#0;#introWINDOW
	@PAPER	#0;#indexDARKGRAY
	@PEN	#0;#indexBLACK

	PushLong	#darkgrayPATTERN
	_SetPenPat

*--- Do the text output

	stz	introLOOP

doINTRO_1	lda	#1
]lp	sta	introINDEX

	jsr	introMESSAGE

	@INKEY_TRUE
	bcc	doINTRO_9
	
	inc	introINDEX	; next message
	lda	introINDEX
	cmp	#MAX_INDEX
	bcc	]lp

	inc	introLOOP	; next loop
	lda	introLOOP
	cmp	#MAX_LOOP
	bcc	doINTRO_1

	lda	#MAX_INDEX	; the last message
	jsr	introMESSAGE
	@INKEY
doINTRO_9	rts

*---

introMESSAGE	dec		; get pointer to string
	asl
	asl
	tax
	lda	introTBL,x
	sta	dpFROM
	lda	introTBL+2,x
	sta	dpFROM+2

	sep	#$20	; get length of string
	ldy	#0
]lp	lda	[dpFROM],y
	cmp	#eEOD
	beq	introMESSAGE_1
	iny
	bne	]lp
introMESSAGE_1	rep	#$20
	sty	introX

	lda	#40	; set X-coord ((40-len)/2)
	sec
	sbc	introX
	lsr
	sta	introX

*---

	@CLS	#0	; clear
	@LOCATE	#0;introX;#INTRO_WT
	
	ldy	#0	; output string
]lp	lda	[dpFROM],y
	and	#$ff
	cmp	#eEOD
	beq	introMESSAGE_3
	phy
	jsr	COUT_ALT
	ply
	iny
	bne	]lp

introMESSAGE_3	lda	#2	; attend deux secondes
	jmp	nowWAIT
	
*---

introX	ds	2	; X-coord
introLOOP	ds	2	; how many loops
introINDEX	ds	2	; from 1 to 6

introTBL	adrl	INTROFR1	; 0
	adrl	INTROFR2	; 1
	adrl	INTROFR3	; 2
	adrl	INTROFR4	; 3
	adrl	INTROFR5	; 4
	adrl	INTROFR6	; 5

introWINDOW	dw	2,38,INTRO_WT,INTRO_WT

*-----------------------------------
* CREDITS
*-----------------------------------

creWAIT1	=	1	; pour les credits
creWAIT2	=	1	; pour les credits
creWAIT_TXT	=	1	; pour les textes
creWAIT_WON	=	2	; pour le won
creY	=	23
creMIN	=	1
creMAX	=	36
creCHAR	=	165

*---

doCREDITS	jsr	loadCREDITS	; load and play the CREDITS music

	@WINDOW	#0;#creWINDOW0
	@PAPER	#0;#indexBLACK	; init screen
	@CLS	#0

	PushLong	#brownPATTERN	; for the scroll
	_SetPenPat
	PushLong	#creRECT
	_FrameRect

	@WINDOW	#2;#creWINDOW2
	@PAPER	#2;#indexBLACK
	@PEN	#2;#indexWHITE
	@CLS	#2

*--- Do the text output

	@LOCATE	#2;#creMIN;#creY

	lda	#CREDFR	; text source
	sta	dpFROM
	lda	#^CREDFR
	sta	dpFROM+2

*--- The main loop

credit_loop	@INKEY_TRUE		; check keypress
	bcc	credit_0

	lda	[dpFROM]	; read a character
	and	#$ff
	cmp	#eEOD
	bne	credit_1

credit_0	jmp	QUIT

credit_1	tax		; check chars

	ldy	#1
	lda	[dpFROM],y
	and	#$ff
	tay
	
	cpx	#'-'	; check standard text output
	bne	credit_2
	brl	credit_output	; yup, do it

credit_2	cpx	#'#'	; check # tags
	beq	credit_3
	brl	credit_text	; no tag, output text
	
credit_3	inc	dpFROM	; skip read character
	inc	dpFROM
	
	cpy	#'0'
	bne	credit_4

	lda	#chrRET
	jsr	COUT_ALT
	@WAIT	#creWAIT1	; wait 10/60 sec
	lda	#chrRET
	jsr	COUT_ALT
	@WAIT	#creWAIT1	; wait 10/60 sec
	bra	credit_next

credit_4	cpy	#'1'	; 1 for brown display
	bne	credit_5
	
	@PEN	#2;#indexBROWN
	bra	credit_next

credit_5	cpy	#'2'	; 2 for white display
	bne	credit_next
	
	@PEN	#2;#indexWHITE

credit_next	brl	credit_loop

*------------------------------ output centered text
* 1. get length
* 2. center
* 3. output

* Y= 0         1 
*    012345678901
* L= 1234567890
*    CONCEPTION#

credit_text	lda	#chrRET
	jsr	COUT_ALT
	
	ldy	#0	; length
]lp	lda	[dpFROM],y
	and	#$ff
	cmp	#'#'
	beq	credit_text_1
	iny
	bne	]lp

credit_text_1	phy
	lda	#creMAX
	sec
	sbc	1,s
	lsr
	sta	creLEFT	; when to start drawing chars
	ply

*--- Draw bullet only until creLEFT

	lda	#creMIN
	sta	creX
	
]lp	lda	#2
	ldx	creX
	ldy	#creY
	jsr	LOCATE
	lda	#chrSPC	; efface le caractère
	jsr	COUT_ALT
	lda	#creCHAR	; affiche le bullet (en attendant mieux)
	jsr	COUT_ALT
	@WAIT	#creWAIT1	; wait 10/60 sec

	inc	creX	; loop until 
	lda	creX
	cmp	creLEFT
	bcc	]lp
	beq	]lp

*--- Draw bullet and string

]lp	lda	#2
	ldx	creX
	ldy	#creY
	jsr	LOCATE
	lda	[dpFROM]
	and	#$ff
	cmp	#'#'
	beq	credit_text_2
	inc	dpFROM
	jsr	COUT_ALT
	lda	#creCHAR	; affiche le bullet (en attendant mieux)
	jsr	COUT_ALT
	@WAIT	#creWAIT2	; wait 10/60 sec

	inc	creX	; loop until 
	bne	]lp
	
*--- Draw bullet only until the right of the window

credit_text_2
]lp	lda	#2
	ldx	creX
	ldy	#creY
	jsr	LOCATE
	lda	#chrSPC	; efface le caractère
	jsr	COUT_ALT
	lda	#creCHAR	; affiche le bullet (en attendant mieux)
	jsr	COUT_ALT
	@WAIT	#creWAIT1	; wait 10/60 sec

	inc	creX	; loop until 
	lda	creX
	cmp	#creMAX
	bcc	]lp
	beq	]lp

*--- The end

	lda	#2	; efface le bullet
	ldx	creX
	ldy	#creY
	jsr	LOCATE
	lda	#chrSPC
	jsr	COUT_ALT

	brl	credit_loop

*------------------------------ output normal text

credit_output	inc	dpFROM

	@INKEY_TRUE
	bcc	credit_out_exit

	lda	[dpFROM]
	and	#$ff
	cmp	#'#'
	beq	credit_out_end

	jsr	COUT_ALT	; output char
	@WAIT	#creWAIT2	; wait 10/60 sec
	bra	credit_output	; loop
	
credit_out_end	brl	credit_loop
credit_out_exit	rts
	
*---

creWINDOW0	dw	1,40,1,25
creWINDOW2	dw	2,39,2,24
creRECT	dw	1,1,199,319
creLEFT	ds	2	; when to start drawing chars
creRIGHT	ds	2	; when to end drawing chars
creX	ds	2	; the x-coordinate

*-----------------------------------
* AFFICHE UNE IMAGE
*-----------------------------------

cadreX	=	40
cadreY	=	0

resMode	=	%0001_0000000000_10

*---

showPIC	sty	dpFROM
	stx	dpFROM+2

	lda	dpFROM+2	; check good file!
	bne	showPICLOOP
	rts

showPICLOOP	ldy	#1
	lda	[dpFROM],y
	and	#$ff
	tax
	lda	[dpFROM]
	and	#$ff

	cmp	#69	; E ($45) for END
	bne	showPIC100
	cpx	#0
	bne	showPIC_DRAW
	rts

showPIC100	cmp	#112	; P ($70) for PLOT
	bne	showPIC200
	cpx	#0
	bne	showPIC_DRAW
	bra	showPIC_PLOT

showPIC200	cmp	#102	; F ($66) for FILL
	bne	showPIC_DRAW
	cpx	#0
	bne	showPIC_DRAW
	bra	showPIC_FILL

showPIC_DRAW	clc		; LineTo
	adc	#cadreX
	pha

	txa
	pha
	_LineTo
	bra	skip2

showPIC_PLOT	ldy	#2
	lda	[dpFROM],y
	and	#$ff
	clc		; MoveTo
	adc	#cadreX
	pha

	ldy	#3
	lda	[dpFROM],y
	and	#$ff
	pha
	_MoveTo
	bra	skip4

showPIC_FILL	lda	fgFILL	; 0: on remplit
	bne	skip4	; 1: on saute

	ldy	#2
	lda	[dpFROM],y
	and	#$ff
	clc		; MoveTo
	adc	#cadreX
	sta	theX
	
	ldy	#3
	lda	[dpFROM],y
	and	#$ff
	sta	theY
	
	PushLong	#fillLocInfoPtr
	PushLong	#drawRECT
	PushLong	#fillLocInfoPtr
	PushLong	#drawRECT
	PushWord	theX
	PushWord	theY
	PushWord	#resMode
	PushLong	#0	; equals to black pattern
	PushLong	#leakTblPtr
	_SeedFill

*--- Next one, please...

skip4	inc	dpFROM
skip3	inc	dpFROM
skip2	inc	dpFROM
skip1	inc	dpFROM
	brl	showPICLOOP

*-----------------------------------
* DONNEES SOUS-MOTEUR ATHANOR
*-----------------------------------

*----------- Gfx

theX	ds	2
theY	ds	2

drawRECT	dw	0,40,135,280

fillLocInfoPtr	dw	mode320	; mode 320
	adrl	ptr012000
	dw	160
	dw	0,0,200,320

leakTblPtr	dw	1
	dw	$000F	; color 15 is concerned (white -> black)

*----------- Other

tblD2H	dfb	0,10,20,30,40,50,60,70,80,90

*-----------------------------------
* DONNEES DU JEU
*-----------------------------------

STRING_IN

MOT$	ds	MAXLEN2	; un mot d'une phrase
QFV$	ds	MAXLEN2	; une phrase
M$	ds	9+1	; len = 9
R$	ds	5+1	; len = 5
C$	ds	3+1	; len = 3

STRING_OUT

DATA_IN

fgFILL	ds	2	; 0: on remplit, 1: on ne remplit pas
A%	ds	2
C%	ds	2	; index in C$
CS%	ds	2
D%	ds	2	; next character
FT	ds	2	; TIME in 300th second
IMG%	ds	2	; image index
IS%	ds	2	; direction
J%	ds	2
K%	ds	2
LS%	ds	2
N%	ds	2
NST%	ds	2
NT%	ds	2
OB%	ds	2
P%	ds	2	; vocabulary sum
PA000%	ds	4	; pointer to image overlay
PIS$	ds	4	; pointer to image
PTXT%	ds	4	; pointer to text
R%	ds	2	; index in R$
RE%	ds	2
SY%	ds	2
TE%	ds	2	; true or false
TT%	ds	2
TV%	ds	2
VC%	ds	2
WAIT%	ds	2	; délai d'attente
X%	ds	2
Y%	ds	2

VC2%	ds	2
NST2%	ds	2

F%	ds	33
SAC%	ds	25	; index des objets
GS%	ds	90	; index des images
O%	ds	33
PP%	ds	8	; see p%(x)

DATA_OUT

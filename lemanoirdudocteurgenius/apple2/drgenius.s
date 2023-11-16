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

WNDLFT	=	$20	; left edge of text window 
WNDWDTH	=	$21	; width of text window 
WNDTOP	=	$22	; top of text window 
WNDBTM	=	$23	; bottom+1 of text window 
CH	=	$24	; cursor horizontal position 
CV	=	$25	; cursor vertical position 
LINNUM	=	$50	; result from GETADR
X0L	=	$e0	; X-coord
X0H	=	$e1
Y0	=	$e2	; Y-coord
HPAG	=	$e6

dpFROM	=	$fc
dpTO	=	$fe

KBD	=	$c000
CLR80COL	=	$c000
SET80COL	=	$c001
CLR80VID	=	$c00c
SET80VID	=	$c00d
KBDSTROBE	=	$c010
MONOCOLOR	=	$c021
NEWVIDEO	=	$c029
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
CLRAN	=	$c05d
SETAN3	=	$c05e
CLRAN3	=	$c05f

*--- The firmware routines

AUXMOVE	=	$C311
HGR	=	$F3E2	; HGR
HPLOT	=	$F457	; HPLOT
HILIN	=	$F53A	; HPLOT TO
HCOLOR	=	$F6E9	; HCOLOR= (call+3)
INIT	=	$FB2F
TABV	=	$FB5B
BS	=	$FC10
HOME	=	$FC58
CLREOL	=	$FC9C
WAIT	=	$FCA8
RDKEY	=	$FD0C
KEYIN	=	$FD1B
GETLNZ	=	$FD67
GETLN	=	$FD6A
CROUT	=	$FD8E
PRBYTE	=	$FDDA
COUT	=	$FDED
IDROUTINE	=	$FE1F
SETNORM	=	$FE84
SETKBD	=	$FE89
BEEP	=	$FF3A
MONZ	=	$FF69

*-----------------------------------
* MACROS
*-----------------------------------

@draw	mac
	ldx	#>]1
	ldy	#<]1
	jsr	drawPICTURE
	eom

@key$	mac
	jsr	KEY$
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

	sec		; 1 MHz vaincra!
	jsr	IDROUTINE
	bcs	notiigs

	lda	CYAREG
	and	#%0111_1111
	sta	CYAREG
notiigs
	jsr	introPIC	; la picture GR
	jsr	:51000	; le disclaimer
	jsr	:40000	; les instructions

REPLAY
	jsr	initALL

*-----------------------------------
* DU BASIC A L'ASSEMBLEUR (BEURK)
*-----------------------------------

:100	lda	SALLE
	cmp	#14
	beq	:101
	cmp	#16
	beq	:101
	cmp	#17
	beq	:101
	cmp	#19
	bne	:105

:101	lda	#0
	ldx	#2
	sta	P,x

:105	ldx	#2
	lda	P,x
	cmp	#2
	bne	:200

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

:200
	@print	#strVOUS	; always output "VOUS ETES "

	lda	SALLE
	sec
	sbc	#1
	asl
	tax
	jsr	(tbl7000,x)
	
	@key$
	
	lda	#0
	sta	H
	lda	#1
	sta	N
	
:310	ldx	N
	lda	O,x
	cmp	SALLE
	bne	:400
	
	lda	H
	cmp	#1
	beq	:350

	@print	#strILYA
	
	lda	#1
	sta	H

:350	@print	#strSPACE
	lda	N
	asl
	tax
	ldy	tblO$,x
	lda	tblO$+1,x
	tax
	jsr	printCSTRING
	@wait	#150
	
:400	lda	N
	clc
	adc	#1
	sta	N
	cmp	#O	; la constante 25
	bcc	:310
	beq	:310

	@print	#strRETURN

*-----------------------------------
* 500 - ACCEPTATION COMMANDE
*-----------------------------------

:500	lda	#1
	sta	T
	lda	#0
	sta	Y1
	sta	Y2
	sta	N
	jmp	:1000

:530

*---------

strILFAITNOIR
	asc	"IL FAIT NOIR COMME DANS UN FOUR, IL"8D
	asc	"FAUDRAIT PEUT-ETRE ALLUMER"00
		
strILYA	asc	"IL Y A DANS LA SALLE :"00
strSPACE	asc	" "00
strRETURN	asc	8D

*-----------------------------------
* 900 - CONTROLE MVT
*-----------------------------------

:900	lda	#1
	sta	Z

:1000

*-----------------------------------
* 4000 - LES REPONSES
*-----------------------------------

*---------

:4600
	@wait	#200	; et le texte
	@print	#strCODEEXACT
	@wait	#400
	jsr	:10000
	@print	#strENDEHORS
	jmp	:32000

strCODEEXACT
	asc	"LE CODE EST EXACT... LA PORTE S"A7"OUVRE..."00
strENDEHORS
	asc	"VOUS VOILA EN DEHORS DE LA MAISON..."

*---------

:4610
	@print	#str4610
	@wait	#400
	@print	#str4615
	@wait	#150
	rts

str4610	asc	"A L"A7"INTERIEUR DU PLACARD, IL Y A UN MOT"8D
	asc	"PARLE D"A7"UN TELEPORTEUR"00
str4615	asc	"TIENS LE PLACARD SE FERME TOUT SEUL..."00

*---------

:4620
	@print	#str4620
	@wait	#350
	rts
	
str4620	asc	"AVANT DE LA POSER A TERRE, IL FAUDRAIT"8D
	asc	"PEUT-ETRE L"A7"ENLEVER"00

*	asc	"1234567890123456789012345678901234567890"


*---------

:4630
	@print	#str4630
	@wait	#400
	rts
	
str4630	asc	"IL Y A UN HORRIBLE MONSTRE DEVANT VOUS"8D
	asc	"QUI EST SORTI DU PLACARD."00
	
*---------

:4640
	@print	#str4640
	@wait	#350
	rts

str4640	asc	"LE PLACARD ETAIT PIEGE, VOUS N"A7"AURIEZ"8D
	asc	"PAS DU L"A7"OUVRIR"00

*-----------------------------------
* 6000 - ANALYSE DU MOT
*-----------------------------------

:6000

*-----------------------------------
* 7000 - DESCRIPTION DES PIECES
*-----------------------------------

tbl7000
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
	jsr	:10100
	rts

:7020
	@print	#str7020
	jsr	:10200
	rts

:7030
	@print	#str7030
	lda	#0
	sta	F1
	jsr	:10300
	rts

:7040
	@print	#str7040
	lda	#1
	sta	F1
	jsr	:10300
	rts

:7050
	@print	#str7050
	jsr	:10500
	rts

:7060
	@print	#str7060
	jsr	:10600
	rts

:7070
	@print	#str7070
	lda	#0
	sta	LX
	jsr	:10700
	rts

:7080
	@print	#str7080
	jsr	:10800
	rts

:7090
	@print	#str7090
	lda	#0
	sta	LX
	jsr	:10900
	rts

:7100
	@print	#str7100
	lda	#0
	sta	LX
	jsr	:11000
	rts

:7110
	@print	#str7110
	lda	#2
	sta	LX
	jsr	:10700
	rts

:7120
	@print	#str7120
	lda	#1
	sta	LX
	jsr	:10700
	rts

:7130		; nada
	rts

:7140
	@print	#str7140
	lda	#2
	sta	LX
	jsr	:12200
	rts

:7150
	@print	#str7150
	@print	#str7001
	jsr	:11500
	rts

:7160
	@print	#str7160
	lda	#1
	sta	LX
	jsr	:10900
	rts

:7170
	@wait	#300
	@print	#str7170
	jsr	:11700
	rts

:7180
	@print	#str7180
	jsr	:11800
	rts

:7190
	@print	#str7190
	lda	#2
	sta	LX
	jsr	:10900
	rts

:7200
	@print	#str7200
	lda	#1
	sta	LX
	jsr	:12200
	rts

:7210
	@print	#str7210
	lda	#1
	sta	LX
	jsr	:11000
	rts

:7220
	@print	#str7220
	lda	#0
	sta	LX
	jsr	:12200
	rts

:7230
	@print	#str7230
	jsr	:12300
	rts

:7240
	@print	#str7240
	jsr	:12400
	rts

*----------

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

strVOUS	asc	8D"VOUS ETES "00
str7000	asc	"DEVANT LE MANOIR DU DEFUNT"00
str7001	asc	8D"            DR GENIUS"00
str7010	asc	"DANS LE HALL D"A7"ENTREE"00
str7020	asc	"EN BAS DE L"A7"ESCALIER MENANTAU 2EME ETAGE"00
str7030	asc	"DANS LA SALLE A MANGER"00
str7040	asc	"DANS UNE BIBLIOTHEQUE SANS LIVRE...!"00
str7050	asc	"DANS UNE BUANDERIE"00
str7060	asc	"DANS LE SALON"00
str7070	asc	"DANS UNE CHAMBRE"00
str7080	asc	"DANS UN CORRIDOR"00
str7090	asc	"DANS UNE SALLE D"A7"ATTENTE"00
str7100	asc	"DANS LE VESTIBULE"00
str7110	asc	"DANS LA CHAMBRE D"A7"AMIS"00
str7120	asc	"DANS UNE CHAMBRE"00
str7130	asc	""00	; nada
str7140	asc	"DANS UNE PETITE SALLE"00
str7150	asc	"DANS LE LABORATOIRE DU"00	; + :7001
str7160	asc	"DANS UNE PETITE PIECE VIDE"00
str7170	asc	"! JUSTEMENT, VOUS NE SAVEZ PASOU VOUS ETES"00
str7180	asc	"EN HAUT DE L"A7"ESCALIER"00
str7190	asc	"DANS LA SALLE DE BAINS"00
str7200	asc	"DANS LE LIVING ROOM"00
str7210	asc	"DANS UNE PIECE ENFUMEE"00
str7220	asc	"DANS UNE GRANDE PIECE"00
str7230	asc	"DANS UNE PIECE DE RANGEMENT"00
str7240	asc	"DANS LE DRESSING"00

*-----------------------------------
* 8000 - CHARGEMENT VARIABLES
*-----------------------------------

initALL
	lda	#1
	sta	SALLE
	
	ldx	#10
	lda	#0
]lp	sta	P,x
	sta	C,x
	dex
	bne	]lp
	
	lda	#0
	sta	P+11
	sta	P+12
	
	lda	#14
	sta	C+3
	lda	#12
	sta	C+7
	sta	C+9
	lda	#80
	sta	C+1
	
* PL=INT(RND(1)*9000+1000)

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
	jsr	setTEXTFULL

:20100
]lp	@print	#strREPLAY
	jsr	RDKEY
	cmp	#"N"
	beq	:20001
	cmp	#"O"
	bne	]lp
	jmp	REPLAY
:20001	jmp	MONZ

*---------

strREPLAY	asc	8D"VOULEZ-VOUS REJOUER ? "00
	
*-----------------------------------
* 32000 - GAGNE
*-----------------------------------

:32000
	jsr	setTEXTFULL
	@print	#strGAGNE
	@play	#zikGAGNE
	jmp	:20100

*---------

strGAGNE	asc	"CELA EST EXCEPTIONNEL. VOUS ETES LE"8D8D
	asc	"PREMIER A ETRE SORTI VIVANT DE CETTE"8D8D
	asc	"MAISON, MAIS SI J'ETAIS VOUS, JE ME"8D8D
	asc	"METTRAIS A COURIR CAR UN NAIN RODE"8D8D
	asc	"PEUT-ETRE DANS LES PARAGES..."00
	
*-----------------------------------
* 40000 - LISTE DES INSTRUCTIONS
*-----------------------------------

:40000
	jsr	setTEXTFULL
]lp	@print	#strINSTR
	jsr	RDKEY
	cmp	#"N"
	beq	:40001
	cmp	#"O"
	bne	]lp

	@print	#strINSTR2
	jsr	RDKEY
	
:40001	rts

*---------

strINSTR	asc	"LA LISTE DES INSTRUCTIONS ? "00

strINSTR2	asc	8D8D
	asc	"VOUS VOICI ARRIVE DANS LE MANOIR DU"8D
	asc	"            DR GENIUS..."8D
	asc	8D
	asc	"POUR CONVERSER AVEC L"A7"ORDINATEUR, IL"8D
	asc	"FAUT RENTRER LES ORDRES EN 1 OU 2 MOTS"8D
	asc	"TELS QUE :"8D
	asc	"           NORD"8D
	asc	"           PRENDS PILULE"8D
	asc	8D
	asc	"OU POUR COMMENCER :"8D
	asc	"           ENTRE"8D
	asc	8D8D
	asc	"SI VOUS VOULEZ FAIRE DURER LA PHRASE"8D
	asc	"DECRIVANT LA SALLE, TAPEZ UNE TOUCHE "8D
	asc	8D
	asc	"UN DERNIER CONSEIL : IL PEUT PARFOIS Y"8D
	asc	"AVOIR UNE PORTE DERRIERE VOUS. "00

*-----------------------------------
* 51000 - DISCLAIMER
*-----------------------------------

:51000
	jsr	setTEXTFULL
	@print	#strDISCLAIMER
	jmp	RDKEY

*---------

strDISCLAIMER
	asc	"L"A7"UTLISATION DE CE PROGRAMME EST"8D8D
	asc	"DECONSEILLEE AUX PERSONNES SENSIBLES,"8D8D
	asc	"AUX ENFANTS EN BAS AGE, AINSI QU"A7"A"8D8D
	asc	"TOUTE PERSONNE SUSCEPTIBLE D"A7"AVOIR"8D8D
	asc	"DES MALAISES CARDIAQUES."8D8D
	asc	8D8D
	asc	"NOUS NE POURRIONS ETRE TENUS RESPONSA-"8D8D
	asc	"-BLES DES TROUBLES PHYSIQUES OU MENTAUX"8D8D
	asc	"PROVOQUES PAR VOTRE ECHEC DANS"8D8D
	asc	"LE MANOIR DU DR GENIUS ............."00
	
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
	
*---------

strLORICIELS
	asc	"LORICIELS EST FIER DE PRESENTER :"00

strLEMANOIR
	asc	"   @   @@@   @   @ @@@ @  @ @@@ @ @@@"8D
	asc	"   @   @     @@ @@ @ @ @@ @ @ @ @ @ @"8D
	asc	"   @   @@    @ @ @ @@@ @@@@ @ @ @ @@@"8D
	asc	"   @   @     @   @ @ @ @ @@ @ @ @ @@"8D
	asc	"   @@@ @@@   @   @ @ @ @  @ @@@ @ @ @"8D
	asc	8D
	asc	"      @@  @ @     @@"8D
	asc	"      @ @ @ @     @ @ @"8D
	asc	"      @ @ @ @     @ @ @@"8D
	asc	"      @ @ @ @     @ @ @ @"8D
	asc	"      @@@ @@@     @@@ @"8D
	asc	8D8D
	asc	"   @@@@  @@@@  @@  @  @  @  @  @@@@"8D
	asc	"   @  @  @     @@  @  @  @  @  @"8D
	asc	"   @     @     @@@ @  @  @  @  @"8D
	asc	"   @     @@@   @ @ @  @  @  @  @@@@"8D
	asc	"   @ @@  @     @ @@@  @  @  @     @"8D
	asc	"   @  @  @     @  @@  @  @  @     @"8D
	asc	"   @@@@  @@@@  @  @@  @  @@@@  @@@@ @ @"00

strINTRO1	asc	"     VERSION APPLE II PAR     "00
strINTRO2	asc	"    BRUTAL DELUXE SOFTWARE    "00
strINTRO3	asc	"        MERCI FRED_72         "00
strINTRO4	asc	"(C) 1983, L. BENES & LORICIELS"00

*-----------------------------------
* KEY$ - WAIT FOR KEYPRESS
*-----------------------------------

KEY$	lda	KBD	; on keypress, wait 5s
	bpl	key$1	; or 1s IF none
	bit	KBDSTROBE
	
	@wait	#400

key$1	@wait	#100
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
* setMIXEDON
*----------------------

setMIXEDON		; HGR + 4 LINES OF TEXT
	sta	TXTCLR
	sta	MIXSET
	
	lda	#20	; et c'est fenêtré en plus !
	sta	WNDTOP
	lda	#24
	sta	WNDBTM
	jmp	HOME
	
*----------------------
* setMIXEDOFF
*----------------------

setMIXEDOFF		; TEXT ONLNY
	sta	TXTSET
	sta	MIXCLR
	rts

*----------------------
* printCSTR
*----------------------

printCSTRING
	sty	pcs1+1
	stx	pcs1+2
	
pcs1	lda	$ffff
	beq	pcs2
	jsr	COUT
	
	inc	pcs1+1
	bne	pcs1
	inc	pcs1+2
	bne	pcs1
	
pcs2	rts

*----------------------
* waitMS
*----------------------

waitMS
	sty	LINNUM
doW1	ldy	LINNUM
]lp	lda	#60	; 1/100ème de seconde
	jsr	WAIT
	dey
	bne	]lp
	dex
	bpl	doW1
	rts

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
	jsr	(myADRS,x)
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
	adc	theY
	sta	theY2+1	; new Y-coord

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
* Données du moteur
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

theX	dw	140	; milieu de l'écran par défaut
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
* VARIABLES
*-----------------------------------

tblV$
	da	V$1,V$2,V$3,V$4,V$5,V$6,V$7,V$8,V$9
	da	V$10,V$11,V$12,V$13,V$14,V$15,V$16,V$17,V$18,V$19
	da	V$20,V$21,V$22,V$23,V$24,V$25,V$26,V$27,V$28,V$29
	da	V$30,V$31,V$32,V$33,V$34,V$35,V$36,V$37,V$38,V$39
	da	V$40,V$41,V$42,V$43,V$44,V$45,V$46,V$47,V$48,V$49
	da	V$50,V$51,V$52,V$53,V$54,V$55,V$56,V$57,V$58,V$59
	da	V$60,V$61,V$62,V$63,V$64,V$65,V$66,V$67,V$68,V$69
	da	V$70
	
V$1	asc	"01N"00
V$2	asc	"01NORD"00
V$3	asc	"02S"00
V$4	asc	"02SUD"00
V$5	asc	"03E"00
V$6	asc	"03EST"00
V$7	asc	"04O"00
V$8	asc	"04OUEST"00
V$9	asc	"05MONT"00
V$10	asc	"05GRIM"00
V$11	asc	"06DESC"00
V$12	asc	"10PREN"00
V$13	asc	"10RAMA"00
V$14	asc	"11POSE"00
V$15	asc	"12OUVR"00
V$16	asc	"13FERM"00
V$17	asc	"14ENTR"00
V$18	asc	"14AVAN"00
V$19	asc	"15ALLU"00
V$20	asc	"16ETEI"00
V$21	asc	"17REPA"00
V$22	asc	"17DEPA"00
V$23	asc	"18LIS"00
V$24	asc	"19REGA"00
V$25	asc	"20RETO"00
V$26	asc	"21RENI"00
V$27	asc	"21SENS"00
V$28	asc	"22REMP"00
V$29	asc	"23VIDE"00
V$30	asc	"24INVE"00
V$31	asc	"24LIST"00
V$32	asc	"25RIEN"00
V$33	asc	"25ATTE"00
V$34	asc	"26POIG"00
V$35	asc	"27COUT"00
V$36	asc	"28TOUR"00
V$37	asc	"29LAMP"00
V$38	asc	"30CODE"00
V$39	asc	"31ESCA"00
V$40	asc	"32PIST"00
V$41	asc	"33PLAC"00
V$42	asc	"34TORC"00
V$43	asc	"35TELE"00
V$44	asc	"36MONS"00
V$45	asc	"37PETR"00
V$46	asc	"38POT"00
V$47	asc	"18LIT"00
V$48	asc	"39CLEF"00
V$49	asc	"40PAPI"00
V$50	asc	"41LIVR"00
V$51	asc	"42BRIQ"00
V$52	asc	"43COMB"00
V$53	asc	"44COFF"00
V$54	asc	"45ROUG"00
V$55	asc	"46BLEU"00
V$56	asc	"47VERT"00
V$57	asc	"48TITR"00
V$58	asc	"49ROBI"00
V$59	asc	"50CISE"00
V$60	asc	"51PORT"00
V$61	asc	"52ACTI"00
V$62	asc	"53JETE"00
V$63	asc	"53LANCE"00
V$64	asc	"54EAU"00
V$65	asc	"55ENFI"00
V$66	asc	"55PASS"00
V$67	asc	"56APPU"00
V$68	asc	"56ENFO"00
V$69	asc	"57ENLE"00
V$70	asc	"58RENT"00

*---

* O	=	25

O	dfb	06,05,05,08,08,00,00,11,11
	dfb	13,20,18,16,16,16,16,00,21
	dfb	00,22,25,12,00,25,00

*---

tblO$	da	O$1,O$2,O$3,O$4,O$5,O$6,O$7,O$8,O$9
	da	O$10,O$11,O$12,O$13,O$14,O$15,O$16,O$17,O$18,O$19
	da	O$20,O$21,O$22,O$23,O$24,O$25

O$1	asc	"UNE TORCHE ELECTRIQUE"00
O$2	asc	"UN ROBINET"00
O$3	asc	"UN CISEAU"00
O$4	asc	"UN TOURNEVIS"00
O$5	asc	"UNE LAMPE A PETROLE"00
O$6	asc	"UNE LAMPE PLEINE"00
O$7	asc	"UNE LAMPE ALLUME"00
O$8	asc	"UN COUTEAU"00
O$9	asc	"UN PAPIER"00
O$10	asc	"UN LIVRE"00
O$11	asc	"DU PETROLE DANS UN LAVABO BOUCHE"00
O$12	asc	"UNE CLEF"00
O$13	asc	"UN BOUTON ROUGE"00
O$14	asc	"UN BOUTON BLEU"00
O$15	asc	"UN BOUTON VERT"00
O$16	asc	"UN TELEPORTEUR"00
O$17	asc	"UN TELEPORTEUR REPARE"00
O$18	asc	"UNE COMBINAISON ARGENTEE"00
O$19	asc	"UNE COMBINAISON ENFILEE"00
O$20	asc	"UN MONSTRE ALL"A7"EST"00
O$21	asc	"UN PISTOLET"00
O$22	asc	"UN BRIQUET"00
O$23	asc	"UN BRIQUET ALLUME"00
O$24	asc	"UN POT"00
O$25	asc	"UN POT PLEIN D"A7"EAU"00

*---

* M	=	25

tblM$	da	M$1,M$2,M$3,M$4,M$5,M$6,M$7,M$8,M$9
	da	M$10,M$11,M$12,M$13,M$14,M$15,M$16,M$17,M$18,M$19
	da	M$20,M$21,M$22,M$23,M$24,M$25

M$1	asc	"00"00
M$2	asc	"0403030400"00
M$3	asc	"030200"00
M$4	asc	"04020305010600"00
M$5	asc	"04040107032000"00
M$6	asc	"020400"00
M$7	asc	"04080109020500"00
M$8	asc	"030700"00
M$9	asc	"04130207031000"00
M$10	asc	"0409021100"00
M$11	asc	"0110031200"00
M$12	asc	"041100"00
M$13	asc	"030900"00
M$14	asc	"0209031500"00
M$15	asc	"00"00
M$16	asc	"00"00
M$17	asc	"00"00
M$18	asc	"00"00
M$19	asc	"0122032100"00
M$20	asc	"040500"00
M$21	asc	"0125022200"00
M$22	asc	"012100"00
M$23	asc	"0124042200"00
M$24	asc	"022300"00
M$25	asc	"022100"00

*---

* A	=	128

A$
	asc	"1400A01.I02D02M."00
	asc	"0500A03D08.D03N."00
	asc	"0500A03E08E09D24.D04D05I19E02M."00
	asc	"0500A03E08D24.D04D06N."00
	asc	"0500A03E07.I19M."00
	asc	"0500A03E03.I19M."00
	asc	"0500A03.I19E02M."00
	asc	"0600A19D08.D03N."00
	asc	"0600A19E08E09D24.D04D05I03M."00
	asc	"0600A19E08D24.D04D06N."00
	asc	"0600A19.I03M."00
	asc	"0100A09E07B22.D07N."00
	asc	"0100A09E03B05.D07N."00
	asc	"0100A09.I14E02M."00
	asc	"0100A14.I16E02M."00
	asc	"0200A16E07B22.D07N."00
	asc	"0200A16E03B05.D07N."00
	asc	"0200A16.I14E02M."00
	asc	"0400A15E03B05.D07N."00
	asc	"0400A15E07B22.D07N."00
	asc	"0400A15.I14E02M."00
	asc	"0100A15E03.I17M."00
	asc	"0100A15E07.I17M."00
	asc	"0100A15.I17E02M."00
	asc	"0200A17.F01I15M."00
	asc	"0300A17.D08N."00
	asc	"0400A17.D09K."00
	asc	"0300A18.D10F03E01E02I17M."00
	asc	"0400A21E03.I19M."00
	asc	"0400A21E07.I19M."00
	asc	"0400A21.I19E02M."00
	asc	"0200A22E03.I19M."00
	asc	"0200A22E07.I19M."00
	asc	"0200A22.I19E02M."00
	asc	"0200A19.D11N."00
	asc	"0400A19.D11N."00
	asc	"0300A22.D12I23M."00
	asc	"2500A01.D13."00
	asc	"2500I01.D14K."00
	asc	"1244A03.D15M."00
	asc	"1034B01.B01J."00
	asc	"1027B08.B08J."00
	asc	"1028B04.B04J."00
	asc	"1029B05.B05J."00
	asc	"1032B21.B21J."00
	asc	"1038B24.B24J."00
	asc	"1039B12.B12J."00
	asc	"1040B09.B09J."00
	asc	"1041B10.B10J."00
	asc	"1043B18.B18J."00
	asc	"1050B03.B03J."00
	asc	"1042B22.B22J."00
	asc	"1037A20B05.H11P05E05D16K."00
	asc	"1037A20.D17K."00
	asc	"1134.C01J."00
	asc	"1127.C08J."00
	asc	"1128.C04J."00
	asc	"1129.C05J."00
	asc	"1132.C21J."00
	asc	"1138.C24J."00
	asc	"1143E09.D62K."00
	asc	"1139.C12J."00
	asc	"1140.C09J."00
	asc	"1141.C10J."00
	asc	"1143.C18J."00
	asc	"1150.C03J."00
	asc	"1142.C22J."00
	asc	"2400.A00L."00
	asc	"1249A05.E04D20G0405J."00
	asc	"1349A05.F04J."00
	asc	"2238A05E04.P24E08J."00
	asc	"2338A05E08.F08P24J."00
	asc	"2338E08.D21N."00
	asc	"1848B10.D22L."00
	asc	"1841B10.D23N."00
	asc	"1840B09.D24K."00
	asc	"2040B09.D25K."00
	asc	"1951A02.D26M."00
	asc	"1951.D27K."00
	asc	"2100A14.D28K."00
	asc	"2100.D29K."00
	asc	"1542C22.D33K."00
	asc	"1542E07.D30K."00
	asc	"1542A14.D07N."00
	asc	"1542A17E01.D10K."00
	asc	"1542E02.F02E07E06P22M."00
	asc	"1542.E07P22J."00
	asc	"1529C05.D33K."00
	asc	"1529E03.D30K."00
	asc	"1529F07.D31L."00
	asc	"1529F05.D32L."00
	asc	"1529E02.F02E03E06P06P05M."00
	asc	"1529.E03P06P05J."00
	asc	"1642C22.D33K."00
	asc	"1642F07.D30K."00
	asc	"1642E06E03.D36F07P22M."00
	asc	"1642E06.E02F07F06P22M."00
	asc	"1642.F07P22M."00
	asc	"1629C05.D33K."00
	asc	"1629F03.D30K."00
	asc	"1629E07E06.D34F03P05M."00
	asc	"1629E06.E02F06F03P05M."00
	asc	"1629.F03P05M."00
	asc	"1534B01.D35N."00
	asc	"1735I16.D45K."00
	asc	"1735E02.D43K."00
	asc	"1735F03.D44K."00
	asc	"1735C04.D46K."00
	asc	"1735.P16E10J."00
	asc	"5600A16F10.D47K."00
	asc	"5646A16.D48N."00
	asc	"5647A16.D48N."00
	asc	"5645A16F09.D50D06N."00
	asc	"5645A16.D49I18M."00
	asc	"5543D18E09.D30K."00
	asc	"5543D18.P18E09J."00
	asc	"574& E AND18F09.D30K."00
	asc	"5743D18.P18F09J."00
	asc	"1233A24C12.D51K."00
	asc	"1233A24C03.D52N."00
	asc	"1233A24.G0503E11D63K."00
	asc	"2636E11.D54F11D55K."00
	asc	"5350E11.D54F11D55K."00
	asc	"5232B21.D56N."00
	asc	"5830F08.D57."00
	asc	"5830.D58D59."00
	asc	"1233A06.D61M."00
	asc	"1233A25.D64N."00

*---

* C	=	14

tblC$	da	C$1,C$2,C$3,C$4,C$5,C$6,C$7,C$8,C$9
	da	C$10,C$11,C$12,C$13,C$14
	
C$1	asc	"G03E03.D00N."00
C$2	asc	"G04E04.D01N."00
C$3	asc	"I14I16I17I19.F02."00
C$4	asc	"G07E07.D18N."00
C$5	asc	"GO1.D19N."00
C$6	asc	"H06C03C08.D37N."00
C$7	asc	"H08D08.D39L."00
C$8	asc	"H06D03.D38L."00
C$9	asc	"G08E08B24.D40D21N."00
C$10	asc	"H02.D41N."00
C$11	asc	"G09E02.D42N."00
C$12	asc	"G05E11.D52N."00
C$13	asc	"I24E11.D53D52N."00
C$14	asc	".L."00

*-----------------------------------

BREAK	ds	2
C	ds	10+1
F1	ds	1
H	ds	1
LX	ds	1
N	ds	1
P	ds	13+1
SALLE	ds	1
T	ds	1
Y1	ds	1
Y2	ds	1
Z	ds	1

*-----------------------------------
* LES AUTRES FICHIERS
*-----------------------------------

	put	images.s
	put	musiques.s

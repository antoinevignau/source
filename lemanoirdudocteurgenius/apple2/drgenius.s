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

KBD	=	$c000
CLR80COL	=	$c000
SET80COL	=	$c001
CLR80VID	=	$c00c
SET80VID	=	$c00d
KBDSTROBE	=	$c010
MONOCOLOR	=	$c021
NEWVIDEO	=	$c029
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

*-----------------------------------
* MACROS
*-----------------------------------

@print	mac
	ldx	#>]1
	ldy	#<]1
	jsr	printCSTRING
	eom

@draw	mac
	ldx	#>]1
	ldy	#<]1
	jsr	drawPICTURE
	eom

@wait	mac
	ldx	#>]1
	ldy	#<]1
	jsr	waitMS
	eom

*-----------------------------------
* CODE BASIC EN ASM :-)
*-----------------------------------

	jsr	setTEXTFULL
	
	lda	#20
	jsr	TABV
	
	jsr	initALL

	jsr	sub200
	
	rts
	
*-----------------------------------
* 200 - description salle
*-----------------------------------

*-----------------------------------

sub200
	@print	#strSUBVOUS	; always output "VOUS ETES "

	lda	SALLE
	sec
	sbc	#1
	asl
	tax
	jsr	(tbl7000,x)
	
	jsr	sub13000	; check keypress
	
	lda	#0
	sta	H
	lda	#1
	sta	N
	
	ldx	N
	lda	tblO-1,x
	cmp	SALLE
	bne	:400
	
	lda	H
	cmp	#1
	beq	:350

	@print	#strILYADANS
	
	lda	#1
	sta	H

:350	

:400	rts

*----------

strILYADANS	asc	"IL Y A DANS LA SALLE : "00

*-----------------------------------
* 7000
*-----------------------------------

tbl7000
	da	sub7000
	da	sub7010
	da	sub7020
	da	sub7030
	da	sub7040
	da	sub7050
	da	sub7060
	da	sub7070
	da	sub7080
	da	sub7090
	da	sub7100
	da	sub7110
	da	sub7120
	da	sub7130
	da	sub7140
	da	sub7150
	da	sub7160
	da	sub7170
	da	sub7180
	da	sub7190
	da	sub7200
	da	sub7210
	da	sub7220
	da	sub7230
	da	sub7240

sub7000
	@print	#strSUB7000
	@wait	#250
	@print	#strSUB7001
	jsr	sub10000
	rts

sub7010
	@print	#strSUB7010
	jsr	sub10100
	rts

sub7020
	@print	#strSUB7020
	jsr	sub10200
	rts

sub7030
	@print	#strSUB7030
	lda	#0
	sta	F1
	jsr	sub10300
	rts

sub7040
	@print	#strSUB7040
	lda	#1
	sta	F1
	jsr	sub10300
	rts

sub7050
	@print	#strSUB7050
	jsr	sub10500
	rts

sub7060
	@print	#strSUB7060
	jsr	sub10600
	rts

sub7070
	@print	#strSUB7070
	lda	#0
	sta	LX
	jsr	sub10700
	rts

sub7080
	@print	#strSUB7080
	jsr	sub10800
	rts

sub7090
	@print	#strSUB7090
	lda	#0
	sta	LX
	jsr	sub10900
	rts

sub7100
	@print	#strSUB7100
	lda	#0
	sta	LX
	jsr	sub11000
	rts

sub7110
	@print	#strSUB7110
	lda	#2
	sta	LX
	jsr	sub10700
	rts

sub7120
	@print	#strSUB7120
	lda	#1
	sta	LX
	jsr	sub10700
	rts

sub7130		; nada
	rts

sub7140
	@print	#strSUB7140
	lda	#2
	sta	LX
	jsr	sub12200
	rts

sub7150
	@print	#strSUB7150
	@print	#strSUB7001
	jsr	sub11500
	rts

sub7160
	@print	#strSUB7160
	lda	#1
	sta	LX
	jsr	sub10900
	rts

sub7170
	@wait	#300
	@print	#strSUB7170
	jsr	sub11700
	rts

sub7180
	@print	#strSUB7180
	jsr	sub11800
	rts

sub7190
	@print	#strSUB7190
	lda	#2
	sta	LX
	jsr	sub10900
	rts

sub7200
	@print	#strSUB7200
	lda	#1
	sta	LX
	jsr	sub12200
	rts

sub7210
	@print	#strSUB7210
	lda	#1
	sta	LX
	jsr	sub11000
	rts

sub7220
	@print	#strSUB7220
	lda	#0
	sta	LX
	jsr	sub12200
	rts

sub7230
	@print	#strSUB7230
	jsr	sub12300
	rts

sub7240
	@print	#strSUB7240
	jsr	sub12400
	rts

*----------

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

strSUBVOUS	asc	8D"VOUS ETES "00
strSUB7000	asc	"DEVANT LE MANOIR DU DEFUNT"00
strSUB7001	asc	8D"            DR GENIUS"00
strSUB7010	asc	"DANS LE HALL D'A7'ENTREE"00
strSUB7020	asc	"EN BAS DE L'A7'ESCALIER MENANTAU 2EME ETAGE"00
strSUB7030	asc	"DANS LA SALLE A MANGER"00
strSUB7040	asc	"DANS UNE BIBLIOTHEQUE SANS LIVRE...!"00
strSUB7050	asc	"DANS UNE BUANDERIE"00
strSUB7060	asc	"DANS LE SALON"00
strSUB7070	asc	"DANS UNE CHAMBRE"00
strSUB7080	asc	"DANS UN CORRIDOR"00
strSUB7090	asc	"DANS UNE SALLE D'A7'ATTENTE"00
strSUB7100	asc	"DANS LE VESTIBULE"00
strSUB7110	asc	"DANS LA CHAMBRE D'A7'AMIS"00
strSUB7120	asc	"DANS UNE CHAMBRE"00
strSUB7130	asc	""00	; nada
strSUB7140	asc	"DANS UNE PETITE SALLE"00
strSUB7150	asc	"DANS LE LABORATOIRE DU"00	; + SUB7001
strSUB7160	asc	"DANS UNE PETITE PIECE VIDE"00
strSUB7170	asc	"! JUSTEMENT, VOUS NE SAVEZ PASOU VOUS ETES"00
strSUB7180	asc	"EN HAUT DE L'A7'ESCALIER"00
strSUB7190	asc	"DANS LA SALLE DE BAINS"00
strSUB7200	asc	"DANS LE LIVING ROOM"00
strSUB7210	asc	"DANS UNE PIECE ENFUMEE"00
strSUB7220	asc	"DANS UNE GRANDE PIECE"00
strSUB7230	asc	"DANS UNE PIECE DE RANGEMENT"00
strSUB7240	asc	"DANS LE DRESSING"00

*-----------------------------------
* 8000 - CHARGEMENT VARIABLES
*-----------------------------------

initALL
	lda	#1
	sta	SALLE
	
	ldx	#10
	txa
]lp	sta	P-1,x
	sta	C-1,x
	dex
	bne	]lp
	
	lda	#0
	sta	P-1+11
	sta	P-1+12
	
	lda	#14
	sta	C-1+3
	lda	#12
	sta	C-1+7
	sta	C-1+9
	lda	#80
	sta	C-1+1
	
* PL=INT(RND(1)*9000+1000)

	rts

*-----------------------------------
* 10000 - LES IMAGES
*-----------------------------------

sub10000
sub10100
sub10200
sub10300
sub10400
sub10500
sub10600
sub10700
sub10800
sub10900
sub11000
sub11100
sub11200
sub11300
sub11400
sub11500
sub11600
sub11700
sub11800
sub11900
sub12000
sub12100
sub12200
sub12300
sub12400
	rts

*-----------------------------------
* DONNEES DES IMAGES
*-----------------------------------

data10000
	asc	"S"
	dw	100,190
	asc	"D"
	dw	0,-60
	asc	"D"
	dw	97,0
	asc	"D"
	dw	7,10
	asc	"D"
	dw	-97,0
	asc	"D"
	dw	-7,-10
	asc	"D"
	dw	15,-20
	asc	"D"
	dw	-30,-50
	asc	"D"
	dw	-15,20
	asc	"D"
	dw	30,50
	asc	"S"
	dw	100,190
	asc	"D"
	dw	-30,-50
	asc	"D"
	dw	0,-60
	asc	"S"
	dw	100,190
	asc	"D"
	dw	22,0
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	15,0
	asc	"D"
	dw	0,30
	asc	"D"
	dw	60,0
	asc	"D"
	dw	0,-50
	asc	"M"
	dw	0,-10
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	-67,-40
	asc	"D"
	dw	-23,30
	asc	"D"
	dw	-30,-50
	asc	"D"
	dw	23,-30
	asc	"D"
	dw	30,50
	asc	"S"
	dw	197,100
	asc	"D"
	dw	-45,-60
	asc	"D"
	dw	-52,-30
	asc	"S"
	dw	85,60
	asc	"D"
	dw	0,-6
	asc	"S"
	dw	115,110
	asc	"D"
	dw	0,-30
	asc	"M"
	dw	7,0
	asc	"D"
	dw	7,-10
	asc	"D"
	dw	7,10
	asc	"D"
	dw	0,20
	asc	"D"
	dw	-15,0
	asc	"D"
	dw	0,-20
	asc	"M"
	dw	7,-10
	asc	"D"
	dw	0,30
	asc	"S"
	dw	182,100
	asc	"D"
	dw	-30,0
	asc	"D"
	dw	0,20
	asc	"D"
	dw	30,0
	asc	"D"
	dw	0,-20
	asc	"M"
	dw	-7,0
	asc	"D"
	dw	0,20
	asc	"M"
	dw	-16,0
	asc	"D"
	dw	0,-20
	asc	"S"
	dw	122,190
	asc	"D"
	dw	13,7
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	-13,-7
	asc	"S"
	dw	133,182
	asc	"S"
	dw	182,150
	asc	"D"
	dw	-30,0
	asc	"D"
	dw	0,20
	asc	"D"
	dw	30,0
	asc	"D"
	dw	0,-20
	asc	"M"
	dw	-7,0
	asc	"D"
	dw	0,20
	asc	"M"
	dw	-16,0
	asc	"D"
	dw	0,-20
	asc	"S"
	dw	78,130
	asc	"D"
	dw	15,25
	asc	"D"
	dw	0,-20
	asc	"D"
	dw	-15,-25
	asc	"D"
	dw	0,20
	asc	"M"
	dw	3,5
	asc	"D"
	dw	0,-20
	asc	"M"
	dw	9,15
	asc	"D"
	dw	0,20
	asc	"I"
	dfb	3
	asc	"I"
	dfb	3
	dfb	$ff

data10100
	asc	"S"
	dw	15,190
	asc	"D"
	dw	0,-160
	asc	"D"
	dw	75,-20
	asc	"D"
	dw	0,40
	asc	"D"
	dw	0,-40
	asc	"D"
	dw	60,0
	asc	"D"
	dw	0,20
	asc	"D"
	dw	10,10
	asc	"D"
	dw	-40,0
	asc	"D"
	dw	40,0
	asc	"D"
	dw	0,3
	asc	"D"
	dw	-40,0
	asc	"D"
	dw	0,-3
	asc	"D"
	dw	0,-10
	asc	"D"
	dw	30,0
	asc	"D"
	dw	0,-20
	asc	"D"
	dw	82,20
	asc	"D"
	dw	0,160
	asc	"D"
	dw	-73,-126
	asc	"D"
	dw	73,126
	asc	"D"
	dw	-30,-50
	asc	"D"
	dw	0,-80
	asc	"D"
	dw	-22,-16
	asc	"D"
	dw	0,58
	asc	"M"
	dw	19,-9
	asc	"C"
	dfb	1
	asc	"S"
	dw	15,190
	asc	"D"
	dw	37,-68
	asc	"D"
	dw	0,-70
	asc	"D"
	dw	18,-13
	asc	"D"
	dw	0,50
	asc	"D"
	dw	-18,33
	asc	"D"
	dw	38,-71
	asc	"D"
	dw	31,0
	asc	"D"
	dw	0,-8
	asc	"D"
	dw	0,23
	asc	"D"
	dw	3,0
	asc	"D"
	dw	0,-23
	asc	"D"
	dw	0,8
	asc	"D"
	dw	21,0
	asc	"D"
	dw	0,-8
	asc	"D"
	dw	0,8
	asc	"D"
	dw	1,2
	asc	"D"
	dw	0,-10
	asc	"D"
	dw	0,10
	asc	"D"
	dw	2,0
	asc	"D"
	dw	0,-10
	asc	"D"
	dw	0,8
	asc	"D"
	dw	2,0
	asc	"D"
	dw	0,-8
	asc	"D"
	dw	0,8
	asc	"D"
	dw	3,5
	asc	"D"
	dw	0,-12
	asc	"D"
	dw	0,20
	asc	"D"
	dw	2,3
	asc	"D"
	dw	0,-23
	asc	"D"
	dw	0,23
	asc	"D"
	dw	3,0
	asc	"D"
	dw	0,-23
	asc	"S"
	dw	67,68
	asc	"C"
	dfb	1
	asc	"I"
	dfb	3
	dfb	$ff

data10200
	asc	"S"
	dw	15,190
	asc	"D"
	dw	0,-120
	asc	"D"
	dw	105,-50
	asc	"D"
	dw	60,0
	asc	"D"
	dw	45,50
	asc	"D"
	dw	0,110
	asc	"D"
	dw	-45,-100
	asc	"M"
	dw	0,-60
	asc	"D"
	dw	0,60
	asc	"D"
	dw	-60,0
	asc	"M"
	dw	0,-60
	asc	"D"
	dw	0,60
	asc	"D"
	dw	-52,54
	asc	"S"
	dw	15,190
	asc	"D"
	dw	24,-26
	asc	"D"
	dw	0,-104
	asc	"D"
	dw	0,60
	asc	"D"
	dw	27,14
	asc	"D"
	dw	0,-10
	asc	"D"
	dw	53,-50
	asc	"D"
	dw	-6,-2
	asc	"D"
	dw	-54,47
	asc	"M"
	dw	7,3
	asc	"D"
	dw	-7,-3
	asc	"D"
	dw	0,-10
	asc	"D"
	dw	53,-44
	asc	"D"
	dw	0,8
	asc	"D"
	dw	0,-8
	asc	"D"
	dw	-5,-2
	asc	"D"
	dw	-56,40
	asc	"D"
	dw	9,4
	asc	"D"
	dw	-9,-4
	asc	"D"
	dw	0,-10
	asc	"D"
	dw	55,-36
	asc	"D"
	dw	0,7
	asc	"D"
	dw	0,-7
	asc	"D"
	dw	-5,-2
	asc	"D"
	dw	-56,33
	asc	"D"
	dw	7,3
	asc	"D"
	dw	-7,-3
	asc	"D"
	dw	0,-10
	asc	"D"
	dw	-5,-2
	asc	"D"
	dw	5,2
	asc	"D"
	dw	57,-30
	asc	"D"
	dw	0,8
	asc	"D"
	dw	0,-8
	asc	"D"
	dw	-5,-2
	asc	"D"
	dw	-57,25
	asc	"D"
	dw	57,-25
	asc	"D"
	dw	0,-7
	asc	"D"
	dw	-57,24
	asc	"D"
	dw	57,-24
	asc	"D"
	dw	-5,-2
	asc	"D"
	dw	-16,5
	asc	"D"
	dw	16,-5
	asc	"D"
	dw	0,-4
	asc	"S"
	dw	211,146
	asc	"D"
	dw	0,-64
	asc	"D"
	dw	-15,-20
	asc	"D"
	dw	0,52
	asc	"S"
	dw	207,108
	asc	"C"
	dfb	1
	asc	"S"
	dw	156,80
	asc	"D"
	dw	24,0
	asc	"D"
	dw	6,12
	asc	"D"
	dw	-6,-12
	asc	"D"
	dw	0,-40
	asc	"D"
	dw	-26,0
	asc	"D"
	dw	0,40
	asc	"D"
	dw	5,12
	asc	"D"
	dw	27,0
	asc	"D"
	dw	0,-42
	asc	"D"
	dw	-6,-10
	asc	"D"
	dw	6,10
	asc	"D"
	dw	-27,0
	asc	"D"
	dw	-4,-10
	asc	"D"
	dw	4,10
	asc	"D"
	dw	0,42
	asc	"S"
	dw	169,70
	asc	"C"
	dfb	4
	asc	"S"
	dw	169,66
	asc	"D"
	dw	0,-3
	asc	"S"
	dw	169,74
	asc	"D"
	dw	0,2
	asc	"S"
	dw	165,70
	asc	"D"
	dw	-2,0
	asc	"S"
	dw	173,70
	asc	"D"
	dw	2,0
	asc	"S"
	dw	165,58
	asc	"C"
	dfb	1
	asc	"S"
	dw	170,58
	asc	"C"
	dfb	1
	asc	"S"
	dw	175,58
	asc	"C"
	dfb	1
	asc	"I"
	dfb	3
	dfb	$ff
	
data10300
	asc	"S"
	dw	15,190
	asc	"D"
	dw	67,-110
	asc	"D"
	dw	68,0
	asc	"D"
	dw	82,110
	asc	"D"
	dw	0,-140
	asc	"D"
	dw	-82,-40
	asc	"D"
	dw	0,70,0
	asc	"D"
	dw	0,-70
	asc	"D"
	dw	-68,0
	asc	"D"
	dw	0,70,0
	asc	"D"
	dw	0,-70
	asc	"D"
	dw	-67,40
	asc	"D"
	dw	0,140
	asc	"S"
	dw	90,80
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	24,0
	asc	"D"
	dw	0,50
	asc	"D"
	dw	-24,0
	asc	"D"
	dw	18,10
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	-18,-10
	asc	"S"
	dw	105,64
	asc	"S"
	dw	210,160
	asc	"D"
	dw	0,-90
	asc	"D"
	dw	-23,-14
	asc	"D"
	dw	0,74
	asc	"S"
	dw	205,110
	asc	"S"
	dw	45,140
	asc	"D"
	dw	0,-74
	asc	"D"
	dw	18,-14
	asc	"D"
	dw	0,60
	asc	"S"
	dw	60,86
	dfb	$ff
data10301
*IF F1=0 THEN
 	asc	"I"
	dfb	3
	dfb	$ff

data10400
	asc	"S"
	dw	124,80
	asc	"D"
	dw	26,0
	asc	"D"
	dw	0,-70
	asc	"D"
	dw	0,70
	asc	"S"
	dw	149,80
	asc	"D"
	dw	12,14
	asc	"S"
	dw	150,80
	asc	"D"
	dw	10,14
	asc	"S"
	dw	168,18
	asc	"D"
	dw	0,86
	asc	"D"
	dw	-38,0
	asc	"D"
	dw	0,-86
	asc	"D"
	dw	38,0
	asc	"D"
	dw	-38,0
	asc	"D"
	dw	-6,-8
	asc	"D"
	dw	0,70
	asc	"D"
	dw	6,24
	asc	"S"
	dw	168,94
	asc	"D"
	dw	-38,0
	asc	"S"
	dw	168,94
	asc	"D"
	dw	-8,-10
	asc	"S"
	dw	168,84
	asc	"D"
	dw	-38,0
	asc	"S"
	dw	168,84
	asc	"D"
	dw	-8,-10
	asc	"S"
	dw	168,74
	asc	"D"
	dw	-38,0
	asc	"S"
	dw	168,74
	asc	"D"
	dw	-9,-10
	asc	"S"
	dw	168,64
	asc	"D"
	dw	-38,0
	asc	"S"
	dw	168,64
	asc	"D"
	dw	-9,-10
	asc	"S"
	dw	168,54
	asc	"D"
	dw	-38,0
	asc	"S"
	dw	168,54
	asc	"D"
	dw	-18,-18
	asc	"D"
	dw	-18,0
	asc	"D"
	dw	18,0
	asc	"D"
	dw	0,-16
	asc	"I"
	dfb	3
	dfb	$ff
	
data10500
	asc	"S"
	dw	13,180
	asc	"D"
	dw	0,-132
	asc	"D"
	dw	63,-28
	asc	"D"
	dw	83,0
	asc	"D"
	dw	67,30
	asc	"D"
	dw	0,130
	asc	"D"
	dw	-11,-14
	asc	"D"
	dw	-4,-4
	asc	"D"
	dw	-17,-25
	asc	"D"
	dw	-24,-36
	asc	"D"
	dw	-12,-20
	asc	"D"
	dw	0,-61
	asc	"D"
	dw	0,61
	asc	"D"
	dw	-83,0
	asc	"D"
	dw	0,-60
	asc	"D"
	dw	0,60
	asc	"D"
	dw	-63,100
	asc	"S"
	dw	22,90
	asc	"D"
	dw	19,0
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	-19,0
	asc	"D"
	dw	0,30
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	33,-20
	asc	"D"
	dw	13,0
	asc	"D"
	dw	0,20
	asc	"D"
	dw	-28,30
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	27,-20
	asc	"D"
	dw	-11,9
	asc	"D"
	dw	0,23
	asc	"S"
	dw	52,64
	asc	"S"
	dw	60,58
	asc	"S"
	dw	157,100
	asc	"D"
	dw	30,0
	asc	"D"
	dw	29,34
	asc	"D"
	dw	-40,0
	asc	"D"
	dw	0,2
	asc	"D"
	dw	40,0
	asc	"D"
	dw	0,-2
	asc	"D"
	dw	0,2
	asc	"D"
	dw	-2,0
	asc	"D"
	dw	0,34
	asc	"D"
	dw	-3,0
	asc	"D"
	dw	0,-34
	asc	"D"
	dw	-30,0
	asc	"D"
	dw	0,34
	asc	"D"
	dw	-3,0
	asc	"D"
	dw	0,-34
	asc	"D"
	dw	-2,0
	asc	"D"
	dw	-20,-34
	asc	"D"
	dw	0,-2
	asc	"D"
	dw	20,34
	asc	"S"
	dw	159,104
	asc	"D"
	dw	0,24
	asc	"D"
	dw	3,0
	asc	"D"
	dw	0,-18
	asc	"I"
	dfb	3
	dfb	$ff
	
data10600
	asc	"S"
	dw	15,190
	asc	"D"
	dw	0,-130
	asc	"D"
	dw	75,-50
	asc	"D"
	dw	52,0
	asc	"D"
	dw	90,50
	asc	"D"
	dw	0,130
	asc	"D"
	dw	-22,-32
	asc	"D"
	dw	0,-52
	asc	"D"
	dw	-3,-5
	asc	"D"
	dw	-42,-43
	asc	"D"
	dw	-6,0
	asc	"D"
	dw	-2,4
	asc	"D"
	dw	0,10
	asc	"D"
	dw	-12,0
	asc	"D"
	dw	5,0
	asc	"D"
	dw	-7,-10
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	0,50
	asc	"D"
	dw	-22,0
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	-15,0
	asc	"D"
	dw	13,3
	asc	"D"
	dw	0,30
	asc	"D"
	dw	-13,-3
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	0,30
	asc	"D"
	dw	-15,0
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	0,50
	asc	"D"
	dw	-23,40
	asc	"D"
	dw	-22,0
	asc	"D"
	dw	22,0
	asc	"D"
	dw	0,-52
	asc	"D"
	dw	-22,22
	asc	"D"
	dw	0,70
	asc	"D"
	dw	-30,50
	asc	"S"
	dw	116,49
	asc	"S"
	dw	210,158
	asc	"D"
	dw	-45,0
	asc	"D"
	dw	0,-18
	asc	"D"
	dw	0,18
	asc	"D"
	dw	-26,-60
	asc	"D"
	dw	0,-10
	asc	"D"
	dw	6,-16
	asc	"D"
	dw	12,0
	asc	"D"
	dw	4,4
	asc	"D"
	dw	-12,0
	asc	"D"
	dw	-4,-4
	asc	"D"
	dw	4,4
	asc	"D"
	dw	-6,14
	asc	"D"
	dw	10,-2
	asc	"D"
	dw	9,0
	asc	"D"
	dw	0,-11
	asc	"D"
	dw	0,11
	asc	"D"
	dw	19,25
	asc	"S"
	dw	165,140
	asc	"D"
	dw	10,-20
	asc	"D"
	dw	21,0
	asc	"D"
	dw	-5,-7
	asc	"D"
	dw	-21,0
	asc	"D"
	dw	5,7
	asc	"D"
	dw	-5,-7
	asc	"D"
	dw	-7,14
	asc	"D"
	dw	-20,-37
	asc	"S"
	dw	165,140
	asc	"D"
	dw	-26,-50
	asc	"S"
	dw	165,158
	asc	"D"
	dw	-26,-59
	asc	"D"
	dw	0,-1
	asc	"S"
	dw	196,120
	asc	"D"
	dw	0,-14
	asc	"D"
	dw	2,-5
	asc	"D"
	dw	9,0
	asc	"D"
	dw	-9,0
	asc	"D"
	dw	-39,-43
	asc	"I"
	dfb	3
	dfb	$ff
	
data10700
	asc	"S"
	dw	15,190
	asc	"D"
	dw	57,-106
	asc	"D"
	dw	-57,106
	asc	"D"
	dw	0,-150
	asc	"D"
	dw	67,-30
	asc	"D"
	dw	0,32
	asc	"D"
	dw	0,-32
	asc	"D"
	dw	75,0
	asc	"D"
	dw	0,50
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	75,30
	asc	"D"
	dw	0,150
	asc	"D"
	dw	-75,-130
	asc	"S"
	dw	202,138
	asc	"D"
	dw	0,-78
	asc	"D"
	dw	-22,-18
	asc	"D"
	dw	0,56
	asc	"S"
	dw	157,60
	asc	"D"
	dw	-9,0
	asc	"D"
	dw	2,3
	asc	"D"
	dw	-78,0
	asc	"D"
	dw	0,8
	asc	"D"
	dw	78,0
	asc	"D"
	dw	0,-8
	asc	"D"
	dw	0,20
	asc	"D"
	dw	-78,0
	asc	"D"
	dw	0,-38
	asc	"D"
	dw	10,-12
	asc	"S"
	dw	82,42
	asc	"D"
	dw	-10,13
	asc	"D"
	dw	6,1
	asc	"D"
	dw	9,-13
	asc	"D"
	dw	-4,-1
	asc	"D"
	dw	4,1
	asc	"D"
	dw	0,6
	asc	"D"
	dw	-9,13
	asc	"D"
	dw	0,1
	asc	"D"
	dw	0,-7
	asc	"D"
	dw	0,6
	asc	"D"
	dw	9,-13
	asc	"D"
	dw	55,0
	asc	"D"
	dw	8,15
	dfb	$ff
*IF LX=2 THEN GOTO 10745
data10701
	asc	"S"
	dw	197,93
	asc	"C"
	dfb	1
	dfb	$ff
*IF LX=0 THEN
data10702
	asc	"I"
	dfb	3
	dfb	$ff
*IF LX=1 THEN GOTO 10780
data10703
	asc	"S"
	dw	202,137
	asc	"D"
	dw	0,-77,0
	asc	"D"
	dw	-22,-18
	asc	"D"
	dw	0,55,0
	asc	"S"
	dw	30,162
	asc	"D"
	dw	26,-49
	asc	"D"
	dw	0,1,0
	asc	"D"
	dw	-26,49
	asc	"S"
	dw	30,162
	asc	"D"
	dw	0,-80
	asc	"D"
	dw	22,-22
	asc	"D"
	dw	0,9
	asc	"D"
	dw	0,-9
	asc	"D"
	dw	-22,22
	asc	"D"
	dw	27,-15
	asc	"D"
	dw	0,77
	asc	"D"
	dw	-25,18
	asc	"S"
	dw	51,111
	asc	"C"
	dfb	1
	asc	"I"
	dfb	3
	dfb	$ff
	asc	"S"
	dw	30,50
	asc	"D"
	dw	0,40
	asc	"D"
	dw	22,-24
	asc	"D"
	dw	0,-29
	asc	"D"
	dw	-22,14
	asc	"D"
	dw	12,-8
	asc	"D"
	dw	0,33
	asc	"I"
	dfb	3
	dfb	$ff

data10800
	asc	"S"
	dw	15,190
	asc	"D"
	dw	0,-140
	asc	"D"
	dw	82,-40
	asc	"D"
	dw	53,0
	asc	"D"
	dw	75,40
	asc	"D"
	dw	0,140
	asc	"D"
	dw	-30,-50
	asc	"D"
	dw	0,-80
	asc	"D"
	dw	-26,-22
	asc	"D"
	dw	0,60
	asc	"D"
	dw	26,0
	asc	"D"
	dw	-26,0
	asc	"D"
	dw	-19,-30
	asc	"D"
	dw	0,-58
	asc	"D"
	dw	0,58
	asc	"D"
	dw	-22,0
	asc	"D"
	dw	0,-40
	asc	"D"
	dw	-15,0
	asc	"D"
	dw	13,4
	asc	"D"
	dw	0,40
	asc	"D"
	dw	-13,-4
	asc	"D"
	dw	0,-40
	asc	"D"
	dw	0,40
	asc	"D"
	dw	-15,0
	asc	"D"
	dw	0,-58
	asc	"D"
	dw	0,58
	asc	"D"
	dw	-30,42
	asc	"D"
	dw	-22,0
	asc	"D"
	dw	22,0
	asc	"D"
	dw	0,-68
	asc	"D"
	dw	-22,16
	asc	"D"
	dw	0,86
	asc	"D"
	dw	-30,43
	asc	"S"
	dw	123,52
	asc	"I"
	dfb	3
	dfb	$ff
	
data10900
	asc	"S"
	dw	232,190
	asc	"D"
	dw	0,-150
	asc	"D"
	dw	-82,-30
	asc	"D"
	dw	0,50
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	-60,0
	asc	"D"
	dw	0,50
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	-75,30
	asc	"D"
	dw	0,150
	dfb	$ff
*IF LX=0 THEN
data10901
 	asc	"D"
	dw	75,-130
	asc	"D"
	dw	-23,40
	dfb	$ff
*GOTO10920
data10902
	asc	"D"
	dw	30,-52
	asc	"D"
	dw	-30,52
	asc	"D"
	dw	75,-130
	asc	"D"
	dw	-23,40
	asc	"D"
	dw	-22,0
	asc	"D"
	dw	22,0
	dfb	$ff
* 10920
data10903
	asc	"D"
	dw	0,-58
	asc	"D"
	dw	-22,16
	asc	"D"
	dw	0,80
	asc	"S"
	dw	90,60
	asc	"D"
	dw	60,0
	asc	"D"
	dw	82,130
	dfb	$ff
*IF LX=0 THEN
data10904
 	asc	"S"
	dw	63,78
	asc	"C"
	dfb	1
	asc	"I"
	dfb	3
	dfb	$ff
*IF LX=1 THEN
data10905
 	asc	"I"
	dfb	3
	dfb	$ff
data10906
	asc	"S"
	dw	210,100
	asc	"D"
	dw	-15,0
	asc	"D"
	dw	-3,-10
	asc	"D"
	dw	18,0
	asc	"D"
	dw	0,10
	asc	"D"
	dw	0,-10
	asc	"D"
	dw	-27,-25
	asc	"D"
	dw	0,5
	asc	"D"
	dw	20,20
	asc	"D"
	dw	-20,-20
	asc	"D"
	dw	-8,0
	asc	"D"
	dw	8,0
	asc	"D"
	dw	0,-5
	asc	"D"
	dw	-12,0
	asc	"D"
	dw	21,25
	asc	"D"
	dw	-21,-25
	asc	"D"
	dw	-1,0
	asc	"D"
	dw	2,8
	asc	"D"
	dw	21,26
	asc	"I"
	dfb	3
	dfb	$ff

data11000
	asc	"S"
	dw	15,190
	asc	"D"
	dw	0,-150
	asc	"D"
	dw	82,-30
	asc	"D"
	dw	0,40
	asc	"D"
	dw	0,-40
	asc	"D"
	dw	60,0
	asc	"D"
	dw	0,40
	asc	"D"
	dw	0,-40
	asc	"D"
	dw	75,30
	asc	"D"
	dw	0,150
	asc	"D"
	dw	-22,-42
	asc	"D"
	dw	0,-75
	asc	"D"
	dw	-23,-21
	asc	"D"
	dw	0,52
	asc	"D"
	dw	23,0
	asc	"D"
	dw	-23,0
	asc	"D"
	dw	-30,-54
	asc	"D"
	dw	-60,0
	asc	"D"
	dw	-82,140
	asc	"D"
	dw	82,-140
	asc	"D"
	dw	15,0
	asc	"D"
	dw	0,-24
	asc	"D"
	dw	12,0
	asc	"D"
	dw	0,24
	asc	"M"
	dw	-3,-12
	dfb	$ff
*IF LX=0 THEN
data11001
 	asc	"I"
	dfb	3
	dfb	$ff
*ELSE
data11002
	asc	"S"
	dw	187,104
	asc	"D"
	dw	22,0
	asc	"M"
	dw	-22,0
	asc	"D"
	dw	23,44
	asc	"M"
	dw	-5,-45
	asc	"C"
	dfb	1
	asc	"S"
	dw	30,50
	asc	"D"
	dw	0,40
	asc	"D"
	dw	37,-34
	asc	"D"
	dw	0,-25
	asc	"D"
	dw	-37,20
	asc	"D"
	dw	21,-10
	asc	"D"
	dw	0,31
	asc	"I"
	dfb	3
	dfb	$ff
	
data11500
	asc	"S"
	dw	15,180
	asc	"D"
	dw	0,-140
	asc	"D"
	dw	67,-30
	asc	"D"
	dw	75,0
	asc	"D"
	dw	67,30
	asc	"D"
	dw	0,150
	asc	"D"
	dw	-42,-70
	asc	"D"
	dw	0,-70
	asc	"D"
	dw	-24,-20
	asc	"D"
	dw	0,-20
	asc	"D"
	dw	0,20
	asc	"D"
	dw	-45,0
	asc	"D"
	dw	-15,20
	asc	"D"
	dw	85,0
	asc	"D"
	dw	-33,0
	asc	"D"
	dw	0,70
	asc	"D"
	dw	33,0
	asc	"D"
	dw	-34,0
	asc	"D"
	dw	-14,-40
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	0,30
	asc	"D"
	dw	-22,0
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	0,30
	asc	"D"
	dw	-15,40
	asc	"D"
	dw	0,-70
	asc	"D"
	dw	0,30
	asc	"D"
	dw	-15,0
	asc	"D"
	dw	0,-70
	asc	"D"
	dw	0,70
	asc	"D"
	dw	-67,100
	asc	"S"
	dw	167,60
	asc	"C"
	dfb	1
	asc	"M"
	dw	0,10
	asc	"C"
	dfb	1
	asc	"M"
	dw	0,10
	asc	"C"
	dfb	1
	asc	"M"
	dw	0,20
	asc	"D"
	dw	6,2
	asc	"D"
	dw	-6,-2
	asc	"C"
	dfb	8
	asc	"I"
	dfb	3
	dfb	$ff
	
data11700
	asc	"S"
	dw	15,190
	asc	"D"
	dw	0,-140
	asc	"D"
	dw	60,-40
	asc	"D"
	dw	75,00
	asc	"D"
	dw	82,40
	asc	"D"
	dw	0,140
	asc	"D"
	dw	-45,-72
	asc	"D"
	dw	0,-54
	asc	"D"
	dw	-15,-14
	asc	"D"
	dw	0,44
	asc	"S"
	dw	232,190
	asc	"D"
	dw	-82,-130
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	0,50
	asc	"D"
	dw	-75,0
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	0,50
	asc	"D"
	dw	-4,10
	asc	"D"
	dw	9,0
	asc	"D"
	dw	-23,0
	asc	"D"
	dw	-34,50
	asc	"D"
	dw	39,0
	asc	"D"
	dw	18,-50
	asc	"D"
	dw	0,4
	asc	"D"
	dw	-18,52
	asc	"D"
	dw	0,-6
	asc	"D"
	dw	0,6
	asc	"D"
	dw	-39,0
	asc	"D"
	dw	0,-6
	asc	"S"
	dw	15,190
	asc	"D"
	dw	15,-33
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	4,0
	asc	"D"
	dw	0,37
	asc	"D"
	dw	-4,0
	asc	"D"
	dw	0,-7
	asc	"D"
	dw	0,7
	asc	"D"
	dw	4,0
	asc	"D"
	dw	3,-8
	asc	"D"
	dw	0,-29
	asc	"D"
	dw	15,0
	asc	"D"
	dw	0,37
	asc	"D"
	dw	4,0
	asc	"D"
	dw	0,-37
	asc	"D"
	dw	0,37
	asc	"D"
	dw	3,-8
	asc	"D"
	dw	0,-29
	asc	"D"
	dw	-14,0
	asc	"D"
	dw	-7,16
	asc	"S"
	dw	74,93
	asc	"D"
	dw	0,12
	asc	"D"
	dw	3,0
	asc	"D"
	dw	0,-19
	asc	"D"
	dw	0,19
	asc	"D"
	dw	2,-7
	asc	"D"
	dw	0,-18
	asc	"S"
	dw	184,86
	asc	"I"
	dfb	3
	dfb	$ff
	
data11800
	asc	"S"
	dw	15,191
	asc	"D"
	dw	0,-160
	asc	"D"
	dw	75,-30
	asc	"D"
	dw	52,0
	asc	"D"
	dw	90,30
	asc	"D"
	dw	0,160
	asc	"S"
	dw	15,191
	asc	"D"
	dw	75,-140
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	0,50
	asc	"D"
	dw	15,0
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	12,4
	asc	"D"
	dw	0,30
	asc	"D"
	dw	-12,-4
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	15,0
	asc	"D"
	dw	0,30
	asc	"D"
	dw	22,0
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	0,50
	asc	"D"
	dw	36,55
	asc	"D"
	dw	21,0
	asc	"D"
	dw	-21,0
	asc	"D"
	dw	0,-60
	asc	"D"
	dw	21,15
	asc	"D"
	dw	0,74
	asc	"D"
	dw	6,8
	asc	"D"
	dw	-106,0
	asc	"D"
	dw	-15,46
	asc	"D"
	dw	15,-46
	asc	"D"
	dw	0,10
	asc	"D"
	dw	106,0
	asc	"D"
	dw	0,-10
	asc	"D"
	dw	0,10
	asc	"D"
	dw	4,5
	asc	"D"
	dw	-112,0
	asc	"D"
	dw	2,-5
	asc	"D"
	dw	-2,5
	asc	"D"
	dw	0,10
	asc	"D"
	dw	112,0
	asc	"D"
	dw	0,-10
	asc	"D"
	dw	0,10
	asc	"D"
	dw	4,6
	asc	"D"
	dw	-119,0
	asc	"D"
	dw	3,-6
	asc	"D"
	dw	-3,6
	asc	"D"
	dw	0,10
	asc	"D"
	dw	119,0
	asc	"D"
	dw	0,-10
	asc	"D"
	dw	0,10
	asc	"D"
	dw	4,6
	asc	"D"
	dw	-126,0
	asc	"D"
	dw	3,-6
	asc	"S"
	dw	115,49
	asc	"I"
	dfb	3
	dfb	$ff
	
data12200
	asc	"S"
	dw	15,190
	asc	"D"
	dw	0,-150
	asc	"D"
	dw	75,-30
	asc	"D"
	dw	0,50
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	60,0
	asc	"D"
	dw	0,50
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	82,30
	asc	"D"
	dw	0,150
	asc	"D"
	dw	-82,-130
	asc	"D"
	dw	-45,0
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	15,0
	asc	"D"
	dw	0,30
	asc	"D"
	dw	-30,0
	asc	"D"
	dw	-30,53
	dfb	$ff
*IF LX=2 THEN
data12201
 	asc	"D"
	dw	-23,0
	asc	"D"
	dw	23,0
	asc	"D"
	dw	0,-60
	asc	"D"
	dw	-23,17
	asc	"D"
	dw	0,80
	dfb	$ff
*IF LX<>2 THEN
data12202
	asc	"D"
	dw	23,-37
	asc	"D"
	dw	-23,37
	dfb	$ff
* 12230
data12203
	asc	"D"
	dw	-22,40
	dfb	$ff
*IF LX<>2 THEN
data12204
 	asc	"S"
	dw	57,88
	asc	"C"
	dfb	1
	dfb	$ff
*IF LX<>0 THEN
data12205
 	asc	"S"
	dw	117,45
	asc	"C"
	dfb	1
	asc	"I"
	dfb	3
	dfb	$ff
	
data12240
	asc	"S"
	dw	105,60
	asc	"D"
	dw	15,0
	asc	"M"
	dw	-15,0
	asc	"D"
	dw	0,-30
	asc	"D"
	dw	12,3
	asc	"D"
	dw	0,30
	asc	"D"
	dw	-12,-4
	asc	"S"
	dw	115,48
	asc	"I"
	dfb	3
	dfb	$ff

data12300
	asc	"S"
	dw	15,190
	asc	"D"
	dw	0,-150
	asc	"D"
	dw	67,-30
	asc	"D"
	dw	67,0
	asc	"D"
	dw	82,30
	asc	"D"
	dw	0,150
	asc	"D"
	dw	-65,-104
	asc	"D"
	dw	0,-54
	asc	"D"
	dw	-16,-10
	asc	"D"
	dw	0,-10
	asc	"D"
	dw	0,10
	asc	"D"
	dw	-37,0
	asc	"D"
	dw	-3,10
	asc	"D"
	dw	0,54
	asc	"D"
	dw	56,0
	asc	"D"
	dw	0,-54
	asc	"D"
	dw	-28,0
	asc	"D"
	dw	0,54
	asc	"D"
	dw	0,-54
	asc	"D"
	dw	-28,0
	asc	"D"
	dw	0,30
	asc	"D"
	dw	-27,0
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	0,50
	asc	"D"
	dw	-67,130
	asc	"S"
	dw	133,60
	asc	"C"
	dfb	1
	asc	"M"
	dw	11,0
	asc	"C"
	dfb	1
	asc	"I"
	dfb	3
	dfb	$ff
	
data12400
	asc	"S"
	dw	30,164
	asc	"D"
	dw	-15,26
	asc	"D"
	dw	0,-143
	asc	"D"
	dw	15,-7
	asc	"D"
	dw	0,124
	asc	"D"
	dw	15,0
	asc	"D"
	dw	0,-124
	asc	"D"
	dw	-15,0
	asc	"D"
	dw	15,0
	asc	"D"
	dw	45,-30
	asc	"D"
	dw	 0,13
	asc	"D"
	dw	0,-13
	asc	"D"
	dw	60,0
	asc	"D"
	dw	0,50
	asc	"D"
	dw	0,-50
	asc	"D"
	dw	82,30
	asc	"D"
	dw	0,150
	asc	"D"
	dw	-82,-130
	asc	"D"
	dw	-50,0
	asc	"D"
	dw	-32,104
	asc	"D"
	dw	-22,0
	asc	"D"
	dw	22,0
	asc	"D"
	dw	0,-92
	asc	"D"
	dw	-22,0
	asc	"D"
	dw	44,-48
	asc	"D"
	dw	10,0
	asc	"D"
	dw	-32,48
	asc	"D"
	dw	32,-48
	asc	"D"
	dw	0,35
	asc	"D"
	dw	-14,46
	asc	"D"
	dw	0,-61
	asc	"S"
	dw	81,88
	asc	"C"
	dfb	1
	asc	"M"
	dw	11,-21
	asc	"C"
	dfb	1
	asc	"I"
	dfb	3
	dfb	$ff
	
*-----------------------------------
* 13000 - WAIT FOR KEYPRESS
*-----------------------------------

sub13000	lda	KBD	; on keypress, wait 5s
	bpl	sub13001	; or 1s IF none
	bit	KBDSTROBE
	
	@wait	#400

sub13001	@wait	#100
	rts

*-----------------------------------
* 30000 - SARABANDE
*-----------------------------------

sub30000
	rts
	
*-----------------------------------
* 31000 - BADINERIE
*-----------------------------------

sub31000
	rts
	
*-----------------------------------
* 32000 - TEA FOR TWO
*-----------------------------------

sub32000
	rts
	
*-----------------------------------
* 33000 - GAGNE
*-----------------------------------

sub33000
	jsr	setTEXTFULL
	rts
	
*-----------------------------------
* CODE 6502
*-----------------------------------

*----------------------
* setTEXTFULL
*----------------------

setTEXTFULL			; 40x24 text
	sta	CLR80VID
	jsr	INIT	; text screen
	jsr	SETNORM	; set normal text mode
	jsr	SETKBD	; reset input to keyboard
	jmp	HOME	; home cursor and clear to end of page

*----------------------
* setHGR1
*----------------------

setHGR1			; HGR1
	sta	TXTCLR
	sta	MIXCLR
	sta	TXTPAGE1
	sta	HIRES	
	rts		; 

*----------------------
* setMIXEDON
*----------------------

setMIXEDON			; HGR + 4 LINES OF TEXT
	sta	TXTCLR
	sta	MIXSET
	rts
	
*----------------------
* setMIXEDOFF
*----------------------

setMIXEDOFF			; TEXT ONLNY
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

	rts

*-----------------------------------
* VARIABLES
*-----------------------------------

tblV$
	asc	"01N"00
	asc	"01NORD"00
	asc	"02S"00
	asc	"02SUD"00
	asc	"03E"00
	asc	"03EST"00
	asc	"04O"00
	asc	"04OUEST"00
	asc	"05MONT"00
	asc	"05GRIM"00
	asc	"06DESC"00
	asc	"10PREN"00
	asc	"10RAMA"00
	asc	"11POSE"00
	asc	"12OUVR"00
	asc	"13FERM"00
	asc	"14ENTR"00
	asc	"14AVAN"00
	asc	"15ALLU"00
	asc	"16ETEI"00
	asc	"17REPA"00
	asc	"17DEPA"00
	asc	"18LIS"00
	asc	"19REGA"00
	asc	"20RETO"00
	asc	"21RENI"00
	asc	"21SENS"00
	asc	"22REMP"00
	asc	"23VIDE"00
	asc	"24INVE"00
	asc	"24LIST"00
	asc	"25RIEN"00
	asc	"25ATTE"00
	asc	"26POIG"00
	asc	"27COUT"00
	asc	"28TOUR"00
	asc	"29LAMP"00
	asc	"30CODE"00
	asc	"31ESCA"00
	asc	"32PIST"00
	asc	"33PLAC"00
	asc	"34TORC"00
	asc	"35TELE"00
	asc	"36MONS"00
	asc	"37PETR"00
	asc	"38POT"00
	asc	"18LIT"00
	asc	"39CLEF"00
	asc	"40PAPI"00
	asc	"41LIVR"00
	asc	"42BRIQ"00
	asc	"43COMB"00
	asc	"44COFF"00
	asc	"45ROUG"00
	asc	"46BLEU"00
	asc	"47VERT"00
	asc	"48TITR"00
	asc	"49ROBI"00
	asc	"50CISE"00
	asc	"51PORT"00
	asc	"52ACTI"00
	asc	"53JETE"00
	asc	"53LANCE"00
	asc	"54EAU"00
	asc	"55ENFI"00
	asc	"55PASS"00
	asc	"56APPU"00
	asc	"56ENFO"00
	asc	"57ENLE"00
	asc	"58RENT"00

*---

* O	=	25

tblO	dfb	06,05,05,08,08,00,00,11,11
	dfb	13,20,18,16,16,16,16,00,21
	dfb	00,22,25,12,00,25,00

*---

tblO$
	asc	"UNE TORCHE ELECTRIQUE"00
	asc	"UN ROBINET"00
	asc	"UN CISEAU"00
	asc	"UN TOURNEVIS"00
	asc	"UNE LAMPE A PETROLE"00
	asc	"UNE LAMPE PLEINE"00
	asc	"UNE LAMPE ALLUME"00
	asc	"UN COUTEAU"00
	asc	"UN PAPIER"00
	asc	"UN LIVRE"00
	asc	"DU PETROLE DANS UN LAVABO BOUCHE"00
	asc	"UNE CLEF"00
	asc	"UN BOUTON ROUGE"00
	asc	"UN BOUTON BLEU"00
	asc	"UN BOUTON VERT"00
	asc	"UN TELEPORTEUR"00
	asc	"UN TELEPORTEUR REPARE"00
	asc	"UNE COMBINAISON ARGENTEE"00
	asc	"UNE COMBINAISON ENFILEE"00
	asc	"UN MONSTRE ALL'A7'EST"00
	asc	"UN PISTOLET"00
	asc	"UN BRIQUET"00
	asc	"UN BRIQUET ALLUME"00
	asc	"UN POT"00
	asc	"UN POT PLEIN D'A7'EAU"00

*---

* M	=	25

tblM$
	asc	"00"00
	asc	"0403030400"00
	asc	"030200"00
	asc	"04020305010600"00
	asc	"04040107032000"00
	asc	"020400"00
	asc	"04080109020500"00
	asc	"030700"00
	asc	"04130207031000"00
	asc	"0409021100"00
	asc	"0110031200"00
	asc	"041100"00
	asc	"030900"00
	asc	"0209031500"00
	asc	"00"00
	asc	"00"00
	asc	"00"00
	asc	"00"00
	asc	"0122032100"00
	asc	"040500"00
	asc	"0125022200"00
	asc	"012100"00
	asc	"0124042200"00
	asc	"022300"00
	asc	"022100"00

*---

* A	=	128

tblA$
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

tblC$
	asc	"G03E03.D00N."00
	asc	"G04E04.D01N."00
	asc	"I14I16I17I19.F02."00
	asc	"G07E07.D18N."00
	asc	"GO1.D19N."00
	asc	"H06C03C08.D37N."00
	asc	"H08D08.D39L."00
	asc	"H06D03.D38L."00
	asc	"G08E08B24.D40D21N."00
	asc	"H02.D41N."00
	asc	"G09E02.D42N."00
	asc	"G05E11.D52N."00
	asc	"I24E11.D53D52N."00
	asc	".L."00

*-----------------------------------

C	ds	10
F1	ds	1
H	ds	1
LX	ds	1
N	ds	1
P	ds	13
SALLE	ds	1


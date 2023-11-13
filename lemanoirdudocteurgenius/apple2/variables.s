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

@wait	mac
	ldx	#>]1
	ldy	#<]1
	jsr	waitMS
	eom

*-----------------------------------
* CODE BASIC EN ASM :-)
*-----------------------------------
	
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
	jsr	sub10000
	@print	#strSUB7000
	@wait	#250
	@print	#strSUB7001
	rts

sub7010
	jsr	sub10100
	@print	#strSUB7010
	rts

sub7020
	jsr	sub10200
	@print	#strSUB7020
	rts

sub7030
	lda	#0
	sta	F1
	jsr	sub10300
	@print	#strSUB7030
	rts

sub7040
	lda	#1
	sta	F1
	jsr	sub10300
	@print	#strSUB7040
	rts

sub7050
	jsr	sub10500
	@print	#strSUB7050
	rts

sub7060
	jsr	sub10600
	@print	#strSUB7060
	rts

sub7070
	lda	#0
	sta	LX
	jsr	sub10700
	@print	#strSUB7070
	rts

sub7080
	jsr	sub10800
	@print	#strSUB7080
	rts

sub7090
	lda	#0
	sta	LX
	jsr	sub10900
	@print	#strSUB7090
	rts

sub7100
	lda	#0
	sta	LX
	jsr	sub11000
	@print	#strSUB7100
	rts

sub7110
	lda	#2
	sta	LX
	jsr	sub10700
	@print	#strSUB7110
	rts

sub7120
	lda	#1
	sta	LX
	jsr	sub10700
	@print	#strSUB7120
	rts

sub7130		; nada
	rts

sub7140
	lda	#2
	sta	LX
	jsr	sub12200
	@print	#strSUB7140
	rts

sub7150
	jsr	sub11500
	@print	#strSUB7150
	rts

sub7160
	lda	#1
	sta	LX
	jsr	sub10900
	@print	#strSUB7160
	rts

sub7170
	@wait	#300
	jsr	sub11700
	@print	#strSUB7170
	rts

sub7180
	jsr	sub11800
	@print	#strSUB7180
	rts

sub7190
	lda	#2
	sta	LX
	jsr	sub10900
	@print	#strSUB7190
	rts

sub7200
	lda	#1
	sta	LX
	jsr	sub12200
	@print	#strSUB7200
	rts

sub7210
	lda	#1
	sta	LX
	jsr	sub11000
	@print	#strSUB7210
	rts

sub7220
	lda	#0
	sta	LX
	jsr	sub12200
	@print	#strSUB7220
	rts

sub7230
	jsr	sub12300
	@print	#strSUB7230
	rts

sub7240
	jsr	sub12400
	@print	#strSUB7240
	rts

*----------

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

strSUBVOUS	asc	"VOUS ETES "00
strSUB7000	asc	"DEVANT LE MANOIR DU DEFUNT"00
strSUB7001	asc	"            DR GENIUS"00
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

sub8000
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
* 13000 - WAIT FOR KEYPRESS
*-----------------------------------

sub13000	lda	KBD	; on keypress, wait 5s
	bpl	sub13001	; or 1s if none
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

setTEXTFULL			; 40x24 text
	sta	CLR80VID
	jsr	INIT	; text screen
	jsr	SETNORM	; set normal text mode
	jsr	SETKBD	; reset input to keyboard
	jmp	HOME	; home cursor and clear to end of page

setHGR1			; HGR1
	sta	TXTCLR
	sta	MIXCLR
	sta	TXTPAGE1
	sta	HIRES	
	rts		; 

setMIXEDON			; HGR + 4 LINES OF TEXT
	sta	TXTCLR
	sta	MIXSET
	rts
	
setMIXEDOFF			; TEXT ONLNY
	sta	TXTSET
	sta	MIXCLR
	rts

printCSTRING
	rts

waitMS
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


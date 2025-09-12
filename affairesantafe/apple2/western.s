*
* L'affaire Santa Fe
*
* (c) Gilles Blancon
* (c) 1988, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* LES POINTS D'ENTREE
*
* 1070 DEBUT - On recommence
* 3010 IMAGE - Affiche une image
* 3030 SAISIE - Saisie d'un texte
* 4010 COMMENTAIRE - Affiche un commentaire
* 5010 ORDRE - Affiche et sélectionne les ordres
* 5120 BRUITAGE - Joue un son (le tir en fait)
* 9000 CHANCE - Croise les doigts :-)
* 9110 TEMPORISATION - 

*-------------------------------
* MACROS
*-------------------------------

@bruitage	mac
	jsr	BRUITAGE
	<<<

@chance	mac
	jsr	CHANCE
	<<<

@charge_image	mac
	ldx	]1
	lda	]2
	jsr	CHARGE_IMAGE
	<<<

@commentaire	mac
	lda	]1
	jsr	COMMENTAIRE
	<<<

@image	mac
	ldx	]1
	ldy	]2
	jsr	IMAGE
	<<<

@mot	mac
	ldx	]1
	jsr	GETMOT
	<<<
	
@ordre	mac
	lda	]1
	ldx	]2
	jsr	ORDRE
	<<<

@ordre_tempo	mac
	lda	]1
	ldx	]2
	ldy	]3
	jsr	ORDRE_TEMPO
	<<<

@saisie	mac
	jsr	SAISIE
	<<<
	
@temporisation	mac
	lda	]1
	jsr	nowTEMPO
	<<<

*-------------------------------
* EQUATES
*-------------------------------

MOT_DEBUT	=	1
GROS_MOT	=	41
MOT_FIN	=	52
NB_MOTS	=	52

idxTIR	=	1

iDESERT	=	1
iGOLD	=	2
iMONTAGNE	=	3
iRENO	=	4
iSHERIF	=	5
iCABANE	=	6
iCHASSEUR	=	7
iINDIEN	=	8
iJUGEMENT	=	9
iPUEBLO	=	10
iTRAPPEUR	=	11
iVILLAGE	=	12

*-------------------------------
* EXTERNALS
*-------------------------------

	ext	sndTIR

*-------------------------------
* WINDOW 0 : 0,0 to 40,25
* WINDOW 1 : 6,20 to 35,22
* WINDOW 2 : 6,24 to 35,24

*-------------------------------
* JEU
*-------------------------------

WESTERN	@border	#indexWHITE
	@paper	#0;#indexWHITE
	@pen	#0;#indexBLACK
	@cls	#0

DEBUT
:1070	jsr	INIT_VARIABLES

                jsr             makeFONT        ; sets the font
                
	@window	#1;#theWINDOW1	; commentaire
	@window	#2;#theWINDOW2	; ordre
	@window	#3;#theWINDOW3	; Antoine's addition

	@paper	#3;#indexBLACK
	@pen	#3;#indexWHITE
	@cls	#3

	@paper	#1;#indexBLACK
	@pen	#1;#indexWHITE
	@cls	#1
	@locate	#1;#1;#2
	@print	#1;#strWPRET

	@paper	#2;#indexBLACK
	@pen	#2;#indexORANGE
:1078	@cls	#2
	@locate	#2;#1;#1
	@print	#2;#strWREPRISE

:1080	@inkey
	cmp	#'q'
	beq	FIN
	cmp	#'Q'
	beq	FIN
	cmp	#'a'
	beq	:1085
	cmp	#'A'
	beq	:1085
	cmp	#'r'
	beq	:8010
	cmp	#'R'
	beq	:8010
	bne	:1080

:1085	@cls	#0
PATCHME	jmp	RENO

*--- Exit if open-apple-q only

FIN	lda	taskMODIFIERS
	and	#appleKey
	cmp	#appleKey
	bne	:1080
	rts

*--- Restore a game

:8010	@cls	#2
	@locate	#2;#1;#1
	@print	#2;#strWREPRISE2
:8020	@inkey
	cmp	#'n'
	beq	:1078
	cmp	#'N'
	beq	:1078
	cmp	#'o'
	beq	:8040
	cmp	#'O'
	bne	:8020

:8040	jsr	loadGAME
	bcs	:8045
	jmp	:1085
:8045	jmp	:1078

*-------------------------------
* LES SPECIFICITES IIGS
*-------------------------------

makeFONT	PushWord #$0800
	PushWord #32770		; Western.8
	PushWord #0
	_InstallFont

	PushWord	#modeOr
	_SetTextMode

*---

makeFRAME        PushLong        #penPOINT
                _GetPenSize
                
                PushWord        #2
                PushWord        #2
                _SetPenSize
                
                PushLong        #blackPATTERN
                _SetPenPat
                PushLong        #rectWINDOW3
                _FrameRect

*---

                PushWord        penPOINT+2
                PushWord        penPOINT
                _SetPenSize

                PushLong        #whitePATTERN
                _SetPenPat

                lda             fgFRAME
                bne             makeNOLINE

                PushWord        #39
                PushWord        #181
                _MoveTo
                
                PushWord        #296
                PushWord        #181
                _LineTo

makeNOLINE      rts

*---

penPOINT        ds              2
                ds              2

rectWINDOW3     dw              141,37,195,299

*-------------------------------
* INITIALISE LES VARIABLES
*-------------------------------

INIT_VARIABLES	sep	#$20
	ldx	#DATA_IN
]lp	stz	|$0000,x
	inx
	cpx	#DATA_OUT
	bcc	]lp
	rep	#$20
	
	lda	#RENO	; always begin with RENO
	sta	PATCHME+1
	rts

*-------------------------------
* CHARGE IMAGE
*-------------------------------

SIZEOF_IMG	=	16

*---

CHARGE_IMAGE	stx	curIMAGES	; A : image file GS/OS pointer
	stx	scene	; la scène courante
	cpx	oldIMAGES
	bne	CI_1
	rts		; no need to load, images are already in RAM

CI_1	stz	fgIMAGES	; say load will be fine

	ldx	ptrUNPACK+2	; load .bin file
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	CI_2	; load is ok

	lda	#-1	; load is not ok
	sta	fgIMAGES
	rts		; exit

*-- Clear all previous existing handles

CI_2	lda	curIMAGES	; Get the pointer
	asl
	tax
	lda	tblIMAGES,x
	sta	dpDATA

]lp	lda	(dpDATA)	; end of list?
	cmp	#-1
	beq	CI_4

	ldy	#4
	lda	(dpDATA),y	; get handle
	sta	haIMAGE
	lda	#0	; clear it
	sta	(dpDATA),y
	ldy	#6
	lda	(dpDATA),y
	sta	haIMAGE+2
	lda	#0
	sta	(dpDATA),y
	
	lda	haIMAGE	; if zero
	ora	haIMAGE+2
	beq	CI_3	; do not dispose it
	
	PushLong	haIMAGE	; please dispose it
	_DisposeHandle

CI_3	lda	dpDATA	; next entry
	clc
	adc	#SIZEOF_IMG
	sta	dpDATA
	bra	]lp

*--- Time to unpack the pictures

CI_4	lda	curIMAGES	; Get the pointer
	asl
	tax
	lda	tblIMAGES,x
	sta	dpDATA

]lp	lda	(dpDATA)	; any picture to unpack?
	cmp	#-1
	bne	CI_5	; no more
	
	lda	curIMAGES	; we're done
	sta	oldIMAGES
	rts

CI_5	ldy	#2	; get packed length
	lda	(dpDATA),y
	bpl	CI_6	; this is a LZ4 file

	and	#$7fff	; get the length of not packed data
	sta	adrIMAGES
	sta	LZ4_length
	tax
	PushLong	ptrUNPACK	; move not packed data
	PushLong	ptrIMAGE
	pea	$0000
	phx	
	_BlockMove
	
	ldx	#0	; get size
	ldy	adrIMAGES
	bra	CI_7
	
CI_6	sta	adrIMAGES	; unpack please
	jsr	unpackLZ4

CI_7	jsr	makeXYKB	; reserve memory

	ldy	#4	; save handle
	sta	(dpDATA),y
	sta	haIMAGE
	ldy	#6
	txa
	sta	(dpDATA),y
	sta	haIMAGE+2

*--- Copy data

	lda	ptrUNPACK+2	; move packed picture
	pha		; to the beginning
	lda	adrIMAGES	; of the bank
	pha
	PushLong	ptrUNPACK
	PushLong	proEOF
	_BlockMove
	
	PushLong	ptrIMAGE	; copy the unpacked data
	PushLong	haIMAGE	; to the destination buffer
	PushLong	LZ4_length
	_PtrToHand

*--- Go to the next picture

	ldy	#2	; pointer to the next picture
	lda	(dpDATA),y
	and	#$7fff	; mask bit 15
	clc
	adc	adrIMAGES 
	sta	adrIMAGES

	lda	dpDATA	; next entry
	clc
	adc	#SIZEOF_IMG
	sta	dpDATA
	brl	]lp

*--- Copy the data in the handle

haIMAGE	ds	4
adrIMAGES	ds	2	; adresse de l'image recherchée
curIMAGES	ds	2	; index du set d'images demandé
oldIMAGES	dw	-1	; index précédemment demandé
numIMAGE	ds	2	; numéro d'image recherchée
fgIMAGES	ds	2	; 0: ok to display, -1: load error
	
*-------------------------------
* AFFICHAGE IMAGE
*-------------------------------

:3010
IMAGE	lda	fgIMAGES	; X : l'index du set d'images (1..)
	beq	IMAGE_1	; Y : adresse de l'image
	rts

*--- Prepare the find

IMAGE_1	sty	numIMAGE	; image recherchée
	
	txa		; Get the pointer
	asl
	tax
	lda	tblIMAGES,x
	sta	dpDATA

*--- Browse through the entries

]lp	lda	(dpDATA)
	cmp	#-1
	bne	IMAGE_2
	rts		; fin du tableau

IMAGE_2	cmp	numIMAGE	; did we find our picture?
	beq	IMAGE_3	; yes
	
	lda	dpDATA	; next entry
	clc
	adc	#SIZEOF_IMG
	sta	dpDATA
	bra	]lp

*--- Dereference the handle to get the pointer

IMAGE_3	php
	sei
	ldy	#6
	lda	(dpDATA),y
	pha
	ldy	#4
	lda	(dpDATA),y
	pha
	phd
	tsc
	tcd
	lda	[3]
	sta	srcLocInfoPtr+2
	ldy	#2
	lda	[3],y
	sta	srcLocInfoPtr+4
	pld
	pla
	pla
	plp

*--- Prepare the rectangle

	ldy	#12	; the width
	lda	(dpDATA),y
	sta	srcLocInfoPtr+14
	sta	srcRectPtr+6
	lsr
	sta	srcLocInfoPtr+6

	ldy	#14	; the height
	lda	(dpDATA),y
	sta	srcLocInfoPtr+12
	sta	srcRectPtr+4
	
*--- Paint it

	ldy	#8	; get x/y dest
	lda	(dpDATA),y
	tax
	ldy	#10
	lda	(dpDATA),y
	tay
	
	PushLong	#srcLocInfoPtr	; draw the picture
	PushLong	#srcRectPtr
	phx
	phy
	PushWord	#modeCopy
	_PPToPort
	rts		; and we're done

*-------------------------------
* EDITEUR AUTRES ORDRES
*-------------------------------

:3030
SAISIE	@cls	#1
	@locate	#1;#4;#1
	@print	#1;#strWORDRE
	@locate	#1;#5;#1
	@input	#22;#N$
	@upper	#N$
	
*-------------------------------
* ANALYSE SYNTHAXIQUE (SIC)
*-------------------------------

:3180
checkENTRIES	@restore	#dataMOTS

	ldx	#MOT_DEBUT	; start at position 1
]lp	@read	#MOT$	; read a value from DATA
	@instr	#N$;#MOT$
	sep	#$20
	sta	mot,x	; 0 if not equal, 1 if equal
	rep	#$20
	inx
	cpx	#MOT_FIN	; last word
	bcc	]lp
	beq	]lp

*---

	ldx	#GROS_MOT
]lp	lda	mot,x
	and	#$ff
	cmp	#TRUE
	beq	:3220
	inx
	cpx	#MOT_FIN
	bcc	]lp
	beq	]lp
	rts

:3220	@cls	#2
	@locate	#2;#5;#1
	@print	#2;#strGROSSIER
	@inkey
	@cls	#2
	jmp	:3030

*-------------------------------
* GETMOT
*-------------------------------

GETMOT	lda	mot,x
	and	#$ff
	cmp	#TRUE
	rts

*-------------------------------
* AFFICHAGE COMMENTAIRE
*-------------------------------

COMMENTAIRE
:4010	jsr	RESTORE

	lda	srcRectPtr+4
	cmp	#200
	beq	:4020

	@cls	#3	; n'efface pas si grande image

:4020	@cls	#1
	@read	#COM$
	@print	#1;#COM$
	rts

*-------------------------------
* LECTURE DES ORDRES
*-------------------------------

ORDRE_TEMPO	sty	theTEMPO	; tempo in seconds + default choice
	sta	po
	txa
	jsr	RESTORE
	
	pha		; calculate time exit condition
	pha
	lda	theTEMPO
	xba
	and	#$00ff
	pha
	PushWord	#60
	_Multiply
	PullLong	theTICK

	pha		; and add it to the current time
	pha
	_TickCount
	pla
	clc
	adc	theTICK
	sta	theTICK
	pla
	adc	theTICK+2
	sta	theTICK+2
	
	bra	:5020	; enter the main routine

*---------------
	
ORDRE	
:5010	sta	po	; nb entries
	txa
	jsr	RESTORE	; save pointer

	stz	theTEMPO	; no tempo

:5020	ldx	#1	; loop through
]lp	txa		; all the entries
	asl		; and save
	tay		; entry's pointer
	lda	dpDATA
	sta	tblORDRE,y

	@read	#ORDRE$	; read next
	
	inx		; until the
	cpx	po	; number of
	bcc	]lp	; entries
	beq	]lp
	
*-------------------------------
* AFFICHAGE DES ORDRES
*-------------------------------

printORDRE
:5030	lda	#1
:5035	sta	t

:5040	@cls	#2

	lda	t
	asl
	tax
	lda	tblORDRE,x
	sta	dpDATA
	
	@read	#ORDRE$
	@len	#ORDRE$
	pha
	lda	#30
	sec
	sbc	1,s
	plx
	lsr
	bcc	:5045
	inc
:5045	sta	diff

	@locate	#2;diff;#1
	@print	#2;#ORDRE$
	
:5050	@inkey
	cmp	#'S'	; sauvegarde
	beq	:5075
	cmp	#'s'
	beq	:5075
	
	cmp	#chrRET
	beq	:5060
	cmp	#chrUA
	bne	:5055

	dec	t	; previous entry
	beq	:5052	; until 0
	bpl	:5040	; or...
:5052	lda	po	; ...negative
	bra	:5035

:5055	cmp	#chrDA
	bne	:5050

	inc	t	; next entry
	lda	t	; until po
	cmp	po
	bcc	:5040
	beq	:5040
	bcs	:5030

:5060	lda	theTEMPO	; shall we force
	and	#$00ff	; the result?
	beq	:5070	; no
	sta	t	; yes

	stz	theTEMPO

:5070	lda	t	; chosen entry
	rts

:5075	jsr	saveGAME	; save the current game
	jmp	:5050

*-------------------------------
* S/PROG BRUITAGE
*-------------------------------

BRUITAGE
:5120	lda	#idxTIR
	jsr	playSOUND
	rts

*-------------------------------
* CHANCE
*-------------------------------

CHANCE
:9000	@inkey_true	#A$

	inc	chance
	lda	chance
	cmp	#2
	bcc	:9010
	stz	chance
:9010	lda	A$
	beq	:9000
	rts

*-------------------------------
* TEMPORISATION (changed to nowTEMPO)
*-------------------------------

TEMPORISATION
:9110	sec
:9111	pha
:9112	sbc	#1
	bne	:9112
	pla
	sbc	#1
	bne	:9111
	rts

*-------------------------------
* DATA
*-------------------------------

DATA_IN	

*--- Integer

argent	ds	2	; gold/reno
boire	ds	2	; gold
eau	ds	2	; desert/pueblo
jugement	ds	2	; jugement
maggy	ds	2	; cabane/chasseur
scene	ds	2	; numéro de scène pour le restore

DATA_SAVE			; above data is stored onto disk

chance	ds	2
d	ds	2
diff	ds	2	; where to print ordre$
fgFRAME         ds              2               ; draw the frame if non zero
po	ds	2
nb	ds	2
phase	ds	2
t	ds	2

theTEMPO	ds	2	; to simulate the AFTER command
theTICK	ds	4

mot	ds	NB_MOTS

*--- String

A$	ds	256
COM$	ds	256
MOT$	ds	256
N$	ds	256
ORDRE$	ds	256

ptrORDRE	ds	2	; ptr to current ORDRE
tblORDRE	ds	2*32	; room for 32 ORDRES

DATA_OUT

*--- Data Save

strFILE	asc	'BDASF925'

SAVE_IN

myFILE	asc	'BDASF925'
myDATA	ds	12

SAVE_OUT

*------------------------------- Entry points

tblSCENE	da	RENO
	da	DESERT
	da	GOLD
	da	MONTAGNE
	da	RENO
	da	SHERIF
	da	CABANE
	da	CHASSEUR
	da	INDIEN
	da	JUGEMENT
	da	PUEBLO
	da	TRAPPEUR
	da	VILLAGE

*------------------------------- Images

srcLocInfoPtr	dw	mode320	; mode 320
	ds	4
	dw	160	; in words
	dw	0,0,136,320	; in pixels

srcRectPtr	dw	0,0,136,320

*
* Chaque image :
* - ID	word
* - LZ4 LEN	word	makes the offset for the next picture
* - Handle	long	handle to unpacked picture
* - X1	word	X-coord of the picture
* - Y1	word	Y-coord of the picture
* - Width	word	Width of the picture
* - Height	word	Height of the picture

tblIMAGES	dw	$0000
	da	imgDESERT,imgGOLD,imgMONTAGNE,imgRENO	
	da	imgSHERIF,imgCABANE,imgCHASSEUR,imgINDIEN
	da	imgJUGEMENT,imgPUEBLO,imgTRAPPEUR,imgVILLAGE

imgDESERT	dw	22220,1914	; picture /9
	ds	4
	dw	160,16
	dw	128,112
	dw	23937,32768+564	; picture **
	ds	4
	dw	246,19
	dw	24,47
	dw	24269,32768+564	; picture **
	ds	4
	dw	246,19
	dw	24,47
	dw	24603,32768+564	; picture **
	ds	4
	dw	246,19
	dw	24,47
	dw	24936,2500	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	27232,2344	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	29503,2952	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	31795,2861	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	34319,8372	; picture
	ds	4
	dw	0,0
	dw	320,136
	dw	-1	; terminator

imgGOLD	dw	20750,2426	; picture /9
	ds	4
	dw	160,16
	dw	128,112
	dw	22942,2904	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	25565,1378	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	27034,2795	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	29572,2235	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	31443,1032	; picture (was 1034)
	ds	4
	dw	166,74
	dw	64,51
	dw	32305,2207	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	34290,1888	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	36326,4940	; picture
	ds	4
	dw	0,0
	dw	320,136
	dw	-1	; terminator
	
imgMONTAGNE	dw	24375,1744	; picture /6
	ds	4
	dw	160,16
	dw	128,112
	dw	25889,1990	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	27642,2735	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	29973,2785	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	32325,3068	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	34902,7941	; picture
	ds	4
	dw	0,0
	dw	320,136
	dw	-1	; terminator

imgRENO	dw	23537,1814	; picture /6
	ds	4
	dw	160,16
	dw	128,112
	dw	25247,2043	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	27018,2525	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	29381,1926	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	30965,2546	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	33290,8648	; picture
	ds	4
	dw	0,0
	dw	320,136
	dw	-1	; terminator
	
imgSHERIF	dw	28930,32768+320	; picture /6 ** was 106
	ds	4
	dw	130,32
	dw	32,20	; ** was 30
	dw	29063,1597	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	30740,2197	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	32709,758	; picture
	ds	4
	dw	160,16
	dw	128,56	; 128,112
	dw	33461,1855	; picture
	ds	4
	dw	160,16
	dw	128,112	; 128,56
	dw	35453,6266	; picture
	ds	4
	dw	0,0
	dw	320,136
	dw	-1	; terminator

imgCABANE	dw	24751,1976	; picture /12
	ds	4
	dw	160,16
	dw	128,112
	dw	26463,2508	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	28598,2802	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	29371,2895	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	30197,2772	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	32506,951	; picture
	ds	4
	dw	196,72
	dw	76,53
	dw	33205,470	; picture
	ds	4
	dw	212,88
	dw	44,37
	dw	33585,2634	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	36188,32768+204	; picture
	ds	4
	dw	186,1
	dw	8,51
	dw	36363,32768+204	; picture
	ds	4
	dw	186,1
	dw	8,51
	dw	36538,32768+204	; picture
	ds	4
	dw	186,1
	dw	8,51
	dw	36713,5199	; picture
	ds	4
	dw	0,0
	dw	320,136
	dw	-1	; terminator

imgCHASSEUR	dw	22728,7170	; picture /7
	ds	4
	dw	0,0
	dw	320,200
	dw	29604,1725	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	31407,1763	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	33074,350	; picture
	ds	4
	dw	180,48
	dw	24,40
	dw	33201,295	; picture
	ds	4
	dw	180,48
	dw	24,40
	dw	33448,1958	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	36030,6352	; picture
	ds	4
	dw	0,0
	dw	320,136
	dw	-1	; terminator

imgINDIEN	dw	24703,1462	; picture /9
	ds	4
	dw	160,54
	dw	128,47	; 58,45
	dw	25356,1215	; picture
	ds	4
	dw	160,54
	dw	128,47	; 58,45
	dw	25745,1210	; picture
	ds	4
	dw	160,54
	dw	128,47	; 58,45
	dw	26225,1221	; picture
	ds	4
	dw	160,54
	dw	128,47	; 58,45
	dw	26769,2282	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	28880,2104	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	30857,3035	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	33566,2715	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	35903,6102	; picture
	ds	4
	dw	0,0
	dw	320,136
	dw	-1	; terminator

imgJUGEMENT	dw	26051,1785	; picture /6
	ds	4
	dw	160,16
	dw	128,112
	dw	28026,2527	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	30241,279	; picture
	ds	4
	dw	284,82
	dw	36,24
	dw	30465,1821	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	32159,2881	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	35068,6336	; picture
	ds	4
	dw	0,0
	dw	320,136
	dw	-1	; terminator

imgPUEBLO	dw	21343,2421	; picture /14
	ds	4
	dw	160,16
	dw	128,112
	dw	23426,1699	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	25017,238	; picture **
	ds	4
	dw	182,19
	dw	16,73
	dw	25341,229	; picture **
	ds	4
	dw	182,19
	dw	16,73
	dw	25665,203	; picture **
	ds	4
	dw	182,19
	dw	16,73
	dw	25989,2264	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	28115,434	; picture
	ds	4
	dw	224,107
	dw	64,21
	dw	28463,440	; picture
	ds	4
	dw	224,107
	dw	64,21
	dw	28809,2757	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	31466,224	; picture
	ds	4
	dw	216,80
	dw	36,40
	dw	31808,218	; picture
	ds	4
	dw	216,80
	dw	36,40
	dw	32190,140	; picture
	ds	4
	dw	216,80
	dw	36,40
	dw	32568,2178	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	35238,7260	; picture
	ds	4
	dw	0,0
	dw	320,136
	dw	-1	; terminator

imgTRAPPEUR	dw	25077,32768+1512	; picture /11
	ds	4
	dw	164,9
	dw	48,63
	dw	25732,32768+1512	; picture
	ds	4
	dw	164,9
	dw	48,63
	dw	26346,2782	; picture
	ds	4
	dw	160,9
	dw	128,119
	dw	28820,32768+90	; picture not packed
	ds	4
	dw	276,19
	dw	12,15
	dw	28899,32768+90	; picture not packed
	ds	4
	dw	276,19
	dw	12,15
	dw	28978,32768+90	; picture not packed
	ds	4
	dw	276,19
	dw	12,15
	dw	29057,32768+90	; picture not packed
	ds	4
	dw	276,19
	dw	12,15
	dw	29136,2151	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	31185,2350	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	33266,2868	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	35740,6845	; picture
	ds	4
	dw	0,0
	dw	320,136
	dw	-1	; terminator

imgVILLAGE	dw	20052,8479	; picture /5
	ds	4
	dw	0,0
	dw	320,200
	dw	27955,1898	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	29643,3147	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	32272,2156	; picture
	ds	4
	dw	160,16
	dw	128,112
	dw	34095,7757	; picture
	ds	4
	dw	0,0
	dw	320,136
	dw	-1	; terminator

*------------------------------- Windows

*theWINDOW1	dw	6,35,20,22
*theWINDOW2	dw	6,35,24,24
*theWINDOW3	dw	5,36,19,25
*theWINDOW4	dw	6,35,20,24

theWINDOW1	dw	6,35,19,21
theWINDOW2	dw	6,35,23,23
theWINDOW3	dw	5,36,18,23      ; 24
theWINDOW4	dw	6,35,19,23

theWINDOW5	dw	28,35,8,10	; was 9,11
theWINDOW6	dw	22,38,4,5

*------------------------------- QuickDraw

aRect	dw	0,0,200,320

aLocPtr	dw	mode320	; mode 320
	ds	4	; pointer to object
	dw	160
aRectPtr	dw	0,0,200,320

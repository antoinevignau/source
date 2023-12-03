*
* La maison du Professeur Folibus
*
* (c) 1982, Alain BrŽgŽon
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	mx	%11
	org	$4000
	lst	off

*-----------------------------------
* SOFTSWITCHES AND FRIENDS
*-----------------------------------

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

chrOUI	=	"Y"
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

*--- The firmware routines

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
	
	lda	#$80	; OCPY UPPERCASE
	sta	fgCASE	
lowerOK

*--------

	jsr	introPIC	; la picture GR
	jsr	:51000	; le disclaimer
	jsr	:40000	; les instructions
	
REPLAY
	jsr	initALL
	jsr	HOME

*-----------------------------------
* DU BASIC A L'ASSEMBLEUR (BEURK)
*-----------------------------------

:100	ldx	#2
	lda	S,x
	beq	:200

:110	ldx	#2
	lda	C,x
	bmi	:120
	beq	:120
	dec	C,x

:120	ldx	#3
	lda	S,x
	cmp	#1
	bcs	:200
	
	@print	#strILFAITNOIR
	
	ldx	#3
	lda	C,x
	bmi	:150
	beq	:150
	dec	C,x
	
:150	jmp	:1000

*-----------------------------------
* 200 - description salle
*-----------------------------------

:200	@print	#strRETURN

	lda	SALLE
	asl
	tax
	lda	tbl8000,x
	sta	:222+1
	lda	tbl8000+1,x
	sta	:222+2
	
:222	jsr	$bdbd
	
:300	lda	#0
	sta	H
	sta	HH	; for comma
	lda	#1
	sta	X
	
:310	ldx	X
	lda	O,x
	cmp	SALLE
	bne	:500
	
	lda	H
	bne	:350

	@print	#strILYA
	
	inc	H

:350	lda	HH
	beq	:400

	@print	#strCOMMA

:400	@print	#strSPACE
	lda	X
	asl
	tax
	ldy	tblO$,x
	lda	tblO$+1,x
	tax
	jsr	printCSTRING

	inc	HH
	
:500	inc	X
	lda	X
	cmp	#nbO	; la constante 25
	bcc	:310
	beq	:310

	@print	#strRETURN

*-----------------------------------
* 1000 - ACCEPTATION COMMANDE
*-----------------------------------

:1000	lda	#1
	sta	T
*	lda	#0
*	sta	N
	jmp	:2000

:1100	ldx	#1
	lda	C,x
	bmi	:1110
	beq	:1110
	dec	C,x
	
:1110	ldx	#4
	lda	C,x
	bmi	:1120
	beq	:1120
	dec	C,x
	
:1120	@print	#strCOMMANDE
	jsr	GETLN1
	stx	lenSTRING	; longueur de la chaine saisie
	jsr	rewriteSTRING	; from lower to upper
	jsr	:6000	; cherche les mots

	lda	MO$1
	bne	:1600
	
	@print	#strJENECOMPRENDS
	jmp	:100

*-----------------------------------
* 1600 - CONTROLES APPLE II
*-----------------------------------

:1600	cmp	#59	; switch wait to de/accelerate the game
	bne	:1605

	jsr	switchWAIT
	jmp	:100

:1605	cmp	#60	; quitter
	bne	:1610
	jmp	:20050

:1610	cmp	#61
	bne	:1615
	
	jsr	switchCASE
	jmp	:100

*-----------------------------------
* 1600 - CONTROLE MVT
*-----------------------------------

:1615	ldy	#0

	lda	SALLE	; T$=MID(M$(SALLE),Z,2)
	asl
	tax
	lda	tblM$,x
	sta	LINNUM
	lda	tblM$+1,x
	sta	LINNUM+1
	
:1620	lda	(LINNUM),y
	beq	:1900
	cmp	MO$1
	bne	:1700

	iny
	lda	(LINNUM),y
	sta	SALLE
	jmp	:100
	
:1700	iny
	iny
	bne	:1620

:1900	lda	#0
	sta	T
	sta	XXO
	
*-----------------------------------
* 2000 - CONTROLE
*-----------------------------------

:2000	lda	#0
	sta	CP

:2100	inc	CP
	
	lda	T
	beq	:2300

	lda	CP	; E$=C$(CP)
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
	jmp	:2600

:2300	lda	CP
	cmp	#AA
	bcc	:2400
	beq	:2400

	lda	XXO
	beq	:2320
	jmp	:1000

:2320	@print	#strIMPOSSIBLE

	lda	MO$1	; les directions
	cmp	#12+1
	bcs	:2350
	
	@print	#strCECHEMIN
	
:2350	@print	#strEXCLAM
	jmp	:100

:2400	lda	CP
	asl
	tax
	lda	tblA,x
	cmp	MO$1
	beq	:2410
	jmp	:2100

:2410	ldy	#0	; New try
	lda	tblA+1,x
	beq	:2415
	iny
:2415	cmp	MO$2
	beq	:2420
	iny
:2420	cpy	#2
	bne	:2430
	jmp	:2100

*:2410	lda	tblA+1,x
*	beq	:2430
*	cmp	MO$2
*	beq	:2430
*	jmp	:2100
	
:2430	lda	tblA$,x
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
* 2600 - CONDITIONS
*-----------------------------------

:2600	lda	#1
	sta	E
	
:2700	ldx	E	; 7893
	lda	E$,x	; 7894
	cmp	#"."
	bne	:2710
	jmp	:3000	; do actions

:2710	sec
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
	lda	tbl2900,x
	sta	:2800+1
	lda	tbl2900+1,x
	sta	:2800+2

:2800	jsr	$bdbd
	
	lda	OK
	bne	:2820
	jmp	:2100

:2820	lda	E
	clc
	adc	#3
	sta	E
	jmp	:2700

*--------

tbl2900	da	:2900,:2910,:2920,:2930,:2940,:2950,:2960,:2970
	
*-------- A, si nous sommes dans la salle N

:2900	lda	N
	cmp	SALLE
	bne	:2905
	lda	#1
	sta	OK
:2905	rts
	
*-------- B, si l'objet N est present ou transporte

:2910	ldx	N
	lda	O,x
	bmi	:2915
	cmp	SALLE
	bne	:2916
:2915	lda	#1
	sta	OK
:2916	rts
	
*-------- C, si l'objet N est present ou non transporte

:2920	ldx	N
	lda	O,x
	bpl	:2925
	rts
:2925	cmp	SALLE
	bne	:2927
	rts
:2927	lda	#1
	sta	OK
	rts

*-------- D, si l'objet N est transporte

:2930	ldx	N
	lda	O,x
	bpl	:2935
	lda	#1
	sta	OK
:2935	rts

*-------- E, si le pointeur N est active

:2940	ldx	N
	lda	S,x
	beq	:2945
	lda	#1
	sta	OK
:2945	rts

*-------- F, si le pointeur n'est pas active

:2950	ldx	N
	lda	S,x
	bne	:2955
	lda	#1
	sta	OK
:2955	rts

*-------- G, si le compteur a atteint la valeur 1

:2960	ldx	N
	lda	C,x
	cmp	#1
	bne	:2965
	lda	#1
	sta	OK
:2965	rts

*-------- H, si le nombre aleatoire (1-99) est inferieur a N

:2970	lda	VBL	; LOGO - Use a better RND?
	eor	VERTCNT
	cmp	N
	bcs	:2975
	lda	#1
	sta	OK
:2975	rts

*-----------------------------------
* 3000 - ACTIONS
*-----------------------------------

:3000	lda	#1
	sta	XXO

	inc	E
	
:3100	ldx	E
	lda	E$,x
	cmp	#"."
	bne	:3120
	jmp	:2100

:3120	sec
	sbc	#"A"
	cmp	#20
	bcc	:3125

	lda	#-1	; erreur de donnŽes
	pha
	bne	:3130

:3125	asl
	pha		; TYPE

:3130	lda	E$+1,x
	cmp	#"."
	beq	:3200

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

:3200	lda	#0
	sta	BREAK

	pla
	cmp	#-1	; saute si erreur de donnŽes
	beq	:3215
	
	tax
	lda	tbl4000,x
	sta	:3210+1
	lda	tbl4000+1,x
	sta	:3210+2

:3210	jsr	$bdbd

:3215	lda	BREAK
	beq	:3230
	asl
	tax
	lda	tblBRKA,x
	sta	:3220+1
	lda	tblBRKA+1,x
	sta	:3220+2

:3220	jmp	$bdbd

:3230	lda	E
	clc
	adc	#3
	sta	E
	jmp	:3100

*-------- The modified BREAK table

tblBRKA	da	$bdbd
	da	:100,:1000,:1100
	
*-----------------------------------
* 1800 - ACTIONS
*-----------------------------------

tbl4000	da	:4000,:4100,:4200,:4300,:4400,:4500,:4600,:4700,:4800,:4900
	da	:5000,:5100,:5200,:5300,:5400,:5500,:5600,:4000,:4100,:5600
	
*-------- A, INVENTAIRE

:4000	lda	#0
	sta	G
	sta	HH
	sta	H	; for comma

:4010	inc	G
	lda	G
	tax
	lda	O,x
	cmp	#-1
	beq	:4040

	lda	G
	cmp	#nbO
	bcc	:4010
	bcs	:4070
	
:4040	lda	HH
	bne	:4050

	@print	#strVOUSDETENEZ
	
:4050	inc	HH

	lda	H
	beq	:4060
	
	@print	#strCOMMA

:4060	lda	G
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
	bcc	:4010
	
:4070	lda	HH
	beq	:4080

	@print	#strPOINT
	rts

:4080	@print	#strVOUSRIEN

	lda	#1
	sta	BREAK
	rts

*-------- B, transportes objets N

:4100	ldx	#1
	lda	S,x
	cmp	#5
	bcc	:4140
	
	@print	#strEVIDENT

:4120	lda	#1
	sta	BREAK
	rts

:4140	ldx	N
	lda	O,x
	cmp	#-1
	beq	:4180

	lda	#-1
	sta	O,x
	
	ldx	#1
	inc	S,x
	rts

:4180	@print	#strVOUSLAVEZ
	jmp	:4120

*-------- C, pose objets N

:4200	ldx	N
	lda	O,x
	cmp	#-1
	beq	:4240

	@print	#strNOTOWNED
	lda	#1
	sta	BREAK
	rts

:4240	lda	SALLE
	sta	O,x

	ldx	#1
	dec	S,x
	rts

*-------- D, affiche le message en 7000+N*10

:4300	@print	#strRETURN

	lda	N
	asl
	tax
	lda	tbl7000,x
	sta	:4310+1
	lda	tbl7000+1,x
	sta	:4310+2

:4310	jmp	$bdbd

*-------- E, active le pointeur N

:4400	ldx	N
	lda	#1
	sta	S,x
	rts

*-------- F, desactive le pointeur N

:4500	ldx	N
	lda	#0
	sta	S,x
	rts

*-------- G, fixe le compteur N ˆ M

:4600	ldx	E
	lda	E$+3,x
	sec
	sbc	#"0"
	tay
	lda	tblD2H,y
	ldx	N
	sta	C,x

	ldy	E
	lda	E$+4,y
	iny
	iny
	sty	E
	sec
	sbc	#"0"
	clc
	adc	C,x
	sta	C,x
	rts

*-------- H, inverse les lignes dans le tableau objet

:4700	lda	N	; exchange object
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

*-------- I, pose objet N dans la salle en cours

:4800	ldx	N
	lda	SALLE
	sta	O,x
	rts

*-------- J, met le numero de salle contenant l'objet dans O

:4900	ldx	N
	lda	O,x
	bpl	:4910

	ldx	#1
	dec	S,x

:4910	ldx	N
	lda	#0
	sta	O,x
	rts
	
*-------- K, fixe le numero de salle en cours ˆ la valeur N

:5000	lda	N
	sta	SALLE
	rts

*-------- L, affiche d'accord et attend

:5100	@print	#strDACCORD

*-------- M, attend une nouvelle commande + "resanne" le tableau des actions

:5200	lda	#2
	sta	BREAK
	rts

*-------- N, attend une nouvelle commande

:5300	lda	#3
	sta	BREAK
	rts

*-------- O, affiche la description de la salle en cours

:5400	lda	#1
	sta	BREAK
	rts

*-------- P, etes-vous sur ?

:5500	jmp	:20050

*-------- Q, stop -> perdu

:5600	jmp	:20000

*-------- R, inventaire sans le BREAK

:5700	lda	#0
	sta	G
	sta	HH
	sta	H	; for comma

:5710	inc	G
	lda	G
	tax
	lda	O,x
	cmp	#-1
	beq	:5740

	lda	G
	cmp	#nbO
	bcc	:5710
	bcs	:5770
	
:5740	lda	HH
	bne	:5750

	@print	#strVOUSDETENEZ
	
:5750	inc	HH

	lda	H
	beq	:5760
	
	@print	#strCOMMA

:5760	lda	G
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
	bcc	:5710
	
:5770	lda	HH
	beq	:5780

	@print	#strPOINT
	rts

:5780	@print	#strVOUSRIEN
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
* 7000 - LES REPONSES
*-----------------------------------

tbl7000	da	$bdbd
	da	:7010,:7020,:7030,:7040,:7050,:7060,:7070,:7080,:7090,:7100
	da	:7110,:7120,:7130,:7140,:7150,:7160,:7170,:7180,:7190,:7200
	da	:7210,:7220,:7230,:7240,:7250,:7260,:7270,:7280,:7290,:7300
	da	:7310,:7320,:7330,:7340,:7350,:7360,:7370,:7380,:7390,:7400
	da	:7410,:7420,:7430,:7440,:7450,:7460

*--------

:7010	@print	#str7010
	@explode
	rts		; jmp	:20000

:7020	@print	#str7020
	rts

:7030	@print	#str7030
	rts

:7040	@print	#str7040
	@explode
	rts		; jmp	:20000

:7050	@print	#str7050
	@explode
	rts		; jmp	:20000

:7060	@print	#str7060
	rts

:7070	@print	#str7070
	rts

:7080	@print	#str7080
	rts

:7090	@print	#str7090
	rts

:7100	@print	#str7100
	rts

:7110	@print	#str7110
	rts

:7120	@print	#str7120
	rts

:7130	@print	#str7130
	rts

:7140	@print	#str7140
	rts
	
:7150	@print	#str7150
	rts

:7160	@print	#str7160
	rts

:7170	@print	#str7170
	rts

:7180	@print	#str7180
	rts

:7190	@print	#str7190
	@explode
	rts		; jmp	:20000

:7200	@print	#str7200
	rts

:7210	@print	#str7210
	@explode
	rts		; jmp	:20000

:7220	@print	#str7220
	rts

:7230	@print	#str7230
	rts

:7240	@print	#str7240
	rts

:7250	@print	#str7250
	@explode
	rts

:7260	@print	#str7260
	@explode
	rts		; jmp	:20000

:7270	@print	#str7270
	rts

:7280	@print	#str7280
	rts

:7290	@print	#str7290
	rts

:7300	@print	#str7300
	rts

:7310	@print	#str7310
	@explode
	rts		; jmp	:20000

:7320	@print	#str7320
	rts

:7330	@print	#str7330
	rts

:7340	@print	#str7340
	rts

:7350	@print	#str7350
	@explode
	rts		; jmp	:20000

:7360	@print	#str7360
	rts

:7370	@print	#str7370
	@explode
	rts		; jmp	:20000

:7380	@print	#str7380
	rts

:7390	@print	#str7390
	rts
	
:7400	@print	#str7400
	@explode
	rts		; jmp	:20000
	
:7410	@print	#str7410
	rts

:7420	@print	#str7420
	@explode
	rts		; jmp	:32000
	
:7430	@print	#str7430
	rts

:7440	@print	#str7440
	rts

:7450	@print	#str7450
	rts

:7460	@print	#str7460
	@explode
	rts		; jmp	:20000

*-----------------------------------
* 8000 - DESCRIPTION DES PIECES
*-----------------------------------

tbl8000
	da	$bdbd
	da	:8010
	da	:8020
	da	:8030
	da	:8040
	da	:8050
	da	:8060
	da	:8070
	da	:8080
	da	:8090
	da	:8100
	da	:8110
	da	:8120
	da	:8130
	da	:8140
	da	:8150
	da	:8160
	da	:8170

:8010	@print	#str8010
	rts

:8020	@print	#str8020
	rts
	
:8030	@print	#str8030
	rts
	
:8040	@print	#str8040
	rts

:8050	@print	#str8050
	rts

:8060	@print	#str8060
	rts

:8070	@print	#str8070
	rts

:8080	@print	#str8080
	rts

:8090	@print	#str8090
	rts

:8100	@print	#str8100
	rts

:8110	@print	#str8110
	rts

:8120	@print	#str8120
	rts

:8130	@print	#str8130
	rts

:8140	@print	#str8140
	rts

:8150	@print	#str8150
	rts

:8160	@print	#str8160
	rts

:8170	@print	#str8170
	rts

*-----------------------------------
* 8000 - CHARGEMENT VARIABLES
*-----------------------------------

initALL
	ldx	#FIN_DATA-DEBUT_DATA-1
	lda	#0
]lp	sta	XXO,x
	dex
	bpl	]lp

*---

	lda	#1
	sta	SALLE
	
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

:20000
	@play	#zikPERDU

:20050			; commun avec gagne
	jsr	HOME
]lp	@print	#strREPLAY
	jsr	translateKEY
	cmp	#chrNON
	beq	:21000
	cmp	#chrOUI
	bne	]lp
	jmp	REPLAY

:21000
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
* 40000 - LISTE DES INSTRUCTIONS
*-----------------------------------

:40000
	jsr	HOME
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
	jsr	HOME
	@print	#strDISCLAIMER
	jmp	translateKEY

*-----------------------------------
* introPIC - la picture GR
*-----------------------------------

introPIC
	jsr	setTEXTFULL

	lda	#2
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
	@wait	#300

	@play	#zikINTRODUCTION
	rts
	
*-----------------------------------
* ORIC
*-----------------------------------

EXPLODE	ldx	#$25
]lp	lda	TXTCLR
	lda	#$25
	jsr	WAIT
	lda	TXTSET
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
* switchCASE
*----------------------

switchCASE
	lda	fgCASE
	eor	#$80
	sta	fgCASE
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

V	=	75

tblV$	da	$bdbd
	da	V$1,V$2,V$3,V$4,V$5,V$6,V$7,V$8,V$9,V$10,V$11,V$12
	da	V$13,V$14,V$15,V$16,V$17,V$18,V$19,V$20
	da	V$21,V$22,V$23,V$24,V$25,V$26,V$27,V$28,V$29,V$30
	da	V$31,V$32,V$33,V$34,V$35,V$36,V$37,V$38,V$39,V$40
	da	V$41,V$42,V$43,V$44,V$45,V$46,V$47,V$48,V$49,V$50
	da	V$51,V$52,V$53,V$54,V$55,V$56,V$57,V$58,V$59,V$60
	da	V$61,V$62,V$63,V$64,V$65,V$66,V$67,V$68,V$69,V$70
	da	V$71,V$72,V$73,V$74,V$75

tblV	dfb	$bd
	dfb	01,01,02,02,03,03,04,04,05,05,06,06,07,07
	dfb	05,06,13,35,14,14
	dfb	15,15,16,17,18,19,19,20,21,22
	dfb	23,55,25,26,27,28,29,29,30,31
	dfb	32,33,35,34,36,31,37,38,39,40
	dfb	39,41,42,43,44,45,46,47,47,48
	dfb	49,50,51,52,53,54,49,56,56,57
	dfb	58,58,59,60,61


*---

nbO	=	20

refO	dfb	$bd
	dfb	02,00,02,00,06,07,03,06,00,10
	dfb	16,00,13,00,13,00,13,00,13,16

O	dfb	$bd
	dfb	02,00,02,00,06,07,03,06,00,10
	dfb	16,00,13,00,13,00,13,00,13,16

*---

refO$	da	$bdbd	; see :3300
	da	O$1,O$2,O$3,O$4,O$5,O$6,O$7,O$8,O$9,O$10
	da	O$11,O$12,O$13,O$14,O$15,O$16,O$17,O$18,O$19,O$20

tblO$	da	$bdbd
	da	O$1,O$2,O$3,O$4,O$5,O$6,O$7,O$8,O$9,O$10
	da	O$11,O$12,O$13,O$14,O$15,O$16,O$17,O$18,O$19,O$20


*---

M	=	17

tblM$	da	$bdbd
	da	M$1,M$2,M$3,M$4,M$5,M$6,M$7,M$8,M$9,M$10
	da	M$11,M$12,M$13,M$14,M$15,M$16,M$17

M$1	dfb	00
M$2	dfb	02,04,04,03,00
M$3	dfb	04,05,02,02,00
M$4	dfb	04,02,00
M$5	dfb	01,06,02,03,00
M$6	dfb	01,08,03,05,00
M$7	dfb	00
M$8	dfb	03,06,00
M$9	dfb	00
M$10	dfb	01,11,00
M$11	dfb	00
M$12	dfb	00
M$13	dfb	00
M$14	dfb	02,13,00
M$15	dfb	05,17,02,16,01,13,00
M$16	dfb	04,15,00
M$17	dfb	06,15,00

*--- On commence ˆ index 0

AA	=	92

tblA$	da	$bdbd
	da	A$1,A$2,A$3,A$4,A$5,A$6,A$7,A$8,A$9,A$10
	da	A$11,A$12,A$13,A$14,A$15,A$16,A$17,A$18,A$19,A$20
	da	A$21,A$22,A$23,A$24,A$25,A$26,A$27,A$28,A$29,A$30
	da	A$31,A$32,A$33,A$34,A$35,A$36,A$37,A$38,A$39,A$40
	da	A$41,A$42,A$43,A$44,A$45,A$46,A$47,A$48,A$49,A$50
	da	A$51,A$52,A$53,A$54,A$55,A$56,A$57,A$58,A$59,A$60
	da	A$61,A$62,A$63,A$64,A$65,A$66,A$67,A$68,A$69,A$70
	da	A$71,A$72,A$73,A$74,A$75,A$76,A$77,A$78,A$79,A$80
	da	A$81,A$82,A$83,A$84,A$85,A$86,A$87,A$88,A$89,A$90
	da	A$91,A$92

A$1	str	"A01.D03K02O."
A$2	str	"A01.D04O."
A$3	str	"B01.S01L."
A$4	str	"B03.S03L."
A$5	str	"B03C01.D06N."
A$6	str	"B01B03.H03E05E03L."
A$7	str	"B01.H01E05E03L."
A$8	str	".R00."
A$9	str	".P00."
A$10	str	".O00."
A$11	str	"B03.C03L."
A$12	str	"B01.C01L."
A$13	str	"D07.D07N."
A$14	str	"B07.S07D22N."
A$15	str	"C07.D08N."
A$16	str	"C07.D08N."
A$17	str	"D07.D09N."
A$18	str	"D07.D09N."
A$19	str	"A05F06F04.E04D11D10N."
A$20	str	"A05F06F04.D11E03E06N."
A$21	str	"A05E04.D12N."
A$22	str	"A03F08.E08L."
A$23	str	"A06F08.D23N."
A$24	str	"A06E08C06.K07F08O."
A$25	str	"A07B06.S06D24K06L."
A$26	str	"A06E08B06.K06N."
A$27	str	"A06D06E04B08.D13E07H08N."
A$28	str	"A06D06E04B08.D14E07H08N."
A$29	str	"A06D06F04F06B08.D15H08E07N."
A$30	str	"A06C06B08.D16N."
A$31	str	"A08E07E06.D17K09O."
A$32	str	"A08F07F08.D18E08N."
A$33	str	"A08F07F08.D18E08N."
A$34	str	"A08F08F06.D18E08N."
A$35	str	"A08F08F06.D18E08N."
A$36	str	"A08E08.D19Q."
A$37	str	"A08F08.D19Q."
A$38	str	"A08E07E06.D19Q."
A$39	str	"A09.E09K10O."
A$40	str	"A09.D19Q."
A$41	str	"A09.D27N."
A$42	str	"A10F04.E04L."
A$43	str	"A10E04.D29N."
A$44	str	"A10E04.F04L."
A$45	str	"A10F04.D29N."
A$46	str	"A10E04F06.E06L."
A$47	str	"A10E06.E08D30N."
A$48	str	"A10E07.D21Q."
A$49	str	"A10E04.D21Q."
A$50	str	"A10F04.D32N."
A$51	str	"A10E08.F08D33N."
A$52	str	"A09.D27N."
A$53	str	"A11.D34K12O."
A$54	str	"A11.D34K12O."
A$55	str	"A11.D34K12O."
A$56	str	"B06.C06L."
A$57	str	"A12.D31Q."
A$58	str	"A12.K13O."
A$59	str	"B11F04.E04H11D36N."
A$60	str	"A13F04.D26Q."
A$61	str	"A13E04.F04K14O."
A$62	str	"B17.D37Q."
A$63	str	"F05B15.E05H15L."
A$64	str	"E05.D29N."
A$65	str	"F08B13.E08H13L."
A$66	str	"E08.D29N."
A$67	str	"B13.S13L."
A$68	str	"B17.S17L."
A$69	str	"B15.S15L."
A$70	str	"B13.C13L."
A$71	str	"B17.C17L."
A$72	str	"B15.C15L."
A$73	str	"B19.S19L."
A$74	str	"B19.C19L."
A$75	str	"A13.E06K15O."
A$76	str	"B20.S20L."
A$77	str	"B20.C20L."
A$78	str	"B20F07.D38E07N."
A$79	str	"B20E07.D29N."
A$80	str	"B11.S11L."
A$81	str	"B11.C11L."
A$82	str	"A17F07.D39N."
A$83	str	"A17E07.D44D21O."
A$84	str	"A14F05.D40Q."
A$85	str	"A14E06E05F08.F06F05L."
A$86	str	"A14F08.D41Q."
A$87	str	"A14E06E05E08.F06L."
A$88	str	"A14E08F05F06.D42D43Q."
A$89	str	"A14E08E05E06.D42D45D46Q."
A$90	str	"A14E08E05F06.D42D43D45Q."
A$91	str	"A14E08F05E06.D42D46Q."
A$92	str	".N."

tblA	dfb	0,0
	dfb	07,00
	dfb	30,00
	dfb	15,28
	dfb	15,18
	dfb	17,18
	dfb	17,18
	dfb	17,28
	dfb	34,00
	dfb	33,00
	dfb	35,00
	dfb	32,18
	dfb	32,28
	dfb	13,16
	dfb	15,16
	dfb	13,16
	dfb	14,16
	dfb	14,16
	dfb	14,16
	dfb	19,20
	dfb	19,21
	dfb	19,21
	dfb	15,36
	dfb	23,25
	dfb	23,25
	dfb	15,22
	dfb	23,25
	dfb	29,31
	dfb	29,31
	dfb	29,31
	dfb	29,31
	dfb	05,00
	dfb	05,00
	dfb	06,00
	dfb	05,00
	dfb	06,00
	dfb	05,00
	dfb	06,00
	dfb	06,00
	dfb	41,00
	dfb	06,00
	dfb	30,00
	dfb	23,38
	dfb	23,38
	dfb	42,38
	dfb	42,38
	dfb	39,37
	dfb	06,00
	dfb	40,00
	dfb	40,00
	dfb	40,00
	dfb	05,00
	dfb	44,00
	dfb	43,00
	dfb	45,43
	dfb	46,43
	dfb	32,22
	dfb	19,47
	dfb	19,48
	dfb	49,51
	dfb	04,00
	dfb	04,00
	dfb	50,53
	dfb	50,54
	dfb	50,54
	dfb	50,52
	dfb	50,52
	dfb	15,52
	dfb	15,53
	dfb	15,54
	dfb	32,52
	dfb	32,53
	dfb	32,54
	dfb	15,56
	dfb	32,56
	dfb	03,00
	dfb	15,57
	dfb	32,57
	dfb	13,57
	dfb	13,57
	dfb	15,51
	dfb	32,51
	dfb	58,00
	dfb	58,00
	dfb	15,55
	dfb	15,55
	dfb	06,00
	dfb	15,55
	dfb	06,00
	dfb	06,00
	dfb	06,00
	dfb	06,00
	dfb	00,00	; 92 is ".N."
	
*--- On commence ˆ index 0

nbC	=	13

tblC$	da	$bdbd
	da	C$1,C$2,C$3,C$4,C$5,C$6,C$7,C$8,C$9,C$10
	da	C$11,C$12,C$13
	
C$1	str	"A04E05.D05Q."
C$2	str	"E04F10.G0403E10."
C$3	str	"G04A10.G0499F09D25."
C$4	str	"A04F05.D20."
C$5	str	"E06F10.G0405E10."
C$6	str	"G04.D01Q."
C$7	str	"A10E09.D26Q."
C$8	str	"A10E07.F06F07F04F08."
C$9	str	"A11F07.G0103E07."
C$10	str	"A11G01.D35Q."
C$11	str	"A12.F06F04."
C$12	str	"A12.F08F05F07."
C$13	str	".N."

*-----------------------------------

DEBUT_DATA

XXO	ds	1
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
CP	ds	1
OK	ds	1
SALLE	ds	1
T	ds	1
X	ds	1
W	ds	1
Z	ds	1
lenSTRING	ds	1

C	ds	10+1
S	ds	10+1	; was P in Le manoir
X$1	ds	4+1	; premier mot saisi
X$2	ds	4+1	; second mot saisi
E$	ds	32	; the longest string

FIN_DATA

*--- The lazy decimal to hexadecimal conversion

tblD2H	dfb	0,10,20,30,40,50,60,70,80,90

*-----------------------------------
* LES AUTRES FICHIERS
*-----------------------------------

	put	en.s
	put	../common/musiques.s

*--- It's the end
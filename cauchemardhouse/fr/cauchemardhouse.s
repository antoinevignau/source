*
* Cauchemard House
*
* (c) 198?, Auteur inconnu
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
	da	:7310,:7320,:7330,:7340,:7350,:7360,:7370,:7380

*--------

:7010	@print	#str7010
	@explode
	rts

:7020	@print	#str7020
	@explode
	rts

:7030	@print	#str7030
	@explode
	rts

:7040	@print	#str7040
	rts

:7050	@print	#str7050
	rts

:7060	@print	#str7060
	@explode
	rts

:7070	@print	#str7070
	@explode
	rts

:7080	@print	#str7080
	rts

:7090	@print	#str7090
	@explode
	rts

:7100	@print	#str7100
	rts

:7110	@print	#str7110
	@explode
	rts

:7120	@print	#str7120
	@explode
	rts

:7130	@print	#str7130
	@explode
	rts

:7140	@print	#str7140
	@explode
	rts
	
:7150	@print	#str7150
	@wait	#100
	@print	#str7153
	jmp	:32000

:7160	@print	#str7160
	@explode
	rts

:7170	@print	#str7170
	@explode
	rts

:7180	@print	#str7180
	@explode
	rts

:7190	@print	#str7190
	rts

:7200	@print	#str7200
	@explode
	rts

:7210	@print	#str7210
	@explode
	@explode
	rts

:7220	rts

:7230	@print	#str7230
	rts

:7240	rts

:7250	@print	#str7250
	@explode
	rts

:7260	@print	#str7260
	@explode
	rts

:7270	@print	#str7270
	rts

:7280	@print	#str7280
	rts

:7290	@print	#str7290
	rts

:7300	@print	#str7300
	@explode
	rts

:7310	@print	#str7310
	rts

:7320	@print	#str7320
	rts

:7330	@print	#str7330
	rts

:7340	@print	#str7340
	rts

:7350	@print	#str7350
	rts

:7360	@print	#str7360
	rts

:7370	@print	#str7370
	rts

:7380	@print	#str7380
	rts

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
* 32000 - GAGNE
*-----------------------------------

:32000	@play	#zikGAGNE
	jmp	:20050

*-----------------------------------
* 40000 - LISTE DES INSTRUCTIONS
*-----------------------------------

:40000	jsr	HOME
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

:51000	jsr	HOME
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

V	=	47+3

tblV$	da	$bdbd
	da	V$1,V$2,V$3,V$4,V$5,V$6,V$7,V$8,V$9,V$10
	da	V$11,V$12,V$13,V$14,V$15,V$16,V$17,V$18,V$19,V$20
	da	V$21,V$22,V$23,V$24,V$25,V$26,V$27,V$28,V$29,V$30
	da	V$31,V$32,V$33,V$34,V$35,V$36,V$37,V$38,V$39,V$40
	da	V$41,V$42,V$43,V$44,V$45,V$46,V$47
	da	V$73,V$74,V$75

tblV	dfb	$bd
	dfb	01,02,03,04,05,06,07,08,09,10
	dfb	11,12,13,14,15,16,18,17,19,20
	dfb	21,22,23,24,25,26,27,29,30,31
	dfb	32,33,34,35,36,37,38,39,40,41
	dfb	42,43,44,45,46,47,48
	dfb	59,60,61

*---

nbO	=	1

refO	dfb	$bd
	dfb	00,00

O	dfb	$bd
	dfb	00,00

*---

refO$	da	$bdbd	; see :3300
	da	O$1,O$2
	
tblO$	da	$bdbd
	da	O$1,O$2


*---

M	=	8

tblM$	da	$bdbd
	da	M$1,M$2,M$3,M$4,M$5,M$6,M$7,M$8
M$1	dfb	00
M$2	dfb	00
M$3	dfb	00
M$4	dfb	00
M$5	dfb	00
M$6	dfb	00
M$7	dfb	00
M$8	dfb	00

*--- On commence ˆ index 0

AA	=	75

tblA$	da	$bdbd
	da	A$1,A$2,A$3,A$4,A$5,A$6,A$7,A$8,A$9,A$10
	da	A$11,A$12,A$13,A$14,A$15,A$16,A$17,A$18,A$19,A$20
	da	A$21,A$22,A$23,A$24,A$25,A$26,A$27,A$28,A$29,A$30
	da	A$31,A$32,A$33,A$34,A$35,A$36,A$37,A$38,A$39,A$40
	da	A$41,A$42,A$43,A$44,A$45,A$46,A$47,A$48,A$49,A$50
	da	A$51,A$52,A$53,A$54,A$55,A$56,A$57,A$58,A$59,A$60
	da	A$61,A$62,A$63,A$64,A$65,A$66,A$67,A$68,A$69,A$70
	da	A$71,A$72

A$1	str	"B02.B02L."
A$2	str	"B01.B01L."
A$3	str	"B02.C02L."
A$4	str	"B01.C01L."
A$5	str	"A02F06.E06D31N."
A$6	str	"A02B09.C09E07L."
A$7	str	"A02E07F08.E09D19N."
A$8	str	"A02E07.E08D26N."
A$9	str	"A02E10.D03Q."
A$10	str	"A02E10.D04F10E18N."
A$11	str	"A02F10.L."
A$12	str	"A02B02.C02L."
A$13	str	"B03.B03L."
A$14	str	"E10A02.D02Q."
A$15	str	"E10A02.D02Q."
A$16	str	"E10A02.D02Q."
A$17	str	"E10A02.D12Q."
A$18	str	"A02E09.K08O."
A$19	str	"F10A02.K01O."
A$20	str	"F10A02.K03O."
A$21	str	"F10A22.K05O."
A$22	str	"B05.D18Q."
A$23	str	"D03.H03E11L."
A$24	str	"B03F11.C03L."
A$25	str	"E11B04.H03C03L."
A$26	str	"A03.D06Q."
A$27	str	"A03.D07Q."
A$28	str	"A03.D08K04O."
A$29	str	"A03.D06Q."
A$30	str	"A04.D09Q."
A$31	str	"A04.D06Q."
A$32	str	"A04.E12D38K05O."
A$33	str	"B02.D11Q."
A$34	str	"C02.D28N."
A$35	str	".A00."
A$36	str	".O00."
A$37	str	"B06.B06L."
A$38	str	"B06.C06L."
A$39	str	"E12A05F11.D13Q."
A$40	str	"E12A05F11.D13Q."
A$41	str	"A08F14F15.D25Q."
A$42	str	"E12A05F11.D13Q."
A$43	str	"F12A05.K06O."
A$44	str	"F12A05.F12K02O."
A$45	str	"F12A05E13.K07O."
A$46	str	"E11A05.F12K06O."
A$47	str	"E11A05.F12K02O."
A$48	str	"E11A05E13.K07O."
A$49	str	"E14A05.D19E13N."
A$50	str	"B11F15F14.H11E14L."
A$51	str	"E14B12.FX4H11L."
A$52	str	"B07.B07L."
A$53	str	"B09.B09L."
A$54	str	"B07.C07K."
A$55	str	"B09.C09L."
A$56	str	"B07.H07E16L."
A$57	str	"A06.D01Q."
A$58	str	"A06.D12Q."
A$59	str	"A06.D21Q."
A$60	str	"A06.D21Q."
A$61	str	"A06.D20Q."
A$62	str	"A07.D17Q."
A$63	str	"A07.D15Q."
A$64	str	"A07.D30Q."
A$65	str	"A07.D30Q."
A$66	str	"B11.B11L."
A$67	str	"B11.C11L."
A$68	str	"A08E17.D19D37E25N."
A$69	str	"A08F17.D29N."
A$70	str	"B11.C11L."
A$71	str	"A08E25.K07O."
A$72	str	"E16B08.C08L."

tblA	dfb	19,24
	dfb	19,23
	dfb	41,24
	dfb	41,23
	dfb	10,11
	dfb	14,15
	dfb	12,07
	dfb	12,06
	dfb	09,38
	dfb	12,13
	dfb	12,13
	dfb	42,24
	dfb	19,22
	dfb	01,00
	dfb	03,00
	dfb	04,00
	dfb	02,01
	dfb	02,00
	dfb	04,00
	dfb	03,00
	dfb	01,00
	dfb	19,20
	dfb	43,22
	dfb	41,22
	dfb	41,22
	dfb	05,08
	dfb	05,06
	dfb	05,07
	dfb	05,08
	dfb	17,00
	dfb	05,08
	dfb	16,00
	dfb	36,37
	dfb	36,37
	dfb	40,00
	dfb	39,00
	dfb	19,31
	dfb	41,31
	dfb	01,00
	dfb	04,00
	dfb	26,27
	dfb	02,00
	dfb	01,00
	dfb	04,00
	dfb	02,00
	dfb	01,00
	dfb	04,00
	dfb	02,00
	dfb	32,33
	dfb	26,27
	dfb	44,27
	dfb	19,21
	dfb	19,15
	dfb	41,21
	dfb	41,15
	dfb	45,21
	dfb	02,00
	dfb	03,00
	dfb	09,30
	dfb	45,30
	dfb	17,00
	dfb	46,29
	dfb	09,29
	dfb	46,30
	dfb	12,13
	dfb	19,27
	dfb	41,27
	dfb	14,48
	dfb	14,48
	dfb	41,27
	dfb	01,00
	dfb	41,21
	dfb	19,24
	
*--- On commence ˆ index 0

nbC	=	1

tblC$	da	$bdbd
	da	C$1
	
C$1	str	"."

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

C	ds	5+1
S	ds	25+1	; was P in Le manoir
X$1	ds	4+1	; premier mot saisi
X$2	ds	4+1	; second mot saisi
E$	ds	32	; the longest string

FIN_DATA

*--- The lazy decimal to hexadecimal conversion

tblD2H	dfb	0,10,20,30,40,50,60,70,80,90

*-----------------------------------
* LES AUTRES FICHIERS
*-----------------------------------

	put	fr.s
	put	../common/musiques.s

*--- It's the end
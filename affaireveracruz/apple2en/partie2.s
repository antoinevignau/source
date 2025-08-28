*
* L'affaire Vera Cruz
*
* (c) Gilles Blancon
* (c) 1985, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* MACRO
*-------------------------------

@perso	mac
	lda	#]1
	ldx	#]2
	jsr	messPERSO
	<<<

*-------------------------------
* EXTERNALS
*-------------------------------
* cadre 462,7 a 621,102
* 480,15 a 605,94

	ext	persoABDOULAH
	ext	persoBLANCG
	ext	persoBLANCP
	ext	persoCRUZ
	ext	persoDELARUE
	ext	persoDELROCHE
	ext	persoDUPLAT
	ext	persoKOWALSKI
	ext	persoLAFEUILLE
	ext	persoMARTIN
	ext	persoZIEGLER

*---

NBA	=	65

NOM_DEBUT	=	1
NOM_FIN	=	33
ADR_DEBUT	=	40
ADR_FIN	=	62

iABDOULAH	=	1
iHOCINE	=	2
iFRISE	=	3
iZIEGLER	=	4
iPHILIBERT	=	5
iMANOUCHE	=	6
iKOWALSKI	=	7
iSTANISLAS	=	8
iBLANC	=	9
iGILLES	=	10
iPHILIPPE	=	11
iDELARUE	=	12
iEVA	=	13
iCRUZ	=	14
iVERA	=	15
iLAFEUILLE	=	16
iNADINE	=	17
iDELROCHE	=	18
iHUBERT	=	19
iMARTIN	=	20
iNESTOR	=	21
iVOISIN	=	22
iDUPLAT	=	23
iSIMONE	=	24
iCONCIERGE	=	25
i6151SZ42	=	26
i9111CD69	=	27
iMAC	=	28
iDOUILLE	=	29
i56743	=	30
iTE9	=	31
i3POINT79	=	32
i3TIRET79	=	33
iBALAY	=	40
iBIJOUTERIE	=	41
iCARNOT	=	42
iGARE	=	43
iPEUPLIERS	=	44
iROUTIER	=	45
iTERREAUX	=	46
iZOLA	=	47
iCLERMONT	=	48
iETIENNE	=	49
iGALMIER	=	50
iLYON	=	51
iMONTBRISSON	=	52
iPAUL	=	53
iPARIS	=	54
iCIAT	=	55
iGIE	=	56
iPREFECTURE	=	57
iCRRJ	=	58
iBDRJ	=	59
iPRISON	=	60
iAUTOPSIE	=	61
iGRAPHOLOGIE	=	62

@geta	mac
	ldx	#]1
	jsr	geta
	<<<
	
*-------------------------------
* PARTIE 2
*-------------------------------

partie2	ldx	#8
	ldy	#9
	jsr	SETCHARSINFO

*--- Load files

	lda	#pFOND1	; charge le fond 1
	ldx	ptrFOND1+2
	ldy	ptrFOND1
	jsr	loadFILE

	lda	#pFOND2	; charge le fond 2
	ldx	ptrFOND2+2
	ldy	ptrFOND2
	jsr	loadFILE

	lda	#$6060	; double RTS
	sta	playSOUND

	jsr	switch640

	lda	#indexWHITE
	jsr	setBORDER

	jmp	:100

*-------------------------------

:80	rts	; POKE, CALL, and RETURN

*-------------------------------

:100	jsr	afficheFOND1
:110	jsr	afficheMENU
:120	jsr	translateKEYONLY
	cmp	#chrRET
	beq	:120
	
	tax

	lda	taskMODIFIERS	; test open-apple keys
	and	#appleKey
	cmp	#appleKey
	bne	p2M	; none...

	cpx	#'Q'	; quit
	bne	p2R
	rts
p2R	cpx	#'R'	; restart
	bne	p2Z
	jmp	resetALL
p2Z	cpx	#'M'
	bne	:120
	jmp	toggleMUSIC

p2M	cpx	#'M'
	bne	p2D
	jmp	doMESSAGERIE
p2D	cpx	#'S'	; Statement
	bne	p2E
	jmp	doDEPOSITION
p2E	cpx	#'E'
	bne	p2I
	jmp	doEXAMEN
p2I	cpx	#'I'
	bne	p2C
	jmp	doIMPRIMANTE
p2C	cpx	#'C'
	bne	p2A
	jmp	doCOMPARAISON
p2A	cpx	#'A'
	bne	:120
	jmp	doACCUSATION

*-------------------------------
* INIT ALL VARIABLES
*-------------------------------

resetALL	sep	#$20
	ldx	#DATA_IN
]lp	stz	DATA_IN,x
	inx
	cpx	#DATA_OUT
	bcc	]lp
	rep	#$20
	jmp	:100

*-------------------------------
* PLAY/STOP MUSIC
*-------------------------------

toggleMUSIC	jsr	doMUSIK
	jmp	:120

*-------------------------------
* ROUTINES DU JEU
*-------------------------------

:300
doIMPRIMANTE	jmp	:1600

*	jsr	afficheFOND1	; inverse imprimante
*	jmp	:110

*-------------------------------

printLINE	jsr	SETBLACKCHARS

	lda	ecran
	cmp	#FALSE
	beq	printLINE1

	@locate	#1;#5;#19	; Message screen
	bra	printLINE2
	
printLINE1	@locate	#1;#3;#19	; All other screens
	
printLINE2	jsr	scrollME
	
	lda	#A$
	ldx	textX
	ldy	textY
	jsr	PRINTCSTRING
	jmp	SETWHITECHARS

*-------------------------------

playLIGNE	lda	#idxSNDLIGNE	; play the LIGNE sound
	jsr	playSOUND

playRETOUR	ldx	#idxSNDRETOUR
	jmp	playSOUND

:580	inc	nn	; PLAY SOUND
	lda	nn
	cmp	#1
	bne	:581

	ldx	#idxSNDMODEM
	jsr	playSOUND

:581	cmp	#3
	bne	:582

	ldx	#1
]lp	inx
	cpx	#150
	bcc	]lp
	stz	nn
	rts

:582	rts

*-------------------------------
* MESSAGERIE
*-------------------------------

doMESSAGERIE	jsr	afficheFOND1	; fond1 avec refresh de l'ecran
	jsr	afficheMENU

	lda	#TRUE
	sta	ecran
	
*--- Affiche les entrées

	ldx	#360
	ldy	#22
	lda	#texteORIGCFD
	jsr	PRINTCSTRING

*--- Saisie de l'organisme destinataire
	
	ldx	#400
	ldy	#31
	jsr	GOTOXY
	
	lda	#C$
	ldx	#25	; len
	jsr	GETLN1	; get string
	lda	#C$
	jsr	rewriteSTRING	; rewrite it into UPPERCASE

*--- Saisie du message
	
	ldx	#360	; Saisie du message
	ldy	#46
	jsr	GOTOXY

	lda	#B$
	ldx	#25	; len
	jsr	GETLN1	; get string
	lda	#B$
	jsr	rewriteSTRING	; rewrite it into UPPERCASE

	lda	textX
	clc
	adc	#8
	tax
	ldy	textY
	lda	#texteSTOP	; add .STOP.
	jsr	PRINTCSTRING
	jsr	checkENTRIES	; check entries

*--- Gestion des actions

	@geta	#iCIAT
	bne	noCIAT
	jmp	doCIAT
noCIAT	@geta	#iGIE
	bne	noGIE
	jmp	doGIE
noGIE	@geta	#iPREFECTURE
	bne	noPREFECTURE
	jmp	doPREFECTURE
noPREFECTURE	@geta	#iCRRJ
	bne	noCRRJ
	jmp	doCRRJ
noCRRJ	@geta	#iBDRJ
	bne	noBDRJ
	jmp	doBDRJ
noBDRJ	@geta	#iPRISON
	bne	noPRISON
	jmp	doPRISON
noPRISON

*--- Actions standards

messINCONNU	ldx	#texteINCONNU	; DESTINATAIRE INCONNU.STOP.
	lda	#A$
	jsr	LET
	jmp	finMESSAGERIE

messNONCONCERNE	ldx	#texteCONCERNE	; DESTINATAIRE NON CONCERNE.STOP.
	lda	#A$
	jsr	LET

finMESSAGERIE	jsr	playLIGNE	; print sound
	jsr	printLINE	; print string
	stz	A$	; empty string
	jsr	playLIGNE	; print sound
	jsr	printLINE	; print string
	jmp	:120	; loop

messPASREVEILLE	ldx	#texteREVEILLE
	lda	#A$
	jsr	LET
	jmp	finMESSAGERIE

:692	ldx	#texteGIESTC
	lda	#C$
	jsr	LET
	jsr	messAFFICHE

*	lda	#5
*	sta	m
*	lda	#data2550
*	jsr	RESTORE
*	jsr	printDATA
*	jsr	messEOL
	jmp	:120

messAFFICHE	ldx	#texteORIG	; affiche A$ "ORIG"
	lda	#A$
	jsr	LET
	
	ldx	#0	; CHAIN... ahem...
	sep	#$20
]lp	lda	C$,x
	beq	messAFFICHE1
	sta	A$+5,x
	inx
	bne	]lp
messAFFICHE1	sta	A$+5,x	; put a trailing 0
	rep	#$20
	
	jsr	playLIGNE	; LINE SOUND
	jsr	printLINE	; print string

*	ldx	#C$	; affiche C$
*	lda	#A$
*	jsr	LET
*	jsr	playLIGNE
*	jsr	printLINE
	
	ldx	#texteDESTCFD	; affiche A$
	lda	#A$
	jsr	LET
	jsr	playLIGNE
	jsr	printLINE
	
messEOL	stz	A$
	jsr	playRETOUR	; CR SOUND
	jmp	printLINE	; print string

*--- Gestion des lieux

doCIAT	@geta	#iETIENNE
	bne	doCIAT600
	@geta	#iDELROCHE
	beq	doCIAT595
	@geta	#iHUBERT
	bne	doCIAT600
doCIAT595	@print	#8;#data1720	; 9 in FR

	lda	#1
	sta	p1
	jmp	:120

doCIAT600	@geta	#iLYON
	bne	doCIAT610
	@geta	#iGILLES
	bne	doCIAT610
	@geta	#iBLANC
	bne	doCIAT610
	@print	#11;#data1620	; 9 in FR
	jmp	:120
	
doCIAT610	@geta	#iPARIS
	bne	doCIAT620
	@geta	#iPHILIPPE
	bne	doCIAT620
	@geta	#iBLANC
	bne	doCIAT620
	@print	#6;#data1850	; was 7 in FR
	jmp	:120

doCIAT620	jmp	messNONCONCERNE

*---

doGIE	@geta	#iETIENNE
	bne	doGIE650
	jmp	messPASREVEILLE

doGIE650	@geta	#iMONTBRISSON
	bne	doGIE660
	@geta	#iKOWALSKI
	beq	doGIE655
	@geta	#iSTANISLAS
	bne	doGIE660
doGIE655	@print	#10;#data1640
	jmp	:120

doGIE660	@geta	#iGALMIER
	bne	doGIE670
	@geta	#iZIEGLER
	beq	doGIE665
	@geta	#iPHILIBERT
	bne	doGIE670
doGIE665	@print	#7;#data1780
	jmp	:120

doGIE670	@geta	#iCLERMONT
	bne	doGIE680
	
	lda	#1
	sta	ar

	@print	#4;#data1590
	jmp	:120
	
doGIE680	jmp	messNONCONCERNE

*---
	
doPREFECTURE	@geta	#iETIENNE
	bne	doPREFECTURE1
	@geta	#i6151SZ42
	bne	doPREFECTURE1
	@print	#4;#data1510
	jmp	:120
doPREFECTURE1	@geta	#iLYON
	bne	doPREFECTURE2
	@geta	#i9111CD69
	bne	doPREFECTURE2
	@print	#4;#data1520
	
	lda	#1
	sta	id
	jmp	:120
doPREFECTURE2	jmp	messNONCONCERNE

*---

doCRRJ	@geta	#iLYON
	beq	doCRJJ700
	jmp	messNONCONCERNE

doCRJJ700	@geta	#iABDOULAH
	beq	doCRJJ705
	@geta	#iHOCINE
	beq	doCRJJ705
	@geta	#iFRISE
	bne	doCRJJ710
doCRJJ705	@perso	#iABDOULAH;#presABDOULAH
	@print	#3;#data1530
	jmp	:120

doCRJJ710	@geta	#iZIEGLER
	beq	doCRJJ715
	@geta	#iPHILIBERT
	beq	doCRJJ715
	@geta	#iMANOUCHE
	bne	doCRJJ720
doCRJJ715	@perso	#iZIEGLER;#presZIEGLER
	@print	#6;#data1540
	jmp	:120

doCRJJ720	@geta	#iKOWALSKI
	beq	doCRJJ725
	@geta	#iSTANISLAS
	bne	doCRJJ730
doCRJJ725	@perso	#iKOWALSKI;#presKOWALSKI
	@print	#4;#data1550
	jmp	:120

doCRJJ730	@geta	#iBLANC
	bne	doCRJJ740
	@geta	#iGILLES
	bne	doCRJJ740
	@perso	#iGILLES;#presGBLANC
	@print	#6;#data1600
	jmp	:120
	
doCRJJ740	@geta	#i3TIRET79
	beq	doCRJJ745
	@geta	#i3POINT79
	beq	doCRJJ745
	@geta	#iTE9
	beq	doCRJJ745
	@geta	#i56743
	bne	doCRJJ750
doCRJJ745	@geta	#iDOUILLE
	beq	doCRJJ748
	@geta	#iMAC
	bne	doCRJJ750
doCRJJ748	@print	#5;#data1580
	jmp	:120
	
doCRJJ750	@geta	#iDELARUE
	beq	doCRJJ755
	@geta	#iEVA
	bne	doCRJJ760
doCRJJ755	@perso	#iDELARUE;#presDELARUE
	@print	#5;#data1810
	jmp	:120
	
doCRJJ760	@geta	#iCRUZ
	beq	doCRJJ765
	@geta	#iVERA
	bne	doCRJJ770
doCRJJ765	@perso	#iCRUZ;#presCRUZ
	@print	#1;#data1830
	@print2	#4;#data1820
	jmp	:120
	
doCRJJ770	@geta	#iBLANC
	bne	doCRJJ780
	@geta	#iPHILIPPE
	bne	doCRJJ780
doCRJJ775	@perso	#iPHILIPPE;#presPBLANC
	@print	#3;#data1610
	jmp	:120

doCRJJ780	jmp	messNONCONCERNE

*---
	
doBDRJ	@geta	#iETIENNE
	beq	doBDRJ1
	jmp	messNONCONCERNE
doBDRJ1	@geta	#iBLANC
	beq	doBDRJ2
	jmp	messNONCONCERNE
doBDRJ2	@geta	#iPHILIPPE
	beq	doBDRJ3
	jmp	messNONCONCERNE
doBDRJ3	@print	#7;#data1840
	jmp	:120

*---

doPRISON	@geta	#iPAUL
	beq	doPRISON1
	jmp	messNONCONCERNE
doPRISON1	@geta	#iZIEGLER
	beq	doPRISON2
	jmp	messNONCONCERNE
doPRISON2	@print	#6;#data1860
	jmp	:120

*---

messPERSO	stx	pv	; chaîne du personnage
	sta	m	; index du personnage
	
	jsr	eraseTV	; efface le cadre

	ldx	#360	; affiche le texte
	ldy	#22
	lda	pv
	jsr	PRINTCSTRING

	ldx	m
	jmp	affichePERSO_ALT

*-------------------------------
* CHOIX PAR LISTE
*-------------------------------

checkENTRIES	lda	#dataNOMS	; names
	jsr	RESTORE

	ldx	#NOM_DEBUT	; start at position 1
]lp	lda	#A$
	jsr	READ	; read a value from DATA
	lda	#B$
	ldy	#A$	; compare with B$
	jsr	INSTR
	sep	#$20
	sta	a,x	; 0 if not equal, 1 if equal
	rep	#$20
	inx
	cpx	#NOM_FIN	; end at position 25
	bcc	]lp
	beq	]lp
	
	lda	#dataADRESSES	; locations
	jsr	RESTORE

	ldx	#ADR_DEBUT	; start at position 26
]lp	lda	#A$
	jsr	READ	; read a value from DATA
	lda	#C$
	ldy	#A$	; compare with C$
	jsr	INSTR
	sep	#$20
	sta	a,x	; 0 if not equal, 1 if equal
	rep	#$20
	inx
	cpx	#ADR_FIN	; end at position 39
	bcc	]lp
	beq	]lp
	rts

*-------------------------------
* DEPOSITION
*-------------------------------

doDEPOSITION	jsr	afficheFOND2	; fond2 avec refresh de l'ecran
	jsr	drawPERSO	; affiche le cadre noir (de Saumur)

	lda	#FALSE
	sta	ecran
	
	lda	#pvAUDITION
	sta	pv
	jsr	:1360

	ldx	#8	; DEPOSITION DE QUELLE PERSONNE ?
	ldy	#181
	lda	#texte41FR
	jsr	PRINTCSTRING
	lda	#B$
	ldx	#MAX_LEN
	jsr	GETLN1	; get string
	lda	#B$
	jsr	rewriteSTRING	; rewrite it into UPPERCASE
	
	jsr	eraseFOND

	ldx	#8	; OU TROUVEZ-VOUS CETTE PERSONNE ?
	ldy	#181
	lda	#texte42FR
	jsr	PRINTCSTRING
	lda	#C$
	ldx	#MAX_LEN
	jsr	GETLN1	; get string
	lda	#C$
	jsr	rewriteSTRING	; rewrite it into UPPERCASE

	jsr	checkENTRIES	; check entries
	jsr	afficheMENU	; affiche le menu principal
	jsr	affichePERSO

*---

	@geta	#iLAFEUILLE
	beq	doDEPO855
	@geta	#iNADINE
	bne	doDEPO860
doDEPO855	@geta	#iBALAY
	bne	doDEPO860

	lda	#TRUE
	sta	na
	@print2	#9;#data1560
	jmp	:120

doDEPO860	@geta	#iDELROCHE
	beq	doDEPO865
	@geta	#iHUBERT
	bne	doDEPO870
doDEPO865	@geta	#iETIENNE
	bne	doDEPO870

	lda	#TRUE
	sta	hu
	@print2	#13;#data1700
	jmp	:120

doDEPO870	@geta	#iMARTIN
	beq	doDEPO875
	@geta	#iVOISIN
	beq	doDEPO875
	@geta	#iNESTOR
	bne	doDEPO880
doDEPO875	lda	#TRUE
	sta	ma
	@print2	#12;#data1680
	jmp	:120

doDEPO880	@geta	#iDUPLAT
	beq	doDEPO885
	@geta	#iCONCIERGE
	beq	doDEPO885
	@geta	#iSIMONE
	bne	doDEPO890
doDEPO885	lda	#TRUE
	sta	du
	@print2	#13;#data1660
	jmp	:120

doDEPO890	@geta	#iZIEGLER
	beq	doDEPO895
	@geta	#iMANOUCHE
	beq	doDEPO895
	@geta	#iPHILIBERT
	bne	doDEPO900
doDEPO895	@geta	#iCARNOT
	bne	doDEPO900
	
	lda	#TRUE
	sta	zi
	
	lda	ph
	cmp	#TRUE
	bne	doDEPO898
	lda	#TRUE
	sta	zi1
	@print2	#14;#data1950
	jmp	:120
doDEPO898	@print2	#11;#data1740
	jmp	:120

doDEPO900	@geta	#iABDOULAH
	beq	doDEPO905
	@geta	#iFRISE
	beq	doDEPO905
	@geta	#iHOCINE
	bne	doDEPO910
doDEPO905	@geta	#iPEUPLIERS
	bne	doDEPO910
	
	lda	#TRUE
	sta	me
	@print2	#13;#data1760
	jmp	:120

doDEPO910	@geta	#iDELARUE
	beq	doDEPO915
	@geta	#iEVA
	bne	doDEPO920
doDEPO915	@geta	#iROUTIER
	bne	doDEPO920

	lda	#TRUE
	sta	de
	@print2	#12;#data1790
	jmp	:120

doDEPO920	@geta	#iGILLES
	beq	doDEPO922
	@geta	#iBLANC
	bne	doDEPO930
doDEPO922	@geta	#iGARE
	bne	doDEPO930

	lda	#TRUE
	sta	gi

	lda	ph
	cmp	#TRUE
	bne	doDEPO925
	lda	zi1
	cmp	#TRUE
	bne	doDEPO925
	lda	ko1
	cmp	#TRUE
	bne	doDEPO925
	
	lda	#TRUE
	sta	gi1
	@print2	#14;#data1980
	jmp	:120
doDEPO925	@print2	#11;#data1870	; 12 in FR
	jmp	:120

doDEPO930	@geta	#iPHILIPPE
	beq	doDEPO932
	@geta	#iBLANC
	bne	doDEPO940
doDEPO932	@geta	#iTERREAUX
	bne	doDEPO940

	lda	id
	cmp	#TRUE
	bne	doDEPO940

	lda	#TRUE
	sta	ph

	lda	gi1
	cmp	#TRUE
	bne	doDEPO935
	
	lda	#TRUE
	sta	ph1
	@print2	#14;#data2000
	jmp	:120
doDEPO935	@print2	#9;#data1890
	jmp	:120

doDEPO940	@geta	#iKOWALSKI
	beq	doDEPO945
	@geta	#iSTANISLAS
	bne	doDEPO950
doDEPO945	@geta	#iZOLA
	bne	doDEPO950

	lda	#TRUE
	sta	ko
	
	lda	ph
	cmp	#TRUE
	bne	doDEPO948

	lda	#TRUE
	sta	ko1
	@print2	#12;#data1930
	jmp	:120
doDEPO948	@print2	#9;#data1910	; 10 in FR
	jmp	:120

doDEPO950	jmp	:1600

*-------------------------------
* EXAMEN
*-------------------------------

doEXAMEN	jsr	afficheFOND2	; fond1 sans refresh de l'ecran

	lda	#FALSE
	sta	ecran
	
	ldx	#8	; QUEL EXAMEN ?
	ldy	#181
	lda	#texte47FR
	jsr	PRINTCSTRING
	lda	#C$
	ldx	#MAX_LEN
	jsr	GETLN1	; get string
	lda	#C$
	jsr	rewriteSTRING	; rewrite it into UPPERCASE
	
	@let	#B$;#C$	; C$ => B$
	
	jsr	checkENTRIES	; check entries
	jsr	afficheMENU	; affiche le menu principal
	
	@geta	#iAUTOPSIE
	bne	doGRAPHO
	@geta	#iCRUZ
	beq	doAUTOPSIE
	@geta	#iVERA
	bne	endEXAMEN

doAUTOPSIE	lda	#pvAUTOPSIE
	sta	pv
	jsr	:1360
	
	lda	#6	; l'autopsie de Vera
	sta	m
	lda	#autopsieVERA
	jsr	RESTORE
	jsr	:1390
	jmp	:120

endEXAMEN	jmp	:1600	; sans intérêt

doGRAPHO	lda	ec	; avait-on trouvé la lettre ?
	cmp	#TRUE
	bne	endEXAMEN	; non

	@geta	#iCRUZ
	beq	doGRAPHOV
	@geta	#iVERA
	beq	doGRAPHOV

	@geta	#iBLANC
	bne	endEXAMEN
	@geta	#iGILLES
	bne	endEXAMEN
	
	lda	gi
	cmp	#TRUE
	bne	endEXAMEN

	lda	#TRUE
	sta	gr

	jsr	doGRAPHOH
	lda	#4	; see below...
	sta	m
	lda	#graphoGILLES
	jsr	RESTORE
	jsr	:1390
	jmp	:120
		
doGRAPHOV	jsr	doGRAPHOH
	lda	#4	; ...lazy programmer
	sta	m
	lda	#graphoVERA
	jsr	RESTORE
	jsr	:1390
	jmp	:120

doGRAPHOH	lda	#pvGRAPHOLOGIE
	sta	pv
	jmp	:1360

*-------------------------------
* IMPRESSION CAROLL
*-------------------------------

:1360	jsr	SETBLACKCHARS

	@locate	#1;#3;#19
	lda	#texteENTETE1
	jsr	printME
	@locate	#1;#3;#19
	lda	#texteENTETE2
	jsr	printME
	@locate	#1;#3;#19
	lda	#texteENTETE3
	ldx	textX
	ldy	textY
	jsr	PRINTCSTRING
	lda	pv
	jsr	printME
	@locate	#1;#3;#19
	lda	#texteENTETE4
	jsr	printME

	jmp	SETWHITECHARS

*-------------------------------
* CHR$(amstrad)
* https://en.wikipedia.org/wiki/Amstrad_CPC_character_set
*   1 01	return character
*   7 07	beep
*   8 08	left cursor (really move cursor)
*  16 10	return character
*  24 18	inverse ink <-> background
* 128 80	return character
* 143 8F	black block
* 154 9A	large -
* 209 D1	I (pipe fermant)
* 211 D3	I (pipe ouvrant)
* 243 F3	->
* 255 FF	<->

:1390	jsr	SETBLACKCHARS

	lda	#1
	sta	t
	
]lp	jsr	scrollME

:1392	lda	#A$
	jsr	READ
	jsr	:580

	lda	#1
	ldx	#3
	ldy	#19
	jsr	LOCATE

	lda	#A$
	ldx	textX
	ldy	textY
	jsr	PRINTCSTRING

*---

	inc	t
	lda	t
	cmp	m
	bcc	]lp
	beq	]lp

	stz	m
	jmp	SETWHITECHARS

*--- 0,7,158,318

printME	ldx	textX
	ldy	textY
	jsr	PRINTCSTRING

scrollME	PushLong	#scrollRECT	; scroll rect and reset background
	PushWord	#0
	PushWord	#-8
	PushLong	#0
	_ScrollRect

	PushLong	#fondLocInfoPtr
	PushLong	#fondRect
	PushWord	#0
	PushWord	#150
	PushWord	#modeCopy
	_PPToPort
	rts

*---
	
scrollRECT	dw	0,10,158,320
fondRect	dw	148,0,158,320	; 150

*-------------------------------
* PRINT STRING DATA
*-------------------------------

printDATA	lda	#1	; FOR n=1 to M
	sta	n

]lp	lda	#A$	; READ A$
	jsr	READ
	
	jsr	playLIGNE	; make sound
	jsr	printLINE	; print text
	jsr	playRETOUR
	
	inc	n	; NEXT n
	lda	n
	cmp	m
	bcc	]lp
	beq	]lp
	
	rts

*-------------------------------
* COMPARAISON
*-------------------------------

doCOMPARAISON	jsr	afficheFOND1	; fond1 avec refresh de l'ecran

	lda	#TRUE
	sta	ecran
	
	ldx	#8	; COMPARAISON DES ELEMENTS CONNUS AVEC QUI ?
	ldy	#181
	lda	#texte43FR
	jsr	PRINTCSTRING
	lda	#B$
	ldx	#MAX_LEN
	jsr	GETLN1	; get string
	lda	#B$
	jsr	rewriteSTRING	; rewrite it into UPPERCASE
	jsr	checkENTRIES

	@geta	#iZIEGLER
	beq	doCOMP1205
	@geta	#iPHILIBERT
	bne	doCOMP1210
doCOMP1205	lda	zi
	cmp	#TRUE
	bne	doCOMP1210
	jmp	doCOMP1240

doCOMP1210	@geta	#iGILLES
*	beq	doCOMP1215
*	@geta	#iBLANC
	bne	doCOMP1220
doCOMP1215	lda	gi	; BUG
	cmp	#TRUE
	bne	doCOMP1220
	jmp	doCOMP1270

doCOMP1220	@geta	#iPHILIPPE
*	beq	doCOMP1225
*	@geta	#iBLANC
	bne	doCOMP1230
doCOMP1225	lda	ph
	cmp	#TRUE
	bne	doCOMP1230
	jmp	doCOMP1310

doCOMP1230	jmp	:1600

*--- Ziegler

doCOMP1240	lda	na
	cmp	#TRUE
	bne	doCOMP1250

	@print2	#2;#data1240
	
doCOMP1250	lda	ma
	cmp	#TRUE
	beq	doCOMP1255
	lda	p1
	cmp	#TRUE
	bne	doCOMP1260

doCOMP1255	@print2	#1;#data1250

doCOMP1260	lda	na
	ora	ma
	ora	p1
	cmp	#FALSE
	beq	doCOMP1265
	jmp	:110
doCOMP1265	jmp	:1600

*--- Gilles Blanc

doCOMP1270	lda	ro
	cmp	#TRUE
	bne	doCOMP1280
	
	@print2	#1;#data1270

doCOMP1280	lda	du
	cmp	#TRUE
	bne	doCOMP1290

	@print2	#3;#data1280

doCOMP1290	lda	gr
	cmp	#TRUE
	bne	doCOMP1300

	@print2	#2;#data1290

doCOMP1300	lda	ro
	ora	du
	ora	gr
	cmp	#FALSE
	beq	doCOMP1305
	jmp	:110
doCOMP1305	jmp	:1600

*--- Philippe Blanc

doCOMP1310	stz	tot

	lda	og
	cmp	#TRUE
	bne	doCOMP1320
	inc	tot

	@print2	#3;#data1310

doCOMP1320	lda	bo
	cmp	#TRUE
	bne	doCOMP1330
	inc	tot

	@print2	#2;#data1320

doCOMP1330	lda	do
	cmp	#TRUE
	bne	doCOMP1340
	inc	tot

	@print2	#2;#data1330

doCOMP1340	lda	ar
	cmp	#TRUE
	bne	doCOMP1350
	inc	tot

	@print2	#3;#data1340

doCOMP1350	lda	tot
	cmp	#2
	bcc	doCOMP1360
	beq	doCOMP1360
	
	lda	#TRUE
	sta	ga

doCOMP1360	lda	tot
	cmp	#0
	beq	doCOMP1365
	jmp	:110
doCOMP1365	jmp	:1600

*-------------------------------
* ACCUSATION
*-------------------------------

doACCUSATION	jsr	afficheFOND2	; fond2 avec refresh de l'ecran
	jsr	eraseFOND	; refresh cadre bas uniquement

	lda	#FALSE
	sta	ecran
	
	ldx	#8	; QUI ARRETEZ-VOUS ?
	ldy	#181
	lda	#texte44FR
	jsr	PRINTCSTRING
	lda	#B$
	ldx	#MAX_LEN
	jsr	GETLN1	; get string
	lda	#B$
	jsr	rewriteSTRING	; rewrite it into UPPERCASE
	jsr	checkENTRIES	; check entries

	jsr	eraseFOND

	@geta	#iBLANC	; a-t-on le bon coupable ?
	bne	:1750
	@geta	#iPHILIPPE
	bne	:1750

	lda	ga	; a-t-on les bons indices ?
	cmp	#TRUE
	bne	:1760
	lda	ph1
	cmp	#TRUE
	bne	:1760

	lda	#12	; on a gagné alors !
	sta	m
	lda	#dataGAGNE
	jsr	RESTORE
	jsr	:1390
	jsr	playDECRESCENDO
	jsr	RDKEYONLY
	jmp	QUIT

:1750	ldx	#8	; IL VOUS MANQUE...
	ldy	#181
	lda	#texte45FR
	jsr	PRINTCSTRING
	jmp	:1610

:1760	ldx	#8	; CETTE ARRESTATION EST INSUFFISANTE
	ldy	#181
	lda	#texte45FR_2
	jsr	PRINTCSTRING
	jmp	:1610

*-------------------------------
* INVESTIGATION SANS INTERET
*-------------------------------

:1600	jsr	eraseFOND

	ldx	#8	; INVESTIGATION SANS INTERET
	ldy	#181
	lda	#texte48FR
	jsr	PRINTCSTRING

:1610	ldx	#566	; SUITE ->
	ldy	#197
	lda	#texte49FR
	jsr	PRINTCSTRING
	jsr	RDKEYONLY
	jmp	:110

*-------------------------------
* ROUTINES DE LA PARTIE 2
*-------------------------------

geta	lda	a,x
	and	#$ff
	cmp	#TRUE
	rts

afficheFOND1	lda	#TRUE
	jsr	fadeOUT

	ldx	ptrFOND1+2
	stx	fondLocInfoPtr+4
	ldy	ptrFOND1
	sty	fondLocInfoPtr+2
	lda	#TRUE
	jmp	fadeIN

*-------------------------------

afficheFOND2	lda	#TRUE
	jsr	fadeOUT

	ldx	ptrFOND2+2
	stx	fondLocInfoPtr+4
	ldy	ptrFOND2
	sty	fondLocInfoPtr+2
	lda	#TRUE
	jmp	fadeIN


*-------------------------------

afficheMENU	jsr	eraseFOND
	jsr	SETWHITECHARS
	
	ldx	#8	; Message
	ldy	#181
	lda	#texte31FR
	jsr	PRINTCSTRING

	ldx	#8	; Examen
	ldy	#189
	lda	#texte32FR
	jsr	PRINTCSTRING

	ldx	#232	; Deposition
	ldy	#181
	lda	#texte33FR
	jsr	PRINTCSTRING

	ldx	#232	; Comparaison
	ldy	#189
	lda	#texte34FR
	jsr	PRINTCSTRING

*	ldx	#480	; Imprimante
*	ldy	#181
*	lda	#texte35FR
*	jsr	PRINTCSTRING

	ldx	#480	; Accusation
	ldy	#181	; instead of 189
	lda	#texte36FR
	jsr	PRINTCSTRING
	rts

*---

eraseFOND	PushLong	#fondRECT	; efface le cadre du bas des fonds
	bra	eraseFRAME

eraseTV	PushLong	#tvRECT	; efface le cadre de la télévision
	bra	eraseFRAME

drawPERSO	PushLong	#persoRECT	; efface le cadre des personnages

eraseFRAME	PushWord	#$0000
	PushWord	#$0000
	_SpecialRect
	rts

*---

affichePERSO	ldx	#1	; start at position 1
]lp	lda	a,x	; 0 if not equal, 1 if equal
	and	#$ff
	cmp	#TRUE
	beq	affichePERSO1
skipPERSO	inx
	cpx	#NOM_FIN-2	; skip the car plates
	bcc	]lp
	beq	]lp
	rts		; nobody
	
affichePERSO1	cpx	#9	; BLANC is too generic
	beq	skipPERSO

affichePERSO_ALT
	dex
	txa
	asl
	tax
	lda	tblPERSO,x
	bpl	affichePERSO2
	rts
	
affichePERSO2	asl		; calcule l'adresse
	asl
	tax		; du sprite
	lda	ptrPERSO,x	; vue rue
	sta	persoLocPtr+2	; adresse du sprite
	lda	ptrPERSO+2,x
	sta	persoLocPtr+4

	PushLong	#persoLocPtr
	PushLong	#persoRectPtr
	PushWord	#473
	PushWord	#15
	PushWord	#modeCopy
	_PPToPort
	rts

*-------------------------------
* DATA
*-------------------------------

DATA_IN

bo	ds	2	; on n'a pas trouve le bouton noir
do	ds	2	; on n'a pas trouve le pistolet ni la douille
ec	ds	2	; on n'a pas trouve la lettre d'adieu
og	ds	2	; on n'a pas trouve la main gauche
ro	ds	2	; on n'a pas trouve le paquet de Rothmans

ar	ds	2	; ligne 670
de	ds	2	; ligne 910 - useless
du	ds	2	; ligne 880
ga	ds	2	; ligne 1350
gi	ds	2	; ligne 920
gi1	ds	2	; ligne 920
gr	ds	2	; ligne 1440
hu	ds	2	; ligne 860 - useless
id	ds	2	; ligne 690
ko	ds	2	; ligne 940 - useless
ko1	ds	2	; ligne 940
ma	ds	2	; ligne 870
me	ds	2	; ligne 900 - useless
na	ds	2	; ligne 900
p1	ds	2	; ligne 590
ph	ds	2	; ligne 930
ph1	ds	2	; ligne 930
tot	ds	2	; ligne 1310
zi	ds	2	; ligne 890
zi1	ds	2	; ligne 890

*---

ecran	ds	2
m	ds	2
n	ds	2
nn	ds	2
perso	ds	2	; personnage demandé
pv	ds	2
t	ds	2

a	ds	NBA	; 1..59

A$	ds	256	; string pointer
B$	ds	256	; string pointer
C$	ds	256	; string pointer

DATA_OUT

*---

pFOND1	strl	'@/data/fond1'
pFOND2	strl	'@/data/fond2'

fondRECT	dw	169,1,198,637
tvRECT	dw	15,361,110,607
persoRECT	dw	7,463,103,611	; 619

persoLocPtr	dw	mode640	; mode 640
	adrl	persoABDOULAH	; pointer to object
	dw	34
persoRectPtr	dw	0,0,80,136

*--- Index 7 is too generic, skip it

tblPERSO	dw	0,0,0,10,10,10,7,7
	dw	-1,1,2,4,4,3,3
	dw	8,8,5,5,9,9,9,6,6,6

ptrPERSO	adrl	persoABDOULAH	; 0
	adrl	persoBLANCG	; 1
	adrl	persoBLANCP	; 2
	adrl	persoCRUZ	; 3
	adrl	persoDELARUE	; 4
	adrl	persoDELROCHE	; 5
	adrl	persoDUPLAT	; 6
	adrl	persoKOWALSKI	; 7
	adrl	persoLAFEUILLE	; 8
	adrl	persoMARTIN	; 9
	adrl	persoZIEGLER	; 10

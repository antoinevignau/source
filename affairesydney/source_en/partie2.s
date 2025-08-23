*
* L'affaire Sydney
*
* (c) 1986, Gilles Blancon
* (c) 1986, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* EXTERNALS
*-------------------------------
* cadre 462,7 a 621,102
* 480,15 a 605,94

	ext	persoCONCIERGE
	ext	persoDECOL
	ext	persoDINALLO
	ext	persoEPOUSE
	ext	persoFILLE
	ext	persoFILS
	ext	persoLANGUILLE
	ext	persoLANGUILLE2
	ext	persoRENARD
	ext	persoSERVANTE
	ext	persoTEMOIN

*-------------------------------
* PARTIE 2
*-------------------------------

partie2	ldx	#8
	ldy	#9
	jsr	SETCHARSINFO

	lda	adphoto	; photo
	sta	pho
	lda	adempreinte	; empreinte
	sta	em
	lda	admegot	; megot
	sta	me
	sta	ca
	lda	addouille	; douille
	sta	do

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

	stz	x
	
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
p2D	cpx	#'S'
	bne	p2E
	jmp	doDEPOSITION
p2E	cpx	#'E'
	bne	p2I
	jmp	doEXAMEN
p2I	cpx	#'P'
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

:510	jsr	SETBLACKCHARS
	@locate	#1;#5;#19
	
	jsr	scrollME
	
	lda	#A$
	ldx	textX
	ldy	textY
	jsr	PRINTCSTRING
	jmp	SETWHITECHARS

*-------------------------------

:560	lda	#idxSNDLIGNE	; play the LIGNE sound
	jsr	playSOUND

:570	ldx	#idxSNDRETOUR
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

:590
doMESSAGERIE	jsr	afficheFOND1	; fond1 avec refresh de l'ecran
	jsr	:280
	
*--- Affiche les entrées

:340	ldx	#360
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

*---

	jsr	:750	; check entries
	
	ldx	#30
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:610
	jmp	:650
	
:610	ldx	#31	; GIE
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:615
	jmp	:680
:615	ldx	#39
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:620
	jmp	:680
	
:620	ldx	#32
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:630
	jmp	:700

:630	ldx	#33
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:640
	jmp	:720

:640	stz	x

	ldx	#texteINCONNU	; DESTINATAIRE INCONNU.STOP.
	lda	#A$
	jsr	LET
	jmp	:670

:650	ldx	#34
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:651
	jmp	:660
:651	ldx	#18
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:652
	jmp	:660

:652	jsr	:730
	lda	#5	; was 6 in French
	sta	m
	lda	#data2530
	jsr	RESTORE
	jsr	:1430
	jsr	:740
	jmp	:120

:660	stz	x
	ldx	#texteCONCERNE	; DESTINATAIRE NON CONCERNE.STOP.
	lda	#A$
	jsr	LET

:670	jsr	:560	; print sound
	jsr	:510	; print string
	stz	A$	; empty string
	jsr	:560	; print sound
	jsr	:510	; print string
	jmp	:120	; loop

:680	ldx	#34
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:681
	jmp	:690

:681	stz	x
	ldx	#texteREVEILLE
	lda	#A$
	jsr	LET
	jmp	:670

:690	ldx	#17
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:691
	jmp	:700

:691	ldx	#18
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:692
	jmp	:700

:692	ldx	#texteGIESTC
	lda	#C$
	jsr	LET
	jsr	:730
	lda	#5
	sta	m
	lda	#data2550
	jsr	RESTORE
	jsr	:1430
	jsr	:740
	jmp	:120

:700	ldx	#36
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:710
	jmp	:660

:710	ldx	#17	; PATRICK
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:711

	ldx	#18	; LANGUILLE
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:712

:711	ldx	#19
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:712
	jmp	:720

:712	lda	#1
	sta	id
	
	lda	#2
	jsr	CLS

	jsr	affichePERSO_ALT
	
	lda	#30551
	sta	z
	jsr	:80
	lda	#23751
	sta	z
	jsr	:80
	jsr	:730
	lda	#5
	sta	m
	lda	#data2520
	jsr	RESTORE
	jsr	:1430
	jsr	:740
	jmp	:120

:720	ldx	#34
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:721
	jmp	:660

:721	ldx	#18
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:722
	jmp	:660

:722	jsr	:730
	lda	#2	; was 3 in French
	sta	m
	lda	#data2540
	jsr	RESTORE
	jsr	:1430
	jsr	:740
	jmp	:120

:730	ldx	#texteORIG	; affiche A$ "ORIG"
	lda	#A$
	jsr	LET
	
	ldx	#0	; CHAIN... ahem...
	sep	#$20
]lp	lda	C$,x
	beq	:732
	sta	A$+5,x
	inx
	bne	]lp
:732	sta	A$+5,x	; put a trailing 0
	rep	#$20
	
	jsr	:560	; LINE SOUND
	jsr	:510	; print string

*	ldx	#C$	; affiche C$
*	lda	#A$
*	jsr	LET
*	jsr	:560
*	jsr	:510
	
	ldx	#texteDESTCFD	; affiche A$
	lda	#A$
	jsr	LET
	jsr	:560
	jsr	:510
	
:740	stz	A$
	jsr	:570	; CR SOUND
	jmp	:510	; print string

*-------------------------------
* CHOIX PAR LISTE
*-------------------------------

:750	lda	#data2140	; names
	jsr	RESTORE

	ldx	#1	; start at position 1
]lp	lda	#A$
	jsr	READ	; read a value from DATA
	lda	#B$
	ldy	#A$	; compare with B$
	jsr	INSTR
	sep	#$20
	sta	a,x	; 0 if not equal, 1 if equal
	rep	#$20
	inx
	cpx	#25	; end at position 25
	bcc	]lp
	beq	]lp
	
:790	lda	#data2150	; locations
	jsr	RESTORE

	ldx	#26	; start at position 26
]lp	lda	#A$
	jsr	READ	; read a value from DATA
	lda	#C$
	ldy	#A$	; compare with C$
	jsr	INSTR
	sep	#$20
	sta	a,x	; 0 if not equal, 1 if equal
	rep	#$20
	inx
	cpx	#39	; end at position 39
	bcc	]lp
	beq	]lp
	rts
	

*-------------------------------
* DEPOSITION
*-------------------------------

:840
doDEPOSITION	jsr	afficheFOND2	; fond2 avec refresh de l'ecran
	jsr	drawPERSO	; affiche le cadre noir (de Saumur)

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

	jsr	:750	; check entries
	jsr	:280	; affiche le menu principal

*-- Affiche un éventuel personnage

	jsr	affichePERSO
	
*--

:860	ldx	#1
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:865
	ldx	#2
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:865
	ldx	#3
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:890

:865	jsr	:80

	lda	#3
	sta	m
	lda	#data1870
	jsr	RESTORE
	jsr	:1390

:870	lda	pa
	cmp	#0
	beq	:880
	
	lda	#2
	sta	jea
	
	lda	#4
	sta	m
	lda	#data1900
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:880	lda	#8
	sta	m
	lda	#data1880
	jsr	RESTORE
	jsr	:1390

:890	ldx	#27
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:940

	ldx	#4
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:900
	ldx	#5
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:940
	
:900	jsr	:80

	lda	#1
	sta	re

	lda	#6
	sta	m
	lda	#data1910
	jsr	RESTORE
	jsr	:1390

:910	lda	pho
	cmp	#0
	bne	:920

	lda	#2
	sta	m
	lda	#data1920
	jsr	RESTORE
	jsr	:1390

:920	lda	pho
	cmp	#1
	bne	:930

	lda	#2
	sta	re
	
	lda	#3
	sta	m
	lda	#data1930
	jsr	RESTORE
	jsr	:1390

:930	jmp	:120

:940	ldx	#26
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:944
:942	jmp	:1010

:944	ldx	#8
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:946
	
	ldx	#6
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:942
	
	ldx	#7
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:942

:946	jsr	:80

	lda	#3
	sta	m
	lda	#data1940
	jsr	RESTORE
	jsr	:1390

:950	lda	mar
	cmp	#1
	bne	:960
	
	lda	sy
	cmp	#2
	bne	:960

	lda	#5	; was 4 in French
	sta	m
	lda	#data2130
	jsr	RESTORE
	jsr	:1390
	jmp	:120
	
:960	lda	mar
	cmp	#0
	bne	:970
	
	lda	#1
	sta	mar

	lda	#4
	sta	m
	lda	#data1950
	jsr	RESTORE
	jsr	:1390
	jmp	:120
	
:970	lda	de
	cmp	#1
	bne	:980
	
	lda	#3
	sta	m
	lda	#data1970
	jsr	RESTORE
	jsr	:1390
	
:980	lda	re
	cmp	#2
	bne	:990
	
	lda	#6
	sta	m
	lda	#data1980
	jsr	RESTORE
	jsr	:1390
	jmp	:120
	
:990	lda	re
	cmp	#1
	bne	:1000
	
	lda	#3
	sta	m
	lda	#data1990
	jsr	RESTORE
	jsr	:1390
	
:1000	lda	#3
	sta	m
	lda	#data1960
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:1010	ldx	#26
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1014
:1012	jmp	:1060

:1014	ldx	#10
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1016
	
	ldx	#9
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1012
	
	ldx	#7
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1012

:1016	jsr	:80

	lda	#3
	sta	m
	lda	#data2000
	jsr	RESTORE
	jsr	:1390

:1020	lda	sy
	cmp	#0
	bne	:1030
	
	lda	#1
	sta	sy
	
	lda	#4
	sta	m
	lda	#data2010
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:1030	lda	re
	cmp	#2
	bne	:1040
	
	lda	pe
	cmp	#2
	bne	:1040

	lda	#2
	sta	sy

	lda	#3
	sta	m
	lda	#data2030
	jsr	RESTORE
	jsr	:1390
	
:1040	lda	re
	cmp	#2
	bne	:1050
	
	lda	pe
	cmp	#2
	bcs	:1050

	lda	#3
	sta	m
	lda	#data2020
	jsr	RESTORE
	jsr	:1390
	
:1050	lda	#2
	sta	m
	lda	#data2380
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:1060	ldx	#29
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1064
:1062	jmp	:1140
	
:1064	ldx	#13
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1066

	ldx	#14
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1062

:1066	jsr	:80

	lda	#3
	sta	m
	lda	#data2260
	jsr	RESTORE
	jsr	:1390
	
:1070	lda	pa
	cmp	#4
	bcc	:1080
	beq	:1080
	
	lda	tin
	cmp	#4
	bcc	:1080
	beq	:1080
	
	lda	gagne
	cmp	#1
	bne	:1080

	lda	#6
	sta	tin
	
	lda	#10	; was 11 in French
	sta	m
	lda	#data2330
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:1080	lda	do2
	cmp	#1
	bne	:1090
	lda	em1
	cmp	#1
	bne	:1090
	lda	ba2
	cmp	#1
	bne	:1090
	lda	tin
	cmp	#3
	bcc	:1090
	beq	:1090
	
	lda	#5
	sta	tin

	lda	#4	; was 5 in French
	sta	m
	lda	#data2320
	jsr	RESTORE
	jsr	:1390
	jmp	:120
	
:1090	lda	pa
	cmp	#0
	beq	:1100

	lda	#4
	sta	tin

	lda	#5	; was 6 in French
	sta	m
	lda	#data2310
	jsr	RESTORE
	jsr	:1390
	jmp	:120
	
:1100	lda	tin
	cmp	#0
	bne	:1110
	
	lda	#1
	sta	tin

	lda	#7
	sta	m
	lda	#data2270
	jsr	RESTORE
	jsr	:1390
	jmp	:120
	
:1110	lda	lu
	cmp	#3
	bne	:1120
	
	lda	#3
	sta	tin
	
	lda	#3
	sta	m
	lda	#data2300
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:1120	lda	lu
	cmp	#2
	bne	:1130
	
	lda	#2
	sta	tin

	lda	#2
	sta	m
	lda	#data2280
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:1130	lda	#2
	sta	m
	lda	#data2290
	jsr	RESTORE
	jsr	:1390
	jmp	120

:1140	ldx	#15
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1170
	
	ldx	#28
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1170
	
	jsr	:80

	lda	#3
	sta	m
	lda	#data2040
	jsr	RESTORE
	jsr	:1390

:1150	lda	de
	cmp	#0
	bne	:1160
	
	lda	#1
	sta	de
	
	lda	#5
	sta	m
	lda	#data2050
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:1160	lda	de
	cmp	#1
	bne	:1170
	
	lda	#3
	sta	m
	lda	#data2060
	jsr	RESTORE
	jsr	:1390
	jmp	:120
	
:1170	ldx	#12
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1174
	
	ldx	#11
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1172
	
	ldx	#7
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1174
	
:1172	jmp	:1220

:1174	jsr	:80

	lda	#3
	sta	m
	lda	#data2350
	jsr	RESTORE
	jsr	:1390
	
:1180	lda	lu
	cmp	#0
	bne	:1190
	
	lda	#1
	sta	lu

	lda	#3
	sta	m
	lda	#data2360
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:1190	lda	tin
	cmp	#1
	bne	:1200
	
	lda	#2
	sta	lu
	
	lda	#4
	sta	m
	lda	#data2370
	jsr	RESTORE
	jsr	:1390
	jmp	:120
	
:1200	lda	tin
	cmp	#2
	bne	:1210

	lda	#3
	sta	lu

	lda	#4
	sta	m
	lda	#data2390
	jsr	RESTORE
	jsr	:1390
	jmp	:120
	
:1210	lda	#2
	sta	m
	lda	#data2380
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:1220	lda	id
	cmp	#1
	bne	:1222

	ldx	#35
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1222

	ldx	#17
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1224
	
	ldx	#18
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1224
	
:1222	jmp	:1300

:1224	jsr	:80

	lda	#3
	sta	m
	lda	#data2160
	jsr	RESTORE
	jsr	:1390
	
:1230	lda	tin
	cmp	#5
	bcc	:1250
	beq	:1250
	
	lda	#6
	sta	pa
	
	lda	#11
	sta	m
	lda	#data2220
	jsr	RESTORE
	jsr	:1390
	
:1240	jsr	RDKEY
	jsr	:1350

	lda	#8
	sta	m
	lda	#data2240
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:1250	lda	pa
	cmp	#0
	bne	:1260
	
	lda	#1
	sta	pa

	lda	#3
	sta	m
	lda	#data2170
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:1260	lda	ba1
	cmp	#1
	bne	:1270
	
	lda	#5
	sta	pa

	lda	#3
	sta	m
	lda	#data2210
	jsr	RESTORE
	jsr	:1390
	
:1270	lda	em1
	cmp	#1
	bne	:1280
	
	lda	#4
	sta	m
	lda	#data2190
	jsr	RESTORE
	jsr	:1390
	
:1280	lda	do2
	cmp	#1
	bne	:1290
	
	lda	#2
	sta	m
	lda	#data2200
	jsr	RESTORE
	jsr	:1390
	
:1290	lda	#2
	sta	m
	lda	#data2180
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:1300	ldx	#26
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1304
:1302	jmp	:1330

:1304	ldx	#20
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1306

	ldx	#21
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1306
	
	ldx	#22
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1302

:1306	jsr	:80

	lda	#3
	sta	m
	lda	#data2070
	jsr	RESTORE
	jsr	:1390
	
:1310	lda	pe
	cmp	#0
	beq	:1320
	
	lda	re
	cmp	#2
	bne	:1320

	lda	#2
	sta	pe

	lda	#4
	sta	m
	lda	#data2090
	jsr	RESTORE
	jsr	:1390
	jmp	:120
	
:1320	lda	#1
	sta	pe

	lda	#4
	sta	m
	lda	#data2080
	jsr	RESTORE
	jsr	:1390
	jmp	:120

:1330	ldx	#26
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1334
:1332	jmp	:120

:1334	ldx	#24
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1336
	
	ldx	#25
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1332

:1336	jsr	:80

	lda	he
	clc
	adc	#1
	sta	he

	lda	#6
	sta	m
	lda	#data2100
	jsr	RESTORE
	jsr	:1390
	
:1340	lda	he
	cmp	#1
	bcc	:1342
	beq	:1342
	
	lda	#3	; was 2 in French
	sta	m
	lda	#data2120
	jsr	RESTORE
	jsr	:1390
:1342	jmp	:120

*---

:1350	@cls	#1
	@locate	#1;#1;#20
	
	lda	#254
	jsr	COUT160
	
	ldx	#1
]lp	phx
	lda	#253
	jsr	COUT160
	plx
	inx
	cpx	#37
	bcc	]lp
	beq	]lp

	@locate	#1;#39;#20
	
	lda	#255
	jmp	COUT160

*-------------------------------
* EXAMEN
*-------------------------------

doEXAMEN	jsr	afficheFOND2	; fond1 sans refresh de l'ecran

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
	
	jsr	:750	; check entries
	jsr	:280	; affiche le menu principal
	
	ldx	#37
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1640
	ldx	#7
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1650

:1640	ldx	#38
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1660
	jmp	:1600	; investigation sans interet

:1650	jsr	:80	; autopsie
	lda	#pvAUTOPSIE
	sta	pv
	lda	#10
	sta	m
	jsr	:1360
	lda	#data1810
	jsr	RESTORE
	jsr	:1390
	lda	#1
	sta	aut
	jmp	:120
	
:1660	jsr	:80	; balistique
	lda	#pvBALISTIQUE
	sta	pv
	lda	#5
	sta	m
	jsr	:1360
	lda	#data1830
	jsr	RESTORE
	jsr	:1390

:1670	lda	aut
	cmp	#1
	bne	:1680
	
	lda	#3
	sta	m
	lda	#data1840
	jsr	RESTORE
	jsr	:1390

:1680	lda	do
	cmp	#1
	bne	:1690
	
	lda	do1
	cmp	#0
	bne	:1690
	
	lda	#3
	sta	m
	lda	#data1850
	jsr	RESTORE
	jsr	:1390

:1690	lda	do1
	cmp	#1
	bne	:1700

	lda	#1
	sta	do2
	
	lda	#3
	sta	m
	lda	#data1860
	jsr	RESTORE
	jsr	:1390

:1700	jmp	:110

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

:1430	lda	#1	; FOR n=1 to M
	sta	n

]lp	lda	#A$	; READ A$
	jsr	READ
	
	jsr	:560	; make sound
	jsr	:510	; print text
	jsr	:570
	
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

	ldx	#8	; COMPARAISON DES ELEMENTS CONNUS AVEC QUI ?
	ldy	#181
	lda	#texte43FR
	jsr	PRINTCSTRING
	lda	#B$
	ldx	#MAX_LEN
	jsr	GETLN1	; get string
	lda	#B$
	jsr	rewriteSTRING	; rewrite it into UPPERCASE
	jsr	:750

*---

:1450	ldx	#17
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1455
	
	ldx	#18
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1460

:1455	lda	pa	; IF PA>0
	cmp	#0
	beq	:1460

	jsr	:280
	jmp	:1470
	
:1460	ldx	#14
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1465
	
	ldx	#13
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1466

:1465	lda	tin
	cmp	#0
	bne	:1467
:1466	jmp	:1600
	
:1467	jsr	:280
	jmp	:1560

:1470	lda	#1
	sta	m
	lda	#data2400
	jsr	RESTORE
	jsr	:1430
	jsr	:740
	
	lda	#2
	sta	m
	lda	#data2410
	jsr	:1430

:1480	lda	jea
	cmp	#2
	bne	:1490

	lda	#1
	sta	rec
	
	lda	#2
	sta	m
	lda	#data2420
	jsr	RESTORE
	jsr	:1430

:1490	lda	do
	cmp	#1
	bne	:1500
	
	lda	#1	; useless
	sta	do1
	
	lda	#2
	sta	m
	lda	#data2430
	jsr	RESTORE
	jsr	:1430
	
:1500	lda	do2
	cmp	#1
	bne	:1510
	
	lda	#3	; was 2 in French
	sta	m
	lda	#data2440
	jsr	RESTORE
	jsr	:1430

:1510	lda	em
	cmp	#1
	bne	:1520

	lda	#1	; useless
	sta	em1
	
	lda	#2
	sta	m
	lda	#data2450
	jsr	RESTORE
	jsr	:1430

:1520	lda	ca
	cmp	#1
	bne	:1530
	
	lda	#1
	sta	m
	lda	#data2460
	jsr	RESTORE
	jsr	:1430

:1530	lda	tin
	cmp	#3
	bcc	:1540
	beq	:1540
	
	lda	#1
	sta	ba1
	
	lda	#2	; was 3 in French
	sta	m
	lda	#data2470
	jsr	RESTORE
	jsr	:1430

:1540	lda	rec
	cmp	#1
	bne	:1550
	lda	do1
	cmp	#1
	bne	:1550
	lda	do2
	cmp	#1
	bne	:1550
	lda	em1
	cmp	#1
	bne	:1550
	lda	ca
	cmp	#1
	bne	:1550
	lda	ba1
	cmp	#1
	bne	:1550
	
	lda	#1
	sta	gagne

:1550	jmp	:110

:1560	lda	#1
	sta	m
	lda	#data2480
	jsr	RESTORE
	jsr	:1430
	jsr	:740
	
	lda	#2
	sta	m
	lda	#data2490
	jsr	RESTORE
	jsr	:1430

:1570	lda	tin1
	cmp	#1
	bne	:1580
	
	lda	ba1
	cmp	#1
	bne	:1580
	
	lda	#1
	sta	ba2
	
	lda	#3	; was 2 in French
	sta	m
	lda	#data2510
	jsr	RESTORE
	jsr	:1430

:1580	lda	pa	; IF PA>0
	cmp	#0
	beq	:1590

	lda	#1
	sta	tin1
	
	lda	#2
	sta	m
	lda	#data2500
	jsr	RESTORE
	jsr	:1430

:1590	jmp	:110

*-------------------------------
* ACCUSATION
*-------------------------------

doACCUSATION	jsr	afficheFOND2	; fond2 avec refresh de l'ecran
	jsr	eraseFOND	; refresh cadre bas uniquement

	ldx	#8	; QUI ARRETEZ-VOUS ?
	ldy	#181
	lda	#texte44FR
	jsr	PRINTCSTRING
	lda	#B$
	ldx	#MAX_LEN
	jsr	GETLN1	; get string
	lda	#B$
	jsr	rewriteSTRING	; rewrite it into UPPERCASE
	jsr	:750	; check entries
	stz	ga

	jsr	eraseFOND

:1720	ldx	#17
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1722
	
	ldx	#18
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1730

:1722	lda	pa
	cmp	#6
	bne	:1730
	
	inc	ga

:1730	ldx	#13
	lda	a,x
	and	#$ff
	cmp	#1
	beq	:1732
	
	ldx	#14
	lda	a,x
	and	#$ff
	cmp	#1
	bne	:1740

:1732	lda	tin
	cmp	#6
	bne	:1740

	inc	ga
	
:1740	lda	ga
	cmp	#1
	beq	:1760
	cmp	#2
	beq	:1770

	ldx	#8	; IL VOUS MANQUE...
	ldy	#181
	lda	#texte45FR
	jsr	PRINTCSTRING
	jmp	:1610

:1760	ldx	#8	; CETTE ARRESTATION EST INSUFFISANTE
	ldy	#181
	lda	#texte45FR_2
	jsr	PRINTCSTRING
	jmp	:1610
	
:1770	jsr	doSOUNDOFF	; stop muzak

	lda	#8
	sta	m
	
	lda	#pvFELICITATION
	sta	pv

	jsr	:1360
	
	lda	#data2560
	jsr	RESTORE
	jsr	:1390

	jsr	playDECRESCENDO
	jsr	RDKEYONLY
	jmp	QUIT

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

:280
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
	cmp	#1
	beq	affichePERSO1
skipPERSO	inx
	cpx	#25	; end at position 25
	bcc	]lp
	beq	]lp
	rts		; nobody
	
affichePERSO1	cpx	#7	; SYDNEY is too generic
	beq	skipPERSO

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
	PushWord	#476
	PushWord	#15
	PushWord	#modeCopy
	_PPToPort
	rts

affichePERSO_ALT
	PushLong	#perso2LocPtr
	PushLong	#perso2RectPtr
	PushWord	#360
	PushWord	#15
	PushWord	#modeCopy
	_PPToPort
	rts
	
*-------------------------------
* DATA
*-------------------------------

DATA_IN

aut	ds	2
ba1	ds	2
ba2	ds	2
ca	ds	2
de	ds	2
do	ds	2
do1	ds	2
do2	ds	2
em	ds	2
em1	ds	2
ga	ds	2
gagne	ds	2
he	ds	2
i	ds	2
id	ds	2
jea	ds	2
lu	ds	2
m	ds	2
mar	ds	2
me	ds	2
n	ds	2
nn	ds	2
pa	ds	2
pe	ds	2
perso	ds	2	; personnage demandé
pho	ds	2
pv	ds	2
re	ds	2
rec	ds	2
sy	ds	2
t	ds	2
tin	ds	2
tin1	ds	2
x	ds	2
z	ds	2

a	ds	40	; 1..39

A$	ds	256	; string pointer
B$	ds	256	; string pointer
C$	ds	256	; string pointer

DATA_OUT

*---

pFOND1	strl	'@/data/fond1'
pFOND2	strl	'@/data/fond2'

fondRECT	dw	169,1,198,637
tvRECT	dw	15,361,110,607
persoRECT	dw	7,463,103,623

persoLocPtr	dw	mode640	; mode 640
	adrl	persoCONCIERGE	; pointer to object
	dw	34
persoRectPtr	dw	0,0,80,138

perso2LocPtr	dw	mode640	; mode 640
	adrl	persoLANGUILLE2	; pointer to object
	dw	66
perso2RectPtr	dw	0,0,80,256

*--- Index 7 is too generic, skip it

tblPERSO	dw	9,9,9,7,7,3,3,3
	dw	4,4,5,5,2,2,1,1
	dw	6,6,-1,8,8,8,-1,0,0

ptrPERSO	adrl	persoCONCIERGE	;  0 24 25    LAJOIE CONCIERGE
	adrl	persoDECOL	;  1 15 16    DECOL HUBERT
	adrl	persoDINALLO	;  2 13 14    TINO NALLO
	adrl	persoEPOUSE	;  3 06 07 08 MADAME SYDNEY MARIANNE
	adrl	persoFILLE	;  4 09 10    FILLE SYLVIE
	adrl	persoFILS	;  5 11 12    FILS LUDOVIC
	adrl	persoLANGUILLE	;  6 17 18    PATRICK LANGUILLE SERGENT
	adrl	persoRENARD	;  7 04 05    RENARD ROBERT
	adrl	persoSERVANTE	;  8 20 21 22 PEGGY GACHET SERVANTE
	adrl	persoTEMOIN	;  9 01 02 03 TEMOIN JEANNOT ESTRADE

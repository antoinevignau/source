*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

CASCADE	@LOAD	#pCASCADE
CASCADE_60	@SHOWPIC
CASCADE_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	CASCADE_100
	cmp	#'2'
	beq	CASCADE_300
	cmp	#'3'
	beq	CASCADE_400
	cmp	#'4'
	beq	CASCADE_500
	cmp	#'5'
	beq	CASCADE_600
	cmp	#'6'
	beq	CASCADE_700
	bne	CASCADE_LOOP

CASCADE_100	jmp	ENVIRONS

CASCADE_300	@PRINT	#cascade_str300
	@INKEY
	jmp	CASCADE_60

CASCADE_400	@PRINT	#cascade_str400
	@INKEY
	jmp	MORT

CASCADE_500	@PRINT	#cascade_str500
	@INKEY
	jmp	CASCADE_60

CASCADE_600	@PRINT	#cascade_str600
	@INKEY
	jmp	CASCADE_60

CASCADE_700	@PRINT	#cascade_str700
CASCADE_750	@PRINT	#cascade_str750
	@INKEY
	pha
	dec	theLOCATEX
	jsr	GOTOXY
	lda	1,s
	jsr	COUT
	
	pla
	cmp	#'N'
	beq	CASCADE_770
	
	cmp	#'Y'
	bne	CASCADE_750

CASCADE_760	jmp	GROTTE1

CASCADE_770	jmp	CASCADE

*---

pCASCADE	strl	'@/data/cascade'

cascade_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous grimpez, vous grimpez...'0d
	asc	0d'vous grimpez...'0d
	asc	0d'Et grimpez encore...'0d
	dfb	ePEN,2
	asc	0d'... enfin, dans votre t'90'te.'0d
	dfb	ePEN,3
	asc	0d'En r'8e'alit'8e', vous '90'tes coll'8e' au m'90'me'0d
	asc	'caillou depuis dix minutes,'0d
	asc	'en nage, haletant.'0d
	dfb	ePEN,1
	asc	0d'Ereint'8e', vous renoncez, redescendant'0d
	asc	'le m'8f'tre cinquante que vous aviez'0d
	asc	'p'8e'niblement gravi...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

cascade_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous plongez vos mains dans l'27'eau'0d
	asc	'glaciale et buvez '88' grandes gorg'8e'es.'0d
	dfb	ePEN,2
	asc	0d'D'8e'licieux...'0d
	dfb	ePEN,3
	asc	0d'...enfin, jusqu'2788' ce que votre estomac'0d
	asc	'organise une rave party.'0d
	dfb	ePEN,1
	asc	0d'Apparemment, cette eau contenait plus'0d
	asc	'de bact'8e'ries qu'27'un clavier'0d
	asc	'd'27'ordinateur partag'8e'.'0d
	dfb	ePEN,3
	asc	0d'Vous rendez l'2789'me dans un mix'0d
	asc	'de coliques et de d'8e'sespoir.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

cascade_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous transformez vos doigts en'0d
	asc	'hame'8d'ons et attendez...'0d
	dfb	ePEN,3
	asc	0d'Patiemment... tr'8f's patiemment.'0d
	dfb	ePEN,2
	asc	0d'Dix minutes plus tard,'0d
	asc	'un poisson s'27'approche,'0d
	asc	'vous fixe comme s'27'il connaissait'0d
	asc	'un terrible secret, puis repart.'0d
	dfb	ePEN,1
	asc	0d'Intriguant.'0d
	dfb	ePEN,2
	asc	0d'Deux heures plus tard, victoire :'0d
	asc	'Vous attrapez... une algue...'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
	
cascade_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,3
	asc	'PLOUF !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous plongez comme si vous saviez nager'0d
	dfb	ePEN,3
	asc	0d'...sauf que non.'0d
	dfb	ePEN,2
	asc	0d'L'27'eau glaciale vous saisit, vos'0d
	asc	'organes signent leur d'8e'mission,'0d
	asc	'mais vous ressortez VIVANT !'0d
	dfb	eLOCATE,21,9
	dfb	ePEN,1
	asc	'VIVANT'0d
	asc	0d'Tremp'8e', transi et d'27'une propret'8e0d
	asc	'qui ferait jalouser une salle blanche.'0d
	dfb	ePEN,3
	asc	0d'Au passage,'0d
	asc	'vous avez cru apercevoir une lueur'0d
	asc	8e'trange sous la cascade...'0d
	dfb	ePEN,2
	asc	'Mais vos dents qui claquent'0d
	asc	'couvrent toute r'8e'flexion.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

cascade_str700	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous pensez vraiment d'8e'nicher un'0d
	asc	'passage derri'8f're la cascade ?'0d
	dfb	ePEN,2
	asc	0d'Un peu trop clich'8e', non ?'0d
	dfb	ePEN,1
	asc	0d'Mais port'8e' par votre optimisme et une'0d
	asc	'bonne dose d'27'illusions, vous empruntez'0d
	asc	'le petit sentier de pierres glissantes'0d
	asc	'qui vous m'8f'ne sous le rideau d'27'eau.'0d
	dfb	ePEN,3
	asc	0d'Et la MIRACLE !!!'0d
	dfb	ePEN,2
	asc	0d'Une ouverture secr'8f'te s'27'offres '88' vous,'0d
	asc	'd'8e'voilant l'27'entr'8e'e d'27'une grotte'0d
	asc	'myst'8e'rieuse '88' l'27'EST !'
	dfb	eEOD

cascade_str750	dfb	ePEN,3
	dfb	eLOCATE,5,22
	asc	'L'27'empruntez-vous (O/N) 'a5
	dfb	eEOD


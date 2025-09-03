*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

DISC	@LOAD	#pTITLE
	@SHOWPIC
	@INKEY
	@PRINT	#disc_str1
	@INKEY
	@PRINT	#disc_str2
	@INKEY
	@PRINT	#disc_str3
	@INKEY
	@CLS
	
	jmp	PLAGE

*---

pTITLE	strl	'@/data/title'

disc_str1	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,26
	dfb	eINK,2,6
	dfb	eINK,3,18
*	dfb	eBORDER,0
	dfb	eCLS
	dfb	ePEN,1
	asc	'JUILLET 2026,'0d
	dfb	ePEN,02
	asc	0d0d'PROFESSION : JOURNALISTE'0d
	asc	0d
	dfb	ePEN,3
	asc	'Le soleil '8e'crasait la c'99'te p'8e'ruvienne,'0d
	asc	'mes articles dormaient dans les tiroirs.'0d
	dfb	ePEN,1
	asc	'Un moment rare : pas de bouclage,'0d
	asc	'pas de rumeurs '88' v'8e'rifier.'0d
	asc	'Juste le bruit des vagues,'0d
	asc	'l'27'odeur du sel,'0d
	asc	'et un carnet rest'8e' ferm'8e0d
	asc	'depuis des semaines...'0d
	dfb	ePEN,3
	asc	0d'Une pause.'0d
	asc	'Des pens'8e'es qui d'8e'rivent,'0d
	asc	'des souvenirs d'27'enfance.'0d
	asc	0d'Je croyais ces vacances paisibles.'0d
	dfb	ePEN,2
	asc	0d'Je me trompais...'0d
	asc	0d0d
	dfb	ePEN,1
	asc	'        Appuyez sur une touche...'
	dfb	eEOD

disc_str2	dfb	eCLS
	dfb	ePEN,3
	asc	'Bienvenue dans cette aventure,'0d
	asc	88' la mani'8f're d'27'un livre dont vous'0d
	asc	90'tes le h'8e'ros !'0d
	dfb	ePEN,1
	asc	0d'A chaque '8e'cran,'0d
	asc	'plusieurs choix vous seront propos'8e's.'0d
	asc	'Certains feront avancer l'27'histoire,'0d
	asc	'd'27'autres entraineront des fins...'0d
	asc	'moins heureuses.'0d
	dfb	ePEN,3
	asc	0d'Pour s'8e'lectionner une action,'0d
	asc	'il vous suffit d'27'appuyer sur le chiffre'0d
	asc	'correspondant au clavier.'0d
	dfb	ePEN,2
	asc	0d'             Bonne chance !'0d
	dfb	ePEN,1
	asc	0d'Vous allez en avoir besoin,'0d
	asc	'car vous allez mourir...'
	dfb	eLOCATE,26,18
	dfb	ePEN,2
	asc	'Souvent.'0d
	dfb	ePEN,3
	asc	0d0d'  (c) 2025 - Eric Cubizolle (TITAN)'0d
	asc	'        Musique : Pulsophonic'0d
	dfb	ePEN,1
	asc	0d0d'       Appuyez sur une touche...'
	dfb	eEOD

disc_str3	dfb	eCLS
	dfb	ePEN,1
	dfb	eLOCATE,1,10
	asc	'           Version Apple IIgs'0d
	asc	'                   de'0d
	asc	'         Brutal Deluxe Software'0d
	asc	0d
	asc	'    Antoine Vignau & Olivier Zardini'0d
	asc	0d
	asc	0d
	asc	'              23 ao'9e't 2025'
	dfb	eEOD

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
	asc	'JULY 2026,'0d
	dfb	ePEN,02
	asc	''0d
	asc	''0d
	asc	'OCCUPATION: JOURNALIST'0d
	asc	''0d
	dfb	ePEN,3
	asc	'The sun was beating down'0d
	asc	'on the Peruvian coast,'0d
	asc	'my articles slept in drawers.'0d
	dfb	ePEN,1
	asc	'A rare moment: no deadlines,'0d
	asc	'no rumors to check.'0d
	asc	'Just the sound of waves,'0d
	asc	'the smell of salt,'0d
	asc	'and a notebook left closed'0d
	asc	'for weeks...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'A real break.'0d
	asc	'Thoughts drifting,'0d
	asc	'childhood memories.'0d
	asc	''0d
	asc	'I believed this vacation was quiet.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'I was wrong...'0d
	asc	''0d
	asc	''0d
	dfb	ePEN,1
	asc	'      Press any key to continue...'
	dfb	eEOD

disc_str2	dfb	eCLS
	dfb	ePEN,3
	asc	'Welcome to this adventure,'0d
	asc	'in the spirit of a book'0d
	asc	'where *you* are the hero!'0d
	dfb	ePEN,1
	asc	0d'At each screen,'0d
	asc	'you will be given choices.'0d
	asc	'Some will make you progress,'0d
	asc	'others may lead to endings...'0d
	asc	'less fortunate.'0d
	dfb	ePEN,3
	asc	0d'To select an action,'0d
	asc	'just press the number'0d
	asc	'on the keyboard.'0d
	dfb	ePEN,2
	asc	0d'             Good luck!'0d
	dfb	ePEN,1
	asc	0d'You'27'll need it,'0d
	asc	'because you will die...'
	dfb	eLOCATE,26,18
	dfb	ePEN,2
	asc	'Often.'0d
	dfb	ePEN,3
	asc	0d0d'  (c) 2025 - Eric Cubizolle (TITAN)'0d
	asc	'        Music by: Pulsophonic'0d
	dfb	ePEN,1
	asc	0d'      Press any key to continue...'
	dfb	eEOD

disc_str3	dfb	eCLS
	dfb	ePEN,1
	dfb	eLOCATE,1,10
	asc	'           Apple IIgs Version'0d
	asc	'                   by'0d
	asc	'         Brutal Deluxe Software'0d
	asc	0d
	asc	'    Antoine Vignau & Olivier Zardini'0d
	asc	0d
	asc	0d
	asc	'             23 August 2025'
	dfb	eEOD

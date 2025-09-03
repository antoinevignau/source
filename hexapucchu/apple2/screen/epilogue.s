*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

EPILOGUE	@LOAD	#pEPILOGUE
	@PRINT	#epilogue_str10
	@INKEY

	@MODE	#2
	@SHOWPIC
	@PRINT	#epilogue_str20
	@INKEY
	@SHOWPIC
	@PRINT	#epilogue_str30
	@INKEY
	@SHOWPIC
	@PRINT	#epilogue_str40
	@INKEY
	@SHOWPIC
	@PRINT	#epilogue_str50
	@INKEY

	@PRINT	#epilogue_str60
	@INKEY

	@MODE	#2
	@SHOWPIC
	@PRINT	#epilogue_str70
	@INKEY

	jmp	QUIT

*---

pEPILOGUE	strl	'@/data/epilogue'

epilogue_str10	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,4
	dfb	ePEN,1
	asc	'Bravo, explorateur !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous avez surv'8e'cu aux pi'8f'ges,'0d
	asc	'd'8e'chiffr'8e' les '8e'nigmes et d'8e'couvert'0d
	asc	'le secret le mieux gard'8e' des Incas.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Pas mal pour des vacances, non ?'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Mais pas le temps de souffler :'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Votre calepin vous appelle.'0d
	asc	'L'27'humanit'8e' doit savoir'0d
	asc	'ce que vous avez vu !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous vous installez,'0d
	asc	'un stylo '88' la main...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

epilogue_str20
*	dfb	eMODE,2
	dfb	eLOCATE,1,4
	dfb	ePAPER,3
	dfb	eINK,0,0
	dfb	eINK,4,0	; for 640-dithered
	dfb	eINK,8,0	; 
	dfb	eINK,12,0	; 
	dfb	ePEN,0
	asc	'INCROYABLE : J'27'AI TROUVE L'27'ORDINATEUR DES INCAS... ET J'27'AI SAUVE L'27'HUMANITE !'0d
	asc	'============================================================================='0d
	asc	''0d
	asc	'                          Par votre envoy'8e' tr'8f's sp'8e'cial au fin fond du P'8e'rou.'0d
	asc	''0d
	asc	'Perdu dans la jungle p'8e'ruvienne, entre moustiques kamikazes et pierres'0d
	asc	'meurtri'8f'res, je ne m'27'attendais pas '88' tomber sur l'27'article de ma vie.'0d
	asc	''0d
	asc	'                                              Et pourtant...'0d
	asc	''0d
	asc	'Ann'8e'e 984 :'0d
	asc	''0d
	asc	'les Incas, que l'27'on croyait occup'8e's '88' sculpter des lamas, tresser des ponchos'0d
	asc	'et inventer le quinoa, maniaient en r'8e'alit'8e' la technologie comme personne.'0d
	asc	'Leur chef d'27'oeuvre ? Incatrad, un ordinateur capable de calculs titanesques.'0d
	asc	'Une invention si prodigieuse qu'27'ils ont choisi de la prot'8e'ger'0d
	asc	'par un syst'8f'me radical :'0d
	asc	''0d
	asc	'Toute intrusion d'8e'clenche un compte '88' rebours vers la fin du monde !'0d
	asc	'Oui, les Incas avaient l'27'esprit dramatique.'
	dfb	eLOCATE,34,25
	asc	' ENTER  'a5
	dfb	eEOD

epilogue_str30
*	dfb	eMODE,2
	dfb	eLOCATE,1,5
	dfb	ePAPER,3
	dfb	eINK,0,0
	dfb	eINK,4,0	; for 640-dithered
	dfb	eINK,8,0	; 
	dfb	eINK,12,0	; 
	dfb	ePEN,0
	asc	'Avance rapide : 1984.'0d
	asc	''0d
	asc	'Lors d'27'une balade touristique au P'8e'rou, un certain Alan Michael Sugar'0d
	asc	'('8d'a vous dit quelque chose ?) d'8e'couvre Hexapucchu par hasard et y d'8e'robe'0d
	asc	'les plans de l'27'Incatrad.'0d
	asc	''0d
	asc	'Ces documents deviendront la pierre angulaire de ses futurs Amstrad CPC.'0d
	asc	''0d
	asc	'R'8e'sultat : le compte '88' rebours d'8e'marre.'0d
	asc	''0d
	asc	'Fin du monde pr'8e'vue 44 ans plus tard, soit en 2028 !'0d
	asc	''0d
	asc	'Mais dans sa fuite, l'27'homme d'27'affaires perd un engrenage sur la plage.'0d
	asc	''0d
	asc	'Anecdote amusante : ses nombreuses dents lui inspireront plus tard les c'8e'l'8f'bres'0d
	asc	'pubs Amstrad... avec des crocodiles.'0d
	dfb	eLOCATE,34,25
	asc	' ENTER  'a5
	dfb	eEOD

epilogue_str40
*	dfb	eMODE,2
	dfb	eLOCATE,1,5
	dfb	ePAPER,3
	dfb	eINK,0,0
	dfb	eINK,4,0	; for 640-dithered
	dfb	eINK,8,0	; 
	dfb	eINK,12,0	; 
	dfb	ePEN,0
	asc	'2026, de nos jours :'0d
	asc	''0d
	asc	'Moi, reporter en qu'90'te de sensations, je tombe sur cet engrenage maudit'0d
	asc	'et m'27'aventure dans une pyramide Inca pi'8e'g'8e'e.'0d
	asc	''0d
	asc	'Statues tueuses, trous sans fond, cocotiers fourbes :'0d
	asc	'j'27'ai tout affront'8e', moi aussi, pour atteindre l'27'Incatrad.'0d
	asc	''0d
	asc	'Et l'88'... miracle : tandis qu'27'il ne restait plus que deux ans avant le grand'0d
	asc	'cataclysme, j'27'ai hack'8e' le syst'8f'me.'0d
	asc	''0d
	asc	'Certes, je n'27'ai pas stopp'8e' le compte '88' rebours (on ne fait pas de miracles),'0d
	asc	'mais j'27'ai gagn'8e' 255 ans.'0d
	asc	''0d
	asc	'L'27'humanit'8e' respire.'
	dfb	eLOCATE,34,25
	asc	' ENTER  'a5
	dfb	eEOD

epilogue_str50
*	dfb	eMODE,2
	dfb	eLOCATE,1,12
	dfb	ePAPER,3
	dfb	eINK,0,0
	dfb	eINK,4,0	; for 640-dithered
	dfb	eINK,8,0	; 
	dfb	eINK,12,0	; 
	dfb	ePEN,0
	asc	'Alors, ce soir, en sirotant mon Candy'27'up Chocolat, une question me taraude :'0d
	asc	''0d
	asc	'                  Qui sauvera le monde la prochaine fois ?'0d
	dfb	eLOCATE,34,25
	asc	' ENTER  'a5
	dfb	eEOD

epilogue_str60	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,9
	dfb	ePEN,1
	asc	'          Merci d'27'avoir jou'8e' '880d
	dfb	ePEN,3
	asc	''0d
	asc	'               HEXAPUCCHU'0d
	dfb	ePEN,2
	asc	''0d
	asc	'      la Cit'8e' Perdue de Patchucca'0d
	dfb	ePEN,1
	dfb	eLOCATE,10,20
	asc	'Eric Cubizolle (TITAN)'0d
	dfb	eEOD

epilogue_str70
*	dfb	eMODE,2
	dfb	eLOCATE,1,5
	dfb	ePAPER,3
	dfb	eINK,0,0
	dfb	eINK,4,0	; for 640-dithered
	dfb	eINK,8,0	; 
	dfb	eINK,12,0	; 
	dfb	ePEN,0
	asc	'Hexapucchu a '8e't'8e' r'8e'alis'8e' en 15 jours.'0d
	asc	''0d
	asc	'Ce jeu est n'8e' d'27'un vieux d'8e'sir de cr'8e'er un jeu d'27'aventure dans l'27'esprit'0d
	asc	'de Devilry II, que j'27'avais programm'8e' durant ma jeunesse, en 1989.'0d
	asc	''0d
	asc	'Les graphismes ont '8e't'8e' r'8e'alis'8e's avec Multipaint pour le pixel art,'0d
	asc	'et compress'8e's gr'89'ce '88' ConImgCPC.'0d
	asc	''0d
	asc	'La programmation a '8e't'8e' effectu'8e'e en BASIC, avec mes modestes comp'8e'tences.'0d
	asc	''0d
	asc	'La structure des DSK et la manipulation des fichiers a '8e't'8e' produite'0d
	asc	'avec ManageDSK.'0d
	asc	''0d
	asc	'Je tiens '88' remercier tout particuli'8f'rement Pulsophonic pour la musique,'0d
	asc	'Roudoudou pour ses conseils et Demoniak pour son aide pr'8e'cieuse.'0d
	asc	'En esp'8e'rant que ce petit jeu d'27'aventure vous aura plu.'0d
	asc	''0d
	asc	'A ma famille : Cindy, Lana, Ellie, Oki.'0d
	asc	'Tendres pens'8e'es '88' mon Papa.'0d
	asc	''0d
	asc	'                              Longue vie au CPC !'
	dfb	eEOD


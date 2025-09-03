*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

ROUAGE	@LOAD	#pROUAGE
ROUAGE_60	@SHOWPIC
ROUAGE_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	ROUAGE_200
	cmp	#'2'
	beq	ROUAGE_300
	cmp	#'3'
	beq	ROUAGE_400
	cmp	#'4'
	beq	ROUAGE_500
	cmp	#'5'
	beq	ROUAGE_100
	bne	ROUAGE_LOOP

ROUAGE_100	jmp	ENVIRONS

ROUAGE_200	@PRINT	#rouage_str200
	@INKEY
	jmp	ROUAGE_60

ROUAGE_300	@PRINT	#rouage_str300
	@INKEY
	jmp	ROUAGE_60

ROUAGE_400	@PRINT	#rouage_str400
	@INKEY
	jmp	MORT

ROUAGE_500	@PRINT	#rouage_str500
	@INKEY
	jmp	MORT

*---

pROUAGE	strl	'@/data/rouage'

rouage_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'L'27'art'8e'fact ressemble'0d
	asc	88' un rouage inca ancien, taill'8e' dans la '
	asc	'pierre avec une pr'8e'cision troublante.'0d
	dfb	ePEN,2
	asc	0d'Il compte dix dents,'0d
	asc	'p'8f'se pr'8f's de 800 grammes'0d
	asc	'et son centre arbore le visage s'8e'v'8f're'0d
	asc	'd'27'un dieu oubli'8e'...'0d
	dfb	ePEN,1
	asc	0d'Au dos, une inscription grav'8e'e'0d
	asc	'attire votre attention :'0d
	dfb	ePEN,3
	asc	0d'    Retriquay, Ignoru or Cansalco.'0d
	dfb	ePEN,1
	asc	0d'Etrange...'0d
	asc	0d'Ces mots semblent presque familiers...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER '
	dfb	eEOD

rouage_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'H'8e', vous vous prenez pour Aladin ?'0d
	dfb	ePEN,2
	asc	0d'Ce n'27'est pas une lampe magique,'0d
	asc	'mais un vieil engrenage inca !'0d
	dfb	ePEN,3
	asc	0d'Vous vous '90'tes tromp'8e' de conte !'0d
	dfb	ePEN,1
	asc	0d'Ppurtant, '88' force de frotter,'0d
	asc	'de fines particules magn'8e'tiques'0d
	asc	'se d'8e'tachent et brillent'0d
	asc	'sous le soleil.'0d
	dfb	ePEN,2
	asc	0d'Comme si la pierre murmurait encore'0d
	asc	'des secrets anciens...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER '
	dfb	eEOD

rouage_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous plongez le rouage dans l'27'eau'0d
	asc	'de mer, esp'8e'rant r'8e'v'8e'ler'0d
	asc	'd'27'autres secrets enfouis.'0d
	dfb	ePEN,3
	asc	0d'Mais le sel attaque sournoisement'0d
	asc	'la pierre ancienne.'0d
	dfb	ePEN,2
	asc	0d'Soudain, un grondement sourd'0d
	asc	'se fait entendre...'0d
	dfb	ePEN,1
	asc	0d'Une fissure appara'94't et l'27'eau'0d
	asc	's'27'infiltre dans le m'8e'canisme cach'8e'.'0d
	dfb	ePEN,2
	asc	0d'Le rouage s'27'emballe,'0d
	asc	'd'8e'clenchant une r'8e'action en cha'94'ne'0d
	asc	'qui vous engloutit'0d
	asc	'dans un torrent impitoyable...'0d
	dfb	ePEN,3
	asc	0d'Votre aventure s'27'ach'8f've ici.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER '
	dfb	eEOD

rouage_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous secouez le rouage comme un maracas'0d
	asc	'persuad'8e' que '8d'a va r'8e'v'8e'lever un indice.'0d
	dfb	ePEN,3
	asc	0d'Mauvaise id'8e'e :'0d
	dfb	ePEN,2
	asc	0d'un cliquetis r'8e'sonne,'0d
	asc	'suivi d'27'un clic inqui'8e'tant...'0d
	dfb	ePEN,1
	asc	0d'F'8e'licitations, vous venez d'27'activer'0d
	asc	'la fonction auto-destruction'0d
	asc	'version inca !'0d
	dfb	ePEN,2
	asc	0d'Vous n'27'avez que le temps de penser :'0d
	dfb	ePEN,3
	asc	0d'   Mais pourquoi j'27'ai secou'8e' ?!?!??'0d
	dfb	ePEN,1
	asc	0d'...Avant d'2790'tre transform'8e0d
	asc	'        ...en poussi'8f're arch'8e'ologique !'0d
	dfb	ePEN,3
	asc	0d0d'          Fin de l'27'aventure !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER '
	dfb	eEOD

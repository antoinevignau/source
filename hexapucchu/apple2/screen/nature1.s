*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

NATURE1	@LOAD	#pNATURE1

	stz	T
	
NATURE1_60	@SHOWPIC

	lda	T
	cmp	#19+1
	bcc	NATURE1_LOOP
	lda	#1
	sta	T

NATURE1_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	NATURE1_110
	cmp	#'2'
	beq	NATURE1_120
	cmp	#'3'
	beq	NATURE1_200
	cmp	#'4'
	beq	NATURE1_300
	cmp	#'5'
	beq	NATURE1_2000
	cmp	#'6'
	beq	NATURE1_400
	bne	NATURE1_LOOP

NATURE1_110	jmp	NATURE2

NATURE1_120	jmp	ENVIRONS

NATURE1_200	@PRINT	#nature1_str200
	@INKEY
	jmp	NATURE1_60

NATURE1_300	@PRINT	#nature1_str300
	@INKEY
	jmp	NATURE1_60

NATURE1_400	@PRINT	#nature1_str400
	@INKEY
	jmp	NATURE1_60

NATURE1_2000	lda	T
	bne	NATURE1_2100

	@PRINT	#nature1_str2000
	jmp	NATURE1_2150

NATURE1_2100	@PRINT	#nature1_strheader

	lda	T
	dec
	asl
	tax
	lda	tblT,x
	jsr	PRINT

NATURE1_2150	inc	T
	@PRINT	#nature1_strfooter
	@INKEY
	jmp	NATURE1_60

*---

pNATURE1	strl	'@/data/nature1'

T	ds	2

tblT	da	nature1_str2200
	da	nature1_str2300
	da	nature1_str2400
	da	nature1_str2500
	da	nature1_str2600
	da	nature1_str2700
	da	nature1_str2800
	da	nature1_str2900
	da	nature1_str3000
	da	nature1_str3100
	da	nature1_str3200
	da	nature1_str3300
	da	nature1_str3400
	da	nature1_str3500
	da	nature1_str3600
	da	nature1_str3700
	da	nature1_str3800
	da	nature1_str3900
	da	nature1_str4000

nature1_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Avec toute la gr'89'ce d'27'un chat maladroit'0d
	asc	'sur un parquet cir'8e', vous vous lancez'0d
	asc	88' l'27'assaut de l'278e'boulement, pr'90't '880d
	asc	'dompter ces pierres rebelles.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'H'8e'las... chaque pierre que vous tentez'0d
	asc	'd'27'escalader d'8e'cide de faire sa vie'0d
	asc	'sans vous'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Ca glisse, Ca roule, Ca vous snobe.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous grimpez d'27'un m'8f'tre, glissez'0d
	asc	'de deux et finissez '88' plat ventre'0d
	asc	'dans l'27'herbe avec la gr'89'ce d'27'une'0d
	asc	'hu'94'tre sur un toboggan...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Mais bravo pour l'27'effort, vraiment.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature1_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous observez la prairie qui vous'0d
	asc	'entoure.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'L'27'herbe se plie doucement sous la brise'0d
	asc	'encadr'8e'e par une v'8e'g'8e'tation dense qui'0d
	asc	'semble pr'90'te '88' vous lancer un d'8e'fi muet.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'A gauche, la statue inca fait une'0d
	asc	'grimace pas tr'8f's sympa, comme si elle'0d
	asc	'gardait jalousement ses secrets...'0d
	dfb	ePEN,1
	asc	''0d
	asc	''0d
	asc	'A droite, l'27'entr'8e'e de la grotte est'0d
	asc	'barr'8e'e par un '8e'boulement instable de'0d
	asc	'gravats, rendant tout acc'8f's impossible...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'              ... pour l'27'instant.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature1_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous vous attaquez au tas de pierres'0d
	asc	'avec l'27'enthousiasme d'27'un arch'8e'ologue'0d
	asc	'en herbe... ou d'27'un enfant '88' la'0d
	asc	'recherche d'27'un tr'8e'sor enterr'8e' par'0d
	asc	'son chien.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous retournez, d'8e'placez, empilez,'0d
	asc	'examinez... pour finalement d'8e'couvrir'0d
	asc	'un caillou en forme de coeur,'0d
	asc	'une limace qui n'27'avait rien demand'8e0d
	asc	'et une noisette vide...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Bref, une belle le'8d'on sur l'27'importance'0d
	asc	'de g'8e'rer vos attentes.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

nature1_str2000	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Parler '88' une statue en pleine prairie ?'0d
	asc	'Voil'88' une id'8e'e brillante, juste apr'8f's'0d
	asc	'brosser les dents d'27'un rocher'0d
	asc	'ou apprendre la salsa '88' une boussole.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous vous placez fa'8d'e '88' la statue,'0d
	asc	'adoptez votre voix la plus solenelle'0d
	asc	'et lancez :'0d
	dfb	ePEN,3
	asc	''0d
	asc	'O grand esprit de pierre, parle-moi !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Contre toute attente, la statue'0d
	asc	'murmure d'27'une voix rocailleuse :'0d
	dfb	ePEN,3
	asc	''0d
	asc	22'Bon, encore un illumin'8e' !'0d
	asc	'Cela fait une '8e'ternit'8e' que je n'27'ai pas'0d
	asc	'bavard'8e' ! Allez, continue, j'27'ai tant '880d
	asc	'raconter.'220d
	dfb	ePEN,2
	asc	''0d
	asc	'Peut-'90'tre qu'27'un brin de causette'0d
	asc	'avec la statue ne serait pas si idiot,'0d
	asc	'finalement...'0d
	dfb	eEOD

nature1_str2200	asc	'Attention, derri'8f're toi !'0d
	asc	'...Ha, t'27'as vu comment t'27'as sursaut'8e' !'0d
	dfb	eEOD

nature1_str2300	asc	'Tes chaussures sont nulles.'0d
	asc	'Voil'88', c'27'est dit.'0d
	dfb	eEOD

nature1_str2400	asc	'Tu sens l'27'humain...'0d
	asc	'Et la cr'8f'me solaire...'0d
	dfb	eEOD

nature1_str2500	asc	'Tu veux un indice ?'0d
	asc	'Demande '88' mon cousin, le caillou'0d
	dfb	eEOD

nature1_str2600	asc	'Je suis fig'8e'e depuis 1000 ans, et j'27'ai'0d
	asc	'pourtant l'27'air moins coinc'8e'e que toi.'0d
	dfb	eEOD

nature1_str2700	asc	'Je m'89'che le silex !'0d
	dfb	eEOD

nature1_str2800	asc	'Je te raconte un secret :'0d
	asc	'Je suis plus bavarde que ton ex.'0d
	dfb	eEOD

nature1_str2900	asc	'Mon hobby : faire la statue.'0d
	asc	'Le tien ? Gal'8e'rer...'0d
	dfb	eEOD

nature1_str3000	asc	'J'27'ai vu la chute des empires.'0d
	asc	'Toi, tu chutes sur des pierres, en pire.'0d
	dfb	eEOD

nature1_str3100	asc	'La foudre m'27'ob'8e'it !'0d
	dfb	eEOD

nature1_str3200	asc	'J'27'ai surv'8e'cu '88' l'27'empire Inca,'0d
	asc	'et '88' la conqu'90'te espagnole.'0d
	asc	'Mais je ne suis pas s'9e're de'0d
	asc	'survivre '88' ton humour douteux.'0d
	dfb	eEOD

nature1_str3300	asc	'Moi je suis Inca.'0d
	asc	'Toi... tu es un cas.'0d
	dfb	eEOD

nature1_str3400	asc	'Ton destin est '8E'crit...'0d
	asc	'mais je ne l'27'ai pas lu.'0d
	dfb	eEOD

nature1_str3500	asc	'M'90'me l'27'ours me craint !'0d
	dfb	eEOD

nature1_str3600	asc	'Les potions incas donnent des visions,'0d
	asc	'et parfois m'90'me des codes secrets !'0d
	dfb	eEOD

nature1_str3700	asc	'Les Azt'8f'ques sacrifiaient des humains,'0d
	asc	'moi je sacrifie ma tranquillit'8e' pour toi'0d
	dfb	eEOD

nature1_str3800	asc	'J'27'fais pas la gueule...'0d
	asc	'J'27'ai juste un mauvais transit.'0d
	dfb	eEOD

nature1_str3900	asc	'Si tu voulais un selfie avec moi,'0d
	asc	'fallait pr'8e'venir il y a 900 ans,'0d
	asc	'j'278e'tais plus tendance.'0d
	dfb	eEOD

nature1_str4000	asc	'On s'27'fait un poker ?'0d
	asc	'J'27'te pr'8e'viens, j'27'suis la reine du poker face'0d
	dfb	eEOD
	
nature1_strheader
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
*	dfb	eBORDER,0
	dfb	eLOCATE,6,9
	dfb	ePEN,1
	asc	'La statue vous r'8e'pond :'0d
	dfb	ePEN,3
	dfb	eLOCATE,1,10
	asc	22	; heading "
	dfb	eEOD

nature1_strfooter
	asc	22	; trailing "
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

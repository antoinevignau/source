*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

GROTTE2	@LOAD	#pGROTTE2
GROTTE2_60	@SHOWPIC
GROTTE2_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	GROTTE2_110
	cmp	#'2'
	beq	GROTTE2_200
	cmp	#'3'
	beq	GROTTE2_130
	cmp	#'4'
	beq	GROTTE2_300
	cmp	#'5'
	beq	GROTTE2_600
	cmp	#'6'
	beq	GROTTE2_400
	cmp	#'7'
	beq	GROTTE2_500
	bne	GROTTE2_LOOP

GROTTE2_110	jmp	GROTTE3

GROTTE2_130	jmp	GROTTE1

GROTTE2_200	@PRINT	#grotte2_str200
	@INKEY
	jmp	MORT

GROTTE2_300	@PRINT	#grotte2_str300
	@INKEY
	jmp	GROTTE2_60

GROTTE2_400	@PRINT	#grotte2_str400
	@INKEY
	jmp	GROTTE2_60

GROTTE2_500	@PRINT	#grotte2_str500
	@INKEY
	jmp	GROTTE2_60

GROTTE2_600	@PRINT	#grotte2_str600
	@INKEY
	jmp	GROTTE2_60

*---

pGROTTE2	strl	'@/data/grotte2'

grotte2_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Les yeux riv'8e's au plafond, vous'0d
	asc	'scrutez les stalactites au cas o'9d' l'27'une'0d
	asc	'd'27'elles se d'8e'tacherait lors de'0d
	asc	'votre passage sous la vo'9e'te NORD.'0d
	dfb	ePEN,3
	asc	0d
	asc	'Quand soudain, votre pied rencontre'0d
	asc	'une stalagmite tra'94'tresse !'0d
	dfb	ePEN,2
	asc	0d
	asc	'Vous voil'88' d'8e'licatement empal'8e''0d
	asc	'comme une brochette offerte aux'0d
	asc	'dieux incas.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Eh oui, le vrai danger, ce n'278e'tait'0d
	asc	'pas l'88'-haut...'0d
	dfb	ePEN,2
	asc	0d
	asc	'           Mais bien sous vos pieds !'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte2_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'L'27''8e'cho vous renvoie un PLOC '88' chaque'0d
	asc	'pas, comme si la grotte elle-m'90'me'0d
	asc	'applaudissait votre curiosit'8e'.'0d
	dfb	ePEN,2
	asc	0d
	asc	'A l'27'ouest, un vieil escalier taill'8e0d
	asc	'dans la roche grimpe vaillamment vers'0d
	asc	'l'278e'tage sup'8e'rieur (sans rampe,)'0d
	asc	8e'videmment).'0d
	dfb	ePEN,3
	asc	0d
	asc	'Au NORD, une vo'9e'te h'8e'riss'8e'e de'0d
	asc	'stalactites semble crier :'0d
	asc	'       '22'Viens te planter ici !'220d
	dfb	ePEN,2
	asc	0d
	asc	'Et cette '8e'chelle '88' l'27'EST qui tente,'0d
	asc	'h'8e'ro'95'quement, d'27'atteindre une corniche'0d
	asc	'ou un mur de pierres taill'8e'es attend'0d
	asc	'manifestement qu'27'on le remarque...'0d
	dfb	ePEN,2
	asc	0d
	asc	'Conclusion :'0d
	dfb	ePEN,1
	asc	0d
	asc	'L'27'endroit est aussi accueillant qu'27'un'0d
	asc	'escape game con'8d'u par un ma'8d'on sadique.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte2_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Creuser ? Vraiment ?'0d
	dfb	ePEN,3
	asc	0d
	asc	'Encore et toujours cette obsession'0d
	asc	'de trifouiller le sol ?'0d
	dfb	ePEN,1
	asc	0d
	asc	'Mais d'27'o'9d' cela vous vient-il ?'0d
	asc	'Un traumatisme avec un bac '88' sable'0d
	asc	'mal rang'8e' ?'0d
	asc	'Un complexe d'27'arch'8e'ologue refoul'8e' ?'0d
	dfb	ePEN,2
	asc	0d
	asc	'Vous voulez qu'27'on en parle ?'0d
	asc	'Non ? Tant mieux !'0d
	dfb	ePEN,1
	asc	0d
	asc	'Parce que la grotte, elle, n'27'a rien'0d
	asc	88' dire.'0d
	asc	0d
	asc	'Et la pierre non plus.'0d
	asc	0d
	asc	'Pas m'90'me un ver de terre pour faire'0d
	asc	'la causette.'0d
	dfb	ePEN,4
	asc	0d
	asc	'Bref, vous ne trouvez rien.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte2_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous vous redressez, bras en l'27'air'0d
	asc	'regard habit'8e' et d'27'une voix grave'0d
	asc	'vous lancez :'0d
	dfb	ePEN,3
	asc	0d
	asc	22'O esprit ancestral de la grotte,'0d
	asc	'manifeste-toi !'220d
	dfb	ePEN,2
	asc	0d
	asc	'Un silence solennel s'27'installe.'0d
	asc	'Pas de lumi'8f're mystique,'0d
	asc	'pas de voix venue des profondeurs,'0d
	asc	'pas m'90'me une petite brise dramatique.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Juste un petit goutte-'88'-goutte r'8e'gulier qui'0d
	asc	'semble ponctuer votre '8e'chec.'0d
	dfb	ePEN,2
	asc	0d
	asc	'       Ploc... Ploc... Ploc...'0d
	dfb	ePEN,3
	asc	0d
	asc	'F'8e'licitations. Vous venez d'27'invoquer'0d
	asc	'l'27'indiff'8e'rence mill'8e'naire d'27'un caillou'0d
	asc	'humide.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte2_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous vous '8e'lancez vers l'27'chelle !'0d
	dfb	ePEN,2
	asc	0d
	asc	'H'8e'las... '88' peine avez-vous lev'8e' le pied'0d
	asc	'en direction du premier barreau que'0d
	asc	'vous comprenez :'0d
	dfb	ePEN,3
	asc	0d
	asc	'Elle est trop courte.'0d
	asc	'Beaucoup trop courte.'0d
	dfb	ePEN,1
	asc	0d
	asc	'A moins, bien s'9e'r, que ce ne soit vous'0d
	asc	'qui soyez trop petit.'0d
	dfb	ePEN,2
	asc	0d
	asc	'Difficile '88' dire, mais si vous avez'0d
	asc	'd'8e'j'88' perdu une bagarre contre un'0d
	asc	'tabouret, cela m'8e'riterait r'8e'flexion...'0d
	dfb	ePEN,1
	asc	0d
	asc	'Vous sautez, grimacez, soupirez.'0d
	asc	'Rien n'27'y fait :'0d
	dfb	ePEN,3
	asc	0d
	asc	'L'278e'chelle se moque de vous depuis sa'0d
	asc	'corniche, comme une star perch'8e'e'0d
	asc	'refusant l'27'autographe.'0d
	dfb	ePEN,1
	asc	'Bref, vous '90'tes coinc'8e' au sol,'0d
	asc	'et l'278e'chelle, elle, a l'27'air de tr'8f's'0d
	asc	'bien le vivre.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

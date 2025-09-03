*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

GROTTE3	@LOAD	#pGROTTE3
GROTTE3_60	@SHOWPIC
GROTTE3_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	GROTTE3_120
	jmp	GROTTE3_700
GROTTE3_120	cmp	#'2'
	bne	GROTTE3_130
	jmp	GROTTE4
GROTTE3_130	cmp	#'3'
	bne	GROTTE3_140
	jmp	GROTTE2
GROTTE3_140	cmp	#'4'
	beq	GROTTE3_200
	cmp	#'5'
	beq	GROTTE3_300
	cmp	#'6'
	beq	GROTTE3_400
	cmp	#'7'
	beq	GROTTE3_500
	cmp	#'8'
	beq	GROTTE3_600
	bne	GROTTE3_LOOP

GROTTE3_200	@PRINT	#grotte3_str200
	@INKEY
	jmp	GROTTE3_60

GROTTE3_300	@PRINT	#grotte3_str300
	@INKEY
	jmp	MORT

GROTTE3_400	@PRINT	#grotte3_str400
	@INKEY
	jmp	GROTTE3_60

GROTTE3_500	@PRINT	#grotte3_str500
	@INKEY
	jmp	MORT

GROTTE3_600	@PRINT	#grotte3_str600
	@INKEY
	jmp	GROTTE3_60

GROTTE3_700	@PRINT	#grotte3_str700
	@INKEY
	jmp	NATURE1

*---

pGROTTE3	strl	'@/data/grotte3'

grotte3_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Sur la table, des victuailles qui'0d
	asc	'semblent avoir travers'8e' les si'8f'cles :'0d
	dfb	ePEN,2
	asc	''0d
	asc	'- Une miche de pain p'8e'trifi'8e'e,'0d
	asc	'dure comme du granit.'0d
	asc	''0d
	asc	'- Une corbeille de fruits'0d
	asc	'secs comme des momies.'0d
	asc	''0d
	asc	'- Une fiole de breuvage si louche'0d
	asc	'qu'27'un chimiste dirait '22'Non merci'220d
	dfb	ePEN,3
	asc	''0d
	asc	'Le tout semble avoir '8e't'8e' dress'8e','0d
	asc	'il y a mille ans, pour tester le degr'8e0d
	asc	'de na'95'vet'8e' des touristes affam'8e's.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Et pourtant, telle Alice au pays'0d
	asc	'des merveilles version P'8e'rou,'0d
	asc	'vous ressentez une irresistible'0d
	asc	'envie d'27'y go'9e'ter...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte3_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous croquez vaillamment dans la miche'0d
	asc	'et c'27'est votre dentition qui explose'0d
	asc	'la premi'8f're !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Le pain reste intact.'0d
	asc	'Votre ego, lui, s'27'effrite comme'0d
	asc	'une biscotte mouill'8e'e.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Vous venez sans le savoir'0d
	asc	'd'27'activer une proph'8e'tie :'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Celui qui mordra le Pain du Temps'0d
	asc	'n'27'en tirera que honte et douleurs'0d
	asc	'ancestrales.'0d
	asc	''0d
	asc	'Path'8e'tique.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous reposez la miche...'0d
	asc	'tout en planifiant votre futur'0d
	asc	'rendez-vous chez le dentiste.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte3_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous d'8e'bouchez la fiole...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Une odeur de cactus ferment'8e0d
	asc	'vous chatouille le nez.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Vous avalez...'0d
	asc	'et partez dans un trip technicolor !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Les flashs de couleurs s'27'encha'94'nent :'0d
	dfb	ePEN,3
	asc	''0d
	asc	'    Vert, rouge, bleu, noir, vert'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Quand vous revenez '88' vous,'0d
	asc	'vous '90'tes tremp'8e', frissonnant,'0d
	asc	'et persuad'8e' que la roche a un sens'0d
	asc	''0d
	dfb	ePEN,1
	asc	''0d
	asc	'Je ne sais pas ce que c'27'est...'0d
	asc	'Mais c'27'est de la bonne !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte3_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous jetez votre d'8e'volu sur la banane,'0d
	asc	'momifi'8e'e depuis l'2789'ge d'27'or'0d
	asc	'des sacrifices humains.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Une bouch'8e'e... et PAF !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Votre langue gonfle comme un ballon'0d
	asc	'de baudruche, vos yeux partent'0d
	asc	'en freestyle, et vous vous tr'8e'moussez'0d
	asc	'tel un pantin poss'8e'd'8e' avant de'0d
	asc	'finir asphyxi'8e' sur le sol froid'0d
	asc	'de la grotte.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Moralit'8e' :'0d
	dfb	ePEN,2
	asc	''0d
	asc	'La banane inca,'0d
	asc	'c'27'est pas votre fruit totem.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Game Over !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte3_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous sifflez un air guilleret.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Rien ne se passe...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Sinon une stalactite lointaine'0d
	asc	'qui semble lever les yeux au ciel.'0d
	dfb	ePEN,3
	asc	''0d
	asc	''0d
	asc	'Au moins, vous avez anim'8e' la grotte.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte3_str700	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous vous engagez '88' l'27'OUEST.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A peine avez-vous franchi le seuil'0d
	asc	'que le sol, fragilis'8e' par les si'8f'cles,'0d
	asc	'se d'8e'robe sous vos pieds.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Vous chutez de plusieurs m'8f'tres'0d
	asc	'dans un '8e'troit conduit rocheux...'0d
	dfb	ePEN,1
	asc	''0d
	asc	''0d
	asc	'Et apr'8f's une descente chaotique,'0d
	asc	'vous atterrissez '88' l'27'ext'8e'rieur de'0d
	asc	'la grotte, en pleine nature.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

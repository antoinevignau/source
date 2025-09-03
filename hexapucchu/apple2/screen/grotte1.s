*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

GROTTE1	@LOAD	#pGROTTE1
GROTTE1_60	@SHOWPIC
GROTTE1_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	GROTTE1_110
	cmp	#'2'
	beq	GROTTE1_120
	cmp	#'3'
	beq	GROTTE1_200
	cmp	#'4'
	beq	GROTTE1_300
	cmp	#'5'
	beq	GROTTE1_400
	cmp	#'6'
	beq	GROTTE1_500
	bne	GROTTE1_LOOP

GROTTE1_110	jmp	CASCADE

GROTTE1_120	jmp	GROTTE2

GROTTE1_200	@PRINT	#grotte1_str200
	@INKEY
	jmp	GROTTE1_60

GROTTE1_300	@PRINT	#grotte1_str300
	@INKEY
	jmp	MORT

GROTTE1_400	@PRINT	#grotte1_str400
	@INKEY
	jmp	GROTTE1_60

GROTTE1_500	@PRINT	#grotte1_str500
	@INKEY
	jmp	GROTTE1_60

*---

pGROTTE1	strl	'@/data/grotte1'

grotte1_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'L'27'entr'8e'e de la caverne est semblable'0d
	asc	88' une gueule b'8e'ante et affam'8e'e,'0d
	asc	'pr'90'te '88' engloutir quiconque'0d
	asc	'oserait s'27'y aventurer.'0d
	dfb	ePEN,2
	asc	0d
	asc	'Sur la roche humide, vous distinguez'0d
	asc	'plusieurs graffitis.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Entre les classiques :'0d
	dfb	ePEN,3
	asc	0d
	asc	22'Enter at your own risk'22', '22'Go away'22','0d
	asc	22'No Trespassing'22', ou encore '0d
	asc	22'Cuidado con el oso!'22' ,'0d
	dfb	ePEN,2
	asc	0d
	asc	'un sobre mais intrigant'0d
	dfb	ePEN,3
	asc	0d
	asc	'           '22'Alan was here'220d
	dfb	ePEN,2
	dfb	ePEN,1
	asc	0d
	asc	'semble vous fixer avec insistance...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte1_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Grand explorateur devant l'27'Eternel,'0d
	asc	'vous d'8e'cidez de faire une pause bien'0d
	asc	'm'8e'rit'8e'e... au bout de quoi ?'0d
	asc	'      ...trois minutes d'27'aventure ?'0d
	dfb	ePEN,2
	asc	0d
	asc	'Vous vous asseyez majestueusement'0d
	asc	'sur un rocher, en qu'90'te de sagesse'0d
	asc	'et d'27'inspiration.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Le bruit apaisant de la cascade,'0d
	asc	'le chant lointain d'27'un oiseau exotique,'0d
	asc	'le ruissellement discret de l'27'eau'0d
	asc	'dans vos chaussettes mouill'8e'es...'0d
	dfb	ePEN,2
	asc	0d
	asc	'Un moment presque zen...'0d
	dfb	ePEN,3
	asc	0d
	asc	'Jusqu'2788' ce qu'27'une fourmi curieuse'0d
	asc	'et surtout mortelle, d'8e'couvre'0d
	asc	'que votre fessier fait une excellente'0d
	asc	'piste d'27'escalade !'0d
	dfb	ePEN,1
	asc	0d
	asc	'       Sa morsure vous foudroie.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte1_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous vous asseyez en tailleur,'0d
	asc	'fermez les yeux et laissez votre'0d
	asc	'esprit voguer...'0d
	dfb	ePEN,2
	asc	0d
	asc	0d
	asc	'Pendant votre m'8e'ditation, vous sentez'0d
	asc	'votre esprit s'278E'lever...'0d
	dfb	ePEN,3
	asc	0d
	asc	'Jusqu'2788' ce qu'27'il d'8e'cide d'27'aller'0d
	asc	'faire un tour au bar du coin sans'0d
	asc	'vous pr'8e'venir.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Vous restez l'88', perplexe, en train'0d
	asc	'de m'8e'diter sur l'27'abandon spirituel.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte1_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Bravant l'27'humidit'8e', vous vous glissez'0d
	asc	'sous le rideau liquide.'0d
	dfb	ePEN,2
	asc	0d
	asc	'Sensation intense :'0d
	dfb	ePEN,3
	asc	0d
	asc	'C'27'est comme se faire passer au k'8a'rcher'0d
	asc	'par Dame Nature.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Vous ressortez aussi tremp'8e' qu'27'un'0d
	asc	'sachet de th'8e' usag'8e', mais avec'0d
	asc	'le sentiment d'27'avoir accompli'0d
	asc	'quelque chose.'0d
	dfb	ePEN,3
	asc	0d
	asc	'(On ne sait pas quoi, mais bravo.)'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

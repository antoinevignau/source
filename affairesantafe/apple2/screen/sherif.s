*
* L'affaire Santa Fe
*
* (c) Gilles Blancon
* (c) 1988, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* INTRODUCTION
*-------------------------------

SHERIF	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE
	
	@charge_image	#iSHERIF;#pSHERIF

	@image	#iSHERIF;#35453
	@commentaire	#SHERIF10080
	@inkey
	@commentaire	#SHERIF10081
	@inkey
	@image	#iSHERIF;#33461
	@commentaire	#SHERIF10082

SHERIF10020	@ordre	#3;#SHERIF10090

	lda	t
	cmp	#2
	beq	SHERIF10050
	cmp	#3
	beq	SHERIF10060

SHERIF10030	@commentaire	#SHERIF10100
SHERIF10040	@image	#iSHERIF;#29063
	@image	#iSHERIF;#28930
	@bruitage
	@inkey
	@commentaire	#SHERIF10110
	@inkey
	jmp	DEBUT

SHERIF10050	@saisie
	@mot	#4
	beq	SHERIF10055
	@mot	#5
	beq	SHERIF10055
	@mot	#8
	bne	SHERIF10020

SHERIF10055	@mot	#6
	beq	SHERIF10058
	@mot	#7
	bne	SHERIF10020

SHERIF10058	@image	#iSHERIF;#32709
	@commentaire	#SHERIF10120
	@inkey
	@commentaire	#SHERIF10130
	@inkey
	jmp	MONTAGNE
	
SHERIF10060	@commentaire	#SHERIF10140
	@ordre	#2;#SHERIF10150
	
	lda	t
	cmp	#2
	beq	SHERIF10070
	jmp	SHERIF10030

SHERIF10070	@image	#iSHERIF;#30740
	@commentaire	#SHERIF10170
	@inkey
	jmp	JUGEMENT

*-------------------------------
* reno
*-------------------------------

pSHERIF	strl	'@/data/sherif.bin'

SHERIF10080	asc	' je voyais  soudain plusieurs   cavaliers entrant en ville'00
SHERIF10081	asc	' c'27'etait le  marshall de reno    et sa horde qui avait du     suivre ma trace  jusqu'27'ici'00
SHERIF10082	asc	' ils allaient  me reconnaitre'00
SHERIF10090	asc	'je prenais la fuite,j'27'essayais autre chose,je ne bougeais pas'00
SHERIF10100	asc	'   ils me  repererent et me        criblerent  de plomb'00
SHERIF10110	asc	' c'27'est ainsi que se terminait  mon periple  vers la liberte    le nez dans la poussiere'00
SHERIF10120	asc	'ils passerent  devant moi sansme reconnaitre et continuerent   vers le bureau du sherif'00
SHERIF10130	asc	'j'27'en profitais pour sauter sur   mon cheval et prendre la      direction des  montagnes'00
SHERIF10140	asc	' arrives a ma  hauteur ils me   reconnurent  et braquerent  leurs armes dans  ma direction'00
SHERIF10150	asc	'je degainais,je me rendais sans resister'00
SHERIF10160	asc	'ils ne me laisserent  meme pasle temps de toucher a mon colt'00
SHERIF10170	asc	'ils me passerent des braceletsaux poignets et me jeterent en  prison jusqu'27'a  mon proces'00

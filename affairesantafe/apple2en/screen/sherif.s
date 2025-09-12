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

SHERIF10080	asc	'    i suddenly saw several        horsemen entering town'00
SHERIF10081	asc	'  it was the marshal of reno   and his horde who must have      followed my trail here'00
SHERIF10082	asc	'      they were going to               recognize me'00
SHERIF10090	asc	'i fled,i tried something else,i did not move'00
SHERIF10100	asc	'     they spotted me and           riddled me with lead'00
SHERIF10110	asc	'    that was how my journey          to freedom ended            my nose in the dust'00
SHERIF10120	asc	'    they passed me without     recognizing me and continued  towards the sheriff'27's office'00
SHERIF10130	asc	'    i took the opportunity       to jump on my horse and        head for the mountains'00
SHERIF10140	asc	'when they reached me they reco gnized me and pointed their     weapons in my direction'00
SHERIF10150	asc	'i drew my gun,i surrended without resisting'00
SHERIF10160	asc	'  they did not even give me       time to touch my colt'00
SHERIF10170	asc	'   they put bracelets on my       wrists and threw me in         jail until my trial'00

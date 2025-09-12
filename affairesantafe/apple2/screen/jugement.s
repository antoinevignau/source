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

JUGEMENT	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE
	
	@charge_image	#iJUGEMENT;#pJUGEMENT

	@image	#iJUGEMENT;#35068	
	@commentaire	#JUGEMENT10070
	@inkey
	@commentaire	#JUGEMENT10080
	@inkey
	@commentaire	#JUGEMENT10090

	@ordre	#3;#JUGEMENT10100

	lda	t
	cmp	#2
	beq	JUGEMENT10030
	cmp	#3
	beq	JUGEMENT10040

	@image	#iJUGEMENT;#26051	; 1 coupable
	@commentaire	#JUGEMENT10110
	@inkey
	@commentaire	#JUGEMENT10112
	@inkey
	jmp	DEBUT

JUGEMENT10030	@commentaire	#JUGEMENT10120		; 2 non-coupable
	@inkey
	@image	#iJUGEMENT;#28026
	@commentaire	#JUGEMENT10122
	@inkey
	jmp	DEBUT

JUGEMENT10040	@image	#iJUGEMENT;#32159	; 3 fuite
	@commentaire	#JUGEMENT10130
	@chance
	
	lda	chance
	cmp	#0
	beq	JUGEMENT10055
	lda	jugement
	cmp	#0
	beq	JUGEMENT10060

JUGEMENT10055	@commentaire	#JUGEMENT10140
	@inkey
	@image	#iJUGEMENT;#30465
	@image	#iJUGEMENT;#30241
	@commentaire	#JUGEMENT10150
	@inkey
	jmp	DEBUT

JUGEMENT10060	@commentaire	#JUGEMENT10160
	@inkey
	@commentaire	#JUGEMENT10170
	@inkey
	
	lda	#1
	sta	nb
	sta	jugement
	jmp	RENO

*-------------------------------
* reno
*-------------------------------

pJUGEMENT	strl	'@/data/jugement.bin'

JUGEMENT10070	asc	'   je me retrouvais a  reno   le juge  mac allister avait lareputation  d'27'etre tres severe'00
JUGEMENT10080	asc	' il ouvrit la  seance de deux   coups de maillet et fit la   lecture du chef d'27'accusation'00
JUGEMENT10090	asc	'j'27'etais tout simplement accuse d'27'assassinat  et la legitime  defense n'27'etait pas reconnue'00
JUGEMENT10100	asc	'je plaidais coupable,je plaidais non-coupable,je tentais de fuir'00
JUGEMENT10110	asc	' j'27'etais condamne aux travaux      forces a  perpetuite'00
JUGEMENT10112	asc	'je finissais au penitencier de  yuma a casser des cailloux   jusqu'27'a la fin  de mes jours'00
JUGEMENT10120	asc	'j'27'etais condamne a etre pendu'00
JUGEMENT10122	asc	'je terminais mon aventure avec   une corde  autour du cou'00
JUGEMENT10130	asc	'   je me jetais   par l'27'une      des fenetres du tribunal'00
JUGEMENT10140	asc	'j'27'avais commis  l'27'erreur de me    prendre pour un oiseau'00
JUGEMENT10150	asc	'la malchance etait toujours la je faisais une chute de huit  metres et me  cassais le cou'00
JUGEMENT10160	asc	' par miracle je reussissais a  ne pas me casser le cou dans ma chute et a prendre la fuite'00
JUGEMENT10170	asc	'je me retrouvais  dans la memesituation que l'27'annee derniere    je devais  encore fuir'00

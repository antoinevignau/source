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

TRAPPEUR	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE
	
	@charge_image	#iTRAPPEUR;#pTRAPPEUR

	@image	#iTRAPPEUR;#35740
	@commentaire	#TRAPPEUR10150
	@inkey
	@image	#iTRAPPEUR;#33266
	@commentaire	#TRAPPEUR10160

	lda	argent
	cmp	#1
	bne	TRAPPEUR10025
	@ordre	#3;#TRAPPEUR10170
	jmp	TRAPPEUR10030
TRAPPEUR10025	@ordre	#2;#TRAPPEUR10170

TRAPPEUR10030	lda	t
	cmp	#2
	beq	TRAPPEUR10060
	cmp	#3
	beq	TRAPPEUR10070

TRAPPEUR10050	@image	#iTRAPPEUR;31185
	@bruitage
	@commentaire	#TRAPPEUR10180
	@inkey
	@commentaire	#TRAPPEUR10190
	@inkey
	jmp	DEBUT

TRAPPEUR10060	@commentaire	#TRAPPEUR10200
	@inkey
	@commentaire	#TRAPPEUR10210
	@inkey
	jmp	DESERT

TRAPPEUR10070	@image	#iTRAPPEUR;#29136
	@commentaire	#TRAPPEUR10220
	@inkey
	@commentaire	#TRAPPEUR10230

TRAPPEUR10080	@inkey_true	#A$

	lda	A$
	cmp	#0
	bne	TRAPPEUR10090

	@image	#iTRAPPEUR;#29057
	@temporisation	#100
	@image	#iTRAPPEUR;#28978
	@temporisation	#100
	@image	#iTRAPPEUR;#28899
	@temporisation	#100
	@image	#iTRAPPEUR;#28820
	@temporisation	#100
	jmp	TRAPPEUR10080
	
TRAPPEUR10090	@commentaire	#TRAPPEUR10240
	@image	#iTRAPPEUR;#26346
	
TRAPPEUR10100	@inkey_true	#A$
	
	lda	A$
	cmp	#0
	bne	TRAPPEUR10110

	@image	#iTRAPPEUR;#25732
	@temporisation	#300
	@image	#iTRAPPEUR;#25077
	@temporisation	#300
	jmp	TRAPPEUR10100

TRAPPEUR10110	@ordre	#2;#TRAPPEUR10250

	lda	t
	cmp	#2
	beq	TRAPPEUR10140

TRAPPEUR10130	jmp	CABANE

TRAPPEUR10140	@commentaire	#TRAPPEUR10210
	@inkey
	jmp	DESERT
	
*-------------------------------
* reno
*-------------------------------

pTRAPPEUR	strl	'@/data/trappeur.bin'

TRAPPEUR10150	asc	' la nuit allait me surprendre    sans que j'27'ai pu trouver            un abri sur'00
TRAPPEUR10160	asc	'soudain je me retrouvais face a un trappeur menacant qui me       barrait le passage'00
TRAPPEUR10170	asc	'je degainais,je demandais l'27'hospitalite,je proposais de l'27'argent'00
TRAPPEUR10180	asc	'je n'27'avais pas encore touche a mon arme lorsque la balle a   bison me fracassait la tete'00
TRAPPEUR10190	asc	' c'27'est ainsi que je finissais ma vie de malchance en tachant     la neige de mon sang'00
TRAPPEUR10200	asc	'  il n'27'avait que faire de ma   compagnie et je reprenais ma    descente vers la vallee'00
TRAPPEUR10210	asc	'j'27'arrivais dans la vallee deux  jours plus tard et prenais     la direction du mexique'00
TRAPPEUR10220	asc	'  en echange de cent dollars    il acceptait de m'27'heberger        jusqu'27'au printemps'00
TRAPPEUR10230	asc	'  je passais ainsi l'27'hiver a     apprendre le dur travail            de trappeur'00
TRAPPEUR10240	asc	' au printemps je quittais mon   compagnon et reprenais mon      chemin vers la liberte'00
TRAPPEUR10250	asc	'je passais le col,je preferais redescendre'00

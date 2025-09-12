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

TRAPPEUR10150	asc	' night was about to surprise     me without being able to           find a shelter'00
TRAPPEUR10160	asc	'   suddenly i found myself     facing a threatening trapper      who blocked my path'00
TRAPPEUR10170	asc	'i drew my gun,i asked for hospitality,i offered money'00
TRAPPEUR10180	asc	'   i had not yet touched my      weapon when the buffalo       bullet shattered my head'00
TRAPPEUR10190	asc	' that is how i ended my life    of misfortune staining the        snow with my blood'00
TRAPPEUR10200	asc	' he had no use for my company    and i resumed my descent         toward the valley'00
TRAPPEUR10210	asc	'   i arrived in the valley          two days later and            headed for mexico'00
TRAPPEUR10220	asc	'  in exchange for a hundred     dollars he agreed to house         me until spring'00
TRAPPEUR10230	asc	'      i spent the winter          learning the hard work             of a trapper'00
TRAPPEUR10240	asc	'   in the spring i left my       companion and resumed my        path toward freedom'00
TRAPPEUR10250	asc	'i crossed the pass,i preferred to go back down'00

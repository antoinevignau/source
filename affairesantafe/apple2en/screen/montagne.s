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

MONTAGNE	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexBLUE

	@charge_image	#iMONTAGNE;#pMONTAGNE

	@image	#iMONTAGNE;#34902
	@commentaire	#MONTAGNE10140
	@inkey
	@image	#iMONTAGNE;#32325
	@commentaire	#MONTAGNE10150

MONTAGNE10030	@ordre_tempo	#3;#MONTAGNE10160;#$0401	; 4 secondes, choix 1

	lda	t
	cmp	#2
	beq	MONTAGNE10060
	cmp	#3
	beq	MONTAGNE10070

MONTAGNE10050	@image	#iMONTAGNE;#29973
	@commentaire	#MONTAGNE10170
	@inkey
	@commentaire	#MONTAGNE10171
	@inkey
	jmp	DEBUT

MONTAGNE10060	@image	#iMONTAGNE;#27642
	@bruitage
	@commentaire	#MONTAGNE10180
	@inkey
	@commentaire	#MONTAGNE10190
	@inkey
	jmp	MONTAGNE10080

MONTAGNE10070	@commentaire	#MONTAGNE10200
	@inkey

MONTAGNE10080	@image	#iMONTAGNE;#25889
	@commentaire	#MONTAGNE10210
	@ordre	#2;#MONTAGNE10220

	lda	t
	cmp	#2
	beq	MONTAGNE10130

MONTAGNE10110	@commentaire	#MONTAGNE10230
	@inkey
	@image	#iMONTAGNE;#24375
	@commentaire	#MONTAGNE10240
	@inkey
	jmp	DEBUT

MONTAGNE10130	@commentaire	#MONTAGNE10250
	@inkey
	jmp	TRAPPEUR

*-------------------------------
* reno
*-------------------------------

pMONTAGNE	strl	'@/data/montagne.bin'

MONTAGNE10140	asc	' on the second day i began to      advance in deep snow'00
MONTAGNE10150	asc	'   suddenly i found myself      facing a threatening puma'00
MONTAGNE10160	asc	'i waited for his reaction,i tried to shoot it,i cautiously backed away'00
MONTAGNE10170	asc	'  the puma jumped on me with      astonishing speed and          ripped my throat out'00
MONTAGNE10171	asc	' it was in these inhospitable       mountains that my              adventure ended'00
MONTAGNE10180	asc	'  i shouldered my winchester      and shot it down with a           single bullet'00
MONTAGNE10190	asc	'      after stripping it           i continued my ascent'00
MONTAGNE10200	asc	'  the puma did not take its       eyes off me but let me             go quietly'00
MONTAGNE10210	asc	'    at that time the pass           seemed impassable'00
MONTAGNE10220	asc	'i attempted to cross,i looked for shelter'00
MONTAGNE10230	asc	'     i continued through          increasingly deep snow        exhausting my strength'00
MONTAGNE10240	asc	'  after my horse i succumbed      to the cold and hunger       thus ending my adventure'00
MONTAGNE10250	asc	' i began to look for shelter        to wait for spring'00

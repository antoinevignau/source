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

INDIEN	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE
	
	@charge_image	#iINDIEN;#pINDIEN

INDIEN10010	@image	#iINDIEN;#35903
	@commentaire	#INDIEN10070
	@inkey
	@image	#iINDIEN;#33566
	@commentaire	#INDIEN10080
	@ordre	#3;#INDIEN10090
	
	lda	t
	cmp	#2
	beq	INDIEN10030
	cmp	#3
	beq	INDIEN10040

INDIEN10020	@image	#iINDIEN;#28880
	@commentaire	#INDIEN10100
	@inkey
	@commentaire	#INDIEN10110
	@inkey
	jmp	DEBUT

INDIEN10030	@image	#iINDIEN;#30857
	@commentaire	#INDIEN10120
	@inkey
	jmp	INDIEN10060

INDIEN10040	@image	#iINDIEN;#26769
	@temporisation	#150
	@image	#iINDIEN;#26225
	@temporisation	#100
	@image	#iINDIEN;#25745
	@temporisation	#100
	@image	#iINDIEN;#25356
	@temporisation	#100
	@image	#iINDIEN;#24703
	@commentaire	#INDIEN10130

INDIEN10050	@ordre	#2;#INDIEN10140

	lda	t
	cmp	#1
	beq	INDIEN10030

INDIEN10060	@commentaire	#INDIEN10150
	@inkey
	jmp	VILLAGE

*-------------------------------
* reno
*-------------------------------

pINDIEN	strl	'@/data/indien.bin'

INDIEN10070	asc	'   i went deeper into this            desert expanse'00
INDIEN10080	asc	'   suddenly i found myself      surrounded by five apache     warriors obviously hostile'00
INDIEN10090	asc	'i fled,i took out my weapon,i made the peace sign'00
INDIEN10100	asc	'  i had not had the time to     walk a yard when the arrow            pierced me'00
INDIEN10110	asc	'  life hangs on such a small    thing that a simple piece     of wood put an end to mine'00
INDIEN10120	asc	'  the apaches were expecting   this. after a short struggle     i found myself tied up'00
INDIEN10130	asc	'   the one who seemed to be   the chief returned the salute   and asked me to follow him'00
INDIEN10140	asc	'i refused,i accepted'00
INDIEN10150	asc	'   they then led me towards           their village'00

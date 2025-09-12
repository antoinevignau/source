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

INDIEN10070	asc	'  je m'27'enfoncais plus encore  dans cette  etendue desertique'00
INDIEN10080	asc	'   soudain je me retrouvais     entoure de  cinq guerriers  apaches manifestement hostiles'00
INDIEN10090	asc	'je prenais la fuite,je sortais mon arme,je faisais le signe de paix'00
INDIEN10100	asc	'  je n'27'avais pas eu le temps     de faire un yard lorsque      la fleche  me transperca'00
INDIEN10110	asc	'la vie tient a si peu de chose qu'27'un simple morceau de bois    mettait fin  a la mienne'00
INDIEN10120	asc	'les apaches s'27'attendaient a ca apres une courte lutte je me  retrouvais solidement ligote'00
INDIEN10130	asc	'  celui qui semblait etre le  chef me rendait le salut et me    demandait de le suivre'00
INDIEN10140	asc	'je refusais,j'27'acceptais'00
INDIEN10150	asc	'   ils m'27'amenaient alors en     direction de  leur village'00

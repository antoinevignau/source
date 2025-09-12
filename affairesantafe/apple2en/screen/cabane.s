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

CABANE	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE
	
	@charge_image	#iCABANE;#pCABANE

	@image	#iCABANE;#36713
	@commentaire	#CABANE10160

CABANE10020	@inkey_true	#A$

	lda	A$
	cmp	#0
	bne	CABANE10030

	@image	#iCABANE;#36538
	@temporisation	#150
	@image	#iCABANE;#36363
	@temporisation	#150
	@image	#iCABANE;#36188
	@temporisation	#150
	jmp	CABANE10020

CABANE10030	@commentaire	#CABANE10170
	@ordre	#2;#CABANE10180
	
	lda	t
	cmp	#2
	beq	CABANE10060

CABANE10050	jmp	CHASSEUR

CABANE10060	lda	#1
	sta	maggy
	
	@commentaire	#CABANE10190
	@inkey
	@image	#iCABANE;#33585
	@commentaire	#CABANE10200

CABANE10070	@ordre	#2;#CABANE10210
	
	lda	t
	cmp	#2
	beq	CABANE10100

CABANE10080	@commentaire	#CABANE10220
	@image	#iCABANE;#24751
	@inkey
	@commentaire	#CABANE10230
	@inkey
	@commentaire	#CABANE10240
	@inkey
	@commentaire	#CABANE10250
	@image	#iCABANE;#26463
	@commentaire	#CABANE10260
	@inkey
	jmp	CHASSEUR

CABANE10100	@saisie
	@mot	#8
	beq	CABANE10110
	@mot	#9
	bne	CABANE10070

CABANE10110	@image	#iCABANE;#33205
	@temporisation	#500
	@image	#iCABANE;#32506
	@temporisation	#500
	@commentaire	#CABANE10270
	@inkey
	@commentaire	#CABANE10271

	@image	#iCABANE;#30197
	@inkey
	@commentaire	#CABANE10280
	
CABANE10130	@inkey_true	#A$
	lda	A$
	cmp	#0
	bne	CABANE10140

	@image	#iCABANE;#29371
	@temporisation	#200
	@image	#iCABANE;#28598
	@temporisation	#500

	inc	nb
	lda	nb
	cmp	#4
	bcc	CABANE10130

CABANE10140	@commentaire	#CABANE10290
	@inkey
	@commentaire	#CABANE10300
	@inkey
	jmp	DEBUT

*-------------------------------
* reno
*-------------------------------

pCABANE	strl	'@/data/cabane.bin'

CABANE10160	asc	'   at the exit of the wood      i discovered a burnt cabin'00
CABANE10170	asc	'  it was apache work and it    was not good to linger there'00
CABANE10180	asc	'i moved on,i approached'00
CABANE10190	asc	'i advanced cautiously between  the tortured bodies and the          smoking debris'00
CABANE10200	asc	'   at the back of the barn      i discovered a young woman       miraculously spared'00
CABANE10210	asc	'i untied her,i had another idea in mind'00
CABANE10220	asc	' after giving her something to  drink she told me what she       had just experienced'00
CABANE10230	asc	'  the apaches had arrived at    midday and had killed and     tortured her entire family'00
CABANE10240	asc	'  she knelt down and prayed        aloud to god singing'00
CABANE10250	asc	' the apaches had surely taken       her for a madwoman         which had saved her life'00
CABANE10260	asc	'  after having bury maggy'27's      parents and her brother       i carried her behind me'00
CABANE10270	asc	'  she was attractive and did           not seem shy'00
CABANE10271	asc	'   after untying her i laid       her on the ground and               raped her'00
CABANE10280	asc	'  i did not realize that she     had managed to get hold            of my cutlass'00
CABANE10290	asc	' she stabbed me in the chest     and then watched me die'00
CABANE10300	asc	' i then remembered my mother  warning me to be wary of women'00
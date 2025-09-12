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

GOLD	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE
	
	@charge_image	#iGOLD;#pGOLD

GOLD10010	@image	#iGOLD;#36326
	@commentaire	#GOLD10210
GOLD10020	@ordre	#2;#GOLD10220

GOLD10030	lda	t
	cmp	#2
	beq	GOLD10040
	jmp	GOLD10090

GOLD10040	@image	#iGOLD;#22942
	@commentaire	#GOLD10230
GOLD10050	@ordre	#2;#GOLD10240
	
GOLD10060	lda	t
	cmp	#2
	beq	GOLD10070
	jmp	GOLD10090

GOLD10070	lda	#1
	sta	argent
	
	@image	#iGOLD;#29572
	@commentaire	#GOLD10250
	@inkey
	
GOLD10080	@commentaire	#GOLD10260
	jmp	GOLD10170

GOLD10090	@image	#iGOLD;#34290
	@commentaire	#GOLD10300
GOLD10100	@ordre	#3;#GOLD10310
	
GOLD10110	lda	t
	cmp	#1
	beq	GOLD10120
	cmp	#2
	beq	GOLD10130
	jmp	GOLD10160

GOLD10120	@image	#iGOLD;#32305
	@image	#iGOLD;#31443
	@temporisation	#100
	@image	#iGOLD;#32305
	
	inc	boire
	lda	boire
	cmp	#5
	bne	GOLD10100
	jmp	GOLD10200

GOLD10130	@image	#iGOLD;#20750
	@commentaire	#GOLD10330
	@inkey
	@commentaire	#GOLD10340
	@ordre	#2;#GOLD10350
	
	lda	t
	cmp	#2
	beq	GOLD10150

GOLD10140	@bruitage
	@bruitage
	@image	#iGOLD;#25565
	@commentaire	#GOLD10360
	@inkey
	@commentaire	#GOLD10370
	@inkey
	jmp	DEBUT

GOLD10150	@commentaire	#GOLD10380
	jmp	GOLD10170

GOLD10160	@image	#iGOLD;#27034
	@commentaire	#GOLD10390
	@inkey
	@commentaire	#GOLD10400

GOLD10170	@ordre	#2;#GOLD10270

	lda	t
	cmp	#2
	beq	GOLD10190

GOLD10180	@commentaire	#GOLD10280
	@inkey
	jmp	SHERIF

GOLD10190	@commentaire	#GOLD10290
	@inkey
	jmp	MONTAGNE

GOLD10200	@commentaire	#GOLD10320
	@inkey
	jmp	GOLD10170

*-------------------------------
* reno
*-------------------------------

pGOLD	strl	'@/data/gold.bin'

GOLD10210	asc	'    i arrived at gold-city             at nightfall'00
GOLD10220	asc	'i entered the saloon,i looked for a stable'00
GOLD10230	asc	'i found an old abandoned barn  at the end of the town where       i parked my horse'00
GOLD10240	asc	'i went to the saloon,i feel asleep in a corner'00
GOLD10250	asc	' i lay down on a pile of hay     and spent a night filled          with nightmares'00
GOLD10260	asc	'   in the morning i woke up           in great shape'00
GOLD10270	asc	'i stayed in town,i continued on my way'00
GOLD10280	asc	'    i started looking for               a canteen'00
GOLD10290	asc	'  i saddled up my horse and      headed for the mountains'00
GOLD10300	asc	'  i entered the saloon where     the atmosphere was like            a gambling den'00
GOLD10310	asc	'i had a drink,i played poker,i rode with a girl'00
GOLD10320	asc	'   in the morning i woke up      in an alley with a heavy       head and empty pockets'00
GOLD10330	asc	'   i sat down at a table of   ranchers who were playing big'00
GOLD10340	asc	'       i lost regularly               i had to react'00
GOLD10350	asc	'i took a chance,i waited for my chance'00
GOLD10360	asc	'   they knew the trick and       did not give me a chance'00
GOLD10370	asc	'  i ended my adventure under     a small pile of dirt in        the gold-city cemetery'00
GOLD10380	asc	' i was completely raked over       and by morning i was               penniless'00
GOLD10390	asc	'  the girl had a temper and         put me on my knees           i succumbed to sleep'00
GOLD10400	asc	'   in the morning i woke up      in her bed a few dollars     lighter but in great shape'00

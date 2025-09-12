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

RENO	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE
	
	lda	#1
	sta	argent

	@charge_image	#iRENO;#pRENO

	@image	#iRENO;#33290
	@commentaire	#reno10210
	@inkey
	@commentaire	#reno10220

reno10030	lda	nb
	cmp	#0
	bne	reno10035

	@ordre	#4;#reno10230
	bra	reno10040
reno10035	@ordre	#4;#reno10230

reno10040	lda	t
	cmp	#1
	beq	reno10050
	cmp	#2
	beq	reno10060
	cmp	#3
	beq	reno10070
	cmp	#4
	beq	reno10080
reno10050	@commentaire	#reno10270
	@inkey
	jmp	DESERT
reno10060	@commentaire	#reno10280
	@inkey
	jmp	MONTAGNE
reno10070	@commentaire	#reno10290
	@inkey
	jmp	GOLD
reno10080	@image	#iRENO;29381
	@commentaire	#reno10250
	
	lda	#1
	sta	nb
	
	@ordre	#3;#reno10260

	lda	t
	cmp	#1
	beq	reno10110
	cmp	#2
	beq	reno10110

reno10100	@image	#iRENO;#33290
	@commentaire	#reno10240
	jmp	reno10030

reno10110	@image	#iRENO;#30965
	@commentaire	#reno10300
	@inkey
	
	lda	t
	cmp	#2
	beq	reno10160
	
reno10130	@ordre	#2;#reno10310
	
	lda	t
	cmp	#1
	beq	reno10160

* IF (mot(28) AND mot(29)) OR (MOT(2)) OR (MOT(3) AND (MOT(30) OR mot(31)))

reno10150	@saisie
	@mot	#2	; MOT(2)
	beq	reno10158
	
	@mot	#28	; or MOT(28)
	bne	reno10154
	@mot	#29	; and MOT(29)
	beq	reno10158

reno10154	@mot	#3	; MOT(3)
	bne	reno10130
	@mot	#30	; and MOT(30)
	beq	reno10158
	@mot	#31	; or MOT(31)
	bne	reno10130
	
reno10158	@image	#iRENO;#27018
	@commentaire	#reno10320
	@inkey
	jmp	reno10170

* END IF
	
reno10160	@image	#iRENO;#25247
	@bruitage
	@commentaire	#reno10330
	@inkey
	@commentaire	#reno10340
	@inkey
	jmp	DEBUT
reno10170	@commentaire	#reno10350
	@ordre	#2;#reno10360
	
	lda	t
	cmp	#2
	beq	reno10200
reno10190	@image	#iRENO;#25247
	@bruitage
	@commentaire	#reno10370
	@inkey
	@commentaire	#reno10340
	@inkey
	jmp	DEBUT
reno10200	@image	#iRENO;#23537
	@commentaire	#reno10380
	@inkey
	jmp	JUGEMENT

*-------------------------------
* reno
*-------------------------------

pRENO	strl	'@/data/reno.bin'

reno10210	asc	' i had to flee the country if   I did not want to swing at        the end of a rope'00
reno10220	asc	'   i took my map out of its        case and studied it'00
reno10230	asc	'i headed south,headed west,headed north,headed east'00
reno10240	asc	'    i had no choice but to     flee as quickly as possible'00
reno10250	asc	' to the east a cloud of dust     indicated the arrival of         several horsemen'00
reno10260	asc	'i advanced quietly,i waited colt in hand,i turned around'00
reno10270	asc	'   i headed towards Mexico'00
reno10280	asc	'  i began the ascent of the          white mountains'00
reno10290	asc	'  i headed towards Gold-City  '00
reno10300	asc	' it was the reno marshall and    his deputies chasing me'00
reno10310	asc	'i tried to draw,i tried something else'00
reno10320	asc	'   i raised my arms and let         myself be disarmed'00
reno10330	asc	' i managed to shoot two men      before taking a bullet             in the chest'00
reno10340	asc	'my mother definitively had not  brought me into the world    to live and die in the west'00
reno10350	asc	' the marshal was taking me to     town where a judge was            waiting for me'00
reno10360	asc	'i ran away,i let myself be led'00
reno10370	asc	'i had forgotten that in a race  it was the bullet that won         before the horse'00
reno10380	asc	'  i was waiting for my time    or rather that of my judment'00

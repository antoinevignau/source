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

reno10210	asc	' je devais fuir le pays si je   ne voulais pas me balancer       au bout d'27'une corde'00
reno10220	asc	'  je sortais ma carte de son        etui et l'27'etudiais '00
reno10230	asc	'je me dirigeais vers le sud,vers l'27'ouest,vers le nord,vers l'27'est'00
reno10240	asc	'   je n'27'avais plus le choix    il fallait fuir au plus vite'00
reno10250	asc	'a l'27' est un nuage de poussiere   m'27'indiquait l'27'arrivee de        plusieurs cavaliers'00
reno10260	asc	'j'27'avancais tranquillement,j'27'attendais colt au poing,je faisais demi-tour'00
reno10270	asc	'   je partais en direction              du mexique'00
reno10280	asc	'  je commencais l'27'ascension       des montagnes blanches'00
reno10290	asc	'   je partais en direction             de gold-city'00
reno10300	asc	'c'27'etait le marshall de reno et  ses suppleants lances a ma            poursuite'00
reno10310	asc	'je tentais de degainer,j'27'essayais autre chose'00
reno10320	asc	'   je levais les bras et me         laissais desarmer'00
reno10330	asc	' j'27'arrivais a en etendre deux   avant de prendre une balle        en pleine poitrine'00
reno10340	asc	'decidement ma mere  ne m'27'avait  pas mis au monde pour vivre     et mourir dans l'27'ouest'00
reno10350	asc	' le marshall me conduisait en  ville ou un juge m'27'attendait'00
reno10360	asc	'je prenais la fuite,je me laissais conduire'00
reno10370	asc	'j'27'avais oublie  qu'27'a la course c'27'etait la balle qui gagnait        devant le cheval'00
reno10380	asc	'   j'27'attendais mon heure ou    plutot celle de mon jugement'00

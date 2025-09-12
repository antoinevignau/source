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

CHASSEUR	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE

	@charge_image	#iCHASSEUR;#pCHASSEUR

	@image	#iCHASSEUR;#36030
	
	lda	maggy
	cmp	#1
	bne	CHASSEUR10025
	@commentaire	#CHASSEUR10090
	jmp	CHASSEUR10030
CHASSEUR10025	@commentaire	#CHASSEUR10100

CHASSEUR10030	@inkey
	@image	#iCHASSEUR;#33448
	@commentaire	#CHASSEUR10110
	@inkey
	@commentaire	#CHASSEUR10120
	@inkey
	@commentaire	#CHASSEUR10130
	@ordre	#2;#CHASSEUR10140
	
	lda	t
	cmp	#1
	beq	CHASSEUR10040
	jmp	CHASSEUR10080

CHASSEUR10040	@image	#iCHASSEUR;#29604
	@commentaire	#CHASSEUR10150
	
	lda	maggy
	cmp	#1
	beq	CHASSEUR10060
	
	@inkey

CHASSEUR10050	@commentaire	#CHASSEUR10160
	@inkey
	@commentaire	#CHASSEUR10170
	@inkey
	jmp	JUGEMENT

CHASSEUR10060	@chance

	lda	chance
	cmp	#0
	bne	CHASSEUR10050

	@commentaire	#CHASSEUR10200
	@inkey
	@commentaire	#CHASSEUR10201
	@inkey
	@image	#iCHASSEUR;#31407
	@bruitage
	@commentaire	#CHASSEUR10210
	@inkey
	@commentaire	#CHASSEUR10220
	@inkey

CHASSEUR10070	lda             #1
                sta             fgFRAME
                
             	@window	#1;#theWINDOW4
	@paper	#1;#indexBLACK
	@pen	#1;#indexWHITE
	@commentaire	#CHASSEUR10230
	@inkey
	
	@image	#iCHASSEUR;#22728
	@window	#1;#theWINDOW6
	@paper	#1;#indexPERIBLUE
	@pen	#1;#indexWHITE
	@commentaire	#CHASSEUR10240
	@inkey
	jmp	DEBUT

CHASSEUR10080	@image	#iCHASSEUR;#33201
	@temporisation	#300
	@image	#iCHASSEUR;#33074
	@bruitage
	@temporisation	#100
	@image	#iCHASSEUR;#33201
	@temporisation	#2000
	@image	#iCHASSEUR;#33448
	@commentaire	#CHASSEUR10180
	@inkey
	@commentaire	#CHASSEUR10190
	@inkey
	jmp	DEBUT
	
*-------------------------------
* reno
*-------------------------------

pCHASSEUR	strl	'@/data/chasseur.bin'

CHASSEUR10090	asc	'    after two long days of       travelling we arrived in             pecos-city'00
CHASSEUR10100	asc	'    after two long days of       travelling i arrived in             pecos-city'00
CHASSEUR10110	asc	'just as i had just dismounted     in front of the hotel          a man approached me'00
CHASSEUR10120	asc	'    he ordered me to stop         moving if i wanted to               stay alive'00
CHASSEUR10130	asc	'    he was a bounty hunter     and he told me  i was wanted         dead or alive'00
CHASSEUR10140	asc	'i let myself be tied up,i tried to shoot him down'00
CHASSEUR10150	asc	'  after tying me to my horse        headed towards the             sheriff'27's office'00
CHASSEUR10160	asc	'  he was collecting his five      hundred dollars bonus        while i was put in jail'00
CHASSEUR10170	asc	'  the following month i was      driven to reno where my           trial awaited me'00
CHASSEUR10180	asc	' it was the first time i had     seen a guy draw and fire             so quickly'00
CHASSEUR10190	asc	' as i collapsed to the ground  i told myself that this was    also the last i'27'd see this'00 
CHASSEUR10200	asc	'   when he tied me up he no   longer paid attention to maggy'00
CHASSEUR10201	asc	'   she grabbed my winch and     neatly brought the bounty            hunter down'00
CHASSEUR10210	asc	'     the escape again but     this time there were two of us'00
CHASSEUR10220	asc	'  three years later we found    ourselves in oregon under     assumed names and married'00
CHASSEUR10230	asc	'  i had shaved my beard and      was now running a small       ranch with maggy who had       already given me a son         perhaps  happiness...'00
CHASSEUR10240	asc	' end of episode'00
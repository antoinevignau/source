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

JUGEMENT	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE
	
	@charge_image	#iJUGEMENT;#pJUGEMENT

	@image	#iJUGEMENT;#35068	
	@commentaire	#JUGEMENT10070
	@inkey
	@commentaire	#JUGEMENT10080
	@inkey
	@commentaire	#JUGEMENT10090

	@ordre	#3;#JUGEMENT10100

	lda	t
	cmp	#2
	beq	JUGEMENT10030
	cmp	#3
	beq	JUGEMENT10040

	@image	#iJUGEMENT;#26051	; 1 coupable
	@commentaire	#JUGEMENT10110
	@inkey
	@commentaire	#JUGEMENT10112
	@inkey
	jmp	DEBUT

JUGEMENT10030	@commentaire	#JUGEMENT10120		; 2 non-coupable
	@inkey
	@image	#iJUGEMENT;#28026
	@commentaire	#JUGEMENT10122
	@inkey
	jmp	DEBUT

JUGEMENT10040	@image	#iJUGEMENT;#32159	; 3 fuite
	@commentaire	#JUGEMENT10130
	@chance
	
	lda	chance
	cmp	#0
	beq	JUGEMENT10055
	lda	jugement
	cmp	#0
	beq	JUGEMENT10060

JUGEMENT10055	@commentaire	#JUGEMENT10140
	@inkey
	@image	#iJUGEMENT;#30465
	@image	#iJUGEMENT;#30241
	@commentaire	#JUGEMENT10150
	@inkey
	jmp	DEBUT

JUGEMENT10060	@commentaire	#JUGEMENT10160
	@inkey
	@commentaire	#JUGEMENT10170
	@inkey
	
	lda	#1
	sta	nb
	sta	jugement
	jmp	RENO

*-------------------------------
* reno
*-------------------------------

pJUGEMENT	strl	'@/data/jugement.bin'

JUGEMENT10070	asc	'    i found myself in reno       judge mac allister had a    reputation for being strict'00
JUGEMENT10080	asc	'  he opened the session with      two raps of his gavel          and read the charge'00
JUGEMENT10090	asc	'   i was simply accused of       murder and self-defense          was not recognized'00
JUGEMENT10100	asc	'i pleaded guilty,i pleaded not guilty,i tried to escape'00
JUGEMENT10110	asc	'      i was sentenced to           hard labor for life'00 
JUGEMENT10112	asc	'    i ended up in the yuma     penitentiary breaking rocks     for the rest of my life'00
JUGEMENT10120	asc	'   i was sentenced to being               hanged'00
JUGEMENT10122	asc	'    i ended my life with a         rope around my neck'00
JUGEMENT10130	asc	'    i threw myself out of         the courtroom windows'00
JUGEMENT10140	asc	'  i had made the mistake of       thinking i was a bird'00
JUGEMENT10150	asc	'   bad luck was still there         i fell thirty feet            and broke my neck'00
JUGEMENT10160	asc	'    miraculously i managed      not to break my neck in my         fall and to flee'00
JUGEMENT10170	asc	'  i found myself in the same      situation as last year         i had to flee again'00

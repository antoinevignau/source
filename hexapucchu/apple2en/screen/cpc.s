*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

CPC	@LOAD	#pCPC
CPC_60	@SHOWPIC
CPC_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	CPC_200
	cmp	#'2'
	beq	CPC_1000
	cmp	#'3'
	beq	CPC_300
	cmp	#'4'
	beq	CPC_400
	bne	CPC_LOOP	

CPC_200	@PRINT	#cpc_str200
	@INKEY
	jmp	MORT

CPC_300	@PRINT	#cpc_str300
	@INKEY
	jmp	MORT

CPC_400	@PRINT	#cpc_str400
	@INKEY
	jmp	CPC_60

CPC_1000	@PRINT	#cpc_str1000
CPC_1190	@PRINT	#cpc_str1190
	@INPUT
	jsr	CPC_CHECKBAD
	bcc	CPC_1500
	jsr	CPC_CHECKGOOD
	bcc	CPC_2000

	@SOUND	#1;#100;#0
	
	@LOCATE	#13;#24	; clear the "choix"
	ldx	#0
]lp	phx
	lda	#143
	jsr	COUT160
	plx
	inx
	cpx	#15
	bcc	]lp
	jmp	CPC_1190
	
CPC_1500	@PRINT	#cpc_str1500
	@INKEY
	jmp	MORT

CPC_2000	jmp	DISCO

*---

CPC_CHECKBAD	ldy	#0
]lp	lda	tblBADWORDS,y
	beq	CPC_NOBAD
	sta	CPC_CHECK1+1
	jsr	CPC_CHECK	; compare a word
	bcc	CPC_OKBAD
	iny
	iny
	bne	]lp
CPC_NOBAD	sec		; no bad word found
CPC_OKBAD	rts		; ...or found

*---

CPC_CHECKGOOD	ldy	#0
]lp	lda	tblGOODWORDS,y
	beq	CPC_NOGOOD
	sta	CPC_CHECK1+1
	jsr	CPC_CHECK	; compare a word
	bcc	CPC_OKGOOD
	iny
	iny
	bne	]lp
CPC_NOGOOD	sec		; no bad word found
CPC_OKGOOD	rts		; ...or found

*--- Compare a word

CPC_CHECK	ldx	#0
	sep	#$20
CPC_CHECK1	lda	$bdbd,x
	cmp	IN,x
	bne	CPC_NOCHECK
	lda	IN,x
	beq	CPC_OKCHECK
	inx
	cpx	#maxLEN
	bcc	CPC_CHECK1
CPC_NOCHECK	rep	#$20	; different word
	sec
	rts
CPC_OKCHECK	rep	#$20	; same word
	clc
	rts

*---

pCPC	strl	'@/data/cpc'

tblBADWORDS	da	badword1,badword2,badword3
	da	badword4,badword5,badword6
	da	badword7,badword8,badword9
	da	badwordA,badwordB,badwordC
	ds	2

badword1	asc	'1'00	
badword2	asc	'BARBARIAN'00
badword3	asc	'BARBARIAN.BIN'00
badword4	asc	'3'00
badword5	asc	'GRYZOR'00
badword6	asc	'GRYZOR.BIN'00
badword7	asc	'4'00
badword8	asc	'IKARI'00
badword9	asc	'IKARI.BIN'00
badwordA	asc	'5'00
badwordB	asc	'RENEGADE'00
badwordC	asc	'RENAGADE.BIN'00

tblGOODWORDS	da	goodword1,goodword2,goodword3
	ds	2

goodword1	asc	'2'00	
goodword2	asc	'DISCO'00
goodword3	asc	'DISCO.BAS'00

*---

cpc_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'As soon as you release the key,'0d
	asc	'the computer goes crazy and shows:'0d
	dfb	eWAIT,120
	dfb	ePEN,2
	asc	''0d
	asc	'Booting system...'0d
	dfb	eWAIT,90
	dfb	ePEN,3
	asc	''0d
	asc	'Intrusion detected!'0d
	dfb	eWAIT,90
	dfb	ePEN,2
	asc	''0d
	asc	'System locked.'0d
	dfb	eWAIT,90
	asc	''0d
	asc	'Initializing self-destruct...'0d
	dfb	eWAIT,90
	dfb	ePEN,1
	asc	''0d
	asc	'A small PLOP is heard...'0d
	asc	'followed by a massive BOOM!'0d
	asc	'Everything explodes.'0d
	asc	''0d
	asc	'        ...You included!'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

cpc_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You stick your hand into the hole'0d
	asc	'where the gear once sat.'0d
	asc	'You search blindly...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'CLACK!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A sharp noise,'0d
	asc	'followed by sharp pain:'0d
	asc	'A trap just sliced off your hand!'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Blood sprays like a geyser.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You realize two things:'0d
	dfb	ePEN,1
	asc	''0d
	asc	'1) That was a bad idea.'0d
	asc	'2) You'27'll never write your memoirs'0d
	asc	'again.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'You bleed out and die'0d
	asc	'with a rather silly scream.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

cpc_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Wait... Yes! You remember now!'0d
	asc	''0d
	asc	'This machine looks a lot like'0d
	asc	'an AMSTRAD CPC 6128!!!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'The one you got for Christmas,'0d
	asc	'back when you were a kid!'0d
	asc	''0d
	asc	'What if that gear was really...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'...an ancient floppy disk?'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

cpc_str1000	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,24
	dfb	eINK,2,20
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	dfb	eSOUND,1,100,0
	asc	'Incatrad 16K Microcomputer  (v0.1)'0d
	dfb	eWAIT,20
	asc	''0d
	asc	a9'984 Incatrad Consumer Electronics plc'0d	; (c) copyright
	dfb	eWAIT,20
	asc	'          and Locomotive Software Ltd.'0d
	dfb	eWAIT,20
	asc	''0d
	asc	'BASIC 0.1 '0d
	dfb	eWAIT,40
*	dfb	eWAIT,50
	dfb	ePEN,1
	asc	''0d
	asc	'CAT'0d
	dfb	eWAIT,90
	asc	''0d
	asc	'Drive A: user 0'0d
	asc	''0d
	asc	'BARBARIAN.BIN  10K    DISCO   .BAS   2K'0d
	dfb	eWAIT,20
	asc	'GRYZOR   .BIN  12K    IKARI   .BIN  13K'0d
	dfb	eWAIT,20
	asc	'RENEGADE .BIN  9K'0d
	dfb	eWAIT,20
	asc	''0d
	asc	'132K free'0d
	dfb	eWAIT,20
	dfb	ePEN,2
	dfb	eLOCATE,1,19
	asc	'Type the name of a program to run'0d
	dfb	eEOD

cpc_str1190	dfb	ePEN,1
	dfb	eLOCATE,1,24
	asc	'Your choice '
	dfb	eEOD

cpc_str1500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Seriously?'0d
	asc	''0d
	asc	'You really think this is the time to'0d
	asc	'play games?'0d
	asc	''0d
	asc	'Really?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Alas, this was a security system'0d
	asc	'meant to detect casual gamers...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'And it looks like you just got caught.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'The computer initiates a defense'0d
	asc	'sequence...'0d
	asc	''0d
	asc	'...just before it explodes!'0d
	asc	''0d
	dfb	ePEN,1
	asc	'Game Over, my friend.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

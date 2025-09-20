*
* Le secret d'Anubis
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

	ext	CHAT_str100
	ext	CHAT_str200
	ext	CHAT_str300
	ext	CHAT_str400
	ext	CHAT_str500
	ext	CHAT_str600
	ext	CHAT_str700
	ext	CHAT_str800
	ext	CHAT_str900
	ext	CHAT_str1000
	ext	CHAT_str1100
	ext	CHAT_str1200
	ext	CHAT_str1300
	ext	CHAT_str1400
	ext	CHAT_str1500
	ext	CHAT_str1600

CHAT	@LOAD	#pCHAT
CHAT_60	@SHOWPIC

	@WINDOW	#1;#theWINDOW1
	@PRINT	#1;CHAT_str100
	@PRINT	#0;CHAT_str200

CHAT_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	CHAT_200
CHAT_200	cmp	#'2'
	bne	CHAT_210
CHAT_210	cmp	#'3'
	bne	CHAT_220
CHAT_220	cmp	#'4'
	bne	CHAT_230
CHAT_230	cmp	#'5'
	bne	CHAT_240
CHAT_240	cmp	#'6'
	bne	CHAT_250
CHAT_250	cmp	#'7'
	bne	CHAT_260
CHAT_260	cmp	#'8'
	bne	CHAT_270
CHAT_270	cmp	#'9'
	bne	CHAT_LOOP	

CHAT_300	@PRINT	#0;CHAT_str300
	@INKEY
	jmp	CHAT_60

CHAT_400	@PRINT	#0;CHAT_str400
	@INKEY
	jmp	CHAT_60

CHAT_500	@PRINT	#0;CHAT_str500
	@INKEY
	jmp	CHAT_60

CHAT_600	@PRINT	#0;CHAT_str600
	@INKEY
	jmp	CHAT_60

CHAT_700	@PRINT	#0;CHAT_str700
	@INKEY
	jmp	CHAT_60

CHAT_800	@PRINT	#0;CHAT_str800
	@INKEY
	jmp	CHAT_60

CHAT_900	@PRINT	#0;CHAT_str900
	@INKEY
	jmp	CHAT_60

CHAT_1000	@PRINT	#0;CHAT_str1000
	@INKEY
	jmp	CHAT_60

CHAT_1100	@PRINT	#0;CHAT_str1100
	@INKEY
	jmp	CHAT_60

CHAT_1200	@PRINT	#0;CHAT_str1200
	@INKEY
	jmp	CHAT_60

*---

pCHAT	strl	'@/data/chat.lz4'

CHAT_str100	ent
*	dfb	eMODE,1
*	dfb	eINK,0,0
*	dfb	eINK,1,6
*	dfb	eINK,2,15
*	dfb	eINK,3,24
*	dfb	eBORDER,0
*	dfb	ePAPER,0
*	dfb	eCLS
	dfb	ePEN,3*3	; 3
*	asc	'12345678901'
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''
	dfb	eEOD

CHAT_str200	ent
*	dfb	eMODE,1
*	dfb	eINK,0,0
*	dfb	eINK,1,6
*	dfb	eINK,2,15
*	dfb	eINK,3,24
*	dfb	eBORDER,0
*	dfb	ePAPER,0
*	dfb	eCLS
	dfb	eLOCATE,13,20
	dfb	ePEN,2*3	; 2
	asc	'QUE FAITES-VOUS ?'
	dfb	ePEN,3*3	; 3
	dfb	eLOCATE,4,21
	asc	''
	dfb	ePEN,6	; 2
	dfb	eLOCATE,4,22
	asc	''
	dfb	ePEN,9	; 3
	dfb	eLOCATE,4,23
	asc	''
	dfb	ePEN,6	; 2
	dfb	eLOCATE,4,24
	asc	''
	dfb	eEOD

CHAT_str300	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str400	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str500	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str600	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str700	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str800	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str900	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str1000	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str1100	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str1200	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

CHAT_str1300	ent
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,6
	dfb	eINK,2,15
	dfb	eINK,3,24
	dfb	eBORDER,0
	dfb	ePAPER,0
	dfb	eCLS
	dfb	ePEN,3
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

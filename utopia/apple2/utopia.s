*
* Futuria
* by William Demas
*
* (c) 1985, Unicorn Software
* (c) 2026, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-----------------------------------
* EQUATES
*-----------------------------------

*-------------- Game

NB_ACTIONS	=	36	; number of actions (AV += 2)
NB_CAR	=	32	; authorize words of 32 chars
NB_P1	=	10	; nombre de conditions
NB_P2	=	32	; nombre de conditions
LEN_WORD	=	4	; but limit to 4
MAX_LEN	=	70	; max length of string

MAX_CARRIED	=	7	; max number of objects I carry

ZERO	=	0
ONE	=	1
CARRIED	=	255	; set in tblO if I carry the object

TRUE	=	$ffff
FALSE	=	$0000

gameACT	=	$a0	; action
gameEOL	=	$b0	; end of table line
gameEOT	=	$f0	; end of table

*-----------------------------------
* WINDOWS
*-----------------------------------

wMESSAGE	=	1
wDESCRIPTION	=	2
wOBJECTS	=	3
wISSUES	=	4

tblWINDOW1	dw	1,40,1,25	; messages
tblWINDOW2	dw	41,80,15,16	; description
tblWINDOW3	dw	41,80,17,24	; objects
tblWINDOW4	dw	41,80,25,25	; exits/issues

*-----------------------------------
* ENTRY POINT
*-----------------------------------

PLAY	@MODE	#2
	@BORDER	#15
	@WINDOW	#1;#tblWINDOW1
	@PAPER	#1;#15
	@PEN	#1;#0
	@WINDOW	#2;#tblWINDOW2
	@PAPER	#2;#15
	@PEN	#2;#0
	@WINDOW	#3;#tblWINDOW3
	@PAPER	#3;#15
	@PEN	#3;#0
	@WINDOW	#4;#tblWINDOW4
	@PAPER	#4;#15
	@PEN	#4;#0

*-----------------------------------
* THE GAME
*-----------------------------------

REPLAY	@CLS	#0
	
	jsr	initALL
	jsr	Anon31

	lda	#FIRST_ROOM
	sta	SALLE

*-------------- MAIN LOOP

:100	jsr	checkCONDITIONS
	
:1120	@PRINT	#wMESSAGE;#strCOMMANDE
	@INPUT	#TEXTBUFFER;#MAX_LEN
	jsr	:6000	; cherche les mots
	
*--- Transform simple direction in a two-word command
* from N to GO NORTH

	lda	X$2	; there is a noun
	and	#$ff
	bne	:1127	; skip
	
	lda	X$1	; verb is not
	and	#$ff
	cmp	#1	; 1-byte long
	bne	:1127	; skip

	lda	X$1+1	; get letter
	and	#$ff
	ldx	#iNOUN_NORTH	; and index
	cmp	#chrNORD	; and compare...
	beq	:1124
	inx
	cmp	#chrSUD
	beq	:1124
	inx
	cmp	#chrEST
	beq	:1124
	inx
	cmp	#chrOUEST
	beq	:1124
	inx
	cmp	#chrHAUT
	beq	:1124
	inx
	cmp	#chrBAS
	bne	:1127
	
:1124	stx	MO$2	; found the direction
	lda	#iVERB_GO	; and the GO verb
	sta	MO$1

:1127

*-----------------------------------
* CHECK DIRECTIONS
*-----------------------------------

:1129	lda	MO$1
	cmp	#iVERB_GO	; go...
	bne	:1160

	lda	MO$2	; check "go only"
	beq	:1130
	cmp	#iNOUN_ANY	; any...
	beq	:1130
	cmp	#iNOUN_DOWN+1	; after DOWN, check...
	bcs	:1160

	tax		; can we move?
	lda	tblISSUE-2,x
	and	#$ff
	beq	:1140	; no
	sta	SALLE

	lda	#iMESSAGE_OK
	jsr	printMESSAGE
	jmp	:100	; yes, move...

:1130	lda	#iMESSAGE_14	; I need a direction too
:1135	jsr	printMESSAGE
	jmp	:100

:1140	lda	DARK	; are we in the dark?
	cmp	#TRUE
	bne	:1145	; no
	lda	#iMESSAGE_17	; yes, SPLAT! I fell on...
	jmp	:1135
:1145	lda	#iMESSAGE_15	; I can't go that way!
	jmp	:1135
	
*--- Check verb+noun
	
:1160	jsr	checkWORDS	; print message if invalid
	bcc	:1600	; we have right words
	jmp	:100	; loop

*-----------------------------------
* CONTROLE LES ACTIONS
*-----------------------------------

:1600	lda	#tblACTIONS
	sta	dpACTIONS

	lda	#ONE
	sta	fgCOMBINATION

*--- Check verb + noun combination

:1610	jsr	getACTIONBYTE
	cmp	#gameEOT	; end of table?
	beq	:1630
	cmp	MO$1	; compare verb
	bne	:1620
	
	jsr	getACTIONBYTE
	cmp	MO$2	; compare noun
	beq	:1640

:1620	jsr	getACTIONBYTE	; not the right combination
	cmp	#gameEOL	; loop until the line end
	bne	:1620
	beq	:1610	; loop
	
*--- Output all possible texts

:1630	lda	#iMESSAGE_NOTYET

	ldx	fgCOMBINATION	; did we find a combination?
	cpx	#ZERO
	beq	:1634	; yes, output string

	lda	MO$1	; is verb above drop/put?
	cmp	#2+1
	bcs	:1633	; yes
	
	lda	#iMESSAGE_NOTCAP
	bne	:1634
:1633	lda	#iMESSAGE_NOUNDER
:1634	jsr	printMESSAGE	; output the message
	
:1635	jmp	:100	; end of table

*--- We have a match, handle the line

:1640	lda	#ZERO
	sta	fgCOMBINATION	; combination found

:1645	jsr	getACTIONBYTE
	cmp	#gameACT	; is it an action code (#$A0)
	bne	:1660	;  no, handle condition

	jsr	doACTIONS	;  yes, handle action
	jmp	:100	; and loop
	
:1650	lda	OK	; check return condition
	cmp	#ZERO	; was it positively done?
	bne	:1620	; no, go to next line
	beq	:1645	; yes, continue
	
*--- Check the condition

:1660	cmp	#$18+1	; max acceptable entry
	bcs	:1620
	asl
	tax
	lda	ptrCONDITION,x
	sta	doCONDITIONS_1+1

doCONDITIONS_1	jsr	$bdbd
	jmp	:1650	; test return code
	
*-----------------------------------
* GET NEXT ACTION CODE
*-----------------------------------

getACTIONBYTE	lda	(dpACTIONS)
	and	#$ff
	inc	dpACTIONS
	rts

*-----------------------------------
* DO CONDITIONS
*-----------------------------------

ptrCONDITION	da	doCONDITION_0	; nada
	da	doCONDITION_1	; --
	da	doCONDITION_2	; --
	da	doCONDITION_3	; --
	da	doCONDITION_4	; --
	da	doCONDITION_5	; continue if I carry the item (05 xx)
	da	doCONDITION_6	; continue if I do not carry the item (06 xx)
	da	doCONDITION_7	; continue if I am in the room (07 xx)
	da	doCONDITION_8	; continue if I am not in the room (08 xx)
	da	doCONDITION_9	; continue if the object is in the room (09 xx)
	da	doCONDITION_A	; continue if the object is not in the room (0A xx)
	da	doCONDITION_B	; continue if the object is in the room or if I carry it (0B xx)
	da	doCONDITION_C	; continue if the object is not in the room or if I do not carry it (0C xx)
	da	doCONDITION_D	; continue if the object does not exist (0D xx)
	da	doCONDITION_E	; continue if the object exists (0E xx)
	da	doCONDITION_F	; continue if P2 is true (0F xx) (condition)
	da	doCONDITION_10	; continue if P2 is false (10 xx) (condition)
	da	doCONDITION_11	; --
	da	doCONDITION_12	; --
	da	doCONDITION_13	; --
	da	doCONDITION_14	; --
	da	doCONDITION_15	; continue if object is in expected room (15 xx yy)
	da	doCONDITION_16	; continue object is not in expected room (16 xx yy)
	da	doCONDITION_17	; continue if P1 match (17 xx yy) (counter)
	da	doCONDITION_18	; continue if P1 do not match (18 xx yy) (counter)

*---

fgCOMBINATION	ds	2

*-----------------------------------
* CHEAT
*-----------------------------------

doCHEAT	jsr	switchCHEAT
	cmp	#FALSE
	beq	doCHEAT_OFF
	
	lda	#iMESSAGE_CHEATON	; Cheat mode off
	jmp	printMESSAGE
doCHEAT_OFF	lda	#iMESSAGE_CHEATOFF	; Cheat mode on
	jmp	printMESSAGE
	
*-----------------------------------
* GAME CONDITIONS
*-----------------------------------

*------------------
* NOT USED
*------------------

doCONDITION_11
doCONDITION_12
doCONDITION_13
doCONDITION_14
	jsr	getACTIONBYTE	; get next byte

doCONDITION_0
	jmp	exit_ZERO

*------------------
* 01 - CONTINUE IF NOT DARK
*------------------

doCONDITION_1
doCONDITION_4
	lda	DARK
	cmp	#FALSE
	beq	doCONDITION_149
	jmp	exit_ONE
doCONDITION_149	jmp	exit_ZERO

*------------------
* 02 - CONTINUE IF DARK
*------------------

doCONDITION_2
doCONDITION_3
	lda	DARK
	cmp	#FALSE
	beq	doCONDITION_239
	jmp	exit_ZERO
doCONDITION_239	jmp	exit_ONE

*------------------
* 05 - CONTINUE IF I CARRY THE ITEM
*------------------

doCONDITION_5	jsr	checkObject

doCONDITION_55	lda	D1
	cmp	#CARRIED	; do I carry the object?
	bne	doCONDITION_59
	jmp	exit_ZERO	; yes, continue
doCONDITION_59	jmp	exit_ONE	; no, stop

*------------------
* 06 - CONTINUE IF I DO NOT CARRY THE ITEM
*------------------

doCONDITION_6	jsr	checkObject

	lda	D1
	cmp	#CARRIED	; do I carry the object?
	bne	doCONDITION_69
	jmp	exit_ONE	; yes, continue
doCONDITION_69	jmp	exit_ZERO	; no, stop

*------------------
* 07 - CONTINUE IF I AM IN THE ROOM
*------------------

doCONDITION_7	jsr	getACTIONBYTE
	sta	D0
	lda	SALLE	; are we in room N?
	sta	D1
	jmp	ONE_IF_DIFF	; stop if different

*------------------
* 08 - CONTINUE IF I AM NOT IN THE ROOM
*------------------

doCONDITION_8	jsr	getACTIONBYTE
	sta	D0
	lda	SALLE
	sta	D1
	jmp	ZERO_IF_DIFF	; continue if different

*------------------
* 09 - CONTINUE IF OBJECT IN ROOM
*------------------

doCONDITION_9	jsr	checkObject	; object ID in D1
	lda	SALLE	; is object in room N?
	sta	D0
	jmp	ONE_IF_DIFF	; stop if different

*------------------
* 0A - CONTINUE IF OBJECT NOT IN ROOM
*------------------

doCONDITION_A	jsr	checkObject	; object ID in D1
	lda	SALLE	; is object in room N?
	sta	D0
	jmp	ZERO_IF_DIFF	; continue if different

*------------------
* 0B - CONTINUE IF OBJECT IN MY ROOM OR CARRIED
*------------------

doCONDITION_B	jsr	doCONDITION_9	; is the object in my room...
	bne	doCONDITION_55	; it returns ONE IF DIFF, am I carrying it?
	jmp	exit_ZERO
	
*------------------
* 0C - CONTINUE IF OBJECT NOT IN MY ROOM OR CARRIED
*------------------

doCONDITION_C	jsr	doCONDITION_A	; is the object not in my room...
	bne	doCONDITION_55	; or am I carrying it?
	jmp	exit_ZERO

*------------------
* OD - CONTINUE IF OBJECT DOES NOT EXIST (ie. = 0)
*------------------

doCONDITION_D	jsr	checkObject
	bne	doCONDITION_D9	; does object exist?
	jmp	exit_ZERO	; no, continue
doCONDITION_D9	jmp	exit_ONE	; yes, stop

*------------------
* 0E - CONTINUE IF OBJECT EXISTS (ie. <> 0)
*------------------

doCONDITION_E	jsr	checkObject
	bne	doCONDITION_E9	; does object exist?
	jmp	exit_ONE	; no, stop
doCONDITION_E9	jmp	exit_ZERO	; yes, continue

*------------------
* 0F - CONTINUE IF CONDITION IS ONE
*------------------

doCONDITION_F	jsr	getFromP2
	cmp	#ONE
	beq	doCONDITION_F9	; is condition true?
	jmp	exit_ONE	; no, stop
doCONDITION_F9	jmp	exit_ZERO	; yes, continue

*------------------
* 10 - CONTINUE IF CONDITION IS ZERO
*------------------

doCONDITION_10	jsr	getFromP2
	cmp	#ONE
	beq	doCONDITION_109	; is condition true?
	jmp	exit_ZERO	; no, continue
doCONDITION_109	jmp	exit_ONE	; yes, stop

*------------------
* 15 - CHECK OBJECT IN EXPECTED ROOM (ie. EXISTS)
*------------------

doCONDITION_15	jsr	checkObject	; get object ID
	jsr	getACTIONBYTE	; get next byte
	sta	D0	; save & compare...
	jmp	ONE_IF_DIFF	; stop on diff

*------------------
* 16 - CHECK OBJECT NOT IN EXPECTED ROOM (ie. DOES NOT EXIST)
*------------------

doCONDITION_16	jsr	checkObject	; get object ID
	jsr	getACTIONBYTE	; get next byte
	sta	D0	; save & compare...
	jmp	ZERO_IF_DIFF	; continue on diff

*------------------
* 17 - CHECK CONDITION MATCHES
*------------------

doCONDITION_17	jsr	getFromP1	; get condition value
	jsr	getACTIONBYTE	; get next byte
	sta	D0	; save & compare...
	jmp	ONE_IF_DIFF	; stop on diff

*------------------
* 18 - CHECK CONDITION DOES NOT MATCH
*------------------

doCONDITION_18	jsr	getFromP1	; get condition value
	jsr	getACTIONBYTE	; get next byte
	sta	D0	; save & compare...
*	jmp	ZERO_IF_DIFF	; stop on diff --- uncomment if needed

*------------------
* EXIT CONDITIONS
*------------------

ZERO_IF_DIFF	lda	D0	; useless and verbose
	cmp	D1	; but that's fun :-)
	bne	exit_ZERO
	beq	exit_ONE

ONE_IF_DIFF	lda	D0
	cmp	D1
	bne	exit_ONE

exit_ZERO	lda	#ZERO	; Anon48+$0040
	sta	OK
	rts

exit_ONE	lda	#ONE	; Anon49
	sta	OK
	rts

checkObject	jsr	getACTIONBYTE	; condition value
	sta	D0	; get index
	tax
	lda	tblO-1,x	; get object ID
	and	#$ff
	sta	D1	; save it
	rts

getFromP1	jsr	getACTIONBYTE	; = Anon63 = counter
	sta	D0
	tax
	lda	P1,x
	and	#$ff
	sta	D1
	rts

getFromP2	jsr	getACTIONBYTE	; = Anon63 + $000A = flag
	sta	D0
	tax
	lda	P2,x
	and	#$ff
	sta	D1
	rts

*-----------------------------------
* DO ACTIONS
*-----------------------------------

doACTIONS	jsr	getACTIONBYTE	; the byte after the action code (#$a0)
	cmp	#gameEOL	; is it an end of line?
	beq	doACTIONS_9
	cmp	#NB_ACTIONS+1	; the max acceptable value
	bcs	doACTIONS_9
	asl
	tax
	lda	ptrACTION,x
	sta	doACTIONS_1+1

doACTIONS_1	jsr	$bdbd
	jmp	doACTIONS

doACTIONS_9	rts

*---

ptrACTION	da	doACTION_0	; nothing
	da	doACTION_1	; draw verb
	da	doACTION_2	; draw noun
	da	doACTION_3	; return
	da	doACTION_4	; inventory
	da	doACTION_5	; refresh screen
	da	doACTION_6	; dark is FALSE
	da	doACTION_7	; dark is TRUE
	da	doACTION_8	; save game
	da	doACTION_9	; death
	da	doACTION_A	; replay
	da	doACTION_B	; load game
	da	doACTION_C	; quit
	da	doACTION_D	; wait
	da	doACTION_E	; --
	da	doACTION_F	; print message (0F xx)
	da	doACTION_10	; take object (10 xx)
	da	doACTION_11	; drop object (11 xx)
	da	doACTION_12	; set room (12 xx) (set salle)
	da	doACTION_13	; print number (13 xx)
	da	doACTION_14	; drop object in room (14 oo <salle>)
	da	doACTION_15	; delete object (15 oo)
	da	doACTION_16	; set P2 flag to false (1) (16 xx) (conditions)
	da	doACTION_17	; set P2 flag to true (0) (17 xx) (conditions)
	da	doACTION_18	; --
	da	doACTION_19	; --
	da	doACTION_1A	; --
	da	doACTION_1B	; --
	da	doACTION_1C	; --
	da	doACTION_1D	; create object in room (1D xx yy)
	da	doACTION_1E	; --
	da	doACTION_1F	; exchange objects (1F xx yy)
	da	doACTION_20	; set new room (20 xx yy) (change tblR)
	da	doACTION_21	; add P1 (21 xx yy) (counter)
	da	doACTION_22	; subtract P1 (22 xx yy) (counter)
	da	doCHEAT	; AV

*-----------------------------------
* GAME ACTIONS
*-----------------------------------

*------------------
* 00 - NOTHING
*------------------

doACTION_0	rts

*------------------
* 01 - DRAW VERB
*------------------

doACTION_1	lda	X$1_SAVE
	bne	doACTION_Y1
	rts

doACTION_Y1	lda	#chrRETURN
	jsr	COUT
	
	jsr	exchange_X$1	; exchange normal/shortened length
	
	lda	#X$1+1	; print the verb
	jsr	PRINT_ALT

*	lda	#chrRETURN
*	jsr	COUT

*---

exchange_X$1	sep	#$30
	lda	X$1_SAVE
	ldx	X$1
	stx	X$1_SAVE
	sta	X$1
	rep	#$30
	rts

*------------------
* 02 - DRAW NOUN
*------------------

doACTION_2	lda	X$2_SAVE
	bne	doACTION_Z1
	rts

doACTION_Z1	lda	#chrRETURN
	jsr	COUT

	jsr	exchange_X$2	; exchange normal/shortened length
	
	lda	#X$2+1	; print the noun
	jsr	PRINT_ALT

*---

exchange_X$2	sep	#$30
	lda	X$2_SAVE
	ldx	X$2
	stx	X$2_SAVE
	sta	X$2
	rep	#$30
	rts

*------------------
* 03 - RETURN (ie. does nothing)
*------------------

doACTION_3	rts

*------------------
* 04 - INVENTORY
*------------------
*
* Original game sets Anon64+$0002 at 1
* That makes the inventory always work
* Whereas it shouldnt display anything
* when we are in the dark. That's done here.
*

doACTION_4	ldx	#0	; count how many objects
	ldy	#0	; I am carrying
]lp	lda	tblO,x
	and	#$ff
	cmp	#CARRIED
	bne	doACTION_41
	iny
doACTION_41	inx
	cpx	#MAX_OBJ
	bcc	]lp
	
	cpy	#0	; more than 0?
	bne	doACTION_42	; yes

	lda	#iMESSAGE_EMPTY	; I'm emptyhanded
	jmp	printMESSAGE

doACTION_42	lda	#iMESSAGE_CARRY	; I'm carrying
	jsr	printMESSAGE
	
	lda	DARK	; display nothing
	cmp	#TRUE	; if in the dark
	beq	doACTION_44
	
	lda	#1	; start with object 1
	sta	K

]lp	ldx	K	; Do I carry it?
	lda	tblO-1,x
	and	#$ff
	cmp	#CARRIED
	bne	doACTION_43

	lda	#chrRETURN
	jsr	COUT
	lda	#chrSPACE
	jsr	COUT
	
	lda	K
	jsr	printOBJECT

doACTION_43	inc	K	; next object
	lda	K
	cmp	#MAX_OBJ
	bcc	]lp
	beq	]lp

	lda	#chrRETURN
	jmp	COUT

doACTION_44	lda	#iMESSAGE_NOSEE	; I don't see anything
	jmp	printMESSAGE

*------------------
* 05 - REFRESH SCREEN
*------------------

doACTION_5	jmp	printROOM

*------------------
* 06 - DARK IS FALSE
*------------------

doACTION_6	lda	#FALSE
	jmp	doSETDARK

*------------------
* 07 - DARK IS TRUE
*------------------

doACTION_7	lda	#TRUE

*---

doSETDARK	cmp	DARK	; same as before?
	beq	doSETDARK_1	; yes, skip
	sta	DARK	; no, save value

doSETDARK_ALT	lda	#FALSE
	sta	DARK_2

doSETDARK_1	lda	DARK_2
	cmp	#FALSE
	beq	loadIMAGE
	rts
	
*------------------
* LOAD AN IMAGE (Anon53)
*------------------

loadIMAGE	lda	#TRUE
	sta	DARK_2

	lda	DARK
	cmp	#FALSE
	beq	loadIMAGE_1

	PushLong	#darkRECTANGLE
	PushLong	#blackPATTERN
	_FillRect
	rts

loadIMAGE_1	lda	IMAGE
	and	#$ff
	pha
	PushLong	#strIMAGE
	PushWord	#2
	PushWord	#FALSE
	_Int2Dec

	lda	strIMAGE
	ora	#'00'
	sta	pIMAGE+10
	
	jsl	GSOS	; load the picture
	dw	$2010
	adrl	proOPENPIC
	bcs	loadPIC99

	lda	proOPENPIC+2
	sta	proREADPIC+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2012
	adrl	proREADPIC
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSEPIC
	
	lda	proPICEOF
	jsr	unpackLZ4
	
	PushLong #imageParamPtr
	_PaintPixels
	
loadPIC99	rts

*--- Data

* index is at +10

strIMAGE	asc	'00'

pIMAGE	strl	'8/data/f00.lz4'

proOPENPIC	dw	12
	ds	2
	adrl	pIMAGE
	ds	2
	ds	2
	ds	2
	ds	2
	ds	4
	ds	2
	ds	8
	ds	8
	ds	4
proPICEOF	ds	4

proREADPIC	dw	4	; 0 - pcount
	ds	2	; 2 - ref_num
	ds	4	; 4 - data_buffer @ptrUNPACK
	adrl	32768	; 8 - request_count
	ds	4	; C - transfer_count

proCLOSEPIC	dw	1	; 0 - pcount
	ds	2	; 2 - ref_num

*---

imageParamPtr	adrl	imageToSourceLocInfo
	adrl	imageToDestLocInfo
	adrl	imageToSourceRect
	adrl	imageToDestPoint
	dw	$0000	; mode copy
	ds	4

imageToSourceLocInfo
	dw	mode640	; mode 320
	adrl	$8000	; ptrimage - $8000 on entry, high set after _NewHandle
	dw	160
	dw	0,0,199,639
	
imageToDestLocInfo
	dw	mode640	; mode 320
	adrl	ptrE12000
	dw	160
	dw	0,0,199,639
	
imageToSourceRect
	dw	0,0,110,255
imageToDestPoint
	dw	0,352	; 640-256-(64/2)

darkRECTANGLE	dw	0,352,110,607
	
*------------------
* 08 - SAVE GAME
*------------------

doACTION_8	jsr	Anon31

	lda	#iMESSAGE_SAVE
	jsr	printMESSAGE
	jsr	slotGAME
	bcs	doACTION_81
	jsr	saveGAME
	bcc	doACTION_82

	lda	#iMESSAGE_IOERR
	bra	doACTION_83
doACTION_81	lda	#iMESSAGE_CANCEL
	bra	doACTION_83
doACTION_82	lda	#iMESSAGE_SAVEOK
doACTION_83	jmp	printMESSAGE

*------------------

slotGAME	@INKEY
	cmp	#'1'
	bcc	slotGAME_ERR
	cmp	#'9'+1
	bcs	slotGAME_ERR
	sta	pGAME+15
	clc
	rts
slotGAME_ERR	sec
	rts

*------------------
* 09 - I'M DEAD
*------------------

doACTION_9	lda	fgCHEAT
	beq	doACTION_91
	rts

doACTION_91	lda	#TRUE	; I'm dead...
	sta	DEATH

	lda	#8
	jmp	printMESSAGE

*------------------
* 0A - REPLAY DIALOG
*------------------

doACTION_A	lda	fgCHEAT
	cmp	#FALSE
	beq	doACTION_A1
	rts
	
doACTION_A1	jmp	:20000

*------------------
* 0B - LOAD GAME
*------------------

doACTION_B	jsr	Anon31

	lda	#iMESSAGE_LOAD
	jsr	printMESSAGE
	jsr	slotGAME
	bcs	doACTION_B1
	jsr	loadGAME
	bcc	doACTION_B2

	lda	#iMESSAGE_IOERR
	bra	doACTION_B3
doACTION_B1	lda	#iMESSAGE_CANCEL
	bra	doACTION_B3
doACTION_B2	lda	#iMESSAGE_LOADOK
doACTION_B3	jmp	printMESSAGE
	
*------------------
* 0C - QUIT
*------------------

doACTION_C	jmp	:20000

*------------------
* 0D - WAIT
*------------------

doACTION_D	lda	#3	; 180/100ms = 108/60
	jsr	nowWAIT
	rts

*------------------
* 0F - PRINT MESSAGE
*------------------

doACTION_F	jsr	getACTIONBYTE
	cmp	#$4c	; "I Die Of Radiation Poisoning"
	bne	doACTION_F1

	bit	fgCHEAT	; check if cheat mode is on or off
	bmi	doACTION_F2	; skip message if on
doACTION_F1	jsr	printTEXT
doACTION_F2	rts

*------------------
* 10 - TAKE
*------------------

doACTION_10	jsr	checkObject
	cmp	#CARRIED	; do I already have it?
	bne	doACTION_101
	
	lda	#iMESSAGE_11	; I already have it
	jmp	printMESSAGE

doACTION_101	lda	SALLE	; am I on the right room?
	cmp	D1
	beq	doACTION_102	; yes

	lda	#iMESSAGE_10	; I don't see it here
	jmp	printMESSAGE

doACTION_102	ldx	#0	; count how many objects
	ldy	#0	; I am carrying
]lp	lda	tblO,x
	and	#$ff
	cmp	#CARRIED
	bne	doACTION_103
	iny
doACTION_103	inx
	cpx	#MAX_OBJ
	bcc	]lp
	
	cpy	#MAX_CARRIED	; Do I carry too
	bcc	doACTION_104	; many objects?
	beq	doACTION_104
	
	lda	#iMESSAGE_12	; I'm carrying too much
	jmp	printMESSAGE

doACTION_104	ldx	D0	; make the object mine
	sep	#$20
	lda	#CARRIED
	sta	tblO-1,x
	rep	#$20

	lda	#iMESSAGE_OK
	jmp	printMESSAGE

*------------------
* 11 - DROP
*------------------

doACTION_11	jsr	checkObject
	cmp	#CARRIED	; do I carry it?
	beq	doACTION_112	; yes

	lda	#iMESSAGE_NOCAR	; I'm not carrying it
	jmp	printMESSAGE

doACTION_112	sep	#$20
	lda	SALLE	; drop it
	sta	tblO-1,x
	rep	#$20

	lda	#iMESSAGE_OK
	jmp	printMESSAGE

*------------------
* 12 - SET NEW ROOM
*------------------

doACTION_12	jsr	getACTIONBYTE
	sta	SALLE
*	jsr	printROOM

	lda	DARK
	cmp	#FALSE
	beq	doACTION_121
	
	lda	#iMESSAGE_DARK
	jmp	printMESSAGE

doACTION_121	rts
	
*------------------
* 13 - DEBUG FEATURE (LOGO)
*------------------

doACTION_13	jmp	getFromP1	; must make it a decimal string
*	jmp	PRBYTE

*------------------
* 14 - CREATE OBJECT AND REFRESH
*------------------

doACTION_14	jsr	checkObject	; get object index
	sep	#$20
	lda	SALLE	; get room
	sta	tblO-1,x	; drop object
	rep	#$20
	rts
*	jmp	printROOM

*------------------
* 15 - DELETE OBJECT
*------------------

doACTION_15	jsr	checkObject	; get object index
	sep	#$20
	lda	#ZERO	; delete object
	sta	tblO-1,x
	rep	#$20

* Shall we refresh?

	lda	SALLE	; am I on the same room?
	cmp	D1
	bne	doACTION_159
	rts
doACTION_159	rts
*	jmp	printROOM	; yes, refresh

*------------------
* 16 - SET FLAG TO ONE
*------------------

doACTION_16	jsr	getFromP2
	sep	#$20
	lda	#ONE
	sta	P2,x
	rep	#$20
	rts

*------------------
* 17 - SET FLAG TO ZERO
*------------------

doACTION_17	jsr	getFromP2
	sep	#$20
	lda	#ZERO
	sta	P2,x
	rep	#$20
	rts

*------------------
* 1D - PUT OBJECT AND REFRESH
*------------------

doACTION_1D	jsr	checkObject	; 23
	jsr	getACTIONBYTE	; 12
	sep	#$20
	sta	D2
	sta	tblO-1,x	; put object
	rep	#$20

* Shall we refresh?

	lda	SALLE	; which room am I in?
	cmp	D2	; the new one
	beq	doACTION_1D1	; yes, refresh
	cmp	D1	; the old one
	beq	doACTION_1D1	; yes, refresh
	rts
doACTION_1D1	jmp	printROOM	; yes, refresh

*------------------
* GET NEXT 2 BYTES
*------------------

doACTION_1E	jsr	getACTIONBYTE

*------------------
* GET NEXT BYTE
*------------------

doACTION_E
doACTION_18
doACTION_19
doACTION_1A
doACTION_1B
doACTION_1C
	jmp	getACTIONBYTE

*------------------
* 1F - EXCHANGE OBJECTS
*------------------

doACTION_1F	jsr	checkObject

	lda	D0
	sta	D2
	lda	D1
	sta	D3
	
	jsr	checkObject
	
	sep	#$20
	ldx	D0
	lda	D3
	sta	tblO-1,x
	
	ldx	D2
	lda	D1
	sta	tblO-1,x
	rep	#$20

* Shall we refresh?

	lda	SALLE	; which room am I in?
	cmp	D3	; the first one?
	beq	doACTION_1F1	; yes, refresh
	cmp	D1	; the new one?
	beq	doACTION_1F1	; yes, refresh
	rts
doACTION_1F1	rts
	jmp	printROOM

*------------------
* 20 - CHANGE ROOM
*------------------

doACTION_20	jsr	getACTIONBYTE	; get index
	tax
	
	jsr	getACTIONBYTE	; get room value
	sep	#$20
	sta	tblR-1,x
	rep	#$20

	jmp	printROOM
*	jmp	doSETDARK_ALT

*------------------
* 21 - ADD TO P1
*------------------

doACTION_21	jsr	getFromP1	; P1,x += next byte
	jsr	getACTIONBYTE
	sep	#$20
	clc
	adc	D1
	sta	P1,x
	rep	#$20
	rts

*------------------
* 22 - SUBTRACT FROM P1
*------------------

doACTION_22	jsr	getFromP1	; P1,x =- next byte
	jsr	getACTIONBYTE
	sep	#$20
	sta	D2
	
	lda	D1
	sec
	sbc	D2
	bpl	doACTION_221
	lda	#0	; cannot be negative
doACTION_221	sta	P1,x
	rep	#$20
	rts

*-----------------------------------
* CHECK THE CONDITION TABLE
*-----------------------------------

checkCONDITIONS	lda	#tblCONDITIONS
	sta	dpACTIONS

]lp	jsr	RANDOM
	and	#%0111_1111
	cmp	#100+1	; >100 or >=101
	bcs	]lp
	sta	RND	; in D0
	
*--- Run through the conditions array

checkCOND_1	jsr	getACTIONBYTE
	cmp	#gameEOT	; end of table?
	beq	checkCOND_3
	cmp	RND	; if RND > D1, or
	beq	checkCOND_2	; D1 <= RND then skip
	bcs	checkCOND_4	; or, if D1 > RND then perform condition check

checkCOND_2	jsr	getACTIONBYTE	; not the right combination
	cmp	#gameEOL	; loop until the line end
	bne	checkCOND_2
	beq	checkCOND_1	; loop

checkCOND_3	rts

*--- We have a match, handle the line

checkCOND_4	lda	#ZERO
	sta	OK
	
checkCOND_5	jsr	getACTIONBYTE
	cmp	#gameEOL	; is it end of line?
	beq	checkCOND_1	;   yes, go to next line
	cmp	#gameACT	; is it an action code (#$A0)
	bne	checkCOND_6	;    no, handle condition

	jsr	doACTIONS	;   yes, handle action
	jmp	checkCOND_1	;   next line, please

checkCOND_6	cmp	#$18+1	; max acceptable entry
	bcs	checkCOND_2
	asl
	tax
	lda	ptrCONDITION,x
	sta	checkCOND_7+1

checkCOND_7	jsr	$bdbd

	lda	OK	; check end condition
	cmp	#ONE	; if ONE, we had an error
	beq	checkCOND_2	; go to next line
	bne	checkCOND_4
	
*-----------------------------------
* CHECK WORDS
*-----------------------------------

checkWORDS	lda	MO$1	; check verb
	bne	checkWORDS_N	; ok
	beq	checkWORDS_KO	; not ok

checkWORDS_N	lda	MO$2	; check noun
	beq	checkWORDS_KO	; not ok
	clc
	rts

checkWORDS_KO	lda	#6	; I Don't Know the 
	jsr	printMESSAGE

	lda	MO$1
	bne	checkWORDS_LO
	
	lda	#42	; Verb "
	jsr	printMESSAGE
*	jsr	exchange_X$1
	lda	#X$1+1
	jsr	PRINT_ALT
*	jsr	exchange_X$1
	jmp	checkWORDS_MO
	
checkWORDS_LO	lda	#43	; Noun "
	jsr	printMESSAGE
*	jsr	exchange_X$2
*	ldx	#^X$2	; print the string
	lda	#X$2+1
*	lda	#wMESSAGE
	jsr	PRINT_ALT
	jsr	exchange_X$2

checkWORDS_MO	lda	#44	; ".
	jsr	printMESSAGE
	sec
	rts
	
*-----------------------------------
* 6000 - ANALYSE DU MOT
*-----------------------------------

:6000	stz	N	; index
	stz	X$1	; longueur premier mot
	stz	X$2	; longueur second mot

	lda	#1	; par défaut, index des mots
	sta	MO$1	; mais si 0 en retour
	sta	MO$2	; alors "not found"

	lda	lenSTRING	; empty string
	bne	:6010	; nah

:6005	rep	#$30
	lda	#iMESSAGE_IBEG	; yes
	jmp	printMESSAGE

	mx	%11

* 1. cherche le premier caractère

:6010	sep	#$30

	ldx	#0	; cherche le premier caractere
]lp	lda	TEXTBUFFER,x
	cmp	#chrNULL
	beq	:6021
	cmp	#chrSPACE
	bne	:6022	; on a trouvé un caractère
	inx
	cpx	lenSTRING
	bcc	]lp
	beq	]lp
:6021	bcs	:6005	; retourne sans avoir trouve

* 2. recopie le mot

:6022	ldy	#1	; longueur du mot
]lp	lda	TEXTBUFFER,x
	cmp	#chrNULL
	beq	:6024
	cmp	#chrSPACE
	beq	:6023
	sta	X$1,y	; W
	inx		; X=1
	cpx	lenSTRING
*	beq	:6022_B	; ]lp
	bcs	:6024
:6022_B	iny		; Y=2
	cpy	#NB_CAR
	bcc	]lp
	beq	]lp	; on sort si 5
:6023	dey
:6024	sty	X$1	; sauve la longueur
	
* 3. cherche le second non espace

]lp	lda	TEXTBUFFER,x
	cmp	#chrNULL
	beq	:6100
	cmp	#chrSPACE
	bne	:6032
	inx		; 5
	cpx	lenSTRING
	bcc	]lp
	bcs	:6100
	
* 4. recopie le mot

:6032	ldy	#1	; X 5 6 7 8 9
]lp	lda	TEXTBUFFER,x	; Y 1 2 3 4
	cmp	#chrNULL	; A S I G N
	beq	:6034
	cmp	#chrSPACE
	beq	:6033
	sta	X$2,y
	inx
	cpx	lenSTRING
*	beq	:6032_B	; ]lp
	bcs	:6034
:6032_B	iny
	cpy	#NB_CAR
	bcc	]lp
	beq	]lp
:6033	dey
:6034	sty	X$2	; sauve la longueur

* 4b. réduit la longueur des mots trouvés

:6100	ldx	#LEN_WORD
	lda	X$1
	sta	X$1_SAVE	; for Draw Verb
	cmp	#LEN_WORD
	bcc	:6102
	beq	:6102
	stx	X$1

:6102	lda	X$2
	sta	X$2_SAVE	; for Draw Noun
	cmp	#LEN_WORD
	bcc	:6104
	beq	:6104
	stx	X$2

* 5. cherche le mot dans les verbes
	
:6104	rep	#$30
	lda	X$1
	and	#$ff
	bne	:6110
	rts

:6110	lda	#<tblVERB	; check verb
	sta	:6450+1

	sep	#$30

	ldy	#1	; first index is 1
]lp	ldx	#1
:6225	jsr	:6450
	cmp	X$1,x
	bne	:6250
	inx
	cpx	X$1
	bcc	:6225
	beq	:6225
	
	ldx	#0	; check length of word
	jsr	:6450
	cmp	X$1	; mismatch
	bne	:6250	; try the next one
	
:6230	lda	tblV,y	; get word index
	sta	MO$1
	jmp	:6300
	
:6250	ldx	#0	; calculate address of
	jsr	:6450	; next word
	clc
	adc	:6450+1	; @adr = @adr + word_len + 1
	sta	:6450+1
	lda	:6450+2
	adc	#0
	sta	:6450+2
	inc	:6450+1
	bne	:6260
	inc	:6450+2

:6260	iny
	jsr	:6450	; get char
	bne	]lp	; if not 0, loop
	tay		; word not found
	beq	:6230

* 6. cherche le mot dans les noms

:6300	rep	#$30
	lda	X$2
	and	#$ff
	bne	:6310
	rts

:6310	lda	#tblNOUN	; check verb
	sta	:6450+1

	sep	#$30

	ldy	#1	; first index is 1
]lp	ldx	#1
:6325	jsr	:6450
	cmp	X$2,x
	bne	:6350
	inx
	cpx	X$2
	bcc	:6325
	beq	:6325
	
	ldx	#0	; check length of word
	jsr	:6450
	cmp	X$2	; mismatch
	bne	:6350	; try the next one
	
:6330	lda	tblN,y	; get word index
	sta	MO$2
	rep	#$30
	rts

	mx	%11
		
:6350	ldx	#0	; calculate address of
	jsr	:6450	; next word
	clc
	adc	:6450+1	; @adr = @adr + word_len + 1
	sta	:6450+1
	lda	:6450+2
	adc	#0
	sta	:6450+2
	inc	:6450+1
	bne	:6360
	inc	:6450+2

:6360	iny
	jsr	:6450
	bne	]lp	; if not 0, loop
	tay		; word not found
	beq	:6330	; always taken

*---

:6450	lda	$bdbd,x	; get a char from a list
	rts

	mx	%00
	
*-----------------------------------
* PRINT ROOM
*-----------------------------------

printROOM	lda	SALLE
	bne	printROOM_1
	rts

printROOM_1	cmp	#MAX_ROOM
	bcc	printROOM_2
	beq	printROOM_2
	rts

printROOM_2	lda	SALLE
	jsr	printDESCRIPTION
	jsr	loadIMAGE
	jsr	printISSUES
	jsr	printOBJECTS
	rts
	
*-----------------------------------
* PRINT ISSUES
*-----------------------------------

printISSUES	lda	SALLE
	dec
	asl		; *2
	pha
	asl		; *4
	clc
	adc	1,s
	clc
	adc	#tblISSUES
	sta	dpFROM
	plx

	lda	#FALSE
	sta	F

	@CLS	#wISSUES
	
* Now, loop and make issues string

	lda	DARK
	cmp	#TRUE
	beq	printISSUES_21
	
	ldx	#0	; index in output string
	ldy	#0	; index in issue array
]lp	lda	(dpFROM),y
	and	#$ff
	sep	#$20
	sta	tblISSUE,y	; 0 or the direction
	rep	#$20
	cmp	#FALSE	; do we have an issue?
	beq	printISSUES_2	; no

	lda	F	; yes, did we have an issue yet
	cmp	#FALSE	; useless
	beq	printISSUES_1	; no

	lda	#chrCOMMA	; yes, add comma and space
	jsr	outputISSUES
	lda	#chrSPACE
	jsr	outputISSUES
	
printISSUES_1	lda	refISSUE,y	; add direction (the AND is done in the sub-routine)
	jsr	outputISSUES
	inc	F	; need for comma and space
	
printISSUES_2	iny
	cpy	#MAX_ISSUES
	bcc	]lp

	lda	#chrNULL	; end of string
	jsr	outputISSUES

* What shall we output now?

	lda	F
	cmp	#FALSE
	bne	printISSUES_3
	
printISSUES_21	lda	#iMESSAGE_NOEXIT	; I See No Obvious Exits
	ldx	#tblMESSAGES
	jsr	getWHATEVER
	bra	printISSUES_4
	
printISSUES_3	lda	#strEXITS
	sta	dpFROM

printISSUES_4	jsr	LEN
	
	pha		; centre la chaîne
	lda	#40
	sec
	sbc	1,s
	lsr
	tax
	inx
	pla
	ldy	#1
	lda	#wISSUES
	jsr	LOCATE

	lda	dpFROM	; affiche la chaîne centrée
	jmp	PRINT_ALT

* Create the output string

outputISSUES	sep	#$20
	sta	strISSUE,x
	rep	#$20
	inx
	rts

*--- Issue string (max len is below)

tblISSUE	ds	6	; copy of the possible directions

refISSUE	asc	chrNORD
	asc	chrSUD
	asc	chrEST
	asc	chrOUEST
	asc	chrHAUT
	asc	chrBAS

strEXITS	asc	'Exits: '
strISSUE	asc	'N, S, E, W, U, D'
	dfb	chrNULL

*-----------------------------------
* PRINT OBJECTS
*-----------------------------------

printOBJECTS	lda	SALLE	; are we on a room?
	cmp	#chrNULL
	bne	printOBJECTS_1
	rts		; no
	
printOBJECTS_1
	@CLS	#wOBJECTS
	lda	#iMESSAGE_ISEE	; yes, show the objects on the current room
	jsr	printMESSAGE

	lda	#FALSE	; no previous object displayed
	sta	F
	
	ldx	#0	; start at 0
	stx	K

]lp	lda	tblO,x
	and	#$ff
	cmp	#FALSE	; does object exist?
	beq	printOBJECTS_3	; no
	cmp	SALLE	; is object in room?
	bne	printOBJECTS_3	; no

	lda	F	; yes, did we have an object yet?
	cmp	#FALSE	; useless
	beq	printOBJECTS_2	; no
	
	lda	#chrSPACE	; yes, add space
	jsr	COUT
	
printOBJECTS_2	lda	K	; the object table index
	clc
	adc	#1	; +1 b/c we start at 0 here
	jsr	printOBJECT	; sets the object name

	lda	#chrDOT	; yes, add dot
	jsr	COUT

	inc	F	; set flag for space

printOBJECTS_3	inc	K	; next object
	ldx	K
	cpx	#MAX_OBJ
	bcc	]lp
	
* What shall we output now?

	lda	F	; did we find an object?
	cmp	#FALSE
	beq	printOBJECTS_4
	rts		; yes

printOBJECTS_4	lda	#iMESSAGE_NOSEE	; no
	jmp	printMESSAGE
	
*-----------------------------------
* PRINT OBJECT
*-----------------------------------

printOBJECT	ldx	#tblOBJECTS
	jmp	printWHATEVER

*-----------------------------------
* PRINT TEXT
*-----------------------------------

printTEXT	pha		; points to texts array

*	@STREAM	#wMESSAGE
*
*	lda	#chrRETURN
*	jsr	COUT
	@PRINT	#wMESSAGE;#strRETURN

	pla
	ldx	#tblTEXTS
	jmp	printWHATEVER

*-----------------------------------
* PRINT MESSAGES
*-----------------------------------

printMESSAGE	ldx	#tblMESSAGES	; points to texts array
	jmp	printWHATEVER

*-----------------------------------
* PRINT DESCRIPTIONS
*-----------------------------------

printDESCRIPTION
	pha		; message index

	@CLS	#wDESCRIPTION

* See Anon45+$003C

	ldx	SALLE	; correspondance salle / image
	lda	tblR-1,x
	and	#$ff
	sta	D7
	cmp	IMAGE	; same as the previous one?
	beq	printDE_8	; yes, do nothing
	sta	IMAGE	; no, save for later

*---

	sep	#$20
	
	ldx	#0
]lp	lda	tblAnon31,x
	sta	D1
	cmp	D7
	beq	printDE_8
	
	lda	D1
	beq	printDE_7
	inx
	cpx	#5
	bcc	]lp

	ldx	#4	; erase table
	lda	#0
]lp	sta	tblAnon31,x
	dex
	bne	]lp

printDE_7	lda	D7	; save new value
	sta	tblAnon31,x

*---

printDE_8	rep	#$20

	lda	DARK	; see Anon45+$007A
	cmp	#FALSE
	beq	printDE_9

	pla
	lda	#iMESSAGE_TOODARK
	ldx	#tblMESSAGES
	bra	printDE_91

printDE_9	sta	DARK_2	; set to FALSE
	pla		; restore message index
	ldx	#tblDESCRIPTIONS	; points to texts array

printDE_91	jsr	getWHATEVER	; get an address or null if not found
	bne	printDE_10
	rts

printDE_10	jsr	LEN	; get its length

	pha		; centre la chaîne
	lda	#40
	sec
	sbc	1,s
	lsr
	tax
	inx
	pla
	ldy	#1
	lda	#wDESCRIPTION
	jsr	LOCATE

	lda	dpFROM	; affiche la chaîne centrée
	jmp	PRINT_ALT
	
*-----------------------------------
* GET WHATEVER :-)
*-----------------------------------

getWHATEVER	cmp	#chrNULL
	beq	getWHAT_END

	stx	dpFROM	; pointer to array

	sta	J	; index searched

	lda	#1	; start at 1
	sta	I
	
]lp	lda	(dpFROM)
	and	#$ff
	cmp	#chrNULL	; end of array, exit
	beq	getWHAT_END
	cmp	#chrBACKSLASH	; string separator?
	bne	getWHAT_NEXT	; no

	lda	I
	cmp	J
	beq	getWHAT_OK	; yes, exit

	inc	I	; no, set next string

getWHAT_NEXT	inc	dpFROM	; move to next char until backslash
	bne	]lp
	
getWHAT_END	lda	#chrNULL	; return 0
	rts
getWHAT_OK	inc	dpFROM	; we are good
	lda	dpFROM
	rts

*-----------------------------------
* PRINT WHATEVER :-)
*-----------------------------------

printWHATEVER	cmp	#chrNULL
	bne	printWHAT_GO
	rts
printWHAT_GO	stx	dpFROM	; pointer to array

	sta	J	; index searched

	lda	#1	; start at 1
	sta	I
	
]lp	lda	(dpFROM)
	and	#$ff
	cmp	#chrNULL	; end of array, exit
	beq	printWHAT_END
	cmp	#chrBACKSLASH	; string separator?
	bne	printWHAT_NEXT	; no

	lda	I
	cmp	J
	beq	printWHAT_OK	; yes, exit

	inc	I	; no, set next string

printWHAT_NEXT	inc	dpFROM	; move to next char until backslash
	bne	]lp
	
printWHAT_END	lda	#chrNULL	; return 0
	rts

printWHAT_OK	inc	dpFROM	; we are good
printWHAT_OK2	lda	dpFROM
	jmp	PRINT_ALT	; output with the engine

*-----------------------------------
* 8000 - CHARGEMENT VARIABLES
*-----------------------------------

initALL	sep	#$20
	ldx	#0	; clear all
	txa
]lp	sta	SALLE,x
	inx
	cpx	#FIN_DATA-DEBUT_DATA
	bcc	]lp

*---

	ldx	#MAX_ROOM-1	; reset room table
]lp	lda	refR,x
	sta	tblR,x
	dex
	bpl	]lp

	ldx	#MAX_OBJ-1	; reset object table
]lp	lda	refO,x
	sta	tblO,x
	dex
	bpl	]lp
	rep	#$20
	rts

*-----------------------------------
* Anon31
*-----------------------------------

Anon31	sep	#$20
	ldx	#4-1
	lda	#0
]lp	sta	tblAnon31,x
	dex
	bpl	]lp
	rep	#$20
	rts
	
*-----------------------------------
* 20000 - PERDU
*-----------------------------------

:20000
:20050	@PRINT	#wMESSAGE;#strREPLAY	; commun avec gagne
	@INKEY
	cmp	#chrNON
	beq	:21000
	cmp	#chrOUI
	bne	:20050
	jmp	REPLAY

:21000	jmp	QUIT

*----------------------
* switchCHEAT
*----------------------

switchCHEAT	lda	fgCHEAT
	eor	#TRUE
	sta	fgCHEAT
	rts

*---

fgCHEAT	dw	FALSE	; 0 no cheat, -1 cheat mode on

*-----------------------------------
* VARIABLES
*-----------------------------------

DEBUT_DATA

SALLE	ds	2	; salle courante
IMAGE	ds	2	; index image
DEATH	ds	2	; death flag
P1	ds	NB_P1	; compteurs (+$476 soit 10)
P2	ds	NB_P2	; conditions (+$480 soit 32)
tblAnon31	ds	5	; because it exists

tblO	hex	00,00,03,02,05,05,05,04,06,06,00,07,07,00,00,00
	hex	00,00,08,00,00,00,08,0C,0D,10,00,0F,0B,00,1E,0A
	hex	0E,14,29,1B,19,1C,00,00,1A,1A,1D,17,17,17,18,18
	hex	1E,1E,1F,1F,1F,20,20,20,00,21,24,25,28,00,00,00
	hex	26,27,00,00,00,00,00,00,00,00,00,00,09,00,00,13
	hex	00,00,00,00,00,00,00,00,13,0A,2D,2D,2D,2C,2C,2C

tblR	hex	03,04,05,06,08,09,0B,0F,11,0E,17,15,0C,0D,14,1A
	hex	1C,23,1D,1F,1E,24,20,22,18,13,18,18,2E,1B,28,25
	hex	0E,01,2B,33,27,23,2D,2C,2A,32,31,02,01,00

FIN_DATA

*--- Game data

D0	ds	2	; fun to use 68000
D1	ds	2	; fun to use 68000
D2	ds	2	; fun to use 68000
D3	ds	2	; fun to use 68000
D7	ds	2	; fun to use 68000
DARK	ds	2	; dark flag
DARK_2	ds	2	; the associated flag
F	ds	2	; other
I	ds	2	; printWHATEVER
J	ds	2	; printWHATEVER
K	ds	2	; other
MO$1	ds	2	; mot 1
MO$2	ds	2	; mot 2
N	ds	2	; other
OK	ds	2	; FALSE or TRUE
RND	ds	2	; random value

X$1_SAVE	ds	2	; save length for a SAY command
X$2_SAVE	ds	2	; save length for a SAY command

X$1	ds	NB_CAR+1	; premier mot saisi
X$2	ds	NB_CAR+1	; second mot saisi

*--- It's the end
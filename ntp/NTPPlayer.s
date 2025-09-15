*
* NTP Player
* v1.1.1.1.1.1.1.1.1......
*
* (c) 2019-2025, Brutal Deluxe Software
*

* v1.0b0 - 20190523
*   I replaced the pei $0a with lda $0a stal ptrSAVE
*   The final version will have them back to shorten code
*
* v1.0b1 - 20190523
*   Everything is in place, must test now
*
* v1.0b2 - 20190524
*   Oops, not finderSaysBeforeOpen MUST go to myREQUEST4, not 3
*   That's what happens when you modify your code from 1994 :-)
*
* v1.0 - 20230318
*   GS/OS string buffer is now bigger
*   We DO NOT have an icon yet
*   Some bugs fixed
*   Better lisibility of the source code
*
* v1.1 - 20240203
*   Removed code for srqGoAway
*
* v1.1.1 (again) - 20250915
*   control-option-command-space to stop music
*   fix of the srqGoAway code (my bad...)
*

	mx	%00
	rel
	typ	$B6
	dsk	NTPPlayer
	lst	off

*----------------------------

	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Tool222.Macs
	use	4/Misc.Macs
	use	4/Util.Macs

*----------------------------

ntpTOOL	=	222
ntpVERSION	=	$0100
ntpTYPE	=	$00d5
ntpAUXTYPE	=	$0008

GSOS	=	$E100A8

result	=	$10
reqCode	=	$0e
dataIn	=	$0a
dataOut	=	$06

*----------------------------

	phb
	phk
	plb
	
	pha
	_MMStartUp
	pla
*	ora	#$0100
	sta	myID
	
	PushLong	#myBRUTAL
	PushWord	myID
	PushLong	#myREQUEST
	_AcceptRequests
	
	PushLong	#mySTRING
	PushLong	#0	; myICON
	_ShowBootInfo
	
	plb
	rtl

*----------------------------

doSRQGOAWAY	ldy	#2
	ldal	myID
	sta	[dataOut],y
	iny
	iny
	lda	#0	; Not OK to shut me down
	sta	[dataOut],y
	bra	myREQUEST3

*----------------------------

myREQUEST	phd
	tsc
	tcd
	
	stz	result	; as in MountIt
	
	lda	reqCode
	cmp	#3	; srqGoAway
	beq	doSRQGOAWAY	; nah, I want to stay in memory...
	cmp	#$0101	; finderSaysGoodbye
	beq	doBYE
myREQUEST2	cmp	#$0104	; finderSaysBeforeOpen
	beq	doOPEN
	cmp	#$010a	; finderSaysKeyHit
	bne	myREQUEST4
	brl	doKEYHIT

myREQUEST3	lda	#$8000	; call handled
	sta	result

myREQUEST4	pld
	lda	$02,s
	sta	$0c,s
	lda	$01,s
	sta	$0b,s
	ply
	ply
	ply
	ply
	ply
	rtl

*----------------------------

doBYE	ldal	fgTOOL222	; did I activate the tool?
	beq	doBYE9	; nope

	_NTPShutDown		; yes, stop music & tool

	PushWord	#ntpTOOL	; unload it!
	_UnloadOneTool

doBYE9	lda	#0	; tool is off
	stal	fgTOOL222

	bra	myREQUEST3	; call handled

*----------------------------

doOPEN	ldy	#22
	lda	[dataIn],y	; printFlag
	beq	doOPEN2	; 0 for open
doOPEN1	bra	myREQUEST4

doOPEN2	ldy	#10	; is it a NTP file?
	lda	[dataIn],y
	cmp	#ntpTYPE
	bne	doOPEN1
	ldy	#12
	lda	[dataIn],y
	cmp	#ntpAUXTYPE
	bne	doOPEN1

*--- Is tool in memory?

	ldal	fgTOOL222
	bne	doOPEN3	; yes

	PushWord	#ntpTOOL
	PushWord	#ntpVERSION
	_LoadOneTool
	bcs	doOPEN1

	lda	#1
	stal	fgTOOL222

	ldal	myID
	pha
	_NTPStartUp

*--- Now, copy the GS/OS (STRL) pathname, we need a STR

doOPEN3	lda	dataIn	; save dataIn ptr
	stal	ptrSAVE
	lda	dataIn+2
	stal	ptrSAVE+2

	ldy	#2	; pathPtr
	lda	[dataIn],y
	tax
	iny
	iny
	lda	[dataIn],y
	sta	dataIn+2
	stx	dataIn

	ldy	#768-2	; copy path
]lp	tyx
	lda	[dataIn],y
	stal	pathSONG,x
	dey
	dey
	bpl	]lp

	ldal	pathSONG	; from STRL to STR
	xba		; if path is long...
	stal	pathSONG	; ...ahem

	ldal	ptrSAVE+2
	sta	dataIn+2
	ldal	ptrSAVE
	sta	dataIn

*--- Now, play the song

	PushLong	#pathSONG2
	_NTPLoadOneMusic
	bcc	doOPEN4
	brl	myREQUEST4	; error

doOPEN4	PushWord	#0	; no loop
	_NTPPlayMusic
	brl	myREQUEST3	; muzak is playing!

*----------------------------

doKEYHIT	ldal	fgTOOL222	; was tool started?
	beq	doKEYHIT9	; no

	ldy	#2	; yes, check key combination
	lda	[dataIn],y
	and	#$ff
	cmp	#$20	; space character?
	bne	doKEYHIT9
	ldy	#4
	lda	[dataIn],y	; control-option-command?
	and	#%00011001_00000000
	cmp	#%00011001_00000000
	bne	doKEYHIT9
	
	_NTPStopMusic		; stop the muwak
	brl	myREQUEST3	; and exit
	
doKEYHIT9	brl	myREQUEST4	; not for me

*----------------------------

fgTOOL222	ds	2	; <>0 if tool in mem
myID	ds	2	; memID

ptrSAVE	ds	4	; save dataIn ptr
pathSONG	ds	1	; STRL from GS/OS
pathSONG2	ds	768	; STR to the NTP tool

*----------------------------

myBRUTAL	str	'BrutalDeluxe~NTPPlayer~'

mySTRING	asc	'NTPPlayer             v01.11  by Brutal Deluxe'00

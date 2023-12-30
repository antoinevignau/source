*
* Le retour du Dr Genius
*
* (c) 1983, Loriciels
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	lst	off
	rel
	dsk	iigs.l
	
	mx	%00
	xc
	xc

*-----------------------------------
* MACROS
*-----------------------------------

	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
GSOS	=	$e100a8

dpY	=	$70
dpFROM	=	dpY+2
dpTO	=	dpFROM+2

refIsPointer =	$0
refIsHandle	=	$1
refIsResource =	$2

TRUE	=	255
FALSE	=	0

mode320	=	$00
mode640	=	$80

maxX	=	320
maxY	=	200

*-----------------------------------
* SOFTSWITCHES AND FRIENDS
*-----------------------------------

WNDTOP	=	$22	; top of text window 
WNDBTM	=	$23	; bottom+1 of text window 
CH	=	$24	; cursor horizontal position 
CV	=	$25	; cursor vertical position 
LINNUM	=	$50	; result from GETADR
X0L	=	$e0	; X-coord
X0H	=	$e1
Y0	=	$e2	; Y-coord

nbOaP	=	10	; on peut porter dix objets

chrLA	=	$88
chrRA	=	$95
chrDEL	=	$ff
chrRET	=	$8d
chrSPC	=	$a0
TEXTBUFFER = 	$200
maxLEN	=	20

chrOUI	=	"O"
chrNON	=	"N"

idxCASSE	=	200
idxTIMER	=	201

PRODOS	=	$bf00

KBD	=	$c000
CLR80VID	=	$c00c
KBDSTROBE	=	$c010
VBL	=	$c019
MONOCOLOR	=	$c021
VERTCNT	=	$c02e
SPKR	=	$c030
CYAREG	=	$C036
TXTCLR	=	$c050
TXTSET	=	$c051
MIXCLR	=	$c052
MIXSET	=	$c053
TXTPAGE1	=	$c054
TXTPAGE2	=	$c055
LORES	=	$c056
HIRES	=	$c057

*--- The firmware routines

HGR	=	$F3E2	; HGR
HPLOT	=	$F457	; HPLOT
HILIN	=	$F53A	; HPLOT TO
HCOLOR	=	$F6E9	; HCOLOR= (call+3)
INIT	=	$FB2F
TABV	=	$FB5B
HOME	=	$FC58
WAIT	=	$FCA8
RDKEY	=	$FD0C
*GETLN1	=	$FD6F	; using mine now
COUT	=	$FDED
IDROUTINE	=	$FE1F
SETNORM	=	$FE84
SETKBD	=	$FE89

*-----------------------------------
* MACROS
*-----------------------------------

@draw	mac
	lda	#]1
	jsr	showPIC
	eom

@explode	mac
	jsr	EXPLODE
	eom

@play	mac
	ldx	#>]1
	ldy	#<]1
	jsr	playMUSIC
	eom

@print	mac
	ldx	#>]1
	ldy	#<]1
	jsr	printCSTRING
	eom

@wait	mac
	ldx	#>]1
	ldy	#<]1
	jsr	waitMS
	eom

*-----------------------------------
* DU 16-BITS
*-----------------------------------

	phk
	plb
	
	clc
	xce
	rep	#$30

	tdc
	sta	myDP

	lda	#ICI
	stal	$300
	lda	#^ICI
	stal	$302
	
	_TLStartUp
	pha
	_MMStartUp
	pla
	sta	myID

	pha
	pha
	PushWord	myID
	PushWord	#refIsPointer
	PushLong	#toolTBL
	_StartUpTools
	PullLong ssREC

	_HideMenuBar
	_InitCursor
	_HideCursor

	PushLong #0
	PushWord #5		; SetDeskPat
	PushWord #$4000
	PushWord #$0000
	_Desktop
	pla
	pla

	PushLong	#0
	_GetPort
	PullLong	mainPORT
	
	PushLong	mainPORT
	_SetPort

	PushWord	#0
	_SetBackColor
	PushWord	#15
	_SetForeColor

	PushLong	#curPATTERN
	_GetPenPat

	PushLong	#whitePATTERN	; white pattern
	_SetPenPat

	PushWord	#0
	_ClearScreen

*-----------------------------------
* AFFICHE UNE IMAGE
*-----------------------------------

	stz	myINDEX
	
loop	lda	myINDEX
	jsr	showIMAGE

]lp	ldal	$bfff
	bpl	]lp
	stal	$c00f
	
	PushWord	#0
	_ClearScreen

	inc	myINDEX
	lda	myINDEX
	cmp	#58
	bcc	loop

*-----------------------------------
* AU REVOIR LE IIGS
*-----------------------------------

	_GrafOff	
	
	PushWord #refIsPointer
	PushLong ssREC
	_ShutDownTools

	PushWord myID
	_DisposeAll

	PushWord myID
	_MMShutDown

	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

	brk	$bd

*-----------------------------------
* DES DONNES 16-BITS
*-----------------------------------

myINDEX	ds	2

*-----------------------------------

curPATTERN	ds	32
whitePATTERN ds	32,$ff

*----------------------------------- New Tool table

ssREC	ds	4

toolTBL	dw	$0000
	dw	$0000
	dw	$0000
	ADRL	$00000000
	dw	$0011
	dw	$0003
	dw	$0300
	dw	$0004
	dw	$0301
	dw	$0005
	dw	$0302
	dw	$0006
	dw	$0300
	dw	$0008
	dw	$0301
	dw	$000B
	dw	$0200
	dw	$000E
	dw	$0301
	dw	$000F
	dw	$0301
	dw	$0010
	dw	$0301
	dw	$0012
	dw	$0301
	dw	$0014
	dw	$0301
	dw	$0015
	dw	$0301
	dw	$0016
	dw	$0300
	dw	$0017
	dw	$0301
	dw	$001B
	dw	$0301
	dw	$001C
	dw	$0301
	dw	$001E
	dw	$0100

*-----------------------------------

proQUIT	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags
	
*-----------------------------------

myID	ds	2
myDP	ds	2

mainPORT	ds	4

*-----------------------------------
* CODE BASIC EN ASM :-)
*-----------------------------------

	put	engine.s
	put	../common/images.s
	
*--- It's the end


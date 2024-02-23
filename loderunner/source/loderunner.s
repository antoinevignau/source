*
* Lode Runner
* (c) 1983, Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

	mx    %00

*----------------------------------- Macros

	use   4/Ctl.Macs
	use   4/Desk.Macs
	use   4/Event.Macs
	use   4/Font.Macs
	use   4/Int.Macs
	use   4/Line.Macs
	use   4/Locator.Macs
	use   4/Mem.Macs
	use   4/Menu.Macs
	use   4/MIDISyn.Macs
	use   4/Misc.Macs
	use   4/Print.Macs
	use   4/Qd.Macs
	use   4/QdAux.Macs
	use   4/Resource.Macs
	use   4/Scrap.Macs
	use   4/Sound.Macs
	use   4/Std.Macs
	use   4/TextEdit.Macs
	use   4/Util.Macs
	use   4/Window.Macs

	use	LR.EQUATES
	
*----------------------------------- Constantes

	ext	ptrUNPACK
	ext	ptrBACKGND
	ext	ptrIMAGE
	ext	ptrTITLE
	ext	ptrLEVELS
	ext	ptrSCORES
	ext	HGR2
	
*-------------- Softswitches

RDVBLBAR	=	$e0c019
GSOS	=	$e100a8

*-------------- GUI

wMAIN	=	1
alertQUIT	=	$0100
alertRESTART =	$0200

refIsPointer =	0
refIsHandle	=	1
refIsResource =	2

ptr012000	=	$012000
ptrE12000	=	$e12000

*---

TRUE	=	255
FALSE	=	0

*----------------------------------- Entry point

	phk
	plb

	clc
	xce
	rep	#$30
	
	_TLStartUp
	pha
	_MMStartUp
	pla
	sta	mainID
	ora	#$0100
	sta	myID

	tdc
	sta	myDP

*--- Version du systeme

	jsl	GSOS
	dw	$202a
	adrl	proVERS
	
	lda	proVERS+2
	and	#%01111111_11111111
	cmp	#$0402
	bcs	okVERS
	
	pha
	PushLong #verSTR1
	PushLong #verSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl	meQUIT1

*--- Compacte la mémoire

okVERS	PushLong	#0
	PushLong	#$8fffff
	PushWord	myID
	PushWord	#%11000000_00000000
	PushLong	#0
	_NewHandle
	_DisposeHandle
	_CompactMem

*--- Chargement des outils

	pha
	pha
	PushWord	mainID
	PushWord	#refIsResource
	PushLong	#1
	_StartUpTools
	PullLong	SStopREC
	bcc	okTOOL
	
	pha
	PushLong	#tolSTR1
	PushLong	#errSTR2
	PushLong	#errSTR1
	PushLong	#errSTR2
	_TLTextMountVolume
	pla
	brl	meQUIT1

*--- Test default shadowing...

okTOOL	PushWord	#0
	_GetMasterSCB
	pla
	bmi	okSHADOW	; shadowing is on if bit 15 is set

	lda	#^ptrE12000	; shadowing is off, use slow RAM
	sta	ptrSCREEN+2

*--- Et la musique...

okSHADOW	pha
	_SoundToolStatus
	pla
	bne	noSOUND

	lda	#1
	sta	fgSND

noSOUND	_HideMenuBar
	_InitCursor
	_HideCursor

	PushWord	#0
	PushWord	#%11111111_11111111
	PushWord	#0
	_FlushEvents
	pla

	PushLong	#0
	PushWord	#5	; SetDeskPat
	PushWord	#$4000
	PushWord	#$0000
	_Desktop
	pla
	pla

*----------------------------------- Exit point

	ldx	#256-2	; efface la page directe
]lp	stz	$00,x
	dex
	dex
	bpl	]lp

	jsr	loadLEVELS	; exit 8-bit

	mx	%11
	
	lda	ptrSCREEN+2
	sta	ptrHGR1+2
	brl	theGAME

	mx	%00	; The 16-bit world

*-----------------------------------
* AUTRES ROUTINES
*-----------------------------------

*----------------------------------- Open LEVELS

doLOAD	jsr	saveBACK

	PushWord	#30
	PushWord	#43
	PushLong	#strLOADFILE
	PushLong	#0
	PushLong	#typeLIST
	PushLong	#replyPTR
	_SFGetFile

	jsr	loadBACK
	
	lda	replyPTR
	bne	doLOAD1
	rts

doLOAD1	jsr	copyPATH
	jmp	loadLEVELS

*----------------------------------- Save

doSAVE	jsr	saveBACK

	PushWord	#25
	PushWord	#36
	PushLong	#strSAVEFILE
	PushLong	#namePATH
	PushWord	#15
	PushLong	#replyPTR
	_SFPutFile

	jsr	loadBACK

	lda	replyPTR
	bne	doSAVE1
	rts

doSAVE1	jsr	copyPATH
	jmp	saveLEVELS

*--- Recopie le filename du fichier de sauvegarde

copyPATH	sep	#$20
	ldx	#16-1
]lp	lda	namePATH1,x
	sta	pLEVELS+4,x
	dex
	bpl	]lp
	
	lda	namePATH
	inc		; add 2 chars
	inc		; for '1/'
	sta	pLEVELS
	rep	#$20
	rts

*----------------------------------- Load/Save LEVELS/SCORES

	mx	%00

*---------------------- Load LEVELS

loadLEVELS	rep	#$30

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	loadLEVELS9

	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2012
	adrl	proREAD
	php

	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

	plp
	bcs	loadLEVELS9
	sep	#$30
	rts
	
	mx	%00

loadLEVELS9	ldx	#0	; clear all levels
	txa
]lp	stal	ptrLEVELS,x
	inx
	inx
	cpx	#38400	; 150 x 256
	bcc	]lp
	
	ldx	#256-2
]lp	lda	scoreEMPTY,x
	sta	scorebuf,x
	stal	ptrSCORES,x
	dex
	dex
	bpl	]lp

	sep	#$30
	rts

	mx	%00

*---------------------- Save LEVELS

saveLEVELS	rep	#$30

	jsl	GSOS
	dw	$2002
	adrl	proDESTROY
	
	jsl	GSOS
	dw	$2001
	adrl	proCREATE
	bcs	saveLEVELS9

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	saveLEVELS9

	lda	proOPEN+2
	sta	proWRITE+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2013
	adrl	proWRITE
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

saveLEVELS9	sep	#$30
	rts
	
	mx	%00

*----------------------------------- Quit

meQUIT	PushWord #refIsHandle
	PushLong SStopREC
	_ShutDownTools

meQUIT1	PushWord myID
	_DisposeAll

	PushWord mainID
	_DisposeAll

	PushWord mainID
	_MMShutDown

	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

	brk	$bd

*----------------------------------------
* GFX
*----------------------------------------

*----------------------------
* unpackLZ4
*  Unpacks a LZ4 file
*  Uses the two pointers:
*   - ptrUNPACK: packed img (MUST BE AT $0000)
*   - ptrIMAGE: temp unpack zone
*
* Entry:
*  A: packed data size
*
* Exit:
*  lenDATA: unpacked data size
*
*----------------------------

	mx	%00
	
unpackLZ4	sta	LZ4_Limit+1
	sep	#$20

	lda	ptrUNPACK+2		; Source
	sta	LZ4_Literal_3+2
	sta	LZ4_ReadToken+3
	sta	LZ4_Match_1+3
	sta	LZ4_GetLength_1+3

	lda	ptrIMAGE+2		; Destination
	sta	LZ4_Literal_3+1
	sta	LZ4_Match_5+1
	sta	LZ4_Match_5+2

	rep	#$20

*--

	ldy	#0	; Init Target unpacked Data offset
	ldx	#16	; Offset after header

LZ4_ReadToken
	LDAL	$AA0000,X	; Read Token Byte
	INX
	STA	LZ4_Match_2+1
	
*----------------

LZ4_Literal
	AND	#$00F0	; >>> Process Literal Bytes <<<
	BEQ	LZ4_Limit	; No Literal
	CMP	#$00F0
	BNE	LZ4_Literal_1
	JSR	LZ4_GetLengthLit	; Compute Literal Length with next bytes
	BRA	LZ4_Literal_2
LZ4_Literal_1
	LSR		; Literal Length use the 4 bit
	LSR
	LSR
	LSR

LZ4_Literal_2
	DEC		; Copy A+1 Bytes
LZ4_Literal_3
	MVN	$AA,$BB	; Copy Literal Bytes from packed data buffer
	PHK		; X and Y are auto incremented
	PLB

*----------------

LZ4_Limit	CPX	#$AAAA	; End Of Packed Data buffer ?
	BEQ	LZ4_End

*----------------

LZ4_Match	TYA		; >>> Process Match Bytes <<<
	SEC
LZ4_Match_1	SBCL	$AA0000,X	; Match Offset
	INX
	INX
	STA	LZ4_Match_4+1

LZ4_Match_2	LDA	#$0000	; Current Token Value
	AND	#$000F
	CMP	#$000F
	BNE	LZ4_Match_3
	JSR	LZ4_GetLengthMat	; Compute Match Length with next bytes
LZ4_Match_3	CLC
	ADC	#$0003	; Minimum Match Length is 4 (-1 for the MVN)
	PHX
LZ4_Match_4	LDX	#$AAAA	; Match Byte Offset
LZ4_Match_5	MVN	$BB,$BB	; Copy Match Bytes from unpacked data buffer
	PHK		; X and Y are auto incremented
	PLB
	PLX
	BRA	LZ4_ReadToken

*----------------

LZ4_GetLengthLit
	LDA	#$000F	; Compute Variable Length (Literal or Match)
LZ4_GetLengthMat
	STA	LZ4_GetLength_2+1
LZ4_GetLength_1
	LDAL	$AA0000,X	; Read Length Byte
	INX
	AND	#$00FF
	CMP	#$00FF
	BNE	LZ4_GetLength_3
	CLC
LZ4_GetLength_2
	ADC	#$000F
	STA	LZ4_GetLength_2+1
	BRA	LZ4_GetLength_1
LZ4_GetLength_3
	ADC	LZ4_GetLength_2+1
	RTS

*----------------

LZ4_End	sty	lenDATA		; Y = length of unpacked data
	rts

*---

lenDATA	ds	4

*-----------------------------------
* SAVE THE SHR SCREEN
*-----------------------------------

saveBACK	_HideCursor

	PushLong	ptrSCREEN
	PushLong	#ptrBACKGND
	PushLong	#32768
	_BlockMove
	
exitBACK	_ShowCursor
	rts

*-----------------------------------
* RESTORE THE SHR SCREEN
*-----------------------------------

loadBACK	_HideCursor

	PushLong	#ptrBACKGND
	PushLong	ptrSCREEN
	PushLong	#32768
	_BlockMove

	_ShowCursor
	rts

*----------------------------------------
* DATA
*----------------------------------------

fgSND	ds	2

*----------------------- Tool locator

verSTR1	str	'System 6.0.1 Required!'
verSTR2	str	'Press a key to quit'
tolSTR1	str	'Error while loading tools'
memSTR1	str	'Cannot allocate memory'
filSTR1	str	'Cannot load file'
errSTR1	str	'Quit'
errSTR2	str	''
errSTR3	str	'Continue'

*----------------------- Memory manager

mainID	ds	2	; app ID
myID	ds	2	; user ID
myDP	ds	2

SStopREC	ds	4

ptrSCREEN	adrl	ptr012000

*----------------------- GS/OS

*--- LEVELS

proCREATE	dw	7	; pcount
	adrl	pLEVELS	; pathname
	dw	$c3	; access_code
	dw	$5d	; file_type
	adrl	$8022	; aux_type
	ds	2	; storage_type
	adrl	38400+256	; eof
	ds	4	; resource_eof

proDESTROY	dw	1	; pcount
	adrl	pLEVELS	; pathname

proOPEN	dw	2
	ds	2
	adrl	pLEVELS

proREAD	dw	4	; 0 - nb parms
	ds	2	; 2 - file id
	adrl	ptrLEVELS	; 4 - pointer
	adrl	38400+256	; 8 - length
	ds	4	; C - length read

proWRITE	dw	5	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	ptrLEVELS	; 4 - data_buffer
	adrl	38400+256	; 8 - request_count
	ds	4	; C - transfer_count
	dw	1	; cache_priority

*--- Global

proCLOSE	dw	1
	ds	2

proQUIT	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags

proVERS	dw	1	; pcount
	ds	2	; version

*---------- Files

pLEVELS	strl	'1/levels/loderunner'

*----------------------- Standard File Toolset

strLOADFILE	str	'Load which file?'
strSAVEFILE	str	'Save as...'

typeLIST	hex	01
	hex	5d	; Game/Edu files
replyPTR	ds	2	; 0 good
	ds	2	; 2 fileType
	ds	2	; 4 auxFileType
namePATH
	hex	06	; 6 fileName
namePATH1
	asc	'Levels'	; 7 fileName (16 normally)
	ds	9
loadPATH
	ds	1	; 22 fullPathname (string length)
loadPATH1
	ds	129	; 23 fullPathname (128 normally)

*----------------------------------------
* LES AUTRES FICHIERS
*----------------------------------------

	put	LR.Code.s
	put	LR.Data.s
	put	LR.Tables.s
	put	LR.Sprites.s
		
*---

	asc	0d
	asc	"----------------"0d
	asc	"                "0d
	asc	"  LODE  RUNNER  "0d
	asc	"                "0d
	asc	" Antoine Vignau "0d
	asc	"Olivier  Zardini"0d
	asc	"                "0d
	asc	"  Paques  2024  "0d
	asc	"                "0d
	asc	"----------------"0d
	
	
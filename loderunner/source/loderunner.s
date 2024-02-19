*
* La Belle Zohra
*
* (c) 1992, François Coulon
* (c) 2023, Antoine Vignau & Olivier Zardini
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

*-------------- Softswitches

GSOS	=	$e100a8

*-------------- GUI

wMAIN	=	1
alertQUIT	=	$0100
alertRESTART =	$0200

refIsPointer =	0
refIsHandle	=	1
refIsResource =	2

appleKey	=	$0100
mouseDownEvt =	$0001
mouseUpEvt	=	$0002
keyDownEvt	=	$0003

ptrSCREENE1	=	$e02000

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

*----------------------------------- Exit point

	lda	#theGAME
	stal	$300
	lda	#^theGAME
	stal	$302
	
	sep	#$30
	
	lda	#^ptrSCREENE1
	sta	ptrDATA+2
	sta	ptrHGR1+2
	sta	ptrHGR2+2
	
	brl	theGAME
	
*----------------------------------- Exit point

	rep	#$30
	
	PushWord myID
	_DisposeAll

	PushWord mainID
	_DisposeAll

	PushWord mainID
	_MMShutDown

	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

*----------------------------------------
* MEMOIRE
*----------------------------------------

make64KB	pha
	pha
	PushLong #$010000
	PushWord myID
	PushWord #%11000000_00011100
	PushLong #0
	_NewHandle
	phd
	tsc
	tcd
	lda   [3]
	tax		; low in X
	ldy   #2
	lda   [3],y
	txy		; low in Y
	tax		; high in X
	pld
	pla		; we do not keep track of the handle
	pla
	rts

*----------------------------------------
* DATA
*----------------------------------------

*----------------------- Memory manager

mainID	ds	2	; app ID
myID	ds	2	; user ID
myDP	ds	2

*----------------------- GS/OS

proQUIT	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags

proVERS	dw	1	; pcount
	ds	2	; version

*----------------------------------------
* LES AUTRES FICHIERS
*----------------------------------------

	ds	\

	put	LR.Code.s
	put	LR.RWTS.s
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
	asc	"   Noel  2023   "0d
	asc	"                "0d
	asc	"----------------"0d
	
	
*
* FileIO
*
* (c) 2026, Brutal Deluxe Software
*
* v1.0 - 20260328 based on speedometer
*

	xc
	xc
	mx	%00

	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Text.Macs
	use	4/Util.Macs

*----------------------------
* EQUATES
*----------------------------

NBBANCS	=	6	; 6 x 64K
NBFILES	=	3	; 10 files

*----------------------------
* DIRECT PAGE
*----------------------------

Debut	=	$00
Arrivee	=	Debut+4
Second	=	Arrivee+4

*----------------------------
* GS/OS
*----------------------------

GSOS	=	$e100a8
GSOSBusy	=	$e100be
DEREF	=	$01fc38
FIND_VCR	=	$01fc48
FIND_FCR	=	$01fc4c

*----------------------------
* LET'S TEST
*----------------------------

	phk
	plb
	
	clc
	xce
	rep	#$30

* 1. init	
	jsl	callSTARTUP	; INIT

* 2. read 64K of File1 at ptrFILE1

	lda	ptrBANK1	; read File1 at ptrFILE1
	sta	ptrRAM
	lda	ptrBANK1+2
	sta	ptrRAM+2
	
	ldx	#0
]lp	phx
	lda	#0	; 1st file is index 0
	jsl	callREAD	; read one block
	plx
	inx
	cpx	#128
	bcc	]lp

* 3. seek File1

	lda	#0	; seek File1
	jsl	callSEEK

* 4. read 64K of File1 at ptrFILE2

	lda	ptrBANK1+4	; read File1 at ptrFILE1
	sta	ptrRAM
	lda	ptrBANK1+4+2
	sta	ptrRAM+2
	
	ldx	#0
]lp	phx
	lda	#0	; 1st file is index 0
	jsl	callREAD	; read one block
	plx
	inx
	cpx	#128
	bcc	]lp

* 5. crash and allow memory comparison

	lda	#DATA_IN
	brk	$bd

* Hint: memory should be the same!
		
*----------------------------
* ENTRY POINT
*----------------------------

	ext	ptrRAM
	ext	callSTARTUP
	ext	callSHUTDOWN
	ext	callREAD
	ext	callSEEK

ptrRAM	ent		; where to load data in RAM
	ds	4	

callSTARTUP	ent
	jmpl	doSTARTUP
callSHUTDOWN	ent
	jmpl	doSHUTDOWN
callREAD	ent
	jmpl	doREAD
callSEEK	ent
	jmpl	doSEEK

*--- GS/OS file names

ptrFILE	da	pFILE1,pFILE2,pFILE3,pFILE4,pFILE5
	da	pFILE6,pFILE7,pFILE8,pFILE9,pFILE10

pFILE1	strl	'8/Data/File1'
pFILE2	strl	'8/Data/File2'
pFILE3	strl	'8/Data/File3'
pFILE4	strl	'8/Data/File4'
pFILE5	strl	'8/Data/File5'
pFILE6	strl	'8/Data/File6'
pFILE7	strl	'8/Data/File7'
pFILE8	strl	'8/Data/File8'
pFILE9	strl	'8/Data/File9'
pFILE10	strl	'8/Data/File10'

*----------------------------
* STARTUP
* Get memory and open files
*----------------------------

doSTARTUP	phb
	phk
	plb

	lda	myID
	beq	doSTARTUP1
	
	plb		; exit if already init'ed
	rtl

*--- 1. Init tools

doSTARTUP1	_TLStartUp
	pha
	_MMStartUp
	pla
	sta	appID
	ora	#$0100
	sta	myID

*--- 2. Get memory banks

	stz	doSTARTUP2+1	; reset index
	
]lp	pha
	pha
	PushLong	#$010000	; demande 64K
	PushWord	myID
	PushWord	#%11000000_00011100
	PushLong	#0
	_NewHandle

doSTARTUP2	lda	#0	; prepare index
	asl
	asl
	tax

	phd		; save pointer address
	tsc
	tcd
	lda	[3]
	sta	ptrBANK1,x
	ldy	#2
	lda	[3],y
	sta	ptrBANK1+2,x
	pld
	pla		; and handle value
	sta	haBANK1,x
	pla
	sta	haBANK1+2,x

	inc	doSTARTUP2+1
	lda	doSTARTUP2+1	; exit condition
	cmp	#NBBANCS
	bcc	]lp

*--- Open files one-by-one

	stz	doSTARTUP3+1	; reset index

	lda	#dataBUFFER2	; where to read the second file block
	sta	proDREAD+4
	lda	#^dataBUFFER
	sta	proDREAD+6

*---
	
doSTARTUP3	ldx	#0	; the file index
	lda	ptrFILE,x	; the file pointer
	sta	proOPEN+4
	
	jsl	GSOS	; open it
	dw	$2010
	adrl	proOPEN

*--- Du GS/OS bas niveau maintenant

]lp	ldal	GSOSBusy	; Thank you Window Manager
	bmi	]lp
	ora	#$8000
	stal	GSOSBusy

	phd
	lda	#$bd00
	tcd

	sep	#$20
	ldal	$e0c068
	pha
	ldal	$e0c08b
	ldal	$e0c08b
	rep	#$20

	lda	proOPEN+2	; get the FCR
	jsl	FIND_FCR
	jsl	DEREF	; dereference it
	stx	theFCRVOL+1	; save its address
	stx	doSTARTUP5+1
	sep	#$10
	sty	theFCRVOL+3
	sty	doSTARTUP6+1
	rep	#$10

	lda	doSTARTUP3+1	; save time, skip the next code
	bne	doSTARTUP4	; after one call

	ldx	#8	; indirectly get the device ID
theFCRVOL	ldal	$bdbdbd,x	; of the volume ID
	jsl	FIND_VCR	; of the FCR ID
	jsl	DEREF	; dereference it
	stx	theVCR+1
	sep	#$10
	sty	theVCR+3
	rep	#$10

doSTARTUP4	sep	#$20
	pla
	stal	$e0c068
	rep	#$20

	pld

	ldal	GSOSBusy
	asl
	lsr
	stal	GSOSBusy

*--- VCR : récupère le device ID

	lda	doSTARTUP3+1	; save time, skip the next code
	bne	doSTARTUP5

	ldx	#12	; device ID from the VCR
theVCR	ldal	$bdbdbd,x
	sta	proDREAD+2	; we have our device ID!!

*--- FCR : recopie le premier block ID
	
doSTARTUP5	lda	#0	; pointeur to FCR
	sta	Debut
doSTARTUP6	lda	#0
	sta	Debut+2
	
	ldy	#$253	; key block pointer from the FCR
	ldx	#512-2
]lp	lda	[Debut],y
	sta	dataBUFFER-$253,y
	iny
	iny
	dex
	dex
	bpl	]lp

*--- Lit le second bloc d'index

	sep	#$20	; on lit le prochain bloc
	ldy	#$54
	lda	[Debut],y
	sta	proDREAD+12
	ldy	#$154
	lda	[Debut],y
	sta	proDREAD+13
	rep	#$20

	jsl	GSOS	; lit le at dataBUFFER+512
	dw	$202f
	adrl	proDREAD

*--- Convertit les index de blocs ProDOS en liste séquentielle

	ldx	doSTARTUP3+1	; pointe vers la zone pour le fichier
	lda	ptrBLOCKINDEX,x
	sta	Arrivee

	sep	#$30
	ldy	#0
]lp	lda	dataBUFFER,y
	sta	(Arrivee)
	inc	Arrivee
	bne	mt1
	inc	Arrivee+1
mt1	lda	dataBUFFER+256,y
	sta	(Arrivee)
	inc	Arrivee
	bne	mt2
	inc	Arrivee+1
mt2	iny
	bne	]lp
	
]lp	lda	dataBUFFER+512,y
	sta	(Arrivee)
	inc	Arrivee
	bne	mt3
	inc	Arrivee+1
mt3	lda	dataBUFFER+768,y
	sta	(Arrivee)
	inc	Arrivee
	bne	mt4
	inc	Arrivee+1
mt4	iny
	bne	]lp
	rep	#$30

*--- Le fichier est en mémoire et ses blocs aussi

	ldx	doSTARTUP3+1
	lda	proOPEN+2	; save reference number
	sta	fileID,x
	stz	blockINDEX,x	; reset block index of the file

	inx		; next file please
	inx
	cpx	#NBFILES*2
	bcs	doSTARTUP7
	stx	doSTARTUP3+1
	jmp	doSTARTUP3
	
doSTARTUP7	plb		; on a fini :-)
	rtl

*----------------------------
* SHUTDOWN
* Close files and free memory
*----------------------------

doSHUTDOWN	phb
	phk
	plb

	lda	myID
	bne	doSHUTDOWN1

	plb		; exit if not init'ed
	rtl

*--- Close files

doSHUTDOWN1	ldx	#0
]lp	lda	fileID,x
	sta	proCLOSE+2
	phx
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	
	plx
	inx
	inx
	cpx	#NBFILES*2
	bcc	]lp

*--- Free memory

	PushWord	myID
	_DisposeAll

	PushWord	appID
	_MMShutDown

	_TLShutDown
	
	stz	myID

	plb
	rtl

*----------------------------
* READ
* Read a file (index in A)
*----------------------------

doREAD	phb		; We read one block of data of file A
	phk		; at ptrBUFFER
	plb
	
	ldx	myID
	beq	doREAD1

	asl
	tax
	lda	blockINDEX,x	; get index in block list (0..2..4)
	inc	blockINDEX,x	; prepare next index
	asl
	and	#1024-1	; un joli masque pour gagner du temps (512*2-1 = $3FF)
	clc
	adc	ptrBLOCKINDEX,x	; 0000..0400..0800
	tay		; we have the pointer to the block to read in Y now

	lda	|$0000,y	; get the block to read
	sta	proDREAD+12	; save it

	lda	ptrRAM	; set RAM pointer
	sta	proDREAD+4
	lda	ptrRAM+2
	sta	proDREAD+6

	jsl	GSOS	; read the block
	dw	$202f
	adrl	proDREAD

	lda	ptrRAM+1	; RAM pointer += 512
	clc
	adc	#2
	sta	ptrRAM+1
	
doREAD1	plb
	rtl

*----------------------------
* SEEK
* Set mark to 0 (index in A)
*----------------------------

doSEEK	phb		; on n'a besoin que de remettre l'index de block list à 0
	phk		; puisque toutes les autres données sont déjà en mémoire
	plb

	ldx	myID
	beq	doSEEK1

	asl
	tax
	stz	blockINDEX,x	; reset index in block list for file A

doSEEK1	plb
	rtl
	
*----------------------------
* DATA
*----------------------------

DATA_IN

*--- Memory

appID	ds	2	; Memory Manager application ID
myID	ds	2	; 
ptrBANK1	ds	4*NBBANCS	; pointer to 64K memory banks
haBANK1	ds	4*NBBANCS	; handle to 64K memory banks
fileID	ds	2*NBFILES	; reference number of file X
blockINDEX	ds	2*NBFILES	; block index of file X

*--- GS/OS

proOPEN	dw	2	; Parms for Open
	ds	2	; ref_num
	adrl	pFILE1	; pathname

proCLOSE	dw	1	; Parms for Close
	ds	2	; ref_num

proDREAD	dw	6	; Parms for DRead
	ds	2	;  2 device num
	ds	4	;  4 buffer
	adrl	512	;  8 request count
	ds	4	; 12 starting block
	dw	512	; 16 block size
	ds	4	; 18 transfer count

*--- The block indexes every $400 bytes

ptrBLOCKINDEX	da	blockINDEX1,blockINDEX2,blockINDEX3,blockINDEX4,blockINDEX5
	da	blockINDEX6,blockINDEX7,blockINDEX8,blockINDEX9,blockINDEX10

blockINDEX1	ds	512*2	; 2 blocks per file
blockINDEX2	ds	512*2	; 2 blocks per file
blockINDEX3	ds	512*2	; 2 blocks per file
blockINDEX4	ds	512*2	; 2 blocks per file
blockINDEX5	ds	512*2	; 2 blocks per file
blockINDEX6	ds	512*2	; 2 blocks per file
blockINDEX7	ds	512*2	; 2 blocks per file
blockINDEX8	ds	512*2	; 2 blocks per file
blockINDEX9	ds	512*2	; 2 blocks per file
blockINDEX10	ds	512*2	; 2 blocks per file

dataBUFFER	ds	512	; the first block for the init routine
dataBUFFER2	ds	512	; the second block

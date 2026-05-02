*
* FileIO65
*
* (c) 2026, Brutal Deluxe Software
*
* v1.0 - 20260328 based on speedometer
* v1.1 - 20260501 (pfou, le 1er-Mai)
* v1.2 - 20260502
*

	xc
	xc
	mx	%00

*----------------------------
* EQUATES
*----------------------------

Debut	=	$80
BLOCKSIZE	=	512

GSOS	=	$e100a8
GSOSBusy	=	$e100be
DEREF	=	$01fc38
FIND_VCR	=	$01fc48
FIND_FCR	=	$01fc4c

*----------------------------
* HOW-TO USE
*----------------------------
*
* 	LDA  ptrRAM+2
*	LDX  #myFILE
*	JSR  fileOPEN
*	STA  nbBLOCKS
*
*	JSR  fileREAD
*	STA  ptrRAM
*
*	JSR  fileCLOSE
*
* ptrRAM	DS   4
* myFILE	STRL '8/JoliFichier'
*               
*----------------------------

*----------------------------
* VECTORS
*----------------------------

fileOPEN	jmp	file65OPEN	;  In A: @RAM haut ($0012 if $12/0000)
			;     Y: @GSOSFileName (strl)
			; Out A: 0 = file error
			;       >0 = nb of 512-byte blocks
			;     C: carry clear or set
fileREAD	jmp	file65READ	; Out A: @RAM  bas ($1100 if $12/1100)
			;     C: carry clear or set
fileCLOSE	jmp	file65CLOSE	; Out C: carry clear or set

*----------------------------
* OPEN
*----------------------------

file65OPEN	stz	proDREAD+4
	sta	proDREAD+6	; RAM pointer
	sty	proOPEN+4	; filename pointer
	stz	blockCOUNTER	; 0..127

*--- Get file info

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcc	file65OPEN_1
	lda	#0
	rts

file65OPEN_1	lda	proOPEN+2
	sta	proCLOSE+2

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
	sty	doSTARTUP5+3
	rep	#$10

	ldx	#8	; indirectly get the device ID
theFCRVOL	ldal	$bdbdbd,x	; of the volume ID
	jsl	FIND_VCR	; of the FCR ID
	jsl	DEREF	; dereference it
	stx	theVCR+1
	sep	#$30
	sty	theVCR+3

	pla
	stal	$e0c068
	rep	#$30

	pld

	ldal	GSOSBusy
	asl
	lsr
	stal	GSOSBusy

*--- VCR : récupère le device ID

	ldx	#12	; device ID from the VCR
theVCR	ldal	$bdbdbd,x
	sta	proDREAD+2
	
*--- FCR : recopie le block ID
	
	ldx	#$253	; key block pointer from the FCR
	ldy	#512-2
doSTARTUP5	ldal	$bdbdbd,x
	sta	dataBUFFER-$253,x
	inx
	inx
	dey
	dey
	bpl	doSTARTUP5

*--- Convertit les index de blocs ProDOS en liste séquentielle

	sep	#$30
	ldy	#0
	tyx
]lp	lda	dataBUFFER,y	; 0-0, 1-2, 2-4
	sta	blockINDEX,x
	inx
	inx
	iny
	bpl	]lp

	ldy	#0
	tyx
]lp	lda	dataBUFFER+256,y ; 0-1, 1-3, 2-5
	sta	blockINDEX+1,x
	inx
	inx
	iny
	bpl	]lp
	
	rep	#$30

*--- Return file size in blocks

	lda	proOPEN+43	; file size <<8
	inc		; +1
	lsr		; /2 = number of blocks
	rts		; assume a file is 512 bytes at least

*----------------------------
* READ
*----------------------------

file65READ	lda	blockCOUNTER
	inc	blockCOUNTER
	asl
	tax
	lda	blockINDEX,x	; end of file
	beq	file65READ_BLK	; a blank block
	sta	proDREAD+12
	
	jsl	GSOS
	dw	$202f
	adrl	proDREAD
	bcs	file65READ_ERR

file65READ_XIT	lda	proDREAD+4	; return low RAM pointer
	inc	proDREAD+5	; +512 bytes
	inc	proDREAD+5
	rts

file65READ_BLK	lda	proDREAD+4	; we have an empty block!
	sta	file65READ_PTR+1
	lda	proDREAD+5
	sta	file65READ_PTR+2
	
	ldx	#BLOCKSIZE-2
	lda	#0
file65READ_PTR	stal	$bdbdbd,x
	dex
	dex
	bpl	file65READ_PTR
	jmp	file65READ_XIT

file65READ_ERR	lda	#0
	rts

*----------------------------
* CLOSE
*----------------------------

file65CLOSE	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	rts

*----------------------------
* DATA
*----------------------------

DATA_IN

*--- GS/OS

proOPEN	dw	12	;  +0 pcount
	ds	2	;  +2 ref_num
	adrl	proOPEN	;  +4 pathname
	ds	2	;  +8 request_access
	ds	2	; +10 resource_num
	ds	2	; +12 access
	ds	2	; +14 file_type
	ds	4	; +16 aux_type
	ds	2	; +20 storage_type
	ds	8	; +22 create_td
	ds	8	; +30 modify_td
	ds	4	; +38 option_list
	ds	4	; +42 eof

proCLOSE	dw	1	; +0 pcount
	ds	2	; +2 ref_num

proDREAD	dw	6	; Parms for DRead
	ds	2	;  +2 device num
	ds	4	;  +4 buffer
	adrl	BLOCKSIZE	;  +8 request count
	ds	4	; +12 starting block
	dw	BLOCKSIZE	; +16 block size
	ds	4	; +18 transfer count

*--- Block data

blockCOUNTER	ds	2	; 0..127 
blockINDEX	ds	BLOCKSIZE
dataBUFFER	ds	BLOCKSIZE

*--- End of code

*
* FileIO64
*
* (c) 2026, Brutal Deluxe Software
*
* v1.0 - 20260328 based on speedometer
* v1.1 - 20260501 (pfou, le 1er-Mai)
*

	xc
	xc
	mx	%00

*----------------------------
* EQUATES
*----------------------------

GSOS	=	$e100a8

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

fileOPEN	jmp	file64OPEN	;  In A: @RAM haut ($0012 if $12/0000)
			;     Y: @GSOSFileName (strl)
			; Out A: 0 = file error
			;       >0 = nb of 512-byte blocks
			;     C: carry clear or set
fileREAD	jmp	file64READ	; Out A: @RAM  bas ($1100 if $12/1100)
			;     C: carry clear or set
fileCLOSE	jmp	file64CLOSE	; Out C: carry clear or set

*----------------------------
* OPEN
*----------------------------

file64OPEN	sta	proREAD+6
	sta	RAMBANK

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	file64OPEN_ERR

	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2
	sta	proSETMARK+2

	lda	proOPEN+43	; file size <<8
	inc		; +1
	lsr		; /2 = number of blocks
file64OPEN_ERR	rts		; assume a file is 512 bytes at least
	
*----------------------------
* READ
*----------------------------

file64READ	jsl	GSOS
	dw	$2012
	adrl	proREAD
	bcs	file64READ_ERR

	lda	proREAD+4	; return low RAM pointer
	inc	proREAD+5	; +512 bytes
	inc	proREAD+5
file64READ_ERR	rts

*----------------------------
* CLOSE
*----------------------------

file64CLOSE	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	rts

*----------------------------
* DATA
*----------------------------

DATA_IN

*--- Memory

RAMBANK	ds	2	; where a file is loaded in RAM

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

proREAD	dw	5	;  +0 pcount
	ds	2	;  +2 ref_num
	ds	4	;  +4 data_buffer
	adrl	512	;  +8 request_count
	ds	4	; +12 transfer_count
	dw	1	; +16 cache_priority

proCLOSE	dw	1	; +0 pcount
	ds	2	; +2 ref_num

proSETMARK	dw	3	; +0 pcount
	ds	2	; +2 ref_num
	dw	0	; +4 base (0 = displacement)
	ds	4	; +6 displacement (0)

*--- End of code

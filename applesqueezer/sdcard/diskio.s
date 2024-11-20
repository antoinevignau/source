*
* Petit FAT File System Module: diskio
*
* (c) 2014, ChaN
* (v) 2024, Brutal Deluxe Software
* Visit brutaldeluxe.fr
*

	xc
	xc
	mx	%00

*-------------------------------
* EQUATES
*-------------------------------

RES_OK	=	0
RES_ERROR	=	1
RES_NOTRDY	=	2
RES_PARERR	=	3

STA_NOINIT	=	1
STA_NODISK	=	2

SIZE_SECTOR	=	512

*-------------------------------
* INITIALIZE DISK DRIVE
*-------------------------------

	mx	%00
	
disk_initialize
	lda	#RES_OK
	clc
	rts

*-------------------------------
* SKIP BYTES (Y)
*-------------------------------

	mx	%11
	
skip	ldal	SD_ACCESS
	dey
	bne	skip
	rts

*-------------------------------
* READ PARTIAL SECTOR
*-------------------------------
* 12 : long *buffer
*  8 : long sector
*  6 : word offset
*  4 : word count
*  1 :  adr rtl

drpRTL	=	3
drpCOUNT	=	drpRTL+2
drpOFFSET	=	drpCOUNT+2
drpSECTOR	=	drpOFFSET+2
drpBUFF	=	drpSECTOR+4

	mx	%00
	
disk_readp	ldal	SD_CARD_INSERTED
	and	#$ff
	bne	drp_0

	lda	#RES_ERROR	; no card inserted
	sec
	rts
	
drp_0	phd
	tsc
	tcd
	sep	#$20
	lda	drpSECTOR+3
	stal	SD_ADDRESS_SET_MSB
	lda	drpSECTOR+2
	stal	SD_ADDRESS_SET_MSB+1
	lda	drpSECTOR+1
	stal	SD_ADDRESS_SET_MSB+2
	lda	drpSECTOR
	stal	SD_ADDRESS_SET_MSB+3
	
	lda	#1	; dummy read
	stal	SD_START_READ

	rep	#$20
	lda	#SIZE_SECTOR
	sec
	sbc	drpOFFSET
	sec
	sbc	drpCOUNT
	sta	bc
	
	lda	drpCOUNT
	lsr
	lsr
	lsr
	tax		; count8 = count / 8
	sep	#$20
	
	ldy	drpOFFSET	; if(offset)
	beq	drp_1
	jsr	skip	; skip(offset)

drp_1	cpx	#0	; if(count8)
	beq	drp_2

	ldy	#0
]lp	ldal	SD_ACCESS
	sta	[drpBUFF],y
	iny
	ldal	SD_ACCESS
	sta	[drpBUFF],y
	iny
	ldal	SD_ACCESS
	sta	[drpBUFF],y
	iny
	ldal	SD_ACCESS
	sta	[drpBUFF],y
	iny
	ldal	SD_ACCESS
	sta	[drpBUFF],y
	iny
	ldal	SD_ACCESS
	sta	[drpBUFF],y
	iny
	ldal	SD_ACCESS
	sta	[drpBUFF],y
	iny
	ldal	SD_ACCESS
	sta	[drpBUFF],y
	iny
	
	rep	#$20	; count -= 8
	lda	drpCOUNT
	sec
	sbc	#8
	sta	drpCOUNT
	sep	#$20
	dex		; while (--count8)
	bne	]lp

drp_2	ldx	drpCOUNT	; if(count)
	beq	drp_3
	ldy	#0
]lp	ldal	SD_ACCESS
	sta	[drpBUFF],y
	iny
	dex		; while (--count)
	bne	]lp

drp_3	ldy	bc	; skip(bc)
	jsr	skip
	
	rep	#$20
	
	pld
	lda	#RES_OK
	clc
	rtl

*-------------- Data

bc	ds	2

*-------------------------------
* READ SECTOR
*-------------------------------

	mx	%00
	
disk_read	ldal	SD_CARD_INSERTED
	and	#$ff
	bne	dr_0

	lda	#RES_ERROR	; no card inserted
	sec
	rts
	
dr_0	sty	drSECTOR
	stx	drSECTOR+2

	sep	#$20

	lda	drSECTOR+3
	stal	SD_ADDRESS_SET_MSB
	lda	drSECTOR+2
	stal	SD_ADDRESS_SET_MSB+1
	lda	drSECTOR+1
	stal	SD_ADDRESS_SET_MSB+2
	lda	drSECTOR
	stal	SD_ADDRESS_SET_MSB+3
	
	lda	#1	; dummy read
	stal	SD_START_READ
	
	ldx	#0
]lp	ldal	SD_ACCESS
	sta	buff,x
	inx
	cpx	#SIZE_SECTOR
	bcc	]lp

	rep	#$20

	lda	#RES_OK
	clc
	rts

*---

drSECTOR	ds	4

*-------------------------------
* WRITE PARTIAL SECTOR
*-------------------------------

	mx	%00
	
disk_writep	lda	#RES_ERROR
	sec
	rts

*-------------------------------
* WRITE SECTOR
*-------------------------------

	mx	%00
	
disk_write	lda	#RES_ERROR
	sec
	rts

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

	mx	%00

disk_readp	ldal	SD_CARD_INSERTED
	and	#$ff
	bne	drp_0

	lda	#RES_ERROR	; no card inserted
	sec
	rts
	
drp_0	sep	#$20
	lda	sector+3
	stal	SD_ADDRESS_SET_MSB
	lda	sector+2
	stal	SD_ADDRESS_SET_MSB+1
	lda	sector+1
	stal	SD_ADDRESS_SET_MSB+2
	lda	sector
	stal	SD_ADDRESS_SET_MSB+3
	
	lda	#1	; dummy data
	stal	SD_START_READ

	rep	#$20	; bc = 512 - offset - count
	lda	#SIZE_SECTOR
	sec
	sbc	offset
	sbc	count
	sta	bc
	
	lda	count
	lsr
	lsr
	lsr
	tax		; count8 = count / 8
	sep	#$20
	
	ldy	offset	; if(offset)
	beq	drp_1
	jsr	skip	; skip(offset)

drp_1	cpx	#0	; if(count8)
	beq	drp_2

	ldy	#0
]lp	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	
	rep	#$20	; count -= 8
	lda	count
	sec
	sbc	#8
	sta	count
	sep	#$20
	
	dex		; while (--count8)
	bne	]lp

drp_2	ldx	count	; if(count)
	beq	drp_3
	ldy	#0
]lp	ldal	SD_ACCESS
	sta	[buff],y
	iny
	dex		; while (--count)
	bne	]lp

drp_3	ldy	bc	; skip(bc)
	jsr	skip
	
	rep	#$20
	lda	#RES_OK
	clc
	rts

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
	
dr_0	sty	sector
	stx	sector+2
	
	sep	#$20
	lda	sector+3
	stal	SD_ADDRESS_SET_MSB
	lda	sector+2
	stal	SD_ADDRESS_SET_MSB+1
	lda	sector+1
	stal	SD_ADDRESS_SET_MSB+2
	lda	sector
	stal	SD_ADDRESS_SET_MSB+3
	
	lda	#1	; dummy data
	stal	SD_START_READ

	ldy	#0
]lp	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	ldal	SD_ACCESS
	sta	[buff],y
	iny
	cpy	#SIZE_SECTOR
	bcc	]lp

	rep	#$20
	lda	#RES_OK
	clc
	rts

*-------------------------------
* WRITE PARTIAL SECTOR
*-------------------------------

	mx	%00
	
disk_writep	ldal	SD_CARD_INSERTED
	and	#$ff
	bne	dwp_0

	lda	#RES_ERROR	; no card inserted
	sec
	rts
	
dwp_0	lda	buff	; if(!buff)
	ora	buff+2
	bne	dwp_2
	
	lda	sc	; if(sc)
	ora	sc+2
	beq	dwp_1
	
	sep	#$20
	lda	sc+3
	stal	SD_ADDRESS_SET_MSB
	lda	sc+2
	stal	SD_ADDRESS_SET_MSB+1
	lda	sc+1
	stal	SD_ADDRESS_SET_MSB+2
	lda	sc
	stal	SD_ADDRESS_SET_MSB+3
	
	lda	#1	; dummy data
	stal	SD_START_WRITE

	rep	#$20	; /* Set byte counter */
	lda	#SIZE_SECTOR
	sta	wc
	jmp	dwp_ok

dwp_1	sep	#$20	; // Finalize write process
	ldx	wc
	lda	#0
]lp	stal	SD_ACCESS
	dex
	bne	]lp
	jmp	dwp_ok

dwp_2	sep	#$20	; /* Send data bytes to the card
	ldy	#0
	ldx	sc
]lp	lda	[buff],y
	stal	SD_ACCESS
	iny
	dex
	bne	]lp

*---

dwp_ok	rep	#$20
	lda	#RES_OK
	clc
	rts

*-------------------------------
* WRITE SECTOR
*-------------------------------

	mx	%00
	
disk_write	ldal	SD_CARD_INSERTED
	and	#$ff
	bne	dw_0

	lda	#RES_ERROR	; no card inserted
	sec
	rts
	
dw_0	sty	sc
	stx	sc+2
	
	sep	#$20
	lda	sc+3
	stal	SD_ADDRESS_SET_MSB
	lda	sc+2
	stal	SD_ADDRESS_SET_MSB+1
	lda	sc+1
	stal	SD_ADDRESS_SET_MSB+2
	lda	sc
	stal	SD_ADDRESS_SET_MSB+3
	
	lda	#1	; dummy data
	stal	SD_START_WRITE

	ldy	#0
]lp	lda	[buff],y
	stal	SD_ACCESS
	iny
	lda	[buff],y
	stal	SD_ACCESS
	iny
	lda	[buff],y
	stal	SD_ACCESS
	iny
	lda	[buff],y
	stal	SD_ACCESS
	iny
	lda	[buff],y
	stal	SD_ACCESS
	iny
	lda	[buff],y
	stal	SD_ACCESS
	iny
	lda	[buff],y
	stal	SD_ACCESS
	iny
	lda	[buff],y
	stal	SD_ACCESS
	iny
	cpy	#SIZE_SECTOR
	bcc	]lp

	rep	#$20
	lda	#RES_OK
	clc
	rts

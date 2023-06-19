*
* AppleSqueezer in 16-bit assembly
*
* (c) 2022, Niek van Suchtelen
* (a) 2022, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-----------------------------------
* SPI FLASH OPERATIONS
*-----------------------------------

*-----------
isAppleSqueezer
	ldal	FL_IDLE
	and	#$ff
	cmp	#TRUE	; if AS is present
	rts

*-----------
coreVersion
	ldal	FL_VERSION
	and	#$ff
	rts

*-----------
chipSelect
	sep	#$20	; 8-bit A
	stal	FL_CS
	rep	#$20	; 16-bit A
	rts

*-----------
waitIdle
	ldal	FL_IDLE
	and	#$ff
	beq	waitIdle
	rts

*-----------
waitReadReady
	ldal	FL_READY
	and	#$ff
	beq	waitReadReady
	rts

*-----------
flashWrite
	sep	#$20	; 8-bit A
	stal	FL_WRITE
	rep	#$20	; 16-bit A
	jmp	waitIdle
	
*-----------
flashRead
	jsr	waitIdle
	sep	#$20
	lda	#0
	stal	FL_READ_REQUEST
	rep	#$20
	jsr	waitIdle
	jsr	waitReadReady
	
	ldal	FL_READ
	and	#$ff
	rts

*-----------
writeEnable
	lda	#0
	jsr	chipSelect
	lda	#CMD_WRITE_ENABLE
	jsr	flashWrite
	lda	#1
	jmp	chipSelect

*-----------
* before sectorErase, call writeEnable
sectorErase
	lda	#0
	jsr	chipSelect
	lda	#CMD_SECTOR_ERASE
	jsr	flashWrite
	lda	#$0f	; sector 15: 000F 0000 - 000F EFFF
	jsr	flashWrite
	lda	#0
	jsr	flashWrite
	lda	#0
	jsr	flashWrite
	lda	#1
	jmp	chipSelect

*-----------
* before bulkErase, call writeEnable
bulkErase
	lda	#0
	jsr	chipSelect
	lda	#CMD_BULK_ERASE
	jsr	flashWrite
	lda	#1
	jmp	chipSelect

*-----------
* before pageProgramSingle, call writeEnable
pageProgramSingle
	pha		; save data

	lda	#0
	jsr	chipSelect
	lda	#CMD_PAGE_PROGRAM
	jsr	flashWrite

* address
	lda	#$0f	; sector 15: 000F 0000 - 000F EFFF
	jsr	flashWrite
	lda	#0
	jsr	flashWrite
	lda	#0
	jsr	flashWrite

* data
	pla		; restore data
	jsr	flashWrite

	lda	#1
	jmp	chipSelect

*----------- TO DO - Use the stack I think
* before pageProgram, call writeEnable
pageProgram
	rts

*-----------
readStateRegister
	lda	#0
	jsr	chipSelect
	lda	#CMD_READ_STATUS_REGISTER
	jsr	flashWrite
	jsr	flashRead
	pha
	lda	#1
	jsr	chipSelect
	pla
	rts

*-----------
writeInProgress
	jsr	readStateRegister	; WIP - write in progress bit
	and	#%00000000_00000001	; if 1, write is in progress
	cmp	#TRUE
	rts			; return TRUE if write is in progress

*-----------
writeEnabled
	jsr	readStateRegister	; WEL - write enable latch bit
	and	#%00000000_00000010	; if 1, write is enabled
	lsr			; move bit 1 in bit 0 for comparison
	cmp	#TRUE
	rts			; return TRUE is write is enabled

*-----------
readDataBytes
	pha		; save address
	lda	#0
	jsr	chipSelect
	lda	#CMD_READ_DATA_BYTES
	jsr	flashWrite

* address
	lda	#$0f	; sector 15: 000F 0000 - 000F EFFF
	jsr	flashWrite
	lda	#0
	jsr	flashWrite
	pla		; restore address
	jsr	flashWrite

* read data
	jsr	flashRead
	pha
	lda	#1
	jsr	chipSelect
	pla
	rts

*-----------
loadValues
	lda	#0		; read byte at address $0F/0000
	jsr	readDataBytes
	sta	data
	rts
	
*-----------
storeValues
	jsr	writeEnable
]lp	jsr	writeEnabled	; FALSE if not possible to write
	bne	]lp

	jsr	sectorErase
]lp	jsr	writeInProgress	; TRUE if write in progress
	beq	]lp

	jsr	writeEnable
]lp	jsr	writeEnabled	; FALSE if not possible to write
	bne	]lp

	lda	data
	jsr	pageProgramSingle	; CDA/NDA harmonization
]lp	jsr	writeInProgress	; TRUE if write in progress
	beq	]lp
	rts

*----------- DATA

data	ds	2
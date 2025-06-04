*
* AppleSqueezer in 16-bit assembly
*
* (c) 2022, Niek van Suchtelen
* (a) 2025, Brutal Deluxe Software
*

	mx	%11
	org	$2000
	typ	SYS
	dsk	restore.system
	lst	off

*-----------------------------------
* APPLESQUEEZER EQUATES
*-----------------------------------

* data
* bit 0: 1 if Acceralation is enabled
* bit 1: 1 if Built-RAM is enabled
* bit 2: 1 if Extra RAM is enabled
* bit 3-7: values unknown

FL_WRITE	=	$e20000
FL_READ_REQUEST =	$e20002 
FL_READ	=	$e20004
FL_CS	=	$e20006
FL_READY	=	$e20008
FL_IDLE	=	$e2000a
FL_VERSION	=	$e2000c

CMD_WRITE_ENABLE = 	$06
CMD_WRITE_DISABLE =	$04
CMD_PAGE_PROGRAM =	$02
CMD_SECTOR_ERASE =	$d8
CMD_BULK_ERASE =	$c7
CMD_READ_DATA_BYTES = 	$03
CMD_READ_STATUS_REGISTER = $05

exdram_address_set_main_bank =	$e30000	; 00..0E
exdram_address_set_addr_low =	$e30002	; 00/00xx
exdram_address_set_addr_high =	$e30004	; 00/xx00
exdram_address_set_addr_bank =	$e30006	; xx/0000
exdram_address_access	=	$e30008	; R/W auto-increment to end of main bank

TRUE	=	1
FALSE	=	0

minVERSION	=	7	; minimum core version to handle the driver

*-----------------------------------
* CODE
*-----------------------------------

HOME	=	$fc58
PRBYTE	=	$fdda
COUT	=	$fded
dpFROM	=	$fe

*---

	jsr	HOME
	jsr	isAppleSqueezer
	beq	gotAS

	ldx	#>strNOAS
	ldy	#<strNOAS
	jsr	printSTRING
]lp	jmp	]lp

*---

gotAS	ldx	#>strVERSION	; show core version
	ldy	#<strVERSION
	jsr	printSTRING
	jsr	coreVersion
	jsr	PRBYTE

	ldx	#>strPREVIOUS	; get saved value
	ldy	#<strPREVIOUS
	jsr	printSTRING
	jsr	loadValues
	jsr	PRBYTE

*--- Restore the value

	lda	data
	and	#%11111000
	ora	#%00000111	; on + ram + extra ram
	sta	data
	jsr	storeValues

	ldx	#>strRESTORE	; say we're done!
	ldy	#<strRESTORE	; if we are here
	jsr	printSTRING	; the data was saved
]lp	jmp	]lp
	
*---

strNOAS	asc	"NO APPLESQUEEZER DETECTED"00
strVERSION	asc	"CORE VERSION: "00
strPREVIOUS	asc	8D"PREVIOUS VALUE: "00
strRESTORE	asc	8D"VALUE RESTORED"
	asc	8D"REBOOT NOW"00

*---

printSTRING	sty	dpFROM
	stx	dpFROM+1
	ldy	#0
]lp	lda	(dpFROM),y
	beq	printSTRING9
	jsr	COUT
	iny
	bne	]lp
printSTRING9	rts

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
	rts

*-----------
chipSelect
	stal	FL_CS
	rts

*-----------
waitIdle
	ldal	FL_IDLE
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
	stal	FL_WRITE
	jmp	waitIdle
	
*-----------
flashRead
	jsr	waitIdle
	lda	#0
	stal	FL_READ_REQUEST
	jsr	waitIdle
	jsr	waitReadReady
	
	ldal	FL_READ
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
	and	#%00000001	; if 1, write is in progress
	cmp	#TRUE
	rts			; return TRUE if write is in progress

*-----------
writeEnabled
	jsr	readStateRegister	; WEL - write enable latch bit
	and	#%00000010	; if 1, write is enabled
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

data	ds	1
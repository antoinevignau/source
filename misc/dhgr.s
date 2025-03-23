*
* HGR & DHGR
*
* (c) 2025, Brutal Deluxe Software
*

	org	$1000
	mx	%11
	lst	off

*----------------------------------------
* Switch HGR/DHGR on/off
*----------------------------------------

*----------------------------------------
* APPLE II MEMORY MAP
*
* Main memory:
* $2000..$3FFF: PAGE1
* $4000..$5FFF: PAGE2
*
* Auxiliary memory:
* $2000..$3FFF: PAGE1X
* $4000..$5FFF: PAGE2X
*

*----------------------------------------
* APPLE II FILE FORMATS
*
* HGR picture:
* - One binary file of size $1FF8 or $2000
*
* DHGR picture:
*  - One binary file of $4000 bytes
*  - The first $2000 for the AUX mem part
*  - The second for the MAIN mem part
*
*  Programmers usually do:
*  - load the first $2000 bytes at $2000
*  - move them to $2000..$3FFF in AUX mem
*  - load the last $2000 bytes at $2000
*
*  Or, if the file is entirely in memory:
*  - move $2000..$3FFF MAIN to $2000 AUX
*  - move $4000..$5FFF MAIN to $2000 MAIN
*

*----------------------------------------
* EQUATES
*----------------------------------------

CLR80COL	=	$c000	;disable 80 column store 
SET80COL	=	$c001	;enable 80 column store 
RDMAINRAM	=	$c002	;read from main 48K RAM 
RDCARDRAM	=	$c003	;read from alt. 48K RAM 
WRMAINRAM	=	$c004	;write to main 48K RAM 
WRCARDRAM	=	$c005	;write to alt. 48K RAM 
CLR80VID	=	$c00c	;disable 80 column hardware 
SET80VID	=	$c00d	;enable 80 column hardware 

TXTCLR	=	$c050	;switch in graphics (not text) 
TXTSET	=	$c051	;switch in text (not graphics) 
MIXCLR	=	$c052	;clear mixed-mode 
MIXSET	=	$c053	;set mixed-mode (4 lines text) 
TXTPAGE1	=	$c054	;switch in text page 1 
TXTPAGE2	=	$c055	;switch in text page 2 
LORES	=	$c056	;low-resolution graphics 
HIRES	=	$c057	;high-resolution graphics 
SETAN0	=	$c058	;Clear annunciator 0
CLRAN0	=	$c059	;Set annunciator 0
SETAN1	=	$c05a	;Clear annunciator 1
CLRAN1	=	$c05b	;Set annunciator 1
SETAN2	=	$c05c	;Clear annunciator 2
CLRAN2	=	$c05d	;Set annunciator 2
SETAN3	=	$c05e	;Clear annunciator 3
CLRAN3	=	$c05f	;Set annunciator 3

AUXMOVE	=	$c311	;80-col firmware move from/to AUX/MAIN RAM
MOVE	=	$fe2c	;Firmware - Move RAM

*----------------------------------------
* SET HGR ON
*----------------------------------------

setHGR	lda	TXTCLR
	lda	MIXCLR
	lda	TXTPAGE1
	lda	HIRES
	rts
	
*----------------------------------------
* SET HGR OFF
*----------------------------------------

unsetHGR	lda	LORES
	lda	TXTPAGE1
	lda	MIXSET
	lda	TXTSET
	rts

*----------------------------------------
* MOVE PICTURE INTO MEMORY
*----------------------------------------

movePICTURE	lda	#$00	; move $2000..$3fff MAIN
	sta	$3C	;   to $2000..$3fff AUX
	lda	#$20
	sta	$3D
	lda	#$FF
	sta	$3E
	lda	#$3F
	sta	$3F
	lda	#$00
	sta	$42
	lda	#$20
	sta	$43
	sec		; move from MAIN to AUX
	jsr	AUXMOVE

	lda	#$00	; move $4000..$5fff MAIN
	sta	$3C	;   to $2000..$3fff MAIN
	lda	#$40
	sta	$3D
	lda	#$FF
	sta	$3E
	lda	#$5F
	sta	$3F
	lda	#$00
	sta	$42
	lda	#$20
	sta	$43
	ldy	#$00
	jsr	MOVE
	rts
	
*----------------------------------------
* SET DHGR COLOR ON
*----------------------------------------

setDHGRCOLOR	sta	SET80COL
	sta	SET80VID
	sta	TXTCLR
	sta	MIXCLR
	sta	TXTPAGE1
	sta	HIRES
	sta	SETAN3
	rts
	
*----------------------------------------
* SET DHGR MONOCHROME ON
*----------------------------------------

setDHGRMONO	lda	TXTCLR
	lda	MIXCLR
	lda	TXTPAGE1
	lda	HIRES
	ldx	#2
]lp	sta	SET80COL
	sta	CLRAN2
	sta	CLR80VID
	sta	SETAN3
	sta	CLRAN3
	sta	SET80VID
	sta	SETAN3
	dex
	bne	]lp
	rts
	
*----------------------------------------
* SET DHGR COLOR/MONOCHROME OFF
*----------------------------------------

unsetDHGRMONO	sta	CLRAN3
unsetDHGRCOLOR	sta	LORES
	sta	TXTPAGE1
	sta	MIXSET
	sta	TXTSET
	sta	CLR80VID
	sta	CLR80COL
	rts

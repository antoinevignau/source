*
* AppleSqueezer in 16-bit assembly
*
* (c) 2022, Niek van Suchtelen
* (a) 2022, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	$B9	; CDA
	dsk	ascda.l
	lst	off

*----------------------------
* EQUATES
*----------------------------

verMAX	=	"1"
verMIN	=	"0"

*----------
* FIRMWARE
*----------

KBD      =     $c000      ; read a key
CLR80VID =     $c00c      ; switch to 40-col mode
SET80VID =     $c00d      ; switch to 80-col mode
CLRALTCHAR =   $c00e      ; alt char off
SETALTCHAR =   $c00f      ; alt char on
KBDSTROBE =    $c010      ; reset the keyboard
RD80COL  =     $c018      ; bit 7=1 if 80-col mode
BTN0     =     $c061      ; bit 7=1 if button 0 pressed

*----------
* TEXT
*----------

ptrSCREEN	=	$000400

fgNORMAL =     $FFFF      ; normal character display
fgINVERSE =    $3F3F      ; inverse character display

mask3F   =     %00111111  ; $3F
mask7F   =     %01111111  ; $7f
mask80   =     %10000000  ; $80

chrLARROW =    $88        ; all
chrDARROW =    $8a        ; codes
chrUARROW =    $8b        ; of
chrRETURN =    $8d        ; the
chrRARROW =    $95        ; authorized
chrESCAPE =    $9b        ; keys
chrSPACE =     " "        ; space
chrCHECK =     'D'        ; the check mark

*----------------------------
*
* CODE - CDA HEADER
*
*----------------------------

entryCDA	str	'AppleSqueezer GS'
	adrl	ptrOPEN	; call the open routine
	adrl	ptrCLOSE	; call (do nothing) on the close routine

*----------------------------

ptrOPEN	phb	; save the bank
	phk	; our bank please
	plb

	jsr	doCODE	; do the code

	plb	; restore the bank
ptrCLOSE	rtl	; and return

*----------------------------
*
* CODE - THE CDA CODE
*
*----------------------------

doCODE	php
	sei

	sep	#$20	; switch to native 8-bit mode
	stal	CLR80VID	; we want 40-col, please
	stal	SETALTCHAR	; w/alternate character set
	rep	#$20

	jsr	drawFRAME	; show the frame window
	
	ldal	BTN0-1	; we enter the CDA
	bmi	doCODE1	; if open-apple is pressed

*	jsr	isAppleSqueezer	; is AS present?
*	beq	doCODE1	; yes, we have one

	jmp	doNOCARD	; we don't have one, go purchase one!

doCODE1	bit	loadValues	; we get the parms on entry

debug	lda	#%00000000_00000011
	sta	data
	
	jsr	getVALUES	; transform from data
	jsr	doMAIN	; go to the main menu
	jsr	setVALUES	; move back to data
	bit	storeValues	; we set the parms on exit

doQUIT	plp
	rts		; and return

*----------------------------
* CODE - TEXT SUB-ROUTINES
*----------------------------

doMAIN	lda	#fgNORMAL
	sta	INVFLG

	jsr	showALLSTR	; print all menus
	jsr	showALLED	; print all enabled/disabled states
	jmp	readKEY

*-----------
* Enable / Disable a value
*
* Input:
*  A: menu index to change state

changeSTATE	asl		; menu 
	tax
	lda	valACCEL,x
	eor	#1	; on/off
	sta	valACCEL,x
	jsr	(ptrSHOW,x)
	rts

ptrSHOW	da	showACCEL,showBIRAM,showEXRAM

*-----------
* Transform data into 0/1 values

getVALUES	lda	data
	tax
	and	#%00000000_00000001
	sta	valACCEL
	
	txa
	and	#%00000000_00000010
	lsr
	sta	valBIRAM
	
	txa
	and	#%00000000_00000100
	lsr
	lsr
	sta	valEXRAM
	rts

*-----------
* Pack values into data

setVALUES	lda	valACCEL
	sta	data

	lda	valBIRAM
	asl
	ora	data
	sta	data
	
	lda	valEXRAM
	asl
	asl
	ora	data
	sta	data
	rts

*-----------
* Show all Strings

showSACCEL	lda	#strACCEL	; show acceleration string
	ldx	#4
	ldy	#5
	jmp	printSTR
	
showSBIRAM	lda	#strBIRAM	; show built-in ram string
	ldx	#4
	ldy	#6
	jmp	printSTR
	
showALLSTR	jsr	showSACCEL	; shows the three entries
	jsr	showSBIRAM	; goes below

showSEXRAM	lda	#strEXRAM	; show extra ram state
	ldx	#4
	ldy	#7
	jmp	printSTR
	
*-----------
* Show all Enabled/Disabled values

showACCEL	lda	valACCEL	; show acceleration state
	ldx	#18
	ldy	#5
	jmp	printED

showBIRAM	lda	valBIRAM	; show built-in ram state
	ldx	#18
	ldy	#6
	jmp	printED

showALLED	jsr	showACCEL	; show the three entries
	jsr	showBIRAM	; goes below

showEXRAM	lda	valEXRAM	; show extra ram state
	ldx	#18
	ldy	#7	; goes below

*-----------
* print Enabled/Disabled
*
* Input:
*  A: bit to test
*  X: x-coord to print
*  Y: y-coord to print

printED	jsr	TABV
	lsr		; move bit 0 in carry
	bcc	printDIS
	lda	#strENABLED	; it is 1
	jmp	printCSTR
printDIS	lda	#strDISABLED ; it is 0
	jmp	printCSTR

*----------
* TABV
*
* Input:
*  A: not used
*  X: x-coord
*  Y: y-coord
* Output:
*  A: preserved
*  X/Y: scrambled
*  dpTO: ptr to screen
*

TABV	pha
	stx	CH
	sty	CV

	tya
	asl
	tay
	lda	ptrTEXT,y
	clc
	adc	CH
	sta	patchSTR1+1
	sta	patchSTR2+1
	pla
	rts

*-----------
* print String with Tabulation
*
* Input:
*  A: string pointer
*  X: x-coord to print
*  Y: y-coord to print

printSTR	jsr	TABV	; goes below

*----------
* printCSTR
*
* Input:
*  A/X/Y: not used
*  INVFLG: normal or inverse
* Output:
*  A/X/Y: scrambled
*

printCSTR	tay		; pointer to source text
	bit	INVFLG	; shall we output
	bpl	printCINV	; in inverse mode?

	ldx	#0	; no, standard
	sep	#$20
]lp	lda	|$0000,y	; upper/lower chars
	beq	printCSTR1
patchSTR1	stal	ptrSCREEN,x
	inx
	iny
	bne	]lp
printCSTR1	rep	#$20
	rts

printCINV	ldx	#0	; yes, print in inverse
	sep	#$20
]lp	lda	|$0000,y
	beq	printCINV4
	cmp	#"a"
	bcc	printCINV2
	and	#mask7F	; mask %01111111
	hex	2c
printCINV2	and	#mask3F	; mask %00111111
patchSTR2	stal	ptrSCREEN,x	; for uppercase
	inx
	iny
	bne	]lp
printCINV4	rep	#$20
	rts

*----------
* drawFRAME
*
* Input:
*  A/X/Y: not used
* Output:
*  A/X/Y: scrambled
*

drawFRAME	ldx	#40-2	; show strings
]lp	lda	strHEADER,x
	stal	$400,x
	lda 	strHEADER+40,x
	stal	$480,x
	lda 	strHEADER+80,x
	stal	$500,x

	lda	strLINE,x
	stal	$580,x
	stal	$600,x
	stal	$680,x
	stal	$700,x
	stal	$780,x
	stal	$428,x
	stal	$4a8,x
	stal	$528,x
	stal	$5a8,x
	stal	$628,x
	stal	$6a8,x
	stal	$728,x
	stal	$7a8,x
	stal	$450,x
	stal	$4d0,x
	stal	$550,x
	stal	$5d0,x
	stal	$650,x
	stal	$6d0,x

	lda	strFOOTER,x
	stal	$750,x
	lda	strFOOTER+40,x
	stal	$7d0,x

	dex
	dex
	bpl	]lp
	rts

*----------
* readKEY
* checkUPDOWN
*
* Input:
*  A/X/Y: not used
* Output:
*  A: key pressed
*  X/Y: unchanged
*

readKEY	sep	#$20
]lp	ldal	KBD	; wait for a key
	bpl	]lp
	stal	KBDSTROBE

	cmp	#chrLARROW
	beq	readKEYOK
	cmp	#chrDARROW
	beq	readKEYOK
	cmp	#chrUARROW
	beq	readKEYOK
	cmp	#chrRETURN
	beq	readKEYOK
	cmp	#chrRARROW
	beq	readKEYOK
	cmp	#chrESCAPE
	bne	]lp
readKEYOK	rep	#$20
	rts

*----------------------------
* No card page
*----------------------------

doNOCARD	ldx	#40-2
]lp	lda	strNOAS,x	; no card detected!!!!
	stal	$5a8,x
	dex
	dex
	bpl	]lp

	jsr	readKEY	; Wait for a key
	jmp	doQUIT	; exit!!!

*----------------------------
* DATA - ALL THE DATA
*----------------------------

*----------
* STRINGS
*----------
* asc "0         1         2         3         "
* asc "0123456789012345678901234567890123456789"

strHEADER	asc	" ______________________________________ "	; line 0
	asc	'Z'				; line 1
	asc	" AppleSqueezer "
	asc	'                       _'
	asc	'ZLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL_'	; line 2

strLINE	asc	'Z'				; all other lines
	asc	"                                      "
	asc	'_'

strFOOTER asc  'Z'					; line 22
         asc   " Select: "
         asc   'H'
         asc   " "
         asc   'U'
         asc   " "
         asc   'J'
         asc   " "
         asc   'K'
         asc   "  Cancel:Esc  Open: "
         asc   'M'
         asc   " "
         asc   '_'
         asc   " "					; line 23
         asc   'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'
         asc   " "

strNOAS	asc	'Z'
	asc	"      No AppleSqueezer detected!      "
	asc	'_'

*--- Strings

strACCEL	asc	"Acceleration:"00
strBIRAM	asc	"Built-in RAM:"00
strEXRAM	asc	"Extra RAM   :"00

strENABLED	asc	"Enabled"00
strDISABLED	asc	"Disabled"00

valACCEL	ds	2
valBIRAM	ds	2
valEXRAM	ds	2

theMENU	ds	2	; default entry is 0

*--- Coordinates
*
*strCOORDX	dfb	8,8,8
*strCOORDY	dfb	5,6,7
*
*optCOORDX	dfb	23,23,23
*optCOORDY	dfb	5,6,7
*
*----------

ptrTEXT	dw	$400,$480,$500,$580,$600,$680,$700,$780
	dw	$428,$4a8,$528,$5a8,$628,$6a8,$728,$7a8
	dw	$450,$4d0,$550,$5d0,$650,$6d0,$750,$7d0

CH	ds	2	; $00 - 2 - cursor horizontal position
CV	ds	2	; $01 - 2 - cursor vertical position
INVFLG	dw	$ffff	; $02 - 2 - 7F: inverse, FF: normal

*---------- The low-level routines

	put	as.s

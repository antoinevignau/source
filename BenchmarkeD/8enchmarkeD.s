*
* Time to read a file in 8-bits
*
* (c) 2013-2025, Brutal Deluxe Software
*
* v1.1: - take less text space to see all results on one page
*       - escape is also a key to cancel an action
*


	mx	%11
	typ	SYS
	org	$2000
	dsk	BemarkeD.System
	lst	off

	use	4/Int.Macs
	use	4/Locator.Macs
*	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Text.Macs
	use	4/Util.Macs

*-----------------------------------

Debut	=	$00
ptrPREFIX	=	$280
ptrONLINE	=	$1000
ptrBLOCK	=	$1000
ptrBUFFER	=	$3000
lenBUFFER	=	$4000
proBUFFER	=	$b800
PRODOS	=	$bf00
xTIMELO	=	$bf8e
xTIMEHI	=	$bf8f
DATELO	=	$bf90
DATEHI	=	$bf91
TIMELO	=	$bf92
TIMEHI	=	$bf93
MACHID	=	$bf98	; The machine ID calculated by ProDOS

mask128K	=	%00110000	; 01: 48K, 10: 64K, 11: 128K+
mask80COL	=	%00000010	; 0: 40-col, 1: 80-col

*---

BASIC	=	$e000

*--- Softswitches

KBD	=	$c000
CLR80VID	=	$c00c
KBDSTROBE	=	$c010
VBL	=	$c019
VERTCNT	=	$c02e
SPKR	=	$c030
CYAREG	=	$C036
TXTCLR	=	$c050
TXTSET	=	$c051
MIXCLR	=	$c052
MIXSET	=	$c053
TXTPAGE1	=	$c054
TXTPAGE2	=	$c055
LORES	=	$c056
HIRES	=	$c057

*--- The firmware routines

HGR	=	$F3E2	; HGR
HPLOT	=	$F457	; HPLOT
HILIN	=	$F53A	; HPLOT TO
HCOLOR	=	$F6E9	; HCOLOR= (call+3)
INIT	=	$FB2F
TABV	=	$FB5B
HOME	=	$FC58
WAIT	=	$FCA8
RDKEY	=	$FD0C
GETLN1	=	$FD6F
PRBYTE	=	$FDDA
COUT	=	$FDED
IDROUTINE	=	$FE1F
SETNORM	=	$FE84
SETKBD	=	$FE89

*-----------------------------------
* MACROS
*-----------------------------------

@WriteCString	mac
	ldx	#>]1
	ldy	#<]1
	jsr	printCSTRING
	<<<
	
*-----------------------------------
* THE PROGRAM
*-----------------------------------

	lda	PRODOS	; are we running
	cmp	#$4c	; under P8?
	beq	onP8
	jmp	BASIC	; nah!

onP8	jsr	PRODOS	; get the prefix
	dfb	$c7
	da	proGETPFX

	jsr	PRODOS	; set it
	dfb	$c6
	da	proGETPFX

*--- CAN WE DO lowercase?

	lda	$fbb3	; an Apple // with
	cmp	#6	; lowercase?
	beq	lowerOK	; yes

	lda	#$80	; no
	sta	fgCASE

lowerOK

*--- Clear text page

	sta	CLR80VID
	jsr	INIT	; text screen
	jsr	SETNORM	; set normal text mode
	jsr	SETKBD	; reset input to keyboard
	jsr	HOME	; home cursor and clear to end of page

*--- Can we do 80-columns?

	lda	MACHID	; an Apple // with
	and	#mask80COL	; a 80-col card?
	beq	no80col	; no

no80col	lda	#0	; tell we can
	sta	fg80COL	; do 80-col
	
	lda	#80	; width is 80-col
	sta	theWIDTH
	jsr	$c300	; turn firmware on

*-----------------------------------

mainLOOP       =         *

	lda	#0
	sta	fgCANCEL	; reset cancel flag

	jsr	HOME
	@WriteCString	#strINTRO
	jsr	translateKEY

	cmp	#"1"
	bne	noCREATE
	jmp	doFCREATE

noCREATE	cmp	#"2"
	bne	noFREAD
	jmp	doFREAD

noFREAD	cmp	#"3"
	bne	noBREAD
	jmp	doBREADtrois

noBREAD	cmp	#"D"
	bne	noDEBUG
	brk	$bd

noDEBUG	cmp	#"Q"
	beq	doQUIT
	jmp	mainLOOP

*---------- End of routine, wait for key

mainNEXT	@WriteCString	#strBYE
	jsr	translateKEY
	jmp	mainLOOP

*----------------------------
* QUIT PROGRAM
*----------------------------

doQUIT	jsr	PRODOS	; exit
	dfb	$65
	da	proQUIT

	brk	$bd	; on ne se refait pas ;-)

*----------------------------
* READ FILE SPEED
*----------------------------

doFREAD			; Read by chunks of 64KB

* 512K

	lda	#0	; 512
	jsr	readFILE

	lda	fgCANCEL
	bne	doFREAD1

* 1M

	lda	#1	; 1024
	jsr	readFILE

	lda	fgCANCEL
	bne	doFREAD1

* 2M

	lda	#2	; 2048
	jsr	readFILE

	lda	fgCANCEL
	bne	doFREAD1

* 4M

	lda	#3	; 4096
	jsr	readFILE

	lda	fgCANCEL
	bne	doFREAD1

* 8M

	lda	#4	; 8192
	jsr	readFILE

	lda	fgCANCEL
	bne	doFREAD1

* 16M

	lda	#5	; 16384
	jsr	readFILE

doFREAD1	jmp	mainNEXT

*----------

readFILE	asl
	tax

* pathname

	lda	tblPATHNAME,x
	sta	proOPEN+1
	lda	tblPATHNAME+1,x
	sta	proOPEN+2

*--- Check if file exists...

	jsr	PRODOS
	dfb	$c8
	da	proOPEN
	bcc	readFILE1
	rts

*---

readFILE1	@WriteCString	#strREAD	; file exists

	ldx	proOPEN+2
	ldy	proOPEN+1
	jsr	printPSTRING
	jsr	printDATEFROM

*----------

	lda	proOPEN+5
	sta	proREAD+1
	sta	proCLOSE+1

]lp	jsr	displayWHEEL
	jsr	checkCANCEL
	bcs	readFILE4

	jsr	PRODOS
	dfb	$ca
	da	proREAD
	bcc	]lp	; until error

	cmp	#$27	; I/O error
	bne	readFILE2

*- Fatal I/O error!!

readFILE4	jsr	readFILE3	; v1.2
	@WriteCString	#strRERR
	rts

*- Continue

readFILE2	jsr	readFILE3	; close
	jsr	printDATETO
	jmp	calcSPEED

readFILE3	jsr	PRODOS	; close
	dfb	$cc
	da	proCLOSE
	rts

*----------------------------
* FILE CREATION
*----------------------------

* Write 8 banks of 64KB
* starting on bank 2

doFCREATE	lda	#0
	sta	fgWERR	; reset flag

* 512K

	lda	#0	; 512
	jsr	createFILE

	lda	fgWERR               ; why create a file
	ora	fgCANCEL
	bne	doFCREATE9           ; when there is no room?

* 1M

	lda	#1	; 1024
	jsr	createFILE

	lda	fgWERR
	ora	fgCANCEL
	bne	doFCREATE9

* 2M

	lda	#2	; 2048
	jsr	createFILE

	lda	fgWERR
	ora	fgCANCEL
	bne	doFCREATE9

* 4M

	lda	#3	; 4096
	jsr	createFILE

	lda	fgWERR
	ora	fgCANCEL
	bne	doFCREATE9

* 8M

	lda	#4	; 8192
	jsr	createFILE

	lda	fgWERR
	ora	fgCANCEL
	bne	doFCREATE9

* 16M

	lda	#5	; 16384
	jsr	createFILE

doFCREATE9	jmp	mainNEXT

*----------

createFILE	asl
	tax

* pathname

	lda	tblPATHNAME,x
	sta	proDESTROY+1
	sta	proCREATE+1
	sta	proOPEN+1
	lda	tblPATHNAME+1,x
	sta	proDESTROY+2
	sta	proCREATE+2
	sta	proOPEN+2

* filesize in KB

	lda	tblFILESIZE,x
	sta	filesize
	lda	tblFILESIZE+1,x
	sta	filesize+1

* number of 32K blocks

	lda	tblMAXINDEX,x
	sta	maxINDEX
	lda	tblMAXINDEX+1,x
	sta	maxINDEX+1

*----------
* First, delete file
* Must not be taken into account
* in the file creation process

	jsr	PRODOS
	dfb	$c1
	da	proDESTROY

*--- Check if we can create a file

	jsr	PRODOS
	dfb	$c0
	da	proCREATE
	bcc	createFILE1
	rts		; nope, volume full probably...

*---

createFILE1	@WriteCString	#strCREATE	; yes, we can

	ldx	proOPEN+2
	ldy	proOPEN+1
	jsr	printPSTRING
	jsr	printDATEFROM

*---

	jsr	PRODOS
	dfb	$c8
	da	proOPEN
	
	lda	proOPEN+5
	sta	proWRITE+1
	sta	proCLOSE+1

	lda	#0
	sta	theINDEX
	sta	theINDEX+1

]lp	jsr	displayWHEEL
	jsr	checkCANCEL
	bcs	createFILE2

	jsr	PRODOS
	dfb	$cb
	da	proWRITE
	bcc	createFILE3

	cmp	#$48
	bne	createFILE3

*--- Special case: we encountered a volume full error
* we will close the file and delete it...

	@WriteCString	#strWERR

	lda	#1	; set the error flag
	sta	fgWERR	; for other file creations

createFILE2	jsr	PRODOS	; errrooorrrrrrrr #$48...
	dfb	$cc
	da	proCLOSE

	jsr	PRODOS
	dfb	$c1
	da	proDESTROY
	rts

*---

createFILE3	inc	theINDEX	; let's go on
	bne	createFILE4
	inc	theINDEX+1

createFILE4	lda	theINDEX+1
	cmp	maxINDEX+1	; 32*8*64 = 16M
	bcc	]lp
	lda	theINDEX
	cmp	maxINDEX
	blt	]lp

	jsr	PRODOS
	dfb	$cc
	da	proCLOSE

	jsr	printDATETO
	jmp	calcSPEED

*----------------------------
* READ BLOCK SPEED
*----------------------------

*----------------------------
* Entry point for menu 3

doBREADtrois

*----------------------------
* Common routine

doBREADgo

*--- First, get our prefix

	jsr	PRODOS	; get the prefix
	dfb	$c7
	da	proGETPFX

*--- Shift left the prefix

	ldx	#0
]lp	lda	ptrPREFIX+2,x
	sta	ptrPREFIX+1,x
	inx
	cpx	ptrPREFIX
	bcc	]lp

*--- Make it a volume name

	dec	ptrPREFIX	; remove leading '/'
	dec	ptrPREFIX	; remove trailing '/'

	ldx	#1	; find the first /
]lp	lda	ptrPREFIX,x
	cmp	#'/'
	beq	doBREAD1	; we'll get a volume name
	inx
	cpx	ptrPREFIX
	bcc	]lp

doBREAD1	stx	ptrPREFIX	; save new length

*--- Browse the list of devices and get our devnum

	jsr	PRODOS
	dfb	$c5
	da	proONLINE

	lda	#<ptrONLINE
	sta	buildVOL1+1
	sta	buildVOL4+1
	sta	buildVOL5+1

buildVOL1	lda	ptrONLINE	; compare lengths
	and	#$0f
	cmp	ptrPREFIX
	beq	buildVOL3	; same length

buildVOL2	lda	buildVOL1+1	; next volume please
	clc
	adc	#16
	sta	buildVOL1+1
	sta	buildVOL4+1
	sta	buildVOL5+1
	bcc	buildVOL1

	jmp	mainNEXT	; done and not found!

*--- Check volume name

buildVOL3	ldx	#1	; string
buildVOL4	lda	ptrONLINE,x
	and	#%1101_1111	; <= P8 v2.5a returns
	cmp	ptrPREFIX,x	; case sensitive volumes
	bne	buildVOL2	; in ON_LINE but not in
	inx		; GET_PREFIX
	cpx	ptrPREFIX
	bne	buildVOL4

*--- Here we have our volume, yeah!

buildVOL5	lda	ptrONLINE
	and	#$f0
	sta	proREADBLOCK+1	; = proWRITEBLOCK

	lda	#0
	sta	proREADBLOCK+4
	sta	proREADBLOCK+5

*--- Prepare speed calculation
*
*               lda       proVOLUME+$0a
*               lsr
*               inc
*               sta       filesize
*
*---
*
*               PushLong  proVOLUME+$0a
*               PushLong  #strNBBLOCKS
*               PushWord  #5                   ; 65536 blocks max
*               PushWord  #0
*               _Long2Dec
*
*--- Now, shome some data

	@WriteCString	#strREADUNK

*	@WriteCString	#strNBBLOCKS
*	@WriteCString	#strBLOCKS

	jsr	printDATEFROM

*---

doBREAD2	jsr	displayWHEEL
	jsr	checkCANCEL
	bcs	doBREAD9

	jsr	PRODOS
	dfb	$80
	da	proREADBLOCK

	cmp	#$27	; I/O error
	beq	doBREAD9	; the end of reading

*- Continue

doBREAD4	inc	proREADBLOCK+4
	bne	doBREAD2
	inc	proREADBLOCK+5
	bne	doBREAD2	; and loop

*- Yes, we did!

doBREAD9	@WriteCString	#strWEREAD
*	@WriteCString	#strNBBLOCKS
	lda	proREADBLOCK+5
	jsr	PRBYTE
	lda	proREADBLOCK+4
	jsr	PRBYTE
	@WriteCString	#strBLOCKS

	jsr	printDATETO
	jsr	calcSPEED
	jmp	mainNEXT

*--- Some data
*
*strNBBLOCKS	ds	10	; 8+2 trailer 00
*
*----------------------------
* SOME MISC ROUTINES
*----------------------------

checkCANCEL	lda	KBD	; Did user cancel?
	bpl	check2	; no
	sta	KBDSTROBE

	cmp	#$83	; CTRL-C
	beq	check1
	cmp	#$9b	; escape
	bne	check2

check1	@WriteCString	#strCANCEL	; we cancel

	inc	fgCANCEL
	sec
	rts
check2	clc		; we continue
	rts

*----------------------------

displayWHEEL	inc	indexWHEEL	; Show there's something...
	lda	indexWHEEL
	and	#%0000_0011
	tax
	lda	strWHEEL,x
	sta	$426	; last char of text line 0
	rts

indexWHEEL	dfb	$ff
strWHEEL	asc	"|/-\"

*----------------------------

printCSTRING	sty	pcs1+1
	stx	pcs1+2
	
pcs1	lda	$ffff
	beq	pcs3
	
	bit	fgCASE	; can we do lowercase?
	bpl	pcs2	; yes
	tax		; from lower to upper
	lda	tblKEY,x
	
pcs2	jsr	COUT
	
	inc	pcs1+1
	bne	pcs1
	inc	pcs1+2
	bne	pcs1
	
pcs3	rts

*--------

fgCASE	ds	1	; $00 lower OK, $80 otherwise
theWIDTH	dfb	40	; nb columns
theLENGTH	ds	1	; string length
fg80COL	dfb	$80	; we cannot do 80-col by default

*----------------------------

printPSTRING	sty	pps1+1
	stx	pps1+2

	jsr	pps1
	sta	theLENGTH

]lp	jsr	pps1
	bit	fgCASE	; can we do lowercase?
	bpl	pps2	; yes
	tax		; from lower to upper
	lda	tblKEY,x
	
pps2	jsr	COUT

	dec	theLENGTH
	bne	]lp
	rts

*--- Read a byte

pps1	lda	$ffff

	inc	pps1+1
	bne	pps3
	inc	pps1+2
pps3	rts

*----------------------------

printDATEFROM	@WriteCString	#strFROM

	jsr	PRODOS
	dfb	$82
	da	$0000	; no param list

	jsr	printASCIITIME

	lda	DATELO
	sta	hextime1
	lda	DATEHI
	sta	hextime1+1
	lda	TIMELO
	sta	hextime1+2
	lda	TIMEHI
	sta	hextime1+3
	lda	xTIMELO
	sta	hextime1+4
	lda	xTIMEHI
	sta	hextime1+5
	rts

*----------------------------

printDATETO	@WriteCString	#strTO

	jsr	PRODOS
	dfb	$82
	da	$0000	; no param list

	jsr	printASCIITIME

	lda	DATELO
	sta	hextime2
	lda	DATEHI
	sta	hextime2+1
	lda	TIMELO
	sta	hextime2+2
	lda	TIMEHI
	sta	hextime2+3
	lda	xTIMELO
	sta	hextime2+4
	lda	xTIMEHI
	sta	hextime2+5
	rts

*-----------------------------------
* translateKEY (lower -> upper)
*-----------------------------------

translateKEY	jsr	RDKEY
	tax
	lda	tblKEY,x
	rts

tblKEY	hex	00,01,02,03,04,05,06,07,08,09,0A,0B,0C,0D,0E,0F
	hex	10,11,12,13,14,15,16,17,18,19,1A,1B,1C,1D,1E,1F
	hex	20,21,22,23,24,25,26,27,28,29,2A,2B,2C,2D,2E,2F
	hex	30,31,32,33,34,35,36,37,38,39,3A,3B,3C,3D,3E,3F
	hex	40,41,42,43,44,45,46,47,48,49,4A,4B,4C,4D,4E,4F
	hex	50,51,52,53,54,55,56,57,58,59,5A,5B,5C,5D,5E,5F
	hex	60,61,62,63,64,65,66,67,68,69,6A,6B,6C,6D,6E,6F
	hex	70,71,72,73,74,75,76,77,78,79,7A,7B,7C,7D,7E,7F
	hex	80,81,82,83,84,85,86,87,88,89,8A,8B,8C,8D,8E,8F
	hex	90,91,92,93,94,95,96,97,98,99,9A,9B,9C,9D,9E,9F
	hex	A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,AA,AB,AC,AD,AE,AF
	hex	B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,BD,BE,BF
	hex	C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,CA,CB,CC,CD,CE,CF
	hex	D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,DA,DB,DC,DD,DE,DF
	hex	E0,C1,C2,C3,C4,C5,C6,C7,C8,C9,CA,CB,CC,CD,CE,CF
	hex	D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,DA,FB,FC,FD,FE,FF

*--------------------------------------
* printASCIITIME
*
* Affiche le temps de ProDOS en ASCII
*--------------------------------------

printASCIITIME	lda	DATELO	; dd
	and	#%00011111	; bits 4-0
	jsr	getDECIMAL
	jsr	PRBYTE
	lda	#"/"
	jsr	COUT

	lda	DATEHI	; mm
	lsr		; bits 5-8
	lda	DATELO
	rol
	rol
	rol
	rol
	and	#%00001111
	jsr	getDECIMAL
	jsr	PRBYTE
	lda	#"/"
	jsr	COUT

	lda	DATEHI	; yy
	lsr		; bits 7-1
	and	#%01111111
*	clc
*	adc	#$64
	jsr	getDECIMAL
	jsr	PRBYTE
	lda	#" "
	jsr	COUT

	lda	TIMEHI	; hh
	and	#%00011111
	jsr	getDECIMAL
	jsr	PRBYTE
	lda	#":"
	jsr	COUT

	lda	TIMELO	; mm
	and	#%00111111
	jsr	getDECIMAL
	jsr	PRBYTE
	lda	#":"
	jsr	COUT

	lda	xTIMEHI	; ss
	lsr
	lsr
	and	#%00111111
	jsr	getDECIMAL
	jmp	PRBYTE

*--------------------------------------
* getDECIMAL
*
* Transforme une valeur hexa en dec
* A: nombre en hex en entrée
*--------------------------------------

getDECIMAL
	ldx	#0	; valeur de sortie
	stx	valDEC+1
]lp	stx	valDEC

	cmp	#100	; <100 ?
	bcc	getDECIMAL1
	inc	valDEC+1
	sec
	sbc	#100
	
getDECIMAL1	cmp	#10	; <10 ?
	bcc	getDECIMAL2	; on sort
	sec		; on enlève 10
	sbc	#10
	tay		; sauve
	txa
	clc
	adc	#$10	; on ajoute #$10
	tax
	tya		; restaure
	jmp	]lp

getDECIMAL2	clc		; on ajoute le reste < 10
	adc	valDEC
	sta	valDEC
	rts		; et on retourne la valeur

*--- Data

valDEC	ds	2	; on se limite à 0-255

*----------------------------

calcSPEED

* TO DO
	rts

               pha
               pha
               PushWord  #1                   ; from readtimehex to seconds
               PushLong  #0                   ; ignore
               PushLong  #hextime1
               _ConvSeconds
               PullLong  seconds1

               pha
               pha
               PushWord  #1                   ; from readtimehex to seconds
               PushLong  #0                   ; ignore
               PushLong  #hextime2
               _ConvSeconds
               PullLong  seconds2

* Now, get the time in seconds
               lda       seconds2             ; take low word only
               sec
               sbc       seconds1
               sta       seconds

* Operation in seconds, now
* calculate the speed
* filesize / speed = nb bytes per second

	pha
	pha
	pha
	pha
	PushLong  filesize
	PushLong  seconds
	_LongDivide
	PullLong  kbs                  ; quotient
	pla                            ; remainder
	pla

	lda	#'0'	; clear string
	sta	strCALCKBS
	sta	strCALCKBS+1
	sta	strCALCKBS+2
	sta	strCALCKBS+3
			; let a trailing x00
               PushWord  kbs
               PushLong  #strCALCKBS
               PushWord  #4
               PushWord  #0
               _Int2Dec

*----------

	@WriteCString	#strSPEED	; params set above

	@WriteCString	#strCALCKBS	; params set above

	@WriteCString	#strKBS	; params set above
	rts

*----------------------------
* DATA
*----------------------------

*	asc	"1234567890123456789012345678901234567890"

strINTRO	asc	"BenchmarkeD 8-bits v1.2"0d
	asc	"(c) 2025, Brutal Deluxe Software"0d0d
	asc	"File options"0d
	asc	" 1- Write speed"0d
	asc	" 2- Read speed"0d
	asc	"Block options"0d
	asc	" 3- Read block-by-block"0d
	asc	0d
	asc	"Input your choice (Q to quit) >"00

strBYE	asc	0d0d"Thank you. Press a key to continue..."00

strREAD	asc	0d0d"Now reading... "00
strREADUNK	asc	0d0d"Now reading an unknown block count"00
strWEREAD	asc	0d"The block count was $"00
strCREATE	asc	0d0d"Now creating... "00
strRERR	asc	0d"=== Read failed! ==="00
strWERR	asc	0d"=== Write failed! ==="00
strCANCEL	asc	0d"=== Cancelled! ==="00

*	asc	"1234567890123456789012345678901234567890"

strFROM	asc	", started at "00
strTO	asc	0d"Ended at "00
strSPEED	asc	", for an average speed of "00
strKBS	asc	" KB/s"00
strBLOCKS	asc	" blocks"00

*----------

tblPATHNAME	da	pathname1,pathname2,pathname3
	da	pathname4,pathname5,pathname6
tblFILESIZE	dw	512,1024,2048,4096,8192,16384
tblMAXINDEX	dw	16,32,64,128,256,512

pathname1	str	"File512K"
pathname2	str	"File1M"
pathname3	str	"File2M"
pathname4	str	"File4M"
pathname5	str	"File8M"
pathname6	str	"File16M"

fgWERR	ds	1
fgCANCEL	ds	1

*----------

proQUIT	dfb	$4
	ds	1
	ds	2
	ds	1
	ds	2	

proREADBLOCK	dfb	$3
	ds	1	; +1 unit_num
	da	ptrBLOCK	; +2 data_buffer
	ds	2	; +4 block_num

proWRITEBLOCK	dfb	$3
	ds	1	; +1 unit_num
	da	ptrBLOCK	; +2 data_buffer
	ds	2	; +4 block_num

proDESTROY	dfb	$1
	da	pathname1

proCREATE	dfb	$7
	da	pathname1
	dfb	$e3	; access
	dfb	$06	; file_type (bin)
	dw	$bdbd	; aux_type
	ds	1	; storage_type
	ds	2	; create_date
	ds	2	; create_time
	
proONLINE	dfb	$2
	dfb	$0
	da	ptrONLINE

proGETPFX
proSETPFX
	dfb	$1
	da	ptrPREFIX

proOPEN	dfb	$3
	da	pathname1	; pathname (par défaut, le moteur)
	da	proBUFFER	; io_buffer
	ds	1	; ref_num

proREAD
proWRITE
	dfb	$4
	ds	1	; ref_num
	da	ptrBUFFER	; data_buffer
	dw	lenBUFFER	; request_count
	ds	2	; transfer_count

proCLOSE	dfb	$1
	ds	1	; ref_num

*----------

hextime1	ds	6
hextime2	ds	6

seconds1	ds	4
seconds2	ds	4
seconds	ds	4

kbs	ds	4
strCALCKBS	ds	8

*----------

theINDEX	ds	2
maxINDEX	ds	2
filesize	ds	2	; in KB

*----------

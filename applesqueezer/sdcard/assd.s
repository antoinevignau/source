*
* Applesqueezer SD Card Reader
* A proof-of-concept app
*
* (c) 2024, Brutal Deluxe Software
* Visit brutaldeluxe.fr
*

	xc
	xc
	mx	%00

	rel
	dsk	assd.l
	lst	off

	use	AS.EQUATES.S
	
*----------

	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Text.Macs
	use	4/Util.Macs

Debut	=	$00
GSOS	=	$e100a8

*----------

	phk
	plb

	tdc
	sta       myDP

	_TLStartUp
	pha
	_MMStartUp
	pla
	sta       appID
	ora       #$0100
	sta       myID

	_MTStartUp
	_TextStartUp
	_IMStartUp

	pha
	pha
	PushLong	#$010000
	PushWord	myID
	PushWord	#%11000000_00011100
	PushLong	#0
	_NewHandle
	phd
	tsc
	tcd
	lda	[3]
	sta	ptrBUFFER
	ldy	#2
	lda	[3],y
	sta	ptrBUFFER+2
	pld
	ply
	sty	haBUFFER
	plx
	stx	haBUFFER+2

*---

	PushWord	#$00FF
	PushWord	#$0080
	_SetInGlobals
	PushWord	#$00FF
	PushWord	#$0080
	_SetOutGlobals
	PushWord	#$00FF
	PushWord	#$0080
	_SetErrGlobals

	PushWord	#0
	PushLong	#3
	_SetInputDevice
	PushWord	#0
	PushLong	#3
	_SetOutputDevice
	PushWord	#0
	PushLong	#3
	_SetErrorDevice

	PushWord	#0
	_InitTextDev
	PushWord	#1
	_InitTextDev
	PushWord	#2
	_InitTextDev

	PushWord	#$0c                 ; home
	_WriteChar

*----------------------------
* DEBUG
*----------------------------

	lda	#buff
	stal	$300
	lda	#^buff
	stal	$302

*----------------------------
* MAIN MENU
*----------------------------

mainMENU	PushLong	#strMAINMENU
	_WriteCString

	jsr	waitFORKEY
	cmp	#"Q"
	beq	doQUIT
	cmp	#"q"
	beq	doQUIT
	cmp	#"1"
	bne	mainMENU

	jmp	searchMENU

*--- Data

strMAINMENU	asc	0d'Applesqueezer SD'0d
	asc	'(c) 2024, Brutal Deluxe Software'0d
	asc	' 1. Search for a SD card'0d
	asc	' Q. Quit'0d00

*----------------------------
* QUIT PROGRAM
*----------------------------

doQUIT	_IMShutDown
	_TextShutDown
	_MTShutDown

	PushWord	myID
	_DisposeAll

	PushWord	appID
	_MMShutDown

	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

	brk	$bd

*----------------------------
* SEARCH MENU
*----------------------------

searchMENU	PushLong	#strSEARCHAS
	_WriteCString

	jsr	searchAS
	bcs	smNOTFOUND

	PushLong	#strFOUND
	_WriteCString

	PushLong	#strSEARCHSD
	_WriteCString

	jsr	searchSD
	bcs	smNOTFOUND

	PushLong	#strFOUND
	_WriteCString
	bra	deviceMENU

smNOTFOUND	PushLong	#strNOTFOUND
	_WriteCString
	jsr	waitFORKEY
	jmp	mainMENU

*--- Data

strSEARCHAS	asc	0d'Searching for an Applesqueezer...'00
strSEARCHSD	asc	0d'Searching for a SD card...'00
strFOUND	asc	'Found.'00
strNOTFOUND	asc	'Not found. '00

*----------------------------
* DEVICE MENU
*----------------------------

deviceMENU	PushLong	#strDEVICEMENU
	_WriteCString

*---

]lp	jsr	waitFORKEY	; is it 0-9
	cmp	#"0"
	bcc	]lp
	bne	deviceMENU2
	jmp	mainMENU	; or even 0 to exit
deviceMENU2	cmp	#"4"+1
	bcs	]lp

	sec                            ; call the routines
	sbc	#"1"
	asl
	tax
	lda	ptrCOMMANDS,x
	sta	deviceMENU3+1
deviceMENU3	jsr	$bdbd
	jmp	deviceMENU

ptrCOMMANDS	da	doMOUNT	; 1
	da	doREADDIR	; 2
	da	doREADFILE	; 3
	da	doWRITEFILE	; 4

*--- Data

strDEVICEMENU	asc	0d'SD card menu'0d
	asc	' 1. Mount volume'0d
	asc	' 2. Read directory'0d
	asc	' 3. Read file'0d
	asc	' 4. Write file'0d
	asc	' 0. Main menu'0d00

*----------------
* APPLESQUEEZER
*----------------

searchAS	ldal	FL_IDLE
	and	#$ff
	cmp	#$01
	bne	noAS	; no AS found

	ldal	FL_VERSION
	and	#$ff
	cmp	#minVERSION
	bcc	noAS	; no minimum version

	clc		; we have an AS
	rts
noAS	sec		; no AS found
	rts

*----------------

searchSD	ldal	SD_CARD_INSERTED
	and	#$ff
	cmp	#1
	bne	noSD

	clc		; SD card found
	rts
noSD	sec		; no SD card found
	rts
	
*----------------
* COMMANDS
*----------------

doMOUNT	PushLong	#strVOLUME
	_WriteCString
	
	jsr	pf_mount
	bcc	dom_1
	pha
	PushLong	#strERROR
	_WriteCString
	pla
	jsr	showWORD
	
	jmp	waitFORKEY
	
dom_1	lda	#43	; BS_VolLab
	ldx	#11	; length is 11
	jsr	showTEXT
	jmp	waitFORKEY

*--- Data

strVOLUME	asc	0d'Volume name: '00
strERROR	asc	'Error $'0d00

*----------------

doREADDIR

*----------------

doREADFILE

*----------------

doWRITEFILE
	rts
	

*----------------------------
* PETIT FAT AND FRIENDS
*----------------------------

	put	diskio.s
	put	pff.s

*----------------------------
* TEXT ROUTINES
*----------------------------

*---------- Display in string offset
* A: offset in
* X: nb of chars to print
* offset from commandBUFF

showTEXT	pea	#^buff
	clc
	adc	#buff
	pha
	pea	$0000
	phx
	_TextWriteBlock
	rts

*---------- Display decimal
* A: word

showDECIMAL       and       #$ff
                  pha

                  lda       #'  '                ; space by default
                  sta       strDECIMAL

                  PushLong  #strDECIMAL
                  PushWord  #2
                  PushWord  #0
                  _Int2Dec

                  PushLong  #strDECIMAL
                  _WriteCString
                  rts

*--- Data

strDECIMAL        asc       '00'00

*---------- Display bits
* A: word
* X: nb of bits to display (1-8)

showBITS          cpx       #16
                  bcc       showBITS0
                  rts

showBITS0         ldy       #0                   ; index
]lp               pha
                  asl                            ; bit in carry
                  bcs       showBITS1

                  lda       #'00'                ; output 0
                  bra       showBITS2
showBITS1         lda       #'11'                ; output 1
showBITS2         sta       strBITS,y

                  pla
                  asl
                  iny
                  dex
                  bne       ]lp

                  lda       #0                   ; end C string
                  sta       strBITS,y

                  PushLong  #strBITS             ; show the string
                  _WriteCString
                  rts

*--- Data

strBITS           ds        18                   ; 16 bits + 2 zeros

*---------- Display a byte

showBYTE          pha                            ; from a byte to a string
                  pha
                  pha                            ; <= here, really
                  _HexIt

                  lda       #'  '                ; empty string by default
                  sta       strBYTE

                  pla                            ; we don't use
                  pla
                  sta       strBYTE

                  PushLong  #strBYTEP            ; show the string
                  _WriteString
                  rts

*--- Data

strBYTEP          dfb       2                    ; for a Pascal string
strBYTE           asc       '  '

*---------- Display a word

showWORD          pha                            ; from a word to a string
                  pha
                  pha                            ; <= here, really
                  _HexIt
                  PullLong  strHEX

                  PushLong  #strHEX              ; show the string
                  _WriteCString
                  rts

*--- Data

strHEX            asc       '0000'00

*---------- Wait for a key in a range 0-Acc
* A: high key
* X: high ptr to C string
* Y: low ptr to C string

keyINRANGE        sta       keyHIGH
                  sty       strKEY
                  stx       strKEY+2

]lp               PushLong  strKEY
                  _WriteCString

                  PushWord  #0
                  PushWord  #1                   ; echo char
                  _ReadChar
                  pla
                  and       #$ff
                  cmp       #"0"
                  bcc       ]lp
                  cmp       keyHIGH
                  bcc       keyINRANGE9
                  beq       keyINRANGE9
                  bra       ]lp

keyINRANGE9       sec
                  sbc       #"0"
                  pha
                  bra       waitKEY8

*--- Data

strKEY            ds        4                    ; pointer to string
keyHIGH           ds        2

*---------- Wait for a key

waitKEY           PushWord  #$0d
                  _WriteChar

                  PushWord  #0
                  PushWord  #0                   ; don't echo char
                  _ReadChar
                  bra       waitKEY1             ; go below

*---------- Wait for a key

waitFORKEY        PushLong  #strINPUT
                  _WriteCString

                  PushWord  #0                   ; wait for key
                  PushWord  #1                   ; echo char
                  _ReadChar

waitKEY1          lda       1,s                  ; check CR
                  and       #$ff                 ; of typed
                  sta       1,s                  ; in char
                  cmp       #$8d
                  beq       waitKEY9

waitKEY8          PushWord  #$0d                 ; return
                  _WriteChar

waitKEY9          pla                            ; restore entered char
                  rts

*--- Data

strINPUT          asc       'Select an entry: '00

*----------------------------
* DATA
*----------------------------

*---

proQUIT           dw        2                    ; pcount
                  ds        4                    ; pathname
                  ds        2                    ; flags

commandBUFF       ds        1234                 ; more than 1024

*----------

appID             ds        2
myID              ds        2

myDP              ds        2
ptrBUFFER         ds        4
haBUFFER          ds        4


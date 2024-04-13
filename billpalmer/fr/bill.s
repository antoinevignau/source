*
* Bill Palmer
*
* (c) 1987, François Coulon
* (c) 2021, Brutal Deluxe
*

         lst   off
         rel
         dsk   bill.l

         mx    %00
         xc
         xc

*--------------------------------------

         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Misc.Macs
         use   4/Sound.Macs
         use   4/Util.Macs

*--------------------------------------

Debut    =     $00
Arrivee  =     $04
Second   =     $08
Third    =     $0c

proDOS   =     $e100a8

*--------------------------------------

	phk
	plb

        _TLStartUp
        pha
        _MMStartUp
        pla
        sta	myID
        _MTStartUp

*--------------------------------------

okINIT1
         PushLong #0
         PushLong #$8fffff
         PushWord myID
         PushWord #%11000000_00000000
         PushLong #0
         _NewHandle
         _DisposeHandle
         _CompactMem

*--------------------------------------

         PushLong #0
         PushLong #$10000
         PushWord myID
         PushWord #%11000000_00011100
         PushLong #0
         _NewHandle
         phd
         tsc
         tcd
         lda   [3]
         sta   ptrUNPACK
         ldy   #2
         lda   [3],y
         sta   ptrUNPACK+2
         pld
         pla
         pla
	 bcc	okINIT2
	 inc	fgMEM

okINIT2	 
         PushLong #0
         PushLong #$10000
         PushWord myID
         PushWord #%11000000_00011100
         PushLong #0
         _NewHandle
         phd
         tsc
         tcd
         lda   [3]
         sta   ptrDG
         ldy   #2
         lda   [3],y
         sta   ptrDG+2
         pld
         pla
         pla
	 bcc	okINIT3
	 inc	fgMEM

okINIT3
         PushLong #0
         PushLong #$40000
         PushWord myID
         PushWord #%11000000_00001100
         PushLong #0
         _NewHandle
         phd
         tsc
         tcd
         lda   [3]
         sta   ptrMUSIC
         ldy   #2
         lda   [3],y
         sta   ptrMUSIC+2
         pld
         pla
         pla
         bcc	okINIT4
	 inc	fgSND
	 
*--------------------------------------

okINIT4
	ldx	#0
	txa
]lp	stal	$e12000,x
	inx
	inx
	bpl	]lp

	sep	#$20
	lda	#$c1
	stal	$e0c029
	rep	#$20

*--------------------------------------

	lda	fgMEM
	bne	okINIT5

	lda	#pTITLE
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcs	okINIT5

	lda	proREAD+12
	jsr	unpackLZ4

	ldx	ptrDG+2
	ldy	ptrDG
	lda	#-1
	jsr	fadeIN

*--------------------------------------

okINIT5
	lda	fgSND
	bne	koINIT2
	
	lda	#pSAMPLE
	ldx	ptrMUSIC+2
	ldy	ptrMUSIC
	jsr	loadFILE
	bcc	okINIT6

koINIT	inc	fgSND
koINIT2	brl	initOFF

*--------------------------------------

okINIT6
	tdc
	clc
	adc	#$100
	pha
	_SoundStartUp
	bcs	okINIT7

	PushWord #1
	PushLong #pBlockPtr
	_FFStartSound
	
okINIT7
	lda	#15
	jsr	nowWAIT

	lda	fgSND
	bne	initOFF
	
	PushWord #$7fff
	_FFStopSound
	
	_SoundShutDown
	
*--------------------------------------

initOFF
	_MTShutDown

	PushWord myID
	_DisposeAll
	PushWord myID
	_MMShutDown
	_TLShutDown

	jsl	proDOS
	dw	$2029
	adrl	proQUIT

	brk	$bd

*--------------------------------------

nowWAIT  dec              ; Attend A secondes
         tax
         lda   #0
]lp      clc
         adc   #60
         cpx   #0
         beq   nowWAIT1
         dex
         bra   ]lp
nowWAIT1 pha
         jsr   waitVBL
         jsr   clickIT
         bcc   nowWAIT2
]lp      ldal  $e0c018
         bmi   ]lp
         pla
         dec
         bne   nowWAIT1
         sec
         rts
nowWAIT2 pla
         clc
         rts

*--------------------------------------

clickIT  ldal  $e0bfff
         bpl   clickIT1
	 sep   #$20
         stal  $e0c010
	 rep   #$20
         clc
         rts
clickIT1 sec
         rts

*--------------------------------------

loadFILE
	sta	proOPEN+4
	sty	proREAD+4
	stx	proREAD+6

	jsl	proDOS
	dw	$2010
	adrl	proOPEN
	bcs	loadERR

	lda	proOPEN+2
	sta	proGETEOF+2
	sta	proREAD+2
	sta	proCLOSE+2
	
	jsl	proDOS
	dw	$2019
	adrl	proGETEOF
	bcs	loadERR

	lda	proGETEOF+4
	sta	proREAD+8
	lda	proGETEOF+6
	sta	proREAD+10

	jsl	proDOS
	dw	$2012
	adrl	proREAD
	bcs	loadERR
	
	jsl	proDOS
	dw	$2014
	adrl	proCLOSE
	rts
	
loadERR
	php
	jsl	proDOS
	dw	$2014
	adrl	proCLOSE
	plp
	brk	$bc
	rts

*--------------------------------------

nextVBL  lda   #75
         pha
]lp      ldal  $e0c02e
         and   #$7f
         cmp   1,s
         blt   ]lp
         cmp   #100
         bge   ]lp
         pla
waitVBL  ldal  $e0c018
         bpl   waitVBL
         rts

*--------------------------------------

fadeIN   sty   Debut
         stx   Debut+2

         ldy   #$2000
         sty   Arrivee
         ldx   #$00e1
         stx   Arrivee+2

         cmp   #0
         beq   fadeIN1

         ldy   #$7dfe
]lp      lda   [Debut],y
         sta   [Arrivee],y
         dey
         dey
         bpl   ]lp

fadeIN1  lda   Debut
         clc
         adc   #$7e00
         sta   Debut
         lda   Debut+2
         adc   #0
         sta   Debut+2

         lda   Arrivee
         clc
         adc   #$7e00
         sta   Arrivee
         lda   Arrivee+2
         adc   #0
         sta   Arrivee+2

         ldx   #$000f
fadeIN2  ldy   #$01fe
fadeIN3  lda   [Arrivee],y
         and   #$000f
         sta   temp
         lda   [Debut],y
         and   #$000f
         cmp   temp
         beq   fadeIN4
         lda   [Arrivee],y
         clc
         adc   #$0001
         sta   [Arrivee],y
fadeIN4  lda   [Arrivee],y
         and   #$00f0
         sta   temp
         lda   [Debut],y
         and   #$00f0
         cmp   temp
         beq   fadeIN5
         lda   [Arrivee],y
         clc
         adc   #$0010
         sta   [Arrivee],y
fadeIN5  lda   [Arrivee],y
         and   #$0f00
         sta   temp
         lda   [Debut],y
         and   #$0f00
         cmp   temp
         beq   fadeIN6
         lda   [Arrivee],y
         clc
         adc   #$0100
         sta   [Arrivee],y

fadeIN6  dey
         dey
         bpl   fadeIN3
         jsr   nextVBL
         dex
         bpl   fadeIN2
         rts

*---

fadeOUT  lda   #$9e00
         sta   Debut
         lda   #$00e1
         sta   Debut+2

         ldx   #$000f
fadeOUT1 ldy   #$01fe
fadeOUT2 lda   [Debut],y
         and   #$000f
         beq   fadeOUT3
         lda   [Debut],y
         sec
         sbc   #$0001
         sta   [Debut],y
fadeOUT3 lda   [Debut],y
         and   #$00f0
         beq   fadeOUT4
         lda   [Debut],y
         sec
         sbc   #$0010
         sta   [Debut],y
fadeOUT4 lda   [Debut],y
         and   #$0f00
         beq   fadeOUT5
         lda   [Debut],y
         sec
         sbc   #$0100
         sta   [Debut],y

fadeOUT5 dey
         dey
         bpl   fadeOUT2
         jsr   nextVBL
         dex
         bpl   fadeOUT1
         rts

*----------------------------
* unpackLZ4
*  Unpacks a LZ4 file
*  Uses the two pointers:
*   - ptrUNPACK: packed img (MUST BE AT $0000)
*   - ptrDG: temp unpack zone
*
* Entry:
*  A: packed data size
*
* Exit:
*  A: unpacked data size
*
*----------------------------

unpackLZ4
	sta	LZ4_Limit+1
	
	sep	#$20
	sei
	
*--- Source

         lda   ptrUNPACK+2
         sta   LZ4_Literal_3+2
         sta   LZ4_ReadToken+3
         sta   LZ4_Match_1+3
         sta   LZ4_GetLength_1+3

*--- Destination

         lda   ptrDG+2
         sta   LZ4_Literal_3+1
         sta   LZ4_Match_5+1
         sta   LZ4_Match_5+2

         rep   #$20

* REP #$30
* STY LZ4_Limit+1

*--

         ldy   #0         ; Init Target unpacked Data offset
         ldx   #16        ; Offset after header

LZ4_ReadToken LDAL $AA0000,X ; Read Token Byte
         INX
         STA   LZ4_Match_2+1

*----------------

LZ4_Literal AND #$00F0    ; >>> Process Literal Bytes <<<
         BEQ   LZ4_Limit  ; No Literal
         CMP   #$00F0
         BNE   LZ4_Literal_1
         JSR   LZ4_GetLengthLit ; Compute Literal Length with next bytes
         BRA   LZ4_Literal_2
LZ4_Literal_1 LSR         ; Literal Length use the 4 bit
         LSR
         LSR
         LSR

LZ4_Literal_2 DEC         ; Copy A+1 Bytes
LZ4_Literal_3 MVN $AA,$BB ; Copy Literal Bytes from packed data buffer
         PHK              ; X and Y are auto incremented
         PLB

*----------------

LZ4_Limit CPX  #$AAAA     ; End Of Packed Data buffer ?
         BEQ   LZ4_End

*----------------

LZ4_Match TYA             ; >>> Process Match Bytes <<<
         SEC
LZ4_Match_1 SBCL $AA0000,X ; Match Offset
         INX
         INX
         STA   LZ4_Match_4+1

LZ4_Match_2 LDA #$0000    ; Current Token Value
         AND   #$000F
         CMP   #$000F
         BNE   LZ4_Match_3
         JSR   LZ4_GetLengthMat ; Compute Match Length with next bytes
LZ4_Match_3 CLC
         ADC   #$0003     ; Minimum Match Length is 4 (-1 for the MVN)

         PHX
LZ4_Match_4 LDX #$AAAA    ; Match Byte Offset
LZ4_Match_5 MVN $BB,$BB   ; Copy Match Bytes from unpacked data buffer
         PHK              ; X and Y are auto incremented
         PLB
         PLX
         BRA   LZ4_ReadToken

*----------------

LZ4_GetLengthLit LDA #$000F ; Compute Variable Length (Literal or Match)
LZ4_GetLengthMat STA LZ4_GetLength_2+1
LZ4_GetLength_1 LDAL $AA0000,X ; Read Length Byte
         INX
         AND   #$00FF
         CMP   #$00FF
         BNE   LZ4_GetLength_3
         CLC
LZ4_GetLength_2 ADC #$000F
         STA   LZ4_GetLength_2+1
         BRA   LZ4_GetLength_1
LZ4_GetLength_3 ADC LZ4_GetLength_2+1
         RTS

*----------------

LZ4_End	sty	lenDATA		; Y = length of unpacked data
	tya
	cli
	rts

*---

lenDATA	ds	2

*--------------------------------------
* All the data
*--------------------------------------

*--- Prodos

proQUIT  dw    2
         adrl  pPALMER
         ds    2

proOPEN  dw    2
         ds    2
         adrl  pTITLE

proGETEOF dw   2
         ds    2
         ds    4

proREAD  dw    4	; 0
         ds    2	; 2
         ds    4	; 4 dataBuffer
         ds    4	; 8 requestCount
         ds    4	; 12 transferCount

proCLOSE dw    1
         ds    2

*--- Nom des fichiers

pPALMER	strl	'1/Palmer'
pTITLE	strl	'1/Data/Title.lz4'
pSAMPLE	strl	'1/Data/Sample'

*--- Flags

temp	dw	1
fgMEM	ds	2
fgSND	ds	2

pBlockPtr
ptrMUSIC
	ds	4
	dw	$35a
	dw	312	; for 16037 Hz
	dw	$0000
	dw	$0000
	ds	4
	dw	$ff

*--- Memoire

myID	ds	2

ptrUNPACK	ds	4
ptrDG		ds	4

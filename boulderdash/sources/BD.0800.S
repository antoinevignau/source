*
* Boulderdash
*
* (c) 1984, First Star
* (s) 2022-2025, Brutal Deluxe Software
*
	
*-----------------------------

L0800	lda	$3f2
	sta	resetVECTOR
	lda	$3f3
	sta	resetVECTOR+1
	lda	$3f4
	sta	resetVECTOR+2
	
	lda	#<myRESET	; reset vector
	sta	$3f2
	lda	#>myRESET
	sta	$3f3
	jsr	SETPWRC

	ldx	#0	; save ZP
]lp	lda	$00,x
	sta	saveZP,x
	inx
	bne	]lp

	jsr	setPREFIXES
	jsr	loadSCORES

myRESET	sec
	jsr	IDROUTINE
	bcs	notIIgs

	lda	CYAREG
	sta	saveCYAREG
	and	#%0111_1111
	sta	CYAREG

notIIgs

*---

	JSR	clearHGRPAGES
	STA	TXTCLR
	STA	MIXCLR
	STA	TXTPAGE2
	STA	HIRES
	jsr	loadTITLES
	JMP	main

*---

saveCYAREG	ds	1
resetVECTOR	ds	3

*-----------------------------
* 4PLAY ROUTINES
*-----------------------------

fpDFTVALUE              =     $20                                ; dft value for Rev. B

fpUP                    =     %00000001                          ; active high
fpDOWN                  =     %00000010                          ; active high
fpLEFT                  =     %00000100                          ; active high
fpRIGHT                 =     %00001000                          ; active high
fpNOTUSED               =     %00010000
fpTRIGGER3              =     %00100000                          ; active low
fpTRIGGER2              =     %01000000                          ; active high
fpTRIGGER1              =     %10000000                          ; active high

*---

find4P	ldx	#0

FPLoopIt	txa		; previous slot
	sec
	sbc	#$10
	tax
	cpx	#$80	; until slot 0
	bne	FPLoopIt1	; see if there is a card
	rts
FPLoopIt1	lda	KBD,x	; $C0s0
	cmp	#fpDFTVALUE
	bne	FPLoopIt
	lda	KBD+1,x	; $C0s1
	cmp	#fpDFTVALUE
	bne	FPLoopIt
	lda	KBD+2,x	; $C0s2
	cmp	#fpDFTVALUE
	bne	FPLoopIt
	lda	KBD+3,x	; $C0s3
	cmp	#fpDFTVALUE
	bne	FPLoopIt	; card not found

	stx	FPDirectRead+3

*--- Read 4Play joypad for player X

FPDirectRead	ldx	curPLAYER
	lda	KBD,x	; x contains the player index
	rts
	
*-----------------------------
* PRODOS ROUTINES
*-----------------------------

*-----------------------------

doQUIT	ldx	#0	; restore ZP
]lp	lda	saveZP,x
	sta	$00,x
	inx
	bne	]lp

	sec
	jsr	IDROUTINE
	bcs	doQUIT1

	lda	saveCYAREG
	sta	CYAREG

doQUIT1	lda	resetVECTOR	; which is useless
	sta	$3f2	; because P8 QUIT
	lda	resetVECTOR+1	; redirects the vector
	sta	$3f3
	lda	resetVECTOR+2
	sta	$3f4

	jsr	PRODOS
	dfb	$65
	da	proQUIT

	brk	$bd

*-----------------------------

setPREFIXES	jsr	PRODOS	; get the prefix
	dfb	$c7
	da	proGETPFX

	jsr	PRODOS	; set it
	dfb	$c6
	da	proGETPFX
	rts

*-----------------------------

loadTITLES	jsr	PRODOS
	dfb	$c8
	da	proOPENT
	bcs	ltEND
	
	lda	proOPENT+5
	sta	proREADT+1
	sta	proCLOSE+1

	jsr	PRODOS
	dfb	$ca
	da	proREADT
	
	jsr	PRODOS
	dfb	$cc
	da	proCLOSE
ltEND	rts

*-----------------------------

loadSCORES	jsr	PRODOS
	dfb	$c8
	da	proOPENS
	bcs	lsEND
	
	lda	proOPENS+5
	sta	proREADS+1
	sta	proCLOSE+1

	jsr	PRODOS
	dfb	$ca
	da	proREADS
	
	jsr	PRODOS
	dfb	$cc
	da	proCLOSE
lsEND	rts

*-----------------------------

saveSCORES	jsr	PRODOS	; create
	dfb	$c0
	da	proCREATE
	bcc	saveSCORES1

	jsr	PRODOS	; unlock it
	dfb	$c3
	da	proSETINFO

	jsr	PRODOS	; destroy
	dfb	$c1
	da	proDESTROY

	jsr	PRODOS	; recreate
	dfb	$c0
	da	proCREATE

saveSCORES1	jsr	PRODOS	; open
	dfb	$c8
	da	proOPENS
	bcs	saveSCORES9

	lda	proOPENS+5	; move ref_num
	sta	proREADS+1	; we use READ
	sta	proCLOSE+1

	jsr	PRODOS	; write header
	dfb	$cb
	da	proREADS	; we use READ

	jsr	PRODOS	; write it
	dfb	$cc
	da	proCLOSE

saveSCORES9	rts

*--- Data

pSCORES	str	'SCORES'
pTITLES	str	'TITLES'

proQUIT	dfb	$4
	ds	1
	ds	2
	ds	1
	ds	2	

proDESTROY	dfb	$01
	da	pSCORES	; +01

proCREATE	dfb	$07
	da	pSCORES	; +01
	dfb	$e3	; +03
	dfb	fileTYPE	; +04
	dw	auxTYPE	; +05
	dfb	$01	; +07
	ds	2	; +08
	ds	2	; +0A

proSETINFO	dfb	$07
	da	pSCORES	; +01
	dfb	$e3	; +03
	dfb	fileTYPE	; +04
	dw	auxTYPE	; +05
	ds	1	; +07
	ds	2	; +08
	ds	2	; +0A
	ds	2	; +0C
	ds	2	; +0E

proGETPFX	dfb	$1
	da	ptrPREFIX

proOPENS	dfb	$3
	da	pSCORES	; pathname (par défaut, le moteur)
	da	proBUFFER	; io_buffer
	ds	1	; ref_num

proREADS	dfb	$4
	ds	1	; ref_num
	da	ptrSCORES	; data_buffer
	dw	50	; request_count
	ds	2	; transfer_count

proOPENT	dfb	$3
	da	pTITLES	; pathname (par défaut, le moteur)
	da	proBUFFER	; io_buffer
	ds	1	; ref_num

proREADT	dfb	$4
	ds	1	; ref_num
	da	ptrTITLES	; data_buffer
	dw	$4000	; request_count
	ds	2	; transfer_count

proCLOSE	dfb	$1
	ds	1	; ref_num

*-----------------------------
* GET A MOVE
*-----------------------------

getMOVE     LDA   nbPLAYER	; who's playing?
            BPL   L0862	; a real player...

            LDX   idxDEMO	; demo mode,
            LDA   demoDATA,X	; get the data
            STA   theDIR	; save movement
            LDY   theY
            INX
            STX   idxDEMO
            JMP   L087E

*--- Check the Apple joystick only

L0862	lda	fgINPUT
	cmp	#"A"
	bne	L087E
	
            LDA   #$FF	; read Apple joystick
            STA   joyX
            STA   joyY
            LDA   PTRIG
            LDA   #$05
            JSR   WAIT
            LDA   PADDL0
            BPL   L0877
            INC   joyX
L0877       LDA   PADDL1
            BPL   L087E
            INC   joyY

*--- Go on...

L087E       LDA   #$00	; no sound on line refresh
            LDX   #$0B
L0882       STA   fgSOUND,X
            DEX
            BPL   L0882

            LDA   fgENCH	; is enchanted wall on?
            CMP   #$01
            BNE   L088F
            STA   $E4
L088F       LDA   $E0
            ORA   $DF
            BEQ   L08A8

            LDX   #$05
L0897       STA   SPKR
            LDA   #$0A
            JSR   WAIT
            DEX
            BPL   L0897
	  
            STA   $DF
            STA   $E0
            BMI   L08AD
L08A8       LDA   #$1B
            JSR   WAIT

L08AD       LDX   #$04
L08AF       LDA   $E3,X
            BNE   L08B9
            DEX
            BPL   L08AF
            JMP   L0969	; get next move

L08B9       STX   theX
            LDA   L08CA,X
            STA   L08C7+1
            LDA   L08CF,X
            STA   L08C7+2
L08C7       JMP   L08C7

*-----------------------------

L08CA       DB    <L08D4,<L094B,<L092E,<L091D,<L095F
L08CF       DB    >L08D4,>L094B,>L092E,>L091D,>L095F

*-----------------------------

L08D4       LDA   rndVALUE1
*            NOP		; last minute code change :-)
            AND   #$03
            TAX
            LDA   L08E9,X
            STA   L08E6+1
            LDA   L08EF,X
            STA   L08E6+2
L08E6       JMP   L08E6

*-----------------------------

L08E9       DB    <L08F5,<L08FC,<L0905,<L0910,<L091D,<L092E
L08EF       DB    >L08F5,>L08FC,>L0905,>L0910,>L091D,>L092E

*-----------------------------

L08F5       LDA   #$FF
            STA   fgSOUND
            JMP   L095F

L08FC       LDA   #$FF
            STA   fgSOUND
            STA   fgSOUND6
            JMP   L095F

L0905       LDA   #$FF
            STA   fgSOUND
            STA   fgSOUND4
            STA   fgSOUND8
            JMP   L095F

L0910       LDA   #$FF
            STA   fgSOUND
            STA   fgSOUND3
            STA   fgSOUND6
            STA   fgSOUND9
            JMP   L095F

*-----------------------------

L091D       LDA   #$FF
            STA   fgSOUND
            STA   fgSOUND2
            STA   fgSOUND4
            STA   fgSOUND6
            STA   fgSOUND8
            STA   fgSOUND10
            JMP   L095F

*-----------------------------

L092E       LDA   #$FF
            STA   fgSOUND
            STA   fgSOUND1
            STA   fgSOUND2
            STA   fgSOUND3
            STA   fgSOUND4
            STA   fgSOUND5
            STA   fgSOUND6
            STA   fgSOUND7
            STA   fgSOUND8
            STA   fgSOUND9
            STA   fgSOUND10
            STA   fgSOUND11
            JMP   L095F

*-----------------------------

L094B       LDA   theCOUNTER
            AND   #$03
            TAX
            LDA   L08E9+2,X
            STA   L095C+1
            LDA   L08EF+2,X
            STA   L095C+2
L095C       JMP   L095C

*-----------------------------

L095F       LDA   #$00
            STA   $E3
            STA   $E5
            STA   $E6
            STA   $E4

*-----------------------------
* GET NEXT MOVE
*-----------------------------

L0969       LDA   nbPLAYER	; who's playing?
            BPL   readINPUTDEVICE ; a real player!
            LDA   theDIR	; demo
            TAX
            RTS

*-----------------------------
* READ INPUT DEVICE
*-----------------------------

keyLEFT	asc	"G"
keyRIGHT	asc	"H"
keyUP	asc	"Y"
keyDOWN	asc	"B"
keySPACE	asc	" "	; button
keyPAUSE	dfb	$9b	; ESC for a pause (or #$90 for control-P?)
keyLOSE	dfb	$9a	; ctrl-z for zap life

*-----------------------------

readINPUTDEVICE
	ldx	fgINPUT
	cpx	#"K"	; Apple keyboard?
	bne	ridAPPLE

	ldx	#moveNONE	; no movement
	ldy	#0	; no button pressed

	lda	KBD	; ...yes
	bpl	kbdDONE
	sta	KBDSTROBE
	
	cmp	#"a"	; convert a-z to A-Z
	bcc	kbdGOOD
	cmp	#"z"+1
	bcs	kbdGOOD
	sbc	#$1f

kbdGOOD	cmp	keySPACE
	bne	kbdNOBTN
	dey		; button pressed
kbdNOBTN	ldx	#moveUP
	cmp	keyUP
	beq	kbdDONE
	ldx	#moveDOWN
	cmp	keyDOWN
	beq	kbdDONE
	ldx	#moveLEFT
	cmp	keyLEFT
	beq	kbdDONE
	ldx	#moveRIGHT
	cmp	keyRIGHT
	beq	kbdDONE
	ldx	#moveNONE
kbdDONE	txa
	sta	theDIR	; direction taken
	sty	joyBTN	; button value
	ldy	theY
	rts

*---

ridAPPLE	cpx	#"A"	; Apple joystick?
	bne	ridATARI

            LDA   PADDL0	; ...yes
            BPL   L0978
            INC   joyX
L0978       LDA   PADDL1
            BPL   L097F
            INC   joyY
L097F       LDA   $E2
            BEQ   L0993
            LDX   #$01
L0985       TXA
L0986       STA   SPKR
            JSR   WAIT
            INX
            CPX   #$1B
            BNE   L0985
            STA   $E2

L0993       LDA   joyX	; check left/right
            BEQ   L09A1
            BPL   L099D
            LDA   #moveLEFT
            BNE   L09AF
L099D       LDA   #moveRIGHT
            BNE   L09AF

L09A1       LDA   joyY	; check up/down
            BEQ   L09AF
            BPL   L09AB
            LDA   #moveUP
            BNE   L09AF
L09AB       LDA   #moveDOWN
            BNE   L09AF

L09AF       STA   theDIR	; save the new direction
            TAX
            LDA   BUTN0
            STA   joyBTN
            LDY   theY	; Apple joystick
            TXA
            RTS

*---

ridATARI	cpx	#"J"	; Atari joystick?
	bne	rid4PLAY
 
L09C0       LDA   SETAN0	; ...yes
            LDA   curPLAYER
            BEQ   L09CA
            LDA   CLRAN0
L09CA       LDA   BUTN0
            BMI   L09D3
            LDA   #$FF
            BNE   L09D5
L09D3       LDA   #$00
L09D5       STA   joyBTN

            LDA   SETAN1
            LDX   #moveLEFT
            LDA   BUTN1
            BPL   L09F8
            INX		; move right

            LDA   BUTN2
            BPL   L09F8
            INX		; move up
            LDA   CLRAN1
            LDA   BUTN1
            BPL   L09F8
            INX		; move down
            LDA   BUTN2
            BPL   L09F8
            LDX   #moveNONE	; move none
L09F8       LDY   theY
            TXA
            STA   theDIR
            RTS

*---

rid4PLAY	cpx	#"4"
	bne	ridNONE

	jsr	FPDirectRead
	and	#fpUP+fpDOWN+fpLEFT+fpRIGHT
	tax
	and	#fpUP
	bne	rid4PLAYOK
	txa
	and	#fpDOWN
	bne	rid4PLAYOK
	txa
	and	#fpLEFT
	bne	rid4PLAYOK
	txa
	and	#fpRIGHT
rid4PLAYOK	sta	theDIR
	ldy	theY
	rts

ridNONE	ldx  	#moveNONE	; no input device recognized
	txa
	sta	theDIR
	sta	joyBTN
	ldy	theY
	rts


*-----------------------------
* CLEAR HGR PAGES
*-----------------------------

clearHGRPAGES
            LDA   #$00
            TAY
L0A01       STA   $2000,Y
            STA   $2100,Y
            STA   $2200,Y
            STA   $2300,Y
            STA   $2400,Y
            STA   $2500,Y
            STA   $2600,Y
            STA   $2700,Y
            STA   $2800,Y
            STA   $2900,Y
            STA   $2A00,Y
            STA   $2B00,Y
            STA   $2C00,Y
            STA   $2D00,Y
            STA   $2E00,Y
            STA   $2F00,Y
            STA   $3000,Y
            STA   $3100,Y
            STA   $3200,Y
            STA   $3300,Y
            STA   $3400,Y
            STA   $3500,Y
            STA   $3600,Y
            STA   $3700,Y
            STA   $3800,Y
            STA   $3900,Y
            STA   $3A00,Y
            STA   $3B00,Y
            STA   $3C00,Y
            STA   $3D00,Y
            STA   $3E00,Y
            STA   $3F00,Y
            DEY
            BNE   L0A01
            STA   TXTPAGE1
L0A67       STA   $4000,Y
            STA   $4100,Y
            STA   $4200,Y
            STA   $4300,Y
            STA   $4400,Y
            STA   $4500,Y
            STA   $4600,Y
            STA   $4700,Y
            STA   $4800,Y
            STA   $4900,Y
            STA   $4A00,Y
            STA   $4B00,Y
            STA   $4C00,Y
            STA   $4D00,Y
            STA   $4E00,Y
            STA   $4F00,Y
            STA   $5000,Y
            STA   $5100,Y
            STA   $5200,Y
            STA   $5300,Y
            STA   $5400,Y
            STA   $5500,Y
            STA   $5600,Y
            STA   $5700,Y
            STA   $5800,Y
            STA   $5900,Y
            STA   $5A00,Y
            STA   $5B00,Y
            STA   $5C00,Y
            STA   $5D00,Y
            STA   $5E00,Y
            STA   $5F00,Y
            DEY
            BNE   L0A67
            RTS

*-----------------------------
* 
*-----------------------------

L0ACB       LDA   #<tblFORE
            STA   ptrROW1
            CLC
            ADC   #WIDTH
            STA   ptrROW2
            ADC   #WIDTH
            STA   ptrROW3
            LDA   #>tblFORE
            STA   ptrROW1+1
            STA   ptrROW2+1
            STA   ptrROW3+1
            LDA   #$00
            STA   $0D
            STA   $34
            STA   $36
            DEC   diffCOUNTER
            BNE   L0B22
            LDA   diffCOUNTER2
            STA   diffCOUNTER
            LDA   fgENCH
            BEQ   L0AFC
            DEC   enchCOUNTER
            BNE   L0AFC
            LDA   #$FF
            STA   fgENCH
L0AFC       DEC   theTIME	; do we run out of time?
            BNE   L0B22	; no
            LDA   #$10	; yes... draw time out
            STA   theACTION
            JSR   clearZPROWS
L0B07       JSR   animSPRITES
            JSR   drawBOARD
            JSR   checkBUTTON	; read button
            LDA   #$90
            JSR   WAIT
            LDA   joyBTN
            BPL   L0B07
            LDA   #$01	; we are out of time
            STA   $08
            PLA
            PLA
            JMP   loseLIFE

*-----------------------------
* CHECK ROWS FOR ACTIONS
*-----------------------------

L0B22       LDY   #$00
            INC   $0D
L0B26       LDA   |fgROW1,Y
            BMI   L0B32
            LDA   (ptrROW2),Y
            BPL   L0B32
            JMP   doSPRITEACTION

L0B32       INY
            LDA   $E1
            BEQ   L0B3A
L0B37       STA   SPKR
L0B3A       CPY   #WIDTH
            BNE   L0B26	; loop

            LDX   #WIDTH-1	; move lines
]LP         LDA   fgROW2,X
            STA   fgROW1,X
            LDA   fgROW3,X
            STA   fgROW2,X
            STY   fgROW3,X
            DEX
            BPL   ]LP

            LDA   ptrROW2	; move rows one line up
            STA   ptrROW1	; ptrROW1 <- ptrROW2
            LDA   ptrROW2+1	; ptrROW2 <- ptrROW3
            STA   ptrROW1+1	; ptrROW3 <- ptrROW3+1
            LDA   ptrROW3
            STA   ptrROW2
            CLC
            ADC   #WIDTH
            STA   ptrROW3
            LDA   ptrROW3+1
            STA   ptrROW2+1
            ADC   #$00
            STA   ptrROW3+1
            CMP   #>L6798	; until we reached the last line
            BNE   L0B22
            LDA   ptrROW3
            CMP   #<L6798
            BNE   L0B22
            LDA   $E1	; we reached the limit
            BEQ   L0B7B
            LDA   #$00
L0B76       STA   SPKR
            STA   $E1

L0B7B       LDA   saveTIME	; original time
            SEC
            SBC   theTIME	; - curent time
            CMP   L7401	; same as target?
            BNE   L0B89	; no
            LDA   #$0F	; yes...
            STA   rndMASK	; reduce random mask

L0B89       LDA   $36
            BNE   L0B91
            LDA   #$8C
            STA   $37
L0B91       LDA   $34
            CMP   #$C8
            BCC   L0B9B
            LDA   #$88
            STA   $37
L0B9B       LDX   $2E
            DEX
            BPL   L0BC1
            CPX   #$FF
            BEQ   L0BC1
            LDA   theCOUNTER
            AND   #$07
            BEQ   L0BC1
            CPX   #$FD
            BCS   L0BC3
            JSR   clearZPROWS
            JSR   checkBUTTON	; read button
            LDA   joyBTN
            BPL   L0BC3
            LDA   #$01
            STA   $08
            PLA
            PLA
            JMP   loseLIFE

L0BC1       STX   $2E
L0BC3       RTS

*-----------------------------
* HANDLE ACTION OF EACH SPRITE
*-----------------------------

doSPRITEACTION
            ASL		; for sprite indexes 80..FF
            TAX
            LDA   tblSPRACT,X
            STA   L0BD5+1
            LDA   tblSPRACT+1,X
            STA   L0BD5+2
            STY   theY
            TSX
L0BD5       JMP   tblSPRACT	; execute their code

*-----------------------------
* Refresh counter
* The lower, the better for the player

tblREFRESH  HEX   090A0B0C0D

*-----------------------------
* ANIMATE SPRITES
*-----------------------------

animSPRITES LDY   #sprEMPTY	; change the empty sprite
            LDA   flashCOUNTER
            BEQ   L0C02
            BMI   L0BED
            LDA   #$00	; reset the flag
            STA   flashCOUNTER
            LDA   #$FF	; white color
            BNE   L0C04
L0BED       INC   flashCOUNTER	; random color
L0BEF       JSR   getRANDOM
            STA   sprDATA1,Y
            JSR   getRANDOM
            STA   sprDATA5,Y
            INY
            CPY   #sprEMPTY+4
            BNE   L0BEF
            BEQ   L0C21

L0C02       LDA   #$00	; black color

L0C04       STA   sprDATA1,Y	; store at the
            STA   sprDATA2,Y	; sprEMPTY sprite
            STA   sprDATA3,Y
            STA   sprDATA4,Y
            STA   sprDATA5,Y
            STA   sprDATA6,Y
            STA   sprDATA7,Y
            STA   sprDATA8,Y
            INY
            CPY   #$74
            BNE   L0C04

*--- Copy animated sprites

L0C21       LDY   #sprFIREFLY ; animated sprites are made
            LDX   #sprAFIREFLY ; of four steps of animation
            JSR   moveSTEPSPRITE ; the code here copies
            LDY   #sprBUTTERFLY ; the current step of a sprite
            LDX   #sprABUTTERFLY ; to its final destination
            JSR   moveSTEPSPRITE ; in the sprite data
            LDY   #sprAMEOBA
            LDX   #sprAAMEOBA
            JSR   moveSTEPSPRITE
            LDY   #sprDIAMOND
            LDX   #sprADIAMOND
            JSR   moveSTEPSPRITE

            LDA   fgENCH
            BEQ   L0C43
            BPL   L0C4C
L0C43       LDY   #sprWENCH	; reset the wall
            LDX   #sprWALL
            JSR   moveSTEPSPRITE_ALT
            BEQ   L0C5B
L0C4C       LDY   #sprWENCH	; enchanted wall
            LDA   theCOUNTER
            AND   #$03	; 0..3
            ASL
            ASL
            ASL
            ASL
            ASL		; x $20
            TAX
            JSR   copySPRITE4	; X:source, Y:destination

*--- Rockford

L0C5B       LDY   #sprROCKFORD
            LDA   theDIR
            BEQ   L0CCC	; no movement
            CMP   #moveUP
            BCS   L0C85	; move or up
            CMP   #moveLEFT
            BNE   L0C77

            LDA   theCOUNTER	; do move left
            AND   #$03
            BNE   L0C73
            LDX   #$D0
            BNE   L0C8D
L0C73       LDX   #$C0
            BNE   L0C8D
L0C77       LDA   theCOUNTER	; do move right
            AND   #$03
            BNE   L0C81
            LDX   #$F0
            BNE   L0C8D
L0C81       LDX   #$E0
            BNE   L0C8D

L0C85       BNE   L0C8B	; not up
            LDX   #$A0	; do move up
            BNE   L0C8D
L0C8B       LDX   #$80	; do move down
L0C8D       JSR   copySPRITE4

            LDY   #sprROCKFORD+2	; Rockford up or down
            LDA   theDIR
            CMP   #moveUP
            BCS   L0CB6	; up or down
            CMP   #moveLEFT	; left or right
            BNE   L0CA9
            LDA   theCOUNTER	; move left
            AND   #$03	; 0..3
            ASL
            ASL
            ASL
            ASL		; x$10
            ADC   #$30	; +$30 30 40 50 60
            TAX
            BNE   L0CC6

L0CA9       LDA   theCOUNTER	; move right
            AND   #$03
            ASL
            ASL
            ASL
            ASL		; x$10
            ADC   #$70	; +$70 70 80 90 A0 
            TAX
            BNE   L0CC6

L0CB6       LDA   theCOUNTER
            AND   #$03
            TAX
            LDA   L0CC2,X	; get source sprite index
            TAX
            JMP   L0CC6

L0CC2       HEX   00B000C0	; 00 B0 00 C0

L0CC6       JSR   copySPRITE2	; X:source, Y:destination
            JMP   L0D3A

L0CCC       LDX   $0E
            BMI   L0CE1
            LDA   theCOUNTER
            AND   #$07
            BNE   L0CD9
            DEX
            STX   $0E
L0CD9       LDX   #$00
            STX   $54
            STX   $53
            BEQ   L0D11
L0CE1       LDX   $53
            BNE   L0CEC
            LDA   #$05
            JSR   getRANDOM2
            BNE   L0CF3
L0CEC       INX
            CPX   #$03
            BNE   L0CF3
            LDX   #$00
L0CF3       STX   $53
            LDX   $54
            BNE   L0D08
            LDA   #$0A
            JSR   getRANDOM2
            BNE   L0D0F
            JSR   getRANDOM
            AND   #$03
            ADC   #$01
            TAX
L0D08       LDA   theCOUNTER
            AND   #$07
            BNE   L0D0F
            DEX
L0D0F       STX   $54
L0D11       LDX   $53
            LDA   L0D34,X
            TAX
            LDY   #sprROCKFORD
            JSR   copySPRITE4	; X:source, Y:destination
            LDA   $54
            BEQ   L0D27
            LDA   theCOUNTER
            AND   #$01
            CLC
            ADC   #$01
L0D27       TAX
            LDA   L0D37,X
            TAX
            LDY   #sprROCKFORD+2
            JSR   copySPRITE2	; X:source, Y:destination
            JMP   L0D3A

L0D34       HEX   8090A0	; index in anim table
L0D37       HEX   001020	; index in anim table

L0D3A       LDA   $05
            CLC
            ADC   #$04
            CMP   $0B
            BCC   L0D50
            BEQ   L0D60
            SBC   #$0B
            BPL   L0D4B
            LDA   #$00
L0D4B       STA   $09
            JMP   L0D60

L0D50       ADC   #$0B
            CMP   $0B
            BCS   L0D60
            SBC   #$07
            CMP   $07
            BCC   L0D5E
            LDA   $07
L0D5E       STA   $09
L0D60       LDA   $06
            CLC
            ADC   #$03
            CMP   $0C
            BCC   L0D76
            BEQ   L0D86
            SBC   #$06
            BPL   L0D71
            LDA   #$00
L0D71       STA   $0A
            JMP   L0D86

L0D76       ADC   #$04
            CMP   $0C
            BCS   L0D86
            SBC   #$03
            CMP   $08
            BCC   L0D84
            LDA   $08
L0D84       STA   $0A

L0D86       LDX   $05
            CPX   $09
            BEQ   L0D94
            BCS   L0D91
            INX
            BNE   L0D92
L0D91       DEX
L0D92       STX   $05
L0D94       LDX   $06
            CPX   $0A
            BEQ   L0DA2
            BCS   L0D9F
            INX
            BNE   L0DA0
L0D9F       DEX
L0DA0       STX   $06
L0DA2       LDY   curPLAYER
            LDA   theACTION	; are we dead?
            BMI   drawGAMEOVER ; yes
            BNE   drawBAR	; no
            JMP   drawPAUSE	; allow pause

*-----------------------------
* DRAW GAME OVER
*-----------------------------

drawGAMEOVER
            LDX   #$13
L0DAF       LDA   strGAMEOVER,X
            STA   theSTRING,X
            DEX
            BPL   L0DAF
            RTS

strGAMEOVER
            HEX   74	; space
            HEX   20	; G
            HEX   74	; space
            HEX   14	; A
            HEX   74	; space
            HEX   2C	; M
            HEX   74	; space
            HEX   1C	; E
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   30	; O
            HEX   74	; space
            HEX   3E	; V
            HEX   74	; space
            HEX   1C	; E
            HEX   74	; space
            HEX   36	; R
            HEX   74	; space
            HEX   74	; space

*-----------------------------
* DRAW OUT OF TIME
*-----------------------------

drawOUTOFTIME
            LDX   #$13
L0DCF       LDA   strOUTOFTIME,X
            STA   theSTRING,X
            DEX
            BPL   L0DCF
            RTS

strOUTOFTIME
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   30	; O
            HEX   3C	; U
            HEX   3A	; T
            HEX   74	; space
            HEX   30	; O
            HEX   1E	; F
            HEX   74	; space
            HEX   3A	; T
            HEX   24	; I
            HEX   2C	; M
            HEX   1C	; E
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space

*-----------------------------
* DRAW BONUS LIFE
*-----------------------------

drawBONUSLIFE
            LDX   #$13
L0DEF       LDA   strBONUSLIFE,X
            STA   theSTRING,X
            DEX
            BPL   L0DEF
            RTS

strBONUSLIFE
            HEX   74	; space
            HEX   16	; B
            HEX   74	; space
            HEX   30	; O
            HEX   74	; space
            HEX   2E	; N
            HEX   74	; space
            HEX   3C	; U
            HEX   74	; space
            HEX   38	; S
            HEX   74	; space
            HEX   74	; space
            HEX   2A	; L
            HEX   74	; space
            HEX   24	; I
            HEX   74	; space
            HEX   1E	; F
            HEX   74	; space
            HEX   1C	; E
            HEX   74	; space

*-----------------------------
* DRAW BAR
*-----------------------------

drawBAR     CMP   #$01	; draw standard player's bar
            BEQ   L0E18
            CMP   #$10	; are we out of time?
            BEQ   drawOUTOFTIME
            JMP   drawEXTRADIAMONDSBAR

L0E18       LDA   $4D	; is pause allowed?
            BEQ   drawPLAYERSBAR
            LDA   $08
            BEQ   drawBONUSLIFE

* PLAYER

            LDX   #$06	; draw PLAYER string
L0E22       LDA   strPLAYER,X
            STA   theSTRING,X
            DEX
            BPL   L0E22

* MAN or MEN

            CLC
            LDA   #$00	; offset in MANMEN string
            LDX   livesP1,Y	; number of lives
            DEX
            BEQ   L0E35	; only one
            ADC   #$03	; offset goes to MEN

L0E35       TAX		; copy three chars
            LDY   #$02
L0E38       LDA   strMANMEN,X
            STA   theSTRING+12,Y	; L63A4,Y
            INX
            DEY
            BPL   L0E38

* Index of player (0..1 => 1..2)

            LDY   curPLAYER	; player index (0..1)
            TYA
            ASL
            ADC   #$02	; output 1 or 2
            STA   theSTRING+7	; L639F
            LDA   #$4A	; ,
            STA   theSTRING+8	; L63A0

* Number of lives

            LDA   |livesP1,Y
            ASL
            STA   theSTRING+10	; L63A2

* Cave index

            LDX   caveP1,Y
            LDA   strCAVEIDX,X ; ABCD/EFGH/IJKL/MNOP
            STA   theSTRING+16	; L63A8

            LDA   #$4C	; /
            STA   theSTRING+17	; L63A9

* Level

            LDA   |levelP1,Y
            ASL
            ADC   #$02
            STA   theSTRING+18	; L63AA

            LDA   #sprSPACE	; space character
            STA   theSTRING+9	; L63A1
            STA   theSTRING+11	; L63A3
            STA   theSTRING+15	; L63A7
            STA   theSTRING+19	; L63AB
            RTS

*-----------------------------
* DRAW PLAYER'S BAR
*-----------------------------

drawPLAYERSBAR
            LDX   levelP1,Y	; Y=0 for P1, Y=1 for P2
            LDA   L7409,X	; number of diamonds to collect
            TAX		; to activate the exit
            LDA   tblDECIMAL,X
            LDX   #$01
            JSR   int2ASCII

*--- Get diamond value

drawPLAYERSBAR2
            LDX   #$00	; offset 0 for normal value
            LDA   fgWON
            BNE   L0E9D
            LDA   fgEXIT	; is exit activated?
            BPL   L0E95	; no
            INX		; offset 1 for extra diamond
L0E95       LDA   L7402,X	; score of diamond
            LDX   #$04
            JSR   int2ASCII

L0E9D       LDA   #chrDIAMOND	; diamond
            STA   theSTRING+3	; L639B
            LDX   $30
            LDA   tblDECIMAL,X
            LDX   #$07
            JSR   int2ASCII

*--- Check time to determine what to draw

            LDX   theTIME	; get time
            CPX   #100	; 100
            LDA   tblDECIMAL,X
            LDX   #$00	; "0"
            BCC   L0EC2
            LDX   theTIME
            CPX   #200	; 200
            LDX   #$02	; "1"
            BCC   L0EC2
            CLC
            LDX   #$04	; "2"
L0EC2       STX   theSTRING+10	; L63A2
            LDX   #$0B
            JSR   int2ASCII

            LDA   theTIME	; get time
            CMP   #10
            BCS   L0EE4
            LDA   fgWON
            BNE   L0EE4
            LDA   theCOUNTER
            LSR
            BCC   L0EE4
            LDA   #sprSPACE	; space character
            STA   theSTRING+10	; L63A2
            STA   theSTRING+11	; L63A3
            STA   theSTRING+12	; L63A4

L0EE4       LDA   #sprSPACE	; space character
            STA   theSTRING
            STA   theSTRING+6	; L639E
            STA   theSTRING+9	; L63A1
            STA   theSTRING+13	; L63A5

            TYA		; which player?
            BNE   L0F0A

            LDA   scoreP1	; P1
            LDX   #$0E
            JSR   int2ASCII
            LDA   scoreP1+1
            LDX   #$10
            JSR   int2ASCII
            LDA   scoreP1+2
            LDX   #$12
            JMP   int2ASCII

L0F0A       LDA   scoreP2	; P2
            LDX   #$0E
            JSR   int2ASCII
            LDA   scoreP2+1
            LDX   #$10
            JSR   int2ASCII
            LDA   scoreP2+2
            LDX   #$12
            JMP   int2ASCII

*-----------------------------
* DRAW EXTRA DIAMONDS BAR
*-----------------------------

drawEXTRADIAMONDSBAR
            CLC
            JSR   drawPLAYERSBAR2	; draw 
            LDA   #chrDIAMOND	; diamond
            STA   theSTRING+1	; L6399
            STA   theSTRING+2	; L639A
            RTS

*-----------------------------
* DRAW PAUSE STRING
*-----------------------------

drawPAUSE   LDY   #$13
L0F2E       LDA   strPAUSE,Y
            STA   theSTRING,Y
            DEY
            BPL   L0F2E
            RTS

*-----------------------------
* INT TO ASCII
*-----------------------------

int2ASCII   STA   $02	; save integer value
            AND   #$F0	; keep high nibble
            LSR
            LSR
            LSR		; /8
            STA   theSTRING,X	; save high
            INX		; next string character
            LDA   $02	; get integer value
            AND   #$0F	; keep low nibble
            ASL		; /2
            STA   theSTRING,X	; save low
            RTS

*-----------------------------
* STRINGS
*-----------------------------

strPLAYER   HEX   32	; P
            HEX   2A	; L
            HEX   14	; A
            HEX   44	; Y
            HEX   1C	; E
            HEX   36	; R
            HEX   74	; space

strMANMEN   HEX   2E	; N = MAN
            HEX   14	; A
            HEX   2C	; M
            HEX   2E	; N = MEN
            HEX   1C	; E
            HEX   2C	; M

strPAUSE    HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   32	; P
            HEX   14	; A
            HEX   3C	; U
            HEX   38	; S
            HEX   1C	; E
            HEX   74	; space
            HEX   30	; O
            HEX   2E	; N
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space

strCAVEIDX  HEX   14	; A
            HEX   16	; B
            HEX   18	; C
            HEX   1A	; D
            HEX   4C	; /
            HEX   1C	; E
            HEX   1E	; F
            HEX   20	; G
            HEX   22	; H
            HEX   4C	; /
            HEX   24	; I
            HEX   26	; J
            HEX   28	; K
            HEX   2A	; L
            HEX   4C	; /
            HEX   2C	; M
            HEX   2E	; N
            HEX   30	; O
            HEX   32	; P
            HEX   4C	; /

*-----------------------------
* HEX TO DECIMAL TABLE
*-----------------------------

tblDECIMAL  HEX   00010203040506070809101112131415
            HEX   16171819202122232425262728293031
            HEX   32333435363738394041424344454647
            HEX   48495051525354555657585960616263
            HEX   64656667686970717273747576777879
            HEX   80818283848586878889909192939495
            HEX   96979899000102030405060708091011
            HEX   12131415161718192021222324252627
            HEX   28293031323334353637383940414243
            HEX   44454647484950515253545556575859
            HEX   60616263646566676869707172737475
            HEX   76777879808182838485868788899091
            HEX   92939495969798990001020304050607
            HEX   08091011121314151617181920212223
            HEX   24252627282930313233343536373839
            HEX   40414243444546474849505152535455

*-----------------------------
* MOVE STEPPED SPRITE
*-----------------------------
* X: source sprite
* Y: destination sprite
*
* Move a step of sprite data
* to another place in the
* sprite data
* @X (source sprite) + step = @Y (destination)

moveSTEPSPRITE
            STX   $02	; $C0
            LDA   theCOUNTER	; 0..3
            AND   #$03
            ASL
            ASL		; x4
            ADC   $02
            TAX

moveSTEPSPRITE_ALT
            CLC		; width is 4
            TYA
            ADC   #$04
            STA   $02
L1092       LDA   sprDATA1,X
            STA   sprDATA1,Y
            LDA   sprDATA2,X
            STA   sprDATA2,Y
            LDA   sprDATA3,X
            STA   sprDATA3,Y
            LDA   sprDATA4,X
            STA   sprDATA4,Y
            LDA   sprDATA5,X
            STA   sprDATA5,Y
            LDA   sprDATA6,X
            STA   sprDATA6,Y
            LDA   sprDATA7,X
            STA   sprDATA7,Y
            LDA   sprDATA8,X
            STA   sprDATA8,Y
            INX
            INY
            CPY   $02
            BNE   L1092
            RTS

*-----------------------------
* COPY SPRITE4
*-----------------------------
* X: source sprite
* Y: destination sprite

copySPRITE4 TYA		; copy 32 bytes of sprite data
            CLC		; 8 lines x 4
            ADC   #$04
            STA   $02
L10CF       LDA   sprANIM4,X
            STA   sprDATA1,Y
            INX
            LDA   sprANIM4,X
            STA   sprDATA2,Y
            INX
            LDA   sprANIM4,X
            STA   sprDATA3,Y
            INX
            LDA   sprANIM4,X
            STA   sprDATA4,Y
            INX
            LDA   sprANIM4,X
            STA   sprDATA5,Y
            INX
            LDA   sprANIM4,X
            STA   sprDATA6,Y
            INX
            LDA   sprANIM4,X
            STA   sprDATA7,Y
            INX
            LDA   sprANIM4,X
            STA   sprDATA8,Y
            INX
            INY
            CPY   $02
            BNE   L10CF
            RTS

*-----------------------------
* COPY SPRITE2
*-----------------------------
* X: source sprite
* Y: destination sprite

copySPRITE2 TYA		; copy 16 bytes of sprite data
            CLC		; 8 lines x 2
            ADC   #$02
            STA   $02
L1113       LDA   sprANIM2,X
            STA   sprDATA1,Y
            INX
            LDA   sprANIM2,X
            STA   sprDATA2,Y
            INX
            LDA   sprANIM2,X
            STA   sprDATA3,Y
            INX
            LDA   sprANIM2,X
            STA   sprDATA4,Y
            INX
            LDA   sprANIM2,X
            STA   sprDATA5,Y
            INX
            LDA   sprANIM2,X
            STA   sprDATA6,Y
            INX
            LDA   sprANIM2,X
            STA   sprDATA7,Y
            INX
            LDA   sprANIM2,X
            STA   sprDATA8,Y
            INX
            INY
            CPY   $02
            BNE   L1113
            RTS

*-----------------------------
* 
*-----------------------------

L1151       JSR   setROWPTR
            LDY   strX
            LDA   $D7
            STA   ($00),Y
            RTS

L115B       LDX   $DA
            LDA   $DB
            ASL
            TAY
            LDA   L1170,Y
            STA   L116D+1
            LDA   L1170+1,Y
            STA   L116D+2
L116D       JMP   L1170

L1170       DA    L1180
            DA    L1189
            DA    L1194
            DA    L119D
            DA    L11A8
            DA    L11B1
            DA    L11BC
            DA    L11C5

L1180       JSR   L1151
            DEC   strY
            DEX
            BNE   L1180
            RTS

L1189       JSR   L1151
            DEC   strY
            INC   strX
            DEX
            BNE   L1189
            RTS

L1194       JSR   L1151
            INC   strX
            DEX
            BNE   L1194
            RTS

L119D       JSR   L1151
            INC   strY
            INC   strX
            DEX
            BNE   L119D
            RTS

L11A8       JSR   L1151
            INC   strY
            DEX
            BNE   L11A8
            RTS

L11B1       JSR   L1151
            DEC   strX
            INC   strY
            DEX
            BNE   L11B1
            RTS

L11BC       JSR   L1151
            DEC   strX
            DEX
            BNE   L11BC
            RTS

L11C5       JSR   L1151
            DEC   strX
            DEC   strY
            DEX
            BNE   L11C5
            RTS

L11D0       LDA   strX
            STA   theX
            LDA   strY
            STA   theY
            LDA   $DB
            STA   $02
            LDA   $DA
            STA   $DD
            LDA   #$02
            STA   $DB
            JSR   L115B
            LDA   theX
            STA   strX
            LDA   theY
            CLC
            ADC   $02
            STA   strY
            DEC   strY
            JSR   L115B
            LDA   theX
            STA   strX
            LDA   theY
            STA   strY
            LDA   $02
            STA   $DA
            LDA   #$04
            STA   $DB
            JSR   L115B
            LDA   theX
            CLC
            ADC   $DD
            STA   strX
            DEC   strX
            LDA   theY
            STA   strY
            LDA   $02
            STA   $DA
            JMP   L115B

L121E       JSR   L11D0
            INC   theX
            INC   theY
            DEC   $02
            DEC   $02
            DEC   $DD
            DEC   $DD
            LDA   $DD
            STA   $DA
            LDX   $DC
            LDA   L98D3,X
            STA   $D7
            LDA   #$02
            STA   $DB
L123C       LDA   theX
            STA   strX
            LDA   theY
            STA   strY
            JSR   L115B
            INC   theY
            DEC   $02
            BNE   L123C
            RTS

*-----------------------------
* SET ROW POINTER
*-----------------------------

setROWPTR   LDA   #tblBACK-{2*WIDTH}	; start at row - 2
            STA   $00
            LDA   #>tblBACK-1	; LOGO
            STA   $00+1
            LDY   strY	; the counter
L1258       BEQ   L1268
            CLC
            LDA   $00
            ADC   #WIDTH
            STA   $00
            BCC   L1265
            INC   $00+1
L1265       DEY
            BPL   L1258
L1268       RTS

L1269       INY
            INY
            INY
            STY   $DE
            RTS

L126F       INY
            INY
            JMP   L1269

L1274       INY
            JMP   L126F

*-----------------------------
* PREPARE CAVE
*-----------------------------

prepareCAVE LDX   curPLAYER	; get the player's index
            LDA   caveP1,X	; in which cave?
            ASL
            TAY
            LDA   tblCAVES,Y	; get the pointer
            STA   ptrCAVE
            LDA   tblCAVES+1,Y
            STA   ptrCAVE+1

            LDY   #$00	; copy the packed data
L128A       LDA   (ptrCAVE),Y	; a compressed level
            STA   L7400,Y	; is always < 256 bytes
            INY
            BNE   L128A

            LDX   curPLAYER	; get the player's index
            LDY   levelP1,X	; which difficulty level
            LDA   L7404,Y	; number of diamonds to collect (0A)
            STA   rndVALUE2
            LDA   #$00	; number of diamonds collected
            STA   rndVALUE3

            LDA   L740E,Y	; get time
            STA   theTIME
            STA   saveTIME

* 1. make a random background

            LDA   #<tblBACK
            STA   $00
            LDA   #>tblBACK
            STA   $00+1
            LDA   #$01	; start on line 1
            STA   theY
L12B2       LDA   #$00	; and on column 0
            STA   theX
L12B6       LDX   #$01	; default is index 1
            JSR   getRANDOM3	; return 5
            LDY   #$00
L12BD       CMP   L741C,Y	; 3C 32 09 00
            BCS   L12C5
            LDX   L7418,Y	; 00 -> 70 -> empty block
L12C5       INY		; 01 -> 6C -> grass
            CPY   #$04	; 10 -> 88 -> boulder
            BNE   L12BD	; 14 -> 8C -> diamond
            LDA   L98D3,X
            LDY   #WIDTH
            STA   ($00),Y
            INC   $00
            BNE   L12D7
            INC   $00+1
L12D7       INC   theX	; next column
            LDA   theX
            CMP   #WIDTH
            BNE   L12B6
            INC   theY	; next row
            LDA   theY
            CMP   #HEIGHT
            BNE   L12B2

* 2. decode RLE

            LDA   #$00
            STA   strX
            LDA   #$02
            STA   strY
            LDA   #WIDTH
            STA   $DA
            LDA   #HEIGHT
            STA   $DB
            LDA   #$64
            STA   $D7
            JSR   L11D0
            LDY   #$00
            STY   $DE
L1302       LDY   $DE
            LDA   L7420,Y	; 0100_0010 42
            CMP   #$FF
            BEQ   L1371
            AND   #$3F	; 0011_1111 3F
            TAX		; 0000_0010 02
            LDA   L98D3,X	; 0110_1000 68
            STA   $D7	
            CMP   #$9D	; for indexes 25..28
            BNE   L1321

            LDA   L7420+1,Y	; get coords of entry or exit
            STA   $0B
            LDA   L7420+2,Y
            STA   $0C

L1321       LDA   L7420+1,Y
            STA   strX
            LDA   L7420+2,Y
            STA   strY
            LDA   L7420+3,Y
            STA   $DA
            LDA   L7420+4,Y
            STA   $DB
            LDA   L7420+5,Y
            STA   $DC

            LDA   L7420,Y	; 0100_0010 42
            AND   #$C0	; 1100_0000 C0
            BNE   L134A	; 0100_0000
            JSR   L1269
            JSR   L1151
            JMP   L136E

L134A       CMP   #$40	; 0100
            BNE   L1357
            JSR   L126F
            JSR   L115B
            JMP   L136E

L1357       CMP   #$80	; 1000
            BNE   L1364
            JSR   L1274
            JSR   L121E
            JMP   L136E

L1364       CMP   #$C0	; 1100
            BNE   L136E
            JSR   L126F
            JSR   L11D0
L136E       JMP   L1302

L1371       LDA   #$7F
            STA   rndMASK
            LDA   #$00
            STA   $07
            STA   $08
            STA   $09
            STA   $0A
            STA   fgENCH
            STA   fgEXIT
            STA   theCOUNTER
            STA   $30
            STA   fgWON
            LDA   #$6F
            STA   $2E
            LDA   #$01	; draw player's bar
            STA   theACTION
            LDA   #$02
            STA   $4D
            LDA   L7401
            STA   enchCOUNTER
            LDA   #$90
            STA   $37

*--- Get the player's refresh counter
* The lower, the more the player plays...

            LDX   curPLAYER	; get player's index
            LDY   levelP1,X	; get difficulty
            LDA   tblREFRESH,Y	; 9 A B C D
            STA   diffCOUNTER2
            STA   diffCOUNTER

*--- Check intermission for extra life

            LDA   caveP1,X	; get the cave the player is in
            CMP   #$04	; intermission caves
            BEQ   L13C9	; award a bonus life
            CMP   #$09
            BEQ   L13C9
            CMP   #$0E
            BEQ   L13C9
            CMP   #$13
            BEQ   L13C9

            LDA   #$14	; no intermission screen
            STA   $07	; so... no extra life
            LDA   #$0B
            STA   $08
            LDA   #$04
            STA   $0E
            BNE   L13D9

L13C9       LDA   #$F0	; life++
            STA   flashCOUNTER
            LDX   curPLAYER
            INC   livesP1,X
            LDA   livesP1,X
            CMP   #10
            BCC   L13D9
            DEC   livesP1,X

L13D9       LDX   L7402	; get diamond standard value
            LDA   tblDECIMAL,X
            STA   L7402	; make it decimal

            LDX   L7403	; get diamond extra value
            LDA   tblDECIMAL,X
            STA   L7403	; make it decimal

*-----------------------------
* BOARD ENTRY ANIMATION
*-----------------------------

L142C       LDA   #<tblFORE	; create a board
            STA   $00	; of titanium walls
            LDA   #>tblFORE	; only
            STA   $00+1	; in the front board
            LDA   #sprWTITA
            LDY   #$00
L1438       STA   ($00),Y
            INY
            BNE   L1438
            LDX   $00+1
            INX
            STX   $00+1
            CPX   #>sprDATA1
            BNE   L1438

*--- Loop

            LDA   #$1E	; for x=0 to 30
            STA   strY

*--- Outer loop

L144A       LDA   #$46	; for y=0 to 70
            STA   strX

*--- Inner loop

L144E       JSR   getRANDOM	; randomly
            AND   #$03	; select a tile
            CLC		; from the background
            TAX		; and copy it to the
            ADC   #>tblFORE	; foreground
            STA   $00+1
            TXA
            ADC   #>tblBACK
            STA   $02+1
            JSR   getRANDOM
            TAY
            LDA   #<tblFORE
            STA   $00
            STA   $02
            LDA   ($02),Y
            STA   ($00),Y
            DEC   strX
            BNE   L144E	; next Y

            JSR   animSPRITES

            LDY   #sprWTITA	; rotate the titanium sprite
L1475       LDA   sprDATA1,Y
            STA   $02
            LDA   sprDATA2,Y
            STA   sprDATA1,Y
            LDA   sprDATA3,Y
            STA   sprDATA2,Y
            LDA   sprDATA4,Y
            STA   sprDATA3,Y
            LDA   sprDATA5,Y
            STA   sprDATA4,Y
            LDA   sprDATA6,Y
            STA   sprDATA5,Y
            LDA   sprDATA7,Y
            STA   sprDATA6,Y
            LDA   sprDATA8,Y
            STA   sprDATA7,Y
            LDA   $02
            STA   sprDATA8,Y
            INY
            CPY   #$64
            BNE   L1475

            JSR   drawBOARD	; draw the board
            DEC   strY
            BEQ   L14B8
            JMP   L144A	; next x

*-----------------------------
* 
*-----------------------------

L14B8       LDA   #<tblFORE
            STA   $00
            LDA   #>tblFORE
            STA   $00+1
            LDA   #<tblBACK
            STA   $02
            LDA   #>tblBACK
            STA   $02+1
            LDY   #$00
L14CA       LDA   ($02),Y
            STA   ($00),Y
            INY
            BNE   L14CA
            INC   $02+1
            LDX   $00+1
            INX
            STX   $00+1
            CPX   #>sprDATA1
            BNE   L14CA
            RTS

*-----------------------------
* START GAME
*-----------------------------

main        LDA   #$05	; extra life at 500 points
            STA   extraP1
            STA   extraP2
            LDA   #NBLIVES	; nb lives = 3
            STA   livesP1
            STA   livesP2
            LDA   #$00
            STA   idxDEMO	; demo counter
            STA   curPLAYER	; current player
            STA   nbPLAYER	; number of players (0=1P, 1=2P)
            STA   theDIR	; no movement
            STA   caveP1	; P1 cave
            STA   caveP2	; P2 cave
            STA   levelP1	; P1 difficulty level
            STA   levelP2	; P2 difficulty level
            STA   $05	; ALWAYS 0
            STA   $06	; ALWAYS 0

            LDX   #$05	; clear scores
L1501       STA   scoreP1,X	; 2 x 3 bytes
            DEX
            BPL   L1501

            LDX   #3*WIDTH-1	; clear game's zero page
]LP         STA   fgROW1,X	; $5C..$D3
            DEX		; $28 x 3
            BPL   ]LP

            LDA   #<strSPACE	; an empty string
            STA   $00	; perhaps for the last line
            LDA   #>strSPACE
            STA   $00+1
            LDA   #sprSPACE	; space character
            LDY   #WIDTH-1
L1519       STA   ($00),Y
            DEY
            BPL   L1519

*-----------------------------
* SELECT DEVICE
*-----------------------------

            JSR   clearZPROWS
            LDA   TXTPAGE2
            JSR   playMUSIC

selectDEVICE
	jsr	clearHGRPAGES
	jsr	drawBOULDERDASH

            LDA   TXTPAGE1
*            LDA   fgINPUT	; which input?
*            CMP   #$55	; none?
*            BEQ   L1534	; yes, none
*            JMP   selectOPTIONS	; check input

L1534
            LDX   #$13	; print INPUT DEVICE
]LP         LDA   strINPUT,X
            STA   theSTRING,X
            DEX
            BPL   ]LP
            LDY   #$71	; #$7A #$83 #$8C
            JSR   drawSTRING
	 
            LDX   #$13	; print A/PPLE JOYSTICK
]LP         LDA   strAPPLEJOY,X
            STA   theSTRING,X
            DEX
            BPL   ]LP
            LDY   #$83	; #$8C #$95 #$9E
            JSR   drawSTRING

            LDX   #$13	; print K/EYBOARD
]LP         LDA   strKEYBOARD,X
            STA   theSTRING,X
            DEX
            BPL   ]LP
            LDY   #$8C	; #$95 #$9E
            JSR   drawSTRING

            LDX   #$13	; print J/OYPORT
]LP         LDA   strATARIJOY,X
            STA   theSTRING,X
            DEX
            BPL   ]LP
            LDY   #$95	; #$9E #$A7
            JSR   drawSTRING

	lda	FPDirectRead+3	; do we have a 4PLAY?
	beq	no4PLAY	; no 4play, cannot select

            LDX   #$13	; print 4/PLAY
]LP         LDA   str4PLAY,X
            STA   theSTRING,X
            DEX
            BPL   ]LP
            LDY   #$9E	; #$A7 #$B0
            JSR   drawSTRING

no4PLAY
            LDX   #$13	; print D/EFINE KEYS
]LP         LDA   strDEFINE,X
            STA   theSTRING,X
            DEX
            BPL   ]LP
            LDY   #$B0
            JSR   drawSTRING

            LDX   #$50	; wait
L1556       JSR   getRANDOM
            LDA   #$F0
            JSR   WAIT
            DEX
            BPL   L1564
            JMP   startDEMO	; timeout... enter demo

L1564       LDA   KBD	; select input device key
            BPL   L1556	; no loop
            STA   KBDSTROBE
	cmp	#"a"	; convert a-z to A-Z
	bcc	kbdGOOD2
	cmp	#"z"+1
	bcs	kbdGOOD2
	sbc	#$1f
kbdGOOD2            
            cmp   #"K"	; keyboard
            beq   inputKBD
            CMP   #"A"	; Apple Joystick
            BEQ   inputKBD
            CMP   #"J"	; Joyport
            beq   inputKBD
            cmp   #"D"	; Define keys
            beq   defineKEYS

            ldx   FPDirectRead+3	; skip if no 4play
            beq   L1565
            
            cmp   #"4"	; 4Play
            bne   L1565

inputKBD    STA   fgINPUT
            jmp   selectOPTIONS

L1565	cmp	#$91	; ctrl-q
	bne	L1556	; loop for a real key
	jmp	doQUIT	; bye bye

*-----------------------------
* DEFINE KEYS
*-----------------------------

keyROW	=	40
keyCOLUMN	=	24

*---

defineKEYS
            jsr   clearHGRPAGES

            LDX   #$13	; print BOULDERDASH
]LP         LDA   strBOULDERDASH,X
            STA   theSTRING,X	; because I can ;-)
            DEX
            BPL   ]LP
            LDY   #10
            JSR   drawSTRING

            LDX   #$13	; print D/EFINE KEYS
]LP         LDA   strDEFINE,X
            STA   theSTRING,X
            DEX
            BPL   ]LP
            LDY   #20
            JSR   drawSTRING

	jsr	printKEYS
	jsr	setKEYS
	jmp	selectDEVICE

*--------------------

setKEYS	ldy	#keyROW
	ldx	#0	; left
	jsr	waitDEFINE

	ldy	#keyROW+10
	ldx	#1	; right
	jsr	waitDEFINE

	ldy	#keyROW+20
	ldx	#2	; up
	jsr	waitDEFINE

	ldy	#keyROW+30
	ldx	#3	; down and go below

*--------------------

waitDEFINE	sty	keyY
	stx	keyINDEX

loopDEFINE	ldy	keyY	; draw char
	ldx	keyINDEX
	lda	keyLEFT,x
	sec
	sbc	#"A"
	asl
	ldx	#keyCOLUMN
	jsr	drawCHAR

	ldx	#5
]lp	lda	KBD
	bmi	waitDEFINE1
	lda	#120
	jsr	WAIT
	dex
	bpl	]lp

	ldy	keyY	; no, blink cursor
	lda	#chrDIAMOND
	ldx	#keyCOLUMN
	jsr	drawCHAR

	ldx	#5
]lp	lda	KBD
	bmi	waitDEFINE1
	lda	#120
	jsr	WAIT
	dex
	bpl	]lp
	bmi	loopDEFINE

waitDEFINE1	sta	KBDSTROBE	; check a-z
	cmp	#"a"	; A-Z
	bcc	waitDEFINE2
	cmp	#"z"+1
	bcs	loopDEFINE
	sbc	#$1f
waitDEFINE2	cmp	#"A"
	bcc	loopDEFINE
	cmp	#"Z"+1
	bcs	loopDEFINE

	ldx	keyINDEX	; save new key
	sta	keyLEFT,x	; and go below
	
*--------------------

printKEYS	lda	keyLEFT
	jsr	makeSPRKEY
	sta	strLEFT+12

	lda	keyRIGHT
	jsr	makeSPRKEY
	sta	strRIGHT+12

	lda	keyUP
	jsr	makeSPRKEY
	sta	strUP+12

	lda	keyDOWN
	jsr	makeSPRKEY
	sta	strDOWN+12

*---

	LDX   #$13	; print LEFT
]LP	LDA   strLEFT,X
	STA   theSTRING,X
	DEX
	BPL   ]LP
	LDY   #40
	JSR   drawSTRING

	LDX   #$13	; print RIGHT
]LP	LDA   strRIGHT,X
	STA   theSTRING,X
	DEX
	BPL   ]LP
	LDY   #50
	JSR   drawSTRING

	LDX   #$13	; print UP
]LP	LDA   strUP,X
	STA   theSTRING,X
	DEX
	BPL   ]LP
	LDY   #60
	JSR   drawSTRING

	LDX   #$13	; print DOWN
]LP	LDA   strDOWN,X
	STA   theSTRING,X
	DEX
	BPL   ]LP
	LDY   #70
	Jmp   drawSTRING

*--------------------

makeSPRKEY	sec		; ASCII to SPRITE index
	sbc	#"A"
	asl
	clc
	adc	#$14
	rts

*--------------------
* Key is at offset +12

strLEFT	hex	747474744E74742A1C1E3A482074747474747474
strRIGHT	hex	747474744E74362420223A482274747474747474
strUP	hex	747474744E747474743C32484474747474747474
strDOWN	hex	747474744E74741A30402E481674747474747474

*---

keyY	ds	1	; line to print
keyINDEX	ds	1	; index from keyLEFT table

*-----------------------------
* STRINGS
*-----------------------------

fgINPUT     HEX   55	; "A": Apple, $55: none, "J": Atari, "K": KEYBOARD, "4": 4Play

strINPUT    HEX   74	; STRING: INPUT DEVICE (UNUSED)
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   24	; I
            HEX   2E	; N
            HEX   32	; P
            HEX   3C	; U
            HEX   3A	; T
            HEX   74	; space
            HEX   1A	; D
            HEX   1C	; E
            HEX   3E	; V
            HEX   24	; I
            HEX   18	; C
            HEX   1C	; E
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space

strAPPLEJOY HEX   74	; STRING: A/PPLE  JOYSTICK
            HEX   74	; space
            HEX   14	; A
            HEX   4C	; /
            HEX   32	; P
            HEX   32	; P
            HEX   2A	; L
            HEX   1C	; E
            HEX   74	; space
            HEX   74	; space
            HEX   26	; J
            HEX   30	; O
            HEX   44	; Y
            HEX   38	; S
            HEX   3A	; T
            HEX   24	; I
            HEX   18	; C
            HEX   28	; K
            HEX   74	; space
            HEX   74	; space

strKEYBOARD HEX   74	; SPRITE: K/EYBOARD
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   28	; K
            HEX   4C	; /
            HEX   1C	; E
            HEX   44	; Y
            HEX   16	; B
            HEX   30	; O
            HEX   14	; A
            HEX   36	; R
            HEX   1A	; D
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space

strATARIJOY HEX   74	; SPRITE: J/OYPORT
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   26	; J
            HEX   4C	; /
            HEX   30	; O
            HEX   44	; Y
            HEX   32	; P
            HEX   30	; O
            HEX   36	; R
            HEX   3A	; T
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space

str4PLAY    HEX   74	; SPRITE: J/OYPORT
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   08	; 4
            HEX   4C	; /
            HEX   32	; P
            HEX   2A	; L
            HEX   14	; A
            HEX   44	; Y
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space
            HEX   74	; space

strDEFINE		; SPRITE: D/EFINE KEYS
	hex	747474741A4C1C1E242E1C74281C443874747474

fg4PLAY	ds	1	; 0: no 4play, <>0: 4play detected

*-----------------------------
* DRAW BOULDERDASH
*-----------------------------

drawBOULDERDASH
            LDX   #$13	; print BOULDERDASH
]LP         LDA   strBOULDERDASH,X
            STA   theSTRING,X	; because I can ;-)
            DEX
            BPL   ]LP
            LDY   #10
            JMP   drawSTRING

*-----------------------------
* SELECT GAME OPTIONS
*-----------------------------

selectOPTIONS
	jsr	clearHGRPAGES
	jsr	drawBOULDERDASH

            LDX   #$13	; draw cave and level
L15BD       LDA   strCAVELVL,X
            STA   theSTRING,X
            DEX
            BPL   L15BD
            LDY   #$A7
            JSR   drawSTRING

L15CB       LDX   nbPLAYER	; draw ONE or TWO PLAYERS
            LDA   tblSTRPLRL,X
            STA   L15DB+1
            LDA   tblSTRPLRH,X
            STA   L15DB+2

            LDX   #$13	; draw the string
L15DB       LDA   str1PLAYER,X
            STA   theSTRING,X
            DEX
            BPL   L15DB
            LDY   #$9E
            JSR   drawSTRING

            LDX   caveP1	; get cave level
            LDA   strCAVEIDX,X
            LDY   #$A7
            LDX   #$0C
            JSR   drawCHAR	; print it

            LDA   levelP1	; get player level
            ASL
            ADC   #$02
            LDY   #$A7
            LDX   #$26
            JSR   drawCHAR	; print it
            JMP   L1622

*-----------------------------

L1604       LDA   levelP1
            CMP   #$03
            BCC   L1610
            LDA   #$00
            STA   caveP1
            STA   caveP2
L1610       JMP   L15CB

L1613       LDA   #moveNONE	; no movement
            STA   theDIR
            STA   caveP1
            STA   caveP2
            JMP   L15CB

L161E       LDA   #moveNONE	; no movement
            STA   theDIR

*-----------------------------

L1622       LDA   #$26
            STA   $1D

L1626       LDA   KBD	; select nb of players / cave / level
            BMI   L16A9	; yes, we did

            LDA   theDIR	; do we move?
            BEQ   L163C	; no, we do not

            LDX   #$14
L1631       LDA   #$14
            JSR   WAIT
L1636       STA   SPKR
            DEX
            BPL   L1631

L163C       JSR   WAIT
            JSR   WAIT
            JSR   getMOVE
            JSR   getRANDOM
            DEC   $1D
            BNE   L164F
            JMP   startDEMO

L164F       LDA   joyBTN
            BPL   L1656
            JMP   startGAME

L1656       LDA   theDIR	; which direction?
            BEQ   L1626	; none
            CMP   #moveUP	; up or down?
            BCS   L168C	; yes
            CMP   #moveLEFT	; left?
            BNE   L1676
            LDA   levelP1	; do move left
            CMP   #$03
            BCS   L1613
            LDA   caveP1
            BEQ   L161E
            SEC
            SBC   #$05
            STA   caveP1
            STA   caveP2
            JMP   L15CB

L1676       LDA   levelP1	; do move right
            CMP   #$03
            BCS   L1613
            LDA   caveP1
            CLC
            ADC   #$05
            CMP   #MAXCAVES
            BCS   L161E
            STA   caveP1
            STA   caveP2
            JMP   L15CB

L168C       BNE   L169B	; up?
            LDA   levelP1	; do move up
            CMP   #$04
            BEQ   L161E
            INC   levelP1
            INC   levelP2
            JMP   L1604

L169B       LDA   levelP1	; do move down
            BNE   L16A2
            JMP   L161E

L16A2       DEC   levelP1
            DEC   levelP2
            JMP   L1604

*-----------------------------

L16A9       STA   KBDSTROBE	; check keys
            CMP   keySPACE
            BEQ   startGAME
            CMP   #"1"
            BNE   L16BB
            LDA   #$00
            beq   L16C1
L16BB       CMP   #"2"
            bne   L16C2

            LDA   #$01
L16C1       STA   nbPLAYER
            JMP   L15CB

L16C2	cmp	#$91	; ctrl-q
	beq	okQUIT
	jmp	L1626	; loop for a real key

okQUIT	jmp	doQUIT	; bye bye

*-----------------------------
* START A GAME
*-----------------------------

startDEMO   LDA   #$00
            STA   caveP1
            STA   caveP2
            STA   levelP1
            STA   levelP2
            STA   curPLAYER
            STA   idxDEMO
            LDA   #$FF	; the demo player
            STA   nbPLAYER

startGAME   JSR   clearZPROWS
            LDA   #$01
            STA   $E8
            STA   $EE

L16E4       JSR   prepareCAVE

loopGAME    JSR   animSPRITES
            JSR   drawBOARD
            JSR   L0ACB
            LDA   fgWON	; did we win?
            BEQ   L16F7	; yes
            JMP   L17C8	; no

L16F7       LDA   nbPLAYER	; who's playing?
            BPL   L170B	; a real player
            JSR   checkBUTTON	; the demo...
            BCS   L1708

            LDA   KBD
            BPL   loopGAME
            STA   KBDSTROBE
L1708       JMP   L0800	; loop

L170B       LDA   KBD
            BPL   loopGAME
            STA   KBDSTROBE
            CMP   #$93	; CTRL-Sound
            BEQ   doSOUND
            CMP   #$92	; CTRL-Restart game
            BNE   L1724
            LDA   #$01
            STA   $E8
            STA   $EE
            JMP   doENDGAME

L1724       CMP   keyLOSE	; we accept to lose
            BNE   L172B
            JMP   loseLIFE

L172B       CMP   keyPAUSE	; can we pause the game?
            BNE   loopGAME

            LDA   $4D	; is pause allowed?
            BNE   loopGAME	; no
            LDA   theACTION	; yes
            STA   strX
            LDA   #$00	; show pause
            STA   theACTION
            JSR   clearZPROWS
]LP         JSR   animSPRITES
            JSR   drawBOARD
            LDA   #$90
            JSR   WAIT
            LDA   KBD	; pause mode
            BPL   ]LP
            STA   KBDSTROBE
            LDA   strX	; restore action
            STA   theACTION
            JMP   loopGAME	; and loop

*-----------------------------
* CHANGE SOUND OUTPUT
*-----------------------------

doSOUND     LDA   L17E2+1
            CMP   #<SPKR
            BEQ   L1763
            LDA   #<SPKR
            BNE   L1765
L1763       LDA   #<TAPEOUT
L1765       STA   L17E2+1
            STA   L0897+1
            STA   L0986+1
            STA   L0B37+1
            STA   L0B76+1
            STA   L8EC4+1
            STA   L8EDE+1
            STA   L7622+1
            STA   L76F5+1
            STA   L77C6+1
            STA   L7897+1
            STA   L7968+1
            STA   L7A39+1
            STA   L7B0A+1
            STA   L7BDB+1
            STA   L7CAC+1
            STA   L7D7D+1
            STA   L7E4E+1
            STA   L7F1F+1
            STA   L80A3+1
            STA   L8174+1
            STA   L8245+1
            STA   L8316+1
            STA   L83E7+1
            STA   L84B8+1
            STA   L8589+1
            STA   L865A+1
            STA   L872B+1
            STA   L87FC+1
            STA   L88CD+1
            STA   L899E+1
            STA   L1636+1
            JMP   loopGAME

*-----------------------------
* 
*-----------------------------

L17C8       LDX   curPLAYER
            LDA   levelP1,X
            CLC
            ADC   #$01
            STA   L7403
            JSR   clearZPROWS
L17D5       LDA   theTIME
            BEQ   L1801
            LDX   #$05
L17DB       LDA   #$96
            SEC
            SBC   theTIME
            LSR
            LSR
L17E2       STA   SPKR
            JSR   WAIT
            DEX
            BPL   L17DB
            LDA   theTIME
            AND   #$01
            BNE   L17F7
            JSR   animSPRITES
            JSR   drawBOARD	; refresh board
L17F7       LDY   #$01
            SED
            JSR   L8E48
            DEC   theTIME
            BNE   L17D5

L1801       LDA   #$03
            STA   strX
L1805       JSR   animSPRITES
            JSR   drawBOARD
            LDA   theCOUNTER
            AND   #$07
            BNE   L1805
            DEC   strX
            BNE   L1805
            JMP   L1820

*-----------------------------
* LOSE A LIFE
*-----------------------------

loseLIFE    LDX   curPLAYER
            DEC   livesP1,X
            LDA   $07
            BNE   L183F
L1820       LDX   curPLAYER
            LDA   nbPLAYER	; which player?
            BPL   L1829	; ...a real player
            JMP   L0800	; ...no, demo game

L1829       INC   caveP1,X	; next cave?
            LDA   caveP1,X
            CMP   #MAXCAVES+1
            BCC   L183F
            LDA   #$00	; restart at cave 0
            STA   caveP1,X
            INC   levelP1,X	; at a higher difficulty
            LDA   levelP1,X
            CMP   #MAXLEVELS+1
            BCC   L183F
            DEC   levelP1,X	; or staty at the highest

L183F       LDA   #$00	; no sound on rows
            LDX   #$0B
L1843       STA   fgSOUND,X
            DEX
            BNE   L1843

            LDA   #$01	; but on rows 0 & 6
            STA   fgSOUND
            STA   fgSOUND6
            STA   theACTION	; draw
            STA   $4D

            LDX   curPLAYER
            BNE   L1859
            INX
            BNE   L185A
L1859       DEX
L185A       LDA   nbPLAYER
            BEQ   L1864
            LDA   livesP1,X
            BEQ   L1864
            STX   curPLAYER
L1864       LDX   curPLAYER
            LDA   livesP1,X
            BEQ   doENDGAME
            JSR   L8D93	; rolling sprite
            JMP   L16E4

*-----------------------------
* END OF GAME
*-----------------------------

doENDGAME   LDA   #$FF	; player is dead
            STA   theACTION
            JSR   L8D93
            JSR   drawBOARD
            STA   TXTPAGE2
            JSR   checkHIGHSCORES
            JSR   drawHIGHSCORES
            LDA   #$00
            STA   curPLAYER

            LDX   #$28	; wait
L1889       LDA   #$E0
            JSR   WAIT
            JSR   checkBUTTON	; read button
            BCS   L189E
            LDA   KBD	; did we press a key?
            BMI   L189B	; yes
            DEX		; no
            BNE   L1889
L189B       STA   KBDSTROBE
L189E       JMP   L0800	; jump

*-----------------------------
* CHECK BUTTON
*-----------------------------
* button not pressed:
*  ZP $52 = $00, CLC
* button pressed:
*  ZP $52 = $FF, SEC

checkBUTTON LDA   fgINPUT	; which input?
            cmp   #"A"
            BEQ   L18BB	; Apple joystick
            CMP   #$55
            BEQ   L18C0	; none
	  cmp   #"K"
	  beq   checkSPC
	  cmp   #"4"
	  beq   check4PLAY

            LDA   SETAN0	; Atari joystick
            LDA   curPLAYER
            BEQ   L18B4
            LDA   CLRAN0
L18B4       LDA   BUTN0
            BMI   L18C0
            BPL   L18C6

L18BB       LDA   BUTN0	; do Apple joystick
            BMI   L18C6

L18C0       LDA   #$00	; button not pressed
            STA   joyBTN
            CLC
            RTS
L18C6       LDA   #$FF	; button pressed
            STA   joyBTN
            SEC
            RTS

checkSPC	lda	KBD	; did we press the button keyboard
	bpl	L18C0
	sta	KBDSTROBE
	cmp	keySPACE
	bne	L18C0	; button not pressed
	beq	L18C6	; button pressed

check4PLAY	jsr	FPDirectRead
	and	#fpTRIGGER1
	beq	L18C0	; button not pressed
	bne	L18C6	; button pressed
	
*-----------------------------
* 
*-----------------------------

L18CC       JSR   L196D
            JSR   L1915
            JSR   L1942
            LDY   theY
            LDA   #sprFIREFLY+1
            STA   (ptrROW2),Y
            JMP   L0B32

L18DE       JSR   L196D
            JSR   L1942
            JSR   L192B
            LDY   theY
            LDA   #sprFIREFLY+2
            STA   (ptrROW2),Y
            JMP   L0B32

L18F0       JSR   L196D
            JSR   L192B
            JSR   L1956
            LDY   theY
            LDA   #sprFIREFLY+3
            STA   (ptrROW2),Y
            JMP   L0B32

L1902       JSR   L196D
            JSR   L1956
            JSR   L1915
            LDY   theY
            LDA   #sprFIREFLY
            STA   (ptrROW2),Y
            JMP   L0B32
L1914       RTS

L1915       LDY   theY
            DEY
            LDA   (ptrROW2),Y
            CMP   #sprEMPTY
            BNE   L1914
            LDA   #sprFIREFLY+3
            STA   (ptrROW2),Y
            INY
            LDA   #sprEMPTY
            STA   (ptrROW2),Y
            TXS
            JMP   L0B32

L192B       LDY   theY
            INY
            LDA   (ptrROW2),Y
            CMP   #sprEMPTY
            BNE   L1914
            LDA   #sprFIREFLY+1
            STA   (ptrROW2),Y
            DEY
            LDA   #sprEMPTY
            STA   (ptrROW2),Y
            INY
            TXS
            JMP   L0B32

L1942       LDY   theY
            LDA   (ptrROW1),Y
            CMP   #sprEMPTY
            BNE   L1914
            LDA   #sprFIREFLY
            STA   (ptrROW1),Y
            LDA   #sprEMPTY
            STA   (ptrROW2),Y
            TXS
            JMP   L0B32

L1956       LDY   theY
            LDA   (ptrROW3),Y
            CMP   #sprEMPTY
            BNE   L1914
            LDA   #sprFIREFLY+2
            STA   (ptrROW3),Y
            STA   |fgROW2,Y
            LDA   #sprEMPTY
            STA   (ptrROW2),Y
            TXS
            JMP   L0B32

L196D       LDA   (ptrROW1),Y
            CMP   #sprROCKFORD
            BEQ   L199A
            CMP   #sprAMEOBA
            BEQ   L199A
            LDA   (ptrROW3),Y
            CMP   #sprROCKFORD
            BEQ   L199A
            CMP   #sprAMEOBA
            BEQ   L199A
            INY
            LDA   (ptrROW2),Y
            CMP   #sprROCKFORD
            BEQ   L199A
            CMP   #sprAMEOBA
            BEQ   L199A
            DEY
            DEY
            LDA   (ptrROW2),Y
            CMP   #sprROCKFORD
            BEQ   L199A
            CMP   #sprAMEOBA
            BEQ   L199A
            INY
            RTS

L199A       LDY   theY
            DEY
            LDX   #$03
            STX   $E1
L19A1       LDA   (ptrROW1),Y
            CMP   #sprWTITA2
            BEQ   L19AB
            LDA   #sprDISGRASS
            STA   (ptrROW1),Y
L19AB       LDA   (ptrROW2),Y
            CMP   #sprWTITA2
            BEQ   L19B8
            LDA   #sprDISGRASS
            STA   (ptrROW2),Y
            STA   |fgROW1,Y
L19B8       LDA   (ptrROW3),Y
            CMP   #sprWTITA2
            BEQ   L19C5
            LDA   #sprDISGRASS
            STA   (ptrROW3),Y
            STA   |fgROW2,Y
L19C5       INY
            DEX
            BNE   L19A1
            PLA
            PLA
            JMP   L0B32

L19CE       LDA   ptrROW3
            CLC
            ADC   #WIDTH
            STA   $00
            LDA   ptrROW3+1
            ADC   #$00
            STA   $00+1
            LDY   theY
            DEY
            LDX   #$03
            STX   $E1
L19E2       LDA   (ptrROW2),Y
            CMP   #sprWTITA2
            BEQ   L19EC
            LDA   #sprDISGRASS
            STA   (ptrROW2),Y
L19EC       LDA   (ptrROW3),Y
            CMP   #sprWTITA2
            BEQ   L19F9
            LDA   #sprDISGRASS
            STA   (ptrROW3),Y
            STA   |fgROW2,Y
L19F9       LDA   ($00),Y
            CMP   #sprWTITA2
            BEQ   L1A06
            LDA   #sprDISGRASS
            STA   ($00),Y
            STA   |fgROW3,Y
L1A06       INY
            DEX
            BNE   L19E2
            DEY
            PLA
            PLA
            JMP   L0B32

L1A10       JSR   L1AB1
            JSR   L1A6F
            JSR   L1A86
            LDY   theY
            LDA   #sprBUTTERFLY+3
            STA   (ptrROW2),Y
            JMP   L0B32

L1A22       JSR   L1AB1
            JSR   L1A9A
            JSR   L1A6F
            LDY   theY
            LDA   #sprBUTTERFLY
            STA   (ptrROW2),Y
            JMP   L0B32

L1A34       JSR   L1AB1
            JSR   L1A59
            JSR   L1A9A
            LDY   theY
            LDA   #sprBUTTERFLY+1
            STA   (ptrROW2),Y
            JMP   L0B32

L1A46       JSR   L1AB1
            JSR   L1A86
            JSR   L1A59
            LDY   theY
            LDA   #sprBUTTERFLY+2
            STA   (ptrROW2),Y
            JMP   L0B32
L1A58       RTS

L1A59       LDY   theY
            DEY
            LDA   (ptrROW2),Y
            CMP   #sprEMPTY
            BNE   L1A58
            LDA   #sprBUTTERFLY+3
            STA   (ptrROW2),Y
            INY
            LDA   #sprEMPTY
            STA   (ptrROW2),Y
            TXS
            JMP   L0B32

L1A6F       LDY   theY
            INY
            LDA   (ptrROW2),Y
            CMP   #sprEMPTY
            BNE   L1A58
            LDA   #sprBUTTERFLY+1
            STA   (ptrROW2),Y
            DEY
            LDA   #sprEMPTY
            STA   (ptrROW2),Y
            INY
            TXS
            JMP   L0B32

L1A86       LDY   theY
            LDA   (ptrROW1),Y
            CMP   #sprEMPTY
            BNE   L1A58
            LDA   #sprBUTTERFLY
            STA   (ptrROW1),Y
            LDA   #sprEMPTY
            STA   (ptrROW2),Y
            TXS
            JMP   L0B32

L1A9A       LDY   theY
            LDA   (ptrROW3),Y
            CMP   #sprEMPTY
            BNE   L1A58
            LDA   #sprBUTTERFLY+2
            STA   (ptrROW3),Y
            STA   |fgROW2,Y
            LDA   #sprEMPTY
            STA   (ptrROW2),Y
            TXS
            JMP   L0B32

*-----------------------------
* THE DIFFERENT EXPLOSIONS
*-----------------------------

L1AB1       LDA   (ptrROW1),Y
            CMP   #sprROCKFORD
            BEQ   L1ADE
            CMP   #sprAMEOBA
            BEQ   L1ADE
            LDA   (ptrROW3),Y
            CMP   #sprROCKFORD
            BEQ   L1ADE
            CMP   #sprAMEOBA
            BEQ   L1ADE
            INY
            LDA   (ptrROW2),Y
            CMP   #sprROCKFORD
            BEQ   L1ADE
            CMP   #sprAMEOBA
            BEQ   L1ADE
            DEY
            DEY
            LDA   (ptrROW2),Y
            CMP   #sprROCKFORD
            BEQ   L1ADE
            CMP   #sprAMEOBA
            BEQ   L1ADE
            INY
            RTS

L1ADE       LDY   theY
            DEY
            LDX   #$03
            STX   $E1
L1AE5       LDA   (ptrROW1),Y
            CMP   #sprWTITA2
            BEQ   L1AEF
            LDA   #sprAMEDIA
            STA   (ptrROW1),Y
L1AEF       LDA   (ptrROW2),Y
            CMP   #sprWTITA2
            BEQ   L1AFC
            LDA   #sprAMEDIA
            STA   (ptrROW2),Y
            STA   |fgROW1,Y
L1AFC       LDA   (ptrROW3),Y
            CMP   #sprWTITA2
            BEQ   L1B09
            LDA   #sprAMEDIA
            STA   (ptrROW3),Y
            STA   |fgROW2,Y
L1B09       INY
            DEX
            BNE   L1AE5
            PLA
            PLA
            JMP   L0B32

*-----------------------------
* AMOEBA BECOMES DIAMONDS
*-----------------------------

L1B12       LDA   ptrROW3
            CLC
            ADC   #WIDTH
            STA   $00
            LDA   ptrROW3+1
            ADC   #$00
            STA   $00+1
            LDY   theY
            DEY
            LDX   #$03
            STX   $E1
L1B26       LDA   (ptrROW2),Y
            CMP   #sprWTITA2	; titanium wall
            BEQ   L1B30
            LDA   #sprAMEDIA	; amoeba becomes diamond
            STA   (ptrROW2),Y
L1B30       LDA   (ptrROW3),Y
            CMP   #sprWTITA2	; titanium wall
            BEQ   L1B3D
            LDA   #sprAMEDIA	; amoeba becomes diamond
            STA   (ptrROW3),Y
            STA   |fgROW2,Y
L1B3D       LDA   ($00),Y
            CMP   #sprWTITA2	; titanium wall
            BEQ   L1B4A
            LDA   #sprAMEDIA	; amoeba becomes diamond
            STA   ($00),Y
            STA   |fgROW3,Y
L1B4A       INY
            DEX
            BNE   L1B26
            DEY
            PLA
            PLA
            JMP   L0B32

L1B54       LDA   (ptrROW3),Y
            CMP   #sprBOULDER
            BEQ   L1B72
            CMP   #sprDIAMOND
            BEQ   L1B72
            CMP   #sprWALL
            BEQ   L1B72
            CMP   #sprEMPTY
            BNE   L1BA7
            STA   (ptrROW2),Y
            LDA   #sprBOULDER+1
            STA   (ptrROW3),Y
            STA   |fgROW2,Y
            JMP   L0B32

L1B72       DEY
            LDA   (ptrROW2),Y
            CMP   #sprEMPTY
            BNE   L1B8B
            LDA   (ptrROW3),Y
            CMP   #sprEMPTY
            BNE   L1B8B
            LDA   #sprBOULDER+1
            STA   (ptrROW2),Y
            INY
            LDA   #sprEMPTY
            STA   (ptrROW2),Y
            JMP   L0B32

L1B8B       INY
            INY
            LDA   (ptrROW2),Y
            CMP   #sprEMPTY
            BNE   L1BA6
            LDA   (ptrROW3),Y
            CMP   #sprEMPTY
            BNE   L1BA6
            LDA   #sprBOULDER+1
            STA   (ptrROW2),Y
            DEY
            LDA   #sprEMPTY
            STA   (ptrROW2),Y
            INY
            JMP   L0B32

L1BA6       DEY
L1BA7       JMP   L0B32

L1BAA       LDA   (ptrROW3),Y
            AND   #$FC
            CMP   #sprEMPTY
            BNE   L1BBE
            STA   (ptrROW2),Y
            LDA   #sprBOULDER+1
            STA   (ptrROW3),Y
            STA   |fgROW2,Y
            JMP   L0B32

L1BBE       CMP   #sprWENCH	; is it an enchanted wall?
            BNE   L1BF2	; no
            LDA   fgENCH	; yes, is period active?
            BMI   L1BEB	; no
            BNE   L1BCC	; yes
            LDA   #$01
            STA   fgENCH
L1BCC       CLC
            LDA   ptrROW3
            ADC   #WIDTH
            STA   $00
            LDA   ptrROW3+1
            ADC   #$00
            STA   $00+1
            LDA   ($00),Y
            CMP   #sprEMPTY
            BNE   L1BEB
            STA   (ptrROW2),Y	; make it empty
            LDA   #sprDIAMOND+1
            STA   ($00),Y	; and a boulder to transform
            STA   |fgROW3,Y
            JMP   L0B32

L1BEB       LDA   #sprEMPTY
            STA   (ptrROW2),Y
            JMP   L0B32

L1BF2       CMP   #sprBUTTERFLY
            BNE   L1BFB
            PHA
            PHA
            JMP   L1B12

L1BFB       CMP   #sprROCKFORD
            BEQ   L1C03
            CMP   #sprFIREFLY
            BNE   L1C08
L1C03       PHA
            PHA
            JMP   L19CE

L1C08       LDA   #sprBOULDER
            STA   (ptrROW2),Y
            DEY
            STA   $E1
            JMP   L0B32

L1C12       LDA   (ptrROW3),Y
            CMP   #sprBOULDER
            BEQ   L1C30
            CMP   #sprDIAMOND
            BEQ   L1C30
            CMP   #sprWALL
            BEQ   L1C30
            CMP   #sprEMPTY
            BNE   L1C65
            STA   (ptrROW2),Y
            LDA   #sprDIAMOND+1
            STA   (ptrROW3),Y
            STA   |fgROW2,Y
            JMP   L0B32

L1C30       DEY
            LDA   (ptrROW2),Y
            CMP   #sprEMPTY
            BNE   L1C49
            LDA   (ptrROW3),Y
            CMP   #sprEMPTY
            BNE   L1C49
            LDA   #sprDIAMOND+1
            STA   (ptrROW2),Y
            INY
            LDA   #sprEMPTY
            STA   (ptrROW2),Y
            JMP   L0B32

L1C49       INY
            INY
            LDA   (ptrROW2),Y
            CMP   #sprEMPTY
            BNE   L1C64
            LDA   (ptrROW3),Y
            CMP   #sprEMPTY
            BNE   L1C64
            LDA   #sprDIAMOND+1	; put a diamond
            STA   (ptrROW2),Y
            DEY
            LDA   #sprEMPTY
            STA   (ptrROW2),Y
            INY
            JMP   L0B32

L1C64       DEY
L1C65       JMP   L0B32

L1C68       LDA   (ptrROW3),Y
            AND   #$FC	; %1111_1100
            CMP   #sprEMPTY	; %0111_0000
            BNE   L1C7C
            STA   (ptrROW2),Y	; empty block
            LDA   #sprDIAMOND+1
            STA   (ptrROW3),Y	; put a diamond
            STA   |fgROW2,Y	; mark it
            JMP   L0B32

L1C7C       CMP   #sprWENCH	; is it an enchanted wall?
            BNE   L1CB0	; no
            LDA   fgENCH	; is enchantment period active?
            BMI   L1CA9	; no more
            BNE   L1C8A	; yes
            LDA   #$01	; for a short period of time
            STA   fgENCH
L1C8A       CLC		; set the next row
            LDA   ptrROW3
            ADC   #WIDTH
            STA   $00
            LDA   ptrROW3+1
            ADC   #$00
            STA   $00+1
            LDA   ($00),Y
            CMP   #sprEMPTY	; check emptiness below
            BNE   L1CA9	; nope
            STA   (ptrROW2),Y	; yes
            LDA   #sprBOULDER+1 ; move boulder
            STA   ($00),Y
            STA   |fgROW3,Y
            JMP   L0B32

L1CA9       LDA   #sprEMPTY
            STA   (ptrROW2),Y
            JMP   L0B32

L1CB0       CMP   #sprBUTTERFLY
            BNE   L1CB9
            PHA
            PHA
            JMP   L1B12

L1CB9       CMP   #sprROCKFORD
            BEQ   L1CC1
            CMP   #sprFIREFLY
            BNE   L1CC6
L1CC1       PHA
            PHA
            JMP   L19CE

L1CC6       LDA   #sprDIAMOND
            STA   (ptrROW2),Y
            DEY
            STA   $E5
            JMP   L0B32

L1CD0       LDA   (ptrROW2),Y
            CLC
            ADC   #$04
            STA   (ptrROW2),Y
            STA   $E1
            JMP   L0B32

L1CDC       LDA   #sprEMPTY
            STA   (ptrROW2),Y
            JMP   L0B32

L1CE3       LDA   #sprDIAMOND
            STA   (ptrROW2),Y
            JMP   L0B32
L1CEA       JMP   L0B32

L1CED       LDA   fgEXIT	; is exit activated?
            BMI   L1CF4	; yes
            JMP   L0B32	; no

L1CF4       LDA   theCOUNTER	; switch
            AND   #$01	; between the sprites
            BNE   L1CFE
            LDA   #sprEXIT
            BNE   L1D00
L1CFE       LDA   #sprENTRY
L1D00       STA   (ptrROW2),Y
            JMP   L0B32

*-----------------------------
* TABLE OF SPRITE ACTIONS
*-----------------------------

tblSPRACT   DA    L18CC	; 80
            DA    L18DE	; 82
            DA    L18F0	; 84
            DA    L1902	; 86
            DA    L1A10	; 88
            DA    L1A22	; 8A
            DA    L1A34	; 8C
            DA    L1A46	; 8E
            DA    L1B54	; 90
            DA    L1BAA	; 92
            DA    L1B54	; 94
            DA    L1BAA	; 96
            DA    L1C12	; 98
            DA    L1C68	; 9A
            DA    L1C12	; 9C
            DA    L1C68	; 9E
            DA    L8C20	; A0
            DA    L8C20	; A2
            DA    L8C20	; A4
            DA    L8C20	; A6
            DA    L1CEA	; A8
            DA    L1CEA	; AA
            DA    L1CEA	; AC
            DA    L1CEA	; AE
            DA    L1CED	; B0
            DA    L8CCC	; B2
            DA    L1CED	; B4
            DA    L1CED	; B6
            DA    L1CED	; B8
            DA    L8CEE	; BA
            DA    L1CED	; BC
            DA    L1CED	; BE
            DA    L1CD0	; C0
            DA    L8CF5	; C2
            DA    L1CD0	; C4
            DA    L1CD0	; C6
            DA    L1CD0	; C8
            DA    L8CFE	; CA
            DA    L1CD0	; CC
            DA    L1CD0	; CE
            DA    L1CD0	; D0
            DA    L8D07	; D2
            DA    L1CD0	; D4
            DA    L1CD0	; D6
            DA    L1CDC	; D8
            DA    L1CDC	; DA
            DA    L1CDC	; DC
            DA    L1CDC	; DE
            DA    L1CD0	; E0
            DA    L1CD0	; E2
            DA    L1CD0	; E4
            DA    L1CD0	; E6
            DA    L1CD0	; E8
            DA    L1CD0	; EA
            DA    L1CD0	; EC
            DA    L1CD0	; EE
            DA    L1CD0	; F0
            DA    L1CD0	; F2
            DA    L1CD0	; F4
            DA    L1CD0	; F6
            DA    L1CE3	; F8
            DA    L1CE3	; FA
            DA    L1CE3	; FC
            DA    L1CE3	; FE

* This was garbage until sprite $60

            ds    $60	; 00-5F

* The table restarts here...

            DA    L8A3F	; 60 titanium wall
            DA    L8A3F	; 62 titanium wall
            DA    L8A3F	; 64 titanium wall
            DA    L8A3F	; 66 titanium wall

*-----------------------------
* DRAW ONE CHARACTER
*-----------------------------

drawCHAR    STA   sprA	; data to output
            STX   sprX	; X-coord
            STY   sprY	; Y-coord
            LDX   #$07	; height
            STX   theX
L1E0F       LDX   sprY	; get Y
            LDA   tblHGRL,X
            STA   $00
            LDA   tblHGRH,X
            STA   $00+1

            LDX   theX	; get index buffer
            LDA   tblCHARDATA,x
            STA   L1E2A+2
            STA   L1E30+2
            LDX   sprA
            LDY   sprX	; get 1st X-col coord
L1E2A       LDA   sprDATA1,X	; draw first column
            STA   ($00),Y
            INY		; get 2nd X-col coord
L1E30       LDA   sprDATA1+1,X	; draw last column
            STA   ($00),Y
            INC   sprY	; next HGR line
            DEC   theX	; next buffer
            BPL   L1E0F
            RTS

*-----------------------------
* DRAW BLOCK
*-----------------------------

drawSTRING  STY   strY	; line number
            LDX   #$13	; size of block in bytes
L1FC8       STX   strX	; save counter
            LDY   theSTRING,X	; get string character
            TXA		; string offset
            ASL		; *2
            TAX		; = output X-col
            TYA		; data value 
            LDY   strY	; get line number number
            JSR   drawCHAR	; output data
            LDX   strX	; data++
            DEX
            BPL   L1FC8
            RTS

            DS    \

*--- End of file

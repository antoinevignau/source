*---------------------------------------
* SPEED OF THE IIgs
*---------------------------------------

	mx	%00
	org	$800
	lst	off

*-----------

	clc
	xce
	rep	#$30
	
	jsr	getSPEED

	sec
	xce
	sep	#$30

	lda	#$8d
	jsr	$fded
	lda	fgSPEED
	jsr	$fdda
	lda	#$8d
	jsr	$fded
	lda	realSPEED
	jsr	$fdda
	lda	realSPEED+1
	jsr	$fdda
	lda	realSPEED+2
	jsr	$fdda
	lda	realSPEED+3
	jsr	$fdda
	lda	realSPEED+4
	jsr	$fdda
	rts

*-----------

	mx	%00
	
getSPEED    sei                 ; Vitesse GS
            ldal  $e0c035
            pha
            and   #$ff00
            stal  $e0c035

            ldx   #0
getSPEED1   lda   getSPEED,X
            inx
            inx
            cpx   #$0110
            bcc   getSPEED1

            ldy   #12
            ldal  $e0c02b
            and   #$0010
            beq   getSPEED2
            dey
            dey

getSPEED2   ldx   #0
]lp         ldal  $e0c018
            bmi   ]lp
]lp         ldal  $e0c018
            bpl   ]lp
getSPEED3   nop
            nop
getSPEED4   inx
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            ldal  $e0c018
            bmi   getSPEED3
getSPEED5   inx
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            nop
            ldal  $e0c018
            bpl   getSPEED5
            dey
            bne   getSPEED4

            txa
            lsr
            ldx   #0
            txy
]lp         cmp   parmsSPEED,y
            bcc   getSPEED6
            sbc   parmsSPEED,y
            inc   realSPEED,x
            bra   ]lp
getSPEED6   iny
            iny
            inx
            cpy   #10
            bne   ]lp

            lda   realSPEED
            and   #$00ff
            bne   getSPEED7     ; >=10 mhz

            lda   realSPEED+1
            xba
            cmp   #$0208        ; >=2.8
            bcs   getSPEED7

            inc   fgSPEED

getSPEED7   pla
            stal  $e0c035
            cli
            rts

*--- Vitesse GS

fgSPEED     ds    2
parmsSPEED  dw    10000
            dw    1000
            dw    100
            dw    10
            dw    1
realSPEED   ds    5

*--------------------------------------------

STANDARD IIGS SPEED
300:A9 5A 8D C05A 8D C05A 8D C05A 8D C05A A9 28 8D C05A A9 A5 8D C05A 60

MAXIMUM SPEED
320:A9 5A 8D C05A 8D C05A 8D C05A 8D C05A A9 28 8D C05B A9 A5 8D C05A 60

*--------------------------------------------



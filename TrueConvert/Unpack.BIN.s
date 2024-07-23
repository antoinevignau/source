*-----------------
* BIN
*-----------------

BINwidth = 0
BINheight = 2

*---

unpBIN lda ptrBUFFER
 sta dpBUF
 lda ptrBUFFER+2
 sta dpBUF+2

 ldy #BINwidth
 lda [dpBUF],y
 inc
 sta picWIDTH

 ldy #BINheight
 lda [dpBUF],y
 inc
 sta picHEIGHT

 pha
 pha
 PushWord picWIDTH
 PushWord picHEIGHT
 _Multiply
 pla
 sta BINlength
 pla
 sta BINlength+2

 lda proOPEN+42
 sec
 sbc BINlength
 cmp #$0304
 beq unpBIN1
 _errFORMAT
unpBIN1 lda proOPEN+44
 sbc BINlength+2
 beq unpBIN2
 _errFORMAT

unpBIN2 jsr makePIC
 bcc unpBIN5
 rts

unpBIN5 ldx #$0000
 ldy #$0004
 jsr GSOSappend

 ldx #$0001
 ldy #$0000
 jsr GSOSread

*--- Routine de copie de l'image

 lda ptrBUFFER
 sta unpBIN6+1
 lda ptrBUFFER+1
 sta unpBIN6+2

 ldx #0
 txy

unpBIN6 ldal $012000,x
 and #$ff
 sta [dpPIC],y
 iny
 cpy picWIDTH
 beq unpBIN8
unpBIN7 inx
 bne unpBIN6

 sty BINdest
 ldx #$0001
 ldy #$0000
 jsr GSOSread
 ldx #0
 ldy BINdest
 bra unpBIN6

unpBIN8 rep #$20
 jsr showTHERMO
 inc numLIGNE
 lda numLIGNE
 cmp picHEIGHT
 bcs unpBIN10
 asl
 clc
 adc numLIGNE
 tay
 lda [dpLIGNES],y
 sta dpPIC
 iny
 iny
 lda [dpLIGNES],y
 sta dpPIC+2
 ldy #0
 bra unpBIN7

*--- Palette

unpBIN10 lda proOPEN+42
 sec
 sbc #$0300
 tay
 lda proOPEN+44
 sbc #0
 tax
 jsr GSOSappend

 ldx #$0000
 ldy #$0300
 jsr GSOSread

 jsr initPALETTE

 ldy #0
 tyx
]lp lda [dpBUF],y
 jsr savePALETTE
 iny
 lda [dpBUF],y
 jsr savePALETTE
 iny
 lda [dpBUF],y
 jsr savePALETTE
 iny
 inx
 cpx proREAD+12
 bne ]lp

 lda #8
 sta picBITS
 lda #1
 sta picPLANES
 lda #256
 sta picCOLORS
 clc
 rts

*--- Data

BINlength ds 4
BINdest ds 4

*----------------------------------------
* True Convert : Unpackers : BIN
*----------------------------------------

BINwidth = 0
BINheight = 2

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

 lda #8
 sta picBPP

 lda #256
 sta picCOL

*--------------

 pha
 pha
 PushWord picWIDTH
 PushWord picHEIGHT
 _Multiply
 pla
 sta BINlength
 pla
 sta BINlength+2

 lda proEOF
 sec
 sbc BINlength
 cmp #$0304
 beq unpBIN1
 _errFORMAT
unpBIN1 lda proEOF+2
 sbc BINlength+2
 beq unpBIN2
 _errFORMAT

unpBIN2 jsr makePIC
 bcc unpBIN5
 rts

unpBIN5 ldx #0
 ldy #4
 jsr GSOSappend

 ldx picPTR+2
 ldy picPTR
 jsr GSOSsetread

 ldx picLENGTH+2
 ldy picLENGTH
 jsr GSOSread

 clc
 rts

*--- Data

BINlength ds 4
BINdest ds 4

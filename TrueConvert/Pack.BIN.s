*-----------------
* BIN
*-----------------

packBIN lda fgALL ; CONVERT ALL
 beq packBIN1
 lda fgMODE ; MODE NONE?
 cmp #4
 bne packBIN1
 brl noneBIN

packBIN1 ldx #6
 ldy #0
 jsr GSOScreate
 bcc packBIN2
 rts
packBIN2 lda #319
 sta pkBIN
 lda #199
 sta pkBIN+2

 lda #pkBIN ; Entete
 sta proWRITE+4
 lda #^pkBIN
 sta proWRITE+6
 ldx #0
 ldy #4
 jsr GSOSwrite
 bcc packBIN3
 rts

packBIN3 lda menuSAVE1 ; 16 grey
 cmp #4
 bne packBIN4
 ldx ptrPIC16+2
 ldy ptrPIC16
 jsr changeRES
 bra packBIN10

packBIN4 cmp #3 ; 16 col
 bne packBIN5
 lda ptrPIC16
 clc
 adc #$8000
 tay
 lda ptrPIC16+2
 adc #0
 tax
 jsr changeRES
 bra packBIN10

packBIN5 cmp #2  ; 256 col
 bne packBIN6
 ldx ptrPIC256+2
 ldy ptrPIC256
 jsr changeRES
 bra packBIN10

packBIN6 jsr changeRES10 ; Image 3200

packBIN10 lda ptrBUFFER ; Sauve les points
 sta proWRITE+4
 lda ptrBUFFER+2
 sta proWRITE+6
 ldx #0
 ldy #64000
 jsr GSOSwrite
 bcc packBIN11
 rts
packBIN11 lda #pcPALETTE1 ; Sauve la palette
 sta proWRITE+4
 lda #^pcPALETTE1
 sta proWRITE+6
 ldx #0
 ldy #768
 jsr GSOSwrite
 rts

*--- Mode NONE

noneBIN lda picWIDTH
 dec
 sta pkBIN
 lda picHEIGHT
 dec
 sta pkBIN+2

 ldx #6
 ldy #0
 jsr GSOScreate
 bcc noneBIN1
 rts
noneBIN1 lda #pkBIN ; Entete
 sta proWRITE+4
 lda #^pkBIN
 sta proWRITE+6
 ldx #0
 ldy #4
 jsr GSOSwrite
 bcc noneBIN2
 rts

*---

noneBIN2 stz numLIGNE

noneBIN3 lda numLIGNE ; Les lignes
 asl
 clc
 adc numLIGNE
 tay
 lda [dpLIGNES],y
 sta proWRITE+4
 iny
 iny
 lda [dpLIGNES],y
 sta proWRITE+6

 ldx #0
 ldy picWIDTH
 jsr GSOSwrite
 bcc noneBIN4
 rts
noneBIN4 inc numLIGNE
 lda numLIGNE
 cmp picHEIGHT
 bne noneBIN3

 lda #pcPALETTE1 ; Palette
 sta proWRITE+4
 lda #^pcPALETTE1
 sta proWRITE+6

 ldx #0
 ldy #768
 jsr GSOSwrite
 rts

*--- Data BIN

pkBIN ds 2
 ds 2

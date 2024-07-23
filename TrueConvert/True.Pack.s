*----------------------------------------
* True Convert : Format Finder
*----------------------------------------

maxWIDTH = 1280
maxHEIGHT = 1024

*----------------------------------------

trueOPEN lda menuOPEN
 asl
 tax
trueOPEN1 jsr (ptrOPENERS,x)
 rts

*----------------------------------------

trueSAVE lda menuSAVE1
 asl
 tax
 jsr (ptrSAVERS,x)
 rts

*----------------------------------------

trueNONE clc
 rts

*----------------------------------------

makePICerr _errSIZE

makePIC lda picWIDTH
 beq makePICerr
 cmp #maxWIDTH
 bcs makePICerr

 lda picHEIGHT
 beq makePICerr
 cmp #maxHEIGHT
 bcs makePICerr

 pha  ; space for NewHandle
 pha

 pha ; space for Multiply
 pha

 lda picWIDTH ; set real size of line in bytes
 ldx picBPP
 cpx #8
 beq makePIC3
 asl
 clc
 adc picWIDTH
makePIC3 sta picBWIDTH

 pha
 PushWord picHEIGHT
 _Multiply
 lda 1,s
 sta picLENGTH
 lda 3,s
 sta picLENGTH+2

 PushWord myID
 PushWord #%11000000_00001100
 PushLong #0
 _NewHandle
 phd
 tsc
 tcd
 lda [3]
 sta picPTR
 ldy #2
 lda [3],y
 sta picPTR+2
 pld
 pla
 sta picHA
 pla
 sta picHA+2
 clc
 rts

*----------------------------------------

ptrOPENERS da trueNONE
 da unpGS
 da unpBMP
 da unpGIF
 da unpIFF
 da unpPCX
 da unpTIF
 da unpBIN
 da unpST
 da unpBMP
 da unpBMP
 da unpMAC

ptrSAVERS da trueNONE
 da packGS
 da packBMP
 da packPCX
 da packTIF
 da packBIN
 da packRAW

*----------------------------------------
* True Convert : Colors
*----------------------------------------

*----------------------------------------
* Transform picture into greyscales
*----------------------------------------

meGREYSCALES lda picBPP ; 8 BIT
 cmp #8
 bne meGREY24

 lda picPAL
 sta Debut
 lda picPAL+2
 sta Debut+2

 lda #768
 clc
 adc Debut
 sta Second
 lda #0
 adc Debut+2
 sta Second+2
 bra doGREY

meGREY24 lda picPTR ; 24 BIT
 sta Debut
 lda picPTR+2
 sta Debut+2

 pha
 pha
 PushLong picHA
 _GetHandleSize
 pla
 clc
 adc Debut
 sta Second
 pla
 adc Debut+2
 sta Second+2

*-------------- The core routine

doGREY jsr greyGET

 ldx greyR ; Calculate grey equivalent
 lda tblRED,x
 and #$ff
 sta greyRGB

 ldx greyG
 lda tblGREEN,x
 and #$ff
 clc
 adc greyRGB
 sta greyRGB

 ldx greyB
 lda tblBLUE,x
 and #$ff
 clc
 adc greyRGB
 sta greyRGB

 jsr greySET ; Write result

 lda Debut ; Check end of picture
 cmp Second
 bcc doGREY
 lda Debut+2
 cmp Second+2
 bcc doGREY
 clc
 rts

*-------------- Read source components

greyGET lda Debut
 sta Arrivee
 lda Debut+2
 sta Arrivee+2

 lda [Debut]
 and #$ff
 sta greyR
 inc Debut
 bne greyGET1
 inc Debut+2

greyGET1 lda [Debut]
 and #$ff
 sta greyG
 inc Debut
 bne greyGET2
 inc Debut+2

greyGET2 lda [Debut]
 and #$ff
 sta greyB
 inc Debut
 bne greyGET3
 inc Debut+2
greyGET3 rts

*-------------- Write output result

greySET lda greyRGB
 sta [Arrivee]
 inc Arrivee
 bne greySET1
 inc Arrivee+2

greySET1 sta [Arrivee]
 inc Arrivee
 bne greySET2
 inc Arrivee+2

greySET2 sep #$20
 sta [Arrivee]
 rep #$20
 rts

*--------------

greyRGB ds 2
greyR ds 2
greyG ds 2
greyB ds 2

*----------------------------------------
* Negative picture
*----------------------------------------

meNEGATIVE rts

*----------------------------------------
* Solarize picture
*----------------------------------------

meSOLARIZE rts

*----------------------------------------
* Table : r * 0.30 + g * 0.59 + b * 0.11
*----------------------------------------

tblRED HEX 00000000010101020202030303030404
 HEX 04050505060606060707070808080909
 HEX 09090A0A0A0B0B0B0C0C0C0C0D0D0D0E
 HEX 0E0E0F0F0F0F10101011111112121212
 HEX 13131314141415151515161616171717
 HEX 181818181919191A1A1A1B1B1B1B1C1C
 HEX 1C1D1D1D1E1E1E1E1F1F1F2020202121
 HEX 21212222222323232424242425252526
 HEX 2626272727272828282929292A2A2A2A
 HEX 2B2B2B2C2C2C2D2D2D2D2E2E2E2F2F2F
 HEX 30303030313131323232333333333434
 HEX 34353535363636363737373838383939
 HEX 39393A3A3A3B3B3B3C3C3C3C3D3D3D3E
 HEX 3E3E3F3F3F3F40404041414142424242
 HEX 43434344444445454545464646474747
 HEX 484848484949494A4A4A4B4B4B4B4C4C

tblGREEN HEX 00000101020203040405050607070808
 HEX 090A0A0B0B0C0C0D0E0E0F0F10111112
 HEX 121314141515161717181819191A1B1B
 HEX 1C1C1D1E1E1F1F202121222223232425
 HEX 25262627282829292A2B2B2C2C2D2E2E
 HEX 2F2F3030313232333334353536363738
 HEX 3839393A3B3B3C3C3D3D3E3F3F404041
 HEX 42424343444545464647474849494A4A
 HEX 4B4C4C4D4D4E4F4F5050515252535354
 HEX 5455565657575859595A5A5B5C5C5D5D
 HEX 5E5E5F60606161626363646465666667
 HEX 676869696A6A6B6B6C6D6D6E6E6F7070
 HEX 7171727373747475767677777878797A
 HEX 7A7B7B7C7D7D7E7E7F80808181828283
 HEX 848485858687878888898A8A8B8B8C8D
 HEX 8D8E8E8F8F9091919292939494959596

tblBLUE HEX 00000000000000000000010101010101
 HEX 01010102020202020202020203030303
 HEX 03030303030404040404040404040505
 HEX 05050505050505060606060606060606
 HEX 07070707070707070708080808080808
 HEX 08080909090909090909090A0A0A0A0A
 HEX 0A0A0A0A0B0B0B0B0B0B0B0B0B0B0C0C
 HEX 0C0C0C0C0C0C0C0D0D0D0D0D0D0D0D0D
 HEX 0E0E0E0E0E0E0E0E0E0F0F0F0F0F0F0F
 HEX 0F0F1010101010101010101111111111
 HEX 11111111121212121212121212131313
 HEX 13131313131314141414141414141415
 HEX 15151515151515151616161616161616
 HEX 16161717171717171717171818181818
 HEX 181818181919191919191919191A1A1A
 HEX 1A1A1A1A1A1A1B1B1B1B1B1B1B1B1B1C

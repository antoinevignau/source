*
* Sword of Sodan: the game
*
* (c) 1989, Discovery Software
* (s) 2018, Brutal Deluxe Software
*

         mx    %00
         typ   BIN
         org   $020000
         lst   off

*----------------------------

ptr000EBE	=	$000EBE	; see routines as from $70C0
ptr001000	=	$001000
ptr00118E	=	$00118E
ptr0012D0	=	$0012D0
ptr001400	=	$001400	; load buffer
ptr001800	=	$001800
ptr00198E	=	$00198E
ptr001AD0	=	$001AD0
ptr002000	=	$002000	; bank 00 SHR buffer
ptr00D000	=	$00D000	; blitter

*loadFILE	=	$0009F8	; load file
loadFILE	=	$000803	; new load file

*----------------------------
*
* $68: DEMO FLAG (0: NO, -1: YES, DEFAULT IS NO)
* $6A: LEVEL (1-10) - (LEVEL 0 IS DEMO LEVEL?)
* $7C: RANDOM NUMBER
* $8A: MASK
* $8C: STRENGTH (DEFAULT VALUE IS $50)
* $8E: STRENGTH (CURRENT)
* $92: SCORE (LOW)
* $94: SCORE (HIGH)
* $96: HITSTRENGTH (1-4)
* $98: LIVES (0-9, DEFAULT IS 5)
* $A0: MAGIC ZAPPER
* $A1: POWER SHIELD
* $A2: HITSTRENGTH INCREASED
* $A3: EXTRA LIFE
* $A4: REPLAY MODE FLAG (0: NO, -1: YES, DEFAULT IS NO)
* $D6: SOUND VOLUME (0-15)
* $DC: POINTER TO REPLAY BUFFER
* $E0: POINTER TO END POS OF REPLAY BUFFER
* $E4: MASK

*-----------------------------

L0000    DW    $0140
         DW    $0140
         DW    $0230
         DW    $0280
         DW    $0230
         DW    $0140
         DW    $0140
         DW    $0A00
         DW    $0500
         DW    $0140
         DW    $0140
L0016    ADRL  $00000000
L001A    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000

L002A    DW    $0000
         DA    L0040
         DW    $0000
         DA    L00F4
         DA    L0122
         DA    L01C0
         DA    L0212
         DA    L029A
         DW    $0000
         DA    L01C0
         DW    $0000
     
L0040    DW    $7EFC
         DW    $7EFC
         DW    $FFFF
         DW    $0010
         DW    $0001
         DW    $0028
         DW    $0002
         DW    $002E
         DW    $0001
         DW    $0046
         DW    $0002
         DW    $004C
         DW    $0001
         DW    $0064
         DW    $0002
         DW    $006A
         DW    $0001
         DW    $0082
         DW    $0002
         DW    $0088
         DW    $0001
         DW    $00A0
         DW    $0002
         DW    $00A6
         DW    $0001
         DW    $00BE
         DW    $0002
         DW    $00C4
         DW    $0001
         DW    $00DC
         DW    $0002
         DW    $00E2
         DW    $0001
         DW    $00FA
         DW    $0002
         DW    $0100
         DW    $0001
         DW    $0118
         DW    $0002
         DW    $011E
         DW    $0001
         DW    $0136
         DW    $0002
         DW    $013C
         DW    $0001
         DW    $0154
         DW    $0002
         DW    $015A
         DW    $0001
         DW    $0172
         DW    $0002
         DW    $0178
         DW    $0001
         DW    $0190
         DW    $0002
         DW    $0196
         DW    $0001
         DW    $01AE
         DW    $0002
         DW    $01B4
         DW    $0001
         DW    $01CC
         DW    $0002
         DW    $01D2
         DW    $0001
         DW    $01EA
         DW    $0002
         DW    $01F0
         DW    $0001
         DW    $0208
         DW    $0002
         DW    $020E
         DW    $0001
         DW    $0226
         DW    $0002
         DW    $022C
         DW    $0001
         DW    $0244
         DW    $0002
         DW    $024A
         DW    $0001
         DW    $0262
         DW    $0002
         DW    $0268
         DW    $0001
         DW    $0280
         DW    $0002
         DW    $0286
         DW    $0001
         DW    $FFFF
L00F4    DW    $24FC
         DW    $FFFF
         DW    $0023
         DW    $0001
         DW    $0073
         DW    $0001
         DW    $00D7
         DW    $0001
         DW    $0140
         DW    $0001
         DW    $01D6
         DW    $0001
         DW    $023A
         DW    $0001
         DW    $029E
         DW    $0001
         DW    $030C
         DW    $0001
         DW    $0384
         DW    $0001
         DW    $03E8
         DW    $0001
         DW    $FFFF
L0122    DW    $817C
         DW    $817C
         DW    $817C
         DW    $867C
         DW    $7BDC
         DW    $FFFF
         DW    $0019
         DW    $0001
         DW    $003C
         DW    $0002
         DW    $0064
         DW    $0005
         DW    $0096
         DW    $0002
         DW    $00AF
         DW    $0005
         DW    $00E1
         DW    $0001
         DW    $0109
         DW    $0002
         DW    $0140
         DW    $0005
         DW    $0159
         DW    $0001
         DW    $0172
         DW    $0002
         DW    $019F
         DW    $0005
         DW    $01B5
         DW    $0002
         DW    $01D1
         DW    $0005
         DW    $0203
         DW    $0001
         DW    $0258
         DW    $0002
         DW    $028A
         DW    $0002
         DW    $02B2
         DW    $0005
         DW    $02EE
         DW    $0005
         DW    $0311
         DW    $0001
         DW    $0339
         DW    $0002
         DW    $036B
         DW    $0002
         DW    $0381
         DW    $0005
         DW    $0031
         DW    $0003
         DW    $0054
         DW    $0004
         DW    $00AE
         DW    $0004
         DW    $00F9
         DW    $0003
         DW    $0121
         DW    $0004
         DW    $0171
         DW    $0003
         DW    $018A
         DW    $0004
         DW    $01CD
         DW    $0004
         DW    $021B
         DW    $0003
         DW    $0270
         DW    $0004
         DW    $02A2
         DW    $0004
         DW    $0329
         DW    $0003
         DW    $0351
         DW    $0004
         DW    $0383
         DW    $0004
         DW    $FFFF
L01C0    DW    $24FC
         DW    $24FC
         DW    $989E
         DW    $FFFF
         DW    $001E
         DW    $0001
         DW    $008C
         DW    $0001
         DW    $00FA
         DW    $0001
         DW    $0168
         DW    $0001
         DW    $01D6
         DW    $0001
         DW    $0244
         DW    $0001
         DW    $0036
         DW    $0002
         DW    $00A4
         DW    $0002
         DW    $0112
         DW    $0002
         DW    $0180
         DW    $0002
         DW    $01EE
         DW    $0002
         DW    $025C
         DW    $0002
         DW    $0034
         DW    $0003
         DW    $00A2
         DW    $0003
         DW    $0110
         DW    $0003
         DW    $017E
         DW    $0003
         DW    $01EC
         DW    $0003
         DW    $025A
         DW    $0003
         DW    $FFFF
L0212    DW    $24FC
         DW    $24FC
         DW    $24FC
         DW    $73BC
         DW    $73BC
         DW    $73BC
         DW    $FFFF
         DW    $0014
         DW    $0001
         DW    $0028
         DW    $0002
         DW    $003C
         DW    $0003
         DW    $005A
         DW    $0001
         DW    $006E
         DW    $0002
         DW    $0082
         DW    $0003
         DW    $00AA
         DW    $0001
         DW    $00BE
         DW    $0002
         DW    $00D2
         DW    $0003
         DW    $00F8
         DW    $0001
         DW    $010C
         DW    $0002
         DW    $0120
         DW    $0003
         DW    $0136
         DW    $0001
         DW    $014A
         DW    $0002
         DW    $015E
         DW    $0003
         DW    $0186
         DW    $0001
         DW    $019A
         DW    $0002
         DW    $01AE
         DW    $0003
         DW    $01C2
         DW    $0001
         DW    $01D6
         DW    $0002
         DW    $01EA
         DW    $0003
         DW    $0018
         DW    $0004
         DW    $002C
         DW    $0005
         DW    $0040
         DW    $0006
         DW    $004E
         DW    $0004
         DW    $0062
         DW    $0005
         DW    $0076
         DW    $0006
         DW    $01E0
         DW    $0004
         DW    $01F4
         DW    $0005
         DW    $0208
         DW    $0006
         DW    $FFFF
L029A    DW    $24FC
         DW    $24FC
         DW    $24FC
         DW    $73BC
         DW    $73BC
         DW    $73BC
         DW    $FFFF
         DW    $00AA
         DW    $0001
         DW    $00BE
         DW    $0002
         DW    $00D2
         DW    $0003
         DW    $0104
         DW    $0001
         DW    $0118
         DW    $0002
         DW    $012C
         DW    $0003
         DW    $013C
         DW    $0001
         DW    $0150
         DW    $0002
         DW    $0164
         DW    $0003
         DW    $0187
         DW    $0001
         DW    $019B
         DW    $0002
         DW    $01AF
         DW    $0003
         DW    $01F0
         DW    $0001
         DW    $0204
         DW    $0002
         DW    $0218
         DW    $0003
         DW    $025E
         DW    $0001
         DW    $0272
         DW    $0002
         DW    $0286
         DW    $0003
         DW    $0296
         DW    $0001
         DW    $02AA
         DW    $0002
         DW    $02BE
         DW    $0003
         DW    $00BB
         DW    $0004
         DW    $00CF
         DW    $0005
         DW    $00E3
         DW    $0006
         DW    $0136
         DW    $0004
         DW    $014A
         DW    $0005
         DW    $015E
         DW    $0006
         DW    $016D
         DW    $0004
         DW    $0181
         DW    $0005
         DW    $0195
         DW    $0006
         DW    $0207
         DW    $0004
         DW    $021B
         DW    $0005
         DW    $022F
         DW    $0006
         DW    $0366
         DW    $0001
         DW    $037A
         DW    $0002
         DW    $038E
         DW    $0003
         DW    $03C0
         DW    $0001
         DW    $03D4
         DW    $0002
         DW    $03E8
         DW    $0003
         DW    $03F8
         DW    $0001
         DW    $040C
         DW    $0002
         DW    $0420
         DW    $0003
         DW    $0443
         DW    $0001
         DW    $0457
         DW    $0002
         DW    $046B
         DW    $0003
         DW    $04AC
         DW    $0001
         DW    $04C0
         DW    $0002
         DW    $04D4
         DW    $0003
         DW    $0377
         DW    $0004
         DW    $038B
         DW    $0005
         DW    $039F
         DW    $0006
         DW    $03F2
         DW    $0004
         DW    $0406
         DW    $0005
         DW    $041A
         DW    $0006
         DW    $0429
         DW    $0004
         DW    $043D
         DW    $0005
         DW    $0451
         DW    $0006
         DW    $04C3
         DW    $0004
         DW    $04D7
         DW    $0005
         DW    $04EB
         DW    $0006
         DW    $FFFF
L039A    ADRL  $00000000
L039E    DS    $20
L03BE    DS    $20
L03DE    DS    $20
L03FE    DS    $20
L041E    DS    $20
L043E    DW    $0000
L0440    DS    $40
L0480    DS    $40
L04C0    DS    $40
L0500    DS    $40

L0540    DA    $0000	; 0 - 
         DA    L0556	; 1 - 
         DA    $0000	; 2 - 
         DA    L0858	; 3 - 
         DA    $0000	; 4 - 
         DA    L087E	; 5 - 
         DA    $0000	; 6 - 
         DA    L08CA	; 7 - 
         DA    L0F52	; 8 - 
         DA    L0FB8	; 9 - 
         DA    $0000	; A - 

L0556    DW    $0000
         DW    $0004
         DW    $0018
         DW    $0000
         DW    $00C8
         DW    $0004
         DW    $0018
         DW    $0000
         DW    $00C8
         DW    $0004
         DW    $0018
         DW    $004E
         DW    $00C8
         DW    $0004
         DW    $0018
         DW    $003C
         DW    $00C8
         DW    $0004
         DW    $0018
         DW    $0024
         DW    $00C8
         DW    $FFFF
         DW    $0001
         DW    $0008
         DW    $8FDC
         DW    $0001
         DW    $8FDC
         DW    $0001
         DW    $871C
         DW    $0002
         DW    $871C
         DW    $0002
         DW    $79FC
         DW    $8003
         DW    $79FC
         DW    $8003
         DW    $6EBC
         DW    $8004
         DW    $6EBC
         DW    $8004
         DW    $5DDC
         DW    $8005
         DW    $5DDC
         DW    $8005
         DW    $6EBC
         DW    $8004
         DW    $6EBC
         DW    $8004
         DW    $79FC
         DW    $8003
         DW    $79FC
         DW    $8003
         DW    $871C
         DW    $0002
         DW    $871C
         DW    $0002
         DW    $8FDC
         DW    $0001
         DW    $8FDC
         DW    $0001
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $FFFF
         DW    $0001
         DW    $0008
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $8FDC
         DW    $0001
         DW    $8FDC
         DW    $0001
         DW    $871C
         DW    $0002
         DW    $871C
         DW    $0002
         DW    $79FC
         DW    $8003
         DW    $79FC
         DW    $8003
         DW    $6EBC
         DW    $8004
         DW    $6EBC
         DW    $8004
         DW    $5DDC
         DW    $8005
         DW    $5DDC
         DW    $8005
         DW    $6EBC
         DW    $8004
         DW    $6EBC
         DW    $8004
         DW    $79FC
         DW    $8003
         DW    $79FC
         DW    $8003
         DW    $871C
         DW    $0002
         DW    $871C
         DW    $0002
         DW    $8FDC
         DW    $0001
         DW    $8FDC
         DW    $0001
         DW    $FFFF
         DW    $0001
         DW    $0008
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $8FDC
         DW    $0001
         DW    $8FDC
         DW    $0001
         DW    $871C
         DW    $0002
         DW    $871C
         DW    $0002
         DW    $79FC
         DW    $8003
         DW    $79FC
         DW    $8003
         DW    $6EBC
         DW    $8004
         DW    $6EBC
         DW    $8004
         DW    $5DDC
         DW    $8005
         DW    $5DDC
         DW    $8005
         DW    $6EBC
         DW    $8004
         DW    $6EBC
         DW    $8004
         DW    $79FC
         DW    $8003
         DW    $79FC
         DW    $8003
         DW    $871C
         DW    $0002
         DW    $871C
         DW    $0002
         DW    $8FDC
         DW    $0001
         DW    $8FDC
         DW    $0001
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $FFFF
         DW    $0001
         DW    $0008
         DW    $8FDC
         DW    $0001
         DW    $8FDC
         DW    $0001
         DW    $871C
         DW    $0002
         DW    $871C
         DW    $0002
         DW    $79FC
         DW    $8003
         DW    $79FC
         DW    $8003
         DW    $6EBC
         DW    $8004
         DW    $6EBC
         DW    $8004
         DW    $5DDC
         DW    $8005
         DW    $5DDC
         DW    $8005
         DW    $6EBC
         DW    $8004
         DW    $6EBC
         DW    $8004
         DW    $79FC
         DW    $8003
         DW    $79FC
         DW    $8003
         DW    $871C
         DW    $0002
         DW    $871C
         DW    $0002
         DW    $8FDC
         DW    $0001
         DW    $8FDC
         DW    $0001
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $FFFF
         DW    $0000
         DW    $8080
         DW    $0001
         DW    $0000
         DW    $8FDC
         DW    $8501
         DW    $871C
         DW    $8002
         DW    $79FC
         DW    $8003
         DW    $6EBC
         DW    $8004
         DW    $5DDC
         DW    $8705
         DW    $5DDC
         DW    $8005
         DW    $5DDC
         DW    $8005
         DW    $5DDC
         DW    $8005
         DW    $5DDC
         DW    $8005
         DW    $5DDC
         DW    $0005
         DW    $5DDC
         DW    $0005
         DW    $5DDC
         DW    $0005
         DW    $5DDC
         DW    $0005
         DW    $5DDC
         DW    $0005
         DW    $5DDC
         DW    $0005
         DW    $5DDC
         DW    $0005
         DW    $5DDC
         DW    $0005
         DW    $5DDC
         DW    $0005
         DW    $5DDC
         DW    $0005
         DW    $5DDC
         DW    $0005
         DW    $5DDC
         DW    $0005
         DW    $6EBC
         DW    $0004
         DW    $6EBC
         DW    $0004
         DW    $79FC
         DW    $0003
         DW    $79FC
         DW    $0003
         DW    $871C
         DW    $0002
         DW    $871C
         DW    $0002
         DW    $8FDC
         DW    $0001
         DW    $8FDC
         DW    $0001
         DW    $EEEE
         DW    $0000
         DW    $FFFF
         DW    $FFFF
         DW    $005A
         DW    $0001
         DW    $008E
         DW    $0002
         DW    $00C4
         DW    $0001
         DW    $00F8
         DW    $0002
         DW    $012E
         DW    $0001
         DW    $01DE
         DW    $0003
         DW    $01E8
         DW    $0003
         DW    $01F2
         DW    $0003
         DW    $023C
         DW    $0004
         DW    $0246
         DW    $0004
         DW    $0250
         DW    $0004
         DW    $0200
         DW    $0005
         DW    $0216
         DW    $0005
         DW    $022C
         DW    $0005
         DW    $FFFF
L0858    DW    $FFFF
         DW    $FFFF
         DW    $0001
         DW    $0000
         DW    $821C
         DW    $0001
         DW    $821C
         DW    $0001
         DW    $821C
         DW    $0002
         DW    $821C
         DW    $0002
         DW    $FFFF
         DW    $FFFF
         DW    $00B0
         DW    $0001
         DW    $0330
         DW    $0001
         DW    $FFFF
L087E    DW    $FFFF
         DW    $FFFF
         DW    $0001
         DW    $0000
         DW    $41BC
         DW    $0001
         DW    $41BC
         DW    $0001
         DW    $41BC
         DW    $0002
         DW    $41BC
         DW    $0002
         DW    $41BC
         DW    $0003
         DW    $41BC
         DW    $0003
         DW    $FFFF
         DW    $0001
         DW    $0000
         DW    $3CBC
         DW    $0006
         DW    $3CBC
         DW    $0006
         DW    $3CBC
         DW    $0004
         DW    $3CBC
         DW    $0004
         DW    $3CBC
         DW    $0005
         DW    $3CBC
         DW    $0005
         DW    $FFFF
         DW    $FFFF
         DW    $0080
         DW    $0001
         DW    $0128
         DW    $0002
         DW    $FFFF
L08CA    DW    $0000
         DW    $000A
         DW    $0019
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $0019
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $000F
         DW    $0000
         DW    $00C8
         DW    $000A
         DW    $0019
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $0019
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $000F
         DW    $0000
         DW    $00C8
         DW    $000A
         DW    $0019
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $0019
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $000F
         DW    $0000
         DW    $00C8
         DW    $000A
         DW    $0019
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $0019
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $000F
         DW    $0000
         DW    $00C8
         DW    $000A
         DW    $0019
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $0019
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $000F
         DW    $0000
         DW    $00C8
         DW    $000A
         DW    $0019
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $0019
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $000F
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $001E
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $001E
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $001E
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $001E
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $001E
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $001E
         DW    $0000
         DW    $00C8
         DW    $FFFF
         DW    $0001
         DW    $0018
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0004
         DW    $24FC
         DW    $0007
         DW    $24FC
         DW    $800A
         DW    $24FC
         DW    $800D
         DW    $24FC
         DW    $8010
         DW    $24FC
         DW    $8110
         DW    $24FC
         DW    $8010
         DW    $24FC
         DW    $800D
         DW    $24FC
         DW    $800A
         DW    $24FC
         DW    $0007
         DW    $24FC
         DW    $0004
         DW    $24FC
         DW    $0001
         DW    $FFFF
         DW    $0001
         DW    $0018
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0005
         DW    $24FC
         DW    $0008
         DW    $24FC
         DW    $800B
         DW    $24FC
         DW    $800E
         DW    $24FC
         DW    $8011
         DW    $24FC
         DW    $8011
         DW    $24FC
         DW    $8011
         DW    $24FC
         DW    $800E
         DW    $24FC
         DW    $800B
         DW    $24FC
         DW    $0008
         DW    $24FC
         DW    $0005
         DW    $24FC
         DW    $0002
         DW    $FFFF
         DW    $0001
         DW    $0018
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0006
         DW    $24FC
         DW    $0009
         DW    $24FC
         DW    $800C
         DW    $24FC
         DW    $800F
         DW    $24FC
         DW    $8012
         DW    $24FC
         DW    $8012
         DW    $24FC
         DW    $8012
         DW    $24FC
         DW    $800F
         DW    $24FC
         DW    $800C
         DW    $24FC
         DW    $0009
         DW    $24FC
         DW    $0006
         DW    $24FC
         DW    $0003
         DW    $FFFF
         DW    $0001
         DW    $0018
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0001
         DW    $24FC
         DW    $0004
         DW    $24FC
         DW    $0007
         DW    $24FC
         DW    $800A
         DW    $24FC
         DW    $800D
         DW    $24FC
         DW    $8010
         DW    $24FC
         DW    $8110
         DW    $24FC
         DW    $8010
         DW    $24FC
         DW    $800D
         DW    $24FC
         DW    $800A
         DW    $24FC
         DW    $0007
         DW    $24FC
         DW    $0004
         DW    $24FC
         DW    $0001
         DW    $FFFF
         DW    $0001
         DW    $0018
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0002
         DW    $24FC
         DW    $0005
         DW    $24FC
         DW    $0008
         DW    $24FC
         DW    $800B
         DW    $24FC
         DW    $800E
         DW    $24FC
         DW    $8011
         DW    $24FC
         DW    $8011
         DW    $24FC
         DW    $8011
         DW    $24FC
         DW    $800E
         DW    $24FC
         DW    $800B
         DW    $24FC
         DW    $0008
         DW    $24FC
         DW    $0005
         DW    $24FC
         DW    $0002
         DW    $FFFF
         DW    $0001
         DW    $0018
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0003
         DW    $24FC
         DW    $0006
         DW    $24FC
         DW    $0009
         DW    $24FC
         DW    $800C
         DW    $24FC
         DW    $800F
         DW    $24FC
         DW    $8012
         DW    $24FC
         DW    $8012
         DW    $24FC
         DW    $8012
         DW    $24FC
         DW    $800F
         DW    $24FC
         DW    $800C
         DW    $24FC
         DW    $0009
         DW    $24FC
         DW    $0006
         DW    $24FC
         DW    $0003
         DW    $FFFF
         DW    $0001
         DW    $0080
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $6C3C
         DW    $0013
         DW    $6C3C
         DW    $0013
         DW    $6C3C
         DW    $0013
         DW    $6C3C
         DW    $0013
         DW    $6C3C
         DW    $0013
         DW    $6C3C
         DW    $0314
         DW    $6C3C
         DW    $0015
         DW    $6C3C
         DW    $8016
         DW    $6C3C
         DW    $8017
         DW    $6C3C
         DW    $8017
         DW    $6C3C
         DW    $8216
         DW    $6C3C
         DW    $0015
         DW    $6C3C
         DW    $0014
         DW    $6C3C
         DW    $0013
         DW    $FFFF
         DW    $0001
         DW    $0080
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $6C3C
         DW    $0013
         DW    $6C3C
         DW    $0013
         DW    $6C3C
         DW    $0013
         DW    $6C3C
         DW    $0013
         DW    $6C3C
         DW    $0013
         DW    $6C3C
         DW    $0314
         DW    $6C3C
         DW    $0015
         DW    $6C3C
         DW    $8016
         DW    $6C3C
         DW    $8017
         DW    $6C3C
         DW    $8017
         DW    $6C3C
         DW    $8216
         DW    $6C3C
         DW    $0015
         DW    $6C3C
         DW    $0014
         DW    $6C3C
         DW    $0013
         DW    $FFFF
         DW    $0001
         DW    $0000
         DW    $925C
         DW    $0019
         DW    $925C
         DW    $0019
         DW    $925C
         DW    $001B
         DW    $925C
         DW    $001B
         DW    $925C
         DW    $001D
         DW    $925C
         DW    $001D
         DW    $FFFF
         DW    $0001
         DW    $0000
         DW    $925C
         DW    $001A
         DW    $925C
         DW    $001A
         DW    $925C
         DW    $001C
         DW    $925C
         DW    $001C
         DW    $925C
         DW    $001E
         DW    $925C
         DW    $001E
         DW    $FFFF
         DW    $FFFF
         DW    $00FA
         DW    $0001
         DW    $012A
         DW    $0002
         DW    $015A
         DW    $0003
         DW    $01C2
         DW    $0004
         DW    $01F2
         DW    $0005
         DW    $0222
         DW    $0006
         DW    $0064
         DW    $0007
         DW    $0096
         DW    $0008
         DW    $0258
         DW    $0009
         DW    $0288
         DW    $000A
         DW    $02B8
         DW    $0009
         DW    $02E8
         DW    $000A
         DW    $0318
         DW    $0009
         DW    $0348
         DW    $000A
         DW    $0378
         DW    $0009
         DW    $03A8
         DW    $000A
         DW    $03D8
         DW    $0009
         DW    $0408
         DW    $000A
         DW    $FFFF
L0F52    DW    $FFFF
         DW    $FFFF
         DW    $0001
         DW    $0000
         DW    $3ADC
         DW    $0001
         DW    $3ADC
         DW    $0001
         DW    $3ADC
         DW    $0002
         DW    $3ADC
         DW    $0002
         DW    $3ADC
         DW    $0003
         DW    $3ADC
         DW    $0003
         DW    $FFFF
         DW    $FFFF
         DW    $0056
         DW    $0001
         DW    $00F4
         DW    $0001
         DW    $0196
         DW    $0001
         DW    $0234
         DW    $0001
         DW    $02D6
         DW    $0001
         DW    $0374
         DW    $0001
         DW    $0416
         DW    $0001
         DW    $04B4
         DW    $0001
         DW    $0556
         DW    $0001
         DW    $05F4
         DW    $0001
         DW    $0696
         DW    $0001
         DW    $0734
         DW    $0001
         DW    $07D6
         DW    $0001
         DW    $0874
         DW    $0001
         DW    $0916
         DW    $0001
         DW    $09B4
         DW    $0001
         DW    $FFFF
L0FB8    DW    $FFFF
         DW    $FFFF
         DW    $0001
         DW    $0000
         DW    $41BC
         DW    $0001
         DW    $41BC
         DW    $0001
         DW    $41BC
         DW    $0002
         DW    $41BC
         DW    $0002
         DW    $41BC
         DW    $0003
         DW    $41BC
         DW    $0003
         DW    $FFFF
         DW    $0001
         DW    $0000
         DW    $3CBC
         DW    $0006
         DW    $3CBC
         DW    $0006
         DW    $3CBC
         DW    $0004
         DW    $3CBC
         DW    $0004
         DW    $3CBC
         DW    $0005
         DW    $3CBC
         DW    $0005
         DW    $FFFF
         DW    $FFFF
         DW    $0080
         DW    $0001
         DW    $0128
L1000    DW    $0002
         DW    $FFFF
L1004    ADRL  $00000000
L1008    DW    $0000
L100A    DW    $0000
L100C    DW    $0000
L100E    DW    $0000
L1010    DS    $10
L1020    DS    $10
L1030    DS    $10
L1040    DS    $10
L1050    DS    $10
L1060    DS    $10
L1070    DS    $10
L1080    DS    $10
L1090    DS    $10
L10A0    DS    $10
L10B0    DS    $10
L10C0    DS    $10
L10D0    DS    $10
L10E0    DS    $10
L10F0    DS    $10
L1100    DS    $10
L1110    DS    $10
L1120    DS    $10
L1130    DS    $10
L1140    DS    $10
L1150    DS    $10

L1160    DA    $0000	; 0 - 
         DA    $0000	; 1 - 
         DA    L1176	; 2 - 
         DA    $0000	; 3 - 
         DA    L11B8	; 4 - 
         DA    $0000	; 5 - 
         DA    L1212	; 6 - 
         DA    $0000	; 7 - 
         DA    $0000	; 8 - 
         DA    $0000	; 9 - 
         DA    L12AE	; A - 

L1176    DW    $009B
         DW    $8009
         DW    $000A
         DW    $0023
         DW    $0046
         DW    $00C8
         DW    $0008
         DW    $0016
         DW    $0001
         DW    $FFF9
         DW    $0000
         DW    $0002
         DW    $FFF9
         DW    $0000
         DW    $0003
         DW    $FFF9
         DW    $0000
         DW    $0004
         DW    $FFF9
         DW    $0000
         DW    $FFFF
         DW    $FFFF
         DW    $0003
         DW    $0002
         DW    $0002
         DW    $0002
         DW    $1800
         DW    $0244
         DW    $0001
         DW    $0000
         DW    $00C8
         DW    $0001
         DW    $FFFF
L11B8    DW    $00A5
         DW    $FFFF
         DW    $000F
         DW    $0023
         DW    $0046
         DW    $00C8
         DW    $0008
         DW    $0012
         DW    $0001
         DW    $FFF8
         DW    $0000
         DW    $0002
         DW    $FFF8
         DW    $0000
         DW    $0003
         DW    $FFF8
         DW    $0000
         DW    $0004
         DW    $FFF8
         DW    $0000
         DW    $FFFF
         DW    $005A
         DW    $FFFF
         DW    $000F
         DW    $0023
         DW    $0000
         DW    $005A
         DW    $0008
         DW    $0020
         DW    $0005
         DW    $FFFB
         DW    $0000
         DW    $FFFF
         DW    $FFFF
         DW    $0004
         DW    $0002
         DW    $0008
         DW    $0002
         DW    $1400
         DW    $0294
         DW    $0001
         DW    $0000
         DW    $00C8
         DW    $0001
         DW    $FFFF
L1212    DW    $0063
         DW    $FFFF
         DW    $000F
         DW    $0023
         DW    $0032
         DW    $00C8
         DW    $0010
         DW    $0020
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $FFFB
         DW    $0000
         DW    $0002
         DW    $FFFB
         DW    $FFF6
         DW    $0003
         DW    $FFFD
         DW    $FFF6
         DW    $0004
         DW    $0003
         DW    $FFF6
         DW    $0005
         DW    $0005
         DW    $FFFB
         DW    $0006
         DW    $0005
         DW    $0005
         DW    $0007
         DW    $0003
         DW    $000A
         DW    $0008
         DW    $FFFD
         DW    $000A
         DW    $0009
         DW    $FFFB
         DW    $0005
         DW    $0001
         DW    $FFF8
         DW    $0005
         DW    $0001
         DW    $FFF8
         DW    $0000
         DW    $0001
         DW    $FFF8
         DW    $0000
         DW    $0001
         DW    $FFF8
         DW    $0000
         DW    $0001
         DW    $FFF8
         DW    $0000
         DW    $0001
         DW    $FFF8
         DW    $0000
         DW    $0001
         DW    $FFF8
         DW    $0000
         DW    $0001
         DW    $FFFB
         DW    $0000
         DW    $0001
         DW    $FFFE
         DW    $0000
         DW    $00FE
         DW    $0000
         DW    $0000
         DW    $FFFF
         DW    $FFFF
         DW    $0004
         DW    $0000
         DW    $0004
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $FFFF
L12AE    DW    $0078
         DW    $0008
         DW    $000F
         DW    $0023
         DW    $003C
         DW    $00C8
         DW    $0010
         DW    $001E
         DW    $0005
         DW    $FFF9
         DW    $0000
         DW    $FFFF
         DW    $0078
         DW    $0008
         DW    $000F
         DW    $0023
         DW    $003C
L12D0    DW    $00C8
         DW    $0010
         DW    $001E
         DW    $0006
         DW    $FFF4
         DW    $0000
         DW    $FFFF
         DW    $0078
         DW    $0008
         DW    $000F
         DW    $0023
         DW    $003C
         DW    $00C8
         DW    $0010
         DW    $001E
         DW    $0001
         DW    $FFF4
         DW    $0000
         DW    $0002
         DW    $FFF4
         DW    $0000
         DW    $0003
         DW    $FFF4
         DW    $0000
         DW    $0004
         DW    $FFF4
         DW    $0000
         DW    $0003
         DW    $FFF4
         DW    $0000
         DW    $0002
         DW    $FFF4
         DW    $0000
         DW    $FFFF
         DW    $0043
         DW    $FFFF
         DW    $000F
         DW    $0023
         DW    $0032
         DW    $00C8
         DW    $8018
         DW    $0020
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $0007
         DW    $FFF8
         DW    $0000
         DW    $00FE
         DW    $0000
         DW    $0000
         DW    $FFFF
         DW    $FFFF
         DW    $0004
         DW    $0000
         DW    $0008
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $FFFF
L13B6    ADRL  $00000000
L13BA    DW    $0000

L13BC    DA    L13D2	; 0 - 
         DA    $0000	; 1 - 
         DA    $0000	; 2 - 
         DA    $0000	; 3 - 
         DA    L13D6	; 4 - 
         DA    $0000	; 5 - 
         DA    $0000	; 6 - 
         DA    $0000	; 7 - 
         DA    $0000	; 8 - 
         DA    $0000	; 9 - 
         DA    $0000	; A - 

L13D2    DW    $2514	; TO
         DW    $0138	; FROM
L13D6    DW    $43B4	; TO
         DW    $021E	; FROM

L13DA    DW    $0000
L13DC    DW    $0000
L13DE    DW    $0000

L13E0    DA    L13F6	; 0 - 
         DA    L1402	; 1 - 
         DA    L1440	; 2 - 
         DA    L1488	; 3 - 
         DA    L149E	; 4 - 
         DA    L14BE	; 5 - 
         DA    $0000	; 6 - 
         DA    L14CA	; 7 - 
         DA    L1580	; 8 - 
         DA    L15C8	; 9 - 
         DA    L15D4	; A - 
L13F6    DW    $0088
         DW    $0280
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $FFFF
L1402    DW    $00E0
         DW    $8580
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $00E8
         DW    $8500
         DW    $0014
         DW    $0004
         DW    $0001
         DW    $00F0
         DW    $8500
         DW    $0014
         DW    $0004
         DW    $0001
         DW    $00F8
         DW    $8500
         DW    $0014
         DW    $0004
         DW    $0001
         DW    $0100
         DW    $8500
         DW    $0014
         DW    $0004
         DW    $0001
         DW    $0108
         DW    $8580
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FFFF
L1440    DW    $0010
         DW    $0100
         DW    $0001
         DW    $000C
         DW    $8820
         DW    $0060
         DW    $0200
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0068
         DW    $0380
         DW    $0000
         DW    $1C00
         DW    $0000
         DW    $0180
         DW    $0380
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $F200
         DW    $0000
         DW    $0000
         DW    $00F0
         DW    $00A0
         DW    $F180
         DW    $00A0
         DW    $0050
         DW    $00A0
         DW    $0140
         DW    $F100
         DW    $00A0
         DW    $00F0
         DW    $00A0
         DW    $FFFF
L1488    DW    $00A0
         DW    $F180
         DW    $00A0
         DW    $0000
         DW    $00A0
         DW    $0140
         DW    $F180
         DW    $00A0
         DW    $00A0
         DW    $00A0
         DW    $FFFF
L149E    DW    $0000
         DW    $F200
         DW    $0000
         DW    $0000
         DW    $00F0
         DW    $00A0
         DW    $F180
         DW    $00A0
         DW    $0050
         DW    $00A0
         DW    $0140
         DW    $F100
         DW    $00A0
         DW    $00F0
         DW    $00A0
         DW    $FFFF
L14BE    DW    $0010
         DW    $0100
         DW    $0001
         DW    $0002
         DW    $0020
         DW    $FFFF
L14CA    DW    $00A0
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $0140
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $00F8
         DW    $8400
         DW    $0000
         DW    $0007
         DW    $0001
         DW    $0100
         DW    $8400
         DW    $0000
         DW    $0007
         DW    $0000
         DW    $0108
         DW    $8480
         DW    $FFFF
         DW    $0000
         DW    $0000
         DW    $01E0
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $0280
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $0320
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $03C0
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $0460
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $0500
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $05A0
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $0640
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $06E0
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $0780
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $0820
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $08C0
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $0960
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $FFFF
L1580    DW    $00A0
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $0140
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $01E0
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $0280
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $0320
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $03C0
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $0460
         DW    $F000
         DW    $00A0
         DW    $0000
         DW    $0000
         DW    $FFFF
L15C8    DW    $0010
         DW    $0100
         DW    $0001
         DW    $0002
         DW    $0020
         DW    $FFFF
L15D4    DW    $0068
         DW    $0400
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0070
         DW    $0400
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0078
         DW    $0400
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0080
         DW    $0400
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FFFF

*
* Text sprites tables
*

L15FE    ADRL  $00000000
L1602    ADRL  $00000000
L1606    ADRL  $00000000
L160A    ADRL  $00000000
L160E    ADRL  $00000000
L1612    ADRL  $00000000
L1616    ADRL  $00000000
L161A    ADRL  $00000000
L161E    ADRL  $00000000
L1622    ADRL  $00000000
L1626    ADRL  $00000000
L162A    ADRL  $00000000
L162E    ADRL  $00000000
L1632    ADRL  $00000000
L1636    ADRL  $00000000
L163A    ADRL  $00000000
L163E    DW    $0000
L1640    DW    $0000
L1642    DW    $0000
L1644    DW    $0000
L1646    DW    $0000
L1648    DW    $0000
L164A    DW    $0000
L164C    DW    $0000
L164E    DW    $0000
L1650    DW    $0000
L1652    DW    $0000
L1654    DW    $0000
L1656    DW    $0000
L1658    DW    $0000
L165A    DW    $0000
L165C    DW    $0000
L165E    DW    $0000
L1660    DW    $0000

L1662    DA    L16A2	; 0 - 
         DA    L170A	; 1 - 
         DA    L1772	; 2 - 
         DA    L1884	; 3 - 
         DA    L1894	; 4 - 
         DA    L1968	; 5 - 
         DA    L1A08	; 6 - 
         DA    L1A16	; 7 - 
         DA    L1A80	; 8 - 
         DA    L1A8E	; 9 - 

L1676    DA    L1A9C	; 0 - 
         DA    L1B14	; 1 - 
         DA    L1BA2	; 2 - 
         DA    L1C70	; 3 - 
         DA    L1D04	; 4 - 
         DA    L1DBC	; 5 - 
         DA    L1E24	; 6 - 
         DA    L1F0A	; 7 - 
         DA    L1FDE	; 8 - 
         DA    L2060	; 9 - 
         DA    L20C8	; A - 

L168C    DA    L1A9C	; 0 - 
         DA    L1B14	; 1 - 
         DA    L1BA2	; 2 - 
         DA    L1C70	; 3 - 
         DA    L1D04	; 4 - 
         DA    L1DBC	; 5 - 
         DA    L1E24	; 6 - 
         DA    L1F0A	; 7 - 
         DA    L1FDE	; 8 - 
         DA    L2060	; 9 - 
         DA    L20C8	; A - 

*
* COMMANDS:
*  $8000: MAKE SPRITE FROM DATA
*  $8040: CONTINUE SPRITE, AND MASK
*  $8080: CONTINUE SPRITE, KEEP MASK
*  $8100: MAKE SPRITE FROM TEXT STRING
*  $8180: SET FONT PARMS
*  $8200: PREPARE MAIN SOUND
*  $8280: PREPARE LEVEL SOUND
*  $FFFF: END OF TABLE
*

L16A2    DW    $0000	; FILE TO LOAD
         DW    $0002	;  H0A H0B SPRITES
         DW    $8000	; MAKE SPRITE
         ADRL  $00030000	; SPRITE CODE ADDRESS
         DA    L3F38	; STORE POINTER ADDRESS
         DW    $0014	; NUMBER OF SPRITES
         DW    $001E	; WIDTH IN BYTES
         DW    $003C	; HEIGHT
         DW    $0020	; WIDTH IN BYTES
         DW    $003C	; ...
         DW    $0020
         DW    $003B
         DW    $0024
         DW    $0077
         DW    $0026
         DW    $0078
         DW    $002A
         DW    $003D
         DW    $002E
         DW    $0078
         DW    $0020
         DW    $0078
         DW    $0020
         DW    $002D
         DW    $001C
         DW    $003D
         DW    $0018
         DW    $003C
         DW    $0020
         DW    $0077
         DW    $002C
         DW    $000A
         DW    $0024
         DW    $0064
         DW    $002A
         DW    $0063
         DW    $0028
         DW    $0063
         DW    $0020
         DW    $0066
         DW    $001E
         DW    $0077
         DW    $0034
         DW    $004D
         DW    $003C
         DW    $0020
         DW    $0001	;  FILE TO LOAD
         DW    $0006	;  H0.SND
         DW    $8200	;  PREPARE MAIN SOUND
         DW    $0001	;  OFFSET
         DW    $FFFF	;  END OF DATA

L170A    DW    $0005
         DW    $0002
         DW    $8000
         ADRL  $00030000
         DA    L3F38
         DW    $0014
         DW    $001E
         DW    $0039
         DW    $001E
         DW    $0038
         DW    $001A
         DW    $0038
         DW    $0020
         DW    $0071
         DW    $0020
         DW    $0072
         DW    $0028
         DW    $0038
         DW    $002C
         DW    $0073
         DW    $001E
         DW    $0073
         DW    $0020
         DW    $002C
         DW    $001C
         DW    $003A
         DW    $0018
         DW    $003A
         DW    $001E
         DW    $0073
         DW    $0026
         DW    $0007
         DW    $0024
         DW    $0061
         DW    $0028
         DW    $0061
         DW    $0028
         DW    $0061
         DW    $0020
         DW    $0060
         DW    $001C
         DW    $006F
         DW    $0030
         DW    $0049
         DW    $003C
         DW    $001D
         DW    $0004
         DW    $0006
         DW    $8200
         DW    $0001
         DW    $FFFF

L1772    DW    $0001
         DW    $0002
         DW    $8000
         ADRL  $00030000
         DA    L5EBB
         DW    $0007
         DW    $0020
         DW    $0054
         DW    $0020
         DW    $0054
         DW    $0008
         DW    $001D
         DW    $0008
         DW    $001D
         DW    $000A
         DW    $0019
         DW    $000A
         DW    $0019
         DW    $000A
         DW    $0019
         DW    $8180
         DW    $FFFF
         DW    $1111
         DW    $FFFF
         DW    $EEEE
         DW    $8100
         DA    L4C40	; REPLAY
         DW    $0006
         DA    L15FE
         DA    L163E
         DW    $9774
         DW    $8100
         DA    L4C40	; DEMO
         DW    $0007
         DA    L1602
         DA    L1640
         DW    $9774
         DW    $8100
         DA    L4C40	; MAGIC ZAPPER
         DW    $000D
         DA    L1606
         DA    L1642
         DW    $5A27
         DW    $8100
         DA    L4C40	; POWER SHIELD
         DW    $000E
         DA    L160A
         DA    L1644
         DW    $5A27
         DW    $8100
         DA    L4C40	; HITSTRENGTH INCREASED
         DW    $000F
         DA    L160E
         DA    L1646
         DW    $5A27
         DW    $8100
         DA    L4C40	; EXTRA LIFE
         DW    $0010
         DA    L1612
         DA    L1648
         DW    $5A27
         DW    $8000
         ADRL  LA66A
         DA    L6C4D
         DW    $000D
         DW    $0006
         DW    $001F
         DW    $0006
         DW    $001D
         DW    $0006
         DW    $001B
         DW    $0006
         DW    $0019
         DW    $0006
         DW    $0017
         DW    $0006
         DW    $0015
         DW    $0006
         DW    $0014
         DW    $0006
         DW    $0013
         DW    $0006
         DW    $0012
         DW    $0006
         DW    $0011
         DW    $0006
         DW    $0010
         DW    $0006
         DW    $000F
         DW    $0006
         DW    $000D
         DW    $8000
         ADRL  LACD6
         DA    L6C49
         DW    $0013
         DW    $0004
         DW    $0001
         DW    $0004
         DW    $0002
         DW    $0004
         DW    $0003
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0005
         DW    $0004
         DW    $0006
         DW    $0004
         DW    $0007
         DW    $0004
         DW    $0008
         DW    $0004
         DW    $0009
         DW    $0004
         DW    $000A
         DW    $0004
         DW    $000B
         DW    $0004
         DW    $000C
         DW    $0004
         DW    $000D
         DW    $0004
         DW    $000E
         DW    $0004
         DW    $000F
         DW    $0004
         DW    $0010
         DW    $0004
         DW    $0011
         DW    $0004
         DW    $0012
         DW    $0004
         DW    $0013
         DW    $FFFF
L1884    DW    $8080
         DW    $AFCE
         DW    $0002
         DW    $5AAF
         DW    $0001
         DW    $0010
         DW    $001E
         DW    $FFFF
L1894    DW    $0002
         DW    $0002
         DW    $8000
         ADRL  $00030000
         DA    L7A40
         DW    $000A
         DW    $0010
         DW    $00B7
         DW    $0010
         DW    $00B7
         DW    $0010
         DW    $00B7
         DW    $0010
         DW    $00B7
         DW    $0010
         DW    $00B7
         DW    $0010
         DW    $00B7
         DW    $0010
         DW    $00B7
         DW    $0010
         DW    $00B7
         DW    $0010
         DW    $00B7
         DW    $0010
         DW    $00B7
         DW    $8000
         ADRL  $00038000
         DA    L7A44
         DW    $0001
         DW    $0090
         DW    $00C4
         DW    $8180
         DW    $3333
         DW    $1111
         DW    $FFFF
         DW    $EEEE
         DW    $8100
         DA    L496E
         DW    $0000
         DA    L15FE
         DA    L163E
         DW    $2288
         DW    $8100
         DA    L496E
         DW    $0001
         DA    L1602
         DA    L1640
         DW    $2D28
         DW    $8100
         DA    L496E
         DW    $0002
         DA    L1606
         DA    L1642
         DW    $37C8
         DW    $8100
         DA    L496E
         DW    $0003
         DA    L160A
         DA    L1644
         DW    $4268
         DW    $8100
         DA    L496E
         DW    $0004
         DA    L160E
         DA    L1646
         DW    $4D08
         DW    $8100
         DA    L496E
         DW    $0005
         DA    L1612
         DA    L1648
         DW    $57A8
         DW    $8100
         DA    L496E
         DW    $0006
         DA    L1616
         DA    L164A
         DW    $6248
         DW    $8100
         DA    L496E
         DW    $0007
         DA    L161A
         DA    L164C
         DW    $6CE8
         DW    $8100
         DW    L496E
         DW    $0008
         DA    L161E
         DA    L164E
         DW    $7788
         DW    $8100
         DA    L496E
         DW    $0009
         DA    L1622
         DA    L1650
         DW    $8228
         DW    $8100
         DA    L496E
         DW    $000A
         DA    L1626
         DA    L1652
         DW    $8CC8
         DW    $FFFF
L1968    DW    $000C
         DW    $0001
         DW    $0003
         DW    $0002
         DW    $8000
         ADRL  $00030000
         DA    L7196
         DW    $0001
         DW    $008E
         DW    $004E
         DW    $8000
         ADRL  $00000000
         DA    L719A
         DW    $0005
         DW    $001A
         DW    $0033
         DW    $001A
         DW    $0033
         DW    $001A
         DW    $0033
         DW    $001A
         DW    $0033
         DW    $001A
         DW    $0033
         DW    $8180
         DW    $FFFF
         DW    $1111
         DW    $1111
         DW    $0000
         DW    $8100
         DA    L4AF0
         DW    $0000
         DA    L15FE
         DA    L163E
         DW    $2A02
         DW    $8100
         DA    L4AF0
         DW    $0001
         DA    L1602
         DA    L1640
         DW    $368A
         DW    $8100
         DA    L4AF0
         DW    $0002
         DA    L1606
         DA    L1642
         DW    $3B8A
         DW    $8100
         DA    L4AF0
         DW    $0003
         DA    L160A
         DA    L1644
         DW    $4812
         DW    $8100
         DA    L4AF0
         DW    $0004
         DA    L160E
         DA    L1646
         DW    $4D12
         DW    $8100
         DA    L4AF0
         DW    $0005
         DA    L1612
         DA    L1648
         DW    $598E
         DW    $8100
         DA    L4AF0
         DW    $0006
         DA    L1616
         DA    L164A
         DW    $6606
         DW    $8100
         DA    L4AF0
         DW    $0007
         DA    L161A
         DA    L164C
         DW    $6B06
         DW    $FFFF

L1A08    DW    $8100
         DA    L4C08
         DW    $0000
         DA    L4C3C
         DA    L164E
         DW    $2000
         DW    $FFFF
L1A16    DW    $000D
         DW    $0001
         DW    $0004
         DW    $0002
         DW    $8000
         ADRL  $00030000
         DA    L7400
         DW    $0001
         DW    $00A0
         DW    $0064
         DW    $8040
         DW    $1111
         ADRL  $00000000
         DA    L7404
         DW    $000F
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $0008
         DW    $0038
         DW    $8180
         DW    $8888
         DW    $1111
         DW    $EEEE
         DW    $FFFF
         DW    $FFFF

L1A80    DW    $8100
         DA    L4F24
         DW    $0000
         DA    L4C3C
         DA    L164E
         DW    $2000
         DW    $FFFF

L1A8E    DW    $000D
         DW    $0001
         DW    $0003
         DW    $0006
         DW    $8200
         DW    $0003
         DW    $FFFF

L1A9C    DW    $0000
         DW    $0004
         DW    $8000
         ADRL  $00030000
         DA    L13B6
         DW    $0001
         DW    $0008
         DW    $00C0
         DW    $0000
         DW    $0003
         DW    $8000
         ADRL  $00040000
         DA    L64FD
         DW    $000B
         DW    $0016
         DW    $0095
         DW    $0022
         DW    $008E
         DW    $002E
         DW    $0087
         DW    $001C
         DW    $0093
         DW    $003A
         DW    $0078
L1AD0    DW    $002A
         DW    $0078
         DW    $0010
         DW    $000B
         DW    $0026
         DW    $001A
         DW    $0048
         DW    $0073
         DW    $004C
         DW    $004A
         DW    $004C
         DW    $001A
         DW    $8180
         DW    $FFFF
         DW    $1111
         DW    $FFFF
         DW    $EEEE
         DW    $8100
         DA    L422A
         DW    $0000
         DA    L161E
         DA    L164E
         DW    $3227
         DW    $8100
         DA    L4C40	; MORE HITS REQUIRED FOR EACH ENEMY
         DW    $0008
         DA    L1622
         DA    L1650
         DW    $5A27
         DW    $0000
         DW    $0007
         DW    $8280
         DW    $0000
         DW    $FFFF

L1B14    DW    $0001
         DW    $0004
         DW    $8000
         ADRL  $00030000
         DA    L0016
         DW    $0002
         DW    $0018
         DW    $0030
         DW    $0006
         DW    $0009
         DW    $8000
         ADRL  $00000000
         DA    L039A
         DW    $0005
         DW    $0004
         DW    $0015
         DW    $0004
         DW    $0023
         DW    $0004
         DW    $0038
         DW    $0004
         DW    $004A
         DW    $0004
         DW    $0065
         DW    $0000
         DW    $0003
         DW    $8000
         ADRL  $00040000
         DA    L64FD
         DW    $000B
         DW    $0016
         DW    $0095
         DW    $0022
         DW    $008E
         DW    $002E
         DW    $0087
         DW    $001C
         DW    $0093
         DW    $003A
         DW    $0078
         DW    $002A
         DW    $0078
         DW    $0010
         DW    $000B
         DW    $0026
         DW    $001A
         DW    $0048
         DW    $0073
         DW    $004C
         DW    $004A
         DW    $004C
         DW    $001A
         DW    $8180
         DW    $FFFF
         DW    $1111
         DW    $FFFF
         DW    $EEEE
         DW    $8100
         DA    L422A
         DW    $0001
         DA    L161E
         DA    L164E
         DW    $3227
         DW    $0001
         DW    $0007
         DW    $8280
         DW    $0000
         DW    $FFFF
L1BA2    DW    $0002
         DW    $0004
         DW    $8000
         ADRL  $00030000
         DA    L1004
         DW    $0004
         DW    $0016
         DW    $002C
         DW    $0016
         DW    $002C
         DW    $0016
         DW    $002C
         DW    $0016
         DW    $002C
         DW    $0002
         DW    $0003
         DW    $8000
         ADRL  $00030000
         DA    L64FD
         DW    $000B
         DW    $001A
         DW    $0033
         DW    $0016
         DW    $0033
         DW    $002A
         DW    $0050
         DW    $0024
         DW    $0050
         DW    $0020
         DW    $0050
         DW    $0018
         DW    $005D
         DW    $0012
         DW    $0063
         DW    $0030
         DW    $0053
         DW    $0020
         DW    $0059
         DW    $0030
         DW    $0077
         DW    $0044
         DW    $0035
         DW    $8000
         ADRL  $00040000
         DA    L6501
         DW    $0010
         DW    $001E
         DW    $0050
         DW    $0020
         DW    $0056
         DW    $0018
         DW    $005A
         DW    $0026
         DW    $0043
         DW    $0024
         DW    $0049
         DW    $0030
         DW    $0050
         DW    $002A
         DW    $0060
         DW    $0020
         DW    $003C
         DW    $002E
         DW    $0059
         DW    $003C
         DW    $001D
         DW    $0014
         DW    $0028
         DW    $0014
         DW    $0028
         DW    $0014
         DW    $0028
L1C38    DW    $0014
         DW    $0028
         DW    $0014
         DW    $001F
         DW    $0014
         DW    $001F
         DW    $8180
         DW    $FFFF
         DW    $1111
         DW    $FFFF
         DW    $EEEE
         DW    $8100
         DA    L422A
         DW    $0002
         DA    L161E
         DA    L164E
         DW    $3227
         DW    $8100
         DA    L4C40	; JUMP OVER BARRELS
         DW    $0009
         DA    L1622
         DA    L1650
         DW    $8B09
         DW    $0002
         DW    $0007
         DW    $8280
         DW    $0000
         DW    $FFFF
L1C70    DW    $0003
         DW    $0004
         DW    $8000
         ADRL  $00030000
         DA    L0016
         DW    $0001
         DW    $0018
         DW    $00C0
         DW    $8000
         ADRL  $00000000
         DA    L039A
         DW    $0002
         DW    $0010
         DW    $0014
         DW    $0010
         DW    $0014
         DW    $0003
         DW    $0003
         DW    $8000
         ADRL  $00030000
         DA    L64FD
         DW    $0008
         DW    $0034
         DW    $004C
         DW    $0026
         DW    $0045
         DW    $001E
         DW    $004F
         DW    $0016
         DW    $003B
         DW    $002A
         DW    $007F
         DW    $0030
         DW    $0074
         DW    $0046
         DW    $003D
         DW    $0026
         DW    $0080
         DW    $8080
         ADRL  $00038000
         DA    L6501
         DW    $0006
         DW    $003C
         DW    $001F
         DW    $003C
         DW    $001F
         DW    $0040
         DW    $003D
         DW    $0040
         DW    $003D
         DW    $0058
         DW    $003E
         DW    $003C
         DW    $0053
         DW    $8180
         DW    $FFFF
         DW    $1111
         DW    $FFFF
         DW    $EEEE
         DW    $8100
         DA    L422A
         DW    $0003
         DA    L161E
         DA    L164E
         DW    $3227
         DW    $0003
         DW    $0007
         DW    $8280
         DW    $0000
         DW    $FFFF
L1D04    DW    $0004
         DW    $0004
         DW    $8000	; MAKE SPRITE
         ADRL  $00030000	; SPRITE CODE ADDRESS
         DA    L0016	; POINTER TO IT
         DW    $0005	; 5 SPRITES
         DW    $0018	; W
         DW    $002C	; H
         DW    $0018
         DW    $002C
         DW    $0008
         DW    $0024
         DW    $0008
         DW    $0024
         DW    $0018
         DW    $0035
         DW    $8000	; MAKE SPRITE
         ADRL  $00000000	; FROM PREVIOUS ADDRESS
         DA    L1004
         DW    $0005
         DW    $0012
         DW    $0021
         DW    $0012
         DW    $0021
         DW    $0012
         DW    $0021
         DW    $0012
         DW    $0021
         DW    $0020
         DW    $000E

         DW    $8000
         ADRL  $00000000
         DA    L13B6
         DW    $0001
         DW    $0014
         DW    $008F
         DW    $0004
         DW    $0003

         DW    $8000
         ADRL  $00030000
         DA    L64FD
         DW    $000F
         DW    $0020
         DW    $001E
         DW    $001E
         DW    $0030
         DW    $001E
         DW    $003B
         DW    $0020
         DW    $004D
         DW    $0020
         DW    $005F
         DW    $0020
         DW    $0067
         DW    $0020
         DW    $0076
         DW    $0026
         DW    $0070
         DW    $0026
         DW    $0072
         DW    $0028
         DW    $0072
         DW    $001E
         DW    $006B
         DW    $0018
         DW    $0054
         DW    $0012
         DW    $0026
         DW    $000C
         DW    $000A
         DW    $000E
         DW    $0007
         DW    $8180
         DW    $FFFF
         DW    $1111
         DW    $FFFF
         DW    $EEEE
         DW    $8100
         DA    L422A
         DW    $0004
         DA    L161E
         DA    L164E
         DW    $3227
         DW    $0004
         DW    $0007
         DW    $8280
         DW    $0000
         DW    $FFFF
L1DBC    DW    $0005
         DW    $0004
         DW    $8000
         ADRL  $00030000
         DA    L0016
         DW    $0003
         DW    $0018
         DW    $00C0
         DW    $0008
         DW    $0011
         DW    $0008
         DW    $0011
         DW    $8080
         DW    $0000
         DW    $0000
         DW    $039A
         DW    $0006
         DW    $0008
         DW    $0020
         DW    $0008
         DW    $0020
         DW    $0008
         DW    $0020
         DW    $0004
         DW    $0011
         DW    $0004
         DW    $0011
         DW    $0004
         DW    $0011
         DW    $8180
         DW    $FFFF
         DW    $1111
         DW    $FFFF
         DW    $EEEE
         DW    $8100
         DA    L422A
         DW    $0005
         DA    L161E
         DA    L164E
         DW    $3227
         DW    $8100
         DA    L4C40	; BEWARE OF TRAPS
         DW    $000A
         DA    L1622
         DA    L1650
         DW    $8B1D
         DW    $0005
         DW    $0007
         DW    $8280
         DW    $0000
         DW    $FFFF
L1E24    DW    $0006
         DW    $0004
         DW    $8000
         ADRL  $00030000
         DA    L0016
         DW    $0006
         DW    $0014
         DW    $0053
         DW    $0014
         DW    $0053
         DW    $0014
         DW    $0053
         DW    $0014
         DW    $0042
         DW    $0014
         DW    $0042
         DW    $0014
         DW    $0042
         DW    $0006
         DW    $0003
         DW    $8040
         DW    $9999
         ADRL  $00040000
         DA    L64FD
         DW    $0008
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $8000
         ADRL  $00030000
         DA    L6501
         DW    $000E
         DW    $0036
         DW    $0059
         DW    $0026
         DW    $0074
         DW    $0020
         DW    $0077
         DW    $001C
         DW    $0073
         DW    $001E
         DW    $006F
         DW    $001E
         DW    $006F
         DW    $0028
         DW    $006C
         DW    $0028
         DW    $006C
         DW    $0028
         DW    $008C
         DW    $0028
         DW    $008C
         DW    $0028
         DW    $008C
         DW    $0028
         DW    $008C
         DW    $0010
         DW    $0039
         DW    $0010
         DW    $0039
         DW    $8080
         DW    $8000
         DW    $0004
         DW    $1004
         DW    $0009
         DW    $0020
         DW    $003C
         DW    $0020
         DW    $003C
         DW    $0020
         DW    $003C
         DW    $0020
         DW    $003C
         DW    $0020
         DW    $003C
         DW    $0020
         DW    $003C
         DW    $0020
         DW    $003C
         DW    $0020
         DW    $003C
         DW    $0020
         DW    $003C
         DW    $8180
         DW    $FFFF
         DW    $1111
         DW    $FFFF
         DW    $EEEE
         DW    $8100
         DA    L422A
         DW    $0006
         DA    L161E
         DA    L164E
         DW    $3227
         DW    $0006
         DW    $0007
         DW    $8280
         DW    $0000
         DW    $FFFF
L1F0A    DW    $0007
         DW    $0004
         DW    $8000
         ADRL  $00040000
         DA    L0016
         DW    $0006
         DW    $0014
         DW    $0053
         DW    $0014
         DW    $0053
         DW    $0014
         DW    $0053
         DW    $0014
         DW    $0042
         DW    $0014
         DW    $0042
         DW    $0014
         DW    $0042
         DW    $8000
         ADRL  $00030000
         DA    L039A
         DW    $001E
         DW    $0018
         DW    $002C
         DW    $0018
         DW    $002C
         DW    $0018
         DW    $002C
         DW    $0018
         DW    $0048
         DW    $0018
         DW    $0048
         DW    $0018
         DW    $0048
         DW    $0018
         DW    $0064
         DW    $0018
         DW    $0064
         DW    $0018
         DW    $0064
         DW    $0018
         DW    $0080
         DW    $0018
         DW    $0080
         DW    $0018
         DW    $0080
         DW    $0018
         DW    $009C
         DW    $0018
         DW    $009C
         DW    $0018
         DW    $009C
         DW    $0018
         DW    $00C0
         DW    $0018
         DW    $00C0
         DW    $0018
         DW    $00C0
         DW    $000E
         DW    $004E
         DW    $000E
         DW    $004E
         DW    $000E
         DW    $004E
         DW    $000E
         DW    $004E
         DW    $000E
         DW    $004E
         DW    $000E
         DW    $004E
         DW    $0018
         DW    $0011
         DW    $0018
         DW    $0011
         DW    $0018
         DW    $0011
         DW    $0018
         DW    $0011
         DW    $0018
         DW    $0011
         DW    $0018
         DW    $0011
         DW    $8180
         DW    $FFFF
         DW    $1111
         DW    $FFFF
         DW    $EEEE
         DW    $8100
         DA    L422A
         DW    $0007
         DA    L161E
         DA    L164E
         DW    $3227
         DW    $8100
         DA    L4C40	; JUMP ONTO BLOCKS
         DW    $000B
         DA    L1622
         DA    L1650
         DW    $8B27
         DW    $0007
         DW    $0007
         DW    $8280
         DW    $0000
         DW    $FFFF
L1FDE    DW    $0008
         DW    $0004
         DW    $8080
         DW    $0000
         DW    $0003
         DW    $039A
         DW    $0003
         DW    $0008
         DW    $0020
         DW    $0008
         DW    $0020
         DW    $0008
         DW    $0020
         DW    $0008
         DW    $0003
         DW    $8040
         DW    $9999
         ADRL  $00040000
         DA    L64FD
         DW    $0008
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $0028
         DW    $0046
         DW    $8180
         DW    $FFFF
         DW    $1111
         DW    $FFFF
         DW    $EEEE
         DW    $8100
         DA    L422A
         DW    $0008
         DA    L161E
         DA    L164E
         DW    $3227
         DW    $8100
         DA    L4C40	; HINT: THE ANIMAL IS HUNGRY
         DW    $000C
         DA    L1622
         DA    L1650
         DW    $5A27
         DW    $8100
         DA    L4C40	; ANIMAL NOW HAS TRENGTH TO JUMP
         DW    $0013
         DA    L1626
         DA    L1652
         DW    $5A27
         DW    $0008
         DW    $0007
         DW    $8280
         DW    $0000
         DW    $FFFF
L2060    DW    $0005
         DW    $0004
         DW    $8000
         ADRL  $00030000
         DA    L0016
         DW    $0003
         DW    $0018
         DW    $00C0
         DW    $0008
         DW    $0011
         DW    $0008
         DW    $0011
         DW    $8080
         DW    $0000
         DW    $0000
         DW    $039A
         DW    $0006
         DW    $0008
         DW    $0020
         DW    $0008
         DW    $0020
         DW    $0008
         DW    $0020
         DW    $0004
         DW    $0011
         DW    $0004
         DW    $0011
         DW    $0004
         DW    $0011
         DW    $8180
         DW    $FFFF
         DW    $1111
         DW    $FFFF
         DW    $EEEE
         DW    $8100
         DA    L422A
         DW    $0009
         DA    L161E
         DA    L164E
         DW    $3227
         DW    $8100
         DA    L4C40	; BEWARE OF TRAPS
         DW    $000A
         DA    L1622
         DA    L1650
         DW    $8B1D
         DW    $0005
         DW    $0007
         DW    $8280
         DW    $0000
         DW    $FFFF
L20C8    DW    $000A
         DW    $0003
         DW    $8040
         DW    $BBBB
         ADRL  $00030000
         DA    L6501
         DW    $0009
         DW    $0028
         DW    $0078
         DW    $0028
         DW    $0078
         DW    $0024
         DW    $007A
         DW    $0024
         DW    $007A
         DW    $0026
         DW    $0073
         DW    $0020
         DW    $005D
         DW    $0020
         DW    $005D
         DW    $0020
         DW    $005D
         DW    $0020
         DW    $005D
         DW    $8040
         DW    $BBBB
         ADRL  $00040000
         DA    L64FD
         DW    $000D
         DW    $0028
         DW    $004F
         DW    $0028
         DW    $004F
         DW    $0044
         DW    $007D
         DW    $0044
         DW    $007D
         DW    $0040
         DW    $003C
         DW    $0040
         DW    $003C
         DW    $0040
         DW    $003C
         DW    $0018
         DW    $008F
         DW    $0020
         DW    $0060
         DW    $0020
         DW    $0060
         DW    $0020
         DW    $0060
         DW    $0020
         DW    $0060
         DW    $0020
         DW    $0060
         DW    $000A
         DW    $0004
         DW    $8080
         ADRL  $00030000
         DA    $1004
         DW    $0007
         DW    $0020
         DW    $0032
         DW    $0020
         DW    $0032
         DW    $0020
         DW    $0032
         DW    $0020
         DW    $0032
         DW    $0020
         DW    $0032
         DW    $0020
         DW    $0032
         DW    $0020
         DW    $005D
         DW    $8180
         DW    $FFFF
         DW    $1111
         DW    $FFFF
         DW    $EEEE
         DW    $8100
         DA    L422A
         DW    $000A
         DA    L161E
         DA    L164E
         DW    $3227
         DW    $0009
         DW    $0007
         DW    $8280
         DW    $0000
         DW    $FFFF

L2186    DW    $0000
         DW    $0001
         DW    $0002
         DW    $0003
         DW    $0004
         DW    $0005
         DW    $0006
         DW    $0007
         DW    $0008
         DW    $0009
         DW    $000A

L219C    DW    $0002
         DW    $0002
         DW    $0002
         DW    $0003
         DW    $0003

L21A6    DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0005
         DW    $0005
         DW    $0005
         DW    $0005
         DW    $0005

L21BC    DW    $0006
         DW    $0006
         DW    $0006
         DW    $0007
         DW    $0007
         DW    $0007
         DW    $0008
         DW    $0008
         DW    $0008
         DW    $0008
         DW    $0008

L21D2    DW    $5B8F
         DW    $518F
         DW    $478F
         DW    $388E
         DW    $2CAE
L21DC    HEX   000F000000FFF0000FFFFF00000F0000
         HEX   000F0000000F0000000F000000000000
L21FC    HEX   FFF0FFFFFF000FFFF00000FFF000000F
         HEX   FFF00FFFFFF00FFFFFF00FFFFFF00FFF

L221C    ADRL  $00000050  ; SCORE
         ADRL  $00000100
         ADRL  $00000250
         ADRL  $00000500
         ADRL  $00000750
         ADRL  $00001000
         ADRL  $00001500
         ADRL  $00002500
         ADRL  $00005000
         ADRL  $00007500
         ADRL  $00010000
L2248    DW    $0000
L224A    DW    $0000

L224C    DA    $0000
         DA    $0000
         DA    $0000
         DA    $0000
         DA    L2262
         DA    $0000
         DA    $0000
         DA    $0000
         DA    $0000
         DA    $0000
         DA    L22A4

L2262    DW    $0C00
         DW    $0104
         DW    $001E
         DA    L2278
         DW    $0000
         DA    L2284
         DW    $0004
         DA    L2296
         DW    $0005
         DA    L2296
         DW    $0005
L2278    DW    $0222
         DW    $0444
         DW    $0555
         DW    $0333
         DW    $0111
         DW    $FFFF
L2284    DW    $0222
         DW    $0444
         DW    $0222
         DW    $0777
         DW    $0555
         DW    $0333
         DW    $0111
         DW    $0333
         DW    $FFFF
L2296    DW    $0FFF
         DW    $0AAA
         DW    $0FFF
         DW    $0888
         DW    $0333
         DW    $0555
         DW    $FFFF

L22A4    DW    $0C00
         DW    $0000
         DW    $0016
         DA    L22BA
         DW    $FFFF
         DA    L22BA
         DW    $FFFF
         DA    L22DA
         DW    $FFFF
         DA    L22DA
         DW    $FFFF
L22BA    DW    $0FFF
         DW    $0EEE
         DW    $0DDD
         DW    $0CCC
         DW    $0BBB
         DW    $0AAA
         DW    $0999
         DW    $0888
         DW    $0777
         DW    $0666
         DW    $0555
         DW    $0444
         DW    $0333
         DW    $0222
         DW    $0111
         DW    $FFFF
L22DA    DW    $0FFF
         DW    $0DDD
         DW    $0BBB
         DW    $0999
         DW    $0777
         DW    $0555
         DW    $0333
         DW    $0111
         DW    $FFFF
L22EC    DW    $0000
L22EE    DW    $0000
L22F0    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2300    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2310    DW    $0000
         DW    $0000
         DW    $0000
L2316    DW    $0000
L2318    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2320    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2328    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2330    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2338    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000

L2340    DA    L2356
         DA    L2360
         DA    L237C
         DA    L238A
         DA    L2394
         DA    L23CA
         DA    L23E8
         DA    L23F2
         DA    L240C
         DA    L23CA
         DA    L2416
L2356    DW    $0000
         DW    $0000
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF
L2360    DW    $0004
         DW    $0000
         DW    $0000
         DW    $9000
         DW    $0009
         DW    $4000
         DW    $0008
         DW    $1000
         DW    $0006
         DW    $FFFF
         DW    $0000
         DW    $0008
         DW    $FFFF
         DW    $FFFF
L237C    DW    $0004
         DW    $0000
         DW    $FFFF
         DW    $0000
         DW    $000D
         DW    $FFFF
         DW    $FFFF
L238A    DW    $0000
         DW    $0000
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF
L2394    DW    $0008
         DW    $0001
         DW    $0000
         DW    $4000
         DW    $0003
         DW    $3000
         DW    $0006
         DW    $2000
         DW    $0007
         DW    $1000
         DW    $0008
         DW    $FFFF
         DW    $0014
         DW    $0002
         DW    $0002
         DW    $0002
         DW    $0002
         DW    $0002
         DW    $0002
         DW    $0002
         DW    $0002
         DW    $0002
         DW    $0002
         DW    $0002
         DW    $0002
         DW    $FFFF
         DW    $FFFF
L23CA    DW    $0004
         DW    $0000
         DW    $FFFF
         DW    $5000
         DW    $0001
         DW    $4000
         DW    $0003
         DW    $3000
         DW    $0004
         DW    $2000
         DW    $0005
         DW    $1000
         DW    $0006
         DW    $FFFF
         DW    $FFFF
L23E8    DW    $0000
         DW    $0000
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF
L23F2    DW    $0006
         DW    $FFFF
         DW    $FFFF
         DW    $2800
         DW    $0000
         DW    $1800
         DW    $000A
         DW    $1000
         DW    $000B
         DW    $0800
         DW    $000C
         DW    $FFFF
         DW    $FFFF
L240C    DW    $0000
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF
L2416    DW    $0008
         DW    $0000
         DW    $FFFF
         DW    $3000
         DW    $8000
         DW    $FFFF
         DW    $0003
         DW    $8001
         DW    $8009
         DW    $800A
         DW    $800B
         DW    $800C
         DW    $800D
         DW    $800E
         DW    $800E
         DW    $800D
         DW    $800C
         DW    $800B
         DW    $800A
         DW    $8009
         DW    $8001
         DW    $FFFF
         DW    $FFFF
L2444    DW    $0000
L2446    DW    $0000
L2448    DW    $0000
L244A    DW    $0000
L244C    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2454    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L245C    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2464    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L246C    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2474    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L247C    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2484    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L248C    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2494    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L249C    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L24A4    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L24AC    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L24B4    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L24BC    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L24C4    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L24CC    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L24D4    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L24DC    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L24E4    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L24EC    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L24F4    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L24FC    DW    $0000
L24FE    DW    $0000
L2500    DW    $0000
L2502    DW    $0000
L2504    DW    $0000
L2506    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L250E    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2516    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L251E    DS    $80
L259E    DS    $80
L261E    DW    $0000
         DW    $0000
         DW    $0030
         DW    $0000
         DW    $002C
         DW    $0028
         DW    $0024
         DW    $0020
         DW    $001C
         DW    $0018
         DW    $0014
         DW    $0000
         DW    $0010
         DW    $0000
         DW    $000C
         DW    $0000
         DW    $0008
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000

L2648    DA    L265E
         DA    L26C0
         DA    L26FE
         DA    $0000
         DA    L2812
         DA    $0000
         DA    L2934
         DA    $0000
         DA    L29B8
         DA    $0000
         DA    L2A1A

L265E    DA    L2694
         DW    $FFFF
         DW    $0000
         DW    $00E1
         DW    $000A
         DW    $0000
         DW    $FFFF
         DW    $0046
         DW    $0000
         DW    $00F5
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $005A
         DW    $0000
         DW    $0120
         DW    $0008
         DW    $0000
         DW    $FFFF
         DW    $0088
         DW    $0000
         DW    $0134
         DW    $0005
         DW    $0000
         DW    $FFFF
         DW    $0088
         DW    $FFFF
L2694    DA    L2ACC
         DA    L2E00
         DA    L2E16
         DA    L2E2C
         DW    $004B
         DW    $0000
         DW    $00C8
         DW    $00C8
         DW    $0000
         DW    $001E
         DW    $0000
         DW    $00C8
         DW    $001E
         DW    $003C
         DW    $FF9C
         DW    $0064
         DW    $0008
         DW    $0023
         DW    $FFFF
         DW    $0000
         DW    $0000
         DW    $FFFF
L26C0    DA    L26D2
         DW    $FFFF
         DW    $0000
         DW    $00A0
         DW    $0008
         DW    $0000
         DW    $FFFF
         DW    $003C
         DW    $FFFF
L26D2    DA    L2ACC
         DA    L2E00
         DA    L2E16
         DA    L2E2C
         DW    $004B
         DW    $0000
         DW    $00C8
         DW    $00C8
         DW    $0000
         DW    $001E
         DW    $0000
         DW    $00C8
         DW    $001E
         DW    $003C
         DW    $FF9C
         DW    $0064
         DW    $0010
         DW    $0023
         DW    $FFFF
         DW    $0000
         DW    $0000
         DW    $FFFF
L26FE    DA    L272A
         DA    L2756
         DW    $FFFF
         DW    $0000
         DW    $0064
         DW    $0007
         DW    $0000
         DW    $FFFF
         DW    $0088
         DW    $0000
         DW    $008C
         DW    $0005
         DW    $0000
         DW    $0001
         DW    $0092
         DW    $0001
         DW    $021C
         DW    $000A
         DW    $0006
         DW    $FFFF
         DW    $0092
         DW    $FFFF
L272A    DA    L2E42
         DA    L3048
         DA    L305E
         DA    L3074
         DW    $0044
         DW    $0000
         DW    $00C8
         DW    $00C8
         DW    $0003
         DW    $0028
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $002D
         DW    $FF9C
         DW    $0064
         DW    $0010
         DW    $0020
         DW    $FFFF
         DW    $0000
         DW    $0000
         DW    $FFFF
L2756    DA    L308A
         DA    L3216
         DA    L3236
         DA    L3256
         DW    $002B
         DW    $0000
         DW    $00C8
         DW    $00C8
         DW    $0005
         DW    $0028
         DW    $0000
         DW    $005A
         DW    $0000
         DW    $0028
         DW    $FF9C
         DW    $0064
         DW    $0018
         DW    $0028
         DW    $FFFF
         DW    $0000
         DW    $0000
         DW    $0002
L2782    DA    L27BA
         DA    L27E6
         DW    $FFFF
         DW    $0000
         DW    $00A0
         DW    $0006
         DW    $0000
         DW    $0001
         DW    $0046
         DW    $0000
         DW    $00C8
         DW    $0004
         DW    $0000
         DW    $FFFF
         DW    $0046
         DW    $0001
         DW    $01CE
         DW    $0007
         DW    $0000
         DW    $0002
         DW    $0046
         DW    $0001
         DW    $01F4
         DW    $0004
         DW    $0000
         DW    $FFFF
         DW    $0046
         DW    $FFFF
L27BA    DA    L3276
         DA    L3358
         DA    L3368
         DA    L3378
         DW    $0044
         DW    $0000
         DW    $00C8
         DW    $00C8
         DW    $0000
         DW    $0028
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $002D
         DW    $FF9C
         DW    $0064
         DW    $0010
         DW    $0020
         DW    $FFFF
         DW    $0000
         DW    $0000
         DW    $FFFF
L27E6    DA    L3388
         DA    L347A
         DA    L3486
         DA    L3492
         DW    $0066
         DW    $0000
         DW    $00C8
         DW    $00C8
         DW    $000A
         DW    $0014
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $0023
         DW    $FF9C
         DW    $0064
         DW    $0018
         DW    $0028
         DW    $FFFF
         DW    $0000
         DW    $0000
         DW    $0001
L2812    DA    L2908
         DW    $FFFF
         DW    $0000
         DW    $0064
         DW    $0001
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $007D
         DW    $0001
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $009B
         DW    $0004
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $00A5
         DW    $0001
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $00AF
         DW    $0002
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $00B9
         DW    $0005
         DW    $0000
         DW    $0003
         DW    $0032
         DW    $0000
         DW    $00CD
         DW    $0002
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $00DC
         DW    $0003
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $00FA
         DW    $0004
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $00FF
         DW    $0005
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $010E
         DW    $0003
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $011D
         DW    $0006
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $0145
         DW    $0007
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $0159
         DW    $0005
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $0163
         DW    $0007
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $0177
         DW    $0006
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $018B
         DW    $0007
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $0195
         DW    $0005
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $01A4
         DW    $0007
         DW    $0000
         DW    $FFFF
         DW    $0032
         DW    $0000
         DW    $01BD
         DW    $0009
         DW    $0000
         DW    $0002
         DW    $0032
         DW    $FFFF
L2908    DA    L349E
         DA    L365A
         DA    L3678
         DA    L3696
         DW    $0051
         DW    $0000
         DW    $00C8
         DW    $00C8
         DW    $0009
         DW    $0023
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $0019
         DW    $FF9C
         DW    $0064
         DW    $000C
         DW    $FFFF
         DW    $FFFF
         DW    $000A
         DW    $0000
         DW    $FFFF
L2934    DA    L2960
         DA    L298C
         DW    $FFFF
         DW    $0000
         DW    $0082
         DW    $0007
         DW    $0000
         DW    $FFFF
         DW    $0088
         DW    $0000
         DW    $008C
         DW    $0005
         DW    $0000
         DW    $FFFF
         DW    $0088
         DW    $0001
         DW    $00F0
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0088
         DW    $FFFF
L2960    DA    L36B4
         DA    L3820
         DA    L3830
         DA    L3840
         DW    $0037
         DW    $0014
         DW    $0082
         DW    $009B
         DW    $0003
         DW    $0028
         DW    $0000
         DW    $0037
         DW    $000A
         DW    $0019
         DW    $FFFB
         DW    $0064
         DW    $0018
         DW    $0020
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $FFFF
L298C    DA    L3850
         DA    L39D4
         DA    L39F0
         DA    L3A0C
         DW    $0050
         DW    $0000
         DW    $00C8
         DW    $00C8
         DW    $0005
         DW    $0028
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $0032
         DW    $FF9C
         DW    $0064
         DW    $0010
         DW    $0020
         DW    $FFFF
         DW    $FFF4
         DW    $0000
         DW    $FFFF
L29B8    DA    L29EE
         DW    $FFFF
         DW    $0000
         DW    $0113
         DW    $000C
         DW    $0000
         DW    $0001
         DW    $0088
         DW    $0000
         DW    $0118
         DW    $0009
         DW    $0000
         DW    $FFFF
         DW    $0088
         DW    $0000
         DW    $019A
         DW    $0007
         DW    $0000
         DW    $FFFF
         DW    $0088
         DW    $0000
         DW    $01AE
         DW    $0005
         DW    $0000
         DW    $FFFF
         DW    $0088
         DW    $FFFF
L29EE    DA    L36B4
         DA    L3820
         DA    L3830
         DA    L3840
         DW    $0037
         DW    $0014
         DW    $0082
         DW    $009B
         DW    $0003
         DW    $0028
         DW    $0000
         DW    $0037
         DW    $000A
         DW    $0019
         DW    $FFFB
         DW    $0064
         DW    $0018
         DW    $0020
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $FFFF
L2A1A    DA    L2A48
         DA    L2A74
         DA    L2AA0
         DW    $FFFF
         DW    $0100
         DW    $0064
         DW    $000A
         DW    $0000
         DW    $FFFF
         DW    $0088
         DW    $0100
         DW    $00C8
         DW    $000A
         DW    $0000
         DW    $FFFF
         DW    $0088
         DW    $0101
         DW    $0140
         DW    $0014
         DW    $0000
         DW    $FFFF
         DW    $0088
         DW    $FFFF
L2A48    DA    L3A28
         DA    L3ABA
         DA    L3AD4
         DA    L3AEE
         DW    $000A
         DW    $0000
         DW    $00C8
         DW    $00C8
         DW    $000D
         DW    $0028
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $0028
         DW    $FF9C
         DW    $0064
         DW    $0010
         DW    $0020
         DW    $FFFF
         DW    $0018
         DW    $FFFF
         DW    $FFFF
L2A74    DA    L3B08
         DA    L3D08
         DA    L3D1A
         DA    L3D2C
         DW    $004D
         DW    $0000
         DW    $00C8
         DW    $00C8
         DW    $000D
         DW    $0028
         DW    $0000
         DW    $00C8
         DW    $0000
         DW    $0028
         DW    $FF9C
         DW    $0064
         DW    $0000
         DW    $FFFF
         DW    $FFFF
         DW    $0018
         DW    $FFFF
         DW    $0001
L2AA0    DA    L3D3E
         DA    L3820
         DA    L3830
         DA    L3840
         DW    $0028
         DW    $000A
         DW    $0082
         DW    $009B
         DW    $000A
         DW    $0028
         DW    $0000
         DW    $0037
         DW    $000A
         DW    $0019
         DW    $FFFB
         DW    $0064
         DW    $0018
         DW    $0020
         DW    $FFFF
         DW    $0000
         DW    $0000
         DW    $FFFF

L2ACC    DA    L2AF4
         DA    L2B1E
         DA    L2B1E
         DA    L2B60
         DA    L2B60
         DA    L2B8A
         DA    L2B8A
         DA    L2B8A
         DA    L2BD4
         DA    L2BD4
         DA    L2BEE
         DA    L2BEE
         DA    L2C48
         DA    L2C48
         DA    L2C82
         DA    L2CF4
         DA    L2AF4
         DA    L2DC8
         DA    L2D66
         DW    $FFFF
L2AF4    DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2B1E    DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2B60    DW    $0004
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0000
L2B8A    DW    $0004
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0000
L2BD4    DW    $0004
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
L2BEE    DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0608
         DW    $C400
         DW    $0000
         DW    $0000
         DW    $0608
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2C48    DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0608
         DW    $C400
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2C82    DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0608
         DW    $C400
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0608
         DW    $C400
         DW    $0000
         DW    $0000
         DW    $0608
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $4400
         DW    $0000
         DW    $0000
         DW    $0000
L2CF4    DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $4400
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0608
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0608
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0608
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0608
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0608
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0507
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $4400
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2D66    DW    $0009
         DW    $4200
         DW    $0008
         DW    $0000
         DW    $0009
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0009
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0009
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0009
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
L2DC8    DW    $0009
         DW    $4200
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $4300
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000B
         DW    $4100
         DW    $0000
         DW    $0000
         DW    $800B
         DW    $0000
         DW    $0000
         DW    $0000
L2E00    DW    $F1A3
         DW    $F37D
         DW    $F7D8
         DW    $F19D
         DW    $012A
         DW    $0141
         DW    $2962
         DW    $179C
         DW    $04EC
         DW    $1FE7
         DW    $3DE8
L2E16    DW    $0016
         DW    $0022
         DW    $002E
         DW    $001C
         DW    $003A
         DW    $002A
         DW    $0010
         DW    $0026
         DW    $0048
         DW    $004C
         DW    $004C
L2E2C    DW    $0003
         DW    $FFFD
         DW    $FFF8
         DW    $FFFD
         DW    $FFEA
         DW    $0001
         DW    $0022
         DW    $FFDC
         DW    $FFEC
         DW    $0007
         DW    $0008
L2E42    DA    L2E6A
         DA    L2E6A
         DA    L2E8C
         DA    L2E8C
         DA    L2E8C
         DA    L2EC6
         DA    L2EC6
         DA    L2EC6
         DA    L2EC6
         DA    L2F28
         DA    L2F28
         DA    L2F28
         DA    L2F4A
         DA    L2F4A
         DA    L2F84
         DA    L2F84
         DA    L2E6A
         DA    L3020
         DA    L2FCE
         DW    $FFFF
L2E6A    DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2E8C    DW    $0401
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0401
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2EC6    DW    $0401
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0401
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0401
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0401
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2F28    DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0302
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0302
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2F4A    DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0502
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0602
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0702
         DW    $4100
         DW    $0000
         DW    $0000
         DW    $0802
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0802
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2F84    DW    $0302
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0502
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0602
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0702
         DW    $4100
         DW    $0000
         DW    $0000
         DW    $0802
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0302
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L2FCE    DW    $0902
         DW    $4B00
         DW    $000A
         DW    $0000
         DW    $0902
         DW    $0000
         DW    $0008
         DW    $0000
         DW    $0902
         DW    $4200
         DW    $0006
         DW    $0000
         DW    $0902
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0902
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0902
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0301
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0302
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0301
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0302
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0000
L3020    DW    $000A
         DW    $4300
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000B
         DW    $4500
         DW    $0000
         DW    $0000
         DW    $800B
         DW    $0000
         DW    $0000
         DW    $0000
L3048    DW    $3202
         DW    $3202
         DW    $FFEC
         DW    $FFF7
         DW    $FFF8
         DW    $F7E0
         DW    $F424
         DW    $FEA8
         DW    $FA5C
         DW    $0780
         DW    $3160
L305E    DW    $001A
         DW    $0016
         DW    $002A
         DW    $0024
         DW    $0020
         DW    $0018
         DW    $0012
         DW    $0030
         DW    $0020
         DW    $0030
         DW    $0044
L3074    DW    $0000
         DW    $0000
         DW    $FFEC
         DW    $FFF7
         DW    $FFF8
         DW    $0000
         DW    $0004
         DW    $FFE8
         DW    $FFFC
         DW    $0000
         DW    $0000
L308A    DA    L30B4
         DA    L30B4
         DA    L30B4
         DA    L30B4
         DA    L30D6
         DA    L30D6
         DA    L30D6
         DA    L30D6
         DA    L30F8
         DA    L30F8
         DA    L312A
         DA    L312A
         DA    L314C
         DA    L314C
         DA    L316E
         DA    L316E
         DA    L30B4
         DA    L31D4
         DA    L3188
         DA    L31AA
         DW    $FFFF
L30B4    DW    $0201
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0807
         DW    $C600
         DW    $0000
         DW    $0000
         DW    $0201
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0201
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
L30D6    DW    $0301
         DW    $4A04
         DW    $FFF9
         DW    $FFFC
         DW    $0201
         DW    $0004
         DW    $FFF9
         DW    $0004
         DW    $0301
         DW    $0004
         DW    $FFF9
         DW    $FFFC
         DW    $0201
         DW    $0004
         DW    $FFF9
         DW    $0004
         DW    $0000
L30F8    DW    $0301
         DW    $4A04
         DW    $FFF9
         DW    $FFFC
         DW    $0201
         DW    $0004
         DW    $FFF9
         DW    $0004
         DW    $0301
         DW    $0004
         DW    $FFF9
         DW    $FFFC
         DW    $0201
         DW    $0004
         DW    $FFF9
         DW    $0004
         DW    $0301
         DW    $0004
         DW    $0007
         DW    $FFFC
         DW    $0201
         DW    $0004
         DW    $0007
         DW    $0004
         DW    $0000
L312A    DW    $0301
         DW    $4A04
         DW    $0007
         DW    $FFFC
         DW    $0201
         DW    $0004
         DW    $0007
         DW    $0004
         DW    $0301
         DW    $0004
         DW    $0007
         DW    $FFFC
         DW    $0201
         DW    $0004
         DW    $0007
         DW    $0004
         DW    $0000
L314C    DW    $0807
         DW    $C600
         DW    $0000
         DW    $0000
         DW    $0201
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0807
         DW    $C600
         DW    $0000
         DW    $0000
         DW    $0201
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
L316E    DW    $0201
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0807
         DW    $C600
         DW    $0000
         DW    $0000
         DW    $0201
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
L3188    DW    $0806
         DW    $4400
         DW    $000A
         DW    $8100
         DW    $0806
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0806
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0806
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L31AA    DW    $090B
         DW    $4700
         DW    $0000
         DW    $8100
         DW    $090B
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $090B
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $090B
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $090B
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L31D4    DW    $090B
         DW    $4700
         DW    $0000
         DW    $8100
         DW    $090C
         DW    $4800
         DW    $0000
         DW    $0000
         DW    $090C
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $090D
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $090E
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $090F
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0A10
         DW    $4500
         DW    $0000
         DW    $0000
         DW    $8A10
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3216    DW    $0000
         DW    $2B26
         DW    $2B27
         DW    $0E65
         DW    $0457
         DW    $095F
         DW    $0137
         DW    $3B66
         DW    $29E0
         DW    $5000
         DW    $2120
         DW    $1D5B
         DW    $2116
         DW    $27F1
         DW    $3C8C
         DW    $4F4C
L3236    DW    $001E
         DW    $0020
         DW    $0018
         DW    $0026
         DW    $0024
         DW    $0030
         DW    $002A
         DW    $0020
         DW    $002E
         DW    $003C
         DW    $0014
         DW    $0014
         DW    $0014
         DW    $0014
         DW    $0014
         DW    $0014
L3256    DW    $0000
         DW    $0006
         DW    $0007
         DW    $0005
         DW    $FFF7
         DW    $FFFF
         DW    $FFF7
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FFFB
         DW    $FFF6
         DW    $FFF1
         DW    $FFEC
         DW    $FFEC
L3276    DA    L329E
         DA    L329E
         DA    L329E
         DA    L329E
         DA    L329E
         DA    L329E
         DA    L32C8
         DA    L32C8
         DA    L32C8
         DA    L32C8
         DA    L32C8
         DA    L32C8
         DA    L32F2
         DA    L32F2
         DA    L32F2
         DA    L32F2
         DA    L32F2
         DA    L3336
         DA    L3314
         DW    $FFFF
L329E    DW    $0005
         DW    $4100
         DW    $FFFD
         DW    $FFF1
         DW    $0005
         DW    $0000
         DW    $FFFC
         DW    $FFF5
         DW    $0005
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $FFFC
         DW    $000B
         DW    $0402
         DW    $4500
         DW    $FFFD
         DW    $000F
         DW    $0000
L32C8    DW    $0005
         DW    $4100
         DW    $0002
         DW    $FFF1
         DW    $0005
         DW    $0000
         DW    $0003
         DW    $FFF5
         DW    $0005
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0003
         DW    $000B
         DW    $0402
         DW    $4500
         DW    $0002
         DW    $000F
         DW    $0000
L32F2    DW    $0402
         DW    $4300
         DW    $0000
         DW    $0000
         DW    $0403
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0401
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0008
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3314    DW    $0006
         DW    $4400
         DW    $0006
         DW    $8100
         DW    $0006
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0402
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0000
L3336    DW    $0006
         DW    $4200
         DW    $0000
         DW    $8100
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $8007
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3358    DW    $FBA0
         DW    $0000
         DW    $F9C0
         DW    $2B2A
         DW    $0000
         DW    $06E0
         DW    $24E0
         DW    $0000
L3368    DW    $0034
         DW    $0026
         DW    $001E
         DW    $0016
         DW    $002A
         DW    $0030
         DW    $0046
         DW    $0026
L3378    DW    $0000
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3388    DA    L33B0
         DA    L33B0
         DA    L33B0
         DA    L33B0
         DA    L33B0
         DA    L33B0
         DA    L33D2
         DA    L33D2
         DA    L33D2
         DA    L33D2
         DA    L33D2
         DA    L33D2
         DA    L33F4
         DA    L33F4
         DA    L33F4
         DA    L33F4
         DA    L33B0
         DA    L3420
         DA    L340E
         DW    $FFFF
L33B0    DW    $0103
         DW    $4600
         DW    $FFFB
         DW    $0000
         DW    $0203
         DW    $0000
         DW    $FFFB
         DW    $0000
         DW    $0103
         DW    $0000
         DW    $FFFB
         DW    $0000
         DW    $0203
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L33D2    DW    $0103
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0203
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0103
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0203
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L33F4    DW    $0103
         DW    $4900
         DW    $0000
         DW    $0000
         DW    $0104
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0105
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L340E    DW    $0006
         DW    $4800
         DW    $000A
         DW    $0000
         DW    $0103
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3420    DW    $0006
         DW    $4800
         DW    $0000
         DW    $0000
         DW    $0103
         DW    $4700
         DW    $0000
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0103
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0103
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0103
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0103
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $8006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L347A    DW    $2620
         DW    $2620
         DW    $0000
         DW    $0000
         DW    $FFE8
         DW    $0500
L3486    DW    $003C
         DW    $003C
         DW    $0040
         DW    $0040
         DW    $0058
         DW    $003C
L3492    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FFE8
         DW    $0000
L349E    DA    L3550
         DA    L3550
         DA    L3550
         DA    L3550
         DA    L3550
         DA    L3550
         DA    L3550
         DA    L3550
         DA    L3550
         DA    L3550
         DA    L3582
         DA    L3582
         DA    L3582
         DA    L35B4
         DA    L35B4
         DA    L35B4
         DA    L34C6
         DA    L3610
         DA    L35CE
         DW    $FFFF
L34C6    DW    $00FF
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $4900
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0007
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0007
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3550    DW    $0008
         DW    $8000
         DW    $FFFA
         DW    $0000
         DW    $0008
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0009
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $0009
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $000A
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3582    DW    $0008
         DW    $CA0F
         DW    $FFFA
         DW    $0000
         DW    $0008
         DW    $800F
         DW    $0000
         DW    $0000
         DW    $0009
         DW    $800F
         DW    $FFFC
         DW    $8002
         DW    $0009
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $8000
         DW    $FFFC
         DW    $0000
         DW    $000A
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0000
L35B4    DW    $000A
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L35CE    DW    $000B
         DW    $4A00
         DW    $0005
         DW    $0000
         DW    $000C
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $000D
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $000E
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $000D
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000C
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000B
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0007
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3610    DW    $000B
         DW    $4A00
         DW    $0005
         DW    $0000
         DW    $000B
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $000C
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $000C
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $000D
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000D
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000E
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000E
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $00FE
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L365A    DW    $35C5
         DW    $2A85
         DW    $2445
         DW    $1865
         DW    $0D25
         DW    $0824
         DW    $FE24
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0504
         DW    $140A
         DW    $1E0E
         DW    $0789
L3678    DW    $0020
         DW    $001E
         DW    $001E
         DW    $0020
         DW    $0020
         DW    $0020
         DW    $0020
         DW    $0026
         DW    $0026
         DW    $0028
         DW    $001E
         DW    $0018
         DW    $0012
         DW    $000C
         DW    $000E
L3696    DW    $0005
         DW    $0005
         DW    $0005
         DW    $0005
         DW    $0005
         DW    $0004
         DW    $0004
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $000A
         DW    $000E
         DW    $0009
L36B4    DA    L36DC
         DA    L36DC
         DA    L36FE
         DA    L36FE
         DA    L36FE
         DA    L36FE
         DA    L36FE
         DA    L36FE
         DA    L3720
         DA    L3720
         DA    L3720
         DA    L3742
         DA    L3742
         DA    L3742
         DA    L3742
         DA    L3742
         DA    L36DC
         DA    L37BE
         DA    L378C
         DW    $FFFF
L36DC    DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L36FE    DW    $0001
         DW    $4100
         DW    $FFFB
         DW    $0001
         DW    $0002
         DW    $0000
         DW    $FFFB
         DW    $0002
         DW    $0003
         DW    $0000
         DW    $FFFB
         DW    $FFFE
         DW    $0002
         DW    $0000
         DW    $FFFB
         DW    $FFFF
         DW    $0000
L3720    DW    $0001
         DW    $4100
         DW    $0005
         DW    $0001
         DW    $0002
         DW    $0000
         DW    $0005
         DW    $0002
         DW    $0003
         DW    $0000
         DW    $0005
         DW    $FFFE
         DW    $0002
         DW    $0000
         DW    $0005
         DW    $FFFF
         DW    $0000
L3742    DW    $0005
         DW    $4100
         DW    $FFFB
         DW    $000A
         DW    $0005
         DW    $0000
         DW    $FFFB
         DW    $000A
         DW    $0005
         DW    $0000
         DW    $FFFB
         DW    $000A
         DW    $0004
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0005
         DW    $FFF6
         DW    $0005
         DW    $0000
         DW    $0005
         DW    $FFF6
         DW    $0005
         DW    $0000
         DW    $0005
         DW    $FFF6
         DW    $0000
L378C    DW    $0005
         DW    $4600
         DW    $000A
         DW    $0014
         DW    $0006
         DW    $0000
         DW    $0005
         DW    $000A
         DW    $0006
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0002
         DW    $FFF6
         DW    $0005
         DW    $0000
         DW    $0001
         DW    $FFEC
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L37BE    DW    $0005
         DW    $4600
         DW    $0005
         DW    $000A
         DW    $0005
         DW    $4700
         DW    $0005
         DW    $000A
         DW    $0006
         DW    $4700
         DW    $0004
         DW    $000A
         DW    $0006
         DW    $4800
         DW    $0004
         DW    $000A
         DW    $0007
         DW    $4800
         DW    $0003
         DW    $000A
         DW    $0007
         DW    $4900
         DW    $0003
         DW    $000A
         DW    $0007
         DW    $4900
         DW    $0002
         DW    $000A
         DW    $0008
         DW    $4A00
         DW    $0002
         DW    $000A
         DW    $0008
         DW    $4A00
         DW    $0002
         DW    $000A
         DW    $0008
         DW    $4B00
         DW    $0002
         DW    $000A
         DW    $0008
         DW    $4B00
         DW    $0002
         DW    $000D
         DW    $8008
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3820    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3830    DW    $0028
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $0028
L3840    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3850    DA    L3878
         DA    L3878
         DA    L3878
         DA    L3878
         DA    L3878
         DA    L3878
         DA    L3878
         DA    L389A
         DA    L389A
         DA    L389A
         DA    L38BC
         DA    L38BC
         DA    L38BC
         DA    L38BC
         DA    L38EE
         DA    L38EE
         DA    L3878
         DA    L396A
         DA    L3938
         DW    $FFFF
L3878    DW    $0002
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0000
L389A    DW    $0002
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
L38BC    DW    $0001
         DW    $C509
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $800A
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $800B
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $800C
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $800D
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $800E
         DW    $0000
         DW    $8001
         DW    $0000
L38EE    DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $C509
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $800A
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $800B
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $800C
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $800D
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $800E
         DW    $0000
         DW    $8001
         DW    $0000
L3938    DW    $0004
         DW    $4400
         DW    $0007
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L396A    DW    $0004
         DW    $4400
         DW    $0007
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0005
         DW    $4200
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0007
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0007
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0008
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0008
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $00FE
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L39D4    DW    $10D0
         DW    $0000
         DW    $FE20
         DW    $00A0
         DW    $0320
         DW    $0320
         DW    $0460
         DW    $013E
         DW    $F0ED
         DW    $F0ED
         DW    $F0ED
         DW    $F0ED
         DW    $0C6D
         DW    $0C6E
L39F0    DW    $0036
         DW    $0026
         DW    $0020
         DW    $001C
         DW    $001E
         DW    $001E
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $0010
         DW    $0010
L3A0C    DW    $FFF0
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FFFE
         DW    $FFED
         DW    $FFED
         DW    $FFED
         DW    $FFED
         DW    $FFED
         DW    $FFEE
L3A28    DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DA    L3A50
         DW    $FFFF
L3A50    DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0007
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0008
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0009
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000B
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000C
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000D
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3ABA    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3AD4    DW    $0028
         DW    $0028
         DW    $0044
         DW    $0044
         DW    $0040
         DW    $0040
         DW    $0040
         DW    $0018
         DW    $0020
         DW    $0020
         DW    $0020
         DW    $0020
         DW    $0020
L3AEE    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3B08    DA    L3B30
         DA    L3B30
         DA    L3B30
         DA    L3B30
         DA    L3B30
         DA    L3B30
         DA    L3B30
         DA    L3B52
         DA    L3B52
         DA    L3B52
         DA    L3B52
         DA    L3B74
         DA    L3B74
         DA    L3B9E
         DA    L3BA8
         DA    L3BB2
         DA    L3B30
         DA    L3BDE
         DA    L3BBC
         DW    $FFFF
L3B30    DW    $0001
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $0000
L3B52    DW    $0001
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
L3B74    DW    $0001
         DW    $4706
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $0007
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $0008
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $0009
         DW    $0000
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $8004
         DW    $0000
L3B9E    DW    $0001
         DW    $0000
         DW    $0000
         DW    $8001
         DW    $0000
L3BA8    DW    $0001
         DW    $0000
         DW    $0000
         DW    $8002
         DW    $0000
L3BB2    DW    $0001
         DW    $0000
         DW    $0000
         DW    $8003
         DW    $0000
L3BBC    DW    $0003
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3BDE    DW    $0003
         DW    $4600
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $00FF
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $00FF
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $00FF
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $00FE
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3D08    DW    $0000
         DW    $0000
         DW    $FECB
         DW    $FECB
         DW    $FBAA
         DW    $01DC
         DW    $01DC
         DW    $01DC
         DW    $01DC
L3D1A    DW    $0028
         DW    $0028
         DW    $0024
         DW    $0024
         DW    $0026
         DW    $0020
         DW    $0020
         DW    $0020
         DW    $0020
L3D2C    DW    $0000
         DW    $0000
         DW    $0008
         DW    $0008
         DW    $0007
         DW    $FFFC
         DW    $FFFC
         DW    $FFFC
         DW    $FFFC
L3D3E    DA    L3D66
         DA    L3D66
         DA    L3D88
         DA    L3D88
         DA    L3D88
         DA    L3D88
         DA    L3D88
         DA    L3D88
         DA    L3DAA
         DA    L3DAA
         DA    L3DAA
         DA    L3DCC
         DA    L3DCC
         DA    L3DCC
         DA    L3DCC
         DA    L3DCC
         DA    L3D66
         DA    L3E48
         DA    L3E16
         DW    $FFFF
L3D66    DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3D88    DW    $0001
         DW    $0000
         DW    $FFFB
         DW    $0001
         DW    $0002
         DW    $0000
         DW    $FFFB
         DW    $0002
         DW    $0003
         DW    $0000
         DW    $FFFB
         DW    $FFFE
         DW    $0002
         DW    $0000
         DW    $FFFB
         DW    $FFFF
         DW    $0000
L3DAA    DW    $0001
         DW    $0000
         DW    $0005
         DW    $0001
         DW    $0002
         DW    $0000
         DW    $0005
         DW    $0002
         DW    $0003
         DW    $0000
         DW    $0005
         DW    $FFFE
         DW    $0002
         DW    $0000
         DW    $0005
         DW    $FFFF
         DW    $0000
L3DCC    DW    $0005
         DW    $0000
         DW    $FFFB
         DW    $000A
         DW    $0005
         DW    $0000
         DW    $FFFB
         DW    $000A
         DW    $0005
         DW    $0000
         DW    $FFFB
         DW    $000A
         DW    $0004
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0004
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $8000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $0005
         DW    $FFF6
         DW    $0005
         DW    $0000
         DW    $0005
         DW    $FFF6
         DW    $0005
         DW    $0000
         DW    $0005
         DW    $FFF6
         DW    $0000
L3E16    DW    $0005
         DW    $0000
         DW    $000A
         DW    $0014
         DW    $0006
         DW    $0000
         DW    $0005
         DW    $000A
         DW    $0006
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0006
         DW    $0000
         DW    $0002
         DW    $FFF6
         DW    $0005
         DW    $0000
         DW    $0001
         DW    $FFEC
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3E48    DW    $0001
         DW    $0000
         DW    $0007
         DW    $0001
         DW    $0002
         DW    $0000
         DW    $0007
         DW    $0002
         DW    $0003
         DW    $0000
         DW    $0007
         DW    $FFFD
         DW    $0002
         DW    $0000
         DW    $0007
         DW    $FFFE
         DW    $0001
         DW    $0000
         DW    $0007
         DW    $0001
         DW    $0002
         DW    $0000
         DW    $0007
         DW    $0002
         DW    $0003
         DW    $0000
         DW    $0007
         DW    $FFFD
         DW    $0002
         DW    $0000
         DW    $0007
         DW    $FFFE
         DW    $0001
         DW    $0000
         DW    $0007
         DW    $0001
         DW    $0002
         DW    $0000
         DW    $0007
         DW    $0002
         DW    $0003
         DW    $0000
         DW    $0007
         DW    $FFFD
         DW    $0002
         DW    $0000
         DW    $0007
         DW    $FFFE
         DW    $0001
         DW    $0000
         DW    $0007
         DW    $0001
         DW    $0002
         DW    $0000
         DW    $0007
         DW    $0002
         DW    $0003
         DW    $0000
         DW    $0007
         DW    $FFFD
         DW    $0002
         DW    $0000
         DW    $0007
         DW    $FFFE
         DW    $0001
         DW    $0000
         DW    $0007
         DW    $0001
         DW    $0002
         DW    $0000
         DW    $0007
         DW    $0002
         DW    $0003
         DW    $0000
         DW    $0007
         DW    $FFFD
         DW    $0002
         DW    $0000
         DW    $0007
         DW    $FFFE
         DW    $0001
         DW    $0000
         DW    $0007
         DW    $0001
         DW    $0002
         DW    $0000
         DW    $0007
         DW    $0002
         DW    $0003
         DW    $0000
         DW    $0007
         DW    $FFFD
         DW    $00FE
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3F0A    DW    $0008
         DW    $0005
         DW    $0010
         DW    $0010
         DW    $0010
         DW    $0010
         DW    $0010
         DW    $0010
         DW    $0010
         DW    $0010
         DW    $0010
L3F20    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FFFF
         DW    $0000
L3F36    DW    $0000
L3F38    DW    $0000
L3F3A    DW    $0000
L3F3C    DA    L3F68
         DA    L3F72
         DA    L3F94
         DA    L3FB6
         DA    L3FF0
         DA    L402A
         DA    L4034
         DA    L4056
         DA    L4070
         DA    L408A
         DA    L40AC
L3F52    DA    L3F68
         DA    L3F72
         DA    L3F94
         DA    L40D6
         DA    L4110
         DA    L402A
         DA    L4034
         DA    L4056
         DA    L4070
         DA    L414A
         DA    L416C
L3F68    DW    $8102
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L3F72    DW    $8103
         DW    $0000
         DW    $FFFE
         DW    $0000
         DW    $8004
         DW    $0000
         DW    $FFFA
         DW    $0000
         DW    $8005
         DW    $0000
         DW    $FFFB
         DW    $0000
         DW    $8102
         DW    $0000
         DW    $FFFC
         DW    $0000
         DW    $FF00
L3F94    DW    $8005
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $8004
         DW    $0000
         DW    $0005
         DW    $0000
         DW    $8103
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $8102
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $FF00
L3FB6    DW    $0011
         DW    $0004
         DW    $0000
         DW    $FFEC
         DW    $0011
         DW    $0000
         DW    $0000
         DW    $FFE0
         DW    $0011
         DW    $0000
         DW    $0000
         DW    $FFD9
         DW    $0011
         DW    $0000
         DW    $0000
         DW    $FFE0
         DW    $0011
         DW    $0000
         DW    $0000
         DW    $FFEC
         DW    $0011
         DW    $0000
         DW    $0000
         DW    $FFF8
         DW    $0102
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FF00
L3FF0    DW    $0011
         DW    $0004
         DW    $0004
         DW    $FFEC
         DW    $0011
         DW    $0000
         DW    $0006
         DW    $FFE0
         DW    $0011
         DW    $0000
         DW    $0007
         DW    $FFD9
         DW    $0011
         DW    $0000
         DW    $0007
         DW    $FFE0
         DW    $0011
         DW    $0000
         DW    $0007
         DW    $FFEC
         DW    $0011
         DW    $0000
         DW    $0006
         DW    $FFF8
         DW    $0102
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $FF00
L402A    DW    $800E
         DW    $0000
         DW    $0000
         DW    $0013
         DW    $0000
L4034    DW    $0B06
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0007
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0809
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0102
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FF00
L4056    DW    $0B0A
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0B06
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0C0D
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FF00
L4070    DW    $000F
         DW    $0002
         DW    $0000
         DW    $0013
         DW    $100D
         DW    $0000
         DW    $0000
         DW    $0013
         DW    $000E
         DW    $0000
         DW    $0000
         DW    $0013
         DW    $FF05
L408A    DW    $0012
         DW    $0001
         DW    $FFF8
         DW    $0000
         DW    $0012
         DW    $0000
         DW    $FFFB
         DW    $0000
         DW    $0012
         DW    $0000
         DW    $FFFD
         DW    $0000
         DW    $0012
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FF00
L40AC    DW    $0013
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0013
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0013
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0013
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0014
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FFFF
L40D6    DW    $0011
         DW    $000B
         DW    $0000
         DW    $FFEC
         DW    $0011
         DW    $0000
         DW    $0000
         DW    $FFE0
         DW    $0011
         DW    $0000
         DW    $0000
         DW    $FFD9
         DW    $0011
         DW    $0000
         DW    $0000
         DW    $FFE0
         DW    $0011
         DW    $0000
         DW    $0000
         DW    $FFEC
         DW    $0011
         DW    $0000
         DW    $0000
         DW    $FFF8
         DW    $0102
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FF00
L4110    DW    $0011
         DW    $000B
         DW    $0004
         DW    $FFEC
         DW    $0011
         DW    $0000
         DW    $0006
         DW    $FFE0
         DW    $0011
         DW    $0000
         DW    $0007
         DW    $FFD9
         DW    $0011
         DW    $0000
         DW    $0007
         DW    $FFE0
         DW    $0011
         DW    $0000
         DW    $0007
         DW    $FFEC
         DW    $0011
         DW    $0000
         DW    $0006
         DW    $FFF8
         DW    $0102
         DW    $0000
         DW    $0004
         DW    $0000
         DW    $FF00
L414A    DW    $0012
         DW    $000A
         DW    $FFF8
         DW    $0000
         DW    $0012
         DW    $0000
         DW    $FFFB
         DW    $0000
         DW    $0012
         DW    $0000
         DW    $FFFD
         DW    $0000
         DW    $0012
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FF00
L416C    DW    $0013
         DW    $000A
         DW    $0000
         DW    $0000
         DW    $0013
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0013
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0013
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0014
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $FFFF
L4196    DW    $0000
         DW    $0003
         DW    $0004
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0002
         DW    $0000
         DW    $0005
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0006
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0007
         DW    $0000
         DW    $0005
         DW    $0008
         DW    $0008
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L41D6    DW    $0000
         DW    $0000
         DW    $257C
         DW    $257C
         DW    $FFFC
         DW    $FF5D
         DW    $FEB6
         DW    $FFF0
         DW    $0003
         DW    $0A10
         DW    $FEC3
         DW    $24DF
         DW    $0003
         DW    $1730
         DW    $FFFB
         DW    $0095
         DW    $009B
         DW    $FFF9
         DW    $FFF8
         DW    $1C10
         DW    $3828
L4200    DW    $0000
         DW    $01DE
         DW    $257B
         DW    $257F
         DW    $01DD
         DW    $0140
         DW    $0133
         DW    $008F
         DW    $00A2
         DW    $08CD
         DW    $0002
         DW    $243C
         DW    $00A2
         DW    $15F1
         DW    $0098
         DW    $0093
         DW    $0098
         DW    $FFF8
         DW    $0278
         DW    $1C10
         DW    $3828

L422A    DA    L4256	; level title
         DA    L42E4
         DA    L4376
         DA    L4414
         DA    L44C1
         DA    L4555
         DA    L4604
         DA    L46AD
         DA    L474C
         DA    L4555
         DA    L47D5

L4240    DA    L426B	; level description
         DA    L42FF
         DA    L438C
         DA    L4431
         DA    L44DB
         DA    L457E
         DA    L4619
         DA    L46C1
         DA    L475F
         DA    L457E
         DA    L47ED

L4256    STR   "AT THE CITY'S GATE"
         DB    $00
         DB    $FF
L426B    DB    $40
         DB    $0B
         STR   "AS SO FORETOLD IN ANCIENT LORE"
         DB    $1A
         STR   "HERE STANDS THE OPENING TEST"
         DB    $1A
         STR   "ENTER NOW THIS DEATH'S DOOR"
         DB    $1A
         STR   "AND THUS BEGIN THE QUEST."
         DB    $1A
         DB    $FF
L42E4    STR   "BETWEEN THE CITY'S WALLS"
         DB    $00
         DB    $FF
L42FF    DB    $40
         DB    $0B
         STR   "ENTER NOW, AND BREAK THE SEAL,"
         DB    $16
         STR   "CROSS THE GUARDED SPAN"
         DB    $16
         STR   "BREACH THE WALL OF MEN AND STEEL,"
         DB    $16
         STR   "INTO THE WIZARD'S HAND."
         DB    $16
         DB    $FF
L4376    STR   "IN THE CITY STREETS"
         DB    $00
         DB    $FF
L438C    DB    $40
         DB    $0B
         STR   "HELD FAST IN ZORAS' EVIL THRALL"
         DB    $12
         STR   "THOUGH MEN AND GIANTS BAR THE WAY,"
         DB    $12
         STR   "WITH SWORD, ANSWER BATTLE'S CALL,"
         DB    $16
         STR   "IN THE FADING LIGHT OF DAY."
         DB    $16
         DB    $FF
L4414    STR   "IN THE HEART OF THE FOREST"
         DB    $00
         DB    $FF
L4431    DB    $40
         DB    $0B
         STR   "WHERE TREES ARE TWISTED,"
         DB    $16
         STR   "GNARLED, AND BENT"
         DB    $16
         STR   "BY THE WIZARD'S WICKED HAND"
         DB    $16
         STR   "AND CREATURES MOST FOUL ARE SENT"
         DB    $16
         STR   "TO CORRUPT AND PLAGUE THE LAND."
         DB    $16
         DB    $FF
L44C1    STR   "IN THE LAND OF THE DEAD"
         DB    $00
         DB    $FF
L44DB    DB    $40
         DB    $0B
         STR   "THERE WINDS THE HERO'S PATH,"
         DB    $16
         STR   "WHERE GHOULS AND SPECTRES FORM"
         DB    $16
         STR   "TO SCREAM AND HOWL THEIR WRATH"
         DB    $16
         STR   "ABOVE THE RISING STORM."
         DB    $16
         DB    $FF
L4555    STR   "IN THE FOYER OF THE CASTLE"
         DB    $00
         STR   "CRAGGAMOOR"
         DB    $00
         DB    $FF
L457E    DB    $40
         DB    $0B
         STR   "AMONG SHADOWS CAST"
         DB    $16
         STR   "BY VAULTED TOWERS"
         DB    $16
         STR   "WHERE NAMELESS HORRORS DWELL"
         DB    $16
         STR   "THERE TO CHALLENGE ZORAS' POWERS"
         DB    $16
         STR   "AND SEND HIM BACK TO HELL."
         DB    $16
         DB    $FF
L4604    STR   "DESCEND THE STAIRS"
         DB    $00
         DB    $FF
L4619    DB    $40
         DB    $0B
         STR   "THRU ARCHES MADE OF TIMELESS STONES"
         DB    $0F
         STR   "AND ENTER THE GATHERING GLOOM,"
         DB    $16
         STR   "WHERE THE CHILL,"
         DB    $1A
         STR   "DANK AIR GNAWS ON BONES"
         DB    $1A
         STR   "AND THE SILENCE IS LIKE A TOMB."
         DB    $1A
         DB    $FF
L46AD    STR   "IN A PASSAGE DEEP"
         DB    $00
         DB    $FF
L46C1    DB    $40
         DB    $0B
         STR   "AND DARK WITHIN OUR MOTHER EARTH"
         DB    $12
         STR   "THERE COMES THE RISING FLOOD"
         DB    $16
         STR   "AND WITH HER THUNDERING"
         DB    $1A
         STR   "CRIES OF BIRTH"
         DB    $1A
         STR   "THERE FLOWS HER MOLTEN BLOOD."
         DB    $1A
         DB    $FF
L474C    STR   "IN THE CATACOMBS"
         DB    $00
L475E    DB    $FF
L475F    DB    $40
         DB    $0B
         STR   "ENCOUNTER NOW, THE BEAST,"
         DB    $1A
         STR   "TO HARNESS, MOUNT AND RIDE,"
         DB    $1A
         STR   "FIRST LET THE MONSTER FEAST,"
         DB    $1A
         STR   "TO SURVIVE THE RISING TIDE."
         DB    $1A
         DB    $FF
L47D5    STR   "AT THE WIZARD'S TOWER"
         DB    $00
         DB    $FF
L47ED    DB    $40
         DB    $0B
         STR   "THRU THE ARCH AND CLIMB THE STAIR,"
         DB    $12
         STR   "TO FIGHT TILL FINAL BREATH"
         DB    $16
         STR   "THE MAGICIAN ZORAS IN HIS LAIR"
         DB    $1A
         STR   "ON TO VICTORY, OR TO DEATH."
         DB    $1A
         DB    $FF

L486D    DA    L4873
         DA    L4895
         DA    L4901
L4873    DB    $40
         DB    $0B
         STR   "SELECT STARTING LEVEL: (0..A)"
         DB    $00
         DB    $FF
L4895    DB    $40
         DB    $06
         STR   "MOVE YOUR JOYSTICK TO THE UPPER LEFT"
         DB    $00
         STR   "HAND CORNER AND PRESS FIRE BUTTON"
         DB    $00
         STR   " "
         DB    $01
         STR   "PRESS A KEY FOR NO JOYSTICK"
         DB    $00
         DB    $FF
L4901    DB    $40
         DB    $06
         STR   "MOVE YOUR JOYSTICK TO THE LOWER RIGHT"
         DB    $00
         STR   "HAND CORNER AND PRESS FIRE BUTTON"
         DB    $00
         STR   " "
         DB    $01
         STR   "PRESS A KEY FOR NO JOYSTICK"
         DB    $00
         DB    $FF

L496E    DA    L4984
         DA    L49AA
         DA    L49D1
         DA    L49F7
         DA    L4A07
         DA    L4A2D
         DA    L4A51
         DA    L4A75
         DA    L4A81
         DA    L4AA7
         DA    L4ACC
L4984    STR   "AND SO THE CYCLE ENDS. THE PROPHESY"
         DB    $01
         DB    $FF
L49AA    STR   "IS FULFILLED AND ZORAS IS DESTROYED,"
         DB    $01
         DB    $FF
L49D1    STR   "HIS ESSENCE BANISHED TO THE DEEPEST"
         DB    $01
         DB    $FF
L49F7    STR   "PITS OF HELL."
         DB    $01
         DB    $FF
L4A07    STR   "IN THEIR JOY, THE PEOPLE RISE UP AS"
         DB    $01
         DB    $FF
L4A2D    STR   "ONE, DECLARING YOU TO BE THE TRUE"
         DB    $01
         DB    $FF
L4A51    STR   "RULER AND SAVIOUR OF THE NORTHERN"
         DB    $01
         DB    $FF
L4A75    STR   "KINGDOMS."
         DB    $01
         DB    $FF
L4A81    STR   "AS THE LIGHT RETURNS, THE LEGION OF"
         DB    $01
         DB    $FF
L4AA7    STR   "DARKNESS CALLED UP BY ZORAS' MAGIC"
         DB    $01
         DB    $FF
L4ACC    STR   "SLITHERS BACK INTO THE SHADOWS..."
         DB    $01
         DB    $FF

L4AF0    DA    L4B00
         DA    L4B29
         DA    L4B41
         DA    L4B63
         DA    L4B7B
         DA    L4B9D
         DA    L4BC0
         DA    L4BE2
L4B00    STR   "APPLE IIGS VERSION BY VISIONWARE, INC."
         DB    $01
         DB    $FF
L4B29    STR   "MOVEMENT AND MAGIC BY"
         DB    $01
         DB    $FF
L4B41    STR   "SCOTT PATTERSON AND TIM JOHNSON"
         DB    $01
         DB    $FF
L4B63    STR   "ARTWORK ADAPTATION BY"
         DB    $01
         DB    $FF
L4B7B    STR   "JENNIFER MCGAW AND MATTHEW TIMM"
         DB    $01
         DB    $FF
L4B9D    STR   "SPECIAL THANKS TO TODD DAUGHERTY"
         DB    $01
         DB    $FF
L4BC0    STR   "BASED ON AN ORIGINAL PROGRAM BY"
         DB    $01
         DB    $FF
L4BE2    STR   "SOREN GRONBECH AND TORBEN B. LARSEN"
         DB    $01
         DB    $FF

L4C08    DA    L4C0A
L4C0A    DB    $00
L4C0B    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L4C3C    DB    $00
         DB    $00
L4C3E    DB    $00
         DB    $00

L4C40    DA    L4C6A	; 00 - PRESS FIRE TO CONTINUE
         DA    L4C83	; 01 - PRESS FIRE TO BEGIN
         DA    L4C99	; 02 - PRESS R TO SEE REPLAY
         DA    L4E65	; 03 - PLEASE INSERT DISK
         DA    L4CB3	; 04 - PRESS BUTTON TO CONTINUE PLAY
         DA    L4CD3	; 05 - ENTER NAME IN HALL OF FAME
         DA    L4CF0	; 06 - ** REPLAY **
         DA    L4D08	; 07 - ** DEMO **
         DA    L4D15	; 08 - MORE HITS REQUIRED FOR EACH ENEMY
         DA    L4D39	; 09 - JUMP OVER BARRELS
         DA    L4D4D	; 0A - BEWARE OF TRAPS
         DA    L4D5F	; 0B - JUMP ONTO BLOCKS
         DA    L4D72	; 0C - HINT: THE ANIMAL IS HUNGRY
         DA    L4D90	; 0D - MAGIC ZAPPER
         DA    L4D9F	; 0E - POWER SHIELD
         DA    L4DAE	; 0F - HITSTRENGTH INCREASED
         DA    L4DC6	; 10 - EXTRA LIFE
         DA    L4DD3	; 11 - YOU FELL INTO A HOLE AND LOST STRENGTH
         DA    L4DFC	; 12 - WATCH OUT FOR MORE HOLES
         DA    L4E1A	; 13 - ANIMAL NOW HAS STRENGTH TO JUMP
         DA    L4E3C	; 14 - SCORE -- HITSTRENGTH -- LIVES --
         
L4C6A    STR   "PRESS FIRE TO CONTINUE"
         DB    $00
         DB    $FF
L4C83    STR   "PRESS FIRE TO BEGIN"
         DB    $00
         DB    $FF
L4C99    STR   "PRESS 'R' TO SEE REPLAY"
         DB    $00
         DB    $FF
L4CB3    STR   "PRESS BUTTON TO CONTINUE PLAY"
         DB    $00
         DB    $FF
L4CD3    STR   "ENTER NAME IN HALL OF FAME"
         DB    $00
         DB    $FF
L4CF0    STR   "** REPLAY ** (Q=EXIT)"
         DB    $01
         DB    $FF
L4D08    STR   "** DEMO **"
         DB    $01
         DB    $FF
L4D15    STR   "MORE HITS REQUIRED FOR EACH ENEMY"
         DB    $00
         DB    $FF
L4D39    STR   "JUMP OVER BARRELS"
         DB    $01
         DB    $FF
L4D4D    STR   "BEWARE OF TRAPS"
         DB    $01
         DB    $FF
L4D5F    STR   "JUMP ONTO BLOCKS"
         DB    $01
         DB    $FF
L4D72    STR   "HINT: THE ANIMAL IS HUNGRY!"
         DB    $00
         DB    $FF
L4D90    STR   "MAGIC ZAPPER"
         DB    $00
         DB    $FF
L4D9F    STR   "POWER SHIELD"
         DB    $00
         DB    $FF
L4DAE    STR   "HITSTRENGTH INCREASED"
         DB    $00
         DB    $FF
L4DC6    STR   "EXTRA LIFE"
         DB    $00
         DB    $FF
L4DD3    STR   "YOU FELL INTO A HOLE AND LOST STRENGTH"
         DB    $00
         DB    $FF
L4DFC    STR   "WATCH OUT FOR MORE HOLES..."
         DB    $00
         DB    $FF
L4E1A    STR   "ANIMAL NOW HAS STRENGTH TO JUMP"
         DB    $00
         DB    $FF
L4E3C    STR   "SCORE:------   HITSTRENGTH:-   LIVES:-"
         DB    $01
         DB    $FF
L4E65    STR   "PLEASE INSERT DISK 1 IN ANY DRIVE"
         DB    $00
         DB    $FF

*
* HIGH-SCORE TABLE
*

L4E89    DA    L4E93
L4E8B    DA    L4EB0
L4E8D    DA    L4ECD
L4E8F    DA    L4EEA
L4E91    DA    L4F07

L4E93    STR   "1 ***  **** ***  000000 00"
         DB    $01
         DB    $FF
L4EB0    STR   "2 *  * *     *   000000 00"
         DB    $01
         DB    $FF
L4ECD    STR   "3 *  * ****  *   000000 00"
         DB    $01
         DB    $FF
L4EEA    STR   "4 *  *    *  *   000000 00"
         DB    $01
         DB    $FF
L4F07    STR   "5 ***  **** ***  000000 00"
         DB    $01
         DB    $FF

L4F24    DA    L4F26
L4F26    STR   "                          "
         DB    $01
         DB    $FF

L4F43    DW    $0034
L4F45    DW    $002F
         DW    $001C
         DW    $003D
         DW    $0028
         DW    $003D
         DW    $0034
         DW    $003D
         DW    $0010
         DW    $0013
         DW    $0010
         DW    $0021
         DW    $0010
         DW    $002F
         DW    $0010
         DW    $003D
         DW    $0010
         DW    $0005
         DW    $001C
         DW    $0005
         DW    $0028
         DW    $0005
         DW    $0034
         DW    $0005
         DW    $0071
         DW    $002F
         DW    $0056
         DW    $0013
         DW    $0056
         DW    $0021
         DW    $0056
         DW    $002F
         DW    $0056
         DW    $003D
         DW    $007A
         DW    $0013
         DW    $007A
         DW    $0021
         DW    $007A
         DW    $002F
         DW    $007A
         DW    $003D
         DW    $0056
         DW    $0005
         DW    $0062
         DW    $0005
         DW    $006E
         DW    $0005
         DW    $007A
         DW    $0005
         DW    $00C8
         DW    $0005
         DW    $00C8
         DW    $0013
         DW    $00C8
         DW    $0021
         DW    $00C8
         DW    $002F
         DW    $00C8
         DW    $003D
         DW    $00AC
         DW    $0013
         DW    $00BA
         DW    $0013
         DW    $009E
         DW    $0005
         DW    $009E
         DW    $0013
         DW    $009E
         DW    $0021
         DW    $009E
         DW    $002F
         DW    $009E
         DW    $003D
         DW    $0104
         DW    $003D
         DW    $00FE
         DW    $003D
         DW    $010C
         DW    $003D
         DW    $011A
         DW    $003D
         DW    $0104
         DW    $0021
         DW    $00FE
         DW    $0021
         DW    $010C
         DW    $0021
         DW    $011A
         DW    $0021
         DW    $0104
         DW    $0005
         DW    $00FE
         DW    $0005
         DW    $010C
         DW    $0005
         DW    $011A
         DW    $0005
         DW    $00EC
         DW    $0005
         DW    $00EC
         DW    $0013
         DW    $00EC
         DW    $0021
         DW    $00EC
         DW    $002F
         DW    $00EC
         DW    $003D
         DW    $0022
         DW    $0064
         DW    $0022
         DW    $009C
         DW    $0010
         DW    $0064
         DW    $0010
         DW    $0072
         DW    $0010
         DW    $0080
         DW    $0010
         DW    $008E
         DW    $0010
         DW    $009C
         DW    $0036
         DW    $0064
         DW    $0036
         DW    $0072
         DW    $0036
         DW    $0080
         DW    $0036
         DW    $008E
         DW    $0036
         DW    $009C
         DW    $0066
         DW    $008E
         DW    $0072
         DW    $009C
         DW    $007E
         DW    $008E
         DW    $007E
         DW    $0080
         DW    $007E
         DW    $0072
         DW    $007E
         DW    $0064
         DW    $005C
         DW    $0064
         DW    $005A
         DW    $0072
         DW    $005A
         DW    $0080
         DW    $00AC
         DW    $009C
         DW    $00B8
         DW    $009C
         DW    $00C4
         DW    $009C
         DW    $00D0
         DW    $009C
         DW    $00AC
         DW    $0080
         DW    $00B8
         DW    $0080
         DW    $00C4
         DW    $0080
         DW    $00D0
         DW    $0080
         DW    $00AC
         DW    $0064
         DW    $00B8
         DW    $0064
         DW    $00C4
         DW    $0064
         DW    $00D0
         DW    $0064
         DW    $00A4
         DW    $0064
         DW    $00A4
         DW    $0072
         DW    $00A4
         DW    $0080
         DW    $00A4
         DW    $008E
         DW    $00A4
         DW    $009C
         DW    $011A
         DW    $0080
         DW    $010C
         DW    $0080
         DW    $00FE
         DW    $0080
         DW    $011A
         DW    $0072
         DW    $011A
         DW    $009C
         DW    $0115
         DW    $0097
         DW    $00FE
         DW    $0064
         DW    $010C
         DW    $0064
         DW    $011A
         DW    $0064
         DW    $00F0
         DW    $0064
         DW    $00F0
         DW    $0072
         DW    $00F0
         DW    $0080
         DW    $00F0
         DW    $008E
         DW    $00F0
         DW    $009C
         DW    $FFFF

L50ED    DA    L5105
         DA    L5141
         DA    L5171
         DA    L5191
         DA    L51D5
         DA    L51FD
         DA    L5213
         DA    L522B
         DA    L5241
         DA    L526D
         DA    L5213
         DA    L5297
L5105    DA    L510D
         DA    L5117
         DA    L5129
         DA    L5135
L510D    ADRL  $00068000
         DW    $0000
         DW    $FFFF
         DW    $FFFF
L5117    ADRL  $00030000
         DW    $0001
         DW    $0002
         DW    $0003
         DW    $0004
         DW    $0005
         DW    $FFFF
         DW    $FFFF
L5129    ADRL  $00030000
         DW    $0006
         DW    $0007
         DW    $FFFF
         DW    $FFFF
L5135    ADRL  $00030000
         DW    $0008
         DW    $0009
         DW    $FFFF
         DW    $FFFF
L5141    DA    L5145
         DA    L5167
L5145    ADRL  $00030000
         DW    $0000
         DW    $0001
         DW    $0002
         DW    $0003
         DW    $0004
         DW    $FFFF
         ADRL  $00E00800
         DW    $0006
         DW    $FFFF
         ADRL  $00038000
         DW    $0005
         DW    $FFFF
         DW    $FFFF
L5167    ADRL  $00E00800
         DW    $0007
         DW    $FFFF
         DW    $FFFF
L5171    DA    L5173
L5173    ADRL  $00030000
         DW    $0000
         DW    $0001
         DW    $0002
         DW    $0003
         DW    $0004
         DW    $FFFF
         ADRL  $00038000
         DW    $0005
         DW    $0006
         DW    $0007
         DW    $FFFF
         DW    $FFFF
L5191    DA    L5197
         DA    L51B9
         DA    L51C3
L5197    ADRL  $00030000
         DW    $0000
         DW    $0001
         DW    $0003
         DW    $0002
         DW    $0005
         DW    $000B
         DW    $0007
         DW    $0008
         DW    $0009
         DW    $FFFF
         ADRL  $00E02800
         DW    $000C
         DW    $FFFF
         DW    $FFFF
L51B9    ADRL  $00E00800
         DW    $000A
         DW    $FFFF
         DW    $FFFF
L51C3    ADRL  $00E02000
         DW    $0006
         DW    $FFFF
         ADRL  $00E05400
         DW    $0004
         DW    $FFFF
         DW    $FFFF
L51D5    DA    L51D9
         DA    L51EF
L51D9    ADRL  $00030000
         DW    $0000
         DW    $0001
         DW    $0002
         DW    $0003
         DW    $0004
         DW    $0005
         DW    $0006
         DW    $FFFF
         DW    $FFFF
L51EF    ADRL  $00E00800
         DW    $0007
         DW    $0008
         DW    $0009
         DW    $FFFF
         DW    $FFFF
L51FD    DA    L51FF
L51FF    ADRL  $00030000
         DW    $0000
         DW    $0001
         DW    $0002
         DW    $0003
         DW    $0009
         DW    $000A
         DW    $FFFF
         DW    $FFFF
L5213    DA    L5215
L5215    ADRL  $00030000
         DW    $0000
         DW    $0001
         DW    $0002
         DW    $0003
         DW    $0004
         DW    $0005
         DW    $0006
         DW    $FFFF
         DW    $FFFF
L522B    DA    L522D
L522D    ADRL  $00030000
         DW    $0000
         DW    $0001
         DW    $0002
         DW    $0003
         DW    $0004
         DW    $0005
         DW    $FFFF
         DW    $FFFF
L5241    DA    L5245
         DA    L525D
L5245    ADRL  $00030000
         DW    $0000
         DW    $0001
         DW    $0002
         DW    $0003
         DW    $FFFF
         ADRL  $00E00800
         DW    $0004
         DW    $FFFF
         DW    $FFFF
L525D    ADRL  $00E04800
         DW    $0005
         DW    $0006
         DW    $0007
         DW    $0008
         DW    $FFFF
         DW    $FFFF
L526D    DA    L5271
         DA    L5285
L5271    ADRL  $00030000
         DW    $0003
         DW    $0001
         DW    $0000
         DW    $0002
         DW    $0004
         DW    $0005
         DW    $FFFF
         DW    $FFFF
L5285    ADRL  $00E00800
         DW    $000C
         DW    $000D
         DW    $000E
         DW    $000F
         DW    $0010
         DW    $FFFF
         DW    $FFFF
L5297    DA    L529B
         DA    L52B7
L529B    ADRL  $00030000
         DW    $0000
         DW    $0001
         DW    $0002
         DW    $0003
         DW    $0004
         DW    $0005
         DW    $FFFF
         ADRL  $00E03800
         DW    $0006
         DW    $FFFF
         DW    $FFFF
L52B7    ADRL  $00E00800
         DW    $0007
         DW    $0008
         DW    $FFFF
         DW    $FFFF
L52C3    DA    L52DB
         DA    L5343
         DA    L5383
         DA    L53D3
         DA    L5443
         DA    L5493
         DA    L54EB
         DA    L553B
         DA    L559B
         DA    L5601
         DA    L54EB
         DA    L5691
L52DB    DA    L52F5
         DA    L52FB
         DA    L5301
         DA    L5307
         DA    L530D
         DA    L5313
         DA    L5319
         DA    L531F
         DA    L5325
         DA    L532B
         DA    L5331
         DA    L5337
         DA    L533D
L52F5    HEX   0051133F4802 ; 81BA
L52FB    HEX   4008341BFF02
L5301    HEX   4808301B6002
L5307    HEX   500C3624FF02
L530D    HEX   5C032812A002
L5313    HEX   5F0150000000
L5319    HEX   0082343FFF02
L531F    HEX   8058343FFF02
L5325    HEX   0051133F8002
L532B    HEX   801D133F8002
L5331    HEX   4008341BFF02
L5337    HEX   5C032E129002
L533D    HEX   40823436FF00
L5343    DA    L5353
         DA    L5359
         DA    L535F
         DA    L5365
         DA    L536B
         DA    L5371
         DA    L5377
         DA    L537D
L5353    HEX   004036362800
L5359    HEX   600418126002
L535F    HEX   68041812FF02
L5365    HEX   7008181BFF02
L536B    HEX   78072A1B5002
L5371    HEX   804D6E3FB002
L5377    HEX   807B373FFF02
L537D    HEX   804D003F0000
L5383    DA    L5397
         DA    L539D
         DA    L53A3
         DA    L53A9
         DA    L53AF
         DA    L53B5
         DA    L53BB
         DA    L53C1
         DA    L53C7
         DA    L53CD
L5397    HEX   004020367000
L539D    HEX   60041812A002
L53A3    HEX   68041812FF02
L53A9    HEX   7008181BFF02
L53AF    HEX   78072A1B6802
L53B5    HEX   801E342DD002
L53BB    HEX   A0192C2D9002
L53C1    HEX   C0351B36FF02
L53C7    HEX   A019202D7002
L53CD    HEX   A019182D5802
L53D3    DA    L53EF
         DA    L53F5
         DA    L53FB
         DA    L5401
         DA    L5407
         DA    L540D
         DA    L5413
         DA    L5419
         DA    L541F
         DA    L5425
         DA    L542B
         DA    L5431
         DA    L5437
         DA    L543D
L53EF    HEX   004038362800
L53F5    HEX   800C3424F002
L53FB    HEX   A00C3024FF02
L5401    HEX   90102C24FF02
L5407    HEX   E00C3424B002
L540D    HEX   AC041A12B002
L5413    HEX   D808341BE002
L5419    HEX   B808341BC002
L541F    HEX   F0103424FF02
L5425    HEX   6020342D6800
L542B    HEX   C018342DA002
L5431    HEX   B008341B8002
L5437    HEX   C02C2C36E002
L543D    HEX   C018342D6802
L5443    DA    L5457
         DA    L545D
         DA    L5463
         DA    L5469
         DA    L546F
         DA    L5475
         DA    L547B
         DA    L5481
         DA    L5487
         DA    L548D
L5457    HEX   6020302D2000
L545D    HEX   F007341BB002
L5463    HEX   00253436FF02
L5469    HEX   F808341BD002
L546F    HEX   300C3424FF02
L5475    HEX   3C043412A002
L547B    HEX   8068343FE002
L5481    HEX   00303436FF02
L5487    HEX   3C043412FF02
L548D    HEX   300B3424E002
L5493    DA    L54A9
         DA    L54AF
         DA    L54B5
         DA    L54BB
         DA    L54C1
         DA    L54C7
         DA    L54CD
         DA    L54D3
         DA    L54D9
         DA    L54DF
         DA    L54E5
L54A9    HEX   8060203F4002
L54AF    HEX   E020302D2800
L54B5    HEX   003020368002
L54BB    HEX   60181C2D3802
L54C1    HEX   8060283F8002
L54C7    HEX   8060303FFF02
L54CD    HEX   6018202D2C02
L54D3    HEX   6018262D3802
L54D9    HEX   60182C2D4402
L54DF    HEX   30103024FF02
L54E5    HEX   7806301BFF02
L54EB    DA    L54FF
         DA    L5505
         DA    L550B
         DA    L5511
         DA    L5517
         DA    L551D
         DA    L5523
         DA    L5529
         DA    L552F
         DA    L5535
L54FF    HEX   00202C2D3800
L5505    HEX   2016342D8002
L550B    HEX   C0373036F002
L5511    HEX   6018342DD002
L5517    HEX   800C3424FF02
L551D    HEX   90103424B002
L5523    HEX   A0103424C002
L5529    HEX   C03734368002
L552F    HEX   C03734368002
L5535    HEX   C02934368002
L553B    DA    L5553
         DA    L5559
         DA    L555F
         DA    L5565
         DA    L556B
         DA    L5571
         DA    L5577
         DA    L557D
         DA    L5583
         DA    L5589
         DA    L558F
         DA    L5595
L5553    HEX   6020342D5000
L5559    HEX   3C043612A002
L555F    HEX   00303436FF02
L5565    HEX   E020342D6000
L556B    HEX   300A3424FF02
L5571    HEX   8050343FD002
L5577    HEX   E0204D1BFF02
L557D    HEX   E020381BD002
L5583    HEX   E020301BA802
L5589    HEX   E020281B8002
L558F    HEX   E020201B5802
L5595    HEX   E020181B3002
L559B    DA    L55B3
         DA    L55B9
         DA    L55BF
         DA    L55C5
         DA    L55CB
         DA    L55D1
         DA    L55D7
         DA    L55DD
         DA    L55E3
         DA    L55E9
         DA    L55EF
         DA    L55F5
L55B3    HEX   003018363002
L55B9    HEX   80403436FF02
L55BF    HEX   300F3424C002
L55C5    HEX   600F3424E002
L55CB    HEX   C0403436FF02
L55D1    HEX   6020342DA000
L55D7    HEX   C0363436FF02
L55DD    HEX   3008341BC002
L55E3    HEX   3C043412FF02
L55E9    HEX   80103424FF02
L55EF    HEX   00301C364002
L55F5    HEX   003020365002
         HEX   003020366002 ; NOT USED

L5601    DA    L5625
         DA    L562B
         DA    L5631
         DA    L5637
         DA    L563D
         DA    L5643
         DA    L5649
         DA    L564F
         DA    L5655
         DA    L565B
         DA    L5661
         DA    L5667
         DA    L566D
         DA    L5673
         DA    L5679
         DA    L567F
         DA    L5685
         DA    L568B
L5625    HEX   004034364000
L562B    HEX   74043612A002
L5631    HEX   7805341BFF02
L5637    HEX   E020342D6000
L563D    HEX   6014342DE002
L5643    HEX   8008341BFF00
L5649    HEX   E0204D1BFF02
L564F    HEX   E020381BD002
L5655    HEX   E020301BA802
L565B    HEX   E020281B8002
L5661    HEX   E020201B5802
L5667    HEX   E020181B3002
L566D    HEX   C020342DE000
L5673    HEX   80303436FF02
L5679    HEX   B00E3424FF02
L567F    HEX   6013342DFF02
L5685    HEX   E020342D9000
L568B    HEX   60143412E002

L5691    DA    L56AF
         DA    L56B5
         DA    L56BB
         DA    L56C1
         DA    L56C7
         DA    L56CD
         DA    L56D3
         DA    L56D9
         DA    L56DF
         DA    L56E5
         DA    L56EB
         DA    L56F1
         DA    L56F7
         DA    L56FD
         DA    L5703
L56AF    HEX   0020342D7000
L56B5    HEX   2020342D5800
L56BB    HEX   601C382DFF02
L56C1    HEX   E007341BFF02
L56C7    HEX   E80C381BFF02
L56CD    HEX   F0103424C802
L56D3    HEX   80521A3FFF02
L56D9    HEX   E0103424F002
L56DF    HEX   6020342DE802
L56E5    HEX   2020342D7000
L56EB    HEX   2020342D8800
L56F1    HEX   2020342DA000
L56F7    HEX   2020342DB800
L56FD    HEX   2020342DD000
L5703    HEX   2020342DE800

         MX    %00
         
L5709    LDAL  $E1BFFF
         BPL   L5762
         AND   #$FF00

         BIT   $A4	; REPLAY MODE?
         BMI   L5729
         BIT   $68	; DEMO MODE?
         BMI   L5729

         CMP   #$8D00	; RETURN
         BEQ   L575C
         CMP   #$B100	; 1
         BCC   L5729
         CMP   #$BA00	; 9+1
         BCC   L575C

L5729    TAY
         LDA   #$0003
         STAL  $E1C026
         STAL  $E1C010
         CPY   #$8800	; LEFT ARROW
         BEQ   L577E
         CPY   #$8A00	; DOWN ARROW
         BEQ   L577E
         CPY   #$9500	; RIGHT ARROW
         BEQ   L5787
         CPY   #$8B00	; UP ARROW
         BEQ   L5787
         BIT   $68	; DEMO MODE?
         BMI   L575D
         CPY   #$D100	; Q
         BEQ   L5777
         CPY   #$F100	; q
         BEQ   L5777
         CPY   #$A000	; SPACE
         BEQ   L579A
L575C    RTS

L575D    BIT   LE4C1
         BMI   L5770
L5762    BIT   $68	; DEMO MODE?
         BPL   L575C	; YES
         LDAL  $E1C060
         ORAL  $E1C061
         BPL   L575C

L5770    LDA   #$01FF
         TCS
         JMP   L8248

L5777    LDA   #$01FF	; QUIT
         TCS
         JMP   L82C4	; PLAY AGAIN

*
* VOLUME UP/DOWN
*

L577E    SEP   #$20
         LDA   $D6
         DEC
         BNE   L5793
         BRA   L5790
L5787    SEP   #$20
         LDA   $D6
         INC
         CMP   #$10
         BCC   L5793
L5790    REP   #$20
         RTS

L5793    STA   $D6
         REP   #$20
         JMP   L7FB2

L579A    LDY   #$0000
         LDX   #$0001
L57A0    DEY
         BNE   L57A0
         DEX
         BPL   L57A0
         STAL  $E1C010
L57AA    LDAL  $E1BFFF
         BPL   L57AA
         STAL  $E1C010
         XBA
         AND   #$00FF
         CMP   #$00A0
         BNE   L57AA
         RTS

*
* DISPLAY LEVEL TITLE
*

L57BE    LDA   $6A        ; LEVEL
         ASL
         TAX
         CPX   #$000A
         BCC   L57D3
         LDA   #$0001	; INTERMEDIARY PICTURE
         LDY   L21A6,X
         JSL   loadFILE
         BRA   L5826

L57D3    LDA   #$0001	; THE MAP
         LDY   L219C,X
         JSL   loadFILE
         LDA   #$FFFF
         LDX   #$0000
         JSR   LF329
         LDA   #L422A	; DISPLAY LEVEL TITLE
         LDY   $6A
         LDX   #$2000
         JSR   LF1A4
         JSR   L585C	; DEMO?
         LDA   $6A	; DRAW THE ARROW
         ASL
         TAY
         LDX   L21D2,Y
         LDY   #$001E
         SEC
L57FF    LDAL  $012002,X
         AND   L21FC,Y
         ORA   L21DC,Y
         STAL  $012002,X
         DEY
         DEY
         LDAL  $012000,X
         AND   L21FC,Y
         ORA   L21DC,Y
         STAL  $012000,X
         TXA
         SBC   #$00A0
         TAX
         DEY
         DEY
         BPL   L57FF
L5826    JMP   LE7B1

*
* DISPLAY LEVEL DESCRIPTION
*

L5829    LDA   $6A
         ASL
         TAX
         LDA   #$0001	; LOAD SC.PIC
         LDY   L21BC,X
         JSL   loadFILE
         LDA   #$FFFF
         LDX   #$0000
         JSR   LF329
         LDA   #L422A	; LEVEL NAME
         LDY   $6A
         LDX   #$30E0
         JSR   LF1A4
         LDA   #L4240	; LEVEL DESCRIPTION
         LDY   $6A
         LDX   #$41C0
         JSR   LF1A4
         JSR   L585C	; DEMO?
         JMP   LE7A8

L585C    BIT   $68
         BPL   L586C
         LDA   #L4C40	; DEMO
         LDY   #$0007
         LDX   #$96C4
         JSR   LF1A4
L586C    RTS

*
*
*

L586D    RTS

L586E    STZ   $A4	; NO REPLAY MODE
         BIT   $68	; IS IT DEMO MODE?
         BMI   L586D	; YES, RETURN
         BIT   L5A63	; IS JOYSTICK CALIBRATED?
         BMI   L587C	; YES
         JSR   L5990	; NO, CALIBRATE IT

L587C    LDA   $E0	; WAS AN EVENT
         BNE   L5887	; ALREADY RECORDED?
         LDA   $E2
         CMP   #$000A
         BEQ   L588A	; NO
L5887    BRL   L591F	; YES, PRESS A KEY, R FOR REPLAY

*
* SELECT HERO OR HEROINE
*

L588A    JSR   LE6B8
         LDA   #$0001	; S1/SE.PIC
         LDY   #$0009
         JSL   loadFILE
         LDA   #$0006	; S1/SE.SND
         LDY   #$0000
         JSL   loadFILE
         LDA   #$0001
         JSR   L7F4C
         LDA   #$0000
         JSR   L7FBD
         LDA   #$0000
         LDX   #$0006
         JSR   LE7A5
         LDA   #$0000
         JSR   L8091
         LDA   #$0003
         STAL  $E1C026
         STAL  $E1C010
         STZ   $16
L58C9    LDY   #$0004
L58CC    LDAL  $E1BFFF
         BPL   L58E9
         STAL  $E1C010
         AND   #$FF00
         LDX   #$0000
         CMP   #$B400	; 4 FOR HERO
         BEQ   L590B
         DEX
         CMP   #$B600	; 6 FOR HEROINE
         BEQ   L590B
         BRA   L58CC

L58E9    BIT   LE4C1
         BMI   L58CC
         PHY
         JSR   LE5BB
         PLY
         CPX   LE5E4
         BCC   L5904
         CPX   LE5E6
         BCS   L5904
         LDX   #$FFFF
         STX   $16
         BRA   L58C9
L5904    DEY
         BPL   L58CC
         BIT   $16
         BPL   L58C9

L590B    LDA   #$0000
         CPX   LE5E6
         BCC   L5914
         DEC
L5914    STA   $E6
         STA   L598E
         JSR   L7F82
         JMP   LE6B8

*
*
*

L591F    JSR   LE6B8
         JSR   LE716
         JSR   LE60A
         LDA   #$FFFF
         LDX   #$EEEE
         JSR   LF329
         LDA   #L4C40	; PRESS FIRE TO BEGIN
         LDY   #$0001
         LDX   #$5200
         JSR   LF1A4
         LDA   #L4C40	; PRESS R TO SEE REPLAY
         LDY   #$0002
         LDX   #$5C00
         JSR   LF1A4
         JSR   LB77A
         LDA   #$0002
         JSR   LE6CA
         JSR   LE67A
         LDA   #$0003
         STAL  $E1C026
         STAL  $E1C010
L5960    LDAL  $E1C060
         ORAL  $E1C061
         BPL   L596D
         BRL   L588A
L596D    LDAL  $E1BFFF
         BPL   L5960
         STAL  $E1C010
         AND   #$FF00
         CMP   #$D200	; R/eplay
         BEQ   L5984
         CMP   #$F200	; r/eplay
         BNE   L5960
L5984    DEC   $A4	; REPLAY MODE ON
         LDA   L598E
         STA   $E6
         JMP   LE6B8

L598E    DW    $0000

*
* CALIBRATE JOYSTICK
*

L5990    JSR   LE6B8
         LDA   #$0001	; J.PIC.LZ
         LDY   #$000E
         JSL   loadFILE
         LDA   #$0000
         LDX   #$0004
         JSR   LE760
         LDA   #$FFFF
         LDX   #$2222
         JSR   LF329
         LDA   #L486D	; JOYSTICK UPPER LEFT
         LDY   #$0001
         LDX   #$7A00
         JSR   LF1A4
         LDX   #$4982
         LDY   #$0000
         JSR   LF484
         JSR   LE7A8
         JSR   LE67A
         LDA   #$0003
         STAL  $E1C026
         STAL  $E1C010
         LDX   #$FFFF
         STX   LE4C1
         JSR   L5A45
         BCS   L5A36
         TXA
         ADC   #$0005
         STA   LE5E4
         TYA
         ADC   #$0005
         STA   LE5E8
         LDA   #$0000
         LDX   #$0004
         JSR   LE74C
         LDA   #L486D	; JOYSTICK LOWER RIGHT
         LDY   #$0002
         LDX   #$7A00
         JSR   LF1A4
         LDX   #$6018
         LDY   #$0001
         JSR   LF484
         JSR   LE7A8
         LDA   #$0003
         STAL  $E1C026
         STAL  $E1C010
         JSR   L5A45
         BCS   L5A36
         TXA
         SBC   #$0004
         STA   LE5E6
         TYA
         SBC   #$0005
         STA   LE5EA
         STZ   LE4C1
         DEC   L5A63
         JMP   LE6B8

L5A36    STZ   LE5E4
         LDX   #$FFFF
         STX   LE5E6
         STX   L5A63
         JMP   LE6B8

L5A45    LDAL  $E1C060
         ORAL  $E1C061
         BMI   L5A5E
         JSR   LE5BB
         LDAL  $E1BFFF
         BPL   L5A45
         STAL  $E1C010
         SEC
         RTS

L5A5E    JSR   LE67A
         CLC
         RTS

L5A63    DW    $0000

*
* PRESS FIRE TO CONTINUE
*

L5A65    LDA   $68	; DEMO MODE
         ORA   $A4	; REPLAY MODE
         BMI   L5AAC	; YES TO BOTH

         LDA   #$0003
         STAL  $E1C026
         STAL  $E1C010
         LDA   #$2000
         LDX   #$0000
         JSR   LE760
         LDA   #$2000
         LDX   #$00E1
         JSR   LE74C
         LDA   #$FFFF
         LDX   #$0000
         JSR   LF329
         LDA   #L4C40	; PRESS FIRE TO CONTINUE
         LDY   #$0000
         LDX   #$7DC0
         JSR   LF1A4
         JSR   LB77A
         JSR   LE685
         LDA   #$2000
         LDX   #$0000
         JSR   LE74C
L5AAC    JMP   LE6B8

L5AAF    ADRL  $00000000

*
*
*

L5AB3    BIT   $A4	; REPLAY MODE
         BPL   L5ABA	; NO
         JMP   LE6B8	; YES

L5ABA    JSR   LE6B2
         JSR   LE716
         LDA   #$0000
         LDX   #$0005
         JSR   LEDE4
         LDA   #$0003
         LDY   #$0000
         JSR   L7D68
         LDA   L5AAF
         STA   L5B63+1
         LDA   L5AAF+2
         SEP   #$20
         STA   L5B63+3
         REP   #$20
         LDA   #$0001
         JSR   LE6CA
         LDX   #$0000
L5AEB    LDA   L4F43,X
         BMI   L5B02
         LDA   #$0098
         STA   L8400,X
         LDA   #$0058
         STA   L8400+$2,X
         INX
         INX
         INX
         INX
         BRA   L5AEB
L5B02    LDX   #$0031
         STX   $10
L5B07    JSR   LD51F
         LDX   #$0000
L5B0D    LDA   L4F43,X
         BMI   L5B59
         AND   #$FFFC
         CMP   L8400,X
         BEQ   L5B2A
         LDA   L8400,X
         BCS   L5B24
         SBC   #$0003
         BRA   L5B27
L5B24    ADC   #$0003
L5B27    STA   L8400,X
L5B2A    LSR
         TAY
         LDA   L4F45,X
         AND   #$FFFC
         CMP   L8400+$2,X
         BEQ   L5B47
         LDA   L8400+$2,X
         BCS   L5B41
         SBC   #$0003
         BRA   L5B44
L5B41    ADC   #$0003
L5B44    STA   L8400+$2,X
L5B47    ASL
         PHX
         TAX
         TYA
         ADC   L9D00,X
         TAX
         JSR   L5B63
         PLA
         ADC   #$0004
         TAX
         BRA   L5B0D
L5B59    JSR   LD640
         DEC   $10
         BPL   L5B07
         JMP   LE6B8

L5B63    JSL   $FFFFFF
         RTS

*
* DISPLAY SCORE/HITSTRENGTH/LIVES
*

L5B68    JSR   LE60A
         LDA   #$FFFF
         LDX   #$0000
         JSR   LF329
         LDA   #L4C40	; SCORE ------ HITSTRENGTH - LIVES -
         LDY   #$0014
         LDX   #$2003
         JSR   LF1A4
         JSR   L5D13
         LDA   #$0001
         JSR   LF32E
         LDA   #$0001
         JMP   LF36B

L5B8F    STZ   $66
         JSR   LE6B8
         JSR   LB77A
         JMP   L5D2F

L5B9A    BIT   $66
         BMI   L5BB6
         LDA   $68	; DEMO MODE
         ORA   $A4	; REPLAY MODE
         BMI   L5BB3	; YES TO BOTH
         JSR   LE735
         LDA   $6A
         ASL
         TAY
         LDA   L3F20,Y
         BMI   L5BB6
         JMP   LE657

L5BB3    JSR   LE735
L5BB6    RTS

*
* INIT ALL
*

L5BB7    STZ   $92	; SCORE
         STZ   $94
         STZ   $A0
         STZ   $A2
         LDX   #$FFFF
         STX   $A8
         LDX   #$0001	; HITSTRENGTH
         STX   $96
         LDX   #$0005	; LIVES
         STX   $98
L5BCE    LDX   #$0050	; STRENGTH
         STX   $8C
         STX   $8E
         RTS

L5BD6    EOR   #$FFFF
         SEC
         ADC   $8E
         BPL   L5BE1
         LDA   #$0000
L5BE1    STA   $8E
         RTS

L5BE4    DW    $0000

L5BE6    LDA   L5BE4
         BEQ   L5C1F
         STZ   L5BE4
         BMI   L5BF4
         BIT   $A8
         BPL   L5C1F
L5BF4    LDY   $8E
         BEQ   L5C1F
         LDY   $60
         CPY   #$0009
         BEQ   L5C1F
         AND   #$7FFF
         JSR   L5BD6
         LDA   #$0009
         LDX   $8E
         BNE   L5C18
         LDY   #$0020
         STY   L6491
         JSR   L61F5
         LDA   #$000A
L5C18    STA   $60
         JSR   L6225
         STZ   $5E
L5C1F    LDA   $8C
         SEC
         SBC   $8E
         BEQ   L5C37
         LSR
         LSR
         LSR
         EOR   #$FFFF
         CLC
         ADC   $8C
         STA   $8C
         LDA   #$00E1
         JSR   LF36B	; DISPLAY STRENGTH THERMOMETER
L5C37    RTS

L5C38    DEC   $98	; LIVES--
         BPL   L5C45
         STZ   $98	; YOU'RE DEAD
         LDA   #$01FF	; RESET STACK
         TCS
         jsr   L78D2	; LOGO - SHOW SCORE
         JMP   L82B8	; 

L5C45    JSR   L5D5C	; DISPLAY LIVES
         DEC   $96	; DECREASE HITSTRENGTH
         BNE   L5C4E
         INC   $96	; INCREASE HITSTRENGTH
L5C4E    JSR   L5D51	; DISPLAY HITSTRENGTH

         JMP   L5BCE

L5C54    INC   $98	; LIVES++
         LDX   $98
         CPX   #$000A	; MAX 10
         BCC   L5C5F
         DEC   $98
L5C5F    JMP   L5D5C	; DISPLAY LIVES

L5C62    INC   $96	; HITSTRENGTH++
         LDX   $96
         CPX   #$0004
         BCC   L5C6D
         DEC   $96
L5C6D    JMP   L5D51

*
* SCORE PLUS
*

L5C70    ASL
         ASL
         TAY
         SED
         LDA   L221C,Y
         CLC
         ADC   $92
         STA   $92
         LDA   L221C+2,Y
         ADC   $94
         STA   $94
         CLD
         JMP   L5D38

L5C87    TAY
         LDX   #$0000
         SEP   #$20
L5C8D    LDA   $A0,X
         BEQ   L5C9B
         INX
         CPX   #$0004
         BCC   L5C8D
         REP   #$20
         SEC
         RTS

L5C9B    TYA
         STA   $A0,X
         REP   #$20
         DEY
         TXA
         LDX   #$00E1
         JSR   LF3DF
         CLC
         RTS

L5CAA    TAX		; HANDLE A KEY PRESS
         LDA   $A0,X
         AND   #$00FF
         TAY
         BEQ   L5CD9
         SEP   #$20
         STZ   $A0,X
         REP   #$20
         PHY
         TXA
         JSR   LF45F
         PLA
         AND   #$00FF
         CMP   #$0001
         BEQ   L5CDA
         BIT   $A8
         BPL   L5CD4
         LDA   #$0005
         JSR   L8091
         STA   L5EBF
L5CD4    LDX   #$00FA
         STX   $A8
L5CD9    RTS

L5CDA    LDX   #$0006
         LDA   $10
         PHA
         LDY   #$FFFF
         STY   $10
L5CE5    LDA   L2444,X
         BEQ   L5CFA
         LDA   L24EC,X
         BMI   L5CFA
         LDA   $AC,X
         BEQ   L5CFA
         CMP   $10
         BCS   L5CFA
         STA   $10
         TXY
L5CFA    DEX
         DEX
         BPL   L5CE5
         TYX
         BMI   L5D0D
         LDA   $10
         SBC   $28
         CMP   #$0087
         BCS   L5D0D
         JSR   L699C
L5D0D    PLA
         STA   $10
         BRL   L5EA4
L5D13    LDX   #$0000
L5D16    LDA   $A0,X
         AND   #$00FF
         BEQ   L5D28
         PHX
         DEC
         TAY
         TXA
         LDX   #$0001
         JSR   LF3DF
         PLX
L5D28    INX
         CPX   #$0004
         BCC   L5D16
         RTS

L5D2F    JSR   L5D38
         JSR   L5D51
         JMP   L5D5C

*
* DISPLAY SCORE
*

L5D38    LDA   $94
         LDX   #$201C
         JSR   L5D67
         LDA   $92
         XBA
         LDX   #$2024
         JSR   L5D67
         LDA   $92
         LDX   #$202C
         JMP   L5D67

*
* DISPLAY HITSTRENGTH
*

L5D51    LDA   $96
         AND   #$000F
         LDX   #$2070
         JMP   LF3BA

*
* DISPLAY LIVES
*

L5D5C    LDA   $98
         AND   #$000F
         LDX   #$2098
         JMP   LF3BA

L5D67    AND   #$00FF
         PHA
         PHX
         LSR
         LSR
         LSR
         LSR
         JSR   LF3BA
         PLA
         CLC
         ADC   #$0004
         TAX
         PLA
         AND   #$000F
         JMP   LF3BA

L5D80    LDX   #$FFFF
         STX   $86
         STX   $88
         LDA   #$0032
         LDX   #$0001
         LDY   #$0000
         JMP   L5DB4

L5D93    BIT   $68
         BPL   L5D9C
         LDY   #$0001
         BRA   L5DA3
L5D9C    BIT   $A4	; REPLAY MODE
         BPL   L5DB3	; NO
         LDY   #$0000
L5DA3    LDX   #$0000
         JSR   L5DE2
         STA   L5E33+1
         SEP   #$10
         STX   L5E33+3
         REP   #$10
L5DB3    RTS

L5DB4    BIT   $86
         BPL   L5DCB
         STA   $86
         JSR   L5DE2
         STY   L165E
         STA   L5E12+1
         SEP   #$10
         STX   L5E12+3
         REP   #$10
         RTS

L5DCB    BIT   $88
         BPL   L5DE1
         STA   $88
         JSR   L5DE2
         STY   L1660
         STA   L5E1F+1
         SEP   #$10
         STX   L5E1F+3
         REP   #$10
L5DE1    RTS

L5DE2    TXA
         BNE   L5DF7
         TYA
         ASL
         TAX
         ASL
         TAY
         LDA   L15FE,Y
         PHA
         LDA   L15FE+2,Y
         LDY   L163E,X
         TAX
         PLA
         RTS

L5DF7    TYA
         ASL
         TAX
         ASL
         TAY
         LDA   L161E,Y
         PHA
         LDA   L161E+2,Y
         LDY   L164E,X
         TAX
         PLA
         RTS

L5E09    BIT   $86
         BMI   L5E16
         DEC   $86
         LDX   L165E
L5E12    JSL   $FFFFFF
L5E16    BIT   $88
         BMI   L5E23
         DEC   $88
         LDX   L1660
L5E1F    JSL   $FFFFFF
L5E23    BIT   $68
         BPL   L5E2C
         LDX   L163E+2
         BRA   L5E33
L5E2C    BIT   $A4
         BPL   L5E37
         LDX   L163E
L5E33    JSL   $FFFFFF
L5E37    RTS

*
* INSERT DISK (CALLED BY START)
*

L5E38    PHB              ; INSERT DISK X
         PHP
         PHK
         PLB
         SEP   #$20
         ORA   #$80
         STA   L4E65+$14
         REP   #$20
         PHY
         PHX
         LDX   $00
         PHX
         BIT   $D8
         BMI   L5E80
         LDX   #$FFFF
         STX   $D8
         LDA   #$2000
         LDX   #$0001
         JSR   LE774
         JSR   LE6B8
         JSR   LE716
         JSR   LE5FB
         LDA   #$FFFF
         LDX   #$EEEE
         JSR   LF329
         LDA   #L4C40	; PLEASE INSERT DISK
         LDY   #$0003
         LDX   #$5FC0
         JSR   LF1B7
         LDA   #$0000
         JSR   LE6CA
L5E80    PLX
         STX   $00
         PLX
         PLY
         PLP
         PLB
         RTL

*
* INSERT DISK 2 (CALLED BY START)
*

L5E88    PHB              ; ENTRY POINT
         PHP
         PHK
         PLB
         LDA   $00
         PHA
         PHY
         PHX
         STZ   $D8
         JSR   LE6B8	; CLEAR PALETTE
         JSR   LB77A	; BLIT 01 > 01
         JSR   LE6F4	; COPY SCB/PAL 01 > E1
         PLX
         PLY
         PLA
         STA   $00
         PLP
         PLB
         RTL

*
*
*

L5EA4    JSR   LB710
         LDA   #$0FFF	; A WHITE PALETTE
         LDX   #$7E00
L5EAD    STAL  $E12000,X
         INX
         INX
         BPL   L5EAD
         JSR   LB710	; BLIT 01 > 01
         JMP   LE6F4	; COPY SCB/PAL 01 > E1

L5EBB    ADRL  $00000000
L5EBF    DW    $0000

L5EC1    LDY   $A8
         BMI   L5EE7
         DEC   $A8
         BPL   L5ECF
         LDA   L5EBF
         JSR   L7FA1
L5ECF    LDA   L3F36
         ASL
         TAX
         LDA   L9D14,X
         ADC   $5A
         ADC   #$0013
         SEC
         SBC   $28
         TAX
         TYA
         AND   #$0001
         BRL   L5FA0
L5EE7    RTS

L5EE8    LDX   #$FFFF
         STX   $AA
         RTS

L5EEE    DW    $0000
L5EF0    DW    $0000

L5EF2    STA   $AA
         TYA
         AND   #$0002
         LSR
         EOR   #$0001
         STA   L5EEE
         TYA
         AND   #$0001
         STA   L5EF0
         RTS

L5F07    LDA   $AA
         BMI   L5F2F
         SEC
         SBC   $28
         CLC
         ADC   #$0014
         CMP   #$009C
         BCS   L5F24
         ADC   #$8A40
         TAX
         LDA   L5EEE
         ADC   #$0002
         JSR   L5FA0
L5F24    LDA   $AA
         SBC   $5A
         BMI   L5F30
         CMP   #$0010
         BCC   L5F30
L5F2F    RTS

*
*
*

L5F30    BIT   $AA
         BMI   L5F78
         LDY   L5EF0
         LDA   L5EEE
         BEQ   L5F45
         INY
         TYA
         JSR   L5C87
         BCS   L5F78
         BRA   L5F50
L5F45    TYA
         BEQ   L5F4D
         JSR   L5C54	; LIVES++
         BRA   L5F50
L5F4D    JSR   L5C62	; HITSTRENGTH++
L5F50    LDA   L5EEE
         EOR   #$0001
         ASL
         ADC   #$0002
         ADC   L5EF0
         TAY
         LDA   #$0028
         LDX   #$0000
         JSR   L5DB4
         LDA   #$0006
         JSR   L5C70
         LDX   #$FFFF
         STX   $AA
         LDA   #$0003
         JMP   L8091
L5F78    RTS

L5F79    DW    $0000
L5F7B    DW    $0000

L5F7D    LDY   $D4
         BMI   L5F9F
         DEC   $D4
         LDA   L5F79
         SEC
         SBC   $28
         ADC   #$0014
         CMP   #$009C
         BCS   L5F9F
         LDX   L5F7B
         ADC   L9D00,X
         TAX
         TYA
         ADC   #$0004
         BRL   L5FA0
L5F9F    RTS

L5FA0    ASL
         ASL
         ADC   L5EBB
         STA   L5FB5+1
         LDA   L5EBB+2
         ADC   #$0000
         SEP   #$20
         STA   L5FB5+3
         REP   #$20
L5FB5    JSL   $FFFFFF
         RTS
L5FBA    RTS

L5FBB    STZ   $9C
         LDA   $6A
         ASL
         TAY
         LDA   L1160,Y
         BEQ   L5FBA
         STA   $00
         DEC   $9C
         STZ   $9A
         LDX   #$000E
L5FCF    STZ   $2A,X
         STZ   L1010,X
         DEX
         DEX
         BPL   L5FCF
         LDX   #$0000
         LDY   #$0000
L5FDE    LDA   ($00),Y
         CMP   #$FFFF
         BEQ   L603B
         STA   L1040,X
         INY
         INY
         LDA   ($00),Y
         INY
         INY
         STA   L1060,X
         LDA   ($00),Y
         INY
         INY
         STA   L1070,X
         LDA   ($00),Y
         INY
         INY
         STA   L1080,X
         LDA   ($00),Y
         INY
         INY
         STA   L1090,X
         LDA   ($00),Y
         INY
         INY
         STA   L10A0,X
         LDA   ($00),Y
         INY
         INY
         STA   L10B0,X
         LDA   ($00),Y
         INY
         INY
         SEC
         SBC   #$0018
         EOR   #$FFFF
         SEC
         ADC   #$009C
         STA   L10C0,X
         TYA
         CLC
         ADC   $00
         STA   L1050,X
L602D    LDA   ($00),Y
         INY
         INY
         CMP   #$FFFF
         BNE   L602D
         INX
         INX
         BRL   L5FDE
L603B    LDX   #$0000
         INY
         INY
         LDA   ($00),Y
         INY
         INY
         STA   L1008
         LDA   ($00),Y
         INY
         INY
         PHA
         LDA   ($00),Y
         INY
         INY
         DEC
         ASL
         STA   $9E
         LDA   ($00),Y
         INY
         INY
         STA   L100E
         STZ   L100C
L605E    LDA   ($00),Y
         CMP   #$FFFF
         BEQ   L607C
         STA   L1010,X
         INY
         INY
         LDA   ($00),Y
         INY
         INY
         STA   L1030,X
         LDA   ($00),Y
         INY
         INY
         STA   L1020,X
         INX
         INX
         BRA   L605E
L607C    DEX
         DEX
         STX   L100A
         PLA
         BEQ   L6089
         DEC
         ASL
         TAY
         BRA   L608A
L6089    RTS

L608A    LDX   L1030,Y
         LDA   L1020,Y
L6090    PHA
         PHX
         LDX   $9E
L6094    LDA   $2A,X
         BEQ   L60A0
         DEX
         DEX
         BPL   L6094
         PLA
         PLA
         BRA   L60E5
L60A0    PLA
         STA   $2A,X
         PLA
         DEC
         ASL
         TAY
         LDA   L1040,Y
         STA   $3A,X
         LDA   L1050,Y
         STA   L10D0,X
         STA   $4A,X
         LDA   L1060,Y
         INC
         STA   L10E0,X
         LDA   #$FFFF
         STA   L10F0,X
         LDA   L1070,Y
         STA   L1100,X
         LDA   L1080,Y
         STA   L1110,X
         LDA   L1090,Y
         STA   L1120,X
         LDA   L10A0,Y
         STA   L1130,X
         LDA   L10B0,Y
         STA   L1140,X
         LDA   L10C0,Y
         STA   L1150,X
L60E5    RTS

L60E6    BIT   $9C
         BPL   L60E5
         DEC   $9A
         BPL   L6120
         LDX   L1008
         STX   $9A
         LDX   $7C
         INC   $7C
         CPX   #$01FF
         BCC   L60FE
         STZ   $7C
L60FE    LDA   LB1AE,X
         LDY   L100A
L6104    CMP   L1010,Y
         BCC   L6112
         DEY
         DEY
         BPL   L6104
L610D    STZ   L100C
         BRA   L6120
L6112    LDA   L100C
         CMP   L100E
         BCS   L610D
         INC   L100C
         JSR   L608A
L6120    LDX   $9E
L6122    LDA   $2A,X
         BNE   L612B
L6126    DEX
         DEX
         BPL   L6122
         RTS

L612B    LDA   ($4A,X)
         CMP   #$FFFF
         BNE   L6139
         LDA   L10D0,X
         STA   $4A,X
         BRA   L612B
L6139    STA   $10
         CMP   #$00FE
         BEQ   L6159
         INC   $4A,X
         INC   $4A,X
         LDA   ($4A,X)
         INC   $4A,X
         INC   $4A,X
         CLC
         ADC   $2A,X
         TAY
         STY   $2A,X
         SBC   $28
         BPL   L615E
         CMP   #$FFB0
         BCS   L615E
L6159    JSR   L61E7
         BRA   L6126
L615E    LDA   ($4A,X)
         INC   $4A,X
         INC   $4A,X
         CLC
         ADC   $3A,X
         STA   $3A,X
         ASL
         STA   $26
         TYA
         SBC   $5A
         CMP   L1110,X
         BCS   L619C
         CMP   L1100,X
         BCC   L619C
         LDA   $8E
         BEQ   L619C
         LDA   $60
         CMP   #$0009
         BEQ   L619C
         LDA   L3F36
         CMP   L1120,X
         BCC   L619C
         CMP   L1130,X
         BCS   L619C
         LDA   L1140,X
         STA   L5BE4
         PHY
         JSR   L61E7
         PLY
L619C    TYA
         SEC
         SBC   $28
         CMP   #$FFFC
         BCS   L61AA
         CMP   L1150,X
         BCS   L61E4
L61AA    LDY   $26
         ADC   L9D00,Y
         PHX
         TAX
         LDA   $10
         BEQ   L61CF
         DEC
         ASL
         ASL
         ADC   L1004
         STA   L61CB+1
         LDA   L1004+2
         ADC   #$0000
         SEP   #$20
         STA   L61CB+3
         REP   #$20
L61CB    JSL   $FFFFFF
L61CF    PLX
         LDA   L10E0,X
         BEQ   L61E4
         LDY   L10F0,X
         BPL   L61E4
         AND   #$00FF
         DEC
         JSR   L809A
         STA   L10F0,X
L61E4    BRL   L6126
L61E7    STZ   $2A,X
         LDA   L10E0,X
         BPL   L61F4
         LDA   L10F0,X
         JMP   L7FA1
L61F4    RTS

L61F5    BIT   $9C
         BPL   L6206
         LDX   $9E
L61FB    LDA   $2A,X
         BEQ   L6202
         JSR   L61E7
L6202    DEX
         DEX
         BPL   L61FB
L6206    RTS

L6207    LDA   $6A
         ASL
         TAY
         LDA   L3F0A,Y
         STA   $5A
         STZ   $A6
         LDX   #$004E
         BIT   $E6
         BPL   L621C
         LDX   #$0051
L621C    STX   $5C
L621E    STZ   $5E
         STZ   $60
         STZ   L5BE4
L6225    LDA   $60
         ASL
         TAY
         LDA   L3F3C,Y
         BIT   $E6
         BPL   L6233
         LDA   L3F52,Y
L6233    STA   $62
         RTS

L6236    LDY   $5E
         LDA   ($62),Y
         BEQ   L624E
         CMP   #$FF00
         BCC   L6255
         CMP   #$FFFF
         BEQ   L6252
         AND   #$00FF
L6249    STA   $60
         JSR   L6225
L624E    STZ   $5E
         BRA   L6236
L6252    BRL   L6493
L6255    STA   $10
         TAX
         LDY   $5E
         INY
         INY
         LDA   ($62),Y
         STA   $16
         INY
         INY
         LDA   ($62),Y
         STA   $24
         INY
         INY
         LDA   ($62),Y
         STA   $26
         INY
         INY
         STY   $5E
         TXA
         BPL   L62BC
         BIT   $66
         BPL   L62BC
         JSR   LE4C3
         CMP   #$0080
         BCC   L6282
         BRL   L6386
L6282    ASL
         TAY
         LDA   L4196,Y
         BEQ   L62B5
         CMP   $60
         BEQ   L62BC
         STA   $60
         JSR   L6225
         LDY   #$0000
         LDA   ($62),Y
         STA   $10
         LDY   #$0002
         LDA   ($62),Y
         STA   $16
         LDY   #$0004
         LDA   ($62),Y
         STA   $24
         LDY   #$0006
         LDA   ($62),Y
         STA   $26
         LDY   #$0008
         STY   $5E
         BRA   L62BC
L62B5    LDY   $60
         CPY   #$0003
         BCS   L6249
L62BC    LDY   $24
         BEQ   L6331
         TYA
         CLC
         ADC   $5A
         BMI   L62FD
         TAX
         SEC
         SBC   $28
         BMI   L62D1
         CMP   #$0003
         BCS   L62D6
L62D1    LDA   #$0002
         BRA   L62DE
L62D6    CMP   #$007E
         BCC   L62E2
         LDA   #$007D
L62DE    CLC
         ADC   $28
         TAX
L62E2    STX   $14
         LDX   #$0006
L62E7    LDA   L2444,X
         BEQ   L62F5
         LDA   $AC,X
         SBC   #$000F
         CMP   $14
         BCC   L6331
L62F5    DEX
         DEX
         BPL   L62E7
         LDX   $14
         STX   $5A
L62FD    TYA
         BPL   L631B
         TXA
         SBC   $64
         CMP   #$0014
         BCS   L6331
         LDX   #$0000
         DEC   $64
         DEC   $64
         BMI   L6317
         LDX   $F0
         CPX   $64
         BCC   L6334
L6317    STX   $64
         BRA   L6334
L631B    TXA
         SBC   $64
         CMP   #$0019
         BCC   L6331
         INC   $64
         INC   $64
         LDX   $F4
         CPX   $64
         BCS   L6334
         STX   $64
         BRA   L6334
L6331    JSR   L63F6
L6334    LDA   $16
         BEQ   L633B
         JSR   L8091
L633B    LDA   $5C
         CLC
         ADC   $26
         STA   L3F36
         ASL
         TAX
         LDA   L9D00,X
         ADC   $5A
         ADC   #$0014
         SEC
         SBC   $28
         TAX
         STX   $12
         LDA   $10
         AND   #$7F00
         BEQ   L635E
         XBA
         JSR   L6398
L635E    LDA   $10
         LDX   $12
         AND   #$00FF
         CMP   #$0009
         BEQ   L636F
         CMP   #$000D
         BNE   L6398
L636F    ASL
         TAY
         TXA
         BIT   $E6
         BPL   L637B
         ADC   L4200,Y
         BRA   L637E
L637B    ADC   L41D6,Y
L637E    STA   L63F4
         STY   $A6
         BRL   L642B

L6386    CMP   #$008D	; WAS RETURN KEY PRESSED?
         BEQ   L6394	; IF SO, NEXT LEVEL...
         SBC   #$00B1	; OTHERWISE, HANDLE IT
         JSR   L5CAA
         BRL   L62BC
L6394    PLA
         JMP   L829B	; NEXT LEVEL

L6398    ASL
         TAY
         TXA
         BIT   $E6
         BPL   L63A4
         ADC   L4200,Y
         BRA   L63A7
L63A4    ADC   L41D6,Y
L63A7    TAX
         TYA
         DEC
         DEC
         ASL
         ADC   L3F38
         STA   L63BF+1
         LDA   #$0000
         ADC   L3F3A
         SEP   #$20
         STA   L63BF+3
         REP   #$20
L63BF    JSL   $FFFFFF
         RTS
L63C4    RTS

L63C5    LDY   $A6
         BEQ   L63C4
         STZ   $A6
         LDA   $5A
         SEC
         SBC   $28
         CMP   #$0068
         BCS   L63F3
         LDX   L63F4
         TYA
         DEC
         DEC
         ASL
         ADC   L3F38
         STA   L63EF+1
         LDA   #$0000
         ADC   L3F3A
         SEP   #$20
         STA   L63EF+3
         REP   #$20
L63EF    JSL   $FFFFFF
L63F3    RTS

L63F4    DW    $0000
L63F6    LDX   $28
         BEQ   L6426
         CPX   $F4
         BEQ   L6426
         LDA   $5A
         SEC
         SBC   $64
         CMP   #$0014
         BCC   L6417
         CMP   #$0019
         BCC   L6426
         INC   $64
         LDY   $64
         CPY   $F4
         BCC   L6426
         BEQ   L6426
L6417    LDY   #$0000
         DEC   $64
         BMI   L6424
         LDY   $F0
         CPY   $64
         BCC   L6426
L6424    STY   $64
L6426    RTS

L6427    BRK   $00
L6429    BRK   $00
L642B    LDA   #$0028
         LDX   #$0011
         CPY   #$0012
         BEQ   L643C
         LDA   #$0032
         LDX   #$0028
L643C    CLC
         ADC   $5A
         STA   $24
         STA   L6429
         TXA
         ADC   L3F36
         STA   $26
         STA   L6427
         LDX   #$0006
L6450    LDA   $AC,X
         BEQ   L6484
         EOR   #$FFFF
         ADC   $24
         BMI   L646C
         CMP   L2474,X
         BCS   L6484
         LDY   L246C,X
         BMI   L6476
         CMP   L246C,X
         BCC   L6484
         BRA   L6476
L646C    LDY   L246C,X
         BPL   L6484
         CMP   L246C,X
         BCC   L6484
L6476    LDA   $26
         SBC   $B4,X
         CMP   L247C,X
         BCC   L6484
         CMP   L2484,X
         BCC   L6489
L6484    DEX
         DEX
         BPL   L6450
         RTS

L6489    LDA   L2444,X
         BEQ   L6484
         JMP   L6937

L6491    DW    $0000

L6493    DEC   L6491
         LDY   L6491
         CPY   #$0006
         BCC   L64BA
         LDA   $5E
         SEC
         SBC   #$0008
         STA   $5E
         LDY   #$0000
         DEC   $64
         DEC   $64
         BMI   L64B5
         LDY   $F0
         CPY   $64
         BCC   L64B7
L64B5    STY   $64
L64B7    BRL   L6236

L64BA    TYA
         BEQ   L64E2
         CPY   #$0005
         BNE   L64E1
         LDA   $64
         SEC
         SBC   #$0010
         BMI   L64CE
         CMP   $F0
         BCS   L64D0
L64CE    LDA   $F0
L64D0    STA   $64
         CLC
         ADC   #$0014
         STA   $5A
         JSR   L5C38	; LIVES--
         LDA   #$00E1
         JMP   LF32E
L64E1    RTS

L64E2    BRL   L621E

L64E5    LDA   $5A
         CMP   $F6
         BCC   L64FC
         LDA   L2444
         ORA   L2446
         ORA   L2448
         ORA   L244A
         BNE   L64FC
         JMP   L829B	; NEXT LEVEL
L64FC    RTS

L64FD    ADRL  $00000000
L6501    ADRL  $00000000
L6505    RTS

L6506    LDX   #$0006
L6509    STZ   $AC,X
         STZ   L2444,X
         STZ   L245C,X
         DEX
         DEX
         BPL   L6509
         STX   $D4
         LDA   $6A
         ASL
         TAX
         LDY   L2648,X
         BEQ   L6505
         STY   L2500
         STZ   L6933
L6526    LDA   |L0000,Y
         INY
         INY
         CMP   #$FFFF
         BNE   L6526
         STA   L2502
         STA   L2504
         STY   L24FC
         STY   L24FE
         BRA   L653E
L653E    PHY
         PHX
         LDY   L24FC
         BEQ   L6568
         STZ   L24FC
L6548    LDA   |L0000,Y
         CMP   #$FFFF
         BEQ   L6568
         TAX
         BMI   L656B
         PHA
         JSR   L66D1
         TXA
         BMI   L6564
         JSR   L65A1
         PLA
         CMP   #$0100
         BCC   L6548
         PHA
L6564    PLA
         STY   L24FC
L6568    PLX
         PLY
         RTS

L656B    TYA
         CLC
         ADC   #$000C
         TAY
         BRA   L6548

L6573    PHY
         PHX
         PHA
         LDY   L24FE
         BEQ   L6595
         STZ   L24FE
L657E    LDA   |L0000,Y
         CMP   #$FFFF
         BEQ   L6595
         TAX
         BPL   L6599
         JSR   L66D1
         TXA
         BMI   L6592
         JSR   L65A1
L6592    STY   L24FE
L6595    PLA
         PLX
         PLY
         RTS

L6599    TYA
         CLC
         ADC   #$000C
         TAY
         BRA   L657E
L65A1    STZ   L245C,X
         LDA   |L0000,Y
         INY
         INY
         AND   #$00FF
         STA   $C4,X
         ASL
         STA   $12
         LDA   |L0000,Y
         INY
         INY
         STA   $AC,X
         LDA   |L0000,Y
         INY
         INY
         STA   L2444,X
         LDA   |L0000,Y
         INY
         INY
         STA   L244C,X
         PHY
         JSR   L66B4
         PLY
         LDA   |L0000,Y
         INY
         INY
         STA   L2454,X
         LDA   |L0000,Y
         INY
         INY
         STA   L2464,X
         PHY
         LDA   $C4,X
         ASL
         ADC   L2500
         TAY
         LDA   |L0000,Y
         TAY
         LDA   |L0000+$8,Y
         STA   $B4,X
         STA   L24C4,X
         LDA   |L0000+$A,Y
         STA   L24CC,X
         LDA   |L0000+$C,Y
         STA   L24D4,X
         LDA   |L0000+$E,Y
         STA   L24DC,X
         LDA   |L0000+$10,Y
         STA   L246C,X
         LDA   |L0000+$12,Y
         STA   L2474,X
         LDA   |L0000+$14,Y
         STA   L247C,X
         LDA   |L0000+$16,Y
         STA   L2484,X
         LDA   |L0000+$18,Y
         STA   L248C,X
         LDA   |L0000+$1A,Y
         STA   L2494,X
         LDA   |L0000+$1C,Y
         STA   L249C,X
         LDA   |L0000+$1E,Y
         STA   L24A4,X
         LDA   |L0000+$20,Y
         STA   L24AC,X
         LDA   |L0000+$22,Y
         STA   L2506,X
         LDA   |L0000+$24,Y
         STA   L24B4,X
         LDA   |L0000+$26,Y
         STA   L24BC,X
         LDA   |L0000+$28,Y
         STA   L24EC,X
         LDA   |L0000+$2A,Y
         STA   L24F4,X
         LDA   $C4,X
         PHX
         LDX   $12
         CMP   L2502,X
         BEQ   L66AB
         STA   L2502,X
         LDA   |L0000,Y
         STA   $CC,X
         LDA   |L0000+$2,Y
         STA   $D0,X
         LDA   |L0000+$4,Y
         STA   $00
         LDA   |L0000+$6,Y
         STA   $04
         LDY   #$0000
         TXA
         BEQ   L6681
         LDX   #$0040
L6681    CLC
L6682    LDA   ($00),Y
         ADC   ($04),Y
         SEC
         SBC   #$0018
         EOR   #$FFFF
         SEC
         ADC   #$0092
         STA   L251E,X
         LDA   ($04),Y
         EOR   #$FFFF
         INC
         BPL   L669F
         LDA   #$0000
L669F    STA   L259E,X
         INX
         INX
         INY
         INY
         CPY   #$0040
         BCC   L6682
L66AB    PLX
         LDA   #$0010
         JSR   L66FA
         PLY
         RTS

L66B4    LDA   L2444,X
         ASL
         TAY
         LDA   L261E,Y
         STA   L2516,X
         TYA
         LSR
         EOR   #$FFFF
         CLC
         ADC   #$00BD
         ASL
         TAY
         LDA   L9D00,Y
         STA   L250E,X
         RTS

L66D1    PHY
         LDX   #$0006
L66D5    LDA   $AC,X
         BEQ   L66ED
         DEX
         DEX
         BPL   L66D5
         STX   $24
         TXY
         LDX   #$0006
L66E3    LDA   L2444,X
         BEQ   L66EF
L66E8    DEX
         DEX
         BPL   L66E3
         TYX
L66ED    PLY
         RTS

L66EF    LDA   $AC,X
         CMP   $24
         BCS   L66E8
         STA   $24
         TXY
         BRA   L66E8
L66FA    STA   L24E4,X
         ASL
         TAY
         LDA   $C4,X
         BEQ   L6708
         LDA   ($CE),Y
         STA   $BC,X
         RTS

L6708    LDA   ($CC),Y
         STA   $BC,X
         RTS

L670D    LDX   #$0000
L6710    LDA   $AC,X
         BNE   L6727
L6714    INX
         INX
         CPX   #$0008
         BCC   L6710
         LDA   L6933
         BEQ   L6726
         STZ   L6933
         JMP   L6573
L6726    RTS

L6727    LDA   $8E
         BNE   L6734
         LDA   L2444,X
         BEQ   L6734
         INC   $AC,X
         BRA   L6742
L6734    LDA   L245C,X
         BMI   L6761
         LDA   $AC,X
         SBC   $5A
         CMP   L2464,X
         BCC   L674B
L6742    LDA   ($BC,X)
         BEQ   L6765
         ORA   #$8000
         BRA   L677D
L674B    DEC   L245C,X
         LDA   L24F4,X
         BMI   L6756
         JSR   L7FC8
L6756    LDA   L24B4,X
         BMI   L6761
         JSR   L809A
         STA   L24B4,X
L6761    LDA   ($BC,X)
         BNE   L677D
L6765    TXY
         LDX   $7C
         INC   $7C
         CPX   #$01FF
         BCC   L6771
         STZ   $7C
L6771    LDA   LB1AE,X
         TYX
         AND   #$000F
         JSR   L66FA
         BRA   L6727
L677D    STA   $10
         BPL   L6790
         LDY   $BC,X
         INC   $BC,X
         INC   $BC,X
         LDA   ($BC,X)
         STA   $12
         STY   $BC,X
         BRL   L683C
L6790    INC   $BC,X
         INC   $BC,X
         LDA   ($BC,X)
         INC   $BC,X
         INC   $BC,X
         STA   $12
         AND   #$4000
         BEQ   L67AA
         LDA   $12
         AND   #$0F00
         XBA
         JSR   L809A
L67AA    LDA   ($BC,X)
         INC   $BC,X
         INC   $BC,X
         TAY
         LDA   ($BC,X)
         BPL   L67E2
         CMP   #$8200
         BCS   L67E2
         BEQ   L67C8
         CMP   #$8100
         BNE   L67CD
         LDA   L24C4,X
         STA   $B4,X
         BRA   L67DF
L67C8    INC   L6933
         BRA   L67DF
L67CD    AND   #$00FF
         PHX
         PHY
         TAY
         LDA   $AC,X
         ADC   L24BC,X
         TAX
         TYA
         JSR   L6090
         PLY
         PLX
L67DF    LDA   #$0000
L67E2    CLC
         ADC   $B4,X
         CMP   L24CC,X
         BCC   L67F1
         CMP   L24D4,X
         BCS   L67F1
         STA   $B4,X
L67F1    INC   $BC,X
         INC   $BC,X
         TYA
         CLC
         ADC   $AC,X
         CMP   $F8
         BCC   L6802
         LDA   $F8
         DEC
         BRA   L6813
L6802    TAY
         SBC   $F0
         CMP   #$000A
         TYA
         BCC   L6815
         SBC   $5A
         CMP   #$0010
         TYA
         BCC   L6815
L6813    STA   $AC,X
L6815    BIT   $12
         BPL   L683C
         LDA   $AC,X
         SBC   $5A
         CMP   L2494,X
         BCS   L683C
         CMP   L248C,X
         BCC   L683C
         LDA   $B4,X
         SBC   L3F36
         CMP   L249C,X
         BCS   L6836
         CMP   L24A4,X
         BCS   L683C
L6836    LDA   L24AC,X
         STA   L5BE4
L683C    LDA   $B4,X
         ASL
         TAY
         LDA   $AC,X
         ADC   #$0015
         SBC   $28
         STA   $24
         CLC
         ADC   L9D00,Y
         STA   $14
         PHX
         LDA   $C4,X
         BEQ   L688F
         LDA   $10
         AND   #$7F00
         BEQ   L685F
         XBA
         JSR   L6905
L685F    LDA   $10
         AND   #$00FF
         CMP   #$00FF
         BEQ   L68D3
         CMP   #$00FE
         BEQ   L68CA
         JSR   L6905
         LDA   $12
         BEQ   L68D3
         AND   #$00FF
         BEQ   L687D
         JSR   L6905
L687D    LDA   $12
         BIT   #$4000
         BNE   L68D3
         AND   #$0F00
         BEQ   L68D3
         XBA
         JSR   L6905
         BRA   L68D3
L688F    LDA   $10
         AND   #$7F00
         BEQ   L689A
         XBA
         JSR   L68D7
L689A    LDA   $10
         AND   #$00FF
         CMP   #$00FF
         BEQ   L68D3
         CMP   #$00FE
         BEQ   L68CA
         JSR   L68D7
         LDA   $12
         BEQ   L68D3
         AND   #$00FF
         BEQ   L68B8
         JSR   L68D7
L68B8    LDA   $12
         BIT   #$4000
         BNE   L68D3
         AND   #$0F00
         BEQ   L68D3
         XBA
         JSR   L68D7
         BRA   L68D3
L68CA    PLX
         STZ   $AC,X
         JSR   L653E
         BRL   L6714
L68D3    PLX
         BRL   L6714
L68D7    DEC
         ASL
         TAY
         LDA   $24
         CMP   L259E,Y
         BCC   L6904
         CMP   L251E,Y
         BCS   L6904
         LDA   $14
         ADC   ($D0),Y
         TAX
         TYA
         ASL
         ADC   L64FD
         STA   L6900+1
         LDA   #$0000
         ADC   L64FD+2
         SEP   #$20
         STA   L6900+3
         REP   #$20
L6900    JSL   $FFFFFF
L6904    RTS

L6905    DEC
         ASL
         TAY
         LDA   $24
         CMP   L259E+$40,Y
         BCC   L6904
         CMP   L251E+$40,Y
         BCS   L6904
         LDA   $14
         ADC   ($D2),Y
         TAX
         TYA
         ASL
         ADC   L6501
         STA   L692E+1
         LDA   #$0000
         ADC   L6501+2
         SEP   #$20
         STA   L692E+3
         REP   #$20
L692E    JSL   $FFFFFF
         RTS

L6933    DB    $00
         DB    $00
L6935    DB    $00
         DB    $00
L6937    LDY   #$0002
         STY   $D4
         LDA   L6429
         DEC
         DEC
         STA   L5F79
         LDA   L6427
         SEC
         SBC   #$0006
         ASL
         STA   L5F7B
         LDA   L2444,X
         SEC
         SBC   $96
         BPL   L695A
         LDA   #$0000
L695A    STA   L2444,X
         BEQ   L699C
         LDA   #$0012
         LDY   L244C,X
         BPL   L6968
         INC
L6968    JSR   L66FA
         LDA   #$0002
         JSR   L5C70
         LDA   $6A
         BNE   L699B
         BIT   L6935
         BMI   L699B
         DEC   L6935
         LDX   L7FC6
         CPX   #$0001
         BEQ   L698B
         LDA   #$0001
         JSR   L7FC8
L698B    LDA   #$0028
         LDX   #$0001
         TXY
         JSR   L5DB4
         LDA   #$0006
         JMP   L809A
L699B    RTS

L699C    STZ   L2444,X
         LDA   L244C,X
         BEQ   L69BE
         BMI   L69BE
         STA   L2444,X
         LDA   #$FFFF
         STA   L244C,X
         JSR   L66B4
         LDA   #$0013
         JSR   L66FA
         LDA   #$0002
         JMP   L5C70

L69BE    LDY   L2454,X
         BMI   L69CA
         LDA   $AC,X
         PHX
         JSR   L5EF2
         PLX
L69CA    LDA   #$0011
         JSR   L66FA
         LDA   L24DC,X
         STA   L24D4,X
         LDA   L24B4,X
         BMI   L69DE
         JSR   L7FA1
L69DE    LDA   #$0003
         JMP   L5C70

L69E4    STZ   $6C
         LDA   $6A
         ASL
         TAY
         LDA   |L002A,Y
         BEQ   L6A25
         STA   $00
         DEC   $6C
         LDX   #$04FE
L69F6    STZ   L8400,X
         DEX
         DEX
         BPL   L69F6
         LDY   #$0000
         TYX
L6A01    LDA   ($00),Y
         INY
         INY
         CMP   #$FFFF
         BEQ   L6A11
         STA   |L001A,X
         INX
         INX
         BRA   L6A01
L6A11    LDA   ($00),Y
         INY
         INY
         TAX
         BMI   L6A25
         AND   #$FFFE
         TAX
         LDA   ($00),Y
         INY
         INY
         STA   L8400,X
         BRA   L6A11
L6A25    RTS

L6A26    BIT   $6C
         BPL   L6A79
         LDA   $28
         ASL
         TAX
         STX   $24
         LDY   #$004F
L6A33    CPX   #$0500
         BCC   L6A46
         TXA
         SBC   #$0460
         TAX
         LDA   $24
         SBC   #$0460
         STA   $24
         BRA   L6A33
L6A46    LDA   L8400,X
         BEQ   L6A74
         PHX
         PHY
         DEC
         ASL
         TAY
         TXA
         SEC
         SBC   $24
         CLC
         ADC   |L001A,Y
         TAX
         TYA
         ASL
         ADC   |L0016
         STA   L6A6E+1
         LDA   |L0016+2
         ADC   #$0000
         SEP   #$20
         STA   L6A6E+3
         REP   #$20
L6A6E    JSL   $FFFFFF
         PLY
         PLX
L6A74    INX
         INX
         DEY
         BPL   L6A33
L6A79    RTS
L6A7A    RTS

L6A7B    STZ   $82
         LDA   $6A
         ASL
         TAY
         LDA   L0540,Y
         BEQ   L6A7A
         STA   $00
         DEC   $82
         LDX   #$09FE
L6A8D    STZ   L9300,X
         DEX
         DEX
         BPL   L6A8D
         LDX   #$001E
         LDA   #$FFFF
L6A9A    STA   L039E,X
         STZ   L03FE,X
         DEX
         DEX
         BPL   L6A9A
         LDY   #$0000
         LDA   ($00),Y
         INY
         INY
         STA   $84
         LDX   #$0002
L6AB0    LDA   ($00),Y
         INY
         INY
         CMP   #$FFFF
         BEQ   L6AD5
         STA   L0440,X
         LDA   ($00),Y
         INY
         INY
         STA   L0480,X
         LDA   ($00),Y
         INY
         INY
         STA   L04C0,X
         LDA   ($00),Y
         INY
         INY
         STA   L0500,X
         INX
         INX
         BRA   L6AB0
L6AD5    LDX   #$0000
L6AD8    LDA   ($00),Y
         INY
         INY
         STA   L03FE,X
         LDA   ($00),Y
         INY
         INY
         STA   L041E,X
         TYA
         CLC
         ADC   $00
         STA   L03BE,X
         STA   L039E,X
L6AF0    LDA   ($00),Y
         CMP   #$FFFF
         BEQ   L6AFD
         INY
         INY
         INY
         INY
         BRA   L6AF0
L6AFD    TYA
         CLC
         ADC   $00
         STA   L03DE,X
         INY
         INY
         INX
         INX
         LDA   ($00),Y
         CMP   #$FFFF
         BNE   L6AD8
         INY
         INY
         TXA
         DEC
         DEC
         STA   L043E
L6B17    LDA   ($00),Y
         INY
         INY
         TAX
         BMI   L6B31
         LSR
         CLC
         ADC   #$0014
         TAX
         LDA   ($00),Y
         INY
         INY
         SEP   #$20
         STA   L9300,X
         REP   #$20
         BRA   L6B17
L6B31    RTS

L6B32    BIT   $82
         BPL   L6B31
         LDX   L043E
         CLC
L6B3A    LDA   L03FE,X
         BEQ   L6B53
         LDA   L039E,X
         BMI   L6B53
         ADC   #$0004
         CMP   L03DE,X
         BCC   L6B50
         LDA   L03BE,X
         CLC
L6B50    STA   L039E,X
L6B53    DEX
         DEX
         BPL   L6B3A
         LDX   $28
         LDY   #$009F
         SEP   #$20
L6B5E    LDA   L9300,X
         BEQ   L6BD3
         REP   #$20
         AND   #$00FF
         PHX
         PHY
         DEC
         ASL
         TAY
         STY   $10
         LDA   L039E,Y
         TAY
         TXA
         ADC   |L0000,Y
         STX   $24
         SEC
         SBC   $28
         TAX
         CPX   #$9D00
         BCS   L6BDA
         LDA   |L0000+$2,Y
         BEQ   L6BCF
         CMP   #$0100
         BCC   L6BB5
         TAY
         BPL   L6BA8
         PHY
         AND   #$00FF
         ASL
         TAY
         LDA   $24
         SBC   $5A
         SBC   #$0014
         CMP   L0440,Y
         BCC   L6BA6
         CMP   L0480,Y
         BCC   L6BEB
L6BA6    PLY
         TYA
L6BA8    AND   #$7F00
         BEQ   L6BB1
         XBA
         JSR   L809A
L6BB1    TYA
         AND   #$00FF
L6BB5    DEC
         ASL
         ASL
         ADC   L039A
         STA   L6BCB+1
         LDA   L039A+2
         ADC   #$0000
         SEP   #$20
         STA   L6BCB+3
         REP   #$20
L6BCB    JSL   $FFFFFF
L6BCF    PLY
L6BD0    PLX
         SEP   #$20
L6BD3    INX
         DEY
         BPL   L6B5E
         REP   #$20
         RTS

L6BDA    PLY
         PLX
         PHX
         LDA   L9300,X
         AND   #$00FF
         DEC
         ASL
         TAX
         STZ   L03FE,X
         BRA   L6BD0
L6BEB    LDA   L3F36
         CMP   L04C0,Y
         BCC   L6C00
         CMP   L0500,Y
         BCS   L6C00
         LDY   $10
         LDA   L041E,Y
         STA   L5BE4
L6C00    BRA   L6BA6
L6C02    STZ   $78
         LDA   $6A
         ASL
         TAY
         LDA   L13BC,Y
         BEQ   L6C31
         STA   $00
         DEC   $78
         LDY   #$0000
         LDA   ($00),Y
         INY
         INY
         STA   L13BA
         LDA   ($00),Y
         INY
         INY
         STA   $7A
         LDX   L13B6
         STX   L6C44+1
         LDA   L13B6+2
         SEP   #$20
         STA   L6C44+3
         REP   #$20
L6C31    RTS

L6C32    BIT   $78
         BPL   L6C31
         LDA   $7A
         SEC
         SBC   $28
         CMP   #$008C
         BCS   L6C31
         ADC   L13BA
         TAX
L6C44    JSL   $FFFFFF
         RTS

L6C49    DB    $00
         DB    $00
L6C4B    DB    $00
         DB    $00
L6C4D    DB    $00
         DB    $00
L6C4F    DB    $00
         DB    $00
L6C51    LDX   #$0006
L6C54    LDY   L2444,X
         BEQ   L6CB9
         LDA   L2506,X
         BMI   L6CB9
         CLC
         ADC   $AC,X
         SBC   $28
         CMP   #$009C
         BCS   L6CB9
         PHX
         PHA
         ADC   L250E,X
         PHA
         LDA   L2516,X
         PLX
         ADC   L6C4D
         STA   L6C85+1
         LDA   L6C4F
         ADC   #$0000
         SEP   #$20
         STA   L6C85+3
         REP   #$20
L6C85    JSL   $FFFFFF
         DEY
         DEY
         BMI   L6CB6+1
         TYA
         EOR   #$FFFF
         ADC   #$00C1
         ASL
         TAX
         PLA
         SEC
         ADC   L9D00,X
         TAX
         TYA
         ASL
         ASL
         ADC   L6C49
         STA   L6CB2+1
         LDA   L6C4B
         ADC   #$0000
         SEP   #$20
         STA   L6CB2+3
         REP   #$20
L6CB2    JSL   $FFFFFF
L6CB6    BIT   $68
         PLX
L6CB9    DEX
         DEX
         BPL   L6C54
         RTS

L6CBE    STZ   $80
         STZ   $7E
         LDA   $6A
         ASL
         TAY
         LDA   L224C,Y
         BEQ   L6CEF
         STA   $00
         LDY   #$0000
         LDA   ($00),Y
         INY
         INY
         STA   $80
         LDA   ($00),Y
         INY
         INY
         STA   L224A
         LDA   ($00),Y
         INY
         INY
         CLC
         ADC   #$9E20
         STA   L6D45+1
         TYA
         CLC
         ADC   $00
         STA   L2248
L6CEF    RTS

L6CF0    LDA   $80
         BEQ   L6D44
         LDA   $7E
         BEQ   L6D03
L6CF8    LDA   ($7E)
         BMI   L6D3D
         INC   $7E
         INC   $7E
         JSR   L6D45
L6D03    LDX   $7C
         INC   $7C
         CPX   #$01FF
         BCC   L6D0E
         STZ   $7C
L6D0E    LDA   LB1AE,X
         CMP   $80
         BCS   L6D44
         LDX   $7C
         INC   $7C
         CPX   #$01FF
         BCC   L6D20
         STZ   $7C
L6D20    LDA   LB1AE,X
         AND   #$0003
         ASL
         ASL
         TAY
         LDA   L2248
         STA   $00
         LDA   ($00),Y
         INY
         INY
         STA   $7E
         LDA   ($00),Y
         BMI   L6D3B
         JSR   L809A
L6D3B    BRA   L6CF8
L6D3D    STZ   $7E
         LDA   L224A
         BRA   L6D45
L6D44    RTS

L6D45    STAL  $E19E3E
         RTS

L6D4A    LDA   $6A
         ASL
         TAY
         LDA   L2340,Y
         BEQ   L6DC5
         STA   $00
         LDY   #$0000
         LDA   ($00),Y
         INY
         INY
         STA   L22EE
         LDA   ($00),Y
         INY
         INY
         PHA
         LDA   ($00),Y
         INY
         INY
         PHA
         LDX   #$0000
L6D6C    LDA   ($00),Y
         INY
         INY
         CMP   #$FFFF
         BEQ   L6D83
         STA   L22F0,X
         LDA   ($00),Y
         INY
         INY
         STA   L2300,X
         INX
         INX
         BRA   L6D6C
L6D83    DEX
         DEX
         STX   L22EC
         BMI   L6D8D
         LDX   L22EE
L6D8D    STX   $DA
         LDX   #$0008
L6D92    STZ   L2316,X
         DEX
         DEX
         BNE   L6D92
L6D99    LDA   ($00),Y
         INY
         INY
         CMP   #$FFFF
         BEQ   L6DB9
         STA   L2320,X
         TYA
         CLC
         ADC   $00
         STA   L2310,X
L6DAC    LDA   ($00),Y
         INY
         INY
         CMP   #$FFFF
         BNE   L6DAC
         INX
         INX
         BRA   L6D99
L6DB9    PLA
         BMI   L6DBF
         JSR   L6DC6
L6DBF    PLA
         BMI   L6DC5
         JMP   L809A
L6DC5    RTS

L6DC6    ASL
         TAY
         LDX   #$0006
L6DCB    LDA   L2318,X
         BEQ   L6DD5
         DEX
         DEX
         BPL   L6DCB
         RTS

L6DD5    LDA   L2310,Y
         STA   L2318,X
         LDA   L2320,Y
         STA   L2330,X
         STZ   L2328,X
         LDA   #$FFFF
         STA   L2338,X
         RTS

L6DEB    LDX   #$0006
L6DEE    LDY   L2318,X
         BEQ   L6E26
         DEC   L2328,X
         BPL   L6E26
         LDA   L2330,X
         STA   L2328,X
         LDA   L2338,X
         BMI   L6E06
         JSR   L7FA1
L6E06    LDA   |L0000,Y
         CMP   #$FFFF
         BEQ   L6E23
         INC   L2318,X
         INC   L2318,X
         PHA
         AND   #$7FFF
         JSR   L809A
         PLY
         BPL   L6E26
         STA   L2338,X
         BRA   L6E26
L6E23    STZ   L2318,X
L6E26    DEX
         DEX
         BPL   L6DEE
         BIT   $DA
         BMI   L6E51
         DEC   $DA
         BPL   L6E51
         LDX   L22EE
         STX   $DA
         LDX   $7C
         INC   $7C
         CPX   #$01FF
         BCC   L6E42
         STZ   $7C
L6E42    LDA   LB1AE,X
         LDY   L22EC
L6E48    CMP   L22F0,Y
         BCC   L6E52
         DEY
         DEY
         BPL   L6E48
L6E51    RTS

L6E52    LDA   L2300,Y
         BPL   L6E5D
         AND   #$7FFF
         JMP   L6DC6
L6E5D    JMP   L809A

L6E60    LDX   #$09FE
L6E63    STZ   L8900,X
         DEX
         DEX
         BPL   L6E63
         STX   L13DA
         LDA   $6A
         ASL
         TAY
         LDA   L13E0,Y
         BEQ   L6EA6
         STA   $00
         LDY   #$0000
L6E7B    LDA   ($00),Y
         INY
         INY
         CMP   #$FFFF
         BEQ   L6EA6
         AND   #$FFF8
         TAX
         LDA   ($00),Y
         INY
         INY
         STA   L8900,X
         LDA   ($00),Y
         INY
         INY
         STA   L8900+2,X
         LDA   ($00),Y
         INY
         INY
         STA   L8900+4,X
         LDA   ($00),Y
         INY
         INY
         STA   L8900+6,X
         BRA   L6E7B
L6EA6    RTS

L6EA7    BIT   L13DA
         BMI   L6EBA
         DEC   L13DA
         BPL   L6EBA
         LDX   L13DE
         LDA   L13DC
         JSR   L6ECA
L6EBA    LDA   $5A
         AND   #$FFF8
         TAX
         LDA   L8900,X
         BEQ   L6EE9
         BMI   L6ECA
         STZ   L8900,X
L6ECA    CMP   #$0100
         BNE   L6EFF
         LDY   L8900+6,X
         BPL   L6EEA
         STA   L13DC
         TYA
         AND   #$7F00
         XBA
         STA   L13DA
         STX   L13DE
         TYA
         AND   #$00FF
         STA   L8900+6,X
L6EE9    RTS

L6EEA    LDA   L8900+4,X
         JSR   L809A
         LDA   L8900+6,X
         AND   #$00FF
         LDY   L8900+2,X
         LDX   #$0001
         JMP   L5DB4

L6EFF    CMP   #$0280
         BNE   L6F0A
         LDA   L8900+2,X
         JMP   L809A

L6F0A    CMP   #$0200
         BNE   L6F1A
         LDA   L8900+2,X
         CMP   L7FC6
         BEQ   L6F8E
         JMP   L7FC8

L6F1A    CMP   #$8400
         BNE   L6F3E
         LDA   L8900+2,X
         ASL
         TAY
         LDA   L8900+4,X
         INC
         ASL
         STA   $10
L6F2B    LDA   L8900+6,X
         STA   L03FE,Y
         LDA   L03BE,Y
         STA   L039E,Y
         INY
         INY
         CPY   $10
         BCC   L6F2B
         RTS

L6F3E    CMP   #$8580
         BNE   L6F47
         STZ   L6F8F
         RTS

L6F47    CMP   #$8500
         BNE   L6F6A
         LDY   $8E
         BEQ   L6F8E
         INC   L6F8F
         LDA   L6F8F
         CMP   L8900+2,X
         BCC   L6F8E
         STZ   L6F8F
         LDA   L8900+4,X
         ASL
         TAY
         LDA   L8900+6,X
         STA   L03FE,Y
         RTS

L6F6A    CMP   #$8480
         BNE   L6F75
         LDA   L8900+2,X
         STA   $84
         RTS

L6F75    CMP   #$0400
         BNE   L6F7D
         JMP   L6573

L6F7D    CMP   #$0380
         BNE   L6F8E
         LDA   L8900+2,X
         ASL
         TAY
         LDA   L8900+4,X
         STA   L22F0,Y
         RTS
L6F8E    RTS

L6F8F    BRK   $00
L6F91    LDA   $28
         AND   #$FFF8
         TAX
         LDA   L8900,X
         BPL   L6FE8
         CMP   #$F000
         BCC   L6FE8
         BNE   L6FAF
L6FA3    STZ   L8900,X
         LDA   L8900+2,X
         CLC
         ADC   $F0
         STA   $F0
         RTS

L6FAF    CMP   #$F100
         BNE   L6FC3
         JSR   L6FA3
         JSR   LE849
         LDA   L8900+4,X
         LDY   L8900+6,X
         JMP   LEA47

L6FC3    CMP   #$F180
         BNE   L6FD7
         JSR   L6FA3
         JSR   LE849
         LDA   L8900+4,X
         LDY   L8900+6,X
         JMP   LEB7D

L6FD7    CMP   #$F200
         BNE   L6FE8
         STZ   L8900,X
         LDA   L8900+4,X
         LDY   L8900+6,X
         JMP   LEA47
L6FE8    RTS

L6FE9    STZ   $28
         STZ   $64
         STZ   $F0
         LDA   $6A
         ASL
         TAX
         LDA   |L0000,X
         STA   $F2
         SEC
         SBC   #$0088
         STA   $F4
         CLC
         ADC   #$007D
         STA   $F6
         LDA   $F2
         CLC
         ADC   #$0014
         STA   $F8
         JMP   LE619

L700F    LDA   $28
         CMP   $64
         BEQ   L7030
         BCC   L7022
         SBC   $64
         LSR
         LSR
         LSR
         INC
         EOR   #$FFFF
         BRA   L702B
L7022    LDA   $64
         SEC
         SBC   $28
         LSR
         LSR
         LSR
         LSR
L702B    SEC
         ADC   $28
         STA   $28
L7030    RTS

*
* SINUS ANIMATION
*

L7031    LDA   #$0001	; T.PIC.LZ
         LDY   #$0001
         JSL   loadFILE
         JSR   LE6B2
         LDA   #$0000
         LDX   #$0004
         JSR   LE74C
         JSR   LE6F4
         LDA   #$0000
         LDX   #$0004
         JSR   LE805
         LDA   #$0002
         LDX   #$0000
         JSR   L7134
         LDY   #$0138
         STY   $26
         LDY   #$021E
         STY   $10
         LDA   #$000A
         LDX   #$0000
         LDY   #$FFFF
         JSR   L7094
         LDA   #$000A
         LDX   #$0028
         JSR   L7134
         JSR   L7163
         LDY   #$0188
         STY   $26
         LDY   #$02D0
         STY   $10
         LDA   #$0004
         LDX   #$0078
         LDY   #$0050
         JMP   L7094

L7094    STZ   $16
         STX   $24
         STY   $22
         LDY   $10
         STY   L712A
         LDY   #$00D2
         STY   L712C
         STA   $20
         LSR
         STA   $10
         LDA   #$00A0
         SEC
         SBC   $24
         XBA
         STA   L7132
         XBA
         INC
         STA   L712E

L70B9    JSR   LD789
         DEC   L712A
         BMI   L70DC
         LDX   $26
         LDY   $20
L70C5    LDAL  ptr00198E,X
         STAL  ptr00118E,X
         STAL  ptr000EBE,X
         INX
         INX
         DEC   L712A
         DEY
         DEY
         BPL   L70C5
         BRA   L710D
L70DC    DEC   $22
         BPL   L710D
         LDX   $26
         BIT   $16
         BMI   L70F2
         LDAL  ptr00118E,X
         XBA
         CMP   L712E
         BCS   L710D
         DEC   $16
L70F2    LDY   $20
         LDA   L7132
L70F7    STAL  ptr00118E,X
         STAL  ptr000EBE,X
         INX
         INX
         DEC   L712C
         DEY
         DEY
         BNE   L70F7
         BIT   L712C
         BMI   L7129

L710D    LDAL  $E1BFFF
         BPL   L7117
         STAL  $E1C010
L7117    AND   LE4C1
         ORAL  $E1C060
         ORAL  $E1C061
         BPL   L7127
         JMP   L8248	; PLAY GAME

L7127    BRA   L70B9
L7129    RTS

L712A    DW    $0000
L712C    DW    $0000
L712E    DW    $0000
         DW    $0000
L7132    DW    $0000

L7134    STA   $10
         TXA
         XBA
         STA   $12
         LDX   #$02CE
L713D    LDA   LB3AE,X
         XBA
         LDY   #$FFFF
         SEC
L7145    INY
         SBC   $10
         BCS   L7145
         TYA
         XBA
         STAL  ptr001800,X
         STAL  ptr001AD0,X
         LDA   $12
         STAL  ptr001000,X
         STAL  ptr0012D0,X
         DEX
         DEX
         BPL   L713D
         RTS

L7163    PEA   $0000
         PLB
         PLB
         LDX   #$02CE
L716B    LDA   $1800,X
         STA   $2000,X
         DEX
         DEX
         BPL   L716B
         LDY   #$0000
         TYX
L7179    LDA   $2000,Y
         STA   $1800,X
         STA   $1AD0,X
         STA   $1968,X
         STA   $1C38,X
         INX
         INX
         INY
         INY
         INY
         INY
         CPY   #$02D0
         BCC   L7179
         PHK
         PLB
         RTS

*
* ABOUT
*

L7196    DW    $0000
L7198    DW    $0000
L719A    DW    $0000
L719C    DW    $0000

L719E    LDA   #$0000
         LDX   #$0005
         JSR   LEDE4
         LDA   #$0005
         LDY   #$0000
         JSR   L7D68
         LDA   L7196
         STA   L725C+1
         LDA   L7198
         SEP   #$20
         STA   L725C+3
         REP   #$20
         LDA   L719A
         CLC
         ADC   #$0010
         STA   L7247+1
         LDA   L719C
         ADC   #$0000
         SEP   #$20
         STA   L7247+3
         REP   #$20
         JSR   L7333
         STZ   $14
         JSR   LE6B8
         JSR   LB77A
         JSR   LD519
         JSR   L7244
         JSR   LD638
         JSR   LE6F4
         LDA   #$0000
         JSR   LF04B
         STZ   $14
         STZ   $10
         STZ   $12
         STZ   $24
         LDX   #$FFFF
         STX   L7263
         STX   L7265
         STX   L7267
         STX   L7269
L720B    JSR   LD519
         JSR   L7244
         JSR   L72CB
         JSR   L7299
         JSR   LD638
         LDAL  $E1BFFF
         BPL   L7224
         STAL  $E1C010
L7224    AND   LE4C1
         ORAL  $E1C060
         ORAL  $E1C061
         BPL   L7234
         JMP   L8248

L7234    LDY   #$6000
L7237    DEY
         BNE   L7237
         INC   $14
         LDX   $14
         CPX   #$0140
         BCC   L720B
         RTS

L7244    LDX   #$2096
L7247    JSL   $FFFFFF
         LDA   $14
         CLC
         ADC   #$2000
         TAX
         JSR   L725C
         LDA   $14
         CLC
         ADC   #$45A0
         TAX
L725C    JSL   $FFFFFF
         RTS

L7261    DW    $0000
L7263    DW    $0000
L7265    DW    $0000
L7267    DW    $0000
L7269    DW    $0000
L726B    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000

L7273    TXY
         LDA   L7261
         PHA
         LDX   #$0002
         STX   L7261
         LDX   #$0006
L7281    LDA   L7263,X
         BPL   L7293
         PLA
         STA   L7263,X
         TYA
         SEC
         SBC   #$0DCA
         STA   L726B,X
         RTS

L7293    DEX
         DEX
         BPL   L7281
         PLA
         RTS

L7299    LDX   #$0006
L729C    LDA   L7263,X
         BMI   L72C6
         LDY   L726B,X
         PHX
         TYX
         EOR   #$0003
         ASL
         ASL
         ADC   L719A
         STA   L72BE+1
         LDA   L719C
         ADC   #$0000
         SEP   #$20
         STA   L72BE+3
         REP   #$20
L72BE    JSL   $FFFFFF
         PLX
         DEC   L7263,X
L72C6    DEX
         DEX
         BPL   L729C
         RTS

L72CB    LDA   $10
         CMP   #$0008
         BCS   L730E
         ASL
         TAY
         LDX   L163E,Y
         LDY   $12
         LDA   L8400,Y
         CMP   #$FFFF
         BNE   L72E7
         STZ   $24
         INC   $10
         BRA   L7306
L72E7    STA   L72F4+1
         LDA   L8400+$2,Y
         SEP   #$20
         STA   L72F4+3
         REP   #$20
L72F4    JSL   $FFFFFF
         STX   $00
         LDA   $24
         INC   $24
         ASL
         ASL
         ADC   $00
         TAX
         JSR   L7273
L7306    INC   $12
         INC   $12
         INC   $12
         INC   $12
L730E    LDA   $10
         BEQ   L7332
L7312    DEC
         PHA
         ASL
         TAY
         LDX   L163E,Y
         ASL
         TAY
         LDA   L15FE,Y
         STA   L732B+1
         LDA   L15FE+2,Y
         SEP   #$20
         STA   L732B+3
         REP   #$20
L732B    JSL   $FFFFFF
         PLA
         BNE   L7312
L7332    RTS

L7333    STZ   L73B9
         LDX   #$0000
L7339    PHX
         LDA   L4AF0,X
         STA   $00
         LDA   ($00)
         AND   #$00FF
         INC
         STA   L73BB
         STZ   L4C0A
         LDY   #$0001
L734E    INC   L4C0A
         LDA   ($00),Y
         STA   L4C0A,Y
         LDA   #$FF01
         STA   L4C0B,Y
         PHY
         LDA   $00
         PHA
         LDA   #$0006
         LDY   #$0000
         JSR   L7D68
         LDAL  $E1BFFF
         BPL   L7373
         STAL  $E1C010
L7373    AND   LE4C1
         ORAL  $E1C060
         ORAL  $E1C061
         BPL   L7383
         JMP   L8248

L7383    PLA
         STA   $00
         LDX   L73B9
         LDA   L4C3C
         STA   L8400,X
         INX
         INX
         LDA   L4C3E
         STA   L8400,X
         INX
         INX
         STX   L73B9
         PLY
         INY
         CPY   L73BB
         BCC   L734E
         LDA   #$FFFF
         STA   L8400,X
         TXA
         ADC   #$0003
         STA   L73B9
         PLX
         INX
         INX
         CPX   #$0010
         BCC   L7339
         RTS

L73B9    DW    $0000
L73BB    DW    $0000

*
* HERO AND JOYSTICK
*

L73BD    LDA   #$0001	; S1/H0.PIC - S1/H1.PIC.LZ
         LDY   #$000A
         JSL   loadFILE
         LDA   #$0000
         LDX   #$0003
         JSR   LE7A5	; SHOW PIC H0
         LDX   #$0384
         JSR   L73DF	; WAIT
         LDA   #$8000
         LDX   #$0003
         JMP   LE7A5	; SHOW PIC H1

L73DF    JSR   LB710
         LDAL  $E1BFFF
         BPL   L73EC
         STAL  $E1C010
L73EC    AND   LE4C1
         ORAL  $E1C060
         ORAL  $E1C061
         BPL   L73FC
         JMP   L8248	; JUMP TO GAME

L73FC    DEX
         BPL   L73DF
         RTS

*
* HALL OF FAME
*

L7400    ADRL  $00000000
L7404    ADRL  $00000000

L7408    LDA   #$0000
         LDX   #$0005
         JSR   LEDE4
         LDA   #$0007
         LDY   #$0000
         JSR   L7D68
         LDA   L7400
         STA   L749B+1
         LDA   L7400+2
         SEP   #$20
         STA   L749B+3
         REP   #$20
         JSR   L76C2
         JSR   LE6B8
         JSR   LE638
         JSR   LD640
         JSR   LE6F4
         LDA   #$0001
         JSR   LF04B
         LDX   #$000E
L7442    STZ   $3A,X
         STZ   L7753,X
         STZ   L7605,X
         STZ   L7635,X
         DEX
         DEX
         BPL   L7442
         STZ   $10
         LDX   #$0004
         STX   L7645
         LDX   #$00A0
         STX   L7647
L745F    JSR   L77D1
         JSR   L7498
         JSR   L7568
         JSR   L74A0
         JSR   L74D1
         JSR   LCFE8
         LDAL  $E1BFFF
         BPL   L747B
         STAL  $E1C010
L747B    AND   LE4C1
         ORAL  $E1C060
         ORAL  $E1C061
         BPL   L748B
         JMP   L8248	; KEY PRESSED, PLAY

L748B    BIT   L7645
         BPL   L745F
         DEC   L7647
         BPL   L745F
         JMP   LE6B8

L7498    LDX   #$3EA0
L749B    JSL   $FFFFFF
         RTS

L74A0    LDA   #$0000
L74A3    PHA
         ASL
         TAY
         LDX   L78C7,Y
         LDA   L7753,Y
         BEQ   L74C9
         DEC
         ASL
         ASL
         ADC   L7749,Y
         TAY
         LDA   L8400,Y
         STA   L74C5+1
         LDA   L8400+$2,Y
         SEP   #$20
         STA   L74C5+3
         REP   #$20
L74C5    JSL   $FFFFFF
L74C9    PLA
         INC
         CMP   #$0005
         BCC   L74A3
         RTS

L74D1    LDX   #$000E
L74D4    LDA   $3A,X
         BNE   L74E8
         LDY   #$0000
L74DB    LDA   L7635,Y
         BEQ   L74ED
         INY
         INY
         CPY   #$000A
         BCC   L74DB
         RTS

L74E8    DEX
         DEX
         BPL   L74D4
         RTS

L74ED    TYA
         STA   L7625,X
         LDA   L4E89,Y
         STA   $00
         LDA   L7749,Y
         LSR
         LSR
         CLC
         ADC   L7753,Y
         TAY
         LDA   L7763,Y
         AND   #$00FF
         INC
         TAY
         ASL
         ASL
         ADC   #$0019
         STA   L7615,X
         LDA   ($00),Y
         AND   #$00FF
         SEC
         SBC   #$00A0
         BEQ   L7550
         ASL
         TAY
         LDA   L9E90,Y
         STA   L7605,X
         LDY   L7625,X
         LDA   L75EB,Y
         STA   $3A,X
         LDA   #$FFFF
         STA   L7635,Y
         LDA   #$00A0
         STA   $2A,X
         STZ   $4A,X
         PHX
         LDX   $7C
         INC   $7C
         CPX   #$01FF
         BCC   L7544
         STZ   $7C
L7544    LDA   LB1AE,X
         PLX
         AND   #$0003
         INC
         STA   L75F5,X
         RTS

L7550    LDY   L7625,X
         PHX
         TYX
         INC   L7753,X
         LDA   L7753,X
         CMP   #$0016
         BCC   L7566
         DEC   L7645
         DEC   L7635,X
L7566    PLX
         RTS

L7568    LDX   #$000E
L756B    LDA   $3A,X
         BEQ   L75D2
         ASL
         TAY
         STY   $16
         LDA   L9D00,Y
         STA   $26
         LDA   $4A,X
         INC
         CMP   #$000A
         BCC   L7583
         LDA   #$0000
L7583    STA   $4A,X
         ASL
         TAY
         LDA   L75D7,Y
         STA   $24
         LDA   $2A,X
         SEC
         SBC   L75F5,X
         TAY
         BPL   L759E
         CPY   #$FFD8
         BCS   L759E
         STZ   $3A,X
         BRA   L75D2
L759E    STY   $2A,X
         PHX
         LDA   L7605,X
         BEQ   L75CE
         TYA
         CMP   L7615,X
         BCS   L75CB
         STZ   L7605,X
         LDA   L7625,X
         PHX
         TAX
         INC   L7753,X
         STZ   L7635,X
         LDA   L7753,X
         CMP   #$0016
         BCC   L75C8
         DEC   L7645
         DEC   L7635,X
L75C8    PLX
         BRA   L75CE
L75CB    JSR   L7649
L75CE    JSR   L7687
         PLX
L75D2    DEX
         DEX
         BPL   L756B
         RTS

L75D7    DW    $0000
         DW    $0005
         DW    $000A
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $000A
         DW    $0005
         DW    $0000

L75EB    DW    $0033
         DW    $003C
         DW    $0045
         DW    $004E
         DW    $0057

L75F5    DS    $10
L7605    DS    $10
L7615    DS    $10
L7625    DS    $10
L7635    DS    $10
L7645    DW    $0000
L7647    DW    $0000

L7649    PHY
         TYA
         LDY   L7605,X
         CLC
         LDX   $16
         ADC   L9D28,X
         TAX
         LDA   #$0008
         STA   $12
L765A    LDA   [$E8],Y
         AND   #$6666
         STA   $14
         LDA   $02,X
         AND   [$EC],Y
         ORA   $14
         STA   $02,X
         INY
         INY
         LDA   [$E8],Y
         AND   #$6666
         STA   $14
         LDA   $00,X
         AND   [$EC],Y
         ORA   $14
         STA   $00,X
         INY
         INY
         TXA
         ADC   #$00A0
         TAX
         DEC   $12
         BPL   L765A
         PLY
         RTS

L7687    LDA   #$0004
L768A    PHA
         LDA   $24
         ASL
         ASL
         ADC   L7404
         STA   L76B1+1
         LDA   L7404+2
         ADC   #$0000
         SEP   #$20
         STA   L76B1+3
         REP   #$20
         CPY   #$009C
         BCC   L76AD
         CPY   #$FFFC
         BCC   L76B5
         CLC
L76AD    TYA
         ADC   $26
         TAX
L76B1    JSL   $FFFFFF
L76B5    TYA
         CLC
         ADC   #$0008
         TAY
         INC   $24
         PLA
         DEC
         BPL   L768A
         RTS

L76C2    STZ   L7745
         LDX   #$0000
         TXY
L76C9    PHX
         PHY
         LDY   L4E89,X
         STY   $00
         LDY   #$0019
         LDA   #$A0A0
L76D6    STA   L4F26,Y
         DEY
         DEY
         BPL   L76D6
         PLY
         LDA   #$0015
         STA   L7747
L76E4    LDA   L7763,Y
         AND   #$00FF
         PHY
         TAY
         INY
         LDA   ($00),Y
         SEP   #$20
         STA   L4F26,Y
         REP   #$20
         LDA   $00
         PHA
         LDA   #$0008
         LDY   #$0000
         JSR   L7D68
         LDAL  $E1BFFF
         BPL   L770C
         STAL  $E1C010
L770C    AND   LE4C1
         ORAL  $E1C060
         ORAL  $E1C061
         BPL   L771C
         JMP   L8248

L771C    PLA
         STA   $00
         LDX   L7745
         LDA   L4C3C
         STA   L8400,X
         INX
         INX
         LDA   L4C3E
         STA   L8400,X
         INX
         INX
         STX   L7745
         PLY
         INY
         DEC   L7747
         BPL   L76E4
         PLX
         INX
         INX
         CPX   #$000A
         BCC   L76C9
         RTS

L7745    DB    $00
         DB    $00
L7747    DB    $00
         DB    $00
L7749    DB    $00
         DB    $00
         DB    $58
         DB    $00
         DB    $B0
         DB    $00
         DB    $08
         DB    $01
         DB    $60
         DB    $01
L7753    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L7763    DB    $0E
         DB    $0A
         DB    $0C
         DB    $08
         DB    $04
         DB    $03
         DB    $00
         DB    $02
         DB    $0B
         DB    $09
         DB    $13
         DB    $14
         DB    $11
         DB    $06
         DB    $12
         DB    $07
         DB    $0D
         DB    $18
         DB    $05
         DB    $16
         DB    $15
         DB    $19
         DB    $14
         DB    $11
         DB    $04
         DB    $0C
         DB    $16
         DB    $08
         DB    $18
         DB    $13
         DB    $0A
         DB    $05
         DB    $02
         DB    $0E
         DB    $12
         DB    $0D
         DB    $07
         DB    $03
         DB    $06
         DB    $09
         DB    $0B
         DB    $19
         DB    $00
         DB    $15
         DB    $0D
         DB    $08
         DB    $05
         DB    $16
         DB    $19
         DB    $07
         DB    $09
         DB    $04
         DB    $02
         DB    $15
         DB    $13
         DB    $12
         DB    $06
         DB    $0E
         DB    $14
         DB    $0A
         DB    $00
         DB    $11
         DB    $18
         DB    $03
         DB    $0B
         DB    $0C
         DB    $02
         DB    $18
         DB    $11
         DB    $03
         DB    $09
         DB    $08
         DB    $0B
         DB    $0C
         DB    $13
         DB    $0E
         DB    $04
         DB    $0D
         DB    $06
         DB    $07
         DB    $14
         DB    $16
         DB    $12
         DB    $19
         DB    $15
         DB    $00
         DB    $05
         DB    $0A
         DB    $13
         DB    $02
         DB    $18
         DB    $00
         DB    $06
         DB    $08
         DB    $09
         DB    $0C
         DB    $14
         DB    $07
         DB    $03
         DB    $16
         DB    $04
         DB    $11
         DB    $0B
         DB    $0A
         DB    $12
         DB    $15
         DB    $0E
         DB    $05
         DB    $0D
         DB    $19

L77D1    LDX   #$0040
         CLC
L77D5    LDAL  $E19E3E,X
         STAL  $E19E1E,X
         TXA
         ADC   #$0020
         TAX
         CPX   #$01E0
         BCC   L77D5
L77E7    LDX   $10
         LDA   L77FF,X
         BPL   L77F2
         STZ   $10
         BRA   L77E7
L77F2    STAL  $E19FFE
         LDA   $10
         CLC
         ADC   #$0006
         STA   $10
         RTS

L77FF    DW    $0F00
         DW    $0F10
         DW    $0F20
         DW    $0F30
         DW    $0F40
         DW    $0F50
         DW    $0F60
         DW    $0F70
         DW    $0F80
         DW    $0F90
         DW    $0FA0
         DW    $0FB0
         DW    $0FC0
         DW    $0FD0
         DW    $0FE0
         DW    $0FF0
         DW    $0FF0
         DW    $0EF0
         DW    $0DF0
         DW    $0CF0
         DW    $0BF0
         DW    $0AF0
         DW    $09F0
         DW    $08F0
         DW    $07F0
         DW    $06F0
         DW    $05F0
         DW    $04F0
         DW    $03F0
         DW    $02F0
         DW    $01F0
         DW    $00F0
         DW    $00F0
         DW    $00F1
         DW    $00F2
         DW    $00F3
         DW    $00F4
         DW    $00F5
         DW    $00F6
         DW    $00F7
         DW    $00F8
         DW    $00F9
         DW    $00FA
         DW    $00FB
         DW    $00FC
         DW    $00FD
         DW    $00FE
         DW    $00FF
         DW    $00FF
         DW    $00EF
         DW    $00DF
         DW    $00CF
         DW    $00BF
         DW    $00AF
         DW    $009F
         DW    $008F
         DW    $007F
         DW    $006F
         DW    $005F
         DW    $004F
         DW    $003F
         DW    $002F
         DW    $001F
         DW    $000F
         DW    $000F
         DW    $010F
         DW    $020F
         DW    $030F
         DW    $040F
         DW    $050F
         DW    $060F
         DW    $070F
         DW    $080F
         DW    $090F
         DW    $0A0F
         DW    $0B0F
         DW    $0C0F
         DW    $0D0F
         DW    $0E0F
         DW    $0F0F
         DW    $0F0F
         DW    $0F0E
         DW    $0F0D
         DW    $0F0C
         DW    $0F0B
         DW    $0F0A
         DW    $0F09
         DW    $0F08
         DW    $0F07
         DW    $0F06
         DW    $0F05
         DW    $0F04
         DW    $0F03
         DW    $0F02
         DW    $0F01
         DW    $0F00
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF

L78C7    DW    $4C7C	; 0
         DW    $521C	; 1
         DW    $57BC	; 2
         DW    $5D5C	; 3
         DW    $62FC	; 4

*
* HALL OF FAME
*

L78D1    RTS		; DIRECT EXIT!!! NOT ACTIVATED!!!

L78D2    BIT   $A4	; REPLAY MODE?
         BMI   L78D1	; YES, EXIT

         LDA   #$0009	; 
         LDY   #$0000
         JSR   L7D68
         LDA   #$000A
         STA   $10
         LDY   #$007D
         SEP   #$20
L78E9    LDA   L4E89,Y
         STA   L4E93+$13,Y
         DEY
         CPY   $10
         BCS   L78E9
         REP   #$20
         INY
         LDA   #$A0A0
         STA   L4E8B+1,Y
         STA   L4E8D+1,Y
         STA   L4E8F+1,Y
         STA   L4E91+1,Y
         STA   L4E93+1,Y
         STA   L4E93+3,Y
         STA   L4E93+5,Y
         LDA   #$B11A	; 1-
         STA   L4E93
         LDA   #$B21A	; 2-
         STA   L4EB0
         LDA   #$B31A	; 3-
         STA   L4ECD
         LDA   #$B41A	; 4-
         STA   L4EEA
         LDA   #$B51A	; 5-
         STA   L4F07
         LDA   $6A	; LEVEL
         ASL
         TAX
         LDA   L72A8,X
         STA   L4E93+$F,Y
         LDA   $94	; SCORE (HIGH)
         AND   #$00FF
         JSR   L7A0A
         LDA   $92	; SCORE (LOW)
         AND   #$FF00
         XBA
         JSR   L7A0A
         LDA   $92	; SCORE (LOW)
         AND   #$00FF
         JSR   L7A0A
         LDA   #$6666
         LDX   #$0000
         JSR   LF329
         LDY   #$0004
L795C    TYA
         ASL
         TAX
         LDA   L78C7,X
         TAX
         DEX
         LDA   #L4E89
         PHY
         JSR   LF1A4
         PLY
         DEY
         BPL   L795C
         JSR   LE638
         LDX   #$00A0
         LDA   #$0000
L7978    STAL  $0194E0,X
         STAL  $019580,X
         STAL  $019620,X
         STAL  $0196C0,X
         STAL  $019760,X
         STAL  $019800,X
         STAL  $0198A0,X
         STAL  $019940,X
         STAL  $0199E0,X
         STAL  $019A80,X
         STAL  $019B20,X
         STAL  $019BC0,X
         STAL  $019C60,X
         DEX
         DEX
         BPL   L7978
         LDA   #$8888
         LDX   #$0000
         JSR   LF329
         LDA   #L4C40	; ENTER NAME IN HALL OF FAME
         LDY   #$0005
         LDX   #$9620
         JSR   LF1A4
         JSR   LE7A8
         LDA   #$0001
         JSR   LF04B
         LDA   #$0001
         JSR   L7F4C
         LDA   #$0008
         JSR   L8091
         STZ   $10
         LDX   #$0032
         JSR   L79F8
         JSR   LD640
         LDX   #$004B
         JSR   L79F8
         LDA   #$0009
         JSR   L8091
         LDX   #$0032
         JSR   L79F8
         RTS

L79F8    PHX
         JSR   L77D1
         LDY   #$0002
L79FF    JSR   LB710
         DEY
         BPL   L79FF
         PLX
         DEX
         BNE   L79F8
         RTS

L7A0A    TAX
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         CLC
         ADC   #$00B0
         STA   $10
         TXA
         AND   #$000F
         ADC   #$00B0
         XBA
         ORA   $10
         STA   L4E93+8,Y
         INY
         INY
         RTS

L72A8    ASC   "010203040506070809101112"
L7A40    ADRL  $00000000
L7A44    ADRL  $00000000

*
*
*

L7A48    JSR   L7F82
         LDA   #$0000	; 
         LDX   #$0005
         JSR   LEDE4
         LDA   #$0004
         LDY   #$0000
         JSR   L7D68
         LDA   L7A44
         STA   L7BF5+1
         LDA   L7A44+2
         SEP   #$20
         STA   L7BF5+3
         REP   #$20
         LDA   L7A40
         STA   L7C5A+1
         CLC
         ADC   #$0004
         STA   L7C45+1
         ADC   #$0004
         STA   L7C30+1
         ADC   #$0004
         STA   L7C1B+1
         ADC   #$0004
         STA   L7C06+1
         ADC   #$0004
         STA   L7C6B+1
         ADC   #$0004
         STA   L7C7C+1
         ADC   #$0004
         STA   L7C8D+1
         ADC   #$0004
         STA   L7C9E+1
         ADC   #$0004
         STA   L7CAF+1
         LDA   L7A40+2
         SEP   #$20
         STA   L7C06+3
         STA   L7C1B+3
         STA   L7C30+3
         STA   L7C45+3
         STA   L7C5A+3
         STA   L7C6B+3
         STA   L7C7C+3
         STA   L7C8D+3
         STA   L7C9E+3
         STA   L7CAF+3
         REP   #$20
         LDY   #$0000
         LDX   #$0028
L7AD5    LDA   L15FE,X
         STA   L7D0F+1,Y
         LDA   L15FE+2,X
         SEP   #$20
         STA   L7D0F+3,Y
         REP   #$20
         TYA
         ADC   #$0007
         TAY
         DEX
         DEX
         DEX
         DEX
         BPL   L7AD5
         JSR   LE6B2
         JSR   LE716
         JSR   L7BF2
         JSR   LC8A7
         LDA   #$0003
         JSR   LE6CA
         LDX   #$0098
         STX   $12
         STZ   $10
         STZ   $14
         STZ   $22
         LDX   #$0016
         STX   $16
L7B12    JSR   L7BF2
         LDA   $14
         AND   #$0007
         ASL
         TAX
         LDY   $10
         LDA   L7CB4,X
         JSR   L7BFA
         LDA   $14
         AND   #$0007
         ASL
         TAX
         LDY   $12
         LDA   L7CD4,X
         JSR   L7C5F
         LDX   $16
         JSR   (L7CF4,X)
         JSR   LC8A7
         LDA   $14
         CMP   #$0028
         BCC   L7B46
         INC   $10
         DEC   $12
L7B46    INC   $14
         INC   $22
         LDA   $22
         CMP   #$0009
         BCC   L7B5B
         STZ   $22
         LDX   $16
         BEQ   L7B5B
         DEC   $16
         DEC   $16
L7B5B    LDX   $12
         CPX   #$0056
         BCS   L7B12
         LDA   #$0001	; E0.PIC E1.PIC E2.PIC
         LDY   #$000B
         JSL   loadFILE
         LDA   #$0006	; EO.SND
         LDY   #$0002
         JSL   loadFILE
         LDA   #$0002
         JSR   L7FBD
         LDA   #$0008
         JSR   L7F4C
         LDA   #$0006
         JSR   L8091
         LDA   #$0000
         LDX   #$0004
         JSR   LE74C
         LDA   #$0000
         TAY
         JSR   LF0B7
         JSR   LE7A8
         JSR   L7D5A
         JSR   L7D5A
         LDA   #$0006
         JSR   L8091
         JSR   L7D5A
         LDA   #$8000
         LDX   #$0004
         JSR   LE7A5
         LDA   #$0007
         JSR   L8091
         JSR   L7D5A
         LDA   #$0006
         JSR   L7D5A
         LDA   #$0007
         LDA   #$0000
         LDX   #$0005
         JSR   LE7A5
         JSR   L7D5A
         LDA   #$0007
         JSR   L8091
         JSR   L7D5A
         LDA   #$0007
         JSR   L7D5A
         LDA   #$0007
         JSR   L7D5A
         JSR   L7D5A
         JSR   L7D5A
         JSR   L7F82
         JMP   LE6B8

L7BF2    LDX   #$2008
L7BF5    JSL   $FFFFFF
         RTS

L7BFA    ASL
         TAX
         LDA   L9D00,X
         STA   $26
         TYA
         CLC
         ADC   $26
         TAX
L7C06    JSL   $FFFFFF
         TYA
         SEC
         SBC   #$0010
         TAY
         BPL   L7C17
         CPY   #$FFF8
         BCC   L7C5E
L7C17    CLC
         ADC   $26
         TAX
L7C1B    JSL   $FFFFFF
         TYA
         SEC
         SBC   #$0010
         TAY
         BPL   L7C2C
         CPY   #$FFF8
         BCC   L7C5E
L7C2C    CLC
         ADC   $26
         TAX
L7C30    JSL   $FFFFFF
         TYA
         SEC
         SBC   #$0010
         TAY
         BPL   L7C41
         CPY   #$FFF8
         BCC   L7C5E
L7C41    CLC
         ADC   $26
         TAX
L7C45    JSL   $FFFFFF
         TYA
         SEC
         SBC   #$0010
         TAY
         BPL   L7C56
         CPY   #$FFF8
         BCC   L7C5E
L7C56    CLC
         ADC   $26
         TAX
L7C5A    JSL   $FFFFFF
L7C5E    RTS

L7C5F    ASL
         TAX
         LDA   L9D00,X
         STA   $26
         TYA
         CLC
         ADC   $26
         TAX
L7C6B    JSL   $FFFFFF
         TYA
         ADC   #$0010
         TAY
         CPY   #$0098
         BCS   L7CB3
         ADC   $26
         TAX
L7C7C    JSL   $FFFFFF
         TYA
         ADC   #$0010
         TAY
         CPY   #$0098
         BCS   L7CB3
         ADC   $26
         TAX
L7C8D    JSL   $FFFFFF
         TYA
         ADC   #$0010
         TAY
         CPY   #$0098
         BCS   L7CB3
         ADC   $26
         TAX
L7C9E    JSL   $FFFFFF
         TYA
         ADC   #$0010
         TAY
         CPY   #$0098
         BCS   L7CB3
         ADC   $26
         TAX
L7CAF    JSL   $FFFFFF
L7CB3    RTS

L7CB4    DW    $0011
         DW    $0010
         DW    $000F
         DW    $000E
         DW    $000D
         DW    $000D
         DW    $000E
         DW    $000F
         DW    $0001
         DW    $0001
         DW    $0001
         DW    $0001
         DW    $0001
         DW    $0001
         DW    $0001
         DW    $0001
L7CD4    DW    $002E
         DW    $002D
         DW    $002C
         DW    $002B
         DW    $002A
         DW    $002A
         DW    $002B
         DW    $002C
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF
L7CF4    DA    L7D0C
         DA    L7D13
         DA    L7D1A
         DA    L7D21
         DA    L7D28
         DA    L7D2F
         DA    L7D36
         DA    L7D3D
         DA    L7D44
         DA    L7D4B
         DA    L7D52
         DA    L7D59

L7D0C    LDX   L164E+4
L7D0F    JSL   $FFFFFF
L7D13    LDX   L164E+2
         JSL   $FFFFFF
L7D1A    LDX   L164E
         JSL   $FFFFFF
L7D21    LDX   L163E+$E
         JSL   $FFFFFF
L7D28    LDX   L163E+$C
         JSL   $FFFFFF
L7D2F    LDX   L163E+$A
         JSL   $FFFFFF
L7D36    LDX   L163E+8
         JSL   $FFFFFF
L7D3D    LDX   L163E+6
         JSL   $FFFFFF
L7D44    LDX   L163E+4
         JSL   $FFFFFF
L7D4B    LDX   L163E+2
         JSL   $FFFFFF
L7D52    LDX   L163E
         JSL   $FFFFFF
L7D59    RTS

L7D5A    LDX   #$000A
         LDY   #$0000
L7D60    DEY
         BNE   L7D60
         DEX
         BNE   L7D60
         RTS
L7D67    RTS

*
*
*

L7D68    ASL
         TAX
         TYA
         BEQ   L7D7D
         BIT   $E6
         BMI   L7D76
         LDA   L1676,X
         BRA   L7D79
L7D76    LDA   L168C,X
L7D79    BEQ   L7D67
         BRA   L7D82
L7D7D    LDA   L1662,X
         BEQ   L7D67
L7D82    STA   $16
         LDY   #$0000
L7D87    LDA   ($16),Y
         BMI   L7D99
         TAX
         INY
         INY
         LDA   ($16),Y
         PHY
         TXY
         JSL   loadFILE
         PLY
         INY
         INY
L7D99    LDA   ($16),Y
         BPL   L7D87
         CMP   #$FFFF
         BEQ   L7D67
         CMP   #$8200	; SET GAME SOUND
         BEQ   L7DC8
         CMP   #$8280	; SET LEVEL SOUND
         BEQ   L7DCB
         CMP   #$8180	; SET FONT PARMS
         BEQ   L7DCE
         CMP   #$8100	; MAKE TEXT SPRITE
         BEQ   L7DD1
         CMP   #$8040	; MAKE SPRITE
         BEQ   L7DD4
         CMP   #$8080	; MAKE SPRITE
         BEQ   L7DD7
         CMP   #$8000	; MAKE SPRITE
         BEQ   L7DDA
         BRL   L7EC2
L7DC8    BRL   L7DDD
L7DCB    BRL   L7DEB
L7DCE    BRL   L7DF9
L7DD1    BRL   L7E1C
L7DD4    BRL   L7E6D
L7DD7    BRL   L7E78
L7DDA    BRL   L7E80

L7DDD    INY
         INY
         LDA   ($16),Y
         INY
         INY
         PHY
         JSR   L7FBD
         PLY
         BRL   L7D99

L7DEB    INY
         INY
         LDA   ($16),Y
         INY
         INY
         PHY
         JSR   L7FC8
         PLY
         BRL   L7D99

L7DF9    INY
         INY
         LDA   ($16),Y
         INY
         INY
         PHA
         LDA   ($16),Y
         INY
         INY
         TAX
         PLA
         PHY
         JSR   LF329
         PLY
         LDA   ($16),Y
         INY
         INY
         JSR   LEFAC	; make mask
         LDA   ($16),Y
         INY
         INY
         STA   LF1CA
         BRL   L7D99

L7E1C    STZ   LEFD3
         INY
         INY
         LDA   ($16),Y
         INY
         INY
         PHA
         LDA   ($16),Y
         INY
         INY
         PHA
         LDA   ($16),Y
         INY
         INY
         STA   L7EC3
         LDA   ($16),Y
         INY
         INY
         STA   L7EC5
         LDA   ($16),Y
         INY
         INY
         STA   L7EC7
         PLX
         PLA
         PHY
         LDY   $16
         PHY
         TXY
         JSR   LF1CC
         PHA
         LDA   L7EC3
         STA   $00
         LDA   L7EC5
         STA   $04
         PLA
         STA   ($00)
         INC   $00
         INC   $00
         TXA
         STA   ($00)
         TYA
         CLC
         ADC   L7EC7
         STA   ($04)
         PLY
         STY   $16
         PLY
         BRL   L7D99

L7E6D    INY
         INY
         LDA   ($16),Y
         INY
         INY
         STZ   LEFD3
         BRA   L7E88
L7E78    LDA   #$FFFF
         STA   LEFD3
         BRA   L7E83
L7E80    STZ   LEFD3
L7E83    LDA   #$FFFF
         INY
         INY
L7E88    JSR   LEFAC	; make mask
         LDA   ($16),Y
         INY
         INY
         PHA
         LDA   ($16),Y
         INY
         INY
         PHA
         LDA   ($16),Y
         INY
         INY
         STA   $24
         LDA   ($16),Y
         INY
         INY
         STA   $6E
         PLX
         PLA
         CMP   #$0000
         BNE   L7EB1
         CPX   #$0000
         BNE   L7EB1
         LDA   $74
         LDX   $76
L7EB1    JSR   LEDFC
         STA   ($24)
         INC   $24
         INC   $24
         TXA
         STA   ($24)
         LDY   $26
         BRL   L7D99
L7EC2    RTS

L7EC3    DW    $0000
L7EC5    DW    $0000
L7EC7    DW    $0000
L7EC9    DW    $0000
L7ECB    DW    $0000
L7ECD    DW    $0000

*
*
*

L7ECF    LDA   $6A
         ASL
         TAY
         LDA   L2186,Y
         PHA
         BIT   L7ECD
         BMI   L7F16

         LDA   #$0000	; LOAD LEVEL SPRITES
         LDX   #$0005
         JSR   LEDE4
         BIT   $E6
         BMI   L7EF4
         LDA   #$0000
         LDY   #$0000
         JSR   L7D68	; LOAD ALL FILES
         BRA   L7EFD

L7EF4    LDA   #$0001
         LDY   #$0000
         JSR   L7D68
L7EFD    LDA   #$0002
         LDY   #$0000
         JSR   L7D68
         LDX   $70
         STX   L7EC9
         LDX   $72
         STX   L7ECB
         LDX   #$FFFF
         STX   L7ECD
L7F16    LDA   L7EC9
         LDX   L7ECB
         JSR   LEDE4
         LDA   $6A
         LDY   #$0001
         JSR   L7D68
         LDA   #$0005	; S1/L1A.PF.LZ
         PLY		; S1/L1B.PF.LZ
         JSL   loadFILE
         LDX   #$0004
         JSR   LE7C0
         LDA   #$7E00
         JSR   LE73F
         JSR   LE6E5
         LDA   $6A
         LDY   #$0001
         JSR   LF0B7
         JSR   LF176
         JMP   L5D80

*
* SOUND ROUTINES
*

L7F4C    SEP   #$30
         TAY
         STY   L7F80
         LDA   #$00
         STAL  $E1C03C
         LDX   #$1E
         DEX
L7F5B    TXA
         ORA   #$A0
         STAL  $E1C03E
         LDA   #$03
         STAL  $E1C03D
         DEX
         BPL   L7F5B
         LDA   #$E1
         STAL  $E1C03E
         TYA
         ASL
         STAL  $E1C03D
         LDA   $D6
         STAL  $E1C03C
         REP   #$30
         RTS

L7F80    DW    $0000

*
*
*

L7F82    SEP   #$30
         LDA   #$00
         STAL  $E1C03C
         LDX   L7F80
         DEX
L7F8E    TXA
         ORA   #$A0
         STAL  $E1C03E
         LDA   #$03
         STAL  $E1C03D
         DEX
         BPL   L7F8E
         REP   #$30
         RTS

L7FA1    SEP   #$20
         ORA   #$A0
         STAL  $E1C03E
         LDA   #$03
         STAL  $E1C03D
         REP   #$20
         RTS

L7FB2    SEP   #$20
         LDA   $D6
         STAL  $E1C03C
         REP   #$20
         RTS

L7FBD    PHX
         PHY
         ASL
         TAY
         LDX   #$0000
         BRA   L7FD4
         
L7FC6    DW    $0000

L7FC8    PHX
         PHY
         STA   L7FC6
         ASL
         TAY
         LDA   $6A
         INC
         ASL
         TAX
L7FD4    LDA   L50ED,X
         STA   $04
         LDA   ($04),Y
         STA   $04
         LDA   L52C3,X
         STA   $08
         LDY   #$FFFE
L7FE5    INY
         INY
         LDA   ($04),Y
         CMP   #$FFFF
         BEQ   L8014
         STA   L8017
         INY
         INY
         LDA   ($04),Y
         STA   L8019
L7FF8    INY
         INY
         LDA   ($04),Y
         BMI   L7FE5
         PHY
         ASL
L8000    TAY
         LDA   ($08),Y
         TAX
         STX   $00
         LDA   |L0000,X
         TAX
         AND   #$FF00
         TAY
         JSR   L801B
         PLY
         BRA   L7FF8
L8014    PLY
         PLX
         RTS

L8017    DW    $0000
L8019    DW    $0000

L801B    PHB
         PHY
         STZ   $10
         INC   $00
         INC   $00
         INC   $00
         INC   $00
         INC   $00
         LDA   ($00)
         AND   #$00FF
         BEQ   L8038
         INC   $10
         TYA
         SEC
         SBC   #$0010
         TAY
L8038    LDA   L8017
         STA   L805B+1
         LDA   L8019
         SEP   #$20
         PHA
         PLB
         LDA   $D6
         ORA   #$60
         STAL  $E1C03C
         LDA   #$00
         STAL  $E1C03E
         TXA
         STAL  $E1C03F
         LDX   #$0000
L805B    LDA   |$0000,X
         STAL  $E1C03D
         INX
         DEY
         BNE   L805B
         LDA   $10
         BEQ   L8076
         LDX   #$000F
         LDA   #$00
L806F    STAL  $E1C03D
         DEX
         BPL   L806F
L8076    LDA   $D6
         STAL  $E1C03C
         REP   #$20
         PLA
         PLB
         CLC
         ADC   L8017
         STA   L8017
         LDA   #$0000
         ADC   L8019
         STA   L8019
         RTS

L8091    PHX
         PHY
         ASL
         TAY
         LDX   #$0000
         BRA   L80A3
L809A    PHX
         PHY
         ASL
         TAY
         LDA   $6A
         INC
         ASL
         TAX
L80A3    LDA   L52C3,X
         STA   $00
         LDA   ($00),Y
         STA   $00
         JSR   L80B3
         TXA
         PLY
         PLX
         RTS

L80B3    SEP   #$30
         LDA   $D6
         ORA   #$20
         STAL  $E1C03C
         LDA   #$A0
         STAL  $E1C03E
         LDAL  $E1C03D
         LDX   #$00
L80C9    LDAL  $E1C03D
         AND   #$01
         BNE   L80E3
         INX
         CPX   L7F80
         BCC   L80C9
         LDA   $D6
         STAL  $E1C03C
         REP   #$30
         LDX   #$FFFF
         RTS

L80E3    LDA   $D6
         STAL  $E1C03C
         REP   #$30
         BRA   L80ED
L80ED    LDY   #$0000
         SEP   #$20
         TXA
         ORA   #$20
         STAL  $E1C03E
         LDA   #$00
         STAL  $E1C03D
         TXA
         ORA   #$80
         STAL  $E1C03E
         LDA   ($00),Y
         STAL  $E1C03D
         INY
         INY
         TXA
         ORA   #$00
         STAL  $E1C03E
         LDA   ($00),Y
         STAL  $E1C03D
         INY
         TXA
         ORA   #$C0
         STAL  $E1C03E
         LDA   ($00),Y
         STAL  $E1C03D
         INY
         TXA
         ORA   #$40
         STAL  $E1C03E
         LDA   ($00),Y
         STAL  $E1C03D
         INY
         TXA
         ORA   #$A0
         STAL  $E1C03E
         LDA   #$03
         STAL  $E1C03D
         LDA   ($00),Y
         STAL  $E1C03D
         INY
         REP   #$20
         RTS

*
*
*

L814F    JSR   L6FE9
         JSR   L69E4
         JSR   L6A7B
         JSR   L6C02
         JSR   L6CBE
         JSR   L5FBB
         JSR   L5D93
         JSR   L5EE8
         JSR   L6506
         JSR   L6E60
         JMP   L6207

L8170    LDA   #$0008
         JSR   L7F4C
         JMP   L6D4A

*
* ENTRY POINT
*

L8179    SEI		; ENTRY POINT
         CLC
         XCE
         PHK
         PLB
         REP   #$30
         PEA   $0000
         PLD
         LDA   #$01FF
         TCS
         LDAL  $E100CA	; GET IIGS VOLUME
         STA   $D6
         STZ   $7C
         STZ   LE4C1
         LDX   #$A000	; $01/A000
         STX   $E8
         LDX   #$0001
         STX   $EA
         STX   $EE
         LDX   #$AB40	; $01/AB40
         STX   $EC
         LDX   #$0000	; $0A/0000
         STX   $E0
         LDX   #$000A
         STX   $E2
         BRA   L81B6	; SKIP BELOW

L81B0    JSR   LE6B8	; CLEAR PALETTE
         JSR   L7F82	; SOUND

L81B6    LDA   #$01FF
         TCS
         LDA   #$0003
         STAL  $E1C026
         STAL  $E1C010
         JSR   L7031	; SINUS ANIMATION
         JSR   L719E	; ABOUT THE GAME
         JSR   L73BD	; HERO AND JOYSTICK
         JSR   L7408	; HALL OF FAME
         BRA   L81B6	; LOOP

L81D3    STZ   $68	; NO DEMO
         JSR   LE6B8	; CLEAR PALETTE
         JSR   LE716	; CLEAR SCB
         JSR   LE60A	; CLEAR SHR 01
         LDA   #$FFFF
         LDX   #$EEEE
         JSR   LF329	; SET MASKS
         LDA   #L486D	; SELECT STARTING LEVEL
         LDY   #$0000
         LDX   #$5200
         JSR   LF1A4	; DISPLAY STRING
         JSR   LB77A	; BLIT SCREEN
         LDA   #$0000
         JSR   LE6CA	; COPY PALETTE 0
         LDA   #$0003	; RESET KEBD
         STAL  $E1C026
         STAL  $E1C010
L8207    LDAL  $E1BFFF	; WAIT FOR KEY
         BPL   L8207
         STAL  $E1C010
         XBA
         AND   #$00FF
         CMP   #$009B	; ESCAPE
         BEQ   L823C
         CMP   #$00C1	; A
         BEQ   L8235
         CMP   #$00E1	; a
         BEQ   L8235
         cmp   #"D"	; Demo
         beq   theDEMO
         cmp	#"d"	; demo
         beq	theDEMO
         cmp	#"Z"
         beq   anotherMODE
         cmp	#"z"
         beq	anotherMODE
         CMP   #$00B0	; 0
         BCC   L8248
         CMP   #$00BA	; 9+1
         BCS   L8248
         SBC   #$00AF
         STA   $6A
         BRA   L8256

L8235    LDA   #$000A	; START ON LEVEL 10
         STA   $6A
         BRA   L8256

L823C    JMP   L81B6

theDEMO
         LDX   #$FFFF	; DEMO MODE
         STX   $68
         STZ   $6A
         BRA   L8256

L8248    LDA   #$01FF
         TCS
         JMP   L81D3	; SELECT STARTING LEVEL

anotherMODE
         STZ   $6A	; LEVEL 0
         STZ   $68	; NO DEMO MODE
         JSR   LE6B8

L8256    LDX   #$0000	; STORE EVENTS IN BANK A
         STX   $DC
         LDX   #$000A
         STX   $DE
         JSR   L586E	; SELECT HERO OR HEROINE
         JSR   L82DD	; GET RANDOM VALUE
         JSR   L5BB7	; INIT SCORE AND FRIENDS
         STZ   L6935
         STZ   L7ECD
L826F    JSR   L7F82	; SOUND
         JSR   L57BE	; DISPLAY MAP OR CASTLE
         JSR   L5829	; DISPLAY LEVEL DESCRIPTION (PARCHMENT)
         JSR   L7ECF	; PREPARE LEVEL
         JSR   L5B68	; DISPLAY SCORE/HITSTRENGTH/LIVES
         JSR   LEDCB	; MOVE BACKGROUND TO BANK 4
         JSR   L814F	; PLENTY OF ROUTINES
         JSR   L5A65	; PRESS A KEY TO CONTINUE
         JSR   L5B8F	; DISPLAY SCORE BAR
         LDA   #$0003
         STAL  $E1C026
         STAL  $E1C010
         JSR   L8170	; SOUND AND 
         JMP   L82FF	; PLAY THE LEVEL NOW

L829B    INC   $6A	; NEXT LEVEL
         JSR   L5F30
         LDX   $6A
         CPX   #$000B	; END OF GAME?
         BCS   L82A9	; YES
         BRA   L826F	; NO, LOOP

* WE WON, SHOW IT TO THE USER

L82A9    JSR   L7F82	; SOUND
         JSR   L82D0	; SET REPLAY PTR
         JSR   L7A48	; ANIMATION (WE WON?)
         JSR   L5AB3	; ANIMATION (GAME OVER?)
         JMP   L81B0	; RESTART

* WE LOST, SHOW IT TO THE USER

L82B8    JSR   L7F82	; SOUND
         JSR   L82D0	; SET REPLAY PTR
         JSR   L5AB3	; ANIMATION (GAME OVER?)
         JMP   L81B0	; RESTART

* WE QUIT, SHOW IT TO THE USER

L82C4    JSR   LE6B8	; CLEAR PALETTE
         JSR   L7F82	; SOUND
         JSR   L82D0	; SET REPLAY PTR
         JMP   L81B0	; RESTART

L82D0    BIT   $A4	; REPLAY MODE?
         BMI   L82DC	; YES
         LDX   $DC	; RESTORE
         STX   $E0	; POINTERS
         LDX   $DE
         STX   $E2
L82DC    RTS

L82DD    BIT   $A4	; REPLAY MODE?
         BMI   L82F4
         BIT   $68	; DEMO MODE?
         BMI   L82FA
* BUG
         LDAl  $C02F	; GET A RANDOM NUMBER
         ORAl  $C02E	; FROM BANK 2
         AND   #$00FF	; AHEM...
         STA   L82FD
         STA   $7C
         RTS

L82F4    LDA   L82FD	; RANDOM VALUE
         STA   $7C
         RTS

L82FA    STZ   $7C	; INIT RANDOM VALUE
         RTS

L82FD    DW    $0000

*
* MAIN GAME LOOP
*

L82FF    JSR   LB91A	; BLIT 03 > 01
         BIT   $84
         BPL   L8309
         JSR   L6B32	; SPRITE
L8309    JSR   L6236	; DO SOMETHING, HANDLES THE RETURN KEY
         JSR   L5EC1	; DO SOMETHING
         JSR   L670D	; DO SOMETHING (MOVEMENTS?)
         JSR   L5F7D	; ?
         JSR   L5F07	; ?
         JSR   L60E6	; ?
         BIT   $84
         BMI   L8322
         JSR   L6B32	; SPRITE
L8322    JSR   L63C5	; SPRITE
         JSR   L6C32	; SPRITE
         JSR   L6A26	; SPRITE
         JSR   L6C51	; SPRITES
         JSR   L5E09	; SPRITES
         JSR   LC3F6	; BLIT 00 > 01
         JSR   L5B9A	; PALETTE AND KEY AND BUTTON
         JSR   L64E5	; CHECK LEVEL FINISHED?
         JSR   L6CF0	; ?
         JSR   L6DEB	; ?
         JSR   L6EA7	; ?
         JSR   L5BE6	; SHOW STRENGTH
         JSR   L700F	; CALCULATION
         JSR   L6F91	; ?
         JSR   L5709	; WAS A KEY PRESSED? Q GOES TO L8248
         JMP   L82FF	; LOOP

         DS    \

*
* START OF SODAN0 FILE
*

L8400    DS    $500
L8900    DS    $A00
L9300    DS    $A00

L9D00    DW    $2000
         DW    $20A0
         DW    $2140
         DW    $21E0
         DW    $2280
         DW    $2320
         DW    $23C0
         DW    $2460
         DW    $2500
         DW    $25A0
L9D14    DW    $2640
         DW    $26E0
         DW    $2780
         DW    $2820
         DW    $28C0
         DW    $2960
         DW    $2A00
         DW    $2AA0
         DW    $2B40
         DW    $2BE0
L9D28    DW    $2C80
         DW    $2D20
         DW    $2DC0
         DW    $2E60
         DW    $2F00
         DW    $2FA0
         DW    $3040
         DW    $30E0
         DW    $3180
         DW    $3220
         DW    $32C0
         DW    $3360
         DW    $3400
         DW    $34A0
         DW    $3540
         DW    $35E0
         DW    $3680
         DW    $3720
         DW    $37C0
         DW    $3860
         DW    $3900
         DW    $39A0
         DW    $3A40
         DW    $3AE0
         DW    $3B80
         DW    $3C20
         DW    $3CC0
         DW    $3D60
         DW    $3E00
         DW    $3EA0
         DW    $3F40
         DW    $3FE0
         DW    $4080
         DW    $4120
         DW    $41C0
         DW    $4260
         DW    $4300
         DW    $43A0
         DW    $4440
         DW    $44E0
         DW    $4580
         DW    $4620
         DW    $46C0
         DW    $4760
         DW    $4800
         DW    $48A0
         DW    $4940
         DW    $49E0
         DW    $4A80
         DW    $4B20
         DW    $4BC0
         DW    $4C60
         DW    $4D00
         DW    $4DA0
         DW    $4E40
         DW    $4EE0
         DW    $4F80
         DW    $5020
         DW    $50C0
         DW    $5160
         DW    $5200
         DW    $52A0
         DW    $5340
         DW    $53E0
         DW    $5480
         DW    $5520
         DW    $55C0
         DW    $5660
         DW    $5700
         DW    $57A0
         DW    $5840
         DW    $58E0
         DW    $5980
         DW    $5A20
         DW    $5AC0
         DW    $5B60
         DW    $5C00
         DW    $5CA0
         DW    $5D40
         DW    $5DE0
         DW    $5E80
         DW    $5F20
         DW    $5FC0
         DW    $6060
         DW    $6100
         DW    $61A0
         DW    $6240
         DW    $62E0
         DW    $6380
         DW    $6420
         DW    $64C0
         DW    $6560
         DW    $6600
         DW    $66A0
         DW    $6740
         DW    $67E0
         DW    $6880
         DW    $6920
         DW    $69C0
         DW    $6A60
         DW    $6B00
         DW    $6BA0
         DW    $6C40
         DW    $6CE0
         DW    $6D80
         DW    $6E20
         DW    $6EC0
         DW    $6F60
L9E00    DW    $7000
         DW    $70A0
         DW    $7140
         DW    $71E0
         DW    $7280
         DW    $7320
         DW    $73C0
         DW    $7460
         DW    $7500
         DW    $75A0
         DW    $7640
         DW    $76E0
         DW    $7780
         DW    $7820
         DW    $78C0
         DW    $7960
         DW    $7A00
         DW    $7AA0
         DW    $7B40
         DW    $7BE0
         DW    $7C80
         DW    $7D20
         DW    $7DC0
         DW    $7E60
         DW    $7F00
         DW    $7FA0
         DW    $8040
         DW    $80E0
         DW    $8180
         DW    $8220
         DW    $82C0
         DW    $8360
         DW    $8400
         DW    $84A0
         DW    $8540
         DW    $85E0
         DW    $8680
         DW    $8720
         DW    $87C0
         DW    $8860
         DW    $8900
         DW    $89A0
         DW    $8A40
         DW    $8AE0
         DW    $8B80
         DW    $8C20
         DW    $8CC0
         DW    $8D60
         DW    $8E00
         DW    $8EA0
         DW    $8F40
         DW    $8FE0
         DW    $9080
         DW    $9120
         DW    $91C0
         DW    $9260
         DW    $9300
         DW    $93A0
         DW    $9440
         DW    $94E0
         DW    $9580
         DW    $9620
         DW    $96C0
         DW    $9760
         DW    $9800
         DW    $98A0
         DW    $9940
         DW    $99E0
         DW    $9A80
         DW    $9B20
         DW    $9BC0
         DW    $9C60
L9E90    DW    $0000
         DW    $0024
         DW    $0048
         DW    $006C
         DW    $0090
         DW    $00B4
         DW    $00D8
         DW    $00FC
         DW    $0120
         DW    $0144
         DW    $0168
         DW    $018C
         DW    $01B0
         DW    $01D4
         DW    $01F8
         DW    $021C
L9EB0    DW    $0240
         DW    $0264
         DW    $0288
         DW    $02AC
         DW    $02D0
         DW    $02F4
         DW    $0318
         DW    $033C
         DW    $0360
         DW    $0384
         DW    $03A8
         DW    $03CC
         DW    $03F0
         DW    $0414
         DW    $0438
         DW    $045C
         DW    $0480
         DW    $04A4
         DW    $04C8
         DW    $04EC
         DW    $0510
         DW    $0534
         DW    $0558
         DW    $057C
         DW    $05A0
         DW    $05C4
         DW    $05E8
         DW    $060C
         DW    $0630
         DW    $0654
         DW    $0678
         DW    $069C
         DW    $06C0
         DW    $06E4
         DW    $0708
         DW    $072C
         DW    $0750
         DW    $0774
         DW    $0798
         DW    $07BC
         DW    $07E0
         DW    $0804
         DW    $0828
         DW    $084C
         DW    $0870
         DW    $0894
         DW    $08B8
         DW    $08DC
         DW    $0900
         DW    $0924
         DW    $0948
         DW    $096C
         DW    $0990
         DW    $09B4
         DW    $09D8
         DW    $09FC
         DW    $0A20
         DW    $0A44
         DW    $0A68
         DW    $0A8C
         DW    $0AB0
         DW    $0AD4
         DW    $0AF8
         DW    $0B1C
L9F30    DW    $0000
         DW    $0DDF
         DW    $0224
         DW    $0446
         DW    $0779
         DW    $0B00
L9F3C    DW    $0422
         DW    $0532
         DW    $0753
         DW    $0A74
         DW    $0CA8

L9F46    DA    L9F4E      ; WAS 4 ENTRIES ONLY?
         DA    L9F6E
         DA    L9F8E
         DA    L9FAE
L9F4E    HEX   00000000000000000000000000000000
         HEX   0000000000000000000000000008FF0F
L9F6E    HEX   00006F065D044B033902270115000300
         HEX   02000000000000000000000000000000
L9F8E    HEX   04000000000000000000000000000000
         HEX   0000000000000000000000000000FF0F
L9FAE    HEX   0000000F000C000900032006310A420B
         HEX   530C640D860F970FB90FED0F920DF000
L9FCE    DA    L9FD2
         DA    LA0BA
L9FD2    DW    $9E00
         DW    $9E40
         DW    $9E60
         DW    $9E80
         DW    $9EA0
         DW    $9EC0
         DW    $9EE0
         DW    $9F00
         DW    $9F20
         DW    $9F40
         DW    $9F60
         DW    $9F80
         DW    $9FA0
         DW    $9FC0
         DW    $9FE0
         DW    $FFFF
         DW    $9E1E
         DW    $0FFF
         DW    $9E5E
         DW    $0FFA
         DW    $9E7E
         DW    $0FF7
         DW    $9E9E
         DW    $0FF4
         DW    $9EBE
         DW    $0FAF
         DW    $9EDE
         DW    $0F7F
         DW    $9EFE
         DW    $0F4F
         DW    $9F1E
         DW    $0AAF
         DW    $9F3E
         DW    $077F
         DW    $9F5E
         DW    $044F
         DW    $9F7E
         DW    $0AFA
         DW    $9F9E
         DW    $07F7
         DW    $9FBE
         DW    $04F4
         DW    $FFFF
         DW    $9D10
         DW    $0000
         DW    $0002
         DW    $0002
         DW    $0003
         DW    $0003
         DW    $0004
         DW    $0004
         DW    $FFFF
         DW    $9D24
         DW    $0000
         DW    $0005
         DW    $0005
         DW    $0006
         DW    $0006
         DW    $0007
         DW    $0007
         DW    $FFFF
         DW    $9D2C
         DW    $0000
         DW    $0005
         DW    $0005
         DW    $0006
         DW    $0006
         DW    $0007
         DW    $0007
         DW    $FFFF
         DW    $9D40
         DW    $0000
         DW    $0008
         DW    $0008
         DW    $0009
         DW    $0009
         DW    $000A
         DW    $000A
         DW    $FFFF
         DW    $9D48
         DW    $0000
         DW    $0008
         DW    $0008
         DW    $0009
         DW    $0009
         DW    $000A
         DW    $000A
         DW    $FFFF
         DW    $9D5C
         DW    $0000
         DW    $000B
         DW    $000B
         DW    $000C
         DW    $000C
         DW    $000D
         DW    $000D
         DW    $FFFF
         DW    $9D70
         DW    $0000
         DW    $000B
         DW    $000B
         DW    $000C
         DW    $000C
         DW    $000D
         DW    $000D
         DW    $FFFF
         DW    $9D78
         DW    $0000
         DW    $000B
         DW    $000B
         DW    $000C
         DW    $000C
         DW    $000D
         DW    $000D
         DW    $FFFF
         DW    $FFFF
LA0BA    DW    $9E00
         DW    $9E40
         DW    $9E60
         DW    $9E80
         DW    $9EA0
         DW    $9EC0
         DW    $9EE0
         DW    $9F00
         DW    $9F20
         DW    $9F40
         DW    $9F60
         DW    $9F80
         DW    $9FA0
         DW    $9FC0
         DW    $9FE0
         DW    $FFFF
         DW    $9E5E
         DW    $00E1
         DW    $9E7E
         DW    $00D2
         DW    $9E9E
         DW    $00C3
         DW    $9EBE
         DW    $00B4
         DW    $9EDE
         DW    $00A5
         DW    $9EFE
         DW    $0096
         DW    $9F1E
         DW    $0087
         DW    $9F3E
         DW    $0078
         DW    $9F5E
         DW    $0069
         DW    $9F7E
         DW    $005A
         DW    $9F9E
         DW    $004B
         DW    $9FBE
         DW    $003C
         DW    $9FDE
         DW    $002D
         DW    $9FFE
         DW    $001E
         DW    $FFFF
         DW    $9D02
         DW    $0002
         DW    $0002
         DW    $0002
         DW    $0002
         DW    $0003
         DW    $0003
         DW    $0003
         DW    $0004
         DW    $0004
         DW    $0004
         DW    $0005
         DW    $0005
         DW    $0005
         DW    $0006
         DW    $0006
         DW    $0006
         DW    $0007
         DW    $0007
         DW    $0007
         DW    $0008
         DW    $0008
         DW    $0008
         DW    $0009
         DW    $0009
         DW    $0009
         DW    $000A
         DW    $000A
         DW    $000A
         DW    $000B
         DW    $000B
         DW    $000B
         DW    $000C
         DW    $000C
         DW    $000C
         DW    $000C
         DW    $000D
         DW    $000D
         DW    $000D
         DW    $000D
         DW    $000E
         DW    $000E
         DW    $000E
         DW    $000E
         DW    $000F
         DW    $000F
         DW    $000F
         DW    $000F
         DW    $FFFF
         DW    $FFFF

LA178    DA    LA17A
LA17A    DW    $0033
         DW    $0002
         DW    $0010
         DW    $037F
         DW    $048F
         DW    $059F
         DW    $06AF
         DW    $07BF
         DW    $08CF
         DW    $09DF
         DW    $0AEF
         DW    $0BEF
         DW    $0CEF
         DW    $0DEF
         DW    $0EEF
         DW    $0EEF
         DW    $FFFF
LA19C    DA    LA1B2
         DA    LA1D4
         DA    LA1EC
         DA    LA20A
         DA    LA22A
         DA    $0000
         DA    $0000
         DA    $0000
         DA    $0000
         DA    $0000
         DA    LA234
LA1B2    DW    $0006
         DW    $0004
         DW    $001E
         DW    $037F
         DW    $048F
         DW    $059F
         DW    $06AF
         DW    $07BF
         DW    $08CF
         DW    $09DF
         DW    $0AEF
         DW    $0BEF
         DW    $0CEF
         DW    $0DEF
         DW    $0EEF
         DW    $0EEF
         DW    $FFFF
LA1D4    DW    $0008
         DW    $0001
         DW    $001E
         DW    $026F
         DW    $037F
         DW    $048F
         DW    $059F
         DW    $06AF
         DW    $07BF
         DW    $08CF
         DW    $09DF
         DW    $FFFF
LA1EC    DW    $0006
         DW    $0003
         DW    $001E
         DW    $030F
         DW    $040F
         DW    $050F
         DW    $060F
         DW    $071F
         DW    $081F
         DW    $091E
         DW    $0A2D
         DW    $0B4B
         DW    $0C69
         DW    $0D87
         DW    $FFFF
LA20A    DW    $0008
         DW    $0005
         DW    $001A
         DW    $0004
         DW    $0005
         DW    $0006
         DW    $0007
         DW    $0008
         DW    $0009
         DW    $000A
         DW    $000B
         DW    $000C
         DW    $000D
         DW    $000E
         DW    $000F
         DW    $FFFF
LA22A    DW    $0008
         DW    $005E
         DW    $001E
         DW    $0104
         DW    $FFFF
LA234    DW    $0008
         DW    $006C
         DW    $0016
         DW    $0FFF
         DW    $FFFF
LA23E    DA    LA254
         DA    LA254
         DA    LA262
         DA    LA278
         DA    LA28E
         DA    LA2A4
         DA    LA2A4
         DA    LA2A4
         DA    LA2A4
         DA    LA2A4
         DA    LA254
LA254    DW    $0F0F
         DW    $0F0F
         DW    $0F0F
         DW    $0F0F
         DW    $01E0
         DW    $0DDF
         DW    $FFFF
LA262    DW    $0E0D
         DW    $0F0F
         DW    $0E0F
         DW    $0D0D
         DW    $01A0
         DW    $037F
         DW    $01C0
         DW    $06AF
         DW    $01E0
         DW    $09DF
         DW    $FFFF
LA278    DW    $0E0D
         DW    $0F0F
         DW    $0E0F
         DW    $0D0D
         DW    $01A0
         DW    $0550
         DW    $01C0
         DW    $0880
         DW    $01E0
         DW    $0DD0
         DW    $FFFF
LA28E    DW    $0302
         DW    $0404
         DW    $0304
         DW    $0202
         DW    $0040
         DW    $0700
         DW    $0060
         DW    $0B00
         DW    $0080
         DW    $0E00
         DW    $FFFF
LA2A4    DW    $0201
         DW    $0302
         DW    $0203
         DW    $0101
         DW    $0020
         DW    $0779
         DW    $0040
         DW    $0AAC
         DW    $0060
         DW    $0DDF
         DW    $FFFF
LA2BA    HEX   AAA0AAAAAAAA0AAA	; red cross
         HEX   AAA599999999AAA9
         HEX   99A588888888AA99
         HEX   899599989999AA98
         HEX   8895AA999AAAA989
         HEX   9895A089A08AA989
         HEX   9895AAA9AAAAA999
         HEX   99958AAAAAA0A99A
         HEX   A9959AAAAA99A99A
         HEX   AA959AAAA998A9AA
         HEX   AA9589AA9988A9AA
         HEX   AA95789A9885A9A9
         HEX   AA9557898855A999
         HEX   9A9555788555A998
         HEX   9A9555788515A998
         HEX   9A9555788555AA98
         HEX   AA9557898855AA99
         HEX   A995789A9885AAA9
         HEX   999589AA9988AAAA
         HEX   999599AA9998A9AA
         HEX   99959AAAA999A9AA
         HEX   999599AAA998AAAA
         HEX   9995899A9988AAA9
         HEX   A99578999885AA99
         HEX   AA9557898855A999
         HEX   9A9555788515A998
         HEX   9A9555788555A998
         HEX   9A9555788555A998
         HEX   AA9557898855AA99
         HEX   AA95789A9885AAA9
         HEX   A99589AA9988A9AA
         HEX   A9959AAAA998A9AA
         HEX   A99599AAA999A99A
         HEX   AA95A99AA9AAA99A
         HEX   AA9599999999A9AA
         HEX   9A9588999988AAA9
         HEX   9A9599899889AA99
         HEX   99A5AA98889AA999
         HEX   89A5AAA989AAA998
         HEX   8995AAA989AAA998
         HEX   8895AAA989AAA998
         HEX   8985AAA989AAA998
         HEX   9A95AA98889AAA99
         HEX   AA9599899889AAA9
         HEX   AA95889A9888AAAA
         HEX   AA9599898999AAA9
         HEX   9A95A99899AAAA98
         HEX   9A95AAA9AAAAA999
         HEX   9995AAAAAAAAA99A
         HEX   A995999AA999A9AA
         HEX   AA9588899988AAA9
         HEX   9A9511189881AA99
         HEX   499544118814AA99
         HEX   499598418144A998
         HEX   499599811449A988
         HEX   4995A9811499A988
         HEX   4995A981149AA988
         HEX   99959814149AA988
         HEX   9A9581491499A988
         HEX   9A9514991498A988
         HEX   9A9589A91498A988
         HEX   AA95AA991499A988
         HEX   A995999A119AA998
         HEX   A9959AAA419AA998
         HEX   A99599AA4119AA98
         HEX   AA95999A8411AA99
         HEX   AA9519999841AAA9
         HEX   AA9511999984A9AA
         HEX   9A954119A998A9AA
         HEX   9A958119AA99A9AA
         HEX   999588149AA9AA99
         HEX   9995981489AAA998
         HEX   9A959814199AA988
         HEX   9A95881411999988
         HEX   9A95811441889988
         HEX   9A95114484119998
         HEX   AA9544498844A999
         HEX   A995999A9999AA99
         HEX   99559999AAAA0AAA
         HEX   5550555555550055
LA53A    HEX   1114114001111114
         HEX   1144111111111111
         HEX   0044A00000011100
         HEX   50441A0550A14105
         HEX   5040A40000A10105
         HEX   0040450000040100
         HEX   4041500AA4001100
         HEX   A04400A11A00110A
         HEX   4544001114001101
         HEX   5044000445004100
         HEX   0040A40050010100
         HEX   50401A0000A10105
         HEX   5041A40550A11105
         HEX   0044450000041100
         HEX   4444444444441444
         HEX   4444444004444444
         HEX   1114114001111114
         HEX   1144111111111111
         HEX   0044990000001100
         HEX   0044AA9900994100
         HEX   0040009A09A90100
         HEX   904000999A900100
         HEX   0041009A99001100
         HEX   9044000AA0001109
         HEX   904400090000110A
         HEX   9044000990004109
         HEX   A040000090000109
         HEX   A0400009A0000100
         HEX   90410009A9001100
         HEX   9044099A99001100
         HEX   4444444444441444
         HEX   4444444004444444

LA63A    DW    $6064
         DW    $7004
         DW    $7FA4
         DW    $8F44

LA642    DDB   $0040
LA644    DDB   $0040
LA646    DDB   $0040
LA648    DDB   $0040
LA64A    DDB   $0040
         DDB   $0444
         DDB   $0004
         DDB   $0444
         DDB   $0400
         DDB   $0444
         DDB   $0444
         DDB   $0004
         DDB   $0444
         DDB   $0004
         DDB   $0444
         DDB   $0404
         DDB   $0404
         DDB   $0444
         DDB   $0004
         DDB   $0004

LA66A    DDB   $0000
         DDB   $1000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $4000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $1144
         DDB   $1111
         DDB   $4000
         DDB   $FFFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $114F
         DDB   $1F41
         DDB   $4000
         DDB   $FFFF
         DDB   $4FFF
         DDB   $4000
         DDB   $4444
         DDB   $4444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $1000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $4000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $1144
         DDB   $1111
         DDB   $4000
         DDB   $FFFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $114F
         DDB   $1F41
         DDB   $4000
         DDB   $FFFF
         DDB   $4FFF
         DDB   $4000
         DDB   $4444
         DDB   $4444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $1000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $4000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $1144
         DDB   $1111
         DDB   $4000
         DDB   $FFFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $114F
         DDB   $1F41
         DDB   $4000
         DDB   $FFFF
         DDB   $4FFF
         DDB   $4000
         DDB   $4444
         DDB   $4444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $1000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $4000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $1144
         DDB   $1111
         DDB   $4000
         DDB   $FFFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $114F
         DDB   $1F41
         DDB   $4000
         DDB   $FFFF
         DDB   $4FFF
         DDB   $4000
         DDB   $4444
         DDB   $4444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $1000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $4000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $1144
         DDB   $1111
         DDB   $4000
         DDB   $FFFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $114F
         DDB   $1F41
         DDB   $4000
         DDB   $FFFF
         DDB   $4FFF
         DDB   $4000
         DDB   $4444
         DDB   $4444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $1000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $4000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $1144
         DDB   $1111
         DDB   $4000
         DDB   $FFFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $114F
         DDB   $1F41
         DDB   $4000
         DDB   $FFFF
         DDB   $4FFF
         DDB   $4000
         DDB   $4444
         DDB   $4444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $1000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $4000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $1144
         DDB   $1111
         DDB   $4000
         DDB   $FFFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $114F
         DDB   $1F41
         DDB   $4000
         DDB   $FFFF
         DDB   $4FFF
         DDB   $4000
         DDB   $4444
         DDB   $4444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $1000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $4000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $1144
         DDB   $1111
         DDB   $4000
         DDB   $FFFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $114F
         DDB   $1F41
         DDB   $4000
         DDB   $FFFF
         DDB   $4FFF
         DDB   $4000
         DDB   $4444
         DDB   $4444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $1000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $4000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $1144
         DDB   $1111
         DDB   $4000
         DDB   $FFFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $114F
         DDB   $1F41
         DDB   $4000
         DDB   $FFFF
         DDB   $4FFF
         DDB   $4000
         DDB   $4444
         DDB   $4444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $1000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $4000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $1144
         DDB   $1111
         DDB   $4000
         DDB   $FFFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $114F
         DDB   $1F41
         DDB   $4000
         DDB   $FFFF
         DDB   $4FFF
         DDB   $4000
         DDB   $4444
         DDB   $4444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $1000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $4000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $1144
         DDB   $1111
         DDB   $4000
         DDB   $FFFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $114F
         DDB   $1F41
         DDB   $4000
         DDB   $FFFF
         DDB   $4FFF
         DDB   $4000
         DDB   $4444
         DDB   $4444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $1000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $4000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $1144
         DDB   $1111
         DDB   $4000
         DDB   $FFFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $114F
         DDB   $1F41
         DDB   $4000
         DDB   $FFFF
         DDB   $4FFF
         DDB   $4000
         DDB   $4444
         DDB   $4444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $1000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
         DDB   $0000
         DDB   $4000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $1144
         DDB   $1111
         DDB   $4000
         DDB   $FFFF
         DDB   $1FFF
         DDB   $4000
         DDB   $1FFF
         DDB   $1FFF
         DDB   $4000
         DDB   $114F
         DDB   $1F41
         DDB   $4000
         DDB   $FFFF
         DDB   $4FFF
         DDB   $4000
         DDB   $4444
         DDB   $4444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $1400
         DDB   $0001
LACD6    DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $4000
         DDB   $4111
         DDB   $5000
         DDB   $5515
         DDB   $5000
         DDB   $5515
         DDB   $0000
         DDB   $0000
         DDB   $4000
         DDB   $0444
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4400
         DDB   $4433
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $3440
         DDB   $2212
         DDB   $0004
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $3440
         DDB   $1112
         DDB   $4432
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4454
         DDB   $1223
         DDB   $5321
         DDB   $0045
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $5600
         DDB   $4555
         DDB   $2344
         DDB   $4211
         DDB   $0454
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $4560
         DDB   $5544
         DDB   $3445
         DDB   $2113
         DDB   $5553
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $3456
         DDB   $5333
         DDB   $4455
         DDB   $2234
         DDB   $5543
         DDB   $0005
         DDB   $0000
         DDB   $0000
         DDB   $3446
         DDB   $4333
         DDB   $5555
         DDB   $2344
         DDB   $4443
         DDB   $0005
         DDB   $0000
         DDB   $6000
         DDB   $4556
         DDB   $3333
         DDB   $5554
         DDB   $3445
         DDB   $3444
         DDB   $4444
         DDB   $0055
         DDB   $0000
         DDB   $4556
         DDB   $3334
         DDB   $5443
         DDB   $4555
         DDB   $2344
         DDB   $3332
         DDB   $0553
         DDB   $0000
         DDB   $4566
         DDB   $3344
         DDB   $4333
         DDB   $5545
         DDB   $2334
         DDB   $1111
         DDB   $5532
         DDB   $5000
         DDB   $4667
         DDB   $3455
         DDB   $4333
         DDB   $4444
         DDB   $3344
         DDB   $1112
         DDB   $5432
         DDB   $7600
         DDB   $6676
         DDB   $5544
         DDB   $4434
         DDB   $4345
         DDB   $3445
         DDB   $1123
         DDB   $5432
         DDB   $7600
         DDB   $6777
         DDB   $5456
         DDB   $5545
         DDB   $4534
         DDB   $4455
         DDB   $2234
         DDB   $0543
         DDB   $6760
         DDB   $6767
         DDB   $5566
         DDB   $5455
         DDB   $4444
         DDB   $5555
         DDB   $2344
         DDB   $0053
         DDB   $8770
         DDB   $6677
         DDB   $4556
         DDB   $5445
         DDB   $4354
         DDB   $6654
         DDB   $4445
         DDB   $0064
         DDB   $8860
         DDB   $6777
         DDB   $5565
         DDB   $5545
         DDB   $4555
         DDB   $6656
         DDB   $5556
         DDB   $0076
         DDB   $7770
         DDB   $6676
         DDB   $6556
         DDB   $4555
         DDB   $5446
         DDB   $6766
         DDB   $6666
         DDB   $0067
         DDB   $7860
         DDB   $6667
         DDB   $6665
         DDB   $6566
         DDB   $5655
         DDB   $6766
         DDB   $7776
         DDB   $0006
         DDB   $7670
         DDB   $7677
         DDB   $7566
         DDB   $6667
         DDB   $7766
         DDB   $7656
         DDB   $7777
         DDB   $0000
         DDB   $8760
         DDB   $6776
         DDB   $5666
         DDB   $6665
         DDB   $6655
         DDB   $7666
         DDB   $0077
         DDB   $0000
         DDB   $8760
         DDB   $7778
         DDB   $6676
         DDB   $5656
         DDB   $6566
         DDB   $7767
         DDB   $0006
         DDB   $0000
         DDB   $7600
         DDB   $7878
         DDB   $6777
         DDB   $6666
         DDB   $7665
         DDB   $7676
         DDB   $0006
         DDB   $0000
         DDB   $0000
         DDB   $8787
         DDB   $7777
         DDB   $7677
         DDB   $6676
         DDB   $8777
         DDB   $0007
         DDB   $0000
         DDB   $0000
         DDB   $8880
         DDB   $7788
         DDB   $7767
         DDB   $7677
         DDB   $8677
         DDB   $0007
         DDB   $0000
         DDB   $0000
         DDB   $8860
         DDB   $7888
         DDB   $7777
         DDB   $8877
         DDB   $7878
         DDB   $0007
         DDB   $0000
         DDB   $0000
         DDB   $7000
         DDB   $6687
         DDB   $8888
         DDB   $8888
         DDB   $7888
         DDB   $0006
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $7700
         DDB   $8888
         DDB   $6678
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $0000
         DDB   $6000
         DDB   $7787
         DDB   $0666
         DDB   $0000
         DDB   $0000

LB1AE    DW    $6C7C
         DW    $3FB7
         DW    $C59D
         DW    $BF9E
         DW    $7EF4
         DW    $FBC0
         DW    $BB8B
         DW    $E305
         DW    $22A0
         DW    $463A
         DW    $5327
         DW    $6004
         DW    $1B9F
         DW    $0651
         DW    $D00C
         DW    $62B7
         DW    $681F
         DW    $A3F3
         DW    $F933
         DW    $7479
         DW    $A70A
         DW    $C6D8
         DW    $175F
         DW    $6675
         DW    $C9C0
         DW    $4F5E
         DW    $D0B3
         DW    $31A0
         DW    $1EEB
         DW    $B344
         DW    $BB0C
         DW    $607C
         DW    $56FF
         DW    $59D0
         DW    $D195
         DW    $26B7
         DW    $8B26
         DW    $941F
         DW    $3257
         DW    $20F1
         DW    $D169
         DW    $10B0
         DW    $388D
         DW    $DA11
         DW    $65A1
         DW    $15D7
         DW    $F75A
         DW    $3FE9
         DW    $1F06
         DW    $A3F0
         DW    $C565
         DW    $4607
         DW    $7ECE
         DW    $6909
         DW    $60DF
         DW    $BBDF
         DW    $F92D
         DW    $21B8
         DW    $8B16
         DW    $A64A
         DW    $9C68
         DW    $FB6B
         DW    $FD3D
         DW    $7244
         DW    $5C9D
         DW    $4719
         DW    $F839
         DW    $AD6A
         DW    $1711
         DW    $3198
         DW    $268C
         DW    $2C3F
         DW    $152E
         DW    $EF53
         DW    $20A4
         DW    $A5A6
         DW    $A8B5
         DW    $D28F
         DW    $EA07
         DW    $9347
         DW    $4B4A
         DW    $A76F
         DW    $C6E2
         DW    $F2A3
         DW    $0C7E
         DW    $6ABA
         DW    $9977
         DW    $A717
         DW    $D6C0
         DW    $3AD1
         DW    $DD03
         DW    $7015
         DW    $0429
         DW    $F8E3
         DW    $EFDA
         DW    $5943
         DW    $18C8
         DW    $2411
         DW    $23AA
         DW    $139B
         DW    $5191
         DW    $08C2
         DW    $0833
         DW    $FB9C
         DW    $B5FE
         DW    $18BC
         DW    $1BDA
         DW    $1960
         DW    $85B6
         DW    $7AF9
         DW    $4EE4
         DW    $5C46
         DW    $C7F0
         DW    $3253
         DW    $A576
         DW    $00AF
         DW    $4B94
         DW    $0700
         DW    $B016
         DW    $07B2
         DW    $3787
         DW    $B82C
         DW    $BD5A
         DW    $26D5
         DW    $782D
         DW    $DB1B
         DW    $BB6C
         DW    $9235
         DW    $2448
         DW    $1B2E
         DW    $D62E
         DW    $CC7D
         DW    $55E8
         DW    $9DB5
         DW    $0D30
         DW    $1CB0
         DW    $E15F
         DW    $5AC7
         DW    $732B
         DW    $5CC6
         DW    $A829
         DW    $1B86
         DW    $E448
         DW    $E3A5
         DW    $6B6B
         DW    $4E7A
         DW    $CE64
         DW    $9890
         DW    $3240
         DW    $C93D
         DW    $8193
         DW    $6506
         DW    $E6E0
         DW    $8751
         DW    $6549
         DW    $7442
         DW    $B0AD
         DW    $28C1
         DW    $768E
         DW    $6CDB
         DW    $176A
         DW    $26BC
         DW    $75D7
         DW    $0516
         DW    $3927
         DW    $596E
         DW    $219D
         DW    $CD76
         DW    $3F2C
         DW    $BF03
         DW    $D5D0
         DW    $4B60
         DW    $A027
         DW    $970F
         DW    $B5FA
         DW    $B71F
         DW    $B5A5
         DW    $B5E2
         DW    $789A
         DW    $12CD
         DW    $5EF4
         DW    $0C9D
         DW    $F192
         DW    $9660
         DW    $E238
         DW    $1E76
         DW    $B288
         DW    $CF1B
         DW    $870B
         DW    $4ACD
         DW    $4904
         DW    $9486
         DW    $34AA
         DW    $E664
         DW    $8071
         DW    $D8A3
         DW    $5ABD
         DW    $47BD
         DW    $773B
         DW    $2514
         DW    $D960
         DW    $4BE8
         DW    $2505
         DW    $091F
         DW    $FA54
         DW    $0CF9
         DW    $35F7
         DW    $E7B4
         DW    $89F5
         DW    $49DF
         DW    $8331
         DW    $CA7B
         DW    $A851
         DW    $2CD3
         DW    $6115
         DW    $8569
         DW    $C445
         DW    $3E8F
         DW    $8DF0
         DW    $1F76
         DW    $ABC5
         DW    $127C
         DW    $7C10
         DW    $2282
         DW    $8A1F
         DW    $16C1
         DW    $DF86
         DW    $8E36
         DW    $8BEF
         DW    $0EC8
         DW    $8493
         DW    $617B
         DW    $B054
         DW    $8292
         DW    $BEE7
         DW    $1974
         DW    $96E3
         DW    $FC1C
         DW    $5691
         DW    $1D31
         DW    $E73D
         DW    $7F32
         DW    $51E2
         DW    $83FB
         DW    $4361
         DW    $EE0A
         DW    $ACD4
         DW    $8304
         DW    $07A9
         DW    $CE81
         DW    $7F5D
         DW    $D0E2
         DW    $9377
         DW    $F1A2
         DW    $478D
         DW    $A5D7
LB3AE    DDB   $027F
         DDB   $027F
         DDB   $027F
         DDB   $027F
         DDB   $027E
         DDB   $027E
         DDB   $027D
         DDB   $027D
         DDB   $027C
         DDB   $027B
         DDB   $027A
         DDB   $0279
         DDB   $0278
         DDB   $0277
         DDB   $0276
         DDB   $0274
         DDB   $0273
         DDB   $0271
         DDB   $026F
         DDB   $026E
         DDB   $026C
         DDB   $026A
         DDB   $0268
         DDB   $0266
         DDB   $0263
         DDB   $0261
         DDB   $025F
         DDB   $025C
         DDB   $025A
         DDB   $0257
         DDB   $0254
         DDB   $0251
         DDB   $024F
         DDB   $024C
         DDB   $0248
         DDB   $0245
         DDB   $0242
         DDB   $023F
         DDB   $023B
         DDB   $0238
         DDB   $0234
         DDB   $0231
         DDB   $022D
         DDB   $0229
         DDB   $0225
         DDB   $0222
         DDB   $021E
         DDB   $021A
         DDB   $0215
         DDB   $0211
         DDB   $020D
         DDB   $0209
         DDB   $0204
         DDB   $0200
         DDB   $01FC
         DDB   $01F7
         DDB   $01F2
         DDB   $01EE
         DDB   $01E9
         DDB   $01E4
         DDB   $01DF
         DDB   $01DB
         DDB   $01D6
         DDB   $01D1
         DDB   $01CC
         DDB   $01C7
         DDB   $01C2
         DDB   $01BD
         DDB   $01B7
         DDB   $01B2
         DDB   $01AD
         DDB   $01A8
         DDB   $01A3
         DDB   $019D
         DDB   $0198
         DDB   $0193
         DDB   $018D
         DDB   $0188
         DDB   $0182
         DDB   $017D
         DDB   $0177
         DDB   $0172
         DDB   $016C
         DDB   $0167
         DDB   $0161
         DDB   $015C
         DDB   $0156
         DDB   $0151
         DDB   $014B
         DDB   $0146
         DDB   $0140
         DDB   $013A
         DDB   $0135
         DDB   $012F
         DDB   $012A
         DDB   $0124
         DDB   $011F
         DDB   $0119
         DDB   $0114
         DDB   $010E
         DDB   $0109
         DDB   $0103
         DDB   $00FE
         DDB   $00F8
         DDB   $00F3
         DDB   $00ED
         DDB   $00E8
         DDB   $00E3
         DDB   $00DD
         DDB   $00D8
         DDB   $00D3
         DDB   $00CE
         DDB   $00C9
         DDB   $00C3
         DDB   $00BE
         DDB   $00B9
         DDB   $00B4
         DDB   $00AF
         DDB   $00AA
         DDB   $00A5
         DDB   $00A0
         DDB   $009C
         DDB   $0097
         DDB   $0092
         DDB   $008E
         DDB   $0089
         DDB   $0084
         DDB   $0080
         DDB   $007C
         DDB   $0077
         DDB   $0073
         DDB   $006F
         DDB   $006B
         DDB   $0066
         DDB   $0062
         DDB   $005E
         DDB   $005B
         DDB   $0057
         DDB   $0053
         DDB   $004F
         DDB   $004C
         DDB   $0048
         DDB   $0045
         DDB   $0041
         DDB   $003E
         DDB   $003B
         DDB   $0038
         DDB   $0034
         DDB   $0031
         DDB   $002F
         DDB   $002C
         DDB   $0029
         DDB   $0026
         DDB   $0024
         DDB   $0021
         DDB   $001F
         DDB   $001D
         DDB   $001A
         DDB   $0018
         DDB   $0016
         DDB   $0014
         DDB   $0012
         DDB   $0011
         DDB   $000F
         DDB   $000D
         DDB   $000C
         DDB   $000A
         DDB   $0009
         DDB   $0008
         DDB   $0007
         DDB   $0006
         DDB   $0005
         DDB   $0004
         DDB   $0003
         DDB   $0003
         DDB   $0002
         DDB   $0002
         DDB   $0001
         DDB   $0001
         DDB   $0001
         DDB   $0001
         DDB   $0001
         DDB   $0001
         DDB   $0001
         DDB   $0002
         DDB   $0002
         DDB   $0003
         DDB   $0003
         DDB   $0004
         DDB   $0005
         DDB   $0006
         DDB   $0007
         DDB   $0008
         DDB   $0009
         DDB   $000A
         DDB   $000C
         DDB   $000D
         DDB   $000F
         DDB   $0011
         DDB   $0012
         DDB   $0014
         DDB   $0016
         DDB   $0018
         DDB   $001A
         DDB   $001D
         DDB   $001F
         DDB   $0021
         DDB   $0024
         DDB   $0026
         DDB   $0029
         DDB   $002C
         DDB   $002F
         DDB   $0031
         DDB   $0034
         DDB   $0038
         DDB   $003B
         DDB   $003E
         DDB   $0041
         DDB   $0045
         DDB   $0048
         DDB   $004C
         DDB   $004F
         DDB   $0053
         DDB   $0057
         DDB   $005B
         DDB   $005E
         DDB   $0062
         DDB   $0066
         DDB   $006B
         DDB   $006F
         DDB   $0073
         DDB   $0077
         DDB   $007C
         DDB   $0080
         DDB   $0084
         DDB   $0089
         DDB   $008E
         DDB   $0092
         DDB   $0097
         DDB   $009C
         DDB   $00A0
         DDB   $00A5
         DDB   $00AA
         DDB   $00AF
         DDB   $00B4
         DDB   $00B9
         DDB   $00BE
         DDB   $00C3
         DDB   $00C8
         DDB   $00CE
         DDB   $00D3
         DDB   $00D8
         DDB   $00DD
         DDB   $00E3
         DDB   $00E8
         DDB   $00ED
         DDB   $00F3
         DDB   $00F8
         DDB   $00FE
         DDB   $0103
         DDB   $0109
         DDB   $010E
         DDB   $0114
         DDB   $0119
         DDB   $011F
         DDB   $0124
         DDB   $012A
         DDB   $012F
         DDB   $0135
         DDB   $013A
         DDB   $0140
         DDB   $0146
         DDB   $014B
         DDB   $0151
         DDB   $0156
         DDB   $015C
         DDB   $0161
         DDB   $0167
         DDB   $016C
         DDB   $0172
         DDB   $0177
         DDB   $017D
         DDB   $0182
         DDB   $0188
         DDB   $018D
         DDB   $0193
         DDB   $0198
         DDB   $019D
         DDB   $01A3
         DDB   $01A8
         DDB   $01AD
         DDB   $01B2
         DDB   $01B7
         DDB   $01BD
         DDB   $01C2
         DDB   $01C7
         DDB   $01CC
         DDB   $01D1
         DDB   $01D6
         DDB   $01DB
         DDB   $01DF
         DDB   $01E4
         DDB   $01E9
         DDB   $01EE
         DDB   $01F2
         DDB   $01F7
         DDB   $01FB
         DDB   $0200
         DDB   $0204
         DDB   $0209
         DDB   $020D
         DDB   $0211
         DDB   $0215
         DDB   $021A
         DDB   $021E
         DDB   $0222
         DDB   $0225
         DDB   $0229
         DDB   $022D
         DDB   $0231
         DDB   $0234
         DDB   $0238
         DDB   $023B
         DDB   $023F
         DDB   $0242
         DDB   $0245
         DDB   $0248
         DDB   $024C
         DDB   $024F
         DDB   $0251
         DDB   $0254
         DDB   $0257
         DDB   $025A
         DDB   $025C
         DDB   $025F
         DDB   $0261
         DDB   $0263
         DDB   $0266
         DDB   $0268
         DDB   $026A
         DDB   $026C
         DDB   $026E
         DDB   $026F
         DDB   $0271
         DDB   $0273
         DDB   $0274
         DDB   $0276
         DDB   $0277
         DDB   $0278
         DDB   $0279
         DDB   $027A
         DDB   $027B
         DDB   $027C
         DDB   $027D
         DDB   $027D
         DDB   $027E
         DDB   $027E
         DDB   $027F
         DDB   $027F
         DDB   $027F
         DDB   $027F
LB680    HEX   200044444444
         HEX   100044424444
         HEX   100044214444
         HEX   000044424444
         HEX   200044444444
         HEX   420044444444
         HEX   442044444424
         HEX   442044444212
         HEX   421124442110
         HEX   211002440100
         HEX   110000220000
         HEX   100000010000
         HEX   000020000002 ; +48
         HEX   000042000024
         HEX   002044200244
         HEX   024144422444
         HEX   244144444444
         HEX   444144441444
         HEX   444144440144
         HEX   444144440014
         HEX   444124440001
         HEX   444144440002
         HEX   444144440024
         HEX   111111110001

LB710    SEP   #$20
LB712    LDAL  $E1C019
         BMI   LB712
LB718    LDAL  $E1C019
         BPL   LB718
         REP   #$20
         RTS

LB721    LDX   #$000F
         STX   $22
         ASL
         ASL
         ASL
         ASL
         ASL
         ADC   #$001E
         STA   LB739+1
         PEA   $E1E1
         PLB
         PLB
LB736    JSR   LB710
LB739    LDX   #$001E
LB73C    LDY   $9E00,X
         TYA
         EORL  $019E00,X
         STA   $10
         CLC
         BIT   #$0F00
         BEQ   LB753
         TYA
         ADC   #$0100
         TAY
         LDA   $10
LB753    BIT   #$00F0
         BEQ   LB75F
         TYA
         ADC   #$0010
         TAY
         LDA   $10
LB75F    BIT   #$000F
         BEQ   LB765
         INY
LB765    TYA
         STA   $9E00,X
         DEX
         DEX
         BPL   LB73C
         LDX   #$4000
LB770    DEX
         BNE   LB770
         DEC   $22
         BPL   LB736
         PHK
         PLB
         RTS

LB77A    PHB
         PHD
         PHK
         PLB
         SEP   #$20
         LDAL  $E1C083
         LDAL  $E1C083
         REP   #$20
         JSR   LB710
         BIT   LB7C6
         BMI   LB7B3
         SEC
         ROR   LB7C6
         SEP   #$20
         LDX   #$0151
LB79B    LDA   LB7C8,X
         TAY
         LDAL  ptr00D000,X
         STA   LB7C8,X
         TYA
         STAL  ptr00D000,X
         DEX
         BPL   LB79B
         REP   #$20
         JSR   LB710
LB7B3    JSL   ptr00D000
         SEP   #$20
         LDAL  $E1C081
         LDAL  $E1C081
         REP   #$20
         PLD
         PLB
         RTS

LB7C6    DW    $0000

LB7C8    SEP   #$20
         PHB
         LDA   #$00
         PHA
         PLB
         LDAL  $E1C035
         AND   #$F7
         STAL  $E1C035
         LDAL  $E1C068
         ORA   #$30
         STAL  $E1C068
         PLB
         REP   #$20
         LDX   #$007D
         LDA   #$2000
LB7EC    TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         CLC
         ADC   #$0100
         DEX
         BEQ   LB8FB
         BRL   LB7EC
LB8FB    SEP   #$20
         PHB
         LDA   #$00
         PHA
         PLB
         LDAL  $E1C035
         ORA   #$08
         STAL  $E1C035
         LDAL  $E1C068
         AND   #$CF
         STAL  $E1C068
         PLB
         REP   #$20
         RTL

LB91A    PHD
         PHB
         LDA   $28
         SEC
         SBC   $F0
         TAX
         PEA   $0303
         PLB
         PLB
         LDA   #$2500
         TCD
         CLC
         LDY   #$0017
LB92F    LDA   |$0000,X
         STA   $14
         LDA   |$0002,X
         STA   $16
         LDA   |$0004,X
         STA   $18
         LDA   |$0006,X
         STA   $1A
         LDA   |$0008,X
         STA   $1C
         LDA   |$000A,X
         STA   $1E
         LDA   |$000C,X
         STA   $20
         LDA   |$000E,X
         STA   $22
         LDA   |$0010,X
         STA   $24
         LDA   |$0012,X
         STA   $26
         LDA   |$0014,X
         STA   $28
         LDA   |$0016,X
         STA   $2A
         LDA   |$0018,X
         STA   $2C
         LDA   |$001A,X
         STA   $2E
         LDA   |$001C,X
         STA   $30
         LDA   |$001E,X
         STA   $32
         LDA   |$0020,X
         STA   $34
         LDA   |$0022,X
         STA   $36
         LDA   |$0024,X
         STA   $38
         LDA   |$0026,X
         STA   $3A
         LDA   |$0028,X
         STA   $3C
         LDA   |$002A,X
         STA   $3E
         LDA   |$002C,X
         STA   $40
         LDA   |$002E,X
         STA   $42
         LDA   |$0030,X
         STA   $44
         LDA   |$0032,X
         STA   $46
         LDA   |$0034,X
         STA   $48
         LDA   |$0036,X
         STA   $4A
         LDA   |$0038,X
         STA   $4C
         LDA   |$003A,X
         STA   $4E
         LDA   |$003C,X
         STA   $50
         LDA   |$003E,X
         STA   $52
         LDA   |$0040,X
         STA   $54
         LDA   |$0042,X
         STA   $56
         LDA   |$0044,X
         STA   $58
         LDA   |$0046,X
         STA   $5A
         LDA   |$0048,X
         STA   $5C
         LDA   |$004A,X
         STA   $5E
         LDA   |$004C,X
         STA   $60
         LDA   |$004E,X
         STA   $62
         LDA   |$0050,X
         STA   $64
         LDA   |$0052,X
         STA   $66
         LDA   |$0054,X
         STA   $68
         LDA   |$0056,X
         STA   $6A
         LDA   |$0058,X
         STA   $6C
         LDA   |$005A,X
         STA   $6E
         LDA   |$005C,X
         STA   $70
         LDA   |$005E,X
         STA   $72
         LDA   |$0060,X
         STA   $74
         LDA   |$0062,X
         STA   $76
         LDA   |$0064,X
         STA   $78
         LDA   |$0066,X
         STA   $7A
         LDA   |$0068,X
         STA   $7C
         LDA   |$006A,X
         STA   $7E
         LDA   |$006C,X
         STA   $80
         LDA   |$006E,X
         STA   $82
         LDA   |$0070,X
         STA   $84
         LDA   |$0072,X
         STA   $86
         LDA   |$0074,X
         STA   $88
         LDA   |$0076,X
         STA   $8A
         LDA   |$0078,X
         STA   $8C
         LDA   |$007A,X
         STA   $8E
         LDA   |$007C,X
         STA   $90
         LDA   |$007E,X
         STA   $92
         LDA   |$0080,X
         STA   $94
         LDA   |$0082,X
         STA   $96
         LDA   |$0084,X
         STA   $98
         LDA   |$0086,X
         STA   $9A
         LDA   $0140,X
         STA   $B4
         LDA   $0142,X
         STA   $B6
         LDA   $0144,X
         STA   $B8
         LDA   $0146,X
         STA   $BA
         LDA   $0148,X
         STA   $BC
         LDA   $014A,X
         STA   $BE
         LDA   $014C,X
         STA   $C0
         LDA   $014E,X
         STA   $C2
         LDA   $0150,X
         STA   $C4
         LDA   $0152,X
         STA   $C6
         LDA   $0154,X
         STA   $C8
         LDA   $0156,X
         STA   $CA
         LDA   $0158,X
         STA   $CC
         LDA   $015A,X
         STA   $CE
         LDA   $015C,X
         STA   $D0
         LDA   $015E,X
         STA   $D2
         LDA   $0160,X
         STA   $D4
         LDA   $0162,X
         STA   $D6
         LDA   $0164,X
         STA   $D8
         LDA   $0166,X
         STA   $DA
         LDA   $0168,X
         STA   $DC
         LDA   $016A,X
         STA   $DE
         LDA   $016C,X
         STA   $E0
         LDA   $016E,X
         STA   $E2
         LDA   $0170,X
         STA   $E4
         LDA   $0172,X
         STA   $E6
         LDA   $0174,X
         STA   $E8
         LDA   $0176,X
         STA   $EA
         LDA   $0178,X
         STA   $EC
         LDA   $017A,X
         STA   $EE
         LDA   $017C,X
         STA   $F0
         LDA   $017E,X
         STA   $F2
         LDA   $0180,X
         STA   $F4
         LDA   $0182,X
         STA   $F6
         LDA   $0184,X
         STA   $F8
         LDA   $0186,X
         STA   $FA
         LDA   $0188,X
         STA   $FC
         LDA   $018A,X
         STA   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   $018C,X
         STA   $00
         LDA   $018E,X
         STA   $02
         LDA   $0190,X
         STA   $04
         LDA   $0192,X
         STA   $06
         LDA   $0194,X
         STA   $08
         LDA   $0196,X
         STA   $0A
         LDA   $0198,X
         STA   $0C
         LDA   $019A,X
         STA   $0E
         LDA   $019C,X
         STA   $10
         LDA   $019E,X
         STA   $12
         LDA   $01A0,X
         STA   $14
         LDA   $01A2,X
         STA   $16
         LDA   $01A4,X
         STA   $18
         LDA   $01A6,X
         STA   $1A
         LDA   $01A8,X
         STA   $1C
         LDA   $01AA,X
         STA   $1E
         LDA   $01AC,X
         STA   $20
         LDA   $01AE,X
         STA   $22
         LDA   $01B0,X
         STA   $24
         LDA   $01B2,X
         STA   $26
         LDA   $01B4,X
         STA   $28
         LDA   $01B6,X
         STA   $2A
         LDA   $01B8,X
         STA   $2C
         LDA   $01BA,X
         STA   $2E
         LDA   $01BC,X
         STA   $30
         LDA   $01BE,X
         STA   $32
         LDA   $01C0,X
         STA   $34
         LDA   $01C2,X
         STA   $36
         LDA   $01C4,X
         STA   $38
         LDA   $01C6,X
         STA   $3A
         LDA   $0280,X
         STA   $54
         LDA   $0282,X
         STA   $56
         LDA   $0284,X
         STA   $58
         LDA   $0286,X
         STA   $5A
         LDA   $0288,X
         STA   $5C
         LDA   $028A,X
         STA   $5E
         LDA   $028C,X
         STA   $60
         LDA   $028E,X
         STA   $62
         LDA   $0290,X
         STA   $64
         LDA   $0292,X
         STA   $66
         LDA   $0294,X
         STA   $68
         LDA   $0296,X
         STA   $6A
         LDA   $0298,X
         STA   $6C
         LDA   $029A,X
         STA   $6E
         LDA   $029C,X
         STA   $70
         LDA   $029E,X
         STA   $72
         LDA   $02A0,X
         STA   $74
         LDA   $02A2,X
         STA   $76
         LDA   $02A4,X
         STA   $78
         LDA   $02A6,X
         STA   $7A
         LDA   $02A8,X
         STA   $7C
         LDA   $02AA,X
         STA   $7E
         LDA   $02AC,X
         STA   $80
         LDA   $02AE,X
         STA   $82
         LDA   $02B0,X
         STA   $84
         LDA   $02B2,X
         STA   $86
         LDA   $02B4,X
         STA   $88
         LDA   $02B6,X
         STA   $8A
         LDA   $02B8,X
         STA   $8C
         LDA   $02BA,X
         STA   $8E
         LDA   $02BC,X
         STA   $90
         LDA   $02BE,X
         STA   $92
         LDA   $02C0,X
         STA   $94
         LDA   $02C2,X
         STA   $96
         LDA   $02C4,X
         STA   $98
         LDA   $02C6,X
         STA   $9A
         LDA   $02C8,X
         STA   $9C
         LDA   $02CA,X
         STA   $9E
         LDA   $02CC,X
         STA   $A0
         LDA   $02CE,X
         STA   $A2
         LDA   $02D0,X
         STA   $A4
         LDA   $02D2,X
         STA   $A6
         LDA   $02D4,X
         STA   $A8
         LDA   $02D6,X
         STA   $AA
         LDA   $02D8,X
         STA   $AC
         LDA   $02DA,X
         STA   $AE
         LDA   $02DC,X
         STA   $B0
         LDA   $02DE,X
         STA   $B2
         LDA   $02E0,X
         STA   $B4
         LDA   $02E2,X
         STA   $B6
         LDA   $02E4,X
         STA   $B8
         LDA   $02E6,X
         STA   $BA
         LDA   $02E8,X
         STA   $BC
         LDA   $02EA,X
         STA   $BE
         LDA   $02EC,X
         STA   $C0
         LDA   $02EE,X
         STA   $C2
         LDA   $02F0,X
         STA   $C4
         LDA   $02F2,X
         STA   $C6
         LDA   $02F4,X
         STA   $C8
         LDA   $02F6,X
         STA   $CA
         LDA   $02F8,X
         STA   $CC
         LDA   $02FA,X
         STA   $CE
         LDA   $02FC,X
         STA   $D0
         LDA   $02FE,X
         STA   $D2
         LDA   $0300,X
         STA   $D4
         LDA   $0302,X
         STA   $D6
         LDA   $0304,X
         STA   $D8
         LDA   $0306,X
         STA   $DA
         LDA   $03C0,X
         STA   $F4
         LDA   $03C2,X
         STA   $F6
         LDA   $03C4,X
         STA   $F8
         LDA   $03C6,X
         STA   $FA
         LDA   $03C8,X
         STA   $FC
         LDA   $03CA,X
         STA   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   $03CC,X
         STA   $00
         LDA   $03CE,X
         STA   $02
         LDA   $03D0,X
         STA   $04
         LDA   $03D2,X
         STA   $06
         LDA   $03D4,X
         STA   $08
         LDA   $03D6,X
         STA   $0A
         LDA   $03D8,X
         STA   $0C
         LDA   $03DA,X
         STA   $0E
         LDA   $03DC,X
         STA   $10
         LDA   $03DE,X
         STA   $12
         LDA   $03E0,X
         STA   $14
         LDA   $03E2,X
         STA   $16
         LDA   $03E4,X
         STA   $18
         LDA   $03E6,X
         STA   $1A
         LDA   $03E8,X
         STA   $1C
         LDA   $03EA,X
         STA   $1E
         LDA   $03EC,X
         STA   $20
         LDA   $03EE,X
         STA   $22
         LDA   $03F0,X
         STA   $24
         LDA   $03F2,X
         STA   $26
         LDA   $03F4,X
         STA   $28
         LDA   $03F6,X
         STA   $2A
         LDA   $03F8,X
         STA   $2C
         LDA   $03FA,X
         STA   $2E
         LDA   $03FC,X
         STA   $30
         LDA   $03FE,X
         STA   $32
         LDA   $0400,X
         STA   $34
         LDA   $0402,X
         STA   $36
         LDA   $0404,X
         STA   $38
         LDA   $0406,X
         STA   $3A
         LDA   $0408,X
         STA   $3C
         LDA   $040A,X
         STA   $3E
         LDA   $040C,X
         STA   $40
         LDA   $040E,X
         STA   $42
         LDA   $0410,X
         STA   $44
         LDA   $0412,X
         STA   $46
         LDA   $0414,X
         STA   $48
         LDA   $0416,X
         STA   $4A
         LDA   $0418,X
         STA   $4C
         LDA   $041A,X
         STA   $4E
         LDA   $041C,X
         STA   $50
         LDA   $041E,X
         STA   $52
         LDA   $0420,X
         STA   $54
         LDA   $0422,X
         STA   $56
         LDA   $0424,X
         STA   $58
         LDA   $0426,X
         STA   $5A
         LDA   $0428,X
         STA   $5C
         LDA   $042A,X
         STA   $5E
         LDA   $042C,X
         STA   $60
         LDA   $042E,X
         STA   $62
         LDA   $0430,X
         STA   $64
         LDA   $0432,X
         STA   $66
         LDA   $0434,X
         STA   $68
         LDA   $0436,X
         STA   $6A
         LDA   $0438,X
         STA   $6C
         LDA   $043A,X
         STA   $6E
         LDA   $043C,X
         STA   $70
         LDA   $043E,X
         STA   $72
         LDA   $0440,X
         STA   $74
         LDA   $0442,X
         STA   $76
         LDA   $0444,X
         STA   $78
         LDA   $0446,X
         STA   $7A
         LDA   $0500,X
         STA   $94
         LDA   $0502,X
         STA   $96
         LDA   $0504,X
         STA   $98
         LDA   $0506,X
         STA   $9A
         LDA   $0508,X
         STA   $9C
         LDA   $050A,X
         STA   $9E
         LDA   $050C,X
         STA   $A0
         LDA   $050E,X
         STA   $A2
         LDA   $0510,X
         STA   $A4
         LDA   $0512,X
         STA   $A6
         LDA   $0514,X
         STA   $A8
         LDA   $0516,X
         STA   $AA
         LDA   $0518,X
         STA   $AC
         LDA   $051A,X
         STA   $AE
         LDA   $051C,X
         STA   $B0
         LDA   $051E,X
         STA   $B2
         LDA   $0520,X
         STA   $B4
         LDA   $0522,X
         STA   $B6
         LDA   $0524,X
         STA   $B8
         LDA   $0526,X
         STA   $BA
         LDA   $0528,X
         STA   $BC
         LDA   $052A,X
         STA   $BE
         LDA   $052C,X
         STA   $C0
         LDA   $052E,X
         STA   $C2
         LDA   $0530,X
         STA   $C4
         LDA   $0532,X
         STA   $C6
         LDA   $0534,X
         STA   $C8
         LDA   $0536,X
         STA   $CA
         LDA   $0538,X
         STA   $CC
         LDA   $053A,X
         STA   $CE
         LDA   $053C,X
         STA   $D0
         LDA   $053E,X
         STA   $D2
         LDA   $0540,X
         STA   $D4
         LDA   $0542,X
         STA   $D6
         LDA   $0544,X
         STA   $D8
         LDA   $0546,X
         STA   $DA
         LDA   $0548,X
         STA   $DC
         LDA   $054A,X
         STA   $DE
         LDA   $054C,X
         STA   $E0
         LDA   $054E,X
         STA   $E2
         LDA   $0550,X
         STA   $E4
         LDA   $0552,X
         STA   $E6
         LDA   $0554,X
         STA   $E8
         LDA   $0556,X
         STA   $EA
         LDA   $0558,X
         STA   $EC
         LDA   $055A,X
         STA   $EE
         LDA   $055C,X
         STA   $F0
         LDA   $055E,X
         STA   $F2
         LDA   $0560,X
         STA   $F4
         LDA   $0562,X
         STA   $F6
         LDA   $0564,X
         STA   $F8
         LDA   $0566,X
         STA   $FA
         LDA   $0568,X
         STA   $FC
         LDA   $056A,X
         STA   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   $056C,X
         STA   $00
         LDA   $056E,X
         STA   $02
         LDA   $0570,X
         STA   $04
         LDA   $0572,X
         STA   $06
         LDA   $0574,X
         STA   $08
         LDA   $0576,X
         STA   $0A
         LDA   $0578,X
         STA   $0C
         LDA   $057A,X
         STA   $0E
         LDA   $057C,X
         STA   $10
         LDA   $057E,X
         STA   $12
         LDA   $0580,X
         STA   $14
         LDA   $0582,X
         STA   $16
         LDA   $0584,X
         STA   $18
         LDA   $0586,X
         STA   $1A
         LDA   $0640,X
         STA   $34
         LDA   $0642,X
         STA   $36
         LDA   $0644,X
         STA   $38
         LDA   $0646,X
         STA   $3A
         LDA   $0648,X
         STA   $3C
         LDA   $064A,X
         STA   $3E
         LDA   $064C,X
         STA   $40
         LDA   $064E,X
         STA   $42
         LDA   $0650,X
         STA   $44
         LDA   $0652,X
         STA   $46
         LDA   $0654,X
         STA   $48
         LDA   $0656,X
         STA   $4A
         LDA   $0658,X
         STA   $4C
         LDA   $065A,X
         STA   $4E
         LDA   $065C,X
         STA   $50
         LDA   $065E,X
         STA   $52
         LDA   $0660,X
         STA   $54
         LDA   $0662,X
         STA   $56
         LDA   $0664,X
         STA   $58
         LDA   $0666,X
         STA   $5A
         LDA   $0668,X
         STA   $5C
         LDA   $066A,X
         STA   $5E
         LDA   $066C,X
         STA   $60
         LDA   $066E,X
         STA   $62
         LDA   $0670,X
         STA   $64
         LDA   $0672,X
         STA   $66
         LDA   $0674,X
         STA   $68
         LDA   $0676,X
         STA   $6A
         LDA   $0678,X
         STA   $6C
         LDA   $067A,X
         STA   $6E
         LDA   $067C,X
         STA   $70
         LDA   $067E,X
         STA   $72
         LDA   $0680,X
         STA   $74
         LDA   $0682,X
         STA   $76
         LDA   $0684,X
         STA   $78
         LDA   $0686,X
         STA   $7A
         LDA   $0688,X
         STA   $7C
         LDA   $068A,X
         STA   $7E
         LDA   $068C,X
         STA   $80
         LDA   $068E,X
         STA   $82
         LDA   $0690,X
         STA   $84
         LDA   $0692,X
         STA   $86
         LDA   $0694,X
         STA   $88
         LDA   $0696,X
         STA   $8A
         LDA   $0698,X
         STA   $8C
         LDA   $069A,X
         STA   $8E
         LDA   $069C,X
         STA   $90
         LDA   $069E,X
         STA   $92
         LDA   $06A0,X
         STA   $94
         LDA   $06A2,X
         STA   $96
         LDA   $06A4,X
         STA   $98
         LDA   $06A6,X
         STA   $9A
         LDA   $06A8,X
         STA   $9C
         LDA   $06AA,X
         STA   $9E
         LDA   $06AC,X
         STA   $A0
         LDA   $06AE,X
         STA   $A2
         LDA   $06B0,X
         STA   $A4
         LDA   $06B2,X
         STA   $A6
         LDA   $06B4,X
         STA   $A8
         LDA   $06B6,X
         STA   $AA
         LDA   $06B8,X
         STA   $AC
         LDA   $06BA,X
         STA   $AE
         LDA   $06BC,X
         STA   $B0
         LDA   $06BE,X
         STA   $B2
         LDA   $06C0,X
         STA   $B4
         LDA   $06C2,X
         STA   $B6
         LDA   $06C4,X
         STA   $B8
         LDA   $06C6,X
         STA   $BA
         LDA   $0780,X
         STA   $D4
         LDA   $0782,X
         STA   $D6
         LDA   $0784,X
         STA   $D8
         LDA   $0786,X
         STA   $DA
         LDA   $0788,X
         STA   $DC
         LDA   $078A,X
         STA   $DE
         LDA   $078C,X
         STA   $E0
         LDA   $078E,X
         STA   $E2
         LDA   $0790,X
         STA   $E4
         LDA   $0792,X
         STA   $E6
         LDA   $0794,X
         STA   $E8
         LDA   $0796,X
         STA   $EA
         LDA   $0798,X
         STA   $EC
         LDA   $079A,X
         STA   $EE
         LDA   $079C,X
         STA   $F0
         LDA   $079E,X
         STA   $F2
         LDA   $07A0,X
         STA   $F4
         LDA   $07A2,X
         STA   $F6
         LDA   $07A4,X
         STA   $F8
         LDA   $07A6,X
         STA   $FA
         LDA   $07A8,X
         STA   $FC
         LDA   $07AA,X
         STA   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   $07AC,X
         STA   $00
         LDA   $07AE,X
         STA   $02
         LDA   $07B0,X
         STA   $04
         LDA   $07B2,X
         STA   $06
         LDA   $07B4,X
         STA   $08
         LDA   $07B6,X
         STA   $0A
         LDA   $07B8,X
         STA   $0C
         LDA   $07BA,X
         STA   $0E
         LDA   $07BC,X
         STA   $10
         LDA   $07BE,X
         STA   $12
         LDA   $07C0,X
         STA   $14
         LDA   $07C2,X
         STA   $16
         LDA   $07C4,X
         STA   $18
         LDA   $07C6,X
         STA   $1A
         LDA   $07C8,X
         STA   $1C
         LDA   $07CA,X
         STA   $1E
         LDA   $07CC,X
         STA   $20
         LDA   $07CE,X
         STA   $22
         LDA   $07D0,X
         STA   $24
         LDA   $07D2,X
         STA   $26
         LDA   $07D4,X
         STA   $28
         LDA   $07D6,X
         STA   $2A
         LDA   $07D8,X
         STA   $2C
         LDA   $07DA,X
         STA   $2E
         LDA   $07DC,X
         STA   $30
         LDA   $07DE,X
         STA   $32
         LDA   $07E0,X
         STA   $34
         LDA   $07E2,X
         STA   $36
         LDA   $07E4,X
         STA   $38
         LDA   $07E6,X
         STA   $3A
         LDA   $07E8,X
         STA   $3C
         LDA   $07EA,X
         STA   $3E
         LDA   $07EC,X
         STA   $40
         LDA   $07EE,X
         STA   $42
         LDA   $07F0,X
         STA   $44
         LDA   $07F2,X
         STA   $46
         LDA   $07F4,X
         STA   $48
         LDA   $07F6,X
         STA   $4A
         LDA   $07F8,X
         STA   $4C
         LDA   $07FA,X
         STA   $4E
         LDA   $07FC,X
         STA   $50
         LDA   $07FE,X
         STA   $52
         LDA   $0800,X
         STA   $54
         LDA   $0802,X
         STA   $56
         LDA   $0804,X
         STA   $58
         LDA   $0806,X
         STA   $5A
         LDA   $08C0,X
         STA   $74
         LDA   $08C2,X
         STA   $76
         LDA   $08C4,X
         STA   $78
         LDA   $08C6,X
         STA   $7A
         LDA   $08C8,X
         STA   $7C
         LDA   $08CA,X
         STA   $7E
         LDA   $08CC,X
         STA   $80
         LDA   $08CE,X
         STA   $82
         LDA   $08D0,X
         STA   $84
         LDA   $08D2,X
         STA   $86
         LDA   $08D4,X
         STA   $88
         LDA   $08D6,X
         STA   $8A
         LDA   $08D8,X
         STA   $8C
         LDA   $08DA,X
         STA   $8E
         LDA   $08DC,X
         STA   $90
         LDA   $08DE,X
         STA   $92
         LDA   $08E0,X
         STA   $94
         LDA   $08E2,X
         STA   $96
         LDA   $08E4,X
         STA   $98
         LDA   $08E6,X
         STA   $9A
         LDA   $08E8,X
         STA   $9C
         LDA   $08EA,X
         STA   $9E
         LDA   $08EC,X
         STA   $A0
         LDA   $08EE,X
         STA   $A2
         LDA   $08F0,X
         STA   $A4
         LDA   $08F2,X
         STA   $A6
         LDA   $08F4,X
         STA   $A8
         LDA   $08F6,X
         STA   $AA
         LDA   $08F8,X
         STA   $AC
         LDA   $08FA,X
         STA   $AE
         LDA   $08FC,X
         STA   $B0
         LDA   $08FE,X
         STA   $B2
         LDA   $0900,X
         STA   $B4
         LDA   $0902,X
         STA   $B6
         LDA   $0904,X
         STA   $B8
         LDA   $0906,X
         STA   $BA
         LDA   $0908,X
         STA   $BC
         LDA   $090A,X
         STA   $BE
         LDA   $090C,X
         STA   $C0
         LDA   $090E,X
         STA   $C2
         LDA   $0910,X
         STA   $C4
         LDA   $0912,X
         STA   $C6
         LDA   $0914,X
         STA   $C8
         LDA   $0916,X
         STA   $CA
         LDA   $0918,X
         STA   $CC
         LDA   $091A,X
         STA   $CE
         LDA   $091C,X
         STA   $D0
         LDA   $091E,X
         STA   $D2
         LDA   $0920,X
         STA   $D4
         LDA   $0922,X
         STA   $D6
         LDA   $0924,X
         STA   $D8
         LDA   $0926,X
         STA   $DA
         LDA   $0928,X
         STA   $DC
         LDA   $092A,X
         STA   $DE
         LDA   $092C,X
         STA   $E0
         LDA   $092E,X
         STA   $E2
         LDA   $0930,X
         STA   $E4
         LDA   $0932,X
         STA   $E6
         LDA   $0934,X
         STA   $E8
         LDA   $0936,X
         STA   $EA
         LDA   $0938,X
         STA   $EC
         LDA   $093A,X
         STA   $EE
         LDA   $093C,X
         STA   $F0
         LDA   $093E,X
         STA   $F2
         LDA   $0940,X
         STA   $F4
         LDA   $0942,X
         STA   $F6
         LDA   $0944,X
         STA   $F8
         LDA   $0946,X
         STA   $FA
         TDC
         ADC   #$0100
         TCD
         TXA
         ADC   #$0A00
         TAX
         DEY
         BMI   LC3F3
         BRL   LB92F
LC3F3    PLB
         PLD
         RTS

LC3F6    PHD
         PHB
         SEP   #$30
         LDAL  $E1C035
         AND   #$F7
         STAL  $E1C035
         LDAL  $E1C068
         ORA   #$10
         STAL  $E1C068
         LDA   #$00
         PHA
         PLB
         REP   #$20
         LDA   #$2500
         TCD
         CLC
         LDY   #$17
         LDA   #$0000
LC41E    TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         DEY
         BMI   LC88C
         BRL   LC41E
LC88C    SEP   #$20
         LDAL  $E1C035
         ORA   #$08
         STAL  $E1C035
         LDAL  $E1C068
         AND   #$EF
         STAL  $E1C068
         REP   #$30
         PLB
         PLD
         RTS

LC8A7    PHD
         PHB
         SEP   #$30
         LDAL  $E1C035
         AND   #$F7
         STAL  $E1C035
         LDAL  $E1C068
         ORA   #$10
         STAL  $E1C068
         LDA   #$00
         PHA
         PLB
         REP   #$20
         LDA   #$2000
         TCD
         CLC
         LDY   #$16
         LDA   #$0000
LC8CF    TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         DEY
         BMI   LCD7D
         BRL   LC8CF
LCD7D    TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         SEP   #$20
         LDAL  $E1C035
         ORA   #$08
         STAL  $E1C035
         LDAL  $E1C068
         AND   #$EF
         STAL  $E1C068
         REP   #$30
         PLB
         PLD
         RTS

LCFE8    PHD
         PHB
         SEP   #$30
         LDAL  $E1C035
         AND   #$F7
         STAL  $E1C035
         LDAL  $E1C068
         ORA   #$10
         STAL  $E1C068
         LDA   #$00
         PHA
         PLB
         REP   #$20
         LDA   #$3E00
         TCD
         CLC
         LDY   #$0B
         LDA   #$0000
LD010    TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TDC
         ADC   #$0100
         TCD
         LDA   #$0000
         DEY
         BMI   LD4FE
         BRL   LD010
LD4FE    SEP   #$20
         LDAL  $E1C035
         ORA   #$08
         STAL  $E1C035
         LDAL  $E1C068
         AND   #$EF
         STAL  $E1C068
         REP   #$30
         PLB
         PLD
         RTS

LD519    SEP   #$10
         LDY   #$58
         BRA   LD523
LD51F    SEP   #$10
         LDY   #$7C
LD523    PHD
         LDA   #$2000
         TCD
         CLC
LD529    STZ   $00
         STZ   $02
         STZ   $04
         STZ   $06
         STZ   $08
         STZ   $0A
         STZ   $0C
         STZ   $0E
         STZ   $10
         STZ   $12
         STZ   $14
         STZ   $16
         STZ   $18
         STZ   $1A
         STZ   $1C
         STZ   $1E
         STZ   $20
         STZ   $22
         STZ   $24
         STZ   $26
         STZ   $28
         STZ   $2A
         STZ   $2C
         STZ   $2E
         STZ   $30
         STZ   $32
         STZ   $34
         STZ   $36
         STZ   $38
         STZ   $3A
         STZ   $3C
         STZ   $3E
         STZ   $40
         STZ   $42
         STZ   $44
         STZ   $46
         STZ   $48
         STZ   $4A
         STZ   $4C
         STZ   $4E
         STZ   $50
         STZ   $52
         STZ   $54
         STZ   $56
         STZ   $58
         STZ   $5A
         STZ   $5C
         STZ   $5E
         STZ   $60
         STZ   $62
         STZ   $64
         STZ   $66
         STZ   $68
         STZ   $6A
         STZ   $6C
         STZ   $6E
         STZ   $70
         STZ   $72
         STZ   $74
         STZ   $76
         STZ   $78
         STZ   $7A
         STZ   $7C
         STZ   $7E
         STZ   $80
         STZ   $82
         STZ   $84
         STZ   $86
         STZ   $88
         STZ   $8A
         STZ   $8C
         STZ   $8E
         STZ   $90
         STZ   $92
         STZ   $94
         STZ   $96
         STZ   $98
         STZ   $9A
         STZ   $9C
         STZ   $9E
         STZ   $A0
         STZ   $A2
         STZ   $A4
         STZ   $A6
         STZ   $A8
         STZ   $AA
         STZ   $AC
         STZ   $AE
         STZ   $B0
         STZ   $B2
         STZ   $B4
         STZ   $B6
         STZ   $B8
         STZ   $BA
         STZ   $BC
         STZ   $BE
         STZ   $C0
         STZ   $C2
         STZ   $C4
         STZ   $C6
         STZ   $C8
         STZ   $CA
         STZ   $CC
         STZ   $CE
         STZ   $D0
         STZ   $D2
         STZ   $D4
         STZ   $D6
         STZ   $D8
         STZ   $DA
         STZ   $DC
         STZ   $DE
         STZ   $E0
         STZ   $E2
         STZ   $E4
         STZ   $E6
         STZ   $E8
         STZ   $EA
         STZ   $EC
         STZ   $EE
         STZ   $F0
         STZ   $F2
         STZ   $F4
         STZ   $F6
         STZ   $F8
         STZ   $FA
         STZ   $FC
         STZ   $FE
         TDC
         ADC   #$0100
         TCD
         DEY
         BMI   LD634
         BRL   LD529
LD634    PLD
         REP   #$10
         RTS

LD638    JSR   LB710
         LDY   #$0058
         BRA   LD643
LD640    LDY   #$007C
LD643    PHD
         SEP   #$30
         LDAL  $E1C035
         AND   #$F7
         STAL  $E1C035
         LDAL  $E1C068
         ORA   #$10
         STAL  $E1C068
         REP   #$20
         LDA   #$2000
         TCD
         CLC
LD661    LDA   #$0000
         TSB   $00
         TSB   $02
         TSB   $04
         TSB   $06
         TSB   $08
         TSB   $0A
         TSB   $0C
         TSB   $0E
         TSB   $10
         TSB   $12
         TSB   $14
         TSB   $16
         TSB   $18
         TSB   $1A
         TSB   $1C
         TSB   $1E
         TSB   $20
         TSB   $22
         TSB   $24
         TSB   $26
         TSB   $28
         TSB   $2A
         TSB   $2C
         TSB   $2E
         TSB   $30
         TSB   $32
         TSB   $34
         TSB   $36
         TSB   $38
         TSB   $3A
         TSB   $3C
         TSB   $3E
         TSB   $40
         TSB   $42
         TSB   $44
         TSB   $46
         TSB   $48
         TSB   $4A
         TSB   $4C
         TSB   $4E
         TSB   $50
         TSB   $52
         TSB   $54
         TSB   $56
         TSB   $58
         TSB   $5A
         TSB   $5C
         TSB   $5E
         TSB   $60
         TSB   $62
         TSB   $64
         TSB   $66
         TSB   $68
         TSB   $6A
         TSB   $6C
         TSB   $6E
         TSB   $70
         TSB   $72
         TSB   $74
         TSB   $76
         TSB   $78
         TSB   $7A
         TSB   $7C
         TSB   $7E
         TSB   $80
         TSB   $82
         TSB   $84
         TSB   $86
         TSB   $88
         TSB   $8A
         TSB   $8C
         TSB   $8E
         TSB   $90
         TSB   $92
         TSB   $94
         TSB   $96
         TSB   $98
         TSB   $9A
         TSB   $9C
         TSB   $9E
         TSB   $A0
         TSB   $A2
         TSB   $A4
         TSB   $A6
         TSB   $A8
         TSB   $AA
         TSB   $AC
         TSB   $AE
         TSB   $B0
         TSB   $B2
         TSB   $B4
         TSB   $B6
         TSB   $B8
         TSB   $BA
         TSB   $BC
         TSB   $BE
         TSB   $C0
         TSB   $C2
         TSB   $C4
         TSB   $C6
         TSB   $C8
         TSB   $CA
         TSB   $CC
         TSB   $CE
         TSB   $D0
         TSB   $D2
         TSB   $D4
         TSB   $D6
         TSB   $D8
         TSB   $DA
         TSB   $DC
         TSB   $DE
         TSB   $E0
         TSB   $E2
         TSB   $E4
         TSB   $E6
         TSB   $E8
         TSB   $EA
         TSB   $EC
         TSB   $EE
         TSB   $F0
         TSB   $F2
         TSB   $F4
         TSB   $F6
         TSB   $F8
         TSB   $FA
         TSB   $FC
         TSB   $FE
         TDC
         ADC   #$0100
         TCD
         DEY
         BMI   LD76F
         BRL   LD661
LD76F    SEP   #$20
         LDAL  $E1C035
         ORA   #$08
         STAL  $E1C035
         LDAL  $E1C068
         AND   #$EF
         STAL  $E1C068
         REP   #$30
         PLD
         RTS

*
*
*

LD789    LDA   $24
         STAL  $03FF00
         LDX   $26
         TSC
         STA   LE48F+1
         SEP   #$20
         LDAL  $E1C035
         AND   #$F7
         STAL  $E1C035
         LDAL  $E1C068
         ORA   #$10
         STAL  $E1C068
         LDA   #$03
         PHA
         PLB
         REP   #$20
         LDA   #$1000
         CLC
         ADC   $26
         TCS
         LDA   #$2000
         TCD
         LDY   #$0018
LD7BF    PLA
         ADC   $FF00
         TAX
         LDA   |$0000,X
         STA   $00
         LDA   |$0002,X
         STA   $02
         LDA   |$0004,X
         STA   $04
         LDA   |$0006,X
         STA   $06
         LDA   |$0008,X
         STA   $08
         LDA   |$000A,X
         STA   $0A
         LDA   |$000C,X
         STA   $0C
         LDA   |$000E,X
         STA   $0E
         LDA   |$0010,X
         STA   $10
         LDA   |$0012,X
         STA   $12
         LDA   |$0014,X
         STA   $14
         LDA   |$0016,X
         STA   $16
         LDA   |$0018,X
         STA   $18
         LDA   |$001A,X
         STA   $1A
         LDA   |$001C,X
         STA   $1C
         LDA   |$001E,X
         STA   $1E
         LDA   |$0020,X
         STA   $20
         LDA   |$0022,X
         STA   $22
         LDA   |$0024,X
         STA   $24
         LDA   |$0026,X
         STA   $26
         LDA   |$0028,X
         STA   $28
         LDA   |$002A,X
         STA   $2A
         LDA   |$002C,X
         STA   $2C
         LDA   |$002E,X
         STA   $2E
         LDA   |$0030,X
         STA   $30
         LDA   |$0032,X
         STA   $32
         LDA   |$0034,X
         STA   $34
         LDA   |$0036,X
         STA   $36
         LDA   |$0038,X
         STA   $38
         LDA   |$003A,X
         STA   $3A
         LDA   |$003C,X
         STA   $3C
         LDA   |$003E,X
         STA   $3E
         LDA   |$0040,X
         STA   $40
         LDA   |$0042,X
         STA   $42
         LDA   |$0044,X
         STA   $44
         LDA   |$0046,X
         STA   $46
         LDA   |$0048,X
         STA   $48
         LDA   |$004A,X
         STA   $4A
         LDA   |$004C,X
         STA   $4C
         LDA   |$004E,X
         STA   $4E
         LDA   |$0050,X
         STA   $50
         LDA   |$0052,X
         STA   $52
         LDA   |$0054,X
         STA   $54
         LDA   |$0056,X
         STA   $56
         LDA   |$0058,X
         STA   $58
         LDA   |$005A,X
         STA   $5A
         LDA   |$005C,X
         STA   $5C
         LDA   |$005E,X
         STA   $5E
         LDA   |$0060,X
         STA   $60
         LDA   |$0062,X
         STA   $62
         LDA   |$0064,X
         STA   $64
         LDA   |$0066,X
         STA   $66
         LDA   |$0068,X
         STA   $68
         LDA   |$006A,X
         STA   $6A
         LDA   |$006C,X
         STA   $6C
         LDA   |$006E,X
         STA   $6E
         LDA   |$0070,X
         STA   $70
         LDA   |$0072,X
         STA   $72
         LDA   |$0074,X
         STA   $74
         LDA   |$0076,X
         STA   $76
         LDA   |$0078,X
         STA   $78
         LDA   |$007A,X
         STA   $7A
         LDA   |$007C,X
         STA   $7C
         LDA   |$007E,X
         STA   $7E
         LDA   |$0080,X
         STA   $80
         LDA   |$0082,X
         STA   $82
         LDA   |$0084,X
         STA   $84
         LDA   |$0086,X
         STA   $86
         LDA   |$0088,X
         STA   $88
         LDA   |$008A,X
         STA   $8A
         LDA   |$008C,X
         STA   $8C
         LDA   |$008E,X
         STA   $8E
         LDA   |$0090,X
         STA   $90
         LDA   |$0092,X
         STA   $92
         LDA   |$0094,X
         STA   $94
         LDA   |$0096,X
         STA   $96
         LDA   |$0098,X
         STA   $98
         LDA   |$009A,X
         STA   $9A
         LDA   |$009C,X
         STA   $9C
         LDA   |$009E,X
         STA   $9E
         PLA
         ADC   $FF00
         TAX
         LDA   $0140,X
         STA   $A0
         LDA   $0142,X
         STA   $A2
         LDA   $0144,X
         STA   $A4
         LDA   $0146,X
         STA   $A6
         LDA   $0148,X
         STA   $A8
         LDA   $014A,X
         STA   $AA
         LDA   $014C,X
         STA   $AC
         LDA   $014E,X
         STA   $AE
         LDA   $0150,X
         STA   $B0
         LDA   $0152,X
         STA   $B2
         LDA   $0154,X
         STA   $B4
         LDA   $0156,X
         STA   $B6
         LDA   $0158,X
         STA   $B8
         LDA   $015A,X
         STA   $BA
         LDA   $015C,X
         STA   $BC
         LDA   $015E,X
         STA   $BE
         LDA   $0160,X
         STA   $C0
         LDA   $0162,X
         STA   $C2
         LDA   $0164,X
         STA   $C4
         LDA   $0166,X
         STA   $C6
         LDA   $0168,X
         STA   $C8
         LDA   $016A,X
         STA   $CA
         LDA   $016C,X
         STA   $CC
         LDA   $016E,X
         STA   $CE
         LDA   $0170,X
         STA   $D0
         LDA   $0172,X
         STA   $D2
         LDA   $0174,X
         STA   $D4
         LDA   $0176,X
         STA   $D6
         LDA   $0178,X
         STA   $D8
         LDA   $017A,X
         STA   $DA
         LDA   $017C,X
         STA   $DC
         LDA   $017E,X
         STA   $DE
         LDA   $0180,X
         STA   $E0
         LDA   $0182,X
         STA   $E2
         LDA   $0184,X
         STA   $E4
         LDA   $0186,X
         STA   $E6
         LDA   $0188,X
         STA   $E8
         LDA   $018A,X
         STA   $EA
         LDA   $018C,X
         STA   $EC
         LDA   $018E,X
         STA   $EE
         LDA   $0190,X
         STA   $F0
         LDA   $0192,X
         STA   $F2
         LDA   $0194,X
         STA   $F4
         LDA   $0196,X
         STA   $F6
         LDA   $0198,X
         STA   $F8
         LDA   $019A,X
         STA   $FA
         LDA   $019C,X
         STA   $FC
         LDA   $019E,X
         STA   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   $01A0,X
         STA   $00
         LDA   $01A2,X
         STA   $02
         LDA   $01A4,X
         STA   $04
         LDA   $01A6,X
         STA   $06
         LDA   $01A8,X
         STA   $08
         LDA   $01AA,X
         STA   $0A
         LDA   $01AC,X
         STA   $0C
         LDA   $01AE,X
         STA   $0E
         LDA   $01B0,X
         STA   $10
         LDA   $01B2,X
         STA   $12
         LDA   $01B4,X
         STA   $14
         LDA   $01B6,X
         STA   $16
         LDA   $01B8,X
         STA   $18
         LDA   $01BA,X
         STA   $1A
         LDA   $01BC,X
         STA   $1C
         LDA   $01BE,X
         STA   $1E
         LDA   $01C0,X
         STA   $20
         LDA   $01C2,X
         STA   $22
         LDA   $01C4,X
         STA   $24
         LDA   $01C6,X
         STA   $26
         LDA   $01C8,X
         STA   $28
         LDA   $01CA,X
         STA   $2A
         LDA   $01CC,X
         STA   $2C
         LDA   $01CE,X
         STA   $2E
         LDA   $01D0,X
         STA   $30
         LDA   $01D2,X
         STA   $32
         LDA   $01D4,X
         STA   $34
         LDA   $01D6,X
         STA   $36
         LDA   $01D8,X
         STA   $38
         LDA   $01DA,X
         STA   $3A
         LDA   $01DC,X
         STA   $3C
         LDA   $01DE,X
         STA   $3E
         PLA
         ADC   $FF00
         TAX
         LDA   $0280,X
         STA   $40
         LDA   $0282,X
         STA   $42
         LDA   $0284,X
         STA   $44
         LDA   $0286,X
         STA   $46
         LDA   $0288,X
         STA   $48
         LDA   $028A,X
         STA   $4A
         LDA   $028C,X
         STA   $4C
         LDA   $028E,X
         STA   $4E
         LDA   $0290,X
         STA   $50
         LDA   $0292,X
         STA   $52
         LDA   $0294,X
         STA   $54
         LDA   $0296,X
         STA   $56
         LDA   $0298,X
         STA   $58
         LDA   $029A,X
         STA   $5A
         LDA   $029C,X
         STA   $5C
         LDA   $029E,X
         STA   $5E
         LDA   $02A0,X
         STA   $60
         LDA   $02A2,X
         STA   $62
         LDA   $02A4,X
         STA   $64
         LDA   $02A6,X
         STA   $66
         LDA   $02A8,X
         STA   $68
         LDA   $02AA,X
         STA   $6A
         LDA   $02AC,X
         STA   $6C
         LDA   $02AE,X
         STA   $6E
         LDA   $02B0,X
         STA   $70
         LDA   $02B2,X
         STA   $72
         LDA   $02B4,X
         STA   $74
         LDA   $02B6,X
         STA   $76
         LDA   $02B8,X
         STA   $78
         LDA   $02BA,X
         STA   $7A
         LDA   $02BC,X
         STA   $7C
         LDA   $02BE,X
         STA   $7E
         LDA   $02C0,X
         STA   $80
         LDA   $02C2,X
         STA   $82
         LDA   $02C4,X
         STA   $84
         LDA   $02C6,X
         STA   $86
         LDA   $02C8,X
         STA   $88
         LDA   $02CA,X
         STA   $8A
         LDA   $02CC,X
         STA   $8C
         LDA   $02CE,X
         STA   $8E
         LDA   $02D0,X
         STA   $90
         LDA   $02D2,X
         STA   $92
         LDA   $02D4,X
         STA   $94
         LDA   $02D6,X
         STA   $96
         LDA   $02D8,X
         STA   $98
         LDA   $02DA,X
         STA   $9A
         LDA   $02DC,X
         STA   $9C
         LDA   $02DE,X
         STA   $9E
         LDA   $02E0,X
         STA   $A0
         LDA   $02E2,X
         STA   $A2
         LDA   $02E4,X
         STA   $A4
         LDA   $02E6,X
         STA   $A6
         LDA   $02E8,X
         STA   $A8
         LDA   $02EA,X
         STA   $AA
         LDA   $02EC,X
         STA   $AC
         LDA   $02EE,X
         STA   $AE
         LDA   $02F0,X
         STA   $B0
         LDA   $02F2,X
         STA   $B2
         LDA   $02F4,X
         STA   $B4
         LDA   $02F6,X
         STA   $B6
         LDA   $02F8,X
         STA   $B8
         LDA   $02FA,X
         STA   $BA
         LDA   $02FC,X
         STA   $BC
         LDA   $02FE,X
         STA   $BE
         LDA   $0300,X
         STA   $C0
         LDA   $0302,X
         STA   $C2
         LDA   $0304,X
         STA   $C4
         LDA   $0306,X
         STA   $C6
         LDA   $0308,X
         STA   $C8
         LDA   $030A,X
         STA   $CA
         LDA   $030C,X
         STA   $CC
         LDA   $030E,X
         STA   $CE
         LDA   $0310,X
         STA   $D0
         LDA   $0312,X
         STA   $D2
         LDA   $0314,X
         STA   $D4
         LDA   $0316,X
         STA   $D6
         LDA   $0318,X
         STA   $D8
         LDA   $031A,X
         STA   $DA
         LDA   $031C,X
         STA   $DC
         LDA   $031E,X
         STA   $DE
         PLA
         ADC   $FF00
         TAX
         LDA   $03C0,X
         STA   $E0
         LDA   $03C2,X
         STA   $E2
         LDA   $03C4,X
         STA   $E4
         LDA   $03C6,X
         STA   $E6
         LDA   $03C8,X
         STA   $E8
         LDA   $03CA,X
         STA   $EA
         LDA   $03CC,X
         STA   $EC
         LDA   $03CE,X
         STA   $EE
         LDA   $03D0,X
         STA   $F0
         LDA   $03D2,X
         STA   $F2
         LDA   $03D4,X
         STA   $F4
         LDA   $03D6,X
         STA   $F6
         LDA   $03D8,X
         STA   $F8
         LDA   $03DA,X
         STA   $FA
         LDA   $03DC,X
         STA   $FC
         LDA   $03DE,X
         STA   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   $03E0,X
         STA   $00
         LDA   $03E2,X
         STA   $02
         LDA   $03E4,X
         STA   $04
         LDA   $03E6,X
         STA   $06
         LDA   $03E8,X
         STA   $08
         LDA   $03EA,X
         STA   $0A
         LDA   $03EC,X
         STA   $0C
         LDA   $03EE,X
         STA   $0E
         LDA   $03F0,X
         STA   $10
         LDA   $03F2,X
         STA   $12
         LDA   $03F4,X
         STA   $14
         LDA   $03F6,X
         STA   $16
         LDA   $03F8,X
         STA   $18
         LDA   $03FA,X
         STA   $1A
         LDA   $03FC,X
         STA   $1C
         LDA   $03FE,X
         STA   $1E
         LDA   $0400,X
         STA   $20
         LDA   $0402,X
         STA   $22
         LDA   $0404,X
         STA   $24
         LDA   $0406,X
         STA   $26
         LDA   $0408,X
         STA   $28
         LDA   $040A,X
         STA   $2A
         LDA   $040C,X
         STA   $2C
         LDA   $040E,X
         STA   $2E
         LDA   $0410,X
         STA   $30
         LDA   $0412,X
         STA   $32
         LDA   $0414,X
         STA   $34
         LDA   $0416,X
         STA   $36
         LDA   $0418,X
         STA   $38
         LDA   $041A,X
         STA   $3A
         LDA   $041C,X
         STA   $3C
         LDA   $041E,X
         STA   $3E
         LDA   $0420,X
         STA   $40
         LDA   $0422,X
         STA   $42
         LDA   $0424,X
         STA   $44
         LDA   $0426,X
         STA   $46
         LDA   $0428,X
         STA   $48
         LDA   $042A,X
         STA   $4A
         LDA   $042C,X
         STA   $4C
         LDA   $042E,X
         STA   $4E
         LDA   $0430,X
         STA   $50
         LDA   $0432,X
         STA   $52
         LDA   $0434,X
         STA   $54
         LDA   $0436,X
         STA   $56
         LDA   $0438,X
         STA   $58
         LDA   $043A,X
         STA   $5A
         LDA   $043C,X
         STA   $5C
         LDA   $043E,X
         STA   $5E
         LDA   $0440,X
         STA   $60
         LDA   $0442,X
         STA   $62
         LDA   $0444,X
         STA   $64
         LDA   $0446,X
         STA   $66
         LDA   $0448,X
         STA   $68
         LDA   $044A,X
         STA   $6A
         LDA   $044C,X
         STA   $6C
         LDA   $044E,X
         STA   $6E
         LDA   $0450,X
         STA   $70
         LDA   $0452,X
         STA   $72
         LDA   $0454,X
         STA   $74
         LDA   $0456,X
         STA   $76
         LDA   $0458,X
         STA   $78
         LDA   $045A,X
         STA   $7A
         LDA   $045C,X
         STA   $7C
         LDA   $045E,X
         STA   $7E
         PLA
         ADC   $FF00
         TAX
         LDA   $0500,X
         STA   $80
         LDA   $0502,X
         STA   $82
         LDA   $0504,X
         STA   $84
         LDA   $0506,X
         STA   $86
         LDA   $0508,X
         STA   $88
         LDA   $050A,X
         STA   $8A
         LDA   $050C,X
         STA   $8C
         LDA   $050E,X
         STA   $8E
         LDA   $0510,X
         STA   $90
         LDA   $0512,X
         STA   $92
         LDA   $0514,X
         STA   $94
         LDA   $0516,X
         STA   $96
         LDA   $0518,X
         STA   $98
         LDA   $051A,X
         STA   $9A
         LDA   $051C,X
         STA   $9C
         LDA   $051E,X
         STA   $9E
         LDA   $0520,X
         STA   $A0
         LDA   $0522,X
         STA   $A2
         LDA   $0524,X
         STA   $A4
         LDA   $0526,X
         STA   $A6
         LDA   $0528,X
         STA   $A8
         LDA   $052A,X
         STA   $AA
         LDA   $052C,X
         STA   $AC
         LDA   $052E,X
         STA   $AE
         LDA   $0530,X
         STA   $B0
         LDA   $0532,X
         STA   $B2
         LDA   $0534,X
         STA   $B4
         LDA   $0536,X
         STA   $B6
         LDA   $0538,X
         STA   $B8
         LDA   $053A,X
         STA   $BA
         LDA   $053C,X
         STA   $BC
         LDA   $053E,X
         STA   $BE
         LDA   $0540,X
         STA   $C0
         LDA   $0542,X
         STA   $C2
         LDA   $0544,X
         STA   $C4
         LDA   $0546,X
         STA   $C6
         LDA   $0548,X
         STA   $C8
         LDA   $054A,X
         STA   $CA
         LDA   $054C,X
         STA   $CC
         LDA   $054E,X
         STA   $CE
         LDA   $0550,X
         STA   $D0
         LDA   $0552,X
         STA   $D2
         LDA   $0554,X
         STA   $D4
         LDA   $0556,X
         STA   $D6
         LDA   $0558,X
         STA   $D8
         LDA   $055A,X
         STA   $DA
         LDA   $055C,X
         STA   $DC
         LDA   $055E,X
         STA   $DE
         LDA   $0560,X
         STA   $E0
         LDA   $0562,X
         STA   $E2
         LDA   $0564,X
         STA   $E4
         LDA   $0566,X
         STA   $E6
         LDA   $0568,X
         STA   $E8
         LDA   $056A,X
         STA   $EA
         LDA   $056C,X
         STA   $EC
         LDA   $056E,X
         STA   $EE
         LDA   $0570,X
         STA   $F0
         LDA   $0572,X
         STA   $F2
         LDA   $0574,X
         STA   $F4
         LDA   $0576,X
         STA   $F6
         LDA   $0578,X
         STA   $F8
         LDA   $057A,X
         STA   $FA
         LDA   $057C,X
         STA   $FC
         LDA   $057E,X
         STA   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   $0580,X
         STA   $00
         LDA   $0582,X
         STA   $02
         LDA   $0584,X
         STA   $04
         LDA   $0586,X
         STA   $06
         LDA   $0588,X
         STA   $08
         LDA   $058A,X
         STA   $0A
         LDA   $058C,X
         STA   $0C
         LDA   $058E,X
         STA   $0E
         LDA   $0590,X
         STA   $10
         LDA   $0592,X
         STA   $12
         LDA   $0594,X
         STA   $14
         LDA   $0596,X
         STA   $16
         LDA   $0598,X
         STA   $18
         LDA   $059A,X
         STA   $1A
         LDA   $059C,X
         STA   $1C
         LDA   $059E,X
         STA   $1E
         PLA
         ADC   $FF00
         TAX
         LDA   $0640,X
         STA   $20
         LDA   $0642,X
         STA   $22
         LDA   $0644,X
         STA   $24
         LDA   $0646,X
         STA   $26
         LDA   $0648,X
         STA   $28
         LDA   $064A,X
         STA   $2A
         LDA   $064C,X
         STA   $2C
         LDA   $064E,X
         STA   $2E
         LDA   $0650,X
         STA   $30
         LDA   $0652,X
         STA   $32
         LDA   $0654,X
         STA   $34
         LDA   $0656,X
         STA   $36
         LDA   $0658,X
         STA   $38
         LDA   $065A,X
         STA   $3A
         LDA   $065C,X
         STA   $3C
         LDA   $065E,X
         STA   $3E
         LDA   $0660,X
         STA   $40
         LDA   $0662,X
         STA   $42
         LDA   $0664,X
         STA   $44
         LDA   $0666,X
         STA   $46
         LDA   $0668,X
         STA   $48
         LDA   $066A,X
         STA   $4A
         LDA   $066C,X
         STA   $4C
         LDA   $066E,X
         STA   $4E
         LDA   $0670,X
         STA   $50
         LDA   $0672,X
         STA   $52
         LDA   $0674,X
         STA   $54
         LDA   $0676,X
         STA   $56
         LDA   $0678,X
         STA   $58
         LDA   $067A,X
         STA   $5A
         LDA   $067C,X
         STA   $5C
         LDA   $067E,X
         STA   $5E
         LDA   $0680,X
         STA   $60
         LDA   $0682,X
         STA   $62
         LDA   $0684,X
         STA   $64
         LDA   $0686,X
         STA   $66
         LDA   $0688,X
         STA   $68
         LDA   $068A,X
         STA   $6A
         LDA   $068C,X
         STA   $6C
         LDA   $068E,X
         STA   $6E
         LDA   $0690,X
         STA   $70
         LDA   $0692,X
         STA   $72
         LDA   $0694,X
         STA   $74
         LDA   $0696,X
         STA   $76
         LDA   $0698,X
         STA   $78
         LDA   $069A,X
         STA   $7A
         LDA   $069C,X
         STA   $7C
         LDA   $069E,X
         STA   $7E
         LDA   $06A0,X
         STA   $80
         LDA   $06A2,X
         STA   $82
         LDA   $06A4,X
         STA   $84
         LDA   $06A6,X
         STA   $86
         LDA   $06A8,X
         STA   $88
         LDA   $06AA,X
         STA   $8A
         LDA   $06AC,X
         STA   $8C
         LDA   $06AE,X
         STA   $8E
         LDA   $06B0,X
         STA   $90
         LDA   $06B2,X
         STA   $92
         LDA   $06B4,X
         STA   $94
         LDA   $06B6,X
         STA   $96
         LDA   $06B8,X
         STA   $98
         LDA   $06BA,X
         STA   $9A
         LDA   $06BC,X
         STA   $9C
         LDA   $06BE,X
         STA   $9E
         LDA   $06C0,X
         STA   $A0
         LDA   $06C2,X
         STA   $A2
         LDA   $06C4,X
         STA   $A4
         LDA   $06C6,X
         STA   $A6
         LDA   $06C8,X
         STA   $A8
         LDA   $06CA,X
         STA   $AA
         LDA   $06CC,X
         STA   $AC
         LDA   $06CE,X
         STA   $AE
         LDA   $06D0,X
         STA   $B0
         LDA   $06D2,X
         STA   $B2
         LDA   $06D4,X
         STA   $B4
         LDA   $06D6,X
         STA   $B6
         LDA   $06D8,X
         STA   $B8
         LDA   $06DA,X
         STA   $BA
         LDA   $06DC,X
         STA   $BC
         LDA   $06DE,X
         STA   $BE
         PLA
         ADC   $FF00
         TAX
         LDA   $0780,X
         STA   $C0
         LDA   $0782,X
         STA   $C2
         LDA   $0784,X
         STA   $C4
         LDA   $0786,X
         STA   $C6
         LDA   $0788,X
         STA   $C8
         LDA   $078A,X
         STA   $CA
         LDA   $078C,X
         STA   $CC
         LDA   $078E,X
         STA   $CE
         LDA   $0790,X
         STA   $D0
         LDA   $0792,X
         STA   $D2
         LDA   $0794,X
         STA   $D4
         LDA   $0796,X
         STA   $D6
         LDA   $0798,X
         STA   $D8
         LDA   $079A,X
         STA   $DA
         LDA   $079C,X
         STA   $DC
         LDA   $079E,X
         STA   $DE
         LDA   $07A0,X
         STA   $E0
         LDA   $07A2,X
         STA   $E2
         LDA   $07A4,X
         STA   $E4
         LDA   $07A6,X
         STA   $E6
         LDA   $07A8,X
         STA   $E8
         LDA   $07AA,X
         STA   $EA
         LDA   $07AC,X
         STA   $EC
         LDA   $07AE,X
         STA   $EE
         LDA   $07B0,X
         STA   $F0
         LDA   $07B2,X
         STA   $F2
         LDA   $07B4,X
         STA   $F4
         LDA   $07B6,X
         STA   $F6
         LDA   $07B8,X
         STA   $F8
         LDA   $07BA,X
         STA   $FA
         LDA   $07BC,X
         STA   $FC
         LDA   $07BE,X
         STA   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   $07C0,X
         STA   $00
         LDA   $07C2,X
         STA   $02
         LDA   $07C4,X
         STA   $04
         LDA   $07C6,X
         STA   $06
         LDA   $07C8,X
         STA   $08
         LDA   $07CA,X
         STA   $0A
         LDA   $07CC,X
         STA   $0C
         LDA   $07CE,X
         STA   $0E
         LDA   $07D0,X
         STA   $10
         LDA   $07D2,X
         STA   $12
         LDA   $07D4,X
         STA   $14
         LDA   $07D6,X
         STA   $16
         LDA   $07D8,X
         STA   $18
         LDA   $07DA,X
         STA   $1A
         LDA   $07DC,X
         STA   $1C
         LDA   $07DE,X
         STA   $1E
         LDA   $07E0,X
         STA   $20
         LDA   $07E2,X
         STA   $22
         LDA   $07E4,X
         STA   $24
         LDA   $07E6,X
         STA   $26
         LDA   $07E8,X
         STA   $28
         LDA   $07EA,X
         STA   $2A
         LDA   $07EC,X
         STA   $2C
         LDA   $07EE,X
         STA   $2E
         LDA   $07F0,X
         STA   $30
         LDA   $07F2,X
         STA   $32
         LDA   $07F4,X
         STA   $34
         LDA   $07F6,X
         STA   $36
         LDA   $07F8,X
         STA   $38
         LDA   $07FA,X
         STA   $3A
         LDA   $07FC,X
         STA   $3C
         LDA   $07FE,X
         STA   $3E
         LDA   $0800,X
         STA   $40
         LDA   $0802,X
         STA   $42
         LDA   $0804,X
         STA   $44
         LDA   $0806,X
         STA   $46
         LDA   $0808,X
         STA   $48
         LDA   $080A,X
         STA   $4A
         LDA   $080C,X
         STA   $4C
         LDA   $080E,X
         STA   $4E
         LDA   $0810,X
         STA   $50
         LDA   $0812,X
         STA   $52
         LDA   $0814,X
         STA   $54
         LDA   $0816,X
         STA   $56
         LDA   $0818,X
         STA   $58
         LDA   $081A,X
         STA   $5A
         LDA   $081C,X
         STA   $5C
         LDA   $081E,X
         STA   $5E
         PLA
         ADC   $FF00
         TAX
         LDA   $08C0,X
         STA   $60
         LDA   $08C2,X
         STA   $62
         LDA   $08C4,X
         STA   $64
         LDA   $08C6,X
         STA   $66
         LDA   $08C8,X
         STA   $68
         LDA   $08CA,X
         STA   $6A
         LDA   $08CC,X
         STA   $6C
         LDA   $08CE,X
         STA   $6E
         LDA   $08D0,X
         STA   $70
         LDA   $08D2,X
         STA   $72
         LDA   $08D4,X
         STA   $74
         LDA   $08D6,X
         STA   $76
         LDA   $08D8,X
         STA   $78
         LDA   $08DA,X
         STA   $7A
         LDA   $08DC,X
         STA   $7C
         LDA   $08DE,X
         STA   $7E
         LDA   $08E0,X
         STA   $80
         LDA   $08E2,X
         STA   $82
         LDA   $08E4,X
         STA   $84
         LDA   $08E6,X
         STA   $86
         LDA   $08E8,X
         STA   $88
         LDA   $08EA,X
         STA   $8A
         LDA   $08EC,X
         STA   $8C
         LDA   $08EE,X
         STA   $8E
         LDA   $08F0,X
         STA   $90
         LDA   $08F2,X
         STA   $92
         LDA   $08F4,X
         STA   $94
         LDA   $08F6,X
         STA   $96
         LDA   $08F8,X
         STA   $98
         LDA   $08FA,X
         STA   $9A
         LDA   $08FC,X
         STA   $9C
         LDA   $08FE,X
         STA   $9E
         LDA   $0900,X
         STA   $A0
         LDA   $0902,X
         STA   $A2
         LDA   $0904,X
         STA   $A4
         LDA   $0906,X
         STA   $A6
         LDA   $0908,X
         STA   $A8
         LDA   $090A,X
         STA   $AA
         LDA   $090C,X
         STA   $AC
         LDA   $090E,X
         STA   $AE
         LDA   $0910,X
         STA   $B0
         LDA   $0912,X
         STA   $B2
         LDA   $0914,X
         STA   $B4
         LDA   $0916,X
         STA   $B6
         LDA   $0918,X
         STA   $B8
         LDA   $091A,X
         STA   $BA
         LDA   $091C,X
         STA   $BC
         LDA   $091E,X
         STA   $BE
         LDA   $0920,X
         STA   $C0
         LDA   $0922,X
         STA   $C2
         LDA   $0924,X
         STA   $C4
         LDA   $0926,X
         STA   $C6
         LDA   $0928,X
         STA   $C8
         LDA   $092A,X
         STA   $CA
         LDA   $092C,X
         STA   $CC
         LDA   $092E,X
         STA   $CE
         LDA   $0930,X
         STA   $D0
         LDA   $0932,X
         STA   $D2
         LDA   $0934,X
         STA   $D4
         LDA   $0936,X
         STA   $D6
         LDA   $0938,X
         STA   $D8
         LDA   $093A,X
         STA   $DA
         LDA   $093C,X
         STA   $DC
         LDA   $093E,X
         STA   $DE
         LDA   $0940,X
         STA   $E0
         LDA   $0942,X
         STA   $E2
         LDA   $0944,X
         STA   $E4
         LDA   $0946,X
         STA   $E6
         LDA   $0948,X
         STA   $E8
         LDA   $094A,X
         STA   $EA
         LDA   $094C,X
         STA   $EC
         LDA   $094E,X
         STA   $EE
         LDA   $0950,X
         STA   $F0
         LDA   $0952,X
         STA   $F2
         LDA   $0954,X
         STA   $F4
         LDA   $0956,X
         STA   $F6
         LDA   $0958,X
         STA   $F8
         LDA   $095A,X
         STA   $FA
         LDA   $095C,X
         STA   $FC
         LDA   $095E,X
         STA   $FE
         TDC
         ADC   #$0100
         TCD
         LDA   $FF00
         ADC   #$0A00
         STA   $FF00
         DEY
         BMI   LE48F
         BRL   LD7BF

LE48F    LDA   #$FFFF
         TCS
         PHK
         PLB
         PEA   $0000
         PLD
         SEP   #$20
         LDAL  $E1C035
         ORA   #$08
         STAL  $E1C035
         LDAL  $E1C068
         AND   #$EF
         STAL  $E1C068
         REP   #$20
         LDA   $26
         CLC
         ADC   $20
         CMP   #$02D0
         BCC   LE4BE
         SBC   #$02D0
LE4BE    STA   $26
         RTS

LE4C1    DW    $0000

*
* STORE KEY/JOY MOVEMENT
*

LE4C3    BIT   $68
         BMI   LE4CE
         BIT   $A4
         BPL   LE4D1
         BRL   LE594
LE4CE    BRL   LE594
LE4D1    LDX   #$0005
         BIT   LE4C1
         BMI   LE530
         PEA   $0000
         PLB
         PLB
         BIT   $C070
         SEP   #$30
         LDY   #$00
         TYX
         LDA   #$A0
LE4E8    BIT   $C064
         BPL   LE4EE
         INX
LE4EE    BIT   $C065
         BPL   LE4F4
         INY
LE4F4    DEC
         BNE   LE4E8
         REP   #$30
         LDA   $C060
         ORA   $C061
         PHK
         PLB
         PHA
         LDA   #$0000
         CPX   LE5E4
         BCC   LE511
         CPX   LE5E6
         BCC   LE510
         INC
LE510    INC
LE511    TAX
         CPY   LE5E8
         BCC   LE528
         CPY   LE5EA
         BCC   LE523
         TXA
         ORA   #$0008
         TAX
         BRA   LE528
LE523    TXA
         ORA   #$0004
         TAX
LE528    PLA		; JOYSTICK BUTTON
         BPL   LE530	; NOT PRESSED
         TXA		; PRESSED
         ORA   #$0010	; SET BIT 4
         TAX		; STORE X

LE530    LDAL  $E1BFFF
         BPL   LE58A
         AND   #$FF00
         XBA
         CMP   #$008D	; RETURN?
         BEQ   LE57E
         CMP   #$00B1	; DIRECTION?
         BCC   LE58A
         CMP   #$00BA
         BCS   LE58A
         TAY
         LDA   #$0003
         STAL  $E1C026
         STAL  $E1C010
         LDAL  $E1C025	; WAS IT PRESSED
         AND   #$0010	; FROM THE KEYPAD?
         BEQ   LE576	; NO
         LDA   LE5B2-$B1,Y	; YES, FROM A KEY TO A DIRECTION
         AND   #$00FF
         TAX
         LDAL  $E1C060
         ORAL  $E1C061
         BPL   LE58A
         TXA
         ORA   #$0010	; BIT 4 FOR BUTTON PRESSED
         TAX
         BRA   LE58A

LE576    CPY   #$00B5	; KEY >="5"
         BCS   LE58A	; YES, KEEP WHAT WE HAD IN X
         TYX		; NO, KEEP WHAT WE HAD IN Y
         BRA   LE58A	; BECAUSE 1-4 ARE FOR OPTIONS (MAGIC ZAPPER...)
LE57E    TAX		; RETURN WAS PRESSED
         LDA   #$0003
         STAL  $E1C026
         STAL  $E1C010
LE58A    TXA
         STA   [$DC]
         INC   $DC
         BNE   LE593
         INC   $DE
LE593    RTS

LE594    LDA   [$DC]
         AND   #$00FF
         INC   $DC
         BNE   LE59F
         INC   $DE
LE59F    PHA
         LDA   $DC
         CMP   $E0
         BNE   LE5B0
         LDA   $DE
         CMP   $E2
         BNE   LE5B0
         PLA
         JMP   L82C4

LE5B0    PLA
         RTS

* From a key to a direction
*              1 2 3 4 5 6 7 8 9
LE5B2    HEX   08090A040506000102 ; E501+B1

* KEYPAD     MOVEMENT
*  7  8  9    0  1  2
*  4  5  6    4  5  6
*  1  2  3    8  9  A
*  0          

LE5BB    LDY   #$0400
LE5BE    DEY
         BNE   LE5BE
         PEA   $0000
         PLB
         PLB
         BIT   $C070
         SEP   #$30
         LDY   #$00
         TYX
         LDA   #$A0
LE5D0    BIT   $C064
         BPL   LE5D6
         INX
LE5D6    BIT   $C065
         BPL   LE5DC
         INY
LE5DC    DEC
         BNE   LE5D0
         REP   #$30
         PHK
         PLB
         RTS

LE5E4    DW    $0000      ; JOY CLAMP
LE5E6    DW    $0000
LE5E8    DW    $0000
LE5EA    DW    $0000

         LDA   #$0000
         LDX   #$0000
LE5F2    STAL  $E12000,X
         INX
         INX
         BPL   LE5F2
         RTS

LE5FB    LDX   #$7CFE
         LDA   #$0000
LE601    STAL  $E12000,X
         DEX
         DEX
         BPL   LE601
         RTS

LE60A    LDX   #$7CFE
         LDA   #$0000
LE610    STAL  $012000,X
         DEX
         DEX
         BPL   LE610
         RTS

LE619    LDX   #$7CFE
         LDA   #$0000
LE61F    STAL  ptr002000,X
         DEX
         DEX
         BPL   LE61F
         RTS

         LDX   #$7CFE
LE62B    LDAL  ptr002000,X
         STAL  $012000,X
         DEX
         DEX
         BPL   LE62B
         RTS

LE638    LDX   #$7CFE
LE63B    LDAL  $012000,X
         STAL  ptr002000,X
         DEX
         DEX
         BPL   LE63B
         RTS

         PHB
         LDA   #$7CFF
         LDX   #$2000
         LDY   #$2000
         MVN   $010000,$E10000
         PLB
         RTS

LE657    LDA   #$0003
         STAL  $E1C026
         STAL  $E1C010
LE662    LDAL  $E1BFFF
         BPL   LE66F
         STAL  $E1C010
         AND   LE4C1
LE66F    ORAL  $E1C060
         ORAL  $E1C061
         BPL   LE662
         RTS

LE67A    LDAL  $E1C060
         ORAL  $E1C061
         BMI   LE67A
         RTS

LE685    LDA   #$0003
         STAL  $E1C026
         STAL  $E1C010
LE690    LDAL  $E1BFFF
         BPL   LE69D
         STAL  $E1C010
         AND   LE4C1
LE69D    ORAL  $E1C060
         ORAL  $E1C061
         BPL   LE690
LE6A7    LDAL  $E1C060
         ORAL  $E1C061
         BMI   LE6A7
         RTS

LE6B2    JSR   LE6B8
         BRL   LE5FB
         
LE6B8    JSR   LB710
         LDX   #$7E00
         LDA   #$0000
LE6C1    STAL  $E12000,X
         INX
         INX
         BPL   LE6C1
         RTS

LE6CA    ASL
         TAY
         JSR   LB710
         LDA   L9F46,Y
         STA   $00
         LDY   #$001E
         TYX
LE6D8    LDA   ($00),Y
         STAL  $E19E00,X
         DEY
         DEY
         DEX
         DEX
         BPL   LE6D8
         RTS

LE6E5    LDX   #$0014
LE6E8    LDA   L9F30,X
         STAL  $019E00,X
         DEX
         DEX
         BPL   LE6E8
         RTS

LE6F4    LDX   #$00FE
LE6F7    LDAL  $019D00,X
         STAL  $E19D00,X
         DEX
         DEX
         BPL   LE6F7
         JSR   LB710
         LDX   #$7E00
LE709    LDAL  $012000,X
         STAL  $E12000,X
         INX
         INX
         BPL   LE709
         RTS

LE716    LDA   #$0000
         LDX   #$00FE
LE71C    STAL  $E19D00,X
         DEX
         DEX
         BPL   LE71C
         RTS

LE725    LDX   #$00FE
LE728    LDAL  $019D00,X
         STAL  $E19D00,X
         DEX
         DEX
         BPL   LE728
         RTS

LE735    BIT   $66
         BMI   LE73E
         DEC   $66
         JSR   LE6F4
LE73E    RTS

LE73F    TAX
         LDA   #$0020
         LDY   #$9E00
         MVN   $040000,$010000
         PHK
         PLB
         RTS

LE74C    SEP   #$10
         STX   LE75A+2
         REP   #$10
         TAX
         LDA   #$7FFF
         LDY   #$2000
LE75A    MVN   $040000,$010000
         PHK
         PLB
         RTS

LE760    SEP   #$10
         STX   LE76E+1
         REP   #$10
         TAY
         LDA   #$7FFF
         LDX   #$2000
LE76E    MVN   $010000,$040000
         PHK
         PLB
         RTS

LE774    SEP   #$10
         STX   LE782+1
         REP   #$10
         TAY
         LDA   #$7FFF
         LDX   #$2000
LE782    MVN   $E10000,$040000
         PHK
         PLB
         RTS

LE788    SEP   #$10
         STX   LE796+2
         REP   #$10
         TAX
         LDA   #$7CFF
         LDY   #$2000
LE796    MVN   $040000,$E10000
         PHK
         PLB
         RTS

         JSR   LE6B8
         JSR   LE788
         JMP   LE6F4

LE7A5    JSR   LE74C
LE7A8    JSR   LE6B8
         JSR   LB77A
         JMP   LE6F4

LE7B1    JSR   LE6B8
         JSR   LB77A
         JSR   LE725
         LDA   #$0001
         JMP   LB721

LE7C0    SEP   #$10
         PHX
         PLB
         REP   #$10
         LDA   #$0000
         STA   $00
         CLC
         ADC   #$00A0
         STA   $04
         LDX   #$0003
         STX   $02
         STX   $06
         LDX   #$0000
LE7DB    LDY   #$0000
LE7DE    LDA   |$0000,X
         STA   [$00],Y
         LDA   $8000,X
         STA   [$04],Y
         INX
         INX
         INY
         INY
         CPY   #$00A0
         BCC   LE7DE
         LDA   #$013F
         ADC   $00
         STA   $00
         ADC   #$00A0
         STA   $04
         CPX   #$7D00
         BCC   LE7DB
         PHK
         PLB
         RTS

LE805    STA   LE829+1
         SEP   #$10
         PHX
         PLB
         REP   #$10
         LDA   #$0000
         CLC
         ADC   #$00A0
         STA   $00
         LDX   #$0003
         STX   $02
         LDX   #$0000
         TXA
LE820    STAL  $030000,X
         INX
         INX
         BNE   LE820
         TXY
LE829    LDA   $FFFF,X
         STA   [$00],Y
         INX
         INX
         INY
         INY
         CPY   #$00A0
         BCC   LE829
         LDY   #$0000
         LDA   $00
         ADC   #$013F
         STA   $00
         CPX   #$7D00
         BCC   LE829
         PHK
         PLB
         RTS

LE849    PHB
         PHX
         LDA   $28
         SEC
         SBC   $F0
         TAX
         PEA   $0303
         PLB
         PLB
         CLC
LE857    LDA   |$00A0,X
         STA   |$0000,X
         LDA   |$00A2,X
         STA   |$0002,X
         LDA   |$00A4,X
         STA   |$0004,X
         LDA   |$00A6,X
         STA   |$0006,X
         LDA   |$00A8,X
         STA   |$0008,X
         LDA   |$00AA,X
         STA   |$000A,X
         LDA   |$00AC,X
         STA   |$000C,X
         LDA   |$00AE,X
         STA   |$000E,X
         LDA   |$00B0,X
         STA   |$0010,X
         LDA   |$00B2,X
         STA   |$0012,X
         LDA   |$00B4,X
         STA   |$0014,X
         LDA   |$00B6,X
         STA   |$0016,X
         LDA   |$00B8,X
         STA   |$0018,X
         LDA   |$00BA,X
         STA   |$001A,X
         LDA   |$00BC,X
         STA   |$001C,X
         LDA   |$00BE,X
         STA   |$001E,X
         LDA   |$00C0,X
         STA   |$0020,X
         LDA   |$00C2,X
         STA   |$0022,X
         LDA   |$00C4,X
         STA   |$0024,X
         LDA   |$00C6,X
         STA   |$0026,X
         LDA   |$00C8,X
         STA   |$0028,X
         LDA   |$00CA,X
         STA   |$002A,X
         LDA   |$00CC,X
         STA   |$002C,X
         LDA   |$00CE,X
         STA   |$002E,X
         LDA   |$00D0,X
         STA   |$0030,X
         LDA   |$00D2,X
         STA   |$0032,X
         LDA   |$00D4,X
         STA   |$0034,X
         LDA   |$00D6,X
         STA   |$0036,X
         LDA   |$00D8,X
         STA   |$0038,X
         LDA   |$00DA,X
         STA   |$003A,X
         LDA   |$00DC,X
         STA   |$003C,X
         LDA   |$00DE,X
         STA   |$003E,X
         LDA   |$00E0,X
         STA   |$0040,X
         LDA   |$00E2,X
         STA   |$0042,X
         LDA   |$00E4,X
         STA   |$0044,X
         LDA   |$00E6,X
         STA   |$0046,X
         LDA   |$00E8,X
         STA   |$0048,X
         LDA   |$00EA,X
         STA   |$004A,X
         LDA   |$00EC,X
         STA   |$004C,X
         LDA   |$00EE,X
         STA   |$004E,X
         LDA   |$00F0,X
         STA   |$0050,X
         LDA   |$00F2,X
         STA   |$0052,X
         LDA   |$00F4,X
         STA   |$0054,X
         LDA   |$00F6,X
         STA   |$0056,X
         LDA   |$00F8,X
         STA   |$0058,X
         LDA   |$00FA,X
         STA   |$005A,X
         LDA   |$00FC,X
         STA   |$005C,X
         LDA   |$00FE,X
         STA   |$005E,X
         LDA   $0100,X
         STA   |$0060,X
         LDA   $0102,X
         STA   |$0062,X
         LDA   $0104,X
         STA   |$0064,X
         LDA   $0106,X
         STA   |$0066,X
         LDA   $0108,X
         STA   |$0068,X
         LDA   $010A,X
         STA   |$006A,X
         LDA   $010C,X
         STA   |$006C,X
         LDA   $010E,X
         STA   |$006E,X
         LDA   $0110,X
         STA   |$0070,X
         LDA   $0112,X
         STA   |$0072,X
         LDA   $0114,X
         STA   |$0074,X
         LDA   $0116,X
         STA   |$0076,X
         LDA   $0118,X
         STA   |$0078,X
         LDA   $011A,X
         STA   |$007A,X
         LDA   $011C,X
         STA   |$007C,X
         LDA   $011E,X
         STA   |$007E,X
         LDA   $0120,X
         STA   |$0080,X
         LDA   $0122,X
         STA   |$0082,X
         LDA   $0124,X
         STA   |$0084,X
         LDA   $0126,X
         STA   |$0086,X
         LDA   $0128,X
         STA   |$0088,X
         LDA   $012A,X
         STA   |$008A,X
         LDA   $012C,X
         STA   |$008C,X
         LDA   $012E,X
         STA   |$008E,X
         LDA   $0130,X
         STA   |$0090,X
         LDA   $0132,X
         STA   |$0092,X
         LDA   $0134,X
         STA   |$0094,X
         LDA   $0136,X
         STA   |$0096,X
         LDA   $0138,X
         STA   |$0098,X
         LDA   $013A,X
         STA   |$009A,X
         LDA   $013C,X
         STA   |$009C,X
         LDA   $013E,X
         STA   |$009E,X
         TXA
         ADC   #$0140
         TAX
         CPX   #$F000
         BCS   LEA44
         BRL   LE857
LEA44    PLX
         PLB
         RTS

LEA47    PHB
         PEA   $0303
         PLB
         PLB
         PHX
         TAX
         CLC
LEA50    LDAL  $040000,X
         STA   |$0000,Y
         LDAL  $040002,X
         STA   |$0002,Y
         LDAL  $040004,X
         STA   |$0004,Y
         LDAL  $040006,X
         STA   |$0006,Y
         LDAL  $040008,X
         STA   |$0008,Y
         LDAL  $04000A,X
         STA   |$000A,Y
         LDAL  $04000C,X
         STA   |$000C,Y
         LDAL  $04000E,X
         STA   |$000E,Y
         LDAL  $040010,X
         STA   |$0010,Y
         LDAL  $040012,X
         STA   |$0012,Y
         LDAL  $040014,X
         STA   |$0014,Y
         LDAL  $040016,X
         STA   |$0016,Y
         LDAL  $040018,X
         STA   |$0018,Y
         LDAL  $04001A,X
         STA   |$001A,Y
         LDAL  $04001C,X
         STA   |$001C,Y
         LDAL  $04001E,X
         STA   |$001E,Y
         LDAL  $040020,X
         STA   |$0020,Y
         LDAL  $040022,X
         STA   |$0022,Y
         LDAL  $040024,X
         STA   |$0024,Y
         LDAL  $040026,X
         STA   |$0026,Y
         LDAL  $040028,X
         STA   |$0028,Y
         LDAL  $04002A,X
         STA   |$002A,Y
         LDAL  $04002C,X
         STA   |$002C,Y
         LDAL  $04002E,X
         STA   |$002E,Y
         LDAL  $040030,X
         STA   |$0030,Y
         LDAL  $040032,X
         STA   |$0032,Y
         LDAL  $040034,X
         STA   |$0034,Y
         LDAL  $040036,X
         STA   |$0036,Y
         LDAL  $040038,X
         STA   |$0038,Y
         LDAL  $04003A,X
         STA   |$003A,Y
         LDAL  $04003C,X
         STA   |$003C,Y
         LDAL  $04003E,X
         STA   |$003E,Y
         LDAL  $040040,X
         STA   |$0040,Y
         LDAL  $040042,X
         STA   |$0042,Y
         LDAL  $040044,X
         STA   |$0044,Y
         LDAL  $040046,X
         STA   |$0046,Y
         LDAL  $040048,X
         STA   |$0048,Y
         LDAL  $04004A,X
         STA   |$004A,Y
         LDAL  $04004C,X
         STA   |$004C,Y
         LDAL  $04004E,X
         STA   |$004E,Y
         TXA
         ADC   #$0140
         TAX
         TYA
         ADC   #$0140
         TAY
         CPY   #$F000
         BCS   LEB7A
         BRL   LEA50
LEB7A    PLX
         PLB
         RTS

LEB7D    PHB
         PEA   $0303
         PLB
         PLB
         PHX
         TAX
         CLC
LEB86    LDAL  $040000,X
         STA   |$0000,Y
         LDAL  $040002,X
         STA   |$0002,Y
         LDAL  $040004,X
         STA   |$0004,Y
         LDAL  $040006,X
         STA   |$0006,Y
         LDAL  $040008,X
         STA   |$0008,Y
         LDAL  $04000A,X
         STA   |$000A,Y
         LDAL  $04000C,X
         STA   |$000C,Y
         LDAL  $04000E,X
         STA   |$000E,Y
         LDAL  $040010,X
         STA   |$0010,Y
         LDAL  $040012,X
         STA   |$0012,Y
         LDAL  $040014,X
         STA   |$0014,Y
         LDAL  $040016,X
         STA   |$0016,Y
         LDAL  $040018,X
         STA   |$0018,Y
         LDAL  $04001A,X
         STA   |$001A,Y
         LDAL  $04001C,X
         STA   |$001C,Y
         LDAL  $04001E,X
         STA   |$001E,Y
         LDAL  $040020,X
         STA   |$0020,Y
         LDAL  $040022,X
         STA   |$0022,Y
         LDAL  $040024,X
         STA   |$0024,Y
         LDAL  $040026,X
         STA   |$0026,Y
         LDAL  $040028,X
         STA   |$0028,Y
         LDAL  $04002A,X
         STA   |$002A,Y
         LDAL  $04002C,X
         STA   |$002C,Y
         LDAL  $04002E,X
         STA   |$002E,Y
         LDAL  $040030,X
         STA   |$0030,Y
         LDAL  $040032,X
         STA   |$0032,Y
         LDAL  $040034,X
         STA   |$0034,Y
         LDAL  $040036,X
         STA   |$0036,Y
         LDAL  $040038,X
         STA   |$0038,Y
         LDAL  $04003A,X
         STA   |$003A,Y
         LDAL  $04003C,X
         STA   |$003C,Y
         LDAL  $04003E,X
         STA   |$003E,Y
         LDAL  $040040,X
         STA   |$0040,Y
         LDAL  $040042,X
         STA   |$0042,Y
         LDAL  $040044,X
         STA   |$0044,Y
         LDAL  $040046,X
         STA   |$0046,Y
         LDAL  $040048,X
         STA   |$0048,Y
         LDAL  $04004A,X
         STA   |$004A,Y
         LDAL  $04004C,X
         STA   |$004C,Y
         LDAL  $04004E,X
         STA   |$004E,Y
         LDAL  $040050,X
         STA   |$0050,Y
         LDAL  $040052,X
         STA   |$0052,Y
         LDAL  $040054,X
         STA   |$0054,Y
         LDAL  $040056,X
         STA   |$0056,Y
         LDAL  $040058,X
         STA   |$0058,Y
         LDAL  $04005A,X
         STA   |$005A,Y
         LDAL  $04005C,X
         STA   |$005C,Y
         LDAL  $04005E,X
         STA   |$005E,Y
         LDAL  $040060,X
         STA   |$0060,Y
         LDAL  $040062,X
         STA   |$0062,Y
         LDAL  $040064,X
         STA   |$0064,Y
         LDAL  $040066,X
         STA   |$0066,Y
         LDAL  $040068,X
         STA   |$0068,Y
         LDAL  $04006A,X
         STA   |$006A,Y
         LDAL  $04006C,X
         STA   |$006C,Y
         LDAL  $04006E,X
         STA   |$006E,Y
         LDAL  $040070,X
         STA   |$0070,Y
         LDAL  $040072,X
         STA   |$0072,Y
         LDAL  $040074,X
         STA   |$0074,Y
         LDAL  $040076,X
         STA   |$0076,Y
         LDAL  $040078,X
         STA   |$0078,Y
         LDAL  $04007A,X
         STA   |$007A,Y
         LDAL  $04007C,X
         STA   |$007C,Y
         LDAL  $04007E,X
         STA   |$007E,Y
         LDAL  $040080,X
         STA   |$0080,Y
         LDAL  $040082,X
         STA   |$0082,Y
         LDAL  $040084,X
         STA   |$0084,Y
         LDAL  $040086,X
         STA   |$0086,Y
         LDAL  $040088,X
         STA   |$0088,Y
         LDAL  $04008A,X
         STA   |$008A,Y
         LDAL  $04008C,X
         STA   |$008C,Y
         LDAL  $04008E,X
         STA   |$008E,Y
         LDAL  $040090,X
         STA   |$0090,Y
         LDAL  $040092,X
         STA   |$0092,Y
         LDAL  $040094,X
         STA   |$0094,Y
         LDAL  $040096,X
         STA   |$0096,Y
         LDAL  $040098,X
         STA   |$0098,Y
         LDAL  $04009A,X
         STA   |$009A,Y
         LDAL  $04009C,X
         STA   |$009C,Y
         LDAL  $04009E,X
         STA   |$009E,Y
         TXA
         ADC   #$0140
         TAX
         TYA
         ADC   #$0140
         TAY
         CPY   #$F000
         BCS   LEDC8
         BRL   LEB86
LEDC8    PLX
         PLB
         RTS

LEDCB    PHB
         PEA   $0303
         PLB
         PLB
         LDX   #$0000
LEDD4    LDA   |$0000,X
         STAL  $040000,X
         INX
         INX
         CPX   #$F000
         BCC   LEDD4
         PLB
         RTS

LEDE4    STA   $70
         STX   $72
         RTS

LEDE9    DB    $00
         DB    $00
LEDEB    DB    $00
         DB    $00
         DB    $00
         DB    $00
LEDEF    DB    $00
         DB    $00

LEDF1    STA   $00
         STX   $02
         STY   $26
         LDA   #$0082	; BRL
         BRA   LEE05
LEDFC    STA   $00
         STX   $02
         STY   $26
         LDA   #$002C	; BIT
LEE05    SEP   #$20
         STA   LEE6C
         REP   #$20
         LDY   $70
         CPY   #$FF80
         BCC   LEE18
         LDY   #$0000
         INC   $72
LEE18    STY   $08
         STY   $0C
         LDY   $72
         STY   $0A
         STY   $0E
         LDA   $6E
         ASL
         ASL
         ADC   $08
         STA   $08
         STZ   LEEDA
LEE2D    LDY   LEEDA
         LDA   #$005C
         STA   [$0C],Y
         INY
         LDA   $08
         STA   [$0C],Y
         INY
         INY
         LDA   $0A
         SEP   #$20
         STA   [$0C],Y
         REP   #$20
         INY
         STY   LEEDA
         LDY   $26
         LDA   ($16),Y
         STA   $20
         INY
         INY
         LDA   ($16),Y
         STA   $22
         STA   $14
         STA   LEDE9
         INY
         INY
         STY   $26
         LDY   #$0003	; PHD TXA TCD CLC
         LDX   #LEFA6
         JSR   LEF9A
         LDX   #$FFFF
         STX   LEDEF
LEE6C    BRL   LEEDC
         LDY   $20
         DEY
         DEY
         LDX   #$0000
LEE76    LDA   [$00],Y
         BEQ   LEE8A
         JSR   LEFD5	; calc value & mask
         STA   $10
         BIT   LEDEF
         BMI   LEE87
         JSR   LEF75	; new line
LEE87    JSR   LEEFF	; output code
LEE8A    INX	; next word
         INX
         DEY
         DEY
         BPL   LEE76

LEE90    LDA   $20	; move source pointer
         CLC
         ADC   $00
         STA   $00
         LDA   #$0000
         ADC   $02
         STA   $02
         DEC   $14	; line--
         BEQ   LEEB5	; exit
         LDA   LEDEF
         BPL   LEEAA
         LDA   #$0000
LEEAA    ADC   #$00A0
         STA   LEDEF
         STA   LEDE9
         BRA   LEE6C	; loop
         
LEEB5    LDY   #$0001	; PLD RTL
         LDX   #LEFAA
         JSR   LEF9A
         DEC   $6E
         BEQ   LEEC5
         BRL   LEE2D
LEEC5    LDA   $70
         LDX   $72
         LDY   $08
         STY   $70
         LDY   $0A
         STY   $72
         LDY   $00
         STY   $74
         LDY   $02
         STY   $76
         RTS

LEEDA    DW    $0000

LEEDC    LDY   #$0000
         TYX
LEEE0    LDA   [$00],Y
         BEQ   LEEF4
         JSR   LEFD5
         STA   $10
         BIT   LEDEF
         BMI   LEEF1
         JSR   LEF75
LEEF1    JSR   LEEFF
LEEF4    INX
         INX
         INY
         INY
         CPY   $20
         BCC   LEEE0
         BRL   LEE90
LEEFF    LDA   $12	; compare previous word
         CMP   LEDEB
         BNE   LEF0D
         LDA   $10
         ORA   LEDE9
         BEQ   LEF46	; same means only a STA is required

LEF0D    LDA   #$00A9	; LDA #
         STA   [$08]
         INC   $08
         LDA   $10
         STA   LEDE9
         BEQ   LEF3B	; if no transparency, skip AND ORA
         STA   [$08]
         INC   $08
         INC   $08
         LDA   #$0025	; AND $xxxx
         STA   [$08]
         INC   $08
         TXA
         STA   [$08]
         INC   $08
         LDA   $12
         STA   LEDEB
         BEQ   LEF46	; if transparent, skip ORA
         LDA   #$0009	; ORA #
         STA   [$08]
         INC   $08
LEF3B    LDA   $12
         STA   LEDEB
         STA   [$08]
         INC   $08
         INC   $08
LEF46    LDA   #$0085	; STA $
         STA   [$08]
         INC   $08
         TXA
         STA   [$08]
         INC   $08
         LDA   $08
         CMP   #$FFF0	; next bank
         BCC   LEF74
         LDA   #$005C	; JMPL $
         STA   [$08]
         INC   $08
         LDA   #$0000
         STA   [$08]
         INC   $08
         INC   $08
         LDA   $0A
         INC
         STA   [$08]
         INC   $08
         STA   $0A
         STZ   $08
LEF74    RTS

LEF75    PHA
         LDA   #$697B	; TDC ADC
         STA   [$08]
         INC   $08
         INC   $08
         LDA   LEDEF
         STA   [$08]
         INC   $08
         INC   $08
         LDA   #$005B	; TCD
         STA   [$08]
         INC   $08
         STA   LEDE9
         LDA   #$FFFF
         STA   LEDEF
         PLA
         RTS

LEF9A    LDA   |$0000,X
         STA   [$08]
         INC   $08
         INX
         DEY
         BPL   LEF9A
         RTS

LEFA6    PHD		; code sprite entry
         TXA
         TCD
         CLC
LEFAA    PLD		; code sprite exit
         RTL

LEFAC    PHX
         TAX
         AND   #$000F
         STA   LEFCB
         TXA
         AND   #$00F0
         STA   LEFCD
         TXA
         AND   #$0F00
         STA   LEFCF
         TXA
         AND   #$F000
         STA   LEFD1
         PLX
         RTS

LEFCB    DW    $000F
LEFCD    DW    $00F0
LEFCF    DW    $0F00
LEFD1    DW    $F000
LEFD3    DW    $0000

LEFD5    PHX
         PHY
         PHA
         LDX   #$0000
         TAY
         BEQ   LF03B
         AND   #$000F
         BEQ   LEFEF
         CMP   LEFCB
         BNE   LEFF4
         TYA
         AND   #$FFF0
         TAY
         BRA   LEFF4
LEFEF    TXA
         ORA   #$000F
         TAX
LEFF4    TYA
         AND   #$00F0
         BEQ   LF006
         CMP   LEFCD
         BNE   LF00B
         TYA
         AND   #$FF0F
         TAY
         BRA   LF00B
LF006    TXA
         ORA   #$00F0
         TAX
LF00B    TYA
         AND   #$0F00
         BEQ   LF01D
         CMP   LEFCF
         BNE   LF022
         TYA
         AND   #$F0FF
         TAY
         BRA   LF022
LF01D    TXA
         ORA   #$0F00
         TAX
LF022    TYA
         AND   #$F000
         BEQ   LF034
         CMP   LEFD1
         BNE   LF03E
         TYA
         AND   #$0FFF
         TAY
         BRA   LF03E
LF034    TXA
         ORA   #$F000
         TAX
         BRA   LF03E
LF03B    LDX   #$FFFF
LF03E    PLA
         BIT   LEFD3
         BPL   LF045
         TAY
LF045    STY   $12
         TXA
         PLY
         PLX
         RTS

LF04B    ASL
         TAY
         LDA   L9FCE,Y
         STA   $00
         LDY   #$0000
         LDA   ($00),Y
         INY
         INY
         STA   $10
         LDA   #$00E1
         STA   $06
LF060    LDA   ($00),Y
         INY
         INY
         CMP   #$FFFF
         BEQ   LF083
         PHY
         STA   $04
         LDY   #$0000
         LDX   $10
LF071    LDAL  $E10000,X
         STA   [$04],Y
         INX
         INX
         INY
         INY
         CPY   #$0020
         BCC   LF071
         PLY
         BRA   LF060
LF083    LDA   ($00),Y
         INY
         INY
         CMP   #$FFFF
         BEQ   LF097
         TAX
         LDA   ($00),Y
         INY
         INY
         STAL  $E10000,X
         BRA   LF083
LF097    LDA   ($00),Y
         INY
         INY
         CMP   #$FFFF
         BEQ   LF0B5
         TAX
LF0A1    LDA   ($00),Y
         INY
         INY
         CMP   #$FFFF
         BEQ   LF097
         SEP   #$20
         STAL  $E10000,X
         REP   #$20
         INX
         BRA   LF0A1
LF0B5    RTS
LF0B6    RTS

LF0B7    ASL
         TAX
         TYA
         BNE   LF0C1
         LDA   LA178,X
         BRA   LF0C4
LF0C1    LDA   LA19C,X
LF0C4    BEQ   LF0B6
         STA   $04
         LDY   #$0000
         LDA   ($04),Y
         PHA
         INY
         INY
         LDA   ($04),Y
         STA   $22
         INY
         INY
         LDA   ($04),Y
         CLC
         ADC   #$9E20
         STA   $00
         LDA   #$0001
         STA   $02
         INY
         INY
         TYA
         CLC
         ADC   $04
         STA   LF14E+1
         PLY
         LDX   #$001E
LF0F0    LDAL  $019E00,X
         STAL  $019E20,X
         STAL  $019E40,X
         STAL  $019E60,X
         STAL  $019E80,X
         STAL  $019EA0,X
         STAL  $019EC0,X
         STAL  $019EE0,X
         STAL  $019F00,X
         STAL  $019F20,X
         STAL  $019F40,X
         STAL  $019F60,X
         STAL  $019F80,X
         STAL  $019FA0,X
         STAL  $019FC0,X
         STAL  $019FE0,X
         DEX
         DEX
         BPL   LF0F0
         TYX
         PHX
         LDA   #$0000
LF139    STAL  $019D00,X
         INX
         INX
         CPX   #$00CE
         BCC   LF139
         PLX
         LDA   #$0001
         STA   $26
         STZ   $10
LF14C    LDY   $10
LF14E    LDA   $FFFF,Y
         BMI   LF175
         STA   [$00]
         INC   $10
         INC   $10
         LDA   $00
         CLC
         ADC   #$0020
         STA   $00
         LDY   $22
         SEP   #$20
         LDA   $26
LF167    STAL  $019D00,X
         INX
         DEY
         BPL   LF167
         REP   #$20
         INC   $26
         BRA   LF14C
LF175    RTS

LF176    LDA   $6A
         ASL
         TAY
         LDA   LA23E,Y
         STA   $00
         LDY   #$0000
         TYX
LF183    LDA   ($00),Y
         INY
         INY
         STAL  $019D00,X
         INX
         INX
         CPY   #$0008
         BCC   LF183
LF192    LDA   ($00),Y
         INY
         INY
         TAX
         BMI   LF1A3
         LDA   ($00),Y
         INY
         INY
         STAL  $019E1E,X
         BRA   LF192
LF1A3    RTS

LF1A4    JSR   LF30F
         STX   $10
         LDA   #$00A0
         STA   $22
         LDA   #$0000
         LDX   #$0001
         BRL   LF240
         
LF1B7    JSR   LF30F
         STX   $10
         LDA   #$00A0
         STA   $22
         LDA   #$0000
         LDX   #$00E1
         BRL   LF240

LF1CA    DW    $0000

LF1CC    JSR   LF30F
         LDA   ($00),Y
         AND   #$00FF
         ASL
         ASL
         ADC   #$0004
         AND   #$FFFC
         STA   $22
         ASL
         ASL
         ASL
         ADC   $22
         TAX
         PHX
         LDA   LF1CA
LF1E8    STAL  ptr001400,X
         DEX
         DEX
         BPL   LF1E8
         LDX   #$FFFF
         STX   $26
         LDA   #ptr001400	; bank $00/1400
         LDX   #^ptr001400
         STZ   $10
         JSR   LF240
         PLX
         LDA   LF1CA
         BEQ   LF215
LF206    LDAL  ptr001400,X
         EOR   LF1CA
         STAL  ptr001400,X
         DEX
         DEX
         BPL   LF206
LF215    LDA   $24
         PHA
         LDX   $22
         STX   LF23B
         LDX   #$0009
         STX   LF23D
         LDX   #$0001
         STX   $6E
         LDX   #LF23B
         STX   $16
         LDA   #ptr001400	; bank $00/1400
         LDX   #^ptr001400
         LDY   #$0000
         JSR   LEDF1
         PLY
         RTS

LF23B    DB    $00
         DB    $00
LF23D    DB    $00
         DB    $00

LF23F    RTS

LF240    STA   LF2DE+1
         STA   LF2E8+1
         INC
         INC
         STA   LF2BF+1
         STA   LF2C9+1
         TXA
         SEP   #$20
         STA   LF2BF+3
         STA   LF2C9+3
         STA   LF2DE+3
         STA   LF2E8+3
         REP   #$20
         LDX   $10
         STZ   $24
LF263    LDA   ($00),Y
         AND   #$00FF
         CMP   #$00FF
         BEQ   LF23F
         PHX
         STA   $10
         STX   $12
         INY
         PHY
         TYA
         CLC
         ADC   $10
         TAY
         LDA   ($00),Y
         AND   #$00FF
         BNE   LF293
         LDA   $10
         ASL
         EOR   #$FFFF
         CLC
         ADC   #$0050
         BIT   $26
         BPL   LF293
         STA   $24
         LDA   #$0000
LF293    PLY
         ADC   $12
         TAX
LF297    LDA   ($00),Y
         AND   #$00FF
         SEC
         SBC   #$00A0
         BEQ   LF2F8
         ASL
         PHY
         TAY
         LDA   L9E90,Y
         TAY
         CLC
         PHX
         LDA   #$0008
         STA   $12
LF2B0    LDA   [$EC],Y
         EOR   #$FFFF
         AND   $8A
         STA   $14
         LDA   [$E8],Y
         AND   $E4
         STA   $16
LF2BF    LDAL  $010002,X
         AND   [$EC],Y
         ORA   $14
         ORA   $16
LF2C9    STAL  $010002,X
         INY
         INY
         LDA   [$EC],Y
         EOR   #$FFFF
         AND   $8A
         STA   $14
         LDA   [$E8],Y
         AND   $E4
         STA   $16
LF2DE    LDAL  $010000,X
         AND   [$EC],Y
         ORA   $14
         ORA   $16
LF2E8    STAL  $010000,X
         INY
         INY
         TXA
         ADC   $22
         TAX
         DEC   $12
         BPL   LF2B0
         PLX
         PLY
LF2F8    INX
         INX
         INX
         INX
         INY
         DEC   $10
         BNE   LF297
         PLA
         BIT   $26
         BMI   LF30E
         CLC
         ADC   $26
         TAX
         INY
         BRL   LF263
LF30E    RTS

LF30F    STA   $00
         TYA
         ASL
         TAY
         LDA   ($00),Y
         STA   $00
         LDY   #$0640
         STY   $26
         LDY   #$0000
         LDA   ($00),Y
         BMI   LF328
         STA   $26
         INY
         INY
LF328    RTS

LF329    STA   $E4
         STX   $8A
         RTS

LF32E    STA   $02
         LDX   #$0050
         STX   $90
         LDX   #$2784
         STX   $00
         LDX   #$0000
         TXY
         CLC
LF33F    LDA   LA2BA+6,X
         STA   [$00],Y
         INY
         INY
         LDA   LA2BA+4,X
         STA   [$00],Y
         INY
         INY
         LDA   LA2BA+2,X
         STA   [$00],Y
         INY
         INY
         LDA   LA2BA,X
         STA   [$00],Y
         INY
         INY
         TYA
         ADC   #$0098
         TAY
         TXA
         ADC   #$0008
         TAX
         CPX   #$0280
         BCC   LF33F
         RTS

*
* DISPLAY STRENGTH THERMOMETER
*

LF36B    PHB
         PHA
         LDA   #$004F
         SEC
         SBC   $90
         CLC
         ADC   #$000C
         ASL
         TAY
         LDX   L9D00,Y
         PLA
         SEP   #$20
         PHA
         PLB
         REP   #$20
LF383    LDA   |$0004,X
         AND   #$F0F0
         STA   |$0004,X
         LDA   |$0006,X
         AND   #$F0F0
         STA   |$0006,X
         LDA   |$0008,X
         AND   #$F0F0
         STA   |$0008,X
         LDA   |$000A,X
         AND   #$F0F0
         STA   |$000A,X
         LDA   $90
         CMP   $8C
         BEQ   LF3B8
         BCC   LF3B8
         DEC   $90
         TXA
         ADC   #$009F
         TAX
         BRA   LF383
LF3B8    PLB
         RTS

LF3BA    ASL
         TAY
         LDA   L9EB0,Y
         TAY
         LDA   #$0006
         STA   $10
LF3C5    LDA   [$E8],Y
         STAL  $E10002,X
         INY
         INY
         LDA   [$E8],Y
         STAL  $E10000,X
         INY
         INY
         TXA
         ADC   #$00A0
         TAX
         DEC   $10
         BPL   LF3C5
         RTS

LF3DF    STX   $02
         PHA
         ASL
         TAX
         LDA   LA63A,X
         STA   $00
         LDX   #$000F
         STX   $10
         TYA
         BEQ   LF3F4
         LDA   #$0080
LF3F4    TAX
         LDY   #$0000
         CLC
LF3F9    LDA   LA53A+6,X
         STA   [$00],Y
         INY
         INY
         LDA   LA53A+4,X
         STA   [$00],Y
         INY
         INY
         LDA   LA53A+2,X
         STA   [$00],Y
         INY
         INY
         LDA   LA53A,X
         STA   [$00],Y
         INY
         INY
         TYA
         ADC   #$0098
         TAY
         TXA
         ADC   #$0008
         TAX
         DEC   $10
         BPL   LF3F9
         PLA
         ASL
         STA   $10
         ASL
         ASL
         ADC   $10
         TAX
         TYA
         ADC   #$00A3
         TAY
         LDA   LA642,X
         STA   [$00],Y
         TYA
         ADC   #$00A0
         TAY
         LDA   LA644,X
         STA   [$00],Y
         TYA
         ADC   #$00A0
         TAY
         LDA   LA646,X
         STA   [$00],Y
         TYA
         ADC   #$00A0
         TAY
         LDA   LA648,X
         STA   [$00],Y
         TYA
         ADC   #$00A0
         TAY
         LDA   LA64A,X
         STA   [$00],Y
         RTS

LF45F    PHB
         ASL
         TAY
         LDX   LA63A,Y
         PEA   $E1E1
         PLB
         PLB
         LDY   #$0015
         CLC
LF46E    STZ   |$0000,X
         STZ   |$0002,X
         STZ   |$0004,X
         STZ   |$0006,X
         TXA
         ADC   #$00A0
         TAX
         DEY
         BPL   LF46E
         PLB
         RTS

LF484    LDA   #$FFFF
         STA   LEFD3
         LDA   #$000B
         STA   $10
         TYA
         BEQ   LF495
         LDY   #$0048
LF495    LDA   LB680,Y
         JSR   LEFD5
         ANDL  $010004,X
         ORA   $12
         STAL  $010004,X
         INY
         INY
         LDA   LB680,Y
         JSR   LEFD5
         ANDL  $010002,X
         ORA   $12
         STAL  $010002,X
         INY
         INY
         LDA   LB680,Y
         JSR   LEFD5
         ANDL  $010000,X
         ORA   $12
         STAL  $010000,X
         INY
         INY
         TXA
         CLC
         ADC   #$00A0
         TAX
         DEC   $10
         BPL   LF495
         RTS

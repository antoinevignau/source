*----------------------------------------
* True Convert : About
*----------------------------------------

FirstHandle = $E11600

*--------------

meABOUT lda wiABOUT
 ora wiABOUT+2
 beq meABOUT1

 PushLong wiABOUT
 _SelectWindow
 rts

meABOUT1 pha
 pha
 PushLong #0
 PushLong #wABOUT
 PushLong #PAINTABOUT
 PushLong #0
 PushWord #refIsResource
 PushLong #wABOUT
 PushWord #$800e
 _NewWindow2
 PullLong wiABOUT

*--------------

 pha
 pha
 _TotalMem
 pla
 sta L0C0270
 pla
 sta L0C0270+2
 ldx #$0009
]lp lsr L0C0270+2
 ror L0C0270
 dex
 bpl ]lp
 lda L0C0270
 pha
 pea ^L0C0293
 pea L0C0293
 pea $0005
 pea $0000
 _Int2Dec

 pha
 pha
 _RealFreeMem
 pla
 sta L0C0274
 pla
 sta L0C0274+2
 ldx #$0009
]lp lsr L0C0274+2
 ror L0C0274
 dex
 bpl ]lp
 lda L0C0274
 pha
 pea ^L0C029A
 pea L0C029A
 pea $0005
 pea $0000
 _Int2Dec

 jsl L0C046F

 ldx #$0009
]lp lsr L0C027A
 ror L0C0278
 lsr L0C027E
 ror L0C027C
 lsr L0C0282
 ror L0C0280
 lsr L0C0286
 ror L0C0284
 dex
 bpl ]lp

 lda L0C0274
 sta L0C0288
 lda L0C0278
 sta L0C028A
 lda L0C027C
 sta L0C028C
 lda L0C0280
 sta L0C028E
 lda L0C0284
 sta L0C0290

 lda L0C0278
 pha
 pea ^L0C02A1
 pea L0C02A1
 pea $0005
 pea $0000
 _Int2Dec
 lda L0C027C
 pha
 pea ^L0C02A8
 pea L0C02A8
 pea $0005
 pea $0000
 _Int2Dec
 lda L0C0280
 pha
 pea ^L0C02AF
 pea L0C02AF
 pea $0005
 pea $0000
 _Int2Dec
 lda L0C0284
 pha
 pea ^L0C02B6
 pea L0C02B6
 pea $0005
 pea $0000
 _Int2Dec

 pha
 pha
 pea $8029
 pea $0000
 pea $0001
 _LoadResource
 pla
 sta L0C02BC
 pla
 sta L0C02BC+2
 pea $8029
 pea $0000
 pea $0001
 _DetachResource
 lda L0C02BC
 sta $01
 lda L0C02BC+2
 sta $03
 lda [$01]
 tax
 ldy #$0002
 lda [$01],Y
 stx $01
 stx L0C02C0
 sta $03
 sta L0C02C0+2
 pea $0000
 ldy #$0002
 lda [$01],Y
 pha
 lda [$01]
 pha
 pea ^L0C02CC
 pea L0C02CC
 _VersionString

 pha
 pha
 pea $8029
 pea $0000
 pea $0001
 _LoadResource
 pla
 sta L0C02C4
 pla
 sta L0C02C4+2
 pea $8029
 pea $0000
 pea $0001
 _DetachResource
 lda L0C02C4
 sta $01
 lda L0C02C4+2
 sta $03
 ldy #$0004
 lda [$01],Y
 ora #$8000
 sta [$01],Y
 lda [$01]
 tax
 ldy #$0002
 lda [$01],Y
 stx $01
 stx L0C02C8
 sta $03
 sta L0C02C8+2
 pea $0000
 ldy #$0002
 lda [$01],Y
 pha
 lda [$01]
 pha
 pea ^L0C02E0
 pea L0C02E0
 _VersionString

 PushLong wiABOUT
 _ShowWindow
 rts

*--------------

wiABOUT ds 4

L0C0270 adrl $00000000
L0C0274 adrl $00000000
L0C0278 dw $0000
L0C027A dw $0000
L0C027C dw $0000
L0C027E dw $0000
L0C0280 dw $0000
L0C0282 dw $0000
L0C0284 dw $0000
L0C0286 dw $0000
L0C0288 dw $0000
L0C028A dw $0000
L0C028C dw $0000
L0C028E dw $0000
L0C0290 dw $0000
L0C0292 db $06
L0C0293 asc '     K'
L0C0299 db $06
L0C029A asc '     K'
L0C02A0 db $06
L0C02A1 asc '     K'
L0C02A7 db $06
L0C02A8 asc '     K'
L0C02AE db $06
L0C02AF asc '     K'
L0C02B5 db $06
L0C02B6 asc '     K'
L0C02BC ent
 dw $0000
L0C02BE ent
 dw $0000
L0C02C0 adrl $00000000
L0C02C4 ent
 dw $0000
L0C02C6 ent
 dw $0000
L0C02C8 adrl $00000000
L0C02CC ds $14
L0C02E0 ds $14

*--------------

L0C046F phb
 phk
 plb
 pha
 _MMStartUp
 pla
 sta L0C04D1
 php
 sei
 phd
 pha
 pha
 tsc
 tcd
 stz L0C0278
 stz L0C027A
 stz L0C027C
 stz L0C027E
 stz L0C0280
 stz L0C0282
 stz L0C0284
 stz L0C0286
 ldal FirstHandle
 sta $01
 ldal FirstHandle+2
 sta $03

L0C04A9 ldy #$0004
 lda [$01],Y
 bmi L0C04B5
 and #$0300
 bne L0C04F3
L0C04B5 ldy #$0006
 lda [$01],Y
 beq L0C04F3
 tax
 eor L0C04D1
 and #$F0FF
 beq L0C0511
 txa
 and #$F000
 xba
 lsr
 lsr
 lsr
 tax
 jmp (L0C04D3,X)

L0C04D1 dw $0000
L0C04D3 da L0C0529
 da L0C04F3
 da L0C04F3
 da L0C0529
 da L0C0529
 da L0C0541
 da L0C0529
 da L0C0529
 da L0C0529
 da L0C0529
 da L0C0559
 da L0C04F3
 da L0C04F3
 da L0C04F3
 da L0C04F3
 da L0C04F3

L0C04F3 ldy #$0010
 lda [$01],Y
 tax
 bne L0C0507
 iny
 iny
 lda [$01],Y
 beq L0C0571
 stx $01
 sta $03
 bra L0C04A9

L0C0507 iny
 iny
 lda [$01],Y
 stx $01
 sta $03
 bra L0C04A9

L0C0511 ldy #$0008
 lda [$01],Y
 clc
 adc L0C0278
 sta L0C0278
 iny
 iny
 lda [$01],Y
 adc L0C027A
 sta L0C027A
 bra L0C04F3

L0C0529 ldy #$0008
 lda [$01],Y
 clc
 adc L0C027C
 sta L0C027C
 iny
 iny
 lda [$01],Y
 adc L0C027E
 sta L0C027E
 bra L0C04F3

L0C0541 ldy #$0008
 lda [$01],Y
 clc
 adc L0C0280
 sta L0C0280
 iny
 iny
 lda [$01],Y
 adc L0C0282
 sta L0C0282
 bra L0C04F3

L0C0559 ldy #$0008
 lda [$01],Y
 clc
 adc L0C0284
 sta L0C0284
 iny
 iny
 lda [$01],Y
 adc L0C0286
 sta L0C0286
 bra L0C04F3

L0C0571 lda #$5000
 clc
 adc L0C027C
 sta L0C027C
 lda #$0001
 adc L0C027E
 sta L0C027E
 pla
 pla
 pld
 plp
 plb
 rtl

*--------------

PAINTABOUT phb
 phk
 plb
 phd
 pha
 pha
 tsc
 tcd
 pea ^L0C073D
 pea L0C073D
 _EraseRect
 PushLong wiABOUT
 _DrawControls
 lda L0C02C8
 sta $01
 lda L0C02C8+2
 sta $03
 pea $0078
 pea $0018
 _MoveTo
 ldy #$0006
 lda [$01],Y
 and #$00FF
 clc
 adc $01
 tax
 lda $03
 adc #$0000
 tay
 txa
 clc
 adc #$0007
 tax
 tya
 adc #$0000
 pha
 phx
 _DrawString
 pea $0078
 pea $000D
 _MoveTo
 lda L0C02C8
 clc
 adc #$0006
 tax
 lda L0C02C8+2
 adc #$0000
 pha
 phx
 _DrawString
 pea $0004
 pea $0000
 _Move
 pea ^L0C02E0
 pea L0C02E0
 _DrawString
 pha
 pea ^L0C0292
 pea L0C0292
 _StringWidth
 lda #$00C3
 sec
 sbc $01,S
 sta $01,S
 pea $0026
 _MoveTo
 pea ^L0C0292
 pea L0C0292
 _DrawString
 pha
 pea ^L0C0299
 pea L0C0299
 _StringWidth
 lda #$0199
 sec
 sbc $01,S
 sta $01,S
 pea $0026
 _MoveTo
 pea ^L0C0299
 pea L0C0299
 _DrawString
 pha
 pea ^L0C02A0
 pea L0C02A0
 _StringWidth
 lda #$00C3
 sec
 sbc $01,S
 sta $01,S
 pea $0035
 _MoveTo
 pea ^L0C02A0
 pea L0C02A0
 _DrawString
 pha
 pea ^L0C02AE
 pea L0C02AE
 _StringWidth
 lda #$0199
 sec
 sbc $01,S
 sta $01,S
 pea $0035
 _MoveTo
 pea ^L0C02AE
 pea L0C02AE
 _DrawString
 pha
 pea ^L0C02A7
 pea L0C02A7
 _StringWidth
 lda #$00C3
 sec
 sbc $01,S
 sta $01,S
 pea $0040
 _MoveTo
 pea ^L0C02A7
 pea L0C02A7
 _DrawString
 pha
 pea ^L0C02B5
 pea L0C02B5
 _StringWidth
 lda #$0199
 sec
 sbc $01,S
 sta $01,S
 pea $0040
 _MoveTo
 pea ^L0C02B5
 pea L0C02B5
 _DrawString
 pla
 pla
 pld
 plb
 rtl

*--------------

L0C073D dw $001A
 dw $008C
 dw $0042
 dw $01EA

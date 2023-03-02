*
* HypercardGS
* segment: $1B HyperPaint
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HyperPaint.l
         lst   off

*---------------------------------------

         use   HyperPaint.E
         use   HyperPaint.X

         use   4/Ctl.Macs
         use   4/Desk.Macs
         use   4/Dialog.Macs
         use   4/Event.Macs
         use   4/Int.Macs
         use   4/Line.Macs
         use   4/List.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/MidiSyn.Macs
         use   4/Misc.Macs
         use   4/Qd.Macs
         use   4/Sound.Macs
         use   4/Std.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*---------------------------------------

L1B0000  ENT
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $3F
         DB    $C0
         DB    $3F
         DB    $C0
         DB    $3F
         DB    $C0
         DB    $3F
         DB    $C0
         DB    $3F
         DB    $C0
         DB    $3F
         DB    $C0
         DB    $3F
         DB    $C0
         DB    $3F
         DB    $C0
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
         DB    $0F
         DB    $00
         DB    $0F
         DB    $00
         DB    $0F
         DB    $00
         DB    $0F
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
         DB    $06
         DB    $00
         DB    $06
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
         DB    $0F
         DB    $00
         DB    $3F
         DB    $C0
         DB    $7F
         DB    $E0
         DB    $7F
         DB    $E0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $7F
         DB    $E0
         DB    $7F
         DB    $E0
         DB    $3F
         DB    $C0
         DB    $0F
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $00
         DB    $1F
         DB    $80
         DB    $3F
         DB    $C0
         DB    $3F
         DB    $C0
         DB    $3F
         DB    $C0
         DB    $3F
         DB    $C0
         DB    $1F
         DB    $80
         DB    $0F
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
         DB    $06
         DB    $00
         DB    $0F
         DB    $00
         DB    $0F
         DB    $00
         DB    $06
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
         DB    $02
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
         DB    $30
         DB    $00
         DB    $60
         DB    $00
         DB    $C0
         DB    $01
         DB    $80
         DB    $03
         DB    $00
         DB    $06
         DB    $00
         DB    $0C
         DB    $00
         DB    $18
         DB    $00
         DB    $30
         DB    $00
         DB    $60
         DB    $00
         DB    $C0
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $60
         DB    $00
         DB    $C0
         DB    $01
         DB    $80
         DB    $03
         DB    $00
         DB    $06
         DB    $00
         DB    $0C
         DB    $00
         DB    $18
         DB    $00
         DB    $30
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
         DB    $01
         DB    $80
         DB    $03
         DB    $00
         DB    $06
         DB    $00
         DB    $0C
         DB    $00
         DB    $18
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
         DB    $03
         DB    $00
         DB    $06
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
         DB    $C0
         DB    $00
         DB    $60
         DB    $00
         DB    $30
         DB    $00
         DB    $18
         DB    $00
         DB    $0C
         DB    $00
         DB    $06
         DB    $00
         DB    $03
         DB    $00
         DB    $01
         DB    $80
         DB    $00
         DB    $C0
         DB    $00
         DB    $60
         DB    $00
         DB    $30
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $30
         DB    $00
         DB    $18
         DB    $00
         DB    $0C
         DB    $00
         DB    $06
         DB    $00
         DB    $03
         DB    $00
         DB    $01
         DB    $80
         DB    $00
         DB    $C0
         DB    $00
         DB    $60
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
         DB    $18
         DB    $00
         DB    $0C
         DB    $00
         DB    $06
         DB    $00
         DB    $03
         DB    $00
         DB    $01
         DB    $80
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
         DB    $06
         DB    $00
         DB    $03
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
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
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
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
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
         DB    $02
         DB    $00
         DB    $02
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
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
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
         DB    $3F
         DB    $C0
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
         DB    $0F
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
         DB    $06
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
         DB    $20
         DB    $00
         DB    $00
         DB    $00
         DB    $80
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $20
         DB    $00
         DB    $00
         DB    $00
         DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $80
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $20
         DB    $00
         DB    $00
         DB    $00
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $20
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
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $02
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
         DB    $49
         DB    $20
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
         DB    $04
         DB    $00
         DB    $00
         DB    $00
         DB    $40
         DB    $10
         DB    $00
         DB    $00
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $04
         DB    $10
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $20
         DB    $40
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $04
         DB    $00
         DB    $10
         DB    $80
         DB    $02
         DB    $00
         DB    $00
         DB    $40
         DB    $24
         DB    $00
         DB    $00
         DB    $00
         DB    $10
         DB    $80
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $7F
         DB    $F0
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $06
         DB    $00
         DB    $00
         DB    $00
         DB    $07
         DB    $00
         DB    $07
         DB    $00
         DB    $07
         DB    $00
         DB    $07
         DB    $00
         DB    $7F
         DB    $F0
         DB    $7F
         DB    $F0
         DB    $7F
         DB    $F0
         DB    $07
         DB    $00
         DB    $07
         DB    $00
         DB    $07
         DB    $00
         DB    $07
         DB    $00
         DB    $0F
         DB    $00
         DB    $0F
         DB    $00
         DB    $0F
         DB    $00
         DB    $0F
         DB    $00
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $0F
         DB    $00
         DB    $0F
         DB    $00
         DB    $0F
         DB    $00
         DB    $0F
         DB    $00
         DB    $1F
         DB    $80
         DB    $1F
         DB    $80
         DB    $1F
         DB    $80
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $F0
         DB    $1F
         DB    $80
         DB    $1F
         DB    $80
         DB    $1F
         DB    $80
         DB    $02
         DB    $00
         DB    $10
         DB    $00
         DB    $00
         DB    $80
         DB    $08
         DB    $00
         DB    $81
         DB    $20
         DB    $04
         DB    $00
         DB    $20
         DB    $00
         DB    $01
         DB    $10
         DB    $08
         DB    $40
         DB    $40
         DB    $00
         DB    $00
         DB    $80
         DB    $04
         DB    $00

L1B0390  ENT
         PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         LDA   $0E
         AND   #$0007
         STA   $01
         ASL
         ADC   $01
         ASL
         ASL
         STA   $01
         LDA   #$FFF4
         SEC
         SBC   $01
         STAL  L1B042A+1
         LDA   $0E
         LSR
         LSR
         LSR
         STA   $03
         LDY   #$0000
L1B03B8  LDX   $03
         STX   $05
         BNE   L1B03C1
         BRL   L1B042A
L1B03C1  LDA   [$16],Y
         TAX
         LDA   [$12],Y
         STA   [$16],Y
         TXA
         STA   [$12],Y
         INY
         INY
         LDA   [$16],Y
         TAX
         LDA   [$12],Y
         STA   [$16],Y
         TXA
         STA   [$12],Y
         INY
         INY
         LDA   [$16],Y
         TAX
         LDA   [$12],Y
         STA   [$16],Y
         TXA
         STA   [$12],Y
         INY
         INY
         LDA   [$16],Y
         TAX
         LDA   [$12],Y
         STA   [$16],Y
         TXA
         STA   [$12],Y
         INY
         INY
         LDA   [$16],Y
         TAX
         LDA   [$12],Y
         STA   [$16],Y
         TXA
         STA   [$12],Y
         INY
         INY
         LDA   [$16],Y
         TAX
         LDA   [$12],Y
         STA   [$16],Y
         TXA
         STA   [$12],Y
         INY
         INY
         LDA   [$16],Y
         TAX
         LDA   [$12],Y
         STA   [$16],Y
         TXA
         STA   [$12],Y
         INY
         INY
         LDA   [$16],Y
         TAX
         LDA   [$12],Y
         STA   [$16],Y
         TXA
         STA   [$12],Y
         INY
         INY
         DEC   $05
         BMI   L1B042D
         BEQ   L1B042A
         BRL   L1B03C1
L1B042A  BRL   L1B042A
L1B042D  DEC   $10
         BEQ   L1B0439
         TYA
         CLC
         ADC   $0C
         TAY
         BRL   L1B03B8
L1B0439  LDA   $0A
         STA   $18
         LDA   $09
         STA   $17
         LDX   $07
         TDC
         CLC
         ADC   #$0016
         TCS
         TXA
         TCD
         RTL

L1B044C  DB    $00
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
	
L1B06A4	ENT
         PHD
         TSC
         SEC
         SBC   #$0016
         TCD
         TCS
         LDA   [$1C]
         STA   $01
         STA   L0550A1
         LDY   #$0002
         LDA   [$1C],Y
         STA   $03
         STA   L0550A3
         PHA
         TAX
         LDA   $01
         CLC
         ADC   #$0002
         BCC   L1B06C8
         INX
L1B06C8  PHX
         PHA
         PEI   $22
         PEI   $20
         PEA   ^L052F3F
         PEA   L052F3F
         _SectRect
         PLA
         BNE   L1B06E1
         BRL   L1B07E2
L1B06E1  LDA   L052F41
         AND   #$FFF0
         STA   L052F41
         LSR
         LSR
         STA   $09
         LDA   L052F45
         CLC
         ADC   #$000F
         AND   #$FFF0
         STA   L052F45
         LSR
         LSR
         STA   $0B
         SEC
         SBC   $09
         STA   $0D
         LSR
         LSR
         STA   $0F
         JSL   L081BAC
         LDA   L052F3F
         STA   $13
         JSL   L082758
         TAX
         CLC
         ADC   $28
         STA   $28
         BCC   L1B071F
         INC   $2A
L1B071F  TXA
         CLC
         ADC   $24
         STA   $24
         BCC   L1B0729
         INC   $26
L1B0729  LDA   $13
         AND   #$0007
         ASL
         ASL
         TAX
         LDAL  L054F6B,X
         STA   $05
         LDAL  L054F6D,X
         STA   $07
         LDA   $13
         CMP   L05509D
         BCC   L1B074B
         STA   L05509F
         JSL   L0825D4
L1B074B  LDA   L05509B
         BPL   L1B0753
         BRL   L1B07BE
L1B0753  BEQ   L1B077C
         PHB
         PEI   $25
         PLB
         PLB
         LDX   $0F
         LDY   $09
L1B075E  LDA   ($24),Y
         EOR   $05
         AND   [$28],Y
         EOR   $05
         STA   ($24),Y
         INY
         INY
         LDA   ($24),Y
         EOR   $07
         AND   [$28],Y
         EOR   $07
         STA   ($24),Y
         INY
         INY
         DEX
         BNE   L1B075E
         PLB
         BRA   L1B07BE
L1B077C  PHB
         PEI   $25
         PLB
         PLB
         LDA   $0F
         STA   $11
         LDY   $09
         TYX
L1B0788  LDAL  L052E9F,X
         ORA   [$28],Y
         INC
         BEQ   L1B079E
         DEC
         STA   $15
         LDA   ($24),Y
         EOR   $05
         AND   $15
         EOR   $05
         STA   ($24),Y
L1B079E  INY
         INY
         LDAL  L052EA1,X
         ORA   [$28],Y
         INC
         BEQ   L1B07B6
         DEC
         STA   $15
         LDA   ($24),Y
         EOR   $07
         AND   $15
         EOR   $07
         STA   ($24),Y
L1B07B6  INY
         INY
         TYX
         DEC   $11
         BNE   L1B0788
         PLB
L1B07BE  LDA   #$00A0
         CLC
         ADC   $28
         STA   $28
         BCC   L1B07CA
         INC   $2A
L1B07CA  LDA   #$00A0
         CLC
         ADC   $24
         STA   $24
         BCC   L1B07D6
         INC   $26
L1B07D6  INC   $13
         LDA   $13
         CMP   L052F43
         BEQ   L1B07E2
         BRL   L1B0729
L1B07E2  LDA   $1A
         STA   $2A
         LDA   $19
         STA   $29
         LDX   $17
         TDC
         CLC
         ADC   #$0028
         TCS
         TXA
         TCD
         RTL

L1B07F5  ENT
         PHB
         PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         LDA   $0F
         AND   #$0007
         STA   $01
         ASL
         ASL
         ADC   $01
         ASL
         STA   $01
         LDA   #$FFF4
         SEC
         SBC   $01
         STAL  L1B089C+1
         LDA   $0F
         LSR
         LSR
         LSR
         STA   $03
         SEC
         LDA   $1B
         SBC   $13
         STA   $1B
         BCS   L1B0826
         DEC   $1D
L1B0826  SEC
         LDA   $17
         SBC   $13
         STA   $17
         BCS   L1B0831
         DEC   $19
L1B0831  LDY   $13
         PEI   $14
         PLB
         PLB
         LDX   #$FFFF
L1B083A  LDA   $03
         STA   $05
         BNE   L1B0843
         BRL   L1B089C
L1B0843  TXA
         EOR   [$1B],Y
         AND   [$17],Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$1B],Y
         AND   [$17],Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$1B],Y
         AND   [$17],Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$1B],Y
         AND   [$17],Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$1B],Y
         AND   [$17],Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$1B],Y
         AND   [$17],Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$1B],Y
         AND   [$17],Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$1B],Y
         AND   [$17],Y
         STA   |$0000,Y
         INY
         INY
         DEC   $05
         BMI   L1B089F
         BEQ   L1B089C
         BRL   L1B0843
L1B089C  BRL   L1B089C
L1B089F  DEC   $11
         BEQ   L1B08AB
         TYA
         CLC
         ADC   $0D
         TAY
         BRL   L1B083A
L1B08AB  LDA   $0B
         STA   $1D
         LDA   $09
         STA   $1B
         LDX   $07
         TDC
         CLC
         ADC   #$001A
         TCS
         TXA
         TCD
         PLB
         RTL

L1B08BF  PHB
         PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         LDA   $0F
         AND   #$000F
         STA   $01
         ASL
         ASL
         ADC   $01
         ASL
         ASL
         ADC   $01
         STA   $01
         LDA   #$FFF4
         SEC
         SBC   $01
         STAL  L1B0A7D+1
         LDA   $0F
         LSR
         LSR
         LSR
         LSR
         STA   $03
         SEC
         LDA   $1F
         SBC   $13
         STA   $1F
         BCS   L1B08F4
         DEC   $21
L1B08F4  SEC
         LDA   $1B
         SBC   $13
         STA   $1B
         BCS   L1B08FF
         DEC   $1D
L1B08FF  SEC
         LDA   $23
         SBC   $13
         STA   $23
         BCS   L1B090A
         DEC   $25
L1B090A  SEC
         LDA   $17
         SBC   $13
         STA   $17
         BCS   L1B0915
         DEC   $19
L1B0915  LDY   $13
         PEI   $14
         PLB
         PLB
L1B091B  LDX   $03
         STX   $05
         BNE   L1B0924
         BRL   L1B0A7D
L1B0924  LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         LDA   [$23],Y
         TAX
         ORA   [$1F],Y
         AND   [$1B],Y
         STA   $01
         TXA
         EOR   $01
         AND   [$17],Y
         EOR   $01
         STA   |$0000,Y
         INY
         INY
         DEC   $05
         BMI   L1B0A80
         BEQ   L1B0A7D
         BRL   L1B0924
L1B0A7D  BRL   L1B0A7D
L1B0A80  DEC   $11
         BEQ   L1B0A8C
         TYA
         CLC
         ADC   $0D
         TAY
         BRL   L1B091B
L1B0A8C  LDA   $0B
         STA   $25
         LDA   $09
         STA   $23
         LDX   $07
         TDC
         CLC
         ADC   #$0022
         TCS
         TXA
         TCD
         PLB
         RTL

L1B0AA0  PHB
         PHD
         PHY
         PHY
         TSC
         TCD
         LDA   $0D
         AND   #$000F
         STA   $01
         ASL
         ASL
         ASL
         ASL
         SEC
         SBC   $01
         STA   $01
         LDA   #$FFF5
         SEC
         SBC   $01
         STAL  L1B0C04+1
         LDA   $0D
         LSR
         LSR
         LSR
         LSR
         STA   $03
         SEC
         LDA   $21
         SBC   $11
         STA   $21
         BCS   L1B0AD3
         DEC   $23
L1B0AD3  SEC
         LDA   $1D
         SBC   $11
         STA   $1D
         BCS   L1B0ADE
         DEC   $1F
L1B0ADE  SEC
         LDA   $25
         SBC   $11
         STA   $25
         BCS   L1B0AE9
         DEC   $27
L1B0AE9  SEC
         LDA   $19
         SBC   $11
         STA   $19
         BCS   L1B0AF4
         DEC   $1B
L1B0AF4  SEC
         LDA   $15
         SBC   $11
         STA   $15
         BCS   L1B0AFF
         DEC   $17
L1B0AFF  LDY   $11
         PEI   $12
         PLB
         PLB
L1B0B05  LDX   $03
         BNE   L1B0B0C
         BRL   L1B0C04
L1B0B0C  LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$25],Y
         ORA   [$21],Y
         AND   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         DEX
         BMI   L1B0C07
         BEQ   L1B0C04
         BRL   L1B0B0C
L1B0C04  BRL   L1B0C04
L1B0C07  DEC   $0F
         BEQ   L1B0C13
         TYA
         CLC
         ADC   $0B
         TAY
         BRL   L1B0B05
L1B0C13  LDA   $09
         STA   $27
         LDA   $07
         STA   $25
         LDX   $05
         TDC
         CLC
         ADC   #$0024
         TCS
         TXA
         TCD
         PLB
         RTL

L1B0C27  ENT
         PHB
         PHD
         TSC
         SEC
         SBC   #$00AC
         TCD
         TCS
         PEA   ^L052E9F
         PEA   L052E9F
         PEA   $0000
         PEA   $00A0
         JSL   L071EC5
         LDA   #L052E9F
         STA   $A3
         LDA   #^L052E9F
         STA   $A5
         LDA   $B5
         ASL
         DEC
         DEC
         STA   $AB
L1B0C51  DEC   $B7
         BPL   L1B0C58
         BRL   L1B0CE3
L1B0C58  BNE   L1B0C62
         LDA   #L052E9F
         LDX   #^L052E9F
         BRA   L1B0C6D
L1B0C62  LDA   $BD
         LDX   $BF
         CLC
         ADC   #$00A0
         BCC   L1B0C6D
         INX
L1B0C6D  STA   $A7
         STX   $A9
         LDX   $AB
         INX
         INX
         LDY   $AB
         CLC
L1B0C78  LDA   [$BD],Y
         XBA
         ROL
         STA   $01,X
         DEY
         DEY
         DEX
         DEX
         BNE   L1B0C78
         TXA
         ROL
         STA   $01
         LDY   #$0002
L1B0C8B  LDX   $AB
         INX
         INX
         CLC
L1B0C90  ROL   $01,X
         DEX
         DEX
         BPL   L1B0C90
         DEY
         BNE   L1B0C8B
         LDX   $AB
         INX
         INX
         CLC
L1B0C9E  LDA   $01,X
         ROL
         XBA
         STA   $01,X
         DEX
         DEX
         BPL   L1B0C9E
         LDY   $AB
         TYX
L1B0CAB  LDA   [$BD],Y
         AND   [$A3],Y
         AND   [$A7],Y
         AND   $03,X
         AND   $02,X
         EOR   #$FFFF
         EOR   [$BD],Y
         STA   [$B9],Y
         DEX
         DEX
         TXY
         BPL   L1B0CAB
         LDA   $BD
         LDX   $BF
         STA   $A3
         STX   $A5
         CLC
         ADC   #$00A0
         BCC   L1B0CD0
         INX
L1B0CD0  STA   $BD
         STX   $BF
         LDA   $B9
         CLC
         ADC   #$00A0
         STA   $B9
         BCC   L1B0CE0
         INC   $BB
L1B0CE0  BRL   L1B0C51
L1B0CE3  LDA   $B1
         STA   $BF
         LDA   $AF
         STA   $BD
         LDX   $AD
         TDC
         CLC
         ADC   #$00BC
         TCS
         TXA
         TCD
         PLB
         RTL

L1B0CF7  PHB
         PHD
         PHY
         TSC
         TCD
         PHB
         PHK
         PLB
         PEA   $0002
         PEA   $0001
         _SetPenSize
         LDA   #L1B0D8F
         JSR   L1B0D49
         LDA   #^L1B0D7F
         PHA
         LDA   #L1B0D7F
         PHA
         _FrameRect
         LDA   #L1B0DA1
         JSR   L1B0D49
         LDA   #L1B0DBB
         JSR   L1B0D49
         LDA   #L1B0DD9
         JSR   L1B0D49
         LDA   #^L1B0D87
         PHA
         LDA   #L1B0D87
         PHA
         _FrameOval
         PLB
         TDC
         TCS
         PLY
         PLD
         PLB
         RTL

L1B0D49  STA   L1B0D59+1
         STA   L1B0D5E+1
         STA   L1B0D64+1
         LDA   #$0002
         STA   $01
L1B0D57  LDX   $01
L1B0D59  CPX   L1B0D8F
         BEQ   L1B0D7E
L1B0D5E  LDA   L1B0D8F,X
         PHA
         INX
         INX
L1B0D64  LDA   L1B0D8F,X
         PHA
         INX
         INX
         STX   $01
         LDY   #$3D04
         CPX   #$0007
         BCS   L1B0D77
         LDY   #$3A04
L1B0D77  TYX
         JSL   $E10000
         BRA   L1B0D57
L1B0D7E  RTS

L1B0D7F  DW    $0006
         DW    $005D
         DW    $0011
         DW    $0076
L1B0D87  DW    $0005
         DW    $0132
         DW    $0012
         DW    $0150
L1B0D8F  DW    $0012
         DW    $0033
         DW    $0006
         DW    $000B
         DW    $000B
         DW    $FFEA
         DW    $0000
         DW    $000B
         DW    $FFF5
L1B0DA1  DW    $001A
         DW    $009E
         DW    $0005
         DW    $000D
         DW    $0006
         DW    $FFFB
         DW    $0006
         DW    $FFF1
         DW    $0000
         DW    $FFFA
         DW    $FFFA
         DW    $000C
         DW    $FFFA
L1B0DBB  DW    $001E
         DW    $00DB
         DW    $0006
         DW    $000B
         DW    $0005
         DW    $FFF5
         DW    $0005
         DW    $FFF6
         DW    $0000
         DW    $FFF5
         DW    $FFFB
         DW    $000B
         DW    $FFFB
         DW    $000A
         DW    $0000
L1B0DD9  DW    $0026
         DW    $0111
         DW    $0005
         DW    $0009
         DW    $0004
         DW    $0000
         DW    $0004
         DW    $FFF7
         DW    $0004
         DW    $FFF5
         DW    $0000
         DW    $FFF7
         DW    $FFFC
         DW    $0000
         DW    $FFFC
         DW    $0009
         DW    $FFFC
         DW    $000B
         DW    $0000
	
L1B0DFF  PHD
         TSC
         SEC
         SBC   #$000E
         TCD
         TCS
         LDA   #L051C46
         STA   $0B
         LDA   #^L051C46
         STA   $0D
         LDA   $22
         LSR
         LSR
         PHP
         ASL
         ASL
         SEC
         SBC   #$000C
         STA   $22
         PLP
         BCC   L1B0E2D
         LDA   $0B
         CLC
         ADC   #$0060
         STA   $0B
         BCC   L1B0E2D
         INC   $0D
L1B0E2D  LDA   $20
         SEC
         SBC   #$0006
         STA   $20
         LDA   #$000C
         STA   $09
         LDA   #$FFFF
         STA   $01
         STA   $03
         STA   $05
         STA   $07
         LDA   $16
         BNE   L1B0EBE
         LDA   $22
         BPL   L1B0E64
         CMP   #$FFE9
         BCC   L1B0EAE
         EOR   #$FFFF
         INC
         LSR
         LSR
         TAX
         SEP   #$20
L1B0E5B  STZ   $00,X
         DEX
         BNE   L1B0E5B
         REP   #$20
         BRA   L1B0E83
L1B0E64  LDA   $22
         CMP   #$0280
         BCS   L1B0EAE
         LDA   #$0264
         SEC
         SBC   $22
         BPL   L1B0E83
         LSR
         LSR
         ORA   #$C000
         TAX
         DEX
         SEP   #$20
L1B0E7C  STZ   $09,X
         INX
         BMI   L1B0E7C
         REP   #$20
L1B0E83  LDA   $20
         BPL   L1B0EA7
         CMP   #$FFF5
         BCC   L1B0EAE
         CLC
         ADC   $09
         STA   $09
         LDA   $20
         EOR   #$FFFF
         INC
         ASL
         ASL
         ASL
         CLC
         ADC   $0B
         STA   $0B
         BCC   L1B0EA3
         INC   $0D
L1B0EA3  STZ   $20
         BRA   L1B0EBE
L1B0EA7  LDA   $20
         CMP   #$00C8
         BCC   L1B0EB1
L1B0EAE  BRL   L1B0F4C
L1B0EB1  LDA   #$00BC
         SEC
         SBC   $20
         BPL   L1B0EBE
         CLC
         ADC   $09
         STA   $09
L1B0EBE  LDA   $20
         JSL   L082758
         PHA
         LDA   $22
         CMP   #$8000
         ROR
         CMP   #$8000
         ROR
         CLC
         ADC   $01,S
         PLX
         TAY
         LDA   $20
         AND   #$0007
         ASL
         ASL
         ASL
         ASL
         PHA
         LDA   $22
         LSR
         LSR
         AND   #$0003
         CLC
         ADC   $01,S
         CLC
         ADC   $24
         STA   $24
         BCC   L1B0EF1
         INC   $26
L1B0EF1  PLX
L1B0EF2  DEC   $09
         BMI   L1B0F4C
         LDX   #$0000
L1B0EF9  LDA   [$0B]
         BEQ   L1B0F17
         AND   $01,X
         BEQ   L1B0F17
         EOR   #$FFFF
         PHA
         LDA   [$1C],Y
         EOR   [$24]
         AND   $01,S
         EOR   [$24]
         STA   [$1C],Y
         PLA
         EOR   #$FFFF
         ORA   [$18],Y
         STA   [$18],Y
L1B0F17  INY
         INY
         LDA   $0B
         CLC
         ADC   #$0002
         STA   $0B
         BCC   L1B0F25
         INC   $0D
L1B0F25  LDA   $24
         CLC
         ADC   #$0002
         STA   $24
         BCC   L1B0F31
         INC   $26
L1B0F31  INX
         INX
         CPX   #$0008
         BCC   L1B0EF9
         TYA
         CLC
         ADC   #$0098
         TAY
         LDA   $24
         CLC
         ADC   #$0008
         STA   $24
         BCC   L1B0F4A
         INC   $24
L1B0F4A  BRA   L1B0EF2
L1B0F4C  LDA   $12
         STA   $26
         LDA   $11
         STA   $25
         LDX   $0F
         TDC
         CLC
         ADC   #$0024
         TCS
         TXA
         TCD
         RTL

L1B0F5F  PHD
         TSC
         SEC
         SBC   #$002E
         TCD
         TCS
         LDX   #$001E
L1B0F6A  TXY
         LDA   [$38],Y
         STA   $01,X
         DEX
         DEX
         BPL   L1B0F6A
         LDA   $34
         LDX   $36
         CLC
         ADC   #$0080
         BCC   L1B0F7E
         INX
L1B0F7E  STA   $21
         STX   $23
         CLC
         ADC   #$0080
         BCC   L1B0F89
         INX
L1B0F89  STA   $25
         STX   $27
         LDX   #$0000
         TXY
         LDA   #$0007
         STA   $2B
L1B0F96  LDA   #$0003
         STA   $2D
L1B0F9B  LDA   $01,X
         STA   [$34],Y
         STA   [$21],Y
         STA   [$25],Y
         INX
         INX
         INY
         INY
         LDA   $01,X
         STA   [$34],Y
         STA   [$21],Y
         STA   [$25],Y
         INY
         INY
         DEX
         DEX
         DEC   $2D
         BPL   L1B0F9B
         INX
         INX
         INX
         INX
         DEC   $2B
         BPL   L1B0F96
         LDA   $32
         STA   $3A
         LDA   $31
         STA   $39
         LDX   $2F
         TDC
         CLC
         ADC   #$0038
         TCS
         TXA
         TCD
         RTL

L1B0FD2	ENT
         PHD
         TSC
         SEC
         SBC   #$00D2
         TCD
         TCS
         LDY   #$0006
L1B0FDD  TYX
         LDA   [$DE],Y
         STA   $07,X
         DEY
         DEY
         BPL   L1B0FDD
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   ^L051D5E
         PEA   L051D5E
         PEA   ^L053259
         PEA   L053259
         _MapRect
         LDA   [$D8]
         STA   $01
         LDY   #$0002
         LDA   [$D8],Y
         STA   $03
         PHY
         TAX
         LDA   $01
         CLC
         ADC   #$0002
         BCC   L1B1018
         INX
L1B1018  PHX
         PHA
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   ^L052F3F
         PEA   L052F3F
         _SectRect
         PLA
         BNE   L1B1036
         BRL   L1B143A
L1B1036  LDA   L052F3F
         LSR
         LSR
         LSR
         CLC
         STA   $0F
         LDA   L052F41
         LSR
         LSR
         LSR
         CLC
         STA   $11
         LDA   L052F43
         CLC
         ADC   #$0007
         LSR
         LSR
         LSR
         CLC
         STA   $13
         LDA   L052F45
         CLC
         ADC   #$0007
         LSR
         LSR
         LSR
         CLC
         STA   $15
         LDA   $11
         AND   #$FFFC
         STA   $11
         LDA   $15
         CLC
         ADC   #$0003
         AND   #$FFFC
         STA   $15
         LDA   L052F41
         AND   #$FFE0
         STA   L052F41
         LDA   L052F45
         CLC
         ADC   #$001F
         AND   #$FFE0
         STA   L052F45
         LDA   $11
         LSR
         LSR
         STA   $17
         LDA   $15
         LSR
         LSR
         SEC
         SBC   $17
         STA   $19
         LDA   $0F
         ASL
         ADC   $0F
         ASL
         ASL
         ASL
         ADC   $17
         CLC
         ADC   #L1B044C
         STA   $21
         LDA   #^L1B044C
         STA   $23
         LDA   #$0018
         SEC
         SBC   $19
         STA   $1B
         LDA   L052F41
         LSR
         LSR
         STA   $25
         LDA   $19
         ASL
         ASL
         ASL
         STA   $27
         LDA   L052F3F
         AND   #$FFF8
         STA   $29
         JSL   L082758
         STA   $05
         LDA   L052F41
         LSR
         LSR
         ADC   $05
         STA   $2D
         LDA   $01
         STA   L0550A1
         LDA   $03
         STA   L0550A3
         JSL   L081BAC
         LDA   $27
         LSR
         AND   #$0007
         PHA
         STA   $05
         ASL
         ADC   $05
         ASL
         ASL
         ASL
         STA   $05
         LDA   #$FFE8
         SEC
         SBC   $05
         STAL  L1B12BC+1
         LDA   $01,S
         STA   $05
         ASL
         ASL
         ADC   $05
         STA   $05
         LDA   #$FFEB
         SEC
         SBC   $05
         STAL  L1B1314+1
         PLA
         STA   $05
         ASL
         ASL
         ADC   $05
         ASL
         ADC   $05
         ASL
         ADC   $05
         STA   $05
         LDA   #$FFE8
         SEC
         SBC   $05
         STAL  L1B1402+1
         LDA   $27
         LSR
         LSR
         LSR
         LSR
         STA   $2F
         LDA   $27
         AND   #$FFF0
         STA   $05
         LDA   #$0090
         SEC
         SBC   $05
         STA   $2B
         LDA   $DC
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         STA   $DC
         LDA   $0F
         STA   $1F
L1B1156  PHB
         PHK
         PLB
         LDA   $19
         STA   $1D
         LDX   $25
L1B115F  LDA   [$21]
         AND   #$00F0
         LSR
         LSR
         ORA   $DC
         TAY
         LDA   L1B144D,Y
         STA   $33,X
         LDA   L1B144D+2,Y
         STA   $35,X
         LDA   [$21]
         AND   #$000F
         ASL
         ASL
         ORA   $DC
         TAY
         LDA   L1B144D,Y
         STA   $37,X
         LDA   L1B144D+2,Y
         STA   $39,X
         INC   $21
         TXA
         CLC
         ADC   #$0008
         TAX
         DEC   $1D
         BNE   L1B115F
         LDA   $21
         CLC
         ADC   $1B
         STA   $21
         PLB
L1B119B  LDA   $29
         CMP   L05509D
         BCC   L1B11A9
         STA   L05509F
         JSL   L0825D4
L1B11A9  LDA   L05509B
         BPL   L1B11B9
         LDA   $2D
         CLC
         ADC   #$00A0
         STA   $2D
         BRL   L1B1418
L1B11B9  BEQ   L1B11D3
         LDA   $29
         AND   #$0007
         BNE   L1B11D0
         LDA   L05509D
         SEC
         SBC   $29
         CMP   #$0007
         BCC   L1B11D0
         BRL   L1B1321
L1B11D0  BRL   L1B12C9
L1B11D3  PHB
         LDA   L0550FA
         PHA
         PLB
         PLB
         LDY   $2D
         LDX   $25
         LDA   $2F
         STA   $31
         BNE   L1B11E7
         BRL   L1B12BC
L1B11E7  LDAL  L052EAD,X
         BNE   L1B11F1
         LDA   $41,X
         BRA   L1B11FC
L1B11F1  LDA   $200E,Y
         EOR   $41,X
         ANDL  L052EAD,X
         EOR   $41,X
L1B11FC  STA   $200E,Y
         LDAL  L052EAB,X
         BNE   L1B1209
         LDA   $3F,X
         BRA   L1B1214
L1B1209  LDA   $200C,Y
         EOR   $3F,X
         ANDL  L052EAB,X
         EOR   $3F,X
L1B1214  STA   $200C,Y
         LDAL  L052EA9,X
         BNE   L1B1221
         LDA   $3D,X
         BRA   L1B122C
L1B1221  LDA   $200A,Y
         EOR   $3D,X
         ANDL  L052EA9,X
         EOR   $3D,X
L1B122C  STA   $200A,Y
         LDAL  L052EA7,X
         BNE   L1B1239
         LDA   $3B,X
         BRA   L1B1244
L1B1239  LDA   $2008,Y
         EOR   $3B,X
         ANDL  L052EA7,X
         EOR   $3B,X
L1B1244  STA   $2008,Y
         LDAL  L052EA5,X
         BNE   L1B1251
         LDA   $39,X
         BRA   L1B125C
L1B1251  LDA   $2006,Y
         EOR   $39,X
         ANDL  L052EA5,X
         EOR   $39,X
L1B125C  STA   $2006,Y
         LDAL  L052EA3,X
         BNE   L1B1269
         LDA   $37,X
         BRA   L1B1274
L1B1269  LDA   $2004,Y
         EOR   $37,X
         ANDL  L052EA3,X
         EOR   $37,X
L1B1274  STA   $2004,Y
         LDAL  L052EA1,X
         BNE   L1B1281
         LDA   $35,X
         BRA   L1B128C
L1B1281  LDA   $2002,Y
         EOR   $35,X
         ANDL  L052EA1,X
         EOR   $35,X
L1B128C  STA   $2002,Y
         LDAL  L052E9F,X
         BNE   L1B1299
         LDA   $33,X
         BRA   L1B12A4
L1B1299  LDA   $2000,Y
         EOR   $33,X
         ANDL  L052E9F,X
         EOR   $33,X
L1B12A4  STA   $2000,Y
         TXA
         CLC
         ADC   #$0010
         TAX
         TYA
         CLC
         ADC   #$0010
         TAY
         DEC   $31
         BMI   L1B12BF
         BEQ   L1B12BC
         BRL   L1B11E7
L1B12BC  BRL   L1B12BC
L1B12BF  TYA
         CLC
         ADC   $2B
         STA   $2D
         PLB
         BRL   L1B1418
L1B12C9  PHB
         LDA   L0550FA
         PHA
         PLB
         PLB
         LDY   $2D
         LDX   $25
         LDA   $2F
         STA   $31
         BEQ   L1B1314
L1B12DA  LDA   $41,X
         STA   $200E,Y
         LDA   $3F,X
         STA   $200C,Y
         LDA   $3D,X
         STA   $200A,Y
         LDA   $3B,X
         STA   $2008,Y
         LDA   $39,X
         STA   $2006,Y
         LDA   $37,X
         STA   $2004,Y
         LDA   $35,X
         STA   $2002,Y
         LDA   $33,X
         STA   $2000,Y
         TXA
         CLC
         ADC   #$0010
         TAX
         TYA
         CLC
         ADC   #$0010
         TAY
         DEC   $31
         BMI   L1B1317
         BNE   L1B12DA
L1B1314  BRL   L1B1314
L1B1317  TYA
         CLC
         ADC   $2B
         STA   $2D
         PLB
         BRL   L1B1418
L1B1321  PHB
         LDA   L0550FA
         PHA
         PLB
         PLB
         LDY   $2D
         LDX   $25
         LDA   $2F
         STA   $31
         BNE   L1B1335
         BRL   L1B1402
L1B1335  LDA   $41,X
         STA   $200E,Y
         STA   $20AE,Y
         STA   $214E,Y
         STA   $21EE,Y
         STA   $228E,Y
         STA   $232E,Y
         STA   $23CE,Y
         LDA   $3F,X
         STA   $200C,Y
         STA   $20AC,Y
         STA   $214C,Y
         STA   $21EC,Y
         STA   $228C,Y
         STA   $232C,Y
         STA   $23CC,Y
         LDA   $3D,X
         STA   $200A,Y
         STA   $20AA,Y
         STA   $214A,Y
         STA   $21EA,Y
         STA   $228A,Y
         STA   $232A,Y
         STA   $23CA,Y
         LDA   $3B,X
         STA   $2008,Y
         STA   $20A8,Y
         STA   $2148,Y
         STA   $21E8,Y
         STA   $2288,Y
         STA   $2328,Y
         STA   $23C8,Y
         LDA   $39,X
         STA   $2006,Y
         STA   $20A6,Y
         STA   $2146,Y
         STA   $21E6,Y
         STA   $2286,Y
         STA   $2326,Y
         STA   $23C6,Y
         LDA   $37,X
         STA   $2004,Y
         STA   $20A4,Y
         STA   $2144,Y
         STA   $21E4,Y
         STA   $2284,Y
         STA   $2324,Y
         STA   $23C4,Y
         LDA   $35,X
         STA   $2002,Y
         STA   $20A2,Y
         STA   $2142,Y
         STA   $21E2,Y
         STA   $2282,Y
         STA   $2322,Y
         STA   $23C2,Y
         LDA   $33,X
         STA   $2000,Y
         STA   $20A0,Y
         STA   $2140,Y
         STA   $21E0,Y
         STA   $2280,Y
         STA   $2320,Y
         STA   $23C0,Y
         TXA
         CLC
         ADC   #$0010
         TAX
         TYA
         CLC
         ADC   #$0010
         TAY
         DEC   $31
         BMI   L1B1405
         BEQ   L1B1402
         BRL   L1B1335
L1B1402  BRL   L1B1402
L1B1405  TYA
         CLC
         ADC   $2B
         CLC
         ADC   #$03C0
         STA   $2D
         LDA   $29
         CLC
         ADC   #$0006
         STA   $29
         PLB
L1B1418  INC   $29
         LDA   $29
         INC
         AND   #$0007
         BEQ   L1B1425
         BRL   L1B119B
L1B1425  INC   $1F
         LDA   $1F
         CMP   $13
         BCS   L1B143A
         LDA   $2D
         CLC
         ADC   #$00A0
         STA   $2D
         INC   $29
         BRL   L1B1156
L1B143A  LDA   $D6
         STA   $E0
         LDA   $D5
         STA   $DF
         LDX   $D3
         TDC
         CLC
         ADC   #$00DE
         TCS
         TXA
         TCD
         RTL

L1B144D  HEX   0000000F1111111F2222222F3333333F
         HEX   4444444F5555555F6666666F7777777F
         HEX   8888888F9999999FAAAAAAAFBBBBBBBF
         HEX   CCCCCCCFDDDDDDDFEEEEEEEFFFFFFFFF
         HEX   000F000F1111111F2222222F000FFFFF
         HEX   4444444F5555555F6666666F7777777F
         HEX   8888888F9999999FAAAAAAAFBBBBBBBF
         HEX   FFFF000FDDDDDDDFEEEEEEEFFFFFFFFF
         HEX   000F000F000F1D1F000F2E2F000FFFFF
         HEX   474F000F474F1D1F474F2E2F474FFFFF
         HEX   8B8F000F8B8F1D1F8B8F2E2F8B8FFFFF
         HEX   FFFF000FFFFF1D1FFFFF2E2FFFFFFFFF
	
L1B150D  PHB
         PHD
         PHY
         TSC
         TCD
         LDA   #$00C8
         STA   $01
L1B1517  LDX   #$0090
         LDY   #$0000
L1B151D  LDA   [$0D],Y
         XBA
         STA   L052EAD,X
         INY
         INY
         LDA   [$0D],Y
         XBA
         STA   L052EAB,X
         INY
         INY
         LDA   [$0D],Y
         XBA
         STA   L052EA9,X
         INY
         INY
         LDA   [$0D],Y
         XBA
         STA   L052EA7,X
         INY
         INY
         LDA   [$0D],Y
         XBA
         STA   L052EA5,X
         INY
         INY
         LDA   [$0D],Y
         XBA
         STA   L052EA3,X
         INY
         INY
         LDA   [$0D],Y
         XBA
         STA   L052EA1,X
         INY
         INY
         LDA   [$0D],Y
         XBA
         STA   L052E9F,X
         INY
         INY
         TXA
         SEC
         SBC   #$0010
         TAX
         BPL   L1B151D
         LDY   #$009F
         SEP   #$30
L1B156A  LDX   L052E9F,Y
         LDAL  L1B15F1,X
         STA   [$09],Y
         DEY
         LDX   L052E9F,Y
         LDAL  L1B15F1,X
         STA   [$09],Y
         DEY
         LDX   L052E9F,Y
         LDAL  L1B15F1,X
         STA   [$09],Y
         DEY
         LDX   L052E9F,Y
         LDAL  L1B15F1,X
         STA   [$09],Y
         DEY
         LDX   L052E9F,Y
         LDAL  L1B15F1,X
         STA   [$09],Y
         DEY
         LDX   L052E9F,Y
         LDAL  L1B15F1,X
         STA   [$09],Y
         DEY
         LDX   L052E9F,Y
         LDAL  L1B15F1,X
         STA   [$09],Y
         DEY
         LDX   L052E9F,Y
         LDAL  L1B15F1,X
         STA   [$09],Y
         DEY
         CPY   #$FF
         BNE   L1B156A
         REP   #$30
         LDA   $0D
         CLC
         ADC   #$00A0
         STA   $0D
         BCC   L1B15CC
         INC   $0F
L1B15CC  LDA   $09
         CLC
         ADC   #$00A0
         STA   $09
         BCC   L1B15D8
         INC   $0B
L1B15D8  DEC   $01
         BEQ   L1B15DF
         BRL   L1B1517
L1B15DF  LDA   $07
         STA   $0F
         LDA   $05
         STA   $0D
         TDC
         TCS
         PLY
         PLD
         PLY
         PLY
         PLY
         PLY
         PLB
         RTL

L1B15F1  HEX   00102030405060708090A0B0C0D0E0F0
         HEX   01112131415161718191A1B1C1D1E1F1
         HEX   02122232425262728292A2B2C2D2E2F2
         HEX   03132333435363738393A3B3C3D3E3F3
         HEX   04142434445464748494A4B4C4D4E4F4
         HEX   05152535455565758595A5B5C5D5E5F5
         HEX   06162636465666768696A6B6C6D6E6F6
         HEX   07172737475767778797A7B7C7D7E7F7
         HEX   08182838485868788898A8B8C8D8E8F8
         HEX   09192939495969798999A9B9C9D9E9F9
         HEX   0A1A2A3A4A5A6A7A8A9AAABACADAEAFA
         HEX   0B1B2B3B4B5B6B7B8B9BABBBCBDBEBFB
         HEX   0C1C2C3C4C5C6C7C8C9CACBCCCDCECFC
         HEX   0D1D2D3D4D5D6D7D8D9DADBDCDDDEDFD
         HEX   0E1E2E3E4E5E6E7E8E9EAEBECEDEEEFE
         HEX   0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFFF
L1B16F1  PHB
         PHD
         TSC
         TCD
         PEI   $08
         PLB
         PLB
         LDA   $0B
         SEC
         SBC   #$7C60
         STA   $0B
         BCS   L1B1705
         DEC   $0D
L1B1705  LDY   #$7CFE
L1B1708  LDX   #$000A
L1B170B  LDA   [$0B],Y
         STA   |$0000,Y
         DEY
         DEY
         LDA   [$0B],Y
         STA   |$0000,Y
         DEY
         DEY
         LDA   [$0B],Y
         STA   |$0000,Y
         DEY
         DEY
         LDA   [$0B],Y
         STA   |$0000,Y
         DEY
         DEY
         LDA   [$0B],Y
         STA   |$0000,Y
         DEY
         DEY
         LDA   [$0B],Y
         STA   |$0000,Y
         DEY
         DEY
         LDA   [$0B],Y
         STA   |$0000,Y
         DEY
         DEY
         LDA   [$0B],Y
         STA   |$0000,Y
         DEY
         DEY
         DEX
         BNE   L1B170B
         LDA   $0B
         CLC
         ADC   #$0140
         STA   $0B
         BCC   L1B1752
         INC   $0D
L1B1752  TYA
         BPL   L1B1708
         LDA   $05
         STA   $0D
         LDA   $03
         STA   $0B
         TDC
         TCS
         PLD
         PLY
         PLY
         PLY
         PLY
         PLB
         RTL

L1B1766	ENT
         PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         LDY   #$0004
         LDA   [$14],Y
         JSL   L082758
         STA   $05
         LDA   [$14]
         JSL   L082758
         TAY
         SEP   #$20
L1B1780  LDA   [$10],Y
         INC
         BNE   L1B1789
         STA   [$0C],Y
         BRA   L1B17A0
L1B1789  DEC
         TAX
         ORA   #$F0
         INC
         BEQ   L1B1792
         LDA   #$0F
L1B1792  STA   $03
         TXA
         ORA   #$0F
         INC
         BEQ   L1B179C
         LDA   #$F0
L1B179C  ORA   $03
         STA   [$0C],Y
L1B17A0  INY
         CPY   $05
         BCC   L1B1780
         REP   #$20
         LDA   $0A
         STA   $16
         LDA   $09
         STA   $15
         LDX   $07
         TDC
         CLC
         ADC   #$0014
         TCS
         TXA
         TCD
         RTL

L1B17BA  ENT
	PHD
         TSC
         TCD
         LDA   $0C
         LSR
         LSR
         PHA
         LDA   $0A
         JSL   L082758
         CLC
         ADC   $01,S
         PLX
         TAY
         LDA   $0C
         AND   #$0003
         TAX
         LDA   [$06],Y
         DEX
         BMI   L1B17E4
         DEX
         BMI   L1B17E6
         DEX
         BMI   L1B17E8
         XBA
         ROL
         ROL
         XBA
         BRA   L1B17E8
L1B17E4  LSR
         LSR
L1B17E6  LSR
         LSR
L1B17E8  AND   #$000F
         STA   $0E
         LDA   $04
         STA   $0C
         LDA   $03
         STA   $0B
         TDC
         TCS
         PLD
         PLY
         PLY
         PLY
         PLY
         RTL

L1B17FD	ENT
         PHB
         PHD
         PHY
         TSC
         TCD
         DEC   $09
         PEI   $0E
         PLB
         PLB
         LDA   $0D
         STA   $01
L1B180C  SEP   #$20
         LDX   $01
         LDY   $09
L1B1812  LDA   [$11],Y
         ASL
         ASL
         ASL
         ASL
         STA   |$0000,X
         LDA   [$11],Y
         AND   #$F0
         STA   |$00A0,X
         DEY
         LDA   [$11],Y
         ASL
         ASL
         ASL
         ASL
         STA   $0140,X
         LDA   [$11],Y
         AND   #$F0
         STA   $01E0,X
         DEY
         LDA   [$11],Y
         ASL
         ASL
         ASL
         ASL
         STA   $0280,X
         LDA   [$11],Y
         AND   #$F0
         STA   $0320,X
         DEY
         LDA   [$11],Y
         ASL
         ASL
         ASL
         ASL
         STA   $03C0,X
         LDA   [$11],Y
         AND   #$F0
         STA   $0460,X
         REP   #$20
         TXA
         CLC
         ADC   #$0500
         TAX
         SEP   #$20
         DEY
         BPL   L1B1812
         REP   #$20
         DEC   $0B
         BNE   L1B186B
         BRL   L1B18FF
L1B186B  LDA   $11
         CLC
         ADC   #$00A0
         STA   $11
         SEP   #$20
         LDX   $01
         LDY   $09
L1B1879  LDA   [$11],Y
         BEQ   L1B1891
         AND   #$0F
         ORA   |$0000,X
         STA   |$0000,X
         LDA   [$11],Y
         LSR
         LSR
         LSR
         LSR
         ORA   |$00A0,X
         STA   |$00A0,X
L1B1891  DEY
         LDA   [$11],Y
         BEQ   L1B18AA
         AND   #$0F
         ORA   $0140,X
         STA   $0140,X
         LDA   [$11],Y
         LSR
         LSR
         LSR
         LSR
         ORA   $01E0,X
         STA   $01E0,X
L1B18AA  DEY
         LDA   [$11],Y
         BEQ   L1B18C3
         AND   #$0F
         ORA   $0280,X
         STA   $0280,X
         LDA   [$11],Y
         LSR
         LSR
         LSR
         LSR
         ORA   $0320,X
         STA   $0320,X
L1B18C3  DEY
         LDA   [$11],Y
         BEQ   L1B18DC
         AND   #$0F
         ORA   $03C0,X
         STA   $03C0,X
         LDA   [$11],Y
         LSR
         LSR
         LSR
         LSR
         ORA   $0460,X
         STA   $0460,X
L1B18DC  REP   #$20
         TXA
         CLC
         ADC   #$0500
         TAX
         SEP   #$20
         DEY
         BMI   L1B18EC
         BRL   L1B1879
L1B18EC  REP   #$20
         LDA   $11
         CLC
         ADC   #$00A0
         STA   $11
         DEC   $0B
         BEQ   L1B18FF
         INC   $01
         BRL   L1B180C
L1B18FF  LDA   $07
         STA   $13
         LDA   $05
         STA   $11
         TDC
         TCS
         PLY
         PLD
         CLC
         ADC   #$0010
         TCS
         PLB
         RTL

L1B1912	ENT
         PHB
         PHD
         PHY
         PHY
         PHY
         PHY
         TSC
         TCD
         PEI   $14
         PLB
         PLB
         LDA   $11
         DEC
         JSL   L082758
         STA   $03
         LDA   $0F
         LSR
         LSR
         STA   $05
         LDA   $13
         STA   $01
L1B1931  LDA   $05
         STA   $07
         SEP   #$20
         LDX   $01
         LDY   $03
L1B193B  LDA   [$17],Y
         AND   #$F0
         STA   |$0000,X
         LDA   [$17],Y
         ASL
         ASL
         ASL
         ASL
         STA   |$00A0,X
         INY
         LDA   [$17],Y
         AND   #$F0
         STA   $0140,X
         LDA   [$17],Y
         ASL
         ASL
         ASL
         ASL
         STA   $01E0,X
         INY
         LDA   [$17],Y
         AND   #$F0
         STA   $0280,X
         LDA   [$17],Y
         ASL
         ASL
         ASL
         ASL
         STA   $0320,X
         INY
         LDA   [$17],Y
         AND   #$F0
         STA   $03C0,X
         LDA   [$17],Y
         ASL
         ASL
         ASL
         ASL
         STA   $0460,X
         REP   #$20
         TXA
         CLC
         ADC   #$0500
         TAX
         SEP   #$20
         INY
         DEC   $07
         BNE   L1B193B
         REP   #$20
         DEC   $11
         BNE   L1B1996
         BRL   L1B1A30
L1B1996  LDA   $03
         SEC
         SBC   #$00A0
         STA   $03
         LDA   $05
         STA   $07
         SEP   #$20
         LDX   $01
         LDY   $03
L1B19A8  LDA   [$17],Y
         BEQ   L1B19C0
         LSR
         LSR
         LSR
         LSR
         ORA   |$0000,X
         STA   |$0000,X
         LDA   [$17],Y
         AND   #$0F
         ORA   |$00A0,X
         STA   |$00A0,X
L1B19C0  INY
         LDA   [$17],Y
         BEQ   L1B19D9
         LSR
         LSR
         LSR
         LSR
         ORA   $0140,X
         STA   $0140,X
         LDA   [$17],Y
         AND   #$0F
         ORA   $01E0,X
         STA   $01E0,X
L1B19D9  INY
         LDA   [$17],Y
         BEQ   L1B19F2
         LSR
         LSR
         LSR
         LSR
         ORA   $0280,X
         STA   $0280,X
         LDA   [$17],Y
         AND   #$0F
         ORA   $0320,X
         STA   $0320,X
L1B19F2  INY
         LDA   [$17],Y
         BEQ   L1B1A0B
         LSR
         LSR
         LSR
         LSR
         ORA   $03C0,X
         STA   $03C0,X
         LDA   [$17],Y
         AND   #$0F
         ORA   $0460,X
         STA   $0460,X
L1B1A0B  REP   #$20
         TXA
         CLC
         ADC   #$0500
         TAX
         SEP   #$20
         INY
         DEC   $07
         BEQ   L1B1A1D
         BRL   L1B19A8
L1B1A1D  REP   #$20
         LDA   $03
         SEC
         SBC   #$00A0
         STA   $03
         DEC   $11
         BEQ   L1B1A30
         INC   $01
         BRL   L1B1931
L1B1A30  LDA   $0D
         STA   $19
         LDA   $0B
         STA   $17
         LDX   $09
         TDC
         CLC
         ADC   #$0016
         TCS
         TXA
         TCD
         PLB
         RTL

L1B1A44  ENT
         PHD
         TSC
         TCD
         LDA   $06
         BEQ   L1B1A69
         LDAL  StdComment+1
         STA   L055297
         LDAL  StdComment+2
         STA   L055298
         LDA   #L1B1A84
         STAL  StdComment+1
         LDA   #>L1B1A84
         STAL  StdComment+2
         BRA   L1B1A77
L1B1A69  LDA   L055297
         STAL  StdComment+1
         LDA   L055298
         STAL  StdComment+2
L1B1A77  LDA   $04
         STA   $06
         LDA   $03
         STA   $05
         TDC
         TCS
         PLD
         PLY
         RTL

L1B1A84  LDA   $A6
         CMP   #$3039
         BNE   L1B1A92
         LDA   #$0001
         STAL  L05529B
L1B1A92  LDAL  L055297
         STAL  L1B1AA2+1
         LDAL  L055298
         STAL  L1B1AA2+2
L1B1AA2  JMPL  L1B1AA2

         PHB
         PHD
         TSC
         SEC
         SBC   #$000E
         TCD
         TCS
         LDY   #$0004
         LDA   [$17],Y
         SEC
         SBC   [$17]
         BEQ   L1B1ABB
         BPL   L1B1ABE
L1B1ABB  BRL   L1B1BB3
L1B1ABE  STA   $01
         LDY   #$0002
         LDA   [$17],Y
         AND   #$FFE0
         STA   $03
         LDY   #$0006
         LDA   [$17],Y
         CLC
         ADC   #$001F
         AND   #$FFE0
         STA   $05
         SEC
         SBC   $03
         DEC
         BMI   L1B1ABB
         LSR
         LSR
         LSR
         LSR
         LSR
         INC
         STA   $07
         ASL
         ASL
         ASL
         STA   $0D
         LDA   #$00A0
         SEC
         SBC   $0D
         STA   $0B
         LDA   $03
         LSR
         LSR
         STA   $0D
         LDA   [$17]
         JSL   L082758
         CLC
         ADC   $0D
         TAY
         PEI   $20
         PLB
         PLB
         LDA   $15
         BNE   L1B1B5E
L1B1B0B  LDA   $07
         STA   $09
L1B1B0F  LDA   [$2B],Y
         TAX
         ORA   [$23],Y
         STA   [$23],Y
         TXA
         ORA   ($1F),Y
         AND   [$27],Y
         STA   ($1F),Y
         INY
         INY
         LDA   [$2B],Y
         TAX
         ORA   [$23],Y
         STA   [$23],Y
         TXA
         ORA   ($1F),Y
         AND   [$27],Y
         STA   ($1F),Y
         INY
         INY
         LDA   [$2B],Y
         TAX
         ORA   [$23],Y
         STA   [$23],Y
         TXA
         ORA   ($1F),Y
         AND   [$27],Y
         STA   ($1F),Y
         INY
         INY
         LDA   [$2B],Y
         TAX
         ORA   [$23],Y
         STA   [$23],Y
         TXA
         ORA   ($1F),Y
         AND   [$27],Y
         STA   ($1F),Y
         INY
         INY
         DEC   $09
         BNE   L1B1B0F
         TYA
         CLC
         ADC   $0B
         TAY
         DEC   $01
         BNE   L1B1B0B
         BRA   L1B1BB3
L1B1B5E  LDA   $07
         STA   $09
L1B1B62  LDA   [$2B],Y
         TAX
         EOR   #$FFFF
         AND   [$23],Y
         STA   [$23],Y
         TXA
         ORA   ($1F),Y
         STA   ($1F),Y
         INY
         INY
         LDA   [$2B],Y
         TAX
         EOR   #$FFFF
         AND   [$23],Y
         STA   [$23],Y
         TXA
         ORA   ($1F),Y
         STA   ($1F),Y
         INY
         INY
         LDA   [$2B],Y
         TAX
         EOR   #$FFFF
         AND   [$23],Y
         STA   [$23],Y
         TXA
         ORA   ($1F),Y
         STA   ($1F),Y
         INY
         INY
         LDA   [$2B],Y
         TAX
         EOR   #$FFFF
         AND   [$23],Y
         STA   [$23],Y
         TXA
         ORA   ($1F),Y
         STA   ($1F),Y
         INY
         INY
         DEC   $09
         BNE   L1B1B62
         TYA
         CLC
         ADC   $0B
         TAY
         DEC   $01
         BNE   L1B1B5E
L1B1BB3  LDA   $13
         STA   $2D
         LDA   $11
         STA   $2B
         LDX   $0F
         TDC
         CLC
         ADC   #$002A
         TCS
         TXA
         TCD
         PLB
         RTL

L1B1BC7  ENT
	LDA   $04,S
         BPL   L1B1BCF
         CLC
         ADC   #$0007
L1B1BCF  AND   #$FFF8
         STA   $06,S
         LDA   $02,S
         STA   $04,S
         LDA   $01,S
         STA   $03,S
         PLY
         RTL

L1B1BDE  ENT
	LDA   $04,S
         BPL   L1B1BE6
         CLC
         ADC   #$0007
L1B1BE6  AND   #$FFF0
         STA   $06,S
         LDA   $02,S
         STA   $04,S
         LDA   $01,S
         STA   $03,S
         PLY
         RTL

L1B1BF5  PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         LDA   $0C
         CMP   L055283
         BNE   L1B1C05
         BRL   L1B1C9B
L1B1C05  STA   L055283
         ASL
         CLC
         ADC   L055283
         ASL
         ASL
         ASL
         DEC
         STA   $01
         PHB
         PEA   >L1B0000
         PLB
         PLB
         PHY
         PHY
         PEA   $0002
         _GetAddress
         PLA
         PLX
         STA   $03
         STX   $05
         LDX   #$005C
L1B1C2E  LDY   $01
         LDA   L1B0000,Y
         AND   #$00FF
         ASL
         ASL
         TAY
         LDA   [$03],Y
         STAL  L051C46,X
         INY
         INY
         LDA   [$03],Y
         STAL  L051C48,X
         DEC   $01
         DEX
         DEX
         DEX
         DEX
         BPL   L1B1C2E
         LDX   #$0000
         PEA   >L051C46
         PLB
         PLB
         LDY   #$0030
         CLC
L1B1C5B  LDA   L051C46,X
         XBA
         ROR
         STA   L051CA6,X
         INX
         INX
         DEY
         BNE   L1B1C5B
         LDX   #$0000
         LDY   #$0030
         CLC
L1B1C6F  ROR   L051CA6,X
         INX
         INX
         DEY
         BNE   L1B1C6F
         LDX   #$0000
         LDY   #$0030
         CLC
L1B1C7E  ROR   L051CA6,X
         INX
         INX
         DEY
         BNE   L1B1C7E
         LDX   #$0000
         LDY   #$0030
         CLC
L1B1C8D  LDA   L051CA6,X
         ROR
         XBA
         STA   L051CA6,X
         INX
         INX
         DEY
         BNE   L1B1C8D
         PLB
L1B1C9B  LDA   $0A
         STA   $0C
         LDA   $09
         STA   $0B
         TDC
         TCS
         PLY
         PLY
         PLY
         PLD
         PLY
         RTL

L1B1CAB  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         PHY
         PEA   ^L0532B5
         PEA   L0532B5
         PEA   ^L053259
         PEA   L053259
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCC   L1B1D18
         LDA   $01
         PEA   $00A0
         JSL   L150BEE
         PLA
         STA   $09
         LDA   $05
         PEA   $00A0
         JSL   L150BEE
         PLA
         SEC
         SBC   $09
         STA   $0B
         PEI   $20
         PEI   $1E
         LDA   $09
         JSL   L150488
         JSL   L150F53
         PHX
         PHA
         PEI   $1C
         PEI   $1A
         LDA   $09
         JSL   L150488
         JSL   L150F53
         PHX
         PHA
         LDA   $0B
         JSL   L150488
         PHX
         PHA
         JSL   L070597
L1B1D18  LDA   $14
         STA   $20
         LDA   $13
         STA   $1F
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L1B1D2A  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L1B2F08
         LDA   L0552C5
         BEQ   L1B1D75
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         LDA   L0552D1
         LDX   L0552D3
         PHX
         PHA
         PEA   $0000
         PHD
         JSL   L1B1CAB
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         LDA   L0552CD
         LDX   L0552CF
         PHX
         PHA
         PEA   $0000
         PHD
         JSL   L1B1CAB
         PEA   ^L0532B5
         PEA   L0532B5
         JSL   L08273B
L1B1D75  LDA   L055137
         STA   L055289
         LDA   L0552AB
         STA   L05528F
         LDA   L0552AF
         STA   L055293
         LDA   L0552A1
         STA   L05528B
         LDA   L0552A3
         STA   L05528D
         LDA   L0552B1
         STA   L055295
         LDA   L0552A9
         STA   L055291
         PEA   ^L051D96
         PEA   L051D96
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         LDAL  L051DA0
         TAX
         LDAL  L051D9E
         STAL  L051D92
         TXA
         STAL  L051D94
         PEA   $0000
         PEA   ^L051D72
         PEA   L051D72
         JSL   L150300
         STZ   L0552A1
         PLY
         PLY
         PLD
         RTL

L1B1DD8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   L0552BF
         LDA   #$0001
         STA   L0552C1
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         JSL   L1B31B9
         LDA   L055153
         BEQ   L1B1E03
         JSL   L0A0F21
L1B1E03  PEA   $0000
         JSL   L1B31DB
         JSL   L083E9E
         JSL   L1B1D2A
         STZ   L0550BF
         PLY
         PLY
         PLD
         RTL

L1B1E19	ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0552B9
         BEQ   L1B1E2A
         JSL   L160766
L1B1E2A  PEA   $0000
         JSL   L1B321E
         STZ   L0552B3
         LDX   #$0000
         LDAL  L052D64
         DEC
         BNE   L1B1E3F
         INX
L1B1E3F  TXA
         AND   L0552AD
         EOR   #$0001
         AND   L0552B1
         BEQ   L1B1E55
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L160774
L1B1E55  LDA   L055303
         LSR
         STA   L055301
         LDA   L055303
         PHA
         JSL   L16048E
         PLY
         PLY
         PLD
         RTL

L1B1E68  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L160218
         JSL   L0903F2
         JSL   L1B1D2A
         PLY
         PLY
         PLD
         RTL

L1B1E80  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L093A99
         JSL   L1B570C
         JSL   L1B1D2A
         LDA   #$0001
         STA   L0552A1
         LDA   #$0001
         STA   L055137
         LDA   #$0001
         STA   L055133
         JSL   L160456
         STZ   L0552A9
         LDA   #$0001
         STA   L05530D
         LDA   L055311
         BEQ   L1B1EBE
         LDA   L05530F
         STA   L05530D
L1B1EBE  PLY
         PLY
         PLD
         RTL

L1B1EC2  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0C
         JSL   L093A99
         JSL   L090A71
         LDA   L055319
         BEQ   L1B1EDD
         JSL   L16027A
L1B1EDD  LDA   L0552AB
         BEQ   L1B1EE6
         JSL   L160782
L1B1EE6  LDA   L0552A1
         BEQ   L1B1EEF
         JSL   L1B1D2A
L1B1EEF  PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         LDA   L055051
         AND   L055245
         PHA
         LDA   $0A
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L1B1F11
         JSL   L0903A6
         BRA   L1B1F32
L1B1F11  PHY
         JSL   L1603F4
         PLA
         LSR
         BCC   L1B1F1C
         BRA   L1B1F32
L1B1F1C  STZ   L0552A9
         LDA   L0552B1
         BEQ   L1B1F2B
         LDA   #$0001
         STA   $0C
         BRA   L1B1F32
L1B1F2B  PEA   $0004
         JSL   L0727E0
L1B1F32  LDA   $08
         STA   $0A
         LDA   $07
         STA   $09
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         RTL

L1B1F42  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $12
         LDX   $14
         PEA   $FFFF
         PEA   $FF57
         JSL   L150F53
         PHX
         PHA
         PEI   $18
         PEI   $16
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEA   $0000
         LDY   #$00E1
         LDA   [$12],Y
         PHA
         JSL   L1B0DFF
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   $18
         SEC
         SBC   #$0010
         PHA
         LDA   $16
         SEC
         SBC   #$0006
         PHA
         LDA   #$0010
         CLC
         ADC   $18
         PHA
         LDA   #$0006
         CLC
         ADC   $16
         PHA
         JSL   L15100B
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         LDA   $10
         STA   $18
         LDA   $0F
         STA   $17
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L1B1FC9  PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         PHY
         LDA   #$00E9
         CLC
         ADC   $2E
         LDX   $30
         BCC   L1B1FDD
         INX
L1B1FDD  PHX
         PHA
         LDA   #$00D9
         CLC
         ADC   $2E
         LDX   $30
         BCC   L1B1FEA
         INX
L1B1FEA  PHX
         PHA
         JSL   L1512CB
         PHY
         LDA   #$00E5
         CLC
         ADC   $2E
         LDX   $30
         BCC   L1B1FFC
         INX
L1B1FFC  PHX
         PHA
         LDA   #$00D9
         CLC
         ADC   $2E
         LDX   $30
         BCC   L1B2009
         INX
L1B2009  PHX
         PHA
         JSL   L1512CB
         PLA
         STA   $25
         PLA
         AND   $25
         STA   $03
         LDA   #$00E5
         CLC
         ADC   $2E
         LDX   $30
         BCC   L1B2022
         INX
L1B2022  CLC
         ADC   #$0002
         BCC   L1B2029
         INX
L1B2029  STA   $25
         STX   $27
         LDA   [$25]
         PHA
         LDA   #$00E9
         CLC
         ADC   $2E
         LDX   $30
         BCC   L1B203B
         INX
L1B203B  CLC
         ADC   #$0002
         BCC   L1B2042
         INX
L1B2042  STA   $25
         STX   $27
         PLA
         SEC
         SBC   [$25]
         STA   $21
         LDY   #$00E5
         LDA   [$2E],Y
         LDY   #$00E9
         SEC
         SBC   [$2E],Y
         STA   $23
         PHY
         LDA   $21
         BPL   L1B2062
         EOR   #$FFFF
         INC
L1B2062  LSR
         PHA
         LDA   $23
         BPL   L1B206C
         EOR   #$FFFF
         INC
L1B206C  PHA
         JSL   L072FA6
         PLA
         STA   $1F
         PHY
         PHY
         PEI   $21
         PEI   $1F
         JSL   L15133D
         PLA
         STA   $0D
         PLX
         STX   $0F
         PHY
         PHY
         PEI   $23
         PEI   $1F
         JSL   L15133D
         PLA
         STA   $11
         PLX
         STX   $13
         PHY
         PHY
         LDA   #$00E9
         CLC
         ADC   $2E
         LDX   $30
         BCC   L1B20A1
         INX
L1B20A1  CLC
         ADC   #$0002
         BCC   L1B20A8
         INX
L1B20A8  STA   $25
         STX   $27
         LDA   [$25]
         JSL   L150488
         PHX
         PHA
         PEA   $0010
         JSL   L1502B4
         PLA
         PLX
         CLC
         ADC   #$8000
         BCC   L1B20C4
         INX
L1B20C4  STA   $15
         STX   $17
         PHY
         PHY
         LDY   #$00E9
         LDA   [$2E],Y
         JSL   L150488
         PHX
         PHA
         PEA   $0010
         JSL   L1502B4
         PLA
         PLX
         CLC
         ADC   #$8000
         BCC   L1B20E5
         INX
L1B20E5  STA   $19
         STX   $1B
         LDA   $1F
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L1B20F8
         EOR   #$8000
L1B20F8  BPL   L1B2159
         LDA   #$0001
         STA   $1D
L1B20FF  LDA   $15
         LDX   $17
         PEI   $0F
         PEI   $0D
         JSL   L150F53
         STA   $15
         STX   $17
         LDA   $19
         LDX   $1B
         PEI   $13
         PEI   $11
         JSL   L150F53
         STA   $19
         STX   $1B
         LDA   $2E
         LDX   $30
         PEA   $FFFF
         PEA   $FF57
         JSL   L150F53
         PHX
         PHA
         PEI   $17
         PEI   $1B
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEI   $03
         LDY   #$00E1
         LDA   [$2E],Y
         PHA
         JSL   L1B0DFF
         LDA   $1D
         CMP   $01
         BEQ   L1B2159
         INC   $1D
         BRA   L1B20FF
L1B2159  LDY   #$00E7
         LDA   [$2E],Y
         PHA
         DEY
         DEY
         LDA   [$2E],Y
         PHA
         LDY   #$00EB
         LDA   [$2E],Y
         PHA
         DEY
         DEY
         LDA   [$2E],Y
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L071937
         LDA   $07
         SEC
         SBC   #$0010
         STA   $07
         LDA   #$0010
         CLC
         ADC   $0B
         STA   $0B
         LDA   $05
         SEC
         SBC   #$0006
         STA   $05
         LDA   #$0006
         CLC
         ADC   $09
         STA   $09
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         LDA   $2C
         STA   $30
         LDA   $2B
         STA   $2F
         LDA   $29
         TCD
         TSC
         CLC
         ADC   #$002E
         TCS
         RTL

L1B21C1  PHD
         TSC
         CLC
         ADC   #$FE66
         TCS
         ADC   #$00A9
         TCD
         TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         JSL   L1B5B24
         JSL   L1B1E80
         LDA   #$0008
         CMP   L0550BB
         BNE   L1B21EB
         LDA   #$0001
         STA   L0552A9
L1B21EB  LDA   L055233
         BEQ   L1B21FA
         LDA   #$0001
         SEC
         SBC   L0552A9
         STA   L0552A9
L1B21FA  LDA   L0552A9
         DEC
         BNE   L1B220A
         LDA   #L051D06
         LDX   #^L051D06
         STA   $F6
         STX   $F8
L1B220A  PEI   $F8
         PEI   $F6
         PEA   $0000
         TDC
         CLC
         ADC   #$FF57
         PHA
         JSL   L1B0F5F
         STZ   $E1
         PHY
         TDC
         CLC
         ADC   #$00F6
         PEA   $0000
         PHA
         PEA   ^L051D26
         PEA   L051D26
         PEA   $0020
         JSL   L070A10
         PLA
         LSR
         BCC   L1B223D
         LDA   #$0001
         STA   $E1
L1B223D  PEI   $FA
         JSL   L1B1BF5
         TDC
         CLC
         ADC   #$00D9
         PEA   $0000
         PHA
         JSL   L082712
         TDC
         CLC
         ADC   #$00D9
         PEA   $0000
         PHA
         PEA   $0010
         PEA   $0008
         JSL   L151005
         PEI   $EB
         PEI   $E9
         PEA   $0000
         PHD
         JSL   L1B1F42
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L081E53
         PEA   $0001
         JSL   L1B31DB
         PEI   $EB
         PEI   $E9
         JSL   L094E90
         LDA   #$0002
         STA   $D7
         LDA   #$0008
         CMP   L0550BB
         BNE   L1B229D
         STZ   $D7
L1B229D  LDA   #$000A
         CMP   L0550BB
         BNE   L1B22AA
         LDA   #$0004
         STA   $D7
L1B22AA  TDC
         CLC
         ADC   #$00E5
         PEA   $0000
         PHA
         JSL   L1B5B24
         TDC
         CLC
         ADC   #$00E5
         PEA   $0000
         PHA
         JSL   L09457C
         LDA   $E7
         SEC
         SBC   $EB
         BPL   L1B22CF
         EOR   #$FFFF
         INC
L1B22CF  PHA
         LDA   $E5
         SEC
         SBC   $E9
         BPL   L1B22DB
         EOR   #$FFFF
         INC
L1B22DB  ASL
         STA   $ED
         PLA
         CLC
         ADC   $ED
         SEC
         SBC   $D7
         BEQ   L1B232B
         BVS   L1B22EC
         EOR   #$8000
L1B22EC  BPL   L1B232B
         LDA   #$000A
         CMP   L0550BB
         BNE   L1B2304
         PEI   $E7
         PEI   $E5
         PEA   $0000
         PHD
         JSL   L1B1F42
         BRA   L1B230C
L1B2304  PEA   $0000
         PHD
         JSL   L1B1FC9
L1B230C  PEA   ^L0532BD
         PEA   L0532BD
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L081E53
         PEA   $0001
         JSL   L1B31DB
         LDA   $E5
         LDX   $E7
         STA   $E9
         STX   $EB
L1B232B  PHY
         JSL   L096CC4
         PLA
         EOR   #$0001
         BNE   L1B2339
         BRL   L1B22AA
L1B2339  LDA   #$0001
         STA   L0552AB
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$01A2
         TCS
         RTL

L1B2351  PHD
         TSC
         CLC
         ADC   #$FFD2
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $38
         PEI   $36
         PEA   $0008
         JSL   L0313BE
         PHY
         PEA   ^L053259
         PEA   L053259
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCS   L1B2391
         BRL   L1B24AC
L1B2391  LDA   $03
         AND   #$FFF8
         STA   $03
         LDA   #$0007
         CLC
         ADC   $07
         AND   #$FFF8
         STA   $07
         LDA   $05
         SEC
         SBC   $01
         STA   $0B
         LDA   $03
         LSR
         LSR
         LSR
         AND   #$7FFF
         STA   $0F
         LDA   $07
         LSR
         LSR
         LSR
         AND   #$7FFF
         SEC
         SBC   $0F
         STA   $0D
         LDA   #$0050
         SEC
         SBC   $0D
         ASL
         STA   $11
         LDA   $0F
         ASL
         PHA
         LDA   $01
         PEA   $00A0
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $09
         PEI   $50
         PEI   $4E
         LDA   $09
         JSL   L150488
         JSL   L150F53
         STA   $13
         STX   $15
         PEI   $4C
         PEI   $4A
         LDA   $09
         JSL   L150488
         JSL   L150F53
         STA   $17
         STX   $19
         PEI   $48
         PEI   $46
         LDA   $09
         JSL   L150488
         JSL   L150F53
         STA   $1B
         STX   $1D
         PEI   $44
         PEI   $42
         LDA   $09
         JSL   L150488
         JSL   L150F53
         STA   $1F
         STX   $21
         PEI   $40
         PEI   $3E
         LDA   $09
         JSL   L150488
         JSL   L150F53
         STA   $23
         STX   $25
         PEI   $3C
         PEI   $3A
         LDA   $09
         JSL   L150488
         JSL   L150F53
         STA   $27
         STX   $29
         LDA   $34
         SEC
         SBC   #$FFFC
         BVS   L1B2456
         BMI   L1B24AC
         BRA   L1B2458
L1B2456  BPL   L1B24AC
L1B2458  CMP   #$0002
         BPL   L1B24AC
         SEC
         SBC   #$0000
         BEQ   L1B248C
         DEC
         BEQ   L1B2468
         BRA   L1B24AC
L1B2468  PEI   $15
         PEI   $13
         PEI   $19
         PEI   $17
         PEI   $1D
         PEI   $1B
         PEI   $21
         PEI   $1F
         PEI   $25
         PEI   $23
         PEI   $29
         PEI   $27
         PEI   $0B
         PEI   $0D
         PEI   $11
         JSL   L1B0AA0
         BRA   L1B24AC
L1B248C  PEI   $15
         PEI   $13
         PEI   $19
         PEI   $17
         PEI   $1D
         PEI   $1B
         PEI   $21
         PEI   $1F
         PEI   $29
         PEI   $27
         PEI   $0B
         PEI   $0D
         PEI   $11
         JSL   L1B08BF
         BRA   L1B24AC
L1B24AC  LDA   $32
         STA   $50
         LDA   $31
         STA   $4F
         LDA   $2F
         TCD
         TSC
         CLC
         ADC   #$004E
         TCS
         RTL

L1B24BE  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         PHY
         PEI   $24
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $24
         PHY
         PHY
         JSL   L15140C
         PLA
         STA   $28
         PLX
         STX   $2A
         LDA   $26
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L1B24EE
         EOR   #$8000
L1B24EE  BMI   L1B24F3
         BRL   L1B2587
L1B24F3  LDA   #$0001
         STA   $0B
L1B24F8  PEI   $24
         PHY
         PHY
         PHY
         PEI   $18
         PEI   $16
         PHY
         PHY
         PHY
         PHY
         PEI   $20
         PEI   $1E
         JSL   L15169F
         JSL   L1511BC
         JSL   L15036B
         JSL   L1500DD
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $09
         PEI   $22
         PHY
         PHY
         PHY
         PEI   $18
         PEI   $16
         PHY
         PHY
         PHY
         PHY
         PEI   $20
         PEI   $1E
         JSL   L15012C
         JSL   L1511BC
         JSL   L15036B
         JSL   L1500DD
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $07
         LDA   $09
         ASL
         STA   $09
         LDA   $0B
         DEC
         BNE   L1B2564
         PEI   $09
         PEI   $07
         JSL   L1510C5
         LDA   $09
         STA   $05
         LDA   $07
         STA   $03
         BRA   L1B256C
L1B2564  PEI   $09
         PEI   $07
         JSL   L1505DA
L1B256C  LDA   $1E
         LDX   $20
         PEI   $1C
         PEI   $1A
         JSL   L150F53
         STA   $1E
         STX   $20
         LDA   $0B
         CMP   $01
         BEQ   L1B2587
         INC   $0B
         BRL   L1B24F8
L1B2587  PEI   $05
         PEI   $03
         JSL   L1505DA
         JSL   L1501A3
         LDA   $14
         STA   $26
         LDA   $13
         STA   $25
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L1B25A5  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $10
         BPL   L1B25B3
         BRA   L1B2603
L1B25B3  LDA   $10
         SEC
         SBC   #$0280
         BVS   L1B25BE
         EOR   #$8000
L1B25BE  BPL   L1B25C2
         BRA   L1B2603
L1B25C2  LDA   $0E
         BPL   L1B25C8
         BRA   L1B2603
L1B25C8  LDA   $0E
         SEC
         SBC   #$00C8
         BVS   L1B25D3
         EOR   #$8000
L1B25D3  BPL   L1B25D7
         BRA   L1B2603
L1B25D7  PHY
         PEI   $10
         PEI   $0E
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         JSL   L1B17BA
         PLA
         BEQ   L1B25F8
         LDY   #$000F
         LDA   [$0A],Y
         INC
         LDY   #$000F
         STA   [$0A],Y
         BRA   L1B2603
L1B25F8  LDY   #$000D
         LDA   [$0A],Y
         INC
         LDY   #$000D
         STA   [$0A],Y
L1B2603  LDA   $08
         STA   $10
         LDA   $07
         STA   $0F
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L1B2615	ENT
         PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         STZ   $0F
         STZ   $0D
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $FFFF
         JSL   L151005
         PHY
         LDA   $07
         CLC
         ADC   $03
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $09
         PHY
         LDA   $05
         CLC
         ADC   $01
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $0B
         PEI   $03
         PEI   $0B
         PEA   $0000
         PHD
         JSL   L1B25A5
         PEI   $07
         PEI   $0B
         PEA   $0000
         PHD
         JSL   L1B25A5
         PEI   $09
         PEI   $01
         PEA   $0000
         PHD
         JSL   L1B25A5
         PEI   $09
         PEI   $05
         PEA   $0000
         PHD
         JSL   L1B25A5
         PEI   $03
         PEI   $01
         PEA   $0000
         PHD
         JSL   L1B25A5
         PEI   $03
         PEI   $05
         PEA   $0000
         PHD
         JSL   L1B25A5
         PEI   $07
         PEI   $01
         PEA   $0000
         PHD
         JSL   L1B25A5
         PEI   $07
         PEI   $05
         PEA   $0000
         PHD
         JSL   L1B25A5
         LDA   $0D
         SEC
         SBC   $0F
         BVS   L1B26D6
         EOR   #$8000
L1B26D6  BPL   L1B26DD
         LDA   #$0000
         BRA   L1B26E0
L1B26DD  LDA   #$0001
L1B26E0  STA   L0552A3
         TSC
         CLC
         ADC   #$0014
         TCS
         PLD
         RTL

L1B26EB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         LDA   L0551EF
         STA   $11
         LDA   #$0001
         STA   L0551EF
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L082712
         LDA   L0552FF
         BEQ   L1B2726
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   ^L051D5E
         PEA   L051D5E
         PEA   $0008
         JSL   L0313BE
L1B2726  LDA   $1C
         LDX   $1E
         STA   $01
         STX   $03
         LDY   #$0006
         LDA   [$01],Y
         LDY   #$0002
         SEC
         SBC   [$01],Y
         STA   $0F
         LDY   #$0004
         LDA   [$01],Y
         SEC
         SBC   [$01]
         STA   $0D
         LDA   #$0002
         CLC
         ADC   $01
         LDX   $03
         BCC   L1B2750
         INX
L1B2750  PHX
         PHA
         PHY
         LDA   $0B
         CLC
         ADC   $07
         SEC
         SBC   $0F
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         PLX
         STX   $13
         PLX
         STX   $15
         STA   [$13]
         PEI   $03
         PEI   $01
         PHY
         LDA   $09
         CLC
         ADC   $05
         SEC
         SBC   $0D
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         PLX
         STX   $13
         PLX
         STX   $15
         STA   [$13]
         PEI   $03
         PEI   $01
         JSL   L1B5BFC
         LDY   #$0002
         LDA   $0F
         CLC
         ADC   [$01],Y
         LDY   #$0006
         STA   [$01],Y
         LDA   $0D
         CLC
         ADC   [$01]
         LDY   #$0004
         STA   [$01],Y
         LDA   $11
         STA   L0551EF
         PEI   $1E
         PEI   $1C
         JSL   L1B27C8
         LDA   $1A
         STA   $1E
         LDA   $19
         STA   $1D
         LDA   $17
         TCD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L1B27C8  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   L0552FF
         BEQ   L1B280A
         PHY
         PEI   $16
         PEI   $14
         PEA   ^L051D5E
         PEA   L051D5E
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         STA   $09
         PHY
         PEI   $16
         PEI   $14
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCS   L1B280A
         JSL   L1603A0
L1B280A  LDA   $12
         STA   $16
         LDA   $11
         STA   $15
         LDA   $0F
         TCD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

L1B281C  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $16
         DEC
         PHA
         PEA   $0004
         JSL   L150318
         PLX
         PLX
         STA   $05
         LDA   $16
         DEC
         PHA
         PEA   $0004
         JSL   L1500F5
         PLX
         PLX
         STA   $07
         LDA   #$0001
         CLC
         ADC   $12
         LDX   $14
         BCC   L1B284D
         INX
L1B284D  STA   $01
         STX   $03
         LDA   $01
         LDX   $03
         STA   $09
         STX   $0B
         LDA   $05
         PEA   $0014
         JSL   L150BEE
         PLA
         CLC
         ADC   #$0004
         STA   [$09]
         LDA   #$0002
         CLC
         ADC   $01
         LDX   $03
         BCC   L1B2874
         INX
L1B2874  STA   $09
         STX   $0B
         LDA   $07
         PEA   $0028
         JSL   L150BEE
         PLA
         CLC
         ADC   #$0008
         STA   [$09]
         LDA   #$0010
         CLC
         ADC   [$01]
         LDY   #$0004
         STA   [$01],Y
         LDY   #$0002
         LDA   #$0020
         CLC
         ADC   [$01],Y
         LDY   #$0006
         STA   [$01],Y
         LDA   $10
         STA   $16
         LDA   $0F
         STA   $15
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

L1B28B3  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L1510A1
         PEA   ^L051D06
         PEA   L051D06
         JSL   L151198
         PEA   $0002
         JSL   L150BD6
         PEA   $0002
         PEA   $0001
         JSL   L151083
         LDA   L055305
         PHA
         PEA   $0000
         PEI   $0A
         JSL   L1B281C
         LDA   #$0001
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L1B28F2
         INX
L1B28F2  PHX
         PHA
         PEA   $FFFC
         PEA   $FFFE
         JSL   L151005
         LDA   #$0001
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L1B2909
         INX
L1B2909  PHX
         PHA
         JSL   L151418
         LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L1B2920  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC8
         TCS
         TCD
         JSL   L1B1D2A
         PHY
         JSL   L0727BF
         PLA
         STA   $2B
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $2D
         PLX
         STX   $2F
         PHY
         PHY
         PEA   $0578
         JSL   L072834
         PLA
         STA   $31
         PLX
         STX   $33
         LDA   #$0080
         STA   $19
         LDA   #$0008
         STA   $1F
         STZ   $23
         STZ   $21
         LDA   #$0020
         STA   $27
         LDA   #$000C
         STA   $25
         LDA   #L051C46
         LDX   #^L051C46
         STA   $1B
         STX   $1D
         PEI   $33
         PEI   $31
         JSL   L15102F
         PEI   $33
         PEI   $31
         JSL   L151131
L1B2981  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $29
         LDA   #$FFFE
         CMP   $29
         BNE   L1B29F8
         PEI   $33
         PEI   $31
         JSL   L1506B3
         PEI   $33
         PEI   $31
         JSL   L1517CD
         LDA   #$0001
         STA   $17
L1B29A8  PEI   $17
         PEA   $0000
         PHD
         JSL   L1B281C
         PEI   $17
         JSL   L1B1BF5
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         LDA   #$0004
         CLC
         ADC   $03
         PHA
         LDA   $01
         INC
         INC
         PHA
         PEA   $0002
         JSL   L15025A
         LDA   #$0020
         CMP   $17
         BEQ   L1B29E8
         INC   $17
         BRA   L1B29A8
L1B29E8  PEA   $0000
         PHD
         JSL   L1B28B3
         PEI   $33
         PEI   $31
         JSL   L1506AD
L1B29F8  LDA   #$FFFC
         CMP   $29
         BNE   L1B2981
         PEA   ^L0540A9
         PEA   L0540A9
         JSL   L150BE8
         PHY
         LDAL  L0540A9
         DEC
         DEC
         PHA
         PEA   $0014
         JSL   L1500F5
         PLX
         PLX
         PHA
         PEA   $0000
         PEA   $0003
         JSL   L071A1B
         PLA
         STA   $11
         PHY
         LDAL  L0540AB
         SEC
         SBC   #$0004
         PHA
         PEA   $0028
         JSL   L1500F5
         PLX
         PLX
         PHA
         PEA   $0000
         PEA   $0007
         JSL   L071A1B
         PLA
         STA   $13
         LDA   $11
         INC
         PHA
         LDA   $13
         ASL
         ASL
         STA   $35
         PLA
         CLC
         ADC   $35
         STA   $15
         PEA   $0000
         PHD
         JSL   L1B28B3
         LDA   $15
         STA   L055305
         PEA   $0000
         PHD
         JSL   L1B28B3
L1B2A6E  PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BEQ   L1B2A6E
         PEI   $33
         PEI   $31
         JSL   L072634
         PEI   $2B
         JSL   L0724F7
         PEI   $2F
         PEI   $2D
         JSL   L151131
         JSL   L1B64BB
         LDA   #$0001
         STA   L055249
         JSL   L1510A1
         LDA   L055305
         PHA
         JSL   L1B1BF5
         LDA   #$0007
         CMP   L0550BB
         BEQ   L1B2AB7
         PEA   $0007
         JSL   L0A02BC
L1B2AB7  TSC
         CLC
         ADC   #$0038
         TCS
         PLD
         RTL

L1B2ABF  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   #$0009
         CLC
         ADC   $12
         LDX   $14
         BCC   L1B2AD2
         INX
L1B2AD2  STA   $01
         STX   $03
         LDA   #$0006
         CLC
         ADC   [$01]
         STA   [$16]
         LDY   #$0004
         LDA   [$01],Y
         SEC
         SBC   #$0006
         LDY   #$0004
         STA   [$16],Y
         LDY   #$0017
         LDA   [$12],Y
         PHA
         LDY   #$0015
         LDA   [$12],Y
         JSL   L150BEE
         PLA
         STA   $07
         LDY   #$0015
         LDA   [$12],Y
         DEC
         ASL
         TAX
         LDAL  L051EB2,X
         ASL
         STA   $05
         LDA   #$0002
         CLC
         ADC   $16
         LDX   $18
         BCC   L1B2B18
         INX
L1B2B18  PHX
         PHA
         PEI   $07
         PHY
         PEI   $05
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $09
         PLA
         SEC
         SBC   $09
         PLX
         STX   $09
         PLX
         STX   $0B
         STA   [$09]
         LDY   #$0002
         LDA   $05
         CLC
         ADC   [$16],Y
         LDY   #$0006
         STA   [$16],Y
         LDA   $10
         STA   $18
         LDA   $0F
         STA   $17
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L1B2B54  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEI   $12
         JSL   L1B2ABF
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $FFF2
         PEA   $FFFC
         JSL   L151005
         PEA   $0004
         PEA   $0002
         JSL   L151083
         PEA   $0002
         JSL   L150BD6
         PEA   $FFFF
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L151418
         JSL   L1510A1
         LDA   $10
         STA   $14
         LDA   $0F
         STA   $13
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L1B2BBC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         JSL   L1B1D2A
         PHY
         JSL   L0727BF
         PLA
         STA   $1B
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $21
         PLX
         STX   $23
         PHY
         PHY
         PEA   $04B0
         JSL   L072834
         PLA
         STA   $1D
         PLX
         STX   $1F
         LDA   #$0001
         STA   $15
L1B2BF0  LDA   $15
         DEC
         ASL
         TAX
         LDA   L055303
         CMPL  L051EB2,X
         BNE   L1B2C00
         BRA   L1B2C0B
L1B2C00  LDA   #$0006
         CMP   $15
         BEQ   L1B2C0B
         INC   $15
         BRA   L1B2BF0
L1B2C0B  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         LDA   #$0010
         CLC
         ADC   $1D
         LDX   $1F
         BCC   L1B2C1F
         INX
L1B2C1F  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $0F
         SEC
         SBC   $0B
         PHA
         PEA   $0007
         JSL   L1500F5
         PLX
         PLX
         STA   $17
         PEI   $1F
         PEI   $1D
         JSL   L15102F
         PEI   $1F
         PEI   $1D
         JSL   L151131
L1B2C49  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $19
         LDA   #$FFFE
         CMP   $19
         BNE   L1B2CB1
         PEI   $1F
         PEI   $1D
         JSL   L1506B3
         PEI   $1F
         PEI   $1D
         JSL   L1517CD
         LDA   $15
         STA   $13
         LDA   #$0001
         STA   $15
L1B2C74  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L1B2ABF
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L15037D
         LDA   #$0006
         CMP   $15
         BEQ   L1B2C9D
         INC   $15
         BRA   L1B2C74
L1B2C9D  LDA   $13
         STA   $15
         PEA   $0000
         PHD
         JSL   L1B2B54
         PEI   $1F
         PEI   $1D
         JSL   L1506AD
L1B2CB1  LDA   #$FFFC
         CMP   $19
         BNE   L1B2C49
         PEA   $0000
         PHD
         JSL   L1B2B54
         PEA   ^L0540A9
         PEA   L0540A9
         JSL   L150BE8
         PHY
         LDAL  L0540AB
         PHA
         PHY
         PEI   $17
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         CLC
         ADC   $01,S
         PLX
         PHA
         PEI   $17
         JSL   L1500F5
         PLX
         PLX
         PHA
         PEA   $0001
         PEA   $0006
         JSL   L071A1B
         PLA
         STA   $15
         PEA   $0000
         PHD
         JSL   L1B2B54
L1B2CFE  PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BEQ   L1B2CFE
         PEI   $1F
         PEI   $1D
         JSL   L072634
         PEI   $1B
         JSL   L0724F7
         PEI   $23
         PEI   $21
         JSL   L151131
         LDA   $15
         DEC
         ASL
         TAX
         LDAL  L051EB2,X
         PHA
         JSL   L0A1225
         LDA   #$0001
         STA   L055249
         TSC
         CLC
         ADC   #$0028
         TCS
         PLD
         RTL

L1B2D3E  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDY   #$0001
         LDA   [$12],Y
         DEC
         DEC
         DEC
         PEA   $0036
         JSL   L150BEE
         PLA
         CLC
         ADC   #$0018
         STA   $03
         LDA   #$0036
         CLC
         ADC   $03
         STA   $07
         LDA   #$0002
         STA   $01
         LDA   #$0015
         STA   $05
         PEA   $0004
         PEA   $0002
         JSL   L151083
         PEA   $0002
         JSL   L150BD6
         PEA   $FFFF
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L151418
         JSL   L1510A1
         LDA   $10
         STA   $14
         LDA   $0F
         STA   $13
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L1B2DA9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         JSL   L1B1D2A
         PHY
         JSL   L0727BF
         PLA
         STA   $05
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $07
         PLX
         STX   $09
         PHY
         PHY
         PEA   $03E8
         JSL   L072834
         PLA
         STA   $0B
         PLX
         STX   $0D
         LDA   L055307
         DEC
         DEC
         DEC
         BMI   L1B2E06
         CMP   #$0006
         BPL   L1B2E06
         SEC
         SBC   #$0000
         BMI   L1B2E06
         CMP   #$0004
         BCC   L1B2DF8
         SEC
         SBC   #$0005
         BEQ   L1B2DFF
         BRA   L1B2E06
L1B2DF8  LDA   L055307
         STA   $01
         BRA   L1B2E0E
L1B2DFF  LDA   #$0007
         STA   $01
         BRA   L1B2E0E
L1B2E06  STZ   L055307
         LDA   #$0008
         STA   $01
L1B2E0E  PEI   $0D
         PEI   $0B
         JSL   L15102F
         PEI   $0D
         PEI   $0B
         JSL   L151131
L1B2E1E  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $03
         LDA   #$FFFE
         CMP   $03
         BNE   L1B2E54
         PEI   $0D
         PEI   $0B
         JSL   L1506B3
         PEI   $0D
         PEI   $0B
         JSL   L1517CD
         JSL   L1B0CF7
         PEA   $0000
         PHD
         JSL   L1B2D3E
         PEI   $0D
         PEI   $0B
         JSL   L1506AD
L1B2E54  LDA   #$FFFC
         CMP   $03
         BNE   L1B2E1E
         PEA   $0000
         PHD
         JSL   L1B2D3E
         PEA   ^L0540A9
         PEA   L0540A9
         JSL   L150BE8
         PHY
         LDAL  L0540AB
         SEC
         SBC   #$0018
         PHA
         PEA   $0036
         JSL   L1500F5
         PLX
         PLX
         INC
         INC
         INC
         PHA
         PEA   $0003
         PEA   $0008
         JSL   L071A1B
         PLA
         STA   $01
         PEA   $0000
         PHD
         JSL   L1B2D3E
         LDA   $01
         SEC
         SBC   #$0007
         BMI   L1B2EBE
         CMP   #$0002
         BPL   L1B2EBE
         SEC
         SBC   #$0000
         BEQ   L1B2EB1
         DEC
         BEQ   L1B2EB9
         BRA   L1B2EBE
L1B2EB1  LDA   #$0008
         STA   L055307
         BRA   L1B2EC3
L1B2EB9  STZ   L055307
         BRA   L1B2EC3
L1B2EBE  LDA   $01
         STA   L055307
L1B2EC3  PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BEQ   L1B2EC3
         PEI   $0D
         PEI   $0B
         JSL   L072634
         PEI   $05
         JSL   L0724F7
         PEI   $09
         PEI   $07
         JSL   L151131
         LDA   #$0001
         STA   L055249
         JSL   L1B64BB
         LDA   #$0011
         CMP   L0550BB
         BEQ   L1B2F00
         PEA   $0011
         JSL   L0A02BC
L1B2F00  TSC
         CLC
         ADC   #$0012
         TCS
         PLD
         RTL

L1B2F08  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   L055139
         BNE   L1B2F6A
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L05310F
         PEA   L05310F
         PEA   $0008
         JSL   L0313BE
         PHY
         PHY
         JSL   L1B5BD5
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         PEA   ^L05310F
         PEA   L05310F
         JSL   L083523
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L05310F
         PEA   L05310F
         PEA   ^L0532B5
         PEA   L0532B5
         JSL   L081E5F
         LDA   #$0001
         STA   L055139
L1B2F6A  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L1B2F72  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   L0552C1
         BNE   L1B2F82
         BRL   L1B30A3
L1B2F82  LDA   L05514F
         ORA   L055153
         BEQ   L1B2FAB
         LDA   L0552DD
         LDX   L0552DF
         PHX
         PHA
         PEA   $FFFF
         PEA   ^L053259
         PEA   L053259
         JSL   L085B3C
         PEA   ^L051E2A
         PEA   L051E2A
         JSL   L08273B
         BRA   L1B301E
L1B2FAB  LDA   L055135
         BEQ   L1B2FFE
         PEA   ^L051E2A
         PEA   L051E2A
         PEA   ^L053117
         PEA   L053117
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L081E5F
         LDA   L055109
         LDX   L05510B
         PHX
         PHA
         LDA   L0552DD
         LDX   L0552DF
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L08382C
         PEA   ^L051E2A
         PEA   L051E2A
         PEA   ^L053117
         PEA   L053117
         PEA   $0008
         JSL   L0313BE
         BRA   L1B301E
L1B2FFE  LDA   L055115
         LDX   L055117
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L0552DD
         LDX   L0552DF
         PHX
         PHA
         PEA   ^L051E2A
         PEA   L051E2A
         JSL   L083523
L1B301E  LDA   L055153
         BNE   L1B30A0
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L051E82
         PEA   L051E82
         JSL   L1506A7
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L053127
         PEA   L053127
         PEA   $0008
         JSL   L0313BE
         PEA   ^L053127
         PEA   L053127
         PEA   ^L051E2A
         PEA   L051E2A
         PEA   $0008
         JSL   L0313BE
         PEA   $0000
         PEA   $0002
         PEA   $0000
         JSL   L084F9B
         PEA   ^L051E2A
         PEA   L051E2A
         PEA   ^L053127
         PEA   L053127
         PEA   $0008
         JSL   L0313BE
         PEA   ^L053127
         PEA   L053127
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
L1B30A0  STZ   L0552C1
L1B30A3  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L1B30AB  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0552BF
         AND   L0552C3
         BNE   L1B30BE
         BRL   L1B3185
L1B30BE  LDA   L0552D5
         LDX   L0552D7
         PHX
         PHA
         PEA   $FFFF
         PEA   ^L051E22
         PEA   L051E22
         JSL   L085B3C
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L051E62
         PEA   L051E62
         JSL   L1506A7
         LDA   L055153
         BEQ   L1B30FB
         PEA   $0000
         PEA   $0002
         PEA   $0001
         JSL   L084F9B
         BRA   L1B310B
L1B30FB  PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0001
         JSL   L081517
L1B310B  LDA   L0552D9
         LDX   L0552DB
         PHX
         PHA
         PEA   $0000
         PEA   ^L051E22
         PEA   L051E22
         JSL   L085B3C
         PEA   ^L051E72
         PEA   L051E72
         JSL   L1506A7
         LDA   L055153
         BEQ   L1B313E
         PEA   $0000
         PEA   $0002
         PEA   $0002
         JSL   L084F9B
         BRA   L1B314E
L1B313E  PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0002
         JSL   L081517
L1B314E  PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PEA   ^L051E22
         PEA   L051E22
         PEA   ^L053107
         PEA   L053107
         PEA   $0008
         JSL   L0313BE
         LDAL  L051E24
         AND   #$FFF8
         STAL  L051E24
         LDA   #$0007
         CLC
         ADCL  L051E28
         AND   #$FFF8
         STAL  L051E28
L1B3185  STZ   L0552BF
         PLY
         PLY
         PLD
         RTL

L1B318C	ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   L055311
         LDA   #$0001
         STA   L05530F
         STZ   L05530B
         STZ   L055309
         LDA   L0552FF
         BEQ   L1B31AC
         JSL   L1603A0
L1B31AC  LDA   L055313
         BEQ   L1B31B5
         JSL   L160392
L1B31B5  PLY
         PLY
         PLD
         RTL

L1B31B9  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   L0552B1
         STZ   L0552A9
         STZ   L0552AF
         STZ   L0552AB
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L08273B
         PLY
         PLY
         PLD
         RTL

L1B31DB  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   $0008
         JSL   L0313BE
         PEI   $14
         JSL   L1B321E
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L160774
         LDA   $12
         STA   $14
         LDA   $11
         STA   $13
         LDA   $0F
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L1B321E  ENT
	PHD
         TSC
         CLC
         ADC   #$FFBA
         TCS
         TCD
         PHY
         PEA   ^L053259
         PEA   L053259
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L150B3A
         PLA
         LSR
         BCS   L1B3244
         BRL   L1B3605
L1B3244  JSL   L1B2F08
         LDAL  L0532BF
         AND   #$FFF8
         STAL  L0532BF
         LDA   #$0007
         CLC
         ADCL  L0532C3
         AND   #$FFF8
         STAL  L0532C3
         TDC
         CLC
         ADC   #$0001
         STA   $09
         STZ   $0B
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L15071D
         LDA   L0552AB
         ORA   $4C
         ORA   L0552B1
         STA   $4C
         LDA   L055153
         BNE   L1B329E
         BRL   L1B339A
L1B329E  PEA   ^L05310F
         PEA   L05310F
         PEA   ^L053127
         PEA   L053127
         PEI   $0B
         PEI   $09
         JSL   L081E5F
         LDA   L05514F
         BEQ   L1B32D9
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   $FFFF
         PEA   ^L053127
         PEA   L053127
         JSL   L085B3C
         PEA   ^L053127
         PEA   L053127
         JSL   L08273B
         BRL   L1B3397
L1B32D9  LDA   $4C
         BEQ   L1B3353
         PEA   ^L051E1A
         PEA   L051E1A
         PEI   $0B
         PEI   $09
         JSL   L081E53
         PHY
         PEI   $0B
         PEI   $09
         PEA   ^L0532BD
         PEA   L0532BD
         PEI   $0B
         PEI   $09
         JSL   L150B3A
         PLA
         STA   $0F
         LDA   #$FFFF
         STA   $0D
         LDA   L0552A9
         DEC
         BNE   L1B3311
         LDA   #$0001
         STA   $0D
L1B3311  LDA   L055105
         LDX   L055107
         PHX
         PHA
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $0B
         PEI   $09
         PEI   $0D
         JSL   L0836B6
         PEA   ^L05310F
         PEA   L05310F
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L053127
         PEA   L053127
         JSL   L081E5F
         BRA   L1B3397
L1B3353  PHY
         PEI   $0B
         PEI   $09
         PEA   ^L0532BD
         PEA   L0532BD
         PEI   $0B
         PEI   $09
         JSL   L150B3A
         PLA
         STA   $0F
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $0B
         PEI   $09
         PEA   $0000
         JSL   L08382C
         PEA   ^L053127
         PEA   L053127
         PEA   ^L05310F
         PEA   L05310F
         PEA   $0008
         JSL   L0313BE
L1B3397  BRL   L1B3586
L1B339A  LDA   L0552C1
         BEQ   L1B33A3
         JSL   L1B2F72
L1B33A3  LDA   L055151
         BEQ   L1B3403
         PEA   ^L051E2A
         PEA   L051E2A
         PEA   ^L053127
         PEA   L053127
         PEI   $0B
         PEI   $09
         JSL   L081E5F
         PHY
         PEI   $0B
         PEI   $09
         PEA   ^L0532BD
         PEA   L0532BD
         PEI   $0B
         PEI   $09
         JSL   L150B3A
         PLA
         STA   $0F
         LDA   L0552DD
         LDX   L0552DF
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $0B
         PEI   $09
         PEA   $0000
         JSL   L08382C
         PEA   ^L053127
         PEA   L053127
         PEA   ^L051E2A
         PEA   L051E2A
         PEA   $0008
         JSL   L0313BE
         BRL   L1B3586
L1B3403  PEA   ^L05310F
         PEA   L05310F
         PEA   ^L053127
         PEA   L053127
         PEI   $0B
         PEI   $09
         JSL   L081E5F
         PEA   ^L051E2A
         PEA   L051E2A
         PEI   $0B
         PEI   $09
         JSL   L081E53
         LDA   $4C
         BNE   L1B342C
         BRL   L1B352F
L1B342C  PEA   ^L051E1A
         PEA   L051E1A
         PEI   $0B
         PEI   $09
         JSL   L081E53
         PHY
         PEI   $0B
         PEI   $09
         PEA   ^L0532BD
         PEA   L0532BD
         PEI   $0B
         PEI   $09
         JSL   L150B3A
         PLA
         STA   $0F
         LDA   L0552A9
         DEC
         DEC
         BNE   L1B34BD
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $0B
         PEI   $09
         PEA   $0003
         JSL   L0836B6
         LDA   L0552DD
         LDX   L0552DF
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $0B
         PEI   $09
         PEA   $FFFD
         JSL   L1B2351
         BRA   L1B3507
L1B34BD  LDA   #$FFFD
         STA   $0D
         LDA   L0552A9
         DEC
         BNE   L1B34CD
         LDA   #$FFFC
         STA   $0D
L1B34CD  LDA   L0552DD
         LDX   L0552DF
         PHX
         PHA
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $0B
         PEI   $09
         PEI   $0D
         JSL   L1B2351
L1B3507  PEA   ^L05310F
         PEA   L05310F
         PEA   ^L051E2A
         PEA   L051E2A
         PEA   ^L053127
         PEA   L053127
         JSL   L081E5F
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L053127
         PEA   L053127
         JSL   L081E53
         BRA   L1B3586
L1B352F  PHY
         PEI   $0B
         PEI   $09
         PEA   ^L0532BD
         PEA   L0532BD
         PEI   $0B
         PEI   $09
         JSL   L150B3A
         PLA
         STA   $0F
         LDA   L0552DD
         LDX   L0552DF
         PHX
         PHA
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $0B
         PEI   $09
         PEA   $FFFF
         JSL   L0836B6
         PEA   ^L05310F
         PEA   L05310F
         PEA   ^L051E2A
         PEA   L051E2A
         PEA   ^L053127
         PEA   L053127
         JSL   L081E5F
L1B3586  LDA   L0552C3
         BEQ   L1B35EE
         LDA   L0552BF
         BEQ   L1B3594
         JSL   L1B30AB
L1B3594  PHY
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   ^L051E22
         PEA   L051E22
         PEI   $0B
         PEI   $09
         JSL   L150B3A
         PLA
         LSR
         BCC   L1B35EE
         LDA   L0552D9
         LDX   L0552DB
         PHX
         PHA
         LDA   L0552D5
         LDX   L0552D7
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $0B
         PEI   $09
         PEA   $FFFE
         JSL   L0836B6
         PEA   ^L053127
         PEA   L053127
         PEA   ^L051E22
         PEA   L051E22
         PEA   ^L053127
         PEA   L053127
         JSL   L081E5F
L1B35EE  TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L150717
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L08273B
L1B3605  LDA   $4A
         STA   $4C
         LDA   $49
         STA   $4B
         LDA   $47
         TCD
         TSC
         CLC
         ADC   #$004A
         TCS
         RTL

L1B3617  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PEI   $22
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $22
         LDA   #$0002
         CLC
         ADC   $1C
         LDX   $1E
         BCC   L1B3637
         INX
L1B3637  PHX
         PHA
         PHY
         LDY   #$0002
         LDA   [$1C],Y
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         PLX
         STX   $05
         PLX
         STX   $07
         STA   [$05]
         PHY
         JSL   L099DCE
         PLA
         LSR
         BCC   L1B365F
         LDA   #$0001
         STA   L05522F
L1B365F  LDA   $1A
         SEC
         SBC   #$0002
         BEQ   L1B366E
         BVS   L1B366C
         EOR   #$8000
L1B366C  BMI   L1B3673
L1B366E  LDA   #$0000
         BRA   L1B3676
L1B3673  LDA   #$0001
L1B3676  ORA   L05522F
         BNE   L1B367E
         BRL   L1B3706
L1B367E  LDA   $16
         LDX   $18
         STA   $05
         STX   $07
         PHY
         PHY
         LDY   #$0002
         LDA   [$1C],Y
         SEC
         SBC   $22
         JSL   L150488
         PHX
         PHA
         LDA   [$1C]
         SEC
         SBC   $20
         JSL   L150488
         PHX
         PHA
         JSL   L150729
         LDA   #$4880
         LDX   #$0006
         JSL   L150F53
         STA   [$05]
         TXA
         LDY   #$0002
         STA   [$05],Y
         LDA   $0E
         LDX   $10
         STA   $05
         STX   $07
         PHY
         PHY
         PEI   $22
         PEI   $20
         LDY   #$0002
         LDA   [$1C],Y
         PHA
         LDA   [$1C]
         PHA
         JSL   L07245A
         PLA
         STA   [$05]
         PLA
         LDY   #$0002
         STA   [$05],Y
         LDA   $12
         LDX   $14
         STA   $05
         STX   $07
         PHY
         PHY
         PEA   $0006
         PEA   $4880
         PHY
         PHY
         LDA   $1A
         JSL   L150488
         PHX
         PHA
         JSL   L1512F5
         JSL   L15007C
         PLA
         STA   [$05]
         PLA
         LDY   #$0002
         STA   [$05],Y
L1B3706  LDA   L05522F
         BNE   L1B370E
         BRL   L1B383B
L1B370E  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         LDY   #$0002
         LDA   [$12],Y
         PHA
         LDA   [$12]
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         JSL   L150F53
         STA   $01
         STX   $03
         PHY
         PHY
         PEI   $03
         PEI   $01
         PEA   $0000
         PEA   $4305
         JSL   L15007C
         PLA
         STA   $01
         PLX
         STX   $03
         PHY
         PHY
         PHY
         PEI   $03
         PEI   $01
         JSL   L1500DD
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L1B3761
         DEX
L1B3761  PHX
         PHA
         JSL   L1512F5
         PLA
         STA   $01
         PLX
         STX   $03
         PHY
         PHY
         PEI   $03
         PEI   $01
         PEA   $0000
         PEA   $4305
         JSL   L15036B
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $16
         LDX   $18
         STA   $05
         STX   $07
         PEI   $03
         PEI   $01
         LDY   #$0002
         LDA   [$12],Y
         PHA
         LDA   [$12]
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         JSL   L1512A5
         STA   [$05]
         TXA
         LDY   #$0002
         STA   [$05],Y
         LDA   #$0002
         CLC
         ADC   $1C
         LDX   $1E
         BCC   L1B37BD
         INX
L1B37BD  PHX
         PHA
         PEI   $22
         PHY
         PHY
         PHY
         PHY
         LDY   #$0002
         LDA   [$0E],Y
         PHA
         LDA   [$0E]
         PHA
         PHY
         PHY
         PHY
         PHY
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         JSL   L15169F
         JSL   L1511BC
         JSL   L15036B
         JSL   L151687
         PLA
         PLX
         STA   $05
         PLA
         CLC
         ADC   $05
         PLX
         STX   $05
         PLX
         STX   $07
         STA   [$05]
         PEI   $1E
         PEI   $1C
         PEI   $20
         PHY
         PHY
         PHY
         PHY
         LDY   #$0002
         LDA   [$0E],Y
         PHA
         LDA   [$0E]
         PHA
         PHY
         PHY
         PHY
         PHY
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         JSL   L15012C
         JSL   L1511BC
         JSL   L15036B
         JSL   L151687
         PLA
         PLX
         STA   $05
         PLA
         CLC
         ADC   $05
         PLX
         STX   $05
         PLX
         STX   $07
         STA   [$05]
L1B383B  LDY   #$0002
         LDA   [$1C],Y
         ASL
         LDY   #$0002
         STA   [$1C],Y
         LDA   $0C
         STA   $22
         LDA   $0B
         STA   $21
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L1B3858  PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         PHY
         JSL   L099DCE
         PLA
         LSR
         BCC   L1B386F
         LDA   #$0001
         STA   L05522F
L1B386F  LDA   L05522F
         BEQ   L1B38DC
         LDY   #$0002
         LDA   [$14],Y
         SEC
         SBC   $1A
         STA   $07
         LDA   [$14]
         SEC
         SBC   $18
         STA   $09
         LDA   $07
         BPL   L1B388D
         EOR   #$FFFF
         INC
L1B388D  LSR
         STA   $05
         LDA   $09
         BPL   L1B3898
         EOR   #$FFFF
         INC
L1B3898  STA   $03
         PHY
         PEI   $05
         PEI   $03
         JSL   L072FD5
         PLA
         STA   $01
         LDA   $07
         BPL   L1B38B4
         LDA   $01
         EOR   #$FFFF
         INC
         STA   $07
         BRA   L1B38B8
L1B38B4  LDA   $01
         STA   $07
L1B38B8  LDA   $09
         BPL   L1B38C6
         LDA   $01
         EOR   #$FFFF
         INC
         STA   $09
         BRA   L1B38CA
L1B38C6  LDA   $01
         STA   $09
L1B38CA  LDA   $07
         ASL
         CLC
         ADC   $1A
         LDY   #$0002
         STA   [$14],Y
         LDA   $09
         CLC
         ADC   $18
         STA   [$14]
L1B38DC  LDA   $12
         STA   $1A
         LDA   $11
         STA   $19
         LDA   $0F
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L1B38EE  PHD
         TSC
         CLC
         ADC   #$EFFE
         TCS
         ADC   #$0F0B
         TCD
         JSL   L160790
         TDC
         CLC
         ADC   #$00EF
         PEA   $0000
         PHA
         JSL   L1B5BAC
         JSL   L1B1E80
         PEI   $F1
         PEI   $EF
         PEI   $F1
         PEI   $EF
         JSL   L16079E
         LDA   $EF
         LDX   $F1
         STA   $EB
         STX   $ED
         LDA   #$0001
         STA   $A7
L1B3927  TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         JSL   L1B5BAC
         LDA   $E9
         SEC
         SBC   $ED
         BPL   L1B393F
         EOR   #$FFFF
         INC
L1B393F  PHA
         LDA   $E7
         SEC
         SBC   $EB
         BPL   L1B394B
         EOR   #$FFFF
         INC
L1B394B  ASL
         STA   $F3
         PLA
         CLC
         ADC   $F3
         SEC
         SBC   #$0002
         BEQ   L1B398B
         BVS   L1B395D
         EOR   #$8000
L1B395D  BPL   L1B398B
         PEI   $ED
         PEI   $EB
         PEI   $E9
         PEI   $E7
         JSL   L16079E
         LDA   $A7
         ASL
         ASL
         CLC
         ADC   #$F0F9
         TAX
         PEI   $E9
         PEI   $E7
         PLA
         STA   $00,X
         PLA
         STA   $02,X
         LDA   $A7
         INC
         STA   $A7
         LDA   $E7
         LDX   $E9
         STA   $EB
         STX   $ED
L1B398B  LDX   #$0000
         LDA   #$03E8
         CMP   $A7
         BNE   L1B3996
         INX
L1B3996  PHX
         PHY
         JSL   L096CC4
         PLA
         EOR   #$0001
         ORA   $01,S
         PLX
         LSR
         BCC   L1B3927
         LDA   L0550B7
         BNE   L1B39AE
         BRL   L1B3B5F
L1B39AE  PEI   $ED
         PEI   $EB
         PEI   $F1
         PEI   $EF
         JSL   L16079E
         JSL   L150659
         JSL   L160790
         PEI   $F1
         PEI   $EF
         JSL   L1607AC
         LDA   $A7
         DEC
         LDX   #$F0F7
         STA   $00,X
         LDX   #$F0F7
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L1B39E0
         EOR   #$8000
L1B39E0  BPL   L1B3A07
         LDA   #$0001
         STA   $A5
L1B39E7  LDA   $A5
         ASL
         ASL
         CLC
         ADC   #$F0F9
         TAX
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L1607BA
         LDA   $A5
         LDX   #$F0F7
         CMP   $00,X
         BEQ   L1B3A07
         INC   $A5
         BRA   L1B39E7
L1B3A07  PEI   $F1
         PEI   $EF
         JSL   L1607BA
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $E3
         PLX
         STX   $E5
         PEI   $E5
         PEI   $E3
         JSL   L15166F
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$E3],Y
         TAX
         LDA   [$E3]
         CLC
         ADC   #$0002
         BCC   L1B3A3B
         INX
L1B3A3B  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         LDA   L055303
         ASL
         EOR   #$FFFF
         INC
         PHA
         LDA   L055303
         EOR   #$FFFF
         INC
         PHA
         JSL   L151005
         PEA   ^L051EA2
         PEA   L051EA2
         JSL   L1506A7
         PEI   $E5
         PEI   $E3
         JSL   L150641
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         PEA   $0003
         JSL   L08382C
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L081E53
         PHY
         PEA   ^L052D12
         PEA   L052D12
         PEA   ^L051D26
         PEA   L051D26
         PEA   $0020
         JSL   L070A10
         PLA
         LSR
         BCC   L1B3AC2
         BRL   L1B3B44
L1B3AC2  PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         PEA   ^L052D12
         PEA   L052D12
         JSL   L151198
         PEA   $0001
         JSL   L150BD6
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         JSL   L15037D
         LDA   L055231
         BNE   L1B3B40
         JSL   L160790
         PEI   $F1
         PEI   $EF
         JSL   L1607AC
         LDA   $A7
         DEC
         LDX   #$F0F5
         STA   $00,X
         LDX   #$F0F5
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L1B3B11
         EOR   #$8000
L1B3B11  BPL   L1B3B38
         LDA   #$0001
         STA   $A5
L1B3B18  LDA   $A5
         ASL
         ASL
         CLC
         ADC   #$F0F9
         TAX
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L1607BA
         LDA   $A5
         LDX   #$F0F5
         CMP   $00,X
         BEQ   L1B3B38
         INC   $A5
         BRA   L1B3B18
L1B3B38  PEI   $F1
         PEI   $EF
         JSL   L1607BA
L1B3B40  JSL   L1510A1
L1B3B44  PEI   $E5
         PEI   $E3
         JSL   L151669
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
L1B3B5F  PEA   $0001
         JSL   L1B31DB
         JSL   L1B5819
         LDA   #$0001
         STA   L055249
         TSC
         CLC
         ADC   #$1002
         TCS
         PLD
         RTL

L1B3B78  PHD
         TSC
         CLC
         ADC   #$FFB4
         TCS
         TCD
         LDA   L055231
         STA   $01
         LDA   #$0001
         STA   L055231
         JSL   L160790
         LDA   L055303
         SEC
         SBC   L055301
         STA   $31
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         JSL   L1B5BAC
         JSL   L1B1E80
         LDA   $45
         LDX   $47
         STA   $35
         STX   $37
         LDA   $45
         LDX   $47
         STA   $39
         STX   $3B
         LDA   $45
         LDX   $47
         STA   $3D
         STX   $3F
         LDA   #$0001
         STA   $33
         LDX   #$0000
         LDA   L05530D
         DEC
         BNE   L1B3BD0
         INX
L1B3BD0  TXA
         AND   L05524B
         PHA
         LDA   L055213
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L1B3BE3
         STZ   $33
L1B3BE3  LDA   L055311
         BEQ   L1B3BF5
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L08273B
L1B3BF5  STZ   $0D
         LDA   L055311
         EOR   #$0001
         AND   L055309
         STA   $0F
         LDA   $0F
         BEQ   L1B3C1E
         PEA   $0000
         JSL   L1B321E
         PEA   $0002
         JSL   L150BD6
         PEA   ^L051D06
         PEA   L051D06
         JSL   L151198
L1B3C1E  TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         JSL   L1B5BAC
         PEI   $47
         PEI   $45
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         PEA   $0002
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         JSL   L1B3617
         PHY
         PEI   $43
         PEI   $41
         PEI   $3F
         PEI   $3D
         LDA   L05530D
         PHA
         JSL   L071984
         PLA
         EOR   #$0001
         STA   $03
         LDA   $03
         ORA   $33
         ORA   $0F
         BNE   L1B3C7C
         BRL   L1B3E2F
L1B3C7C  LDA   L055309
         ORA   L055311
         BNE   L1B3C88
         JSL   L160456
L1B3C88  LDA   L05530B
         BEQ   L1B3CB9
         LDA   $43
         SEC
         SBC   $47
         STA   $21
         LDA   $41
         SEC
         SBC   $45
         STA   $23
         LDA   $47
         SEC
         SBC   $21
         STA   $1B
         LDA   $45
         SEC
         SBC   $23
         STA   $19
         LDA   $21
         CLC
         ADC   $47
         STA   $1F
         LDA   $23
         CLC
         ADC   $45
         STA   $1D
         BRA   L1B3CC9
L1B3CB9  LDA   $45
         LDX   $47
         STA   $19
         STX   $1B
         LDA   $41
         LDX   $43
         STA   $1D
         STX   $1F
L1B3CC9  PEI   $1B
         PEI   $19
         PEI   $1F
         PEI   $1D
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         JSL   L071937
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         LDA   $31
         ASL
         EOR   #$FFFF
         INC
         PHA
         LDA   $31
         EOR   #$FFFF
         INC
         PHA
         JSL   L151005
         LDA   $0F
         BNE   L1B3D01
         BRL   L1B3DE6
L1B3D01  LDA   $03
         BNE   L1B3D08
         BRL   L1B3DD6
L1B3D08  PEI   $1B
         PEI   $19
         JSL   L1607AC
         PEI   $1F
         PEI   $1D
         JSL   L1607BA
         LDA   L0552C3
         BEQ   L1B3D8A
         PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L081E5F
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   ^L051E22
         PEA   L051E22
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCC   L1B3D8A
         LDA   L0552D9
         LDX   L0552DB
         PHX
         PHA
         LDA   L0552D5
         LDX   L0552D7
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $FFFE
         JSL   L0836B6
L1B3D8A  PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L081E5F
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         PEA   ^L053127
         PEA   L053127
         JSL   L081E53
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L160774
         PEI   $1B
         PEI   $19
         JSL   L1607AC
         PEI   $1F
         PEI   $1D
         JSL   L1607BA
L1B3DD6  PHY
         JSL   L096CC4
         PLA
         STA   $0D
         LDA   $0D
         BNE   L1B3DF2
         JSL   L160790
L1B3DE6  PEI   $1B
         PEI   $19
         PEI   $1F
         PEI   $1D
         JSL   L16079E
L1B3DF2  LDA   L055311
         BEQ   L1B3E0D
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L081E53
L1B3E0D  PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $41
         LDX   $43
         STA   $3D
         STX   $3F
         STZ   $33
         BRA   L1B3E37
L1B3E2F  PHY
         JSL   L096CC4
         PLA
         STA   $0D
L1B3E37  LDA   L055309
         EOR   #$0001
         ORA   L055311
         BEQ   L1B3E4A
         PHY
         JSL   L096CC4
         PLA
         STA   $0D
L1B3E4A  LDA   $0D
         EOR   #$0001
         BNE   L1B3E54
         BRL   L1B3C1E
L1B3E54  LDA   L055311
         BEQ   L1B3E72
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
L1B3E72  JSL   L1B5819
         LDA   $01
         STA   L055231
         JSL   L1510A1
         TSC
         CLC
         ADC   #$004C
         TCS
         PLD
         RTL

L1B3E87  PHD
         TSC
         CLC
         ADC   #$FE0E
         TCS
         ADC   #$00FB
         TCD
         LDA   L055229
         SEC
         SBC   #$0001
         BEQ   L1B3EA5
         BVS   L1B3EA0
         EOR   #$8000
L1B3EA0  BPL   L1B3EA5
         BRL   L1B415A
L1B3EA5  LDA   L05524B
         BEQ   L1B3EC5
L1B3EAA  PHY
         JSL   L096CC4
         PLA
         LSR
         BCC   L1B3EC2
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         JSL   L096A7B
         BRA   L1B3EAA
L1B3EC2  BRL   L1B415A
L1B3EC5  JSL   L160790
         TDC
         CLC
         ADC   #$00EF
         PEA   $0000
         PHA
         JSL   L1B5BAC
         JSL   L1B1E80
         LDA   $EF
         LDX   $F1
         STA   $EB
         STX   $ED
         LDA   #$0001
         STA   $A7
L1B3EE7  PHY
         PEI   $ED
         PEI   $EB
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         JSL   L1607C8
         PLA
         STA   $B3
         LDA   $B3
         BNE   L1B3F24
         PEI   $ED
         PEI   $EB
         PEI   $E9
         PEI   $E7
         JSL   L16079E
         LDA   $A7
         ASL
         ASL
         CLC
         ADC   #$FF09
         TAX
         PEI   $E9
         PEI   $E7
         PLA
         STA   $00,X
         PLA
         STA   $02,X
         LDA   $A7
         INC
         STA   $A7
L1B3F24  STZ   $B1
         LDA   $A7
         SEC
         SBC   #$0002
         BEQ   L1B3F6E
         BVS   L1B3F33
         EOR   #$8000
L1B3F33  BPL   L1B3F6E
         PHY
         PEI   $E9
         PEI   $E7
         PEI   $F1
         PEI   $EF
         LDA   L055301
         INC
         INC
         INC
         PHA
         JSL   L071984
         PLA
         STA   $B1
         LDA   $B1
         ORA   $B3
         STA   $B3
         PEI   $B3
         PHY
         PEI   $E9
         PEI   $E7
         PEI   $ED
         PEI   $EB
         LDA   L055301
         INC
         INC
         INC
         PHA
         JSL   L071984
         PLA
         ORA   $01,S
         PLX
         STA   $B3
L1B3F6E  LDA   #$0064
         CMP   $A7
         BNE   L1B3F7A
         LDA   #$0001
         STA   $B3
L1B3F7A  LDA   $E7
         LDX   $E9
         STA   $EB
         STX   $ED
         LDA   $B3
         BNE   L1B3F89
         BRL   L1B3EE7
L1B3F89  LDA   $B1
         ORA   L0550B7
         BEQ   L1B3F9C
         PEI   $E9
         PEI   $E7
         PEI   $F1
         PEI   $EF
         JSL   L16079E
L1B3F9C  LDA   L0550B7
         BNE   L1B3FA4
         BRL   L1B4149
L1B3FA4  JSL   L150659
         JSL   L160790
         PEI   $F1
         PEI   $EF
         JSL   L1607AC
         LDA   $A7
         DEC
         LDX   #$FF07
         STA   $00,X
         LDX   #$FF07
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L1B3FCA
         EOR   #$8000
L1B3FCA  BPL   L1B3FF1
         LDA   #$0001
         STA   $A5
L1B3FD1  LDA   $A5
         ASL
         ASL
         CLC
         ADC   #$FF09
         TAX
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L1607BA
         LDA   $A5
         LDX   #$FF07
         CMP   $00,X
         BEQ   L1B3FF1
         INC   $A5
         BRA   L1B3FD1
L1B3FF1  PEI   $F1
         PEI   $EF
         JSL   L1607BA
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $E3
         PLX
         STX   $E5
         PEI   $E5
         PEI   $E3
         JSL   L15166F
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$E3],Y
         TAX
         LDA   [$E3]
         CLC
         ADC   #$0002
         BCC   L1B4025
         INX
L1B4025  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         LDA   L055303
         ASL
         EOR   #$FFFF
         INC
         PHA
         LDA   L055303
         EOR   #$FFFF
         INC
         PHA
         JSL   L151005
         PEA   ^L051EA2
         PEA   L051EA2
         JSL   L1506A7
         PEI   $E5
         PEI   $E3
         JSL   L150641
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         PEA   $0003
         JSL   L08382C
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L081E53
         PHY
         PEA   ^L052D12
         PEA   L052D12
         PEA   ^L051D26
         PEA   L051D26
         PEA   $0020
         JSL   L070A10
         PLA
         LSR
         BCC   L1B40AC
         BRL   L1B412E
L1B40AC  PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         PEA   ^L052D12
         PEA   L052D12
         JSL   L151198
         PEA   $0001
         JSL   L150BD6
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         JSL   L15037D
         LDA   L055231
         BNE   L1B412A
         JSL   L160790
         PEI   $F1
         PEI   $EF
         JSL   L1607AC
         LDA   $A7
         DEC
         LDX   #$FF05
         STA   $00,X
         LDX   #$FF05
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L1B40FB
         EOR   #$8000
L1B40FB  BPL   L1B4122
         LDA   #$0001
         STA   $A5
L1B4102  LDA   $A5
         ASL
         ASL
         CLC
         ADC   #$FF09
         TAX
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L1607BA
         LDA   $A5
         LDX   #$FF05
         CMP   $00,X
         BEQ   L1B4122
         INC   $A5
         BRA   L1B4102
L1B4122  PEI   $F1
         PEI   $EF
         JSL   L1607BA
L1B412A  JSL   L1510A1
L1B412E  PEI   $E5
         PEI   $E3
         JSL   L151669
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
L1B4149  PEA   $0001
         JSL   L1B31DB
         JSL   L1B5819
         LDA   #$0001
         STA   L055249
L1B415A  TSC
         CLC
         ADC   #$01F2
         TCS
         PLD
         RTL

L1B4162  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055307
         BNE   L1B4182
         LDA   #$0035
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L1B417A
         INX
L1B417A  PHX
         PHA
         JSL   L15162D
         BRA   L1B4191
L1B4182  LDY   #$0031
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L151675
L1B4191  LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L1B41A2  PHD
         TSC
         CLC
         ADC   #$FFB0
         TCS
         TCD
         JSL   L160790
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         JSL   L1B5BAC
         JSL   L1B1E80
         LDA   $49
         LDX   $4B
         STA   $35
         STX   $37
         LDA   $49
         LDX   $4B
         STA   $39
         STX   $3B
         LDA   $49
         LDX   $4B
         STA   $41
         STX   $43
         LDA   $49
         STA   $45
         PHY
         PEI   $4B
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $47
         LDA   #$0001
         STA   $33
         STZ   $19
         LDX   #$0000
         LDA   L05530D
         DEC
         BNE   L1B41F9
         INX
L1B41F9  TXA
         AND   L05524B
         PHA
         LDA   L055213
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L1B420C
         STZ   $33
L1B420C  LDA   L055311
         BEQ   L1B421E
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L08273B
L1B421E  STZ   $1F
         PHY
         PEA   ^L052D12
         PEA   L052D12
         PEA   ^L051D26
         PEA   L051D26
         PEA   $0020
         JSL   L070A10
         PLA
         EOR   #$0001
         STA   $1D
         LDA   L055307
         SEC
         SBC   #$0003
         BVS   L1B4246
         EOR   #$8000
L1B4246  BMI   L1B424B
         STZ   L055307
L1B424B  LDA   L055307
         SEC
         SBC   #$0032
         BEQ   L1B4261
         BVS   L1B4259
         EOR   #$8000
L1B4259  BPL   L1B4261
         LDA   #$0032
         STA   L055307
L1B4261  TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         JSL   L1B5BAC
         PHY
         JSL   L090A90
         PLA
         LSR
         BCC   L1B42B7
         LDA   $19
         BNE   L1B4290
         LDA   $3D
         LDX   $3F
         STA   $15
         STX   $17
         LDA   $49
         LDX   $4B
         STA   $11
         STX   $13
         LDA   #$0001
         STA   $19
L1B4290  LDA   $3F
         CLC
         ADC   $13
         SEC
         SBC   $17
         STA   $4B
         LDA   $3D
         CLC
         ADC   $11
         SEC
         SBC   $15
         STA   $49
         PHY
         PEI   $4B
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $47
         LDA   $49
         STA   $45
         BRA   L1B42B9
L1B42B7  STZ   $19
L1B42B9  LDA   L055307
         BEQ   L1B42EE
         PEI   $4B
         PEI   $49
         TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         LDA   L055307
         PHA
         TDC
         CLC
         ADC   #$002B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         JSL   L1B3617
L1B42EE  PHY
         PEI   $3F
         PEI   $3D
         PEI   $43
         PEI   $41
         LDA   L05530D
         PHA
         JSL   L071984
         PLA
         EOR   #$0001
         STA   $1B
         LDA   $1B
         ORA   $33
         BNE   L1B430E
         BRL   L1B45CC
L1B430E  LDA   L055311
         BNE   L1B4317
         JSL   L160456
L1B4317  LDA   L055307
         BNE   L1B4380
         PHY
         PEI   $3F
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $3F
         PHY
         PHY
         PHY
         PEI   $47
         PEI   $45
         PEI   $3F
         PEI   $3D
         JSL   L07245A
         JSL   L1500DD
         PLA
         STA   $21
         LDA   $3F
         ASL
         STA   $3F
         LDA   $21
         SEC
         SBC   L055301
         STA   $4D
         LDA   $47
         SEC
         SBC   $4D
         ASL
         STA   $37
         LDA   $45
         SEC
         SBC   $21
         SEC
         SBC   L055301
         STA   $35
         LDA   L055303
         CLC
         ADC   $21
         SEC
         SBC   L055301
         CLC
         ADC   $47
         ASL
         STA   $3B
         LDA   $21
         CLC
         ADC   $45
         CLC
         ADC   L055303
         SEC
         SBC   L055301
         STA   $39
         BRA   L1B43F8
L1B4380  PHY
         PHY
         LDA   L055307
         PHA
         PEI   $4B
         PEI   $49
         PEI   $2D
         PEI   $2B
         PEI   $29
         PEI   $27
         PEI   $25
         PEI   $23
         JSL   L1B24BE
         PLA
         STA   $2F
         PLX
         STX   $31
         PEI   $31
         PEI   $2F
         LDA   L055301
         ASL
         EOR   #$FFFF
         INC
         PHA
         LDA   L055301
         EOR   #$FFFF
         INC
         PHA
         JSL   L15046A
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         CLC
         ADC   #$0002
         BCC   L1B43D1
         INX
L1B43D1  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         LDA   L055303
         ASL
         EOR   #$FFFF
         INC
         PHA
         LDA   L055303
         EOR   #$FFFF
         INC
         PHA
         JSL   L151005
L1B43F8  LDA   L0550B7
         BNE   L1B4400
         BRL   L1B44D7
L1B4400  PEA   ^L051EA2
         PEA   L051EA2
         JSL   L1506A7
         LDA   L055307
         BNE   L1B441E
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         JSL   L15131F
         BRA   L1B4426
L1B441E  PEI   $31
         PEI   $2F
         JSL   L15135B
L1B4426  JSL   L160790
         PEA   ^L051D06
         PEA   L051D06
         JSL   L151198
         LDA   L055307
         BEQ   L1B4441
         PEI   $31
         PEI   $2F
         JSL   L151675
L1B4441  PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         LDA   L055311
         BEQ   L1B4486
         LDA   L055307
         BNE   L1B446A
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         PEA   ^L052D12
         PEA   L052D12
         JSL   L1501BB
         BRA   L1B4478
L1B446A  PEI   $31
         PEI   $2F
         PEA   ^L052D12
         PEA   L052D12
         JSL   L15030C
L1B4478  JSL   L160790
         PEA   $0000
         PHD
         JSL   L1B4162
         BRA   L1B44D4
L1B4486  LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         PEA   $0003
         JSL   L08382C
         LDA   $1D
         BEQ   L1B44D4
         PEA   ^L052D12
         PEA   L052D12
         JSL   L151198
         PEA   $0001
         JSL   L150BD6
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         JSL   L15037D
         JSL   L160790
         PEA   $0000
         PHD
         JSL   L1B4162
L1B44D4  BRL   L1B4557
L1B44D7  PEA   ^L051EA2
         PEA   L051EA2
         JSL   L1506A7
         JSL   L160790
         PEA   ^L051D06
         PEA   L051D06
         JSL   L151198
         PEA   $0000
         PHD
         JSL   L1B4162
         PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         LDA   L055311
         BEQ   L1B4514
         JSL   L160790
         PEA   $0000
         PHD
         JSL   L1B4162
         BRA   L1B4557
L1B4514  LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         PEA   $0003
         JSL   L08382C
         LDA   L055231
         BEQ   L1B4557
         PEA   ^L052D12
         PEA   L052D12
         JSL   L151198
         PEA   $0001
         JSL   L150BD6
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         JSL   L15037D
L1B4557  TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L081E53
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         LDA   L055311
         BEQ   L1B4598
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L081E53
L1B4598  PEA   $0001
         JSL   L1B31DB
         PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $3D
         LDX   $3F
         STA   $41
         STX   $43
         STZ   $33
         LDA   L055307
         BEQ   L1B45CC
         PEI   $31
         PEI   $2F
         JSL   L15068F
L1B45CC  PHY
         JSL   L096CC4
         PLA
         EOR   #$0001
         BNE   L1B45DA
         BRL   L1B4261
L1B45DA  LDA   L055311
         BEQ   L1B45F8
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
L1B45F8  JSL   L1B5819
         JSL   L1510A1
         TSC
         CLC
         ADC   #$0050
         TCS
         PLD
         RTL

L1B4608  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$002D
         CLC
         ADC   $0E
         LDX   $10
         BCC   L1B461B
         INX
L1B461B  STA   $01
         STX   $03
         LDY   #$004A
         LDA   [$0E],Y
         SEC
         SBC   #$0000
         BMI   L1B4661
         CMP   #$0003
         BPL   L1B4661
         SEC
         SBC   #$0000
         BEQ   L1B463D
         DEC
         BEQ   L1B4647
         DEC
         BEQ   L1B4657
         BRA   L1B4661
L1B463D  PEI   $03
         PEI   $01
         JSL   L151418
         BRA   L1B4661
L1B4647  PEI   $03
         PEI   $01
         PEA   $0020
         PEA   $0010
         JSL   L1517F1
         BRA   L1B4661
L1B4657  PEI   $03
         PEI   $01
         JSL   L15162D
         BRA   L1B4661
L1B4661  LDA   $0C
         STA   $10
         LDA   $0B
         STA   $0F
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L1B4673  PHD
         TSC
         CLC
         ADC   #$FFBC
         TCS
         TCD
         JSL   L160790
         TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         JSL   L1B5BAC
         JSL   L1B1E80
         LDA   $3D
         LDX   $3F
         STA   $2D
         STX   $2F
         LDA   $3D
         LDX   $3F
         STA   $31
         STX   $33
         LDA   $3D
         LDX   $3F
         STA   $35
         STX   $37
         LDA   #$0001
         STA   $2B
         STZ   $09
         LDX   #$0000
         LDA   L05530D
         DEC
         BNE   L1B46B9
         INX
L1B46B9  TXA
         AND   L05524B
         PHA
         LDA   L055213
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L1B46CC
         STZ   $2B
L1B46CC  PHY
         PEA   ^L052D12
         PEA   L052D12
         PEA   ^L051D26
         PEA   L051D26
         PEA   $0020
         JSL   L070A10
         PLA
         EOR   #$0001
         STA   $25
         LDA   L055311
         BEQ   L1B46F8
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L08273B
L1B46F8  STZ   $13
         LDA   L055311
         EOR   #$0001
         AND   L055309
         STA   $11
         LDA   $11
         BEQ   L1B4737
         PEA   $0000
         JSL   L1B321E
         JSL   L1510A1
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PEA   $0002
         JSL   L150BD6
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L08273B
         LDA   #$FFFF
         STA   $0D
L1B4737  TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         JSL   L1B5BAC
         PHY
         JSL   L090A90
         PLA
         LSR
         BCC   L1B477C
         LDA   $09
         BNE   L1B4766
         LDA   $39
         LDX   $3B
         STA   $05
         STX   $07
         LDA   $3D
         LDX   $3F
         STA   $01
         STX   $03
         LDA   #$0001
         STA   $09
L1B4766  LDA   $3B
         CLC
         ADC   $03
         SEC
         SBC   $07
         STA   $3F
         LDA   $39
         CLC
         ADC   $01
         SEC
         SBC   $05
         STA   $3D
         BRA   L1B477E
L1B477C  STZ   $09
L1B477E  PEI   $3F
         PEI   $3D
         TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         JSL   L1B3858
         PHY
         PEI   $3B
         PEI   $39
         PEI   $37
         PEI   $35
         LDA   L05530D
         PHA
         JSL   L071984
         PLA
         EOR   #$0001
         STA   $0F
         LDA   $11
         ORA   $2B
         ORA   $0F
         BNE   L1B47B1
         BRL   L1B4B8A
L1B47B1  LDA   L055309
         ORA   L055311
         BNE   L1B47BD
         JSL   L160456
L1B47BD  LDA   L05530B
         BEQ   L1B47FA
         LDA   $3B
         SEC
         SBC   $3F
         BPL   L1B47CD
         EOR   #$FFFF
         INC
L1B47CD  STA   $27
         LDA   $39
         SEC
         SBC   $3D
         BPL   L1B47DA
         EOR   #$FFFF
         INC
L1B47DA  STA   $29
         LDA   $3F
         SEC
         SBC   $27
         STA   $2F
         LDA   $3D
         SEC
         SBC   $29
         STA   $2D
         LDA   $27
         CLC
         ADC   $3F
         STA   $33
         LDA   $29
         CLC
         ADC   $3D
         STA   $31
         BRA   L1B480F
L1B47FA  PEI   $3F
         PEI   $3D
         PEI   $3B
         PEI   $39
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         JSL   L071937
L1B480F  LDA   L055301
         ASL
         STA   $41
         LDA   $2F
         SEC
         SBC   $41
         STA   $2F
         LDA   $2D
         SEC
         SBC   L055301
         STA   $2D
         LDA   L055303
         SEC
         SBC   L055301
         ASL
         CLC
         ADC   $33
         STA   $33
         LDA   L055303
         CLC
         ADC   $31
         SEC
         SBC   L055301
         STA   $31
         LDA   $11
         BNE   L1B4844
         BRL   L1B4955
L1B4844  LDA   L054FB7
         LDX   L054FB9
         STA   $41
         STX   $43
         LDA   #$001C
         AND   [$41]
         PHA
         PEA   $0004
         JSL   L1510EF
         PLA
         STA   $0B
         LDA   $0D
         CMP   $0B
         BEQ   L1B4881
         PEA   ^L054F6B
         PEA   L054F6B
         JSL   L082570
         PEA   ^L054F6B
         PEA   L054F6B
         JSL   L151198
         LDA   $0B
         STA   $0D
         LDA   #$0001
         STA   $0F
L1B4881  LDA   $0F
         BNE   L1B4888
         BRL   L1B4946
L1B4888  PEA   $0000
         PHD
         JSL   L1B4608
         LDA   L0552C3
         BEQ   L1B4902
         PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L081E5F
         PHY
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   ^L051E22
         PEA   L051E22
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCC   L1B4902
         LDA   L0552D9
         LDX   L0552DB
         PHX
         PHA
         LDA   L0552D5
         LDX   L0552D7
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $FFFE
         JSL   L0836B6
L1B4902  PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L081E5F
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   ^L053127
         PEA   L053127
         JSL   L081E53
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L160774
         PEA   $0000
         PHD
         JSL   L1B4608
L1B4946  PHY
         JSL   L096CC4
         PLA
         STA   $13
         LDA   $13
         BEQ   L1B4955
         BRL   L1B4B68
L1B4955  LDA   L0550B7
         BNE   L1B495D
         BRL   L1B4A95
L1B495D  PEA   ^L051EA2
         PEA   L051EA2
         JSL   L1506A7
         LDA   $4A
         BMI   L1B49B1
         CMP   #$0003
         BPL   L1B49B1
         SEC
         SBC   #$0000
         BEQ   L1B497E
         DEC
         BEQ   L1B498D
         DEC
         BEQ   L1B49A2
         BRA   L1B49B1
L1B497E  TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         JSL   L15123D
         BRA   L1B49B1
L1B498D  TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   $0020
         PEA   $0010
         JSL   L1512DD
         BRA   L1B49B1
L1B49A2  TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         JSL   L15131F
         BRA   L1B49B1
L1B49B1  PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         LDX   #$0000
         LDA   $4A
         DEC
         DEC
         BEQ   L1B49C5
         INX
L1B49C5  TXA
         ORA   L055311
         BEQ   L1B4A3A
         LDA   $4A
         BMI   L1B4A27
         CMP   #$0003
         BPL   L1B4A27
         SEC
         SBC   #$0000
         BEQ   L1B49E2
         DEC
         BEQ   L1B49F7
         DEC
         BEQ   L1B4A12
         BRA   L1B4A27
L1B49E2  TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   ^L052D12
         PEA   L052D12
         JSL   L1517EB
         BRA   L1B4A27
L1B49F7  TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   $0020
         PEA   $0010
         PEA   ^L052D12
         PEA   L052D12
         JSL   L150647
         BRA   L1B4A27
L1B4A12  TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   ^L052D12
         PEA   L052D12
         JSL   L1501BB
         BRA   L1B4A27
L1B4A27  LDA   L055231
         BNE   L1B4A38
         JSL   L160790
         PEA   $0000
         PHD
         JSL   L1B4608
L1B4A38  BRA   L1B4A92
L1B4A3A  LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   $0003
         JSL   L08382C
         LDA   $25
         BEQ   L1B4A92
         PEA   ^L052D12
         PEA   L052D12
         JSL   L151198
         PEA   $0001
         JSL   L150BD6
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         JSL   L15037D
         LDA   L055231
         BNE   L1B4A92
         JSL   L160790
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         JSL   L15162D
L1B4A92  BRL   L1B4B20
L1B4A95  PEA   ^L051EA2
         PEA   L051EA2
         JSL   L1506A7
         JSL   L160790
         PEA   ^L051D06
         PEA   L051D06
         JSL   L151198
         PEA   $0000
         PHD
         JSL   L1B4608
         PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         LDX   #$0000
         LDA   $4A
         DEC
         DEC
         BEQ   L1B4AC9
         INX
L1B4AC9  TXA
         ORA   L055311
         BEQ   L1B4ADD
         JSL   L160790
         PEA   $0000
         PHD
         JSL   L1B4608
         BRA   L1B4B20
L1B4ADD  LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   $0003
         JSL   L08382C
         LDA   L055231
         BEQ   L1B4B20
         PEA   ^L052D12
         PEA   L052D12
         JSL   L151198
         PEA   $0001
         JSL   L150BD6
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         JSL   L15037D
L1B4B20  TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L081E53
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         LDA   L055311
         BEQ   L1B4B61
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L081E53
L1B4B61  PEA   $0001
         JSL   L1B31DB
L1B4B68  PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $39
         LDX   $3B
         STA   $35
         STX   $37
         STZ   $2B
         BRA   L1B4B92
L1B4B8A  PHY
         JSL   L096CC4
         PLA
         STA   $13
L1B4B92  LDA   L055309
         EOR   #$0001
         ORA   L055311
         BEQ   L1B4BA5
         PHY
         JSL   L096CC4
         PLA
         STA   $13
L1B4BA5  LDA   $13
         EOR   #$0001
         BNE   L1B4BAF
         BRL   L1B4737
L1B4BAF  LDA   L055311
         BEQ   L1B4BCD
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
L1B4BCD  JSL   L1B5819
         JSL   L1510A1
         LDA   $48
         STA   $4A
         LDA   $47
         STA   $49
         LDA   $45
         TCD
         TSC
         CLC
         ADC   #$0048
         TCS
         RTL

L1B4BE7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055219
         ORA   L055231
         BNE   L1B4BFE
         JSL   L072314
         BRL   L1B4DC7
L1B4BFE  LDA   L055225
         SEC
         SBC   #$0031
         BVS   L1B4C0A
         EOR   #$8000
L1B4C0A  BMI   L1B4C11
         LDA   #$0000
         BRA   L1B4C14
L1B4C11  LDA   #$0001
L1B4C14  PHA
         LDA   L055225
         SEC
         SBC   #$0038
         BEQ   L1B4C2A
         BVS   L1B4C23
         EOR   #$8000
L1B4C23  BPL   L1B4C2A
         LDA   #$0000
         BRA   L1B4C2D
L1B4C2A  LDA   #$0001
L1B4C2D  AND   $01,S
         PLX
         LSR
         BCC   L1B4C42
         LDA   L055225
         SEC
         SBC   #$0030
         PHA
         JSL   L0A1225
         BRL   L1B4DC7
L1B4C42  LDA   L055227
         SEC
         SBC   #$0014
         BPL   L1B4C4E
         BRL   L1B4DC3
L1B4C4E  CMP   #$0021
         BMI   L1B4C56
         BRL   L1B4DC3
L1B4C56  ASL
         TAX
         LDAL  L1B4C5E,X
         PHA
         RTS

L1B4C5E  DA    L1B4CA0-1
         DA    L1B4CA7-1
         DA    L1B4CB4-1
         DA    L1B4DC3-1
         DA    L1B4CC0-1
         DA    L1B4CC7-1
         DA    L1B4CD4-1
         DA    L1B4CDB-1
         DA    L1B4CE5-1
         DA    L1B4DC3-1
         DA    L1B4CEC-1
         DA    L1B4CF8-1
         DA    L1B4CFF-1
         DA    L1B4D06-1
         DA    L1B4D0D-1
         DA    L1B4D14-1
         DA    L1B4D1B-1
         DA    L1B4D25-1
         DA    L1B4D32-1
         DA    L1B4D3C-1
         DA    L1B4DBD-1
         DA    L1B4D46-1
         DA    L1B4D4E-1
         DA    L1B4D56-1
         DA    L1B4D5E-1
         DA    L1B4D66-1
         DA    L1B4D6E-1
         DA    L1B4D76-1
         DA    L1B4D7E-1
         DA    L1B4D86-1
         DA    L1B4DA1-1
         DA    L1B4D8E-1
         DA    L1B4DAF-1
         
L1B4CA0  JSL   L1602F8
         BRL   L1B4DC7
L1B4CA7  PEA   $0001
         PEA   $0001
         JSL   L090541
         BRL   L1B4DC7
L1B4CB4  LDA   L05530B
         EOR   #$0001
         STA   L05530B
         BRL   L1B4DC7
L1B4CC0  JSL   L160330
         BRL   L1B4DC7
L1B4CC7  PEA   ^L052D12
         PEA   L052D12
         JSL   L1B58F5
         BRL   L1B4DC7
L1B4CD4  JSL   L160392
         BRL   L1B4DC7
L1B4CDB  PEA   $0001
         JSL   L1B5A66
         BRL   L1B4DC7
L1B4CE5  JSL   L160314
         BRL   L1B4DC7
L1B4CEC  LDA   L055311
         EOR   #$0001
         STA   L055311
         BRL   L1B4DC7
L1B4CF8  JSL   L16035A
         BRL   L1B4DC7
L1B4CFF  JSL   L160322
         BRL   L1B4DC7
L1B4D06  JSL   L160384
         BRL   L1B4DC7
L1B4D0D  JSL   L1602EA
         BRL   L1B4DC7
L1B4D14  JSL   L160368
         BRL   L1B4DC7
L1B4D1B  PEA   $0000
         JSL   L1B5A66
         BRL   L1B4DC7
L1B4D25  PEA   $0010
         PEA   $0001
         JSL   L090541
         BRL   L1B4DC7
L1B4D32  PEA   $0000
         JSL   L16033E
         BRL   L1B4DC7
L1B4D3C  PEA   $0001
         JSL   L16033E
         BRL   L1B4DC7
L1B4D46  LDA   #$0001
         STA   L05530F
         BRA   L1B4DC7
L1B4D4E  LDA   #$0002
         STA   L05530F
         BRA   L1B4DC7
L1B4D56  LDA   #$0003
         STA   L05530F
         BRA   L1B4DC7
L1B4D5E  LDA   #$0004
         STA   L05530F
         BRA   L1B4DC7
L1B4D66  LDA   #$0006
         STA   L05530F
         BRA   L1B4DC7
L1B4D6E  LDA   #$0008
         STA   L05530F
         BRA   L1B4DC7
L1B4D76  LDA   #$000C
         STA   L05530F
         BRA   L1B4DC7
L1B4D7E  LDA   #$0010
         STA   L05530F
         BRA   L1B4DC7
L1B4D86  LDA   #$0018
         STA   L05530F
         BRA   L1B4DC7
L1B4D8E  LDA   L055153
         BNE   L1B4D9F
         LDA   L0552DD
         LDX   L0552DF
         PHX
         PHA
         JSL   L1607D6
L1B4D9F  BRA   L1B4DC7
L1B4DA1  LDA   L055105
         LDX   L055107
         PHX
         PHA
         JSL   L1607D6
         BRA   L1B4DC7
L1B4DAF  LDA   L055101
         LDX   L055103
         PHX
         PHA
         JSL   L1607D6
         BRA   L1B4DC7
L1B4DBD  JSL   L1603A0
         BRA   L1B4DC7
L1B4DC3  JSL   L072314
L1B4DC7  PLY
         PLY
         PLD
         RTL

L1B4DCB  PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         LDA   #$0009
         CLC
         ADC   $22
         LDX   $24
         BCC   L1B4DDE
         INX
L1B4DDE  PHX
         PHA
         LDA   #$0011
         CLC
         ADC   $22
         LDX   $24
         BCC   L1B4DEB
         INX
L1B4DEB  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDY   #$0045
         LDA   [$22],Y
         BNE   L1B4DFE
         BRL   L1B4EB8
L1B4DFE  LDY   #$0059
         LDA   [$22],Y
         TAX
         DEY
         DEY
         LDA   [$22],Y
         STA   $11
         STX   $13
         LDY   #$004D
         LDA   [$22],Y
         PHA
         DEY
         DEY
         LDA   [$22],Y
         PHA
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L1B3858
         LDY   #$004D
         LDA   [$22],Y
         PHA
         DEY
         DEY
         LDA   [$22],Y
         PHA
         TDC
         CLC
         ADC   #$0026
         PEA   $0000
         PHA
         JSL   L1B3858
         LDY   #$004D
         LDA   [$22],Y
         PHA
         DEY
         DEY
         LDA   [$22],Y
         PHA
         PEI   $13
         PEI   $11
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L071937
         LDY   #$004D
         LDA   [$22],Y
         PHA
         DEY
         DEY
         LDA   [$22],Y
         PHA
         PEI   $28
         PEI   $26
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L071937
         LDY   #$003F
         LDA   [$22],Y
         BEQ   L1B4E83
         LDA   $0B
         STA   $03
         LDA   $0F
         STA   $07
L1B4E83  LDY   #$003D
         LDA   [$22],Y
         BEQ   L1B4E92
         LDA   $09
         STA   $01
         LDA   $0D
         STA   $05
L1B4E92  LDA   #$0009
         CLC
         ADC   $22
         LDX   $24
         BCC   L1B4E9D
         INX
L1B4E9D  PHX
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150B40
         BRL   L1B4F3A
L1B4EB8  PHY
         PEI   $28
         LDA   #$0057
         CLC
         ADC   $22
         LDX   $24
         BCC   L1B4EC6
         INX
L1B4EC6  CLC
         ADC   #$0002
         BCC   L1B4ECD
         INX
L1B4ECD  STA   $19
         STX   $1B
         PLA
         SEC
         SBC   [$19]
         PHA
         LDY   #$0037
         LDA   [$22],Y
         PHA
         LDY   #$0039
         LDA   [$22],Y
         PHA
         JSL   L071A1B
         PLA
         AND   #$FFFE
         STA   $15
         PHY
         LDA   $26
         LDY   #$0057
         SEC
         SBC   [$22],Y
         PHA
         LDY   #$0033
         LDA   [$22],Y
         PHA
         LDY   #$0035
         LDA   [$22],Y
         PHA
         JSL   L071A1B
         PLA
         STA   $17
         LDA   L0551EF
         AND   L055313
         BEQ   L1B4F25
         PHY
         PEI   $15
         JSL   L1B1BDE
         PLA
         STA   $15
         PHY
         PEI   $17
         JSL   L1B1BC7
         PLA
         STA   $17
L1B4F25  LDA   #$0009
         CLC
         ADC   $22
         LDX   $24
         BCC   L1B4F30
         INX
L1B4F30  PHX
         PHA
         PEI   $15
         PEI   $17
         JSL   L1501AF
L1B4F3A  LDA   $20
         STA   $28
         LDA   $1F
         STA   $27
         LDA   $1D
         TCD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL

L1B4F4C  PHD
         TSC
         CLC
         ADC   #$FFA0
         TCS
         TCD
         LDA   L055051
         AND   L055245
         BEQ   L1B4F63
         JSL   L0903A6
         BRL   L1B555F
L1B4F63  PHY
         JSL   L1603F4
         PLA
         LSR
         BCC   L1B4F6F
         BRL   L1B555F
L1B4F6F  TDC
         CLC
         ADC   #$0019
         STA   $2D
         STZ   $2F
         TDC
         CLC
         ADC   #$0011
         STA   $29
         STZ   $2B
         TDC
         CLC
         ADC   #$0009
         STA   $25
         STZ   $27
         TDC
         CLC
         ADC   #$0001
         STA   $21
         STZ   $23
         LDA   L0551EF
         STA   $5B
         LDA   #$0001
         STA   L0551EF
         LDA   #$FFFE
         ANDL  L052D70
         STA   $59
         LDAL  L052D6E
         STA   $57
         TDC
         CLC
         ADC   #$0057
         PEA   $0000
         PHA
         JSL   L1B5BFC
         LDA   L0552FF
         BEQ   L1B4FCC
         TDC
         CLC
         ADC   #$0057
         PEA   $0000
         PHA
         JSL   L1B5BAC
L1B4FCC  PEI   $59
         PEI   $57
         JSL   L094E90
         STZ   $49
         LDA   L055233
         EOR   #$0001
         AND   L055231
         STA   $47
         LDA   L055231
         EOR   #$0001
         AND   L055233
         STA   $45
         LDA   L055315
         ORA   L055317
         BEQ   L1B4FF7
         LDA   #$0001
L1B4FF7  AND   $45
         STA   $43
         LDA   $45
         BNE   L1B5002
         BRL   L1B50B2
L1B5002  STZ   $3F
         LDAL  L051DB0
         SEC
         SBCL  L051DAC
         PHA
         PEA   $0003
         JSL   L1500F5
         PLX
         PLX
         STA   $3B
         LDA   $3B
         CLC
         ADCL  L051DAC
         STA   $5D
         LDA   $59
         SEC
         SBC   $5D
         BVS   L1B502C
         EOR   #$8000
L1B502C  BMI   L1B5036
         LDAL  L051DB0
         STA   $4D
         BRA   L1B505A
L1B5036  LDAL  L051DB0
         SEC
         SBC   $3B
         STA   $5D
         LDA   $59
         SEC
         SBC   $5D
         BEQ   L1B5055
         BVS   L1B504B
         EOR   #$8000
L1B504B  BPL   L1B5055
         LDAL  L051DAC
         STA   $4D
         BRA   L1B505A
L1B5055  LDA   #$0001
         STA   $3F
L1B505A  STZ   $3D
         LDAL  L051DAE
         SEC
         SBCL  L051DAA
         PHA
         PEA   $0003
         JSL   L1500F5
         PLX
         PLX
         STA   $3B
         LDA   $3B
         CLC
         ADCL  L051DAA
         STA   $5D
         LDA   $57
         SEC
         SBC   $5D
         BVS   L1B5084
         EOR   #$8000
L1B5084  BMI   L1B508E
         LDAL  L051DAE
         STA   $4B
         BRA   L1B50B2
L1B508E  LDAL  L051DAE
         SEC
         SBC   $3B
         STA   $5D
         LDA   $57
         SEC
         SBC   $5D
         BEQ   L1B50AD
         BVS   L1B50A3
         EOR   #$8000
L1B50A3  BPL   L1B50AD
         LDAL  L051DAA
         STA   $4B
         BRA   L1B50B2
L1B50AD  LDA   #$0001
         STA   $3D
L1B50B2  STZ   L0552A9
         LDA   $47
         BEQ   L1B50BF
         LDA   #$0001
         STA   L0552A1
L1B50BF  LDA   L0552A1
         BEQ   L1B50D7
         JSL   L1B570C
         STZ   L0552B1
         JSL   L1B1D2A
         LDA   $47
         BNE   L1B50D7
         JSL   L1607E4
L1B50D7  LDA   $49
         BEQ   L1B50E1
         LDA   #$0001
         STA   L0552A1
L1B50E1  STZ   L0552B1
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L053127
         PEA   L053127
         JSL   L081E53
         PEI   $2F
         PEI   $2D
         JSL   L082712
         LDA   L0552FF
         BEQ   L1B5122
         PEI   $2F
         PEI   $2D
         PEA   ^L051D5E
         PEA   L051D5E
         PEA   $0008
         JSL   L0313BE
L1B5122  LDA   $1B
         SEC
         SBCL  L051DAC
         STA   $37
         LDA   $1F
         SEC
         SBCL  L051DB0
         STA   $39
         LDA   $19
         SEC
         SBCL  L051DAA
         STA   $33
         LDA   $1D
         SEC
         SBCL  L051DAE
         STA   $35
         PEI   $2B
         PEI   $29
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         PEI   $27
         PEI   $25
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0001
         STA   $31
         LDA   $49
         BEQ   L1B5176
         LDA   L05530F
         STA   $31
L1B5176  LDA   #$0001
         STA   $41
L1B517B  TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         JSL   L1B5BAC
         LDA   $45
         BNE   L1B5199
         TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         JSL   L09457C
L1B5199  PEI   $41
         PHY
         PEI   $55
         PEI   $53
         PEI   $51
         PEI   $4F
         PEI   $31
         JSL   L071984
         PLA
         EOR   #$0001
         ORA   $01,S
         PLX
         LSR
         BCS   L1B51B7
         BRL   L1B52F8
L1B51B7  PEI   $23
         PEI   $21
         PEI   $27
         PEI   $25
         PEA   $0008
         JSL   L0313BE
         PEI   $55
         PEI   $53
         PEA   $0000
         PHD
         JSL   L1B4DCB
         PEI   $27
         PEI   $25
         PEI   $23
         PEI   $21
         JSL   L081E53
         PEI   $23
         PEI   $21
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         LDA   $49
         BNE   L1B51F7
         PEA   $0000
         JSL   L1B321E
L1B51F7  LDA   $43
         BEQ   L1B5247
         PEI   $27
         PEI   $25
         JSL   L1B5590
         PEA   ^L051EA2
         PEA   L051EA2
         PEA   ^L053239
         PEA   L053239
         PEI   $27
         PEI   $25
         PEI   $27
         PEI   $25
         PEA   $0001
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L053239
         PEA   L053239
         PEI   $27
         PEI   $25
         PEI   $27
         PEI   $25
         PEA   $8003
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         BRA   L1B5289
L1B5247  PEA   ^L051EA2
         PEA   L051EA2
         PEA   ^L053239
         PEA   L053239
         PEI   $2B
         PEI   $29
         PEI   $27
         PEI   $25
         PEA   $0001
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L053239
         PEA   L053239
         PEI   $2B
         PEI   $29
         PEI   $27
         PEI   $25
         PEA   $8003
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
L1B5289  LDA   L0552C3
         BEQ   L1B52E2
         PEA   ^L0532BD
         PEA   L0532BD
         PEI   $27
         PEI   $25
         PEI   $2F
         PEI   $2D
         JSL   L081E5F
         PHY
         PEI   $2F
         PEI   $2D
         PEA   ^L051E22
         PEA   L051E22
         PEI   $2F
         PEI   $2D
         JSL   L150B3A
         PLA
         LSR
         BCC   L1B52E2
         LDA   L0552D9
         LDX   L0552DB
         PHX
         PHA
         LDA   L0552D5
         LDX   L0552D7
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $2F
         PEI   $2D
         PEA   $FFFE
         JSL   L0836B6
L1B52E2  PEI   $23
         PEI   $21
         PEA   ^L053127
         PEA   L053127
         JSL   L081E53
         PEI   $23
         PEI   $21
         JSL   L160774
L1B52F8  STZ   $41
         PHY
         JSL   L096CC4
         PLA
         EOR   #$0001
         BNE   L1B5308
         BRL   L1B517B
L1B5308  PEI   $27
         PEI   $25
         JSL   L160464
         PHY
         PEI   $27
         PEI   $25
         JSL   L081A64
         PLA
         LSR
         BCC   L1B532C
         JSL   L1B31B9
         LDA   L0552A7
         PHA
         JSL   L0A02BC
         BRL   L1B5537
L1B532C  LDA   $43
         BEQ   L1B533B
         PEI   $27
         PEI   $25
         JSL   L1B5590
         BRL   L1B5403
L1B533B  LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   $FFFF
         PEI   $27
         PEI   $25
         JSL   L085B3C
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L053239
         PEA   L053239
         PEI   $2B
         PEI   $29
         PEI   $27
         PEI   $25
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         PEA   $FFFF
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L085B3C
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         PEI   $27
         PEI   $25
         PEA   $0000
         JSL   L08382C
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   $0000
         PEI   $27
         PEI   $25
         JSL   L085B3C
         PEA   ^L051EA2
         PEA   L051EA2
         PEA   ^L053239
         PEA   L053239
         PEI   $2B
         PEI   $29
         PEI   $27
         PEI   $25
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEA   $0000
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L085B3C
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEI   $27
         PEI   $25
         PEA   $0000
         JSL   L08382C
L1B5403  PEI   $2F
         PEI   $2D
         PEI   $27
         PEI   $25
         PEA   $0008
         JSL   L0313BE
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEI   $2F
         PEI   $2D
         JSL   L08295E
         PEA   ^L051E1A
         PEA   L051E1A
         PEI   $27
         PEI   $25
         PEA   $0008
         JSL   L0313BE
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L082766
         PEI   $2F
         PEI   $2D
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L081E53
         LDA   L0552AF
         BNE   L1B545B
         BRL   L1B54E4
L1B545B  LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   $0000
         PEI   $27
         PEI   $25
         JSL   L085B3C
         PEA   ^L051E32
         PEA   L051E32
         PEA   ^L053239
         PEA   L053239
         PEI   $2B
         PEI   $29
         PEI   $27
         PEI   $25
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEA   $0000
         PEA   ^L051E12
         PEA   L051E12
         JSL   L085B3C
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEI   $27
         PEI   $25
         PEA   $0000
         JSL   L08382C
         PEA   ^L051E12
         PEA   L051E12
         PEI   $27
         PEI   $25
         PEA   $0008
         JSL   L0313BE
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEA   ^L051E12
         PEA   L051E12
         JSL   L08295E
         BRA   L1B5526
L1B54E4  LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEA   $0000
         PEA   ^L051E12
         PEA   L051E12
         JSL   L085B3C
         PEA   ^L051E32
         PEA   L051E32
         JSL   L1506A7
         PEI   $27
         PEI   $25
         JSL   L15123D
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PEA   ^L051E12
         PEA   L051E12
         PEI   $27
         PEI   $25
         PEA   $0008
         JSL   L0313BE
L1B5526  PEA   ^L0532BD
         PEA   L0532BD
         PEI   $27
         PEI   $25
         PEA   $0008
         JSL   L0313BE
L1B5537  LDA   #$0001
         STA   L0552B1
         LDA   $5B
         STA   L0551EF
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PEA   $0000
         JSL   L1B321E
         LDA   #$0001
         STA   L055137
         LDA   #$0001
         STA   L055133
L1B555F  TSC
         CLC
         ADC   #$0060
         TCS
         PLD
         RTL

L1B5567	ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L053239
         PEA   L053239
         PEA   ^L051D5E
         PEA   L051D5E
         LDAL  L051D58
         PHA
         LDAL  L051D56
         PHA
         PEA   $0000
         JSL   L15025A
         PLY
         PLY
         PLD
         RTL

L1B5590  ENT
	PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $22
         PEI   $20
         PEA   $0008
         JSL   L0313BE
         JSL   L160456
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         JSL   L1602DC
         LDAL  L051EDC
         PHA
         JSL   L1512E3
         PEA   $0000
         JSL   L1516ED
         PEA   $0000
         JSL   L1511E6
         PEA   $FFFF
         JSL   L1511E0
         PEA   ^L051EA2
         PEA   L051EA2
         JSL   L1506A7
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L051D26
         PEA   L051D26
         JSL   L1517EB
         LDA   #$000A
         CLC
         ADCL  L051DB6
         STA   $15
         LDAL  L051EDE
         STA   $13
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PHY
         PEI   $11
         LDA   $15
         CLC
         ADC   $0D
         PHA
         JSL   L072FA6
         PLA
         STA   $11
         PHY
         PEI   $0F
         LDA   $13
         CLC
         ADC   $0B
         PHA
         JSL   L072FA6
         PLA
         STA   $0F
         PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         LDA   L055315
         LDX   L055317
         PHX
         PHA
         JSL   L0718BF
         PHY
         LDA   L055315
         LDX   L055317
         STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         PHX
         PHA
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         LDAL  L051ED6
         PHA
         LDAL  L051EDE
         PHA
         PEA   $0000
         JSL   L08090C
         PLA
         STA   $09
         LDA   L055315
         LDX   L055317
         PHX
         PHA
         JSL   L07191C
         PHY
         PEA   ^L052D12
         PEA   L052D12
         PEA   ^L051D26
         PEA   L051D26
         PEA   $0020
         JSL   L070A10
         PLA
         LSR
         BCS   L1B56CC
         PEA   ^L052D12
         PEA   L052D12
         JSL   L151198
         PEA   $0001
         JSL   L150BD6
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L15037D
L1B56CC  PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L081E5F
         JSL   L08765D
         JSL   L1510A1
         LDA   $1E
         STA   $22
         LDA   $1D
         STA   $21
         LDA   $1B
         TCD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L1B570C  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   L0552AB
         ORA   L0552B1
         BNE   L1B571F
         BRL   L1B5812
L1B571F  LDA   L0552B1
         BEQ   L1B5730
         LDA   #L051DAA
         LDX   #^L051DAA
         STA   $03
         STX   $05
         BRA   L1B573A
L1B5730  LDA   #L051E1A
         LDX   #^L051E1A
         STA   $03
         STX   $05
L1B573A  LDA   L0552A9
         DEC
         DEC
         BNE   L1B5795
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEI   $05
         PEI   $03
         PEA   $0003
         JSL   L0836B6
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEI   $05
         PEI   $03
         PEA   $0001
         JSL   L0836B6
         BRA   L1B57CD
L1B5795  LDA   #$0001
         STA   $01
         LDA   L0552A9
         DEC
         BNE   L1B57A5
         LDA   #$0003
         STA   $01
L1B57A5  LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEI   $05
         PEI   $03
         PEI   $01
         JSL   L0836B6
L1B57CD  LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         PEI   $05
         PEI   $03
         PEA   $FFFE
         JSL   L0836B6
         PEI   $05
         PEI   $03
         PEA   ^L0532B5
         PEA   L0532B5
         JSL   L081E53
         PEI   $05
         PEI   $03
         PEA   ^L05310F
         PEA   L05310F
         JSL   L081E53
L1B5812  PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L1B5819  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   L0552AB
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PLY
         PLY
         PLD
         RTL

L1B5835  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         PEA   $0000
         JSL   L1B31DB
         LDA   #$0001
         STA   L055137
         LDA   #$0001
         STA   L055133
         PLY
         PLY
         PLD
         RTL

L1B587A  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L0552FF
         BEQ   L1B588E
         LDA   #$0004
         STA   $01
         BRA   L1B5893
L1B588E  LDA   #$0001
         STA   $01
L1B5893  PEI   $01
         PEA   ^L051D06
         PEA   L051D06
         JSL   L1B21C1
         PLY
         PLY
         PLY
         PLD
         RTL

L1B58A4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L1B570C
         JSL   L1B1D2A
         PEA   ^L0407BD
         PEA   L0407BD
         JSL   L093529
         PEA   ^L051E12
         PEA   L051E12
         JSL   L082712
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         PEA   ^L053127
         PEA   L053127
         JSL   L082712
         PEA   ^L05311F
         PEA   L05311F
         JSL   L082712
         JSL   L1607F2
         PEA   $0000
         JSL   L1B31DB
         PLY
         PLY
         PLD
         RTL

L1B58F5  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $0000
         JSL   L1B1EC2
         PLA
         LSR
         BCS   L1B590C
         BRL   L1B59DA
L1B590C  PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         LDA   L0552AF
         BEQ   L1B5990
         PEA   ^L051E32
         PEA   L051E32
         PEA   ^L051EA2
         PEA   L051EA2
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0001
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         PEA   $0002
         JSL   L150BD6
         PEI   $0C
         PEI   $0A
         JSL   L151198
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L15037D
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0003
         JSL   L08382C
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L15037D
         JSL   L1510A1
         BRA   L1B59BC
L1B5990  PEA   ^L051EA2
         PEA   L051EA2
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L15123D
         PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         PEI   $0C
         PEI   $0A
         JSL   L1517EB
L1B59BC  PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L081E53
         JSL   L1B5835
L1B59DA  LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L1B59EB  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$0012
         LDA   [$0A],Y
         BEQ   L1B5A13
         LDY   #$0004
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         JSL   L1B150D
         BRA   L1B5A2A
L1B5A13  LDY   #$0004
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         JSL   L1B16F1
L1B5A2A  PEA   ^L053239
         PEA   L053239
         PEI   $10
         PEI   $0E
         LDA   #$0001
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L1B5A3F
         INX
L1B5A3F  PHX
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   $08
         STA   $10
         LDA   $07
         STA   $0F
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L1B5A66  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         PEA   $0000
         JSL   L1B1EC2
         PLA
         LSR
         BCS   L1B5A7D
         BRL   L1B5B12
L1B5A7D  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         LDA   $12
         BEQ   L1B5AAF
         LDAL  L05325F
         SEC
         SBCL  L051DB0
         STA   $03
         LDAL  L05325F
         SEC
         SBCL  L051DAC
         STA   $07
         BRA   L1B5AC5
L1B5AAF  LDAL  L05325D
         SEC
         SBCL  L051DAE
         STA   $01
         LDAL  L05325D
         SEC
         SBCL  L051DAA
         STA   $05
L1B5AC5  LDA   L0552AF
         BEQ   L1B5ADE
         PEA   ^L051E32
         PEA   L051E32
         PEA   $0000
         PHD
         JSL   L1B59EB
         LDA   #$0001
         STA   L05529F
L1B5ADE  PEA   ^L051EA2
         PEA   L051EA2
         PEA   $0000
         PHD
         JSL   L1B59EB
         PEA   ^L051E92
         PEA   L051E92
         PEA   $0000
         PHD
         JSL   L1B59EB
         PEA   ^L053127
         PEA   L053127
         JSL   L082712
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         JSL   L1B5835
L1B5B12  LDA   $10
         STA   $12
         LDA   $0F
         STA   $11
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L1B5B24  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         PEI   $10
         PEI   $0E
         JSL   L096A7B
         PEI   $03
         PEI   $01
         JSL   L151131
         LDA   L0552FF
         BEQ   L1B5B8D
         LDA   #$0008
         CMP   L0550BB
         BNE   L1B5B71
         LDY   #$0002
         LDA   #$0004
         CLC
         ADC   [$0E],Y
         LDY   #$0002
         STA   [$0E],Y
         BRA   L1B5B79
L1B5B71  LDA   [$0E]
         SEC
         SBC   #$0004
         STA   [$0E]
L1B5B79  PEI   $10
         PEI   $0E
         PEA   ^L053259
         PEA   L053259
         PEA   ^L051D5E
         PEA   L051D5E
         JSL   L150F41
L1B5B8D  LDY   #$0002
         LDA   #$FFFE
         AND   [$0E],Y
         LDY   #$0002
         STA   [$0E],Y
         LDA   $0C
         STA   $10
         LDA   $0B
         STA   $0F
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L1B5BAC  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0C
         PEI   $0A
         JSL   L1B5B24
         PEI   $0C
         PEI   $0A
         JSL   L1B5BFC
         LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L1B5BD5  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055153
         BEQ   L1B5BEE
         LDA   L055115
         LDX   L055117
         STA   $0A
         STX   $0C
         BRA   L1B5BF8
L1B5BEE  LDA   L055119
         LDX   L05511B
         STA   $0A
         STX   $0C
L1B5BF8  PLY
         PLY
         PLD
         RTL

L1B5BFC  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0551EF
         AND   L055313
         BEQ   L1B5C44
         LDA   #$0002
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L1B5C17
         INX
L1B5C17  STA   $01
         STX   $03
         PHY
         LDY   #$0002
         LDA   #$0008
         CLC
         ADC   [$0A],Y
         PHA
         JSL   L1B1BDE
         PLA
         STA   [$01]
         LDA   $0A
         LDX   $0C
         STA   $01
         STX   $03
         PHY
         LDA   #$0004
         CLC
         ADC   [$0A]
         PHA
         JSL   L1B1BC7
         PLA
         STA   [$01]
L1B5C44  LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L1B5C55	ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PHY
         PHY
         JSL   L072E34
         PLA
         PLX
         SEC
         SBC   #$1068
         BCS   L1B5C6E
         DEX
L1B5C6E  PHX
         PHA
         PEA   $0001
         JSL   L150337
         PLA
         STA   $01
         PLX
         STX   $03
         PEI   $03
         PEI   $01
         LDA   #$4E20
         LDX   #$0000
         JSL   L033477
         BEQ   L1B5C9E
         BVS   L1B5C92
         EOR   #$8000
L1B5C92  BPL   L1B5C9E
         LDA   #$4E20
         LDX   #$0000
         STA   $01
         STX   $03
L1B5C9E  LDA   $01
         LDX   $03
         STA   $0E
         STX   $10
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L1B5CAC	ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   L054FB7
         LDX   L054FB9
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $05
         STX   $07
         LDA   L055319
         PHA
         PEI   $07
         PEI   $05
         LDA   L0552B5
         LDX   L0552B7
         JSL   L033477
         BEQ   L1B5CE5
         BVS   L1B5CE3
         EOR   #$8000
L1B5CE3  BMI   L1B5CEA
L1B5CE5  LDA   #$0000
         BRA   L1B5CED
L1B5CEA  LDA   #$0001
L1B5CED  AND   $01,S
         PLX
         LSR
         BCC   L1B5D08
         JSL   L160766
         LDA   $05
         LDX   $07
         CLC
         ADC   #$001E
         BCC   L1B5D02
         INX
L1B5D02  STA   L0552B5
         STX   L0552B7
L1B5D08  LDA   L0552B1
         BEQ   L1B5D40
         LDA   L05529D
         STA   $03
         LDA   L0552FF
         BEQ   L1B5D2D
         PEI   $07
         PEI   $05
         PEA   $0000
         PEA   $0003
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   $05
         STX   $07
L1B5D2D  LDA   #$0007
         AND   $05
         STA   L05529D
         LDA   $03
         CMP   L05529D
         BEQ   L1B5D40
         JSL   L160800
L1B5D40  LDA   L0552FF
         BEQ   L1B5D62
         LDA   L055285
         STA   $01
         LDA   L05523B
         ASL
         STA   L055285
         LDA   L055285
         CMP   $01
         BEQ   L1B5D62
         PEA   ^L051D5E
         PEA   L051D5E
         JSL   L16080E
L1B5D62  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L1B5D6A  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         JSL   L072328
         PEI   $16
         PEA   $0000
         PEA   $0000
         JSL   L075E14
         PHY
         PHY
         PEI   $16
         PEI   $14
         PEI   $12
         PEA   $0000
         PEA   $7D00
         PEA   $0000
         JSL   L075D80
         PLA
         STA   $01
         PLX
         STX   $03
         LDX   #$0000
         LDAL  L05565D
         BNE   L1B5DA7
         INX
L1B5DA7  TXA
         LDY   #$00E9
         STA   [$0E],Y
         LDA   $0C
         STA   $16
         LDA   $0B
         STA   $15
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

L1B5DBF  PHD
         TSC
         CLC
         ADC   #$FC9D
         TCS
         ADC   #$0276
         TCD
         STZ   $E5
         STZ   $E7
L1B5DCE  JSL   L072328
         PEI   $FA
         PEI   $E7
         PEI   $E5
         JSL   L075E14
         PHY
         PHY
         PEI   $FA
         TDC
         CLC
         ADC   #$00AE
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $002F
         PEA   $0000
         JSL   L075D80
         PLA
         PLX
         CMP   #$002F
         BNE   L1B5E00
         CPX   #$0000
L1B5E00  BEQ   L1B5E05
         BRL   L1B5F9C
L1B5E05  PHA
         TDC
         CLC
         ADC   #$00B2
         PEA   $0000
         PHA
         PEA   ^L0407BE
         PEA   L0407BE
         JSL   L150434
         PLA
         LSR
         BCC   L1B5E2D
         LDA   $E5
         LDX   $E7
         PEI   $B0
         PEI   $AE
         JSL   L150F53
         STA   $E5
         STX   $E7
L1B5E2D  PHA
         TDC
         CLC
         ADC   #$00B2
         PEA   $0000
         PHA
         PEA   ^L0407C3
         PEA   L0407C3
         JSL   L1503DD
         PLA
         LSR
         BCC   L1B5DCE
         LDA   $E5
         LDX   $E7
         CLC
         ADC   #$000F
         BCC   L1B5E50
         INX
L1B5E50  PHX
         PHA
         LDA   $BB
         ASL
         ASL
         ASL
         ASL
         ASL
         JSL   L150488
         JSL   L150F53
         STA   $E5
         STX   $E7
         PEI   $FA
         PEI   $E7
         PEI   $E5
         JSL   L075E14
         PHY
         PHY
         PEI   $FA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD8C
         PHA
         PEA   $0000
         PEA   $0322
         PEA   $0000
         JSL   L075D80
         PLA
         STA   $DD
         PLX
         STX   $DF
         LDAL  L05565D
         BEQ   L1B5E98
         BRL   L1B5F9C
L1B5E98  JSL   L072328
         LDA   $E5
         LDX   $E7
         CLC
         ADC   #$0002
         BCC   L1B5EA7
         INX
L1B5EA7  PHX
         PHA
         LDX   #$FD8C
         LDA   $00,X
         ASL
         ASL
         JSL   L150488
         JSL   L150F53
         STA   $E5
         STX   $E7
         PEI   $FA
         PEI   $E7
         PEI   $E5
         JSL   L075E14
         LDX   #$FD8C
         LDA   $00,X
         SEC
         SBC   #$00C8
         BEQ   L1B5EE0
         BVS   L1B5ED6
         EOR   #$8000
L1B5ED6  BPL   L1B5EE0
         LDA   #$00C8
         LDX   #$FD8C
         STA   $00,X
L1B5EE0  LDA   #$7D00
         STA   $E1
         LDX   #$FD8C
         LDA   $00,X
         LDX   #$FD8A
         STA   $00,X
         LDX   #$FD8A
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L1B5EFD
         EOR   #$8000
L1B5EFD  BPL   L1B5F7C
         LDA   #$0001
         STA   $E3
L1B5F04  PHY
         PHY
         PEI   $FA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         LDA   $E3
         ASL
         ASL
         CLC
         ADC   #$FD8A
         TAX
         LDA   $00,X
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         JSL   L075D80
         PLA
         STA   $DD
         PLX
         STX   $DF
         LDAL  L05565D
         BEQ   L1B5F36
         BRA   L1B5F9C
L1B5F36  PHY
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         LDA   $E3
         ASL
         ASL
         CLC
         ADC   #$FD8A
         TAX
         LDA   $00,X
         PHA
         TDC
         CLC
         ADC   #$00F6
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E1
         PEA   $0000
         PHA
         JSL   L15143C
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L1B5F6B
         DEX
L1B5F6B  STA   $DD
         STX   $DF
         LDA   $E3
         LDX   #$FD8A
         CMP   $00,X
         BEQ   L1B5F7C
         INC   $E3
         BRA   L1B5F04
L1B5F7C  JSL   L072328
         LDA   #$0001
         LDY   #$00E9
         STA   [$F2],Y
         LDA   $BB
         BEQ   L1B5F9C
         PEA   $0000
         TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         JSL   L150306
L1B5F9C  LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$036F
         TCS
         RTL

L1B5FAE  ENT
         PHD
         TSC
         CLC
         ADC   #$FDB6
         TCS
         ADC   #$0157
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA9
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         STZ   $EB
         STZ   $ED
         STZ   $E9
         LDA   L0550B9
         DEC
         BEQ   L1B5FDC
         BRL   L1B6161
L1B5FDC  LDA   #$00FF
         LDX   #$FFA9
         AND   $00,X
         BNE   L1B6019
         PHY
         PEA   $0001
         PEA   $00C1
         PEA   $0000
         PEA   $00C0
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA9
         PHA
         PEA   $0026
         JSL   L073002
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         JSL   L09B294
         PLA
         LSR
         BCS   L1B6017
         BRL   L1B6161
L1B6017  BRA   L1B6035
L1B6019  JSL   L09999B
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA9
         PHA
         PEA   $0000
         JSL   L0730BE
         PLA
         STA   $EB
         PLX
         STX   $ED
L1B6035  PEI   $ED
         PEI   $EB
         JSL   L0718BF
         LDA   #$0007
         STA   $A9
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         STA   $AD
         STX   $AF
         LDA   #$0001
         STA   $B1
         STZ   $B3
         TDC
         CLC
         ADC   #$00A9
         PEA   $0000
         PHA
         PEA   $2010
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BEQ   L1B6090
         PHY
         LDAL  L05565D
         PHA
         JSL   L093495
         PLA
         LSR
         BCC   L1B6086
         PEA   $003B
         JSL   L0727E0
         BRA   L1B608D
L1B6086  PEA   $0039
         JSL   L0727E0
L1B608D  BRL   L1B6161
L1B6090  LDA   $AB
         STA   $E7
         LDA   L0552E1
         LDX   L0552E3
         STA   $E3
         STX   $E5
         JSL   L1B1E80
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEA   $FFFF
         PEA   ^L053259
         PEA   L053259
         JSL   L085B3C
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L082712
         LDX   #$0000
         LDA   #$00C1
         CMP   $B7
         BNE   L1B60CC
         INX
L1B60CC  PHX
         LDX   #$0000
         LDA   $B9
         ORA   $BB
         BNE   L1B60D7
         INX
L1B60D7  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L1B60EE
         PEI   $E7
         PEI   $E5
         PEI   $E3
         PEA   $0000
         PHD
         JSL   L1B5D6A
         BRA   L1B612F
L1B60EE  LDX   #$0000
         LDA   #$00C0
         CMP   $B7
         BNE   L1B60F9
         INX
L1B60F9  PHX
         LDA   #$0002
         LDX   #$0000
         CMP   $B9
         BNE   L1B6106
         CPX   $BB
L1B6106  BEQ   L1B610D
         LDA   #$0000
         BRA   L1B6110
L1B610D  LDA   #$0001
L1B6110  AND   $01,S
         PLX
         LSR
         BCC   L1B6126
         PEI   $E7
         PEI   $E5
         PEI   $E3
         PEA   $0000
         PHD
         JSL   L1B5DBF
         BRA   L1B612F
L1B6126  PEA   $003A
         JSL   L0727E0
         BRA   L1B615B
L1B612F  LDA   $E9
         BEQ   L1B6154
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         PEA   ^L053127
         PEA   L053127
         JSL   L082712
         PEA   $0001
         JSL   L1B31DB
         JSL   L1B5819
         BRA   L1B615B
L1B6154  PEA   $0039
         JSL   L0727E0
L1B615B  PEI   $E7
         JSL   L075A4F
L1B6161  PEI   $ED
         PEI   $EB
         JSL   L07185A
         LDA   $E9
         STA   $FC
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0250
         TCS
         RTL

L1B617F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PLY
         PLY
         PLD
         RTL

L1B618B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   #$0001
         STA   L0552BF
         PEA   ^L051E22
         PEA   L051E22
         JSL   L082712
         LDA   #$0001
         STA   L0552C1
         PEA   ^L051E2A
         PEA   L051E2A
         JSL   L082712
         LDA   L055153
         BEQ   L1B621F
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEA   $FFFF
         PEA   ^L05310F
         PEA   L05310F
         JSL   L085B3C
         PEA   ^L05310F
         PEA   L05310F
         PEA   ^L053117
         PEA   L053117
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L081E5F
         LDA   L055109
         LDX   L05510B
         PHX
         PHA
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L08382C
         LDA   #$0001
         STA   L055139
         PEA   ^L05310F
         PEA   L05310F
         PEA   ^L053117
         PEA   L053117
         PEA   $0008
         JSL   L0313BE
L1B621F  JSL   L1B30AB
         JSL   L1B2F72
         JSL   L1B2F08
         LDA   L055109
         LDX   L05510B
         STA   L0552C9
         STX   L0552CB
         PEA   ^L051E32
         PEA   L051E32
         PEA   ^L053229
         PEA   L053229
         PEA   $0010
         JSL   L0313BE
         STZ   L055135
         PEA   ^L051E12
         PEA   L051E12
         JSL   L082712
         PEA   ^L053117
         PEA   L053117
         JSL   L082712
         STZ   L0552FF
         STZ   L055287
         LDA   #$0140
         STAL  L051D70
         LDA   #$0064
         STAL  L051D6E
         LDA   #L1B044C
         STAL  L051D48
         LDA   #^L1B044C
         STAL  L051D4A
         STZ   L0552A3
         STZ   L0552A1
         JSL   L1B31B9
         LDAL  L051D70
         TAX
         LDAL  L051D6E
         STAL  L051D9E
         TXA
         STAL  L051DA0
         LDAL  L051D70
         TAX
         LDAL  L051D6E
         STAL  L051E0E
         TXA
         STAL  L051E10
         LDAL  L051E10
         STA   L0552BD
         LDAL  L051E10
         TAX
         LDAL  L051E0E
         STAL  L051DBA
         TXA
         STAL  L051DBC
         STZ   L0552B9
         STZ   L0552B5
         STZ   L0552B7
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         LDA   #$0001
         STA   L05529F
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L082712
         PEA   ^L0532B5
         PEA   L0532B5
         JSL   L082712
         PEA   $0000
         JSL   L1B31DB
         JSL   L1B1D2A
         LDA   L0550BB
         PHA
         JSL   L0A02BC
         STZ   L055311
         PEA   ^L051D26
         PEA   L051D26
         PEA   $0000
         PEA   $0020
         JSL   L071EC5
         LDA   #$0001
         STA   $01
L1B6322  LDA   $01
         DEC
         ASL
         TAX
         LDA   #$FFFF
         STAL  L051D06,X
         LDA   #$0010
         CMP   $01
         BEQ   L1B6339
         INC   $01
         BRA   L1B6322
L1B6339  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L1B6341	ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FB5
         BNE   L1B6355
         JSL   L072314
         BRL   L1B64B7
L1B6355  JSL   L090A71
         JSL   L093A99
         PEA   ^L052D6E
         PEA   L052D6E
         JSL   L150BE8
         LDA   L055287
         BEQ   L1B6377
         JSL   L160218
         JSL   L16081C
         BRL   L1B64B7
L1B6377  LDA   L055051
         AND   L055245
         PHA
         LDA   L0550BB
         SEC
         SBC   #$0005
         BEQ   L1B638E
         BVS   L1B638C
         EOR   #$8000
L1B638C  BMI   L1B6393
L1B638E  LDA   #$0000
         BRA   L1B6396
L1B6393  LDA   #$0001
L1B6396  AND   $01,S
         PLX
         LSR
         BCC   L1B63A3
         JSL   L0903A6
         BRL   L1B64B7
L1B63A3  PHY
         JSL   L1603F4
         PLA
         LSR
         BCC   L1B63AF
         BRL   L1B64B7
L1B63AF  LDA   L0552AB
         BEQ   L1B63C3
         JSL   L1B570C
         STZ   L0552AB
         LDA   L0552C5
         BNE   L1B63C3
         STZ   L05528F
L1B63C3  LDA   L0552FF
         BNE   L1B63D2
         PEA   ^L051D6E
         PEA   L051D6E
         JSL   L1B5B24
L1B63D2  PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         LDA   L0550BB
         SEC
         SBC   #$0004
         BPL   L1B63E8
         BRL   L1B64B1
L1B63E8  CMP   #$000F
         BMI   L1B63F0
         BRL   L1B64B1
L1B63F0  ASL
         TAX
         LDAL  L1B63F8,X
         PHA
         RTS

L1B63F8  DA    L1B6416-1
         DA    L1B6428-1
         DA    L1B6439-1
         DA    L1B644A-1
         DA    L1B645A-1
         DA    L1B6460-1
         DA    L1B6466-1
         DA    L1B6475-1
         DA    L1B647E-1
         DA    L1B6487-1
         DA    L1B648D-1
         DA    L1B6496-1
         DA    L1B649C-1
         DA    L1B64A5-1
         DA    L1B64AB-1

L1B6416  LDA   L0552AD
         BEQ   L1B6421
         JSL   L1B4F4C
         BRA   L1B6425
L1B6421  JSL   L16082A
L1B6425  BRL   L1B64B1
L1B6428  LDA   L0552AD
         BEQ   L1B6433
         JSL   L1B4F4C
         BRA   L1B6437
L1B6433  JSL   L160838
L1B6437  BRA   L1B64B1
L1B6439  LDA   L055233
         BEQ   L1B6444
         JSL   L1603A0
         BRA   L1B6448
L1B6444  JSL   L160846
L1B6448  BRA   L1B64B1
L1B644A  LDA   L055305
         PHA
         PEA   ^L052D12
         PEA   L052D12
         JSL   L1B21C1
         BRA   L1B64B1
L1B645A  JSL   L1B587A
         BRA   L1B64B1
L1B6460  JSL   L1B3B78
         BRA   L1B64B1
L1B6466  PEA   $0026
         PEA   ^L052D12
         PEA   L052D12
         JSL   L1B21C1
         BRA   L1B64B1
L1B6475  PEA   $0000
         JSL   L1B4673
         BRA   L1B64B1
L1B647E  PEA   $0001
         JSL   L1B4673
         BRA   L1B64B1
L1B6487  JSL   L160854
         BRA   L1B64B1
L1B648D  PEA   $0002
         JSL   L1B4673
         BRA   L1B64B1
L1B6496  JSL   L1B38EE
         BRA   L1B64B1
L1B649C  PEA   $0001
         JSL   L1603E6
         BRA   L1B64B1
L1B64A5  JSL   L1B41A2
         BRA   L1B64B1
L1B64AB  JSL   L1B3E87
         BRA   L1B64B1
L1B64B1  LDA   #$0001
         STA   L055247
L1B64B7  PLY
         PLY
         PLD
         RTL

L1B64BB  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         STZ   $03
         LDA   #$0016
         STA   $05
         LDA   L0550BB
         SEC
         SBC   #$0004
         BPL   L1B64D6
         BRL   L1B6563
L1B64D6  CMP   #$000F
         BMI   L1B64DE
         BRL   L1B6563
L1B64DE  ASL
         TAX
         LDAL  L1B64E6,X
         PHA
         RTS

L1B64E6  DA    L1B6504-1
         DA    L1B650B-1
         DA    L1B6512-1
         DA    L1B6519-1
         DA    L1B6520-1
         DA    L1B652E-1
         DA    L1B6527-1
         DA    L1B652E-1
         DA    L1B652E-1
         DA    L1B6555-1
         DA    L1B652E-1
         DA    L1B652E-1
         DA    L1B655C-1
         DA    L1B652E-1
         DA    L1B652E-1

L1B6504  LDA   #$0009
         STA   $05
         BRA   L1B6563
L1B650B  LDA   #$000A
         STA   $05
         BRA   L1B6563
L1B6512  LDA   #$000B
         STA   $05
         BRA   L1B6563
L1B6519  LDA   L055305
         STA   $03
         BRA   L1B6563
L1B6520  LDA   #$000E
         STA   $05
         BRA   L1B6563
L1B6527  LDA   #$0026
         STA   $03
         BRA   L1B6563
L1B652E  LDA   #$0020
         CLC
         ADC   L055303
         STA   $03
         LDA   #$0006
         CMP   L055303
         BNE   L1B6544
         LDA   #$0025
         STA   $03
L1B6544  LDA   #$0008
         CMP   L055303
         BNE   L1B6553
         LDA   #$0015
         STA   $05
         STZ   $03
L1B6553  BRA   L1B6563
L1B6555  LDA   #$000D
         STA   $05
         BRA   L1B6563
L1B655C  LDA   #$000F
         STA   $05
         BRA   L1B6563
L1B6563  LDA   $05
         STA   L0552A5
         LDA   $03
         BEQ   L1B657E
         PEI   $03
         JSL   L1B1BF5
         LDA   #L051C46
         LDX   #^L051C46
         STA   L054F9B
         STX   L054F9D
L1B657E  PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL


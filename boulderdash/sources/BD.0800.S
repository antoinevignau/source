*
* Boulderdash
*
* (c) 1984, First Star
* (s) 2022, Brutal Deluxe Software
*

*-----------------------------
*
*            TYP   BIN
*            ORG   $000800
*            MX    %11
*
*-----------------------------

LBC00       =     $BC00		; read track
LBC03       =     LBC00+3	; move head

*-----------------------------

L0800       JSR   L09FE	; clear HGR pages
            STA   TXTCLR
            STA   TXTPAGE2
            STA   $C0E9
            LDA   #$20	; load 2 HGR pages T12..T15
            STA   $3E
            LDA   #$12
            STA   $F8
L0814       LDA   $F8
            JSR   LBC03       ; LOGO
            BNE   L0814
            LDA   $3E
            CLC
            ADC   #$10
            STA   $3E
            CMP   #$60
            BEQ   L082A
            INC   $F8
            BNE   L0814
L082A       LDA   #$05
            JSR   LBC00       ; LOGO
            STA   $C0E8
            JMP   L14DD	; go to program

*----------------------------- Dead code

            LDA   #$00	; RESET
            STA   $00
            LDA   #$09
            STA   $01
            LDY   #$00
L083F       STA   ($00),Y
            INY
            BNE   L083F
            INC   $01
            LDA   $01
            CMP   #$C0
            BNE   L083F
            JMP   PWRUP

*-----------------------------

L084F       LDA   $27
            BPL   L0862
            LDX   $55
            LDA   L7300,X
            STA   $0F
            LDY   $04
            INX
            STX   $55
            JMP   L087E

L0862       LDA   #$FF
            STA   $50
            STA   $51
            LDA   PTRIG
            LDA   #$05
            JSR   WAIT
            LDA   PADDL0
            BPL   L0877
            INC   $50
L0877       LDA   PADDL1
            BPL   L087E
            INC   $51
L087E       LDA   #$00
            LDX   #$0B
L0882       STA   $E8,X
            DEX
            BPL   L0882
            LDA   $33
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
            JMP   L0969

L08B9       STX   $03
            LDA   L08CA,X
            STA   L08C7+1
            LDA   L08CF,X
            STA   L08C7+2
L08C7       JMP   L08C7

L08CA       DB    <L08D4,<L094B,<L092E,<L091D,<L095F
L08CF       DB    >L08D4,>L094B,>L092E,>L091D,>L095F

L08D4       LDA   $14
            NOP
            AND   #$03
            TAX
            LDA   L08E9,X
            STA   L08E6+1
            LDA   L08EF,X
            STA   L08E6+2
L08E6       JMP   L08E6

L08E9       DB    <L08F5,<L08FC,<L0905,<L0910,<L091D,<L092E
L08EF       DB    >L08F5,>L08FC,>L0905,>L0910,>L091D,>L092E

L08F5       LDA   #$FF
            STA   $E8
            JMP   L095F

L08FC       LDA   #$FF
            STA   $E8
            STA   $EE
            JMP   L095F

L0905       LDA   #$FF
            STA   $E8
            STA   $EC
            STA   $F0
            JMP   L095F

L0910       LDA   #$FF
            STA   $E8
            STA   $EB
            STA   $EE
            STA   $F1
            JMP   L095F

L091D       LDA   #$FF
            STA   $E8
            STA   $EA
            STA   $EC
            STA   $EE
            STA   $F0
            STA   $F2
            JMP   L095F

L092E       LDA   #$FF
            STA   $E8
            STA   $E9
            STA   $EA
            STA   $EB
            STA   $EC
            STA   $ED
            STA   $EE
            STA   $EF
            STA   $F0
            STA   $F1
            STA   $F2
            STA   $F3
            JMP   L095F

L094B       LDA   $19
            AND   #$03
            TAX
            LDA   L08E9+2,X
            STA   L095C+1
            LDA   L08EF+2,X
            STA   L095C+2
L095C       JMP   L095C

L095F       LDA   #$00
            STA   $E3
            STA   $E5
            STA   $E6
            STA   $E4
L0969       LDA   $27
            BPL   L0971
            LDA   $0F
            TAX
            RTS

L0971       LDA   PADDL0
            BPL   L0978
            INC   $50
L0978       LDA   PADDL1
            BPL   L097F
            INC   $51
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
L0993       LDA   $50
            BEQ   L09A1
            BPL   L099D
            LDA   #$01
            BNE   L09AF
L099D       LDA   #$02
            BNE   L09AF
L09A1       LDA   $51
            BEQ   L09AF
            BPL   L09AB
            LDA   #$03
            BNE   L09AF
L09AB       LDA   #$04
            BNE   L09AF
L09AF       STA   $0F
            TAX
            LDA   BUTN0
            STA   $52
            LDA   L1582
            BNE   L09C0
            LDY   $04
            TXA
            RTS

L09C0       LDA   SETAN0
            LDA   $26
            BEQ   L09CA
            LDA   CLRAN0
L09CA       LDA   BUTN0
            BMI   L09D3
            LDA   #$FF
            BNE   L09D5
L09D3       LDA   #$00
L09D5       STA   $52
            LDA   SETAN1
            LDX   #$01
            LDA   BUTN1
            BPL   L09F8
            INX
            LDA   BUTN2
            BPL   L09F8
            INX
            LDA   CLRAN1
            LDA   BUTN1
            BPL   L09F8
            INX
            LDA   BUTN2
            BPL   L09F8
            LDX   #$00
L09F8       LDY   $04
            TXA
            STA   $0F
            RTS

L09FE       LDA   #$00
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

L0ACB       LDA   #$00
            STA   $56
            CLC
            ADC   #$28
            STA   $58
            ADC   #$28
            STA   $5A
            LDA   #$64
            STA   $57
            STA   $59
            STA   $5B
            LDA   #$00
            STA   $0D
            STA   $34
            STA   $36
            DEC   $F9
            BNE   L0B22
            LDA   $F8
            STA   $F9
            LDA   $33
            BEQ   L0AFC
            DEC   $1C
            BNE   L0AFC
            LDA   #$FF
            STA   $33
L0AFC       DEC   $1B
            BNE   L0B22
            LDA   #$10
            STA   $31
            JSR   L8E8A
L0B07       JSR   L0BDD
            JSR   L7500
            JSR   L18A1
            LDA   #$90
            JSR   WAIT
            LDA   $52
            BPL   L0B07
            LDA   #$01
            STA   $08
            PLA
            PLA
            JMP   L1818

L0B22       LDY   #$00
            INC   $0D
L0B26       LDA   |$005C,Y
            BMI   L0B32
            LDA   ($58),Y
            BPL   L0B32
            JMP   L0BC4

L0B32       INY
            LDA   $E1
            BEQ   L0B3A
L0B37       STA   SPKR
L0B3A       CPY   #$28
            BNE   L0B26
            LDX   #$27
L0B40       LDA   $84,X
            STA   $5C,X
            LDA   $AC,X
            STA   $84,X
            STY   $AC,X
            DEX
            BPL   L0B40
            LDA   $58
            STA   $56
            LDA   $59
            STA   $57
            LDA   $5A
            STA   $58
            CLC
            ADC   #$28
            STA   $5A
            LDA   $5B
            STA   $59
            ADC   #$00
            STA   $5B
            CMP   #$67
            BNE   L0B22
            LDA   $5A
            CMP   #$98
            BNE   L0B22
            LDA   $E1
            BEQ   L0B7B
            LDA   #$00
L0B76       STA   SPKR
            STA   $E1
L0B7B       LDA   $1A
            SEC
            SBC   $1B
            CMP   $7401
            BNE   L0B89
            LDA   #$0F
            STA   $35
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
            LDA   $19
            AND   #$07
            BEQ   L0BC1
            CPX   #$FD
            BCS   L0BC3
            JSR   L8E8A
            JSR   L18A1
            LDA   $52
            BPL   L0BC3
            LDA   #$01
            STA   $08
            PLA
            PLA
            JMP   L1818

L0BC1       STX   $2E
L0BC3       RTS

L0BC4       ASL
            TAX
            LDA   L1D05,X
            STA   L0BD5+1
            LDA   L1D05+1,X
            STA   L0BD5+2
            STY   $04
            TSX
L0BD5       JMP   L1D05

L0BD8       HEX   090A0B0C0D

L0BDD       LDY   #$70
            LDA   $32
            BEQ   L0C02
            BMI   L0BED
            LDA   #$00
            STA   $32
            LDA   #$FF
            BNE   L0C04
L0BED       INC   $32
L0BEF       JSR   L8D10
            STA   L6800,Y
            JSR   L8D10
            STA   L6C00,Y
            INY
            CPY   #$74
            BNE   L0BEF
            BEQ   L0C21
L0C02       LDA   #$00
L0C04       STA   L6800,Y
            STA   L6900,Y
            STA   L6A00,Y
            STA   L6B00,Y
            STA   L6C00,Y
            STA   L6D00,Y
            STA   L6E00,Y
            STA   L6F00,Y
            INY
            CPY   #$74
            BNE   L0C04
L0C21       LDY   #$80
            LDX   #$C0
            JSR   L1081
            LDY   #$84
            LDX   #$D0
            JSR   L1081
            LDY   #$90
            LDX   #$50
            JSR   L1081
            LDY   #$8C
            LDX   #$E0
            JSR   L1081
            LDA   $33
            BEQ   L0C43
            BPL   L0C4C
L0C43       LDY   #$94
            LDX   #$68
            JSR   L108C
            BEQ   L0C5B
L0C4C       LDY   #$94
            LDA   $19
            AND   #$03
            ASL
            ASL
            ASL
            ASL
            ASL
            TAX
            JSR   L10C9
L0C5B       LDY   #$F0
            LDA   $0F
            BEQ   L0CCC
            CMP   #$03
            BCS   L0C85
            CMP   #$01
            BNE   L0C77
            LDA   $19
            AND   #$03
            BNE   L0C73
            LDX   #$D0
            BNE   L0C8D
L0C73       LDX   #$C0
            BNE   L0C8D
L0C77       LDA   $19
            AND   #$03
            BNE   L0C81
            LDX   #$F0
            BNE   L0C8D
L0C81       LDX   #$E0
            BNE   L0C8D
L0C85       BNE   L0C8B
            LDX   #$A0
            BNE   L0C8D
L0C8B       LDX   #$80
L0C8D       JSR   L10C9
            LDY   #$F2
            LDA   $0F
            CMP   #$03
            BCS   L0CB6
            CMP   #$01
            BNE   L0CA9
            LDA   $19
            AND   #$03
            ASL
            ASL
            ASL
            ASL
            ADC   #$30
            TAX
            BNE   L0CC6
L0CA9       LDA   $19
            AND   #$03
            ASL
            ASL
            ASL
            ASL
            ADC   #$70
            TAX
            BNE   L0CC6
L0CB6       LDA   $19
            AND   #$03
            TAX
            LDA   L0CC2,X
            TAX
            JMP   L0CC6

L0CC2       HEX   00B000C0

L0CC6       JSR   L110D
            JMP   L0D3A

L0CCC       LDX   $0E
            BMI   L0CE1
            LDA   $19
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
            JSR   L8D45
            BNE   L0CF3
L0CEC       INX
            CPX   #$03
            BNE   L0CF3
            LDX   #$00
L0CF3       STX   $53
            LDX   $54
            BNE   L0D08
            LDA   #$0A
            JSR   L8D45
            BNE   L0D0F
            JSR   L8D10
            AND   #$03
            ADC   #$01
            TAX
L0D08       LDA   $19
            AND   #$07
            BNE   L0D0F
            DEX
L0D0F       STX   $54
L0D11       LDX   $53
            LDA   L0D34,X
            TAX
            LDY   #$F0
            JSR   L10C9
            LDA   $54
            BEQ   L0D27
            LDA   $19
            AND   #$01
            CLC
            ADC   #$01
L0D27       TAX
            LDA   L0D37,X
            TAX
            LDY   #$F2
            JSR   L110D
            JMP   L0D3A

L0D34       HEX   8090A0
L0D37       HEX   001020
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
L0DA2       LDY   $26
            LDA   $31
            BMI   L0DAD
            BNE   L0E0D
            JMP   L0F2C

L0DAD       LDX   #$13
L0DAF       LDA   L0DB9,X
            STA   L6398,X
            DEX
            BPL   L0DAF
            RTS

L0DB9       DB    $74
            DB    $20
            DB    $74
            DB    $14
            DB    $74
            DB    $2C
            DB    $74
            DB    $1C
            DB    $74
            DB    $74
            DB    $74
            DB    $30
            DB    $74
            DB    $3E
            DB    $74
            DB    $1C
            DB    $74
            DB    $36
            DB    $74
            DB    $74

L0DCD       LDX   #$13
L0DCF       LDA   L0DD9,X
            STA   L6398,X
            DEX
            BPL   L0DCF
            RTS

L0DD9       DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $30
            DB    $3C
            DB    $3A
            DB    $74
            DB    $30
            DB    $1E
            DB    $74
            DB    $3A
            DB    $24
            DB    $2C
            DB    $1C
            DB    $74
            DB    $74
            DB    $74
            DB    $74

L0DED       LDX   #$13
L0DEF       LDA   L0DF9,X
            STA   L6398,X
            DEX
            BPL   L0DEF
            RTS

L0DF9       DB    $74
            DB    $16
            DB    $74
            DB    $30
            DB    $74
            DB    $2E
            DB    $74
            DB    $3C
            DB    $74
            DB    $38
            DB    $74
            DB    $74
            DB    $2A
            DB    $74
            DB    $24
            DB    $74
            DB    $1E
            DB    $74
            DB    $1C
            DB    $74

L0E0D       CMP   #$01
            BEQ   L0E18
            CMP   #$10
            BEQ   L0DCD
            JMP   L0F1F

L0E18       LDA   $4D
            BEQ   L0E7C
            LDA   $08
            BEQ   L0DED
            LDX   #$06
L0E22       LDA   L0F4C,X
            STA   L6398,X
            DEX
            BPL   L0E22
            CLC
            LDA   #$00
            LDX   $28,Y
            DEX
            BEQ   L0E35
            ADC   #$03
L0E35       TAX
            LDY   #$02
L0E38       LDA   L0F53,X
            STA   L63A4,Y
            INX
            DEY
            BPL   L0E38
            LDY   $26
            TYA
            ASL
            ADC   #$02
            STA   L639F
            LDA   #$4A
            STA   L63A0
            LDA   |$0028,Y
            ASL
            STA   L63A2
            LDX   $2A,Y
            LDA   L0F6D,X
            STA   L63A8
            LDA   #$4C
            STA   L63A9
            LDA   |$002C,Y
            ASL
            ADC   #$02
            STA   L63AA
            LDA   #$74
            STA   L63A1
            STA   L63A3
            STA   L63A7
            STA   L63AB
            RTS

L0E7C       LDX   $2C,Y
            LDA   L7409,X
            TAX
            LDA   L0F81,X
            LDX   #$01
            JSR   L0F38
L0E8A       LDX   #$00
            LDA   $2F
            BNE   L0E9D
            LDA   $4C
            BPL   L0E95
            INX
L0E95       LDA   L7402,X
            LDX   #$04
            JSR   L0F38
L0E9D       LDA   #$4E
            STA   L639B
            LDX   $30
            LDA   L0F81,X
            LDX   #$07
            JSR   L0F38
            LDX   $1B
            CPX   #$64
            LDA   L0F81,X
            LDX   #$00
            BCC   L0EC2
            LDX   $1B
            CPX   #$C8
            LDX   #$02
            BCC   L0EC2
            CLC
            LDX   #$04
L0EC2       STX   L63A2
            LDX   #$0B
            JSR   L0F38
            LDA   $1B
            CMP   #$0A
            BCS   L0EE4
            LDA   $2F
            BNE   L0EE4
            LDA   $19
            LSR
            BCC   L0EE4
            LDA   #$74
            STA   L63A2
            STA   L63A3
            STA   L63A4
L0EE4       LDA   #$74
            STA   L6398
            STA   L639E
            STA   L63A1
            STA   L63A5
            TYA
            BNE   L0F0A
            LDA   $1E
            LDX   #$0E
            JSR   L0F38
            LDA   $1F
            LDX   #$10
            JSR   L0F38
            LDA   $20
            LDX   #$12
            JMP   L0F38

L0F0A       LDA   $21
            LDX   #$0E
            JSR   L0F38
            LDA   $22
            LDX   #$10
            JSR   L0F38
            LDA   $23
            LDX   #$12
            JMP   L0F38

L0F1F       CLC
            JSR   L0E8A
            LDA   #$4E
            STA   L6399
            STA   L639A
            RTS

L0F2C       LDY   #$13
L0F2E       LDA   L0F59,Y
            STA   L6398,Y
            DEY
            BPL   L0F2E
            RTS

L0F38       STA   $02
            AND   #$F0
            LSR
            LSR
            LSR
            STA   L6398,X
            INX
            LDA   $02
            AND   #$0F
            ASL
            STA   L6398,X
            RTS

L0F4C       DB    $32
            DB    $2A
            DB    $14
            DB    $44
            DB    $1C
            DB    $36
            DB    $74
L0F53       DB    $2E
            DB    $14
            DB    $2C
            DB    $2E
            DB    $1C
            DB    $2C
L0F59       DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $32
            DB    $14
            DB    $3C
            DB    $38
            DB    $1C
            DB    $74
            DB    $30
            DB    $2E
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $74
L0F6D       DB    $14
            DB    $16
            DB    $18
            DB    $1A
            DB    $4C
            DB    $1C
            DB    $1E
            DB    $20
            DB    $22
            DB    $4C
            DB    $24
            DB    $26
            DB    $28
            DB    $2A
            DB    $4C
            DB    $2C
            DB    $2E
            DB    $30
            DB    $32
            DB    $4C

L0F81       HEX   00010203040506070809101112131415
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

L1081       STX   $02
            LDA   $19
            AND   #$03
            ASL
            ASL
            ADC   $02
            TAX
L108C       CLC
            TYA
            ADC   #$04
            STA   $02
L1092       LDA   L6800,X
            STA   L6800,Y
            LDA   L6900,X
            STA   L6900,Y
            LDA   L6A00,X
            STA   L6A00,Y
            LDA   L6B00,X
            STA   L6B00,Y
            LDA   L6C00,X
            STA   L6C00,Y
            LDA   L6D00,X
            STA   L6D00,Y
            LDA   L6E00,X
            STA   L6E00,Y
            LDA   L6F00,X
            STA   L6F00,Y
            INX
            INY
            CPY   $02
            BNE   L1092
            RTS

L10C9       TYA
            CLC
            ADC   #$04
            STA   $02
L10CF       LDA   L7000,X
            STA   L6800,Y
            INX
            LDA   L7000,X
            STA   L6900,Y
            INX
            LDA   L7000,X
            STA   L6A00,Y
            INX
            LDA   L7000,X
            STA   L6B00,Y
            INX
            LDA   L7000,X
            STA   L6C00,Y
            INX
            LDA   L7000,X
            STA   L6D00,Y
            INX
            LDA   L7000,X
            STA   L6E00,Y
            INX
            LDA   L7000,X
            STA   L6F00,Y
            INX
            INY
            CPY   $02
            BNE   L10CF
            RTS

L110D       TYA
            CLC
            ADC   #$02
            STA   $02
L1113       LDA   L7100,X
            STA   L6800,Y
            INX
            LDA   L7100,X
            STA   L6900,Y
            INX
            LDA   L7100,X
            STA   L6A00,Y
            INX
            LDA   L7100,X
            STA   L6B00,Y
            INX
            LDA   L7100,X
            STA   L6C00,Y
            INX
            LDA   L7100,X
            STA   L6D00,Y
            INX
            LDA   L7100,X
            STA   L6E00,Y
            INX
            LDA   L7100,X
            STA   L6F00,Y
            INX
            INY
            CPY   $02
            BNE   L1113
            RTS

L1151       JSR   L124E
            LDY   $D8
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
            DEC   $D9
            DEX
            BNE   L1180
            RTS

L1189       JSR   L1151
            DEC   $D9
            INC   $D8
            DEX
            BNE   L1189
            RTS

L1194       JSR   L1151
            INC   $D8
            DEX
            BNE   L1194
            RTS

L119D       JSR   L1151
            INC   $D9
            INC   $D8
            DEX
            BNE   L119D
            RTS

L11A8       JSR   L1151
            INC   $D9
            DEX
            BNE   L11A8
            RTS

L11B1       JSR   L1151
            DEC   $D8
            INC   $D9
            DEX
            BNE   L11B1
            RTS

L11BC       JSR   L1151
            DEC   $D8
            DEX
            BNE   L11BC
            RTS

L11C5       JSR   L1151
            DEC   $D8
            DEC   $D9
            DEX
            BNE   L11C5
            RTS

L11D0       LDA   $D8
            STA   $03
            LDA   $D9
            STA   $04
            LDA   $DB
            STA   $02
            LDA   $DA
            STA   $DD
            LDA   #$02
            STA   $DB
            JSR   L115B
            LDA   $03
            STA   $D8
            LDA   $04
            CLC
            ADC   $02
            STA   $D9
            DEC   $D9
            JSR   L115B
            LDA   $03
            STA   $D8
            LDA   $04
            STA   $D9
            LDA   $02
            STA   $DA
            LDA   #$04
            STA   $DB
            JSR   L115B
            LDA   $03
            CLC
            ADC   $DD
            STA   $D8
            DEC   $D8
            LDA   $04
            STA   $D9
            LDA   $02
            STA   $DA
            JMP   L115B

L121E       JSR   L11D0
            INC   $03
            INC   $04
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
L123C       LDA   $03
            STA   $D8
            LDA   $04
            STA   $D9
            JSR   L115B
            INC   $04
            DEC   $02
            BNE   L123C
            RTS

L124E       LDA   #<L6000-$50
            STA   $00
            LDA   #>L6000-1
            STA   $01
            LDY   $D9
L1258       BEQ   L1268
            CLC
            LDA   $00
            ADC   #$28
            STA   $00
            BCC   L1265
            INC   $01
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

L1278       LDX   $26
            LDA   $2A,X
            ASL
            TAY
            LDA   L98AB,Y
            STA   $F8
            LDA   L98AC,Y
            STA   $F9
            LDY   #$00
L128A       LDA   ($F8),Y
            STA   L7400,Y
            INY
            BNE   L128A
            LDX   $26
            LDY   $2C,X
            LDA   L7404,Y
            STA   $15
            LDA   #$00
            STA   $16
            LDA   L740E,Y
            STA   $1B
            STA   $1A
            LDA   #<L6000
            STA   $00
            LDA   #>L6000
            STA   $01
            LDA   #$01
            STA   $04
L12B2       LDA   #$00
            STA   $03
L12B6       LDX   #$01
            JSR   L8D6E
            LDY   #$00
L12BD       CMP   L741C,Y
            BCS   L12C5
            LDX   L7418,Y
L12C5       INY
            CPY   #$04
            BNE   L12BD
            LDA   L98D3,X
            LDY   #$28
            STA   ($00),Y
            INC   $00
            BNE   L12D7
            INC   $01
L12D7       INC   $03
            LDA   $03
            CMP   #$28
            BNE   L12B6
            INC   $04
            LDA   $04
            CMP   #$16
            BNE   L12B2
            LDA   #$00
            STA   $D8
            LDA   #$02
            STA   $D9
            LDA   #$28
            STA   $DA
            LDA   #$16
            STA   $DB
            LDA   #$64
            STA   $D7
            JSR   L11D0
            LDY   #$00
            STY   $DE
L1302       LDY   $DE
            LDA   L7420,Y
            CMP   #$FF
            BEQ   L1371
            AND   #$3F
            TAX
            LDA   L98D3,X
            STA   $D7
            CMP   #$9D
            BNE   L1321
            LDA   L7421,Y
            STA   $0B
            LDA   L7422,Y
            STA   $0C
L1321       LDA   L7421,Y
            STA   $D8
            LDA   L7422,Y
            STA   $D9
            LDA   L7423,Y
            STA   $DA
            LDA   L7424,Y
            STA   $DB
            LDA   L7425,Y
            STA   $DC
            LDA   L7420,Y
            AND   #$C0
            BNE   L134A
            JSR   L1269
            JSR   L1151
            JMP   L136E

L134A       CMP   #$40
            BNE   L1357
            JSR   L126F
            JSR   L115B
            JMP   L136E

L1357       CMP   #$80
            BNE   L1364
            JSR   L1274
            JSR   L121E
            JMP   L136E

L1364       CMP   #$C0
            BNE   L136E
            JSR   L126F
            JSR   L11D0
L136E       JMP   L1302

L1371       LDA   #$7F
            STA   $35
            LDA   #$00
            STA   $07
            STA   $08
            STA   $09
            STA   $0A
            STA   $33
            STA   $4C
            STA   $19
            STA   $30
            STA   $2F
            LDA   #$6F
            STA   $2E
            LDA   #$01
            STA   $31
            LDA   #$02
            STA   $4D
            LDA   L7401
            STA   $1C
            LDA   #$90
            STA   $37
            LDX   $26
            LDY   $2C,X
            LDA   L0BD8,Y
            STA   $F8
            STA   $F9
            LDA   $2A,X
            CMP   #$04
            BEQ   L13C9
            CMP   #$09
            BEQ   L13C9
            CMP   #$0E
            BEQ   L13C9
            CMP   #$13
            BEQ   L13C9
            LDA   #$14
            STA   $07
            LDA   #$0B
            STA   $08
            LDA   #$04
            STA   $0E
            BNE   L13D9
L13C9       LDA   #$F0
            STA   $32
            LDX   $26
            INC   $28,X
            LDA   $28,X
            CMP   #$0A
            BCC   L13D9
            DEC   $28,X
L13D9       LDX   $7402
            LDA   L0F81,X
            STA   L7402
            LDX   L7403
            LDA   L0F81,X
            STA   L7403
            LDA   #$14        ; LOGO RECURSIVITY
            PHA
            LDA   #$04
            STA   L1405+2
            ORA   #$FB
            STA   L1405+1
            LDA   #$00
L13FA       INC   L1405+1
            BNE   L1402
            INC   L1405+2
L1402       INC   L1405
L1405       JMP   L1405

L1408       DEC   L1405
            LDY   L1405+2
            CPY   #$07
            BNE   L13FA
            LDY   L1405+1
            CPY   #$DF
            BNE   L13FA
            EOR   #$4E
            ORA   #$2B
            PHA
            LDA   #$04
            PHA
            LDA   $4F
            EOR   $4F
            CLC
            SBC   #$00
            PHA
            BCS   L142C
            RTS

L142C       LDA   #<L6400
            STA   $00
            LDA   #>L6400
            STA   $01
            LDA   #$60
            LDY   #$00
L1438       STA   ($00),Y
            INY
            BNE   L1438
            LDX   $01
            INX
            STX   $01
            CPX   #>L6800
            BNE   L1438
            LDA   #$1E
            STA   $D9
L144A       LDA   #$46
            STA   $D8
L144E       JSR   L8D10
            AND   #$03
            CLC
            TAX
            ADC   #>L6400
            STA   $01
            TXA
            ADC   #>L6000
            STA   $03
            JSR   L8D10
            TAY
            LDA   #<L6400
            STA   $00
            STA   $02
            LDA   ($02),Y
            STA   ($00),Y
            DEC   $D8
            BNE   L144E
            JSR   L0BDD
            LDY   #$60
L1475       LDA   L6800,Y
            STA   $02
            LDA   L6900,Y
            STA   L6800,Y
            LDA   L6A00,Y
            STA   L6900,Y
            LDA   L6B00,Y
            STA   L6A00,Y
            LDA   L6C00,Y
            STA   L6B00,Y
            LDA   L6D00,Y
            STA   L6C00,Y
            LDA   L6E00,Y
            STA   L6D00,Y
            LDA   L6F00,Y
            STA   L6E00,Y
            LDA   $02
            STA   L6F00,Y
            INY
            CPY   #$64
            BNE   L1475
            JSR   L7500
            DEC   $D9
            BEQ   L14B8
            JMP   L144A

L14B8       LDA   #<L6400
            STA   $00
            LDA   #>L6400
            STA   $01
            LDA   #<L6000
            STA   $02
            LDA   #>L6000
            STA   $03
            LDY   #$00
L14CA       LDA   ($02),Y
            STA   ($00),Y
            INY
            BNE   L14CA
            INC   $03
            LDX   $01
            INX
            STX   $01
            CPX   #>L6800
            BNE   L14CA
            RTS

*----------------------------- Entry point

L14DD       LDA   #$05
            STA   $24
            STA   $25
            LDA   #$03
            STA   $28
            STA   $29
            LDA   #$00
            STA   $55
            STA   $26
            STA   $27
            STA   $0F
            STA   $2A
            STA   $2B
            STA   $2C
            STA   $2D
            STA   $05
            STA   $06
            LDX   #$05
L1501       STA   $1E,X
            DEX
            BPL   L1501
            LDX   #$77
L1508       STA   $5C,X
            DEX
            BPL   L1508
            LDA   #<L6370
            STA   $00
            LDA   #>L6370
            STA   $01
            LDA   #$74
            LDY   #$27
L1519       STA   ($00),Y
            DEY
            BPL   L1519
            JSR   L8E8A
            LDA   TXTPAGE2
            JSR   L8E94
            LDA   TXTPAGE1
            LDA   L1582
            CMP   #$55	; did we choose a device?
            BEQ   L1534	; no
            JMP   L15BB	; yes

L1534       LDX   #$13
L1536       LDA   L1595,X
            STA   L6398,X
            DEX
            BPL   L1536
            LDY   #$9E
            JSR   L1FC4
            LDX   #$13
L1546       LDA   L15A7,X
            STA   L6398,X
            DEX
            BPL   L1546
            LDY   #$A7
            JSR   L1FC4
            LDX   #$50
L1556       JSR   L8D10
            LDA   #$F0
            JSR   WAIT
            DEX
            BPL   L1564
            JMP   L16C9

L1564       LDA   KBD
            BPL   L1556
            STA   KBDSTROBE
            CMP   #$C1	; A
            BEQ   L157B
            CMP   #$CA	; J
            BNE   L1556
            LDA   #$FF
            STA   L1582
            BNE   L15BB
L157B       LDA   #$00
            STA   L1582
            BEQ   L15BB

L1582       DB    $55	; 00: Apple joystick / FF: Atari joyport

            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $24
            DB    $2E
            DB    $32
            DB    $3C
            DB    $3A
            DB    $74
            DB    $1A
            DB    $1C
            DB    $3E
            DB    $24
            DB    $18
            DB    $1C
            DB    $74
            DB    $74
L1595       DB    $74
            DB    $74
            DB    $14
            DB    $4C
            DB    $32
            DB    $32
            DB    $2A
            DB    $1C
            DB    $74
            DB    $74
            DB    $26
            DB    $30
            DB    $44
            DB    $38
            DB    $3A
            DB    $24
            DB    $18
            DB    $28
L15A7       DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $26
            DB    $4C
            DB    $30
            DB    $44
            DB    $32
            DB    $30
            DB    $36
            DB    $3A
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $74
            DB    $74

L15BB       LDX   #$13
L15BD       LDA   L990F,X
            STA   L6398,X
            DEX
            BPL   L15BD
            LDY   #$A7
            JSR   L1FC4
L15CB       LDX   $27
            LDA   L994B,X
            STA   L15DB+1
            LDA   L994D,X
            STA   L15DB+2
            LDX   #$13
L15DB       LDA   L9923,X
            STA   L6398,X
            DEX
            BPL   L15DB
            LDY   #$9E
            JSR   L1FC4
            LDX   $2A
            LDA   L0F6D,X
            LDY   #$A7
            LDX   #$0C
            JSR   L1E05
            LDA   $2C
            ASL
            ADC   #$02
            LDY   #$A7
            LDX   #$26
            JSR   L1E05
            JMP   L1622

L1604       LDA   $2C
            CMP   #$03
            BCC   L1610
            LDA   #$00
            STA   $2A
            STA   $2B
L1610       JMP   L15CB

L1613       LDA   #$00
            STA   $0F
            STA   $2A
            STA   $2B
            JMP   L15CB

L161E       LDA   #$00
            STA   $0F
L1622       LDA   #$26
            STA   $1D
L1626       LDA   KBD
            BMI   L16A9
            LDA   $0F
            BEQ   L163C
            LDX   #$14
L1631       LDA   #$14
            JSR   WAIT
L1636       STA   SPKR
            DEX
            BPL   L1631
L163C       JSR   WAIT
            JSR   WAIT
            JSR   L084F
            JSR   L8D10
            DEC   $1D
            BNE   L164F
            JMP   L16C9

L164F       LDA   $52
            BPL   L1656
            JMP   L16DB

L1656       LDA   $0F
            BEQ   L1626
            CMP   #$03
            BCS   L168C
            CMP   #$01
            BNE   L1676
            LDA   $2C
            CMP   #$03
            BCS   L1613
            LDA   $2A
            BEQ   L161E
            SEC
            SBC   #$05
            STA   $2A
            STA   $2B
            JMP   L15CB

L1676       LDA   $2C
            CMP   #$03
            BCS   L1613
            LDA   $2A
            CLC
            ADC   #$05
            CMP   #$13
            BCS   L161E
            STA   $2A
            STA   $2B
            JMP   L15CB

L168C       BNE   L169B
            LDA   $2C
            CMP   #$04
            BEQ   L161E
            INC   $2C
            INC   $2D
            JMP   L1604

L169B       LDA   $2C
            BNE   L16A2
            JMP   L161E

L16A2       DEC   $2C
            DEC   $2D
            JMP   L1604

L16A9       STA   KBDSTROBE
            CMP   #$A0	; leave the startup screen
            BEQ   L16DB
            CMP   #$B1	; 1-player game
            BNE   L16BB
            LDA   #$00
            STA   $27
            JMP   L15CB

L16BB       CMP   #$B2	; 2-player game
            BEQ   L16C2
            JMP   L1626

L16C2       LDA   #$01
            STA   $27
            JMP   L15CB

L16C9       LDA   #$00
            STA   $2A
            STA   $2B
            STA   $2C
            STA   $2D
            STA   $26
            STA   $55
            LDA   #$FF
            STA   $27

L16DB       JSR   L8E8A
            LDA   #$01
            STA   $E8
            STA   $EE
L16E4       JSR   L1278

L16E7       JSR   L0BDD
            JSR   L7500
            JSR   L0ACB
            LDA   $2F
            BEQ   L16F7
            JMP   L17C8

L16F7       LDA   $27
            BPL   L170B
            JSR   L18A1
            BCS   L1708
            LDA   KBD
            BPL   L16E7
            STA   KBDSTROBE
L1708       JMP   L0800

L170B       LDA   KBD
            BPL   L16E7
            STA   KBDSTROBE
            CMP   #$93	; CTRL-S - sound on/off
            BEQ   L1758
            CMP   #$92	; CTRL-R - restart game
            BNE   L1724
            LDA   #$01
            STA   $E8
            STA   $EE
            JMP   L1870

L1724       CMP   #$9B	; ESCAPE - new rockford
            BNE   L172B
            JMP   L1818

L172B       CMP   #$A0	; SPACE - pause/restart game
            BNE   L16E7

*-----------------------------
* PAUSE GAME
*-----------------------------

            LDA   $4D
            BNE   L16E7
            LDA   $31
            STA   $D8
            LDA   #$00
            STA   $31
            JSR   L8E8A
L173E       JSR   L0BDD
            JSR   L7500
            LDA   #$90
            JSR   WAIT
            LDA   KBD
            BPL   L173E
            STA   KBDSTROBE
            LDA   $D8
            STA   $31
            JMP   L16E7

*-----------------------------
* SOUND ON/OFF
*-----------------------------

L1758       LDA   L17E2+1
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
            JMP   L16E7

*-----------------------------
* 
*-----------------------------

L17C8       LDX   $26
            LDA   $2C,X
            CLC
            ADC   #$01
            STA   $7403
            JSR   L8E8A
L17D5       LDA   $1B
            BEQ   L1801
            LDX   #$05
L17DB       LDA   #$96
            SEC
            SBC   $1B
            LSR
            LSR
L17E2       STA   SPKR
            JSR   WAIT
            DEX
            BPL   L17DB
            LDA   $1B
            AND   #$01
            BNE   L17F7
            JSR   L0BDD
            JSR   L7500
L17F7       LDY   #$01
            SED
            JSR   L8E48
            DEC   $1B
            BNE   L17D5
L1801       LDA   #$03
            STA   $D8
L1805       JSR   L0BDD
            JSR   L7500
            LDA   $19
            AND   #$07
            BNE   L1805
            DEC   $D8
            BNE   L1805
            JMP   L1820

*-----------------------------
* NEW ROCKFORD
*-----------------------------

L1818       LDX   $26
            DEC   $28,X
            LDA   $07
            BNE   L183F
L1820       LDX   $26
            LDA   $27
            BPL   L1829
            JMP   L0800

L1829       INC   $2A,X
            LDA   $2A,X
            CMP   #$14
            BCC   L183F
            LDA   #$00
            STA   $2A,X
            INC   $2C,X
            LDA   $2C,X
            CMP   #$05
            BCC   L183F
            DEC   $2C,X
L183F       LDA   #$00
            LDX   #$0B
L1843       STA   $E8,X
            DEX
            BNE   L1843
            LDA   #$01
            STA   $E8
            STA   $EE
            STA   $31
            STA   $4D
            LDX   $26
            BNE   L1859
            INX
            BNE   L185A
L1859       DEX
L185A       LDA   $27
            BEQ   L1864
            LDA   $28,X
            BEQ   L1864
            STX   $26
L1864       LDX   $26
            LDA   $28,X
            BEQ   L1870
            JSR   L8D93
            JMP   L16E4

*-----------------------------
* RESTART GAME
*-----------------------------

L1870       LDA   #$FF
            STA   $31
            JSR   L8D93
            JSR   L7500
            STA   TXTPAGE2
            JSR   L9110
            JSR   L9022
            LDA   #$00
            STA   $26
            LDX   #$28
L1889       LDA   #$E0
            JSR   WAIT
            JSR   L18A1
            BCS   L189E
            LDA   KBD
            BMI   L189B
            DEX
            BNE   L1889
L189B       STA   KBDSTROBE
L189E       JMP   L0800

L18A1       LDA   L1582	; Which device?
            BEQ   L18BB	; Apple joystick
            CMP   #$55	; none
            BEQ   L18C0
            LDA   SETAN0	; Atari joyport
            LDA   $26
            BEQ   L18B4
            LDA   CLRAN0
L18B4       LDA   BUTN0
            BMI   L18C0
            BPL   L18C6
L18BB       LDA   BUTN0
            BMI   L18C6
L18C0       LDA   #$00	; no button pressed
            STA   $52
            CLC
            RTS

L18C6       LDA   #$FF	; button pressed
            STA   $52
            SEC
            RTS

L18CC       JSR   L196D
            JSR   L1915
            JSR   L1942
            LDY   $04
            LDA   #$81
            STA   ($58),Y
            JMP   L0B32

L18DE       JSR   L196D
            JSR   L1942
            JSR   L192B
            LDY   $04
            LDA   #$82
            STA   ($58),Y
            JMP   L0B32

L18F0       JSR   L196D
            JSR   L192B
            JSR   L1956
            LDY   $04
            LDA   #$83
            STA   ($58),Y
            JMP   L0B32

L1902       JSR   L196D
            JSR   L1956
            JSR   L1915
            LDY   $04
            LDA   #$80
            STA   ($58),Y
            JMP   L0B32
L1914       RTS

L1915       LDY   $04
            DEY
            LDA   ($58),Y
            CMP   #$70
            BNE   L1914
            LDA   #$83
            STA   ($58),Y
            INY
            LDA   #$70
            STA   ($58),Y
            TXS
            JMP   L0B32

L192B       LDY   $04
            INY
            LDA   ($58),Y
            CMP   #$70
            BNE   L1914
            LDA   #$81
            STA   ($58),Y
            DEY
            LDA   #$70
            STA   ($58),Y
            INY
            TXS
            JMP   L0B32

L1942       LDY   $04
            LDA   ($56),Y
            CMP   #$70
            BNE   L1914
            LDA   #$80
            STA   ($56),Y
            LDA   #$70
            STA   ($58),Y
            TXS
            JMP   L0B32

L1956       LDY   $04
            LDA   ($5A),Y
            CMP   #$70
            BNE   L1914
            LDA   #$82
            STA   ($5A),Y
            STA   |$0084,Y
            LDA   #$70
            STA   ($58),Y
            TXS
            JMP   L0B32

L196D       LDA   ($56),Y
            CMP   #$F0
            BEQ   L199A
            CMP   #$90
            BEQ   L199A
            LDA   ($5A),Y
            CMP   #$F0
            BEQ   L199A
            CMP   #$90
            BEQ   L199A
            INY
            LDA   ($58),Y
            CMP   #$F0
            BEQ   L199A
            CMP   #$90
            BEQ   L199A
            DEY
            DEY
            LDA   ($58),Y
            CMP   #$F0
            BEQ   L199A
            CMP   #$90
            BEQ   L199A
            INY
            RTS

L199A       LDY   $04
            DEY
            LDX   #$03
            STX   $E1
L19A1       LDA   ($56),Y
            CMP   #$64
            BEQ   L19AB
            LDA   #$A0
            STA   ($56),Y
L19AB       LDA   ($58),Y
            CMP   #$64
            BEQ   L19B8
            LDA   #$A0
            STA   ($58),Y
            STA   |$005C,Y
L19B8       LDA   ($5A),Y
            CMP   #$64
            BEQ   L19C5
            LDA   #$A0
            STA   ($5A),Y
            STA   |$0084,Y
L19C5       INY
            DEX
            BNE   L19A1
            PLA
            PLA
            JMP   L0B32

L19CE       LDA   $5A
            CLC
            ADC   #$28
            STA   $00
            LDA   $5B
            ADC   #$00
            STA   $01
            LDY   $04
            DEY
            LDX   #$03
            STX   $E1
L19E2       LDA   ($58),Y
            CMP   #$64
            BEQ   L19EC
            LDA   #$A0
            STA   ($58),Y
L19EC       LDA   ($5A),Y
            CMP   #$64
            BEQ   L19F9
            LDA   #$A0
            STA   ($5A),Y
            STA   |$0084,Y
L19F9       LDA   ($00),Y
            CMP   #$64
            BEQ   L1A06
            LDA   #$A0
            STA   ($00),Y
            STA   |$00AC,Y
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
            LDY   $04
            LDA   #$87
            STA   ($58),Y
            JMP   L0B32

L1A22       JSR   L1AB1
            JSR   L1A9A
            JSR   L1A6F
            LDY   $04
            LDA   #$84
            STA   ($58),Y
            JMP   L0B32

L1A34       JSR   L1AB1
            JSR   L1A59
            JSR   L1A9A
            LDY   $04
            LDA   #$85
            STA   ($58),Y
            JMP   L0B32

L1A46       JSR   L1AB1
            JSR   L1A86
            JSR   L1A59
            LDY   $04
            LDA   #$86
            STA   ($58),Y
            JMP   L0B32
L1A58       RTS

L1A59       LDY   $04
            DEY
            LDA   ($58),Y
            CMP   #$70
            BNE   L1A58
            LDA   #$87
            STA   ($58),Y
            INY
            LDA   #$70
            STA   ($58),Y
            TXS
            JMP   L0B32

L1A6F       LDY   $04
            INY
            LDA   ($58),Y
            CMP   #$70
            BNE   L1A58
            LDA   #$85
            STA   ($58),Y
            DEY
            LDA   #$70
            STA   ($58),Y
            INY
            TXS
            JMP   L0B32

L1A86       LDY   $04
            LDA   ($56),Y
            CMP   #$70
            BNE   L1A58
            LDA   #$84
            STA   ($56),Y
            LDA   #$70
            STA   ($58),Y
            TXS
            JMP   L0B32

L1A9A       LDY   $04
            LDA   ($5A),Y
            CMP   #$70
            BNE   L1A58
            LDA   #$86
            STA   ($5A),Y
            STA   |$0084,Y
            LDA   #$70
            STA   ($58),Y
            TXS
            JMP   L0B32

L1AB1       LDA   ($56),Y
            CMP   #$F0
            BEQ   L1ADE
            CMP   #$90
            BEQ   L1ADE
            LDA   ($5A),Y
            CMP   #$F0
            BEQ   L1ADE
            CMP   #$90
            BEQ   L1ADE
            INY
            LDA   ($58),Y
            CMP   #$F0
            BEQ   L1ADE
            CMP   #$90
            BEQ   L1ADE
            DEY
            DEY
            LDA   ($58),Y
            CMP   #$F0
            BEQ   L1ADE
            CMP   #$90
            BEQ   L1ADE
            INY
            RTS

L1ADE       LDY   $04
            DEY
            LDX   #$03
            STX   $E1
L1AE5       LDA   ($56),Y
            CMP   #$64
            BEQ   L1AEF
            LDA   #$B0
            STA   ($56),Y
L1AEF       LDA   ($58),Y
            CMP   #$64
            BEQ   L1AFC
            LDA   #$B0
            STA   ($58),Y
            STA   |$005C,Y
L1AFC       LDA   ($5A),Y
            CMP   #$64
            BEQ   L1B09
            LDA   #$B0
            STA   ($5A),Y
            STA   |$0084,Y
L1B09       INY
            DEX
            BNE   L1AE5
            PLA
            PLA
            JMP   L0B32

L1B12       LDA   $5A
            CLC
            ADC   #$28
            STA   $00
            LDA   $5B
            ADC   #$00
            STA   $01
            LDY   $04
            DEY
            LDX   #$03
            STX   $E1
L1B26       LDA   ($58),Y
            CMP   #$64
            BEQ   L1B30
            LDA   #$B0
            STA   ($58),Y
L1B30       LDA   ($5A),Y
            CMP   #$64
            BEQ   L1B3D
            LDA   #$B0
            STA   ($5A),Y
            STA   |$0084,Y
L1B3D       LDA   ($00),Y
            CMP   #$64
            BEQ   L1B4A
            LDA   #$B0
            STA   ($00),Y
            STA   |$00AC,Y
L1B4A       INY
            DEX
            BNE   L1B26
            DEY
            PLA
            PLA
            JMP   L0B32

L1B54       LDA   ($5A),Y
            CMP   #$88
            BEQ   L1B72
            CMP   #$8C
            BEQ   L1B72
            CMP   #$68
            BEQ   L1B72
            CMP   #$70
            BNE   L1BA7
            STA   ($58),Y
            LDA   #$89
            STA   ($5A),Y
            STA   |$0084,Y
            JMP   L0B32

L1B72       DEY
            LDA   ($58),Y
            CMP   #$70
            BNE   L1B8B
            LDA   ($5A),Y
            CMP   #$70
            BNE   L1B8B
            LDA   #$89
            STA   ($58),Y
            INY
            LDA   #$70
            STA   ($58),Y
            JMP   L0B32

L1B8B       INY
            INY
            LDA   ($58),Y
            CMP   #$70
            BNE   L1BA6
            LDA   ($5A),Y
            CMP   #$70
            BNE   L1BA6
            LDA   #$89
            STA   ($58),Y
            DEY
            LDA   #$70
            STA   ($58),Y
            INY
            JMP   L0B32

L1BA6       DEY
L1BA7       JMP   L0B32

L1BAA       LDA   ($5A),Y
            AND   #$FC
            CMP   #$70
            BNE   L1BBE
            STA   ($58),Y
            LDA   #$89
            STA   ($5A),Y
            STA   |$0084,Y
            JMP   L0B32

L1BBE       CMP   #$94
            BNE   L1BF2
            LDA   $33
            BMI   L1BEB
            BNE   L1BCC
            LDA   #$01
            STA   $33
L1BCC       CLC
            LDA   $5A
            ADC   #$28
            STA   $00
            LDA   $5B
            ADC   #$00
            STA   $01
            LDA   ($00),Y
            CMP   #$70
            BNE   L1BEB
            STA   ($58),Y
            LDA   #$8D
            STA   ($00),Y
            STA   |$00AC,Y
            JMP   L0B32

L1BEB       LDA   #$70
            STA   ($58),Y
            JMP   L0B32

L1BF2       CMP   #$84
            BNE   L1BFB
            PHA
            PHA
            JMP   L1B12

L1BFB       CMP   #$F0
            BEQ   L1C03
            CMP   #$80
            BNE   L1C08
L1C03       PHA
            PHA
            JMP   L19CE

L1C08       LDA   #$88
            STA   ($58),Y
            DEY
            STA   $E1
            JMP   L0B32

L1C12       LDA   ($5A),Y
            CMP   #$88
            BEQ   L1C30
            CMP   #$8C
            BEQ   L1C30
            CMP   #$68
            BEQ   L1C30
            CMP   #$70
            BNE   L1C65
            STA   ($58),Y
            LDA   #$8D
            STA   ($5A),Y
            STA   |$0084,Y
            JMP   L0B32

L1C30       DEY
            LDA   ($58),Y
            CMP   #$70
            BNE   L1C49
            LDA   ($5A),Y
            CMP   #$70
            BNE   L1C49
            LDA   #$8D
            STA   ($58),Y
            INY
            LDA   #$70
            STA   ($58),Y
            JMP   L0B32

L1C49       INY
            INY
            LDA   ($58),Y
            CMP   #$70
            BNE   L1C64
            LDA   ($5A),Y
            CMP   #$70
            BNE   L1C64
            LDA   #$8D
            STA   ($58),Y
            DEY
            LDA   #$70
            STA   ($58),Y
            INY
            JMP   L0B32

L1C64       DEY
L1C65       JMP   L0B32

L1C68       LDA   ($5A),Y
            AND   #$FC
            CMP   #$70
            BNE   L1C7C
            STA   ($58),Y
            LDA   #$8D
            STA   ($5A),Y
            STA   |$0084,Y
            JMP   L0B32

L1C7C       CMP   #$94
            BNE   L1CB0
            LDA   $33
            BMI   L1CA9
            BNE   L1C8A
            LDA   #$01
            STA   $33
L1C8A       CLC
            LDA   $5A
            ADC   #$28
            STA   $00
            LDA   $5B
            ADC   #$00
            STA   $01
            LDA   ($00),Y
            CMP   #$70
            BNE   L1CA9
            STA   ($58),Y
            LDA   #$89
            STA   ($00),Y
            STA   |$00AC,Y
            JMP   L0B32

L1CA9       LDA   #$70
            STA   ($58),Y
            JMP   L0B32

L1CB0       CMP   #$84
            BNE   L1CB9
            PHA
            PHA
            JMP   L1B12

L1CB9       CMP   #$F0
            BEQ   L1CC1
            CMP   #$80
            BNE   L1CC6
L1CC1       PHA
            PHA
            JMP   L19CE

L1CC6       LDA   #$8C
            STA   ($58),Y
            DEY
            STA   $E5
            JMP   L0B32

L1CD0       LDA   ($58),Y
            CLC
            ADC   #$04
            STA   ($58),Y
            STA   $E1
            JMP   L0B32

L1CDC       LDA   #$70
            STA   ($58),Y
            JMP   L0B32

L1CE3       LDA   #$8C
            STA   ($58),Y
            JMP   L0B32
L1CEA       JMP   L0B32

L1CED       LDA   $4C
            BMI   L1CF4
            JMP   L0B32

L1CF4       LDA   $19
            AND   #$01
            BNE   L1CFE
            LDA   #$98
            BNE   L1D00
L1CFE       LDA   #$9C
L1D00       STA   ($58),Y
            JMP   L0B32

*-----------------------------

L1D05       DA    L18CC
            DA    L18DE
            DA    L18F0
            DA    L1902
            DA    L1A10
            DA    L1A22
            DA    L1A34
            DA    L1A46
            DA    L1B54
            DA    L1BAA
            DA    L1B54
            DA    L1BAA
            DA    L1C12
            DA    L1C68
            DA    L1C12
            DA    L1C68
            DA    L8C20
            DA    L8C20
            DA    L8C20
            DA    L8C20
            DA    L1CEA
            DA    L1CEA
            DA    L1CEA
            DA    L1CEA
            DA    L1CED
            DA    L8CCC
            DA    L1CED
            DA    L1CED
            DA    L1CED
            DA    L8CEE
            DA    L1CED
            DA    L1CED
            DA    L1CD0
            DA    L8CF5
            DA    L1CD0
            DA    L1CD0
            DA    L1CD0
            DA    L8CFE
            DA    L1CD0
            DA    L1CD0
            DA    L1CD0
            DA    L8D07
            DA    L1CD0
            DA    L1CD0
            DA    L1CDC
            DA    L1CDC
            DA    L1CDC
            DA    L1CDC
            DA    L1CD0
            DA    L1CD0
            DA    L1CD0
            DA    L1CD0
            DA    L1CD0
            DA    L1CD0
            DA    L1CD0
            DA    L1CD0
            DA    L1CD0
            DA    L1CD0
            DA    L1CD0
            DA    L1CD0
            DA    L1CE3
            DA    L1CE3
            DA    L1CE3
            DA    L1CE3

            HEX   A4A0A0C4A0A0A0A0A0A0BEA0A0CCA0A0
            HEX   C3A0A0A0A0A0A0A0AEA0A0A0A0A0C6A0
            HEX   A0C9A0A0A0A0A0A0A0A0A0AA89A0A09B
            HEX   A0B0A0A0B9A0A0B0A0A0A0A0A0D4A0A0
            HEX   80A0C4A0A0C2A0A0A0A0A0A0A0A0EBA0
            HEX   A0B8A0CE80A0C480A0CAA0A0A0A0A0A0
            HEX   3F8A3F8A3F8A3F8AA0A0B9A0A4DFA0A0
            HEX   80A0CFA0A0B0A0A0A0A0A0A0A0BEA0A0

*-----------------------------

L1E05       STA   $D6
            STX   $D4
            STY   $D5
            LDX   #$07
            STX   $03
L1E0F       LDX   $D5
            LDA   L1E44,X
            STA   $00
            LDA   L1F04,X
            STA   $01
            LDX   $03
            LDA   L1E3C,X
            STA   L1E2A+2
            STA   L1E30+2
            LDX   $D6
            LDY   $D4
L1E2A       LDA   L6800,X
            STA   ($00),Y
            INY
L1E30       LDA   L6801,X
            STA   ($00),Y
            INC   $D5
            DEC   $03
            BPL   L1E0F
            RTS

*-----------------------------

L1E3C       DB    >L6F00,>L6E00,>L6D00,>L6C00,>L6B00,>L6A00,>L6900,>L6800

L1E44       HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0

L1F04       HEX   2024282C3034383C2024282C3034383C
            HEX   2125292D3135393D2125292D3135393D
            HEX   22262A2E32363A3E22262A2E32363A3E
            HEX   23272B2F33373B3F23272B2F33373B3F
            HEX   2024282C3034383C2024282C3034383C
            HEX   2125292D3135393D2125292D3135393D
            HEX   22262A2E32363A3E22262A2E32363A3E
            HEX   23272B2F33373B3F23272B2F33373B3F
            HEX   2024282C3034383C2024282C3034383C
            HEX   2125292D3135393D2125292D3135393D
            HEX   22262A2E32363A3E22262A2E32363A3E
            HEX   23272B2F33373B3F23272B2F33373B3F

*-----------------------------

L1FC4       STY   $D9
            LDX   #$13
L1FC8       STX   $D8
            LDY   L6398,X
            TXA
            ASL
            TAX
            TYA
            LDY   $D9
            JSR   L1E05
            LDX   $D8
            DEX
            BPL   L1FC8
            RTS

            DS    \


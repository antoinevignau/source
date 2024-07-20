*
* A2-3D2
* by Bruce Artwick
*
* (c) 1980, subLOGIC
* (d) 2024, Antoine Vignau
*

            TYP   BIN
            ORG   $006000
            MX    %11
            LST   OFF

*-----------------------------------
* FIRMWARE EQUATES
*-----------------------------------

TXTCLR      EQU   $C050
MIXSET      EQU   $C053
TXTPAGE1    EQU   $C054
HIRES       EQU   $C057

*-----------------------------------
* 
*-----------------------------------

L6000       JMP   L606C
            JMP   L6090
            JMP   L61F7
            JMP   L6210

L600C       DB    $08
            DB    $16
            DB    $08
            DB    $7E
            DB    $7E
            DB    $06
            DB    $08
            DB    $06
            DB    $08
            DB    $0F
            DB    $00
            DB    $F5
            DB    $F5
            DB    $3E
            DB    $10
            DB    $3E
            DB    $10
            DB    $00
            DB    $00
            DB    $D3
            DB    $74
            DB    $C3
            DB    $24
            DB    $01
            DB    $D2
            DB    $3F
            DB    $01
            DB    $D2
            DB    $3F
            DB    $01
            DB    $D2
            DB    $3F
            DB    $01
            DB    $D2
            DB    $3F
            DB    $01
            DB    $D2
            DB    $3F
            DB    $01
            DB    $D2
            DB    $3F
            DB    $01
            DB    $D2
            DB    $3F
            DB    $01
            DB    $D2
            DB    $3F
            DB    $01
            DB    $D2
            DB    $3F
            DB    $01
            DB    $3E
            DB    $50
            DB    $3E
            DB    $50
            DB    $00
            DB    $00
            DB    $D3
            DB    $74
            DB    $F1
            DB    $F1
            DB    $E3
            DB    $E3
            DB    $E3
            DB    $E3
            DB    $05
            DB    $00
            DB    $C3
            DB    $52
            DB    $01
            DB    $C2
            DB    $15
            DB    $01
            DB    $23
            DB    $00
            DB    $FE
            DB    $60
            DB    $FE
            DB    $60
            DB    $C3
            DB    $5E
            DB    $01
            DB    $C2
            DB    $0B
            DB    $01
            DB    $00
            DB    $15
            DB    $C3
            DB    $66
            DB    $01
            DB    $C2
            DB    $0F
            DB    $01
            DB    $C3
            DB    $00
            DB    $00

*-----------------------------------
* 
*-----------------------------------

L606C       PHP
            PHA
            TXA
            PHA
            TYA
            PHA
            LDX   #$60
L6074       LDA   $5F,X
            STA   L600C-1,X
            DEX
            BNE   L6074
            JSR   L6090
            LDX   #$60
L6081       LDA   L600C-1,X
            STA   $5F,X
            DEX
            BNE   L6081
            PLA
            TAY
            PLA
            TAX
            PLA
            PLP
            RTS

L6090       CLD
            LDX   #$21
            LDA   #$00
L6095       STA   $7B,X
            DEX
            BNE   L6095
            LDA   #>L7FC5
            STA   $9B+1
            LDA   #<L7FC5
            STA   $9B
            LDA   #$FD
            STA   $7E
            STA   $86
            STA   $8E
            LDA   #$7F
            STA   $7F
            STA   $87
            STA   $8F
            LDA   #$00
            STA   $BB
            LDA   #$20
            STA   $BC
            LDA   #$40
            STA   $BD
            JMP   L6118

L60C1       INY
            LDA   ($9B),Y
            LDY   #$01
            STA   ($9D),Y
            DEY
            LDA   #$12
L60CB       STA   ($9D),Y
            LDA   #$02
            CLC
            CLC
            ADC   $9D
            STA   $9D
            BCC   L60D9
            INC   $9D+1
L60D9       JMP   L63CA

L60DC       DA    L62E2
            DA    L6266
            DA    L62A0
            DA    L62C6
            DA    L63C5
            DA    L63D2
            DA    L63E3
            DA    L63F4
            DA    L7478
            DA    L7BFA
            DA    L6401
            DA    L6410
            DA    L7F4B
            DA    L641E
            DA    L6442
            DA    L6467
            DA    L642F
            DA    L643D
            DA    L7C28
            DA    L6D1C
            DA    L7F06
            DA    L710A
            DA    L713F
            DA    L7156
            DA    L7184
            DA    L719C
            DA    L71D4
            DA    L71E9
            DA    L721E
            DA    L722F

*-----------------------------------
* 
*-----------------------------------

L6118       LDA   #$0A
            STA   $B1
L611C       LDY   #$00
            LDA   ($9B),Y
            BMI   L6126
            CMP   #$1E
            BMI   L612F
L6126       LDA   $7D
            BEQ   L612E
            LDA   #$79
            STA   ($9D),Y
L612E       RTS

L612F       ASL
            TAX
            LDA   L60DC,X
            STA   $A3
            LDA   L60DC+1,X
            STA   $A4
            JMP   ($00A3)

L613E       DB    $00
L613F       DB    $00
L6140       DB    $00
L6141       DB    $63
L6142       DB    $FF
L6143       DB    $7F
L6144       DB    $FF
L6145       DB    $7F
L6146       DB    $00

L6147       DW    $7FFF
            DW    $7FF5
            DW    $7FD7
            DW    $7FA6
            DW    $7F61
            DW    $7F09
            DW    $7E9C
            DW    $7E1C
            DW    $7D89
            DW    $7CE3
            DW    $7C29
            DW    $7B5C
            DW    $7A7C
            DW    $7989
            DW    $7883
            DW    $776B
            DW    $7640
            DW    $7503
            DW    $73B5
            DW    $7254
            DW    $70E1
            DW    $6F5E
            DW    $6DC9
            DW    $6C23
            DW    $6A6C
            DW    $6779
            DW    $66CE
            DW    $64E7
            DW    $62F1
            DW    $60EB
            DW    $5ED6
            DW    $5CB3
            DW    $5A81
            DW    $5842
            DW    $55F4
            DW    $539A
            DW    $5133
            DW    $4EBF
            DW    $4C3F
            DW    $49B3
            DW    $471C
            DW    $447A
            DW    $41CD
            DW    $3F16
            DW    $3C56
            DW    $398C
            DW    $36B9
            DW    $33DE
            DW    $30FB
            DW    $2E10
            DW    $2B1F
            DW    $2826
            DW    $2527
            DW    $2223
            DW    $1F19
            DW    $1C0B
            DW    $18F9
            DW    $15E1
            DW    $12C7
            DW    $0FAB
            DW    $0C8C
            DW    $096A
            DW    $0647
            DW    $0324
            DW    $0000

*-----------------------------------
* 
*-----------------------------------

L61C9       SEC
            SBC   #$40
L61CC       TAX
            BMI   L61EE
L61CF       CMP   #$40
            BMI   L61E5
            CLC
            ADC   #$7F
            EOR   #$FF
L61D8       ASL
            TAY
            SEC
            LDA   #$00
            SBC   L6147+1,Y
            TAX
            SBC   L6147,Y
            RTS

L61E5       ASL
            TAY
            LDX   L6147+1,Y
            LDA   L6147,Y
            RTS

L61EE       EOR   #$FF
            CLC
            ADC   #$01
            BPL   L61CF
            BMI   L61D8
L61F7       PHP
            PHA
            TXA
            PHA
            TYA
            PHA
            LDA   L613E
            JSR   L61C9
L6203       STX   L613F
            STA   L613E
            PLA
            TAY
            PLA
            TAX
            PLA
            PLP
            RTS

L6210       PHP
            PHA
            TXA
            PHA
            TYA
            PHA
            LDA   L613E
            JSR   L61CC
            JMP   L6203

L621F       DB    $00

L6220       CLC
            ADC   $9B
            STA   $9B
            BCC   L6229
            INC   $9B+1
L6229       RTS

L622A       LDY   #$68
            JSR   L6862
            JSR   L6A90
            LDX   #$07
L6234       LDA   $67,X
            STA   $6F,X
            DEX
            BNE   L6234
            LDA   #$07
            JSR   L6220
            LDA   L621F
            CMP   #$02
            BEQ   L6261
            LDA   $66
            AND   $6E
            RTS

L624C       LDY   #$60
            JSR   L6862
            JSR   L6A37
            LDA   #$07
            JSR   L6220
            LDA   L621F
            CMP   #$02
            BEQ   L6261
            RTS

L6261       PLA
            PLA
            JMP   L6118

L6266       JSR   L624C
            JSR   L622A
            BNE   L62C3
            LDA   $66
            BNE   L6286
L6272       LDA   $6E
            BNE   L6279
            JMP   L6333

L6279       LDA   $7C
            BNE   L629B
            JSR   L6B03
            DEC   $B1
            BEQ   L62C3
            BNE   L6272
L6286       LDA   $7C
            BNE   L629B
L628A       JSR   L6AE9
            LDA   $66
            BEQ   L6272
            AND   $6E
            BNE   L62C3
            DEC   $B1
            BNE   L628A
            BEQ   L62C3
L629B       STA   L6146
            BNE   L62C3
L62A0       LDX   #$07
L62A2       LDA   $6F,X
            STA   $5F,X
            DEX
            BNE   L62A2
            JSR   L622A
            BNE   L62C3
            LDA   $66
            BNE   L6286
L62B2       LDA   $6E
            BEQ   L6314
            LDA   $7C
            BNE   L629B
            JSR   L6B03
            DEC   $B1
            BEQ   L62C3
            BNE   L62B2
L62C3       JMP   L6118

L62C6       LDX   #$07
L62C8       LDA   $6F,X
            STA   $67,X
            DEX
            BNE   L62C8
            JSR   L624C
            LDA   $66
            AND   $6E
            BNE   L62C3
            LDA   $66
            BNE   L6286
            LDA   $6E
            BNE   L6279
            BEQ   L6324
L62E2       JSR   L624C
            LDA   $66
            BEQ   L62EC
            JMP   L611C

L62EC       LDY   #$60
            LDX   #$9F
            JSR   L637C
            TAY
            LDX   $9F
            LDA   $7D
            BMI   L6300
            JSR   L7571
            JMP   L611C

L6300       LDA   #$0A
            LDY   #$00
            STA   ($9D),Y
            INY
            LDA   $9F
            STA   ($9D),Y
            INY
            LDA   $A0
            STA   ($9D),Y
            LDA   #$03
            BPL   L6370
L6314       LDA   L6146
            BNE   L6333
            LDA   $A1
            LDX   $A2
            STA   $9F
            STX   $A0
            JMP   L633F

L6324       LDA   L6146
            BNE   L6333
            LDY   #$60
            LDX   #$9F
            JSR   L637C
            JMP   L6346

L6333       LDA   #$00
            STA   L6146
            LDY   #$60
            LDX   #$9F
            JSR   L637C
L633F       LDY   #$68
            LDX   #$A1
            JSR   L637C
L6346       LDA   $7D
            BNE   L6360
            LDA   $9F
            LDX   $A0
            STA   $B3
            STX   $B4
            LDA   $A1
            LDX   $A2
            STA   $B5
            STX   $B6
            JSR   L75AD
            JMP   L6118

L6360       LDA   #$06
            LDY   #$00
L6364       STA   ($9D),Y
            LDA   |$009F,Y
            INY
            CPY   #$05
            BNE   L6364
            LDA   #$05
L6370       CLC
            ADC   $9D
            STA   $9D
            BCC   L6379
            INC   $9E
L6379       JMP   L6118

L637C       STX   $A7
            STY   $A8
            LDA   |$0004,Y
            STA   $7A
            LDA   |$0005,Y
            STA   $7B
            LDX   $00,Y
            LDA   |$0001,Y
            JSR   L65F3
            LDA   $79
L6394       LDX   #$45
            JSR   L65B2
            CLC
L639A       ADC   #$00
            LDY   $A7
            STA   |$0000,Y
            LDY   $A8
            LDA   |$0004,Y
            STA   $7A
            LDA   |$0005,Y
            STA   $7B
            LDX   $02,Y
            LDA   |$0003,Y
            JSR   L65F3
            LDA   $79
L63B7       LDX   #$5E
            JSR   L65B2
            CLC
L63BD       ADC   #$00
            LDY   $A7
            STA   |$0001,Y
            RTS

L63C5       INY
            LDA   ($9B),Y
            STA   $7C
L63CA       LDA   #$02
L63CC       JSR   L6220
            JMP   L6118

L63D2       INY
            LDA   ($9B),Y
            STA   |$008F,Y
            CPY   #$09
            BNE   L63D2
            JSR   L6683
            LDA   #$0A
            BNE   L63CC
L63E3       INY
            LDA   ($9B),Y
            STA   |$00B2,Y
            CPY   #$04
            BNE   L63E3
            JSR   L75AD
L63F0       LDA   #$05
            BNE   L63CC
L63F4       INY
            LDA   ($9B),Y
            STA   L63FC+1
            LDA   #$00
L63FC       STA   TXTPAGE1
            BEQ   L63CA
L6401       INY
            LDA   ($9B),Y
            TAX
            INY
            LDA   ($9B),Y
            TAY
            JSR   L7571
L640C       LDA   #$03
            BNE   L63CC
L6410       INY
            LDA   ($9B),Y
            TAX
            INY
            LDA   ($9B),Y
            STA   $9B+1
            STX   $9B
            JMP   L611C

L641E       LDA   #$FF
            STA   $7D
            INY
            LDA   ($9B),Y
            STA   $9D
            INY
            LDA   ($9B),Y
            STA   $9E
            JMP   L640C

L642F       LDA   #$00
            STA   MIXSET
            STA   HIRES
            STA   TXTCLR
            STA   TXTPAGE1
L643D       LDA   #$01
            JMP   L63CC

L6442       INY
            LDA   ($9B),Y
            CLC
            ROR
            SEC
            SBC   #$01
            STA   L6394+1
            INY
            LDA   ($9B),Y
            CLC
            ROR
            SEC
            SBC   #$01
            STA   L63B7+1
            INY
            LDA   ($9B),Y
            STA   L639A+1
            INY
            LDA   ($9B),Y
            STA   L63BD+1
            JMP   L63F0

L6467       INY
            LDA   ($9B),Y
            STA   L613F,Y
            CPY   #$06
            BNE   L6467
            LDA   #$07
            JMP   L63CC

L6476       STA   $A3
            LDA   $00,X
            STA   $78
            LDA   $01,X
            STA   $79
            LDA   |$0000,Y
            STA   $7A
            LDA   |$0001,Y
            STA   $7B
            JSR   L6495
            LDY   $A3
            STA   |$0000,Y
            STX   $01,Y
            RTS

L6495       LDA   $78
            ORA   $79
            BEQ   L64A1
            LDA   $7A
            ORA   $7B
            BNE   L64A6
L64A1       LDA   #$00
            LDX   #$00
            RTS

L64A6       LDA   $79
            EOR   $7B
            TAY
            LDA   $79
            BMI   L64BD
            LDA   #$FF
            EOR   $78
            STA   $78
            LDA   #$FF
            EOR   $79
            STA   $79
            BMI   L64C5
L64BD       LDA   $78
            BNE   L64C3
            DEC   $79
L64C3       DEC   $78
L64C5       LDA   $7B
            BPL   L64D6
            LDA   #$00
            SEC
            SBC   $7A
            STA   $7A
            LDA   #$00
            SBC   $7B
            STA   $7B
L64D6       LSR   $78
            BCC   L64DC
            LDA   #$00
L64DC       LSR
            ROR   $78
            BCS   L64E3
            ADC   $7B
L64E3       LSR
            ROR   $78
            BCS   L64EA
            ADC   $7B
L64EA       LSR
            ROR   $78
            BCS   L64F1
            ADC   $7B
L64F1       LSR
            ROR   $78
            BCS   L64F8
            ADC   $7B
L64F8       LSR
            ROR   $78
            BCS   L64FF
            ADC   $7B
L64FF       LSR
            LDX   #$00
            STX   $A5
            LSR   $78
            BCS   L6512
            TAX
            LDA   $A5
            ADC   $7A
            STA   $A5
            TXA
            ADC   $7B
L6512       LSR
            ROR   $A5
            LSR   $78
            BCS   L6523
            TAX
            LDA   $A5
            ADC   $7A
            STA   $A5
            TXA
            ADC   $7B
L6523       LSR
            ROR   $A5
            LSR   $79
            BCS   L6534
            TAX
            LDA   $A5
            ADC   $7A
            STA   $A5
            TXA
            ADC   $7B
L6534       LSR
            ROR   $A5
            LSR   $79
            BCS   L6545
            TAX
            LDA   $A5
            ADC   $7A
            STA   $A5
            TXA
            ADC   $7B
L6545       LSR
            ROR   $A5
            LSR   $79
            BCS   L6556
            TAX
            LDA   $A5
            ADC   $7A
            STA   $A5
            TXA
            ADC   $7B
L6556       LSR
            ROR   $A5
            LSR   $79
            BCS   L6567
            TAX
            LDA   $A5
            ADC   $7A
            STA   $A5
            TXA
            ADC   $7B
L6567       LSR
            ROR   $A5
            LSR   $79
            BCS   L6578
            TAX
            LDA   $A5
            ADC   $7A
            STA   $A5
            TXA
            ADC   $7B
L6578       LSR
            ROR   $A5
            LSR   $79
            BCS   L6589
            TAX
            LDA   $A5
            ADC   $7A
            STA   $A5
            TXA
            ADC   $7B
L6589       LSR
            ROR   $A5
            LSR   $79
            BCS   L659A
            TAX
            LDA   $A5
            ADC   $7A
            STA   $A5
            TXA
            ADC   $7B
L659A       LSR
            ROR   $A5
            CPY   #$00
            BPL   L65AE
            STA   $A6
            LDA   #$00
            SEC
            SBC   $A5
            STA   $A5
            LDA   #$00
            SBC   $A6
L65AE       TAX
            LDA   $A5
            RTS

L65B2       EOR   #$FF
            STA   $78
            STX   $7B
            LDA   #$00
            ROR   $78
            BCS   L65BF
            TXA
L65BF       LSR
            ROR   $78
            BCS   L65C6
            ADC   $7B
L65C6       LSR
            ROR   $78
            BCS   L65CD
            ADC   $7B
L65CD       LSR
            ROR   $78
            BCS   L65D4
            ADC   $7B
L65D4       LSR
            ROR   $78
            BCS   L65DB
            ADC   $7B
L65DB       LSR
            ROR   $78
            BCS   L65E2
            ADC   $7B
L65E2       LSR
            ROR   $78
            BCS   L65E9
            ADC   $7B
L65E9       LSR
            ROR   $78
            BCS   L65F2
            SEC
            SEC
            SBC   $7B
L65F2       RTS

L65F3       ORA   #$00
            BMI   L6603
            LDY   $7B
            BMI   L65FD
            BPL   L6641
L65FD       JSR   L6620
            JMP   L6630

L6603       JSR   L6612
            LDY   $7B
            BMI   L660C
            BPL   L6630
L660C       JSR   L6620
            JMP   L6641

L6612       TAY
            TXA
            EOR   #$FF
            CLC
            ADC   #$01
            TAX
            TYA
            EOR   #$FF
            ADC   #$00
            RTS

L6620       TAY
            LDA   #$00
            SEC
            SBC   $7A
            STA   $7A
            LDA   #$00
            SBC   $7B
            STA   $7B
            TYA
            RTS

L6630       JSR   L6641
            LDA   #$00
            SEC
            SBC   $78
            STA   $78
            LDA   #$00
            SBC   $79
            STA   $79
            RTS

L6641       LDY   #$0F
            STX   $A5
L6645       TAX
            LDA   $A5
            SEC
            SBC   $7A
            STA   $A5
            TXA
            SBC   $7B
            BMI   L665F
L6652       SEC
            ROL   $78
            ROL   $79
            ASL   $A5
            ROL
            DEY
            BNE   L6645
            BEQ   L6678
L665F       ASL   $78
            ROL   $79
            ASL   $A5
            ROL
            DEY
            BEQ   L6678
            TAX
            LDA   $A5
            CLC
            ADC   $7A
            STA   $A5
            TXA
            ADC   $7B
            BMI   L665F
            BPL   L6652
L6678       ASL   $78
            ROL   $79
            BPL   L6682
            DEC   $78
            DEC   $79
L6682       RTS

L6683       LDA   $96
            JSR   L61C9
            STA   $60
            STX   $61
            LDA   $97
            JSR   L61C9
            STA   $62
            STX   $63
            LDA   $98
            JSR   L61C9
            STA   $64
            STX   $65
            LDA   $96
            JSR   L61CC
            STA   $66
            STX   $67
            LDA   $97
            JSR   L61CC
            STA   $68
            STX   $69
            LDA   $98
            JSR   L61CC
            STA   $6A
            STX   $6B
            LDX   #$6A
            LDY   #$68
            LDA   #$6C
            JSR   L6476
            LDX   #$64
            LDY   #$62
            LDA   #$6E
            JSR   L6476
            LDX   #$6A
            LDY   #$62
            LDA   #$70
            JSR   L6476
            LDX   #$64
            LDY   #$68
            LDA   #$72
            JSR   L6476
            LDX   #$60
            LDY   #$6E
            LDA   #$74
            JSR   L6476
            LDX   #$60
            LDY   #$72
            LDA   #$76
            JSR   L6476
            LDX   #$70
            LDY   #$60
            LDA   #$B3
            JSR   L6476
            LDX   #$60
            LDY   #$6C
            LDA   #$B5
            JSR   L6476
            CLC
            LDA   $6C
            ADC   $74
            STA   $7E
            LDA   $6D
            ADC   $75
            STA   $7F
            SEC
            LDA   $76
            SBC   $70
            STA   $80
            LDA   $77
            SBC   $71
            STA   $81
            LDX   #$64
            LDY   #$66
            LDA   #$82
            JSR   L6476
            LDX   #$62
            LDY   #$66
            LDA   #$84
            JSR   L6476
            LDX   #$66
            LDY   #$68
            LDA   #$86
            JSR   L6476
            LDA   #$00
            SEC
            SBC   $60
            STA   $88
            LDA   #$00
            SBC   $61
            STA   $89
            SEC
            LDA   $B3
            SBC   $72
            STA   $8A
            LDA   $B4
            SBC   $73
            STA   $8B
            CLC
            LDA   $6E
            ADC   $B5
            STA   $8C
            LDA   $6F
            ADC   $B6
            STA   $8D
            LDX   #$6A
            LDY   #$66
            LDA   #$8E
            JSR   L6476
            LDX   L6141
            CPX   #$7F
            BNE   L6774
            LDA   L6140
            CMP   #$FF
            BEQ   L67B9
L6774       STA   $78
            STX   $79
            LDA   $7E
            LDX   $7F
            STA   $7A
            STX   $7B
            JSR   L6495
            STA   $7E
            STX   $7F
            LDA   $84
            LDX   $85
            STA   $78
            STX   $79
            LDA   L6140
            LDX   L6141
            STA   $7A
            STX   $7B
            JSR   L6495
            STA   $84
            STX   $85
            LDA   $8A
            LDX   $8B
            STA   $78
            STX   $79
            LDA   L6140
            LDX   L6141
            STA   $7A
            STX   $7B
            JSR   L6495
            STA   $8A
            STX   $8B
L67B9       LDX   L6143
            CPX   #$7F
            BNE   L67C7
            LDA   L6142
            CMP   #$FF
            BEQ   L680C
L67C7       STA   $78
            STX   $79
            LDA   $80
            LDX   $81
            STA   $7A
            STX   $7B
            JSR   L6495
            STA   $80
            STX   $81
            LDA   L6142
            LDX   L6143
            STA   $78
            STX   $79
            LDA   $86
            LDX   $87
            STA   $7A
            STX   $7B
            JSR   L6495
            STA   $86
            STX   $87
            LDA   L6142
            LDX   L6143
            STA   $78
            STX   $79
            LDA   $8C
            LDX   $8D
            STA   $7A
            STX   $7B
            JSR   L6495
            STA   $8C
            STX   $8D
L680C       LDX   L6145
            CPX   #$7F
            BNE   L681A
            LDA   L6144
            CMP   #$FF
            BEQ   L685F
L681A       STA   $78
            STX   $79
            LDA   $82
            LDX   $83
            STA   $7A
            STX   $7B
            JSR   L6495
            STA   $82
            STX   $83
            LDA   L6144
            LDX   L6145
            STA   $78
            STX   $79
            LDA   $88
            LDX   $89
            STA   $7A
            STX   $7B
            JSR   L6495
            STA   $88
            STX   $89
            LDA   L6144
            LDX   L6145
            STA   $78
            STX   $79
            LDA   $8E
            LDX   $8F
            STA   $7A
            STX   $7B
            JSR   L6495
            STA   $8E
            STX   $8F
L685F       RTS

L6860       DB    $00
L6861       DB    $00

L6862       STY   $B2
            LDY   #$01
            LDA   ($9B),Y
            INY
            SEC
            SBC   $90
            STA   $AB
            LDA   ($9B),Y
            INY
            SBC   $91
            BVC   L6878
            JMP   L69AC

L6878       STA   $AC
            LDA   ($9B),Y
            INY
            SEC
            SBC   $92
            STA   $AD
            LDA   ($9B),Y
            INY
            SBC   $93
            BVC   L688C
            JMP   L69E2

L688C       STA   $AE
            LDA   ($9B),Y
            INY
            SEC
            SBC   $94
            STA   $AF
            LDA   ($9B),Y
            INY
            SBC   $95
            BVC   L68A0
            JMP   L69F1

L68A0       STA   $B0
L68A2       LDA   $AC
            AND   #$C0
            BEQ   L68AC
            CMP   #$C0
            BNE   L68C0
L68AC       LDA   $AE
            AND   #$C0
            BEQ   L68B6
            CMP   #$C0
            BNE   L68C0
L68B6       LDA   $B0
            AND   #$C0
            BEQ   L68DA
            CMP   #$C0
            BEQ   L68DA
L68C0       LDA   L621F
            BNE   L68DA
            LDA   $AC
            ROL
            ROR   $AC
            ROR   $AB
            LDA   $AE
            ROL
            ROR   $AE
            ROR   $AD
            LDA   $B0
            ROL
            ROR   $B0
            ROR   $AF
L68DA       LDA   #$00
            STA   L6860
            STA   L6861
            LDX   #$AB
            LDY   #$7E
            LDA   #$A7
            JSR   L6476
            LDX   #$AD
            LDY   #$84
            LDA   #$A9
            JSR   L6476
            LDA   $AF
            LDX   $B0
            STA   $78
            STX   $79
            LDA   $8A
            LDX   $8B
            STA   $7A
            STX   $7B
            JSR   L6495
            JSR   L6A07
            LDX   #$AB
            LDY   #$80
            LDA   #$A7
            JSR   L6476
            LDX   #$AD
            LDY   #$86
            LDA   #$A9
            JSR   L6476
            LDA   $AF
            LDX   $B0
            STA   $78
            STX   $79
            LDA   $8C
            LDX   $8D
            STA   $7A
            STX   $7B
            JSR   L6495
            JSR   L6A07
            LDX   #$AB
            LDY   #$82
            LDA   #$A7
            JSR   L6476
            LDX   #$AD
            LDY   #$88
            LDA   #$A9
            JSR   L6476
            LDA   $AF
            LDX   $B0
            STA   $78
            STX   $79
            LDA   $8E
            LDX   $8F
            STA   $7A
            STX   $7B
            JSR   L6495
            JSR   L6A07
            LDA   L621F
            BEQ   L6962
            JSR   L7205
L6962       LDX   $B2
            LDA   L6861
            BEQ   L697F
            LDA   $FF,X
            ROL
            ROR   $FF,X
            ROR   $FE,X
            LDA   $FD,X
            ROL
            ROR   $FD,X
            ROR   $FC,X
            LDA   $FB,X
            ROL
            ROR   $FB,X
            ROR   $FA,X
            RTS

L697F       LDA   L6860
            BNE   L69AB
            LDA   $FE,X
            ASL
            ROL   $FF,X
            ASL
            ROL   $FF,X
            ASL
            ROL   $FF,X
            STA   $FE,X
            LDA   $FC,X
            ASL
            ROL   $FD,X
            ASL
            ROL   $FD,X
            ASL
            ROL   $FD,X
            STA   $FC,X
            LDA   $FA,X
            ASL
            ROL   $FB,X
            ASL
            ROL   $FB,X
            ASL
            ROL   $FB,X
            STA   $FA,X
L69AB       RTS

L69AC       ROR
            STA   $AC
            ROR   $AB
            LDA   ($9B),Y
            INY
            SEC
            SBC   $92
            STA   $AD
            LDA   ($9B),Y
            INY
            SBC   $93
            BVS   L69C4
            STA   $AE
            ROL   $AE
L69C4       ROR
            STA   $AE
            ROR   $AD
L69C9       LDA   ($9B),Y
            INY
            SEC
            SBC   $94
            STA   $AF
            LDA   ($9B),Y
            INY
            SBC   $95
            BVS   L69DA
            CMP   #$80
L69DA       ROR
            STA   $B0
            ROR   $AF
            JMP   L68A2

L69E2       ROR
            STA   $AE
            ROR   $AD
            LDA   $AC
            ROL
            ROR   $AC
            ROR   $AB
            JMP   L69C9

L69F1       ROR
            STA   $B0
            ROR   $AF
            LDA   $AE
            ROL
            ROR   $AE
            ROR   $AD
            LDA   $AC
            ROL
            ROR   $AC
            ROR   $AB
            JMP   L68A2

L6A07       CLC
            ADC   $A7
            TAY
            TXA
            ADC   $A8
            TAX
            TYA
            CLC
            ADC   $A9
            TAY
            TXA
            ADC   $AA
            LDX   $B2
            STA   $01,X
            STY   $00,X
            INC   $B2
            INC   $B2
            TAX
            BEQ   L6A36
            CMP   #$FF
            BEQ   L6A36
            INC   L6860
            AND   #$E0
            BEQ   L6A36
            CMP   #$E0
            BEQ   L6A36
            INC   L6861
L6A36       RTS

L6A37       LDX   #$00
            LDA   $60
            CLC
            ADC   $64
            LDA   $61
            ADC   $65
            BMI   L6A48
            BVC   L6A4C
            BVS   L6A4A
L6A48       BVS   L6A4C
L6A4A       LDX   #$40
L6A4C       LDA   $64
            SEC
            SBC   $60
            LDA   $65
            SBC   $61
            BMI   L6A5B
            BVC   L6A61
            BVS   L6A5D
L6A5B       BVS   L6A61
L6A5D       TXA
            ORA   #$20
            TAX
L6A61       LDA   $62
            CLC
            ADC   $64
            LDA   $63
            ADC   $65
            BMI   L6A70
            BVC   L6A76
            BVS   L6A72
L6A70       BVS   L6A76
L6A72       TXA
            ORA   #$10
            TAX
L6A76       LDA   $64
            SEC
            SBC   $62
            LDA   $65
            SBC   $63
            BMI   L6A85
            BVC   L6A8D
            BVS   L6A87
L6A85       BVS   L6A8D
L6A87       TXA
            ORA   #$08
            STA   $66
            RTS

L6A8D       STX   $66
            RTS

L6A90       LDX   #$00
            LDA   $68
            CLC
            ADC   $6C
            LDA   $69
            ADC   $6D
            BMI   L6AA1
            BVC   L6AA5
            BVS   L6AA3
L6AA1       BVS   L6AA5
L6AA3       LDX   #$40
L6AA5       LDA   $6C
            SEC
            SBC   $68
            LDA   $6D
            SBC   $69
            BMI   L6AB4
            BVC   L6ABA
            BVS   L6AB6
L6AB4       BVS   L6ABA
L6AB6       TXA
            ORA   #$20
            TAX
L6ABA       LDA   $6A
            CLC
            ADC   $6C
            LDA   $6B
            ADC   $6D
            BMI   L6AC9
            BVC   L6ACF
            BVS   L6ACB
L6AC9       BVS   L6ACF
L6ACB       TXA
            ORA   #$10
            TAX
L6ACF       LDA   $6C
            SEC
            SBC   $6A
            LDA   $6D
            SBC   $6B
            BMI   L6ADE
            BVC   L6AE6
            BVS   L6AE0
L6ADE       BVS   L6AE6
L6AE0       TXA
            ORA   #$08
            STA   $6E
            RTS

L6AE6       STX   $6E
            RTS

L6AE9       JSR   L6AF3
            JSR   L6B03
            JSR   L6AF3
            RTS

L6AF3       LDY   #$08
L6AF5       LDA   |$005F,Y
            LDX   $67,Y
            STA   |$0067,Y
            STX   $5F,Y
            DEY
            BNE   L6AF5
            RTS

L6B03       LDA   $6E
            AND   #$BF
            BEQ   L6B13
            AND   #$DF
            BEQ   L6B16
            AND   #$EF
            BEQ   L6B19
            BNE   L6B1C
L6B13       JMP   L6C97
L6B16       JMP   L6C1C
L6B19       JMP   L6B97

L6B1C       SEC
            LDA   $64
            SBC   $6C
            STA   $7A
            LDA   $65
            SBC   $6D
            STA   $7B
            LDA   $62
            SEC
            SBC   $6A
            TAX
            LDA   $63
            SBC   $6B
            TAY
            TXA
            SEC
            SBC   $7A
            STA   $7A
            TYA
            SBC   $7B
            STA   $7B
            LDA   $6C
            SEC
            SBC   $6A
            TAX
            LDA   $6D
            SBC   $6B
            JSR   L65F3
            SEC
            LDA   $60
            SBC   $68
            STA   $7A
            LDA   $61
            SBC   $69
            STA   $7B
            LDA   $78
            LDX   $79
            STA   $A7
            STX   $A8
            JSR   L6495
            CLC
            ADC   $68
            STA   $68
            TXA
            ADC   $69
            STA   $69
            SEC
            LDA   $64
            SBC   $6C
            STA   $7A
            LDA   $65
            SBC   $6D
            STA   $7B
            LDA   $A7
            LDX   $A8
            STA   $78
            STX   $79
            JSR   L6495
            CLC
            ADC   $6C
            STA   $6C
            STA   $6A
            TXA
            ADC   $6D
            STA   $6D
            STA   $6B
            JMP   L6A90

L6B97       SEC
            LDA   $64
            SBC   $6C
            STA   $7A
            LDA   $65
            SBC   $6D
            STA   $7B
            LDA   $6A
            SEC
            SBC   $62
            TAX
            LDA   $6B
            SBC   $63
            TAY
            TXA
            SEC
            SBC   $7A
            STA   $7A
            TYA
            SBC   $7B
            STA   $7B
            LDA   $6C
            CLC
            ADC   $6A
            TAX
            LDA   $6D
            ADC   $6B
            JSR   L65F3
            SEC
            LDA   $60
            SBC   $68
            STA   $7A
            LDA   $61
            SBC   $69
            STA   $7B
            LDA   $78
            LDX   $79
            STA   $A7
            STX   $A8
            JSR   L6495
            CLC
            ADC   $68
            STA   $68
            TXA
            ADC   $69
            STA   $69
            SEC
            LDA   $64
            SBC   $6C
            STA   $7A
            LDA   $65
            SBC   $6D
            STA   $7B
            LDA   $A7
            LDX   $A8
            STA   $78
            STX   $79
            JSR   L6495
            CLC
            ADC   $6C
            STA   $6C
            EOR   #$FF
            STA   $6A
            TXA
            ADC   $6D
            STA   $6D
            EOR   #$FF
            STA   $6B
            INC   $6A
            BNE   L6C19
            INC   $6B
L6C19       JMP   L6A90

L6C1C       SEC
            LDA   $64
            SBC   $6C
            STA   $7A
            LDA   $65
            SBC   $6D
            STA   $7B
            LDA   $60
            SEC
            SBC   $68
            TAX
            LDA   $61
            SBC   $69
            TAY
            TXA
            SEC
            SBC   $7A
            STA   $7A
            TYA
            SBC   $7B
            STA   $7B
            LDA   $6C
            SEC
            SBC   $68
            TAX
            LDA   $6D
            SBC   $69
            JSR   L65F3
            SEC
            LDA   $64
            SBC   $6C
            STA   $7A
            LDA   $65
            SBC   $6D
            STA   $7B
            LDA   $78
            LDX   $79
            STA   $A7
            STX   $A8
            JSR   L6495
            CLC
            ADC   $6C
            STA   $6C
            STA   $68
            TXA
            ADC   $6D
            STA   $6D
            STA   $69
            SEC
            LDA   $62
            SBC   $6A
            STA   $7A
            LDA   $63
            SBC   $6B
            STA   $7B
            LDA   $A7
            LDX   $A8
            STA   $78
            STX   $79
            JSR   L6495
            CLC
            ADC   $6A
            STA   $6A
            TXA
            ADC   $6B
            STA   $6B
            JMP   L6A90

L6C97       SEC
            LDA   $64
            SBC   $6C
            STA   $7A
            LDA   $65
            SBC   $6D
            STA   $7B
            LDA   $68
            SEC
            SBC   $60
            TAX
            LDA   $69
            SBC   $61
            TAY
            TXA
            SEC
            SBC   $7A
            STA   $7A
            TYA
            SBC   $7B
            STA   $7B
            LDA   $6C
            CLC
            ADC   $68
            TAX
            LDA   $6D
            ADC   $69
            JSR   L65F3
            SEC
            LDA   $62
            SBC   $6A
            STA   $7A
            LDA   $63
            SBC   $6B
            STA   $7B
            LDA   $78
            LDX   $79
            STA   $A7
            STX   $A8
            JSR   L6495
            CLC
            ADC   $6A
            STA   $6A
            TXA
            ADC   $6B
            STA   $6B
            SEC
            LDA   $64
            SBC   $6C
            STA   $7A
            LDA   $65
            SBC   $6D
            STA   $7B
            LDA   $A7
            LDX   $A8
            STA   $78
            STX   $79
            JSR   L6495
            CLC
            ADC   $6C
            STA   $6C
            EOR   #$FF
            STA   $68
            TXA
            ADC   $6D
            STA   $6D
            EOR   #$FF
            STA   $69
            INC   $68
            BNE   L6D19
            INC   $69
L6D19       JMP   L6A90

L6D1C       INY
            LDA   ($9B),Y
            BNE   L6D24
            JMP   L70F3

L6D24       CMP   #$FF
            BEQ   L6D2D
            SEC
            SBC   #$01
            STA   ($9B),Y
L6D2D       LDX   #$1E
L6D2F       LDA   $7E,X
            PHA
            DEX
            BPL   L6D2F
            LDX   #$90
            JSR   L70F8
            JSR   L70F8
            JSR   L70F8
            INY
            LDA   ($9B),Y
            STA   $96
            INY
            LDA   ($9B),Y
            STA   $97
            INY
            LDA   ($9B),Y
            STA   $98
            INY
            LDA   ($9B),Y
            PHA
            INY
            LDA   ($9B),Y
            STA   $9B+1
            PLA
            STA   $9B
            LDA   $96
            JSR   L61C9
            STA   $60
            STX   $61
            LDA   $97
            JSR   L61C9
            STA   $64
            STX   $65
            LDA   $98
            JSR   L61C9
            STA   $68
            STX   $69
            LDA   $96
            JSR   L61CC
            STA   $62
            STX   $63
            LDA   $97
            JSR   L61CC
            STA   $66
            STX   $67
            LDA   $98
            JSR   L61CC
            STA   $6A
            STX   $6B
            LDX   #$90
            LDY   #$6A
            LDA   #$AB
            JSR   L6476
            LDX   #$90
            LDY   #$68
            LDA   #$AF
            JSR   L6476
            LDX   #$94
            LDY   #$68
            LDA   #$AD
            JSR   L6476
            SEC
            LDA   $AB
            SBC   $AD
            STA   $90
            LDA   $AC
            SBC   $AE
            STA   $91
            LDX   #$94
            LDY   #$6A
            LDA   #$AD
            JSR   L6476
            CLC
            LDA   $AD
            ADC   $AF
            STA   $94
            LDA   $AE
            ADC   $B0
            STA   $95
            LDX   #$92
            LDY   #$62
            LDA   #$AB
            JSR   L6476
            LDX   #$92
            LDY   #$60
            LDA   #$AF
            JSR   L6476
            LDX   #$94
            LDY   #$60
            LDA   #$AD
            JSR   L6476
            CLC
            LDA   $AB
            ADC   $AD
            STA   $92
            LDA   $AC
            ADC   $AE
            STA   $93
            LDX   #$94
            LDY   #$62
            LDA   #$AD
            JSR   L6476
            SEC
            LDA   $AD
            SBC   $AF
            STA   $94
            LDA   $AE
            SBC   $B0
            STA   $95
            LDX   #$90
            LDY   #$66
            LDA   #$AB
            JSR   L6476
            LDX   #$90
            LDY   #$64
            LDA   #$AF
            JSR   L6476
            LDX   #$92
            LDY   #$64
            LDA   #$AD
            JSR   L6476
            CLC
            LDA   $AB
            ADC   $AD
            STA   $90
            LDA   $AC
            ADC   $AE
            STA   $91
            LDX   #$92
            LDY   #$66
            LDA   #$AD
            JSR   L6476
            SEC
            LDA   $AD
            SBC   $AF
            STA   $92
            LDA   $AE
            SBC   $B0
            STA   $93
            LDA   #$00
            SEC
            SBC   $68
            STA   $74
            LDA   #$00
            SBC   $69
            STA   $75
            LDX   #$6A
            LDY   #$7E
            LDA   #$6C
            JSR   L6476
            LDX   #$74
            LDY   #$8A
            LDA   #$72
            JSR   L6476
            CLC
            LDA   $6C
            ADC   $72
            STA   $6C
            LDA   $6D
            ADC   $73
            STA   $6D
            LDX   #$6A
            LDY   #$80
            LDA   #$6E
            JSR   L6476
            LDX   #$74
            LDY   #$8C
            LDA   #$72
            JSR   L6476
            CLC
            LDA   $6E
            ADC   $72
            STA   $6E
            LDA   $6F
            ADC   $73
            STA   $6F
            LDX   #$6A
            LDY   #$82
            LDA   #$70
            JSR   L6476
            LDX   #$74
            LDY   #$8E
            LDA   #$72
            JSR   L6476
            CLC
            LDA   $70
            ADC   $72
            STA   $70
            LDA   $71
            ADC   $73
            STA   $71
            LDX   #$68
            LDY   #$7E
            LDA   #$72
            JSR   L6476
            LDX   #$6A
            LDY   #$8A
            LDA   #$8A
            JSR   L6476
            CLC
            LDA   $8A
            ADC   $72
            STA   $8A
            LDA   $8B
            ADC   $73
            STA   $8B
            LDA   $6C
            LDX   $6D
            STA   $7E
            STX   $7F
            LDX   #$68
            LDY   #$80
            LDA   #$72
            JSR   L6476
            LDX   #$6A
            LDY   #$8C
            LDA   #$8C
            JSR   L6476
            CLC
            LDA   $8C
            ADC   $72
            STA   $8C
            LDA   $8D
            ADC   $73
            STA   $8D
            LDA   $6E
            LDX   $6F
            STA   $80
            STX   $81
            LDX   #$68
            LDY   #$82
            LDA   #$72
            JSR   L6476
            LDX   #$6A
            LDY   #$8E
            LDA   #$8E
            JSR   L6476
            CLC
            LDA   $8E
            ADC   $72
            STA   $8E
            LDA   $8F
            ADC   $73
            STA   $8F
            LDA   $70
            LDX   $71
            STA   $82
            STX   $83
            LDA   #$00
            SEC
            SBC   $60
            STA   $74
            LDA   #$00
            SBC   $61
            STA   $75
            LDX   #$62
            LDY   #$84
            LDA   #$6C
            JSR   L6476
            LDX   #$60
            LDY   #$8A
            LDA   #$72
            JSR   L6476
            CLC
            LDA   $6C
            ADC   $72
            STA   $6C
            LDA   $6D
            ADC   $73
            STA   $6D
            LDX   #$62
            LDY   #$86
            LDA   #$6E
            JSR   L6476
            LDX   #$60
            LDY   #$8C
            LDA   #$72
            JSR   L6476
            CLC
            LDA   $6E
            ADC   $72
            STA   $6E
            LDA   $6F
            ADC   $73
            STA   $6F
            LDX   #$62
            LDY   #$88
            LDA   #$70
            JSR   L6476
            LDX   #$60
            LDY   #$8E
            LDA   #$72
            JSR   L6476
            CLC
            LDA   $70
            ADC   $72
            STA   $70
            LDA   $71
            ADC   $73
            STA   $71
            LDX   #$74
            LDY   #$84
            LDA   #$72
            JSR   L6476
            LDX   #$62
            LDY   #$8A
            LDA   #$8A
            JSR   L6476
            CLC
            LDA   $8A
            ADC   $72
            STA   $8A
            LDA   $8B
            ADC   $73
            STA   $8B
            LDA   $6C
            LDX   $6D
            STA   $84
            STX   $85
            LDX   #$74
            LDY   #$86
            LDA   #$72
            JSR   L6476
            LDX   #$62
            LDY   #$8C
            LDA   #$8C
            JSR   L6476
            CLC
            LDA   $8C
            ADC   $72
            STA   $8C
            LDA   $8D
            ADC   $73
            STA   $8D
            LDA   $6E
            LDX   $6F
            STA   $86
            STX   $87
            LDX   #$74
            LDY   #$88
            LDA   #$72
            JSR   L6476
            LDX   #$62
            LDY   #$8E
            LDA   #$8E
            JSR   L6476
            CLC
            LDA   $8E
            ADC   $72
            STA   $8E
            LDA   $8F
            ADC   $73
            STA   $8F
            LDA   $70
            LDX   $71
            STA   $88
            STX   $89
            LDA   #$00
            SEC
            SBC   $64
            STA   $74
            LDA   #$00
            SBC   $65
            STA   $75
            LDX   #$66
            LDY   #$7E
            LDA   #$6C
            JSR   L6476
            LDX   #$64
            LDY   #$84
            LDA   #$72
            JSR   L6476
            CLC
            LDA   $6C
            ADC   $72
            STA   $6C
            LDA   $6D
            ADC   $73
            STA   $6D
            LDX   #$66
            LDY   #$80
            LDA   #$6E
            JSR   L6476
            LDX   #$64
            LDY   #$86
            LDA   #$72
            JSR   L6476
            CLC
            LDA   $6E
            ADC   $72
            STA   $6E
            LDA   $6F
            ADC   $73
            STA   $6F
            LDX   #$66
            LDY   #$82
            LDA   #$70
            JSR   L6476
            LDX   #$64
            LDY   #$88
            LDA   #$72
            JSR   L6476
            CLC
            LDA   $70
            ADC   $72
            STA   $70
            LDA   $71
            ADC   $73
            STA   $71
            LDX   #$74
            LDY   #$7E
            LDA   #$72
            JSR   L6476
            LDX   #$66
            LDY   #$84
            LDA   #$84
            JSR   L6476
            CLC
            LDA   $84
            ADC   $72
            STA   $84
            LDA   $85
            ADC   $73
            STA   $85
            LDA   $6C
            LDX   $6D
            STA   $7E
            STX   $7F
            LDX   #$74
            LDY   #$80
            LDA   #$72
            JSR   L6476
            LDX   #$66
            LDY   #$86
            LDA   #$86
            JSR   L6476
            CLC
            LDA   $86
            ADC   $72
            STA   $86
            LDA   $87
            ADC   $73
            STA   $87
            LDA   $6E
            LDX   $6F
            STA   $80
            STX   $81
            LDX   #$74
            LDY   #$82
            LDA   #$72
            JSR   L6476
            LDX   #$66
            LDY   #$88
            LDA   #$88
            JSR   L6476
            CLC
            LDA   $88
            ADC   $72
            STA   $88
            LDA   $89
            ADC   $73
            STA   $89
            LDA   $70
            LDX   $71
            STA   $82
            STX   $83
            JSR   L6118
            LDX   #$E1
L70ED       PLA
            STA   $9D,X
            INX
            BNE   L70ED
L70F3       LDA   #$0D
            JMP   L63CC

L70F8       SEC
            LDA   $00,X
            INY
            SBC   ($9B),Y
            STA   $00,X
            INX
            LDA   $00,X
            INY
            SBC   ($9B),Y
            STA   $00,X
            INX
            RTS

L710A       INY
            LDA   ($9B),Y
            STA   $B3
            INY
            LDA   ($9B),Y
            ROR
            ROR   $B3
            LDA   #$00
            ROR
            STA   $A4
            INY
            LDA   ($9B),Y
            STA   $B4
            INY
            LDA   ($9B),Y
            STA   $B5
            INY
            LDA   ($9B),Y
            ROR
            ROR   $B5
            LDA   #$00
            ROR
            STA   $A3
            INY
            LDA   ($9B),Y
            STA   $B6
            JSR   L7CF6
            LDA   #$07
            JMP   L63CC

L713C       BRK   $00
L713E       BRK   $C8
            LDA   ($9B),Y
            STA   L713C+1
            INY
            LDA   ($9B),Y
            STA   L713C
            INY
            LDA   ($9B),Y
            STA   L713E
            LDA   #$04
            JMP   L63CC

L7156       INY
            LDA   ($9B),Y
            JSR   L71B4
            STA   $A4
            STX   $B3
            INY
            LDA   ($9B),Y
            CLC
            ADC   L713E
            STA   $B4
            INY
            LDA   ($9B),Y
            JSR   L71B4
            STA   $A3
            STX   $B5
            INY
            LDA   ($9B),Y
            CLC
            ADC   L713E
            STA   $B6
            JSR   L7CF6
            LDA   #$05
            JMP   L63CC

L7184       INY
            LDA   ($9B),Y
            TAX
            INY
            LDA   ($9B),Y
            JSR   L71CC
            STA   $A4
            INY
            LDA   ($9B),Y
            TAY
            JSR   L7569
            LDA   #$04
            JMP   L63CC

L719C       INY
            LDA   ($9B),Y
            JSR   L71B4
            STA   $A4
            INY
            LDA   ($9B),Y
            CLC
            ADC   L713E
            TAY
            JSR   L7569
            LDA   #$03
            JMP   L63CC

L71B4       CLC
            BMI   L71C3
            ADC   L713C+1
            TAX
            LDA   #$00
            ADC   L713C
            JMP   L71CC

L71C3       ADC   L713C+1
            TAX
            LDA   #$FF
            ADC   L713C
L71CC       ROR
            TXA
            ROR
            TAX
            LDA   #$00
            ROR
            RTS

L71D4       INY
            LDA   ($9B),Y
            TAX
            INY
            LDA   ($9B),Y
            BEQ   L71E2
            LDA   #$03
            JMP   L63CC

L71E2       TXA
            CLC
            ADC   #$03
            JMP   L63CC

L71E9       INY
            LDA   ($9B),Y
            TAX
            BEQ   L7202
L71EF       LDA   #$9D
            STA   $A4
            LDA   #$71
            STA   $A3
L71F7       INC   $A3
            BNE   L71F7
            INC   $A4
            BNE   L71F7
            DEX
            BNE   L71EF
L7202       JMP   L63CA

L7205       LDX   #$05
L7207       LDA   $AB,X
L7209       STA   L7FC5,X
            DEX
            BPL   L7207
            LDA   L7209+1
            CLC
            ADC   #$06
            STA   L7209+1
            BCC   L721D
            INC   L7209+2
L721D       RTS

L721E       INY
            LDA   ($9B),Y
            STA   L7209+1
            INY
            LDA   ($9B),Y
            STA   L7209+2
            LDA   #$03
            JMP   L63CC

L722F       INY
            LDA   ($9B),Y
            STA   L621F
            JMP   L63CA

*-----------------------------------
* 
*-----------------------------------

L7238       HEX   3D3935312D2925213C3834302C282420
            HEX   3F3B37332F2B27233E3A36322E2A2622
L7258       HEX   A828A828800080008000800000000000
            HEX   D0D0D0D0D050D050D050D050A828A828

L7278       HEX   14141414151515161616161717171818
            HEX   18181919191A1A1A1A1B1B1B1C1C1C1C
            HEX   1D1D1D1E1E1E1E1F1F1F202020202121
            HEX   21222222222323232424242425252526
            HEX   26262627272700000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000101
            HEX   01020202020303030404040405050506
            HEX   060606070707080808080909090A0A0A
            HEX   0A0B0B0B0C0C0C0C0D0D0D0E0E0E0E0F
            HEX   0F0F1010101011111112121212131313

L7378       HEX   030C30C0061860030C30C0061860030C
            HEX   30C0061860030C30C0061860030C30C0
            HEX   061860030C30C0061860030C30C00618
            HEX   60030C30C0061860030C30C006186003
            HEX   0C30C006186000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000030C30C00618
            HEX   60030C30C0061860030C30C006186003
            HEX   0C30C0061860030C30C0061860030C30
            HEX   C0061860030C30C0061860030C30C006
            HEX   1860030C30C0061860030C30C0061860

*-----------------------------------
* 
*-----------------------------------

L7478       JSR   L74E6
            JMP   L63CA

L747E       LDX   #$00
L7480       STA   $2000,X
            STA   $2100,X
            STA   $2200,X
            STA   $2300,X
            STA   $2400,X
            STA   $2500,X
            STA   $2600,X
            STA   $2700,X
            STA   $2800,X
            STA   $2900,X
            STA   $2A00,X
            STA   $2B00,X
            STA   $2C00,X
            STA   $2D00,X
            STA   $2E00,X
            STA   $2F00,X
            STA   $3000,X
            STA   $3100,X
            STA   $3200,X
            STA   $3300,X
            STA   $3400,X
            STA   $3500,X
            STA   $3600,X
            STA   $3700,X
            STA   $3800,X
            STA   $3900,X
            STA   $3A00,X
            STA   $3B00,X
            STA   $3C00,X
            STA   $3D00,X
            STA   $3E00,X
            STA   $3F00,X
            INX
            INX
            INX
            BNE   L7480
            RTS

L74E6       INY
            LDA   ($9B),Y
            BEQ   L747E
            CMP   #$02
            BMI   L74F9
            BEQ   L74F5
            LDA   #$FF
            BNE   L74FD
L74F5       LDA   #$FF
            BNE   L747E
L74F9       LDA   #$00
            BEQ   L74FD
L74FD       LDX   #$00
L74FF       STA   $4000,X
            STA   $4100,X
            STA   $4200,X
            STA   $4300,X
            STA   $4400,X
            STA   $4500,X
            STA   $4600,X
            STA   $4700,X
            STA   $4800,X
            STA   $4900,X
            STA   $4A00,X
            STA   $4B00,X
            STA   $4C00,X
            STA   $4D00,X
            STA   $4E00,X
            STA   $4F00,X
            STA   $5000,X
            STA   $5100,X
            STA   $5200,X
            STA   $5300,X
            STA   $5400,X
            STA   $5500,X
            STA   $5600,X
            STA   $5700,X
            STA   $5800,X
            STA   $5900,X
            STA   $5A00,X
            STA   $5B00,X
            STA   $5C00,X
            STA   $5D00,X
            STA   $5E00,X
            STA   $5F00,X
            INX
            INX
            INX
            BNE   L74FF
            RTS

L7565       LDA   #$00
            STA   $A4
L7569       JSR   L7D64
L756C       ORA   ($99),Y
            STA   ($99),Y
            RTS
L7571       JMP   L7574

L7574       TYA
            LSR
            STA   $A4
            AND   #$18
            STA   $A3
            TYA
            AND   #$07
            ORA   $A3
            TAY
            LDA   L7238,Y
            CLC
            ADC   $BB
            STA   $9A
            LDA   $A4
            LSR
            LSR
            TAY
            LDA   L7258,Y
            CLC
            ADC   L7278,X
            TAY
            LDA   L7378,X
            BMI   L75A1
L759C       ORA   ($99),Y
            STA   ($99),Y
            RTS

L75A1       ORA   ($99),Y
            STA   ($99),Y
            INY
            LDA   #$01
L75A8       ORA   ($99),Y
            STA   ($99),Y
            RTS
L75AD       JMP   L75B0

L75B0       LDA   $B5
            SEC
            SBC   $B3
            BMI   L75E5
            BVS   L75E7
L75B9       STA   $B9
            LDA   $B6
            SEC
            SBC   $B4
L75C0       BMI   L75D1
            BVS   L75D3
L75C4       STA   $BA
            SEC
            SBC   $B9
            BCS   L75CE
            JMP   L75FE
L75CE       JMP   L7A88

L75D1       BVS   L75C4
L75D3       EOR   #$FF
            CLC
            ADC   #$01
            STA   $BA
            SEC
            SBC   $B9
            BCC   L75E2
            JMP   L7B31
L75E2       JMP   L7843

L75E5       BVS   L75B9
L75E7       LDX   $B5
            STX   $B3
            EOR   #$FF
            CLC
            ADC   #$01
            STA   $B9
            LDA   $B4
            LDX   $B6
            SEC
            SBC   $B6
            STX   $B4
            JMP   L75C0

L75FE       LDA   #$00
            SEC
            SBC   $B9
            SEC
            ROR
            STA   $B8
            LDX   $B3
            LDY   $B4
            TYA
            LSR
            STA   $A4
            AND   #$18
            STA   $A3
            TYA
            AND   #$07
            ORA   $A3
            TAY
            LDA   L7238,Y
            CLC
            ADC   $BB
            STA   $9A
            LDA   $A4
            LSR
            LSR
            TAY
            LDA   L7258,Y
            CLC
            ADC   L7278,X
            TAY
            LDA   L7378,X
            STA   $B7
            LDX   $B9
            INX
            AND   #$7F
            CMP   #$18
            BMI   L7658
            BEQ   L7653
            CMP   #$40
            BMI   L7649
            BEQ   L764E
            JSR   L7805
            BNE   L766B
L7649       JSR   L76F7
            BNE   L766B
L764E       JSR   L7738
            BNE   L766B
L7653       JSR   L77BD
            BNE   L766B
L7658       CMP   #$06
            BMI   L7663
            BEQ   L7668
            JSR   L7683
            BNE   L766B
L7663       JSR   L7670
            BNE   L766B
L7668       JSR   L774C
L766B       ORA   ($99),Y
            STA   ($99),Y
            RTS

L7670       LDA   $B8
L7672       DEX
            BEQ   L768F
            CLC
            ADC   $BA
            BCS   L7698
            DEX
            BEQ   L7692
            ADC   $BA
            BCS   L76B2
            BNE   L76D4
L7683       DEX
            BEQ   L7695
            LDA   $B8
            CLC
            ADC   $BA
            BCS   L76BA
            BNE   L76EA
L768F       LDA   #$03
            RTS

L7692       LDA   #$0F
            RTS

L7695       LDA   #$0C
            RTS

L7698       SBC   $B9
            STA   $B8
            LDA   #$03
L769E       ORA   ($99),Y
            STA   ($99),Y
            LDA   $9A
            CLC
            SBC   #$03
            STA   $9A
            CMP   $BC
            BCS   L7683
            JSR   L7821
            BCS   L7683
L76B2       SBC   $B9
            STA   $B8
            LDA   #$0F
            BNE   L76C0
L76BA       SBC   $B9
            STA   $B8
            LDA   #$0C
L76C0       ORA   ($99),Y
            STA   ($99),Y
            LDA   $9A
            CLC
            SBC   #$03
            STA   $9A
            CMP   $BC
            BCS   L76F7
            JSR   L7821
            BCS   L76F7
L76D4       DEX
            BEQ   L76E4
            ADC   $BA
            BCS   L7720
            STA   $B8
            LDA   #$7F
            BPL   L7705
L76E1       LDA   #$3C
            RTS

L76E4       LDA   #$3F
            RTS

L76E7       LDA   #$30
            RTS

L76EA       DEX
            BEQ   L76E1
            ADC   $BA
            BCS   L7718
            STA   $B8
            LDA   #$7C
            BPL   L7705
L76F7       DEX
            BEQ   L76E7
            LDA   $B8
            CLC
            ADC   $BA
            BCS   L7710
            STA   $B8
            LDA   #$70
L7705       ORA   ($99),Y
            STA   ($99),Y
            INY
            DEX
            BNE   L773D
            LDA   #$01
            RTS

L7710       SBC   $B9
            STA   $B8
            LDA   #$30
            BNE   L7726
L7718       SBC   $B9
            STA   $B8
            LDA   #$3C
            BNE   L7726
L7720       SBC   $B9
            STA   $B8
            LDA   #$3F
L7726       ORA   ($99),Y
            STA   ($99),Y
            LDA   $9A
            CLC
            SBC   #$03
            STA   $9A
            CMP   $BC
            BCS   L7738
            JSR   L7821
L7738       LDA   #$40
            CLC
            BNE   L7705
L773D       LDA   $B8
            ADC   $BA
            BCS   L775E
            DEX
            BEQ   L7758
            ADC   $BA
            BCS   L7778
            BNE   L779A
L774C       DEX
            BEQ   L775B
            LDA   $B8
            CLC
            ADC   $BA
            BCS   L7780
            BNE   L77B0
L7758       LDA   #$07
            RTS

L775B       LDA   #$06
            RTS

L775E       SBC   $B9
            STA   $B8
            LDA   #$01
L7764       ORA   ($99),Y
            STA   ($99),Y
            LDA   $9A
            CLC
            SBC   #$03
            STA   $9A
            CMP   $BC
            BCS   L774C
            JSR   L7821
            BCS   L774C
L7778       SBC   $B9
            STA   $B8
            LDA   #$07
            BNE   L7786
L7780       SBC   $B9
            STA   $B8
            LDA   #$06
L7786       ORA   ($99),Y
            STA   ($99),Y
            LDA   $9A
            CLC
            SBC   #$03
            STA   $9A
            CMP   $BC
            BCS   L77BD
            JSR   L7821
            BCS   L77BD
L779A       DEX
            BEQ   L77AA
            ADC   $BA
            BCS   L77ED
            STA   $B8
            LDA   #$7F
            BPL   L77CB
L77A7       LDA   #$1E
            RTS

L77AA       LDA   #$1F
            RTS

L77AD       LDA   #$18
            RTS

L77B0       DEX
            BEQ   L77A7
            ADC   $BA
            BCS   L77E5
            STA   $B8
            LDA   #$7E
            BPL   L77CB
L77BD       DEX
            BEQ   L77AD
            LDA   $B8
            CLC
            ADC   $BA
            BCS   L77DD
            STA   $B8
            LDA   #$78
L77CB       ORA   ($99),Y
            STA   ($99),Y
            INY
            DEX
            BEQ   L7809
            LDA   $B8
            CLC
            ADC   $BA
            BCS   L780C
            JMP   L7672

L77DD       SBC   $B9
            STA   $B8
            LDA   #$18
            BNE   L77F3
L77E5       SBC   $B9
            STA   $B8
            LDA   #$1E
            BNE   L77F3
L77ED       SBC   $B9
            STA   $B8
            LDA   #$1F
L77F3       ORA   ($99),Y
            STA   ($99),Y
            LDA   $9A
            CLC
            SBC   #$03
            STA   $9A
            CMP   $BC
            BCS   L7805
            JSR   L7821
L7805       LDA   #$60
            BNE   L77CB
L7809       PLA
            PLA
            RTS

L780C       SBC   $B9
            STA   $B8
            LDA   $9A
            CLC
            SBC   #$03
            STA   $9A
            CMP   $BC
            BCS   L781E
            JSR   L7821
L781E       JMP   L7670

L7821       CMP   #$1C
            BEQ   L7832
            CLC
            TYA
L7827       ADC   #$80
            TAY
            LDA   $9A
            ADC   #$1F
            STA   $9A
            SEC
            RTS

L7832       TYA
            CMP   #$80
            CLC
            BPL   L7827
            ADC   #$58
            TAY
            LDA   $9A
            ADC   #$23
            STA   $9A
            SEC
            RTS

L7843       LDA   #$00
            SEC
            SBC   $B9
            SEC
            ROR
            STA   $B8
            LDX   $B3
            LDY   $B4
            TYA
            LSR
            STA   $A4
            AND   #$18
            STA   $A3
            TYA
            AND   #$07
            ORA   $A3
            TAY
            LDA   L7238,Y
            CLC
            ADC   $BB
            STA   $9A
            LDA   $A4
            LSR
            LSR
            TAY
            LDA   L7258,Y
            CLC
            ADC   L7278,X
            TAY
            LDA   L7378,X
            STA   $B7
            LDX   $B9
            INX
            AND   #$7F
            CMP   #$18
            BMI   L789D
            BEQ   L7898
            CMP   #$40
            BMI   L788E
            BEQ   L7893
            JSR   L7A4A
            BNE   L78B0
L788E       JSR   L793C
            BNE   L78B0
L7893       JSR   L797D
            BNE   L78B0
L7898       JSR   L7A02
            BNE   L78B0
L789D       CMP   #$06
            BMI   L78A8
            BEQ   L78AD
            JSR   L78C8
            BNE   L78B0
L78A8       JSR   L78B5
            BNE   L78B0
L78AD       JSR   L7991
L78B0       ORA   ($99),Y
            STA   ($99),Y
            RTS

L78B5       LDA   $B8
L78B7       DEX
            BEQ   L78D4
            CLC
            ADC   $BA
            BCS   L78DD
            DEX
            BEQ   L78D7
            ADC   $BA
            BCS   L78F7
            BNE   L7919
L78C8       DEX
            BEQ   L78DA
            LDA   $B8
            CLC
            ADC   $BA
            BCS   L78FF
            BNE   L792F
L78D4       LDA   #$03
            RTS

L78D7       LDA   #$0F
            RTS

L78DA       LDA   #$0C
            RTS

L78DD       SBC   $B9
            STA   $B8
            LDA   #$03
L78E3       ORA   ($99),Y
            STA   ($99),Y
            LDA   $9A
            CLC
            ADC   #$04
            STA   $9A
            CMP   $BD
            BCC   L78C8
            JSR   L7A66
            BCS   L78C8
L78F7       SBC   $B9
            STA   $B8
            LDA   #$0F
            BNE   L7905
L78FF       SBC   $B9
            STA   $B8
            LDA   #$0C
L7905       ORA   ($99),Y
            STA   ($99),Y
            LDA   $9A
            CLC
            ADC   #$04
            STA   $9A
            CMP   $BD
            BCC   L793C
            JSR   L7A66
            BCS   L793C
L7919       DEX
            BEQ   L7929
            ADC   $BA
            BCS   L7965
            STA   $B8
            LDA   #$7F
            BPL   L794A
L7926       LDA   #$3C
            RTS

L7929       LDA   #$3F
            RTS

L792C       LDA   #$30
            RTS

L792F       DEX
            BEQ   L7926
            ADC   $BA
            BCS   L795D
            STA   $B8
            LDA   #$7C
            BPL   L794A
L793C       DEX
            BEQ   L792C
            LDA   $B8
            CLC
            ADC   $BA
            BCS   L7955
            STA   $B8
            LDA   #$70
L794A       ORA   ($99),Y
            STA   ($99),Y
            INY
            DEX
            BNE   L7982
            LDA   #$01
            RTS

L7955       SBC   $B9
            STA   $B8
            LDA   #$30
            BNE   L796B
L795D       SBC   $B9
            STA   $B8
            LDA   #$3C
            BNE   L796B
L7965       SBC   $B9
            STA   $B8
            LDA   #$3F
L796B       ORA   ($99),Y
            STA   ($99),Y
            LDA   $9A
            CLC
            ADC   #$04
            STA   $9A
            CMP   $BD
            BCC   L797D
            JSR   L7A66
L797D       LDA   #$40
            CLC
            BNE   L794A
L7982       LDA   $B8
            ADC   $BA
            BCS   L79A3
            DEX
            BEQ   L799D
            ADC   $BA
            BCS   L79BD
            BNE   L79DF
L7991       DEX
            BEQ   L79A0
            LDA   $B8
            CLC
            ADC   $BA
            BCS   L79C5
            BNE   L79F5
L799D       LDA   #$07
            RTS

L79A0       LDA   #$06
            RTS

L79A3       SBC   $B9
            STA   $B8
            LDA   #$01
L79A9       ORA   ($99),Y
            STA   ($99),Y
            LDA   $9A
            CLC
            ADC   #$04
            STA   $9A
            CMP   $BD
            BCC   L7991
            JSR   L7A66
            BCS   L7991
L79BD       SBC   $B9
            STA   $B8
            LDA   #$07
            BNE   L79CB
L79C5       SBC   $B9
            STA   $B8
            LDA   #$06
L79CB       ORA   ($99),Y
            STA   ($99),Y
            LDA   $9A
            CLC
            ADC   #$04
            STA   $9A
            CMP   $BD
            BCC   L7A02
            JSR   L7A66
            BCS   L7A02
L79DF       DEX
            BEQ   L79EF
            ADC   $BA
            BCS   L7A32
            STA   $B8
            LDA   #$7F
            BPL   L7A10
L79EC       LDA   #$1E
            RTS

L79EF       LDA   #$1F
            RTS

L79F2       LDA   #$18
            RTS

L79F5       DEX
            BEQ   L79EC
            ADC   $BA
            BCS   L7A2A
            STA   $B8
            LDA   #$7E
            BPL   L7A10
L7A02       DEX
            BEQ   L79F2
            LDA   $B8
            CLC
            ADC   $BA
            BCS   L7A22
            STA   $B8
            LDA   #$78
L7A10       ORA   ($99),Y
            STA   ($99),Y
            INY
            DEX
            BEQ   L7A4E
            LDA   $B8
            CLC
            ADC   $BA
            BCS   L7A51
            JMP   L78B7

L7A22       SBC   $B9
            STA   $B8
            LDA   #$18
            BNE   L7A38
L7A2A       SBC   $B9
            STA   $B8
            LDA   #$1E
            BNE   L7A38
L7A32       SBC   $B9
            STA   $B8
            LDA   #$1F
L7A38       ORA   ($99),Y
            STA   ($99),Y
            LDA   $9A
            CLC
            ADC   #$04
            STA   $9A
            CMP   $BD
            BCC   L7A4A
            JSR   L7A66
L7A4A       LDA   #$60
            BNE   L7A10
L7A4E       PLA
            PLA
            RTS

L7A51       SBC   $B9
            STA   $B8
            LDA   $9A
            CLC
            ADC   #$04
            STA   $9A
            CMP   $BD
            BCC   L7A63
            JSR   L7A66
L7A63       JMP   L78B5

L7A66       CMP   #$43
            BEQ   L7A77
            SEC
            TYA
L7A6C       SBC   #$80
            TAY
            LDA   $9A
            SBC   #$1F
            STA   $9A
            SEC
            RTS

L7A77       TYA
            CMP   #$80
            SEC
            BMI   L7A6C
            SBC   #$58
            TAY
            LDA   $9A
            SBC   #$23
            STA   $9A
            SEC
            RTS

L7A88       LDA   $BA
            CLC
            ROR
            STA   $B8
            LDX   $B3
            LDY   $B4
            TYA
            LSR
            STA   $A4
            AND   #$18
            STA   $A3
            TYA
            AND   #$07
            ORA   $A3
            TAY
            LDA   L7238,Y
            CLC
            ADC   $BB
            STA   $9A
            LDA   $A4
            LSR
            LSR
            TAY
            LDA   L7258,Y
            CLC
            ADC   L7278,X
            TAY
            LDA   L7378,X
            STA   $B7
            LDX   $BA
            INX
L7ABD       LDA   $B7
            BMI   L7AF3
L7AC1       ORA   ($99),Y
            STA   ($99),Y
            DEX
            BEQ   L7AF2
L7AC8       LDA   $9A
            SEC
            SBC   #$04
L7ACD       CMP   #$20
            BCC   L7B08
L7AD1       STA   $9A
            LDA   $B8
            SEC
            SBC   $B9
            STA   $B8
            BCS   L7ABD
            ADC   $BA
            STA   $B8
            CLC
            LDA   $B7
            BMI   L7B2C
            ROL
            ROL
            BMI   L7AFF
L7AE9       STA   $B7
L7AEB       ORA   ($99),Y
            STA   ($99),Y
            DEX
            BNE   L7AC8
L7AF2       RTS

L7AF3       INY
            LDA   #$01
L7AF6       ORA   ($99),Y
            STA   ($99),Y
            DEY
            LDA   #$C0
            BMI   L7AC1
L7AFF       CMP   #$80
            BNE   L7B26
            INY
            LDA   #$03
            BPL   L7AE9
L7B08       CMP   #$1C
            BEQ   L7B17
            CLC
            TYA
L7B0E       ADC   #$80
            TAY
            LDA   $9A
            ADC   #$1B
            BCC   L7AD1
L7B17       TYA
            CMP   #$80
            CLC
            BPL   L7B0E
            ADC   #$58
            TAY
            LDA   $9A
            ADC   #$1F
            BCC   L7AD1
L7B26       LDA   #$C0
            STA   $B7
            BMI   L7AF3
L7B2C       INY
            LDA   #$06
            BNE   L7AE9
L7B31       LDA   $BA
            CLC
            ROR
            STA   $B8
            LDX   $B3
            LDY   $B4
            TYA
            LSR
            STA   $A4
            AND   #$18
            STA   $A3
            TYA
            AND   #$07
            ORA   $A3
            TAY
            LDA   L7238,Y
            CLC
            ADC   $BB
            STA   $9A
            LDA   $A4
            LSR
            LSR
            TAY
            LDA   L7258,Y
            CLC
            ADC   L7278,X
            TAY
            LDA   L7378,X
            STA   $B7
            LDX   $BA
            INX
L7B66       LDA   $B7
            BMI   L7B9C
L7B6A       ORA   ($99),Y
            STA   ($99),Y
            DEX
            BEQ   L7B9B
L7B71       LDA   $9A
            CLC
            ADC   #$04
L7B76       CMP   #$40
            BCS   L7BB1
L7B7A       STA   $9A
            LDA   $B8
            SEC
            SBC   $B9
            STA   $B8
            BCS   L7B66
            ADC   $BA
            STA   $B8
            CLC
            LDA   $B7
            BMI   L7BD5
            ROL
            ROL
            BMI   L7BA8
L7B92       STA   $B7
L7B94       ORA   ($99),Y
            STA   ($99),Y
            DEX
            BNE   L7B71
L7B9B       RTS

L7B9C       INY
            LDA   #$01
L7B9F       ORA   ($99),Y
            STA   ($99),Y
            DEY
            LDA   #$C0
            BMI   L7B6A
L7BA8       CMP   #$80
            BNE   L7BCF
            INY
            LDA   #$03
            BPL   L7B92
L7BB1       CMP   #$43
            BEQ   L7BC0
            SEC
            TYA
L7BB7       SBC   #$80
            TAY
            LDA   $9A
            SBC   #$1B
            BCS   L7B7A
L7BC0       TYA
            CMP   #$80
            SEC
            BMI   L7BB7
            SBC   #$58
            TAY
            LDA   $9A
            SBC   #$1F
            BCS   L7B7A
L7BCF       LDA   #$C0
            STA   $B7
            BMI   L7B9C
L7BD5       INY
            LDA   #$06
            BNE   L7B92
            STA   $A9
            EOR   #$FF
            AND   ($99),Y
L7BE0       ORA   #$80
            STA   $A3
            TYA
            ROR
            BCS   L7BF1
            LDA   $A9
            AND   $BE
            ORA   $A3
            STA   ($99),Y
            RTS

L7BF1       LDA   $A9
            AND   $BF
            ORA   $A3
            STA   ($99),Y
            RTS

L7BFA       INY
            LDA   ($9B),Y
            BEQ   L7C01
            LDA   #$20
L7C01       STA   $BB
            CLC
            ADC   #$20
            STA   L7ACD+1
            STA   $BC
            SEC
            SBC   #$04
            STA   L7821+1
            STA   L7B08+1
            CLC
            ADC   #$24
            STA   L7B76+1
            STA   $BD
            CLC
            ADC   #$03
            STA   L7A66+1
            STA   L7BB1+1
            JMP   L63CA

L7C28       LDA   $7D
            BEQ   L7C2F
            JMP   L60C1

L7C2F       INY
            LDA   ($9B),Y
            BEQ   L7C5A
            CMP   #$01
            BEQ   L7C54
            CMP   #$02
            BEQ   L7C73
            CMP   #$03
            BNE   L7C46
            LDA   #$55
            LDX   #$2A
            BNE   L7C4A
L7C46       LDA   #$2A
            LDX   #$55
L7C4A       STA   $BE
            STX   $BF
            LDA   #$09
            LDX   #$80
            BNE   L7C7F
L7C54       LDA   #$2A
            LDX   #$55
            BNE   L7C77
L7C5A       LDX   #$00
            LDA   #$11
            JSR   L7CA1
            INX
            LDA   #$99
            JSR   L7CA1
            INX
            LDA   #$91
            JSR   L7CA1
            INX
            LDA   #$99
            JMP   L7C9B

L7C73       LDA   #$55
            LDX   #$2A
L7C77       STA   $BE
            STX   $BF
            LDA   #$29
            LDX   #$7F
L7C7F       STA   L7BE0
            STX   L7BE0+1
            LDX   #$00
            LDA   #$20
            JSR   L7CA1
            INX
            LDA   #$DA
            JSR   L7CA1
            INX
            LDA   #$7B
            JSR   L7CA1
            INX
            LDA   #$EA
L7C9B       JSR   L7CA1
            JMP   L63CA

L7CA1       STA   L766B,X
            STA   L769E,X
            STA   L76C0,X
            STA   L7705,X
            STA   L7726,X
            STA   L7764,X
            STA   L7786,X
            STA   L77CB,X
            STA   L77F3,X
            STA   L7AC1,X
            STA   L7AEB,X
            STA   L7AF6,X
            STA   L7B6A,X
            STA   L7B94,X
            STA   L7B9F,X
            STA   L78B0,X
            STA   L78E3,X
            STA   L7905,X
            STA   L794A,X
            STA   L796B,X
            STA   L79A9,X
            STA   L79CB,X
            STA   L7A10,X
            STA   L7A38,X
            STA   L759C,X
            STA   L75A1,X
            RTS

L7CF0       LDA   #$00
            STA   $A3
            STA   $A4
L7CF6       LDA   $A3
            SEC
            SBC   $A4
            STA   $A5
            LDA   $B5
            SBC   $B3
            BVS   L7D4B
            BMI   L7D3B
            STA   $B9
            LDA   $B6
            SEC
            SBC   $B4
L7D0C       BMI   L7D22
            BVS   L7D24
L7D10       STA   $BA
            ROL   $A5
            ROL   $B9
            LDA   $BA
            SBC   $B9
            BCS   L7D1F
            JMP   L7DA4
L7D1F       JMP   L7DEE

L7D22       BVS   L7D10
L7D24       EOR   #$FF
            CLC
            ADC   #$01
            STA   $BA
            ROL   $A5
            ROL   $B9
            LDA   $BA
            SBC   $B9
            BCC   L7D38
            JMP   L7E33
L7D38       JMP   L7E78

L7D3B       STA   $B9
            LDA   $A4
            SEC
            SBC   $A3
            STA   $A5
            LDA   $B3
            SBC   $B5
            BPL   L7D4E
            SEC
L7D4B       JMP   L7EC2

L7D4E       STA   $B9
            LDX   $A3
            STX   $A4
            LDX   $B5
            STX   $B3
            LDA   $B4
            LDX   $B6
            SEC
            SBC   $B6
            STX   $B4
            JMP   L7D0C

L7D64       TYA
            LSR
            STA   $A4
            AND   #$18
            STA   $A3
            TYA
            AND   #$07
            ORA   $A3
            TAY
            LDA   L7238,Y
            CLC
            ADC   $BB
            STA   $9A
            LDA   $A4
            LSR
            LSR
            TAY
            LDA   L7258,Y
            CLC
            ADC   L7278,X
            TAY
            LSR
            ROR
            EOR   $A4
            BMI   L7D91
            LDA   #$55
            BNE   L7D9E
L7D91       LDA   #$2A
            AND   L7378,X
            BNE   L7D9B
            INY
            LDA   #$01
L7D9B       STA   $B7
            RTS

L7D9E       AND   L7378,X
            STA   $B7
            RTS

L7DA4       LDA   #$00
            SEC
            SBC   $B9
            SEC
            ROR
            STA   $B8
            LDX   $B3
            LDY   $B4
            JSR   L7D64
            LDX   $B9
            INX
L7DB7       LDA   $B7
L7DB9       ORA   ($99),Y
            STA   ($99),Y
            DEX
            BEQ   L7DED
            ASL   $B7
            BMI   L7DE5
L7DC4       LDA   $B8
            ADC   $BA
            BCS   L7DCF
            STA   $B8
            JMP   L7DB7

L7DCF       SEC
            SBC   $B9
            STA   $B8
            LDA   $9A
            SEC
            SBC   #$04
            STA   $9A
            CMP   $BC
            BCS   L7DB7
            JSR   L7821
            JMP   L7DB7

L7DE5       INY
            LDA   #$01
            STA   $B7
            JMP   L7DC4
L7DED       RTS

L7DEE       LDA   $BA
            CLC
            ROR
            STA   $B8
            LDX   $B3
            LDY   $B4
            JSR   L7D64
            LDX   $BA
            INX
L7DFE       LDA   $B7
L7E00       ORA   ($99),Y
            STA   ($99),Y
            DEX
            BEQ   L7E32
            LDA   $9A
            SEC
            SBC   #$04
            STA   $9A
            CMP   $BC
            BCS   L7E15
            JSR   L7821
L7E15       LDA   $B8
            SEC
            SBC   $B9
            STA   $B8
            BCS   L7DFE
            ADC   $BA
            STA   $B8
            LDA   $B7
            ASL
            BMI   L7E2B
            STA   $B7
            BNE   L7DFE
L7E2B       INY
            LDA   #$01
            STA   $B7
            BNE   L7DFE
L7E32       RTS

L7E33       LDA   $BA
            CLC
            ROR
            STA   $B8
            LDX   $B3
            LDY   $B4
            JSR   L7D64
            LDX   $BA
            INX
L7E43       LDA   $B7
L7E45       ORA   ($99),Y
            STA   ($99),Y
            DEX
            BEQ   L7E77
            LDA   $9A
            CLC
            ADC   #$04
            STA   $9A
            CMP   $BD
            BCC   L7E5A
            JSR   L7A66
L7E5A       LDA   $B8
            SEC
            SBC   $B9
            STA   $B8
            BCS   L7E43
            ADC   $BA
            STA   $B8
            LDA   $B7
            ASL
            BMI   L7E70
            STA   $B7
            BNE   L7E43
L7E70       INY
            LDA   #$01
            STA   $B7
            BNE   L7E43
L7E77       RTS

L7E78       LDA   #$00
            SEC
            SBC   $B9
            SEC
            ROR
            STA   $B8
            LDX   $B3
            LDY   $B4
            JSR   L7D64
            LDX   $B9
            INX
L7E8B       LDA   $B7
L7E8D       ORA   ($99),Y
            STA   ($99),Y
            DEX
            BEQ   L7EC1
            ASL   $B7
            BMI   L7EB9
L7E98       LDA   $B8
            ADC   $BA
            BCS   L7EA3
            STA   $B8
            JMP   L7E8B

L7EA3       SEC
            SBC   $B9
            STA   $B8
            LDA   $9A
            CLC
            ADC   #$04
            STA   $9A
            CMP   $BD
            BCC   L7E8B
            JSR   L7A66
            JMP   L7E8B

L7EB9       INY
            LDA   #$01
            STA   $B7
            JMP   L7E98
L7EC1       RTS

L7EC2       ROR
            STA   $B9
            ROR   $A5
            LDA   $A3
            PHA
            LDA   $B5
            PHA
            LDA   $A4
            CLC
            ADC   $A5
            STA   $A3
            PHA
            LDA   $B3
            ADC   $B9
            STA   $B5
            PHA
            LDA   $B6
            PHA
            SEC
            SBC   $B4
            BVS   L7EE6
            CMP   #$80
L7EE6       ROR
            CLC
            ADC   $B4
            STA   $B6
            PHA
            JSR   L7CF6
            PLA
            STA   $B4
            PLA
            STA   $B6
            PLA
            STA   $B3
            PLA
            STA   $A4
            PLA
            STA   $B5
            PLA
            STA   $A3
            JSR   L7CF6
            RTS

L7F06       LDA   $7D
            BNE   L7F3E
            INY
            LDA   ($9B),Y
            BEQ   L7F15
            JSR   L7F1B
            JMP   L63CA

L7F15       JSR   L7F29
            JMP   L63CA

L7F1B       LDA   #<L7CF0
            STA   L75AD+1
            LDA   #>L7CF0
            LDX   #<L7565
            LDY   #>L7565
            JMP   L7F34

L7F29       LDA   #<L75B0
            STA   L75AD+1
            LDA   #>L75B0
            LDX   #<L7574
            LDY   #>L7574
L7F34       STA   L75AD+2
            STX   L7571+1
            STY   L7571+2
            RTS

L7F3E       INY
            LDA   ($9B),Y
            LDY   #$01
            STA   ($9D),Y
            DEY
            LDA   #$14
            JMP   L60CB

L7F4B       INY
            LDA   ($9B),Y
            BEQ   L7F54
            LDA   #$51
            BPL   L7F56
L7F54       LDA   #$11
L7F56       STA   L759C
            STA   L75A1
            STA   L75A8
            STA   L78B0
            STA   L794A
            STA   L7A10
            STA   L766B
            STA   L769E
            STA   L76C0
            STA   L7705
            STA   L7726
            STA   L7764
            STA   L7786
            STA   L77CB
            STA   L77F3
            STA   L78E3
            STA   L7905
            STA   L796B
            STA   L79A9
            STA   L79CB
            STA   L7A38
            STA   L7AC1
            STA   L7AEB
            STA   L7AF6
            STA   L7B6A
            STA   L7B94
            STA   L756C
            STA   L7DB9
            STA   L7E00
            STA   L7E45
            STA   L7E8D
            STA   L7B9F
            LDA   $7D
            BEQ   L7FC2
            LDA   #$79
            LDY   #$00
            STA   ($9D),Y
            STY   $7D
L7FC2       JMP   L63CA

L7FC5       DB    $0B
            DB    $FB
            DB    $80
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11

*-----------------------------------
* End of transmission
*-----------------------------------

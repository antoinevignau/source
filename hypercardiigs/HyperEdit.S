*
* HypercardGS
* segment: $18 HyperEdit
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HyperEdit.l
         lst   off

*---------------------------------------

         use   HyperEdit.E
         use   HyperEdit.X

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

L180000  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L079836
         PLA
         STA   $07
         PLX
         STX   $09
         LDA   $07
         ORA   $09
         BNE   L18002B
         PEA   $000F
         JSL   L0727E0
         BRA   L18006A
L18002B  PHY
         PHY
         PHY
         PHY
         JSL   L07B114
         PEI   $09
         PEI   $07
         JSL   L079A19
         PLA
         STA   $03
         PLX
         STX   $05
         LDA   $03
         ORA   $05
         BNE   L180050
         PEA   $0001
         JSL   L0727E0
         BRA   L180061
L180050  PEI   $05
         PEI   $03
         PEA   $0000
         PEA   $0000
         PEA   $0002
         JSL   L0968AD
L180061  LDA   L055153
         BNE   L18006A
         JSL   L140E96
L18006A  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L180072  ENT
         PHD
         TSC
         CLC
         ADC   #$FDE0
         TCS
         ADC   #$012D
         TCD
         JSL   L0A3283
         LDA   #$0003
         STA   $D5
         LDA   $FA
         DEC
         BNE   L180094
         LDA   #$0002
         STA   $D5
         JSL   L0A20CA
L180094  LDA   $D5
         CMP   L0550BB
         BEQ   L1800A9
         PEA   $02BC
         LDA   #$02BC
         CLC
         ADC   $D5
         PHA
         JSL   L09971B
L1800A9  LDA   L055153
         BEQ   L1800BC
         LDA   L05501F
         LDX   L055021
         STA   L0551F5
         STX   L0551F7
         BRA   L1800C8
L1800BC  LDA   L055027
         LDX   L055029
         STA   L0551F5
         STX   L0551F7
L1800C8  LDA   L055051
         AND   L055245
         BEQ   L1800DD
         STZ   L0551F5
         STZ   L0551F7
         JSL   L0903A6
         BRL   L180403
L1800DD  PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         PEI   $FA
         PEA   ^L052D32
         PEA   L052D32
         JSL   L079CC4
         PLA
         LSR
         BCS   L180106
         STZ   L0551F5
         STZ   L0551F7
         PEA   $000E
         JSL   L0727E0
         BRL   L180403
L180106  PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         LDA   $F8
         BNE   L180117
         BRL   L1802AD
L180117  STZ   $D7
         LDX   #$0000
         LDA   $FA
         DEC
         BNE   L180122
         INX
L180122  PHX
         LDA   L055231
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L180158
         LDAL  L052D40
         AND   #$000F
         STA   $D9
         LDX   #$0000
         LDA   #$0003
         CMP   $D9
         BNE   L180143
         INX
L180143  PHX
         LDX   #$0000
         LDAL  L052D42
         ORAL  L052D44
         BNE   L180152
         INX
L180152  TXA
         AND   $01,S
         PLX
         STA   $D7
L180158  LDAL  L052D6E
         STA   $E3
         PHY
         LDAL  L052D70
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $E5
         LDA   #$03E8
         STA   $ED
L180173  PHY
         JSL   L099DCE
         PLA
         LSR
         BCC   L180182
         LDA   #$0001
         STA   L05522F
L180182  LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         JSL   L093E80
         PHY
         PEI   $E9
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $E9
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PHY
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         JSL   L150B2E
         PLA
         LSR
         BCC   L1801D0
         BRL   L18029C
L1801D0  PEA   ^L052D38
         PEA   L052D38
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         PEI   $E9
         PEI   $E7
         PEI   $E5
         PEI   $E3
         PEA   ^L052D38
         PEA   L052D38
         JSL   L071937
         LDAL  L052D3E
         INC
         STAL  L052D3E
         LDAL  L052D3C
         INC
         STAL  L052D3C
         LDAL  L052D3E
         SEC
         SBCL  L052D3A
         SEC
         SBC   #$000F
         BVS   L180216
         EOR   #$8000
L180216  BPL   L18021D
         LDA   #$0000
         BRA   L180220
L18021D  LDA   #$0001
L180220  PHA
         LDAL  L052D3C
         SEC
         SBCL  L052D38
         SEC
         SBC   #$0008
         BVS   L180233
         EOR   #$8000
L180233  BPL   L18023A
         LDA   #$0000
         BRA   L18023D
L18023A  LDA   #$0001
L18023D  ORA   $01,S
         PLX
         LSR
         BCC   L18024F
         PEA   ^L052D38
         PEA   L052D38
         JSL   L08273B
         BRA   L180262
L18024F  LDA   $D7
         AND   L05522F
         BEQ   L180262
         LDA   #$0016
         CLC
         ADCL  L052D38
         STAL  L052D3C
L180262  PEA   ^L052D38
         PEA   L052D38
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         PEA   ^L052D32
         PEA   L052D32
         JSL   L07D585
         PLA
         LSR
         BCS   L180290
         PEA   $000E
         JSL   L0727E0
L180290  JSL   L085DC0
         LDA   $E7
         LDX   $E9
         STA   $EB
         STX   $ED
L18029C  PHY
         JSL   L096CC4
         PLA
         EOR   #$0001
         BNE   L1802AA
         BRL   L180173
L1802AA  BRL   L180371
L1802AD  LDA   $FA
         DEC
         BNE   L18031D
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FED3
         PHA
         PEA   $0003
         JSL   L073002
         PEA   $0100
         JSL   L0313BE
         LDA   #$0089
         STAL  L052D3A
         LDA   #$00B7
         STAL  L052D3E
         LDA   #$005A
         STAL  L052D38
         LDA   #$0068
         STAL  L052D3C
         LDA   #$A002
         STAL  L052D40
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD3
         PHA
         JSL   L07D64A
         PLA
         LSR
         BCS   L18031B
         PEA   $000E
         JSL   L0727E0
L18031B  BRA   L18033F
L18031D  LDA   $FA
         DEC
         DEC
         BNE   L18033F
         LDA   #$006E
         STAL  L052D3A
         LDA   #$00D2
         STAL  L052D3E
         LDA   #$003C
         STAL  L052D38
         LDA   #$0091
         STAL  L052D3C
L18033F  PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         PEA   ^L052D32
         PEA   L052D32
         JSL   L07D585
         PLA
         LSR
         BCS   L18035D
         PEA   $000E
         JSL   L0727E0
L18035D  PEA   ^L052D38
         PEA   L052D38
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         JSL   L085DC0
L180371  PHY
         PEA   ^L052D38
         PEA   L052D38
         JSL   L081A64
         PLA
         LSR
         BCC   L1803C9
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         JSL   L07A2F0
         PLA
         LSR
         BCC   L1803C7
         PEA   ^L052D38
         PEA   L052D38
         TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         JSL   L0808E0
         TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         JSL   L085216
         TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         JSL   L087BAE
         JSL   L0A3283
L1803C7  BRA   L1803FD
L1803C9  LDA   $FA
         DEC
         BNE   L1803D5
         LDA   #$000C
         STA   $D3
         BRA   L1803DA
L1803D5  LDA   #$000D
         STA   $D3
L1803DA  PEI   $D3
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L0998E6
L1803FD  LDA   #$0001
         STA   L055133
L180403  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0226
         TCS
         RTL

L180415  ENT
         PHD
         TSC
         CLC
         ADC   #$FF88
         TCS
         TCD
         LDA   L055229
         SEC
         SBC   #$0001
         BEQ   L18042D
         BVS   L18042B
         EOR   #$8000
L18042B  BMI   L180432
L18042D  LDA   #$0000
         BRA   L180435
L180432  LDA   #$0001
L180435  PHA
         LDAL  L052D34
         BEQ   L18043F
         LDA   #$0001
L18043F  AND   $01,S
         PLX
         LSR
         BCC   L18045D
         LDA   $7E
         DEC
         BNE   L180453
         PEA   $0002
         JSL   L0A3F63
         BRA   L18045A
L180453  PEA   $0004
         JSL   L0A3F63
L18045A  BRL   L1809B4
L18045D  PEA   ^L052D38
         PEA   L052D38
         JSL   L086CDB
         LDA   $7E
         DEC
         BNE   L180470
         JSL   L0A20CA
L180470  JSL   L0A3283
         PHY
         LDAL  L052D70
         PHA
         LDAL  L052D6E
         PHA
         PEI   $7E
         PEA   ^L0551F5
         PEA   L0551F5
         PEA   ^L052D32
         PEA   L052D32
         JSL   L0A2034
         PLA
         LSR
         BCS   L180498
         BRL   L1809B4
L180498  LDA   L055051
         AND   L055245
         BEQ   L1804F3
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         JSL   L099243
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         JSL   L096A7B
L1804BE  PHY
         JSL   L096CC4
         PLA
         LSR
         BCC   L1804F0
         TDC
         CLC
         ADC   #$0071
         PEA   $0000
         PHA
         JSL   L096A7B
         PHY
         PEI   $73
         PEI   $71
         PEI   $6F
         PEI   $6D
         PEA   $0002
         JSL   L071984
         PLA
         LSR
         BCS   L1804EE
         JSL   L0903A6
         BRA   L1804F0
L1804EE  BRA   L1804BE
L1804F0  BRL   L1809B4
L1804F3  LDA   L055231
         BEQ   L180574
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         PEI   $7E
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L079CC4
         PLA
         LSR
         BCC   L180574
         PHY
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         JSL   L07B168
         PLA
         STA   $35
         PLX
         STX   $37
         LDA   $35
         ORA   $37
         BEQ   L180574
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         CLC
         ADC   #$0002
         BCC   L180542
         INX
L180542  STA   $75
         STX   $77
         LDA   $03
         STA   [$75]
         LDA   $03
         STAL  L052D34
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         PEI   $37
         PEI   $35
         JSL   L07DD58
         PLA
         LSR
         BCS   L18056C
         PEA   $000E
         JSL   L0727E0
L18056C  PEI   $37
         PEI   $35
         JSL   L07185A
L180574  PEA   ^L050008
         PEA   L050008
         PEA   ^L052D32
         PEA   L052D32
         PEA   $002A
         JSL   L0313BE
         LDA   L0551F5
         LDX   L0551F7
         STA   L055427
         STX   L055429
         LDAL  L052D40
         AND   #$000F
         STA   $2D
         LDA   #$000F
         STA   $55
         LDA   #$0008
         STA   $53
         LDA   #$0007
         CMP   $2D
         BNE   L1805B9
         LDA   #$001E
         STA   $55
         LDA   #$0022
         STA   $53
         BRA   L1805CB
L1805B9  LDA   $2D
         SEC
         SBC   #$0005
         BVS   L1805C4
         EOR   #$8000
L1805C4  BPL   L1805CB
         LDA   #$0009
         STA   $53
L1805CB  LDAL  L052D70
         TAX
         LDAL  L052D6E
         STA   $71
         STX   $73
         PHY
         PEI   $73
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $73
         LDA   $71
         LDX   $73
         STA   $6D
         STX   $6F
         LDAL  L052D70
         PHA
         LDAL  L052D6E
         PHA
         JSL   L094E90
         LDA   #$0001
         STA   $39
         LDAL  L052D3E
         SEC
         SBCL  L052D3A
         STA   $59
         LDAL  L052D3C
         SEC
         SBCL  L052D38
         STA   $5B
         PHY
         PEA   $0004
         PEI   $59
         PEA   $0004
         JSL   L1500F5
         PLX
         PLX
         PHA
         JSL   L072FA6
         PLA
         STA   $57
         LDAL  L052D3E
         SEC
         SBC   $57
         STA   $75
         LDA   $73
         SEC
         SBC   $75
         BVS   L180640
         EOR   #$8000
L180640  BPL   L18065F
         LDA   #L052D3E
         LDX   #^L052D3E
         STA   $3B
         STX   $3D
         LDA   $55
         SEC
         SBC   $59
         STA   $47
         LDA   #$0140
         SEC
         SBCL  L052D3E
         STA   $49
         BRA   L180695
L18065F  LDA   $57
         CLC
         ADCL  L052D3A
         STA   $75
         LDA   $73
         SEC
         SBC   $75
         BEQ   L180676
         BVS   L180674
         EOR   #$8000
L180674  BMI   L180693
L180676  LDA   #L052D3A
         LDX   #^L052D3A
         STA   $3B
         STX   $3D
         LDAL  L052D3A
         EOR   #$FFFF
         INC
         STA   $47
         LDA   $59
         SEC
         SBC   $55
         STA   $49
         BRA   L180695
L180693  STZ   $39
L180695  PHY
         PEA   $0004
         PEI   $5B
         PEA   $0004
         JSL   L1500F5
         PLX
         PLX
         PHA
         JSL   L072FA6
         PLA
         STA   $57
         LDAL  L052D3C
         SEC
         SBC   $57
         STA   $75
         LDA   $71
         SEC
         SBC   $75
         BVS   L1806BF
         EOR   #$8000
L1806BF  BPL   L1806DE
         LDA   #L052D3C
         LDX   #^L052D3C
         STA   $3F
         STX   $41
         LDA   $53
         SEC
         SBC   $5B
         STA   $43
         LDA   #$00C8
         SEC
         SBCL  L052D3C
         STA   $45
         BRA   L180714
L1806DE  LDA   $57
         CLC
         ADCL  L052D38
         STA   $75
         LDA   $71
         SEC
         SBC   $75
         BEQ   L1806F5
         BVS   L1806F3
         EOR   #$8000
L1806F3  BMI   L180712
L1806F5  LDA   #L052D38
         LDX   #^L052D38
         STA   $3F
         STX   $41
         LDAL  L052D38
         EOR   #$FFFF
         INC
         STA   $43
         LDA   $5B
         SEC
         SBC   $53
         STA   $45
         BRA   L180714
L180712  STZ   $39
L180714  LDA   L055231
         BEQ   L18071B
         STZ   $39
L18071B  LDA   $39
         BNE   L180747
         LDAL  L052D3A
         EOR   #$FFFF
         INC
         STA   $47
         LDAL  L052D38
         EOR   #$FFFF
         INC
         STA   $43
         LDA   #$0140
         SEC
         SBCL  L052D3E
         STA   $49
         LDA   #$00C8
         SEC
         SBCL  L052D3C
         STA   $45
L180747  TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         PEA   ^L052D38
         PEA   L052D38
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         STZ   $4B
         STZ   $4D
         LDA   #$0001
         STA   $33
         LDA   #$0001
         STA   $2F
L180788  PHY
         JSL   L096CC4
         PLA
         LSR
         BCS   L180794
         BRL   L180916
L180794  LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         TDC
         CLC
         ADC   #$0071
         PEA   $0000
         PHA
         JSL   L096A7B
         PHY
         PEI   $73
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $73
         LDA   $2F
         BEQ   L180809
         PHY
         PEI   $73
         PEI   $71
         PEI   $6F
         PEI   $6D
         PEA   $0002
         JSL   L071984
         PLA
         LSR
         BCC   L180809
         LDA   L054FB7
         LDX   L054FB9
         STA   $75
         STX   $77
         LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         PHX
         PHA
         LDAL  L052D6C
         TAX
         LDAL  L052D6A
         CLC
         ADC   #$0014
         BCC   L1807F6
         INX
L1807F6  JSL   L033477
         BVS   L1807FF
         EOR   #$8000
L1807FF  BMI   L180809
         LDA   $6D
         LDX   $6F
         STA   $71
         STX   $73
L180809  PHY
         JSL   L099DCE
         PLA
         LSR
         BCC   L180818
         LDA   #$0001
         STA   L05522F
L180818  LDA   $73
         ASL
         STA   $73
         TDC
         CLC
         ADC   #$0071
         PEA   $0000
         PHA
         JSL   L09457C
         PHY
         PEI   $73
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $73
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PHY
         LDA   $73
         SEC
         SBC   $6F
         PHA
         PEI   $47
         PEI   $49
         JSL   L071A1B
         PLA
         STA   $4F
         PHY
         LDA   $71
         SEC
         SBC   $6D
         PHA
         PEI   $43
         PEI   $45
         JSL   L071A1B
         PLA
         STA   $51
         LDX   #$0000
         LDA   $4B
         CMP   $4F
         BEQ   L18086F
         INX
L18086F  PHX
         LDX   #$0000
         LDA   $4D
         CMP   $51
         BEQ   L18087A
         INX
L18087A  TXA
         ORA   $01,S
         PLX
         STA   $31
*         LDA   $31
         ORA   $33
         BNE   L180889
         BRL   L180913
L180889  PEA   ^L052D38
         PEA   L052D38
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         PEA   ^L052D38
         PEA   L052D38
         TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $39
         BEQ   L1808C3
         LDA   $4F
         CLC
         ADC   [$3B]
         STA   [$3B]
         LDA   $51
         CLC
         ADC   [$3F]
         STA   [$3F]
         BRA   L1808D1
L1808C3  PEA   ^L052D38
         PEA   L052D38
         PEI   $4F
         PEI   $51
         JSL   L1501AF
L1808D1  PEA   ^L052D38
         PEA   L052D38
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         PEA   ^L052D32
         PEA   L052D32
         JSL   L07D585
         PLA
         LSR
         BCS   L1808FF
         PEA   $000E
         JSL   L0727E0
L1808FF  JSL   L085DC0
         LDA   $4F
         STA   $4B
         LDA   $51
         STA   $4D
         LDA   $31
         BEQ   L180911
         STZ   $2F
L180911  STZ   $33
L180913  BRL   L180788
L180916  PEA   ^L052D38
         PEA   L052D38
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         JSL   L085DC0
         LDA   L055231
         BEQ   L1809AE
         LDA   $2F
         BEQ   L18097C
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         JSL   L07A2F0
         PLA
         LSR
         BCC   L18097A
         PEA   ^L052D38
         PEA   L052D38
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         JSL   L0808E0
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         JSL   L085216
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         JSL   L087BAE
         JSL   L0A3283
L18097A  BRA   L1809AE
L18097C  LDA   #$000D
         STA   $2B
         LDA   $7E
         DEC
         BNE   L18098B
         LDA   #$000C
         STA   $2B
L18098B  PEI   $2B
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L0998E6
L1809AE  LDA   #$0001
         STA   L055133
L1809B4  LDA   $7C
         STA   $7E
         LDA   $7B
         STA   $7D
         LDA   $79
         TCD
         TSC
         CLC
         ADC   #$007C
         TCS
         RTL

L1809C6  ENT
         PHD
         TSC
         CLC
         ADC   #$FA4E
         TCS
         ADC   #$04BB
         TCD
         STZ   $E9
         STZ   $EB
         STZ   $E5
         STZ   $E7
         STZ   $CF
         STZ   $D1
         LDA   L05542B
         LDX   L05542D
         PHX
         PHA
         JSL   L1511C8
         PHY
         TDC
         CLC
         ADC   #$00EF
         PEA   $0000
         PHA
         LDAL  L052D70
         PHA
         LDAL  L052D6E
         PHA
         LDA   L05542B
         LDX   L05542D
         PHX
         PHA
         JSL   L150482
         PLA
         BNE   L180A0F
         BRL   L180F7A
L180A0F  PHY
         LDAL  L052D70
         PHA
         LDAL  L052D6E
         PHA
         PEA   $0000
         PEA   $0000
         PEI   $F1
         PEI   $EF
         JSL   L150B0A
         PLA
         BNE   L180A2E
         BRL   L180F7A
L180A2E  PHY
         PHY
         PEI   $F1
         PEI   $EF
         JSL   L150132
         PLA
         PLX
         STA   $ED
         LDX   #$0000
         LDAL  L050038
         BNE   L180A46
         INX
L180A46  PHX
         LDX   #$0000
         LDA   #$0004
         CMP   $ED
         BNE   L180A52
         INX
L180A52  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L180A5C
         BRL   L180F5E
L180A5C  LDA   L05542B
         LDX   L05542D
         PHX
         PHA
         JSL   L072634
         STZ   L05542B
         STZ   L05542D
         JSL   L09AFB1
         PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L070525
         PLA
         STA   $E9
         PLX
         STX   $EB
         PHY
         PHY
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L070525
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDA   L055027
         LDX   L055029
         STA   $E1
         STX   $E3
         LDA   L055039
         LDX   L05503B
         STA   $DD
         STX   $DF
         STZ   $D7
         LDA   $DD
         LDX   $DF
         CMP   L05542F
         BNE   L180ABC
         CPX   L055431
L180ABC  BNE   L180AC3
         LDA   #$0000
         BRA   L180AC6
L180AC3  LDA   #$0001
L180AC6  STA   $D5
         LDA   $D5
         BNE   L180ACF
         BRL   L180B58
L180ACF  LDA   #$0001
         STA   $45
         LDA   L055433
         LDX   L055435
         STA   $47
         STX   $49
         LDA   #$0006
         STA   $71
         LDA   L05542F
         LDX   L055431
         STA   $9D
         STX   $9F
         PHY
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L095416
         PLA
         STA   $D3
         LDA   #$0001
         STA   $45
         LDA   $E1
         LDX   $E3
         STA   $47
         STX   $49
         LDA   #$0006
         STA   $71
         PHY
         PHY
         PEI   $E7
         PEI   $E5
         JSL   L078841
         PLA
         STA   $9D
         PLX
         STX   $9F
         LDA   #$0001
         STA   L055255
         PHY
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L095416
         PLA
         STA   $D3
         STZ   L055255
         LDA   $DD
         LDX   $DF
         CMP   L055039
         BNE   L180B4C
         CPX   L05503B
L180B4C  BNE   L180B53
         LDA   #$0000
         BRA   L180B56
L180B53  LDA   #$0001
L180B56  STA   $D7
L180B58  PHY
         PHY
         LDA   L05542F
         LDX   L055431
         PHX
         PHA
         JSL   L07899F
         PLA
         STA   $D9
         PLX
         STX   $DB
         LDA   L055433
         LDX   L055435
         PHX
         PHA
         PEI   $DB
         PEI   $D9
         PEA   $0000
         JSL   L0968AD
         PEI   $DB
         PEI   $D9
         JSL   L07185A
         PEA   $0002
         JSL   L090635
         PEA   ^L052D32
         PEA   L052D32
         PEA   ^L050036
         PEA   L050036
         PEA   $002A
         JSL   L0313BE
         LDA   L055437
         LDX   L055439
         STA   L0551F5
         STX   L0551F7
         LDAL  L040160
         STA   $B3
         SEP   #$20
         LDA   #$0D
         STA   $B4
         REP   #$20
         TDC
         CLC
         ADC   #$00AE
         PEA   $0000
         PHA
         PEA   ^L040162
         PEA   L040162
         PEA   $0005
         JSL   L0313BE
         SEP   #$20
         LDA   #$0D
         STA   $AF
         REP   #$20
         LDA   $D7
         BEQ   L180C2D
         PEA   $0000
         TDC
         CLC
         ADC   #$FF45
         PHA
         PEA   ^L040167
         PEA   L040167
         PEA   $0000
         TDC
         CLC
         ADC   #$FC45
         PHA
         PEI   $EB
         PEI   $E9
         JSL   L072CD4
         PEA   $0000
         TDC
         CLC
         ADC   #$FB45
         PHA
         PEI   $E7
         PEI   $E5
         JSL   L072CD4
         PEA   ^L04016F
         PEA   L04016F
         PEA   $0000
         TDC
         CLC
         ADC   #$FD45
         PHA
         PEA   $0004
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRA   L180C6A
L180C2D  PEA   $0000
         TDC
         CLC
         ADC   #$FF45
         PHA
         PEA   ^L040171
         PEA   L040171
         PEA   $0000
         TDC
         CLC
         ADC   #$FC45
         PHA
         PEI   $E7
         PEI   $E5
         JSL   L072CD4
         PEA   ^L040179
         PEA   L040179
         PEA   $0000
         TDC
         CLC
         ADC   #$FD45
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L180C6A  LDA   #$0003
         CMP   $ED
         BNE   L180CA2
         PEA   $0000
         TDC
         CLC
         ADC   #$FE45
         PHA
         PEA   ^L04017B	; go
         PEA   L04017B
         PEA   $0000
         TDC
         CLC
         ADC   #$FF45
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD45
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRA   L180D15
L180CA2  PEA   $0000
         TDC
         CLC
         ADC   #$FE45
         PHA
         PEA   ^L04017F	; go card id
         PEA   L04017F
         PEA   $0000
         TDC
         CLC
         ADC   #$FD31
         PHA
         PEI   $E3
         PEI   $E1
         JSL   L0715D9
         PEA   $0000
         TDC
         CLC
         ADC   #$FE25
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $001F
         JSL   L0313BE
         LDA   $D5
         BEQ   L180D15
         PEA   $0000
         TDC
         CLC
         ADC   #$FE45
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE45
         PHA
         PEA   ^L04018B
         PEA   L04018B
         PEA   $0000
         TDC
         CLC
         ADC   #$FF45
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD45
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L180D15  PHY
         PHY
         LDA   L055437
         LDX   L055439
         PHX
         PHA
         LDAL  L050038
         PHA
         JSL   L07AE68
         PLA
         STA   $CF
         PLX
         STX   $D1
         LDA   $CF
         ORA   $D1
         BNE   L180D37
         BRL   L180F5E
L180D37  PHY
         PHY
         PEI   $D1
         PEI   $CF
         JSL   L151301
         PLA
         PLX
         CLC
         ADC   #$0100
         BCC   L180D4A
         INX
L180D4A  STA   $CB
         STX   $CD
         PHY
         PEI   $D1
         PEI   $CF
         PEI   $CD
         PEI   $CB
         JSL   L078A05
         PLA
         LSR
         BCS   L180D62
         BRL   L180F5E
L180D62  LDY   #$0002
         LDA   [$CF],Y
         TAX
         LDA   [$CF]
         PEI   $CD
         PEI   $CB
         JSL   L150F53
         STA   $C7
         STX   $C9
         PHY
         PHY
         TDC
         CLC
         ADC   #$00AE
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$CF],Y
         PHA
         LDA   [$CF]
         PHA
         JSL   L071CCD
         PLA
         STA   $BF
         PLX
         STX   $C1
         LDA   $BF
         ORA   $C1
         BEQ   L180DD8
         LDA   $BF
         LDX   $C1
         INC
         BNE   L180DA2
         INX
L180DA2  STA   $BF
         STX   $C1
         LDA   $BF
         LDX   $C1
         STA   $B9
         STX   $BB
         TDC
         CLC
         ADC   #$00B9
         PEA   $0000
         PHA
         JSL   L071B83
         PEI   $BB
         PEI   $B9
         PEI   $C1
         PEI   $BF
         PEI   $C9
         PEI   $C7
         LDA   $B9
         LDX   $BB
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         BRL   L180EE5
L180DD8  PHY
         PHY
         PEA   ^L040190
         PEA   L040190
         LDY   #$0002
         LDA   [$CF],Y
         PHA
         LDA   [$CF]
         PHA
         JSL   L071CCD
         PLA
         STA   $BF
         PLX
         STX   $C1
         LDA   $BF
         ORA   $C1
         BEQ   L180E30
         TDC
         CLC
         ADC   #$00A1
         PEA   $0000
         PHA
         PEA   ^L04019B
         PEA   L04019B
         PEA   $000D
         JSL   L0313BE
         SEP   #$20
         LDA   #$0D
         STA   $A2
         REP   #$20
         PHY
         PHY
         TDC
         CLC
         ADC   #$00A1
         PEA   $0000
         PHA
         PEI   $C1
         PEI   $BF
         JSL   L071CCD
         PLA
         STA   $BF
         PLX
         STX   $C1
L180E30  LDA   $BF
         ORA   $C1
         BNE   L180E9D
         PEA   $0000
         TDC
         CLC
         ADC   #$FE45
         PHA
         PEA   ^L0401A8
         PEA   L0401A8
         TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE45
         PHA
         TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         PEA   ^L0401B3	; end mouseUp
         PEA   L0401B3
         TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD45
         PHA
         PEA   $0007
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         LDY   #$0002
         LDA   [$CF],Y
         TAX
         LDA   [$CF]
         STA   $BF
         STX   $C1
         BRA   L180EE5
L180E9D  LDX   $C1
         LDA   $BF
         BNE   L180EA4
         DEX
L180EA4  DEC
         STA   $C3
         STX   $C5
         LDA   #$00FF
         AND   [$C3]
         CMP   #$000D
         BEQ   L180EE5
         PEA   $0000
         TDC
         CLC
         ADC   #$FE45
         PHA
         TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE45
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD45
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L180EE5  LDA   #$00FF
         LDX   #$FE45
         AND   $00,X
         STA   $BD
         PEI   $C1
         PEI   $BF
         LDA   $BD
         JSL   L150488
         JSL   L150F53
         STA   $B5
         STX   $B7
         PEI   $C1
         PEI   $BF
         PEI   $B7
         PEI   $B5
         PEI   $C9
         PEI   $C7
         LDA   $B5
         LDX   $B7
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         PEA   $0000
         TDC
         CLC
         ADC   #$FE46
         PHA
         PEI   $C1
         PEI   $BF
         LDA   $BD
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDA   L055437
         LDX   L055439
         PHX
         PHA
         LDAL  L050038
         PHA
         JSL   L0B878F
         PHY
         LDA   L055437
         LDX   L055439
         PHX
         PHA
         LDAL  L050038
         PHA
         PEI   $D1
         PEI   $CF
         JSL   L07D712
         PLA
         STA   $D3
L180F5E  PEI   $D1
         PEI   $CF
         JSL   L07185A
         PEI   $EB
         PEI   $E9
         JSL   L07185A
         PEI   $E7
         PEI   $E5
         JSL   L07185A
         JSL   L0A20CA
L180F7A  TSC
         CLC
         ADC   #$05B2
         TCS
         PLD
         RTL

L180F82  ENT
         PHD
         TSC
         CLC
         ADC   #$FED2
         TCS
         ADC   #$0037
         TCD
         LDA   L05502B
         LDX   L05502D
         CMP   L055039
         BNE   L180F9B
         CPX   L05503B
L180F9B  BNE   L180FA7
         PEA   $0007
         JSL   L0727E0
         BRL   L181109
L180FA7  LDA   #$4000
         ANDL  L053AE9
         BEQ   L180FB3
         LDA   #$0001
L180FB3  STA   $E9
         LDA   L05504F
         ORA   $E9
         BEQ   L180FC6
         PEA   $0008
         JSL   L0727E0
         BRL   L181109
L180FC6  PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072B9F
         PLA
         STA   $E1
         PLX
         STX   $E3
         PEA   $0000
         TDC
         CLC
         ADC   #$00C9
         PHA
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC9
         PHA
         PEI   $E3
         PEI   $E1
         JSL   L072CD4
         PEA   ^L04021A
         PEA   L04021A
         PEA   ^L04021B
         PEA   L04021B
         JSL   L073C22
         PHY
         JSL   L0727BF
         PLA
         STA   $ED
         PHY
         PHY
         PEA   $1770
         JSL   L072834
         PLA
         STA   $EF
         PLX
         STX   $F1
         PEI   $F1
         PEI   $EF
         PEA   $0003
         JSL   L073D2E
         PEI   $F1
         PEI   $EF
         JSL   L15102F
L181044  PHY
         PEA   $0000
         JSL   L0736C8
         PLA
         STA   $EB
         LDA   #$FFFF
         CMP   $EB
         BNE   L181077
         PEA   $0001
         PEI   $F1
         PEI   $EF
         PEA   $0001
         JSL   L072E7C
         PEA   $0000
         PEI   $F1
         PEI   $EF
         PEA   $0000
         JSL   L072E7C
         LDA   #$0001
         STA   $EB
L181077  LDX   #$0000
         LDA   $EB
         DEC
         BNE   L181080
         INX
L181080  PHX
         LDX   #$0000
         LDA   $EB
         DEC
         DEC
         BNE   L18108B
         INX
L18108B  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L181044
         PEI   $F1
         PEI   $EF
         JSL   L072634
         PEI   $ED
         JSL   L0724F7
         JSL   L09AFB1
         LDA   $EB
         DEC
         DEC
         BNE   L181101
         LDA   L055039
         LDX   L05503B
         STA   $E5
         STX   $E7
         PEA   $0004
         JSL   L098852
         LDA   $E5
         LDX   $E7
         CMP   L055039
         BNE   L1810C7
         CPX   L05503B
L1810C7  BEQ   L1810FA
         PEI   $E7
         PEI   $E5
         PEA   $0001
         JSL   L0B883D
         LDY   #$0002
         LDA   [$E1],Y
         PHA
         LDA   [$E1]
         PHA
         JSL   L075B09
         LDAL  L05565D
         BNE   L1810F1
         PEI   $E7
         PEI   $E5
         JSL   L09538D
         BRA   L1810F8
L1810F1  PEA   $0009
         JSL   L0727E0
L1810F8  BRA   L181101
L1810FA  PEA   $0009
         JSL   L0727E0
L181101  PEI   $E3
         PEI   $E1
         JSL   L07185A
L181109  TSC
         CLC
         ADC   #$012E
         TCS
         PLD
         RTL

L181111  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L05542B
         LDX   L05542D
         PHX
         PHA
         JSL   L1517CD
         PLY
         PLY
         PLD
         RTL

L181129  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055051
         AND   L055245
         BEQ   L18113F
         JSL   L0903A6
         BRA   L181171
L18113F  LDAL  L052D34
         BNE   L18114E
         PEA   $0029
         JSL   L0727E0
         BRA   L181171
L18114E  PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         PEI   $0A
         PEA   $0000
         JSL   L07C09C
         PLA
         AND   L05522F
         BEQ   L18116D
         BRA   L18114E
L18116D  JSL   L14174B
L181171  LDA   $08
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


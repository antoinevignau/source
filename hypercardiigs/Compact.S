*
* HypercardGS
* segment: $1A Compact
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   Compact.l
         lst   off

*---------------------------------------

         use   Compact.E
         use   Compact.X

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
	use   4/SANE.Macs
         use   4/Sound.Macs
         use   4/Std.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*---------------------------------------

L1A0000  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$0013
         TCD
         LDY   #$00A7
         LDA   [$F6],Y
         PHA
         DEY
         DEY
         LDA   [$F6],Y
         PHA
         JSL   L07185A
         LDY   #$008F
         LDA   [$F6],Y
         PHA
         DEY
         DEY
         LDA   [$F6],Y
         PHA
         JSL   L07185A
         LDY   #$00BD
         LDA   [$F6],Y
         PHA
         JSL   L075A4F
         LDY   #$00C1
         LDA   [$F6],Y
         TAX
         DEY
         DEY
         LDA   [$F6],Y
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         JSL   L075B09
         LDY   #$00C1
         LDA   [$F6],Y
         PHA
         DEY
         DEY
         LDA   [$F6],Y
         PHA
         JSL   L07185A
         LDY   #$00C5
         LDA   [$F6],Y
         PHA
         DEY
         DEY
         LDA   [$F6],Y
         PHA
         JSL   L07185A
         LDA   $FA
         BEQ   L1A0084
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         PEI   $FA
         JSL   L072809
         JSL   L07010A
L1A0084  LDY   #$00C7
         LDA   [$F6],Y
         PHA
         JSL   L0724F7
         PHD
         LDA   $F6
         TCD
         CLC
         ADC   #$0000
         TCS
         JMPL  L1A2872

         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$010C
         TCS
         RTL

L1A00AD  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $2C
         PEI   $2A
         PEA   $0014
         JSL   L0313BE
         PEA   $0021
         PEA   $0000
         PEI   $1E
         JSL   L1A0000
         LDA   $1C
         STA   $2C
         LDA   $1B
         STA   $2B
         LDA   $19
         TCD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L1A00E7  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDY   #$00BD
         LDA   [$0E],Y
         PHA
         LDY   #$009B
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         JSL   L075E14
         PHY
         PHY
         LDY   #$00BD
         LDA   [$0E],Y
         PHA
         PEI   $14
         PEI   $12
         PEI   $18
         PEI   $16
         PEA   $0000
         JSL   L075E55
         PLA
         STA   $01
         PLX
         STX   $03
         LDX   #$0000
         LDAL  L05565D
         BNE   L1A012B
         INX
L1A012B  TXA
         STA   $1A
         LDA   #$0099
         CLC
         ADC   $0E
         LDX   $10
         BCC   L1A0139
         INX
L1A0139  STA   $05
         STX   $07
         LDY   #$009B
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         PEI   $03
         PEI   $01
         JSL   L150F53
         STA   [$05]
         TXA
         LDY   #$0002
         STA   [$05],Y
         LDA   $0C
         STA   $18
         LDA   $0B
         STA   $17
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L1A0169  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$009F
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L1A0204
         BEQ   L1A0204
         LDY   #$00A7
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L0718BF
         PHY
         LDY   #$009F
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         LDY   #$00A7
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         PEA   $0000
         PEI   $0A
         JSL   L1A00E7
         PLA
         LSR
         BCS   L1A01E7
         PEA   ^L040009
         PEA   L040009
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $0A
         JSL   L1A00AD
L1A01E7  LDY   #$00A7
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L07191C
         LDA   #$0000
         TAX
         LDY   #$009D
         STA   [$0A],Y
         INY
         INY
         TXA
         STA   [$0A],Y
L1A0204  LDA   $08
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

L1A0215  PHD
         TSC
         CLC
         ADC   #$FFCC
         TCS
         TCD
         LDY   #$0002
         LDA   [$3E],Y
         TAX
         LDA   [$3E]
         CLC
         ADC   #$0008
         BCC   L1A022C
         INX
L1A022C  STA   $31
         STX   $33
         LDY   #$0002
         LDA   [$31],Y
         TAX
         LDA   [$31]
         STA   $2D
         STX   $2F
         PHY
         PHY
         PEI   $2F
         PEI   $2D
         PEA   $0008
         JSL   L150337
         PLA
         STA   $29
         PLX
         STX   $2B
         LDA   #$00FF
         AND   $2D
         STA   $27
         PEI   $2B
         PEI   $29
         LDA   #$0008
         LDX   #$0000
         JSL   L033477
         BVS   L1A0269
         EOR   #$8000
L1A0269  BPL   L1A0270
         LDA   #$0000
         BRA   L1A0273
L1A0270  LDA   #$0001
L1A0273  PHA
         PEI   $2B
         PEI   $29
         LDY   #$008B
         LDA   [$3A],Y
         TAX
         DEY
         DEY
         LDA   [$3A],Y
         JSL   L033477
         BVS   L1A028C
         BPL   L1A0293
         BRA   L1A028E
L1A028C  BMI   L1A0293
L1A028E  LDA   #$0000
         BRA   L1A0296
L1A0293  LDA   #$0001
L1A0296  ORA   $01,S
         PLX
         LSR
         BCC   L1A02C0
         PEI   $2F
         PEI   $2D
         PEA   $0000
         JSL   L074E4D
         PEA   ^L04000F
         PEA   L04000F
         PEI   $2B
         PEI   $29
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $3A
         JSL   L1A00AD
L1A02C0  LDY   #$0097
         LDA   [$3A],Y
         TAX
         DEY
         DEY
         LDA   [$3A],Y
         AND   #$001F
         BEQ   L1A02F8
         PEI   $2F
         PEI   $2D
         PEA   $0000
         JSL   L074E4D
         PEA   ^L040016
         PEA   L040016
         LDY   #$0097
         LDA   [$3A],Y
         PHA
         DEY
         DEY
         LDA   [$3A],Y
         PHA
         PEI   $2B
         PEI   $29
         PEA   $0000
         PEI   $3A
         JSL   L1A00AD
L1A02F8  LDY   #$008F
         LDA   [$3A],Y
         TAX
         DEY
         DEY
         LDA   [$3A],Y
         STA   $31
         STX   $33
         LDY   #$0002
         LDA   [$31],Y
         TAX
         LDA   [$31]
         PHX
         PHA
         LDA   $29
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $31
         STX   $33
         LDA   $27
         JSL   L150488
         PHX
         PHA
         LDY   #$0097
         LDA   [$3A],Y
         TAX
         DEY
         DEY
         LDA   [$3A],Y
         PEA   $0000
         PEA   $0008
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   [$31]
         TXA
         LDY   #$0002
         STA   [$31],Y
         JSL   L072328
         LDY   #$0002
         LDA   [$3E],Y
         TAX
         LDA   [$3E]
         STA   $31
         STX   $33
         LDY   #$0002
         LDA   [$31],Y
         TAX
         LDA   [$31]
         STA   $23
         STX   $25
         LDY   #$009F
         LDA   [$3A],Y
         TAX
         DEY
         DEY
         LDA   [$3A],Y
         PEI   $25
         PEI   $23
         JSL   L150F53
         PHX
         PHA
         LDY   #$00A3
         LDA   [$3A],Y
         TAX
         DEY
         DEY
         LDA   [$3A],Y
         JSL   L033477
         BEQ   L1A039D
         BVS   L1A039B
         EOR   #$8000
L1A039B  BMI   L1A0401
L1A039D  LDY   #$0002
         LDA   [$3E],Y
         PHA
         LDA   [$3E]
         PHA
         LDY   #$00A7
         LDA   [$3A],Y
         TAX
         DEY
         DEY
         LDA   [$3A],Y
         STA   $31
         STX   $33
         LDY   #$0002
         LDA   [$31],Y
         TAX
         LDA   [$31]
         PHX
         PHA
         LDY   #$009F
         LDA   [$3A],Y
         TAX
         DEY
         DEY
         LDA   [$3A],Y
         JSL   L150F53
         PHX
         PHA
         PEI   $25
         PEI   $23
         JSL   L070597
         LDA   #$009D
         CLC
         ADC   $3A
         LDX   $3C
         BCC   L1A03E1
         INX
L1A03E1  STA   $31
         STX   $33
         LDY   #$009F
         LDA   [$3A],Y
         TAX
         DEY
         DEY
         LDA   [$3A],Y
         PEI   $25
         PEI   $23
         JSL   L150F53
         STA   [$31]
         TXA
         LDY   #$0002
         STA   [$31],Y
         BRA   L1A0465
L1A0401  PEA   $0000
         PEI   $3A
         JSL   L1A0169
         PHY
         PEI   $40
         PEI   $3E
         JSL   L0718FA
         PLA
         STA   $21
         PHY
         PEI   $25
         PEI   $23
         LDY   #$0002
         LDA   [$3E],Y
         PHA
         LDA   [$3E]
         PHA
         PEA   $0000
         PEI   $3A
         JSL   L1A00E7
         PLA
         LSR
         BCS   L1A045B
         PEI   $2F
         PEI   $2D
         PEA   $0000
         JSL   L074E4D
         PEA   ^L04001D
         PEA   L04001D
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $3A
         JSL   L1A00AD
L1A045B  PEI   $40
         PEI   $3E
         PEI   $21
         JSL   L0718DA
L1A0465  LDA   #$0095
         CLC
         ADC   $3A
         LDX   $3C
         BCC   L1A0470
         INX
L1A0470  STA   $31
         STX   $33
         LDY   #$0097
         LDA   [$3A],Y
         TAX
         DEY
         DEY
         LDA   [$3A],Y
         PEI   $25
         PEI   $23
         JSL   L150F53
         STA   [$31]
         TXA
         LDY   #$0002
         STA   [$31],Y
         LDA   $38
         STA   $40
         LDA   $37
         STA   $3F
         LDA   $35
         TCD
         TSC
         CLC
         ADC   #$003E
         TCS
         RTL

L1A04A0  PHD
         TSC
         CLC
         ADC   #$FF5E
         TCS
         TCD
         PHY
         PHY
         LDY   #$00AB
         LDA   [$A8],Y
         PHA
         LDY   #$00B3
         LDA   [$A8],Y
         INC
         ASL
         ASL
         PHA
         LDY   #$00B3
         LDA   [$A8],Y
         PHA
         LDY   #$00B7
         LDA   [$A8],Y
         PHA
         JSL   L079BEC
         PLA
         STA   $9B
         PLX
         STX   $9D
         LDA   $9B
         ORA   $9D
         BNE   L1A04F4
         PEA   ^L040023
         PEA   L040023
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $A8
         JSL   L1A00AD
L1A04F4  LDAL  L053AD3
         TAX
         LDAL  L053AD1
         STA   $97
         STX   $99
         STZ   $8F
         STZ   $91
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         STA   $01
         STX   $03
         PEI   $03
         PEI   $01
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L1A0525
         EOR   #$8000
L1A0525  BMI   L1A052A
         BRL   L1A0670
L1A052A  LDA   #$0001
         LDX   #$0000
         STA   $93
         STX   $95
L1A0534  JSL   L072328
         PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L1A054D
         PEA   $0000
         PEA   $0000
         PEI   $A8
         JSL   L1A0000
L1A054D  TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0084
         JSL   L071EC5
         PHY
         PHY
         PEI   $99
         PEI   $97
         PEI   $95
         PEI   $93
         JSL   L07B8EA
         PLA
         STA   $07
         PLX
         STX   $09
         LDA   $07
         ORA   $09
         BNE   L1A0593
         PEA   ^L04002E
         PEA   L04002E
         PEI   $95
         PEI   $93
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $A8
         JSL   L1A00AD
L1A0593  PHY
         PHY
         PEI   $09
         PEI   $07
         JSL   L0772AE
         PLA
         STA   $8B
         PLX
         STX   $8D
         LDA   $8B
         ORA   $8D
         BNE   L1A05C0
         PEA   ^L040037
         PEA   L040037
         PEI   $95
         PEI   $93
         PEI   $09
         PEI   $07
         PEA   $0000
         PEI   $A8
         JSL   L1A00AD
L1A05C0  LDY   #$0002
         LDA   [$8B],Y
         TAX
         LDA   [$8B]
         CLC
         ADC   #$0020
         BCC   L1A05CF
         INX
L1A05CF  STA   $9F
         STX   $A1
         LDA   $8F
         LDX   $91
         CMP   [$9F]
         BNE   L1A05E1
         LDY   #$0002
         TXA
         CMP   [$9F],Y
L1A05E1  BEQ   L1A060A
         LDA   #$0002
         LDX   #$000B
         STA   $00,X
         LDY   #$0002
         LDA   [$8B],Y
         TAX
         LDA   [$8B]
         CLC
         ADC   #$0020
         BCC   L1A05FA
         INX
L1A05FA  STA   $9F
         STX   $A1
         LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         STA   $8F
         STX   $91
L1A060A  PEI   $09
         PEI   $07
         PEA   $0000
         JSL   L074A90
         PHY
         PEI   $9D
         PEI   $9B
         PEA   $7FFF
         PEA   $FFFF
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L07B2EC
         PLA
         LSR
         BCS   L1A064C
         PEA   ^L040041
         PEA   L040041
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $A8
         JSL   L1A00AD
L1A064C  PEI   $9D
         PEI   $9B
         PEI   $95
         PEI   $93
         PEA   $0000
         JSL   L07E171
         LDA   $93
         LDX   $95
         CMP   $01
         BNE   L1A0665
         CPX   $03
L1A0665  BEQ   L1A0670
         INC   $93
         BNE   L1A066D
         INC   $95
L1A066D  BRL   L1A0534
L1A0670  LDA   $9B
         LDX   $9D
         STAL  L053AD1
         TXA
         STAL  L053AD3
         LDA   #$0001
         STA   L05504D
         PEA   $0000
         JSL   L07479E
         PHY
         PEI   $99
         PEI   $97
         JSL   L07A1F7
         PLA
         STA   $05
         LDA   $A6
         STA   $AA
         LDA   $A5
         STA   $A9
         LDA   $A3
         TCD
         TSC
         CLC
         ADC   #$00A8
         TCS
         RTL

L1A06A8  PHD
         TSC
         CLC
         ADC   #$FE44
         TCS
         ADC   #$00C9
         TCD
         JSL   L079752
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         JSL   L07A852
         PLA
         LSR
         BCS   L1A06EE
         PEA   ^L040049
         PEA   L040049
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $F8
         JSL   L1A00AD
L1A06EE  LDA   $E5
         LDY   #$00B5
         STA   [$F8],Y
         LDA   $E3
         LDY   #$00B1
         STA   [$F8],Y
         LDA   $D7
         LDY   #$00A9
         STA   [$F8],Y
         STZ   $C3
         STZ   $C5
         PEA   $0000
         TDC
         CLC
         ADC   #$FF3B
         PHA
         JSL   L078F60
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         TXY
         LDX   #$FF37
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FF37
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L1A073E
         EOR   #$8000
L1A073E  BMI   L1A0743
         BRL   L1A07E5
L1A0743  LDA   #$0001
         LDX   #$0000
         STA   $BF
         STX   $C1
L1A074D  PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $C1
         PEI   $BF
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         JSL   L07A4B1
         PLA
         LSR
         BCS   L1A078A
         PEA   ^L040052
         PEA   L040052
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $C1
         PEI   $BF
         PEA   $0000
         PEI   $F8
         JSL   L1A00AD
L1A078A  PEI   $C5
         PEI   $C3
         PHY
         PHY
         TDC
         CLC
         ADC   #$003F
         PEA   $0000
         PHA
         LDY   #$00B1
         LDA   [$F8],Y
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF3B
         PHA
         JSL   L0790AB
         PLA
         PLX
         JSL   L150F53
         STA   $C3
         STX   $C5
         PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L1A07CB
         PEA   $0000
         PEA   $0000
         PEI   $F8
         JSL   L1A0000
L1A07CB  LDX   #$FF37
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CMP   $BF
         BNE   L1A07DA
         CPX   $C1
L1A07DA  BEQ   L1A07E5
         INC   $BF
         BNE   L1A07E2
         INC   $C1
L1A07E2  BRL   L1A074D
L1A07E5  LDA   #$00AD
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L1A07F0
         INX
L1A07F0  STA   $EF
         STX   $F1
         LDA   $C3
         LDX   $C5
         PEA   $0000
         PEA   $0064
         JSL   L150D50
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         LDY   #$00B1
         LDA   [$F8],Y
         ASL
         ASL
         ASL
         ASL
         ASL
         JSL   L150488
         JSL   L150D50
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   [$EF]
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$01C2
         TCS
         RTL

L1A083A  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         PHY
         PEI   $1A
         PEI   $18
         PEA   $0000
         JSL   L077264
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BEQ   L1A08A0
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $09
         STX   $0B
         PHY
         PHY
         PHY
         PHY
         PEI   $07
         PEI   $05
         JSL   L07DF0D
         JSL   L07704E
         PLA
         STA   [$09]
         PLA
         LDY   #$0002
         STA   [$09],Y
         PEI   $07
         PEI   $05
         PEA   $0000
         PEI   $12
         JSL   L1A0215
         PEI   $1A
         PEI   $18
         PEA   $0000
         JSL   L074A5A
         PEI   $1A
         PEI   $18
         JSL   L077B28
L1A08A0  LDA   $10
         STA   $1A
         LDA   $0F
         STA   $19
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L1A08B2  PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         JSL   L0772F8
         PLA
         STA   $19
         PLX
         STX   $1B
         LDA   $19
         ORA   $1B
         BNE   L1A08F5
         PEA   ^L04005C
         PEA   L04005C
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $26
         JSL   L1A00AD
L1A08F5  PEI   $1B
         PEI   $19
         PEA   $0000
         PEI   $26
         JSL   L1A0215
         LDA   #$0028
         LDX   #$0000
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         CLC
         ADC   #$000C
         BCC   L1A091B
         INX
L1A091B  STA   $1D
         STX   $1F
         LDY   #$0002
         LDA   [$1D],Y
         TAX
         LDA   [$1D]
         STA   $01
         STX   $03
         PEI   $03
         PEI   $01
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L1A093E
         EOR   #$8000
L1A093E  BMI   L1A0943
         BRL   L1A09EF
L1A0943  LDA   #$0001
         LDX   #$0000
         STA   $11
         STX   $13
L1A094D  LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         PEI   $17
         PEI   $15
         JSL   L150F53
         STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         STA   $09
         STX   $0B
         PHY
         PHY
         PEI   $0B
         PEI   $09
         JSL   L077A01
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BNE   L1A09AB
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEA   $0000
         JSL   L074AC6
         PEA   ^L040065
         PEA   L040065
         PEI   $13
         PEI   $11
         PEI   $0B
         PEI   $09
         PEA   $0000
         PEI   $26
         JSL   L1A00AD
L1A09AB  PEI   $07
         PEI   $05
         PEA   $0000
         PEI   $26
         JSL   L1A0215
         PEI   $0B
         PEI   $09
         PEA   $0000
         JSL   L074E17
         PEI   $0B
         PEI   $09
         JSL   L077B28
         LDA   $15
         LDX   $17
         CLC
         ADC   #$0006
         BCC   L1A09D6
         INX
L1A09D6  STA   $15
         STX   $17
         LDA   $11
         LDX   $13
         CMP   $01
         BNE   L1A09E4
         CPX   $03
L1A09E4  BEQ   L1A09EF
         INC   $11
         BNE   L1A09EC
         INC   $13
L1A09EC  BRL   L1A094D
L1A09EF  LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEA   $0000
         JSL   L074AC6
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         JSL   L077B28
         LDA   $24
         STA   $28
         LDA   $23
         STA   $27
         LDA   $21
         TCD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL

L1A0A20  PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         STZ   $21
         STZ   $23
         LDAL  L053AC7
         TAX
         LDAL  L053AC5
         STA   $1D
         STX   $1F
         LDAL  L053AC3
         TAX
         LDAL  L053AC1
         STA   $01
         STX   $03
         PEI   $03
         PEI   $01
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L1A0A59
         EOR   #$8000
L1A0A59  BMI   L1A0A5E
         BRL   L1A0BBD
L1A0A5E  LDA   #$0001
         LDX   #$0000
         STA   $19
         STX   $1B
L1A0A68  PHY
         PHY
         PEI   $1F
         PEI   $1D
         JSL   L07721A
         PLA
         STA   $15
         PLX
         STX   $17
         LDA   $15
         ORA   $17
         BNE   L1A0A97
         PEA   ^L04006E
         PEA   L04006E
         PEI   $1B
         PEI   $19
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $2E
         JSL   L1A00AD
L1A0A97  STZ   $11
         STZ   $13
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         CLC
         ADC   #$0014
         BCC   L1A0AAA
         INX
L1A0AAA  STA   $25
         STX   $27
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         PHX
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L1A0AC5
         BRL   L1A0B5E
L1A0AC5  BNE   L1A0ACA
         BRL   L1A0B5E
L1A0ACA  LDA   $21
         LDX   $23
         INC
         BNE   L1A0AD2
         INX
L1A0AD2  STA   $21
         STX   $23
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         CLC
         ADC   #$000C
         BCC   L1A0AE5
         INX
L1A0AE5  STA   $25
         STX   $27
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $11
         STX   $13
         PHY
         PHY
         PEI   $17
         PEI   $15
         JSL   L07DF0D
         PLA
         STA   $0D
         PLX
         STX   $0F
         PHY
         PHY
         PEI   $0F
         PEI   $0D
         JSL   L07704E
         PLA
         STA   $05
         PLX
         STX   $07
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $25
         STX   $27
         LDA   $05
         LDX   $07
         STA   [$25]
         TXA
         LDY   #$0002
         STA   [$25],Y
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PEI   $0F
         PEI   $0D
         JSL   L150F53
         PHX
         PHA
         PEI   $07
         PEI   $05
         LDA   $0D
         LDX   $0F
         JSL   L1512A5
         PHX
         PHA
         JSL   L071EC5
         PEI   $17
         PEI   $15
         PEA   $0000
         PEI   $2E
         JSL   L1A0215
L1A0B5E  LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         CLC
         ADC   #$0018
         BCC   L1A0B6D
         INX
L1A0B6D  STA   $25
         STX   $27
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $09
         STX   $0B
         PEI   $1F
         PEI   $1D
         PEA   $0000
         JSL   L074A24
         PEI   $1F
         PEI   $1D
         JSL   L077B28
         LDA   $09
         LDX   $0B
         STA   $1D
         STX   $1F
         PEI   $13
         PEI   $11
         PEA   $0000
         PEA   $0000
         PEI   $2E
         JSL   L1A083A
         LDA   $19
         LDX   $1B
         CMP   $01
         BNE   L1A0BB2
         CPX   $03
L1A0BB2  BEQ   L1A0BBD
         INC   $19
         BNE   L1A0BBA
         INC   $1B
L1A0BBA  BRL   L1A0A68
L1A0BBD  LDA   $21
         LDX   $23
         STA   $32
         STX   $34
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

L1A0BD7  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDA   #$0001
         STA   $1E
         LDA   [$1A]
         STA   $0B
         LDA   $0B
         BNE   L1A0BEF
         BRL   L1A0C83
L1A0BEF  LDA   $16
         LDX   $18
         PEA   $FFFF
         PEA   $FF49
         JSL   L150F53
         STA   $05
         STX   $07
         LDY   #$004B
         LDA   [$16],Y
         STA   $03
         LDA   $03
         SEC
         SBC   #$0001
         BVS   L1A0C13
         EOR   #$8000
L1A0C13  BPL   L1A0C39
         LDA   #$0001
         STA   $09
L1A0C1A  LDA   $0B
         CMP   [$05]
         BEQ   L1A0C87
         LDA   $05
         LDX   $07
         CLC
         ADC   #$0002
         BCC   L1A0C2B
         INX
L1A0C2B  STA   $05
         STX   $07
         LDA   $09
         CMP   $03
         BEQ   L1A0C39
         INC   $09
         BRA   L1A0C1A
L1A0C39  LDA   $16
         LDX   $18
         PEA   $FFFF
         PEA   $FE49
         JSL   L150F53
         STA   $05
         STX   $07
         LDY   #$0049
         LDA   [$16],Y
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L1A0C5D
         EOR   #$8000
L1A0C5D  BPL   L1A0C83
         LDA   #$0001
         STA   $09
L1A0C64  LDA   $0B
         CMP   [$05]
         BEQ   L1A0C87
         LDA   $05
         LDX   $07
         CLC
         ADC   #$0002
         BCC   L1A0C75
         INX
L1A0C75  STA   $05
         STX   $07
         LDA   $09
         CMP   $01
         BEQ   L1A0C83
         INC   $09
         BRA   L1A0C64
L1A0C83  STZ   $1E
         BRA   L1A0C8C
L1A0C87  LDA   #$0000
         STA   [$05]
L1A0C8C  LDA   $14
         STA   $1C
         LDA   $13
         STA   $1B
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L1A0C9E  PHD
         TSC
         CLC
         ADC   #$FFCA
         TCS
         TCD
         LDY   #$00DF
         LDA   [$3C],Y
         TAX
         DEY
         DEY
         LDA   [$3C],Y
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$0020
         BCC   L1A0CC3
         INX
L1A0CC3  STA   $33
         STX   $35
         LDY   #$00ED
         LDA   [$3C],Y
         TAX
         DEY
         DEY
         LDA   [$3C],Y
         CMP   [$33]
         BNE   L1A0CDB
         LDY   #$0002
         TXA
         CMP   [$33],Y
L1A0CDB  BNE   L1A0CE0
         BRL   L1A0E59
L1A0CE0  LDY   #$00DF
         LDA   [$3C],Y
         TAX
         DEY
         DEY
         LDA   [$3C],Y
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$0020
         BCC   L1A0CFD
         INX
L1A0CFD  STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         LDY   #$00EB
         STA   [$3C],Y
         INY
         INY
         TXA
         STA   [$3C],Y
         PHY
         PHY
         LDY   #$00ED
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         JSL   L07721A
         PLA
         STA   $2F
         PLX
         STX   $31
         LDA   $2F
         ORA   $31
         BNE   L1A0D68
         LDY   #$00E3
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         PEA   $0000
         JSL   L074A90
         PEA   ^L040074
         PEA   L040074
         LDY   #$00ED
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         PEA   $0000
         PEA   $0000
         PHD
         LDA   $3C
         TCD
         LDA   $F8
         PLD
         PEA   $0000
         PHA
         JSL   L1A00AD
L1A0D68  LDA   $3C
         LDX   $3E
         PEA   $FFFF
         PEA   $FD49
         JSL   L150F53
         STA   $2B
         STX   $2D
         LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         CLC
         ADC   #$0032
         BCC   L1A0D89
         INX
L1A0D89  STA   $25
         STX   $27
         LDA   #$0000
         LDY   #$004B
         STA   [$3C],Y
         LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         CLC
         ADC   #$0024
         BCC   L1A0DA4
         INX
L1A0DA4  STA   $33
         STX   $35
         LDA   [$33]
         STA   $0D
         LDA   $0D
         SEC
         SBC   #$0001
         BVS   L1A0DB7
         EOR   #$8000
L1A0DB7  BMI   L1A0DBC
         BRL   L1A0E47
L1A0DBC  LDA   #$0001
         STA   $29
L1A0DC1  LDX   #$0000
         LDY   #$0004
         LDA   #$000F
         AND   [$25],Y
         DEC
         DEC
         BNE   L1A0DD1
         INX
L1A0DD1  PHX
         LDX   #$0000
         LDY   #$0004
         LDA   #$4000
         AND   [$25],Y
         CMP   #$0000
         BNE   L1A0DE3
         INX
L1A0DE3  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L1A0E2A
         LDY   #$0002
         LDA   [$25],Y
         STA   [$2B]
         LDA   $2B
         LDX   $2D
         CLC
         ADC   #$0002
         BCC   L1A0DFC
         INX
L1A0DFC  STA   $2B
         STX   $2D
         LDY   #$004B
         LDA   [$3C],Y
         INC
         LDY   #$004B
         STA   [$3C],Y
         LDY   #$004B
         LDA   #$0080
         CMP   [$3C],Y
         BNE   L1A0E2A
         LDY   #$00ED
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         PEA   $0000
         JSL   L074A24
         BRL   L1A1103
L1A0E2A  PEI   $27
         PEI   $25
         LDA   [$25]
         JSL   L150488
         JSL   L150F53
         STA   $25
         STX   $27
         LDA   $29
         CMP   $0D
         BEQ   L1A0E47
         INC   $29
         BRL   L1A0DC1
L1A0E47  LDY   #$00ED
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         PEA   $0000
         JSL   L074A24
L1A0E59  LDY   #$004B
         LDA   [$3C],Y
         STA   $0B
         LDA   $0B
         SEC
         SBC   #$0001
         BVS   L1A0E6B
         EOR   #$8000
L1A0E6B  BPL   L1A0EE6
         LDA   #$0001
         STA   $29
L1A0E72  LDA   $3C
         LDX   $3E
         PEA   $FFFF
         PEA   $FF49
         JSL   L150F53
         PHX
         PHA
         LDA   $29
         JSL   L150488
         TAY
         BNE   L1A0E8C
         DEX
L1A0E8C  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         LDA   $3C
         LDX   $3E
         PEA   $FFFF
         PEA   $FD49
         JSL   L150F53
         PHX
         PHA
         LDA   $29
         JSL   L150488
         TAY
         BNE   L1A0EBB
         DEX
L1A0EBB  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $33
         STX   $35
         LDA   [$33]
         PLX
         STX   $33
         PLX
         STX   $35
         STA   [$33]
         LDA   $29
         CMP   $0B
         BEQ   L1A0EE6
         INC   $29
         BRA   L1A0E72
L1A0EE6  LDA   $3C
         LDX   $3E
         PEA   $FFFF
         PEA   $FE49
         JSL   L150F53
         STA   $2B
         STX   $2D
         LDA   #$0000
         LDY   #$0049
         STA   [$3C],Y
         LDY   #$00DF
         LDA   [$3C],Y
         TAX
         DEY
         DEY
         LDA   [$3C],Y
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$0032
         BCC   L1A0F1D
         INX
L1A0F1D  STA   $25
         STX   $27
         LDY   #$00DF
         LDA   [$3C],Y
         TAX
         DEY
         DEY
         LDA   [$3C],Y
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$0024
         BCC   L1A0F3E
         INX
L1A0F3E  STA   $33
         STX   $35
         LDA   [$33]
         STA   $09
         LDA   $09
         SEC
         SBC   #$0001
         BVS   L1A0F51
         EOR   #$8000
L1A0F51  BPL   L1A0FB2
         LDA   #$0001
         STA   $29
L1A0F58  LDY   #$0004
         LDA   #$000F
         AND   [$25],Y
         DEC
         DEC
         BNE   L1A0F96
         LDY   #$0002
         LDA   [$25],Y
         EOR   #$FFFF
         INC
         STA   [$2B]
         LDA   $2B
         LDX   $2D
         CLC
         ADC   #$0002
         BCC   L1A0F7A
         INX
L1A0F7A  STA   $2B
         STX   $2D
         LDY   #$0049
         LDA   [$3C],Y
         INC
         LDY   #$0049
         STA   [$3C],Y
         LDY   #$0049
         LDA   #$0080
         CMP   [$3C],Y
         BNE   L1A0F96
         BRL   L1A1103
L1A0F96  PEI   $27
         PEI   $25
         LDA   [$25]
         JSL   L150488
         JSL   L150F53
         STA   $25
         STX   $27
         LDA   $29
         CMP   $09
         BEQ   L1A0FB2
         INC   $29
         BRA   L1A0F58
L1A0FB2  LDY   #$00DF
         LDA   [$3C],Y
         TAX
         DEY
         DEY
         LDA   [$3C],Y
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         STA   $05
         STX   $07
         LDY   #$00DF
         LDA   [$3C],Y
         TAX
         DEY
         DEY
         LDA   [$3C],Y
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         PHX
         PHA
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         JSL   L150F53
         STA   $21
         STX   $23
         LDY   #$00DF
         LDA   [$3C],Y
         TAX
         DEY
         DEY
         LDA   [$3C],Y
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$0032
         BCC   L1A1011
         INX
L1A1011  PHX
         PHA
         LDY   #$002A
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         JSL   L150F53
         STA   $1D
         STX   $1F
         LDA   $1D
         LDX   $1F
         STA   $19
         STX   $1B
         LDA   $1D
         LDX   $1F
         STA   $15
         STX   $17
         STZ   $13
         LDY   #$0030
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $0F
         STX   $11
L1A1045  PEI   $1B
         PEI   $19
         LDA   $1D
         LDX   $1F
         PEI   $11
         PEI   $0F
         JSL   L150F53
         JSL   L033477
         BVS   L1A105E
         EOR   #$8000
L1A105E  BMI   L1A10D4
         LDA   $19
         LDX   $1B
         CLC
         ADC   #$0002
         BCC   L1A106B
         INX
L1A106B  STA   $15
         STX   $17
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L071AB8
         PHY
         PEI   $1B
         PEI   $19
         PEA   $0000
         PEI   $3C
         JSL   L1A0BD7
         PLA
         LSR
         BCC   L1A109D
         LDA   $13
         INC
         STA   $13
         LDA   $15
         LDX   $17
         STA   $19
         STX   $1B
         BRA   L1A10D1
L1A109D  PEI   $17
         PEI   $15
         PEI   $1B
         PEI   $19
         PEI   $23
         PEI   $21
         LDA   $15
         LDX   $17
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         LDA   $0F
         LDX   $11
         PEI   $1B
         PEI   $19
         JSL   L150F53
         PHX
         PHA
         LDA   $15
         LDX   $17
         JSL   L1512A5
         STA   $0F
         STX   $11
L1A10D1  BRL   L1A1045
L1A10D4  LDY   #$00DF
         LDA   [$3C],Y
         TAX
         DEY
         DEY
         LDA   [$3C],Y
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         STA   $01
         STX   $03
         LDA   $13
         LDY   #$002C
         STA   [$01],Y
         LDA   $0F
         LDX   $11
         LDY   #$002E
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
L1A1103  LDA   $3A
         STA   $3E
         LDA   $39
         STA   $3D
         LDA   $37
         TCD
         TSC
         CLC
         ADC   #$003C
         TCS
         RTL

L1A1115  PHD
         TSC
         CLC
         ADC   #$FC4E
         TCS
         ADC   #$02BF
         TCD
         STZ   $EB
         STZ   $ED
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         TXY
         LDX   #$FD41
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FD41
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L1A114E
         EOR   #$8000
L1A114E  BMI   L1A1153
         BRL   L1A1303
L1A1153  LDA   #$0001
         LDX   #$0000
         STA   $E7
         STX   $E9
L1A115D  PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $E9
         PEI   $E7
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         JSL   L07A4B1
         PLA
         STA   $E5
         LDA   $E5
         BNE   L1A1199
         PEA   ^L040082
         PEA   L040082
         PEI   $E9
         PEI   $E7
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $F8
         JSL   L1A00AD
L1A1199  LDA   $4D
         LDX   $4F
         STA   $E1
         STX   $E3
         LDA   $E1
         ORA   $E3
         BNE   L1A11C0
         PEA   ^L04008B
         PEA   L04008B
         PEI   $E9
         PEI   $E7
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $F8
         JSL   L1A00AD
L1A11C0  PHY
         PHY
         PEI   $E3
         PEI   $E1
         JSL   L0772AE
         PLA
         STA   $DD
         PLX
         STX   $DF
         LDA   $DD
         ORA   $DF
         BNE   L1A11ED
         PEA   ^L040096
         PEA   L040096
         PEI   $E9
         PEI   $E7
         PEI   $E3
         PEI   $E1
         PEA   $0000
         PEI   $F8
         JSL   L1A00AD
L1A11ED  LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         TXY
         LDX   #$FD45
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FD45
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000C
         BCC   L1A120E
         INX
L1A120E  STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STA   $D9
         STX   $DB
         LDX   #$FD45
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$001C
         BCC   L1A122E
         INX
L1A122E  STA   $EF
         STX   $F1
         LDA   L055005
         LDX   L055007
         STA   [$EF]
         TXA
         LDY   #$0002
         STA   [$EF],Y
         PEA   $0000
         PHD
         JSL   L1A0C9E
         PHY
         PHY
         PEI   $DF
         PEI   $DD
         JSL   L07DF0D
         PLA
         STA   $D5
         PLX
         STX   $D7
         PHY
         PHY
         PEI   $D7
         PEI   $D5
         JSL   L07704E
         PLA
         STA   $D1
         PLX
         STX   $D3
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         STA   $EF
         STX   $F1
         LDA   $D1
         LDX   $D3
         STA   [$EF]
         TXA
         LDY   #$0002
         STA   [$EF],Y
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         PEI   $D7
         PEI   $D5
         JSL   L150F53
         PHX
         PHA
         PEI   $D3
         PEI   $D1
         LDA   $D5
         LDX   $D7
         JSL   L1512A5
         PHX
         PHA
         JSL   L071EC5
         PEI   $DF
         PEI   $DD
         PEA   $0000
         PEI   $F8
         JSL   L1A0215
         PEI   $E3
         PEI   $E1
         PEA   $0000
         JSL   L074A90
         PEI   $E3
         PEI   $E1
         JSL   L077B28
         PEI   $DB
         PEI   $D9
         PEA   $0001
         PEA   $0000
         PEI   $F8
         JSL   L1A083A
         PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L1A12E9
         PEA   $0000
         PEA   $0000
         PEI   $F8
         JSL   L1A0000
L1A12E9  LDX   #$FD41
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CMP   $E7
         BNE   L1A12F8
         CPX   $E9
L1A12F8  BEQ   L1A1303
         INC   $E7
         BNE   L1A1300
         INC   $E9
L1A1300  BRL   L1A115D
L1A1303  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$03B8
         TCS
         RTL

L1A1315  PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         PHY
         PHY
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         PEA   $0000
         JSL   L077624
         PLA
         STA   $15
         PLX
         STX   $17
         LDA   $15
         ORA   $17
         BNE   L1A1345
         BRL   L1A1481
L1A1345  PEI   $17
         PEI   $15
         PEA   $0000
         PEI   $22
         JSL   L1A0215
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         CLC
         ADC   #$0010
         BCC   L1A1361
         INX
L1A1361  STA   $19
         STX   $1B
         LDA   [$19]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L1A1374
         EOR   #$8000
L1A1374  BMI   L1A1379
         BRL   L1A145C
L1A1379  LDA   #$0001
         STA   $13
L1A137E  LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         CLC
         ADC   #$009E
         BCC   L1A138D
         INX
L1A138D  PHX
         PHA
         LDA   $13
         JSL   L150488
         TAY
         BNE   L1A1399
         DEX
L1A1399  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $03
         STX   $05
         LDY   #$0004
         LDA   [$03],Y
         TAX
         DEY
         DEY
         LDA   [$03],Y
         STA   $0F
         STX   $11
         LDY   #$0008
         LDA   [$03],Y
         TAX
         DEY
         DEY
         LDA   [$03],Y
         STA   $0B
         STX   $0D
         PHY
         PHY
         PEI   $11
         PEI   $0F
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L077624
         PLA
         STA   $07
         PLX
         STX   $09
         LDA   $07
         ORA   $09
         BNE   L1A141B
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         PEA   $0000
         JSL   L074B81
         PEA   ^L04009B
         PEA   L04009B
         LDA   $13
         JSL   L150488
         PHX
         PHA
         PEI   $11
         PEI   $0F
         PEA   $0000
         PEI   $22
         JSL   L1A00AD
L1A141B  PEI   $09
         PEI   $07
         PEA   $0000
         PEI   $22
         JSL   L1A0215
         PEI   $11
         PEI   $0F
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L074B81
         PEI   $11
         PEI   $0F
         JSL   L077B28
         PEI   $0D
         PEI   $0B
         PEA   $0000
         PEA   $0000
         PEI   $22
         JSL   L1A083A
         LDA   $13
         CMP   $01
         BEQ   L1A145C
         INC   $13
         BRL   L1A137E
L1A145C  LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         PEA   $0000
         JSL   L074B81
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         JSL   L077B28
L1A1481  LDA   $20
         STA   $24
         LDA   $1F
         STA   $23
         LDA   $1D
         TCD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L1A1493  PHD
         TSC
         CLC
         ADC   #$FFDC
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0020
         JSL   L071EC5
         LDA   #$0020
         LDX   #$0000
         STA   $01
         STX   $03
         LDA   #$4154
         LDX   #$4C49
         STA   $05
         STX   $07
         LDA   #$FFFF
         TAX
         STA   $09
         STX   $0B
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   ^L0400A4
         PEA   L0400A4
         PEA   $0014
         JSL   L0313BE
         PHY
         PEA   $0000
         PEA   $0020
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEI   $2A
         JSL   L1A00E7
         PLA
         LSR
         BCS   L1A151C
         PEA   ^L0400B8
         PEA   L0400B8
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $2A
         JSL   L1A00AD
L1A151C  LDA   $28
         STA   $2C
         LDA   $27
         STA   $2B
         LDA   $25
         TCD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L1A152E  PHD
         TSC
         CLC
         ADC   #$F7FC
         TCS
         ADC   #$0711
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FAEF
         PHA
         PEA   ^L053A9D
         PEA   L053A9D
         PEA   $0600
         JSL   L0313BE
         LDY   #$0083
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         TXY
         LDX   #$FB13
         STA   $00,X
         TYA
         STA   $02,X
         PEA   $0000
         TDC
         CLC
         ADC   #$FEEF
         PHA
         PEA   $0000
         PEA   $0200
         JSL   L071EC5
         LDX   #$FB39
         STZ   $00,X
         LDX   #$FB27
         STZ   $00,X
         STZ   $02,X
         LDY   #$007F
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         TXY
         LDX   #$FB03
         STA   $00,X
         TYA
         STA   $02,X
         LDA   #$0400
         LDX   #$FB3B
         ORA   $00,X
         LDX   #$FB3B
         STA   $00,X
         LDA   #$2000
         LDX   #$FB3B
         AND   $00,X
         BEQ   L1A15AE
         LDA   #$0001
L1A15AE  LDY   #$007B
         STA   [$F8],Y
         LDA   L05501B
         LDX   L05501D
         TXY
         LDX   #$FB73
         STA   $00,X
         TYA
         STA   $02,X
         LDA   L05501B
         LDX   L05501D
         TXY
         LDX   #$FB77
         STA   $00,X
         TYA
         STA   $02,X
         LDA   L05501B
         LDX   L05501D
         TXY
         LDX   #$FB7B
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FAFB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         LDY   #$0077
         STA   [$F8],Y
         INY
         INY
         TXA
         STA   [$F8],Y
         LDX   #$FAFB
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FAEF
         PHA
         PEA   $0000
         PEA   $0180
         JSL   L071E31
         PLA
         PLX
         JSL   L1512A5
         TXY
         LDX   #$FAFB
         STA   $00,X
         TYA
         STA   $02,X
         LDY   #$007B
         LDA   [$F8],Y
         BEQ   L1A163F
         PEA   $0000
         TDC
         CLC
         ADC   #$FB07
         PHA
         LDY   #$0079
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L077E22
L1A163F  LDA   #$0000
         TAX
         LDY   #$0099
         STA   [$F8],Y
         INY
         INY
         TXA
         STA   [$F8],Y
         PHY
         PEA   $0000
         PEA   $0600
         PEA   $0000
         TDC
         CLC
         ADC   #$FAEF
         PHA
         PEA   $0000
         PEI   $F8
         JSL   L1A00E7
         PLA
         LSR
         BCS   L1A1689
         PEA   ^L0400BD
         PEA   L0400BD
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $F8
         JSL   L1A00AD
L1A1689  LDY   #$009B
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         LDX   #$FAEF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         JSL   L033477
         BVS   L1A16A6
         EOR   #$8000
L1A16A6  BMI   L1A1707
         LDY   #$009B
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         PEA   $0000
         PEA   $0200
         PEA   $0000
         TDC
         CLC
         ADC   #$F8EF
         PHA
         PEA   $0000
         JSL   L077D97
         PHY
         PEA   $0000
         PEA   $0200
         PEA   $0000
         TDC
         CLC
         ADC   #$F8EF
         PHA
         PEA   $0000
         PEI   $F8
         JSL   L1A00E7
         PLA
         LSR
         BCS   L1A1705
         PEA   ^L0400C5
         PEA   L0400C5
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $F8
         JSL   L1A00AD
L1A1705  BRA   L1A1689
L1A1707  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$080A
         TCS
         RTL

L1A1719  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDAL  L053AB7
         TAX
         LDAL  L053AB5
         LDY   #$0099
         STA   [$0A],Y
         INY
         INY
         TXA
         STA   [$0A],Y
         LDY   #$008F
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L0718BF
         PHY
         LDY   #$0087
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         LDY   #$008F
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         PEA   $0000
         PEI   $0A
         JSL   L1A00E7
         PLA
         LSR
         BCS   L1A1793
         PEA   ^L0400D0
         PEA   L0400D0
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $0A
         JSL   L1A00AD
L1A1793  LDY   #$008F
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L07185A
         LDA   #$0000
         TAX
         LDY   #$008D
         STA   [$0A],Y
         INY
         INY
         TXA
         STA   [$0A],Y
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

L1A17C1  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEI   $18
         PEI   $16
         PEI   $14
         PEI   $12
         PEA   $0000
         JSL   L077624
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L1A180A
         PEI   $03
         PEI   $01
         PEA   $0000
         PEI   $0E
         JSL   L1A0215
         PEI   $18
         PEI   $16
         PEI   $14
         PEI   $12
         PEA   $0000
         JSL   L074B81
         PEI   $18
         PEI   $16
         JSL   L077B28
L1A180A  LDA   $0C
         STA   $18
         LDA   $0B
         STA   $17
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L1A181C  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $24
         PEI   $22
         PEA   $0014
         JSL   L0313BE
         LDY   #$0043
         LDA   [$1E],Y
         PHA
         JSL   L075A4F
         LDY   #$0041
         LDA   [$1E],Y
         PHA
         JSL   L075A4F
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PHD
         LDA   $1E
         TCD
         LDA   $4E
         PLD
         PEA   $0000
         PHA
         JSL   L1A00AD
         LDA   $1C
         STA   $24
         LDA   $1B
         STA   $23
         LDA   $19
         TCD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L1A1886  PHD
         TSC
         CLC
         ADC   #$FFB8
         TCS
         TCD
         LDA   L05503D
         BNE   L1A1896
         BRL   L1A1A6B
L1A1896  LDA   L05503D
         PHA
         JSL   L150B5E
         STZ   L05503D
         LDY   #$00C5
         LDA   [$4E],Y
         PHA
         DEY
         DEY
         LDA   [$4E],Y
         PHA
         JSL   L0718BF
         LDY   #$00C1
         LDA   [$4E],Y
         PHA
         DEY
         DEY
         LDA   [$4E],Y
         PHA
         JSL   L0718BF
         LDA   #$0004
         STA   $01
         LDY   #$00C5
         LDA   [$4E],Y
         TAX
         DEY
         DEY
         LDA   [$4E],Y
         STA   $45
         STX   $47
         LDY   #$0002
         LDA   [$45],Y
         TAX
         LDA   [$45]
         STA   $05
         STX   $07
         LDA   #$0001
         STA   $09
         LDA   #$0001
         STA   $0B
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2010
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BEQ   L1A1921
         PEA   ^L0400D7
         PEA   L0400D7
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $4E
         JSL   L1A00AD
L1A1921  LDA   $03
         STA   $43
         LDY   #$00C1
         LDA   [$4E],Y
         TAX
         DEY
         DEY
         LDA   [$4E],Y
         STA   $45
         STX   $47
         LDY   #$0002
         LDA   [$45],Y
         TAX
         LDA   [$45]
         STA   $05
         STX   $07
         LDA   #$0002
         STA   $09
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2010
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BEQ   L1A197D
         PEA   ^L0400DE
         PEA   L0400DE
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $4E
         JSL   L1A00AD
L1A197D  LDA   $03
         STA   $41
         LDY   #$00C5
         LDA   [$4E],Y
         PHA
         DEY
         DEY
         LDA   [$4E],Y
         PHA
         JSL   L07191C
         LDY   #$00C1
         LDA   [$4E],Y
         PHA
         DEY
         DEY
         LDA   [$4E],Y
         PHA
         JSL   L07191C
         LDY   #$00A7
         LDA   [$4E],Y
         PHA
         DEY
         DEY
         LDA   [$4E],Y
         PHA
         JSL   L0718BF
L1A19AE  PHY
         PHY
         PEI   $43
         LDY   #$00A7
         LDA   [$4E],Y
         TAX
         DEY
         DEY
         LDA   [$4E],Y
         STA   $45
         STX   $47
         LDY   #$0002
         LDA   [$45],Y
         TAX
         LDA   [$45]
         PHX
         PHA
         LDY   #$00A3
         LDA   [$4E],Y
         PHA
         DEY
         DEY
         LDA   [$4E],Y
         PHA
         PEA   $0000
         JSL   L075D80
         PLA
         STA   $3B
         PLX
         STX   $3D
         LDAL  L05565D
         BEQ   L1A19EB
         LDA   #$0001
L1A19EB  PHA
         LDX   #$0000
         LDA   #$004C
         CMPL  L05565D
         BEQ   L1A19F9
         INX
L1A19F9  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L1A1A0E
         PEA   ^L0400E5
         PEA   L0400E5
         PEA   $0000
         PHD
         JSL   L1A181C
L1A1A0E  LDAL  L05565D
         STA   $3F
         PHY
         PHY
         PEI   $41
         LDY   #$00A7
         LDA   [$4E],Y
         TAX
         DEY
         DEY
         LDA   [$4E],Y
         STA   $45
         STX   $47
         LDY   #$0002
         LDA   [$45],Y
         TAX
         LDA   [$45]
         PHX
         PHA
         PEI   $3D
         PEI   $3B
         PEA   $0000
         JSL   L075E55
         PLA
         STA   $3B
         PLX
         STX   $3D
         LDAL  L05565D
         BEQ   L1A1A55
         PEA   ^L0400ED
         PEA   L0400ED
         PEA   $0000
         PHD
         JSL   L1A181C
L1A1A55  LDA   #$004C
         CMP   $3F
         BEQ   L1A1A5F
         BRL   L1A19AE
L1A1A5F  PEI   $43
         JSL   L075A4F
         PEI   $41
         JSL   L075A4F
L1A1A6B  LDA   $4C
         STA   $50
         LDA   $4B
         STA   $4F
         LDA   $49
         TCD
         TSC
         CLC
         ADC   #$004E
         TCS
         RTL

L1A1A7D  PHD
         TSC
         CLC
         ADC   #$FFC2
         TCS
         TCD
         STZ   $48
         LDA   L05503D
         BNE   L1A1A8F
         BRL   L1A1BAB
L1A1A8F  PHY
         PHY
         PHY
         LDA   L05503D
         PHA
         JSL   L151065
         JSL   L075B7B
         PLA
         STA   $33
         PLX
         STX   $35
         PHY
         PHY
         JSL   L0A1A87
         PLA
         STA   $37
         PLX
         STX   $39
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0019
         PHA
         LDA   $37
         LDX   $39
         TXY
         LDX   #$002D
         STA   $00,X
         TYA
         STA   $02,X
         PEA   $0000
         TDC
         CLC
         ADC   #$002D
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0023
         PHA
         PEA   $030E
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$0023
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$0015
         PHA
         LDA   $33
         LDX   $35
         TXY
         LDX   #$0015
         STA   $00,X
         TYA
         STA   $02,X
         PEA   $0000
         TDC
         CLC
         ADC   #$0019
         PHA
         PEA   $0306
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$0019
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEA   ^L0400F6
         PEA   L0400F6
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         PEA   $0004
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         JSL   L150018
         PLA
         PLX
         STA   $31
         PEI   $39
         PEI   $37
         LDA   #$C800
         LDX   #$0000
         JSL   L033477
         BEQ   L1A1B97
         BVS   L1A1B8E
         EOR   #$8000
L1A1B8E  BPL   L1A1B97
         LDA   #$0001
         STA   $48
         BRA   L1A1BAB
L1A1B97  LDA   $31
         SEC
         SBC   #$000A
         BEQ   L1A1BAB
         BVS   L1A1BA4
         EOR   #$8000
L1A1BA4  BPL   L1A1BAB
         LDA   #$0001
         STA   $48
L1A1BAB  LDA   $42
         STA   $46
         LDA   $41
         STA   $45
         LDA   $3F
         TCD
         TSC
         CLC
         ADC   #$0044
         TCS
         RTL

L1A1BBD  PHD
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
         PEI   $26
         PEI   $24
         PEA   $0014
         JSL   L0313BE
         LDAL  L05565D
         STA   $15
         LDY   #$001B
         LDA   [$20],Y
         BEQ   L1A1BF0
         LDY   #$001B
         LDA   [$20],Y
         PHA
         JSL   L150B5E
L1A1BF0  LDY   #$001D
         LDA   [$20],Y
         BEQ   L1A1C01
         LDY   #$001D
         LDA   [$20],Y
         PHA
         JSL   L150B5E
L1A1C01  PEA   ^L0719BA
         PEA   L0719BA
         PEA   $801E
         PEA   $0000
         JSL   L1515C8
         PEA   ^L0719BA
         PEA   L0719BA
         PEA   $801F
         PEA   $0000
         JSL   L1515C8
         PHY
         PHY
         JSL   L1515C2
         PEA   $801E
         PEA   $0001
         JSL   L1515C8
         PHY
         PHY
         JSL   L1515C2
         PEA   $801F
         PEA   $0001
         JSL   L1515C8
         LDA   #$0019
         CLC
         ADC   $20
         LDX   $22
         BCC   L1A1C4C
         INX
L1A1C4C  STA   $17
         STX   $19
         PHY
         LDY   #$0019
         LDA   [$20],Y
         PHA
         JSL   L1506E1
         PLA
         STA   [$17]
         LDY   #$002A
         LDA   [$20],Y
         TAX
         DEY
         DEY
         LDA   [$20],Y
         CLC
         ADC   #$00C3
         BCC   L1A1C6F
         INX
L1A1C6F  STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         PHX
         PHA
         JSL   L0718BF
         PHY
         PEA   $0003
         PEA   $0000
         PEA   $0000
         LDY   #$002A
         LDA   [$20],Y
         TAX
         DEY
         DEY
         LDA   [$20],Y
         CLC
         ADC   #$00C3
         BCC   L1A1C9C
         INX
L1A1C9C  STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         PHX
         PHA
         JSL   L150B64
         PLA
         STA   L05503D
         LDY   #$002A
         LDA   [$20],Y
         TAX
         DEY
         DEY
         LDA   [$20],Y
         CLC
         ADC   #$00C3
         BCC   L1A1CCF
         INX
L1A1CCF  STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         PHX
         PHA
         JSL   L07191C
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   $15
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PHD
         LDA   $20
         TCD
         LDA   $28
         PLD
         PEA   $0000
         PHA
         JSL   L1A00AD
         LDA   $1E
         STA   $26
         LDA   $1D
         STA   $25
         LDA   $1B
         TCD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L1A1D19  PHD
         TSC
         CLC
         ADC   #$FFDE
         TCS
         TCD
         LDA   L05503D
         BNE   L1A1D29
         BRL   L1A2002
L1A1D29  LDA   L05503D
         PHA
         JSL   L150B5E
         STZ   L05503D
         PHY
         PHY
         JSL   L1515C2
         PEA   $801E
         PEA   $0000
         JSL   L1515C8
         PHY
         PHY
         JSL   L1515C2
         PEA   $801F
         PEA   $0000
         JSL   L1515C8
         PEA   ^L0719BA
         PEA   L0719BA
         PEA   $801E
         PEA   $0001
         JSL   L1515C8
         PEA   ^L0719BA
         PEA   L0719BA
         PEA   $801F
         PEA   $0001
         JSL   L1515C8
         PHY
         PEA   $0001
         JSL   L1506E1
         PLA
         STA   $19
         STZ   $1D
         STZ   $1B
         LDY   #$00C5
         LDA   [$28],Y
         PHA
         DEY
         DEY
         LDA   [$28],Y
         PHA
         JSL   L0718BF
         LDY   #$00C1
         LDA   [$28],Y
         PHA
         DEY
         DEY
         LDA   [$28],Y
         PHA
         JSL   L0718BF
         PHY
         PEA   $0001
         PEA   $0000
         PEA   $0000
         LDY   #$00C5
         LDA   [$28],Y
         TAX
         DEY
         DEY
         LDA   [$28],Y
         STA   $1F
         STX   $21
         LDY   #$0002
         LDA   [$1F],Y
         TAX
         LDA   [$1F]
         PHX
         PHA
         JSL   L150B64
         PLA
         STA   $1D
         LDAL  L05565D
         BEQ   L1A1DDE
         PEA   ^L040100
         PEA   L040100
         PEA   $0000
         PHD
         JSL   L1A1BBD
L1A1DDE  PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDY   #$00C1
         LDA   [$28],Y
         TAX
         DEY
         DEY
         LDA   [$28],Y
         STA   $1F
         STX   $21
         LDY   #$0002
         LDA   [$1F],Y
         TAX
         LDA   [$1F]
         PHX
         PHA
         JSL   L150B82
         LDAL  L05565D
         BEQ   L1A1E1A
         PEA   ^L040108
         PEA   L040108
         PEA   $0000
         PHD
         JSL   L1A1BBD
L1A1E1A  PHY
         PEA   $0003
         PEA   $0000
         PEA   $0000
         LDY   #$00C1
         LDA   [$28],Y
         TAX
         DEY
         DEY
         LDA   [$28],Y
         STA   $1F
         STX   $21
         LDY   #$0002
         LDA   [$1F],Y
         TAX
         LDA   [$1F]
         PHX
         PHA
         JSL   L150B64
         PLA
         STA   $1B
         LDAL  L05565D
         BEQ   L1A1E57
         PEA   ^L040112
         PEA   L040112
         PEA   $0000
         PHD
         JSL   L1A1BBD
L1A1E57  LDY   #$00C5
         LDA   [$28],Y
         PHA
         DEY
         DEY
         LDA   [$28],Y
         PHA
         JSL   L07191C
         LDY   #$00C1
         LDA   [$28],Y
         PHA
         DEY
         DEY
         LDA   [$28],Y
         PHA
         JSL   L07191C
         LDY   #$00A7
         LDA   [$28],Y
         PHA
         DEY
         DEY
         LDA   [$28],Y
         PHA
         JSL   L07185A
         PEI   $1D
         JSL   L150B70
         PHY
         JSL   L15138B
         PLA
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L1A1E9D
         EOR   #$8000
L1A1E9D  BMI   L1A1EA2
         BRL   L1A1FAC
L1A1EA2  LDA   #$0001
         STA   $17
L1A1EA7  PHY
         PEI   $17
         JSL   L1502DC
         PLA
         STA   $15
         PHY
         PHY
         PEI   $15
         JSL   L150BAC
         PLA
         STA   $03
         PLX
         STX   $05
         PEI   $05
         PEI   $03
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L1A1ED2
         EOR   #$8000
L1A1ED2  BMI   L1A1ED7
         BRL   L1A1FA1
L1A1ED7  LDA   #$0001
         LDX   #$0000
         STA   $11
         STX   $13
L1A1EE1  JSL   L072328
         PHY
         PHY
         PEI   $15
         PEI   $13
         PEI   $11
         JSL   L150416
         PLA
         STA   $0D
         PLX
         STX   $0F
         PHY
         PHY
         PEI   $15
         PEI   $0F
         PEI   $0D
         JSL   L15041C
         PLA
         STA   $09
         PLX
         STX   $0B
         LDAL  L05565D
         BEQ   L1A1F1D
         PEA   ^L04011A
         PEA   L04011A
         PEA   $0000
         PHD
         JSL   L1A1BBD
L1A1F1D  PHY
         PEI   $15
         PEI   $0F
         PEI   $0D
         JSL   L150D3E
         PLA
         STA   $07
         PEI   $15
         PEI   $0F
         PEI   $0D
         JSL   L150410
         PEI   $1B
         JSL   L150B70
         PEI   $0B
         PEI   $09
         PEI   $07
         PEI   $15
         PEI   $0F
         PEI   $0D
         JSL   L150422
         LDAL  L05565D
         BEQ   L1A1F5F
         PEA   ^L040125
         PEA   L040125
         PEA   $0000
         PHD
         JSL   L1A1BBD
L1A1F5F  PEI   $1B
         JSL   L150B7C
         LDAL  L05565D
         BEQ   L1A1F79
         PEA   ^L040131
         PEA   L040131
         PEA   $0000
         PHD
         JSL   L1A1BBD
L1A1F79  PEA   $FFFF
         PEI   $15
         PEI   $0F
         PEI   $0D
         JSL   L1510BF
         PEI   $1D
         JSL   L150B70
         LDA   $11
         LDX   $13
         CMP   $03
         BNE   L1A1F96
         CPX   $05
L1A1F96  BEQ   L1A1FA1
         INC   $11
         BNE   L1A1F9E
         INC   $13
L1A1F9E  BRL   L1A1EE1
L1A1FA1  LDA   $17
         CMP   $01
         BEQ   L1A1FAC
         INC   $17
         BRL   L1A1EA7
L1A1FAC  PEI   $1B
         JSL   L150B5E
         PEI   $1D
         JSL   L150B5E
         PHY
         PEI   $19
         JSL   L1506E1
         PLA
         STA   $19
         PEA   ^L0719BA
         PEA   L0719BA
         PEA   $801E
         PEA   $0000
         JSL   L1515C8
         PEA   ^L0719BA
         PEA   L0719BA
         PEA   $801F
         PEA   $0000
         JSL   L1515C8
         PHY
         PHY
         JSL   L1515C2
         PEA   $801E
         PEA   $0001
         JSL   L1515C8
         PHY
         PHY
         JSL   L1515C2
         PEA   $801F
         PEA   $0001
         JSL   L1515C8
L1A2002  LDA   $26
         STA   $2A
         LDA   $25
         STA   $29
         LDA   $23
         TCD
         TSC
         CLC
         ADC   #$0028
         TCS
         RTL

L1A2014  ENT
         PHD
         TSC
         CLC
         ADC   #$FF2A
         TCS
         TCD
         LDA   L055051
         BEQ   L1A2028
         JSL   L0903A6
         BRL   L1A2872
L1A2028  JSL   L0903F2
         PEA   $0001
         PEA   $0000
         JSL   L090000
         STZ   $A5
         STZ   $A7
         STZ   $8D
         STZ   $8F
         STZ   $C3
         STZ   $C5
         STZ   $BF
         STZ   $C1
         LDA   L054FA1
         STA   $C7
         JSL   L072328
         LDA   L05503D
         BEQ   L1A206B
         PHY
         PHY
         PHY
         LDA   L05503D
         PHA
         JSL   L151065
         JSL   L075B7B
         PLA
         STA   $CF
         PLX
         STX   $D1
         BRA   L1A206F
L1A206B  STZ   $CF
         STZ   $D1
L1A206F  LDAL  L053AB3
         PHA
         LDAL  L053AB1
         PHA
         LDAL  L053AD7
         TAX
         LDAL  L053AD5
         JSL   L1512A5
         PEI   $D1
         PEI   $CF
         JSL   L150F53
         STA   $CB
         STX   $CD
         PEI   $CD
         PEI   $CB
         PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L0752E6
         PLA
         PLX
         SEC
         SBC   #$1000
         BCS   L1A20AD
         DEX
L1A20AD  JSL   L033477
         BEQ   L1A20C4
         BVS   L1A20B8
         EOR   #$8000
L1A20B8  BPL   L1A20C4
         PEA   $0005
         JSL   L0727E0
         BRL   L1A286C
L1A20C4  PEA   $0000
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L077086
         PHY
         PHY
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L070525
         PLA
         STA   $C3
         PLX
         STX   $C5
         STZ   $BF
         STZ   $C1
         LDAL  L053AB3
         PHA
         LDAL  L053AB1
         PHA
         LDAL  L053AD7
         TAX
         LDAL  L053AD5
         JSL   L1512A5
         STA   $B9
         STX   $BB
         LDA   #$0001
         STA   $C9
L1A210B  PHY
         PHY
         PEA   ^L04013F
         PEA   L04013F
         PEA   $0000
         TDC
         CLC
         ADC   #$0005
         PHA
         LDA   $C9
         JSL   L150488
         PHX
         PHA
         PEA   $0002
         JSL   L07334A
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         JSL   L0735A8
         PLA
         STA   $BF
         PLX
         STX   $C1
         LDY   #$0002
         LDA   [$BF],Y
         PHA
         LDA   [$BF]
         PHA
         JSL   L075B09
         LDY   #$0002
         LDA   [$BF],Y
         PHA
         LDA   [$BF]
         PHA
         PEA   $0055
         PEA   $0000
         PEA   $0001
         PEA   $0005
         PEI   $BB
         PEI   $B9
         PEI   $D1
         PEI   $CF
         JSL   L075A86
         LDAL  L05565D
         BNE   L1A218D
         PHY
         LDY   #$0002
         LDA   [$BF],Y
         PHA
         LDA   [$BF]
         PHA
         PEA   $0000
         JSL   L075D3B
         PLA
         STA   $BD
L1A218D  LDAL  L05565D
         BEQ   L1A21AF
         LDA   #$0014
         CMP   $C9
         BEQ   L1A219F
         INC   $C9
         BRL   L1A210B
L1A219F  LDAL  L05565D
         BEQ   L1A21AF
         PEA   $0006
         JSL   L0727E0
         BRL   L1A286C
L1A21AF  PEA   $0000
         PHD
         JSL   L1A06A8
         LDA   #$0003
         STA   $B7
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         LDA   #$010E
         LDX   #$0000
         JSL   L033477
         BEQ   L1A21DE
         BVS   L1A21D7
         EOR   #$8000
L1A21D7  BPL   L1A21DE
         LDA   #$0004
         STA   $B7
L1A21DE  LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         LDA   #$032A
         LDX   #$0000
         JSL   L033477
         BEQ   L1A2200
         BVS   L1A21F9
         EOR   #$8000
L1A21F9  BPL   L1A2200
         LDA   #$0005
         STA   $B7
L1A2200  LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         LDA   #$097E
         LDX   #$0000
         JSL   L033477
         BEQ   L1A2222
         BVS   L1A221B
         EOR   #$8000
L1A221B  BPL   L1A2222
         LDA   #$0006
         STA   $B7
L1A2222  LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         LDA   #$1C7A
         LDX   #$0000
         JSL   L033477
         BEQ   L1A2244
         BVS   L1A223D
         EOR   #$8000
L1A223D  BPL   L1A2244
         LDA   #$0007
         STA   $B7
L1A2244  PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$0003
         PHA
         PEI   $B1
         LDA   $B7
         INC
         JSL   L150BEE
         LDA   $AD
         JSL   L150BEE
         PLA
         LDX   #$0017
         STA   $00,X
         PEA   $0000
         TDC
         CLC
         ADC   #$0017
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$000D
         PHA
         PEA   $040E
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$000D
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDA   $B5
         INC
         PEA   $0021
         JSL   L150BEE
         PLA
         LDX   #$0001
         STA   $00,X
         PEA   $0000
         TDC
         CLC
         ADC   #$0003
         PHA
         PEA   $0406
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$0003
         PHA
         JSL   L1514B4
         PLA
         PLX
         STA   $B3
         LDA   $B3
         SEC
         SBC   #$0001
         BVS   L1A22D8
         EOR   #$8000
L1A22D8  BMI   L1A22DF
         LDA   #$0001
         STA   $B3
L1A22DF  LDA   $B3
         SEC
         SBC   #$0010
         BEQ   L1A22F3
         BVS   L1A22EC
         EOR   #$8000
L1A22EC  BPL   L1A22F3
         LDA   #$0010
         STA   $B3
L1A22F3  LDA   #$0800
         STA   $AB
         LDA   $B3
         SEC
         SBC   $B1
         BEQ   L1A236D
         BVS   L1A2304
         EOR   #$8000
L1A2304  BPL   L1A236D
         PEI   $CD
         PEI   $CB
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         PEA   $0000
         PEA   $0004
         JSL   L150D50
         LDA   $B3
         SEC
         SBC   $B1
         JSL   L150488
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $CB
         STX   $CD
         PEI   $CD
         PEI   $CB
         PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L0752E6
         LDA   $B9
         LDX   $BB
         JSL   L150F53
         SEC
         SBC   #$1000
         BCS   L1A2355
         DEX
L1A2355  JSL   L033477
         BEQ   L1A236D
         BVS   L1A2360
         EOR   #$8000
L1A2360  BPL   L1A236D
         PEA   $0005
         PEA   $0000
         PHD
         JSL   L1A0000
L1A236D  PEA   $0000
         PHD
         JSL   L1A04A0
         PEA   $0000
         JSL   L07479E
         LDAL  L053AB3
         PHA
         LDAL  L053AB1
         PHA
         LDAL  L053AD7
         TAX
         LDAL  L053AD5
         JSL   L1512A5
         PEI   $D1
         PEI   $CF
         JSL   L150F53
         STA   $CB
         STX   $CD
         LDA   $B3
         SEC
         SBC   $B1
         BEQ   L1A23DB
         BVS   L1A23AB
         EOR   #$8000
L1A23AB  BPL   L1A23DB
         PEI   $CD
         PEI   $CB
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         PEA   $0000
         PEA   $0004
         JSL   L150D50
         LDA   $B3
         SEC
         SBC   $B1
         JSL   L150488
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $CB
         STX   $CD
L1A23DB  PEI   $CD
         PEI   $CB
         PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L0752E6
         LDA   $B9
         LDX   $BB
         JSL   L150F53
         SEC
         SBC   #$1000
         BCS   L1A23FC
         DEX
L1A23FC  JSL   L033477
         BEQ   L1A2414
         BVS   L1A2407
         EOR   #$8000
L1A2407  BPL   L1A2414
         PEA   $0005
         PEA   $0000
         PHD
         JSL   L1A0000
L1A2414  LDAL  L053ABF
         TAX
         LDAL  L053ABD
         INC
         BNE   L1A2421
         INX
L1A2421  PEA   $0000
         PEA   $0080
         JSL   L150D50
         PLA
         STA   $89
         PLX
         STX   $8B
         LDA   $89
         LDX   $8B
         PEA   $0000
         PEA   $0004
         JSL   L150D50
         PLA
         STA   $85
         PLX
         STX   $87
         PHY
         PHY
         PEI   $87
         PEI   $85
         LDA   L054FBD
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $8D
         PLX
         STX   $8F
         LDAL  L05565D
         BEQ   L1A2473
         PEA   $0049
         PEA   $0000
         PHD
         JSL   L1A0000
L1A2473  LDY   #$0002
         LDA   [$8D],Y
         PHA
         LDA   [$8D]
         PHA
         PEI   $87
         PEI   $85
         JSL   L071EC5
         LDAL  L053AB7
         PHA
         LDAL  L053AB5
         PHA
         PEA   $0000
         PEA   $0020
         LDY   #$0002
         LDA   [$8D],Y
         PHA
         LDA   [$8D]
         PHA
         PEA   $0000
         JSL   L077D97
         PEI   $8F
         PEI   $8D
         JSL   L07191C
         PEA   $0000
         JSL   L15000C
         JSL   L15059E
         PHY
         PHY
         PEA   $0000
         PEA   $9C40
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $91
         PLX
         STX   $93
         LDAL  L05565D
         BEQ   L1A24E7
         PEA   $0049
         PEA   $0000
         PHD
         JSL   L1A0000
L1A24E7  PHY
         PHY
         JSL   L15042E
         PLA
         STA   $A1
         PLX
         STX   $A3
         PEI   $A3
         PEI   $A1
         LDA   #$0000
         LDX   #$0002
         JSL   L033477
         BEQ   L1A2514
         BVS   L1A2508
         EOR   #$8000
L1A2508  BPL   L1A2514
         LDA   #$0000
         LDX   #$0002
         STA   $A1
         STX   $A3
L1A2514  PEI   $A3
         PEI   $A1
         LDA   #$2000
         LDX   #$0000
         JSL   L033477
         BVS   L1A2527
         EOR   #$8000
L1A2527  BMI   L1A2533
         LDA   #$2000
         LDX   #$0000
         STA   $A1
         STX   $A3
L1A2533  PHY
         PHY
         PEA   $FFFF
         PEA   $FC00
         PEI   $A3
         PEI   $A1
         JSL   L15017E
         PLA
         STA   $A1
         PLX
         STX   $A3
         PHY
         PHY
         PEI   $A3
         PEI   $A1
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $A5
         PLX
         STX   $A7
         LDAL  L05565D
         BEQ   L1A257F
         PEI   $93
         PEI   $91
         JSL   L07185A
         PEA   $0049
         PEA   $0000
         PHD
         JSL   L1A0000
L1A257F  PEI   $93
         PEI   $91
         JSL   L07185A
         STZ   $9D
         STZ   $9F
         LDAL  L053AB7
         TAX
         LDAL  L053AB5
         PEI   $87
         PEI   $85
         JSL   L150F53
         STA   $99
         STX   $9B
         LDA   $99
         LDX   $9B
         STA   $95
         STX   $97
         PEI   $BD
         PEI   $BB
         PEI   $B9
         JSL   L075DD3
         LDAL  L05565D
         BEQ   L1A25D4
         PEA   ^L04014A
         PEA   L04014A
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         PEI   $BB
         PEI   $B9
         PEA   $0000
         PHD
         JSL   L1A00AD
L1A25D4  PEA   $0000
         PHD
         JSL   L1A08B2
         PHY
         PHY
         PEA   $0000
         PHD
         JSL   L1A0A20
         PLA
         STA   $81
         PLX
         STX   $83
         PEA   $0000
         PHD
         JSL   L1A1115
         PEA   $0000
         PHD
         JSL   L1A1315
         LDAL  L053AEF
         PHA
         LDAL  L053AED
         PHA
         PEA   $444C
         PEA   $4957
         PEA   $0000
         PHD
         JSL   L1A17C1
         LDAL  L053AF3
         PHA
         LDAL  L053AF1
         PHA
         PEA   $444C
         PEA   $4957
         PEA   $0000
         PHD
         JSL   L1A17C1
         LDAL  L053AF7
         PHA
         LDAL  L053AF5
         PHA
         PEA   $444C
         PEA   $4957
         PEA   $0000
         PHD
         JSL   L1A17C1
         LDAL  L053AFB
         PHA
         LDAL  L053AF9
         PHA
         PEA   $444C
         PEA   $4957
         PEA   $0000
         PHD
         JSL   L1A17C1
         PEA   $0000
         PHD
         JSL   L1A0169
         PEA   $0000
         PHD
         JSL   L1A1493
         LDA   $99
         LDX   $9B
         STA   $7D
         STX   $7F
         PEI   $BD
         PEI   $7F
         PEI   $7D
         JSL   L075DD3
         LDAL  L05565D
         BEQ   L1A26A0
         PEA   ^L040152
         PEA   L040152
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         PEI   $7F
         PEI   $7D
         PEA   $0000
         PHD
         JSL   L1A00AD
L1A26A0  PEA   $0000
         PHD
         JSL   L1A152E
         PEA   $0000
         PHD
         JSL   L1A1719
         PEI   $BD
         JSL   L075A4F
         LDAL  L05565D
         BEQ   L1A26DA
         PEA   ^L04015A
         PEA   L04015A
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L1A00AD
L1A26DA  JSL   L077AA5
         LDA   L055231
         BNE   L1A26EF
         PHY
         PEA   $0000
         PHD
         JSL   L1A1A7D
         PLA
         BEQ   L1A26F9
L1A26EF  PEA   $0000
         PHD
         JSL   L1A1D19
         BRA   L1A2701
L1A26F9  PEA   $0000
         PHD
         JSL   L1A1886
L1A2701  PEI   $A7
         PEI   $A5
         JSL   L07185A
         STZ   $A5
         STZ   $A7
         LDA   L055047
         PHA
         JSL   L075A4F
         LDA   #$0006
         STA   $37
         LDY   #$0002
         LDA   [$C3],Y
         TAX
         LDA   [$C3]
         STA   $39
         STX   $3B
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         PEA   $2006
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BNE   L1A27AC
         TDC
         CLC
         ADC   #$006B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0047
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDY   #$0002
         LDA   [$BF],Y
         TAX
         LDA   [$BF]
         STA   $39
         STX   $3B
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         PEA   $2006
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BNE   L1A27AC
         TDC
         CLC
         ADC   #$0047
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$006B
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         PEA   $2005
         JSL   GSOS2
         STAL  L05565D
L1A27AC  LDY   #$0002
         LDA   [$C3],Y
         PHA
         LDA   [$C3]
         PHA
         JSL   L075B09
         LDAL  L05565D
         BEQ   L1A27C2
         BRL   L1A285C
L1A27C2  LDY   #$0002
         LDA   [$BF],Y
         PHA
         LDA   [$BF]
         PHA
         LDY   #$0002
         LDA   [$C3],Y
         PHA
         LDA   [$C3]
         PHA
         JSL   L075A0C
         PHY
         LDY   #$0002
         LDA   [$C3],Y
         PHA
         LDA   [$C3]
         PHA
         PEA   $0000
         JSL   L075D3B
         PLA
         STA   L055047
         LDAL  L05565D
         BEQ   L1A2800
         LDA   #$01F4
         CLC
         ADCL  L05565D
         PHA
         JSL   L07272E
L1A2800  PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0600
         PEA   ^L053A9D
         PEA   L053A9D
         PEA   $0000
         JSL   L077D97
         LDA   $7B
         BEQ   L1A282B
         PEA   ^L053AB5
         PEA   L053AB5
         PEI   $79
         PEI   $77
         JSL   L077E22
L1A282B  LDA   $77
         LDX   $79
         STAL  L053AA9
         TXA
         STAL  L053AAB
         PHY
         PEA   $0003
         PEA   $0000
         PEA   $0000
         LDY   #$0002
         LDA   [$C3],Y
         PHA
         LDA   [$C3]
         PHA
         JSL   L150B64
         PLA
         STA   L05503D
         LDAL  L05565D
         BEQ   L1A285C
         STZ   L05503D
L1A285C  PEI   $C5
         PEI   $C3
         JSL   L07185A
         PEI   $C1
         PEI   $BF
         JSL   L07185A
L1A286C  PEI   $C7
         JSL   L0724F7
L1A2872  TSC
         CLC
         ADC   #$00D6
         TCS
         PLD
         RTL


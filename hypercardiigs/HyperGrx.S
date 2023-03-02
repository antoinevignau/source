*
* HypercardGS
* segment: $08 HyperGrx
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HyperGrx.l
         lst   off

*---------------------------------------

         use   HyperGrx.E
         use   HyperGrx.X

         use   4/Ctl.Macs
         use   4/Desk.Macs
         use   4/Dialog.Macs
         use   4/Event.Macs
         use   4/Font.Macs
         use   4/Int.Macs
         use   4/Line.Macs
         use   4/List.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/MidiSyn.Macs
         use   4/Misc.Macs
         use   4/Qd.Macs
         use   4/QdAux.Macs
         use   4/Resource.Macs
         use   4/Sound.Macs
         use   4/Std.Macs
         use   4/Text.Macs
         use   4/TextEdit.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*---------------------------------------

L080000  PHB
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
         ADC   $01
         STA   $01
         LDA   #$FFF5
         SEC
         SBC   $01
         STAL  L0800E1+1
         LDA   $0D
         LSR
         LSR
         LSR
         LSR
         STA   $03
         SEC
         LDA   $15
         SBC   $11
         STA   $15
         BCS   L080031
         DEC   $17
L080031  SEC
         LDA   $19
         SBC   $11
         STA   $19
         BCS   L08003C
         DEC   $1B
L08003C  LDY   $11
         PEI   $12
         PLB
         PLB
L080042  LDX   $03
         BNE   L080049
         BRL   L0800E1
L080049  LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         ORA   [$19],Y
         STA   |$0000,Y
         INY
         INY
         DEX
         BMI   L0800E4
         BEQ   L0800E1
         BRL   L080049
L0800E1  BRL   L0800E1
L0800E4  DEC   $0F
         BEQ   L0800F0
         TYA
         CLC
         ADC   $0B
         TAY
         BRL   L080042
L0800F0  LDA   $09
         STA   $1B
         LDA   $07
         STA   $19
         LDX   $05
         TDC
         CLC
         ADC   #$0018
         TCS
         TXA
         TCD
         PLB
         RTL

L080104  PHB
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
         ADC   $01
         ASL
         ADC   $01
         STA   $01
         LDA   #$FFF5
         SEC
         SBC   $01
         STAL  L080212+1
         LDA   $0D
         LSR
         LSR
         LSR
         LSR
         STA   $03
         SEC
         LDA   $19
         SBC   $11
         STA   $19
         BCS   L080137
         DEC   $1B
L080137  SEC
         LDA   $15
         SBC   $11
         STA   $15
         BCS   L080142
         DEC   $17
L080142  SEC
         LDA   $1D
         SBC   $11
         STA   $1D
         BCS   L08014D
         DEC   $1F
L08014D  LDY   $11
         PEI   $12
         PLB
         PLB
L080153  LDX   $03
         BNE   L08015A
         BRL   L080212
L08015A  LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$1D],Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         DEX
         BMI   L080215
         BEQ   L080212
         BRL   L08015A
L080212  BRL   L080212
L080215  DEC   $0F
         BEQ   L080221
         TYA
         CLC
         ADC   $0B
         TAY
         BRL   L080153
L080221  LDA   $09
         STA   $1F
         LDA   $07
         STA   $1D
         LDX   $05
         TDC
         CLC
         ADC   #$001C
         TCS
         TXA
         TCD
         PLB
         RTL

L080235  PHB
         PHD
         PHY
         PHY
         TSC
         TCD
         LDA   $0D
         AND   #$000F
         STA   $01
         ASL
         ADC   $01
         ASL
         ASL
         STA   $01
         LDA   #$FFF5
         SEC
         SBC   $01
         STAL  L080346+1
         LDA   $0D
         LSR
         LSR
         LSR
         LSR
         STA   $03
         SEC
         LDA   $19
         SBC   $11
         STA   $19
         BCS   L080266
         DEC   $1B
L080266  SEC
         LDA   $15
         SBC   $11
         STA   $15
         BCS   L080271
         DEC   $17
L080271  LDY   $11
         PEI   $12
         PLB
         PLB
L080277  LDX   $03
         BNE   L08027E
         BRL   L080346
L08027E  LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   |$0000,Y
         ORA   [$19],Y
         AND   [$15],Y
         STA   |$0000,Y
         INY
         INY
         DEX
         BMI   L080349
         BEQ   L080346
         BRL   L08027E
L080346  BRL   L080346
L080349  DEC   $0F
         BEQ   L080355
         TYA
         CLC
         ADC   $0B
         TAY
         BRL   L080277
L080355  LDA   $09
         STA   $1B
         LDA   $07
         STA   $19
         LDX   $05
         TDC
         CLC
         ADC   #$0018
         TCS
         TXA
         TCD
         PLB
         RTL

L080369  PHB
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
         ADC   $01
         STA   $01
         LDA   #$FFF4
         SEC
         SBC   $01
         STAL  L080468+1
         LDA   $0F
         LSR
         LSR
         LSR
         LSR
         STA   $03
         SEC
         LDA   $17
         SBC   $13
         STA   $17
         BCS   L08039D
         DEC   $19
L08039D  LDY   $13
         PEI   $14
         PLB
         PLB
         LDX   #$FFFF
L0803A6  LDA   $03
         STA   $05
         BNE   L0803AF
         BRL   L080468
L0803AF  TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         TXA
         EOR   [$17],Y
         AND   |$0000,Y
         STA   |$0000,Y
         INY
         INY
         DEC   $05
         BMI   L08046B
         BEQ   L080468
         BRL   L0803AF
L080468  BRL   L080468
L08046B  DEC   $11
         BEQ   L080477
         TYA
         CLC
         ADC   $0D
         TAY
         BRL   L0803A6
L080477  LDA   $0B
         STA   $19
         LDA   $09
         STA   $17
         LDX   $07
         TDC
         CLC
         ADC   #$0016
         TCS
         TXA
         TCD
         PLB
         RTL

L08048B  PHB
         PHD
         PHY
         PHY
         TSC
         TCD
         LDA   $0D
         AND   #$000F
         STA   $01
         ASL
         ADC   $01
         ASL
         ADC   $01
         STA   $01
         LDA   #$FFF5
         SEC
         SBC   $01
         STAL  L080542+1
         LDA   $0D
         LSR
         LSR
         LSR
         LSR
         STA   $03
         SEC
         LDA   $15
         SBC   $11
         STA   $15
         BCS   L0804BD
         DEC   $17
L0804BD  LDY   $11
         PEI   $12
         PLB
         PLB
L0804C3  LDX   $03
         BNE   L0804CA
         BRL   L080542
L0804CA  LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         LDA   [$15],Y
         STA   |$0000,Y
         INY
         INY
         DEX
         BMI   L080545
         BEQ   L080542
         BRL   L0804CA
L080542  BRL   L080542
L080545  DEC   $0F
         BEQ   L080551
         TYA
         CLC
         ADC   $0B
         TAY
         BRL   L0804C3
L080551  LDA   $09
         STA   $17
         LDA   $07
         STA   $15
         LDX   $05
         TDC
         CLC
         ADC   #$0014
         TCS
         TXA
         TCD
         PLB
         RTL

L080565  PHB
         PHD
         PHY
         PHY
         TSC
         TCD
         LDA   $0D
         AND   #$001F
         STA   $01
         ASL
         ADC   $01
         STA   $01
         LDA   #$FFED
         SEC
         SBC   $01
         STAL  L080619+1
         LDA   $0D
         LSR
         LSR
         LSR
         LSR
         LSR
         STA   $03
         LDA   $0D
         ASL
         AND   #$FFC0
         STA   $01
         LDA   #$0060
         SEC
         SBC   $01
         STA   $0B
         LDY   $13
         PEI   $14
         PLB
         PLB
L0805A0  LDX   $03
         BNE   L0805A7
         BRL   L080617
L0805A7  LDA   $11
         STA   |$003E,Y
         STA   |$003C,Y
         STA   |$003A,Y
         STA   |$0038,Y
         STA   |$0036,Y
         STA   |$0034,Y
         STA   |$0032,Y
         STA   |$0030,Y
         STA   |$002E,Y
         STA   |$002C,Y
         STA   |$002A,Y
         STA   |$0028,Y
         STA   |$0026,Y
         STA   |$0024,Y
         STA   |$0022,Y
         STA   |$0020,Y
         STA   |$001E,Y
         STA   |$001C,Y
         STA   |$001A,Y
         STA   |$0018,Y
         STA   |$0016,Y
         STA   |$0014,Y
         STA   |$0012,Y
         STA   |$0010,Y
         STA   |$000E,Y
         STA   |$000C,Y
         STA   |$000A,Y
         STA   |$0008,Y
         STA   |$0006,Y
         STA   |$0004,Y
         STA   |$0002,Y
         STA   |$0000,Y
         TYA
         CLC
         ADC   #$0040
         TAY
         DEX
         BMI   L08061C
         BEQ   L080617
         BRL   L0805A7
L080617  LDA   $11
L080619  BRL   L080617
L08061C  DEC   $0F
         BEQ   L080628
         TYA
         CLC
         ADC   $0B
         TAY
         BRL   L0805A0
L080628  LDA   $09
         STA   $15
         LDA   $07
         STA   $13
         LDX   $05
         TDC
         CLC
         ADC   #$0012
         TCS
         TXA
         TCD
         PLB
         RTL

L08063C  PHD
         TSC
         TCD
         STZ   $0C
         STZ   $0A
         LDY   #$7CFE
L080646  LDA   [$06],Y
         INC
         BEQ   L080678
         DEC
         BNE   L080658
         LDA   $0A
         CLC
         ADC   #$0004
         STA   $0A
         BRA   L080678
L080658  TAX
         AND   #$F000
         BNE   L080660
         INC   $0A
L080660  TXA
         AND   #$0F00
         BNE   L080668
         INC   $0A
L080668  TXA
         AND   #$00F0
         BNE   L080670
         INC   $0A
L080670  TXA
         AND   #$000F
         BNE   L080678
         INC   $0A
L080678  DEY
         DEY
         BPL   L080646
         LDA   $04
         STA   $08
         LDA   $03
         STA   $07
         TDC
         TCS
         PLD
         PLY
         PLY
         RTL

L08068A  PHD
         TSC
         TCD
         LDY   $06
         DEY
         DEY
         LDX   #$0000
L080694  LDA   [$0C],Y
         CMP   [$08],Y
         BEQ   L08069B
         INX
L08069B  DEY
         DEY
         BPL   L080694
         STX   $10
         LDA   $04
         STA   $0E
         LDA   $03
         STA   $0D
         TDC
         TCS
         PLD
         CLC
         ADC   #$000C
         TCS
         RTL

L0806B2  PHD
         TSC
         TCD
         LDY   $06
         DEY
         DEY
         LDX   #$0000
L0806BC  LDA   [$08],Y
         BEQ   L0806C1
         INX
L0806C1  DEY
         DEY
         BPL   L0806BC
         STX   $0C
         LDA   $04
         STA   $0A
         LDA   $03
         STA   $09
         TDC
         TCS
         PLD
         PLY
         PLY
         PLY
         RTL

L0806D6  PHD
         TSC
         SEC
         SBC   #$0012
         TCD
         TCS
         LDA   [$1A]
         STA   $01
         LDY   #$0002
         LDA   [$1A],Y
         STA   $03
         STA   L0550A3
         LDY   #$0002
         LDA   [$01],Y
         STA   L052F3F
         LDY   #$0006
         LDA   [$01],Y
         STA   L052F43
         ORA   L052F3F
         BNE   L080704
         BRL   L0808A5
L080704  STZ   L052F41
         LDA   #$0280
         STA   L052F45
         LDX   #^L052E9F
         LDA   #L052E9F
         STA   $05
         STX   $07
         LDA   #$0007
         STA   $09
L08071C  LDA   $01
         STA   L0550A1
         LDA   $03
         STA   L0550A3
         JSL   L081BAC
         LDA   L052F3F
         STA   $0B
         JSL   L082758
         STA   $0D
L080735  LDA   $0B
         CMP   L05509D
         BCC   L080743
         STA   L05509F
         JSL   L0825D4
L080743  LDA   $09
         ASL
         TAX
         LDA   $0B
         CLC
         ADCL  L0808B8,X
         AND   #$0007
         ASL
         TAX
         LDAL  L0808B8,X
         STA   $11
         CLC
         ADC   $0D
         TAX
         LDA   L05509B
         BPL   L080765
         BRL   L08087E
L080765  BEQ   L08076A
         BRL   L08081F
L08076A  PHB
         PEI   $1F
         PLB
         PLB
         LDY   $11
         LDA   #$0003
         STA   $0F
         CLC
L080777  LDA   #$0000
         SEP   #$20
         LDA   [$05],Y
         BNE   L080785
         LDA   |$0000,X
         BRA   L080791
L080785  LDAL  $E12000,X
         EOR   |$0000,X
         AND   [$05],Y
         EOR   |$0000,X
L080791  STAL  $E12000,X
         TYA
         ADC   #$08
         TAY
         LDA   [$05],Y
         BNE   L0807A2
         LDA   |$0008,X
         BRA   L0807AE
L0807A2  LDAL  $E12008,X
         EOR   |$0008,X
         AND   [$05],Y
         EOR   |$0008,X
L0807AE  STAL  $E12008,X
         TYA
         ADC   #$08
         TAY
         LDA   [$05],Y
         BNE   L0807BF
         LDA   |$0010,X
         BRA   L0807CB
L0807BF  LDAL  $E12010,X
         EOR   |$0010,X
         AND   [$05],Y
         EOR   |$0010,X
L0807CB  STAL  $E12010,X
         TYA
         ADC   #$08
         TAY
         LDA   [$05],Y
         BNE   L0807DC
         LDA   |$0018,X
         BRA   L0807E8
L0807DC  LDAL  $E12018,X
         EOR   |$0018,X
         AND   [$05],Y
         EOR   |$0018,X
L0807E8  STAL  $E12018,X
         TYA
         ADC   #$08
         TAY
         LDA   [$05],Y
         BNE   L0807F9
         LDA   |$0020,X
         BRA   L080805
L0807F9  LDAL  $E12020,X
         EOR   |$0020,X
         AND   [$05],Y
         EOR   |$0020,X
L080805  STAL  $E12020,X
         TYA
         ADC   #$08
         TAY
         REP   #$20
         TXA
         ADC   #$0028
         TAX
         DEC   $0F
         BMI   L08081B
         BRL   L080777
L08081B  PLB
         BRL   L08087E
L08081F  PHB
         PEI   $1F
         PLB
         PLB
         LDY   #$0001
L080827  SEP   #$20
         LDA   |$0000,X
L08082C  STAL  $E12000,X
         LDA   |$0008,X
         STAL  $E12008,X
         LDA   |$0010,X
         STAL  $E12010,X
         LDA   |$0018,X
         STAL  $E12018,X
         LDA   |$0020,X
         STAL  $E12020,X
         LDA   |$0028,X
         STAL  $E12028,X
         LDA   |$0030,X
         STAL  $E12030,X
         LDA   |$0038,X
         STAL  $E12038,X
         LDA   |$0040,X
         STAL  $E12040,X
         LDA   |$0048,X
         STAL  $E12048,X
         REP   #$20
         TXA
         CLC
         ADC   #$0050
         TAX
         DEY
         BPL   L080827
         PLB
         BRL   L08087E
L08087E  LDA   $0D
         CLC
         ADC   #$00A0
         STA   $0D
         INC   $0B
         LDA   $0B
         CMP   L052F43
         BEQ   L080892
         BRL   L080735
L080892  DEC   $09
         BMI   L0808A5
         LDA   $18
         CMP   #$0002
         BCC   L0808A2
         PHA
         JSL   L0706CF
L0808A2  BRL   L08071C
L0808A5  LDA   $16
         STA   $20
         LDA   $15
         STA   $1F
         LDX   $13
         TDC
         CLC
         ADC   #$001E
         TCS
         TXA
         TCD
         RTL

L0808B8  DW    $0000
         DW    $0002
         DW    $0006
         DW    $0003
         DW    $0007
         DW    $0005
         DW    $0001
         DW    $0004

L0808C8  ENT
         ADRL  L080785+3
         DW    $001D
         DW    $0005
L0808D0  ENT
         ADRL  L080791+3
         DW    $001D
         DW    $0005
L0808D8  ENT
         ADRL  L08082C+3
         DW    $0007
         DW    $000A

L0808E0  ENT
         PHD
         TSC
         TCD
         LDY   #$0006
         LDA   [$0A],Y
         ASL
         STA   [$06],Y
         DEY
         DEY
         LDA   [$0A],Y
         STA   [$06],Y
         DEY
         DEY
         LDA   [$0A],Y
         ASL
         STA   [$06],Y
         LDA   [$0A]
         STA   [$06]
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

L08090C  ENT
         PHD
         TSC
         SEC
         SBC   #$001C
         TCD
         TCS
         STZ   $30
         LDA   [$2C]
         AND   #$00FF
         BNE   L080920
         BRL   L080A4B
L080920  PHA
         PHA
         _GetPort
         PLA
         STA   $11
         PLA
         STA   $13
         LDY   #$007A
         LDA   [$11],Y
         PHA
         DEY
         DEY
         LDA   [$11],Y
         PHA
         JSL   L087547
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         _GetFontInfo
         LDY   #$0002
         LDA   [$28],Y
         STA   $01
         LDA   [$28]
         CLC
         ADC   $24
         SEC
         SBC   $17
         STA   $03
         LDY   #$0006
         LDA   [$28],Y
         LDY   #$0002
         SEC
         SBC   [$28],Y
         STA   $05
         LDX   $22
         BEQ   L0809AC
L080970  LDA   [$2C]
         AND   #$00FF
         BNE   L08097A
         BRL   L080A35
L08097A  PHX
         PEI   $2E
         PEI   $2C
         PEI   $05
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L081B04
         LDA   $2C
         CLC
         ADC   $0B
         STA   $2C
         BCC   L0809A2
         INC   $2E
L0809A2  INC   $30
         BCC   L0809A8
         INC   $31
L0809A8  PLX
         DEX
         BNE   L080970
L0809AC  LDY   #$0004
         LDA   [$28],Y
         CLC
         ADC   $24
         INC
         STA   $07
L0809B7  LDA   [$2C]
         AND   #$00FF
         BNE   L0809C1
         BRL   L080A35
L0809C1  PEI   $01
         PEI   $03
         _MoveTo
         PEI   $2E
         PEI   $2C
         PEI   $05
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L081B04
         JSR   L080A5E
         LDA   $2C
         CLC
         ADC   $0B
         STA   $2C
         BCC   L0809F6
         INC   $2E
L0809F6  INC   $30
         LDA   $03
         CLC
         ADC   $24
         STA   $03
         CMP   $07
         BCC   L0809B7
L080A03  LDA   [$2C]
         AND   #$00FF
         BEQ   L080A35
         PEI   $2E
         PEI   $2C
         PEI   $05
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L081B04
         LDA   $2C
         CLC
         ADC   $0B
         STA   $2C
         BCC   L080A31
         INC   $2E
L080A31  INC   $30
         BRA   L080A03
L080A35  LDA   $2C
         DEC
         CMP   #$FFFF
         BNE   L080A3F
         DEC   $2E
L080A3F  LDA   [$2C]
         AND   #$00FF
         CMP   #$000D
         BNE   L080A4B
         INC   $30
L080A4B  LDA   $20
         STA   $2E
         LDA   $1F
         STA   $2D
         LDX   $1D
         TDC
         CLC
         ADC   #$002C
         TCS
         TXA
         TCD
         RTL

L080A5E  LDY   $26
         BEQ   L080A80
         LDA   $05
         SEC
         SBC   $09
         INY
         BEQ   L080A6B
         LSR
L080A6B  PHA
         PHA
         PEA   $0000
         PEI   $05
         JSL   L071A1B
         PEA   $0000
         _Move
L080A80  PEI   $2E
         PEI   $2C
         PEI   $0B
         _DrawText
         RTS

L080A8E  PHD
         TSC
         SEC
         SBC   #$0060
         TCD
         TCS
         _PenNormal
         PEA   $0002
         PEA   $0001
         _SetPenSize
         PHA
         LDY   #$0023
         LDA   #$00FF
         AND   [$72],Y
         PHA
         JSL   L081A92
         PLA
         STA   $17
         LDY   #$000E
         LDA   [$72],Y
         STA   $21
         AND   #$000F
         STA   $19
         CMP   #$0005
         BCC   L080AD3
         LDA   #$FFFF
         STA   $15
         BRA   L080AE9
L080AD3  PHA
         LDY   #$0014
         LDA   #$000F
         SEP   #$20
         SEC
         SBC   [$72],Y
         REP   #$20
         PHA
         JSL   L081A92
         PLA
         STA   $15
L080AE9  LDY   #$0010
         LDA   [$72],Y
         STA   $25
         INY
         INY
         LDA   [$72],Y
         STA   $27
         LDY   #$0002
         LDA   [$72],Y
         LDY   $70
         BNE   L080B03
         EOR   #$FFFF
         INC
L080B03  PHY
         PEI   $6E
         PEI   $6C
         PEI   $6A
         PEI   $68
         PHA
         JSL   L07A609
         PLA
         STA   $1F
         LDY   #$000C
         LDA   [$72],Y
         ASL
         STA   $4F
         STA   $57
         TAX
         DEY
         DEY
         LDA   [$72],Y
         STA   $4D
         STA   $55
         DEY
         DEY
         LDA   [$72],Y
         ASL
         STA   $4B
         STA   $53
         DEY
         DEY
         LDA   [$72],Y
         STA   $49
         STA   $51
         CLC
         ADC   $4D
         STA   $0B
         TXA
         CLC
         ADC   $4B
         CMP   #$8000
         ROR
         STA   $09
         STZ   $23
         LDA   $66
         DEC
         DEC
         BEQ   L080B6E
         INC   $23
         PHY
         LDY   #$0022
         LDA   #$00FF
         AND   [$72],Y
         PHA
         JSL   L081A92
         PLA
         STA   $13
         LDA   $1F
         BEQ   L080B6A
         LDA   $17
         BRA   L080B73
L080B6A  LDA   $15
         BRA   L080B73
L080B6E  LDA   #$FFFF
         STA   $13
L080B73  STA   $11
         LDA   $19
         BPL   L080B7C
         BRL   L081110
L080B7C  CMP   #$0007
         BCC   L080B84
         BRL   L081110
L080B84  ASL
         TAX
         LDAL  L080B8C,X
         PHA
         RTS

L080B8C  DA    L080B9A-1
         DA    L080BF3-1
         DA    L080C2F-1
         DA    L080C5C-1
         DA    L080C9A-1
         DA    L080D0A-1
         DA    L080DA6-1

L080B9A  LDA   $15
         CMP   #$FFFF
         BNE   L080BAB
         LDA   $1F
         BEQ   L080BDB
         LDA   $25
         ORA   $27
         BNE   L080BDB
L080BAB  LDA   $1F
         BEQ   L080BB4
         PEA   $0002
         BRA   L080BB7
L080BB4  PEA   $8003
L080BB7  _SetPenMode
         PEI   $15
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         _PaintRect
         _PenNormal
L080BDB  LDA   L05514D
         BEQ   L080BF0
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         _FrameRect
L080BF0  BRL   L080E3B
L080BF3  PEI   $11
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         _PaintRect
         LDA   L05514D
         BEQ   L080BF0
         PEA   $3333
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         _FrameRect
         _PenNormal
         BRL   L080E3B
L080C2F  TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         PEI   $13
         PEI   $11
         _SpecialRect
L080C43  LDA   $51
         INC
         STA   $51
         LDA   $53
         INC
         INC
         STA   $53
         LDA   $55
         DEC
         STA   $55
         LDA   $57
         DEC
         DEC
         STA   $57
         BRL   L080E3B
L080C5C  PEI   $11
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         PEA   $001E
         PEA   $000E
         _PaintRRect
         LDA   $23
         BEQ   L080C43
         PEI   $13
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         PEA   $001E
         PEA   $000E
         _FrameRRect
         BRA   L080C43
L080C9A  PEI   $13
         JSL   L081DD8
         LDA   $49
         STA   $41
         LDA   $4B
         STA   $43
         CLC
         ADC   #$0004
         PHA
         LDA   $4F
         DEC
         DEC
         STA   $47
         LDA   $4D
         DEC
         STA   $45
         PHA
         _MoveTo
         PEI   $47
         PEI   $45
         _LineTo
         PEI   $47
         LDA   $41
         INC
         INC
         PHA
         _LineTo
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         PEI   $13
         PEI   $11
         _SpecialRect
         LDA   $51
         INC
         STA   $51
         LDA   $53
         INC
         INC
         STA   $53
         LDA   $55
         DEC
         DEC
         STA   $55
         LDA   $57
         DEC
         DEC
         DEC
         DEC
         STA   $57
         BRL   L080E3B
L080D0A  LDA   L05514D
         BEQ   L080D1E
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         _FrameRect
L080D1E  STZ   $25
         STZ   $27
         LDA   $0B
         DEC
         CMP   #$8000
         ROR
         DEC
         DEC
         DEC
         DEC
         STA   $41
         CLC
         ADC   #$0009
         STA   $45
         LDA   $4B
         INC
         INC
         STA   $43
         CLC
         ADC   #$0018
         STA   $47
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         PEI   $13
         PEA   $FFFF
         _SpecialRect
         LDA   $23
         AND   $1F
         BEQ   L080DA1
         PEA   $0001
         PEA   $0001
         _SetPenSize
         PEI   $13
         JSL   L081DD8
         PEI   $43
         PEI   $41
         _MoveTo
         PEA   $0017
         PEA   $0008
         _Line
         PEA   $0000
         PEA   $FFF8
         _Move
         PEA   $FFE9
         PEA   $0008
         _Line
L080DA1  STZ   $1F
         BRL   L080E3B
L080DA6  LDA   L05514D
         BEQ   L080DBB
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         _FrameRect
L080DBB  STZ   $25
         STZ   $27
         LDA   $0B
         DEC
         CMP   #$8000
         ROR
         DEC
         DEC
         DEC
         DEC
         STA   $41
         CLC
         ADC   #$0009
         STA   $45
         LDA   $4B
         INC
         INC
         STA   $43
         CLC
         ADC   #$0014
         STA   $47
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         _EraseOval
         LDA   $23
         BEQ   L080DA1
         PEI   $13
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         _FrameOval
         LDA   $1F
         BEQ   L080DA1
         LDA   $41
         INC
         INC
         STA   $41
         LDA   $43
         CLC
         ADC   #$0004
         STA   $43
         LDA   $45
         DEC
         DEC
         STA   $45
         LDA   $47
         SEC
         SBC   #$0004
         STA   $47
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         _PaintOval
         BRL   L080DA1
L080E3B  LDA   L053149
         STA   $37
         LDA   L053147
         STA   $35
         LDY   #$0002
         LDA   [$35],Y
         STA   $3B
         LDA   [$35]
         STA   $39
         LDA   $51
         STA   [$39],Y
         INY
         INY
         LDA   $53
         STA   [$39],Y
         LDA   $55
         INY
         INY
         STA   [$39],Y
         LDA   $57
         INY
         INY
         STA   [$39],Y
         STZ   $29
         STZ   $2B
         LDA   $23
         BNE   L080E75
         LDA   $19
         BEQ   L080E75
L080E72  BRL   L080F46
L080E75  LDA   $25
         ORA   $27
         BEQ   L080E72
         PHA
         PHA
         PEA   $8001
         PEI   $27
         PEI   $25
         _LoadResource
         PLA
         STA   $29
         PLA
         STA   $2B
         BCC   L080E9A
         STZ   $29
         STZ   $2B
         BRL   L080F46
L080E9A  LDY   #$0002
         LDA   [$29],Y
         STA   $2F
         LDA   [$29]
         STA   $2D
         LDA   #$7FFF
         AND   [$2D]
         STA   [$2D]
         LDA   $0B
         LDY   #$0004
         SEC
         SBC   [$2D],Y
         CMP   #$8000
         ROR
         LDY   $21
         BPL   L080EC0
         SEC
         SBC   #$0006
L080EC0  STA   $0F
         LDA   $09
         LDY   #$0006
         SEC
         SBC   [$2D],Y
         AND   #$FFFE
         STA   $0D
         LDA   $23
         BNE   L080ED8
         LDA   #$FF00
         BRA   L080F27
L080ED8  LDA   $1F
         BNE   L080EF7
         LDY   #$0025
         LDA   #$00FF
         AND   [$72],Y
         XBA
         ASL
         ASL
         ASL
         ASL
         STA   $1B
         LDA   #$00FF
         DEY
         AND   [$72],Y
         XBA
         CLC
         ADC   $1B
         BRA   L080F27
L080EF7  LDA   $19
         BNE   L080F16
         LDY   #$0024
         LDA   #$00FF
         AND   [$72],Y
         XBA
         ASL
         ASL
         ASL
         ASL
         STA   $1B
         LDA   #$00FF
         INY
         AND   [$72],Y
         XBA
         CLC
         ADC   $1B
         BRA   L080F27
L080F16  LDY   #$0024
         LDA   #$00FF
         AND   [$72],Y
         XBA
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #$0F00
L080F27  STA   $1B
         AND   #$FF00
         BNE   L080F35
         LDA   $1B
         ORA   #$0003
         STA   $1B
L080F35  PEI   $2F
         PEI   $2D
         PEI   $1B
         PEI   $0D
         PEI   $0F
         _DrawIcon
L080F46  LDA   $21
         BMI   L080F4D
         BRL   L0810FB
L080F4D  LDA   $23
         BNE   L080F5D
         LDA   $19
         BEQ   L080F5D
         CMP   #$0005
         BCS   L080F5D
         BRL   L0810FB
L080F5D  LDA   $72
         LDX   $74
         CLC
         ADC   #$002A
         BCC   L080F68
         INX
L080F68  STA   $31
         STX   $33
         LDY   #$001A
         LDA   [$72],Y
         STA   $3D
         LDY   #$001E
         SEP   #$20
         LDA   [$72],Y
         STA   $3F
         DEY
         DEY
         LDA   [$72],Y
         STA   $40
         REP   #$20
         PEI   $3F
         PEI   $3D
         PEA   $0000
         _InstallFont
         PHY
         PEI   $33
         PEI   $31
         _CStringWidth
         PLA
         STA   $1D
         LDA   $19
         CMP   #$0005
         BCC   L080FB0
         CLC
         LDA   $4B
         ADC   #$001E
         BRA   L080FD7
L080FB0  LDY   #$0018
         LDA   [$72],Y
         BNE   L080FBF
         CLC
         LDA   $4B
         ADC   #$0006
         BRA   L080FD7
L080FBF  INC
         BEQ   L080FCE
         LDA   $09
         ASL
         SEC
         SBC   $1D
         CMP   #$8000
         ROR
         BRA   L080FD7
L080FCE  LDA   $4F
         SEC
         SBC   #$0006
         SEC
         SBC   $1D
L080FD7  STA   $01
         TDC
         CLC
         ADC   #$0059
         PEA   $0000
         PHA
         _GetFontInfo
         LDA   $29
         ORA   $2B
         BEQ   L081009
         LDY   #$0002
         LDA   [$29],Y
         STA   $2F
         LDA   [$29]
         STA   $2D
         INY
         INY
         LDA   [$2D],Y
         CLC
         ADC   $0F
         ADC   $59
         ADC   $5F
         STA   $03
         BRA   L081018
L081009  LDA   $0B
         CLC
         ADC   $59
         SEC
         SBC   $5B
         INC
         CMP   #$8000
         ROR
         STA   $03
L081018  LDA   $19
         BNE   L081078
         LDA   $29
         ORA   $2B
         BEQ   L081078
         LDA   $01
         DEC
         DEC
         STA   $43
         CLC
         ADC   #$0004
         ADC   $1D
         STA   $47
         LDA   $03
         SEC
         SBC   $59
         DEC
         STA   $41
         LDA   $03
         CLC
         ADC   $5B
         INC
         STA   $45
         LDA   $23
         BEQ   L08105D
         LDA   $15
         CMP   #$FFFF
         BNE   L08104F
         PEI   $11
         BRA   L081060
L08104F  LDA   $11
         LDX   $1F
         BEQ   L08105A
         LDA   $15
         EOR   #$FFFF
L08105A  PHA
         BRA   L081060
L08105D  PEA   $FFFF
L081060  JSL   L081DD8
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         _PaintRect
         LDA   $23
         BEQ   L0810ED
L081078  LDA   #$FFFF
         STA   $05
         STA   $07
         LDA   $23
         BEQ   L0810B2
         LDA   $1F
         BEQ   L0810AA
         LDA   $19
         BNE   L0810A0
         LDA   $15
         CMP   #$FFFF
         BEQ   L0810A0
         EOR   #$FFFF
         STA   $07
         LDA   $17
         EOR   #$FFFF
         STA   $05
         BRA   L0810B2
L0810A0  LDA   $17
         STA   $07
         LDA   $15
         STA   $05
         BRA   L0810B2
L0810AA  LDA   $17
         STA   $05
         LDA   $15
         STA   $07
L0810B2  PEI   $01
         PEI   $03
         _MoveTo
         PEI   $05
         _SetForeColor
         LDA   $19
         BEQ   L0810D8
         PEI   $07
         _SetBackColor
         PEA   $0000
         BRA   L0810DB
L0810D8  PEA   $0004
L0810DB  _SetTextMode
         PEI   $33
         PEI   $31
         _DrawCString
L0810ED  PEI   $3F
         PEI   $3D
         PEA   $0010
         _SetPurgeStat
L0810FB  LDA   $2A
         BEQ   L081110
         PEA   $0001
         PEA   $8001
         PEI   $27
         PEI   $25
         _ReleaseResource
L081110  LDA   $64
         STA   $74
         LDA   $63
         STA   $73
         LDX   $61
         TDC
         CLC
         ADC   #$0072
         TCS
         TXA
         TCD
         RTL

L081123  PHD
         TSC
         SEC
         SBC   #$005A
         TCD
         TCS
         LDY   #$0002
         LDA   [$6E],Y
         PEI   $70
         PEI   $6E
         LDX   $6C
         PHX
         BNE   L08113D
         EOR   #$FFFF
         INC
L08113D  STA   $09
         LDX   #$0000
         LDY   #$0004
         LDA   [$6E],Y
         AND   #$4000
         BEQ   L08114D
         INX
L08114D  TXA
         AND   $6C
         STA   $13
         TDC
         CLC
         ADC   #$004B
         PEA   $0000
         PHA
         JSL   L083B58
         LDY   #$0020
         LDA   [$6E],Y
         STA   $05
         STZ   $0F
         LDY   #$0006
         LDA   [$6E],Y
         STA   $53
         INY
         INY
         LDA   [$6E],Y
         ASL
         STA   $55
         INY
         INY
         LDA   [$6E],Y
         STA   $57
         INY
         INY
         LDA   [$6E],Y
         ASL
         STA   $59
         LDA   $6A
         BEQ   L0811B0
         PHY
         PHY
         PEI   $68
         PEI   $66
         PEI   $64
         PEI   $62
         PEI   $09
         PEI   $13
         JSL   L07B038
         PLA
         STA   $27
         PLA
         STA   $29
         LDX   #$0000
         ORA   $27
         BEQ   L0811AE
         LDA   [$27]
         AND   #$00FF
         BEQ   L0811AE
         INX
L0811AE  STX   $6A
L0811B0  _PenNormal
         LDY   #$000E
         LDA   [$6E],Y
         AND   #$000F
         STA   $07
         LDX   #$0000
         LDA   L05514B
         BNE   L0811D7
         LDA   [$6E],Y
         AND   #$4000
         BEQ   L0811D8
         LDA   $07
         CMP   #$0007
         BEQ   L0811D8
L0811D7  INX
L0811D8  STX   $11
         PHA
         LDY   #$0014
         LDA   [$6E],Y
         AND   #$00FF
         EOR   #$000F
         PHA
         JSL   L081A92
         PLA
         STA   $19
         LDX   #$0001
         LDA   $60
         DEC
         DEC
         BNE   L0811FD
         DEX
         LDA   #$FFFF
         STA   $19
L0811FD  STX   $21
         LDA   $21
         BNE   L081208
         LDA   #$FFFF
         BRA   L081217
L081208  PHA
         LDY   #$0022
         LDA   [$6E],Y
         AND   #$00FF
         PHA
         JSL   L081A92
         PLA
L081217  STA   $0B
         LDA   $07
         BPL   L081220
         BRL   L081504
L081220  CMP   #$0008
         BMI   L081228
         BRL   L081504
L081228  ASL
         TAX
         LDAL  L081230,X
         PHA
         RTS

L081230  DA    L081240-1
         DA    L08126B-1
         DA    L081290-1
         DA    L081504-1
         DA    L0812A7-1
         DA    L081504-1
         DA    L081504-1
         DA    L0812FE-1

L081240  LDA   L05514B
         BEQ   L081255
         TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         _FrameRect
L081255  LDA   $19
         CMP   #$FFFF
         BNE   L08125F
         BRL   L081339
L08125F  PEA   $8003
         _SetPenMode
         BRA   L081270
L08126B  LDA   L05514B
         BNE   L081290
L081270  PEI   $19
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         _PaintRect
         _PenNormal
L08128D  BRL   L081339
L081290  TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
L081299  PEI   $0B
         PEI   $19
         _SpecialRect
         BRL   L081339
L0812A7  PEI   $0B
         JSL   L081DD8
         PEA   $0002
         PEA   $0001
         _SetPenSize
         LDA   $53
         STA   $43
         LDA   $55
         STA   $45
         CLC
         ADC   #$0004
         PHA
         LDA   $57
         DEC
         STA   $47
         PHA
         LDA   $59
         DEC
         DEC
         STA   $49
         _MoveTo
         PEI   $49
         PEI   $47
         _LineTo
         PEI   $49
         LDA   $43
         INC
         INC
         PHA
         _LineTo
         TDC
         CLC
         ADC   #$0043
         PEA   $0000
         PHA
         BRA   L081299
L0812FE  TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         PEI   $0B
         PEI   $19
         _SpecialRect
         LDA   $21
         BEQ   L081327
         TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         PEI   $0B
         PEI   $19
         JSL   L08510A
L081327  PHY
         PEI   $09
         JSL   L086029
         PLA
         STA   $0F
         LDA   $51
         SEC
         SBC   #$001A
         STA   $51
L081339  LDA   #$0000
         LDX   $07
         BNE   L081341
         INC
L081341  ORA   $21
         STA   $1D
         AND   $6A
         ORA   $11
         STA   $1F
         BEQ   L081383
         LDY   #$001A
         LDA   [$6E],Y
         STA   $33
         LDY   #$001E
         SEP   #$20
         LDA   [$6E],Y
         STA   $35
         DEY
         DEY
         LDA   [$6E],Y
         STA   $36
         REP   #$20
         PEI   $35
         PEI   $33
         PEA   $0000
         _InstallFont
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         _GetFontInfo
L081383  _PenNormal
         LDA   $6A
         AND   $1D
         BNE   L081393
         BRL   L0814A0
L081393  LDA   $07
         BEQ   L0813B1
         LDA   $3B
         CLC
         ADC   $3D
         ADC   $41
         DEC
         CMP   $05
         BCS   L0813B1
         PEI   $19
         _SetBackColor
         PEA   $0000
         BRA   L0813B4
L0813B1  PEA   $0004
L0813B4  _SetTextMode
         PEA   $FFFF
         LDX   $21
         BEQ   L0813CC
         LDY   #$0023
         LDA   [$6E],Y
         PHA
         JSL   L081A92
L0813CC  _SetForeColor
         LDA   L053149
         STA   $2D
         LDA   L053147
         STA   $2B
         LDY   #$0002
         LDA   [$2B],Y
         STA   $31
         LDA   [$2B]
         STA   $2F
         LDA   $4B
         STA   [$2F],Y
         INY
         INY
         LDA   $4D
         STA   [$2F],Y
         LDA   $4F
         INY
         INY
         STA   [$2F],Y
         LDA   $51
         INY
         INY
         STA   [$2F],Y
         PHA
         PEI   $29
         PEI   $27
         TDC
         CLC
         ADC   #$004B
         PEA   $0000
         PHA
         LDY   #$0018
         LDA   [$6E],Y
         PHA
         PEI   $05
         PEI   $0F
         JSL   L08090C
         PLA
         STA   $15
         LDA   #$0007
         CMP   $07
         BEQ   L081427
         BRL   L0814A0
L081427  LDY   #$0002
         LDA   [$2B],Y
         STA   $31
         LDA   [$2B]
         STA   $2F
         LDA   $53
         STA   [$2F],Y
         INY
         INY
         INY
         INY
         LDA   $57
         STA   [$2F],Y
         INY
         INY
         LDA   $59
         STA   [$2F],Y
         LDA   $4F
         SEC
         SBC   $4B
         STA   $23
         PHY
         PHY
         PHA
         PEI   $05
         JSL   L150BE2
         PLA
         PLX
         BEQ   L081459
         INC
L081459  STA   $17
         PEI   $15
         LDA   $05
         JSL   L150BEE
         PLA
         STA   $25
         CMP   $23
         BEQ   L081481
         BCC   L081481
         PHY
         PHY
         LDA   $25
         SEC
         SBC   $23
         PHA
         PEI   $05
         JSL   L150BE2
         PLA
         PLX
         BEQ   L08147F
         INC
L08147F  BRA   L081484
L081481  LDA   #$0000
L081484  CLC
         ADC   $17
         STA   $15
         TDC
         CLC
         ADC   #$0053
         PEA   $0000
         PHA
         PEI   $0F
         PEI   $15
         PEI   $17
         PEI   $0B
         PEI   $19
         JSL   L081904
L0814A0  LDA   $11
         AND   $1D
         BEQ   L0814F2
         LDA   $4F
         INC
         STA   $01
         LDA   $05
         CLC
         ADC   $4B
         INC
         SEC
         SBC   $3D
         STA   $4B
         INC
         STA   $4F
         LDA   #$0F0F
         AND   $0B
         PHA
         LDA   #$F0F0
         AND   $19
         ORA   $01,S
         PLX
         STA   $1B
         TDC
         CLC
         ADC   #$004B
         STA   $03
         LDA   $4F
L0814D2  CMP   $01
         BCS   L0814F2
         PEA   $0000
         PEI   $03
         PEI   $1B
         PEI   $1B
         _SpecialRect
         LDA   $05
         CLC
         ADC   $4B
         STA   $4B
         INC
         STA   $4F
         BRA   L0814D2
L0814F2  LDA   $1F
         BEQ   L081504
         PEI   $35
         PEI   $33
         PEA   $0010
         _SetPurgeStat
L081504  LDA   $5E
         STA   $70
         LDA   $5D
         STA   $6F
         LDX   $5B
         TDC
         CLC
         ADC   #$006E
         TCS
         TXA
         TCD
         RTL

L081517  ENT
         PHD
         TSC
         SEC
         SBC   #$0042
         TCD
         TCS
         STZ   $01
         STZ   $03
         PHA
         PHA
         LDA   L055029
         PHA
         LDA   L055027
         PHA
         JSL   L0772AE
         PLA
         STA   $05
         PLA
         STA   $07
         ORA   $05
         BNE   L08153E
         BRL   L0818DD
L08153E  PHA
         PEI   $07
         PEI   $05
         JSL   L0718FA
         PLA
         STA   $09
         PHA
         PHA
         LDA   L055021
         PHA
         LDA   L05501F
         PHA
         JSL   L07721A
         PLA
         STA   $01
         PLA
         STA   $03
         ORA   $01
         BNE   L081565
         BRL   L0818C4
L081565  PHA
         PEI   $03
         PEI   $01
         JSL   L0718FA
         PLA
         STA   $0B
         PEA   ^L05312F
         PEA   L05312F
         _SetPort
         LDA   L05314B
         STA   $3B
         LDA   L05314D
         STA   $3D
         LDY   #$0002
         LDA   [$3B]
         TAX
         LDA   [$3B],Y
         STA   $3D
         STX   $3B
         LDY   #$0002
         LDA   [$3B],Y
         STA   $25
         INY
         INY
         LDA   [$3B],Y
         STA   $27
         INY
         INY
         LDA   [$3B],Y
         STA   $29
         INY
         INY
         LDA   [$3B],Y
         STA   $2B
         LDA   $4A
         BEQ   L0815E2
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0032
         BCC   L0815C0
         INX
L0815C0  STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$01]
         STA   $3B
         LDA   [$01],Y
         STA   $3D
         LDY   #$0024
         LDA   [$3B],Y
         STA   $11
         LDA   L05501F
         STA   $15
         LDA   L055021
         STA   $17
         BRA   L081611
L0815E2  LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         CLC
         ADC   #$0032
         BCC   L0815F1
         INX
L0815F1  STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$05]
         STA   $3B
         LDA   [$05],Y
         STA   $3D
         LDY   #$0024
         LDA   [$3B],Y
         STA   $11
         LDA   L055027
         STA   $15
         LDA   L055029
         STA   $17
L081611  PEA   ^L053107
         PEA   L053107
         JSL   L08273B
         LDX   #$0000
         LDA   $4C
         CMP   #$0002
         BEQ   L08162A
         CMP   #$0003
         BNE   L08162B
L08162A  INX
L08162B  STX   $1B
         LDA   $11
         BNE   L081634
         BRL   L08188C
L081634  LDA   $1B
         STA   $19
         LDY   #$0002
         LDA   $4E
         CMP   [$0D],Y
         BNE   L081651
         LDA   $4C
         ASL
         TAX
         LDAL  L0818EE,X
         STA   $19
         LDAL  L0818F8,X
         STA   $1B
L081651  LDY   #$000C
         LDA   [$0D],Y
         ASL
         STA   $33
         DEY
         DEY
         LDA   [$0D],Y
         STA   $31
         DEY
         DEY
         LDA   [$0D],Y
         ASL
         STA   $2F
         DEY
         DEY
         LDA   [$0D],Y
         STA   $2D
         LDY   #$0004
         LDA   [$0D],Y
         BMI   L081686
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   ^L053127
         PEA   L053127
         JSL   L081E53
L081686  LDA   $19
         BNE   L08168D
         BRL   L081877
L08168D  LDY   #$0004
         LDA   [$0D],Y
         BPL   L081697
         BRL   L081877
L081697  PHY
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         TDC
         ADC   #$0025
         PEA   $0000
         PHA
         LDA   L053147
         STA   $3B
         LDA   L053149
         STA   $3D
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         CLC
         ADC   #$0002
         BCC   L0816C2
         INX
L0816C2  PHX
         PHA
         _SectRect
         PLA
         BNE   L0816D1
         BRL   L081877
L0816D1  TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   ^L053107
         PEA   L053107
         JSL   L081E53
         LDY   #$0004
         LDA   #$0003
         AND   [$0D],Y
         DEC
         BEQ   L0816F7
         CMP   #$0001
         BEQ   L081716
         BRL   L081877
L0816F7  PEI   $0F
         PEI   $0D
         PEI   $4A
         LDA   L055021
         PHA
         LDA   L05501F
         PHA
         LDA   L055029
         PHA
         LDA   L055027
         PHA
         PEI   $48
         JSL   L080A8E
         BRL   L081877
L081716  LDA   L055147
         BNE   L081720
         LDA   L055149
         BRA   L081730
L081720  PHY
         PEI   $17
         PEI   $15
         LDY   #$0002
         LDA   [$0D],Y
         PHA
         JSL   L085819
         PLA
L081730  STA   $35
         STZ   $37
         LDA   L05328D
         LDY   #$0002
         CMP   [$0D],Y
         BNE   L081768
         LDA   $4A
         BEQ   L081756
         LDA   L055129
         CMP   L05501F
         BNE   L081768
         LDA   L05512B
         CMP   L055021
         BNE   L081768
         INC   $37
         BRA   L081768
L081756  LDA   L055129
         CMP   L055027
         BNE   L081768
         LDA   L05512B
         CMP   L055029
         BNE   L081768
         INC   $37
L081768  LDA   $37
         EOR   #$0001
         AND   $35
         STA   $35
         PEI   $0F
         PEI   $0D
         PEI   $4A
         PEI   $35
         PEI   $03
         PEI   $01
         PEI   $07
         PEI   $05
         PEI   $48
         JSL   L081123
         LDA   $37
         BNE   L08178E
         BRL   L081877
L08178E  LDA   L055121
         STA   $3B
         LDA   L055123
         STA   $3D
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         CLC
         ADC   #$0004
         BCC   L0817A7
         INX
L0817A7  STA   $3B
         STX   $3D
         LDA   #L05312F
         STA   [$3B]
         LDA   #^L05312F
         LDY   #$0002
         STA   [$3B],Y
         LDA   L055123
         PHA
         LDA   L055121
         PHA
         _TEUpdate
         LDA   L055121
         STA   $3B
         LDA   L055123
         STA   $3D
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         CLC
         ADC   #$0004
         BCC   L0817E0
         INX
L0817E0  STA   $3B
         STX   $3D
         LDA   L0550ED
         STA   [$3B]
         LDY   #$0002
         LDA   L0550EF
         STA   [$3B],Y
         LDY   #$000E
         LDA   #$000F
         AND   [$0D],Y
         CMP   #$0007
         BEQ   L081801
         BRL   L081877
L081801  PHY
         LDY   #$0022
         LDA   #$00FF
         AND   [$0D],Y
         PHA
         JSL   L081A92
         PLA
         STA   $39
         LDA   L055121
         STA   $3B
         LDA   L055123
         STA   $3D
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         CLC
         ADC   #$0092
         BCC   L08182B
         INX
L08182B  STA   $3B
         STX   $3D
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         STA   $3B
         STX   $3D
         LDA   [$3B],Y
         STA   $41
         LDA   [$3B]
         STA   $3F
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         LDY   #$0012
         LDA   [$3F],Y
         PHA
         LDY   #$001E
         LDA   [$3F],Y
         PHA
         DEY
         DEY
         LDA   [$3F],Y
         PHA
         PEI   $39
         PHY
         PEA   $000F
         LDY   #$0014
         LDA   #$00FF
         AND   [$0D],Y
         STA   $3B
         PLA
         SEC
         SBC   $3B
         PHA
         JSL   L081A92
         JSL   L081904
L081877  LDA   [$0D]
         CLC
         ADC   $0D
         STA   $0D
         BCC   L081882
         INC   $0F
L081882  LDA   $11
         DEC
         BEQ   L08188C
         STA   $11
         BRL   L081634
L08188C  LDA   L053147
         STA   $3B
         LDA   L053149
         STA   $3D
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         CLC
         ADC   #$0002
         BCC   L0818A5
         INX
L0818A5  PHX
         PHA
         JSL   L082712
         PEI   $03
         PEI   $01
         PEI   $0B
         JSL   L0718DA
         LDA   L055021
         PHA
         LDA   L05501F
         PHA
         PEA   $0000
         JSL   L074A24
L0818C4  PEI   $07
         PEI   $05
         PEI   $09
         JSL   L0718DA
         LDA   L055029
         PHA
         LDA   L055027
         PHA
         PEA   $0000
         JSL   L074A90
L0818DD  LDA   $46
         STA   $4E
         LDA   $45
         STA   $4D
         LDX   $43
         TDC
         CLC
         ADC   #$004C
         TCS
         TXA
L0818EE  TCD
         RTL

         DW    $0001
         DW    $0001
         DW    $0000
         DW    $0000
L0818F8  DW    $0001
         DW    $0000
         DW    $0001
         DW    $0000
         DW    $0001
         DW    $0001

L081904  ENT
         PHD
         TSC
         SEC
         SBC   #$0022
         TCD
         TCS
         LDA   $2E
         SEC
         SBC   $2C
         BEQ   L081915
         BPL   L081918
L081915  BRL   L081A31
L081918  PHY
         PEI   $30
         PHA
         JSL   L072FD5
         PLA
         STA   $30
         PHY
         PEI   $2A
         JSL   L081A92
         JSL   L081DD8
         PEA   $0002
         PEA   $0001
         _SetPenSize
         LDA   #$000D
         CLC
         ADC   [$32]
         STA   $01
         LDY   #$0006
         LDA   [$32],Y
         SEC
         SBC   #$0018
         STA   $03
         LDA   [$32],Y
         DEC
         DEC
         STA   $07
         DEY
         DEY
         LDA   [$32],Y
         SEC
         SBC   #$000D
         STA   $05
         SEC
         SBC   $01
         STA   $13
         PHY
         PEA   $0008
         LDX   $2C
         JSR   L081A44
         PHA
         JSL   L072FA6
         PLA
         STA   $11
         LDA   $13
         SEC
         SBC   $11
         STA   $13
         LDX   $30
         LDA   $2E
         SEC
         SBC   $2C
         STA   $2E
         JSR   L081A44
         STA   $15
         PHY
         CLC
         ADC   $01
         STA   $09
         ADC   $11
         PHA
         LDA   $03
         STA   $0B
         PEI   $05
         JSL   L072FD5
         PLA
         STA   $0D
         LDA   $07
         STA   $0F
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         _FrameRect
         LDA   #$0F0F
         AND   $2A
         PHA
         LDA   #$F0F0
         AND   $28
         ORA   $01,S
         PLX
         TAY
         LDA   #$F0F0
         AND   $2A
         PHA
         LDA   #$0F0F
         AND   $28
         ORA   $01,S
         PLX
         STA   $19
         LDX   #$001E
L0819D5  LDA   $19
         STA   L052F47,X
         DEX
         DEX
         STA   L052F47,X
         DEX
         DEX
         TYA
         STA   L052F47,X
         DEX
         DEX
         STA   L052F47,X
         DEX
         DEX
         BPL   L0819D5
         PEA   ^L052F47
         PEA   L052F47
         _SetPenPat
         LDA   $15
         BMI   L081A1D
         BEQ   L081A1D
         LDA   $05
         STA   $17
         LDA   $09
         STA   $05
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         _PaintRect
         LDA   $17
         STA   $05
L081A1D  LDA   $0D
         STA   $01
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         _PaintRect
L081A31  LDA   $26
         STA   $34
         LDA   $25
         STA   $33
         LDX   $23
         TDC
         CLC
         ADC   #$0032
         TCS
         TXA
         TCD
         RTL

L081A44  TDC
         CLC
         ADC   #$001B
         PEA   $0000
         PHA
         PHY
         PHY
         PHX
         PEI   $13
         JSL   L150C46
         PEA   $0000
         PEI   $2E
         JSL   L151243
         PLA
         PLA
         LDA   $1B
         RTS

L081A64  ENT
         PHD
         TSC
         TCD
         LDA   #$0001
         STA   $0A
         LDY   #$0004
         LDA   [$06]
         SEC
         SBC   [$06],Y
         BPL   L081A84
         DEY
         DEY
         LDA   [$06],Y
         LDY   #$0006
         SEC
         SBC   [$06],Y
         BPL   L081A84
         DEC   $0A
L081A84  LDA   $04
         STA   $08
         LDA   $03
         STA   $07
         TDC
         TCS
         PLD
         PLY
         PLY
         RTL

L081A92  ENT
         PHD
         TSC
         TCD
         LDA   $06
         AND   #$000F
         STA   $06
         ASL
         ASL
         ASL
         ASL
         ORA   $06
         STA   $06
         XBA
         ORA   $06
         STA   $08
         LDA   $04
         STA   $06
         LDA   $03
         STA   $05
         TDC
         TCS
         PLD
         PLY
         RTL

L081AB6  PHB
         PHD
         TSC
         TCD
         LDA   $0F
         XBA
         ORA   $0B
         STAL  L081ACE+1
         LDX   $0D
         LDY   $09
         LDA   $07
         JSL   L082758
         DEC
L081ACE  MVN   $000000,$000000
         LDA   $05
         STA   $0F
         LDA   $03
         STA   $0D
         TDC
         TCS
         PLD
         CLC
         ADC   #$000C
         TCS
         PLB
         RTL

L081AE3  PHD
         TSC
         TCD
         LDA   $08
         LDY   $06
         BEQ   L081AF4
         DEY
         DEY
L081AEE  STA   [$0A],Y
         DEY
         DEY
         BPL   L081AEE
L081AF4  LDA   $04
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

L081B04  ENT
         PHD
         TSC
         SEC
         SBC   #$000E
         TCD
         TCS
         STZ   $01
         STZ   $03
         STZ   $07
         STZ   $0B
         LDY   #$0000
         STY   $05
L081B19  LDA   [$1E],Y
         AND   #$00FF
         INY
         CMP   #$000D
         BEQ   L081B7D
         TAX
         BNE   L081B2A
         DEY
         BRA   L081B7D
L081B2A  CPX   #$0020
         BEQ   L081B6E
         CPX   #$0009
         BEQ   L081B6E
         LDA   $0B
         CMP   #$0020
         BEQ   L081B40
         CMP   #$0009
         BNE   L081B48
L081B40  TYA
         DEC
         STA   $05
         LDA   $03
         STA   $07
L081B48  LDA   $03
         STA   $0D
         LDA   L052D92,X
         AND   #$00FF
         CLC
         ADC   $01
         STA   $03
         CMP   $1C
         BCC   L081B6E
         LDA   $07
         BNE   L081B66
         DEY
         LDA   $0D
         STA   $03
         BRA   L081B7D
L081B66  LDY   $05
         LDA   $07
         STA   $03
         BRA   L081B7D
L081B6E  LDA   L052D92,X
         AND   #$00FF
         CLC
         ADC   $01
         STA   $01
         STX   $0B
         BRA   L081B19
L081B7D  TYA
         BNE   L081B93
         LDA   [$1E]
         AND   #$00FF
         BEQ   L081B93
         TAX
         LDA   L052D92,X
         AND   #$00FF
         STA   $03
         LDA   #$0001
L081B93  STA   [$18]
         LDA   $03
         STA   [$14]
         LDA   $12
         STA   $20
         LDA   $11
         STA   $1F
         LDX   $0F
         TDC
         CLC
         ADC   #$001E
         TCS
         TXA
         TCD
         RTL

L081BAC  ENT
         PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         LDA   L0550A1
         STA   $01
         LDA   L0550A3
         STA   $03
         LDA   [$01]
         CMP   #$000A
         BNE   L081C17
         LDY   #$0002
         LDA   [$01],Y
         STA   L05509D
         STAL  L081C03
         INY
         INY
         LDA   [$01],Y
         STAL  L081C05
         STAL  L081C0D
         INY
         INY
         LDA   [$01],Y
         STAL  L081C0B
         INY
         INY
         LDA   [$01],Y
         STAL  L081C07
         STAL  L081C0F
         LDA   #L081C03
         STA   L0550A1
         LDA   #^L081C03
         STA   L0550A3
         LDA   #$FFFF
         STA   L05509B
         BRA   L081C36
L081C03  DW    $0000
L081C05  DW    $0000
L081C07  DW    $0000
         DW    $3FFF
L081C0B  DW    $0000
L081C0D  DW    $0000
L081C0F  DW    $0000
         DW    $3FFF
         DW    $3FFF
         DW    $3FFF
L081C17  LDY   #$0002
         LDA   [$01],Y
         STA   L05509D
         LDA   $01
         CLC
         ADC   #$000A
         STA   L0550A1
         LDA   $03
         ADC   #$0000
         STA   L0550A3
         LDA   #$FFFF
         STA   L05509B
L081C36  PEA   ^L052E9F
         PEA   L052E9F
         PEA   $FFFF
         PEA   $0001
         PEA   $0050
         PEA   $0000
         JSL   L080565
         TDC
         TCS
         PLY
         PLY
         PLY
         PLD
         RTL

L081C53  ENT
         PHD
         TSC
         SEC
         SBC   #$000E
         TCD
         TCS
         LDAL  L0550A7
         ORAL  L0550A9
         BNE   L081C8C
         LDY   #$0000
         PHY
         PHY
         PHY
         PEA   $00E0
         LDAL  L054FBF
         PHA
         PEA   $8010
         PHY
         PHY
         _NewHandle
         PLX
         PLA
         STAL  L0550A9
         TXA
         STAL  L0550A7
         BRA   L081CC2
L081C8C  LDAL  L0550A7
         STA   $0B
         LDAL  L0550A9
         STA   $0D
         LDY   #$0002
         LDA   [$0B]
         ORA   [$0B],Y
         BNE   L081CAC
         PEI   $0D
         PEI   $0B
         _RestoreHandle
L081CAC  LDA   $0D
         LDX   $0B
         PHA
         PHX
         PEA   $0000
         PHA
         PHX
         _SetPurge
         JSL   L0718BF
L081CC2  LDAL  L0550A9
         STA   $09
         ORAL  L0550A7
         BNE   L081CD1
         JMP   L081D60

L081CD1  LDAL  L0550A7
         STA   $07
         LDY   #$0002
         LDA   [$07]
         TAX
         LDA   [$07],Y
         STX   $07
         STA   $09
         LDY   #$00DE
         LDA   #$FFFF
L081CE9  STA   [$07],Y
         DEY
         DEY
         CPY   #$0038
         BPL   L081CE9
         PHY
         PHY
         PEA   $0003
         _GetAddress
         PLX
         PLA
         STX   $03
         STA   $05
         LDA   #$0000
         STA   [$07]
         PHY
         PHY
         LDY   #$0004
         LDA   [$14]
         STA   [$07],Y
         PHA
         LDY   #$0002
         LDA   [$14],Y
         LDY   #$0006
         STA   [$07],Y
         LSR
         PHA
         _Multiply
         PLA
         PLX
         LDY   #$0002
         STA   [$07],Y
         TAX
         LSR
         CLC
         ADC   #$0003
         STA   $01
         TXA
         CLC
         ADC   #$0006
         TAX
L081D3B  LDY   $01
         LDA   [$14],Y
         AND   #$00FF
         ASL
         TAY
         LDA   [$03],Y
         TXY
         STA   [$07],Y
         DEC   $01
         DEX
         DEX
         CPX   #$0008
         BPL   L081D3B
         LDAL  L0550A9
         PHA
         LDAL  L0550A7
         PHA
         JSL   L07191C
L081D60  LDA   $12
         STA   $16
         LDA   $11
         STA   $15
         LDX   $0F
         TDC
         CLC
         ADC   #$0014
         TCS
         TXA
         TCD
         RTL

L081D73  ENT
         PHD
         TSC
         TCD
         LDX   L05510F
         LDA   [$06]
         STAL  $000000,X
         LDY   #$0002
         LDA   [$06],Y
         STAL  $000002,X
         INY
         INY
         LDA   [$06],Y
         STAL  $000004,X
         INY
         INY
         LDA   [$06],Y
         STAL  $000006,X
         LDA   #$2000
         STAL  $00000E,X
         LDA   #$00E1
         STAL  $000010,X
         LDA   #$0000
         STAL  $000014,X
         STAL  $000016,X
         PHD
         TXA
         TCD
         JSL   ShieldCursor
         PLD
         LDA   $04
         STA   $08
         LDA   $03
         STA   $07
         TDC
         TCS
         PLD
         PLY
         PLY
         RTL

L081DC7  ENT
         PHD
         TSC
         TCD
         PHD
         LDA   L05510F
         TCD
         JSL   UnshieldCursor
         PLD
         TDC
         TCS
         PLD
         RTL

L081DD8  ENT
         PHD
         TSC
         SEC
         SBC   #$0020
         TCD
         TCS
         PHY
         PEI   $26
         JSL   L081A92
         PLA
         LDX   #$001E
L081DEB  STA   $01,X
         DEX
         DEX
         BPL   L081DEB
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         _SetPenPat
         LDA   $24
         STA   $26
         LDA   $23
         STA   $25
         LDX   $21
         TDC
         CLC
         ADC   #$0024
         TCS
         TXA
         TCD
         RTL

L081E14  ENT
         PHD
         PHY
         PHY
         PHY
         PHY
         TSC
         TCD
         LDY   #$0006
L081E1E  TYX
         LDA   [$12],Y
         STA   $01,X
         DEY
         DEY
         BPL   L081E1E
         ASL   $03
         ASL   $07
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $10
         PEI   $0E
         PEI   $10
         PEI   $0E
         JSL   L081E5F
         LDA   $0C
         STA   $14
         LDA   $0B
         STA   $13
         LDX   $09
         TDC
         CLC
         ADC   #$0012
         TCS
         TXA
         TCD
         RTL

L081E53  ENT
         PHB
         PLX
         PLY
         LDA   $03,S
         PHA
         LDA   $03,S
         PHA
         PHY
         PHX
         PLB
L081E5F  ENT
         PHD
         TSC
         TCD
         LDA   [$0E]
         LDY   #$0004
         SEC
         SBC   [$0E],Y
         BPL   L081E78
         INY
         INY
         LDA   [$0E],Y
         LDY   #$0002
         SEC
         SBC   [$0E],Y
         BPL   L081E91
L081E78  LDA   [$0A]
         STA   [$06]
         LDY   #$0002
         LDA   [$0A],Y
         STA   [$06],Y
         INY
         INY
         LDA   [$0A],Y
         STA   [$06],Y
         INY
         INY
         LDA   [$0A],Y
         STA   [$06],Y
         BRA   L081F0D
L081E91  LDA   [$0A]
         LDY   #$0004
         SEC
         SBC   [$0A],Y
         BPL   L081EA7
         INY
         INY
         LDA   [$0A],Y
         LDY   #$0002
         SEC
         SBC   [$0A],Y
         BPL   L081EC0
L081EA7  LDA   [$0E]
         STA   [$06]
         LDY   #$0002
         LDA   [$0E],Y
         STA   [$06],Y
         INY
         INY
         LDA   [$0E],Y
         STA   [$06],Y
         INY
         INY
         LDA   [$0E],Y
         STA   [$06],Y
         BRA   L081F0D
L081EC0  LDA   [$0E]
         SEC
         SBC   [$0A]
         BPL   L081ECD
         LDA   [$0E]
         STA   [$06]
         BRA   L081ED1
L081ECD  LDA   [$0A]
         STA   [$06]
L081ED1  LDY   #$0002
         LDA   [$0E],Y
         SEC
         SBC   [$0A],Y
         BPL   L081EE1
         LDA   [$0E],Y
         STA   [$06],Y
         BRA   L081EE5
L081EE1  LDA   [$0A],Y
         STA   [$06],Y
L081EE5  LDY   #$0004
         LDA   [$0E],Y
         SEC
         SBC   [$0A],Y
         BMI   L081EF5
         LDA   [$0E],Y
         STA   [$06],Y
         BRA   L081EF9
L081EF5  LDA   [$0A],Y
         STA   [$06],Y
L081EF9  LDY   #$0006
         LDA   [$0E],Y
         SEC
         SBC   [$0A],Y
         BMI   L081F09
         LDA   [$0E],Y
         STA   [$06],Y
         BRA   L081F0D
L081F09  LDA   [$0A],Y
         STA   [$06],Y
L081F0D  LDA   $04
         STA   $10
         LDA   $03
         STA   $0F
         TDC
         TCS
         PLD
         CLC
         ADC   #$000E
         TCS
         RTL

L081F1E  ENT
         PHB
         PHD
         TSC
         SEC
         SBC   #$0028
         TCD
         TCS
         LDA   $2F
         STA   $01
         LDA   $31
         STA   $03
         LDA   #$0000
         LDY   #$0012
L081F35  STA   [$01],Y
         DEY
         DEY
         BPL   L081F35
         LDX   #$0017
         LDY   #$0018
L081F41  LDA   #$FF0F
         STA   [$01],Y
         TYA
         CLC
         ADC   #$0012
         TAY
         LDA   #$F0FF
         STA   [$01],Y
         TYA
         CLC
         ADC   #$0006
         TAY
         DEX
         BNE   L081F41
         LDA   #$0000
L081F5D  STA   [$01],Y
         INY
         INY
         CPY   #$0254
         BNE   L081F5D
         LDA   $33
         CLC
         ADC   #$0500
         STA   $05
         LDA   $35
         ADC   #$0000
         STA   $07
         PEI   $06
         PLB
         PLB
         LDA   $01
         CLC
         ADC   #$0018
         STA   $01
         LDA   $03
         ADC   #$0000
         STA   $03
         LDA   #$0001
         STA   $0B
         STA   $09
L081F8F  LDA   $0B
         ASL
         ASL
         CLC
         ADC   $05
         TAY
         LDA   #$0000
         SEP   #$20
         LDX   #$000F
L081F9F  STZ   $0F,X
         DEX
         BPL   L081F9F
         LDA   |$0000,Y
         LSR
         LSR
         LSR
         LSR
         TAX
         INC   $0F,X
         LDA   |$00A3,Y
         LSR
         LSR
         LSR
         LSR
         TAX
         INC   $0F,X
         LDA   $0141,Y
         AND   #$0F
         TAX
         INC   $0F,X
         LDA   $01E2,Y
         AND   #$0F
         TAX
         INC   $0F,X
         LDA   $0280,Y
         AND   #$0F
         TAX
         INC   $0F,X
         LDA   $0323,Y
         AND   #$0F
         TAX
         INC   $0F,X
         LDA   $03C1,Y
         LSR
         LSR
         LSR
         LSR
         TAX
         INC   $0F,X
         LDA   $0462,Y
         LSR
         LSR
         LSR
         LSR
         TAX
         INC   $0F,X
         LDA   #$00
         STA   $21
         LDX   #$000F
         BRA   L081FF8
L081FF5  DEX
         BMI   L082011
L081FF8  CMP   $0F,X
         BCS   L081FF5
         LDA   $0F,X
         STX   $27
         CMP   $21
         BCC   L081FF5
         LDY   $25
         STX   $25
         STY   $27
         LDY   $21
         STA   $21
         TYA
         BRA   L081FF5
L082011  STA   $23
         LDA   $23
         BEQ   L082030
         LDA   $09
         EOR   $0B
         LSR
         BCS   L082029
         LDX   $25
         CPX   #$000F
         BNE   L082032
         LDX   $27
         BRA   L082032
L082029  LDX   $27
         CPX   #$000F
         BNE   L082032
L082030  LDX   $25
L082032  STX   $1F
         LDA   $0B
         LSR
         TAY
         BCC   L082040
         LDA   [$01],Y
         AND   #$F0
         BRA   L08204C
L082040  LDA   $1F
         ASL
         ASL
         ASL
         ASL
         STA   $1F
         LDA   [$01],Y
         AND   #$0F
L08204C  ORA   $1F
         STA   [$01],Y
         REP   #$20
         INC   $0B
         LDA   $0B
         CMP   #$0027
         BCC   L082081
         LDA   #$0001
         STA   $0B
         INC   $09
         LDA   $05
         CLC
         ADC   #$0500
         STA   $05
         BCC   L08206E
         INC   $07
L08206E  LDA   $01
         CLC
         ADC   #$0018
         STA   $01
         BCC   L08207A
         INC   $03
L08207A  LDA   $09
         CMP   #$0018
         BCS   L082084
L082081  BRL   L081F8F
L082084  LDA   $2D
         STA   $35
         LDA   $2B
         STA   $33
         LDX   $29
         TDC
         CLC
         ADC   #$0032
         TCS
         TXA
         TCD
         PLB
         RTL

L082098  PHB
         PHD
         TSC
         SEC
         SBC   #$0042
         TCD
         SEC
         SBC   #$0280
         TCS
         STZ   $1D
         LDY   #$0002
         LDA   [$4D]
         STA   $3B
         LDA   [$4D],Y
         AND   #$FFF8
         STA   $3D
         INY
         INY
         LDA   [$4D],Y
         STA   $3F
         INY
         INY
         LDA   [$4D],Y
         CLC
         ADC   #$0007
         AND   #$FFF8
         STA   $41
         LDA   $3F
         SEC
         SBC   $3B
         STA   $01
         LDA   $3D
         LSR
         LSR
         STA   $03
         LDA   $41
         SEC
         SBC   $3D
         LSR
         LSR
         LSR
         STA   $05
         ASL
         STA   $09
         DEC
         DEC
         STA   $19
         LDA   $3B
         JSL   L082758
         CLC
         ADC   $03
         LDX   $57
         ADC   $55
         BCC   L0820F6
         INX
L0820F6  STA   $1F
         STX   $21
         LDA   $51
         STA   $23
         LDA   $53
         STA   $25
         STZ   $0B
         LDA   #$FFFF
         STA   $0D
         STZ   $0F
         LDA   $05
         LSR
         LSR
         LSR
         INC
         INC
         STA   $13
         TDC
         CLC
         ADC   #$FF61
         STA   $27
         STZ   $29
         TDC
         CLC
         ADC   #$FEC1
         STA   $2B
         STZ   $2D
         TDC
         CLC
         ADC   #$FE21
         STA   $2F
         STZ   $31
         TDC
         CLC
         ADC   #$FD81
         STA   $33
         STZ   $35
         PEA   $0000
         PLB
         PLB
         PEI   $2D
         PEI   $2B
         PEA   $FFFF
         PEI   $09
         JSL   L081AE3
         PEI   $31
         PEI   $2F
         PEA   $0000
         PEI   $09
         JSL   L081AE3
L082157  LDY   $19
         BEQ   L082163
L08215B  LDA   [$1F],Y
         STA   ($27),Y
         DEY
         DEY
         BPL   L08215B
L082163  LDA   #$002E
         CMP   $0B
         BNE   L08216D
         JSR   L0822E3
L08216D  PHY
         PEI   $29
         PEI   $27
         PEI   $2D
         PEI   $2B
         PEI   $09
         JSL   L08068A
         PLA
         STA   $15
         BNE   L08218A
         LDA   #$0010
         JSR   L0822FD
         BRL   L08228C
L08218A  PHY
         PEI   $29
         PEI   $27
         PEI   $31
         PEI   $2F
         PEI   $09
         JSL   L08068A
         PLA
         STA   $17
         BNE   L0821A7
         LDA   #$0011
         JSR   L0822FD
         BRL   L08228C
L0821A7  JSR   L0822E3
         PHY
         PEI   $29
         PEI   $27
         PEI   $09
         JSL   L0825B0
         PLA
         BEQ   L0821CE
         LDA   #$0001
         JSR   L0822D2
         LDA   [$27]
         JSR   L0822D2
         LDY   #$0001
         LDA   [$27],Y
         JSR   L0822D2
         BRL   L08228C
L0821CE  STZ   $0F
         LDA   $27
         LDX   $29
         STA   $37
         STX   $39
         PHY
         PEI   $29
         PEI   $27
         PEI   $09
         JSL   L0806B2
         PLA
         STA   $11
         CMP   $13
         BCC   L082219
         LDA   $15
         CMP   $11
         BCS   L082202
         INC   $0F
         LDA   $33
         LDX   $35
         STA   $37
         STX   $39
         LDA   $15
         STA   $11
         CMP   $13
         BCC   L082219
L082202  LDA   $17
         CMP   $11
         BCS   L082219
         LDA   #$0002
         STA   $0F
         LDA   $33
         LDX   $35
         STA   $37
         STX   $39
         LDA   $17
         STA   $11
L082219  LDA   $0F
         BEQ   L08223E
         PEI   $29
         PEI   $27
         LDA   $0F
         DEC
         BNE   L08222A
         LDA   $2B
         BRA   L08222C
L08222A  LDA   $2F
L08222C  STA   $1B
         LDY   $09
         BEQ   L08223E
         DEY
         DEY
L082234  LDA   ($27),Y
         EOR   ($1B),Y
         STA   ($33),Y
         DEY
         DEY
         BPL   L082234
L08223E  LDA   $0F
         INC
         INC
         INC
         JSR   L0822D2
         PHY
         PEI   $39
         PEI   $37
         PEI   $25
         PEI   $23
         PEI   $09
         JSL   L082320
         PLA
         STA   $07
         CMP   $09
         BCC   L082281
         BEQ   L082281
         LDA   $23
         BNE   L082264
         DEC   $25
L082264  DEC
         STA   $23
         LDA   #$0000
         JSR   L0822D2
         PEI   $29
         PEI   $27
         PEI   $25
         PEI   $23
         PEA   $0000
         LDA   $09
         PHA
         STA   $07
         JSL   L070597
L082281  LDA   $07
         CLC
         ADC   $23
         STA   $23
         BCC   L08228C
         INC   $25
L08228C  LDX   $2F
         LDA   $2B
         STA   $2F
         LDA   $27
         STA   $2B
         STX   $27
         LDA   $1F
         CLC
         ADC   #$00A0
         BCC   L0822A2
         INC   $21
L0822A2  STA   $1F
         DEC   $01
         BEQ   L0822AB
         BRL   L082157
L0822AB  JSR   L0822E3
         LDA   $23
         SEC
         SBC   $51
         STA   [$49]
         LDA   $25
         SBC   $53
         LDY   #$0002
         STA   [$49],Y
         LDA   $47
         STA   $57
         LDA   $45
         STA   $55
         LDX   $43
         TDC
         CLC
         ADC   #$0054
         TCS
         TXA
         TCD
         PLB
         RTL

L0822D2  SEP   #$20
         STA   [$23]
         REP   #$20
         INC   $23
         BNE   L0822E2
         INC   $24
         BNE   L0822E2
         INC   $25
L0822E2  RTS

L0822E3  LDA   $0B
         BEQ   L0822F7
         LDA   #$0021
         CLC
         ADC   $0B
         JSR   L0822D2
         LDA   $0D
         JSR   L0822D2
         STZ   $0B
L0822F7  LDA   #$FFFF
         STA   $0D
         RTS

L0822FD  CMP   $0D
         BNE   L082315
         LDA   $0B
         BNE   L08230E
         LDA   $23
         BNE   L08230B
         DEC   $25
L08230B  DEC
         STA   $23
L08230E  INC   $0B
         BNE   L082314
         INC   $0C
L082314  RTS

L082315  TAX
         JSR   L0822E3
         STX   $0D
         TXA
         JSR   L0822D2
         RTS

L082320  PHD
         TSC
         SEC
         SBC   #$001C
         TCD
         TCS
         LDA   $24
         STA   $01
         LDA   $26
         STA   $03
         LDA   $22
         STA   $05
         STZ   $11
         STZ   $15
         STZ   $19
L08233A  LDA   $05
         BNE   L082341
         BRL   L082539
L082341  LDA   $11
         BMI   L08237D
         LDY   #$0000
         LDX   $05
L08234A  SEP   #$20
L08234C  LDA   [$28],Y
         BEQ   L082358
         INY
         DEX
         BNE   L08234C
         REP   #$20
         BRA   L082370
L082358  STY   $07
L08235A  LDA   [$28],Y
         BNE   L082362
         INY
         DEX
         BNE   L08235A
L082362  REP   #$20
         TYA
         SEC
         SBC   $07
         LSR
         LSR
         LSR
         BNE   L082377
         TXA
         BNE   L08234A
L082370  LDA   #$FFFF
         STA   $11
         BRA   L08237D
L082377  STA   $13
         LDY   $07
         STY   $11
L08237D  LDA   $19
         BMI   L0823E6
         STZ   $07
L082383  LDX   #$0000
         LDY   $07
         LDA   [$28],Y
         STA   $09
         INY
         INY
         CPY   $05
         BCS   L0823E1
         LDA   [$28],Y
         STA   $0B
         INY
         INY
         CPY   $05
         BCS   L0823E1
         LDA   $09
         ORA   $0B
         BNE   L0823A6
         STY   $07
         BRA   L082383
L0823A6  LDA   [$28],Y
         CMP   $09
         BNE   L0823C3
         INY
         INY
         CPY   $05
         BCS   L0823C3
         LDA   [$28],Y
         CMP   $0B
         BNE   L0823C3
         INY
         CPY   $05
         BCS   L0823C3
         INX
         INY
         CPY   $05
         BCC   L0823A6
L0823C3  TXA
         BNE   L0823D0
         LDA   $07
         CLC
         ADC   #$0004
         STA   $07
         BRA   L082383
L0823D0  INC
         CMP   #$0020
         BCC   L0823D9
         LDA   #$001F
L0823D9  STA   $1B
         LDY   $07
         STY   $19
         BRA   L0823E6
L0823E1  LDA   #$FFFF
         STA   $19
L0823E6  LDA   $15
         BMI   L08242E
         STZ   $07
L0823EC  LDY   $07
         LDX   #$0000
         SEP   #$20
         CPY   $05
         BCS   L082417
         LDA   [$28],Y
         INY
         CPY   $05
         BCS   L082408
L0823FE  CMP   [$28],Y
         BNE   L082408
         INX
         INY
         CPY   $05
         BCC   L0823FE
L082408  REP   #$20
         TXA
         INC
         LSR
         LSR
         CMP   #$0002
         BCS   L082420
         STY   $07
         BRA   L0823EC
L082417  REP   #$20
         LDA   #$FFFF
         STA   $15
         BRA   L08242E
L082420  CMP   #$0020
         BCC   L082428
         LDA   #$001F
L082428  STA   $17
         LDY   $07
         STY   $15
L08242E  LDA   $05
         LDX   #$0000
         CMP   $11
         BCC   L08243A
         LDA   $11
         INX
L08243A  CMP   $15
         BEQ   L082445
         BCC   L082445
         LDA   $15
         LDX   #$0002
L082445  CMP   $19
         BEQ   L082450
         BCC   L082450
         LDA   $19
         LDX   #$0003
L082450  STX   $0D
         STA   $0F
         LDA   $0F
         AND   #$FFF8
         BEQ   L082486
         TAX
         LSR
         LSR
         LSR
         ORA   #$00A0
         STA   [$24]
         LDA   #$0001
         JSR   L082553
         TXY
         DEY
         DEY
L08246D  LDA   [$28],Y
         STA   [$24],Y
         DEY
         DEY
         BPL   L08246D
         TXA
         JSR   L08255D
         TXA
         JSR   L082553
         STX   $09
         LDA   $0F
         SEC
         SBC   $09
         STA   $0F
L082486  LDA   $0F
         BEQ   L0824D2
         LDY   #$0000
         TYX
L08248E  LDA   [$28],Y
         AND   #$00FF
         BNE   L08249B
         INX
         INY
         CPY   $0F
         BNE   L08248E
L08249B  STX   $09
         LDA   $0F
         SEC
         SBC   $09
         STA   $0B
         LDA   $09
         JSR   L08255D
         LDA   $0B
         ASL
         ASL
         ASL
         ORA   $09
         STA   [$24]
         LDA   #$0001
         JSR   L082553
         LDY   $0B
         BEQ   L0824D2
         DEY
         SEP   #$20
L0824BF  LDA   [$28],Y
         STA   [$24],Y
         DEY
         BPL   L0824BF
         REP   #$20
         LDA   $0B
         JSR   L08255D
         LDA   $0B
         JSR   L082553
L0824D2  LDA   $0D
         BEQ   L082539
         DEC
         BNE   L0824F1
         LDA   $13
         ORA   #$0080
         STA   [$24]
         LDA   #$0001
         JSR   L082553
         LDA   $13
         ASL
         ASL
         ASL
         JSR   L08255D
         BRL   L08233A
L0824F1  DEC
         BEQ   L08251C
         LDA   $1B
         ORA   #$00E0
         STA   [$24]
         LDA   #$0001
         JSR   L082553
         LDY   #$0002
         LDA   [$28],Y
         STA   [$24],Y
         LDA   [$28]
         STA   [$24]
         LDA   #$0004
         JSR   L082553
         LDA   $1B
         ASL
         ASL
         JSR   L08255D
         BRL   L08233A
L08251C  LDA   [$28]
         XBA
         AND   #$FF00
         ORA   $17
         ORA   #$00C0
         STA   [$24]
         LDA   #$0002
         JSR   L082553
         LDA   $17
         ASL
         ASL
         JSR   L08255D
         BRL   L08233A
L082539  LDA   $24
         SEC
         SBC   $01
         STA   $2C
         LDA   $20
         STA   $2A
         LDA   $1F
         STA   $29
         LDX   $1D
         TDC
         CLC
         ADC   #$0028
         TCS
         TXA
         TCD
         RTL

L082553  CLC
         ADC   $24
         STA   $24
         BCC   L08255C
         INC   $26
L08255C  RTS

L08255D  PHA
         CLC
         ADC   $28
         STA   $28
         BCC   L082567
         INC   $2A
L082567  LDA   $05
         SEC
         SBC   $01,S
         PLX
         STA   $05
         RTS

L082570  ENT
         PHD
         PHY
         TSC
         TCD
         LDY   #$001E
L082577  LDA   [$08],Y
         XBA
         STA   $01
         DEY
         DEY
         LDA   [$08],Y
         XBA
         LSR
         ROR   $01
         BCC   L082589
         ORA   #$8000
L082589  LSR
         ROR   $01
         BCC   L082591
         ORA   #$8000
L082591  XBA
         STA   [$08],Y
         LDA   $01
         XBA
         INY
         INY
         STA   [$08],Y
         DEY
         DEY
         DEY
         DEY
         BPL   L082577
         LDA   $06
         STA   $0A
         LDA   $05
         STA   $09
         TDC
         TCS
         PLY
         PLD
         PLY
         PLY
         RTL

L0825B0  PHD
         TSC
         TCD
         STZ   $0C
         LDY   $06
         DEY
         DEY
         LDA   [$08],Y
L0825BB  CMP   [$08],Y
         BNE   L0825C5
         DEY
         DEY
         BPL   L0825BB
         INC   $0C
L0825C5  LDA   $04
         STA   $0A
         LDA   $03
         STA   $09
         TDC
         TCS
         PLD
         PLY
         PLY
         PLY
         RTL

L0825D4  ENT
         PHD
         TSC
         SEC
         SBC   #$0016
         TCD
         TCS
         LDA   L0550A1
         STA   $01
         LDA   L0550A3
         STA   $03
L0825E6  LDA   L05509F
         CMP   [$01]
         BCS   L0825F0
         BRL   L08268D
L0825F0  JSR   L0826E5
L0825F3  LDA   [$01]
         CMP   #$3FFF
         BNE   L0825FF
         JSR   L0826E5
         BRA   L0825E6
L0825FF  STA   $07
         JSR   L0826E5
         LDA   [$01]
         STA   $09
         CMP   L052F41
         BEQ   L082687
         BCC   L082687
         LDA   $07
         CMP   L052F45
         BCS   L082687
         CMP   L052F41
         BCS   L082620
         LDA   L052F41
         STA   $07
L082620  LDA   $09
         CMP   L052F45
         BCC   L08262C
         LDA   L052F45
         STA   $09
L08262C  LDA   $07
         LSR
         LSR
         AND   #$FFFE
         STA   $0B
         LDA   $09
         DEC
         LSR
         LSR
         AND   #$FFFE
         STA   $0D
         LDA   $07
         AND   #$0007
         ASL
         TAX
         LDAL  L0826F2,X
         STA   $0F
         LDA   $09
         DEC
         AND   #$0007
         ASL
         TAX
         LDAL  L082702,X
         STA   $11
         LDY   $0B
         LDA   $0F
         CPY   $0D
         BNE   L082664
         AND   $11
L082664  EOR   L052E9F,Y
         STA   L052E9F,Y
         CPY   $0D
         BEQ   L082687
         BRA   L082679
L082670  LDA   L052E9F,Y
         EOR   #$FFFF
         STA   L052E9F,Y
L082679  INY
         INY
         CPY   $0D
         BNE   L082670
         LDA   L052E9F,Y
         EOR   $11
         STA   L052E9F,Y
L082687  JSR   L0826E5
         BRL   L0825F3
L08268D  LDA   [$01]
         STA   L05509D
         LDA   $01
         STA   L0550A1
         LDA   $03
         STA   L0550A3
         STZ   L05509B
         LDA   L052F41
         LSR
         LSR
         AND   #$FFFE
         STA   $13
         TAX
         LDA   L052F45
         DEC
         LSR
         LSR
         AND   #$FFFE
         STA   $15
L0826B5  LDA   L052E9F,X
         BNE   L0826C7
         INX
         INX
         CPX   $15
         BCC   L0826B5
         BEQ   L0826B5
         INC   L05509B
         BRA   L0826DA
L0826C7  LDX   $13
L0826C9  LDA   L052E9F,X

*

         INC
         BNE   L0826DA
         INX
         INX
         CPX   $15
         BCC   L0826C9
         BEQ   L0826C9
         DEC   L05509B
L0826DA  LDX   $17
         TDC
         CLC
         ADC   #$0018
         TCS
         TXA
         TCD
         RTL

L0826E5  LDA   $01
         CLC
         ADC   #$0002
         STA   $01
         BCC   L0826F1
         INC   $03
L0826F1  RTS

L0826F2  DW    $FFFF
         DW    $FF3F
         DW    $FF0F
         DW    $FF03
         DW    $FF00
         DW    $3F00
         DW    $0F00
         DW    $0300
L082702  DW    $00C0
         DW    $00F0
         DW    $00FC
         DW    $00FF
         DW    $C0FF
         DW    $F0FF
         DW    $FCFF
         DW    $FFFF
L082712  ENT
         PHD
         TSC
         TCD
         LDA   #$0000
         STA   [$06]
         LDY   #$0002
         STA   [$06],Y
         INY
         INY
         LDA   #$00C8
         STA   [$06],Y
         INY
         INY
         LDA   #$0280
         STA   [$06],Y
         LDA   $04
         STA   $08
         LDA   $03
         STA   $07
         TDC
         TCS
         PLD
         PLY
         PLY
         RTL

L08273B  ENT
         PHD
         TSC
         TCD
         LDA   #$0000
         LDY   #$0006
L082744  STA   [$06],Y
         DEY
         DEY
         BPL   L082744
         LDA   $04
         STA   $08
         LDA   $03
         STA   $07
         TDC
         TCS
         PLD
         PLY
         PLY
         RTL

L082758  ENT
         PHA
         ASL
         ASL
         ADC   $01,S
         ASL
         ASL
         ASL
         ASL
         ASL
         STA   $01,S
         PLA
         RTL

L082766  ENT
         PHD
         TSC
         SEC
         SBC   #$001C
         TCD
         TCS
         LDA   [$22]
         STA   $15
         LDY   #$0002
         LDA   [$22],Y
         STA   $17
         INY
         INY
         LDA   [$22],Y
         STA   $19
         INY
         INY
         LDA   [$22],Y
         STA   $1B
         LDA   $17
         LSR
         LSR
         AND   #$FFFE
         STA   $09
         LDA   $1B
         DEC
         LSR
         LSR
         AND   #$FFFE
         STA   $0B
         LDA   $17
         AND   #$0006
         TAX
         LDAL  L08294E,X
         STA   $0D
         LDA   $1B
         DEC
         AND   #$0006
         TAX
         LDAL  L082956,X
         STA   $0F
         LDA   $15
         JSL   L082758
         PHA
         CLC
         ADC   $09
         STA   $01
         PLA
         CLC
         ADC   $0B
         STA   $03
         LDA   $19
         DEC
         JSL   L082758
         PHA
         CLC
         ADC   $09
         STA   $05
         PLA
         CLC
         ADC   $0B
         STA   $07
         LDY   $01
L0827D8  LDA   [$26],Y
         ORA   $0D
         CPY   $03
         BNE   L0827E4
         BRA   L0827EA
L0827E2  AND   [$26],Y
L0827E4  INY
         INY
         CPY   $03
         BNE   L0827E2
L0827EA  STA   $11
         LDA   [$26],Y
         ORA   $0F
         AND   $11
         INC
         BNE   L082818
         TYA
         CLC
         ADC   #$00A0
         STA   $03
         LDA   $01
         CLC
         ADC   #$00A0
         STA   $01
         TAY
         INC   $15
         LDA   $15
         CMP   $19
         BNE   L0827D8
         STZ   $15
         STZ   $17
         STZ   $19
         STZ   $1B
         BRL   L082922
L082818  LDY   $05
L08281A  LDA   [$26],Y
         ORA   $0D
         CPY   $07
         BNE   L082826
         BRA   L08282C
L082824  AND   [$26],Y
L082826  INY
         INY
         CPY   $07
         BNE   L082824
L08282C  STA   $11
         LDA   [$26],Y
         ORA   $0F
         AND   $11
         INC
         BNE   L08284B
         TYA
         SEC
         SBC   #$00A0
         STA   $07
         LDA   $05
         SEC
         SBC   #$00A0
         STA   $05
         TAY
         DEC   $19
         BRA   L08281A
L08284B  LDA   $05
         CLC
         ADC   #$00A0
         STA   $09
         LDA   $07
         CLC
         ADC   #$00A0
         STA   $0B
         LDA   $17
         LSR
         AND   #$FFFC
         STA   $17
         LDA   $1B
         INC
         LSR
         CLC
         ADC   #$0003
         AND   #$FFFC
         STA   $1B
         LDA   #$FFFF
         STA   $13
L082875  LDY   $01
L082877  LDA   [$26],Y
         AND   $13
         STA   $13
         TYA
         CLC
         ADC   #$00A0
         TAY
         CPY   $05
         BCC   L082877
         BEQ   L082877
         LDA   $13
         CPY   $09
         BNE   L082891
         ORA   $0D
L082891  CPY   $0B
         BNE   L082897
         ORA   $0F
L082897  STA   $13
         ORA   #$FF0F
         INC
         BNE   L0828C9
         INC   $17
         LDA   $13
         ORA   #$FFF0
         INC
         BNE   L0828C9
         INC   $17
         LDA   $13
         ORA   #$0FFF
         INC
         BNE   L0828C9
         INC   $17
         LDA   $13
         ORA   #$F0FF
         INC
         BNE   L0828C9
         INC   $17
         INC   $01
         INC   $01
         INC   $05
         INC   $05
         BRA   L082875
L0828C9  LDA   #$FFFF
         STA   $13
L0828CE  LDY   $03
L0828D0  LDA   [$26],Y
         AND   $13
         STA   $13
         TYA
         CLC
         ADC   #$00A0
         TAY
         CPY   $07
         BCC   L0828D0
         BEQ   L0828D0
         LDA   $13
         CPY   $09
         BNE   L0828EA
         ORA   $0D
L0828EA  CPY   $0B
         BNE   L0828F0
         ORA   $0F
L0828F0  STA   $13
         ORA   #$F0FF
         INC
         BNE   L082922
         DEC   $1B
         LDA   $13
         ORA   #$0FFF
         INC
         BNE   L082922
         DEC   $1B
         LDA   $13
         ORA   #$FFF0
         INC
         BNE   L082922
         DEC   $1B
         LDA   $13
         ORA   #$FF0F
         INC
         BNE   L082922
         DEC   $1B
         DEC   $03
         DEC   $03
         DEC   $07
         DEC   $07
         BRA   L0828CE
L082922  LDA   $15
         STA   [$22]
         LDY   #$0002
         LDA   $17
         ASL
         STA   [$22],Y
         INY
         INY
         LDA   $19
         STA   [$22],Y
         INY
         INY
         LDA   $1B
         ASL
         STA   [$22],Y
         LDA   $20
         STA   $28
         LDA   $1F
         STA   $27
         LDX   $1D
         TDC
         CLC
         ADC   #$0026
         TCS
         TXA
         TCD
         RTL

L08294E  DW    $0000
         DW    $00F0
         DW    $00FF
         DW    $F0FF
L082956  DW    $FF0F
         DW    $FF00
         DW    $0F00
         DW    $0000
L08295E  ENT
         PHD
         TSC
         SEC
         SBC   #$001C
         TCD
         TCS
         LDA   [$22]
         STA   $15
         LDY   #$0002
         LDA   [$22],Y
         STA   $17
         INY
         INY
         LDA   [$22],Y
         STA   $19
         INY
         INY
         LDA   [$22],Y
         STA   $1B
         LDA   $17
         LSR
         LSR
         AND   #$FFFE
         STA   $09
         LDA   $1B
         DEC
         LSR
         LSR
         AND   #$FFFE
         STA   $0B
         LDA   $17
         AND   #$0006
         TAX
         LDAL  L082B36,X
         STA   $0D
         LDA   $1B
         DEC
         AND   #$0006
         TAX
         LDAL  L082B3E,X
         STA   $0F
         LDA   $15
         JSL   L082758
         PHA
         CLC
         ADC   $09
         STA   $01
         PLA
         CLC
         ADC   $0B
         STA   $03
         LDA   $19
         DEC
         JSL   L082758
         PHA
         CLC
         ADC   $09
         STA   $05
         PLA
         CLC
         ADC   $0B
         STA   $07
         LDY   $01
L0829D0  LDA   [$26],Y
         AND   $0D
         CPY   $03
         BNE   L0829DC
         BRA   L0829E2
L0829DA  ORA   [$26],Y
L0829DC  INY
         INY
         CPY   $03
         BNE   L0829DA
L0829E2  STA   $11
         LDA   [$26],Y
         AND   $0F
         ORA   $11
         BNE   L082A0F
         TYA
         CLC
         ADC   #$00A0
         STA   $03
         LDA   $01
         CLC
         ADC   #$00A0
         STA   $01
         TAY
         INC   $15
         LDA   $15
         CMP   $19
         BNE   L0829D0
         STZ   $15
         STZ   $17
         STZ   $19
         STZ   $1B
         BRL   L082B0A
L082A0F  LDY   $05
L082A11  LDA   [$26],Y
         AND   $0D
         CPY   $07
         BNE   L082A1D
         BRA   L082A23
L082A1B  ORA   [$26],Y
L082A1D  INY
         INY
         CPY   $07
         BNE   L082A1B
L082A23  STA   $11
         LDA   [$26],Y
         AND   $0F
         ORA   $11
         BNE   L082A41
         TYA
         SEC
         SBC   #$00A0
         STA   $07
         LDA   $05
         SEC
         SBC   #$00A0
         STA   $05
         TAY
         DEC   $19
         BRA   L082A11
L082A41  LDA   $05
         CLC
         ADC   #$00A0
         STA   $09
         LDA   $07
         CLC
         ADC   #$00A0
         STA   $0B
         LDA   $17
         LSR
         AND   #$FFFC
         STA   $17
         LDA   $1B
         INC
         LSR
         CLC
         ADC   #$0003
         AND   #$FFFC
         STA   $1B
         STZ   $13
L082A68  LDY   $01
L082A6A  LDA   [$26],Y
         ORA   $13
         STA   $13
         TYA
         CLC
         ADC   #$00A0
         TAY
         CPY   $05
         BCC   L082A6A
         BEQ   L082A6A
         LDA   $13
         CPY   $09
         BNE   L082A84
         AND   $0D
L082A84  CPY   $0B
         BNE   L082A8A
         AND   $0F
L082A8A  STA   $13
         AND   #$00F0
         BNE   L082AB8
         INC   $17
         LDA   $13
         AND   #$000F
         BNE   L082AB8
         INC   $17
         LDA   $13
         AND   #$F000
         BNE   L082AB8
         INC   $17
         LDA   $13
         AND   #$0F00
         BNE   L082AB8
         INC   $17
         INC   $01
         INC   $01
         INC   $05
         INC   $05
         BRA   L082A68
L082AB8  STZ   $13
L082ABA  LDY   $03
L082ABC  LDA   [$26],Y
         ORA   $13
         STA   $13
         TYA
         CLC
         ADC   #$00A0
         TAY
         CPY   $07
         BCC   L082ABC
         BEQ   L082ABC
         LDA   $13
         CPY   $09
         BNE   L082AD6
         AND   $0D
L082AD6  CPY   $0B
         BNE   L082ADC
         AND   $0F
L082ADC  STA   $13
         AND   #$0F00
         BNE   L082B0A
         DEC   $1B
         LDA   $13
         AND   #$F000
         BNE   L082B0A
         DEC   $1B
         LDA   $13
         AND   #$000F
         BNE   L082B0A
         DEC   $1B
         LDA   $13
         AND   #$00F0
         BNE   L082B0A
         DEC   $1B
         DEC   $03
         DEC   $03
         DEC   $07
         DEC   $07
         BRA   L082ABA
L082B0A  LDA   $15
         STA   [$22]
         LDY   #$0002
         LDA   $17
         ASL
         STA   [$22],Y
         INY
         INY
         LDA   $19
         STA   [$22],Y
         INY
         INY
         LDA   $1B
         ASL
         STA   [$22],Y
         LDA   $20
         STA   $28
         LDA   $1F
         STA   $27
         LDX   $1D
         TDC
         CLC
         ADC   #$0026
         TCS
         TXA
         TCD
         RTL

L082B36  DW    $FFFF
         DW    $FF0F
         DW    $FF00
         DW    $0F00
L082B3E  DW    $00F0
         DW    $00FF
         DW    $F0FF
         DW    $FFFF
L082B46  PHD
         TSC
         SEC
         SBC   #$0014
         TCD
         TCS
         LDA   [$20]
         STA   $07
         LDY   #$0002
         LDA   [$20],Y
         STA   $09
         LDA   $1C
         CLC
         ADC   $1A
         STA   $0F
         LDA   $1E
         BCC   L082B65
         INC
L082B65  STA   $11
L082B67  STZ   $0B
         STZ   $0D
         LDA   #$0000
         SEP   #$20
         LDA   [$07]
         INC   $07
         BNE   L082B7C
         INC   $08
         BNE   L082B7C
         INC   $09
L082B7C  AND   #$FF
         BMI   L082BB1
         PHA
         AND   #$07
         BEQ   L082B99
         TAY
         TAX
         DEY
         LDA   #$00
L082B8A  STA   [$1C],Y
         DEY
         BPL   L082B8A
         TXA
         CLC
         ADC   $1C
         STA   $1C
         BCC   L082B99
         INC   $1D
L082B99  PLA
         LSR
         LSR
         LSR
         BEQ   L082BAC
         STA   $0B
         STA   $0D
         TAY
         DEY
L082BA5  LDA   [$07],Y
         STA   [$1C],Y
         DEY
         BPL   L082BA5
L082BAC  REP   #$20
         BRL   L082C2F
L082BB1  ASL
         ASL
         BCS   L082BE8
         ASL
         BCS   L082BCF
         REP   #$20
         STA   $0D
         DEC
         DEC
         TAY
         LDA   #$0000
L082BC2  STA   [$1C],Y
         DEY
         DEY
         STA   [$1C],Y
         DEY
         DEY
         BPL   L082BC2
         BRL   L082C2F
L082BCF  REP   #$20
         STA   $0D
         STA   $0B
         DEC
         DEC
         TAY
L082BD8  LDA   [$07],Y
         STA   [$1C],Y
         DEY
         DEY
         LDA   [$07],Y
         STA   [$1C],Y
         DEY
         DEY
         BPL   L082BD8
         BRA   L082C2F
L082BE8  ASL
         BCS   L082C0A
         REP   #$20
         LSR
         STA   $0D
         TAY
         LDA   #$0001
         STA   $0B
         LDA   [$07]
         AND   #$00FF
         STA   $13
         XBA
         ORA   $13
         DEY
         DEY
L082C02  STA   [$1C],Y
         DEY
         DEY
         BPL   L082C02
         BRA   L082C2F
L082C0A  REP   #$20
         LSR
         STA   $0D
         TAX
         LDA   #$0004
         STA   $0B
         LDY   #$0002
         LDA   [$07]
         STA   $13
         LDA   [$07],Y
         TXY
         TAX
         DEY
         DEY
L082C22  TXA
         STA   [$1C],Y
         DEY
         DEY
         LDA   $13
         STA   [$1C],Y
         DEY
         DEY
         BPL   L082C22
L082C2F  LDA   $0B
         BEQ   L082C3C
         CLC
         ADC   $07
         STA   $07
         BCC   L082C3C
         INC   $09
L082C3C  LDA   $1C
         LDX   $1E
         CLC
         ADC   $0D
         STA   $1C
         BCC   L082C4A
         INX
         STX   $1E
L082C4A  CPX   $11
         BCC   L082C50
         BNE   L082C57
L082C50  CMP   $0F
         BCS   L082C57
         BRL   L082B67
L082C57  LDA   $07
         STA   [$20]
         LDY   #$0002
         LDA   $09
         STA   [$20],Y
         LDA   $18
         STA   $22
         LDA   $17
         STA   $21
         LDX   $15
         TDC
         CLC
         ADC   #$0020
         TCS
         TXA
         TCD
         RTL

L082C75  PHB
         PHD
         TSC
         SEC
         SBC   #$0026
         TCD
         SEC
         SBC   #$01E0
         TCS
         LDA   $2D
         CMP   #$0002
         BEQ   L082C93
         PEA   $0038
         JSL   L0727E0
         BRL   L082E79
L082C93  LDY   #$0006
         LDA   [$31],Y
         CLC
         ADC   #$0007
         AND   #$FFF8
         STA   $11
         DEY
         DEY
         LDA   [$31],Y
         STA   $0F
         DEY
         DEY
         LDA   [$31],Y
         AND   #$FFF8
         STA   $0D
         LDA   [$31]
         STA   $0B
         PHY
         PEA   ^L053259
         PEA   L053259
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEA   $0000
         PHA
         _SectRect
         PLA
         BNE   L082CD5
         BRL   L082E79
L082CD5  LDA   $0F
         SEC
         SBC   $0B
         STA   $13
         LDA   $11
         SEC
         SBC   $0D
         LSR
         LSR
         STA   $09
         TAY
         LSR
         STA   $15
         DEY
         DEY
         STY   $07
         LDA   $0B
         JSL   L082758
         STA   $17
         LDA   $0D
         LSR
         LSR
         CLC
         ADC   $17
         CLC
         ADC   $35
         STA   $17
         LDA   $37
         ADC   #$0000
         STA   $19
         STZ   $01
         STZ   $03
         TDC
         CLC
         ADC   #$FF61
         STA   $1B
         STZ   $1D
         TDC
         CLC
         ADC   #$FEC1
         STA   $1F
         STZ   $21
         TDC
         CLC
         ADC   #$FE21
         STA   $23
         STZ   $25
         PEA   $0000
         PLB
         PLB
         LDY   $07
         LDA   #$FFFF
L082D31  STA   ($1F),Y
         DEY
         DEY
         BPL   L082D31
         LDY   $07
         LDA   #$0000
L082D3C  STA   ($23),Y
         DEY
         DEY
         BPL   L082D3C
L082D42  LDA   $01
         BEQ   L082D4C
         DEC   $01
         LDA   $05
         BRA   L082D59
L082D4C  LDA   [$39]
         INC   $39
         BNE   L082D54
         INC   $3B
L082D54  AND   #$00FF
         STA   $05
L082D59  CMP   #$0015
         BCS   L082D90
         ASL
         TAX
         LDAL  L082D66,X
         PHA
         RTS

L082D66  DA    L082DA1+1
         DA    L082DAF+2
         DA    L082DBF+2
         DA    L082DC4+1
         DA    L082DC4+1
         DA    L082DC4+1
         DA    L082E76+2
         DA    L082E76+2
         DA    L082E76+2
         DA    L082E76+2
         DA    L082E76+2
         DA    L082E76+2
         DA    L082E76+2
         DA    L082E76+2
         DA    L082E76+2
         DA    L082E76+2
         DA    L082E01+1
         DA    L082E0D+1
         DA    L082E19+1
         DA    L082E19+1
         DA    L082E19+1
L082D90  SEC
         SBC   #$0020
         BMI   L082D9B
         CMP   #$0030
         BCC   L082D9E
L082D9B  BRL   L082E79
L082D9E  DEC
         STA   $01
L082DA1  BRA   L082D4C
         LDY   $07
L082DA5  LDA   [$39],Y
         STA   ($1B),Y
         DEY
         DEY
         BPL   L082DA5
         LDA   $09
L082DAF  BRL   L082E26
         LDA   [$39]
         LDY   $07
L082DB6  STA   ($1B),Y
         DEY
         DEY
         BPL   L082DB6
         LDA   #$0002
L082DBF  BRL   L082E26
         LDA   $03
L082DC4  BRA   L082DCC
         LDA   $05
         SEC
         SBC   #$0003
L082DCC  PHA
         TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         PEI   $1D
         PEI   $1B
         PEI   $09
         JSL   L082B46
         PLA
         BNE   L082DE6
         BRL   L082E2F
L082DE6  LDY   $07
         DEC
         BNE   L082DF7
L082DEB  LDA   ($1B),Y
         EOR   ($1F),Y
         STA   ($1B),Y
         DEY
         DEY
         BPL   L082DEB
         BRA   L082E2F
L082DF7  LDA   ($1B),Y
         EOR   ($23),Y
         STA   ($1B),Y
         DEY
         DEY
         BPL   L082DF7
L082E01  BRA   L082E2F
         LDY   $07
L082E05  LDA   ($1F),Y
         STA   ($1B),Y
         DEY
         DEY
         BPL   L082E05
L082E0D  BRA   L082E2F
         LDY   $07
L082E11  LDA   ($23),Y
         STA   ($1B),Y
         DEY
         DEY
         BPL   L082E11
L082E19  BRA   L082E2F
         LDA   $05
         SEC
         SBC   #$0012
         STA   $03
         BRL   L082D42
L082E26  CLC
         ADC   $39
         STA   $39
         BCC   L082E2F
         INC   $3B
L082E2F  LDY   $07
         LDA   $2F
         BNE   L082E3F
L082E35  LDA   ($1B),Y
         STA   [$17],Y
         DEY
         DEY
         BPL   L082E35
         BRA   L082E5A
L082E3F  CMP   #$8003
         BEQ   L082E50
L082E44  LDA   ($1B),Y
         ORA   [$17],Y
         STA   [$17],Y
         DEY
         DEY
         BPL   L082E44
         BRA   L082E5A
L082E50  LDA   ($1B),Y
         AND   [$17],Y
         STA   [$17],Y
         DEY
         DEY
         BPL   L082E50
L082E5A  LDA   $17
         CLC
         ADC   #$00A0
         STA   $17
         BCC   L082E66
         INC   $19
L082E66  LDY   $23
         LDA   $1F
         STA   $23
         LDA   $1B
         STA   $1F
         STY   $1B
         DEC   $13
         BEQ   L082E79
L082E76  BRL   L082D42
L082E79  LDA   $2B
         STA   $3B
         LDA   $29
         STA   $39
         LDX   $27
         TDC
         CLC
         ADC   #$0038
         TCS
         TXA
         TCD
         PLB
         RTL

L082E8D  PHD
         TSC
         SEC
         SBC   #$001A
         TCD
         TCS
         LDA   [$20]
         STA   $01
         LDY   #$0002
         LDA   [$20],Y
         STA   $03
         PHA
         TAX
         LDA   $01
         CLC
         ADC   #$0002
         BCC   L082EAB
         INX
L082EAB  PHX
         PHA
         PEI   $26
         PEI   $24
         PEA   ^L052F3F
         PEA   L052F3F
         _SectRect
         PLA
         BNE   L082EC4
         BRL   L08321A
L082EC4  LDA   L052F41
         AND   #$FFF8
         STA   L052F41
         LSR
         LSR
         STA   $07
         LDA   L052F45
         CLC
         ADC   #$0007
         AND   #$FFF8
         STA   L052F45
         LSR
         LSR
         SEC
         SBC   $07
         STA   $09
         LDA   $01
         STA   L0550A1
         LDA   $03
         STA   L0550A3
         JSL   L081BAC
         LDA   L052F3F
         ASL
         ASL
         CLC
         ADC   L052F3F
         ASL
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   $07
         STA   $05
         LDA   #L052E9F
         CLC
         ADC   $07
         STA   $17
         LDA   #^L052E9F
         ADC   #$0000
         STA   $19
         LDA   $09
         LSR
         AND   #$000F
         STA   $15
         ASL
         ADC   $15
         ASL
         ASL
         ADC   $15
         ASL
         ADC   $15
         STA   $15
         LDA   #$FFE3
         SEC
         SBC   $15
         STAL  L08317A+1
         LDA   $09
         LSR
         AND   #$000F
         STA   $15
         ASL
         ADC   $15
         ASL
         ADC   $15
         STA   $15
         LDA   #$FFF2
         SEC
         SBC   $15
         STAL  L083205+1
         LDA   $09
         AND   #$001E
         STA   $15
         LDA   #$0020
         SEC
         SBC   $15
         STA   $11
         LDA   $09
         LSR
         LSR
         LSR
         LSR
         LSR
         STA   $0B
         LDA   $09
         AND   #$FFE0
         STA   $15
         LDA   #$0080
         SEC
         SBC   $15
         STA   $0F
         LDA   L052F3F
         STA   $13
         LDX   $05
L082F7C  LDA   $13
         CMP   L05509D
         BCC   L082F8C
         STA   L05509F
         PHX
         JSL   L0825D4
         PLX
L082F8C  LDA   L05509B
         BPL   L082F9A
         TXA
         CLC
         ADC   #$00A0
         TAX
         BRL   L08320E
L082F9A  BEQ   L082F9F
         BRL   L083181
L082F9F  LDY   #$001E
         PHB
         PEI   $29
         PLB
         PLB
         LDA   $0B
         STA   $0D
         BNE   L082FB0
         BRL   L083175
L082FB0  LDA   [$17],Y
         BNE   L082FB9
         LDA   |$001E,X
         BRA   L082FC5
L082FB9  LDAL  $E1201E,X
         EOR   |$001E,X
         AND   [$17],Y
         EOR   |$001E,X
L082FC5  STAL  $E1201E,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L082FD4
         LDA   |$001C,X
         BRA   L082FE0
L082FD4  LDAL  $E1201C,X
         EOR   |$001C,X
         AND   [$17],Y
         EOR   |$001C,X
L082FE0  STAL  $E1201C,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L082FEF
         LDA   |$001A,X
         BRA   L082FFB
L082FEF  LDAL  $E1201A,X
         EOR   |$001A,X
         AND   [$17],Y
         EOR   |$001A,X
L082FFB  STAL  $E1201A,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L08300A
         LDA   |$0018,X
         BRA   L083016
L08300A  LDAL  $E12018,X
         EOR   |$0018,X
         AND   [$17],Y
         EOR   |$0018,X
L083016  STAL  $E12018,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L083025
         LDA   |$0016,X
         BRA   L083031
L083025  LDAL  $E12016,X
         EOR   |$0016,X
         AND   [$17],Y
         EOR   |$0016,X
L083031  STAL  $E12016,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L083040
         LDA   |$0014,X
         BRA   L08304C
L083040  LDAL  $E12014,X
         EOR   |$0014,X
         AND   [$17],Y
         EOR   |$0014,X
L08304C  STAL  $E12014,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L08305B
         LDA   |$0012,X
         BRA   L083067
L08305B  LDAL  $E12012,X
         EOR   |$0012,X
         AND   [$17],Y
         EOR   |$0012,X
L083067  STAL  $E12012,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L083076
         LDA   |$0010,X
         BRA   L083082
L083076  LDAL  $E12010,X
         EOR   |$0010,X
         AND   [$17],Y
         EOR   |$0010,X
L083082  STAL  $E12010,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L083091
         LDA   |$000E,X
         BRA   L08309D
L083091  LDAL  $E1200E,X
         EOR   |$000E,X
         AND   [$17],Y
         EOR   |$000E,X
L08309D  STAL  $E1200E,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L0830AC
         LDA   |$000C,X
         BRA   L0830B8
L0830AC  LDAL  $E1200C,X
         EOR   |$000C,X
         AND   [$17],Y
         EOR   |$000C,X
L0830B8  STAL  $E1200C,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L0830C7
         LDA   |$000A,X
         BRA   L0830D3
L0830C7  LDAL  $E1200A,X
         EOR   |$000A,X
         AND   [$17],Y
         EOR   |$000A,X
L0830D3  STAL  $E1200A,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L0830E2
         LDA   |$0008,X
         BRA   L0830EE
L0830E2  LDAL  $E12008,X
         EOR   |$0008,X
         AND   [$17],Y
         EOR   |$0008,X
L0830EE  STAL  $E12008,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L0830FD
         LDA   |$0006,X
         BRA   L083109
L0830FD  LDAL  $E12006,X
         EOR   |$0006,X
         AND   [$17],Y
         EOR   |$0006,X
L083109  STAL  $E12006,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L083118
         LDA   |$0004,X
         BRA   L083124
L083118  LDAL  $E12004,X
         EOR   |$0004,X
         AND   [$17],Y
         EOR   |$0004,X
L083124  STAL  $E12004,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L083133
         LDA   |$0002,X
         BRA   L08313F
L083133  LDAL  $E12002,X
         EOR   |$0002,X
         AND   [$17],Y
         EOR   |$0002,X
L08313F  STAL  $E12002,X
         DEY
         DEY
         LDA   [$17],Y
         BNE   L08314E
         LDA   |$0000,X
         BRA   L08315A
L08314E  LDAL  $E12000,X
         EOR   |$0000,X
         AND   [$17],Y
         EOR   |$0000,X
L08315A  STAL  $E12000,X
         DEY
         DEY
         TXA
         CLC
         ADC   #$0020
         TAX
         TYA
         CLC
         ADC   #$0040
         TAY
         DEC   $0D
         BMI   L08317D
         BEQ   L083175
         BRL   L082FB0
L083175  TYA
         SEC
         SBC   $11
         TAY
L08317A  BRL   L08317A
L08317D  PLB
         BRL   L083209
L083181  PHB
         PEI   $29
         PLB
         PLB
         LDY   $0B
         BEQ   L083205
L08318A  LDA   |$001E,X
L08318D  STAL  $E1201E,X
         LDA   |$001C,X
         STAL  $E1201C,X
         LDA   |$001A,X
         STAL  $E1201A,X
         LDA   |$0018,X
         STAL  $E12018,X
         LDA   |$0016,X
         STAL  $E12016,X
         LDA   |$0014,X
         STAL  $E12014,X
         LDA   |$0012,X
         STAL  $E12012,X
         LDA   |$0010,X
         STAL  $E12010,X
         LDA   |$000E,X
         STAL  $E1200E,X
         LDA   |$000C,X
         STAL  $E1200C,X
         LDA   |$000A,X
         STAL  $E1200A,X
         LDA   |$0008,X
         STAL  $E12008,X
         LDA   |$0006,X
         STAL  $E12006,X
         LDA   |$0004,X
         STAL  $E12004,X
         LDA   |$0002,X
         STAL  $E12002,X
         LDA   |$0000,X
         STAL  $E12000,X
         TXA
         CLC
         ADC   #$0020
         TAX
         DEY
         BMI   L083208
         BNE   L08318A
L083205  BRL   L083205
L083208  PLB
L083209  TXA
         CLC
         ADC   $0F
         TAX
L08320E  INC   $13
         LDA   $13
         CMP   L052F43
         BEQ   L08321A
         BRL   L082F7C
L08321A  LDA   $1E
         STA   $2A
         LDA   $1D
         STA   $29
         LDX   $1B
         TDC
         CLC
         ADC   #$0028
         TCS
         TXA
         TCD
         RTL

L08322D  ENT
         ADRL  L082FB9+3
         DW    $001B
         DW    $0010
L083235  ENT
         ADRL  L082FC5+3
         DW    $001B
         DW    $0010
L08323D  ENT
         ADRL  L08318D+3
         DW    $0007
         DW    $0010
L083245  ENT
         PHD
         TSC
         SEC
         SBC   #$0010
         TCD
         TCS
         _PenNormal
         PEA   $3333
         JSL   L081DD8
         PEA   $0002
         _SetPenMode
         PEI   $18
         PEI   $16
         JSL   L08273B
         PEA   $0004
         PEA   $0002
         _SetPenSize
         LDY   #$0002
         LDA   [$1E],Y
         STA   $07
         TAX
         LDA   [$1E]
         STA   $05
         JSR   L0832A8
         PEA   $0002
         PEA   $0001
         _SetPenSize
         LDY   #$0002
         LDA   [$22],Y
         STA   $07
         TAX
         LDA   [$22]
         STA   $05
         JSR   L0832A8
         BRL   L083323
L0832A8  CLC
         ADC   #$0032
         BCC   L0832AF
         INX
L0832AF  STA   $01
         STX   $03
         LDY   #$0024
         LDA   [$05],Y
         TAY
         BNE   L0832BC
         RTS

L0832BC  PHY
         LDA   $1A
         BEQ   L0832CF
         LDY   #$0004
         LDA   [$01],Y
         AND   #$000F
         CMP   $1A
         BEQ   L0832CF
         BRA   L083313
L0832CF  LDA   $1C
         BNE   L0832DC
         LDY   #$0004
         LDA   [$01],Y
         BPL   L0832DC
         BRA   L083313
L0832DC  LDY   #$000C
         LDA   [$01],Y
         ASL
         STA   $0F
         DEY
         DEY
         LDA   [$01],Y
         STA   $0D
         DEY
         DEY
         LDA   [$01],Y
         ASL
         STA   $0B
         DEY
         DEY
         LDA   [$01],Y
         STA   $09
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PHA
         _FrameRect
         PEI   $18
         PEI   $16
         JSL   L081E53
L083313  LDA   [$01]
         CLC
         ADC   $01
         STA   $01
         BCC   L08331E
         INC   $03
L08331E  PLY
         DEY
         BNE   L0832BC
         RTS

L083323  LDA   $14
         STA   $24
         LDA   $13
         STA   $23
         LDX   $11
         TDC
         CLC
         ADC   #$0022
         TCS
         TXA
         TCD
         RTL

L083336  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0003
         JSL   L0727E0
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         STZ   L055139
         LDA   #$FFFF
         TAX
         LDY   #$0034
         STA   [$0A],Y
         INY
         INY
         TXA
         STA   [$0A],Y
         LDA   #$0000
         TAX
         LDY   #$0028
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

L08337F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFDE
         TCS
         TCD
         PHY
         PHY
         PEI   $32
         PEI   $30
         PEI   $2E
         PEI   $2C
         JSL   L086D20
         PLA
         STA   $1B
         PLX
         STX   $1D
         LDA   #$FFFF
         TAX
         CMP   $1B
         BNE   L0833A5
         CPX   $1D
L0833A5  BNE   L0833B6
         PEA   $0000
         PHD
         JSL   L083336
         STZ   $1B
         STZ   $1D
         BRL   L0834F1
L0833B6  LDA   $1B
         ORA   $1D
         BNE   L0833C3
         STZ   $34
         STZ   $36
         BRL   L0834F1
L0833C3  LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         STA   $1F
         STX   $21
         LDY   #$0002
         LDA   [$1F],Y
         TAX
         LDA   [$1F]
         STA   $0F
         STX   $11
         PHY
         PHY
         PEI   $2A
         PEI   $28
         PEA   $0001
         JSL   L077264
         PLA
         STA   $17
         PLX
         STX   $19
         LDA   $17
         ORA   $19
         BNE   L0833F7
         BRL   L08347A
L0833F7  PHY
         PEI   $2A
         PEI   $28
         PEA   $5041
         PEA   $4D42
         PEI   $11
         PEI   $0F
         JSL   L077EAF
         PLA
         LSR
         BCC   L083467
         LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         CLC
         ADC   #$000C
         BCC   L08341D
         INX
L08341D  STA   $03
         STX   $05
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         CLC
         ADC   #$000C
         BCC   L083430
         INX
L083430  STA   $07
         STX   $09
         PEI   $05
         PEI   $03
         PEI   $09
         PEI   $07
         LDA   $0F
         LDX   $11
         SEC
         SBC   #$000C
         BCS   L083447
         DEX
L083447  PHX
         PHA
         JSL   L1511CE
         PEI   $2A
         PEI   $28
         PEA   $0001
         JSL   L074A5A
         LDA   $28
         LDX   $2A
         STA   $34
         STX   $36
         STZ   $28
         STZ   $2A
         BRL   L0834F1
L083467  PEI   $2A
         PEI   $28
         PEA   $0000
         JSL   L074A5A
         PEI   $2A
         PEI   $28
         JSL   L077B28
L08347A  PHY
         PHY
         PEI   $11
         PEI   $0F
         PEA   $5041
         PEA   $4D42
         PEA   $0000
         PEA   $0000
         JSL   L07502A
         PLA
         STA   $13
         PLX
         STX   $15
         LDA   $13
         ORA   $15
         BNE   L0834A6
         PEA   $0000
         PHD
         JSL   L083336
         BRA   L0834F1
L0834A6  PHY
         PHY
         PEI   $15
         PEI   $13
         JSL   L0742B3
         PLA
         PLX
         CLC
         ADC   #$000C
         BCC   L0834B9
         INX
L0834B9  STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         CLC
         ADC   #$000C
         BCC   L0834CC
         INX
L0834CC  STA   $03
         STX   $05
         PEI   $0D
         PEI   $0B
         LDA   $0F
         LDX   $11
         SEC
         SBC   #$000C
         BCS   L0834DF
         DEX
L0834DF  PHX
         PHA
         PEI   $05
         PEI   $03
         JSL   L078BF0
         LDA   $13
         LDX   $15
         STA   $34
         STX   $36
L0834F1  PEI   $1D
         PEI   $1B
         JSL   L07185A
         LDA   $28
         ORA   $2A
         BEQ   L083511
         PHY
         PEI   $2A
         PEI   $28
         PEA   $5041
         PEA   $4D42
         JSL   L0751BE
         PLA
         STA   $01
L083511  LDA   $26
         STA   $32
         LDA   $25
         STA   $31
         LDA   $23
         TCD
         TSC
         CLC
         ADC   #$0030
         TCS
         RTL

L083523  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         LDA   $22
         ORA   $24
         BEQ   L083540
         PEI   $24
         PEI   $22
         PEA   $0000
         PEI   $1C
         PEI   $1A
         JSL   L085B3C
L083540  LDA   $1E
         ORA   $20
         BEQ   L083555
         PEI   $20
         PEI   $1E
         PEA   $FFFF
         PEI   $1C
         PEI   $1A
         JSL   L085B3C
L083555  PEI   $1C
         PEI   $1A
         JSL   L08273B
         LDA   $26
         ORA   $28
         BNE   L083566
         BRL   L0836A4
L083566  PHY
         PHY
         PEI   $28
         PEI   $26
         PEA   $0000
         JSL   L077264
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDA   $0D
         ORA   $0F
         BNE   L08358A
         PEI   $28
         PEI   $26
         JSL   L083CC3
         BRL   L0836A4
L08358A  LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         STA   $01
         STX   $03
         LDA   $22
         ORA   $24
         BEQ   L08360E
         LDY   #$0034
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L0835C1
         PEI   $24
         PEI   $22
         PEA   $FFFF
         LDA   #$001C
         CLC
         ADC   $01
         LDX   $03
         BCC   L0835B9
         INX
L0835B9  PHX
         PHA
         JSL   L085BFA
         BRA   L0835F9
L0835C1  LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         CLC
         ADC   #$003C
         BCC   L0835D0
         INX
L0835D0  STA   $05
         STX   $07
         PEI   $07
         PEI   $05
         PEI   $24
         PEI   $22
         LDA   #$001C
         CLC
         ADC   $01
         LDX   $03
         BCC   L0835E7
         INX
L0835E7  PHX
         PHA
         PEA   $0000
         LDY   #$0013
         LDA   #$00FF
         AND   [$01],Y
         PHA
         JSL   L082C75
L0835F9  LDA   #$001C
         CLC
         ADC   $01
         LDX   $03
         BCC   L083604
         INX
L083604  PHX
         PHA
         PEI   $1C
         PEI   $1A
         JSL   L081E53
L08360E  LDA   $1E
         ORA   $20
         BNE   L083617
         BRL   L083699
L083617  LDY   #$0038
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L08363C
         PEI   $20
         PEI   $1E
         PEA   $0000
         LDA   #$0024
         CLC
         ADC   $01
         LDX   $03
         BCC   L083634
         INX
L083634  PHX
         PHA
         JSL   L085BFA
         BRA   L083684
L08363C  LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         CLC
         ADC   #$003C
         BCC   L08364B
         INX
L08364B  PHX
         PHA
         LDY   #$0036
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L150F53
         STA   $09
         STX   $0B
         PEI   $0B
         PEI   $09
         PEI   $20
         PEI   $1E
         LDA   #$0024
         CLC
         ADC   $01
         LDX   $03
         BCC   L083672
         INX
L083672  PHX
         PHA
         PEA   $0000
         LDY   #$0013
         LDA   #$00FF
         AND   [$01],Y
         PHA
         JSL   L082C75
L083684  LDA   #$0024
         CLC
         ADC   $01
         LDX   $03
         BCC   L08368F
         INX
L08368F  PHX
         PHA
         PEI   $1C
         PEI   $1A
         JSL   L081E53
L083699  PEI   $28
         PEI   $26
         PEA   $0000
         JSL   L074A5A
L0836A4  LDA   $18
         STA   $28
         LDA   $17
         STA   $27
         LDA   $15
         TCD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL

L0836B6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFDA
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $30
         PEI   $2E
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
         BCS   L0836F6
         BRL   L08381A
L0836F6  LDA   $03
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
         PEI   $40
         PEI   $3E
         LDA   $09
         JSL   L150488
         JSL   L150F53
         STA   $13
         STX   $15
         PEI   $3C
         PEI   $3A
         LDA   $09
         JSL   L150488
         JSL   L150F53
         STA   $17
         STX   $19
         PEI   $38
         PEI   $36
         LDA   $09
         JSL   L150488
         JSL   L150F53
         STA   $1B
         STX   $1D
         PEI   $34
         PEI   $32
         LDA   $09
         JSL   L150488
         JSL   L150F53
         STA   $1F
         STX   $21
         LDA   $2C
         SEC
         SBC   #$FFFE
         BVS   L08379A
         BPL   L083798
         BRL   L08381A
L083798  BRA   L08379C
L08379A  BPL   L08381A
L08379C  CMP   #$0006
         BPL   L08381A
         SEC
         SBC   #$0000
         BEQ   L0837E6
         DEC
         BEQ   L0837FE
         SEC
         SBC   #$0002
         BEQ   L0837B6
         DEC
         DEC
         BEQ   L0837CE
         BRA   L08381A
L0837B6  PEI   $15
         PEI   $13
         PEI   $19
         PEI   $17
         PEI   $21
         PEI   $1F
         PEI   $0B
         PEI   $0D
         PEI   $11
         JSL   L080000
         BRA   L08381A
L0837CE  PEI   $15
         PEI   $13
         PEI   $19
         PEI   $17
         PEI   $21
         PEI   $1F
         PEI   $0B
         PEI   $0D
         PEI   $11
         JSL   L16017E
         BRA   L08381A
L0837E6  PEI   $15
         PEI   $13
         PEI   $19
         PEI   $17
         PEI   $21
         PEI   $1F
         PEI   $0B
         PEI   $0D
         PEI   $11
         JSL   L080235
         BRA   L08381A
L0837FE  PEI   $15
         PEI   $13
         PEI   $19
         PEI   $17
         PEI   $1D
         PEI   $1B
         PEI   $21
         PEI   $1F
         PEI   $0B
         PEI   $0D
         PEI   $11
         JSL   L080104
         BRA   L08381A
L08381A  LDA   $2A
         STA   $40
         LDA   $29
         STA   $3F
         LDA   $27
         TCD
         TSC
         CLC
         ADC   #$003E
         TCS
         RTL

L08382C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE2
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $28
         PEI   $26
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
         BCS   L08386C
         BRL   L083973
L08386C  LDA   $03
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
         STA   $0D
         LDA   $07
         LSR
         LSR
         LSR
         AND   #$7FFF
         SEC
         SBC   $0D
         STA   $0F
         LDA   #$0050
         SEC
         SBC   $0F
         ASL
         STA   $11
         LDA   $0D
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
         PEI   $30
         PEI   $2E
         LDA   $09
         JSL   L150488
         JSL   L150F53
         STA   $13
         STX   $15
         PEI   $2C
         PEI   $2A
         LDA   $09
         JSL   L150488
         JSL   L150F53
         STA   $17
         STX   $19
         LDA   $24
         SEC
         SBC   #$FFFB
         BVS   L0838EC
         BPL   L0838EA
         BRL   L083973
L0838EA  BRA   L0838F1
L0838EC  BMI   L0838F1
         BRL   L083973
L0838F1  CMP   #$0068
         BPL   L083973
         SEC
         SBC   #$0000
         BEQ   L08394B
         SEC
         SBC   #$0005
         BEQ   L08390F
         DEC
         DEC
         DEC
         BEQ   L083937
         SEC
         SBC   #$005F
         BEQ   L08395F
         BRA   L083973
L08390F  LDA   $11
         BNE   L083923
         PEI   $15
         PEI   $13
         PEI   $19
         PEI   $17
         PEI   $0B
         JSL   L081AB6
         BRA   L083935
L083923  PEI   $15
         PEI   $13
         PEI   $19
         PEI   $17
         PEI   $0B
         PEI   $0F
         PEI   $11
         JSL   L08048B
L083935  BRA   L083973
L083937  PEI   $15
         PEI   $13
         PEI   $19
         PEI   $17
         PEI   $0B
         PEI   $0F
         PEI   $11
         JSL   L080369
         BRA   L083973
L08394B  PEI   $15
         PEI   $13
         PEI   $19
         PEI   $17
         PEI   $0B
         PEI   $0F
         PEI   $11
         JSL   L16018C
         BRA   L083973
L08395F  PEI   $15
         PEI   $13
         PEI   $19
         PEI   $17
         PEI   $0B
         PEI   $0F
         PEI   $11
         JSL   L16019A
         BRA   L083973
L083973  LDA   $22
         STA   $30
         LDA   $21
         STA   $2F
         LDA   $1F
         TCD
         TSC
         CLC
         ADC   #$002E
         TCS
         RTL

L083985  ENT
         PHD
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
         PEI   $14
         PEI   $12
         PEA   $0008
         JSL   L0313BE
         LDA   $16
         BEQ   L0839B1
         PEA   ^L0409FC
         PEA   L0409FC
         JSL   L07010A
         BRA   L083A2A
L0839B1  LDA   L054FBB
         SEC
         SBC   #$0000
         BMI   L083A2A
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
         BCC   L083A2A
         LDA   #$FFF8
         AND   $03
         STA   $03
         LDA   #$0007
         CLC
         ADC   $07
         AND   #$FFF8
         STA   $07
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L081D73
         PEI   $18
         PEI   $16
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$001C
         BCC   L083A14
         INX
L083A14  STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PHX
         PHA
         JSL   L082E8D
         JSL   L081DC7
L083A2A  LDA   $10
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

L083A3C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC0
         TCS
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $2F
         PLX
         STX   $31
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L0531D9
         PEA   L0531D9
         JSL   L1506A7
         PEA   ^L0531E1
         PEA   L0531E1
         PEA   $0000
         PEA   $0000
         JSL   L1501B5
         LDA   #$0001
         STA   $3B
L083A79  PEI   $3B
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         JSL   L083C0E
         PHY
         LDA   $3B
         DEC
         PHA
         JSL   L081A92
         PLA
         STA   $2D
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         PEI   $2D
         PEI   $2D
         JSL   L1501B5
         LDA   #$0010
         CMP   $3B
         BEQ   L083AB0
         INC   $3B
         BRA   L083A79
L083AB0  PEA   $0001
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         JSL   L083C0E
         LDA   #$0011
         STA   $3B
L083AC5  PEI   $3B
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         JSL   L083C0E
         LDA   $35
         EOR   #$FFFF
         INC
         PHA
         LDA   $33
         EOR   #$FFFF
         INC
         PHA
         JSL   L151490
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         LDA   $3B
         SEC
         SBC   #$0010
         DEC
         ASL
         ASL
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L053C9D
         LDX   #^L053C9D
         BCC   L083B07
         INX
L083B07  PHX
         PHA
         PEA   $0020
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L1517EB
         LDA   #$0020
         CMP   $3B
         BEQ   L083B31
         INC   $3B
         BRA   L083AC5
L083B31  PEA   $0000
         PEA   $0000
         JSL   L151490
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         STZ   L05512F
         PEI   $31
         PEI   $2F
         JSL   L151131
         TSC
         CLC
         ADC   #$0040
         TCS
         PLD
         RTL

L083B58  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         LDY   #$000E
         LDA   #$000F
         AND   [$1E],Y
         STA   $03
         LDX   #$0000
         LDY   #$000E
         LDA   #$2000
         AND   [$1E],Y
         CMP   #$0000
         BEQ   L083B7B
         INX
L083B7B  TXA
         STA   $05
         LDA   #$0006
         CLC
         ADC   $1E
         LDX   $20
         BCC   L083B89
         INX
L083B89  PHX
         PHA
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L0808E0
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         LDA   #$0004
         CMP   $03
         BNE   L083BBD
         LDA   $0D
         DEC
         DEC
         STA   $0D
         LDA   $0B
         DEC
         STA   $0B
L083BBD  LDA   #$0004
         CLC
         ADC   $09
         STA   $09
         LDA   $0D
         SEC
         SBC   #$0006
         STA   $0D
         LDA   $05
         BEQ   L083BE8
         LDA   $07
         INC
         INC
         INC
         STA   $07
         LDA   #$0006
         CLC
         ADC   $09
         STA   $09
         LDA   $0D
         SEC
         SBC   #$0004
         STA   $0D
L083BE8  PEI   $1A
         PEI   $18
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $16
         STA   $20
         LDA   $15
         STA   $1F
         LDA   $13
         TCD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L083C0E  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PEI   $10
         PEI   $0E
         JSL   L08273B
         LDX   #$0000
         LDA   $12
         BMI   L083C28
         BEQ   L083C28
         INX
L083C28  TXA
         PHA
         LDA   $12
         SEC
         SBC   #$0020
         BEQ   L083C3E
         BVS   L083C37
         EOR   #$8000
L083C37  BPL   L083C3E
         LDA   #$0000
         BRA   L083C41
L083C3E  LDA   #$0001
L083C41  AND   $01,S
         PLX
         LSR
         BCC   L083CB1
         LDA   $12
         DEC
         STA   $12
         LDA   $0E
         LDX   $10
         STA   $01
         STX   $03
         LDA   #$0002
         CLC
         ADC   $01
         LDX   $03
         BCC   L083C5F
         INX
L083C5F  STA   $05
         STX   $07
         PEI   $12
         PEA   $0008
         JSL   L1500F5
         PLX
         PLX
         PEA   $001C
         JSL   L150BEE
         PLA
         STA   [$05]
         LDA   $01
         LDX   $03
         STA   $05
         STX   $07
         PEI   $12
         PEA   $0008
         JSL   L150318
         PLX
         PLX
         PEA   $000A
         JSL   L150BEE
         PLA
         STA   [$05]
         LDY   #$0002
         LDA   #$001C
         CLC
         ADC   [$01],Y
         DEC
         DEC
         LDY   #$0006
         STA   [$01],Y
         LDA   #$000A
         CLC
         ADC   [$01]
         DEC
         LDY   #$0004
         STA   [$01],Y
L083CB1  LDA   $0C
         STA   $12
         LDA   $0B
         STA   $11
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L083CC3  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L05508F
         LDX   L055091
         CMP   $0A
         BNE   L083CD7
         CPX   $0C
L083CD7  BEQ   L083CEA
         LDA   $0A
         LDX   $0C
         STA   L05508F
         STX   L055091
         PEA   $0018
         JSL   L0727E0
L083CEA  LDA   $08
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

L083CFB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDA   L055137
         BNE   L083D0B
         BRL   L083E96
L083D0B  PEA   ^L0532B5
         PEA   L0532B5
         JSL   L082712
         LDA   L055051
         BEQ   L083D3E
         LDX   #$0000
         LDA   L0550B9
         BNE   L083D23
         INX
L083D23  TXA
         AND   L055153
         BEQ   L083D2E
         STZ   L055135
         BRA   L083D31
L083D2E  STZ   L055139
L083D31  PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         BRL   L083E93
L083D3E  LDA   L055153
         BNE   L083D46
         BRL   L083E03
L083D46  LDA   L0550B9
         BNE   L083D6F
         PHY
         PHY
         PEA   $FFFF
         PEA   $FFFF
         LDA   L055109
         LDX   L05510B
         PHX
         PHA
         LDA   L055115
         LDX   L055117
         PHX
         PHA
         JSL   L08337F
         PLA
         STA   $09
         PLX
         STX   $0B
         BRA   L083D91
L083D6F  PHY
         PHY
         PEA   $FFFF
         PEA   $FFFF
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         LDA   L055115
         LDX   L055117
         PHX
         PHA
         JSL   L08337F
         PLA
         STA   $09
         PLX
         STX   $0B
L083D91  LDA   #$FFFF
         TAX
         CMP   $09
         BNE   L083D9B
         CPX   $0B
L083D9B  BNE   L083DA0
         BRL   L083E93
L083DA0  LDA   L055115
         LDX   L055117
         CMP   $09
         BNE   L083DAC
         CPX   $0B
L083DAC  BEQ   L083E00
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L083DF6
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$000C
         BCC   L083DD7
         INX
L083DD7  STA   $0D
         STX   $0F
         LDA   $09
         LDX   $0B
         STA   [$0D]
         TXA
         LDY   #$0002
         STA   [$0D],Y
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0001
         JSL   L074A24
L083DF6  LDA   $09
         LDX   $0B
         STA   L055115
         STX   L055117
L083E00  BRL   L083E93
L083E03  PHY
         PHY
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         LDA   L055119
         LDX   L05511B
         PHX
         PHA
         JSL   L08337F
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   #$FFFF
         TAX
         CMP   $09
         BNE   L083E31
         CPX   $0B
L083E31  BEQ   L083E93
         LDA   L055119
         LDX   L05511B
         CMP   $09
         BNE   L083E3F
         CPX   $0B
L083E3F  BEQ   L083E93
         PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BEQ   L083E89
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         CLC
         ADC   #$000C
         BCC   L083E6A
         INX
L083E6A  STA   $0D
         STX   $0F
         LDA   $09
         LDX   $0B
         STA   [$0D]
         TXA
         LDY   #$0002
         STA   [$0D],Y
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0001
         JSL   L074A90
L083E89  LDA   $09
         LDX   $0B
         STA   L055119
         STX   L05511B
L083E93  STZ   L055137
L083E96  TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

L083E9E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFDC
         TCS
         TCD
         LDA   L054FBB
         SEC
         SBC   #$0000
         BMI   L083EE4
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L085F5A
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150306
         LDA   L055027
         LDX   L055029
         STA   L05513F
         STX   L055141
         LDA   L055039
         LDX   L05503B
         STA   L05513B
         STX   L05513D
L083EE4  TSC
         CLC
         ADC   #$0024
         TCS
         PLD
         RTL

L083EEC  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   L055099
         BEQ   L083EFC
         BRL   L083F91
L083EFC  PEA   ^L053127
         PEA   L053127
         PEA   ^L05311F
         PEA   L05311F
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L081E5F
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
         BCC   L083F78
         LDA   #$FFF8
         AND   $03
         STA   $03
         LDA   #$0007
         CLC
         ADC   $07
         AND   #$FFF8
         STA   $07
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$001C
         BCC   L083F66
         INX
L083F66  STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PHX
         PHA
         JSL   L082E8D
L083F78  PEA   ^L05311F
         PEA   L05311F
         PEA   ^L053127
         PEA   L053127
         PEA   $0008
         JSL   L0313BE
         LDA   #$0001
         STA   L055099
L083F91  LDA   $10
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

L083FA3  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L083E9E
         LDA   #$0001
         STA   L055097
         STZ   L055095
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

L083FC9  PHD
         TSC
         CLC
         ADC   #$FFDA
         TCS
         TCD
         STZ   $01
L083FD3  TDC
         CLC
         ADC   #$0003
         STA   $23
         STZ   $25
         LDA   $01
         ASL
         ASL
         TAY
         LDA   $30
         STA   [$23],Y
         TDC
         CLC
         ADC   #$0003
         STA   $23
         STZ   $25
         LDA   $01
         ASL
         INC
         ASL
         TAY
         LDA   $32
         STA   [$23],Y
         PEA   $0000
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L150306
         STZ   L055097
         LDA   #$0001
         STA   L055095
         LDA   #$0007
         CMP   $01
         BEQ   L08401C
         INC   $01
         BRA   L083FD3
L08401C  LDA   $2A
         STA   $32
         LDA   $29
         STA   $31
         LDA   $27
         TCD
         TSC
         CLC
         ADC   #$0030
         TCS
         RTL

L08402E  PHD
         TSC
         CLC
         ADC   #$FFA4
         TCS
         TCD
         LDA   #$0003
         CLC
         ADC   $62
         LDX   $64
         BCC   L084041
         INX
L084041  CLC
         ADC   #$0004
         BCC   L084048
         INX
L084048  STA   $59
         STX   $5B
         LDA   [$59]
         SEC
         SBC   #$0000
         BPL   L084057
         BRL   L084187
L084057  CMP   #$0006
         BMI   L08405F
         BRL   L084187
L08405F  ASL
         TAX
         LDAL  L084067,X
         PHA
         RTS

L084067  DA    L084073-1
         DA    L084088-1
         DA    L084099-1
         DA    L0840AA-1
         DA    L0840BB-1
         DA    L08414B-1

L084073  PEA   $0000
         PEI   $62
         JSL   L083EEC
         PEA   $0000
         PEI   $62
         JSL   L083FA3
         BRL   L0841CC
L084088  PEA   $0000
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L083FC9
         BRL   L0841CC
L084099  PEA   $0FFF
         PEA   $0FFF
         PEA   $0000
         PHD
         JSL   L083FC9
         BRL   L0841CC
L0840AA  PEA   $0000
         PEA   $0FFF
         PEA   $0000
         PHD
         JSL   L083FC9
         BRL   L0841CC
L0840BB  LDA   L055099
         EOR   #$0001
         PHA
         LDA   L055095
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L0840DC
         PEA   $0000
         PEA   $0FFF
         PEA   $0000
         PHD
         JSL   L083FC9
L0840DC  PEA   $0000
         PEI   $62
         JSL   L083EEC
         TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         JSL   L085F5A
         STZ   $37
L0840F4  TDC
         CLC
         ADC   #$0039
         STA   $59
         STZ   $5B
         LDA   $37
         ASL
         TAY
         TYA
         CLC
         ADC   $59
         TAX
         LDA   $5B
         BCC   L08410B
         INC
L08410B  PHA
         PHX
         TDC
         CLC
         ADC   #$0039
         STA   $59
         STZ   $5B
         LDA   $37
         ASL
         TAY
         LDA   #$0FFF
         EOR   [$59],Y
         PLX
         STX   $59
         PLX
         STX   $5B
         STA   [$59]
         LDA   #$000F
         CMP   $37
         BEQ   L084132
         INC   $37
         BRA   L0840F4
L084132  PEA   $0000
         TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         JSL   L150306
         STZ   L055097
         STZ   L055095
         BRL   L0841CC
L08414B  LDA   #$0003
         CLC
         ADC   $62
         LDX   $64
         BCC   L084156
         INX
L084156  CLC
         ADC   #$0006
         BCC   L08415D
         INX
L08415D  STA   $59
         STX   $5B
         LDA   [$59]
         PHA
         LDA   #$0003
         CLC
         ADC   $62
         LDX   $64
         BCC   L08416F
         INX
L08416F  CLC
         ADC   #$0006
         BCC   L084176
         INX
L084176  STA   $59
         STX   $5B
         LDA   [$59]
         PHA
         PEA   $0000
         PHD
         JSL   L083FC9
         BRA   L0841CC
L084187  PEA   ^L040A1F
         PEA   L040A1F
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDA   #$0003
         CLC
         ADC   $62
         LDX   $64
         BCC   L0841A1
         INX
L0841A1  CLC
         ADC   #$0004
         BCC   L0841A8
         INX
L0841A8  STA   $59
         STX   $5B
         LDA   [$59]
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         JSL   L07010A
L0841CC  LDA   $60
         STA   $64
         LDA   $5F
         STA   $63
         LDA   $5D
         TCD
         TSC
         CLC
         ADC   #$0062
         TCS
         RTL

L0841DE  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $18
         DEC
         STA   $18
         PEI   $18
         PEA   $0003
         JSL   L1500F5
         PLX
         PLX
         STA   $07
         LDA   #$FFF0
         STA   $03
         LDA   #$000F
         AND   $16
         STA   $16
         PEI   $18
         LDA   $07
         PEA   $0003
         JSL   L150BEE
         PLA
         STA   $09
         PLA
         SEC
         SBC   $09
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L084223
         EOR   #$8000
L084223  BPL   L084247
         LDA   #$0001
         STA   $05
L08422A  LDA   $16
         ASL
         ASL
         ASL
         ASL
         STA   $16
         LDA   $03
         ASL
         ASL
         ASL
         ASL
         ORA   #$000F
         STA   $03
         LDA   $05
         CMP   $01
         BEQ   L084247
         INC   $05
         BRA   L08422A
L084247  LDA   $07
         ASL
         CLC
         ADC   $1A
         LDX   $1C
         BCC   L084252
         INX
L084252  STA   $09
         STX   $0B
         LDA   $07
         ASL
         TAY
         LDA   $03
         AND   [$1A],Y
         ORA   $16
         STA   [$09]
         LDA   $10
         STA   $1C
         LDA   $0F
         STA   $1B
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L084274  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $16
         DEC
         STA   $16
         PEI   $16
         PEA   $0003
         JSL   L1500F5
         PLX
         PLX
         STA   $07
         LDA   $07
         ASL
         TAY
         LDA   [$18],Y
         STA   $05
         PEI   $16
         LDA   $07
         PEA   $0003
         JSL   L150BEE
         PLA
         STA   $09
         PLA
         SEC
         SBC   $09
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L0842B5
         EOR   #$8000
L0842B5  BPL   L0842D2
         LDA   #$0001
         STA   $03
L0842BC  PEI   $05
         PEA   $0004
         JSL   L1510EF
         PLA
         STA   $05
         LDA   $03
         CMP   $01
         BEQ   L0842D2
         INC   $03
         BRA   L0842BC
L0842D2  LDA   #$000F
         AND   $05
         STA   $1C
         LDA   $10
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

L0842EB  PHD
         TSC
         CLC
         ADC   #$FEF8
         TCS
         ADC   #$001B
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0020
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150300
         LDA   #$0001
         STA   $E5
L08431F  LDA   $E5
         ASL
         CLC
         ADC   #$0083
         TAX
         STX   $E9
         TDC
         CLC
         ADC   $E9
         STA   $E9
         STZ   $EB
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEI   $E5
         PEA   $0000
         PHD
         JSL   L084274
         LDA   #$0010
         JSL   L150BEE
         PLA
         STA   [$E9]
         LDA   $E5
         ASL
         CLC
         ADC   #$0023
         TAX
         STX   $E9
         TDC
         CLC
         ADC   $E9
         LDX   #$0000
         PHX
         PHA
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         PEI   $E5
         PEA   $0000
         PHD
         JSL   L084274
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEI   $E5
         PEA   $0000
         PHD
         JSL   L084274
         PLA
         STA   $E9
         PLA
         SEC
         SBC   $E9
         PLX
         STX   $E9
         PLX
         STX   $EB
         STA   [$E9]
         LDA   #$0030
         CMP   $E5
         BEQ   L0843A5
         INC   $E5
         BRL   L08431F
L0843A5  LDA   #$0001
         STA   $E7
L0843AA  LDA   #$0001
         STA   $E5
L0843AF  LDA   $E5
         ASL
         CLC
         ADC   #$0083
         TAX
         STX   $E9
         TDC
         CLC
         ADC   $E9
         STA   $E9
         STZ   $EB
         LDA   $E5
         ASL
         CLC
         ADC   #$0083
         TAX
         LDA   $00,X
         PHA
         LDA   $E5
         ASL
         CLC
         ADC   #$0023
         TAX
         PLA
         CLC
         ADC   $00,X
         STA   [$E9]
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEI   $E5
         LDA   $E5
         ASL
         CLC
         ADC   #$0083
         TAX
         LDA   $00,X
         PHA
         PEA   $0010
         JSL   L1500F5
         PLX
         PLX
         PHA
         PEA   $0000
         PHD
         JSL   L0841DE
         LDA   #$0030
         CMP   $E5
         BEQ   L08440D
         INC   $E5
         BRA   L0843AF
L08440D  PEA   $0000
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150306
         PEI   $F6
         JSL   L0706CF
         LDA   #$0010
         CMP   $E7
         BEQ   L08442F
         INC   $E7
         BRL   L0843AA
L08442F  PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         JSL   L150306
         LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$0114
         TCS
         RTL

L084451  PHD
         TSC
         CLC
         ADC   #$FFD6
         TCS
         TCD
         LDA   $38
         DEC
         BNE   L084464
         STZ   $23
         STZ   $21
         BRA   L0844C8
L084464  LDA   $38
         DEC
         DEC
         BNE   L084476
         LDA   #$0FFF
         STA   $23
         LDA   #$0FFF
         STA   $21
         BRA   L0844C8
L084476  LDA   #$0003
         CMP   $38
         BNE   L084486
         STZ   $23
         LDA   #$0FFF
         STA   $21
         BRA   L0844C8
L084486  LDA   #$0005
         CMP   $38
         BNE   L0844C8
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L085F5A
         TDC
         CLC
         ADC   #$0001
         STA   $27
         STZ   $29
         LDA   $36
         LSR
         LSR
         AND   #$0003
         ASL
         TAY
         LDA   [$27],Y
         STA   $23
         TDC
         CLC
         ADC   #$0001
         STA   $27
         STZ   $29
         LDA   #$0003
         AND   $36
         CLC
         ADC   #$0004
         ASL
         TAY
         LDA   [$27],Y
         STA   $21
L0844C8  STZ   $25
L0844CA  TDC
         CLC
         ADC   #$0001
         STA   $27
         STZ   $29
         LDA   $25
         ASL
         TAY
         LDA   $23
         STA   [$27],Y
         TDC
         CLC
         ADC   #$0001
         STA   $27
         STZ   $29
         LDA   #$0008
         CLC
         ADC   $25
         ASL
         TAY
         LDA   $23
         STA   [$27],Y
         LDA   #$0003
         CMP   $25
         BEQ   L0844FB
         INC   $25
         BRA   L0844CA
L0844FB  LDA   #$0004
         STA   $25
L084500  TDC
         CLC
         ADC   #$0001
         STA   $27
         STZ   $29
         LDA   $25
         ASL
         TAY
         LDA   $21
         STA   [$27],Y
         TDC
         CLC
         ADC   #$0001
         STA   $27
         STZ   $29
         LDA   #$0008
         CLC
         ADC   $25
         ASL
         TAY
         LDA   $21
         STA   [$27],Y
         LDA   #$0007
         CMP   $25
         BEQ   L084531
         INC   $25
         BRA   L084500
L084531  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $34
         PEA   $0000
         PEI   $30
         JSL   L0842EB
         STZ   L055097
         LDA   #$0001
         STA   L055095
         LDA   $2E
         STA   $38
         LDA   $2D
         STA   $37
         LDA   $2B
         TCD
         TSC
         CLC
         ADC   #$0036
         TCS
         RTL

L084560  PHD
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
         PEI   $18
         PEI   $16
         PEA   $0008
         JSL   L0313BE
         LDA   #$0003
         CLC
         ADC   $12
         LDX   $14
         BCC   L084587
         INX
L084587  CLC
         ADC   #$0004
         BCC   L08458E
         INX
L08458E  STA   $09
         STX   $0B
         LDA   [$09]
         BNE   L0845C8
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$001C
         BCC   L0845B4
         INX
L0845B4  STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PHX
         PHA
         JSL   L082E8D
         BRA   L08461B
L0845C8  LDA   #$0003
         CLC
         ADC   $12
         LDX   $14
         BCC   L0845D3
         INX
L0845D3  CLC
         ADC   #$0004
         BCC   L0845DA
         INX
L0845DA  STA   $09
         STX   $0B
         LDA   #$0004
         CMP   [$09]
         BNE   L084601
         PEA   ^L053239
         PEA   L053239
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $03
         PEI   $01
         PEA   $8000
         JSL   L15025A
         BRA   L08461B
L084601  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   #$000B
         CLC
         ADC   $12
         LDX   $14
         BCC   L084615
         INX
L084615  PHX
         PHA
         JSL   L1517EB
L08461B  LDA   $10
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

L08462D  PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $24
         PEI   $22
         PEA   $0008
         JSL   L0313BE
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
         PEA   $0008
         JSL   L0313BE
         LDA   $1E
         CLC
         ADC   $09
         STA   $0D
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PEI   $1A
         JSL   L084560
         LDA   $0D
         STA   $09
         LDA   $05
         SEC
         SBC   $1E
         STA   $0D
         LDA   $20
         CLC
         ADC   $03
         STA   $0F
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PEI   $1A
         JSL   L084560
         LDA   $07
         SEC
         SBC   $20
         STA   $0B
         LDA   $07
         STA   $0F
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PEI   $1A
         JSL   L084560
         LDA   $0D
         STA   $09
         LDA   $05
         STA   $0D
         LDA   $03
         STA   $0B
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PEI   $1A
         JSL   L084560
         LDA   $18
         STA   $24
         LDA   $17
         STA   $23
         LDA   $15
         TCD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L0846EC  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0003
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L0846FF
         INX
L0846FF  CLC
         ADC   #$0004
         BCC   L084706
         INX
L084706  STA   $01
         STX   $03
         LDA   [$01]
         BNE   L084729
         LDA   #$0001
         STA   L055099
         PEA   ^L05311F
         PEA   L05311F
         PEA   ^L053127
         PEA   L053127
         PEA   $0008
         JSL   L0313BE
         BRA   L084736
L084729  STZ   L055099
         PEA   ^L05311F
         PEA   L05311F
         JSL   L082712
L084736  LDA   $08
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

L084747  PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         STZ   $11
L084751  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   $11
         LDX   #$0000
         PHX
         PHA
         PEA   $0001
         PEA   $0000
         JSL   L15080D
         LDA   #$003F
         CMP   $11
         BEQ   L084776
         INC   $11
         BRA   L084751
L084776  STZ   $15
L084778  PHY
         JSL   L150705
         PLA
         AND   #$003F
         STA   $11
L084783  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   $11
         LDX   #$0000
         PHX
         PHA
         PEA   $0001
         JSL   L1516F3
         PLA
         LSR
         BCC   L0847B6
         LDA   $11
         INC
         STA   $11
         LDA   $11
         SEC
         SBC   #$003F
         BEQ   L0847B4
         BVS   L0847B0
         EOR   #$8000
L0847B0  BPL   L0847B4
         STZ   $11
L0847B4  BRA   L084783
L0847B6  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   $11
         LDX   #$0000
         PHX
         PHA
         PEA   $0001
         PEA   $0001
         JSL   L15080D
         LDA   $11
         LSR
         LSR
         LSR
         STA   $13
         LDA   #$0007
         AND   $11
         STA   $11
         LDA   $11
         PEA   $0050
         JSL   L150BEE
         PLA
         STA   $0B
         LDA   $13
         PEA   $0019
         JSL   L150BEE
         PLA
         STA   $09
         LDA   #$0050
         CLC
         ADC   $0B
         STA   $0F
         LDA   #$0019
         CLC
         ADC   $09
         STA   $0D
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PEI   $20
         JSL   L084560
         LDY   #$0067
         LDA   [$20],Y
         LSR
         PHA
         JSL   L0706CF
         LDA   #$003F
         CMP   $15
         BEQ   L08482F
         INC   $15
         BRL   L084778
L08482F  PEA   $0000
         PEI   $20
         JSL   L0846EC
         PEA   $0000
         PEI   $20
         JSL   L083FA3
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

L084853  PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         LDA   $20
         SEC
         SBC   #$000C
         BVS   L084866
         EOR   #$8000
L084866  BPL   L084870
         LDA   $20
         SEC
         SBC   #$0007
         STA   $20
L084870  TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L082712
         STZ   $0F
         STZ   $11
         LDA   $20
         SEC
         SBC   #$0005
         BMI   L0848E3
         CMP   #$0004
         BPL   L0848E3
         SEC
         SBC   #$0000
         BEQ   L08489F
         DEC
         BEQ   L0848B0
         DEC
         BEQ   L0848C1
         DEC
         BEQ   L0848D2
         BRA   L0848E3
L08489F  LDA   #$0258
         STA   $05
         LDA   #$FFD8
         STA   $0F
         LDA   #$000F
         STA   $0B
         BRA   L0848E3
L0848B0  LDA   #$0028
         STA   $09
         LDA   #$0028
         STA   $0F
         LDA   #$000F
         STA   $0B
         BRA   L0848E3
L0848C1  LDA   #$00BE
         STA   $03
         LDA   #$FFF6
         STA   $11
         LDA   #$0013
         STA   $0B
         BRA   L0848E3
L0848D2  LDA   #$000A
         STA   $07
         LDA   #$000A
         STA   $11
         LDA   #$0013
         STA   $0B
         BRA   L0848E3
L0848E3  LDY   #$0067
         LDA   [$1C],Y
         SEC
         SBC   #$0000
         BMI   L08490F
         BEQ   L08490F
         PHY
         PEI   $0F
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $0F
         PHY
         PEI   $11
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $11
         LDA   $0B
         ASL
         STA   $0B
L08490F  LDA   $0B
         STA   $01
         LDA   $01
         BMI   L084954
         STZ   $0D
L084919  LDA   $0D
         BEQ   L084927
         LDY   #$0067
         LDA   [$1C],Y
         PHA
         JSL   L0706CF
L084927  TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0000
         PEI   $1C
         JSL   L084560
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $0F
         PEI   $11
         JSL   L1501AF
         LDA   $0D
         CMP   $01
         BEQ   L084954
         INC   $0D
         BRA   L084919
L084954  PEA   $0000
         PEI   $1C
         JSL   L0846EC
         PEA   $0000
         PEI   $1C
         JSL   L083FA3
         LDA   $1A
         STA   $20
         LDA   $19
         STA   $1F
         LDA   $17
         TCD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L084978  PHD
         TSC
         CLC
         ADC   #$FF8A
         TCS
         TCD
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $82
         PEI   $80
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         LDA   $7E
         DEC
         DEC
         PHA
         LDA   $7C
         DEC
         PHA
         LDA   $7E
         INC
         INC
         PHA
         LDA   $7C
         INC
         PHA
         JSL   L15100B
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         LDA   L055095
         BEQ   L084A05
         LDA   $03
         BEQ   L0849CB
         LDA   #$0001
L0849CB  PHA
         LDX   #$0000
         LDA   #$0012
         CMP   $03
         BEQ   L0849D7
         INX
L0849D7  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L084A05
         LDA   L055093
         PHA
         JSL   L081DD8
         PEA   ^L053259
         PEA   L053259
         JSL   L15037D
         STZ   L055099
         PEA   $0000
         PHD
         JSL   L083FA3
         PEA   ^L05311F
         PEA   L05311F
         JSL   L082712
L084A05  LDA   $07
         DEC
         BNE   L084A0E
         STZ   $2B
         BRA   L084A33
L084A0E  LDA   $07
         DEC
         DEC
         BNE   L084A1B
         LDA   #$FFFF
         STA   $2B
         BRA   L084A33
L084A1B  LDA   #$0003
         CMP   $07
         BNE   L084A29
         LDA   #$3333
         STA   $2B
         BRA   L084A33
L084A29  PHY
         PEI   $09
         JSL   L081A92
         PLA
         STA   $2B
L084A33  STZ   $6F
L084A35  TDC
         CLC
         ADC   #$000B
         STA   $73
         STZ   $75
         LDA   $6F
         ASL
         TAY
         LDA   $2B
         STA   [$73],Y
         LDA   #$000F
         CMP   $6F
         BEQ   L084A51
         INC   $6F
         BRA   L084A35
L084A51  LDA   $2B
         STA   L055093
         LDA   $05
         BNE   L084A5F
         LDA   #$0001
         STA   $05
L084A5F  PEA   $0001
         LDA   $05
         DEC
         ASL
         PHA
         JSL   L1505F2
         PLA
         STA   $69
         LDA   $69
         LSR
         STA   $67
         LDA   $03
         BPL   L084A7A
         BRL   L084F81
L084A7A  CMP   #$0013
         BMI   L084A82
         BRL   L084F81
L084A82  ASL
         TAX
         LDAL  L084A8A,X
         PHA
         RTS

L084A8A  DA    L084AAE+1
         DA    L084AB8+2
         DA    L084AB8+2
         DA    L084AE2+2
         DA    L084BBC+2
         DA    L084C50+2
         DA    L084C50+2
         DA    L084C50+2
         DA    L084C50+2
         DA    L084C5D+2
         DA    L084CFD+2
         DA    L084D75+2
         DA    L084C50+2
         DA    L084C50+2
         DA    L084C50+2
         DA    L084C50+2
         DA    L084D80+2
         DA    L084E30+2
L084AAE  DA    L084ED1+2
         PEA   $0000
         PHD
         JSL   L08402E
L084AB8  BRL   L084F89
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         PEA   ^L053259
         PEA   L053259
         LDX   #$0000
         LDA   $03
         DEC
         BNE   L084AD3
         INX
L084AD3  PHX
         PEI   $69
         JSL   L087C26
         PEA   $0000
         PHD
         JSL   L08402E
L084AE2  BRL   L084F89
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         STZ   L055099
         LDX   #$0000
         LDA   #$0004
         CMP   $07
         BNE   L084AFD
         INX
L084AFD  PHX
         LDX   #$0000
         LDA   $07
         BNE   L084B06
         INX
L084B06  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L084B48
         PHY
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081A64
         PLA
         LSR
         BCS   L084B26
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L085216
L084B26  LDA   $07
         BNE   L084B32
         LDA   #$0001
         STA   L055099
         BRA   L084B46
L084B32  PEA   ^L053259
         PEA   L053259
         JSL   L150383
         PEA   ^L053127
         PEA   L053127
         JSL   L082712
L084B46  BRA   L084B6F
L084B48  PEA   ^L053259
         PEA   L053259
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L1517EB
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         PEA   ^L053127
         PEA   L053127
         JSL   L082712
L084B6F  LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$001C
         BCC   L084B84
         INX
L084B84  STA   $73
         STX   $75
         LDY   #$0002
         LDA   [$73],Y
         TAX
         LDA   [$73]
         PHX
         PHA
         PEI   $69
         JSL   L0806D6
         PEA   ^L05311F
         PEA   L05311F
         PEA   ^L053127
         PEA   L053127
         PEA   $0008
         JSL   L0313BE
         LDA   #$0004
         CMP   $07
         BNE   L084BBC
         PEA   ^L053259
         PEA   L053259
         JSL   L150383
L084BBC  BRL   L084F89
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         JSL   L082712
         LDA   #$0002
         STA   $65
         LDA   $67
         BMI   L084BDC
         BEQ   L084BDC
         LDA   #$0001
         STA   $65
L084BDC  PEA   $0026
         PEI   $65
         JSL   L1500F5
         PLX
         PLX
         STA   $01
         LDA   $01
         BMI   L084C40
         STZ   $6F
L084BEF  LDA   $6F
         BEQ   L084BF9
         PEI   $67
         JSL   L0706CF
L084BF9  STZ   $71
L084BFB  LDA   $71
         PEA   $0014
         JSL   L150BEE
         LDA   $6F
         PEI   $65
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $55
         LDA   $65
         CLC
         ADC   $55
         STA   $59
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L084560
         LDA   #$0009
         CMP   $71
         BEQ   L084C36
         INC   $71
         BRA   L084BFB
L084C36  LDA   $6F
         CMP   $01
         BEQ   L084C40
         INC   $6F
         BRA   L084BEF
L084C40  PEA   $0000
         PHD
         JSL   L0846EC
         PEA   $0000
         PHD
         JSL   L083FA3
L084C50  BRL   L084F89
         PEI   $03
         PEA   $0000
         PHD
         JSL   L084853
L084C5D  BRL   L084F89
         LDA   #$005A
         STA   $55
         LDA   #$0120
         STA   $57
         LDA   #$006E
         STA   $59
         LDA   #$0160
         STA   $5B
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L084560
         LDA   #$0020
         STA   $6B
         LDA   #$000A
         STA   $6D
         LDA   $67
         BMI   L084C9F
         BEQ   L084C9F
         LDA   #$0010
         STA   $6B
         LDA   #$0005
         STA   $6D
L084C9F  PEI   $69
         JSL   L0706CF
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         LDA   $6B
         EOR   #$FFFF
         INC
         PHA
         LDA   $6D
         EOR   #$FFFF
         INC
         PHA
         JSL   L151005
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PEI   $6B
         PEI   $6D
         PEA   $0000
         PHD
         JSL   L08462D
         PHY
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PEA   ^L053259
         PEA   L053259
         JSL   L1501A9
         PLA
         LSR
         BCC   L084C9F
         PEA   $0000
         PHD
         JSL   L0846EC
         PEA   $0000
         PHD
         JSL   L083FA3
L084CFD  BRL   L084F89
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         JSL   L082712
         LDA   #$0020
         STA   $6B
         LDA   #$000A
         STA   $6D
         LDA   $67
         BMI   L084D27
         BEQ   L084D27
         LDA   #$0010
         STA   $6B
         LDA   #$0005
         STA   $6D
L084D27  TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PEI   $6B
         PEI   $6D
         PEA   $0000
         PHD
         JSL   L08462D
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PEI   $6B
         PEI   $6D
         JSL   L151005
         PEI   $69
         JSL   L0706CF
         PHY
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         JSL   L081A64
         PLA
         LSR
         BCC   L084D27
         PEA   $0000
         PHD
         JSL   L0846EC
         PEA   $0000
         PHD
         JSL   L083FA3
L084D75  BRL   L084F89
         PEA   $0000
         PHD
         JSL   L084747
L084D80  BRL   L084F89
         STZ   $55
         LDA   #$0120
         STA   $57
         LDA   #$00C8
         STA   $59
         LDA   #$0160
         STA   $5B
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L084560
         LDA   #$0140
         STA   $5B
         STZ   $4D
         LDA   #$0140
         STA   $4F
         LDA   #$00C8
         STA   $51
         LDA   #$0160
         STA   $53
         LDA   #$0020
         STA   $6B
         LDA   $67
         BMI   L084DCB
         BEQ   L084DCB
         LDA   #$0010
         STA   $6B
L084DCB  PEI   $67
         JSL   L0706CF
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         LDA   $6B
         EOR   #$FFFF
         INC
         PHA
         PEA   $0000
         JSL   L1501AF
         TDC
         CLC
         ADC   #$0055
         PEA   $0000

*

         PHA
         PEA   $0000
         PHD
         JSL   L084560
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         PEI   $6B
         PEA   $0000
         JSL   L1501AF
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L084560
         LDA   $57
         BNE   L084DCB
         PEA   $0000
         PHD
         JSL   L0846EC
         PEA   $0000
         PHD
         JSL   L083FA3
L084E30  BRL   L084F89
         STZ   $55
         STZ   $57
         LDA   #$00C8
         STA   $59
         LDA   #$0020
         STA   $5B
         STZ   $4D
         LDA   #$0260
         STA   $4F
         LDA   #$00C8
         STA   $51
         LDA   #$0280
         STA   $53
         LDA   #$0020
         STA   $6B
         LDA   $67
         BMI   L084E62
         BEQ   L084E62
         LDA   #$0010
         STA   $6B
L084E62  PEI   $69
         JSL   L0706CF
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L084560
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L084560
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PEI   $6B
         PEA   $0000
         JSL   L1501AF
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         LDA   $6B
         EOR   #$FFFF
         INC
         PHA
         PEA   $0000
         JSL   L1501AF
         LDA   $5B
         SEC
         SBC   $4F
         BEQ   L084E62
         BVS   L084EBF
         EOR   #$8000
L084EBF  BPL   L084E62
         PEA   $0000
         PHD
         JSL   L0846EC
         PEA   $0000
         PHD
         JSL   L083FA3
L084ED1  BRL   L084F89
         LDX   #$0000
         LDA   $07
         BNE   L084EDC
         INX
L084EDC  PHX
         LDX   #$0000
         LDA   #$0004
         CMP   $07
         BNE   L084EE8
         INX
L084EE8  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L084EF2
         BRL   L084F71
L084EF2  PEA   $0000
         PHD
         JSL   L083EEC
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         JSL   L085F5A
         LDA   #$0004
         CMP   $07
         BNE   L084F53
         STZ   $6F
L084F10  TDC
         CLC
         ADC   #$002D
         STA   $73
         STZ   $75
         LDA   $6F
         ASL
         TAY
         TYA
         CLC
         ADC   $73
         TAX
         LDA   $75
         BCC   L084F27
         INC
L084F27  PHA
         PHX
         TDC
         CLC
         ADC   #$002D
         STA   $73
         STZ   $75
         LDA   $6F
         ASL
         TAY
         LDA   #$0FFF
         EOR   [$73],Y
         PLX
         STX   $73
         PLX
         STX   $75
         STA   [$73]
         LDA   #$000F
         CMP   $6F
         BEQ   L084F4E
         INC   $6F
         BRA   L084F10
L084F4E  STZ   L055097
         BRA   L084F59
L084F53  LDA   #$0001
         STA   L055097
L084F59  TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEI   $69
         PEA   $0000
         PHD
         JSL   L0842EB
         STZ   L055095
         BRA   L084F7F
L084F71  PEI   $07
         PEI   $09
         PEI   $69
         PEA   $0000
         PHD
         JSL   L084451
L084F7F  BRA   L084F89
L084F81  PEA   $0000
         PHD
         JSL   L08402E
L084F89  LDA   $7A
         STA   $82
         LDA   $79
         STA   $81
         LDA   $77
         TCD
         TSC
         CLC
         ADC   #$0080
         TCS
         RTL

L084F9B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L055149
         STA   $01
         LDA   L055153
         BEQ   L084FB0
         STZ   L055149
L084FB0  PEI   $10
         PEI   $0E
         PEA   $0001
         PEI   $0C
         JSL   L081517
         LDA   $01
         STA   L055149
         LDA   $0A
         STA   $10
         LDA   $09
         STA   $0F
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L084FD4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         LDX   #$0000
         LDA   L055119
         ORA   L05511B
         BNE   L084FE8
         INX
L084FE8  PHX
         LDA   L055137
         EOR   #$0001
         AND   $01,S
         PLX
         ORA   L055151
         BEQ   L084FFA
         BRL   L08508B
L084FFA  TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         CLC
         ADC   #$0002
         BCC   L08501F
         INX
L08501F  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   L055139
         BNE   L085055
         LDA   L055119
         LDX   L05511B
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
         PEA   ^L05310F
         PEA   L05310F
         JSL   L083523
         LDA   #$0001
         STA   L055139
L085055  LDA   L055101
         LDX   L055103
         PHX
         PHA
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         PEI   $24
         PEI   $22
         PEI   $24
         PEI   $22
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   $FFFE
         JSL   L0836B6
         PEA   ^L05310F
         PEA   L05310F
         PEI   $20
         PEI   $1E
         JSL   L081E53
L08508B  LDA   $1C
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

L08509D  ENT
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
         LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         JSL   L151131
         JSL   L1510A1
         PEA   $3333
         JSL   L081DD8
         LDA   #$000C
         CLC
         ADCL  L05324B
         PHA
         LDAL  L05324D
         PHA
         JSL   L1510C5
         LDAL  L05324F
         SEC
         SBC   #$000C
         PHA
         LDAL  L05324D
         PHA
         JSL   L1505DA
         JSL   L1510A1
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150BD0
         PEI   $03
         PEI   $01
         JSL   L151131
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L08510A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         PEI   $16
         JSL   L081DD8
         PEA   $0002
         PEA   $0001
         JSL   L151083
         LDY   #$0006
         LDA   [$18],Y
         SEC
         SBC   #$001A
         STA   $01
         PEI   $01
         LDA   [$18]
         PHA
         JSL   L1510C5
         PEI   $01
         LDY   #$0004
         LDA   [$18],Y
         DEC
         PHA
         JSL   L1505DA
         LDA   $01
         INC
         INC
         PHA
         LDA   #$000C
         CLC
         ADC   [$18]
         PHA
         JSL   L1510C5
         PEA   $0016
         PEA   $0000
         JSL   L15056E
         LDA   $01
         INC
         INC
         PHA
         LDY   #$0004
         LDA   [$18],Y
         SEC
         SBC   #$000D
         PHA
         JSL   L1510C5
         PEA   $0016
         PEA   $0000
         JSL   L15056E
         PHY
         PHY
         JSL   L1517D9
         PLA
         STA   $07
         PLX
         STX   $09
         PHY
         PHY
         JSL   L1507FB
         PLA
         STA   $03
         PLX
         STX   $05
         PHY
         PHY
         PEA   $FFFF
         PEA   $FFFF
         JSL   L150B16
         JSL   L150D20
         PHY
         PEI   $16
         JSL   L081A92
         JSL   L1511E6
         PEI   $14
         JSL   L1511E0
         PEA   $0000
         JSL   L1512E3
         PEA   $0000
         JSL   L1516ED
         LDA   #$0004
         CLC
         ADC   $01
         PHA
         LDA   [$18]
         INC
         INC
         PHA
         JSL   L1510C5
         PEA   $0008
         JSL   L150197
         LDA   #$0004
         CLC
         ADC   $01
         PHA
         LDY   #$0004
         LDA   [$18],Y
         SEC
         SBC   #$000B
         PHA
         JSL   L1510C5
         PEA   $000A
         JSL   L150197
         PEI   $09
         PEI   $07
         JSL   L150D20
         PEI   $05
         PEI   $03
         JSL   L1507F5
         LDA   $12
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

L085216  ENT
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
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $13
         PLX
         STX   $15
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         LDAL  L0532BF
         AND   #$FFF8
         STAL  L0532BF
         LDA   #$0007
         CLC
         ADCL  L0532C3
         AND   #$FFF8
         STAL  L0532C3
         JSL   L086C4E
         LDA   L055153
         BNE   L085281
         BRL   L085323
L085281  LDA   L05514F
         BEQ   L0852A7
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
         BRA   L085313
L0852A7  PEA   ^L053117
         PEA   L053117
         PEA   ^L053127
         PEA   L053127
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L081E5F
         PHY
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         STA   $09
         LDA   L055109
         LDX   L05510B
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L08382C
         PEA   ^L053127
         PEA   L053127
         PEA   ^L053117
         PEA   L053117
         PEA   $0008
         JSL   L0313BE
L085313  PEA   $0000
         PEA   $0002
         PEA   $0000
         JSL   L084F9B
         BRL   L085451
L085323  LDA   L05514F
         BEQ   L085369
         PHY
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   ^L053127
         PEA   L053127
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         STA   $09
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   $FFFF
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L085B3C
         PEA   ^L053127
         PEA   L053127
         JSL   L08273B
         BRA   L0853D5
L085369  PEA   ^L053117
         PEA   L053117
         PEA   ^L053127
         PEA   L053127
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L081E5F
         PHY
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         STA   $09
         LDA   L055109
         LDX   L05510B
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L08382C
         PEA   ^L053127
         PEA   L053127
         PEA   ^L053117
         PEA   L053117
         PEA   $0008
         JSL   L0313BE
L0853D5  LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         CLC
         ADC   #$0002
         BCC   L0853F1
         INX
L0853F1  PHX
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   $0008
         JSL   L0313BE
         PEA   $0000
         PEA   $0002
         PEA   $0000
         JSL   L084F9B
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   ^L053127
         PEA   L053127
         JSL   L084FD4
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0000
         JSL   L081517
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         CLC
         ADC   #$0002
         BCC   L08544B
         INX
L08544B  PHX
         PHA
         JSL   L082712
L085451  PEA   ^L0532BD
         PEA   L0532BD
         JSL   L08273B
         JSL   L1510A1
         PEI   $15
         PEI   $13
         JSL   L151131
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

L085479  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $18
         PEI   $16
         PEA   $0008
         JSL   L0313BE
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $09
         PLX
         STX   $0B
         PEA   ^L0531E9
         PEA   L0531E9
         PEI   $0B
         PEI   $09
         PEA   ^L0531F1
         PEA   L0531F1
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   $14
         STA   $18
         LDA   $13
         STA   $17
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L0854D9  ENT
         PHD
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
         PEI   $20
         PEI   $1E
         PEA   $0008
         JSL   L0313BE
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $11
         PLX
         STX   $13
         LDA   L054FBB
         PHA
         LDX   #$0000
         PLA
         BPL   L08550C
         INX
L08550C  TXA
         PHA
         LDA   L0550DD
         LDX   L0550DF
         CMP   $11
         BNE   L08551A
         CPX   $13
L08551A  BEQ   L085521
         LDA   #$0000
         BRA   L085524
L085521  LDA   #$0001
L085524  AND   $01,S
         PLX
         LSR
         BCC   L085533
         LDA   #$0001
         STA   L05512D
         BRL   L0855D4
L085533  PEA   ^L0531D9
         PEA   L0531D9
         PEI   $13
         PEI   $11
         PEA   ^L0531E1
         PEA   L0531E1
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   L0550B5
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L083C0E
         JSL   L1510A1
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $FFFA
         PEA   $FFFD
         JSL   L151005
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PEA   $0000
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PEA   $FFFF
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         JSL   L1510A1
L0855D4  LDA   $1C
         STA   $20
         LDA   $1B
         STA   $1F
         LDA   $19
         TCD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L0855E6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $18
         PEI   $16
         PEA   $0008
         JSL   L0313BE
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   L054FBB
         PHA
         LDX   #$0000
         PLA
         BPL   L085619
         INX
L085619  TXA
         PHA
         LDA   L0550E9
         LDX   L0550EB
         CMP   $09
         BNE   L085627
         CPX   $0B
L085627  BEQ   L08562E
         LDA   #$0000
         BRA   L085631
L08562E  LDA   #$0001
L085631  AND   $01,S
         PLX
         LSR
         BCC   L08563F
         LDA   #$0001
         STA   L055131
         BRA   L085669
L08563F  PEA   ^L0531F9
         PEA   L0531F9
         PEI   $0B
         PEI   $09
         PEA   ^L053201
         PEA   L053201
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         JSL   L086B8B
L085669  LDA   $14
         STA   $18
         LDA   $13
         STA   $17
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L08567B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0007
         CMP   $0E
         BNE   L085696
         LDA   #$0022
         STA   $01
         LDA   #$001E
         STA   $03
         BRA   L0856A0
L085696  LDA   #$0008
         STA   $01
         LDA   #$000F
         STA   $03
L0856A0  LDA   #$0004
         CLC
         ADC   $10
         LDX   $12
         BCC   L0856AB
         INX
L0856AB  STA   $05
         STX   $07
         PHY
         LDA   $01
         CLC
         ADC   [$10]
         PHA
         LDY   #$0004
         LDA   [$10],Y
         PHA
         JSL   L072FA6
         PLA
         STA   [$05]
         LDA   #$0006
         CLC
         ADC   $10
         LDX   $12
         BCC   L0856CE
         INX
L0856CE  STA   $05
         STX   $07
         PHY
         LDY   #$0002
         LDA   $03
         CLC
         ADC   [$10],Y
         PHA
         LDY   #$0006
         LDA   [$10],Y
         PHA
         JSL   L072FA6
         PLA
         STA   [$05]
         LDA   $0C
         STA   $12
         LDA   $0B
         STA   $11
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L0856FB  PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         STZ   $1E
         LDY   #$006B
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         STA   $01
         STX   $03
         LDY   #$0004
         LDA   #$8000
         AND   [$01],Y
         CMP   #$0000
         BEQ   L085723
         BRL   L0857B7
L085723  PHY
         LDA   #$003F
         CLC
         ADC   $1A
         LDX   $1C
         BCC   L08572F
         INX
L08572F  PHX
         PHA
         LDA   #$0006
         CLC
         ADC   $01
         LDX   $03
         BCC   L08573C
         INX
L08573C  PHX
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCC   L0857B7
         LDY   #$000E
         LDA   [$01],Y
         AND   #$000F
         BNE   L0857B2
         LDY   #$0004
         LDA   #$000F
         AND   [$01],Y
         DEC
         BNE   L0857B2
         LDY   #$0010
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L0857B2
         LDY   #$0002
         LDA   [$01],Y
         STA   $05
         LDY   #$007A
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         CMP   L05501F
         BNE   L085788
         CPX   L055021
L085788  BEQ   L085792
         LDA   $05
         EOR   #$FFFF
         INC
         STA   $05
L085792  PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEI   $05
         JSL   L07A609
         PLA
         STA   $07
         LDA   $07
         BNE   L0857B2
         BRA   L0857B7
L0857B2  LDA   #$0001
         STA   $1E
L0857B7  LDA   $18
         STA   $1C
         LDA   $17
         STA   $1B
         LDA   $15
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L0857C9  PHD
         TSC
         CLC
         ADC   #$FFD2
         TCS
         TCD
         PHY
         PEI   $40
         PEI   $3E
         PEI   $3C
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCC   L0857FF
         PEI   $3A
         PEI   $38
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         BRA   L085807
L0857FF  PEI   $3A
         PEI   $38
         JSL   L08273B
L085807  LDA   $32
         STA   $40
         LDA   $31
         STA   $3F
         LDA   $2F
         TCD
         TSC
         CLC
         ADC   #$003E
         TCS
         RTL

L085819  ENT
         PHD
         TSC
         CLC
         ADC   #$FF90
         TCS
         TCD
         LDA   #$0001
         STA   $7C
         STZ   $59
         STZ   $5B
         STZ   $5D
         PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $63
         PLX
         STX   $65
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $5F
         PLX
         STX   $61
         PEI   $7A
         PEI   $78
         PEI   $76
         TDC
         CLC
         ADC   #$003F
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L0857C9
         TDC
         CLC
         ADC   #$003F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         JSL   L0808E0
         LDA   L05501F
         LDX   L055021
         CMP   $78
         BNE   L08588D
         CPX   $7A
L08588D  BEQ   L085892
         BRL   L085A4A
L085892  LDA   $5F
         ORA   $61
         BEQ   L085912
         LDY   #$0002
         LDA   [$5F],Y
         TAX
         LDA   [$5F]
         CLC
         ADC   #$0032
         BCC   L0858A7
         INX
L0858A7  STA   $69
         STX   $6B
         LDY   #$0002
         LDA   [$5F],Y
         TAX
         LDA   [$5F]
         CLC
         ADC   #$0024
         BCC   L0858BA
         INX
L0858BA  STA   $6D
         STX   $6F
         LDA   [$6D]
         STA   $03
         LDA   $03
         SEC
         SBC   #$0001
         BVS   L0858CD
         EOR   #$8000
L0858CD  BPL   L085912
         LDA   #$0001
         STA   $67
L0858D4  LDA   $59
         BEQ   L0858E8
         PHY
         PEA   $0000
         PHD
         JSL   L0856FB
         PLA
         LSR
         BCC   L0858E8
         BRL   L085AEB
L0858E8  LDY   #$0002
         LDA   $76
         CMP   [$69],Y
         BNE   L0858F6
         LDA   #$0001
         STA   $59
L0858F6  PEI   $6B
         PEI   $69
         LDA   [$69]
         JSL   L150488
         JSL   L150F53
         STA   $69
         STX   $6B
         LDA   $67
         CMP   $03
         BEQ   L085912
         INC   $67
         BRA   L0858D4
L085912  LDA   L055151
         BEQ   L08591A
         BRL   L085A4A
L08591A  PHY
         PEI   $7A
         PEI   $78
         PEI   $76
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         BEQ   L08593F
         PHA
         LDA   #$0018
         AND   $23
         BEQ   L08593C
         LDA   #$0001
L08593C  AND   $01,S
         PLX
L08593F  STA   $57
         LDA   L055153
         EOR   #$0001
         AND   L055137
         BEQ   L085996
         TDC
         CLC
         ADC   #$004F
         PEA   $0000
         PHA
         JSL   L082712
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         TDC
         CLC
         ADC   #$004F
         PEA   $0000
         PHA
         JSL   L08295E
         LDA   $57
         BEQ   L085994
         TDC
         CLC
         ADC   #$0047
         PEA   $0000
         PHA
         JSL   L082712
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         TDC
         CLC
         ADC   #$0047
         PEA   $0000
         PHA
         JSL   L082766
L085994  BRA   L0859F8
L085996  PHY
         PHY
         LDA   L055119
         LDX   L05511B
         PHX
         PHA
         PEA   $0000
         JSL   L077264
         PLA
         STA   $5B
         PLX
         STX   $5D
         LDA   $5B
         ORA   $5D
         BNE   L0859B6
         BRL   L085A4A
L0859B6  TDC
         CLC
         ADC   #$004F
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         CLC
         ADC   #$001C
         BCC   L0859CE
         INX
L0859CE  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0047
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         CLC
         ADC   #$0024
         BCC   L0859EF
         INX
L0859EF  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
L0859F8  PHY
         TDC
         CLC
         ADC   #$004F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCC   L085A1F
         BRL   L085AEB
L085A1F  LDA   $57
         BEQ   L085A4A
         PHY
         TDC
         CLC
         ADC   #$0047
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCC   L085A4A
         BRL   L085AEB
L085A4A  LDA   $63
         ORA   $65
         BNE   L085A53
         BRL   L085AE9
L085A53  LDY   #$0002
         LDA   [$63],Y
         TAX
         LDA   [$63]
         CLC
         ADC   #$0032
         BCC   L085A62
         INX
L085A62  STA   $69
         STX   $6B
         LDY   #$0002
         LDA   [$63],Y
         TAX
         LDA   [$63]
         CLC
         ADC   #$0024
         BCC   L085A75
         INX
L085A75  STA   $6D
         STX   $6F
         LDA   [$6D]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L085A88
         EOR   #$8000
L085A88  BPL   L085AE9
         LDA   #$0001
         STA   $67
L085A8F  LDA   $59
         BEQ   L085AA0
         PHY
         PEA   $0000
         PHD
         JSL   L0856FB
         PLA
         LSR
         BCS   L085AEB
L085AA0  LDX   #$0000
         LDY   #$0002
         LDA   [$69],Y
         CMP   $76
         BNE   L085AAD
         INX
L085AAD  TXA
         BEQ   L085ACD
         LDA   L055027
         LDX   L055029
         CMP   $78
         BNE   L085ABC
         CPX   $7A
L085ABC  BEQ   L085AC3
         LDA   #$0000
         BRA   L085AC6
L085AC3  LDA   #$0001
L085AC6  BEQ   L085ACD
         LDA   #$0001
         STA   $59
L085ACD  PEI   $6B
         PEI   $69
         LDA   [$69]
         JSL   L150488
         JSL   L150F53
         STA   $69
         STX   $6B
         LDA   $67
         CMP   $01
         BEQ   L085AE9
         INC   $67
         BRA   L085A8F
L085AE9  STZ   $7C
L085AEB  LDA   $5B
         ORA   $5D
         BEQ   L085B00
         LDA   L055119
         LDX   L05511B
         PHX
         PHA
         PEA   $0000
         JSL   L074A5A
L085B00  LDA   $63
         ORA   $65
         BEQ   L085B15
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
L085B15  LDA   $5F
         ORA   $61
         BEQ   L085B2A
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L085B2A  LDA   $74
         STA   $7A
         LDA   $73
         STA   $79
         LDA   $71
         TCD
         TSC
         CLC
         ADC   #$0078
         TCS
         RTL

L085B3C  ENT
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
         BCC   L085BE8
         LDA   #$FFF8
         AND   $03
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
         STA   $0D
         LDA   $07
         LSR
         LSR
         LSR
         AND   #$7FFF
         SEC
         SBC   $0D
         STA   $0F
         LDA   #$0050
         SEC
         SBC   $0F
         ASL
         STA   $11
         LDA   $0D
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
         PEI   $28
         PEI   $26
         LDA   $09
         JSL   L150488
         JSL   L150F53
         STA   $13
         STX   $15
         PEI   $15
         PEI   $13
         PEI   $24
         PEI   $0B
         PEI   $0F
         PEI   $11
         JSL   L080565
L085BE8  LDA   $1E
         STA   $28
         LDA   $1D
         STA   $27
         LDA   $1B
         TCD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL

L085BFA  PHD
         TSC
         CLC
         ADC   #$FFD0
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
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L081A64
         PLA
         LSR
         BCC   L085C2B
         BRL   L085DAE
L085C2B  LDA   $07
         ORA   $03
         AND   #$0007
         BNE   L085C4A
         PEI   $3E
         PEI   $3C
         PEI   $3A
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L085B3C
         BRL   L085DAE
L085C4A  PHY
         PHY
         JSL   L150493
         PLA
         STA   $29
         PLX
         STX   $2B
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEA   ^L05312F
         PEA   L05312F
         PEA   $0010
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $2D
         STX   $2F
         LDY   #$0002
         LDA   [$2D],Y
         TAX
         LDA   [$2D]
         CLC
         ADC   #$0002
         BCC   L085C9B
         INX
L085C9B  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         LDAL  L053149
         TAX
         LDAL  L053147
         STA   $2D
         STX   $2F
         LDY   #$0002
         LDA   [$2D],Y
         TAX
         LDA   [$2D]
         CLC
         ADC   #$0002
         BCC   L085CC9
         INX
L085CC9  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $3C
         LDX   $3E
         STAL  L053131
         TXA
         STAL  L053133
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $2D
         STX   $2F
         LDY   #$0002
         LDA   [$2D],Y
         TAX
         LDA   [$2D]
         CLC
         ADC   #$0002
         BCC   L085CFB
         INX
L085CFB  PHX
         PHA
         JSL   L082712
         LDAL  L053149
         TAX
         LDAL  L053147
         STA   $2D
         STX   $2F
         LDY   #$0002
         LDA   [$2D],Y
         TAX
         LDA   [$2D]
         CLC
         ADC   #$0002
         BCC   L085D1D
         INX
L085D1D  PHX
         PHA
         JSL   L082712
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $3A
         PEI   $3A
         JSL   L1501B5
         PEA   ^L05312F
         PEA   L05312F
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEA   $0010
         JSL   L0313BE
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $2D
         STX   $2F
         LDY   #$0002
         LDA   [$2D],Y
         TAX
         LDA   [$2D]
         CLC
         ADC   #$0002
         BCC   L085D66
         INX
L085D66  PHX
         PHA
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDAL  L053149
         TAX
         LDAL  L053147
         STA   $2D
         STX   $2F
         LDY   #$0002
         LDA   [$2D],Y
         TAX
         LDA   [$2D]
         CLC
         ADC   #$0002
         BCC   L085D94
         INX
L085D94  PHX
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PEI   $2B
         PEI   $29
         JSL   L151131
L085DAE  LDA   $34
         STA   $3E
         LDA   $33
         STA   $3D
         LDA   $31
         TCD
         TSC
         CLC
         ADC   #$003C
         TCS
         RTL

L085DC0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         LDA   #$FFF8
         ANDL  L0532BF
         STAL  L0532BF
         LDA   #$0007
         CLC
         ADCL  L0532C3
         AND   #$FFF8
         STAL  L0532C3
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         CLC
         ADC   #$0002
         BCC   L085E11
         INX
L085E11  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         CLC
         ADC   #$0002
         BCC   L085E36
         INX
L085E36  PHX
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   $0008
         JSL   L0313BE
         LDA   L05514F
         BEQ   L085E82
         PHY
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   ^L053127
         PEA   L053127
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCC   L085E80
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   $FFFF
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L085B3C
L085E80  BRA   L085EDC
L085E82  PEA   ^L053117
         PEA   L053117
         PEA   ^L053127
         PEA   L053127
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L081E5F
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCC   L085EDC
         LDA   L055109
         LDX   L05510B
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L08382C
L085EDC  PEA   $0000
         PEA   $0002
         PEA   $0000
         JSL   L084F9B
         LDA   L055153
         BNE   L085F10
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   ^L053127
         PEA   L053127
         JSL   L084FD4
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0000
         JSL   L081517
L085F10  PEA   ^L0532BD
         PEA   L0532BD
         JSL   L087BAE
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L08273B
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         CLC
         ADC   #$0002
         BCC   L085F40
         INX
L085F40  PHX
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TSC
         CLC
         ADC   #$0014
         TCS
         PLD
         RTL

L085F5A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $01
         LDA   L055153
         BNE   L085F82
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $0E
         PEI   $0C
         JSL   L07A972
L085F82  LDA   $01
         BNE   L085F9F
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $0E
         PEI   $0C
         JSL   L07A972
L085F9F  LDA   $01
         BNE   L085FC2
         LDA   #$1000
         ANDL  L053AE9
         BEQ   L085FC2
         PEI   $0E
         PEI   $0C
         PEA   ^L053AFD
         PEA   L053AFD
         PEA   $0020
         JSL   L0313BE
         LDA   #$0001
         STA   $01
L085FC2  LDA   $01
         BNE   L085FD7
         PEI   $0E
         PEI   $0C
         PEA   ^L041CB3
         PEA   L041CB3
         PEA   $0020
         JSL   L0313BE
L085FD7  LDA   $0A
         STA   $0E
         LDA   $09
         STA   $0D
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L085FE9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0C
         STZ   $0E
         LDA   $0A
         SEC
         SBC   #$0025
         BEQ   L086006
         BVS   L086002
         EOR   #$8000
L086002  BPL   L086006
         BRA   L086019
L086006  LDA   $0A
         ASL
         ASL
         TAX
         LDAL  L0415B2+2,X
         PHA
         LDAL  L0415B2,X
         PLX
         STA   $0C
         STX   $0E
L086019  LDA   $08
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

L086029  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         STZ   $12
         LDA   #L052F67
         LDX   #^L052F67
         STA   $01
         STX   $03
         LDA   #$0001
         STA   $05
L086042  LDA   L055027
         LDX   L055029
         CMP   [$01]
         BNE   L086052
         LDY   #$0002
         TXA
         CMP   [$01],Y
L086052  BEQ   L086059
         LDA   #$0000
         BRA   L08605C
L086059  LDA   #$0001
L08605C  BEQ   L08607E
         PHA
         LDY   #$0006
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   L055039
         BNE   L086071
         CPX   L05503B
L086071  BEQ   L086078
         LDA   #$0000
         BRA   L08607B
L086078  LDA   #$0001
L08607B  AND   $01,S
         PLX
L08607E  CMP   #$0000
         BEQ   L0860B8
         LDX   #$0000
         LDY   #$0008
         LDA   $10
         CMP   [$01],Y
         BNE   L086090
         INX
L086090  TXA
         BEQ   L0860B8
         LDY   #$000A
         LDA   [$01],Y
         STA   $12
         LDA   L054FB7
         LDX   L054FB9
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         LDY   #$000C
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         BRA   L0860D3
L0860B8  LDA   $01
         LDX   $03
         CLC
         ADC   #$0010
         BCC   L0860C3
         INX
L0860C3  STA   $01
         STX   $03
         LDA   #$0014
         CMP   $05
         BEQ   L0860D3
         INC   $05
         BRL   L086042
L0860D3  LDA   $0E
         STA   $10
         LDA   $0D
         STA   $0F
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L0860E5  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0550B3
         BEQ   L0860F5
         LDA   #$0001
L0860F5  PHA
         LDX   #$0000
         LDA   L054FBB
         BNE   L0860FF
         INX
L0860FF  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L086141
         LDA   L0550B9
         DEC
         BNE   L086125
         PEA   ^L0530A7
         PEA   L0530A7
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         PEA   $0000
         JSL   L1601A8
         BRA   L086141
L086125  PEA   ^L0532BD
         PEA   L0532BD
         JSL   L085216
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   ^L0530A7
         PEA   L0530A7
         JSL   L083985
L086141  JSL   L086C29
         PLY
         PLY
         PLD
         RTL

L086149  ENT
         PHD
         TSC
         CLC
         ADC   #$FF92
         TCS
         TCD
         PEA   ^L0530A7
         PEA   L0530A7
         JSL   L08273B
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $67
         PLX
         STX   $69
         STZ   $63
         STZ   $65
         STZ   $5F
         STZ   $61
         STZ   $59
         STZ   $5B
         LDAL  L0552FF
         BEQ   L08617C
         BRL   L0864D0
L08617C  LDA   L0550AB
         SEC
         SBC   L0550AD
         BNE   L086188
         BRL   L0864D0
L086188  BVS   L08618D
         EOR   #$8000
L08618D  BMI   L086192
         BRL   L0864D0
L086192  PHY
         LDA   L0550AF
         LDX   L0550B1
         PHX
         PHA
         LDA   L0550B3
         PHA
         PEA   $0002
         JSL   L07AC17
         PLA
         STA   $5D
         PHY
         LDA   L0550AF
         LDX   L0550B1
         PHX
         PHA
         PEI   $5D
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCS   L0861C8
         BRL   L0864D0
L0861C8  LDA   #$8000
         AND   $05
         BEQ   L0861D2
         BRL   L0864D0
L0861D2  LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         LDA   $1B
         STA   $59
         LDA   $1F
         SEP   #$20
         STA   $5B
         REP   #$20
         LDA   $1D
         SEP   #$20
         STA   $5C
         REP   #$20
         PEI   $5B
         PEI   $59
         JSL   L087547
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$0078
         BCC   L086207
         INX
L086207  STA   $6B
         STX   $6D
         LDA   $59
         LDX   $5B
         CMP   [$6B]
         BNE   L086219
         LDY   #$0002
         TXA
         CMP   [$6B],Y
L086219  BEQ   L086226
         PEI   $5B
         PEI   $59
         PEA   $0000
         JSL   L151663
L086226  LDA   $03
         STA   $55
         LDA   L055027
         LDX   L055029
         CMP   L0550AF
         BNE   L086238
         CPX   L0550B1
L086238  BNE   L08623F
         LDA   #$0000
         BRA   L086242
L08623F  LDA   #$0001
L086242  STA   $57
         LDA   $57
         BNE   L086250
         LDA   $55
         EOR   #$FFFF
         INC
         STA   $55
L086250  LDA   #$4000
         AND   $05
         BEQ   L08625A
         LDA   #$0001
L08625A  AND   $57
         STA   $53
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $57
         TDC
         CLC
         ADC   #$002B
         PEA   $0000
         PHA
         JSL   L083B58
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$002B
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$000F
         AND   $0F
         CMP   #$0007
         BNE   L0862B8
         PHY
         PEI   $55
         JSL   L086029
         LDA   $21
         JSL   L150BEE
         PLA
         STA   $4F
         LDA   $33
         SEC
         SBC   $4F
         STA   $33
         LDA   $39
         SEC
         SBC   #$001A
         STA   $39
L0862B8  LDA   $39
         SEC
         SBC   $35
         STA   $51
         PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $63
         PLX
         STX   $65
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $5F
         PLX
         STX   $61
         LDX   #$0000
         LDA   $63
         ORA   $65
         BNE   L0862F1
         INX
L0862F1  PHX
         LDX   #$0000
         LDA   $5F
         ORA   $61
         BNE   L0862FC
         INX
L0862FC  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L086306
         BRL   L0864D0
L086306  PHY
         PHY
         PEI   $61
         PEI   $5F
         PEI   $65
         PEI   $63
         PEI   $55
         PEI   $53
         JSL   L07B038
         PLA
         STA   $4B
         PLX
         STX   $4D
         LDA   $33
         STAL  L0530A7
         STZ   $49
L086326  LDA   #$00FF
         AND   [$4B]
         BEQ   L086381
         PEI   $4D
         PEI   $4B
         PEI   $51
         TDC
         CLC
         ADC   #$0047
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         JSL   L081B04
         LDA   $49
         CLC
         ADC   $47
         SEC
         SBC   L0550AD
         BEQ   L08635B
         BVS   L086359
         EOR   #$8000
L086359  BMI   L086384
L08635B  LDA   $47
         CLC
         ADC   $49
         STA   $49
         PEI   $4D
         PEI   $4B
         LDA   $47
         JSL   L150488
         JSL   L150F53
         STA   $4B
         STX   $4D
         LDA   $21
         CLC
         ADCL  L0530A7
         STAL  L0530A7
         BRA   L086326
L086381  BRL   L0864D0
L086384  LDA   $21
         CLC
         ADCL  L0530A7
         INC
         STAL  L0530AB
         LDA   L0550AD
         SEC
         SBC   $49
         STA   $41
         LDA   $51
         SEC
         SBC   $45
         STA   $3F
         LDA   #$FFFF
         CMP   $19
         BNE   L0863AC
         LDA   $3F
         STA   $43
         BRA   L0863BA
L0863AC  LDA   $19
         DEC
         BNE   L0863B8
         LDA   $3F
         LSR
         STA   $43
         BRA   L0863BA
L0863B8  STZ   $43
L0863BA  PHY
         PEI   $43
         PEA   $0000
         PEI   $51
         JSL   L071A1B
         PLA
         STA   $43
         LDA   $43
         CLC
         ADC   $35
         PHA
         PHY
         PEI   $4D
         PEI   $4B
         LDA   L0550AD
         SEC
         SBC   $49
         PHA
         JSL   L1506F3
         PLA
         CLC
         ADC   $01,S
         PLX
         DEC
         DEC
         STAL  L0530A9
         LDA   #$0004
         CLC
         ADCL  L0530A9
         PHA
         PHY
         PEI   $4D
         PEI   $4B
         LDA   $41
         JSL   L150488
         JSL   L150F53
         PHX
         PHA
         LDA   L0550AB
         SEC
         SBC   L0550AD
         PHA
         JSL   L1506F3
         PLA
         CLC
         ADC   $01,S
         PLX
         STAL  L0530AD
         LDA   #$000F
         AND   $0F
         CMP   #$0007
         BEQ   L086426
         BRL   L0864AB
L086426  STZ   $3D
         LDAL  L0530A7
         SEC
         SBC   $2B
         BVS   L086434
         EOR   #$8000
L086434  BMI   L086441
         LDA   $2B
         SEC
         SBCL  L0530A7
         STA   $3D
         BRA   L086464
L086441  LDA   $2F
         INC
         STA   $6B
         LDAL  L0530AB
         SEC
         SBC   $6B
         BEQ   L086464
         BVS   L086454
         EOR   #$8000
L086454  BPL   L086464
         LDA   $2F
         SEC
         SBCL  L0530AB
         SEC
         SBC   $21
         INC
         INC
         STA   $3D
L086464  LDA   $3D
         BEQ   L0864AB
         PEI   $55
         LDA   $4F
         SEC
         SBC   $3D
         PHA
         PEI   $21
         JSL   L1500F5
         PLX
         PLX
         PHA
         JSL   L0873D7
         PEA   ^L0530A7
         PEA   L0530A7
         PEA   $0000
         PEI   $3D
         PEI   $21
         JSL   L1500F5
         PLX
         PLX
         PEI   $21
         JSL   L150BEE
         JSL   L1501AF
         LDA   L0550AF
         LDX   L0550B1
         PHX
         PHA
         PEI   $5D
         PEA   $0001
         JSL   L0876F4
L0864AB  PHY
         TDC
         CLC
         ADC   #$002B
         PEA   $0000
         PHA
         PEA   ^L0530A7
         PEA   L0530A7
         PEA   ^L0530A7
         PEA   L0530A7
         JSL   L150B3A
         PLA
         STA   $3B
         JSL   L08765D
         JSL   L0875C4
L0864D0  LDA   $63
         ORA   $65
         BEQ   L0864E5
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
L0864E5  LDA   $5F
         ORA   $61
         BEQ   L0864FA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L0864FA  PEI   $5B
         PEI   $59
         PEA   $0010
         JSL   L150BC4
         PEI   $69
         PEI   $67
         JSL   L151131
         TSC
         CLC
         ADC   #$006E
         TCS
         PLD
         RTL

L086515  PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         LDA   #$0004
         CLC
         ADC   $26
         LDX   $28
         BCC   L086528
         INX
L086528  STA   $01
         STX   $03
         LDY   #$0010
         LDA   [$01],Y
         LDY   #$0008
         SEC
         SBC   [$01],Y
         STA   $0D
         LDA   #$0010
         CLC
         ADC   $01
         LDX   $03
         BCC   L086544
         INX
L086544  CLC
         ADC   #$0002
         BCC   L08654B
         INX
L08654B  STA   $19
         STX   $1B
         LDA   [$19]
         PHA
         LDA   #$0008
         CLC
         ADC   $01
         LDX   $03
         BCC   L08655D
         INX
L08655D  CLC
         ADC   #$0002
         BCC   L086564
         INX
L086564  STA   $19
         STX   $1B
         PLA
         SEC
         SBC   [$19]
         STA   $0F
         LDA   #$0010
         CLC
         ADC   $01
         LDX   $03
         BCC   L086579
         INX
L086579  CLC
         ADC   #$0004
         BCC   L086580
         INX
L086580  STA   $19
         STX   $1B
         LDA   [$19]
         LDY   #$0008
         SEC
         SBC   [$01],Y
         STA   $11
         LDA   #$0010
         CLC
         ADC   $01
         LDX   $03
         BCC   L086599
         INX
L086599  CLC
         ADC   #$0006
         BCC   L0865A0
         INX
L0865A0  STA   $19
         STX   $1B
         LDA   [$19]
         PHA
         LDA   #$0008
         CLC
         ADC   $01
         LDX   $03
         BCC   L0865B2
         INX
L0865B2  CLC
         ADC   #$0002
         BCC   L0865B9
         INX
L0865B9  STA   $19
         STX   $1B
         PLA
         SEC
         SBC   [$19]
         STA   $13
         LDY   #$00C4
         LDA   [$26],Y
         PHA
         DEY
         DEY
         LDA   [$26],Y
         PHA
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L150126
         LDY   #$0028
         LDA   [$22],Y
         TAX
         DEY
         DEY
         LDA   [$22],Y
         CLC
         ADC   #$00B2
         BCC   L0865EC
         INX
L0865EC  STA   $19
         STX   $1B
         LDA   #$000F
         AND   [$19]
         DEC
         BMI   L08665D
         CMP   #$0003
         BPL   L08665D
         SEC
         SBC   #$0000
         BEQ   L08660B
         DEC
         BEQ   L086645
         DEC
         BEQ   L086623
         BRA   L08665D
L08660B  LDA   $0F
         DEC
         DEC
         STA   $07
         LDA   $13
         INC
         INC
         STA   $0B
         LDA   $0D
         DEC
         STA   $05
         LDA   $11
         INC
         STA   $09
         BRA   L086676
L086623  LDA   $0F
         SEC
         SBC   #$000C
         STA   $07
         LDA   #$000C
         CLC
         ADC   $13
         STA   $0B
         LDA   $0D
         SEC
         SBC   #$0006
         STA   $05
         LDA   #$0006
         CLC
         ADC   $11
         STA   $09
         BRA   L086676
L086645  LDA   $0F
         DEC
         DEC
         STA   $07
         LDA   $13
         INC
         INC
         STA   $0B
         LDA   $0D
         DEC
         STA   $05
         LDA   $11
         INC
         STA   $09
         BRA   L086676
L08665D  LDA   $0F
         DEC
         DEC
         STA   $07
         LDA   $13
         INC
         INC
         STA   $0B
         LDA   $0D
         SEC
         SBC   #$0007
         STA   $05
         LDA   $11
         INC
         STA   $09
L086676  LDY   #$0028
         LDA   [$22],Y
         TAX
         DEY
         DEY
         LDA   [$22],Y
         CLC
         ADC   #$00B2
         BCC   L086687
         INX
L086687  STA   $19
         STX   $1B
         LDA   #$000F
         AND   [$19]
         DEC
         DEC
         BNE   L08670A
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $15
         PLX
         STX   $17
         PEI   $17
         PEI   $15
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150126
         LDA   #$0004
         CLC
         ADC   $07
         STA   $07
         LDA   $0B
         INC
         INC
         STA   $0B
         LDA   $05
         INC
         INC
         STA   $05
         LDA   $09
         INC
         STA   $09
         LDY   #$00C0
         LDA   [$26],Y
         PHA
         DEY
         DEY
         LDA   [$26],Y
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150126
         PEI   $17
         PEI   $15
         LDY   #$00C0
         LDA   [$26],Y
         PHA
         DEY
         DEY
         LDA   [$26],Y
         PHA
         LDY   #$00C0
         LDA   [$26],Y
         PHA
         DEY
         DEY
         LDA   [$26],Y
         PHA
         JSL   L150653
         PEI   $17
         PEI   $15
         JSL   L151669
         BRA   L086722
L08670A  LDY   #$00C0
         LDA   [$26],Y
         PHA
         DEY
         DEY
         LDA   [$26],Y
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150126
L086722  LDA   $20
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

L086734  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $17
         STZ   $30
         STZ   $32
         LDY   #$00B2
         LDA   #$000F
         AND   [$26],Y
         STA   $15
         LDA   $2A
         BPL   L086759
         BRL   L086B73
L086759  CMP   #$000B
         BMI   L086761
         BRL   L086B73
L086761  SEC
         SBC   #$0000
         BEQ   L086791
         DEC
         BNE   L08676D
         BRL   L08698A
L08676D  DEC
         BNE   L086773
         BRL   L086A81
L086773  DEC
         BNE   L086779
         BRL   L086A90
L086779  SEC
         SBC   #$0005
         BNE   L086782
         BRL   L086AE7
L086782  DEC
         BNE   L086788
         BRL   L086B00
L086788  DEC
         BNE   L08678E
         BRL   L086B18
L08678E  BRL   L086B73
L086791  JSL   L1510A1
         PEA   $0000
         JSL   L081DD8
         PEA   $0002
         PEA   $0001
         JSL   L151083
         LDA   $22
         BPL   L0867AD
         BRL   L086987
L0867AD  CMP   #$0002
         BMI   L0867B5
         BRL   L086987
L0867B5  SEC
         SBC   #$0000
         BEQ   L0867C4
         DEC
         BNE   L0867C1
         BRL   L08695C
L0867C1  BRL   L086987
L0867C4  LDY   #$00C0
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         CLC
         ADC   #$0002
         BCC   L0867E1
         INX
L0867E1  STA   $05
         STX   $07
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         LDY   #$0006
         LDA   [$05],Y
         LDY   #$0002
         SEC
         SBC   [$05],Y
         PHA
         LDY   #$0004
         LDA   [$05],Y
         SEC
         SBC   [$05]
         PHA
         JSL   L15100B
         LDA   $15
         DEC
         BPL   L086815
         BRL   L086908
L086815  CMP   #$0003
         BMI   L08681D
         BRL   L086908
L08681D  SEC
         SBC   #$0000
         BEQ   L08682C
         DEC
         BEQ   L08683C
         DEC
         BEQ   L086881
         BRL   L086908
L08682C  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         BRL   L08695A
L08683C  LDA   #$0004
         CLC
         ADC   $0B
         PHA
         LDA   $0D
         DEC
         PHA
         JSL   L1510C5
         LDA   $0F
         DEC
         DEC
         PHA
         LDA   $0D
         DEC
         PHA
         JSL   L1505DA
         LDA   $0F
         DEC
         DEC
         PHA
         LDA   $09
         INC
         INC
         PHA
         JSL   L1505DA
         LDA   $0F
         DEC
         DEC
         STA   $0F
         LDA   $0D
         DEC
         STA   $0D
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         BRL   L08695A
L086881  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         PEA   $000F
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $000A
         PEA   $0005
         JSL   L151005
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         PEA   $0004
         PEA   $0002
         JSL   L151083
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $FFF8
         PEA   $FFFC
         JSL   L151005
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         PEA   $0000
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0004
         PEA   $0002
         JSL   L151005
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         BRA   L08695A
L086908  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         PEA   ^L052E97
         PEA   L052E97
         PEA   $0000
         PEA   $FFFF
         JSL   L1501B5
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $000E
         PEA   $0000
         LDY   #$0006
         LDA   [$05],Y
         LDY   #$0002
         SEC
         SBC   [$05],Y
         PHA
         PEA   $0007
         JSL   L15100B
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $3333
         JSL   L1501B5
L08695A  BRA   L086987
L08695C  LDA   #$8000
         AND   $24
         BEQ   L086975
         PEA   ^L052E97
         PEA   L052E97
         PEA   $0000
         PEA   $0000
         JSL   L1501B5
         BRA   L086985
L086975  PEA   ^L052E97
         PEA   L052E97
         PEA   $0000
         PEA   $FFFF
         JSL   L1501B5
L086985  BRA   L086987
L086987  BRL   L086B73
L08698A  LDA   $15
         BEQ   L086991
         BRL   L086A21
L086991  PHY
         TDC
         CLC
         ADC   #$0022
         PEA   $0000
         PHA
         PEA   ^L052E97
         PEA   L052E97
         JSL   L1512CB
         PLA
         LSR
         BCC   L0869B6
         LDA   #$0016
         LDX   #$0000
         STA   $30
         STX   $32
         BRL   L086B73
L0869B6  LDY   #$00C0
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         CLC
         ADC   #$0002
         BCC   L0869D3
         INX
L0869D3  STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0010
         PEA   $0000
         LDY   #$0006
         LDA   [$01],Y
         LDY   #$0002
         SEC
         SBC   [$01],Y
         PHA
         PEA   $0007
         JSL   L15100B
         PHY
         TDC
         CLC
         ADC   #$0022
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCC   L086A21
         LDA   #$0014
         LDX   #$0000
         STA   $30
         STX   $32
         BRL   L086B73
L086A21  TDC
         CLC
         ADC   #$0022
         PEA   $0000
         PHA
         JSL   L151412
         PHY
         TDC
         CLC
         ADC   #$0022
         PEA   $0000
         PHA
         LDY   #$00C4
         LDA   [$26],Y
         PHA
         DEY
         DEY
         LDA   [$26],Y
         PHA
         JSL   L15137F
         PLA
         LSR
         BCC   L086A57
         LDA   #$0013
         LDX   #$0000
         STA   $30
         STX   $32
         BRA   L086A7E
L086A57  PHY
         TDC
         CLC
         ADC   #$0022
         PEA   $0000
         PHA
         LDY   #$00C0
         LDA   [$26],Y
         PHA
         DEY
         DEY
         LDA   [$26],Y
         PHA
         JSL   L15137F
         PLA
         LSR
         BCC   L086A7E
         LDA   #$001B
         LDX   #$0000
         STA   $30
         STX   $32
L086A7E  BRL   L086B73
L086A81  PEI   $28
         PEI   $26
         PEA   $0000
         PHD
         JSL   L086515
         BRL   L086B73
L086A90  LDY   #$00D2
         LDA   [$26],Y
         PHA
         LDY   #$0006
         LDA   #$0008
         ORA   [$22],Y
         ORA   $01,S
         PLX
         LDY   #$00D2
         STA   [$26],Y
         LDA   #$00B2
         CLC
         ADC   $26
         LDX   $28
         BCC   L086AB1
         INX
L086AB1  STA   $19
         STX   $1B
         PHY
         LDY   #$0008
         LDA   [$22],Y
         PHA
         PEA   $0000
         PEA   $0004
         JSL   L071A1B
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L086AD0
         DEX
L086AD0  STA   [$19]
         TXA
         LDY   #$0002
         STA   [$19],Y
         PEI   $28
         PEI   $26
         PEA   $0000
         PHD
         JSL   L086515
         BRL   L086B73
L086AE7  LDA   $22
         LDX   $24
         STA   $11
         STX   $13
         LDA   #$0014
         CLC
         ADC   $11
         LDX   $13
         BCC   L086AFA
         INX
L086AFA  STA   $30
         STX   $32
         BRA   L086B73
L086B00  LDA   $22
         LDX   $24
         STA   $11
         STX   $13
         LDY   #$001E
         LDA   [$11],Y
         TAX
         DEY
         DEY
         LDA   [$11],Y
         STA   $30
         STX   $32
         BRA   L086B73
L086B18  LDA   [$22]
         SEC
         SBC   #$000B
         BMI   L086B71
         CMP   #$0014
         BPL   L086B71
         SEC
         SBC   #$0000
         BEQ   L086B4C
         DEC
         DEC
         BEQ   L086B65
         SEC
         SBC   #$000A
         BEQ   L086B3D
         SEC
         SBC   #$0007
         BEQ   L086B55
         BRA   L086B71
L086B3D  LDY   #$00D2
         LDA   [$26],Y
         JSL   L150488
         STA   $30
         STX   $32
         BRA   L086B71
L086B4C  LDA   $22
         LDY   #$00D2
         STA   [$26],Y
         BRA   L086B71
L086B55  LDY   #$0006
         LDA   [$22],Y
         TAX
         DEY
         DEY
         LDA   [$22],Y
         STA   $30
         STX   $32
         BRA   L086B71
L086B65  LDA   #$00C8
         LDX   #$0280
         STA   $30
         STX   $32
         BRA   L086B71
L086B71  BRA   L086B73
L086B73  PEI   $17
         JSL   L071AA4
         LDA   $20
         STA   $2E
         LDA   $1F
         STA   $2D
         LDA   $1D
         TCD
         TSC
         CLC
         ADC   #$002C
         TCS
         RTL

L086B8B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         LDA   L0550D5
         LDX   L0550D7
         CLC
         ADC   #$00CE
         BCC   L086BA0
         INX
L086BA0  STA   $0F
         STX   $11
         LDA   #$0020
         AND   [$0F]
         BNE   L086BAD
         BRA   L086C21
L086BAD  LDA   L054FBB
         SEC
         SBC   #$0000
         BPL   L086BBE
         LDA   #$0001
         STA   L055131
         BRA   L086C21
L086BBE  LDA   L0550BB
         DEC
         STA   $09
         PEI   $09
         PEA   $0003
         JSL   L1500F5
         PLX
         PLX
         STA   $0B
         PEI   $09
         PEA   $0003
         JSL   L150318
         PLX
         PLX
         STA   $0D
         LDA   $0D
         PEA   $001C
         JSL   L150BEE
         PLA
         STA   $03
         LDA   $0B
         PEA   $000C
         JSL   L150BEE
         PLA
         STA   $01
         LDA   $0B
         BMI   L086C01
         BEQ   L086C01
         LDA   $01
         INC
         STA   $01
L086C01  LDA   #$001C
         CLC
         ADC   $03
         DEC
         DEC
         STA   $07
         LDA   #$000C
         CLC
         ADC   $01
         DEC
         STA   $05
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150383
L086C21  TSC
         CLC
         ADC   #$0012
         TCS
         PLD
         RTL

L086C29  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   L0550B3
         STZ   L0550AF
         STZ   L0550B1
         STZ   L0550AD
         STZ   L0550AB
         PEA   ^L0530A7
         PEA   L0530A7
         JSL   L08273B
         PLY
         PLY
         PLD
         RTL

L086C4E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         LDA   L055135
         BEQ   L086C5D
         BRA   L086C83
L086C5D  LDA   L055115
         LDX   L055117
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L055109
         LDX   L05510B
         PHX
         PHA
         PEA   ^L053117
         PEA   L053117
         JSL   L083523
         LDA   #$0001
         STA   L055135
L086C83  TSC
         CLC
         ADC   #$0020
         TCS
         PLD
         RTL

L086C8B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PEI   $10
         PEI   $0E
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
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
         JSL   L150B34
         PEI   $03
         PEI   $01
         JSL   L151131
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

L086CDB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $18
         PEI   $16
         PEA   $0008
         JSL   L0313BE
         LDA   $03
         ASL
         STA   $03
         LDA   $07
         ASL
         STA   $07
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L086C8B
         LDA   $14
         STA   $18
         LDA   $13
         STA   $17
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L086D20  ENT
         PHD
         TSC
         CLC
         ADC   #$FFB4
         TCS
         TCD
         LDA   #$FFFF
         TAX
         STA   $5A
         STX   $5C
         PHY
         JSL   L073CDF
         PLA
         STA   $47
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         JSL   L082712
         LDA   $56
         ORA   $58
         BNE   L086D5A
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         JSL   L08273B
         BRA   L086D77
L086D5A  LDA   #$FFFF
         TAX
         CMP   $56
         BNE   L086D64
         CPX   $58
L086D64  BEQ   L086D77
         PEI   $58
         PEI   $56
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         JSL   L08295E
L086D77  TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         JSL   L082712
         PEI   $54
         PEI   $52
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         JSL   L082766
         PHY
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         JSL   L081A64
         PLA
         LSR
         BCC   L086DC0
         PHY
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         JSL   L081A64
         PLA
         LSR
         BCC   L086DC0
         STZ   $5A
         STZ   $5C
         BRL   L087200
L086DC0  STZ   $2B
         STZ   $2D
         LDA   #$FFFF
         TAX
         CMP   $56
         BNE   L086DCE
         CPX   $58
L086DCE  BNE   L086DD3
         BRL   L086EA1
L086DD3  PHY
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         JSL   L081A64
         PLA
         LSR
         BCC   L086DE8
         BRL   L086EA1
L086DE8  PHY
         LDA   $39
         SEC
         SBC   $35
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L086E00
         DEX
L086E00  STA   $0F
         STX   $11
         PEI   $11
         PEI   $0F
         LDA   $37
         SEC
         SBC   $33
         JSL   L150488
         JSL   L150D50
         PLA
         STA   $0F
         PLX
         STX   $11
         PEA   $0000
         PEA   $FA00
         PHY
         PHY
         PEI   $58
         PEI   $56
         JSL   L08063C
         PLA
         PLX
         JSL   L1512A5
         STA   $0B
         STX   $0D
         PEI   $0D
         PEI   $0B
         LDA   $0F
         LDX   $11
         JSL   L033477
         BEQ   L086E51
         BVS   L086E48
         EOR   #$8000
L086E48  BPL   L086E51
         PEA   $2707
         JSL   L07272E
L086E51  PEI   $0D
         PEI   $0B
         LDA   $0F
         LDX   $11
         JSL   L033477
         BVS   L086E62
         EOR   #$8000
L086E62  BMI   L086EA1
         LDA   #$0007
         CLC
         ADC   $39
         LSR
         LSR
         LSR
         PHA
         LDA   $35
         LSR
         LSR
         LSR
         STA   $49
         PLA
         SEC
         SBC   $49
         ASL
         INC
         JSL   L150488
         STA   $23
         STX   $25
         PEI   $25
         PEI   $23
         LDA   $37
         SEC
         SBC   $33
         JSL   L150488
         JSL   L150D50
         PLA
         PLX
         CLC
         ADC   #$0080
         BCC   L086E9D
         INX
L086E9D  STA   $2B
         STX   $2D
L086EA1  STZ   $2F
         STZ   $31
         PHY
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         JSL   L081A64
         PLA
         LSR
         BCC   L086EBA
         BRL   L086F69
L086EBA  PHY
         LDA   $41
         SEC
         SBC   $3D
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L086ED2
         DEX
L086ED2  STA   $0F
         STX   $11
         PEI   $11
         PEI   $0F
         LDA   $3F
         SEC
         SBC   $3B
         JSL   L150488
         JSL   L150D50
         PLA
         STA   $0F
         PLX
         STX   $11
         PHY
         PHY
         PEI   $54
         PEI   $52
         JSL   L08063C
         PLA
         STA   $0B
         PLX
         STX   $0D
         PEI   $0D
         PEI   $0B
         LDA   $0F
         LDX   $11
         JSL   L033477
         BEQ   L086F19
         BVS   L086F10
         EOR   #$8000
L086F10  BPL   L086F19
         PEA   $2708
         JSL   L07272E
L086F19  PEI   $0D
         PEI   $0B
         LDA   $0F
         LDX   $11
         JSL   L033477
         BVS   L086F2A
         EOR   #$8000
L086F2A  BMI   L086F69
         LDA   #$0007
         CLC
         ADC   $41
         LSR
         LSR
         LSR
         PHA
         LDA   $3D
         LSR
         LSR
         LSR
         STA   $49
         PLA
         SEC
         SBC   $49
         ASL
         INC
         JSL   L150488
         STA   $27
         STX   $29
         PEI   $29
         PEI   $27
         LDA   $3F
         SEC
         SBC   $3B
         JSL   L150488
         JSL   L150D50
         PLA
         PLX
         CLC
         ADC   #$0080
         BCC   L086F65
         INX
L086F65  STA   $2F
         STX   $31
L086F69  STZ   $05
         LDA   $2B
         LDX   $2D
         CLC
         ADC   #$003C
         BCC   L086F76
         INX
L086F76  PEI   $31
         PEI   $2F
         JSL   L150F53
         STA   $13
         STX   $15
         PHY
         PHY
         PEI   $15
         PEI   $13
         LDA   L0550A5
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $43
         PLX
         STX   $45
         LDAL  L05565D
         BEQ   L087002
         LDA   $2B
         ORA   $2D
         BNE   L086FAE
         BRL   L087200
L086FAE  PHY
         PHY
         JSL   L15042E
         PLA
         STA   $13
         PLX
         STX   $15
         PEI   $15
         PEI   $13
         LDA   $2B
         LDX   $2D
         CLC
         ADC   #$003C
         BCC   L086FC9
         INX
L086FC9  JSL   L033477
         BVS   L086FD2
         EOR   #$8000
L086FD2  BMI   L086FD7
         BRL   L087200
L086FD7  PHY
         PHY
         PEI   $15
         PEI   $13
         LDA   L0550A5
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $43
         PLX
         STX   $45
         LDAL  L05565D
         BEQ   L086FFD
         BRL   L087200
L086FFD  LDA   #$0001
         STA   $05
L087002  STZ   $1B
         STZ   $1D
         PEI   $2D
         PEI   $2B
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L087063
         BEQ   L087063
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         CLC
         ADC   #$003C
         BCC   L087025
         INX
L087025  STA   $07
         STX   $09
         PEI   $58
         PEI   $56
         PEI   $09
         PEI   $07
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$001B
         PEA   $0000
         PHA
         JSL   L082098
         PEI   $1D
         PEI   $1B
         LDA   $2B
         LDX   $2D
         JSL   L033477
         BEQ   L087063
         BVS   L08705A
         EOR   #$8000
L08705A  BPL   L087063
         PEA   $08B7
         JSL   L07272E
L087063  LDA   $05
         BEQ   L0870A4
         LDX   #$0000
         LDA   $31
         BMI   L087073
         ORA   $2F
         BEQ   L087073
         INX
L087073  TXA
         BEQ   L0870A4
         LDA   $1B
         LDX   $1D
         CLC
         ADC   #$003C
         BCC   L087081
         INX
L087081  PEI   $31
         PEI   $2F
         JSL   L150F53
         PHX
         PHA
         PEI   $45
         PEI   $43
         JSL   L1512FB
         LDAL  L05565D
         BEQ   L0870A4
         PEI   $45
         PEI   $43
         JSL   L07185A
         BRL   L087200
L0870A4  STZ   $1F
         STZ   $21
         PEI   $31
         PEI   $2F
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L08710D
         BEQ   L08710D
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         CLC
         ADC   #$003C
         BCC   L0870C7
         INX
L0870C7  PEI   $1D
         PEI   $1B
         JSL   L150F53
         STA   $07
         STX   $09
         PEI   $54
         PEI   $52
         PEI   $09
         PEI   $07
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         JSL   L082098
         PEI   $21
         PEI   $1F
         LDA   $2F
         LDX   $31
         JSL   L033477
         BEQ   L08710D
         BVS   L087104
         EOR   #$8000
L087104  BPL   L08710D
         PEA   $08B8
         JSL   L07272E
L08710D  PHY
         PHY
         LDA   $1B
         LDX   $1D
         CLC
         ADC   #$003C
         BCC   L08711A
         INX
L08711A  PEI   $21
         PEI   $1F
         JSL   L150F53
         PHX
         PHA
         JSL   L07704E
         PLA
         STA   $17
         PLX
         STX   $19
         PEI   $19
         PEI   $17
         PEI   $45
         PEI   $43
         JSL   L1512FB
         LDY   #$0002
         LDA   [$43],Y
         PHA
         LDA   [$43]
         PHA
         PEA   $0000
         PEA   $003C
         JSL   L071EC5
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $01
         STX   $03
         LDA   $17
         LDX   $19
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
         LDA   #$4D42
         LDX   #$5041
         LDY   #$0004
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0004
         LDY   #$0010
         STA   [$01],Y
         LDY   #$0013
         SEP   #$20
         LDA   #$02
         STA   [$01],Y
         REP   #$20
         LDA   #$0014
         CLC
         ADC   $01
         LDX   $03
         BCC   L087193
         INX
L087193  PHX
         PHA
         PEA   ^L053259
         PEA   L053259
         PEA   $0008
         JSL   L0313BE
         LDA   #$001C
         CLC
         ADC   $01
         LDX   $03
         BCC   L0871AD
         INX
L0871AD  PHX
         PHA
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0024
         CLC
         ADC   $01
         LDX   $03
         BCC   L0871CA
         INX
L0871CA  PHX
         PHA
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $1B
         LDX   $1D
         LDY   #$0034
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   $1F
         LDX   $21
         LDY   #$0038
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   $43
         LDX   $45
         STA   $5A
         STX   $5C
L087200  PEI   $47
         JSL   L0724F7
         LDA   $50
         STA   $58
         LDA   $4F
         STA   $57
         LDA   $4D
         TCD
         TSC
         CLC
         ADC   #$0056
         TCS
         RTL

L087218  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $10
         PEI   $0E
         JSL   L081C53
         LDA   L0550A7
         LDX   L0550A9
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         PEA   $0000
         PEI   $0C
         PEI   $0A
         JSL   L15047C
         PEA   $0002
         LDA   L0550A7
         LDX   L0550A9
         PHX
         PHA
         JSL   L150D44
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

L087268  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055145
         BEQ   L087282
         PEA   $0000
         PEA   $000C
         PEA   $FFFF
         JSL   L08736A
L087282  LDA   L054FBB
         SEC
         SBC   #$0000
         BMI   L087294
         JSL   L15148A
         STZ   L055143
         BRA   L08729A
L087294  LDA   #$0001
         STA   L055143
L08729A  LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         PLY
         PLY
         PLD
         RTL

L0872AA  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   L055097
         STZ   L055099
         STZ   L055095
         LDA   L055145
         BEQ   L0872CD
         PEA   $0000
         PEA   $000C
         PEA   $FFFF
         JSL   L08736A
L0872CD  JSL   L150711
         LDA   L0550BD
         BEQ   L0872E6
         PEA   ^L0530AF
         PEA   L0530AF
         PEI   $10
         PEI   $0E
         JSL   L084978
         BRA   L087323
L0872E6  LDA   L0550BF
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L0872F6
         EOR   #$8000
L0872F6  BPL   L087323
         LDA   #$0001
         STA   $03
L0872FD  LDA   $03
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L0530B7
         LDX   #^L0530B7
         BCC   L08730F
         INX
L08730F  PHX
         PHA
         PEI   $10
         PEI   $0E
         JSL   L084978
         LDA   $03
         CMP   $01
         BEQ   L087323
         INC   $03
         BRA   L0872FD
L087323  LDA   L055099
         BNE   L08734B
         PHY
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081A64
         PLA
         LSR
         BCS   L087341
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L085216
L087341  PEA   ^L053259
         PEA   L053259
         JSL   L087BAE
L08734B  JSL   L151466
         LDA   L055097
         BNE   L087358
         JSL   L083E9E
L087358  LDA   $0C
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

L08736A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $16
         STA   $03
         LDA   $14
         STA   $01
         LDA   $01
         SEC
         SBC   $03
         BVS   L087384
         EOR   #$8000
L087384  BPL   L0873C5
         LDA   $03
         STA   $07
L08738A  PHY
         PEI   $07
         JSL   L151693
         PLA
         STA   $05
         LDA   $12
         BMI   L0873A8
         PEI   $07
         LDA   #$00F0
         AND   $05
         ORA   $12
         PHA
         JSL   L1511C2
         BRA   L0873BB
L0873A8  LDA   #$00FF
         AND   $05
         CMP   #$0080
         BNE   L0873BB
         PEI   $07
         PEA   $0081
         JSL   L1511C2
L0873BB  LDA   $07
         CMP   $01
         BEQ   L0873C5
         INC   $07
         BRA   L08738A
L0873C5  LDA   $10
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

L0873D7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         PHY
         PEI   $18
         PEA   $0000
         JSL   L072FA6
         PLA
         STA   $18
         LDA   #L052F67
         LDX   #^L052F67
         STA   $09
         STX   $0B
         LDA   $09
         LDX   $0B
         STA   $05
         STX   $07
         LDY   #$000E
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $01
         STX   $03
         LDA   #$0001
         STA   $0D
L087411  LDX   #$0000
         LDY   #$0008
         LDA   $1A
         CMP   [$09],Y
         BNE   L08741E
         INX
L08741E  TXA
         BEQ   L08743F
         PHA
         LDA   L055027
         LDX   L055029
         CMP   [$09]
         BNE   L087432
         LDY   #$0002
         TXA
         CMP   [$09],Y
L087432  BEQ   L087439
         LDA   #$0000
         BRA   L08743C
L087439  LDA   #$0001
L08743C  AND   $01,S
         PLX
L08743F  CMP   #$0000
         BEQ   L08749E
         LDY   #$0006
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         CMP   L055039
         BNE   L087456
         CPX   L05503B
L087456  BEQ   L08745D
         LDA   #$0000
         BRA   L087460
L08745D  LDA   #$0001
L087460  BEQ   L08749E
         LDA   $18
         BNE   L087476
         PEI   $0B
         PEI   $09
         PEA   $0000
         PEA   $0010
         JSL   L071EC5
         BRA   L087499
L087476  LDA   $18
         LDY   #$000A
         STA   [$09],Y
         LDA   L054FB7
         LDX   L054FB9
         STA   $0F
         STX   $11
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         LDY   #$000C
         STA   [$09],Y
         INY
         INY
         TXA
         STA   [$09],Y
L087499  BRL   L087535
         BRA   L0874CE
L08749E  LDY   #$000E
         LDA   [$09],Y
         PHA
         DEY
         DEY
         LDA   [$09],Y
         PHA
         LDA   $01
         LDX   $03
         JSL   L033477
         BVS   L0874B6
         EOR   #$8000
L0874B6  BMI   L0874CE
         LDA   $09
         LDX   $0B
         STA   $05
         STX   $07
         LDY   #$000E
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $01
         STX   $03
L0874CE  LDA   $09
         LDX   $0B
         CLC
         ADC   #$0010
         BCC   L0874D9
         INX
L0874D9  STA   $09
         STX   $0B
         LDA   #$0014
         CMP   $0D
         BEQ   L0874E9
         INC   $0D
         BRL   L087411
L0874E9  LDA   $18
         BEQ   L087535
         LDA   $1A
         LDY   #$0008
         STA   [$05],Y
         LDA   L055027
         LDX   L055029
         STA   [$05]
         TXA
         LDY   #$0002
         STA   [$05],Y
         LDA   L055039
         LDX   L05503B
         LDY   #$0004
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         LDA   $18
         LDY   #$000A
         STA   [$05],Y
         LDA   L054FB7
         LDX   L054FB9
         STA   $0F
         STX   $11
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         LDY   #$000C
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
L087535  LDA   $16
         STA   $1A
         LDA   $15
         STA   $19
         LDA   $13
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L087547  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDAL  L052E95
         TAX
         LDAL  L052E93
         CMP   $0E
         BNE   L08755E
         CPX   $10
L08755E  BNE   L087562
         BRA   L0875B2
L087562  PEI   $10
         PEI   $0E
         PEA   $0000
         JSL   L151663
         PEA   $0000
         PEA   $0000
         JSL   L1510C5
         STZ   $03
L087579  PHY
         PEI   $03
         JSL   L151089
         PLA
         STA   $01
         LDX   $03
         LDA   $01
         SEP   #$20
         STAL  L052D92,X
         REP   #$20
         LDA   #$00FF
         CMP   $03
         BEQ   L08759A
         INC   $03
         BRA   L087579
L08759A  PEI   $10
         PEI   $0E
         PEA   $0010
         JSL   L150BC4
         LDA   $0E
         LDX   $10
         STAL  L052E93
         TXA
         STAL  L052E95
L0875B2  LDA   $0C
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

L0875C4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0550B3
         BEQ   L0875F6
         LDA   L054FBB
         BNE   L0875F6
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PEA   ^L0530A7
         PEA   L0530A7
         JSL   L151418
L0875F6  PLY
         PLY
         PLD
         RTL

L0875FA  ENT
         PHD
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
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   $0008
         JSL   L0313BE
         PHY
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081A64
         PLA
         LSR
         BCS   L08763E
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L085216
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L087BAE
L08763E  JSL   L083E9E
         PEA   ^L05311F
         PEA   L05311F
         PEA   ^L053127
         PEA   L053127
         PEA   $0008
         JSL   L0313BE
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L08765D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L151663
         PEA   $0000
         JSL   L1516ED
         PLY
         PLY
         PLD
         RTL

L08767D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         PEA   ^L0532BD
         PEA   L0532BD
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$001C
         BCC   L087698
         INX
L087698  STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         CLC
         ADC   #$0002
         BCC   L0876B7

*

         INX
L0876B7  PHX
         PHA
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L081E5F
         PHY
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081A64
         PLA
         LSR
         BCS   L0876DF
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L085216
L0876DF  TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L087BAE
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L0876F4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC6
         TCS
         TCD
         LDA   L055027
         LDX   L055029
         CMP   $44
         BNE   L087708
         CPX   $46
L087708  BEQ   L08771B
         LDA   L05501F
         LDX   L055021
         CMP   $44
         BNE   L087716
         CPX   $46
L087716  BEQ   L08771B
         BRL   L087886
L08771B  PHY
         PEI   $46
         PEI   $44
         PEI   $42
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCS   L087736
         BRL   L087886
L087736  TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $33
         PLX
         STX   $35
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         LDA   L0550B9
         DEC
         BNE   L08779F
         LDA   L055027
         LDX   L055029
         CMP   $44
         BNE   L087771
         CPX   $46
L087771  BEQ   L087778
         LDA   #$0000
         BRA   L08777B
L087778  LDA   #$0001
L08777B  ORA   L055153
         BEQ   L087789
         LDA   #$0001
         STAL  L0552BF
         BRA   L087790
L087789  LDA   #$0001
         STAL  L0552C1
L087790  LDA   L054FBB
         BNE   L08779C
         PEA   $0000
         JSL   L1601A8
L08779C  BRL   L08787E
L08779F  LDA   L054FBB
         BEQ   L0877A7
         BRL   L08787E
L0877A7  PEA   $0001
         JSL   L09091E
         LDA   L05511F
         BEQ   L0877BA
         PEA   $0000
         JSL   L09091E
L0877BA  PHY
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081A64
         PLA
         LSR
         BCS   L0877CB
         STZ   $40
L0877CB  TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$002B
         PEA   $0000
         PHA
         JSL   L0808E0
         LDA   L055027
         LDX   L055029
         CMP   $44
         BNE   L0877ED
         CPX   $46
L0877ED  BEQ   L0877F4
         LDA   #$0000
         BRA   L0877F7
L0877F4  LDA   #$0001
L0877F7  AND   $40
         BEQ   L08785C
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $37
         STX   $39
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         CLC
         ADC   #$0002
         BCC   L087817
         INX
L087817  PHX
         PHA
         TDC
         CLC
         ADC   #$002B
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PEI   $42
         PEA   $0005
         PEA   $0000
         PEA   $0000
         JSL   L081517
         LDAL  L05314D
         TAX
         LDAL  L05314B
         STA   $37
         STX   $39
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         CLC
         ADC   #$0002
         BCC   L087854
         INX
L087854  PHX
         PHA
         JSL   L082712
         BRA   L087869
L08785C  TDC
         CLC
         ADC   #$002B
         PEA   $0000
         PHA
         JSL   L085216
L087869  LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         TDC
         CLC
         ADC   #$002B
         PEA   $0000
         PHA
         JSL   L083985
L08787E  PEI   $35
         PEI   $33
         JSL   L151131
L087886  LDA   $3E
         STA   $46
         LDA   $3D
         STA   $45
         LDA   $3B
         TCD
         TSC
         CLC
         ADC   #$0044
         TCS
         RTL

L087898  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L0531E9
         PEA   L0531E9
         JSL   L1506A7
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $006E
         PEA   $0023
         JSL   L15100B
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L15123D
         JSL   L1510A1
         PEA   $0002
         PEA   $0001
         JSL   L151083
         LDA   #$0001
         STA   $13
L0878ED  LDA   $13
         PEA   $001C
         JSL   L150BEE
         PLA
         DEC
         DEC
         PHA
         PEA   $0000
         JSL   L1510C5
         LDA   $13
         DEC
         DEC
         BNE   L087913
         PEA   $0000
         PEA   $0016
         JSL   L15056E
         BRA   L08791D
L087913  PEA   $0000
         PEA   $0022
         JSL   L15056E
L08791D  LDA   #$0003
         CMP   $13
         BEQ   L087928
         INC   $13
         BRA   L0878ED
L087928  LDA   #$0001
         STA   $15
L08792D  PEA   $0000
         LDA   $15
         PEA   $000C
         JSL   L150BEE
         PLA
         DEC
         PHA
         JSL   L1510C5
         PEA   $006C
         PEA   $0000
         JSL   L15056E
         LDA   #$0002
         CMP   $15
         BEQ   L087955
         INC   $15
         BRA   L08792D
L087955  LDA   #$0001
         STA   $15
         LDA   #$0019
         STA   $0D
         STZ   $0F
L087961  LDA   #$0002
         STA   $13
         STZ   $11
L087968  LDA   $0D
         INC
         STA   $0D
         PHY
         PHY
         PEI   $0D
         JSL   L085FE9
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L08798D
         PEI   $03
         PEI   $01
         PEI   $13
         PEI   $15
         JSL   L087218
L08798D  LDA   #$001C
         CLC
         ADC   $13
         STA   $13
         LDA   #$0003
         CMP   $11
         BEQ   L0879A0
         INC   $11
         BRA   L087968
L0879A0  LDA   #$000C
         CLC
         ADC   $15
         STA   $15
         LDA   #$0002
         CMP   $0F
         BEQ   L0879B3
         INC   $0F
         BRA   L087961
L0879B3  PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         TSC
         CLC
         ADC   #$001A
         TCS
         PLD
         RTL

L0879C5  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L055121
         ORA   L055123
         BEQ   L087A2B
         LDA   #$000F
         ANDL  L053299
         CMP   #$0007
         BNE   L087A2B
         LDAL  L05328D
         STA   $01
         LDA   L055027
         LDX   L055029
         CMP   L055129
         BNE   L0879F5
         CPX   L05512B
L0879F5  BNE   L0879FF
         LDA   $01
         EOR   #$FFFF
         INC
         STA   $01
L0879FF  PEI   $01
         LDA   L055121
         LDX   L055123
         STA   $03
         STX   $05
         LDY   #$0002
         LDA   [$03],Y
         TAX
         LDA   [$03]
         CLC
         ADC   #$0096
         BCC   L087A1A
         INX
L087A1A  STA   $03
         STX   $05
         LDY   #$0002
         LDA   [$03],Y
         TAX
         LDA   [$03]
         PHA
         JSL   L0873D7
L087A2B  PLY
         PLY
         PLY
         PLD
         RTL

L087A30  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L0531F9
         PEA   L0531F9
         JSL   L1506A7
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0052
         PEA   $0048
         JSL   L15100B
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L15123D
         JSL   L1510A1
         PEA   $0002
         PEA   $0001
         JSL   L151083
         LDA   #$0001
         STA   $11
L087A85  LDA   $11
         PEA   $001C
         JSL   L150BEE
         PLA
         DEC
         DEC
         PHA
         PEA   $0000
         JSL   L1510C5
         PEA   $0000
         PEA   $0047
         JSL   L15056E
         LDA   #$0002
         CMP   $11
         BEQ   L087AAE
         INC   $11
         BRA   L087A85
L087AAE  PEA   $0002
         PEA   $0002
         JSL   L151083
         LDA   #$0001
         STA   $13
L087ABD  PEA   $0000
         LDA   $13
         PEA   $000C
         JSL   L150BEE
         PLA
         DEC
         PHA
         JSL   L1510C5
         LDA   $13
         SEC
         SBC   #$0001
         BEQ   L087AE9
         BVS   L087ADD
         EOR   #$8000
L087ADD  BPL   L087AE9
         PEA   $0000
         PEA   $0001
         JSL   L150635
L087AE9  PEA   $0050
         PEA   $0000
         JSL   L15056E
         PEA   $0002
         PEA   $0001
         JSL   L151083
         LDA   #$0005
         CMP   $13
         BEQ   L087B08
         INC   $13
         BRA   L087ABD
L087B08  LDA   #$0001
         STA   $13
         LDA   #$0001
         STA   $0B
         STZ   $0D
L087B14  LDA   #$0002
         STA   $11
         STZ   $0F
L087B1B  LDA   #$FFFF
         CLC
         ADC   $0B
         STA   $09
         LDA   $0D
         SEC
         SBC   #$0002
         BEQ   L087B32
         BVS   L087B30
         EOR   #$8000
L087B30  BMI   L087B37
L087B32  LDA   #$0000
         BRA   L087B3A
L087B37  LDA   #$0001
L087B3A  AND   L0550B7
         PHA
         LDX   #$0000
         LDA   $0F
         BMI   L087B48
         BEQ   L087B48
         INX
L087B48  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L087B57
         LDA   #$0008
         CLC
         ADC   $09
         STA   $09
L087B57  PHY
         PHY
         PEI   $09
         JSL   L085FE9
         PEI   $11
         PEI   $13
         JSL   L087218
         LDA   #$001C
         CLC
         ADC   $11
         STA   $11
         LDA   $0B
         INC
         STA   $0B
         LDA   #$0002
         CMP   $0F
         BEQ   L087B7F
         INC   $0F
         BRA   L087B1B
L087B7F  LDA   #$000C
         CLC
         ADC   $13
         STA   $13
         LDA   $0D
         BNE   L087B90
         LDA   $13
         INC
         STA   $13
L087B90  LDA   #$0005
         CMP   $0D
         BEQ   L087B9C
         INC   $0D
         BRL   L087B14
L087B9C  PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         TSC
         CLC
         ADC   #$0018
         TCS
         PLD
         RTL

L087BAE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         LDA   L054FBB
         SEC
         SBC   #$0000
         BMI   L087C14
         TDC
         CLC
         ADC   #$0001
         STA   $09
         STZ   $0B
         PEA   ^L053127
         PEA   L053127
         PEA   ^L05311F
         PEA   L05311F
         PEI   $0B
         PEI   $09
         JSL   L081E5F
         PHY
         PEI   $1C
         PEI   $1A
         PEI   $0B
         PEI   $09
         PEI   $0B
         PEI   $09
         JSL   L150B3A
         PLA
         LSR
         BCC   L087C14
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $0B
         PEI   $09
         JSL   L083985
         PEA   ^L05311F
         PEA   L05311F
         PEA   ^L053127
         PEA   L053127
         PEA   $0008
         JSL   L0313BE
L087C14  LDA   $18
         STA   $1C
         LDA   $17
         STA   $1B
         LDA   $15
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L087C26  PHD
         TSC
         CLC
         ADC   #$FF88
         TCS
         TCD
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEI   $88
         PEI   $86
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $84
         PEI   $82
         PEA   $0008
         JSL   L0313BE
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $59
         PLX
         STX   $5B
         PHY
         PHY
         JSL   L151293
         JSL   L151131
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L15119E
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         JSL   L15107D
         PHY
         JSL   L150BDC
         PLA
         STA   $71
         PEA   $0002
         JSL   L150BD6
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PEA   $3333
         JSL   L081DD8
         LDA   $80
         BEQ   L087CD0
         PHY
         PHY
         PEA   $0005
         PEA   $0003
         JSL   L15133D
         PLA
         STA   $6D
         PLX
         STX   $6F
         PHY
         PHY
         PEA   $01D3
         PEA   $2710
         JSL   L15133D
         PLA
         STA   $69
         PLX
         STX   $6B
         BRA   L087CF4
L087CD0  PHY
         PHY
         PEA   $0003
         PEA   $0005
         JSL   L15133D
         PLA
         STA   $6D
         PLX
         STX   $6F
         PHY
         PHY
         PEA   $0000
         PEA   $0001
         JSL   L1512F5
         PLA
         STA   $69
         PLX
         STX   $6B
L087CF4  TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         JSL   L08273B
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         JSL   L08273B
         LDA   #$0001
         STA   $73
L087D13  PHY
         PHY
         PEA   $0000
         PEA   $0001
         JSL   L1512F5
         LDA   $69
         LDX   $6B
         JSL   L1512A5
         STA   $65
         STX   $67
         PHY
         PHY
         PEI   $6B
         PEI   $69
         PHY
         PHY
         LDA   $01
         JSL   L150488
         PHX
         PHA
         JSL   L1512F5
         JSL   L15036B
         PLA
         STA   $61
         PLX
         STX   $63
         PHY
         PHY
         PEI   $67
         PEI   $65
         PHY
         PHY
         LDA   $09
         JSL   L150488
         PHX
         PHA
         JSL   L1512F5
         JSL   L15036B
         PLA
         STA   $5D
         PLX
         STX   $5F
         PHY
         LDA   $61
         LDX   $63
         PEI   $5F
         PEI   $5D
         JSL   L150F53
         PHX
         PHA
         JSL   L1500DD
         PLA
         STA   $35
         PHY
         PHY
         PEI   $6B
         PEI   $69
         PHY
         PHY
         LDA   $03
         JSL   L150488
         PHX
         PHA
         JSL   L1512F5
         JSL   L15036B
         PLA
         STA   $61
         PLX
         STX   $63
         PHY
         PHY
         PEI   $67
         PEI   $65
         PHY
         PHY
         LDA   $0B
         JSL   L150488
         PHX
         PHA
         JSL   L1512F5
         JSL   L15036B
         PLA
         STA   $5D
         PLX
         STX   $5F
         PHY
         LDA   $61
         LDX   $63
         PEI   $5F
         PEI   $5D
         JSL   L150F53
         PHX
         PHA
         JSL   L1500DD
         PLA
         STA   $37
         PHY
         PHY
         PEI   $6B
         PEI   $69
         PHY
         PHY
         LDA   $05
         JSL   L150488
         PHX
         PHA
         JSL   L1512F5
         JSL   L15036B
         PLA
         STA   $61
         PLX
         STX   $63
         PHY
         PHY
         PEI   $67
         PEI   $65
         PHY
         PHY
         LDA   $0D
         JSL   L150488
         PHX
         PHA
         JSL   L1512F5
         JSL   L15036B
         PLA
         STA   $5D
         PLX
         STX   $5F
         PHY
         LDA   $61
         LDX   $63
         PEI   $5F
         PEI   $5D
         JSL   L150F53
         PHX
         PHA
         JSL   L1500DD
         PLA
         STA   $39
         PHY
         PHY
         PEI   $6B
         PEI   $69
         PHY
         PHY
         LDA   $07
         JSL   L150488
         PHX
         PHA
         JSL   L1512F5
         JSL   L15036B
         PLA
         STA   $61
         PLX
         STX   $63
         PHY
         PHY
         PEI   $67
         PEI   $65
         PHY
         PHY
         LDA   $0F
         JSL   L150488
         PHX
         PHA
         JSL   L1512F5
         JSL   L15036B
         PLA
         STA   $5D
         PLX
         STX   $5F
         PHY
         LDA   $61
         LDX   $63
         PEI   $5F
         PEI   $5D
         JSL   L150F53
         PHX
         PHA
         JSL   L1500DD
         PLA
         STA   $3B
         PHY
         PHY
         PEI   $6B
         PEI   $69
         PEI   $6F
         PEI   $6D
         JSL   L15036B
         PLA
         STA   $69
         PLX
         STX   $6B
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         JSL   L151418
         PHY
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         JSL   L081A64
         PLA
         LSR
         BCS   L087EB3
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         JSL   L151418
L087EB3  TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
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
         LDA   $7E
         JSL   L150488
         JSL   L150F53
         STA   $11
         STX   $13
L087F20  PEI   $13
         PEI   $11
         LDA   L054FB7
         LDX   L054FB9
         STA   $75
         STX   $77
         LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         JSL   L033477
         BEQ   L087F43
         BVS   L087F41
         EOR   #$8000
L087F41  BMI   L087F20
L087F43  LDA   #$0006
         CMP   $73
         BEQ   L087F4F
         INC   $73
         BRL   L087D13
L087F4F  TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$003D
         PEA   $0000
         PHA
         JSL   L151418
         PEI   $71
         JSL   L150BD6
         PEI   $57
         PEI   $55
         JSL   L151083
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L151198
         PEI   $5B
         PEI   $59
         JSL   L151131
         LDA   $7C
         STA   $88
         LDA   $7B
         STA   $87
         LDA   $79
         TCD
         TSC
         CLC
         ADC   #$0086
         TCS
         RTL


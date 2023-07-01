*
* HypercardGS
* segment: $0B HyperTalk
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HyperTalk.l
         lst   off

*---------------------------------------

         use   HyperTalk.E
         use   HyperTalk.X

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

L0B0000  ENT
         PHD
         TSC
         SEC
         SBC   #$000C
         TCD
         TCS
         LDA   L051BDE
         DEC
         DEC
         BNE   L0B0015
         LDA   L051BE0
         DEC
         BEQ   L0B0068
L0B0015  LDA   L0553B5
         STA   $01
         LDA   L0553B7
         STA   $03
         LDY   #$0008
         LDA   [$01],Y
         INC
         STA   [$01],Y
         LDY   #$000A
         CMP   [$01],Y
         BCC   L0B0030
         STA   [$01],Y
L0B0030  DEC
         ASL
         ASL
         ASL
         TAX
         LDY   #$0004
         LDA   [$01],Y
         STA   $05
         INY
         INY
         LDA   [$01],Y
         STA   $07
         LDY   #$0002
         LDA   [$05]
         STA   $09
         LDA   [$05],Y
         STA   $0B
         TXY
         LDA   [$09],Y
         STA   L051BDE
         INY
         INY
         LDA   [$09],Y
         STA   L051BE0
         INY
         INY
         LDA   [$09],Y
         STA   L051BE2
         INY
         INY
         LDA   [$09],Y
         STA   L051BE4
L0B0068  TDC
         TCS
         PLY
         PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0B0072  ENT
         PHD
         TSC
         SEC
         SBC   #$0040
         TCD
         TCS
         STZ   $46
         PHA
         PHA
         JSL   L0B3773
         PLA
         PLX
         CMP   #$0000
         BNE   L0B008C
         BRL   L0B00A6
L0B008C  CMP   #$0011
         BNE   L0B0094
         BRL   L0B0159
L0B0094  CMP   #$0012
         BNE   L0B009B
         INC   $46
L0B009B  LDX   $41
         TDC
         CLC
         ADC   #$0042
         TCS
         TXA
         TCD
         RTL

L0B00A6  PHA
         PHA
         PEA   $0000
         JSL   L031415
         PLA
         STA   $05
         PLA
         STA   $07
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L032589
         TDC
         CLC
         ADC   #$0022
         STA   $09
         STZ   $0B
         STZ   $01
L0B00CD  LDA   #$00FF
         AND   [$05]
         CMP   #$002D
         BEQ   L0B00E1
         CMP   #$0030
         BCC   L0B010C
         CMP   #$003A
         BCS   L0B010C
L0B00E1  LDA   $01
         INC
         STA   $01
         CMP   #$000A
         BCC   L0B00EE
         BRL   L0B0156
L0B00EE  SEP   #$20
         LDA   [$05]
         STA   [$09]
         REP   #$20
         INC   $09
         BCC   L0B0100
         INC   $0A
         BCC   L0B0100
         INC   $0B
L0B0100  INC   $05
         BCC   L0B00CD
         INC   $06
         BCC   L0B00CD
         INC   $07
         BRA   L0B00CD
L0B010C  CMP   #$0020
         BEQ   L0B011E
         CMP   #$000D
         BEQ   L0B011E
         CMP   #$0000
         BEQ   L0B011E
         BRL   L0B009B
L0B011E  LDA   $01
         BEQ   L0B0156
         SEP   #$20
         STA   $21
         REP   #$20
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L032589
         LDA   #$00FF
         AND   [$05]
         BNE   L0B0156
         INC
         STA   $46
         JSL   L0E0000
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$0021
         PHA
         JSL   L071DE3
         JSL   L0E0DE2
L0B0156  BRL   L0B009B
L0B0159  TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L0E04A7
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDA   $0D
         STA   $17
         LDA   $0F
         STA   $19
         LDA   $11
         STA   $1B
         LDA   $13
         STA   $1D
         LDA   $15
         STA   $1F
         PEA   $0014
         _SANEFP816
         LDA   $0D
         CMP   $17
         BNE   L0B01C3
         LDA   $0F
         CMP   $19
         BNE   L0B01C3
         LDA   $11
         CMP   $1B
         BNE   L0B01C3
         LDA   $13
         CMP   $1D
         BNE   L0B01C3
         LDA   $15
         CMP   $1F
         BNE   L0B01C3
         INC   $46
         PHA
         PHA
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L150082
         JSL   L0E0DE2
         BRL   L0B009B
L0B01C3  TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         JSL   L0E0C71
         BRL   L0B009B
L0B01D3  PHD
         TSC
         SEC
         SBC   #$000C
         TCD
         TCS
         STZ   $1A
         LDA   [$16]
         BNE   L0B01E4
         BRL   L0B0268
L0B01E4  STA   $03
         LDA   #$0000
         TAX
         SEP   #$20
         LDA   [$12]
         CMP   #$02
         BNE   L0B0217
         LDY   #$0001
         LDA   [$12],Y
         TAX
         LDAL  L0714D9,X
         CMP   #$69
         BNE   L0B0217
         INY
         LDA   [$12],Y
         TAX
         LDAL  L0714D9,X
         CMP   #$74
         BNE   L0B0217
         LDY   #$0004
         REP   #$20
         LDA   [$16],Y
         STA   $1A
         BRA   L0B0268
L0B0217  REP   #$20
         PHA
         PEI   $14
         PEI   $12
         LDY   #$0008
         LDA   [$16],Y
         PHA
         DEY
         DEY
         LDA   [$16],Y
         PHA
         JSL   L03261F
         PLA
         BEQ   L0B0268
         STA   $01
         LDY   #$000A
         LDA   [$16],Y
         STA   $09
         INY
         INY
         LDA   [$16],Y
         STA   $0B
         LDA   [$09]
         STA   $05
         LDY   #$0002
         LDA   [$09],Y
         STA   $07
         LDX   #$0000
         TXY
L0B024E  LDA   [$05],Y
         CMP   $01
         BEQ   L0B0265
         INX
         CPX   $03
         BEQ   L0B0268
         TYA
         CLC
         ADC   #$000E
         TAY
         BCC   L0B024E
         INC   $07
         BRA   L0B024E
L0B0265  INX
         STX   $1A
L0B0268  LDA   $10
         STA   $18
         LDA   $0F
         STA   $17
         LDX   $0D
         TDC
         CLC
         ADC   #$0016
         TCS
         TXA
         TCD
         RTL

L0B027B  PHD
         TSC
         SEC
         SBC   #$0016
         TCD
         TCS
         STZ   $2C
         PHY
         PHY
         LDA   L0553D5
         LDX   L0553D7
         STA   $0F
         STX   $11
         LDY   #$0002
         LDA   [$0F],Y
         STA   $0D
         PHA
         LDA   [$0F]
         STA   $0B
         PHA
         PEI   $2A
         PEI   $28
         JSL   L0324CD
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   #$1000
         ADC   $0B
         STA   $0B
         BCC   L0B02B7
         INC   $0D
L0B02B7  LDA   [$28]
         AND   #$00FF
         ASL
         ASL
         ASL
         CLC
         ADC   #$0054
         STA   $09
L0B02C5  LDY   #$0002
         LDA   [$01],Y
         BNE   L0B02CF
         BRL   L0B0344
L0B02CF  INC
         BEQ   L0B031E
         PHY
         LDA   L0553CD
         LDX   L0553CF
         STA   $0F
         STX   $11
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         CLC
         ADC   [$01],Y
         BCC   L0B02EB
         INX
L0B02EB  PHX
         PHA
         PEI   $2A
         PEI   $28
         JSL   L071C56
         PLA
         BEQ   L0B031E
         INC   $2C
         LDA   [$01]
         AND   #$00FF
         STA   [$24]
         LDY   #$0002
         LDA   [$01],Y
         EOR   #$FFFF
         INC
         STA   [$1C]
         DEY
         LDA   [$01],Y
         AND   #$00FF
         BIT   #$0080
         BEQ   L0B031A
         ORA   #$FF80
L0B031A  STA   [$20]
         BRA   L0B034E
L0B031E  LDA   $09
         CLC
         ADC   $01
         STA   $01
         BCC   L0B0329
         INC   $03
L0B0329  LDA   $03
         CMP   $0D
         BCC   L0B02C5
         LDA   $01
         CMP   $0B
         BCC   L0B02C5
         LDA   $01
         SEC
         SBC   #$1000
         STA   $01
         BCS   L0B0341
         DEC   $03
L0B0341  BRL   L0B02C5
L0B0344  LDA   #$0015
         STA   [$24]
         LDA   #$0000
         STA   [$20]
L0B034E  LDA   $1A
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

L0B0361  ENT
         PHD
         TSC
         SEC
         SBC   #$000A
         TCD
         TCS
         LDY   #$0002
         LDA   [$14]
         STA   $01
         LDA   [$14],Y
         STA   $03
         CLC
         LDA   $10
         ADC   #$0001
         STA   $05
         LDA   $12
         ADC   #$0000
         STA   $07
         LDY   #$FFFF
         SEP   #$20
         LDA   #$20
         STA   $09
L0B038C  INY
         CMP   [$01],Y
         BEQ   L0B038C
         JSR   L0B03F0
         LDA   #$22
         CMP   [$01]
         BNE   L0B03A2
         STA   $09
         LDY   #$0001
         JSR   L0B03F0
L0B03A2  LDY   #$0000
         SEP   #$10
L0B03A7  LDA   [$01],Y
         CMP   $09
         BEQ   L0B03BC
         CMP   #$0D
         BEQ   L0B03BC
         CMP   #$00
         BEQ   L0B03BC
         STA   [$05],Y
         INY
         CPY   #$FE
         BNE   L0B03A7
L0B03BC  TYA
         STA   [$10]
         LDA   $09
         CMP   #$22
         BEQ   L0B03C6
         DEY
L0B03C6  LDA   #$20
L0B03C8  INY
         CMP   [$01],Y
         BEQ   L0B03C8
         JSR   L0B03F0
         REP   #$30
         LDY   #$0002
         LDA   $01
         STA   [$14]
         LDA   $03
         STA   [$14],Y
         LDA   $0E
         STA   $16
         LDA   $0D
         STA   $15
         LDX   $0B
         TDC
         CLC
         ADC   #$0014
         TCS
         TXA
         TCD
         RTL

L0B03F0  PHP
         REP   #$20
         TYA
         CLC
         ADC   $01
         STA   $01
         BCC   L0B03FD
         INC   $03
L0B03FD  PLP
         RTS

L0B03FF  ENT
         PHD
         TSC
         SEC
         SBC   #$0014
         TCD
         TCS
         LDA   L0553C5
         STA   $05
         LDA   L0553C7
         STA   $07
         LDA   L0553C3
         BNE   L0B0419
         BRL   L0B04A1
L0B0419  DEC
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   [$05]
         STA   $09
         LDY   #$0002
         LDA   [$05],Y
         ADC   #$0000
         STA   $0B
         LDA   [$09]
         STA   $01
         LDA   [$09],Y
         STA   $03
         LDA   $09
         ADC   #$0006
         STA   $09
         BCC   L0B0440
         INC   $0B
L0B0440  LDA   $03
         BNE   L0B0479
         LDA   $01
         BEQ   L0B049E
         CMP   #$000B
         BCS   L0B0479
         LSR
         BCC   L0B046C
         BNE   L0B045C
         SEP   #$20
         LDA   [$09]
         STA   [$1A]
         REP   #$20
         BRA   L0B049E
L0B045C  ROL
         DEC
         TAY
         SEP   #$20
L0B0461  LDA   [$09],Y
         STA   [$1A],Y
         DEY
         BPL   L0B0461
         REP   #$20
         BRA   L0B049E
L0B046C  DEC
         ASL
         TAY
L0B046F  LDA   [$09],Y
         STA   [$1A],Y
         DEY
         DEY
         BPL   L0B046F
         BRA   L0B049E
L0B0479  LDA   [$09]
         STA   $0D
         LDA   [$09],Y
         STA   $0F
         LDA   [$0D],Y
         PHA
         LDA   [$0D]
         PHA
         PEI   $1C
         PEI   $1A
         PEI   $03
         PEI   $01
         JSL   L070597
         PEI   $0F
         PEI   $0D
         _DisposeHandle
L0B049E  DEC   L0553C3
L0B04A1  LDA   $18
         STA   $1C
         LDA   $17
         STA   $1B
         LDX   $15
         TDC
         CLC
         ADC   #$001A
         TCS
         TXA
         TCD
         RTL

L0B04B4  ENT
         PHD
         TSC
         SEC
         SBC   #$0012
         TCD
         TCS
         STZ   $22
         STZ   $01
         LDA   L0553C3
         CMP   L0553C1
         BNE   L0B04D3
         PHY
         JSL   L0B18F9
         PLA
         BNE   L0B04D3
         BRL   L0B05A1
L0B04D3  LDA   $1C
         BNE   L0B04DE
         LDA   $1A
         CMP   #$000B
         BCC   L0B050F
L0B04DE  PHY
         PHY
         PEI   $1C
         PEI   $1A
         LDA   L0553DB
         PHA
         PEA   $8000
         LDA   #$0000
         PHA
         PHA
         _NewHandle
         PLX
         PLY
         BCC   L0B04FE
         BRL   L0B05A1
L0B04FE  STY   $05
         STX   $03
         LDY   #$0002
         LDA   [$03]
         STA   $07
         LDA   [$03],Y
         STA   $09
         INC   $01
L0B050F  LDA   L0553C5
         STA   $0B
         LDA   L0553C7
         STA   $0D
         LDA   L0553C3
         INC   L0553C3
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   [$0B]
         STA   $0F
         LDY   #$0002
         LDA   [$0B],Y
         ADC   #$0000
         STA   $11
         LDA   $1A
         STA   [$0F]
         LDA   $1C
         STA   [$0F],Y
         LDA   $18
         AND   #$00FF
         INY
         INY
         STA   [$0F],Y
         LDA   $0F
         ADC   #$0006
         STA   $0F
         BCC   L0B054E
         INC   $11
L0B054E  LDA   $01
         BNE   L0B0584
         LDA   $1A
         BEQ   L0B059F
         LDY   #$0000
         DEC
         LSR
         BEQ   L0B057E
         DEC
         BEQ   L0B0578
         DEC
         BEQ   L0B0572
         DEC
         BEQ   L0B056C
         LDA   [$1E],Y
         STA   [$0F],Y
         INY
         INY
L0B056C  LDA   [$1E],Y
         STA   [$0F],Y
         INY
         INY
L0B0572  LDA   [$1E],Y
         STA   [$0F],Y
         INY
         INY
L0B0578  LDA   [$1E],Y
         STA   [$0F],Y
         INY
         INY
L0B057E  LDA   [$1E],Y
         STA   [$0F],Y
         BRA   L0B059F
L0B0584  LDY   #$0002
         LDA   $03
         STA   [$0F]
         LDA   $05
         STA   [$0F],Y
         PEI   $20
         PEI   $1E
         PEI   $09
         PEI   $07
         PEI   $1C
         PEI   $1A
         JSL   L070597
L0B059F  INC   $22
L0B05A1  LDA   $16
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

L0B05B4  ENT
         PHD
         PHY
         TSC
         TCD
         LDA   #$0000
         STA   $10
         STA   [$08]
         TAY
         SEP   #$30
         LDA   [$0C]
         BEQ   L0B0619
         STA   $01
         TAY
L0B05C9  LDA   [$0C],Y
         CMP   #$20
         BEQ   L0B05D3
         CMP   #$0D
         BNE   L0B05D9
L0B05D3  DEY
         BNE   L0B05C9
         BRL   L0B0619
L0B05D9  CPY   #$04
         BEQ   L0B05E1
         CPY   #$05
         BNE   L0B0619
L0B05E1  TYA
         STA   [$0C]
         REP   #$30
         PHA
         PEI   $0E
         PEI   $0C
         CPY   #$0005
         BEQ   L0B0604
         PEA   ^L032E38
         PEA   L032E38
         JSL   L071C56
         PLA
         BEQ   L0B0613
         LDA   #$0001
         STA   [$08]
         BRA   L0B0611
L0B0604  PEA   ^L032E0A
         PEA   L032E0A
         JSL   L071C56
         PLA
         BEQ   L0B0613
L0B0611  INC   $10
L0B0613  SEP   #$30
         LDA   $01
         STA   [$0C]
L0B0619  REP   #$30
         LDA   $06
         STA   $0E
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
         RTL

L0B062C  PHD
         TSC
         TCD
         LDA   $06
         DEC
         ASL
         ASL
         ASL
         CLC
         ADC   [$08]
         STA   $0C
         LDY   #$0002
         LDA   [$08],Y
         ADC   #$0000
         STA   $0E
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

L0B0653  ENT
         PHD
         TSC
         TCD
         LDX   #$0001
         LDA   $06
         CMP   L0550ED
         BEQ   L0B0675
         CMP   L0550DD
         BEQ   L0B0675
         CMP   L0550E1
         BEQ   L0B0675
         CMP   L0550E9
         BEQ   L0B0675
         CMP   L0550E5
         BEQ   L0B0675
         DEX
L0B0675  STX   $0A
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

         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEI   $10
         PEI   $0E
         JSL   L151301
         PLA
         STA   $01
         PLX
         STX   $03
         PHY
         PHY
         LDY   #$0002
         LDA   [$0E],Y
         PHA
         LDA   [$0E]
         PHA
         LDA   $01
         LSR
         LSR
         JSL   L150488
         PHX
         PHA
         JSL   L071E31
         PLA
         STA   $12
         PLX
         STX   $14
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

L0B06CE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   #$0001
         STA   $01
L0B06DB  PEI   $01
         JSL   L0B06F1
         LDA   #$0008
         CMP   $01
         BEQ   L0B06EC
         INC   $01
         BRA   L0B06DB
L0B06EC  PLY
         PLY
         PLY
         PLD
         RTL

L0B06F1  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         LDA   $26
         DEC
         PEA   $000A
         JSL   L150BEE
*         PLX
*         TXA
         pla
         CLC
         ADC   #L05106C
         LDX   #^L05106C
         BCC   L0B070F
         INX
L0B070F  STA   $15
         STX   $17
         LDY   #$0004
         LDA   [$15],Y
         BNE   L0B071D
         BRL   L0B07D8
L0B071D  LDY   #$0006
         LDA   [$15],Y
         BEQ   L0B0789
         LDY   #$0008
         LDA   [$15],Y
         BEQ   L0B073F
         PHY
         PHY
         LDY   #$0004
         LDA   [$15],Y
         PHA
         JSL   L075BBA
         PLA
         STA   $19
         PLX
         STX   $1B
         BRA   L0B0751
L0B073F  PHY
         PHY
         LDY   #$0004
         LDA   [$15],Y
         PHA
         JSL   L075B7B
         PLA
         STA   $19
         PLX
         STX   $1B
L0B0751  LDAL  L05565D
         BNE   L0B0789
         LDY   #$0004
         LDA   [$15],Y
         PHA
         PEI   $1B
         PEI   $19
         JSL   L075DD3
         LDAL  L05565D
         BEQ   L0B0789
         PEA   $0016
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         JSL   L0B0841
L0B0789  LDY   #$0004
         LDA   [$15],Y
         PHA
         JSL   L075A4F
         LDAL  L05565D
         BEQ   L0B07B7
         PEA   $0016
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         JSL   L0B0841
L0B07B7  LDA   #$0000
         LDY   #$0004
         STA   [$15],Y
         LDY   #$0002
         LDA   [$15],Y
         PHA
         LDA   [$15]
         PHA
         JSL   L07185A
         LDA   #$0000
         TAX
         STA   [$15]
         TXA
         LDY   #$0002
         STA   [$15],Y
L0B07D8  LDA   $24
         STA   $26
         LDA   $23
         STA   $25
         LDA   $21
         TCD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L0B07EA  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$0011
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         PEA   ^L04063C
         PEA   L04063C
         PEA   ^L04063D
         PEA   L04063D
         PEA   ^L04063E
         PEA   L04063E
         JSL   L073C22
         PEA   $0000
         JSL   L0B0904
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$010A
         TCS
         RTL

L0B0841  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$0013
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         PEI   $F8
         PEI   $F6
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         PEA   ^L04063F
         PEA   L04063F
         PEA   ^L040640
         PEA   L040640
         PEA   ^L040641
         PEA   L040641
         JSL   L073C22
         PEI   $FA
         JSL   L0B0904
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

L0B0897  ENT
         PHD
         TSC
         CLC
         ADC   #$FDFC
         TCS
         ADC   #$0117
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEI   $F8
         PEI   $F6
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE9
         PHA
         PEI   $F4
         PEI   $F2
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE9
         PHA
         PEA   ^L040642
         PEA   L040642
         PEA   ^L040643
         PEA   L040643
         JSL   L073C22
         PEI   $FA
         JSL   L0B0904
         LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$0210
         TCS
         RTL

L0B0904  PHD
         TSC
         CLC
         ADC   #$FDF2
         TCS
         ADC   #$0119
         TCD
         LDA   L055389
         BEQ   L0B0923
         LDA   L05538B
         LDX   L05538D
         PHX
         PHA
         JSL   L07185A
         STZ   L055389
L0B0923  LDA   L0553A5
         PHA
         PHY
         JSL   L07005C
         PLA
         ORA   $01,S
         PLX
         STA   L0553A5
*         LDA   L0553A5	; LOGO
         BEQ   L0B093B
         BRL   L0B0B68
L0B093B  LDA   #$0001
         STA   L0553A5
         LDA   L05539D
         SEC
         SBC   #$0000
         BEQ   L0B094F
         BMI   L0B094F
         BRL   L0B0A71
L0B094F  LDA   L0553A3
         BNE   L0B0957
         BRL   L0B0A6E
L0B0957  LDA   $FA
         BNE   L0B0978
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         LDAL  L0540CF
         PHA
         LDAL  L0540CD
         PHA
         PEA   $0100
         JSL   L0313BE
         BRL   L0B0A17
L0B0978  PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE7
         PHA
         PEI   $FA
         JSL   L0B127A
         PEA   $0100
         JSL   L0313BE
         PHY
         PHY
         PEA   $0001
         PEA   ^L0540CD
         PEA   L0540CD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE8
         PHA
         LDA   #$00FF
         LDX   #$FFE7
         AND   $00,X
         PHA
         JSL   L1514A2
         PLA
         STA   $E9
         PLX
         STX   $EB
         PHY
         PHY
         PEI   $EB
         PEI   $E9
         JSL   L151301
         PLA
         PLX
         INC
         BNE   L0B09CE
         INX
L0B09CE  STA   $E7
         LDA   $E7
         JSL   L150488
         PHX
         PHA
         PEI   $EB
         PEI   $E9
         JSL   L1512FB
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         STA   $F1
         STX   $F3
         LDA   $E7
         DEC
         TAY
         LDA   #$0000
         SEP   #$20
         STA   [$F1],Y
         REP   #$20
         LDY   #$0002
         LDA   [$E9],Y
         PHA
         LDA   [$E9]
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         JSL   L071FF8
         PEI   $EB
         PEI   $E9
         JSL   L07185A
L0B0A17  LDA   L05539F
         LDX   L0553A1
         STA   $F1
         STX   $F3
         LDY   #$0002
         LDA   [$F1],Y
         TAX
         LDA   [$F1]
         STA   $F1
         STX   $F3
         LDA   [$F1]
         BNE   L0B0A4D
         PEA   ^L040644
         PEA   L040644
         PEA   ^L040645
         PEA   L040645
         PEA   ^L040646
         PEA   L040646
         PEA   ^L040647
         PEA   L040647
         JSL   L0B24DB
L0B0A4D  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         LDA   L05539F
         LDX   L0553A1
         PHX
         PHA
         JSL   L03250F
         PLA
         LSR
         BCS   L0B0A6E
         PEA   $05F9
         JSL   L07272E
L0B0A6E  BRL   L0B0B68
L0B0A71  JSL   L0B1BD6
         PHY
         PEA   $FFFF
         PEA   $0000
         JSL   L150B28
         PLA
         STA   $ED
         STZ   L055371
         LDA   #$0001
         STA   $EF
         LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L0B0A99
         CPX   L0553BB
L0B0A99  BEQ   L0B0AA0
         LDA   #$0000
         BRA   L0B0AA3
L0B0AA0  LDA   #$0001
L0B0AA3  BNE   L0B0ABF
         PHA
         LDA   L0551FB
         SEC
         SBC   #$0005
         BVS   L0B0AB2
         EOR   #$8000
L0B0AB2  BPL   L0B0AB9
         LDA   #$0000
         BRA   L0B0ABC
L0B0AB9  LDA   #$0001
L0B0ABC  ORA   $01,S
         PLX
L0B0ABF  PHA
         PLA
         BNE   L0B0AE9
         PHA
         LDA   L0553B9
         LDX   L0553BB
         CLC
         ADC   #$003A
         BCC   L0B0AD1
         INX
L0B0AD1  STA   $F1
         STX   $F3
         LDA   [$F1]
         LDY   #$0002
         ORA   [$F1],Y
         BEQ   L0B0AE3
         LDA   #$0000
         BRA   L0B0AE6
L0B0AE3  LDA   #$0001
L0B0AE6  ORA   $01,S
         PLX
L0B0AE9  CMP   #$0000
         BNE   L0B0AFC
         LDX   #$0000
         LDA   #$002B
         CMP   $FA
         BNE   L0B0AF9
         INX
L0B0AF9  TXA
         BEQ   L0B0AFE
L0B0AFC  STZ   $EF
L0B0AFE  LDA   $FA
         BEQ   L0B0B0A
         LDA   #$0BB8
         CLC
         ADC   $FA
         STA   $FA
L0B0B0A  LDA   #$0001
         STA   L054FB3
         PHY
         PEI   $FA
         PEI   $EF
         PEA   $0834
         JSL   L072032
         PLA
         STA   $ED
         STZ   L054FB3
         JSL   L09AFB1
         LDX   #$0000
         LDA   $ED
         DEC
         DEC
         BNE   L0B0B30
         INX
L0B0B30  TXA
         AND   $EF
         BEQ   L0B0B64
         LDA   L0550B9
         DEC
         BNE   L0B0B42
         PEA   $0001
         JSL   L090635
L0B0B42  PHY
         LDA   L0553B9
         LDX   L0553BB
         CLC
         ADC   #$0020
         BCC   L0B0B50
         INX
L0B0B50  PHX
         PHA
         PEA   $0001
         JSL   L0F0635
         PLA
         LSR
         BCS   L0B0B64
         PEA   $0C1C
         JSL   L0727E0
L0B0B64  JSL   L073A49
L0B0B68  LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$0212
         TCS
         RTL

L0B0B7A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0A
         JSL   L0B0904
         LDA   $08
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

L0B0B98  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0C
         PEI   $0A
         LDA   $0E
         LDX   $10
         JSL   L1512A5
         STA   $12
         STX   $14
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

L0B0BC2  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   $01
         STZ   $03
         TDC
         CLC
         ADC   #$0012
         PEA   $0000
         PHA
         JSL   L032589
L0B0BDB  PEI   $14
         PEI   $12
         LDA   $0E
         LDX   $10
         JSL   L033477
         BVS   L0B0BEC
         EOR   #$8000
L0B0BEC  BMI   L0B0C16
         LDA   $01
         LDX   $03
         INC
         BNE   L0B0BF6
         INX
L0B0BF6  STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$0012
         PEA   $0000
         PHA
         JSL   L0325D1
         TDC
         CLC
         ADC   #$0012
         PEA   $0000
         PHA
         JSL   L032589
         BRA   L0B0BDB
L0B0C16  LDA   $01
         LDX   $03
         STA   $16
         STX   $18
         LDA   $0C
         STA   $14
         LDA   $0B
         STA   $13
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L0B0C30  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   $01
         STZ   $03
L0B0C3C  PEI   $14
         PEI   $12
         LDA   $0E
         LDX   $10
         JSL   L033477
         BVS   L0B0C4D
         EOR   #$8000
L0B0C4D  BMI   L0B0C76
         LDA   $01
         LDX   $03
         INC
         BNE   L0B0C57
         INX
L0B0C57  STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$0012
         PEA   $0000
         PHA
         JSL   L071B83
         LDA   $12
         LDX   $14
         INC
         BNE   L0B0C70
         INX
L0B0C70  STA   $12
         STX   $14
         BRA   L0B0C3C
L0B0C76  LDA   $01
         LDX   $03
         STA   $16
         STX   $18
         LDA   $0C
         STA   $14
         LDA   $0B
         STA   $13
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L0B0C90  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF8
         TCS
         ADC   #$0019
         TCD
         STZ   $E7
         STZ   $E9
         TDC
         CLC
         ADC   #$00F8
         PEA   $0000
         PHA
         JSL   L032589
L0B0CAC  PEI   $FA
         PEI   $F8
         LDA   $F4
         LDX   $F6
         JSL   L033477
         BVS   L0B0CBD
         EOR   #$8000
L0B0CBD  BMI   L0B0CF0
         LDA   $E7
         LDX   $E9
         INC
         BNE   L0B0CC7
         INX
L0B0CC7  STA   $E7
         STX   $E9
         TDC
         CLC
         ADC   #$00F8
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         JSL   L0B0361
         TDC
         CLC
         ADC   #$00F8
         PEA   $0000
         PHA
         JSL   L032589
         BRA   L0B0CAC
L0B0CF0  LDA   $E7
         LDX   $E9
         STA   $FC
         STX   $FE
         LDA   $F2
         STA   $FA
         LDA   $F1
         STA   $F9
         LDA   $EF
         TCD
         TSC
         CLC
         ADC   #$0112
         TCS
         RTL

L0B0D0A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $0E
         LDX   $10
         STA   $01
         STX   $03
         LDA   L055039
         LDX   L05503B
         LDY   #$0002
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0002
         STA   [$01]
         LDA   L055027
         LDX   L055029
         LDY   #$000A
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   L05501F
         LDX   L055021
         LDY   #$0006
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0000
         LDY   #$000E
         STA   [$01],Y
         LDA   #$0000
         TAX
         LDY   #$0010
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   L05525F
         LDY   #$0014
         STA   [$01],Y
         LDA   L05525D
         LDY   #$0016
         STA   [$01],Y
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

L0B0D87  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $0E
         LDX   $10
         STA   $01
         STX   $03
         LDA   L055027
         LDX   L055029
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
         LDA   L05501F
         LDX   L055021
         LDY   #$0004
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   L055039
         LDX   L05503B
         LDY   #$0008
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
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

L0B0DD7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         JSL   L0B392B
         LDA   L05535D
         DEC
         BEQ   L0B0DEB
         BRA   L0B0E16
L0B0DEB  PHY
         JSL   L150B6A
         PLA
         STA   $01
         LDA   L055353
         PHA
         JSL   L150B70
         PEA   $8024
         LDA   L055355
         LDX   L055357
         PHX
         PHA
         JSL   L150410
         PEI   $01
         JSL   L150B70
         LDA   #$0002
         STA   L05535D
L0B0E16  PLY
         PLY
         PLY
         PLD
         RTL

L0B0E1B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0C
         PEI   $0A
         PEA   $0001
         JSL   L0B0E3F
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

L0B0E3F  PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         LDA   $1A
         LDX   $1C
         STA   $05
         STX   $07
         LDA   [$05]
         STA   $03
         LDA   $18
         STA   $01
         LDA   $01
         SEC
         SBC   $03
         BEQ   L0B0E65
         BVS   L0B0E63
         EOR   #$8000
L0B0E63  BMI   L0B0EB6
L0B0E65  LDA   $03
         STA   $0D
L0B0E69  LDY   #$000C
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $0F
         STX   $11
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         PHX
         PHA
         LDA   $0D
         DEC
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B0E95
         DEX
L0B0E95  JSL   L150F53
         STA   $09
         STX   $0B
         LDY   #$000C
         LDA   [$09],Y
         PHA
         DEY
         DEY
         LDA   [$09],Y
         PHA
         JSL   L07185A
         LDA   $0D
         CMP   $01
         BEQ   L0B0EB6
         DEC   $0D
         BRA   L0B0E69
L0B0EB6  LDA   $18
         SEC
         SBC   #$0001
         BEQ   L0B0EC7
         BVS   L0B0EC3
         EOR   #$8000
L0B0EC3  BPL   L0B0EC7
         BRA   L0B0EF3
L0B0EC7  LDY   #$0008
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         JSL   L07185A
         LDY   #$000C
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         JSL   L07185A
         PEI   $1C
         PEI   $1A
         PEA   $0000
         PEA   $000E
         JSL   L071EC5
L0B0EF3  LDA   $16
         STA   $1C
         LDA   $15
         STA   $1B
         LDA   $13
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L0B0F05  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   L0553B5
         LDX   L0553B7
         CMP   $12
         BNE   L0B0F19
         CPX   $14
L0B0F19  BNE   L0B0F34
         STZ   L0553B5
         STZ   L0553B7
         PEA   ^L051BDE
         PEA   L051BDE
         PEA   ^L050C2A
         PEA   L050C2A
         PEA   $0008
         JSL   L0313BE
L0B0F34  LDX   #$0000
         LDY   #$000C
         LDA   [$12],Y
         BNE   L0B0F3F
         INX
L0B0F3F  PHX
         LDX   #$0000
         LDY   #$000E
         LDA   [$12],Y
         BNE   L0B0F4B
         INX
L0B0F4B  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0B0F78
         LDY   #$0010
         LDA   [$12],Y
         BEQ   L0B0F66
         LDY   #$0002
         LDA   [$12],Y
         PHA
         LDA   [$12]
         PHA
         JSL   L07185A
L0B0F66  LDY   #$0006
         LDA   [$12],Y
         PHA
         DEY
         DEY
         LDA   [$12],Y
         PHA
         JSL   L07185A
         BRL   L0B103A
L0B0F78  LDY   #$000C
         LDA   [$12],Y
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0B0F91
         INX
L0B0F91  STA   $01
         STX   $03
         LDY   #$001C
         LDA   [$01],Y
         DEC
         LDY   #$001C
         STA   [$01],Y
         LDY   #$0020
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $05
         STX   $07
         PEI   $07
         PEI   $05
         LDY   #$000E
         LDA   [$12],Y
         DEC
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B0FD5
         DEX
L0B0FD5  JSL   L150F53
         STA   $05
         STX   $07
         LDY   #$000C
         LDA   [$05],Y
         DEC
         LDY   #$000C
         STA   [$05],Y
         LDY   #$000C
         LDA   [$05],Y
         BNE   L0B1001
         PEA   $0002
         LDY   #$000A
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         JSL   L150D44
L0B1001  LDY   #$001C
         LDA   [$01],Y
         BNE   L0B103A
         LDY   #$0022
         LDA   [$01],Y
         BEQ   L0B101B
         LDY   #$000C
         LDA   [$12],Y
         PHA
         JSL   L0B1ADF
         BRA   L0B103A
L0B101B  PHY
         PEI   $03
         PEI   $01
         JSL   L0B33DE
         PLA
         LSR
         BCS   L0B103A
         PEA   $0002
         LDY   #$001A
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L150D44
L0B103A  LDA   $10
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

L0B104C  ENT
         PHD
         TSC
         CLC
         ADC   #$FEC2
         TCS
         ADC   #$0051
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB1
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FFB1
         AND   $00,X
         LDX   #$FFAF
         STA   $00,X
         LDX   #$FFAF
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L0B1086
         EOR   #$8000
L0B1086  BMI   L0B108B
         BRL   L0B112F
L0B108B  LDA   #$0001
         STA   $E7
L0B1090  PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L0B109C
         BRL   L0B1121
L0B109C  LDA   $F6
         STA   $E3
         LDA   $F4
         STA   $E1
         LDA   $F2
         STA   $DF
         LDA   #$0003
         STA   $B1
         LDA   $E7
         CLC
         ADC   #$FFB1
         TAX
         LDA   #$00FF
         AND   $00,X
         JSL   L150488
         STA   $B3
         STX   $B5
         LDA   L054FB7
         LDX   L054FB9
         STA   $E9
         STX   $EB
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         STA   $B7
         STX   $B9
         STZ   $BD
         STZ   $BB
         STZ   $BF
         LDA   $E3
         BEQ   L0B10E9
         LDA   #$0200
         CLC
         ADC   $BF
         STA   $BF
L0B10E9  LDA   $E1
         BEQ   L0B10F5
         LDA   #$0800
         CLC
         ADC   $BF
         STA   $BF
L0B10F5  LDA   $DF
         BEQ   L0B1101
         LDA   #$0100
         CLC
         ADC   $BF
         STA   $BF
L0B1101  PEA   ^L052D64
         PEA   L052D64
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         PEA   $002E
         JSL   L0313BE
         LDA   #$0001
         STA   L05524B
         JSL   L0A2670
L0B1121  LDA   $E7
         LDX   #$FFAF
         CMP   $00,X
         BEQ   L0B112F
         INC   $E7
         BRL   L0B1090
L0B112F  STZ   L05524B
         LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$014A
         TCS
         RTL

L0B1144  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $01
         JSL   L03018B
         LDA   #$0001
         STA   L05535F
         PEI   $01
         JSL   L071AA4
         PLY
         PLY
         PLY
         PLD
         RTL

L0B1169  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $12
         LDA   [$0A]
         CMP   [$0E]
         BEQ   L0B117C
         BRL   L0B1268
L0B117C  LDY   #$0004
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         LDY   #$0004
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         JSL   L033477
         BEQ   L0B119A
         BRL   L0B1268
L0B119A  LDA   [$0E]
         DEC
         BPL   L0B11A2
         BRL   L0B1261
L0B11A2  CMP   #$0005
         BMI   L0B11AA
         BRL   L0B1261
L0B11AA  SEC
         SBC   #$0000
         BEQ   L0B11C5
         DEC
         BEQ   L0B1203
         DEC
         BEQ   L0B122A
         DEC
         BNE   L0B11BC
         BRL   L0B1251
L0B11BC  DEC
         BNE   L0B11C2
         BRL   L0B1258
L0B11C2  BRL   L0B1261
L0B11C5  LDY   #$0012
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         LDY   #$0012
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         JSL   L033477
         BEQ   L0B11E5
         LDA   #$0000
         BRA   L0B11E8
L0B11E5  LDA   #$0001
L0B11E8  BEQ   L0B11FF
         PHA
         LDX   #$0000
         LDY   #$000E
         LDA   [$0E],Y
         LDY   #$000E
         CMP   [$0A],Y
         BNE   L0B11FB
         INX
L0B11FB  TXA
         AND   $01,S
         PLX
L0B11FF  STA   $12
         BRA   L0B1268
L0B1203  LDY   #$000C
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         LDY   #$000C
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         JSL   L033477
         BEQ   L0B1223
         LDA   #$0000
         BRA   L0B1226
L0B1223  LDA   #$0001
L0B1226  STA   $12
         BRA   L0B1268
L0B122A  LDY   #$0008
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         LDY   #$0008
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         JSL   L033477
         BEQ   L0B124A
         LDA   #$0000
         BRA   L0B124D
L0B124A  LDA   #$0001
L0B124D  STA   $12
         BRA   L0B1268
L0B1251  LDA   #$0001
         STA   $12
         BRA   L0B1268
L0B1258  PEA   $0493
         JSL   L07272E
         BRA   L0B1268
L0B1261  PEA   $1C45
         JSL   L07272E
L0B1268  LDA   $08
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

L0B127A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0E
         PEI   $0C
         PHY
         PHY
         LDA   #$0BB8
         CLC
         ADC   $0A
         PHA
         JSL   L0711EB
         PEA   $0100
         JSL   L0313BE
         LDA   $08
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

L0B12AA  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD6
         TCS
         TCD
         LDA   [$30]
         BEQ   L0B12B9
         BRL   L0B1376
L0B12B9  PEI   $32
         PEI   $30
         TDC
         CLC
         ADC   #$001B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0013
         PEA   $0000
         PHA
         JSL   L0D0A88
         LDX   #$0000
         LDA   $11
         BMI   L0B1303
         ORA   $0F
         BEQ   L0B1303
         INX
L0B1303  TXA
         PHA
         LDX   #$0000
         LDA   $15
         BMI   L0B1311
         ORA   $13
         BEQ   L0B1311
         INX
L0B1311  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0B1322
         JSL   L0E0000
         JSL   L0E0C52
         BRA   L0B1376
L0B1322  PEI   $25
         PEI   $23
         LDA   $1F
         LDX   $21
         JSL   L1512A5
         STA   $03
         STX   $05
         PHY
         JSL   L0B1C0F
         PLA
         STA   $01
         PEI   $21
         PEI   $1F
         LDA   $03
         LDX   $05
         INC
         BNE   L0B1346
         INX
L0B1346  PHX
         PHA
         PEA   $0000
         JSL   L0E07C5
         PEI   $01
         JSL   L0B39C0
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         LDA   $03
         LDX   $05
         JSL   L150F53
         STA   $17
         STX   $19
         SEP   #$20
         LDA   #$00
         STA   [$17]
         REP   #$20
         JSL   L0B31FF
L0B1376  LDA   $2E
         STA   $32
         LDA   $2D
         STA   $31
         LDA   $2B
         TCD
         TSC
         CLC
         ADC   #$0030
         TCS
         RTL

L0B1388  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $18
         BPL   L0B13D0
         LDA   L0553CD
         LDX   L0553CF
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PHX
         PHA
         LDA   $18
         JSL   L150488
         JSL   L1512A5
         STA   $01
         STX   $03
         PEI   $03
         PEI   $01
         PEI   $14
         PEI   $12
         LDA   #$00FF
         AND   [$01]
         INC
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         BRA   L0B1414
L0B13D0  LDA   $18
         SEC
         SBC   #$00FF
         BEQ   L0B13E4
         BVS   L0B13DD
         EOR   #$8000
L0B13DD  BPL   L0B13E4
         LDA   #$00FF
         STA   $18
L0B13E4  LDA   $18
         SEP   #$20
         STA   [$12]
         REP   #$20
         PHY
         PHY
         PEI   $16
         JSL   L0B289E
         PLA
         STA   $05
         PLX
         STX   $07
         PEI   $07
         PEI   $05
         LDA   $12
         LDX   $14
         INC
         BNE   L0B1406
         INX
L0B1406  PHX
         PHA
         LDA   $18
         JSL   L150488
         PHX
         PHA
         JSL   L070597
L0B1414  LDA   $10
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

L0B1426  ENT
         PHD
         TSC
         CLC
         ADC   #$FEAB
         TCS
         ADC   #$0066
         TCD
         TDC
         CLC
         ADC   #$00B2
         PEA   $0000
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $000A
         JSL   L0313BE
         STZ   $E1
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA4
         PHA
         TDC
         CLC
         ADC   #$00B2
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FF9A
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF9A
         PHA
         PEA   ^L040649
         PEA   L040649
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA4
         PHA
         PEA   $000A
         _SANEFP816
         BVS   L0B1499
         LDA   #$0000
         BRA   L0B149C
L0B1499  LDA   #$0001
L0B149C  BEQ   L0B14E8
         TDC
         CLC
         ADC   #$00B2
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA4
         PHA
         TDC
         CLC
         ADC   #$00B2
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA4
         PHA
         PEA   $000D
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA4
         PHA
         PEA   $000A
         JSL   L0313BE
         LDA   #$0001
         STA   $E1
L0B14E8  LDA   #$0001
         STA   $DD
         LDA   L0553B1
         STA   $DF
         PEI   $DF
         PEI   $DD
         TDC
         CLC
         ADC   #$00B2
         PEA   $0000
         PHA
         PEI   $F6
         PEI   $F4
         JSL   L15072F
         PHY
         PEA   ^L040653
         PEA   L040653
         PEI   $F6
         PEI   $F4
         JSL   L150F73
         PLA
         STA   $E9
         LDA   $E9
         BNE   L0B1520
         BRL   L0B1697
L0B1520  LDA   #$00FF
         AND   [$F4]
         STA   $E7
L0B1527  LDA   $E7
         SEC
         SBC   $E9
         SEC
         SBC   L0553AF
         BEQ   L0B1539
         BVS   L0B1537
         EOR   #$8000
L0B1537  BMI   L0B153E
L0B1539  LDA   #$0000
         BRA   L0B1541
L0B153E  LDA   #$0001
L0B1541  PHA
         LDX   #$0000
         LDY   $E7
         LDA   #$00FF
         AND   [$F4],Y
         CMP   #$0030
         BNE   L0B1552
         INX
L0B1552  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0B1560
         LDA   $E7
         DEC
         STA   $E7
         BRA   L0B1527
L0B1560  LDX   #$0000
         LDA   $E9
         CMP   $E7
         BNE   L0B156A
         INX
L0B156A  PHX
         LDA   $E7
         SEC
         SBC   #$0001
         BEQ   L0B157A
         BVS   L0B1578
         EOR   #$8000
L0B1578  BMI   L0B157F
L0B157A  LDA   #$0000
         BRA   L0B1582
L0B157F  LDA   #$0001
L0B1582  AND   $01,S
         PLX
         LSR
         BCC   L0B158D
         LDA   $E7
         DEC
         STA   $E7
L0B158D  LDA   $E7
         SEP   #$20
         STA   [$F4]
         REP   #$20
         PHA
         PEI   $F6
         PEI   $F4
         PEA   ^L040655
         PEA   L040655
         JSL   L1503DD
         PLA
         LSR
         BCC   L0B15B1
         LDAL  L040656
         STA   [$F4]
         BRL   L0B1697
L0B15B1  PHY
         PEA   ^L040658
         PEA   L040658
         PEI   $F6
         PEI   $F4
         JSL   L150F73
         PLA
         STA   $E9
         LDA   $E9
         BNE   L0B15CF
         LDA   #$00FF
         AND   [$F4]
         INC
         STA   $E9
L0B15CF  LDA   $E9
         SEC
         SBC   L0553AD
         BEQ   L0B15DE
         BVS   L0B15DC
         EOR   #$8000
L0B15DC  BMI   L0B161F
L0B15DE  LDA   L0553AD
         SEC
         SBC   $E9
         INC
         LDX   #$FFB0
         STA   $00,X
         LDX   #$FFB0
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L0B15F8
         EOR   #$8000
L0B15F8  BPL   L0B161D
         LDA   #$0001
         STA   $E5
L0B15FF  PEA   ^L04065A
         PEA   L04065A
         PEI   $F6
         PEI   $F4
         PEA   $0001
         JSL   L150C4C
         LDA   $E5
         LDX   #$FFB0
         CMP   $00,X
         BEQ   L0B161D
         INC   $E5
         BRA   L0B15FF
L0B161D  BRA   L0B1697
L0B161F  PHY
         PEA   ^L04065C
         PEA   L04065C
         PEI   $F6
         PEI   $F4
         JSL   L150F73
         PLA
         INC
         STA   $E3
         LDA   $E9
         SEC
         SBC   L0553AD
         DEC
         LDX   #$FFAE
         STA   $00,X
         LDX   #$FFAE
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L0B164C
         EOR   #$8000
L0B164C  BPL   L0B1697
         LDA   #$0001
         STA   $E5
L0B1653  LDX   #$0000
         LDY   $E3
         LDA   #$00FF
         AND   [$F4],Y
         CMP   #$0030
         BNE   L0B1663
         INX
L0B1663  TXA
         BNE   L0B1679
         LDX   #$0000
         LDY   $E3
         LDA   #$00FF
         AND   [$F4],Y
         CMP   #$002E
         BNE   L0B1676
         INX
L0B1676  TXA
         BEQ   L0B1688
L0B1679  PEI   $F6
         PEI   $F4
         PEI   $E3
         PEA   $0001
         JSL   L150A64
         BRA   L0B168A
L0B1688  BRA   L0B1697
L0B168A  LDA   $E5
         LDX   #$FFAE
         CMP   $00,X
         BEQ   L0B1697
         INC   $E5
         BRA   L0B1653
L0B1697  PHY
         PEI   $F6
         PEI   $F4
         PEA   ^L04065E
         PEA   L04065E
         JSL   L071C56
         PLA
         LSR
         BCC   L0B16B2
         LDAL  L040660
         STA   [$F4]
         BRA   L0B16DB
L0B16B2  LDA   $E1
         BEQ   L0B16DB
         PEI   $F6
         PEI   $F4
         PEA   ^L040662
         PEA   L040662
         PEI   $F6
         PEI   $F4
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB2
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B16DB  LDA   $F2
         STA   $FA
         LDA   $F1
         STA   $F9
         LDA   $EF
         TCD
         TSC
         CLC
         ADC   #$015F
         TCS
         RTL

L0B16ED  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         STZ   $1C
         PHY
         PHY
         PEI   $1A
         PEI   $18
         JSL   L0735A8
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   #$0001
         STA   $09
L0B170C  LDA   $09
         DEC
         PEA   $000A
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L05106C
         LDX   #^L05106C
         BCC   L0B1722
         INX
L0B1722  STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         BEQ   L0B1762
         PHY
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         PEI   $07
         PEI   $05
         JSL   L071330
         PLA
         LSR
         BCC   L0B1762
         LDA   $14
         BEQ   L0B174D
         LDA   $09
         STA   $1C
         BRA   L0B1754
L0B174D  LDY   #$0004
         LDA   [$01],Y
         STA   $1C
L0B1754  LDA   $16
         BEQ   L0B1760
         LDA   #$0001
         LDY   #$0006
         STA   [$01],Y
L0B1760  BRA   L0B1778
L0B1762  LDA   #$0008
         CMP   $09
         BEQ   L0B176D
         INC   $09
         BRA   L0B170C
L0B176D  PEA   $000C
         PEI   $1A
         PEI   $18
         JSL   L0B0841
L0B1778  PEI   $07
         PEI   $05
         JSL   L07185A
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

L0B1792  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0A
         STZ   $0C
         PHY
         LDAL  L051058
         PHA
         LDAL  L051056
         PHA
         JSL   L0D109F
         PLA
         LSR
         BCC   L0B182D
         LDAL  L051054
         DEC
         BMI   L0B1829
         CMP   #$0004
         BPL   L0B1829
         SEC
         SBC   #$0000
         BEQ   L0B17CE
         DEC
         BEQ   L0B17EB
         DEC
         BEQ   L0B1803
         DEC
         BEQ   L0B181B
         BRA   L0B1829
L0B17CE  PHY
         PHY
         LDAL  L051066
         PHA
         LDAL  L051064
         PHA
         LDAL  L051062
         PHA
         JSL   L07AE68
         PLA
         STA   $0A
         PLX
         STX   $0C
         BRA   L0B1829
L0B17EB  PHY
         PHY
         LDAL  L051060
         PHA
         LDAL  L05105E
         PHA
         JSL   L07AACB
         PLA
         STA   $0A
         PLX
         STX   $0C
         BRA   L0B1829
L0B1803  PHY
         PHY
         LDAL  L05105C
         PHA
         LDAL  L05105A
         PHA
         JSL   L07AACB
         PLA
         STA   $0A
         PLX
         STX   $0C
         BRA   L0B1829
L0B181B  PHY
         PHY
         JSL   L076220
         PLA
         STA   $0A
         PLX
         STX   $0C
         BRA   L0B1829
L0B1829  JSL   L0B381C
L0B182D  PLY
         PLY
         PLD
         RTL

L0B1831  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $10
         PEI   $0E
         JSL   L151131
         PEI   $0C
         PEI   $0A
         LDA   #$0010
         CLC
         ADC   $0E
         LDX   $10
         BCC   L0B1850
         INX
L0B1850  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         PEI   $0C
         PEI   $0A
         JSL   L151412
         LDA   #$0004
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L0B186C
         INX
L0B186C  PHX
         PHA
         JSL   L151412
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
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

L0B1890  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $0E
         PHY
         PHY
         LDA   L0553C5
         LDX   L0553C7
         PHX
         PHA
         JSL   L151301
         LDA   $0C
         ASL
         ASL
         ASL
         ASL
         JSL   L150488
         JSL   L150F53
         STA   $01
         PHY
         LDA   L0553C5
         LDX   L0553C7
         PHX
         PHA
         LDA   $01
         JSL   L150488
         PHX
         PHA
         JSL   L078A05
         PLA
         LSR
         BCC   L0B18E1
         LDA   #$0001
         STA   $0E
         LDA   $0C
         CLC
         ADC   L0553C1
         STA   L0553C1
         BRA   L0B18E8
L0B18E1  PEA   $002D
         JSL   L0B0B7A
L0B18E8  LDA   $0A
         STA   $0C
         LDA   $09
         STA   $0B
         LDA   $07
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L0B18F9  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $0010
         JSL   L0B1890
         PLA
         STA   $0A
         PLY
         PLY
         PLD
         RTL

L0B1910  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0000
         STAL  L051BE6
         LDA   #$0000
         STAL  L051BE8
         LDA   #$0000
         STAL  L051BEA
         LDA   #$0000
         STAL  L051BEC
         LDA   #L051BE6
         STAL  L051BEE
         LDA   #^L051BE6
         STAL  L051BF0
         LDA   #L051C38
         STAL  L051BF2
         LDA   #^L051C38
         STAL  L051BF4
         LDA   #$FFFF
         STAL  L051BF6
         LDA   #$FFFF
         STAL  L051BF8
         LDA   #$FFFF
         STAL  L051BFA
         LDA   #$0000
         STAL  L051BFC
         STAL  L051BFE
         LDA   #$0000
         STAL  L051C00
         STAL  L051C02
         LDA   #$0000
         STAL  L051C04
         LDA   #$0005
         STAL  L051C06
         LDA   L055039
         LDX   L05503B
         STAL  L051C08
         TXA
         STAL  L051C0A
         PLY
         PLY
         PLD
         RTL

L0B199C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0C
         PEI   $0A
         PEA   $0000
         PEA   $000E
         JSL   L071EC5
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

         PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B0D0A
         LDA   $28
         STA   $01
         LDA   $28
         DEC
         BNE   L0B19ED
         LDA   $24
         LDX   $26
         STA   $11
         STX   $13
         LDA   $22
         STA   $0F
L0B19ED  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B1A77
         LDA   $20
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

L0B1A0C  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $0A
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0B1A2A
         INX
L0B1A2A  CLC
         ADC   #$001C
         BCC   L0B1A31
         INX
L0B1A31  STA   $01
         STX   $03
         LDA   [$01]
         BNE   L0B1A41
         PEI   $0A
         JSL   L0B1ADF
         BRA   L0B1A67
L0B1A41  LDA   $0A
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0B1A57
         INX
L0B1A57  CLC
         ADC   #$0022
         BCC   L0B1A5E
         INX
L0B1A5E  STA   $01
         STX   $03
         LDA   #$0001
         STA   [$01]
L0B1A67  LDA   $08
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

L0B1A77  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L055387
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L0B1A8F
         EOR   #$8000
L0B1A8F  BPL   L0B1ACD
         LDA   #$0001
         STA   $03
L0B1A96  PHY
         LDA   $03
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0B1AAD
         INX
L0B1AAD  PHX
         PHA
         PEI   $10
         PEI   $0E
         JSL   L0B1169
         PLA
         LSR
         BCC   L0B1AC3
         PEI   $03
         JSL   L0B1A0C
         BRA   L0B1ACD
L0B1AC3  LDA   $03
         CMP   $01
         BEQ   L0B1ACD
         INC   $03
         BRA   L0B1A96
L0B1ACD  LDA   $0C
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

L0B1ADF  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $12
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0B1AFD
         INX
L0B1AFD  STA   $01
         STX   $03
         LDY   #$001A
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L07185A
         LDY   #$0026
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L07185A
         LDY   #$002A
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L07185A
         LDY   #$001E
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BEQ   L0B1B95
         LDY   #$0020
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L0718BF
         LDY   #$0020
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $05
         STX   $07
L0B1B62  LDA   [$05]
         BEQ   L0B1B86
         LDY   #$000A
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         JSL   L07185A
         LDA   $05
         LDX   $07
         CLC
         ADC   #$000E
         BCC   L0B1B80
         INX
L0B1B80  STA   $05
         STX   $07
         BRA   L0B1B62
L0B1B86  LDY   #$0020
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L07185A
L0B1B95  LDA   $12
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0B1BAB
         INX
L0B1BAB  PHX
         PHA
         PEA   $0000
         PEA   $002C
         JSL   L071EC5
         LDA   #$0000
         STA   [$01]
         LDA   #$0000
         LDY   #$0022
         STA   [$01],Y
         LDA   $10
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

L0B1BD6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0000
         PEA   $0002
         LDA   L05539F
         LDX   L0553A1
         PHX
         PHA
         JSL   L1512FB
         LDA   L05539F
         LDX   L0553A1
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDA   #$0000
         STA   [$01]
         PLY
         PLY
         PLD
         RTL

L0B1C0F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         LDA   L0553C5
         LDX   L0553C7
         PHX
         PHA
         JSL   L0718FA
         PLA
         STA   $0A
         PLY
         PLY
         PLD
         RTL

L0B1C2B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   $16
         LDX   $18
         STA   $01
         STX   $03
         LDA   $14
         CLC
         ADC   [$01]
         STA   [$01]
         LDY   #$0002
         LDA   [$01],Y
         STA   $0B
         LDA   [$01]
         SEC
         SBC   $0B
         BNE   L0B1C53
         BRL   L0B1DDC
L0B1C53  BVS   L0B1C58
         EOR   #$8000
L0B1C58  BMI   L0B1C5D
         BRL   L0B1DDC
L0B1C5D  LDA   $14
         SEC
         SBC   #$0008
         BEQ   L0B1C72
         BVS   L0B1C6A
         EOR   #$8000
L0B1C6A  BPL   L0B1C72
         LDA   $14
         STA   $05
         BRA   L0B1C77
L0B1C72  LDA   #$0008
         STA   $05
L0B1C77  LDY   #$0002
         LDA   [$01],Y
         BEQ   L0B1C81
         BRL   L0B1D4E
L0B1C81  LDA   #$0006
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B1C8C
         INX
L0B1C8C  STA   $0B
         STX   $0D
         PHY
         PHY
         PEA   $0000
         PEA   $0002
         LDA   L0553D9
         PHA
         JSL   L0B249C
         PLA
         STA   [$0B]
         PLA
         LDY   #$0002
         STA   [$0B],Y
         LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   $0B
         STX   $0D
         LDA   #$0000
         STA   [$0B]
         LDA   $05
         LDY   #$0002
         STA   [$01],Y
         LDA   #$000A
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B1CDA
         INX
L0B1CDA  STA   $0B
         STX   $0D
         PHY
         PHY
         LDY   #$0002
         LDA   [$01],Y
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B1CF6
         DEX
L0B1CF6  PHX
         PHA
         LDA   L0553D9
         PHA
         JSL   L0B249C
         PLA
         STA   [$0B]
         PLA
         LDY   #$0002
         STA   [$0B],Y
         LDY   #$000A
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L0B1D4B
         PEA   $002D
         JSL   L0B0B7A
         LDA   #$0001
         LDY   #$0002
         STA   [$01],Y
         LDA   #$000A
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B1D2E
         INX
L0B1D2E  STA   $0B
         STX   $0D
         PHY
         PHY
         PEA   $0000
         PEA   $000E
         LDA   L0553D9
         PHA
         JSL   L0B249C
         PLA
         STA   [$0B]
         PLA
         LDY   #$0002
         STA   [$0B],Y
L0B1D4B  BRL   L0B1DDC
L0B1D4E  LDY   #$0002
         LDA   $05
         CLC
         ADC   [$01],Y
         LDY   #$0002
         STA   [$01],Y
         PHY
         LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$0002
         LDA   [$01],Y
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B1D7D
         DEX
L0B1D7D  PHX
         PHA
         JSL   L078A05
         PLA
         LSR
         BCS   L0B1DDC
         PEA   $002D
         JSL   L0B0B7A
         LDY   #$0002
         LDA   [$01],Y
         SEC
         SBC   $05
         INC
         LDY   #$0002
         STA   [$01],Y
         LDA   [$01]
         SEC
         SBC   $14
         INC
         STA   [$01]
         LDA   #$0001
         STA   $14
         PHY
         LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$0002
         LDA   [$01],Y
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B1DCB
         DEX
L0B1DCB  PHX
         PHA
         JSL   L078A05
         PLA
         LSR
         BCS   L0B1DDC
         PEA   $202A
         JSL   L07272E
L0B1DDC  LDY   #$000C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         PHX
         PHA
         LDA   [$01]
         SEC
         SBC   $14
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B1E0A
         DEX
L0B1E0A  JSL   L150F53
         STA   $07
         STX   $09
         PEI   $09
         PEI   $07
         LDA   $14
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B1E29
         DEX
L0B1E29  PHX
         PHA
         JSL   L071EC5
         LDA   $12
         STA   $18
         LDA   $11
         STA   $17
         LDA   $0F
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L0B1E41  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $0E
         SEC
         SBC   #$0063
         BEQ   L0B1E60
         BVS   L0B1E56
         EOR   #$8000
L0B1E56  BPL   L0B1E60
         LDA   $0E
         SEC
         SBC   #$0064
         STA   $0E
L0B1E60  LDA   $0E
         STA   $10
         LDA   $08
         STA   $0E
         LDA   $07
         STA   $0D
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L0B1E76  ENT
         PHD
         TSC
         CLC
         ADC   #$F6C4
         TCS
         ADC   #$084F
         TCD
         PHY
         PHY
         PEA   $000A	; AV 202208 from seconds to HyperCard IIgs format
         PEI   $FA
         PEI   $F8
         TDC
         CLC
         ADC   #$00E1	; $E1 
         PEA   $0000	; $E2 
         PHA	; $E3 
         _ConvSeconds	; $E4 
         STAL  L05565D	; $E5 
         PLA	; $E6 
         STA   $D9	; $E7 
         PLX	; $E8 
         STX   $DB	; $E9 
         LDA   $F6
         BPL   L0B1EAB
         BRL   L0B21DF
L0B1EAB  CMP   #$0004
         BMI   L0B1EB3
         BRL   L0B21DF
L0B1EB3  SEC
         SBC   #$0000
         BNE   L0B1EBC
         BRL   L0B1FF4
L0B1EBC  DEC
         BNE   L0B1EC2
         BRL   L0B1F61
L0B1EC2  DEC
         BEQ   L0B1ECE
         DEC
         BNE   L0B1ECB
         BRL   L0B1FF4
L0B1ECB  BRL   L0B21DF
L0B1ECE  PEI   $F4
         PEI   $F2
         PEA   $0000
         TDC
         CLC
         ADC   #$F8D9
         PHA
         LDA   #$00FF
         AND   $E8
         CLC
         ADC   #$0AEF
         PHA
         JSL   L073002
         PEA   ^L04070A
         PEA   L04070A
         PEA   $0000
         TDC
         CLC
         ADC   #$F7D9
         PHA
         LDA   #$00FF
         AND   $E6
         CLC
         ADC   #$0AFE
         DEC
         PHA
         JSL   L073002
         PEA   ^L04070D
         PEA   L04070D
         PEA   $0000
         TDC
         CLC
         ADC   #$F7C5
         PHA
         LDA   #$00FF
         AND   $E5
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L04070F
         PEA   L04070F
         PEA   $0000
         TDC
         CLC
         ADC   #$F7B1
         PHA
         LDA   #$00FF
         AND   $E4
         CLC
         ADC   #$076C	; AV 202208 - 1900
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$F9D9
         PHA
         PEA   $0007
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRL   L0B21DF
L0B1F61  PEI   $F4
         PEI   $F2
         PEA   $0000
         TDC
         CLC
         ADC   #$F8D9
         PHA
         LDA   #$00FF
         AND   $E8
         CLC
         ADC   #$0AF6
         PHA
         JSL   L073002
         PEA   ^L040712
         PEA   L040712
         PEA   $0000
         TDC
         CLC
         ADC   #$F7D9
         PHA
         LDA   #$00FF
         AND   $E6
         CLC
         ADC   #$0B0A
         DEC
         PHA
         JSL   L073002
         PEA   ^L040715
         PEA   L040715
         PEA   $0000
         TDC
         CLC
         ADC   #$F7C5
         PHA
         LDA   #$00FF
         AND   $E5
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L040717
         PEA   L040717
         PEA   $0000
         TDC
         CLC
         ADC   #$F7B1
         PHA
         LDA   #$00FF
         AND   $E4
         CLC
         ADC   #$076C	; AV 202208 - 1900
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$F9D9
         PHA
         PEA   $0007
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRL   L0B21DF
L0B1FF4  PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$F8D9
         PHA
         PEA   $0B16
         JSL   L073002
         PEA   $0100
         JSL   L0313BE
         PHY
         PEA   $0034
         JSL   L151681
         PLA
         STA   $DF
         LDA   $DF
         BPL   L0B2026
         BRL   L0B21DA
L0B2026  CMP   #$0003
         BMI   L0B202E
         BRL   L0B21DA
L0B202E  SEC
         SBC   #$0000
         BEQ   L0B2043
         DEC
         BNE   L0B203A
         BRL   L0B2153
L0B203A  DEC
         BNE   L0B2040
         BRL   L0B20CB
L0B2040  BRL   L0B21DA
L0B2043  PEI   $F4
         PEI   $F2
         PEA   $0000
         TDC
         CLC
         ADC   #$F9C5
         PHA
         LDA   #$00FF
         AND   $E6
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$F9B1
         PHA
         LDA   #$00FF
         AND   $E5
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$F99D
         PHA
         PHY
         LDA   #$00FF
         AND   $E4
         PHA
         PEA   $0000
         PHD
         JSL   L0B1E41
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B20AB
         DEX
L0B20AB  PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$F9D9
         PHA
         PEA   $0005
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRL   L0B21DD
L0B20CB  PEI   $F4
         PEI   $F2
         PEA   $0000
         TDC
         CLC
         ADC   #$F9C5
         PHA
         PHY
         LDA   #$00FF
         AND   $E4
         PHA
         PEA   $0000
         PHD
         JSL   L0B1E41
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B20F1
         DEX
L0B20F1  PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$F9B1
         PHA
         LDA   #$00FF
         AND   $E6
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$F99D
         PHA
         LDA   #$00FF
         AND   $E5
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$F9D9
         PHA
         PEA   $0005
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRL   L0B21DD
L0B2153  PEI   $F4
         PEI   $F2
         PEA   $0000
         TDC
         CLC
         ADC   #$F9C5
         PHA
         LDA   #$00FF
         AND   $E5
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$F9B1
         PHA
         LDA   #$00FF
         AND   $E6
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$F99D
         PHA
         PHY
         LDA   #$00FF
         AND   $E4
         PHA
         PEA   $0000
         PHD
         JSL   L0B1E41
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B21BB
         DEX
L0B21BB  PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$F9D9
         PHA
         PEA   $0005
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRA   L0B21DD
L0B21DA  BRL   L0B2043
L0B21DD  BRA   L0B21DF
L0B21DF  LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$0948
         TCS
         RTL

L0B21F1  ENT
         PHD
         TSC
         CLC
         ADC   #$F9E6
         TCS
         ADC   #$052D
         TCD
         PHY
         PHY
         PEA   $000A
         PEI   $FA
         PEI   $F8
         TDC
         CLC
         ADC   #$00E1
         PEA   $0000
         PHA
         _ConvSeconds
         STAL  L05565D
         PLA
         STA   $D3
         PLX
         STX   $D5
         STZ   $DD
         PHY
         PEA   $0035
         JSL   L151681
         PLA
         STA   $DF
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FAD3
         PHA
         PEA   $0B17
         JSL   L073002
         PEA   $0100
         JSL   L0313BE
         LDA   $DF
         BNE   L0B22BF
         LDA   #$00FF
         AND   $E3
         SEC
         SBC   #$000C
         BVS   L0B225E
         EOR   #$8000
L0B225E  BPL   L0B2291
         PEA   $0000
         TDC
         CLC
         ADC   #$FED3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FAD3
         PHA
         PEA   $0B18
         JSL   L073002
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         AND   $E3
         CMP   #$000C
         BEQ   L0B228F
         LDA   #$000C
         STA   $DD
L0B228F  BRA   L0B22BD
L0B2291  PEA   $0000
         TDC
         CLC
         ADC   #$FED3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FAD3
         PHA
         PEA   $0B19
         JSL   L073002
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         AND   $E3
         BNE   L0B22BD
         LDA   #$FFF4
         STA   $DD
L0B22BD  BRA   L0B22DF
L0B22BF  PEA   $0000
         TDC
         CLC
         ADC   #$FED3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FAD3
         PHA
         PEA   $0B1A
         JSL   L073002
         PEA   $0100
         JSL   L0313BE
L0B22DF  LDA   #$00FF
         AND   $E2
         SEC
         SBC   #$000A
         BVS   L0B22ED
         EOR   #$8000
L0B22ED  BMI   L0B232F
         PEA   $0000
         TDC
         CLC
         ADC   #$FDD3
         PHA
         PEA   ^L04071A
         PEA   L04071A
         PEA   $0000
         TDC
         CLC
         ADC   #$FBBF
         PHA
         LDA   #$00FF
         AND   $E2
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FCBD
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0015
         JSL   L0313BE
         BRA   L0B2357
L0B232F  PEA   $0000
         TDC
         CLC
         ADC   #$FDD3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FBBF
         PHA
         LDA   #$00FF
         AND   $E2
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
L0B2357  LDA   #$00FF
         AND   $E3
         SEC
         SBC   $DD
         STA   $DB
         LDA   $F6
         BNE   L0B2368
         BRL   L0B243F
L0B2368  LDA   #$00FF
         AND   $E1
         SEC
         SBC   #$000A
         BVS   L0B2376
         EOR   #$8000
L0B2376  BMI   L0B23B8
         PEA   $0000
         TDC
         CLC
         ADC   #$FCD3
         PHA
         PEA   ^L04071C
         PEA   L04071C
         PEA   $0000
         TDC
         CLC
         ADC   #$FBBF
         PHA
         LDA   #$00FF
         AND   $E1
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FCBD
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0015
         JSL   L0313BE
         BRA   L0B23E0
L0B23B8  PEA   $0000
         TDC
         CLC
         ADC   #$FCD3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FBBF
         PHA
         LDA   #$00FF
         AND   $E1
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
L0B23E0  PEI   $F4
         PEI   $F2
         PEA   $0000
         TDC
         CLC
         ADC   #$FBBF
         PHA
         LDA   $DB
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDD3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCD3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FED3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FBD3
         PHA
         PEA   $0006
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRA   L0B248A
L0B243F  PEI   $F4
         PEI   $F2
         PEA   $0000
         TDC
         CLC
         ADC   #$FBBF
         PHA
         LDA   $DB
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDD3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FED3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FBD3
         PHA
         PEA   $0004
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B248A  LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$0626
         TCS
         RTL

L0B249C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PHY
         PEI   $0E
         PEI   $0C
         PEI   $0A
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $10
         PLX
         STX   $12
         LDAL  L05565D
         BEQ   L0B24C9
         STZ   $10
         STZ   $12
L0B24C9  LDA   $08
         STA   $0E
         LDA   $07
         STA   $0D
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L0B24DB  ENT
         PHD
         TSC
         CLC
         ADC   #$FBFC
         TCS
         ADC   #$031D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE3
         PHA
         PEI   $F6
         PEI   $F4
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE3
         PHA
         PEI   $F2
         PEI   $F0
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FCE3
         PHA
         PEI   $EE
         PEI   $EC
         PEA   $0100
         JSL   L0313BE
         JSL   L0B1BD6
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         LDA   L05539F
         LDX   L0553A1
         PHX
         PHA
         JSL   L03250F
         PLA
         LSR
         BCS   L0B255B
         PEA   $4488
         JSL   L07272E
L0B255B  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE3
         PHA
         LDA   L05539F
         LDX   L0553A1
         PHX
         PHA
         JSL   L03250F
         PLA
         LSR
         BCS   L0B257C
         PEA   $7B4A
         JSL   L07272E
L0B257C  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE3
         PHA
         LDA   L05539F
         LDX   L0553A1
         PHX
         PHA
         JSL   L03250F
         PLA
         LSR
         BCS   L0B259D
         PEA   $2087
         JSL   L07272E
L0B259D  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FCE3
         PHA
         LDA   L05539F
         LDX   L0553A1
         PHX
         PHA
         JSL   L03250F
         PLA
         LSR
         BCS   L0B25BE
         PEA   $69FE
         JSL   L07272E
L0B25BE  PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCE3
         PHA
         JSL   L073C22
         LDA   $EA
         STA   $FA
         LDA   $E9
         STA   $F9
         LDA   $E7
         TCD
         TSC
         CLC
         ADC   #$0416
         TCS
         RTL

L0B25F8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $16
         LDA   $0E
         LDX   $10
         STA   $01
         STX   $03
         PHY
         PHY
         PEI   $0C
         PEI   $0A
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   [$01]
         PLA
         LDY   #$0002
         STA   [$01],Y
         LDA   [$0E]
         LDY   #$0002
         ORA   [$0E],Y
         BNE   L0B262C
         BRA   L0B2646
L0B262C  PEI   $14
         PEI   $12
         LDY   #$0002
         LDA   [$0E],Y
         PHA
         LDA   [$0E]
         PHA
         PEI   $0C
         PEI   $0A
         JSL   L150120
         LDA   #$0001
         STA   $16
L0B2646  LDA   $08
         STA   $14
         LDA   $07
         STA   $13
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L0B2658  PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L0E00CC
         LDA   $0B
         BEQ   L0B268C
         PEI   $0F
         PEI   $0D
         LDA   $03,S
         EOR   #$FFFF
         TAX
         PLA
         EOR   #$FFFF
         PLY
         INC
         BNE   L0B2684
         INX
L0B2684  PHX
         PHA
         JSL   L0E0DE2
         BRA   L0B26C5
L0B268C  PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEA   $000D
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         JSL   L0E0C71
L0B26C5  TSC
         CLC
         ADC   #$001A
         TCS
         PLD
         RTL

L0B26CD  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L0E0678
         PLA
         EOR   #$0001
         PHA
         JSL   L0E0E4B
         PLY
         PLY
         PLD
         RTL

L0B26E7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   L055387
         SEC
         SBC   #$0040
         BVS   L0B26FB
         EOR   #$8000
L0B26FB  BMI   L0B270C
         LDA   L055387
         INC
         STA   L055387
         LDA   L055387
         STA   $10
         BRL   L0B2812
L0B270C  LDA   #$0001
         STA   $05
L0B2711  LDA   $05
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         LDAL  L0510DE,X
         BNE   L0B2729
         LDA   $05
         STA   $10
         BRL   L0B2812
L0B2729  LDA   #$0040
         CMP   $05
         BEQ   L0B2734
         INC   $05
         BRA   L0B2711
L0B2734  PHY
         JSL   L150705
         PLA
         BPL   L0B2740
         EOR   #$FFFF
         INC
L0B2740  PHA
         PEA   $0040
         JSL   L150318
         PLX
         PLX
         INC
         STA   L055385
         LDA   #$0001
         STA   $05
L0B2753  LDA   L055385
         INC
         STA   L055385
         LDA   L055385
         SEC
         SBC   #$0040
         BEQ   L0B2770
         BVS   L0B2768
         EOR   #$8000
L0B2768  BPL   L0B2770
         LDA   #$0001
         STA   L055385
L0B2770  LDA   L055385
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0B2787
         INX
L0B2787  STA   $01
         STX   $03
         LDX   #$0000
         LDY   #$001C
         LDA   [$01],Y
         BNE   L0B2796
         INX
L0B2796  TXA
         BEQ   L0B27FD
         LDX   #$0000
         LDA   #$0004
         CMP   [$01]
         BEQ   L0B27A4
         INX
L0B27A4  TXA
         BNE   L0B27E9
         PHA
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   L05502B
         BNE   L0B27BA
         CPX   L05502D
L0B27BA  BNE   L0B27C1
         LDA   #$0000
         BRA   L0B27C4
L0B27C1  LDA   #$0001
L0B27C4  BEQ   L0B27E6
         PHA
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   L055039
         BNE   L0B27D9
         CPX   L05503B

*

L0B27D9  BNE   L0B27E0
         LDA   #$0000
         BRA   L0B27E3
L0B27E0  LDA   #$0001
L0B27E3  AND   $01,S
         PLX
L0B27E6  ORA   $01,S
         PLX
L0B27E9  CMP   #$0000
         BEQ   L0B27FD
         LDA   L055385
         PHA
         JSL   L0B1ADF
         LDA   L055385
         STA   $10
         BRA   L0B2812
L0B27FD  LDA   #$0040
         CMP   $05
         BEQ   L0B2809
         INC   $05
         BRL   L0B2753
L0B2809  STZ   $10
         PEA   $004B
         JSL   L0B0B7A
L0B2812  PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0B2819  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD6
         TCS
         TCD
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEI   $32
         PEI   $30
         PEA   $0020
         JSL   L0313BE
         LDA   $34
         LDX   $36
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BMI   L0B2869
         BEQ   L0B2869
         PHY
         PEI   $36
         PEI   $34
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L0B01D3
         PLA
         STA   $25
         LDA   $25
         BEQ   L0B2869
         LDA   $25
         STA   $38
         BRA   L0B288C
L0B2869  PEI   $36
         PEI   $34
         PEA   $0001
         JSL   L0B1C2B
         LDA   [$01]
         STA   $38
         PEI   $36
         PEI   $34
         LDA   [$01]
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L0B3DB3
L0B288C  LDA   $2E
         STA   $36
         LDA   $2D
         STA   $35
         LDA   $2B
         TCD
         TSC
         CLC
         ADC   #$0034
         TCS
         RTL

L0B289E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0553B5
         LDX   L0553B7
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         LDA   $0A
         JSL   L150488
         JSL   L150F53
         STA   $0C
         STX   $0E
         LDA   $08
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

L0B28E4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0553B5
         LDX   L0553B7
         STA   $01
         STX   $03
         LDY   #$0008
         LDA   [$01],Y
         DEC
         LDY   #$0008
         STA   [$01],Y
         PEA   ^L051BDE
         PEA   L051BDE
         PHY
         PHY
         LDY   #$0006
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$0008
         LDA   [$01],Y
         PHA
         JSL   L0B062C
         PEA   $0008
         JSL   L0313BE
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0B292B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0553B9
         LDX   L0553BB
         STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         STA   L055391
         LDY   #$0006
         LDA   [$01],Y
         CMP   L055371
         BEQ   L0B2959
         LDY   #$0006
         LDA   [$01],Y
         PHA
         JSL   L0B2A91
L0B2959  LDA   #$8001
         STA   L055395
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0B2965  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $0E
         LDX   $10
         STA   $01
         STX   $03
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$0008
         BCC   L0B2982
         INX
L0B2982  STA   $05
         STX   $07
         LDA   [$01]
         CMP   [$05]
         BEQ   L0B2993
         LDA   [$01]
         PHA
         JSL   L0B2BBB
L0B2993  LDY   #$0002
         LDA   [$01],Y
         PHA
         JSL   L0B29AF
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

L0B29AF  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $12
         STA   $07
         LDA   $07
         SEC
         SBC   L0553C3
         BVS   L0B29C6
         EOR   #$8000
L0B29C6  BMI   L0B29F0
         LDA   $07
         INC
         STA   $03
         LDA   L0553C3
         STA   $01
         LDA   $01
         SEC
         SBC   $03
         BVS   L0B29DC
         EOR   #$8000
L0B29DC  BPL   L0B29F0
         LDA   $03
         STA   $05
L0B29E2  JSL   L0E0000
         LDA   $05
         CMP   $01
         BEQ   L0B29F0
         INC   $05
         BRA   L0B29E2
L0B29F0  LDA   $10
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

L0B2A02  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $0E
         LDX   $10
         STA   $01
         STX   $03
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$0008
         BCC   L0B2A1F
         INX
L0B2A1F  STA   $05
         STX   $07
         LDA   [$05]
         STA   [$01]
         LDA   #$0002
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B2A32
         INX
L0B2A32  PHX
         PHA
         JSL   L0B2A4A
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

L0B2A4A  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0553C3
         STA   [$0A]
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

L0B2A68  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055371
         DEC
         ASL
         TAX
         LDA   $0A
         STAL  L050AEA,X
         LDA   $0A
         STA   L05536F
         LDA   $08
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

L0B2A91  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $0A
         STA   L055371
         LDA   $0A
         BMI   L0B2AB3
         BEQ   L0B2AB3
         LDA   L055371
         DEC
         ASL
         TAX
         LDAL  L050AEA,X
         STA   L05536F
         BRA   L0B2AB6
L0B2AB3  STZ   L05536F
L0B2AB6  LDA   $08
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

L0B2AC6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0553A7
         LDX   L0553A9
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDA   #$00FF
         AND   [$01]
         BEQ   L0B2AF5
         PEA   ^L040760
         PEA   L040760
         JSL   L0B2D94
L0B2AF5  PLY
         PLY
         PLD
         RTL

L0B2AF9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $10
         ORA   $12
         BNE   L0B2B23
         STZ   L0553B5
         STZ   L0553B7
         PEA   ^L051BDE
         PEA   L051BDE
         PEA   ^L050BEA
         PEA   L050BEA
         PEA   $0008
         JSL   L0313BE
         BRL   L0B2BA9
L0B2B23  LDA   $0E
         BEQ   L0B2B71
         LDA   #$0000
         LDY   #$0014
         STA   [$10],Y
         LDA   L0553B5
         ORA   L0553B7
         BNE   L0B2B41
         LDA   #$0001
         LDY   #$0012
         STA   [$10],Y
         BRA   L0B2B6F
L0B2B41  LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$0012
         BCC   L0B2B4E
         INX
L0B2B4E  STA   $05
         STX   $07
         LDA   [$05]
         PHA
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$0014
         BCC   L0B2B62
         INX
L0B2B62  STA   $05
         STX   $07
         PLA
         CLC
         ADC   [$05]
         LDY   #$0012
         STA   [$10],Y
L0B2B6F  BRA   L0B2B71
L0B2B71  LDA   $10
         LDX   $12
         STA   L0553B5
         STX   L0553B7
         LDA   L0553B5
         LDX   L0553B7
         STA   $01
         STX   $03
         PEA   ^L051BDE
         PEA   L051BDE
         PHY
         PHY
         LDY   #$0006
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$0008
         LDA   [$01],Y
         PHA
         JSL   L0B062C
         PEA   $0008
         JSL   L0313BE
L0B2BA9  LDA   $0C
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

L0B2BBB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0553B5
         LDX   L0553B7
         STA   $01
         STX   $03
         LDA   $0E
         LDY   #$0008
         STA   [$01],Y
         PEA   ^L051BDE
         PEA   L051BDE
         PHY
         PHY
         LDY   #$0006
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$0008
         LDA   [$01],Y
         PHA
         JSL   L0B062C
         PEA   $0008
         JSL   L0313BE
         LDA   $0C
         STA   $0E
         LDA   $0B
         STA   $0D
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L0B2C0A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCE
         TCS
         TCD
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $3A
         PEI   $38
         PEA   $0020
         JSL   L0313BE
         STZ   $27
         STZ   $29
         STZ   $2B
         STZ   $25
         LDA   #$00FF
         AND   $03
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L0B2C40
         EOR   #$8000
L0B2C40  BPL   L0B2CA4
         LDA   #$0001
         STA   $2D
L0B2C47  TDC
         CLC
         ADC   #$0003
         STA   $2F
         STZ   $31
         LDY   $2D
         LDA   #$00FF
         AND   [$2F],Y
         STA   $23
         LDA   #$002E
         CMP   $23
         BNE   L0B2C67
         LDA   #$0001
         STA   $25
         BRA   L0B2C9A
L0B2C67  LDX   #$0000
         LDA   #$0023
         CMP   $23
         BNE   L0B2C72
         INX
L0B2C72  TXA
         AND   $25
         BEQ   L0B2C7E
         LDA   $2B
         INC
         STA   $2B
         BRA   L0B2C9A
L0B2C7E  LDA   #$0030
         CMP   $23
         BNE   L0B2C9A
         LDA   $25
         BEQ   L0B2C95
         LDA   $29
         INC
         STA   $29
         LDA   $2B
         INC
         STA   $2B
         BRA   L0B2C9A
L0B2C95  LDA   $27
         INC
         STA   $27
L0B2C9A  LDA   $2D
         CMP   $01
         BEQ   L0B2CA4
         INC   $2D
         BRA   L0B2C47
L0B2CA4  LDA   $27
         STA   L0553AD
         LDA   $29
         STA   L0553AF
         LDA   $2B
         STA   L0553B1
         PEA   ^L050F74
         PEA   L050F74
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0020
         JSL   L0313BE
         LDA   $36
         STA   $3A
         LDA   $35
         STA   $39
         LDA   $33
         TCD
         TSC
         CLC
         ADC   #$0038
         TCS
         RTL

L0B2CDB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         STZ   $18
         STZ   $07
         STZ   $09
         STZ   $03
         STZ   $05
         PHY
         PEI   $16
         PEI   $14
         JSL   L0718FA
         PLA
         STA   $01
         LDA   L0551F3
         BEQ   L0B2D40
         LDA   L055111
         LDX   L055113
         STA   $03
         STX   $05
         LDA   $03
         ORA   $05
         BEQ   L0B2D3E
         PEI   $05
         PEI   $03
         JSL   L15058C
         LDY   #$0002
         LDA   [$14],Y
         PHA
         LDA   [$14]
         PHA
         PHY
         PHY
         LDY   #$0002
         LDA   [$14],Y
         PHA
         LDA   [$14]
         PHA
         JSL   L071C98
         PLA
         PLX
         PHA
         PEI   $05
         PEI   $03
         JSL   L15168D
         LDA   #$0001
         STA   $18
L0B2D3E  BRA   L0B2D78
L0B2D40  LDA   L05511F
         BEQ   L0B2D78
         LDA   L055121
         LDX   L055123
         STA   $07
         STX   $09
         LDA   $07
         ORA   $09
         BEQ   L0B2D78
         PEA   $0009
         PEI   $16
         PEI   $14
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $09
         PEI   $07
         JSL   L150AEC
         LDA   #$0001
         STA   $18
L0B2D78  PEI   $16
         PEI   $14
         PEI   $01
         JSL   L0718DA
         LDA   $12
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

L0B2D94  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF8
         TCS
         ADC   #$0015
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FFEB
         AND   $00,X
         INC
         STA   $ED
         PHY
         LDA   L0553A7
         LDX   L0553A9
         PHX
         PHA
         LDA   $ED
         JSL   L150488
         PHX
         PHA
         JSL   L078A05
         PLA
         LSR
         BCS   L0B2DDE
         PEA   $2338
         JSL   L07272E
L0B2DDE  PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         JSL   L071F3F
         LDA   L0553A7
         LDX   L0553A9
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         PHX
         PHA
         LDA   $ED
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$010E
         TCS
         RTL

L0B2E1F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFBE
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $4E
         PEI   $4C
         PEA   $0030
         JSL   L0313BE
         STZ   $50
         LDA   $01
         DEC
         DEC
         BEQ   L0B2E46
         BRL   L0B2F5E
L0B2E46  PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L0D0F6E
         PLA
         STA   $3D
         LDA   $3D
         BNE   L0B2E61
         BRL   L0B2F5E
L0B2E61  LDAL  L05328D
         CMP   $3D
         BNE   L0B2E7E
         LDA   L055129
         LDX   L05512B
         CMP   $03
         BNE   L0B2E75
         CPX   $05
L0B2E75  BNE   L0B2E7E
         PEA   $0000
         JSL   L09091E
L0B2E7E  LDA   $3D
         STA   $3B
         LDA   $03
         LDX   $05
         CMP   $0B
         BNE   L0B2E8C
         CPX   $0D
L0B2E8C  BNE   L0B2E96
         LDA   $3B
         EOR   #$FFFF
         INC
         STA   $3B
L0B2E96  PHY
         PEI   $4A
         PEI   $48
         JSL   L0718FA
         PLA
         STA   $31
         PHY
         PEI   $09
         PEI   $07
         PEI   $0D
         PEI   $0B
         PEI   $3B
         LDY   #$0002
         LDA   [$48],Y
         PHA
         LDA   [$48]
         PHA
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         JSL   L07D80F
         PLA
         STA   $33
         PEI   $4A
         PEI   $48
         PEI   $31
         JSL   L0718DA
         LDA   $33
         BEQ   L0B2F15
         LDA   $33
         DEC
         BMI   L0B2F13
         CMP   #$0004
         BPL   L0B2F13
         SEC
         SBC   #$0000
         BEQ   L0B2EEF
         DEC
         BEQ   L0B2EF8
         DEC
         BEQ   L0B2F01
         DEC
         BEQ   L0B2F0A
         BRA   L0B2F13
L0B2EEF  PEA   $0017
         JSL   L0B0B7A
         BRA   L0B2F13
L0B2EF8  PEA   $0028
         JSL   L0B0B7A
         BRA   L0B2F13
L0B2F01  PEA   $002D
         JSL   L0B0B7A
         BRA   L0B2F13
L0B2F0A  PEA   $0002
         JSL   L0B0B7A
         BRA   L0B2F13
L0B2F13  BRA   L0B2F5E
L0B2F15  LDA   $35
         BEQ   L0B2F59
         LDA   L05501F
         LDX   L055021
         CMP   $07
         BNE   L0B2F25
         CPX   $09
L0B2F25  BEQ   L0B2F2C
         LDA   #$0000
         BRA   L0B2F2F
L0B2F2C  LDA   #$0001
L0B2F2F  PHA
         LDA   L055027
         LDX   L055029
         CMP   $0B
         BNE   L0B2F3C
         CPX   $0D
L0B2F3C  BEQ   L0B2F43
         LDA   #$0000
         BRA   L0B2F46
L0B2F43  LDA   #$0001
L0B2F46  ORA   $01,S
         PLX
         LSR
         BCC   L0B2F59
         PEI   $05
         PEI   $03
         PEI   $3D
         PEA   $0000
         JSL   L0876F4
L0B2F59  LDA   #$0001
         STA   $50
L0B2F5E  LDA   $46
         STA   $4E
         LDA   $45
         STA   $4D
         LDA   $43
         TCD
         TSC
         CLC
         ADC   #$004C
         TCS
         RTL

L0B2F70  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$000D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         JSL   L0E06AC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         JSL   L09873C
         TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L0B2F9D  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0553C5
         LDX   L0553C7
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0B2FC4
         DEX
L0B2FC4  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0005
         BCC   L0B2FDC
         INX
L0B2FDC  STA   $01
         STX   $03
         LDA   $0A
         SEP   #$20
         STA   [$01]
         REP   #$20
         LDA   $08
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

         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0553C5
         LDX   L0553C7
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0B301F
         DEX
L0B301F  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0004
         BCC   L0B3037
         INX
L0B3037  STA   $01
         STX   $03
         LDA   $0A
         SEP   #$20
         STA   [$01]
         REP   #$20
         LDA   $08
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

         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0010
         CLC
         ADC   L0553C3
         STA   $01
         LDA   L0553C1
         SEC
         SBC   $01
         BEQ   L0B3096
         BVS   L0B3071
         EOR   #$8000
L0B3071  BPL   L0B3096
         LDA   #$0010
         CLC
         ADC   L0553C3
         STA   L0553C1
         LDA   L0553C1
         ASL
         ASL
         ASL
         ASL
         JSL   L150488
         PHX
         PHA
         LDA   L0553C5
         LDX   L0553C7
         PHX
         PHA
         JSL   L1512FB
L0B3096  PLY
         PLY
         PLD
         RTL

L0B309A  ENT
         PHD
         TSC
         CLC
         ADC   #$FF40
         TCS
         TCD
         STZ   $CE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0940E5
         PHY
         PHY
         PEI   $CC
         PEI   $CA
         JSL   L0735A8
         PLA
         STA   $B9
         PLX
         STX   $BB
         LDA   $B9
         ORA   $BB
         BNE   L0B30C9
         BRA   L0B3133
L0B30C9  PHY
         PHY
         PEI   $BB
         PEI   $B9
         JSL   L078841
         PLA
         STA   $B5
         PLX
         STX   $B7
         PEI   $BB
         PEI   $B9
         JSL   L07185A
         LDA   #$0002
         STA   $5D
         LDA   #$0001
         LDX   #$0000
         STA   $63
         STX   $65
         LDA   #$0006
         STA   $89
         PHY
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         LSR
         BCS   L0B3109
         BRA   L0B3133
L0B3109  PEI   $C8
         PEI   $C6
         JSL   L0B0D0A
         LDA   #$0004
         STA   [$C6]
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         LSR
         BCC   L0B312F
         LDA   #$0001
         STA   $CE
         BRA   L0B3133
L0B312F  JSL   L072314
L0B3133  LDA   $C4
         STA   $CC
         LDA   $C3
         STA   $CB
         LDA   $C1
         TCD
         TSC
         CLC
         ADC   #$00CA
         TCS
         RTL

L0B3145  ENT
         PHD
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
         LDA   L0553C5
         LDX   L0553C7
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0B3175
         DEX
L0B3175  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   $0010
         JSL   L0313BE
         LDA   L0553C3
         DEC
         STA   L0553C3
         PEI   $24
         PEI   $22
         PEI   $20
         PEI   $1E
         PEI   $1C
         JSL   L0E0656
         LDA   L0553C3
         INC
         STA   L0553C3
         LDA   L0553C5
         LDX   L0553C7
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0B31CA
         DEX
L0B31CA  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0010
         JSL   L0313BE
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

L0B31FF  PHD
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
         LDA   L0553C5
         LDX   L0553C7
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0B322F
         DEX
L0B322F  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   $0010
         JSL   L0313BE
         LDA   L0553C3
         DEC
         STA   L0553C3
         JSL   L0E0000
         LDA   L0553C3
         INC
         STA   L0553C3
         LDA   L0553C5
         LDX   L0553C7
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0B327A
         DEX
L0B327A  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0010
         JSL   L0313BE
         TSC
         CLC
         ADC   #$0014
         TCS
         PLD
         RTL

L0B32A5  ENT
         PHD
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
         LDA   L0553C5
         LDX   L0553C7
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0B32D5
         DEX
L0B32D5  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   $0010
         JSL   L0313BE
         LDA   L0553C5
         LDX   L0553C7
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0B330E
         DEX
L0B330E  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         LDA   L0553C5
         LDX   L0553C7
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         PHX
         PHA
         LDA   L0553C3
         DEC
         JSL   L150488
         TAY
         BNE   L0B3341
         DEX
L0B3341  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   $0010
         JSL   L0313BE
         LDA   L0553C5
         LDX   L0553C7
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         PHX
         PHA
         LDA   L0553C3
         DEC
         JSL   L150488
         TAY
         BNE   L0B337B
         DEX
L0B337B  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0010
         JSL   L0313BE
         TSC
         CLC
         ADC   #$0014
         TCS
         PLD
         RTL

         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   #$0001
         STA   $10
         PHY
         JSL   L0314F6
         PLA
         STA   $01
         LDA   $01
         JSL   L150488
         STA   $03
         STX   $05
         JSL   L0E0000
         PEI   $05
         PEI   $03
         JSL   L0E0E79
         PEI   $01
         JSL   L0B2F9D
         PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0B33DE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $24
         PEI   $22
         PEA   $0018
         JSL   L0313BE
         LDX   #$0000
         LDA   #$0004
         CMP   $01
         BNE   L0B3405
         INX
L0B3405  TXA
         BEQ   L0B3422
         PHA
         LDA   L05502B
         LDX   L05502D
         CMP   $03
         BNE   L0B3415
         CPX   $05
L0B3415  BEQ   L0B341C
         LDA   #$0000
         BRA   L0B341F
L0B341C  LDA   #$0001
L0B341F  AND   $01,S
         PLX
L0B3422  STA   $26
         LDA   $20
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

L0B3436  PHD
         TSC
         CLC
         ADC   #$FDFC
         TCS
         ADC   #$010F
         TCD
         LDAL  L040761
         LDX   #$FFF1
         SEP   #$20
         STA   $00,X
         REP   #$20
         LDA   $FA
         BNE   L0B346B
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   ^L040762
         PEA   L040762
         PEA   $0006
         JSL   L0313BE
         BRL   L0B360E
L0B346B  LDA   #$0001
         AND   $FA
         BEQ   L0B34A1
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   ^L040768
         PEA   L040768
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF1
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B34A1  LDA   #$0002
         AND   $FA
         BEQ   L0B34D7
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   ^L04076E
         PEA   L04076E
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF1
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B34D7  LDA   #$0004
         AND   $FA
         BEQ   L0B350D
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   ^L040776
         PEA   L040776
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF1
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B350D  LDA   #$0008
         AND   $FA
         BEQ   L0B3543
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   ^L040781
         PEA   L040781
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF1
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B3543  LDA   #$0010
         AND   $FA
         BEQ   L0B3579
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   ^L04078A
         PEA   L04078A
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF1
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B3579  LDA   #$0020
         AND   $FA
         BEQ   L0B35AF
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   ^L040792
         PEA   L040792
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF1
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B35AF  LDA   #$0040
         AND   $FA
         BEQ   L0B35E5
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   ^L04079C
         PEA   L04079C
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF1
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B35E5  LDA   #$00FF
         LDX   #$FFF1
         AND   $00,X
         CLC
         ADC   #$FFF1
         TAX
         LDA   #$00FF
         AND   $00,X
         CMP   #$002C
         BNE   L0B360E
         LDA   #$00FF
         LDX   #$FFF1
         AND   $00,X
         DEC
         LDX   #$FFF1
         SEP   #$20
         STA   $00,X
         REP   #$20
L0B360E  PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   $0100
         JSL   L0313BE
         LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$0208
         TCS
         RTL

         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$000D
         TCD
         LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L0B364D
         CPX   L0553BB
L0B364D  BNE   L0B3662
         PEI   $FE
         PEI   $FC
         PEA   ^L0407A4
         PEA   L0407A4
         PEA   $0014
         JSL   L0313BE
         BRA   L0B3697
L0B3662  LDA   L0553B9
         LDX   L0553BB
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         JSL   L0B1388
         PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         PEA   $0100
         JSL   L0313BE
L0B3697  TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L0B369F  ENT
         PHD
         TSC
         CLC
         ADC   #$FDFC
         TCS
         ADC   #$010D
         TCD
         LDAL  L051BDE
         SEC
         SBC   #$0003
         BEQ   L0B36D4
         BVS   L0B36B9
         EOR   #$8000
L0B36B9  BPL   L0B36D4
         LDAL  L051BE4
         PHA
         LDAL  L051BE2
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         JSL   L0B1388
         BRA   L0B370B
L0B36D4  LDAL  L051BDE
         DEC
         DEC
         BNE   L0B36FE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEF3
         PHA
         PEA   $0056
         JSL   L0B127A
         PEA   $0100
         JSL   L0313BE
         BRA   L0B370B
L0B36FE  LDAL  L0407B8
         LDX   #$FFF3
         SEP   #$20
         STA   $00,X
         REP   #$20
L0B370B  PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         PEA   $0100
         JSL   L0313BE
         TSC
         CLC
         ADC   #$0204
         TCS
         PLD
         RTL

L0B3727  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0553C5
         LDX   L0553C7
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0B374E
         DEX
L0B374E  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $0A
         STX   $0C
         PLY
         PLY
         PLD
         RTL

L0B3773  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0553C5
         LDX   L0553C7
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0B379A
         DEX
L0B379A  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0004
         BCC   L0B37B2
         INX
L0B37B2  STA   $01
         STX   $03
         LDA   #$00FF
         AND   [$01]
         BIT   #$0080
         BEQ   L0B37C3
         ORA   #$FF80
L0B37C3  JSL   L150488
         STA   $0A
         STX   $0C
         PLY
         PLY
         PLD
         RTL

L0B37CF  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0553C5
         LDX   L0553C7
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         LDA   L0553C3
         DEC
         JSL   L150488
         TAY
         BNE   L0B37F7
         DEX
L0B37F7  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $0A
         STX   $0C
         PLY
         PLY
         PLD
         RTL

L0B381C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L055363
         BEQ   L0B383A
         PHY
         PEA   ^L05098E
         PEA   L05098E
         PEA   $0000
         JSL   L095416
         PLA
         STA   $01
L0B383A  PLY
         PLY
         PLY
         PLD
         RTL

L0B383F  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF2
         TCS
         ADC   #$001B
         TCD
         LDA   L0553D5
         LDX   L0553D7
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STA   $EB
         STX   $ED
         LDA   #$0001
         STA   $E5
L0B3865  LDX   #$0000
         LDA   #$00FF
         AND   [$EB]
         BIT   #$0080
         BEQ   L0B3875
         ORA   #$FF80
L0B3875  CMP   $FA
         BNE   L0B387A
         INX
L0B387A  TXA
         BEQ   L0B38F0
         LDX   #$0000
         LDY   #$0001
         LDA   #$00FF
         AND   [$EB],Y
         BIT   #$0080
         BEQ   L0B3890
         ORA   #$FF80
L0B3890  CMP   $F8
         BNE   L0B3895
         INX
L0B3895  TXA
         BEQ   L0B38F0
         LDA   L0553CD
         LDX   L0553CF
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         PHX
         PHA
         LDY   #$0002
         LDA   [$EB],Y
         JSL   L150488
         JSL   L150F53
         STA   $E7
         STX   $E9
         PEI   $E9
         PEI   $E7
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         LDA   #$00FF
         AND   [$E7]
         INC
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         PEA   $0100
         JSL   L0313BE
         BRA   L0B3919
L0B38F0  LDA   $EB
         LDX   $ED
         CLC
         ADC   #$0004
         BCC   L0B38FB
         INX
L0B38FB  STA   $EB
         STX   $ED
         LDA   #$0400
         CMP   $E5
         BEQ   L0B390B
         INC   $E5
         BRL   L0B3865
L0B390B  LDAL  L0407B9
         SEP   #$20
         STA   [$FC]
         REP   #$20
         JSL   L072314
L0B3919  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0114
         TCS
         RTL

L0B392B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L05535D
         BNE   L0B393B
         BRL   L0B39BB
L0B393B  PHY
         JSL   L0301E4
         PLA
         BEQ   L0B3945
         BRA   L0B39BB
L0B3945  LDA   L05534F
         LDX   L055351
         PHX
         PHA
         JSL   L07185A
         STZ   L05534F
         STZ   L055351
         LDA   L05534B
         LDX   L05534D
         PHX
         PHA
         JSL   L07185A
         STZ   L05534B
         STZ   L05534D
         LDA   L05535D
         DEC
         BNE   L0B39A5
         PHY
         JSL   L150B6A
         PLA
         STA   $01
         LDA   L055353
         PHA
         JSL   L150B70
         PEA   $0003
         PEA   $8024
         LDA   L055355
         LDX   L055357
         PHX
         PHA
         JSL   L1510BF
         PEI   $01
         JSL   L150B70
         LDA   L055359
         LDX   L05535B
         PHX
         PHA
         JSL   L07191C
         BRA   L0B39B8
L0B39A5  LDA   L05535D
         DEC
         DEC
         BNE   L0B39B8
         LDA   L055359
         LDX   L05535B
         PHX
         PHA
         JSL   L07185A
L0B39B8  STZ   L05535D
L0B39BB  PLY
         PLY
         PLY
         PLD
         RTL

L0B39C0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0553C5
         LDX   L0553C7
         PHX
         PHA
         PEI   $0A
         JSL   L0718DA
         LDA   $08
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

L0B39E6  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDY   #$0007
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         STA   $01
         STX   $03
         LDY   #$000A
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L0B3A0D
         JSL   L0E0C52
         BRA   L0B3A58
L0B3A0D  LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L0718BF
         LDY   #$000C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         PHX
         PHA
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$0004
         LDA   [$01],Y
         PHA
         JSL   L0E07C5
         LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L07191C
L0B3A58  LDA   $0C
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

L0B3A6A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $14
         LDX   $16
         STA   $01
         STX   $03
         LDY   #$000C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PHX
         PHA
         LDA   $12
         DEC
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B3AA6
         DEX
L0B3AA6  JSL   L150F53
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         BNE   L0B3ADD
         LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L0718BF
         PEA   $0000
         PHD
         JSL   L0B39E6
         LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L07191C
         BRA   L0B3B37
L0B3ADD  LDAL  L051C44
         TAX
         LDAL  L051C42
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PHX
         PHA
         LDY   #$0002
         LDA   [$05],Y
         DEC
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B3B0B
         DEX
L0B3B0B  JSL   L150F53
         STA   $05
         STX   $07
         LDAL  L051C44
         PHA
         LDAL  L051C42
         PHA
         JSL   L0718BF
         PEA   $0000
         PHD
         JSL   L0B39E6
         LDAL  L051C44
         PHA
         LDAL  L051C42
         PHA
         JSL   L07191C
L0B3B37  LDA   $10
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

L0B3B49  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDY   #$0007
         LDA   [$10],Y
         TAX
         DEY
         DEY
         LDA   [$10],Y
         STA   $01
         STX   $03
         LDA   #$0004
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B3B6A
         INX
L0B3B6A  STA   $07
         STX   $09
         PHY
         PHY
         JSL   L0B3773
         PLA
         PLX
         STA   [$07]
         LDA   #$0006
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B3B83
         INX
L0B3B83  STA   $07
         STX   $09
         PHY
         PHY
         JSL   L0314AA
         PLA
         STA   [$07]
         PLA
         LDY   #$0002
         STA   [$07],Y
         LDX   #$0000
         LDY   #$0004
         LDA   [$01],Y
         BNE   L0B3BA1
         INX
L0B3BA1  PHX
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   #$000A
         LDX   #$0000
         JSL   L033477
         BEQ   L0B3BC0
         BVS   L0B3BBE
         EOR   #$8000
L0B3BBE  BMI   L0B3BC5
L0B3BC0  LDA   #$0000
         BRA   L0B3BC8
L0B3BC5  LDA   #$0001
L0B3BC8  AND   $01,S
         PLX
         LSR
         BCC   L0B3BFE
         LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L07185A
         LDA   #$000A
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B3BE8
         INX
L0B3BE8  STA   $07
         STX   $09
         PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   [$07]
         PLA
         LDY   #$0002
         STA   [$07],Y
         BRL   L0B3CC2
L0B3BFE  LDY   #$000A
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L0B3C38
         LDA   #$000A
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B3C14
         INX
L0B3C14  STA   $07
         STX   $09
         PHY
         PHY
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   L0553D9
         PHA
         JSL   L0B249C
         PLA
         STA   [$07]
         PLA
         LDY   #$0002
         STA   [$07],Y
         BRA   L0B3C77
L0B3C38  PHY
         PHY
         LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L151301
         LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L033477
         BEQ   L0B3C77
         PHY
         LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L078A05
         PLA
         STA   $05
L0B3C77  LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L0718BF
         LDY   #$000C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         PHX
         PHA
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$0004
         LDA   [$01],Y
         PHA
         JSL   L0E0656
         LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L07191C
L0B3CC2  LDA   $0E
         STA   $12
         LDA   $0D
         STA   $11
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L0B3CD4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $14
         LDX   $16
         STA   $01
         STX   $03
         LDY   #$000C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PHX
         PHA
         LDA   $12
         DEC
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B3D10
         DEX
L0B3D10  JSL   L150F53
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         BNE   L0B3D47
         LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L0718BF
         PEA   $0000
         PHD
         JSL   L0B3B49
         LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L07191C
         BRA   L0B3DA1
L0B3D47  LDAL  L051C44
         TAX
         LDAL  L051C42
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PHX
         PHA
         LDY   #$0002
         LDA   [$05],Y
         DEC
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B3D75
         DEX
L0B3D75  JSL   L150F53
         STA   $05
         STX   $07
         LDAL  L051C44
         PHA
         LDAL  L051C42
         PHA
         JSL   L0718BF
         PEA   $0000
         PHD
         JSL   L0B3B49
         LDAL  L051C44
         PHA
         LDAL  L051C42
         PHA
         JSL   L07191C
L0B3DA1  LDA   $10
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

L0B3DB3  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD2
         TCS
         TCD
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEI   $36
         PEI   $34
         PEA   $0020
         JSL   L0313BE
         LDA   $3A
         LDX   $3C
         STA   $01
         STX   $03
         LDY   #$0006
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L0B3DE9
         PEA   $1B47
         JSL   L07272E
L0B3DE9  LDA   $38
         SEC
         SBC   #$0001
         BVS   L0B3DF4
         EOR   #$8000
L0B3DF4  BPL   L0B3DFB
         LDA   #$0000
         BRA   L0B3DFE
L0B3DFB  LDA   #$0001
L0B3DFE  PHA
         PEI   $38
         LDA   [$01]
         PHA
         PLA
         LDX   #$0001
         SEC
         SBC   $01,S
         BVS   L0B3E10
         EOR   #$8000
L0B3E10  BPL   L0B3E13
         DEX
L0B3E13  PLA
         TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0B3E22
         PEA   $2476
         JSL   L07272E
L0B3E22  PHY
         PHY
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L151301
         PLA
         PLX
         STA   $25
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L03250F
         PLA
         LSR
         BCS   L0B3E5B
         PEA   $1FB0
         JSL   L07272E
L0B3E5B  LDY   #$000C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $2B
         STX   $2D
         LDY   #$0002
         LDA   [$2B],Y
         TAX
         LDA   [$2B]
         PHX
         PHA
         LDA   $38
         DEC
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B3E87
         DEX
L0B3E87  JSL   L150F53
         STA   $27
         STX   $29
         LDA   $25
         STA   [$27]
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   ^L0407BA
         PEA   L0407BA
         JSL   L071C56
         PLA
         LSR
         BCC   L0B3EB2
         LDA   $38
         LDY   #$0004
         STA   [$01],Y
L0B3EB2  LDA   $32
         STA   $3C
         LDA   $31
         STA   $3B
         LDA   $2F
         TCD
         TSC
         CLC
         ADC   #$003A
         TCS
         RTL

L0B3EC4  ENT
         PHD
         PHY
         PHY
         PHY
         PHY
         TSC
         TCD
         LDA   #$0001
         STA   $0E
         LDA   L05540D
         STA   L05540B
         LDA   L0553E3
         STA   $05
         LDA   L0553E5
         STA   $07
         LDA   L0553ED
         BEQ   L0B3F2E
         LDX   #L04157F
         LDY   #^L04157F
         JSR   L0B4154
         BEQ   L0B3EFE
         LDX   #L041582
         LDY   #^L041582
         JSR   L0B4154
         BEQ   L0B3EFE
         BRL   L0B4130
L0B3EFE  PEA   ^L055407
         PEA   L055407
         LDA   L0553E1
         PHA
         LDA   L0553DF
         PHA
         JSL   L0B0361
         LDA   L0553E7
         PHA
         JSL   L0B2A91
         PEA   $0002
         JSL   L0E0838
         STZ   L0553ED
         STZ   L05540B
         LDA   #$0001
         STA   L05540D
         BRL   L0B4130
L0B3F2E  LDX   #L04158B
         LDY   #^L04158B
         JSR   L0B4154
         BNE   L0B3F52
         LDA   L05536F
         CMP   #$0004
         BNE   L0B3F46
         INC   L0553ED
         BEQ   L0B3F4F
L0B3F46  PEA   $0004
         JSL   L0E0838
         STZ   $0E
L0B3F4F  BRL   L0B4130
L0B3F52  LDX   #L04158E
         LDY   #^L04158E
         JSR   L0B4154
         BNE   L0B3FA7
L0B3F5D  LDA   L05536F
         CMP   #$0005
         BNE   L0B3F6B
         JSL   L0E0154
         BRA   L0B3F5D
L0B3F6B  CMP   #$0004
         BEQ   L0B3F75
         INC   L0553ED
         BRA   L0B3FA4
L0B3F75  JSR   L0B4176
         LDA   L050C32
         AND   #$00FF
         BEQ   L0B3F8B
         DEC
         BEQ   L0B3F9B
         LDA   L050C33
         CMP   #$2D2D
         BNE   L0B3F9B
L0B3F8B  PEA   $0006
         JSL   L0B2A68
         LDA   L05540B
         INC
         STA   L05540D
         BRA   L0B3FA4
L0B3F9B  PEA   $0005
         JSL   L0B2A68
         STZ   $0E
L0B3FA4  BRL   L0B4130
L0B3FA7  LDX   #L041593
         LDY   #^L041593
         JSR   L0B4154
         BNE   L0B3FFD
         LDA   L05536F
         CMP   #$0005
         BEQ   L0B3FCE
         CMP   #$0006
         BEQ   L0B3FC4
         INC   L0553ED
         BRA   L0B3FFA
L0B3FC4  LDA   L05540B
         DEC
         STA   L05540B
         STA   L05540D
L0B3FCE  JSR   L0B4176
         LDA   L050C32
         AND   #$00FF
         BEQ   L0B3FE4
         DEC
         BEQ   L0B3FF4
         LDA   L050C33
         CMP   #$2D2D
         BNE   L0B3FF4
L0B3FE4  PEA   $0008
         JSL   L0B2A68
         LDA   L05540B
         INC
         STA   L05540D
         BRA   L0B3FFA
L0B3FF4  JSL   L0E0154
         STZ   $0E
L0B3FFA  BRL   L0B4130
L0B3FFD  LDX   #L041598
         LDY   #^L041598
         JSR   L0B4154
         BNE   L0B4019
         PEA   $0003
         JSL   L0E0838
         LDA   L05540B
         INC
         STA   L05540D
         BRL   L0B4130
L0B4019  LDX   #L04159F
         LDY   #^L04159F
         JSR   L0B4154
         BEQ   L0B4027
         BRL   L0B40B5
L0B4027  JSR   L0B4145
         LDX   #L04158B
         LDY   #^L04158B
         JSR   L0B4154
         BNE   L0B4063
L0B4035  LDA   L05536F
         CMP   #$0005
         BNE   L0B4043
         JSL   L0E0154
         BRA   L0B4035
L0B4043  CMP   #$0006
         BEQ   L0B4052
         CMP   #$0008
         BEQ   L0B4052
         INC   L0553ED
         BRA   L0B4060
L0B4052  LDA   L05540B
         DEC
         STA   L05540B
         STA   L05540D
         JSL   L0E0154
L0B4060  BRL   L0B4130
L0B4063  LDX   #L041598
         LDY   #^L041598
         JSR   L0B4154
         BNE   L0B4087
L0B406E  LDA   L05536F
         CMP   #$0005
         BNE   L0B407C
         JSL   L0E0154
         BRA   L0B406E
L0B407C  CMP   #$0003
         BEQ   L0B4052
         INC   L0553ED
         BRL   L0B4130
L0B4087  LDX   L0553DF
         LDY   L0553E1
         JSR   L0B4154
         BNE   L0B40AF
L0B4092  LDA   L05536F
         CMP   #$0005
         BNE   L0B40A0
         JSL   L0E0154
         BRA   L0B4092
L0B40A0  CMP   #$0002
         BNE   L0B40AF
         LDA   L05540B
         DEC
         STA   L05540B
         STA   L05540D
L0B40AF  INC   L0553ED
         BRL   L0B4130
L0B40B5  LDX   #L0415A3
         LDY   #^L0415A3
         JSR   L0B4154
         BNE   L0B4103
         JSR   L0B4145
         INC   L0553ED
         LDX   L0553DF
         LDY   L0553E1
         JSR   L0B4154
         BEQ   L0B40DC
         LDX   #L041598
         LDY   #^L041598
         JSR   L0B4154
         BNE   L0B40DF
L0B40DC  DEC   L0553ED
L0B40DF  LDA   L0553ED
         BEQ   L0B4100
         LDX   #L0B4138
         LDY   #^L0B4138
         JSR   L0B4154
         BNE   L0B4100
         JSR   L0B4145
         LDX   #L0B413B
         LDY   #^L0B413B
         JSR   L0B4154
         BNE   L0B4100
         STZ   L0553ED
L0B4100  BRL   L0B4130
L0B4103  LDX   #L0415A8
         LDY   #^L0415A8
         JSR   L0B4154
         BNE   L0B4122
         JSR   L0B4145
         INC   L0553ED
         LDX   L0553DF
         LDY   L0553E1
         JSR   L0B4154
         STA   L0553ED
         BRA   L0B4130
L0B4122  LDX   #L0415AD
         LDY   #^L0415AD
         JSR   L0B4154
         BNE   L0B4130
         JSR   L0B4145
L0B4130  TDC
         TCS
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0B4138  STR   'to'
L0B413B  STR   'hyperCard'

L0B4145  PEA   ^L055407
         PEA   L055407
         PEI   $07
         PEI   $05
         JSL   L0B0361
         RTS

L0B4154  STX   $01
         STY   $03
         LDA   [$05]
         EOR   [$01]
         AND   #$00FF
         BEQ   L0B4166
         LDA   #$0001
         BRA   L0B4175
L0B4166  PHA
         PEI   $07
         PEI   $05
         PHY
         PHX
         JSL   L071C56
         PLA
         EOR   #$0001
L0B4175  RTS

L0B4176  LDA   L055407
         STA   $01
         LDA   L055409
         STA   $03
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B0361
         RTS

L0B4194  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         LDX   L05540B
         BEQ   L0B41C2
         LDA   L0553F3
         STA   $01
L0B41A3  LDA   L0553F5
         STA   $03
         LDA   #$2020
         LDY   #$0000
L0B41AE  STA   [$01],Y
         INY
         INY
         DEX
         BNE   L0B41AE
         TYA
         CLC
         ADC   L0553F3
         STA   L0553F3
         BCC   L0B41C2
         INC   L0553F5
L0B41C2  TDC
         TCS
         PLY
         PLY
         PLD
         RTL

L0B41C8  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         LDA   $0A
         STA   $01
         LDA   $0C
         STA   $03
         LDY   #$0000
         SEP   #$20
L0B41DA  LDA   [$0A]
         INC   $0A
         BNE   L0B41E6
         INC   $0B
         BNE   L0B41E6
         INC   $0C
L0B41E6  CMP   #$20
         BEQ   L0B41DA
L0B41EA  CMP   #$00
         BEQ   L0B4203
         CMP   #$0D
         BEQ   L0B4203
         STA   [$01],Y
         INY
         LDA   [$0A]
         INC   $0A
         BNE   L0B41EA
         INC   $0B
         BNE   L0B41EA
         INC   $0C
         BRA   L0B41EA
L0B4203  TAX
         LDA   #$20
L0B4206  CPY   #$0000
         BEQ   L0B4211
         DEY
         CMP   [$01],Y
         BEQ   L0B4206
         INY
L0B4211  TXA
         STA   [$01],Y
         INY
         CMP   #$00
         BNE   L0B41DA
         REP   #$20
         STY   $0E
         STZ   $10
         LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         TDC
         TCS
         PLY
         PLY
         PLD
         PLY
         PLY
         RTL

L0B422F  ENT
         LDA   $04,S
         DEC
         TAX
         LDA   $06,S
         STA   $04,S
         LDA   $01,S
         STA   $05,S
         LDA   $02,S
         STA   $06,S
         TXA
         STA   $02,S
         PHB
         PLA
         RTL

L0B4245  ENT
         PHD
         TSC
         TCD
         LDA   $0A
         STAL  L0B425D+1
         LDA   $0B
         STAL  L0B425D+2
         PHB
         PHD
         PHA
         PLB
         PLB
         PEI   $08
         PEI   $06
L0B425D  JSL   $000000
         REP   #$30
         PLD
         PLB
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

L0B4275  ENT
         PHD
         TSC
         SEC
         SBC   #$0026
         TCD
         TCS
         STZ   $0B
         LDY   #$001F
         LDA   [$34],Y
         BNE   L0B4289
         BRL   L0B4489
L0B4289  PHA
         LDY   #$001A
         LDA   [$34],Y
         PHA
         DEY
         DEY
         LDA   [$34],Y
         PHA
         JSL   L0E079C
         PLA
         BEQ   L0B42CB
         LDY   #$001A
         LDA   [$34],Y
         PHA
         DEY
         DEY
         LDA   [$34],Y
         PHA
         JSL   L07185A
         PHA
         PHA
         JSL   L0B1792
         LDY   #$0018
         PLA
         STA   [$34],Y
         INY
         INY
         PLA
         STA   [$34],Y
         DEY
         LDA   [$34],Y
         BNE   L0B42E0
         PEA   $002D
         JSL   L0B0B7A
         BRL   L0B4489
L0B42CB  PEA   $0000
         LDY   #$001A
         LDA   [$34],Y
         PHA
         DEY
         DEY
         LDA   [$34],Y
         PHA
         _SetPurge
L0B42E0  PHA
         LDY   #$0020
         LDA   [$34],Y
         STA   $03
         PHA
         DEY
         DEY
         LDA   [$34],Y
         STA   $01
         PHA
         JSL   L0718FA
         PLA
         STA   $1D
         LDY   #$0002
         LDA   [$01]
         STA   $0D
         LDA   [$01],Y
         STA   $0F
         LDY   #$0000
         TYX
L0B4306  LDA   [$0D],Y
         BEQ   L0B4318
         INX
         CMP   L055365
         BEQ   L0B431B
         TYA
L0B4311  CLC
         ADC   #$000E
         TAY
         BRA   L0B4306
L0B4318  BRL   L0B444A
L0B431B  STX   $0B
         STY   $05
         LDY   #$0018
         LDA   [$34],Y
         STA   $01
         INY
         INY
         LDA   [$34],Y
         STA   $03
         LDY   #$0002
         LDA   [$01]
         STA   $23
         LDA   [$01],Y
         STA   $25
         LDY   $05
         INY
         INY
         LDA   [$0D],Y
         CLC
         ADC   $23
         STA   $23
         BCC   L0B4346
         INC   $25
L0B4346  TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B0361
         PHA
         PEA   ^L050C32
         PEA   L050C32
         PEA   ^L0509EA
         PEA   L0509EA
         JSL   L071C56
         PLA
         BNE   L0B4373
         LDX   $0B
         LDA   $05
         BRA   L0B4311
L0B4373  LDA   $05
         CLC
         ADC   #$0008
         TAY
         LDA   [$0D],Y
         STA   $07
         INY
         INY
         LDA   [$0D],Y
         STA   $09
         ORA   $07
         BEQ   L0B43B7
         PHA
         PEI   $09
         PEI   $07
         JSL   L0E079C
         PLA
         BNE   L0B43B7
         PEA   $0000
         PEI   $09
         PEI   $07
         _SetPurge
L0B43A2  LDA   $05
         CLC
         ADC   $0D
         STA   [$30]
         BCC   L0B43AD
         INC   $0F
L0B43AD  LDY   #$0002
         LDA   $0F
         STA   [$30],Y
         BRL   L0B444C
L0B43B7  PEI   $09
         PEI   $07
         JSL   L07185A
         PHA
         LDY   #$001A
         LDA   [$34],Y
         STA   $03
         PHA
         DEY
         DEY
         LDA   [$34],Y
         STA   $01
         PHA
         JSL   L0718FA
         PLA
         STA   $11
         LDY   #$0002
         LDA   [$01]
         STA   $13
         LDA   [$01],Y
         TAX
         LDA   #$0004
         CLC
         ADC   $05
         TAY
         LDA   [$0D],Y
         CLC
         ADC   $13
         STA   $13
         BCC   L0B43F1
         INX
L0B43F1  STX   $15
         LDA   #$0006
         CLC
         ADC   $05
         TAY
         LDA   [$0D],Y
         CLC
         ADC   $13
         STA   $17
         BCC   L0B4404
         INX
L0B4404  STX   $19
         SEP   #$20
         LDA   [$17]
         STA   $1B
         LDA   #$00
         STA   [$17]
         REP   #$20
         PHA
         PHA
         PEI   $15
         PEI   $13
         LDA   #$0004
         CLC
         ADC   $05
         TAY
         LDA   [$0D],Y
         PHA
         JSL   L0B44A0
         LDA   #$0008
         CLC
         ADC   $05
         TAY
         PLA
         STA   [$0D],Y
         PLA
         INY
         INY
         STA   [$0D],Y
         SEP   #$20
         LDA   $1B
         STA   [$17]
         REP   #$20
         PEI   $03
         PEI   $01
         PEI   $11
         JSL   L0718DA
         BRL   L0B43A2
L0B444A  STZ   $0B
L0B444C  LDY   #$0020
         LDA   [$34],Y
         PHA
         DEY
         DEY
         LDA   [$34],Y
         PHA
         PEI   $1D
         JSL   L0718DA
         LDA   $0B
         BNE   L0B4489
         LDY   #$001C
         LDA   [$34],Y
         BNE   L0B4489
         PHA
         PEI   $36
         PEI   $34
         JSL   L0B33DE
         PLA
         BNE   L0B4489
         PEA   $0002
         LDY   #$001A
         LDA   [$34],Y
         PHA
         DEY
         DEY
         LDA   [$34],Y
         PHA
         _SetPurge
L0B4489  LDA   $0B
         STA   [$2C]
         LDA   $2A
         STA   $36
         LDA   $29
         STA   $35
         LDX   $27
         TDC
         CLC
         ADC   #$0034
         TCS
         TXA
         TCD
         RTL

L0B44A0  PHD
         TSC
         SEC
         SBC   #$0028
         TCD
         TCS
         STZ   $03
         STZ   $07
         LDA   #$0040
         STA   $05
         PHA
         PHA
         PEA   $0000
         PEA   $0200
         LDA   L0553DD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   $34
         PLX
         STX   $36
         BCC   L0B4501
         PEA   $002D
         JSL   L0B0B7A
         PHA
         PHA
         PEA   $0000
         PEA   $0008
         LDA   L0553DD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   $34
         PLX
         STX   $36
         BRL   L0B463F
L0B4501  LDA   $30
         LDX   $32
         STA   $09
         STX   $0B
L0B4509  LDA   [$09]
         AND   #$00FF
         BNE   L0B4513
         BRL   L0B463F
L0B4513  JSR   L0B46E0
         LDA   $21
         CMP   #$0009
         BNE   L0B4535
         LDA   $23
         CMP   #$000C
         BEQ   L0B4529
         CMP   #$0002
         BNE   L0B4532
L0B4529  LDX   #^L050BF2
         LDA   #L050BF2
         JSR   L0B468B
L0B4532  BRL   L0B4631
L0B4535  CMP   #$0005
         BNE   L0B4532
         LDA   $23
         CMP   #$0007
         BNE   L0B4532
         LDA   $25
         STA   L050BFE
         LDA   $23
         STA   L050BFC
         CLC
         LDX   $32
         ADC   $30
         BCC   L0B4553
         INX
L0B4553  STA   $0D
         STX   $0F
         JSR   L0B46E0
         LDA   #$0016
         CMP   $21
         BEQ   L0B456D
         LDX   #^L050BFA
         LDA   #L050BFA
         JSR   L0B468B
         BRL   L0B4631
L0B456D  LDA   $23
         CMP   #$0006
         BNE   L0B4591
         LDA   L050BFE
         STA   L050C0E
         LDA   $09
         SEC
         SBC   $0D
         STA   L050C10
         JSR   L0B46E0
         LDX   #^L050C0A
         LDA   #L050C0A
         JSR   L0B468B
         BRL   L0B4631
L0B4591  CMP   #$0010
         BNE   L0B45B3
         LDA   L050BFE
         STA   L050C1E
         LDA   $09
         SEC
         SBC   $0D
         STA   L050C20
         JSR   L0B46E0
         LDX   #^L050C1A
         LDA   #L050C1A
         JSR   L0B468B
         BRL   L0B4631
L0B45B3  CMP   #$0009
         BNE   L0B4628
         LDA   L050BFE
         STA   L050C06
         LDA   $09
         SEC
         SBC   $0D
         STA   L050C08
         JSR   L0B46E0
         LDA   #$0016
         CMP   $21
         BNE   L0B45F3
         LDA   #$0006
         CMP   $23
         BNE   L0B45FA
         LDA   L050BFE
         STA   L050C16
         LDA   $09
         SEC
         SBC   $0D
         STA   L050C18
         JSR   L0B46E0
         LDX   #^L050C12
         LDA   #L050C12
         JSR   L0B468B
         BRA   L0B4631
L0B45F3  LDA   #$0016
         CMP   $21
         BNE   L0B461D
L0B45FA  LDA   #$0010
         CMP   $23
         BNE   L0B461D
         LDA   L050BFE
         STA   L050C26
         LDA   $09
         SEC
         SBC   $0D
         STA   L050C28
         JSR   L0B46E0
         LDX   #^L050C22
         LDA   #L050C22
         JSR   L0B468B
         BRA   L0B4631
L0B461D  LDX   #^L050C02
         LDA   #L050C02
         JSR   L0B468B
         BRA   L0B4631
L0B4628  LDX   #^L050BFA
         LDA   #L050BFA
         JSR   L0B468B
L0B4631  TDC
         CLC
         ADC   #$0021
         LDX   #$0000
         JSR   L0B468B
         BRL   L0B4509
L0B463F  LDX   #^L050C2A
         LDA   #L050C2A
         LDY   $07
         BEQ   L0B464E
         JSR   L0B4980
         BRA   L0B4651
L0B464E  JSR   L0B468B
L0B4651  LDX   #$0000
         LDA   $03
         ASL
         BCC   L0B465A
         INX
L0B465A  ASL
         BCC   L0B465E
         INX
L0B465E  ASL
         BCC   L0B4662
         INX
L0B4662  PHX
         PHA
         PEI   $36
         PEI   $34
         _SetHandleSize
         BCC   L0B4678
         PEA   $0EF3
         JSL   L07272E
L0B4678  LDA   $2C
         STA   $32
         LDA   $2B
         STA   $31
         LDX   $29
         TDC
         CLC
         ADC   #$0030
         TCS
         TXA
         TCD
         RTL

L0B468B  STX   $1F
         STA   $1D
         LDA   $07
         BEQ   L0B469A
         LDA   [$1D]
         DEC
         DEC
         BNE   L0B469A
         RTS

L0B469A  STZ   $07
         LDA   [$1D]
         DEC
         DEC
         BNE   L0B46A4
         INC   $07
L0B46A4  LDA   $03
         INC
         STA   $03
         CMP   $05
         BCC   L0B46DD
         LDA   $05
         CLC
         ADC   #$0040
         STA   $05
         PHA
         PEI   $36
         PEI   $34
         LDX   #$0000
         ASL
         BCC   L0B46C1
         INX
L0B46C1  ASL
         BCC   L0B46C5
         INX
L0B46C5  ASL
         BCC   L0B46C9
         INX
L0B46C9  PHX
         PHA
         JSL   L078A05
         PLA
         BNE   L0B46DD
         PEA   $002D
         JSL   L0B0B7A
         PLA
         BRL   L0B4678
L0B46DD  BRL   L0B4984
L0B46E0  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L071C12
         LDA   $09
         STA   $15
         LDA   $0B
         STA   $17
         STZ   $23
         STZ   $27
         LDA   #$00FF
         AND   [$15]
         TAX
         LDA   #$00FF
         ANDL  L032858,X
         ASL
         TAX
         LDAL  L0B470E,X
         PHA
         RTS

L0B470E  DA    L0B495B-1
         DA    L0B47E5-1
         DA    L0B4911-1
         DA    L0B48AE-1
         DA    L0B479D-1
         DA    L0B479D-1
         DA    L0B471E-1
         DA    L0B4884-1

L0B471E  LDA   $15
         STA   $19
         LDA   $17
         STA   $1B
         LDA   #$0000
         TAY
         TAX
         SEP   #$20
L0B472D  LDA   [$19],Y
         TAX
         LDAL  L032858,X
         CMP   #$06
         BEQ   L0B473E
         CMP   #$04
         BEQ   L0B473E
         BRA   L0B4741
L0B473E  INY
         BRA   L0B472D
L0B4741  LDA   [$19],Y
         STA   $01
         LDA   #$00
         STA   [$19],Y
         REP   #$20
         TYA
         CLC
         ADC   $19
         STA   $19
         BCC   L0B4755
         INC   $1B
L0B4755  PEI   $17
         PEI   $15
         PEA   ^L050C32
         PEA   L050C32
         JSL   L071FF8
         SEP   #$20
         LDA   $01
         STA   [$19]
         REP   #$20
         PHA
         PEA   ^L050C32
         PEA   L050C32
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         JSL   L0B027B
         PLA
         LDA   $19
         STA   $09
         LDA   $1B
         STA   $0B
         BRL   L0B4969
L0B479D  LDA   #$0007
         STA   $21
         LDA   $15
         STA   $19
         LDA   $17
         STA   $1B
         LDA   #$0000
         TAY
         TAX
         SEP   #$20
L0B47B1  LDA   [$19],Y
         TAX
         LDAL  L032858,X
         CMP   #$04
         BNE   L0B47BF
         INY
         BRA   L0B47B1
L0B47BF  CMP   #$05
         BNE   L0B47CF
L0B47C3  INY
         LDA   [$19],Y
         TAX
         LDAL  L032858,X
         CMP   #$04
         BEQ   L0B47C3
L0B47CF  REP   #$20
         LDX   $1B
         TYA
         CLC
         ADC   $19
         STA   $19
         STA   $09
         BCC   L0B47DE
         INX
L0B47DE  STX   $1B
         STX   $0B
         BRL   L0B4969
L0B47E5  LDA   #$0005
         STA   $21
         LDA   $15
         LDX   $17
         INC
         BNE   L0B47F2
         INX
L0B47F2  STA   $19
         STX   $1B
         LDA   #$00FF
         TAY
         AND   [$19]
         TAX
         TYA
         ANDL  L032950,X
         TAY
         LDA   #$00FF
         AND   [$15]
         TAX
         LDA   #$00FF
         ANDL  L032950,X
         STA   $23
         CMP   #$0010
         BEQ   L0B4826
         CMP   #$000A
         BEQ   L0B4845
         CMP   #$0011
         BEQ   L0B484F
         DEC
         BEQ   L0B4871
         BRA   L0B4879
L0B4826  CPY   #$0007
         BNE   L0B4830
         LDA   #$000F
         BRA   L0B4838
L0B4830  CPY   #$000A
         BNE   L0B4879
         LDA   #$0013
L0B4838  STA   $23
L0B483A  LDA   $19
         INC
         STA   $19
         BNE   L0B4843
         INC   $1B
L0B4843  BRA   L0B4879
L0B4845  CPY   #$0007
         BNE   L0B4879
         LDA   #$0009
         BRA   L0B4838
L0B484F  CPY   #$0011
         BNE   L0B4879
         STZ   $23
         LDA   #$0002
         STA   $21
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L071B83
         LDA   #$00FF
         AND   [$19]
         BNE   L0B483A
         BRA   L0B4879
L0B4871  DEY
         BNE   L0B4879
         LDA   #$0002
         BRA   L0B4838
L0B4879  LDA   $19
         STA   $09
         LDA   $1B
         STA   $0B
         BRL   L0B4969
L0B4884  LDA   #$0002
         STA   $21
         STZ   $23
         LDA   $15
         LDX   $17
         STA   $09
         STX   $0B
         INC
         BNE   L0B4897
         INX
L0B4897  STA   $19
         STX   $1B
         LDA   #$00FF
         AND   [$09]
         BEQ   L0B48AB
         LDA   $09
         INC
         BNE   L0B48A9
         INC   $0B
L0B48A9  STA   $09
L0B48AB  BRL   L0B4969
L0B48AE  LDA   #$0007
         STA   $21
         LDA   $15
         LDX   $17
         INC
         BNE   L0B48BD
         INX
         STX   $17
L0B48BD  STA   $15
         STA   $09
         STX   $0B
         LDA   #$0000
         TAY
         TAX
         SEP   #$20
L0B48CA  LDA   [$09],Y
         TAX
         LDAL  L032858,X
         CMP   #$03
         BEQ   L0B48DC
         CMP   #$07
         BEQ   L0B48DC
         INY
         BRA   L0B48CA
L0B48DC  TAX
         REP   #$20
         TYA
         CLC
         ADC   $09
         STA   $09
         BCC   L0B48E9
         INC   $0B
L0B48E9  LDA   $09
         STA   $19
         LDA   $0B
         STA   $1B
         CPX   #$0003
         BNE   L0B4901
         LDA   $09
         INC
         STA   $09
         BNE   L0B4969
         INC   $0B
         BRA   L0B4969
L0B4901  LDA   #$0004
         STA   $21
         LDA   $15
         BNE   L0B490C
         DEC   $17
L0B490C  DEC
         STA   $15
         BRA   L0B4969
L0B4911  LDA   #$0006
         STA   $21
         LDA   #$00FF
         TAY
         AND   [$15]
         TAX
         TYA
         ANDL  L032950,X
         STA   $23
         CMP   #$0004
         BNE   L0B4949
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L071B83
         LDA   #$00FF
         AND   [$09]
         BEQ   L0B4946
         LDA   $09
         INC
         STA   $09
         BNE   L0B4946
         INC   $0B
L0B4946  BRL   L0B46E0
L0B4949  LDA   $15
         LDX   $17
         INC
         BNE   L0B4951
         INX
L0B4951  STA   $19
         STX   $1B
         STA   $09
         STX   $0B
         BRA   L0B4969
L0B495B  LDA   #$0004
         STA   $21
         LDA   #$00FF
         AND   [$15]
         STA   $23
         BRA   L0B4949
L0B4969  SEC
         LDA   $15
         SBC   $30
         CLC
         ADC   $2E
         STA   $25
         LDA   $27
         BEQ   L0B4978
         RTS

L0B4978  LDA   $19
         SEC
         SBC   $15
         STA   $27
         RTS

L0B4980  STX   $1F
         STA   $1D
L0B4984  PHA
         PHA
         PEI   $36
         PEI   $34
         PEI   $03
         JSL   L0B062C
         PLA
         STA   $11
         PLA
         STA   $13
         LDY   #$0006
L0B4999  LDA   [$1D],Y
         STA   [$11],Y
         DEY
         DEY
         BPL   L0B4999
         RTS

L0B49A2  ENT
         PHD
         TSC
         SEC
         SBC   #$001A
         TCD
         TCS
         LDA   [$24]
         AND   #$00FF
         BNE   L0B49BB
         LDY   #$0002
         STA   [$20]
         STA   [$20],Y
         BRL   L0B4B18
L0B49BB  STZ   $01
         STZ   $0B
         LDA   #$0014
         STA   $03
         LDA   #$0118
         STA   $17
         STZ   $19
         PHA
         PHA
         LDX   #$0000
         PHX
         PEA   $0118
         LDA   L0553DD
         PHA
         PHX
         PHX
         PHX
         _NewHandle
         PLA
         STA   $0D
         PLA
         STA   $0F
         BCC   L0B49F4
         PEA   $002D
         JSL   L0B0B7A
         BRL   L0B4B18
L0B49F4  LDY   #$0002
         LDA   [$0D]
         STA   $11
         LDA   [$0D],Y
         STA   $13
         LDA   $24
         STA   $05
         LDA   $26
         STA   $07
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         TDC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L071AE0
         LDY   #$0000
L0B4A1F  LDA   [$05]
         AND   #$00FF
         BNE   L0B4A29
         BRL   L0B4B06
L0B4A29  LDA   $05
         STA   $15
         SEC
         SBC   $24
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B0361
         LDA   $05
         SEC
         SBC   $24
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B0361
         PHA
         PEA   ^L050C32
         PEA   L050C32
         JSL   L032E6D
         PLA
         LDX   $09
         BEQ   L0B4A71
         EOR   #$FFFF
         INC
L0B4A71  LDY   $0B
         STA   [$11],Y
         INY
         INY
         PLA
         STA   [$11],Y
         INY
         INY
         PLA
         STA   [$11],Y
         INY
         INY
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         TDC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L071AE0
         LDA   $05
         SEC
         SBC   $15
         PLY
         STA   [$11],Y
         INY
         INY
         LDA   #$0000
         STA   [$11],Y
         INY
         INY
         STA   [$11],Y
         INY
         INY
         STA   [$11],Y
         INY
         INY
         STY   $0B
         LDA   $01
         INC
         STA   $01
         CMP   $03
         BCC   L0B4B03
         CLC
         ADC   #$0014
         STA   $03
         LDA   $17
         CLC
         ADC   #$0118
         STA   $17
         BCC   L0B4ACD
         INC   $19
L0B4ACD  PHA
         PEI   $0F
         PEI   $0D
         PEI   $19
         PEI   $17
         JSL   L078A05
         PLA
         BNE   L0B4AF8
         PEI   $0F
         PEI   $0D
         JSL   L07185A
         PEA   $002D
         JSL   L0B0B7A
         LDA   #$0000
         LDY   #$0002
         STA   [$20]
         STA   [$20],Y
         BRA   L0B4B18
L0B4AF8  LDY   #$0002
         LDA   [$0D]
         STA   $11
         LDA   [$0D],Y
         STA   $13
L0B4B03  BRL   L0B4A1F
L0B4B06  LDY   $0B
         LDA   #$0000
         STA   [$11],Y
         LDY   #$0002
         LDA   $0D
         STA   [$20]
         LDA   $0F
         STA   [$20],Y
L0B4B18  LDA   $1E
         STA   $26
         LDA   $1D
         STA   $25
         LDX   $1B
         TDC
         CLC
         ADC   #$0024
         TCS
         TXA
         TCD
         RTL

L0B4B2B  ENT
         PHD
         PHY
         TSC
         TCD
         STZ   $08
         TSC
         STA   $01
         LDA   L055367
         CLC
         ADC   #$1500
         SEC
         SBC   $01
         BMI   L0B4B42
         INC   $08
L0B4B42  TDC
         TCS
         PLY
         PLD
         RTL

L0B4B47  ENT
         TXA
         CMP   #$0039
         BCC   L0B4B5E
         PHA
         PHA
         PHA
         PEA   $004A
         JSL   L0711EB
         _SysFailMgr
L0B4B5E  DEC
         ASL
         ASL
         TAX
         LDAL  L0B4B76,X
         STAL  L0B4B72+1
         LDAL  L0B4B76+1,X
         STAL  L0B4B72+2
L0B4B72  JMPL  $000000

L0B4B76  ADRL  L0B91E2
         ADRL  L0B8E1B
         ADRL  L071C98
         ADRL  L071CCD
         ADRL  L0B923B
         ADRL  L071EC5
         ADRL  L0734F5
         ADRL  L071FF8
         ADRL  L071D81
         ADRL  L071DE3
         ADRL  L0B940B
         ADRL  L0B9468
         ADRL  L0715D9
         ADRL  L07346C
         ADRL  L07334A
         ADRL  L0B8CA7
         ADRL  L0B8E66
         ADRL  L0B9093
         ADRL  L0B93D7
         ADRL  L0B8F62
         ADRL  L0B8FE3
         ADRL  L0B903E
         ADRL  L0B92A9
         ADRL  L0B9329
         ADRL  L0B9383
         ADRL  L071C56
         ADRL  L073660
         ADRL  L071B83
         ADRL  L071BC3
         ADRL  L072CD4
         ADRL  L0735A8
         ADRL  L070525
         ADRL  L072B9F
         ADRL  L071330
         ADRL  L072D71
         ADRL  L071F67
         ADRL  L072EAE
         ADRL  L070A4D
         ADRL  L070BA8
         ADRL  L070F7D
         ADRL  L0315E2
         ADRL  L0B1144
         ADRL  L0B90CB
         ADRL  L0B8CE7
         ADRL  L0B919C
         ADRL  L0B9142
         ADRL  L0B94AC
         ADRL  L0B955F
         ADRL  L160616
         ADRL  L160624
         ADRL  L16049C
         ADRL  L160632
         ADRL  L160640
         ADRL  L16064E
         ADRL  L16065C
         ADRL  L16066A
         MX    %00
L0B4C56  PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         LDA   #$0000
         LDY   #$0015
         STA   [$26],Y
         LDA   L0553B5
         LDX   L0553B7
         STA   $19
         STX   $1B
         PHY
         PEA   $0064
         JSL   L0B5681
         PLA
         LSR
         BCS   L0B4C7F
         BRL   L0B4D3A
L0B4C7F  JSL   L031B09
         PHY
         JSL   L0B1C0F
         PLA
         STA   $17
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         PHY
         PHY
         JSL   L0B3727
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B7932
         PEI   $17
         JSL   L0B39C0
         JSL   L0E0000
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0001
         JSL   L0B2AF9
         LDA   #$0015
         CLC
         ADC   $26
         LDX   $28
         BCC   L0B4CCC
         INX
L0B4CCC  PHX
         PHA
         PHY
         LDA   #$0001
         CLC
         ADC   $26
         LDX   $28
         BCC   L0B4CDA
         INX
L0B4CDA  CLC
         ADC   #$0008
         BCC   L0B4CE1
         INX
L0B4CE1  STA   $1D
         STX   $1F
         LDA   [$1D]
         PHA
         JSL   L0B4D5D
         PLA
         BEQ   L0B4D00
         PHA
         LDX   #$0000
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0B4CFC
         INX
L0B4CFC  TXA
         AND   $01,S
         PLX
L0B4D00  PLX
         STX   $1D
         PLX
         STX   $1F
         STA   [$1D]
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B0F05
         PEI   $1B
         PEI   $19
         PEA   $0000
         JSL   L0B2AF9
         LDY   #$0015
         LDA   [$26],Y
         BNE   L0B4D38
         LDA   #$0017
         CLC
         ADC   $26
         LDX   $28
         BCC   L0B4D32
         INX
L0B4D32  PHX
         PHA
         JSL   L0B2965
L0B4D38  BRA   L0B4D4B
L0B4D3A  LDA   #$0017
         CLC
         ADC   $26
         LDX   $28
         BCC   L0B4D45
         INX
L0B4D45  PHX
         PHA
         JSL   L0B2965
L0B4D4B  LDA   $24
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

L0B4D5D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE2
         TCS
         TCD
         LDA   L0553A5
         BEQ   L0B4D6F
         STZ   $26
         BRL   L0B4F91
L0B4D6F  LDA   #$0001
         STA   $26
         LDA   #$FFFF
         CMP   $24
         BNE   L0B4D7E
         BRL   L0B4F91
L0B4D7E  LDA   #$FFFF
         CMP   $24
         BNE   L0B4D88
         BRL   L0B4F8F
L0B4D88  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   L0553C9
         LDX   L0553CB
         STA   $1B
         STX   $1D
         LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         PHX
         PHA
         LDA   $24
         DEC
         PEA   $000C
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B4DB9
         DEX
L0B4DB9  JSL   L150F53
         PHX
         PHA
         PEA   $000C
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         JSL   L0B2A02
         STZ   $15
         LDA   $07
         DEC
         BPL   L0B4DDD
         BRL   L0B4F58
L0B4DDD  CMP   #$0005
         BMI   L0B4DE5
         BRL   L0B4F58
L0B4DE5  SEC
         SBC   #$0000
         BEQ   L0B4E03
         DEC
         BEQ   L0B4E61
         DEC
         BNE   L0B4DF4
         BRL   L0B4F1C
L0B4DF4  DEC
         BNE   L0B4DFA
         BRL   L0B4F28
L0B4DFA  DEC
         BNE   L0B4E00
         BRL   L0B4F40
L0B4E00  BRL   L0B4F58
L0B4E03  LDX   #$0000
         LDAL  L051BDE
         CMP   $09
         BNE   L0B4E0F
         INX
L0B4E0F  TXA
         BEQ   L0B4E5E
         LDX   #$0000
         LDAL  L051BE0
         CMP   $0B
         BNE   L0B4E1E
         INX
L0B4E1E  TXA
         BEQ   L0B4E5E
         LDA   #$0001
         STA   $15
         LDA   L05539B
         BEQ   L0B4E47
         PEA   ^L051BE4
         PEA   L051BE4
         PEA   $0000
         PEA   $0002
         PEA   $0016
         JSL   L0E07C5
         PEA   $0000
         JSL   L0B2F9D
         BRA   L0B4E5A
L0B4E47  LDA   #$FF9C
         CMP   $05
         BEQ   L0B4E5A
         PEI   $05
         JSL   L0E0E11
         PEI   $05
         JSL   L0B2F9D
L0B4E5A  JSL   L0B0000
L0B4E5E  BRL   L0B4F5F
L0B4E61  LDA   L0553D1
         LDX   L0553D3
         STA   $1B
         STX   $1D
         LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         CLC
         ADC   #$0100
         BCC   L0B4E7A
         INX
L0B4E7A  PHX
         PHA
         LDA   $09
         JSL   L150488
         TAY
         BNE   L0B4E86
         DEX
L0B4E86  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $1B
         STX   $1D
         LDA   [$1B]
         STA   $13
         LDA   L05539B
         STA   $0D
         STZ   L05539B
         LDX   #$0000
         LDA   #$FFFF
         CMP   $13
         BNE   L0B4EB4
         INX
L0B4EB4  TXA
         BNE   L0B4EC1
         PHY
         PEI   $13
         JSL   L0B4D5D
         PLA
         BEQ   L0B4F15
L0B4EC1  LDA   $09
         DEC
         ASL
         ASL
         TAX
         LDAL  L032C5A+2,X
         PHA
         LDAL  L032C5A,X
         PLX
         STA   $0F
         STX   $11
         LDX   #$0000
         LDA   $0F
         ORA   $11
         BNE   L0B4EDF
         INX
L0B4EDF  TXA
         BNE   L0B4EEE
         PHY
         PEI   $11
         PEI   $0F
         JSL   L0B422F
         PLA
         BEQ   L0B4F08
L0B4EEE  LDA   #$0001
         STA   $15
         LDA   #$FF9C
         CMP   $05
         BNE   L0B4F00
         JSL   L0E0000
         BRA   L0B4F06
L0B4F00  PEI   $05
         JSL   L0B2F9D
L0B4F06  BRA   L0B4F15
L0B4F08  TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         JSL   L0B2965
L0B4F15  LDA   $0D
         STA   L05539B
         BRA   L0B4F5F
L0B4F1C  PHY
         PEI   $09
         JSL   L0B4D5D
         PLA
         STA   $15
         BRA   L0B4F5F
L0B4F28  PEA   $0000
         PHD
         JSL   L0B4C56
         LDA   $15
         BNE   L0B4F3E
         PHY
         PEI   $09
         JSL   L0B4D5D
         PLA
         STA   $15
L0B4F3E  BRA   L0B4F5F
L0B4F40  PHY
         PEI   $09
         JSL   L0B4D5D
         PLA
         STA   $15
         LDA   $15
         BNE   L0B4F56
         PEA   $0000
         PHD
         JSL   L0B4C56
L0B4F56  BRA   L0B4F5F
L0B4F58  PEA   $63EA
         JSL   L07272E
L0B4F5F  LDA   $15
         BEQ   L0B4F88
         LDX   #$0000
         LDA   #$FFFF
         CMP   $01
         BNE   L0B4F6E
         INX
L0B4F6E  TXA
         BNE   L0B4F91
         PHY
         PEI   $01
         JSL   L0B4D5D
         PLA
         BNE   L0B4F91

*

         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         JSL   L0B2965
L0B4F88  LDA   $03
         STA   $24
         BRL   L0B4D7E
L0B4F8F  STZ   $26
L0B4F91  LDA   $22
         STA   $24
         LDA   $21
         STA   $23
         LDA   $1F
         TCD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L0B4FA3  ENT
         PHD
         TSC
         CLC
         ADC   #$FDFC
         TCS
         ADC   #$0111
         TCD
         PEI   $FA
         PEI   $F8
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         JSL   L0B1388
         PEA   $0040
         PEA   $0000
         TDC
         CLC
         ADC   #$FEEF
         PHA
         PEA   $0070
         JSL   L0B127A
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         JSL   L0B0897
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$020A
         TCS
         RTL

L0B4FF1  ENT
         PHD
         TSC
         CLC
         ADC   #$FDE8
         TCS
         ADC   #$0129
         TCD
         STZ   $E7
         STZ   $E9
         LDA   $F8
         BPL   L0B5007
         BRL   L0B50F1
L0B5007  BNE   L0B500C
         BRL   L0B50F1
L0B500C  LDA   $F6
         BNE   L0B5013
         BRL   L0B50F1
L0B5013  PHY
         PHY
         PEA   $0000
         PEA   $0002
         LDA   L0553DD
         PHA
         JSL   L0B249C
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         STA   $EB
         STX   $ED
         LDA   #$0000
         STA   [$EB]
         PHY
         JSL   L150B6A
         PLA
         STA   $E5
         PEI   $F6
         JSL   L150B70
         LDA   $F4
         BEQ   L0B5053
         LDA   #$0001
         STA   $E3
         BRA   L0B5058
L0B5053  LDA   #$FFFF
         STA   $E3
L0B5058  PHY
         PEI   $E3
         JSL   L1506E1
         PLA
         STA   $E1
         LDA   $F8
         LDX   #$FFD7
         STA   $00,X
         LDX   #$FFD7
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L0B5077
         EOR   #$8000
L0B5077  BPL   L0B50E1
         LDA   #$0001
         STA   $DF
L0B507E  PHY
         PHY
         PEI   $FA
         LDA   $DF
         JSL   L150488
         PHX
         PHA
         JSL   L150416
         PLA
         STA   $DB
         PLX
         STX   $DD
         LDAL  L05565D
         BEQ   L0B509C
         BRA   L0B50D4
L0B509C  PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FED7
         PHA
         PEI   $FA
         PEI   $DD
         PEI   $DB
         JSL   L070F7D
         PEA   $0100
         JSL   L0313BE
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         PEI   $E9
         PEI   $E7
         JSL   L03250F
         PLA
         STA   $D9
L0B50D4  LDA   $DF
         LDX   #$FFD7
         CMP   $00,X
         BEQ   L0B50E1
         INC   $DF
         BRA   L0B507E
L0B50E1  PEI   $E5
         JSL   L150B70
         PHY
         PEI   $E1
         JSL   L1506E1
         PLA
         STA   $E1
L0B50F1  LDA   $E7
         LDX   $E9
         STA   $FC
         STX   $FE
         LDA   $F2
         STA   $FA
         LDA   $F1
         STA   $F9
         LDA   $EF
         TCD
         TSC
         CLC
         ADC   #$0222
         TCS
         RTL

L0B510B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   $0E
         AND   #$8000
         BEQ   L0B511D
         LDA   #$0001
L0B511D  STA   $01
         LDA   $01
         BEQ   L0B513B
         PHY
         PEA   ^L040405
         PEA   L040405
         JSL   L0946A2
         PLA
         LSR
         BCS   L0B513B
         PEA   $002D
         JSL   L0B0B7A
         BRA   L0B514F
L0B513B  PEI   $0E
         PEI   $0C
         JSL   L0B422F
*         LDA   $01
*         BEQ   L0B514F
*         PEI   $0E
*         PEI   $0C
*         JSL   L07187A
L0B514F  LDA   $0A
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

L0B5161  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         STZ   $1C
         STZ   $1E
         PEI   $1A
         PEI   $18
         JSL   L0E0EA8
         PHY
         JSL   L0B7725
         PLA
         LSR
         BCC   L0B51C5
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $000A
         PEA   $0006
         JSL   L0E0656
         LDA   $05
         BEQ   L0B51BD
         PHY
         PHY
         PEA   $000B
         PEI   $03
         PEI   $01
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         _ConvSeconds
         STAL  L05565D
         PLA
         STA   $1C
         PLX
         STX   $1E
         BRA   L0B51C5
L0B51BD  LDA   $07
         LDX   $09
         STA   $1C
         STX   $1E
L0B51C5  LDA   $16
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

L0B51D7  PHD
         TSC
         CLC
         ADC   #$FFE2
         TCS
         TCD
         STZ   $28
         JSL   L0B0000
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BNE   L0B51F2
         INX
L0B51F2  PHX
         LDX   #$0000
         LDA   #$0007
         CMPL  L051BE0
         BNE   L0B5200
         INX
L0B5200  TXA
         AND   $01,S
         PLX
         STA   $19
         JSL   L0B28E4
         LDA   $19
         BNE   L0B5210
         BRA   L0B527F
L0B5210  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L051054
         PEA   L051054
         PEA   $0018
         JSL   L0313BE
         LDA   #L051BE6
         LDX   #^L051BE6
         CMP   L0553B9
         BNE   L0B5234
         CPX   L0553BB
L0B5234  BNE   L0B5242
         PEA   ^L051054
         PEA   L051054
         JSL   L0B0D0A
         BRA   L0B525E
L0B5242  PEA   ^L051054
         PEA   L051054
         LDA   L0553B9
         LDX   L0553BB
         CLC
         ADC   #$0020
         BCC   L0B5255
         INX
L0B5255  PHX
         PHA
         PEA   $0018
         JSL   L0313BE
L0B525E  PHY
         PEA   $0001
         JSL   L0E2DD3
         PLA
         STA   $28
         PEA   ^L051054
         PEA   L051054
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0018
         JSL   L0313BE
L0B527F  LDA   $22
         STA   $26
         LDA   $21
         STA   $25
         LDA   $1F
         TCD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L0B5291  PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         STZ   $1E
         LDA   #$0013
         CMPL  L051BDE
         BEQ   L0B52A7
         BRL   L0B53A6
L0B52A7  LDAL  L051BE0
         STA   $07
         LDAL  L051BE4
         TAX
         LDAL  L051BE2
         STA   $09
         STX   $0B
         LDA   L0553D1
         LDX   L0553D3
         STA   $0F
         STX   $11
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         CLC
         ADC   #$0080
         BCC   L0B52D3
         INX
L0B52D3  PHX
         PHA
         LDA   $07
         JSL   L150488
         TAY
         BNE   L0B52DF
         DEX
L0B52DF  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $0F
         STX   $11
         LDA   [$0F]
         STA   $05
         LDX   #$0000
         LDA   #$FFFF
         CMP   $05
         BNE   L0B5305
         INX
L0B5305  PHX
         LDX   #$0000
         LDA   $1C
         BNE   L0B530E
         INX
L0B530E  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0B5318
         BRL   L0B53A6
L0B5318  LDA   $07
         DEC
         ASL
         ASL
         TAX
*         LDAL  L032B52+2,X
*         PHA
*         LDAL  L032B52,X
*         PLX
*         STA   $01
*         STX   $03
*         LDA   $03
         ldal  L032B52,x
         sta   $01
         ldal  L032B52+2,x
         sta   $03
         AND   #$4000
         BNE   L0B53A6
         JSL   L0B0000
         LDA   #$FFFF
         CMP   $05
         BEQ   L0B5399
         LDX   #$0000
         LDA   #$0016
         CMPL  L051BDE
         BNE   L0B534B
         INX
L0B534B  PHX
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BE0
         BNE   L0B5359
         INX
L0B5359  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0B5366
         JSL   L0B0000
         BRA   L0B536C
L0B5366  JSL   L0B28E4
         BRA   L0B53A6
L0B536C  LDA   L055399
         STA   $0D
         LDA   #$0064
         STA   L055399
         PHY
         PEI   $05
         JSL   L0B4D5D
         PLA
         LSR
         BCS   L0B5394
         JSL   L0B28E4
         PEI   $0B
         PEI   $09
         JSL   L0B4FA3
         JSL   L0B28E4
         BRA   L0B53A6
L0B5394  LDA   $0D
         STA   L055399
L0B5399  LDA   #$0001
         STA   $1E
         PEI   $03
         PEI   $01
         JSL   L0B510B
L0B53A6  LDA   $16
         STA   $1C
         LDA   $15
         STA   $1B
         LDA   $13
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L0B53B8  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $12
         LDA   L0553B3
         STA   $01
         LDA   #$0003
         STA   L0553B3
         LDA   #$000C
         CMPL  L051BDE
         BNE   L0B53E1
         LDAL  L051BE0
         STA   L0553B3
         JSL   L0B0000
L0B53E1  PHY
         PEI   $10
         PEA   $0000
         PEI   $0C
         JSL   L0B5291
         PLA
         LSR
         BCC   L0B53F8
         LDA   #$0001
         STA   $12
         BRA   L0B540A
L0B53F8  PHY
         PEI   $10
         JSL   L0B5B81
         PLA
         LSR
         BCC   L0B540A
         LDA   #$0001
         STA   $12
         BRA   L0B540A
L0B540A  LDA   $01
         STA   L0553B3
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

L0B5421  PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$0011
         TCD
         PEA   $0041
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         JSL   L0B369F
         JSL   L0B0841
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$010A
         TCS
         RTL

L0B5452  PHD
         TSC
         CLC
         ADC   #$FFD6
         TCS
         TCD
         LDA   #$0004
         CMPL  L051BDE
         BNE   L0B5466
         BRL   L0B5619
L0B5466  LDA   #$0001
         STA   $34
         LDA   #$0007
         CMPL  L051BDE
         BNE   L0B547B
         JSL   L0E1220
         BRL   L0B561B
L0B547B  LDA   #$0008
         CMPL  L051BDE
         BNE   L0B54A3
         LDAL  L051BE0
         DEC
         ASL
         ASL
         TAX
         LDAL  L032DA0+2,X
         PHA
         LDAL  L032DA0,X
*         PLX
*         PHX
         PHA
         JSL   L0E0F0F
         JSL   L0B0000
         BRL   L0B561B
L0B54A3  LDX   #$0000
         LDA   #$0009
         CMPL  L051BDE
         BNE   L0B54B0
         INX
L0B54B0  TXA
         BEQ   L0B54D4
         LDX   #$0000
         LDA   #$000A
         CMPL  L051BE0
         BNE   L0B54C0
         INX
L0B54C0  TXA
         BEQ   L0B54D4
         PEA   ^L032E6A
         PEA   L032E6A
         JSL   L0E0F0F
         JSL   L0B0000
         BRL   L0B561B
L0B54D4  LDX   #$0000
         LDA   #$0016
         CMPL  L051BDE
         BNE   L0B54E1
         INX
L0B54E1  PHX
         LDX   #$0000
         LDA   #$000C
         CMPL  L051BE0
         BNE   L0B54EF
         INX
L0B54EF  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0B552F
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         JSL   L0B2A02
         JSL   L0B0000
         PHY
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L0B53B8
         PLA
         LSR
         BCC   L0B551A
         BRL   L0B561B
L0B551A  LDA   L0553A5
         BEQ   L0B5522
         BRL   L0B5619
L0B5522  TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         JSL   L0B2965
L0B552F  LDA   #$00E7
         CLC
         ADC   $30
         LDX   $32
         BCC   L0B553A
         INX
L0B553A  PHX
         PHA
         PHY
         LDA   L0553D1
         LDX   L0553D3
         STA   $27
         STX   $29
         LDY   #$0002
         LDA   [$27],Y
         TAX
         LDA   [$27]
         CLC
         ADC   #$01C2
         BCC   L0B5556
         INX
L0B5556  STA   $27
         STX   $29
         LDA   [$27]
         PHA
         JSL   L0B4D5D
         PLA
         BEQ   L0B5570
         PHA
         PHY
         JSL   L0D28FB
         PLA
         STA   $27
         PLA
         AND   $27
L0B5570  PLX
         STX   $27
         PLX
         STX   $29
         STA   [$27]
         LDY   #$00E7
         LDA   [$30],Y
         BEQ   L0B559E
         PEA   ^L050F94
         PEA   L050F94
         PEA   $0000
         PEA   $0054
         PEA   $0007
         JSL   L0E0656
         PEA   ^L050F94
         PEA   L050F94
         JSL   L0E0BFC
         BRA   L0B561B
L0B559E  PHY
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L0B53B8
         PLA
         LSR
         BCS   L0B561B
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         JSL   L0B2A02
         PHY
         JSL   L0D1732
         PLA
         LSR
         BCC   L0B55FF
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0022
         PEA   $0004
         JSL   L0E0656
         PHY
         PEA   $0064
         JSL   L0B7A56
         PLA
         LSR
         BCS   L0B55F0
         PEA   $0000
         PHD
         JSL   L0B5421
         BRA   L0B5619
L0B55F0  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B12AA
         BRA   L0B561B
L0B55FF  TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         JSL   L0B2965
         PHY
         PEA   $0000
         PHD
         JSL   L0B51D7
         PLA
         LSR
         BCS   L0B561B
L0B5619  STZ   $34
L0B561B  LDA   $2E
         STA   $32
         LDA   $2D
         STA   $31
         LDA   $2B
         TCD
         TSC
         CLC
         ADC   #$0030
         TCS
         RTL

L0B562D  PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$0011
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         JSL   L0B369F
         PLA
         PLX
         STA   $EF
         STX   $F1
         LDA   #$00FF
         AND   [$EF]
         BEQ   L0B5668
         PEA   $0032
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         JSL   L0B369F
         JSL   L0B0841
         BRA   L0B566F
L0B5668  PEA   $0033
         JSL   L0B0B7A
L0B566F  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$010A
         TCS
         RTL

L0B5681  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF2
         TCS
         ADC   #$0019
         TCD
         STZ   $FC
         LDAL  L051BDE
         DEC
         DEC
         BPL   L0B5699
         BRL   L0B576F
L0B5699  CMP   #$0005
         BMI   L0B56A1
         BRL   L0B576F
L0B56A1  SEC
         SBC   #$0000
         BNE   L0B56AA
         BRL   L0B5769
L0B56AA  DEC
         DEC
         DEC
         BEQ   L0B56B5
         DEC
         BEQ   L0B5709
         BRL   L0B576F
L0B56B5  LDA   #$0011
         CMPL  L051BE0
         BEQ   L0B56C1
         BRL   L0B5943
L0B56C1  JSL   L0B0000
         PHY
         PEA   $0064
         JSL   L0B5681
         PLA
         LSR
         BCC   L0B56F9
         PHY
         JSL   L03198D
         PLA
         LSR
         BCC   L0B56E0
         JSL   L0B2658
         BRA   L0B56F7
L0B56E0  PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         PEA   $0034
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B0841
L0B56F7  BRA   L0B5706
L0B56F9  PEA   $0035
         PEA   ^L040410
         PEA   L040410
         JSL   L0B0841
L0B5706  BRL   L0B57F0
L0B5709  LDA   #$0007
         CMPL  L051BE0
         BEQ   L0B5715
         BRL   L0B5943
L0B5715  JSL   L0B0000
         PHY
         PEA   $0000
         JSL   L0B5681
         PLA
         LSR
         BCC   L0B5759
         LDX   #$0000
         LDA   #$0006
         CMPL  L051BDE
         BNE   L0B5732
         INX
L0B5732  TXA
         BEQ   L0B574B
         LDX   #$0000
         LDA   #$000A
         CMPL  L051BE0
         BNE   L0B5742
         INX
L0B5742  TXA
         BEQ   L0B574B
         JSL   L0B0000
         BRA   L0B5757
L0B574B  JSL   L0E0000
         PEA   $0000
         PHD
         JSL   L0B562D
L0B5757  BRA   L0B5766
L0B5759  PEA   $0035
         PEA   ^L040412
         PEA   L040412
         JSL   L0B0841
L0B5766  BRL   L0B57F0
L0B5769  BRL   L0B5943
         BRL   L0B57F0
L0B576F  LDX   #$0000
         LDA   #$0016
         CMPL  L051BDE
         BNE   L0B577C
         INX
L0B577C  TXA
         BEQ   L0B57E0
         LDX   #$0000
         LDA   #$0009
         CMPL  L051BE0
         BNE   L0B578C
         INX
L0B578C  TXA
         BEQ   L0B57E0
         JSL   L0B0000
         PHY
         PEA   $0064
         JSL   L0B5681
         PLA
         LSR
         BCC   L0B57C7
         PHY
         JSL   L031A72
         PLA
         LSR
         BCC   L0B57AE
         JSL   L0B26CD
         BRA   L0B57C5
L0B57AE  PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         PEA   $0037
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B0841
L0B57C5  BRA   L0B57DE
L0B57C7  PEA   $0035
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         PEA   $0071
         JSL   L0B127A
         JSL   L0B0841
L0B57DE  BRA   L0B57F0
L0B57E0  PHY
         PEA   $0000
         PHD
         JSL   L0B5452
         PLA
         LSR
         BCS   L0B57F0
         BRL   L0B5943
L0B57F0  LDA   L0553A5
         BEQ   L0B57F8
         BRL   L0B5943
L0B57F8  LDA   #$0005
         CMPL  L051BDE
         BEQ   L0B5804
         BRL   L0B593E
L0B5804  LDAL  L051BE0
         STA   $EF
         LDA   $EF
         DEC
         ASL
         TAX
         LDAL  L03282C,X
         SEC
         SBC   $FA
         BNE   L0B581B
         BRL   L0B593E
L0B581B  BVS   L0B5820
         EOR   #$8000
L0B5820  BMI   L0B5825
         BRL   L0B593E
L0B5825  JSL   L0B0000
         LDA   $EF
         DEC
         ASL
         TAX
         LDAL  L03282C,X
         STA   $E9
         LDA   #$0008
         CMP   $EF
         BNE   L0B5840
*         LDA   $E9
*         DEC
*         STA   $E9
         dec   $e9
L0B5840  LDA   $EF
         DEC
         ASL
         ASL
         TAX
         LDAL  L0327D4+2,X
*         PHA
         sta   $ed
         LDAL  L0327D4,X
*         PLX
         STA   $EB
*         STX   $ED
*         LDA   $EB
         ORA   $ED
         BEQ   L0B585D
         LDA   #$0001
L0B585D  BEQ   L0B5870
         PHA
         PHY
         PEI   $ED
         PEI   $EB
         JSL   L0B422F
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
L0B5870  STA   $E7
         LDA   $E7
         BEQ   L0B58A2
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         PEA   $0039
         PEA   ^L050C32
         PEA   L050C32
         LDA   $EF
         DEC
         ASL
         ASL
         TAX
         LDAL  L0326C6+2,X
         PHA
         LDAL  L0326C6,X
*         PLX
*         PHX
         PHA
         JSL   L0B0897
         BRL   L0B5943
L0B58A2  PHY
         PEI   $E9
         JSL   L0B5681
         PLA
         LSR
         BCS   L0B58CC
         PEA   $0035
         LDA   $EF
         DEC
         ASL
         ASL
         TAX
         LDAL  L0326C6+2,X
         PHA
         LDAL  L0326C6,X
*         PLX
*         PHX
         PHA
         JSL   L0B0841
         JSL   L0E0000
         BRA   L0B5943
L0B58CC  LDA   $EB
         ORA   $ED
         BEQ   L0B58D5
         LDA   #$0001
L0B58D5  BEQ   L0B58E8
         PHA
         PHY
         PEI   $ED
         PEI   $EB
         JSL   L0B422F
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
L0B58E8  STA   $E7
         LDA   $E7
         BEQ   L0B591D
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0E06AC
         PEA   $0039
         PEA   ^L050C32
         PEA   L050C32
         LDA   $EF
         DEC
         ASL
         ASL
         TAX
         LDAL  L0326C6+2,X
         PHA
         LDAL  L0326C6,X
*         PLX
*         PHX
         PHA
         JSL   L0B0897
         JSL   L0E0000
         BRA   L0B5943
L0B591D  LDA   $EF
         STA   L0553AB
         LDA   $EF
         DEC
         ASL
         ASL
         TAX
         LDAL  L03277C+2,X
         PHA
         LDAL  L03277C,X
         PHA
         JSL   L0B422F
         LDA   L0553A5
         BNE   L0B5943
         BRL   L0B57F8
L0B593E  LDA   #$0001
         STA   $FC
L0B5943  LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$0112
         TCS
         RTL

L0B5955  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         LDA   L0553B5
         LDX   L0553B7
         STA   $19
         STX   $1B
         PHY
         JSL   L0B1C0F
         PLA
         STA   $17
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         PHY
         PHY
         JSL   L0B3727
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B7932
         PEI   $17
         JSL   L0B39C0
         JSL   L0E0000
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0001
         JSL   L0B2AF9
         PHY
         PEA   $0000
         JSL   L0B7A9C
         PLA
         STA   $26
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B0F05
         PEI   $1B
         PEI   $19
         PEA   $0000
         JSL   L0B2AF9
         TSC
         CLC
         ADC   #$0020
         TCS
         PLD
         RTL

L0B59D0  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   $14
         LDX   $16
         STA   $01
         STX   $03
         LDA   $10
         LDX   $12
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
         LDY   #$0010
         LDA   [$01],Y
         BEQ   L0B59FF
         PHY
         PEI   $12
         PEI   $10
         JSL   L0718FA
         PLA
         STA   $05
L0B59FF  LDA   #$0004
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B5A0A
         INX
L0B5A0A  STA   $07
         STX   $09
         PHY
         PHY
         LDY   #$0002
         LDA   [$10],Y
         PHA
         LDA   [$10]
         PHA
         PEA   $0000
         JSL   L0B44A0
         PLA
         STA   [$07]
         PLA
         LDY   #$0002
         STA   [$07],Y
         LDY   #$0010
         LDA   [$01],Y
         BEQ   L0B5A3A
         PEI   $12
         PEI   $10
         PEI   $05
         JSL   L0718DA
L0B5A3A  LDA   #$0001
         LDY   #$0008
         STA   [$01],Y
         LDA   #$0000
         LDY   #$000A
         STA   [$01],Y
         LDA   #$0000
         LDY   #$000C
         STA   [$01],Y
         LDA   #$0000
         LDY   #$000E
         STA   [$01],Y
         LDA   $0E
         STA   $16
         LDA   $0D
         STA   $15
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

L0B5A6C  PHD
         TSC
         CLC
         ADC   #$FFD4
         TCS
         TCD
         LDY   #$0023
         LDA   [$32],Y
         SEC
         SBC   #$0004
         BPL   L0B5A82
         BRL   L0B5B68
L0B5A82  CMP   #$003F
         BMI   L0B5A8A
         BRL   L0B5B68
L0B5A8A  SEC
         SBC   #$0000
         BEQ   L0B5AEB
         SEC
         SBC   #$000B
         BNE   L0B5A99
         BRL   L0B5B57
L0B5A99  DEC
         DEC
         BEQ   L0B5B09
         DEC
         BEQ   L0B5B09
         SEC
         SBC   #$000F
         BEQ   L0B5AC4
         SEC
         SBC   #$001A
         BEQ   L0B5B09
         DEC
         BEQ   L0B5B09
         DEC
         BEQ   L0B5B09
         DEC
         BEQ   L0B5B09
         DEC
         BEQ   L0B5B09
         DEC
         BEQ   L0B5B09
         DEC
         BEQ   L0B5B09
         DEC
         BEQ   L0B5B09
         BRL   L0B5B68
L0B5AC4  LDY   #$0021
         LDA   [$32],Y
         TAX
         DEY
         DEY
         LDA   [$32],Y
         CLC
         ADC   #$00CE
         BCC   L0B5AD5
         INX
L0B5AD5  STA   $29
         STX   $2B
         LDA   #$0020
         AND   [$29]
         BEQ   L0B5AE3
         LDA   #$0001
L0B5AE3  PHA
         JSL   L0E0E4B
         BRL   L0B5B6F
L0B5AEB  PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDY   #$0021
         LDA   [$32],Y
         PHA
         DEY
         DEY
         LDA   [$32],Y
         PHA
         JSL   L160678
         JSL   L0E0F0F
         BRA   L0B5B6F
L0B5B09  LDY   #$0021
         LDA   [$32],Y
         PHA
         DEY
         DEY
         LDA   [$32],Y
         PHA
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         JSL   L0B1831
         PHY
         PEI   $23
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $23
         PHY
         PEI   $27
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $27
         LDA   $21
         STA   $21
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         LDY   #$0023
         LDA   [$32],Y
         PHA
         PEA   $0001
         JSL   L0E0F65
         BRA   L0B5B6F
L0B5B57  LDY   #$0021
         LDA   [$32],Y
         PHA
         DEY
         DEY
         LDA   [$32],Y
         PHA
         JSL   L0E0E79
         BRA   L0B5B6F
L0B5B68  PEA   $003E
         JSL   L0B0B7A
L0B5B6F  LDA   $30
         STA   $34
         LDA   $2F
         STA   $33
         LDA   $2D
         TCD
         TSC
         CLC
         ADC   #$0032
         TCS
         RTL

L0B5B81  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         STZ   $30
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L0B2A02
         LDA   #$0014
         CMPL  L051BDE
         BEQ   L0B5BA4
         BRL   L0B5CA9
L0B5BA4  LDA   L055349
         STA   $1D
         LDAL  L051BE0
         STA   L055349
         PHY
         LDA   L0553D1
         LDX   L0553D3
         STA   $25
         STX   $27
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         CLC
         ADC   #$01C0
         BCC   L0B5BCA
         INX
L0B5BCA  STA   $25
         STX   $27
         LDA   [$25]
         PHA
         JSL   L0B4D5D
         PLA
         LSR
         BCS   L0B5BE1
         LDA   $1D
         STA   L055349
         BRL   L0B5CA9
L0B5BE1  LDA   $1D
         STA   L055349
         STZ   $1F
         STZ   $21
         PHY
         JSL   L0314F6
         PLA
         DEC
         DEC
         BMI   L0B5C39
         CMP   #$0002
         BPL   L0B5C39
         SEC
         SBC   #$0000
         BEQ   L0B5C04
         DEC
         BEQ   L0B5C21
         BRA   L0B5C39
L0B5C04  PHY
         PHY
         JSL   L0E061D
         PLA
         STA   $1F
         PLX
         STX   $21
         LDA   $1F
         ORA   $21
         BNE   L0B5C1F
         PEA   $0084
         JSL   L0B0B7A
         BRA   L0B5C90
L0B5C1F  BRA   L0B5C5B
L0B5C21  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0018
         PEA   $000F
         JSL   L0E0656
         BRA   L0B5C5B
L0B5C39  LDA   L055039
         LDX   L05503B
         STA   $03
         STX   $05
         LDA   #$0005
         STA   $01
         LDA   $2E
         BNE   L0B5C5B
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L0B2965
         BRA   L0B5CA9
L0B5C5B  TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0015
         JSL   L0E0656
         LDA   $1F
         ORA   $21
         BEQ   L0B5C81
         PEA   $0000
         PHD
         JSL   L0B5A6C
         BRA   L0B5C90
L0B5C81  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $23
         JSL   L0B6DE3
L0B5C90  LDA   L0553A5
         BEQ   L0B5CA4
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L0B2965
         BRA   L0B5CA9
L0B5CA4  LDA   #$0001
         STA   $30
L0B5CA9  LDA   $2C
         STA   $2E
         LDA   $2B
         STA   $2D
         LDA   $29
         TCD
         TSC
         CLC
         ADC   #$002C
         TCS
         RTL

L0B5CBB  PHD
         TSC
         CLC
         ADC   #$FFD4
         TCS
         TCD
         LDA   $32
         SEC
         SBC   #$0002
         BPL   L0B5CCE
         BRL   L0B5EE7
L0B5CCE  CMP   #$0049
         BMI   L0B5CD6
         BRL   L0B5EE7
L0B5CD6  ASL
         TAX
         LDAL  L0B5CDE,X
         PHA
         RTS

L0B5CDE  DA    L0B5E0E-1
         DA    L0B5EE7-1
         DA    L0B5D70-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EAE-1
         DA    L0B5EC3-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5E3F-1
         DA    L0B5E3F-1
         DA    L0B5E3F-1
         DA    L0B5E3F-1
         DA    L0B5E3F-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5D97-1
         DA    L0B5DB8-1
         DA    L0B5E3F-1
         DA    L0B5E3F-1
         DA    L0B5E3F-1
         DA    L0B5E3F-1
         DA    L0B5E3F-1
         DA    L0B5E3F-1
         DA    L0B5E3F-1
         DA    L0B5E3F-1
         DA    L0B5E3F-1
         DA    L0B5DC3-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5D7D-1
         DA    L0B5DCE-1
         DA    L0B5DE2-1
         DA    L0B5EE7-1
         DA    L0B5DAD-1
         DA    L0B5D8A-1
         DA    L0B5DED-1
         DA    L0B5E03-1
         DA    L0B5DF8-1
         DA    L0B5EE7-1
         DA    L0B5DA2-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5E48-1
         DA    L0B5E57-1
         DA    L0B5E62-1
         DA    L0B5E97-1
         DA    L0B5EE7-1
         DA    L0B5EE7-1
         DA    L0B5E3F-1
         DA    L0B5ED1-1

L0B5D70  PEA   ^L040414
         PEA   L040414
         JSL   L0E0F0F
         BRL   L0B5EEE
L0B5D7D  PEA   ^L04041E
         PEA   L04041E
         JSL   L0E0F0F
         BRL   L0B5EEE
L0B5D8A  PEA   ^L050F74
         PEA   L050F74
         JSL   L0E0F0F
         BRL   L0B5EEE
L0B5D97  LDA   L0551FB
         PHA
         JSL   L0E0E11
         BRL   L0B5EEE
L0B5DA2  LDA   L055243
         PHA
         JSL   L0E0E4B
         BRL   L0B5EEE
L0B5DAD  LDA   L055215
         PHA
         JSL   L0E0E11
         BRL   L0B5EEE
L0B5DB8  LDA   L055219
         PHA
         JSL   L0E0E4B
         BRL   L0B5EEE
L0B5DC3  LDA   L055153
         PHA
         JSL   L0E0E4B
         BRL   L0B5EEE
L0B5DCE  LDA   L054FBB
         PHA
         LDX   #$0000
         PLA
         BPL   L0B5DD9
         INX
L0B5DD9  TXA
         PHA
         JSL   L0E0E4B
         BRL   L0B5EEE
L0B5DE2  LDA   L0551DD
         PHA
         JSL   L0E0E4B
         BRL   L0B5EEE
L0B5DED  LDA   L05521B
         PHA
         JSL   L0E0E4B
         BRL   L0B5EEE
L0B5DF8  LDA   L055217
         PHA
         JSL   L0E0E4B
         BRL   L0B5EEE
L0B5E03  LDA   L05524D
         PHA
         JSL   L0E0E4B
         BRL   L0B5EEE
L0B5E0E  LDA   L0553B3
         DEC
         BNE   L0B5E32
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDA   L05501B
         LDX   L05501D
         PHX
         PHA
         PEA   $0008
         JSL   L07334A
         JSL   L0E0F0F
         BRA   L0B5E3C
L0B5E32  PEA   ^L052526
         PEA   L052526
         JSL   L0E0F0F
L0B5E3C  BRL   L0B5EEE
L0B5E3F  PEI   $32
         JSL   L0B6260
         BRL   L0B5EEE
L0B5E48  LDA   L054FA3
         LDX   L054FA5
         PHX
         PHA
         JSL   L0E0CB5
         BRL   L0B5EEE
L0B5E57  LDA   L054FA7
         PHA
         JSL   L0E0E4B
         BRL   L0B5EEE
L0B5E62  LDAL  L040426
         SEP   #$20
         STA   $15
         REP   #$20
         PHY
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L160686
         PLA
         LSR
         BCS   L0B5E88
         LDAL  L040427
         SEP   #$20
         STA   $15
         REP   #$20
L0B5E88  TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L0E0F0F
         BRA   L0B5EEE
L0B5E97
*         PHY
*         PEA   $00E0
*         PEA   $C034
*         JSL   L071A89
*         PLA
         ldal  $e0C034	; AV 202208
         AND   #$000F
         INC
         PHA
         JSL   L0E0E11
         BRA   L0B5EEE
L0B5EAE  PEA   ^L041CB3
         PEA   L041CB3
         PEA   $0000
         PEA   $0020
         PEA   $0018
         JSL   L0E07C5
         BRA   L0B5EEE
L0B5EC3  LDA   L055279
         LDX   L05527B
         PHX
         PHA
         JSL   L0E0E79
         BRA   L0B5EEE
L0B5ED1  LDA   L055277
         XBA
         INC
         STA   $15
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L0E0F0F
         BRA   L0B5EEE
L0B5EE7  PEA   $003E
         JSL   L0B0B7A
L0B5EEE  LDA   $30
         STA   $32
         LDA   $2F
         STA   $31
         LDA   $2D
         TCD
         TSC
         CLC
         ADC   #$0030
         TCS
         RTL

L0B5F00  PHD
         TSC
         CLC
         ADC   #$FDA4
         TCS
         ADC   #$016B
         TCD
         LDX   #$0000
         LDA   [$F8]
         DEC
         DEC
         BNE   L0B5F15
         INX
L0B5F15  TXA
         STA   $E3
         LDA   $E3
         BEQ   L0B5F4C
         LDY   #$000C
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         STA   $DB
         STX   $DD
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         PEA   ^L040428
         PEA   L040428
         PEA   $0005
         JSL   L0313BE
         LDA   #$4143
         LDX   #$4452
         STA   $DF
         STX   $E1
         BRA   L0B5F7A
L0B5F4C  LDY   #$0008
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         STA   $DB
         STX   $DD
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         PEA   ^L04042D
         PEA   L04042D
         PEA   $0006
         JSL   L0313BE
         LDA   #$4B42
         LDX   #$4447
         STA   $DF
         STX   $E1
L0B5F7A  LDA   $F6
         DEC
         DEC
         DEC
         BPL   L0B5F84
         BRL   L0B6247
L0B5F84  CMP   #$0037
         BMI   L0B5F8C
         BRL   L0B6247
L0B5F8C  SEC
         SBC   #$0000
         BEQ   L0B5FCB
         DEC
         BEQ   L0B5FDC
         DEC
         BNE   L0B5F9B
         BRL   L0B615C
L0B5F9B  DEC
         BNE   L0B5FA1
         BRL   L0B615C
L0B5FA1  DEC
         BNE   L0B5FA7
         BRL   L0B6206
L0B5FA7  DEC
         BNE   L0B5FAD
         BRL   L0B6206
L0B5FAD  SEC
         SBC   #$0007
         BNE   L0B5FB6
         BRL   L0B6084
L0B5FB6  SEC
         SBC   #$000C
         BNE   L0B5FBF
         BRL   L0B615C
L0B5FBF  SEC
         SBC   #$001E
         BNE   L0B5FC8
         BRL   L0B615C
L0B5FC8  BRL   L0B6247
L0B5FCB  PHY
         PHY
         PEI   $DD
         PEI   $DB
         JSL   L07AACB
         JSL   L0B79B1
         BRL   L0B624E
L0B5FDC  PEA   ^L050C32
         PEA   L050C32
         PEA   $0000
         TDC
         CLC
         ADC   #$FE95
         PHA
         PEI   $DD
         PEI   $DB
         JSL   L07AA4B
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         ANDL  L050C32
         BNE   L0B6042
         PEA   ^L050C32
         PEA   L050C32
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         PEA   ^L040433
         PEA   L040433
         PEA   $0000
         TDC
         CLC
         ADC   #$FF81
         PHA
         PEI   $DD
         PEI   $DB
         JSL   L0715D9
         TDC
         CLC
         ADC   #$005D
         PEA   $0000
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0037
         JSL   L0313BE
         BRA   L0B607F
L0B6042  LDA   L0553B3
         BEQ   L0B607F
         PEA   ^L050C32
         PEA   L050C32
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         PEA   ^L040438
         PEA   L040438
         PEA   ^L050C32
         PEA   L050C32
         PEA   ^L04043B
         PEA   L04043B
         PEA   $0000
         TDC
         CLC
         ADC   #$FF95
         PHA
         PEA   $0004
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B607F  BRA   L0B60E0
         BRL   L0B624E
L0B6084  LDA   $E3
         BNE   L0B608B
         BRL   L0B6151
L0B608B  PEA   ^L050C32
         PEA   L050C32
         PEA   $0000
         TDC
         CLC
         ADC   #$FF81
         PHA
         PEI   $DD
         PEI   $DB
         JSL   L0715D9
         PEA   $0014
         JSL   L0313BE
         LDA   L0553B3
         BEQ   L0B60E0
         PEA   ^L050C32
         PEA   L050C32
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         PEA   ^L04043D
         PEA   L04043D
         PEA   ^L050C32
         PEA   L050C32
         PEA   $0000
         TDC
         CLC
         ADC   #$FF95
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B60E0  LDA   L0553B3
         DEC
         BNE   L0B6145
         PHY
         PHY
         LDY   #$0004
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L07899F
         PLA
         STA   $E5
         PLX
         STX   $E7
         PEA   ^L050C32
         PEA   L050C32
         PEA   ^L050C32
         PEA   L050C32
         PEA   ^L040442
         PEA   L040442
         PEA   $0000
         TDC
         CLC
         ADC   #$FE95
         PHA
         PEI   $E7
         PEI   $E5
         JSL   L072CD4
         PEA   ^L04044E
         PEA   L04044E
         PEA   $0000
         TDC
         CLC
         ADC   #$FF95
         PHA
         PEA   $0004
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         PEI   $E7
         PEI   $E5
         JSL   L07185A
L0B6145  PEA   ^L050C32
         PEA   L050C32
         JSL   L0E0EA8
         BRA   L0B6159
L0B6151  PEI   $DD
         PEI   $DB
         JSL   L0E0E79
L0B6159  BRL   L0B624E
L0B615C  PHY
         PHY
         PEI   $DD
         PEI   $DB
         PEI   $E1
         PEI   $DF
         PEA   $0000
         JSL   L077624
         PLA
         STA   $E9
         PLX
         STX   $EB
         LDA   $E9
         ORA   $EB
         BNE   L0B6183
         PEA   $0000
         JSL   L0E0E4B
         BRL   L0B6204
L0B6183  LDA   $F6
         SEC
         SBC   #$0005
         BMI   L0B61C3
         CMP   #$0035
         BPL   L0B61C3
         SEC
         SBC   #$0000
         BEQ   L0B61AE
         DEC
         BEQ   L0B61B5
         SEC
         SBC   #$0015
         BEQ   L0B61BC
         SEC
         SBC   #$001E
         BEQ   L0B61A7
         BRA   L0B61C3
L0B61A7  LDA   #$2000
         STA   $D9
         BRA   L0B61C3
L0B61AE  LDA   #$8000
         STA   $D9
         BRA   L0B61C3
L0B61B5  LDA   #$4000
         STA   $D9
         BRA   L0B61C3
L0B61BC  LDA   #$0800
         STA   $D9
         BRA   L0B61C3
L0B61C3  LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         CLC
         ADC   #$0010
         BCC   L0B61D2
         INX
L0B61D2  STA   $ED
         STX   $EF
         LDA   $D9
         AND   [$ED]
         BEQ   L0B61DF
         LDA   #$0001
L0B61DF  STA   $D7
         LDA   #$0039
         CMP   $F6
         BNE   L0B61EF
         LDA   $D7
         EOR   #$0001
         STA   $D7
L0B61EF  PEI   $D7
         JSL   L0E0E4B
         PEI   $DD
         PEI   $DB
         PEI   $E1
         PEI   $DF
         PEA   $0000
         JSL   L074B81
L0B6204  BRA   L0B624E
L0B6206  PEI   $DD
         PEI   $DB
         TDC
         CLC
         ADC   #$00D5
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00B5
         PEA   $0000
         PHA
         JSL   L07A972
         LDA   #$0008
         CMP   $F6
         BNE   L0B623F
         TDC
         CLC
         ADC   #$00B5
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0020
         PEA   $0018
         JSL   L0E07C5
         BRA   L0B6245
L0B623F  PEI   $D5
         JSL   L0E0E4B
L0B6245  BRA   L0B624E
L0B6247  PEA   $003E
         JSL   L0B0B7A
L0B624E  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0264
         TCS
         RTL

L0B6260  PHD
         TSC
         CLC
         ADC   #$FEFA
         TCS
         ADC   #$0011
         TCD
         LDA   $FA
         SEC
         SBC   #$0013
         BPL   L0B6276
         BRL   L0B639E
L0B6276  CMP   #$0037
         BMI   L0B627E
         BRL   L0B639E
L0B627E  SEC
         SBC   #$0000
         BNE   L0B6287
         BRL   L0B632A
L0B6287  DEC
         BNE   L0B628D
         BRL   L0B6335
L0B628D  DEC
         BNE   L0B6293
         BRL   L0B6366
L0B6293  DEC
         BNE   L0B6299
         BRL   L0B6371
L0B6299  DEC
         BNE   L0B629F
         BRL   L0B6389
L0B629F  SEC
         SBC   #$000D
         BEQ   L0B62C9
         DEC
         BEQ   L0B62D4
         DEC
         BEQ   L0B62DF
         DEC
         BEQ   L0B62EA
         DEC
         BEQ   L0B62F5
         DEC
         BEQ   L0B6300
         DEC
         BEQ   L0B630B
         DEC
         BEQ   L0B6316
         DEC
         BEQ   L0B6320
         SEC
         SBC   #$001D
         BNE   L0B62C6
         BRL   L0B6394
L0B62C6  BRL   L0B639E
L0B62C9  LDA   L055313
         PHA
         JSL   L0E0E4B
         BRL   L0B639E
L0B62D4  LDA   L055303
         PHA
         JSL   L0E0E11
         BRL   L0B639E
L0B62DF  LDA   L0550B7
         PHA
         JSL   L0E0E4B
         BRL   L0B639E
L0B62EA  LDA   L05530B
         PHA
         JSL   L0E0E4B
         BRL   L0B639E
L0B62F5  LDA   L055311
         PHA
         JSL   L0E0E4B
         BRL   L0B639E
L0B6300  LDA   L05530F
         PHA
         JSL   L0E0E11
         BRL   L0B639E
L0B630B  LDA   L0550B5
         PHA
         JSL   L0E0E11
         BRL   L0B639E
L0B6316  LDA   L055305
         PHA
         JSL   L0E0E11
         BRA   L0B639E
L0B6320  LDA   L055307
         PHA
         JSL   L0E0E11
         BRA   L0B639E
L0B632A  LDAL  L051ED6
         PHA
         JSL   L0B6D7D
         BRA   L0B639E
L0B6335  PHY
         LDAL  L051ED8
         PHA
         PEA   ^L050C32
         PEA   L050C32
         JSL   L1514AE
         PLA
         STA   $EF
         LDA   #$8000
         AND   $EF
         BNE   L0B635B
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0E0EA8
         BRA   L0B6364
L0B635B  LDAL  L051ED8
         PHA
         JSL   L0E0E11
L0B6364  BRA   L0B639E
L0B6366  LDAL  L051EDA
         PHA
         JSL   L0E0E11
         BRA   L0B639E
L0B6371  PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         LDAL  L051EDC
         PHA
         JSL   L0B3436
         JSL   L0E0F0F
         BRA   L0B639E
L0B6389  LDAL  L051EDE
         PHA
         JSL   L0E0E11
         BRA   L0B639E
L0B6394  LDA   L055309
         PHA
         JSL   L0E0E4B
         BRA   L0B639E
L0B639E  LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$010A
         TCS
         RTL

L0B63B0  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   $10
         LDA   #$00B9
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L0B63C8
         INX
L0B63C8  CLC
         ADC   #$0004
         BCC   L0B63CF
         INX
L0B63CF  STA   $01
         STX   $03
         LDA   #$000F
         AND   [$01]
         CMP   $0E
         BEQ   L0B63E5
         STZ   $10
         PEA   $003E
         JSL   L0B0B7A
L0B63E5  LDA   $08
         STA   $0E
         LDA   $07
         STA   $0D
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L0B63F7  PHD
         TSC
         CLC
         ADC   #$FBCA
         TCS
         ADC   #$0343
         TCD
         LDY   #$00FA
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         CLC
         ADC   #$0010
         BCC   L0B6413
         INX
L0B6413  STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STA   $EB
         STX   $ED
         LDY   #$00FA
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         CLC
         ADC   #$000A
         BCC   L0B6434
         INX
L0B6434  STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STA   $E7
         STX   $E9
         LDA   #$00B9
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0B644F
         INX
L0B644F  CLC
         ADC   #$0002
         BCC   L0B6456
         INX
L0B6456  STA   $EF
         STX   $F1
         LDA   [$EF]
         STA   $E5
         LDA   #$00B9
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L0B6469
         INX
L0B6469  CLC
         ADC   #$0004
         BCC   L0B6470
         INX
L0B6470  STA   $EF
         STX   $F1
         LDA   #$000F
         AND   [$EF]
         DEC
         DEC
         BNE   L0B6495
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   ^L040450
         PEA   L040450
         PEA   $0007
         JSL   L0313BE
         BRA   L0B64AB
L0B6495  TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   ^L040457
         PEA   L040457
         PEA   $0008
         JSL   L0313BE
L0B64AB  LDA   $E7
         LDX   $E9
         CMP   $EB
         BNE   L0B64B5
         CPX   $ED
L0B64B5  BNE   L0B64CF
         TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         PEA   ^L04045F
         PEA   L04045F
         PEA   $0006
         JSL   L0313BE
         BRA   L0B64E5
L0B64CF  TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         PEA   ^L040465
         PEA   L040465
         PEA   $0007
         JSL   L0313BE
L0B64E5  PEA   ^L050C32
         PEA   L050C32
         PEA   $0000
         TDC
         CLC
         ADC   #$FDBD
         PHA
         PEI   $ED
         PEI   $EB
         PEI   $E5
         JSL   L07ACF0
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         ANDL  L050C32
         BNE   L0B655A
         PEA   ^L050C32
         PEA   L050C32
         TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   ^L04046C
         PEA   L04046C
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA9
         PHA
         LDA   $E5
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7F
         PHA
         PEA   $0004
         JSL   L1509CE
         PEA   $003D
         JSL   L0313BE
         BRA   L0B65A0
L0B655A  LDA   L0553B3
         BEQ   L0B65A0
         PEA   ^L050C32
         PEA   L050C32
         TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   ^L040470
         PEA   L040470
         PEA   ^L050C32
         PEA   L050C32
         PEA   ^L040472
         PEA   L040472
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBD
         PHA
         PEA   $0005
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B65A0  LDA   L0553B3
         DEC
         BEQ   L0B65A9
         BRL   L0B66CA
L0B65A9  PEA   ^L050C32
         PEA   L050C32
         PEA   ^L050C32
         PEA   L050C32
         PEA   ^L040474
         PEA   L040474
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBD
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBD
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDBD
         PHA
         PEI   $E9
         PEI   $E7
         JSL   L07AA4B
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FFBD
         AND   $00,X
         BNE   L0B6639
         PEA   ^L050C32
         PEA   L050C32
         PEA   ^L050C32
         PEA   L050C32
         PEA   ^L04047E
         PEA   L04047E
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA9
         PHA
         PEI   $E9
         PEI   $E7
         JSL   L0715D9
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBD
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRA   L0B6671
L0B6639  PEA   ^L050C32
         PEA   L050C32
         PEA   ^L050C32
         PEA   L050C32
         PEA   ^L040482
         PEA   L040482
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBD
         PHA
         PEA   ^L040484
         PEA   L040484
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBD
         PHA
         PEA   $0004
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B6671  PEA   ^L050C32
         PEA   L050C32
         PEA   ^L050C32
         PEA   L050C32
         PEA   ^L040486
         PEA   L040486
         PEA   $0000
         TDC
         CLC
         ADC   #$FDBD
         PHA
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L072CD4
         PEA   $0000
         TDC
         CLC
         ADC   #$FCBD
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072CD4
         PEA   ^L040492
         PEA   L040492
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBD
         PHA
         PEA   $0005
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B66CA  PEA   ^L050C32
         PEA   L050C32
         JSL   L0E0F0F
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$043C
         TCS
         RTL

L0B66E6  PHD
         TSC
         CLC
         ADC   #$FEC8
         TCS
         ADC   #$0047
         TCD
         PHY
         LDY   #$0012
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         LDY   #$000E
         LDA   [$F8],Y
         PHA
         TDC
         CLC
         ADC   #$00B9
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCS   L0B6717
         BRL   L0B6B2D
L0B6717  LDA   $F6
         SEC
         SBC   #$0003
         BPL   L0B6722
         BRL   L0B6B24
L0B6722  CMP   #$0046
         BMI   L0B672A
         BRL   L0B6B24
L0B672A  ASL
         TAX
         LDAL  L0B6732,X
         PHA
         RTS

L0B6732  DA    L0B67BC+1
         DA    L0B67D5+2
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6AB9+1
         DA    L0B6AC6+1
         DA    L0B6AE8+1
         DA    L0B6B05+1
         DA    L0B6AD3+1
         DA    L0B67E0+2
         DA    L0B67E9+2
         DA    L0B687E+2
         DA    L0B687E+2
         DA    L0B6A5D+2
         DA    L0B6A66+2
         DA    L0B6A92+2
         DA    L0B6A9B+2
         DA    L0B6AB1+1
         DA    L0B6893+2
         DA    L0B68AE+2
         DA    L0B6932+2
         DA    L0B6908+2
         DA    L0B68F9+2
         DA    L0B68EA+2
         DA    L0B68DB+2
         DA    L0B68CC+2
         DA    L0B69B1+2
         DA    L0B6A15+2
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6956+2
         DA    L0B68BD+2
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B687E+2
         DA    L0B687E+2
         DA    L0B687E+2
         DA    L0B687E+2
         DA    L0B687E+2
         DA    L0B687E+2
         DA    L0B687E+2
         DA    L0B687E+2
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6B22+1
         DA    L0B6A28+2
L0B67BC  DA    L0B6A3B+2
         MX    %00
         PHY
         PHY
         LDY   #$0012
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         PEI   $BB
         JSL   L07AE68
         JSL   L0B79B1
L0B67D5  BRL   L0B6B2B
         PEA   $0000
         PHD
         JSL   L0B63F7
L0B67E0  BRL   L0B6B2B
         PEI   $BB
         JSL   L0E0E11
L0B67E9  BRL   L0B6B2B
         LDA   #$000F
         AND   $C7
         SEC
         SBC   #$0000
         BMI   L0B6874
         CMP   #$0008
         BPL   L0B6874
         ASL
         TAX
         LDAL  L0B6804,X
         PHA
         RTS

L0B6804  DA    L0B6812+1
         DA    L0B681E+1
         DA    L0B682A+1
         DA    L0B6836+1
         DA    L0B6842+1
         DA    L0B684E+1
         DA    L0B685A+1
L0B6812  DA    L0B6866+1
         PEA   ^L040494
         PEA   L040494
         JSL   L0E0F0F
L0B681E  BRA   L0B687E
         PEA   ^L0404A0
         PEA   L0404A0
         JSL   L0E0F0F
L0B682A  BRA   L0B687E
         PEA   ^L0404A7
         PEA   L0404A7
         JSL   L0E0F0F
L0B6836  BRA   L0B687E
         PEA   ^L0404B1
         PEA   L0404B1
         JSL   L0E0F0F
L0B6842  BRA   L0B687E
         PEA   ^L0404BB
         PEA   L0404BB
         JSL   L0E0F0F
L0B684E  BRA   L0B687E
         PEA   ^L0404C2
         PEA   L0404C2
         JSL   L0E0F0F
L0B685A  BRA   L0B687E
         PEA   ^L0404CB
         PEA   L0404CB
         JSL   L0E0F0F
L0B6866  BRA   L0B687E
         PEA   ^L0404D7
         PEA   L0404D7
         JSL   L0E0F0F
         BRA   L0B687E
L0B6874  LDA   #$000F
         AND   $C7
         PHA
         JSL   L0E0E11
L0B687E  BRL   L0B6B2B
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         PEI   $F6
         PEA   $0000
         JSL   L0E0F65
L0B6893  BRL   L0B6B2B
         PHY
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L0B63B0
         PLA
         LSR
         BCC   L0B68AE
         PEI   $CB
         PEI   $C9
         JSL   L0E0E79
L0B68AE  BRL   L0B6B2B
         LDA   #$0001
         STA   $E5
         LDA   #$8000
         STA   $E7
         BRA   L0B6915
L0B68BD  BRL   L0B6B2B
         LDA   #$0001
         STA   $E5
         LDA   #$2000
         STA   $E7
         BRA   L0B6915
L0B68CC  BRL   L0B6B2B
         LDA   #$0002
         STA   $E5
         LDA   #$8000
         STA   $E7
         BRA   L0B6915
L0B68DB  BRL   L0B6B2B
         LDA   #$0002
         STA   $E5
         LDA   #$4000
         STA   $E7
         BRA   L0B6915
L0B68EA  BRL   L0B6B2B
         LDA   #$0002
         STA   $E5
         LDA   #$2000
         STA   $E7
         BRA   L0B6915
L0B68F9  BRL   L0B6B2B
         LDA   #$0002
         STA   $E5
         LDA   #$1000
         STA   $E7
         BRA   L0B6915
L0B6908  BRL   L0B6B2B
         LDA   #$0002
         STA   $E5
         LDA   #$0800
         STA   $E7
L0B6915  PHY
         PEI   $E5
         PEA   $0000
         PHD
         JSL   L0B63B0
         PLA
         LSR
         BCC   L0B6932
         LDA   $E7
         AND   $C7
         BEQ   L0B692D
         LDA   #$0001
L0B692D  PHA
         JSL   L0E0E4B
L0B6932  BRL   L0B6B2B
         PHY
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L0B63B0
         PLA
         LSR
         BCC   L0B6956
         LDA   #$00F0
         AND   $BD
         PHA
         PEA   $0004
         JSL   L1510EF
         JSL   L0E0E11
L0B6956  BRL   L0B6B2B
         PHY
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L0B63B0
         PLA
         LSR
         BCC   L0B69B1
         LDA   $BB
         STA   $EB
         LDY   #$0012
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         LDY   #$000C
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         JSL   L033477
         BNE   L0B6990
         LDA   $EB
         EOR   #$FFFF
         INC
         STA   $EB
L0B6990  PHY
         LDY   #$0008
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         LDY   #$000C
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         PEI   $EB
         JSL   L07A609
         JSL   L0E0E4B
L0B69B1  BRL   L0B6B2B
         PHY
         PEA   $0002
         PEA   $0000
         PHD
         JSL   L0B63B0
         PLA
         LSR
         BCC   L0B6A15
         LDA   $BB
         STA   $E9
         LDY   #$0012
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         LDY   #$000C
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         JSL   L033477
         BNE   L0B69EB
         LDA   $E9
         EOR   #$FFFF
         INC
         STA   $E9
L0B69EB  LDA   #$000F
         AND   $C7
         CMP   #$0007
         BEQ   L0B69FE
         PEA   $0021
         JSL   L0B0B7A
         BRA   L0B6A15
L0B69FE  PHY
         PEI   $E9
         JSL   L086029
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B6A0F
         DEX
L0B6A0F  PHX
         PHA
         JSL   L0E0DE2
L0B6A15  BRL   L0B6B2B
         LDX   #$0000
         LDA   #$8000
         AND   $BD
         BNE   L0B6A23
         INX
L0B6A23  PHX
         JSL   L0E0E4B
L0B6A28  BRL   L0B6B2B
         PHY
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L0B63B0
         PLA
         LSR
         BCS   L0B6A4E
L0B6A3B  BRL   L0B6B2B
         PHY
         PEA   $0002
         PEA   $0000
         PHD
         JSL   L0B63B0
         PLA
         LSR
         BCC   L0B6A5D
L0B6A4E  LDA   #$4000
         AND   $BD
         BEQ   L0B6A58
         LDA   #$0001
L0B6A58  PHA
         JSL   L0E0E4B
L0B6A5D  BRL   L0B6B2B
         PEI   $D1
         JSL   L0B6D7D
L0B6A66  BRL   L0B6B2B
         PHY
         PEI   $D3
         PEA   ^L050C32
         PEA   L050C32
         JSL   L1514AE
         PLA
         STA   $E3
         LDA   #$8000
         AND   $E3
         BNE   L0B6A8C
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0E0EA8
         BRA   L0B6A92
L0B6A8C  PEI   $D3
         JSL   L0E0E11
L0B6A92  BRL   L0B6B2B
         PEI   $D5
         JSL   L0E0E11
L0B6A9B  BRL   L0B6B2B
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB9
         PHA
         PEI   $D7
         JSL   L0B3436
         JSL   L0E0F0F
L0B6AB1  BRA   L0B6B2B
         PEI   $D9
         JSL   L0E0E11
L0B6AB9  BRA   L0B6B2B
         LDA   #$00FF
         AND   $DB
         INC
         PHA
         JSL   L0E0E11
L0B6AC6  BRA   L0B6B2B
         LDA   #$00FF
         AND   $DC
         INC
         PHA
         JSL   L0E0E11
L0B6AD3  BRA   L0B6B2B
         PEA   $0010
         LDA   #$00FF
         AND   $CD
         STA   $ED
         PLA
         SEC
         SBC   $ED
         PHA
         JSL   L0E0E11
L0B6AE8  BRA   L0B6B2B
         PHY
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L0B63B0
         PLA
         LSR
         BCC   L0B6B05
         LDA   #$00FF
         AND   $DD
         INC
         PHA
         JSL   L0E0E11
L0B6B05  BRA   L0B6B2B
         PHY
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L0B63B0
         PLA
         LSR
         BCC   L0B6B22
         LDA   #$00FF
         AND   $DE
         INC
         PHA
         JSL   L0E0E11
L0B6B22  BRA   L0B6B2B
L0B6B24  PEA   $003E
         JSL   L0B0B7A
L0B6B2B  BRA   L0B6B34
L0B6B2D  PEA   $003F
         JSL   L0B0B7A
L0B6B34  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0140
         TCS
         RTL

L0B6B46  PHD
         TSC
         CLC
         ADC   #$FDF8
         TCS
         ADC   #$0113
         TCD
         LDA   $FA
         BPL   L0B6B58
         BRL   L0B6D64
L0B6B58  CMP   #$0009
         BMI   L0B6B60
         BRL   L0B6D64
L0B6B60  ASL
         TAX
         LDAL  L0B6B68,X
         PHA
         RTS

L0B6B68  DA    L0B6C25+2
         DA    L0B6C5D+2
         DA    L0B6CA1+2
         DA    L0B6B78+1
         DA    L0B6B84+2
         DA    L0B6C6E+2
         DA    L0B6C79+2
         DA    L0B6C8D+2
L0B6B78  DA    L0B6D4D+1
         PHY
         PHY
         JSL   L076220
         JSL   L0B79B1
L0B6B84  BRL   L0B6D6B
         PEA   ^L050C32
         PEA   L050C32
         PEA   $0000
         TDC
         CLC
         ADC   #$FEED
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072CD4
         PEA   $0100
         JSL   L0313BE
         LDA   L0553B3
         DEC
         BNE   L0B6BE7
         PEA   ^L050C32
         PEA   L050C32
         PEA   $0000
         TDC
         CLC
         ADC   #$FEED
         PHA
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L072CD4
         PEA   ^L050C32
         PEA   L050C32
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B6BE7  LDA   L0553B3
         BEQ   L0B6C1B
         PEA   ^L050C32
         PEA   L050C32
         PEA   ^L0404E1
         PEA   L0404E1
         PEA   ^L050C32
         PEA   L050C32
         PEA   ^L0404E9
         PEA   L0404E9
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B6C1B  PEA   ^L050C32
         PEA   L050C32
         JSL   L0E0EA8
L0B6C25  BRL   L0B6D6B
         STZ   $ED
         STZ   $EF
         LDA   L05503D
         BEQ   L0B6C46
         PHY
         PHY
         PHY
         LDA   L05503D
         PHA
         JSL   L151065
         JSL   L075B7B
         PLA
         STA   $ED
         PLX
         STX   $EF
L0B6C46  LDAL  L053AB3
         TAX
         LDAL  L053AB1
         PEI   $EF
         PEI   $ED
         JSL   L150F53
         PHX
         PHA
         JSL   L0E0E79
L0B6C5D  BRL   L0B6D6B
         LDAL  L053AD7
         PHA
         LDAL  L053AD5
         PHA
         JSL   L0E0E79
L0B6C6E  BRL   L0B6D6B
         LDA   L055051
         PHA
         JSL   L0E0E4B
L0B6C79  BRL   L0B6D6B
         LDA   #$4000
         ANDL  L053AE9
         BEQ   L0B6C88
         LDA   #$0001
L0B6C88  PHA
         JSL   L0E0E4B
L0B6C8D  BRL   L0B6D6B
         LDA   #$1000
         ANDL  L053AE9
         BEQ   L0B6C9C
         LDA   #$0001
L0B6C9C  PHA
         JSL   L0E0E4B
L0B6CA1  BRL   L0B6D6B
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         LDAL  L053B1F
         PHA
         LDAL  L053B1D
         PHA
         PEA   $0008
         JSL   L07334A
         PEA   ^L0404EB
         PEA   L0404EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC5
         PHA
         LDAL  L053B23
         PHA
         LDAL  L053B21
         PHA
         PEA   $0008
         JSL   L07334A
         PEA   ^L0404ED
         PEA   L0404ED
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB1
         PHA
         LDAL  L053B27
         PHA
         LDAL  L053B25
         PHA
         PEA   $0008
         JSL   L07334A
         PEA   ^L0404EF
         PEA   L0404EF
         PEA   $0000
         TDC
         CLC
         ADC   #$FF9D
         PHA
         LDAL  L053B2B
         PHA
         LDAL  L053B29
         PHA
         PEA   $0008
         JSL   L07334A
         PEA   ^L0404F1
         PEA   L0404F1
         PEA   $0000
         TDC
         CLC
         ADC   #$FF89
         PHA
         LDA   L055251
         LDX   L055253
         PHX
         PHA
         JSL   L0715D9
         TDC
         CLC
         ADC   #$0089
         PEA   $0000
         PHA
         PEA   $0009
         JSL   L1509CE
         JSL   L0E0F0F
L0B6D4D  BRA   L0B6D6B
         PEA   ^L053AFD
         PEA   L053AFD
         PEA   $0000
         PEA   $0020
         PEA   $0018
         JSL   L0E07C5
         BRA   L0B6D6B
L0B6D64  PEA   $003E
         JSL   L0B0B7A
L0B6D6B  LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$020C
         TCS
         RTL

L0B6D7D  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $0A
         SEC
         SBC   #$FFFF
         BVS   L0B6D91
         BMI   L0B6DCD
         BRA   L0B6D93
L0B6D91  BPL   L0B6DCD
L0B6D93  CMP   #$0003
         BPL   L0B6DCD
         SEC
         SBC   #$0000
         BEQ   L0B6DC1
         SEC
         SBC   #$0001
         BEQ   L0B6DA9
         DEC
         BEQ   L0B6DB5
         BRA   L0B6DCD
L0B6DA9  PEA   ^L0404F3
         PEA   L0404F3
         JSL   L0E0F0F
         BRA   L0B6DD3
L0B6DB5  PEA   ^L0404F8
         PEA   L0404F8
         JSL   L0E0F0F
         BRA   L0B6DD3
L0B6DC1  PEA   ^L0404FF
         PEA   L0404FF
         JSL   L0E0F0F
         BRA   L0B6DD3
L0B6DCD  PEI   $0A
         JSL   L0E0E11
L0B6DD3  LDA   $08
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

L0B6DE3  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0553C3
         JSL   L150488
         STA   $01
         STX   $03
         PHY
         LDY   #$0004
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         JSL   L0D109F
         PLA
         LSR
         BCC   L0B6E5D
         LDA   [$10]
         DEC
         BMI   L0B6E50
         CMP   #$0005
         BPL   L0B6E50
         SEC
         SBC   #$0000
         BEQ   L0B6E28
         DEC
         BEQ   L0B6E34
         DEC
         BEQ   L0B6E34
         DEC
         BEQ   L0B6E40
         DEC
         BEQ   L0B6E48
         BRA   L0B6E50
L0B6E28  PEI   $12
         PEI   $10
         PEI   $0E
         JSL   L0B66E6
         BRA   L0B6E57
L0B6E34  PEI   $12
         PEI   $10
         PEI   $0E
         JSL   L0B5F00
         BRA   L0B6E57
L0B6E40  PEI   $0E
         JSL   L0B6B46
         BRA   L0B6E57
L0B6E48  PEI   $0E
         JSL   L0B5CBB
         BRA   L0B6E57
L0B6E50  PEA   $003E
         JSL   L0B0B7A
L0B6E57  JSL   L0B381C
         BRA   L0B6E64
L0B6E5D  PEA   $003E
         JSL   L0B0B7A
L0B6E64  PEI   $03
         PEI   $01
         LDA   L0553C3
         JSL   L150488
         JSL   L033477
         BNE   L0B6E79
         JSL   L0E0C52
L0B6E79  LDA   $0C
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

L0B6E8B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0000
         LDY   #$0010
         STA   [$0A],Y
         PEI   $0C
         PEI   $0A
         PEI   $10
         PEI   $0E
         JSL   L0B59D0
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

L0B6EB9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$8001
         CMP   L055395
         BEQ   L0B6ECB
         BRA   L0B6EDA
L0B6ECB  PHY
         JSL   L0B7877
         PLA
         LSR
         BCS   L0B6ED6
         BRA   L0B6EDA
L0B6ED6  JSL   L0B7BC2
L0B6EDA  PLY
         PLY
         PLD
         RTL

L0B6EDE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDX   #$0000
         LDA   #$0005
         CMP   L05536F
         BEQ   L0B6EF2
         INX
L0B6EF2  PHX
         LDX   #$0000
         LDA   #$0006
         CMP   L05536F
         BEQ   L0B6EFF
         INX
L0B6EFF  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0B6F0F
         PEA   $0042
         JSL   L0B0B7A
         BRA   L0B6F51
L0B6F0F  LDA   L055371
         DEC
         CMP   L055395
         BNE   L0B6F20
         LDA   #$8001
         STA   L055395
         BRA   L0B6F2F
L0B6F20  LDA   #$8001
         CMP   L055395
         BNE   L0B6F2F
         LDA   L055371
         DEC
         STA   L055395
L0B6F2F  JSL   L0B0000
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0B6F44
         PEA   $0008
         JSL   L0B2A68
         BRA   L0B6F51
L0B6F44  PEA   $0007
         JSL   L0B2A68
         LDA   #$0001
         STA   L055393
L0B6F51  PLY
         PLY
         PLD
         RTL

L0B6F55  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L0B7877
         PLA
         LSR
         BCS   L0B6F69
         BRL   L0B704F
L0B6F69  PHY
         JSL   L0314F6
         PLA
         DEC
         BPL   L0B6F75
         BRL   L0B704B
L0B6F75  CMP   #$0003
         BMI   L0B6F7D
         BRL   L0B704B
L0B6F7D  SEC
         SBC   #$0000
         BEQ   L0B6F8F
         DEC
         BEQ   L0B6FBF
         DEC
         BNE   L0B6F8C
         BRL   L0B702B
L0B6F8C  BRL   L0B704B
L0B6F8F  LDX   #$0000
         LDA   #$0006
         CMP   L05536F
         BEQ   L0B6F9B
         INX
L0B6F9B  PHX
         LDX   #$0000
         LDA   #$0008
         CMP   L05536F
         BEQ   L0B6FA8
         INX
L0B6FA8  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0B6FB8
         PEA   $0043
         JSL   L0B0B7A
         BRA   L0B6FBC
L0B6FB8  JSL   L0E0154
L0B6FBC  BRL   L0B704B
L0B6FBF  LDA   #$0003
         CMP   L05536F
         BEQ   L0B6FD0
         PEA   $0044
         JSL   L0B0B7A
         BRA   L0B7029
L0B6FD0  LDX   #$0000
         LDA   #$8001
         CMP   L055395
         BEQ   L0B6FDC
         INX
L0B6FDC  TXA
         BNE   L0B6FED
         PHY
         JSL   L0B7C10
         PLA
         EOR   #$0001
         CMP   #$0000
         BEQ   L0B6FFA
L0B6FED  JSL   L0E0154
         LDA   L055391
         DEC
         STA   L055391
         BRA   L0B7029
L0B6FFA  LDA   #$0001
         STA   L055393
         LDA   L055391
         DEC
         PEA   $0012
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L050D34
         LDX   #^L050D34
         BCC   L0B7017
         INX
L0B7017  CLC
         ADC   #$0002
         BCC   L0B701E
         INX
L0B701E  STA   $01
         STX   $03
         LDA   [$01]
         PHA
         JSL   L0B2BBB
L0B7029  BRA   L0B704B
L0B702B  LDA   L05536F
         DEC
         DEC
         BEQ   L0B703B
         PEA   $0045
         JSL   L0B0B7A
         BRA   L0B7049
L0B703B  JSL   L0E0154
         LDA   #$0001
         STA   L055397
         JSL   L0B2AC6
L0B7049  BRA   L0B704B
L0B704B  JSL   L0E0000
L0B704F  PLY
         PLY
         PLD
         RTL

L0B7053  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$8001
         CMP   L055395
         BEQ   L0B7065
         BRA   L0B70E1
L0B7065  PHY
         JSL   L0B7877
         PLA
         LSR
         BCS   L0B7070
         BRA   L0B70E1
L0B7070  PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BNE   L0B708B
         JSL   L0B292B
         LDA   #$0001
         STA   L055397
         JSL   L0B2AC6
         BRA   L0B70DD
L0B708B  PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L0B709C
         JSL   L073A49
         BRA   L0B70DD
L0B709C  LDA   L0553B9
         LDX   L0553BB
         CLC
         ADC   #$0004
         BCC   L0B70A9
         INX
L0B70A9  STA   $01
         STX   $03
         LDA   [$01]
         STA   $01
         LDA   L055391
         SEC
         SBC   $01
         BEQ   L0B70C0
         BVS   L0B70BE
         EOR   #$8000
L0B70BE  BMI   L0B70C9
L0B70C0  PEA   $0046
         JSL   L0B0B7A
         BRA   L0B70DD
L0B70C9  LDA   L055391
         DEC
         PEA   $0012
         JSL   L150BEE
         PLX
         LDAL  L050D34,X
         DEC
         STA   L055395
L0B70DD  JSL   L0E0000
L0B70E1  PLY
         PLY
         PLD
         RTL

L0B70E5  ENT
         PHD
         TSC
         CLC
         ADC   #$FEEA
         TCS
         ADC   #$001F
         TCD
         LDA   #$8001
         CMP   L055395
         BEQ   L0B70FB
         BRL   L0B726C
L0B70FB  PHY
         JSL   L0B7877
         PLA
         LSR
         BCS   L0B7107
         BRL   L0B726C
L0B7107  PHY
         PHY
         JSL   L0E05AF
         PLA
         PLX
         STA   $F1
         LDA   $F1
         LDX   #$FFE1
         STA   $00,X
         LDX   #$FFE1
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L0B7126
         EOR   #$8000
L0B7126  BMI   L0B712B
         BRL   L0B726C
L0B712B  LDA   #$0001
         STA   $EF
L0B7130  TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0009
         JSL   L0E0656
         PEI   $ED
         PEI   $EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         JSL   L0B1388
         PHY
         LDA   L0553BD
         LDX   L0553BF
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         JSL   L0B01D3
         PLA
         STA   $E9
         LDA   $E9
         BEQ   L0B71D4
         LDA   L0553BD
         LDX   L0553BF
         CLC
         ADC   #$000A
         BCC   L0B7181
         INX
L0B7181  STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         LDA   $E9
         DEC
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B71AF
         DEX
L0B71AF  JSL   L150F53
         STA   $E3
         STX   $E5
         LDY   #$0002
         LDA   [$E3],Y
         BNE   L0B71D1
         PEA   $0047
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         JSL   L0B0841
         BRL   L0B726C
L0B71D1  BRL   L0B725E
L0B71D4  PHY
         LDA   L0553BD
         LDX   L0553BF
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         JSL   L0B2819
         PLA
         STA   $E9
         LDA   #L051C38
         LDX   #^L051C38
         CMP   L0553BD
         BNE   L0B71FB
         CPX   L0553BF
L0B71FB  BEQ   L0B725E
         PHY
         PEA   ^L051C38
         PEA   L051C38
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         JSL   L0B2819
         PLA
         STA   $E7
         LDA   L0553BD
         LDX   L0553BF
         CLC
         ADC   #$000A
         BCC   L0B7221
         INX
L0B7221  STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         LDA   $E9
         DEC
         PEA   $000E
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0B724F
         DEX
L0B724F  JSL   L150F53
         STA   $E3
         STX   $E5
         LDA   $E7
         LDY   #$0002
         STA   [$E3],Y
L0B725E  LDA   $EF
         LDX   #$FFE1
         CMP   $00,X
         BEQ   L0B726C
         INC   $EF
         BRL   L0B7130
L0B726C  TSC
         CLC
         ADC   #$0116
         TCS
         PLD
         RTL

L0B7274  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0004
         CMP   L05536F
         BNE   L0B728D
         PEA   $0048
         JSL   L0B0B7A
         BRA   L0B72C6
L0B728D  PEA   $0004
         JSL   L0E0838
         LDX   #$0000
         LDA   #$8001
         CMP   L055395
         BNE   L0B72A0
         INX
L0B72A0  TXA
         BEQ   L0B72AF
         PHA
         PHY
         JSL   L0B7877
         PLA
         STA   $01
         PLA
         AND   $01
L0B72AF  BEQ   L0B72C6
         PHY
         JSL   L0E0678
         PLA
         EOR   #$0001
         CMP   #$0000
         BEQ   L0B72C6
         LDA   L055371
         DEC
         STA   L055395
L0B72C6  PLY
         PLY
         PLD
         RTL

L0B72CA  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$8001
         CMP   L055395
         BEQ   L0B72DD
         BRL   L0B7379
L0B72DD  PHY
         JSL   L0B7877
         PLA
         LSR
         BCS   L0B72E9
         BRL   L0B7379
L0B72E9  LDA   L0553B9
         LDX   L0553BB
         CLC
         ADC   #$0004
         BCC   L0B72F6
         INX
L0B72F6  STA   $01
         STX   $03
         LDA   [$01]
         STA   $01
         LDA   L055391
         SEC
         SBC   $01
         BEQ   L0B730D
         BVS   L0B730B
         EOR   #$8000
L0B730B  BMI   L0B7316
L0B730D  PEA   $0057
         JSL   L0B0B7A
         BRA   L0B7379
L0B7316  PHY
         JSL   L0B7C10
         PLA
         LSR
         BCC   L0B7365
         LDA   L055391
         DEC
         PEA   $0012
         JSL   L150BEE
         PLX
         LDAL  L050D34,X
         PHA
         JSL   L0B2A91
         LDA   L055391
         DEC
         PEA   $0012
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L050D34
         LDX   #^L050D34
         BCC   L0B734B
         INX
L0B734B  CLC
         ADC   #$0002
         BCC   L0B7352
         INX
L0B7352  STA   $01
         STX   $03
         LDA   [$01]
         PHA
         JSL   L0B2BBB
         LDA   #$0001
         STA   L055393
         BRA   L0B7379
L0B7365  LDA   L055391
         DEC
         PEA   $0012
         JSL   L150BEE
         PLX
         LDAL  L050D34,X
         DEC
         STA   L055395
L0B7379  PLY
         PLY
         PLD
         RTL

L0B737D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDX   #$0000
         LDA   #$8001
         CMP   L055395
         BNE   L0B7391
         INX
L0B7391  TXA
         BEQ   L0B73AA
         PHY
         JSL   L0B7877
         PLA
         BEQ   L0B73AA
         JSL   L0B292B
         LDA   #$0002
         STA   L055397
         JSL   L0B2AC6
L0B73AA  PLY
         PLY
         PLD
         RTL

L0B73AE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PEA   $0003
         JSL   L0E0838
         LDA   L055391
         SEC
         SBC   #$0020
         BVS   L0B73C9
         EOR   #$8000
L0B73C9  BMI   L0B73D4
         LDA   L055391
         INC
         STA   L055391
         BRA   L0B73DE
L0B73D4  PEA   $0049
         JSL   L0B0B7A
         BRL   L0B75F7
L0B73DE  LDA   #$8001
         CMP   L055395
         BEQ   L0B73E9
         BRL   L0B75F7
L0B73E9  LDA   L055391
         DEC
         PEA   $0012
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L050D34
         LDX   #^L050D34
         BCC   L0B7400
         INX
L0B7400  STA   $01
         STX   $03
         LDA   L055371
         STA   [$01]
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$0008
         BCC   L0B7416
         INX
L0B7416  STA   $05
         STX   $07
         LDA   [$05]
         LDY   #$0006
         STA   [$01],Y
         PHY
         JSL   L0B7877
         PLA
         LSR
         BCS   L0B742D
         BRL   L0B75F7
L0B742D  LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$0008
         BCC   L0B743A
         INX
L0B743A  STA   $05
         STX   $07
         LDA   [$05]
         LDY   #$0002
         STA   [$01],Y
         LDX   #$0000
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0B7451
         INX
L0B7451  PHX
         LDX   #$0000
         LDAL  L051BE0
         BNE   L0B745C
         INX
L0B745C  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0B746E
         LDY   #$0002
         LDA   [$01],Y
         INC
         LDY   #$0002
         STA   [$01],Y
L0B746E  PHY
         JSL   L0314F6
         PLA
         BPL   L0B7479
         BRL   L0B75F7
L0B7479  CMP   #$0005
         BMI   L0B7481
         BRL   L0B75F7
L0B7481  SEC
         SBC   #$0000
         BEQ   L0B7497
         DEC
         BEQ   L0B74A6
         DEC
         BEQ   L0B74C1
         DEC
         DEC
         BNE   L0B7494
         BRL   L0B7523
L0B7494  BRL   L0B75F7
L0B7497  LDA   #$0003
         LDY   #$0004
         STA   [$01],Y
         JSL   L0E0000
         BRL   L0B75F7
L0B74A6  LDA   #$0002
         LDY   #$0004
         STA   [$01],Y
         PHY
         JSL   L0E0678
         PLA
         LSR
         BCS   L0B74BE
         LDA   L055371
         DEC
         STA   L055395
L0B74BE  BRL   L0B75F7
L0B74C1  LDA   #$0000
         LDY   #$0004
         STA   [$01],Y
         LDA   #$0001
         LDX   #$0000
         LDY   #$0006
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$000A
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B74E4
         INX
L0B74E4  STA   $05
         STX   $07
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   [$05]
         PLA
         LDY   #$0002
         STA   [$05],Y
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$000C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L033477
         BEQ   L0B7520
         BVS   L0B7517
         EOR   #$8000
L0B7517  BPL   L0B7520
         LDA   L055371
         DEC
         STA   L055395
L0B7520  BRL   L0B75F7
L0B7523  LDA   #$0001
         LDY   #$0004
         STA   [$01],Y
         LDA   #$000E
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B7536
         INX
L0B7536  STA   $05
         STX   $07
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   [$05]
         PLA
         LDY   #$0002
         STA   [$05],Y
         LDA   #$0008
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B7554
         INX
L0B7554  STA   $05
         STX   $07
         PHY
         PHY
         JSL   L0E05AF
         PLA
         PLX
         STA   [$05]
         LDA   #$000A
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B756D
         INX
L0B756D  STA   $05
         STX   $07
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   [$05]
         PLA
         LDY   #$0002
         STA   [$05],Y
         LDA   #$0006
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B758B
         INX
L0B758B  STA   $05
         STX   $07
         PHY
         PHY
         JSL   L0E05AF
         PLA
         PLX
         STA   [$05]
         LDY   #$0010
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$000C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L1512A5
         PHX
         PHA
         LDY   #$0008
         LDA   [$01],Y
         JSL   L150488
         JSL   L150D50
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L0B75D4
         LDA   L055371
         DEC
         STA   L055395
         BRA   L0B75F5
L0B75D4  LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L0E0DE2
         LDA   L0553BD
         LDX   L0553BF
         PHX
         PHA
         LDY   #$0006
         LDA   [$01],Y
         PHA
         JSL   L0B3CD4
L0B75F5  BRA   L0B75F7
L0B75F7  PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0B75FD  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$8001
         CMP   L055395
         BEQ   L0B760F
         BRA   L0B763E
L0B760F  PHY
         JSL   L0B7877
         PLA
         LSR
         BCS   L0B761A
         BRA   L0B763E
L0B761A  LDA   L0553A7
         LDX   L0553A9
         PHX
         PHA
         JSL   L07185A
         PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   L0553A7
         PLA
         STA   L0553A9
         JSL   L0B292B
         LDA   #$0001
         STA   L055397
L0B763E  PLY
         PLY
         PLD
         RTL

L0B7642  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE2
         TCS
         TCD
         LDA   #$8001
         CMP   L055395
         BEQ   L0B7655
         BRL   L0B76DE
L0B7655  PHY
         JSL   L0B7877
         PLA
         LSR
         BCS   L0B7660
         BRA   L0B76DE
L0B7660  PHY
         JSL   L0314F6
         PLA
         CMP   #$0001
         BNE   L0B7671
         JSL   L0B7BC2
         BRA   L0B76DE
L0B7671  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L05103C
         PEA   L05103C
         PEA   $0018
         JSL   L0313BE
         PEA   ^L051054
         PEA   L051054
         PEA   $0000
         PEA   $0018
         PEA   $000F
         JSL   L0E0656
         PEA   ^L052406
         PEA   L052406
         JSL   L0E06AC
         PHY
         JSL   L0B7AF6
         PLA
         STA   $19
         PEA   ^L051054
         PEA   L051054
         LDA   L0553B9
         LDX   L0553BB
         CLC
         ADC   #$0020
         BCC   L0B76BF
         INX
L0B76BF  PHX
         PHA
         PEA   $0018
         JSL   L0313BE
         PEA   ^L05103C
         PEA   L05103C
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0018
         JSL   L0313BE
L0B76DE  TSC
         CLC
         ADC   #$001E
         TCS
         PLD
         RTL

L0B76E6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0004
         CMP   L05536F

*

         BEQ   L0B76FF
         PEA   $004A
         JSL   L0B0B7A
         BRA   L0B7721
L0B76FF  JSL   L0B0000
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0B7714
         PEA   $0006
         JSL   L0B2A68
         BRA   L0B7721
L0B7714  PEA   $0005
         JSL   L0B2A68
         LDA   #$0001
         STA   L055393
L0B7721  PLY
         PLY
         PLD
         RTL

L0B7725  ENT
         PHD
         TSC
         CLC
         ADC   #$FFDE
         TCS
         TCD
         STZ   $28
         LDA   L0553B5
         LDX   L0553B7
         STA   $1B
         STX   $1D
         JSL   L031B09
         PHY
         JSL   L0B1C0F
         PLA
         STA   $17
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         PHY
         PHY
         JSL   L0B3727
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B7932
         PEI   $17
         JSL   L0B39C0
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0001
         JSL   L0B2AF9
         JSL   L0E0000
         LDA   L055383
         BEQ   L0B77AA
         PHY
         LDA   L0553D1
         LDX   L0553D3
         STA   $1F
         STX   $21
         LDY   #$0002
         LDA   [$1F],Y
         TAX
         LDA   [$1F]
         CLC
         ADC   #$01BE
         BCC   L0B779A
         INX
L0B779A  STA   $1F
         STX   $21
         LDA   [$1F]
         PHA
         JSL   L0B4D5D
         PLA
         STA   $19
         BRA   L0B77D2
L0B77AA  PHY
         LDA   L0553D1
         LDX   L0553D3
         STA   $1F
         STX   $21
         LDY   #$0002
         LDA   [$1F],Y
         TAX
         LDA   [$1F]
         CLC
         ADC   #$01BC
         BCC   L0B77C4
         INX
L0B77C4  STA   $1F
         STX   $21
         LDA   [$1F]
         PHA
         JSL   L0B4D5D
         PLA
         STA   $19
L0B77D2  LDA   $19
         BEQ   L0B77E9
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0B77E5
         LDA   #$0001
         STA   $28
         BRA   L0B77E9
L0B77E5  JSL   L0E0000
L0B77E9  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B0F05
         PEI   $1D
         PEI   $1B
         PEA   $0000
         JSL   L0B2AF9
         TSC
         CLC
         ADC   #$0022
         TCS
         PLD
         RTL

L0B7809  PHD
         TSC
         CLC
         ADC   #$FDFC
         TCS
         ADC   #$0113
         TCD
         LDY   #$0001
         LDA   [$F6],Y
         PHA
         JSL   L0B2BBB
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEED
         PHA
         JSL   L0B369F
         PEA   $0100
         JSL   L0313BE
         JSL   L0B0000
         LDA   $FA
         BEQ   L0B7855
         PEA   $004E
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         JSL   L0B0841
         BRA   L0B7865
L0B7855  PEA   $0035
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         JSL   L0B0841
L0B7865  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$020C
         TCS
         RTL

L0B7877  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         STZ   $10
         LDAL  L051BE0
         STA   $05
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$0008
         BCC   L0B7894
         INX
L0B7894  STA   $07
         STX   $09
         LDA   [$07]
         STA   $01
         LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$000A
         BCC   L0B78A9
         INX
L0B78A9  STA   $07
         STX   $09
         LDA   #$0000
         STA   [$07]
         JSL   L0B0000
         LDA   L0553D1
         LDX   L0553D3
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         PHX
         PHA
         LDA   $05
         JSL   L150488
         TAY
         BNE   L0B78D4
         DEX
L0B78D4  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $07
         STX   $09
         LDA   [$07]
         STA   $03
         PHY
         PEI   $03
         JSL   L0B4D5D
         PLA
         BEQ   L0B7920
         LDA   L0553A5
         EOR   #$0001
         CMP   #$0000
         BEQ   L0B7920
         LDAL  L051BDE
         DEC
         DEC
         BNE   L0B7913
         LDA   #$0001
         STA   $10
         BRA   L0B791E
L0B7913  PEA   $0001
         PEA   $0000
         PHD
         JSL   L0B7809
L0B791E  BRA   L0B792B
L0B7920  PEA   $0000
         PEA   $0000
         PHD
         JSL   L0B7809
L0B792B  PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0B7932  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0001
         LDY   #$0010
         STA   [$0E],Y
         PHY
         PEI   $18
         PEI   $16
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   $12
         LDX   $14
         INC
         BNE   L0B7958
         INX
L0B7958  PHX
         PHA
         JSL   L0B25F8
         PLA
         LSR
         BCS   L0B7993
         PEA   $002D
         JSL   L0B0B7A
         PHY
         PHY
         PEA   $0000
         PEA   $0001
         LDA   L0553DD
         PHA
         JSL   L0B249C
         PLA
         STA   $01
         PLX
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $05
         STX   $07
         SEP   #$20
         LDA   #$00
         STA   [$05]
         REP   #$20
L0B7993  PEI   $10
         PEI   $0E
         PEI   $03
         PEI   $01
         JSL   L0B59D0
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

L0B79B1  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   $10
         ORA   $12
         BNE   L0B79C5
         JSL   L0E0C52
         BRA   L0B7A44
L0B79C5  STZ   $01
         LDA   L0550F3
         BEQ   L0B7A03
         PHY
         PHY
         PEI   $12
         PEI   $10
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0F12F1
         PLA
         STA   $03
         PLX
         STX   $05
         PEI   $12
         PEI   $10
         JSL   L07185A
         PEI   $05
         PEI   $03
         JSL   L0E0CFE
         BRA   L0B7A44
L0B7A03  PHY
         PHY
         PEI   $12
         PEI   $10
         LDA   L0550F5
         LDX   L0550F7
         PHX
         PHA
         PEA   $0000
         PEA   $FFFF
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0F12F1
         PLA
         STA   $03
         PLX
         STX   $05
         PEI   $12
         PEI   $10
         JSL   L07185A
         LDA   L0550F5
         LDX   L0550F7
         PHX
         PHA
         JSL   L0E10BE
         LDA   #$0001
         STA   L0550F1
L0B7A44  LDA   $0E
         STA   $12
         LDA   $0D
         STA   $11
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L0B7A56  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B2A02
         LDA   #$0001
         STA   $10
         PHY
         PEI   $0E
         JSL   L0B5681
         PLA
         LSR
         BCS   L0B7A8A
         STZ   $10
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B2965
L0B7A8A  LDA   $0C
         STA   $0E
         LDA   $0B
         STA   $0D
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L0B7A9C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B2A02
         LDA   #$0001
         STA   $10
         PHY
         PEI   $0E
         JSL   L0B5681
         PLA
         EOR   #$0001
         CMP   #$0000
         BNE   L0B7AD5
         LDX   #$0000
         LDAL  L051BDE
         DEC
         DEC
         BEQ   L0B7AD2
         INX
L0B7AD2  TXA
         BEQ   L0B7AE4
L0B7AD5  STZ   $10
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B2965
L0B7AE4  LDA   $0C
         STA   $0E
         LDA   $0B
         STA   $0D
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L0B7AF6  PHD
         TSC
         CLC
         ADC   #$FFC6
         TCS
         TCD
         LDA   L055241
         ORA   L05523F
         PHA
         LDA   L055243
         EOR   #$0001
         AND   $01,S
         PLX
         STA   L055245
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L05103C
         PEA   L05103C
         PEA   $0018
         JSL   L0313BE
         PEA   ^L05103C
         PEA   L05103C
         PEA   ^L051054
         PEA   L051054
         PEA   $0018
         JSL   L0313BE
         STZ   L0553A5
         LDA   L0553B5
         LDX   L0553B7
         STA   $33
         STX   $35
         PHY
         PHY
         PEA   ^L052406
         PEA   L052406
         JSL   L071F3F
         PLA
         STA   $2F
         PLX
         STX   $31
         STZ   $29
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         JSL   L0B59D0
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEA   $0001
         JSL   L0B2AF9
         PHY
         PEA   $0000
         JSL   L0E2DD3
         PLA
         STA   $40
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L0B0F05
         PEI   $35
         PEI   $33
         PEA   $0000
         JSL   L0B2AF9
         PEA   ^L05103C
         PEA   L05103C
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0018
         JSL   L0313BE
         TSC
         CLC
         ADC   #$003A
         TCS
         PLD
         RTL

L0B7BC2  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PEA   ^L052406
         PEA   L052406
         JSL   L0E06AC
         LDA   #$0005
         CMPL  L051054
         BNE   L0B7BE7
         PEA   ^L051054
         PEA   L051054
         JSL   L0B0D0A
L0B7BE7  PHY
         JSL   L0B7AF6
         PLA
         STA   $01
         PEA   ^L051054
         PEA   L051054
         LDA   L0553B9
         LDX   L0553BB
         CLC
         ADC   #$0020
         BCC   L0B7C02
         INX
L0B7C02  PHX
         PHA
         PEA   $0018
         JSL   L0313BE
         PLY
         PLY
         PLY
         PLD
         RTL

L0B7C10  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         STZ   $10
         LDA   L055391
         DEC
         PEA   $0012
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L050D34
         LDX   #^L050D34
         BCC   L0B7C31
         INX
L0B7C31  STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BPL   L0B7C43
         BRL   L0B7D56
L0B7C43  CMP   #$0004
         BMI   L0B7C4B
         BRL   L0B7D56
L0B7C4B  SEC
         SBC   #$0000
         BNE   L0B7C54
         BRL   L0B7CD8
L0B7C54  DEC
         BEQ   L0B7C66
         DEC
         BNE   L0B7C5D
         BRL   L0B7D1E
L0B7C5D  DEC
         BNE   L0B7C63
         BRL   L0B7D17
L0B7C63  BRL   L0B7D56
L0B7C66  LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$0010
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L033477
         BEQ   L0B7CD6
         LDA   #$0001
         STA   $10
         LDA   #$000A
         CLC
         ADC   $01
         LDX   $03
         BCC   L0B7C91
         INX
L0B7C91  STA   $07
         STX   $09
         LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$0008
         LDA   [$01],Y
         JSL   L150488
         JSL   L150F53
         STA   [$07]
         TXA
         LDY   #$0002
         STA   [$07],Y
         LDY   #$000C
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L0E0DE2
         LDA   L0553BD
         LDX   L0553BF
         PHX
         PHA
         LDY   #$0006
         LDA   [$01],Y
         PHA
         JSL   L0B3CD4
L0B7CD6  BRA   L0B7D56
L0B7CD8  LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$000C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L033477
         BVS   L0B7CF6
         EOR   #$8000
L0B7CF6  BMI   L0B7D15
         LDA   #$0001
         STA   $10
         LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         INC
         BNE   L0B7D0B
         INX
L0B7D0B  LDY   #$0006
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
L0B7D15  BRA   L0B7D56
L0B7D17  LDA   #$0001
         STA   $10
         BRA   L0B7D56
L0B7D1E  LDA   L0553B5
         LDX   L0553B7
         CLC
         ADC   #$0008
         BCC   L0B7D2B
         INX
L0B7D2B  STA   $07
         STX   $09
         LDA   [$07]
         STA   $05
         LDY   #$0006
         LDA   [$01],Y
         PHA
         JSL   L0B2BBB
         PHY
         JSL   L0B7877
         PLA
         LSR
         BCC   L0B7D4E
         PHY
         JSL   L0E0678
         PLA
         STA   $10
L0B7D4E  PEI   $05
         JSL   L0B2BBB
         BRA   L0B7D56
L0B7D56  PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0B7D5D  ENT
         PHD
         TSC
         SEC
         SBC   #$001E
         TCD
         TCS
         STZ   $24
         LDA   L0553B5
         STA   $07
         LDA   L0553B7
         STA   $09
         LDY   #$0012
         LDA   [$07],Y
         STA   $05
         LDY   #$0008
         LDA   [$07],Y
         STA   $01
         LDY   #$0014
         LDA   [$07],Y
         STA   $03
         BEQ   L0B7DAC
         LDA   $05
         DEC
         ASL
         ASL
         TAY
         LDX   #$0000
         LDA   $01
L0B7D93  CMP   L05008E,Y
         BEQ   L0B7DA3
         INY
         INY
         INY
         INY
         INX
         CPX   $03
         BCC   L0B7D93
         BRA   L0B7DAC
L0B7DA3  INY
         INY
         LDA   L05008E,Y
         TAX
         BRL   L0B7E39
L0B7DAC  LDA   L0553BD
         STA   $0B
         LDA   L0553BF
         STA   $0D
         LDY   #$0006
         LDA   [$0B],Y
         STA   $0F
         INY
         INY
         LDA   [$0B],Y
         STA   $11
         ORA   $0F
         BNE   L0B7DCA
         BRL   L0B7E44
L0B7DCA  PHA
         PEA   ^L050C32
         PEA   L050C32
         JSL   L0B369F
         PEI   $11
         PEI   $0F
         JSL   L03261F
         PLA
         BEQ   L0B7E44
         STA   $13
         LDY   #$000A
         LDA   [$0B],Y
         STA   $15
         INY
         INY
         LDA   [$0B],Y
         STA   $17
         LDA   [$15]
         STA   $19
         LDY   #$0002
         LDA   [$15],Y
         STA   $1B
         DEY
         TYX
         DEY
         LDA   [$0B]
         STA   $1D
L0B7E01  LDA   [$19],Y
         CMP   $13
         BEQ   L0B7E18
         CPX   $1D
         BCS   L0B7E44
         INX
         TYA
         CLC
         ADC   #$000E
         TAY
         BCC   L0B7E01
         INC   $1B
         BRA   L0B7E01
L0B7E18  CLC
         LDA   $05
         ADC   $03
         CMP   #$0200
         BCS   L0B7E39
         DEC
         ASL
         ASL
         TAY
         LDA   $01
         STA   L05008E,Y
         INY
         INY
         TXA
         STA   L05008E,Y
         LDA   $03
         INC
         LDY   #$0014
         STA   [$07],Y
L0B7E39  INC   $24
         PHX
         JSL   L0E0E11
         JSL   L0B0000
L0B7E44  LDX   $1F
         TDC
         CLC
         ADC   #$0020
         TCS
         TXA
         TCD
         RTL

L0B7E4F  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         LDA   $0A
         BEQ   L0B7E8B
         DEC
         BEQ   L0B7E8B
         STA   $01
         AND   #$FF00
         BEQ   L0B7E67
         LDA   #$FE00
         BRA   L0B7E6A
L0B7E67  LDA   #$FFFE
L0B7E6A  BIT   $01
         BEQ   L0B7E71
         ASL
         BRA   L0B7E6A
L0B7E71  EOR   #$FFFF
         STA   $03
L0B7E76  PHA
         _Random
         PLA
         AND   $03
         SEC
         SBC   $01
         BEQ   L0B7E88
         BPL   L0B7E76
L0B7E88  CLC
         ADC   $01
L0B7E8B  INC
         STA   $0C
         LDA   $08
         STA   $0A
         LDA   $07
         STA   $09
         TDC
         TCS
         PLY
         PLY
         PLD
         PLY
         RTL

L0B7E9D  ENT
         PHD
         TSC
         SEC
         SBC   #$001C
         TCD
         TCS
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0E00CC
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L0E00CC
         LDX   #$FFFF
         LDY   #$3FFF
         LDA   $22
         CMP   #$0004
         BNE   L0B7ED2
         LDX   #$7FFF
         LDY   #$0000
L0B7ED2  STX   $19
         STY   $1B
         LDA   $01
         AND   $0D
         BEQ   L0B7F1A
         LDX   $03
         LDA   $05
         BPL   L0B7EF0
         EOR   #$FFFF
         TAY
         TXA
         EOR   #$FFFF
         INC
         BNE   L0B7EEE
         INY
L0B7EEE  TAX
         TYA
L0B7EF0  CMP   $1B
         BCC   L0B7EFB
         BNE   L0B7F1A
         TXA
         CMP   $19
         BCS   L0B7F1A
L0B7EFB  LDX   $0F
         LDA   $11
         BPL   L0B7F0F
         EOR   #$FFFF
         TAY
         TXA
         EOR   #$FFFF
         INC
         BNE   L0B7F0D
         INY
L0B7F0D  TAX
         TYA
L0B7F0F  CMP   $1B
         BCC   L0B7F1C
         BNE   L0B7F1A
         TXA
         CMP   $19
         BCC   L0B7F1C
L0B7F1A  BRA   L0B7F53
L0B7F1C  LDA   $22
         BNE   L0B7F2E
         CLC
         LDA   $03
         ADC   $0F
         TAX
         LDA   $05
         ADC   $11
         PHA
         PHX
         BRA   L0B7F4C
L0B7F2E  LSR
         DEC
         BNE   L0B7F40
         SEC
         LDA   $0F
         SBC   $03
         TAX
         LDA   $11
         SBC   $05
         PHA
         PHX
         BRA   L0B7F4C
L0B7F40  LDA   $03
         LDX   $05
         PEI   $11
         PEI   $0F
         JSL   L150D50
L0B7F4C  JSL   L0E0E79
         BRL   L0B7FB1
L0B7F53  LDA   $01
         BEQ   L0B7F6E
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0000
         PHA
         PEA   $030E
         _SANEFP816
L0B7F6E  LDA   $0D
         BEQ   L0B7F89
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         PEA   $0000
         PHA
         PEA   $030E
         _SANEFP816
L0B7F89  TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         PEI   $22
         _SANEFP816
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         JSL   L0E0C71
L0B7FB1  LDA   $20
         STA   $22
         LDA   $1F
         STA   $21
         LDX   $1D
         TDC
         CLC
         ADC   #$0020
         TCS
         TXA
         TCD
         RTL

L0B7FC4  ENT
         PHD
         PHY
         PHY
         PHY
         PHY
         TSC
         TCD
         LDA   #$0000
         TAX
         SEP   #$20
         LDA   [$12]
         STA   $01
         LDA   [$0E]
         STA   $03
         CMP   $01
         BCC   L0B7FDF
         LDA   $01
L0B7FDF  STA   $05
         LDY   #$0000
L0B7FE4  LDA   $05
         BEQ   L0B800B
         DEC   $05
         INY
         LDA   [$12],Y
         TAX
         LDAL  L0714D9,X
         STA   $07
         LDA   [$0E],Y
         TAX
         LDA   $07
         CMPL  L0714D9,X
         BCS   L0B8004
L0B7FFF  LDX   #$FFFF
         BRA   L0B8016
L0B8004  BEQ   L0B7FE4
L0B8006  LDX   #$0001
         BRA   L0B8016
L0B800B  LDX   #$0000
         LDA   $01
         CMP   $03
         BCC   L0B7FFF
         BNE   L0B8006
L0B8016  STX   $16
         REP   #$20
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

L0B802D  ENT
         PHD
         TSC
         TCD
         PEI   $0C
         PEI   $0A
         PEI   $08
         PEI   $06
         PEA   $0008
         _SANEFP816
         STZ   $0E
         BEQ   L0B8050
         BVC   L0B804C
         INC   $0E
         BRA   L0B8050
L0B804C  BPL   L0B8050
         DEC   $0E
L0B8050  LDA   $04
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

L0B8060  ENT
         PHD
         TSC
         TCD
         LDX   #$0000
         LDA   $0C
         CMP   $08
         BCC   L0B8079
         BNE   L0B8076
         LDA   $0A
         CMP   $06
         BCC   L0B8079
         BEQ   L0B807A
L0B8076  INX
         BRA   L0B807A
L0B8079  DEX
L0B807A  STX   $0E
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

L0B808C  ENT
         PHD
         TSC
         SEC
         SBC   #$000A
         TCD
         TCS
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PHA
         PEA   $0000
         PHA
         JSL   L0E04A7
         PEI   $12
         LDX   $10
         JSL   $E10000
         JSL   L0E0C71
         LDA   $0E
         STA   $12
         LDA   $0D
         STA   $11
         LDX   $0B
         TDC
         CLC
         ADC   #$0010
         TCS
         TXA
         TCD
         RTL

L0B80C8  ENT
         PHD
         TSC
         SEC
         SBC   #$001E
         TCD
         TCS
         TDC
         CLC
         ADC   #$0001
         TAY
         TDC
         CLC
         ADC   #$000B
         TAX
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $0000
         PHY
         PEA   $0000
         PHX
         PEA   $0000
         PHA
         PEA   $0000
         PHY
         PEA   $0000
         PHX
         JSL   L0E04A7
         JSL   L0E04A7
         PEI   $24
         _SANEElems816
         JSL   L0E0C71
         LDA   $22
         STA   $24
         LDA   $21
         STA   $23
         LDX   $1F
         TDC
         CLC
         ADC   #$0022
         TCS
         TXA
         TCD
         RTL

L0B8121  ENT
         PHD
         TSC
         TCD
         PEI   $0C
         PEI   $0A
         PEI   $08
         PEI   $06
         PEA   $0510
         _SANEFP816
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

L0B8146  ENT
         PHB
         PHD
         TSC
         TCD
         PEA   >L0714D9
         PLB
         PLB
         STZ   $0F
         LDA   #$0000
         TAX
         TAY
         SEP   #$20
         DEY
L0B8159  INY
         LDA   [$0B],Y
         BNE   L0B8164
         LDA   [$07],Y
         BEQ   L0B8176
         BRA   L0B8174
L0B8164  TAX
         LDA   L0714D9,X
         PHA
         LDA   [$07],Y
         BEQ   L0B8174
         TAX
         PLA
         CMP   L0714D9,X
         BEQ   L0B8159
L0B8174  INC   $0F
L0B8176  REP   #$20
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

L0B8189  ENT
         PHD
         PHY
         TSC
         TCD
         STZ   $10
         LDA   #$0000
         TAX
         TAY
         SEP   #$20
         DEY
L0B8197  INY
         LDA   [$0C],Y
         BNE   L0B81A2
         LDA   [$08],Y
         BEQ   L0B81B6
         BRA   L0B81AE
L0B81A2  STA   $01
         LDA   [$08],Y
         BEQ   L0B81B4
         CMP   $01
         BEQ   L0B8197
         BCC   L0B81B4
L0B81AE  DEC   $10
         DEC   $11
         BRA   L0B81B6
L0B81B4  INC   $10
L0B81B6  REP   #$20
         LDA   $06
         STA   $0E
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
         RTL

L0B81C9  ENT
         PHD
         PHY
         TSC
         TCD
         PHP
         SEI
         SEP   #$20
         LDAL  $E0C034
         AND   #$F0
         STA   $01
         LDA   $08
         AND   #$0F
         ORA   $01
         STAL  $E0C034
         REP   #$20
         PLP
         LDA   $06
         STA   $08
         LDA   $05
         STA   $07
         TDC
         TCS
         PLY
         PLD
         PLY
         RTL

         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDAL  L0402F1
         STA   $01
         PLY
         PLY
         PLY
         PLD
         RTL

L0B8207  ENT
         PHD
         TSC
         CLC
         ADC   #$FBE4
         TCS
         ADC   #$032B
         TCD
         PHY
         PHY
         PEI   $FA
         PEI   $F8
         JSL   L07AACB
         PLA
         STA   $E9
         PLX
         STX   $EB
         LDA   $E9
         ORA   $EB
         BNE   L0B8232
         PEA   $003D
         JSL   L0727E0
         BRL   L0B837D
L0B8232  PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE9
         PHA
         PEI   $FA
         PEI   $F8
         JSL   L07AA4B
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FFE9
         AND   $00,X
         SEC
         SBC   #$0000
         BMI   L0B8298
         BEQ   L0B8298
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   ^L0402CD
         PEA   L0402CD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   ^L0402D2
         PEA   L0402D2
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE9
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B8298  LDA   $F6
         BEQ   L0B82FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE9
         PHA
         PEA   $0011
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FCE9
         PHA
         PEA   $0010
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FCD5
         PHA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0715D9
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE9
         PHA
         PEA   $0004
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRA   L0B835A
L0B82FC  PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE9
         PHA
         PEA   $0011
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FCE9
         PHA
         PEA   $000F
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FCD5
         PHA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L0715D9
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE9
         PHA
         PEA   $0004
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B835A  PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEI   $EB
         PEI   $E9
         PEI   $FA
         PEI   $F8
         LDA   L055039
         LDX   L05503B
         PHX
         PHA
         PEA   $0000
         PEA   $FFFF
         JSL   L0F0000
L0B837D  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0424
         TCS
         RTL

L0B838F  ENT
         PHD
         TSC
         CLC
         ADC   #$FBA4
         TCS
         ADC   #$036D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA7
         PHA
         PEI   $F6
         PEI   $F4
         PEA   $002A
         JSL   L0313BE
         LDA   L05501F
         LDX   L055021
         CMP   $F8
         BNE   L0B83BA
         CPX   $FA
L0B83BA  BNE   L0B83DE
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDA7
         PHA
         PEA   $001D
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
         BRA   L0B83FE
L0B83DE  TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDA7
         PHA
         PEA   $001C
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
L0B83FE  LDA   #$000F
         LDX   #$FFAB
         AND   $00,X
         DEC
         DEC
         BNE   L0B8411
         LDA   #$0012
         STA   $E5
         BRA   L0B8416
L0B8411  LDA   #$0013
         STA   $E5
L0B8416  PHY
         PHY
         PEI   $FA
         PEI   $F8
         LDX   #$FFA9
         LDA   $00,X
         PHA
         JSL   L07AE68
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDA   $E7
         ORA   $E9
         BNE   L0B843C
         PEA   $003D
         JSL   L0727E0
         BRL   L0B8537
L0B843C  PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDA7
         PHA
         PEI   $FA
         PEI   $F8
         LDX   #$FFA9
         LDA   $00,X
         PHA
         JSL   L07ACF0
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FFD1
         AND   $00,X
         SEC
         SBC   #$0000
         BMI   L0B84A8
         BEQ   L0B84A8
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         PEA   ^L0402D4
         PEA   L0402D4
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         PEA   ^L0402D9
         PEA   L0402D9
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA7
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0B84A8  PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDA7
         PHA
         PEA   $0011
         JSL   L073002
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FCA7
         PHA
         PEI   $E5
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FC93
         PHA
         LDX   #$FFA9
         LDA   $00,X
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA7
         PHA
         PEA   $0005
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         PEI   $E9
         PEI   $E7
         PEI   $FA
         PEI   $F8
         LDA   L055039
         LDX   L05503B
         PHX
         PHA
         LDX   #$FFA9
         LDA   $00,X
         PHA
         PEA   $FFFF
         JSL   L0F0000
L0B8537  LDA   $F2
         STA   $FA
         LDA   $F1
         STA   $F9
         LDA   $EF
         TCD
         TSC
         CLC
         ADC   #$0466
         TCS
         RTL

L0B8549  ENT
         PHD
         TSC
         CLC
         ADC   #$F9F8
         TCS
         ADC   #$0511
         TCD
         PHY
         PHY
         JSL   L076220
         PLA
         STA   $EF
         PLX
         STX   $F1
         LDA   $EF
         ORA   $F1
         BNE   L0B8570
         PEA   $003D
         JSL   L0727E0
         BRL   L0B85FF
L0B8570  PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDEF
         PHA
         PEA   $0011
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FCEF
         PHA
         PEA   $000E
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FBEF
         PHA
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L072CD4
         PEA   $0000
         TDC
         CLC
         ADC   #$FAEF
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072CD4
         PEA   $0000
         TDC
         CLC
         ADC   #$FEEF
         PHA
         PEA   $0004
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         PEI   $F1
         PEI   $EF
         PEA   $0000
         PEA   $0000
         LDA   L055039
         LDX   L05503B
         PHX
         PHA
         PEA   $0000
         PEA   $FFFF
         JSL   L0F0000
L0B85FF  TSC
         CLC
         ADC   #$0608
         TCS
         PLD
         RTL

L0B8607  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   #$0001
         STA   $05
L0B8614  LDA   $05
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0B862A
         INX
L0B862A  STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   L055039
         BNE   L0B8640
         CPX   L05503B
L0B8640  BEQ   L0B8647
         LDA   #$0000
         BRA   L0B864A
L0B8647  LDA   #$0001
L0B864A  BEQ   L0B867F
         PHA
         LDX   #$0000
         LDA   #$0003
         CMP   [$01]
         BNE   L0B8658
         INX
L0B8658  TXA
         BNE   L0B866A
         PHA
         LDX   #$0000
         LDA   [$01]
         DEC
         DEC
         BNE   L0B8666
         INX
L0B8666  TXA
         ORA   $01,S
         PLX
L0B866A  PHA
         PLA
         BNE   L0B867C
         PHA
         LDX   #$0000
         LDA   [$01]
         DEC
         BNE   L0B8678
         INX
L0B8678  TXA
         ORA   $01,S
         PLX
L0B867C  AND   $01,S
         PLX
L0B867F  CMP   #$0000
         BEQ   L0B86A6
         LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   $12
         BNE   L0B8694
         CPX   $14
L0B8694  BEQ   L0B869B
         LDA   #$0000
         BRA   L0B869E
L0B869B  LDA   #$0001
L0B869E  BEQ   L0B86A6
         PEI   $05
         JSL   L0B1A0C
L0B86A6  LDA   #$0040
         CMP   $05
         BEQ   L0B86B2
         INC   $05
         BRL   L0B8614
L0B86B2  LDA   $0E
         STA   $14
         LDA   $0D
         STA   $13
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L0B86C4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   #$0001
         STA   $05
L0B86D1  LDA   $05
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0B86E7
         INX
L0B86E7  STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   L055039
         BNE   L0B86FD
         CPX   L05503B
L0B86FD  BEQ   L0B8704
         LDA   #$0000
         BRA   L0B8707
L0B8704  LDA   #$0001
L0B8707  BEQ   L0B8771
         LDX   #$0000
         LDA   [$01]
         DEC
         DEC
         BNE   L0B8713
         INX
L0B8713  TXA
         BEQ   L0B8734
         PHA
         LDY   #$000C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   $12
         BNE   L0B8727
         CPX   $14
L0B8727  BEQ   L0B872E
         LDA   #$0000
         BRA   L0B8731
L0B872E  LDA   #$0001
L0B8731  AND   $01,S
         PLX
L0B8734  PHA
         PLA
         BNE   L0B8766
         PHA
         LDX   #$0000
         LDA   [$01]
         DEC
         BNE   L0B8742
         INX
L0B8742  TXA
         BEQ   L0B8763
         PHA
         LDY   #$0012
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   $12
         BNE   L0B8756
         CPX   $14
L0B8756  BEQ   L0B875D
         LDA   #$0000
         BRA   L0B8760
L0B875D  LDA   #$0001
L0B8760  AND   $01,S
         PLX
L0B8763  ORA   $01,S
         PLX
L0B8766  CMP   #$0000
         BEQ   L0B8771
         PEI   $05
         JSL   L0B1A0C
L0B8771  LDA   #$0040
         CMP   $05
         BEQ   L0B877D
         INC   $05
         BRL   L0B86D1
L0B877D  LDA   $0E
         STA   $14
         LDA   $0D
         STA   $13
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L0B878F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   #$0001
         STA   $05
L0B879C  LDA   $05
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0B87B2
         INX
L0B87B2  STA   $01
         STX   $03
         LDX   #$0000
         LDA   [$01]
         DEC
         BNE   L0B87BF
         INX
L0B87BF  TXA
         BEQ   L0B87E2
         PHA
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   L055039
         BNE   L0B87D5
         CPX   L05503B
L0B87D5  BEQ   L0B87DC
         LDA   #$0000
         BRA   L0B87DF
L0B87DC  LDA   #$0001
L0B87DF  AND   $01,S
         PLX
L0B87E2  PHA
         PLA
         BEQ   L0B8804
         PHA
         LDY   #$0012
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   $12
         BNE   L0B87F7
         CPX   $14
L0B87F7  BEQ   L0B87FE
         LDA   #$0000
         BRA   L0B8801
L0B87FE  LDA   #$0001
L0B8801  AND   $01,S
         PLX
L0B8804  CMP   #$0000
         BEQ   L0B881F
         LDX   #$0000
         LDY   #$000E
         LDA   $10
         CMP   [$01],Y
         BNE   L0B8816
         INX
L0B8816  TXA
         BEQ   L0B881F
         PEI   $05
         JSL   L0B1A0C
L0B881F  LDA   #$0040
         CMP   $05
         BEQ   L0B882B
         INC   $05
         BRL   L0B879C
L0B882B  LDA   $0E
         STA   $14
         LDA   $0D
         STA   $13
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L0B883D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   #$0001
         STA   $05
L0B884A  LDA   $05
         DEC
         PEA   $002C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0510DE
         LDX   #^L0510DE
         BCC   L0B8860
         INX
L0B8860  STA   $01
         STX   $03
         LDA   [$01]
         BEQ   L0B886B
         LDA   #$0001
L0B886B  BEQ   L0B888F
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   $12
         BNE   L0B887D
         CPX   $14
L0B887D  BEQ   L0B8884
         LDA   #$0000
         BRA   L0B8887
L0B8884  LDA   #$0001
L0B8887  BEQ   L0B888F
         PEI   $05
         JSL   L0B1A0C
L0B888F  LDA   #$0040
         CMP   $05
         BEQ   L0B889A
         INC   $05
         BRA   L0B884A
L0B889A  LDA   $0E
         STA   $14
         LDA   $0D
         STA   $13
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L0B88AC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD6
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $32
         PEI   $30
         PEA   $0020
         JSL   L0313BE
         PHY
         PEA   ^L051C38
         PEA   L051C38
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B01D3
         PLA
         STA   $21
         LDA   $21
         BEQ   L0B88FD
         PEA   ^L051C38
         PEA   L051C38
         PEI   $21
         JSL   L0B3A6A
         PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   $23
         PLX
         STX   $25
         BRA   L0B8927
L0B88FD  PHY
         PHY
         PEA   $0000
         PEA   $0001
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   $23
         PLX
         STX   $25
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $27
         STX   $29
         SEP   #$20
         LDA   #$00
         STA   [$27]
         REP   #$20
L0B8927  LDA   $23
         LDX   $25
         STA   $34
         STX   $36
         LDA   $2E
         STA   $32
         LDA   $2D
         STA   $31
         LDA   $2B
         TCD
         TSC
         CLC
         ADC   #$0030
         TCS
         RTL

L0B8941  PHD
         TSC
         CLC
         ADC   #$FCEE
         TCS
         ADC   #$0221
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE5
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FEE5
         AND   $00,X
         STA   $E7
         LDAL  L0402DB
         SEP   #$20
         STA   [$FC]
         REP   #$20
         LDA   $E7
         BNE   L0B897B
         BRL   L0B8AA4
L0B897B  LDA   #$0001
         STA   $EB
L0B8980  LDA   $F6
         SEC
         SBC   #$0001
         BEQ   L0B89B5
         BVS   L0B898D
         EOR   #$8000
L0B898D  BPL   L0B89B5
         LDA   $E7
         CMP   $EB
         BNE   L0B8998
         BRL   L0B8AA4
L0B8998  LDA   $EB
         CLC
         ADC   #$FEE5
         TAX
         LDA   #$00FF
         AND   $00,X
         CMP   #$002C
         BNE   L0B89AE
         LDA   $F6
         DEC
         STA   $F6
L0B89AE  LDA   $EB
         INC
         STA   $EB
         BRA   L0B8980
L0B89B5  LDA   $EB
         STA   $E9
L0B89B9  LDA   $E9
         CLC
         ADC   #$FEE5
         TAX
         LDA   #$00FF
         AND   $00,X
         CMP   #$002C
         BNE   L0B89CF
         LDA   #$0000
         BRA   L0B89D2
L0B89CF  LDA   #$0001
L0B89D2  PHA
         LDA   $E9
         SEC
         SBC   $E7
         BVS   L0B89DD
         EOR   #$8000
L0B89DD  BPL   L0B89E4
         LDA   #$0000
         BRA   L0B89E7
L0B89E4  LDA   #$0001
L0B89E7  AND   $01,S
         PLX
         LSR
         BCC   L0B89F4
         LDA   $E9
         INC
         STA   $E9
         BRA   L0B89B9
L0B89F4  LDA   $E9
         CLC
         ADC   #$FEE5
         TAX
         LDA   #$00FF
         AND   $00,X
         CMP   #$002C
         BNE   L0B8A0A
         LDA   $E9
         DEC
         STA   $E9
L0B8A0A  LDAL  L0402DC
         LDX   #$FFE5
         SEP   #$20
         STA   $00,X
         REP   #$20
         LDA   $EB
         LDX   #$FDE3
         STA   $00,X
         LDA   $E9
         LDX   #$FDE1
         STA   $00,X
         LDX   #$FDE1
         LDA   $00,X
         LDX   #$FDE3
         SEC
         SBC   $00,X
         BVS   L0B8A35
         EOR   #$8000
L0B8A35  BPL   L0B8A90
         LDX   #$FDE3
         LDA   $00,X
         STA   $E5
L0B8A3E  PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         LDA   $E5
         CLC
         ADC   #$FEE5
         TAX
         LDA   #$00FF
         AND   $00,X
         XBA
         INC
         LDX   #$FDDF
         STA   $00,X
         PEA   $0000
         TDC
         CLC
         ADC   #$FDDF
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE5
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         LDA   $E5
         LDX   #$FDE1
         CMP   $00,X
         BEQ   L0B8A90
         INC   $E5
         BRA   L0B8A3E
L0B8A90  PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         PEA   $0100
         JSL   L0313BE
L0B8AA4  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$031A
         TCS
         RTL

L0B8AB6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PEA   ^L0402DD
         PEA   L0402DD
         JSL   L0B2C0A
         LDA   #$0001
         STA   L05539D
         STZ   L0553A5
         LDA   L0553C3
         SEC
         SBC   #$0000
         BPL   L0B8ADD
         STZ   L0553C3
L0B8ADD  LDA   L0553C3
         SEC
         SBC   #$0000
         BMI   L0B8B0D
         BEQ   L0B8B0D
         LDA   L0553C3
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L0B8AF8
         EOR   #$8000
L0B8AF8  BPL   L0B8B0D
         LDA   #$0001
         STA   $03
L0B8AFF  JSL   L0E0000
         LDA   $03
         CMP   $01
         BEQ   L0B8B0D
         INC   $03
         BRA   L0B8AFF
L0B8B0D  LDA   L0553B5
         ORA   L0553B7
         BEQ   L0B8B1B
         STZ   L0553B5
         STZ   L0553B7
L0B8B1B  LDA   L055391
         BEQ   L0B8B23
         STZ   L055391
L0B8B23  LDA   L055371
         BEQ   L0B8B2B
         STZ   L055371
L0B8B2B  LDA   L05539B
         BEQ   L0B8B33
         STZ   L05539B
L0B8B33  PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0B8B39  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   L05535F
         JSL   L160694
         JSL   L1606A2
         PLY
         PLY
         PLD
         RTL

L0B8B50  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   L0553B9
         LDX   L0553BB
         STA   $01
         STX   $03
         LDA   #L051BE6
         LDX   #^L051BE6
         STA   L0553B9
         STX   L0553BB
         PEA   ^L051054
         PEA   L051054
         JSL   L0B0D0A
         PHY
         JSL   L0B7AF6
         PLA
         STA   $05
         LDA   $01
         LDX   $03
         STA   L0553B9
         STX   L0553BB
         PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0B8B91  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   $18
         BNE   L0B8B9F
         BRA   L0B8C05
L0B8B9F  LDA   L0553B9
         LDX   L0553BB
         STA   $01
         STX   $03
         LDA   #L051BE6
         LDX   #^L051BE6
         STA   L0553B9
         STX   L0553BB
         PEA   ^L051054
         PEA   L051054
         JSL   L0B0D0A
         LDA   #$0001
         STAL  L051054
         LDA   $10
         LDX   $12
         STAL  L05105A
         TXA
         STAL  L05105C
         LDA   $14
         LDX   $16
         STAL  L05105E
         TXA
         STAL  L051060
         LDA   $1A
         LDX   $1C
         STAL  L051064
         TXA
         STAL  L051066
         LDA   $18
         STAL  L051062
         PHY
         JSL   L0B7AF6
         PLA
         STA   $05
         LDA   $01
         LDX   $03
         STA   L0553B9
         STX   L0553BB
L0B8C05  LDA   $0E
         STA   $1C
         LDA   $0D
         STA   $1B
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L0B8C17  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD6
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $36
         PEI   $34
         PEA   $0020
         JSL   L0313BE
         PHY
         PEA   ^L051C38
         PEA   L051C38
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B01D3
         PLA
         STA   $25
         LDA   $25
         BNE   L0B8C65
         PHY
         PEA   ^L051C38
         PEA   L051C38
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B2819
         PLA
         STA   $25
L0B8C65  PEI   $32
         PEI   $30
         JSL   L0E0CB5
         PEA   ^L051C38
         PEA   L051C38
         PEI   $25
         JSL   L0B3CD4
         LDA   $2E
         STA   $36
         LDA   $2D
         STA   $35
         LDA   $2B
         TCD
         TSC
         CLC
         ADC   #$0034
         TCS
         RTL

L0B8C8B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L0301CE
         JSL   L0B392B
L0B8C9B  PHY
         JSL   L0301E4
         PLA
         BNE   L0B8C9B
         PLY
         PLY
         PLD
         RTL

L0B8CA7  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $0A
         BEQ   L0B8CC6
         PEI   $0E
         PEI   $0C
         PEA   ^L0402E6
         PEA   L0402E6
         PEA   $0005
         JSL   L0313BE
         BRA   L0B8CD7
L0B8CC6  PEI   $0E
         PEI   $0C
         PEA   ^L0402EB
         PEA   L0402EB
         PEA   $0006
         JSL   L0313BE
L0B8CD7  LDA   $08
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

L0B8CE7  PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $11
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         LDA   $1C
         DEC
         BMI   L0B8D76
         CMP   #$0005
         BPL   L0B8D76
         SEC
         SBC   #$0000
         BEQ   L0B8D1D
         DEC
         DEC
         BEQ   L0B8D2C
         DEC
         BEQ   L0B8D43
         DEC
         BEQ   L0B8D5A
         BRA   L0B8D76
L0B8D1D  STZ   L055139
         PEA   ^L05310F
         PEA   L05310F
         JSL   L082712
         BRA   L0B8D76
L0B8D2C  LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEA   $0000
         PEA   ^L053259
         PEA   L053259
         JSL   L085B3C
         BRA   L0B8D76
L0B8D43  LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEA   $FFFF
         PEA   ^L053259
         PEA   L053259
         JSL   L085B3C
         BRA   L0B8D76
L0B8D5A  PEA   ^L053259
         PEA   L053259
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         JSL   L1606B0
         BRA   L0B8D76
L0B8D76  LDA   $1C
         SEC
         SBC   #$0001
         BEQ   L0B8DFB
         BVS   L0B8D83
         EOR   #$8000
L0B8D83  BPL   L0B8DFB
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L082712
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L08295E
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L082712
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L082766
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
         PEA   ^L05310F
         PEA   L05310F
         JSL   L081E5F
         LDA   #$0001
         STA   L055137
         LDA   #$0001
         STA   L055133
         PEA   ^L0532B5
         PEA   L0532B5
         JSL   L082712
L0B8DFB  JSL   L096029
         JSL   L09AED3
         PEI   $11
         JSL   L071AA4
         LDA   $1A
         STA   $1C
         LDA   $19
         STA   $1B
         LDA   $17
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L0B8E1B  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $01
         PEI   $0E
         PEI   $0C
         JSL   L0E0EA8
         PHY
         JSL   L0B5955
         PLA
         LSR
         BCC   L0B8E4A
         PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   $10
         PLX
         STX   $12
         BRA   L0B8E4E
L0B8E4A  STZ   $10
         STZ   $12
L0B8E4E  PEI   $01
         JSL   L071AA4
         LDA   $0A
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

L0B8E66  PHD
         TSC
         CLC
         ADC   #$FEFA
         TCS
         ADC   #$0013
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $ED
         PEI   $FA
         PEI   $F8
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         JSL   L0B1426
         PHY
         LDA   #$00FF
         LDX   #$FFED
         AND   $00,X
         PHA
         PEA   $001F
         JSL   L072FD5
         PLA
         LDX   #$FFED
         SEP   #$20
         STA   $00,X
         REP   #$20
         PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         PEA   $0020
         JSL   L0313BE
         PEI   $ED
         JSL   L071AA4
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$010C
         TCS
         RTL

L0B8ED1  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $18
         LDA   $14
         LDX   $16
         STA   $05
         STX   $07
         LDA   #$0001
         STA   [$05]
         LDA   #$0000
         LDY   #$0022
         STA   [$05],Y
         LDA   #$0024
         CLC
         ADC   $05
         LDX   $07
         BCC   L0B8F01
         INX
L0B8F01  STA   $01
         STX   $03
         LDA   #$0002
         STA   [$01]
         LDA   $12
         BEQ   L0B8F20
         LDA   L055027
         LDX   L055029
         LDY   #$0002
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         BRA   L0B8F30
L0B8F20  LDA   L05501F
         LDX   L055021
         LDY   #$0002
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
L0B8F30  LDA   L055027
         LDX   L055029
         LDY   #$000A
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   L05501F
         LDX   L055021
         LDY   #$0006
         STA   [$01],Y
         INY
         INY
         TXA
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

L0B8F62  PHD
         TSC
         CLC
         ADC   #$FEA6
         TCS
         ADC   #$0069
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FF97
         PHA
         PEI   $F8
         PEI   $F6
         PEA   $0100
         JSL   L0313BE
         PHY
         TDC
         CLC
         ADC   #$0099
         PEA   $0000
         PHA
         PEI   $FA
         JSL   L0B8ED1
         PLA
         STA   $97
         LDA   #$0001
         STA   $CB
         TDC
         CLC
         ADC   #$00CD
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF97
         PHA
         PEA   $0020
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0099
         PEA   $0000
         PHA
         JSL   L0E0BFC
         PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   $FC
         PLX
         STX   $FE
         PEI   $97
         JSL   L071AA4
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0162
         TCS
         RTL

L0B8FE3  PHD
         TSC
         CLC
         ADC   #$FFA6
         TCS
         TCD
         PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $62
         JSL   L0B8ED1
         PLA
         STA   $01
         LDA   #$0002
         STA   $35
         LDA   $60
         JSL   L150488
         STA   $37
         STX   $39
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L0E0BFC
         PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   $64
         PLX
         STX   $66
         PEI   $01
         JSL   L071AA4
         LDA   $5E
         STA   $62
         LDA   $5D
         STA   $61
         LDA   $5B
         TCD
         TSC
         CLC
         ADC   #$0060
         TCS
         RTL

L0B903E  PHD
         TSC
         CLC
         ADC   #$FFA6
         TCS
         TCD
         PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $62
         JSL   L0B8ED1
         PLA
         STA   $01
         LDA   #$0003
         STA   $35
         LDA   $60
         STA   $37
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L0E0BFC
         PHY
         PHY
         JSL   L0E04DE
         PLA
         STA   $64
         PLX
         STX   $66
         PEI   $01
         JSL   L071AA4
         LDA   $5E
         STA   $62
         LDA   $5D
         STA   $61
         LDA   $5B
         TCD
         TSC
         CLC
         ADC   #$0060
         TCS
         RTL

L0B9093  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $01
         PHY
         PHY
         PEI   $0E
         PEI   $0C
         JSL   L0B88AC
         PLA
         STA   $10
         PLX
         STX   $12
         PEI   $01
         JSL   L071AA4
         LDA   $0A
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

L0B90CB  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $01
         LDA   L055139
         BNE   L0B9108
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
L0B9108  PEI   $12
         PEI   $10
         PEA   ^L053219
         PEA   L053219
         PEA   $0010
         JSL   L0313BE
         PEI   $0E
         PEI   $0C
         PEA   ^L053209
         PEA   L053209
         PEA   $0010
         JSL   L0313BE
         PEI   $01
         JSL   L071AA4
         LDA   $0A
         STA   $12
         LDA   $09
         STA   $11
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L0B9142  PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $1A
         PEI   $18
         PEA   $0008
         JSL   L0313BE
         PHY
         JSL   L071BFF
         PLA
         STA   $09
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0008
         PEA   $000C
         JSL   L0E07C5
         PEI   $16
         PEI   $14
         JSL   L0E06AC
         PEI   $09
         JSL   L071AA4
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

L0B919C  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $01
         TDC
         CLC
         ADC   #$0010
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E07C5
         PEI   $0E
         PEI   $0C
         JSL   L0E06AC
         PEI   $01
         JSL   L071AA4
         LDA   $0A
         STA   $12
         LDA   $09
         STA   $11
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L0B91E2  PHD
         TSC
         CLC
         ADC   #$FEFA
         TCS
         ADC   #$0013
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PHY
         JSL   L071BFF
         PLA
         STA   $ED
         PEA   ^L052406
         PEA   L052406
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         PEA   $0100
         JSL   L0313BE
         JSL   L0B8B50
         PEI   $ED
         JSL   L071AA4
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$010C
         TCS
         RTL

L0B923B  PHD
         TSC
         CLC
         ADC   #$FEF8
         TCS
         ADC   #$0015
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PHY
         JSL   L071BFF
         PLA
         STA   $ED
         PEA   ^L051054
         PEA   L051054
         JSL   L0B0D0A
         LDA   #$0005
         STAL  L051054
         PEA   ^L052406
         PEA   L052406
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         PEA   $0100
         JSL   L0313BE
         PHY
         JSL   L0B7AF6
         PLA
         STA   $EB
         PEI   $ED
         JSL   L071AA4
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$010E
         TCS
         RTL

L0B92A9  PHD
         TSC
         CLC
         ADC   #$FEA6
         TCS
         ADC   #$006D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FF93
         PHA
         PEI   $F8
         PEI   $F6
         PEA   $0100
         JSL   L0313BE
         PHY
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         PEI   $FA
         JSL   L0B8ED1
         PLA
         STA   $93
         LDA   #$0001
         STA   $C7
         TDC
         CLC
         ADC   #$00C9
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF93
         PHA
         PEA   $0020
         JSL   L0313BE
         PEI   $F4
         PEI   $F2
         JSL   L0E0CB5
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L0E0184
         PEI   $93
         JSL   L071AA4
         LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$0166
         TCS
         RTL

L0B9329  PHD
         TSC
         CLC
         ADC   #$FFA6
         TCS
         TCD
         PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $66
         JSL   L0B8ED1
         PLA
         STA   $01
         LDA   #$0002
         STA   $35
         LDA   $64
         JSL   L150488
         STA   $37
         STX   $39
         PEI   $62
         PEI   $60
         JSL   L0E0CB5
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L0E0184
         PEI   $01
         JSL   L071AA4
         LDA   $5E
         STA   $66
         LDA   $5D
         STA   $65
         LDA   $5B
         TCD
         TSC
         CLC
         ADC   #$0064
         TCS
         RTL

L0B9383  PHD
         TSC
         CLC
         ADC   #$FFA6
         TCS
         TCD
         PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $66
         JSL   L0B8ED1
         PLA
         STA   $01
         LDA   #$0003
         STA   $35
         LDA   $64
         STA   $37
         PEI   $62
         PEI   $60
         JSL   L0E0CB5
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L0E0184
         PEI   $01
         JSL   L071AA4
         LDA   $5E
         STA   $66
         LDA   $5D
         STA   $65
         LDA   $5B
         TCD
         TSC
         CLC
         ADC   #$0064
         TCS
         RTL

L0B93D7  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $01
         PEI   $12
         PEI   $10
         PEI   $0E
         PEI   $0C
         JSL   L0B8C17
         PEI   $01
         JSL   L071AA4
         LDA   $0A
         STA   $12
         LDA   $09
         STA   $11
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L0B940B  PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $30
         PEI   $2E
         PEA   $0020
         JSL   L0313BE
         PHY
         JSL   L071BFF
         PLA
         STA   $21
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         JSL   L0B05B4
         PLA
         LSR
         BCS   L0B944C
         STZ   $23
L0B944C  LDA   $23
         STA   $32
         PEI   $21
         JSL   L071AA4
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

L0B9468  PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $0B
         PEI   $26
         PEI   $24
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEI   $22
         PEI   $20
         JSL   L1501C1
         PEA   $000A
         JSL   L0313BE
         PEI   $0B
         JSL   L071AA4
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

L0B94AC  PHD
         TSC
         CLC
         ADC   #$FDF6
         TCS
         ADC   #$011B
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PHY
         JSL   L071BFF
         PLA
         STA   $E9
         LDA   $F4
         LDX   $F6
         TXY
         LDX   #$FFE5
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L0B94F0
         INX
L0B94F0  STA   $EB
         STX   $ED
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   $0001
         JSL   L0B8941
         JSL   L071DE3
         PLA
         PLX
         STA   [$EB]
         LDX   #$FFE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $EB
         STX   $ED
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   $0002
         JSL   L0B8941
         JSL   L071DE3
         PLA
         PLX
         STA   [$EB]
         PEI   $E9
         JSL   L071AA4
         LDA   $F2
         STA   $FA
         LDA   $F1
         STA   $F9
         LDA   $EF
         TCD
         TSC
         CLC
         ADC   #$0214
         TCS
         RTL

L0B955F  PHD
         TSC
         CLC
         ADC   #$FDF6
         TCS
         ADC   #$011B
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PHY
         JSL   L071BFF
         PLA
         STA   $E9
         LDA   $F4
         LDX   $F6
         TXY
         LDX   #$FFE5
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L0B95A3
         INX
L0B95A3  STA   $EB
         STX   $ED
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   $0001
         JSL   L0B8941
         JSL   L071DE3
         PLA
         PLX
         STA   [$EB]
         LDX   #$FFE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $EB
         STX   $ED
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   $0002
         JSL   L0B8941
         JSL   L071DE3
         PLA
         PLX
         STA   [$EB]
         LDX   #$FFE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L0B960A
         INX
L0B960A  STA   $EB
         STX   $ED
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   $0003
         JSL   L0B8941
         JSL   L071DE3
         PLA
         PLX
         STA   [$EB]
         LDX   #$FFE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L0B9641
         INX
L0B9641  STA   $EB
         STX   $ED
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   $0004
         JSL   L0B8941
         JSL   L071DE3
         PLA
         PLX
         STA   [$EB]
         PEI   $E9
         JSL   L071AA4
         LDA   $F2
         STA   $FA
         LDA   $F1
         STA   $F9
         LDA   $EF
         TCD
         TSC
         CLC
         ADC   #$0214
         TCS
         RTL


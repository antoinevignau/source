*
* Genesys v1.2.4
* Main program: segment 4
*

         mx    %00
         rel
         lst   off

*----------------------------

         use   4/Ctl.Macs
         use   4/Int.Macs
         use   4/Line.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/QD.Macs
         use   4/QDAux.Macs
         use   4/Resource.Macs
	 use   4/Std.Macs
         use   4/Text.Macs
	 use   4/TextEdit.Macs
         use   4/Util.Macs
         use   4/Window.Macs

	 use   GESEG4.X.S
	
*----------------------------

L040000  ENT
         TSC
         SEC
         SBC   #$0024
         TCS
         PHD
         TCD
         LDX   $2A
         LDA   $28
         STX   L027EA9
         STA   L027EA7
         LDA   #$0000
         SEP   #$20
         STA   L027EB0
         REP   #$20
         LDA   #$007F
         SEP   #$20
         STA   L027EAF
         REP   #$20
         STZ   L027ECF
         LDA   #$0022
         STA   L027ECD
         STZ   L027EB7
         LDA   #$002E
         STA   L027EB5
         LDA   #$0000
         STA   L027ECB
         LDX   L027EA9
         LDA   L027EA7
         STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         PHA
         _SetCurResourceFile
*         STA   L02DD98
         PHA
         PEA   $0001
         _SetResourceFileDepth
*         STA   L02DD98
         PLA
         STA   $0B
         JSL   L040D38
         STA   $07
         LDA   $07
         BEQ   L0400C7
         LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L02ACFE
         PHA
         PEI   $0B
         _SetResourceFileDepth
*         STA   L02DD98
         PLA
         STA   $0B
         LDA   $07
         CMP   #$FFFF
         BEQ   L0400BF
         JSL   L0409D2
         LDA   $07
         STA   $05
         BRL   L0406A7
L0400BF  LDA   #$0000
         STA   $05
         BRL   L0406A7
L0400C7  LDX   L027EA9
         LDA   L027EA7
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STX   L027EBD
         STA   L027EBB
         LDX   L027EBD
         LDA   L027EBB
         STX   L0280F7
         STA   L0280F5
         STX   L027EEF
         STA   L027EED
         STX   L0280AF
         STA   L0280AD
         PEA   $2002
         PEA   ^L0280AB
         PEA   L0280AB
         JSL   L02C243
         LDX   L027EA9
         LDA   L027EA7
         STA   $01
         STX   $03
         LDY   #$000A
         LDA   [$01],Y
         PHA
         LDY   #$0008
         LDA   [$01],Y
         PHA
         PEA   $0000
         PEA   $007F
         JSL   L02D6DE
         BEQ   L040189
         LDA   #$0004
         STA   L027EF3
         PEA   ^L027EF5
         PEA   L027EF5
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         LDY   #$0002
         STA   [$01],Y
         LDX   L027EA9
         LDA   L027EA7
         STA   $01
         STX   $03
         LDY   #$000A
         LDA   [$01],Y
         PHA
         LDY   #$0008
         LDA   [$01],Y
         PHA
         LDA   #$00FF
         LDX   #$0000
         LDY   #$0001
         CMP   $01,S
         BEQ   L040166
         DEY
L040166  TXA
         CMP   $03,S
         BEQ   L04016E
         LDY   #$0000
L04016E  PLA
         PLA
         TYA
         BEQ   L040187
         LDA   #$0080
         SEP   #$20
         STA   L027EB0
         REP   #$20
         LDA   #$00FF
         SEP   #$20
         STA   L027EAF
         REP   #$20
L040187  BRA   L0401BB
L040189  LDA   #$00B0
         STA   L027EF3
         LDX   L027EA9
         LDA   L027EA7
         STA   $01
         STX   $03
         LDY   #$000A
         LDA   [$01],Y
         TAX
         LDY   #$0008
         LDA   [$01],Y
         PHX
         PHA
         PEA   ^L027EF5
         PEA   L027EF5
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
L0401BB  PEA   $2001
         PEA   ^L027EEB
         PEA   L027EEB
         JSL   L02C243
         JSL   L02CA27
         STA   $07
         LDA   $07
         BEQ   L040217
         LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L02ACFE
         JSL   L0409D2
         PHA
         PEI   $0B
         _SetResourceFileDepth
*         STA   L02DD98
         PLA
         STA   $0B
         LDA   $07
         STA   $05
         BRL   L0406A7
L040217  LDA   #$0002
         STA   L0280F1
         PEA   $2010
         PEA   ^L0280F1
         PEA   L0280F1
         JSL   L02C243
         JSL   L02CA27
         STA   $07
         LDA   $07
         BEQ   L040279
         LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L02ACFE
         JSL   L0409D2
         PHA
         PEI   $0B
         _SetResourceFileDepth
*         STA   L02DD98
         PLA
         STA   $0B
         LDA   $07
         STA   $05
         BRL   L0406A7
L040279  PEA   ^L027F61
         PEA   L027F61
         LDA   L0280F3
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PHA
         _CountTypes
*         STA   L02DD98
         PLA
         STA   $0D
         LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L02ACFE
         PEA   $0001
         JSL   L0406BA
         LDA   #$0001
         STA   $07
         LDA   #$0000
         STA   L027EB9
L0402D4  LDA   $0D
         LDX   #$0001
         SEC
         SBC   $07
         BVS   L0402E1
         EOR   #$8000
L0402E1  BMI   L0402E4
         DEX
L0402E4  TXA
         CMP   #$0000
         BEQ   L040307
         LDA   L027EB9
         LDX   #$0001
         SEC
         SBC   #$FFFE
         BEQ   L0402FD
         BVS   L0402FB
         EOR   #$8000
L0402FB  BMI   L0402FE
L0402FD  DEX
L0402FE  TXA
         CMP   #$0000
         BEQ   L040307
         LDA   #$0001
L040307  TAX
         BNE   L04030D
         BRL   L04064F
L04030D  PHA
         PEI   $07
         _GetIndType
*         STA   L02DD98
         PLA
         STA   $17
         CMP   #$8014
         BNE   L040325
         BRL   L04064A
L040325  LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         PEA   $0001
         PEA   $0000
         PEI   $07
         PEA   $0000
         PEI   $0D
         PEA   $0000
         PEA   $0000
         PEI   $17
         JSL   L02ACFE
         LDX   L027EA9
         LDA   L027EA7
         STA   $01
         STX   $03
         LDY   #$000E
         LDA   [$01],Y
         AND   #$8000
         LDX   #$0000
         CMP   #$0000
         BEQ   L040367
         INX
L040367  TXA
         BNE   L04036E
         LDA   $17
         BRA   L040371
L04036E  LDA   #$8014
L040371  PHA
         JSL   L042616
         STX   $1F
         STA   $1D
         PHA
         PHA
         PEI   $17
         _CountResources
*         STA   L02DD98
         PLA
         PLX
         STA   $0F
         LDA   #$0001
         STA   $09
L040391  LDA   $0F
         LDX   #$0001
         SEC
         SBC   $09
         BVS   L04039E
         EOR   #$8000
L04039E  BMI   L0403A1
         DEX
L0403A1  TXA
         CMP   #$0000
         BEQ   L0403C4
         LDA   L027EB9
         LDX   #$0001
         SEC
         SBC   #$FFFF
         BEQ   L0403BA
         BVS   L0403B8
         EOR   #$8000
L0403B8  BMI   L0403BB
L0403BA  DEX
L0403BB  TXA
         CMP   #$0000
         BEQ   L0403C4
         LDA   #$0001
L0403C4  TAX
         BNE   L0403CA
         BRL   L04064A
L0403CA  PHA
         PHA
         PEI   $17
         LDA   $09
         LDX   #$0000
         TAY
         BPL   L0403D7
         DEX
L0403D7  PHX
         PHA
         _GetIndResource
*         STA   L02DD98
         PLA
         STA   $19
         PLA
         STA   $1B
         LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         PEA   $0002
         PEI   $09
         PEI   $07
         PEI   $0F
         PEI   $0D
         LDX   $1B
         LDA   $19
         PHX
         PHA
         PEI   $17
         JSL   L02ACFE
         PHA
         PEI   $17
         LDX   $1B
         LDA   $19
         PHX
         PHA
         _GetResourceAttr
*         STA   L02DD98
         PLA
         STA   $11
         PEA   $000C
         PEI   $17
         LDX   $1B
         LDA   $19
         PHX
         PHA
         _SetResourceAttr
*         STA   L02DD98
         PHA
         PHA
         PEI   $17
         LDX   $1B
         LDA   $19
         PHX
         PHA
         _LoadResource
*         STA   L02DD98
         PLA
         STA   $21
         PLA
         STA   $23
         LDX   $23
         LDA   $21
         PHX
         PHA
         _HLock
*         STA   L02DD98
         PEI   $11
         PEI   $17
         LDX   $1B
         LDA   $19
         PHX
         PHA
         _SetResourceAttr
*         STA   L02DD98
         LDX   $1F
         LDA   $1D
         STX   L027EC5
         STA   L027EC3
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         STX   L027EC1
         STA   L027EBF
         LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         PEA   ^L028258
         PEA   L028258
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L02825C
         PEA   L02825C
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         PHA
         PHA
         LDX   $23
         LDA   $21
         PHX
         PHA
         _GetHandleSize
*         STA   L02DD98
         PEA   ^L028260
         PEA   L028260
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         LDA   $17
         PEA   $0000
         PHA
         PEA   ^L028264
         PEA   L028264
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         PEA   ^L028268
         PEA   L028268
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   $19
         STA   [$01]
         LDA   $1B
         STA   [$01],Y
         LDA   $09
         LDX   #$0000
         TAY
         BPL   L04051F
         DEX
L04051F  PHX
         PHA
         PEA   ^L02826C
         PEA   L02826C
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         PEA   ^L028270
         PEA   L028270
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         PHA
         PHA
         STA   [$01]
         STA   $03,S
         STA   [$01],Y
         PEA   ^L028274
         PEA   L028274
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         LDA   $0F
         LDX   #$0000
         TAY
         BPL   L040568
         DEX
L040568  PHX
         PHA
         PEA   ^L028278
         PEA   L028278
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         PEI   $11
         JSL   L0426A8
         PHX
         PHA
         PEA   ^L02827C
         PEA   L02827C
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         JSL   L041442
         LDA   L027EB9
         BNE   L0405CC
         LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         PEA   $0003
         PEI   $09
         PEI   $07
         PEI   $0F
         PEI   $0D
         LDX   $1B
         LDA   $19
         PHX
         PHA
         PEI   $17
         JSL   L02ACFE
         BRA   L040630
L0405CC  LDA   L027EB9
         CMP   #$FFFF
         BNE   L0405FE
         LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         PEA   $0005
         PEI   $09
         PEI   $07
         PEI   $0F
         PEI   $0D
         LDX   $1B
         LDA   $19
         PHX
         PHA
         PEI   $17
         JSL   L02ACFE
         STA   L027EB9
         BRA   L040630
L0405FE  LDA   L027EB9
         BMI   L040606
         DEC
         BPL   L040608
L040606  BRA   L040630
L040608  LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         PEA   $0006
         PEI   $09
         PEI   $07
         PEI   $0F
         PEI   $0D
         LDX   $1B
         LDA   $19
         PHX
         PHA
         PEI   $17
         JSL   L02ACFE
         STA   L027EB9
L040630  PEA   $FFFF
         PEI   $17
         LDX   $1B
         LDA   $19
         PHX
         PHA
         _ReleaseResource
*         STA   L02DD98
         INC   $09
         BRL   L040391
L04064A  INC   $07
         BRL   L0402D4
L04064F  PEA   $0002
         JSL   L0406BA
         LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         PEA   $0004
         PEI   $09
         PEI   $07
         PEI   $0F
         PEI   $0D
         PEA   $0000
         PEA   $0000
         PEI   $17
         JSL   L02ACFE
         LDA   #$0001
         STA   L0280F1
         PEA   $2014
         PEA   ^L0280F1
         PEA   L0280F1
         JSL   L02C243
         JSL   L0409D2
         PHA
         PEI   $0B
         _SetResourceFileDepth
*         STA   L02DD98
         PLA
         STA   $0B
         LDA   #$0000
         STA   $05
L0406A7  LDA   $26
         STA   $2A
         LDA   $25
         STA   $29
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0028
         TCS
         TYA
         RTL

L0406BA  TSC
         SEC
         SBC   #$0004
         TCS
         PHD
         TCD
         LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         LDA   $08
         CLC
         ADC   #$0008
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L02ACFE
         LDX   L027EA9
         LDA   L027EA7
         STA   $01
         STX   $03
         LDY   #$000E
         LDA   [$01],Y
         AND   #$8000
         BEQ   L04070A
         LDA   $08
         INC
         INC
         STA   $08
L04070A  LDA   L027ED5
         ORA   L027ED7
         BEQ   L040758
         LDX   L027ED7
         LDA   L027ED5
         STX   L027EC5
         STA   L027EC3
         LDA   $08
         LDX   #$0000
         TAY
         BPL   L040727
         DEX
L040727  PHX
         PHA
         PEA   ^L028274
         PEA   L028274
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         JSL   L041442
         PEA   ^L028274
         PEA   L028274
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         LDY   #$0002
         STA   [$01],Y
L040758  LDA   $06
         STA   $08
         LDA   $05
         STA   $07
         PLD
         TSC
         CLC
         ADC   #$0006
         TCS
         RTL

L040768  TSC
         SEC
         SBC   #$000C
         TCS
         PHD
         TCD
         LDA   $10
         ORA   $12
         BNE   L0407DF
         PHA
         PHA
         PEA   $0000
         PEA   $000A
         LDX   L027EA9
         LDA   L027EA7
         STA   $01
         STX   $03
         LDY   #$0006
         LDA   [$01],Y
         PHA
         PEA   $C018
         PEA   $0000
         PEA   $0000
         _NewHandle
*         STA   L02DD98
         PLA
         STA   $09
         PLA
         STA   $0B
         LDX   $0B
         LDA   $09
         PHX
         PHA
         _HLock
*         STA   L02DD98
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STX   $12
         STA   $10
         LDA   $14
         STA   [$10]
         LDA   $16
         STA   [$10],Y
         INY
         INY
         LDA   $18
         STA   [$10],Y
         LDY   #$0006
         LDA   #$0000
         STA   [$10],Y
         INY
         INY
         STA   [$10],Y
         BRA   L04080B
L0407DF  LDA   [$10]
         CMP   $14
         BEQ   L04080B
         LDX   $18
         LDA   $16
         PHX
         PHA
         PEI   $14
         LDY   #$0008
         LDA   [$10],Y
         TAX
         LDY   #$0006
         LDA   [$10],Y
         PHX
         PHA
         JSL   L040768
         PHX
         PHA
         LDY   #$0006
         PLA
         STA   [$10],Y
         INY
         INY
         PLA
         STA   [$10],Y
L04080B  LDA   $10
         LDX   $12
         STA   $05
         STX   $07
         LDA   $0E
         STA   $18
         LDA   $0D
         STA   $17
         LDX   $07
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         RTL

L040828  TSC
         SEC
         SBC   #$000C
         TCS
         PHD
         TCD
         LDA   $10
         STA   $0B
         BRA   L040898
L040836  PEA   ^L040916
         PEA   L040916
         PLA
         STA   $07
         PLA
         STA   $09
         BRA   L0408BC
L040844  PEA   ^L04092F
         PEA   L04092F
         PLA
         STA   $07
         PLA
         STA   $09
         BRA   L0408BC
L040852  PEA   ^L040949
         PEA   L040949
         PLA
         STA   $07
         PLA
         STA   $09
         BRA   L0408BC
L040860  PEA   ^L04095B
         PEA   L04095B
         PLA
         STA   $07
         PLA
         STA   $09
         BRA   L0408BC
L04086E  PEA   ^L040978
         PEA   L040978
         PLA
         STA   $07
         PLA
         STA   $09
         BRA   L0408BC
L04087C  PEA   ^L040988
         PEA   L040988
         PLA
         STA   $07
         PLA
         STA   $09
         BRA   L0408BC
L04088A  PEA   ^L0409AB
         PEA   L0409AB
         PLA
         STA   $07
         PLA
         STA   $09
         BRA   L0408BC
L040898  LDA   $0B
         SEC
         SBC   #$0100
         CMP   #$0006
         BCC   L0408A6
         LDA   #$0006
L0408A6  ASL
         TAX
         LDAL  $0408AE,X
         PHA
         RTS

L0408AE  DA    L040836-1
         DA    L040852-1
         DA    L040844-1
         DA    L040860-1
         DA    L04086E-1
         DA    L04087C-1
         DA    L04088A-1

L0408BC  LDX   $09
         LDA   $07
         PHX
         PHA
         PEA   ^L0409B3
         PEA   L0409B3
         LDA   L027F63
         LDX   L027F63+2
         PHX
         PHA
         JSL   L02C68C
         LDX   #$0000
         TAY
         BPL   L0408DB
         DEX
L0408DB  PHX
         PHA
         PEA   ^L027F67
         PEA   L027F67
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         PEA   $2013
         PEA   ^L027F5F
         PEA   L027F5F
         JSL   L02C243
         LDA   $10
         STA   $05
         LDA   $0E
         STA   $10
         LDA   $0D
         STA   $0F
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         RTL

L040916  ASC   'BAD BIT COMMAND MODIFIER'00
L04092F  ASC   'BAD READ COMMAND MODIFIER'00
L040949  ASC   'UNDEFINED COMMAND'00
L04095B  ASC   'UNASSIGNED CTRL COMMAND CODE'00
L040978  ASC   'DIV/MOD BY ZERO'00
L040988  ASC   'AND/OR COMMAND WITHOUT ADJACENT IF'00
L0409AB  ASC   'UNKNOWN'00
L0409B3  ASC   0D
         ASC   '<<< TEMPLATE ERROR - %s >>>'0D0D00

L0409D2  TSC
         SEC
         SBC   #$000E
         TCS
         PHD
         TCD
         LDX   L027EC9
         LDA   L027EC7
         STX   $09
         STA   $07
L0409E4  LDA   $07
         ORA   $09
         BEQ   L040A1F
         LDY   #$0008
         LDA   [$07],Y
         TAX
         LDY   #$0006
         LDA   [$07],Y
         STX   $0D
         STA   $0B
         PHA
         PHA
         LDX   $09
         LDA   $07
         PHX
         PHA
         _FindHandle
*         STA   L02DD98
         _DisposeHandle
*         STA   L02DD98
         LDA   $0B
         LDX   $0D
         STA   $07
         STX   $09
         BRA   L0409E4
L040A1F  LDA   #$0000
         STA   $05
L040A24  LDA   $05
         ASL
         ASL
         TAX
         LDY   L028732,X
         LDA   L028730,X
         PHY
         PHA
         LDA   #$0000
         TAX
         LDY   #$0001
         CMP   $01,S
         BEQ   L040A3D
         DEY
L040A3D  TXA
         CMP   $03,S
         BEQ   L040A45
         LDY   #$0000
L040A45  PLA
         PLA
         TYA
         EOR   #$0001
         CMP   #$0000
         BEQ   L040A6C
         LDA   #$0010
         LDX   #$0001
         SEC
         SBC   $05
         BEQ   L040A62
         BVS   L040A60
         EOR   #$8000
L040A60  BMI   L040A63
L040A62  DEX
L040A63  TXA
         CMP   #$0000
         BEQ   L040A6C
         LDA   #$0001
L040A6C  TAX
         BEQ   L040A8A
         LDA   $05
         ASL
         ASL
         TAX
         LDY   L028732,X
         LDA   L028730,X
         PHY
         PHA
         _DisposeHandle
*         STA   L02DD98
         INC   $05
         BRA   L040A24
L040A8A  PLD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L040A92  TSC
         SEC
         SBC   #$0010
         TCS
         PHD
         TCD
         LDA   #$0000
         STA   $0D
         STA   $0F
         LDA   #L027F71
         STA   $09
         LDA   #^L027F71
         STA   $0B
L040AAB  LDX   L027EC1
         LDA   L027EBF
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         TAX
         LDA   L02C277,X
         AND   #$00FF
         AND   #$0080
         CMP   #$0000
         BEQ   L040ADD
         PEI   $16
         PEI   $14
         PEI   $0F
         PEI   $0D
         JSL   L02D6DE
         CMP   #$0000
         BEQ   L040ADD
         LDA   #$0001
L040ADD  CMP   #$0000
         BEQ   L040B0A
         LDX   L027EC1
         LDA   L027EBF
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PHA
         LDX   L027ECF
         LDA   L027ECD
         SEC
         SBC   $01,S
         PLX
         TAX
         BEQ   L040B02
         LDA   #$0001
L040B02  CMP   #$0000
         BEQ   L040B0A
         LDA   #$0001
L040B0A  TAX
         BEQ   L040B3D
         PEI   $0B
         PEI   $09
         INC   $09
         BNE   L040B17
         INC   $0B
L040B17  LDX   L027EC1
         LDA   L027EBF
         INC   L027EBF
         BNE   L040B25
         INC   L027EC1
L040B25  STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PLX
         STX   $01
         PLX
         STX   $03
         SEP   #$20
         STA   [$01]
         REP   #$20
         BRL   L040BEE
L040B3D  PEI   $0F
         PEI   $0D
         PEA   $0000
         PEA   $0000
         JSL   L02D6DE
         BEQ   L040BB0
         SEP   #$20
         LDA   #$00
         STA   [$09]
         REP   #$20
         PEA   ^L028270
         PEA   L028270
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   $0D
         STA   [$01]
         LDY   #$0002
         LDA   $0F
         STA   [$01],Y
         LDX   $16
         LDA   $14
         LDY   #$0000
         CMP   $0D
         BNE   L040B79
         CPX   $0F
L040B79  BNE   L040B7C
         INY
L040B7C  TYA
         BNE   L040B87
         PEA   $0000
         PEA   $0002
         BRA   L040B8D
L040B87  PEA   $0000
         PEA   $0000
L040B8D  PEA   ^L028274
         PEA   L028274
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         PEA   ^L027F71
         PEA   L027F71
         PLA
         STA   $05
         PLA
         STA   $07
         BRA   L040BF7
L040BB0  PEA   ^L028270
         PEA   L028270
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   #$0001
         STA   [$01]
         LDY   #$0002
         LDA   #$0000
         STA   [$01],Y
         PEA   ^L028274
         PEA   L028274
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   #$0001
         STA   [$01]
         LDA   #$0000
         STA   [$01],Y
         PEA   $0001
         JSL   L040C0C
         PHX
         STA   $05
         PLA
         STA   $07
         BRA   L040BF7
L040BEE  INC   $0D
         BNE   L040BF4
         INC   $0F
L040BF4  BRL   L040AAB
L040BF7  LDA   $12
         STA   $16
         LDA   $11
         STA   $15
         LDX   $07
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0014
         TCS
         TYA
         RTL

L040C0C  TSC
         SEC
         SBC   #$0010
         TCS
         PHD
         TCD
         PHA
         CLC
         LDA   L027EBF
         STA   $0D
         ADC   $14
         STA   L027EBF
         LDA   L027EC1
         STA   $0F
         ADC   #$0000
         STA   L027EC1
         PLA
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         STX   $0B
         STA   $09
         LDA   $14
         CMP   #$0001
         BNE   L040C56
         PEI   $0B
         LDA   $09
         AND   #$00FF
         PHA
         LDA   $03,S
         AND   #$0000
         STA   $03,S
         PLA
         STA   $09
         PLA
         STA   $0B
         BRA   L040C72
L040C56  LDA   $14
         CMP   #$0002
         BNE   L040C72
         PEI   $0B
         LDA   $09
         AND   #$FFFF
         PHA
         LDA   $03,S
         AND   #$0000
         STA   $03,S
         PLA
         STA   $09
         PLA
         STA   $0B
L040C72  LDA   $09
         LDX   $0B
         STA   $05
         STX   $07
         LDA   $12
         STA   $14
         LDA   $11
         STA   $13
         LDX   $07
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         RTL

L040C8F  TSC
         SEC
         SBC   #$000C
         TCS
         PHD
         TCD
         LDA   #$0000
         STA   $09
         STA   $0B
L040C9E  LDA   [$10]
         AND   #$00FF
         TAX
         LDA   L02C277,X
         AND   #$00FF
         AND   #$0040
         BEQ   L040D1B
         PEI   $0B
         PEI   $09
         PEA   $0000
         PEA   $0004
         JSL   L02DCF2
         PLA
         STA   $09
         PLA
         STA   $0B
         LDA   [$10]
         AND   #$00FF
         LDX   #$0001
         SEC
         SBC   #$0039
         BEQ   L040CD8
         BVS   L040CD6
         EOR   #$8000
L040CD6  BMI   L040CD9
L040CD8  DEX
L040CD9  TXA
         BNE   L040CE7
         LDA   [$10]
         AND   #$00FF
         SEC
         SBC   #$0030
         BRA   L040CF5
L040CE7  LDA   [$10]
         AND   #$00FF
         PHA
         JSL   L02CA2C
         SEC
         SBC   #$0037
L040CF5  LDX   #$0000
         TAY
         BPL   L040CFC
         DEX
L040CFC  PHX
         PHA
         PEI   $0B
         PEI   $09
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         STA   $09
         PLA
         STA   $0B
         INC   $10
         BNE   L040D19
         INC   $12
L040D19  BRA   L040C9E
L040D1B  LDA   $09
         LDX   $0B
         STA   $05
         STX   $07
         LDA   $0E
         STA   $12
         LDA   $0D
         STA   $11
         LDX   $07
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         RTL

L040D38  TSC
         SEC
         SBC   #$000E
         TCS
         PHD
         TCD
         PEA   $0001
         PEA   ^L027F3D
         PEA   L027F3D
         JSL   L026E47
         TAX
         BEQ   L040D73
         PEA   $0000
         LDX   L027EA9
         LDA   L027EA7
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         JSL   L026E47
         LDA   #$FFFF
         STA   $05
         BRL   L041145
L040D73  STZ   L027EC9
         STZ   L027EC7
         PEA   ^L027F3D
         PEA   L027F3D
         PEA   ^L027F07
         PEA   L027F07
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         PEA   ^L028854
         PEA   L028854
         PEA   ^L028075
         PEA   L028075
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         PEA   ^L028854
         PEA   L028854
         PEA   ^L0280BD
         PEA   L0280BD
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         PEA   $2010
         PEA   ^L027F03
         PEA   L027F03
         JSL   L02C243
         PEA   ^L0280B5
         PEA   L0280B5
         LDA   L027F05
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         STZ   L027ED7
         STZ   L027ED5
         LDA   #$0000
         STA   $0B
L040DED  LDA   $0B
         BMI   L040DF9
         CMP   #$0010
         BCC   L040DF9
         BRL   L0410D4
L040DF9  LDA   $0B
         ASL
         ASL
         CLC
         ADC   #L028730
         PEA   ^L028730
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         LDY   #$0002
         STA   [$01],Y
         LDA   #$0020
         STA   L028854
         PEA   $201C
         PEA   ^L0280B3
         PEA   L0280B3
         JSL   L02C243
         JSL   L02CA27
         STA   $0D
         TAX
         BEQ   L040E3E
         LDA   $0D
         CMP   #$0061
         BNE   L040E3B
         LDA   #$0000
         STA   $0D
L040E3B  BRL   L0410D4
L040E3E  LDA   L0280C3
         LDX   #$0000
         CMP   #$00B0
         BNE   L040E4A
         INX
L040E4A  TXA
         CMP   #$0000
         BEQ   L040E88
         LDA   L0280DF
         LDX   L0280E1
         PHX
         PHA
         LDX   L027EA9
         LDA   L027EA7
         STA   $01
         STX   $03
         LDY   #$000A
         LDA   [$01],Y
         TAX
         LDY   #$0008
         LDA   [$01],Y
         LDY   #$0001
         CMP   $01,S
         BEQ   L040E75
         DEY
L040E75  TXA
         CMP   $03,S
         BEQ   L040E7D
         LDY   #$0000
L040E7D  PLA
         PLA
         TYA
         CMP   #$0000
         BEQ   L040E88
         LDA   #$0001
L040E88  TAX
         BNE   L040E8E
         BRL   L0410D1
L040E8E  PEA   ^L028854
         PEA   L028854
         LDA   L028856
         INC
         INC
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         LDA   #$3A35
         STA   L028856
         PEA   $2010
         PEA   ^L028071
         PEA   L028071
         JSL   L02C243
         LDA   #$0004
         STA   L027ED9
         PEA   ^L027EDB
         PEA   L027EDB
         LDA   L028073
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PHA
         PHA
         LDA   L02809B
         LDX   L02809D
         PHX
         PHA
         LDX   L027EA9
         LDA   L027EA7
         STA   $01
         STX   $03
         LDY   #$0006
         LDA   [$01],Y
         PHA
         PEA   $C018
         PEA   $0000
         PEA   $0000
         _NewHandle
*         STA   L02DD98
         LDA   $0B
         ASL
         ASL
         CLC
         ADC   #L028730
         PEA   ^L028730
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         JSL   L02CA27
         STA   $0D
         LDA   $0D
         BEQ   L040F1E
         BRL   L0410CF
L040F1E  LDA   $0B
         ASL
         ASL
         TAX
         LDY   L028732,X
         LDA   L028730,X
         PHY
         PHA
         _HLock
*         STA   L02DD98
         LDA   $0B
         ASL
         ASL
         TAX
         LDY   L028732,X
         LDA   L028730,X
         TYX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         PEA   ^L027EDD
         PEA   L027EDD
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         LDA   L02809B
         LDX   L02809D
         PHX
         PHA
         PEA   ^L027EE1
         PEA   L027EE1
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         PEA   $2012
         PEA   ^L027ED9
         PEA   L027ED9
         JSL   L02C243
         LDA   #$0001
         STA   L027ED9
         PEA   $2014
         PEA   ^L027ED9
         PEA   L027ED9
         JSL   L02C243
         LDA   L027EDD
         LDX   L027EDF
         STX   L027EC5
         STA   L027EC3
         LDA   L02809B
         LDX   L02809D
         PHX
         PHA
         LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         STA   $07
         PLA
         STA   $09
L040FC7  LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         JSL   L0421B5
         PHX
         STA   L027EC3
         PLA
         STA   L027EC5
         LDA   L027EB3
         CMP   #$001C
         BNE   L041036
         LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         PEA   $0001
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDX   L027ED3
         LDA   L027ED1
         PHA
         JSL   L02ACFE
         LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         LDX   L027ED3
         LDA   L027ED1
         PHA
         LDX   L027EC9
         LDA   L027EC7
         PHX
         PHA
         JSL   L040768
         PHX
         STA   L027EC7
         PLA
         STA   L027EC9
         BRA   L04108D
L041036  LDA   L027EB3
         CMP   #$0028
         BNE   L04104C
         LDX   L027EC5
         LDA   L027EC3
         STX   L027ED7
         STA   L027ED5
         BRA   L04108D
L04104C  LDA   L027EB3
         LDX   #$0000
         CMP   #$0026
         BNE   L041058
         INX
L041058  TXA
         CMP   #$0000
         BEQ   L041063
         LDA   #$0001
         BRA   L041078
L041063  LDA   L027EB3
         LDX   #$0000
         CMP   #$001E
         BNE   L04106F
         INX
L04106F  TXA
         CMP   #$0000
         BEQ   L041078
         LDA   #$0001
L041078  TAX
         BEQ   L04108D
         LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         JSL   L0421B5
         STX   L027EC5
         STA   L027EC3
L04108D  LDX   L027EC5
         LDA   L027EC3
         STX   $01
         ORA   $01
         BEQ   L0410C6
         LDA   L027EC3
         PHX
         PHA
         LDX   $09
         LDA   $07
         TAY
         TXA
         LDX   #$0001
         CMP   $03,S
         BNE   L0410AE
         TYA
         CMP   $01,S
L0410AE  BEQ   L0410B2
         BCS   L0410B3
L0410B2  DEX
L0410B3  PLA
         PLA
         TXA
         LDX   #$0000
         TAY
         BPL   L0410BD
         DEX
L0410BD  STX   $01
         ORA   $01
         BEQ   L0410C6
         LDA   #$0001
L0410C6  BEQ   L0410CB
         BRL   L040FC7
L0410CB  INC   $0B
         BRA   L0410D1
L0410CF  BRA   L0410D4
L0410D1  BRL   L040DED
L0410D4  LDA   #$0001
         STA   L027ED9
         PEA   ^L027EDB
         PEA   L027EDB
         LDA   L0280B5
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PEA   $2014
         PEA   ^L027ED9
         PEA   L027ED9
         JSL   L02C243
         LDY   #$0000
         LDA   L027EC7
         ORA   L027EC9
         BNE   L041104
         INY
L041104  TYA
         CMP   #$0000
         BEQ   L04111E
         LDA   $0D
         LDX   #$0000
         CMP   #$0000
         BNE   L041115
         INX
L041115  TXA
         CMP   #$0000
         BEQ   L04111E
         LDA   #$0001
L04111E  TAX
         BEQ   L041126
         LDA   #$0046
         STA   $0D
L041126  PEA   $0000
         LDX   L027EA9
         LDA   L027EA7
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         JSL   L026E47
         LDA   $0D
         STA   $05
L041145  LDY   $05
         PLD
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         RTL

L041150  TSC
         SEC
         SBC   #$0011
         TCS
         PHD
         TCD
         LDA   #L02812B
         STA   $0A
         LDA   #^L02812B
         STA   $0C
         PEA   ^L028230
         PEA   L028230
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         LDY   #$0002
         STA   [$01],Y
L041178  PEI   $17
         PEI   $15
         INC   $15
         BNE   L041182
         INC   $17
L041182  PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         SEP   #$20
         STA   $09
         REP   #$20
         CMP   #$000D
         BNE   L04119B
         BRL   L04134E
L04119B  LDA   $09
         AND   #$00FF
         BIT   #$0080
         BEQ   L0411A8
         ORA   #$FF00
L0411A8  CMP   #$0000
         CMP   #$0025
         BNE   L0411D6
         PEA   ^L028230
         PEA   L028230
         PLA
         STA   $0E
         PLA
         STA   $10
         LDY   #$0002
         LDA   [$0E],Y
         PHA
         LDA   [$0E]
         CLC
         ADC   #$0001
         PHA
         LDA   $01,S
         STA   [$0E]
         LDA   $03,S
         STA   [$0E],Y
         PLA
         PLA
         BRL   L041325
L0411D6  LDA   $09
         AND   #$00FF
         BIT   #$0080
         BEQ   L0411E3
         ORA   #$FF00
L0411E3  CMP   #$0000
         CMP   #$005C
         BEQ   L0411EE
         BRL   L041325
L0411EE  PEI   $17
         PEI   $15
         INC   $15
         BNE   L0411F8
         INC   $17
L0411F8  PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PHA
         JSL   L02CA0D
         SEP   #$20
         STA   $09
         REP   #$20
         LDX   #$0000
         CMP   #$006E
         BNE   L041217
         INX
L041217  TXA
         CMP   #$0000
         BEQ   L041222
         LDA   #$0001
         BRA   L041244
L041222  LDA   $09
         AND   #$00FF
         BIT   #$0080
         BEQ   L04122F
         ORA   #$FF00
L04122F  CMP   #$0000
         LDX   #$0000
         CMP   #$0072
         BNE   L04123B
         INX
L04123B  TXA
         CMP   #$0000
         BEQ   L041244
         LDA   #$0001
L041244  TAX
         BEQ   L041253
         LDA   #$000D
         SEP   #$20
         STA   $09
         REP   #$20
         BRL   L041325
L041253  LDA   $09
         AND   #$00FF
         BIT   #$0080
         BEQ   L041260
         ORA   #$FF00
L041260  CMP   #$0000
         CMP   #$0074
         BNE   L041274
         LDA   #$0009
         SEP   #$20
         STA   $09
         REP   #$20
         BRL   L041325
L041274  LDA   $09
         AND   #$00FF
         BIT   #$0080
         BEQ   L041281
         ORA   #$FF00
L041281  CMP   #$0000
         CMP   #$0078
         BEQ   L04128C
         BRL   L041325
L04128C  LDA   [$15]
         AND   #$00FF
         LDX   #$0001
         SEC
         SBC   #$0039
         BEQ   L0412A1
         BVS   L04129F
         EOR   #$8000
L04129F  BMI   L0412A2
L0412A1  DEX
L0412A2  TXA
         BNE   L0412B4
         LDA   [$15]
         AND   #$00FF
         SEC
         SBC   #$0030
         ASL
         ASL
         ASL
         ASL
         BRA   L0412C6
L0412B4  LDA   [$15]
         AND   #$00FF
         PHA
         JSL   L02CA2C
         SEC
         SBC   #$0037
         ASL
         ASL
         ASL
         ASL
L0412C6  SEP   #$20
         STA   $09
         REP   #$20
         INC   $15
         BNE   L0412D2
         INC   $17
L0412D2  LDA   $09
         AND   #$00FF
         BIT   #$0080
         BEQ   L0412DF
         ORA   #$FF00
L0412DF  CMP   #$0000
         PHA
         LDA   [$15]
         AND   #$00FF
         LDX   #$0001
         SEC
         SBC   #$0039
         BEQ   L0412F8
         BVS   L0412F6
         EOR   #$8000
L0412F6  BMI   L0412F9
L0412F8  DEX
L0412F9  TXA
         BNE   L041307
         LDA   [$15]
         AND   #$00FF
         SEC
         SBC   #$0030
         BRA   L041315
L041307  LDA   [$15]
         AND   #$00FF
         PHA
         JSL   L02CA2C
         SEC
         SBC   #$0037
L041315  CLC
         ADC   $01,S
         PLX
         SEP   #$20
         STA   $09
         REP   #$20
         INC   $15
         BNE   L041325
         INC   $17
L041325  PEI   $0C
         PEI   $0A
         INC   $0A
         BNE   L04132F
         INC   $0C
L04132F  PLA
         PLX
         STA   $01
         STX   $03
         LDA   $09
         AND   #$00FF
         BIT   #$0080
         BEQ   L041342
         ORA   #$FF00
L041342  CMP   #$0000
         SEP   #$20
         STA   [$01]
         REP   #$20
         BRL   L041178
L04134E  SEP   #$20
         LDA   #$00
         STA   [$0A]
         REP   #$20
         LDA   L028230
         BEQ   L041369
         ASL
         ASL
         TAX
         INX
         INX
L041360  LDA   L028230,X
         PHA
         DEX
         DEX
         CPX   #$0002
L041369  BNE   L041360
         PEA   ^L02812B
         PEA   L02812B
         LDA   L027F63
         LDX   L027F63+2
         PHX
         PHA
         JSL   L02C68C
         LDX   #$0000
         TAY
         BPL   L041384
         DEX
L041384  PHX
         PHA
         PEA   ^L027F67
         PEA   L027F67
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         LDA   L027F63
         LDX   L027F63+2
         STX   $0C
         STA   $0A
L0413A5  LDA   [$0A]
         AND   #$00FF
         BEQ   L041418
         LDA   $0A
         LDX   $0C
         STA   $0E
         STX   $10
         PEI   $10
         PEI   $0E
         LDA   [$0E]
         AND   #$00FF
         PHA
         LDA   L027EB0
         AND   #$00FF
         BIT   #$0080
         BEQ   L0413CC
         ORA   #$FF00
L0413CC  CMP   #$0000
         ORA   $01,S
         PLX
         PLX
         STX   $01
         PLX
         STX   $03
         SEP   #$20
         STA   [$01]
         REP   #$20
         LDA   $0A
         LDX   $0C
         STA   $0E
         STX   $10
         PEI   $10
         PEI   $0E
         LDA   [$0E]
         AND   #$00FF
         PHA
         LDA   L027EAF
         AND   #$00FF
         BIT   #$0080
         BEQ   L0413FE
         ORA   #$FF00
L0413FE  CMP   #$0000
         AND   $01,S
         PLX
         PLX
         STX   $01
         PLX
         STX   $03
         SEP   #$20
         STA   [$01]
         REP   #$20
         INC   $0A
         BNE   L041416
         INC   $0C
L041416  BRA   L0413A5
L041418  PEA   $2013
         PEA   ^L027F5F
         PEA   L027F5F
         JSL   L02C243
         LDA   $15
         LDX   $17
         STA   $05
         STX   $07
         LDA   $13
         STA   $17
         LDA   $12
         STA   $16
         LDX   $07
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0015
         TCS
         TYA
         RTL

L041442  TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         TCD
L04144A  LDA   L027EC3
         ORA   L027EC5
         BNE   L041455
         BRL   L0421AD
L041455  LDA   L027EB9
         BNE   L041487
         LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         PEA   $0007
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L02ACFE
         STA   L027EB9
L041487  LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         JSL   L0421B5
         STX   L027EC5
         STA   L027EC3
         LDA   L027EB3
         STA   $13
L04149E  BRL   L042146
L0414A1  BRL   L0421AA
L0414A4  LDA   L027EAB
         BNE   L0414E1
         PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $15
         PLA
         STA   $17
         LDY   #$0002
         LDA   [$15],Y
         PHA
         LDA   [$15]
         PHA
         LDX   L027ED3
         LDA   L027ED1
         PHX
         AND   $03,S
         STA   $03,S
         PLA
         AND   $03,S
         STA   $03,S
         PLA
         STA   [$15]
         PLA
         STA   [$15],Y
         BRL   L041667
L0414E1  LDA   L027EAB
         CMP   #$0017
         BNE   L04154D
         PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $15
         PLA
         STA   $17
         LDY   #$0002
         LDA   [$15],Y
         PHA
         LDA   [$15]
         PHA
         LDX   L027ED3
         LDA   L027ED1
         PHX
         ORA   $03,S
         STA   $03,S
         PLA
         ORA   $03,S
         STA   $03,S
         PLA
         STA   [$15]
         PLA
         STA   [$15],Y
         PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $15
         PLA
         STA   $17
         LDA   [$15],Y
         PHA
         LDA   [$15]
         EOR   #$FFFF
         PHA
         LDA   $03,S
         EOR   #$FFFF
         STA   $03,S
         PLA
         STA   [$15]
         PLA
         STA   [$15],Y
         BRL   L041667
L04154D  LDA   L027EAB
         CMP   #$0019
         BNE   L04158D
         PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $15
         PLA
         STA   $17
         LDY   #$0002
         LDA   [$15],Y
         PHA
         LDA   [$15]
         PHA
         LDX   L027ED3
         LDA   L027ED1
         PHX
         ORA   $03,S
         STA   $03,S
         PLA
         ORA   $03,S
         STA   $03,S
         PLA
         STA   [$15]
         PLA
         STA   [$15],Y
         BRL   L041667
L04158D  LDA   L027EAB
         CMP   #$001F
         BNE   L0415CD
         PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $15
         PLA
         STA   $17
         LDY   #$0002
         LDA   [$15],Y
         PHA
         LDA   [$15]
         PHA
         LDX   L027ED3
         LDA   L027ED1
         PHX
         EOR   $03,S
         STA   $03,S
         PLA
         EOR   $03,S
         STA   $03,S
         PLA
         STA   [$15]
         PLA
         STA   [$15],Y
         BRL   L041667
L0415CD  LDA   L027EAB
         CMP   #$0024
         BNE   L041615
         PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $15
         PLA
         STA   $17
         LDY   #$0002
         LDA   [$15],Y
         PHA
         LDA   [$15]
         PHA
         LDX   L027ED3
         LDA   L027ED1
         PHX
         AND   #$001F
         PHA
         LDA   $03,S
         AND   #$0000
         STA   $03,S
         JSL   L02DCF2
         PLA
         STA   [$15]
         LDY   #$0002
         PLA
         STA   [$15],Y
         BRA   L041667
L041615  LDA   L027EAB
         CMP   #$0025
         BNE   L04165D
         PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $15
         PLA
         STA   $17
         LDY   #$0002
         LDA   [$15],Y
         PHA
         LDA   [$15]
         PHA
         LDX   L027ED3
         LDA   L027ED1
         PHX
         AND   #$001F
         PHA
         LDA   $03,S
         AND   #$0000
         STA   $03,S
         JSL   L02CA46
         PLA
         STA   [$15]
         LDY   #$0002
         PLA
         STA   [$15],Y
         BRA   L041667
L04165D  PEA   $0100
         JSL   L040828
         STA   L027EB9
L041667  BRL   L0421AA
L04166A  LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         PHY
         STA   L027EC3
         PLA
         STA   L027EC5
         BRL   L0421AA
L041681  LDX   L027ED3
         LDA   L027ED1
         STA   $19
         BRL   L041956
L04168C  LDA   #$0080
         SEP   #$20
         STA   L027EB0
         REP   #$20
         LDA   #$00FF
         SEP   #$20
         STA   L027EAF
         REP   #$20
         LDX   L027ED3
         LDA   L027ED1
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRL   L04197B
L0416C5  LDA   #$0000
         SEP   #$20
         STA   L027EB0
         REP   #$20
         LDA   #$007F
         SEP   #$20
         STA   L027EAF
         REP   #$20
         LDX   L027ED3
         LDA   L027ED1
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRL   L04197B
L0416FE  LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         PHY
         PHA
         LDA   #$0000
         TAX
         LDY   #$0001
         CMP   $01,S
         BEQ   L041718
         DEY
L041718  TXA
         CMP   $03,S
         BEQ   L041720
         LDY   #$0000
L041720  PLA
         PLA
         TYA
         BEQ   L041728
         BRL   L0421AD
L041728  BRL   L04197B
L04172B  LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         PHY
         PHA
         LDA   #$0000
         TAX
         LDY   #$0001
         CMP   $01,S
         BEQ   L041745
         DEY
L041745  TXA
         CMP   $03,S
         BEQ   L04174D
         LDY   #$0000
L04174D  PLA
         PLA
         TYA
         BNE   L041755
         BRL   L0421AD
L041755  BRL   L04197B
L041758  PEA   ^L028274
         PEA   L028274
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   #$0001
         STA   [$01]
         LDY   #$0002
         LDA   #$0000
         STA   [$01],Y
         LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         PHY
         PHA
         PEA   $0000
         PEA   $001F
         JSL   L02D6DE
         CMP   #$0000
         BEQ   L0417AE
         PEA   $0000
         PEA   $007F
         LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         PHY
         PHA
         JSL   L02D6DE
         CMP   #$0000
         BEQ   L0417AE
         LDA   #$0001
L0417AE  CMP   #$0000
         BEQ   L0417D7
         LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         TYX
         LDY   #$0000
         CMP   L027ECD
         BNE   L0417CB
         CPX   L027ECF
L0417CB  BEQ   L0417CE
         INY
L0417CE  TYA
         CMP   #$0000
         BEQ   L0417D7
         LDA   #$0001
L0417D7  TAX
         BEQ   L041829
         PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PEA   ^L02822B
         PEA   L02822B
         JSL   L02C78E
         PHX
         PLA
         PEA   ^L02822B
         PEA   L02822B
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         PEA   ^L028274
         PEA   L028274
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         STA   [$01],Y
L041829  BRL   L04197B
L04182C  PEA   $0000
         PEA   $0020
         LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         PHY
         PHA
         JSL   L02D6DE
         CMP   #$0000
         BEQ   L04184E
         LDA   #$0001
         BRA   L04186E
L04184E  LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         PHY
         PHA
         PEA   $0000
         PEA   $007F
         JSL   L02D6DE
         CMP   #$0000
         BEQ   L04186E
         LDA   #$0001
L04186E  TAX
         BEQ   L041893
         LDX   L027EB7
         LDA   L027EB5
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
L041893  PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PEA   ^L02822B
         PEA   L02822B
         JSL   L02C78E
         PHX
         PLA
         PEA   ^L02822B
         PEA   L02822B
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRL   L04197B
L0418D2  LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         PHY
         PHA
         PEA   $0000
         PEA   $001F
         JSL   L02D6DE
         BEQ   L04190C
         LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         PHY
         AND   #$007F
         PHA
         LDA   $03,S
         AND   #$0000
         STA   $03,S
         PLA
         STA   L027ECD
         PLA
         STA   L027ECF
L04190C  BRA   L04197B
L04190E  LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         PHY
         PHA
         PEA   $0000
         PEA   $001F
         JSL   L02D6DE
         BEQ   L041948
         LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         PHY
         AND   #$007F
         PHA
         LDA   $03,S
         AND   #$0000
         STA   $03,S
         PLA
         STA   L027EB5
         PLA
         STA   L027EB7
L041948  BRA   L04197B
L04194A  PEA   $0103
         JSL   L040828
         STA   L027EB9
         BRA   L04197B
L041956  LDA   $19
         DEC
         CMP   #$0008
         BCC   L041961
         LDA   #$0008
L041961  ASL
         TAX
         LDAL  L041969,X
         PHA
         RTS

L041969  DA    L04168C-1
         DA    L0416C5-1
         DA    L0416FE-1
         DA    L04172B-1
         DA    L041758-1
         DA    L04182C-1
         DA    L0418D2-1
         DA    L04190E-1
         DA    L04194A-1

L04197B  BRL   L0421AA
L04197E  PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $15
         PLA
         STA   $17
         LDX   L027ED3
         LDA   L027ED1
         PHX
         PHA
         LDY   #$0002
         LDA   [$15],Y
         PHA
         LDA   [$15]
         PHA
         SEC
         PLA
         SBC   $03,S
         STA   $03,S
         PLA
         SBC   $03,S
         STA   $03,S
         PLA
         STA   [$15]
         PLA
         STA   [$15],Y
         BRL   L0421AA
L0419B9  LDY   #$0000
         LDA   L027ED1
         ORA   L027ED3
         BNE   L0419C5
         INY
L0419C5  TYA
         CMP   #$0000
         BEQ   L0419D0
         LDA   #$0001
         BRA   L0419ED
L0419D0  LDA   L028264
         LDX   L028266
         LDY   #$0000
         CMP   L027ED1
         BNE   L0419E1
         CPX   L027ED3
L0419E1  BNE   L0419E4
         INY
L0419E4  TYA
         CMP   #$0000
         BEQ   L0419ED
         LDA   #$0001
L0419ED  TAX
         BEQ   L0419F3
L0419F0  BRL   L0421AD
L0419F3  LDA   L027EB3
         CMP   #$0009
         BEQ   L041A11
         LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         JSL   L0421B5
         PHX
         STA   L027EC3
         PLA
         STA   L027EC5
L041A0F  BRA   L0419F3
L041A11  BRL   L0421AA
L041A14  LDA   #$0001
         STA   L027EAD
L041A1A  LDX   L027EC5
         LDA   L027EC3
         STX   $11
         STA   $0F
         LDA   #$0000
         STA   $05
         LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         TYX
         STX   $0D
         STA   $0B
         LDA   L027EB3
         CMP   #$0019
         BNE   L041A54
         LDA   L027EAD
         BNE   L041A4F
         LDA   #$0001
         STA   L027EAD
         BRA   L041A54
L041A4F  LDA   #$0001
         STA   $05
L041A54  LDA   $05
         LDX   #$0000
         CMP   #$0000
         BNE   L041A5F
         INX
L041A5F  TXA
         CMP   #$0000
         BNE   L041A68
         BRL   L041BCA
L041A68  LDA   L027EAB
         LDX   #$0000
         CMP   #$000A
         BNE   L041A74
         INX
L041A74  TXA
         CMP   #$0000
         BEQ   L041A95
         LDX   L027ED3
         LDA   L027ED1
         LDY   #$0000
         CMP   $0B
         BNE   L041A89
         CPX   $0D
L041A89  BEQ   L041A8C
         INY
L041A8C  TYA
         CMP   #$0000
         BEQ   L041A95
         LDA   #$0001
L041A95  CMP   #$0000
         BEQ   L041A9F
         LDA   #$0001
         BRA   L041AD1
L041A9F  LDA   L027EAB
         LDX   #$0000
         CMP   #$000B
         BNE   L041AAB
         INX
L041AAB  TXA
         CMP   #$0000
         BEQ   L041AC9
         LDX   L027ED3
         LDA   L027ED1
         PHX
         PHA
         PEI   $0D
         PEI   $0B
         JSL   L02D6DE
         CMP   #$0000
         BEQ   L041AC9
         LDA   #$0001
L041AC9  CMP   #$0000
         BEQ   L041AD1
         LDA   #$0001
L041AD1  CMP   #$0000
         BEQ   L041ADB
         LDA   #$0001
         BRA   L041B0D
L041ADB  LDA   L027EAB
         LDX   #$0000
         CMP   #$000D
         BNE   L041AE7
         INX
L041AE7  TXA
         CMP   #$0000
         BEQ   L041B05
         LDX   L027ED3
         LDA   L027ED1
         PHX
         PHA
         LDX   $0D
         LDA   $0B
         JSL   L02D6AD
         CMP   #$0000
         BEQ   L041B05
         LDA   #$0001
L041B05  CMP   #$0000
         BEQ   L041B0D
         LDA   #$0001
L041B0D  CMP   #$0000
         BEQ   L041B17
         LDA   #$0001
         BRA   L041B49
L041B17  LDA   L027EAB
         LDX   #$0000
         CMP   #$0010
         BNE   L041B23
         INX
L041B23  TXA
         CMP   #$0000
         BEQ   L041B41
         PEI   $0D
         PEI   $0B
         LDX   L027ED3
         LDA   L027ED1
         PHX
         PHA
         JSL   L02D6DE
         CMP   #$0000
         BEQ   L041B41
         LDA   #$0001
L041B41  CMP   #$0000
         BEQ   L041B49
         LDA   #$0001
L041B49  CMP   #$0000
         BEQ   L041B53
         LDA   #$0001
         BRA   L041B83
L041B53  LDA   L027EAB
         LDX   #$0000
         CMP   #$0014
         BNE   L041B5F
         INX
L041B5F  TXA
         CMP   #$0000
         BEQ   L041B7B
         PEI   $0D
         PEI   $0B
         LDX   L027ED3
         LDA   L027ED1
         JSL   L02D6AD
         CMP   #$0000
         BEQ   L041B7B
         LDA   #$0001
L041B7B  CMP   #$0000
         BEQ   L041B83
         LDA   #$0001
L041B83  CMP   #$0000
         BEQ   L041B8D
         LDA   #$0001
         BRA   L041BC2
L041B8D  LDA   L027EAB
         LDX   #$0000
         CMP   #$0016
         BNE   L041B99
         INX
L041B99  TXA
         CMP   #$0000
         BEQ   L041BBA
         LDX   L027ED3
         LDA   L027ED1
         LDY   #$0000
         CMP   $0B
         BNE   L041BAE
         CPX   $0D
L041BAE  BNE   L041BB1
         INY
L041BB1  TYA
         CMP   #$0000
         BEQ   L041BBA
         LDA   #$0001
L041BBA  CMP   #$0000
         BEQ   L041BC2
         LDA   #$0001
L041BC2  CMP   #$0000
         BEQ   L041BCA
         LDA   #$0001
L041BCA  TAX
         BEQ   L041BD3
         LDA   #$0000
         STA   L027EAD
L041BD3  LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         JSL   L0421B5
         STX   L027EC5
         STA   L027EC3
         LDA   L027EB3
         LDX   #$0000
         CMP   #$0000
         BNE   L041BF1
         INX
L041BF1  TXA
         CMP   #$0000
         BEQ   L041BFC
         LDA   #$0001
         BRA   L041C11
L041BFC  LDA   L027EB3
         LDX   #$0000
         CMP   #$0019
         BNE   L041C08
         INX
L041C08  TXA
         CMP   #$0000
         BEQ   L041C11
         LDA   #$0001
L041C11  BEQ   L041C16
         BRL   L041A1A
L041C16  LDA   L027EAD
         BNE   L041C5B
L041C1B  LDA   L027EB3
         LDX   #$0000
         CMP   #$0009
         BEQ   L041C27
         INX
L041C27  TXA
         CMP   #$0000
         BEQ   L041C42
         LDA   L027EB3
         LDX   #$0000
         CMP   #$0008
         BEQ   L041C39
         INX
L041C39  TXA
         CMP   #$0000
         BEQ   L041C42
         LDA   #$0001
L041C42  TAX
         BEQ   L041C59
         LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         JSL   L0421B5
         STX   L027EC5
         STA   L027EC3
         BRA   L041C1B
L041C59  BRA   L041C65
L041C5B  LDX   $11
         LDA   $0F
         STX   L027EC5
         STA   L027EC3
L041C65  BRL   L0421AA
L041C68  PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $15
         PLA
         STA   $17
         LDX   L027ED3
         LDA   L027ED1
         PHX
         PHA
         LDY   #$0002
         LDA   [$15],Y
         PHA
         LDA   [$15]
         PHA
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         STA   [$15]
         PLA
         STA   [$15],Y
         BRL   L0421AA
L041CA3  LDX   L027ED3
         LDA   L027ED1
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L02DCF2
         PEA   ^L028230
         PEA   L028230
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         BRL   L0421AA
L041CEF  LDX   L027ED3
         LDA   L027ED1
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRL   L0421AA
L041D14  LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRL   L0421AA
L041D39  LDA   L027ED1
         ORA   L027ED3
         BNE   L041D76
         PEA   $005F
         LDA   L028268
         LDX   L02826A
         PHX
         PHA
         LDA   L028264
         LDX   L028266
         PHA
         JSL   L025A27
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRL   L041DF7
L041D76  LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         PHY
         PHA
         LDA   #$0000
         TAX
         LDY   #$0001
         CMP   $01,S
         BEQ   L041D90
         DEY
L041D90  TXA
         CMP   $03,S
         BEQ   L041D98
         LDY   #$0000
L041D98  PLA
         PLA
         TYA
         BEQ   L041DBF
         PEA   ^L0280B1
         PEA   L0280B1
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRA   L041DF7
L041DBF  PEA   $005F
         LDA   L027EB1
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         PHY
         PHA
         LDX   L027ED3
         LDA   L027ED1
         PHA
         JSL   L025A27
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
L041DF7  BRL   L0421AA
L041DFA  LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         LDA   #$0001
         STA   $07
L041E21  LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         LDA   $07
         INC   $07
         LDX   #$0000
         TAY
         BPL   L041E34
         DEX
L041E34  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         CMP   #$000D
         BNE   L041E21
         LDX   L027EC5
         LDA   L027EC3
         PHX
         PLX
         STA   $01
         STX   $03
         LDA   $07
         DEC
         DEC
         SEP   #$20
         STA   [$01]
         REP   #$20
         LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         LDA   $07
         LDX   #$0000
         TAY
         BPL   L041E75
         DEX
L041E75  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         STA   L027EC3
         PLA
         STA   L027EC5
         BRL   L0421AA
L041E8A  LDA   L027EAB
         CMP   #$0002
         BNE   L041EB8
         PEA   $0001
         JSL   L040C0C
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRL   L041FEF
L041EB8  LDA   L027EAB
         CMP   #$0004
         BNE   L041EF1
         LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         JSL   L02C7C2
         PHX
         PHA
         JSL   L040A92
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRL   L041FEF
L041EF1  LDA   L027EAB
         CMP   #$000C
         BNE   L041F25
         PEA   $0002
         JSL   L040C0C
         PHX
         PHA
         JSL   L040A92
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRL   L041FEF
L041F25  LDA   L027EAB
         CMP   #$0012
         BNE   L041F53
         PEA   $0004
         JSL   L040C0C
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRL   L041FEF
L041F53  LDA   L027EAB
         CMP   #$0018
         BNE   L041F85
         LDX   L027ED3
         LDA   L027ED1
         PHX
         PHA
         JSL   L040A92
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRA   L041FEF
L041F85  LDA   L027EAB
         CMP   #$001A
         BNE   L041FB8
         PEA   $0001
         JSL   L040C0C
         PHX
         PHA
         JSL   L040A92
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRA   L041FEF
L041FB8  LDA   L027EAB
         CMP   #$001D
         BNE   L041FE5
         PEA   $0002
         JSL   L040C0C
         PHX
         PHA
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   #L028230
         PEA   ^L028230
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRA   L041FEF
L041FE5  PEA   $0102
         JSL   L040828
         STA   L027EB9
L041FEF  LDX   L027EC1
         LDA   L027EBF
         PHX
         PHA
         PEA   ^L028230
         PEA   L028230
         PEA   $0008
         LDA   L02826C
         LDX   L02826E
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L02ACFE
L04201D  BRL   L0421AA
L042020  BRL   L0421AA
L042023  LDX   L027EC5
         LDA   L027EC3
         PHX
         PHA
         JSL   L041150
         PHX
         STA   L027EC3
         PLA
         STA   L027EC5
         BRL   L0421AA
L04203A  PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $15
         PLA
         STA   $17
         LDY   #$0002
         LDA   [$15],Y
         PHA
         LDA   [$15]
         PHA
         LDX   L027ED3
         LDA   L027ED1
         PHX
         PHA
         JSL   L02DBC3
         PLA
         STA   [$15]
         LDY   #$0002
         PLA
         STA   [$15],Y
         BRL   L0421AA
L042071  PEA   ^L028274
         PEA   L028274
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         LDY   #$0002
         STA   [$01],Y
         LDA   L027ED1
         ORA   L027ED3
         BEQ   L0420C2
         PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $15
         PLA
         STA   $17
         LDA   [$15],Y
         PHA
         LDA   [$15]
         PHA
         LDX   L027ED3
         LDA   L027ED1
         PHX
         PHA
         JSL   L02DC66
         PLA
         STA   [$15]
         LDY   #$0002
         PLA
         STA   [$15],Y
         BRA   L0420CC
L0420C2  PEA   $0104
         JSL   L040828
         STA   L027EB9
L0420CC  BRL   L0421AA
L0420CF  PEA   ^L028274
         PEA   L028274
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         LDY   #$0002
         STA   [$01],Y
         LDA   L027ED1
         ORA   L027ED3
         BEQ   L042122
         PEA   ^L028230
         PEA   L028230
         LDA   L027EB1
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $15
         PLA
         STA   $17
         LDA   [$15],Y
         PHA
         LDA   [$15]
         PHA
         LDX   L027ED3
         LDA   L027ED1
         PHX
         PHA
         JSL   L02DB10
         PLY
         PLY
         PLA
         STA   [$15]
         LDY   #$0002
         PLA
         STA   [$15],Y
         BRA   L04212C
L042122  PEA   $0104
         JSL   L040828
         STA   L027EB9
L04212C  BRA   L0421AA
L04212E  PEA   $0105
         JSL   L040828
         STA   L027EB9
         BRA   L0421AA
L04213A  PEA   $0101
         JSL   L040828
         STA   L027EB9
         BRA   L0421AA
L042146  LDA   $13
         CMP   #$0028
         BCC   L042150
         LDA   #$0028
L042150  ASL
         TAX
         LDAL  L042158,X
         PHA
         RTS

L042158  DA    L04212E-1
         DA    L0414A4-1
         DA    L04213A-1
         DA    L04166A-1
         DA    L04213A-1
         DA    L041681-1
         DA    L04197E-1
         DA    L0419B9-1
         DA    L0419F3-1
         DA    L041A11-1
         DA    L04213A-1
         DA    L04213A-1
         DA    L04213A-1
         DA    L04213A-1
         DA    L041A14-1
         DA    L041C68-1
         DA    L04213A-1
         DA    L041CEF-1
         DA    L04213A-1
         DA    L041D14-1
         DA    L04213A-1
         DA    L041D39-1
         DA    L04213A-1
         DA    L04213A-1
         DA    L04213A-1
         DA    L04212E-1
         DA    L04213A-1
         DA    L041E8A-1
         DA    L042020-1
         DA    L04213A-1
         DA    L042023-1
         DA    L04213A-1
         DA    L0414A1-1
         DA    L04203A-1
         DA    L042071-1
         DA    L0420CF-1
         DA    L04213A-1
         DA    L04213A-1
         DA    L041DFA-1
         DA    L041CA3-1
         DA    L04213A-1

L0421AA  BRL   L04144A
L0421AD  PLD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L0421B5  TSC
         SEC
         SBC   #$0012
         TCS
         PHD
         TCD
         LDA   #$0001
         STA   $0F
         LDA   #$0000
         STA   $11
         STA   $0D
         STA   $0B
         STA   $09
L0421CD  PEI   $18
         PEI   $16
         LDA   $09
         LDX   #$0000
         TAY
         BPL   L0421DA
         DEX
L0421DA  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         LDX   #$0000
         CMP   #$000D
         BNE   L0421F8
         INX
L0421F8  TXA
         CMP   #$0000
         BEQ   L042203
         LDA   #$0001
         BRA   L042237
L042203  PEI   $18
         PEI   $16
         LDA   $09
         LDX   #$0000
         TAY
         BPL   L042210
         DEX
L042210  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         LDX   #$0000
         CMP   #$0000
         BNE   L04222E
         INX
L04222E  TXA
         CMP   #$0000
         BEQ   L042237
         LDA   #$0001
L042237  TAX
         BEQ   L042279
         LDA   $0B
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   $0D
         TAX
         SEP   #$20
         LDA   #$00
         STA   L028814,X
         REP   #$20
         PEI   $18
         PEI   $16
         LDA   $09
         LDX   #$0000
         TAY
         BPL   L04225A
         DEX
L04225A  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         BNE   L042276
         LDA   #$0001
         STA   $11
L042276  BRL   L042402
L042279  PEI   $18
         PEI   $16
         LDA   $09
         LDX   #$0000
         TAY
         BPL   L042286
         DEX
L042286  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         LDX   #$0000
         CMP   #$0020
         BNE   L0422A4
         INX
L0422A4  TXA
         CMP   #$0000
         BEQ   L0422AF
         LDA   #$0001
         BRA   L0422E3
L0422AF  PEI   $18
         PEI   $16
         LDA   $09
         LDX   #$0000
         TAY
         BPL   L0422BC
         DEX
L0422BC  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         LDX   #$0000
         CMP   #$0009
         BNE   L0422DA
         INX
L0422DA  TXA
         CMP   #$0000
         BEQ   L0422E3
         LDA   #$0001
L0422E3  TAX
         BNE   L0422E9
         BRL   L0423B2
L0422E9  LDA   $0F
         BNE   L04230C
         LDA   $0B
         INC   $0B
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   $0D
         TAX
         SEP   #$20
         LDA   #$00
         STA   L028814,X
         REP   #$20
         LDA   #$0000
         STA   $0D
         LDA   #$0001
         STA   $0F
L04230C  LDA   $0B
         BMI   L042316
         DEC
         DEC
         DEC
         DEC
         BPL   L042319
L042316  BRL   L0423B0
L042319  PEI   $18
         PEI   $16
         LDA   $09
         LDX   #$0000
         TAY
         BPL   L042326
         DEX
L042326  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         LDX   #$0000
         CMP   #$000D
         BEQ   L042344
         INX
L042344  TXA
         CMP   #$0000
         BEQ   L04237E
         PEI   $18
         PEI   $16
         LDA   $09
         LDX   #$0000
         TAY
         BPL   L042357
         DEX
L042357  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         LDX   #$0000
         CMP   #$0000
         BEQ   L042375
         INX
L042375  TXA
         CMP   #$0000
         BEQ   L04237E
         LDA   #$0001
L04237E  TAX
         BEQ   L042385
         INC   $09
         BRA   L042319
L042385  PEI   $18
         PEI   $16
         LDA   $09
         LDX   #$0000
         TAY
         BPL   L042392
         DEX
L042392  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         BNE   L0423AE
         LDA   #$0001
         STA   $11
L0423AE  BRA   L042402
L0423B0  BRA   L0423FD
L0423B2  LDA   #$0000
         STA   $0F
         LDA   $0B
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   $0D
         INC   $0D
         CLC
         ADC   #L028814
         PEA   ^L028814
         PHA
         PEI   $18
         PEI   $16
         LDA   $09
         LDX   #$0000
         TAY
         BPL   L0423D7
         DEX
L0423D7  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PHA
         JSL   L02CA2C
         PLX
         STX   $01
         PLX
         STX   $03
         SEP   #$20
         STA   [$01]
         REP   #$20
L0423FD  INC   $09
         BRL   L0421CD
L042402  LDA   $0B
         BMI   L04240B
         DEC
         DEC
         DEC
         BPL   L042423
L04240B  INC   $0B
         LDA   $0B
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #$0000
         TAX
         SEP   #$20
         LDA   #$00
         STA   L028814,X
         REP   #$20
         BRA   L042402
L042423  LDA   #$FFFF
         STA   L027EAB
         STA   L027EB3
         LDA   #$0000
         STA   $0B
L042431  LDA   $0B
         BMI   L04243A
         CMP   #$0029
         BCS   L042484
L04243A  LDA   $0B
         ASL
         ASL
         TAX
         LDY   L028770+2,X
         LDA   L028770,X
         PHY
         PHA
         PEA   ^L028814
         PEA   L028814
         JSL   L02C751
         TAX
         BNE   L042459
         LDA   $0B
         STA   L027EB3
L042459  LDA   $0B
         ASL
         ASL
         TAX
         LDY   L028770+2,X
         LDA   L028770,X
         PHY
         PHA
         PEA   ^L028814
         PEA   L028814
         LDA   #$0020
         CLC
         ADC   $01,S
         STA   $01,S
         JSL   L02C751
         TAX
         BNE   L042480
         LDA   $0B
         STA   L027EAB
L042480  INC   $0B
         BRA   L042431
L042484  LDA   L028824
         AND   #$00FF
         CMP   #$0052
         BNE   L0424A4
         PEA   ^L028824
         PEA   L028824
         LDA   #$0001
         CLC
         ADC   $01,S
         STA   $01,S
         JSL   L02C377
         STA   L027EB1
L0424A4  LDA   L027EB3
         ASL
         TAX
         LDA   L028878,X
         STA   $0B
         LDA   $0B
         BMI   L0424B5
         DEC
         BPL   L0424B8
L0424B5  BRL   L0425BA
L0424B8  LDA   $0B
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #$0000
         TAX
         LDA   L028814,X
         AND   #$00FF
         CMP   #$0052
         BNE   L0424FB
         LDA   $0B
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #L028814
         PEA   ^L028814
         PHA
         LDA   #$0001
         CLC
         ADC   $01,S
         STA   $01,S
         JSL   L02C377
         ASL
         ASL
         TAX
         LDY   L028232,X
         LDA   L028230,X
         TYX
         STX   L027ED3
         STA   L027ED1
         BRL   L0425BA
L0424FB  LDA   $0B
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #$0000
         TAX
         LDA   L028814,X
         AND   #$00FF
         CMP   #$0024
         BNE   L042536
         LDA   $0B
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #L028814
         PEA   ^L028814
         PHA
         LDA   #$0001
         CLC
         ADC   $01,S
         STA   $01,S
         JSL   L040C8F
         PHX
         STA   L027ED1
         PLA
         STA   L027ED3
         BRL   L0425BA
L042536  LDA   $0B
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #$0000
         TAX
         LDA   L028814,X
         AND   #$00FF
         LDX   #$0000
         CMP   #$0030
         BNE   L042550
         INX
L042550  TXA
         CMP   #$0000
         BEQ   L042579
         LDA   $0B
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #$0001
         TAX
         LDA   L028814,X
         AND   #$00FF
         LDX   #$0000
         CMP   #$0058
         BNE   L042570
         INX
L042570  TXA
         CMP   #$0000
         BEQ   L042579
         LDA   #$0001
L042579  TAX
         BEQ   L0425A0
         LDA   $0B
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #L028814
         PEA   ^L028814
         PHA
         LDA   #$0002
         CLC
         ADC   $01,S
         STA   $01,S
         JSL   L040C8F
         PHX
         STA   L027ED1
         PLA
         STA   L027ED3
         BRA   L0425BA
L0425A0  LDA   $0B
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #L028814
         PEA   ^L028814
         PHA
         JSL   L02C377
         PHX
         STA   L027ED1
         PLA
         STA   L027ED3
L0425BA  LDA   $11
         LDX   #$0000
         CMP   #$0000
         BNE   L0425C5
         INX
L0425C5  TXA
         BNE   L0425D0
         PEA   $0000
         PEA   $0000
         BRA   L0425FB
L0425D0  PEI   $18
         PEI   $16
         LDA   $09
         LDX   #$0000
         TAY
         BPL   L0425DD
         DEX
L0425DD  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L0425F1
         DEX
L0425F1  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
L0425FB  PLA
         STA   $05
         PLA
         STA   $07
         LDA   $14
         STA   $18
         LDA   $13
         STA   $17
         LDX   $07
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         RTL

L042616  TSC
         SEC
         SBC   #$000C
         TCS
         PHD
         TCD
         LDX   L027EC9
         LDA   L027EC7
         STX   $0B
         STA   $09
L042628  LDA   [$09]
         CMP   $10
         BEQ   L042684
         LDY   #$0008
         LDA   [$09],Y
         PHA
         LDY   #$0006
         LDA   [$09],Y
         PHA
         LDA   #$0000
         TAX
         LDY   #$0001
         CMP   $01,S
         BEQ   L042646
         DEY
L042646  TXA
         CMP   $03,S
         BEQ   L04264E
         LDY   #$0000
L04264E  PLA
         PLA
         TYA
         BNE   L042664
         LDY   #$0008
         LDA   [$09],Y
         TAX
         LDY   #$0006
         LDA   [$09],Y
         STX   $0B
         STA   $09
         BRA   L042682
L042664  LDA   $10
         BEQ   L042679
         LDX   L027EC9
         LDA   L027EC7
         STX   $0B
         STA   $09
         LDA   #$0000
         STA   $10
         BRA   L042682
L042679  LDA   #$0000
         STA   $05
         STA   $07
         BRA   L042693
L042682  BRA   L042628
L042684  LDY   #$0004
         LDA   [$09],Y
         TAX
         LDY   #$0002
         LDA   [$09],Y
         STX   $07
         STA   $05
L042693  LDA   $0E
         STA   $10
         LDA   $0D
         STA   $0F
         LDX   $07
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         RTL

L0426A8  TSC
         SEC
         SBC   #$000C
         TCS
         PHD
         TCD
         LDA   $10
         STA   $09
         STZ   $0B
         LDA   $09
         LDX   $0B
         STA   $05
         STX   $07
         LDA   $0E
         STA   $10
         LDA   $0D
         STA   $0F
         LDX   $07
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         RTL

L0426D3  TSC
         SEC
         SBC   #$006C
         TCS
         PHD
         TCD
         LDX   $72
         LDA   $70
         PHX
         PHA
         _HLock
*         STA   L02DD98
         LDY   #$0002
         LDA   [$70],Y
         PHA
         LDA   [$70]
         PHA
         TYA
         LDX   #$0000
         BPL   L0426FB
         DEX
L0426FB  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         STA   $07
         PLA
         STA   $09
         LDA   #$000F
         STA   $21
         LDA   $07
         STA   $25
         LDA   $09
         STA   $27
         LDA   #$0000
         STA   $29
         STA   $2B
         STA   $47
         STA   $49
         PEA   $2010
         PEA   $0000
         TDC
         CLC
         ADC   #$0021
         PHA
         JSL   L02C243
         JSL   L02CA27
         STA   $13
         TAX
         BEQ   L04275C
         PEA   $3010
         PEI   $13
         JSL   L027CEB
         LDX   $72
         LDA   $70
         PHX
         PHA
         _HUnlock
*         STA   L02DD98
         LDA   $13
         STA   $05
         BRL   L0429D0
L04275C  LDA   #$0001
         STA   $0B
         PEA   $0000
         TDC
         CLC
         ADC   #$000D
         PHA
         LDA   $23
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PHA
         PHA
         LDA   $4B
         LDX   $4D
         PHX
         PHA
         LDA   L024112
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
*         STA   L02DD98
         PLA
         STA   $0F
         PLA
         STA   $11
         JSL   L02CA27
         STA   $13
         TAX
         BEQ   L0427DE
         PEA   $3020
         PEI   $13
         JSL   L027CEB
         PEA   $2014
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         JSL   L02C243
         PEA   $3021
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $72
         LDA   $70
         PHX
         PHA
         _HUnlock
*         STA   L02DD98
         LDA   $13
         STA   $05
         BRL   L0429D0
L0427DE  LDX   $11
         LDA   $0F
         PHX
         PHA
         _HLock
*         STA   L02DD98
         LDA   #$0004
         STA   $5B
         PEA   $0000
         TDC
         CLC
         ADC   #$005D
         PHA
         LDA   $23
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         LDY   #$0002
         LDA   [$0F],Y
         PHA
         LDA   [$0F]
         STA   $5F
         PLA
         STA   $61
         LDA   $4B
         LDX   $4D
         PHX
         STA   $63
         PLA
         STA   $65
         PEA   $2012
         PEA   $0000
         TDC
         CLC
         ADC   #$005B
         PHA
         JSL   L02C243
         JSL   L02CA27
         STA   $13
         TAX
         BEQ   L04288E
         PEA   $3030
         PEI   $13
         JSL   L027CEB
         PEA   $2014
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         JSL   L02C243
         PEA   $3031
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $11
         LDA   $0F
         PHX
         PHA
         _DisposeHandle
*         STA   L02DD98
         PEA   $3232
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $72
         LDA   $70
         PHX
         PHA
         _HUnlock
*         STA   L02DD98
         LDA   $13
         STA   $05
         BRL   L0429D0
L04288E  PEA   $2014
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         JSL   L02C243
         JSL   L02CA27
         STA   $13
         TAX
         BEQ   L0428E6
         PEA   $3040
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $11
         LDA   $0F
         PHX
         PHA
         _DisposeHandle
*         STA   L02DD98
         PEA   $3041
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $72
         LDA   $70
         PHX
         PHA
         _HUnlock
*         STA   L02DD98
         LDA   $13
         STA   $05
         BRL   L0429D0
L0428E6  LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         STX   $17
         STA   $15
         LDA   $4B
         LDX   $4D
         PHX
         PHA
         PEI   $17
         PEI   $15
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         STA   $19
         PLA
         STA   $1B
L04290D  PEI   $17
         PEI   $15
         LDX   $1B
         LDA   $19
         TAY
         TXA
         LDX   #$0001
         CMP   $03,S
         BNE   L042921
         TYA
         CMP   $01,S
L042921  BEQ   L042925
         BCS   L042926
L042925  DEX
L042926  PLA
         PLA
         TXA
         BEQ   L042953
         LDA   $15
         LDX   $17
         STA   $1D
         STX   $1F
         PEI   $1F
         PEI   $1D
         LDA   [$1D]
         AND   #$00FF
         AND   #$007F
         PLX
         STX   $01
         PLX
         STX   $03
         SEP   #$20
         STA   [$01]
         REP   #$20
         INC   $15
         BNE   L042951
         INC   $17
L042951  BRA   L04290D
L042953  PEA   $000D
         LDX   $11
         LDA   $0F
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L0220FD
         PEA   L0220FD
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
*         STA   L02DD98
         PEA   $0000
         PEA   $1000
         _GetCtlHandleFromID
*         STA   L02DD98
         _TESetText
*         STA   L02DD98
         PEA   $3050
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $11
         LDA   $0F
         PHX
         PHA
         _DisposeHandle
*         STA   L02DD98
         PEA   $3251
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $72
         LDA   $70
         PHX
         PHA
         _HUnlock
*         STA   L02DD98
         LDA   #$0000
         STA   $05
L0429D0  LDA   $6E
         STA   $72
         LDA   $6D
         STA   $71
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0070
         TCS
         TYA
         RTL

L0429E3  ENT
         TSC
         SEC
         SBC   #$0028
         TCS
         PHD
         TCD
         LDA   #$0003
         STA   $1D
         STA   $23
         PEA   $007D
         PEA   $0023
         PEA   $0000
         PEA   ^L042C30
         PEA   L042C30
         PEA   $0000
         PEA   $0000
         PEA   ^L02ACEC
         PEA   L02ACEC
         PEA   $0000
         TDC
         CLC
         ADC   #$0015
         PHA
         _SFGetFile2
*         STA   L02DD98
         JSL   L02CA27
         STA   $13
         PEA   $3110
         PEI   $13
         JSL   L027CEB
         LDA   $15
         CMP   #$0000
         BEQ   L042A48
         LDA   $13
         BEQ   L042A3D
         LDA   #$0001
L042A3D  EOR   #$0001
         CMP   #$0000
         BEQ   L042A48
         LDA   #$0001
L042A48  TAX
         BNE   L042A4E
         BRL   L042C21
L042A4E  _WaitCursor
*         STA   L02DD98
         LDA   $1F
         LDX   $21
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STX   $0D
         STA   $0B
         PEI   $0D
         PEI   $0B
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L042A7A
         DEX
L042A7A  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PEI   $0D
         PEI   $0B
         LDA   #$0002
         LDX   #$0000
         TAY
         BPL   L042A92
         DEX
L042A92  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PLX
         STX   $01
         PLX
         STX   $03
         SEP   #$20
         STA   [$01]
         REP   #$20
         PEI   $0D
         PEI   $0B
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L042AC1
         DEX
L042AC1  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         STA   $0B
         PLA
         STA   $0D
         LDA   $1F
         LDX   $21
         PHX
         PHA
         _HLock
*         STA   L02DD98
         PHA
         PHA
         LDX   $0D
         LDA   $0B
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   ^L026AB5
         PEA   L026AB5
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0FFB
         PEA   $800E
         _NewWindow2
*         STA   L02DD98
         PLA
         STA   $07
         PLA
         STA   $09
         PEA   $3120
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PHA
         PEA   $0000
         PEA   $000C
         LDA   L024112
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
*         STA   L02DD98
         PLA
         STA   $0F
         PLA
         STA   $11
         PEA   $3122
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $11
         LDA   $0F
         PHX
         PHA
         LDX   $09
         LDA   $07
         PHX
         PHA
         _SetWRefCon
*         STA   L02DD98
         PEA   $3123
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         STA   $01
         STX   $03
         LDA   #$0000
         STA   [$01]
         LDA   [$0F],Y
         PHA
         LDA   [$0F]
         CLC
         ADC   #$0002
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         STA   [$01],Y
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         CLC
         ADC   #$0006
         STA   $01
         STX   $03
         LDA   #$5754
         STA   [$01]
         LDA   [$0F],Y
         PHA
         LDA   [$0F]
         CLC
         ADC   #$0008
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         STA   [$01],Y
         LDX   $09
         LDA   $07
         PHX
         PHA
         _SetPort
*         STA   L02DD98
         LDA   $25
         LDX   $27
         PHX
         PHA
         JSL   L0426D3
         STA   $13
         LDA   $1F
         LDX   $21
         PHX
         PHA
         _DisposeHandle
*         STA   L02DD98
         PEA   $3124
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   $25
         LDX   $27
         PHX
         PHA
         _DisposeHandle
*         STA   L02DD98
         PEA   $3125
         JSL   L02CA27
         PHA
         JSL   L027CEB
         _InitCursor
*         STA   L02DD98
L042C21  LDA   $13
         STA   $05
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0028
         TCS
         TYA
         RTL

L042C30  STR   'Select a file...'
         DB    $00
L042C42  ENT
         TSC
         SEC
         SBC   #$000A
         TCS
         PHD
         TCD
         PHA
         PHA
         PHA
         PHA
         _FrontWindow
*         STA   L02DD98
         _GetWRefCon
*         STA   L02DD98
         PLA
         STA   $07
         PLA
         STA   $09
         PEA   $3210
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STA   $01
         STX   $03
         LDY   #$0006
         LDA   [$01],Y
         CMP   #$5754
         BEQ   L042C91
         LDA   #$FFFF
         STA   $05
         BRA   L042CD4
L042C91  LDX   $09
         LDA   $07
         PHX
         PHA
         _DisposeHandle
*         STA   L02DD98
         PEA   $3216
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PHA
         _FrontWindow
*         STA   L02DD98
         _CloseWindow
*         STA   L02DD98
         PEA   $3220
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   #$0000
         STA   $05
L042CD4  LDY   $05
         PLD
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         RTL


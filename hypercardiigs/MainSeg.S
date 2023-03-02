*
* HypercardGS
* segment: $0A MainSeg
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   MainSeg.l
         lst   off

*---------------------------------------

         use   MainSeg.E
         use   MainSeg.X

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

L0A0000  ENT
         PHD
         TSC
         TCD
         LDY   #$0006
L0A0006  LDA   [$06],Y
         TAX
         LDA   [$0A],Y
         STA   [$06],Y
         TXA
         STA   [$0A],Y
         DEY
         DEY
         BPL   L0A0006
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

L0A0024  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0552C7
         BNE   L0A0034
         BRL   L0A00D2
L0A0034  JSL   L160234
         JSL   L0903F2
         LDA   L0550C9
         LDX   L0550CB
         CLC
         ADC   #$00CE
         BCC   L0A0049
         INX
L0A0049  STA   $05
         STX   $07
         LDA   #$0020
         AND   [$05]
         BEQ   L0A0060
         LDA   L0550D9
         LDX   L0550DB
         PHX
         PHA
         JSL   L09A5A7
L0A0060  LDA   L0552BB
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L0A0070
         EOR   #$8000
L0A0070  BPL   L0A0095
         LDA   #$0001
         STA   $03
L0A0077  LDA   $03
         DEC
         ASL
         ASL
         TAX
         LDAL  L051DC0,X
         PHA
         LDAL  L051DBE,X
         PHA
         JSL   L07185A
         LDA   $03
         CMP   $01
         BEQ   L0A0095
         INC   $03
         BRA   L0A0077
L0A0095  STZ   L0552BB
         STZ   L055319
         STZ   L0552C7
         LDA   L055153
         BEQ   L0A00CB
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         LDA   L055109
         LDX   L05510B
         PHX
         PHA
         PEA   ^L053259
         PEA   L053259
         PEA   $0000
         JSL   L08382C
         LDA   #$0001
         STA   L055135
         STZ   L055139
         BRA   L0A00CE
L0A00CB  STZ   L055135
L0A00CE  JSL   L0A11CB
L0A00D2  PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         LDA   #$FFFF
         STA   L0550B9
         JSL   L09B058
         PEA   ^L160242
         PEA   L160242
         JSL   L07187A
         PEA   ^L160250
         PEA   L160250
         JSL   L07187A
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0A0100  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L05510D
         BEQ   L0A0115
         JSL   L09AE9F
         JSL   L15059E
L0A0115  LDA   #$0001
         STA   L0550B9
         JSL   L09B058
         JSL   L086C4E
         STZ   L0552C3
         STZ   L0552C5
         LDA   L0550F3
         BEQ   L0A013B
         PEA   ^L0407C8
         PEA   L0407C8
         JSL   L07010A
         BRL   L0A02A2
L0A013B  PHY
         PEA   ^L0407DB
         PEA   L0407DB
         JSL   L0946A2
         PLA
         LSR
         BCS   L0A014D
         BRL   L0A02A2
L0A014D  PHY
         PEA   ^L0407E6
         PEA   L0407E6
         JSL   L0946A2
         PLA
         LSR
         BCS   L0A015F
         BRL   L0A02A2
L0A015F  LDA   L0550F5
         LDX   L0550F7
         STA   L0552E5
         STX   L0552E7
         LDA   L0550F5
         LDX   L0550F7
         CLC
         ADC   #$7D00
         BCC   L0A0178
         INX
L0A0178  STA   L0552E1
         STX   L0552E3
         LDA   #$0080
         STAL  L051EA2
         LDA   L0552E5
         LDX   L0552E7
         STAL  L051EA4
         TXA
         STAL  L051EA6
         LDA   #$00A0
         STAL  L051EA8
         PEA   ^L051EAA
         PEA   L051EAA
         JSL   L082712
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L051EA2
         PEA   L051EA2
         PEA   $0010
         JSL   L0313BE
         LDA   L0552E1
         LDX   L0552E3
         STAL  L051E94
         TXA
         STAL  L051E96
         LDA   #$0001
         STA   L0550F3
         PHY
         PEA   ^L0552F9
         PEA   L0552F9
         PEA   ^L0552DD
         PEA   L0552DD
         PEA   ^L051E82
         PEA   L051E82
         PEA   $0000
         JSL   L16025E
         PLA
         LSR
         BCS   L0A01EE
         BRL   L0A02A2
L0A01EE  PHY
         PEA   ^L0552ED
         PEA   L0552ED
         PEA   ^L0552D1
         PEA   L0552D1
         PEA   ^L051E52
         PEA   L051E52
         PEA   $0001
         JSL   L16025E
         PLA
         BEQ   L0A0230
         PHY
         PEA   ^L0552E9
         PEA   L0552E9
         PEA   ^L0552CD
         PEA   L0552CD
         PEA   ^L051E42
         PEA   L051E42
         PEA   $0001
         JSL   L16025E
         PLA
         BEQ   L0A0230
         LDA   #$0001
         STA   L0552C5
         BRA   L0A024E
L0A0230  PEA   $0002
         LDA   L0552ED
         LDX   L0552EF
         PHX
         PHA
         JSL   L150D44
         PEA   $0002
         LDA   L0552E9
         LDX   L0552EB
         PHX
         PHA
         JSL   L150D44
L0A024E  PHY
         PEA   ^L0552F5
         PEA   L0552F5
         PEA   ^L0552D9
         PEA   L0552D9
         PEA   ^L051E72
         PEA   L051E72
         PEA   $0000
         JSL   L16025E
         PLA
         BEQ   L0A028E
         PHY
         PEA   ^L0552F1
         PEA   L0552F1
         PEA   ^L0552D5
         PEA   L0552D5
         PEA   ^L051E62
         PEA   L051E62
         PEA   $0000
         JSL   L16025E
         PLA
         BEQ   L0A028E
         LDA   #$0001
         STA   L0552C3
L0A028E  JSL   L160242
         JSL   L160250
         LDA   #$0001
         STA   L0552C7
         JSL   L16026C
         BRA   L0A02B8
L0A02A2  JSL   L0A11CB
         PEA   $0028
         JSL   L0727E0
         PEA   $0001
         JSL   L099B9B
         JSL   L09AFB1
L0A02B8  PLY
         PLY
         PLD
         RTL

L0A02BC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         JSL   L0860E5
         JSL   L090A71
         LDA   L0550BB
         STA   $01
         LDA   L055153
         BEQ   L0A02DF
         LDA   $0C
         DEC
         BNE   L0A02DF
         JSL   L0A0F21
L0A02DF  PEI   $0C
         JSL   L099B9B
         LDA   L0550B9
         DEC
         BNE   L0A0336
         LDA   L0550BB
         STA   L0552A7
         LDX   #$0000
         LDA   #$0010
         CMP   L0550BB
         BEQ   L0A02FD
         INX
L0A02FD  PHX
         LDX   #$0000
         LDA   #$0010
         CMP   $01
         BEQ   L0A0309
         INX
L0A0309  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0A0330
         JSL   L16027A
         STZ   L05528F    ; HOW???
         STZ   L055295
         STZ   L055293
         STZ   L055291
         STZ   L0552A1
         PEA   $0000
         PEA   ^L051D72
         PEA   L051D72
         JSL   L150300
L0A0330  LDA   #$0001
         STA   L054F9F
L0A0336  LDA   $0A
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

L0A0347  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         JSL   L0860E5
         JSL   L1601C4
         PHY
         JSL   L09951E
         PLA
         LSR
         BCC   L0A0363
         BRL   L0A040E
L0A0363  LDA   L055227
         DEC
         DEC
         BPL   L0A036D
         BRL   L0A0406
L0A036D  CMP   #$000F
         BMI   L0A0375
         BRL   L0A0406
L0A0375  SEC
         SBC   #$0000
         BEQ   L0A0394
         DEC
         BEQ   L0A03AC
         DEC
         BEQ   L0A03AC
         SEC
         SBC   #$0007
         BEQ   L0A03D4
         DEC
         BEQ   L0A0394
         DEC
         DEC
         DEC
         BEQ   L0A03EF
         DEC
         BEQ   L0A03A0
         BRA   L0A0406
L0A0394  PEA   $0258
         PEA   $0259
         JSL   L09971B
         BRA   L0A0408
L0A03A0  PEA   $0258
         PEA   $025B
         JSL   L09971B
         BRA   L0A0408
L0A03AC  LDA   L0551FB
         SEC
         SBC   #$0002
         BEQ   L0A03C8
         BVS   L0A03BA
         EOR   #$8000
L0A03BA  BPL   L0A03C8
         PEA   $01F4
         PEA   $01FD
         JSL   L09971B
         BRA   L0A03D2
L0A03C8  PEA   $0514
         PEA   $051D
         JSL   L09971B
L0A03D2  BRA   L0A0408
L0A03D4  LDAL  L052D6C
         TAX
         LDAL  L052D6A
         STA   L05521D
         STX   L05521F
         PEA   $02BC
         PEA   $02BD
         JSL   L09971B
         BRA   L0A0408
L0A03EF  LDA   L055145
         BEQ   L0A03FD
         PEA   $001E
         JSL   L0998B0
         BRA   L0A0404
L0A03FD  PEA   $001F
         JSL   L0998B0
L0A0404  BRA   L0A0408
L0A0406  BRA   L0A040A
L0A0408  BRA   L0A040E
L0A040A  JSL   L093031
L0A040E  PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0A0414  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF4
         TCS
         ADC   #$0019
         TCD
         LDX   #$0000
         LDA   $FA
         BNE   L0A0427
         INX
L0A0427  PHX
         LDX   #$0000
         LDA   $F8
         BNE   L0A0430
         INX
L0A0430  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0A043A
         BRL   L0A07FE
L0A043A  STZ   L0551F1
         LDA   #$0001
         STA   L05523D
         LDA   #$00FA
         CMP   $F8
         BEQ   L0A044E
         JSL   L093A99
L0A044E  LDX   #$0000
         LDA   #$01F4
         CMP   $FA
         BNE   L0A0459
         INX
L0A0459  PHX
         LDA   $F8
         SEC
         SBC   #$01FC
         BVS   L0A0465
         EOR   #$8000
L0A0465  BMI   L0A046C
         LDA   #$0000
         BRA   L0A046F
L0A046C  LDA   #$0001
L0A046F  AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$0201
         CMP   $F8
         BEQ   L0A047E
         INX
L0A047E  TXA
         AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$01F4
         CMP   $FA
         BEQ   L0A048E
         INX
L0A048E  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0A0499
         JSL   L090A71
L0A0499  LDA   $FA
         SEC
         SBC   #$012C
         BPL   L0A04A4
         BRL   L0A07FB
L0A04A4  CMP   #$044D
         BMI   L0A04AC
         BRL   L0A07FB
L0A04AC  SEC
         SBC   #$0000
         BEQ   L0A04DF
         SEC
         SBC   #$00C8
         BNE   L0A04BB
         BRL   L0A05B4
L0A04BB  SEC
         SBC   #$0064
         BNE   L0A04C4
         BRL   L0A0687
L0A04C4  SEC
         SBC   #$012C
         BNE   L0A04CD
         BRL   L0A0690
L0A04CD  SEC
         SBC   #$0064
         BNE   L0A04D6
         BRL   L0A074F
L0A04D6  SEC
         SBC   #$0190
         BEQ   L0A04E8
         BRL   L0A07FB
L0A04DF  PEI   $F8
         JSL   L092AB3
         BRL   L0A07FB
L0A04E8  JSL   L160218
         LDA   $F8
         SEC
         SBC   #$0579
         BPL   L0A04F7
         BRL   L0A05B1
L0A04F7  CMP   #$0010
         BMI   L0A04FF
         BRL   L0A05B1
L0A04FF  SEC
         SBC   #$0000
         BEQ   L0A0524
         DEC
         BEQ   L0A0537
         DEC
         BEQ   L0A0580
         DEC
         DEC
         BNE   L0A0512
         BRL   L0A0593
L0A0512  DEC
         BNE   L0A0518
         BRL   L0A05A3
L0A0518  SEC
         SBC   #$000A
         BNE   L0A0521
         BRL   L0A05A9
L0A0521  BRL   L0A05B1
L0A0524  PHY
         PEA   ^L040818
         PEA   L040818
         PEA   $0000
         JSL   L091037
         PLA
         STA   $ED
         BRA   L0A05B1
L0A0537  PHY
         PEA   $0000
         PEA   $0055
         PEA   $0000
         PEA   $0001
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         PEA   $002E
         JSL   L073002
         TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         JSL   L09B294
         PLA
         LSR
         BCC   L0A0576
         PEA   $0000
         PEA   $0001
         PEI   $EB
         PEI   $E9
         PEA   $0000
         JSL   L0968FC
L0A0576  PEI   $EB
         PEI   $E9
         JSL   L07185A
         BRA   L0A05B1
L0A0580  PHY
         PEA   ^L040819
         PEA   L040819
         PEA   $0000
         JSL   L098B31
         PLA
         STA   $ED
         BRA   L0A05B1
L0A0593  PHY
         PEA   ^L04081A
         PEA   L04081A
         JSL   L160288
         PLA
         STA   $E7
         BRA   L0A05B1
L0A05A3  JSL   L160296
         BRA   L0A05B1
L0A05A9  LDA   #$0001
         STA   L05524F
         BRA   L0A05B1
L0A05B1  BRL   L0A07FB
L0A05B4  LDA   $F8
         SEC
         SBC   #$00FE
         BEQ   L0A05C3
         BVS   L0A05C1
         EOR   #$8000
L0A05C1  BMI   L0A05D6
L0A05C3  PHY
         LDA   $F8
         SEC
         SBC   #$00F9
         PHA
         JSL   L150F47
         PLA
         LSR
         BCC   L0A05D6
         BRL   L0A0684
L0A05D6  LDA   $F8
         SEC
         SBC   #$00FA
         BPL   L0A05E1
         BRL   L0A0684
L0A05E1  CMP   #$0109
         BMI   L0A05E9
         BRL   L0A0684
L0A05E9  SEC
         SBC   #$0000
         BEQ   L0A0613
         DEC
         BEQ   L0A0619
         DEC
         BEQ   L0A0622
         DEC
         BEQ   L0A062B
         DEC
         BEQ   L0A0631
         SEC
         SBC   #$00FE
         BEQ   L0A0637
         DEC
         BEQ   L0A063D
         DEC
         BEQ   L0A0647
         DEC
         BEQ   L0A0655
         DEC
         DEC
         BEQ   L0A065F
         DEC
         BEQ   L0A067E
         BRA   L0A0684
L0A0613  JSL   L1602A4
         BRA   L0A0684
L0A0619  PEA   $0001
         JSL   L1602B2
         BRA   L0A0684
L0A0622  PEA   $0000
         JSL   L1602B2
         BRA   L0A0684
L0A062B  JSL   L0A0A49
         BRA   L0A0684
L0A0631  JSL   L1602C0
         BRA   L0A0684
L0A0637  JSL   L09014C
         BRA   L0A0684
L0A063D  JSL   L1601FC
         JSL   L092798
         BRA   L0A0684
L0A0647  JSL   L160218
         JSL   L090BBD
         JSL   L092798
         BRA   L0A0684
L0A0655  JSL   L160218
         JSL   L090BBD
         BRA   L0A0684
L0A065F  PHY
         PEA   ^L051EBE
         PEA   L051EBE
         PEA   $0001
         JSL   L1602CE
         PLA
         LSR
         BCC   L0A067C
         JSL   L1602DC
         PEA   $0001
         JSL   L1601D2
L0A067C  BRA   L0A0684
L0A067E  JSL   L0A0F21
         BRA   L0A0684
L0A0684  BRL   L0A07FB
L0A0687  PEI   $F8
         JSL   L0932B8
         BRL   L0A07FB
L0A0690  LDA   $F8
         SEC
         SBC   #$0385
         BPL   L0A069B
         BRL   L0A074C
L0A069B  CMP   #$0011
         BMI   L0A06A3
         BRL   L0A074C
L0A06A3  ASL
         TAX
         LDAL  L0A06AB,X
         PHA
         RTS

L0A06AB  DA    L0A06CB+1
         DA    L0A06D1+1
         DA    L0A074A+1
         DA    L0A06D7+1
         DA    L0A06E3+1
         DA    L0A06E9+1
         DA    L0A06EF+1
         DA    L0A06F5+1
         DA    L0A06FE+1
         DA    L0A0707+1
         DA    L0A0710+1
         DA    L0A074A+1
         DA    L0A0719+1
         DA    L0A071F+1
         DA    L0A074A+1
         DA    L0A0725+1
L0A06CB  DA    L0A0744+1
         JSL   L1602EA
L0A06D1  BRA   L0A074C
         JSL   L1602F8
L0A06D7  BRA   L0A074C
         PEA   ^L052D12
         PEA   L052D12
         JSL   L160306
L0A06E3  BRA   L0A074C
         JSL   L160314
L0A06E9  BRA   L0A074C
         JSL   L160322
L0A06EF  BRA   L0A074C
         JSL   L160330
L0A06F5  BRA   L0A074C
         PEA   $0000
         JSL   L16033E
L0A06FE  BRA   L0A074C
         PEA   $0001
         JSL   L16033E
L0A0707  BRA   L0A074C
         PEA   $0000
         JSL   L16034C
L0A0710  BRA   L0A074C
         PEA   $0001
         JSL   L16034C
L0A0719  BRA   L0A074C
         JSL   L16035A
L0A071F  BRA   L0A074C
         JSL   L160368
L0A0725  BRA   L0A074C
         LDA   L055051
         BEQ   L0A0732
         JSL   L0903A6
         BRA   L0A0744
L0A0732  JSL   L160234
         JSL   L160376
         PEA   $0001
         PEA   $0001
         JSL   L090000
L0A0744  BRA   L0A074C
         JSL   L160384
L0A074A  BRA   L0A074C
L0A074C  BRL   L0A07FB
L0A074F  LDA   $F8
         SEC
         SBC   #$03E9
         BPL   L0A075A
         BRL   L0A07F9
L0A075A  CMP   #$000E
         BMI   L0A0762
         BRL   L0A07F9
L0A0762  ASL
         TAX
         LDAL  L0A076A,X
         PHA
         RTS

L0A076A  DA    L0A0784+1
         DA    L0A078A+1
         DA    L0A0790+1
         DA    L0A07F7+1
         DA    L0A079B+1
         DA    L0A07A1+1
         DA    L0A07A7+1
         DA    L0A07B5+1
         DA    L0A07CA+1
         DA    L0A07F7+1
         DA    L0A07D0+1
         DA    L0A07D6+1
         DA    L0A07E1+1
L0A0784  DA    L0A07EC+1
         JSL   L160392
L0A078A  BRA   L0A07F9
         JSL   L1603A0
L0A0790  BRA   L0A07F9
         LDA   L055219
         EOR   #$0001
         STA   L055219
L0A079B  BRA   L0A07F9
         JSL   L1603AE
L0A07A1  BRA   L0A07F9
         JSL   L1603BC
L0A07A7  BRA   L0A07F9
         JSL   L160234
         JSL   L160376
         JSL   L1601E0
L0A07B5  BRA   L0A07F9
         LDA   L055153
         INC
         PHA
         LDA   L055051
         EOR   #$0001
         ORA   L055243
         PHA
         JSL   L1603CA
L0A07CA  BRA   L0A07F9
         JSL   L1603D8
L0A07D0  BRA   L0A07F9
         JSL   L09A560
L0A07D6  BRA   L0A07F9
         LDA   L05530B
         EOR   #$0001
         STA   L05530B
L0A07E1  BRA   L0A07F9
         LDA   L055311
         EOR   #$0001
         STA   L055311
L0A07EC  BRA   L0A07F9
         LDA   L055309
         EOR   #$0001
         STA   L055309
L0A07F7  BRA   L0A07F9
L0A07F9  BRA   L0A07FB
L0A07FB  STZ   L05523D
L0A07FE  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0112
         TCS
         RTL

L0A0810  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDX   #$0000
         LDA   #$000A
         CMP   L055227
         BNE   L0A0824
         INX
L0A0824  TXA
         AND   L055319
         BEQ   L0A0834
         PEA   $0000
         JSL   L1603E6
         BRL   L0A0A44
L0A0834  LDX   #$0000
         LDA   #$0009
         CMP   L055227
         BNE   L0A0840
         INX
L0A0840  TXA
         AND   L055319
         BEQ   L0A0864
         LDA   L055051
         AND   L055245
         BEQ   L0A0854
         JSL   L0903A6
         BRA   L0A0861
L0A0854  PHY
         JSL   L1603F4
         PLA
         LSR
         BCS   L0A0861
         JSL   L160402
L0A0861  BRL   L0A0A44
L0A0864  PHY
         JSL   L09951E
         PLA
         LSR
         BCC   L0A0870
         BRL   L0A0A44
L0A0870  LDA   #$000B
         CMP   L055227
         BNE   L0A089A
         LDA   L055231
         BEQ   L0A088B
         LDA   L0550E9
         LDX   L0550EB
         PHX
         PHA
         JSL   L09A5A7
         BRA   L0A0897
L0A088B  LDA   L0550DD
         LDX   L0550DF
         PHX
         PHA
         JSL   L09A5A7
L0A0897  BRL   L0A0A44
L0A089A  LDX   #$0000
         LDA   L055227
         DEC
         DEC
         BNE   L0A08A5
         INX
L0A08A5  PHX
         LDX   #$0000
         LDA   #$000C
         CMP   L055227
         BNE   L0A08B2
         INX
L0A08B2  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0A08C0
         JSL   L1602A4
         BRL   L0A0A44
L0A08C0  LDA   #$0003
         CMP   L055227
         BNE   L0A08DA
         LDA   L055231
         BEQ   L0A08D3
         JSL   L160410
         BRA   L0A08D7
L0A08D3  JSL   L1602C0
L0A08D7  BRL   L0A0A44
L0A08DA  JSL   L0860E5
         LDA   L055225
         STA   $01
         LDX   #$0000
         LDA   L055227
         DEC
         BNE   L0A08ED
         INX
L0A08ED  PHX
         LDA   $01
         SEC
         SBC   #$0020
         BVS   L0A08F9
         EOR   #$8000
L0A08F9  BPL   L0A0900
         LDA   #$0000
         BRA   L0A0903
L0A0900  LDA   #$0001
L0A0903  PHA
         LDX   #$0000
         LDA   #$0008
         CMP   $01
         BEQ   L0A090F
         INX
L0A090F  TXA
         AND   $01,S
         PLX
         ORA   $01,S
         PLX
         LSR
         BCC   L0A0920
         JSL   L072314
         BRL   L0A0A44
L0A0920  LDA   L0551F3
         BEQ   L0A093D
         LDA   L055225
         PHA
         LDAL  L052D72
         PHA
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150C40
         BRL   L0A0A44
L0A093D  LDA   L055319
         BEQ   L0A0960
         LDA   L055051
         AND   L055245
         BEQ   L0A0950
         JSL   L0903A6
         BRA   L0A095D
L0A0950  PHY
         JSL   L1603F4
         PLA
         LSR
         BCS   L0A095D
         JSL   L160402
L0A095D  BRL   L0A0A44
L0A0960  LDA   L055225
         PHA
         PEA   ^L04081B
         PEA   L04081B
         PLY
         PLX
         TSC
         CLC
         ADC   #$FFFA
         TCS
         PEA   $0000
         INC
         PHA
         PHX
         PHY
         PEA   $0006
         JSL   L0313BE
         PEA   $0006
         JSL   L1511F2
         PLA
         LSR
         BCC   L0A09DC
         PEA   $7FFF
         PEA   $7FFF
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L1512D1
         JSL   L097700
         PEA   $0020
         PEA   $0000
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150C40
         LDA   L055225
         PHA
         LDAL  L052D72
         PHA
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150C40
         PEA   $0020
         PEA   $0000
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150C40
         BRA   L0A0A44
L0A09DC  LDA   #$0004
         CMP   L055227
         BNE   L0A09FD
         LDA   L055231
         BEQ   L0A09EF
         JSL   L160410
         BRA   L0A0A44
L0A09EF  LDA   L0552AB
         ORA   L0552B1
         BEQ   L0A09FD
         JSL   L1602C0
         BRA   L0A0A44
L0A09FD  LDA   L0550C5
         LDX   L0550C7
         CLC
         ADC   #$00CE
         BCC   L0A0A0A
         INX
L0A0A0A  STA   $03
         STX   $05
         LDA   #$0020
         AND   [$03]
         BEQ   L0A0A18
         LDA   #$0001
L0A0A18  EOR   #$0001
         ORA   L0552B1
         BEQ   L0A0A26
         JSL   L16041E
         BRA   L0A0A44
L0A0A26  PHY
         JSL   L0961E7
         PLA
         LSR
         BCC   L0A0A44
         LDA   L055225
         PHA
         LDAL  L052D72
         PHA
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150C40
L0A0A44  PLY
         PLY
         PLY
         PLD
         RTL

L0A0A49  PHD
         TSC
         CLC
         ADC   #$FFA8
         TCS
         TCD
         LDA   L055051
         AND   L055245
         BEQ   L0A0A60
         JSL   L0903A6
         BRL   L0A0F19
L0A0A60  LDA   #$1604
         CMP   L0551E9
         BNE   L0A0A6F
         JSL   L0979C5
         BRL   L0A0F19
L0A0A6F  LDA   #$1602
         CMP   L0551E9
         BNE   L0A0A7E
         PEA   $0002
         JSL   L0A02BC
L0A0A7E  LDA   #$1603
         CMP   L0551E9
         BNE   L0A0A8D
         PEA   $0003
         JSL   L0A02BC
L0A0A8D  LDA   L0550B9
         BNE   L0A0A99
         JSL   L0A36B1
         BRL   L0A0F19
L0A0A99  LDX   #$0000
         LDA   L0551E9
         BNE   L0A0AA2
         INX
L0A0AA2  TXA
         AND   L0551F3
         BEQ   L0A0AC3
         JSL   L160234
         JSL   L160376
         JSL   L151478
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150B76
         BRL   L0A0F19
L0A0AC3  PHY
         JSL   L1603F4
         PLA
         LSR
         BCC   L0A0ACF
         BRL   L0A0F19
L0A0ACF  PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         LDA   L0552B1
         STA   $51
         JSL   L160218
         JSL   L160376
         STZ   L05529B
         STZ   $53
         STZ   $2F
         STZ   $31
         TDC
         CLC
         ADC   #$0001
         STA   $2B
         STZ   $2D
         LDA   L0551E9
         DEC
         BEQ   L0A0B01
         BRL   L0A0D74
L0A0B01  PHY
         PHY
         PEA   $0001
         JSL   L150B1C
         PLA
         STA   $4D
         PLX
         STX   $4F
         PEI   $4F
         PEI   $4D
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L0A0B21
         BRL   L0A0D74
L0A0B21  BNE   L0A0B26
         BRL   L0A0D74
L0A0B26  PHY
         PHY
         PEI   $4F
         PEI   $4D
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $49
         PLX
         STX   $4B
         LDAL  L05565D
         BEQ   L0A0B4C
         BRL   L0A0D74
L0A0B4C  PEI   $4B
         PEI   $49
         PEA   $0001
         JSL   L15064D
         PHY
         PHY
         JSL   L15042E
         LDA   $4D
         LDX   $4F
         JSL   L033477
         BVS   L0A0B6A
         EOR   #$8000
L0A0B6A  BMI   L0A0BA2
         PEA   $0000
         JSL   L07479E
         JSL   L151373
         PEA   $0000
         JSL   L15000C
         JSL   L15059E
         PHY
         PHY
         JSL   L15042E
         LDA   $4D
         LDX   $4F
         JSL   L033477
         BVS   L0A0B95
         EOR   #$8000
L0A0B95  BMI   L0A0BA2
         PEI   $4B
         PEI   $49
         JSL   L07185A
         BRL   L0A0F19
L0A0BA2  TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$49],Y
         TAX
         LDA   [$49]
         CLC
         ADC   #$0002
         BCC   L0A0BBA
         INX
L0A0BBA  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         JSL   L16042C
         PHY
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         PEA   ^L053259
         PEA   L053259
         TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         STA   $37
         PHY
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCS   L0A0C18
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         JSL   L16043A
L0A0C18  PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         PEA   $0001
         JSL   L160448
         JSL   L160456
         PEI   $4B
         PEI   $49
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         JSL   L150683
         PEI   $4B
         PEI   $49
         JSL   L07185A
         PEA   ^L051E1A
         PEA   L051E1A
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PEA   $0000
         JSL   L160448
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         JSL   L160464
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEA   $0000
         PEA   ^L051E12
         PEA   L051E12
         JSL   L085B3C
         LDA   #$0001
         STA   L05529F
         LDA   L05529B
         BEQ   L0A0CFC
         LDA   #$0001
         STA   $09
         LDA   #$000F
         LDX   #$000B
         STA   $00,X
         PEI   $2D
         PEI   $2B
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         LDA   #$FFF0
         AND   $03
         STA   $03
         LDA   #$000F
         CLC
         ADC   $07
         AND   #$FFF0
         STA   $07
         PEA   ^L051E92
         PEA   L051E92
         PEI   $2D
         PEI   $2B
         PEA   ^L051E32
         PEA   L051E32
         PEI   $2D
         PEI   $2B
         PEA   $2001
         PEA   $FFFF
         PEA   $FFFF
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151627
         LDA   #$0001
         STA   L0552AF
         BRA   L0A0D10
L0A0CFC  PEA   ^L051E32
         PEA   L051E32
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L15123D
L0A0D10  LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0000
         JSL   L08382C
         PEA   ^L051E12
         PEA   L051E12
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0001
         STA   $53
         PHY
         JSL   L099DCE
         PLA
         LSR
         BCC   L0A0D74
         PHY
         PHY
         PEA   $8002
         JSL   L1516BD
         PLA
         STA   $33
         PLX
         STX   $35
         LDAL  L05565D
         BNE   L0A0D74
         PEA   $0000
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         PHX
         PHA
         JSL   L150306
L0A0D74  LDA   L0551E9
         BEQ   L0A0D7C
         BRL   L0A0EB4
L0A0D7C  PHY
         PHY
         PEA   $0000
         JSL   L150B1C
         PLA
         STA   $4D
         PLX
         STX   $4F
         LDA   $4D
         ORA   $4F
         BNE   L0A0D94
         BRL   L0A0EB4
L0A0D94  PHY
         PHY
         LDA   $4D
         LDX   $4F
         INC
         BNE   L0A0D9E
         INX
L0A0D9E  PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $2F
         PLX
         STX   $31
         LDAL  L05565D
         BEQ   L0A0DC0
         BRL   L0A0EB4
L0A0DC0  PEI   $31
         PEI   $2F
         PEA   $0000
         JSL   L15064D
         LDAL  L05565D
         BEQ   L0A0DD4
         BRL   L0A0EB4
L0A0DD4  PHY
         PEI   $31
         PEI   $2F
         LDA   $4D
         LDX   $4F
         INC
         BNE   L0A0DE1
         INX
L0A0DE1  PHX
         PHA
         JSL   L078A05
         PLA
         LSR
         BCS   L0A0DEE
         BRL   L0A0EB4
L0A0DEE  LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         STA   $55
         STX   $57
         LDA   $4D
         LDX   $4F
         INC
         BNE   L0A0E02
         INX
L0A0E02  DEC
         TAY
         LDA   #$0000
         SEP   #$20
         STA   [$55],Y
         REP   #$20
         LDA   $2F
         LDX   $31
         STA   L055315
         STX   L055317
         PEI   $2D
         PEI   $2B
         JSL   L082712
         PEI   $2D
         PEI   $2B
         PEA   $0020
         PEA   $0002
         JSL   L151005
         PEI   $2D
         PEI   $2B
         JSL   L160472
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         PEI   $2D
         PEI   $2B
         JSL   L082766
         PEI   $2D
         PEI   $2B
         JSL   L16043A
         PEI   $2D
         PEI   $2B
         PEA   $FFFA
         PEA   $FFFF
         JSL   L151005
         PEI   $2D
         PEI   $2B
         JSL   L160464
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L160472
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEA   $0000
         PEA   ^L051E12
         PEA   L051E12
         JSL   L085B3C
         PEA   ^L051E12
         PEA   L051E12
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   $0008
         JSL   L0313BE
         PEA   ^L051E32
         PEA   L051E32
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L15123D
         LDA   #$0001
         STA   L05529F
         LDA   #$0001
         STA   $53
L0A0EB4  LDA   $53
         BEQ   L0A0EDE
         LDA   #$0001
         STA   L0552B1
         STZ   L0552A9
         LDA   L05529B
         BEQ   L0A0ED5
         LDA   #$0001
         STA   L0552AF
         PEA   $0005
         JSL   L099B9B
         BRA   L0A0EDC
L0A0ED5  PEA   $0004
         JSL   L099B9B
L0A0EDC  BRA   L0A0EEC
L0A0EDE  LDA   $2F
         ORA   $31
         BEQ   L0A0EEC
         PEI   $31
         PEI   $2F
         JSL   L07185A
L0A0EEC  PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         PEA   $0000
         JSL   L1601A8
         LDA   #$0001
         STA   L055137
         LDA   #$0001
         STA   L055133
L0A0F19  TSC
         CLC
         ADC   #$0058
         TCS
         PLD
         RTL

L0A0F21  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L160218
         JSL   L0903F2
         JSL   L160376
         PEA   $0000
         PEA   $0000
         JSL   L090000
         LDA   L055153
         EOR   #$0001
         STA   L055153
         LDA   #$0001
         STA   L0552C1
         LDA   #$0001
         STA   L0552BF
         STZ   L055135
         STZ   L055139
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         PEA   $0000
         JSL   L1601A8
         JSL   L083E9E
         JSL   L087268
         JSL   L160376
         PLY
         PLY
         PLD
         RTL

L0A0F7B  PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         LDA   L055235
         STA   $17
         LDA   L055237
         STA   $15
         LDA   L055239
         STA   $13
         LDA   L05523B
         STA   $11
         LDA   L055287
         STA   $0F
         PHY
         JSL   L099DCE
         PLA
         STA   L055235
         PHY
         JSL   L09771E
         PLA
         STA   L055237
         PHY
         JSL   L090A90
         PLA
         STA   L055239
         PHY
         JSL   L0903C7
         PLA
         STA   L05523B
         LDA   L055237
         AND   L0552FF
         PHA
         LDA   L0552AD
         EOR   #$0001
         AND   $01,S
         PLX
         STA   L055287
         LDA   $17
         CMP   L055235
         BEQ   L0A0FE0
         LDA   #$0001
         STA   L0551EB
L0A0FE0  LDA   L05520D
         STA   $1B
         LDA   L055209
         STA   $1D
         LDA   L05524B
         BEQ   L0A1000
         LDA   #$0013
         STA   $1F
         LDA   L0550ED
         LDX   L0550EF
         STA   $21
         STX   $23
         BRA   L0A1015
L0A1000  PHY
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PEI   $30
         PEI   $2E
         JSL   L150B9A
         PLA
         STA   $1F
L0A1015  STZ   L05520D
         STZ   L055209
         LDA   #$0013
         CMP   $1F
         BNE   L0A1054
         LDA   L0550E1
         LDX   L0550E3
         CMP   $21
         BNE   L0A102E
         CPX   $23
L0A102E  BEQ   L0A1035
         LDA   #$0000
         BRA   L0A1038
L0A1035  LDA   #$0001
L0A1038  STA   L05520D
         LDA   L0550ED
         LDX   L0550EF
         CMP   $21
         BNE   L0A1047
         CPX   $23
L0A1047  BEQ   L0A104E
         LDA   #$0000
         BRA   L0A1051
L0A104E  LDA   #$0001
L0A1051  STA   L055209
L0A1054  LDA   L05520B
         STA   $19
         LDA   L05520D
         STA   L05520B
         LDA   L05520D
         BEQ   L0A109D
         LDA   $2E
         LDX   $30
         STA   $07
         STX   $09
         LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         JSL   L151131
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L150BE8
         PHY
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   ^L053249
         PEA   L053249
         JSL   L1512CB
         PLA
         STA   L05520B
L0A109D  LDA   L0552AD
         STA   $0D
         STZ   L0552AD
         LDA   L055209
         BEQ   L0A10B2
         PEI   $30
         PEI   $2E
         JSL   L160480
L0A10B2  LDA   L054F9F
         BNE   L0A10C7
         PHA
         LDX   #$0000
         LDA   $17
         CMP   L055235
         BEQ   L0A10C3
         INX
L0A10C3  TXA
         ORA   $01,S
         PLX
L0A10C7  PHA
         PLA
         BNE   L0A10DB
         PHA
         LDX   #$0000
         LDA   $15
         CMP   L055237
         BEQ   L0A10D7
         INX
L0A10D7  TXA
         ORA   $01,S
         PLX
L0A10DB  PHA
         PLA
         BNE   L0A10EF
         PHA
         LDX   #$0000
         LDA   $13
         CMP   L055239
         BEQ   L0A10EB
         INX
L0A10EB  TXA
         ORA   $01,S
         PLX
L0A10EF  PHA
         PLA
         BNE   L0A1103
         PHA
         LDX   #$0000
         LDA   $0F
         CMP   L055287
         BEQ   L0A10FF
         INX
L0A10FF  TXA
         ORA   $01,S
         PLX
L0A1103  PHA
         PLA
         BNE   L0A1117
         PHA
         LDX   #$0000
         LDA   $1B
         CMP   L05520D
         BEQ   L0A1113
         INX
L0A1113  TXA
         ORA   $01,S
         PLX
L0A1117  PHA
         PLA
         BNE   L0A112B
         PHA
         LDX   #$0000
         LDA   $1D
         CMP   L055209
         BEQ   L0A1127
         INX
L0A1127  TXA
         ORA   $01,S
         PLX
L0A112B  PHA
         PLA
         BNE   L0A113F
         PHA
         LDX   #$0000
         LDA   $19
         CMP   L05520B
         BEQ   L0A113B
         INX
L0A113B  TXA
         ORA   $01,S
         PLX
L0A113F  CMP   #$0000
         BNE   L0A1152
         LDX   #$0000
         LDA   $0D
         CMP   L0552AD
         BEQ   L0A114F
         INX
L0A114F  TXA
         BEQ   L0A11B9
L0A1152  LDA   #$0004
         STA   $0B
         LDA   L05520B
         BEQ   L0A1161
         LDA   #$0008
         STA   $0B
L0A1161  LDA   L055209
         BEQ   L0A119C
         LDA   L0552A5
         STA   $0B
         LDA   L055287
         BEQ   L0A1175
         LDA   #$000C
         STA   $0B
L0A1175  LDX   #$0000
         LDA   #$0004
         CMP   L0550BB
         BNE   L0A1181
         INX
L0A1181  PHX
         LDX   #$0000
         LDA   #$0005
         CMP   L0550BB
         BNE   L0A118E
         INX
L0A118E  TXA
         ORA   $01,S
         PLX
         AND   L0552AD
         BEQ   L0A119C
         LDA   #$0004
         STA   $0B
L0A119C  LDA   L054F9F
         BEQ   L0A11B0
         LDA   L054FBB
         SEC
         SBC   #$0000
         BMI   L0A11B0
         LDA   #$FFFF
         STA   L054FA1
L0A11B0  STZ   L054F9F
         PEI   $0B
         JSL   L0724F7
L0A11B9  LDA   $2C
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

L0A11CB  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   L0550F3
         PEA   $0002
         LDA   L0552F9
         LDX   L0552FB
         PHX
         PHA
         JSL   L150D44
         PEA   $0002
         LDA   L0552F5
         LDX   L0552F7
         PHX
         PHA
         JSL   L150D44
         PEA   $0002
         LDA   L0552F1
         LDX   L0552F3
         PHX
         PHA
         JSL   L150D44
         PEA   $0002
         LDA   L0552ED
         LDX   L0552EF
         PHX
         PHA
         JSL   L150D44
         PEA   $0002
         LDA   L0552E9
         LDX   L0552EB
         PHX
         PHA
         JSL   L150D44
         PLY
         PLY
         PLD
         RTL

L0A1225  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L055303
         STA   $01
         PHY
         PEI   $0E
         PEA   $0001
         PEA   $0008
         JSL   L071A1B
         PLA
         STA   $03
         LDA   $03
         SEC
         SBC   #$0004
         BEQ   L0A1258
         BVS   L0A124F
         EOR   #$8000
L0A124F  BPL   L0A1258
         LDA   #$00FE
         AND   $03
         STA   $03
L0A1258  LDA   L055303
         CMP   $03
         BEQ   L0A1288
         LDA   $03
         STA   L055303
         LDA   $03
         LSR
         STA   L055301
         PEI   $03
         JSL   L16048E
         LDA   L0550BB
         SEC
         SBC   #$0009
         BVS   L0A127C
         EOR   #$8000
L0A127C  BPL   L0A1288
         JSL   L160226
         LDA   #$0001
         STA   L054F9F
L0A1288  LDA   $0C
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

L0A129A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
L0A12A2  LDA   L0551B1
         ORA   L0551B3
         BEQ   L0A12D7
         LDA   L0551B1
         LDX   L0551B3
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0004
         BCC   L0A12C3
         INX
L0A12C3  STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         JSL   L16049C
         BRA   L0A12A2
L0A12D7  PLY
         PLY
         PLD
         RTL

L0A12DB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         STZ   $14
         STZ   $01
         PHY
         PHY
         PEI   $12
         PEI   $10
         JSL   L0A1421
         PLA
         STA   $03
         PLX
         STX   $05
         LDA   $03
         ORA   $05
         BEQ   L0A1318
         PEI   $05
         PEI   $03
         PEA   $0514
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1604AA
         LDA   $01
         EOR   #$0001
         STA   $14
L0A1318  LDA   $0E
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

L0A132A  ENT
         PHD
         TSC
         CLC
         ADC   #$FEDC
         TCS
         ADC   #$0031
         TCD
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0020
         JSL   L0313BE
         STZ   $FC
         STZ   $FE
         PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         PEA   ^L040AAA
         PEA   L040AAA
         JSL   L071C56
         PLA
         LSR
         BCC   L0A1372
         LDA   L0550E9
         LDX   L0550EB
         STA   $FC
         STX   $FE
         BRL   L0A140F
L0A1372  PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         PEA   ^L040AAF
         PEA   L040AAF
         JSL   L071C56
         PLA
         LSR
         BCC   L0A1396
         LDA   L0550E1
         LDX   L0550E3
         STA   $FC
         STX   $FE
         BRA   L0A140F
L0A1396  PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         PEA   ^L040AB7
         PEA   L040AB7
         JSL   L071C56
         PLA
         LSR
         BCC   L0A13BA
         LDA   L0550E5
         LDX   L0550E7
         STA   $FC
         STX   $FE
         BRA   L0A140F
L0A13BA  PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         PEA   ^L040ABA
         PEA   L040ABA
         JSL   L071C56
         PLA
         LSR
         BCC   L0A13DE
         LDA   L0550DD
         LDX   L0550DF
         STA   $FC
         STX   $FE
         BRA   L0A140F
L0A13DE  PHY
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCF
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072CD4
         JSL   L071C56
         PLA
         LSR
         BCC   L0A140F
         LDA   L0550ED
         LDX   L0550EF
         STA   $FC
         STX   $FE
L0A140F  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$012A
         TCS
         RTL

L0A1421  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   $12
         STZ   $14
         LDX   #$0000
         LDA   L0551B1
         ORA   L0551B3
         BNE   L0A1439
         INX
L0A1439  TXA
         BNE   L0A1449
         LDX   #$0000
         LDA   $0E
         ORA   $10
         BNE   L0A1446
         INX
L0A1446  TXA
         BEQ   L0A144B
L0A1449  BRA   L0A14A0
L0A144B  LDA   L0551B1
         LDX   L0551B3
         STA   $01
         STX   $03
L0A1455  LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0004
         BCC   L0A1464
         INX
L0A1464  STA   $05
         STX   $07
         LDA   $0E
         LDX   $10
         CMP   [$05]
         BNE   L0A1476
         LDY   #$0002
         TXA
         CMP   [$05],Y
L0A1476  BNE   L0A1482
         LDA   $01
         LDX   $03
         STA   $12
         STX   $14
         BRA   L0A14A0
L0A1482  LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $01
         STX   $03
         LDA   $01
         ORA   $03
         BNE   L0A1455
L0A14A0  LDA   $0C
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

L0A14B2  PHD
         TSC
         CLC
         ADC   #$FFBC
         TCS
         TCD
         LDA   L0551B1
         ORA   L0551B3
         BNE   L0A14C5
         BRL   L0A15B8
L0A14C5  PHY
         PHY
         JSL   L151319
         PLA
         STA   $07
         PLX
         STX   $09
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEA   ^L052D64
         PEA   L052D64
         PEA   $002E
         JSL   L0313BE
         STZ   $0B
         LDA   $07
         LDX   $09
         STA   $11
         STX   $13
         STZ   $0D
         STZ   $0F
         LDA   L0551B1
         LDX   L0551B3
         STA   $39
         STX   $3B
L0A14FF  LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $3D
         STX   $3F
         LDY   #$0030
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BEQ   L0A1533
         BVS   L0A1531
         EOR   #$8000
L0A1531  BMI   L0A1538
L0A1533  LDA   #$0000
         BRA   L0A153B
L0A1538  LDA   #$0001
L0A153B  BEQ   L0A15A7
         LDY   #$0034
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L150F53
         PHX
         PHA
         LDA   $07
         LDX   $09
         JSL   L033477
         BEQ   L0A156E
         BVS   L0A1567
         EOR   #$8000
L0A1567  BPL   L0A156E
         LDA   #$0000
         BRA   L0A1571
L0A156E  LDA   #$0001
L0A1571  BEQ   L0A15A7
         LDA   $07
         LDX   $09
         LDY   #$0032
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         PEI   $3B
         PEI   $39
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L1604B8
L0A15A7  LDA   $3D
         LDX   $3F
         STA   $39
         STX   $3B
         LDA   $39
         ORA   $3B
         BEQ   L0A15B8
         BRL   L0A14FF
L0A15B8  TSC
         CLC
         ADC   #$0044
         TCS
         PLD
         RTL

L0A15C0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L054FBB
         BNE   L0A1617
         PHY
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081A64
         PLA
         LSR
         BCS   L0A15E6
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L085216
L0A15E6  LDA   L0550BF
         PHA
         LDX   #$0000
         PLA
         BMI   L0A15F3
         BEQ   L0A15F3
         INX
L0A15F3  TXA
         ORA   L0550BD
         BEQ   L0A1609
         LDAL  L052D62
         PHA
         LDAL  L052D60
         PHA
         JSL   L0872AA
         BRA   L0A1617
L0A1609  PEA   ^L053259
         PEA   L053259
         JSL   L087BAE
         JSL   L083E9E
L0A1617  LDA   L0550BD
         BNE   L0A161F
         STZ   L0550BF
L0A161F  PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0A1625  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L0A3283
         JSL   L0903F2
         PLY
         PLY
         PLD
         RTL

L0A1639  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDAL  L052D34
         BEQ   L0A1680
         PHY
         PEA   ^L052D32
         PEA   L052D32
         PEI   $0A
         JSL   L1602CE
         PLA
         LSR
         BCC   L0A167A
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
         BCS   L0A1676
         PEA   $000E
         JSL   L0727E0
L0A1676  JSL   L14174B
L0A167A  JSL   L09AFB1
         BRA   L0A169B
L0A1680  LDA   L05511F
         BEQ   L0A169B
         PHY
         PEA   ^L05328B
         PEA   L05328B
         PEA   $0001
         JSL   L1602CE
         PLA
         LSR
         BCC   L0A169B
         JSL   L14165A
L0A169B  LDA   $08
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

L0A16AB  PHD
         TSC
         CLC
         ADC   #$FFC2
         TCS
         TCD
         JSL   L090A71
         PHY
         JSL   L095FB4
         PLA
         LSR
         BCS   L0A16CA
         PEA   $0041
         JSL   L0727E0
         BRL   L0A190E
L0A16CA  LDA   L055129
         LDX   L05512B
         STA   $31
         STX   $33
         LDAL  L05328D
         STA   $2F
         LDA   L055447
         LDX   L055449
         STA   $37
         STX   $39
         LDAL  L050062
         STA   $35
         PEI   $39
         PEI   $37
         PEI   $35
         LDA   L05520F
         EOR   #$0001
         PHA
         JSL   L1412EE
         LDA   L055121
         ORA   L055123
         BNE   L0A1706
         BRL   L0A190E
L0A1706  LDA   L055425
         CLC
         ADCL  L052D6E
         STAL  L052D6E
         STZ   $2D
         LDA   $31
         LDX   $33
         CMP   $37
         BNE   L0A171E
         CPX   $39
L0A171E  BNE   L0A1725
         LDA   #$0000
         BRA   L0A1728
L0A1725  LDA   #$0001
L0A1728  PHA
         LDX   #$0000
         LDA   $2F
         CMP   $35
         BEQ   L0A1733
         INX
L0A1733  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0A1745
         LDA   #$0001
         STA   $2D
         LDA   #$0001
         STA   L05511D
L0A1745  LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         LDA   $2D
         BNE   L0A1758
         BRL   L0A1851
L0A1758  LDA   L05520F
         BNE   L0A17A5
         LDAL  L052D6E
         JSL   L150488
         STA   $29
         STX   $2B
         LDAL  L052D70
         JSL   L150488
         STA   $25
         STX   $27
         PHY
         PHY
         PEI   $2B
         PEI   $29
         PEI   $27
         PEI   $25
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150550
         PLA
         STA   $21
         PLX
         STX   $23
         PEI   $23
         PEI   $21
         PEI   $23
         PEI   $21
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150006
L0A17A5  LDA   L055121
         LDX   L055123
         STA   $3B
         STX   $3D
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         STA   $09
         STX   $0B
         LDA   #$0010
         CLC
         ADC   $09
         LDX   $0B
         BCC   L0A17C6
         INX
L0A17C6  STA   $3B
         STX   $3D
         LDY   #$0010
         LDA   #$00FF
         AND   [$09],Y
         AND   #$007F
         SEP   #$20
         STA   [$3B]
         REP   #$20
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150BCA
         LDA   L055121
         LDX   L055123
         STA   $3B
         STX   $3D
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         STA   $05
         STX   $07
         LDY   #$0092
         LDA   [$05],Y
         INY
         INY
         ORA   [$05],Y
         BEQ   L0A1851
         LDY   #$0094
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $3B
         STX   $3D
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         STA   $01
         STX   $03
         LDA   #$0010
         CLC
         ADC   $01
         LDX   $03
         BCC   L0A182D
         INX
L0A182D  STA   $3B
         STX   $3D
         LDY   #$0010
         LDA   #$00FF
         AND   [$01],Y
         AND   #$007F
         SEP   #$20
         STA   [$3B]
         REP   #$20
         LDY   #$0094
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         JSL   L151041
L0A1851  LDA   L055425
         BNE   L0A18AD
         PHY
         PHY
         JSL   L15067D
         PLA
         STA   $15
         PLX
         STX   $17
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $0D
         PLX
         STX   $0F
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $11
         PLX
         STX   $13
         PEA   ^L053291
         PEA   L053291
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         CLC
         ADC   #$0002
         BCC   L0A188F
         INX
L0A188F  PHX
         PHA
         JSL   L0808E0
         PEI   $17
         PEI   $15
         PEI   $13
         PEI   $11
         PEI   $0F
         PEI   $0D
         JSL   L150499
         PEI   $0F
         PEI   $0D
         JSL   L150677
L0A18AD  PEA   ^L052D64
         PEA   L052D64
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150272
         JSL   L0879C5
         LDA   L055425
         BNE   L0A18E0
         PEI   $17
         PEI   $15
         JSL   L150677
         PEI   $0F
         PEI   $0D
         JSL   L151669
         PEI   $13
         PEI   $11
         JSL   L151669
L0A18E0  LDA   L05520F
         EOR   #$0001
         AND   $2D
         BEQ   L0A190E
         PEA   $0004
         LDA   L055129
         LDX   L05512B
         PHX
         PHA
         LDAL  L05328D
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
L0A190E  TSC
         CLC
         ADC   #$003E
         TCS
         PLD
         RTL

L0A1916  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0550B9
         BNE   L0A192A
         PEA   $0001
         JSL   L09091E
L0A192A  LDAL  L052D70
         TAX
         LDAL  L052D6E
         STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150BE8
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L053249
         PEA   L053249
         JSL   L1512CB
         PLA
         LSR
         BCC   L0A198E
         LDA   L0550B9
         BNE   L0A1974
         LDA   L0550BB
         DEC
         BEQ   L0A196E
         PEA   $0001
         JSL   L090635
L0A196E  JSL   L0A3283
         BRA   L0A1978
L0A1974  JSL   L16027A
L0A1978  JSL   L097700
         PEA   ^L052D64
         PEA   L052D64
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L15026C
L0A198E  LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         JSL   L1511C8
         LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         JSL   L09B242
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0A19AC  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   L055229
         DEC
         BNE   L0A19C0
         LDA   L0550BB
         STA   L05544B
L0A19C0  PEA   ^L052D6E
         PEA   L052D6E
         JSL   L150BE8
         LDAL  L052D70
         PHA
         PEA   $001C
         JSL   L1500F5
         PLX
         PLX
         STA   $05
         LDAL  L052D6E
         PHA
         PEA   $000C
         JSL   L1500F5
         PLX
         PLX
         STA   $03
         LDA   #$02BD
         CLC
         ADC   $05
         PHA
         LDA   $03
         PEA   $0003
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $01
         PEA   $02BC
         PEI   $01
         JSL   L09971B
         LDA   L0550E9
         LDX   L0550EB
         PHX
         PHA
         JSL   L1511C8
         LDA   L0550E9
         LDX   L0550EB
         PHX
         PHA
         JSL   L09B242
         LDX   #$0000
         LDA   L0550B9
         DEC
         BNE   L0A1A2C
         INX
L0A1A2C  TXA
         BEQ   L0A1A58
         LDA   L055229
         SEC
         SBC   #$0001
         BEQ   L0A1A3F
         BVS   L0A1A3D
         EOR   #$8000
L0A1A3D  BMI   L0A1A44
L0A1A3F  LDA   #$0000
         BRA   L0A1A47
L0A1A44  LDA   #$0001
L0A1A47  BEQ   L0A1A58
         LDA   $01
         SEC
         SBC   #$02BC
         PHA
         LDA   L05544B
         PHA
         JSL   L1604C6
L0A1A58  PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0A1A5F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L0A20CA
         JSL   L0903F2
         PEA   ^L1604D4
         PEA   L1604D4
         JSL   L07187A
         JSL   L09AE9F
         LDA   #$FFFF
         STA   L0550B9
         PLY
         PLY
         PLD
         RTL

L0A1A87  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         STZ   $20
         STZ   $22
         LDA   L05503D
         BNE   L0A1A9B
         BRL   L0A1B90
L0A1A9B  PHY
         PHY
         LDA   L05503D
         PHA
         JSL   L150BBE
         PLA
         STA   $07
         PLX
         STX   $09
         LDAL  L05565D
         BEQ   L0A1AB4
         BRL   L0A1B90
L0A1AB4  LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STA   $03
         STX   $05
         LDY   #$001E
         LDA   [$03],Y
         STA   $13
         PHY
         PHY
         PHY
         LDA   L05503D
         PHA
         JSL   L151065
         JSL   L075B7B
         PLA
         STA   $0B
         PLX
         STX   $0D
         PEI   $0D
         PEI   $0B
         LDA   #$0020
         CLC
         ADC   $03
         LDX   $05
         BCC   L0A1AEB
         INX
L0A1AEB  PHX
         PHA
         LDA   $13
         JSL   L150488
         TAY
         BNE   L0A1AF7
         DEX
L0A1AF7  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0003
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         JSL   L1512A5
         STA   $0F
         STX   $11
         LDA   $13
         DEC
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L0A1B2E
         EOR   #$8000
L0A1B2E  BPL   L0A1B88
         LDA   #$0001
         STA   $15
L0A1B35  PEI   $11
         PEI   $0F
         LDA   #$0020
         CLC
         ADC   $03
         LDX   $05
         BCC   L0A1B44
         INX
L0A1B44  PHX
         PHA
         LDA   $15
         JSL   L150488
         TAY
         BNE   L0A1B50
         DEX
L0A1B50  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0003
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0004
         BCC   L0A1B6A
         INX
L0A1B6A  STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         JSL   L150F53
         STA   $0F
         STX   $11
         LDA   $15
         CMP   $01
         BEQ   L0A1B88
         INC   $15
         BRA   L0A1B35
L0A1B88  LDA   $0F
         LDX   $11
         STA   $20
         STX   $22
L0A1B90  TSC
         CLC
         ADC   #$001A
         TCS
         PLD
         RTL

L0A1B98  PHD
         TSC
         CLC
         ADC   #$FDCE
         TCS
         ADC   #$013D
         TCD
         LDA   L0551F3
         BEQ   L0A1C1A
         LDA   L055111
         LDX   L055113
         STA   $F1
         STX   $F3
         LDY   #$0002
         LDA   [$F1],Y
         TAX
         LDA   [$F1]
         CLC
         ADC   #$0020
         BCC   L0A1BC1
         INX
L0A1BC1  STA   $F1
         STX   $F3
         LDA   [$F1]
         PHA
         LDA   L055111
         LDX   L055113
         STA   $F1
         STX   $F3
         LDY   #$0002
         LDA   [$F1],Y
         TAX
         LDA   [$F1]
         CLC
         ADC   #$0022
         BCC   L0A1BE1
         INX
L0A1BE1  STA   $F1
         STX   $F3
         PLA
         CMP   [$F1]
         BNE   L0A1BED
         BRL   L0A1F27
L0A1BED  LDA   $FA
         BEQ   L0A1BFF
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150C34
         BRA   L0A1C0B
L0A1BFF  LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L15019D
L0A1C0B  JSL   L150395
         JSL   L15136D
         JSL   L150723
         BRL   L0A1F2B
L0A1C1A  LDA   L05511F
         BNE   L0A1C22
         BRL   L0A1CA2
L0A1C22  TDC
         CLC
         ADC   #$00ED
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150000
         PEI   $EF
         PEI   $ED
         LDA   $E9
         LDX   $EB
         JSL   L033477
         BVS   L0A1C51
         EOR   #$8000
L0A1C51  BPL   L0A1C56
         BRL   L0A1F27
L0A1C56  JSL   L150395
         JSL   L15136D
         LDA   $FA
         BEQ   L0A1C93
         LDA   L055051
         AND   L055245
         BEQ   L0A1C71
         JSL   L0903A6
         BRL   L0A1F2B
L0A1C71  LDAL  L052D40
         AND   #$1000
         BEQ   L0A1C81
         JSL   L0A3283
         BRL   L0A1F2B
L0A1C81  LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L15128D
         JSL   L0879C5
         BRA   L0A1C9F
L0A1C93  LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150FED
L0A1C9F  BRL   L0A1F2B
L0A1CA2  LDAL  L052D34
         BNE   L0A1CAB
         BRL   L0A1F27
L0A1CAB  LDA   #$000F
         ANDL  L052D36
         DEC
         BNE   L0A1CBC
         LDA   #$1602
         STA   $E1
         BRA   L0A1CD1
L0A1CBC  LDA   #$000F
         ANDL  L052D36
         DEC
         DEC
         BNE   L0A1CCE
         LDA   #$1603
         STA   $E1
         BRA   L0A1CD1
L0A1CCE  BRL   L0A1F27
L0A1CD1  PHY
         PHY
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         JSL   L07B168
         PLA
         STA   $E3
         PLX
         STX   $E5
         LDA   $E3
         ORA   $E5
         BNE   L0A1CF3
         BRL   L0A1F27
L0A1CF3  JSL   L150395
         JSL   L15136D
         PEI   $E5
         PEI   $E3
         JSL   L0718BF
         PHY
         LDY   #$0002
         LDA   [$E3],Y
         TAX
         LDA   [$E3]
         STA   $F1
         STX   $F3
         LDA   [$F1]
         JSL   L150488
         PHX
         PHA
         PEI   $E1
         LDY   #$0002
         LDA   [$E3],Y
         PHA
         LDA   [$E3]
         PHA
         JSL   L0732FD
         PLA
         STA   $E7
         PEI   $E5
         PEI   $E3
         JSL   L07185A
         LDA   #$1603
         CMP   $E1
         BEQ   L0A1D3C
         BRL   L0A1E4E
L0A1D3C  LDAL  L052D34
         STA   $D3
         LDA   L05501F
         LDX   L055021
         CMP   L0551F5
         BNE   L0A1D50
         CPX   L0551F7
L0A1D50  BEQ   L0A1D57
         LDA   #$0000
         BRA   L0A1D5A
L0A1D57  LDA   #$0001
L0A1D5A  STA   $D1
         LDA   $D1
         BNE   L0A1D68
         LDA   $D3
         EOR   #$FFFF
         INC
         STA   $D3
L0A1D68  LDA   #$4000
         ANDL  L052D36
         BEQ   L0A1D74
         LDA   #$0001
L0A1D74  AND   $D1
         STA   $CF
         STZ   $C3
         STZ   $C5
         STZ   $C7
         STZ   $C9
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $C3
         PLX
         STX   $C5
         PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $C7
         PLX
         STX   $C9
         LDA   $C3
         ORA   $C5
         BEQ   L0A1DB1
         LDA   #$0001
L0A1DB1  PHA
         LDA   $C7
         ORA   $C9
         BEQ   L0A1DBB
         LDA   #$0001
L0A1DBB  AND   $01,S
         PLX
         LSR
         BCC   L0A1E24
         PHY
         PEI   $C5
         PEI   $C3
         JSL   L0718FA
         PLA
         STA   $D7
         PHY
         PEI   $C9
         PEI   $C7
         JSL   L0718FA
         PLA
         STA   $D5
         PHY
         PHY
         PEI   $C5
         PEI   $C3
         PEI   $C9
         PEI   $C7
         PEI   $D3
         PEI   $CF
         JSL   L07B038
         PLA
         STA   $CB
         PLX
         STX   $CD
         LDA   $CB
         ORA   $CD
         BEQ   L0A1E10
         PHY
         PHY
         PHY
         PEI   $CD
         PEI   $CB
         JSL   L071C98
         PEA   $0000
         PEI   $CD
         PEI   $CB
         JSL   L0732FD
         PLA
         STA   $E7
L0A1E10  PEI   $C5
         PEI   $C3
         PEI   $D7
         JSL   L0718DA
         PEI   $C9
         PEI   $C7
         PEI   $D5
         JSL   L0718DA
L0A1E24  LDA   $C7
         ORA   $C9
         BEQ   L0A1E39
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
L0A1E39  LDA   $C3
         ORA   $C5
         BEQ   L0A1E4E
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L0A1E4E  LDA   #$1602
         CMP   $E1
         BEQ   L0A1E58
         BRL   L0A1F1D
L0A1E58  LDAL  L052D44
         TAX
         LDAL  L052D42
         STA   $DD
         STX   $DF
         LDA   $DD
         ORA   $DF
         BNE   L0A1E6E
         BRL   L0A1F1D
L0A1E6E  PHY
         PHY
         PEA   $8001
         PEI   $DF
         PEI   $DD
         JSL   L15041C
         PLA
         STA   $D9
         PLX
         STX   $DB
         LDAL  L05565D
         BEQ   L0A1E8A
         BRL   L0A1F1D
L0A1E8A  PHY
         PEI   $DB
         PEI   $D9
         JSL   L0718FA
         PLA
         STA   $D7
         PHY
         PHY
         PHY
         PEI   $DB
         PEI   $D9
         JSL   L151301
         PEA   $8001
         LDY   #$0002
         LDA   [$D9],Y
         PHA
         LDA   [$D9]
         PHA
         JSL   L0732FD
         PLA
         STA   $E7
         PEI   $DB
         PEI   $D9
         PEI   $D7
         JSL   L0718DA
         PEA   $0002
         PEA   $8001
         PEI   $DF
         PEI   $DD
         JSL   L1510BF
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC3
         PHA
         PEA   $8001
         PEI   $DF
         PEI   $DD
         JSL   L070F7D
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FFC3
         AND   $00,X
         BEQ   L0A1F1D
         PHY
         LDA   #$00FF
         LDX   #$FFC3
         AND   $00,X
         INC
         JSL   L150488
         PHX
         PHA
         PEA   $8006
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC3
         PHA
         JSL   L0732FD
         PLA
         STA   $E7
L0A1F1D  LDA   $FA
         BEQ   L0A1F25
         JSL   L0A21A2
L0A1F25  BRA   L0A1F2B
L0A1F27  JSL   L072314
L0A1F2B  LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$0236
         TCS
         RTL

L0A1F3D  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L0551B7
         STA   $01
L0A1F4A  PEI   $01
         JSL   L151361
         LDA   #$0100
         CLC
         ADC   $01
         STA   $01
         LDA   #$1000
         CLC
         ADC   L054FBF
         CMP   $01
         BNE   L0A1F4A
         PLY
         PLY
         PLY
         PLD
         RTL

L0A1F68  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PEA   $0001
         JSL   L090635
         JSL   L0952F7
         PEA   ^L1604D4
         PEA   L1604D4
         JSL   L07187A
         JSL   L09AE9F
         LDA   L055051
         BNE   L0A1F9C
         JSL   L0903F2
         PEA   $0000
         PEA   $0001
         JSL   L090000
L0A1F9C  PHY
         PEA   ^L04021F
         PEA   L04021F
         JSL   L0946A2
         PLA
         LSR
         BCS   L0A1FBA
         PHY
         PHY
         PEA   $0852
         JSL   L0711EB
         JSL   L07010A
         BRA   L0A2023
L0A1FBA  LDA   $0C
         DEC
         BMI   L0A2005
         CMP   #$0003
         BPL   L0A2005
         SEC
         SBC   #$0000
         BEQ   L0A1FD2
         DEC
         BEQ   L0A1FDF
         DEC
         BEQ   L0A1FF2
         BRA   L0A2005
L0A1FD2  PHY
         PEA   $0081
         JSL   L1604E2
         PLA
         STA   $01
         BRA   L0A2005
L0A1FDF  PHY
         PEA   $0002
         PEA   $0000
         PEA   $0000
         JSL   L1604F0
         PLA
         STA   $01
         BRA   L0A2005
L0A1FF2  PHY
         PEA   $00C2
         PEA   $0000
         PEA   $0000
         JSL   L1604F0
         PLA
         STA   $01
         BRA   L0A2005
L0A2005  PEA   ^L053259
         PEA   L053259
         JSL   L086C8B
         PEA   ^L1604F0
         PEA   L1604F0
         JSL   L07187A
         PEA   ^L1604E2
         PEA   L1604E2
         JSL   L07187A
L0A2023  LDA   $0A
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

L0A2034  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   $18
         LDA   L055153
         BNE   L0A2071
         LDA   L055027
         LDX   L055029
         STA   [$0E]
         TXA
         LDY   #$0002
         STA   [$0E],Y
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEI   $16
         PEI   $14
         PEI   $12
         PEI   $0C
         PEI   $0A
         JSL   L07920F
         PLA
         LSR
         BCC   L0A2071
         BRA   L0A20B8
L0A2071  LDA   L05501F
         LDX   L055021
         STA   [$0E]
         TXA
         LDY   #$0002
         STA   [$0E],Y
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEI   $16
         PEI   $14
         PEI   $12
         PEI   $0C
         PEI   $0A
         JSL   L07920F
         PLA
         LSR
         BCC   L0A209C
         BRA   L0A20B8
L0A209C  LDA   #$0000
         TAX
         STA   [$0E]
         TXA
         LDY   #$0002
         STA   [$0E],Y
         PEI   $0C
         PEI   $0A
         PEA   $0000
         PEA   $002A
         JSL   L071EC5
         STZ   $18
L0A20B8  LDA   $08
         STA   $16
         LDA   $07
         STA   $15
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

L0A20CA  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L050036
         PEA   L050036
         PEA   $0000
         PEA   $002A
         JSL   L071EC5
         STZ   L055437
         STZ   L055439
         STZ   L055433
         STZ   L055435
         STZ   L05542F
         STZ   L055431
         LDA   L05542B
         ORA   L05542D
         BEQ   L0A210E
         LDA   L05542B
         LDX   L05542D
         PHX
         PHA
         JSL   L072634
         STZ   L05542B
         STZ   L05542D
L0A210E  PLY
         PLY
         PLD
         RTL

L0A2112  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   ^L04025B
         PEA   L04025B
         JSL   L0946A2
         PLA
         LSR
         BCC   L0A2130
         LDA   #$0001
         STA   $0A
         BRA   L0A2139
L0A2130  PEA   $0035
         JSL   L0727E0
         STZ   $0A
L0A2139  PLY
         PLY
         PLD
         RTL

L0A213D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L0860E5
         JSL   L0A3283
         PEI   $0A
         JSL   L1415AA
         LDX   #$0000
         LDA   $0A
         DEC
         BNE   L0A215C
         INX
L0A215C  TXA
         AND   L055153
         BEQ   L0A2166
         JSL   L140E96
L0A2166  LDA   $08
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

L0A2176  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0E
         LDA   L055051
         AND   L055245
         BEQ   L0A2191
         JSL   L0903A6
         LDA   #$0001
         STA   $0E
L0A2191  LDA   $08
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

L0A21A2  PHD
         TSC
         CLC
         ADC   #$FFCE
         TCS
         TCD
         LDAL  L052D34
         BNE   L0A21B3
         BRL   L0A2367
L0A21B3  PHY
         PEA   $0000
         PHD
         JSL   L0A2176
         PLA
         LSR
         BCC   L0A21C3
         BRL   L0A241A
L0A21C3  LDA   #$0011
         STA   $17
         LDA   #$000F
         ANDL  L052D36
         DEC
         DEC
         BEQ   L0A21D6
         BRL   L0A230C
L0A21D6  LDA   #$0012
         STA   $17
         LDA   L05501F
         LDX   L055021
         CMP   L0551F5
         BNE   L0A21E9
         CPX   L0551F7
L0A21E9  BEQ   L0A21EE
         BRL   L0A230C
L0A21EE  STZ   $1F
         STZ   $21
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $23
         PLX
         STX   $25
         LDA   $23
         ORA   $25
         BEQ   L0A223A
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         CLC
         ADC   #$0014
         BCC   L0A221B
         INX
L0A221B  STA   $2F
         STX   $31
         LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         STA   $1F
         STX   $21
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L0A223A  PEI   $21
         PEI   $1F
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BNE   L0A224D
         BRL   L0A230C
L0A224D  BVS   L0A2252
         EOR   #$8000
L0A2252  BMI   L0A2257
         BRL   L0A230C
L0A2257  PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEI   $21
         PEI   $1F
         JSL   L07346C
         PEA   ^L040292
         PEA   L040292
         PEA   ^L040293
         PEA   L040293
         PEA   ^L040294
         PEA   L040294
         JSL   L073C22
         PHY
         JSL   L0727BF
         PLA
         STA   $15
         PHY
         PHY
         PEA   $08FC
         JSL   L072834
         PLA
         STA   $1B
         PLX
         STX   $1D
         PEI   $1D
         PEI   $1B
         PEA   $0003
         JSL   L073D2E
         PEI   $1D
         PEI   $1B
         JSL   L15102F
L0A22A8  PHY
         PEA   $0000
         JSL   L0736C8
         PLA
         STA   $19
         LDX   #$0000
         LDA   $19
         DEC
         BNE   L0A22BC
         INX
L0A22BC  PHX
         LDX   #$0000
         LDA   $19
         DEC
         DEC
         BNE   L0A22C7
         INX
L0A22C7  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0A22A8
         LDA   #$FFFF
         CMP   $19
         BNE   L0A22F6
         PEA   $0001
         PEI   $1D
         PEI   $1B
         PEA   $0001
         JSL   L072E7C
         PEA   $0000
         PEI   $1D
         PEI   $1B
         PEA   $0000
         JSL   L072E7C
         LDA   #$0001
         STA   $19
L0A22F6  PEI   $1D
         PEI   $1B
         JSL   L072634
         PEI   $15
         JSL   L0724F7
         LDA   $19
         DEC
         BNE   L0A230C
         BRL   L0A241A
L0A230C  PEI   $17
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
         LDA   L0551F5
         LDX   L0551F7
         PHX
         PHA
         LDAL  L052D34
         PHA
         JSL   L0B878F
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
         BCS   L0A235A
         JSL   L072314
L0A235A  PEA   ^L052D38
         PEA   L052D38
         JSL   L086CDB
         BRL   L0A2416
L0A2367  LDA   L05511F
         BEQ   L0A239A
         PHY
         PEA   $0000
         PHD
         JSL   L0A2176
         PLA
         LSR
         BCC   L0A237C
         BRL   L0A241A
L0A237C  LDAL  L052D40
         AND   #$1000
         BEQ   L0A2388
         BRL   L0A2416
L0A2388  LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L15013E
         JSL   L0879C5
         BRA   L0A2416
L0A239A  LDA   L0551F3
         BEQ   L0A240E
         LDA   L055111
         LDX   L055113
         STA   $2F
         STX   $31
         LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         CLC
         ADC   #$0020
         BCC   L0A23B8
         INX
L0A23B8  STA   $2F
         STX   $31
         LDA   [$2F]
         PHA
         LDA   L055111
         LDX   L055113
         STA   $2F
         STX   $31
         LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         CLC
         ADC   #$0022
         BCC   L0A23D8
         INX
L0A23D8  STA   $2F
         STX   $31
         PLA
         CMP   [$2F]
         BEQ   L0A23EF
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L15058C
         BRA   L0A240C
L0A23EF  PEA   ^L053251
         PEA   L053251
         PEA   $0000
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L151651
         JSL   L09B1FE
         JSL   L097700
L0A240C  BRA   L0A2416
L0A240E  PHY
         JSL   L0961E7
         PLA
         STA   $27
L0A2416  JSL   L0A3283
L0A241A  TSC
         CLC
         ADC   #$0032
         TCS
         PLD
         RTL

L0A2422  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FB5
         BNE   L0A2436
         JSL   L072314
         BRL   L0A24E7
L0A2436  LDA   L0550BB
         DEC
         BEQ   L0A2440
         JSL   L090A71
L0A2440  JSL   L093A99
         PHY
         JSL   L090A90
         PHY
         JSL   L09771E
         PLA
         STA   $01
         PLA
         AND   $01
         BEQ   L0A2459
         BRL   L0A24E7
L0A2459  LDA   L0550BB
         SEC
         SBC   #$0003
         BEQ   L0A246B
         BVS   L0A2467
         EOR   #$8000
L0A2467  BPL   L0A246B
         BRA   L0A24E7
L0A246B  LDA   L0550BB
         SEC
         SBC   #$0001
         BEQ   L0A2486
         BVS   L0A2479
         EOR   #$8000
L0A2479  BPL   L0A2486
         PHY
         JSL   L0A2112
         PLA
         LSR
         BCS   L0A2486
         BRA   L0A24E7
L0A2486  LDA   L0550BB
         DEC
         BMI   L0A24E7
         CMP   #$0003
         BPL   L0A24E7
         SEC
         SBC   #$0000
         BEQ   L0A249F
         DEC
         BEQ   L0A24B3
         DEC
         BEQ   L0A24CD
         BRA   L0A24E7
L0A249F  LDA   L055211
         ORA   L05520F
         BEQ   L0A24AD
         JSL   L0A16AB
         BRA   L0A24B1
L0A24AD  JSL   L070182
L0A24B1  BRA   L0A24E7
L0A24B3  LDA   L055233
         BEQ   L0A24C4
         PEA   $0001
         PEA   $0001
         JSL   L1604D4
         BRA   L0A24CB
L0A24C4  PEA   $0001
         JSL   L1604FE
L0A24CB  BRA   L0A24E7
L0A24CD  LDA   L055233
         BEQ   L0A24DE
         PEA   $0002
         PEA   $0001
         JSL   L1604D4
         BRA   L0A24E5
L0A24DE  PEA   $0002
         JSL   L1604FE
L0A24E5  BRA   L0A24E7
L0A24E7  PLY
         PLY
         PLD
         RTL

L0A24EB  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   #$0005
         CMPL  L052D64
         BNE   L0A24FC
L0A24FC  JSL   L0860E5
         JSL   L14092D
         PHY
         JSL   L09951E
         PLA
         LSR
         BCC   L0A2510
         BRL   L0A266B
L0A2510  LDA   L055227
         DEC
         DEC
         BPL   L0A251A
         BRL   L0A2663
L0A251A  CMP   #$0011
         BMI   L0A2522
         BRL   L0A2663
L0A2522  SEC
         SBC   #$0000
         BEQ   L0A2551
         DEC
         BEQ   L0A257B
         DEC
         BEQ   L0A257B
         SEC
         SBC   #$0007
         BEQ   L0A25A4
         DEC
         BEQ   L0A2561
         DEC
         DEC
         DEC
         BNE   L0A253F
         BRL   L0A2634
L0A253F  DEC
         BEQ   L0A256E
         DEC
         BNE   L0A2548
         BRL   L0A264B
L0A2548  DEC
         BNE   L0A254E
         BRL   L0A2657
L0A254E  BRL   L0A2663
L0A2551  LDA   L05522F
         AND   L055233
         BEQ   L0A255C
         BRL   L0A2667
L0A255C  BRA   L0A2561
         BRL   L0A2665
L0A2561  PEA   $0258
         PEA   $0259
         JSL   L09971B
         BRL   L0A2665
L0A256E  PEA   $0258
         PEA   $025B
         JSL   L09971B
         BRL   L0A2665
L0A257B  LDA   L0551FB
         SEC
         SBC   #$0002
         BEQ   L0A2597
         BVS   L0A2589
         EOR   #$8000
L0A2589  BPL   L0A2597
         PEA   $01F4
         PEA   $01FD
         JSL   L09971B
         BRA   L0A25A1
L0A2597  PEA   $0514
         PEA   $051D
         JSL   L09971B
L0A25A1  BRL   L0A2665
L0A25A4  LDA   #$0001
         STA   $01
         LDA   L0551FB
         SEC
         SBC   #$0004
         BVS   L0A25B5
         EOR   #$8000
L0A25B5  BMI   L0A25BC
         LDA   #$0000
         BRA   L0A25BF
L0A25BC  LDA   #$0001
L0A25BF  PHA
         LDAL  L052D6C
         PHA
         LDAL  L052D6A
         PHA
         LDA   L05521D
         LDX   L05521F
         JSL   L1512A5
         PHX
         PHA
         LDA   #$001E
         LDX   #$0000
         JSL   L033477
         BVS   L0A25E5
         EOR   #$8000
L0A25E5  BPL   L0A25EC
         LDA   #$0000
         BRA   L0A25EF
L0A25EC  LDA   #$0001
L0A25EF  AND   $01,S
         PLX
         PHA
         LDA   L0550BB
         SEC
         SBC   #$0003
         BVS   L0A25FF
         EOR   #$8000
L0A25FF  BPL   L0A2606
         LDA   #$0000
         BRA   L0A2609
L0A2606  LDA   #$0001
L0A2609  AND   $01,S
         PLX
         LSR
         BCC   L0A2615
         LDA   L0550BB
         INC
         STA   $01
L0A2615  LDAL  L052D6C
         TAX
         LDAL  L052D6A
         STA   L05521D
         STX   L05521F
         PEA   $02BC
         LDA   #$02BC
         CLC
         ADC   $01
         PHA
         JSL   L09971B
         BRA   L0A2665
L0A2634  LDA   L055145
         BEQ   L0A2642
         PEA   $001E
         JSL   L0998B0
         BRA   L0A2649
L0A2642  PEA   $001F
         JSL   L0998B0
L0A2649  BRA   L0A2665
L0A264B  PEA   $0320
         PEA   $0328
         JSL   L09971B
         BRA   L0A2665
L0A2657  PEA   $0320
         PEA   $0327
         JSL   L09971B
         BRA   L0A2665
L0A2663  BRA   L0A2667
L0A2665  BRA   L0A266B
L0A2667  JSL   L093031
L0A266B  PLY
         PLY
         PLY
         PLD
         RTL

L0A2670  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD2
         TCS
         TCD
         PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L0A26CE
         LDA   L0550B9
         BNE   L0A26A8
         LDX   #$0000
         LDA   #$000F
         ANDL  L052D36
         DEC
         DEC
         BEQ   L0A2695
         INX
L0A2695  PHX
         LDA   L05511F
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L0A26A8
         LDA   #$0001
         STA   L054FB1
L0A26A8  LDA   L0550B9
         DEC
         BNE   L0A26CE
         LDA   L055319
         EOR   #$0001
         PHA
         LDX   #$0000
         LDA   L055315
         ORA   L055317
         BNE   L0A26C1
         INX
L0A26C1  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0A26CE
         LDA   #$0001
         STA   L054FB1
L0A26CE  LDA   L054FB1
         BEQ   L0A2703
         PHY
         PEA   $100E
         PEA   $0000
         JSL   L150B28
         PLA
         STA   $29
         JSL   L0B8C8B
         STZ   L054FB1
         LDA   L054FB7
         LDX   L054FB9
         STA   $2B
         STX   $2D
         LDY   #$0002
         LDA   [$2B],Y
         TAX
         LDA   [$2B]
         STA   L054FA9
         STX   L054FAB
         BRL   L0A2C5F
L0A2703  LDA   L0550B9
         BNE   L0A2720
         LDA   L054FB5
         BEQ   L0A271E
         LDAL  L052D70
         PHA
         LDAL  L052D6E
         PHA
         PEA   $0000
         JSL   L140EDD
L0A271E  BRA   L0A2737
L0A2720  LDA   L054FB5
         BEQ   L0A2733
         LDAL  L052D70
         PHA
         LDAL  L052D6E
         PHA
         JSL   L0A0F7B
L0A2733  JSL   L16050C
L0A2737  LDA   #$0200
         ANDL  L052D72
         BEQ   L0A2743
         LDA   #$0001
L0A2743  STA   L05522F
         LDA   #$0100
         ANDL  L052D72
         BEQ   L0A2752
         LDA   #$0001
L0A2752  STA   L055233
         LDA   #$0800
         ANDL  L052D72
         BEQ   L0A2761
         LDA   #$0001
L0A2761  STA   L055231
         LDAL  L052D64
         DEC
         BPL   L0A276E
         BRL   L0A2C5F
L0A276E  CMP   #$0008
         BMI   L0A2776
         BRL   L0A2C5F
L0A2776  SEC
         SBC   #$0000
         BEQ   L0A279A
         DEC
         DEC
         BNE   L0A2783
         BRL   L0A2BCB
L0A2783  DEC
         DEC
         BNE   L0A278A
         BRL   L0A2BCB
L0A278A  DEC
         BNE   L0A2790
         BRL   L0A2C4F
L0A2790  DEC
         DEC
         BNE   L0A2797
         BRL   L0A2C25
L0A2797  BRL   L0A2C5F
L0A279A  JSL   L0860E5
         LDA   L05524B
         EOR   #$0001
         PHA
         LDA   L055243
         EOR   #$0001
         AND   $01,S
         PLX
         STA   L055245
         LDA   L05524B
         BEQ   L0A27CD
         LDA   #$0013
         STA   $27
         LDA   L0550ED
         LDX   L0550EF
         STA   $23
         STX   $25
         STZ   L055247
         STZ   L055249
         BRA   L0A27E8

*

L0A27CD  PHY
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         LDAL  L052D70
         PHA
         LDAL  L052D6E
         PHA
         JSL   L150B9A
         PLA
         STA   $27
L0A27E8  LDAL  L052D6C
         PHA
         LDAL  L052D6A
         PHA
         LDA   L05522B
         LDX   L05522D
         CLC
         ADC   #$001E
         BCC   L0A27FF
         INX
L0A27FF  JSL   L033477
         BVS   L0A2808
         EOR   #$8000
L0A2808  BPL   L0A280F
         LDA   #$0000
         BRA   L0A2812
L0A280F  LDA   #$0001
L0A2812  PHA
         PHY
         LDAL  L052D70
         PHA
         LDAL  L052D6E
         PHA
         LDAL  L052D62
         PHA
         LDAL  L052D60
         PHA
         PEA   $0004
         JSL   L071984
         PLA
         STA   $2B
         PLA
         AND   $2B
         BEQ   L0A2840
         LDA   L055229
         INC
         STA   L055229
         BRA   L0A2846
L0A2840  LDA   #$0001
         STA   L055229
L0A2846  LDAL  L052D6C
         TAX
         LDAL  L052D6A
         STA   L05522B
         STX   L05522D
         LDAL  L052D70
         TAX
         LDAL  L052D6E
         STAL  L052D60
         TXA
         STAL  L052D62
         LDA   L055249
         BEQ   L0A2881
         LDA   L055229
         SEC
         SBC   #$0001
         BEQ   L0A287E
         BVS   L0A287A
         EOR   #$8000
L0A287A  BPL   L0A287E
         STZ   $27
L0A287E  STZ   L055249
L0A2881  LDA   L0550B9
         DEC
         BNE   L0A28AF
         LDA   L055247
         BEQ   L0A2892
         LDA   #$0001
         STA   L055229
L0A2892  LDA   L055229
         SEC
         SBC   #$0001
         BEQ   L0A28A2
         BVS   L0A28A0
         EOR   #$8000
L0A28A0  BMI   L0A28A7
L0A28A2  LDA   #$0000
         BRA   L0A28AA
L0A28A7  LDA   #$0001
L0A28AA  STA   L055247
         BRA   L0A28B2
L0A28AF  STZ   L055247
L0A28B2  LDA   $27
         BPL   L0A28C9
         PEA   ^L052D64
         PEA   L052D64
         PEI   $25
         PEI   $23
         PEI   $27
         JSL   L150568
         BRL   L0A2BC5
L0A28C9  LDA   $27
         SEC
         SBC   #$0011
         BPL   L0A28D4
         BRL   L0A2BC5
L0A28D4  CMP   #$0006
         BMI   L0A28DC
         BRL   L0A2BC5
L0A28DC  SEC
         SBC   #$0000
         BEQ   L0A28F9
         DEC
         DEC
         BNE   L0A28E9
         BRL   L0A2AC5
L0A28E9  DEC
         BNE   L0A28EF
         BRL   L0A2A9C
L0A28EF  DEC
         DEC
         BNE   L0A28F6
         BRL   L0A2A4A
L0A28F6  BRL   L0A2BC5
L0A28F9  PHY
         JSL   L0727BF
         PLA
         STA   $0F
         PHY
         JSL   L090A90
         PLA
         STA   $15
         LDA   L0551FB
         SEC
         SBC   #$0004
         BVS   L0A2915
         EOR   #$8000
L0A2915  BPL   L0A291C
         LDA   #$0000
         BRA   L0A291F
L0A291C  LDA   #$0001
L0A291F  AND   $15
         PHA
         LDX   #$0000
         LDA   L0550B9
         BNE   L0A292B
         INX
L0A292B  TXA
         AND   $01,S
         PLX
         STA   $17
         LDA   $17
         BEQ   L0A294D
         LDAL  L052CE8
         PHA
         LDAL  L052CE6
         PHA
         PEA   $04B0
         JSL   L150671
         PEA   $04B0
         JSL   L1512C5
L0A294D  LDA   $15
         BEQ   L0A299A
         LDAL  L052CF0
         TAX
         LDAL  L052CEE
         STA   $2B
         STX   $2D
         LDY   #$0002
         LDA   [$2B],Y
         TAX
         LDA   [$2B]
         STA   $05
         STX   $07
         LDY   #$000A
         LDA   #$0010
         ORA   [$05],Y
         AND   #$FFF7
         LDY   #$000A
         STA   [$05],Y
         LDA   #L0943D4
         LDX   #^L0943D4
         LDY   #$0006
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         LDA   #$0000
         LDY   #$0002
         STA   [$05],Y
         LDA   #$0000
         LDY   #$0004
         STA   [$05],Y
L0A299A  LDA   $15
         ORA   $17
         BEQ   L0A29A8
         PHY
         JSL   L1503A7
         PLA
         STA   $13
L0A29A8  STZ   L0551ED
         JSL   L0904A1
         PEA   ^L052D64
         PEA   L052D64
         PEA   $0000
         PEA   $0000
         JSL   L150377
         LDAL  L052D76
         STA   $19
         LDAL  L052D74
         STA   $1B
         PEI   $19
         PEI   $1B
         JSL   L0904BC
         LDA   $1B
         BEQ   L0A29E8
         PEI   $19
         PEI   $1B
         JSL   L09971B
         PEA   $0000
         PEI   $19
         JSL   L1505B0
L0A29E8  LDA   $15
         BEQ   L0A2A3F
         LDAL  L052CF0
         TAX
         LDAL  L052CEE
         STA   $2B
         STX   $2D
         LDY   #$0002
         LDA   [$2B],Y
         TAX
         LDA   [$2B]
         STA   $01
         STX   $03
         LDY   #$000A
         LDA   #$0008
         ORA   [$01],Y
         AND   #$FFEF
         LDY   #$000A
         STA   [$01],Y
         LDA   #$0000
         TAX
         LDY   #$0006
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0000
         LDY   #$0002
         STA   [$01],Y
         LDA   #$0000
         LDY   #$0004
         STA   [$01],Y
         LDA   $17
         BNE   L0A2A3F
         PHY
         JSL   L1503A7
         PLA
         STA   $13
L0A2A3F  LDA   $17
         BEQ   L0A2A47
         JSL   L09B058
L0A2A47  BRL   L0A2BC5
L0A2A4A  PHY
         LDAL  L052D70
         PHA
         LDAL  L052D6E
         PHA
         PEI   $25
         PEI   $23
         JSL   L1510D1
         PLA
         LSR
         BCC   L0A2A99
         LDA   L05542B
         LDX   L05542D
         CMP   $23
         BNE   L0A2A6D
         CPX   $25
L0A2A6D  BNE   L0A2A75
         JSL   L0A20CA
         BRA   L0A2A99
L0A2A75  PHY
         PHY
         PEI   $25
         PEI   $23
         JSL   L0A1421
         PLA
         PLX
         STX   $2B
         ORA   $2B
         BEQ   L0A2A91
         PEI   $25
         PEI   $23
         JSL   L16049C
         BRA   L0A2A99
L0A2A91  PEI   $25
         PEI   $23
         JSL   L09A5A7
L0A2A99  BRL   L0A2BC5
L0A2A9C  PEA   $0000
         LDAL  L052D70
         PHA
         LDAL  L052D6E
         PHA
         PEA   $0008
         PEA   $0000
         PEA   $0000
         PEI   $25
         PEI   $23
         JSL   L150266
         PEI   $25
         PEI   $23
         JSL   L1511C8
         BRL   L0A2BC5
L0A2AC5  PEI   $25
         PEI   $23
         JSL   L151131
         LDA   L0550ED
         LDX   L0550EF
         CMP   $23
         BNE   L0A2AD9
         CPX   $25
L0A2AD9  BNE   L0A2AED
         LDA   L0550B9
         BNE   L0A2AE6
         JSL   L0A2422
         BRA   L0A2AEA
L0A2AE6  JSL   L16051A
L0A2AEA  BRL   L0A2BC3
L0A2AED  LDA   L0550E5
         LDX   L0550E7
         CMP   $23
         BNE   L0A2AF9
         CPX   $25
L0A2AF9  BNE   L0A2B02
         JSL   L090752
         BRL   L0A2BC3
L0A2B02  LDA   L0550E1
         LDX   L0550E3
         CMP   $23
         BNE   L0A2B0E
         CPX   $25
L0A2B0E  BNE   L0A2B17
         JSL   L0A1916
         BRL   L0A2BC3
L0A2B17  LDA   L0550E9
         LDX   L0550EB
         CMP   $23
         BNE   L0A2B23
         CPX   $25
L0A2B23  BNE   L0A2B2C
         JSL   L0A19AC
         BRL   L0A2BC3
L0A2B2C  LDA   L0550DD
         LDX   L0550DF
         CMP   $23
         BNE   L0A2B38
         CPX   $25
L0A2B38  BNE   L0A2B5A
         LDA   L0550B9
         DEC
         BNE   L0A2B54
         LDA   L055229
         SEC
         SBC   #$0001
         BEQ   L0A2B54
         BVS   L0A2B4E
         EOR   #$8000
L0A2B4E  BPL   L0A2B54
         JSL   L160376
L0A2B54  JSL   L090898
         BRA   L0A2BC3
L0A2B5A  LDA   L05542B
         LDX   L05542D
         CMP   $23
         BNE   L0A2B66
         CPX   $25
L0A2B66  BNE   L0A2B6E
         JSL   L160528
         BRA   L0A2BC3
L0A2B6E  LDA   L0550D9
         LDX   L0550DB
         CMP   $23
         BNE   L0A2B7A
         CPX   $25
L0A2B7A  BNE   L0A2B82
         JSL   L1603A0
         BRA   L0A2BC3
L0A2B82  PHY
         PHY
         PEI   $25
         PEI   $23
         JSL   L0A1421
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   $09
         ORA   $0B
         BEQ   L0A2BC3
         PEI   $0B
         PEI   $09
         PEA   ^L052D64
         PEA   L052D64
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L1604B8
         PEI   $25
         PEI   $23
         JSL   L1511C8
L0A2BC3  BRA   L0A2BC5
L0A2BC5  STZ   L055245
         BRL   L0A2C5F
L0A2BCB  LDA   L054FB5
         BEQ   L0A2C23
         PHY
         LDAL  L052D66
         PHA
         JSL   L094ECD
         PLA
         STA   L055227
         LDAL  L052D66
         AND   #$00FF
         STA   L055225
         LDA   L05524B
         EOR   #$0001
         PHA
         LDA   L055243
         EOR   #$0001
         AND   $01,S
         PLX
         STA   L055245
         LDA   L055233
         BEQ   L0A2C11
         LDA   L0550B9
         BNE   L0A2C0B
         JSL   L0A24EB
         BRA   L0A2C0F
L0A2C0B  JSL   L0A0347
L0A2C0F  BRA   L0A2C20
L0A2C11  LDA   L0550B9
         BNE   L0A2C1C
         JSL   L0A3402
         BRA   L0A2C20
L0A2C1C  JSL   L0A0810
L0A2C20  STZ   L055245
L0A2C23  BRA   L0A2C5F
L0A2C25  LDA   #$0003
         ANDL  L052D72
         STA   $0D
         LDA   $0D
         DEC
         BNE   L0A2C3B
         LDA   #$0001
         STA   L054FB5
         BRA   L0A2C44
L0A2C3B  LDA   $0D
         DEC
         DEC
         BNE   L0A2C44
         STZ   L054FB5
L0A2C44  LDA   L054FB5
         BNE   L0A2C4D
         JSL   L0952F7
L0A2C4D  BRA   L0A2C5F
L0A2C4F  LDAL  L052D68
         PHA
         LDAL  L052D66
         PHA
         JSL   L09B242
         BRA   L0A2C5F
L0A2C5F  LDA   L054FB7
         LDX   L054FB9
         STA   $2B
         STX   $2D
         LDY   #$0002
         LDA   [$2B],Y
         TAX
         LDA   [$2B]
         STA   L055221
         STX   L055223
         TSC
         CLC
         ADC   #$002E
         TCS
         PLD
         RTL

L0A2C7F  PHD
         TSC
         CLC
         ADC   #$FEF8
         TCS
         ADC   #$0015
         TCD
         PHY
         PEA   $0000
         PEA   $0055
         PEA   $0000
         PEA   $0001
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         PEA   $002E
         JSL   L073002
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         JSL   L09B294
         PLA
         LSR
         BCC   L0A2CC9
         PEA   $0000
         PEA   $0001
         PEI   $ED
         PEI   $EB
         PEA   $0000
         JSL   L0968FC
L0A2CC9  PEI   $ED
         PEI   $EB
         JSL   L07185A
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

L0A2CE3  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDX   #$0000
         LDA   $0E
         BNE   L0A2CF3
         INX
L0A2CF3  PHX
         LDX   #$0000
         LDA   $0C
         BNE   L0A2CFC
         INX
L0A2CFC  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0A2D06
         BRL   L0A3151
L0A2D06  STZ   L0551F1
         LDA   #$0001
         STA   L05523D
         LDA   #$00FA
         CMP   $0C
         BEQ   L0A2D21
         LDA   #$0000
         STAL  L05000A
         JSL   L093A99
L0A2D21  LDX   #$0000
         LDA   #$01F4
         CMP   $0E
         BEQ   L0A2D2C
         INX
L0A2D2C  PHX
         LDX   #$0000
         LDA   #$0514
         CMP   $0E
         BEQ   L0A2D38
         INX
L0A2D38  TXA
         AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$01F4
         CMP   $0E
         BNE   L0A2D48
         INX
L0A2D48  PHX
         LDA   $0C
         SEC
         SBC   #$01FC
         BVS   L0A2D54
         EOR   #$8000
L0A2D54  BMI   L0A2D5B
         LDA   #$0000
         BRA   L0A2D5E
L0A2D5B  LDA   #$0001
L0A2D5E  AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$0201
         CMP   $0C
         BEQ   L0A2D6D
         INX
L0A2D6D  TXA
         AND   $01,S
         PLX
         ORA   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$0514
         CMP   $0E
         BNE   L0A2D80
         INX
L0A2D80  PHX
         LDA   $0C
         SEC
         SBC   #$051C
         BVS   L0A2D8C
         EOR   #$8000
L0A2D8C  BMI   L0A2D93
         LDA   #$0000
         BRA   L0A2D96
L0A2D93  LDA   #$0001
L0A2D96  AND   $01,S
         PLX
         ORA   $01,S
         PLX
         LSR
         BCC   L0A2DC8
         JSL   L090A71
         LDX   #$0000
         LDA   #$0320
         CMP   $0E
         BNE   L0A2DAE
         INX
L0A2DAE  PHX
         LDX   #$0000
         LDA   #$0322
         CMP   $0C
         BNE   L0A2DBA
         INX
L0A2DBA  TXA
         AND   $01,S
         PLX
         LSR
         BCS   L0A2DC8
         PEA   $0001
         JSL   L09091E
L0A2DC8  LDA   $0E
         SEC
         SBC   #$012C
         BPL   L0A2DD3
         BRL   L0A314E
L0A2DD3  CMP   #$03E9
         BMI   L0A2DDB
         BRL   L0A314E
L0A2DDB  SEC
         SBC   #$0000
         BEQ   L0A2E17
         SEC
         SBC   #$0064
         BEQ   L0A2E20
         SEC
         SBC   #$0064
         BNE   L0A2DF0
         BRL   L0A2F69
L0A2DF0  SEC
         SBC   #$0064
         BNE   L0A2DF9
         BRL   L0A309D
L0A2DF9  SEC
         SBC   #$00C8
         BNE   L0A2E02
         BRL   L0A30A6
L0A2E02  SEC
         SBC   #$0190
         BNE   L0A2E0B
         BRL   L0A2EEC
L0A2E0B  SEC
         SBC   #$0064
         BNE   L0A2E14
         BRL   L0A3021
L0A2E14  BRL   L0A314E
L0A2E17  PEI   $0C
         JSL   L092AB3
         BRL   L0A314E
L0A2E20  LDA   $0C
         SEC
         SBC   #$0191
         BPL   L0A2E2B
         BRL   L0A2EE9
L0A2E2B  CMP   #$000D
         BMI   L0A2E33
         BRL   L0A2EE9
L0A2E33  ASL
         TAX
         LDAL  L0A2E3B,X
         PHA
         RTS

L0A2E3B  DA    L0A2E53+1
         DA    L0A2E66+2
         DA    L0A2E71+1
         DA    L0A2EE7+1
         DA    L0A2E84+1
         DA    L0A2EAC+1
         DA    L0A2EB5+1
         DA    L0A2EE7+1
         DA    L0A2EC4+1
         DA    L0A2ECD+1
         DA    L0A2ED6+1
         DA    L0A2EE7+1
L0A2E53  DA    L0A2EDF+1
         PHY
         PEA   ^L040295
         PEA   L040295
         PEA   $0000
         JSL   L091037
         PLA
         STA   $01
L0A2E66  BRL   L0A2EE9
         PEA   $0000
         PHD
         JSL   L0A2C7F
L0A2E71  BRA   L0A2EE9
         PHY
         PEA   ^L040296
         PEA   L040296
         PEA   $0000
         JSL   L098B31
         PLA
         STA   $01
L0A2E84  BRA   L0A2EE9
         PHY
         PEA   ^L040297
         PEA   L040297
         JSL   L0946A2
         PLA
         LSR
         BCC   L0A2EA5
         JSL   L160536
         PEA   ^L160536
         PEA   L160536
         JSL   L07187A
         BRA   L0A2EAC
L0A2EA5  PEA   $0035
         JSL   L0727E0
L0A2EAC  BRA   L0A2EE9
         PEA   $0006
         JSL   L0A3F63
L0A2EB5  BRA   L0A2EE9
         PHY
         JSL   L0A2112
         PLA
         LSR
         BCC   L0A2EC4
         JSL   L160544
L0A2EC4  BRA   L0A2EE9
         PEA   $0001
         JSL   L0A1F68
L0A2ECD  BRA   L0A2EE9
         PEA   $0002
         JSL   L0A1F68
L0A2ED6  BRA   L0A2EE9
         PEA   $0003
         JSL   L0A1F68
L0A2EDF  BRA   L0A2EE9
         LDA   #$0001
         STA   L05524F
L0A2EE7  BRA   L0A2EE9
L0A2EE9  BRL   L0A314E
L0A2EEC  LDA   $0C
         SEC
         SBC   #$04B1
         BMI   L0A2F66
         CMP   #$0009
         BPL   L0A2F66
         ASL
         TAX
         LDAL  L0A2F01,X
         PHA
         RTS

L0A2F01  DA    L0A2F11+1
         DA    L0A2F24+1
         DA    L0A2F2E+1
         DA    L0A2F64+1
         DA    L0A2F41+1
         DA    L0A2F4A+1
         DA    L0A2F53+1
         DA    L0A2F64+1
L0A2F11  DA    L0A2F5C+1
         PHY
         PEA   ^L04029F
         PEA   L04029F
         PEA   $0000
         JSL   L091037
         PLA
         STA   $01
L0A2F24  BRA   L0A2F66
         PEA   $0000
         PHD
         JSL   L0A2C7F
L0A2F2E  BRA   L0A2F66
         PHY
         PEA   ^L0402A0
         PEA   L0402A0
         PEA   $0000
         JSL   L098B31
         PLA
         STA   $01
L0A2F41  BRA   L0A2F66
         PEA   $0001
         JSL   L0A1F68
L0A2F4A  BRA   L0A2F66
         PEA   $0002
         JSL   L0A1F68
L0A2F53  BRA   L0A2F66
         PEA   $0003
         JSL   L0A1F68
L0A2F5C  BRA   L0A2F66
         LDA   #$0001
         STA   L05524F
L0A2F64  BRA   L0A2F66
L0A2F66  BRL   L0A314E
L0A2F69  LDA   $0C
         SEC
         SBC   #$00FE
         BEQ   L0A2F78
         BVS   L0A2F76
         EOR   #$8000
L0A2F76  BMI   L0A2F8B
L0A2F78  PHY
         LDA   $0C
         SEC
         SBC   #$00F9
         PHA
         JSL   L150F47
         PLA
         LSR
         BCC   L0A2F8B
         BRL   L0A301E
L0A2F8B  LDA   $0C
         SEC
         SBC   #$00FA
         BPL   L0A2F96
         BRL   L0A301E
L0A2F96  CMP   #$0109
         BMI   L0A2F9E
         BRL   L0A301E
L0A2F9E  SEC
         SBC   #$0000
         BEQ   L0A2FC8
         DEC
         BEQ   L0A2FCE
         DEC
         BEQ   L0A2FD7
         DEC
         BEQ   L0A2FE0
         DEC
         BEQ   L0A2FE6
         SEC
         SBC   #$00FE
         BEQ   L0A2FEC
         DEC
         BEQ   L0A2FF2
         DEC
         BEQ   L0A2FF8
         DEC
         BEQ   L0A3002
         DEC
         DEC
         BEQ   L0A3008
         DEC
         BEQ   L0A3018
         BRA   L0A301E
L0A2FC8  JSL   L0A3CDA
         BRA   L0A301E
L0A2FCE  PEA   $0001
         JSL   L0A1B98
         BRA   L0A301E
L0A2FD7  PEA   $0000
         JSL   L0A1B98
         BRA   L0A301E
L0A2FE0  JSL   L0A36B1
         BRA   L0A301E
L0A2FE6  JSL   L0A21A2
         BRA   L0A301E
L0A2FEC  JSL   L09014C
         BRA   L0A301E
L0A2FF2  JSL   L092798
         BRA   L0A301E
L0A2FF8  JSL   L090BBD
         JSL   L092798
         BRA   L0A301E
L0A3002  JSL   L090BBD
         BRA   L0A301E
L0A3008  LDA   L055051
         EOR   #$0001
         ORA   L055243
         PHA
         JSL   L0A1639
         BRA   L0A301E
L0A3018  JSL   L140E96
         BRA   L0A301E
L0A301E  BRL   L0A314E
L0A3021  LDA   $0C
         SEC
         SBC   #$00FE
         BEQ   L0A3030
         BVS   L0A302E
         EOR   #$8000
L0A302E  BMI   L0A3040
L0A3030  PHY
         LDA   $0C
         SEC
         SBC   #$00F9
         PHA
         JSL   L150F47
         PLA
         LSR
         BCS   L0A309A
L0A3040  LDA   $0C
         SEC
         SBC   #$00FA
         BMI   L0A309A
         CMP   #$0424
         BPL   L0A309A
         SEC
         SBC   #$0000
         BEQ   L0A306A
         DEC
         BEQ   L0A3070
         DEC
         BEQ   L0A3079
         DEC
         BEQ   L0A3082
         DEC
         BEQ   L0A3088
         SEC
         SBC   #$041E
         BEQ   L0A308E
         DEC
         BEQ   L0A3094
         BRA   L0A309A
L0A306A  JSL   L0A3CDA
         BRA   L0A309A
L0A3070  PEA   $0001
         JSL   L0A1B98
         BRA   L0A309A
L0A3079  PEA   $0000
         JSL   L0A1B98
         BRA   L0A309A
L0A3082  JSL   L0A36B1
         BRA   L0A309A
L0A3088  JSL   L0A21A2
         BRA   L0A309A
L0A308E  JSL   L09014C
         BRA   L0A309A
L0A3094  JSL   L092798
         BRA   L0A309A
L0A309A  BRL   L0A314E
L0A309D  PEI   $0C
         JSL   L0932B8
         BRL   L0A314E
L0A30A6  LDA   $0C
         SEC
         SBC   #$0327
         BVS   L0A30B1
         EOR   #$8000
L0A30B1  BPL   L0A30BF
         PHY
         JSL   L0A2112
         PLA
         LSR
         BCS   L0A30BF
         BRL   L0A314E
L0A30BF  LDA   $0C
         SEC
         SBC   #$0321
         BPL   L0A30CA
         BRL   L0A314C
L0A30CA  CMP   #$000C
         BPL   L0A314C
         ASL
         TAX
         LDAL  L0A30D7,X
         PHA
         RTS

L0A30D7  DA    L0A30ED+1
         DA    L0A30F6+1
         DA    L0A30FF+1
         DA    L0A3108+1
         DA    L0A3111+1
         DA    L0A314A+1
         DA    L0A311A+1
         DA    L0A3123+1
         DA    L0A314A+1
         DA    L0A312C+1
         DA    L0A3138+1
L0A30ED  DA    L0A3144+1
         PEA   $0002
         JSL   L0A3F63
L0A30F6  BRA   L0A314C
         PEA   $0004
         JSL   L0A3F63
L0A30FF  BRA   L0A314C
         PEA   $0003
         JSL   L0A3F63
L0A3108  BRA   L0A314C
         PEA   $0001
         JSL   L0A3F63
L0A3111  BRA   L0A314C
         PEA   $0005
         JSL   L0A3F63
L0A311A  BRA   L0A314C
         PEA   $0000
         JSL   L160552
L0A3123  BRA   L0A314C
         PEA   $0001
         JSL   L160552
L0A312C  BRA   L0A314C
         PEA   $0001
         PEA   $0000
         JSL   L1604D4
L0A3138  BRA   L0A314C
         PEA   $0002
         PEA   $0000
         JSL   L1604D4
L0A3144  BRA   L0A314C
         JSL   L160560
L0A314A  BRA   L0A314C
L0A314C  BRA   L0A314E
L0A314E  STZ   L05523D
L0A3151  LDA   $0A
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

L0A3163  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         JSL   L0875FA
         JSL   L0875C4
         PLY
         PLY
         PLD
         RTL

L0A3183  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         PEI   $12
         PEI   $10
         JSL   L151131
         LDA   L0550E1
         LDX   L0550E3
         CMP   $10
         BNE   L0A319F
         CPX   $12
L0A319F  BNE   L0A31A8
         JSL   L08509D
         BRL   L0A3269
L0A31A8  LDA   L0550E9
         LDX   L0550EB
         CMP   $10
         BNE   L0A31B4
         CPX   $12
L0A31B4  BNE   L0A31C3
         PEA   ^L053201
         PEA   L053201
         JSL   L0855E6
         BRL   L0A3269
L0A31C3  LDA   L0550E5
         LDX   L0550E7
         CMP   $10
         BNE   L0A31CF
         CPX   $12
L0A31CF  BNE   L0A31DE
         PEA   ^L0531F1
         PEA   L0531F1
         JSL   L085479
         BRL   L0A3269
L0A31DE  LDA   L0550DD
         LDX   L0550DF
         CMP   $10
         BNE   L0A31EA
         CPX   $12
L0A31EA  BNE   L0A31F8
         PEA   ^L0531E1
         PEA   L0531E1
         JSL   L0854D9
         BRA   L0A3269
L0A31F8  LDA   L05542B
         LDX   L05542D
         CMP   $10
         BNE   L0A3204
         CPX   $12
L0A3204  BNE   L0A320C
         JSL   L16056E
         BRA   L0A3269
L0A320C  LDA   L0550ED
         LDX   L0550EF
         CMP   $10
         BNE   L0A3218
         CPX   $12
L0A3218  BNE   L0A322B
         LDA   L0550B9
         BNE   L0A3225
         JSL   L0A3DE1
         BRA   L0A3229
L0A3225  JSL   L16057C
L0A3229  BRA   L0A3269
L0A322B  LDA   L0550D9
         LDX   L0550DB
         CMP   $10
         BNE   L0A3237
         CPX   $12
L0A3237  BNE   L0A323F
         JSL   L16058A
         BRA   L0A3269
L0A323F  PHY
         PHY
         PEI   $12
         PEI   $10
         JSL   L0A1421
         PLA
         STA   $03
         PLX
         STX   $05
         LDA   $03
         ORA   $05
         BEQ   L0A3269
         PEI   $05
         PEI   $03
         PEA   $0006
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1604AA
L0A3269  PEI   $12
         PEI   $10
         JSL   L151131
         LDA   $0E
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

L0A3283  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0001
         JSL   L09091E
         JSL   L090A71
         LDAL  L052D34
         BEQ   L0A32C2
         PEA   ^L052D38
         PEA   L052D38
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         PEA   ^L052D32
         PEA   L052D32
         PEA   $0000
         PEA   $002A
         JSL   L071EC5
         STZ   L0551F5
         STZ   L0551F7
L0A32C2  PLY
         PLY
         PLD
         RTL

L0A32C6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         JSL   L151307
         PHY
         PEA   $FFFF
         PEA   ^L052D64
         PEA   L052D64
         JSL   L096BB1
         PLA
         LSR
         BCC   L0A32EB
         JSL   L0A2670
         BRL   L0A33FB
L0A32EB  LDA   L054FB5
         BNE   L0A32F3
         BRL   L0A338B
L0A32F3  LDA   L05544D
         BNE   L0A32FE
         LDA   #$0001
         STA   L054F9F
L0A32FE  LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L096A7B
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L151412
         LDA   L0550B9
         BNE   L0A3365
         PEI   $05
         PEI   $03
         LDX   #$0000
         LDA   L0550BB
         DEC
         BNE   L0A3337
         INX
L0A3337  PHX
         JSL   L140EDD
         LDA   L055239
         AND   L055237
         BEQ   L0A3348
         JSL   L14138E
L0A3348  LDAL  L052D34
         BEQ   L0A3352
         JSL   L14111E
L0A3352  LDA   L05511F
         BEQ   L0A3363
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150D4A
L0A3363  BRA   L0A337D
L0A3365  PEI   $05
         PEI   $03
         JSL   L0A0F7B
         LDA   L055239
         AND   L055237
         BEQ   L0A3379
         JSL   L160598
L0A3379  JSL   L1605A6
L0A337D  LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150076
         BRA   L0A3398
L0A338B  LDA   L05544D
         BEQ   L0A3398
         PHY
         JSL   L0727BF
         PLA
         STA   $01
L0A3398  LDA   L054FB5
         STA   L05544D
         JSL   L0B8AB6
         JSL   L0948D6
         JSL   L076C15
         JSL   L0A14B2
         LDA   L0550B9
         BEQ   L0A33B9
         JSL   L1605B4
         BRA   L0A33CC
L0A33B9  PHY
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081A64
         PLA
         LSR
         BCS   L0A33CC
         JSL   L0A3163
L0A33CC  PHY
         JSL   L094772
         PLA
         LSR
         BCS   L0A33FB
         LDA   L0550B9
         BNE   L0A33E9
         PEA   $0019
         JSL   L0727E0
         LDA   #$0001
         STA   L05524F
         BRA   L0A33FB
L0A33E9  PEA   $0001
         JSL   L090635
         PEA   $0028
         JSL   L0727E0
         JSL   L09AFB1
L0A33FB  PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0A3402  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L09951E
         PLA
         LSR
         BCC   L0A3416
         BRL   L0A363F
L0A3416  LDX   #$0000
         LDA   L055227
         DEC
         DEC
         BNE   L0A3421
         INX
L0A3421  PHX
         LDX   #$0000
         LDA   #$000C
         CMP   L055227
         BNE   L0A342E
         INX
L0A342E  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0A3442
         PEA   $0004
         PEA   $0259
         JSL   L09971B
         BRL   L0A363F
L0A3442  LDA   #$0003
         CMP   L055227
         BNE   L0A3451
         JSL   L0A21A2
         BRL   L0A363F
L0A3451  LDX   #$0000
         LDA   #$0004
         CMP   L055227
         BNE   L0A345D
         INX
L0A345D  PHX
         LDAL  L052D34
         BEQ   L0A3467
         LDA   #$0001
L0A3467  AND   $01,S
         PLX
         LSR
         BCC   L0A3474
         JSL   L0A21A2
         BRL   L0A363F
L0A3474  JSL   L0860E5
         LDA   L055225
         STA   $01
         LDA   #$0009
         CMP   $01
         BNE   L0A34D5
         LDA   L055231
         BEQ   L0A3497
         LDA   L0550E9
         LDX   L0550EB
         PHX
         PHA
         JSL   L09A5A7
         BRA   L0A34D2
L0A3497  LDA   #$0005
         CMPL  L052D64
         BEQ   L0A34D2
         LDA   L05511F
         BEQ   L0A34CB
         PEA   $0020
         LDA   L055129
         LDX   L05512B
         PHX
         PHA
         LDAL  L05328D
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
         BRA   L0A34D2
L0A34CB  PEA   $0020
         JSL   L0998B0
L0A34D2  BRL   L0A363F
L0A34D5  LDAL  L052D34
         BEQ   L0A3509
         LDA   #$0011
         CMP   L055227
         BNE   L0A34F0
         PEA   $0006
         PEA   $0328
         JSL   L09971B
         BRL   L0A363F
L0A34F0  LDA   #$0012
         CMP   L055227
         BNE   L0A3505
         PEA   $0006
         PEA   $0327
         JSL   L09971B
         BRL   L0A363F
L0A3505  JSL   L0A3283
L0A3509  LDX   #$0000
         LDA   L055227
         DEC
         BNE   L0A3513
         INX
L0A3513  PHX
         LDA   $01
         SEC
         SBC   #$0020
         BVS   L0A351F
         EOR   #$8000
L0A351F  BPL   L0A3526
         LDA   #$0000
         BRA   L0A3529
L0A3526  LDA   #$0001
L0A3529  PHA
         LDX   #$0000
         LDA   #$0008
         CMP   $01
         BEQ   L0A3535
         INX
L0A3535  TXA
         AND   $01,S
         PLX
         ORA   $01,S
         PLX
         LSR
         BCC   L0A3546
         JSL   L072314
         BRL   L0A363F
L0A3546  LDA   L05511F
         BEQ   L0A3582
         LDA   L055051
         AND   L055245
         BEQ   L0A355A
         JSL   L0903A6
         BRL   L0A363F
L0A355A  LDAL  L053299
         AND   #$1000
         BEQ   L0A3569
         JSL   L0A3283
         BRA   L0A359F
L0A3569  PEA   ^L052D64
         PEA   L052D64
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L151299
         JSL   L0879C5
         BRL   L0A363F
L0A3582  LDA   L0551F3
         BEQ   L0A359F
         LDA   L055225
         PHA
         LDAL  L052D72
         PHA
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150C40
         BRL   L0A363F
L0A359F  LDA   L055225
         PHA
         PEA   ^L0402A1
         PEA   L0402A1
         PLY
         PLX
         TSC
         CLC
         ADC   #$FFFA
         TCS
         PEA   $0000
         INC
         PHA
         PHX
         PHY
         PEA   $0006
         JSL   L0313BE
         PEA   $0006
         JSL   L1511F2
         PLA
         LSR
         BCC   L0A361B
         PEA   $7FFF
         PEA   $7FFF
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L1512D1
         JSL   L097700
         PEA   $0020
         PEA   $0000
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150C40
         LDA   L055225
         PHA
         LDAL  L052D72
         PHA
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150C40
         PEA   $0020
         PEA   $0000
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150C40
         BRA   L0A363F
L0A361B  PHY
         JSL   L0961E7
         PLA
         LSR
         BCC   L0A363B
         LDA   L055225
         PHA
         LDAL  L052D72
         PHA
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150C40
         BRA   L0A363F
L0A363B  JSL   L072314
L0A363F  PLY
         PLY
         PLY
         PLD
         RTL

L0A3644  PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         STZ   $2A
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0001
         PEI   $28
         PEI   $26
         JSL   L15165D
         LDY   #$00EB
         LDA   [$22],Y
         TAX
         DEY
         DEY
         LDA   [$22],Y
         PEI   $03
         PEI   $01
         JSL   L150F53
         PHX
         PHA
         LDA   #$7530
         LDX   #$0000
         JSL   L033477
         BEQ   L0A3697
         BVS   L0A3687
         EOR   #$8000
L0A3687  BPL   L0A3697
         PEA   $0023
         JSL   L0727E0
         LDA   #$0001
         STA   $2A
         BRA   L0A369F
L0A3697  PEI   $28
         PEI   $26
         JSL   L150B58
L0A369F  LDA   $20
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

L0A36B1  PHD
         TSC
         CLC
         ADC   #$FE70
         TCS
         ADC   #$0099
         TCD
         PHY
         JSL   L099DCE
         PLA
         ORA   L05522F
         STA   $CB
         LDA   L0551E9
         BNE   L0A373D
         PHY
         PHY
         PEA   $0000
         JSL   L150B1C
         PLA
         STA   $E9
         PLX
         STX   $EB
         LDA   L05511F
         BEQ   L0A371E
         LDA   L055051
         AND   L055245
         BEQ   L0A36EF
         JSL   L0903A6
         BRL   L0A3CD2
L0A36EF  LDAL  L052D40
         AND   #$1000
         BEQ   L0A36FF
         JSL   L0A3283
         BRL   L0A3CD2
L0A36FF  PHY
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         PEA   $0000
         PHD
         JSL   L0A3644
         PLA
         LSR
         BCC   L0A3717
         BRL   L0A3CD2
L0A3717  JSL   L0879C5
         BRL   L0A3CD2
L0A371E  LDA   L0551F3
         BEQ   L0A3736
         JSL   L151478
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150B76
         BRL   L0A3CD2
L0A3736  JSL   L072314
         BRL   L0A3CD2
L0A373D  JSL   L0A3283
         LDA   L055051
         AND   L055245
         BEQ   L0A3750
         JSL   L0903A6
         BRL   L0A3CD2
L0A3750  LDA   L0551FB
         SEC
         SBC   #$0003
         BVS   L0A375C
         EOR   #$8000
L0A375C  BMI   L0A3768
         PEA   $0024
         JSL   L0727E0
         BRL   L0A3CD2
L0A3768  LDA   L0551E9
         DEC
         BNE   L0A3782
         PEA   $0004
         JSL   L090635
         LDA   L0550B9
         DEC
         BNE   L0A377F
         JSL   L0A0A49
L0A377F  BRL   L0A3CD2
L0A3782  LDA   #$1604
         CMP   L0551E9
         BNE   L0A3791
         JSL   L0979C5
         BRL   L0A3CD2
L0A3791  LDA   L0551FB
         SEC
         SBC   #$0004
         BVS   L0A379D
         EOR   #$8000
L0A379D  BMI   L0A37A9
         PEA   $0024
         JSL   L0727E0
         BRL   L0A3CD2
L0A37A9  LDA   #$1602
         CMP   L0551E9
         BEQ   L0A37B4
         BRL   L0A3AC7
L0A37B4  JSL   L0A20CA
         LDA   L055027
         LDX   L055029
         STA   $E1
         STX   $E3
         LDA   L055153
         BEQ   L0A37D1
         LDA   L05501F
         LDX   L055021
         STA   $E1
         STX   $E3
L0A37D1  PHY
         PEI   $E3
         PEI   $E1
         PEA   $0001
         TDC
         CLC
         ADC   #$0091
         PEA   $0000
         PHA
         JSL   L079CC4
         PLA
         LSR
         BCS   L0A37ED
         BRL   L0A3AC0
L0A37ED  PHY
         PHY
         PEA   $0000
         PEA   $000A
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $ED
         PLX
         STX   $EF
         PEI   $EF
         PEI   $ED
         PEA   $1602
         JSL   L15064D
         LDA   $ED
         LDX   $EF
         STA   $DD
         STX   $DF
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         CLC
         ADC   #$0002
         BCC   L0A382E
         INX
L0A382E  STA   $F3
         STX   $F5
         LDA   $93
         STA   [$F3]
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         CLC
         ADC   #$0010
         BCC   L0A3845
         INX
L0A3845  STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         STA   $C7
         STX   $C9
         LDA   $C7
         ORA   $C9
         BNE   L0A385E
         BRL   L0A3A44
L0A385E  LDA   L05503D
         BEQ   L0A386D
         LDA   L05503D
         PHA
         JSL   L150B70
         BRA   L0A3875
L0A386D  LDA   L055271
         PHA
         JSL   L150B70
L0A3875  PHY
         PEA   $FFFF
         JSL   L1506E1
         PLA
         STA   $C5
         PHY
         PEA   $8001
         PEI   $C9
         PEI   $C7
         JSL   L150D3E
         PLA
         STA   $BB
         LDA   #$1E06
         CMPL  L05565D
         BEQ   L0A389B
         BRL   L0A3A44
L0A389B  LDA   L05503D
         BNE   L0A391A
         PEA   $0000
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L077086
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L150BB8
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L055043
         LDX   L055045
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         JSL   L150B82
         LDAL  L05565D
         BEQ   L0A38E8
         BRL   L0A3A44
L0A38E8  PHY
         PEA   $0003
         PEA   $0000
         PEA   $0000
         LDA   L055043
         LDX   L055045
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         JSL   L150B64
         PLA
         STA   L05503D
         LDAL  L05565D
         BEQ   L0A391A
         STZ   L05503D
         BRL   L0A3A44
L0A391A  PHY
         PEA   $0001
         JSL   L1506E1
         PLA
         STA   $C5
         STZ   $C1
         STZ   $C3
         PHY
         PHY
         PEA   $8001
         JSL   L150B1C
         PLA
         STA   $E9
         PLX
         STX   $EB
         LDX   #$0000
         LDA   $EB
         BMI   L0A3944
         ORA   $E9
         BEQ   L0A3944
         INX
L0A3944  TXA
         PHA
         LDX   #$0000
         LDAL  L05565D
         BNE   L0A3950
         INX
L0A3950  TXA
         AND   $01,S
         PLX
         LSR
         BCS   L0A395A
         BRL   L0A3A31
L0A395A  PHY
         PHY
         PEI   $EB
         PEI   $E9
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $C1
         PLX
         STX   $C3
         LDAL  L05565D
         BEQ   L0A3980
         BRL   L0A3A39
L0A3980  PEI   $C3
         PEI   $C1
         PEA   $8001
         JSL   L15064D
         LDAL  L05565D
         BEQ   L0A3994
         BRL   L0A3A31
L0A3994  PEI   $C3
         PEI   $C1
         PEA   $0200
         PEA   $8001
         PEI   $C9
         PEI   $C7
         JSL   L150422
         LDAL  L05565D
         BEQ   L0A39AF
         BRL   L0A3A31
L0A39AF  STZ   $C1
         STZ   $C3
         LDAL  L0402A7
         LDX   #$FF67
         SEP   #$20
         STA   $00,X
         REP   #$20
         PHY
         PHY
         PEA   $8006
         JSL   L150B1C
         PLA
         STA   $E9
         PLX
         STX   $EB
         LDX   #$0000
         LDA   $EB
         BMI   L0A39DB
         ORA   $E9
         BEQ   L0A39DB
         INX
L0A39DB  TXA
         PHA
         LDX   #$0000
         LDAL  L05565D
         BNE   L0A39E7
         INX
L0A39E7  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0A3A1D
         PHY
         PHY
         PEA   $8006
         JSL   L1516BD
         PLA
         STA   $BD
         PLX
         STX   $BF
         LDAL  L05565D
         BNE   L0A3A1D
         PEA   $0000
         TDC
         CLC
         ADC   #$FF67
         PHA
         LDY   #$0002
         LDA   [$BD],Y
         TAX
         LDA   [$BD]
         PHX
         PHA
         PEA   $0100
         JSL   L0313BE
L0A3A1D  PEA   $8001
         PEI   $C9
         PEI   $C7
         PEA   $0000
         TDC
         CLC
         ADC   #$FF67
         PHA
         JSL   L070BA8
L0A3A31  PEI   $C3
         PEI   $C1
         JSL   L07185A
L0A3A39  PHY
         PEA   $FFFF
         JSL   L1506E1
         PLA
         STA   $C5
L0A3A44  PHY
         PEI   $E3
         PEI   $E1
         PEI   $DF
         PEI   $DD
         JSL   L07DD58
         PLA
         LSR
         BCC   L0A3A76
         PEA   ^L052D32
         PEA   L052D32
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         PHX
         PHA
         PEA   $002A
         JSL   L0313BE
         LDA   $E1
         LDX   $E3
         STA   L0551F5
         STX   L0551F7
L0A3A76  PEI   $EF
         PEI   $ED
         JSL   L07185A
         PEA   $0002
         JSL   L1415AA
         PEA   ^L052D38
         PEA   L052D38
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         JSL   L085DC0
         PEA   $000C
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
         BRL   L0A3CD2
L0A3AC0  PEA   $0022
         JSL   L0727E0
L0A3AC7  LDA   #$1603
         CMP   L0551E9
         BEQ   L0A3AD2
         BRL   L0A3CD2
L0A3AD2  LDA   L055027
         LDX   L055029
         STA   $E1
         STX   $E3
         LDA   L055153
         BEQ   L0A3AEB
         LDA   L05501F
         LDX   L055021
         STA   $E1
         STX   $E3
L0A3AEB  PHY
         PEI   $E3
         PEI   $E1
         PEA   $0002
         TDC
         CLC
         ADC   #$0067
         PEA   $0000
         PHA
         JSL   L079CC4
         PLA
         LSR
         BCS   L0A3B07
         BRL   L0A3CCB
L0A3B07  PHY
         PHY
         PEA   $0000
         PEA   $000A
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $ED
         PLX
         STX   $EF
         PEI   $EF
         PEI   $ED
         PEA   $1603
         JSL   L15064D
         LDA   $ED
         LDX   $EF
         STA   $D9
         STX   $DB
         LDY   #$0002
         LDA   [$D9],Y
         TAX
         LDA   [$D9]
         CLC
         ADC   #$0002
         BCC   L0A3B48
         INX
L0A3B48  STA   $F3
         STX   $F5
         LDA   $69
         STA   [$F3]
         PHY
         PEI   $E3
         PEI   $E1
         PEI   $DB
         PEI   $D9
         JSL   L07DD58
         PLA
         LSR
         BCC   L0A3B82
         PEA   ^L052D32
         PEA   L052D32
         LDY   #$0002
         LDA   [$D9],Y
         TAX
         LDA   [$D9]
         PHX
         PHA
         PEA   $002A
         JSL   L0313BE
         LDA   $E1
         LDX   $E3
         STA   L0551F5
         STX   L0551F7
L0A3B82  LDA   $CB
         BNE   L0A3B89
         BRL   L0A3C86
L0A3B89  STZ   $D5
         STZ   $D7
         PHY
         PHY
         PEA   $0000
         JSL   L150B1C
         PLA
         STA   $E9
         PLX
         STX   $EB
         LDX   #$0000
         LDA   $EB
         BMI   L0A3BA8
         ORA   $E9
         BEQ   L0A3BA8
         INX
L0A3BA8  TXA
         PHA
         LDX   #$0000
         LDAL  L05565D
         BNE   L0A3BB4
         INX
L0A3BB4  TXA
         AND   $01,S
         PLX
         LSR
         BCS   L0A3BBE
         BRL   L0A3C7E
L0A3BBE  PHY
         PHY
         LDA   $E9
         LDX   $EB
         INC
         BNE   L0A3BC8
         INX
L0A3BC8  PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $D5
         PLX
         STX   $D7
         LDAL  L05565D
         BEQ   L0A3BEA
         BRL   L0A3C7E
L0A3BEA  PEI   $D7
         PEI   $D5
         PEA   $0000
         JSL   L15064D
         LDAL  L05565D
         BEQ   L0A3BFE
         BRL   L0A3C7E
L0A3BFE  LDA   $E9
         LDX   $EB
         INC
         BNE   L0A3C06
         INX
L0A3C06  PHX
         PHA
         PEI   $D7
         PEI   $D5
         JSL   L1512FB
         LDAL  L05565D
         BNE   L0A3C7E
         LDY   #$0002
         LDA   [$D5],Y
         TAX
         LDA   [$D5]
         PEI   $EB
         PEI   $E9
         JSL   L150F53
         STA   $D1
         STX   $D3
         SEP   #$20
         LDA   #$00
         STA   [$D1]
         REP   #$20
         PEI   $D7
         PEI   $D5
         JSL   L0718BF
         LDA   $69
         STA   $CF
         LDA   L055153
         BNE   L0A3C4B
         LDA   $CF
         EOR   #$FFFF
         INC
         STA   $CF
L0A3C4B  PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEI   $CF
         LDY   #$0002
         LDA   [$D5],Y
         PHA
         LDA   [$D5]
         PHA
         TDC
         CLC
         ADC   #$00CD
         PEA   $0000
         PHA
         JSL   L07D80F
         PLA
         BEQ   L0A3C7E
         PEA   $0022
         JSL   L0727E0
L0A3C7E  PEI   $D7
         PEI   $D5
         JSL   L07185A
L0A3C86  PEI   $EF
         PEI   $ED
         JSL   L07185A
         PEA   $0003
         JSL   L1415AA
         PEA   ^L052D38
         PEA   L052D38
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         JSL   L085DC0
         PEA   $000D
         PEI   $E3
         PEI   $E1
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
         BRA   L0A3CD2
L0A3CCB  PEA   $0022
         JSL   L0727E0
L0A3CD2  TSC
         CLC
         ADC   #$0190
         TCS
         PLD
         RTL

L0A3CDA  PHD
         TSC
         CLC
         ADC   #$FFD2
         TCS
         TCD
         LDA   L05511F
         BEQ   L0A3D34
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L096D4C
         STZ   L05511F
         STZ   L05511D
         PEA   ^L053291
         PEA   L053291
         JSL   L086CDB
         PEA   ^L05328B
         PEA   L05328B
         PEA   $0000
         PEA   $002A
         JSL   L071EC5
         STZ   L055129
         STZ   L05512B
         STZ   L055125
         STZ   L055127
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L15106B
         STZ   L055121
         STZ   L055123
         BRL   L0A3DCE
L0A3D34  PHY
         JSL   L09ABD5
         PLA
         LSR
         BCC   L0A3D40
         BRL   L0A3DCE
L0A3D40  LDAL  L05000A
         BNE   L0A3D49
         BRL   L0A3DCE
L0A3D49  PHY
         LDA   L055427
         LDX   L055429
         PHX
         PHA
         LDAL  L05000A
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCC   L0A3DCC
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   ^L05000E
         PEA   L05000E
         JSL   L0A0000
         PHY
         LDA   L055427
         LDX   L055429
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L07D585
         PLA
         LSR
         BCC   L0A3DCC
         LDAL  L052D34
         BEQ   L0A3DB1
         PEA   ^L052D32
         PEA   L052D32
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $002A
         JSL   L0313BE
L0A3DB1  TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L086CDB
         PEA   ^L05000E
         PEA   L05000E
         JSL   L086CDB
         JSL   L0875FA
L0A3DCC  BRA   L0A3DD5
L0A3DCE  LDA   #$0000
         STAL  L05000A
L0A3DD5  JSL   L093A99
         TSC
         CLC
         ADC   #$002E
         TCS
         PLD
         RTL

L0A3DE1  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         LDAL  L05328D
         BEQ   L0A3E0B
         PEA   ^L053291
         PEA   L053291
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
L0A3E0B  JSL   L08767D
         JSL   L0875C4
         PLY
         PLY
         PLD
         RTL

L0A3E17  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L160242
         PEA   L160242
         JSL   L07187A
         PEA   ^L160250
         PEA   L160250
         JSL   L07187A
         STZ   L0550B9
         STZ   L05514D
         STZ   L05514B
         LDA   #$0001
         STA   L055149
         LDA   L0550BB
         PHA
         JSL   L090635
         JSL   L0875FA
         PLY
         PLY
         PLD
         RTL

L0A3E52  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC6
         TCS
         TCD
         LDA   L05511F
         BNE   L0A3E62
         BRL   L0A3F5B
L0A3E62  LDAL  L053299
         AND   #$8000
         BEQ   L0A3E6E
         LDA   #$0001
L0A3E6E  PHA
         LDX   #$0000
         LDAL  L053299
         AND   #$000F
         CMP   #$0007
         BEQ   L0A3E7F
         INX
L0A3E7F  TXA
         AND   $01,S
         PLX
         LSR
         BCS   L0A3E89
         BRL   L0A3F14
L0A3E89  LDA   L055121
         LDX   L055123
         STA   $37
         STX   $39
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         CLC
         ADC   #$0072
         BCC   L0A3EA2
         INX
L0A3EA2  STA   $37
         STX   $39
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         PHX
         PHA
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L1511EC
         LDA   $33
         SEC
         SBC   L055425
         PHA
         LDAL  L0532AB
         LSR
         STA   $37
         PLA
         CLC
         ADC   $37
         SEC
         SBCL  L053295
         BEQ   L0A3F14
         BVS   L0A3EEC
         EOR   #$8000
L0A3EEC  BPL   L0A3F14
         PEA   $0020
         LDA   L055129
         LDX   L05512B
         PHX
         PHA
         LDAL  L05328D
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
         BRA   L0A3F5B
L0A3F14  LDA   L055051
         AND   L055245
         BEQ   L0A3F22
         JSL   L0903A6
         BRA   L0A3F5B
L0A3F22  LDAL  L052D40
         AND   #$1000
         BEQ   L0A3F31
         JSL   L0A3283
         BRA   L0A3F5B
L0A3F31  LDA   #$0003
         STA   $01
         LDA   #$000D
         LDX   #$0000
         STA   $03
         STX   $05
         STZ   $0F
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L151299
         JSL   L0879C5
L0A3F5B  TSC
         CLC
         ADC   #$003A
         TCS
         PLD
         RTL

L0A3F63  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   ^L0402A8
         PEA   L0402A8
         JSL   L0946A2
         PLA
         LSR
         BCC   L0A3FCB
         LDA   $0A
         SEC
         SBC   #$0001
         BMI   L0A3FBF
         CMP   #$0006
         BPL   L0A3FBF
         ASL
         TAX
         LDAL  L0A3F8F,X
         PHA
         RTS

L0A3F8F  DA    L0A3F99+1
         DA    L0A3F9F+1
         DA    L0A3FA5+1
         DA    L0A3FAB+1
         DA    L0A3FB1+1
L0A3F99  DA    L0A3FB7+1
         JSL   L1605C2
L0A3F9F  BRA   L0A3FBF
         JSL   L1605D0
L0A3FA5  BRA   L0A3FBF
         JSL   L1605DE
L0A3FAB  BRA   L0A3FBF
         JSL   L1605EC
L0A3FB1  BRA   L0A3FBF
         JSL   L1605FA
L0A3FB7  BRA   L0A3FBF
         JSL   L160608
         BRA   L0A3FBF
L0A3FBF  PEA   ^L1605C2
         PEA   L1605C2
         JSL   L07187A
         BRA   L0A3FD2
L0A3FCB  PEA   $0035
         JSL   L0727E0
L0A3FD2  LDA   $08
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

L0A3FE2  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PEA   ^L050032
         PEA   L050032
         PEA   $200C      ; SetSysPrefs
         JSL   GSOS2
         STAL  L05565D
         PEA   ^L074266
         PEA   L074266
         JSL   L151349
         JSL   L098822
         LDA   L0551FD
         BNE   L0A4012
         JSL   L150470
L0A4012  JSL   L1506ED
         JSL   L1506E7
         PEA   $0000
         PEA   ^L05411D
         PEA   L05411D
         JSL   L150B46
         PEA   $0019
         JSL   L151331
         JSL   L0A1F3D
         PHY
         PHY
         PEA   $0000
         PEA   $000A
         JSL   L1517E5
         PLA
         STA   $01
         PLX
         STX   $03
         _SANEShutDown
         PHY
         PHY
         PEI   $03
         PEI   $01
         JSL   L150586
         JSL   L151053
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0A405F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFB6
         TCS
         TCD
         JSL   L090A71
         LDX   #$0000
         LDA   L0551FB
         DEC
         BNE   L0A4075
         INX
L0A4075  TXA
         ORA   L055153
         BEQ   L0A407E
         BRL   L0A4319
L0A407E  LDA   L0550BB
         DEC
         BEQ   L0A408B
         PEA   $0001
         JSL   L090635
L0A408B  PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0002
         JSL   L07977D
         PLA
         STA   $41
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0002
         JSL   L07977D
         PLA
         STA   $3F
         LDA   L05511F
         BEQ   L0A40D6
         LDA   L055129
         LDX   L05512B
         STA   $39
         STX   $3B
         PHY
         PEI   $3B
         PEI   $39
         LDAL  L05328D
         PHA
         PEA   $0000
         JSL   L07AD84
         PLA
         STA   $45
         BRA   L0A40E2
L0A40D6  LDA   L05501F
         LDX   L055021
         STA   $39
         STX   $3B
         STZ   $45
L0A40E2  LDA   $3F
         CLC
         ADC   $41
         INC
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L0A40F5
         EOR   #$8000
L0A40F5  BMI   L0A40FA
         BRL   L0A4319
L0A40FA  LDA   #$0001
         STA   $3D
L0A40FF  LDA   L05522F
         BEQ   L0A4144
         LDA   $45
         DEC
         STA   $45
         LDA   $45
         SEC
         SBC   #$0001
         BVS   L0A4114
         EOR   #$8000
L0A4114  BMI   L0A4142
         LDA   L05501F
         LDX   L055021
         CMP   $39
         BNE   L0A4122
         CPX   $3B
L0A4122  BNE   L0A4134
         LDA   L055027
         LDX   L055029
         STA   $39
         STX   $3B
         LDA   $3F
         STA   $45
         BRA   L0A4142
L0A4134  LDA   L05501F
         LDX   L055021
         STA   $39
         STX   $3B
         LDA   $41
         STA   $45
L0A4142  BRA   L0A4193
L0A4144  LDA   $45
         INC
         STA   $45
         LDA   L05501F
         LDX   L055021
         CMP   $39
         BNE   L0A4155
         CPX   $3B
L0A4155  BNE   L0A4176
         LDA   $45
         SEC
         SBC   $41
         BEQ   L0A4174
         BVS   L0A4163
         EOR   #$8000
L0A4163  BPL   L0A4174
         LDA   L055027
         LDX   L055029
         STA   $39
         STX   $3B
         LDA   #$0001
         STA   $45
L0A4174  BRA   L0A4193
L0A4176  LDA   $45
         SEC
         SBC   $3F
         BEQ   L0A4193
         BVS   L0A4182
         EOR   #$8000
L0A4182  BPL   L0A4193
         LDA   L05501F
         LDX   L055021
         STA   $39
         STX   $3B
         LDA   #$0001
         STA   $45
L0A4193  PHY
         PEI   $3B
         PEI   $39
         PEI   $45
         PEA   $0002
         JSL   L07AC17
         PLA
         STA   $43
         PHY
         PEI   $3B
         PEI   $39
         PEI   $43
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         JSL   L07ABAE
         LDX   #$0000
         LDA   $13
         BMI   L0A41C0
         INX
L0A41C0  TXA
         AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$1000
         AND   $1D
         BNE   L0A41D0
         INX
L0A41D0  TXA
         AND   $01,S
         PLX
         LSR
         BCS   L0A41DA
         BRL   L0A430E
L0A41DA  PEA   $0001
         JSL   L09091E
         LDA   L055027
         LDX   L055029
         CMP   $39
         BNE   L0A41ED
         CPX   $3B
L0A41ED  BEQ   L0A4200
         LDA   L05501F
         LDX   L055021
         CMP   $39
         BNE   L0A41FB
         CPX   $3B
L0A41FB  BEQ   L0A4200
         BRL   L0A4319
L0A4200  LDA   L05511F
         BEQ   L0A4208
         BRL   L0A4319
L0A4208  PEI   $3B
         PEI   $39
         PEI   $43
         PEA   $0001
         JSL   L1412EE
         LDA   #$0001
         STA   L05511D
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $7FFF
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150006
         LDA   L055121
         LDX   L055123
         STA   $47
         STX   $49
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         STA   $0B
         STX   $0D
         LDA   #$0010
         CLC
         ADC   $0B
         LDX   $0D
         BCC   L0A4254
         INX
L0A4254  STA   $47
         STX   $49
         LDY   #$0010
         LDA   #$00FF
         AND   [$0B],Y
         AND   #$007F
         SEP   #$20
         STA   [$47]
         REP   #$20
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150BCA
         JSL   L0879C5
         LDA   L055121
         LDX   L055123
         STA   $47
         STX   $49
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         STA   $07
         STX   $09
         LDY   #$0092
         LDA   [$07],Y
         INY
         INY
         ORA   [$07],Y
         BEQ   L0A42EF
         LDY   #$0094
         LDA   [$07],Y
         TAX
         DEY
         DEY
         LDA   [$07],Y
         STA   $47
         STX   $49
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         STA   $03
         STX   $05
         LDA   #$0010
         CLC
         ADC   $03
         LDX   $05
         BCC   L0A42CB
         INX
L0A42CB  STA   $47
         STX   $49
         LDY   #$0010
         LDA   #$00FF
         AND   [$03],Y
         AND   #$007F
         SEP   #$20
         STA   [$47]
         REP   #$20
         LDY   #$0094
         LDA   [$07],Y
         PHA
         DEY
         DEY
         LDA   [$07],Y
         PHA
         JSL   L151041
L0A42EF  PEA   $0004
         PEI   $3B
         PEI   $39
         PEI   $43
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L0998E6
         BRA   L0A4319
L0A430E  LDA   $3D
         CMP   $01
         BEQ   L0A4319
         INC   $3D
         BRL   L0A40FF
L0A4319  TSC
         CLC
         ADC   #$004A
         TCS
         PLD
         RTL

L0A4321  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         LDAL  L05565F
         STA   L054FBF
         LDA   #$0100
         ORA   L054FBF
         STA   L0551B7
         LDA   #$0600
         ORA   L054FBF
         STA   $23
         PEA   $0000
         JSL   L15000C
         JSL   L15059E
         PHY
         PHY
         JSL   L15070B
         PLY
         PLA
         SEC
         SBC   #$001C
         BEQ   L0A4366
         BVS   L0A435F
         EOR   #$8000
L0A435F  BPL   L0A4366
         LDA   #$0000
         BRA   L0A4369
L0A4366  LDA   #$0001
L0A4369  STA   L05510D
         STZ   $1B
         STZ   $1D
         STZ   $1F
         STZ   $21
         STZ   $13
         STZ   $15
         STZ   $17
         STZ   $19
         STZ   $05
         STZ   $03
         STZ   $0B
         STZ   $0D
         LDA   L05510D
         BNE   L0A43B0
         PHY
         PHY
         PEA   $0000
         PEA   $7D00
         PEI   $23
         PEA   $4002
         PEA   $0001
         PEA   $2000
         JSL   L1513F4
         PLA
         STA   $0B
         PLX
         STX   $0D
         LDAL  L05565D
         BEQ   L0A43B0
         STZ   $0B
         STZ   $0D
L0A43B0  PHY
         PHY
         PEA   $0001
         PEA   $0000
         PEI   $23
         PEA   $4010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $1B
         PLX
         STX   $1D
         LDAL  L05565D
         BEQ   L0A43DA
         STZ   $1B
         STZ   $1D
         BRL   L0A4566
L0A43DA  LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         STA   L0550F5
         STX   L0550F7
         STZ   L0550F3
         LDA   #$0001
         STA   L0550F1
         PHY
         PHY
         PEA   $0001
         PEA   $0000
         PEI   $23
         PEA   $4010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $1F
         PLX
         STX   $21
         LDAL  L05565D
         BEQ   L0A441B
         STZ   $1F
         STZ   $21
         BRL   L0A4566
L0A441B  PEA   $0000
         PEA   $7D00
         PEI   $21
         PEI   $1F
         JSL   L1512FB
         LDY   #$0002
         LDA   [$1F],Y
         TAX
         LDA   [$1F]
         STA   L0550FD
         STX   L0550FF
         PHY
         PHY
         PEA   $0000
         PEA   $7D00
         PEI   $23
         PEA   $4010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $13
         PLX
         STX   $15
         LDAL  L05565D
         BEQ   L0A4461
         STZ   $13
         STZ   $15
         BRL   L0A4566
L0A4461  LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         STA   L055109
         STX   L05510B
         PHY
         PHY
         PEA   $0000
         PEA   $7D00
         PEI   $23
         PEA   $4010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $17
         PLX
         STX   $19
         LDAL  L05565D
         BEQ   L0A4499
         STZ   $17
         STZ   $19
         BRL   L0A4566
L0A4499  LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         STA   L055101
         STX   L055103
         PHY
         PHY
         PEA   $0000
         PEA   $7D00
         PEI   $23
         PEA   $4010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $0F
         PLX
         STX   $11
         LDAL  L05565D
         BEQ   L0A44D1
         STZ   $0F
         STZ   $11
         BRL   L0A4566
L0A44D1  LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         STA   L055105
         STX   L055107
L0A44DF  PHY
         PHY
         JSL   L15070B
         PLY
         PLA
         SEC
         SBC   #$0014
         BEQ   L0A44F4
         BVS   L0A44F2
         EOR   #$8000
L0A44F2  BMI   L0A44FF
L0A44F4  LDA   #$1000
         ORAL  L05411F
         STAL  L05411F
L0A44FF  PEI   $0D
         PEI   $0B
         JSL   L07185A
         STZ   $0B
         STZ   $0D
         PHY
         PHY
         LDA   L0551B7
         PHA
         PEA   $0000
         PEA   ^L05411D
         PEA   L05411D
         JSL   L151011
         PLA
         STA   $07
         PLX
         STX   $09
         LDAL  L054121
         STA   L055271
         LDA   #$0001
         STA   $05
         LDAL  L05565D
         BNE   L0A4566
         LDA   $03
         BEQ   L0A4566
         JSL   L1517D3
         PHY
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L054171
         PEA   L054171
         JSL   L150B94
         PLA
         STA   $01
         PEA   $0000
         PEA   ^L05411D
         PEA   L05411D
         JSL   L150B46
         STZ   $2E
         BRA   L0A45C8
L0A4566  LDA   #$0201
         CMPL  L05565D
         BNE   L0A459B
         PEI   $1D
         PEI   $1B
         PEI   $21
         PEI   $1F
         JSL   L071825
         PEI   $15
         PEI   $13
         PEI   $19
         PEI   $17
         JSL   L071825
         PEI   $11
         PEI   $0F
         JSL   L07185A
         LDA   #$0001
         STA   $03
         LDA   $05
         BNE   L0A459B
         BRL   L0A44DF
L0A459B  LDAL  L05565D
         BEQ   L0A45B0
         LDAL  L05565D
         PHA
         PEA   ^L0402B3
         PEA   L0402B3
         JSL   L151023
L0A45B0  PEI   $0D
         PEI   $0B
         JSL   L07185A
         PEA   $0000
         JSL   L15000C
         JSL   L15059E
         LDA   #$0001
         STA   $2E
L0A45C8  TSC
         CLC
         ADC   #$0028
         TCS
         PLD
         RTL


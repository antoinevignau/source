*
* HypercardGS
* segment: $07 HyperLib
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HyperLib.l
         lst   off

*---------------------------------------

         use   HyperLib.E
         use   HyperLib.X

         use   4/Ctl.Macs
         use   4/Desk.Macs
         use   4/Dialog.Macs
         use   4/Event.Macs
         use   4/Int.Macs
         use   4/Line.Macs
         use   4/List.Macs
	use   4/Load.Macs
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
         use   4/Util.Macs
         use   4/Window.Macs

*---------------------------------------

L070000  PHD
         PHY
         TSC
         TCD
         LDA   L054F8B
         BEQ   L070039
         LDA   L055047
         BEQ   L070043
         PEA   ^L050C32
         PEA   L050C32
         LDA   L055045
         PHA
         LDA   L055043
         PHA
         JSL   L072CD4
         LDX   #^L07005B
         LDA   #L07005B
         PHX
         PHA
         PHX
         PHA
         PHX
         PHA
         JSL   L073C22
         PEA   $0047
         JSL   L0727E0
         BRA   L070043
L070039  LDA   #$0001
         STA   L054F8B
         JSL   L074D35
L070043  JSL   L0A3FE2
         STZ   $01
         TDC
         INC
         PEA   $0000
         PHA
         PEA   $2029
         JSL   GSOS2
         TDC
         TCS
         PLY
         PLD
         RTL

L07005B  DB    $00

L07005C  ENT
         PHD
         TSC
         SEC
         SBC   #$0010
         TCD
         TCS
         PHY
         PEA   $1000
         TDC
         INC
         PEA   $0000
         PHA
         _EventAvail
         PLA
         STA   $16
         LDX   $11
         TDC
         CLC
         ADC   #$0012
         TCS
         TXA
         TCD
         RTL

L070083  PHD
         TSC
         SEC
         SBC   #$000E
         TCD
         TCS
         PHA
         PHA
         PEI   $16
         PEI   $14
         _GetHandleSize
         PLA
         PLX
         STA   $09
         STX   $0B
         LDA   [$18]
         STA   $01
         LDY   #$0002
         LDA   [$18],Y
         STA   $03
         LDA   [$01]
         INC
         INC
         STA   $0D
         CLC
         ADC   $09
         PHA
         PHA
         LDA   $0B
         ADC   #$0000
         STA   $03,S
         PEI   $16
         PEI   $14
         _SetHandleSize
         LDY   #$0002
         LDA   [$18]
         STA   $01
         LDA   [$18],Y
         STA   $03
         LDA   [$14]
         STA   $05
         LDA   [$14],Y
         STA   $07
         LDA   [$05]
         INC
         STA   [$05]
         PEI   $03
         PEI   $01
         LDA   $05
         CLC
         ADC   $09
         TAX
         LDA   $07
         ADC   $0B
         PHA
         PHX
         PEA   $0000
         PEI   $0D
         JSL   L070597
         LDA   $12
         STA   $1A
         LDA   $11
         STA   $19
         LDX   $0F
         TDC
         CLC
         ADC   #$0018
         TCS
         TXA
         TCD
         RTL

L07010A  ENT
         PHD
         TSC
         TCD
         PEI   $08
         PEI   $06
         LDA   #L070136
         LDX   #^L070136
         PHX
         PHA
         PHX
         PHA
         PHX
         PHA
         JSL   L073C22
         PEA   $0000
         JSL   L0727E0
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

L070136  ENT
         DFB   $00

L070137  ENT
         PHD
         TSC
         TCD
         LDA   L05535F
         BEQ   L070153
         LDAL  $FE0018
         AND   #$00FF
         CMP   #$005C
         BNE   L070153
         PHB
         PHD
         JSL   $FE0018
         PLD
         PLB
L070153  TDC
         TCS
         PLD
         RTL

L070157  PHD
         TSC
         TCD
         LDA   #$0001
         STA   $0A
         LDA   [$06]
         AND   #$00FF
         BEQ   L070170
         TAY
         SEP   #$20
L070169  LDA   [$06],Y
         BEQ   L070172
         DEY
         BNE   L070169
L070170  STZ   $0A
L070172  REP   #$20
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

L070182  ENT
         PHD
         TSC
         SEC
         SBC   #$0082
         TCD
         TCS
         PHA
         LDA   L052D70
         PHA
         LDA   L052D6E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0013
         PEA   $0000
         PHA
         ADC   #$0004
         PEA   $0000
         PHA
         JSL   L0A2034
         PLA
         BEQ   L0701E0
         LDA   L055027
         STA   $05
         LDA   L055029
         STA   $07
         LDA   L05501F
         STA   $09
         LDA   L055021
         STA   $0B
         LDA   L055039
         STA   $0D
         LDA   L05503B
         STA   $0F
         LDA   $1B
         AND   #$000F
         DEC
         BNE   L0701D8
         JSR   L0702B2
         BRA   L07021D
L0701D8  DEC
         BNE   L07021D
         JSR   L07043A
         BRA   L07021D
L0701E0  JSL   L0A3283
         PEA   $0013
         JSL   L0998B0
L0701EB  PEA   $0014
         JSL   L0998B0
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L096A7B
         PHA
         JSL   L096CC4
         PLA
         BNE   L0701EB
         PHA
         PEA   $0004
         PEA   $0002
         _FlushEvents
         PLA
         PEA   $0015
         JSL   L0998B0
L07021D  LDX   $83
         TDC
         CLC
         ADC   #$0084
         TCS
         TXA
         TCD
         RTL

L070228  LDA   $19
         LDX   $13
         CPX   $05
         BNE   L07023A
         LDX   $15
         CPX   $07
         BNE   L07023A
         EOR   #$FFFF
         INC
L07023A  RTS

L07023B  LDA   $0D
         CMP   L055039
         BNE   L07025C
         LDA   $0F
         CMP   L05503B
         BNE   L07025C
L070249  PHX
         PEI   $15
         PEI   $13
         PEI   $19
         PEI   $07
         PEI   $05
         PEI   $0B
         PEI   $09
         JSL   L0998E6
L07025C  RTS

L07025D  LDX   #$0014
         BRA   L07023B
L070262  LDX   #$0015
         BRA   L07023B
L070267  PHA
         PEI   $0B
         PEI   $09
         PEI   $07
         PEI   $05
         JSR   L070228
         PHA
         PEI   $71
         PEI   $6B
         TDC
         CLC
         ADC   #$006F
         PEA   $0000
         PHA
         JSL   L07D08A
         PLA
         BEQ   L070298
         LDA   $6F
         BEQ   L070298
         PEI   $15
         PEI   $13
         PEI   $19
         PEI   $11
         JSL   L0876F4
L070298  RTS

L070299  PHA
         PEI   $0B
         PEI   $09
         PEI   $07
         PEI   $05
         JSR   L070228
         PHA
         JSL   L07A609
         PLA
         EOR   #$0001
         STA   $71
         BRA   L070267
L0702B2  LDA   $13
         CMP   L055027
         BNE   L0702C6
         LDA   $15
         CMP   L055029
         BNE   L0702C6
         LDA   #$0001
         STA   L055249
L0702C6  STZ   $77
         LDA   $25
         AND   #$2000
         BEQ   L0702D1
         INC   $77
L0702D1  LDA   $25
         AND   #$000F
         STA   $7D
         PHY
         SEC
         SBC   #$0004
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L071A1B
         PLA
         STA   $7F
         STZ   $11
         LDA   $7D
         BEQ   L0702F9
         LDA   $27
         ORA   $29
         BNE   L0702F9
         BRA   L0702FB
L0702F9  INC   $11
L0702FB  LDA   $1B
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         STA   $81
         PHA
         PEI   $0B
         PEI   $09
         PEI   $07
         PEI   $05
         JSR   L070228
         PHA
         JSL   L07A609
         PLA
         STA   $79
         STA   $7B
         LDA   $81
         BEQ   L070324
         STZ   $7F
         BRA   L070326
L070324  STZ   $79
L070326  LDA   #$FFFF
         STA   $73
         STA   $75
         LDA   $77
         BEQ   L070353
         LDA   $7F
         DEC
         BNE   L070340
         LDA   #$0001
         STA   $6B
         JSR   L070299
         BRA   L070353
L070340  LDA   #$0001
         STA   $71
         LDA   $81
         BEQ   L07034C
         LDA   #$0001
L07034C  ORA   $7B
         STA   $6B
         JSR   L070267
L070353  LDX   #$0013
         JSR   L070249
L070359  PHY
         JSL   L096CC4
         PLA
         BNE   L070364
         BRL   L0703E4
L070364  LDA   $0D
         CMP   L055039
         BNE   L070359
         LDA   $0F
         CMP   L05503B
         BNE   L070359
         JSR   L07025D
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L096A7B
         LDA   $03
         CMP   #$8000
         ROR
         STA   $03
         STZ   $73
         PHY
         PEI   $15
         PEI   $13
         PEI   $19
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         BEQ   L0703C0
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0047
         PEA   $0000
         PHA
         _PtInRect
         PLA
         STA   $73
L0703C0  LDA   $77
         BEQ   L0703DC
         LDA   $79
         BNE   L0703DC
         LDA   $73
         CMP   $75
         BEQ   L0703DC
         LDA   $81
         BEQ   L0703D5
         LDA   #$0001
L0703D5  ORA   $7B
         STA   $6B
         JSR   L070299
L0703DC  LDA   $73
         STA   $75
         BRL   L070359
L0703E3  RTS

L0703E4  PHY
         PEA   $0004
         PEA   $0002
         _FlushEvents
         PLA
         LDA   L055039
         CMP   $0D
         BNE   L0703E3
         LDA   L05503B
         CMP   $0F
         BNE   L0703E3
         LDA   $77
         BEQ   L070416
         LDA   $7F
         BNE   L070416
         LDA   $81
         BNE   L070416
         LDA   $7B
         STA   $6B
         STZ   $71
         JSR   L070267
L070416  LDA   $73
         BEQ   L070439
         LDA   $77
         BEQ   L070436
         LDA   $81
         BEQ   L070436
         PEI   $07
         PEI   $05
         PEI   $0B
         PEI   $09
         PEI   $15
         PEI   $13
         PEI   $81
         PEI   $19
         JSL   L095059
L070436  JSR   L070262
L070439  RTS

L07043A  LDA   $13
         STA   L055201
         LDA   $15
         STA   L055203
         LDA   $19
         STA   L0551FF
         PEA   ^L052D5C
         PEA   L052D5C
         JSL   L096A7B
         LDX   #$0013
         JSR   L070249
L070459  PHY
         JSL   L096CC4
         PLA
         BEQ   L070473
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L096A7B
         JSR   L07025D
         BRA   L070459
L070473  PHY
         PEA   $0004
         PEA   $0002
         _FlushEvents
         PLA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L096A7B
         LDA   $03
         CMP   #$8000
         ROR
         STA   $03
         PHY
         PEI   $15
         PEI   $13
         PEI   $19
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         BEQ   L0704CE
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0047
         PEA   $0000
         PHA
         _PtInRect
         PLA
         BEQ   L0704CE
         JSR   L070262
L0704CE  RTS

L0704CF  ENT
         PHD
         TSC
         TCD
         SEC
         SBC   #$0200
         TCS
         LDA   $0A
         BEQ   L070516
         TDC
         CLC
         ADC   #$FE01
         PEA   $0000
         PHA
         PEA   $0000
         PHA
         JSL   L07346C
         TDC
         CLC
         ADC   #$FF01
         PEA   $0000
         PHA
         PEI   $08
         PEI   $06
         JSL   L07346C
         LDA   #L053251
         LDX   #^L053251
         PHX
         PHA
         PHX
         PHA
         JSL   L073C22
         PEA   $001D
         JSL   L0727E0
         JSL   L070000
L070516  LDA   $04
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

L070525  ENT
         PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         STZ   $10
         STZ   $12
         STZ   $05
         LDA   $0C
         ORA   $0E
         BEQ   L070586
         LDY   #$0002
         LDA   [$0C]
         STA   $01
         LDA   [$0C],Y
         STA   $03
         ORA   $01
         BEQ   L070586
         LDA   [$01]
         BEQ   L070586
         INC
         INC
         STA   $05
         PHY
         PHY
         PEA   $0000
         PHA
         LDAL  L054FBD
         PHA
         LDA   #$0000
         PHA
         PHA
         PHA
         _NewHandle
         PLA
         PLX
         BCS   L070586
         STA   $10
         STX   $12
         LDY   #$0002
         LDA   [$0C],Y
         PHA
         LDA   [$0C]
         PHA
         LDA   [$10],Y
         PHA
         LDA   [$10]
         PHA
         PEA   $0000
         PEI   $05
         JSL   L070597
L070586  LDA   $0A
         STA   $0E
         LDA   $09
         STA   $0D
         TDC
         TCS
         PLY
         PLY
         PLY
         PLD
         PLY
         PLY
         RTL

L070597  ENT
         PHB
         PHD
         PHY
         TSC
         TCD
         LSR   $0B
         ROR   $09
         LDA   #$0000
         ROL
         STA   $01
         ASL   $09
         ROL   $0B
         LDX   $0B
         BEQ   L0705C5
         LDY   #$0000
L0705B1  LDA   $12
         PHA
         PLB
         PLB
L0705B6  LDA   ($11),Y
         STA   [$0D],Y
         INY
         INY
         BNE   L0705B6
         INC   $13
         INC   $0F
         DEX
         BNE   L0705B1
L0705C5  LDA   $12
         PHA
         PLB
         PLB
         LDY   $09
         BEQ   L0705DE
         DEY
         DEY
         BEQ   L0705DA
L0705D2  LDA   ($11),Y
         STA   [$0D],Y
         DEY
         DEY
         BNE   L0705D2
L0705DA  LDA   ($11)
         STA   [$0D]
L0705DE  LDA   $01
         BEQ   L0705EC
         LDY   $09
         SEP   #$20
         LDA   ($11),Y
         STA   [$0D],Y
         REP   #$20
L0705EC  LDA   $07
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

L0705FF  ENT
         PHD
         PHY
         PHY
         PHY
         PHY
         TSC
         TCD
         LDY   #$0002
         LDA   [$12]
         STA   $01
         LDA   [$12],Y
         STA   $03
         LDA   [$0E]
         STA   $05
         LDA   [$0E],Y
         STA   $07
         LDA   #$0000
         TAX
         TAY
         SEP   #$20
         LDY   #$0000
L070623  LDA   [$01],Y
         STA   [$05],Y
         BEQ   L070636
         CMP   #$0D
         BEQ   L070636
         INY
         BNE   L070623
         INC   $03
         INC   $07
         BRA   L070623
L070636  REP   #$20
         TYX
         LDY   #$0002
         TXA
         CLC
         ADC   $01
         STA   [$12]
         LDA   $03
         ADC   #$0000
         STA   [$12],Y
         TXA
         CLC
         ADC   $05
         STA   [$0E]
         LDA   $07
         ADC   #$0000
         STA   [$0E],Y
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

L070669  ENT
         PHD
         PHY
         PHY
         PHY
         PHY
         TSC
         TCD
         LDY   #$0002
         LDA   [$12]
         STA   $01
         LDA   [$12],Y
         STA   $03
         LDA   [$0E]
         STA   $05
         LDA   [$0E],Y
         STA   $07
         LDA   #$0000
         TAX
         TAY
         SEP   #$20
         LDY   #$0000
L07068D  LDA   [$01],Y
         STA   [$05],Y
         BEQ   L07069C
         INY
         BNE   L07068D
         INC   $03
         INC   $07
         BRA   L07068D
L07069C  REP   #$20
         TYX
         LDY   #$0002
         TXA
         CLC
         ADC   $01
         STA   [$12]
         LDA   $03
         ADC   #$0000
         STA   [$12],Y
         TXA
         CLC
         ADC   $05
         STA   [$0E]
         LDA   $07
         ADC   #$0000
         STA   [$0E],Y
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

L0706CF  ENT
         PHD
         TSC
         SEC
         SBC   #$000C
         TCD
         TCS
         LDA   L054FB7
         STA   $01
         LDA   L054FB9
         STA   $03
         JSR   L070716
         CLC
         ADC   $12
         BCC   L0706EA
         INX
L0706EA  STA   $05
         STX   $07
L0706EE  JSR   L070716
         STA   $09
         STX   $0B
         LDA   $07
         CMP   $0B
         BCC   L070703
         BNE   L0706EE
         LDA   $05
         CMP   $09
         BCS   L0706EE
L070703  LDA   $10
         STA   $12
         LDA   $0F
         STA   $11
         LDX   $0D
         TDC
         CLC
         ADC   #$0010
         TCS
         TXA
         TCD
         RTL

L070716  PHP
         SEI
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PLP
         RTS

L070722  ENT
         PHD
         TSC
         SEC
         SBC   #$0016
         TCD
         TCS
         LDA   $24
         BNE   L070731
         BRL   L070821
L070731  STZ   L055417
         LDA   #$0007
         STA   $0B
         LDA   #$0001
         STA   $01
         STZ   $05
         STZ   $03
         LDA   #$0044
         STA   $09
         LDA   #$001C
         STA   $07
L07074C  TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         _ClipRect
         LDY   #$0002
         LDA   [$20]
         CMP   $1C
         BNE   L070770
         LDA   [$20],Y
         CMP   $1E
         BNE   L070770
         LDA   $01
         STA   L055417
L070770  PHA
         PHA
         PEA   $8001
         LDA   [$20],Y
         PHA
         LDA   [$20]
         PHA
         _LoadResource
         PLA
         STA   $0D
         PLA
         STA   $0F
         LDY   #$0002
         LDA   [$0D],Y
         STA   $13
         PHA
         LDA   [$0D]
         STA   $11
         PHA
         PEA   $F000
         LDY   #$0006
         LDA   $05
         CLC
         ADC   #$0022
         SEC
         SBC   [$11],Y
         AND   #$FFFE
         PHA
         DEY
         DEY
         LDA   [$11],Y
         LSR
         STA   $15
         LDA   $03
         CLC
         ADC   #$000E
         SEC
         SBC   $15
         PHA
         _DrawIcon
         LDY   #$0002
         PHY
         PEA   $8001
         LDA   [$20],Y
         PHA
         LDA   [$20]
         PHA
         _ReleaseResource
         LDA   $01
         CMP   $24
         BEQ   L070821
         INC
         STA   $01
         LDA   $20
         CLC
         ADC   #$0004
         STA   $20
         BCC   L0707E9
         INC   $22
L0707E9  DEC   $0B
         BEQ   L0707FF
         LDA   $05
         CLC
         ADC   #$0044
         STA   $05
         LDA   $09
         ADC   #$0044
         STA   $09
         JMP   L07074C

L0707FF  JSL   L072328
         LDA   #$0007
         STA   $0B
         STZ   $05
         LDA   #$0044
         STA   $09
         CLC
         LDA   $03
         ADC   #$001C
         STA   $03
         LDA   $07
         ADC   #$001C
         STA   $07
         JMP   L07074C

L070821  LDA   $1A
         STA   $24
         LDA   $19
         STA   $23
         LDX   $17
         TDC
         CLC
         ADC   #$0022
         TCS
         TXA
         TCD
         RTL

L070834  ENT
         PHD
         TSC
         SEC
         SBC   #$003C
         TCD
         TCS
         PHY
         PHY
         PEI   $46
         PEI   $44
         PEA   $0000
         PEI   $42
         _GetCtlHandleFromID
         PLA
         PLX
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33]
         STA   $37
         LDA   [$33],Y
         STA   $39
         LDY   #$0010
         LDA   [$37],Y
         AND   #$0080
         BEQ   L07086C
         BRL   L0709E3
L07086C  INY
         LDA   [$37],Y
         AND   #$00FF
         STA   $3B
         LDY   #$000E
         LDX   #$0006
L07087A  LDA   [$37],Y
         STA   $01,X
         DEY
         DEY
         DEX
         DEX
         BPL   L07087A
         LDY   #$0012
         LDA   [$37],Y
         STA   $27
         LDA   $07
         SEC
         SBC   $03
         DEC
         DEC
         LSR
         LSR
         STA   $1D
         LDA   $05
         SEC
         SBC   $01
         DEC
         LSR
         LSR
         STA   $1F
         LDA   $01
         STA   $09
         SEC
         ADC   $1F
         STA   $0D
         LDA   $03
         STA   $0B
         SEC
         ADC   $1D
         INC
         STA   $0F
         STZ   $25
         LDA   #$FFFF
         STA   $11
L0708BA  LDA   $25
         AND   #$0003
         STA   $21
         LDA   $25
         LSR
         LSR
         STA   $23
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         LDA   $3B
         BNE   L0708F8
         LDA   $25
         CMP   $27
         BNE   L0708E5
         LDX   #$0006
L0708DD  LDA   $09,X
         STA   $11,X
         DEX
         DEX
         BPL   L0708DD
L0708E5  PEA   $0000
         LDA   $25
         ASL
         ASL
         ASL
         ASL
         ORA   $25
         PHA
         XBA
         ORA   $01,S
         STA   $01,S
         BRA   L0708FE
L0708F8  PEA   $3333
         PEA   $FFFF
L0708FE  _SpecialRect
         LDA   $0B
         CLC
         ADC   $1D
         STA   $0B
         CLC
         ADC   $1D
         INC
         INC
         STA   $0F
         INC   $25
         LDA   $25
         CMP   #$0010
         BEQ   L070938
         AND   #$0003
         BNE   L0708BA
         LDA   $03
         STA   $0B
         SEC
         ADC   $1D
         STA   $0F
         LDA   $09
         CLC
         ADC   $1F
         STA   $09
         SEC
         ADC   $1F
         STA   $0D
         BRA   L0708BA
L070938  LDA   $11
         BPL   L07093F
         BRL   L0709E3
L07093F  TDC
         CLC
         ADC   #$0011
         STA   $19
         STZ   $1B
         PHY
         PHY
         _NewRgn
         PLA
         PLX
         STA   $2B
         STX   $2D
         PHX
         PHA
         _GetClip
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         _ClipRect
         PEI   $1B
         PEI   $19
         PEA   $FFFC
         PEA   $FFFE
         _InsetRect
         _PenNormal
         PEA   $0002
         PEA   $0001
         _SetPenSize
         PEI   $1B
         PEI   $19
         _FrameRect
         PEI   $1B
         PEI   $19
         PEA   $0002
         PEA   $0001
         _InsetRect
         PEA   $FFFF
         _SetSolidPenPat
         PEI   $1B
         PEI   $19
         _FrameRect
         PEI   $2D
         PEI   $2B
         _SetClip
         PEI   $2D
         PEI   $2B
         _DisposeRgn
         _PenNormal
L0709E3  LDA   $40
         STA   $46
         LDA   $3F
         STA   $45
         LDX   $3D
         TDC
         CLC
         ADC   #$0044
         TCS
         TXA
         TCD
         RTL

L0709F6  ENT
         PHA
         LDAL  L055161
         STAL  L070A08+1
         LDAL  L055162
         STAL  L070A08+2
         PLA
L070A08  JSL   $000000
         JMPL  L096998

L070A10  ENT
         PHB
         PHD
         TSC
         TCD
         STZ   $11
         LDY   $07
         BEQ   L070A32
         SEP   #$20
         PEI   $0E
         PLB
         PLB
         DEY
         BEQ   L070A2C
L070A23  LDA   ($0D),Y
         CMP   [$09],Y
         BNE   L070A39
         DEY
         BNE   L070A23
L070A2C  LDA   ($0D)
         CMP   [$09]
         BNE   L070A39
L070A32  REP   #$20
         LDA   #$0001
         STA   $11
L070A39  REP   #$20
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

L070A4D  ENT
         PHB
         PHD
         TSC
         SEC
         SBC   #$001A
         TCD
         TCS
         STZ   $2F
         PHA
         _GetCurResourceFile
         PLA
         STA   $15
         STA   $13
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $11
         LDA   #$0001
         STA   $09
L070A78  LDA   $09
         CMP   $11
         BCC   L070A83
         BEQ   L070A83
         BRL   L070B80
L070A83  PHA
         PHA
         PEA   $8014
         PEA   $0001
         PEI   $2D
         _LoadResource
         PLY
         PLA
         BCS   L070B14
         STA   $19
         STY   $17
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         STA   $17
         STX   $19
         LDA   [$17]
         CMP   #$0001
         BNE   L070B14
         LDY   #$0002
         LDA   [$17],Y
         STA   $05
         INY
         INY
         LDA   [$17],Y
         STA   $07
         CLC
         LDA   $17
         ADC   #$0006
         STA   $17
         BCC   L070AC8
         INC   $19
L070AC8  STZ   $01
         STZ   $03
L070ACC  LDA   $03
         CMP   $07
         BNE   L070AD6
         LDA   $01
         CMP   $05
L070AD6  BCS   L070B14
         PHA
         PEI   $2B
         PEI   $29
         CLC
         LDA   $17
         LDX   $19
         ADC   #$0004
         BCC   L070AE8
         INX
L070AE8  PHX
         PHA
         JSL   L071C56
         PLA
         BNE   L070B6F
         LDY   #$0004
         LDA   [$17],Y
         AND   #$00FF
         CLC
         LDX   $19
         ADC   $17
         BCC   L070B01
         INX
L070B01  CLC
         ADC   #$0005
         BCC   L070B08
         INX
L070B08  STX   $19
         STA   $17
         INC   $01
         BNE   L070ACC
         INC   $03
         BRA   L070ACC
L070B14  LDA   $09
         CMP   $11
         BEQ   L070B6A
         PHA
         PHA
         PEI   $13
         _GetMapHandle
         PLY
         PLA
         BCS   L070B80
         STA   $0F
         STY   $0D
         LDA   $0E
         BEQ   L070B80
         LDY   #$0002
         LDA   [$0D]
         TAX
         LDA   [$0D],Y
         STA   $0F
         STX   $0D
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         STX   $0F
         STA   $0D
         LDA   $0E
         BEQ   L070B80
         LDY   #$0002
         LDA   [$0D]
         TAX
         LDA   [$0D],Y
         STA   $0F
         STX   $0D
         LDY   #$0012
         LDA   [$0D],Y
         STA   $13
         PHA
         _SetCurResourceFile
         BCS   L070B80
L070B6A  INC   $09
         BRL   L070A78
L070B6F  INC   $2F
         LDA   $13
         STA   [$25]
         LDY   #$0002
         LDA   [$17]
         STA   [$21]
         LDA   [$17],Y
         STA   [$21],Y
L070B80  PEI   $15
         _SetCurResourceFile
         PHA
         PEI   $11
         _SetResourceFileDepth
         PLA
         LDA   $1F
         STA   $2D
         LDA   $1D
         STA   $2B
         LDX   $1B
         TDC
         CLC
         ADC   #$002A
         TCS
         TXA
         TCD
         PLB
         RTL

L070BA8  ENT
         PHB
         PHD
         TSC
         SEC
         SBC   #$003C
         TCD
         TCS
         PHA
         _GetCurResourceFile
         PLA
         STA   $19
         STA   $17
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $15
         STZ   $3B
         LDA   #$0001
         STA   $0F
L070BD3  LDA   $0F
         CMP   $15
         BEQ   L070BDE
         BCC   L070BDE
         BRL   L070D9D
L070BDE  PHA
         PHA
         PEA   $8014
         PEA   $0001
         PEI   $4B
         _LoadResource
         PLY
         PLA
         BCC   L070BF6
         BRL   L070D2B
L070BF6  STA   $21
         STY   $1F
         STA   $1D
         STY   $1B
         LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         STA   $1B
         STX   $1D
         LDA   [$1B]
         CMP   #$0001
         BEQ   L070C14
         BRL   L070D2B
L070C14  LDY   #$0002
         LDA   [$1B],Y
         STA   $0B
         INY
         INY
         LDA   [$1B],Y
         STA   $0D
         CLC
         LDA   $1B
         ADC   #$0006
         STA   $1B
         BCC   L070C2D
         INC   $1D
L070C2D  STZ   $07
         STZ   $09
L070C31  LDA   $09
         CMP   $0D
         BNE   L070C3B
         LDA   $07
         CMP   $0B
L070C3B  BCC   L070C40
         BRL   L070D2B
L070C40  LDY   #$0004
         LDA   [$1B],Y
         AND   #$00FF
         CLC
         ADC   #$0005
         STA   $05
         LDX   $1D
         ADC   $1B
         BCC   L070C55
         INX
L070C55  STX   $2D
         STA   $2B
         LDA   $47
         CMP   [$1B]
         BNE   L070C6A
         LDA   $49
         LDY   #$0002
         CMP   [$1B],Y
         BNE   L070C6A
         BEQ   L070C7A
L070C6A  LDA   $2D
         STA   $1D
         LDA   $2B
         STA   $1B
         INC   $07
         BNE   L070C31
         INC   $09
         BRA   L070C31
L070C7A  LDY   #$0002
         LDA   [$1F],Y
         STA   $03
         LDA   [$1F]
         STA   $01
         LDY   #$0004
         LDA   [$01],Y
         BNE   L070CA5
         DEY
         DEY
         LDA   [$01],Y
         DEC
         BNE   L070CA5
         PEA   $8014
         PEA   $0001
         PEI   $4B
         _RemoveResource
         BRL   L070D2B
L070CA5  SEC
         LDY   #$0002
         LDA   [$01],Y
         SBC   #$0001
         STA   [$01],Y
         BCS   L070CB9
         INY
         INY
         LDA   [$01],Y
         DEC
         STA   [$01],Y
L070CB9  PHA
         PHA
         PEI   $21
         PEI   $1F
         _GetHandleSize
         PLA
         STA   $33
         PLA
         STA   $35
         CLC
         LDY   #$0002
         LDA   [$1F]
         ADC   $33
         STA   $2F
         LDA   [$1F],Y
         ADC   $35
         STA   $31
         SEC
         LDA   $2F
         SBC   $2B
         STA   $37
         LDA   $31
         SBC   $2D
         STA   $39
         LDA   $37
         ORA   $39
         BEQ   L070D02
         PEI   $2D
         PEI   $2B
         PEI   $1D
         PEI   $1B
         PEI   $39
         PEI   $37
         _BlockMove
L070D02  LDA   $33
         LDX   $35
         SEC
         SBC   $05
         BCS   L070D0C
         DEX
L070D0C  PHX
         PHA
         PEI   $21
         PEI   $1F
         _SetHandleSize
         PEA   $FFFF
         PEA   $8014
         PEA   $0001
         PEI   $4B
         _MarkResourceChange
L070D2B  PHA
         PEI   $4B
         PEI   $49
         PEI   $47
         _GetResourceAttr
         PLA
         BCS   L070D42
         LDA   $17
         STA   $3B
         BRA   L070D9D
L070D42  LDA   $0F
         CMP   $15
         BEQ   L070D98
         PHA
         PHA
         PEI   $17
         _GetMapHandle
         PLY
         PLA
         BCS   L070D9D
         STA   $13
         STY   $11
         LDA   $12
         BEQ   L070D9D
         LDY   #$0002
         LDA   [$11]
         TAX
         LDA   [$11],Y
         STA   $13
         STX   $11
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         STX   $13
         STA   $11
         LDA   $12
         BEQ   L070D9D
         LDY   #$0002
         LDA   [$11]
         TAX
         LDA   [$11],Y
         STA   $13
         STX   $11
         LDY   #$0012
         LDA   [$11],Y
         STA   $17
         PHA
         _SetCurResourceFile
         BCS   L070D9D
L070D98  INC   $0F
         BRL   L070BD3
L070D9D  LDA   [$43]
         AND   #$00FF
         BNE   L070DA7
         BRL   L070F52
L070DA7  LDA   $3B
         BNE   L070DAE
         BRL   L070F55
L070DAE  PEI   $3B
         _SetCurResourceFile
         BCC   L070DBC
         BRL   L070F55
L070DBC  PHA
         PHA
         PEA   $8014
         PEA   $0001
         PEI   $4B
         _LoadResource
         PLA
         STA   $1B
         PLA
         STA   $1D
         BCS   L070DD8
         BRL   L070E63
L070DD8  PHA
         PHA
         LDA   [$43]
         AND   #$00FF
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PHA
         PHA
         _NewHandle
         PLY
         PLA
         BCC   L070DFE
         BRL   L070F55
L070DFE  STA   $1D
         STY   $1B
         LDY   #$0002
         LDA   [$1B]
         STA   $01
         LDA   [$1B],Y
         STA   $03
         LDA   #$0001
         STA   [$01]
         LDY   #$0002
         STA   [$01],Y
         INY
         INY
         DEC
         STA   [$01],Y
         INY
         INY
         LDA   $47
         STA   [$01],Y
         INY
         INY
         LDA   $49
         STA   [$01],Y
         PEI   $45
         PEI   $43
         CLC
         LDA   $01
         ADC   #$000A
         TAX
         LDA   $03
         ADC   #$0000
         PHA
         PHX
         LDA   [$43]
         AND   #$00FF
         INC
         PEA   $0000
         PHA
         _BlockMove
         PEI   $1D
         PEI   $1B
         PEA   $0000
         PEA   $8014
         PEA   $0001
         PEI   $4B
         _AddResource
         BRA   L070EA8
L070E63  LDY   #$0002
         LDA   [$1B]
         STA   $01
         LDA   [$1B],Y
         STA   $03
         LDA   [$01]
         CMP   #$0001
         BNE   L070EA8
         PHA
         PHA
         PEI   $1D
         PEI   $1B
         _GetHandleSize
         PLA
         STA   $33
         PLA
         STA   $35
         CLC
         LDA   [$43]
         AND   #$00FF
         ADC   #$0005
         ADC   $33
         TAX
         LDA   $35
         ADC   #$0000
         PHA
         PHX
         PEI   $1D
         PEI   $1B
         _SetHandleSize
         BCC   L070EAB
L070EA8  BRL   L070F55
L070EAB  STZ   $07
         STZ   $09
         LDY   #$0002
         LDA   [$1B],Y
         STA   $03
         LDA   [$1B]
         STA   $01
         LDA   [$01],Y
         STA   $0B
         INY
         INY
         LDA   [$01],Y
         STA   $0D
         CLC
         LDA   $01
         ADC   #$0006
         STA   $01
         BCC   L070ED0
         INC   $03
L070ED0  LDA   $0B
         CMP   $07
         BNE   L070EDC
         LDA   $0D
         CMP   $0D
         BEQ   L070EF8
L070EDC  LDY   #$0004
         LDA   [$01],Y
         AND   #$00FF
         CLC
         ADC   #$0005
         ADC   $01
         STA   $01
         BCC   L070EF0
         INC   $03
L070EF0  INC   $07
         BNE   L070ED0
         INC   $09
         BNE   L070ED0
L070EF8  LDA   $47
         STA   [$01]
         LDY   #$0002
         LDA   $49
         STA   [$01],Y
         PEI   $45
         PEI   $43
         CLC
         LDX   $03
         LDA   $01
         ADC   #$0004
         BCC   L070F12
         INX
L070F12  PHX
         PHA
         LDA   [$43]
         AND   #$00FF
         INC
         PEA   $0000
         PHA
         _BlockMove
         LDY   #$0002
         LDA   [$1F],Y
         STA   $03
         LDA   [$1F]
         STA   $01
         LDA   [$01],Y
         INC
         STA   [$01],Y
         BNE   L070F3E
         INY
         INY
         LDA   [$01],Y
         INC
         STA   [$01],Y
L070F3E  PEA   $FFFF
         PEA   $8014
         PEA   $0001
         PEI   $4B
         _MarkResourceChange
         BRA   L070F55
L070F52  LDX   #$0000
L070F55  PEI   $19
         _SetCurResourceFile
         PHA
         PEI   $15
         _SetResourceFileDepth
         PLA
         LDA   $41
         STA   $4B
         LDA   $3F
         STA   $49
         LDX   $3D
         TDC
         CLC
         ADC   #$0048
         TCS
         TXA
         TCD
         PLB
         RTL

L070F7D  ENT
         PHB
         PHD
         TSC
         SEC
         SBC   #$0018
         TCD
         TCS
         LDA   #$0000
         STA   [$25]
         PHA
         _GetCurResourceFile
         PLA
         STA   $13
         STA   $11
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $0F
         LDA   #$0001
         STA   $09
L070FAB  LDA   $09
         CMP   $0F
         BCC   L070FB6
         BEQ   L070FB6
         BRL   L0710C0
L070FB6  PHA
         PHA
         PEA   $8014
         PEA   $0001
         PEI   $23
         _LoadResource
         PLY
         PLA
         BCS   L071040
         STA   $17
         STY   $15
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $15
         STX   $17
         LDA   [$15]
         CMP   #$0001
         BNE   L071040
         LDY   #$0002
         LDA   [$15],Y
         STA   $05
         INY
         INY
         LDA   [$15],Y
         STA   $07
         CLC
         LDA   $15
         ADC   #$0006
         STA   $15
         BCC   L070FFB
         INC   $17
L070FFB  STZ   $01
         STZ   $03
L070FFF  LDA   $03
         CMP   $07
         BNE   L071009
         LDA   $01
         CMP   $05
L071009  BCS   L071040
         LDA   $1F
         CMP   [$15]
         BNE   L07101D
         LDY   #$0002
         LDA   $21
         CMP   [$15],Y
         BNE   L07101D
         BRL   L07109B
L07101D  LDY   #$0004
         LDA   [$15],Y
         AND   #$00FF
         CLC
         LDX   $17
         ADC   $15
         BCC   L07102D
         INX
L07102D  CLC
         ADC   #$0005
         BCC   L071034
         INX
L071034  STX   $17
         STA   $15
         INC   $01
         BNE   L070FFF
         INC   $03
         BRA   L070FFF
L071040  LDA   $09
         CMP   $0F
         BEQ   L071096
         PHA
         PHA
         PEI   $11
         _GetMapHandle
         PLY
         PLA
         BCS   L0710C0
         STA   $0D
         STY   $0B
         LDA   $0C
         BEQ   L0710C0
         LDY   #$0002
         LDA   [$0B]
         TAX
         LDA   [$0B],Y
         STA   $0D
         STX   $0B
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STX   $0D
         STA   $0B
         LDA   $0C
         BEQ   L0710C0
         LDY   #$0002
         LDA   [$0B]
         TAX
         LDA   [$0B],Y
         STA   $0D
         STX   $0B
         LDY   #$0012
         LDA   [$0B],Y
         STA   $11
         PHA
         _SetCurResourceFile
         BCS   L0710C0
L071096  INC   $09
         BRL   L070FAB
L07109B  CLC
         LDA   $15
         ADC   #$0004
         STA   $15
         BCC   L0710A7
         INC   $17
L0710A7  LDA   [$15]
         AND   #$00FF
         INC
         PEI   $17
         PEI   $15
         PEI   $27
         PEI   $25
         PEA   $0000
         PHA
         _BlockMove
L0710C0  PEI   $13
         _SetCurResourceFile
         PHA
         PEI   $0F
         _SetResourceFileDepth
         PLA
         LDA   $1D
         STA   $23
         LDA   $1B
         STA   $21
         LDX   $19
         TDC
         CLC
         ADC   #$0020
         TCS
         TXA
         TCD
         PLB
         RTL

L0710E8  PHD
         TSC
         SEC
         SBC   #$000A
         TCD
         TCS
         STZ   $16
         STZ   $18
         LDY   #$0002
         LDA   [$12]
         STA   $05
         LDA   [$12],Y
         STA   $07
         LDY   $10
         BMI   L071156
         BEQ   L071156
         LDA   [$05],Y
         BEQ   L071156
         INC
         INC
         STA   $09
         PHA
         PHA
         PEA   $0000
         PEI   $09
         LDA   L054FBD
         PHA
         PEA   $0000
         PHA
         PHA
         _NewHandle
         PLA
         PLX
         BCS   L071156
         STA   $16
         STX   $18
         LDY   #$0002
         LDA   [$16]
         STA   $01
         LDA   [$16],Y
         STA   $03
         LDA   [$12]
         CLC
         ADC   $10
         STA   $05
         LDA   [$12],Y
         ADC   #$0000
         STA   $07
         PEI   $07
         PEI   $05
         PEI   $03
         PEI   $01
         PEA   $0000
         PEI   $09
         JSL   L070597
L071156  LDA   $0E
         STA   $14
         LDA   $0D
         STA   $13
         LDX   $0B
         TDC
         CLC
         ADC   #$0012
         TCS
         TXA
         TCD
         RTL

L071169  ENT
         PHD
         TSC
         SEC
         SBC   #$0016
         TCD
         TCS
         PHY
         PHY
         PEI   $24
         PEI   $22
         PEA   $0000
         PEI   $20
         JSL   L151367
         PLA
         STA   $01
         PLA
         STA   $03
         LDY   #$0002
         LDA   [$01]
         STA   $05
         LDA   [$01],Y
         STA   $07
         LDY   #$001C
         LDA   [$05],Y
         STA   $09
         INY
         INY
         LDA   [$05],Y
         STA   $0B
         LDY   #$0002
         LDA   [$09]
         STA   $0D
         LDA   [$09],Y
         STA   $0F
         LDY   #$0004
         LDA   [$0D],Y
         STA   $11
         STA   [$1C]
         BEQ   L0711D8
         LDA   [$0D]
         STA   $13
         LDY   #$0002
         LDA   [$0D],Y
         STA   $15
         LDA   [$13],Y
         PHA
         LDA   [$13]
         PHA
         LDA   $1C
         LDX   $1E
         INC
         BNE   L0711CD
         INX
L0711CD  PHX
         PHA
         PEA   $0000
         PEI   $11
         JSL   L070597
L0711D8  LDA   $1A
         STA   $24
         LDA   $19
         STA   $23
         LDX   $17
         TDC
         CLC
         ADC   #$0022
         TCS
         TXA
         TCD
         RTL

L0711EB  ENT
         PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         LDA   #L041D73
         STA   $01
         LDA   #^L041D73
         STA   $03
         LDY   #$0002
L0711FE  LDA   [$01]
         BMI   L071242
         LDA   $0C
         CMP   [$01]
         BCC   L07120E
         LDA   [$01],Y
         CMP   $0C
         BCS   L07121C
L07120E  LDA   $01
         CLC
         ADC   #$0008
         STA   $01
         BCC   L0711FE
         INC   $03
         BRA   L0711FE
L07121C  LDA   $0C
         SEC
         SBC   [$01]
         TAX
         INY
         INY
         LDA   [$01],Y
         STA   $0E
         INY
         INY
         LDA   [$01],Y
         STA   $10
L07122E  DEX
         BMI   L071270
         LDA   [$0E]
         AND   #$00FF
         INC
         CLC
         ADC   $0E
         STA   $0E
         BCC   L07122E
         INC   $10
         BRA   L07122E
L071242  PEA   ^L07129C
         PEA   L07129C
         PEA   $0000
         PEI   $0C
         PEA   $0004
         JSL   L07334A
         PLA
         PLA
         LDAL  L07129D
         STAL  L071280+$17
         LDAL  L07129F
         STAL  L071280+$19
         LDA   #L071280
         STA   $0E
         LDA   #^L071280
         STA   $0E
L071270  LDA   $0A
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

L071280  STR   'Missing Error String #xxxx.'

L07129C  DB    $00
L07129D  DB    $00
         DB    $00
L07129F  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L0712B0  ENT
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
         STZ   $09
L0712C5  LDA   $01
         STA   $05
         LDA   $03
         STA   $07
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L071B83
         LDA   $01
         SEC
         SBC   $05
         STA   $09
         STA   [$10]
         PEI   $07
         PEI   $05
         LDA   $10
         LDX   $12
         INC
         BNE   L0712EF
         INX
L0712EF  PHX
         PHA
         PEA   $0000
         PEI   $09
         JSL   L070597
         LDA   [$01]
         AND   #$00FF
         BEQ   L071307
         INC   $01
         BNE   L071307
         INC   $03
L071307  LDA   $09
         BNE   L071312
         LDA   [$01]
         AND   #$00FF
         BNE   L0712C5
L071312  LDY   #$0002
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

L071330  ENT
         PHD
         TSC
         SEC
         SBC   #$000C
         TCD
         TCS
         STZ   $1A
         STZ   $01
         LDY   #$0002
         LDA   $16
         ORA   $18
         BEQ   L071355
         LDA   [$16]
         STA   $05
         LDA   [$16],Y
         STA   $07
         ORA   $05
         BEQ   L071355
         LDA   [$05]
         STA   $01
L071355  STZ   $03
         LDA   $12
         ORA   $14
         BEQ   L07136D
         LDA   [$12]
         STA   $09
         LDA   [$12],Y
         STA   $0B
         ORA   $09
         BEQ   L07136D
         LDA   [$09]
         STA   $03
L07136D  LDA   $01
         CMP   $03
         BNE   L071397
         TAY
         BEQ   L071395
         INY
         LDA   #$0000
         TAX
         SEP   #$20
L07137D  LDA   [$05],Y
         TAX
         LDAL  L0714D9,X
         PHA
         LDA   [$09],Y
         TAX
         PLA
         CMPL  L0714D9,X
         BNE   L071397
         DEY
         CPY   #$0001
         BNE   L07137D
L071395  INC   $1A
L071397  REP   #$20
         LDA   $10
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

L0713AC  PHD
         TSC
         SEC
         SBC   #$000C
         TCD
         TCS
         STZ   $1A
         LDY   #$0002
         LDA   [$12]
         STA   $01
         LDA   [$12],Y
         STA   $03
         LDA   [$01]
         STA   $09
         BEQ   L07143F
         STZ   $0B
         LDA   $16
         ORA   $18
         BEQ   L0713DF
         LDA   [$16]
         STA   $05
         LDA   [$16],Y
         STA   $07
         ORA   $05
         BEQ   L0713DF
         LDA   [$05]
         BNE   L0713F4
L0713DF  INC
         INC
         CLC
         ADC   $01
         STA   $01
         BCC   L0713EA
         INC   $03
L0713EA  LDA   [$01]
         BEQ   L071436
         DEC   $09
         BNE   L0713DF
         BRA   L07143F
L0713F4  STA   $0B
         LDA   #$0000
L0713F9  INC
         INC
         CLC
         ADC   $01
         STA   $01
         BCC   L071404
         INC   $03
L071404  LDA   [$01]
         CMP   $0B
         BNE   L07142E
         TAY
         INY
         LDA   #$0000
         TAX
         SEP   #$20
L071412  LDA   [$01],Y
         TAX
         LDAL  L0714D9,X
         PHA
         LDA   [$05],Y
         TAX
         PLA
         CMPL  L0714D9,X
         BNE   L07142C
         DEY
         CPY   #$0001
         BNE   L071412
         BRA   L071436
L07142C  REP   #$20
L07142E  DEC   $09
         BEQ   L07143F
         LDA   [$01]
         BRA   L0713F9
L071436  REP   #$20
         LDA   $01
         SEC
         SBC   [$12]
         STA   $1A
L07143F  LDA   $10
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

L071452  PHD
         PHY
         PHY
         TSC
         TCD
         STZ   $10
         LDA   $0A
         ORA   $0C
         BEQ   L07147F
         LDA   [$0A]
         STA   $01
         LDY   #$0002
         LDA   [$0A],Y
         STA   $03
         ORA   $01
         BEQ   L07147F
         LDA   [$01]
         BEQ   L07147F
         TAX
         SEP   #$20
         LDA   $0E
L071477  CMP   [$01],Y
         BEQ   L071482
         INY
         DEX
         BNE   L071477
L07147F  LDY   #$0001
L071482  REP   #$20
         DEY
         STY   $10
         LDA   $08
         STA   $0E
         LDA   $07
         STA   $0D
         TDC
         TCS
         PLY
         PLY
         PLD
         PLY
         PLY
         PLY
         RTL

L071498  ENT
         SEP   #$30
         LDA   $04,S
         TAX
         LDAL  L0714D9,X
         STA   $06,S
         LDA   #$00
         STA   $07,S
         REP   #$30
         LDA   $02,S
         STA   $04,S
         LDA   $01,S
         STA   $03,S
         PLY
         RTL

L0714B3  ENT
         PHD
         TSC
         TCD
         SEP   #$30
         LDA   [$06]
         BEQ   L0714C9
         TAY
L0714BD  LDA   [$06],Y
         TAX
         LDAL  L0714D9,X
         STA   [$06],Y
         DEY
         BNE   L0714BD
L0714C9  REP   #$30
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

L0714D9  ENT
         HEX   000102030405060708090A0B0C0D0E0F
         HEX   101112131415161718191A1B1C1D1E1F
         HEX   202122232425262728292A2B2C2D2E2F
         HEX   303132333435363738393A3B3C3D3E3F
         HEX   406162636465666768696A6B6C6D6E6F
         HEX   707172737475767778797A5B5C5D5E5F
         HEX   606162636465666768696A6B6C6D6E6F
         HEX   707172737475767778797A7B7C7D7E7F
         HEX   616163656E6F75616161616161636565
         HEX   6565696969696E6F6F6F6F6F75757575
         HEX   A0A1A2A3A4A5A6A7A8A9AAABACAD616F
         HEX   B0B1B2B3B4B5B6B7B8B9BA616FBD616F
         HEX   C0C1C2C3C405C6C7C8C9CA61616F6F6F
         HEX   D0D1D2D3D4D5D6D77979DADBDCDDDEDF
         HEX   E0E1E2E3E46165616565696969696F6F
         HEX   F06F757575F5F6F7F8F9FAFBFCFDFEFF
L0715D9  ENT
         PHD
         TSC
         SEC
         SBC   #$002C
         TCD
         TCS
         LDA   $34
         BNE   L0715F5
         LDA   $32
         CMP   #$000A
         BCS   L0715F5
         CLC
         ADC   #$0130
         XBA
         STA   [$36]
         BRA   L071640
L0715F5  STZ   $01
         STZ   $03
L0715F9  PHA
         PHA
         PHA
         PHA
         PEI   $34
         PEI   $32
         PEA   $0000
         PEA   $000A
         _LongDivide
         PLA
         STA   $32
         PLA
         STA   $34
         PLA
         PLY
         LDX   $03
         STA   $05,X
         INX
         INX
         STX   $03
         INC   $01
         LDA   $32
         BNE   L0715F9
         LDA   $34
         BNE   L0715F9
         SEP   #$20
         LDY   $01
         TYA
         STA   [$36]
         LDX   #$0000
L071632  LDA   $05,X
         CLC
         ADC   #$30
         STA   [$36],Y
         INX
         INX
         DEY
         BNE   L071632
         REP   #$20
L071640  LDA   $30
         STA   $34
         LDA   $2F
         STA   $33
         LDX   $2D
         TDC
         CLC
         ADC   #$0032
         TCS
         TXA
         TCD
         RTL

L071653  PHD
         TSC
         SEC
         SBC   #$0014
         TCD
         TCS
         PHP
         SEI
         PHY
         PHY
         PEA   $0003
         _GetAddress
         PLX
         PLA
         STX   $11
         STA   $13
         PHY
         PHY
         LDA   [$1A]
         TAX
         AND   #$00FF
         PHA
         STAL  L054E4B
         TXA
         XBA
         AND   #$00FF
         PHA
         STAL  L054E4D
         DEC
         STA   $0B
         _Multiply
         PLA
         PLX
         STA   $0D
         ASL
         ASL
         CLC
         ADC   #$0004
         TAX
         LDY   #$0002
         LDA   [$1A],Y
         PHA
         AND   #$00FF
         STAL  L054E4B,X
         INX
         INX
         PLA
         XBA
         AND   #$00FF
         STAL  L054E4B,X
         LDA   #$0006
         STA   $01
         LDA   #$0004
         STA   $03
         LDA   #$0002
         STA   $05
         LDY   #$0004
         LDA   [$1A],Y
         CMP   #$0004
         BNE   L0716E4
         STA   $05
         LDAL  L054F9B
         SEC
         SBC   #$0006
         STA   $1A
         LDAL  L054F9D
         BCS   L0716DF
         DEC
L0716DF  STA   $1C
         LDA   #$0000
L0716E4  STA   $07
         JSR   L071724
         LDA   $07
         STA   $05
         CMP   #$0003
         BNE   L071703
         LDA   #$0002
         STA   $05
         LDA   #L054BDF
         STA   $1A
         LDA   #^L054BDF
         STA   $1C
         BRA   L07170D
L071703  CMP   #$0001
         BNE   L07170D
         LDA   #$0004
         STA   $01
L07170D  JSR   L071724
         PLP
         LDA   $18
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

L071724  STZ   $09
         STZ   $0F
L071728  LDA   $05
         BEQ   L071756
         CMP   #$FFFF
         BEQ   L071756
         CMP   #$0002
         BEQ   L07174B
         LDX   $01
         LDY   $01
         CMP   #$0004
         BEQ   L071745
         LDAL  L054E4B,X
         BRA   L071747
L071745  LDA   [$1A],Y
L071747  INC   $01
         BRA   L071756
L07174B  LDY   $01
         LDA   [$1A],Y
         AND   #$00FF
         ASL
         TAY
         LDA   [$11],Y
L071756  LDX   $03
         STAL  L054E4B,X
         INC   $01
         INC   $03
         INC   $03
         INC   $0F
         LDY   $05
         CPY   #$0001
         BEQ   L071784
         INC   $09
         LDY   $09
         CPY   $0B
         BNE   L071784
         STZ   $09
         LDA   #$0000
         LDX   $03
         STAL  L054E4B,X
         INC   $03
         INC   $03
         INC   $0F
L071784  LDA   $0F
         CMP   $0D
         BNE   L071728
         RTS

L07178B  ENT
         PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         STZ   $12
         LDA   $10
         BEQ   L071813
         PHA
         PHA
         PEA   $8001
         PEA   $0000
         PEA   $0001
         _GetIndResource
         PLA
         STA   [$0C]
         PLA
         LDY   #$0002
         STA   [$0C],Y
         INC   $12
         LDA   $10
         CMP   #$0001
         BEQ   L071813
         TYA
         STA   $01
         INY
         INY
L0717C0  PHY
         PHA
         PHA
         PEA   $8001
         PEA   $0000
         PEI   $01
         _GetIndResource
         PLA
         STA   $03
         PLA
         STA   $05
         PLY
         TYX
L0717DA  DEY
         DEY
         LDA   [$0C],Y
         CMP   $05
         BEQ   L0717E6
         DEY
         DEY
         BRA   L0717EE
L0717E6  DEY
         DEY
         LDA   [$0C],Y
         CMP   $03
         BEQ   L071807
L0717EE  CPY   #$0000
         BNE   L0717DA
         TXY
         LDA   $03
         STA   [$0C],Y
         INY
         INY
         LDA   $05
         STA   [$0C],Y
         INY
         INY
         LDA   $12
         INC
         STA   $12
         BRA   L071808
L071807  TXY
L071808  LDA   $01
         CMP   $10
         BEQ   L071813
         INC
         STA   $01
         BRA   L0717C0
L071813  LDA   $0A
         STA   $10
         LDA   $09
         STA   $0F
         TDC
         TCS
         PLY
         PLY
         PLY
         PLD
         PLY
         PLY
         PLY
         RTL

L071825  ENT
         PHD
         TSC
         TCD
         LDA   $06
         ORA   $08
         BEQ   L071839
         PEI   $08
         PEI   $06
         _DisposeHandle
L071839  LDA   $0A
         ORA   $0C
         BEQ   L07184A
         PEI   $0C
         PEI   $0A
         _DisposeHandle
L07184A  LDA   $04
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

L07185A  ENT
         PHD
         TSC
         TCD
         LDA   $07
         BEQ   L07186C
         PEI   $08
         PEI   $06
         _DisposeHandle
L07186C  LDA   $04
         STA   $08
         LDA   $03
         STA   $07
         TDC
         TCS
         PLD
         PLY
         PLY
         RTL

L07187A  ENT
         PHD
         TSC
         TCD
* AV 202208
*         PHA
*         PHA
*         PHA
*         LDA   $08
*         AND   #$00FF
*         PHA
*         PEI   $06
*         _UnloadSeg
*         BCC   L071893
*         BRK   $FE        ; BUG
*L071893  PLA
*         PLX
*         PLY
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

L0718A4  ENT
         PHD
         TSC
         TCD
         LDY   #$0004
         LDA   [$06],Y
         AND   #$8000
         STA   $0A
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

L0718BF  ENT
         PHD
         TSC
         TCD
         LDY   #$0004
         LDA   [$06],Y
         ORA   #$8000
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

L0718DA  ENT
         PHD
         TSC
         TCD
         LDY   #$0004
         LDA   [$08],Y
         EOR   $06
         AND   #$7FFF
         EOR   $06
         STA   [$08],Y
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

L0718FA  ENT
         PHD
         TSC
         TCD
         LDY   #$0004
         LDA   [$06],Y
         TAX
         AND   #$8000
         STA   $0A
         TXA
         ORA   #$8000
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

L07191C  ENT
         PHD
         TSC
         TCD
         LDY   #$0004
         LDA   [$06],Y
         AND   #$7FFF
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

L071937  ENT
         PHD
         TSC
         TCD
         PHY
         PEI   $0E
         PEI   $0A
         JSL   L072FD5
         PLA
         STA   [$06]
         PHY
         PEI   $10
         PEI   $0C
         JSL   L072FD5
         PLA
         LDY   #$0002
         STA   [$06],Y
         PHY
         PEI   $0E
         PEI   $0A
         JSL   L072FA6
         PLA
         LDY   #$0004
         STA   [$06],Y
         PHY
         PEI   $10
         PEI   $0C
         JSL   L072FA6
         PLA
         LDY   #$0006
         STA   [$06],Y
         LDA   $04
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

L071984  ENT
         PHD
         TSC
         TCD
         STZ   $10
         LDA   $0E
         SEC
         SBC   $0A
         BPL   L071994
         EOR   #$FFFF
         INC
L071994  CMP   $06
         BCS   L0719A9
         LDA   $0C
         SEC
         SBC   $08
         BPL   L0719A3
         EOR   #$FFFF
         INC
L0719A3  CMP   $06
         BCS   L0719A9
         INC   $10
L0719A9  LDA   $04
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

L0719BA  ENT
         PHD
         TSC
         TCD
         STZ   $10
         STZ   $12
         LDA   $0E
         CMP   #$0005
         BCS   L071A09
         TAX
         LDAL  L0719CF,X
         PHA
         RTS

L0719CF  DA    L0719D5-1
         DA    L0719E2-1
         DA    L0719EF-1

L0719D5  PEI   $0C
         PEI   $0A
         PEA   $2012
         JSL   GSOS2
         BRA   L071A09
L0719E2  PEI   $0C
         PEI   $0A
         PEA   $2013
         JSL   GSOS2
         BRA   L071A09
L0719EF  PHA
         PHA
         LDY   #$0012
         LDA   [$06],Y
         PHA
         DEY
         DEY
         LDA   [$06],Y
         PHA
         _GetHandleSize
         PLX
         STX   $10
         PLX
         STX   $12
L071A09  LDX   $03
         STX   $0D
         LDX   $04
         STX   $0E
         PLD
         PLX
         PLX
         PLX
         PLX
         PLX
         CMP   #$0001
         RTL

L071A1B  ENT
         PHD
         TSC
         TCD
         LDA   $0A
         STA   $0C
         SEC
         SBC   $08
         BPL   L071A2D
         LDA   $08
         STA   $0C
         BRA   L071A38
L071A2D  LDA   $0A
         SEC
         SBC   $06
         BMI   L071A38
         LDA   $06
         STA   $0C
L071A38  LDA   $04
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

L071A47  ENT
         PHA
         LDAL  L0551AD
         BEQ   L071A74
         LDA   $0D,S
         CMP   #$0003
         BEQ   L071A5A
         CMP   #$0005
         BNE   L071A74
L071A5A  LDA   $0B,S
         AND   #$0100
         BEQ   L071A74
         LDA   $09,S
         CMP   #$002E
         BNE   L071A74
         LDA   #$000C
         STA   $0D,S
         LDA   #$0000
         STA   $09,S
         STA   $0B,S
L071A74  LDAL  L054F8D
         STAL  L071A85+1
         LDAL  L054F8E
         STAL  L071A85+2
         PLA
L071A85  JMPL  $000000

*L071A89  ENT
*         PHD
*         TSC
*         TCD
*         SEP   #$20
*         LDA   [$06]
*         STA   $0A
*         STZ   $0B
*         REP   #$20
*         LDA   $04
*         STA   $08
*         LDA   $03
*         STA   $07
*         TDC
*         TCS
*         PLD
*         PLY
*         PLY
*         RTL

L071AA4  ENT
         PHD
         TSC
         TCD
         PEI   $06
         PLB
         PLB
         LDA   $04
         STA   $06
         LDA   $03
         STA   $05
         TDC
         TCS
         PLD
         PLY
         RTL

L071AB8  ENT
         PHD
         TSC
         TCD
         PEI   $08
         PEI   $06
         JSL   L071BC3
         LDA   [$06]
         INC
         STA   [$06]
         BNE   L071AD2
         LDY   #$0002
         LDA   [$06],Y
         INC
         STA   [$06],Y
L071AD2  LDA   $04
         STA   $08
         LDA   $03
         STA   $07
         TDC
         TCS
         PLD
         PLY
         PLY
         RTL

L071AE0  ENT
         PHB
         PHD
         PHY
         PHY
         TSC
         TCD
         LDA   #$0000
         TAX
         STA   [$0B]
         LDA   [$0F]
         STA   $01
         LDY   #$0002
         LDA   [$0F],Y
         STA   $03
         PHK
         PLB
         SEP   #$20
         LDY   #$FFFF
L071AFE  LDA   #$20
L071B00  INY
         CMP   [$01],Y
         BEQ   L071B00
         JSR   L071B71
         LDY   #$0002
L071B0B  LDA   [$01],Y
         TAX
         LDA   L0714D9,X	; was LDAL
         CMP   L071B65,Y
         BNE   L071B1C
         DEY
         BPL   L071B0B
         BRA   L071B45
L071B1C  LDY   #$0008
L071B1F  LDA   [$01],Y
         TAX
         LDA   L0714D9,X	; was LDAL
         CMP   L071B68,Y
         BNE   L071B34
         DEY
         BPL   L071B1F
         LDA   #$01
         STA   [$0B]
         BRA   L071B45
L071B34  LDY   #$FFFF
L071B37  INY
         LDA   [$01],Y
         BEQ   L071B42
         CMP   #$0D
         BNE   L071B37
         BRA   L071AFE
L071B42  JSR   L071B71
L071B45  REP   #$20
         LDA   $01
         STA   [$0F]
         LDY   #$0002
         LDA   $03
         STA   [$0F],Y
         LDA   $09
         STA   $11
         LDA   $07
         STA   $0F
         TDC
         TCS
         PLY
         PLY
         PLD
         PLY
         PLY
         PLY
         PLY
         PLB
         RTL

L071B65  ASC   'on '
L071B68  ASC   'function '

L071B71  PHP
         REP   #$20
         TYA
         CLC
         ADC   $01
         STA   $01
         BCC   L071B7E
         INC   $03
L071B7E  LDA   #$0000
         PLP
         RTS

L071B83  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         LDY   #$0002
         LDA   [$0A]
         STA   $01
         LDA   [$0A],Y
         STA   $03
         SEP   #$20
L071B95  LDA   [$01]
         BEQ   L071BA9
         CMP   #$0D
         BEQ   L071BA9
         INC   $01
         BNE   L071B95
         INC   $02
         BNE   L071B95
         INC   $03
         BRA   L071B95
L071BA9  REP   #$20
         LDA   $01
         STA   [$0A]
         LDA   $03
         STA   [$0A],Y
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

L071BC3  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         LDY   #$0002
         LDA   [$0A]
         STA   $01
         LDA   [$0A],Y
         STA   $03
         SEP   #$20
L071BD5  LDA   [$01]
         BEQ   L071BE5
         INC   $01
         BNE   L071BD5
         INC   $02
         BNE   L071BD5
         INC   $03
         BRA   L071BD5
L071BE5  REP   #$20
         LDA   $01
         STA   [$0A]
         LDA   $03
         STA   [$0A],Y
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

L071BFF  ENT
         PHD
         TSC
         TCD
         PHB
         PHB
         PLA
         STA   $06
         LDAL  L054F91
         PHA
         PLB
         PLB
         TDC
         TCS
         PLD
         RTL

L071C12  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         LDY   #$0002
         LDA   [$0A]
         STA   $01
         LDA   [$0A],Y
         STA   $03
         SEP   #$20
         LDA   #$20
         LDY   #$0000
L071C29  CMP   [$01],Y
         BNE   L071C34
         INY
         BNE   L071C29
         INC   $03
         BRA   L071C29
L071C34  REP   #$20
         TYA
         CLC
         ADC   $01
         STA   [$0A]
         LDA   $03
         ADC   #$0000
         LDY   #$0002
         STA   [$0A],Y
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

L071C56  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         STZ   $12
         LDA   #$0000
         TAX
         TAY
         SEP   #$20
         LDA   [$0E]
         CMP   [$0A]
         BNE   L071C84
         TAY
         BEQ   L071C82
L071C6D  LDA   [$0E],Y
         TAX
         LDAL  L0714D9,X
         PHA
         LDA   [$0A],Y
         TAX
         PLA
         CMPL  L0714D9,X
         BNE   L071C84
         DEY
         BNE   L071C6D
L071C82  INC   $12
L071C84  REP   #$20
         LDA   $08
         STA   $10
         LDA   $07
         STA   $0F
         TDC
         TCS
         PLY
         PLY
         PLD
         PLY
         PLY
         PLY
         PLY
         RTL

L071C98  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         LDA   $0A
         STA   $01
         LDA   $0C
         STA   $03
         SEP   #$20
         LDY   #$0000
         TYX
L071CAB  LDA   [$01],Y
         BEQ   L071CB7
         INY
         BNE   L071CAB
         INC   $03
         INX
         BRA   L071CAB
L071CB7  REP   #$20
         STY   $0E
         STX   $10
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

L071CCD  ENT
         PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         LDA   [$10]
         AND   #$00FF
         BEQ   L071D05
         STA   $03
         INC   $10
         BNE   L071CE2
         INC   $12
L071CE2  BRA   L071D0C
L071CE4  ENT
         PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         PHY
         PHY
         PEI   $12
         PEI   $10
         JSL   L071C98
         PLA
         STA   $03
         ORA   $01,S
         BEQ   L071D05
         PLA
         BEQ   L071D0C
         LDA   #$FFFF
         STA   $03
         BRA   L071D0C
L071D05  STZ   $14
         STZ   $16
         BRL   L071D6C
L071D0C  STZ   $14
         STZ   $16
         LDA   #$0000
         TAX
         SEP   #$20
         LDA   [$10]
         TAX
         LDAL  L0714D9,X
         STA   $01
         LDY   #$FFFF
L071D22  INY
         LDA   [$0C],Y
         BEQ   L071D6C
         TAX
         LDAL  L0714D9,X
         CMP   $01
         BNE   L071D22
         REP   #$20
         TYA
         CLC
         ADC   $0C
         STA   $0C
         BCC   L071D3C
         INC   $0E
L071D3C  LDY   #$0000
         TYA
         SEP   #$20
L071D42  LDA   [$0C],Y
         BEQ   L071D6C
         TAX
         LDAL  L0714D9,X
         STA   $05
         LDA   [$10],Y
         TAX
         LDAL  L0714D9,X
         CMP   $05
         BEQ   L071D5D
         LDY   #$0000
         BRA   L071D22
L071D5D  INY
         CPY   $03
         BNE   L071D42
         REP   #$20
         LDA   $0C
         STA   $14
         LDA   $0E
         STA   $16
L071D6C  REP   #$20
         LDA   $0A
         STA   $12
         LDA   $09
         STA   $11
         LDX   $07
         TDC
         CLC
         ADC   #$0010
         TCS
         TXA
         TCD
         RTL

L071D81  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         STZ   $0E
         STZ   $10
         LDA   [$0A]
         AND   #$00FF
         BEQ   L071DD3
         INC
         STA   $01
         LDY   #$0001
L071D97  LDA   [$0A],Y
         AND   #$00FF
         CMP   #$0030
         BCC   L071DCE
         CMP   #$003A
         BCS   L071DCE
         AND   #$000F
         PHA
         LDA   $10
         STA   $03
         LDA   $0E
         ASL
         ROL   $10
         ASL
         ROL   $10
         CLC
         ADC   $0E
         STA   $0E
         LDA   $10
         ADC   $03
         ASL   $0E
         ROL
         TAX
         CLC
         PLA
         ADC   $0E
         STA   $0E
         BCC   L071DCC
         INX
L071DCC  STX   $10
L071DCE  INY
         CPY   $01
         BNE   L071D97
L071DD3  LDA   $08
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

L071DE3  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         PHY
         PHY
         PEI   $0C
         PEI   $0A
         JSL   L071D81
         LDA   [$0A]
         AND   #$00FF
         BEQ   L071E07
         TAY
L071DFA  LDA   [$0A],Y
         AND   #$00FF
         CMP   #$002D
         BEQ   L071E0F
         DEY
         BNE   L071DFA
L071E07  PLA
         PLX
         STA   $0E
         STX   $10
         BRA   L071E21
L071E0F  PLX
         PLA
         EOR   #$FFFF
         TAY
         TXA
         EOR   #$FFFF
         INC
         STA   $0E
         BNE   L071E1F
         INY
L071E1F  STY   $10
L071E21  LDA   $08
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

L071E31  ENT
         PHD
         TSC
         TCD
         STZ   $0E
         STZ   $10
         LDA   $06
         TAX
         ORA   $08
         BEQ   L071E66
         LDY   #$0002
L071E42  CLC
         LDA   [$0A]
         ADC   $0E
         STA   $0E
         LDA   [$0A],Y
         ADC   $10
         STA   $10
         LDA   $0A
         CLC
         ADC   #$0004
         STA   $0A
         BCC   L071E5B
         INC   $0C
L071E5B  DEX
         BNE   L071E42
         LDA   $08
         BEQ   L071E66
         DEC   $08
         BRA   L071E42
L071E66  LDA   $04
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

L071E76  PHD
         TSC
         TCD
         LDA   $06
         AND   #$0007
         ASL
         TAX
         LDA   $06
         LSR   $08
         ROR
         LSR   $08
         ROR
         LSR   $08
         ROR
         CLC
         ADC   $0A
         STA   $0A
         LDA   $08
         ADC   $0C
         STA   $0C
         LDA   [$0A]
         ANDL  L071EB3,X
         BEQ   L071EA1
         LDA   #$0001
L071EA1  STA   $0E
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

L071EB3  DW    $0080
         DW    $0040
         DW    $0020
         DW    $0010
         DW    $0008
         DW    $0004
         DW    $0002
         DW    $0001
L071EC3  DW    $0000
L071EC5  ENT
         LDA   #$0001
         STAL  L071EC3
         BRA   L071ED5
L071ECE  ENT
         LDA   #$0000
         STAL  L071EC3
L071ED5  PHB
         PHD
         TSC
         TCD
         LDAL  L071EC3
         BEQ   L071EEB
         LSR   $09
         ROR   $07
         LDA   #$0000
         ROL
         STAL  L071EC3
L071EEB  ASL   $07
         ROL   $09
         LDA   $09
         BEQ   L071F07
L071EF3  PEI   $0C
         PLB
         PLB
         LDY   #$0000
         TYA
L071EFB  STA   ($0B),Y
         INY
         INY
         BNE   L071EFB
         INC   $0D
         DEC   $09
         BNE   L071EF3
L071F07  PEI   $0C
         PLB
         PLB
         LDY   $07
         BEQ   L071F1E
         LDA   #$0000
         DEY
         DEY
         BEQ   L071F1C
L071F16  STA   ($0B),Y
         DEY
         DEY
         BNE   L071F16
L071F1C  STA   ($0B)
L071F1E  LDAL  L071EC3
         BEQ   L071F2E
         LDY   $07
         SEP   #$20
         LDA   #$00
         STA   ($0B),Y
         REP   #$20
L071F2E  LDA   $05
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

L071F3F  ENT
         PHD
         TSC
         TCD
         LDA   $06
         LDX   $08
         INC
         BNE   L071F4A
         INX
L071F4A  STA   $0A
         STX   $0C
         SEP   #$30
         LDA   [$06]
         TAY
         LDA   #$00
         STA   [$0A],Y
         REP   #$30
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

L071F67  ENT
         PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         STZ   $10
         STZ   $12
         LDA   $0C
         ORA   $0E
         BEQ   L071FE7
         LDA   [$0C]
         STA   $03
         LDY   #$0002
         LDA   [$0C],Y
         STA   $05
         ORA   $03
         BEQ   L071FE7
         PHY
         PHY
         PEI   $05
         PEI   $03
         JSL   L071C98
         PLA
         PLX
         TAX
         BEQ   L071FE7
         STA   $01
         PHY
         PHY
         CLC
         ADC   #$0002
         LDX   #$0000
         BCC   L071FA3
         INX
L071FA3  PHX
         PHA
         LDAL  L054FBD
         PHA
         LDA   #$0000
         PHA
         PHA
         PHA
         _NewHandle
         PLA
         PLX
         BCS   L071FE7
         STA   $10
         STX   $12
         LDY   #$0002
         LDA   [$0C],Y
         PHA
         LDA   [$0C]
         PHA
         LDA   [$10]
         STA   $03
         CLC
         ADC   #$0002
         TAX
         LDA   [$10],Y
         STA   $05
         BCC   L071FD8
         INC
L071FD8  PHA
         PHX
         PEA   $0000
         PEI   $01
         JSL   L070597
         LDA   $01
         STA   [$03]
L071FE7  LDA   $0A
         STA   $0E
         LDA   $09
         STA   $0D
         TDC
         TCS
         PLY
         PLY
         PLY
         PLD
         PLY
         PLY
         RTL

L071FF8  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         LDA   $0A
         CLC
         ADC   #$0001
         STA   $01
         LDA   $0C
         ADC   #$0000
         STA   $03
         SEP   #$30
         LDY   #$00
L072010  LDA   [$0E],Y
         BEQ   L07201B
         STA   [$01],Y
         INY
         BNE   L072010
         DEY
         DEY
L07201B  TYA
         STA   [$0A]
         REP   #$30
         LDA   $08
         STA   $10
         LDA   $07
         STA   $0F
         TDC
         TCS
         PLY
         PLY
         PLD
         PLY
         PLY
         PLY
         PLY
         RTL

L072032  ENT
         PHD
         TSC
         CLC
         ADC   #$FDE8
         TCS
         ADC   #$0127
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $E3
         PLX
         STX   $E5
         PHY
         JSL   L0727BF
         PLA
         STA   $E1
         LDA   L054FA3
         LDX   L054FA5
         PHX
         PHA
         JSL   L07185A
         LDA   $FA
         BNE   L072092
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         PEA   ^L040A7E
         PEA   L040A7E
         PEA   $0003
         JSL   L0313BE
         PHY
         PHY
         LDAL  L0540CF
         PHA
         LDAL  L0540CD
         PHA
         JSL   L0734F5
         PLA
         STA   L054FA3
         PLA
         STA   L054FA5
         BRL   L072127
L072092  PEA   $0000
         TDC
         CLC
         ADC   #$FFD9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FED9
         PHA
         PEI   $FA
         JSL   L072809
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
         ADC   #$FFDA
         PHA
         LDA   #$00FF
         LDX   #$FFD9
         AND   $00,X
         PHA
         JSL   L1514A2
         PLA
         STA   L054FA3
         PLA
         STA   L054FA5
         PHY
         PHY
         LDA   L054FA3
         LDX   L054FA5
         PHX
         PHA
         JSL   L151301
         PLA
         PLX
         INC
         BNE   L0720EE
         INX
L0720EE  STA   $EB
         LDA   $EB
         JSL   L150488
         PHX
         PHA
         LDA   L054FA3
         LDX   L054FA5
         PHX
         PHA
         JSL   L1512FB
         LDA   L054FA3
         LDX   L054FA5
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         STA   $ED
         STX   $EF
         LDA   $EB
         DEC
         TAY
         LDA   #$0000
         SEP   #$20
         STA   [$ED],Y
         REP   #$20
L072127  LDA   #$00FF
         LDX   #$FFD9
         AND   $00,X
         STA   $D9
         LDA   $D9
         SEC
         SBC   #$00FE
         BVS   L07213C
         EOR   #$8000
L07213C  BMI   L072143
         LDA   $D9
         INC
         STA   $D9
L072143  LDA   $D9
         CLC
         ADC   #$FFD9
         TAX
         SEP   #$20
         LDA   #$00
         STA   $00,X
         REP   #$20
         LDA   L054FA7
         BEQ   L07215F
         LDA   #$0001
         STA   $DF
         BRL   L0721FA
L07215F  PHY
         PHY
         PEI   $F6
         JSL   L072834
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDX   #$0000
         TDC
         CLC
         ADC   #$FFDA
         STAL  L040AF7
         TXA
         STAL  L040AF9
         LDA   #$00FF
         LDX   #$FFD9
         AND   $00,X
         STAL  L040AFB
         PHY
         PHY
         PEI   $E9
         PEI   $E7
         PEA   $0000
         PEA   ^L040ADD
         PEA   L040ADD
         JSL   L15163F
         PLA
         STA   $DB
         PLX
         STX   $DD
         LDA   $F8
         BNE   L0721B2
         PEI   $E9
         PEI   $E7
         PEA   $0002
         JSL   L072E4C
L0721B2  PEI   $E9
         PEI   $E7
         PEA   $0003
         JSL   L073D2E
         PEI   $E9
         PEI   $E7
         JSL   L15102F
L0721C5  PHY
         PHY
         JSL   L07005C
         PLA
         EOR   #$0001
         PHA
         JSL   L0736C8
         PLA
         STA   $DF
         LDX   #$0000
         LDA   $DF
         DEC
         BNE   L0721E0
         INX
L0721E0  PHX
         LDX   #$0000
         LDA   $DF
         DEC
         DEC
         BNE   L0721EB
         INX
L0721EB  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0721C5
         PEI   $E9
         PEI   $E7
         JSL   L072634
L0721FA  LDA   $DF
         STA   $FC
         LDA   L054FB3
         BNE   L072207
         JSL   L073A49
L072207  PEI   $E5
         PEI   $E3
         JSL   L151131
         PEI   $E1
         JSL   L0724F7
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0220
         TCS
         RTL

L072227  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         STZ   $20
         LDY   #$0008
         LDA   [$1C],Y
         BNE   L07223B
         BRL   L072302
L07223B  PHY
         PHY
         PEA   $0000
         PEA   $0000
         PEI   $1E
         PEI   $1C
         JSL   L150371
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDA   $1C
         LDX   $1E
         STA   $01
         STX   $03
         LDA   $0D
         ORA   $0F
         BNE   L072270
         LDY   #$001E
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $09
         STX   $0B
         BRL   L0722F1
L072270  LDA   $1A
         BEQ   L07229D
         LDY   #$001E
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   $0D
         BNE   L072284
         CPX   $0F
L072284  BEQ   L072302
         PEI   $0F
         PEI   $0D
         LDY   #$001A
         LDA   [$01],Y
         JSL   L150488
         JSL   L1512A5
         STA   $09
         STX   $0B
         BRA   L0722F1
L07229D  PEI   $0F
         PEI   $0D
         LDY   #$001A
         LDA   [$01],Y
         JSL   L150488
         JSL   L150F53
         STA   $05
         STX   $07
         PEI   $07
         PEI   $05
         LDY   #$001E
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDY   #$001A
         LDA   [$01],Y
         PHA
         LDY   #$0008
         LDA   [$01],Y
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0722DA
         DEX
L0722DA  JSL   L150F53
         JSL   L033477
         BVS   L0722E7
         EOR   #$8000
L0722E7  BMI   L072302
         LDA   $05
         LDX   $07
         STA   $09
         STX   $0B
L0722F1  PEI   $0B
         PEI   $09
         PEI   $1E
         PEI   $1C
         JSL   L15146C
         LDA   #$0001
         STA   $20
L072302  LDA   $18
         STA   $1E
         LDA   $17
         STA   $1D
         LDA   $15
         TCD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L072314  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L0B8C8B
         JSL   L150F4D
         PLY
         PLY
         PLD
         RTL

L072328  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FBB
         SEC
         SBC   #$0000
         BMI   L07234A
         LDA   L054F97
         INC
         AND   #$0003
         STA   L054F97
         PEA   $0003
         JSL   L0724F7
L07234A  LDA   #$0001
         STA   L054F9F
         PLY
         PLY
         PLD
         RTL

L072354  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $0000
         PEI   $0C
         PEI   $0A
         PEA   ^L05409F
         PEA   L05409F
         JSL   L150365
         PLA
         LSR
         BCC   L072386
         PHY
         PHY
         LDAL  L0540BF
         PHA
         LDAL  L0540BD
         PHA
         JSL   L150132
         PLA
         PLX
         STA   $0E
L072386  LDA   $08
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

L072397  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDA   #$7FFF
         LDX   #$0000
         STA   $01
         STX   $03
         PEI   $1C
         PEI   $1A
         LDA   #$0000
         TAX
         JSL   L033477
         BEQ   L0723B9
         BPL   L0723C0
L0723B9  STZ   $01
         STZ   $03
         BRL   L072444
L0723C0  PEI   $1C
         PEI   $1A
         LDA   #$0000
         LDX   #$4000
         JSL   L033477
         BVS   L0723D3
         EOR   #$8000
L0723D3  BMI   L072444
         LDA   $01
         LDX   $03
         PEI   $03
         PEI   $01
         JSL   L150D50
         PLA
         STA   $05
         PLX
         STX   $07
L0723E7  PEI   $07
         PEI   $05
         LDA   $1A
         LDX   $1C
         JSL   L033477
         BEQ   L072444
         BVS   L0723FA
         EOR   #$8000
L0723FA  BPL   L072444
         LDA   $1A
         LDX   $1C
         PEI   $07
         PEI   $05
         JSL   L150F53
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   $09
         STX   $0B
         PEI   $0B
         PEI   $09
         PEI   $03
         PEI   $01
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   $01
         STX   $03
         LDA   $01
         LDX   $03
         PEI   $03
         PEI   $01
         JSL   L150D50
         PLA
         STA   $05
         PLX
         STX   $07
         BRA   L0723E7
L072444  LDA   $01
         STA   $1E
         LDA   $14
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

L07245A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDA   $1C
         SEC
         SBC   $18
         JSL   L150488
         STA   $05
         STX   $07
         LDA   $1A
         SEC
         SBC   $16
         JSL   L150488
         STA   $09
         STX   $0B
         LDA   $05
         LDX   $07
         PEI   $07
         PEI   $05
         JSL   L150D50
         LDA   $09
         LDX   $0B
         PEI   $0B
         PEI   $09
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $01
         STX   $03
         PEI   $03
         PEI   $01
         LDA   #$F900
         LDX   #$007F
         JSL   L033477
         BVS   L0724B1
         EOR   #$8000
L0724B1  BPL   L0724BF
         LDA   #$0B50
         LDX   #$0000
         STA   $1E
         STX   $20
         BRA   L0724E5
L0724BF  PHY
         PHY
         PHY
         LDA   $01
         LDX   $03
         PEA   $0000
         PEA   $0100
         JSL   L150D50
         PEA   $0000
         PHD
         JSL   L072397
         PEA   $0010
         JSL   L15133D
         PLA
         STA   $1E
         PLX
         STX   $20
L0724E5  LDA   $14
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

L0724F7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   $14
         SEC
         SBC   #$0016
         BEQ   L072511
         BVS   L07250C
         EOR   #$8000
L07250C  BPL   L072511
         BRL   L072622
L072511  LDA   L054FBB
         SEC
         SBC   #$0000
         BPL   L07251D
         BRL   L07261C
L07251D  LDX   #$0000
         LDA   L054FA1
         CMP   $14
         BEQ   L072528
         INX
L072528  TXA
         BNE   L07253C
         LDX   #$0000
         LDA   #$0003
         CMP   $14
         BNE   L072536
         INX
L072536  TXA
         BNE   L07253C
         BRL   L072615
L07253C  LDA   #$FFFF
         STA   $09
         LDA   $14
         DEC
         DEC
         BMI   L07259E
         CMP   #$0005
         BPL   L07259E
         SEC
         SBC   #$0000
         BEQ   L07255E
         DEC
         BEQ   L072586
         DEC
         BEQ   L07258D
         DEC
         DEC
         BEQ   L072596
         BRA   L07259E
L07255E  PHY
         LDA   L054F93
         LDX   L054F95
         PHX
         PHA
         JSL   L0718FA
         PLA
         STA   $01
         LDA   L054F93
         LDX   L054F95
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   $05
         STX   $07
         BRA   L0725A2
L072586  LDA   L054F97
         STA   $09
         BRA   L0725A2
L07258D  JSL   L1517D3
         BRL   L072615
         BRA   L0725A2
L072596  JSL   L150D2C
         BRA   L072615
         BRA   L0725A2
L07259E  LDA   $14
         STA   $09
L0725A2  LDA   #$FFFF
         CMP   $09
         BEQ   L0725C6
         LDA   $09
         ASL
         ASL
         TAX
         LDAL  L054B04+2,X
         PHA
         LDAL  L054B04,X
         PHA
         JSL   L071653
         LDA   #L054E4B
         LDX   #^L054E4B
         STA   $05
         STX   $07
L0725C6  LDX   #$0000
         LDA   #$0003
         CMP   L054FA1
         BNE   L0725D2
         INX
L0725D2  TXA
         BEQ   L0725F9
         LDX   #$0000
         LDA   #$0003
         CMP   $14
         BNE   L0725E0
         INX
L0725E0  TXA
         BEQ   L0725F9
         PHY
         PHY
         PEI   $07
         PEI   $05
         PEA   $8000
         PEA   $0000
         JSL   L150241
         PLA
         STA   $05
         PLX
         STX   $07
L0725F9  PEI   $07
         PEI   $05
         JSL   L150D26
         LDA   $14
         DEC
         DEC
         BNE   L072615
         LDA   L054F93
         LDX   L054F95
         PHX
         PHA
         PEI   $01
         JSL   L0718DA
L072615  LDA   $14
         STA   L054FA1
         BRA   L072622
L07261C  LDA   #$0001
         STA   L054F9F
L072622  LDA   $12
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

L072634  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         LDY   #$00C8
         LDA   [$1C],Y
         TAX
         DEY
         DEY
         LDA   [$1C],Y
         STA   $0F
         STX   $11
L07264A  LDA   $0F
         ORA   $11
         BEQ   L0726C7
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         STA   $01
         STX   $03
         LDY   #$0016
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   #$0000
         BNE   L07266E
         CPX   #$8700
L07266E  BNE   L0726B9
         PHY
         PHY
         LDY   #$0022
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         PEA   $00FF
         PEA   $FFFF
         JSL   L15017E
         PLA
         STA   $0B
         PLX
         STX   $0D
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEI   $0D
         PEI   $0B
         JSL   L1502EE
         LDAL  L05565D
         BNE   L0726B9
         PEI   $0D
         PEI   $0B
         JSL   L07191C
         PEA   $0002
         PEI   $05
         PEI   $09
         PEI   $07
         JSL   L1510BF
L0726B9  LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $0F
         STX   $11
         BRA   L07264A
L0726C7  PEI   $1E
         PEI   $1C
         JSL   L151385
         LDAL  L0550EF
         PHA
         LDAL  L0550ED
         PHA
         JSL   L151131
         LDA   #$0001
         STA   L054F9F
         JSL   L151466
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

L0726F9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEI   $0A
         PEA   $0001
         PEA   $0960
         JSL   L072032
         PLA
         CMP   #$0001
         BEQ   L072719
         LDA   #$0000
         BRA   L07271C
L072719  LDA   #$0001
L07271C  STA   $0C
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

L07272E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFDC
         TCS
         TCD
         JSL   L072314
         LDA   L054F99
         BNE   L072777
         LDA   #$0001
         STA   L054F99
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDA   $2A
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L040A81
         PEA   L040A81
         PEA   ^L040A82
         PEA   L040A82
         PEA   ^L040A83

*

         PEA   L040A83
         JSL   L073C22
         PEA   $0000
         JSL   L07479E
L072777  PHY
         JSL   L0727BF
         PLA
         STA   $15
         PHY
         PHY
         PEA   $0898
         JSL   L072834
         PLA
         STA   $17
         PLX
         STX   $19
         PEI   $19
         PEI   $17
         JSL   L15102F
         PHY
         PEA   $0000
         JSL   L0736C8
         PLA
         STA   $15
         PEI   $19
         PEI   $17
         JSL   L072634
         JSL   L070000
         LDA   $28
         STA   $2A
         LDA   $27
         STA   $29
         LDA   $25
         TCD
         TSC
         CLC
         ADC   #$0028
         TCS
         RTL

L0727BF  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FA1
         STA   $0A
         JSL   L1517D3
         LDA   #$0004
         STA   L054FA1
         LDA   #$0001
         STA   L054F9F
         PLY
         PLY
         PLD
         RTL

L0727E0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         PEI   $0C
         PEA   $0000
         PEA   $07D0
         JSL   L072032
         PLA
         STA   $01
         LDA   $0A
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

L072809  ENT
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
         PEI   $0A
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

L072834  ENT
         PHD
         TSC
         CLC
         ADC   #$FF58
         TCS
         TCD
         STZ   $B0
         STZ   $B2
         PHY
         JSL   L150B6A
         PLA
         STA   $A3
         PHY
         PEA   $FFFF
         JSL   L1506E1
         PLA
         STA   $A1
         LDAL  L055271
         PHA
         JSL   L150B70
         PHY
         PHY
         PEA   $0001
         LDA   $AE
         JSL   L150488
         PHX
         PHA
         JSL   L15041C
         PLA
         STA   $99
         PLX
         STX   $9B
         LDAL  L05565D
         BEQ   L07287C
         BRL   L072AEB
L07287C  TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $004E
         JSL   L071EC5
         LDY   #$0002
         LDA   [$99],Y
         TAX
         LDA   [$99]
         STA   $03
         STX   $05
         LDA   #$004E
         STA   $07
         LDA   [$03]
         STA   $09
         LDY   #$0010
         LDA   [$03],Y
         TAX
         DEY
         DEY
         LDA   [$03],Y
         STA   $0F
         STX   $11
         LDA   #$00C8
         STA   $27
         LDA   #$0280
         STA   $29
         TDC
         CLC
         ADC   #$0045
         PEA   $0000
         PHA
         LDA   #$0006
         CLC
         ADC   $03
         LDX   $05
         BCC   L0728D0
         INX
L0728D0  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$FFFF
         TAX
         STA   $4D
         STX   $4F
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         LDA   #$0012
         CLC
         ADC   $03
         LDX   $05
         BCC   L0728F5
         INX
L0728F5  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0077
         PEA   $0000
         PHA
         LDA   #$001A
         CLC
         ADC   $03
         LDX   $05
         BCC   L072912
         INX
L072912  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         PHY
         PHY
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L15027E
         PLA
         STA   $9D
         PLX
         STX   $9F
         LDAL  L05565D
         BEQ   L072939
         BRL   L072AD9
L072939  LDY   #$0002
         LDA   [$99],Y
         TAX
         LDA   [$99]
         CLC
         ADC   #$0002
         BCC   L072948
         INX
L072948  STA   $A5
         STX   $A7
         LDY   #$0002
         LDA   [$A5],Y
         TAX
         LDA   [$A5]
         STA   $87
         STX   $89
         LDA   $87
         ORA   $89
         BEQ   L072975
         PHY
         PHY
         PEI   $9F
         PEI   $9D
         PEA   $0009
         PEI   $89
         PEI   $87
         JSL   L15163F
         PLA
         STA   $95
         PLX
         STX   $97
L072975  PHY
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         JSL   L1500E3
         PLA
         LSR
         BCC   L0729B6
         PEA   ^L040B03
         PEA   L040B03
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PHY
         PHY
         PEI   $9F
         PEI   $9D
         PEA   $0000
         PEA   ^L040AFD
         PEA   L040AFD
         JSL   L15163F
         PLA
         STA   $95
         PLX
         STX   $97
L0729B6  PHY
         TDC
         CLC
         ADC   #$0077
         PEA   $0000
         PHA
         JSL   L1500E3
         PLA
         LSR
         BCC   L0729F7
         PEA   ^L040B2E
         PEA   L040B2E
         TDC
         CLC
         ADC   #$0077
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PHY
         PHY
         PEI   $9F
         PEI   $9D
         PEA   $0000
         PEA   ^L040B28
         PEA   L040B28
         JSL   L15163F
         PLA
         STA   $95
         PLX
         STX   $97
L0729F7  LDY   #$0002
         LDA   [$99],Y
         TAX
         LDA   [$99]
         CLC
         ADC   #$0022
         BCC   L072A06
         INX
L072A06  STA   $A5
         STX   $A7
         LDA   [$A5]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L072A19
         EOR   #$8000
L072A19  BMI   L072A1E
         BRL   L072AD1
L072A1E  LDA   #$0001
         STA   $93
L072A23  TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$99],Y
         TAX
         LDA   [$99]
         CLC
         ADC   #$0024
         BCC   L072A3B
         INX
L072A3B  PHX
         PHA
         LDA   $93
         JSL   L150488
         TAY
         BNE   L072A47
         DEX
L072A47  DEC
         PEA   $0000
         PEA   $0022
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   $0022
         JSL   L0313BE
         LDA   $71
         LDX   $73
         STA   $8F
         STX   $91
         PHY
         PHY
         PEA   $801D
         PEI   $91
         PEI   $8F
         JSL   L15041C
         PLA
         STA   $8B
         PLX
         STX   $8D
         LDAL  L05565D
         BNE   L072AC6
         PEI   $8D
         PEI   $8B
         JSL   L0718BF
         PHY
         PHY
         PEI   $6D
         PEI   $6B
         PEI   $8D
         PEI   $8B
         JSL   L150241
         PLA
         STA   $6B
         PLX
         STX   $6D
         LDY   #$0002
         LDA   [$8B],Y
         TAX
         LDA   [$8B]
         STA   $71
         STX   $73
         PHY
         PHY
         PEI   $9F
         PEI   $9D
         PEA   $0000
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         JSL   L15163F
         PLA
         STA   $95
         PLX
         STX   $97
L072AC6  LDA   $93
         CMP   $01
         BEQ   L072AD1
         INC   $93
         BRL   L072A23
L072AD1  LDA   $9D
         LDX   $9F
         STA   $B0
         STX   $B2
L072AD9  PEA   $0200
         PEA   $0001
         LDA   $AE
         JSL   L150488
         PHX
         PHA
         JSL   L1510BF
L072AEB  PEI   $A3
         JSL   L150B70
         PHY
         PEI   $A1
         JSL   L1506E1
         PLA
         STA   $A1
         PEA   ^L0540CD
         PEA   L0540CD
         JSL   L151071
         LDA   $AC
         STA   $AE
         LDA   $AB
         STA   $AD
         LDA   $A9
         TCD
         TSC
         CLC
         ADC   #$00AC
         TCS
         RTL

L072B17  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEI   $16
         PEI   $14
         LDA   $12
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         PLA
         STA   $01
         PLX
         STX   $03
         LDAL  L05565D
         BNE   L072B59
         PEI   $10
         PEI   $0E
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0008
         BCC   L072B50
         INX
L072B50  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
L072B59  LDA   $0C
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

L072B6B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PHY
         PHY
         PEI   $0E
         PEI   $0C
         LDA   $0A
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         JSL   L151313
         PLA
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

L072B9F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $01
         STZ   $07
         STZ   $09
         STZ   $03
         STZ   $05
         LDA   $1A
         ORA   $1C
         BEQ   L072BD6
         LDA   [$1A]
         LDY   #$0002
         ORA   [$1A],Y
         BEQ   L072BD6
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $0D
         STX   $0F
         LDA   [$0D]
         STA   $07
L072BD6  LDA   $16
         ORA   $18
         BEQ   L072BF5
         LDA   [$16]
         LDY   #$0002
         ORA   [$16],Y
         BEQ   L072BF5
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $0D
         STX   $0F
         LDA   [$0D]
         STA   $09
L072BF5  LDA   $09
         CLC
         ADC   $07
         STA   $0B
         LDA   $0B
         BPL   L072C03
         BRL   L072CB4
L072C03  BNE   L072C08
         BRL   L072CB4
L072C08  PHY
         PHY
         LDA   $0B
         INC
         INC
         JSL   L150488
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $03
         PLX
         STX   $05
         LDAL  L05565D
         BEQ   L072C34
         BRL   L072CB4
L072C34  LDY   #$0002
         LDA   [$03],Y
         TAX
         LDA   [$03]
         STA   $0D
         STX   $0F
         LDA   $0B
         STA   [$0D]
         LDA   $07
         BEQ   L072C76
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         CLC
         ADC   #$0002
         BCC   L072C57
         INX
L072C57  PHX
         PHA
         LDY   #$0002
         LDA   [$03],Y
         TAX
         LDA   [$03]
         CLC
         ADC   #$0002
         BCC   L072C68
         INX
L072C68  PHX
         PHA
         LDA   $07
         JSL   L150488
         PHX
         PHA
         JSL   L070597
L072C76  LDA   $09
         BEQ   L072CB4
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0002
         BCC   L072C89
         INX
L072C89  PHX
         PHA
         LDY   #$0002
         LDA   [$03],Y
         TAX
         LDA   [$03]
         CLC
         ADC   #$0002
         BCC   L072C9A
         INX
L072C9A  PHX
         PHA
         LDA   $07
         JSL   L150488
         JSL   L150F53
         PHX
         PHA
         LDA   $09
         JSL   L150488
         PHX
         PHA
         JSL   L070597
L072CB4  LDA   $03
         LDX   $05
         STA   $1E
         STX   $20
         PEI   $01
         JSL   L071AA4
         LDA   $14
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

L072CD4  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFA
         TCS
         ADC   #$0013
         TCD
         STZ   $ED
         LDA   $F8
         ORA   $FA
         BEQ   L072D00
         LDA   [$F8]
         LDY   #$0002
         ORA   [$F8],Y
         BEQ   L072D00
         LDY   #$0002
         LDA   [$F8],Y
         TAX
         LDA   [$F8]
         STA   $EF
         STX   $F1
         LDA   [$EF]
         STA   $ED
L072D00  LDA   $ED
         SEC
         SBC   #$00FE
         BEQ   L072D14
         BVS   L072D0D
         EOR   #$8000
L072D0D  BPL   L072D14
         LDA   #$00FE
         STA   $ED
L072D14  LDA   $ED
         LDX   #$FFED
         SEP   #$20
         STA   $00,X
         REP   #$20
         LDA   $ED
         BMI   L072D4B
         BEQ   L072D4B
         LDY   #$0002
         LDA   [$F8],Y
         TAX
         LDA   [$F8]
         CLC
         ADC   #$0002
         BCC   L072D34
         INX
L072D34  PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEE
         PHA
         LDA   $ED
         JSL   L150488
         PHX
         PHA
         JSL   L070597
L072D4B  PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         PEA   $0100
         JSL   L0313BE
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

L072D71  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $07
         STZ   $05
         LDA   $12
         ORA   $14
         BEQ   L072DA2
         LDA   [$12]
         LDY   #$0002
         ORA   [$12],Y
         BEQ   L072DA2
         LDY   #$0002
         LDA   [$12],Y
         TAX
         LDA   [$12]
         STA   $09
         STX   $0B
         LDA   [$09]
         STA   $05
L072DA2  PHY
         PHY
         LDA   $05
         INC
         JSL   L150488
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $01
         PLX
         STX   $03
         LDAL  L05565D
         BEQ   L072DD0
         STZ   $01
         STZ   $03
         BRA   L072E14
L072DD0  LDA   $05
         BEQ   L072DFA
         LDY   #$0002
         LDA   [$12],Y
         TAX
         LDA   [$12]
         CLC
         ADC   #$0002
         BCC   L072DE3
         INX
L072DE3  PHX
         PHA
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         LDA   $05
         JSL   L150488
         PHX
         PHA
         JSL   L070597
L072DFA  LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $09
         STX   $0B
         LDA   $05
         INC
         DEC
         TAY
         LDA   #$0000
         SEP   #$20
         STA   [$09],Y
         REP   #$20
L072E14  PEI   $07
         JSL   L071AA4
         LDA   $01
         LDX   $03
         STA   $16
         STX   $18
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

L072E34  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PHY
         JSL   L1503A1
         PLA
         STA   $0A
         PLX
         STX   $0C
         PLY
         PLY
         PLD
         RTL

L072E4C  ENT
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
         LDA   $0A
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         JSL   L150AFE
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

L072E7C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $10
         PHY
         PHY
         PEI   $0E
         PEI   $0C
         LDA   $0A
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         JSL   L150B10
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

L072EAE  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF0
         TCS
         ADC   #$001F
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE1
         PHA
         PEI   $F8
         PEI   $F6
         PEA   $0100
         JSL   L0313BE
         PHY
         JSL   L071BFF
         PLA
         STA   $E1
         STZ   $FC
         STZ   $FE
         PHY
         PEI   $FA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE1
         PHA
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         JSL   L070A4D
         PLA
         LSR
         BCC   L072F44
         PHY
         JSL   L150B6A
         PLA
         STA   $E5
         PEI   $EB
         JSL   L150B70
         PHY
         PEA   $0001
         JSL   L1506E1
         PLA
         STA   $E3
         PHY
         PHY
         PEI   $FA
         PEI   $E9
         PEI   $E7
         JSL   L15041C
         PLA
         STA   $FC
         PLX
         STX   $FE
         LDAL  L05565D
         BEQ   L072F34
         STZ   $FC
         STZ   $FE
L072F34  PEI   $E5
         JSL   L150B70
         PHY
         PEI   $E3
         JSL   L1506E1
         PLA
         STA   $E3
L072F44  PEI   $E1
         JSL   L071AA4
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0118
         TCS
         RTL

L072F5C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0E
         PHY
         PHY
         PEA   $8027
         PEI   $0C
         PEI   $0A
         JSL   L15041C
         PLA
         STA   L054F93
         PLA
         STA   L054F95
         LDAL  L05565D
         BNE   L072F95
         PEA   $0000
         LDA   L054F93
         LDX   L054F95
         PHX
         PHA
         JSL   L150D44
         LDA   #$0001
         STA   $0E
L072F95  LDA   $08
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

L072FA6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $0C
         STA   $0E
         LDA   $0A
         SEC
         SBC   $0C
         BEQ   L072FC4
         BVS   L072FBE
         EOR   #$8000
L072FBE  BPL   L072FC4
         LDA   $0A
         STA   $0E
L072FC4  LDA   $08
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

L072FD5  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $0C
         STA   $0E
         LDA   $0A
         SEC
         SBC   $0C
         BVS   L072FEB
         EOR   #$8000
L072FEB  BMI   L072FF1
         LDA   $0A
         STA   $0E
L072FF1  LDA   $08
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

L073002  ENT
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
         LDA   #$03E8
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

L073032  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEI   $12
         PEI   $10
         LDA   $0E
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         PLA
         STA   $01
         PLX
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0008
         BCC   L073061
         INX
L073061  STA   $14
         STX   $16
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

L073077  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         PEI   $0C
         JSL   L150144
         PLA
         AND   #$0080
         BEQ   L07308F
         LDA   #$0001
L07308F  EOR   #$0001
         STA   $01
         LDA   $0E
         CMP   $01
         BEQ   L0730AC
         LDA   $0E
         BEQ   L0730A6
         PEI   $0C
         JSL   L150B52
         BRA   L0730AC
L0730A6  PEI   $0C
         JSL   L150B4C
L0730AC  LDA   $0A
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

L0730BE  ENT
         PHD
         TSC
         CLC
         ADC   #$FEDA
         TCS
         ADC   #$0035
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCF
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         STZ   $FC
         STZ   $FE
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCF
         PHA
         JSL   L0735A8
         PLA
         STA   $DD
         PLX
         STX   $DF
         PHY
         PHY
         PEA   $0000
         PEA   $0044
         LDA   L054FBD
         PHA
         PEA   $8010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDAL  L05565D
         BEQ   L07311E
         BRL   L07329D
L07311E  LDY   #$0002
         LDA   [$E5],Y
         TAX
         LDA   [$E5]
         STA   $E9
         STX   $EB
         LDA   #$0044
         STA   [$E9]
L07312F  LDA   #$0003
         STA   $CF
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         STA   $D1
         STX   $D3
         LDA   $E9
         LDX   $EB
         STA   $D5
         STX   $D7
         STZ   $D9
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         PEA   $200E
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         STA   $DB
         LDA   #$004F
         CMP   $DB
         BNE   L0731A9
         PEI   $E7
         PEI   $E5
         JSL   L1516B7
         LDY   #$0002
         LDA   #$0004
         CLC
         ADC   [$E9],Y
         JSL   L150488
         PHX
         PHA
         PEI   $E7
         PEI   $E5
         JSL   L1512FB
         PEI   $E7
         PEI   $E5
         JSL   L150BB8
         LDY   #$0002
         LDA   [$E5],Y
         TAX
         LDA   [$E5]
         STA   $E9
         STX   $EB
         LDY   #$0002
         LDA   #$0004
         CLC
         ADC   [$E9],Y
         STA   [$E9]
L0731A9  LDA   #$004F
         CMP   $DB
         BNE   L0731B3
         BRL   L07312F
L0731B3  LDA   $DB
         BEQ   L0731BA
         BRL   L073295
L0731BA  PHY
         PHY
         LDY   #$0002
         LDA   [$E9],Y
         INC
         INC
         INC
         JSL   L150488
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $E1
         PLX
         STX   $E3
         LDAL  L05565D
         BEQ   L0731EA
         BRL   L073295
L0731EA  LDY   #$0002
         LDA   [$E5],Y
         TAX
         LDA   [$E5]
         STA   $E9
         STX   $EB
         LDA   $E9
         LDX   $EB
         CLC
         ADC   #$0002
         BCC   L073201
         INX
L073201  PHX
         PHA
         LDY   #$0002
         LDA   [$E1],Y
         PHA
         LDA   [$E1]
         PHA
         LDY   #$0002
         LDA   [$E9],Y
         INC
         INC
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDA   $F6
         BEQ   L07328D
         LDY   #$0002
         LDA   [$E1],Y
         TAX
         LDA   [$E1]
         TXY
         LDX   #$FFCB
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFCB
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDX   #$FFCB
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $ED
         STX   $EF
         LDA   [$ED]
         INC
         PLX
         STX   $ED
         PLX
         STX   $EF
         STA   [$ED]
         LDX   #$FFCB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L073265
         INX
L073265  PHX
         PHA
         LDX   #$FFCB
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $ED
         STX   $EF
         LDA   [$ED]
         DEC
         JSL   L150488
         JSL   L150F53
         STA   $ED
         STX   $EF
         SEP   #$20
         LDA   #$3A
         STA   [$ED]
         REP   #$20
L07328D  LDA   $E1
         LDX   $E3
         STA   $FC
         STX   $FE
L073295  PEI   $E7
         PEI   $E5
         JSL   L07185A
L07329D  PEI   $DF
         PEI   $DD
         JSL   L07185A
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$012E
         TCS
         RTL

L0732B7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PEI   $10
         PEI   $0E
         JSL   L150278
         PHY
         PHY
         JSL   L150BA0
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BNE   L0732DB
         BRA   L0732EB
L0732DB  PHY
         PEI   $03
         PEI   $01
         JSL   L15145A
         PLA
         LSR
         BCC   L0732EB
         STZ   L054FB5
L0732EB  LDA   $0C
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

L0732FD  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $12
         PEI   $10
         PEI   $0E
         PEI   $0C
         PEI   $0A
         JSL   L15101D
         LDAL  L05565D
         BEQ   L07332B
         JSL   L151373
         PEI   $12
         PEI   $10
         PEI   $0E
         PEI   $0C
         PEI   $0A
         JSL   L15101D
L07332B  LDX   #$0000
         LDAL  L05565D
         BNE   L073335
         INX
L073335  TXA
         STA   $14
         LDA   $08
         STA   $12
         LDA   $07
         STA   $11
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L07334A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCC
         TCS
         TCD
         LDA   $3A
         BNE   L0733CE
         LDAL  L040A85
         SEP   #$20
         STA   $1D
         REP   #$20
L073360  TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         LDA   $3C
         AND   #$000F
         INC
         TAX
         LDA   #$00FF
         ANDL  L040A86,X
         XBA
         INC
         LDX   #$0001
         STA   $00,X
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PHY
         PHY
         PEA   $0FFF
         PEA   $FFFF
         PHY
         PHY
         PEI   $3E
         PEI   $3C
         PEA   $0004
         JSL   L150337
         JSL   L15017E
         PLA
         STA   $3C
         PLX
         STX   $3E
         LDA   $3C
         ORA   $3E
         BNE   L073360
         BRA   L073446
L0733CE  PHY
         PEI   $3A
         PEA   $0000
         PEA   $0013
         JSL   L071A1B
         PLA
         STA   $3A
         LDA   $3A
         SEP   #$20
         STA   $1D
         REP   #$20
         LDA   $3A
         STA   $03
         LDA   #$0001
         SEC
         SBC   $03
         BEQ   L0733F9
         BVS   L0733F7
         EOR   #$8000
L0733F7  BMI   L073446
L0733F9  LDA   $03
         STA   $1B
L0733FD  TDC
         CLC
         ADC   #$001D
         STA   $31
         STZ   $33
         LDY   $1B
         LDA   $3C
         AND   #$000F
         INC
         TAX
         LDA   #$00FF
         ANDL  L040A97,X
         PHA
         PLA
         SEP   #$20
         STA   [$31],Y
         REP   #$20
         PHY
         PHY
         PEA   $0FFF
         PEA   $FFFF
         PHY
         PHY
         PEI   $3E
         PEI   $3C
         PEA   $0004
         JSL   L150337
         JSL   L15017E
         PLA
         STA   $3C
         PLX
         STX   $3E
         LDA   $1B
         DEC
         BEQ   L073446
         DEC   $1B
         BRA   L0733FD
L073446  PEI   $42
         PEI   $40
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0014
         JSL   L0313BE
         LDA   $38
         STA   $3E
         LDA   $37
         STA   $3D
         LDA   $35
         TCD
         TSC
         CLC
         ADC   #$003C
         TCS
         RTL

L07346C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD2
         TCS
         TCD
         PEI   $36
         PEI   $34
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L0734C7
         PEI   $3A
         PEI   $38
         PEA   ^L040AA8
         PEA   L040AA8
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEI   $36
         PEI   $34
         LDA   $03,S
         EOR   #$FFFF
         TAX
         PLA
         EOR   #$FFFF
         PLY
         INC
         BNE   L0734A8
         INX
L0734A8  PHX
         PHA
         JSL   L0715D9
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         BRA   L0734E3
L0734C7  PEI   $3A
         PEI   $38
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEI   $36
         PEI   $34
         JSL   L0715D9
         PEA   $0014
         JSL   L0313BE
L0734E3  LDA   $32
         STA   $36
         LDA   $31
         STA   $35
         LDA   $2F
         TCD
         TSC
         CLC
         ADC   #$0034
         TCS
         RTL

L0734F5  ENT
         PHD
         TSC
         CLC
         ADC   #$FEEC
         TCS
         ADC   #$0021
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDF
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PHY
         JSL   L071BFF
         PLA
         STA   $DF
         LDA   #$00FF
         LDX   #$FFDF
         AND   $00,X
         STA   $ED
         STZ   $FC
         STZ   $FE
         PHY
         PHY
         LDA   $ED
         INC
         JSL   L150488
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $E9
         PLX
         STX   $EB
         LDAL  L05565D
         BNE   L073590
         TDC
         CLC
         ADC   #$FFE0
         STA   $E5
         STZ   $E7
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         STA   $E1
         STX   $E3
         PEI   $E7
         PEI   $E5
         PEI   $E3
         PEI   $E1
         LDA   $ED
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDA   $ED
         INC
         DEC
         TAY
         SEP   #$20
         LDA   #$00
         STA   [$E1],Y
         REP   #$20
         LDA   $E9
         LDX   $EB
         STA   $FC
         STX   $FE
L073590  PEI   $DF
         JSL   L071AA4
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$011A
         TCS
         RTL

L0735A8  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF4
         TCS
         ADC   #$0019
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PHY
         JSL   L071BFF
         PLA
         STA   $E7
         STZ   $FC
         STZ   $FE
         LDA   #$00FF
         LDX   #$FFE7
         AND   $00,X
         STA   $E9
         PHY
         PHY
         LDA   $E9
         INC
         INC
         JSL   L150488
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $EB
         PLX
         STX   $ED
         LDAL  L05565D
         BNE   L073648
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         STA   $EF
         STX   $F1
         LDA   $E9
         STA   [$EF]
         LDA   $E9
         BEQ   L073640
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE8
         PHA
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         CLC
         ADC   #$0002
         BCC   L073632
         INX
L073632  PHX
         PHA
         LDA   $E9
         JSL   L150488
         PHX
         PHA
         JSL   L070597
L073640  LDA   $EB
         LDX   $ED
         STA   $FC
         STX   $FE
L073648  PEI   $E7
         JSL   L071AA4
         LDA   $F6
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

L073660  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   $14
         LDX   $16
         STA   $03
         STX   $05
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L071B83
         PEI   $05
         PEI   $03
         LDA   $14
         LDX   $16
         JSL   L1512A5
         STA   $01
         LDA   $01
         SEP   #$20
         STA   [$10]
         REP   #$20
         LDA   $01
         BMI   L0736B6
         BEQ   L0736B6
         PEI   $16
         PEI   $14
         LDA   #$0001
         CLC
         ADC   $10
         LDX   $12
         BCC   L0736A8
         INX
L0736A8  PHX
         PHA
         LDA   $01
         JSL   L150488
         PHX
         PHA
         JSL   L070597
L0736B6  LDA   $0E
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

L0736C8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         PHY
         PHY
         JSL   L150BA0
         PLA
         STA   $13
         PLX
         STX   $15
         LDY   #$00B0
         LDA   [$13],Y
         TAX
         DEY
         DEY
         LDA   [$13],Y
         TXA
         STA   $09
L0736E9  PHY
         PEA   $0140
         PEA   ^L05409F
         PEA   L05409F
         JSL   L150070
         PLA
         LSR
         BCC   L07375A
         LDAL  L0540A3
         TAX
         LDAL  L0540A1
         STA   $17
         STX   $19
         LDA   $17
         LDX   $19
         CMP   $13
         BNE   L073712
         CPX   $15
L073712  BEQ   L073719
         LDA   #$0000
         BRA   L07371C
L073719  LDA   #$0001
L07371C  PHA
         LDX   #$0000
         LDA   #$0006
         CMPL  L05409F
         BNE   L07372A
         INX
L07372A  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L07375A
         LDA   #$8000
         AND   $09
         BEQ   L073742
         LDA   #$FFFE
         STA   $28
         BRL   L0739D2
         BRA   L07375A
L073742  PEI   $19
         PEI   $17
         JSL   L1506B3
         PEI   $19
         PEI   $17
         JSL   L1517CD
         PEI   $19
         PEI   $17
         JSL   L1506AD
L07375A  LDA   #$4000
         AND   $09
         BNE   L073771
         LDA   #$AF06
         STAL  L0540B3
         LDA   #$001A
         STAL  L0540B5
         BRA   L07377F
L073771  LDA   #$AF06
         STAL  L0540B3
         LDA   #$0018
         STAL  L0540B5
L07377F  LDA   #$0000
         STAL  L0540C5
         STAL  L0540C7
         PHY
         PEA   $FFFF
         PEA   ^L05409F
         PEA   L05409F
         JSL   L15141E
         PLA
         STA   $1B
         LDAL  L0540B1
         TAX
         LDAL  L0540AF
         STA   $17
         STX   $19
         LDA   #$4000
         AND   $09
         BEQ   L0737D5
         LDX   #$0000
         LDA   #$0003
         CMP   $1B
         BNE   L0737BA
         INX
L0737BA  PHX
         LDX   #$0000
         LDA   #$0005
         CMP   $1B
         BNE   L0737C6
         INX
L0737C6  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0737D5
         LDA   #$FFFD
         STA   $28
         BRL   L0739D2
L0737D5  PHY
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDAL  L0540AB
         PHA
         LDAL  L0540A9
         PHA
         PEI   $15
         PEI   $13
         JSL   L150482
         PLA
         STA   $11
         LDA   #$7FFF
         AND   $1B
         CMP   #$0013
         BEQ   L073801
         BRL   L073897
L073801  LDA   $17
         LDX   $19
         CMP   $13
         BNE   L07380B
         CPX   $15
L07380B  BEQ   L073814
         JSL   L072314
         BRL   L073897
L073814  LDA   $11
         BEQ   L073888
         PHY
         PHY
         PEI   $0F
         PEI   $0D
         JSL   L1506F9
         PLY
         PLA
         STA   $07
         PHY
         PHY
         PEI   $0F
         PEI   $0D
         JSL   L150132
         PLA
         STA   $01,S
         PLA
         STA   $0B
         LDA   #$8000
         AND   $07
         BNE   L073872
         PEI   $11
         PHY
         LDAL  L0540AB
         PHA
         LDAL  L0540A9
         PHA
         PEA   $FFFF
         PEA   $FFFF
         PEI   $0F
         PEI   $0D
         JSL   L150B0A
         PLA
         SEC
         SBC   $01,S
         STA   $01,S
         PLA
         BNE   L073870
         LDA   $0B
         JSL   L150488
         STAL  L0540C5
         TXA
         STAL  L0540C7
L073870  BRA   L073881
L073872  LDA   $0B
         JSL   L150488
         STAL  L0540C5
         TXA
         STAL  L0540C7
L073881  LDA   #$0021
         STA   $1B
         BRA   L073897
L073888  LDA   #$1000
         AND   $09
         BEQ   L073897
         LDA   #$FFFC
         STA   $28
         BRL   L0739D2
L073897  LDX   #$0000
         LDA   #$0010
         CMP   $1B
         BNE   L0738A2
         INX
L0738A2  PHX
         LDX   #$0000
         LDA   #$0011
         CMP   $1B
         BNE   L0738AE
         INX
L0738AE  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0738B9
         JSL   L072314
L0738B9  LDA   #$000C
         CMP   $1B
         BNE   L0738EF
         LDA   $26
         BEQ   L0738E7
         PEA   $0001
         PEI   $19
         PEI   $17
         PEA   $0002
         JSL   L072E7C
         PEA   $0000
         PEI   $19
         PEI   $17
         PEA   $0002
         JSL   L072E7C
         LDA   #$0002
         STA   $28
         BRA   L0738EC
L0738E7  LDA   #$FFFF
         STA   $28
L0738EC  BRL   L0739D2
L0738EF  LDX   #$0000
         LDA   $1B
         BNE   L0738F7
         INX
L0738F7  PHX
         LDX   #$0000
         LDA   #$0006
         CMP   $1B
         BNE   L073903
         INX
L073903  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L07390D
         BRL   L0739C2
L07390D  LDA   #$2000
         AND   $09
         BEQ   L07391C
         STZ   $28
         BRL   L0739D2
         BRL   L0739C2
L07391C  LDA   #$0000
         STAL  L05409F
         PHY
         PEA   $0001
         PEI   $15
         PEI   $13
         PEA   ^L05409F
         PEA   L05409F
         JSL   L150365
         PLA
         STA   $05
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         STA   $01
         STX   $03
         PEA   ^L0540A9
         PEA   L0540A9
         JSL   L150BE8
         LDY   #$0016
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   #$0000
         BNE   L073960
         CPX   #$8300
L073960  BEQ   L073967
         LDA   #$0000
         BRA   L07396A
L073967  LDA   #$0001
L07396A  PHA
         LDY   #$0016
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   #$0000
         BNE   L07397D
         CPX   #$8500
L07397D  BEQ   L073984
         LDA   #$0000
         BRA   L073987
L073984  LDA   #$0001
L073987  BEQ   L0739AC
         PHA
         PHY
         PEA   ^L0540A9
         PEA   L0540A9
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         CLC
         ADC   #$0040
         BCC   L0739A0
         INX
L0739A0  PHX
         PHA
         JSL   L1512CB
         PLA
         STA   $1D
         PLA
         AND   $1D
L0739AC  ORA   $01,S
         PLX
         LSR
         BCC   L0739BB
         PEA   $0008
         JSL   L0724F7
         BRA   L0739C2
L0739BB  PEA   $0004
         JSL   L0724F7
L0739C2  LDA   #$0021
         CMP   $1B
         BEQ   L0739CC
         BRL   L0736E9
L0739CC  LDAL  L0540C5
         STA   $28
L0739D2  LDA   $24
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

L0739E4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         PHY
         PEI   $1A
         PEI   $18
         LDA   $16
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         PLA
         STA   $05
         PLX
         STX   $07
         PEI   $07
         PEI   $05
         JSL   L150FE1
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         CLC
         ADC   #$001C
         BCC   L073A1B
         INX
L073A1B  STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $01
         STX   $03
         PEI   $14
         PEI   $12
         PEI   $03
         PEI   $01
         JSL   L1512D1
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

L073A49  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         PEA   $0003
         PEA   $0100
         PEA   $002E
         JSL   L151496
         PLA
         STA   $01
         LDA   #$0001
         STA   L054FB1
         PHY
         PHY
         JSL   L151319
         PLA
         STA   L054FA9
         PLA
         STA   L054FAB
         PLY
         PLY
         PLY
         PLD
         RTL

L073A7B  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF4
         TCS
         ADC   #$001F
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE1
         PHA
         PEI   $F4
         PEI   $F2
         PEA   $0100
         JSL   L0313BE
         PHY
         PHY
         PEI   $FA
         PEI   $F8
         LDA   $F6
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDY   #$0002
         LDA   [$E5],Y
         TAX
         LDA   [$E5]
         CLC
         ADC   #$001C
         BCC   L073AC1
         INX
L073AC1  STA   $E9
         STX   $EB
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         STA   $E1
         STX   $E3
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE2
         PHA
         LDA   #$00FF
         LDX   #$FFE1
         AND   $00,X
         PHA
         PEI   $E3
         PEI   $E1
         JSL   L151651
         PEI   $E7
         PEI   $E5
         JSL   L151041
         LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$0118
         TCS
         RTL

L073B05  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $10
         PHY
         PHY
         PEI   $0E
         PEI   $0C
         LDA   $0A
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         JSL   L15130D
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

L073B37  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $16
         ASL
         ASL
         TAX
         LDAL  L0540CF,X
         PHA
         LDAL  L0540CD,X
         PLX
         CMP   #L05409D
         BNE   L073B56
         CPX   #^L05409D
L073B56  BNE   L073B5D
         LDA   #$0000
         BRA   L073B60
L073B5D  LDA   #$0001
L073B60  PHA
         LDA   $16
         ASL
         ASL
         TAX
         LDAL  L0540CD,X
         ORAL  L0540CF,X
         BEQ   L073B73
         LDA   #$0001
L073B73  AND   $01,S
         PLX
         LSR
         BCC   L073BA7
         PHY
         PHY
         LDA   $16
         ASL
         ASL
         TAX
         LDAL  L0540CF,X
         PHA
         LDAL  L0540CD,X
         PHA
         JSL   L150586
         JSL   L07185A
         LDA   $16
         ASL
         ASL
         TAX
         PEA   ^L05409D
         PEA   L05409D
         PLA
         STAL  L0540CD,X
         PLA
         STAL  L0540CF,X
L073BA7  LDA   #$00FF
         AND   [$12]
         BEQ   L073C10
         PHY
         PHY
         LDA   #$00FF
         AND   [$12]
         INC
         JSL   L150488
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $4000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         PLX
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $01
         STX   $03
         LDAL  L05565D
         BNE   L073C10
         PEI   $14
         PEI   $12
         PEI   $03
         PEI   $01
         LDA   #$00FF
         AND   [$12]
         INC
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDA   $16
         ASL
         ASL
         TAX
         PEI   $03
         PEI   $01
         PLA
         STAL  L0540CD,X
         PLA
         STAL  L0540CF,X
L073C10  LDA   $0C
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

L073C22  ENT
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
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         PEA   $0000
         PHD
         JSL   L073B37
         PEA   $0001
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE3
         PHA
         PEA   $0000
         PHD
         JSL   L073B37
         PEA   $0002
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE3
         PHA
         PEA   $0000
         PHD
         JSL   L073B37
         PEA   $0003
         PEA   $0000
         TDC
         CLC
         ADC   #$FCE3
         PHA
         PEA   $0000
         PHD
         JSL   L073B37
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

L073CDF  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L054FA1
         STA   $0C
         PEA   $0006
         JSL   L0724F7
         LDA   #$0001
         STA   L054F9F
         PLY
         PLY
         PLY
         PLD
         RTL

L073CFE  ENT
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
         LDA   $0A
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         JSL   L150AF8
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

L073D2E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC0
         TCS
         TCD
         PEA   $0000
         PEA   $0000
         JSL   L087547
         PHY
         PHY
         PEI   $4A
         PEI   $48
         LDA   $46
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         PLA
         STA   $39
         PLX
         STX   $3B
         STZ   $31
         STZ   $33
         LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $09
         STX   $0B
         LDY   #$003C
         LDA   #$0003
         AND   [$09],Y
         CMP   #$0000
         BNE   L073D8C
         LDY   #$001E
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         STA   $35
         STX   $37
         LDY   #$0012
         LDA   [$09],Y
         STA   $2F
         BRA   L073DD1
L073D8C  PHY
         PHY
         PEA   $800B
         LDY   #$001E
         LDA   [$09],Y
         PHA
         DEY
         DEY
         LDA   [$09],Y
         PHA
         JSL   L15041C
         PLA
         STA   $31
         PLX
         STX   $33
         LDAL  L05565D
         BEQ   L073DAF
         BRL   L073FCD
L073DAF  PEI   $33
         PEI   $31
         JSL   L0718BF
         PHY
         PHY
         PEI   $33
         PEI   $31
         JSL   L151301
         PLA
         PLX
         STA   $2F
         LDY   #$0002
         LDA   [$31],Y
         TAX
         LDA   [$31]
         STA   $35
         STX   $37
L073DD1  TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDA   #$0008
         CLC
         ADC   $09
         LDX   $0B
         BCC   L073DE5
         INX
L073DE5  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         PHY
         PHY
         PEA   $0001
         PEA   ^L0540CD
         PEA   L0540CD
         PEI   $37
         PEI   $35
         PEI   $2F
         JSL   L1514A2
         PLA
         STA   $2B
         PLX
         STX   $2D
         LDA   $31
         ORA   $33
         BEQ   L073E17
         PEI   $33
         PEI   $31
         JSL   L07191C
L073E17  PHY
         PHY
         PEI   $2D
         PEI   $2B
         JSL   L151301
         PLA
         PLX
         INC
         BNE   L073E27
         INX
L073E27  STA   $2F
         LDA   $2F
         JSL   L150488
         PHX
         PHA
         PEI   $2D
         PEI   $2B
         JSL   L1512FB
         LDY   #$0002
         LDA   [$2B],Y
         TAX
         LDA   [$2B]
         STA   $3D
         STX   $3F
         LDA   $2F
         DEC
         TAY
         LDA   #$0000
         SEP   #$20
         STA   [$3D],Y
         REP   #$20
         PEI   $2D
         PEI   $2B
         JSL   L0718BF
         LDY   #$0002
         LDA   [$2B],Y
         TAX
         LDA   [$2B]
         STA   $35
         STX   $37
         LDA   $13
         SEC
         SBC   $0F
         STA   $29
         STZ   $27
L073E6F  LDA   #$00FF
         AND   [$35]
         BEQ   L073EAE
         PEI   $37
         PEI   $35
         PEI   $29
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         JSL   L081B04
         PEI   $37
         PEI   $35
         LDA   $25
         JSL   L150488
         JSL   L150F53
         STA   $35
         STX   $37
         LDA   #$0009
         CLC
         ADC   $27
         STA   $27
         BRA   L073E6F
L073EAE  PEI   $2D
         PEI   $2B
         JSL   L07185A
         LDA   $27
         CLC
         ADC   $0D
         SEC
         SBC   $11
         BEQ   L073EC7
         BVS   L073EC5
         EOR   #$8000
L073EC5  BMI   L073ECA
L073EC7  BRL   L073FCD
L073ECA  LDA   $11
         SEC
         SBC   $0D
         STA   $3D
         LDA   $27
         SEC
         SBC   $3D
         STA   $21
         LDA   #$0010
         CLC
         ADC   $48
         LDX   $4A
         BCC   L073EE3
         INX
L073EE3  STA   $05
         STX   $07
         LDY   #$0004
         LDA   [$05],Y
         SEC
         SBC   [$05]
         STA   $1D
         LDY   #$0006
         LDA   [$05],Y
         LDY   #$0002
         SEC
         SBC   [$05],Y
         STA   $1F
         LDY   #$0006
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $19
         STX   $1B
         PEI   $4A
         PEI   $48
         JSL   L151131
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L151412
         LDA   $21
         CLC
         ADC   $19
         SEC
         SBC   #$00C3
         BEQ   L073F3B
         BVS   L073F31
         EOR   #$8000
L073F31  BPL   L073F3B
         LDA   #$00C3
         SEC
         SBC   $19
         STA   $21
L073F3B  PEI   $1F
         LDA   $21
         CLC
         ADC   $1D
         PHA
         PEI   $4A
         PEI   $48
         JSL   L151035
         LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         CLC
         ADC   #$0008
         BCC   L073F5A
         INX
L073F5A  CLC
         ADC   #$0004
         BCC   L073F61
         INX
L073F61  STA   $3D
         STX   $3F
         LDA   $21
         CLC
         ADC   $11
         STA   [$3D]
         LDY   #$00C8
         LDA   [$48],Y
         TAX
         DEY
         DEY
         LDA   [$48],Y
         STA   $15
         STX   $17
L073F7A  LDA   $15
         ORA   $17
         BEQ   L073FCD
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         CLC
         ADC   #$0008
         BCC   L073F8F
         INX
L073F8F  STA   $01
         STX   $03
         LDA   [$01]
         SEC
         SBC   $11
         BVS   L073F9D
         EOR   #$8000
L073F9D  BPL   L073FB3
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   $21
         CLC
         ADC   [$01]
         PHA
         PEI   $17
         PEI   $15
         JSL   L150B04
L073FB3  LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $3D
         STX   $3F
         LDY   #$0002
         LDA   [$3D],Y
         TAX
         LDA   [$3D]
         STA   $15
         STX   $17
         BRA   L073F7A
L073FCD  LDA   $44
         STA   $4A
         LDA   $43
         STA   $49
         LDA   $41
         TCD
         TSC
         CLC
         ADC   #$0048
         TCS
         RTL

L073FDF  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   #$00FF
         AND   [$16]
         CLC
         ADC   $14
         JSL   L150488
         PHX
         PHA
         JSL   L151460
         STZ   $03
         STZ   $05
         LDA   $14
         ASL
         ASL
         ASL
         DEC
         STA   $01
         LDA   $01
         BMI   L07404D
         STZ   $07
L07400B  PHY
         JSL   L150705
         PLA
         STA   $09
         PHY
         PEI   $18
         PEI   $16
         LDA   $07
         JSL   L150488
         PHX
         PHA
         JSL   L071E76
         PLA
         LSR
         BCC   L074043
         PEI   $05
         PEI   $03
         PHY
         JSL   L150705
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L07403B
         DEX
L07403B  JSL   L150F53
         STA   $03
         STX   $05
L074043  LDA   $07
         CMP   $01
         BEQ   L07404D
         INC   $07
         BRA   L07400B
L07404D  LDA   $03
         LDX   $05
         STA   $1A
         STX   $1C
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

L074067  PHD
         TSC
         SEC
         SBC   #$000C
         TCD
         TCS
         STZ   $05
         STZ   $07
         LDA   #$FFFF
         STA   $09
         LDA   L054FED
         STA   $01
         LDA   L054FEF
         STA   $03
         LDA   L055051
         EOR   #$0001
         ORA   $12
         STA   $0B
L07408C  LDY   #$000A
         LDA   [$01],Y
         BPL   L0740CD
         LDY   #$0000
         LDA   $09
         CMP   [$01],Y
         BCC   L0740CD
         LDA   $0B
         BNE   L0740BE
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   L055027
         BNE   L0740B4
         CPX   L055029
         BEQ   L0740CD
L0740B4  CMP   L05501F
         BNE   L0740BE
         CPX   L055021
         BEQ   L0740CD
L0740BE  LDA   $01
         STA   $05
         LDA   $03
         STA   $07
         LDY   #$0000
         LDA   [$01],Y
         STA   $09
L0740CD  LDA   $01
         CLC
         ADC   #$000E
         STA   $01
         BCC   L0740D9
         INC   $03
L0740D9  CMP   L054FF1
         BNE   L07408C
         LDA   $03
         CMP   L054FF3
         BNE   L07408C
         LDA   $05
         ORA   $07
         BEQ   L07410F
         PHY
         PHY
         LDY   #$0008
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         _GetHandleSize
         PLA
         STA   $14
         PLA
         STA   $16
         PEI   $07
         PEI   $05
         JSL   L07481E
         BRA   L074139
L07410F  STZ   $14
         STZ   $16
         PHY
         LDA   L055029
         PHA
         LDA   L055027
         PHA
         JSL   L0771D3
         PLA
         BNE   L074139
         PHY
         LDA   L055021
         PHA
         LDA   L05501F
         PHA
         JSL   L0771D3
         PLA
         BNE   L074139
         STZ   L055013
         STZ   L055015
L074139  LDA   $10
         STA   $12
         LDA   $0F
         STA   $11
         LDX   $0D
         TDC
         CLC
         ADC   #$0010
         TCS
         TXA
         TCD
         RTL

         PHD
         PHY
         PHY
         PHY
         PHY
         TSC
         TCD
         LDA   L054FED
         STA   $01
         LDA   L054FEF
         STA   $03
         LDA   L054FF1
         STA   $05
         LDA   L054FF3
         STA   $07
L074167  LDY   #$0002
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BEQ   L074194
         LDY   #$000C
         LDA   [$01],Y
         BEQ   L074194
         LDA   #$0000
         STA   [$01],Y
         LDY   #$000A
         LDA   [$01],Y
         BMI   L074194
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L07711B
L074194  LDA   $01
         CLC
         ADC   #$000E
         STA   $01
         BCC   L0741A0
         INC   $03
L0741A0  CMP   $05
         BNE   L074167
         LDA   $03
         CMP   $07
         BNE   L074167
         STZ   L05500F
         STZ   L055011
         TDC
         TCS
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0741B8  PHD
         TSC
         TCD
         LDA   L054FC9
         LDX   L054FCB
         STA   $0A
         STX   $0C
         LDY   #$0002
         LDA   $06
         CMP   [$0A],Y
         BNE   L0741E5
         INY
         INY
         LDA   [$0A],Y
         CMP   $08
         BNE   L0741E5
         LDY   #$000A
         LDA   [$0A],Y
         AND   #$000F
         CMP   L054FC1
         BNE   L0741E5
         BRA   L074258
L0741E5  PHY
         PHY
         LDA   L054FEF
         PHA
         LDA   L054FED
         PHA
         LDA   L05500B
         PHA
         PEI   $08
         PEI   $06
         LDA   L054FC1
         PHA
         JSL   L074272
         PLA
         STA   $0A
         PLA
         STA   $0C
L074205  LDY   #$0002
         LDA   [$0A],Y
         TAX
         INY
         INY
         ORA   [$0A],Y
         BEQ   L07424E
         LDA   [$0A],Y
         CMP   $08
         BNE   L074228
         CPX   $06
         BNE   L074228
         LDY   #$000A
         LDA   [$0A],Y
         AND   #$000F
         CMP   L054FC1
         BEQ   L07424E
L074228  LDA   $0A
         CLC
         ADC   #$000E
         STA   $0A
         BCC   L074234
         INC   $0C
L074234  LDA   L054FF1
         CMP   $0A
         BNE   L074205
         LDA   L054FF3
         CMP   $0C
         BNE   L074205
         LDA   L054FED
         STA   $0A
         LDA   L054FEF
         STA   $0C
         BRA   L074205
L07424E  LDA   $0A
         STA   L054FC9
         LDA   $0C
         STA   L054FCB
L074258  LDA   $04
         STA   $08
         LDA   $03
         STA   $07
         TDC
         TCS
         PLD
         PLY
         PLY
         RTL

L074266  ENT
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $A55A
         JMPL  L0768A7

L074272  PHD
         PHY
         TSC
         TCD
         LDA   $0A
         EOR   $08
         STA   $0A
         XBA
         EOR   $0A
         STA   $01
         LDA   $0C
         XBA
         EOR   $0C
         EOR   $01
         AND   $0E
         STA   $01
         ASL
         CLC
         ADC   $01
         ASL
         CLC
         ADC   $01
         ASL
         LDX   $12
         CLC
         ADC   $10
         BCC   L07429D
         INX
L07429D  STA   $14
         STX   $16
         LDA   $06
         STA   $12
         LDA   $05
         STA   $11
         TDC
         TCS
         PLY
         PLD
         CLC
         ADC   #$0010
         TCS
         RTL

L0742B3  ENT
         PHD
         TSC
         SEC
         SBC   #$001C
         TCD
         SEC
         SBC   #$0200
         TCS
         LDA   #$FFFF
         STA   $26
         STA   $28
         LDA   $22
         STA   $01
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         AND   #$01FC
         STA   $05
         LDA   $24
         STZ   $09
         ASL   $01
         ROL
         ROL   $09
         STA   $07
         ORA   $09
         BNE   L0742EB
         LDA   $05
         CMP   #$0020
         BCC   L0742F9
L0742EB  LDA   $09
         CMP   L053ABF
         BCC   L0742FC
         LDA   L053ABD
         CMP   $07
         BCS   L0742FC
L0742F9  BRL   L0743D5
L0742FC  LDA   L054FC3
         BEQ   L074340
         PHY
         PHY
         LDA   $09
         ORA   #$8000
         PHA
         PEI   $07
         JSL   L0741B8
         PLA
         STA   $17
         PLA
         STA   $19
         LDY   #$0002
         LDA   [$17],Y
         INY
         INY
         ORA   [$17],Y
         BEQ   L074362
         LDY   #$0006
         LDA   [$17],Y
         STA   $0B
         INY
         INY
         LDA   [$17],Y
         STA   $0D
         ORA   $0B
         BEQ   L074362
         LDY   #$0002
         LDA   [$0B]
         STA   $0F
         LDA   [$0B],Y
         STA   $11
         ORA   $0F
         BEQ   L074362
L074340  LDA   #$0001
         STA   $1B
         PHA
         PHA
         PEI   $09
         PEI   $07
         JSL   L077342
         PLA
         STA   $0B
         PLA
         STA   $0D
         LDA   [$0B]
         STA   $0F
         LDY   #$0002
         LDA   [$0B],Y
         STA   $11
         BRA   L07439A
L074362  STZ   $1B
         TDC
         CLC
         ADC   #$FE01
         STZ   $11
         STA   $0F
         STZ   $01
         LDA   $07
         STA   $02
         LDA   $08
         STA   $03
         ASL   $01
         ROL   $03
         CLC
         LDA   $01
         ADC   L053AB5
         TAX
         LDA   $03
         ADC   L053AB7
         PHA
         PHX
         PEA   $0000
         PEA   $0200
         PEI   $11
         PEI   $0F
         PEA   $0000
         JSL   L077D97
L07439A  LDY   $05
         LDA   [$0F],Y
         STA   $13
         INY
         INY
         LDA   [$0F],Y
         STA   $15
         LDA   $1B
         BEQ   L0743B5
         PEI   $09
         PEI   $07
         PEA   $0000
         JSL   L074AFC
L0743B5  LDA   $13
         EOR   $22
         AND   #$00FF
         BNE   L0743D5
         LDA   $13
         LSR   $15
         ROR
         LSR   $15
         ROR
         LSR   $15
         ROR
         AND   #$FFE0
         STA   $26
         LDA   $15
         AND   #$1FFF
         STA   $28
L0743D5  LDA   $20
         STA   $24
         LDA   $1F
         STA   $23
         LDX   $1D
         TDC
         CLC
         ADC   #$0022
         TCS
         TXA
         TCD
         RTL

L0743E8  PHD
         TSC
         CLC
         ADC   #$FFDA
         TCS
         TCD
         STZ   $03
         STZ   $32
         STZ   $34
         LDA   L055051
         BEQ   L0743FE
         BRL   L0745A0
L0743FE  STZ   $19
         STZ   $1B
         LDA   #$FFFF
         LDX   #$7FFF
         STA   $11
         STX   $13
         LDA   #L053E9D
         LDX   #^L053E9D
         STA   $1D
         STX   $1F
         LDAL  L053AE7
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L074427
         EOR   #$8000
L074427  BMI   L07442C
         BRL   L0744BA
L07442C  LDA   #$0001
         STA   $21
L074431  LDY   #$0006
         LDA   [$1D],Y
         PHA
         DEY
         DEY
         LDA   [$1D],Y
         PHA
         LDA   $2E
         LDX   $30
         JSL   L033477
         BVS   L074449
         EOR   #$8000
L074449  BPL   L0744A0
         LDY   #$0006
         LDA   [$1D],Y
         PHA
         DEY
         DEY
         LDA   [$1D],Y
         PHA
         LDA   $2E
         LDX   $30
         JSL   L1512A5
         STA   $15
         STX   $17
         LDA   $2C
         BEQ   L074469
         LDA   #$0001
L074469  PHA
         PEI   $17
         PEI   $15
         LDA   $11
         LDX   $13
         JSL   L033477
         BVS   L07447B
         EOR   #$8000
L07447B  BPL   L074482
         LDA   #$0000
         BRA   L074485
L074482  LDA   #$0001
L074485  ORA   $01,S
         PLX
         LSR
         BCC   L0744A0
         LDA   $1D
         LDX   $1F
         STA   $19
         STX   $1B
         LDA   $15
         LDX   $17
         STA   $11
         STX   $13
         LDA   $2C
         DEC
         BEQ   L07451E
L0744A0  LDA   $1D
         LDX   $1F
         CLC
         ADC   #$0008
         BCC   L0744AB
         INX
L0744AB  STA   $1D
         STX   $1F
         LDA   $21
         CMP   $01
         BEQ   L0744BA
         INC   $21
         BRL   L074431
L0744BA  LDA   $19
         ORA   $1B
         BNE   L07451E
         PHY
         PEI   $30
         PEI   $2E
         JSL   L076535
         PLA
         LSR
         BCC   L0744D0
         BRL   L0743FE
L0744D0  LDA   $03
         SEC
         SBC   #$0008
         BVS   L0744DB
         EOR   #$8000
L0744DB  BPL   L0744E2
         LDA   #$0000
         BRA   L0744E5
L0744E2  LDA   #$0001
L0744E5  PHA
         LDAL  L053AD7
         PHA
         LDAL  L053AD5
         PHA
         LDA   $2E
         LDX   $30
         JSL   L033477
         BEQ   L074501
         BVS   L0744FF
         EOR   #$8000
L0744FF  BMI   L074506
L074501  LDA   #$0000
         BRA   L074509
L074506  LDA   #$0001
L074509  AND   $01,S
         PLX
         LSR
         BCC   L07451B
         JSL   L074E83
         LDA   $03
         INC
         STA   $03
         BRL   L0743FE
L07451B  BRL   L0745A0
L07451E  LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         STA   $0D
         STX   $0F
         LDY   #$0006
         LDA   [$19],Y
         PHA
         DEY
         DEY
         LDA   [$19],Y
         PHA
         LDA   $2E
         LDX   $30
         JSL   L1512A5
         STA   $05
         STX   $07
         LDA   $2C
         DEC
         DEC
         BNE   L074561
         LDA   $0D
         LDX   $0F
         PEI   $07
         PEI   $05
         JSL   L150F53
         STA   $32
         STX   $34
         LDA   $0D
         LDX   $0F
         STA   $09
         STX   $0B
         BRA   L074579
L074561  LDA   $0D
         LDX   $0F
         STA   $32
         STX   $34
         LDA   $0D
         LDX   $0F
         PEI   $30
         PEI   $2E
         JSL   L150F53
         STA   $09
         STX   $0B
L074579  PEI   $1B
         PEI   $19
         JSL   L0750FF
         PEI   $07
         PEI   $05
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L0745A0
         BEQ   L0745A0
         PEI   $0B
         PEI   $09
         PEI   $07
         PEI   $05
         PEA   $0001
         JSL   L075688
L0745A0  LDA   $2A
         STA   $30
         LDA   $29
         STA   $2F
         LDA   $27
         TCD
         TSC
         CLC
         ADC   #$002E
         TCS
         RTL

L0745B2  ENT
         PHD
         TSC
         CLC
         ADC   #$FFBE
         TCS
         TCD
         PHY
         PHY
         PEI   $4A
         PEI   $48
         JSL   L0741B8
         PLA
         STA   $3B
         PLX
         STX   $3D
         LDA   $3B
         LDX   $3D
         STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   $48
         BNE   L0745E2
         CPX   $4A
L0745E2  BEQ   L0745E9
         LDA   #$0000
         BRA   L0745EC
L0745E9  LDA   #$0001
L0745EC  PHA
         LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $3F
         STX   $41
         LDA   [$3F]
         LDY   #$0002
         ORA   [$3F],Y
         BNE   L074609
         LDA   #$0000
         BRA   L07460C
L074609  LDA   #$0001
L07460C  AND   $01,S
         PLX
         LSR
         BCC   L074641
         LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $3F
         STX   $41
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         CLC
         ADC   #$0020
         BCC   L07462F
         INX
L07462F  STA   $3F
         STX   $41
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $4C
         STX   $4E
         BRA   L07467F
L074641  PHY
         PHY
         PEI   $4A
         PEI   $48
         JSL   L0742B3
         PLA
         STA   $37
         PLX
         STX   $39
         LDA   $37
         ORA   $39
         BNE   L07465D
         STZ   $4C
         STZ   $4E
         BRA   L07467F
L07465D  PEI   $39
         PEI   $37
         PEA   $0000
         PEA   $0032
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0001
         JSL   L077D97
         LDA   $25
         LDX   $27
         STA   $4C
         STX   $4E
L07467F  LDA   $46
         STA   $4A
         LDA   $45
         STA   $49
         LDA   $43
         TCD
         TSC
         CLC
         ADC   #$0048
         TCS
         RTL

L074691  PHD
         TSC
         CLC
         ADC   #$FFD4
         TCS
         TCD
         PEI   $3C
         PEI   $3A
         LDA   #$0020
         LDX   #$0000
         JSL   L033477
         BVS   L0746AC
         EOR   #$8000
L0746AC  BPL   L0746B3
         LDA   #$0000
         BRA   L0746B6
L0746B3  LDA   #$0001
L0746B6  PHA
         LDA   $3A
         AND   #$001F
         BEQ   L0746C1
         LDA   #$0001
L0746C1  ORA   $01,S
         PLX
         LSR
         BCC   L074704
         PEA   $0000
         TDC
         CLC
         ADC   #$0015
         PHA
         PEI   $38
         PEI   $36
         JSL   L0715D9
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEI   $34
         PEI   $32
         JSL   L0715D9
         PEA   ^L040A31
         PEA   L040A31
         PEA   ^L040A32
         PEA   L040A32
         JSL   L073C22
         PEA   $001E
         JSL   L0727E0
         JSL   L070000
L074704  LDA   $30
         STA   $3C
         LDA   $2F
         STA   $3B
         LDA   $2D
         TCD
         TSC
         CLC
         ADC   #$003A
         TCS
         RTL

L074716  PHD
         TSC
         CLC
         ADC   #$FFD4
         TCS
         TCD
         LDA   $36
         LDX   $38
         CMP   $3A
         BNE   L074728
         CPX   $3C
L074728  BNE   L07472F
         LDA   #$0000
         BRA   L074732
L07472F  LDA   #$0001
L074732  PHA
         LDA   #$4957
         LDX   #$444C
         CMP   $3A
         BNE   L07473F
         CPX   $3C
L07473F  BNE   L074746
         LDA   #$0000
         BRA   L074749
L074746  LDA   #$0001
L074749  AND   $01,S
         PLX
         LSR
         BCC   L07478C
         PEA   $0000
         TDC
         CLC
         ADC   #$0015
         PHA
         PEI   $40
         PEI   $3E
         JSL   L0715D9
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEI   $34
         PEI   $32
         JSL   L0715D9
         PEA   ^L040A33
         PEA   L040A33
         PEA   ^L040A34
         PEA   L040A34
         JSL   L073C22
         PEA   $001E
         JSL   L0727E0
         JSL   L070000
L07478C  LDA   $30
         STA   $40
         LDA   $2F
         STA   $3F
         LDA   $2D
         TCD
         TSC
         CLC
         ADC   #$003E
         TCS
         RTL

L07479E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L05504D
         BEQ   L0747AF
         JSL   L078CA4
L0747AF  LDA   L055013
         ORA   L055015
         BEQ   L0747C7
L0747B7  PHY
         PHY
         PEI   $0A
         JSL   L074067
         PLA
         PLX
         STX   $01
         ORA   $01
         BNE   L0747B7
L0747C7  LDA   #$0001
         STA   L054FF5
         JSL   L075602
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

L0747E1  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEI   $10
         PEI   $0E
         JSL   L0741B8
         PLA
         STA   $01
         PLX
         STX   $03
         LDY   #$000A
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BPL   L07480C
         PEI   $03
         PEI   $01
         JSL   L07481E
L07480C  LDA   $0C
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

L07481E  PHD
         TSC
         CLC
         ADC   #$FFCA
         TCS
         TCD
         LDA   $3C
         LDX   $3E
         STA   $01
         STX   $03
         LDY   #$000A
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BMI   L074840
         PEA   $0DFE
         JSL   L07272E
L074840  LDY   #$0006
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L074852
         PEA   $0DFF
         JSL   L07272E
L074852  LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $33
         STX   $35
         LDA   [$33]
         LDY   #$0002
         ORA   [$33],Y
         BNE   L074870
         PEA   $0E00
         JSL   L07272E
L074870  PHY
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
         STA   $2F
         PLX
         STX   $31
         LDY   #$0004
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L074913
         PHY
         PHY
         PEA   $7FFF
         PEA   $FFFF
         LDY   #$0004
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L15017E
         PLA
         STA   $27
         PLX
         STX   $29
         PEI   $29
         PEI   $27
         LDAL  L053ABF
         TAX
         LDAL  L053ABD
         JSL   L033477
         BEQ   L0748DA
         BVS   L0748D1
         EOR   #$8000
L0748D1  BPL   L0748DA
         PEA   $094E
         JSL   L07272E
L0748DA  LDA   #$0200
         LDX   #$0000
         CMP   $2F
         BNE   L0748E6
         CPX   $31
L0748E6  BEQ   L0748EF
         PEA   $0948
         JSL   L07272E
L0748EF  LDAL  L053AB7
         PHA
         LDAL  L053AB5
         PHA
         LDA   $27
         LDX   $29
         PEA   $0000
         PEA   $0200
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $2B
         STX   $2D
         BRA   L07497E
L074913  LDA   L055051
         BEQ   L074923
         PEI   $3E
         PEI   $3C
         JSL   L0753D0
         BRL   L074A12
L074923  PHY
         PHY
         LDY   #$0004
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L0742B3
         PLA
         STA   $2B
         PLX
         STX   $2D
         PEI   $2D
         PEI   $2B
         LDA   #$0000
         TAX
         JSL   L033477
         BEQ   L07494A
         BPL   L074951
L07494A  PEA   $0729
         JSL   L07272E
L074951  PEI   $2D
         PEI   $2B
         PEA   $0000
         PEA   $0020
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0001
         JSL   L077D97
         LDA   $05
         LDX   $07
         CMP   $2F
         BNE   L074975
         CPX   $31
L074975  BEQ   L07497E
         PEA   $072D
         JSL   L07272E
L07497E  PHY
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L0718FA
         PLA
         STA   $25
         PEI   $2D
         PEI   $2B
         PEI   $31
         PEI   $2F
         LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         PHX
         PHA
         JSL   L078BF0
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         PEI   $25
         JSL   L0718DA
         LDY   #$000A
         LDA   [$01],Y
         AND   #$7FFF
         LDY   #$000A
         STA   [$01],Y
         LDA   L055013
         LDX   L055015
         TAY
         BNE   L0749DD
         DEX
L0749DD  DEC
         STA   L055013
         STX   L055015
         LDA   L055013
         LDX   L055015
         PHX
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L0749FC
         STZ   L055013
         STZ   L055015
L0749FC  LDY   #$000C
         LDA   [$01],Y
         BNE   L074A12
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L07711B
L074A12  LDA   $3A
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

L074A24  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FE1
         LDX   L054FE3
         STA   L054FC9
         STX   L054FCB
         PEI   $0E
         PEI   $0C
         PEA   $4447
         PEA   $4B42
         PEI   $0A
         JSL   L074B81
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

L074A5A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FDD
         LDX   L054FDF
         STA   L054FC9
         STX   L054FCB
         PEI   $0E
         PEI   $0C
         PEA   $5041
         PEA   $4D42
         PEI   $0A
         JSL   L074B81
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

L074A90  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FD9
         LDX   L054FDB
         STA   L054FC9
         STX   L054FCB
         PEI   $0E
         PEI   $0C
         PEA   $4452
         PEA   $4143
         PEI   $0A
         JSL   L074B81
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

L074AC6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FD5
         LDX   L054FD7
         STA   L054FC9
         STX   L054FCB
         PEI   $0E
         PEI   $0C
         PEA   $5453
         PEA   $494C
         PEI   $0A
         JSL   L074B81
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

L074AFC  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDX   #$0000
         LDA   $12
         BPL   L074B0C
         INX
L074B0C  TXA
         PHA
         PEI   $12
         PEI   $10
         LDAL  L053ABF
         TAX
         LDAL  L053ABD
         JSL   L033477
         BEQ   L074B28
         BVS   L074B26
         EOR   #$8000
L074B26  BMI   L074B2D
L074B28  LDA   #$0000
         BRA   L074B30
L074B2D  LDA   #$0001
L074B30  ORA   $01,S
         PLX
         LSR
         BCC   L074B3D
         PEA   $0660
         JSL   L07272E
L074B3D  PHY
         PHY
         PEA   $8000
         PEA   $0000
         PEI   $12
         PEI   $10
         JSL   L150241
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   L054FD1
         LDX   L054FD3
         STA   L054FC9
         STX   L054FCB
         PEI   $03
         PEI   $01
         PEA   $444C
         PEA   $4957
         PEI   $0E
         JSL   L074B81
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

L074B81  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD4
         TCS
         TCD
         PHY
         PHY
         PEI   $3A
         PEI   $38
         JSL   L0741B8
         PLA
         STA   $25
         PLX
         STX   $27
         LDA   $25
         LDX   $27
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L074BB3
         PEA   $04E2
         JSL   L07272E
L074BB3  LDY   #$000C
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BEQ   L074BC0
         BPL   L074BC7
L074BC0  PEA   $04EC
         JSL   L07272E
L074BC7  LDY   #$0006
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L074BD9
         PEA   $11EB
         JSL   L07272E
L074BD9  LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $29
         STX   $2B
         LDA   [$29]
         LDY   #$0002
         ORA   [$29],Y
         BNE   L074BF7
         PEA   $04ED
         JSL   L07272E
L074BF7  LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $29
         STX   $2B
         LDY   #$0002
         LDA   [$29],Y
         TAX
         LDA   [$29]
         CLC
         ADC   #$0004
         BCC   L074C14
         INX
L074C14  STA   $29
         STX   $2B
         LDA   $34
         LDX   $36
         CMP   [$29]
         BNE   L074C26
         LDY   #$0002
         TXA
         CMP   [$29],Y
L074C26  BEQ   L074C3D
         LDA   #$4957
         LDX   #$444C
         CMP   $34
         BNE   L074C34
         CPX   $36
L074C34  BEQ   L074C3D
         PEA   $0514
         JSL   L07272E
L074C3D  LDY   #$000A
         LDA   [$01],Y
         PHA
         LDX   #$0000
         PLA
         BMI   L074C4A
         INX
L074C4A  TXA
         AND   $32
         BEQ   L074C6C
         LDY   #$000A
         LDA   #$8000
         ORA   [$01],Y
         LDY   #$000A
         STA   [$01],Y
         LDA   L055013
         LDX   L055015
         INC
         BNE   L074C66
         INX
L074C66  STA   L055013
         STX   L055015
L074C6C  LDY   #$000C
         LDA   [$01],Y
         DEC
         LDY   #$000C
         STA   [$01],Y
         LDY   #$000C
         LDA   [$01],Y
         BNE   L074CA9
         LDA   L05500F
         LDX   L055011
         TAY
         BNE   L074C88
         DEX
L074C88  DEC
         STA   L05500F
         STX   L055011
         LDY   #$000A
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BMI   L074CA9
         LDY   #$0008
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         JSL   L07711B
L074CA9  LDA   $30
         STA   $3A
         LDA   $2F
         STA   $39
         LDA   $2D
         TCD
         TSC
         CLC
         ADC   #$0038
         TCS
         RTL

L074CBB  PHD
         TSC
         CLC
         ADC   #$FFC8
         TCS
         TCD
         LDA   #$0007
         STA   $01
         LDA   L055043
         LDX   L055045
         STA   $35
         STX   $37
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         STA   $03
         STX   $05
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2006
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BEQ   L074CFE
         STZ   $42
         STZ   $44
         BRA   L074D23
L074CFE  PHY
         PHY
         PEA   $0001
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         _ConvSeconds
         STAL  L05565D
         PLA
         STA   $42
         PLX
         STX   $44
L074D23  LDA   $3C
         STA   $40
         LDA   $3B
         STA   $3F
         LDA   $39
         TCD
         TSC
         CLC
         ADC   #$003E
         TCS
         RTL

L074D35  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   L055047
         BNE   L074D45
         BRL   L074E10
L074D45  PEA   $0000
         JSL   L07479E
         LDA   L05501B
         LDX   L05501D
         CMPL  L053B29
         BNE   L074D5D
         TXA
         CMPL  L053B2B
L074D5D  BNE   L074D64
         LDA   #$0000
         BRA   L074D67
L074D64  LDA   #$0001
L074D67  AND   L054FF9
         BEQ   L074D70
         JSL   L078CA4
L074D70  PEA   $0000
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L077086
         PHY
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L0718FA
         PLA
         STA   $05
         LDA   L055047
         PHA
         JSL   L075A4F
         PHY
         PHY
         PEA   $0000
         PHD
         JSL   L074CBB
         PLA
         STA   $01
         PLX
         STX   $03
         STZ   L055047
         STZ   L054FF9
         LDA   L054FC1
         DEC
         PEA   $000C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0539E9
         LDX   #^L0539E9
         BCC   L074DC4
         INX
L074DC4  CLC
         ADC   #$0008
         BCC   L074DCB
         INX
L074DCB  STA   $07
         STX   $09
         LDA   $01
         LDX   $03
         STA   [$07]
         TXA
         LDY   #$0002
         STA   [$07],Y
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         PEI   $05
         JSL   L0718DA
         LDX   #$0000
         LDA   L05502F
         CMP   L05503D
         BEQ   L074DF5
         INX
L074DF5  PHX
         LDA   L05503D
         BEQ   L074DFE
         LDA   #$0001
L074DFE  AND   $01,S
         PLX
         LSR
         BCC   L074E10
         JSL   L0B0DD7
         LDA   L05503D
         PHA
         JSL   L150B5E
L074E10  PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L074E17  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FCD
         LDX   L054FCF
         STA   L054FC9
         STX   L054FCB
         PEI   $0E
         PEI   $0C
         PEA   $4547
         PEA   $4150
         PEI   $0A
         JSL   L074B81
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

L074E4D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FC5
         LDX   L054FC7
         STA   L054FC9
         STX   L054FCB
         PEI   $0E
         PEI   $0C
         PEA   $444C
         PEA   $4957
         PEI   $0A
         JSL   L074B81
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

L074E83  PHD
         TSC
         CLC
         ADC   #$FFCA
         TCS
         TCD
         STZ   $27
         STZ   $29
         LDA   #$FFFF
         LDX   #$7FFF
         STA   $1F
         STX   $21
         LDA   #L053E9D
         LDX   #^L053E9D
         STA   $2F
         STX   $31
         LDAL  L053AE7
         DEC
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L074EB5
         EOR   #$8000
L074EB5  BPL   L074F28
         LDA   #$0001
         STA   $1D
L074EBC  LDA   $2F
         LDX   $31
         CLC
         ADC   #$0008
         BCC   L074EC7
         INX
L074EC7  STA   $2B
         STX   $2D
         LDY   #$0002
         LDA   [$2B],Y
         PHA
         LDA   [$2B]
         PHA
         LDY   #$0002
         LDA   [$2F],Y
         PHA
         LDA   [$2F]
         PHA
         LDY   #$0006
         LDA   [$2F],Y
         TAX
         DEY
         DEY
         LDA   [$2F],Y
         JSL   L150F53
         JSL   L1512A5
         STA   $23
         STX   $25
         PEI   $25
         PEI   $23
         LDA   $1F
         LDX   $21
         JSL   L033477
         BVS   L074F04
         EOR   #$8000
L074F04  BMI   L074F16
         LDA   $2F
         LDX   $31
         STA   $27
         STX   $29
         LDA   $23
         LDX   $25
         STA   $1F
         STX   $21
L074F16  LDA   $2B
         LDX   $2D
         STA   $2F
         STX   $31
         LDA   $1D
         CMP   $01
         BEQ   L074F28
         INC   $1D
         BRA   L074EBC
L074F28  LDA   #$FFFF
         LDX   #$7FFF
         CMP   $1F
         BNE   L074F34
         CPX   $21
L074F34  BEQ   L074F3B
         LDA   #$0000
         BRA   L074F3E
L074F3B  LDA   #$0001
L074F3E  PHA
         LDX   #$0000
         LDA   $21
         BMI   L074F4A
         ORA   $1F
         BNE   L074F4B
L074F4A  INX
L074F4B  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L074F59
         PEA   $072A
         JSL   L07272E
L074F59  LDY   #$0006
         LDA   [$27],Y
         TAX
         DEY
         DEY
         LDA   [$27],Y
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$27],Y
         TAX
         LDA   [$27]
         PEI   $1B
         PEI   $19
         JSL   L150F53
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$27],Y
         TAX
         LDA   [$27]
         STA   $05
         STX   $07
         PHY
         PHY
         PEI   $0B

*

         PEI   $09
         JSL   L076F11
         PLA
         STA   $15
         PLX
         STX   $17
         PHY
         PHY
         PEI   $17
         PEI   $15
         JSL   L077A5B
         PLA
         STA   $11
         PLX
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         STA   $0D
         STX   $0F
         PHY
         PEI   $13
         PEI   $11
         JSL   L0718FA
         PLA
         STA   $03
         PEI   $07
         PEI   $05
         PEI   $0F
         PEI   $0D
         LDY   #$0002
         LDA   [$11],Y
         PHA
         LDA   [$11]
         PHA
         JSL   L078BF0
         PEI   $13
         PEI   $11
         PEI   $03
         JSL   L0718DA
         PEI   $17
         PEI   $15
         PEI   $07
         PEI   $05
         JSL   L078A77
         PEI   $17
         PEI   $15
         PEA   $0000
         JSL   L074E4D
         PEI   $29
         PEI   $27
         JSL   L0750FF
         LDA   $05
         LDX   $07
         PEI   $0F
         PEI   $0D
         JSL   L150F53
         PHX
         PHA
         PEI   $1B
         PEI   $19
         PEA   $0000
         JSL   L075688
         TSC
         CLC
         ADC   #$0036
         TCS
         PLD
         RTL

L07502A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD4
         TCS
         TCD
         STZ   $3E
         STZ   $40
         LDX   #$0000
         LDA   $3C
         BMI   L075041
         ORA   $3A
         BNE   L075042
L075041  INX
L075042  TXA
         ORA   L055051
         BEQ   L07504B
         BRL   L0750ED
L07504B  PHY
         PHY
         PEI   $34
         PEI   $32
         JSL   L075F06
         PLA
         STA   $01
         PLX
         STX   $03
         PHY
         PHY
         PEI   $3C
         PEI   $3A
         JSL   L07704E
         PLA
         STA   $3A
         PLX
         STX   $3C
         PHY
         PHY
         PEI   $3C
         PEI   $3A
         PEA   $0000
         JSL   L0743E8
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BNE   L075094
         PEI   $03
         PEI   $01
         PEA   $0000
         PEA   $0000
         JSL   L078A77
         BRA   L0750ED
L075094  LDA   $3A
         LDX   $3C
         STA   $09
         STX   $0B
         LDA   $36
         LDX   $38
         STA   $0D
         STX   $0F
         LDA   $01
         LDX   $03
         STA   $11
         STX   $13
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   ^L040A35
         PEA   L040A35
         PEA   $0014
         JSL   L0313BE
         PEI   $07
         PEI   $05
         PEA   $0000
         PEA   $0020
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L078BF0
         PEI   $03
         PEI   $01
         PEI   $07
         PEI   $05
         JSL   L078A77
         LDA   $01
         LDX   $03
         STA   $3E
         STX   $40
L0750ED  LDA   $30
         STA   $3C
         LDA   $2F
         STA   $3B
         LDA   $2D
         TCD
         TSC
         CLC
         ADC   #$003A
         TCS
         RTL

L0750FF  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDAL  L053AE7
         DEC
         STAL  L053AE7
         LDAL  L053AD7
         PHA
         LDAL  L053AD5
         PHA
         LDY   #$0006
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         JSL   L1512A5
         STAL  L053AD5
         TXA
         STAL  L053AD7
         LDA   #$0001
         STA   L05504D
         LDAL  L053AE7
         SEC
         SBC   #$0000
         BPL   L075148
         PEA   $04FC
         JSL   L07272E
L075148  LDAL  L053AD7
         PHA
         LDAL  L053AD5
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L075163
         PEA   $04FD
         JSL   L07272E
L075163  LDAL  L053AD5
         AND   #$001F
         BEQ   L075173
         PEA   $04FE
         JSL   L07272E
L075173  LDA   $16
         LDX   $18
         STA   $09
         STX   $0B
         LDA   $09
         LDX   $0B
         CLC
         ADC   #$0008
         BCC   L075186
         INX
L075186  STA   $05
         STX   $07
         PEA   ^L05409D
         PEA   L05409D
         LDA   $05
         LDX   $07
         JSL   L1512A5
         STA   $01
         STX   $03
         PEI   $07
         PEI   $05
         PEI   $0B
         PEI   $09
         PEI   $03
         PEI   $01
         JSL   L1511CE
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

L0751BE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCC
         TCS
         TCD
         STZ   $42
         LDA   L055051
         BEQ   L0751D0
         BRL   L0752D4
L0751D0  PHY
         PHY
         PEI   $40
         PEI   $3E
         JSL   L0742B3
         PLA
         STA   $2D
         PLX
         STX   $2F
         PEI   $2F
         PEI   $2D
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L0751F1
         BRL   L0752D4
L0751F1  BNE   L0751F6
         BRL   L0752D4
L0751F6  PEI   $2F
         PEI   $2D
         PEA   $0000
         PEA   $0020
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L077D97
         PEI   $40
         PEI   $3E
         PEI   $3C
         PEI   $3A
         PEI   $0F
         PEI   $0D
         PEA   $0000
         PEA   $0513
         JSL   L074716
         PHY
         PHY
         PEI   $40
         PEI   $3E
         JSL   L0741B8
         PLA
         STA   $29
         PLX
         STX   $2B
         LDA   $29
         LDX   $2B
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BEQ   L0752B2
         LDY   #$000C
         LDA   [$01],Y
         BEQ   L075257
         PEA   $04BA
         JSL   L07272E
L075257  LDY   #$0006
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L075269
         PEA   $11C1
         JSL   L07272E
L075269  LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $31
         STX   $33
         LDA   [$31]
         LDY   #$0002
         ORA   [$31],Y
         BEQ   L0752AA
         PHY
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
         STA   $05
         PLX
         STX   $07
         LDA   $09
         LDX   $0B
         CMP   $05
         BNE   L0752A1
         CPX   $07
L0752A1  BEQ   L0752AA
         PEA   $04C4
         JSL   L07272E
L0752AA  PEI   $2B
         PEI   $29
         JSL   L0753D0
L0752B2  PEI   $40
         PEI   $3E
         PEA   $0000
         PEA   $0000
         JSL   L078A77
         PEI   $2F
         PEI   $2D
         PEI   $0B
         PEI   $09
         PEA   $0001
         JSL   L075688
         LDA   #$0001
         STA   $42
L0752D4  LDA   $38
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

L0752E6  ENT
         PHD
         TSC
         CLC
         ADC   #$FF70
         TCS
         TCD
         STZ   $9A
         STZ   $9C
         PEI   $98
         PEI   $96
         TDC
         CLC
         ADC   #$0089
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L07869F
         LDA   #$0002
         STA   $7D
         LDY   #$0002
         LDA   [$89],Y
         TAX
         LDA   [$89]
         STA   $7F
         STX   $81
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         PEA   $2020
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BNE   L0753B2
         LDA   #$0002
         STA   $5F
         LDA   $83
         STA   $61
         TDC
         CLC
         ADC   #$0025
         STA   $63
         STZ   $65
         LDA   #$0023
         STA   $25
         TDC
         CLC
         ADC   #$005F
         PEA   $0000
         PHA
         PEA   $202C
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BNE   L0753B2
         LDA   #$0006
         STA   $49
         TDC
         CLC
         ADC   #$0027
         STA   $4B
         STZ   $4D
         TDC
         CLC
         ADC   #$0001
         STA   $4F
         STZ   $51
         LDA   #$0024
         STA   $01
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         PEA   $2008
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BNE   L0753B2
         PEI   $59
         PEI   $57
         LDA   $5D
         JSL   L150488
         JSL   L150D50
         PLA
         STA   $9A
         PLX
         STX   $9C
L0753B2  PEI   $8B
         PEI   $89
         PEI   $87
         PEI   $85
         JSL   L071825
         LDA   $94
         STA   $98
         LDA   $93
         STA   $97
         LDA   $91
         TCD
         TSC
         CLC
         ADC   #$0096
         TCS
         RTL

L0753D0  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         LDY   #$0008
         LDA   [$1E],Y
         PHA
         DEY
         DEY
         LDA   [$1E],Y
         PHA
         JSL   L07185A
         LDA   L05500D
         DEC
         STA   L05500D
         LDA   L05500D
         SEC
         SBC   #$0000
         BPL   L0753FE
         PEA   $047E
         JSL   L07272E
L0753FE  LDY   #$000A
         LDA   [$1E],Y
         SEC
         SBC   #$0000
         BPL   L07541A
         LDA   L055013
         LDX   L055015
         TAY
         BNE   L075413
         DEX
L075413  DEC
         STA   L055013
         STX   L055015
L07541A  LDA   $1E
         LDX   $20
         STA   $11
         STX   $13
L075422  LDA   $11
         LDX   $13
         STA   $0D
         STX   $0F
         LDA   $0D
         LDX   $0F
         STA   $01
         STX   $03
         LDA   #$0000
         STA   [$01]
         LDA   #$0000
         TAX
         LDY   #$0002
         STA   [$01],Y
         INY
         INY
         TXA
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
         LDY   #$000A
         STA   [$01],Y
         LDA   #$0000
         LDY   #$000C
         STA   [$01],Y
L075463  LDA   $11
         LDX   $13
         CLC
         ADC   #$000E
         BCC   L07546E
         INX
L07546E  STA   $11
         STX   $13
         LDA   L054FF1
         LDX   L054FF3
         CMP   $11
         BNE   L07547E
         CPX   $13
L07547E  BNE   L07548A
         LDA   L054FED
         LDX   L054FEF
         STA   $11
         STX   $13
L07548A  LDY   #$0004
         LDA   [$11],Y
         TAX
         DEY
         DEY
         LDA   [$11],Y
         STA   $05
         STX   $07
         LDA   $05
         ORA   $07
         BNE   L0754A1
         BRL   L075565
L0754A1  PHY
         PHY
         LDA   L054FED
         LDX   L054FEF
         PHX
         PHA
         LDA   L05500B
         PHA
         PEI   $07
         PEI   $05
         LDY   #$000A
         LDA   [$11],Y
         AND   #$000F
         PHA
         JSL   L074272
         PLA
         STA   $09
         PLX
         STX   $0B
         PEI   $0B
         PEI   $09
         LDA   $0D
         LDX   $0F
         JSL   L033477
         BEQ   L0754F6
         BVS   L0754D9
         EOR   #$8000
L0754D9  BPL   L0754F6
         PEI   $0B
         PEI   $09
         LDA   $11
         LDX   $13
         JSL   L033477
         BNE   L0754EC
         BRL   L075463
L0754EC  BVS   L0754F1
         EOR   #$8000
L0754F1  BMI   L0754F6
         BRL   L075463
L0754F6  PEI   $0F
         PEI   $0D
         LDA   $11
         LDX   $13
         JSL   L033477
         BEQ   L075523
         BVS   L075509
         EOR   #$8000
L075509  BPL   L075523
         PEI   $0B
         PEI   $09
         LDA   $0D
         LDX   $0F
         JSL   L033477
         BEQ   L075523
         BVS   L07551E
         EOR   #$8000
L07551E  BPL   L075523
         BRL   L075463
L075523  PEI   $0F
         PEI   $0D
         LDA   $11
         LDX   $13
         JSL   L033477
         BEQ   L075553
         BVS   L075536
         EOR   #$8000
L075536  BPL   L075553
         PEI   $0B
         PEI   $09
         LDA   $11
         LDX   $13
         JSL   L033477
         BNE   L075549
         BRL   L075463
L075549  BVS   L07554E
         EOR   #$8000
L07554E  BMI   L075553
         BRL   L075463
L075553  PEI   $0F
         PEI   $0D
         PEI   $13
         PEI   $11
         PEA   $000E
         JSL   L0313BE
         BRL   L075422
L075565  LDA   $1C
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

L075577  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   #L053E9D
         LDX   #^L053E9D
         STA   $05
         STX   $07
         STZ   $16
         STZ   $18
         LDAL  L053AE7
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L07559E
         EOR   #$8000
L07559E  BPL   L0755F0
         LDA   #$0001
         STA   $03
L0755A5  LDA   $12
         LDX   $14
         CMP   [$05]
         BNE   L0755B3
         LDY   #$0002
         TXA
         CMP   [$05],Y
L0755B3  BNE   L0755BD
         LDA   $05
         LDX   $07
         STA   $16
         STX   $18
L0755BD  LDY   #$0002
         LDA   [$05],Y
         PHA
         LDA   [$05]
         PHA
         LDA   $12
         LDX   $14
         JSL   L033477
         BVS   L0755D3
         EOR   #$8000
L0755D3  BPL   L0755D7
         BRA   L0755F0
L0755D7  LDA   $05
         LDX   $07
         CLC
         ADC   #$0008
         BCC   L0755E2
         INX
L0755E2  STA   $05
         STX   $07
         LDA   $03
         CMP   $01
         BEQ   L0755F0
         INC   $03
         BRA   L0755A5
L0755F0  LDA   $10
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

L075602  PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   L05504F
         EOR   #$0001
         PHA
         LDA   L055047
         BEQ   L075619
         LDA   #$0001
L075619  AND   $01,S
         PLX
         LSR
         BCC   L075680
         LDA   L054FF5
         ORA   L054FF7
         BEQ   L075680
         LDA   #$0002
         STA   $01
         LDA   L055047
         STA   $03
         LDA   L054FF7
         BEQ   L07563A
         STZ   $05
         BRA   L07563F
L07563A  LDA   #$8000
         STA   $05
L07563F  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2015
         JSL   GSOS2
         STAL  L05565D
         LDA   #$0004
         CMPL  L05565D
         BNE   L075664
         LDA   L055047
         PHA
         JSL   L075B44
L075664  LDA   #$002B
         CMPL  L05565D
         BNE   L07567A
         PHY
         JSL   L076B39
         PLA
         LSR
         BCS   L07563F
         JSL   L070000
L07567A  STZ   L054FF7
         STZ   L054FF5
L075680  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L075688  PHD
         TSC
         CLC
         ADC   #$FFA8
         TCS
         TCD
         LDX   #$0000
         LDA   $62
         BPL   L075698
         INX
L075698  TXA
         PHA
         LDA   #$001F
         AND   $60
         BEQ   L0756A4
         LDA   #$0001
L0756A4  ORA   $01,S
         PLX
         LSR
         BCC   L0756B1
         PEA   $0438
         JSL   L07272E
L0756B1  LDAL  L053AE7
         SEC
         SBC   #$0040
         BVS   L0756BE
         EOR   #$8000
L0756BE  BPL   L0756C7
         PEA   $0439
         JSL   L07272E
L0756C7  LDAL  L053AE7
         INC
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L053E9D
         LDX   #^L053E9D
         BCC   L0756DC
         INX
L0756DC  STA   $01
         STX   $03
         LDA   #$FFFF
         LDX   #$7FFF
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
         LDA   $60
         LDX   $62
         LDY   #$0004
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         STZ   $29
         STZ   $2B
         STZ   $25
         STZ   $27
         LDA   #L053E9D
         LDX   #^L053E9D
         STA   $21
         STX   $23
         PEI   $23
         PEI   $21
         LDAL  L053AE7
         ASL
         ASL
         ASL
         JSL   L150488
         JSL   L150F53
         STA   $2D
         STX   $2F
         LDA   $64
         LDX   $66
         PEI   $62
         PEI   $60
         JSL   L150F53
         STA   $15
         STX   $17
L075735  LDY   #$0002
         LDA   [$21],Y
         PHA
         LDA   [$21]
         PHA
         LDA   $15
         LDX   $17
         JSL   L033477
         BEQ   L07574F
         BVS   L07574D
         EOR   #$8000
L07574D  BMI   L07579F
L07574F  LDY   #$0002
         LDA   [$21],Y
         PHA
         LDA   [$21]
         PHA
         LDY   #$0006
         LDA   [$21],Y
         TAX
         DEY
         DEY
         LDA   [$21],Y
         JSL   L150F53
         CMP   $64
         BNE   L07576C
         CPX   $66
L07576C  BNE   L075776
         LDA   $21
         LDX   $23
         STA   $25
         STX   $27
L075776  LDA   $15
         LDX   $17
         CMP   [$21]
         BNE   L075784
         LDY   #$0002
         TXA
         CMP   [$21],Y
L075784  BNE   L07578E
         LDA   $21
         LDX   $23
         STA   $29
         STX   $2B
L07578E  LDA   $21
         LDX   $23
         CLC
         ADC   #$0008
         BCC   L075799
         INX
L075799  STA   $21
         STX   $23
         BRA   L075735
L07579F  LDA   $29
         ORA   $2B
         BEQ   L0757A8
         BRL   L075828
L0757A8  LDA   $25
         ORA   $27
         BNE   L075828
         LDA   $21
         LDX   $23
         STA   $0D
         STX   $0F
         LDA   $0D
         LDX   $0F
         CLC
         ADC   #$0008
         BCC   L0757C1
         INX
L0757C1  STA   $11
         STX   $13
         PEI   $2F
         PEI   $2D
         LDA   $0D
         LDX   $0F
         JSL   L1512A5
         STA   $09
         STX   $0B
         PEI   $0B
         PEI   $09
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L0757F5
         BEQ   L0757F5
         PEI   $0F
         PEI   $0D
         PEI   $13
         PEI   $11
         PEI   $0B
         PEI   $09
         JSL   L1511CE
L0757F5  LDAL  L053AE7
         INC
         STAL  L053AE7
         LDA   $64
         LDX   $66
         STA   [$21]
         TXA
         LDY   #$0002
         STA   [$21],Y
         LDA   $60
         LDX   $62
         LDY   #$0004
         STA   [$21],Y
         INY
         INY
         TXA
         STA   [$21],Y
         LDA   $64
         LDX   $66
         STA   $31
         STX   $33
         LDA   $60
         LDX   $62
         STA   $35
         STX   $37
L075828  LDA   $29
         ORA   $2B
         BEQ   L07587F
         LDA   $25
         ORA   $27
         BNE   L07587F
         LDA   $64
         LDX   $66
         STA   [$29]
         TXA
         LDY   #$0002
         STA   [$29],Y
         LDA   #$0004
         CLC
         ADC   $29
         LDX   $2B
         BCC   L07584B
         INX
L07584B  STA   $55
         STX   $57
         LDY   #$0006
         LDA   [$29],Y
         TAX
         DEY
         DEY
         LDA   [$29],Y
         PEI   $62
         PEI   $60
         JSL   L150F53
         STA   [$55]
         TXA
         LDY   #$0002
         STA   [$55],Y
         LDA   $64
         LDX   $66
         STA   $31
         STX   $33
         LDY   #$0006
         LDA   [$29],Y
         TAX
         DEY
         DEY
         LDA   [$29],Y
         STA   $35
         STX   $37
L07587F  LDA   $29
         ORA   $2B
         BNE   L0758CE
         LDA   $25
         ORA   $27
         BEQ   L0758CE
         LDA   #$0004
         CLC
         ADC   $25
         LDX   $27
         BCC   L075896
         INX
L075896  STA   $55
         STX   $57
         LDY   #$0006
         LDA   [$25],Y
         TAX
         DEY
         DEY
         LDA   [$25],Y
         PEI   $62
         PEI   $60
         JSL   L150F53
         STA   [$55]
         TXA
         LDY   #$0002
         STA   [$55],Y
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $31
         STX   $33
         LDY   #$0006
         LDA   [$25],Y
         TAX
         DEY
         DEY
         LDA   [$25],Y
         STA   $35
         STX   $37
L0758CE  LDA   $29
         ORA   $2B
         BNE   L0758D7
         BRL   L075958
L0758D7  LDA   $25
         ORA   $27
         BEQ   L075958
         LDY   #$0006
         LDA   [$29],Y
         TAX
         DEY
         DEY
         LDA   [$29],Y
         STA   $1D
         STX   $1F
         PEI   $2B
         PEI   $29
         JSL   L0750FF
         LDAL  L053AD7
         TAX
         LDAL  L053AD5
         PEI   $1F
         PEI   $1D
         JSL   L150F53
         STAL  L053AD5
         TXA
         STAL  L053AD7
         LDA   #$0004
         CLC
         ADC   $25
         LDX   $27
         BCC   L075918
         INX
L075918  STA   $55
         STX   $57
         LDY   #$0006
         LDA   [$25],Y
         TAX
         DEY
         DEY
         LDA   [$25],Y
         PEI   $1F
         PEI   $1D
         JSL   L150F53
         PEI   $62
         PEI   $60
         JSL   L150F53
         STA   [$55]
         TXA
         LDY   #$0002
         STA   [$55],Y
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $31
         STX   $33
         LDY   #$0006
         LDA   [$25],Y
         TAX
         DEY
         DEY
         LDA   [$25],Y
         STA   $35
         STX   $37
L075958  LDA   #$5246
         LDX   #$4545
         STA   $39
         STX   $3B
         STZ   $3D
         STZ   $3F
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         PEA   ^L040A49
         PEA   L040A49
         PEA   $0014
         JSL   L0313BE
         PEI   $33
         PEI   $31
         PEA   $0000
         PEA   $0020
         TDC
         CLC
         ADC   #$0035
         PEA   $0000
         PHA
         JSL   L078BF0
         LDAL  L053AD7
         TAX
         LDAL  L053AD5
         PEI   $62
         PEI   $60
         JSL   L150F53
         STAL  L053AD5
         TXA
         STAL  L053AD7
         LDA   #$0001
         STA   L05504D
         LDA   $5E
         BEQ   L0759FA
         STZ   $05
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $201D
         JSL   GSOS2
         STAL  L05565D
L0759CD  LDAL  L053AE7
         SEC
         SBC   #$003C
         BEQ   L0759E4
         BVS   L0759DC
         EOR   #$8000
L0759DC  BPL   L0759E4
         JSL   L074E83
         BRA   L0759CD
L0759E4  STZ   $05
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $201E
         JSL   GSOS2
         STAL  L05565D
L0759FA  LDA   $5C
         STA   $66
         LDA   $5B
         STA   $65
         LDA   $59
         TCD
         TSC
         CLC
         ADC   #$0064
         TCS
         RTL

L075A0C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   #$0002
         STA   $01
         LDA   $18
         LDX   $1A
         STA   $03
         STX   $05
         LDA   $14
         LDX   $16
         STA   $07
         STX   $09
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2004
         JSL   GSOS2
         STAL  L05565D
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

L075A4F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0001
         STA   $01
         LDA   $0E
         STA   $03
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2014
         JSL   GSOS2
         STAL  L05565D
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

L075A86  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         LDX   #$0000
         LDA   $26
         ORA   $28
         BNE   L075A98
         INX
L075A98  PHX
         LDX   #$0000
         LDA   $22
         ORA   $24
         BNE   L075AA3
         INX
L075AA3  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L075AB1
         LDA   #$0005
         STA   $01
         BRA   L075AB6
L075AB1  LDA   #$0007
         STA   $01
L075AB6  LDA   $32
         LDX   $34
         STA   $03
         STX   $05
         LDA   #$00C3
         STA   $07
         LDA   $30
         STA   $09
         LDA   $2C
         LDX   $2E
         STA   $0B
         STX   $0D
         LDA   $2A
         STA   $0F
         LDA   $26
         LDX   $28
         STA   $11
         STX   $13
         LDA   $22
         LDX   $24
         STA   $15
         STX   $17
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2001
         JSL   GSOS2
         STAL  L05565D
         LDA   $20
         STA   $34
         LDA   $1F
         STA   $33
         LDA   $1D
         TCD
         TSC
         CLC
         ADC   #$0032
         TCS
         RTL

L075B09  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   #$0001
         STA   $01
         LDA   $10
         LDX   $12
         STA   $03
         STX   $05
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2002
         JSL   GSOS2
         STAL  L05565D
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

L075B44  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   #$0001
         STA   $01
         LDA   $10
         STA   $03
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2015
         JSL   GSOS2
         STAL  L05565D
         LDA   $0E
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

L075B7B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   #$0002
         STA   $01
         LDA   $12
         STA   $03
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2019
         JSL   GSOS2
         STAL  L05565D
         LDA   $05
         LDX   $07
         STA   $14
         STX   $16
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

L075BBA  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   #$0002
         STA   $01
         LDA   $12
         STA   $03
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2017
         JSL   GSOS2
         STAL  L05565D
         LDA   $05
         LDX   $07
         STA   $14
         STX   $16
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

L075BF9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         STZ   $28
         STZ   $2A
         PHY
         PHY
         PEA   $0000
         PEA   $0044
         LDA   L054FBD
         PHA
         PEA   $8010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $15
         PLX
         STX   $17
         LDAL  L05565D
         BEQ   L075C2D
         BRL   L075D29
L075C2D  LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $19
         STX   $1B
         LDA   #$0044
         STA   [$19]
L075C3E  LDA   #$0003
         STA   $01
         LDA   $26
         STA   $03
         LDA   $19
         LDX   $1B
         STA   $07
         STX   $09
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2039
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         STA   $0B
         LDA   #$004F
         CMP   $0B
         BNE   L075CAE
         PEI   $17
         PEI   $15
         JSL   L1516B7
         LDY   #$0002
         LDA   #$0004
         CLC
         ADC   [$19],Y
         JSL   L150488
         PHX
         PHA
         PEI   $17
         PEI   $15
         JSL   L1512FB
         PEI   $17
         PEI   $15
         JSL   L150BB8
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   #$0004
         CLC
         ADC   [$19],Y
         STA   [$19]
L075CAE  LDA   #$004F
         CMP   $0B
         BEQ   L075C3E
         LDA   $0B
         BNE   L075D21
         PHY
         PHY
         LDY   #$0002
         LDA   [$19],Y
         INC
         INC
         INC
         JSL   L150488
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $11
         PLX
         STX   $13
         LDAL  L05565D
         BNE   L075D21
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $19
         STX   $1B
         LDA   $19
         LDX   $1B
         CLC
         ADC   #$0002
         BCC   L075CFD
         INX
L075CFD  PHX
         PHA
         LDY   #$0002
         LDA   [$11],Y
         PHA
         LDA   [$11]
         PHA
         LDY   #$0002
         LDA   [$19],Y
         INC
         INC
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDA   $11
         LDX   $13
         STA   $28
         STX   $2A
L075D21  PEI   $17
         PEI   $15
         JSL   L07185A
L075D29  LDA   $24
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

L075D3B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC2
         TCS
         TCD
         LDA   #$0004
         STA   $01
         LDA   $46
         LDX   $48
         STA   $05
         STX   $07
         STZ   $09
         LDA   $44
         STA   $0B
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2010
         JSL   GSOS2
         STAL  L05565D
         LDA   $03
         STA   $4A
         LDA   $42
         STA   $48
         LDA   $41
         STA   $47
         LDA   $3F
         TCD
         TSC
         CLC
         ADC   #$0046
         TCS
         RTL

L075D80  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         LDA   #$0005
         STA   $01
         LDA   $26
         STA   $03
         LDA   $22
         LDX   $24
         STA   $05
         STX   $07
         LDA   $1E
         LDX   $20
         STA   $09
         STX   $0B
         LDA   $1C
         STA   $11
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2012
         JSL   GSOS2
         STAL  L05565D
         LDA   $0D
         LDX   $0F
         STA   $28
         STX   $2A
         LDA   $1A
         STA   $26
         LDA   $19
         STA   $25
         LDA   $17
         TCD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L075DD3  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   #$0003
         STA   $01
         LDA   $18
         STA   $03
         STZ   $05
         LDA   $14
         LDX   $16
         STA   $07
         STX   $09
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2018
         JSL   GSOS2
         STAL  L05565D
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

L075E14  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   #$0003
         STA   $01
         LDA   $18
         STA   $03
         STZ   $05
         LDA   $14
         LDX   $16
         STA   $07
         STX   $09
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2016
         JSL   GSOS2
         STAL  L05565D
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

L075E55  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE5
         TCS
         TCD
         LDA   #$0005
         STA   $06
         LDA   $2B
         STA   $08
         LDA   $27
         LDX   $29
         STA   $0A
         STX   $0C
         LDA   $23
         LDX   $25
         STA   $0E
         STX   $10
         LDA   $21
         STA   $16
         TDC
         CLC
         ADC   #$0006
         PEA   $0000
         PHA
         PEA   $2013
         JSL   GSOS2
         STAL  L05565D
         LDA   $12
         LDX   $14
         STA   $2D
         STX   $2F
         LDA   $1F
         STA   $2B
         LDA   $1E
         STA   $2A
         LDA   $1C
         TCD
         TSC
         CLC
         ADC   #$0029
         TCS
         RTL

L075EA8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   $12
         STZ   $14
         PHY
         PHY
         PEI   $10
         PEI   $0E
         JSL   L077A5B
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L075EF4
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0004
         BCC   L075ED9
         INX
L075ED9  STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $12
         STX   $14
         PEI   $10
         PEI   $0E
         PEA   $0000
         JSL   L074E4D
L075EF4  LDA   $0C
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

L075F06  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         LDA   $1E
         ORA   $20
         BNE   L075F17
         BRL   L07603B
L075F17  PHY
         PHY
         PEI   $20
         PEI   $1E
         PEA   $0008
         JSL   L150337
         PLA
         STA   $07
         PLX
         STX   $09
         PEI   $09
         PEI   $07
         LDA   #$0008
         LDX   #$0000
         JSL   L033477
         BVS   L075F3D
         EOR   #$8000
L075F3D  BMI   L075F42
         BRL   L07603B
L075F42  LDA   $1E
         AND   #$00FF
         JSL   L150488
         STA   $03
         STX   $05
         PEI   $09
         PEI   $07
         PEA   $0000
         PEA   $0080
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   $11
         STX   $13
         LDA   $07
         AND   #$007F
         STA   $0B
L075F6C  PEI   $13
         PEI   $11
         LDAL  L053ABF
         TAX
         LDAL  L053ABD
         JSL   L033477
         BEQ   L075F94
         BVS   L075F84
         EOR   #$8000
L075F84  BPL   L075F94
         PHY
         JSL   L076990
         PLA
         LSR
         BCS   L075F92
         BRL   L07603B
L075F92  BRA   L075F6C
L075F94  PHY
         PHY
         PEI   $13
         PEI   $11
         JSL   L077342
         PLA
         STA   $0D
         PLX
         STX   $0F
         PHY
         PHY
         PEA   $FFFF
         PEA   $FF00
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         PHX
         PHA
         LDA   $0B
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PHX
         PHA
         JSL   L15017E
         PLA
         PLX
         STX   $15
         ORA   $15
         BNE   L076030
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         PHX
         PHA
         LDA   $0B
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $15
         STX   $17
         LDA   $03
         LDX   $05
         STA   [$15]
         TXA
         LDY   #$0002
         STA   [$15],Y
         PEI   $13
         PEI   $11
         PEA   $0001
         JSL   L074AFC
         LDA   $1E
         LDX   $20
         STA   $22
         STX   $24
         BRL   L07620E
L076030  PEI   $13
         PEI   $11
         PEA   $0000
         JSL   L074AFC
L07603B  LDAL  L053ABB
         TAX
         LDAL  L053AB9
         STA   $11
         STX   $13
L076048  PEI   $13
         PEI   $11
         LDAL  L053ABF
         TAX
         LDAL  L053ABD
         JSL   L033477
         BEQ   L076072
         BVS   L076060
         EOR   #$8000
L076060  BPL   L076072
         PHY
         JSL   L076990
         PLA
         LSR
         BCS   L076072
         PEA   $06F1
         JSL   L07272E
L076072  PHY
         PHY
         PEI   $13
         PEI   $11
         JSL   L077342
         PLA
         STA   $0D
         PLX
         STX   $0F
         STZ   $0B
         LDA   $11
         ORA   $13
         BNE   L07608F
         LDA   #$0008
         STA   $0B
L07608F  PHY
         PHY
         PEA   $FFFF
         PEA   $FF00
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         PHX
         PHA
         LDA   $0B
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PHX
         PHA
         JSL   L15017E
         PLA
         PLX
         STX   $15
         ORA   $15
         BEQ   L076118
         LDA   $0B
         INC
         STA   $0B
         LDA   #$0080
         CMP   $0B
         BNE   L07608F
         PEI   $13
         PEI   $11
         PEA   $0000
         JSL   L074AFC
         LDA   $11
         LDX   $13
         INC
         BNE   L0760F2
         INX
L0760F2  STA   $11
         STX   $13
         LDAL  L053ABF
         TAX
         LDAL  L053ABD
         CLC
         ADC   #$0002
         BCC   L076106
         INX
L076106  CMP   $11
         BNE   L07610C
         CPX   $13
L07610C  BEQ   L076111
         BRL   L076048
L076111  PEA   $0536
         JSL   L07272E
L076118  LDA   $11
         LDX   $13
         PEA   $0000
         PEA   $0080
         JSL   L150D50
         LDA   $0B
         JSL   L150488
         JSL   L150F53
         STA   $07
         STX   $09
         STZ   $01
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         PHX
         PHA
         LDA   $0B
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         AND   #$00FF
         JSL   L150488
         STA   $03
         STX   $05
         LDA   $03
         ORA   $05
         BNE   L0761BD
         PHY
         JSL   L150705
         PLA
         AND   #$00FF
         JSL   L150488
         STA   $03
         STX   $05
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         PHX
         PHA
         LDA   $0B
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $15
         STX   $17
         LDA   $03
         LDX   $05
         STA   [$15]
         TXA
         LDY   #$0002
         STA   [$15],Y
         LDA   #$0001
         STA   $01
L0761BD  LDA   $07
         LDX   $09
         PEA   $0000
         PEA   $0100
         JSL   L150D50
         LDA   $03
         LDX   $05
         JSL   L150F53
         STA   $22
         STX   $24
         PEI   $13
         PEI   $11
         PEI   $01
         JSL   L074AFC
         PEI   $13
         PEI   $11
         LDAL  L053ABB
         TAX
         LDAL  L053AB9
         JSL   L033477
         BEQ   L07620E
         BVS   L0761F9
         EOR   #$8000
L0761F9  BPL   L07620E
         LDA   $11
         LDX   $13
         STAL  L053AB9
         TXA
         STAL  L053ABB
         LDA   #$0001
         STA   L05504D
L07620E  LDA   $1C
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

L076220  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         STZ   $1A
         STZ   $1C
         STZ   $09
         STZ   $0B
         LDAL  L053A9F
         TAX
         LDAL  L053A9D
         SEC
         SBC   #$0600
         BCS   L076240
         DEX
L076240  STA   $0D
         STX   $0F
         PHY
         PHY
         PEI   $0F
         PEI   $0D
         LDA   L055019
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $09
         PLX
         STX   $0B
         LDAL  L05565D
         BEQ   L07626A
         BRL   L07631A
L07626A  LDA   L055047
         PHA
         PEA   $0000
         PEA   $0600
         JSL   L075E14
         PHY
         PHY
         LDA   L055047
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0001
         JSL   L075D80
         PLA
         STA   $05
         PLX
         STX   $07
         LDAL  L05565D
         BNE   L076312
         LDA   #$0004
         CMP   $01
         BEQ   L0762BB
         LDA   L055047
         PHA
         LDA   #$0600
         CLC
         ADC   $01
         JSL   L150488
         PHX
         PHA
         JSL   L075E14
L0762BB  PHY
         PHY
         LDA   L055047
         PHA
         LDY   #$0002
         LDA   [$09],Y
         PHA
         LDA   [$09]
         PHA
         PEI   $0F
         PEI   $0D
         PEA   $0001
         JSL   L075D80
         PLA
         STA   $05
         PLX
         STX   $07
         LDAL  L05565D
         BNE   L076312
         PEI   $0B
         PEI   $09
         JSL   L07191C
         PHY
         PHY
         LDY   #$0002
         LDA   [$09],Y
         PHA
         LDA   [$09]
         PHA
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L0762FE
         INX
L0762FE  PHX
         PHA
         PEI   $0B
         PEI   $09
         JSL   L1512FB
         LDA   $09
         LDX   $0B
         STA   $1A
         STX   $1C
         BRA   L07631A
L076312  PEI   $0B
         PEI   $09
         JSL   L07185A
L07631A  TSC
         CLC
         ADC   #$0014
         TCS
         PLD
         RTL

L076322  PHD
         TSC
         CLC
         ADC   #$FFDA
         TCS
         TCD
         STZ   $13
         STZ   $15
         PHY
         PHY
         PEI   $32
         PEI   $30
         LDA   $03,S
         EOR   #$FFFF
         TAX
         PLA
         EOR   #$FFFF
         PLY
         INC
         BNE   L076343
         INX
L076343  PHX
         PHA
         LDY   #$0033
         LDA   [$2C],Y
         PHA
         DEY
         DEY
         LDA   [$2C],Y
         PHA
         LDY   #$0040
         LDA   [$2C],Y
         TAX
         DEY
         DEY
         LDA   [$2C],Y
         JSL   L150F53
         PEI   $32
         PEI   $30
         JSL   L150F53
         TAY
         BNE   L07636A
         DEX
L07636A  DEC
         PHX
         PHA
         JSL   L15017E
         PLA
         STA   $1F
         PLX
         STX   $21
         LDA   $1F
         LDX   $21
         SEC
         SBC   #$0020
         BCS   L076382
         DEX
L076382  LDY   #$0005
         STA   [$2C],Y
         INY
         INY
         TXA
         STA   [$2C],Y
         PEI   $21
         PEI   $1F
         LDY   #$0033
         LDA   [$2C],Y
         TAX
         DEY
         DEY
         LDA   [$2C],Y
         JSL   L1512A5
         STA   $1B
         STX   $1D
         LDA   L055047
         PHA
         PEI   $21
         PEI   $1F
         JSL   L075DD3
         LDAL  L05565D
         BEQ   L0763B7
         BRL   L07650A
L0763B7  LDA   #$0001
         STA   $05
         LDA   $1B
         LDX   $1D
         STA   $07
         STX   $09
L0763C4  PHY
         PHY
         PEI   $09
         PEI   $07
         LDA   L055017
         PHA
         PEA   $4000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $13
         PLX
         STX   $15
         LDAL  L05565D
         BEQ   L07641A
         LDA   $05
         ASL
         STA   $05
         PEI   $09
         PEI   $07
         PEA   $0000
         PEA   $0002
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   $07
         STX   $09
         PEI   $09
         PEI   $07
         LDA   #$0200
         LDX   #$0000
         JSL   L033477
         BVS   L076415
         EOR   #$8000
L076415  BMI   L07641A
         BRL   L07650A
L07641A  LDAL  L05565D
         BNE   L0763C4
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         STA   $0F
         STX   $11
         PEI   $11
         PEI   $0F
         PEI   $09
         PEI   $07
         JSL   L071EC5
         LDA   $0F
         LDX   $11
         PEI   $09
         PEI   $07
         JSL   L150F53
         SEC
         SBC   #$0002
         BCS   L07644B
         DEX
L07644B  STA   $0B
         STX   $0D
L07644F  PEI   $11
         PEI   $0F
         LDA   $0B
         LDX   $0D
         JSL   L033477
         BVS   L076460
         EOR   #$8000
L076460  BMI   L076478
         LDA   #$5341
         STA   [$0F]
         LDA   $0F
         LDX   $11
         CLC
         ADC   #$0200
         BCC   L076472
         INX
L076472  STA   $0F
         STX   $11
         BRA   L07644F
L076478  LDA   L055047
         PHA
         LDY   #$0033
         LDA   [$2C],Y
         PHA
         DEY
         DEY
         LDA   [$2C],Y
         PHA
         JSL   L075E14
         LDA   $05
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L07649A
         EOR   #$8000
L07649A  BPL   L0764D1
         LDA   #$0001
         STA   $03
L0764A1  PHY
         PHY
         LDA   L055047
         PHA
         LDY   #$0002
         LDA   [$13],Y
         PHA
         LDA   [$13]
         PHA
         PEI   $09
         PEI   $07
         PEA   $0000
         JSL   L075E55
         PLA
         STA   $17
         PLX
         STX   $19
         LDAL  L05565D
         BNE   L07650A
         LDA   $03
         CMP   $01
         BEQ   L0764D1
         INC   $03
         BRA   L0764A1
L0764D1  LDA   L055047
         PHA
         LDY   #$0007
         LDA   [$2C],Y
         PHA
         DEY
         DEY
         LDA   [$2C],Y
         PHA
         JSL   L075E14
         PHY
         PHY
         LDA   L055047
         PHA
         LDA   #$000D
         CLC
         ADC   $2C
         LDX   $2E
         BCC   L0764F5
         INX
L0764F5  PHX
         PHA
         PEA   $0000
         PEA   $0020
         PEA   $0000
         JSL   L075E55
         PLA
         STA   $17
         PLX
         STX   $19
L07650A  LDAL  L05565D
         LDY   #$0001
         STA   [$2C],Y
         PEI   $15
         PEI   $13
         JSL   L07185A
         LDA   $1F
         LDX   $21
         STA   $34
         STX   $36
         LDA   $2A
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

L076535  PHD
         TSC
         CLC
         ADC   #$FFC8
         TCS
         TCD
         STZ   $42
         LDA   L055051
         BEQ   L076547
         BRL   L07661E
L076547  LDAL  L053AB3
         TAX
         LDAL  L053AB1
         STA   $31
         STX   $33
         LDA   #$0020
         LDX   #$0000
         STA   $0D
         STX   $0F
         LDA   #$4154
         LDX   #$4C49
         STA   $11
         STX   $13
         LDA   #$FFFF
         TAX
         STA   $15
         STX   $17
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEA   ^L040A5D
         PEA   L040A5D
         PEA   $0014
         JSL   L0313BE
         LDA   #$FFFF
         STA   $01
         PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L0752E6
         LDA   #$FA00
         LDX   #$0000
         JSL   L033477
         BEQ   L0765C2
         BVS   L0765AA
         EOR   #$8000
L0765AA  BPL   L0765C2
         PHY
         PHY
         PEA   $0000
         PEA   $2000
         PEA   $0000
         PHD
         JSL   L076322
         PLA
         STA   $2D
         PLX
         STX   $2F
L0765C2  LDA   $01
         BEQ   L0765DC
         PHY
         PHY
         PEA   $0000
         PEA   $0400
         PEA   $0000
         PHD
         JSL   L076322
         PLA
         STA   $2D
         PLX
         STX   $2F
L0765DC  LDA   $01
         BNE   L07661E
         LDA   $31
         LDX   $33
         SEC
         SBC   #$0020
         BCS   L0765EB
         DEX
L0765EB  STA   $09
         STX   $0B
         PEI   $0B
         PEI   $09
         PEI   $07
         PEI   $05
         LDA   $09
         LDX   $0B
         JSL   L1512A5
         PHX
         PHA
         PEA   $0001
         JSL   L075688
         LDA   $2D
         LDX   $2F
         STAL  L053AB1
         TXA
         STAL  L053AB3
         JSL   L078CA4
         LDA   #$0001
         STA   $42
L07661E  LDA   $01
         BEQ   L07662E
         LDA   L055047
         PHA
         PEI   $33
         PEI   $31
         JSL   L075DD3
L07662E  LDA   #$0001
         STA   L054FF7
         JSL   L075602
         LDA   $3C
         STA   $40
         LDA   $3B
         STA   $3F
         LDA   $39
         TCD
         TSC
         CLC
         ADC   #$003E
         TCS
         RTL

L07664A  PHD
         TSC
         CLC
         ADC   #$FDE0
         TCS
         ADC   #$012D
         TCD
         STZ   $FC
         PEI   $FA
         PEI   $F8
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L076668
         BRL   L076890
L076668  BNE   L07666D
         BRL   L076890
L07666D  LDA   L055051
         BEQ   L076675
         BRL   L076895
L076675  PHY
         PHY
         PEA   $FFFF
         PEA   $FE00
         LDA   $F8
         LDX   $FA
         CLC
         ADC   #$01FF
         BCC   L076688
         INX
L076688  PHX
         PHA
         JSL   L15017E
         PLA
         STA   $F8
         PLX
         STX   $FA
         LDAL  L053ABF
         TAX
         LDAL  L053ABD
         INC
         BNE   L0766A1
         INX
L0766A1  PEA   $0000
         PEA   $0200
         JSL   L150D50
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDAL  L053AB7
         TAX
         LDAL  L053AB5
         PEI   $E9
         PEI   $E7
         JSL   L150F53
         STA   $E3
         STX   $E5
         LDA   $E3
         LDX   $E5
         PEI   $FA
         PEI   $F8
         JSL   L150F53
         STA   $DF
         STX   $E1
L0766D6  PHY
         PHY
         PEI   $E5
         PEI   $E3
         JSL   L075577
         PLA
         STA   $EB
         PLX
         STX   $ED
         LDA   $EB
         ORA   $ED
         BEQ   L07670C
         PEI   $E5
         PEI   $E3
         LDY   #$0006
         LDA   [$EB],Y
         TAX
         DEY
         DEY
         LDA   [$EB],Y
         JSL   L150F53
         STA   $E3
         STX   $E5
         PEI   $ED
         PEI   $EB
         JSL   L0750FF
         BRA   L07672B
L07670C  PHY
         PHY
         PHY
         PEI   $E5
         PEI   $E3
         JSL   L076F11
         PEA   $444C
         PEA   $4957
         PEA   $0002
         JSL   L076F4D
         PLA
         LSR
         BCS   L07672B
         BRL   L076895
L07672B  PEI   $E5
         PEI   $E3
         LDA   $DF
         LDX   $E1
         JSL   L033477
         BVS   L07673C
         EOR   #$8000
L07673C  BPL   L0766D6
         PEI   $E5
         PEI   $E3
         LDA   $DF
         LDX   $E1
         JSL   L033477
         BEQ   L07676C
         BVS   L076751
         EOR   #$8000
L076751  BPL   L07676C
         PEI   $E1
         PEI   $DF
         PEI   $E5
         PEI   $E3
         LDA   $DF
         LDX   $E1
         JSL   L1512A5
         PHX
         PHA
         PEA   $0001
         JSL   L075688
L07676C  LDA   $DF
         LDX   $E1
         STA   $D7
         STX   $D9
         LDAL  L053AB7
         TAX
         LDAL  L053AB5
         PEI   $E9
         PEI   $E7
         JSL   L150F53
         STA   $DB
         STX   $DD
         LDAL  L053ABF
         TAX
         LDAL  L053ABD
         STA   $D3
         STX   $D5
L076796  LDA   $DB
         LDX   $DD
         SEC
         SBC   #$0200
         BCS   L0767A1
         DEX
L0767A1  STA   $DB
         STX   $DD
         LDA   $D7
         LDX   $D9
         SEC
         SBC   #$0200
         BCS   L0767B0
         DEX
L0767B0  STA   $D7
         STX   $D9
         PEI   $DD
         PEI   $DB
         PEA   $0000
         PEA   $0200
         PEA   $0000
         TDC
         CLC
         ADC   #$FED3
         PHA
         PEA   $0000
         JSL   L077D97
         PEI   $D9
         PEI   $D7
         PEA   $0000
         PEA   $0200
         PEA   $0000
         TDC
         CLC
         ADC   #$FED3
         PHA
         JSL   L078BF0
         LDA   $E3
         LDX   $E5
         SEC
         SBC   #$0200
         BCS   L0767F0
         DEX
L0767F0  STA   $E3
         STX   $E5
         LDX   $D5
         LDA   $D3
         BNE   L0767FB
         DEX
L0767FB  DEC
         STA   $D3
         STX   $D5
         PEI   $D5
         PEI   $D3
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L076796
         PEA   $0000
         TDC
         CLC
         ADC   #$FED3
         PHA
         PEA   $0000
         PEA   $0100
         JSL   L071ECE
L076821  LDA   $D7
         LDX   $D9
         SEC
         SBC   #$0200
         BCS   L07682C
         DEX
L07682C  STA   $D7
         STX   $D9
         PEI   $D9
         PEI   $D7
         PEA   $0000
         PEA   $0200
         PEA   $0000
         TDC
         CLC
         ADC   #$FED3
         PHA
         JSL   L078BF0
         LDAL  L053A9F
         TAX
         LDAL  L053A9D
         CMP   $D7
         BNE   L076856
         CPX   $D9
L076856  BNE   L076821
         LDAL  L053A9F
         TAX
         LDAL  L053A9D
         PEI   $FA
         PEI   $F8
         JSL   L150F53
         STAL  L053A9D
         TXA
         STAL  L053A9F
         LDAL  L053AB7
         TAX
         LDAL  L053AB5
         PEI   $FA
         PEI   $F8
         JSL   L150F53
         STAL  L053AB5
         TXA
         STAL  L053AB7
         JSL   L078CA4
L076890  LDA   #$0001
         STA   $FC
L076895  LDA   $F6
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

L0768A7  PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $0F
         STZ   $20
         STZ   $22
         STZ   $01
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $200D
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BEQ   L0768DA
         BRL   L076978
L0768DA  LDA   L054FC3
         BEQ   L0768E2
         BRL   L076978
L0768E2  LDA   #$0001
         STA   L054FC3
         LDA   L05504D
         BEQ   L0768F1
         JSL   L078CA4
L0768F1  STZ   $07
         STZ   $09
         PEI   $1E
         PEI   $1C
         PEI   $1E
         PEI   $1C
         PEA   $0000
         PEA   $0002
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         JSL   L150F53
         STA   $03
         STX   $05
L076913  PHY
         PHY
         PEA   $0000
         JSL   L074067
         PLA
         STA   $0B
         PLX
         STX   $0D
         LDA   $07
         LDX   $09
         PEI   $0D
         PEI   $0B
         JSL   L150F53
         STA   $07
         STX   $09
         LDX   #$0000
         LDA   $0B
         ORA   $0D
         BNE   L07693C
         INX
L07693C  TXA
         BNE   L07696B
         LDX   #$0000
         LDA   $1A
         BNE   L076947
         INX
L076947  PHX
         PEI   $09
         PEI   $07
         LDA   $03
         LDX   $05
         JSL   L033477
         BVS   L076959
         EOR   #$8000
L076959  BMI   L076960
         LDA   #$0000
         BRA   L076963
L076960  LDA   #$0001
L076963  AND   $01,S
         PLX
         CMP   #$0000
         BEQ   L076913
L07696B  LDA   #$0001
         STA   L054FF5
         JSL   L075602
         STZ   L054FC3
L076978  PEI   $0F
         JSL   L071AA4
         LDA   $18
         STA   $1E
         LDA   $17
         STA   $1D
         LDA   $15
         TCD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L076990  PHD
         TSC
         CLC
         ADC   #$FDE8
         TCS
         ADC   #$0121
         TCD
         STZ   $FC
         LDA   L055051
         BEQ   L0769A5
         BRL   L076B31
L0769A5  LDAL  L053ABF
         TAX
         LDAL  L053ABD
         INC
         BNE   L0769B2
         INX
L0769B2  PEA   $0000
         PEA   $0200
         JSL   L150D50
         PLA
         STA   $EB
         PLX
         STX   $ED
         LDAL  L053AB7
         TAX
         LDAL  L053AB5
         PEI   $ED
         PEI   $EB
         JSL   L150F53
         STA   $E7
         STX   $E9
         LDA   $E7
         LDX   $E9
         CLC
         ADC   #$0200
         BCC   L0769E2
         INX
L0769E2  STA   $E3
         STX   $E5
L0769E6  PHY
         PHY
         PEI   $E9
         PEI   $E7
         JSL   L075577
         PLA
         STA   $EF
         PLX
         STX   $F1
         LDA   $EF
         ORA   $F1
         BEQ   L076A1C
         PEI   $E9
         PEI   $E7
         LDY   #$0006
         LDA   [$EF],Y
         TAX
         DEY
         DEY
         LDA   [$EF],Y
         JSL   L150F53
         STA   $E7
         STX   $E9
         PEI   $F1
         PEI   $EF
         JSL   L0750FF
         BRA   L076A3B
L076A1C  PHY
         PHY
         PHY
         PEI   $E9
         PEI   $E7
         JSL   L076F11
         PEA   $444C
         PEA   $4957
         PEA   $0002
         JSL   L076F4D
         PLA
         LSR
         BCS   L076A3B
         BRL   L076B2D
L076A3B  PEI   $E9
         PEI   $E7
         LDA   $E3
         LDX   $E5
         JSL   L033477
         BVS   L076A4C
         EOR   #$8000
L076A4C  BPL   L0769E6
         PEI   $E9
         PEI   $E7
         LDA   $E3
         LDX   $E5
         JSL   L033477
         BEQ   L076A7C
         BVS   L076A61
         EOR   #$8000
L076A61  BPL   L076A7C
         PEI   $E5
         PEI   $E3
         PEI   $E9
         PEI   $E7
         LDA   $E3
         LDX   $E5
         JSL   L1512A5
         PHX
         PHA
         PEA   $0001
         JSL   L075688
L076A7C  PEA   $0000
         TDC
         CLC
         ADC   #$FEDF
         PHA
         PEA   $0000
         PEA   $0100
         JSL   L071ECE
         LDAL  L053AB7
         TAX
         LDAL  L053AB5
         PEI   $ED
         PEI   $EB
         JSL   L150F53
         PHX
         PHA
         PEA   $0000
         PEA   $0200
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDF
         PHA
         JSL   L078BF0
         LDA   $EB
         LDX   $ED
         CLC
         ADC   #$0200
         BCC   L076AC0
         INX
L076AC0  STA   $EB
         STX   $ED
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         JSL   L077342
         PLA
         STA   $DF
         PLX
         STX   $E1
         LDA   $DF
         ORA   $E1
         BNE   L076AE3
         PEA   $0096
         JSL   L07272E
L076AE3  LDY   #$0002
         LDA   [$DF],Y
         TAX
         LDA   [$DF]
         STA   $F3
         STX   $F5
         LDA   $EB
         LDX   $ED
         STA   [$F3]
         TXA
         LDY   #$0002
         STA   [$F3],Y
         PEA   $0000
         PEA   $0000
         PEA   $0001
         JSL   L074AFC
         PEA   $8000
         PEA   $0000
         JSL   L0747E1
         LDAL  L053ABF
         TAX
         LDAL  L053ABD
         INC
         BNE   L076B1F
         INX
L076B1F  STAL  L053ABD
         TXA
         STAL  L053ABF
         LDA   #$0001
         STA   $FC
L076B2D  JSL   L078CA4
L076B31  TSC
         CLC
         ADC   #$0218
         TCS
         PLD
         RTL

L076B39  PHD
         TSC
         CLC
         ADC   #$FDF6
         TCS
         ADC   #$0113
         TCD
         STZ   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
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
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FFF0
         AND   $00,X
         STA   $F1
         LDA   #$00FF
         LDX   #$FFEF
         AND   $00,X
         LDX   #$FFED
         STA   $00,X
         LDX   #$FFED
         LDA   $00,X
         SEC
         SBC   #$0002
         BVS   L076B90
         EOR   #$8000
L076B90  BPL   L076BB6
         LDA   #$0002
         STA   $EF
L076B97  LDA   $EF
         CLC
         ADC   #$FFEF
         TAX
         LDA   #$00FF
         AND   $00,X
         CMP   $F1
         BNE   L076BA9
         BRA   L076BB6
L076BA9  LDA   $EF
         LDX   #$FFED
         CMP   $00,X
         BEQ   L076BB6
         INC   $EF
         BRA   L076B97
L076BB6  LDA   $EF
         LDX   #$FFEF
         SEP   #$20
         STA   $00,X
         REP   #$20
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
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
         PEA   ^L040A71
         PEA   L040A71
         PEA   ^L040A72
         PEA   L040A72
         JSL   L073C22
         PHY
         PEA   $0046
         PEA   $0001
         PEA   $09C4
         JSL   L072032
         PLA
         CMP   #$0001
         BEQ   L076C08
         LDA   #$0000
         BRA   L076C0B
L076C08  LDA   #$0001
L076C0B  STA   $FC
         TSC
         CLC
         ADC   #$020A
         TCS
         PLD
         RTL

L076C15  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCA
         TCS
         TCD
         LDA   L05500F
         ORA   L055011
         BEQ   L076C2C
         PEA   $198F
         JSL   L07272E
L076C2C  LDA   L055013
         ORA   L055015
         BEQ   L076C37
         LDA   #$0001
L076C37  ORA   L05504D
         STA   $2F
         LDA   L05504D
         BEQ   L076C45
         JSL   L078CA4
L076C45  LDA   L055051
         BNE   L076CBB
L076C4A  LDAL  L053AE7
         SEC
         SBC   #$0032
         BEQ   L076C5B
         BVS   L076C59
         EOR   #$8000
L076C59  BMI   L076C60
L076C5B  LDA   #$0000
         BRA   L076C63
L076C60  LDA   #$0001
L076C63  PHA
         PHY
         PEA   $FFFF
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L151017
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L076C85
         JSL   L074E83
         BRA   L076C4A
L076C85  LDA   L055013
         ORA   L055015
         BEQ   L076CBB
L076C8D  PHY
         PEA   $FFFF
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L151017
         PHY
         PHY
         PEA   $0000
         JSL   L074067
         PLA
         PLX
         STX   $33
         ORA   $33
         BEQ   L076CB2
         LDA   #$0001
L076CB2  EOR   #$0001
         ORA   $01,S
         PLX
         LSR
         BCC   L076C8D
L076CBB  LDA   $2F
         BEQ   L076CD3
         LDA   L055013
         ORA   L055015
         BEQ   L076CCA
         LDA   #$0001
L076CCA  ORA   L05504D
         BNE   L076CD3
         JSL   L075602
L076CD3  TSC
         CLC
         ADC   #$0036
         TCS
         PLD
         RTL

L076CDB  ENT
         PHD
         TSC
         CLC
         ADC   #$FEE6
         TCS
         ADC   #$0029
         TCD
         STZ   $FC
         LDA   L055013
         ORA   L055015
         BEQ   L076CF7
         PEA   $7326
         JSL   L07272E
L076CF7  PEI   $FA
         PEA   $0000
         PEA   $0000
         JSL   L075E14
         PHY
         PHY
         PEI   $FA
         PEI   $F8
         PEI   $F6
         PEA   $0000
         PEA   $0600
         PEA   $0001
         JSL   L075D80
         PLA
         STA   $D7
         PLX
         STX   $D9
         LDAL  L05565D
         BEQ   L076D2E
         PEA   $0032
         JSL   L0727E0
         BRL   L076EFF
L076D2E  LDY   #$0012
         LDA   [$F6],Y
         PHA
         DEY
         DEY
         LDA   [$F6],Y
         PHA
         LDA   #$0005
         LDX   #$0000
         JSL   L033477
         BEQ   L076D56
         BVS   L076D4A
         EOR   #$8000
L076D4A  BPL   L076D56
         PEA   $0033
         JSL   L0727E0
         BRL   L076EFF
L076D56  LDY   #$0012
         LDA   [$F6],Y
         PHA
         DEY
         DEY
         LDA   [$F6],Y
         PHA
         LDA   #$0005
         LDX   #$0000
         JSL   L033477
         BVS   L076D70
         EOR   #$8000
L076D70  BMI   L076D7C
         PEA   $0034
         JSL   L0727E0
         BRL   L076EFF
L076D7C  LDA   L055049
         LDX   L05504B
         STA   $E9
         STX   $EB
         LDX   #$0000
         LDY   #$004C
         LDA   #$2000
         AND   [$F6],Y
         CMP   #$0000
         BEQ   L076D97
         INX
L076D97  TXA
         STA   $E7
         LDA   $E7
         BNE   L076DA1
         BRL   L076EAE
L076DA1  LDA   #$0018
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L076DAC
         INX
L076DAC  PHX
         PHA
         PEI   $EB
         PEI   $E9
         JSL   L077E22
         PHY
         PHY
         PEI   $F8
         PEI   $F6
         PEA   $0000
         PEA   $0180
         JSL   L071E31
         PLA
         PLX
         STX   $ED
         ORA   $ED
         BNE   L076DD1
         BRL   L076EAE
L076DD1  LDA   #$0018
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L076DDC
         INX
L076DDC  PHX
         PHA
         PEI   $EB
         PEI   $E9
         JSL   L077E22
         PHY
         JSL   L0727BF
         PLA
         STA   $E1
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $E3
         PLX
         STX   $E5
         PHY
         PHY
         PEA   $1838
         JSL   L072834
         PLA
         STA   $DD
         PLX
         STX   $DF
         PEI   $DF
         PEI   $DD
         JSL   L15102F
L076E11  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $DB
         LDX   #$0000
         LDA   $DB
         DEC
         BNE   L076E25
         INX
L076E25  PHX
         LDX   #$0000
         LDA   $DB
         DEC
         DEC
         BNE   L076E30
         INX
L076E30  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L076E11
         PEI   $DF
         PEI   $DD
         PEA   $0004
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         JSL   L071169
         PEI   $DF
         PEI   $DD
         JSL   L072634
         PEI   $E1
         JSL   L0724F7
         PEI   $E5
         PEI   $E3
         JSL   L151131
         LDA   $DB
         DEC
         BNE   L076E93
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         JSL   L0714B3
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD8
         PHA
         LDA   #$00FF
         LDX   #$FFD7
         AND   $00,X
         PHA
         JSL   L073FDF
         PLA
         STA   $E9
         PLX
         STX   $EB
         BRA   L076E99
L076E93  LDA   $DB
         DEC
         DEC
         BEQ   L076EFF
L076E99  LDA   #$0018
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L076EA4
         INX
L076EA4  PHX
         PHA
         PEI   $EB
         PEI   $E9
         JSL   L077E22
L076EAE  PHY
         PHY
         PEI   $F8
         PEI   $F6
         PEA   $0000
         PEA   $0180
         JSL   L071E31
         PLA
         PLX
         STX   $ED
         ORA   $ED
         BEQ   L076ECF
         PEA   $0037
         JSL   L0727E0
         BRA   L076EFF
L076ECF  LDA   $E7
         BEQ   L076EEB
         LDA   $E9
         LDX   $EB
         STA   L055049
         STX   L05504B
         LDA   $E9
         LDX   $EB
         LDY   #$000C
         STA   [$F6],Y
         INY
         INY
         TXA
         STA   [$F6],Y
L076EEB  LDY   #$0048
         LDA   [$F6],Y
         BNE   L076EFA
         LDA   #$0005
         LDY   #$0048
         STA   [$F6],Y
L076EFA  LDA   #$0001
         STA   $FC
L076EFF  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0122
         TCS
         RTL

L076F11  PHD
         TSC
         CLC
         ADC   #$FFDC
         TCS
         TCD
         PEI   $2C
         PEI   $2A
         PEA   $0000
         PEA   $0020
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0001
         JSL   L077D97
         LDA   $09
         LDX   $0B
         STA   $2E
         STX   $30
         LDA   $28
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

L076F4D  PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         STZ   $26
         LDA   L055051
         BEQ   L076F5F
         BRL   L07703C
L076F5F  PHY
         PHY
         PEI   $24
         PEI   $22
         JSL   L0742B3
         PLA
         STA   $03
         PLX
         STX   $05
         PEI   $05
         PEI   $03
         LDA   #$0000
         TAX
         JSL   L033477
         BEQ   L076F7F
         BPL   L076F82
L076F7F  BRL   L07703C
L076F82  PHY
         PHY
         PEI   $24
         PEI   $22
         PEI   $20
         PEI   $1E
         PEA   $0000
         JSL   L077624
         PLA
         STA   $0F
         PLX
         STX   $11
         LDA   $0F
         ORA   $11
         BNE   L076FA2
         BRL   L07703C
L076FA2  LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         STA   $13
         STX   $15
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         STA   $0B
         STX   $0D
         PHY
         PHY
         PEI   $0D
         PEI   $0B
         PEI   $1C
         JSL   L0743E8
         PLA
         STA   $07
         PLX
         STX   $09
         LDA   $07
         ORA   $09
         BEQ   L07702D
         PHY
         PEI   $11
         PEI   $0F
         JSL   L0718FA
         PLA
         STA   $01
         PEI   $09
         PEI   $07
         PEI   $0D
         PEI   $0B
         LDY   #$0002
         LDA   [$0F],Y
         PHA
         LDA   [$0F]
         PHA
         JSL   L078BF0
         PEI   $11
         PEI   $0F
         PEI   $01
         JSL   L0718DA
         PHY
         PHY
         PEI   $24
         PEI   $22
         JSL   L0742B3
         PLA
         STA   $03
         PLX
         STX   $05
         PEI   $24
         PEI   $22
         PEI   $09
         PEI   $07
         JSL   L078A77
         PEI   $05
         PEI   $03
         PEI   $0D
         PEI   $0B
         PEA   $0001
         JSL   L075688
         LDA   #$0001
         STA   $26
L07702D  PEI   $24
         PEI   $22
         PEI   $20
         PEI   $1E
         PEA   $0000
         JSL   L074B81
L07703C  LDA   $1A
         STA   $24
         LDA   $19
         STA   $23
         LDA   $17
         TCD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L07704E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PHY
         PEA   $FFFF
         PEA   $FFE0
         LDA   $0A
         LDX   $0C
         CLC
         ADC   #$001F
         BCC   L077069
         INX
L077069  PHX
         PHA
         JSL   L15017E
         PLA
         STA   $0E
         PLX
         STX   $10
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

L077086  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $12
         ORA   $14
         BEQ   L077109
         LDA   [$12]
         LDY   #$0002
         ORA   [$12],Y
         BEQ   L077109
         PHY
         PHY
         PEI   $14
         PEI   $12
         JSL   L151301
         LDA   #$0002
         LDX   #$0000
         JSL   L033477
         BEQ   L077109
         BVS   L0770B8
         EOR   #$8000
L0770B8  BPL   L077109
         LDY   #$0002
         LDA   [$12],Y
         TAX
         LDA   [$12]
         STA   $09
         STX   $0B
         LDA   [$09]
         SEC
         SBC   #$0000
         BMI   L077109
         BEQ   L077109
         PEI   $14
         PEI   $12
         JSL   L0718BF
         LDA   #$0002
         STA   $01
         LDA   $16
         STA   $03
         LDY   #$0002
         LDA   [$12],Y
         TAX
         LDA   [$12]
         STA   $05
         STX   $07
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2009
         JSL   GSOS2
         STAL  L05565D
         PEI   $14
         PEI   $12
         JSL   L07191C
L077109  LDA   $10
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

L07711B  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDY   #$0002
         LDA   [$0E],Y
         TAX
         LDA   [$0E]
         CLC
         ADC   #$0004
         BCC   L077132
         INX
L077132  STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $01
         STX   $03
         LDA   #$4D42
         LDX   #$5041
         CMP   $01
         BNE   L07714E
         CPX   $03
L07714E  BEQ   L077155
         LDA   #$0000
         BRA   L077158
L077155  LDA   #$0001
L077158  PHA
         LDA   #$4143
         LDX   #$4452
         CMP   $01
         BNE   L077165
         CPX   $03
L077165  BEQ   L07716C
         LDA   #$0000
         BRA   L07716F
L07716C  LDA   #$0001
L07716F  ORA   $01,S
         PLX
         PHA
         LDA   #$4B42
         LDX   #$4447
         CMP   $01
         BNE   L07717F
         CPX   $03
L07717F  BEQ   L077186
         LDA   #$0000
         BRA   L077189
L077186  LDA   #$0001
L077189  ORA   $01,S
         PLX
         PHA
         LDA   #$5250
         LDX   #$544E
         CMP   $01
         BNE   L077199
         CPX   $03
L077199  BEQ   L0771A0
         LDA   #$0000
         BRA   L0771A3
L0771A0  LDA   #$0001
L0771A3  ORA   $01,S
         PLX
         LSR
         BCC   L0771B6
         PEA   $0002
         PEI   $10
         PEI   $0E
         JSL   L150D44
         BRA   L0771C1
L0771B6  PEA   $0001
         PEI   $10
         PEI   $0E
         JSL   L150D44
L0771C1  LDA   $0C
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

L0771D3  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   $12
         PHY
         PHY
         PEI   $10
         PEI   $0E
         JSL   L0741B8
         PLA
         STA   $01
         PLX
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BEQ   L077208
         LDY   #$000A
         LDA   [$01],Y
         PHA
         LDX   #$0000
         PLA
         BPL   L077205
         INX
L077205  TXA
         STA   $12
L077208  LDA   $0C
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

L07721A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FE1
         LDX   L054FE3
         STA   L054FC9
         STX   L054FCB
         PHY
         PHY
         PEI   $0C
         PEI   $0A
         PEA   $4447
         PEA   $4B42
         PEA   $0000
         JSL   L077624
         PLA
         STA   $0E
         PLX
         STX   $10
         LDA   L054FC9
         LDX   L054FCB
         STA   L054FE1
         STX   L054FE3
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

L077264  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FDD
         LDX   L054FDF
         STA   L054FC9
         STX   L054FCB
         PHY
         PHY
         PEI   $0E
         PEI   $0C
         PEA   $5041
         PEA   $4D42
         PEI   $0A
         JSL   L077624
         PLA
         STA   $10
         PLX
         STX   $12
         LDA   L054FC9
         LDX   L054FCB
         STA   L054FDD
         STX   L054FDF
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

L0772AE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FD9
         LDX   L054FDB
         STA   L054FC9
         STX   L054FCB
         PHY
         PHY
         PEI   $0C
         PEI   $0A
         PEA   $4452
         PEA   $4143
         PEA   $0000
         JSL   L077624
         PLA
         STA   $0E
         PLX
         STX   $10
         LDA   L054FC9
         LDX   L054FCB
         STA   L054FD9
         STX   L054FDB
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

L0772F8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FD5
         LDX   L054FD7
         STA   L054FC9
         STX   L054FCB
         PHY
         PHY
         PEI   $0C
         PEI   $0A
         PEA   $5453
         PEA   $494C
         PEA   $0000
         JSL   L077624
         PLA
         STA   $0E
         PLX
         STX   $10
         LDA   L054FC9
         LDX   L054FCB
         STA   L054FD5
         STX   L054FD7
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

L077342  PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         LDX   #$0000
         LDA   $24
         BPL   L077352
         INX
L077352  TXA
         PHA
         PEI   $24
         PEI   $22
         LDAL  L053ABF
         TAX
         LDAL  L053ABD
         JSL   L033477
         BEQ   L07736E
         BVS   L07736C
         EOR   #$8000
L07736C  BMI   L077373
L07736E  LDA   #$0000
         BRA   L077376
L077373  LDA   #$0001
L077376  ORA   $01,S
         PLX
         LSR
         BCC   L077383
         PEA   $0467
         JSL   L07272E
L077383  PHY
         PHY
         PEA   $8000
         PEA   $0000
         PEI   $24
         PEI   $22
         JSL   L150241
         PLA
         STA   $11
         PLX
         STX   $13
         LDA   L054FD1
         LDX   L054FD3
         STA   L054FC9
         STX   L054FCB
         PHY
         PHY
         PEI   $13
         PEI   $11
         JSL   L0741B8
         PLA
         STA   $15
         PLX
         STX   $17
         LDA   $15
         LDX   $17
         STA   L054FD1
         STX   L054FD3
         LDY   #$0002
         LDA   [$15],Y
         INY
         INY
         ORA   [$15],Y
         BNE   L0773CD
         BRL   L077505
L0773CD  LDA   $15
         LDX   $17
         STA   $05
         STX   $07
         LDY   #$0006
         LDA   [$05],Y
         INY
         INY
         ORA   [$05],Y
         BNE   L0773E7
         PEA   $0CC9
         JSL   L07272E
L0773E7  LDY   #$0008
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $19
         STX   $1B
         LDA   [$19]
         LDY   #$0002
         ORA   [$19],Y
         BEQ   L077401
         BRL   L0774A7
L077401  LDY   #$000C
         LDA   [$05],Y
         BEQ   L07740F
         PEA   $0F24
         JSL   L07272E
L07740F  PEA   $0000
         PEA   $0200
         LDA   L055017
         PHA
         PEA   $0010
         PEA   $0000
         PEA   $0000
         LDY   #$0008
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         JSL   L151406
         LDAL  L05565D
         BEQ   L07743E
         PEA   $0F75
         JSL   L07272E
L07743E  LDAL  L053AB7
         PHA
         LDAL  L053AB5
         PHA
         LDA   $22
         LDX   $24
         PEA   $0000
         PEA   $0200
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $0D
         STX   $0F
         LDY   #$0008
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         JSL   L0718BF
         PEI   $0F
         PEI   $0D
         PEA   $0000
         PEA   $0200
         LDY   #$0008
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         PHX
         PHA
         PEA   $0000
         JSL   L077D97
         LDY   #$0008
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         JSL   L07191C
L0774A7  LDY   #$000C
         LDA   [$05],Y
         BNE   L0774D0
         LDA   L05500F
         LDX   L055011
         INC
         BNE   L0774B8
         INX
L0774B8  STA   L05500F
         STX   L055011
         PEA   $0000
         LDY   #$0008
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         JSL   L150D44
L0774D0  LDY   #$000C
         LDA   [$05],Y
         INC
         LDY   #$000C
         STA   [$05],Y
         LDY   #$000C
         LDA   [$05],Y
         SEC
         SBC   #$0010
         BEQ   L0774F4
         BVS   L0774EB
         EOR   #$8000
L0774EB  BPL   L0774F4
         PEA   $04D0
         JSL   L07272E
L0774F4  LDY   #$0008
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $26
         STX   $28
         BRL   L077612
L077505  LDAL  L053AB7
         PHA
         LDAL  L053AB5
         PHA
         LDA   $22
         LDX   $24
         PEA   $0000
         PEA   $0200
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $0D
         STX   $0F
         PHY
         PHY
         PEA   $0000
         PEA   $0200
         LDA   L055017
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $09
         PLX
         STX   $0B
         LDAL  L05565D
         BEQ   L077581
         LDA   L055003
         BNE   L077555
         JSL   L151373
L077555  PHY
         PHY
         PEA   $0000
         PEA   $0200
         LDA   L055017
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $09
         PLX
         STX   $0B
         LDAL  L05565D
         BEQ   L077581
         PEA   $2D17
         JSL   L07272E
L077581  PEI   $0F
         PEI   $0D
         PEA   $0000
         PEA   $0200
         LDY   #$0002
         LDA   [$09],Y
         PHA
         LDA   [$09]
         PHA
         PEA   $0000
         JSL   L077D97
         PEI   $0B
         PEI   $09
         JSL   L07191C
         LDA   $15
         LDX   $17
         STA   $01
         STX   $03
         LDA   $01
         LDX   $03
         STA   $19
         STX   $1B
         PEI   $0F
         PEI   $0D
         PEA   $0000
         PEA   $0100
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   [$19]
         LDA   $11
         LDX   $13
         LDY   #$0002
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   $09
         LDX   $0B
         LDY   #$0006
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0001
         LDY   #$000C
         STA   [$01],Y
         LDA   L054FC1
         LDY   #$000A
         STA   [$01],Y
         LDA   L05500D
         INC
         STA   L05500D
         LDA   L05500F
         LDX   L055011
         INC
         BNE   L077604
         INX
L077604  STA   L05500F
         STX   L055011
         LDA   $09
         LDX   $0B
         STA   $26
         STX   $28
L077612  LDA   $20
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

L077624  ENT
         PHD
         TSC
         CLC
         ADC   #$FFB4
         TCS
         TCD
         STZ   $5C
         STZ   $5E
         PHY
         PHY
         PEI   $5A
         PEI   $58
         JSL   L0741B8
         PLA
         STA   $3D
         PLX
         STX   $3F
         LDA   L054FC9
         LDX   L054FCB
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$3D],Y
         INY
         INY
         ORA   [$3D],Y
         BNE   L077684
         LDA   #$FFFF
         TAX
         LDY   #$0002
         STA   [$3D],Y
         INY
         INY
         TXA
         STA   [$3D],Y
         PHY
         PHY
         PEI   $5A
         PEI   $58
         JSL   L0742B3
         PLA
         STA   $39
         PLX
         STX   $3B
         LDA   #$0000
         TAX
         LDY   #$0002
         STA   [$3D],Y
         INY
         INY
         TXA
         STA   [$3D],Y
         BRL   L07778E
L077684  LDA   $3D
         LDX   $3F
         STA   $05
         STX   $07
         LDY   #$0006
         LDA   [$05],Y
         INY
         INY
         ORA   [$05],Y
         BNE   L07769E
         PEA   $04CF
         JSL   L07272E
L07769E  LDY   #$0008
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $49
         STX   $4B
         LDA   [$49]
         LDY   #$0002
         ORA   [$49],Y
         BNE   L0776DA
         PEA   $0000
         LDY   #$0008
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         JSL   L150D44
         PHY
         PHY
         PEI   $5A
         PEI   $58
         JSL   L0742B3
         PLA
         STA   $39
         PLX
         STX   $3B
         BRL   L07778E
L0776DA  LDY   #$0008
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $49
         STX   $4B
         LDY   #$0002
         LDA   [$49],Y
         TAX
         LDA   [$49]
         CLC
         ADC   #$0004
         BCC   L0776F7
         INX
L0776F7  STA   $49
         STX   $4B
         LDA   $54
         LDX   $56
         CMP   [$49]
         BNE   L077709
         LDY   #$0002
         TXA
         CMP   [$49],Y
L077709  BEQ   L077710
         LDA   #$0000
         BRA   L077713
L077710  LDA   #$0001
L077713  PHA
         LDA   #$4957
         LDX   #$444C
         CMP   $54
         BNE   L077720
         CPX   $56
L077720  BEQ   L077727
         LDA   #$0000
         BRA   L07772A
L077727  LDA   #$0001
L07772A  ORA   $01,S
         PLX
         LSR
         BCC   L07778B
         LDY   #$000C
         LDA   [$05],Y
         BNE   L077759
         LDA   L05500F
         LDX   L055011
         INC
         BNE   L077741
         INX
L077741  STA   L05500F
         STX   L055011
         PEA   $0000
         LDY   #$0008
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         JSL   L150D44
L077759  LDY   #$000C
         LDA   [$05],Y
         INC
         LDY   #$000C
         STA   [$05],Y
         LDY   #$000C
         LDA   [$05],Y
         SEC
         SBC   #$0010
         BEQ   L07777D
         BVS   L077774
         EOR   #$8000
L077774  BPL   L07777D
         PEA   $04D1
         JSL   L07272E
L07777D  LDY   #$0008
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $5C
         STX   $5E
L07778B  BRL   L0779CF
L07778E  PEI   $3B
         PEI   $39
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L07779F
         BRL   L0779CF
L07779F  BNE   L0777A4
         BRL   L0779CF
L0777A4  PEI   $3B
         PEI   $39
         PEA   $0000
         PEA   $0020
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   $0001
         JSL   L077D97
         LDA   $0D
         LDX   $0F
         STA   $35
         STX   $37
         PEI   $37
         PEI   $35
         PEI   $5A
         PEI   $58
         PEA   $0000
         PEA   $154E
         JSL   L074691
         PEI   $5A
         PEI   $58
         PEI   $56
         PEI   $54
         PEI   $13
         PEI   $11
         PEA   $0000
         PEA   $13F8
         JSL   L074716
         LDA   $15
         LDX   $17
         CMP   $58
         BNE   L0777F8
         CPX   $5A
L0777F8  BEQ   L077801
         PEA   $154F
         JSL   L07272E
L077801  LDA   L055013
         LDX   L055015
         PHX
         PHA
         LDA   #$0010
         LDX   #$0000
         JSL   L033477
         BEQ   L077823
         BVS   L07781A
         EOR   #$8000
L07781A  BPL   L077823
         PEA   $0000
         JSL   L07479E
L077823  LDY   #$0004
         LDA   [$3D],Y
         TAX
         DEY
         DEY
         LDA   [$3D],Y
         CMP   $58
         BNE   L077833
         CPX   $5A
L077833  BNE   L07788F
         LDY   #$0008
         LDA   [$3D],Y
         TAX
         DEY
         DEY
         LDA   [$3D],Y
         STA   $2D
         STX   $2F
         PEI   $37
         PEI   $35
         LDA   L055017
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $2F
         PEI   $2D
         JSL   L151406
         LDAL  L05565D
         BEQ   L07788D
         LDA   L055003
         BNE   L07786B
         JSL   L151373
L07786B  PEI   $37

*

         PEI   $35
         LDA   L055017
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $2F
         PEI   $2D
         JSL   L151406
         LDAL  L05565D
         BEQ   L07788D
         BRL   L0779CF
L07788D  BRA   L0778E8
L07788F  PHY
         PHY
         PEI   $37
         PEI   $35
         LDA   L055017
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $2D
         PLX
         STX   $2F
         LDAL  L05565D
         BEQ   L0778E1
         LDA   L055003
         BNE   L0778BB
         JSL   L151373
L0778BB  PHY
         PHY
         PEI   $37
         PEI   $35
         LDA   L055017
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $2D
         PLX
         STX   $2F
         LDAL  L05565D
         BEQ   L0778E1
         BRL   L0779CF
L0778E1  LDA   L05500D
         INC
         STA   L05500D
L0778E8  LDA   #$5246
         LDX   #$4545
         CMP   $11
         BNE   L0778F4
         CPX   $13
L0778F4  BEQ   L0778FB
         LDA   #$0000
         BRA   L0778FE
L0778FB  LDA   #$0001
L0778FE  ORA   $52
         BEQ   L07790C
         LDA   #$0020
         LDX   #$0000
         STA   $35
         STX   $37
L07790C  PEI   $37
         PEI   $35
         LDA   #$0020
         LDX   #$0000
         JSL   L033477
         BEQ   L077923
         BVS   L077921
         EOR   #$8000
L077921  BMI   L07793F
L077923  TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$2D],Y
         PHA
         LDA   [$2D]
         PHA
         PEI   $37
         PEI   $35
         JSL   L1511CE
         BRA   L077967
L07793F  PEI   $2F
         PEI   $2D
         JSL   L0718BF
         PEI   $3B
         PEI   $39
         PEI   $37
         PEI   $35
         LDY   #$0002
         LDA   [$2D],Y
         PHA
         LDA   [$2D]
         PHA
         PEA   $0000
         JSL   L077D97
         PEI   $2F
         PEI   $2D
         JSL   L07191C
L077967  LDA   $3D
         LDX   $3F
         STA   $01
         STX   $03
         LDA   $01
         LDX   $03
         STA   $49
         STX   $4B
         PEI   $3B
         PEI   $39
         PEA   $0000
         PEA   $0100
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   [$49]
         LDA   $58
         LDX   $5A
         LDY   #$0002
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   $2D
         LDX   $2F
         LDY   #$0006
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0001
         LDY   #$000C
         STA   [$01],Y
         LDA   L054FC1
         LDY   #$000A
         STA   [$01],Y
         LDA   L05500F
         LDX   L055011
         INC
         BNE   L0779C1
         INX
L0779C1  STA   L05500F
         STX   L055011
         LDA   $2D
         LDX   $2F
         STA   $5C
         STX   $5E
L0779CF  LDA   L05500D
         SEC
         SBC   L055009
         BEQ   L0779E5
         BVS   L0779DD
         EOR   #$8000
L0779DD  BPL   L0779E5
         JSL   L077BA7
         BRA   L0779CF
L0779E5  LDA   $09
         LDX   $0B
         STA   L054FC9
         STX   L054FCB
         LDA   $50
         STA   $5A
         LDA   $4F
         STA   $59
         LDA   $4D
         TCD
         TSC
         CLC
         ADC   #$0058
         TCS
         RTL

L077A01  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FCD
         LDX   L054FCF
         STA   L054FC9
         STX   L054FCB
         PHY
         PHY
         PEI   $0C
         PEI   $0A
         PEA   $4547
         PEA   $4150
         PEA   $0000
         JSL   L077624
         PLA
         STA   $0E
         PLX
         STX   $10
         LDA   L054FC9
         LDX   L054FCB
         STA   L054FCD
         STX   L054FCF
         LDA   $0A
         ORA   $0C
         BEQ   L077A4A
         LDA   $0A
         LDX   $0C
         STA   L055005
         STX   L055007
L077A4A  LDA   $08
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

L077A5B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FC5
         LDX   L054FC7
         STA   L054FC9
         STX   L054FCB
         PHY
         PHY
         PEI   $0C
         PEI   $0A
         PEA   $444C
         PEA   $4957
         PEA   $0000
         JSL   L077624
         PLA
         STA   $0E
         PLX
         STX   $10
         LDA   L054FC9
         LDX   L054FCB
         STA   L054FC5
         STX   L054FC7
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

L077AA5  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PEA   $0000
         JSL   L07479E
         LDA   L054FED
         LDX   L054FEF
         STA   $01
         STX   $03
L077ABE  LDY   #$0002
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BEQ   L077AF9
         LDY   #$000C
         LDA   [$01],Y
         BNE   L077AF9
         LDY   #$000A
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BPL   L077AE2
         PEA   $04B0
         JSL   L07272E
L077AE2  PEI   $03
         PEI   $01
         JSL   L0753D0
         LDA   $01
         LDX   $03
         SEC
         SBC   #$000E
         BCS   L077AF5
         DEX
L077AF5  STA   $01
         STX   $03
L077AF9  LDA   $01
         LDX   $03
         CLC
         ADC   #$000E
         BCC   L077B04
         INX
L077B04  STA   $01
         STX   $03
         LDA   L054FF1
         LDX   L054FF3
         CMP   $01
         BNE   L077B14
         CPX   $03
L077B14  BNE   L077ABE
         LDA   L054FED
         LDX   L054FEF
         STA   L054FE9
         STX   L054FEB
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L077B28  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $12
         ORA   $14
         BNE   L077B38
         BRA   L077B95
L077B38  PHY
         PHY
         PEI   $14
         PEI   $12
         JSL   L0741B8
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         LDX   $07
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L077B5D
         BRA   L077B95
L077B5D  LDY   #$000C
         LDA   [$01],Y
         BEQ   L077B6B
         PEA   $0492
         JSL   L07272E
L077B6B  LDY   #$000A
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BPL   L077B7E
         PEI   $07
         PEI   $05
         JSL   L07481E
L077B7E  LDA   L055051
         BNE   L077B8B
         PEI   $07
         PEI   $05
         JSL   L0753D0
L077B8B  LDA   $05
         LDX   $07
         STA   L054FE9
         STX   L054FEB
L077B95  LDA   $10
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

L077BA7  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L054FE9
         LDX   L054FEB
         STA   $01
         STX   $03
L077BB9  LDY   #$0002
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BEQ   L077C22
         LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $05
         STX   $07
         LDA   [$05]
         LDY   #$0002
         ORA   [$05],Y
         BNE   L077C22
         LDY   #$0006
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BNE   L077BED
         PEA   $1115
         JSL   L07272E
L077BED  LDY   #$000C
         LDA   [$01],Y
         BEQ   L077BFB
         PEA   $094A
         JSL   L07272E
L077BFB  LDY   #$000A
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BPL   L077C0D
         PEA   $094B
         JSL   L07272E
L077C0D  PEI   $03
         PEI   $01
         JSL   L0753D0
         LDA   $01
         LDX   $03
         STA   L054FE9
         STX   L054FEB
         BRL   L077CE6
L077C22  LDA   $01
         LDX   $03
         CLC
         ADC   #$000E
         BCC   L077C2D
         INX
L077C2D  STA   $01
         STX   $03
         LDA   L054FF1
         LDX   L054FF3
         CMP   $01
         BNE   L077C3D
         CPX   $03
L077C3D  BNE   L077C49
         LDA   L054FED
         LDX   L054FEF
         STA   $01
         STX   $03
L077C49  LDA   L054FE9
         LDX   L054FEB
         CMP   $01
         BNE   L077C55
         CPX   $03
L077C55  BEQ   L077C5A
         BRL   L077BB9
L077C5A  LDA   L054FE9
         LDX   L054FEB
         STA   $01
         STX   $03
L077C64  LDY   #$0002
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BEQ   L077C95
         LDY   #$000A
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BMI   L077C95
         LDY   #$000C
         LDA   [$01],Y
         BNE   L077C95
         PEI   $03
         PEI   $01
         JSL   L0753D0
         LDA   $01
         LDX   $03
         STA   L054FE9
         STX   L054FEB
         BRA   L077CE6
L077C95  LDA   $01
         LDX   $03
         CLC
         ADC   #$000E
         BCC   L077CA0
         INX
L077CA0  STA   $01
         STX   $03
         LDA   L054FF1
         LDX   L054FF3
         CMP   $01
         BNE   L077CB0
         CPX   $03
L077CB0  BNE   L077CBC
         LDA   L054FED
         LDX   L054FEF
         STA   $01
         STX   $03
L077CBC  LDA   L054FE9
         LDX   L054FEB
         CMP   $01
         BNE   L077CC8
         CPX   $03
L077CC8  BNE   L077C64
         LDA   L055013
         ORA   L055015
         BEQ   L077CE6
         PHY
         PHY
         PEA   $0000
         JSL   L074067
         PLA
         PLX
         STX   $05
         ORA   $05
         BEQ   L077CE6
         BRL   L077C5A
L077CE6  PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L077CEC  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $0E
         DEC
         PEA   $000C
         JSL   L150BEE
         PLX
         LDAL  L0539EB,X
         PHA
         LDAL  L0539E9,X
         PHA
         PEA   $0001
         JSL   L0B883D
         LDA   L054FED
         LDX   L054FEF
         STA   $01
         STX   $03
L077D1A  LDY   #$0002
         LDA   [$01],Y
         INY
         INY
         ORA   [$01],Y
         BEQ   L077D68
         LDY   #$000A
         LDA   [$01],Y
         AND   #$000F
         CMP   $0E
         BNE   L077D68
         LDY   #$000C
         LDA   [$01],Y
         BEQ   L077D3F
         PEA   $A8F9
         JSL   L07272E
L077D3F  LDY   #$000A
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BPL   L077D51
         PEA   $04B0
         JSL   L07272E
L077D51  PEI   $03
         PEI   $01
         JSL   L0753D0
         LDA   $01
         LDX   $03
         SEC
         SBC   #$000E
         BCS   L077D64
         DEX
L077D64  STA   $01
         STX   $03
L077D68  LDA   $01
         LDX   $03
         CLC
         ADC   #$000E
         BCC   L077D73
         INX
L077D73  STA   $01
         STX   $03
         LDA   L054FF1
         LDX   L054FF3
         CMP   $01
         BNE   L077D83
         CPX   $03
L077D83  BNE   L077D1A
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

L077D97  ENT
         PHD
         TSC
         CLC
         ADC   #$FEE4
         TCS
         ADC   #$0033
         TCD
         LDA   L055047
         PHA
         PEI   $FA
         PEI   $F8
         JSL   L075E14
         PHY
         PHY
         LDA   L055047
         PHA
         PEI   $F2
         PEI   $F0
         PEI   $F6
         PEI   $F4
         PEI   $EE
         JSL   L075D80
         PLA
         STA   $E1
         PLX
         STX   $E3
         LDAL  L05565D
         BEQ   L077E10
         PEA   $0000
         TDC
         CLC
         ADC   #$00CD
         PHA
         LDAL  L05565D
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCD
         PHA
         PEA   $0026
         JSL   L072809
         PEA   ^L040A75
         PEA   L040A75
         PEA   ^L040A76
         PEA   L040A76
         JSL   L073C22
         PEA   $0025
         JSL   L0727E0
         JSL   L070000
L077E10  LDA   $EC
         STA   $FA
         LDA   $EB
         STA   $F9
         LDA   $E9
         TCD
         TSC
         CLC
         ADC   #$012C
         TCS
         RTL

L077E22  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         PEI   $18
         PEI   $16
         JSL   L151460
         LDA   $1A
         LDX   $1C
         STA   $01
         STX   $03
         LDA   #$0001
         STA   $05
L077E3F  PHY
         JSL   L150705
         PLA
         STA   $07
         LDA   #$000A
         CMP   $05
         BEQ   L077E52
         INC   $05
         BRA   L077E3F
L077E52  LDA   #$0001
         STA   $05
L077E57  PHY
         JSL   L150705
         PLA
         STA   $07
         PEI   $03
         PEI   $01
         LDA   $01
         LDX   $03
         STA   $0D
         STX   $0F
         PHY
         JSL   L150705
         PLA
         EOR   [$0D]
         PLX
         STX   $0D
         PLX
         STX   $0F
         STA   [$0D]
         LDA   $01
         LDX   $03
         CLC
         ADC   #$0002
         BCC   L077E86
         INX
L077E86  STA   $01
         STX   $03
         LDA   #$0014
         CMP   $05
         BEQ   L077E95
         INC   $05
         BRA   L077E57
L077E95  PEI   $0B
         PEI   $09
         JSL   L151460
         LDA   $14
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

L077EAF  ENT
         PHD
         TSC
         CLC
         ADC   #$FFDE
         TCS
         TCD
         STZ   $34
         PHY
         PHY
         PEI   $32
         PEI   $30
         PEI   $2E
         PEI   $2C
         PEA   $0000
         JSL   L077624
         PLA
         STA   $1B
         PLX
         STX   $1D
         LDA   $1B
         ORA   $1D
         BNE   L077ED9
         BRL   L0781BD
L077ED9  PHY
         PHY
         PEI   $2A
         PEI   $28
         JSL   L07704E
         PLA
         STA   $28
         PLX
         STX   $2A
         LDY   #$0002
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
         PEI   $2A
         PEI   $28
         LDA   $0F
         LDX   $11
         JSL   L1512A5
         STA   $0B
         STX   $0D
         LDA   $0B
         ORA   $0D
         BNE   L077F1A
         BRL   L0781A9
L077F1A  LDA   L055051
         BEQ   L077F4E
         PHY
         PEI   $1D
         PEI   $1B
         PEI   $2A
         PEI   $28
         JSL   L078A05
         PLA
         LSR
         BCS   L077F33
         BRL   L0781AE
L077F33  LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         STA   $1F
         STX   $21
         LDA   $28
         LDX   $2A
         STA   [$1F]
         TXA
         LDY   #$0002
         STA   [$1F],Y
         BRL   L0781A9
L077F4E  PHY
         PHY
         PEI   $32
         PEI   $30
         JSL   L0742B3
         PLA
         STA   $17
         PLX
         STX   $19
         PEI   $19
         PEI   $17
         LDA   #$0000
         TAX
         JSL   L033477
         BEQ   L077F6E
         BPL   L077F75
L077F6E  PEA   $072F
         JSL   L07272E
L077F75  PEI   $0D
         PEI   $0B
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L077FF4
         PEI   $2A
         PEI   $28
         PEI   $1D
         PEI   $1B
         JSL   L1512FB
         LDAL  L05565D
         BEQ   L077F98
         BRL   L0781AE
L077F98  LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         STA   $1F
         STX   $21
         LDA   $28
         LDX   $2A
         STA   [$1F]
         TXA
         LDY   #$0002
         STA   [$1F],Y
         PEI   $19
         PEI   $17
         PEA   $0000
         PEA   $0004
         TDC
         CLC
         ADC   #$0028
         PEA   $0000
         PHA
         JSL   L078BF0
         LDA   $17
         LDX   $19
         PEI   $2A
         PEI   $28
         JSL   L150F53
         PHX
         PHA
         PEI   $0D
         PEI   $0B
         LDA   $03,S
         EOR   #$FFFF
         TAX
         PLA
         EOR   #$FFFF
         PLY
         INC
         BNE   L077FE8
         INX
L077FE8  PHX
         PHA
         PEA   $0001
         JSL   L075688
         BRL   L0781A9
L077FF4  PEI   $0D
         PEI   $0B
         LDAL  L053AD7
         TAX
         LDAL  L053AD5
         JSL   L033477
         BEQ   L07801E
         BVS   L07800C
         EOR   #$8000
L07800C  BPL   L07801E
         PHY
         PEI   $0D
         PEI   $0B
         JSL   L076535
         PLA
         LSR
         BCS   L07801E
         BRL   L0781AE
L07801E  PHY
         PHY
         PEI   $32
         PEI   $30
         JSL   L0742B3
         PLA
         STA   $17
         PLX
         STX   $19
         PHY
         PHY
         LDA   $17
         LDX   $19
         PEI   $11
         PEI   $0F
         JSL   L150F53
         PHX
         PHA
         JSL   L075577
         PLA
         STA   $03
         PLX
         STX   $05
         LDA   $03
         ORA   $05
         BNE   L078051
         BRL   L07810C
L078051  LDY   #$0006
         LDA   [$03],Y
         PHA
         DEY
         DEY
         LDA   [$03],Y
         PHA
         LDA   $0B
         LDX   $0D
         JSL   L033477
         BVS   L078069
         EOR   #$8000
L078069  BMI   L07806E
         BRL   L07810C
L07806E  LDY   #$0006
         LDA   [$03],Y
         PHA
         DEY
         DEY
         LDA   [$03],Y
         PHA
         LDA   $0B
         LDX   $0D
         JSL   L1512A5
         STA   $07
         STX   $09
         PEI   $05
         PEI   $03
         JSL   L0750FF
         PEI   $09
         PEI   $07
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L0780B6
         BEQ   L0780B6
         LDA   $17
         LDX   $19
         PEI   $2A
         PEI   $28
         JSL   L150F53
         PHX
         PHA
         PEI   $09
         PEI   $07
         PEA   $0001
         JSL   L075688
L0780B6  PHY
         PEI   $1D
         PEI   $1B
         PEI   $2A
         PEI   $28
         JSL   L078A05
         PLA
         LSR
         BCS   L0780CA
         BRL   L0781AE
L0780CA  LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         STA   $1F
         STX   $21
         LDA   $28
         LDX   $2A
         STA   [$1F]
         TXA
         LDY   #$0002
         STA   [$1F],Y
         PHY
         PHY
         PEI   $32
         PEI   $30
         JSL   L0742B3
         PLA
         STA   $17
         PLX
         STX   $19
         PEI   $19
         PEI   $17
         PEA   $0000
         PEA   $0004
         TDC
         CLC
         ADC   #$0028
         PEA   $0000
         PHA
         JSL   L078BF0
         BRL   L0781A9
L07810C  PHY
         PHY
         PEI   $2A
         PEI   $28
         PEA   $0000
         JSL   L0743E8
         PLA
         STA   $13
         PLX
         STX   $15
         LDA   $13
         ORA   $15
         BNE   L078128
         BRL   L0781AE
L078128  PHY
         PEI   $1D
         PEI   $1B
         PEI   $2A
         PEI   $28
         JSL   L078A05
         PLA
         LSR
         BCS   L07813B
         BRA   L0781AE
L07813B  LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         STA   $1F
         STX   $21
         LDA   $28
         LDX   $2A
         STA   [$1F]
         TXA
         LDY   #$0002
         STA   [$1F],Y
         PHY
         PEI   $1D
         PEI   $1B
         JSL   L0718FA
         PLA
         STA   $01
         PEI   $15
         PEI   $13
         PEI   $11
         PEI   $0F
         LDY   #$0002
         LDA   [$1B],Y
         PHA
         LDA   [$1B]
         PHA
         JSL   L078BF0
         PEI   $1D
         PEI   $1B
         PEI   $01
         JSL   L0718DA
         PHY
         PHY
         PEI   $32
         PEI   $30
         JSL   L0742B3
         PLA
         STA   $17
         PLX
         STX   $19
         PEI   $32
         PEI   $30
         PEI   $15
         PEI   $13
         JSL   L078A77
         PEI   $19
         PEI   $17
         PEI   $11
         PEI   $0F
         PEA   $0001
         JSL   L075688
L0781A9  LDA   #$0001
         STA   $34
L0781AE  PEI   $32
         PEI   $30
         PEI   $2E
         PEI   $2C
         PEA   $0000
         JSL   L074B81
L0781BD  LDA   $26
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

L0781CF  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         LDA   #$0001
         STA   $07
         LDA   #$FFFF
         LDX   #$7FFF
         STA   $09
         STX   $0B
         LDA   #L0539E9
         LDX   #^L0539E9
         STA   $0D
         STX   $0F
         LDA   #$0001
         STA   $05
L0781F5  LDA   L055039
         LDX   L05503B
         CMP   [$0D]
         BNE   L078205
         LDY   #$0002
         TXA
         CMP   [$0D],Y
L078205  BNE   L078221
         LDY   #$000A
         LDA   [$0D],Y
         TAX
         DEY
         DEY
         LDA   [$0D],Y
         CMP   $1A
         BNE   L078217
         CPX   $1C
L078217  BEQ   L07821F
         PEI   $05
         JSL   L077CEC
L07821F  BRA   L078286
L078221  LDY   #$0006
         LDA   [$0D],Y
         PHA
         DEY
         DEY
         LDA   [$0D],Y
         PHA
         LDA   $09
         LDX   $0B
         JSL   L033477
         BVS   L078239
         EOR   #$8000
L078239  BMI   L07824D
         LDY   #$0006
         LDA   [$0D],Y
         TAX
         DEY
         DEY
         LDA   [$0D],Y
         STA   $09
         STX   $0B
         LDA   $05
         STA   $07
L07824D  LDA   $0D
         LDX   $0F
         CLC
         ADC   #$000C
         BCC   L078258
         INX
L078258  STA   $0D
         STX   $0F
         LDA   #$000F
         CMP   $05
         BEQ   L078267
         INC   $05
         BRA   L0781F5
L078267  LDA   $07
         STA   $05
         LDA   $05
         DEC
         PEA   $000C
         JSL   L150BEE
         PLX
         LDAL  L0539E9,X
         ORAL  L0539EB,X
         BEQ   L078286
         PEI   $05
         JSL   L077CEC
L078286  LDA   $05
         STA   L054FC1
         LDA   $05
         DEC
         PEA   $000C
         JSL   L150BEE
         PLX
         TXA
         CLC
         ADC   #L0539E9
         LDX   #^L0539E9
         BCC   L0782A1
         INX
L0782A1  STA   $01
         STX   $03
         LDA   L055039
         LDX   L05503B
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
         LDA   #$0004
         CLC
         ADC   $01
         LDX   $03
         BCC   L0782BE
         INX
L0782BE  STA   $11
         STX   $13
         PHY
         PHY
         JSL   L15035F
         PLA
         STA   [$11]
         PLA
         LDY   #$0002
         STA   [$11],Y
         LDA   #$0000
         TAX
         LDY   #$0008
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   $18
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

L0782F1  ENT
         PHD
         TSC
         CLC
         ADC   #$FEEC
         TCS
         ADC   #$0021
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDF
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         STZ   $FC
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDF
         PHA
         JSL   L0735A8
         PLA
         STA   $EB
         PLX
         STX   $ED
         LDA   $EB
         ORA   $ED
         BNE   L078330
         BRL   L0785AC
L078330  LDA   L055051
         BEQ   L078338
         BRL   L078598
L078338  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDF
         PHA
         JSL   L070157
         PLA
         LSR
         BCC   L07834D
         BRL   L078598
L07834D  LDA   #$00FF
         LDX   #$FFDF
         AND   $00,X
         PHA
         LDA   L055043
         LDX   L055045
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STA   $EF
         STX   $F1
         PLA
         CMP   [$EF]
         BNE   L0783AF
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE0
         PHA
         LDA   L055043
         LDX   L055045
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         CLC
         ADC   #$0002
         BCC   L078394
         INX
L078394  PHX
         PHA
         LDA   #$00FF
         LDX   #$FFDF
         AND   $00,X
         PHA
         JSL   L070A10
         PLA
         LSR
         BCC   L0783AF
         LDA   #$0001
         STA   $FC
         BRL   L078598
L0783AF  LDA   L05502B
         LDX   L05502D
         CMP   L055039
         BNE   L0783BD
         CPX   L05503B
L0783BD  BNE   L0783C9
         PEA   $0015
         JSL   L0727E0
         BRL   L078598
L0783C9  PHY
         PEA   $003A
         PEI   $ED
         PEI   $EB
         JSL   L071452
         PLA
         BNE   L0783DD
         LDA   #$0000
         BRA   L0783E0
L0783DD  LDA   #$0001
L0783E0  PHA
         PHY
         PEA   $002F
         PEI   $ED
         PEI   $EB
         JSL   L071452
         PLA
         BNE   L0783F5
         LDA   #$0000
         BRA   L0783F8
L0783F5  LDA   #$0001
L0783F8  ORA   $01,S
         PLX
         LSR
         BCC   L078408
         PEA   $0016
         JSL   L0727E0
         BRL   L078598
L078408  LDA   L055039
         LDX   L05503B
         PHX
         PHA
         PEA   $0001
         JSL   L0B883D
         JSL   L074D35
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
         JSL   L0718BF
         PEI   $ED
         PEI   $EB
         JSL   L0718BF
         LDA   L055043
         LDX   L055045
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
         PHA
         LDA   [$EB]
         PHA
         JSL   L075A0C
         LDAL  L05565D
         STA   $E5
         LDA   $E5
         BEQ   L0784DE
         PHY
         LDA   L055043
         LDX   L055045
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         PHX
         PHA
         PEA   $0000
         JSL   L075D3B
         PLA
         STA   $E3
         LDAL  L05565D
         BNE   L0784CC
         PHY
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L055043
         LDX   L055045
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         PHX
         PHA
         JSL   L150B64
         PLA
         STA   L05503D
         LDAL  L05565D
         BEQ   L0784BD
         STZ   L05503D
L0784BD  LDA   $E3
         STA   L055047
         PEA   $0017
         JSL   L0727E0
         BRL   L078598
L0784CC  LDA   #$0047
         CMP   $E5
         BNE   L0784DE
         PEA   $0017
         JSL   L0727E0
         JSL   L070000
L0784DE  PHY
         LDY   #$0002
         LDA   [$EB],Y
         PHA
         LDA   [$EB]
         PHA
         PEA   $0000
         JSL   L075D3B
         PLA
         STA   $E3
         LDAL  L05565D
         BEQ   L0784FB
         BRL   L07858D
L0784FB  PHY
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDY   #$0002
         LDA   [$EB],Y
         PHA
         LDA   [$EB]
         PHA
         JSL   L150B64
         PLA
         STA   L05503D
         LDAL  L05565D
         BEQ   L07851F
         STZ   L05503D
L07851F  LDA   $E3
         STA   L055047
         LDA   L055039
         LDX   L05503B
         STA   $DF
         STX   $E1
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L07185A
         LDA   $EB
         LDX   $ED
         STA   L055043
         STX   L055045
         STZ   $EB
         STZ   $ED
         PHY
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
         STA   $E7
         PLX
         STX   $E9
         PHY
         PHY
         PEI   $E9
         PEI   $E7
         JSL   L078841
         PLA
         STA   L055039
         PLA
         STA   L05503B
         PEI   $E9
         PEI   $E7
         JSL   L07185A
         PEI   $E1
         PEI   $DF
         JSL   L09827F
         LDA   #$0001
         STA   $FC
         BRA   L078598
L07858D  PEA   $0017
         JSL   L0727E0
         JSL   L070000
L078598  LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L07191C
         PEI   $ED
         PEI   $EB
         JSL   L07185A
L0785AC  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$011A
         TCS
         RTL

L0785BE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         STZ   $18
         LDA   L055051
         BEQ   L0785D0
         BRL   L07868D
L0785D0  PHY
         PHY
         LDY   #$0002
         LDA   [$14],Y
         PHA
         LDA   [$14]
         PHA
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L0785E5
         INX
L0785E5  STA   $07
         STX   $09
         PEI   $09
         PEI   $07
         LDA   #$7530
         LDX   #$0000
         JSL   L033477
         BEQ   L078603
         BVS   L0785FE
         EOR   #$8000
L0785FE  BPL   L078603
         BRL   L07868D
L078603  PHY
         LDA   $07
         LDX   $09
         CLC
         ADC   #$0604
         BCC   L07860F
         INX
L07860F  PHX
         PHA
         LDAL  L053A9F
         TAX
         LDAL  L053A9D
         JSL   L1512A5
         PHX
         PHA
         JSL   L07664A
         PLA
         LSR
         BCC   L07868D
         LDA   #$0004
         STA   $01
         STZ   $03
         PHY
         PEI   $16
         PEI   $14
         JSL   L0718FA
         PLA
         STA   $05
         PEA   $0000
         PEA   $0600
         PEA   $0000
         PEA   $0004
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L078BF0
         PEA   $0000
         PEA   $0604
         PEI   $09
         PEI   $07
         LDY   #$0002
         LDA   [$14],Y
         PHA
         LDA   [$14]
         PHA
         JSL   L078BF0
         PEI   $16
         PEI   $14
         PEI   $05
         JSL   L0718DA
         JSL   L075602
         LDA   L055039
         LDX   L05503B
         PHX
         PHA
         PEA   $0000
         JSL   L0B883D
         LDA   #$0001
         STA   $18
L07868D  LDA   $12
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

L07869F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         LDA   #$0000
         TAX
         STA   [$24]
         TXA
         LDY   #$0002
         STA   [$24],Y
         LDA   #$0000
         TAX
         STA   [$20]
         TXA
         LDY   #$0002
         STA   [$20],Y
         LDA   $28
         ORA   $2A
         BNE   L0786C8
         BRL   L07882F
L0786C8  STZ   $07
         LDY   #$0002
         LDA   [$28],Y
         TAX
         LDA   [$28]
         STA   $03
         STX   $05
         LDA   [$03]
         STA   $01
         LDA   #$0001
         SEC
         SBC   $01
         BEQ   L0786E9
         BVS   L0786E7
         EOR   #$8000
L0786E7  BMI   L078719
L0786E9  LDA   $01
         STA   $09
L0786ED  LDA   #$0002
         CLC
         ADC   $03
         LDX   $05
         BCC   L0786F8
         INX
L0786F8  STA   $17
         STX   $19
         LDA   $09
         DEC
         TAY
         LDA   #$00FF
         AND   [$17],Y
         CMP   #$003A
         BNE   L078710
         LDA   $09
         STA   $07
         BRA   L078719
L078710  LDA   $09
         DEC
         BEQ   L078719
         DEC   $09
         BRA   L0786ED
L078719  LDA   $07
         STA   $0B
         LDY   #$0002
         LDA   [$28],Y
         TAX
         LDA   [$28]
         STA   $17
         STX   $19
         LDA   [$17]
         SEC
         SBC   $07
         STA   $0D
         LDA   $0B
         BNE   L07873A
         STZ   $0F
         STZ   $11
         BRA   L0787A4
L07873A  PHY
         PHY
         LDA   $0B
         INC
         INC
         JSL   L150488
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $0F
         PLX
         STX   $11
         LDAL  L05565D
         BEQ   L078766
         BRL   L078817
L078766  LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         STA   $17
         STX   $19
         LDA   $0B
         STA   [$17]
         LDY   #$0002
         LDA   [$28],Y
         TAX
         LDA   [$28]
         CLC
         ADC   #$0002
         BCC   L078785
         INX
L078785  PHX
         PHA
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         CLC
         ADC   #$0002
         BCC   L078796
         INX
L078796  PHX
         PHA
         LDA   $0B
         JSL   L150488
         PHX
         PHA
         JSL   L070597
L0787A4  PHY
         PHY
         LDA   $0D
         INC
         INC
         JSL   L150488
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $13
         PLX
         STX   $15
         LDAL  L05565D
         BNE   L078817
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         STA   $17
         STX   $19
         LDA   $0D
         STA   [$17]
         LDY   #$0002
         LDA   [$28],Y
         TAX
         LDA   [$28]
         CLC
         ADC   #$0002
         BCC   L0787EC
         INX
L0787EC  PHX
         PHA
         LDA   $07
         JSL   L150488
         JSL   L150F53
         PHX
         PHA
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         CLC
         ADC   #$0002
         BCC   L078809
         INX
L078809  PHX
         PHA
         LDA   $0D
         JSL   L150488
         PHX
         PHA
         JSL   L070597
L078817  LDA   $0F
         LDX   $11
         STA   [$24]
         TXA
         LDY   #$0002
         STA   [$24],Y
         LDA   $13
         LDX   $15
         STA   [$20]
         TXA
         LDY   #$0002
         STA   [$20],Y
L07882F  LDA   $1E
         STA   $2A
         LDA   $1D
         STA   $29
         LDA   $1B
         TCD
         TSC
         CLC
         ADC   #$0028
         TCS
         RTL

L078841  ENT
         PHD
         TSC
         CLC
         ADC   #$FDF0
         TCS
         ADC   #$011D
         TCD
         LDA   $F8
         ORA   $FA
         BEQ   L0788D1
         LDA   [$F8]
         LDY   #$0002
         ORA   [$F8],Y
         BEQ   L0788D1
         LDY   #$0002
         LDA   [$F8],Y
         TAX
         LDA   [$F8]
         STA   $EF
         STX   $F1
         LDA   #$0004
         CMP   [$EF]
         BNE   L0788D1
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE3
         PHA
         PEI   $FA
         PEI   $F8
         JSL   L072CD4
         PEA   $0100
         JSL   L0313BE
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         PEA   ^L040A77
         PEA   L040A77
         JSL   L071C56
         PLA
         LSR
         BCC   L0788D1
         PHY
         PHY
         LDA   L055031
         LDX   L055033
         PHX
         PHA
         JSL   L070525
         PLA
         STA   $E7
         PLX
         STX   $E9
         PHY
         PHY
         LDA   L055035
         LDX   L055037
         PHX
         PHA
         JSL   L070525
         PLA
         STA   $E3
         PLX
         STX   $E5
         BRA   L0788EB
L0788D1  PEI   $FA
         PEI   $F8
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         JSL   L07869F
L0788EB  PHY
         PEI   $E9
         PEI   $E7
         LDA   L054FFF
         LDX   L055001
         PHX
         PHA
         JSL   L0713AC
         PLA
         STA   $EB
         LDA   $EB
         BNE   L078927
         PEI   $E9
         PEI   $E7
         LDA   L054FFF
         LDX   L055001
         PHX
         PHA
         JSL   L070083
         PHY
         PEI   $E9
         PEI   $E7
         LDA   L054FFF
         LDX   L055001
         PHX
         PHA
         JSL   L0713AC
         PLA
         STA   $EB
L078927  PHY
         PEI   $E5
         PEI   $E3
         LDA   L054FFB
         LDX   L054FFD
         PHX
         PHA
         JSL   L0713AC
         PLA
         STA   $ED
         LDA   $ED
         BNE   L078963
         PEI   $E5
         PEI   $E3
         LDA   L054FFB
         LDX   L054FFD
         PHX
         PHA
         JSL   L070083
         PHY
         PEI   $E5
         PEI   $E3
         LDA   L054FFB
         LDX   L054FFD
         PHX
         PHA
         JSL   L0713AC
         PLA
         STA   $ED
L078963  LDA   $EB
         JSL   L150488
         PEA   $0001
         PEA   $0000
         JSL   L150D50
         LDA   $ED
         JSL   L150488
         JSL   L150F53
         STA   $FC
         STX   $FE
         PEI   $E9
         PEI   $E7
         PEI   $E5
         PEI   $E3
         JSL   L071825
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0216
         TCS
         RTL

L07899F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         PHY
         LDA   L054FFF
         LDX   L055001
         PHX
         PHA
         PEI   $14
         JSL   L0710E8
         PLA
         STA   $01
         PLX
         STX   $03
         PHY
         PHY
         LDA   L054FFB
         LDX   L054FFD
         PHX
         PHA
         PEI   $12
         JSL   L0710E8
         PLA
         STA   $05
         PLX
         STX   $07
         PHY
         PHY
         PEI   $03
         PEI   $01
         PEI   $07
         PEI   $05
         JSL   L072B9F
         PLA
         STA   $16
         PLX
         STX   $18
         PEI   $03
         PEI   $01
         PEI   $07
         PEI   $05
         JSL   L071825
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

L078A05  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0C
         PEI   $0A
         PEI   $10
         PEI   $0E
         JSL   L1512FB
         LDAL  L05565D
         BEQ   L078A58
         PEA   $0000
         JSL   L07479E
         PEI   $0C
         PEI   $0A
         PEI   $10
         PEI   $0E
         JSL   L1512FB
         LDAL  L05565D
         BEQ   L078A3B
         LDA   #$0001
L078A3B  PHA
         LDA   L055003
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L078A58
         JSL   L151373
         PEI   $0C
         PEI   $0A
         PEI   $10
         PEI   $0E
         JSL   L1512FB
L078A58  LDX   #$0000
         LDAL  L05565D
         BNE   L078A62
         INX
L078A62  TXA
         STA   $12
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

L078A77  PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         LDA   $1C
         AND   #$001F
         BEQ   L078A8D
         PEA   $06FB
         JSL   L07272E
L078A8D  PHY
         PHY
         PEI   $22
         PEI   $20
         JSL   L0742B3
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L078AA8
         PEA   $06FC
         JSL   L07272E
L078AA8  PEI   $22
         PEI   $20
         PEA   $0000
         PEA   $0100
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   $0F
         STX   $11
         PEI   $11
         PEI   $0F
         PEA   $0000
         PEA   $0080
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   $0B
         STX   $0D
         LDA   $0F
         AND   #$007F
         STA   $09
         PHY
         PHY
         PEI   $0D
         PEI   $0B
         JSL   L077342
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BNE   L078AF8
         PEA   $0098
         JSL   L07272E
L078AF8  LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         PHX
         PHA
         LDA   $09
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $13
         STX   $15
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         STA   $01
         STX   $03
         LDA   $1C
         ORA   $1E
         BNE   L078B70
         LDA   $01
         LDX   $03
         INC
         BNE   L078B38
         INX
L078B38  AND   #$00FF
         JSL   L150488
         STA   $01
         STX   $03
         PEI   $0D
         PEI   $0B
         LDAL  L053ABB
         TAX
         LDAL  L053AB9
         JSL   L033477
         BVS   L078B59
         EOR   #$8000
L078B59  BMI   L078B6E
         LDA   $0B
         LDX   $0D
         STAL  L053AB9
         TXA
         STAL  L053ABB
         LDA   #$0001
         STA   L05504D
L078B6E  BRA   L078BA1
L078B70  LDA   $01
         AND   #$00FF
         JSL   L150488
         PHX
         PHA
         PEI   $1E
         PEI   $1C
         PEA   $0000
         PEA   $0020
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         PEA   $0000
         PEA   $0100
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $01
         STX   $03
L078BA1  LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         PHX
         PHA
         LDA   $09
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $13
         STX   $15
         LDA   $01
         LDX   $03
         STA   [$13]
         TXA
         LDY   #$0002
         STA   [$13],Y
         PEI   $0D
         PEI   $0B
         PEA   $0001
         JSL   L074AFC
         LDA   $1A
         STA   $22
         LDA   $19
         STA   $21
         LDA   $17
         TCD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L078BF0  ENT
         PHD
         TSC
         CLC
         ADC   #$FEE2
         TCS
         ADC   #$0033
         TCD
         LDA   L05504F
         BEQ   L078C03
         BRL   L078C92
L078C03  LDA   L055047
         PHA
         PEI   $FA
         PEI   $F8
         JSL   L075E14
         PHY
         PHY
         LDA   L055047
         PHA
         PEI   $F2
         PEI   $F0
         PEI   $F6
         PEI   $F4
         PEA   $0000
         JSL   L075E55
         PLA
         STA   $E3
         PLX
         STX   $E5
         LDAL  L05565D
         BEQ   L078C86
         LDAL  L05565D
         STA   $E1
         LDA   #$002B
         CMP   $E1
         BNE   L078C46
         PHY
         JSL   L076B39
         PLA
         LSR
         BCS   L078C03
L078C46  PEA   $0000
         TDC
         CLC
         ADC   #$00CD
         PHA
         LDA   $E1
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCD
         PHA
         PEA   $0027
         JSL   L072809
         PEA   ^L040A7C
         PEA   L040A7C
         PEA   ^L040A7D
         PEA   L040A7D
         JSL   L073C22
         PEA   $0025
         JSL   L0727E0
         JSL   L070000
L078C86  LDA   #$0001
         STA   L054FF9
         LDA   #$0001
         STA   L054FF5
L078C92  LDA   $EE
         STA   $FA
         LDA   $ED
         STA   $F9
         LDA   $EB
         TCD
         TSC
         CLC
         ADC   #$012C
         TCS
         RTL

L078CA4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   L05504F
         BEQ   L078CB4
         BRL   L078D7B
L078CB4  LDA   #$2000
         ANDL  L053AE9
         BEQ   L078CC0
         LDA   #$0001
L078CC0  STA   $01
         LDAL  L053AAB
         TAX
         LDAL  L053AA9
         STA   $03
         STX   $05
         LDA   L05501B
         LDX   L05501D
         STAL  L053B29
         TXA
         STAL  L053B2B
         LDA   L05501B
         LDX   L05501D
         PHX
         PHA
         LDAL  L053B27
         TAX
         LDAL  L053B25
         JSL   L033477
         BVS   L078CF8
         EOR   #$8000
L078CF8  BMI   L078D09
         LDA   L05501B
         LDX   L05501D
         STAL  L053B25
         TXA
         STAL  L053B27
L078D09  LDAL  L053AAB
         PHA
         LDAL  L053AA9
         PHA
         PHY
         PHY
         PEA   ^L053A9D
         PEA   L053A9D
         PEA   $0000
         PEA   $0180
         JSL   L071E31
         PLA
         PLX
         JSL   L1512A5
         STAL  L053AA9
         TXA
         STAL  L053AAB
         LDA   $01
         BEQ   L078D46
         PEA   ^L053AB5
         PEA   L053AB5
         PEI   $05
         PEI   $03
         JSL   L077E22
L078D46  PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0600
         PEA   ^L053A9D
         PEA   L053A9D
         JSL   L078BF0
         LDA   $01
         BEQ   L078D6E
         PEA   ^L053AB5
         PEA   L053AB5
         PEI   $05
         PEI   $03
         JSL   L077E22
L078D6E  LDA   $03
         LDX   $05
         STAL  L053AA9
         TXA
         STAL  L053AAB
L078D7B  STZ   L05504D
         PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L078D85  ENT
         PHD
         TSC
         SEC
         SBC   #$0014
         TCD
         TCS
         LDA   $1A
         CMP   L055055
         BEQ   L078D99
         PHA
         JSL   L0792D7
L078D99  LDY   #$0000
         TYA
         TYX
         SEP   #$20
         STZ   $02
         STZ   $04
         STZ   $06
         LDA   [$22]
         TAX
         LDAL  L078F91,X
         BNE   L078DB2
         BRL   L078E59
L078DB2  SEP   #$20
         ASL
         STA   $01
         INY
         LDA   [$22],Y
         TAX
         LDAL  L078F91,X
         BNE   L078DC4
         BRL   L078E59
L078DC4  ASL
         STA   $03
         INY
         LDA   [$22],Y
         TAX
         LDAL  L078F91,X
         BNE   L078DD4
         BRL   L078E59
L078DD4  REP   #$20
         STY   $07
         LDX   $1C
         STX   $09
         LDX   $03
         ORAL  L078EC0,X
         LDX   $01
         ORAL  L078F00,X
         STA   $0B
         CMP   #$0000
         BNE   L078DFC
         LDY   $07
         INY
         LDA   [$22],Y
         TAX
         LDA   L078F91,X
         BEQ   L078E59
         LDA   $0B
L078DFC  STA   $13
L078DFE  JSR   L078EA3
         JSR   L078E88
         DEC   $09
         BEQ   L078E16
         LDA   $0B
         ASL
         ADC   #$0000
         ASL
         ADC   #$0000
         STA   $0B
         BRA   L078DFE
L078E16  LDY   $07
         INY
         STY   $07
         LDA   [$22],Y
         AND   #$00FF
         TAX
         LDAL  L078F91,X
         AND   #$00FF
         BEQ   L078E59
         STA   $05
         REP   #$20
         LDA   $13
         XBA
         LSR
         AND   #$001E
         TAX
         LDA   L0532C5,X
         STA   $0F
         LDA   $13
         ASL
         ASL
         ASL
         ASL
         ASL
         ORA   $05
         STA   $13
         JSR   L078EA3
         CLC
         ADC   $0F
         CMP   L055053
         BCC   L078E54
         SBC   L055053
L078E54  JSR   L078E88
         BRA   L078E16
L078E59  REP   #$20
         CPX   #$0000
         BEQ   L078E75
L078E60  INY
         LDA   [$22],Y
         AND   #$00FF
         BEQ   L078E75
         TAX
         LDAL  L078F91,X
         AND   #$00FF
         BEQ   L078E60
         BRL   L078DB2
L078E75  LDA   $18
         STA   $24
         LDA   $17
         STA   $23
         LDX   $15
         TDC
         CLC
         ADC   #$0022
         TCS
         TXA
         TCD
         RTL

L078E88  CLC
         ADC   #$0009
         TAY
         AND   #$000F
         ASL
         TAX
         TYA
         LSR
         LSR
         LSR
         AND   #$1FFE
         TAY
         LDA   [$1E],Y
         ORAL  L078F40,X
         STA   [$1E],Y
         RTS

L078EA3  TAY
         AND   #$00FF
         ASL
         PHA
         TYA
         XBA
         AND   #$00FF
         ASL
         TAX
         LDA   L0532E5,X
         PLX
         ADC   L0534E5,X
         CMP   L055053
         BCC   L078EBF
         SBC   L055053
L078EBF  RTS

L078EC0  DW    $0000
         DW    $0020
         DW    $0040
         DW    $0060
         DW    $0080
         DW    $00A0
         DW    $00C0
         DW    $00E0
         DW    $0100
         DW    $0120
         DW    $0140
         DW    $0160
         DW    $0180
         DW    $01A0
         DW    $01C0
         DW    $01E0
         DW    $0200
         DW    $0220
         DW    $0240
         DW    $0260
         DW    $0280
         DW    $02A0
         DW    $02C0
         DW    $02E0
         DW    $0300
         DW    $0320
         DW    $0340
         DW    $0360
         DW    $0380
         DW    $03A0
         DW    $03C0
         DW    $03E0
L078F00  DW    $0000
         DW    $0400
         DW    $0800
         DW    $0C00
         DW    $1000
         DW    $1400
         DW    $1800
         DW    $1C00
         DW    $2000
         DW    $2400
         DW    $2800
         DW    $2C00
         DW    $3000
         DW    $3400
         DW    $3800
         DW    $3C00
         DW    $4000
         DW    $4400
         DW    $4800
         DW    $4C00
         DW    $5000
         DW    $5400
         DW    $5800
         DW    $5C00
         DW    $6000
         DW    $6400
         DW    $6800
         DW    $6C00
         DW    $7000
         DW    $7400
         DW    $7800
         DW    $7C00
L078F40  DW    $0001
         DW    $0002
         DW    $0004
         DW    $0008
         DW    $0010
         DW    $0020
         DW    $0040
         DW    $0080
         DW    $0100
         DW    $0200
         DW    $0400
         DW    $0800
         DW    $1000
         DW    $2000
         DW    $4000
         DW    $8000
L078F60  ENT
         PHD
         PHY
         TSC
         TCD
         LDY   #$00FF
         SEP   #$20
L078F69  TYA
         LDX   #$0000
L078F6D  ASL
         BEQ   L078F75
         BCC   L078F6D
         INX
         BRA   L078F6D
L078F75  INX
         TXA
         STA   [$08],Y
         DEY
         BNE   L078F69
         LDA   #$00
         STA   [$08]
         REP   #$20
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

L078F91  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
         HEX   1B1C1D1E1F0A1116181A000000000000
         HEX   000102030405060708090A0B0C0D0E0F
         HEX   101112131415161718191A0000000000
         HEX   000102030405060708090A0B0C0D0E0F
         HEX   101112131415161718191A0000000000
         HEX   010103050E0F15010101010101030505
         HEX   0505090909090E0F0F0F0F0F15151515
         HEX   0000000000000000000000000000010F
         HEX   0000000000000000000000010F00010F
         HEX   000000000000000000000001010F0F0F
         HEX   00000000000000001919000000000000
         HEX   00000000000105010505090909090F0F
         HEX   000F1515150000000000000000000000

L079091  LDA   $04,S
         STAL  L0790A7+1
         LDA   $05,S
         STAL  L0790A7+2
         LDA   $01,S
         STA   $05,S
         LDA   $02,S
         STA   $06,S
         PLY
         PLY
L0790A7  JMPL  $000000

L0790AB  ENT
         PHD
         TSC
         TCD
         STZ   $12
         STZ   $10
         LDA   $0A
         ASL
         ASL
         DEC
         TAY
         LDA   $06
         STAL  L0790C9+1
         LDA   $07
         STAL  L0790C9+2
         SEP   #$20
L0790C6  LDA   [$0C],Y
         TAX
L0790C9  LDAL  $000000,X
         CLC
         ADC   $10
         STA   $10
         BCC   L0790D6
         INC   $11
L0790D6  DEY
         BPL   L0790C6
         REP   #$20
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

L0790EC  ENT
         PHD
         PHY
         TSC
         TCD
         STZ   $0E
         LDY   $08
         LDA   [$0A],Y
         AND   #$00FF
         STA   $01
         AND   #$0007
         ASL
         TAX
         LDA   $01
         LSR
         LSR
         LSR
         TAY
         LDAL  L079197,X
         TYX
         ANDL  L07917F,X
         BEQ   L07916F
         LDA   $01
         CMP   #$002C
         BEQ   L079147
         CMP   #$002E
         BEQ   L07915A
         CMP   #$0027
         BNE   L07916A
         DEY
         BMI   L07916A
         LDA   [$0A],Y
         AND   #$00FF
         CMP   #$0030
         BCC   L07916A
         CMP   #$00A0
         BCS   L07916A
         INY
         INY
         LDA   [$0A],Y
         AND   #$00FF
         CMP   #$0030
         BCC   L07916A
         CMP   #$00A0
         BCS   L07916A
         BRA   L07916F
L079147  DEY
         BMI   L07916A
         LDA   [$0A],Y
         AND   #$00FF
         CMP   #$0030
         BCC   L07916A
         CMP   #$003A
         BCS   L07916A
         INY
L07915A  INY
         LDA   [$0A],Y
         AND   #$00FF
         CMP   #$0030
         BCC   L07916A
         CMP   #$003A
         BCC   L07916F
L07916A  LDA   #$0001
         STA   $0E
L07916F  LDA   $06
         STA   $0C
         LDA   $05
         STA   $0B
         TDC
         TCS
         PLY
         PLD
         PLY
         PLY
         PLY
         RTL

L07917F  DW    $FFFF
         DW    $FFFF
         DW    $FFF3
         DW    $3F00
         DW    $0080
         DW    $1F00
         DW    $0080
         DW    $1F00
         DW    $0000
         DW    $0000
         DW    $FCCF
         DW    $E4F7
L079197  DW    $0080
         DW    $0040
         DW    $0020
         DW    $0010
         DW    $0008
         DW    $0004
         DW    $0002
         DW    $0002
L0791A7  ENT
         PHD
         PHY
         PHY
         PHY
         PHY
         TSC
         TCD
         STZ   $14
         STZ   $16
         PHA
         PHA
         PEI   $12
         PEI   $10
         PEA   $0000
         JSL   L07963D
         PLA
         PLX
         STA   $05
         STX   $07
         SEC
         SBC   #$000E
         BCS   L0791CC
         DEX
L0791CC  STA   $01
         STX   $03
         STA   L055059
         STX   L05505B
         LDA   [$01]
         BEQ   L0791FC
         TAX
         LDY   #$0002
L0791DE  LDA   [$05],Y
         CMP   $0E
         BNE   L0791EE
         LDA   $05
         LDX   $07
         STA   $14
         STX   $16
         BRA   L0791FC
L0791EE  LDA   [$05]
         CLC
         ADC   $05
         STA   $05
         BCC   L0791F9
         INC   $07
L0791F9  DEX
         BNE   L0791DE
L0791FC  LDA   $0C
         STA   $12
         LDA   $0B
         STA   $11
         LDX   $09
         TDC
         CLC
         ADC   #$0010
         TCS
         TXA
         TCD
         RTL

L07920F  ENT
         PHD
         TSC
         SEC
         SBC   #$000E
         TCD
         TCS
         STZ   $22
         LDA   $1C
         CMP   #$8000
         ROR
         STA   $1C
         PHY
         PHY
         PHY
         PHY
         PEI   $20
         PEI   $1E
         JSL   L077A5B
         PEA   $0000
         JSL   L07963D
         PLA
         STA   $01
         PLA
         STA   $03
         ORA   $01
         BNE   L079241
         BRL   L0792B9
L079241  LDA   $01
         LDX   $03
         SEC
         SBC   #$000E
         BCS   L07924C
         DEX
L07924C  STA   $05
         STX   $07
         LDA   [$05]
         BEQ   L0792B9
         TAY
         STZ   $0B
         STZ   $0D
L079259  PHY
         LDY   #$0004
         LDA   [$01],Y
         BMI   L079297
         AND   #$000F
         CMP   $18
         BEQ   L07926E
         LDA   $18
         BEQ   L07926E
         BRA   L079297
L07926E  PHY
         TDC
         CLC
         ADC   #$001A
         PEA   $0000
         PHA
         LDA   #$0006
         CLC
         ADC   $01
         LDX   $03
         BCC   L079283
         INX
L079283  PHX
         PHA
         _PtInRect
         PLA
         BEQ   L079297
         LDA   $03
         STA   $0D
         LDA   $01
         STA   $0B
L079297  LDA   [$01]
         CLC
         ADC   $01
         BCC   L0792A0
         INC   $03
L0792A0  STA   $01
         PLY
         DEY
         BNE   L079259
         LDA   $0B
         ORA   $0D
         BEQ   L0792B9
         LDY   #$002A
L0792AF  LDA   [$0B],Y
         STA   [$14],Y
         DEY
         DEY
         BPL   L0792AF
         INC   $22
L0792B9  PEI   $20
         PEI   $1E
         PEA   $0000
         JSL   L074E4D
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

L0792D7  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         LDA   $0A
         STAL  L055055
         DEC
         ASL
         TAX
         LDAL  L079355,X
         STA   $03
         STAL  L055053
         LDA   #$0000
         TAX
         LDY   #$0100
         BRA   L079302
L0792F8  INX
         INX
         INC
         CMP   $03
         BCC   L079302
         LDA   #$0000
L079302  STA   L0534E5,X
         DEY
         BNE   L0792F8
         INC
         STA   $01
         TYA
         TYX
         LDY   #$0100
         BRA   L07931D
L079312  INX
         INX
         CLC
         ADC   $01
         CMP   $03
         BCC   L07931D
         SBC   $03
L07931D  STA   L0532E5,X
         DEY
         BNE   L079312
         ADC   $01
         CMP   $03
         BCC   L07932B
         SBC   $03
L07932B  STA   $01
         TYA
         TYX
         LDY   #$0010
         BRA   L07933F
L079334  INX
         INX
         CLC
         ADC   $01
         CMP   $03
         BCC   L07933F
         SBC   $03
L07933F  STAL  L0532C5,X
         DEY
         BNE   L079334
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

L079355  DW    $0017
         DW    $0035
         DW    $0053
         DW    $0071
         DW    $0097
         DW    $00B5
         DW    $00D3
         DW    $00F1
         DW    $0115
         DW    $0137
         DW    $0151
         DW    $0175
         DW    $0191
         DW    $01B7
         DW    $01D3
         DW    $01F7
         DW    $020B
         DW    $0233
         DW    $0257
         DW    $0277
         DW    $0295
         DW    $02B3
         DW    $02D7
         DW    $02F5
         DW    $0313
         DW    $0337
         DW    $0355
         DW    $0377
         DW    $0397
         DW    $03B3
         DW    $03D7
         DW    $03F5

L079395  PHD
         PHY
         PHY
         TSC
         TCD
         LDY   #$0002
         LDA   [$0A]
         STA   $01
         LDA   [$0A],Y
         STA   $03
         SEP   #$20
L0793A7  LDA   [$01]
         BEQ   L0793BF
         CMP   #$0D
         BEQ   L0793BF
         CMP   #$20
         BEQ   L0793BF
         INC   $01
         BNE   L0793A7
         INC   $02
         BNE   L0793A7
         INC   $03
         BRA   L0793A7
L0793BF  REP   #$20
         LDA   $01
         STA   [$0A]
         LDA   $03
         STA   [$0A],Y
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

L0793D9  PHB
         PHD
         PHY
         PHY
         PHY
         TSC
         TCD
         LDA   #$0001
         STA   $17
         LDA   $0D
         BEQ   L079454
         PEA   >L0714D9
         PLB
         PLB
         LDA   #$0000
         TAX
         SEP   #$20
         LDA   [$13]
         BEQ   L079456
         TAX
         LDA   L0714D9,X
         STA   $01
L0793FE  LDY   #$0002
         JSR   L07946C
L079404  LDY   #$0000
         TYX
         STY   $03
L07940A  LDA   [$0F],Y
         BEQ   L079445
         TAX
         LDA   L0714D9,X
         CMP   $01
         BEQ   L07941B
         INY
         STY   $03
         BRA   L07940A
L07941B  JSR   L07946C
         LDY   #$FFFF
L079421  INY
         LDA   [$0F],Y
         BEQ   L07943F
         STA   $05
         LDA   [$13],Y
         BEQ   L079456
         TAX
         LDA   L0714D9,X
         LDX   $05
         CMP   L0714D9,X
         BEQ   L079421
         LDY   #$0001
         JSR   L07946C
         BRA   L079404
L07943F  LDA   [$13],Y
         BEQ   L079456
         STY   $03
L079445  LDX   $0D
         DEX
         BEQ   L079454
         STX   $0D
         LDY   $03
         INY
         JSR   L07946C
         BRA   L0793FE
L079454  STZ   $17
L079456  REP   #$20
         LDA   $0B
         STA   $15
         LDA   $09
         STA   $13
         LDX   $07
         TDC
         CLC
         ADC   #$0012
         TCS
         TXA
         TCD
         PLB
         RTL

L07946C  PHP
         REP   #$20
         TYA
         CLC
         ADC   $0F
         STA   $0F
         BNE   L079479
         INC   $11
L079479  LDA   #$0000
         PLP
         RTS

L07947E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0001
         STA   $12
         LDY   #$0002
         LDA   [$0E],Y
         TAX
         LDA   [$0E]
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         PHY
         PHY
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         JSL   L07704E
         PLA
         PLX
         JSL   L033477
         BEQ   L0794BA
         BRL   L079546
L0794BA  LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         LDY   #$002A
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CLC
         ADC   #$0032
         BCC   L0794D4
         INX
L0794D4  PHX
         PHA
         LDY   #$0030
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L150F53
         JSL   L033477
         BVS   L0794ED
         EOR   #$8000
L0794ED  BMI   L0794F1
         BRA   L079546
L0794F1  LDY   #$0006
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   #$4B42
         BNE   L079503
         CPX   #$4447
L079503  BEQ   L079507
         BRA   L079546
L079507  LDY   #$0016
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BEQ   L07951E
         BPL   L079520
L07951E  BRA   L079546
L079520  LDY   #$0024
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BPL   L07952D
         BRA   L079546
L07952D  LDY   #$002A
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L079544
         BRA   L079546
L079544  STZ   $12
L079546  LDA   $0C
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

L079558  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0001
         STA   $12
         LDY   #$0002
         LDA   [$0E],Y
         TAX
         LDA   [$0E]
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         PHY
         PHY
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         JSL   L07704E
         PLA
         PLX
         JSL   L033477
         BEQ   L079594
         BRL   L07962B
L079594  LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         LDY   #$002A
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CLC
         ADC   #$0032
         BCC   L0795AE
         INX
L0795AE  PHX
         PHA
         LDY   #$0030
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L150F53
         JSL   L033477
         BVS   L0795C7
         EOR   #$8000
L0795C7  BMI   L0795CB
         BRA   L07962B
L0795CB  LDY   #$0006
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   #$4143
         BNE   L0795DD
         CPX   #$4452
L0795DD  BEQ   L0795E1
         BRA   L07962B
L0795E1  LDY   #$0024
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BPL   L0795EE
         BRA   L07962B
L0795EE  LDY   #$002A
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L079605
         BRA   L07962B
L079605  LDY   #$002C
         LDA   [$01],Y
         SEC
         SBC   #$0000
         BPL   L079612
         BRA   L07962B
L079612  LDY   #$0030
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L079629
         BRA   L07962B
L079629  STZ   $12
L07962B  LDA   $0C
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

L07963D  PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         STZ   $20
         STZ   $22
         LDA   $1C
         ORA   $1E
         BNE   L079652
         BRL   L079740
L079652  LDA   [$1C]
         LDY   #$0002
         ORA   [$1C],Y
         BNE   L07965E
         BRL   L079740
L07965E  LDY   #$0002
         LDA   [$1C],Y
         TAX
         LDA   [$1C]
         STA   $0D
         STX   $0F
         LDY   #$0006
         LDA   [$0D],Y
         TAX
         DEY
         DEY
         LDA   [$0D],Y
         STA   $05
         STX   $07
         LDA   #$4143
         LDX   #$4452
         CMP   $05
         BNE   L079684
         CPX   $07
L079684  BNE   L07968B
         LDA   #$0000
         BRA   L07968E
L07968B  LDA   #$0001
L07968E  BEQ   L0796AB
         LDA   #$4B42
         LDX   #$4447
         CMP   $05
         BNE   L07969C
         CPX   $07
L07969C  BNE   L0796A3
         LDA   #$0000
         BRA   L0796A6
L0796A3  LDA   #$0001
L0796A6  BEQ   L0796AB
         BRL   L079740
L0796AB  LDY   #$0002
         LDA   [$1C],Y
         TAX
         LDA   [$1C]
         CLC
         ADC   #$0032
         BCC   L0796BA
         INX
L0796BA  STA   $09
         STX   $0B
         LDA   $1A
         BEQ   L079738
         LDA   $09
         LDX   $0B
         SEC
         SBC   #$000E
         BCS   L0796CD
         DEX
L0796CD  STA   $01
         STX   $03
         PEI   $0B
         PEI   $09
         LDY   #$0006
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L150F53
         STA   $09
         STX   $0B
         LDA   $1A
         DEC
         BEQ   L079738
         PEI   $0B
         PEI   $09
         LDY   #$000C
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L150F53
         STA   $09
         STX   $0B
         LDA   $1A
         DEC
         DEC
         BEQ   L079738
         LDY   #$0010
         LDA   #$0400
         AND   [$0D],Y
         CMP   #$0000
         BEQ   L079724
         LDA   $09
         LDX   $0B
         CLC
         ADC   #$0020
         BCC   L079720
         INX
L079720  STA   $09
         STX   $0B
L079724  LDA   #$0003
         CMP   $1A
         BEQ   L079738
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L071AB8
L079738  LDA   $09
         LDX   $0B
         STA   $20
         STX   $22
L079740  LDA   $18
         STA   $1E
         LDA   $17
         STA   $1D
         LDA   $15
         TCD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L079752  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055057
         BEQ   L079779
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PHY
         PHY
         JSL   L07B114
         PEA   $0000
         JSL   L07E171
         STZ   L055057
L079779  PLY
         PLY
         PLD
         RTL

L07977D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         STZ   $03
         PHY
         PHY
         PEI   $24
         PEI   $22
         JSL   L077A5B
         PLA
         STA   $13
         PLX
         STX   $15
         LDA   $13
         ORA   $15
         BNE   L0797A0
         BRL   L079820
L0797A0  PHY
         PHY
         PEI   $15
         PEI   $13
         PEA   $0000
         JSL   L07963D
         PLA
         STA   $0B
         PLX
         STX   $0D
         LDA   $0B
         ORA   $0D
         BEQ   L079820
         LDA   $0B
         LDX   $0D
         SEC
         SBC   #$000E
         BCS   L0797C4
         DEX
L0797C4  STA   $07
         STX   $09
         LDA   $20
         BNE   L0797D2
         LDA   [$07]
         STA   $03
         BRA   L079815
L0797D2  LDA   [$07]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L0797E1
         EOR   #$8000
L0797E1  BPL   L079815
         LDA   #$0001
         STA   $05
L0797E8  LDY   #$0004
         LDA   #$000F
         AND   [$0B],Y
         CMP   $20
         BNE   L0797F9
         LDA   $03
         INC
         STA   $03
L0797F9  PEI   $0D
         PEI   $0B
         LDA   [$0B]
         JSL   L150488
         JSL   L150F53
         STA   $0B
         STX   $0D
         LDA   $05
         CMP   $01
         BEQ   L079815
         INC   $05
         BRA   L0797E8
L079815  PEI   $24
         PEI   $22
         PEA   $0000
         JSL   L074E4D
L079820  LDA   $03
         STA   $26
         LDA   $1E
         STA   $24
         LDA   $1D
         STA   $23
         LDA   $1B
         TCD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L079836  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD6
         TCS
         TCD
         STZ   $34
         STZ   $36
         PHY
         PHY
         PEA   $0000
         PEA   $0038
         PEA   $4447
         PEA   $4B42
         PEA   $0000
         PEA   $0000
         JSL   L07502A
         PLA
         STA   $23
         PLX
         STX   $25
         PHY
         PHY
         PEI   $25
         PEI   $23
         JSL   L07721A
         PLA
         STA   $17
         PLX
         STX   $19
         LDA   $17
         ORA   $19
         BNE   L079879
         BRL   L079A07
L079879  LDA   $30
         LDX   $32
         STA   $1B
         STX   $1D
         PHY
         PHY
         PEI   $1D
         PEI   $1B
         JSL   L07721A
         PLA
         STA   $0F
         PLX
         STX   $11
         LDA   $0F
         ORA   $11
         BNE   L0798B7
         PEI   $25
         PEI   $23
         PEA   $0000
         JSL   L074A24
         PHY
         PEI   $25
         PEI   $23
         PEA   $4447
         PEA   $4B42
         JSL   L0751BE
         PLA
         STA   $0D
         BRL   L079A07
L0798B7  LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         CLC
         ADC   #$0018
         BCC   L0798C6
         INX
L0798C6  STA   $27
         STX   $29
         LDY   #$0002
         LDA   [$27],Y
         TAX
         LDA   [$27]
         STA   $1F
         STX   $21
         PHY
         PHY
         PEI   $21
         PEI   $1F
         JSL   L07721A
         PLA
         STA   $13
         PLX
         STX   $15
         LDA   $13
         ORA   $15
         BNE   L079917
         PEI   $1D
         PEI   $1B
         PEA   $0000
         JSL   L074A24
         PEI   $25
         PEI   $23
         PEA   $0000
         JSL   L074A24
         PHY
         PEI   $25
         PEI   $23
         PEA   $4447
         PEA   $4B42
         JSL   L0751BE
         PLA
         STA   $0D
         BRL   L079A07
L079917  LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         CLC
         ADC   #$0018
         BCC   L079926
         INX
L079926  STA   $27
         STX   $29
         LDA   $23
         LDX   $25
         STA   [$27]
         TXA
         LDY   #$0002
         STA   [$27],Y
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         CLC
         ADC   #$001C
         BCC   L079945
         INX
L079945  STA   $27
         STX   $29
         LDA   $23
         LDX   $25
         STA   [$27]
         TXA
         LDY   #$0002
         STA   [$27],Y
         PEI   $1D
         PEI   $1B
         PEA   $0001
         JSL   L074A24
         PEI   $21
         PEI   $1F
         PEA   $0001
         JSL   L074A24
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         CLC
         ADC   #$000C
         BCC   L07997A
         INX
L07997A  PHX
         PHA
         PEA   $0000
         PEA   $002C
         JSL   L071EC5
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         STA   $01
         STX   $03
         LDA   $1F
         LDX   $21
         LDY   #$0018
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   $1B
         LDX   $1D
         LDY   #$001C
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0004
         STA   $05
         STZ   $07
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         CLC
         ADC   #$0032
         BCC   L0799C4
         INX
L0799C4  INC
         BNE   L0799C8
         INX
L0799C8  STA   $09
         STX   $0B
         LDA   $05
         LDX   $07
         STA   [$09]
         TXA
         LDY   #$0002
         STA   [$09],Y
         PEI   $25
         PEI   $23
         PEA   $0001
         JSL   L074A24
         LDAL  L053AC3
         TAX
         LDAL  L053AC1
         INC
         BNE   L0799F0
         INX
L0799F0  STAL  L053AC1
         TXA
         STAL  L053AC3
         LDA   #$0001
         STA   L05504D
         LDA   $23
         LDX   $25
         STA   $34
         STX   $36
L079A07  LDA   $2E
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

L079A19  ENT
         PHD
         TSC
         CLC
         ADC   #$FF5A
         TCS
         TCD
         STZ   $B4
         STZ   $B6
         PHY
         PHY
         PEA   $0000
         PEA   $0100
         PEA   $4452
         PEA   $4143
         PEA   $0000
         PEA   $0000
         JSL   L07502A
         PLA
         STA   $9D
         PLX
         STX   $9F
         LDA   $9D
         ORA   $9F
         BNE   L079A4C
         BRL   L079BDA
L079A4C  TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0084
         JSL   L071EC5
         LDA   $9D
         LDX   $9F
         STA   $11
         STX   $13
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $B2
         PEI   $B0
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L07B2EC
         PLA
         LSR
         BCS   L079A9C
         PHY
         PEI   $9F
         PEI   $9D
         PEA   $4452
         PEA   $4143
         JSL   L0751BE
         PLA
         STA   $A1
         BRL   L079BDA
L079A9C  PHY
         PHY
         PEI   $9F
         PEI   $9D
         JSL   L0772AE
         PLA
         STA   $99
         PLX
         STX   $9B
         LDA   $99
         ORA   $9B
         BNE   L079AB5
         BRL   L079BDA
L079AB5  LDY   #$0002
         LDA   [$99],Y
         TAX
         LDA   [$99]
         CLC
         ADC   #$000C
         BCC   L079AC4
         INX
L079AC4  PHX
         PHA
         PEA   $0000
         PEA   $002C
         JSL   L071EC5
         LDY   #$0002
         LDA   [$99],Y
         TAX
         LDA   [$99]
         STA   $05
         STX   $07
         LDA   L055005
         LDX   L055007
         LDY   #$001C
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         LDA   $AC
         LDX   $AE
         LDY   #$0020
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         LDA   #$0004
         STA   $09
         STZ   $0B
         LDY   #$0002
         LDA   [$99],Y
         TAX
         LDA   [$99]
         CLC
         ADC   #$0032
         BCC   L079B10
         INX
L079B10  INC
         BNE   L079B14
         INX
L079B14  STA   $0D
         STX   $0F
         LDA   $09
         LDX   $0B
         STA   [$0D]
         TXA
         LDY   #$0002
         STA   [$0D],Y
         PEI   $9F
         PEI   $9D
         PEA   $0001
         JSL   L074A90
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         INC
         BNE   L079B3C
         INX
L079B3C  STAL  L053AC9
         TXA
         STAL  L053ACB
         LDA   #$0001
         STA   L05504D
         PHY
         PHY
         PEI   $AE
         PEI   $AC
         JSL   L07721A
         PLA
         STA   $95
         PLX
         STX   $97
         LDA   $95
         ORA   $97
         BEQ   L079B92
         LDY   #$0002
         LDA   [$95],Y
         TAX
         LDA   [$95]
         STA   $01
         STX   $03
         LDY   #$0016
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         INC
         BNE   L079B7B
         INX
L079B7B  LDY   #$0014
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         PEI   $AE
         PEI   $AC
         PEA   $0001
         JSL   L074A24
         BRA   L079B99
L079B92  PEA   $5DB0
         JSL   L07272E
L079B99  LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDA   $B0
         LDX   $B2
         INC
         BNE   L079BAB
         INX
L079BAB  PHX
         PHA
         PEA   $0001
         JSL   L07E171
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDA   $B0
         LDX   $B2
         CLC
         ADC   #$0002
         BCC   L079BC9
         INX
L079BC9  PHX
         PHA
         PEA   $0001
         JSL   L07E171
         LDA   $9D
         LDX   $9F
         STA   $B4
         STX   $B6
L079BDA  LDA   $AA
         STA   $B2
         LDA   $A9
         STA   $B1
         LDA   $A7
         TCD
         TSC
         CLC
         ADC   #$00B0
         TCS
         RTL

L079BEC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         STZ   $1E
         STZ   $20
         PHY
         PHY
         PEA   $0000
         PEA   $0080
         PEA   $5453
         PEA   $494C
         PEA   $0000
         PEA   $0000
         JSL   L07502A
         PLA
         STA   $09
         PLX
         STX   $0B
         PHY
         PHY
         PEI   $0B
         PEI   $09
         JSL   L0772F8
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BNE   L079C2F
         BRL   L079CB2
L079C2F  LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         CLC
         ADC   #$000C
         BCC   L079C3E
         INX
L079C3E  PHX
         PHA
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         SEC
         SBC   #$000C
         BCS   L079C5B
         DEX
L079C5B  PHX
         PHA
         JSL   L071EC5
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $01
         STX   $03
         LDA   #$0010
         CLC
         ADC   $01
         LDX   $03
         BCC   L079C78
         INX
L079C78  STA   $0D
         STX   $0F
         LDA   $1C
         JSL   L150488
         STA   [$0D]
         TXA
         LDY   #$0002
         STA   [$0D],Y
         LDA   $1A
         LDY   #$0018
         STA   [$01],Y
         LDA   $18
         LDY   #$001C
         STA   [$01],Y
         LDA   $16
         LDY   #$001E
         STA   [$01],Y
         PEI   $0B
         PEI   $09
         PEA   $0001
         JSL   L074AC6
         LDA   $09
         LDX   $0B
         STA   $1E
         STX   $20
L079CB2  LDA   $14
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

L079CC4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC8
         TCS
         TCD
         STZ   $48
         PHY
         PEI   $46
         PEI   $44
         PEA   $0000
         PEA   $0032
         JSL   L07B813
         PLA
         LSR
         BCS   L079CE4
         BRL   L079F14
L079CE4  PHY
         PHY
         PEI   $46
         PEI   $44
         JSL   L077A5B
         PLA
         STA   $31
         PLX
         STX   $33
         PHY
         PHY
         PEI   $33
         PEI   $31
         PEA   $0000
         JSL   L07963D
         PLA
         STA   $1D
         PLX
         STX   $1F
         LDA   $1D
         LDX   $1F
         SEC
         SBC   #$000E
         BCS   L079D12
         DEX
L079D12  STA   $21
         STX   $23
         LDA   $21
         LDX   $23
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         SEC
         SBC   #$0000
         BPL   L079D30
         PEA   $7D8F
         JSL   L07272E
L079D30  LDA   #$7FFF
         CMP   [$07]
         BNE   L079D3A
         BRL   L079F14
L079D3A  LDY   #$0002
         LDA   [$07],Y
         SEC
         SBC   #$7FFF
         BVS   L079D48
         EOR   #$8000
L079D48  BMI   L079D5E
         LDY   #$0002
         LDA   [$07],Y
         INC
         LDY   #$0002
         STA   [$07],Y
         LDY   #$0002
         LDA   [$07],Y
         STA   $13
         BRA   L079DAB
L079D5E  LDA   #$7FFF
         STA   $13
L079D63  LDA   $13
         DEC
         STA   $13
         LDA   $1D
         LDX   $1F
         STA   $19
         STX   $1B
         LDA   [$07]
         STA   $05
         LDA   $05
         SEC
         SBC   #$0001
         BVS   L079D7F
         EOR   #$8000
L079D7F  BPL   L079DAB
         LDA   #$0001
         STA   $15
L079D86  LDY   #$0002
         LDA   $13
         CMP   [$19],Y
         BEQ   L079D63
         PEI   $1B
         PEI   $19
         LDA   [$19]
         JSL   L150488
         JSL   L150F53
         STA   $19
         STX   $1B
         LDA   $15
         CMP   $05
         BEQ   L079DAB
         INC   $15
         BRA   L079D86
L079DAB  PEI   $1F
         PEI   $1D
         LDY   #$0006
         LDA   [$07],Y
         TAX
         DEY
         DEY
         LDA   [$07],Y
         JSL   L150F53
         STA   $19
         STX   $1B
         LDY   #$0006
         LDA   [$07],Y
         TAX
         DEY
         DEY
         LDA   [$07],Y
         CLC
         ADC   #$0032
         BCC   L079DD2
         INX
L079DD2  LDY   #$0004
         STA   [$07],Y
         INY
         INY
         TXA
         STA   [$07],Y
         LDA   [$07]
         INC
         STA   [$07]
         LDA   $19
         LDX   $1B
         STA   $2D
         STX   $2F
         LDA   $2D
         LDX   $2F
         CLC
         ADC   #$0032
         BCC   L079DF4
         INX
L079DF4  STA   $29
         STX   $2B
         LDY   #$0002
         LDA   [$31],Y
         PHA
         LDA   [$31]
         PHA
         LDY   #$0002
         LDA   [$31],Y
         TAX
         LDA   [$31]
         STA   $35
         STX   $37
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         JSL   L150F53
         STA   $25
         STX   $27
         PEI   $2F
         PEI   $2D
         PEI   $2B
         PEI   $29
         PEI   $27
         PEI   $25
         LDA   $29
         LDX   $2B
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         PEI   $1B
         PEI   $19
         PEA   $0000
         PEA   $0032
         JSL   L071EC5
         LDA   $42
         STA   $17
         LDA   $19
         LDX   $1B
         STA   $01
         STX   $03
         LDA   #$0032
         STA   [$01]
         LDA   $13
         LDY   #$0002
         STA   [$01],Y
         LDA   $17
         LDY   #$0004
         STA   [$01],Y
         LDA   #$0008
         LDY   #$001C
         STA   [$01],Y
         LDA   #$0000
         LDY   #$001E
         STA   [$01],Y
         LDA   #$0009
         LDY   #$0020
         STA   [$01],Y
         LDA   $17
         DEC
         BNE   L079E93
         LDA   #$0001
         LDY   #$0018
         STA   [$01],Y
         LDA   #$0000
         LDY   #$001A
         STA   [$01],Y
         BRA   L079EA9
L079E93  LDA   $17
         DEC
         DEC
         BNE   L079EA9
         LDA   #$0000
         LDY   #$0018
         STA   [$01],Y
         LDA   #$FFFE
         LDY   #$001A
         STA   [$01],Y
L079EA9  LDA   $17
         DEC
         BNE   L079ECC
         LDA   #$0022
         CLC
         ADC   $01
         LDX   $03
         BCC   L079EB9
         INX
L079EB9  CLC
         ADC   #$0003
         BCC   L079EC0
         INX
L079EC0  STA   $35
         STX   $37
         SEP   #$20
         LDA   #$0F
         STA   [$35]
         REP   #$20
L079ECC  LDA   #$0004
         STA   $0B
         STZ   $0D
         LDA   $19
         LDX   $1B
         CLC
         ADC   #$002A
         BCC   L079EDE
         INX
L079EDE  CLC
         ADC   #$0002
         BCC   L079EE5
         INX
L079EE5  STA   $0F
         STX   $11
         LDA   $0B
         LDX   $0D
         STA   [$0F]
         TXA
         LDY   #$0002
         STA   [$0F],Y
         PEI   $40
         PEI   $3E
         PEI   $1B
         PEI   $19
         PEA   $002A
         JSL   L0313BE
         LDA   #$0001
         STA   $48
         PEI   $46
         PEI   $44
         PEA   $0001
         JSL   L074E4D
L079F14  LDA   $3C
         STA   $46
         LDA   $3B
         STA   $45
         LDA   $39
         TCD
         TSC
         CLC
         ADC   #$0044
         TCS
         RTL

L079F26  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCA
         TCS
         TCD
         STZ   $44
         LDA   L055051
         BEQ   L079F38
         BRL   L07A1E5
L079F38  PEI   $3E
         PEI   $3C
         LDA   #$0000
         TAX
         JSL   L033477
         BEQ   L079F48
         BPL   L079F4B
L079F48  BRL   L07A1E5
L079F4B  PHY
         PHY
         PEI   $42
         PEI   $40
         JSL   L0772F8
         PLA
         STA   $2F
         PLX
         STX   $31
         LDA   $2F
         ORA   $31
         BNE   L079F64
         BRL   L07A1E5
L079F64  PHY
         PEI   $31
         PEI   $2F
         JSL   L0718FA
         PLA
         STA   $09
         PEI   $3E
         PEI   $3C
         LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         CLC
         ADC   #$0014
         BCC   L079F83
         INX
L079F83  STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         JSL   L033477
         BEQ   L079F9F
         BVS   L079F9A
         EOR   #$8000
L079F9A  BPL   L079F9F
         BRL   L07A1D0
L079F9F  LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         CLC
         ADC   #$0028
         BCC   L079FAE
         INX
L079FAE  STA   $23
         STX   $25
         LDA   $3C
         LDX   $3E
         STA   $2B
         STX   $2D
L079FBA  PEI   $2D
         PEI   $2B
         LDY   #$0004
         LDA   [$23],Y
         JSL   L150488
         JSL   L033477
         BEQ   L079FFA
         BVS   L079FD2
         EOR   #$8000
L079FD2  BPL   L079FFA
         PEI   $2D
         PEI   $2B
         LDY   #$0004
         LDA   [$23],Y
         JSL   L150488
         JSL   L1512A5
         STA   $2B
         STX   $2D
         LDA   $23
         LDX   $25
         CLC
         ADC   #$0006
         BCC   L079FF4
         INX
L079FF4  STA   $23
         STX   $25
         BRA   L079FBA
L079FFA  LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $1F
         STX   $21
         LDY   #$0004
         LDA   [$23],Y
         DEC
         BEQ   L07A011
         BRL   L07A0C2
L07A011  PHY
         PEI   $21
         PEI   $1F
         PEA   $4547
         PEA   $4150
         JSL   L0751BE
         PLA
         LSR
         BCS   L07A027
         BRL   L07A1D0
L07A027  LDA   $23
         LDX   $25
         STA   $0F
         STX   $11
         LDA   $0F
         LDX   $11
         CLC
         ADC   #$0006
         BCC   L07A03A
         INX
L07A03A  STA   $13
         STX   $15
         LDY   #$0002
         LDA   [$2F],Y
         PHA
         LDA   [$2F]
         PHA
         LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]

*

         JSL   L150F53
         STA   $0B
         STX   $0D
         PEI   $15
         PEI   $13
         PEI   $11
         PEI   $0F
         PEI   $0D
         PEI   $0B
         LDA   $13
         LDX   $15
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         LDA   $0B
         LDX   $0D
         SEC
         SBC   #$0006
         BCS   L07A088
         DEX
L07A088  STA   $0F
         STX   $11
         PEI   $11
         PEI   $0F
         PEA   $0000
         PEA   $0006
         JSL   L071EC5
         LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         STA   $05
         STX   $07
         LDY   #$000E
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         TAY
         BNE   L07A0B4
         DEX
L07A0B4  DEC
         LDY   #$000C
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         BRL   L07A1A6
L07A0C2  PHY
         PHY
         PEI   $21
         PEI   $1F
         JSL   L077A01
         PLA
         STA   $1B
         PLX
         STX   $1D
         LDA   $1B
         ORA   $1D
         BNE   L07A0DB
         BRL   L07A1D0
L07A0DB  LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         CLC
         ADC   #$0018
         BCC   L07A0EA
         INX
L07A0EA  STA   $33
         STX   $35
         LDA   [$33]
         JSL   L150488
         STA   $27
         STX   $29
         LDA   $2B
         LDX   $2D
         PEI   $29
         PEI   $27
         JSL   L150D50
         PLA
         PLX
         CLC
         ADC   #$0018
         BCC   L07A10D
         INX
L07A10D  STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         PEI   $19
         PEI   $17
         JSL   L150F53
         STA   $13
         STX   $15
         PEI   $15
         PEI   $13
         LDA   $27
         LDX   $29
         JSL   L1512A5
         STA   $0F
         STX   $11
         LDY   #$0002
         LDA   [$1B],Y
         PHA
         LDA   [$1B]
         PHA
         LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         STA   $33
         STX   $35
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         JSL   L150F53
         STA   $0B
         STX   $0D
         PEI   $15
         PEI   $13
         PEI   $11
         PEI   $0F
         PEI   $0D
         PEI   $0B
         LDA   $13
         LDX   $15
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         PEI   $0D
         PEI   $0B
         LDA   $27
         LDX   $29
         JSL   L1512A5
         STA   $0F
         STX   $11
         PEI   $11
         PEI   $0F
         PEI   $29
         PEI   $27
         JSL   L071EC5
         LDY   #$0004
         LDA   [$23],Y
         DEC
         LDY   #$0004
         STA   [$23],Y
         PEI   $21
         PEI   $1F
         PEA   $0001
         JSL   L074E17
L07A1A6  LDY   #$0002
         LDA   [$2F],Y
         TAX
         LDA   [$2F]
         STA   $01
         STX   $03
         LDY   #$0016
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         TAY
         BNE   L07A1C0
         DEX
L07A1C0  DEC
         LDY   #$0014
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0001
         STA   $44
L07A1D0  PEI   $31
         PEI   $2F
         PEI   $09
         JSL   L0718DA
         PEI   $42
         PEI   $40
         PEA   $0001
         JSL   L074AC6
L07A1E5  LDA   $3A
         STA   $42
         LDA   $39
         STA   $41
         LDA   $37
         TCD
         TSC
         CLC
         ADC   #$0040
         TCS
         RTL

L07A1F7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         STZ   $24
         LDA   L055051
         BEQ   L07A209
         BRL   L07A2DE
L07A209  PHY
         PHY
         PEI   $22
         PEI   $20
         JSL   L0772F8
         PLA
         STA   $13
         PLX
         STX   $15
         LDA   $13
         ORA   $15
         BNE   L07A222
         BRL   L07A2DE
L07A222  LDA   #$0001
         STA   $01
         LDA   #$0028
         LDX   #$0000
         STA   $07
         STX   $09
         LDA   #$0001
         LDX   #$0000
         STA   $0F
         STX   $11
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         CLC
         ADC   #$000C
         BCC   L07A24A
         INX
L07A24A  STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         STA   $0B
         STX   $0D
L07A25A  PEI   $11
         PEI   $0F
         LDA   $0B
         LDX   $0D
         JSL   L033477
         BEQ   L07A26F
         BVS   L07A26D
         EOR   #$8000
L07A26D  BMI   L07A2BA
L07A26F  LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         PEI   $09
         PEI   $07
         JSL   L150F53
         STA   $03
         STX   $05
         PHY
         LDY   #$0002
         LDA   [$03],Y
         PHA
         LDA   [$03]
         PHA
         PEA   $4547
         PEA   $4150
         JSL   L0751BE
         PLA
         LSR
         BCS   L07A29D
         STZ   $01
L07A29D  LDA   $07
         LDX   $09
         CLC
         ADC   #$0006
         BCC   L07A2A8
         INX
L07A2A8  STA   $07
         STX   $09
         LDA   $0F
         LDX   $11
         INC
         BNE   L07A2B4
         INX
L07A2B4  STA   $0F
         STX   $11
         BRA   L07A25A
L07A2BA  PEI   $22
         PEI   $20
         PEA   $0000
         JSL   L074AC6
         PEI   $01
         PHY
         PEI   $22
         PEI   $20
         PEA   $5453
         PEA   $494C
         JSL   L0751BE
         PLA
         STA   $17
         PLA
         AND   $17
         STA   $24
L07A2DE  LDA   $1E
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

L07A2F0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE2
         TCS
         TCD
         STZ   $2A
         PHY
         PHY
         PEI   $28
         PEI   $26
         JSL   L077A5B
         PLA
         STA   $17
         PLX
         STX   $19
         LDA   $17
         ORA   $19
         BNE   L07A313
         BRL   L07A3D6
L07A313  PHY
         PHY
         PEI   $19
         PEI   $17
         PEI   $24
         JSL   L0791A7
         PLA
         STA   $13
         PLX
         STX   $15
         LDA   $13
         ORA   $15
         BNE   L07A32E
         BRL   L07A3CB
L07A32E  LDA   [$13]
         STA   $05
         LDA   L055059
         LDX   L05505B
         STA   $01
         STX   $03
         LDA   [$01]
         DEC
         STA   [$01]
         LDA   #$0004
         CLC
         ADC   $01
         LDX   $03
         BCC   L07A34C
         INX
L07A34C  STA   $1B
         STX   $1D
         LDY   #$0006
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   $05
         JSL   L150488
         JSL   L1512A5
         STA   [$1B]
         TXA
         LDY   #$0002
         STA   [$1B],Y
         LDA   $13
         LDX   $15
         STA   $0B
         STX   $0D
         PEI   $0D
         PEI   $0B
         LDA   $05
         JSL   L150488
         JSL   L150F53
         STA   $0F
         STX   $11
         LDY   #$0002
         LDA   [$17],Y
         PHA
         LDA   [$17]
         PHA
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         STA   $1B
         STX   $1D
         LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         JSL   L150F53
         STA   $07
         STX   $09
         PEI   $11
         PEI   $0F
         PEI   $0D
         PEI   $0B
         PEI   $09
         PEI   $07
         LDA   $0F
         LDX   $11
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         LDA   #$0001
         STA   $2A
L07A3CB  PEI   $28
         PEI   $26
         PEA   $0001
         JSL   L074E4D
L07A3D6  LDA   $22
         STA   $28
         LDA   $21
         STA   $27
         LDA   $1F
         TCD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL

L07A3E8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         STZ   $22
         STZ   $24
         LDAL  L053AC7
         TAX
         LDAL  L053AC5
         STA   $11
         STX   $13
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
         BVS   L07A421
         EOR   #$8000
L07A421  BPL   L07A49F
         LDA   #$0001
         LDX   #$0000
         STA   $05
         STX   $07
L07A42D  LDA   $1E
         LDX   $20
         CMP   $11
         BNE   L07A437
         CPX   $13
L07A437  BNE   L07A443
         LDA   $05
         LDX   $07
         STA   $22
         STX   $24
         BRA   L07A49F
L07A443  PHY
         PHY
         PEI   $13
         PEI   $11
         JSL   L07721A
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   $09
         ORA   $0B
         BEQ   L07A49F
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$0018
         BCC   L07A468
         INX
L07A468  STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $0D
         STX   $0F
         PEI   $13
         PEI   $11
         PEA   $0000
         JSL   L074A24
         LDA   $0D
         LDX   $0F
         STA   $11
         STX   $13
         LDA   $05
         LDX   $07
         CMP   $01
         BNE   L07A495
         CPX   $03
L07A495  BEQ   L07A49F
         INC   $05
         BNE   L07A49D
         INC   $07
L07A49D  BRA   L07A42D
L07A49F  LDA   $1C
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

L07A4B1  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         STZ   $3A
         PEI   $34
         PEI   $32
         LDA   #$0000
         TAX
         JSL   L033477
         BEQ   L07A4CB
         BPL   L07A4CE
L07A4CB  BRL   L07A5F7
L07A4CE  PHY
         PHY
         PEI   $38
         PEI   $36
         JSL   L0772F8
         PLA
         STA   $21
         PLX
         STX   $23
         LDA   $21
         ORA   $23
         BNE   L07A4E7
         BRL   L07A5F7
L07A4E7  LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         STA   $01
         STX   $03
         PEI   $34
         PEI   $32
         LDY   #$0016
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L033477
         BEQ   L07A511
         BVS   L07A50C
         EOR   #$8000
L07A50C  BPL   L07A511
         BRL   L07A5EC
L07A511  LDY   #$0018
         LDA   [$01],Y
         JSL   L150488
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         CLC
         ADC   #$0028
         BCC   L07A52D
         INX
L07A52D  STA   $19
         STX   $1B
         LDA   $32
         LDX   $34
         STA   $1D
         STX   $1F
L07A539  PEI   $1F
         PEI   $1D
         LDY   #$0004
         LDA   [$19],Y
         JSL   L150488
         JSL   L033477
         BEQ   L07A579
         BVS   L07A551
         EOR   #$8000
L07A551  BPL   L07A579
         PEI   $1F
         PEI   $1D
         LDY   #$0004
         LDA   [$19],Y
         JSL   L150488
         JSL   L1512A5
         STA   $1D
         STX   $1F
         LDA   $19
         LDX   $1B
         CLC
         ADC   #$0006
         BCC   L07A573
         INX
L07A573  STA   $19
         STX   $1B
         BRA   L07A539
L07A579  LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         STA   $15
         STX   $17
         PHY
         PHY
         PEI   $17
         PEI   $15
         JSL   L077A01
         PLA
         STA   $11
         PLX
         STX   $13
         LDA   $11
         ORA   $13
         BEQ   L07A5EC
         LDX   $1F
         LDA   $1D
         BNE   L07A5A2
         DEX
L07A5A2  DEC
         PEI   $07
         PEI   $05
         JSL   L150D50
         PLA
         PLX
         CLC
         ADC   #$0018
         BCC   L07A5B4
         INX
L07A5B4  STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         PEI   $0F
         PEI   $0D
         JSL   L150F53
         STA   $09
         STX   $0B
         PEI   $0B
         PEI   $09
         PEI   $30
         PEI   $2E
         PEI   $07
         PEI   $05
         JSL   L070597
         LDA   #$0001
         STA   $3A
         PEI   $17
         PEI   $15
         PEA   $0000
         JSL   L074E17
L07A5EC  PEI   $38
         PEI   $36
         PEA   $0000
         JSL   L074AC6
L07A5F7  LDA   $2C
         STA   $38
         LDA   $2B
         STA   $37
         LDA   $29
         TCD
         TSC
         CLC
         ADC   #$0036
         TCS
         RTL

L07A609  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         STZ   $2A
         STZ   $13
         STZ   $15
         STZ   $0F
         STZ   $11
         PHY
         PHY
         PEI   $24
         PEI   $22
         JSL   L0772AE
         PLA
         STA   $13
         PLX
         STX   $15
         LDA   $13
         ORA   $15
         BNE   L07A634
         BRL   L07A6E7
L07A634  PHY
         PHY
         PEI   $28
         PEI   $26
         JSL   L07721A
         PLA
         STA   $0F
         PLX
         STX   $11
         LDA   $0F
         ORA   $11
         BNE   L07A64D
         BRL   L07A6E7
L07A64D  LDX   #$0000
         LDA   $20
         BPL   L07A655
         INX
L07A655  TXA
         STA   $0D
         LDA   $0D
         BEQ   L07A677
         PHY
         PHY
         PEI   $15
         PEI   $13
         LDA   $20
         EOR   #$FFFF
         INC
         PHA
         JSL   L0791A7
         PLA
         STA   $05
         PLX
         STX   $07
         STZ   $0B
         BRA   L07A69D
L07A677  PHY
         PHY
         PEI   $11
         PEI   $0F
         PEI   $20
         JSL   L0791A7
         PLA
         STA   $05
         PLX
         STX   $07
         LDX   #$0000
         LDY   #$0004
         LDA   #$4000
         AND   [$05],Y
         CMP   #$0000
         BEQ   L07A69A
         INX
L07A69A  TXA
         STA   $0B
L07A69D  LDA   $0B
         ORA   $0D
         STA   $09
         LDA   $09
         BEQ   L07A6BD
         LDX   #$0000
         LDY   #$000E
         LDA   #$4000
         AND   [$05],Y
         CMP   #$0000
         BEQ   L07A6B8
         INX
L07A6B8  TXA
         STA   $2A
         BRA   L07A6E7
L07A6BD  PHY
         PHY
         PEI   $11
         PEI   $0F
         PEI   $15
         PEI   $13
         PEI   $20
         PEI   $0B
         JSL   L07B038
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L07A6E7
         LDA   #$0081
         CMP   [$01]
         BNE   L07A6E7
         LDA   #$0001
         STA   $2A
L07A6E7  LDA   $0F
         ORA   $11
         BEQ   L07A6F8
         PEI   $28
         PEI   $26
         PEA   $0000
         JSL   L074A24
L07A6F8  LDA   $13
         ORA   $15
         BEQ   L07A709
         PEI   $24
         PEI   $22
         PEA   $0000
         JSL   L074A90
L07A709  LDA   $1E
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

L07A71B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFDC
         TCS
         TCD
         STZ   $3A
         LDA   #$0000
         STA   [$2A]
         PHY
         PHY
         PEI   $32
         PEI   $30
         JSL   L07721A
         PLA
         STA   $19
         PLX
         STX   $1B
         LDA   $19
         ORA   $1B
         BNE   L07A743
         BRL   L07A840
L07A743  PHY
         PHY
         PEI   $36
         PEI   $34
         JSL   L0772AE
         PLA
         STA   $1D
         PLX
         STX   $1F
         LDA   $1D
         ORA   $1F
         BNE   L07A75C
         BRL   L07A835
L07A75C  LDA   $2E
         BEQ   L07A76A
         LDA   $19
         LDX   $1B
         STA   $15
         STX   $17
         BRA   L07A772
L07A76A  LDA   $1D
         LDX   $1F
         STA   $15
         STX   $17
L07A772  LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $03
         STX   $05
         PHY
         PHY
         PEI   $17
         PEI   $15
         PEA   $0000
         JSL   L07963D
         PLA
         STA   $11
         PLX
         STX   $13
         LDA   $11
         LDX   $13
         SEC
         SBC   #$000E
         BCS   L07A79C
         DEX
L07A79C  STA   $0D
         STX   $0F
         STZ   $07
         LDA   [$0D]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L07A7B1
         EOR   #$8000
L07A7B1  BPL   L07A82A
         LDA   #$0001
         STA   $0B
L07A7B8  LDY   #$0004
         LDA   #$000F
         AND   [$11],Y
         DEC
         BNE   L07A80E
         LDA   $07
         INC
         STA   $07
         LDY   #$0004
         LDA   #$00F0
         AND   [$11],Y
         PHA
         PEA   $0004
         JSL   L1510EF
         PLA
         CMP   $38
         BNE   L07A80E
         LDA   #$0001
         STA   [$2A]
         LDY   #$0002
         LDA   [$11],Y
         STA   $09
         LDA   $2E
         BNE   L07A7F5
         LDA   $09
         EOR   #$FFFF
         INC
         STA   $09
L07A7F5  PHY
         PEI   $32
         PEI   $30
         PEI   $36
         PEI   $34
         PEI   $09
         JSL   L07A609
         PLA
         LSR
         BCC   L07A80E
         LDA   $07
         STA   $3A
         BRA   L07A82A
L07A80E  PEI   $13
         PEI   $11
         LDA   [$11]
         JSL   L150488
         JSL   L150F53
         STA   $11
         STX   $13
         LDA   $0B
         CMP   $01
         BEQ   L07A82A
         INC   $0B
         BRA   L07A7B8
L07A82A  PEI   $36
         PEI   $34
         PEA   $0000
         JSL   L074A90
L07A835  PEI   $32
         PEI   $30
         PEA   $0000
         JSL   L074A24
L07A840  LDA   $28
         STA   $38
         LDA   $27
         STA   $37
         LDA   $25
         TCD
         TSC
         CLC
         ADC   #$0036
         TCS
         RTL

L07A852  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   $16
         PHY
         PHY
         PEI   $14
         PEI   $12
         JSL   L0772F8
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L07A897
         PEI   $10
         PEI   $0E
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         PEA   $0028
         JSL   L0313BE
         PEI   $14
         PEI   $12
         PEA   $0000
         JSL   L074AC6
         LDA   #$0001
         STA   $16
L07A897  LDA   $0C
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

L07A8A9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         STZ   $1E
         STZ   $20
         PHY
         PHY
         PEI   $1C
         PEI   $1A
         JSL   L0772F8
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BNE   L07A8CE
         BRL   L07A960
L07A8CE  LDX   #$0000
         LDA   $18
         BMI   L07A8DA
         ORA   $16
         BEQ   L07A8DA
         INX
L07A8DA  TXA
         PHA
         PEI   $18
         PEI   $16
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         CLC
         ADC   #$000C
         BCC   L07A8EF
         INX
L07A8EF  STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         JSL   L033477
         BEQ   L07A908
         BVS   L07A906
         EOR   #$8000
L07A906  BPL   L07A90D
L07A908  LDA   #$0000
         BRA   L07A910
L07A90D  LDA   #$0001
L07A910  AND   $01,S
         PLX
         LSR
         BCC   L07A955
         LDX   $18
         LDA   $16
         BNE   L07A91D
         DEX
L07A91D  DEC
         PEA   $0000
         PEA   $0006
         JSL   L150D50
         PLA
         STA   $01
         PLX
         STX   $03
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         CLC
         ADC   #$0028
         BCC   L07A93D
         INX
L07A93D  PEI   $03
         PEI   $01
         JSL   L150F53
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $1E
         STX   $20
L07A955  PEI   $1C
         PEI   $1A
         PEA   $0000
         JSL   L074AC6
L07A960  LDA   $14
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

L07A972  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         PHY
         PHY
         PEI   $26
         PEI   $24
         JSL   L077A5B
         PLA
         STA   $0F
         PLX
         STX   $11
         LDA   #L041CB3
         LDX   #^L041CB3
         STA   $01
         STX   $03
         PHY
         PHY
         PEI   $11
         PEI   $0F
         PEA   $0002
         JSL   L07963D
         PLA
         STA   $07
         PLX
         STX   $09
         LDA   $07
         ORA   $09
         BNE   L07A9B4
         LDA   #$0000
         STA   [$20]
         BRA   L07AA16
L07A9B4  LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         STA   $0B
         STX   $0D
         LDY   #$0006
         LDA   [$0B],Y
         TAX
         DEY
         DEY
         LDA   [$0B],Y
         CMP   #$4143
         BNE   L07A9D2
         CPX   #$4452
L07A9D2  BNE   L07A9F0
         LDY   #$0010
         LDA   [$0B],Y
         STA   $05
         LDA   #$1000
         AND   $05
         BEQ   L07A9E5
         LDA   #$0001
L07A9E5  STA   [$20]
         LDA   #$0400
         AND   $05
         STA   $05
         BRA   L07AA0A
L07A9F0  LDY   #$0010
         LDA   [$0B],Y
         STA   $05
         LDA   #$1000
         AND   $05
         BEQ   L07AA01
         LDA   #$0001
L07AA01  STA   [$20]
         LDA   #$0400
         AND   $05
         STA   $05
L07AA0A  LDA   $05
         BEQ   L07AA16
         LDA   $07
         LDX   $09
         STA   $01
         STX   $03
L07AA16  PEI   $03
         PEI   $01
         PEI   $1E
         PEI   $1C
         PEA   $0000
         PEA   $0020
         JSL   L070597
         LDA   $0F
         ORA   $11
         BEQ   L07AA39
         PEI   $26
         PEI   $24
         PEA   $0000
         JSL   L074E4D
L07AA39  LDA   $1A
         STA   $26
         LDA   $19
         STA   $25
         LDA   $17
         TCD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L07AA4B  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF4
         TCS
         ADC   #$0019
         TCD
         LDAL  L040A2E
         SEP   #$20
         STA   [$FC]
         REP   #$20
         PHY
         PHY
         PEI   $FA
         PEI   $F8
         JSL   L077A5B
         PLA
         STA   $EB
         PLX
         STX   $ED
         LDA   $EB
         ORA   $ED
         BEQ   L07AAB9
         PHY
         PHY
         PEI   $ED
         PEI   $EB
         PEA   $0003
         JSL   L07963D
         PLA
         STA   $E7
         PLX
         STX   $E9
         PEI   $E9
         PEI   $E7
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         JSL   L071FF8
         PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         PEA   $0100
         JSL   L0313BE
         PEI   $FA
         PEI   $F8
         PEA   $0000
         JSL   L074E4D
L07AAB9  LDA   $F6
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

L07AACB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         STZ   $24
         STZ   $26
         PHY
         PHY
         PEI   $22
         PEI   $20
         JSL   L077A5B
         PLA
         STA   $13
         PLX
         STX   $15
         LDA   $13
         ORA   $15
         BNE   L07AAF0
         BRL   L07AB9C
L07AAF0  PHY
         PHY
         PEI   $15
         PEI   $13
         PEA   $0004
         JSL   L07963D
         PLA
         STA   $07
         PLX
         STX   $09
         PEI   $09
         PEI   $07
         LDA   [$07]
         JSL   L150488
         JSL   L150F53
         STA   $07
         STX   $09
         PEI   $09
         PEI   $07
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         JSL   L1512A5
         STA   $03
         STX   $05
         PHY
         PHY
         PEI   $09
         PEI   $07
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L07AB39
         INX
L07AB39  STA   $0F
         STX   $11
         PHY
         PHY
         PEI   $11
         PEI   $0F
         LDA   L055019
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $0B
         PLX
         STX   $0D
         LDAL  L05565D
         BNE   L07AB91
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         PEI   $05
         PEI   $03
         JSL   L150F53
         STA   $07
         STX   $09
         PEI   $09
         PEI   $07
         LDY   #$0002
         LDA   [$0B],Y
         PHA
         LDA   [$0B]
         PHA
         PEI   $11
         PEI   $0F
         JSL   L070597
         LDA   $0B
         LDX   $0D
         STA   $24
         STX   $26
L07AB91  PEI   $22
         PEI   $20
         PEA   $0000
         JSL   L074E4D
L07AB9C  LDA   $1E
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

L07ABAE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         STZ   $1C
         PHY
         PHY
         PEI   $1A
         PEI   $18
         JSL   L077A5B
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L07AC05
         PHY
         PHY
         PEI   $03
         PEI   $01
         PEI   $16
         JSL   L0791A7
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BEQ   L07ABFA
         PEI   $14
         PEI   $12
         PEI   $07
         PEI   $05
         PEA   $002A
         JSL   L0313BE
         LDA   #$0001
         STA   $1C
L07ABFA  PEI   $1A
         PEI   $18
         PEA   $0000
         JSL   L074E4D
L07AC05  LDA   $10
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

L07AC17  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         STZ   $24
         LDA   $1E
         BEQ   L07AC27
         BPL   L07AC2A
L07AC27  BRL   L07ACDE
L07AC2A  PHY
         PHY
         PEI   $22
         PEI   $20
         JSL   L077A5B
         PLA
         STA   $0F
         PLX
         STX   $11
         LDA   $0F
         ORA   $11
         BNE   L07AC43
         BRL   L07ACDE
L07AC43  PHY
         PHY
         PEI   $11
         PEI   $0F
         PEA   $0000
         JSL   L07963D
         PLA
         STA   $0B
         PLX
         STX   $0D
         LDA   $0B
         ORA   $0D
         BEQ   L07ACD3
         LDA   $0B
         LDX   $0D
         SEC
         SBC   #$000E
         BCS   L07AC67
         DEX
L07AC67  STA   $07
         STX   $09
         STZ   $03
         LDA   [$07]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L07AC7C
         EOR   #$8000
L07AC7C  BPL   L07ACD3
         LDA   #$0001
         STA   $05
L07AC83  LDX   #$0000
         LDY   #$0004
         LDA   #$000F
         AND   [$0B],Y
         CMP   $1C
         BNE   L07AC93
         INX
L07AC93  PHX
         LDX   #$0000
         LDA   $1C
         BNE   L07AC9C
         INX
L07AC9C  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L07ACB7
         LDA   $03
         INC
         STA   $03
         LDA   $1E
         CMP   $03
         BNE   L07ACB7
         LDY   #$0002
         LDA   [$0B],Y
         STA   $24
         BRA   L07ACD3
L07ACB7  PEI   $0D
         PEI   $0B
         LDA   [$0B]
         JSL   L150488
         JSL   L150F53
         STA   $0B
         STX   $0D
         LDA   $05
         CMP   $01
         BEQ   L07ACD3
         INC   $05
         BRA   L07AC83
L07ACD3  PEI   $22
         PEI   $20
         PEA   $0000
         JSL   L074E4D
L07ACDE  LDA   $1A
         STA   $22
         LDA   $19
         STA   $21
         LDA   $17
         TCD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L07ACF0  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF0
         TCS
         ADC   #$001F
         TCD
         LDAL  L040A2F
         SEP   #$20
         STA   [$FC]
         REP   #$20
         PHY
         PHY
         PEI   $FA
         PEI   $F8
         JSL   L077A5B
         PLA
         STA   $E9
         PLX
         STX   $EB
         LDA   $E9
         ORA   $EB
         BEQ   L07AD72
         PHY
         PHY
         PEI   $EB
         PEI   $E9
         PEI   $F6
         JSL   L0791A7
         PLA
         STA   $E1
         PLX
         STX   $E3
         LDA   $E1
         ORA   $E3
         BEQ   L07AD67
         LDA   $E1
         LDX   $E3
         CLC
         ADC   #$002A
         BCC   L07AD3E
         INX
L07AD3E  STA   $E5
         STX   $E7
         PEI   $E7
         PEI   $E5
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE1
         PHA
         JSL   L071FF8
         PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE1
         PHA
         PEA   $0100
         JSL   L0313BE
L07AD67  PEI   $FA
         PEI   $F8
         PEA   $0000
         JSL   L074E4D
L07AD72  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0118
         TCS
         RTL

L07AD84  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         STZ   $26
         PHY
         PHY
         PEI   $24
         PEI   $22
         JSL   L077A5B
         PLA
         STA   $11
         PLX
         STX   $13
         LDA   $11
         ORA   $13
         BNE   L07ADA7
         BRL   L07AE56
L07ADA7  PHY
         PHY
         PEI   $13
         PEI   $11
         PEI   $20
         JSL   L0791A7
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDA   $0D
         ORA   $0F
         BNE   L07ADC2
         BRL   L07AE4B
L07ADC2  LDY   #$0004
         LDA   #$000F
         AND   [$0D],Y
         STA   $03
         PHY
         PHY
         PEI   $13
         PEI   $11
         PEA   $0000
         JSL   L07963D
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDA   $0D
         LDX   $0F
         SEC
         SBC   #$000E
         BCS   L07ADEA
         DEX
L07ADEA  STA   $09
         STX   $0B
         STZ   $05
         LDA   [$09]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L07ADFF
         EOR   #$8000
L07ADFF  BPL   L07AE4B
         LDA   #$0001
         STA   $07
L07AE06  LDX   #$0000
         LDY   #$0004
         LDA   #$000F
         AND   [$0D],Y
         CMP   $03
         BNE   L07AE16
         INX
L07AE16  TXA
         ORA   $1E
         BEQ   L07AE2F
         LDA   $05
         INC
         STA   $05
         LDY   #$0002
         LDA   $20
         CMP   [$0D],Y
         BNE   L07AE2F
         LDA   $05
         STA   $26
         BRA   L07AE4B
L07AE2F  PEI   $0F
         PEI   $0D
         LDA   [$0D]
         JSL   L150488
         JSL   L150F53
         STA   $0D
         STX   $0F
         LDA   $07
         CMP   $01
         BEQ   L07AE4B
         INC   $07
         BRA   L07AE06
L07AE4B  PEI   $24
         PEI   $22
         PEA   $0000
         JSL   L074E4D
L07AE56  LDA   $1C
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

L07AE68  ENT
         PHD
         TSC
         CLC
         ADC   #$FECE
         TCS
         ADC   #$0041
         TCD
         STZ   $FC
         STZ   $FE
         PHY
         PEI   $FA
         PEI   $F8
         PEI   $F6
         TDC
         CLC
         ADC   #$00C3
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBF
         PHA
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         JSL   L07DFBC
         PLA
         LSR
         BCC   L07AEA9
         LDA   $BF
         LDX   $C1
         STA   $FC
         STX   $FE
L07AEA9  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$013A
         TCS
         RTL

L07AEBB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         STZ   $2E
         STZ   $30
         LDA   $24
         BNE   L07AECE
         BRL   L07B026
L07AECE  LDX   #$0000
         LDA   $24
         BPL   L07AED6
         INX
L07AED6  TXA
         PHA
         LDA   $22
         EOR   #$0001
         ORA   $01,S
         PLX
         STA   $17
         LDA   $17
         BEQ   L07AF11
         STZ   $13
         STZ   $15
         PHY
         PHY
         PEI   $2C
         PEI   $2A
         JSL   L0772AE
         PLA
         STA   $0F
         PLX
         STX   $11
         LDA   $0F
         ORA   $11
         BNE   L07AF03
         BRL   L07B026
L07AF03  PHY
         PEI   $11
         PEI   $0F
         JSL   L0718FA
         PLA
         STA   $0D
         BRA   L07AF3A
L07AF11  STZ   $0F
         STZ   $11
         PHY
         PHY
         PEI   $28
         PEI   $26
         JSL   L07721A
         PLA
         STA   $13
         PLX
         STX   $15
         LDA   $13
         ORA   $15
         BNE   L07AF2E
         BRL   L07B026
L07AF2E  PHY
         PEI   $15
         PEI   $13
         JSL   L0718FA
         PLA
         STA   $0D
L07AF3A  PHY
         PHY
         PEI   $15
         PEI   $13
         PEI   $11
         PEI   $0F
         PEI   $24
         PEI   $22
         JSL   L07B038
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   $09
         ORA   $0B
         BNE   L07AF9B
         PHY
         PHY
         PEA   $0000
         PEA   $0001
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $01
         PLX
         STX   $03
         LDAL  L05565D
         BNE   L07AF99
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $19
         STX   $1B
         SEP   #$20
         LDA   #$00
         STA   [$19]
         REP   #$20
         LDA   $01
         LDX   $03
         STA   $2E
         STX   $30
L07AF99  BRA   L07AFF6
L07AF9B  PHY
         PHY
         PHY
         PHY
         PEI   $0B
         PEI   $09
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L07AFAD
         INX
L07AFAD  PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $01
         PLX
         STX   $03
         LDAL  L05565D
         BNE   L07AFF6
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $05
         STX   $07
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L070669
         LDA   $01
         LDX   $03
         STA   $2E
         STX   $30
L07AFF6  LDA   $17
         BEQ   L07B011
         PEI   $11
         PEI   $0F
         PEI   $0D
         JSL   L0718DA
         PEI   $2C
         PEI   $2A
         PEA   $0000
         JSL   L074A90
         BRA   L07B026
L07B011  PEI   $15
         PEI   $13
         PEI   $0D
         JSL   L0718DA
         PEI   $28
         PEI   $26
         PEA   $0000
         JSL   L074A24
L07B026  LDA   $20
         STA   $2C
         LDA   $1F
         STA   $2B
         LDA   $1D
         TCD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L07B038  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         STZ   $26
         STZ   $28
         LDA   $1A
         BEQ   L07B06A
         LDA   $22
         ORA   $24
         BNE   L07B055
         PEA   $26E9
         JSL   L07272E
L07B055  LDA   $1C
         BPL   L07B060
         PEA   $26EA
         JSL   L07272E
L07B060  LDA   $22
         LDX   $24
         STA   $0D
         STX   $0F
         BRA   L07B07F
L07B06A  LDA   $1E
         ORA   $20
         BNE   L07B077
         PEA   $26E8
         JSL   L07272E
L07B077  LDA   $1E
         LDX   $20
         STA   $0D
         STX   $0F
L07B07F  PHY
         PHY
         PEI   $0F
         PEI   $0D
         PEA   $0000
         JSL   L07963D
         PLA
         PLX
         SEC
         SBC   #$000E
         BCS   L07B095
         DEX
L07B095  STA   $09
         STX   $0B
         PHY
         PHY
         PEI   $0F
         PEI   $0D
         PEA   $0001
         JSL   L07963D
         PLA
         STA   $05
         PLX
         STX   $07
         LDY   #$0008
         LDA   [$09],Y
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L07B0BE
         EOR   #$8000
L07B0BE  BPL   L07B102
         LDA   #$0001
         STA   $03
L07B0C5  LDA   $1C
         CMP   [$05]
         BNE   L07B0DC
         LDA   $05
         LDX   $07
         CLC
         ADC   #$0002
         BCC   L07B0D6
         INX
L07B0D6  STA   $26
         STX   $28
         BRA   L07B102
L07B0DC  LDA   $05
         LDX   $07
         CLC
         ADC   #$0002
         BCC   L07B0E7
         INX
L07B0E7  STA   $05
         STX   $07
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L071AB8
         LDA   $03
         CMP   $01
         BEQ   L07B102
         INC   $03
         BRA   L07B0C5
L07B102  LDA   $18
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

L07B114  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDX   #$0000
         LDA   L055023
         ORA   L055025
         BNE   L07B128
         INX
L07B128  PHX
         LDA   L055027
         ORA   L055029
         BEQ   L07B134
         LDA   #$0001
L07B134  AND   $01,S
         PLX
         LSR
         BCC   L07B15A
         PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L07C5A6
         PLA
         STA   L055023
         PLA
         STA   L055025
L07B15A  LDA   L055023
         LDX   L055025
         STA   $0A
         STX   $0C
         PLY
         PLY
         PLD
         RTL

L07B168  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         PHY
         PHY
         PEI   $1C
         PEI   $1A
         JSL   L077A5B
         PLA
         STA   $0B
         PLX
         STX   $0D
         LDA   $0B
         ORA   $0D
         BNE   L07B189
         BRL   L07B20A
L07B189  PHY
         PHY
         PEI   $0D
         PEI   $0B
         PEI   $18
         JSL   L0791A7
         PLA
         STA   $07
         PLX
         STX   $09
         LDA   $07
         ORA   $09
         BEQ   L07B1FF
         PHY
         PEI   $0D
         PEI   $0B
         JSL   L0718FA
         PLA
         STA   $01
         PHY
         PHY
         LDA   [$07]
         JSL   L150488
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $03
         PLX
         STX   $05
         LDAL  L05565D
         BNE   L07B1F5
         PEI   $09
         PEI   $07
         LDY   #$0002
         LDA   [$03],Y
         PHA
         LDA   [$03]
         PHA
         LDA   [$07]
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDA   $03
         LDX   $05
         STA   $1E
         STX   $20
L07B1F5  PEI   $0D
         PEI   $0B
         PEI   $01
         JSL   L0718DA
L07B1FF  PEI   $1C
         PEI   $1A
         PEA   $0000
         JSL   L074E4D
L07B20A  LDA   $16
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

L07B21C  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         STZ   $1A
         STZ   $1C
         PHY
         PHY
         LDY   #$004D
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         CLC
         ADC   #$0010
         BCC   L07B247
         INX
L07B247  STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         PHX
         PHA
         PEA   $4547
         PEA   $4150
         PEA   $0000
         PEA   $0000
         JSL   L07502A
         PLA
         STA   $09
         PLX
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
         BEQ   L07B2DA
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         CLC
         ADC   #$000C
         BCC   L07B29C
         INX
L07B29C  PHX
         PHA
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         SEC
         SBC   #$000C
         BCS   L07B2AD
         DEX
L07B2AD  PHX
         PHA
         JSL   L071EC5
         LDY   #$0062
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         LDY   #$000C
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         PEI   $0B
         PEI   $09
         PEA   $0001
         JSL   L074E17
         LDA   $09
         LDX   $0B
         STA   $1A
         STX   $1C
L07B2DA  LDA   $14
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

L07B2EC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFAE
         TCS
         TCD
         STZ   $64
         LDA   L055051
         BEQ   L07B2FE
         BRL   L07B801
L07B2FE  PHY
         PHY
         PEI   $62
         PEI   $60
         JSL   L0772F8
         PLA
         STA   $4B
         PLX
         STX   $4D
         LDA   $4B
         ORA   $4D
         BNE   L07B317
         BRL   L07B801
L07B317  PHY
         PEI   $4D
         PEI   $4B
         JSL   L0718A4
         PLA
         STA   $0D
         LDY   #$0002
         LDA   [$4B],Y
         TAX
         LDA   [$4B]
         STA   $09
         STX   $0B
         LDY   #$0018
         LDA   [$09],Y
         JSL   L150488
         STA   $23
         STX   $25
         LDY   #$0012
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         SEC
         SBC   #$0018
         BCS   L07B34D
         DEX
L07B34D  PHX
         PHA
         PEI   $25
         PEI   $23
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   $21
         PEI   $5E
         PEI   $5C
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L07B36F
         STZ   $5C
         STZ   $5E
L07B36F  PEI   $5E
         PEI   $5C
         LDY   #$0016
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         JSL   L033477
         BEQ   L07B398
         BVS   L07B388
         EOR   #$8000
L07B388  BPL   L07B398
         LDY   #$0016
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         STA   $5C
         STX   $5E
L07B398  LDY   #$000E
         LDA   [$09],Y
         TAX
         DEY
         DEY
         LDA   [$09],Y
         INC
         BNE   L07B3A6
         INX
L07B3A6  PEA   $0000
         PEA   $0006
         JSL   L150D50
         PLA
         PLX
         CLC
         ADC   #$0028
         BCC   L07B3B9
         INX
L07B3B9  STA   $2F
         STX   $31
         PEI   $31
         PEI   $2F
         LDY   #$0002
         LDA   [$4B],Y
         TAX
         LDA   [$4B]
         STA   $4F
         STX   $51
         LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         JSL   L033477
         BEQ   L07B404
         BVS   L07B3E0
         EOR   #$8000
L07B3E0  BPL   L07B404
         PEI   $4D
         PEI   $4B
         JSL   L07191C
         PHY
         PEI   $62
         PEI   $60
         PEA   $5453
         PEA   $494C
         PEI   $31
         PEI   $2F
         JSL   L077EAF
         PLA
         LSR
         BCS   L07B404
         BRL   L07B7EC
L07B404  PEI   $4D
         PEI   $4B
         JSL   L0718BF
         LDY   #$0002
         LDA   [$4B],Y
         TAX
         LDA   [$4B]
         CLC
         ADC   #$000C
         BCC   L07B41B
         INX
L07B41B  STA   $4F
         STX   $51
         LDA   [$4F]
         LDY   #$0002
         ORA   [$4F],Y
         BNE   L07B489
         PHY
         PHY
         PEA   $0000
         PHD
         JSL   L07B21C
         PLA
         STA   $43
         PLX
         STX   $45
         LDA   $43
         ORA   $45
         BNE   L07B441
         BRL   L07B7EC
L07B441  LDY   #$0002
         LDA   [$4B],Y
         TAX
         LDA   [$4B]
         CLC
         ADC   #$000C
         BCC   L07B450
         INX
L07B450  STA   $4F
         STX   $51
         LDA   #$0001
         LDX   #$0000
         STA   [$4F]
         TXA
         LDY   #$0002
         STA   [$4F],Y
         LDY   #$0002
         LDA   [$4B],Y
         TAX
         LDA   [$4B]
         CLC
         ADC   #$0028
         BCC   L07B471
         INX
L07B471  STA   $37
         STX   $39
         LDA   $43
         LDX   $45
         STA   [$37]
         TXA
         LDY   #$0002
         STA   [$37],Y
         LDA   #$0000
         LDY   #$0004
         STA   [$37],Y
L07B489  LDY   #$0002
         LDA   [$4B],Y
         TAX
         LDA   [$4B]
         CLC
         ADC   #$0028
         BCC   L07B498
         INX
L07B498  STA   $37
         STX   $39
         LDA   $5C
         LDX   $5E
         STA   $27
         STX   $29
L07B4A4  PEI   $29
         PEI   $27
         LDY   #$0004
         LDA   [$37],Y
         JSL   L150488
         JSL   L033477
         BEQ   L07B4E4
         BVS   L07B4BC
         EOR   #$8000
L07B4BC  BPL   L07B4E4
         PEI   $29
         PEI   $27
         LDY   #$0004
         LDA   [$37],Y
         JSL   L150488
         JSL   L1512A5
         STA   $27
         STX   $29
         LDA   $37
         LDX   $39
         CLC
         ADC   #$0006
         BCC   L07B4DE
         INX
L07B4DE  STA   $37
         STX   $39
         BRA   L07B4A4
L07B4E4  LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         STA   $47
         STX   $49
         PHY
         PHY
         PEI   $49
         PEI   $47
         JSL   L077A01
         PLA
         STA   $3F
         PLX
         STX   $41
         LDA   $3F
         ORA   $41
         BNE   L07B509
         BRL   L07B7EC
L07B509  LDY   #$0004
         LDA   [$37],Y
         SEC
         SBC   $21
         BVS   L07B516
         EOR   #$8000
L07B516  BPL   L07B51B
         BRL   L07B5E9
L07B51B  LDA   $27
         LDX   $29
         PEI   $25
         PEI   $23
         JSL   L150D50
         PLA
         PLX
         CLC
         ADC   #$0018
         BCC   L07B530
         INX
L07B530  STA   $2B
         STX   $2D
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         PEI   $2D
         PEI   $2B
         JSL   L150F53
         STA   $1D
         STX   $1F
         LDA   $1D
         LDX   $1F
         PEI   $25
         PEI   $23
         JSL   L150F53
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$3F],Y
         PHA
         LDA   [$3F]
         PHA
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $4F
         STX   $51
         LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         JSL   L150F53
         STA   $15
         STX   $17
         PEI   $1F
         PEI   $1D
         PEI   $1B
         PEI   $19
         PEI   $17
         PEI   $15
         LDA   $19
         LDX   $1B
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         PEI   $5A
         PEI   $58
         PEI   $1F
         PEI   $1D
         PEI   $25
         PEI   $23
         JSL   L070597
         LDY   #$0004
         LDA   [$37],Y
         INC
         LDY   #$0004
         STA   [$37],Y
         LDY   #$0002
         LDA   [$4B],Y
         TAX
         LDA   [$4B]
         STA   $05
         STX   $07
         LDY   #$0016
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         INC
         BNE   L07B5CC
         INX
L07B5CC  LDY   #$0014
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         LDA   #$0001
         STA   $64
         PEI   $49
         PEI   $47
         PEA   $0001
         JSL   L074E17
         BRL   L07B7EC
L07B5E9  PHY
         PHY
         PEA   $0000
         PHD
         JSL   L07B21C
         PLA
         STA   $43
         PLX
         STX   $45
         PHY
         PHY
         PEI   $45
         PEI   $43
         JSL   L077A01
         PLA
         STA   $3B
         PLX
         STX   $3D
         LDA   $3B
         ORA   $3D
         BNE   L07B612
         BRL   L07B7E1
L07B612  LDA   $37
         LDX   $39
         STA   $1D
         STX   $1F
         LDA   $1D
         LDX   $1F
         CLC
         ADC   #$0006
         BCC   L07B625
         INX
L07B625  STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$4B],Y
         PHA
         LDA   [$4B]
         PHA
         LDY   #$0002
         LDA   [$4B],Y
         TAX
         LDA   [$4B]
         STA   $4F
         STX   $51
         LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         JSL   L150F53
         STA   $15
         STX   $17
         PEI   $1F
         PEI   $1D
         PEI   $1B
         PEI   $19
         PEI   $17
         PEI   $15
         LDA   $19
         LDX   $1B
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         LDY   #$0002
         LDA   [$4B],Y
         TAX
         LDA   [$4B]
         STA   $01
         STX   $03
         LDY   #$000E
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         INC
         BNE   L07B682
         INX
L07B682  LDY   #$000C
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   $19
         LDX   $1B
         STA   $33
         STX   $35
         LDA   $43
         LDX   $45
         STA   [$33]
         TXA
         LDY   #$0002
         STA   [$33],Y
         LDA   #$0000
         LDY   #$0004
         STA   [$33],Y
         PEI   $29
         PEI   $27
         LDA   $21
         JSL   L150488
         JSL   L033477
         BVS   L07B6BB
         EOR   #$8000
L07B6BB  BPL   L07B6C0
         BRL   L07B7B7
L07B6C0  PHY
         LDY   #$0004
         LDA   [$37],Y
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $13
         LDY   #$0004
         LDA   [$37],Y
         SEC
         SBC   $13
         STA   $11
         LDA   $11
         LDY   #$0004
         STA   [$37],Y
         LDA   $13
         LDY   #$0004
         STA   [$33],Y
         LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         CLC
         ADC   #$0018
         BCC   L07B6F8
         INX
L07B6F8  PHX
         PHA
         LDA   $11
         JSL   L150488
         PEI   $25
         PEI   $23
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $1D
         STX   $1F
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         CLC
         ADC   #$0018
         BCC   L07B721
         INX
L07B721  STA   $19
         STX   $1B
         LDA   $13
         JSL   L150488
         PEI   $25
         PEI   $23
         JSL   L150D50
         PLA
         PLX
         STA   $0F
         PEI   $1F
         PEI   $1D
         PEI   $1B
         PEI   $19
         LDA   $0F
         JSL   L150488
         PHX
         PHA
         JSL   L1511CE
         PEI   $1F
         PEI   $1D
         LDA   $0F
         JSL   L150488
         PHX
         PHA
         JSL   L071EC5
         PEI   $29
         PEI   $27
         LDA   $11
         JSL   L150488
         JSL   L033477
         BEQ   L07B7A9
         BVS   L07B770
         EOR   #$8000
L07B770  BPL   L07B7A9
         PEI   $29
         PEI   $27
         LDA   $11
         JSL   L150488
         JSL   L1512A5
         STA   $27
         STX   $29
         PEI   $49
         PEI   $47
         PEA   $0001
         JSL   L074E17
         LDA   $43
         LDX   $45
         STA   $47
         STX   $49
         LDA   $33
         LDX   $35
         STA   $37
         STX   $39
         LDA   $3B
         LDX   $3D
         STA   $3F
         STX   $41
         BRA   L07B7B4
L07B7A9  PEI   $45
         PEI   $43
         PEA   $0001
         JSL   L074E17
L07B7B4  BRL   L07B509
L07B7B7  STZ   $27
         STZ   $29
         PEI   $49
         PEI   $47
         PEA   $0000
         JSL   L074E17
         LDA   $43
         LDX   $45
         STA   $47
         STX   $49
         LDA   $33
         LDX   $35
         STA   $37
         STX   $39
         LDA   $3B
         LDX   $3D
         STA   $3F
         STX   $41
         BRL   L07B509
L07B7E1  PEI   $49
         PEI   $47
         PEA   $0000
         JSL   L074E17
L07B7EC  PEI   $4D
         PEI   $4B
         PEI   $0D
         JSL   L0718DA
         PEI   $62
         PEI   $60
         PEA   $0001
         JSL   L074AC6
L07B801  LDA   $56
         STA   $62
         LDA   $55
         STA   $61
         LDA   $53
         TCD
         TSC
         CLC
         ADC   #$0060
         TCS
         RTL

L07B813  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         STZ   $26
         PEI   $20
         PEI   $1E
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L07B82E
         BRL   L07B8D8
L07B82E  PHY
         PHY
         PEI   $24
         PEI   $22
         JSL   L077A5B
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BNE   L07B847
         BRL   L07B8D8
L07B847  LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $0D
         STX   $0F
         LDY   #$0006
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $09
         STX   $0B
         LDA   #$4143
         LDX   #$4452
         CMP   $09
         BNE   L07B879
         CPX   $0B
L07B879  BEQ   L07B889
         LDA   #$4B42
         LDX   #$4447
         CMP   $09
         BNE   L07B887
         CPX   $0B
L07B887  BNE   L07B8CD
L07B889  PHY
         PHY
         PEI   $07
         PEI   $05
         JSL   L07DF0D
         LDA   $1E
         LDX   $20
         JSL   L150F53
         STA   $11
         STX   $13
         LDA   #$0001
         STA   $26
         PEI   $13
         PEI   $11
         LDA   $0D
         LDX   $0F
         JSL   L033477
         BEQ   L07B8CD
         BVS   L07B8B7
         EOR   #$8000
L07B8B7  BPL   L07B8CD
         PHY
         PEI   $24
         PEI   $22
         PEI   $0B
         PEI   $09
         PEI   $13
         PEI   $11
         JSL   L077EAF
         PLA
         STA   $26
L07B8CD  PEI   $24
         PEI   $22
         PEA   $0000
         JSL   L074E4D
L07B8D8  LDA   $1C
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

L07B8EA  ENT
         PHD
         TSC
         CLC
         ADC   #$FF78
         TCS
         TCD
         STZ   $96
         STZ   $98
         PEI   $90
         PEI   $8E
         LDA   #$0000
         TAX
         JSL   L033477
         BEQ   L07B906
         BPL   L07B908
L07B906  BRA   L07B978
L07B908  LDA   L055023
         LDX   L055025
         CMP   $8E
         BNE   L07B914
         CPX   $90
L07B914  BEQ   L07B91B
         LDA   #$0000
         BRA   L07B91E
L07B91B  LDA   #$0001
L07B91E  PHA
         LDAL  L053AD3
         TAX
         LDAL  L053AD1
         CMP   $92
         BNE   L07B92E
         CPX   $94
L07B92E  BEQ   L07B935
         LDA   #$0000
         BRA   L07B938
L07B935  LDA   #$0001
L07B938  AND   $01,S
         PLX
         LSR
         BCC   L07B94A
         LDA   L055027
         LDX   L055029
         STA   $96
         STX   $98
         BRA   L07B978
L07B94A  PHY
         PEI   $94
         PEI   $92
         PEI   $90
         PEI   $8E
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L07A4B1
         PLA
         LSR
         BCC   L07B978
         LDA   $01
         LDX   $03
         STA   $96
         STX   $98
         LDA   L055005
         LDX   L055007
         STA   L055081
         STX   L055083
L07B978  LDA   $8C
         STA   $94
         LDA   $8B
         STA   $93
         LDA   $89
         TCD
         TSC
         CLC
         ADC   #$0092
         TCS
         RTL

L07B98A  PHD
         TSC
         CLC
         ADC   #$FF96
         TCS
         TCD
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEI   $7A
         PEI   $78
         PEA   $002A
         JSL   L0313BE
         STZ   $80
         LDA   $09
         STA   $39
         LDA   #$00FF
         AND   [$74]
         STA   $43
         PHY
         PHY
         LDY   #$0002
         LDA   [$70],Y
         PHA
         LDA   [$70]
         PHA
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L07B9C8
         INX
L07B9C8  STA   $3F
         STX   $41
         LDA   #$0001
         LDX   #$0000
         STA   $3B
         STX   $3D
         LDA   #$002A
         CLC
         ADC   $43
         INC
         CLC
         ADC   #$0004
         JSL   L150488
         PEI   $41
         PEI   $3F
         JSL   L150F53
         PEI   $3D
         PEI   $3B
         JSL   L150F53
         STA   $51
         STX   $53
         LDA   $51
         AND   #$0001
         BEQ   L07BA0C
         LDA   $51
         LDX   $53
         INC
         BNE   L07BA08
         INX
L07BA08  STA   $51
         STX   $53
L07BA0C  PEI   $53
         PEI   $51
         LDA   #$7FFF
         LDX   #$0000
         JSL   L033477
         BEQ   L07BA26
         BVS   L07BA21
         EOR   #$8000
L07BA21  BPL   L07BA26
         BRL   L07BCA6
L07BA26  LDA   $51
         STA   $07
         LDX   #$0000
         LDA   $39
         BMI   L07BA34
         BEQ   L07BA34
         INX
L07BA34  TXA
         BNE   L07BA3A
         BRL   L07BCA6
L07BA3A  PHY
         PEI   $7E
         PEI   $7C
         PEI   $53
         PEI   $51
         JSL   L07B813
         PLA
         BNE   L07BA4D
         BRL   L07BCA6
L07BA4D  PHY
         PHY
         PEI   $7E
         PEI   $7C
         JSL   L077A5B
         PLA
         STA   $63
         PLX
         STX   $65
         PHY
         PHY
         PEI   $65
         PEI   $63
         PEA   $0000
         JSL   L07963D
         PLA
         STA   $5F
         PLX
         STX   $61
         LDA   $5F
         LDX   $61
         SEC
         SBC   #$000E
         BCS   L07BA7B
         DEX
L07BA7B  STA   $5B
         STX   $5D
         LDA   [$5B]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L07BA8E
         EOR   #$8000
L07BA8E  BMI   L07BA93
         BRL   L07BC9B
L07BA93  LDA   #$0001
         STA   $59
L07BA98  LDA   [$5F]
         JSL   L150488
         STA   $55
         STX   $57
         LDY   #$0002
         LDA   $39
         CMP   [$5F],Y
         BEQ   L07BAAE
         BRL   L07BC80
L07BAAE  LDA   $55
         LDX   $57
         CMP   $51
         BNE   L07BAB8
         CPX   $53
L07BAB8  BNE   L07BABD
         BRL   L07BB61
L07BABD  LDA   $5F
         LDX   $61
         PEI   $57
         PEI   $55
         JSL   L150F53
         STA   $4D
         STX   $4F
         LDA   $5F
         LDX   $61
         PEI   $53
         PEI   $51
         JSL   L150F53
         STA   $49
         STX   $4B
         LDY   #$0002
         LDA   [$63],Y
         PHA
         LDA   [$63]
         PHA
         LDY   #$0002
         LDA   [$63],Y
         TAX
         LDA   [$63]
         STA   $67
         STX   $69
         LDY   #$0002
         LDA   [$67],Y
         TAX
         LDA   [$67]
         JSL   L150F53
         STA   $45
         STX   $47
         PEI   $4F
         PEI   $4D
         PEI   $4B
         PEI   $49
         PEI   $47
         PEI   $45
         LDA   $4D
         LDX   $4F
         JSL   L1512A5
         PHX
         PHA
         LDA   $51
         LDX   $53
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         LDA   $5B
         LDX   $5D
         STA   $03
         STX   $05
         LDA   #$0004
         CLC
         ADC   $03
         LDX   $05
         BCC   L07BB39
         INX
L07BB39  STA   $67
         STX   $69
         LDY   #$0006
         LDA   [$03],Y
         TAX
         DEY
         DEY
         LDA   [$03],Y
         PEI   $53
         PEI   $51
         JSL   L150F53
         PHX
         PHA
         LDA   $55
         LDX   $57
         JSL   L1512A5
         STA   [$67]
         TXA
         LDY   #$0002
         STA   [$67],Y
L07BB61  PEI   $61
         PEI   $5F
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   $002A
         JSL   L0313BE
         LDA   #$0001
         CLC
         ADC   $74
         LDX   $76
         BCC   L07BB80
         INX
L07BB80  STA   $4D
         STX   $4F
         LDA   $5F
         LDX   $61
         CLC
         ADC   #$002A
         BCC   L07BB8F
         INX
L07BB8F  STA   $49
         STX   $4B
         PEI   $4F
         PEI   $4D
         PEI   $4B
         PEI   $49
         LDA   $43
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         PEI   $4B
         PEI   $49
         LDA   $43
         JSL   L150488
         JSL   L150F53
         STA   $49
         STX   $4B
         LDA   #$0000
         STA   [$49]
         LDA   $49
         LDX   $4B
         CLC
         ADC   #$0002
         BCC   L07BBC9
         INX
L07BBC9  STA   $49
         STX   $4B
         LDA   #$0004
         STA   $31
         STZ   $33
         LDA   $31
         LDX   $33
         STA   [$49]
         TXA
         LDY   #$0002
         STA   [$49],Y
         LDA   $49
         LDX   $4B
         CLC
         ADC   #$0004
         BCC   L07BBEB
         INX
L07BBEB  STA   $49
         STX   $4B
         LDY   #$0002
         LDA   [$70],Y
         TAX
         LDA   [$70]
         STA   $4D
         STX   $4F
         TDC
         CLC
         ADC   #$004D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0049
         PEA   $0000
         PHA
         JSL   L070669
         LDA   $49
         LDX   $4B
         INC
         BNE   L07BC19
         INX
L07BC19  STA   $49
         STX   $4B
         LDA   $43
         INC
         CLC
         ADC   #$0004
         JSL   L150488
         PEI   $41
         PEI   $3F
         JSL   L150F53
         PEI   $3D
         PEI   $3B
         JSL   L150F53
         AND   #$00FF
         AND   #$0001
         BEQ   L07BC54
         SEP   #$20
         LDA   #$00
         STA   [$49]
         REP   #$20
         LDA   $49
         LDX   $4B
         INC
         BNE   L07BC50
         INX
L07BC50  STA   $49
         STX   $4B
L07BC54  PEI   $4B
         PEI   $49
         LDA   $5F
         LDX   $61
         JSL   L1512A5
         STA   $67
         STX   $69
         LDA   [$5F]
         JSL   L150488
         CMP   $67
         BNE   L07BC70
         CPX   $69
L07BC70  BEQ   L07BC79
         PEA   $572A
         JSL   L07272E
L07BC79  LDA   #$0001
         STA   $80
         BRA   L07BC9B
L07BC80  LDA   $5F
         LDX   $61
         PEI   $57
         PEI   $55
         JSL   L150F53
         STA   $5F
         STX   $61
         LDA   $59
         CMP   $01
         BEQ   L07BC9B
         INC   $59
         BRL   L07BA98
L07BC9B  PEI   $7E
         PEI   $7C
         PEA   $0001
         JSL   L074E4D
L07BCA6  LDA   $6E
         STA   $7E
         LDA   $6D
         STA   $7D
         LDA   $6B
         TCD
         TSC
         CLC
         ADC   #$007C
         TCS
         RTL

L07BCB8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC8
         TCS
         TCD
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L07A852
         PLA
         LSR
         BCS   L07BCF8
         STZ   L055077
         LDA   #$0001
         STA   L055075
         PEA   ^L0536E5
         PEA   L0536E5
         PEA   $0000
         PEA   $0084
         JSL   L071EC5
         BRL   L07BF7D
L07BCF8  PHY
         PEI   $42
         PEI   $40
         PEA   ^L0538E9
         PEA   L0538E9
         JSL   L071C56
         LDX   #$0000
         LDA   L055065
         CMP   $3E
         BNE   L07BD12
         INX
L07BD12  TXA
         AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   $1F
         CMP   L055077
         BNE   L07BD22
         INX
L07BD22  TXA
         AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   $1D
         CMP   L055075
         BNE   L07BD32
         INX
L07BD32  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L07BD3C
         BRL   L07BF7D
L07BD3C  PEA   ^L0538E9
         PEA   L0538E9
         PEI   $42
         PEI   $40
         PEA   $0100
         JSL   L0313BE
         LDA   $3E
         STA   L055065
         LDA   $1F
         STA   L055077
         LDA   $1D
         STA   L055075
         LDA   $3E
         BMI   L07BD9A
         CMP   #$0005
         BPL   L07BD9A
         SEC
         SBC   #$0000
         BEQ   L07BD79
         DEC
         BEQ   L07BD84
         DEC
         BEQ   L07BD8C
         DEC
         BEQ   L07BD84
         DEC
         BEQ   L07BD8C
         BRA   L07BD9A
L07BD79  LDA   #$0001
         STA   L055063
         STZ   L055061
         BRA   L07BD9A
L07BD84  STZ   L055063
         STZ   L055061
         BRA   L07BD9A
L07BD8C  LDA   #$0001
         STA   L055063
         LDA   #$0001
         STA   L055061
         BRA   L07BD9A
L07BD9A  PEA   ^L0536E5
         PEA   L0536E5
         PEA   $0000
         PEA   $0084
         JSL   L071EC5
         PHY
         PHY
         PEA   ^L0538E9
         PEA   L0538E9
         JSL   L071F3F
         PLA
         STA   $31
         PLX
         STX   $33
         LDA   #$0003
         CMP   $3E
         BNE   L07BDD0
         TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         JSL   L079395
L07BDD0  LDA   $3E
         DEC
         BEQ   L07BDEB
         PEI   $33
         PEI   $31
         PEA   ^L0536E9
         PEA   L0536E9
         LDA   L055077
         PHA
         LDA   L055075
         PHA
         JSL   L078D85
L07BDEB  STZ   L055079
         LDA   #L053769
         LDX   #^L053769
         STA   $2D
         STX   $2F
         LDA   $2D
         LDX   $2F
         CLC
         ADC   #$0100
         BCC   L07BE03
         INX
L07BE03  TAY
         BNE   L07BE07
         DEX
L07BE07  DEC
         STA   $29
         STX   $2B
         PHY
         PHY
         PEA   ^L0538E9
         PEA   L0538E9
         JSL   L071F3F
         PLA
         STA   $31
         PLX
         STX   $33
         LDX   #$0000
         LDA   #$0003
         CMP   $3E
         BNE   L07BE29
         INX
L07BE29  PHX
         LDX   #$0000
         LDA   #$0004
         CMP   $3E
         BNE   L07BE35
         INX
L07BE35  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L07BEAD
         LDA   #$00FF
         AND   [$31]
         BNE   L07BE46
         BRL   L07BF75
L07BE46  LDA   #$0001
         STA   L055079
         LDA   $2D
         LDX   $2F
         STAL  L053869
         TXA
         STAL  L05386B
L07BE59  LDA   #$00FF
         AND   [$31]
         BEQ   L07BE63
         LDA   #$0001
L07BE63  PHA
         LDA   $29
         LDX   $2B
         CMP   $2D
         BNE   L07BE6E
         CPX   $2F
L07BE6E  BNE   L07BE75
         LDA   #$0000
         BRA   L07BE78
L07BE75  LDA   #$0001
L07BE78  AND   $01,S
         PLX
         LSR
         BCC   L07BEAA
         PEI   $33
         PEI   $31
         PLA
         STA   $35
         PLA
         STA   $37
         LDA   [$35]
         SEP   #$20
         STA   [$2D]
         REP   #$20
         LDA   $2D
         LDX   $2F
         INC
         BNE   L07BE98
         INX
L07BE98  STA   $2D
         STX   $2F
         LDA   $31
         LDX   $33
         INC
         BNE   L07BEA4
         INX
L07BEA4  STA   $31
         STX   $33
         BRA   L07BE59
L07BEAA  BRL   L07BF75
L07BEAD  TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         JSL   L071C12
         LDA   #$00FF
         AND   [$31]
         BNE   L07BEC4
         BRL   L07BF75
L07BEC4  LDA   L055079
         INC
         STA   L055079
         LDA   L055079
         DEC
         ASL
         ASL
         TAX
         PEI   $2F
         PEI   $2D
         PLA
         STAL  L053869,X
         PLA
         STAL  L05386B,X
L07BEE0  LDA   #$00FF
         AND   [$31]
         CMP   #$0020
         BEQ   L07BF37
         LDA   #$00FF
         AND   [$31]
         PHA
         PLA
         SEP   #$20
         STA   [$2D]
         REP   #$20
         LDA   $2D
         LDX   $2F
         INC
         BNE   L07BEFF
         INX
L07BEFF  STA   $2D
         STX   $2F
         LDA   $31
         LDX   $33
         INC
         BNE   L07BF0B
         INX
L07BF0B  STA   $31
         STX   $33
         LDX   #$0000
         LDA   #$00FF
         AND   [$31]
         BNE   L07BF1A
         INX
L07BF1A  PHX
         LDA   $29
         LDX   $2B
         CMP   $2D
         BNE   L07BF25
         CPX   $2F
L07BF25  BEQ   L07BF2C
         LDA   #$0000
         BRA   L07BF2F
L07BF2C  LDA   #$0001
L07BF2F  ORA   $01,S
         PLX
         LSR
         BCS   L07BF75
         BRA   L07BEE0
L07BF37  SEP   #$20
         LDA   #$00
         STA   [$2D]
         REP   #$20
         LDA   $2D
         LDX   $2F
         INC
         BNE   L07BF47
         INX
L07BF47  STA   $2D
         STX   $2F
         LDX   #$0000
         LDA   #$0014
         CMP   L055079
         BNE   L07BF57
         INX
L07BF57  PHX
         LDA   $29
         LDX   $2B
         CMP   $2D
         BNE   L07BF62
         CPX   $2F
L07BF62  BEQ   L07BF69
         LDA   #$0000
         BRA   L07BF6C
L07BF69  LDA   #$0001
L07BF6C  ORA   $01,S
         PLX
         LSR
         BCS   L07BF75
         BRL   L07BEAD
L07BF75  SEP   #$20
         LDA   #$00
         STA   [$2D]
         REP   #$20
L07BF7D  LDA   $3C
         STA   $42
         LDA   $3B
         STA   $41
         LDA   $39
         TCD
         TSC
         CLC
         ADC   #$0040
         TCS
         RTL

L07BF8F  ENT
         PHD
         TSC
         CLC
         ADC   #$FDE6
         TCS
         ADC   #$012D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FED5
         PHA
         PEI   $F4
         PEI   $F2
         PEA   $0100
         JSL   L0313BE
         STZ   $FC
         PHY
         PHY
         PEI   $FA
         PEI   $F8
         JSL   L077A5B
         PLA
         STA   $DB
         PLX
         STX   $DD
         LDA   $DB
         ORA   $DD
         BNE   L07BFC9
         BRL   L07C08A
L07BFC9  PHY
         PHY
         PEI   $DD
         PEI   $DB
         PEA   $0000
         JSL   L07963D
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDA   $E5
         ORA   $E7
         BNE   L07BFE5
         BRL   L07C07F
L07BFE5  LDA   $E5
         LDX   $E7
         SEC
         SBC   #$000E
         BCS   L07BFF0
         DEX
L07BFF0  STA   $E1
         STX   $E3
         LDA   [$E1]
         LDX   #$FED3
         STA   $00,X
         LDX   #$FED3
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L07C009
         EOR   #$8000
L07C009  BPL   L07C07F
         LDA   #$0001
         STA   $DF
L07C010  LDY   #$0004
         LDA   #$000F
         AND   [$E5],Y
         CMP   $F6
         BNE   L07C060
         LDA   $E5
         LDX   $E7
         CLC
         ADC   #$002A
         BCC   L07C027
         INX
L07C027  STA   $D5
         STX   $D7
         PEI   $D7
         PEI   $D5
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD5
         PHA
         JSL   L071FF8
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FED5
         PHA
         JSL   L071C56
         PLA
         LSR
         BCC   L07C060
         LDY   #$0002
         LDA   [$E5],Y
         STA   $FC
         BRA   L07C07F
L07C060  PEI   $E7
         PEI   $E5
         LDA   [$E5]
         JSL   L150488
         JSL   L150F53
         STA   $E5
         STX   $E7
         LDA   $DF
         LDX   #$FED3
         CMP   $00,X
         BEQ   L07C07F
         INC   $DF
         BRA   L07C010
L07C07F  PEI   $FA
         PEI   $F8
         PEA   $0000
         JSL   L074E4D
L07C08A  LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$0226
         TCS
         RTL

L07C09C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD6
         TCS
         TCD
         STZ   $3A
         PHY
         PHY
         PEI   $38
         PEI   $36
         JSL   L077A5B
         PLA
         STA   $23
         PLX
         STX   $25
         LDA   $23
         ORA   $25
         BNE   L07C0BF
         BRL   L07C28C
L07C0BF  PHY
         PEI   $25
         PEI   $23
         JSL   L0718FA
         PLA
         STA   $03
         PHY
         PHY
         PEI   $25
         PEI   $23
         PEA   $0000
         JSL   L07963D
         PLA
         STA   $15
         PLX
         STX   $17
         LDA   $15
         ORA   $17
         BNE   L07C0E7
         BRL   L07C277
L07C0E7  LDA   $15
         LDX   $17
         STA   $11
         STX   $13
         LDA   $15
         LDX   $17
         SEC
         SBC   #$000E
         BCS   L07C0FA
         DEX
L07C0FA  STA   $19
         STX   $1B
         LDA   [$19]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L07C10D
         EOR   #$8000
L07C10D  BMI   L07C112
         BRL   L07C277
L07C112  LDA   #$0001
         STA   $1D
L07C117  LDY   #$0002
         LDA   $34
         CMP   [$11],Y
         BEQ   L07C123
         BRL   L07C252
L07C123  LDA   $32
         BEQ   L07C131
         LDA   $1D
         DEC
         BNE   L07C12F
         BRL   L07C277
L07C12F  BRA   L07C154
L07C131  LDA   [$19]
         CMP   $1D
         BNE   L07C13A
         BRL   L07C277
L07C13A  LDA   $11
         LDX   $13
         STA   $15
         STX   $17
         PEI   $17
         PEI   $15
         LDA   [$15]
         JSL   L150488
         JSL   L150F53
         STA   $11
         STX   $13
L07C154  LDA   [$15]
         STA   $07
         LDA   [$11]
         STA   $05
         PHY
         PHY
         LDA   $07
         JSL   L150488
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDAL  L05565D
         BEQ   L07C186
         BRL   L07C232
L07C186  PHY
         PHY
         LDA   $05
         JSL   L150488
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $09
         PLX
         STX   $0B
         LDAL  L05565D
         BNE   L07C22A
         PEI   $17
         PEI   $15
         LDY   #$0002
         LDA   [$0D],Y
         PHA
         LDA   [$0D]
         PHA
         LDA   $07
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         PEI   $13
         PEI   $11
         LDY   #$0002
         LDA   [$09],Y
         PHA
         LDA   [$09]
         PHA
         LDA   $05
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDY   #$0002
         LDA   [$09],Y
         PHA
         LDA   [$09]
         PHA
         PEI   $17
         PEI   $15
         LDA   $05
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDY   #$0002
         LDA   [$0D],Y
         PHA
         LDA   [$0D]
         PHA
         PEI   $17
         PEI   $15
         LDA   $05
         JSL   L150488
         JSL   L150F53
         PHX
         PHA
         LDA   $07
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDA   #$0001
         STA   $3A
         PEI   $0B
         PEI   $09
         JSL   L07185A
L07C22A  PEI   $0F
         PEI   $0D
         JSL   L07185A
L07C232  LDA   $30
         EOR   #$0001
         PHA
         LDX   #$0000
         LDY   #$0004
         LDA   [$15],Y
         LDY   #$0004
         EOR   [$11],Y
         AND   #$000F
         BNE   L07C24B
         INX
L07C24B  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L07C277
L07C252  LDA   $11
         LDX   $13
         STA   $15
         STX   $17
         PEI   $17
         PEI   $15
         LDA   [$15]
         JSL   L150488
         JSL   L150F53
         STA   $11
         STX   $13
         LDA   $1D
         CMP   $01
         BEQ   L07C277
         INC   $1D
         BRL   L07C117
L07C277  PEI   $25
         PEI   $23
         PEI   $03
         JSL   L0718DA
         PEI   $38
         PEI   $36
         PEA   $0001
         JSL   L074E4D
L07C28C  LDA   $2E
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

L07C29E  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   $16
         LDA   #$0000
         TAX
         LDY   #$0011
         STA   [$0E],Y
         INY
         INY
         TXA
         STA   [$0E],Y
         LDY   #$0025
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         CLC
         ADC   #$0028
         BCC   L07C2D3
         INX
L07C2D3  LDY   #$001D
         STA   [$0E],Y
         INY
         INY
         TXA
         STA   [$0E],Y
L07C2DD  LDY   #$001F
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         LDY   #$001B
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         JSL   L033477
         BNE   L07C2FB
         BRL   L07C387
L07C2FB  LDY   #$001F
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         STA   $05
         STX   $07
         LDA   $12
         LDX   $14
         CMP   [$05]
         BNE   L07C317
         LDY   #$0002
         TXA
         CMP   [$05],Y
L07C317  BNE   L07C320
         LDA   #$0001
         STA   $16
         BRA   L07C387
L07C320  LDA   #$0011
         CLC
         ADC   $0E
         LDX   $10
         BCC   L07C32B
         INX
L07C32B  PHX
         PHA
         LDY   #$0013
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         LDY   #$001F
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         CLC
         ADC   #$0004
         BCC   L07C349
         INX
L07C349  STA   $05
         STX   $07
         LDA   [$05]
         JSL   L150488
         JSL   L150F53
         PHX
         PHA
         PLA
         PLY
         PLX
         STX   $05
         PLX
         STX   $07
         STA   [$05]
         TYA
         LDY   #$0002
         STA   [$05],Y
         LDY   #$001F
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         CLC
         ADC   #$0006
         BCC   L07C37A
         INX
L07C37A  LDY   #$001D
         STA   [$0E],Y
         INY
         INY
         TXA
         STA   [$0E],Y
         BRL   L07C2DD
L07C387  LDA   $0C
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

L07C399  PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         STZ   $1E
         LDY   #$001F
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         STA   $0D
         STX   $0F
         PHY
         PHY
         PEI   $0F
         PEI   $0D
         JSL   L077A01
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   $09
         ORA   $0B
         BNE   L07C41F
         LDA   #$0011
         CLC
         ADC   $1A
         LDX   $1C
         BCC   L07C3DE
         INX
L07C3DE  PHX
         PHA
         LDY   #$0013
         LDA   [$1A],Y
         PHA
         DEY
         DEY
         LDA   [$1A],Y
         PHA
         LDY   #$001F
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         CLC
         ADC   #$0004
         BCC   L07C3FC
         INX
L07C3FC  STA   $11
         STX   $13
         LDA   [$11]
         JSL   L150488
         JSL   L150F53
         PHX
         PHA
         PLA
         PLY
         PLX
         STX   $11
         PLX
         STX   $13
         STA   [$11]
         TYA
         LDY   #$0002
         STA   [$11],Y
         BRL   L07C529
L07C41F  LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$0018
         BCC   L07C42E
         INX
L07C42E  STA   $03
         STX   $05
         LDY   #$001F
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         CLC
         ADC   #$0004
         BCC   L07C443
         INX
L07C443  STA   $11
         STX   $13
         LDA   [$11]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L07C456
         EOR   #$8000
L07C456  BMI   L07C45B
         BRL   L07C51E
L07C45B  LDA   #$0001
         STA   $07
L07C460  LDY   #$0013
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         INC
         BNE   L07C46E
         INX
L07C46E  LDY   #$0011
         STA   [$1A],Y
         INY
         INY
         TXA
         STA   [$1A],Y
         LDY   #$0032
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         CMP   [$03]
         BNE   L07C48C
         LDY   #$0002
         TXA
         CMP   [$03],Y
L07C48C  BNE   L07C4FD
         PEI   $0F
         PEI   $0D
         PEA   $0000
         JSL   L074E17
         LDA   $0D
         LDX   $0F
         STA   L055081
         STX   L055083
         LDA   #$0001
         STA   $1E
         LDY   #$0036
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         CMPL  L053AD1
         BNE   L07C4BD
         TXA
         CMPL  L053AD3
L07C4BD  BEQ   L07C4C4
         LDA   #$0000
         BRA   L07C4C7
L07C4C4  LDA   #$0001
L07C4C7  PHA
         LDY   #$0032
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         CMP   L055027
         BNE   L07C4DA
         CPX   L055029
L07C4DA  BEQ   L07C4E1
         LDA   #$0000
         BRA   L07C4E4
L07C4E1  LDA   #$0001
L07C4E4  AND   $01,S
         PLX
         LSR
         BCC   L07C4FA
         LDY   #$0013
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         STA   L055023
         STX   L055025
L07C4FA  BRL   L07C594
L07C4FD  PEI   $05
         PEI   $03
         LDY   #$0017
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         JSL   L150F53
         STA   $03
         STX   $05
         LDA   $07
         CMP   $01
         BEQ   L07C51E
         INC   $07
         BRL   L07C460
L07C51E  PEI   $0F
         PEI   $0D
         PEA   $0000
         JSL   L074E17
L07C529  LDY   #$001F
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         CLC
         ADC   #$0006
         BCC   L07C53A
         INX
L07C53A  LDY   #$001D
         STA   [$1A],Y
         INY
         INY
         TXA
         STA   [$1A],Y
         LDY   #$001F
         LDA   [$1A],Y
         PHA
         DEY
         DEY
         LDA   [$1A],Y
         PHA
         LDY   #$001B
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         JSL   L033477
         BNE   L07C594
         LDA   #$0000
         TAX
         LDY   #$0011
         STA   [$1A],Y
         INY
         INY
         TXA
         STA   [$1A],Y
         LDY   #$0025
         LDA   [$1A],Y
         TAX
         DEY
         DEY
         LDA   [$1A],Y
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         CLC
         ADC   #$0028
         BCC   L07C58A
         INX
L07C58A  LDY   #$001D
         STA   [$1A],Y
         INY
         INY
         TXA
         STA   [$1A],Y
L07C594  LDA   $18
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

L07C5A6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD6
         TCS
         TCD
         LDAL  L053AD3
         TAX
         LDAL  L053AD1
         CMP   $34
         BNE   L07C5BD
         CPX   $36
L07C5BD  BNE   L07C5E2
         LDA   L055027
         LDX   L055029
         CMP   $30
         BNE   L07C5CB
         CPX   $32
L07C5CB  BNE   L07C5E2
         LDA   L055023
         ORA   L055025
         BEQ   L07C5E2
         LDA   L055023
         LDX   L055025
         STA   $38
         STX   $3A
         BRL   L07C7A3
L07C5E2  STZ   $38
         STZ   $3A
         PHY
         PHY
         PEI   $36
         PEI   $34
         JSL   L0772F8
         PLA
         STA   $23
         PLX
         STX   $25
         LDA   $23
         ORA   $25
         BNE   L07C5FF
         BRL   L07C7A3
L07C5FF  PHY
         PEI   $25
         PEI   $23
         JSL   L0718FA
         PLA
         STA   $21
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         CLC
         ADC   #$0018
         BCC   L07C61A
         INX
L07C61A  STA   $27
         STX   $29
         LDA   [$27]
         JSL   L150488
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         CLC
         ADC   #$0028
         BCC   L07C637
         INX
L07C637  STA   $1D
         STX   $1F
         PEI   $1F
         PEI   $1D
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         CLC
         ADC   #$000C
         BCC   L07C64E
         INX
L07C64E  STA   $27
         STX   $29
         LDY   #$0002
         LDA   [$27],Y
         TAX
         LDA   [$27]
         PEA   $0000
         PEA   $0006
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $19
         STX   $1B
         PHY
         PHY
         PEI   $32
         PEI   $30
         JSL   L0772AE
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   $09
         ORA   $0B
         BEQ   L07C6F9
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$001C
         BCC   L07C693
         INX
L07C693  STA   $27
         STX   $29
         LDY   #$0002
         LDA   [$27],Y
         TAX
         LDA   [$27]
         STA   $05
         STX   $07
         PEI   $32
         PEI   $30
         PEA   $0000
         JSL   L074A90
         LDA   $05
         ORA   $07
         BEQ   L07C6B7
         LDA   #$0001
L07C6B7  BEQ   L07C6F9
         PHY
         PEI   $07
         PEI   $05
         PEA   $0000
         PHD
         JSL   L07C29E
         PLA
         BEQ   L07C6F9
         PHY
         PEA   $0000
         PHD
         JSL   L07C399
         PLA
         LSR
         BCC   L07C6E1
         LDA   $11
         LDX   $13
         STA   $38
         STX   $3A
         BRL   L07C78E
L07C6E1  PHY
         PEA   $0000
         PHD
         JSL   L07C399
         PLA
         LSR
         BCC   L07C6F9
         LDA   $11
         LDX   $13
         STA   $38
         STX   $3A
         BRL   L07C78E
L07C6F9  PHY
         LDA   L055081
         LDX   L055083
         PHX
         PHA
         PEA   $0000
         PHD
         JSL   L07C29E
         PLA
         LSR
         BCS   L07C725
         STZ   $11
         STZ   $13
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         CLC
         ADC   #$0028
         BCC   L07C721
         INX
L07C721  STA   $1D
         STX   $1F
L07C725  LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         CLC
         ADC   #$000C
         BCC   L07C734
         INX
L07C734  STA   $27
         STX   $29
         LDY   #$0002
         LDA   [$27],Y
         TAX
         LDA   [$27]
         STA   $01
         STX   $03
         PEI   $03
         PEI   $01
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L07C757
         EOR   #$8000
L07C757  BPL   L07C78E
         LDA   #$0001
         LDX   #$0000
         STA   $0D
         STX   $0F
L07C763  PHY
         PEA   $0000
         PHD
         JSL   L07C399
         PLA
         LSR
         BCC   L07C77A
         LDA   $11
         LDX   $13
         STA   $38
         STX   $3A
         BRA   L07C78E
L07C77A  LDA   $0D
         LDX   $0F
         CMP   $01
         BNE   L07C784
         CPX   $03
L07C784  BEQ   L07C78E
         INC   $0D
         BNE   L07C78C
         INC   $0F
L07C78C  BRA   L07C763
L07C78E  PEI   $25
         PEI   $23
         PEI   $21
         JSL   L0718DA
         PEI   $36
         PEI   $34
         PEA   $0000
         JSL   L074AC6
L07C7A3  LDA   $2E
         STA   $36
         LDA   $2D
         STA   $35

*

         LDA   $2B
         TCD
         TSC
         CLC
         ADC   #$0034
         TCS
         RTL

L07C7B5  ENT
         PHD
         TSC
         CLC
         ADC   #$FFB6
         TCS
         TCD
         STZ   $62
         STZ   $64
         JSL   L079752
         PHY
         PHY
         PEI   $60
         PEI   $5E
         JSL   L0772F8
         PLA
         STA   $43
         PLX
         STX   $45
         LDA   $43
         ORA   $45
         BNE   L07C7DE
         BRL   L07CC0D
L07C7DE  PHY
         PEI   $45
         PEI   $43
         JSL   L0718FA
         PLA
         STA   $19
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         CLC
         ADC   #$0018
         BCC   L07C7F9
         INX
L07C7F9  STA   $47
         STX   $49
         LDA   [$47]
         STA   $29
         LDA   $5A
         LDX   $5C
         INC
         BNE   L07C809
         INX
L07C809  STA   $2F
         STX   $31
         PEI   $31
         PEI   $2F
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L07C820
         EOR   #$8000
L07C820  BMI   L07C82C
         LDA   #$0001
         LDX   #$0000
         STA   $2F
         STX   $31
L07C82C  PEI   $31
         PEI   $2F
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         CLC
         ADC   #$0014
         BCC   L07C83F
         INX
L07C83F  STA   $47
         STX   $49
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         JSL   L033477
         BEQ   L07C862
         BVS   L07C856
         EOR   #$8000
L07C856  BPL   L07C862
         LDA   #$0001
         LDX   #$0000
         STA   $2F
         STX   $31
L07C862  LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         CLC
         ADC   #$0028
         BCC   L07C871
         INX
L07C871  STA   $3F
         STX   $41
         PEI   $41
         PEI   $3F
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         CLC
         ADC   #$000C
         BCC   L07C888
         INX
L07C888  STA   $47
         STX   $49
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         PEA   $0000
         PEA   $0006
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $3B
         STX   $3D
         LDA   $2F
         LDX   $31
         STA   $2B
         STX   $2D
L07C8B0  PEI   $2D
         PEI   $2B
         LDY   #$0004
         LDA   [$3F],Y
         JSL   L150488
         JSL   L033477
         BEQ   L07C8F0
         BVS   L07C8C8
         EOR   #$8000
L07C8C8  BPL   L07C8F0
         PEI   $2D
         PEI   $2B
         LDY   #$0004
         LDA   [$3F],Y
         JSL   L150488
         JSL   L1512A5
         STA   $2B
         STX   $2D
         LDA   $3F
         LDX   $41
         CLC
         ADC   #$0006
         BCC   L07C8EA
         INX
L07C8EA  STA   $3F
         STX   $41
         BRA   L07C8B0
L07C8F0  LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $37
         STX   $39
         PHY
         PHY
         PEI   $39
         PEI   $37
         JSL   L077A01
         PLA
         STA   $33
         PLX
         STX   $35
         LDA   $33
         ORA   $35
         BNE   L07C915
         BRL   L07CBF8
L07C915  PHY
         PEI   $35
         PEI   $33
         JSL   L0718FA
         PLA
         STA   $17
         LDA   #$0400
         ANDL  L053AE9
         BEQ   L07C92D
         LDA   #$0001
L07C92D  STA   L05507F
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$0018
         BCC   L07C93F
         INX
L07C93F  STA   $21
         STX   $23
         PEI   $23
         PEI   $21
         LDY   #$0004
         LDA   [$3F],Y
         PEI   $29
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L07C95C
         DEX
L07C95C  JSL   L150F53
         STA   $1D
         STX   $1F
         PEI   $23
         PEI   $21
         LDX   $2D
         LDA   $2B
         BNE   L07C96F
         DEX
L07C96F  DEC
         PHX
         PHA
         LDA   $29
         JSL   L150488
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $21
         STX   $23
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         CLC
         ADC   #$001C
         BCC   L07C995
         INX
L07C995  STA   $47
         STX   $49
         LDA   [$47]
         STA   $1B
         LDA   $56
         ORA   $58
         BEQ   L07C9A6
         LDA   #$0001
L07C9A6  STA   $07
         LDA   $56
         LDX   $58
         CLC
         ADC   #$0004
         BCC   L07C9B3
         INX
L07C9B3  STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         CLC
         ADC   #$0014
         BCC   L07C9C6
         INX
L07C9C6  STA   $47
         STX   $49
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         STA   $01
         STX   $03
         PEI   $03
         PEI   $01
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L07C9E9
         EOR   #$8000
L07C9E9  BMI   L07C9EE
         BRL   L07CBE3
L07C9EE  LDA   #$0001
         LDX   #$0000
         STA   $25
         STX   $27
L07C9F8  LDA   $07
         BEQ   L07CA68
         LDA   $09
         LDX   $0B
         STA   $13
         STX   $15
         LDA   $21
         LDX   $23
         CLC
         ADC   #$0004
         BCC   L07CA0F
         INX
L07CA0F  STA   $0F
         STX   $11
         LDA   [$0F]
         AND   [$13]
         CMP   [$13]
         BEQ   L07CA1E
         BRL   L07CAF1
L07CA1E  LDA   $1B
         ASL
         STA   $05
         LDA   $05
         SEC
         SBC   #$0002
         BVS   L07CA2E
         EOR   #$8000
L07CA2E  BPL   L07CA68
         LDA   #$0002
         STA   $0D
L07CA35  LDA   $13
         LDX   $15
         CLC
         ADC   #$0002
         BCC   L07CA40
         INX
L07CA40  STA   $13
         STX   $15
         LDA   $0F
         LDX   $11
         CLC
         ADC   #$0002
         BCC   L07CA4F
         INX
L07CA4F  STA   $0F
         STX   $11
         LDA   [$0F]
         AND   [$13]
         CMP   [$13]
         BEQ   L07CA5E
         BRL   L07CAF1
L07CA5E  LDA   $0D
         CMP   $05
         BEQ   L07CA68
         INC   $0D
         BRA   L07CA35
L07CA68  PHY
         PEI   $23
         PEI   $21
         PEI   $54
         PEI   $52
         JSL   L079091
         PLA
         LSR
         BCC   L07CAF1
         LDA   $25
         LDX   $27
         PEI   $5C
         PEI   $5A
         JSL   L150F53
         STA   $25
         STX   $27
         PEI   $27
         PEI   $25
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         CLC
         ADC   #$0014
         BCC   L07CA9C
         INX
L07CA9C  STA   $47
         STX   $49
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         JSL   L033477
         BEQ   L07CADC
         BVS   L07CAB3
         EOR   #$8000
L07CAB3  BPL   L07CADC
         PEI   $27
         PEI   $25
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         CLC
         ADC   #$0014
         BCC   L07CAC8
         INX
L07CAC8  STA   $47
         STX   $49
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         JSL   L1512A5
         STA   $25
         STX   $27
L07CADC  LDA   $25
         LDX   $27
         STA   $62
         STX   $64
         LDA   $37
         LDX   $39
         STA   L055081
         STX   L055083
         BRL   L07CBE3
L07CAF1  PEI   $23
         PEI   $21
         LDA   $29
         JSL   L150488
         JSL   L150F53
         STA   $21
         STX   $23
         LDA   $1D
         LDX   $1F
         CMP   $21
         BNE   L07CB0D
         CPX   $23
L07CB0D  BEQ   L07CB12
         BRL   L07CBCE
L07CB12  LDA   $50
         BEQ   L07CB22
         PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L07CB22
         BRL   L07CBE3
L07CB22  PEI   $35
         PEI   $33
         PEI   $17
         JSL   L0718DA
         PEI   $39
         PEI   $37
         PEA   $0000
         JSL   L074E17
         LDA   $3F
         LDX   $41
         CLC
         ADC   #$0006
         BCC   L07CB42
         INX
L07CB42  STA   $3F
         STX   $41
         LDA   $3B
         LDX   $3D
         CMP   $3F
         BNE   L07CB50
         CPX   $41
L07CB50  BNE   L07CB65
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         CLC
         ADC   #$0028
         BCC   L07CB61
         INX
L07CB61  STA   $3F
         STX   $41
L07CB65  LDY   #$0002
         LDA   [$3F],Y
         TAX
         LDA   [$3F]
         STA   $37
         STX   $39
         PHY
         PHY
         PEI   $39
         PEI   $37
         JSL   L077A01
         PLA
         STA   $33
         PLX
         STX   $35
         LDA   $33
         ORA   $35
         BNE   L07CB8E
         PEA   $000C
         JSL   L07272E
L07CB8E  PHY
         PEI   $35
         PEI   $33
         JSL   L0718FA
         PLA
         STA   $17
         LDY   #$0002
         LDA   [$33],Y
         TAX
         LDA   [$33]
         CLC
         ADC   #$0018
         BCC   L07CBA9
         INX
L07CBA9  STA   $21
         STX   $23
         PEI   $23
         PEI   $21
         LDY   #$0004
         LDA   [$3F],Y
         PEI   $29
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L07CBC6
         DEX
L07CBC6  JSL   L150F53
         STA   $1D
         STX   $1F
L07CBCE  LDA   $25
         LDX   $27
         CMP   $01
         BNE   L07CBD8
         CPX   $03
L07CBD8  BEQ   L07CBE3
         INC   $25
         BNE   L07CBE0
         INC   $27
L07CBE0  BRL   L07C9F8
L07CBE3  PEI   $35
         PEI   $33
         PEI   $17
         JSL   L0718DA
         PEI   $39
         PEI   $37
         PEA   $0000
         JSL   L074E17
L07CBF8  PEI   $45
         PEI   $43
         PEI   $19
         JSL   L0718DA
         PEI   $60
         PEI   $5E
         PEA   $0000
         JSL   L074AC6
L07CC0D  LDA   $4E
         STA   $60
         LDA   $4D
         STA   $5F
         LDA   $4B
         TCD
         TSC
         CLC
         ADC   #$005E
         TCS
         RTL

L07CC1F  PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         STZ   $3A
         PEI   $34
         PEI   $32
         LDA   #$0000
         TAX
         JSL   L033477
         BEQ   L07CC39
         BPL   L07CC3C
L07CC39  BRL   L07CD65
L07CC3C  PHY
         PHY
         PEI   $38
         PEI   $36
         JSL   L0772F8
         PLA
         STA   $21
         PLX
         STX   $23
         LDA   $21
         ORA   $23
         BNE   L07CC55
         BRL   L07CD65
L07CC55  LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         STA   $01
         STX   $03
         PEI   $34
         PEI   $32
         LDY   #$0016
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L033477
         BEQ   L07CC7F
         BVS   L07CC7A
         EOR   #$8000
L07CC7A  BPL   L07CC7F
         BRL   L07CD5A
L07CC7F  LDY   #$0018
         LDA   [$01],Y
         JSL   L150488
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         CLC
         ADC   #$0028
         BCC   L07CC9B
         INX
L07CC9B  STA   $15
         STX   $17
         LDA   $32
         LDX   $34
         STA   $1D
         STX   $1F
L07CCA7  PEI   $1F
         PEI   $1D
         LDY   #$0004
         LDA   [$15],Y
         JSL   L150488
         JSL   L033477
         BEQ   L07CCE7
         BVS   L07CCBF
         EOR   #$8000
L07CCBF  BPL   L07CCE7
         PEI   $1F
         PEI   $1D
         LDY   #$0004
         LDA   [$15],Y
         JSL   L150488
         JSL   L1512A5
         STA   $1D
         STX   $1F
         LDA   $15
         LDX   $17
         CLC
         ADC   #$0006
         BCC   L07CCE1
         INX
L07CCE1  STA   $15
         STX   $17
         BRA   L07CCA7
L07CCE7  LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $11
         STX   $13
         PHY
         PHY
         PEI   $13
         PEI   $11
         JSL   L077A01
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDA   $0D
         ORA   $0F
         BEQ   L07CD5A
         LDX   $1F
         LDA   $1D
         BNE   L07CD10
         DEX
L07CD10  DEC
         PEI   $1B
         PEI   $19
         JSL   L150D50
         PLA
         PLX
         CLC
         ADC   #$0018
         BCC   L07CD22
         INX
L07CD22  STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         PEI   $0B
         PEI   $09
         JSL   L150F53
         STA   $05
         STX   $07
         PEI   $30
         PEI   $2E
         PEI   $07
         PEI   $05
         PEI   $1B
         PEI   $19
         JSL   L070597
         LDA   #$0001
         STA   $3A
         PEI   $13
         PEI   $11
         PEA   $0001
         JSL   L074E17
L07CD5A  PEI   $38
         PEI   $36
         PEA   $0000
         JSL   L074AC6
L07CD65  LDA   $2C
         STA   $38
         LDA   $2B
         STA   $37
         LDA   $29
         TCD
         TSC
         CLC
         ADC   #$0036
         TCS
         RTL

L07CD77  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         STZ   $38
         STZ   $23
         PHY
         PHY
         PEI   $36
         PEI   $34
         JSL   L077A5B
         PLA
         STA   $1F
         PLX
         STX   $21
         PHY
         PHY
         PEI   $21
         PEI   $1F
         PEA   $0002
         JSL   L07963D
         PLA
         STA   $17
         PLX
         STX   $19
         LDA   $17
         ORA   $19
         BNE   L07CDAF
         BRL   L07CF3A
L07CDAF  LDY   #$0002
         LDA   [$1F],Y
         TAX
         LDA   [$1F]
         STA   $1B
         STX   $1D
         PHY
         PEI   $30
         PEI   $2E
         PEA   ^L041CB3
         PEA   L041CB3
         PEA   $0020
         JSL   L070A10
         PLA
         STA   $11
         LDY   #$0010
         LDA   [$1B],Y
         STA   $15
         LDA   #$0400
         AND   $15
         BEQ   L07CDE1
         LDA   #$0001
L07CDE1  STA   $0F
         LDA   #$1000
         AND   $15
         BEQ   L07CDED
         LDA   #$0001
L07CDED  STA   $0D
         LDA   #$EBFF
         AND   $15
         STA   $13
         LDA   $32
         BEQ   L07CE01
         LDA   #$1000
         ORA   $13
         STA   $13
L07CE01  LDA   $11
         CMP   $0F
         BEQ   L07CE0A
         BRL   L07CEDD
L07CE0A  LDA   $0F
         BEQ   L07CE3C
         PHY
         PEI   $36
         PEI   $34
         LDY   #$0006
         LDA   [$1B],Y
         PHA
         DEY
         DEY
         LDA   [$1B],Y
         PHA
         LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         SEC
         SBC   #$0020
         BCS   L07CE2D
         DEX
L07CE2D  PHX
         PHA
         JSL   L077EAF
         PLA
         LSR
         BCS   L07CE3A
         BRL   L07CF3A
L07CE3A  BRA   L07CE52
L07CE3C  PHY
         PEI   $36
         PEI   $34
         PEA   $0000
         PEA   $0020
         JSL   L07B813
         PLA
         LSR
         BCS   L07CE52
         BRL   L07CF3A
L07CE52  PHY
         PHY
         PEI   $21
         PEI   $1F
         PEA   $0002
         JSL   L07963D
         PLA
         STA   $17
         PLX
         STX   $19
         LDA   $17
         LDX   $19
         STA   $09
         STX   $0B
         LDA   $17
         LDX   $19
         STA   $05
         STX   $07
         LDA   $0F
         BEQ   L07CE8A
         LDA   $09
         LDX   $0B
         CLC
         ADC   #$0020
         BCC   L07CE84
         INX
L07CE84  STA   $09
         STX   $0B
         BRA   L07CE99
L07CE8A  LDA   $05
         LDX   $07
         CLC
         ADC   #$0020
         BCC   L07CE95
         INX
L07CE95  STA   $05
         STX   $07
L07CE99  LDY   #$0002
         LDA   [$1F],Y
         PHA
         LDA   [$1F]
         PHA
         LDY   #$0002
         LDA   [$1F],Y
         TAX
         LDA   [$1F]
         STA   $25
         STX   $27
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         JSL   L150F53
         STA   $01
         STX   $03
         PEI   $0B
         PEI   $09
         PEI   $07
         PEI   $05
         PEI   $03
         PEI   $01
         LDA   $05
         LDX   $07
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         LDA   #$0001
         STA   $23
L07CEDD  LDA   $11
         BNE   L07CF13
         PHY
         PEI   $30
         PEI   $2E
         PEI   $19
         PEI   $17
         PEA   $0020
         JSL   L070A10
         PLA
         LSR
         BCS   L07CF0C
         PEI   $30
         PEI   $2E
         PEI   $19
         PEI   $17
         PEA   $0000
         PEA   $0020
         JSL   L070597
         LDA   #$0001
         STA   $23
L07CF0C  LDA   #$0400
         ORA   $13
         STA   $13
L07CF13  LDA   $15
         CMP   $13
         BEQ   L07CF35
         LDY   #$0002
         LDA   [$1F],Y
         TAX
         LDA   [$1F]
         CLC
         ADC   #$0010
         BCC   L07CF28
         INX
L07CF28  STA   $25
         STX   $27
         LDA   $13
         STA   [$25]
         LDA   #$0001
         STA   $23
L07CF35  LDA   #$0001
         STA   $38
L07CF3A  LDA   $1F
         ORA   $21
         BEQ   L07CF4A
         PEI   $36
         PEI   $34
         PEI   $23
         JSL   L074E4D
L07CF4A  LDA   $2C
         STA   $36
         LDA   $2B
         STA   $35
         LDA   $29
         TCD
         TSC
         CLC
         ADC   #$0034
         TCS
         RTL

L07CF5C  PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         STZ   $2A
         LDY   #$001D
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
         STA   $1D
         STX   $1F
         LDY   #$0002
         LDA   [$1D],Y
         TAX
         LDA   [$1D]
         STA   $15
         STX   $17
         PHY
         LDY   #$0034
         LDA   [$26],Y
         PHA
         DEY
         DEY
         LDA   [$26],Y
         PHA
         PEA   $0000
         PEA   $0004
         JSL   L07B813
         PLA
         LSR
         BCS   L07CFA9
         BRL   L07D078
L07CFA9  PHY
         PHY
         PEI   $1B
         PEI   $19
         PEA   $0000
         JSL   L07963D
         PLA
         PLX
         SEC
         SBC   #$000E
         BCS   L07CFBF
         DEX
L07CFBF  STA   $11
         STX   $13
         PHY
         PHY
         PEI   $1B
         PEI   $19
         PEA   $0001
         JSL   L07963D
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDA   $0D
         LDX   $0F
         CLC
         ADC   #$0004
         BCC   L07CFE1
         INX
L07CFE1  STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$19],Y
         PHA
         LDA   [$19]
         PHA
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         STA   $1D
         STX   $1F
         LDY   #$0002
         LDA   [$1D],Y
         TAX
         LDA   [$1D]
         JSL   L150F53
         STA   $05
         STX   $07
         PEI   $0F
         PEI   $0D
         PEI   $0B
         PEI   $09
         PEI   $07
         PEI   $05
         LDA   $09
         LDX   $0B
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         LDY   #$0030
         LDA   [$26],Y
         STA   [$0D]
         LDA   $0D
         LDX   $0F
         CLC
         ADC   #$0002
         BCC   L07D036
         INX
L07D036  STA   $0D
         STX   $0F
         LDY   #$002E
         LDA   [$26],Y
         BEQ   L07D048
         LDA   #$0081
         STA   [$0D]
         BRA   L07D04D
L07D048  LDA   #$0080
         STA   [$0D]
L07D04D  LDY   #$0008
         LDA   [$11],Y
         INC
         LDY   #$0008
         STA   [$11],Y
         LDY   #$000C
         LDA   [$11],Y
         TAX
         DEY
         DEY
         LDA   [$11],Y
         CLC
         ADC   #$0004
         BCC   L07D069
         INX
L07D069  LDY   #$000A
         STA   [$11],Y
         INY
         INY
         TXA
         STA   [$11],Y
         LDA   #$0001
         STA   $2A
L07D078  LDA   $24
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

L07D08A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFDE
         TCS
         TCD
         STZ   $3A
         LDA   #$0000
         STA   [$28]
         STZ   $1B
         STZ   $1D
         STZ   $17
         STZ   $19
         STZ   $15
         STZ   $13
         PHY
         PHY
         PEI   $34
         PEI   $32
         JSL   L0772AE
         PLA
         STA   $1B
         PLX
         STX   $1D
         LDA   $1B
         ORA   $1D
         BNE   L07D0BE
         BRL   L07D1BB
L07D0BE  PHY
         PHY
         PEI   $38
         PEI   $36
         JSL   L07721A
         PLA
         STA   $17
         PLX
         STX   $19
         LDA   $17
         ORA   $19
         BNE   L07D0D7
         BRL   L07D1BB
L07D0D7  LDX   #$0000
         LDA   $30
         BPL   L07D0DF
         INX
L07D0DF  TXA
         STA   $0B
         LDA   $0B
         BEQ   L07D101
         PHY
         PHY
         PEI   $1D
         PEI   $1B
         LDA   $30
         EOR   #$FFFF
         INC
         PHA
         JSL   L0791A7
         PLA
         STA   $0F
         PLX
         STX   $11
         STZ   $0D
         BRA   L07D127
L07D101  PHY
         PHY
         PEI   $19
         PEI   $17
         PEI   $30
         JSL   L0791A7
         PLA
         STA   $0F
         PLX
         STX   $11
         LDX   #$0000
         LDY   #$0004
         LDA   #$4000
         AND   [$0F],Y
         CMP   #$0000
         BEQ   L07D124
         INX
L07D124  TXA
         STA   $0D
L07D127  LDA   $0D
         ORA   $0B
         STA   $09
         LDA   $09
         BEQ   L07D15D
         LDX   #$0000
         LDY   #$000E
         LDA   #$4000
         AND   [$0F],Y
         CMP   #$0000
         BEQ   L07D142
         INX
L07D142  TXA
         STA   $07
         LDA   $2E
         CMP   $07
         BNE   L07D14E
         BRL   L07D1D4
L07D14E  LDY   #$000E
         LDA   #$4000
         EOR   [$0F],Y
         LDY   #$000E
         STA   [$0F],Y
         BRA   L07D1BB
L07D15D  PHY
         PHY
         PEI   $19
         PEI   $17
         PEI   $1D
         PEI   $1B
         PEI   $30
         PEI   $0D
         JSL   L07B038
         PLA
         STA   $03
         PLX
         STX   $05
         LDA   $03
         ORA   $05
         BNE   L07D197
         LDA   $2E
         BNE   L07D181
         BRA   L07D1D4
L07D181  PHY
         PEA   $0000
         PHD
         JSL   L07CF5C
         PLA
         LSR
         BCS   L07D190
         BRA   L07D1D4
L07D190  LDA   #$0001
         STA   $2C
         BRA   L07D1BB
L07D197  LDA   [$03]
         STA   $01
         LDX   #$0000
         LDA   #$0081
         CMP   $01
         BNE   L07D1A6
         INX
L07D1A6  TXA
         STA   $07
         LDA   $2E
         CMP   $07
         BEQ   L07D1D4
         LDA   #$0080
         CLC
         ADC   $2E
         STA   $01
         LDA   $01
         STA   [$03]
L07D1BB  LDA   $2C
         BEQ   L07D1CF
         LDA   $0D
         EOR   #$0001
         ORA   $0B
         STA   $15
         LDA   $15
         EOR   #$0001
         STA   $13
L07D1CF  LDA   #$0001
         STA   [$28]
L07D1D4  LDA   $1B
         ORA   $1D
         BEQ   L07D1E4
         PEI   $34
         PEI   $32
         PEI   $15
         JSL   L074A90
L07D1E4  LDA   $17
         ORA   $19
         BEQ   L07D1F4
         PEI   $38
         PEI   $36
         PEI   $13
         JSL   L074A24
L07D1F4  LDA   #$0001
         STA   $3A
         LDA   $26
         STA   $38
         LDA   $25
         STA   $37
         LDA   $23
         TCD
         TSC
         CLC
         ADC   #$0036
         TCS
         RTL

L07D20B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE2
         TCS
         TCD
         STZ   $2C
         PHY
         PEI   $26
         PEI   $24
         JSL   L070157
         PLA
         LSR
         BCC   L07D225
         BRL   L07D390
L07D225  LDA   #$00FF
         AND   [$24]
         INC
         STA   $13
         PHY
         PEI   $2A
         PEI   $28
         LDA   $13
         JSL   L150488
         PHX
         PHA
         JSL   L07B813
         PLA
         LSR
         BCS   L07D245
         BRL   L07D390
L07D245  PHY
         PHY
         PEI   $2A
         PEI   $28
         JSL   L077A5B
         PLA
         STA   $17
         PLX
         STX   $19
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         CLC
         ADC   #$0004
         BCC   L07D264
         INX
L07D264  STA   $1B
         STX   $1D
         LDA   #$4143
         LDX   #$4452
         CMP   [$1B]
         BNE   L07D278
         LDY   #$0002
         TXA
         CMP   [$1B],Y
L07D278  BEQ   L07D27F
         LDA   #$0000
         BRA   L07D282
L07D27F  LDA   #$0001
L07D282  STA   $01
         PHY
         PHY
         PEI   $19
         PEI   $17
         PEA   $0003
         JSL   L07963D
         PLA
         STA   $0F
         PLX
         STX   $11
         PHY
         PHY
         PEI   $11
         PEI   $0F
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L07D2A7
         INX
L07D2A7  STA   $15
         LDA   $15
         CMP   $13
         BEQ   L07D31E
         PEI   $11
         PEI   $0F
         LDA   $15
         JSL   L150488
         JSL   L150F53
         STA   $0B
         STX   $0D
         PEI   $11
         PEI   $0F
         LDA   $13
         JSL   L150488
         JSL   L150F53
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$17],Y
         PHA
         LDA   [$17]
         PHA
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         STA   $1B
         STX   $1D
         LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         JSL   L150F53
         STA   $03
         STX   $05
         PEI   $0D
         PEI   $0B
         PEI   $09
         PEI   $07
         PEI   $05
         PEI   $03
         LDA   $0B
         LDX   $0D
         JSL   L1512A5
         PHX
         PHA
         LDA   $13
         JSL   L150488
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
L07D31E  LDA   #$0001
         CLC
         ADC   $24
         LDX   $26
         BCC   L07D329
         INX
L07D329  PHX
         PHA
         PEI   $11
         PEI   $0F
         LDA   $13
         DEC
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         PEI   $11
         PEI   $0F
         LDA   $13
         DEC
         JSL   L150488
         JSL   L150F53
         STA   $0F
         STX   $11
         SEP   #$20
         LDA   #$00
         STA   [$0F]
         REP   #$20
         LDA   #$0001
         STA   $2C
         PEI   $2A
         PEI   $28
         PEA   $0001
         JSL   L074E4D
         LDA   $01
         BEQ   L07D390
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $2A
         PEI   $28
         JSL   L07C5A6
         PEA   $0000
         JSL   L07E171
L07D390  LDA   $22
         STA   $2A
         LDA   $21
         STA   $29
         LDA   $1F
         TCD
         TSC
         CLC
         ADC   #$0028
         TCS
         RTL

L07D3A2  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCC
         TCS
         TCD
         STZ   $42
         PHY
         PHY
         LDY   #$0002
         LDA   [$3A],Y
         PHA
         LDA   [$3A]
         PHA
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L07D3C1
         INX
L07D3C1  STA   $1D
         STX   $1F
         LDA   $1D
         LDX   $1F
         CLC
         ADC   #$0004
         BCC   L07D3D0
         INX
L07D3D0  STA   $19
         STX   $1B
         PEI   $1F
         PEI   $1D
         LDA   #$7530
         LDX   #$0000
         JSL   L033477
         BEQ   L07D3EE
         BVS   L07D3E9
         EOR   #$8000
L07D3E9  BPL   L07D3EE
         BRL   L07D573
L07D3EE  PHY
         PEI   $40
         PEI   $3E
         PEI   $1B
         PEI   $19
         JSL   L07B813
         PLA
         LSR
         BCS   L07D402
         BRL   L07D573
L07D402  PHY
         PHY
         PEI   $40
         PEI   $3E
         JSL   L077A5B
         PLA
         STA   $2D
         PLX
         STX   $2F
         LDY   #$0002
         LDA   [$2D],Y
         TAX
         LDA   [$2D]
         CLC
         ADC   #$0004
         BCC   L07D421
         INX
L07D421  STA   $31
         STX   $33
         LDY   #$0002
         LDA   [$31],Y
         TAX
         LDA   [$31]
         STA   $29
         STX   $2B
         PHY
         PHY
         PEI   $2F
         PEI   $2D
         PEA   $0004
         JSL   L07963D
         PLA
         STA   $15
         PLX
         STX   $17
         LDA   $15
         LDX   $17
         STA   $05
         STX   $07
         PEI   $17
         PEI   $15
         LDA   [$05]
         JSL   L150488
         JSL   L150F53
         STA   $15
         STX   $17
         PHY
         PHY
         PEI   $17
         PEI   $15
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L07D46E
         INX
L07D46E  STA   $25
         STX   $27
         PEI   $27
         PEI   $25
         LDA   [$05]
         JSL   L150488
         JSL   L150F53
         STA   $21
         STX   $23
         LDA   $21
         LDX   $23
         CMP   $19
         BNE   L07D48E
         CPX   $1B
L07D48E  BEQ   L07D4F9
         LDA   $05
         LDX   $07
         PEI   $23
         PEI   $21
         JSL   L150F53
         STA   $11
         STX   $13
         LDA   $05
         LDX   $07
         PEI   $1B
         PEI   $19
         JSL   L150F53
         STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$2D],Y
         PHA
         LDA   [$2D]
         PHA
         LDY   #$0002
         LDA   [$2D],Y
         TAX
         LDA   [$2D]
         STA   $31
         STX   $33
         LDY   #$0002
         LDA   [$31],Y
         TAX
         LDA   [$31]
         JSL   L150F53
         STA   $09
         STX   $0B
         PEI   $13
         PEI   $11
         PEI   $0F
         PEI   $0D
         PEI   $0B
         PEI   $09
         LDA   $05
         LDX   $07
         JSL   L1512A5
         PHX
         PHA
         LDA   $19
         LDX   $1B
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
L07D4F9  LDA   #$0004
         STA   $01
         STZ   $03
         LDA   $01
         LDX   $03
         STA   [$05]
         TXA
         LDY   #$0002
         STA   [$05],Y
         LDY   #$0002
         LDA   [$3A],Y
         TAX
         LDA   [$3A]
         STA   $11
         STX   $13
         LDA   $05
         LDX   $07
         CLC
         ADC   #$0004
         BCC   L07D523
         INX
L07D523  STA   $0D
         STX   $0F
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L070669
         LDA   #$0001
         STA   $42
         PEI   $40
         PEI   $3E
         PEA   $0001
         JSL   L074E4D
         LDA   #$4143
         LDX   #$4452
         CMP   $29
         BNE   L07D559
         CPX   $2B
L07D559  BNE   L07D568
         PEI   $40
         PEI   $3E
         PEA   $0000
         JSL   L0B86C4
         BRA   L07D573
L07D568  PEI   $40
         PEI   $3E
         PEA   $0000
         JSL   L0B8607
L07D573  LDA   $38
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

L07D585  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $40
         PEI   $3E
         PEA   $002A
         JSL   L0313BE
         STZ   $46
         LDX   #$0000
         LDA   $1D
         BEQ   L07D5AC
         BPL   L07D5AD
L07D5AC  INX
L07D5AD  TXA
         PHA
         LDX   #$0000
         LDA   $21
         BEQ   L07D5B8
         BPL   L07D5B9
L07D5B8  INX
L07D5B9  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L07D5C2
         BRA   L07D638
L07D5C2  PHY
         PHY
         PEI   $44
         PEI   $42
         JSL   L077A5B
         PLA
         STA   $2D
         PLX
         STX   $2F
         LDA   $2D
         ORA   $2F
         BEQ   L07D638
         STZ   $2B
         PHY
         PHY
         PEI   $2F
         PEI   $2D
         PEI   $03
         JSL   L0791A7
         PLA
         STA   $31
         PLX
         STX   $33
         LDA   $31
         ORA   $33
         BEQ   L07D62E
         LDA   [$31]
         STA   $01
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $33
         PEI   $31
         PEA   $002A
         JSL   L070A10
         PLA
         EOR   #$0001
         STA   $2B
         LDA   $2B
         BEQ   L07D629
         PEI   $33
         PEI   $31
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $002A
         JSL   L0313BE
L07D629  LDA   #$0001
         STA   $46
L07D62E  PEI   $44
         PEI   $42
         PEI   $2B
         JSL   L074E4D
L07D638  LDA   $3C
         STA   $44
         LDA   $3B
         STA   $43
         LDA   $39
         TCD
         TSC
         CLC
         ADC   #$0042
         TCS
         RTL

L07D64A  ENT
         PHD
         TSC
         CLC
         ADC   #$FDCE
         TCS
         ADC   #$0145
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBB
         PHA
         PEI   $F4
         PEI   $F2
         PEA   $0100
         JSL   L0313BE
         STZ   $FC
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBB
         PHA
         JSL   L070157
         PLA
         LSR
         BCC   L07D680
         BRL   L07D700
L07D680  PHY
         PEI   $FA
         PEI   $F8
         PEI   $F6
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBB
         PHA
         TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         JSL   L07DFBC
         PLA
         LSR
         BCC   L07D700
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBB
         PHA
         LDA   #$00FF
         LDX   #$FEBB
         AND   $00,X
         INC
         PHA
         JSL   L070A10
         PLA
         LSR
         BCC   L07D6D6
         LDA   #$0001
         STA   $FC
         BRA   L07D6F8
L07D6D6  PHY
         PEI   $FA
         PEI   $F8
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBB
         PHA
         PEI   $BD
         PEI   $BB
         JSL   L07B98A
         PLA
         STA   $FC
L07D6F8  PEI   $BD
         PEI   $BB
         JSL   L07185A
L07D700  LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$023E
         TCS
         RTL

L07D712  ENT
         PHD
         TSC
         CLC
         ADC   #$FEC6
         TCS
         ADC   #$004D
         TCD
         STZ   $FC
         PHY
         PHY
         LDY   #$0002
         LDA   [$F2],Y
         PHA
         LDA   [$F2]
         PHA
         JSL   L071C98
         PLA
         STA   $B3
         PLX
         STX   $B5
         PEI   $B5
         PEI   $B3
         LDA   #$7530
         LDX   #$0000
         JSL   L033477
         BEQ   L07D74E
         BVS   L07D749
         EOR   #$8000
L07D749  BPL   L07D74E
         BRL   L07D7FD
L07D74E  PHY
         PEI   $FA
         PEI   $F8
         PEI   $F6
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB3
         PHA
         TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         JSL   L07DFBC
         PLA
         LSR
         BCS   L07D77B
         BRL   L07D7FD
L07D77B  PHY
         PHY
         LDY   #$0002
         LDA   [$BB],Y
         PHA
         LDA   [$BB]
         PHA
         JSL   L071C98
         PLA
         STA   $B7
         PLX
         STX   $B9
         LDA   $B3
         LDX   $B5
         CMP   $B7
         BNE   L07D79A
         CPX   $B9
L07D79A  BEQ   L07D7A1
         LDA   #$0000
         BRA   L07D7A4
L07D7A1  LDA   #$0001
L07D7A4  BEQ   L07D7C9
         PHY
         LDY   #$0002
         LDA   [$F2],Y
         PHA
         LDA   [$F2]
         PHA
         LDY   #$0002
         LDA   [$BB],Y
         PHA
         LDA   [$BB]
         PHA
         PEI   $B3
         JSL   L070A10
         PLA
         BEQ   L07D7C9
         LDA   #$0001
         STA   $FC
         BRA   L07D7F5
L07D7C9  PHY
         PEI   $FA
         PEI   $F8
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB3
         PHA
         PEI   $F4
         PEI   $F2
         JSL   L07B98A
         PLA
         STA   $FC
         PEI   $FA
         PEI   $F8
         PEI   $F6
         JSL   L0B878F
L07D7F5  PEI   $BD
         PEI   $BB
         JSL   L07185A
L07D7FD  LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$0146
         TCS
         RTL

L07D80F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFA6
         TCS
         TCD
         LDA   #$FFFF
         STA   $72
         STZ   $55
         STZ   $53
         LDA   #$0000
         STA   [$60]
         STZ   $4F
         STZ   $51
         STZ   $4B
         STZ   $4D
         LDA   $68
         BNE   L07D839
         LDA   #$0001
         STA   $72
         BRL   L07DD20
L07D839  PHY
         PHY
         PEI   $66
         PEI   $64
         JSL   L071C98
         PLA
         STA   $47
         PLX
         STX   $49
         PEI   $49
         PEI   $47
         LDA   #$7530
         LDX   #$0000
         JSL   L033477
         BEQ   L07D868
         BVS   L07D85E
         EOR   #$8000
L07D85E  BPL   L07D868
         LDA   #$0002
         STA   $72
         BRL   L07DD20
L07D868  LDA   $47
         LDX   $49
         CLC
         ADC   #$0003
         BCC   L07D873
         INX
L07D873  STA   $47
         STX   $49
         PHY
         PHY
         PEI   $6C
         PEI   $6A
         JSL   L0772AE
         PLA
         STA   $4F
         PLX
         STX   $51
         LDA   $4F
         ORA   $51
         BNE   L07D890
         BRL   L07DD20
L07D890  PHY
         PHY
         PEI   $70
         PEI   $6E
         JSL   L07721A
         PLA
         STA   $4B
         PLX
         STX   $4D
         LDA   $4B
         ORA   $4D
         BNE   L07D8A9
         BRL   L07DD20
L07D8A9  LDX   #$0000
         LDA   $68
         BPL   L07D8B1
         INX
L07D8B1  TXA
         STA   $45
         LDA   $45
         BEQ   L07D8BC
         STZ   $43
         BRA   L07D8E2
L07D8BC  PHY
         PHY
         PEI   $4D
         PEI   $4B
         PEI   $68
         JSL   L0791A7
         PLA
         STA   $3F
         PLX
         STX   $41
         LDX   #$0000
         LDY   #$0004
         LDA   #$4000
         AND   [$3F],Y
         CMP   #$0000
         BEQ   L07D8DF
         INX
L07D8DF  TXA
         STA   $43
L07D8E2  LDA   $43
         BEQ   L07D904
         LDA   #$4B42
         LDX   #$4447
         STA   $3B
         STX   $3D
         LDA   $4B
         LDX   $4D
         STA   $37
         STX   $39
         LDA   #$0032
         LDX   #$0000
         STA   $23
         STX   $25
         BRA   L07D920
L07D904  LDA   #$4143
         LDX   #$4452
         STA   $3B
         STX   $3D
         LDA   $4F
         LDX   $51
         STA   $37
         STX   $39
         LDA   #$0032
         LDX   #$0000
         STA   $23
         STX   $25
L07D920  LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         CLC
         ADC   #$0008
         BCC   L07D92F
         INX
L07D92F  STA   $57
         STX   $59
         LDY   #$0002
         LDA   [$57],Y
         TAX
         LDA   [$57]
         STA   $33
         STX   $35
         PHY
         PHY
         PEI   $39
         PEI   $37
         JSL   L07DF0D
         PLA
         STA   $2F
         PLX
         STX   $31
         PHY
         PHY
         PEI   $4D
         PEI   $4B
         PEI   $51
         PEI   $4F
         PEI   $68
         PEI   $43
         JSL   L07B038
         PLA
         STA   $2B
         PLX
         STX   $2D
         LDA   $2B
         ORA   $2D
         BNE   L07D973
         STZ   $27
         STZ   $29
         BRA   L07D99E
L07D973  PHY
         PHY
         PEI   $2D
         PEI   $2B
         JSL   L071C98
         PLA
         PLX
         CLC
         ADC   #$0003
         BCC   L07D986
         INX
L07D986  STA   $27
         STX   $29
         PEI   $2D
         PEI   $2B
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         JSL   L1512A5
         STA   $01
         STX   $03
L07D99E  LDA   $27
         LDX   $29
         CMP   $47
         BNE   L07D9A8
         CPX   $49
L07D9A8  BNE   L07D9DB
         LDA   #$0003
         LDX   #$0000
         CMP   $47
         BNE   L07D9B6
         CPX   $49
L07D9B6  BNE   L07D9BB
         BRL   L07DD1E
L07D9BB  PHY
         PEI   $2D
         PEI   $2B
         PEI   $66
         PEI   $64
         LDA   $47
         LDX   $49
         SEC
         SBC   #$0003
         BCS   L07D9CF
         DEX
L07D9CF  PHA
         JSL   L070A10
         PLA
         LSR
         BCC   L07D9DB
         BRL   L07DD1E
L07D9DB  LDA   $2F
         LDX   $31
         PEI   $49
         PEI   $47
         JSL   L150F53
         PHX
         PHA
         LDA   $27
         LDX   $29
         JSL   L1512A5
         STA   $1F
         STX   $21
         LDA   #$0003
         LDX   #$0000
         CMP   $47
         BNE   L07DA01
         CPX   $49
L07DA01  BEQ   L07DA06
         BRL   L07DAC0
L07DA06  LDA   $2B
         ORA   $2D
         BNE   L07DA0F
         BRL   L07DD1E
L07DA0F  LDA   $2B
         LDX   $2D
         SEC
         SBC   #$0002
         BCS   L07DA1A
         DEX
L07DA1A  STA   $1B
         STX   $1D
         LDA   $1B
         LDX   $1D
         PEI   $29
         PEI   $27
         JSL   L150F53
         STA   $17
         STX   $19
         LDY   #$0002
         LDA   [$37],Y
         PHA
         LDA   [$37]
         PHA
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         STA   $57
         STX   $59
         LDY   #$0002
         LDA   [$57],Y
         TAX
         LDA   [$57]
         JSL   L150F53
         STA   $13
         STX   $15
         PEI   $19
         PEI   $17
         PEI   $1D
         PEI   $1B
         PEI   $15
         PEI   $13
         LDA   $17
         LDX   $19
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         PEI   $25
         PEI   $23
         JSL   L150F53
         SEC
         SBC   #$000E
         BCS   L07DA84
         DEX
L07DA84  STA   $0F
         STX   $11
         LDY   #$0008
         LDA   [$0F],Y
         DEC
         LDY   #$0008
         STA   [$0F],Y
         LDA   #$000A
         CLC
         ADC   $0F
         LDX   $11
         BCC   L07DA9E
         INX
L07DA9E  STA   $57
         STX   $59
         LDY   #$000C
         LDA   [$0F],Y
         PHA
         DEY
         DEY
         LDA   [$0F],Y
         PHA
         LDA   $27
         LDX   $29
         JSL   L1512A5
         STA   [$57]
         TXA
         LDY   #$0002
         STA   [$57],Y
         BRL   L07DC7C
L07DAC0  PEI   $21
         PEI   $1F
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         STA   $57
         STX   $59
         LDY   #$0002
         LDA   [$57],Y
         TAX
         LDA   [$57]
         JSL   L033477
         BEQ   L07DB02
         BVS   L07DAE3
         EOR   #$8000
L07DAE3  BPL   L07DB02
         PHY
         PEI   $35
         PEI   $33
         PEI   $3D
         PEI   $3B
         PEI   $21
         PEI   $1F
         JSL   L077EAF
         PLA
         LSR
         BCS   L07DB02
         LDA   #$0003
         STA   $72
         BRL   L07DD20
L07DB02  LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         PEI   $25
         PEI   $23
         JSL   L150F53
         SEC
         SBC   #$000E
         BCS   L07DB19
         DEX
L07DB19  STA   $0F
         STX   $11
         LDA   $2B
         ORA   $2D
         BNE   L07DB6A
         PEI   $25
         PEI   $23
         LDY   #$0006
         LDA   [$0F],Y
         TAX
         DEY
         DEY
         LDA   [$0F],Y
         JSL   L150F53
         PHX
         PHA
         LDY   #$000C
         LDA   [$0F],Y
         TAX
         DEY
         DEY
         LDA   [$0F],Y
         JSL   L150F53
         STA   $23
         STX   $25
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         PEI   $25
         PEI   $23
         JSL   L150F53
         STA   $2B
         STX   $2D
         LDY   #$0008
         LDA   [$0F],Y
         INC
         LDY   #$0008
         STA   [$0F],Y
         BRA   L07DB85
L07DB6A  LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         PEI   $03
         PEI   $01
         JSL   L150F53
         SEC
         SBC   #$0002
         BCS   L07DB81
         DEX
L07DB81  STA   $2B
         STX   $2D
L07DB85  LDA   $27
         LDX   $29
         CMP   $47
         BNE   L07DB8F
         CPX   $49
L07DB8F  BNE   L07DB94
         BRL   L07DC53
L07DB94  LDA   #$000A
         CLC
         ADC   $0F
         LDX   $11
         BCC   L07DB9F
         INX
L07DB9F  STA   $57
         STX   $59
         LDY   #$000C
         LDA   [$0F],Y
         TAX
         DEY
         DEY
         LDA   [$0F],Y
         PEI   $49
         PEI   $47
         JSL   L150F53
         PHX
         PHA
         LDA   $27
         LDX   $29
         JSL   L1512A5
         STA   [$57]
         TXA
         LDY   #$0002
         STA   [$57],Y
         LDA   $2B
         LDX   $2D
         PEI   $29
         PEI   $27
         JSL   L150F53
         STA   $17
         STX   $19
         LDA   $2B
         LDX   $2D
         PEI   $49
         PEI   $47
         JSL   L150F53
         STA   $1B
         STX   $1D
         LDY   #$0002
         LDA   [$37],Y
         PHA
         LDA   [$37]
         PHA
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         STA   $57
         STX   $59
         LDY   #$0002
         LDA   [$57],Y
         TAX
         LDA   [$57]
         JSL   L150F53
         STA   $13
         STX   $15
         PEI   $49
         PEI   $47
         LDA   $27
         LDX   $29
         JSL   L033477
         BEQ   L07DC33
         BVS   L07DC1F
         EOR   #$8000
L07DC1F  BPL   L07DC33
         PEI   $15
         PEI   $13
         LDA   $1B
         LDX   $1D
         JSL   L1512A5
         STA   $0B
         STX   $0D
         BRA   L07DC43
L07DC33  PEI   $15
         PEI   $13
         LDA   $17
         LDX   $19
         JSL   L1512A5
         STA   $0B
         STX   $0D
L07DC43  PEI   $19
         PEI   $17
         PEI   $1D
         PEI   $1B
         PEI   $0D
         PEI   $0B
         JSL   L1511CE
L07DC53  LDA   $68
         STA   [$2B]
         LDA   $2B
         LDX   $2D
         CLC
         ADC   #$0002
         BCC   L07DC62
         INX
L07DC62  STA   $1B
         STX   $1D
         TDC
         CLC
         ADC   #$0064
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$001B
         PEA   $0000
         PHA
         JSL   L070669
L07DC7C  LDA   $43
         BEQ   L07DC87
         LDA   #$0001
         STA   $55
         BRA   L07DCDE
L07DC87  LDA   #$0001
         STA   $53
         LDA   L055027
         LDX   L055029
         CMP   $33
         BNE   L07DC98
         CPX   $35
L07DC98  BNE   L07DCA2
         LDA   #$0001
         STA   L055057
         BRA   L07DCDE
L07DCA2  PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $35
         PEI   $33
         JSL   L07C5A6
         PLA
         STA   $07
         PLX
         STX   $09
         LDA   $07
         ORA   $09
         BNE   L07DCC9
         LDA   #$0004
         STA   $72
         BRA   L07DD20
L07DCC9  LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $09
         PEI   $07
         PEA   $0000
         JSL   L07E171
L07DCDE  LDA   $1F
         LDX   $21
         CLC
         ADC   #$0400
         BCC   L07DCE9
         INX
L07DCE9  PHX
         PHA
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         STA   $57
         STX   $59
         LDY   #$0002
         LDA   [$57],Y
         TAX
         LDA   [$57]
         JSL   L033477
         BVS   L07DD08
         EOR   #$8000
L07DD08  BMI   L07DD1E
         PHY
         PEI   $35
         PEI   $33
         PEI   $3D
         PEI   $3B
         PEI   $21
         PEI   $1F
         JSL   L077EAF
         PLA
         STA   $05
L07DD1E  STZ   $72
L07DD20  LDA   $4F
         ORA   $51
         BEQ   L07DD30
         PEI   $6C
         PEI   $6A
         PEI   $53
         JSL   L074A90
L07DD30  LDA   $4B
         ORA   $4D
         BEQ   L07DD40
         PEI   $70
         PEI   $6E
         PEI   $55
         JSL   L074A24
L07DD40  LDA   $55
         ORA   $53
         STA   [$60]
         LDA   $5E
         STA   $70
         LDA   $5D
         STA   $6F
         LDA   $5B
         TCD
         TSC
         CLC
         ADC   #$006E
         TCS
         RTL

L07DD58  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD2
         TCS
         TCD
         STZ   $3C
         LDY   #$0002
         LDA   [$34],Y
         TAX
         LDA   [$34]
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         STA   $0B
         LDA   [$07]
         STA   $19
         LDX   #$0000
         LDA   $0B
         BMI   L07DD83
         BEQ   L07DD83
         INX
L07DD83  TXA
         BNE   L07DD89
         BRL   L07DEFB
L07DD89  PHY
         PEI   $3A
         PEI   $38
         LDA   $19
         JSL   L150488
         PHX
         PHA
         JSL   L07B813
         PLA
         BNE   L07DDA0
         BRL   L07DEFB
L07DDA0  PHY
         PHY
         PEI   $3A
         PEI   $38
         JSL   L077A5B
         PLA
         STA   $27
         PLX
         STX   $29
         PHY
         PHY
         PEI   $29
         PEI   $27
         PEA   $0000
         JSL   L07963D
         PLA
         STA   $23
         PLX
         STX   $25
         LDA   $23
         LDX   $25
         SEC
         SBC   #$000E
         BCS   L07DDCE
         DEX
L07DDCE  STA   $1F
         STX   $21
         LDA   [$1F]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L07DDE1
         EOR   #$8000
L07DDE1  BMI   L07DDE6
         BRL   L07DEF0
L07DDE6  LDA   #$0001
         STA   $1D
L07DDEB  LDA   [$23]
         STA   $1B
         LDY   #$0002
         LDA   $0B
         CMP   [$23],Y
         BEQ   L07DDFB
         BRL   L07DED3
L07DDFB  LDA   $1B
         CMP   $19
         BNE   L07DE04
         BRL   L07DEB3
L07DE04  PEI   $25
         PEI   $23
         LDA   $1B
         JSL   L150488
         JSL   L150F53
         STA   $15
         STX   $17
         PEI   $25
         PEI   $23
         LDA   $19
         JSL   L150488
         JSL   L150F53
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$27],Y
         PHA
         LDA   [$27]
         PHA
         LDY   #$0002
         LDA   [$27],Y
         TAX
         LDA   [$27]
         STA   $2B
         STX   $2D
         LDY   #$0002
         LDA   [$2B],Y
         TAX
         LDA   [$2B]
         JSL   L150F53
         STA   $0D
         STX   $0F
         PEI   $17
         PEI   $15
         PEI   $13
         PEI   $11
         PEI   $0F
         PEI   $0D
         LDA   $15
         LDX   $17
         JSL   L1512A5
         PHX
         PHA
         LDA   $19
         JSL   L150488
         JSL   L1512A5
         PHX
         PHA
         JSL   L1511CE
         LDA   $1F
         LDX   $21
         STA   $03
         STX   $05
         LDA   #$0004
         CLC
         ADC   $03
         LDX   $05
         BCC   L07DE86
         INX
L07DE86  STA   $2B
         STX   $2D
         LDY   #$0006
         LDA   [$03],Y
         PHA
         DEY
         DEY
         LDA   [$03],Y
         PHA
         LDA   $19
         JSL   L150488
         JSL   L150F53
         PHX
         PHA
         LDA   $1B
         JSL   L150488
         JSL   L1512A5
         STA   [$2B]
         TXA
         LDY   #$0002
         STA   [$2B],Y
L07DEB3  LDY   #$0002
         LDA   [$34],Y
         PHA
         LDA   [$34]
         PHA
         PEI   $25
         PEI   $23
         LDA   $19
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDA   #$0001
         STA   $3C
         BRA   L07DEF0
L07DED3  PEI   $25
         PEI   $23
         LDA   $1B
         JSL   L150488
         JSL   L150F53
         STA   $23
         STX   $25
         LDA   $1D
         CMP   $01
         BEQ   L07DEF0
         INC   $1D
         BRL   L07DDEB
L07DEF0  PEI   $3A
         PEI   $38
         PEA   $0001
         JSL   L074E4D
L07DEFB  LDA   $32
         STA   $3A
         LDA   $31
         STA   $39
         LDA   $2F
         TCD
         TSC
         CLC
         ADC   #$0038
         TCS
         RTL

L07DF0D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         STZ   $1C
         STZ   $1E
         LDY   #$0002
         LDA   [$18],Y
         TAX
         LDA   [$18]
         STA   $0B
         STX   $0D
         LDY   #$0006
         LDA   [$0B],Y
         TAX
         DEY
         DEY
         LDA   [$0B],Y
         CMP   #$4D42
         BNE   L07DF37
         CPX   #$5041
L07DF37  BNE   L07DF68
         LDA   $0B
         LDX   $0D
         STA   $01
         STX   $03
         LDY   #$0036
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CLC
         ADC   #$003C
         BCC   L07DF52
         INX
L07DF52  PHX
         PHA
         LDY   #$003A
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L150F53
         STA   $1C
         STX   $1E
         BRA   L07DFAA
L07DF68  PHY
         PHY
         PEI   $1A
         PEI   $18
         PEA   $0004
         JSL   L07963D
         PLA
         STA   $07
         PLX
         STX   $09
         PEI   $09
         PEI   $07
         LDA   [$07]
         JSL   L150488
         JSL   L150F53
         STA   $07
         STX   $09
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L071AB8
         PEI   $09
         PEI   $07
         LDA   $0B
         LDX   $0D
         JSL   L1512A5
         STA   $1C
         STX   $1E
L07DFAA  LDA   $16
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

L07DFBC  PHD
         TSC
         CLC
         ADC   #$FFDC
         TCS
         TCD
         STZ   $3C
         LDA   $36
         BEQ   L07DFCC
         BPL   L07DFCF
L07DFCC  BRL   L07E15F
L07DFCF  PHY
         PHY
         PEI   $3A
         PEI   $38
         JSL   L077A5B
         PLA
         STA   $1D
         PLX
         STX   $1F
         LDA   $1D
         ORA   $1F
         BNE   L07DFE8
         BRL   L07E15F
L07DFE8  PHY
         PHY
         PEI   $1F
         PEI   $1D
         PEA   $0000
         JSL   L07963D
         PLA
         STA   $19
         PLX
         STX   $1B
         LDA   $19
         ORA   $1B
         BNE   L07E004
         BRL   L07E154
L07E004  PHY
         PEI   $1F
         PEI   $1D
         JSL   L0718FA
         PLA
         STA   $03
         LDA   $19
         LDX   $1B
         SEC
         SBC   #$000E
         BCS   L07E01B
         DEX
L07E01B  STA   $15
         STX   $17
         LDA   [$15]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L07E02E
         EOR   #$8000
L07E02E  BMI   L07E033
         BRL   L07E14A
L07E033  LDA   #$0001
         STA   $13
L07E038  LDA   [$19]
         STA   $11
         LDY   #$0002
         LDA   $36
         CMP   [$19],Y
         BEQ   L07E048
         BRL   L07E12D
L07E048  LDA   $2A
         LDX   $2C
         STA   $21
         STX   $23
         PHY
         PHY
         LDA   $11
         JSL   L150488
         PHX
         PHA
         LDA   L055019
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   [$21]
         PLA
         LDY   #$0002
         STA   [$21],Y
         LDAL  L05565D
         BEQ   L07E07D
         BRL   L07E12B
L07E07D  PEI   $34
         PEI   $32
         PEI   $1B
         PEI   $19
         PEA   $002A
         JSL   L0313BE
         LDA   $19
         LDX   $1B
         CLC
         ADC   #$002A
         BCC   L07E097
         INX
L07E097  STA   $0D
         STX   $0F
         PEI   $0F
         PEI   $0D
         PEI   $30
         PEI   $2E
         JSL   L071FF8
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L071AB8
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L071AB8
         PEI   $0F
         PEI   $0D
         LDA   [$0D]
         JSL   L150488
         JSL   L150F53
         STA   $0D
         STX   $0F
         PHY
         PHY
         PEI   $0F
         PEI   $0D
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L07E0E3
         INX
L07E0E3  STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$2A],Y
         TAX
         LDA   [$2A]
         STA   $21
         STX   $23
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         STA   $09
         STX   $0B
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L070669
         PEI   $07
         PEI   $05
         LDY   #$0002
         LDA   [$2A],Y
         PHA
         LDA   [$2A]
         PHA
         JSL   L1512FB
         LDA   #$0001
         STA   $3C
L07E12B  BRA   L07E14A
L07E12D  PEI   $1B
         PEI   $19
         LDA   $11
         JSL   L150488
         JSL   L150F53
         STA   $19
         STX   $1B
         LDA   $13
         CMP   $01
         BEQ   L07E14A
         INC   $13
         BRL   L07E038
L07E14A  PEI   $1F
         PEI   $1D
         PEI   $03
         JSL   L0718DA
L07E154  PEI   $3A
         PEI   $38
         PEA   $0000
         JSL   L074E4D
L07E15F  LDA   $28
         STA   $3A
         LDA   $27
         STA   $39
         LDA   $25
         TCD
         TSC
         CLC
         ADC   #$0038
         TCS
         RTL

L07E171  ENT
         PHD
         TSC
         CLC
         ADC   #$FEBA
         TCS
         ADC   #$0059
         TCD
         PHY
         PEI   $FA
         PEI   $F8
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA9
         PHA
         JSL   L07A852
         PLA
         LSR
         BCS   L07E199
         PEA   $1DD6
         JSL   L07272E
L07E199  PEI   $F6
         PEI   $F4
         LDX   #$FFBD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         JSL   L033477
         BEQ   L07E1B6
         BVS   L07E1B1
         EOR   #$8000
L07E1B1  BPL   L07E1B6
         BRL   L07E39E
L07E1B6  PHY
         PEI   $FA
         PEI   $F8
         PEI   $F6
         PEI   $F4
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         JSL   L07A4B1
         PLA
         LSR
         BCS   L07E1D7
         PEA   $1DD7
         JSL   L07272E
L07E1D7  PHY
         PHY
         PEI   $57
         PEI   $55
         JSL   L0772AE
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDA   $E5
         ORA   $E7
         BNE   L07E1F0
         BRL   L07E39E
L07E1F0  LDA   #$0002
         LDX   #$0059
         AND   $00,X
         BEQ   L07E1FD
         LDA   #$0001
L07E1FD  PHA
         LDA   #$0001
         LDX   #$0000
         CMP   $F4
         BNE   L07E20A
         CPX   $F6
L07E20A  BEQ   L07E211
         LDA   #$0000
         BRA   L07E214
L07E211  LDA   #$0001
L07E214  ORA   $01,S
         PLX
         STA   $D9
         TDC
         CLC
         ADC   #$0059
         PEA   $0000
         PHA
         LDX   #$FFC5
         LDA   $00,X
         ASL
         JSL   L150488
         PHX
         PHA
         JSL   L071ECE
         LDA   $F2
         BEQ   L07E295
         LDA   #$0001
         STA   $D9
         PHY
         PEI   $FA
         PEI   $F8
         LDX   $F6
         LDA   $F4
         BNE   L07E247
         DEX
L07E247  DEC
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         JSL   L07A4B1
         PLA
         LSR
         BCC   L07E295
         LDY   #$0002
         LDA   [$E5],Y
         TAX
         LDA   [$E5]
         CLC
         ADC   #$0020
         BCC   L07E26A
         INX
L07E26A  STA   $E9
         STX   $EB
         PHY
         PHY
         LDX   #$FFD1
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L0745B2
         PLA
         PLX
         CMP   [$E9]
         BNE   L07E289
         LDY   #$0002
         TXA
         CMP   [$E9],Y
L07E289  BNE   L07E290
         LDA   #$0000
         BRA   L07E293
L07E290  LDA   #$0001
L07E293  STA   $D9
L07E295  LDA   $D9
         BEQ   L07E2A6
         LDA   #$0002
         LDX   #$0059
         ORA   $00,X
         LDX   #$0059
         STA   $00,X
L07E2A6  PHY
         PHY
         PEI   $E7
         PEI   $E5
         PEA   $0001
         JSL   L07963D
         PLA
         STA   $E1
         PLX
         STX   $E3
         PHY
         PHY
         PEI   $E7
         PEI   $E5
         PEA   $0003
         JSL   L07963D
         PLA
         STA   $DD
         PLX
         STX   $DF
         LDA   #$00FF
         AND   [$DD]
         BEQ   L07E2FD
         LDA   #$0001
         LDX   #$0059
         ORA   $00,X
         LDX   #$0059
         STA   $00,X
         PEI   $DF
         PEI   $DD
         TDC
         CLC
         ADC   #$0059
         PEA   $0000
         PHA
         LDX   #$FFC7
         LDA   $00,X
         PHA
         LDX   #$FFC5
         LDA   $00,X
         PHA
         JSL   L078D85
L07E2FD  LDY   #$0002
         LDA   [$E5],Y
         TAX
         LDA   [$E5]
         CLC
         ADC   #$002C
         BCC   L07E30C
         INX
L07E30C  STA   $E9
         STX   $EB
         LDA   [$E9]
         LDX   #$FFA7
         STA   $00,X
         LDX   #$FFA7
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L07E325
         EOR   #$8000
L07E325  BPL   L07E372
         LDA   #$0001
         STA   $DB
L07E32C  LDA   $E1
         LDX   $E3
         CLC
         ADC   #$0002
         BCC   L07E337
         INX
L07E337  STA   $E1
         STX   $E3
         PEI   $E3
         PEI   $E1
         TDC
         CLC
         ADC   #$0059
         PEA   $0000
         PHA
         LDX   #$FFC7
         LDA   $00,X
         PHA
         LDX   #$FFC5
         LDA   $00,X
         PHA
         JSL   L078D85
         TDC
         CLC
         ADC   #$00E1
         PEA   $0000
         PHA
         JSL   L071AB8
         LDA   $DB
         LDX   #$FFA7
         CMP   $00,X
         BEQ   L07E372
         INC   $DB
         BRA   L07E32C
L07E372  PEI   $57
         PEI   $55
         PEA   $0000
         JSL   L074A90
         PHY
         PEI   $FA
         PEI   $F8
         PEI   $F6
         PEI   $F4
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         JSL   L07CC1F
         PLA
         LSR
         BCS   L07E39E
         PEA   $1DD8
         JSL   L07272E
L07E39E  LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$0152
         TCS
         RTL

L07E3B0  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         STZ   $14
         LDA   L055063
         BEQ   L07E41A
         LDY   #$0049
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         LDY   #$0025
         LDA   [$10],Y
         TAX
         DEY
         DEY
         LDA   [$10],Y
         JSL   L1512A5
         STA   $05
         LDX   #$0000
         LDA   $05
         BNE   L07E3E2
         INX
L07E3E2  TXA
         BNE   L07E3FE
         PHA
         PHY
         LDY   #$0025
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         LDA   $05
         DEC
         PHA
         JSL   L0790EC
         PLA
         ORA   $01,S
         PLX
L07E3FE  CMP   #$0000
         BNE   L07E41A
         PHY
         LDY   #$0025
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         PEI   $05
         JSL   L0790EC
         PLA
         BNE   L07E41A
         BRA   L07E486
L07E41A  LDA   L055061
         BEQ   L07E481
         LDY   #$0049
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         PHY
         PHY
         LDY   #$004D
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         JSL   L071C98
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         LDY   #$0025
         LDA   [$10],Y
         TAX
         DEY
         DEY
         LDA   [$10],Y
         JSL   L1512A5
         STA   $05
         PHY
         LDY   #$0025
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         PEI   $05
         JSL   L0790EC
         PLA
         BNE   L07E481
         PHY
         LDY   #$0025
         LDA   [$10],Y
         PHA
         DEY
         DEY
         LDA   [$10],Y
         PHA
         LDA   $05
         DEC
         PHA
         JSL   L0790EC
         PLA
         BNE   L07E481
         BRA   L07E486
L07E481  LDA   #$0001
         STA   $14
L07E486  LDA   $0E
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

L07E498  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$0051
         LDA   [$0A],Y
         LDY   #$0033
         STA   [$0A],Y
         LDA   $0E
         LDX   $10
         LDY   #$002F
         STA   [$0A],Y
         INY
         INY
         TXA
         STA   [$0A],Y
         LDA   #$002B
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L07E4C3
         INX
L07E4C3  STA   $01
         STX   $03
         LDY   #$0049
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         LDY   #$0025
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         JSL   L1512A5
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
         LDA   #$0035
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L07E4F3
         INX
L07E4F3  STA   $01
         STX   $03
         PHY
         PHY
         LDY   #$004D
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L071C98
         PLA
         STA   [$01]
         PLA
         LDY   #$0002
         STA   [$01],Y
         LDX   #$0000
         LDA   L055065
         DEC
         BEQ   L07E51B
         INX
L07E51B  PHX
         LDX   #$0000
         LDA   #$0003
         CMP   L055065
         BEQ   L07E528
         INX
L07E528  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L07E563
L07E52F  PHY
         LDY   #$0049
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         LDY   #$0035
         LDA   [$0A],Y
         PHA
         JSL   L0790EC
         PLA
         LSR
         BCS   L07E563
         LDY   #$0037
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         INC
         BNE   L07E557
         INX
L07E557  LDY   #$0035
         STA   [$0A],Y
         INY
         INY
         TXA
         STA   [$0A],Y
         BRA   L07E52F
L07E563  LDA   #$0027
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L07E56E
         INX
L07E56E  STA   $01
         STX   $03
         LDY   #$002D
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         LDY   #$0037
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         JSL   L150F53
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
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

L07E5A5  ENT
         PHD
         TSC
         CLC
         ADC   #$FFAA
         TCS
         TCD
         JSL   L072328
         LDA   L055087
         LDX   L055089
         INC
         BNE   L07E5BB
         INX
L07E5BB  STA   L055087
         STX   L055089
         PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L07E5E7
         STZ   L055073
         STZ   L05506F
         STZ   L055071
         STZ   L05506B
         STZ   L05506D
         STZ   L055067
         STZ   L055069
         LDA   #$0001
         STA   $60
         BRL   L07EA8E
L07E5E7  STZ   $60
         LDY   #$0002
         LDA   [$5C],Y
         TAX
         LDA   [$5C]
         STA   $1F
         STX   $21
         PHY
         PHY
         PEI   $21
         PEI   $1F
         JSL   L0772AE
         PLA
         STA   $1B
         PLX
         STX   $1D
         LDA   $1B
         ORA   $1D
         BNE   L07E60E
         BRL   L07EA8E
L07E60E  LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         CLC
         ADC   #$0010
         BCC   L07E61D
         INX
L07E61D  STA   $53
         STX   $55
         LDA   #$0800
         AND   [$53]
         BEQ   L07E62B
         BRL   L07EA83
L07E62B  LDA   L055079
         STA   $0B
         LDA   #$0001
         SEC
         SBC   $0B
         BEQ   L07E63F
         BVS   L07E63D
         EOR   #$8000
L07E63D  BMI   L07E69D
L07E63F  LDA   $0B
         STA   $4F
L07E643  LDA   $4F
         DEC
         ASL
         ASL
         TAX
         LDAL  L05386B,X
         PHA
         LDAL  L053869,X
         PLX
         STA   $4B
         STX   $4D
         PHY
         PHY
         PEI   $1D
         PEI   $1B
         PEA   $0001
         JSL   L07963D
         PLA
         STA   $47
         PLX
         STX   $49
         PHY
         PEI   $4D
         PEI   $4B
         PEI   $49
         PEI   $47
         LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         CLC
         ADC   #$002C
         BCC   L07E682
         INX
L07E682  STA   $53
         STX   $55
         LDA   [$53]
         PHA
         JSL   L0793D9
         PLA
         LSR
         BCS   L07E694
         BRL   L07EA83
L07E694  LDA   $4F
         DEC
         BEQ   L07E69D
         DEC   $4F
         BRA   L07E643
L07E69D  LDY   #$0002
         LDA   [$1B],Y
         TAX
         LDA   [$1B]
         CLC
         ADC   #$0020
         BCC   L07E6AC
         INX
L07E6AC  STA   $53
         STX   $55
         LDY   #$0002
         LDA   [$53],Y
         TAX
         LDA   [$53]
         STA   $17
         STX   $19
         PHY
         PHY
         PEI   $19
         PEI   $17
         JSL   L07721A
         PLA
         STA   $13
         PLX
         STX   $15
         LDA   $13
         ORA   $15
         BNE   L07E6D5
         BRL   L07EA83
L07E6D5  LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         CLC
         ADC   #$0010
         BCC   L07E6E4
         INX
L07E6E4  STA   $53
         STX   $55
         LDA   #$0800
         AND   [$53]
         BEQ   L07E6F2
         BRL   L07EA78
L07E6F2  PHY
         PEI   $19
         PEI   $17
         PEA   $0002
         JSL   L07977D
         PLA
         STA   $45
         PHY
         PEI   $21
         PEI   $1F
         PEA   $0002
         JSL   L07977D
         PLA
         STA   $43
         LDA   L05505D
         LDX   L05505F
         CMP   $1F
         BNE   L07E71C
         CPX   $21
L07E71C  BEQ   L07E733
         LDAL  L0538C7
         BNE   L07E727
         STZ   L055073
L07E727  STZ   L05506F
         STZ   L055071
         STZ   L05506B
         STZ   L05506D
L07E733  LDA   #$0001
         STA   $41
         LDA   $45
         STA   $3F
         LDA   #$0001
         STA   $3D
         LDA   $43
         STA   $3B
         LDAL  L0538C7
         BNE   L07E74E
         BRL   L07E7E5
L07E74E  LDAL  L0538C7
         DEC
         DEC
         BEQ   L07E7B7
         LDA   $17
         LDX   $19
         CMP   L05507B
         BNE   L07E762
         CPX   L05507D
L07E762  BEQ   L07E7B7
         LDA   #$0003
         CMPL  L0538C7
         BNE   L07E784
         PHY
         PEI   $19
         PEI   $17
         LDAL  L0538C9
         PHA
         PEA   $0000
         JSL   L07AD84
         PLA
         STA   L055073
         BRA   L07E7AD
L07E784  LDAL  L0538C7
         DEC
         BNE   L07E7AD
         PHY
         PEI   $19
         PEI   $17
         PHY
         PEI   $19
         PEI   $17
         PEA   $0002
         PEA   ^L0538C9
         PEA   L0538C9
         JSL   L07BF8F
         PEA   $0000
         JSL   L07AD84
         PLA
         STA   L055073
L07E7AD  LDA   $17
         LDX   $19
         STA   L05507B
         STX   L05507D
L07E7B7  LDA   L055073
         STA   $41
         LDA   $41
         SEC
         SBC   $45
         BEQ   L07E7CD
         BVS   L07E7C8
         EOR   #$8000
L07E7C8  BPL   L07E7CD
         BRL   L07EA78
L07E7CD  LDA   $41
         BPL   L07E7D4
         BRL   L07EA78
L07E7D4  BNE   L07E7D9
         BRL   L07EA78
L07E7D9  LDA   L055073
         STA   $3F
         STZ   $3D
         LDA   #$FFFF
         STA   $3B
L07E7E5  LDA   L055073
         SEC
         SBC   #$0000
         BMI   L07E811
         BEQ   L07E811
         LDA   $1F
         LDX   $21
         CMP   L05506F
         BNE   L07E7FC
         CPX   L055071
L07E7FC  BNE   L07E80C
         STZ   $41
         LDA   #$FFFF
         STA   $3F
         LDA   L055073
         STA   $3D
         BRA   L07E811
L07E80C  LDA   L055073
         STA   $41
L07E811  LDA   L055079
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L07E821
         EOR   #$8000
L07E821  BMI   L07E826
         BRL   L07EA50
L07E826  LDA   #$0001
         STA   $4F
L07E82B  LDA   $4F
         DEC
         ASL
         ASL
         TAX
         LDAL  L05386B,X
         PHA
         LDAL  L053869,X
         PLX
         STA   $4B
         STX   $4D
         LDA   $41
         STA   $09
         LDA   $3F
         STA   $07
         LDA   $07
         SEC
         SBC   $09
         BVS   L07E851
         EOR   #$8000
L07E851  BMI   L07E856
         BRL   L07E947
L07E856  LDA   $09
         STA   $51
L07E85A  PHY
         PEI   $19
         PEI   $17
         PEI   $51
         PEA   $0002
         JSL   L07AC17
         PLA
         STA   $39
         PHY
         PHY
         PEI   $15
         PEI   $13
         PEI   $39
         JSL   L0791A7
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDA   $0D
         ORA   $0F
         BNE   L07E886
         BRL   L07EA78
L07E886  LDX   #$0000
         LDY   #$0004
         LDA   #$4000
         AND   [$0D],Y
         CMP   #$0000
         BEQ   L07E897
         INX
L07E897  TXA
         BEQ   L07E89D
         BRL   L07E93C
L07E89D  LDX   #$0000
         LDY   #$000E
         LDA   #$0800
         AND   [$0D],Y
         CMP   #$0000
         BEQ   L07E8AE
         INX
L07E8AE  TXA
         BEQ   L07E8B4
         BRL   L07E93C
L07E8B4  PHY
         PHY
         PEI   $15
         PEI   $13
         PEI   $1D
         PEI   $1B
         PEI   $39
         PEA   $0000
         JSL   L07B038
         PLA
         STA   $23
         PLX
         STX   $25
         LDA   $23
         ORA   $25
         BEQ   L07E93C
         LDA   $23
         LDX   $25
         STA   $47
         STX   $49
         LDA   $41
         CMP   $51
         BNE   L07E8F3
         PEI   $49
         PEI   $47
         LDA   L05506B
         LDX   L05506D
         JSL   L150F53
         STA   $47
         STX   $49
L07E8F3  PHY
         PHY
         PEI   $4D
         PEI   $4B
         PEI   $49
         PEI   $47
         JSL   L071CE4
         PLA
         STA   $47
         PLX
         STX   $49
         LDA   $47
         ORA   $49
         BEQ   L07E93C
         PHY
         PEA   $0000
         PHD
         JSL   L07E3B0
         PLA
         LSR
         BCS   L07E928
         LDA   $47
         LDX   $49
         INC
         BNE   L07E922
         INX
L07E922  STA   $47
         STX   $49
         BRA   L07E8F3
L07E928  LDA   $4F
         DEC
         BNE   L07E939
         PEI   $19
         PEI   $17
         PEA   $0000
         PHD
         JSL   L07E498
L07E939  BRL   L07EA45
L07E93C  LDA   $51
         CMP   $07
         BEQ   L07E947
         INC   $51
         BRL   L07E85A
L07E947  LDA   $3D
         STA   $05
         LDA   $3B
         STA   $03
         LDA   $03
         SEC
         SBC   $05
         BVS   L07E959
         EOR   #$8000
L07E959  BMI   L07E95E
         BRL   L07EA43
L07E95E  LDA   $05
         STA   $51
L07E962  PHY
         PEI   $21
         PEI   $1F
         PEI   $51
         PEA   $0002
         JSL   L07AC17
         PLA
         STA   $39
         PHY
         PHY
         PEI   $1D
         PEI   $1B
         PEI   $39
         JSL   L0791A7
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDA   $0D
         ORA   $0F
         BNE   L07E98E
         BRL   L07EA78
L07E98E  LDY   #$000E
         LDA   #$0800
         AND   [$0D],Y
         CMP   #$0000
         BEQ   L07E99E
         BRL   L07EA38
L07E99E  PHY
         PHY
         PEI   $15
         PEI   $13
         PEI   $1D
         PEI   $1B
         LDA   $39
         EOR   #$FFFF
         INC
         PHA
         PEA   $0000
         JSL   L07B038
         PLA
         STA   $23
         PLX
         STX   $25
         LDA   $23
         ORA   $25
         BEQ   L07EA38
         LDA   $23
         LDX   $25
         STA   $47
         STX   $49
         LDA   $3D
         CMP   $51
         BNE   L07E9F0
         LDA   $1F
         LDX   $21
         CMP   L05506F
         BNE   L07E9DC
         CPX   L055071
L07E9DC  BNE   L07E9F0
         PEI   $49
         PEI   $47
         LDA   L05506B
         LDX   L05506D
         JSL   L150F53
         STA   $47
         STX   $49
L07E9F0  PHY
         PHY
         PEI   $4D
         PEI   $4B
         PEI   $49
         PEI   $47
         JSL   L071CE4
         PLA
         STA   $47
         PLX
         STX   $49
         LDA   $47
         ORA   $49
         BEQ   L07EA38
         PHY
         PEA   $0000
         PHD
         JSL   L07E3B0
         PLA
         LSR
         BCS   L07EA25
         LDA   $47
         LDX   $49
         INC
         BNE   L07EA1F
         INX
L07EA1F  STA   $47
         STX   $49
         BRA   L07E9F0
L07EA25  LDA   $4F
         DEC
         BNE   L07EA36
         PEI   $21
         PEI   $1F
         PEA   $0000
         PHD
         JSL   L07E498
L07EA36  BRA   L07EA45
L07EA38  LDA   $51
         CMP   $03
         BEQ   L07EA43
         INC   $51
         BRL   L07E962
L07EA43  BRA   L07EA78
L07EA45  LDA   $4F
         CMP   $01
         BEQ   L07EA50
         INC   $4F
         BRL   L07E82B
L07EA50  LDA   #$0001
         STA   $60
         LDA   $33
         STA   L055073
         LDA   $2F
         LDX   $31
         STA   L05506F
         STX   L055071
         LDA   $2B
         LDX   $2D
         STA   L05506B
         STX   L05506D
         LDA   $27
         LDX   $29
         STA   L055067
         STX   L055069
L07EA78  PEI   $19
         PEI   $17
         PEA   $0000
         JSL   L074A24
L07EA83  PEI   $21
         PEI   $1F
         PEA   $0000
         JSL   L074A90
L07EA8E  LDA   $5A
         STA   $5E
         LDA   $59
         STA   $5D
         LDA   $57
         TCD
         TSC
         CLC
         ADC   #$005C
         TCS
         RTL


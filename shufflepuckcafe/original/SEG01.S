*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg01.L
         lst   off

*-----------

         use   Seg01.E
         use   Seg01.X

*-----------

         use   4/Ctl.Macs
         use   4/Dialog.Macs
         use   4/Event.Macs
         use   4/Line.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/Misc.Macs
         use   4/QD.Macs
         use   4/Sound.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*-----------

         BRA   L010005
         NOP
         NOP
         NOP
L010005  STAL  L0201E5
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F0
         TCS
         SEP   #$20
         LDA   #^L02000A
         PHA
         PLB
         REP   #$20
         LDX   #$0000
         LDA   #$C036
         STA   $F6
         STX   $F8
         LDA   [$F6]
         AND   #$00FF
         AND   #$0080
         SEP   #$20
         STA   L02000C
         REP   #$20
         LDX   #$0000
         LDA   #$C036
         STA   $F6
         STX   $F8
         LDA   [$F6]
         AND   #$00FF
         ORA   #$0080
         SEP   #$20
         STA   [$F6]
         REP   #$20
         PHX
         PHA
         PEA   $0000
         PEA   $1500
         LDA   L0201E5
         PHA
         PEA   $C011
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L01006E
         LDA   #$0000
L01006E  STAL  L0201E7
         PLA
         PLX
         STX   $F4
         STA   $F2
         LDX   $F4
         LDA   $F2
         STX   $F6
         ORA   $F6
         BNE   L010085
         BRL   L0101E1
L010085  LDY   #$0002
         LDA   [$F2],Y
         TAX
         LDA   [$F2]
         STX   L020008
         STA   L020006
         LDA   L020006
         CLC
         ADC   #$1500
         TCS
         _TLStartUp
         BCS   L0100A7
         LDA   #$0000
L0100A7  STAL  L0201E7
         PHA
         _MMStartUp
         BCS   L0100B8
         LDA   #$0000
L0100B8  STAL  L0201E7
         PLA
         STA   L0201E3
         _MTStartUp
         BCS   L0100CC
         LDA   #$0000
L0100CC  STAL  L0201E7
         PEA   ^L03340F
         PEA   L03340F
         _LoadTools
         BCS   L0100E2
         LDA   #$0000
L0100E2  STAL  L0201E7
         LDX   L020008
         LDA   L020006
         CLC
         ADC   #$0300
         PHA
         TXA
         ADC   #$0000
         TAX
         PEA   $0001
         PEA   $0000
         PEA   $013F
         PEA   $0000
         PEA   $00C7
         LDA   L0201E3
         PHA
         _EMStartUp
         BCS   L010115
         LDA   #$0000
L010115  STAL  L0201E7
         LDX   L020008
         LDA   L020006
         CLC
         ADC   #$0400
         PHA
         TXA
         ADC   #$0000
         TAX
         _SoundStartUp
         BCS   L010135
         LDA   #$0000
L010135  STAL  L0201E7
         LDX   L020008
         LDA   L020006
         PHA
         PEA   $0000
         PEA   $00A0
         LDA   L0201E3
         PHA
         _QDStartUp
         BCS   L010156
         LDA   #$0000
L010156  STAL  L0201E7
         LDX   #$0000
         LDA   #$C034
         STA   $F6
         STX   $F8
         LDA   #$0000
         SEP   #$20
         STA   [$F6]
         REP   #$20
         LDA   L0201E3
         PHA
         _WindStartUp
         BCS   L01017D
         LDA   #$0000
L01017D  STAL  L0201E7
         LDA   L0201E3
         PHA
         LDX   L020008
         LDA   L020006
         CLC
         ADC   #$0600
         PHA
         TXA
         ADC   #$0000
         TAX
         _CtlStartUp
         BCS   L0101A1
         LDA   #$0000
L0101A1  STAL  L0201E7
         LDA   L0201E3
         PHA
         LDX   L020008
         LDA   L020006
         CLC
         ADC   #$0700
         PHA
         TXA
         ADC   #$0000
         TAX
         _LEStartUp
         BCS   L0101C5
         LDA   #$0000
L0101C5  STAL  L0201E7
         LDA   L0201E3
         PHA
         _DialogStartUp
         BCS   L0101D9
         LDA   #$0000
L0101D9  STAL  L0201E7
         JSL   L1A00D4
L0101E1  LDA   L02000C
         AND   #$00FF
         PHA
         LDX   #$0000
         LDA   #$C036
         STA   $F6
         STX   $F8
         LDA   [$F6]
         AND   #$00FF
         AND   #$007F
         PLX
         STX   $FA
         ORA   $FA
         PHA
         LDX   #$0000
         LDA   #$C036
         STA   $F6
         STX   $F8
         PLA
         SEP   #$20
         STA   [$F6]
         REP   #$20
         JSL   L010254
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L01021D  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L0201E3
         PHA
         LDX   L020008
         LDA   L020006
         CLC
         ADC   #$0500
         PHA
         TXA
         ADC   #$0000
         TAX
         _MenuStartUp
         BCS   L010248
         LDA   #$0000
L010248  STAL  L0201E7
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L010254  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         _GrafOff
         BCS   L01026B
         LDA   #$0000
L01026B  STAL  L0201E7
         _DialogShutDown
         BCS   L01027B
         LDA   #$0000
L01027B  STAL  L0201E7
         _LEShutDown
         BCS   L01028B
         LDA   #$0000
L01028B  STAL  L0201E7
         _CtlShutDown
         BCS   L01029B
         LDA   #$0000
L01029B  STAL  L0201E7
         _MenuShutDown
         BCS   L0102AB
         LDA   #$0000
L0102AB  STAL  L0201E7
         _WindShutDown
         BCS   L0102BB
         LDA   #$0000
L0102BB  STAL  L0201E7
         _SoundShutDown
         BCS   L0102CB
         LDA   #$0000
L0102CB  STAL  L0201E7
         _EMShutDown
         BCS   L0102DB
         LDA   #$0000
L0102DB  STAL  L0201E7
         _QDShutDown
         BCS   L0102EB
         LDA   #$0000
L0102EB  STAL  L0201E7
         _MTShutDown
         BCS   L0102FB
         LDA   #$0000
L0102FB  STAL  L0201E7
         LDA   L0201E3
         PHA
         _MMShutDown
         BCS   L01030F
         LDA   #$0000
L01030F  STAL  L0201E7
         _TLShutDown
         BCS   L01031F
         LDA   #$0000
L01031F  STAL  L0201E7
         JSL   GSOS
         DW    $0029      ; Quit
         ADRL  L030008
         BRK   $00
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL
